Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2C0C36011
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C385E10E521;
	Tue, 25 Mar 2025 09:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf3kV4RK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDC310E51D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893329; x=1774429329;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7bafJxjA5I/u8EQfJ24LPF0eD2HrxMW6feJaDg6x0D0=;
 b=mf3kV4RKjJfuNCn1w3mY0Qpj7U8O91z2Ng6YbKVEQFnMECemiOZ/yDv2
 QJ1hYWQz/2Tzv3esXOR8TC3hpId8JLL5L0sJA1uDRey/ri7Aav1Tpk1bj
 gBNbK0fbIbwn6d3MS/NUoIp931gJtAdOdMRXYSkbIq7+re/8tbyWguo9I
 JM+PbZRGFgtHr9p9KjwzVJZldHT8tTcxJRwuXLxbLv3YyzTx+Pj8HJ8pE
 MZ44ybl+upXd54ntCD8p5O4jR5DLeigVD99Cm4dk+LEtPqFyBODq+RCbE
 akE+nwsCGO/z0iZ7IH47TDM4uih2XB67tcCC80wX8/ZG7GXsozrjmuyDL A==;
X-CSE-ConnectionGUID: NOydkeqvRbGm2m5dYbNrig==
X-CSE-MsgGUID: F0EooJfKR/yfKXPYqXeIIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55124821"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55124821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:02:09 -0700
X-CSE-ConnectionGUID: 4uPXbZnwTSO5l9iyb+0YrA==
X-CSE-MsgGUID: cScgMnodTBCRltb/G7i5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124773478"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.244.125])
 ([10.245.244.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:02:07 -0700
Message-ID: <8be75eef-2baf-4606-a8cc-1b392db6d918@intel.com>
Date: Tue, 25 Mar 2025 09:02:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/bo: Add a bo remove callback
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
 <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
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

On 24/03/2025 16:54, Thomas Hellström wrote:
> On device unbind, migrate exported bos, including pagemap bos to
> system. This allows importers to take proper action without
> disruption. In particular, SVM clients on remote devices may
> continue as if nothing happened, and can chose a different
> placement.
> 
> The evict_flags() placement is chosen in such a way that bos that
> aren't exported are purged.
> 
> For pinned bos, we unmap DMA, but their pages are not freed yet
> since we can't be 100% sure they are not accessed.
> 
> All pinned external bos (not just the VRAM ones) are put on the
> pinned.external list with this patch. But this only affects the
> xe_bo_pci_dev_remove_pinned() function since !VRAM bos are
> ignored by the suspend / resume functionality. As a follow-up we
> could look at removing the suspend / resume iteration over
> pinned external bos since we currently don't allow pinning
> external bos in VRAM, and other external bos don't need any
> special treatment at suspend / resume.
> 
> v2:
> - Address review comments. (Matthew Auld).
> v3:
> - Don't introduce an external_evicted list (Matthew Auld)
> - Add a discussion around suspend / resume behaviour to the
>    commit message.
> - Formatting fixes.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

