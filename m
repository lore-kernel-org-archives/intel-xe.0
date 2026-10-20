Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8286606A322
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+pYgio4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1B10F4A2;
	Tue, 20 Oct 2026 10:15:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881AC10F4A2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 10:15:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9741B60098;
 Tue, 20 Oct 2026 10:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212CF1F000C4;
 Tue, 20 Oct 2026 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792491345;
 bh=/XXlz8MJcFmx2zs4bZWxWZt4ba5192TaJUeDFityh2M=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=X+pYgio4PaNRdQESBN6jeBLp97uMlJCvPYtmNsANC+mydwE4WaPtWzzT/kD+SqapR
 5m/rDmv4sRi9PF5Q8m1SMu+P2ugL5DbUExT3X2+AbnGkQULG4F2Ln8smnwpmCyu/gd
 oF7PNGvYahrPfG5z+zHCcE6Mq010TfbnVMbeAGSS4EYMVKltoAenHdesV4xi0Sb+lF
 kBpovsHBK8lZ7i94XxgjGVGGgXIh01eS4Sf1u27nrxLKuwI0t5aQThxOUS1yfXdN03
 TToIo9sYnjICqn23BNWJ8ZM4wPxfNWCcaeONMlwd4ygBPwdT08TP7IV+uv0/oa9OOR
 d+pM/EpGvguiQ==
Message-ID: <sashiko-outbox-178818@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261020095532.473609-5-piotr.piorkowski@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
 <20261020095532.473609-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:15:44 +0000
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
- [Low] drm/xe: unguarded ggtt_test_insert_node_shareable() breaks !CONFIG_=
PCI_IOV
--

commit 860da7a3db2d0c0c83dbaf117f1d5b696f429f4f
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/ggtt: Add KUnit tests for usable and shareable pools

This commit adds GGTT KUnit tests covering range initialization, allocation
direction, and pool conflicts for the usable and shareable GGTT pools in
native and PF modes.

> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/x=
e/tests/xe_ggtt_kunit.c
> new file mode 100644
> index 0000000000000..03e4f212c62e5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

[ ... ]

> +static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
> +						  struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PA=
GE_SIZE));
> +}
> +
> +static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit=
 *test,
> +							    struct xe_ggtt *ggtt, u32 size)
> +{
> +	return ggtt_test_track_node(test,
> +				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
> +}

[Severity: Low]
Should ggtt_test_insert_node_shareable() be moved inside the
#if IS_ENABLED(CONFIG_PCI_IOV) block below?

In drivers/gpu/drm/xe/xe_ggtt.c and drivers/gpu/drm/xe/xe_ggtt.h,
xe_ggtt_insert_node_shareable() is only declared and defined under
#ifdef CONFIG_PCI_IOV, and all callers of ggtt_test_insert_node_shareable()
are inside the #if IS_ENABLED(CONFIG_PCI_IOV) block.

When building with CONFIG_DRM_XE_KUNIT_TEST=3Dy and CONFIG_PCI_IOV=3Dn, doe=
s this
fail to compile with an implicit function declaration for
xe_ggtt_insert_node_shareable() and an unused-function warning for
ggtt_test_insert_node_shareable()?

[ ... ]

> +#if IS_ENABLED(CONFIG_PCI_IOV)
> +static void init_shared_pf(struct kunit *test)
> +{

[ ... ]

> +}
> +#endif

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020095532.4736=
09-1-piotr.piorkowski@intel.com?part=3D4
