Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B320AD68BCF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 18:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760110E065;
	Fri, 15 Nov 2024 18:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADXtUS5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605CF10E065
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731693846; x=1763229846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/SR+3XelNBVeDed3R1rJ3AQci+kcACs3qWfos4ZYncA=;
 b=ADXtUS5FUjSfp+Hd/C4oVZWHRwxdjh8XkFjbh+nF8YIv5PAXK2/IxBuW
 tspIT41NCfcok13VoGnRvmEvdFNlaX0JAgqn1/tYVMLIwEk/7GqqNrniw
 zPJzhQNFTUd/5XHPU3vLVdhD0zJQiDIs0LzN2MsNBDEOJZqCy9wxrhvUU
 PamFqxhBmjMEotOlMGnM3iNxGHzdWaZ6QByg4kt1ClPUUxvzVMT+CwkvI
 22wl8fQJKCVlrgc/e0B+4okt9000ZSVU5zrj6OHk1j3eQjLmIlXj23p4l
 qb2oFQhhgwPH/r9nQHmd1uaq9bfsTiAuOAiSP/LALfEmPfl5y+JovwYci A==;
X-CSE-ConnectionGUID: q7T5x4myR4eqODqzHKBonQ==
X-CSE-MsgGUID: rFnXewvrQ4qwh+Hexg62/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35639662"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35639662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:03:57 -0800
X-CSE-ConnectionGUID: mE+TbpV6Ql6xEYNDoTV0Ag==
X-CSE-MsgGUID: MzWO8OzYR8++wKkmSyQZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88389382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 10:03:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 10:03:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 10:03:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 10:03:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7mLVFTf+kgm98NqKxUJkLt588kBClPSoT7JEKcz0wCpcLBlNk6gcpmRr28VcIFPHk8uVaESINyOWw7jrqbLFhF/kUcyA9gObWfVeAX8vbY76YiqMsAYeX7M/krCzsDC9UTM2z5GZtoiCoCoHXXI+YaSA22AHiVXkrHEEbQIUsXlBfs3mB8+WdJs9IoLwsqjFrvTn1LRSJNVO/onzWo0mNqlv8BzMobpoBPjKACD7Lj6pwc0BOnV0X5xMYS1PFPAUFziKEcUOwkeXSVz5BfnNyPGGjOPwb121w3yQCx70ZSW4tncdw9dVcIpqyp5kHjqk+gOTEUr1OfVYmHDykIwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoDLN3WuOntoPoUp+TnSuglqdHwtMnrCwQVCrheLoyY=;
 b=ATROcvl3V5cxLU34xlj4viQ13GcQxWK48bZGqsm3zZ2XiaBVV1tlNKzfbcctUqyV6zplRemXDG0F/1yq2DnFV9SJFzG267/p6H4PZhT4tL91f62XlO5V7IJjQxcB+uuYc7hi4UX+Le1MuW8e7UXHuPY01GtMJh6Sorc/Lh/qpWNW4delaauKdfKgBcCNouTqHIvxbNQP+aEFUepSHVwzjmWAq8mtlAu0wbK2kSmDxxe+9nV/ops/RmD+Okmz0YoQ2LGGmCi7q+T9UkeKdTufVKvvasFZH+9YAb6HxRlNN6DUwhtSbTr/7bDNUkEHzM48OAuu2d8gbAxS6AGdhCFE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 18:03:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 18:03:53 +0000
Message-ID: <9f9cf59a-388a-4b2e-a6d3-42ed59754d11@intel.com>
Date: Fri, 15 Nov 2024 10:03:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-10-daniele.ceraolospurio@intel.com>
 <29b4c644-f70c-4608-b8cf-7a24d8c6817c@intel.com>
 <ec48bace-df0c-4ac4-b666-711555f312c0@intel.com>
 <92bf2146-0cba-4746-9a5e-70403fc24b6c@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <92bf2146-0cba-4746-9a5e-70403fc24b6c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b7586f-ebc6-476f-9da1-08dd059fdda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnRkcmE5WDgrQ3ZEaHdtSHFoMFFFOHBPd3RlWUpDZjNJTElKOXg3QjVOYWlM?=
 =?utf-8?B?U1M0ajVDREd1TjRmQVBtN3I5YnVqVS9tZkJmdWJtdzEzOEV6Q01JVW9QUTJn?=
 =?utf-8?B?aXZncTJkTitMMnBROENzRExSZ0NCOEZyTm9wWi83VkI4R204WVg2RHFid1FN?=
 =?utf-8?B?ZnprVmwzbFR6dVlteDl0T3VTdEtvVzBIK3ZmRDhtc0ZkYnpZL2Nwc1R4NmVp?=
 =?utf-8?B?bzR3dU5wVlpNNlpYZmE5bVdiZFV6LzdEVjJPV3JZVml2REM1KzZZMHg2V01y?=
 =?utf-8?B?QVkzendKMXgrNTJLNTN1SGxwczlQWVVpS0NQVy9kTGU0a1pWelBYWEdabHQx?=
 =?utf-8?B?Sktwa3FZd3ZsMGxTeXE2OHlicWFSczNRSjNPODNzT3VVSnFIcVk1ZkpmY2NH?=
 =?utf-8?B?ekNmNThrdnJ0bUFjdWZzcS9Va0hjRVJnUUFqcEpDcnd1cERCcUdrUWdydlNx?=
 =?utf-8?B?MXVvVDczSmErNzk1NVpHV0tjWmltWXZJdERFbHlFWmV2d01hWjV0d3Jpbjg1?=
 =?utf-8?B?OXVwOWxsRnd1NE1XeUh2YkIvRWszRmZBUjNQNW9zQ0pxU3U5YkVYaXZDUUdo?=
 =?utf-8?B?dGs2NjBySTRlK3BNbExUdk9EMkZGNENSQVpnTmJwN21ZRkprbjlydDBjU3FU?=
 =?utf-8?B?TGovUzZsckM5R01kUjArU1A1c2kwdnEwb1lUT2hEZWF1Tk0zOHpKbko2Mk0v?=
 =?utf-8?B?TGptblhvNit1T1JNcFNzUEJ4SEhUdHJpOTF5M0RGN29GL2o3QXlzZ2pGWmFu?=
 =?utf-8?B?SGFZYm84TmhVUVBwYlhQM0h2eWV5QlU3STNTTnB3ZU5uTkRxWHN4S1gvNGY1?=
 =?utf-8?B?NzI1bldHVEdWUzdvelg1TjJSRkRPWmFWUmNwRC9zTEpyTjh2Wm9zT0Q3T3dC?=
 =?utf-8?B?SWU2ejFObjgvaUIzcmIvZVo2SkhpZzhRa2VQV3hmcnhVRmlMNTdqb3BJejds?=
 =?utf-8?B?VkUwZmowMzI4S3pSZU1XWE9vblltSlljVmF3RmY1QlI2a2JPaHdQNnJYd1hY?=
 =?utf-8?B?djZNZlk2emV6dEhMZlN5T0QrcW9jNnJnNDluQ1B6WDRSQTh1R1ZWTzh4V2xu?=
 =?utf-8?B?cHVXQTlRcCtyOHc3QXU5dmoyY3FRaCtQKzg1RURXeTJ3MXZqWVVLbGt5RnB6?=
 =?utf-8?B?akxTaFhidGZ0T0pyOWlhMzZjdHJUS0x6RU54c0N0aDY2Zytubk5MOERDYTFS?=
 =?utf-8?B?UHBiWm9LRm1BL0JFb255UG90WUR5bjhGcXRmakc4Z1pHWVhITmNad1VhckNQ?=
 =?utf-8?B?b3hCY0RCb1lLcnViamI0TlZiV1NzRmJQcGxMc1NWMEtEb1hyckt1MDlVRDV4?=
 =?utf-8?B?d2NMd1Q2bnAvdThiRERLRUNtNG1MYklDTy9kVzQ5c1RHMC9vS0E4T1NLVXo2?=
 =?utf-8?B?a0plei9vd1g3RURJWDViU3NpNzdPSUg2b08waENpa09UZ2wyeUlOTkVjdEFY?=
 =?utf-8?B?YUI4VlgrTkN0WkV3dEZ3UDgxeHpNajl6Q2dXWHRJQkdwTkVYWWtRT0kzcEU5?=
 =?utf-8?B?N1JJQWs2WUNoTzJWc0o1MWFyVTFLQUs2S0J2WXhNRGxDZksvZkVPSU9PeHVM?=
 =?utf-8?B?NmU0VUNFZmFXL0dZVlJveTdZQXFkMWMrNVUyWFhzcWgvS3I4aVhEQWk0MmZ2?=
 =?utf-8?B?ejB3eXVJODhReHVGQjl3N3VnTjhNeDAvdVVJWGN0bDNGTTE2eThma0t2a3Bq?=
 =?utf-8?B?UENIblJDclRxTHNaNEpRKzFFRnhvOGpkdWpDbjFmMnZSOW9SQ0Y3S1o4T0Ny?=
 =?utf-8?Q?IBS8rT+XLme25YLwLKsa8uxugyZ0Qq4pyUaiW0t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3M1bStETVFGVHBkWTBlK1VpemE4RUlnQURLZFZVRitHV2dGbnRpczRLRG5H?=
 =?utf-8?B?QXJoSTQzengySnJkUjJLN3JKS042NUVXcTRsOUROWmJuOHlVeG1scVIxV3pB?=
 =?utf-8?B?WGlTZDRDTjJLYVhLZEp0VmZmTm80ZExWMTRuTndzeVJDaTlOK2dkNm9FRnps?=
 =?utf-8?B?ZlZjb3BuV1k2TEdrNmpGNldPOFp2ekI5RmhxaXhQeHFhMW4xU0NxaXBHcWUx?=
 =?utf-8?B?ZHRDUGhLaWp4SE45amtBSkdSRkc4WDVHekNKV2RnU0xvdExaSWU4V25rc201?=
 =?utf-8?B?M2V6VHBENHlFMUtHaU5NSlNjZ1FYaU1zd0xhWmR6aUViVlJyOUZQNHhhdWxQ?=
 =?utf-8?B?eVE2S2NEbnRHbHhrQzZOZFZvTEI5dWpKQlVPVHN2VWtLWDVTUGdsRDltdEEw?=
 =?utf-8?B?d2NIejYycE5HbHRRMERkL3VxS1BrM3RJVVZPaFRjWkJaeE5la2t6YjF0Rk10?=
 =?utf-8?B?WFpzQWtibWR4d2NDMDNQdzhhTXN1WWxpSnIzMnM1WlpzQ2tvZ1pIekNQcktJ?=
 =?utf-8?B?VHNVekxjdWhuY3IvYkxxYTBDOHowTmpydDdVbFVrZTQyc3RtRW9PTEhOZ1FN?=
 =?utf-8?B?V0xuZUpUV1NGY1owSHY3MU13eEZQZjR2YlQxZ3JvakptdUhZaGRCeVdKbk90?=
 =?utf-8?B?WWpicmhqWG1QcVVRS08rZ3U3cDZ3MjZnclBmUU11SEJMdEZrU0FkdmVWcENu?=
 =?utf-8?B?b3JOK1lPWVBUbU9nWFVkN09LemFhWDkzRlBKUGM2dS8vcVR0MUphTWU1Z0hz?=
 =?utf-8?B?SDRkeWdZeHRpQ0Z2ekI2OGRnSDMrelFaSkp4ZlZFYU5OdW9yaFdjZFFzbjhp?=
 =?utf-8?B?NW5abEpsdk1BaFE2QktWcXhwaEgvbmtVU2sxK1BXdDRWSTRTM01UZWkydjA1?=
 =?utf-8?B?QzY2T2dpV2phVDNoRjBIa1BoYmdrQkc3UVJDY0ErNXVJSEJLVmxJQjBuYzIr?=
 =?utf-8?B?WHJKVTJsMVhPeERpVmgvTjNVd1NvQUcxQkZzUFRoOUtXT2g1Tnd4NzBIck1x?=
 =?utf-8?B?YmlWY2NReHlIQ2ZzWHZyWmhEZUQwcjhCNTdrYjZaZ1BGUmZyU0crZnR6clFh?=
 =?utf-8?B?cmpsWTNzUUhUellLTUVlK3FnVkwxNkhWM0xUaXIvOTZFUE9idmVNSUpWVEJX?=
 =?utf-8?B?bGtMMEl2U2hnd2kxRHp0aUJJR2VnMHp4SzlyVm9qZXd4ZE1wdGNnUGVFYlAv?=
 =?utf-8?B?Y0YyVnpZb2tnM1JLdHpScmdBall4bHhEdklHckNFaFFPcUZkemxGazFPNS82?=
 =?utf-8?B?bE1LbkhVblNPeTdreGNoUis1YlJVWTNXa0ZVUnFROWh6Rk1udTBlUUZ0MUty?=
 =?utf-8?B?NDZOZlVWM3dTOVd1TjlVME1pNVRyblk1Y0YzUzBJZTJ1aGpLQ3l1SnIrQW9w?=
 =?utf-8?B?QnJSWk9ud2I0QXc4UUZKVlU5bnRCUzBEbk16QktSQjV6YmpGZW5sMjlienJI?=
 =?utf-8?B?K0lBMjRJNmoyNExkQnRZbTYzNW9NZkJ3aWdFd2ZBU0IrUVY4MzNZUjUrVHlk?=
 =?utf-8?B?Ry9pUzBXMnk1TThrZndMNjB3QTF3c3NZU1dQU0tHWWxDZGx5Z0wzSFlXdzJW?=
 =?utf-8?B?Z0wxdmszdnZPOWpBTzhMemgwWHd6YzFrRFhZY3drMmN3a3JDQkFnT2Mzb2J4?=
 =?utf-8?B?bU5QWHJzUkp5TnFDL2c3UHhBTmdYeDFGYUtuNXNrd0hzY2l1dFlibmdtMDFR?=
 =?utf-8?B?cWdsMElQUjRYa1JmaGtaWGs5OXNUZFA2dmdZdkFFM2t4eUhDR05HRkUxWVZq?=
 =?utf-8?B?cndGWVFGTlJobThpYzNRZGI4SWY0eVZEZ0ZIY2s0dEVoU0JqRXQ5QmRZUSs1?=
 =?utf-8?B?bGc5azdNSTRwTEsyem1DWWY4QlZKaWhQV3djYllTakhJVE5JQVdTZXFnTXZ5?=
 =?utf-8?B?ZVNxRzBFVDNzcFUwUlVnYklMWlBmWEplN2NYWGZQbG0zYjRXYU93cFlOSEx5?=
 =?utf-8?B?VDUzcWtSVC9WN2tPdUg5K3FyUGcrUTVIdUR2Y2ZiTTRIK0xPTTRNd1hMWHQw?=
 =?utf-8?B?SGE0QlVTZWczZHBBMmF1OVFsYWNOVVJVdmZ0SDllYzNtUHJXNXpISDBWeStk?=
 =?utf-8?B?d096ck0vRGt1ZXZERW5rOEgvc2NBbFMzWGlEZXQzV1pVMjQ4dVEzNTZOc3hX?=
 =?utf-8?B?clVhdjd4QUo3Wk5kcit6cUVIazM5VDdzZDdTdVoxRm12RXRIUk5pT1pkOHd1?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b7586f-ebc6-476f-9da1-08dd059fdda3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:03:53.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB4AJ6/evYZEuma0I2ZsOfhCX1VkT0cMYejdYAHt8roxVAr5ZYToE3NDdjoITKIJdMwPXMloSHQFEVnl5QeC8Jv7LjE4IP4ldtbBHvj0aWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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




On 11/15/2024 9:49 AM, John Harrison wrote:
> On 11/12/2024 14:23, Daniele Ceraolo Spurio wrote:
>> On 10/8/24 17:42, John Harrison wrote:
>>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>>> The driver needs to know if a BO is encrypted with PXP to enable the
>>>> display decryption at flip time.
>>>> Furthermore, we want to keep track of the status of the encryption and
>>>> reject any operation that involves a BO that is encrypted using an old
>>>> key. There are two points in time where such checks can kick in:
>>>>
>>>> 1 - at VM bind time, all operations except for unmapping will be
>>>>      rejected if the key used to encrypt the BO is no longer valid. 
>>>> This
>>>>      check is opt-in via a new VM_BIND flag, to avoid a scenario 
>>>> where a
>>>>      malicious app purposely shares an invalid BO with the 
>>>> compositor (or
>>>>      other app) and cause an error there.
>>> Not following the last statement here.
>>
>>
>> If we always reject VM_BIND on invalid BOs, a malicious app can 
>> intentionally pass an invalid BO to the compositor to cause its 
>> VM_BIND call to fail. The compositor might not have any knowledge of 
>> PXP and therefore not be able to handle such an error, so we 
>> definitely need to avoid this scenario; therefore, the check on the 
>> object validity is opt-in. Any suggestion on how to reword it?
>>
>> Note that the worst that can happen if the check is skipped is that 
>> we display garbage, there is no risk of leaking the protected data.
> Got it. Maybe something like this?
> '...shares an invalid BO with a non-PXP aware app (such as a 
> compositor). If the VM_BIND was failed, the compositor would be unable 
> to display anything at all. Allowing the bind to go through means that 
> output still works, it just displays garbage data within the bounds of 
> the illegal BO'.

Sounds good.

>
>>
>>
>>>
>>>>
>>>> 2 - at job submission time, if the queue is marked as using PXP, all
>>>>      objects bound to the VM will be checked and the submission 
>>>> will be
>>>>      rejected if any of them was encrypted with a key that is no 
>>>> longer
>>>>      valid.
>>>>
>>>> Note that there is no risk of leaking the encrypted data if a user 
>>>> does
>>>> not opt-in to those checks; the only consequence is that the user will
>>>> not realize that the encryption key is changed and that the data is no
>>>> longer valid.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>   .../xe/compat-i915-headers/pxp/intel_pxp.h    |  10 +-
>>>>   drivers/gpu/drm/xe/xe_bo.c                    | 100 
>>>> +++++++++++++++++-
>>>>   drivers/gpu/drm/xe/xe_bo.h                    |   5 +
>>>>   drivers/gpu/drm/xe/xe_bo_types.h              |   3 +
>>>>   drivers/gpu/drm/xe/xe_exec.c                  |   6 ++
>>>>   drivers/gpu/drm/xe/xe_pxp.c                   |  74 +++++++++++++
>>>>   drivers/gpu/drm/xe/xe_pxp.h                   |   4 +
>>>>   drivers/gpu/drm/xe/xe_pxp_types.h             |   3 +
>>>>   drivers/gpu/drm/xe/xe_vm.c                    |  46 +++++++-
>>>>   drivers/gpu/drm/xe/xe_vm.h                    |   2 +
>>>>   include/uapi/drm/xe_drm.h                     |  19 ++++
>>>>   11 files changed, 265 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h 
>>>> b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> index 881680727452..d8682f781619 100644
>>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> @@ -9,6 +9,9 @@
>>>>   #include <linux/errno.h>
>>>>   #include <linux/types.h>
>>>>   +#include "xe_bo.h"
>>>> +#include "xe_pxp.h"
>>>> +
>>>>   struct drm_i915_gem_object;
>>>>   struct xe_pxp;
>>>>   @@ -16,13 +19,16 @@ static inline int intel_pxp_key_check(struct 
>>>> xe_pxp *pxp,
>>>>                         struct drm_i915_gem_object *obj,
>>>>                         bool assign)
>>>>   {
>>>> -    return -ENODEV;
>>>> +    if (assign)
>>>> +        return -EINVAL;
>>> What does 'assign' mean and why is it always invalid?
>>
>>
>> In i915 we used the same function to both assign the key at first 
>> submission (assign=true) and to check it later on (assign=false). 
>> This header is for compatibility with the display code and the 
>> expectation is that the display code will never assign a key and only 
>> check it.
> Okay. Add a comment about that?

Will do.

>
>>
>>
>>>
>>>> +
>>>> +    return xe_pxp_key_check(pxp, obj);
>>>>   }
>>>>     static inline bool
>>>>   i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
>>>>   {
>>>> -    return false;
>>>> +    return xe_bo_is_protected(obj);
>>>>   }
>>>>     #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 56a089aa3916..0f591b7d93b1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include "xe_bo.h"
>>>>     #include <linux/dma-buf.h>
>>>> +#include <linux/nospec.h>
>>>>     #include <drm/drm_drv.h>
>>>>   #include <drm/drm_gem_ttm_helper.h>
>>>> @@ -24,6 +25,7 @@
>>>>   #include "xe_migrate.h"
>>>>   #include "xe_pm.h"
>>>>   #include "xe_preempt_fence.h"
>>>> +#include "xe_pxp.h"
>>>>   #include "xe_res_cursor.h"
>>>>   #include "xe_trace_bo.h"
>>>>   #include "xe_ttm_stolen_mgr.h"
>>>> @@ -1949,6 +1951,95 @@ void xe_bo_vunmap(struct xe_bo *bo)
>>>>       __xe_bo_vunmap(bo);
>>>>   }
>>>>   +static int gem_create_set_pxp_type(struct xe_device *xe, struct 
>>>> xe_bo *bo, u64 value)
>>>> +{
>>>> +    if (value == DRM_XE_PXP_TYPE_NONE)
>>>> +        return 0;
>>>> +
>>>> +    /* we only support DRM_XE_PXP_TYPE_HWDRM for now */
>>>> +    if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
>>>> +        return -EINVAL;
>>>> +
>>>> +    xe_pxp_key_assign(xe->pxp, bo);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
>>>> +                         struct xe_bo *bo,
>>>> +                         u64 value);
>>>> +
>>>> +static const xe_gem_create_set_property_fn 
>>>> gem_create_set_property_funcs[] = {
>>>> +    [DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = 
>>>> gem_create_set_pxp_type,
>>>> +};
>>>> +
>>>> +static int gem_create_user_ext_set_property(struct xe_device *xe,
>>>> +                        struct xe_bo *bo,
>>>> +                        u64 extension)
>>>> +{
>>>> +    u64 __user *address = u64_to_user_ptr(extension);
>>>> +    struct drm_xe_ext_set_property ext;
>>>> +    int err;
>>>> +    u32 idx;
>>>> +
>>>> +    err = __copy_from_user(&ext, address, sizeof(ext));
>>>> +    if (XE_IOCTL_DBG(xe, err))
>>>> +        return -EFAULT;
>>>> +
>>>> +    if (XE_IOCTL_DBG(xe, ext.property >=
>>>> +             ARRAY_SIZE(gem_create_set_property_funcs)) ||
>>>> +        XE_IOCTL_DBG(xe, ext.pad) ||
>>>> +        XE_IOCTL_DBG(xe, ext.property != 
>>>> DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY))
>>> Two overlapping checks on the same field in the same if statement 
>>> seems unnecessary.
>>
>>
>> I've followed the same approach as the existing 
>> exec_queue_user_ext_set_property for consistency.
> Hmm. Still seems bizarre and redundant.
>
>>
>>
>>>
>>>> +        return -EINVAL;
>>>> +
>>>> +    idx = array_index_nospec(ext.property, 
>>>> ARRAY_SIZE(gem_create_set_property_funcs));
>>>> +    if (!gem_create_set_property_funcs[idx])
>>>> +        return -EINVAL;
>>>> +
>>>> +    return gem_create_set_property_funcs[idx](xe, bo, ext.value);
>>>> +}
>>>> +
>>>> +typedef int (*xe_gem_create_user_extension_fn)(struct xe_device *xe,
>>>> +                           struct xe_bo *bo,
>>>> +                           u64 extension);
>>>> +
>>>> +static const xe_gem_create_user_extension_fn 
>>>> gem_create_user_extension_funcs[] = {
>>>> +    [DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = 
>>>> gem_create_user_ext_set_property,
>>>> +};
>>>> +
>>>> +#define MAX_USER_EXTENSIONS    16
>>>> +static int gem_create_user_extensions(struct xe_device *xe, struct 
>>>> xe_bo *bo,
>>>> +                      u64 extensions, int ext_number)
>>>> +{
>>>> +    u64 __user *address = u64_to_user_ptr(extensions);
>>>> +    struct drm_xe_user_extension ext;
>>>> +    int err;
>>>> +    u32 idx;
>>>> +
>>>> +    if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
>>>> +        return -E2BIG;
>>>> +
>>>> +    err = __copy_from_user(&ext, address, sizeof(ext));
>>>> +    if (XE_IOCTL_DBG(xe, err))
>>>> +        return -EFAULT;
>>>> +
>>>> +    if (XE_IOCTL_DBG(xe, ext.pad) ||
>>>> +        XE_IOCTL_DBG(xe, ext.name >= 
>>>> ARRAY_SIZE(gem_create_user_extension_funcs)))
>>>> +        return -EINVAL;
>>>> +
>>>> +    idx = array_index_nospec(ext.name,
>>>> + ARRAY_SIZE(gem_create_user_extension_funcs));
>>>> +    err = gem_create_user_extension_funcs[idx](xe, bo, extensions);
>>>> +    if (XE_IOCTL_DBG(xe, err))
>>>> +        return err;
>>>> +
>>>> +    if (ext.next_extension)
>>>> +        return gem_create_user_extensions(xe, bo, ext.next_extension,
>>>> +                          ++ext_number);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>>>               struct drm_file *file)
>>>>   {
>>>> @@ -1961,8 +2052,7 @@ int xe_gem_create_ioctl(struct drm_device 
>>>> *dev, void *data,
>>>>       u32 handle;
>>>>       int err;
>>>>   -    if (XE_IOCTL_DBG(xe, args->extensions) ||
>>>> -        XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || 
>>>> args->pad[2]) ||
>>>> +    if (XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || 
>>>> args->pad[2]) ||
>>>>           XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>>>           return -EINVAL;
>>>>   @@ -2037,6 +2127,12 @@ int xe_gem_create_ioctl(struct drm_device 
>>>> *dev, void *data,
>>>>           goto out_vm;
>>>>       }
>>>>   +    if (args->extensions) {
>>>> +        err = gem_create_user_extensions(xe, bo, args->extensions, 
>>>> 0);
>>>> +        if (err)
>>>> +            goto out_bulk;
>>>> +    }
>>>> +
>>>>       err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
>>>>       if (err)
>>>>           goto out_bulk;
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>>> index 1c9dc8adaaa3..721f7dc35aac 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>>> @@ -171,6 +171,11 @@ static inline bool xe_bo_is_pinned(struct 
>>>> xe_bo *bo)
>>>>       return bo->ttm.pin_count;
>>>>   }
>>>>   +static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>>> +{
>>>> +    return bo->pxp_key_instance;
>>>> +}
>>>> +
>>>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>>>   {
>>>>       if (likely(bo)) {
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h 
>>>> b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> index ebc8abf7930a..8668e0374b18 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> @@ -56,6 +56,9 @@ struct xe_bo {
>>>>        */
>>>>       struct list_head client_link;
>>>>   #endif
>>>> +    /** @pxp_key_instance: key instance this bo was created 
>>>> against (if any) */
>>>> +    u32 pxp_key_instance;
>>>> +
>>>>       /** @freed: List node for delayed put. */
>>>>       struct llist_node freed;
>>>>       /** @update_index: Update index if PT BO */
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c 
>>>> b/drivers/gpu/drm/xe/xe_exec.c
>>>> index f36980aa26e6..aa4f2fe2e131 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>> @@ -250,6 +250,12 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>> *data, struct drm_file *file)
>>>>           goto err_exec;
>>>>       }
>>>>   +    if (xe_exec_queue_uses_pxp(q)) {
>>>> +        err = xe_vm_validate_protected(q->vm);
>>>> +        if (err)
>>>> +            goto err_exec;
>>>> +    }
>>>> +
>>>>       job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
>>>>                     addresses : &args->address);
>>>>       if (IS_ERR(job)) {
>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>>> index ca4302af4ced..640e62d1d5d7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>>> @@ -8,6 +8,8 @@
>>>>   #include <drm/drm_managed.h>
>>>>   #include <drm/xe_drm.h>
>>>>   +#include "xe_bo.h"
>>>> +#include "xe_bo_types.h"
>>>>   #include "xe_device_types.h"
>>>>   #include "xe_exec_queue.h"
>>>>   #include "xe_exec_queue_types.h"
>>>> @@ -132,6 +134,9 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>>>         pxp_invalidate_queues(pxp);
>>>>   +    if (pxp->status == XE_PXP_ACTIVE)
>>>> +        pxp->key_instance++;
>>>> +
>>>>       /*
>>>>        * If we have a termination already in progress, we need to 
>>>> wait for
>>>>        * it to complete before queueing another one. We update the 
>>>> state
>>>> @@ -343,6 +348,8 @@ int xe_pxp_init(struct xe_device *xe)
>>>>       pxp->xe = xe;
>>>>       pxp->gt = gt;
>>>>   +    pxp->key_instance = 1;
>>>> +
>>>>       /*
>>>>        * we'll use the completion to check if there is a 
>>>> termination pending,
>>>>        * so we start it as completed and we reinit it when a 
>>>> termination
>>>> @@ -574,3 +581,70 @@ static void pxp_invalidate_queues(struct 
>>>> xe_pxp *pxp)
>>>>       spin_unlock_irq(&pxp->queues.lock);
>>>>   }
>>>>   +/**
>>>> + * xe_pxp_key_assign - mark a BO as using the current PXP key 
>>>> iteration
>>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>>> + * @bo: the BO to mark
>>>> + *
>>>> + * Returns: -ENODEV if PXP is disabled, 0 otherwise.
>>>> + */
>>>> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo)
>>>> +{
>>>> +    if (!xe_pxp_is_enabled(pxp))
>>>> +        return -ENODEV;
>>>> +
>>>> +    xe_assert(pxp->xe, !bo->pxp_key_instance);
>>>> +
>>>> +    /*
>>>> +     * Note that the PXP key handling is inherently racey, because 
>>>> the key
>>>> +     * can theoretically change at any time (although it's 
>>>> unlikely to do
>>>> +     * so without triggers), even right after we copy it. Taking a 
>>>> lock
>>>> +     * wouldn't help because the value might still change as soon 
>>>> as we
>>>> +     * release the lock.
>>>> +     * Userspace needs to handle the fact that their BOs can go 
>>>> invalid at
>>>> +     * any point.
>>>> +     */
>>>> +    bo->pxp_key_instance = pxp->key_instance;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_pxp_key_check - check if the key used by a BO is valid
>>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>>> + * @bo: the BO we want to check
>>>> + *
>>>> + * Checks whether a BO was encrypted with the current key or an 
>>>> obsolete one.
>>>> + *
>>>> + * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, 
>>>> -EINVAL if the
>>>> + * BO is not using PXP,  -ENOEXEC if the key is not valid.
>>>> + */
>>>> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
>>>> +{
>>>> +    if (!xe_pxp_is_enabled(pxp))
>>>> +        return -ENODEV;
>>>> +
>>>> +    if (!xe_bo_is_protected(bo))
>>>> +        return -EINVAL;
>>>> +
>>>> +    xe_assert(pxp->xe, bo->pxp_key_instance);
>>>> +
>>>> +    /*
>>>> +     * Note that the PXP key handling is inherently racey, because 
>>>> the key
>>>> +     * can theoretically change at any time (although it's 
>>>> unlikely to do
>>>> +     * so without triggers), even right after we check it. Taking 
>>>> a lock
>>>> +     * wouldn't help because the value might still change as soon 
>>>> as we
>>>> +     * release the lock.
>>>> +     * We mitigate the risk by checking the key at multiple points 
>>>> (on each
>>>> +     * submission involving the BO and right before flipping it on 
>>>> the
>>>> +     * display), but there is still a very small chance that we could
>>>> +     * operate on an invalid BO for a single submission or a 
>>>> single frame
>>>> +     * flip. This is a compromise made to protect the encrypted 
>>>> data (which
>>>> +     * is what the key termination is for).
>>>> +     */
>>>> +    if (bo->pxp_key_instance != pxp->key_instance)
>>> And the possibility that the key_instance value has wrapped around 
>>> and is valid again is considered not a problem? Using a bo with a 
>>> bad key potentially results in garbage being displayed but nothing 
>>> worse than that?
>>
>>
>> Considering that the instance variable is a u32, even if we had an 
>> invalidation a second (which is extremely unlikely unless someone is 
>> actively attacking the system in a loop) it'd take way too long for 
>> the value to actually wrap. And yes on the second question.
> If it is a malicious app, it can be much faster than 1Hz. It only 
> needs to attack at 1kHz or so to bring the wrap time down to something 
> realistic. But if the malicious app can't actually get anywhere even 
> if it did successfully spoof the key by forcing a wrap, then it's 
> still not something we need to worry about. Because it is not actually 
> spoofing the key, just pretending to?

The PXP termination and restart flow takes about 100ms, so ~10HZ is the 
absolute max speed of the key increase, which still means it'd take 
several years before a wrap. Also note that AFAIU an app can't perform 
an attack on the key, because it doesn't have the access; an attack is 
more around the lines of someone trying to intercept the encrypted 
stream (e.g. disconnecting an HDCP enabled monitor and replacing it with 
a non-HDCP connection counts as an attack). And as you said, even if the 
wrap happened and a malicious app still had an invalid BO that now 
matches the key value again, the only consequence would still just be 
garbage on screen because even if the key instance count matched the 
actual key would be different.

Daniele

>
> John.
>
>>
>>
>>>
>>>> +        return -ENOEXEC;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>>> index 868813cc84b9..2d22a6e6ab27 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>>> @@ -8,6 +8,7 @@
>>>>     #include <linux/types.h>
>>>>   +struct xe_bo;
>>>>   struct xe_device;
>>>>   struct xe_exec_queue;
>>>>   struct xe_pxp;
>>>> @@ -23,4 +24,7 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp 
>>>> *pxp, struct xe_exec_queue *q, u8 t
>>>>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct 
>>>> xe_exec_queue *q);
>>>>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct 
>>>> xe_exec_queue *q);
>>>>   +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
>>>> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
>>>> +
>>>>   #endif /* __XE_PXP_H__ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>>>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>>>> index eb6a0183320a..1bb747837f86 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>>>> @@ -108,6 +108,9 @@ struct xe_pxp {
>>>>           /** @queues.list: list of exec_queues that use PXP */
>>>>           struct list_head list;
>>>>       } queues;
>>>> +
>>>> +    /** @key_instance: keep track of the current iteration of the 
>>>> PXP key */
>>>> +    u32 key_instance;
>>>>   };
>>>>     #endif /* __XE_PXP_TYPES_H__ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 56f105797ae6..1011d643ebb8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -34,6 +34,7 @@
>>>>   #include "xe_pm.h"
>>>>   #include "xe_preempt_fence.h"
>>>>   #include "xe_pt.h"
>>>> +#include "xe_pxp.h"
>>>>   #include "xe_res_cursor.h"
>>>>   #include "xe_sync.h"
>>>>   #include "xe_trace_bo.h"
>>>> @@ -2754,7 +2755,8 @@ static struct dma_fence 
>>>> *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>>>       (DRM_XE_VM_BIND_FLAG_READONLY | \
>>>>        DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>>>        DRM_XE_VM_BIND_FLAG_NULL | \
>>>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>>> +     DRM_XE_VM_BIND_FLAG_CHECK_PXP)
>>>>     #ifdef TEST_VM_OPS_ERROR
>>>>   #define SUPPORTED_FLAGS    (SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
>>>> @@ -2916,7 +2918,7 @@ static void xe_vma_ops_init(struct xe_vma_ops 
>>>> *vops, struct xe_vm *vm,
>>>>     static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, 
>>>> struct xe_bo *bo,
>>>>                       u64 addr, u64 range, u64 obj_offset,
>>>> -                    u16 pat_index)
>>>> +                    u16 pat_index, u32 op, u32 bind_flags)
>>>>   {
>>>>       u16 coh_mode;
>>>>   @@ -2951,6 +2953,12 @@ static int 
>>>> xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>>>           return  -EINVAL;
>>>>       }
>>>>   +    /* If a BO is protected it must be valid to be mapped */
>>> "is protected it can only be mapped if the key is still valid". The 
>>> above can be read as saying the BO must be mappable, which isn't the 
>>> same thing.
>>
>>
>> will update.
>>
>>
>>>
>>>> +    if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && 
>>>> xe_bo_is_protected(bo) &&
>>>> +        op != DRM_XE_VM_BIND_OP_UNMAP && op != 
>>>> DRM_XE_VM_BIND_OP_UNMAP_ALL)
>>>> +        if (XE_IOCTL_DBG(xe, xe_pxp_key_check(xe->pxp, bo) != 0))
>>>> +            return -ENOEXEC;
>>>> +
>>>>       return 0;
>>>>   }
>>>>   @@ -3038,6 +3046,8 @@ int xe_vm_bind_ioctl(struct drm_device 
>>>> *dev, void *data, struct drm_file *file)
>>>>           u32 obj = bind_ops[i].obj;
>>>>           u64 obj_offset = bind_ops[i].obj_offset;
>>>>           u16 pat_index = bind_ops[i].pat_index;
>>>> +        u32 op = bind_ops[i].op;
>>>> +        u32 bind_flags = bind_ops[i].flags;
>>>>             if (!obj)
>>>>               continue;
>>>> @@ -3050,7 +3060,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>>>> void *data, struct drm_file *file)
>>>>           bos[i] = gem_to_xe_bo(gem_obj);
>>>>             err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, 
>>>> range,
>>>> -                           obj_offset, pat_index);
>>>> +                           obj_offset, pat_index, op,
>>>> +                           bind_flags);
>>>>           if (err)
>>>>               goto put_obj;
>>>>       }
>>>> @@ -3343,6 +3354,35 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>>>       return ret;
>>>>   }
>>>>   +int xe_vm_validate_protected(struct xe_vm *vm)
>>>> +{
>>>> +    struct drm_gpuva *gpuva;
>>>> +    int err = 0;
>>>> +
>>>> +    if (!vm)
>>>> +        return -ENODEV;
>>>> +
>>>> +    mutex_lock(&vm->snap_mutex);
>>>> +
>>>> +    drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>>>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>>>> +        struct xe_bo *bo = vma->gpuva.gem.obj ?
>>>> +            gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
>>>> +
>>>> +        if (!bo)
>>>> +            continue;
>>>> +
>>>> +        if (xe_bo_is_protected(bo)) {
>>>> +            err = xe_pxp_key_check(vm->xe->pxp, bo);
>>>> +            if (err)
>>>> +                break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    mutex_unlock(&vm->snap_mutex);
>>>> +    return err;
>>>> +}
>>>> +
>>>>   struct xe_vm_snapshot {
>>>>       unsigned long num_snaps;
>>>>       struct {
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>> index bfc19e8113c3..dd51c9790dab 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>>> @@ -216,6 +216,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm 
>>>> *vm, struct xe_vma *vma,
>>>>     int xe_vm_invalidate_vma(struct xe_vma *vma);
>>>>   +int xe_vm_validate_protected(struct xe_vm *vm);
>>>> +
>>>>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>>>   {
>>>>       xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 9972ceb3fbfb..335febe03e40 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -776,8 +776,23 @@ struct drm_xe_device_query {
>>>>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as 
>>>> write-combined. This
>>>>    *    is uncached. Scanout surfaces should likely use this. All 
>>>> objects
>>>>    *    that can be placed in VRAM must use this.
>>>> + *
>>>> + * This ioctl supports setting the following properties via the
>>>> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses 
>>>> the
>>>> + * generic @drm_xe_ext_set_property struct:
>>>> + *
>>>> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of 
>>>> PXP session
>>>> + *    this object will be used with. Valid values are listed in enum
>>>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the 
>>>> default behavior, so
>>>> + *    there is no need to explicitly set that. Objects used with 
>>>> session of type
>>>> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP 
>>>> invalidation
>>>> + *    event occurs after their creation. Attempting to flip an 
>>>> invalid object
>>>> + *    will cause a black frame to be displayed instead. 
>>>> Submissions with invalid
>>>> + *    objects mapped in the VM will be rejected.
>>> Again, seems like the per type descriptions should be collected 
>>> together in the type enum.
>>
>>
>> This is how this ioctl handles those values, so IMO they belong here.
>>
>> Daniele
>>
>>
>>>
>>> John.
>>>
>>>>    */
>>>>   struct drm_xe_gem_create {
>>>> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY    0
>>>> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE    0
>>>>       /** @extensions: Pointer to the first extension struct, if 
>>>> any */
>>>>       __u64 extensions;
>>>>   @@ -939,6 +954,9 @@ struct drm_xe_vm_destroy {
>>>>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, 
>>>> the BO
>>>>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>>>>    *    implement VK sparse bindings.
>>>> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted 
>>>> via PXP,
>>>> + *    reject the binding if the encryption key is no longer valid. 
>>>> This
>>>> + *    flag has no effect on BOs that are not marked as using PXP.
>>>>    */
>>>>   struct drm_xe_vm_bind_op {
>>>>       /** @extensions: Pointer to the first extension struct, if 
>>>> any */
>>>> @@ -1029,6 +1047,7 @@ struct drm_xe_vm_bind_op {
>>>>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>>>>   #define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>>>>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>>>> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP    (1 << 4)
>>>>       /** @flags: Bind flags */
>>>>       __u32 flags;
>>>
>

