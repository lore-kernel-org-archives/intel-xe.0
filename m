Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDA8CA9EC9
	for <intel-xe@archiver.kernel.org>; Sun, 11 Oct 2026 11:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E3810E13C;
	Sun, 11 Oct 2026 11:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S+54+biH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50DF10E13C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 11:33:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 891B441A76;
 Sun, 11 Oct 2026 11:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C49A1F0089B;
 Sun, 11 Oct 2026 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791718397;
 bh=FR+TnW5RpsL3Pd60PJzDo1ViUi8GliUKP0dPZGsp4gs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S+54+biHHEiXZ1rumwqZqeZAaeJhewsr5bE9QnXEjRu+oFEfOfCwpfyhI5l6IVIJo
 wB2sl09jQbEoN/8iFoStcJ0DIGhpYDibUNYGU/x153F4zgboRJRauzp6SqBSr2zjFE
 RXRpMufOt1wEtA7Xs0u8l+aMht9+gTJTFo7DZ1UnM6PZzVtstDuWuCfarukCc+5qXR
 eIhG8dO2sz1xmnucgNq/T1bfsBk04dhd02kvp2JyNPQVUDGh3FlUGj7dgNPPyNnLJK
 xyaBUOOm5OUhM2uDsEowTdO0RlgDkLYoG3io2NcOKJ+RYE75qjpvouB3B9b+958WUv
 5jLjXJU1q+QuA==
Message-ID: <sashiko-outbox-167180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] [CI][DONOT-REVIEW] gpu/tests/buddy: Add range-bias
 pruning and free-order tracking tests
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261011112117.1170859-4-sanjay.kumar.yadav@intel.com>
References: <20261011112117.1170859-3-sanjay.kumar.yadav@intel.com>
 <20261011112117.1170859-4-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 11:33:16 +0000
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
- [Low] kunit: flaky test due to absolute time bound in gpu_test_buddy_rang=
e_bias_pruning
--

commit c5175de7da719ada087bdec652e790f13b219a19
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

gpu/tests/buddy: Add range-bias pruning and free-order tracking tests

This commit adds two KUnit cases for subtree_max_free_order and the pruning
in __alloc_range_bias(). It introduces the gpu_test_buddy_range_bias_pruning
test to reproduce the small-BAR pattern and a free-order test to validate
metadata after various block operations.

> diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_b=
uddy_test.c
> index b75d32ca6ca0a..bdf480d782beb 100644
> --- a/drivers/gpu/tests/gpu_buddy_test.c
> +++ b/drivers/gpu/tests/gpu_buddy_test.c
[ ... ]
> +static void gpu_test_buddy_range_bias_pruning(struct kunit *test)
> +{
[ ... ]
> +	for (i =3D 0; i < nr; i++) {
> +		ktime_t start =3D ktime_get();
> +		u64 elapsed;
> +		int err;
> +
> +		err =3D gpu_buddy_alloc_blocks(&mm, 0, range_end, chunk, chunk,
> +					     &allocated, GPU_BUDDY_RANGE_ALLOCATION);
> +		elapsed =3D ktime_to_ns(ktime_sub(ktime_get(), start));

[Severity: Low]
Could this absolute time measurement cause spurious test failures under hea=
vy
system load?

KUnit tests execute in environments with preemption, interrupts, and
potential scheduling delays. Measuring wall-clock time here includes all
preemption and interrupt overhead that might occur during the allocation.

[ ... ]
> +	/* The exhausted range advertises no free space, so it is pruned */
> +	block =3D gpu_test_find_block(&mm, 0, ilog2(range_end / chunk));
> +	KUNIT_ASSERT_NOT_NULL(test, block);
> +	KUNIT_EXPECT_EQ(test, block->subtree_max_free_order, GPU_BUDDY_NO_FREE_=
ORDER);
> +	gpu_test_check_free_order(test, &mm);
> +
> +	/* Per-allocation cost must not grow with the number of allocated block=
s */
> +	KUNIT_EXPECT_LE(test, last_ns, 8 * first_ns + 50 * NSEC_PER_MSEC);

[Severity: Low]
Does this strict time bound make the test flaky?

Asserting on absolute wall-clock time differences (adding a strict 50ms
allowance) is prone to spurious failures when the system is under load or
when the test thread is preempted between the start and end of the timing
windows.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011112117.1170=
859-3-sanjay.kumar.yadav@intel.com?part=3D2
