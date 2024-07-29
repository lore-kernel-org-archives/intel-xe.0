Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EEC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52E010E3FD;
	Mon, 29 Jul 2024 14:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHjDG0QI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B3B10E3FD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722263940; x=1753799940;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=6keo6G7FgbMYY8wiuOv+LBmWItrPFdfgYSyJQj5RWto=;
 b=DHjDG0QIx0yjLos+DEhZSYbSd2RfwKaeINI0IbIrga19y2VIze80rA39
 yj5w76FKP9M3IHD7Uo8R2OPqlmiWSY15ikPpGC+m7W7tQ7X0t9vTB0Nzz
 ZeXrg8wGjZ54BKVp73NxGMNR/mXv72SCw6GfanDEGzUwl1T+qeVx/kXjx
 envFenmU/bt78TFmJO6+0mP0Gx+wbqYXvzJcQzsxDKWFtugUep2C/lwHh
 MnLM3gX+U8DIjHkX/FWDBTJ7sJvKk0gN8VPw1Rm1eRg79Pf0z/OK+L51l
 fUVmfWSa+ts9NiNvvacSewneGJHqPgaAnI8D2Z+P8wuowwMFJGL/ezmrg A==;
X-CSE-ConnectionGUID: 1yD3G7e/SFmSXhXTc/zekA==
X-CSE-MsgGUID: 4kaVnev4QQmE64PaDOL/ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20202456"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20202456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 07:39:00 -0700
X-CSE-ConnectionGUID: gT5WKt1yRC+H2KCGhJTjQA==
X-CSE-MsgGUID: 6vrP7gQrTd2gFeJF230abw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54243192"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 07:39:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 07:38:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 07:38:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 07:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueb9Mgcv8xrJrI2wQOzZSJJwODrv/k8WepfiyYEaDLX48ZS1yQ/vjL9JpjK55Can8I4/RFjoYsWjrI3ve0i9LzhjGtGQrxFMSaJftlEePzVjJotspOLvodMfrR/lThS4elt6R1Zxmq4KYkNmPF6SSzZpGoQEZQd3gnGZs8Om8khy7vW2KQxpUtjMY1ji956ajKTOvuxT8K4VeQ8rz46zP3YJCMjAThAruq9Wn2eLM2Ogh7hBzbbltxHXCeId/qu4J4NH5fX8yUBqe9/jy4r7PJaB83O6jS2rmh2whKfvp42Qne+jlmYqAl95q8RrJ8V609+DclNzULq3XnfnLVqnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yXVjd6Qu95NfVWSIv/IpH0kBhFx5KMf6zrCqzcl98Y=;
 b=azmDUFUTJmic5XQZXHufxo0bBBqmUQ3hW/0NcGsTbOeK7spc0N3o0zuW7fsEnB8Swh19qloRaX6g9ftGCIKaRh14fnPoPePUIsrB+w6ebxP67muD/0kWncjwLgmZIUR4vmVa4UN/oy2J6KgdA8zK1qXa8lcj4yEx69vgWY3mBdH4VO+q5axfw5xXPauOvEL/4uvkz4QhhfGAoMfPAsteyoZr1DlJ/cRMlIe283zYDCVHSPsFvO03+BAQVfTo3sTnatD1k6+lfTC1zVDvgp/5ZEOglFpCJEZPMfVUBCyZWr//pXW1thUgn5dVSEODhASNFVxI1tFmO8zCGrRmNowKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 14:38:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 14:38:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240727015907.899192-8-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
 <20240727015907.899192-8-lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 7/8] drm/xe/rtp: Expand max rules/actions per entry
 again
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 29 Jul 2024 11:38:51 -0300
Message-ID: <172226393148.1863.4987223828298751274@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a09168-fcce-4efc-b692-08dcafdc2cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXZMaDBxVklmelViby9OejRGNHk2eGtpdEs3TGZWbklEWkNQNU9mWi9iQjZX?=
 =?utf-8?B?THlPT3oybk56U0xlWWZZYkZ4cU8wT2xjQVNCb3o1R1hERnNXMVVWbHRucXRT?=
 =?utf-8?B?aWtrR04zbWgyTmgvb2Q4T2FSSW1kVnBlS1pJbUV4eXlmYmVkSXVxZEphbWdk?=
 =?utf-8?B?MGpzOERHemNRVi9ZU2hlYkVNay95c2k4eFhCc21vWkpieVNCM2s1MVVxdjBn?=
 =?utf-8?B?S1dYWUJHZEorNkxiWWVjNFhwVFk4S3VCaTVFYk5UUmE1ejZYYy9KUDllQVY4?=
 =?utf-8?B?eTIzNi9pNytNVDNwTmprZEs0eTJ2ekpBNzNYQ0EyNUM1aTVoOGQvVXJmd3gz?=
 =?utf-8?B?RzE0aGxjYTAwaFo4bWZZNTI0Y3lhdHJVOTFLOXpSSlh1NGJkeGRBOUJONUk2?=
 =?utf-8?B?UWhDYzdpWmlIWkFiQnZDTTZidTBocnRTeEJZUGVtU3NXQkthelk5WTJYVW1z?=
 =?utf-8?B?aDkvUXlhNEp0WVM0VFQvLzdTek9NbmNwYUJ2aFpDaURJcElGVXl2TUdaQ2hF?=
 =?utf-8?B?NWZDZElCM1p0dnpYVzhMUXZMTEJVSm12SDdSMlhFYXBKRFJYZmRuUEdwUWVs?=
 =?utf-8?B?MDFENWNPS05ZRVlLSGthUFdBZUlHeWszcUNuZ1YrcFFpUElCaFloWFNTUEQw?=
 =?utf-8?B?eUw1Q0FLMVFQSHNIT3NWMG9rRkN3djBwblpmZjdXRFlxeFpaYUFBd0xaeEFQ?=
 =?utf-8?B?emlMTW5qZks3WjR3WTZsRXJjM3hKQndyb2lJZHVZZHFQY0dDN3lkSEZER08v?=
 =?utf-8?B?MUpBalF1VXo0b3RmYTN4elVXdlk1Y1VTL05VOXZVZlZvd2RtaE9oMEZyRUdB?=
 =?utf-8?B?Rkp4clJHTHhzOWFVeCsxTFlvWUcyUWZIK1QyUzhaWWt0QVVRcGovOC9XMzNk?=
 =?utf-8?B?U1c4WUcyT2FFWmNBMlJPc090RGREcDJvUlU1TDJGZGtORTViMHVRT0N0aHFn?=
 =?utf-8?B?UlR3eFFzVHdhdlZJZy9zRG4xdG5NeFJNcTRjbFJNOEZSc3BpaVdEekN3cXR5?=
 =?utf-8?B?YjgvRnNZZUVRWGlQdEsxQmJTUUxWNHo5eHdtT3pYOHRGSFJsNFBoRXdCaVlq?=
 =?utf-8?B?VGlNQXRQa25hK0hoaWh4MG9XbjRpRzRScGNKRzhNaDVhdFhlenRJN2lJYnVp?=
 =?utf-8?B?UHY1emlsUTJHYUNTMldJMTBwZWdIekFybnd3bGdPeVdMZlprcjFtZjlRZ0ZE?=
 =?utf-8?B?VVd5Uk1vMm5VT1N2VEhoRHBkUTRuVzRwRmNnOXgzMWJqRGxYTVpEVDA1TzRI?=
 =?utf-8?B?dFJaQkZHeDJZVUpHSENUSUE4RGk1MmlsVFNSRXVvRGpkSkd0eXBFSXcrcUlv?=
 =?utf-8?B?Q2xESGpjVzl2NGNrVHRVVkxEL1lvV3d3c3FyYW02dURoem9rRFZHejRRcTRE?=
 =?utf-8?B?VERYb09rK1FxNzNLMFZjK2MreU1VOWdXZDAzVW5TeU96ZnFycWRYVjR1eXli?=
 =?utf-8?B?d2haalp5YXdPbUtadGdkdk1kRVJ6djgrY211NHY0dGgwOVY3MmpZVlFIK3Bj?=
 =?utf-8?B?R005RWxING52SFdWR04xTzY1K25DeVlmcXdJMlc2ZUN2ZDZDUUpha2xtR2VT?=
 =?utf-8?B?ZDY1OFNYUXd0Y3IyRGtlcWR2dXFJbmpzQnZ4V3dNendHRFIvclFXNzY4MDZP?=
 =?utf-8?B?bGc5M2pGdWNYLzloWEhLOGlrUUZMcEtNL29TSTY3TkUxbWJnbFQrbis0djh6?=
 =?utf-8?B?NnNCc1lGVWc4QTRvNTZSWHNaN0hLLzRKWVJLZ2RGS1lqSEp4OTlTUjl4YTB0?=
 =?utf-8?Q?nlmHqK8zBo/yJKWMJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJ5UTJtSVRqOVpDeU1mL2xjSWhtWWNLTU95ZGNRcEk4R0ltVllIbGtkMVBw?=
 =?utf-8?B?dGgraFJ1QmtXM2djU2VhbXo5b1NyZkRlblVCVktJYzMxYytFdFhwM2puZ2l3?=
 =?utf-8?B?ODFjNFlIcnZoeGgwa2kxdnFTZldhbFR5dnJQdUtGcWFHb0UwNjRjMjJYTEtB?=
 =?utf-8?B?cmdJSVJjRnE0WmpBaVlPNW9iQWw2ZUxLMGg0NTR5alpjTksvTGJPNFBTZHJ2?=
 =?utf-8?B?VGVEQ05jcEkxTXBnMDFKaEwvNWNlb0VnWEYxZWhCNFQ2Rkt6QisxUytBQWpq?=
 =?utf-8?B?K29nL2hVYmlzZldORjNWNDRydDdFdlI2cXRPL1o2SVZhWnpyaVpDK2NSU1oz?=
 =?utf-8?B?MGNQNFV4S1JkY01IdGVPZVpiSnlRRHhLaEZWc0x2YU5kZTd4UHdaRlh3bzNo?=
 =?utf-8?B?ZEw1OCtrY0xBS3hrcmVnbThIQ0xRUEtxeC9FOFd3ZkZUa3c5MFRjVmNITGps?=
 =?utf-8?B?TVNoYnZQWGt2aThZemNWOWlidDJoa0Z5djFkelk5eGlVRlRaOGhlSUV3SlFK?=
 =?utf-8?B?ZHNzRmpFeFRPdnBrT243dzJIdlpqSmVlSkpQWjFxVnF4dE4xTitEVlo2QXhr?=
 =?utf-8?B?VzVHVkpEM1hnYzBqZWFlSStaaWE3Y1VXVnZOVWV6QUszVkRUejBDR2JFbS9T?=
 =?utf-8?B?VUZHc2hVN2N6VGs4SVNDdXdFZmcwbWdwZjkyb3RBdG5PZG4rZERvSzZzTmxG?=
 =?utf-8?B?c21LcEJBc3RUbFNPVGlhYk9NYmlsWEpSYUdJSjVoaDV4bFhIaGNXVTJTNDFi?=
 =?utf-8?B?L0pQZU9NMzFyZ0hqVmEvRDc4Y2RYaEF0cU5pU0tlNmxCVkJYeGdiM1dJTUVp?=
 =?utf-8?B?VkJzYTZRTGx6Q0NuT29uTDJvR1M2OU1tc0d1Z0FwTCs5TnNJN09URW0yVXgz?=
 =?utf-8?B?Y2htNlVoTHZXSjYzSkxSSm5QZU52S0dGMFNFZ2ZiZlBkVURjZFU1UVZQSFVt?=
 =?utf-8?B?dmJJOUU4TDFqdWRRQTNpMnFKQVVURVNqb0NqUUFpcU1tSnl2ZWV4LzJGNGJS?=
 =?utf-8?B?eFJ5TnAyTFA0N0Q3c0J3MFJUM0QyMWQwMDQ3VzBxeGRSaDhJRE0xekNsdWpS?=
 =?utf-8?B?L2laR1BxU2ZzRlNBU2hvdGtZOG5kMHZpMUIzWWJmRFBqdGdqeEoyQ05lWHdY?=
 =?utf-8?B?RytTZU5YRHc3R09JUGtKc3crYmFtb0tTU29kT09BVzU0Um05QU1tWHQrK2sx?=
 =?utf-8?B?TGdVaVc0bHNYODdWUGNKU1NSZTNMRWdFejk1VVZ5WHdsbEZZTEc3Ynl3Nk5j?=
 =?utf-8?B?UjVkdWZTcTNMSTh5bEhDakR1MEhvMWFycCtlL3NIenRYNFBJdTlUUWs0aTJ6?=
 =?utf-8?B?SWpzZHdMVHlrZFRQbW9MZzhoeXFrL2pyUzRISStzS0dYeERDYlNvcEd2VUtv?=
 =?utf-8?B?MVQ3TWRIcVlZOWhLVzY0c1dMdStEQkVZUG40eDF3OGMzRVE1ZGlhUStteVBW?=
 =?utf-8?B?T1EwS0Q2eFBBek84NmkyVWlLM0tVSW0wd1hzVFV1Zys4UXFBczVHeHdUMUlR?=
 =?utf-8?B?Y0JQams4UExCczlzb21DbEl4QWVsWnlJd2w1V2pCSkVwVkdKMDNTVHhrUVRU?=
 =?utf-8?B?SmVMRHh4TVk4NUJCZEJENmV1S1dqR1NGWFVhelJiMUliWHlGeVdWM2ZqZmlN?=
 =?utf-8?B?RWZ2OXg5VDhJYWtjVHVtN2dYVnMyV0UrT25JWG4zTDdSRFh2MWF4K21Ydk4y?=
 =?utf-8?B?SmM2MkNzU0VLYnR6a20rSHJ2QUtBdzdLSVNzVEVmVnV6ejEzek1BdGZEZW8w?=
 =?utf-8?B?R2sxblVkQVg4WEJRdDl4TXp6WTNuSzZPSmgvUmZxN2o4Y1UxTFUwRzRCQklI?=
 =?utf-8?B?eHBmb2daT0FyNFFVZWRuYVN4ZnpRdEhzK0xhbTRKdjE3am9DaTg3M1E2WTdy?=
 =?utf-8?B?L2lIb0g5dzljT3JteTg5cDgxWVRpNHNnLzltMWFySHVwbUsySlYrZVRVK1VH?=
 =?utf-8?B?dUswVUw3dkZhSlp4RFAyYWdmY3pkUGhROVRBLzdqbUhBQU9aNTVITWRCeTYv?=
 =?utf-8?B?QzVxRUVkdTU0cURadHh3cUQ2ZnZWb1JVY1hqcnlZdms4bHdwc1E3c1JCSXFt?=
 =?utf-8?B?QnBnRU9idm9rVFBXYUxNbEcrQWFjRTNwM2F0dytUTXVISXQ0c1VVeWZXM3lL?=
 =?utf-8?B?YWxLM3dSNnhTM01jQXdWd2lSQ0FxdWhWZmtyMXJ3T3ZUWmVrTXgrbG9LM3J5?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a09168-fcce-4efc-b692-08dcafdc2cf4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:38:56.3526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r/ip6KIydCBkhQlzz4eH4SNW1rTD3islDHt3l0Rqju8WQdsPOXOAOspSHU/J0wePh4ZtTR29j0kvuBTQniFKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

Quoting Lucas De Marchi (2024-07-26 22:59:06-03:00)
>Like commit 512660cd1f1a ("drm/xe/rtp: Expand max rules/actions per
>entry") did, expand the maximum number of actions/rules. That commit was
>too conservative, just incrementing 2. Other than the ugliness of these
>macros and additional preprocessor steps when they are used, there are
>no downsides on increasing the maximum: the tables in which they are
>used use a sentinel to mark the last element.
>
>With rtp processing now supporting OR rules, it's possible to migrate
>the extension made for OOB WAs that "entries with name are OR'ed in
>previous entry". For that the maximum number of rules needs to be
>increased.
>
>Just double it. Hopefully 12 is sufficient for longer than 6 was.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Link: https://patchwork.freedesktop.org/patch/msgid/20240618050044.324454-=
3-lucas.demarchi@intel.com

Are the trailers above result of some sort of using the original commit
as base to generate this one? Should them be dismissed?

With respect to the changes themselves,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
> drivers/gpu/drm/xe/xe_rtp_helpers.h | 6 ++++++
> 2 files changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index ad446731192c..827d932b6908 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -374,7 +374,7 @@ struct xe_reg_sr;
>  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_s=
r entry
>  * @...: Rules
>  *
>- * At least one rule is needed and up to 6 are supported. Multiple rules =
are
>+ * At least one rule is needed and up to 12 are supported. Multiple rules=
 are
>  * AND'ed together, i.e. all the rules must evaluate to true for the entr=
y to
>  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example=
:
>  *
>@@ -399,7 +399,7 @@ struct xe_reg_sr;
>  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_ent=
ry_sr
>  * @...: Actions to be taken
>  *
>- * At least one action is needed and up to 6 are supported. See XE_RTP_AC=
TION_*
>+ * At least one action is needed and up to 12 are supported. See XE_RTP_A=
CTION_*
>  * for the possible actions. Example:
>  *
>  * .. code-block:: c
>diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_r=
tp_helpers.h
>index c59e40fd7fff..a33b0ae98bbc 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>@@ -60,6 +60,12 @@
> #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
> #define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
> #define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRS=
T_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_=
TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIR=
ST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE=
_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIR=
ST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _X=
E_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIR=
ST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _X=
E_TUPLE_TAIL args_)
>=20
> /*
>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a init=
ializer
>--=20
>2.43.0
>
