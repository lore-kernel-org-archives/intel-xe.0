Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E5EC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 10:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9955710E561;
	Mon, 14 Apr 2025 10:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFmay+1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4252510E561
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744627278; x=1776163278;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F/DDlwrwiKvC8FXGXcj3xvrAEhuK2tXluOuLXf8GQwg=;
 b=oFmay+1OJldsPj6CEnKWHRu234MEFwuihQPGdDjT2Ln8spH6q2o1+Ptv
 b63Ve4JJkR3LkKQ3Kk0D5qf02KFvk1lTy4XHxsZW2OAbW8XtBznVtCKm7
 STFN8RhSEOX5vK8ebq3XTMHeC4lQ4jRgOpiL+StAw36I/Myikg8CUqwQV
 2e5k3bJ28gzpEGhFbA3juaQ5s316/S2EfKwaMwz+9trnVZcd8dxQZmlSf
 TzD2Nx9RWtKgLM+lNi48BDS8t9SOh0gl3q8BhXX7tv5MERQAgiQ1KRDze
 PM/zN2oetwLsASbbhMhVLLvJ9Zn01LY6tw2sLcRTZOZAQDldwu5NeIXpV g==;
X-CSE-ConnectionGUID: n8zdCHrhSVClcdpLl8egCg==
X-CSE-MsgGUID: agvA7xXoQkuwjMNQtgHupQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46002739"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46002739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:41:17 -0700
X-CSE-ConnectionGUID: dJ83XtHDTH+ezEjXoxgQrg==
X-CSE-MsgGUID: r1pbeWXMTXam9rgykMIt2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129631182"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2025 03:41:17 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4665412580
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 11:41:16 +0100 (IST)
Message-ID: <d8531c66-701a-4788-89e6-63f9eb383a68@intel.com>
Date: Mon, 14 Apr 2025 12:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Don=27t_show_GGTT/LMEM_debugfs_files_under_media_GT?=
To: intel-xe@lists.freedesktop.org
References: <20250411193030.1865-1-michal.wajdeczko@intel.com>
 <174441598144.6446.3255789442775450712@32c37dd7f93d>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174441598144.6446.3255789442775450712@32c37dd7f93d>
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



On 12.04.2025 01:59, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
> URL   : https://patchwork.freedesktop.org/series/147612/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc_FULL -> xe-pw-147612v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-147612v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-147612v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-147612v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

both unrelated

> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147612v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html

Starting subtest: 256x256-top-bottom
At least one pipe/output combo needed.
At least one pipe/output combo needed.
No dynamic tests executed.
Subtest 256x256-top-bottom: SKIP (0.001s)

> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +3 other tests dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2941-95956f65403ec2f6784fca383eecbb54431ddebc/shard-bmg-1/igt@kms_pm_rpm@i2c.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147612v1/shard-bmg-6/igt@kms_pm_rpm@i2c.html

<3> [237.125422] xe 0000:03:00.0: [drm] *ERROR* Failed to read DPCD
register 0x92


