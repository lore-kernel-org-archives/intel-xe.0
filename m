Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A52606A32D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WiWA2fPR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D241124DC;
	Thu,  5 Nov 2026 15:02:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E61124F2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 15:02:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A272F60416;
 Thu,  5 Nov 2026 15:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358C81F000C1;
 Thu,  5 Nov 2026 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793890965;
 bh=hFxwdvkB9kbO/fhunKa15qdTTlTtjJvzfz5R2nJyRl4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WiWA2fPR3lVApe50xs5gFkG5ThRSWFWmI2vbyHiHMn13XwIn0epOdkyFYtTgjSA6l
 ripIzxyz7acB4PQzhNoWnZZv8iJu4+9FPG2FiFwbAcAcl1i51KgwFvfP+7nwPw/l/R
 0v/T7Hm3sMHd5NYhGWuLiTsEPskhgRF+O2UzSi48gKklV6d5E460lDg0+8EdSQxUvy
 85NzEZEPs1zYmGTx7ZMFBXDmfnTBte+ZJXfN0G08N+GGgC/wO4MbF9p31re6AUvyHY
 t9LZmA33IKPcJ+9OqzCd/z2Ohx50Ev6ugLLOZBAStDGgXCbZnqPGEa1K6I961QtLc1
 5vfoLJSoshK9A==
Message-ID: <sashiko-outbox-199285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on CRI
To: "Varun Gupta" <varun.gupta@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261105145531.1847892-2-varun.gupta@intel.com>
References: <20261105145531.1847892-2-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:02:44 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/xe/guc: comment and commit log mismatch with xe_gt_dbg()
--

commit c236f2b41d208ff40015648cc796be2b8ec71ef8
Author: Varun Gupta <varun.gupta@intel.com>

drm/xe/guc: Demote uncorrectable local error log on CRI

This commit demotes the GuC uncorrectable local error log on Crescent Island
(XE_CRESCENTISLAND) to debug level and ratelimits the error log when guc_id
is GUC_ID_UNKNOWN in xe_guc_uncorrectable_error_handler().

>     drm/xe/guc: Demote uncorrectable local error log on CRI
>    =20
>     The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
>     local, queue-level context termination rather than a global device or
>     driver failure. On CRI, due to a hardware limitation, the platform ca=
nnot
>     distinguish GT translation faults from true RAS conditions, meaning
>     standard workloads routinely trigger this error.
>    =20
>     Printing this at ERROR level is too noisy and causes false-positive
>     dmesg-warn failures in CI. Demote the log level to INFO for CRI.
>    =20
>     v4:
>       - Change to _dbg instead of _info. (Matt)
>     v3:
>       - Limit the demotion to CRI and add comment explaining the HW limit=
ation
>         (Rodrigo)
>     v2:
>       - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>         (Himal)
>    =20
>     Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable erro=
r notifications")
>     Signed-off-by: Varun Gupta <varun.gupta@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e7c2778029ca..8689c7ddc5fa0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3610,7 +3610,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_gu=
c *guc, u32 *msg, u32 len)
>  	guc_id =3D msg[0];
> =20
>  	if (guc_id =3D=3D GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown=
 GuC id\n");
>  		return 0;
>  	}
> =20
> @@ -3618,9 +3618,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
> =20
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_mas=
k=3D0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to info to avoid false-positive
> +	 * hardware error logs.
> +	 */
> +	if (gt_to_xe(gt)->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe_gt_dbg(gt,
> +			  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_ma=
sk=3D0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);

[Severity: Low]
This isn't a bug, but in xe_guc_uncorrectable_error_handler(), v4 changed t=
he
XE_CRESCENTISLAND branch to call xe_gt_dbg() while the comment right above =
it
and the commit message body still say it is demoted to info.

Also, changing xe_gt_err() to xe_gt_err_ratelimited() when guc_id =3D=3D
GUC_ID_UNKNOWN is only mentioned in the v2 changelog note and not in the ma=
in
commit description.

Should the comment and commit message be updated to reflect the debug log
level and the ratelimiting of GUC_ID_UNKNOWN?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105145531.1847=
892-2-varun.gupta@intel.com?part=3D1
