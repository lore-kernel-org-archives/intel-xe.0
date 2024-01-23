Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109C6C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 19:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB62C10E7F0;
	Tue, 23 Jan 2024 19:19:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073F10E845
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 19:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706037549; x=1737573549;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XSciQTn+Pg3k+geo4jZAJ5StksoFn+bXmlqrC6vveC0=;
 b=J4XT7fP6E6PnuPibTu1U70h2190VhjcLLI4tAscFHmCOxJluNwqGOe7d
 5bj4s77sYCcOTeoaNasQ77NDdhB0Rj2IwPNRHrPqe3i48tcX1q+ghDHnX
 yyp1g1J3KrEpWehYas8iDwnY4JN2BrNau6qt+7qyRjDhKXBGeznlv9C1e
 l5RpRRTaf2dUKog73R0DtTWWag8Z1Z5CjB3ReeCJpNa7AlK6X2FNN31xp
 Kmq9R9wGBlWO5+SnKONJnH+dqlR8XgsFlRcvJOyC/E5J6dzsSSQ9G+4PU
 PBgLszCXRmj4QtdXcGWp3FwOt6kZNPDPL2XmJ5yadu60p0Br2adHtG5PN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15144126"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15144126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929429790"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929429790"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:19:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Prefer BIT/GENMASK macros over shifts
In-Reply-To: <20240123190201.1599333-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123190201.1599333-1-matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 21:19:02 +0200
Message-ID: <87y1cfluxl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> Using BIT/GENMASK macros is a better convention than using manual shift
> and will also fix build errors [1].

Somehow, that description doesn't match the patch!

>
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c    | 2 +-
>  drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index ee5d99456aeb..fc5cc2b2bcc5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u=
32 *msg, u32 len)
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
>  		if (type =3D=3D GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=3D0x%x, h=3D%u\n",
> +			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=3D0x%lx, h=3D%lu\n",
>  				  fence,
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_gu=
c_relay.c
> index c0a2d8d5d3b3..2d1f19270d9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay=
 *relay, struct relay_trans
>  		ret =3D -EPROTO;
>  	}
>  	if (unlikely(ret < 0)) {
> -		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
> +		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
>  			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
>  			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
>  			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);

--=20
Jani Nikula, Intel
