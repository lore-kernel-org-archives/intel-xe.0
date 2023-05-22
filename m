Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D1FC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 15:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9510E35F;
	Mon, 22 May 2023 15:51:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12810E35F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 15:51:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3D4D61A4E;
 Mon, 22 May 2023 15:51:04 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 09728C433EF;
 Mon, 22 May 2023 15:51:02 +0000 (UTC)
Date: Mon, 22 May 2023 11:51:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZGuPZP6Wxl52Trts@rdvivi-mobl4>
References: <20230522085817.1347213-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522085817.1347213-1-himal.prasad.ghimiray@intel.com>
Subject: Re: [Intel-xe] [RFC 1/1] drm/xe: Add a debugfs for faking gt reset
 failure.
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

On Mon, May 22, 2023 at 02:28:17PM +0530, Himal Prasad Ghimiray wrote:
> In case of gt reset failure, KMD notifies userspace about failure
> via uevent. To validate this notification we need to ensure gt
> reset fails and there is no mechanism to cause failure from hardware.
> Hence added a debugfs which will cause fake reset failure.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 26 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d98761d9eeba..e05615ca13e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -301,6 +301,9 @@ int xe_gt_init_early(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	/* Reset is supported by default */
> +	gt->reset_enabled = true;
> +

I'd prefer to name this variable as something more specific
fake_reset_failure_in_progress. In order to avoid future abuses
or misusage of it.

>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -605,6 +608,16 @@ static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
>  	kfree(reset_event[3]);
>  }
>  
> +static int reset_disabled(struct xe_gt *gt)
> +{
> +	return !READ_ONCE(gt->reset_enabled);
> +}
> +
> +static void enable_reset(struct xe_gt *gt)
> +{
> +	WRITE_ONCE(gt->reset_enabled, true);
> +}

Why are you using these write/read _once variants?
Do you need some mutex?

> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -617,8 +630,19 @@ static int gt_reset(struct xe_gt *gt)
>  	drm_info(&xe->drm, "GT reset started\n");
>  
>  	xe_gt_sanitize(gt);
> -
>  	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	err = reset_disabled(gt);
> +	if (err) {
> +		drm_info(&xe->drm, "GT reset is disabled\n");
> +
> +		/*Enable GT reset for next call if disabled
> +		 * for fake reset failure.
> +		 */
> +		enable_reset(gt);
> +		goto err_msg;
> +	}
> +
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c45486c2015a..1c3e673c8c60 100644
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
> +	WRITE_ONCE(gt->reset_enabled, false);

or you create functions for everything or you don't create
functions for any of them. But be consistent.

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
> index 7c47d67aa8be..7ec19ad0365d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -175,6 +175,9 @@ struct xe_gt {
>  		struct work_struct worker;
>  	} reset;
>  
> +	/** @reset_enabled: GT supports reset */
> +	bool reset_enabled;
> +
>  	/** @tlb_invalidation: TLB invalidation state */
>  	struct {
>  		/** @seqno: TLB invalidation seqno, protected by CT lock */
> -- 
> 2.25.1
> 
