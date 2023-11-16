Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544BC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 23:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6210E2E1;
	Thu, 16 Nov 2023 23:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5210E2E1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700179151; x=1731715151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nvtJsq7b4e6vv7zX1wNK7ZdM8HSBA3UfLm8bYt69O8A=;
 b=MrMbEPipLya/vJBM8AdWnUARoFZqO5x6DaZuqEMF/m7KgLGUIE5SPs5o
 O5XE7AAm1WvBfZkixJ3q6wvAgFc2mIp+W7VUKsnTMk+JTyXNuRAqCKIkB
 BzurySQ4iD/uNei2ltqZlE6NGZFFWo2RfpPMWkh0po3Hlx9hgYbyMe943
 PhNC2ZufiJYkfMfi6oLCUqRA/x4qiZqw0M+si/cCb3wd9nB/1eNzmzxWQ
 msVWDWaYAml0O5bUv/K6Pm4mL0xaTQ2t/kRtffyf7JDZ05dQD5vBNXDBk
 v1qHv9J+a4DBa3JsJFOPf+cPo22TC6+Qkk/h6s+ca9ixJR4KrCC6NoSsZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477425212"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477425212"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="856165641"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="856165641"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:59:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:59:10 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:59:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:59:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtvNyStCnx12GPoltZslAvdQxIjhVD83LNl/ZAaXqL/TZDv9ddzH1ty46KxGP72PJqLSlJ+DoJhjmsXUaGx78m9CanxMD+MpKDmo6ABI+psc4gzZouODMLHXL3YyoS9+1PKe1FVzi5y8gdpv8NdPFKmfp9kUmS3zlEhn8irB+m1GdhTFiSO0xvurmKRafJCG7va2atBva+TDXbygIrO5gp905Bv8ya88BzGzpZYC/XcQw2q9lCYuSBq82rAulItZ2RtERF1lZMS2rYA63Y6jN6bE6Ul8rtaVUcnKhUE8pIOxmozTIyxsde/QRV1tAGqIezfQDyPgcFtAbzFX/d502w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQrBuTIK4VOSuuhpO00gvicaLpJHk7T4BEpGWz7Mydk=;
 b=DexTZSQbiyyjuuRBz72YQFzd3MTsi7VGFd/efR8zyG+zdVKIzsTDUYKMbnIg7tEZ6Ixk8UplXx4j95VLQ5qeeLutx9KIKgObIVWDqYWPw/lD4zVNlTWlx23vzwvHp27ZntJyEdPikDloz7kKQgpub1AOcKTpkwJMgHWMBf1m/ZnMS2cigs33cnUHynynHOejaMzjncurzfVxhi5GMgEBnxGAofyTMQNjDhCwGsgUTB9HcDNEkOvBs3wix520Puj+PGOdsdzd3fGb7CUlDAAvUkS9EdnW5TWs3Ui4KRtgqDYFYbgJ4IF9ZDB7tbN6MpOZ1bHCl9KfgSJXqjnDAxsTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 23:59:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 23:59:00 +0000
Message-ID: <09d7fb1d-23cd-4f62-ba36-f739e50ac412@intel.com>
Date: Thu, 16 Nov 2023 15:58:57 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-10-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fda6565-1a1e-49b7-ba0c-08dbe70000ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVSTTncSn2nwH9TAUBRUsO9TpmDx3ZIuZP4C4IMPL0GQpb8pfotfQ9J0q+k/NdXYwHLwhxki8vl3IR/mVyAW5AoT5Cnv36dw8d1HP/HgNul+aahp/LTg7LTUDZpq8cdDB/UPIl2p64JiXpbZ2JsyN79UAnhJQbej9NiFHBhaKjphcpVGpK3/sNzNpwEvTSSqvcPDa/VYYzjuTNt+ZwMrcJZXGP9xr7NIze2TUJaNDnEBMPurexmBO81vajZ2Fh+ZV9Olzk079O8rfnMpLd9gOG1CaXp99Fkru/oy8oNG8g5wJs3JlUNY56Ah0sv2cYR1lMmg1YQ0AsOyC6YUhw3rxUnqbDHmnCnJA07GfUpnqPjcEWrfBzTWRg3AEvD8tRB1KCY4sdHE7XCAJcSgxKTYS2oQOFQ7scWrCPG0zTC0KopMgUXjJ5NlElkHEnaHQOF5nKKwSy6VLWk3qQKPMDzyJhehbks5v78FaSPj4WHCUh4zHjcob5xEAG9kzcnz4MLDLfYMYQmsyPKcyAJAV88fBDsx6L3fOlWDjglf55HlRPBBqxQRO/MJbhgQWWjySW/mIKsphhVV9gyvs29b923VYOYIzSLoKfyRUs3oSs4WqLOs+3EvbFli/vAmX45fESgXecP2bJZW694gAnntivj6Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8936002)(4326008)(31686004)(66946007)(66556008)(2616005)(107886003)(2906002)(8676002)(41300700001)(5660300002)(82960400001)(316002)(66476007)(38100700002)(478600001)(83380400001)(6486002)(36756003)(6512007)(26005)(6506007)(6666004)(31696002)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFGTldyOVduckFBeHRhbW1nQVVKemQ4cTlQVzdHeEgrbTBYUFQvbkI4QmQv?=
 =?utf-8?B?ZlEvTXp2alRGYnFsREdoZHEvaVBZaTRvUEdxR2RYbEJaR1k0aGY1VHR1YjZt?=
 =?utf-8?B?SVdIdkhGakRsd05POGRPTnFUSXlLd1ZoM3YwNlVHS1dzaUdiRGd2S0FCNkJo?=
 =?utf-8?B?Q3JvbHM2cHJ0bDRKamYzSlNmVmo3WWNNV3JqbkdjR0dPRkt0UXpFZjM2L1hK?=
 =?utf-8?B?OUpuUkpkL25KY0ZxZWo5cHJSQ1NDdnRZbkl1VzB2d0xYMzJZMFZUMDg2Uk9q?=
 =?utf-8?B?NHk1VDFZbWZrOXBOWEJLRitqUzVOZTIyK3JCdlV4aURFeDduOUY0SDJ2YkFx?=
 =?utf-8?B?eS9JTnJKc0VoR1QxVSs1d1JOcEwyNy9sYVdVSUVRVFJQYStwYkJsd2prcHJK?=
 =?utf-8?B?clN3RU5xWExBMTR3aWlkdEFicEpEN3B4NzVRZHBNWXpnRGkvMGJoQkgyYit6?=
 =?utf-8?B?M1g1OG5HR2MrVU9SVkljdllhbWNyNC93R3ZMbllWV2Rha3JySUgxVSt4UXd5?=
 =?utf-8?B?RUVrRzRoZ2srN21uK2I3ck8yTitBY0w0WG40SEtwd09aQTdlVzkyR1JHYSsz?=
 =?utf-8?B?NStMNG5MdWRBMkhtOFF0WHlDS0pYUldhQW1kbG16cEpjcDJNU2d4WStJOEZH?=
 =?utf-8?B?Um8zU01reXZLMjdodndNVVArVThYN2ZjWTQvSkRrY0FKV3NPeFI3elFPNFgr?=
 =?utf-8?B?MncrWG0xRTArRm1rREpJVFF3Q0VRR2oya0xmZHA0YlpmZ2E2aGkvUFpieHVC?=
 =?utf-8?B?Mnp0WE0rVWF6cmpPOEpNaEFEVkhhMDcyTXgvSkx0TTRkWHN5WnBhdVNQdzRN?=
 =?utf-8?B?YlVoVUFxYVFTWkRYVStiK0xmK2Q5THJkM05yRy9sb01KdTllT2VHek1rMkty?=
 =?utf-8?B?d09taGZ4SDJWZEJEcENNZENZdlNpbjFZZGwyTE9HZ2ZzK2JkdjRXUU84cS9r?=
 =?utf-8?B?RXErNmtKRU1OTEtwcW85aVVuSElZMGVPdEllRWlmeFFSTGJZZ1FhNUpqMjdi?=
 =?utf-8?B?TjBLUnVKcEt5UVdMOU0yVk1JTlJ5Z2hCam8xTFM2T2x5QTNNUmRYcjJmbGNY?=
 =?utf-8?B?TGZKR1YzdFVCQU1UM0FuVk14Sm5ZUGMzS3c1bFlKNit0c2pod3dhZzZkT2ZE?=
 =?utf-8?B?UFlJQ1JVVkttRjA2RzZnZ1F5WG11Vk9QVUp1aUJTL3FPanpyaHhYVjhjTHIy?=
 =?utf-8?B?ZDhld3gzc3p6R1daQ0lsU2xQcFJDY08zUEpISWw0Z1lSN1FaTjd2UXZaeGhh?=
 =?utf-8?B?dkMwZzAvb1F2VEkyR1pWL21BaVpFMmJIUXE1ak0yVFZPWGEyZHJyR1NZTkdC?=
 =?utf-8?B?R1JpRERVQWlaQWJxci9La0dSckZyWCt1YnBMdUF1N2JtdGdUZjRrL0R6K2p2?=
 =?utf-8?B?Q0JGQ0tXMXN5Z1dwZmgzZUk4UWRuNS9jRXhDblhyeHdqbllpeDdhZk5UU3Jj?=
 =?utf-8?B?MmF1U0l6Z0JLbEtLUkU5czBNdm9SN1Z0ZExFSzlXVVZLbDZGVVJqcHJPcDBS?=
 =?utf-8?B?Sld3ODI1WUNCZGZGMzdIK1RrVUREUmVzNExmK2JFZW1QVlhUNCtJSHMwTzhE?=
 =?utf-8?B?R3lObXpZalpBQjczem5VNzY2ek9GMnppSklTbnAvRDdJakRsRVBLQ2RaV3FV?=
 =?utf-8?B?TTZnVnJnSWFXemlQVWhjL3lGaCtueUt5SXBaY25pVEdSYXRvaG9ycG1sdkli?=
 =?utf-8?B?eTYxTlhCYVFKV1l6QlN5bk5WN3JhQVdNRWtLdTJPZ1J4dExqVFFtY1Y0SGxN?=
 =?utf-8?B?U1k1bmt1bzlEc1k4ZTdvdTg2cFQ1b3UwYzhROVZRa1JOMng0N3dOUmowak1Z?=
 =?utf-8?B?OEk3aGw3TldmdkIvSUNiUE5pN3VsaWRtTWtvWkVvbGFPRlB3RWt2NXhqYUlN?=
 =?utf-8?B?SkVIRjNNSVZ3eVNFYnF2dVBGK3VhQkh3T3F0SHhoajdwTU0zSVhmL2h0TitT?=
 =?utf-8?B?Y1ZEMVFSbWt3d28vU0NFWDZGdGxTTTNPLzVtZEJzZ0V6cmEyVExQWFUvelpy?=
 =?utf-8?B?Z0dNUHFWbkZDdWFsVTRJWkQ5Q3BpTzNBbGR4YTZpT3laT1E1ZVJ1RFpQMXUx?=
 =?utf-8?B?UXRJZ09iV1JGNFhvKzU2bGJzeUZjQUNIMjJXb0FOM2dNV0tUTll0VXI4TnJq?=
 =?utf-8?B?bmVCdVQ5dlZBVVhIWGY4cXAyNVdyRFVPT0RWT2w3VnhvbDB4bzVyNjg5bVVu?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fda6565-1a1e-49b7-ba0c-08dbe70000ad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 23:59:00.1781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbivbLYalBnRyMzPGMocGqnAdhlHyEpwyn1HkXKw02AW+yYm53BqPz5a2w0MsjL3x3yTymUzwElhM4Svy4fw1Y+N0+Zf+/6+Gp7abRbymI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/11] drm/xe/gsc: Query GSC compatibility
 version
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> The version is obtained via a dedicated MKHI GSC command.
> The compatibility version is what we want to match against for the GSC,
> so we need to call the FW version checker after obtaining the version.
>
> v2: rename query message wrappers to be less generic (John), fix line
>      length (checkpatch)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    | 39 +++++++++
>   drivers/gpu/drm/xe/xe_gsc.c                   | 82 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw.c                 | 18 ++--
>   drivers/gpu/drm/xe/xe_uc_fw.h                 |  1 +
>   4 files changed, 134 insertions(+), 6 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
> new file mode 100644
> index 000000000000..ad4d041873ab
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GSC_MKHI_COMMANDS_ABI_H
> +#define _ABI_GSC_MKHI_COMMANDS_ABI_H
> +
> +#include <linux/types.h>
> +
> +/* Heci client ID for MKHI commands */
> +#define HECI_MEADDRESS_MKHI 7
> +
> +/* Generic MKHI header */
> +struct gsc_mkhi_header {
> +	u8  group_id;
> +	u8  command;
> +	u8  reserved;
> +	u8  result;
> +} __packed;
> +
> +/* GFX_SRV commands */
> +#define MKHI_GROUP_ID_GFX_SRV 0x30
> +
> +#define MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION (0x42)
> +
> +struct gsc_get_compatibility_version_in {
> +	struct gsc_mkhi_header header;
> +} __packed;
> +
> +struct gsc_get_compatibility_version_out {
> +	struct gsc_mkhi_header header;
> +	u16 proj_major;
> +	u16 compat_major;
> +	u16 compat_minor;
> +	u16 reserved[5];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 1bb0de0a24f4..093c0fafe584 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -7,11 +7,13 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "abi/gsc_mkhi_commands_abi.h"
>   #include "generated/xe_wa_oob.h"
>   #include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
> +#include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
>   #include "xe_map.h"
> @@ -91,6 +93,78 @@ static int emit_gsc_upload(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> +#define version_query_wr(xe_, map_, offset_, field_, val_) \
> +	xe_map_wr_field(xe_, map_, offset_, struct gsc_get_compatibility_version_in, field_, val_)
> +#define version_query_rd(xe_, map_, offset_, field_) \
> +	xe_map_rd_field(xe_, map_, offset_, struct gsc_get_compatibility_version_out, field_)
> +
> +static u32 emit_version_query_msg(struct xe_device *xe, struct iosys_map *map, u32 wr_offset)
> +{
> +	xe_map_memset(xe, map, wr_offset, 0, sizeof(struct gsc_get_compatibility_version_in));
> +
> +	version_query_wr(xe, map, wr_offset, header.group_id, MKHI_GROUP_ID_GFX_SRV);
> +	version_query_wr(xe, map, wr_offset, header.command,
> +			 MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION);
> +
> +	return wr_offset + sizeof(struct gsc_get_compatibility_version_in);
> +}
> +
> +#define GSC_VER_PKT_SZ SZ_4K /* 4K each for input and output */
> +static int query_compatibility_version(struct xe_gsc *gsc)
> +{
> +	struct xe_uc_fw_version *compat = &gsc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *bo;
> +	u32 wr_offset;
> +	u32 rd_offset;
> +	u64 ggtt_offset;
> +	int err;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_SYSTEM_BIT |
> +				  XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo)) {
> +		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
> +		return err;
> +	}
> +
> +	ggtt_offset = xe_bo_ggtt_addr(bo);
> +
> +	wr_offset = xe_gsc_emit_header(xe, &bo->vmap, 0, HECI_MEADDRESS_MKHI, 0,
> +				       sizeof(struct gsc_get_compatibility_version_in));
> +	wr_offset = emit_version_query_msg(xe, &bo->vmap, wr_offset);
> +
> +	err = xe_gsc_pkt_submit_kernel(gsc, ggtt_offset, wr_offset,
> +				       ggtt_offset + GSC_VER_PKT_SZ,
> +				       GSC_VER_PKT_SZ);
> +	if (err) {
> +		xe_gt_err(gt,
> +			  "failed to submit GSC request for compatibility version: %d\n",
> +			  err);
> +		goto out_bo;
> +	}
> +
> +	err = xe_gsc_read_out_header(xe, &bo->vmap, GSC_VER_PKT_SZ,
> +				     sizeof(struct gsc_get_compatibility_version_out),
> +				     &rd_offset);
> +	if (err) {
> +		xe_gt_err(gt, "HuC: invalid GSC reply for version query (err=%d)\n", err);
> +		return err;
> +	}
> +
> +	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, compat_major);
> +	compat->minor = version_query_rd(xe, &bo->vmap, rd_offset, compat_minor);
> +
> +	xe_gt_info(gt, "found GSC cv%u.%u\n", compat->major, compat->minor);
> +
> +out_bo:
> +	xe_bo_unpin_map_no_vm(bo);
> +	return err;
> +}
> +
>   static int gsc_fw_is_loaded(struct xe_gt *gt)
>   {
>   	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
> @@ -159,6 +233,14 @@ static int gsc_upload(struct xe_gsc *gsc)
>   		return err;
>   	}
>   
> +	err = query_compatibility_version(gsc);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_fw_check_version_requirements(&gsc->fw);
> +	if (err)
> +		return err;
> +
>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c354f7b51103..062fc1eb591c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -224,8 +224,11 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   			uc_fw->versions.wanted.minor = entries[i].minor;
>   			uc_fw->full_ver_required = entries[i].full_ver_required;
>   
> -			/* compatibility version checking coming soon */
> -			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
> +			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> +				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
> +			else
> +				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
> +
>   			break;
>   		}
>   	}
> @@ -321,7 +324,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   	uc_fw->private_data_size = css->private_data_size;
>   }
>   
> -static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> +int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>   	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> @@ -678,9 +681,12 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   			    "Using %s firmware from %s",
>   			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   
> -	err = uc_fw_check_version_requirements(uc_fw);
> -	if (err)
> -		goto fail;
> +	/* for GSC FW we want the compatibility version, which we query after load */
> +	if (uc_fw->type != XE_UC_FW_TYPE_GSC) {
> +		err = xe_uc_fw_check_version_requirements(uc_fw);
> +		if (err)
> +			goto fail;
> +	}
>   
>   	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
>   				     ttm_bo_type_kernel,
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 7feafe1695f9..85c20795d1f8 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -17,6 +17,7 @@ struct drm_printer;
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
>   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
>   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
> +int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
>   void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
>   
>   static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)

