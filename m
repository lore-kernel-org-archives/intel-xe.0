Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9368CD1283
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 16:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8171122D9;
	Fri, 29 Mar 2024 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNoD348h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075F1122D9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711731037; x=1743267037;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=isc6ol8JLgnIyVqdW2wizrCl7hMNnsa1JcE4PnTJLSM=;
 b=mNoD348hYsVb4Xl5Lit2/Qygdy720jwhjcrtMTG97PkXSVmffcORUsj3
 DNRguePNNt/XJNpSGSpZdcQ/+eBlMdo3AfladnREnKkBYr+GpZI7dknpZ
 Re/JHV5H56vK5AfebhD5pNeLNcdVa5TbfyvutDH2P60AuO5fPVSwhI2fd
 pQTbnKpc2Eq72Q2MX5K833MZMVMQJg1oEQMtSUblFwwMbpAxzUYoO92RM
 Sq5zB+fW4DbKdNGC+SU13ZtxXrleOMxqvc0BOwYn/AkuOn5n2TwZMBi4C
 3lXh3bXPIjoNySHiEPDvjMIXWJXOVYIL1ArsQNd7sl5nkR1kozhaAuFDV g==;
X-CSE-ConnectionGUID: Y4zSs5JkT8CjMnWOQ3MfsQ==
X-CSE-MsgGUID: 0UG7PTfKRbqUIM2xCDMp0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10708000"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="10708000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 09:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17063349"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2024 09:50:36 -0700
Received: from [10.249.157.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.157.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4B9E534F10;
 Fri, 29 Mar 2024 16:50:33 +0000 (GMT)
Message-ID: <92f47e87-a638-44c3-94a8-34f901a92eb5@intel.com>
Date: Fri, 29 Mar 2024 17:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Update GuC ABI definitions
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
 <xxpank76lzfhakpmqa5srfqzq3fnpxlklttseyczfrajemvjzz@iqxhplnfmpcc>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <xxpank76lzfhakpmqa5srfqzq3fnpxlklttseyczfrajemvjzz@iqxhplnfmpcc>
Content-Type: text/plain; charset=UTF-8
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



On 29.03.2024 17:14, Lucas De Marchi wrote:
> On Thu, Mar 28, 2024 at 07:31:40PM +0100, Michal Wajdeczko wrote:
>> In upcoming patches we will use additional messages in communication
>> with the GuC firmware. Add necessary definitions to our ABI header.
> 
> but it would be better if these additions were done when they are
> needed. We don't want to keep updating this with things that may not be
> needed at all (plans always change, ABI may change to fix bugs, etc)

fully understand that, but...

this ABI definitions reflects what current firmware already supports
and it is just complementary to what was already pushed in initial
driver drop without supporting code:
 - [1] GuC VGT Policy KLVs
 - [2] GuC VF Configuration KLVs

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L114

[2]
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L154

it will also help me lower my pile of pending patches, so maybe there is
a chance for a small exception ?

Michal

> 
> Lucas De Marchi
> 
>>
>> Michal Wajdeczko (7):
>>  drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
>>  drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
>>  drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
>>  drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
>>  drm/xe/guc: Add VF2GUC_VF_RESET to ABI
>>  drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
>>  drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
>>
>> .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 289 ++++++++++++++++++
>> drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  13 +
>> 2 files changed, 302 insertions(+)
>>
>> -- 
>> 2.43.0
>>
