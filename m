Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7F7CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 17:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95510E46D;
	Mon, 29 Sep 2025 17:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvRdTCsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB4210E46D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759168439; x=1790704439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LuqT5xyptmCfteWBvPQgFoay39GC/m9n6q0MSLr4q48=;
 b=UvRdTCsQ1qMnjzTTg5Y12KuQCbZcMKLqs1Yu2sG5cAldUIQ+AU3PXN7+
 G5TBCioRmyJAEY0Tm7s1SFspT94qez11goBGKp62NAy87zaY8mut6wb/E
 BBBWse+VJ1ZO8A26BdPr7gugjE+zbm/5tIrG+pKibal4ECVi/59yzYIia
 Dlm2kHOGitbOGpdTPChq8d3zhlFYNhtWquhRGL1TIME/9EKj3rtRBrB8a
 3TfEnNynShk4ZWOc5CAGfWBu9/SLwNdczj69/XQnA6ms6nVnjTi0VvuL1
 7dGZ385n37Y8Q1weHtcSm72PpEZcfGK+UW00ZjM7Tz2uQTtA77VEZ65Nc A==;
X-CSE-ConnectionGUID: aCwyD73MTWuXu45TLM8a5w==
X-CSE-MsgGUID: rg5bKK/6QuiuE9i1xDfbtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61373312"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61373312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:53:58 -0700
X-CSE-ConnectionGUID: tJsBYrfyT7mh8zuBHAAPYQ==
X-CSE-MsgGUID: AUObDtGpQ666u0WtaSv6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178688304"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:53:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:53:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 10:53:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjbTtvSG6s2kGmOZLp87+9efX14nC+YomvedbJCMf497wSXPmqudW7JgZVHHhHt0Spchpb0oQsX3j3/MhH49tiP+m2tDdqNYOkbuf6AVzg28bEkMwuNjG1zVSZKoYhS9xEIjkIOMdzriV7kYoOGa1V6CnOKs84r0gYChppXlrJT+mdzf1fisoPGQsqE5y9B8dv1f7I9yLT/ddAmd5dsIcQui1CmJo6asbzhJbbT8Rra3ec7N6jpJ6qPw8Jz+qsGwhRSNI21Y/ysW0PWjWNfTsdIuM5hMLOIlLBRYSNbGiwobZIkq+n2+jTNsGPaD6MdfO7oZbFU17Ui9md38Ngn0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cT6U5VATGL4e7tt42GIpXMS0bkTQZuxawKrkioSaNE=;
 b=hy3kYE/Cva6cJWWD8ed/SfcEpg76B3aYoJjZBhIbktlbcRdp532xqGD8UcXW6fFBsHu3GIVKNyzGU2ftMT4zGSrLbtdkPx+Wmn5E6UoiA8F7oxRteKNotLAmNwltUH+5K8+AxmtWMKTa1/8rmxWCSU9I1n5IHMipxnzGbMi6/FC5Vtu8loSzEnWr9yyKYlIzRz0ZconhDG36LF2h+F0QWm7wVYnQfg8hVrBDIyU0PDHCBVm7rGGd2Nj7C9i9cKsnpIfKbtNbhtv4UfTH7l3Yi6PfJMqFqub+bFqMMz+eaLBaan/g7AUlf8GywuFd8qFnpu2XhoQlC06ACZVMdlce9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 17:53:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 17:53:48 +0000
Message-ID: <0621effb-1e3e-447a-950a-a13292f15569@intel.com>
Date: Mon, 29 Sep 2025 19:53:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <varun.gupta@intel.com>
References: <20250929083613.644931-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929083613.644931-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c71084b-1f38-4e14-4213-08ddff812452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEh1NDBkK3pPdUd6VjJ6azZzWkZGejBNSDBGNThLbkgybmZ0eUlnT09UTDdF?=
 =?utf-8?B?TE9VYUMxcGt3YkNOMldNWGV1Y0x5TmdQUTdQK2tneGlVUHhXS1BhV1hWSmRk?=
 =?utf-8?B?dmdUemsrcHk0S3JRTGlqYit1STArR2pWeTZ2UkdieTRReUxKN1J2Z2RDNFRt?=
 =?utf-8?B?RTFNSFhIT0cybW5aWEhXNkprZWx5b3A4bXNBV2hBcXNQc09hdWFyOWM4RThy?=
 =?utf-8?B?ZUVZQm5WQjVJTGo0UXNMMUNncnArdmxxbkZ4dGE5SlFVcWxOby9KOWZGbG15?=
 =?utf-8?B?dzRvNVQrT29WMWxDbnF3dWdBTU5veFhWb0UrOUJoczROSDdveDE3Z3pDNlI1?=
 =?utf-8?B?RVZ4MHJyaGIyNW82OEdDTEJocENLMkROTkpyL2pnL3N6MDErczBPbmdkcDVN?=
 =?utf-8?B?eFF3cmlqd0piYWNhdnY2enhYUURQa21pWGdDOGQ1TGtPUjQ2aStIY3RBT3N0?=
 =?utf-8?B?NnRydG52UEF5ZVhxZFozaXBxT0VkWGlyRm13bkI5aTI2bGtyM2RKdXRXdzNN?=
 =?utf-8?B?bXc1RFYzLzcrZzJmNzVKRGpUS1J2Y21Ta0ttOS81YTkvTUNHUDZxY292Um9p?=
 =?utf-8?B?VWhyekd1VDltUUpkbDVyS1paU1pPR1hHam9PMnpsZFN5YlJYTWpJRUEzOHA1?=
 =?utf-8?B?bkFtempXODZrN0MxK1pYRzdVRHpQSlBZYytpSVR0TGtxdWJqV0dHV0U1ckps?=
 =?utf-8?B?dkpCRVVxT1NRZkhmemFsSmZZMkNCaXEwYTdGLzF0T2RDVElHbEZtVkZZTldV?=
 =?utf-8?B?blBXdWFDeWYyaSs4dGw1MEVKbDVCZjlNN3VpeWhrUXVjazVKVnZReXFwRGdH?=
 =?utf-8?B?cERJcUdnSHQ3Lzd4T21kMEd5d2hFdnpVNW1HQUM5OHV1SEFndEFaREVCZXNJ?=
 =?utf-8?B?Z3JiK2Zocm5pTTRQbWVQZlE2M0FaeFRUbFRLRmtGeFNKRVM3SzFLQU8wR1lQ?=
 =?utf-8?B?V3h2RFdrQzRBTkRrejFvQVJtMVBjc212dXBNZlhwaEVlSUJCbzFkbkhrWjRC?=
 =?utf-8?B?NFNPUzVYTTFGRmJkeE5OelloQnRnOVdUd093MkJLNkdudTg1NGhqWWh5YUFx?=
 =?utf-8?B?L0NuV3BSb1BvaExrSmFicW8rLzh1c1dsclpqVmhaQkRvbGNXcmFVTGtpTjcw?=
 =?utf-8?B?R1NFSStxMVp3cklZeFNLcnJQbitqWDNpM252SG1nZi9iUkNPRitGSlBmYWZV?=
 =?utf-8?B?djExRUVodjNYK3lScXhyb1EvaGYwaXNmQ0JPWjJDd1ZnUk9MWVN3ZXZqdjZ6?=
 =?utf-8?B?SGNXdUdHVDIyNndxdkU0bklKd1d0QjZPM3F6VTRwV1NQdE5OMWk2czdRbkVq?=
 =?utf-8?B?eHZONmFLd1QzQktWSVRwVFZqdHU5SzdFb256RVpkZmlhTWszUlZqdHUydVFv?=
 =?utf-8?B?cXdjZzdyY2h1cDgyUkVWeW0rdnVlWFo0dC9sSWRIQXJpU1ZkbEdGQ2Yrd0tt?=
 =?utf-8?B?bTQ2MHgvWXF2b083eGh0SnpXeDVvK1haQTl0dmpYUjRXOUpxcVVxYmU4b3Fv?=
 =?utf-8?B?dWNtalh1VC8zT3U5azA5cW1yR3U3c0liamtxb0tYcmdOdEFJbTlIOFdJc0hh?=
 =?utf-8?B?bnZhcWpSWDdOaGJXSVg5azkwd2hYMU1BYnJ4R2Z0RlJBVDB4RWpWV0lCb2ZG?=
 =?utf-8?B?N1lGNkZ5UVRvU2ptS2EzTlVNRFh0V1d0TGNOTCtIVXpZb1ZXc2Z2R3JlS1lG?=
 =?utf-8?B?am44bk5tUEt5WXRLRDQ2OWl5S3pzREJva2NybHNOMWtFeEE1RFBva1hLa09C?=
 =?utf-8?B?Rm4xUkNQTHk1cEV6T1QrZ0gvaCtvOUE5bGs4a1F6aktaZ2x6ZmlyZk5nZmVW?=
 =?utf-8?B?VUh3dml0dnhBTUIzSlpqNG91eTdRcVpaMW9ocytHK2R4NHBmSjdDUnFQbEpX?=
 =?utf-8?B?eXE3N2xrdlpmMnQ3bms2dUswdFBHRm45bC9ycGQ0QnlnTFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1YYis1cGQzMmpjRGJaRDlQSnM5MlRHSHRPYjJaakZsYjVRS1pFa0hpdmh5?=
 =?utf-8?B?a3BsZm0rWUdZVmlGVTJwYWFacEpOTHNYekFNNmRqZXp0bktWaG1yZHdWaTVP?=
 =?utf-8?B?WlBUVXVrSXprb2prQzZBQlU5bDE2OEkxdUtBQnJEQXdLb1FSNTFVaEwyaFho?=
 =?utf-8?B?c1ppZk9tZ0JPMitHN0w2NGg0bnVKS1FDemxYRTRRbTB6SUNqUDRxWnZCOGpY?=
 =?utf-8?B?RXl1S2I2aDJLSjVIc014ajJzcnVJUWFGa0wwT3hMdWI3NWVBVnpDQWNQWllN?=
 =?utf-8?B?d3NSalJZZWdxM3FXa21ObHZLYmlNRGx4aWNtNUhzaWRtOVpJRlZOQ3N6QWNB?=
 =?utf-8?B?amdPRzc5ZW9TMG9admJoMnNCMlRtcEtQNCs5T0FqVncwVFBVaHJ0T2ZCQ0NV?=
 =?utf-8?B?d21rcGx0WTRSQU5PZEtDQXZDZXpQYTBhVUdZdldaVU9OQ1FFbXlsckFGZk9Y?=
 =?utf-8?B?cE0rejQydDlNYU9sOVE1RkpObWFVdVdpK0dDM1lVTktSOVFXQk1OSmdQZEZF?=
 =?utf-8?B?SGhSTU9wSExwNDJiUGhDanpuYUJhdDlnQXVIcnRIM2ZOR0lneUFJNHlRMUJ4?=
 =?utf-8?B?NUREajVDVlpRNEtWSElwbG4vYm1odjUwRFp4S1RRWVN1U2Q5alFhaVhPZmdm?=
 =?utf-8?B?MitDVTJ1bFlvWmlSb2pUOGJJNTUyTzFSd01ORCtGUmVsM3MyOGRoMm1ZWTN4?=
 =?utf-8?B?cVRsaktHVS9Xam9TRFNlcW1Cdzd5Mnc0VHlSS3oxZ0xmUG9ZT0Z5NXVvNHBZ?=
 =?utf-8?B?VGQwVEIrWkV5U2hZN2lQNHZGWUhVZW1yakZIMlU2cVlPelRzTFVxMncxZk5t?=
 =?utf-8?B?aWVPMzdkcTkwdG1uL2YzTTRaT0MwcTVNY0Jra0VRakhwbXVScGx3bGxpanhN?=
 =?utf-8?B?QUkwZlk4aklGMGNYWUxpNkNIK0NkU0h1dTBoVXlKeTZCcnVHVzBwZk92Q2Y4?=
 =?utf-8?B?bmZGTGdCdDNnaC9wNnVpVk91RVZYZEd4eGI2bWE0aGtaRTRnNktIWlVwSHFv?=
 =?utf-8?B?L09rRDdRTnErSk12Y0c1TmNCUDdGQ3l5TVdzUEw0OEtialVuc0RISElLUDZk?=
 =?utf-8?B?TmI1TW9scHJyV1h3SzlmNmhBU2xXWGNBbzdwMHZ4NGhhOTJoVUg0RDRtdjg5?=
 =?utf-8?B?dzlSeHdKbEhWeHQ4dXNqdnVYOXF2eXY3RHlxdEZJRGlxMXdOOVBTM0NVdWdy?=
 =?utf-8?B?V2FvR0NlRHdrRno1WFJrQkg1QWdRZWxWZ29WWVFoV0w4N3h2NkJWZUI0SkNz?=
 =?utf-8?B?L2NVODIzckI5R3FmOGRta3V4Y2gwaFRwdXZjZ3Nsbk5yRGhLUFp1QkNEU0RX?=
 =?utf-8?B?MXIzLzVoN1NPLzhzRlJQS0s0a3ZVeDNvbjhPSzRMQzh2aWVxMk5pRHRqNW5h?=
 =?utf-8?B?NWw5SzZ4eGt6eVVtU05UK0pPY2lsbTVtNmlPQ0UwTWNOenlQblNaYzZFMnVO?=
 =?utf-8?B?Y2JIS3JTV2NRcFBpYnBzTjFMcklOS2JIaXZ2anZrMEExV2dOdVJQVVhxYkVa?=
 =?utf-8?B?QmtJcldxWUgrMkVmSms3UUlOK0g1REpRZHVMUTNvckFsMWdZRk5ZU0tmNW11?=
 =?utf-8?B?amxvRFVYRE9qQnphaURjcnBmQU9IaGFKdWJXU0xMRHlRL1FNeUptc2xDazZX?=
 =?utf-8?B?WElFMkxNenk3VHRpOFlXRitXZ2p2TnhnR3VSeG5iMEUrSUNlUmtHNitlWWMv?=
 =?utf-8?B?SVlaVi9sSk00OFNUeFMyTWt0RnNLRENoekZVR00rRzBOMFY2NE1KTzF5K1RR?=
 =?utf-8?B?cmVGT09zb1h6aWpycFZ1QzdlQStrOTNLY0ZPd0lUcFAvemFreFg2U05xaTRQ?=
 =?utf-8?B?TVo3N01HWitDcGs5YjhXeUEwMUd6YVNabzF6Q1pmcFA0eXVXVzQzVks2dG4r?=
 =?utf-8?B?QXFiMDhZcGJaK0xLWHpqY3VobTFMUE8vQkFuZXlJRlpJQ2JGRlJlUWptQWds?=
 =?utf-8?B?TThuS0RFMmFjSU0rQzVXKzZUMDdkVklyS0Frb2VEZ1l4NkJ1aDQ2NW9ZOFkr?=
 =?utf-8?B?Vys5Nkd2TGx0eU9LUGtBU25OUmYza3pGR0pHR01weFF3WStoSzFpU0JSdlhS?=
 =?utf-8?B?OVRRQTkyNXJ6ZDk0aTgzeVNXVklvREhqQkdTcmlKVFBXdW5mNEw0NHYzZUpL?=
 =?utf-8?B?WE5LYWhobzZlaGlHdWp0RUUwZFlqMVRjaXZLVE9WWXJhNExqMHFQL2hVWThS?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c71084b-1f38-4e14-4213-08ddff812452
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:53:48.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nArjXTFNBzpYQ2dT5DQ3RoulVwIJt4Mlp+uS32VHpj31dE/P6FGHlqwYP2kKa8Mxz2vTp+zVsMhBPJ/cpMxpFkG7umG6cQr2jXUY06cG9YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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



On 9/29/2025 10:36 AM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs, multi CCS mode can't
> be enabled when VFs are already enabled.
> Similarly, enabling VFs is disabled when multi ccs mode enabled.

s/ccs/CCS
> 
> v2:function xe_device_is_vf_enabled has been refactored to
> xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> The code now distinctly checks for SR-IOV VF mode and
> SR-IOV PF with VFs enabled.
> Log messages have been updated to explicitly state the current mode.
> The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled

you can keep version log under ---

> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  6 ++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 13 +++++++++++++
>  4 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..986f9cabb897 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
>  	return IS_DGFX(xe);
>  }
>  
> +static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe)
> +{
> +	/* Multi CCS mode supported exclusively on GT0 */
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);

beware of the discussion at https://patchwork.freedesktop.org/series/155114/#rev1

> +
> +	return gt->ccs_mode > 1;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..584f3245fc7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -117,9 +118,16 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +	/*
> +	 * Check if the device is:
> +	 * 1. Operating as an SR-IOV Virtual Function (VF), or
> +	 * 2. An SR-IOV Physical Function (PF) with one or more VFs enabled.
> +	 * Enabling multi CCS mode is not permitted in either scenario.

in case 1 it is rather "not possible", so I would split that case, as suggested in [1]

[1] https://patchwork.freedesktop.org/patch/674760/?series=154538&rev=1#comment_1240131

> +	 */
> +	if (IS_SRIOV_VF(xe) || xe_sriov_pf_has_vfs_enabled(xe)) {
> +		const char *mode_str = !strcmp(xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),

hmm, what's the goal of comparing mode string, where you already have access to the mode? 

but, what's the point of exposing "gt_ccs_mode_attrs" for VFs when they can't do anything with them?

maybe you can get rid of one condition above, by simply checking for IS_VF when adding sysfs attributes?

> +					"SR-IOV VF") ? "SR-IOV VF" : "SR-IOV PF with VFs Enabled";
> +		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n", mode_str);
>  		return -EOPNOTSUPP;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index af05db07162e..71c1d998ba82 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -155,6 +155,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	xe_assert(xe, num_vfs <= total_vfs);
>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>  
> +	if (xe_multi_ccs_mode_enabled(xe)) {
> +		xe_sriov_info(xe, "Disable multi-ccs mode before enabling VF's\n");

multi-CCS ?

> +
> +		return -ECANCELED;
> +	}
> +

I still don't see how do you want to protect against the case when CCS mode will be
changed right after above check but before PF actually enable VFs
>  	err = xe_sriov_pf_wait_ready(xe);
>  	if (err)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index dd1df950b021..e26837091375 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -43,4 +43,17 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  	return &xe->sriov.pf.master_lock;
>  }
>  
> +/**
> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs enabled
> + * @xe: ptr to xe_device
> + *
> + * Return: true if one or more VFs are enabled on the PF, false otherwise.
> + */
> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	return pci_num_vf(pdev) > 0;
> +}
> +
>  #endif

