Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3759E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214110E39E;
	Thu,  5 Dec 2024 11:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnZnzleO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DD510E39E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733399756; x=1764935756;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wtjgy1C0ui0x8O4Mucja+7I8AmaiRMUHagXywMBkxXc=;
 b=FnZnzleOthW8fc53P/GQJuoaYeSCpWrf+PlzZBxg9efeyouWUVGeRmFZ
 ao2LNGGQjnR5VRaspVIWIvcl+1Unp3GD5A5j/1M+EofRnCDyR+eHWnWr0
 M1iVGlEbCMDZiFUpS5vioV+lcxy5skUpCEpRISeNx/lzjXm0hHKPV/xLN
 JdilWbzjlyUnN4XLSiMTladxLc7pdiGIQQmXKnP/HKgE/WqEJIQSpcz0c
 e6+3ZMAm+YwM1SWjjKWZ2VwqQOA+t7KJOoxFzEbWhPBPvWZ4aIvVBYaDH
 s12BBmQQmwaNHAMxYAUK4XiBSfi88yoWTla9JbBuCqGsIoU2mLRi0Dp4c g==;
X-CSE-ConnectionGUID: DFeisrYJSxyRYvDHp6+/iA==
X-CSE-MsgGUID: TruC8lwKQ8mT8Um3A7/Euw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33039050"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33039050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:55:56 -0800
X-CSE-ConnectionGUID: zjnYdqWUQSeKj5OCASk4SQ==
X-CSE-MsgGUID: AGPns/8JRsu5APSFCMfDJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93943923"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.50])
 ([10.245.244.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:55:54 -0800
Message-ID: <ba6ee80b-967c-450a-b44c-bbb65754e569@intel.com>
Date: Thu, 5 Dec 2024 11:55:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Use non-interruptible wait when moving BO
 to system
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241205120253.2015537-1-nirmoy.das@intel.com>
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

On 05/12/2024 12:02, Nirmoy Das wrote:
> Ensure a non-interruptible wait is used when moving a bo to
> XE_PL_SYSTEM. This prevents dma_mappings from being removed prematurely
> while a GPU job is still in progress, even if the CPU receives a
> signal during the operation.
> 
> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

