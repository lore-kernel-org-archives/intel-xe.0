Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EBAC982C0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 20:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A6C10E363;
	Mon,  5 Jan 2026 20:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax8KaXb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0286F10E363
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767643358; x=1799179358;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9YQjsX10SAE0MU2EnGUYn4RHc87wqDPaIOSwlgmFUAI=;
 b=Ax8KaXb1knUG3BTCvBMBmWqPHct68cSDwODlFK4SNNdm1zRuuPC2LbvQ
 EC7Goq/gox6gVL2an9HXNMrjkvaFEacn1VSlHfOcRZ0vrQyLnMsFTAYY5
 pai77wj/+kqy6rZes4ZgepD3Mwcel7e8mrVEhOnjME/B8jPt3pEeg4efj
 LpM+KukLcNc3fMW63OdcLdr/1Ixjnn4yrtyMUokfglwbB/HsXjLDZdr8/
 QQG/yUJmih9pH6rmpWxA8dRSHnOxGN8144gygjUKOT1XYQBp8c+fzf1J3
 4JYGwH6Heucw1rtRt/PPX4FHFuyPUX24v7FYRo6fO2YuHBUxChdU8m/CQ A==;
X-CSE-ConnectionGUID: vzCrNx++TWGcIEec5ztcGQ==
X-CSE-MsgGUID: e7RWZbQyStGGNP2RVYpgJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56579713"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="56579713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:02:38 -0800
X-CSE-ConnectionGUID: +6CmGu7RQNOQlxwUermsvA==
X-CSE-MsgGUID: a5kOXZ+CT8eXBFmtJnvcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202719509"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:02:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:02:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 12:02:37 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:02:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjrJsB2BG1UrRM0n3qN9XPmTdVvME8grQqn3APCvrJpNKG1bZP9EzBNQ3M1wKVQ2h3jPoU7N32oZ8VO/Mpi47RDHi0Qd1kXNBsqvmW0tzAop+flxCTavzH55ypqkP9l0uGTcZ+QezDOBbQzhp6UJ5X9u965VZIcjOmW8Xrnaj9N5nNLb7iu6ppRXqLKQB/KieLQivdA5Hvf94T19wBKk0pcD6pIr91xVrtFtsoZICuJeBsJDPvxbfqIvnwGoFERnHfROIt3Y5u8JK4HO73bM43v/4k3oJuAEGCuffKgDzdBbWCtitIIUI6SoySXqLkET6davk3P043De3UAeehBWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ/gzcTjdJ3gVhKfLTB2cKGR+fK8i55DCIHnnFGQEXA=;
 b=HziYEBDW8qDPSy5Jx9ruCEGYVW1XrY0PVib9LpDnN5U6SD13qnZsdxlvlk0LmCheWvJr07bzrU/1Nwk+a28h1aRp/rgrAQtb8uZ4ZTErzNakKBS00Ez9DVZ8SPSe99Bj9gOBpvGatzfTxaLnJhrgj4tXPN/gjNFGit2ORVCP42BN4gWO8+aoCxAEL48FAnDbKDnZWzkvaWhEH9BWaw6LNgntzh6xQy3tLBsXFMjrdHXIeP5Y7APBYAthWOXAXoab1aBKNtEEkcFkJSS4hJoWj/eJU12pswoe00iqnutsDNpKUNCKz1/0BCZzlbDi/qkKK0/JJkNjFqh3L65DdgDvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:02:34 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:02:34 +0000
Message-ID: <cbed73c3-db1d-4d2b-8d6b-39e6d32ab795@intel.com>
Date: Mon, 5 Jan 2026 22:04:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
 <176763926313.9480.16817172111730313247@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <176763926313.9480.16817172111730313247@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::19) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf9a0ae-e869-4f00-ccca-08de4c955dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDI1MXc3b0IrbHJKOVN6NkUzZ3NqUUlnYzk1MVlPSnp1d2pPYTJZL214cUNF?=
 =?utf-8?B?L2VtV0lET2U3RVRucVgrV3VteWRmZ2pFaWpxZXlkZ0lLSlJtekpaYTRmeUZQ?=
 =?utf-8?B?a1JnemI3aXUzaFlIcEkwcHEybzZoSFlScUE4MGExVHVpa3N4cDkwOUdJWEhQ?=
 =?utf-8?B?QzFWUVg4VUR6WHpXVXYvNklPdkdlRzJXdXFMRVBtbVE4K2FKVmtqazJ1MFpv?=
 =?utf-8?B?WjB0UVc0d1dVc3VIcnZURzFSNVU5OHpkK1hpSGI4aUNDYms3MUZwTFVhKzdX?=
 =?utf-8?B?VHdsWHUwOTl5SS9tRkxLS2ZsMHduUnAxRzNZSi9EeWNJSTY4TVlpMjJvem5h?=
 =?utf-8?B?RkN4ekVwZnJzNG9LTEVHTnpxK05GakoycWVmcG9VOWo0SHJuK2lsYkZ5cXNy?=
 =?utf-8?B?d2RLTURrWEk2dmZ0T2liYVFuRzVQb214L0laOUMzbTd4MENnZTB0QmVGSlR4?=
 =?utf-8?B?MElWVU5sN25ZTnl4T2s4ZnNhckZUdEtqTzJIMXZyZ1dyQU1mVHA5NjNxWWpn?=
 =?utf-8?B?ZVA4NWMxV0dsL2Z4UGZGcDZKTUkwWmhSQnV4WnRlbS9XNDJyRW5KVXhkdzN6?=
 =?utf-8?B?M1JETXdoSzlzYWRzbXk4cTN0WDFqMHBPT3kzRlRaaTdaTVZUMk1xczllM0JR?=
 =?utf-8?B?cUNId2ZrMVlOY3lrRnRHUWxhK1kvcWlJVlVqZnpkb1VONElPNVlIQWFoak11?=
 =?utf-8?B?RURwbUJsVnk3VWNIM1R1VENITUpTUXJMdXNaZHUySVdrdTR0Kzh0b0g2alBk?=
 =?utf-8?B?c0UxSG9FT0pmMnRTcElzYkRHZzJFUm5qMFBhVndDUmMwelh2bC9GZVQ0V0Yz?=
 =?utf-8?B?U2JEdWVURGQrVHhUNnBweXNlYlFQbnoxak1Wd2VXSVQzc21sZDJrQTlNd1c5?=
 =?utf-8?B?TUhORU0veVVqK09keS9SV2hEMllSa2JRa2hQdnE4eEErckUzYittaDA5bTNR?=
 =?utf-8?B?KzAxOUl3ZmoxWDRwUno5UW5xZ2liTVJoV2JvbU9tWE5hS01CT3FGaks2ckpo?=
 =?utf-8?B?OTcxcGNJMFVKNHF2RXJJVVNZZHJWc0ZoL29YUG5BVG9yQmExS3hLaEVZbm1t?=
 =?utf-8?B?VmF0R2ZrcEFYVzlLc2NRSWtNZm5SZUFRZVNRZHhNTzMrRHRZUDFFTDAvZ2Ju?=
 =?utf-8?B?NXZrUG9mLzVlZ3ZseVZ0UDJJRFo1Y0FDOXlWM1JJb2daMmhPNURpUlVNbDJz?=
 =?utf-8?B?MUVIOHJ2cVZNYVdNK0hZdml2S0hrcVZ5bGhPbENFQklYaEpyMU1LMmZ1cnZE?=
 =?utf-8?B?aWphUHk1VTRyMkhyaExhU3MwemdtY0NsQ09pbm1ET2FTRHBzdVU1VlVvdTFD?=
 =?utf-8?B?djNXOXd6K2hWTGk4dDBTZHZ0ak1jNy9rVGVDYWpuZjFhN25kUnFhcUpBN1B3?=
 =?utf-8?B?eVVKNEo3RUs5ckE0WURONE81STVFbjNLaWtXOHQzdWNKUGxUZXRESU15aHE2?=
 =?utf-8?B?L1g0MjlOY0JmNFVFWmhMMVFjTUp4ZklYYUhrdDJQNTRLTEU2ajdyUDJBdW1W?=
 =?utf-8?B?VFRlM1NzV2FwYUI0UkhMZEwxUnJOMFYyaEIyKy9nNGRpZmtnTE92NWU2cVc5?=
 =?utf-8?B?L3RDZHZwQXJsWUJmVFQ4cS95YmFzWEI3cTV6TThTWWZSWjRiSzd4SHFUK3B6?=
 =?utf-8?B?N3B2T21zNERQTXdTWjFoQ25ZK00zcUJ2eGFmVG5LMW9kWXpBMkVrTDIraCtX?=
 =?utf-8?B?Q2RBMi9ZVHVqQmhMRjQxb083MWRkY01YUnhUc2w2T0ZoYU51dFlYUkc5aEFp?=
 =?utf-8?B?aklzWUF0em1STCtiYW1aRytIRGpXd0FLY1BhVHJvbUJ6bFdzZVZnZzJlVEN0?=
 =?utf-8?B?RjJ0R1dHdys1NnlZdWdYNnBjOHFVaEwrLzNBNkV3cm5YWXJ0eVdCTnZ0S29x?=
 =?utf-8?B?cVExMVI0TVhFcCs4dmh3dXU2RGRuTkNsNXExeU44S2tOTXVmTFlaWXJiTUpH?=
 =?utf-8?Q?yQzYJQ9+BjP6tOPDqFtEwwkq84XPS+Zj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhadFV0L1FvOG04SlVhaHRvVGN6TmZFU2ZnL0l4RktpQ2w4U1Z5S2ZmTEtU?=
 =?utf-8?B?czQzTnZIdWpuYUhkdW5MQU5HdVVQTU5SRjJKUzlzRHZUQUZRVi81SjZiRkkw?=
 =?utf-8?B?aWc0b2lXWisyOExYVkRxTWp6OGExQXkrWDROKy96NzIwanRkdTZpYVZTT2N5?=
 =?utf-8?B?Zy85dDNoMVJNUmduWW5LdXZTNkJSOXpNZWVzdU1iZjR6RFRxMDZ5NkFKTlJF?=
 =?utf-8?B?SWVjUHB3d1ViSUNML0pwalpEUWdhNEFRUmZVODVyMCtpTitvNmw2ZUV1dVps?=
 =?utf-8?B?WmszYXhWemorU0V3V2pBR0R0TXVPZzBuRjU0R1p1WW1kSXN2SlBRY05HVFdV?=
 =?utf-8?B?SnZMZHJ6NnN4R1psT2NZdmJLRklXbTFlcHhmVUxIMGxHQXROMnFVTGdWbGt4?=
 =?utf-8?B?NXJ6a3NEUkZkVkUzangxVVRIYTRaSkJyUkppZmx2MWQ1R1BNOFAzT1IxSERv?=
 =?utf-8?B?bllYOUkvSTZ6K2RSalJiblJyUnFZNndxL09lbjNqSHlvSEVsRmwxcHBUQXJr?=
 =?utf-8?B?RHZvZDhXWDZ3OGlheEJYV2Y3T3NlT2RwckR2RmNlWWVGTkRFUGVIU0tlQmlG?=
 =?utf-8?B?SFBVak41VWhhRVJzTnhEZUpEeUhzN2R6aVU3VGdiZnJPdU1lMkt1U1ArS3Fi?=
 =?utf-8?B?bGY4akpxeit1UlNUSVJiMjV1WGlRRG1aa1lsZi85cWN2Vkhjdm9xRlg5eEwv?=
 =?utf-8?B?SkNwVi9vYVMwY09aaUVqNmd6TzVERmd1dnlWQUhrVE9TMW5yR2YvQjlxUjVJ?=
 =?utf-8?B?RGJ5NnFXa1pwaTRZUEJuVEx0NGhEUGNXYWR2V1RZQWNlK2E2NkwzRTQ5dFpO?=
 =?utf-8?B?M2h0cWtUc08xeUdlbWdhWWFoMElsMERNeGZiZGlYT0NvU013MUFTdWRzNDc0?=
 =?utf-8?B?c01SMWNaVFV5UE1qbGZrUzloLzlBem5iRXFpNklYam95SHJMUnlCUmlkZVNT?=
 =?utf-8?B?VXowdUhOTGM4R2V3TGdGQmp5WmsrV1g2V2lrMVpBdUtXTDdkWFE0ZCtJUWFy?=
 =?utf-8?B?eTVJS3laUXNTZGZuLzZoMDFlWFljdVJiZ1IvRE5zNlczNDdWVHl4YlgzQkJs?=
 =?utf-8?B?Tk1XOFBFNFVjZEx2T3hxSmo5Q0VLcVhTTmFtOVZucFNlbStPN0NmbmV1NFZR?=
 =?utf-8?B?TFgvNFRrQlBpdmpJSmZjQlMvR3poQXR4ZG42YXpKVWxUMnNtN0V6RWdoS3I0?=
 =?utf-8?B?Sk8wVmUvYXpaWkIxOGdZdSs0MUFFOWFDaVJ5UWNZVmg4MVNYYWliUXJOemRY?=
 =?utf-8?B?MVNvd0E5dStiZVVHZ1l5anBlaTVRWFlJaFBQUHZEZXBCcWJva3lsMXlKblNC?=
 =?utf-8?B?TzdGOUk3SkxRaWhtUE9mSTgvSHQyMDJ4SWFVYXRsME00RDdLZmFwRDBtM3U3?=
 =?utf-8?B?OTE4N3Zac3Q2MWcxOHhDdS9QSURyTXFVMGZ5ak52bC81aUp5VW44MWUwbFli?=
 =?utf-8?B?TFJLek5VRXVlZzNzQXJJMWJyZVBKcE1mdENEam1BTEcvNlo5R2J0a2tWc0Ew?=
 =?utf-8?B?SHlwSWlieDhZdldnZWpLdzBEVzJubmFJOEJDaEFqcG92bWlVL3pWNHFYeWVz?=
 =?utf-8?B?TFRZazltbm1zY2J6aS9Jd25odmdWL2hkSDlzT2xuQXZBZHdZenFXU1N2eVYx?=
 =?utf-8?B?L2UwMHFWWnVtbkJFMmIzZDkyTCtDVERxREFaTFUvdldmYnNKU0JTUVVFWWNt?=
 =?utf-8?B?OEVqbFJjMTFHdjBkTWIrcEJUTHAxZTg3QkF3MlVEZHJ5cHZQNG9PL0FYaUxG?=
 =?utf-8?B?c3dsUW9iQ1VPT3N5bTBNbXNYWEZRaHYreG00ajJFWEJCTUFyRU1laU1xRlhO?=
 =?utf-8?B?M05Kd3lpYzBCdjB6YzMvT2ZvQ1BVR1JtbXdnVVMrWTVGQ1BCdFNoTHVsZElz?=
 =?utf-8?B?MjZPWksyZ2I1QU9QazFwV082NzJybkk5a0xHcThQSTRXSlJIYTVZQmJreFNr?=
 =?utf-8?B?RGN3UTJUTGxlS2pjb25EZ2QzNFFYSzNUYWhJSXQzUkJEQkMyZDdpazVQN0hl?=
 =?utf-8?B?SVZnRi9YU3NDNlBZWFNWYXRRRTg0RG5NYVdyVkd0RHErd1hLNURnSVZUK2xu?=
 =?utf-8?B?RFM0aWsyKy90VURDY0RXTUJiU1R4eFJ5SFZHcXo0VkcxQkUzNDluT2JucU9P?=
 =?utf-8?B?QWtRcDIvU2VHcjM5MUlPaThTb3M1WWorUkxoWHBWTWtxU0J4WXF6SnF1MDk4?=
 =?utf-8?B?V285amNJMHNsTDg3U09velZXc2h6VEt6NnV4UmJVRjlJcDYvNnVqWTZoZk9r?=
 =?utf-8?B?d1pZZHV2OCtkbG1NNjNkWVJmUkd5RmI3OXE2ZWg5WXBVbHhYaU5lNDV1a25z?=
 =?utf-8?B?OGZYK1pQcTZYSys5QmFseFlGNzBOdTF6OG82QVpiYmdHc2w4SnlCa2VvaS9E?=
 =?utf-8?Q?wGVdsz2ueSw7hUi8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf9a0ae-e869-4f00-ccca-08de4c955dfe
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:02:34.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlePW8hMqmJRWeLR80+UvfQDs5YFVvuDdvZMvUBopuyryS5R73lpb58lYH5hSPN1A9HJ42UaC5jT87cOEDXBIasdtmHFA8NcVXUkURuhxDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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

On 05/01/2026 20:54, Gustavo Sousa wrote:
> Quoting Lionel Landwerlin (2026-01-05 12:02:22-03:00)
>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")
>>
>> A recommended tuning setting for both gen12 and Xe_HP platforms
>> requires that we grant userspace r/w access to the
>> COMMON_SLICE_CHICKEN3 register.
>>
>> Bspec: 73993, 73994, 31870, 68331
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index 1391cb6ec9c62..4dcbc42574bf5 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>            XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
>>          },
>> +        { XE_RTP_NAME("allow_common_slice_chicken3"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> With XE_RTP_END_VERSION_UNDEFINED, this spans to any current and future
> GT containig graphics version 12 or higher.  I believe we need to limit
> this to 12.74.
>
> --
> Gustavo Sousa


The problem is that UMD still wants to enable this performance feature 
from this register.

On Windows there is a way for the UMD to request the programming of the 
bit without the allowlist on Xe2+.

But there is no such mechanism on Linux.


-Lionel


>
>> +                       ENGINE_CLASS(RENDER)),
>> +          XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN3, 0))
>> +        },
>>          { XE_RTP_NAME("1806527549"),
>>            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>            XE_RTP_ACTIONS(WHITELIST(HIZ_CHICKEN, 0))
>> -- 
>> 2.43.0
>>

