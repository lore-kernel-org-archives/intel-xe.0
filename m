Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B028DC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8291510E65F;
	Fri,  5 May 2023 18:55:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C3010E65F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:55:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72B7A60B47;
 Fri,  5 May 2023 18:55:19 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 8A3F0C433D2;
 Fri,  5 May 2023 18:55:17 +0000 (UTC)
Date: Fri, 5 May 2023 14:55:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVRExwzbhsqTvVm@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-13-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-13-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 12/31] drm/xe/guc: Print doorbell ID in
 GuC engine debugfs entry
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 05:17:08PM -0700, Matthew Brost wrote:
> This information is helpful so print it.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1b6f36b04cd1..880f480c6d5f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2016,6 +2016,8 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
>  	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
>  	drm_printf(p, "\tPreempt timeout: %u (us)\n",
>  		   e->sched_props.preempt_timeout_us);
> +	drm_printf(p, "\tDoorbell ID: %u\n",
> +		   e->guc->doorbell_id);
>  	for (i = 0; i < e->width; ++i ) {
>  		struct xe_lrc *lrc = e->lrc + i;
>  
> -- 
> 2.34.1
> 
