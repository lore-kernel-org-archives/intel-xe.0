Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13871C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 08:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DC610EA15;
	Fri,  8 Dec 2023 08:14:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C1E10EA09
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702023291; x=1733559291;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Usu/NoI1BAmI+j1G/PkZYEZmZEU6g5l8u2DojpwNaXU=;
 b=HZJXdPOjw/yiwxIcym07IEYn58kQ9IrLvcZPwmhWGQl70kYREahZbdw3
 z4ikRa0UPgaDALjwWqxyg/Ia1vJpJwmWoXApGaYbW3/iEN9kIrrhm6pHD
 +Orzjj5JnuGqsn6P7haB+rV5T0rqitEOSUNxgBr2mSGkH29eB35qewldf
 sUwJqC8oMrMBFf8qDpMLBTL7SXl9JwsXY0l9jpLgifZUYapuR03b7IH3z
 JGbDzkrIZQfJ8Fs2J1aWIK/iXpHz///3TOTL3s5aK3x5gWHCj2H/SeVRf
 rLyo3z8hZ2btI5yZfaeqG3/oO8pEyfuX7ufkTO/itkhwbDto1NnQsqvMD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1255040"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1255040"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 00:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775723109"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775723109"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 00:14:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 00:14:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 00:14:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 00:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlKZtxWwgj030zLB1xlzkLrA6yTUEjhMt5ulNZDfT5Kt7IqfrSHU9xqnROOVvpJqnXg80tZbhfIwkzceG8gpaCwEdv8FiR7eIns0PvCisoGG/IRB53l5a0tq5fUlFg/+7zoi+mIsae11i6L6oK3vQ7OQALFC7SbarWhhik5xJqx26+py2O4eP4odlQgwAzJfYencqfKjoA6k2+C0VadNEI5AAtpAhe6TW1EoNUYGlBJEDUPAosGPke8Fi1fPyDcpbOjlpDNmdinmn/YCcsVFDyLqVLGeOW59AMTzs5Wxzu+fJJLUR/VPW6at171kN0f9OxvdCtX3et54Zn1KlmB8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWh8eS+wyxec7LXRaKueX5OW3DG5zAIh4GBualZu82E=;
 b=Bo/K5Zq0+bzNoYVQwQSJvL843qljW3yXAbrvGJ+4UJ16Up5kDPDlV3Ehfe0ueCrZj/D7akPBC/LBf8Wmb4L7SCTFGB4hhvNrpMH38tjRhAcskj9V/V4QgpMdMND/JligoJCZhMjCOn1J8er/XvYXJui557R5nvihd3WLBn/p/OdT6mcMHZMMEkqap1WiOt56zRTmGwAaB/pEBT4ZReYRL69OCaZuNPKNHqBlB4UdjNIE/PtKUb/3BRmqEWRBFWXvOvAGE6/v0LmkzFJPaLfzjoPfhynzBkXJ8EAHpig8cF/GLyfyd7tGIK7gxB5DpOQLBVHKjlK16T5RqWj4BQddjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 08:14:42 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 08:14:42 +0000
Message-ID: <70cfc033-65f3-467e-b856-56591ae8f1c8@intel.com>
Date: Fri, 8 Dec 2023 13:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add frequency throttle reasons sysfs attributes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <4b0e993f-36f3-4bce-a65e-7043c90890e3@intel.com>
 <20231208065934.881570-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20231208065934.881570-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 686030da-e2af-4891-5772-08dbf7c5baea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rI5i4j/ZKPOsa7iQG5vtmQIJSVT21n2qW+cmVrwX2pBwfUBPe0JP5bAzOw7+CzsYUKhbIqUFD0sB8FnuqmK6K/hBX70dvov0PkTPUnpSo9QA7e07n/y/OJjAKMTND9dUe1CSPBTyDWZG/CDKJ96mcRRJPqZEc3oFt9Xxi1K0qzfFMh1wfVlsIUXv9MAMiGxqTnTp1Q1hLI2Hjq2v3dcJkVOPB84Q36ViQVak9Bl8yvrT8f7xgzcvZzWsKS9bkpvEa5ojZ9oRURUu8nnCbmagAtV9l5vnlo073x2xyiVs4GMNIqzgiiYPXg41rsRF4BsDASYDwLKFeIP/1+yoYOevruy2kZRtCOLWd26VjTgqwMzcXVEj2jIq1r2IKwARIwmcXW5Yeup63QvM4LXysvBO+bn4B7erD9MbZwwtQP2QpcTHcX09Lz3XbaX0/k/6QAdcsHIWXZUyyjZHUykP9NGugB9hKx86zQCaZIOnTOkOpco899Aue4mXCnVQxIl4SrEPWGcu/LZC4qsUfjCjxHJ2KT0Y3UAWM6hEM4HrC/ziWvRGfzV014ZwMTsJZOJbEvZh40ZrdR8patojQokQTbMLkln1Tn/FLfZ6jzsLntzbXJbl+Fbk7f+hyJMV3BEfdN3mIBLFB+KMX+/1fqFvZDs7ckBO8Tr28ZYLNq4pSJ4fynUcYqyZ1XBFVSgesDaE47X9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(6506007)(6512007)(26005)(2616005)(6666004)(86362001)(82960400001)(31696002)(36756003)(38100700002)(41300700001)(8676002)(30864003)(5660300002)(8936002)(83380400001)(316002)(66476007)(66946007)(66556008)(2906002)(478600001)(6486002)(53546011)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjdxS2VUMmlyeXBqakp2V09JeHZTc011b0JTd0VVRzMyNCtZMnJyT3hoSndl?=
 =?utf-8?B?V1VNWllocHo0MjVwYnlWU3JsVmNyM1RnbGVKNVZ4TVhNL1A0NklQQmw3bm5N?=
 =?utf-8?B?NGl5SnVmdG5mYVY5a2V2K2Q3RjdIVG5ZcVJzdUM5dldhOEVPdzN5ck9sYy9G?=
 =?utf-8?B?SHhUSEZvYkREM3N6MzNTSWdPYVNsUFpLRXlHVnFTNEpkeGpmeEtDNzNXTU54?=
 =?utf-8?B?bVlWOVQrZHE4Y3ZVeWFFRDVLM3p0YlZmNW1QMDNMZXNNMmNadU82alVxYUdX?=
 =?utf-8?B?VmF3aFNWRTlvNXhZWjdEWjJaL0loR1ZZcUdvR0NQakh0Z0J0MEYxRTJnOWI3?=
 =?utf-8?B?VWw4M0U1KzZMSjFzcTZTQmVpTHc1dUFjNGZHVHVRcm5VcU1UQXNBRmxVTERu?=
 =?utf-8?B?eGsvUU1kWW5Sa24yTytFa1drRGhLMnp5bUpWWHpkWXNzWjJKZVlKV3NrMEtz?=
 =?utf-8?B?SDZ5aFpYdmpXUy9NMkMvUGVnaWI4cTc2T0NqUmRWbTJBWEtCYm1rSklmOG8w?=
 =?utf-8?B?RFJaWXVzS0ZVT3BGU2k4Q2RSRjZUNHA4Q2Q2Wlg5Snp4bVlvN0RPUlFxSjB5?=
 =?utf-8?B?dzl4SFF0VkR1aXp2WitDSFNrV3lQRlE2MjI2anFBRmZRVmhCMkNrcEFPa3c4?=
 =?utf-8?B?NURtbjI2bkNQeWV2WitrOVhHbFNCZ2t5QmZHSzlmNkNQSkV0QXl6bmdmUDRK?=
 =?utf-8?B?T1U3bTFuT09Cdy9nbWd5eVcwSzJNTCtrZGx0YkNtSW9YcTNTTEE1dXFkOVJs?=
 =?utf-8?B?NlpSNEcyMVowTk85VlVEVlNUZlNIOWFFR0loMTJvakN0WDVTQkVXaXloYU41?=
 =?utf-8?B?MTV3cVBuYnRUZ1MxelRRakJjb3FCZGx0Y09Ud2lxWFZNYXg3UEw4SGNqVDF2?=
 =?utf-8?B?Mlo1RTM5WkxHMElucGtLaThZM1kvRjhHZC9hMDdPaXg0SzU0WXg1T1Z5bXB0?=
 =?utf-8?B?MVdaN1NDWEdqbHA4K1Q4QVNvc0lQVTRJTXdHb3hFeFhkdHJ4Tk5JR3FHZVFw?=
 =?utf-8?B?NkJuVk5yYzErNFRMcW1IeTNUQ2kweGtmNU1CdEI5TWRwekFCZ0x0N2p4aEIz?=
 =?utf-8?B?U29DM3pqdWFxL3FOcFhsSWJTUFAwaVo3KzlHdGlYclBPbml1SWZFakNTS01x?=
 =?utf-8?B?SGxyZ2RVMkJTM3AzUm9TV1BCeEVOSFhSeFAxVk9vbFFiQk05dlVwTnVZZTh1?=
 =?utf-8?B?QzVQelIvQ3FRQkMvSEF1RUprTyt6UDZ4OUdCMDQrWHpZLzdkQkhmcEIzcW5C?=
 =?utf-8?B?UENreWZwM0FXeUEwbmh2SW5HZnk5WTlNR2V2YU5OTlMvSmk5QjliUlB0Y1pq?=
 =?utf-8?B?VVd5T3gwSlIrSzN3ZENXN0ZpdHFLNE9MSVBOVytqeFMwbmNoZ1NMaXRTaGVY?=
 =?utf-8?B?Sjh6cFUweWNDK2RpaG95Z25YelIrcnJYMGV2NXY1UHE3WFkyWUlweHE5SVlk?=
 =?utf-8?B?TWk5Q0dCU3U5b21SN0lJYmhOS3hXb080SnM0VmR5TGtvdm04QkZkYmtrclB1?=
 =?utf-8?B?cy9ZbGhrc0NydllkbzFDM0NDREg5dGc0a3lDSzhhbmdZa3ZMRndoKzRYRXYw?=
 =?utf-8?B?U0ppZHgrcUxZZEloWklMWUk5Ylp6K0lzQ211bFpqSGZIOGVDOFpMMHNtVlY2?=
 =?utf-8?B?VmtkV1dvZnE4Q0ZXdkNQRVJKZHVsaXRub05YaUxld2xidU5PY1lvTXJ0Z1F5?=
 =?utf-8?B?eThnbkRoUTlCWU1BTUZ3NHp4cGEvWEtyVWVLaUxiN0psVi9yMm8rUzEvRnlJ?=
 =?utf-8?B?NlN2bytTbmhOMHNzai9odDFnRTFIcGJGUmpJaWpoODR4dnN0a3lYNnNTb2Ev?=
 =?utf-8?B?V0F2ZC8xU0wwZzhQbHVINWoySWJpUHRCb0JhVTV0bk51TzErcTJnMTF0Z1pM?=
 =?utf-8?B?aXJVTk5DUXFqcVd5NS9xYmpGRFMzRFV3bllLTHFzZUdlSCtHdTdoWW5RZHdT?=
 =?utf-8?B?bHg5Y01qWG1HZmo0RStxMEYwRFBMN1JQOXd3dGpwM0M4bFIzQ0RhamRNVXg4?=
 =?utf-8?B?Rm1OWVppVmtZVTZERTBkamtQL1hVK3NIQlRwWGI1WXl0ZmQ2cFVzMjJtVVh1?=
 =?utf-8?B?QWpwcHRwMjhXMUNYNzdqem0zTHNjVnZFUzFNR2U0bnZZQlUxNEhqaTVjL3pW?=
 =?utf-8?B?bWF1OUtPalVVK2FXMWpQUXhHdHVyREI5VnVHMCtmeGUxazM5NXA0NjlpQmJj?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 686030da-e2af-4891-5772-08dbf7c5baea
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 08:14:42.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WU0JTx7CSr0bYWXZkY1MnRNfZ4Es87/kin+NrTAsV5XObL136OtjK8M6/SVTJQZa2zK47RveRtQ3vkoEKmqhYHrSK2kiw005qxxj2NHfJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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

Hi Rodrigo,

Riana has already added here r-b to this patch in the previous version.

I think that was missed here.

Thanks,

Suja

On 12/8/2023 12:29 PM, Rodrigo Vivi wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>
> Add throttle reasons sysfs attributes under a separate directory.
>
> /device/tile<n>/gt<n>/freq0/throttle
> 			|- reason_pl1
> 			|- reason_pl2
> 			|- reason_pl4
> 			|- reason_prochot
> 			|- reason_ratl
> 			|- reason_vr_tdc
> 			|- reason_vr_thermalert
> 			|- status
>
> v2: Remove unnecessary headers and clean-up action (Riana)
>
> v3: - Add missing 'tile#/' to the doc (Riana)
>      - Add missing documentation (Riana)
>      - Remove extra line in header (Riana)
>      - Remove extra header inclusion missed on v2 (Rodrigo).
>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  13 ++
>   5 files changed, 286 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 232627e0946e..d35548e437f0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -78,6 +78,7 @@ xe-y += xe_bb.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>   	xe_gt_tlb_invalidation.o \
>   	xe_gt_topology.o \
>   	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9744ed0be3a5..5f5a72e9d0d8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -478,4 +478,16 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 2c3830d0e9e5..08eabcafe7bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -13,6 +13,7 @@
>   
>   #include "xe_device_types.h"
>   #include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
>   #include "xe_guc_pc.h"
>   
>   /**
> @@ -213,4 +214,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
>   	if (err)
>   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>   			 kobject_name(gt->freq), err);
> +
> +	xe_gt_throttle_sysfs_init(gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..c2e420b83e35
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/tile#/gt#/freq0/throttle/status - Overall status
> + * device/tile#/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/tile#/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/tile#/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/tile#/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/tile#/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/tile#/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/tile#/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/tile#/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static struct xe_gt *
> +dev_to_gt(struct device *dev)
> +{
> +	return kobj_to_gt(dev->kobj.parent);
> +}
> +
> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +static u32 read_status(struct xe_gt *gt)
> +{
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +static u32 read_reason_pl1(struct xe_gt *gt)
> +{
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +static u32 read_reason_pl2(struct xe_gt *gt)
> +{
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +static u32 read_reason_pl4(struct xe_gt *gt)
> +{
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +static u32 read_reason_thermal(struct xe_gt *gt)
> +{
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +static u32 read_reason_prochot(struct xe_gt *gt)
> +{
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +static u32 read_reason_ratl(struct xe_gt *gt)
> +{
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> +{
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> +{
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool status = !!read_status(gt);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl1 = !!read_reason_pl1(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl2 = !!read_reason_pl2(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl4 = !!read_reason_pl4(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermal = !!read_reason_thermal(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool prochot = !!read_reason_prochot(gt);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool ratl = !!read_reason_ratl(gt);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermalert = !!read_reason_vr_thermalert(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group throttle_group_attrs = {
> +	.name = "throttle",
> +	.attrs = throttle_attrs,
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> +}
> +
> +/**
> + * xe_gt_throttle_sysfs_init - Initialize throttle reasons sysfs
> + * @gt: Xe GT object
> + *
> + * It needs to be initialized after or along with GT Freq.
> + */
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> +	if (err) {
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..9f545938f679
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +struct xe_gt;
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
