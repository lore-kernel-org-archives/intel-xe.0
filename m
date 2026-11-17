Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDBD606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4T5xCEn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539B10F731;
	Tue, 17 Nov 2026 13:29:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7E910F731
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 13:29:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BD4CA601E2;
 Tue, 17 Nov 2026 13:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A6D1F000C4;
 Tue, 17 Nov 2026 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794922158;
 bh=1MnCgvTZCAPTuDb8FymDaG1sYA+2XmIIeHLFE02KZ3c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=O4T5xCEnHAGg/48plXe7z32gDLiT5BQOPoHenzXGImuY2+BHsHO2RX4C8+NIdjjj2
 Z0UoCOfGET7K0Rmj52z77/1xUVhfEl51O0d89sdnDlLbSLPMEYtYKPdsT8Lg87oxuK
 NLv1zGHO7UbQRSKiz0N4XlkJlogFXAEStq8yg0kiIHUW9gAfQ3cjTr2/QtPTeRjtV/
 OyZFjxTRxESLcBezwdGtLsPGRHmUcSrJJGpwAQgCIbRNJRRgD5MJMDv+A5/bCikI3a
 Cgnw1dN0nwJgMAuNfFtW2NFKTGGD9e7RGKiZh0xx4f6b/IMSDWh66wJHTfuw9uVO+N
 I2czBMvQot1bA==
Message-ID: <sashiko-outbox-218878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
To: "Sk Anirban" <sk.anirban@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117125904.2877468-2-sk.anirban@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:29:17 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe: tautological SDK API version check in
  xe_late_bind_ocode_is_current()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] drm/xe/xe_late_bind_fw: race condition accessing
  component.ops and mei_dev [1]
--

commit d49ce25c764e04b076452ac50c66f624a91a9db3
Author: Sk Anirban <sk.anirban@intel.com>

drm/xe/xe_late_bind_fw: Skip OCODE late bind if same version is already run=
ning

This commit adds xe_late_bind_ocode_is_current() to check whether OCODE
firmware is initialized and skip uploading the late-binding payload when the
queried SDK API version matches lbfw->sdk_api_version.

> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe=
_late_bind_fw.c
> index 355d7c841871d..4b8c48871d8ca 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_lat=
e_bind *late_bind)
>  	}
>  }
> =20
> +static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
> +{
> +	struct xe_device *xe =3D late_bind_fw_to_xe(lbfw);
> +	u16 running_ver;
> +	int ret;
> +
> +	if (lbfw->type !=3D INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
> +		return false;
> +
> +	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
> +		return false;
> +
> +	ret =3D xe_sysctrl_sdk_api_version(xe, &running_ver);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "Failed to get running OCODE SDK API version: %pe\n",
> +			ERR_PTR(ret));
> +		return false;
> +	}
> +
> +	drm_dbg(&xe->drm, "OCODE SDK API version running %u, payload %u\n",
> +		running_ver, lbfw->sdk_api_version);
> +
> +	return running_ver =3D=3D lbfw->sdk_api_version;
> +}

[Severity: Medium]
Does running_ver =3D=3D lbfw->sdk_api_version always evaluate to true here
instead of checking the actual OCODE firmware release version
(lbfw->version)?

During initialization, __xe_late_bind_fw_init() already calls
xe_sysctrl_sdk_api_version() to pick the compatible xe/cri_ocode_<sdk_ver>.=
bin
file and rejects the blob before allocating lb_fw->payload if
lb_fw->sdk_api_version !=3D sdk_ver:

drivers/gpu/drm/xe/xe_late_bind_fw.c:__xe_late_bind_fw_init() {
	...
	if (lb_fw->type =3D=3D INTEL_LB_TYPE_OCODE) {
		/* Get SDK API version */
		ret =3D xe_sysctrl_sdk_api_version(xe, &sdk_ver);
		...
		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
			 "xe/cri_ocode_%u.bin", sdk_ver);
	}
	...
	if (lb_fw->type =3D=3D INTEL_LB_TYPE_OCODE && lb_fw->sdk_api_version !=3D =
sdk_ver) {
		drm_warn(&xe->drm, "%s late binding fw: SDK API version mismatch %u !=3D =
%u\n",
			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version, sdk_ver);
		ret =3D 0;
		goto release_fw;
	}
	...
}

Because xe_late_bind_fw_load() only queues work when lbfw->payload is set,
lbfw->sdk_api_version is guaranteed to match the System Controller SDK API
version, so late binding will skip uploading newer OCODE firmware builds for
the same SDK API version whenever an older OCODE image is already running.

> +
>  static void xe_late_bind_work(struct work_struct *work)
>  {
>  	struct xe_late_bind_fw *lbfw =3D container_of(work, struct xe_late_bind=
_fw, work);
> @@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *wo=
rk)
> =20
>  	xe_device_assert_mem_access(xe);
> =20
> +	if (xe_late_bind_ocode_is_current(lbfw)) {
> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
>  	/* we can queue this before the component is bound */
>  	for (slept =3D 0; slept < LB_INIT_TIMEOUT_MS; slept +=3D 100) {
>  		if (late_bind->component.ops)

[Severity: Critical]
This problem wasn't introduced by this patch, but can xe_late_bind_work()
race [1] with xe_late_bind_component_bind() and
xe_late_bind_component_unbind() on late_bind->component.ops and
late_bind->component.mei_dev?

CPU0                                  CPU1
xe_late_bind_work()
  if (!late_bind->component.ops)
  do {
    ops->push_payload(...) -> -EBUSY
    msleep(LB_FW_LOAD_RETRY_PAUSE_MS)
                                      xe_late_bind_component_unbind()
                                        wait_for_worker_completion()
                                          (resume queues new work or
                                           unbind races after check)
                                        late_bind->component.ops =3D NULL
  } while (--retry && ret =3D=3D -EBUSY)
  late_bind->component.ops->push_payload(...)
    <-- NULL pointer dereference (or use-after-free on mei_dev)

Nothing serializes xe_late_bind_fw_load() during PM resume against
xe_late_bind_component_unbind(), so a worker queued after
wait_for_worker_completion() can observe component.ops before it is cleared
and then dereference NULL or pass a freed mei_dev pointer to push_payload().
In addition, xe_late_bind_component_bind() writes late_bind->component.ops
before late_bind->component.mei_dev without a lock or barrier, so a polling
worker can see non-NULL ops and invoke push_payload() while mei_dev is still
NULL or stale.

[1] https://sashiko.dev/#/bug/linux-88e26b7c-a817-48ba-9352-5bb39eea1357

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125904.2877=
468-2-sk.anirban@intel.com?part=3D1
