Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72442606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBGVU+A8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AD910E5AC;
	Tue, 20 Oct 2026 09:26:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D35610E5AC
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:26:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A6F46431D5;
 Tue, 20 Oct 2026 09:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7501F000C4;
 Tue, 20 Oct 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792488367;
 bh=oezImwxbsEfWYwSV8SB3Hh5hJbTKLwcArvl99A5HQwk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mBGVU+A8bvLl8DVIwp82QDE9mohAKj/MWnr7lGTELW19Ox5lyXEDgFpANPaLzrPbb
 wbBF0ZCJ8QJ9ARxF4iKtJ5Apji6uZvmjjZsORNxJp9cOXQ4RbkVwkFErxwHuWSRgJK
 NcV56uppv3OBWCI65kKCocC6PUia+Yjq2F++bXoJN824prNkPdYktZSP/fl1zTHtXk
 WCKVfqwURnYQxxGMf/+Q3EV7iffF2Giw5spV+XZVGWrEf9j4jZgOylwHKST2GtNR0u
 lKncRiU8Fg0bq4rJL5R+UP3cpokpmvpFWjAhKzk5GR5Vke6tF6ciW1P0kyq0IvBJoF
 kBJMhJiic63+A==
Message-ID: <sashiko-outbox-178728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] drm/xe/kunit: Test partitioned VRAM manager
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261020084258.443645-7-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
 <20261020084258.443645-7-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:26:06 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe/kunit: xe_ttm_vram_mgr test included in xe.ko when modular
--

commit 5fbb2803b441b2f0a8dc39a38c6ece7e9b2329ff
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/kunit: Test partitioned VRAM manager

This commit adds KUnit tests for the partitioned VRAM manager to exercise
partition selection, address lookup, pool usage, and CPU-visible memory
accounting across partitions.

> diff --git a/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c b/drivers/gpu/drm=
/xe/tests/xe_ttm_vram_mgr.c
> new file mode 100644
> index 0000000000000..1ad3186e6d5be
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
> @@ -0,0 +1,147 @@

[ ... ]

> +static struct kunit_suite xe_ttm_vram_mgr_test_suite =3D {
> +	.name =3D "xe_ttm_vram_mgr",
> +	.test_cases =3D xe_ttm_vram_mgr_tests,
> +};
> +
> +kunit_test_suite(xe_ttm_vram_mgr_test_suite);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 83baeec2ef9b1..509f2e2345553 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -1303,3 +1303,7 @@ void xe_ttm_vram_debugfs_init(struct xe_device *xe,=
 struct dentry *root)
>  		return;
>  	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_f=
ops);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_ttm_vram_mgr.c"
> +#endif

[Severity: Medium]
Should this guard use IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST) instead of
IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST) (or export the suite to xe_test.ko via
EXPORT_SYMBOL_IF_KUNIT)?

Because CONFIG_DRM_XE_KUNIT_TEST is tristate and tests/xe_ttm_vram_mgr.c
registers xe_ttm_vram_mgr_test_suite via kunit_test_suite(), building with
CONFIG_DRM_XE_KUNIT_TEST=3Dm links the suite into the .kunit_test_suites
section of the core xe driver (xe.ko or vmlinux) rather than a test module.

When xe.ko is loaded (or during boot when built-in),
kunit_module_notify()->kunit_module_init()->kunit_run_tests() will
immediately run xe_ttm_vram_mgr_test_suite and taint the kernel with
TAINT_TEST even when no test module is loaded.

Other inlined unit tests in drivers/gpu/drm/xe/ that use kunit_test_suite()
(such as xe_lmtt.c, xe_log.c, and xe_guc_id_mgr.c) guard the #include with
#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020084258.4436=
45-1-piotr.piorkowski@intel.com?part=3D6
