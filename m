Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E24C5DF66
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1177210F0C4;
	Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y7io69MY";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615E710EFAC
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 13:00:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E81060A92;
 Wed, 12 Aug 2026 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFABB1F000E9;
 Wed, 12 Aug 2026 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786539654;
 bh=/Iwr7giYgJPKzsAX1U1XVVmAKPj7uBpQqyJtFBFl1q4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y7io69MYnJCvti5Ob8ILFS5VsfMsNKVZyKDy7FPUznw6J00R+5h5Qy27xhc4HdvQd
 Kz4Gppq4vz2OiTRy7I9R2GyWtJ1KMt+BoMm0hUFcwI9uwiXuc3nfzP9451Ooli60GN
 Z7GFxSbTPrjy/qW7BiMtp+oLkJ2G0+XDU4ZtxQ8olM2lxX2jlg8xg0w4iIHO1ckhus
 A/hF/oBblq1B7wl4N/zT0yZmdbRy+fVLVe16hGJm0FESqUwqmY6czNVXEbnjsUKYfs
 MxsYa7tsGXa8Op4dBgO371ZynDgfALMfVLDBZ7/J2rixYahehfeYbT8dCNO0JN55J7
 s3Rr9ChQ6j/Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] drm/xe/tests: Add KUnit tests for VF
 provisioning error handling
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812124313.1377582-16-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-16-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 13:00:53 +0000
Message-Id: <20260812130053.EFABB1F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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

Pre-existing issues:
- [High] The GGTT initialization path skips alignment validation and perfor=
ms partial state updates before validation completes, which the new KUnit t=
ests fail to detect.
--

--- Patch [7]: [PATCH v6 7/7] drm/xe/tests: Add KUnit tests for VF provisio=
ning error handling ---
commit 5074ef2c8cf15b0dd4c9cdf94819ab386e4100b7
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/tests: Add KUnit tests for VF provisioning error handling

This commit adds KUnit test cases for VF provisioning error handling. It
uses the xe_guc_mmio_send_recv() stub to inject bad KLV responses and
verifies that the VF can handle invalid configuration data.

> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gp=
u/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 0000000000000..8cb7f3cebb311
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
[ ... ]
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	int ret;
> +	int flags;
> +	const char *name;
> +} vf_ggtt_testcase[] =3D {
[ ... ]
> +	{
> +		.start_orig =3D TEST_GGTT_START,		.start_query =3D TEST_GGTT_START,
> +		.size_orig =3D TEST_GGTT_SIZE - SZ_2K,	.size_query =3D TEST_GGTT_SIZE =
- SZ_2K,
> +		.expected_ret =3D -EINVAL,		.flags =3D 0,
> +		.name =3D "unaligned_size_4K",
> +
> +	},

[Severity: High]
This is a pre-existing issue, but the new KUnit tests unintentionally mask
a bug in the early return path of vf_get_ggtt_info().

By setting size_orig to a non-zero value (TEST_GGTT_SIZE - SZ_2K) in this
unaligned test case, the test avoids the initial provisioning path. If
size_orig was set to 0 (which reflects the actual initial provisioning stat=
e),
the test would fail because vf_get_ggtt_info() incorrectly returns 0 instead
of -EINVAL.

Looking at vf_get_ggtt_info() in drivers/gpu/drm/xe/xe_gt_sriov_vf.c:

	xe_tile_sriov_vf_ggtt_base_store(tile, start);
	ggtt_size =3D xe_tile_sriov_vf_ggtt(tile);
	if (!ggtt_size) {
		/* ... */
		xe_tile_sriov_vf_ggtt_store(tile, size);
		return 0;
	}

During initial provisioning (when ggtt_size is 0), unvalidated start and si=
ze
values are stored and the function returns early, completely bypassing the
IS_ALIGNED validation checks that occur later in the function.

Should the alignment checks in vf_get_ggtt_info() be moved before this early
return, and should these KUnit tests be updated to include scenarios where
size_orig is 0 to verify the initial provisioning path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812124313.1377=
582-9-satyanarayana.k.v.p@intel.com?part=3D7
