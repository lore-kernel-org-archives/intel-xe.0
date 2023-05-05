Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8270C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0CA10E65F;
	Fri,  5 May 2023 18:50:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5437010E65B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:50:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE51760BCB;
 Fri,  5 May 2023 18:50:40 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id CD563C433EF;
 Fri,  5 May 2023 18:50:38 +0000 (UTC)
Date: Fri, 5 May 2023 14:50:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVP/J0cjFLodASn@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-10-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-10-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 09/31] drm/xe/guc: Read HXG fields from
 DW1 of G2H response
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

On Mon, May 01, 2023 at 05:17:05PM -0700, Matthew Brost wrote:
> The HXG fields are DW1 not DW0, fix this.

it took me a while to understand how the msg was constructed
to agree with this... I believe we should transform this into some
struct with embedded u32 with some proper names to make it clear
and avoid future mistakes like this.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I also believe this patch and any other like this should be resend
individually so we get the fixes already in place.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9055ff133a7c..6abf1dee95af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -782,13 +782,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
>  		g2h_fence->error =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
>  		g2h_fence->hint =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
>  	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>  		g2h_fence->retry = true;
>  		g2h_fence->reason =
> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
> +			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
>  	} else if (g2h_fence->response_buffer) {
>  		g2h_fence->response_len = response_len;
>  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
> -- 
> 2.34.1
> 
