Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9824DC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7481B10E65F;
	Fri,  5 May 2023 18:52:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD0010E65F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:52:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E76963FC7;
 Fri,  5 May 2023 18:52:49 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 3421CC433D2;
 Fri,  5 May 2023 18:52:47 +0000 (UTC)
Date: Fri, 5 May 2023 14:52:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVQfRnwEAOFiosk@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-11-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-11-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 10/31] drm/xe/guc: Return the lower part
 of blocking H2G message
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

On Mon, May 01, 2023 at 05:17:06PM -0700, Matthew Brost wrote:
> The upper layers may need this data, an example of this is allocating
> DIST doorbell.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
>  drivers/gpu/drm/xe/xe_guc_pc.c | 6 ++++--
>  drivers/gpu/drm/xe/xe_huc.c    | 2 +-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6abf1dee95af..60b69fcfac9f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,6 +25,7 @@
>  struct g2h_fence {
>  	u32 *response_buffer;
>  	u32 seqno;
> +	u32 status;
>  	u16 response_len;
>  	u16 error;
>  	u16 hint;
> @@ -727,7 +728,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		ret = -EIO;
>  	}
>  
> -	return ret > 0 ? 0 : ret;
> +	return ret > 0 ? g2h_fence.status : ret;

The problem I see here is how the upper level could differentiate
between and error and a status.

should we convert the functions to have an &status argument passed in?

>  }
>  
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -793,6 +794,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		g2h_fence->response_len = response_len;
>  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
>  		       response_len * sizeof(u32));
> +	} else {
> +		g2h_fence->status =
> +			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
>  	}
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 72d460d5323b..3d2ea723a4a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -204,11 +204,13 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>  
>  	/* Blocking here to ensure the results are ready before reading them */
>  	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
> -	if (ret)
> +	if (ret < 0) {
>  		drm_err(&pc_to_xe(pc)->drm,
>  			"GuC PC query task state failed: %pe", ERR_PTR(ret));
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 55dcaab34ea4..9c48c3075410 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -39,7 +39,7 @@ int xe_huc_init(struct xe_huc *huc)
>  
>  	huc->fw.type = XE_UC_FW_TYPE_HUC;
>  	ret = xe_uc_fw_init(&huc->fw);
> -	if (ret)
> +	if (ret < 0)
>  		goto out;
>  
>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
> -- 
> 2.34.1
> 
