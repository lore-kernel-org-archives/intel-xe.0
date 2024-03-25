Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813DC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 23:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA33310EB9B;
	Mon, 25 Mar 2024 23:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVt43gYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965CC10EB9B
 for <Intel-Xe@lists.freedesktop.org>; Mon, 25 Mar 2024 23:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711409573; x=1742945573;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iia/x/NlRMhqS1Ki+lzPe35QTm3THdXyDqgc+qTup40=;
 b=AVt43gYYI7VrYLYNDkmPSMWISM0kNL3tdbCAubc9MuWFpRs7SRzgnKHg
 cU+XJenU6DoM/qygHLp9j1VtRLE6FKTwQGg7PJAlWiZufT4/NQMZc64w5
 XVDYpJAT599nkf9l5fidPoFOrw2FsSSwyQFsCwLnooDl7M8D/i29zCA74
 ZuI6MMBzukYTrHTMxqOhT9VLdCSdT8qu51QFGTCkOzsalJtq/Ak+64VCT
 MbXuF97QrGCldEmZIqbiyEglD5A8IxMm/avmq0hopyOr4a45tjjTAHwbt
 uV7KgPnCcpCu17Tyk5Xa5ZMuoBMr8I/6Q3RYLycPBxxGwRrdUY4zzQxQn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23923657"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="23923657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 16:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15739682"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 16:32:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 16:32:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 16:32:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 16:32:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 16:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq1fjuPhvNSKN29LN5cYG2k2C9O7E1kDGvwp0s190G/dfe6Na7JWM2ih/3mVPCNMC3o+7bIWQXWtj1zKOMpq3RIa+tV0h6qETdnlwnXqNgFnrmn5U1Vm2rs5Ff4WxlU2HcqGsvnWej3Sbz3DoJSNLfwc/ly+DcJ/e95Xyy5Syps4h0L9UoKaPNBpYpveZi4HvaQORhUAHDneOYGvV42AVLuJJ4IAK18sBRzocUYgEKLpT4fNgj3vezFzExB2mc8UzYURcxWvTkGzA8hSlYonvVAYZvJi64ZL0P6gkr0B/csGvf3NwA9QRYWt5Of7cO/SthX8sP76kiMpuEeyA7raeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnqa1xs9E33DeJjc+YzXpGRM/Ef5BDUYreMm951Y5Ok=;
 b=T6KCsTY9G5UkNknCUTuSBcmOMDl8c4TmUNgBH1kSanyo6QQd5oiK5YvgxWvocjkCXC1Z0pRWREinCpOUM1dKC+0jl1A1kL8Slg+PFHpPznUqiRT1TJVGXVvq7pMJX+mSWMf1nKfB6d+nhmqFJGntzQgsVUAGxldx817y4PhwJ7/fmJB46mipGW/u616gMQxxULGTku5dB8gsjfEpYvaibYOfZ+AoIGdNAheXkYo2gm1aMd4ZXYz2KUQ2f9jty8IDSPRESfK/0zPA4Cl9CGPrfIXpicWqZA2SuvWiGUUxsOZW/hw/054TFFpRbbHDPbrcDjWs/O7DM9IlToMqzLVlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 23:32:49 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 23:32:49 +0000
Message-ID: <f5ad70e0-1a4f-4ab3-a730-fed6c4ccc0cc@intel.com>
Date: Mon, 25 Mar 2024 16:32:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Support/debug for slow GuC loads
Content-Language: en-GB
To: <Intel-Xe@Lists.FreeDesktop.Org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FUQFUYNsMIaaddtWfB76gGoRCScpQbO9CBsoTPOZ8HlDKAV1W+CEEc3UQkKQHTMhO+fuvKiHk8qGqaodKPmEF9wfsX5zd9/dGBObrtQ+fIm8QCqsoV0NwhA1yoB90P4Rmjnde0dARGM2tUqB/rdX4Z+qJPTsGPB2dQ+kejP/265tDIBUFzlC+T73JSeOOAFf+xcxLK++z2V6YEkquZvFXdQMbkFDR7A00zpaavoaFAoJkUSJrGtMmO7VjFdDAZibyZJAzkfzbpfyLgSVwomtRpRRzeDRzyT1v+LPM8TVC6WifQG4IM1Cx2rFRyrm1f1GjlYLWaw0AnKpxQdOgwHaIXj4/QKIryFEM7L2WpTjSl9I1zq8YaXJmXvfdRjiQ4mrJ8r1Hl3h0O5+QCfAPyRMxUIMbrEbC3Ps9Q47sU27n+oEeZEElxlISXoLDbMvFpwLfVvpmVCzA6JJi/VirL3EwnyLCu7UgPaoq0onohdVjAs0bLFmcz6fvE7U/uJNXSzjrecgYohvzguso77dGwQGjGO4CRHHHa8OcFbsH6NxbL3YWn6uGfXh3zMsYJl6nwDUTeCTDagSeMcLtu7u7zCYI74uYFglcrk2dmyFJb+V61syqv0HkR4ostIDveoE7Pkll3gtsHgbSpQ7mA+4GZgcg5BLVT+LeJsVW3iSBWsWeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFpFTlJJY0cvQzZwREM1T054YmQzRFMxZkhZSGZ3V3BxSWhlK3hJSG1xM01Z?=
 =?utf-8?B?ZFJ0ZlJuakNkNjNTaDMrck9MMmwrTDBOVGJSd25xc1pucjlsamt4a0hleEFl?=
 =?utf-8?B?VWUzejBKN3huUVNLQjdkM0JzaXpoKzBCeS9WM3VnaEdLcHFDblBROEIyWkhS?=
 =?utf-8?B?RGkzRVZmdXRWdUt2VjNOczBoYU52TTZqTHVNVCt3cmFlekJOYjBkbG5IOXVM?=
 =?utf-8?B?ZTg0TWV6b1dBZE1oSVl5REhPTndjMzB5STRHVUpKNlZ6emFNZ09PUFhIWlFB?=
 =?utf-8?B?RlYxM2NtaUZjZGM4Q1pRaDJtSCtqaGN6bll1czdybTZ6NEVveHh5eUpXYXVk?=
 =?utf-8?B?TnJCTFJOejkxemxuMURUcnUrRkVYSk1CUThUR3RacDNIUGVseDdYdk1GSzVL?=
 =?utf-8?B?OEpxM3hqYysycGZuUytCWVIxczczSm01TEUrTngrY29uR3Nmb0hLeW5MVm0r?=
 =?utf-8?B?SU1nbkNOekt5VlphU29GZTVUU0ZyMFcvVTFmVE9xTTBLWjdQMGszQXA3ZmRm?=
 =?utf-8?B?WFVraUlOOUU3NFBIb0YvejJxdjBEU0x2NFB5aE5hYm03b3RqM2ZBWWJnSTNB?=
 =?utf-8?B?QjRCSGp4d1RXK280dXVOeFJGNGw1OStvSWxISGE0Q3Q2N0ZLclpoVzZEMGZj?=
 =?utf-8?B?bzQyUGJzUjE4WVI1U08rVHZ5TXNXbU02bjY4d012TkJrSWcrWm9sWTRxc1Vu?=
 =?utf-8?B?b2Nyc0RjZ2p6OFNUTjM5Mld0VWhOekRsUjFodTREaTY5czRVRzFpQ1l2WWN5?=
 =?utf-8?B?dGQ3L2drLzYyOTFWNHdxM2wydHZsbTVUbDZ1ZEFaN2hBamkwTXUzV05OVjRF?=
 =?utf-8?B?SGZ6N2d4S0RHZVJQcm1TWmw2VUFlaFJDdWc3T3YzZVNIRDkxT3pEelFKU0VJ?=
 =?utf-8?B?d0hCdlpTanFqc1cyT2pBbHU2U1p5MXN3WGRQZDZ0aTNwY1dsTEJPUWFFUnFO?=
 =?utf-8?B?TEE2b0tBVVBDZkdlMVFtZUR0RUdQRFFSZlVUSGVIYkxud3FPQ2lzUEJKaDBy?=
 =?utf-8?B?cFhVQVR4WVJHdXEwcEcvRlRhTVdIaTc5VzJzMkpmckQzYWNXc1RwS0swN0M0?=
 =?utf-8?B?VjJ0UHh1cEhpU2sxYjJpd0pBcWI1dks5cmI0WEo1QjF6Ykx5eUtTUDVxZXZp?=
 =?utf-8?B?NmRkb3JDMzdLamFPWGlXMVBmQ2NTR3J5d2hyY2luZ3J6UmxmTUNMN0VNU3hF?=
 =?utf-8?B?cUFNTmpabVNlc3h5WnVEcUVOWmJvR1FHcURmNitoVHZlV1B3R1hsZWx6T3lt?=
 =?utf-8?B?dFFzanRpV1gwTmFMeGVFL0lMQlgzSWQ4ajltd3c5RXVWV1oyaG9IVW42QlZv?=
 =?utf-8?B?SXN0ekFrdnFvcXk1ZitmZVc3S2ZETnRScGNsSHZVV3lOTHpnMDlMNC93UTdl?=
 =?utf-8?B?V3c0bFRNYTNpdVMra2IyL2pQZzloeTdxeTFLYWtqc3VzZUlVYzBRaTdiVWZT?=
 =?utf-8?B?V09KNGo3M0g5LzhXUFNnd1I3SkwvdUtaRm1uc1MzaHhxVEYzVFpzdktTQSt1?=
 =?utf-8?B?OTdBRjNQSnk4cmhnQ3Rkdk1icUZOaUIxdUVZbi9iaEJCVDBSZCsrZ25kY1hI?=
 =?utf-8?B?Y0MwLzU1eFJJUjNHRGFnbjZBYmxRNEFmeFRrUFYwYm9iQ0k3UTdYbzdtbFhC?=
 =?utf-8?B?ZStSOXlvaGdQOUFpRlRPTlRWckg4YTdMMklhZThDTThPajJ6NXZFZHFSVUVM?=
 =?utf-8?B?RXNCamNacUJZejl1T2VSSUFkUkVNTzg5a1lGWEx4aGh1UFdLRWxtYWpZeEpD?=
 =?utf-8?B?MjFBalRTSGs4WWxQT3I1T0llUUVsRXdMd2VDUDVaZm1QNmJEdlBydDRGL25a?=
 =?utf-8?B?WE5xaHhRRnZkL2djTXpGSVMvMVRuVndFdVdCS0xacm54bWVicmI2MlZ1VGxK?=
 =?utf-8?B?Z2Y4QW4vN3MyM2t0TFRhaHZpMUVOOGdxRG14Y2hGeWdFWGlMS1FKOTRBMThM?=
 =?utf-8?B?TENoWDQvdVlic2ZVT3N2blM3NlBwd1dQVWRKNktDVU9pSHRyOVZReWduWFNB?=
 =?utf-8?B?UW81RjVvbkVHQXA3OUtPMjQ5aDRJek96MXpHamdoK2l5bTZqWTJmRmNWTXdh?=
 =?utf-8?B?NHVWN2gvellSeWROUVFrR0FUWXdQaGpsdFp3eG9vWU1OTjRFSnU5UGVPUjRJ?=
 =?utf-8?B?V2QzQ0l6VmhkTmQ2S3Vpc0o4YXpLaC9nZjB5TWt2TFM2V0pPaUtoSy9OdnBD?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b558c5-7856-45e7-d220-08dc4d23e23d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 23:32:49.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLg1GruaLiUteeSWMLw6LWvGIiY3+pwbx7YLNWTgwcEOG3j3L9kusZIzLSW5d1GCs11id8+qJovii//VikxVdgyzfqTFmRPHHjxLwWUEdfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

@Lucas, ping for review?


On 2/27/2024 17:09, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Sometimes the GuC load is slower that it should be. For end users,
> that usually means some kind of thermal throttling issue. Internally,
> there can be any number of bugs that cause it. So don't completely
> fail to load, just cope with it and report the problem.
>
> v2: Revert include order (review feedback from Lucas)
> v3: Remove '_sysfs' from throttle file names and keep limit query in
> the same file rather than moving elsewhere (review feedback from
> Rodrigo). Fix the reporting of requested vs granted frequencies
> (review feedback from Badal).
> v4: Manually code the loop timeout/condition checking because helper
> functions are not allowed (review feedback from Lucas/Rodrigo)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
> John Harrison (2):
>    drm/xe: Make read_perf_limit_reasons globally accessible
>    drm/xe/guc: Port over the slow GuC loading support from i915
>
>   drivers/gpu/drm/xe/Makefile                   |   2 +-
>   drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 +-
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
>   drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
>   ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +-
>   drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
>   drivers/gpu/drm/xe/xe_guc.c                   | 226 ++++++++++++++----
>   drivers/gpu/drm/xe/xe_mmio.c                  |  61 +++++
>   drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
>   10 files changed, 307 insertions(+), 75 deletions(-)
>   rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
>   delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>

