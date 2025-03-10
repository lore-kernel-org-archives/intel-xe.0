Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EBC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 13:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ED710E462;
	Mon, 10 Mar 2025 13:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDsRycox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5C210E462
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741613381; x=1773149381;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=qKFGKREfBaTXLnE0J/ueCVR/oK740MrKGXol8uxulT8=;
 b=YDsRycoxJodvuYBrUdA1b91yvze3nrJS99jEyq//TZWZU/tT8r97gSS6
 qwF6U948VUyb3zbRHDkJgcz8YHyqQyS/EeTQ+P1G6kGYrj7WsmvakKowh
 rF3mgLh5Fvtzc7i+13TMAEusC+TJyzfuUhc8hiRildTRGg/T2qiZ5jH4j
 ZT8NwqwstWXnvuiYSkN+9t9IcDyWfreS2CSJviV6qm8sUbjC2ejZJdoFJ
 W8HgjHu2LL5WIY1WRHCONNc8MgOIoioNegGPATWWLbkwKoJuUfs5xE2er
 +6YbysTd7td2IRRO7yVdoFCfYiTkN2sXQQHn6o8r5mHFS2G/d9njOb5y6 Q==;
X-CSE-ConnectionGUID: qEUtTOG4Rla7kSW7KcRE4A==
X-CSE-MsgGUID: P4YzXAaTToWtvf5wLxY64g==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="67969792"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="67969792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:29:41 -0700
X-CSE-ConnectionGUID: 4FcmigcJT8KPPzeNjGXn6Q==
X-CSE-MsgGUID: /tzxbwYjQUKJTRRADPFdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125004518"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:29:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 06:29:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 06:29:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 06:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySSci975TAxoMsSe0cVLeYEpSxZRe7JWYUwtFsaQ05UPI5RYtaTCZmLeswTN1QjGNfic5toD5IVqPaeeXJK77zS4DK8fKOmWzZ25LdLVlz2RkkIle/s9XtccKMqt5HV9DEDo3doPQ9DaZ2w4M1mxPfPPobWpS0P9EP415ox8hrTPcvj1EnnLx4VQRHPcXcuHTwK/HLsv6F0YtgPSCd4GuiyYqXQk47D4zntYG0Y9zWgVgswMz5dobn/4uKQwowC7ZjryvbzHMHBCpelikswHQCrMIEZ352ifZ0RbPuLTy3gdUsDLa8KzPostK/c7N7Bk6IsNsdk9J5uzKCMC9aOqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prW2HJgjRVWoz82xVZdxrS8HdSfiVOb5all6X/s6Wak=;
 b=CUF5ND/CVI01SnOXWWKSjnSuRGSPqAexIzX8q3JnVShbvquEOZEFdJ/8FKp4w03lD5Y5avsGn5axSe0yrsCsTcGl5f8V6ah1KjuV/RC2wuK0O/FRRfk9QEzbSNix2CS0wCaGt3dbQ3N2BCRIozfEWKAmyLuxKCeaiG/j1mIKxrao4GsLjWvAVYt8MrCV+TOpqGYWSwQMg2SwrNjqEWGXXZ0R1Mr7+j9m/BWzYizMQ3DjfNNH22uHt/gVUXb61WbK1L0pBCwb3vHGPM3av7UBAxo4FgTTT+VrsAG9mDneztqASqn4+2ViwyHhw3vVJSw5PV24iMOq5dsVRB3Ve9vXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 13:29:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 13:29:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174123305154.65308.17453469322260227601@64e06c682a23>
References: <20250227-xe3lpd-power-domain-audio-playback-v1-1-5765f21da977@intel.com>
 <174123305154.65308.17453469322260227601@64e06c682a23>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/xe3lpd: Map
 POWER_DOMAIN_AUDIO_PLAYBACK to DC_off (rev2)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 10 Mar 2025 10:29:31 -0300
Message-ID: <174161337119.3769.9961901066283897185@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:303:86::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: c08888d1-272e-447b-578e-08dd5fd79974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzVnSURaR0g0SGQ5TmNTelByUTNHK01qRW9ZekNCRUF1K2hybDVISzErWHdP?=
 =?utf-8?B?RVN3UENSVkVYV2xsU3BjdDdHV3pqMUU0dmdsd01jNWNiSVQySFhWQ2YvSUpF?=
 =?utf-8?B?ajRHdG1DQ005TlA3TzZXajJDNW16bXlWUXlha1lFTDBDM1V5VnMvQ0s3ZDcy?=
 =?utf-8?B?azlhMG04K1Flcm9SU2YvYmRLMjNHUFA1ZFZ1SzE5V0NRN1A1d0lxaFZJOUxU?=
 =?utf-8?B?d3RrYzhseWVPMjhNTjVnMnpMcSs0SXlQMWR3QXVUTXcxOGIvUG83QVU0Tmtu?=
 =?utf-8?B?MVl5bDBDU2hXSkdiZXpSNWtyRTdVME91OGhSQWUyakI2THJIUms5VFhESmkw?=
 =?utf-8?B?SFQwajdWQjFaSUFJdEROcWJEdHRudG9FQ0RwL08vRlhLTCtad3JPMUJvaHp1?=
 =?utf-8?B?WnpvbUVXSVRhOG9qcG02NG5sVmUzVVEzem5BN0pDVkEyOFVRRzRCV21oZUh3?=
 =?utf-8?B?YTRYRXFGYU9tQ2x0SE5TdUhDUFFkcTU2dTdkNVEzajRlakIwY204d0cyLzMw?=
 =?utf-8?B?RWJrWDhwS05uWWo0QSt4cjVzUFBFMDQyYUYwRzZudDFyZ1Q1K20rWHBFdmdN?=
 =?utf-8?B?UGJneEU2VXRhNGtqV1JGOFZ3Z05hT0pETVJiZW9lRCtKOGJiUDdsbzZ5WjVj?=
 =?utf-8?B?b1Z2NG5qM1ZxMTBDYTA1ZkhzeGVaL0E0MnF1alFxTDRxVXQ5OGU0SGw5KzR1?=
 =?utf-8?B?OTZNTDdBZ2pGU2g3a3BhWXUyRCtlRDkzU2REVjBOWTN4TnA0NWJyRVNzWVo1?=
 =?utf-8?B?KzhweXI4WVZEbVNPZTlOdk5RTHlMczNHdmpnZFl4K2R4NU9OZFhSYVRpazFh?=
 =?utf-8?B?M2lFVENnaTg4Q0p3MEhRKy9aNXI5LzgvdVdVSXI4OFpqcnRLU2pPcGpMVUhN?=
 =?utf-8?B?WlBjOGlyYUZSZW5pNEYxZGdaQmdYZ3k5L1B5MGhFQmlQSmlrUTd0NlVSaytm?=
 =?utf-8?B?cFd2aHUrTndlR0paU0d5RTNIY2NhWDQ4NDB5dHd0WXUvQSs1VEVETUtjMWUz?=
 =?utf-8?B?YXMwUGdqc3haL0RqbzN5bEFKN2drd0hEcGgzOWxvOXozc21lZHlVMFc0WnBa?=
 =?utf-8?B?cTZlQUNNbzJ3aWd0SitlMTlJcnJBVWNiKzdnR0tReU8wV1pYUldaMnNEMzBT?=
 =?utf-8?B?WTVtQzhXUVp4cnpkUVpsdjNEbXpXdFl4TVFETHNaeGRmUDZsTE1QeWVIR0wv?=
 =?utf-8?B?R0JPZjVTQnRsbFlWYUt2VGJJODZRTGJkbW9hanZjZkFkcTNPQUlkUEh0V2o3?=
 =?utf-8?B?RUxla3lwT3BBQXRsSmJhM3BHSXlpeFJjS2ZJZDVpR3pLV3FHZS9pb1FQYXBp?=
 =?utf-8?B?NHdaMnRGS25zK240Vjl2d3g0VkpPZmI2WFNIYVFVdUtxWW03b0pMSG5WTWFX?=
 =?utf-8?B?eUZkang4V2w1QzNmSWd2bC9paE5LQ2Z5ZC9ySy9kYXNWMlh0MitJSGQ5Q3cr?=
 =?utf-8?B?TlNrMmtqL3cycG9VbHdGdzQ4M3E0bGppUkF2VzRIdUR0bzNsbUJSNDVYdjFQ?=
 =?utf-8?B?dm05MHo5RUkyVFp2Z05wSXpTRThoTnVrK0hhQ1RyeDBwWTNSMVl6a2x1ZlpS?=
 =?utf-8?B?a2x1Z0ZqdEFIang5UmhyRFgyZ2llM2I1M2dNNVJzUmNtR1dqU1p4WktMZHNh?=
 =?utf-8?B?MW1LTUZSVkZ2OFZtamtSUWoyTW04Vll4WGIrbHNoQjBuSGswM1ZOZXU5UTdq?=
 =?utf-8?B?UjV4UTViSmFGOVBHK3UvRUdZKzdOUDluOGpLR0YrUG1pU0Z1bm9hSTdQVUIv?=
 =?utf-8?B?alhTZmhnQnBGZVJrL3EzOWNQQnZUQzRsSGRVY1hIVVg4V2dOdGpha3NlZ0Nw?=
 =?utf-8?B?Y3ZFMzlLKzJpZm1TUTZwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldGbVdVSVo2bkZPWTQxYTN0NEF6U1VYQ1VIdFVjR3VFWkhkNkJ1TWhRc2I3?=
 =?utf-8?B?VVNhSFNhaExXQVB4U0E5eWpjaWlkYW5EN3ZhaGRYbWdLV2RNMks5a0g5ZnpQ?=
 =?utf-8?B?clF0a05DL2N6K2lFdWJORlJ6WGo1OGhmUDFVdHg2V3BWU1hSYmJKMStVWTAx?=
 =?utf-8?B?VjNreHlML3ZlTzRTdTQ4YjYyWlhjVS9GRlpIRytiSXZRT2czaE5oWUxvRDNN?=
 =?utf-8?B?ZGVGRkpQYytIcDBmckwwZEcyNjNTd0lNMS9CQXg5WXEzYytMUDF3M21YU0V2?=
 =?utf-8?B?ZnVxVFF1VWJ6dGZ6SVU2NUFGclNRbTRodDZVVjZVYUVPZFkzNHRYSEVMRGpF?=
 =?utf-8?B?K2dUQkx6dlY4bmVpMGRLMHBVTEpKcUw5YTJQMTJ4YjRMSlJUUmVoYkcyaHcw?=
 =?utf-8?B?WThSajQ4RVZJMjZCemdVSk80ampNcVR1VEJ2WUJuSmU1K2ZtOEZZTXROTTRs?=
 =?utf-8?B?cGl6ZDdnZTV6WDRiSmxHZ1VzTzRpaWE0VmR5SEdvMTZwZVpDSWxUa1c0WnBm?=
 =?utf-8?B?VE04WmVmRTRBQ2crUStaNkVweHVGbDhsdmxTMThvVFpCcmpOYzRrQXR0NXFD?=
 =?utf-8?B?aEtFcTJuanNkaFV2L2lTRlNrdnhwK0cyZkxaZEJIRTd0YlFySkpZMmlVam9s?=
 =?utf-8?B?L1ZSOG4wb21UTEx6QitqM2NrVHpqQjdxWEVyUFB1dnoxTzlraEE4b3hsS1hY?=
 =?utf-8?B?R1dPYUQ2WEpWZzQzbk1zczRBNldtUzVPU25YaTJtZUEvb1BJeGxnYnZxZ2ZG?=
 =?utf-8?B?Wkh1MlAwMG5LSVZseC84RzNTakJzWHpVQVk4czRNd2FvYXJ1Y1FRRzJKbzhW?=
 =?utf-8?B?MDI0b05NNGs3ZU9paysvOEtUd3pRZTk5RUttVG9ORmZ1T05PRHhpSUVINmZG?=
 =?utf-8?B?Rm4zMW5YUE9GSGozSWhsTzkweGVCNHB1azMrQUpSdm5BNGxpTkg5bmgxY1ZT?=
 =?utf-8?B?cGR3Qm5IcGtTQytJSFdyL3lGSUV1YWtIZGdGRitnN09iWGJmUGpaTHdibTV4?=
 =?utf-8?B?MThuandQK0h1Z1VLNUFqNUgvTjRLak55TzF3Y1Evb3FQOURaR1QvNEYvUkJq?=
 =?utf-8?B?WGtpSFI2ekM3RFVRMmVEbW5ncURpTS9yQ0RWUmJ6VzRRWk9iN0wvS1piZHZU?=
 =?utf-8?B?K3BsbnIzeGNQeWwwUFJTeVFWcEtMcjdTbkhXeW5qMWVEeDErb0RIcm5SMXFh?=
 =?utf-8?B?dWhqMHJjeVk5Ymk4VENBd1lhZjB4RDF5dEpoM0VVaDJWS0VHcHRTV2FFeTlo?=
 =?utf-8?B?OHhNdDNNaWl2MmtiWGJJUEhuTEc2YmtlclZtRkZMWlhSeTVNNE1oMUc4UFRR?=
 =?utf-8?B?MVlxOVRmaThmMk05YldkRDRzY3ErK1BOT3lHYmNQelh1eUJMenJtcDM5bUJp?=
 =?utf-8?B?TWEvVGZoTllMbHZWZzIrNzlibUw2OHJiZ3FlMjg0dG5SUmsra2l0UUtudHg2?=
 =?utf-8?B?RldNZzQvUUZ6dGlLNlpDd0VwekNOUmpCOU1FdHFBMTlNSEMrWkNPc2cyeDRv?=
 =?utf-8?B?T1RmdUt1MytUd1dKaFo4d0hEeUtLVTlZUERWZmdZbHF6UFVORVJkd3ZFTDIr?=
 =?utf-8?B?S1BmYzBBcDdrck40VS9tNGFRVUxLZTVnSDBqU0x6a3RtVm00d2dZOC82RzVw?=
 =?utf-8?B?T0JucGVidDZhUWdvc3M1Rjd5S3FTUysrQUNUUU5BQzVqT0w2cUV1NC9zeU1G?=
 =?utf-8?B?L2NYdnE5cDFGZi9wNmVsbnhRYTNiVVZQbTBLMzJ3SVppdXZNU1V6Z1dSeWV2?=
 =?utf-8?B?bHcyNDRYdmpSWUI3RFp0V3hHRHhrRkpNTjc5MGViMWhROWxsaDJyWitVRjJt?=
 =?utf-8?B?dWtFYi80SEE3UFcvcld5RnhvYS8wMTZVVGlJd3ZGazB1cDhHL1J1bHBvR3RL?=
 =?utf-8?B?dmpPUFRLYVExb3FUMW5tWlpHQ0hTS2xGejNPZmpxR20yZktGN1kzM05EQkEr?=
 =?utf-8?B?T0piOHl6TzExelQrNUxPeUFlUGFpZ3BWZmIwSWpvUWsvNWl6L1l6TEJUbmVI?=
 =?utf-8?B?RlFuSWxOdC8vZ0d6TzRXbi9tdmwvVlhEUkt4ano4NTQwelUwanRHdlFvMlFs?=
 =?utf-8?B?OWZINFp5UEtQSHFDbzFmSXZFK244VllKWlRaS0tMU25rY0pMcEtvWlk5dmdz?=
 =?utf-8?B?Z2RueFZwY0FvM0FNR2Y5UTZXSUlXbGlZVVBFTlAvT1FkNlU4akttM3duY0NX?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c08888d1-272e-447b-578e-08dd5fd79974
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 13:29:35.6352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgnuxhEm+aGobhKMgXC4qG75HEAoDFIkEyffIf9wu0NLW+HzvOVzhuhDTxEIly54kpPtZ80p4CfOy+GE9IZenw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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

Quoting Patchwork (2025-03-06 00:50:51-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off (rev2)
>URL   : https://patchwork.freedesktop.org/series/145594/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2762-f813902c30436f86fac23d2369ec0f3cfe7ff761=
_full -> xe-pw-145594v2_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-145594v2_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-145594v2_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1455=
94v2_full:
>
>### IGT changes ###
>
>#### Possible regressions ####

None of the issues below are related to the patch, since the power well
mapping being modified applies only to Xe3LPD.

>
>  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2762-f813902c30436f86=
fac23d2369ec0f3cfe7ff761/shard-adlp-8/igt@kms_pipe_crc_basic@read-crc-frame=
-sequence.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145594v2/shard-adl=
p-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

This maps to https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173.

>
>  * igt@xe_eu_stall@blocking-read:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][3]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145594v2/shard-dg2=
-464/igt@xe_eu_stall@blocking-read.html

This is an expected SKIP, as DG2 does not match the platform checks for
this subtest.

--
Gustavo Sousa
