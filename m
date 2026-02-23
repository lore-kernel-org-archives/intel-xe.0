Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D72EEC2A5
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4B810E45C;
	Mon, 23 Feb 2026 22:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnfYa7H1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89310E45C
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886530; x=1803422530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=07EdYn1+g3l2yoHnu7AryUz4RD1Gm8Xu86eH59AcZTw=;
 b=EnfYa7H1CUjxxL4kTkK6HND6aV7o9o9FoLRoyFnsxRijtUNjflciESQQ
 6cwovlYnnTlZJBLXnhV/4ugRHh/PkcIGStW47S8CBxHOEFAbtm4rmgtEd
 5Z3UkDuwFjVhkXt0GJA/9DsDrp7qithQAw+7qPsj7GVxxdkZgh1J16gIA
 Fq7TVNkUznNFPMdcSRoGf+htNosFDkgZaHAa/gvlajSEosiZ2BFvla6qM
 I6tAvf+kAyf985p/zWsCR+qPhtQ7mJ1H50xg2OJz9O15UEw4JUEdWxSOF
 ROzgk0gZuBFj56ErYif4MWQuQfO/QpGag6W2origYBqPl2cMa8Sn0IxnH A==;
X-CSE-ConnectionGUID: 6+sBBR82QrW7/r9bJMPrtA==
X-CSE-MsgGUID: 8F8QJPi1Qse5gyZrD1RThA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90301569"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90301569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:42:10 -0800
X-CSE-ConnectionGUID: rKZS9MKLSo6X9lFykv3lbw==
X-CSE-MsgGUID: Uia+ZHTWRuamOzx3JZaP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219227138"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:42:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:42:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:42:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:42:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPaNq6YGuW9Cjvr0rqDDRndcgsetxukqSuMb5Do1xrH7a4e8XYwjQ6t+P7GN97mPNo5kK+ZlfbRWCy5/oj8Qb47kiVuAqlqsOzKwaL/EqD1o9rWoVp8CMEwjXxsETq1AVWP2Ny8CUoZVoTeb5ncbpkiDrsIvA/VsC2ZoxuN02UesnXk2qJ2VhRWlhJO1MfBWEQy8Ti2RaAJH4vMTW4PTPcEG2AqFjZ1PwLfwWoSFsqsbCT/F0RTwCUSptjGYivOUD5djZtUXM2fqHrpxSszI3sEIIYD1Klq/z3y6OsZlo1qqKb1ZDDMoj8jKr5CpjWQgNjYDvLxQ8jpOOp5ywrs5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07EdYn1+g3l2yoHnu7AryUz4RD1Gm8Xu86eH59AcZTw=;
 b=gxp7TN/8oTzOGY1k+c7bPbWVN+ohONl/fC2QO1MhGcfTugIXuG52BMR2jdcMnTwz0IxB2mWD1LbQpm9+jyLMm5InC9MwmOTiNm86iJPeP9BlDRC0qHf4pX1qpN1FizS3rUhJ7ueWC78BIh3uaqaa47NWTLZrQiHG9v84dGliZ1p2fiF6ARmiy3/HBb26YZB4pdJwXdhfyzmDSf+nWHt3WX2DSlMy+vmASt+b3aw5PqsZkZMAtOJLdpP67X5dfs0/V+ddmRutrNYfp/KGhDyvTq7B7hwT6/VSfUnWxoBiI4Q0cTGJ//BBZG6h1cVwX9QizzAkr5Fi9pE6gbJpTM4t+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:42:08 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:42:08 +0000
Message-ID: <9a612289-7c41-4d19-8095-59348ed107c5@intel.com>
Date: Mon, 23 Feb 2026 14:42:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pxp: Remove incorrect handling of impossible
 state during suspend
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-7-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260219002627.1208210-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:303:84::17) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: aeffaf5b-2518-4be1-2044-08de732cc6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVVBMHo5WXNwU2VJWFhqNC9jdEdUSUhvRjAwZ1VqOUdTb3JQSi90RnpIZkpK?=
 =?utf-8?B?R2s1R3NxdUlPN1dFMEpYRlNXQWZ3ZUZvank4V2ozUm1zVVRVQWUrR1FYS1ZO?=
 =?utf-8?B?VFRUMWRjM2NhNGJwR0l2aVk0L04yaWs0dU9adnJsbFhQN3VEZGRibjNaVDRP?=
 =?utf-8?B?UWlLZUxiNkRSb1BqQytBNFErdklIeU83NEVzdGszckplVFJwZHdGcXpMbHNx?=
 =?utf-8?B?Z1NENzhJVFlvQWZSSVJXOXFTcjBMOVhWOVk3V0w3SFhDbldyczVUOHFSU3VN?=
 =?utf-8?B?WDg4cTVUNCt2NFQ1MVdQK3lWQzBxdnZkSThibWQ3S0FsVEh2VDZQNDd3aHcw?=
 =?utf-8?B?c2c0N0NRRnpKUERvRk93ZDJiZGtoemxTdWw5dU5YU0tmaDZ5Zm82cVNPTmIw?=
 =?utf-8?B?WFVKMzdzY2MxM3hzcW9CKzNoWDBUSzZ6RFV1TGZlbFM3THdYZGxnck4za3pO?=
 =?utf-8?B?eHUrdWZVaHFOZEdNZ0NtdnI4RFpMbHJzd3pXT05ZUTJUd3BhWW1TY2czdy9Q?=
 =?utf-8?B?Z0ZVNnphZnRVb3ZNTEp0bFRaWFc2aWJqZW84azZWdkxBM2lnZUE4UFI4L0Ri?=
 =?utf-8?B?aklBRytoWkMyM3VOYjBxS0NWcEZ0eDdqUkkzUVBQM2FmSGsySktyU0J4L1pa?=
 =?utf-8?B?ZGdvSjQ4ZW1kdWxwOFNNMnhjcjNXVDZ4bWhMblRSdCs5cStham1YQ0I1c0tS?=
 =?utf-8?B?QzRvN0lPZHkxZ2QvWCtVZXlvbWVERDFzRW1pWXRjbjAxTk55YXVCTGVvVCt4?=
 =?utf-8?B?eVVHRGlBSXpaQnNCNmh0bDFKa1hIU3dvclpMZmhjdTBpQnBhbVFPUUU4VWlZ?=
 =?utf-8?B?b1VzUnVlZGR6K3Vqa0p4cmNXY2JkQ0dGeXlUUTBpS1kwSThINnNhYVROSmdB?=
 =?utf-8?B?eUtnVWJ5YzlwMmt1eXVROGJtaWgwLzVyOEZnSDVFSkpodVV6NjBtNDUyNS9D?=
 =?utf-8?B?K3ZxQmkwN3pwZUl3cFVIUlZUcHBVUXV3cjdsd1cwWWFwcWhpRjkyQVJPcmtK?=
 =?utf-8?B?Y2hxOHhWS096NjJPeVEyUEJWQ3Zvc1RRRkszTFUrc1c5Z1JJT2dPb2trT04w?=
 =?utf-8?B?VnFvMHRYRi9KN2IzSDg0ZG1ickFpODNNWHEwd0xYYzR2ak9FTmlubVdhbUlM?=
 =?utf-8?B?MDhnL1lJODJhVHp4amd5UGVpdlhPcmxrSTd6MUtQL2duL1RQeCtLcDRhcWFU?=
 =?utf-8?B?bTZRZk5NMGpWdkMvYk1uQnB1MkFQV1pFYzQxRXFBOEZvNkcyTUt4TmNmYVBW?=
 =?utf-8?B?T3dyOFNsOXZHK2dpMHZXZlpFU3B4NFJTeVZEVTQ3Y05SZ1lCcHNBNDdMckNp?=
 =?utf-8?B?MXFRRVBIcVF3RHRoTUpWSEFzS2EyZTdDYkQ3MGRNVW9kV01NVzBXRm1lUGVK?=
 =?utf-8?B?bi93UE9nN1UvMFNwbjNEVWZwbHZ4MXhXbkRqbng3ZG85OU1qN2VnOVNReW9N?=
 =?utf-8?B?TUxTWW5YcnJpYzNhU245TnVKY3ZITWhtUTdRbGFxMm92K3V3VXVxV3BlZ2Jn?=
 =?utf-8?B?NzdwUytMZjljdmhBbFYxWnFwdzV1UWZTRVBkQWhscFFxZ093cVoza2ltcElF?=
 =?utf-8?B?em9pZUFmVTVOZ2JQWkFJbXIzZXJZTHU3ZHluUDFsN0ZtVzdQVnhVdXVFbTNH?=
 =?utf-8?B?bjVZUkgvWEdHbW5OazB4d1Vzell6WXFycXhNNHNTYlh3bjIvanVIVzZTZWtH?=
 =?utf-8?B?REVhOGJVNU4zWXdkaTNvbDNPZlFsRytYTGh3S3liZTdUWmc5SXpMYm9Hakoz?=
 =?utf-8?B?eWJvdVN6K2ZZTTlXZTZsYll3Qkw5V3ZuR05tYzJ6QnNZTkRTVmtGMUJEeFZI?=
 =?utf-8?B?WkJmT1BmTTRsemFIWUhsMEUvTTUrdEd4eU5iZVgrZ1RpckRScU5nZnJnN2FW?=
 =?utf-8?B?L1JWRUpIQ205c0FHQmozUzFXU2VvTWl5REhsaWNDTGM5aUpsMkRFWDVWMHh1?=
 =?utf-8?B?c0hvZXdBK2xKdXBkaXVkV3k1WGdISVJ2ZytXM0NoVW8rRk5IZGI5M2JKd0lO?=
 =?utf-8?B?KzhFTzBIZUIwSFNuN0V5MlRhb2tIQWNsZVBXK1VQNUJ1ZlYzTXFob3VqK1JP?=
 =?utf-8?B?NVkvWHVEU3V3NUJsMTVBZ2FPVDRHZTlmcXpoZE96VVRrRW92NUZ3RGFBSFdU?=
 =?utf-8?Q?CTCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBma1F5Um9TeVdvdTNQM3hZWkg2QkY1WjMvYzJOUlgrdFRmTFpWVU02eWFJ?=
 =?utf-8?B?NjRETmprMG9VSjVOeFBSQkY5U1NGYWhLaWFuM1NZZ2JTSy9KZDRzTmNOSFJk?=
 =?utf-8?B?N3J4UU5zbldDdWpPdy9Md29jR3Q3d1JMTlBBTDdHeFhYMUF6ME8yQ3BzSWd4?=
 =?utf-8?B?REtuR21URFgvZWZZYmpaQU5TUVpiZnM4bk1hMmpueFI4SWk1cm1PQk45dGJF?=
 =?utf-8?B?TzNYMTAwMDRWb25mRlBWaXd1SjdsNE04ZDdwOHo4U092RFVHMEtJZWt5RkFE?=
 =?utf-8?B?SUxrdmszQy9naGFod3F1YVhyMklJSCs0aHQzRlRsTjVMdjJody9TakJteHN2?=
 =?utf-8?B?cHQralg1bE9taU5vdTk2UmZLYVAyeVBwOXlOYUJNdEV6aW9UYUZZUVhyUEtu?=
 =?utf-8?B?T0I5S09HbFprRGc2OW1KZXEwTlNiZWgyV3JSdmVpOThFR1Y3WUNYVFN5UnYy?=
 =?utf-8?B?Z0hEZmNyZnkwai9pZGNra2MzSEZBYjZDb0pkYzRjT2NLSXdOV2w3b3JtTUFS?=
 =?utf-8?B?NkxyRi9yZGJ1ZkNlQml6S2EyYitya1IvVml3N0I0aVBBeTJBTFBCOC80K2N5?=
 =?utf-8?B?QUdYZG1wN1c0bHRIV1FJRGV3Z0JEc2dOa0VCWU5qV3lyUEw3ZUErVGwzd0VC?=
 =?utf-8?B?bVNkYlV1cGhVK2hCSGdoVS8xTjRBdDkyYWZ6NmJHckJXMFprRTVsOUdWbFdt?=
 =?utf-8?B?Ujd0ODBWMldobExpZVl0cm14ZnNpVTROVU55YWxjdUtuanAzczVvbXl2NWpj?=
 =?utf-8?B?TVVieTVubDFBRmNDemtPTVl2MjJxTk9NOHE3d1crMnJYbXlERG5lditpNklN?=
 =?utf-8?B?K1VrZkc4SEtQU29BY1ovU0dqazlYcGk2Vjh2NU1OYnM1eWVBMDRyR0JNWDVw?=
 =?utf-8?B?akpBd1h1Y2dudkwyTjJHWEZ4TEk0WXlWNnNrRUU1dHZEOE92elVYcW5KSjZJ?=
 =?utf-8?B?UjM5VnFncEpCT2tEMS9qV2J5aSsrYlh0RjlKeTZYRy9lQUs3L0RjUFUrWVNK?=
 =?utf-8?B?alJVbU9iUEt0V3hRR0lmcUxQNm5hQXVyUWFvNGd2VzMvR3ArUlNnNkRKdnl6?=
 =?utf-8?B?eFFLTnZraHNVNytqdlAwOXdSeHVrdXQvb1M4K1ZJOHlaa2lNK1pzV3l4ZUti?=
 =?utf-8?B?WEVRdnMxclFVRUNmbFFiWVhRazBPTkliaG1mcXRzWG95dlFGRzBXWFhqcWxw?=
 =?utf-8?B?Rk9jZTAzdnJJWmVBdG8rVWRjZytDTDRlQjlUWk15S0E4VHErUmZQSkJwWUk4?=
 =?utf-8?B?YmFHb1lSSDZFdWpZS1FHWjVNMjlqRHZYem5RVUZmUCtQeVlCbWgvMFdWZ2Rq?=
 =?utf-8?B?anJGV1BlTkp3cWg2ZExZZFJJQkRyeHNiS0Y2UCtZbitHR3V0bnYwQ05KYnB5?=
 =?utf-8?B?WE9VcUsyT0M3MDArZjJlSWp1Mi9LMW9ScDkrWlFPaWtPZnJKbHA0UWZ5dkRl?=
 =?utf-8?B?UEt3b2xGMno0Vmg3azN1NDZSRVZZT2I2ZWIvazdrWlBLQTdnOWFNbjV1aHhI?=
 =?utf-8?B?eW02Sm1UMnUxdFY5RjNPV2IwZ3FrcnFjQU1LUmhFTnMxUDNhQWtxSmJGcGdD?=
 =?utf-8?B?S2pCbjA0TlA0cVBLeGdwbWtaRlRnUElFT01EK21iN3FmQTQ0ajV1ZjNlVzZ0?=
 =?utf-8?B?Um50VzlKV3J1WDk0elREaHB1cW1mS2xtbEFlQjJVM2NBdlErMTRPd2hUZFFR?=
 =?utf-8?B?MFc0dWY3d0VEVnp5TGZXNDg1N1B6N1JtcTlpREIwL0s4aWx6dmp1VExaanJw?=
 =?utf-8?B?c2ZrNkUxb28zek4xY1JtU2JiMWVSUlFmWkFaQ3BiTG1ITjAxWDdoQ2h5TWRL?=
 =?utf-8?B?TGJrdGs5ZnUzdU8wNm94VXpCOVA0RGF6VnFBaFB5Rk82OEo4ZWZKbGYzcVBj?=
 =?utf-8?B?RGlHMFVNT2FpQkU2VTNXWEw2RHlrRGxxZlp6NDF5bWljOThQMGdMQ0wyaTZx?=
 =?utf-8?B?MzdHK0RuQ09SakFkczQxTytXSlRwMHp3MC9Ca0dBajlzZXBXZTZZK2NVWTZN?=
 =?utf-8?B?K1c2dzBTRWNUekFkR0FDSE8rSG12dDgxTFA4M1c1YiszVzNWZDVENDAyemkx?=
 =?utf-8?B?Y0dNVkRvamFaRzVVREJXOTVrWXBwZjl3WDNRY0RaTWEvQUw4OUN3UVpMd3FH?=
 =?utf-8?B?UDJSZEZZWXM0SnNTRWVsQmxSZXJoL0pFV09iU0FZYjRobWJzenM5M3k4MjVm?=
 =?utf-8?B?V1Y0aHhlbWJXTkErYVc5RU5IbFRxREtIRU5OK011dVVSZzJKRFpuVGtySFpk?=
 =?utf-8?B?M2E3S25JbDNMZ2U3LyttVFpmRVIrZ3Z1SDdobU9ERHJUOUUrcEdpRmJhSWNL?=
 =?utf-8?B?dlBrQmQ2bUpwdTVyb0kySGU2cFZyRFJUSFEvOVhrVDNYSGY1M0JlNWd6eng3?=
 =?utf-8?Q?egtnuaM4RGVj/fFU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeffaf5b-2518-4be1-2044-08de732cc6c2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:42:08.4966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvkqSg1P7IX4S3zbjNGVJpWYPLpX8FUI7drPJowGRgJwJ0sNSvzcnZ0n8cfVGV9ifseGTIcSf7Ck30QbMiWiqY/gWS920BXXVXvtBXY3kOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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

On 2/18/2026 4:26 PM, Daniele Ceraolo Spurio wrote:
> The default case of the PXP suspend switch is incorrectly exiting
> without releasing the lock. However, this case is impossible to hit
> because we're switching on an enum and all the valid enum values have
> their own cases. Therefore, we can just get rid of the default case
> and rely on the compiler to warn us if a new enum value is added and
> we forget to add it to the switch.

I understand the reasoning but prefer just adding a 'mutex_unlock(&pxp->mutex);'
to keep the check. The case for XE_PXP_START_IN_PROGRESS does this before goto.

There is a similar pattern in pxp_start that correctly releases the mutex on
cleanup. Any reason to remove it too?


