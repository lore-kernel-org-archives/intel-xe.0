Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CA4C282D2
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 16:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DA510E656;
	Tue,  4 Mar 2025 16:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/WkyzXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093610E653
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741107208; x=1772643208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pmJiKXm1wcFFEIkPRaSCM/11zJX5KYMUAtbvJogZ00E=;
 b=e/WkyzXVmYuGRJ8yr5C+b/xQUoyFxIY7BDospBGdHtIXMbY0U68iAni9
 L2ueCFT9lMoUdFOSIpuC0aOozbEPA5OM0CLOQcHA3MNqiykAMvCZzFxWK
 PHmRNHc/KXN5od6zEx4gY28pgfloO8rmnpjYPif6N8Crs2BaM6sdENI7m
 KAUO4lafjCYucQf/JKBrCvzndVLkvcDV9ARoJRFTIVG2icSwuZSRyVZzg
 reSO+8svb9WRWPWaKDepaLnchcePPjAS2Pz5LaXChzYAIJ0sNOjHhhZzV
 j/S9+T5GKTqn4w1EQHswjx5Tq23XNu0HEXRtxCcOQpW46RgiHsion7cMO w==;
X-CSE-ConnectionGUID: 5Q0qASKhQnCjO821ME6EOQ==
X-CSE-MsgGUID: 0/p/oNGtRkyLOVxyheP4eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52674262"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="52674262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:53:28 -0800
X-CSE-ConnectionGUID: s6myUBAXSSKZ9Z5eUUQLLw==
X-CSE-MsgGUID: dseNKyNfQA6cjac5Bm7tyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149370282"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.188])
 ([10.245.245.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:53:26 -0800
Message-ID: <ac71f5fd-b207-4ceb-8b3e-b794d11a7ea5@intel.com>
Date: Tue, 4 Mar 2025 16:53:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/userptr: Unmap userptrs in the mmu notifier
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
References: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
 <20250304113758.67889-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250304113758.67889-4-thomas.hellstrom@linux.intel.com>
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

On 04/03/2025 11:37, Thomas Hellström wrote:
> If userptr pages are freed after a call to the xe mmu notifier,
> the device will not be blocked out from theoretically accessing
> these pages unless they are also unmapped from the iommu, and
> this violates some aspects of the iommu-imposed security.
> 
> Ensure that userptrs are unmapped in the mmu notifier to
> mitigate this. A naive attempt would try to free the sg table, but
> the sg table itself may be accessed by a concurrent bind
> operation, so settle for unly unmapping.

only

> 
> Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


