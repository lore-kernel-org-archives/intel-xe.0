Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1278C87FCE
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 00:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605BC10E462;
	Sat, 26 Jul 2025 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdYCEUe3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAA610E462
 for <Intel-Xe@lists.freedesktop.org>; Sat, 26 Jul 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753489188; x=1785025188;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y/AVEhMkgI19ZFUZxFyCI5zf8Mm7hdHibp4+XIELKOQ=;
 b=JdYCEUe3763k2NacgGA+b7wPvRkJXYYizIXSEHPtQduQ1Ws2GdkLATTs
 r58qqg0L4tnn7KapvFwWhvQnB1EGMitbNptemx5oyDTI0MBDQ3HqUdcEC
 SsRmu7dTfQNlZTyNyQM+Cd+wmauKqEOojsJJ7eSfXCenHzfVJUAwkGMDP
 1BVS1wmUAidt+ZfyFptiDpTsT7E1b8/l8m+py4TZ6q45rtR/RrLatNONn
 08BbwUGjU0HeYJYW+Plh0jPiJi2PZ5CNIOMSKfgPtilnkeU9QAmYYOlmE
 181LMYqlKDV/T3NBVpr1EAWt5oA3BIdOPKYt1M6jtw9+pS4ai3zmlm27I A==;
X-CSE-ConnectionGUID: 0dCsdRX5QGS9BS12oKU8JQ==
X-CSE-MsgGUID: 99247tVeSIKxsqPJLLO+9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55767638"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55767638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 17:19:48 -0700
X-CSE-ConnectionGUID: /cmDo1R7QDyqN1optkyKhA==
X-CSE-MsgGUID: RCdbu3biQ4m48Gpre25r3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165327335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 17:19:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 17:19:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 17:19:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.89) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 17:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOeWYtGiYUXgq01Ib2t6Tg1Zgki0goxh3lEbQajpCZQI5QxQDmLlN2WPsKS+Sdxtpav6d7LxoCVDFLMn2z+lY/FH0YElJbGd8DDFocQ8V2TmTte+JOWMgTF5DXz5thc1b3lqZRl22IvhXb0dYj4gGuNAEL59HCAq6K3HlVqGz1Ta/gO2ytiXcV5GKwFEg8S6zl7vrdD3HBD9CgYWcwMQ47o+zo9smI3cOlkA8gOWqZ0g8LjJHyDq2c/L9HlbD+EV29cNKzt+yS8RM64XlgMlzads3ctTixKpmIDLeMHkMYAHjpP32qfYNkOoitcgutN9xuuo+wuY/LcP3GiAuq16AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGxXAOr6alRkW+q8Xq1rP1I3BPysHDVghBpKLy1ZwWE=;
 b=C+2S4wV5U6VctgE5UpGQi4fAyB2oLmOefc3avk2N55dQJG6ti/mupaD8GMSEJMvA+wRaRx+qY/wWCu5Piz929NOh0Q2PPGSL/uIlkPyQprwQEYNCi/2f+30zR/KxeW6t5NlkJELtxNJ5m8rGLNGOagJv1+GkVIi+p9lYNWdfJZvRusiQnQFL9fW14c4mlIUk9Hz7f1WwHkbACx2mvOVPbo86vZbvFLeQ6PBgKnmmTilKnNNzmTb/GlyYAn3AN7gTqUQ9AUKeJ3lyt0swUK3IiRT8QGB5nCItlMW9rl3LFfAiwUTzETxBoJi0i3gxbJgu9ySgUxEFx+lS/v2DCuIkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Sat, 26 Jul
 2025 00:19:39 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.019; Sat, 26 Jul 2025
 00:19:39 +0000
Message-ID: <3c14e05a-d863-486f-9cea-30283faf8dcc@intel.com>
Date: Fri, 25 Jul 2025 17:19:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add more GuC load error status codes
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725191132.4008357-1-John.C.Harrison@Intel.com>
 <CH0PR11MB544413A7C4A3FD8724D2E748E559A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB544413A7C4A3FD8724D2E748E559A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f407ac2-bf05-4294-87c7-08ddcbda1c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1U1dHpUcSt2TjBLSStIT1dwYUVKNXRPcU1SbTNGbEZlVEZmN2c2dWkvcExG?=
 =?utf-8?B?S3lKZkE5a3I4aGs4elZVUnNLYXpoMkF0bmxRSHVnbnh5ZERSdnJrajR5SFk3?=
 =?utf-8?B?eVRIK2ZsWUUyNHFQdHMxeXZWSGUyblhPQ1N5bEtrckJKcU8wQ1IrNFR5QVdh?=
 =?utf-8?B?dkVDWG5Hd1cwSm5DUW1UWVRKdTZ2NHhmSFFuQjArMXFvQnpOb3NLT0J1Vy8v?=
 =?utf-8?B?Sm01NEFzZWlOVVhaSGlaQXNwc1ZVZHhacllMR0ZtVXppWUN1c3hxWFo3ZzBk?=
 =?utf-8?B?a2NDZlFRY1k3Y29oRDVZVzRZaDY2UDF3ZlllTk9ma1BmN3hoeXlsUW1nSlND?=
 =?utf-8?B?cjkyODNrdG5HQk41dXl1UDRRbFR6c0NOZG12T0xGaUtCYmdRNDFRVVE3QnlZ?=
 =?utf-8?B?cWpOcXd6YjNIWFlCRXB0Q2J3cjducHl1cTVodk80QVY2YVRZR08yR2pIV255?=
 =?utf-8?B?eVdKTHJDZGhzYkdPVDAwcUpSL2hEb2VJa0FVNnJKOGFFdTIrSEZ3dy9Ka0Ri?=
 =?utf-8?B?QkU1WW9QSFp5OHpKQW05YlV6QnhobE1OSTZ2OHQxYjJ1cHR1VVJndVdINmNG?=
 =?utf-8?B?bnJPeEJZdHRqSi90Z0w5ZGhmWm9XOThUUWpVRDZOK1dsY0tUVHlSTUszOHZj?=
 =?utf-8?B?RXExb1dRR3J4QnlEZDEyQndDRngySXdwM0srZ3NJUXRRY2NXVk16dUdOcUx1?=
 =?utf-8?B?cUpBUnFHWnNrem1hUlBpLytzcUVmRXpEeWk0QmdGVHhSMzMzd0Y3ZHh3NGVT?=
 =?utf-8?B?VHNnSHdmLzBDejBoRFloSnpJQXFuQW4rM2dVd1JIaTU4Ny8wM1dqVDhCZ2Ez?=
 =?utf-8?B?TmNUOTB2aEV1RTlrVlgvODdTdFJLTzNvQm5RNW1iUWpVRkdpNE1MVVU2RDRa?=
 =?utf-8?B?WVJXSjFjTENYdGdOV1dvdFRYOHA5U0xLNkNjZGhZd0VtQkhPZlFOYWY5WmVz?=
 =?utf-8?B?TVlnd0U3aUlFM0NoZ2RuM1VPZW9SUGtwb3NvVC9zeFordXQxVEZadW9ScFlS?=
 =?utf-8?B?MTBNOVRTMVRoMGUrVTVHT25XVTVscUV1MTRFYk1vcjk4MVE4ZlRFWWFCdkc1?=
 =?utf-8?B?eElYNEFCRDI2blp2ck9hRURWeUE2b05TZy85ZE83K0x3Zk5YOWV3OHdvOWIr?=
 =?utf-8?B?SzF5cHFRWStWSXRBYTk2TWVvdFdhd29scGhYVmJLVVdZakxKU0VTS3N3OXlM?=
 =?utf-8?B?NVdQbGxManZnUmNyRDZzakM2Z25Tenk3NnJkMnZmYVU5eU9uUVA2N09lSlNZ?=
 =?utf-8?B?bS9VaEd6QmlhRHNqYTkyU3RLODNjaWV1aEVVV0VtRVA5UXJLY25Dc0czOGVi?=
 =?utf-8?B?eTBuV2ROb0VjVjJkMndzVmhnczdKS2wxRU1aR0FqQ2phcWliZWhzYzNEdzdF?=
 =?utf-8?B?ZkNNdkRReWFTQTNWTjI3RWlFSDhsSDN6VjdIQUU3YjZxVFRzS280NDN0S3Fk?=
 =?utf-8?B?TUZ2UGM0OGViM0VETld5ZmVFVmo4Rm4rYm5lZytDYVVTMW1MalE0a3VaNGZy?=
 =?utf-8?B?V1VEOUFxNnJldVFkbExLd0lpMWJOVzNzTnJkc0FaVkVjOTlWQSswdFRFUEFM?=
 =?utf-8?B?WnlXOFgyS3JBQUpHWkdyOHZiT1FMVEhwUHd1bEMvR1oxT2xEY1dwTFJFWDFt?=
 =?utf-8?B?TVFiWlR5cElmVEtyK3ZWbld1YUJlTjA1YlJPMlBZcEkra1NRc3lnOXhQV2ow?=
 =?utf-8?B?QWYzYWoyOGJ2bEVZcFloWnU3UWZTWXBoazBXVk9pTjRIMWdhTkZBQjA3VDFM?=
 =?utf-8?B?a1ZaU0czZGM0T2UxTVlMalI0NXIzZUJ2VDFWY1ExTjByUmJjT3Q4UCtvbFdw?=
 =?utf-8?B?R09Kc1h5KzI0KzUwYndXMVo1SmR5a1JjM0s3bE01cGd6WDgwUHBSNEQ1QVRy?=
 =?utf-8?B?Y0FvZ21QZEdrbVYvdnZGTjBCUVoydW1jK1ZFdFZOSlR5eFBvNUp4YktPNC81?=
 =?utf-8?Q?LQ5ELa8z8T4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHNPOUZzTnJ4YmJyYnRMaCtQNmV6bDJuTW5kbEQ2WXVvVDJ6SEhiR1pSaWFv?=
 =?utf-8?B?MXNYaldnbUIzeVF0R0NHU1pPUW4xUEd1Nk9LaldDVms0bzVKL28xcXpxZHpB?=
 =?utf-8?B?eVZCVWdmMUJWc1lpa0JFUU51VU8zWHREL3UvTU5kaTYzVXo2c24yVllUODBY?=
 =?utf-8?B?ZzZNVm9qaFNNcFNwUENtYm1EanF3MzdWbmNXUVBQUTlaQnlvVjdwUXpzQU00?=
 =?utf-8?B?NlAxWVZRL3A0ZmY2NnV5Mjc5RGcrWk83VDdLektKQUdOdXV1M0lSWjdRbTNJ?=
 =?utf-8?B?ZUw4YXhnS1JpcjNlemRtdVA4MGx6TmxrWmhVMk13NlNNRVhlbDhsSDBOdDQx?=
 =?utf-8?B?YnZuVGtGQTJVRytKNTdwTUhNVWpCY1U5UU1FTnhrWGlpZDNJbzh4UmNWOWsv?=
 =?utf-8?B?ZFpaRWtpME5qZGl4Wkwvb2p1ZjVlQ1VFeldZQU9VMGhQMnYyUFpiZ1p6cjZ0?=
 =?utf-8?B?djJkNkgzanliMCtaclVVakN1Z3JQd2VRWWhkMDZ5bUdUUG05bGNTU1dEL0ZV?=
 =?utf-8?B?K21vNUI0dTExVmFsZGFTa05CSGJmQ0pKS3AvWlA2RFY0dXNqQmtIQUhHUURM?=
 =?utf-8?B?MFl0VzBmWnlndDllZU5tVkhUSDdVcnQxcG9JVDBpZi81L210Mk1BQ2g2bDJ1?=
 =?utf-8?B?WURla1pnZlZiRlY4UW1SZEdYSEhuTG5kd2QwT3YzaUgrT2RwMzBKcVBLSzFw?=
 =?utf-8?B?NUIwWlpqZFpGRjA5Uml0VXNDdnd6SU53OTlPNGh3bzF5eHhWbFRzK0o0aEQ2?=
 =?utf-8?B?TWJrbGNQMkpjWVV0RE1YemM5YmdPcXlCT05NRGJJTmZnWjFBM1FKc0lwbkVu?=
 =?utf-8?B?VDVZdC9TSjZ3MVV1M2U4VGR1VlloT01QNFplek9kWWxwK3FqMTBRblh3T2RG?=
 =?utf-8?B?MGZhUUhGTitxTUJUcnl1dUJqeWNIaXh4eWlzN3d3SE5nbDBpN2pyRjlJVlAv?=
 =?utf-8?B?UWZyMnlCZXVYQTR0cmJLVStvWFhkdXErenhmYWs5OHZUbG96UXdSWFFhT0Rr?=
 =?utf-8?B?QXJWdU45R3RXZ0d3VWY1KzZCVHoxRVF2cnNMSEJ3SGRXdis2dk50WUx2dEtS?=
 =?utf-8?B?eFhrb09zRXpxTlA2SGkvYWZ6UFR1SGFqYll0OHdta2ZyVGl4UzhvTm40NU9i?=
 =?utf-8?B?cEw1Z2p2SHJ5eTBscldwSFFnMEIwaWdIR04yTkd1TjduNnRaVnFVb3M3V3Uy?=
 =?utf-8?B?cDlHeDZMMjVMRld5V0xmUTVzWlZ0Rmw2ZklTekFQdXZ1Vm91eGh3SnhYeW9z?=
 =?utf-8?B?R3F2YTB3YXNNdWtzVjVteUswSmg3ZUFJdXZBRklMV3ZNMERSVGc4d3g1Uk1r?=
 =?utf-8?B?QktWY1NlSGJleDVNMmZDZGhBTVVCSEdZWTVhQnRZb3B2NG1Kb3BvQ2NFanh1?=
 =?utf-8?B?cHRwNGJ2cTkzN002ampJOFNKVzRJcXRYOXBIV1dEd0hhdlpUZWlEbnhDQlZk?=
 =?utf-8?B?NDIvUm1JdGxLbWFPOStUU0VEYlEremZCL3Y5VU5OQWF4cE4rUTkrcHFVeTF5?=
 =?utf-8?B?aEtwLzN6QmJXN3dpWERoMEhlVisrY0FTdFhsaHFyQS8xQng4dWpQNlA0aFRx?=
 =?utf-8?B?bDBnM2x3WlRvNmh5cUI2U0ZFZG0zM0JTTTc5THZTd1JHRE9BeFh5cHhZMjQ5?=
 =?utf-8?B?ckQxVHBwR25LMDFRb3I0cklPS1Z2RnNGQ25wR2ZMYnJQSTRRVHJOZmR1Vldv?=
 =?utf-8?B?VVZoYWlicW9MWU9kSWRwb0g0Q243WWFZZzllWjYvRGFmQWN0SkNDNXQ5TWZJ?=
 =?utf-8?B?bSszSHBjZWl4MDA5c3lFbFZtTXlmdGdIUkE2NGxZa3BWOXk2S3VKNitJb2tv?=
 =?utf-8?B?RzN6b05GUDN0SmY5M3k4cVhVTzZMY29oblV3bktZeXJ2S0Yvclh3bW56YUNS?=
 =?utf-8?B?Uy9sOXZlWmR5SXNMcjVXMmJMZzNzeXF0Ty9uVG1rYnhkRlV5U2JVWjdiS2pM?=
 =?utf-8?B?QWNXMUpwYVMyVThIb00zSmgyQVc0UU1ESmpnSjdTUVhDTk1RTUFIdGFoaGk4?=
 =?utf-8?B?bHFsbGNhV0tCZWl3aGpuNXVkNFowc3JjLytpSm1NZTlTdmRQeVRBcU9sNk5B?=
 =?utf-8?B?QlN3aGtDM0tlM2lTMUgwdW9jVVNaUjlTT1NEUXgrUkpFWkdEN1lVL0xOSVc3?=
 =?utf-8?B?YUd0SzlUMzdUN2x1UWhmcnMvcXYyTy9sdExoRUVvZlR2aUg0Y2ErSkw3MEFm?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f407ac2-bf05-4294-87c7-08ddcbda1c46
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2025 00:19:39.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TDzOVwiD50A46XA6h9EK+PzQjE1aWXrERZ6Lo9gVSboGsgIbLGO2Nw9ePd43WEvDtgQHq25ryQjsE/HT0Zv8HCWeNeANR6uRAN/dJN/GG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

On 7/25/2025 12:29 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C.Harrison@Intel.com
> Sent: Friday, July 25, 2025 12:12 PM
> To: Intel-Xe@Lists.FreeDesktop.Org
> Cc: Harrison, John C <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/guc: Add more GuC load error status codes
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The GuC load process will abort if certain status codes (which are
>> indicative of a fatal error) are reported. Otherwise, it keeps waiting
>> until the 'success' code is returned. New error codes have been added
>> in recent GuC releases, so add support for aborting on those as well.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |  3 +++
>>   drivers/gpu/drm/xe/xe_guc.c             | 11 +++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> index ecf748fd87df..ad76b4baf42e 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> @@ -63,6 +63,7 @@ enum xe_guc_load_status {
>>   	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>   	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>   	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>> +	XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH         = 0x08,
>>   	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>   	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>   	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>> @@ -75,6 +76,8 @@ enum xe_guc_load_status {
>>   	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
>>   	XE_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
>>   	XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
>> +	XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
>> +	XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG                 = 0x76,
>>   	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
>>   
>>   	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1ca7f4f27e26..315ef74bb5ff 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -992,11 +992,14 @@ static int guc_load_done(u32 status)
>>   	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>   	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>   	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>> +	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
>>   	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>   	case XE_GUC_LOAD_STATUS_EXCEPTION:
>>   	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>   	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>   	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>> +	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>> +	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>>   		return -1;
>>   	}
>>   
>> @@ -1146,6 +1149,14 @@ static void guc_wait_ucode(struct xe_guc *guc)
>>   			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
>>   			break;
>>   
>> +		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>> +			xe_gt_err(gt, "illegal workaround KLV data\n");
>> +			break;
>> +
>> +		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>> +			xe_gt_err(gt, "illegal feature flag specified\n");
>> +			break;
>> +
> Given that XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR and
> XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG are indexed after
> XE_GUC_LOAD_STATUS_HWCONFIG_START in the xe_guc_load_status enum list,
> they should also probably be placed after XE_GUC_LOAD_STATUS_HWCONFIG_START
> in this case switch branch, but I'm not going to block on it because the ordering
> probably isn't that important.
Actually in terms of enum value, HWCONFIG_START is before all the other 
existing cases as well. The ordering of cases within a switch is 
entirely down to coder preference - whatever makes the code more 
readable/efficient. E.g. grouping logical values, allowing values to 
fall into subsequent cases, etc. even though their absolute values might 
be wildly scattered. However, I just realised the basic 'invalid init 
data' code is missing an explanation too. So, I can move the hwconfig to 
the start in the respin easily enough.

John.

>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>
>>   		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>   			xe_gt_err(gt, "still extracting hwconfig table.\n");
>>   			break;
>> -- 
>> 2.49.0
>>
>>

