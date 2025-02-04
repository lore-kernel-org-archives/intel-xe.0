Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B9C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 14:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BF910E659;
	Tue,  4 Feb 2025 14:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVDLStL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F87910E659
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738678582; x=1770214582;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ExMJabx+zqmFfBiZC4bhkG4vA9UJktweEhfhFVJrSDs=;
 b=EVDLStL2zPd1+PG0DqOgUUWPlQ6YjXt77TJYc/9ZiQ8JeSF1V1SP5Dvl
 9IbxbWARa+NqyjJV4Y1WOquxG2VY6IBihUnj2XMa0SJKehp9m37Cka3cW
 QJylj/BgwXMJNSjQWDDWTzJwBu7pGLqz+Ri5c1QICchWbMxk6DotfRykA
 kdF6g99GymmUmpZoN4RfRLSMpd4Dhl6Pkxe7HiHaT9AinWp/sv9BXO3i8
 h0y5jvJcO1ehGeVEjQrtpjUt50atawYF9/2u+zz0GYBzD+boETKZOSV3P
 wFOmOwmvdJeYeO7SCE3FozwH6QSMdTqNaN3vVYDefIxcUFls1OIWvtcE7 g==;
X-CSE-ConnectionGUID: znVjdUWGT8arnxpzbSsQ1Q==
X-CSE-MsgGUID: wOv0XYq9RM+AJns271VtOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56634442"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="56634442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:16:14 -0800
X-CSE-ConnectionGUID: uTN+IVOnS6+7s42Gc3IRyQ==
X-CSE-MsgGUID: enE6XWKtTLmiQY9VhAoaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141464843"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2025 06:16:12 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3F18C32CB8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 14:16:11 +0000 (GMT)
Message-ID: <e8367336-a7f2-4168-85e5-4d69bffe8aca@intel.com>
Date: Tue, 4 Feb 2025 15:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Don=27t_try_to_trigger_a_full_GT_reset_if_VF?=
To: intel-xe@lists.freedesktop.org
References: <20250131182502.852-1-michal.wajdeczko@intel.com>
 <173837834899.3381961.8949692042875050724@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173837834899.3381961.8949692042875050724@b555e5b46a47>
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



On 01.02.2025 03:52, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vf: Don't try to trigger a full GT reset if VF
> URL   : https://patchwork.freedesktop.org/series/144198/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2583-12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a_full -> xe-pw-144198v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144198v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144198v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-144198v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

mostly the CI noise

> 
>   * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144198v1/shard-bmg-6/igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-3.html

<7>[  312.079117] [IGT] kms_cursor_crc: starting subtest
cursor-alpha-transparent
<7>[  312.080226] [IGT] kms_cursor_crc: starting dynamic subtest
pipe-A-HDMI-A-3

...

<7>[  312.908927] [IGT] kms_cursor_crc: finished subtest
pipe-D-HDMI-A-3, SUCCESS
<7>[  312.909196] [IGT] kms_cursor_crc: finished subtest
cursor-alpha-transparent, SUCCESS

> 
>   * igt@kms_flip@plain-flip-ts-check@d-hdmi-a2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][2] +2 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144198v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@d-hdmi-a2.html

Expected frametime: 16667us; measured 16884.4us +- 6.439us accuracy 0.11%
vblank interval differs from modeline! expected 16666.7us, measured
16884us +- 6.439us, difference 217.8us (33.8 sigma)

but must be unrelated

> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +3 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2583-12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144198v1/shard-bmg-4/igt@kms_rotation_crc@multiplane-rotation.html

no details, but must be unrelated

> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2583-12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144198v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

<6> [202.309712] [IGT] kms_vblank: starting subtest ts-continuation-suspend
<6> [202.310601] [IGT] kms_vblank: starting dynamic subtest pipe-A-HDMI-A-6

suspend...resume

<6> [204.196559] [IGT] kms_vblank: finished subtest pipe-A-HDMI-A-6, SUCCESS


