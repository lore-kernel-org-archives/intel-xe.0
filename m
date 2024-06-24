Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31872C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 15:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB95310E480;
	Mon, 24 Jun 2024 15:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7cw2+7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EED10E480
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719241371; x=1750777371;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=feZDeg9k8xdPyTxcXnXdpk2DWxJPa0avFrxkVh1NY6s=;
 b=W7cw2+7y4H8cSVyTmLUjRXmIaE654C5TO0VGdiHMEJflSDOmFjl3C/ef
 ey8HhP5u1lIXC4CIDfjDBeQKVK3XWbI4dJpe51FzNYQxR8u7gR18GUIV0
 uhd59Z84kdAIBTZ6aAQ9dcn4X44T6uwkT0+R+ymr+WHHIBuBlIY0Mgcxt
 L8pLpJ4LfkkUYv2tckqc/9A0wafBg33zwF0bQAc+/je3y+cb1SY9c4CUi
 2wa2JMzeyWAZ/C/Qb19fqDWoa1SgLx+TIeszNwWk/fXkRjuvCDMoGA9yj
 2Z6wpwrx21ikXO/V4Mmc0VjCeSaCykUwpnjLNaYaFVZXmVwci3i8Tg0YY g==;
X-CSE-ConnectionGUID: DdvKVPJUQ0CJCslLD3kU7Q==
X-CSE-MsgGUID: 7oq1w5j/QDa8HcSV506j0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16359404"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16359404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:01:48 -0700
X-CSE-ConnectionGUID: 7Vkt7WeTSNueYQmRnPkrkQ==
X-CSE-MsgGUID: GSjueKEWR/+h8U/10PT7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="48491818"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 08:01:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 08:01:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 08:01:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 08:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN0Wr64M/ePtjERJKZ3AfUrsAYV5tLtnd1JSHpEXa1mhPws+RYjZmggduWSpPrYwysOmi1BTz+1d8TBT/Q5TPYAaIPDcA//8Q678N2cr7PpKHwPAQHsU1INmMek9U3hPXfXx80ITRh88jpo09EJxnHk6lfuFhrbcizYhlatgqYSKyV2Yh7hGBZ7nmwQwLZ70MK+7Ktb8Dv+5eT6iaCmZ2/ebxx38z4+z4/KbppftkN4VbYu1rXyPxsFisyy9BkyftXRKTFWj2UEDrwWDtrGAFLOnlD/N346A8H2Vu+PQrwlOn+E37Y83kSnqgUtZ1q/3LosH3Qdkz8bZYpnYA5vT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YxHIUgOU3QY+ifPELBhG42DxOEOsLSWRx6cd6GlRM0=;
 b=YDTdUT6hj3wE0CAT17NMV0yo0rK3UvIAfvuG/tMUGMbWcn0hJd16gLatdDLTS5SCPrmsjeB7PYVV/Uu+N33Ufq7kghGX0efzl8KJE+t8dMPI1ckANwrkRS3N8XCAnUa5jBSHFXdbKrXtAQ/eha+ZqpCA7ea7LF6K00Lr97OX6QzAEj52lB3qD+hLI+LjEU4jJn+8NzJ0HyuL94xSa/hWPT2gUkRNgmYEv1jgsXp8mrPe3MFDF1+Rg4Xu5ysgTHdLnGIJcpmIEWJX0xBnd7gGs+GzzRZSwn28PNZ1+y9cm8/BJWudU0HAAgR7IiCta4hbkUHIb+daVXf1GRZAZJ1jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 15:01:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7677.030; Mon, 24 Jun 2024
 15:01:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240624114526.1125-1-michal.wajdeczko@intel.com>
References: <20240624114526.1125-1-michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Track writes to inaccessible registers from VF
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 24 Jun 2024 12:01:33 -0300
Message-ID: <171924129379.2361.8455638058654111043@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM3PR11MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 495a7499-aa79-4d43-5aec-08dc945e8d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG15MFhCTzc4UGxpelFUd1NPQlcrVjBuclA1ZnFFMVJSYjQyaHBxQmJSM2x2?=
 =?utf-8?B?V0gybXp5Tmo1djhoL2pIRUFJS3lVN2xBMm5QZElaRVNUZSs3RE8rc2RvakU2?=
 =?utf-8?B?WTZ1djgxYmxLZGE3MVJmdlBZdEc5S3oxMzlNWmd0cHQ3L3k0c3ZLZDBjT1d4?=
 =?utf-8?B?aVRpTUFrZ1BCKzVBRjExY2NmbXhTQ3RRQ0xyYURtVFpERXR4R1o1TnZ5ZjBF?=
 =?utf-8?B?WE9mWUtNTDZCUnExbnh0NU4ybGNnb1BwQ2plMFBpRFZTeThPQy8xUW5QSFZJ?=
 =?utf-8?B?WmdSYWh6dXNtNnZFSHdpVm44NkpycWZXM0d6OTV4ek5ERzJWZ2N1T0pTWTVh?=
 =?utf-8?B?Y0M0Qi9WKzI2VjluTzhTSHRvOVBYUzRJcm84K0tZeDFyc1Z6d1JOSzFFbjYz?=
 =?utf-8?B?cmFuOXI1aUcvUCt0bDFJT2wybWRiOU5obUtSaUZoSHVQYllWS2E0UVFCNTdW?=
 =?utf-8?B?bXl0dTl1MXVPV2IwQUgrWUlVc2V1ZGo4bjRoZUtxN0ZJNlpaUGJQWEZiQkg0?=
 =?utf-8?B?Y0JmeFJjMzFLOGdhVkowQzUxQUVndHZicU1qOXBQZkR4WWFtVmUyWExZTFVa?=
 =?utf-8?B?MEE5NC9lbURHUUJUcTYzaUN4a3RxaU5QN3cvSFIvNGRDQ2pNdEpwaE40ckE5?=
 =?utf-8?B?ZGpoU1ZLWWNldEtrcHZzV0ZDMzVDNkwwY0NVZ3ZhcFE2bURMVjBQeUVJOGwx?=
 =?utf-8?B?bFg5SGd4cUlIekZkRU15YXJ3Uk0vZkRSbmNVck5uZzlBY1oxSVlTODQ3anFh?=
 =?utf-8?B?Y096VE8wa1ozeWMwRXNLVW9neGIrdDZXaEJLSGcxQ2wzZ3crMTA4UWU2WUFu?=
 =?utf-8?B?RmF5T0FCbGpScDFtTlNxc2hScXhZekZMdVdSNkxzd3NqT2I4WHJoTXFscXRD?=
 =?utf-8?B?ajB4YXVmaU4yc2tEMVkvK3ZDSStjb0VWbTZFZjNqaU1JWjJqN0hHdldISTFC?=
 =?utf-8?B?TXhGNVBncE9jTzRadWJ6eksreFpWeXRKdzlucjVJc1pIZVFmQWk5UUZ5WjJu?=
 =?utf-8?B?MXU1aEpENlV4aUFqRUViS3R2bU9EUGpCTzhyN2NZOWJWMGFqajFmbmtEQWZa?=
 =?utf-8?B?Wlh6bVlrbHNVSTZoMS96Sk44bVFBdWZvOXhsV3hWMWFzVlY2eVlOVW5NK1FW?=
 =?utf-8?B?ZHZzdWhjOVJNRVlCRitCN3BQYUhhMTRxcXEzMWpXeXdKVVBuUHUvdmtXZW0z?=
 =?utf-8?B?Z1NWT2JaWSttdllDeGJaU2kydHAwamxPSEliR1VRMkk4dEJqNlJtWDk1Z3dl?=
 =?utf-8?B?MVFlcFJOOFdUNExVVGNFRmJXVnU2eG8rV1B2R1QwdkRaYU0yYVpIaDRMMDhu?=
 =?utf-8?B?My83UFc4R2N4RzUveUtaVzA5c0REcG01MnRiWjRpM1RvYXJ2aHRBM29PREhw?=
 =?utf-8?B?a1ZiWkY0dE96SDFIYml4WkFiWGN6OFFpS1lhWGcrOGwvUVFKYnhUQjcyZDFw?=
 =?utf-8?B?b3ZIanJOUTJJdTFWbWRtdDdYVHZodGZXbkpJMEdTdG5Jb3paRHVqZFFsVlJ6?=
 =?utf-8?B?NnNFdTR5dnVRTkJaZHBCRlhPWnIwM3ZvNHRTWlJSbXpMRFgrYnFmRHp0OFVJ?=
 =?utf-8?B?NWk3NzMvY0RnVEYvOGhRSFRjUG5RR29qK3pjc2J1VWVIQ1dFWUMwYmsrWUc0?=
 =?utf-8?B?akkvT0RTczdtMjNUSnhSWi9CRWZYYmdOYzEyVDA2VDdxT0tjTEpoaHREcjRS?=
 =?utf-8?B?ZTc4cTRuc2FTdlhyaUNSNVZ5SmovaVo0MU96WUM5aFJ5V09OdGNyUCtKUjVp?=
 =?utf-8?Q?dq+QNh+5qOkxz6+s68PXIBt7bi3WGho3Jg+aaNP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZuSGZMTjRaQnFrUWFmSjhjUnVMbjNiVnRGOUpTSTNGWjdOczM5R3p6RG1N?=
 =?utf-8?B?WW5OWU91VGxaTTZNalFYSmhpeFpuZTBVVkdBVW9FcEl1SldNRS9qbmloaVBi?=
 =?utf-8?B?RmtMNndUcEhGR0tsR1VudlQ1QkhWazV5VGdrK0NzUDMwY2ZBeGNxOWFpdXRM?=
 =?utf-8?B?cWVTTVJLREZyeDFRS3FCQm5vK1FjVXd5TmFFZk1XbVFlZkpRT0tENHhzT3Nt?=
 =?utf-8?B?TC91U1ZJdHZlQ2k1aWw3OWJxbkN0Rm5lUWthOS90WUE4a2FrQUdrbXU0US8z?=
 =?utf-8?B?TlJXMS9zci9VY3dmUE5IRmhNRkRTOXB2UWxTZkpZL0Y0T3oyNEEwbmxCQVNk?=
 =?utf-8?B?dnNxRUg4Q3MwWEg5WkNJc21haDZlZzVxdTI0UjBReGdGMzFxK0hiY3g1VUxm?=
 =?utf-8?B?SWw5WTVPWU9nTUk0R3JzTGFNVmNnZWJ1dlZVVUdwa3J4OGZ0NitEcEVCL1I2?=
 =?utf-8?B?UDVJNCsrcGpxSWJGdGYvNTRtNVkrVzBNb3p5a081N2FKQ2Q4KzM5dTBiK1pL?=
 =?utf-8?B?UmIvd1h2L1VEWDh5Z0VsMFBBS0RUMTluZHpyOHlHSU5Ydm4rQ1JSekk1ejNk?=
 =?utf-8?B?Wmx1QmpIMXRaWkhFWDNyOThJMVhQU3pxRzhJUDljT3NRVjY1ck4vcmFSVExW?=
 =?utf-8?B?cGhPWkpwNldSQWwrZXZVckFIUDJyNzhNbHhPWERYMUJDakwvdjlIOXdmRkpF?=
 =?utf-8?B?S2tZVS9HVDdvN204eXgxNE5iM2hOYlc4UE03R1N0WVV6TlhuQ2Zsa3VyMEw1?=
 =?utf-8?B?YW85SkxOMTFTQTdEWFVHcUhZODUxLyt5cW1IWjJtb0xOU0lCZG9CQ0NtNWRD?=
 =?utf-8?B?R2hzU1FFWlhWbzJRY25WYWNDbTgxc2JDVFF2NTlXVUkxR0RMTzJ5ejdBR0hj?=
 =?utf-8?B?UXJZVThxK2RnSUtYZVJWTFVteWxrMzVUSXMvbEZ5V3NRNkFaQ3NJYS9yMTFV?=
 =?utf-8?B?cGY4WU40eTdQMU1RMW9FTGptSkdPelJqN25tVEZTU0ZyQUdLbDFMOXMvQk15?=
 =?utf-8?B?VHJWOGpTbjZ4TWFnUStTOFdLWnJ6OUpGNjRmcW8zUG0vTWFwTGpXQVRlWW9H?=
 =?utf-8?B?NmF6RjhxYU5qdms1N3Q1NkpRWTdlWDJxbzFick1Vb09JNTNxNlZMRThaSjJU?=
 =?utf-8?B?VklUby9HOVplRHB5Z1A1SUttVzBjZlpXaHFFY2hQMWhNZkNxSGRWT2tYMFhF?=
 =?utf-8?B?VE03cTBYNzFJQWdPZVN5VzFpWUJYSGhoSGcvZytpeUtIZmZocm5hQ3p5RFdC?=
 =?utf-8?B?bmx0UW5UcUFxQzY5bUM4a0hPZk1ObjBRZTk4UWFqUW8vMElXL1ZIRk0xYnB2?=
 =?utf-8?B?NXkyS2F5LzQrYmRmcXMrUmRyem9GUGpYcndRdTZmWHk5SWZmM0FnYVZDYWo3?=
 =?utf-8?B?RW9GemVOeVRoVzczZWxES2pISnRpcmdQb2VnV1ZzYlNuaW9RSUdtTUxrQWtZ?=
 =?utf-8?B?bUlQREsyVUJUOTBiRGNCSUh2Vis3b21GdUZaKytoSlRDaWpGSUlIQWM5N3Z3?=
 =?utf-8?B?RnhMcTdpMVpoTTdGaHVpZGc3dGtYZUlaUTlNTmVmRndTSk1QRXNNLzRYNmVp?=
 =?utf-8?B?aUluTDJLbFdhWWZpQUZEM2EzVGhaWTdIc29RR2l3RTJTaytacy9nNFZLVkk3?=
 =?utf-8?B?Lzl5ZkxzK0piY2F6TjFQY21WbjdRbnQ1SmppOUwydXFsTGZJUWpPVTJFRG9t?=
 =?utf-8?B?QWxyKzBvQUQycFpXK0dEWlBkejRUQVlNQnRMNnJxNVJ5SEZSbzF1c1l1T01s?=
 =?utf-8?B?YkRSZCtSd0Vvd2ErQW5zVEMzTndzdkxuZU1QbUk5UHhjczB5V3h5WkFIc1ZU?=
 =?utf-8?B?ZmZRcmdoZkFyOGYzM2I3MGdpajlVcTRXTENVNTNod3oxNG01YzNIaVR4aHdl?=
 =?utf-8?B?TXF0czNwM0RzR2VpRzFtZytkMlRKMDBNNUV4cjNpa3o5ZllYOXlYYVNuRWNT?=
 =?utf-8?B?SkFSaDVyamJhOUhXdDVqNXVrbEM5WlF0dVBRTXVoUWhqZU1QU1hya0lONTla?=
 =?utf-8?B?cHBIOEo5Zmh6SzVQZnJHazduQXNyUmg0V2JYOXBLY2pETnFtSkQ0UnJ2djhG?=
 =?utf-8?B?c1R0bnR5YzhqY2UxdVNVTUZpTkdBRlZXcjNSMmhGL0dJWnBGcXU4THFZY200?=
 =?utf-8?B?OTZQTk5RdjRsblhTUnM2RG5sbC9GQlZaUk9VUzBTYnFDaUtTTm9TVXM4ZUE1?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 495a7499-aa79-4d43-5aec-08dc945e8d2b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 15:01:39.7471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1W3rugQf+XlqfA8/rLadYLumagQGBuOSmLiKll9un84ZMz5P6p1CNtN1UmodU5yJOLmAxuJ8jHqLcra6zm7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
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

Quoting Michal Wajdeczko (2024-06-24 08:45:26-03:00)
>Only limited set of registers is accessible for the VF driver.
>The hardware will silently drop writes to inaccessible registers,
>but to improve our driver lets track all such unexpected writes
>on debug builds.
>
>We will explicitly ignore writes to SOFTWARE_FLAGS_SPR33 since it

Drive-by comment: I might be missing something, but it looks like the
new code would actually try to do the write as PF instead of ignoring
it?

--
Gustavo Sousa

>is used by the driver just to mimic wmb and we do not have any
>similar unused scratch register accessible from the VF.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
> drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
> 3 files changed, 28 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_g=
t_sriov_vf.c
>index 41e46a00c01e..36cefe3161e1 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -892,6 +892,28 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe=
_reg reg)
>         return rr->value;
> }
>=20
>+/**
>+ * xe_gt_sriov_vf_write32 - Track writes to an inaccessible registers.
>+ * @gt: the &xe_gt
>+ * @reg: the register to write
>+ * @val: value to write
>+ *
>+ * This function is for VF use only.
>+ * This function is dedicated for registers that VFs can't write directly=
.
>+ * It will trigger a WARN if running on debug build.
>+ */
>+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>+{
>+        u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+
>+        xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>+        xe_gt_assert(gt, !reg.vf);
>+
>+        xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>+                   "VF is trying to write %#x to an inaccessible register=
 %#x+%#x\n",
>+                   val, reg.addr, addr - reg.addr);
>+}
>+
> /**
>  * xe_gt_sriov_vf_print_config - Print VF self config.
>  * @gt: the &xe_gt
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_g=
t_sriov_vf.h
>index 0de7f8cbcfa6..e541ce57bec2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>@@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)=
;
>=20
> void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)=
;
> void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p=
);
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index f92faad4b96d..ff72afd79272 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -151,7 +151,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg =
reg, u32 val)
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>=20
>         trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>-        writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + a=
ddr);
>+
>+        if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)) && reg.addr !=3D SOFTWAR=
E_FLAGS_SPR33.addr)
>+                xe_gt_sriov_vf_write32(gt, reg, val);
>+        else
>+                writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.r=
egs) + addr);
> }
>=20
> u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>--=20
>2.43.0
>
