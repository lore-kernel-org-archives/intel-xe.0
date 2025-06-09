Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB473C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987C10E38B;
	Mon,  9 Jun 2025 14:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsNqMxnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3CD10E38B
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749477686; x=1781013686;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mf+pBbKR752kyiqDWDR2hwV4vYWWAKqSn5YZjz1yhkQ=;
 b=RsNqMxnW3DOFNJRwIWVMlKx0I62qflO68OWSESQ/+Z/1EqTqj+eTocSx
 ci4aDbS1bxhX9FrWAN1M6zCX3sfWJ509866e/nERqMYNt4aOETFucVnHq
 n8U7ZWK4F2l7nBCwe1Faf7FGJn1sYPmupZ9xYGCPf3j8XH3k4GxSCqusC
 rQqSh75Rfj+BVkOKqol1786taew4viEhuAsqgGfaEE64UYWsRS3/GO9ir
 pmuRoMzAO/ZR0RsPBE1xoTS/VCVdi4liCaHY4YgFtBfA2ouwST6kaMs98
 shy9HLqQDwg3rCL6psZVMO4a8WF2rGksa1HlbcoT6B4ntP8YrPD6n5Ll2 Q==;
X-CSE-ConnectionGUID: NCNfhmnMTIO+HHXDnCsj+w==
X-CSE-MsgGUID: +iU5QTZwSWmmZkbAk+KARQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61820790"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="61820790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:01:26 -0700
X-CSE-ConnectionGUID: bJS8dINCSryn5dSNFlohRg==
X-CSE-MsgGUID: penuoHdUSSK0r5kkWY9j+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146440071"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2025 07:01:24 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 917B333EAC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 15:01:23 +0100 (IST)
Message-ID: <c7cdda93-37ee-43cc-b593-6d2f59da8d54@intel.com>
Date: Mon, 9 Jun 2025 16:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Use_GT-oriented_firmware_messages?=
To: intel-xe@lists.freedesktop.org
References: <20250606204311.813-1-michal.wajdeczko@intel.com>
 <174944906793.58860.15374213662392696453@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174944906793.58860.15374213662392696453@1538d3639d33>
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



On 09.06.2025 08:04, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/uc: Use GT-oriented firmware messages
> URL   : https://patchwork.freedesktop.org/series/149956/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f_FULL -> xe-pw-149956v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-149956v1_FULL need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149956v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-149956v1_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
>     - shard-adlp:         [SKIP][1] ([Intel XE#4915]) -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149956v1/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset.html

hard to tell without logs that we can trust, but unlikely to be related
to this series, as new logs seem to be working:

<6>[  501.450289] xe 0000:00:02.0: [drm] GT0: Using GuC firmware from
i915/adlp_guc_70.bin version 70.44.1

<6>[  501.453687] xe 0000:00:02.0: [drm] GT0: Using HuC firmware from
i915/tgl_huc.bin version 7.9.3

and test app was started several times:

<7>[  523.761833] [IGT] xe_exec_system_allocator: executing
..
<7>[  523.764697] [IGT] xe_exec_system_allocator: exiting, ret=77


