Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEA7C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E9010E0F2;
	Thu,  8 Aug 2024 03:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVBko6lR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A410E0F2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723087449; x=1754623449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rAT/hSXNlwfsXh/D8+ouv15k8or95FvJFVN8uHkgtEU=;
 b=AVBko6lR3OOw1R9lrwQObsE7pTSuVCjyfTSMC0MxBBCYoxCOfp/VOyHe
 D9Hnu4O/A1VAvEbqowycqDPeyUDrQwaLXQowW80C4yai9/wdh29Wdtctm
 yHMu7v5Jijr2TxGDNYA/Jc/6sKmKgiWrs4XrQZwPQpVrjLf9+xYARbCF1
 mg9/Wha+eaHivTLGp1rwGZzXZEFVyaQ1GJGkUw+0wWd4ljGOVqnA1mcQB
 bGC3jNShaOKepr1VTXMGdWYT4ox+E9knCSD77RmMOe9C69c6gi+xAYX00
 TjI5+naEo6jOxwx6N2wiZyPoyBFMDM4pF3WJIhwb756qRb+ReOmoY8drW g==;
X-CSE-ConnectionGUID: 4uv+t1qtQqqOIYXzcHrjVg==
X-CSE-MsgGUID: UZq43cQ6S6Scdwi8wBsbCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24101157"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="24101157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:24:08 -0700
X-CSE-ConnectionGUID: +bcDEj7aSCmtwNC3r0tpVw==
X-CSE-MsgGUID: 4DBEOK7kQ6u7S5m68joZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="62015646"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:24:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:24:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:24:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:24:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMYCe7MjFh6upfPFMm4vquYqUXi729RY/RZEkZVC6/bIssDcAWPUO49qJmLRFJJHi+soWTOJRN0mfCoDCeZAnECA7uzZ8UIU27WLkicnHMaHopIMgiSXkf/cqv8Sf1gpwcAeXMG4Fub7OaxE5jISAijoFEvVGjUBd+r5YSlwqVPrTg2eXj2L83+zfzveyyn63ZZirxjo67xSGDCGpw60sdInEvM6+AtTpAK0YMNptxSPRfNinBtIie8auxvXIe2sESAgzu4DqUsdO1hwxd7Fcgii20T9geozMh7vODVMS7cn3d6CVRQ60kctCa08zTgEOgYfxOH7fziYtxTNAgd6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/nQw1A74ZapUMxaDfzHBhjYqpQ5fuXobgJd9RgHSeY=;
 b=u2xRWRELw3Z2ht+USIHYYx6YDclqzAOu3Fybr6lL7ibGOZBw0zuLQnTnG55IajDu0E823vF+GckjmCDusUQnOklz5eH71jTB88SnwFRcTGkthJCYR8akAgVLUvQdJTrhuFFW7IL9W+qoHpOgfUUaXg1m3rtJoRoyHyQViSc5NEf+UsOsq29CCKm2hiHxWYPxxVoSFYDDpPvrdQFAZjwzHevpCjBrxPcNK2JOKpuCPrujZ12ww2Zc5RhMd6/X1quD4aoY+JBYpQh48ienPcqpCgXbf7fWfN8E3e601sLUOvO4TWsQ4YQOwGkpQx8T6o0fkYCHfduTfKKYMElQJnoF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 03:24:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:24:04 +0000
Date: Thu, 8 Aug 2024 03:22:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 03/13] drm/xe/hw_engine_group: Register hw engine
 group's exec queues
Message-ID: <ZrQ6BcWo/MFI2bbU@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c20dd-1202-49af-2e88-08dcb7598dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lCgkROdosG7W8c5Ftl8+k+JyZ3ngxl7t5bDXxVsGrEBcvZ/4q8VNT/527XRj?=
 =?us-ascii?Q?eP5pjuBggHywKY1+ynxUU31fzJ776mOEzqmLdDSItvNFEine3m3CY8R7OMkH?=
 =?us-ascii?Q?tDoAMtusu2htW/VWN/hWwyxeRhu+36mC2NeFPirbHNlf22WaiCqKwPYPg5Jr?=
 =?us-ascii?Q?GlJT3L4W5K/B1ozS4H8JPzZRJbtKPKNl2jqk32B1KCOwNHoQ8o6NzBiBzcWL?=
 =?us-ascii?Q?ty/YnYccevFtSLXGGdhQb10jqpMqcIcsLCV7gElal3nwxC0V05pT98YgBmby?=
 =?us-ascii?Q?Ruo4dfc5reBTnbYHehMgiyQU1mpYyzMUKjNWgykP6efyCWWDNKtjYtuUNyFB?=
 =?us-ascii?Q?OMbIUIvj1uACe9z5VAYfgzjG/L4aUqETy7sSZGRXbOGFp5rMl2I1+MLaGe/6?=
 =?us-ascii?Q?7npl5bhg0KuKMxaeRZy1cy+DVFQyg3lz3SP0+r0SBm90mlVxlMPv7erzdrpK?=
 =?us-ascii?Q?Vki9eE0Fq03qZi282NZzjfz1c0MFSPfdBx+9niAqUi5cir38Ln1qaxpA3HDA?=
 =?us-ascii?Q?wZfxGwLosoJdSNj6cj8p+Pd/Sp4YrTvHNs5jxLxulsNA8gnVoXZKFYfDf2qy?=
 =?us-ascii?Q?nqDyxGz2CCLUvYF8wbLgmttGRBxUxlIAul18LQEh/vnjEL5HcP1puVjDPjty?=
 =?us-ascii?Q?pZvMA2XDBaxsOVJ4SOIB8w8YVFrV/ChA6cqGFaRv36NLjOUDn9DxcVrjwtB2?=
 =?us-ascii?Q?shLDRuuBK6+FRRYFM/dxUWOKqrMcB8I8CFmwj+YFAeVVnSwdK+k0wx8nc5I+?=
 =?us-ascii?Q?eLs/8IHRrcBZiNPdVdP+1OFnPoss8cRVVPLCP0SPtORh5hkl4n5XGKOVmjbM?=
 =?us-ascii?Q?phCrIwVjwDe/Q/QeoB8e4YEoCz65XrkhVgO7NX3lGSY4ZnZlad6QeQxixp+q?=
 =?us-ascii?Q?NGD7i1yqj26TMJ9B00CJwdCX8lbdt6AZ80LCvrtHX+UlBE23vkNvO2QwZilI?=
 =?us-ascii?Q?HARXk+nCipH0oie14dPCAXyv569zG3vsu+Ycvk7M61Rhl3LAPXGB5E8mDl10?=
 =?us-ascii?Q?xPUoMD2Y4Ui5Uef03TJO3hE8Kfu4RV7V9lva30g1pDk3kBy/EGTcNec5dUet?=
 =?us-ascii?Q?JEaBkgWbLFUVk9cxcROGp2WpI704lyds/8I6RH2v15IXZKTek2ijiloBQjBh?=
 =?us-ascii?Q?WDh6gFSnk0ye7kvDn4HAkdvsJHWhakdl5JqOjxhy60zwoHH0G+fh8fqZyx3b?=
 =?us-ascii?Q?FELhnf+rq//yHwmBxr2WssSPM2O22oaZYFIFHUl42CA9g/uS+O7mxx1wNBHo?=
 =?us-ascii?Q?WuMnBuKzCrkuLTo4QCEKrmajZWnRa+Ehg/bg5oVAGF0kDtH+CIFshTM5W1LL?=
 =?us-ascii?Q?Y1KUpAoPnu6t6F5xfR14xlJ6yLMCuQAYCD+/bbGpz0En6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8UeZv3q/xhItfGPDvAptXnPQRfOTFLWDxVyA7j5gjVPlK+IHc2ZnRMSx0SX?=
 =?us-ascii?Q?yHe+qeEvA5h7UgyxKSzaP7P26oZWaXCFDDC6okRfKdiPGoDyu8ooe9bnYEf3?=
 =?us-ascii?Q?+OfMlJy5VDuS+NrzBUSjP7a+Ca2HWwsFFET6lvw5IejI4mpbWMu7SVt22OmW?=
 =?us-ascii?Q?styveNB2T9JfQiMSFpz22nreasFIfdepuI6NuMpuvnTZ05hYilpe39Srn9ed?=
 =?us-ascii?Q?k0Mvl8DZhC9N0xYl4PJPhwXiMCjExtR+JRj+2ro6ByHeAv/bTk1aFEi+aPE5?=
 =?us-ascii?Q?mIqharelYGpw41ITx0ll8i5VZPGOFxg/a0f9ouPwAe78A7gqC2+NA7tRzf6h?=
 =?us-ascii?Q?rRgpBW5UdWWlSHntY52hb/NZxQ+5qAc1maGocT8uxDynuo0hfataCGcZaqMD?=
 =?us-ascii?Q?SyP1PPkeWIqRWAfq4tf+g5Xm09xbzmYroPH70a1Ze8tXYD6yc8CNVoZFunT/?=
 =?us-ascii?Q?tQ6zJ/uwjtfXpWNyvA2NLeGEbKdyQTsSlb7s6kBfBK+a0ei2CWFnQ3NzaIop?=
 =?us-ascii?Q?LblxVbLpqqJLH6CGIVMBRgOr8eGztmgVwUSNO5pBOn8Dn1YAQUX0R3ETkOCh?=
 =?us-ascii?Q?ZMu+b1zVY0+hM9niigbADLvBo9ufEf4GS427DQZ165o4Yz1Lw/MZaTlyL4Zw?=
 =?us-ascii?Q?Gm8WP7tY7uzRh/zVvkAcQjyPmq0fsiOOU1VBAP33PEO1vd1BxIyNnV5kD5PH?=
 =?us-ascii?Q?83c2bO7DnJdjwcuDWMfv58VblKHvUrOkBcBIJ6MfQvLFD7jyovrwiby+a/ij?=
 =?us-ascii?Q?KPv4YqQLtaIVkz6R6vXZgqqi0bWLbAv4uMfqebEb0Y8/m6XD1I8xSC/KG50Q?=
 =?us-ascii?Q?iUa+fcvPUs01qPPxKCD5n5yxLHP883jH5WJL+5oi1EcCYIb4jURT+sd3SZpw?=
 =?us-ascii?Q?f25Q+t1jsWUiywQuB3zEGHsSbV3foMfFGAlVZlm/AYRWiTBCc7kasQ8SyaVW?=
 =?us-ascii?Q?+WuO4Mp6OFyHhHx1ilw3g3KtGrm4rD6ubPCvQk9xEa7IcUPy4WfWTco/ShPN?=
 =?us-ascii?Q?hFgxlkVWba2cIzIXqqZo2v7by+tl92tak3pq5d2MsJGkaZUrkHrqXE14n3FR?=
 =?us-ascii?Q?AC49MjRvp1r2Zp1m6hg1ocKm1mcjcpFWPjMTsWrmFg9+CfY34jVd585DK9Cs?=
 =?us-ascii?Q?a1RhtxYPIBR4ZUIcS4xFQiNMT+0A0fLPxjeHUF6spkSoFa6ZPClWgK0UAJIp?=
 =?us-ascii?Q?H1N4vf+x8cWQt4LNna/WoWkRgJONLNbBMJFaacQpFAawaRSPraww5tqbs3fa?=
 =?us-ascii?Q?DnNTtTJpR3w4AD16lxHAZqviyzCDOUkvlopDFtq++xgDyP2+RXlAphDKyq8h?=
 =?us-ascii?Q?TJ3jG2UJxS+qm08Pfocx6pWwIQDY1FfPBMjY4JHCAcwW9wkTYFxCq4CALVv1?=
 =?us-ascii?Q?UhQN+wI+UkjQ6omrv9BgdT6GRHqdqEc4qXO3+AuLaFO1EnaXBaWC/s//HAU8?=
 =?us-ascii?Q?cPAUGRJm0WC+dYMSrFQzWwztXXVL7cPFOUoTLlhdH4U7MLMIJdVTM5Zj1yLF?=
 =?us-ascii?Q?70qt8XeN3EQQHWxVybxnN/Qw9ZiuvrxrA7FPvCdJqKqeFIoscUr/67ceyC4T?=
 =?us-ascii?Q?+9Ls86VFmZhB7iXHzUsL3I5/ioVfOLt7NVOvaWOWSeKAWX+12VEi97Kj0Iv1?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c20dd-1202-49af-2e88-08dcb7598dda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:24:04.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXyVPd1F/G8ZkjnWqvuQeT2N6IrNDKN+bjJYg7bLiYheOrHDmi9EhSee6fiYJsFDw8h2738POQfSqzMaLg7IKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
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

On Wed, Aug 07, 2024 at 06:23:32PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction of
> the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 
> v2: Improve error handling and robustness, suspend exec queues created in
>     fault mode if group in dma-fence mode, init queue link (Matt Brost)
> v3: Delete queue from hw engine group when it is destroyed by the user,
>     also clean up at the time of closing the file in case the user did
>     not destroy the queue
> v4: Use correct list when checking if empty, do not add the queue if VM
>     is in xe_vm_in_preempt_fence_mode (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  3 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c  | 55 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h  |  4 ++
>  5 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..447e9acbb570 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -37,6 +37,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
> @@ -165,6 +166,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	 * vm->lock taken during xe_exec_queue_kill().
>  	 */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		if (q->vm && q->hwe->hw_engine_group)

Incongruent with below.

> +			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 956dc15b432a..77edb20aa21c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -14,6 +14,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -73,6 +74,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->ops = gt->exec_queue_ops;
>  	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->multi_gt_link);
> +	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -190,6 +192,7 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	struct xe_exec_queue *eq, *next;
>  
>  	xe_exec_queue_last_fence_put_unlocked(q);
> +

Nit: unrelated newline.

>  	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
>  		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
>  					 multi_gt_link)
> @@ -615,6 +618,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> +		if (err)
> +			goto put_exec_queue;
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> @@ -797,6 +804,9 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>  
> +	if (q->vm)

Here is where it is incongruent.

User exec queues must have a VM too, and currently must have a
q->hwe->hw_engine_group as the GSC is not exposed to the user.

I guess if you really want be safe...

if (q->vm && q->hwe->hw_engine_group)

Or just drop it and let the asserts handle misuse.

> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..315f874426bd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
> +	struct list_head hw_engine_group_link;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 1d109c08c7a6..52e1dc78518e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -5,9 +5,12 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_group.h"
> +#include "xe_vm.h"
>  
>  static void
>  hw_engine_group_free(struct drm_device *drm, void *arg)
> @@ -100,3 +103,55 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  
>  	return err;
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
> +	xe_assert(xe, q->vm);
> +
> +	if (xe_vm_in_preempt_fence_mode(q->vm))
> +		return 0;
> +
> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> +		q->ops->suspend(q);
> +		q->ops->suspend_wait(q);

suspend_wait has a return value, best to check it and unwind on failure
even though it really shouldn't be possible to failure here. Best to not
assume it can't fail.

> +		queue_work(group->resume_wq, &group->resume_work);
> +	}
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + */
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{

Nit:
xe_assert(gt_to_xe(q->gt), group);

Matt

> +	xe_assert(gt_to_xe(q->gt), q->vm);
> +
> +	down_write(&group->mode_sem);
> +
> +	if (!list_empty(&q->hw_engine_group_link))
> +		list_del(&q->hw_engine_group_link);
> +
> +	up_write(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index c2648f87f7ef..857a83787504 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -9,8 +9,12 @@
>  #include "xe_hw_engine_group_types.h"
>  
>  struct drm_device;
> +struct xe_exec_queue;
>  struct xe_gt;
>  
>  int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
