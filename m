Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26920C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 12:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A4910E1BA;
	Wed, 28 May 2025 12:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/cQzrwG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74D710E1BA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748435299; x=1779971299;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8QA0fitwlDXQOP2RJZYfV25y1x1TgAreFWKv9nw07c0=;
 b=K/cQzrwGB0oRqTqBQnv1GElJgEtrJFQQkNi77hSKF7GKAbKZLLkoDQSh
 7lHX1e/MTv+qBnGjGYu55EP5+ov9LAJgPGCyr60MGY2XGOhWYFnQRIkxY
 Kqr1dHFzQGgEeOtlFYOh1SlDVAOrDP8al9I9Jvtdm9lnp05aP3/E4m3HD
 uLOit7V76y337mqqbeCAGRAg65OUHcqWKZvnX2bU46io7pxU2wYqwQXV/
 xw/Y032AMYrbUXK++HuWP0JL7Z5NaYgkvKT0L9PHC1KRvNj/kCrv1OoyW
 xbknuAwn9sU01IJt4rwecS3EkCvdNQOpY/DQ36RcrIi+gatiw9uys//A1 Q==;
X-CSE-ConnectionGUID: nvqDVAprTUGf0EWGJEdj9w==
X-CSE-MsgGUID: xMYTXVCeScObJ5BYtauT8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61858595"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61858595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 05:28:14 -0700
X-CSE-ConnectionGUID: XyfJnFSZRGeqNkguDRAJyg==
X-CSE-MsgGUID: TAfuzm3/TeaGzOyFfzAp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143868232"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 28 May 2025 05:28:13 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4575333E9C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 13:28:12 +0100 (IST)
Message-ID: <5a39f73f-275b-40a6-94e1-6f6c350b37a0@intel.com>
Date: Wed, 28 May 2025 14:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IEFs?=
 =?UTF-8?Q?low_to_trigger_GT_resets_using_debugfs_writes?=
To: intel-xe@lists.freedesktop.org
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
 <174771738794.2495.6778288047189038196@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174771738794.2495.6778288047189038196@1538d3639d33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 20.05.2025 07:03, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Allow to trigger GT resets using debugfs writes
> URL   : https://patchwork.freedesktop.org/series/149204/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539_FULL -> xe-pw-149204v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149204v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149204v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-149204v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_lease@lease-revoke:
>     - shard-adlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539/shard-adlp-9/igt@kms_lease@lease-revoke.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/shard-adlp-6/igt@kms_lease@lease-revoke.html

<3> [647.894837] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [647.904866] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f

> 
>   * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-2-pipe-b-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-2-pipe-b-hdmi-a-3.html

(kms_plane_multiple:3725) igt_pipe_crc-CRITICAL: Test assertion failure
function igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_plane_multiple:3725) igt_pipe_crc-CRITICAL: Failed assertion:
!mismatch || igt_skip_crc_compare

> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [SKIP][4] ([Intel XE#4596]) -> [DMESG-FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3111-4fa9083ef235badec8ee0bf4f1d8d2594b1c6539/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149204v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   
