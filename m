Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC1FCF8840
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 18:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3F810EA86;
	Fri,  4 Oct 2024 18:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFGAj1bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006010EA86
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 18:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728068268; x=1759604268;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VxSHfkSMVgWPzCdFCYXjN4bUdn+ZijL0/BJF0/9Dpc0=;
 b=JFGAj1bjUlvnMeiXvhrjdpGLTs6/c+b/Wo9YQGh3jViQgudrm52A/Tg6
 xmcASEn0Bzp90Hs2plgVcXOKLCtphHA1diBzK1q7Wm1Cyt8qYZFENUdv/
 cs3p7igAD7jSoab0WbSk6ziflVeFIEbIXpxqL/xgc0Hfgcq+V3EytPQJE
 Wu9Ttc5z/fmrDKjBM+BeO2qELl/HTxiccYjOsGfwr+yZLIlKHIAK6JRjB
 UrhfJ5dC4k/4hOq+LU8GnCsQ/nTMxoBbH9z5C4kNJby3dyzKWZiOk3FJR
 zJMkr+xvWnHI65y44jcLxs/1kKlCbSqGhLAWwK7BcbptRhz8yya8lbY+/ g==;
X-CSE-ConnectionGUID: HTbVc7kSTeml1smScpR6JA==
X-CSE-MsgGUID: R5zR0kmmT5OG1LvczHvN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37869079"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="37869079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 11:57:48 -0700
X-CSE-ConnectionGUID: sUwCWvGsSEWFBxHtRhUJ8A==
X-CSE-MsgGUID: yzGv7075SmyypnkB/ZPSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74624166"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 11:57:46 -0700
Received: from [10.245.49.38] (mwajdecz-MOBL.ger.corp.intel.com [10.245.49.38])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C98AE32EB9;
 Fri,  4 Oct 2024 19:57:45 +0100 (IST)
Message-ID: <959415a1-59ef-41c2-a245-a16170a5898e@intel.com>
Date: Fri, 4 Oct 2024 20:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] PF: Add functions to save and restore VF
 configuration blob
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
 <w7zdjqviauh2ox2xzpsg2ebqchvudzmlyji54x4p7moys7fqem@bru6lh4yj3jb>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <w7zdjqviauh2ox2xzpsg2ebqchvudzmlyji54x4p7moys7fqem@bru6lh4yj3jb>
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



On 03.10.2024 13:05, Michał Winiarski wrote:
> On Thu, Sep 19, 2024 at 07:15:23PM GMT, Michal Wajdeczko wrote:
>> We already have support to save and restore GuC VF state, but that
>> will only work when the target VF configuration (provisioning) will
>> be exactly the same as the source VF configuration. To help with
>> assuring that both configurations match, allow to encode whole VF
>> configuration that can be saved as blob and restored later.
>>
>> In the future we may want to use such captured configuration blobs
>> as templates to make sure we provision VFs with exactly the same
>> configuration that was previously tested or recommended, or when
>> debugfs knobs are not be available.
> 
> If we end up using this for that purpose - we will need to turn the
> ordering of fields in the blob into an ABI (or at least version it).

I guess we only need to say that this blob version uses KLVs, no need to
enforce any explicit order of the KLVs; and any version data may/should
be placed in the additional header maintained by the real exporter ;)

> 
> For the series:
> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks!

> 
> -Michał
> 
>>
>> Michal Wajdeczko (5):
>>   drm/xe/guc: Add yet another helper macro for threshold
>>   drm/xe/pf: Update success code of pf_validate_vf_config()
>>   drm/xe/pf: Allow to encode subset of VF configuration KLVs
>>   drm/xe/pf: Add functions to save and restore VF configuration blob
>>   drm/xe/pf: Allow to save and restore VF config blob from debugfs
>>
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 204 ++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   4 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
>>  .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    |   7 +
>>  4 files changed, 279 insertions(+), 14 deletions(-)
>>
>> -- 
>> 2.43.0
>>

