Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B74EC5473F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 22:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF6B10E423;
	Tue, 27 Aug 2024 22:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUzLs07U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FDA10E423
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 22:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724797632; x=1756333632;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=atkLcGZXV0pLjTuWIZtKkiGHbFKbuB2KMFgNsnmwxJw=;
 b=IUzLs07UaZnfRuyHyIlxM5y2wjhgZH3Z/UoecoT9BrbTbibk0VddvIU8
 hs43M5XPSutgGOQh7NUAncoSVLwZPjeKeqt2FI77/ZXCQdrrEj6P1FtfO
 DqPZIe6DvyyCx61gBjhrqUnjqnufQRy50C8C/hmar+JsYb19DClZ4NlOv
 F/Jw8LwjbXPXqDB8hs1ddCWMo4+s1sx+xQuYr0j44X3S6sFobbNeZkx33
 FZk1FyxmbivplE4EKwWz0nr0px5HF8m2jHkFy7MilNtg8ggVvNCRhNKoT
 NeepHRAG/3Tp7hQibG8ANwVUNTw7lf3KOQQME4GIL9y4PVf8leJHbkme4 A==;
X-CSE-ConnectionGUID: pbQ37Z8uQUuq6PntJsW0vA==
X-CSE-MsgGUID: FwDpxq7QQzClOS60fOiXcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48687604"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="48687604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 15:27:12 -0700
X-CSE-ConnectionGUID: oPC6d7rMRXOYZ9F3qwc8jg==
X-CSE-MsgGUID: WI2oV83gRfyEvWBVL+NAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67380139"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 15:27:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 15:27:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 15:27:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 15:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCF6CMvfs0XDvAhtgBgu462f3fo07rTHa2uzsFCbdpILlSbM7uma2bF2nkNCvHDMMoMSXKn7rzKcI+SYtNr9NhHZGs+NQAX7qL7FY3kJUfv7oSo4PwnqiQDd6cZ8M15JzhW1Kro6iHlQ3GoFDq188iwdDj9EdntlM6YjkC1bKPKwY/IT8Tn2s5g84JpGyK4iGk4lo26Ibru60kaeWUZF1HEZ5TWOD55+b6ZHL7KooAXLk5CoshIEbsxnImTbFNzyD/dnckiJl5DJfGy7XVnbs12FHeHQT7uKJklkhUMefHB3ZesewdbWfDBHVUQwd8LXnE4ihS7EHwxfALRI2y2d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbqSm46nN4g5/lLcWXyIpxu0AJQgEksOaLxW6eJntJk=;
 b=PMv4JsFNqs5ZNyGZ3tBEhoo6LaeuV8B0T4LYsrWYpp9V8nbAqtmPa/7X97d5B8T0Uo1+DU7iqvXYL9degaiU1EWzDJ6tAYysrwA2aZn67AUMGS0mI8Wn2PPntnwrw7VpP7XGbPYHD+ne9IwEUuLBXBkr11eQf7U3RWoyozilqhOeAJ5wt9xEGR1MHQpz59nl4FjTcoTCSdCGqnrsVccoPPP+LAx6Squ9WcoiS1jKStuD2a5OLxewSaCsOm1vZiP3frpZPHejkkZkz79MSbywcex4ZpHuYYW5Y2mfGm0IgLAzdkCD2kpbezClzZ1d+suyP6MlQThhtKkHvFFpisxhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 27 Aug
 2024 22:27:08 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 22:27:08 +0000
Message-ID: <9e3c7cea-630f-4734-b4a2-eaf0ad0ffa8a@intel.com>
Date: Tue, 27 Aug 2024 18:27:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
 <20240820021142.436536-4-zhanjun.dong@intel.com>
 <4f6c36b5eea377391e2071fe610644cef1dc58a6.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <4f6c36b5eea377391e2071fe610644cef1dc58a6.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ff5f5b-1b7f-4ed6-f1fc-08dcc6e762ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG44UUhOaFpXSGcwa3djcHdEalBrY1B4cEpxTTdxUmdhbVlGeUZmcUVPNW1w?=
 =?utf-8?B?blM4dGVNQ0FpRlVqa0ovUGZHQ1J0QkxBM2djOGhwU2Q3aE16Z3ZFRDJUMlZL?=
 =?utf-8?B?Ly9NR2VTcXFDcFRPbWxtSjdTcUQ0VFlYdXdMaVhZbG42dFIxc01ISGMxTGtW?=
 =?utf-8?B?QUxTRm5CdXhMRFQyWEoyK0pDZEFDdlF2MnU5N0JJSWhySlpiZXpiZUk1N0p0?=
 =?utf-8?B?bFNaTzFNeEdkSjNuVzgrN05wS0g2RXN2dU1zblRyK1JzYzhYaXk3Tkpsbncv?=
 =?utf-8?B?SEM1aG52V2theTZrODR0em9XZERYRmFnUUY1NkZBN3BQNTRoa3NZcExhZ0c3?=
 =?utf-8?B?OVlDZlpVMnMxZEY1OW03aEV6Qkw4ZDBGcUtwbm4zaUhZeWxtc3MxMEI0NUNB?=
 =?utf-8?B?SmpwV1A1ZjhEQ01ZMmZ5ZTh0RDdrbGU4SjFiWmZyRVpGdDI5dEhKT2VXU1gv?=
 =?utf-8?B?L3YzRStTaTIxRnNTRHhmNXYvcS9hVUx3bXVmZ3hLcHp6enJFRnlCR29NMHZV?=
 =?utf-8?B?SWZka1VHUlJuWFNWcWpuTEJnUkZ5Uy9SNmNucTZQWm1aWngwMi9TSUdGOS9h?=
 =?utf-8?B?elU0WGNZV3laVEV3ZkdLemRTNGk1cmVRSUcvRnNWbkJRYjdPa1NOVnFFbnVn?=
 =?utf-8?B?M3V6NGtCdU4wNVc3YWlMMlp3aDl3ZTU0OHo1OVlkSTVxbGlKK2Q3YUJ2K2VG?=
 =?utf-8?B?VnRDNEdsVGtkazVzWVlxUmNIUDBCMFV4ZkNpZVRvTS9kQkkrcDJXcjBqNThC?=
 =?utf-8?B?eVJENHRwNnNmM2pXVE8yN011SURvaEFtL2NrWEdQQ0FkaXRPMWdUNm1xU0xG?=
 =?utf-8?B?OENIbXV4ME9oZnB1U21OdlFScy9Zbng0SFBpYlVOVzkwa2ltUXM3bDA5cUFN?=
 =?utf-8?B?dTEzUWp4V0ZtNUQrVlVwRERCMVhYOW43SDVDUWdYV2JsZEh5SFJTRDJ2MDhj?=
 =?utf-8?B?VXNLQmV6RC85MkQ1TFh1bkZSSlVGQk54ZzZzQzhPNW9ZcFVnakFoMzJRQzc2?=
 =?utf-8?B?RmRFRzFRcFdBVEZTYUdHM2tiLzc2VDhXckttTDRqMStveUlGSjFYTXQ3bXM2?=
 =?utf-8?B?NisxU0xQSm1KR3lzNjNHRm1Jb2RBRXl4czVMVUVyTGgvc3JDeC90bmN6NzNQ?=
 =?utf-8?B?OVVKVHE1OHk1WC8wbmtsZzJPZjY4SWZ1RTluWkhJSVVDL2ROM2xyc2phVW1U?=
 =?utf-8?B?a3dCVFphWk9OTlFuTm5kSE9tKzJtcWdCTStnVkc2cnRaQ3lZWU1yQXU2S2Rw?=
 =?utf-8?B?Qk91Y0EreXRadVNURllTcUNWVFlpV1FOa3h5U3Zwbk5FQ2xHYWtlT3NSRlEz?=
 =?utf-8?B?ZnhRdGtZTEJOOER1bGsyZi9JVWY5UzJ5ZW96eDRnaFhlTm5reUN1SlpISGhi?=
 =?utf-8?B?SFVNNWptckkzVzBGajNaK0cvNVBCYWR2QVRleTRMVGlFcHhPdTNLZTlLSDRR?=
 =?utf-8?B?aUtPWTE4U2p0VVlWOHhmTXROeHQvaWZzS0p3UTF6dkdsamVnSFgxWTJpajZ4?=
 =?utf-8?B?c3doYWl6bURpcDRwQnNFa3g4dHdyUFlVTmpYREIwazNjU29kTC9IakRzL1JW?=
 =?utf-8?B?cXJsZ3lUM1lRazRyZTFobThUNk5NcnBxZ0lLT1VqY3dUUUk0bWRJTVEyUFlT?=
 =?utf-8?B?aGRHc3VYemtwWjd4OFBIc0dpYXlNMDBzQy9heXpUSnpKSnFRK0xOYy9zK3VT?=
 =?utf-8?B?YjUxNFlwY2lBTFVpejFQSnZ1RklsaUJVVWpFWEthbzk4QUlWNjFsZVNud0Yx?=
 =?utf-8?B?bGtjNHNxcUhVZjlGY3hGQjVWYmxFQ25kaXUyZnVIcEJsaFE0VnJGUEJ1cjly?=
 =?utf-8?B?amdDdElQRUtWTU5QRUN5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1FsTzN5bVdjN05xMXV6WkNzQ0c4RndiQTV5RVF2QkVxejRLTWxVUzM2NHZU?=
 =?utf-8?B?M01EdUZ2WjhzOUp1QlQvLzcxMHpvN25EaG9SSFBiRStwNWNQSmRLVnFNcmtI?=
 =?utf-8?B?MW0rb0hIRkNRd2JJQXNkT3dqNmpmM2lNdVc2blhRTC9OYk5BS0REUVlpa2V4?=
 =?utf-8?B?MU9pMSt5UExSRllZSkpCdmowQjRyc0tjVHgrK3VVcXJNbnVFVTlOTDF1OXFo?=
 =?utf-8?B?TDBxWFArUEYreWpBckZUSkxKYmQvSGJzUlVLb2N0WmFHaW5wWXNyMjBrWjFi?=
 =?utf-8?B?SHJuS0NjREdCR010SWtpT3h2aVE3S21zRmdXYis1UExLVHNQWEd5NDk3a0xY?=
 =?utf-8?B?UG5rM01ZOVpTNndTUitpZDFEUzdtQjJwaDZYNzY5YlNkbVpzS0RXelluUUQw?=
 =?utf-8?B?N05JUXFKZjNOYlBadExzWEsyVmJUNnc4SjhxbHJjaVBZcEJCWVVybkpXMVFy?=
 =?utf-8?B?NS9Ybk1KS0VTbnVxZVJ1QjZkSXUwWFc3R3laNVlSOXFvSVFiMmlSSjJrbDVn?=
 =?utf-8?B?eXo3Y3VrRzgxeExveG9ObDM4VEpFWnd1M3IzRjNDRWtPQlF1a3BhbENUOEJO?=
 =?utf-8?B?cW0wdHM2MkZQdEdCRHNnSFNDSVVDUWpoRzlKTVpvQnZBdWwxdGt5NFBCb2pM?=
 =?utf-8?B?RG1hSjBrZklpYWR2a3dVWHZTUnJPR1d6RUUyT09POW9JTTAwK0VseHRpeXBO?=
 =?utf-8?B?OEN5Yjd2aklYZmo3cmMzY0diMDdGTFd4RFZXcGlTNWRQQnNpcHdiWUZFZFkx?=
 =?utf-8?B?ai9MRVhnVmMvWFdOa2FjaE5qM1FDWlc0RkJkSDF6ZnM4RHJRU3ZDbnB1U3h5?=
 =?utf-8?B?cnZwd3I5NmtiUTdVQmhKLy9LdWZDaFR1WFNIU0JlWWNYdmhFdFQrc0lxN250?=
 =?utf-8?B?NWtuQmZpRDdOVk5wRTlmekgyamUxK3dFOWtKWWErMEJWYk9JeEhJamxHbUty?=
 =?utf-8?B?cGhJZnRvdUdYNnVLYjB3R0xBZWN5SnkvQVFjUGFwWENiZSs0cTUwbWlieURJ?=
 =?utf-8?B?VmVjVFNGbHgzZmtHYTNpVnlObkg3SW9ETTl0TitaajZPSFhxUnRsTTFIcWtn?=
 =?utf-8?B?aTJzSDJqVlhKTm1CbzIrSENodFUrbXFrdmYwcURoMTZBb05oTy83d3dkYnN2?=
 =?utf-8?B?aFRVayt5ckRGMzVaeTRuV2diV2dSTkE1SFV2NjNRcWszak05Y3V3QU4zV0xu?=
 =?utf-8?B?QWZGS2FrM09GdG9DODZrdjU3WnBwM2Znb2F3MUd1RU41YWhLb1paM3J0anB2?=
 =?utf-8?B?WjB5aHNNZU9SeStNSUpRRlQyMFJlWkt3VldrUG41MkJGeHFIK0lBbWxsdy9X?=
 =?utf-8?B?a09HdlI2RWlyTmJxSDFZS3BEYkxyakhQdVBRTUZLUkZOZG1XU3YxZUxWU2x3?=
 =?utf-8?B?Zm9jSlBVaVFETjFLR21rc1RiM1ZuRkhtNC9laitldWZpYlh1cldxUVViQmYw?=
 =?utf-8?B?LzFRaXg2cTdPd0F1ak5GVy91eFJTUG9FblpadGhkZlJuMi9lL2lRSGkwQ0FO?=
 =?utf-8?B?VzJ4SzVmZUxPUUFVdlJZTVNWbzNxZHozVWlxY05aWE5KU3JZUnJHRE52cU15?=
 =?utf-8?B?TEduOVJxSmF0a0xKNHNMbU5qRHJXZnR2cHBlRUhqOXJGSFBwNk5EWm5iRWNC?=
 =?utf-8?B?Ri9OQmpBaThlWFJCZi9Fb081UnJjZnRBZXRBQjRxWnZURTRlRHE0WHRJcVdm?=
 =?utf-8?B?VytMYVVDeWZkeW9lMWpCcnJWdDVGbSsrZERsZFNkb0VJb0lIdDdtYmVzT0NT?=
 =?utf-8?B?S0JqQ05YZjJpeDFaOTk0ZFcwZWxyRDllbCtlWUVDaCtSYkR5cUF6R2tIMFI4?=
 =?utf-8?B?ZE5iTytZNHZtM3NxOFVvMVR5YzBTSCtHbnFvcWZJMWZaejVsZGlodCtZWmU4?=
 =?utf-8?B?ODJkREZPN3dwejRRTGFnSTBrN0JscnZoWENlWVVHZEFHSEd3TW9jUUc2VkJD?=
 =?utf-8?B?VzVvdTh2ekxDdXpFU2paZzV4Z1MxU29HYUtnUlo1UDNNcnVTbzhnejZuV2Q0?=
 =?utf-8?B?dzFpd1Z0M1NoYTgvbGpJZnptRVFPbm1TSGd5R1orRmZJYkV1dnpueWNNOXBp?=
 =?utf-8?B?VXRKdHhLU0YvU09FcTBRblI5TDEwRzVOemxGeXp4NHNSd0tabE40SCs3VXVM?=
 =?utf-8?Q?F38AaDcvJWd8ApLRl/a7wm6ko?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ff5f5b-1b7f-4ed6-f1fc-08dcc6e762ed
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 22:27:08.0779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIVa3ZT05Mpo+DFQZBiRyxdikdJByLWekXVleIPIzDDS2a0Uho0VdJL/rnR1sLbXDAKb9LdOD6Y5ulwY+72pYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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



On 2024-08-27 6:02 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2024-08-19 at 19:11 -0700, Zhanjun Dong wrote:
>> Capture-nodes generated by GuC are placed in the GuC capture ring
>> buffer which is a sub-region of the larger Guc-Log-buffer.
>> Add capture output size check before allocating the shared buffer.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>
> alan:snip
> 
>> +static int guc_capture_output_size_est(struct xe_guc *guc)
>> +{
>> +       struct xe_gt *gt = guc_to_gt(guc);
>> +       struct xe_hw_engine *hwe;
>> +       enum xe_hw_engine_id id;
>> +
>> +       int capture_size = 0;
>> +       size_t tmp = 0;
>> +
>> +       if (!guc->capture)
>> +               return -ENODEV;
>> +
>> +       /*
>> +        * If every single engine-instance suffered a failure in quick succession but
>> +        * were all unrelated, then a burst of multiple error-capture events would dump
>> +        * registers for every one engine instance, one at a time. In this case, GuC
>> +        * would even dump the global-registers repeatedly.
>> +        *
>> +        * For each engine instance, there would be 1 x guc_state_capture_group_t output
>> +        * followed by 3 x guc_state_capture_t lists. The latter is how the register
>> +        * dumps are split across different register types (where the '3' are global vs class
>> +        * vs instance).
>> +        */
>> +       for_each_hw_engine(hwe, gt, id) {
>> +               enum guc_capture_list_class_type capture_class;
>> +
>> +               capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>> +               capture_size += sizeof(struct guc_state_capture_group_header_t) +
>> +                                        (3 * sizeof(struct guc_state_capture_header_t));
>> +
>> +               if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_GLOBAL,
>> +                                            0, &tmp, true))
>> +                       capture_size += tmp;
>> +               if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>> +                                            capture_class, &tmp, true))
>> +                       capture_size += tmp;
>> +               /* Estimate steering register size for rcs/ccs */
>> +               if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>> +                       int total = guc_capture_get_steer_reg_num(guc_to_xe(guc)) *
>> +                                   XE_MAX_DSS_FUSE_BITS;
>> +
>> +                       capture_size += PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
>> +                                                  (total * sizeof(struct guc_mmio_reg)));
>> +               }
> alan: as per the review-conf-call last week, lets remove any traces of "steering register
> size rules" from outside the guc_capture_getlistsize. As we know there are only 2 conditions
> where we guc_capture_getlistsize can cause different results - one is when its called early
> before pre-hwconfig and again if its called later after post-hwconfig. In both cases,
> it doesn't matter who is making the call or the callstack, it will either need to
> return (at pre-hwconfig) the worst-case scenario where real-dss-masks were not yet available
> and we use max-dss ... or (at post-hwconfig), where we can caclculate using real-dss-masks
> and then get the valid value. That way, we don't need to care about "educating" other functions
> about the differentiation between real-dss-masks being available or not, lets just always
> ensure that the guc_capture_getlistsize always does this implicit decision for us so we dont
> have to replicate such code in multiple place such as xe_guc_capture_ads_input_worst_size.
> 
> alan: actually just before hitting send button, i see you've addressed this in v17 (cleaning
> both this code and the xe_guc_capture_ads_input_worst_size to remove this. I will drop further
> review of v16 now and move to v17 or v18 if u wanna address those v16-nits i posted just now
> quickly.

Yes, it was addressed in v17 as we discussed.
There is no v18 planned to be send out today, please start review v17.

>> +               if (!guc_capture_getlistsize(guc, 0, GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE,
>> +                                            capture_class, &tmp, true))
>> +                       capture_size += tmp;
>> +       }
>> +
>> +       return capture_size;
>> +}
>> +
>> +/*
>> + * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
>> + * before the Xe can read the data out and process it
>> + */
>> +#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
>> +
>> +static void check_guc_capture_size(struct xe_guc *guc)
>> +{
>> +       int capture_size = guc_capture_output_size_est(guc);
>> +       int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>> +       u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>> +
>> +       /*
>> +        * NOTE: capture_size is much smaller than the capture region
>> +        * allocation (DG2: <80K vs 1MB).
>> +        * Additionally, its based on space needed to fit all engines getting
>> +        * reset at once within the same G2H handler task slot. This is very
>> +        * unlikely. However, if GuC really does run out of space for whatever
>> +        * reason, we will see an separate warning message when processing the
>> +        * G2H event capture-notification, search for:
>> +        * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
>> +        */
>> +       if (capture_size < 0)
>> +               xe_gt_dbg(guc_to_gt(guc),
>> +                         "Failed to calculate error state capture buffer minimum size: %d!\n",
>> +                         capture_size);
>> +       if (capture_size > buffer_size)
>> +               xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
>> +                         buffer_size, capture_size);
>> +       else if (spare_size > buffer_size)
>> +               xe_gt_dbg(guc_to_gt(guc),
>> +                         "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
>> +                         buffer_size, spare_size, capture_size);
>> +}
>> +
>>   /*
>>    * xe_guc_capture_steered_list_init - Init steering register list
>>    * @guc: The GuC object
>> @@ -657,11 +745,12 @@ int xe_guc_capture_steered_list_init(struct xe_guc *guc)
>>           * the end of the pre-populated render list.
>>           */
>>          guc_capture_alloc_steered_lists(guc);
>> +       check_guc_capture_size(guc);
>>   
>>          return 0;
>>   }
>>   
>> -/**
>> +/*
>>    * xe_guc_capture_init - Init for GuC register capture
>>    * @guc: The GuC object
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..d6b5ac522b6c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -96,3 +96,68 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>          return 0;
>>   }
>> +
>> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> +{
>> +       return CRASH_BUFFER_SIZE;
>> +}
>> +
>> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> +{
>> +       return DEBUG_BUFFER_SIZE;
>> +}
>> +
>> +/**
>> + * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
>> + * @log: The log object.
>> + *
>> + * This function will return the capture buffer size within log sections.
>> + *
>> + * Return: capture buffer size.
>> + */
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> +{
>> +       return CAPTURE_BUFFER_SIZE;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * Return: buffer size.
>> + */
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       switch (type) {
>> +       case GUC_LOG_BUFFER_CRASH_DUMP:
>> +               return xe_guc_log_section_size_crash(log);
>> +       case GUC_LOG_BUFFER_DEBUG:
>> +               return xe_guc_log_section_size_debug(log);
>> +       case GUC_LOG_BUFFER_CAPTURE:
>> +               return xe_guc_log_section_size_capture(log);
>> +       }
>> +       return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * This function will return the offset in the log buffer for a type.
>> + * Return: buffer offset.
>> + */
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       enum guc_log_buffer_type i;
>> +       u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +
>> +       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +               if (i == type)
>> +                       break;
>> +               offset += xe_guc_get_log_buffer_size(log, i);
>> +       }
>> +
>> +       return offset;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..87ecd1814854 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "abi/guc_log_abi.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE      SZ_8K
>>   #define DEBUG_BUFFER_SIZE      SZ_64K
>> -#define CAPTURE_BUFFER_SIZE    SZ_16K
>> +#define CAPTURE_BUFFER_SIZE    SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -45,4 +46,8 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>          return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +
>>   #endif
> 
