Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD5C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D60E10E097;
	Thu,  6 Aug 2026 11:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXe1wHPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE14710E097
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786014703; x=1817550703;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=9TqUQ1cEN1iSqYeQKVPH3b6O7vlJmwNuvfTAHuje9SI=;
 b=YXe1wHPgIvb5oDZKwWJCDO6mifycqNtKGkQTLVVrwCActthG/wKST2vO
 VINZXROgW7eEnStujajiapLNfMrHtOkkSvRtUy7A+YNSkwHK0CQKinHCu
 FCMtrLaXsLFO71ft/LmOcnklkOJ+/XxPOqmPJKdjGVyTqxyXIp42Va0T7
 87HzGtH0exjRIt7TsbQ8k+eA4DJxlRQ+R7Gsn1pxpWb3XGuxLGOP4T5ol
 3KLwxsOHEPkDtOzmatXx+yJDk9zM62RQv6lPjkZyC4mrBS75N8s/bs63H
 1ciiC6oVGzbYF3ZlwYQtDasna9BCyp4kQR1fqr+TqyUQwLiCsB6rbsLGK w==;
X-CSE-ConnectionGUID: CpQyYL9SRsWq6e7RUQXfDg==
X-CSE-MsgGUID: VecpSNN9SAOWEU8aAzj1aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86616021"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86616021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:11:43 -0700
X-CSE-ConnectionGUID: beAXEw2aTPufaFFjbwCZiw==
X-CSE-MsgGUID: o7oimXP9Sky+ViulMjT5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="267222759"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.11])
 ([10.245.245.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:11:42 -0700
Message-ID: <424d6e9f-3e33-4f06-bbb3-11ce2d6e2607@intel.com>
Date: Thu, 6 Aug 2026 12:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/xe/guc_ads: allocate UM queues in a separate BO
From: Matthew Auld <matthew.auld@intel.com>
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, stable@vger.kernel.org
References: <20260804165057.129529-1-jia.yao@intel.com>
 <20260804165057.129529-2-jia.yao@intel.com>
 <88b53afb-d7c1-4da1-9708-d0843be27b6d@intel.com>
Content-Language: en-GB
In-Reply-To: <88b53afb-d7c1-4da1-9708-d0843be27b6d@intel.com>
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

On 05/08/2026 11:30, Matthew Auld wrote:
> On 04/08/2026 17:50, Jia Yao wrote:
>> Move the UM queues into a dedicated UC BO (ads->um_queue_bo) and avoid
>> CPU memset operations on it, which eliminates the CPU as a potential
>> cacheline-polluting agent and helps maintain consistency between GAM
>> writes and GuC reads.

Now pushed. I tweaked the commit message here, since we missed detailing 
the contig related fixes.

>>
>> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.12+
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 

