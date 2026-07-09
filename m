Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC06C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 13:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59A110E6D7;
	Thu,  9 Jul 2026 13:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8Ta9Ni8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3A10E6D7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783604115; x=1815140115;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZAaVvNuvRZ1DTUoN3Y0jXHxGX+pBXmpqC+64aylu52I=;
 b=c8Ta9Ni8xZDy/42HgFOuPpYCTr9UHmLrp4Am4BO75W/hSMf/baU2vZ84
 ALVDF17awdZW76ooX4RcmmEWzzuECPnDHf8NK05YRS39NQSqpvvEvmZWA
 EgWC+xIoyL8YUtaEiV1MI0yPdRBpXeGUk1czZ0ryJmt0UueUq6MNIN6uH
 c5YcEEipkC0kQNqTx/E9DDEJAybBNBn6Zwd1yxaYUiinsQELk+eT/E+Tu
 /Jqd6pwEq5WHUF/SsAb98qTQEF7o3Td6DMC3RwnOLUBdW/p9OUGO93W5K
 Anhu9CxACK5K5PxQTwN9E9zFbjqIX2lZxGaeXX94XLbSLrdbGGm558IJm A==;
X-CSE-ConnectionGUID: dpoKv2dLS46Wsmb7WWuUHw==
X-CSE-MsgGUID: jAEp4mMdT3SUqLNOu3Es/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83258744"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83258744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 06:35:14 -0700
X-CSE-ConnectionGUID: /NUQFxTiS4CbFnZcHBFeig==
X-CSE-MsgGUID: ONJ19pxiR/SyUu7uAyaclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="292784916"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 06:35:14 -0700
Message-ID: <01e0639c-9a65-4e56-9e42-0010f7f48e53@linux.intel.com>
Date: Thu, 9 Jul 2026 15:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Apply_RCS/CCS_yield_policy_to_SR-IOV_VFs_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20260709075945.1337660-1-marcin.bernatowicz@linux.intel.com>
 <178359628207.170115.18346087436582801911@6beec6c84f66>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178359628207.170115.18346087436582801911@6beec6c84f66>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 7/9/2026 1:24 PM, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs (rev2)
> URL   : https://patchwork.freedesktop.org/series/169989/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c_FULL -> xe-pw-169989v2_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with xe-pw-169989v2_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-169989v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in xe-pw-169989v2_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_pm_dc@dc5-pageflip-negative:
>      - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c/shard-lnl-1/igt@kms_pm_dc@dc5-pageflip-negative.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169989v2/shard-lnl-7/igt@kms_pm_dc@dc5-pageflip-negative.html
Not related to the change.
--
marcin
>    
> Known issues
> ------------
[...]
>
>
> Build changes
> -------------
>
>    * Linux: xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c -> xe-pw-169989v2
>
>    IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-5372-031615563ea8f1acce065bea91fe6ce6b0ce965c: 031615563ea8f1acce065bea91fe6ce6b0ce965c
>    xe-pw-169989v2: 169989v2
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169989v2/index.html
>
