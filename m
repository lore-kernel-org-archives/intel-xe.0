Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EFC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 15:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A6410E878;
	Thu,  8 Feb 2024 15:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nhlz4B6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD5A10E878
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707404726; x=1738940726;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iC28Eh5+PJL5DQdt+VDybKl+gCeGeYC+OAktgQxNXDM=;
 b=Nhlz4B6FDDIvKKE+pXlpWOWCMMrtHcUPSNzERG7+G2a7UWorPtumOyk2
 MQ0d7Wz6s5pEw2qBBRMKnwMPKxKTuXWmEXK4aDtUOHctYsXyKUCbyLkQ7
 JMS9KoFRCT9h2bFCGfJMcO8KL1rcVSYsX32bUCTIP9fN34xfIOFtIhKKn
 /2s3SbHuiChgXqT0UsdWLDFR+SXoK1Q19AZJnWXNjiEo/XXzua6gC9ib0
 1dQ9nkqZfljC/1strO7E9oIRmzc1L1uA4cMGiDrhkpPzI/nWN9u1YLtIc
 FtMNOWCgUg0U/h1JQt3O2FbyrTWtxtUDPA0NNEIPgmxAq0tVySD9gyeej w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="26686660"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="26686660"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934153558"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="934153558"
Received: from pkawa-mobl.ger.corp.intel.com (HELO [10.252.20.188])
 ([10.252.20.188])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:05:22 -0800
Message-ID: <4d058e2e-dd9b-4765-b579-c1cdca71ca41@intel.com>
Date: Thu, 8 Feb 2024 15:05:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Avoid reserving zero fences
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
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

On 08/02/2024 13:21, Thomas Hellström wrote:
> The function xe_vm_prepare_vma was blindly accepting zero as the
> number of fences and forwarded that to drm_exec_prepare_obj.
> 
> However, that leads to an out-of-bounds shift in the
> dma_resv_reserve_fences() and while one could argue that the
> dma_resv code should be robust against that, avoid attempting
> to reserve zero fences.
> 
> Relevant stack trace:
> 
> [773.183188] ------------[ cut here ]------------
> [773.183199] UBSAN: shift-out-of-bounds in ../include/linux/log2.h:57:13
> [773.183241] shift exponent 64 is too large for 64-bit type 'long unsigned int'
> [773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G     U             6.8.0-rc3-xe #1
> [773.183256] Hardware name: ASUS System Product Name/PRIME Z690-P D4, BIOS 2014 10/14/2022
> [773.183257] Call Trace:
> [773.183258]  <TASK>
> [773.183260]  dump_stack_lvl+0xaf/0xd0
> [773.183266]  dump_stack+0x10/0x20
> [773.183283]  ubsan_epilogue+0x9/0x40
> [773.183286]  __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> [773.183293]  dma_resv_reserve_fences.cold+0x2b/0x48
> [773.183295]  ? ww_mutex_lock+0x3c/0x110
> [773.183301]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> [773.183313]  xe_vm_prepare_vma+0x33/0x70 [xe]
> [773.183375]  xe_vma_destroy_unlocked+0x55/0xa0 [xe]
> [773.183427]  xe_vm_close_and_put+0x526/0x940 [xe]
> 
> Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use drm_exec")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
