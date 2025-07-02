Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B727C8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 11:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55A710E6EA;
	Wed,  2 Jul 2025 11:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h47J8r8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C05B10E6EA
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751454752; x=1782990752;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rB/xPPL32OyZOf1D1na0Qx68PnSWQpGM0yH+TVhaNuk=;
 b=h47J8r8KSBSZD0v3bDmKenGK4LmnAyYdiKV13QS9WvJf4e6L2QK7JAtS
 5IVOKqGDfH3LkJ9ffJVOFXDsNbpnjUVHDDgb6fnwTVxxjxC+od5Gdnh3v
 mlZLbHIJbp88UptftJB1h1x6DZh0NtHzCYU52DDFbyEjpl0E/Mjb5iYzR
 jd5bOTawmu+sfB0PoDn7GO4aRwQ0KbNZMSiZCinXR6txDe//r98rnA0t7
 7yfSaN9rx0J5QWpknvBo/9lDJT/dNmF9qLfbOgXXp7sUz+dcphfKZVHkM
 EhUWQdw9dysZzwzxrX+TOtQyJKSlKqGYRT+7qnq7k3Qop7r7w9xnPCppV w==;
X-CSE-ConnectionGUID: O+Rw5y9gSKOrx+2GPconXQ==
X-CSE-MsgGUID: CgS9t7/qSIWsb1SvWyJe1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64437913"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64437913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:12:32 -0700
X-CSE-ConnectionGUID: 86L8Gm/XSLSxuK536T9OGQ==
X-CSE-MsgGUID: mO6Ez8hZQYmJwX5B31OlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177724136"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2025 04:12:31 -0700
Received: from [10.245.112.168] (unknown [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 782532876B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 12:12:30 +0100 (IST)
Message-ID: <c395d4a6-59f2-4f8c-90dc-6766c24741ca@intel.com>
Date: Wed, 2 Jul 2025 13:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvaHdf?=
 =?UTF-8?Q?engine=5Fgroup=3A_Fix_potential_leak?=
To: intel-xe@lists.freedesktop.org
References: <20250627184143.1480-1-michal.wajdeczko@intel.com>
 <175141109512.126279.13173940433053893071@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175141109512.126279.13173940433053893071@1538d3639d33>
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



On 02.07.2025 01:04, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/hw_engine_group: Fix potential leak
> URL   : https://patchwork.freedesktop.org/series/150897/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f_FULL -> xe-pw-150897v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-150897v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-150897v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-150897v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150897v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
> 

no logs, but unlikely to be related (here fails at KMS test, while patch
is about corner case during the driver init)

