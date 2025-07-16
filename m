Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82468C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 15:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4813410E745;
	Wed, 16 Jul 2025 15:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVv+HEv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B499B10E745
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752679410; x=1784215410;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8L78oTca7j72+qz4HYrr8KU5flQXSPGeoHXXlz96QKw=;
 b=hVv+HEv6kYexCOz48ib3RkWVDNS0sW/NwGbFlFpbyYe6DiL07L34xvv9
 dgaCN11EdIA1jEMyj+FUyL2NZuORDpzTakL18QAzatF3WGf4Py7tOhYtP
 NkQ/1YTc3l70XhesC9ngIRPthl/oNXh3jBdjLVqSMjO66ZH8mWbliuzgq
 lUcSdBkNavuPK6dNeTeXnQEAJhnwLMhVN7jHGvOMGIUNbd7Qq1mP242je
 MeixYWAgNHW0xg56eR0MQTfDJ6vkAQEcRaONYuI/M40Z98FP8W3NB9Iw1
 QKRrX5W1GCMpRwgYBVVBauQduK+glzgEKhMfTPK9+5gHwkFL5bx6lGNxv w==;
X-CSE-ConnectionGUID: txgHF4OUR8OXctGRQ+A0yg==
X-CSE-MsgGUID: rGsKVAfwQt6mW6kY2jAlsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77467612"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="77467612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:23:30 -0700
X-CSE-ConnectionGUID: ySPsnpK7Ts2SlELryMEzUQ==
X-CSE-MsgGUID: hqFJRaFiTzKsFKhi1huQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="158013829"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 16 Jul 2025 08:23:29 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 86B7B312FD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 16:23:27 +0100 (IST)
Message-ID: <f122085c-22b3-4ee0-8294-511422bba4a6@intel.com>
Date: Wed, 16 Jul 2025 17:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IE1v?=
 =?UTF-8?Q?ve_debugfs_GT_attributes_under_tile_directory?=
To: intel-xe@lists.freedesktop.org
References: <20250714193645.763-1-michal.wajdeczko@intel.com>
 <175253548262.160541.4591299105871710736@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175253548262.160541.4591299105871710736@1538d3639d33>
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



On 15.07.2025 01:24, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Move debugfs GT attributes under tile directory
> URL   : https://patchwork.freedesktop.org/series/151587/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3410-40b316fbcfdecd30d18ccfad4bba3e460a82cf13_FULL -> xe-pw-151587v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-151587v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-151587v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-151587v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3410-40b316fbcfdecd30d18ccfad4bba3e460a82cf13/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151587v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html

unrelated to debugfs changes ...

