Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6801CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8449D10E1B5;
	Mon, 30 Sep 2024 19:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4ewOxnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FE710E1B5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727725273; x=1759261273;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+6ndTdhBG8/QgVYe0FSDCeeywZMIi9ICBzEx3r8wxIw=;
 b=j4ewOxnrroBo7EEzE7JQtr67eivwSsh8Tn5ykCMeBb+Co3ylwUejV6JN
 Tj/tf6xQgJS5gXZfFNqOk9En7Dj67TKy64pR/pPFxWpiKSimQo8+X2e+D
 TT5C5Y8ayya/WwOT6K0EQn+uxvR61dHARD6gIJnE4d+79J0buddjQ0ugS
 iP+TuVFL4kHn8nHe0s+5rJoHlNIFf0ZVFY7StKhsv+27StUWtVV9aygom
 L9QZ9ch/SG8p1/wbwrFYkAmhtbemORaQ8cAXLaDuJJkcKwRpTdQgXhLQu
 0QTAS0taai+F8yvv+0oh3tIW6tpfpjhO/aybjiNVXf+YSkNs+gexW9YzS Q==;
X-CSE-ConnectionGUID: WANEASM1Rje0EAsvox3JOg==
X-CSE-MsgGUID: bVkdLAj+R5iwg9vkulq6DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37979440"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="37979440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:41:06 -0700
X-CSE-ConnectionGUID: Iab8w+dHS16zimg3NqWKVA==
X-CSE-MsgGUID: tYNothDvRyi/8qyJ7IcoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73819405"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 30 Sep 2024 12:41:04 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 967C428789
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 20:41:03 +0100 (IST)
Message-ID: <069c2ca4-79b8-4d1e-a42f-9758e7e588cf@intel.com>
Date: Mon, 30 Sep 2024 21:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_me?=
 =?UTF-8?Q?mirq_report_page_address_helpers?=
To: intel-xe@lists.freedesktop.org
References: <20240925084445.1495-1-michal.wajdeczko@intel.com>
 <172741931040.1109838.104412298661228358@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172741931040.1109838.104412298661228358@2413ebb6fbb6>
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



On 27.09.2024 08:41, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add memirq report page address helpers
> URL   : https://patchwork.freedesktop.org/series/139084/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da_full -> xe-pw-139084v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-139084v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139084v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-139084v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, patch is MEMIRQ specific, which is now applicable to VF only

> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139084v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x128:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-128x128.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139084v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x128.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139084v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8] +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139084v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
> 
>   
