Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU+4/fGS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B99112461;
	Thu, 26 Nov 2026 14:18:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C8112461
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:18:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3FCBF4369D;
 Thu, 26 Nov 2026 14:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D992F1F000D8;
 Thu, 26 Nov 2026 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795702681;
 bh=BxXSWPokuLcXOPbKDmjI5iOtkvyf77KesUZLKXiUg0I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=MU+4/fGSPKJ6JDeERJUXTTtNLT0+MeQs2KpcyvutpWF3g4A5yjXwLbREdF6HhRAhM
 NIJaqPnmNvFkJMesP2T5aZnJqSWY/AKOLqOPAMftmURvf3g5qg7PfZCcxryR3aY4k1
 EGcQ3y58vmhbHCMZDvLdEXdEN6CZJDBbBQ39zOXSgWepVQfUWAwo+8yaNPJx7Z6kX9
 RnZpfJ/V5ao/iuFuwCSFQK7lJ0ZRWnKQOJTWEY1ZHi8iG9D/H59OpfmMIclzPkm1Vq
 GZ8mM9bTF1sYdroQZPqCSmWkeQrQlvL6vjckPwOSJW16uSTNxP723tJnXibvfXetyi
 HD1Qjk3ttKxqg==
Message-ID: <sashiko-outbox-235689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 1/6] drm/xe/cper: Software CPER-Do not review
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126135732.2169939-9-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
 <20261126135732.2169939-9-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:18:00 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/tests: test_sw_cper() stubs log_emit_cper() and
  bypasses xe_cper_emit()
- [Medium] drm/xe/cper: cper_init_section_desc() uses unprobed
  device_uid in early probe
- [Low] drm/xe/cper: placeholder DO NOT REVIEW commit title and
  changelog
--

commit ac02bda5c8770616c9a73c943f0782de2dbebf87
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> drm/xe/cper: Software CPER-Do not review
>
> DO NOT REVIEW. COMPILATION ONLY
> This patch is from https://patchwork.freedesktop.org/series/176576
> Added only for Compilation.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

[Severity: Low]
This commit still carries a temporary "DO NOT REVIEW. COMPILATION ONLY"
subject and changelog instead of describing the software CPER emission
support, header changes, and Crescent Island enablement added by the patch.

> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe=
/tests/xe_log_kunit.c
> index 56c36c8a08e18..9d8966a3177ff 100644
> --- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
[ ... ]
> @@ -130,6 +157,78 @@ static void demo_cper(struct kunit *test)
>  	demo(test->priv);
>  }
> =20
> +/*
> + * Software CPER
> + */
> +static struct {
> +	unsigned int count;
> +	int cper_sev;
> +	enum xe_sigid sigid;
> +	u32 component;
> +	u32 location;
> +	const void *data;
> +	size_t len;
> +} sw_cper_capture;
> +
> +static void capture_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			      enum xe_sigid sigid, u32 component, u32 location,
> +			      const void *data, size_t len, struct va_format *vaf)
> +{
> +	sw_cper_capture.count++;
> +	sw_cper_capture.cper_sev =3D cper_sev;
> +	sw_cper_capture.sigid =3D sigid;
> +	sw_cper_capture.component =3D component;
> +	sw_cper_capture.location =3D location;
> +	sw_cper_capture.data =3D data;
> +	sw_cper_capture.len =3D len;
> +}
> +
> +static const struct sw_cper_param {
> +	int cper_sev;
> +	enum xe_sigid sigid;
> +	u32 component;
> +	int err;		/* reported as ERR_PTR when non-zero */
> +	size_t len;		/* bytes of @blob passed as data */
> +	const char *name;
> +} sw_cper_params[] =3D {
> +	{ CPER_SEV_FATAL, XE_SIGID_PROBE, XE_LOG_COMPONENT_PROBE,
> +	  -ENODEV, 0, "sw-fatal-errno" },
> +	{ CPER_SEV_RECOVERABLE, XE_SIGID_GT_TDR, XE_LOG_COMPONENT_GUCSUBMIT,
> +	  -ETIMEDOUT, 0, "sw-recoverable-errno" },
> +	{ CPER_SEV_CORRECTED, XE_SIGID_MEM_FAULT, XE_LOG_COMPONENT_PAGEFAULT,
> +	  0, 0, "sw-corrected" },
> +	{ CPER_SEV_INFORMATIONAL, XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURV=
IVABILITY,
> +	  0, 0, "sw-informational" },
> +	{ CPER_SEV_FATAL, XE_SIGID_SW, XE_LOG_COMPONENT_NONE,
> +	  0, sizeof(struct xe_ras_error_class), "sw-with-error-class" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(sw_cper, sw_cper_params, name);
> +
> +static void test_sw_cper(struct kunit *test)
> +{
> +	const struct sw_cper_param *param =3D test->param_value;
> +	struct xe_device *xe =3D test->priv;
> +	struct pci_dev *pdev =3D xe_any_to_pdev(xe);
> +	const void *data =3D param->err ? ERR_PTR(param->err) : param->len ? bl=
ob : NULL;
> +
> +	memset(&sw_cper_capture, 0, sizeof(sw_cper_capture));
> +	kunit_activate_static_stub(test, log_emit_cper, capture_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +
> +	xe_log_emit(pdev, param->cper_sev, param->sigid, param->component,
> +		    XE_LOG_LOCATION_NONE, data, param->len, "testing %s\n", param->nam=
e);
> +
> +	KUNIT_ASSERT_EQ(test, sw_cper_capture.count, 1);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.cper_sev, param->cper_sev);
> +	KUNIT_EXPECT_EQ(test, (u32)sw_cper_capture.sigid, (u32)param->sigid);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.component, param->component);
> +	KUNIT_EXPECT_PTR_EQ(test, sw_cper_capture.data, data);
> +	KUNIT_EXPECT_EQ(test, sw_cper_capture.len, param->len);
> +
> +	KUNIT_EXPECT_TRUE(test, is_sw_cper(sw_cper_capture.sigid));
> +}

[Severity: Medium]
Does test_sw_cper() bypass xe_cper_emit() and cper_emit_sw_err() completely?

Stubbing log_emit_cper() with capture_emit_cper() intercepts __xe_log_emit()
before xe_cper_emit() is called, and the fake XE_PVC device initialized by
xe_log_test_init() has xe->info.has_driver_cper set to false anyway.

In addition, sw_cper_params[] tests CPER_SEV_CORRECTED,
CPER_SEV_INFORMATIONAL, and a binary error-class payload in "sw-with-error-=
class",
whereas xe_cper_emit() only accepts CPER_SEV_RECOVERABLE and CPER_SEV_FATAL
and cper_emit_sw_err() ignores len and non-ERR_PTR data.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 64bbb149e4e3e..d8fff57a349e4 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> @@ -519,12 +566,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_se=
v, enum xe_sigid sigid,
>  		  u32 component, u32 location, const void *data, size_t len,
>  		  struct va_format *vaf)
>  {
> +	/* TODO: Handle using pdev instead of xe. */
> +	if (!xe)
> +		return;
> +
>  	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>  		cper_emit_hw_err(xe, cper_sev, sigid, data);
>  		return;
>  	}
> =20
> -	/* TODO software CPER */
> +	if (xe->info.has_driver_cper) {
> +		if (is_sw_sigid(sigid) &&
> +		    (cper_sev =3D=3D CPER_SEV_RECOVERABLE || cper_sev =3D=3D CPER_SEV_=
FATAL))
> +			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
> +		return;
> +	}
>  }

[Severity: Medium]
Can a software CPER emitted during early probe mark sdesc->fru_id as valid
before xe->device_uid has been read from hardware?

On Crescent Island, xe_info_init_early() sets both xe->info.has_device_uid
and xe->info.has_driver_cper, but xe->device_uid is not populated until
xe_device_probe() calls xe_uid_probe() (and is never read if the device
enters boot survivability mode).  If an early probe failure or survivability
log triggers xe_cper_emit() -> cper_emit_sw_err() -> cper_record_emit() ->
cper_init_section_desc() before xe_uid_probe(), cper_init_section_desc()
sees xe->info.has_device_uid, copies the unprobed zero xe->device_uid into
sdesc->fru_id, and sets CPER_SEC_VALID_FRU_ID.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126135732.2169=
939-8-mallesh.koujalagi@intel.com?part=3D1
