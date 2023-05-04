Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE00C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 16:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB1910E170;
	Thu,  4 May 2023 16:10:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E383210E170
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 16:10:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E6F463557;
 Thu,  4 May 2023 16:10:26 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 50191C433D2;
 Thu,  4 May 2023 16:10:24 +0000 (UTC)
Date: Thu, 4 May 2023 12:10:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFPY7Ton16S3OFDY@rdvivi-mobl4>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504073250.1436293-2-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Do not mark 1809175790 as a WA
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

On Thu, May 04, 2023 at 12:32:44AM -0700, Lucas De Marchi wrote:
> Additional programming annotated with Wa_<number> should be reserved to
> those that have a official workaround. Just pointing to a bug or
> additional reference can be done with something else. Copy what i915
> does and refer to it as "hsdes: ....".
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5e61b6e61f3a..75838b8bb9a8 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -199,7 +199,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	bool decode = job->engine->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>  
>  	dw[i++] = preparser_disable(true);
> -	/* Wa_1809175790 */
> +
> +	/* hsdes: 1809175790 */
>  	if (!xe->info.has_flat_ccs) {
>  		if (decode)
>  			i = emit_aux_table_inv(gt, VD0_AUX_NV.reg, dw, i);
> @@ -244,9 +245,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>  	i = emit_pipe_invalidate(mask_flags, dw, i);
> -	/* Wa_1809175790 */
> +
> +	/* hsdes: 1809175790 */
>  	if (!xe->info.has_flat_ccs)
>  		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV.reg, dw, i);
> +
>  	dw[i++] = preparser_disable(false);
>  
>  	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -- 
> 2.40.1
> 
