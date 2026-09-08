Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B4AC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158DD10EB31;
	Tue,  8 Sep 2026 10:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RzDIw0nD";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AFE10EB29
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:27:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D26260A93;
 Tue,  8 Sep 2026 10:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1CD1F00A3A;
 Tue,  8 Sep 2026 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788863278;
 bh=qt3C177ONWkYFpe01SJqd0sz3tVUdVrSszEE2ycbv1Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RzDIw0nDb3n66Biz4ACE/CuINMt1oKj+814iG+v+bCjvUzURMcLL/gZ1sZ5EJQV1F
 jMN6utEA3/0yHZ8oFbKa+fw8Mx6/AxVZHnLXvu+UU9brOkZJ+/Owbidhwi82D+uFz1
 HQW3ro4pBApqHEBNF8KVKU4qI2d17Twh2bozSpL/A9qmZaWdTGFjfIv1xi/vfcLsXL
 Z47EI3YWmRhmjhmpTLFa4fzavtOS0OZHkVBY3X+xu7yJ5sAOjTuB2pLbxIP5ciqCtN
 Y10ehf4rAsdTd4oPvuvPiQN2h4LuPG783h4ni2jvHVfivhn5VqWbcNjsWjjWQ+oStO
 xTeJmFGLUNdvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908100602.1626556-5-piotr.piorkowski@intel.com>
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
 <20260908100602.1626556-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:27:57 +0000
Message-Id: <20260908102757.BF1CD1F00A3A@smtp.kernel.org>
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
- [Medium] Test assertion aborts cause memory leaks and DRM MM teardown war=
nings in KUnit tests.
--

commit 0482b39a261e5a5e9244a46c2fbb33074c936fb0
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

    drm/xe/ggtt: Add KUnit tests for usable and shareable pools
   =20
    Add GGTT KUnit tests focused on the newly introduced usable and
    shareable pools.

> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/x=
e/tests/xe_ggtt_kunit.c
> new file mode 100644
> index 0000000000000..9bac48982a81b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
[ ... ]
> +static void alloc_usable_pool_oversized(struct kunit *test)
> +{
[ ... ]
> +	node =3D xe_ggtt_insert_node(ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));

[Severity: Medium]
If the allocation unexpectedly succeeds in alloc_usable_pool_oversized(),
this assertion will fail and abort the test. Will the allocated node be lea=
ked
and cause a warning from drm_mm_takedown() since it remains in the memory
manager?

[ ... ]
> +static void alloc_partial_overlap(struct kunit *test)
> +{
[ ... ]
> +	usable_node =3D xe_ggtt_insert_node(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node =3D xe_ggtt_insert_node_shareable(ggtt, XE_PAGE_SIZE, XE=
_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);

[Severity: Medium]
If the allocation for shareable_node fails in alloc_partial_overlap(),
the assertion will abort the test. Does this leave usable_node in the memory
manager, leaking it and triggering a warning during DRM MM teardown?

[ ... ]
> +static void alloc_partial_overlap_usable_full(struct kunit *test)
> +{
[ ... ]
> +	usable_node =3D xe_ggtt_insert_node(ggtt, usable, XE_PAGE_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> +	shareable_node =3D xe_ggtt_insert_node_shareable(ggtt, shareable, XE_PA=
GE_SIZE);
> +	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));

[Severity: Medium]
If the shareable_node allocation unexpectedly succeeds here in
alloc_partial_overlap_usable_full(), the assertion will abort the test.
Could this cause usable_node to be leaked and trigger a drm_mm_takedown()
warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908100602.1626=
556-1-piotr.piorkowski@intel.com?part=3D4
