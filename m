Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FB8C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 13:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9302210EB51;
	Fri,  7 Mar 2025 13:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPA4I87W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3E610EB51
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741353596; x=1772889596;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7nhniK1iYs0ztuyt57CpuRx4cdQ+1XONuAbLyvaSG5s=;
 b=CPA4I87WzhF8aOL5IGtst2G2ZPBHDOU0HPxYKudOgFqShTbJ7hJIXO/W
 PcTSrjRR/wVlk4HGIdDt+BeVXpfOIuHXr0Cwv9kX1Y/fRBkhvyMpOxDLr
 OBLcZeKFNFz2UaNJL5dHjQbiE3XDAg0xfgxl3Y2MJqBXTXZjfUVZEltX/
 K6i6nS0NxsxLdNNfRXwfRKVL+UD4f1MhhxFqC6XvVdx980F2IA3z5Xquj
 SB+YSCtghY4NvAJe5li6Y1soFuyyJCfFvNxbqF6NbWIGSIM7E/QY+ERuB
 aRtPy1hhj0WkPvNKJ2jSsJlQ2leIoa5dnkH0Q+euqitK3yO6sG5B1jsvB w==;
X-CSE-ConnectionGUID: Qpkk6W+nRnmW2/QshZBU3Q==
X-CSE-MsgGUID: lBX/Xu/TShWVXCccy2G/GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42531336"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42531336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 05:19:56 -0800
X-CSE-ConnectionGUID: UeXeXX55SG+nSf7FAPeGWA==
X-CSE-MsgGUID: SUph1sOaRtGrllRnJ5JqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156534840"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.99])
 ([10.245.245.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 05:19:55 -0800
Message-ID: <e9513f16-1470-437f-8472-b73859ff88f2@intel.com>
Date: Fri, 7 Mar 2025 13:19:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/userptr: Fix an incorrect assert
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250307100109.21397-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250307100109.21397-1-thomas.hellstrom@linux.intel.com>
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

On 07/03/2025 10:01, Thomas Hellström wrote:
> The assert incorrectly checks the total length processed which
> can in fact be greater than the number of pages. Fix.
> 
> Fixes: 0a98219bcc96 ("drm/xe/hmm: Don't dereference struct page pointers without notifier lock")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

