Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8306C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 05:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CB10E503;
	Fri, 19 Jul 2024 05:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFf/nPKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF1410E503
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721368417; x=1752904417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j3foYu08aB6FrckIsoTwx+VMn2LTAX6TComosUaFXYQ=;
 b=HFf/nPKackKVWUdTPeveS8+R3tvL5PMCwicVbmeER0cTd54bmYzjAeqL
 On4HmBY38HyKEIZowktdkeXeG6DhFIIYd8Tx7sCId9wPrHhFID18XkHHx
 mAwmFAMBGt6be8b7+Ha4NmSwRcNHjL/RKZ6znDLaXrvu4Hl7cvm8vK+1u
 UFdLrgNi49G8Q4ISN4rLHJFIP05eAneClPFF7eACUUoP+Q3Luj8ULG7Or
 6ruiUijJOcR8aSdsqimy4i0EIzgXQ/L4MXX6bQnTUXukoLPb2A3P1B9gG
 OKLSZUk7tmcVcqeKnDqNZY+Os+OPlcZ2M2jDVeCp1L8rrv235OXjQ+RUH A==;
X-CSE-ConnectionGUID: 9MqmGBZGSPOjt1xMKqT51g==
X-CSE-MsgGUID: cXvSue6vQyS0SG6unCSPlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18780496"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="18780496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 22:52:03 -0700
X-CSE-ConnectionGUID: PhkvU8/DRFmuyMuu9vpLUg==
X-CSE-MsgGUID: 8quWkLf2Qh+j9ww7on8HbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="50758620"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 22:52:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 22:52:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 22:52:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 22:52:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 22:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRQATKEqloZhNz0nv2iNXGgh0D8Rm7Z+NQtACEi4cUOMe42iveDzeThTpmAcrooZxM2BIsFq+giiAifpdplQoUllc3/YLlhQsXUCc2xpm81xl66TP+mXSwoEcRrqhph/rmx79xE16NKgBPGfyNS0QVlAOgzXZZgebmIRzLPXtDkQivqHMF2514dcYVbJupiZeKhCf3MU/FsWep3yrHo4FMFDnv2jgIP9Jgz6LTZuT5JRKHrD56WmJXr+G7YNqQQ7CoDR/Kx3Hc3SZvMr7GniwYXusUNMSIuU3GcrDpinFMfl9R6Kzefo3uvBvY4S5iGlTLWg5UQw0l35OSKSNRX20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRjzWh67oMzDMTd7fVeKH2xytcO7WhmRBlgvvm59QZM=;
 b=YP3Wmt9H1M8p0YAPzl/mBy6/0Oyjaei+dGVXzG6xwXB3pveC76QD6VDPkRb8W8zv9AXMPtSdNkChE7xUOzRjJ+4h27ct3eS6XhmmcPnVPTttYEiOZjWszZ1J6oRx1D9yfrOcEPZZa8dSBCeBI3ayr5E+xnh+R4M/UdB+yztjTqlyMFpQzQwrQxarTKNuHhVsT76gylyRAnomfkObY1mQeFkCxrtwkVk6kTn1Afn6NSSyeeE4VhikJVYLItUbNs/n6QtMl3pRtOwZWmHyzrTxiBvIyQGElCr8NABUrWNmXfIX7PufQxt3Q8lbZfv3Uf3lvMIPLF46mPhlZ9e0P9vXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Fri, 19 Jul 2024 05:46:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 05:46:14 +0000
Message-ID: <7cfac150-ff3c-4b87-a258-ca4f722bc734@intel.com>
Date: Fri, 19 Jul 2024 11:16:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs
 entries
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <rodrigo.vivi@intel.com>
References: <20240715095455.4069296-1-riana.tauro@intel.com>
 <20240717192338.GV2906448@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240717192338.GV2906448@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1677a0-6bbf-404d-1b6c-08dca7b619bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akxrTnZNTVFMcHBuSFc0amN6cjR4bGlPK3g4alg3SjkzZW1Mdk1TN3MzSnZI?=
 =?utf-8?B?UzlNWGtITUw4b0RXU1VVNGM5QTdoVEE5a2FNRCs2Y0Fkd2hCU2x5U1NxNjE3?=
 =?utf-8?B?eldiSnI2b2JaZ0RmcGZSdzFkbTdwckRtNnFJTzZya25VSlgvL2JhT2pxWnJI?=
 =?utf-8?B?WFNsY1lRbDR6dEJFRU9aeW02bjVpVHB3Mm5LbUVpWTRBc0N3cGVCRk9xSnlp?=
 =?utf-8?B?VWRtaHBKN25kZ0drdU4rZW95aGpvSlY3cnFuSlJvMitoa0FxSFE4Vm9HUE1i?=
 =?utf-8?B?cE1sVXBpbE1tTFN6d0d4akh0SHpSWHZDYng4ZU9tWHR1NkdQMjl6Vkg4UzA5?=
 =?utf-8?B?dDlxdCtXeVoxLzBBbHR0NmxLQjh0dVJXREU3VE1kbzlNWFVnR3VMbVF5ZzJU?=
 =?utf-8?B?ZEoxQmFIRW8ydC8yTHpvMXNrUWFPbGVqZHdialdxZ2Q1TkE5ODZXblJCcmhu?=
 =?utf-8?B?d3R6SEdPWHFWZGRiYmdLSU9QL2duK1I0YUVVL0VpNENKSlBYWnpCKzZFUjRs?=
 =?utf-8?B?eExaMG41dnY4OXEwYzBOL0ZqcFUrSGhzbmlOeEZkWmdtRkJuOXErSXYreEV6?=
 =?utf-8?B?NFk1N3dCK1lsMVFnREtpSFcvVEJIYWpnanN6UU9qaHNGMTg1c29Bc2dMaVBJ?=
 =?utf-8?B?RGxZakRuWkYwYWZ5UkJuanozOWtjWno2ODBEOU1lNmpCL2paRjlQbUE3blZO?=
 =?utf-8?B?KzV6UGliWWNiV011SDk3SUpkUUd5Z1hDY2kyaXRCeFJWcHkrUXpoeExJZjVn?=
 =?utf-8?B?czlOUnlZU3RiQWowcDd1SUZBVVlWdE50U2V2MGdCcGpIUUVqQjF5U200djdO?=
 =?utf-8?B?RXgrRzQyRVk1dE5PM3FQWlNaUm41ZENZR0M2empTSTBIeVdzckl5UDdnQmVZ?=
 =?utf-8?B?c1ZsdGV1QXBrUW5vMjQzcUViUWNIZnVtaEgxWTBUVTVuYzhkMkRmd002bytB?=
 =?utf-8?B?ZUl4Ym0xWUluWkZuQ1pvQTJJZCttY2RFTjdTcWpsSkJjQ3V1bmxqc2gxM1cw?=
 =?utf-8?B?eXRaMXJ3anlZcFl6VnZKVitOdFpjZDJRaTNhWGgzeU0yaUxiMnNPY0k2ZkZY?=
 =?utf-8?B?Z0RYcE1JNm9KTkZiS3QyK084QVQvYnNrRXJGQ1o5Wk5zbk9ZLzk5NlM2NjlB?=
 =?utf-8?B?WjJBYi9FMDBQdTA1cWphTWl5TlkyTlBoeFJvbkdpb0hWeDRWTVN1bWgxZGVq?=
 =?utf-8?B?REpYYm15aGNqWjRQaUJFS0N1YUoxMnA5VFA0ZWtRRWY3SHdKRG9Nd3lxTm1t?=
 =?utf-8?B?TlZzT3l4T1RabDJLcnAvbEI1cW0wLzVDd1RuUXVpbGU4THJjcnFsVWRqcmdS?=
 =?utf-8?B?Zmg1S0hIQk10bkVNRFJQOERRMjhBVzBYWVpqMllxVTFtZjZLd2tPQ0huaDZQ?=
 =?utf-8?B?NGt5ZXM0STZoRk1LVU8vbEpWMmZaMmxqWDdGR2xRVjBWbDJ5cGlReHVJZHZT?=
 =?utf-8?B?VVU1VVB3NEJzSlVra2xlaCt5TElVNVZxbHJXb3Q5NExRc3FrdWNhTXlzQXln?=
 =?utf-8?B?ZUM2R3lmem5XNFpnaFZGdlZ4TnIrYkhxSlpSMVA1dWFXekd2dHgzM01HN09Q?=
 =?utf-8?B?cnJ3bGk2aWVGcWgwdmJCSjAvbnhnaUlaUUFKR3JCRkxEVExhOFp6NjlUdXFv?=
 =?utf-8?B?UmpLZ0E5YlhZWVRYT011NEtxc2I1VzFkUzVDOGRoY2Yvall6N1ZhMGxuYmpP?=
 =?utf-8?B?VWhsVWVhK0RUeXVTcGx6VXZvbXB6T01MaWg2RWNPUWUxWTREQVE3TDBVa0dT?=
 =?utf-8?B?a21BbFBnQUdVSlZsREMwelJRaGVkbEJJUmJoamVpaTJjdjEzQmd4eXpvRWhQ?=
 =?utf-8?B?TlFiK3k5Q0pudVE2MTU4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UStLcHlpdlFmQk9NcFhqWGppZ1lObVdSRytKMlZwaW5iclhmdFA1dzNBZWJY?=
 =?utf-8?B?eFVGczJaa0xHN09kYVEzamlua2pNYTRZdmpDVmJhMnZnOXhzQkpxS3EvVTJP?=
 =?utf-8?B?TjhyT20zZUc5NnJReFhNYXlhTUt1WTk5TVUvVDExN3R3S3lQYURMOS9FM0J4?=
 =?utf-8?B?ZGl3UWYzT0V1VjlyS2hybk1paHY5SGtDUW9URm56VjkrWm9HaERVOUtSNFVx?=
 =?utf-8?B?NzZjc1hMdHNNSXBpcDU1Z1ZQWlFITFhsUDFDeHR6N2Q1UzJRS0IrUEhBSGpv?=
 =?utf-8?B?aE1EamJocFg1RXg5S3M3bUZLNzdGajRCTTVMbTlZMmN4NjZEZWtpZWlWTkFF?=
 =?utf-8?B?b1dpK2lacmFRZitSc05UUnNVbVBQRzI2YmhET1dMbVcrQjU1RDlTeVE0blZ2?=
 =?utf-8?B?T2xuUDBYM1VtL0JWeGQwM3R6ZTFRWi85WHJwL3JtM2N1dGEreU9QV3MyTno1?=
 =?utf-8?B?SmFyRVQyZDBwczJpWDBEZEdYcWtGSW5vc0hxMExaS2k4ZG53ZGNpMTh6R29w?=
 =?utf-8?B?dzJxeTB1ZHdyQjJsM3VjY0FGNjFMbzFiMld2bFN4QzBqV1NVU1NzV3FuWk91?=
 =?utf-8?B?R2thSlJZYU5RSG1BMjhuaUd3cWh3TjdvR0ZZN1JhYU0zbGRRQW5pQlQ4NmhN?=
 =?utf-8?B?OXNySEZVb29JOU42MUYyQ08yNytQUzl1SEhGQVZnUnd4UlMwS2RYSk5PMFlq?=
 =?utf-8?B?LzREVEFnd2xxbm9aQytRVGJIdGFSOVdZendTSmd0czdJUk9wS3F4OHVBME5Y?=
 =?utf-8?B?bCtkTlhadlViZ0Z6RUZWNk5XbVN5dXcwdENMSWZHN0h1TXRkTW1FWm1pSmcz?=
 =?utf-8?B?OE5TaXZVbTJVTUIrbkxjWkVRU0M2VzFNUTE2elkxQ2JxRURSc2VtVEx0UWJG?=
 =?utf-8?B?VmcxNTg0OXZVdkg5czM1SzJURFN2d3BlRW84OEtadW1oMnFVN0llU1BmVi9z?=
 =?utf-8?B?ZDc5aUhHcXBLdDZWbHJqdEEzU0tKSDVERHR3cVpXaFNBbHpmSUE0ejgzSkRp?=
 =?utf-8?B?N25WVzc0YUhXOTFmSVJWYTJUcmQzRVVBMUFzUkpiQ0pBMDY1bFJiSmU1MC9Y?=
 =?utf-8?B?TXEyblVVY0JuZVFOVk02aStRSUlvRmhUTlFRMkpMYUJGVzVJcmhHdHJxdlEz?=
 =?utf-8?B?VklxVTN2dFRyZkZJdHZvaVhFVWFISWpoVkt6SUJTM3RFWnpSanZaa1BZcFF4?=
 =?utf-8?B?YkwzdkNXaENYb3AyOU9MSWpGd1Q5MXI1dzBRZk1WcWw2ZjZoeUtiMnZwdStu?=
 =?utf-8?B?aG9HKys3T3RFKzV2VytJUkI5VHlPbEFXM2FvcGtmcVNMOVRVZUx3bzVONWxv?=
 =?utf-8?B?SnAxVEpiV2VLblBiRzNkeENpV2VFSGFiUm9QU3BqeXNqU20ycHRROFJLdURF?=
 =?utf-8?B?NEcwZHdhTkZZR1l2cWVMVk1meW1RczNWQUFpd2Jyc0lvSjhZQ1VNT01tc3lJ?=
 =?utf-8?B?SUtRWWRVMURkUFhDMStuNnZmakFzdFVwUFJJOFhUcWtSdE8vRitOMDRhOEZ1?=
 =?utf-8?B?MmNqQjh6aHd0Z0RrOTF1SUtpZ0MzVHJLdktMUFpQWFZhWFQycEYrTGpDZld6?=
 =?utf-8?B?QWNVbkxpM29xTjAyWjBvNndhNi9oWW5DRUZnNTRYa1BGVUtuZlFpVTdZT0JO?=
 =?utf-8?B?UWFGVTFXZmZRRXU3dzJMTjRyTURVSTIrTlQ3U2FNbDJRMGYva0RIR2lFVmt4?=
 =?utf-8?B?K25oR0srMUpQOFU4OW1FaVZSVUdISW5jTFNXM0JvbndYb01PU0hjemliaW9R?=
 =?utf-8?B?ejVmNVlGeGE1cVcrdFcvQ1RpbzBhQzdWVjZGaVo5VW1NMzlYbFRiK0VjM1A0?=
 =?utf-8?B?dTVTdjJsZlhYUkhQTGtINjd6K3lER25CYUtJL2FDK1JwcHZHUkl4RVI0Umht?=
 =?utf-8?B?K1RoK29rOEJ6TklINTRQS3pFUHlrZmJubzVsaDhvcU5pWENXSDFLemg1R1o3?=
 =?utf-8?B?VlhGNDNVUnVMcHoxVzVXN3pFODJKRDV0dlMxVjBxcTdZZGZrdG1ickNnb1p2?=
 =?utf-8?B?NFVER09UVXNYTHFkekd4UEJBYjgwT0lCMTlGTjFCd2xCOEprWnNJOW1CSUhk?=
 =?utf-8?B?QUl3aS83dnlidkRzQlZlaFh4L3lKV0pNNWtEck9qSW55bkwrVS9sTzlRWmlj?=
 =?utf-8?Q?a32dFYySO19ifGmNogalactGI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1677a0-6bbf-404d-1b6c-08dca7b619bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 05:46:14.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c03rWf8RVr2C/t1UVW/cSDR2f2N21h76fsvNERf5o+/r+8asi5XRHUfLPLB855pFgca9eavf781hE8sMKyp93g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
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

Hi Matt

Thank you for the review comments.

On 7/18/2024 12:53 AM, Matt Roper wrote:
> On Mon, Jul 15, 2024 at 03:24:55PM +0530, Riana Tauro wrote:
>> Add coarse power gating sysfs interface under gtidle directory to
>> display the powergate properties.
> 
> You might also want to explain what "powergate" really means here.
> I.e., how does this powergating differ from what happens with RC6/MC6?
> When can powergating kick in?
Will add these details in the commit message.
> 
>> powergate sysfs directory will be enumerated for render and media
>> if present.
>>
>> The new entries will have the below layout
>>
>> 	tile<n>/gt<n>/gtidle/
>> 			├── powergate0
>> 			│   ├── enabled
>> 			│   ├── status
>> 			│   └── type
>> 			└── powergate<n>
>> 			    ├── enabled
>> 			    ├── status
>> 		    	    └── type
>>
>> type:    type of powergate [Render or Media]
> 
> What userspace software is expected to be reading this interface and
> what will it be doing with the data?

IGT test is planned for this. Also this is required for debug purposes.

> I'm surprised that they want just
> a single "media" powergate rather than providing the actual powergates
> that the hardware supports (e.g., one entry per individual media slice,
> which would allow userspace to either consolidate them or split them out
> as they see fit). 

i915 actually displays this info in debugfs and does it only for a 
single media slice (ie slice0).

Since there would be multiple directories, combined it as one in this 
RFC. Will split it per media slice


> If we just expose whatever the underlying hardware
> has (which may vary by platform), then userspace is free to consolidate
> some of the values itself if it doesn't need the lower level of detail.
> 
>> enabled: true if powergate is enabled for the type
>> status:  Indicates status of powergate [Up/Down]
>> 	 For type media, status is "Up" if any of the media
>> 	 slices are powered on.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   7 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 214 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  17 ++
>>   3 files changed, 237 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 8a94a94d2267..8586c830bea6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -335,6 +335,13 @@
>>   #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>>   
>> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
>> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
>> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
>> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
>> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> 
> Nitpick:  bits are usually defined in descending order instead of
> ascending.
> 
will fix this
>> +
>>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
>>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 67aba4140510..fca13e645d24 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -25,13 +25,26 @@
>>    * device/gt#/gtidle/name - name of the state
>>    * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
>>    * device/gt#/gtidle/idle_status - Provides current idle state
>> + * device/gt#/gtidle/powergate<n>/
>> + *                              ├── enabled - indicates whether powergate is enabled
>> + *                              ├── status - status of powergate [Up / Down]
>> + *                              └── type - type of powergate
>>    */
>> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
>> +{
>> +	return &kobj_to_gt(kobj->parent)->gtidle;
>> +}
>>   
>>   static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
>>   {
>>   	struct kobject *kobj = &dev->kobj;
>>   
>> -	return &kobj_to_gt(kobj->parent)->gtidle;
>> +	return kobj_to_gtidle(kobj);
>> +}
>> +
>> +static struct xe_gt_powergate *kobj_to_powergate(struct kobject *kobj)
>> +{
>> +	return container_of(kobj, struct xe_gt_powergate, kobj);
>>   }
>>   
>>   static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
>> @@ -129,6 +142,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>   	}
>>   
>>   	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
>> +
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> 
> Unexpected whitespace change?
yeah missed this. will fix this
> 
>>   }
>>   
>> @@ -145,6 +159,70 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>> +static void gt_idle_powergate_enabled(struct xe_gt_idle *gtidle,
>> +				      struct xe_gt_powergate *pg)
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	u32 enabled;
>> +
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +	enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +
>> +	if (pg->is_media)
>> +		enabled &= MEDIA_POWERGATE_ENABLE;
>> +	else
>> +		enabled &= RENDER_POWERGATE_ENABLE;
>> +
>> +	pg->enabled = !!enabled;
>> +}
>> +
>> +static void gt_idle_powergate_status(struct xe_gt_idle *gtidle,
>> +				     struct xe_gt_powergate *pg)
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	u32 status, reg;
>> +
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +	reg = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +
>> +	if (pg->is_media) {
>> +		/*
>> +		 * Media Slices
>> +		 *
>> +		 * Slice 0: VCS0, VCS1, VECS0
>> +		 * Slice 1: VCS2, VCS3, VECS1
>> +		 * Slice 2: VCS4, VCS5, VECS2
>> +		 * Slice 3: VCS6, VCS7, VECS3
>> +		 */
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0)
>> +					    | BIT(XE_HW_ENGINE_VCS1)
>> +					    | BIT(XE_HW_ENGINE_VECS0)))
> 
> If this is false...

Won't media slice 0 be always present if media is available?

> 
>> +			status = (reg & MEDIA_SLICE0_AWAKE_STATUS);
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
>> +					    | BIT(XE_HW_ENGINE_VCS3)
>> +					    | BIT(XE_HW_ENGINE_VECS1)))
> 
> ...and this is true...
> 
>> +			status |= (reg & MEDIA_SLICE1_AWAKE_STATUS);
> 
> Then status still has an undefined value here.  Ditto for the other two
> conditions below.
> 
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
>> +					    | BIT(XE_HW_ENGINE_VCS5)
>> +					    | BIT(XE_HW_ENGINE_VECS2)))
>> +			status |= (reg & MEDIA_SLICE2_AWAKE_STATUS);
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
>> +					    | BIT(XE_HW_ENGINE_VCS7)
>> +					    | BIT(XE_HW_ENGINE_VECS3)))
>> +			status |= (reg & MEDIA_SLICE3_AWAKE_STATUS);
>> +
>> +	} else {
>> +		status = reg & RENDER_AWAKE_STATUS;
>> +	}
>> +
>> +	pg->status = !!status;
>> +}
>> +
>>   static ssize_t name_show(struct device *dev,
>>   			 struct device_attribute *attr, char *buff)
>>   {
>> @@ -197,10 +275,130 @@ static const struct attribute *gt_idle_attrs[] = {
>>   	NULL,
>>   };
>>   
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr, char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +	gt_idle_powergate_status(gtidle, pg);
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	return sysfs_emit(buff, "%s\n", pg->status ? "Up" : "Down");
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t enabled_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +	gt_idle_powergate_enabled(gtidle, pg);
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	return sysfs_emit(buff, "%u\n", pg->enabled);
>> +}
>> +static DEVICE_ATTR_RO(enabled);
>> +
>> +static ssize_t type_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt_powergate *pg = kobj_to_powergate(&dev->kobj);
>> +
>> +	return sysfs_emit(buff, "%s\n", pg->is_media ? "Media" : "Render");
>> +}
>> +
>> +static DEVICE_ATTR_RO(type);
>> +
>> +static const struct attribute *powergate_attrs[] = {
>> +	&dev_attr_type.attr,
>> +	&dev_attr_enabled.attr,
>> +	&dev_attr_status.attr,
>> +	NULL,
>> +};
>> +
>> +static void powergate_sysfs_release(struct kobject *kobj) {};
>> +
>> +static const struct kobj_type powergate_sysfs_kobj_type = {
>> +	.release = powergate_sysfs_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>> +
>> +static int register_powergate_sysfs(struct kobject *gtidle_kobj, int idx,
>> +				    bool is_media)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>> +	struct xe_gt_powergate *pg = &gtidle->powergate[idx];
>> +	int ret;
>> +
>> +	kobject_init(&pg->kobj, &powergate_sysfs_kobj_type);
>> +
>> +	ret = kobject_add(&pg->kobj, gtidle_kobj, "powergate%d", idx);
>> +
>> +	if (ret) {
>> +		kobject_put(&pg->kobj);
>> +		drm_warn(&xe->drm, "Failed to create powergate%d sysfs directory\n", idx);
>> +		return ret;
>> +	}
>> +
>> +	ret = sysfs_create_files(&pg->kobj, powergate_attrs);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "Failed to create powergate%d attrs\n", idx);
>> +		kobject_put(&pg->kobj);
>> +		return ret;
>> +	}
>> +
>> +	pg->is_media = is_media;
>> +
>> +	return ret;
>> +}
>> +
>> +static int gt_idle_create_pg_attrs(struct kobject *gtidle_kobj)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
>> +	struct xe_device *xe  = gt_to_xe(gt);
>> +	int ret, idx = 0;
>> +
>> +	/* CPG is disabled for PVC */
>> +	if (xe->info.platform == XE_PVC)
>> +		return 0;
>> +
>> +	if (!xe_gt_is_media_type(gt)) {
>> +		ret = register_powergate_sysfs(gtidle_kobj, idx, false);
>> +		if (!ret)
>> +			idx++;
>> +	}
>> +
>> +	/*
>> +	 * Do not create media pg status if the entire first media slice
>> +	 * is absent (i.e., no VCS0 or VECS0).
> 
> Is this an attempt to work around the bug above?  Otherwise I don't see
> why we'd want to tie this to media slice 0 specifically and not report
> powergating when only the other slice(s) are available.Won't media slice 0 be always present if media is available? I saw some 
code in xe checking the presence of slice0 to check if media is available

Thanks,
Riana
> 
> 
> Matt
> 
>> +	 */
>> +	if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))) {
>> +		ret = register_powergate_sysfs(gtidle_kobj, idx, true);
>> +		if (!ret)
>> +			idx++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static void gt_idle_fini(void *arg)
>>   {
>>   	struct kobject *kobj = arg;
>>   	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>> +	struct xe_device *xe  = gt_to_xe(gt);
>> +	struct xe_gt_powergate *pg;
>> +	int n;
>>   
>>   	xe_gt_idle_disable_pg(gt);
>>   
>> @@ -210,6 +408,18 @@ static void gt_idle_fini(void *arg)
>>   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   	}
>>   
>> +	for (n = 0 ; n < 2; n++) {
>> +		if (xe->info.platform == XE_PVC)
>> +			break;
>> +
>> +		pg = &gtidle->powergate[n];
>> +
>> +		if (pg->kobj.state_initialized) {
>> +			sysfs_remove_files(&pg->kobj, powergate_attrs);
>> +			kobject_put(&pg->kobj);
>> +		}
>> +	}
>> +
>>   	sysfs_remove_files(kobj, gt_idle_attrs);
>>   	kobject_put(kobj);
>>   }
>> @@ -248,6 +458,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> +	gt_idle_create_pg_attrs(kobj);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> index f99b447534f3..603f7f6b509d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_IDLE_SYSFS_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include <linux/kobject.h>
>>   
>>   struct xe_guc_pc;
>>   
>> @@ -17,6 +18,20 @@ enum xe_gt_idle_state {
>>   	GT_IDLE_UNKNOWN,
>>   };
>>   
>> +/**
>> + * struct xe_gt_powergate - Powergate properties
>> + */
>> +struct xe_gt_powergate {
>> +	/** @enabled: powergate enable */
>> +	bool enabled;
>> +	/** @status: status of powerwell*/
>> +	bool status;
>> +	/** @is_media: indicates media powergate */
>> +	bool is_media;
>> +	/** @kobj: kobject for powergate sysfs */
>> +	struct kobject kobj;
>> +};
>> +
>>   /**
>>    * struct xe_gt_idle - A struct that contains idle properties based of gt
>>    */
>> @@ -29,6 +44,8 @@ struct xe_gt_idle {
>>   	u64 cur_residency;
>>   	/** @prev_residency: previous residency counter */
>>   	u64 prev_residency;
>> +	/** @powergate: powergate properties */
>> +	struct xe_gt_powergate powergate[2];
>>   	/** @idle_status: get the current idle state */
>>   	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>>   	/** @idle_residency: get idle residency counter */
>> -- 
>> 2.40.0
>>
> 
