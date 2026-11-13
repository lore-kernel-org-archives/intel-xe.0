Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EEE606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKqHjWJm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396C410E034;
	Fri, 13 Nov 2026 12:17:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7F510E034
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 12:17:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C1F9404D3;
 Fri, 13 Nov 2026 12:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA75A1F000C4;
 Fri, 13 Nov 2026 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794572267;
 bh=xdBku3D/yNcetseeYtSYG9Qdn68JvQEfhgTZSkC1ssI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KKqHjWJm/4PHcmbbabvWO1Mf420Mm8ubvKq++TQ/rg4IJKi1aFtyvpBtqsG6c0wQY
 u0duamO8Ur+eqv4or/ell5JWvTmw935QFsk9kysNST0+san7SjBRJEsxwzUlH2gnFt
 3R48J4hyqIzf9F8SWl8sdyehwE6riBvm0juNKC/+MPk4ofiy8Ov1yZAv8LEhu+Snos
 4A0VEF8YXVRUbsLjm93PloiC9X5tDHIJD9qA7gkxyK1edRQ101r/g+P401mS3fIpuh
 IGYvx7Y+IB06JSP3k55ZbVXI4AWNWwZ4b5/spysqPrm6FcvXnDHDo+E3aQH2+XaGXX
 TBPEqlvW1iQkg==
Message-ID: <sashiko-outbox-212753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] drm/xe/cper: Add KUnit tests for CPER GUID mappings
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261113115827.1913629-7-mallesh.koujalagi@intel.com>
References: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
 <20261113115827.1913629-7-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 12:17:46 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/cper: xe_cper.c includes KUnit suite with IS_ENABLED
  not IS_BUILTIN
- [Medium] drm/xe/cper: selecting UEFI_CPER without ACPI breaks x86
  !CONFIG_ACPI build
--

commit e55c9c6f9e07f010c97ca750586d2e6ff80ae6be
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/cper: Add KUnit tests for CPER GUID mappings

This commit adds KUnit tests in xe_cper_kunit.c to verify that CRI PCI IDs
and xe_device_guids[] entries stay in sync, and selects UEFI_CPER when
DRM_XE_KUNIT_TEST is enabled.

> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfi=
g.debug
> index 79118d9efd93e..d7712460f2d52 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -77,6 +77,7 @@ config DRM_XE_KUNIT_TEST
>          tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>  	depends on DRM_XE && KUNIT && DEBUG_FS
>  	default KUNIT_ALL_TESTS
> +	select UEFI_CPER if DRM_XE_KUNIT_TEST !=3D n

[Severity: Medium]
Does selecting UEFI_CPER here without an ACPI dependency break x86 builds
when CONFIG_ACPI is disabled (such as with drivers/gpu/drm/xe/.kunitconfig)?

On x86, UEFI_CPER enables UEFI_CPER_X86, which compiles
drivers/firmware/efi/cper-x86.c.  cper_print_proc_ia() calls
arch_apei_report_x86_error(), which is declared in <asm/acpi.h> and only
included by <linux/acpi.h> when CONFIG_ACPI is enabled, causing an
implicit declaration build failure when CONFIG_ACPI=3Dn.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index bb90030bcd2d4..f19e64dd51664 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -320,3 +320,7 @@ int xe_cper_sysfs_init(struct xe_device *xe)
>  {
>  	return devm_device_add_group(xe->drm.dev, &cper_group);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_cper_kunit.c"
> +#endif

[Severity: Medium]
Should this guard use IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST) instead of
IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST), matching other KUnit tests included
into core xe driver files (such as xe_log.c and xe_lmtt.c)?

xe_cper.o is linked into xe.ko rather than a separate test module, and
tests/xe_cper_kunit.c registers xe_cper_suite via kunit_test_suites().
When CONFIG_DRM_XE_KUNIT_TEST=3Dm, IS_ENABLED() still compiles the suite
into xe.ko (or vmlinux if CONFIG_DRM_XE=3Dy), so loading the driver runs
the KUnit suite immediately and taints the kernel with TAINT_TEST even
when no test module is loaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113115827.1913=
629-6-mallesh.koujalagi@intel.com?part=3D1
