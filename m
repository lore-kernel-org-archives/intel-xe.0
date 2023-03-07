Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55760C678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 08:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3253510E380;
	Tue,  7 Mar 2023 08:11:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9921710E380
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678176680; x=1709712680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tyPnYHYO1GZVAr6O96rfECfbYpfKEuorfovd3UKayVQ=;
 b=HIstjl3c9hW7cNYQ6rY2PIuJXtYQLZQ+CmNiuif4J59qmZEx0uILAQej
 aQ9+Ki1rrvl2TIAkFwr5IiklcUna8NQE1U14cIJAoZTjO3pagGfMGjf+s
 IS41ZFBxUeOd7DwNnniBAEcZBcSL+G1tLCGyVhXvQ37dP4rrX7KNLCwZP
 wD21oQudA0yZjtgeimbLD+QzWTNFz4OGsecnSKaCeOdJJVUTKtwwqtXCw
 y/f4Q4meCoa1eplXpuAMMvZnz1rZ/yOCmAiqas+nnB7cixNVJthHJqsnp
 VpSlLDN74RUjmU8rx5iLp0HNbXjQa9e0AmZCiC2aSPYu1X2gTmfnap3ou w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334507850"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="334507850"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 00:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850603869"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="850603869"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 07 Mar 2023 00:11:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 00:11:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 00:11:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 00:11:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 00:11:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byOg1PEe4+cLq3gvewMp2l/bQFGTbo1hYwOA7o0dU95djkUgDYosjj940x0UVvz17S4V2SzrybCijjY6gthJHxCcYMk/Z/URMYEGiNMLjCn7JQRZBOsCLQnXBSAzvsKJf5xmXkwOd36ip/xE2G9+hkjcFvlkDd1IlgA9atwq2OKw5kbF1XHv4P0OXc/8IJvGtR1GHDe2mYwmtUqWeHM/wzEozGt1wpxpqdMchGdSAJzCUAiVbQ0VO6phyAK5zCiOo01glcwM8QoSREkHfVkI2zBfdUe3pJiWN7L/lTit+sgVSZ36dvuu7YNtLxklMd2OGwTU0k1CFSuL5fN1E0IatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKrBl23Muo0LeR8//tQBVGoqUPnrwYsYkQQzZcQg/iE=;
 b=eOZG7akeSZvnDT0cD6hnKoevaxFIkZiQ+dY2vljRgB2Z80QuE5xc9N7F1bYaYrr7h1K5BepFAtmNzji37NwQKvju36Y5XfWHLb2NuJvygHZYxDV1kGCGmLDEW5NjfZp4qSQtmmlhZ/r/Vg14kIWmGkFOiYeMKvT3Lx18LCh8daOYI6xC4mH4eQMANkBbhr+RGpGgTT3Ewbf7nNvOoxor/JOl2ZCx6BE3E11uSleorIJVbd/JY6oxRpEjA3knFzVSExW3uXQCwcwASZFqFC7FDz2ZSMvVG1V9ZO77eEXjDA/gfueL3+7+OSbEI6wCu1fnRQQuBMECZCiwSOzo/zvA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:11:17 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6156.023; Tue, 7 Mar 2023
 08:11:17 +0000
Date: Tue, 7 Mar 2023 13:41:05 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZAbxmUPyW+xuA/y9@bvivekan-mobl>
References: <20230307075804.268218-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230307075804.268218-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: PN2PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::7) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddcb339-2322-4b6a-51f6-08db1ee38637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMM0no9+O0WRWkBGugd/DUkfxCS+U5hg9gOVqwKABQmcBDZAEfYKm09UuHEBlt/72HKJq2tAIuWLZA4LP/RlId9aq7VAeyvkKAT70pG+HsA8hixea0Uw/38vl1C2VByPDj/ZR9ijfTkF0BwXnhbNEJnvWKOuJUrNTaQtGHVb7GB4SHbrnaxi8co8eOd9ygfj/AxMGoRzUhS/n2qs/4agPSdY6W2+IE06n7esiQOIvCEAQmrnidxNCvHpTYrdYU2e87Kx+f7il+tOXBLvK6PsJnt3lgeK4n+zLZ7WK34XsUPsOml4eruez/n5HTD+coSzdvRigqxMTKmOmWeVfO8WBqWO5c7mbEI/DH4Hxxm/K5/cUK278SxKmTQmDXj6hLaXX2ylbm4XZBcFbFJc6uNBjH/5ROAEawLSYNzxuPx8ERj7uGeR0AqKXR07fl2WIcT3mpBM1AK0wTUotmzej/z1OKA4R/arE8kePk00p2RptcG3wWot4pFP2vboEbs1JYGMKE8gyIwZsiQK4pYY4+SzvBPA6XVBYdgNqaIPtfpjf6ttTm7bT68nUBfuqh8nBTnWuBDSPrHBlaNbwVZgW/OdbjYnwDjoVUnrHLePaU+v3GGMR0DP73vhXDMKFCGSMBi2QdeLXByGKihX1WD05iVX3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(44832011)(107886003)(6666004)(33716001)(41300700001)(83380400001)(86362001)(316002)(54906003)(4326008)(6916009)(8676002)(66946007)(66556008)(478600001)(66476007)(5660300002)(8936002)(6486002)(186003)(26005)(82960400001)(9686003)(2906002)(38100700002)(6512007)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldEWksvZklCejA1UUJSdUxCdjV6M1lGOGVwa0pNQmU2SVUwZ1JqZXcvSStu?=
 =?utf-8?B?bVZ2aDJwUUROeGYxOEJ5UWF0L1hkd1d1eGY2eDFkV3JweDIxeEpRZ2w2WHpM?=
 =?utf-8?B?SllNUm5wc250QmhIL21Ec1d4c3VzL1NDUXMxYnlkK2RtdUJFVlJheVpXZWNZ?=
 =?utf-8?B?Z2xQU0c0UmlZVlRJc29YalNwM091dHVjZmExQW9EZUVSNjJyVTlJK0lzUFg5?=
 =?utf-8?B?VXdxWnhZS0E5QXdSRjBUL0dhNHZ5Mm01ejV2YjlVczdXN0lieEN1MFpTc1g0?=
 =?utf-8?B?V3dxdUNPU21WTEhCbUkzaXJ4aHZjTmo0dWxMK0MxdUhEeFVTaGxkMDV1TEV6?=
 =?utf-8?B?Yy9BK2hHRm8vYjhQL2loWUJlMVNuU2JUNnNrQ2hBdERCcjhYNmJ3VTZGcG4y?=
 =?utf-8?B?Mm9YMGdsWjFjdjhHaU1TbGFybG1HclBaNGNvRVlkREFOM3Y4ZUw5dnFva3Fm?=
 =?utf-8?B?SFVUYnNDQTR0ZWJBSXgyeXoyNEhVRHV4QlhCUEVMRE84YWdidlZuUGRIMXVk?=
 =?utf-8?B?cm8yalBzTmU2ZlVxSG5sclhYVHZDYUU4cmJUN3AxQUxRUUMyQWxZdUkzMWgy?=
 =?utf-8?B?Wjd5dkViR21hQkFnTmJSaS9TQTVOTWJtbk01Z2Q4Wm5GekQrUnVrWUFDUDRP?=
 =?utf-8?B?MWYvUW1XUHBkR2drV2lkMWxuTzVpT1hYZlBkVktjeUp5YURaVVU3VGZ4OUVu?=
 =?utf-8?B?Z1AycU53ZENaMEdjNjY0Qk9kQXFubVpwazQyUTV4N3hHYkk1Z05ZN3VJVldo?=
 =?utf-8?B?dFZiUndIK3Y4KzVCdzNmamJXZTBuWExIeTRwRkV5STJyakFJbHozaXpCWkRm?=
 =?utf-8?B?aW1tSW8xMXFHaUY1cUlyUnBvdkNSamFXQjk2SDJrc1BPTFZtc1pIdTZSWVN1?=
 =?utf-8?B?RXpCci9vbU1Od0RrS3NxdVhSSkprbnYydEQ3ZnQ5M2RhUTJ4L0l0Y3Zjbmx6?=
 =?utf-8?B?RFdBNldwMlN6eUxJMUZlTGt2VmxZVmp5bHdTdDdsek11NmdFVEFRbmg5MXEx?=
 =?utf-8?B?WDVhc2VxVG4wV243Q0QxR2UyTzRSZ2pUMk9MUWkxb014ZG9ISURKbXBXNFZR?=
 =?utf-8?B?RExaeEZFZWtXRmJUWDJsbzQ0d3M1RDhtdW5BZTZpSVIvc3ppdmZOWitGaWxL?=
 =?utf-8?B?MWxDSDYybS9sclhXY3FYRVRVM2RvZlE0cFFnWWNiNFVTREkwK1QvQlJncnlo?=
 =?utf-8?B?bHFnWVB1eG9yRHFzTnNoYy9vRnBHQkIwZmd2SmNBT3poV3ZRTzRtNEFxQ3lH?=
 =?utf-8?B?M1lGNCs2S2EwdzlNemRsbDBRR1hYanZFWlc2ZmVwdDFNZWYySCsvckZlcmdR?=
 =?utf-8?B?KytHd3J6UEhYZjUva29VdkhCczZKd29MSWF0cTUyMFNWdUpCdDlZUkJpdlFh?=
 =?utf-8?B?Z2FsNUFFTGsrVTBaNkxoeGFFU3lWdzcvS1haMkg2REo1dUl0NE1pOGtFZnFE?=
 =?utf-8?B?eHFGa2d2TlI0cE8wVlhoVkJDUGFpU2h2UzdFVWkvbnhxeFk1SFlTak1PKzZT?=
 =?utf-8?B?ZVZJalFrT0hGbUh6R1pnQy9BYXd2ZWpqeHhsdnI2V2RvMjJSd2hHcWZCVCtD?=
 =?utf-8?B?NnpsMlBIV2JYWDFOL091V0g3NnhLK09KbDY5YzVsK25QN3BtQUVOZ1ZxNWhJ?=
 =?utf-8?B?RXlPa0U3U2JpL2w5VXFzQmJhb0RUYXl2SzlCMTNyNGw1ODIybWs3T09XUHE5?=
 =?utf-8?B?ekVLT29SWmRDQlpvSU9jZ3phYzNZZUdmcnVjb1lxV0laZkxHSHpqTjU0Y0JZ?=
 =?utf-8?B?RGR1NkNWY2xKOGlweDZZUjZ5WWk2NGZQRVByZnVVbU5ra1o2b1E1NzhneU4r?=
 =?utf-8?B?SmhlOG0rb3ovWHo4Zkc4QnlRVHc0ZUgvdFp2MXJyV083dW1jek5USjVsR0JD?=
 =?utf-8?B?MDZNMDZhbHpwaTBSampVdFM1ckNNNUhLLzlHN2wxZFIvTFo3UHVvdDg3TnV0?=
 =?utf-8?B?UzB2TjVlYTc4QkZvSEd2STJXU0NvbzhOOVZCUWxscVJ3MWRpZ0hEUlQrcnNK?=
 =?utf-8?B?d2x5Zm14T3NUQit0RGEzdGtnZUJ3SzFhQkJNZ3JxazlDbkpKUElQbmxnTm1h?=
 =?utf-8?B?cG5lM3NJakhlRmdDRkFrSDZPMDl3UnRPbFd3ZS8yRDJhL2NWRUg0K2FEc0g0?=
 =?utf-8?B?dzZIdDcxbzM0a0w2OC9uY3pTMzhNUS85T09ITkZidmJrS2dsdmh1ZVBLMk9V?=
 =?utf-8?Q?727YA0z4lYzPLEHUYXAgiaJ/ULDotysg9/iaw9HRe5j/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddcb339-2322-4b6a-51f6-08db1ee38637
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:11:16.5301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKX9fVkw24byXgLvUYMUNXEMDTsSbEB+C3MhHv1kGHXhLWSVjfWMXUhrBTw/f/kjt9N2xEy9yjtJjBMHiHTqPHZSJoW9cE7Y1pCiN8b5O/dsvsjaZKhUuKqNQ4BA2Dd6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Please review v2 of this patch. I missed to include a change here.

Regards,
Bala

On 07.03.2023 13:28, Balasubramani Vivekanandan wrote:
> Link copy engines doesn't support the XY_FAST_COLOR instruction.
> Currently this instruction is used only at one place to clear a ttm
> resource while migrating a BO.
> A new device_info member is created to know if a platform has link copy
> engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> MEM_SET is used which is available both in main and link copy engines.
> 
> BSpec: 68433
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
>  drivers/gpu/drm/xe/xe_device_types.h      |  2 +
>  drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_pci.c               |  4 ++
>  4 files changed, 61 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 288576035ce3..df9ed4fbf2bf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GPU_COMMANDS_H_
>  #define _XE_GPU_COMMANDS_H_
>  
> +#include "regs/xe_reg_defs.h"
> +
>  #define INSTR_CLIENT_SHIFT      29
>  #define   INSTR_MI_CLIENT       0x0
>  #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> @@ -56,6 +58,13 @@
>  #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
>  #define   BLT_DEPTH_32			(3<<24)
>  
> +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> +#define   PVC_MEM_SET_CMD_LEN_DW	7
> +#define   PVC_MS_MATRIX			REG_BIT(17)
> +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> +
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
>  #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 199bd37fce9a..a73c5e1d7503 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -95,6 +95,8 @@ struct xe_device {
>  		bool has_4tile;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		bool has_range_tlb_invalidation;
> +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> +		bool has_link_copy_engine;
>  		/** @enable_display: display enabled */
>  		bool enable_display;
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index bc69ec17d5ad..076ca82157ce 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -750,32 +750,59 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  		      u32 size, u32 pitch, u32 value, bool is_vram)
>  {
>  	u32 *cs = bb->cs + bb->len;
> -	u32 len = XY_FAST_COLOR_BLT_DW;
> +	u32 len;
>  	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> -		len = 11;
> +	if (!xe->info.has_link_copy_engine) {
>  
> -	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> -		(len - 2);
> -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> -		(pitch - 1);
> -	*cs++ = 0;
> -	*cs++ = (size / pitch) << 16 | pitch / 4;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs);
> -	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> -	*cs++ = value;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -
> -	if (len > 11) {
> -		*cs++ = 0;
> +		len = XY_FAST_COLOR_BLT_DW;
> +		if (GRAPHICS_VERx100(gt->xe) < 1250)
> +			len = 11;
> +
> +		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> +			(len - 2);
> +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> +			(pitch - 1);
>  		*cs++ = 0;
> +		*cs++ = (size / pitch) << 16 | pitch / 4;
> +		*cs++ = lower_32_bits(src_ofs);
> +		*cs++ = upper_32_bits(src_ofs);
> +		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> +		*cs++ = value;
>  		*cs++ = 0;
>  		*cs++ = 0;
>  		*cs++ = 0;
> +
> +		if (len > 11) {
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +			*cs++ = 0;
> +		}
> +
> +	} else {
> +		/* MEM_SET command supports setting only 8-bit value.
> +		 * This function is currently used only to clear the address
> +		 * range.  So the value agrument is not really used. Need to
> +		 * have a better handling when there is a need to actually set
> +		 * a value.
> +		 */
> +		XE_WARN_ON(value > U8_MAX);
> +
> +		len = PVC_MEM_SET_CMD_LEN_DW;
> +
> +		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
> +				(PVC_MEM_SET_CMD_LEN_DW - 2);
> +		*cs++ = pitch - 1;
> +		*cs++ = (size / pitch) - 1;
> +		*cs++ = pitch - 1;
> +		*cs++ = lower_32_bits(src_ofs);
> +		*cs++ = upper_32_bits(src_ofs);
> +		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
> +				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> +
>  	}
>  
>  	XE_BUG_ON(cs - bb->cs != len + bb->len);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c4d9fd2e7b2b..e555f13395ab 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -72,6 +72,8 @@ struct xe_device_desc {
>  	bool has_4tile;
>  	bool has_range_tlb_invalidation;
>  	bool has_asid;
> +
> +	bool has_link_copy_engine;
>  };
>  
>  __diag_push();
> @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.vm_max_level = 4,
>  	.supports_usm = true,
>  	.has_asid = true,
> +	.has_link_copy_engine = true,
>  };
>  
>  #define MTL_MEDIA_ENGINES \
> @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_4tile = desc->has_4tile;
>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
>  
>  	spd = subplatform_get(xe, desc);
>  	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> -- 
> 2.34.1
> 
