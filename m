Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C19C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 07:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FDC10E400;
	Mon, 14 Jul 2025 07:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPfWIGVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18D10E404
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752476835; x=1784012835;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UjFVzWDKgMEdnT/MFrVV4lJswMWf4VW1akznY7p81Yg=;
 b=BPfWIGVyxxK/o2lznCz/IWpivsSR05QMbmHUzK2BRBlhcnc2/ZV0gx7I
 MTYYsfAOWNoQDNvbFvJwxOhU0mr3NYDziPgbY3KnJYqTvRxEdKTMAA6w4
 qZyEiL10pwC6XBUBfkLgVhKalO4kY3F/3b+HgxISl/wO2WoZtcOKedcjg
 vtEpegRZ6ZVnL6b0fDUaxUiQKSaun/jE0dlFUg0I7zmjGitgJ3c2e8JmN
 sCbYB+QjK6J5BQEUCyargpxfaQ0B//vWxalIL+imvkW5QwdeaAWdzDaTJ
 3yaJZlFXirBgB05Z9skFu8IHKWIxmobqwHJoWGiXI/vYLti0ADCGg94qg g==;
X-CSE-ConnectionGUID: p75AXxiYQOilLpEi1hh3yQ==
X-CSE-MsgGUID: 6cNH2pdWRNq9MZJUHDwsDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53882482"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="53882482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 00:07:14 -0700
X-CSE-ConnectionGUID: tvIxppzSRSOUO3maNpXEcQ==
X-CSE-MsgGUID: fn1WU3SHTtCUgVg9cYMRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="156282581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 00:07:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 00:07:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 00:07:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 00:07:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsEPblAsNgX0Cci5BQKLhBvfagnnnI34g5e+jBjF8SS/EA0iXZYA6Sr7eeRjOE3cFQINQThoF3t8HrbLvjrVipiGfTAkhUVfF3sIgMiKSjJzM+vKN0vheIfswIa4Dcug4OjoSZsI7EJQtbU6c0Fy1RdXQFzZYPOJalo4VCo3VnwX3IubJDvTuJN1VXFFcPhlZICtO875bqfBWyMi17rkfg0t9N/4OlEGTKHi6Aqx0aiLA4bq5vmUDdzYCi+zhm6IPxCU16UaUo47eakuKr6mfZG3F2Noln/bVzSN6GbU6cuodcLdh//wp0tO4zi7tTGDiDPwD19HOPfLWy0D5irT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqFhVAdnixItbHXoQJPArKmH2VjhBZrB+aOQazJgq6A=;
 b=d70OmSZo2017MePtyC7d4VGEoxcwt1sAg6IB2teXOjFL1RiswZbqa3PhOrc17dhlioMKSP9aB47S+t4pCs7ydpLB3Yib/RFPSClZr7S5TtIGR6usZnxr16ERlHNslO8cTRvJi9/M/vmmnFLivpvve9CDIneIitwpnhl9GdMzRNBI22+kPngv7X5iVun2Ajfd1AJSRqzfcFjsZ4R4oWRxgkt2h9aCUM9DJC5AufnKvHI0w7oXcl7LNrX73qZ11d1iaSNUOpRg3b4bntgJUcJpxmGK0JcoQySSMDj+QoEP/754gXQs3hOJZBdB8J8PWZKgOyhPIZ3zsL3Mv4PNTW8ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 14 Jul
 2025 07:07:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 07:07:11 +0000
Message-ID: <aa9b7c63-34cb-425b-9bf4-d45ee2920bb6@intel.com>
Date: Mon, 14 Jul 2025 12:37:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-10-riana.tauro@intel.com>
 <aHFM1MSvgrn4U1iF@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHFM1MSvgrn4U1iF@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e74c29-1c97-46fe-90f0-08ddc2a50d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEdVU2FqR1Rvd292aXZ0M09FNnV3OElydnFKWm5tdWllSHgwN094Nm1raSt1?=
 =?utf-8?B?YmhhbnZtQzhjZTlNV0QyTFEwUmI0WnpQMXJSRi9HRzdVVjJYNlgwSlRMY1Bo?=
 =?utf-8?B?MVo2ZFNWWXJRMXk2elVWTzdjZFRhckRFRFY2bmtENllwcFFyT1FzVk9TWkdQ?=
 =?utf-8?B?Ui8wMXl3Q1BlMmsrUEtXWnF4eUVsWmllbEJUcVY2aklkY05UMFNPZjNreVhp?=
 =?utf-8?B?enU1bjlpZ3R3NFhTVHZvRStXeWJyN1l4L242bVJNWHo4UDFmWXNFaW92elI3?=
 =?utf-8?B?c0lNOHdVY1lienl6dlVSeUZjei9DTExBWTM0byt3UFF2MS8zWEFlS2lBTTJx?=
 =?utf-8?B?ZkpBTHVJVkdienJKLzlJSmpSdEpGcW1HeWFtblZSZGZMWlZOWUdRNkRVclFo?=
 =?utf-8?B?TUR5TDhzSmgxWTE0K092VVFpbUMxZk1nSXFHZkFra1ZQNGlYY2ZRV0w5TlVm?=
 =?utf-8?B?KzNPZTVyRmpicGRvYXMrMXVlSis4NlluZFVnMnlXaVRlMUtoUzBsS3VRUkRo?=
 =?utf-8?B?SlBLaU1XcFB4dXNOZXBabVBOM01jbDhTUEdoT3NwczZFOGdxVFlwaHc2dExm?=
 =?utf-8?B?YUQrY2NRVEZGOWNpRGRINUtCTVBVdEN2N2w0cW15QTVOY0hRYVB2Vm1QcTd0?=
 =?utf-8?B?VmlDUFI0UlNGeVViSmtTcU5WaktUcFZuRU9hbEYwMEJxdi9lL1hxa1dlWEta?=
 =?utf-8?B?SHFFNGl0QkNFY2F5UUJSdzB3Qy9qUnZUMkR4NGlsMGh0QTNiTVJTWVljNEVu?=
 =?utf-8?B?N29FTE44UURjak9CV2xiWHRyNUZiSkVJZHM1dmZPekh3YnF4bUxJVHJ1WktZ?=
 =?utf-8?B?NzNiVW5XVGNld2N1azR0SWJXQUdUZzVOUXIvTFZPR3B6eFJtZEdsZk93VzQ5?=
 =?utf-8?B?N1o4RW04WllGTnpvdmZUM2tOZXpVSW5vNThVYTdES0U1YWs2TTRwcjRXSmpk?=
 =?utf-8?B?ZllPeGUvWGpYUXVYYXB2cmJoZFZaay9IMUw4NUNuaDRVNGpsLytnVGF0OE1W?=
 =?utf-8?B?aUt3VG9aUHhrRURxSTBDVU5ZZDlvZ0FvMnNHeXUzbXdaV3ZGdXZZSndOZk04?=
 =?utf-8?B?UHRCRzZvVTZaTmRzTnFqY1NBd1U4bnR2aHdEeGZzWFAyV0VoSUhrb3JiZERs?=
 =?utf-8?B?NzJXRHU2allWZnNtTFBEa0pHeEtmblA4MTR4VHpTbUxSOGNtZUg3ejFXeHFZ?=
 =?utf-8?B?akhzandONTNMeVZuMDRoc01tY2lXK1h0TmdUNG0rWFF3eGxiclZoMUhWa1ZV?=
 =?utf-8?B?cUZuRDdiamVNSXd4OEIydXhLRlRZRU5scG04S3psVWFLa24rdktDd21yQ0NV?=
 =?utf-8?B?dkIrM2cvRzJLUXJRZTUya0hxb2h4STQrNTZ3K2tTdnRnTmY0L0EvQ1R1TUZ6?=
 =?utf-8?B?WjVmVDhtWkdzQlVGcTJIOEZ2V3g5WDd1cWlMbCt1aSs4YlVQMHIvRXJrWWJL?=
 =?utf-8?B?NUZaVXNTOUFJRUErcTNwaTloZzR2cnRlakhac2J6Q082bVFDMXgvRHpwUGJw?=
 =?utf-8?B?cVVuSTQ2VENFL3hXYWRXYUZNRTFER3pZOElzQjFUU2duK0xOU1hacy9uZXlt?=
 =?utf-8?B?bkp4UE9VUWdLbitxT3BaR0t2QVF0UmZ1UDYvL01WQjFuUW54QVJGa2tKQ1JU?=
 =?utf-8?B?OHR0cTZFQ0VFdGhvMmI5bVk3RFhaVHZETk41eW96T1orYjk2cEgxWkRWcG93?=
 =?utf-8?B?U0psMW8vbndZQ2tEdWlPTXBjbUxkb0MwT1lteVJkaG5LK0k0OHhHZHlYbmtq?=
 =?utf-8?B?ZVFySkUwSkdVL3FTcDRWdFBJVXpCN3FHVGJoVzVHVHI5UjgzRUlGbi9HUlR2?=
 =?utf-8?B?RTBZQi91azN3dU5EMllkNis3R29IeWd1ZGVJbTRLVytGbFJOekpPUzRRZ3Zn?=
 =?utf-8?B?M0FCbFk3TjhyUmRwMUllK2U5YzI0dDNUWVI3b3F4K3pWanJoZXRoUU9UL1hI?=
 =?utf-8?Q?OA/jWHG/K4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFlYXRkN1daZXo2REtsWlZXVTI4aUJUb0daL0lIWTMwOVdyUUE4V2NYMXho?=
 =?utf-8?B?UE1BNWYrZElqV2p1bzZJVEJUeENidlJCYmVmVU95MUlSamJrYUZrZllVZTBp?=
 =?utf-8?B?ZmhNTTI5RnFYNUk4NUcvRnhBMElLNm44Qkk4ZElvaSt4d3lGcjNLenZFSC9C?=
 =?utf-8?B?dDlDRDA4NmwxV0ZIT0JMeklUTVJiN1UvK3VDMEpNZ1RveExJMTRBMWlwYjMx?=
 =?utf-8?B?dUM0QnhENzFlbmloaWQ4M1diOFdqU05OVG1JL0pESnRJVFVDNkxxbE5Pb0k1?=
 =?utf-8?B?S2pnbDZ6SVZIRE1jdGlkazFSUGhmRTI2c2JhMlpaVWp4ZWJqRWIvOWo5eHpu?=
 =?utf-8?B?aWpWRG5IMlJkUHltUDlzOTJQQXBxQ3hxZG16WFVLelltMHFsZXJ2YUdITEVz?=
 =?utf-8?B?VUo5NFlBdDlzTytJdFgxZkFLYitMbWY5NjBGOUNRU3R6VDFzbjFpRThPMEZ2?=
 =?utf-8?B?SEo0SGdwTkVZTmxIbzNkTDE4SlpYS3NTeHlybW9QQXcxNTkzRUhDeVNWYits?=
 =?utf-8?B?K3RnWmRNblVwN3dvS2tXVmJ4QVJJOTVWVDhLWXFaT3h1ejEwZlROM2tIalRw?=
 =?utf-8?B?L1hoeVhRdzYxRGtsbnlheHA4eEJUemw3cXJHb1JWVHhsWEkrcHlpa3IwemN6?=
 =?utf-8?B?a3BNcEFzZkR4Z1pvNW9EcG1nT3lJZFhmMEpQOXlOMzJLaG9YL2hNeEVIdHU2?=
 =?utf-8?B?N09tN2xxaTcvM2RQaStFdjNIMmREaEJjRktpRHVvbS9QNUpsWGdZc09paDlt?=
 =?utf-8?B?ZGVvWEVRMlhlOHZsWXFxeEcwcFNJRXBOMlJPN1huMEhFbkloUUtNMkNCY2J0?=
 =?utf-8?B?QTJkNURud2FJbEVUUmlrOFZnYnBVRzg4aVovZ2JpeUdnUmtkaEdVYjhBUEVJ?=
 =?utf-8?B?WUVEaGh2R1ZMTkVPbkg0OVM1YlRveU01OUIxb1U5QlNyWDFzTEdHN1pxOG5p?=
 =?utf-8?B?aGROR0JRTEpPaUNRWkc3akVoOXNPdEJhdE1yenlkMkFHZUU4b1dDa3VYckVE?=
 =?utf-8?B?M2NqVXZrM1MzdnUrQ2l4L3hwc0h1VTFJSFRNK3hrTTRtREo0WDYwaVhORjI4?=
 =?utf-8?B?cEpQR1dneXd2b3REeXI4QjBBTGxiVG9LZlk0V2ZZQytWcXRoWkFQZTRLazZt?=
 =?utf-8?B?RkFaekVtMTEyc05oTU1zM29jenBsQmQ0TUM2cTQ4MU5ZQmV0T3ZJV0puTWVE?=
 =?utf-8?B?V2FmU2p1WjkxenNRR2ZTVTBGMVhxVUwzeWFObENNWUVkVTIrWHdPYk9PRnh4?=
 =?utf-8?B?NkhlZTRjZ2pISlFYajlNNER4NDZSanJmQTl1Z0tsZm11R2ZYWjk2WmllT3Vi?=
 =?utf-8?B?akxVNmFMWDNKVjZ1aFBRMVJvb2FEYjArNTFKZVVLRDlkMlFiRUtieVd5OHNK?=
 =?utf-8?B?SHZsNlJLMDNtMFU5TzZTN056MWFaTTg5Q2grYVl3TVNDcXlJbG9RR3pkK0ph?=
 =?utf-8?B?M2Q3d0xUMGlmNmlnM1VScklOTW9reEtIL1Q3K2RkQkY5Z2lCRFppd1VNaVZB?=
 =?utf-8?B?M0dwMERZVlFXNGNNMnZ4aG8rdXZBUmViVGV4VDhzdCtkMUpQMk9XeUhvdmR2?=
 =?utf-8?B?Qit2T1lnZklkSzN0OHZOQ0tLMmJmN3dJa1hRdWZuUHRyakEvaWU0NXU5djFU?=
 =?utf-8?B?RmluNG5kQXp4Sld5N3BXMkFneHJJc0FVczVHWVRSN3l4YVpmd3k3dXRKb1BU?=
 =?utf-8?B?Y3FzTjl2dWNublRQL1A1TTI3Wm5Mazdjb1NMQmU1SFE1MDdRSjVkNThkRmti?=
 =?utf-8?B?ZXNhMzFxZldRTFRKQ3dMbUNkUlU1SkNHdEo1aFYxbzVKUEFRbUFDUnZGd3ZJ?=
 =?utf-8?B?Y1c4ZWZDRjZwb3JzY3JlMXNteWVSWmJBbysxU1RqSjJRY3BRVzdNNGNNb3pp?=
 =?utf-8?B?eWFldVVjem1RanRwakJxM1ZZcVIxT3Q2YzM5RUgvOGZYLzBISDVDMzcrTCt1?=
 =?utf-8?B?ZnRVVk1FV1lEWFZmSUNRS1o1Rys1ZExZZnY4ZEVCb044VGVqNTFIaHlDUld0?=
 =?utf-8?B?dThMbnhzUTR2NFBVRGppRi9XeGlJdlhZdWkwdFFzd1YvMFF5Nk13MWxCOWwv?=
 =?utf-8?B?UFNRYmNVa3BQS0ZNNlZuZWFMKzZ1UVBTODJ5R2x5RUtHMDRhQm5MbWpGenRQ?=
 =?utf-8?Q?gbvE8yHWN6IAQovIB+jxBeQEs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e74c29-1c97-46fe-90f0-08ddc2a50d29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:07:10.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSwlOMzY7nP+oKAafHxwmKGiLp3GyiYoXuNdMbjQ4ST51YOtMHBH0qqvARy4XLUTHFY86Yv7hAm2yZtioHqfFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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



On 7/11/2025 11:11 PM, Umesh Nerlige Ramappa wrote:
> On Wed, Jul 09, 2025 at 04:50:21PM +0530, Riana Tauro wrote:
>> Add a debugfs fault handler to trigger csc error handler that
>> wedges the device and sends drm uevent
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_debugfs.c  |  2 ++
>> drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
>> 2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/ 
>> xe_debugfs.c
>> index d83cd6ed3fa8..134610437aea 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -29,6 +29,7 @@
>> #endif
>>
>> DECLARE_FAULT_ATTR(gt_reset_failure);
>> +DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>
>> static struct xe_device *node_to_xe(struct drm_info_node *node)
>> {
>> @@ -273,4 +274,5 @@ void xe_debugfs_register(struct xe_device *xe)
>>     xe_pxp_debugfs_register(xe->pxp);
>>
>>     fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>> +    fault_create_debugfs_attr("inject_csc_hw_error", root, 
>> &inject_csc_hw_error);
> 
> Maybe create this attribute only for BMG since it will bail out anyways 
> with an error when the worker runs? OR are you expecting to see that log 
> message which says "runtime survivability not supported".
> 
> The absence of this attribute in debugfs can also be sufficient to 
> indicate that it's not supported.

yeah makes sense. Will add this only for bmg

Thanks
Riana
> 
> Thanks,
> Umesh
> 
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>> xe_hw_error.c
>> index 7cc9b8a7fa1a..2d56a93b3a71 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,8 @@
>>  * Copyright © 2025 Intel Corporation
>>  */
>>
>> +#include <linux/fault-inject.h>
>> +
>> #include "regs/xe_gsc_regs.h"
>> #include "regs/xe_hw_error_regs.h"
>> #include "regs/xe_irq_regs.h"
>> @@ -13,6 +15,7 @@
>> #include "xe_survivability_mode.h"
>>
>> #define  HEC_UNCORR_FW_ERR_BITS 4
>> +extern struct fault_attr inject_csc_hw_error;
>>
>> /* Error categories reported by hardware */
>> enum hardware_error {
>> @@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum 
>> hardware_error hw_err)
>>     }
>> }
>>
>> +static bool fault_inject_csc_hw_error(void)
>> +{
>> +    return should_fail(&inject_csc_hw_error, 1);
>> +}
>> +
>> static void csc_hw_error_work(struct work_struct *work)
>> {
>>     struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -134,6 +142,9 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, 
>> const u32 master_ctl)
>> {
>>     enum hardware_error hw_err;
>>
>> +    if (fault_inject_csc_hw_error())
>> +        schedule_work(&tile->csc_hw_error_work);
>> +
>>     for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>>         if (master_ctl & ERROR_IRQ(hw_err))
>>             hw_error_source_handler(tile, hw_err);
>> -- 
>> 2.47.1
>>

