Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616A4D2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 08:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2549910E57D;
	Tue, 20 Jan 2026 08:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMa/E1b0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563310E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768897835; x=1800433835;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FcHLHG6EiypS+d3web3Nb5FLV3FYk+JZCTJYtmXf/xo=;
 b=NMa/E1b0C/eLuzk9p2l2KDifwSB+fEURJRP7SfGNUzmb4JboXuEGnUWy
 nJxk2AFvJvOGCd4nnNoIQTyFgc6tu7sNeRq15doKTPJ+29u6M/q3C4sD+
 44prcjvSSywavSwWjEeLIGo+ExZo4PDOBGuZ2syHqbuYa/AVoZ4/rUJyb
 nQbqz4t3g3KZHVA0Rn0rlfS2g3xGM4bp353z/g8EAU9KE4nk8+ItKqbaF
 OzZZuCEH7GpnyyLhx0aupeA9A1SaEvZnrLM+DNfwyfrFYhZgs28PWv7ea
 pUzTzLiNsx2hyWgWsktVlPQawSSac767tcQ2mYouTXf7ekF5AlQEKCE4c A==;
X-CSE-ConnectionGUID: YP9MeDTXTQy5k6/1BbcYag==
X-CSE-MsgGUID: c4p1N0t/TsWo6dnz6kO/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73967143"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73967143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:30:34 -0800
X-CSE-ConnectionGUID: BFAaYFIlQuak6UTi4+f8pA==
X-CSE-MsgGUID: EKuwyAECRvOtU8LSnkZRkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206110418"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:30:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:30:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 00:30:33 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlOpeyFYmU39rYNnw1GcFFlvRD4kgNtaf41bFYsvf3uAQqWskf1KlWqDmA4XjLwzMkmd0Y8HApqs4qKIGDtMdAjVrRrtVIrsv+elkbgt4z8UErATVsNeH4ZLvENr1O9TsRvk+5Sfszsk/PFx10Vc/365CqLsjyadxC8fxTr1/cWzPgTqaDSg6jhsN6mBih83NGuk2BEQSLx4XjDn62vw3HDLQB3QNERgjRwZ/fWu0KHRPG6kxHywT4QT2xZuQriKNXDRCJl9YS6BbwlXrv9w0IbWwovB7J0zmabSelcEg7DPqt6lbpx8asoFnaidUDBWdJpwj5IgywyaWWAIAEXXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Twoy/kB8ck2pEk58JyY3sl6MJ9oggZ14XQK3SGJArzM=;
 b=kaSZnf3pIdrk0itVvYHvZJhv3KIQpI2ZOtmi2MFhKnuxdDJv2EE/6Y/f050HO7onq09OF/klZF7FZsDHHVCe3BWHpXobLGL62Kcu98RP7GkK8ZnfgTotl93SfTQAqAnLLYDWTkxjrOK3IlzTevI6cHpzHrBh2QRdPzKu5+0BC04FJjdPyNmJFK0M4BgDVpxII+ytpsBClBSFBBtPxnQlJlXywy7Yt6/x9bjb7AlbSX3hWVdiSajVgRxfiJTrq97xAqES846BGTnrgNdLAoKuTgqgPgKxVSc2EP42Jt0wPDwCL1saTnMsH/4WXpFtHVt97MPqLe03NuP37FcqOr4yZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:30:26 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:30:26 +0000
Message-ID: <53ed39da-58cb-473b-8510-da6bb4e4cf21@intel.com>
Date: Tue, 20 Jan 2026 14:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,2/4] drm/xe/sysctrl: Add system controller interrupt handler
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <soham.purkait@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260116093432.914040-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260116093432.914040-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPFD667CEBB6:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f23a63b-557d-4775-b6a3-08de57fe293f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTRabWdMTDVyYjJEWGtJM29pSWpQbHJ4K3V3SVZUUVJIWUxBYVFwNzZ5WStv?=
 =?utf-8?B?c2dMdUpPT1hhdmN2b213Z294RXVnQzh1Y2k4QU80Wml3UWE3VGdDU3FVa2ps?=
 =?utf-8?B?TUpmV2xxbDNnc25NdmtzQmxBS09jdU9zYTcrdEoycjNTbHdYLzlrYzRjNytB?=
 =?utf-8?B?M2o5dFIxN25DbEgxb0dJbHBNaDVML2l5Z2NqTWxsbFgyelFiS3h6Y1d5eERo?=
 =?utf-8?B?WWNiMHMwUlY0a2I2d3pTQ2krbG1VdUx4TndNSmphT0puZjZScnlhQVRDczd2?=
 =?utf-8?B?cTdkZTBrKzk2WjFDRWhNNjBxZGMrL0F1SGJpQmpCcXVIUjQ0S2lML1FmYU80?=
 =?utf-8?B?OGlCNlUzY09yaHNVT25pYTYzQjZyVE10SUEwQzlCa3VvQ0l3ZXdCL2hpaDFm?=
 =?utf-8?B?Vy9CZWlGYjE5amdHYzJqQ3p0MVZNdW4rU1RUNTd2dEF6S2taVnl4ZDFKb0pu?=
 =?utf-8?B?WEN2WXdFQWppcXB2TFJCdVdIU3pDdjE3TXVoTXI3ZTUrOVFISVlwcWZML1pj?=
 =?utf-8?B?TDY2ekF1bU4zOEkzZmNGUHEyRnhoOERsSStPQ0YrZ0RIRytodG1sVWp1cVpp?=
 =?utf-8?B?djVxVlBKc0xuUTZsRzBMRXNuZEZwZWRTeTdHNDVnZHQ3NjNjaHcxejNGd05Z?=
 =?utf-8?B?QzBDME1GaXZyRlNRS3ZHbDBsSk1XUVk0NUpMWnFGKzRqR2g2ZDErdTBZQU1I?=
 =?utf-8?B?cWI4Z1lHL1A3R1BnVS91bFRxSHI2eGxLWjNuL3ZSdFNianlseUYvYlB1czYy?=
 =?utf-8?B?bnlFd3JTbVgvT0lJTWxPTWxxSUh1d09tamZsTTdlRExOT1ZQZGl1VEpiVUtF?=
 =?utf-8?B?ZWp5V1V1dTA3STA4bU9mYUxEU2tzWStDRGhhbUpuMHd1bWNyc21RT0c2aG5z?=
 =?utf-8?B?eDRzeHRNRmNJcFhnV2YxWnVKd0ZlZ2hJdzNFOFNhRlVaRnVhSDJZbEN2TGVw?=
 =?utf-8?B?OHI4cjRCYjdSV2NQUFAyWnphTGlrREdRYSt0Y2E3SjBKRG5yU21rT1NTZDdQ?=
 =?utf-8?B?a1RCZ0hCbjNrbVo3VEJHRFA0eXIzQjlYejVuK2J0QVE0Z0J4SEtGdTRXRlZK?=
 =?utf-8?B?K0liMS8xVVhZY2VsQ0dHcTdZZVZEN0NTY2JrSW9jQkxQU3VXTG9oTDlCRkcv?=
 =?utf-8?B?NkFPbXVVZFJLVm9CL0FBbE9jRkR3ZFJpNHpGcno4cnc3blBaK3dkNjlxNXJ3?=
 =?utf-8?B?dE9aK0swdEY2WTM5M0kzRGNVT3YwRW02ZGxqVTdUYkt2QXhmckhrRFZDWnZF?=
 =?utf-8?B?WDFBZE9TTjRJT1ZIY2R1ZFJqUHJOaGp1bFF2ditTRmdzeDMwdTlNVnkwZ3lF?=
 =?utf-8?B?MVg5MW5XTDNUM1R3V0R4QzZBUlRDeGZjVUpZNDFxMDF2Sm9aaDBMcVBVQVhW?=
 =?utf-8?B?d1RUNHU1RG9aTXY3dm84cCs4dFpFNGpRc0ZZUjg0MFN1S2FIdVhRakhhNmdI?=
 =?utf-8?B?czJDUWhPejhlSHcwRjl3VWF6b2orRitnR2xONkFGbzNCaDYzZGxvQU1QMFJt?=
 =?utf-8?B?UUpIUWRIQ2J1bWZ4WWJqckcvdFl2bEFEemptTUdHaW51N3QrUGpjZ3VJd3FR?=
 =?utf-8?B?Z3V1YXY5Nm0wS3dnZ2NsTm9SRU9kTlZOUzFWaWowdjlYQkdhNnFoVllxU3ZU?=
 =?utf-8?B?VHU3TnlLUXBUU25oeFZlN01lZGFWbC9OYklMQ1RJQ1o1Mmh5VjNHL0ZCN3Iv?=
 =?utf-8?B?TVkwMTd5N0VoUFlZR0tTRHd4MFNmSktFeE5zOVhjZ3VTR2ovcjNlYVphNzVS?=
 =?utf-8?B?MlV2NlN4SlJyUHBvWHpIa0p4M0ZhTnhidExaSWh0QVQ4OXlVNDBwemRJWnVt?=
 =?utf-8?B?RzgvUnlnR244WDRmZ1g4ZUgxaGJHenFJTmU4eUxVY0FzWFlxUG0xeFNqa1Vm?=
 =?utf-8?B?TUZKOUF0SmNXQ3BROWdwcnhQNUViK3JtbDZsWHVqTFNIcGNYNW9YVy83UkVz?=
 =?utf-8?B?QXlBaTRYT0l3Q3cxTmNLY3BjaVZHWFE1S1dsTkNsK3o2QTZaUTJWUVdBaWZs?=
 =?utf-8?B?aHZtVkxKbXJqL3FmSlZ2MzRSd2lSbEkxamtrZkNuZUtlZlNqZU5WeTBadVo2?=
 =?utf-8?B?ZisxTXZKak9WSFQ1Z3BWTytNU1pxSXBXNnhhc2FxMllrS1RMKzV4RnhXWG9K?=
 =?utf-8?Q?NUWI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejgwYTMzSUFReDBTaWwxb3Fkb0pOc2VJZnkvNlVVRGYzVUZoT1FYR1JmdVdC?=
 =?utf-8?B?TzFhWW1jMFMySGNDYUJ2ZmdmUURkSUhyK0VIYkN5eXJYUHFJaHRrdDdyWFlm?=
 =?utf-8?B?MWpKV1B3b1J3Z2N2cmdxM24zbEpOcjIvVnFkZ1p0ZWFheFgzM21qUDk2OEFP?=
 =?utf-8?B?dHFoRnNVMTBKaXlPYmRoV1kxZWU4bnByN1UxK2pSeGdMRFh2TTh0TU1vUytZ?=
 =?utf-8?B?Ukg3Q0toQllNZFVUck1PL0hzNmg3Sm1DNDNtZlE3VjVMRkRsOWpqeWZXMkVT?=
 =?utf-8?B?bHdjM05CSER5N3BEYlcrYkFQRkJ5bEx2L1BvdElNcVJGdlBKRmVESFZuV010?=
 =?utf-8?B?cm5LaHJXem9oU1QycEFrQ08rUXpOcUUrNjZyWTBYUXVmci9laW5QbkZBTGt5?=
 =?utf-8?B?MjJZeFY3TDJiUDdKc3p1L3F1T0paRTNESVJCN3VNVjJvWEdaYitRd24yWDly?=
 =?utf-8?B?Y3pNbjVkb0tuNzY1QkkrVXJGN0ZZcExDQUE1R3loVUxtR1BLTHVlZG1aOWhh?=
 =?utf-8?B?Z1BkQnFQWkFlTVMrWng1b1JBUmwxSlM2RTNUd3lIUHVsRVp2cG43UEQ5SFNv?=
 =?utf-8?B?ZEVxbktXWkgyVnRaOXNhY3ltN1FHMnBzenVCMXp3azRJeDhCNXhNODdhSmdn?=
 =?utf-8?B?Q1VyaUt2anV6cm9sbFZvSjQ2SHVDcUJpN3ZOcW5wWjI4RTBEeUdyVXdxeTRC?=
 =?utf-8?B?RUxsNnJLOUZMeUxCNjNCQWQvdU1paENZUE03cmx1WTNqN1MrQk9aZjJUNzRn?=
 =?utf-8?B?NDVmdHFGWXB0VW43OUpKdWhNeHNSMEkvVE90N2dXc0NBR2svU2hLcGtYbXdC?=
 =?utf-8?B?RWZFSzBWaFNJL013VXFTNnFFVkxaZXp3NyszUllvY3dHWmI1Vi8zMFF4R2ds?=
 =?utf-8?B?RTNXYTZlRzJySmMvZXc3UlRFU2dpbmFzSXNHUWp4aUF2KzJFNHJZaFJmU0Ru?=
 =?utf-8?B?OVc3NmtHSkIzRTM3Uzg1c0xYQy9lcnkvZGZjNnE1cGNVLzIvQS9JSGtmcVFs?=
 =?utf-8?B?dVZzWFNqVHNmREo2TTBMOTIxc0NwdThQSkNnM0J5anhDOWJKcUp2Q2Y1RTky?=
 =?utf-8?B?dys1ZHFRVFRGL1plbEJ1ZkFDeVBZTTNFY0JOT2lBa1Rmb1o2dG9aQUlXeVho?=
 =?utf-8?B?YmY2eU5YbVVzeC9zVnU2akI0b3I2Y1cvT2JGNURyQmlNbDZ1bzk1eW9VTmdr?=
 =?utf-8?B?ZHVuTHo4T0tXclJlUGRlaHF3SUpSK01NdGhJN2t5SVY3YkFSK0RvMGtmZm4w?=
 =?utf-8?B?enJhcnd3YjUxSXhqRHZEVURvbjNNeXdnTkpaUGovTFlwUG03R3BMM2xaL3pv?=
 =?utf-8?B?cDZ6ajZLc2FvWVQxRHNPMWs5ZGlrTTMvT2VSaXJHQWl2SkN4dGJEdC9vendH?=
 =?utf-8?B?aE9LVFlMUlQ4V0crYUU5bG9aN0FNTGNwMExjWVM5NkNvOGtNWjBVZU5QQS8z?=
 =?utf-8?B?ZXVSVWkvNEptdXNCTmZGWFlOc1FhdlJkZEdHa1dENXVaQTU0VjBtSGV4Zklk?=
 =?utf-8?B?bnN1MWJaLzlIUTBEa1grZFI1UEVzWFR0M2YwSWRZSlhZVDNJQ0R1Y2RSeFRB?=
 =?utf-8?B?RVNsbFg0dFRiRzBTa0RxM295YWZOdjYycHpTYTJ4VFZpbnhRSzhkaTI4OUJM?=
 =?utf-8?B?b2NqT3ZIeEVyTDZSN01aQ3Y4UjJHMnU2K2dydHJNUHBrYzJUblZuZXBCNThh?=
 =?utf-8?B?amtKU3dTSmlqY0x4K3grdGpTanh0Q1N2RXlNSVdMTElXeHl4enR3eDRqbXlZ?=
 =?utf-8?B?V1BpemEzL2QvZXVjekYrb3kxL2dQaXBwWklvc0NwRWJkL05iQVBIc3VHOVdC?=
 =?utf-8?B?bnNZTEd3OHZTTU1wOGVUK3d4R2hnU1Y5S05iRmpiMkcyblZvTlhFaHhLVWtU?=
 =?utf-8?B?MWlENTZ6emp1YVlCWFoxUDd6ZTAvMzIrVWVYN1lTaC9Oc0QvMHIxVGZwRit3?=
 =?utf-8?B?OVRLYVlTek5SNzJ5S0dIbkNuWkhzeVhwSWdBTitDRWhUbHIvM3lVOFBLN0Rw?=
 =?utf-8?B?QzNSekZxSkpVWWVkOHptRTJNZ2xBYXB0eloyQ0xUb1FYcGozQmVpVmdOc2xW?=
 =?utf-8?B?Q1JGcjhMSmdvenVPQ05wdVIvNzd2b01IQ1puL0wxT2lKT3V4UFhMZ2czL0Ri?=
 =?utf-8?B?MW9Bc1lCbnJLM1pUVkhrZ0x6RGdmSCtOcTc3dnRKVHJmQldFQituTFYrTm0z?=
 =?utf-8?B?SFJQSk1Sb3hnTjV2ZWhUVEtNdzZQS1Q3RkQ4M2k4V0tCOEpQMExyeUdsa0Q1?=
 =?utf-8?B?dGY4UlRBZXNJQ0NrdTJlZ3ZLUEI5VFZNS1MydENVdFRraWl3YldkME9OaThW?=
 =?utf-8?B?K0lDdXlSVFNKTmtyc2sxZEYvUFRMMjA2UThrN3RrZy9ZMjB5amRJZVJUUDdz?=
 =?utf-8?Q?ZhJLOLxcCcJgYIcw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f23a63b-557d-4775-b6a3-08de57fe293f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:30:26.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8r8bBcxObbnHKpxgGbRoOIiaHvSHDWVM/lK0hOM6iyYNUeoQQ1woZyVbFmlGtU/SKDijJzv1QTnnC/5wbafv0AIt5/6l39PmM1X6HNlPjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD667CEBB6
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

Hi Raag,

On 16-01-2026 03:03 pm, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add ordered workqueue for
> scheduling system controller work.
>
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>   5 files changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>   #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7560a45f7f64..9e49e2241da4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   
>   /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   				xe_heci_csc_irq_handler(xe, master_ctl);
>   			xe_display_irq_handler(xe, master_ctl);
>   			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>   			xe_mert_irq_handler(xe, master_ctl);
>   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 8daab7703247..1d78916dd6ad 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -7,6 +7,7 @@
>   #include <linux/device.h>
>   #include <linux/mutex.h>
>   
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_printk.h"
> @@ -27,9 +28,17 @@
>    * with the System Controller through the mailbox.
>    */
>   
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>   static void xe_sysctrl_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	cancel_work_sync(&sc->work);
> +	destroy_workqueue(sc->wq);
>   
>   	xe->soc_remapper.set_sysctrl_region(xe, 0);
>   }
> @@ -56,6 +65,14 @@ int xe_sysctrl_init(struct xe_device *xe)
>   
>   	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
> +
> +	sc->wq = alloc_ordered_workqueue("sysctrl-ordered-wq", 0);
> +	if (!sc->wq) {
> +		ret = -ENOMEM;
> +		goto err_sysctrl_fini;
> +	}
> +
>   	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
>   	if (ret)
>   		return ret;
> @@ -67,4 +84,26 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	xe_sysctrl_mailbox_init(sc);
>   
>   	return 0;
> +
> +err_sysctrl_fini:
> +	xe_sysctrl_fini(xe);
> +	return ret;
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler: Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (master_ctl & SYSCTRL_IRQ)
> +		queue_work(sc->wq, &sc->work);
>   }

The interrupt handler could be called before initialization completes 
which cause a null pointer deference when we access sc->wq.

Thanks

-/Mallesh

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index ee7826fe4c98..5919310b9db9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -6,8 +6,11 @@
>   #ifndef _XE_SYSCTRL_H_
>   #define _XE_SYSCTRL_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   
>   #endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 88a34967688b..14fc80dfee6e 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>   
>   /**
>    * struct xe_sysctrl - System Controller driver context
> @@ -18,6 +19,12 @@ struct xe_sysctrl {
>   
>   	/** @phase_bit: MKHI message boundary phase toggle bit */
>   	u32 phase_bit;
> +
> +	/** @wq: Queue for sysctrl work */
> +	struct workqueue_struct *wq;
> +
> +	/** @work: Worker for pending events */
> +	struct work_struct work;
>   };
>   
>   #endif /* _XE_SYSCTRL_TYPES_H_ */
