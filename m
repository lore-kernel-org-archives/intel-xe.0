Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D9CC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4A10EE58;
	Thu,  8 Feb 2024 21:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExJIOJxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FE810EE61
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707428058; x=1738964058;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jcYTqpbSmtMVabAg9mz0axQ2i0D2EfOpWug3V4Xz520=;
 b=ExJIOJxnysOrKNlnwYMxLL5aekLRW/+ewcQ1kRn6bPWwQgDSMae4ryxa
 e/ptDfRbJlcQ8m6orpfF1BqLReUk+xjLNa93lpHhD5j02bPNrPUYA1GrP
 Np6YRwQi5YQJkxzW1C4caAabY1RbIgFkhMyWQy0Dc9Qn5ojx+TJ1km12s
 JseN8paWhyJj2k+EgHmQ8UL/x3l8n45gQgc75lNeYCXIHr9MgwHXgUBrJ
 hzhxdwX9StwV5Q2QaT/pLfUJJw16dmJmD9PX51c10ryo4H2dS+9Ya8pvT
 lG/NoWfvhk2/g9j2JxK7qipC25exgPil8Im1kUNV/UTv0/l3B77+SVZ2J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11970903"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11970903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32843366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 13:34:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:34:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 13:34:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 13:34:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeIqjthCA0d7GM5tuz3b3Wo0rfup+efJAiWpbtfWqKvohzZWud4RfUQuDoaVgt9w2jbU/mXBpjHA/sVWs9rhVAiYX/99voAT+XPZcnvZQLF5F9eS305zf60gVwv2ACpCFnnjksp468+9UsIfNM2EVjEqY53Lcr73EBF2Om/pqNqdDhqjXyaizhWXMNSf2ImmHjNTyWzNhAhr1y1ulzDsL1g+0JhJDHKPnWkDWgAvWKtXiblSHYOKuKktOiBIY8aSGYiYFg5yfAHvAOS1YQ4OCbLIOQ/DtEkumL38aeoCXJM2nMedZP1PyumRU6ahOIxnk+doziNO/sf5NIjH5eRIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUoo73y/1He7EcY31OsxnXZ90fmskcvGxfvZP7ngoGk=;
 b=Y0mCXONVAtDmMJRoVXws+ptt5tepEbeWTYYvIdkh8rR6tTLLvRlZzjPnom4OwHXcK0d8qULhqmNMcGEztFd5kguNb98eQu2NRG7c2dJP/mPa6ViSsDGwY5OWVH5YEFohkeQ3E/My6oMS9NG5p4FczEfWyeLjln8aphtVN8F05V2eXAjd5Y0kjufoTYZCcFu+JCM4QCHIl1WPdZShvztpR8/uSmpUx3nPnSUql4p71i0xyfw9cpTnounDsgaYKz+8Ea5WluM6GUpIThiZuYZ29yn8tS2AbpvNK6WmAk8fqk6UEGpQ18yZCBmv+RUFLHnykQcd2qiwLpC5+zmM1tkTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 21:34:13 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431%4]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 21:34:12 +0000
Message-ID: <48da0dc4-692d-4337-be0d-889027a9f5e1@intel.com>
Date: Thu, 8 Feb 2024 23:34:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add OA functionality to Xe
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db15c5e-f7d0-49e7-a3d4-08dc28edb151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3bDA/PPkIkZ6pPVIjdR08p2JGm5vSwarRjpmNxORSVEvs2zwYrQwpO0+pon23Yy1mMHO3L5ppfA5Vw36vOoVMAZGgBDJKeD/YcEZXC3Zx8pXuPue60DsuKRJOGwV5xHRLRGKFyQspMRUGG5Y3Kd7DYNB3luQPEywkmfWMmN6yYbeDXWatoBKdx+7Sal6oqgW5HwMr4GdMGHwNB7b/2WJsKPLTQpxiFYR81QyDitthcW+4fiHggbdEUkhm0uivfWb9DJ+a5h95OYDi14VmIbMAiSFxyaoDSVH2aBj0rj9ZHczvCeiLR3L/662j4t650eYIsoHnTKuf/zOshP9fbSbEiwXJb8c85Br3UFp+iHvmzKIXpyzZWBBDoLPTZAa709QtD+IFyj220MDDkOfNmX6HP91r44yivlp5th6nlCgc86naQWR1Emd/hPwVLX8BlZto+uiI1Ych8T6IQHQq83SErW1o2LXMiFldwjoufqLVrh6ciYgW0ZM2sERJYjUmYmw0p1qNDM4B8FMWXy0R5mxSIC8+IBIunFrRzAtzd6WKFJUv+6lAFPLgJm09jSbcPWL4QAti9nEKArCTCyWqIepg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(966005)(6666004)(31686004)(2906002)(5660300002)(316002)(41300700001)(66946007)(66556008)(6486002)(53546011)(6506007)(478600001)(6512007)(8936002)(8676002)(66476007)(2616005)(83380400001)(6916009)(38100700002)(86362001)(31696002)(82960400001)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFZXeWpwdUdTQ3ZyVnlncTZ5TzlOY0s2VWRDaVJtRHVOWFMvb2VFYzhpRXhD?=
 =?utf-8?B?Z0g3NW05Y1FETTAra2VYcmhVYUNVdzN2YWYvK1VnOE51WmpIckpMRk9WUmFu?=
 =?utf-8?B?WDREckdYUWJ0SkJmTlYzL1NZV3Q4QlU3S2w1MU5XL09oRzQ2VHVNVlZHRHYx?=
 =?utf-8?B?VVFtNE9ZUjFZTlh1UTlNaW9BTmRCcVlkS3Nqb0dkVExOVy9zWnBjV0FIMVFt?=
 =?utf-8?B?d2FkMk1kQ3dFVFlPVHozOU8yanlqbk52ZjRuWE1rZFNEQVJtQzd3L0lwemVv?=
 =?utf-8?B?M25vRXBkYXhFMjd1cGJxU3RUT1h0UjFDWS92Y0ZSajRMci9wMXZvbUJUYTd5?=
 =?utf-8?B?SE1WVUlpVDFQYUREMi9kbGNJazJvUUtPZjM2QmM5S1J1RjI0ZjN5eDZDQTNW?=
 =?utf-8?B?RDRraytOd3YzMFY2eUpUTlB4RjBhcjFWQzdYTkk3MjJnelZkdmNWcWVnUkVs?=
 =?utf-8?B?QytnTGliRW5odXdEZUFCRDMvUHFNK2JMcFBIMG9tU1VpdFRPTXVhUitSdkVY?=
 =?utf-8?B?cXl5a1NVMGJjYnliRk1pM1hxUUxiMG41V3UrTmJTcGIvSS9PWFRFbjZBT0ZT?=
 =?utf-8?B?bG02NFZkY3g5M3BFNlJWS2dGZDBjOTN0MjExd2h3RFd4YVBFWnhYRWtXelJq?=
 =?utf-8?B?MmREV3k2N0dQU0trc0VpT3JuUGIyZ3RCMnY5Sm83VVhmZGxJdnVHSDdWVmlI?=
 =?utf-8?B?YU44QXUzUWxtYms2RlZPYTVJenJuSVdFd25FdlZRNS9SZ2FwcGduek1OSzQ5?=
 =?utf-8?B?cDNpRk1oM3FFYzExMWRONzAxS0hueG8wdTYrSWZ1WXFqN0xYR2F0ZnVtQ0Yw?=
 =?utf-8?B?NkoydjJYcHhna0VWZ0FTNFNWYmpOdFp5NW9nR1REa0RiNjhyVExad3p2bU0x?=
 =?utf-8?B?cU9ZNTl2WTBsM2xOUzkyaTFtN2hSUHlEeTR4dmZLY1VQWTBBdVBZMzE5dWtv?=
 =?utf-8?B?UFlPaVkyMFRsYjZDSzMwaFc4NGtlOU9hT1AycjE2SUF4ck8yRWNheGk2aDZK?=
 =?utf-8?B?MzZuSEVXWVE5dTRVUkM4R2kxR25NNmdIRUp0YzZldlkvOWh5WFdYdmVTMXlX?=
 =?utf-8?B?T2RnYUJRU1pBNjdoalFrb2dJa2pPQk5EYjdud2FUR3FldHNSaHRVeU1rbGFS?=
 =?utf-8?B?S1ZyUmJrSXZjL1FwcnRXMzFDZm1rbFFvbEpWR3dvS2QrdFdmaXJ3M2Vhd0lW?=
 =?utf-8?B?TkY1V1owMHNRcldmS0FaamdBTmhnU0R2OWh1ektXRlcyRStFbUY2T0J3aGFi?=
 =?utf-8?B?cGEvS3BHdU5IUjhicGJUUlV4ZHpWWDkzelF5b2NsaTJEVEF2MTNra2hEV0Js?=
 =?utf-8?B?ck9EdnFsdmx2KzRLenh0bjlvRDNDU3BhdS8wYk1ldXI1L3F4cm1uUmw2aTZx?=
 =?utf-8?B?TWM4NUVUM1IwTkpGV3dNUG9LdXpZSy9pTUNJSDBHbllHUVFwMnBkM0ZMSlIv?=
 =?utf-8?B?UlZoY05yWnRiR1o4UVg2THFUemxRcERkTU13K0w1Q0VyaXhBS1dMRnQ3c0I4?=
 =?utf-8?B?V0ZOaG0yRkQwUmtKaXlFdFd2TDlzUjdqVzRMdjBhSld5WlJKRzRNUkZOalZK?=
 =?utf-8?B?WGFIdTZJbjRyQk9zYlN1Z1l5Y3BPakcxZXRiRElEMFZ5UmtnY2xFNDY2S2Zn?=
 =?utf-8?B?V1ZVL2Yzb2FvMTRCbHdITFY0d2lnU1BhOGwvNysxWjFadENqRUZrc052SWh2?=
 =?utf-8?B?ditqNTdodmt3YnZ0OFNFckNWT3hrVFdiTUg5ODRWNXhyTFY4VGpGcFpyaFll?=
 =?utf-8?B?dUhYSUxUdnMwejNzckVCUlBVY2hIYWJYaTJraGU3WXVrQjBvaXdyUnR1UUZY?=
 =?utf-8?B?K1o1ejQyQXJlcU5WWkVTZ2FhUzJXMXNIUzZQSS8rczNlSXRwSFpXajJlN014?=
 =?utf-8?B?NlA2VzBXVDUzVjVwZFFKekhBY1ZhSmowMWM5LzdHUk52NWQxaFNsWmY3dDM2?=
 =?utf-8?B?RlV1R0xjUFdrSkQzK004amFTRTI1d0hDWDN2eXMzNWpSRk9lRkNTS25icjli?=
 =?utf-8?B?TFV0NFJ6SG5Ib3ZPWUlDOVh1QjdKYTUrQ2piNWp1MGRmYWhkT0U1SFpYRGRo?=
 =?utf-8?B?QlhabjU5c1IvSVRXVTQ5Z2lZRkd2YitLS3ZKd3ZqNTA5VStPR1dBSlp4bDlZ?=
 =?utf-8?B?a1dQWDBhbEYxRCtQRXNURmQxaUczVDUrQnRiNnJqdHUybHFwbklMZU45dVkv?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db15c5e-f7d0-49e7-a3d4-08dc28edb151
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 21:34:12.8321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjShpzp15qNB24XHO3HkTmRR3PHvCoP1o9Lnp+F8ZzRnPJ+qAYnoYykwcBmdVYOXYXR592F9epfnwGH7CIUYgQrexGNYFUcUJralgm4kS54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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

Hi Ashutosh,

Just looked at the series and I'm not seeing a way to reconfigure the OA 
unit with a different config once the stream is opened.
Was this feature removed?

Thanks,

-Lionel

On 08/02/2024 07:49, Ashutosh Dixit wrote:
> Please see cover letter for v7 here:
> https://patchwork.freedesktop.org/series/121084/#rev7
>
> For changes in v8 and v9, see:
> https://patchwork.freedesktop.org/series/128993/
>
> This series is also available at:
>          https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
>
> The series has been tested against this IGT series:
>          https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
>
> v2: Fix build
> v3: Rebase, due to s/xe_engine/xe_exec_queue/
> v4: Re-run for testing
> v5: Address review comments, new patches 11 through 17
> v6: New patches 18 through 21
> v7: Patches are completely redone and don't start with i915 version of the uapi
> v8: See https://patchwork.freedesktop.org/patch/575214/?series=128993&rev=1
> v9: See https://patchwork.freedesktop.org/patch/577441/?series=128993&rev=2
>
> Ashutosh Dixit (16):
>    drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream
>      types
>    drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
>    drm/xe/oa/uapi: Add OA data formats
>    drm/xe/oa/uapi: Initialize OA units
>    drm/xe/oa/uapi: Add/remove OA config perf ops
>    drm/xe/oa/uapi: Define and parse OA stream properties
>    drm/xe/oa: OA stream initialization (OAG)
>    drm/xe/oa/uapi: Expose OA stream fd
>    drm/xe/oa/uapi: Read file_operation
>    drm/xe/oa: Disable overrun mode for Xe2+ OAG
>    drm/xe/oa: Add OAR support
>    drm/xe/oa: Add OAC support
>    drm/xe/oa/uapi: Query OA unit properties
>    drm/xe/oa/uapi: OA buffer mmap
>    drm/xe/oa: Add MMIO trigger support
>    drm/xe/oa: Override GuC RC with OA on PVC
>
>   drivers/gpu/drm/xe/Makefile                   |    2 +
>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |    3 +
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    4 +-
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    3 +
>   drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  100 +
>   drivers/gpu/drm/xe/xe_device.c                |   18 +-
>   drivers/gpu/drm/xe/xe_device_types.h          |    4 +
>   drivers/gpu/drm/xe/xe_gt_types.h              |    4 +
>   drivers/gpu/drm/xe/xe_guc_pc.c                |   60 +
>   drivers/gpu/drm/xe/xe_guc_pc.h                |    3 +
>   drivers/gpu/drm/xe/xe_hw_engine_types.h       |    2 +
>   drivers/gpu/drm/xe/xe_lrc.c                   |   11 +-
>   drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
>   drivers/gpu/drm/xe/xe_module.c                |    6 +
>   drivers/gpu/drm/xe/xe_oa.c                    | 2319 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa.h                    |   30 +
>   drivers/gpu/drm/xe/xe_oa_types.h              |  230 ++
>   drivers/gpu/drm/xe/xe_perf.c                  |   67 +
>   drivers/gpu/drm/xe/xe_perf.h                  |   20 +
>   drivers/gpu/drm/xe/xe_query.c                 |   79 +
>   drivers/gpu/drm/xe/xe_reg_whitelist.c         |   24 +-
>   include/uapi/drm/xe_drm.h                     |  263 ++
>   22 files changed, 3245 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>   create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_perf.c
>   create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>

