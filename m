Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF33C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 11:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA3610E037;
	Tue,  6 Aug 2024 11:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5aPrXxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202EC10E037
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722945225; x=1754481225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h9KqbNbcSwtEt65IE6M4HcMeaggEt93eVykE2vpD+uU=;
 b=Y5aPrXxlu6Qov0wdn8bSmhkbVTQ0csp8vxWK8sBB0Wi2Ho78zRzbnaZj
 KQVxk31VXhD+1CeZfCAFOdUFVESbNKtNfYh6t9p5lDjq10whqCmybJTaD
 i9+uNKMHSR/jRNd6kne4kKxv9Wv8USebGCqI7bT9M1OEUpRkvifSuVov1
 i2XqEfDOgpxtQw7+z3s9/6io+fBhlxAIr0OCTIiEbGSd1wpLTat+n/i7r
 DKdZwFPjIJ8p/QQjSjAVerDfxlROA6CdMJDkg7aeG8oVoXy+DnEi3prrh
 BvLfaKPyiUe17hUod20LAyF77IqzFeEdFmlNUJnCtMX1G00+B3fF4f2kw A==;
X-CSE-ConnectionGUID: UG6RznvoTsqdm02qPx8xQA==
X-CSE-MsgGUID: fBsyosGjSfe1MuTNzharug==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20624915"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20624915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:53:45 -0700
X-CSE-ConnectionGUID: Spuf1u09TuS5THkeQERGKg==
X-CSE-MsgGUID: OVRTooR6SpaxK6wVUfZYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56447822"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.244.106])
 ([10.245.244.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:53:44 -0700
Message-ID: <6d92eb75-751a-4ddc-bf47-23c44521e9e7@intel.com>
Date: Tue, 6 Aug 2024 12:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix access_ok check in user_fence_create
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240806110722.28661-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240806110722.28661-1-nirmoy.das@intel.com>
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

On 06/08/2024 12:07, Nirmoy Das wrote:
> Check size of the data not size of the pointer.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407300421.IBkAja96-lkp@intel.com/
> Fixes: 0fde907da2d5 ("drm/xe: Validate user fence during creation")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
