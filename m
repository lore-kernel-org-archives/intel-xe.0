Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B9C0219D
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 14:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0101510E2BC;
	Sat, 14 Sep 2024 14:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QF0P2vjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399310E2BC
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726323151; x=1757859151;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZDeuDHJtvCQZzTV6umvFkTFpbZqdIUlpbsaUO1qehBo=;
 b=QF0P2vjZs2otcKjNLytmYTaIz4k8Xu+HB8DYXFUduv1h9/z0iU3qBb3P
 zpsBNZq+0BvuMGhB43V1rMIe3NnN7+gwsLNxYaJTXKt0bf6n3I9ZbWfv4
 vFehoCML/3ZJp6yfLmYKGUlLjML5icmKvpMcyPbomB7SPQt2aql3Miaqv
 lYzCpKZ4B5wX68WG7Uc6OWwexMGiDl7s3Yde1OPVGEJyU3RjBD4mtE1fA
 CxJnTT7tpUJUnzLoumc5RYqmB91szF868hcmyaUafEig0G/hjXcyL8qxo
 hbeGq5JS8efjpBLX0vQebMWoyiEPhlGoTu70gx7qqsNMng+I+lCwAfoao Q==;
X-CSE-ConnectionGUID: Ba5dKmLMR/e8HFP8HhVNkw==
X-CSE-MsgGUID: HRB1lQE6SOCEsVaCh1v7EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36351642"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="36351642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 07:12:31 -0700
X-CSE-ConnectionGUID: VssVdXlZSly0GEDdwCtKXg==
X-CSE-MsgGUID: AqL2pz7BQua5lUBqCTVM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="68912241"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 14 Sep 2024 07:12:30 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id ED4602FC41;
 Sat, 14 Sep 2024 15:12:27 +0100 (IST)
Message-ID: <78097dfa-a869-4465-afc5-77a3592c918f@intel.com>
Date: Sat, 14 Sep 2024 16:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] memirq infra changes
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240912085438.737015-1-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912085438.737015-1-illevi@habana.ai>
Content-Type: text/plain; charset=UTF-8
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



On 12.09.2024 10:54, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> This patch set contains Memory Based Interrupts (memirq) infrastructure
> changes to make it reusable for use cases other than VF 
> (specifically MSI-X). 
> 
> The main changes are separation from VF and a new mode where hardware
> engines report interrupt source and status to the offset of instance 0
> (for MSI-X support).
> 
> v2: Rebase
> v3: Rebase, refactor according to review comments (Michal)
> v4: Rebase, address review comments (Michal)
> 
> Ilia Levi (3):
>   drm/xe: move memirq out of VF

can we split above patch into:

	drm/xe: Introduce dedicated config for MEMIRQ debug
	drm/xe: Introduce xe_device_uses_memirq()
	drm/xe: Move memirq out of VF
and maybe
	drm/xe: Prepare to handle memirq outside VF

>   drm/xe: memirq infra changes for MSI-X
>   drm/xe: memirq handler changes
> 
>  drivers/gpu/drm/xe/Kconfig.debug     |  12 ++
>  drivers/gpu/drm/xe/xe_device.c       |   8 +-
>  drivers/gpu/drm/xe/xe_device.h       |  13 +++
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
>  drivers/gpu/drm/xe/xe_guc.c          |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c    |  19 +++-
>  drivers/gpu/drm/xe/xe_irq.c          |  40 ++++---
>  drivers/gpu/drm/xe/xe_lrc.c          |   8 +-
>  drivers/gpu/drm/xe/xe_memirq.c       | 157 +++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_memirq.h       |   6 +-
>  drivers/gpu/drm/xe/xe_memirq_types.h |   4 +-
>  11 files changed, 182 insertions(+), 93 deletions(-)
> 
