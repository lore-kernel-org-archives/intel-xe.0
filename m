Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A5CDE002
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2726C10E1E2;
	Thu, 25 Jun 2026 23:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrIFREB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8720810E1E2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782431214; x=1813967214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W14PtxaTRsLwdlt2ksGlosvM+CqifKw1VFiUOrEj/Tk=;
 b=TrIFREB47tQl4MyqxXydUAPUY/3KRm+izy4DUXrgAatemwtxf2H4T4fP
 WWSR0ydXnsJ0xybyLqS4prIorkqgXw000b1azzyW3uPcB5DGFcivkW0rr
 N5TLW0LjTc9+PtDF/yF95das+VZmfFX41ApUJLUzYnfFVSdHRwW0plhv/
 pxldS1XZrsjWo5oj3fmnB9oMMMSUnhOaA7WeBR4ERgmAnUJ0Xhlyn4GkP
 qSTcLBj35tr6ajPoHMZemQ+N2PJFhbLBuiz9n394qjuTwfqP5jvY9kD81
 7G7Vukbm1jc2py6UzYBS7giMCtjA6HlIwOT/fVtWJSePmlMF76pZ/iTIO Q==;
X-CSE-ConnectionGUID: AZVk4G31SFeP0db+2YCJPQ==
X-CSE-MsgGUID: /nF+ZvwVQIueL1PougUaoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83106869"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83106869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:46:53 -0700
X-CSE-ConnectionGUID: YFhZq7xHTDmEI3aneM1E7w==
X-CSE-MsgGUID: yejnWFwdSMqBNB6s9qwFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="247810443"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:46:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:46:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:46:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfb7qMxoyuMcY0h+0EH8lcGihI3Xb7BmY6MS6gazIhCS3FyYu/iBXLCLdoLMcpx6JLeXc3z1pJt4u35DyF4HrLxP9ZAcCQtf1sroZ7YM7xhjhEuhRvw9/F5m91urwt09awZjmkdI40tdPayz8dqbQpJljPA8ufOcZzYhJNb9KNtoxi4oQjcJJPNS3t1tKkKEI04fyotIEVdsR92bsdH0d5gj9P/uceOstu2J/Xb7cpk5KYKSkqgn3RzhkpistUmJulaJXjVlqONkiV0KvGERxNWp0vrPaTGX+M6McNnYCEUdCYWjrTIBZpwa6MVeOsRFMSorFQw8NU6LXf9kX9b2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=If2NTJL8TC/K+nBTCfIM9x3Z4pCD0nebra0F672yoSI=;
 b=RQ9jfjccenVC7p7O5o8V5QLnBRRkk9oFws88wLFn1GZrbvTAHBhUdj+U3IgoZpyNw1Mxws6hIbAwRxDknkeh56WSxy/49YP63HUfp8ju/Nt0kOdlKvokll7/Bwt2J2RYELaldEJ5HWT90F6gqk6CefsELkIJrQRqFwWCeQ459m636jTy+LjzLqNTKCdxNdUri9V1U2290Ko3WlfDDdXsnFP5eYhK+26KDkez98GFBNEcTZ4LWiflVud34gO5NhNWp1WFEZTe33sfLGESuN75NxwQeGi1hMcgcWVPYNqbib8QLvUfwCPRA0gUanKXpijRIBepFnrf6zsWERgZVVd0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DSWPR11MB9738.namprd11.prod.outlook.com (2603:10b6:8:353::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 23:46:50 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 23:46:50 +0000
Message-ID: <3fa673c3-af1d-495f-8f42-4a3bde0d442a@intel.com>
Date: Thu, 25 Jun 2026 16:46:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-3-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260603101814.916948-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DSWPR11MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b0a028-5b8f-4628-0dc1-08ded3140701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 60/eRVphJsKWtlBtsoxM2Dq311Hp2U1PmoieQdtcbb/8xA8auBBtuVuIuDA56rDktpiRJ3ZGyQe3i7FUDvuWpOaI17eplYTH9I1KSqews1pR0nCeBxbOM+brizO9u6RzDwMIl8Ymeu/OpAFg4aEmGa6TqFXEJpLN5waRbRlrkABqhm8ZcW8pJtgJpIucllajOTblQ4my89zleuTUKm6MPG6Sk0cHfNMKfAn8hoghnWNM+Cbqw/YOV4exK6bgXjSW9Fzs4jNUp/eYCSv80+LEV7il5ZP1CU39mcNT+SSxV2d7GZiBhljHCsSMnCYTzekTmu90RVe3FZhWr691dEVluQUe1Ox7iVCQplMhfycJ0GrfCzoRxRWMA8fJ7t8lJRBy5daelQRGTif988FSEGN8fP8rjw7+qqq18HMTBHvNVWpeUZjnJBXq5ZNVIvSJcFIXBaPeo4oq/f5Uy2EKBQqMGxmBhMjDWz33ukPnNVCs2HwXsfkq3YkAEO1tEQKueBHqx02oPr88sgLmA0cBcAkctJI7KvNeW4VN+aA64coTkfNbtIFv7pAm9nBJO/bwydvsWjq0pDrmxKLTGIVIyZHKDxxH4EM4IY3N41Ew+cfGN8kEXsiWcf1AuQcfTNkbmE6IZU0MKTvFqBA8Py35rhPtZEr4uBLyJH5krifCEYWbMso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdmb1NtdWJTbUF5WGYrTXZkWVdWanFzS0pnVjJFZmVUL3RsZzBrWDFqSzJI?=
 =?utf-8?B?Z2xqKytYdDVsdUc5ZVY5ckhwMkw0QkEzcml3cVV5TmZpakxPeFEwWjdiUC90?=
 =?utf-8?B?UHc1MjhnQ1g2R1dsbDJuWjYyL1RWZlNWbm1zRFBiRGFZYUdveXV1NmZLWVZX?=
 =?utf-8?B?R3dYc0NQZERaNTBUYlM0bUhDZlBzQmxBQzRPbllkL1c1YnhOUG94SWJkdUNY?=
 =?utf-8?B?bG1yYkVKWjlXcnUvaUliUklna1p1bEwzVzhlSFdaQ28yWVFSditVYjZjN2VP?=
 =?utf-8?B?MXVoZzJxOWN1enlFVzBFamx5c1ZNTFF1UGZTbW9SdFNoS1pnTTMyTU5YNlJ1?=
 =?utf-8?B?OUdGdmJkRE1wZXgvaFc4eXc0RjFZWG1sQ0dDdER5NHhHNDk5anZycmxybUt5?=
 =?utf-8?B?c2ZGb3FXTldNRlU0N0tsQXU0NUU0SW43enhwRjVHRms3UVZjYVhkTy9DOU13?=
 =?utf-8?B?QUNRWFVNRVJaZUF6ZkNyQ2M3dWUwMi9uV0dKOEhRRGVsdDg3aVlOUGdqbmxZ?=
 =?utf-8?B?aEJDSGVBam0xVTJrOThCckM0eFFzTExFeDFudkZsRVhZdjhhbGtPbnVCSEho?=
 =?utf-8?B?VG82V3FlZUNjZEEwcXZZdENVWGdyaTZzc25ndnJXZm5tVHRSWDJOczVCcWZ3?=
 =?utf-8?B?NlJFVzQrN1B2NjNVdWtmQUJUektxY2YxTFpPSXg0eUFpUCtSYWJ3ZGRrTyty?=
 =?utf-8?B?aTFSdmVYNEFyVm5ZMXU0Ymd0NmtFKzNEVkswRjlGWEhxbXpPUEFmdFRJWDdz?=
 =?utf-8?B?TXRtUjFmbFhrRFhBWlljRVJoY1BlU0kyT3Z2MVJwdzFWM1QzbXVOY3B5OFZM?=
 =?utf-8?B?L1k0ZnB0WmNLeFlGWklBVU9yVWwwNXkzbHFDOEhiUUYvZzgwaW1XaVlPM2h0?=
 =?utf-8?B?N0x5RHpPeGUxMFpVZE92QjNwMEpoVlE1UGV5dS93ZEtUQnlTVXZSWWJPZGhk?=
 =?utf-8?B?SHk5SC8vd0loQXkzZDczU1dMblZGdkh0S2JWS0NqVlBPUG85RzRVVlpQcUlq?=
 =?utf-8?B?Kyt3U2Z2Ujh2dEdQVXNZQkZqNXllamdpZTJFN2hDY2drZHVCR2tNbWxxVnZh?=
 =?utf-8?B?dlJVblE3SSs4MVVvMndDRHZzNGxNSk00U1U5V2lEZ2NZdkkxdS9sMk1UaWUy?=
 =?utf-8?B?dDcrTVhBV0NHa2hsUG41QXgydUJVMzcyMEJYN25qeEhuT1BOd3RIMXpGbEs5?=
 =?utf-8?B?YW9wWlMwbjJmMFJqc1IxOHQrVWgrZWc3aWV6UDg0cHp0dGpWeUUrOUV6dzdO?=
 =?utf-8?B?cHA4YUtFTFNDeHRZYng3MllodlNBUzhjNEZOTmY2Q1Q3UitVQUtaOU1Ia1hZ?=
 =?utf-8?B?YXVJSVEramIzcDY3SkVRUjVaK3VrRXhBR0F1MHJiSDBkbmsxVnp6N0dVeXM4?=
 =?utf-8?B?SW00MnQxY2NCNjluQVQzVy9lNnVGM3ZKVG5GdWRuQm9oNjhETW5XNTV1QkE2?=
 =?utf-8?B?dzYxblAzQnpKNnp4Y0xkczJwSUt1K3ZVQWRyVUk5aWFGR3VKbGNPeGlSVGha?=
 =?utf-8?B?ZEhyekNnMis3WjJFRTRBN1p0dlNWV2FlT0w1WDlrZFJKb1VZcUZPNFNLV1Vv?=
 =?utf-8?B?RlVvTUlaSWlwaDBqWk9kTTJwOWVVY3BqRVZ1UDdiZGpKSFRTb3F5SjludktK?=
 =?utf-8?B?eE9Fb1Z3NThqcXI3NUVVVmRqZVl0S05IOXhsVWZSZi9vSExXQTloWHNUNG00?=
 =?utf-8?B?aCtsbU5yZzByTlJ0V1JGazA4MTZyeUQzM1JKaGVVcWJCV280c2VOSHM3d1pR?=
 =?utf-8?B?TjFQcFIwKzBnSDgya0xHVy83cUhaWnJQREkrSDkwLzR1TzF5TWxxS3hheXhH?=
 =?utf-8?B?ZDhhY2dQNmkxdDFOaThLNUdBd20xNHhNWEZIdVJqbFl6QXB6cFhsTkI2WUVD?=
 =?utf-8?B?ZGdXaEhiWmFUTVB0NGM2SjNmcDJ0MnZUd2MrcElOLzdyZnRucnhCU1Q0YTNC?=
 =?utf-8?B?a0dpaGd2Y2x0bjc2bGV2M29uVlRHdEYreWVDbUIyM3ZXQWhhS20weGZhUE9x?=
 =?utf-8?B?MXQxQXEva0NraGJLa1JWT0pMb1ZqSUVPbmdjMENIWmJQM3FtNVBxNytYWFN4?=
 =?utf-8?B?RlQ1SFZObFhVY3hZZWJOUGJ3WnppV3pEaEF3TTlML09ZRGw5TEFvNXVLd1FK?=
 =?utf-8?B?djlyTm1rTXpzWHplUVJjaGJRcEFaUlZOb2FBeXhWWW1zdFM0dWNpNVZTNkM5?=
 =?utf-8?B?QjUwNU02NzdhbnF1VkZPVHVFZ0hmRzhhV20yRmR5N3FUUWtQUi9nYjV6a2Rn?=
 =?utf-8?B?UDE2S1FNSURuamEreXVhbjUwMFllY2xIUm96QndwamJrYy9GU1pjWVpCaHNP?=
 =?utf-8?B?OWdjei9JRFE5QVE5WDZWekNSQkpqenZHeE11N1E3U0NOZ01PdFM4SU5BeUFl?=
 =?utf-8?Q?zPk0M8DkJUoLOk4s=3D?=
X-Exchange-RoutingPolicyChecked: O1BOTDLVVD8f6Gt6RdcBYU9/CoPqa8E04Yz1hutNy0qToVdaNfmw1xtE4x6xIVh1wywTrPLI4a8CCdxcy8IJJSJNf3YTo00bCiQi8Xi3YrKlEeTBsho+EPu2J0IxMlre4eImwG0zKIoqBdMuc/90Gh9VG4DxZVsFLmik8Nzr6e1wv8m/Noj5t/J+2PJksZ87KhGtcpjwCQrY5bMoXGIfyDUeuQfdTxnMCpHctGObwoF92JHxWmwxCAr7fYjLK38DQR1A8igRNdUPgK0uIdZDo1enDqn/lxVOobpb0XlLJAAeJTAbuAfvq2eElc4yYQSmt80hcCDvX6ZMtNEdkzIwXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b0a028-5b8f-4628-0dc1-08ded3140701
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:46:50.4687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HgvDAMIaCTLNfKH0I4auWx38Op1VEB+3ErJDsQS/wM3f99c9KCs10ppHfqNi/62PzeCo2LdiCDEYKwpTE1rfVtXMoxKSii3b0aQyPpqiXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9738
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



On 6/3/2026 3:17 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing GuC submission
> after PCIe FLR, introduce guc_exec_queue_reinit_kernel() helper. This will
> restore kernel queues which might have been killed before PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
> v8: Introduce xe_sched_reinit() (Daniele)
>      Maintain timeout per scheduler instance (Daniele)
>      s/reinit/reinit_kernel (Daniele)
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 ++
>   drivers/gpu/drm/xe/xe_execlist.c            |  6 ++++++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  6 ++++++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  1 +
>   drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  5 +++++
>   drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ++++++++++++
>   6 files changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 2f5ccf294675..cca1ded68db7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -274,6 +274,8 @@ struct xe_exec_queue {
>   struct xe_exec_queue_ops {
>   	/** @init: Initialize exec queue for submission backend */
>   	int (*init)(struct xe_exec_queue *q);
> +	/** @reinit_kernel: Re-initialize kernel queue for submission backend */
> +	void (*reinit_kernel)(struct xe_exec_queue *q);
>   	/** @kill: Kill inflight submissions for backend */
>   	void (*kill)(struct xe_exec_queue *q);
>   	/** @fini: Undoes the init() for submission backend */
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 9fb99c038ea8..f67b55782993 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -403,6 +403,11 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   	xe_exec_queue_fini(q);
>   }
>   
> +static void execlist_exec_queue_reinit_kernel(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +}
> +
>   static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	/* NIY */
> @@ -466,6 +471,7 @@ static bool execlist_exec_queue_active(struct xe_exec_queue *q)
>   
>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>   	.init = execlist_exec_queue_init,
> +	.reinit_kernel = execlist_exec_queue_reinit_kernel,
>   	.kill = execlist_exec_queue_kill,
>   	.fini = execlist_exec_queue_fini,
>   	.destroy = execlist_exec_queue_destroy,
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 67d8ce368486..1e38cfa19a58 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -76,6 +76,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   	};
>   
>   	sched->ops = xe_ops;
> +	sched->timeout = timeout;
>   	spin_lock_init(&sched->msg_lock);
>   	INIT_LIST_HEAD(&sched->msgs);
>   	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
> @@ -83,6 +84,11 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   	return drm_sched_init(&sched->base, &args);
>   }
>   
> +void xe_sched_reinit(struct xe_gpu_scheduler *sched)
> +{
> +	sched->base.timeout = sched->timeout;

IMO long term we should probably have a more generic drm_sched_reinit 
call in the common code, so that if new fields are added that need to be 
updated on re-init they are automatically handled, but we can probably 
do that as a follow-up.

> +}
> +
>   void xe_sched_fini(struct xe_gpu_scheduler *sched)
>   {
>   	xe_sched_submission_stop(sched);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 664c2db56af3..22e24b4b7171 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -17,6 +17,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   		  long timeout, struct workqueue_struct *timeout_wq,
>   		  atomic_t *score, const char *name,
>   		  struct device *dev);
> +void xe_sched_reinit(struct xe_gpu_scheduler *sched);
>   void xe_sched_fini(struct xe_gpu_scheduler *sched);
>   
>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> index 63d9bf92583c..e73fdacca164 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -51,6 +51,11 @@ struct xe_gpu_scheduler {
>   	spinlock_t				msg_lock;
>   	/** @work_process_msg: processes messages */
>   	struct work_struct		work_process_msg;
> +	/**
> +	 * @timeout: timeout for the scheduler instance, to be restored
> +	 * during exec queue re-initialization
> +	 */
> +	long				timeout;
>   };
>   
>   #define xe_sched_entity		drm_sched_entity
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ab501513d806..2c514f2bdda7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2040,6 +2040,17 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> +static void guc_exec_queue_reinit_kernel(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), drm_sched_is_stopped(&sched->base));

This assert should be in xe_sched_reinit. with that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +
> +	atomic_set(&q->guc->state, 0);
> +	xe_sched_reinit(sched);
> +}
> +
>   static void guc_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	trace_xe_exec_queue_kill(q);
> @@ -2282,6 +2293,7 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
>    */
>   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.init = guc_exec_queue_init,
> +	.reinit_kernel = guc_exec_queue_reinit_kernel,
>   	.kill = guc_exec_queue_kill,
>   	.fini = guc_exec_queue_fini,
>   	.destroy = guc_exec_queue_destroy,

