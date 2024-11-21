Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB975E64015
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 21:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55710E2F5;
	Thu, 21 Nov 2024 21:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG7IzPVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58610E24A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732223487; x=1763759487;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=rzTsfq3tLrSD/iLIGUe50Zqj6Ptvxgg/nqhKjx4Y1yg=;
 b=gG7IzPVp/jYZ/1Hf3jp7Ac3k6e2jT4T6saTKczqDfXfQfOruUnGGXuuT
 queFTPLs3sgFUf/sT5Wjo4hjzXqFdoI8YX4smE9lK9PPFSuPjMXRjgGci
 NaJZTjv7JPXdKs/40ofxuKv0LyR/j6r4K85vat+q+N/6sqhIMVzIjjEn6
 nmXmu3PEwnyBbCf1NEuH68tnTuLK2FsHPN5AmzGEMj/oNJJA7YiJ77is2
 LmDTQ0TuuuMVaEeFAQQu9dVrwlKt7OBAZjOv513d0aYThDaMMJb1JLNTh
 RB5lOB//loiTiii2bz3/hiY9rHX6SFXJXFUuAkG466mNz5IFq/VdiinmE w==;
X-CSE-ConnectionGUID: bn3aAJvrSPG613nzcsO7iA==
X-CSE-MsgGUID: pLEogSUzSAe3nH1D8RB2Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="19949692"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="19949692"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 13:11:26 -0800
X-CSE-ConnectionGUID: X318RdlmSEmno7I+MMvwfg==
X-CSE-MsgGUID: sDAgClIKTF6uzHwXhpExaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90537833"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.234])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 13:11:26 -0800
Date: Thu, 21 Nov 2024 15:11:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Sort again the info flags (rev2)
Message-ID: <jdo5efb73gnuswsnjovqicd4yp2abcx5ayqq5t7pzipcocxzia@egvsseqt2ruo>
References: <20241120195710.3447100-1-lucas.demarchi@intel.com>
 <173216684850.983406.6761874766377582245@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173216684850.983406.6761874766377582245@b555e5b46a47>
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

On Thu, Nov 21, 2024 at 05:27:28AM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: Sort again the info flags (rev2)
>URL   : https://patchwork.freedesktop.org/series/141521/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99_full -> xe-pw-141521v2_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-141521v2_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-141521v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-141521v2_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1:
>    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1.html
>
>  * igt@kms_sequence@queue-idle:
>    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_sequence@queue-idle.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_sequence@queue-idle.html
>
>  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
>
>  * igt@xe_exec_reset@cm-cat-error:
>    - shard-adlp:         NOTRUN -> [DMESG-FAIL][6]
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
>
>  * igt@xe_live_ktest@xe_bo:
>    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
>
>  * igt@xe_vm@mmap-style-bind-userptr-all:
>    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10]
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_vm@mmap-style-bind-userptr-all.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_vm@mmap-style-bind-userptr-all.html

nothing related here.

Pushed to drm-xe-next.

thanks
Lucas De Marchi
