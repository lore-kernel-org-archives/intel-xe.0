Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB6C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 12:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9EE10E1AD;
	Mon, 10 Feb 2025 12:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFPRzM1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED72C10E1AD
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739189452; x=1770725452;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TrrY3ZT8WxGXFPsDWq739sXzSBNnhPLsVrliYzkbknY=;
 b=AFPRzM1Dh10ZkjbSoAELHTjnq+v9sOnDAbkHcTKkvVyzfbO2g0kJH/Q8
 99u8t4uAV44XEGp3z62jV8YFkrXRXg77shPcPZCyemuZRtc0Jp4/FR7Yn
 G2o8QAIsFnZ0SrYNM1QCq6jlTeF7UNF9hiJxHy9iPRWETCIbeXrP5Rhm6
 05exlrdiSeQEfqZsbU4hPsuisHFXUI4rbYsR4c5Ub5AzsenJOeFvLY9j0
 0bNxQKpYZh5rbXDZKy/qPOV5uPv56irtF51XDTnrLtx+Fvj5Vpkd+r5+a
 qb7gXz6GKdjBFROkeD3FP2dzQdjEvRrGZfTYG7+RKGUkO0oFlnPKnW+I+ w==;
X-CSE-ConnectionGUID: EdIALWh6RpO+PUAPLVoSBw==
X-CSE-MsgGUID: QU/UvBeSTBK3Cbd4pBFbBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51195686"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51195686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 04:10:51 -0800
X-CSE-ConnectionGUID: PuKZJLA5SlKv17+UQ5BFwg==
X-CSE-MsgGUID: 8SWCtTnyQASfs7j7RStllA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116767284"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2025 04:10:51 -0800
Received: from [10.245.82.100] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.82.100])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C554C32CA6;
 Mon, 10 Feb 2025 12:10:49 +0000 (GMT)
Message-ID: <0cd36529-ffe0-45ca-a22d-463de827aaa3@intel.com>
Date: Mon, 10 Feb 2025 13:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleaning_up?=
 =?UTF-8?Q?_code_related_to_VRAM_regions_and_its_initialization_-_part_1_=28?=
 =?UTF-8?Q?rev3=29?=
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
 <173918613247.246715.15160991922341005679@b555e5b46a47>
 <20250210113151.tc5pryyky66kfbal@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250210113151.tc5pryyky66kfbal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 10.02.2025 12:31, Piotr Piórkowski wrote:
> Patchwork <patchwork@emeril.freedesktop.org> wrote on pon [2025-lut-10 11:15:32 +0000]:
>> == Series Details ==
>>
>> Series: Cleaning up code related to VRAM regions and its initialization - part 1 (rev3)
>> URL   : https://patchwork.freedesktop.org/series/144172/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -> xe-pw-144172v3_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>   **FAILURE**
>>
>>   Serious unknown changes coming with xe-pw-144172v3_full absolutely need to be
>>   verified manually.
>>   
>>   If you think the reported changes have nothing to do with the changes
>>   introduced in xe-pw-144172v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>   to document this new failure mode, which will reduce false positives in CI.
>>
>>   
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>   No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>   Here are the unknown changes that may have been introduced in xe-pw-144172v3_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>   * igt@xe_vm@munmap-style-unbind-one-partial:
>>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_vm@munmap-style-unbind-one-partial.html
>>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_vm@munmap-style-unbind-one-partial.html
> 
> No logs to deduce something, but for the v2 version which in practice had the same code
> (only change in doc) this problem did not occur so I assume it is a random thing.

from dmesg20

<7>[  253.361476] [IGT] xe_vm: executing
<7>[  253.376891] [IGT] xe_vm: starting subtest
munmap-style-unbind-one-partial
<7>[  253.379893] [IGT] xe_vm: finished subtest
munmap-style-unbind-one-partial, SUCCESS
<7>[  253.391373] [IGT] xe_vm: exiting, ret=0

so pushed to drm-xe-next


