Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12109D44D54
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 13:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DE510E6D7;
	Wed,  6 Nov 2024 13:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8X+ICJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBDA10E6D7
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730898673; x=1762434673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hzz+bWyw9RThApO8cB2QPsh78fXeQgsrDLKj/9Mf84s=;
 b=Y8X+ICJaXqE1LYHpJfIsSPmp9p4nGQCQuHG2qDyut/vTJMfQX8P/fE9B
 2CccSDR3xQjNm22wOMkUE43VRBcmtOxMOWr98yS/TDp9HNjV9TMXN6ATI
 arNAqoqZ3pe4/sCK7ugeCqCEO3WB8Z1LbEhgBgYwpU1WqN4VDyvS1+4C7
 mhVtbAAhXBcLUX/baNiPY5y5zZJ0TLuAv91rMzwWa2PpkSBrwPRiRNn1K
 5hyGaYLXj86NJHfl+m5zyL7OI71hUiJTPTFSeIvTgwpuTpvdeHce7DTDg
 KT9LGNA6OBdfyhsN5w+Qe/xUZmyh/zWORZB7zLKFC0D9T5Q1FB18gaBIR w==;
X-CSE-ConnectionGUID: Qg1tl96OSU6oySk8ifYr3Q==
X-CSE-MsgGUID: S1IlnzewQa++0Z9aNYjBgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41242858"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41242858"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 05:11:12 -0800
X-CSE-ConnectionGUID: GhzuLjR3TDW6Ac9224KdXw==
X-CSE-MsgGUID: N772lsztQmahRAnIgxv5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="115316045"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2024 05:09:23 -0800
Received: from [10.245.98.17] (prowe-mobl.ger.corp.intel.com [10.245.98.17])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4BF832879A;
 Wed,  6 Nov 2024 13:09:21 +0000 (GMT)
Message-ID: <464fa43f-c1eb-4a04-a0c2-07d614c6915a@intel.com>
Date: Wed, 6 Nov 2024 14:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] drm/xe/vf: Post-migration recovery worker basis
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241104213449.1455694-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241104213449.1455694-1-tomasz.lis@intel.com>
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



On 04.11.2024 22:34, Tomasz Lis wrote:
> To support VF Migration, it is necessary to do fixups to any
> non-virtualized resources. These fixups need to be applied within
> VM, on the KMD working with VF.
> 
> This series introduces a post-migration recovery worker, executed
> after migration to perform fixups.
> 
> Specific fixups will be added later in further series.
> 
> v2: renamed and moved functions, updated logged messages, removed
>   unused includes, used anon struct, keeping pm ref during whole
>   recovery, skip handshake, style fixes (Michal)
> v3: ordering, kerneldoc, asserts, debug messages, on_all_tiles ->
>   on_all_gts, switched 'err' and 'ret'  (Michal)
> v4: fixed missing header include in one patch
> v5: Explained what fixups are, explained which IRQ is used, style
>   fixes, assert to separate patch, debug message per GuC instead
>   of one, comments changes (Michal)
> v6: Improved documentation patch, updated one debug message
> 

series LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


> Tomasz Lis (5):
>   drm/xe/vf: React to MIGRATED interrupt
>   drm/xe/vf: Document SRIOV VF restore flow
>   drm/xe/vf: Send RESFIX_DONE message at end of VF restore
>   drm/xe/vf: Start post-migration fixups with provisinoning query
>   drm/xe/vf: Defer fixups if migrated twice fast
> 
>  drivers/gpu/drm/xe/Makefile                   |   3 +-
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++++
>  drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  63 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |   2 +
>  drivers/gpu/drm/xe/xe_guc.c                   |  11 ++
>  drivers/gpu/drm/xe/xe_memirq.c                |   3 +
>  drivers/gpu/drm/xe/xe_sriov.c                 |   4 +
>  drivers/gpu/drm/xe/xe_sriov_types.h           |  17 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 156 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h              | 121 ++++++++++++++
>  11 files changed, 419 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
> 

