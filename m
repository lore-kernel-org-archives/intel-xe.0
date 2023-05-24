Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90DBC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 13:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAE010E075;
	Wed, 24 May 2023 13:24:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E710E075
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 13:24:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B6EE631FD;
 Wed, 24 May 2023 13:23:59 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id ED832C433D2;
 Wed, 24 May 2023 13:23:56 +0000 (UTC)
Date: Wed, 24 May 2023 09:23:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZG4P6V/6/cb3B4ln@rdvivi-mobl4>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 12:36:41PM +0530, Himal Prasad Ghimiray wrote:
> In case of gt reset failure, KMD notifies userspace about failure
> via uevent. To validate this notification we need to ensure gt
> reset fails and there is no mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
> 
> v1(Rodrigo)
> - Change the variable to fake_reset_failure_in_progress.
> - Drop usage of READ_ONCE and WRITE_ONCE.
> - Follow consistency for variable assignment. Either use
>   functions for all the assignments or don't use for any.

Thanks for addressing all of this. I believe we are much closer now.
A few more comments below, that I could only think now with this
new version.

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 80d42c7c7cfa..b3ac8b3ab455 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
>  	int err;
>  	int i;
>  
> +	/*Fake reset failure should be disabled by default*/

you are missing spaces around '*'... should be /* Comment */
                                                ^       ^

> +	gt->reset.fake_reset_failure_in_progress = false;
> +

but I also don't believe that you need this chunk at all
since reset struct should be zeroed on allocation.
probably need a double check to be sure.

>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> @@ -601,8 +604,18 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_gt_info(gt, "reset started\n");
>  
>  	xe_gt_sanitize(gt);
> -

probably good to keep this line

>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	err = gt->reset.fake_reset_failure_in_progress;

Atomic is really not needed because the gt_resets are serialized
but something like test_and_dec maybe could help to get a cleaner
code here. But really up to you.

> +	if (err) {
> +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> +
> +		/* Disable fake reset failure for next call */

we should never add obvious redundant comments. The line below is
enough for a code reader.

> +		gt->reset.fake_reset_failure_in_progress = false;
> +
> +		goto err_msg;
> +	}
> +
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 8bf441e850a0..13d2a974bc00 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int fake_reset_failure(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +
> +	gt->reset.fake_reset_failure_in_progress = true;

I don't like other components touching variables directly like this.
we should probably have a xe_fake_reset(gt) function in xe_gt.c
that does this set and call the reset async below.

> +	xe_gt_reset_async(gt);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"steering", steering, 0},
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
> +	{"fake_reset_failure", fake_reset_failure, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..746d65c4aacc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -168,6 +168,7 @@ struct xe_gt {
>  
>  	/** @reset: state for GT resets */
>  	struct {

	please add documentation here.
	/**
	* fake_reset_failure_in_progress: A bool to indicate a fake reset
	* failure has been triggered
	*/
	or something like that...
> +		bool fake_reset_failure_in_progress;
>  		/**
>  		 * @worker: work so GT resets can done async allowing to reset
>  		 * code to safely flush all code paths
> -- 
> 2.25.1
> 
