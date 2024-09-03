Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D497CD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 09:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8078010E447;
	Tue,  3 Sep 2024 09:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoxazNd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1216910E447
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725354251; x=1756890251;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zYUDNAW5gxEEZSw63KrpmSWEDDyO3vcCQ97ChGDA/ck=;
 b=BoxazNd6s6zNNrndqae33xhV81nUFrs4pvuAO/rE04FShH4yZ6NGCU4T
 ruR25mAzSqT28BUZtyKj2HYThY8VDbzGRuBrV7/lZXgbrYchqzCmd/bAX
 NlgTNmR8CeIPGMVjHLB4R5itNaYDhVKsaJQb8zyAEZHlhVgEp7f1CNcSB
 VJxRIScovSr4Z4LEaolkN2FcZZc286uovUj9djxgCSRwvldDrS+fNbjYH
 Deg5j1++RSV/j40RzApa5iODn7EjIvEy8IUrY4uSSih4VbR68SaKB9rs6
 ef8AG7tH7IF5/biAfZdILFS+aadm7ioY8fV44RxXh/1icbR6gtWay82iE g==;
X-CSE-ConnectionGUID: UyMZhpDmQcaeA4x69MDkhg==
X-CSE-MsgGUID: PZaRN8f0RTeUVTFDO9mnhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23506350"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23506350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:04:11 -0700
X-CSE-ConnectionGUID: yp9q3LN0Rg2vIN3lx7VWLA==
X-CSE-MsgGUID: YnI9AT4GQCqMn4ME2RcQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69635445"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.222])
 ([10.245.244.222])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:04:09 -0700
Message-ID: <f04dca6b-a93e-49d8-afb6-b82b0641f0f6@intel.com>
Date: Tue, 3 Sep 2024 10:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if
 reclaim-safe.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02/09/2024 15:20, Thomas Hellström wrote:
> xe_bo_move() might be called in the TTM swapout path from validation
> by another TTM device. If so, we are not likely to have a RPM
> reference. So iff xe_pm_runtime_get() is safe to call from reclaim,
> use it instead of xe_pm_runtime_get_noresume().
> 
> Strictly this is currently needed only if handle_system_ccs is true,
> but use xe_pm_runtime_get() if possible anyway to increase test
> coverage.
> 
> At the same time warn if handle_system_ccs is true and we can't
> call xe_pm_runtime_get() from reclaim context. This will likely trip
> if someone tries to enable SRIOV on LNL, without fixing Xe SRIOV
> runtime resume / suspend.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

