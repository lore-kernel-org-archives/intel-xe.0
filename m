Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A9FC982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20AF10E532;
	Fri, 18 Sep 2026 00:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dKNopDmV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E2E10E532
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 00:08:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 436B6418DC;
 Fri, 18 Sep 2026 00:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A9A1F00893;
 Fri, 18 Sep 2026 00:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789690124;
 bh=W44A3T0MthqJz1Mpj0+jOOZZW6vsdPSA5lCOs4C1qBw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dKNopDmVWMY4Ifw3fUmAxe2icKPmHK85A7LVi45siB04JWLG4QEU82xPPrN0Jv7Fm
 VRoc9UQh1824qPii7XqLMXXA8Qz6MV/mEyhkoZEtSIxqGXPsJe4QZXUsFKx/PWROvY
 /9xyi7IDpdAAIU8uj3aJ6qRXBktvurxMLVUXOI6yQiBRDwEZ+2sTBtPssoVClOUThp
 5RWyTPD4GM7SS2b9+8xfcl5p9+ZUHH9rXRoeIKymxqp9ZRxSg+bGfb9RkFYxjP0tWv
 0NTiJKFcG0sZ6T8nJTWa0rdcRTXdWM01aL/PkdIu/TrYdsty99YahfqZ7jugyHU96m
 xWJIdaG7Ilftw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] drm/xe/guc: Report errors that cause a CT
 shutdown using SIGID
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917235923.1521112-16-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
 <20260917235923.1521112-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:08:43 +0000
Message-Id: <20260918000844.05A9A1F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] xe: missed xe_log_err conversion in guc crash handlers
- [Medium] xe: mismatched error codes returned in parse_g2h_msg and parse_g=
2h_response
--

commit 3134241c4666d211fb1d7e98e3ce95c50000c2e9
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: drm/xe/guc: Report errors that cause a CT shutdown using SIGID

This patch converts errors that result in a CT being declared dead to use
the xe_log_err helper, which supports SIGID reporting. Escalate-to-caller
errors remain unchanged so callers can apply SIGID if needed. Error
messages are also updated to be clearer about the failure.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 31ecddab30578..63d79987c5d28 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
[ ... ]
> @@ -1662,13 +1665,15 @@ static int parse_g2h_response(struct xe_guc_ct *c=
t, u32 *msg, u32 len)
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
>  		if (type =3D=3D GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=3D0x%x, h=3D%u\n",
> -				  fence,
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> +			xe_log_err(gt, GUC, -EINVAL,
> +				   "CT: FAST_REQ H2G fence 0x%x failed! e=3D0x%x, h=3D%u\n",
> +				   fence,
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>  		else
> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> -				  type, fence);
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "CT: unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> +				    type, fence);
> =20
>  		fast_req_report(ct, fence);
> =20
>  		/* FIXME: W/A race in the GuC, will get in firmware soon */
>  		if (xe_gt_recovery_pending(gt))
>  			return 0;
> =20
>  		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
> =20
>  		return -EPROTO;

[Severity: Medium]
Does this cause misleading double-logging when receive_g2h() processes the
return value?

Here in parse_g2h_response(), we log the specific -EINVAL error code, but
return -EPROTO to the caller. When the caller receive_g2h() receives this,
it will log the failure a second time as a generic -EPROTO error since the
error codes don't match.

>  	}
> =20
[ ... ]
> @@ -1744,7 +1749,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 =
*msg, u32 len)
> =20
>  	origin =3D FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin !=3D GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "Invalid G2H origin=3D%u\n", origin);
> +		xe_log_err(gt, GUC, -EBADMSG, "CT: Invalid G2H origin=3D%u\n", origin);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
> =20
>  		return -EPROTO;

[Severity: Medium]
Similar to the check in parse_g2h_response(), does logging -EBADMSG here
but returning -EPROTO result in contradictory double-logging in the caller?

>  	}
> =20
[ ... ]
> @@ -1862,8 +1867,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u3=
2 *msg, u32 len)
>  	}
> =20
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
> +		xe_log_err(gt, GUC, ret, "CT: G2H action %#04x failed len %u msg %*ph\=
n",
> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}

[Severity: Medium]
The commit message notes this converts any errors causing a CT shutdown to =
use
xe_log_err, but did it miss the GuC crash and exception handlers?

When a GuC crash or exception occurs, process_g2h_msg() calls
guc_handle_crash_dump_msg() and guc_handle_exception_msg(). Both of these
handlers call CT_DEAD directly and use the older xe_gt_err for logging:

guc_handle_crash_dump_msg()
    xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
    CT_DEAD(ct, NULL, CRASH);

Should these be converted to xe_log_err as well to ensure these GuC crashes
receive a SIGID? As it stands, they are untagged, while the fallback generic
PROCESS_FAILED error above does get a SIGID.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917235923.1521=
112-9-umesh.nerlige.ramappa@intel.com?part=3D7
