Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB83FC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 16:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1C10E12E;
	Thu, 27 Jun 2024 16:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCumLWdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D0010E12E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719505250; x=1751041250;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wdi2vz/9G6tqaBn1jtOS/FYUijdvFr5UFv2ILjZbYgI=;
 b=nCumLWdqKz90G3PFvT4GTgQrk+i2VK5nkSyVPKpPKO09Laf3n4eLp1yF
 1m+MUMHwSlDvyN+u9qiU+3SlW60JQm4jC82pbyw//9znSEXt3AWAckwtW
 XnZww88dujOhrpmzpMjZFi6cskBa+3xzFDzKia1YafCwl6vPlkyNSY12C
 51Z38AAw3yVP8IWSbLp4dY+DwP49icWSFxyiayzNihcHkuRBKDuCKYg9y
 i426pUfW0rFWt5HTGACVZZGAFhhW8MGlv+sxmHAKtfVt/sDjl3cOzXiWM
 1NHYQNmGsb/8+kx6ozrXE3htRzb6yxK5n5Mh3JXClKmr49CaZ1qj6aSi1 A==;
X-CSE-ConnectionGUID: 5zrlAnbRRzWy7QCNupR8mg==
X-CSE-MsgGUID: UBpn2SG9RDS+UBKGhi3gtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19547231"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="19547231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:20:49 -0700
X-CSE-ConnectionGUID: FpacSGC+RJySvO3589HlFg==
X-CSE-MsgGUID: LtTeBYsPSp2K+3dzmFX6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44333400"
Received: from unknown (HELO [10.245.245.90]) ([10.245.245.90])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:20:48 -0700
Message-ID: <cf35f4ca-8e79-4cd1-ae92-ba70eff1d0e6@intel.com>
Date: Thu, 27 Jun 2024 17:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/xe: Convert multiple bind ops into single job
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240626211546.4099339-1-matthew.brost@intel.com>
 <20240626211546.4099339-5-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240626211546.4099339-5-matthew.brost@intel.com>
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

On 26/06/2024 22:15, Matthew Brost wrote:
> This aligns with the uAPI of an array of binds or single bind that
> results in multiple GPUVA ops to be considered a single atomic
> operations.
> 
> The bind-array-enobufs is roughly:
> - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> - each xe_vma_op resolves to 0-3 PT ops
> - xe_vma_ops creates a single job
> - if at any point during binding a failure occurs, xe_vma_ops contains
>    the information necessary unwind the PT and VMA (GPUVA) state
> 
> v2:
>   - add missing dma-resv slot reservation (CI, testing)
> v4:
>   - Fix TLB invalidation (Paulo)
>   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> v5:
>   - Invert i, j usage (Matthew Auld)
>   - Add helper to test and add job dep (Matthew Auld)
>   - Return on anything but -ETIME for cpu bind (Matthew Auld)
>   - Return -ENOBUFS if suballoc of BB fails due to size (Matthew Auld)
>   - s/do/Do (Matthew Auld)
>   - Add missing comma (Matthew Auld)
>   - Do not assign return value to xe_range_fence_insert (Matthew Auld)
> v6:
>   - s/0x1ff/MAX_PTE_PER_SDI (Matthew Auld, CI)
>   - Check to large of SA in Xe to avoid triggering WARN (Matthew Auld)
>   - Fix checkpatch issues
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
