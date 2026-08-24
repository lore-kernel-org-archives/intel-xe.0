Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB92C5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 07:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3DD10E0D4;
	Mon, 24 Aug 2026 07:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EhxY2wqF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4FE10E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 07:27:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DC464344B;
 Mon, 24 Aug 2026 07:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DC21F00A3D;
 Mon, 24 Aug 2026 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787556466;
 bh=g60SIA8jK5pZgAv5nSFM+al0flW0+g2eR5Y1Q0Y5fXU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EhxY2wqFynjhHqa8t/40q/UN/3iaTmq15aR9Y3KlbQswuk/XsoX+JLGs8kh6qnHhR
 jbBnWT/wjRmtmUAdJFaqiHig+LT80JMaEh+W5fG8bu4ATP3hprsPbbYFQE+EUDSG1h
 woqkAjNGVMB2aT8VmasAcRB4A/aq5IgYixu3Rm1sjLdR8KHvWY3VFv98xRf0FmmGVw
 h8iI3wE+oWupIhzzcKVSObFmF1QJnTw/iCgbQ8f6xm6BVkihkyQDoyyUE3xQeon034
 JDmMovGo5Vt33Kj4kz2ouwUwLkhjFSMgOmmGpbg3OVGCsz2vSZryG9JL4O9/4fjKH4
 GlP/+0YdW/2mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Report reset-request failure using
 SIGID
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824071749.1345374-2-arvind.yadav@intel.com>
References: <20260824071749.1345374-1-arvind.yadav@intel.com>
 <20260824071749.1345374-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 07:27:45 +0000
Message-Id: <20260824072745.D9DC21F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces a build breakage by referencing a non-exist=
ent header file (`xe_log.h`) and an undefined macro (`xe_log_err`). Additio=
nally, it fails to implement the behavior promised in the commit message by=
 passing the standard error code `-EIO` instead of the specified identifier=
 `XE_SIGID_GT_TDR`.
--

--- Patch [1]: [PATCH v3 1/1] drm/xe/guc: Report reset-request failure usin=
g SIGID ---
commit 67003dc14864f3bc207ea53dfd2f7eb0b4972a51
Author: Arvind Yadav <arvind.yadav@intel.com>

drm/xe/guc: Report reset-request failure using SIGID

Route the GuC engine reset-request failure through the structured SIGID
logging helper.

> This path was already reported as an error and triggers GT reset recovery,
> so use the GT component and report it with XE_SIGID_GT_TDR.

[Severity: Medium]
The commit message mentions reporting the error with XE_SIGID_GT_TDR, but t=
he
code below passes -EIO instead.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 864859bd0ccc9..0faeecc7c516d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"

[Severity: Medium]
Could this introduce a build breakage? It appears xe_log.h does not exist in
the repository.

[ ... ]

> @@ -3360,8 +3361,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct =
xe_guc *guc, u32 *msg, u32 len
>  	reason =3D msg[2];
> =20
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		  guc_class, instance, reason);
> +	xe_log_err(gt, GT, -EIO,
> +		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
> +		   guc_class, instance, reason);

[Severity: Medium]
Is xe_log_err defined anywhere since xe_log.h is missing? It looks like this
might result in an undefined macro error during compilation.

Additionally, as noted above, this passes -EIO instead of the promised
XE_SIGID_GT_TDR identifier.

> =20
>  	xe_gt_reset_async(gt);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824071749.1345=
374-2-arvind.yadav@intel.com?part=3D1
