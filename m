Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE44C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 05:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334C112161;
	Mon, 15 Apr 2024 05:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpPcVvEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537B1112161
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 05:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713158400; x=1744694400;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hLF+bI/XmWJgb8WW4U5FezQlqoR1qF3AleqHlmUE5zM=;
 b=VpPcVvEkOXRP2pvuRsw9CuZAJrlrfvpJ9kuVx4LMNndKFWXdq2jYO/J7
 Eak5qTezvC9nOFF6QdjD6DJY0sT+DBxa62hbldAwf2V9+HwrHKoFF3l8Y
 +F8+rzwLI43VYpySnEd5jXCEOecUnUqRhgKxxe0k8XCqWWhUoLvK9VCmY
 S7bFTeGRqUDG81JS47vdtUgzmDFK9XTBzzcfIMHiy80m7KcvxNzmQvQGc
 K7ziyYRG2loXpsyruR0DIo1fdzCV0WzfHqcR09EIwyIdguhK/QGwrMFEx
 0t8MDwQXzn7DrKFu5DlOC8lm6DvQw/T4bw3dA719fdU2uCdjzxJwOlKWH A==;
X-CSE-ConnectionGUID: 6BBhQdULRy+OuO7m05swVA==
X-CSE-MsgGUID: rJA3HX3ITMaLnExNsg2XrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9081587"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="9081587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 22:19:59 -0700
X-CSE-ConnectionGUID: XSxUjbMAQyiloukeWsGEGw==
X-CSE-MsgGUID: VVQB+AzmSN+JIxY7clWfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="26351711"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 22:19:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 22:19:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 22:19:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 22:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWw7/1ho8uvtCGEXZue7cNVhQcuwHi+/OAorLSahjGm+ZJPXW/tevKXrmsqQRqSyAryVmHRiKd609xeke/tL9W6O98xHAp32tuNUlhpemT7oCx+uW7T5p/reFs0+fYukeQ8zM56OJ3/1MHM7k6ezKH4qI5SQCdUnjUCDVulvtivSCDQidtcLST7Ot1cfZhJX+qbVL5X5DGyAdhy1xtbQNVrYxhptRGD8yWWy8T9gRDqa5ygNyijhi1Pq8/p4J3ZfVc3FCNVPzqJn5QF8zcyD2FeJg/HVrkz7lV7tgS/e1S4z1DfuH0/19ydKmzZCLp0i51im5szkWiRHkz27iDVBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGWf6gHEHoHB37p5A4h1UvvFb0ADnjZqvuBISMDAmd0=;
 b=HS8T8WL2r5iwdHQAHfb2mE38MXjlkKL7bcG8rIKtC7Zv07x02RamPFggM2JtwU4+Cr/3S5UN+v0wCbodu92xOZswpA1OmmH29TNEO2DAwdM8p4KkL8vrwi7+BL1rgvRbwjas+EfTcvJ6CZACVUo+J+iuGAjdYMUT3GKPeJKwcIXag+3EDEZpxWh2KvkQtdwdq8EvymmH1QVBtfWxh02eM9exo3CcQGi0/bhiouEtT1p+G+aY+VjsBwNh5qZ1wH1zs+St1EN2+s8tG6tUBpVyh/3bWIQCSElhwHOxCf47/5894/GZxrS4rInFubpPzhRjMvIYtqD4M+h+yBceJJRC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 05:19:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 05:19:54 +0000
Content-Type: multipart/alternative;
 boundary="------------K4aVfowj1krDPADsmypznX0V"
Message-ID: <3688efbc-df20-439c-8b53-7e4ae9f1b81c@intel.com>
Date: Mon, 15 Apr 2024 10:49:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe/pf: Add SR-IOV PF specific early GT
 initialization
To: <intel-xe@lists.freedesktop.org>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240414190137.1243-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PN2PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1c1c08-6d75-4f7f-a01d-08dc5d0baeff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLmuxIG/QIuZbP+ihRsvAo4TzywzSvgmSESzqqC3i+nvPCN1B8xsGFcDmXyZKVOTabJbsttc3zZ4BtVBHLVX91EG2rPh0RM5sbJUJ62Ju6dx1GPTKmOWx4oiD+HuO0+DjutDbzMq4QCWVTeXsMpKqWhNxTgHrav+eVPZHV0cDWu/8Z09/0O2aXJ3fmLYU5lJRGAgZwcWpBdo1sHRT8+eVZxNFArTEX2zgbIdQ7XxZUGCmSLGGCKUpF8i3UtPhiGmFJIHcyOAsKQUv3YvEE8HgIdAXjr9t6kUJEZg4biM0pEwhgm0RIH2xloi9dRF0HQTsJB8pnMmmYGZtjqQnB4yCNpCqinEUngRHSc2PpeSNYo8s9hyKDQj8FxTuD3snMLk60rk4aZBktx7kMIaBfu5ZK3kxpxlFeaq7zSjrYkj/ZA/r4TZhG0FqIFxF8d2tcwDw5U3NZXNBPnMbG2RD2NWADK9bsWMxf101Qp+30CrtxGfy/egruSyw7/56TdG7XPGTbglIJyuifMWU5D5Yqp4VgdmeTcRonYa4x9Hb2d6fymm1GvRIz3iqKNgr922GhYQNSmH7lirEclTf8iZJJBLjkD8FS34RnW/jKoNHF0hf+RYzEb2fGsuSst2y03BZc04wpCH35BX1PdGtUaXI6P7VxKyAw3XLFUHRd50WYFGzFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZncEpOMkFXbjBjRHl5TlZPYjNCVGtYSUJhZFcveUtPci9wUDlQbDlVMCtL?=
 =?utf-8?B?NlcyYWozUkNLbThQTjAzWFJHam9pZzV4UExleDFicG93SFF4VFQwdEZnYThr?=
 =?utf-8?B?RXlQNXA2R2ZMTlorT0pncUwvcmROTjh6alVRVWxZN1NKeHRhcVNLdU9CS2N4?=
 =?utf-8?B?SEZGTWdmaHZ4TzhUSFM3bXVPSnFVMi95QTNIdWYxWmJjRE1yS2hvQmo5emxU?=
 =?utf-8?B?RjRtZ2taUkhaSHVVTHVINWhTTlVYUVlJYjAvdEFERy9CVmpxdHliTS9VT1U4?=
 =?utf-8?B?WTdJTEsvMGFscVZjd2RMeXU3UE5rK0F6aFc3SVJnenUzZSs0SkNKQ3l5MnFY?=
 =?utf-8?B?S0RCT0w0T0d4anMrSUI2TkdYc2RNYUdtQjV6ZjZUN2JYVThYNE9kSmx3bFR1?=
 =?utf-8?B?eVQzQjRjWkNLKzh5WVlYY1VhQzBtSHNEQkNYdElNQlR6bkhyc1NNbko2ekpL?=
 =?utf-8?B?T01veTByR0VUSEh1Zk56c1AwMVZBbWRIdm04UWltMDdUTk5pcmVyQlFRMnhV?=
 =?utf-8?B?UG4rRnZ1ZERFaUEvMFFIRFFIR2lrVlRCeVZTMU15RXpldHlVRVcyS3R6Vmw3?=
 =?utf-8?B?QnZPYmhVZStham1zckZrZnByaTJoMW8vckdnUEdOM3M3K2pDLzYwQWVGZWk1?=
 =?utf-8?B?S0lXNHBYMjFKNEdaL050SU8yeE4wTnFmUGhQT0c1R28xQTZrSjhqRTB4Tkhz?=
 =?utf-8?B?eHh6UTE2Z2dLTFpQcFpDTW9Cd3cxWmcvaUlKRGpCVk45REJhQUlIbVJiVnk0?=
 =?utf-8?B?bFZLN2g0RFlHaGtjYnBIWUo5RHJMaEtMVTFhQUNvYlI1YXRjaTNUdE9Hb1ZU?=
 =?utf-8?B?WjJPckVUdTRqbUZkTGZLMFJvb0l2cVZWYi80Y3BGODM4YWY3SXV5cTVIMzJr?=
 =?utf-8?B?Z0dhcHJpWmp6aHc0UFRnQUVCZFE5MlVHVW1iMW1xcTRKZUJ1bTdodHBUcDNa?=
 =?utf-8?B?eDlNNzN0QXJFK3ZPa2J2VlMwUlR0eHdDeWF2SkxpNjFSTDNzTHpuai92YnJa?=
 =?utf-8?B?OEdEaGZFaHdBQ0o3WjBhU2M5OGJ0enB1QVBQRTlPVlp1eG84S3NPdFppaWI5?=
 =?utf-8?B?U3RNTmZyWVBwUVoza3RhU0h0bU51MUx3TlBUeEt2b0JkYUo4MzU3MElXSDRo?=
 =?utf-8?B?NTJnTS9oMm96MkJEaFFTbDVOT0t4emRmb01UdE40VWJVRU9tRDJXTGQ2RHds?=
 =?utf-8?B?VkExdUdObkttc0hQN0NQR3JheWcwN1hlK04xSVVUcmgxeXlKQVpta0VvQkhY?=
 =?utf-8?B?QzlRZHFBL2kxOFVTc29pUFhmZWVETnl2WEUvS2tVVFk2K2dockxpNmJpT09y?=
 =?utf-8?B?dUcrVGFSajIzeVJmZVM0QkJtcHBEaVZXU3RJL0JjampQajY5UVdFN0NSVmhC?=
 =?utf-8?B?NlBFdEJYRHZ2R3Bnc0Q3eDJuKzl0TXd6amJZY3NGTDA4cStoYWU2QzRxMHla?=
 =?utf-8?B?VW83UytJMVMzS2JlVVFkSi9kWEdPWm4rdDVzUjQ1Slh1RlR5M0o2eUNaKzVY?=
 =?utf-8?B?OFQxVUdRU0lPdjBXMmlLeWRLWE1uYlF4Mnl3b0dkS09TUGowOVVOczNZanR1?=
 =?utf-8?B?cS9UY3FhTHJISGlvb2tuN1VvdFBPUnRZTVpqcDV3ZmR3dVQ3ZnZ6UHZYeEdO?=
 =?utf-8?B?RkNTTWNTQzFhendWclFGbjRoTDNJZUZaMUtWNEhKdWxoSnhvaGRocm5Nd2kw?=
 =?utf-8?B?U200akJ3cHFRSnF6amVjL3dPazdVdy9sWlJtZDNwUnNvdGR4TVFpTW1VTkJL?=
 =?utf-8?B?aU01cjY5bDlCSFpsSUxCcExlcHk1VjM1KzZPTUtWMk9PN2dZbVY5MHpPNS9M?=
 =?utf-8?B?Wi9iS0tWWUVlMGkwS0RHeHQ4Y3kyVFk2Y1JwQW02cy9MN1prc3RUNTlKUXRl?=
 =?utf-8?B?K1FDamkyM0hGUXJkaGZXbDBaSnpYYWp1MU1ENk5lcHdHUUZhbHFJMGhROGlV?=
 =?utf-8?B?YmtpQnJjbmVVcUtkTWxlZ1lsMGlEQWdwM0tFL3l4Z3B4dkxNc2RRcjVhTEI4?=
 =?utf-8?B?eC9tQkc1OGE0NTNvdTltOW91WmYzRUNvOUROWlIwd0xPVmRaRElFTXNpWTlB?=
 =?utf-8?B?VVJTRUVmdld4a0FJSnVySnV0MkNGZFdrYk4wL2pXU3M4K3lKdEo0eHVpZFVt?=
 =?utf-8?B?a3hhZ3p5WHhzb1drTEd0a3ZDdTBDZnlDNzVPeWdnUHQ2Q29PY1VsdWVyanpj?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1c1c08-6d75-4f7f-a01d-08dc5d0baeff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:19:54.4761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: my+i8w3Pd8VwWOdIJfknENT2pqiGvY3ePckhi6St3aofSfKNfp4wEUTIEhqx4XayQl6wVmcvn8njhkLBrKPqiWQomI8DTYdke4x4vOKBEB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

--------------K4aVfowj1krDPADsmypznX0V
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-04-2024 00:31, Michal Wajdeczko wrote:
> The PF driver must maintain additional GT level data per each VF.
> This additional per-VF data will be added in upcoming patches and
> will include: provisioning configuration (like GGTT space or LMEM
> allocation sizes or scheduling parameters), monitoring thresholds
> and counters, and more.
>
> As number of supported VFs varies across platforms use flexible
> array where first entry will contain metadata for the PF itself
> (if such configuration parameter is applicable for the PF) and
> all remaining entries will contain data for potential VFs.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |  1 +
>   drivers/gpu/drm/xe/xe_gt.c                |  7 +++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 52 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf.h       | 20 +++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  9 ++++
>   5 files changed, 89 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c46d145606f6..daa5865a2773 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -160,6 +160,7 @@ xe-y += \
>   	xe_sriov.o
>   
>   xe-$(CONFIG_PCI_IOV) += \
> +	xe_gt_sriov_pf.o \
>   	xe_gt_sriov_pf_control.o \
>   	xe_gt_sriov_pf_policy.o \
>   	xe_lmtt.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cfa5da900461..38956b60e084 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -29,6 +29,7 @@
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_pagefault.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_pf.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_gt_topology.h"
> @@ -311,6 +312,12 @@ int xe_gt_init_early(struct xe_gt *gt)
>   {
>   	int err;
>   
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		err = xe_gt_sriov_pf_init_early(gt);
> +		if (err)
> +			return err;
> +	}
> +
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> new file mode 100644
> index 000000000000..791dcdd767e2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_gt_sriov_pf.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +
> +/*
> + * VF's metadata is maintained in the flexible array where:
> + *   - entry [0] contains metadata for the PF (only if applicable),
> + *   - entries [1..n] contain metadata for VF1..VFn::
> + *
> + *       <--------------------------- 1 + total_vfs ----------->
> + *      +-------+-------+-------+-----------------------+-------+
> + *      |   0   |   1   |   2   |                       |   n   |
> + *      +-------+-------+-------+-----------------------+-------+
> + *      |  PF   |  VF1  |  VF2  |      ...     ...      |  VFn  |
> + *      +-------+-------+-------+-----------------------+-------+
> + */
> +static int pf_alloc_metadata(struct xe_gt *gt)
> +{
> +	unsigned int num_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +
> +	gt->sriov.pf.vfs = drmm_kcalloc(&gt_to_xe(gt)->drm, 1 + num_vfs,
> +					sizeof(*gt->sriov.pf.vfs), GFP_KERNEL);
> +	if (!gt->sriov.pf.vfs)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
> + * @gt: the &xe_gt to initialize
> + *
> + * Early initialization of the PF data.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = pf_alloc_metadata(gt);
> +	if (err)
> +		return err;
> +
> +	return 0;

nit: If there's a possibility of extending this function in the future 
to accommodate other initializations, it's best to leave it as it is. 
Otherwise, return pf_alloc_metadata(gt) looks cleaner.

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> new file mode 100644
> index 000000000000..05142ffc4319
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_H_
> +#define _XE_GT_SRIOV_PF_H_
> +
> +struct xe_gt;
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
> +#else
> +static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 768277b8bc95..223f280ef748 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -10,12 +10,21 @@
>   
>   #include "xe_gt_sriov_pf_policy_types.h"
>   
> +/**
> + * struct xe_gt_sriov_metadata - GT level per-VF metadata.
> + */
> +struct xe_gt_sriov_metadata {
> +	/* XXX: VF metadata will go here */
> +};
> +
>   /**
>    * struct xe_gt_sriov_pf - GT level PF virtualization data.
>    * @policy: policy data.
> + * @vfs: metadata for all VFs.
>    */
>   struct xe_gt_sriov_pf {
>   	struct xe_gt_sriov_pf_policy policy;
> +	struct xe_gt_sriov_metadata *vfs;
>   };
>   
>   #endif
--------------K4aVfowj1krDPADsmypznX0V
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 15-04-2024 00:31, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240414190137.1243-6-michal.wajd=
eczko@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">The PF driver must maintain ad=
ditional GT level data per each VF.
This additional per-VF data will be added in upcoming patches and
will include: provisioning configuration (like GGTT space or LMEM
allocation sizes or scheduling parameters), monitoring thresholds
and counters, and more.

As number of supported VFs varies across platforms use flexible
array where first entry will contain metadata for the PF itself
(if such configuration parameter is applicable for the PF) and
all remaining entries will contain data for potential VFs.

Signed-off-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile               |  1 +
 drivers/gpu/drm/xe/xe_gt.c                |  7 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 52 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h       | 20 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  9 ++++
 5 files changed, 89 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c46d145606f6..daa5865a2773 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -160,6 +160,7 @@ xe-y +=3D \
 	xe_sriov.o
=20
 xe-$(CONFIG_PCI_IOV) +=3D \
+	xe_gt_sriov_pf.o \
 	xe_gt_sriov_pf_control.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_lmtt.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..38956b60e084 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -29,6 +29,7 @@
 #include &quot;xe_gt_mcr.h&quot;
 #include &quot;xe_gt_pagefault.h&quot;
 #include &quot;xe_gt_printk.h&quot;
+#include &quot;xe_gt_sriov_pf.h&quot;
 #include &quot;xe_gt_sysfs.h&quot;
 #include &quot;xe_gt_tlb_invalidation.h&quot;
 #include &quot;xe_gt_topology.h&quot;
@@ -311,6 +312,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
=20
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		err =3D xe_gt_sriov_pf_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt=
_sriov_pf.c
new file mode 100644
index 000000000000..791dcdd767e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2023-2024 Intel Corporation
+ */
+
+#include &lt;drm/drm_managed.h&gt;
+
+#include &quot;xe_gt_sriov_pf.h&quot;
+#include &quot;xe_gt_sriov_pf_helpers.h&quot;
+
+/*
+ * VF's metadata is maintained in the flexible array where:
+ *   - entry [0] contains metadata for the PF (only if applicable),
+ *   - entries [1..n] contain metadata for VF1..VFn::
+ *
+ *       &lt;--------------------------- 1 + total_vfs -----------&gt;
+ *      +-------+-------+-------+-----------------------+-------+
+ *      |   0   |   1   |   2   |                       |   n   |
+ *      +-------+-------+-------+-----------------------+-------+
+ *      |  PF   |  VF1  |  VF2  |      ...     ...      |  VFn  |
+ *      +-------+-------+-------+-----------------------+-------+
+ */
+static int pf_alloc_metadata(struct xe_gt *gt)
+{
+	unsigned int num_vfs =3D xe_gt_sriov_pf_get_totalvfs(gt);
+
+	gt-&gt;sriov.pf.vfs =3D drmm_kcalloc(&amp;gt_to_xe(gt)-&gt;drm, 1 + num_v=
fs,
+					sizeof(*gt-&gt;sriov.pf.vfs), GFP_KERNEL);
+	if (!gt-&gt;sriov.pf.vfs)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
+ * @gt: the &amp;xe_gt to initialize
+ *
+ * Early initialization of the PF data.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
+{
+	int err;
+
+	err =3D pf_alloc_metadata(gt);
+	if (err)
+		return err;
+
+	return 0;</pre>
    </blockquote>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">ni=
t: If there's a possibility of extending this function in the future to acc=
ommodate other initializations, it's best to leave it as it is. Otherwise, =
return </span><span style=3D"white-space: pre-wrap">pf_alloc_metadata(gt) <=
/span>looks
      cleaner.</p>
    <p>LGTM</p>
    <p>Reviewed-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray=
@intel.com&gt;</a></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240414190137.1243-6-michal.wajd=
eczko@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt=
_sriov_pf.h
new file mode 100644
index 000000000000..05142ffc4319
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright =C2=A9 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_H_
+#define _XE_GT_SRIOV_PF_H_
+
+struct xe_gt;
+
+#ifdef CONFIG_PCI_IOV
+int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
+#else
+static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
+{
+	return 0;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe=
/xe_gt_sriov_pf_types.h
index 768277b8bc95..223f280ef748 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -10,12 +10,21 @@
=20
 #include &quot;xe_gt_sriov_pf_policy_types.h&quot;
=20
+/**
+ * struct xe_gt_sriov_metadata - GT level per-VF metadata.
+ */
+struct xe_gt_sriov_metadata {
+	/* XXX: VF metadata will go here */
+};
+
 /**
  * struct xe_gt_sriov_pf - GT level PF virtualization data.
  * @policy: policy data.
+ * @vfs: metadata for all VFs.
  */
 struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_policy policy;
+	struct xe_gt_sriov_metadata *vfs;
 };
=20
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------K4aVfowj1krDPADsmypznX0V--
