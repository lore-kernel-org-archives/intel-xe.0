Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B48C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 23:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907810E06B;
	Mon, 20 Mar 2023 23:52:15 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5E910E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 23:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679356333; x=1710892333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tIbSJpr7gwXrz0cAKtsTzVMv6LxPken6iwIY/dg/DH8=;
 b=bFK460wBBRhknBZsWMBcN3fbsS2e8wTwWsdBgdxm9p7rttlrSuuHqVTT
 JT6/37hc334Fn1rM4BInu66ZeLQlMz6+JVgmtKs5vqfmTz1nezFTRUhnL
 yMgydtc05jfi2A3Z4GQ0Ii9r8lWitE6Oa2k+pGQ301fkybB0koRBgJqye
 nAeypizACc22dpgtZnmpyfdjgR+6Y4Hhrgx1KtnxoWHHGVKSUsBZNYXYs
 HzoN+NPs03oZKFEpa0oxW05ykbWtgtkuiVUqlCXL3hEI3ZaofWVu/T85h
 FCjyhg7ehRTQPeYJcQ5njwYZReOKBukzRtgaNOrW3UJWEobS/5vOUHtOv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401379329"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="401379329"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 16:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658558346"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="658558346"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 16:52:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 16:52:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 16:52:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 16:52:12 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 16:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiRUkdrsFXuFNx/FzmWBLmQpuAFUcsSQdJfeINGFzfb9Y1DnTqWoSvTDweIkuDA3h8Z0E0lvUDGOlkeM8KJWeFhacY5c/lYvRs7DmhjmgIvhcsl8T7bxzahOoTqS8zZCyYcxfkh01uLoZ07ltHHH+wHdIZthHEleXf3vOo0p/pCZ+BoFLk9H7eMAbXNHqjqAea0ukZkuvB3fnIWBc9uEOcNz3VJD6boVY5y6eYBKtkpmFbJRZ6AUDz0aRECsJ4AmpeOA45UuRPLpclsvpgzRCVoxISWEweo8TYTl17hUUrM+Q+OQBm2Qyo3k8u/I5J4rtjoomwLbOiqwhUCpS5lS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbzAfRLQS98g6ja3AG0nO+96TvR3PFbNRwjRWo1+oWI=;
 b=B9TiQ82237J/NflsNLqyQMxl6nEcukReXHI96JhzoeR95vtYGTvK7mTkb/siDAmt29lIENG87WAQu1A8EgdY6fZa1o+fJ+nCHrkqjvRqpqp+2LUyDbNHijBEdq2PMiK5IZBpSWBD1ZoOEjVUqeo538S0aWn5UTp0/WAaOrGNv9brwVtImHDa67c1TS6aMM2slB/IGGzNrafrZRBchyDioBVDI19kxpVtughiF7wfuPzxSlQ1CM2yd88jCEOIwkgWsF5T8ePnv6OyOdPm0K2RoqwMjK2nzgxSrejYrGszmjXMvMDWEy5QeBcC2+6nnnunqaE3U6XOOKfAtb6DjljIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 23:52:10 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 23:52:10 +0000
Message-ID: <d11de171-e7e1-a125-5265-83a913b7e23f@intel.com>
Date: Tue, 21 Mar 2023 01:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230320151334.60302-1-matthew.auld@intel.com>
 <20230320151334.60302-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230320151334.60302-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::19) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: edd84ba4-4284-4aad-4475-08db299e1e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2AWzVr80c15Sifk8aAuH1ZZ++WwM74/dNQzYzBL2c3oAc8/xV+lyGq7CIZcC5VEsF8ebxGJkBWr3b42PrPGuUmowO4cp92Ko03RBn7l/oJ8I7Rr7Oey4YDfZau6Q3fQR6IfnUV/Wt4P41HrhESXxIJWNiroVesux9w+X3CzlavzmQxCDuMPzKOPRhrRelWR9k60fToODx7hLL4Nj78RTf57d9pdVB2RqVv/EyM5xVQENDzfyNYihKwhdie0wtTXBWTr2IOicy91tlJGi+s+/ro4URZW5YAUWeDOX5sAIEBszqHLkGXBxC1KgnqOVWp9w5JPqc8uHPsPXqcBbj6+TYODLiv1eeTM2CvzFkl30s1udg1Jbo16yL6KSCSuTV08XJSUGadilsFBtF64wuB+3K1e9KZKcEKTZOPaRl4gZ9n67HT6dFumGEe2hLJlmRHzYophr8N4ba+dzwmAGt1pFisq0fWBKrNKmUVke2QG+AUMO3T7D9KEav1V3Hv8frPAVsnK4rgVfr03FWxAcOw+DmQ8c6/y9vSzToRwzCh7PJ/R2CHSc+7Zj3D1wB7VOGzRWDTOTS72zDlP0DZWktw48it48xRRr3SnZzECKLwBoTQUdMxxPGHibVlFhtY8Se9fwkZlH6yyK6I4uDH4ijRCJtWh6Ptef/2ganMNyW73FwwzKiFNZTMzwBdMj2pgpWrk3Vu5OhAOCwoCu8oqiTfGXXcEKX5sidFlDKlmeTbtMzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(38100700002)(86362001)(36756003)(31696002)(6506007)(82960400001)(4326008)(5660300002)(30864003)(2906002)(66476007)(66556008)(8936002)(66946007)(41300700001)(26005)(2616005)(186003)(66574015)(83380400001)(6486002)(316002)(54906003)(6512007)(6666004)(53546011)(478600001)(31686004)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFXTWFnclhBcjNmZVRSdUp4UHFCcDhoY1Q0RHpydUF1S3NEN3ZxNitjUDdm?=
 =?utf-8?B?d3UvSmVyU09rTTN4VXRFYmpxa0JtaGxaMm1DaUlIWWZ6MzJqdm1MRVVkMkoy?=
 =?utf-8?B?SWxLUFlITmxaQVBBZlBnQlJKaGR2Q2F1YnJYTGdVR1EvNlRSR1EraCtoS3pR?=
 =?utf-8?B?ZGF5VW5XNjE1TWd0UTkwZytqQkdIOHVqdElwTmpOWlhkUnRQZkpuUTRicWFG?=
 =?utf-8?B?NVNhc25GZnBkTnVDUVpmL0pMRmc1RlJaTjBFc2c2T29OLzZCVitGN0wydWhm?=
 =?utf-8?B?NEw1MzNLSmd3cW1BMVhIVlpDV3dmbjFoczJEVHhsblVNMVdtSno4Ym5rQjRt?=
 =?utf-8?B?MEFNc3VTMGRwTTE5WEppQVBRVVlRYmk2MXJZQXQ4UU0wVytSb2p4Y3NPa2Uz?=
 =?utf-8?B?WDhpS1B3TzRSYk5xemh4UGY2eVNrYlYyN2JOVlVjRkF3Ukthc1hHa0ljaGRn?=
 =?utf-8?B?TXBCQmhKTVo3VEsyM1NPTFd2VWRVN0JqM0F4MVFLTGNNb281dWw1aGFBampS?=
 =?utf-8?B?dmhYOEI3WkJMTUk5bmlicFRubVVPVEw1TmtaQWd1OVBuL0ltdmRzeUpQQzlI?=
 =?utf-8?B?Q1M5NTdQV3NsQ3JkUnA0VEdGc0p0MnZtb1hCZE5zRFArTU45L2pDN1ByVzFv?=
 =?utf-8?B?YmViaXQvUXAwWWZEOFVYQWJTUnhPYlkwRG5OMXNndWI3Y0RNN2F1TFJySk5q?=
 =?utf-8?B?dVNueUs4UWM1bWRySzZNYlhSenFPSG5vNWtuUzRqckdybzZ6a200QmRhcHMy?=
 =?utf-8?B?WkFWeDZSbGxNT1FCbkVtZm1oeTdqTllXd1o2UXZVRlRWOVNsUmVING1FVCts?=
 =?utf-8?B?QW9uZklSV3ArbWVjbGxuNmdEQ0QvZ2dXYUVCRjdNWGhOREtndCtuKzlIVEZD?=
 =?utf-8?B?aXI5R0YyVG1SVE83QkxHdm80UmdMMTVlZkszL1NHQnl0ZWlaN1E3dGVYbTFr?=
 =?utf-8?B?WVJWTXFpVDVZN0taTDdXSUpnck5MSm5XaGJ1Y1N5QkF5UzIwM3AyYlhXSzRG?=
 =?utf-8?B?ZlJYdS9TaUtsazZKRFRCSzJHWjVVSlpaZ21uZm96ZnJnZlFvU2EzMFIyaVFS?=
 =?utf-8?B?ZEpHWDh2WDRsclpWRnJ5bnMwVmhLeVBFVXBrV2VYMUVzWmg1SnVnUXQ5Q1o4?=
 =?utf-8?B?Zzc0TW5MVE5UN0JSTTBidjkzUlJIditEdVg4encrQ25oVFVIWXVvNzV3cXI1?=
 =?utf-8?B?bU94bnBsMEltYU5Ganlqd2wzMkg3dGJwL2pnL25qS3RLOW02K1dxOUo1T2xm?=
 =?utf-8?B?OXluOTVOQUpOR0NnbHkvWVI3UXREQkJGVWRrTzdFaVFOU291dVN0U0NaRmx4?=
 =?utf-8?B?ZkJvUnVyVkRNNDlRRWg3aVNpb1dtdjBNUjNSeGVWNFZ5NzExVytkWFhmNTVU?=
 =?utf-8?B?bmc4K3hMTUIwak9CWXJMbHJhWTJNdG1YQll1ejhhdWQ3Y0MwK3pzQ1pNSVVi?=
 =?utf-8?B?cDAzYldFOUJLb2o5WjBVV2JnNmFpd29qQVFHalUvaWRmN0lqQ0N3RjVoR3Bz?=
 =?utf-8?B?N0YwK1hqdi93dVFlSG5ldk1BQVZxMDRKVm94ZE03TXpkNXJVUmg0UndoZmsr?=
 =?utf-8?B?bEttWjk1Uzd5dk05ZWZnZVhKYlR1eFMvUFdabjFqWVFUUFZSVVgyV3lJZHNv?=
 =?utf-8?B?OWhCVS8zV1RKd1BtZHZySnlqeTRsSXBybXdnUHpLZDlOVWZIUnJuZHQ4MGE5?=
 =?utf-8?B?anlGbVVWNGNpT0l5WVhiRXJyUm9ZZTVobVhYY2ZKY0thQ0w5ZjhrTEFZT0t5?=
 =?utf-8?B?WmlrVEtzN1AxUXpmMzZNemxuNm1IWG1BRlY3Mnh1Nm1xN3VIRFhoVW1MVVZm?=
 =?utf-8?B?TEdNZ2dxOHdLOHZPS0lQNk1VZ2s1M2pUcXE3QWdYQzNIdUpMQ2RrRmowcDIx?=
 =?utf-8?B?ZmdIZ29ROFBGblZTOEpzMjIwWmRPSTFoN3VRNkFraUsvNGRLdCtrUzV3WXEx?=
 =?utf-8?B?TkY3cmF1aSs3NkFSQU9yWklWdE1vUHdnN3NDTDFMUURhYVVRTmRJcVpnL1cy?=
 =?utf-8?B?MXZwN1l2c3dCeXNwQnFjWlpDelB4NEx1dUZaaGMzUjN1eVg2cDdUaWpJRUFi?=
 =?utf-8?B?SUl5VEQ0TmR4M3ZpbTRrK29TRnJaVGFQZmhacDVFTjlZZGpDZFdKZVBpSXpp?=
 =?utf-8?B?ZFZvTDJDMVBWSGZKMWtEQXJkMEowSC9ZcTdtUi9OVkRFZ292Rk9mcXNMSzFN?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edd84ba4-4284-4aad-4475-08db299e1e2c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 23:52:09.4075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0tsNEvQnzkGlWTuoT3GFqR/brSTPeKULEb9y/P+/I+EUwtVoDgdPiR90uPqGAa3i193DsTTh53REogMI5EVdaUUj7mZLt/QRwGtrG2/bD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 3/20/23 5:13 PM, Matthew Auld wrote:
> Replace the allocation code with the i915 version. This simplifies the
> code a little, and importantly we get the accounting at the mgr level,
> which is useful for debug (and maybe userspace), plus per resource
> tracking so we can easily check if a resource is using one or pages in
> the mappable part of vram (useful for eviction), or if the resource is
> completely within the mappable portion (useful for checking if the
> resource can be safely CPU mapped).
> 
> v2: Fix missing PAGE_SHIFT
> v3: (Gwan-gyeong Mun)
>    - Fix incorrect usage of ilog2(mm.chunk_size).
>    - Fix calculation when checking for impossible allocation sizes, also
>      check much earlier.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 197 ++++++++++-----------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>   4 files changed, 115 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9629b1a677f2..31887fec1073 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -135,7 +135,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   {
>   	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	u64 stolen_size, pgsize;
> +	u64 stolen_size, io_size, pgsize;
>   	int err;
>   
>   	if (IS_DGFX(xe))
> @@ -154,7 +154,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	if (pgsize < PAGE_SIZE)
>   		pgsize = PAGE_SIZE;
>   
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
> +	/*
> +	 * We don't try to attempt partial visible support for stolen vram,
> +	 * since stolen is always at the end of vram, and the BAR size is pretty
> +	 * much always 256M, with small-bar.
> +	 */
> +	io_size = 0;
> +	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> +		io_size = stolen_size;
> +
> +	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> +				     io_size, pgsize);
>   	if (err) {
>   		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>   		return;
> @@ -163,8 +173,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>   		    stolen_size);
>   
> -	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> -		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> +	if (io_size)
> +		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>   }
>   
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index bafcadaed6b0..44c070bf969f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -49,45 +49,29 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	u64 max_bytes, cur_size, min_block_size;
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct xe_ttm_vram_mgr_resource *vres;
> -	u64 size, remaining_size, lpfn, fpfn;
>   	struct drm_buddy *mm = &mgr->mm;
> -	unsigned long pages_per_block;
> -	int r;
> -
> -	lpfn = (u64)place->lpfn << PAGE_SHIFT;
> -	if (!lpfn || lpfn > man->size)
> -		lpfn = man->size;
> +	u64 size, remaining_size, min_page_size;
> +	unsigned long lpfn;
> +	int err;
>   
> -	fpfn = (u64)place->fpfn << PAGE_SHIFT;
> +	lpfn = place->lpfn;
> +	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
> +		lpfn = man->size >> PAGE_SHIFT;
>   
> -	max_bytes = mgr->manager.size;
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		pages_per_block = ~0ul;
> -	} else {
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -		pages_per_block = HPAGE_PMD_NR;
> -#else
> -		/* default to 2MB */
> -		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
> -#endif
> -
> -		pages_per_block = max_t(uint32_t, pages_per_block,
> -					tbo->page_alignment);
> -	}
> +	if (tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
> +		return -E2BIG; /* don't trigger eviction for the impossible */
>   
>   	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>   	if (!vres)
>   		return -ENOMEM;
>   
>   	ttm_resource_init(tbo, place, &vres->base);
> -	remaining_size = vres->base.size;
>   
>   	/* bail out quickly if there's likely not enough VRAM for this BO */
> -	if (ttm_resource_manager_usage(man) > max_bytes) {
> -		r = -ENOSPC;
> +	if (ttm_resource_manager_usage(man) > man->size) {
> +		err = -ENOSPC;
>   		goto error_fini;
>   	}
>   
> @@ -96,95 +80,86 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> -	if (fpfn || lpfn != man->size)
> -		/* Allocate blocks in desired range */
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> +	XE_BUG_ON(!vres->base.size);
> +	size = vres->base.size;
> +
> +	min_page_size = mgr->default_page_size;
> +	if (tbo->page_alignment)
> +		min_page_size = tbo->page_alignment << PAGE_SHIFT;
> +
> +	XE_BUG_ON(min_page_size < mm->chunk_size);
> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
> +	XE_BUG_ON(size > SZ_2G &&
> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
> +
> +	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
> +	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
> +		size = roundup_pow_of_two(size);
> +		min_page_size = size;
> +
> +		pages = size >> PAGE_SHIFT;
> +		if (pages > lpfn)
> +			lpfn = pages;
Hi Matt,

Is the purpose of this routine to pre-increase the size due to the 
"buddy only accepts a power-of-two size for block sizes" constraint?
If so, shouldn't it be compared in the form below to respond to the case 
of DRM_BUDDY_RANGE_ALLOCATION?

if (pages + place->fpfn  > lpfn)
	lpfn = pages + place->fpfn;

Br,

G.G.

> +	}
> +
>   	mutex_lock(&mgr->lock);
> -	while (remaining_size) {
> -		if (tbo->page_alignment)
> -			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> -		else
> -			min_block_size = mgr->default_page_size;
> -
> -		XE_BUG_ON(min_block_size < mm->chunk_size);
> -
> -		/* Limit maximum size to 2GiB due to SG table limitations */
> -		size = min(remaining_size, 2ULL << 30);
> -
> -		if (size >= pages_per_block << PAGE_SHIFT)
> -			min_block_size = pages_per_block << PAGE_SHIFT;
> -
> -		cur_size = size;
> -
> -		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
> -			/*
> -			 * Except for actual range allocation, modify the size and
> -			 * min_block_size conforming to continuous flag enablement
> -			 */
> -			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -				size = roundup_pow_of_two(size);
> -				min_block_size = size;
> -			/*
> -			 * Modify the size value if size is not
> -			 * aligned with min_block_size
> -			 */
> -			} else if (!IS_ALIGNED(size, min_block_size)) {
> -				size = round_up(size, min_block_size);
> -			}
> -		}
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
> +		mutex_unlock(&mgr->lock);
> +		err = -ENOSPC;
> +		goto error_fini;
> +	}
>   
> -		r = drm_buddy_alloc_blocks(mm, fpfn,
> -					   lpfn,
> -					   size,
> -					   min_block_size,
> -					   &vres->blocks,
> -					   vres->flags);
> -		if (unlikely(r))
> +	remaining_size = size;
> +	do {
> +		/*
> +		 * Limit maximum size to 2GiB due to SG table limitations.
> +		 * FIXME: Should maybe be handled as part of sg construction.
> +		 */
> +		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> +
> +		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					     (u64)lpfn << PAGE_SHIFT,
> +					     alloc_size,
> +					     min_page_size,
> +					     &vres->blocks,
> +					     vres->flags);
> +		if (err)
>   			goto error_free_blocks;
>   
> -		if (size > remaining_size)
> -			remaining_size = 0;
> -		else
> -			remaining_size -= size;
> +		remaining_size -= alloc_size;
> +	} while (remaining_size);
> +
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +			size = vres->base.size;
>   	}
> -	mutex_unlock(&mgr->lock);
>   
> -	if (cur_size != size) {
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
> +		vres->used_visible_size = size;
> +	} else {
>   		struct drm_buddy_block *block;
> -		struct list_head *trim_list;
> -		u64 original_size;
> -		LIST_HEAD(temp);
>   
> -		trim_list = &vres->blocks;
> -		original_size = vres->base.size;
> +		list_for_each_entry(block, &vres->blocks, link) {
> +			u64 start = drm_buddy_block_offset(block);
>   
> -		/*
> -		 * If size value is rounded up to min_block_size, trim the last
> -		 * block to the required size
> -		 */
> -		if (!list_is_singular(&vres->blocks)) {
> -			block = list_last_entry(&vres->blocks, typeof(*block), link);
> -			list_move_tail(&block->link, &temp);
> -			trim_list = &temp;
> -			/*
> -			 * Compute the original_size value by subtracting the
> -			 * last block size with (aligned size - original size)
> -			 */
> -			original_size = drm_buddy_block_size(mm, block) -
> -				(size - cur_size);
> -		}
> +			if (start < mgr->visible_size) {
> +				u64 end = start + drm_buddy_block_size(mm, block);
>   
> -		mutex_lock(&mgr->lock);
> -		drm_buddy_block_trim(mm,
> -				     original_size,
> -				     trim_list);
> -		mutex_unlock(&mgr->lock);
> -
> -		if (!list_empty(&temp))
> -			list_splice_tail(trim_list, &vres->blocks);
> +				vres->used_visible_size +=
> +					min(end, mgr->visible_size) - start;
> +			}
> +		}
>   	}
>   
> +	mgr->visible_avail -= vres->used_visible_size;
> +	mutex_unlock(&mgr->lock);
> +
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>   	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>   		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> @@ -213,7 +188,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	ttm_resource_fini(man, &vres->base);
>   	kfree(vres);
>   
> -	return r;
> +	return err;
>   }
>   
>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> @@ -226,6 +201,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	mutex_lock(&mgr->lock);
>   	drm_buddy_free_list(mm, &vres->blocks);
> +	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_fini(man, res);
> @@ -240,6 +216,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +	drm_printf(printer, "visible_avail: %lluMiB\n",
> +		   (u64)mgr->visible_avail >> 20);
> +	drm_printf(printer, "visible_size: %lluMiB\n",
> +		   (u64)mgr->visible_size >> 20);
> +
>   	drm_buddy_print(mm, printer);
>   	mutex_unlock(&mgr->lock);
>   	drm_printf(printer, "man size:%llu\n", man->size);
> @@ -262,6 +245,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>   
> +	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> +
>   	drm_buddy_fini(&mgr->mm);
>   
>   	ttm_resource_manager_cleanup(&mgr->manager);
> @@ -270,7 +255,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   }
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size)
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size)
>   {
>   	struct ttm_resource_manager *man = &mgr->manager;
>   	int err;
> @@ -279,6 +265,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	mgr->mem_type = mem_type;
>   	mutex_init(&mgr->lock);
>   	mgr->default_page_size = default_page_size;
> +	mgr->visible_size = io_size;
> +	mgr->visible_avail = io_size;
>   
>   	ttm_resource_manager_init(man, &xe->ttm, size);
>   	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> @@ -298,7 +286,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
>   	mgr->gt = gt;
>   
>   	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
> -				      gt->mem.vram.size, PAGE_SIZE);
> +				      gt->mem.vram.size, gt->mem.vram.io_size,
> +				      PAGE_SIZE);
>   }
>   
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 78f332d26224..35e5367a79fb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -13,7 +13,8 @@ struct xe_device;
>   struct xe_gt;
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size);
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size);
>   int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   			      struct ttm_resource *res,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 39aa2ec1b968..3d9417ff7434 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct drm_buddy mm;
> +	/** @visible_size: Proped size of the CPU visible portion */
> +	u64 visible_size;
> +	/** @visible_avail: CPU visible portion still unallocated */
> +	u64 visible_avail;
>   	/** @default_page_size: default page size */
>   	u64 default_page_size;
>   	/** @lock: protects allocations of VRAM */
> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>   	struct ttm_resource base;
>   	/** @blocks: list of DRM buddy blocks */
>   	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
>   	/** @flags: flags associated with the resource */
>   	unsigned long flags;
>   };
