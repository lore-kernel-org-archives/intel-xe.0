Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677D8C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 12:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B910E36A;
	Tue, 15 Jul 2025 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwB11bIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356F10E36A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752584361; x=1784120361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R3Q5gHwpElMmBbr6oojrcP++o63h4jvUZXhGF5z/cA0=;
 b=jwB11bIYHdnjASSaHfjixdN4XeUsfh/+W1p4ynHHMom3Po2wlzYwdyoU
 10NnGJMidcHwJS7ACQT1hDQkAak05EHiZq9Pf+mMV/51PJ1tCX1OY0x64
 rQP5FqiJhprqh5z69/cM8/VaF9Ghr7+6DH2jZ7hO2AmlvAT+nEcFDFPzt
 7b9ktt3dcNLNUWNfXxpuSuZ00DDLWrUy8uCHgHMqXuVbf9x4Qir3ST6j2
 Dre+qprMwL0hMNfC4BlkP8siUgO/0U6Ky49KNgley8oQhiEbMjWqA1LPb
 JmrdTqzrQ560kM2Yud5/SDUchCJbXOQsNSLAYqKSd6kMGRXAZT1x8PD1N A==;
X-CSE-ConnectionGUID: fmEzvFlqTRODWOSFEucv2g==
X-CSE-MsgGUID: BokILpYBSO6k3caNiEbjFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57410461"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="57410461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:59:21 -0700
X-CSE-ConnectionGUID: Ujy+OwPsQoSYC4/rpY9V5w==
X-CSE-MsgGUID: 88xRGa+vSPedtE+Iq9O97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156622171"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:59:19 -0700
Message-ID: <8c228e08-fb2b-477a-8b8c-0bcc62f098d5@intel.com>
Date: Tue, 15 Jul 2025 13:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SVM compression fixes
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com
References: <20250714173342.2997396-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250714173342.2997396-1-matthew.brost@intel.com>
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

On 14/07/2025 18:33, Matthew Brost wrote:
> Compression is broken for SVM and for devcoredump when reading out BOs.

For devcoredump case is this the bo_read() call? Does that mean we would 
still run into trouble for < 16K buffers and then also igpu in general?

> 
> Marking the first two patches as fixes. One option could be to drop
> patch 1 and proceed with just the last two patches as fixes, if we
> decide we're confident in SVM with compression.
> 
> Tested with [1]. The append memory copy compression sections fail on
> drm-tip and pass after this series.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/151581/
> 
> Matthew Brost (3):
>    drm/xe: Disable compression on SVM
>    drm/xe: Update xe_migrate_vram to support compression
>    drm/xe: Enable compressed memory for SVM
> 
>   drivers/gpu/drm/xe/xe_migrate.c | 37 ++++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 7 deletions(-)
> 

