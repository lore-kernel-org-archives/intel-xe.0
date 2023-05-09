Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A6BC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD4210E235;
	Tue,  9 May 2023 13:52:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41C410E23E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683640348; x=1715176348;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BVKAGF0/Za9TlwX+EXdyDVb+XKSf0uy4rvl9/7nVo0s=;
 b=SHyT1Ji8mA/1sqZc5NGZsEMp+8d/NNSJoVffFQswnyXIAGuHzow5mQC/
 K1vVz6QKVf3mvUA9o/KuS/ufZfK+ig7IMQJyOG5Hyy2PeOPX3DNN8Yq7W
 epRLs95u9w5w3rMzjdFpmjCumYs3nHTkEhGVdFoURu8NwVPKIFXsWyzud
 Rl7idzJeRaEkL8m3VZOentVHeR5d5ETzT/EomWj1tzGE+25nBSQzxZXoa
 6fR2mcQiPk9KFOzoq4SQ7E0EzMU3e+I0z40HM6FLou2LbRH0GpWoas+vF
 tlATPFNUuZkKAYQnlMQlCTP6Cl0mn8Itq0X0jnaYmJpJWCSxELFXZSXEj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="339158990"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="339158990"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945286835"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="945286835"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:52:27 -0700
Message-ID: <87710316-f6d8-5fa4-e320-7c2a1969ca6c@linux.intel.com>
Date: Tue, 9 May 2023 15:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-17-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 16/31] drm/xe: Port Xe to GPUVA
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

Hi, Matthew,

On 5/2/23 02:17, Matthew Brost wrote:
> Rather than open coding VM binds and VMA tracking, use the GPUVA
> library. GPUVA provides a common infrastructure for VM binds to use mmap
> / munmap semantics and support for VK sparse bindings.
>
> The concepts are:
>
> 1) xe_vm inherits from drm_gpuva_manager
> 2) xe_vma inherits from drm_gpuva
> 3) xe_vma_op inherits from drm_gpuva_op
> 4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
> GPUVA code to generate an VMA operations list which is parsed, commited,
> and executed.
>
> v2 (CI): Add break after default in case statement.
> v3: Rebase
> v4: Fix some error handling
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Before embarking on a second review of this code it would really be 
beneficial if you could address some comments from the first review. In 
particular splitting this huge patch up if possible (and I also think 
that removing the async worker *before* this patch if at all possible 
would really ease the review both for me and potential upcoming reviewers).

Thanks,

Thomas


