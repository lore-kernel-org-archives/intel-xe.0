Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C0EEC2A8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136A10E45D;
	Mon, 23 Feb 2026 22:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2ZAfSOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21F310E45D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886901; x=1803422901;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9I4tPt1rCDaLTSizxoUrI6a8Cci/nywD/KTG4o4rwfA=;
 b=g2ZAfSOcaQFLpPKpFfVEbXk1Vs05eH7BQg1kYgmpp0ZlW3/XfvbPDq7K
 AcMNMt0An7o8CbIxdU3IMQuUk/lGmHQpHj5czwSiQL/c11fEH2xzMErLU
 ybVX/JMQiSTQzUx0RMty+k1zczm2jeOblekwj5M5JYuuwPgniiJHXBngw
 l8NjEmuoy57TZNsK7dkt80KesMYLAH/KlFHHJFMwtpUqFi6IUjFi5OiIk
 S2AoPVNb4VcvjcYQ0eyedurWGWuYG6Izza05d1caqjYVu9nXYZBgb+n1T
 DEzWfQ6B5BwmzLdz8LzbFF+ZzlzbmgXN2QZtCbEZKb7VtRerTZMMfALUm w==;
X-CSE-ConnectionGUID: AE76QWsNQmqrISrzmzsmCg==
X-CSE-MsgGUID: L2t2qcq3TfahVPpuR4mmQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76505627"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76505627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:48:21 -0800
X-CSE-ConnectionGUID: k9fRRkAeQsa/fxRxQgOZWg==
X-CSE-MsgGUID: ZZtnkgXXTWaUi9oHGTnJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="213591658"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:48:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:48:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:48:19 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCIBeJXp4Fe7elD1fhYDF08kKC+TIV7LnBOL4J/O6+dmfU62m9maLJYsZdZu8TYpRxBr5cgpyu23hHptFwIDaIAHCSnAHWlouktI0jAOV5xfoUnKHVGdGLYklp2yyUgX2Xp7Jt1KKrE2TP3D9fIWO7WQO8ZEkKfcM2kRyc+K2XxfmHs8E/Rq+73CRcXPNGx1fGYMRR+tolujyJg1zRq1hD6J1WbNfm6H/3dWLaXSoPAjaeP2lP3ADmvTL8XbY2wWNmORKRjzGCaJRvzy+Ii+ZYVtU2Rbi5jUoUaQiuI7+QCXX9Gp4np8DK0BZUKSXZ4lqlvwlckLm9yvMyITlSkx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F85YwZetwatVJgEibmO57URNkds/1Jv7cFyQg0xmcMo=;
 b=mwQntc/wwiwR3Sl++D5FCKsK20yLkBR6NqITucvNrAQF96oOi9A0gHxnC27zOSKNxADRmIKJbW5AQjb9CoVOXsncnM/VvfGkMddsfapPWUFQ11uP1ug8lv0taLlxfadrrKtBZcSjFt+yDDbmjNvaYGfcA3QvxZvBT8VrNWfNDbjMzePU/xlI0Tdkhd+MtTVRNQP49dHnVTMmRRqlTD92M1B3LIKB8Z7ofir/GfBmB0sHVVoXHWTIVLIUN5Qn3OdNup3bnIw93qdsIzT9Bo4G5KaMh65sVKKaWNCDFMkSHuIvyVRuh6EHQ4HjM619ajOL8IIXzwhTbzvIBUUvVssSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:48:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:48:16 +0000
Message-ID: <5f2408f2-55dd-4c9b-a86a-73af08c81fdf@intel.com>
Date: Mon, 23 Feb 2026 14:48:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pxp: Remove incorrect handling of impossible
 state during suspend
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-7-daniele.ceraolospurio@intel.com>
 <9a612289-7c41-4d19-8095-59348ed107c5@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <9a612289-7c41-4d19-8095-59348ed107c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: e387673f-e24e-47f1-4940-08de732da253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1RlNEFtb0lacWdZSThCamtvZnM0YWEwd2F5bFU2RFNNZ29ZMWxoVGlROWRy?=
 =?utf-8?B?QjZqajY3U0ZZdURzREtZM0swbis2Q0RTTmdJVWdacUFIL013bkpwcDU0V0U4?=
 =?utf-8?B?WXlBU3ovN0xyL2FzdXoyLzNKZGNETEM5cXIzRlloZ3lqeG5CR3YzS0t2YW5P?=
 =?utf-8?B?RUJQWUNwMmdFOXpiTjV2YVNGTndqa3l1MnRoRllpS0xzbHU1R2dzQWxMRUQv?=
 =?utf-8?B?alRiaDlZcElacE44OHFoS1VJYlVSRFFmYVR0cDdFMSsyQWRmRC9ySUVjU1kz?=
 =?utf-8?B?dXRQZzlLMkhWRzk2bFQ1bXdYSDJtRHpoZmc3NS9OMVY5cXY3RlVndG8zVktV?=
 =?utf-8?B?bmdIUkJ0YWllZnZmNjgwcWV1RkhxZExncGljZEVqL1pjenZGQWR2NWNvWS91?=
 =?utf-8?B?VHY0WkZmSmo1eHh0YWdLMjJQdmoxbkVrQUJrR0x1SmFtaGVESTRaMm0ra1d2?=
 =?utf-8?B?NGtod2JBdEJ2WC85RU5SM045QWpVbFI5cGVDMndId01RYXBpMjhHU3BzOHA3?=
 =?utf-8?B?Q0RSWnZiZzdjKzQ4a2dMRjFoSWUzcTNYOEtJZStzTXRKRHc3eE5uRmYrZWEw?=
 =?utf-8?B?MlZndXZMY0hld1U1VGRzcXFsNWV0RTZGbkthWlJZNmh3RUdqbGF2MUc4RlI4?=
 =?utf-8?B?SlN5cHJ0dVRadVpLcWVPZUJpUlJVNmVKY2RHdmFIYjhoY2dmL3BSVkc0WVkr?=
 =?utf-8?B?TWYvVUJnZTNLNmNUTlpaaWpFMkdQZEZoTlpnMW0wbFRNL0ZOVjNmSFVFM01Q?=
 =?utf-8?B?S2kvYVI3V25GYWRtc1l1M21TWVdCVTFtaFVyQThjNU9aalRlWGxjUXZJbTBL?=
 =?utf-8?B?a3BIZ2had29IenVaV3d3ZG4rQU9zVjRNNFJ5eHNKOEtNVWtqUmNhU3dOTTVp?=
 =?utf-8?B?V3psWjNaekFrd1V5ZmVmMkZ3cUJWVXJJejMyOThGaWltTk9JUUNybXVYVGUv?=
 =?utf-8?B?SHZGb1A2WGVZcnlxSnlBOGJPRktzcWN6UFoyNlFZM2I3YW5JcGZyK0F4NXAv?=
 =?utf-8?B?cDJGT2VadDk2bGtCMVAxV0dUWXBEWFM0WnlLV3pHVFRDdFhNYWF5dGZ6VW94?=
 =?utf-8?B?em8wa1BwaDE2YW9LbHFJUXRIOG1HME1OWGxVdDd3aHFtekdjR2g1TnVYbEZk?=
 =?utf-8?B?bjh4V2ltejhFanRCM1FSemJEVU1jN2NlMU54NjViN3hTUUN0VjJEMGxkRU0v?=
 =?utf-8?B?WWtrb2FoazNsd0xyMkozMVEvMis0VVpOZE9CcU1kUHRFT041NDlXcDlsaDlS?=
 =?utf-8?B?VnJZUEdWTGNQcUhhdDRqUS9oY2g3cXhqRGxRZ29yVjk4UDlqNk53bVlNVlFR?=
 =?utf-8?B?WHIzdTdSeWFCNzRSRWdFZmRuKzJkV0E0eTF6L3FUYk1mRTd5aFF0bkhzaHQ2?=
 =?utf-8?B?SWJZc0hsazU0elNqTnR6bHY2SVppeFJpTzRzdUt5ZDlnNjZlOTFwMktzZ21D?=
 =?utf-8?B?cElQUC95TlVpQzFod2pNL0pFM1FzdjlNZllmVVVyVHJFQlM3SGVkRUFwWmVU?=
 =?utf-8?B?dmxJN0hZSVlCUG1UUEFLbSt2RUVNbHlZbE9KTStLQUFQUFpHczg5ZzdTdHRt?=
 =?utf-8?B?bjF6VHFBWVBzcHdUeE9UQXFHRnlIbE05M1ZEbHZTN3QzTndISlJBUkVVd21D?=
 =?utf-8?B?U1ZJTHYrTUU2TnlPNENMVGYwMjVxVFJiYWEzRitmMjgrN1M2UnhkU0NQcHhZ?=
 =?utf-8?B?dEc2bjZKTzdiWHR1MmNUcVNUNHY1WXBNSlZJdEJBcUtUVVV0VmJHUHZ0T056?=
 =?utf-8?B?eU1VZ0JCR1UwWjkxVGQzL00rYWdoSmc1UU51NkNLY0FyQ3RoZmpjQTAzeHNV?=
 =?utf-8?B?Wi9aV2x3MHRscjVkU0xlZzQvVFRZeTZVYmwycy9MdUU2OGVTdHljL1JtQjho?=
 =?utf-8?B?YUhZYUM3OVljOERJYUdHYitRWUdGblZrKzVaRWxOOXRLbFRUTHV4RDg2T1dE?=
 =?utf-8?B?bUk2djZqcmhYdkxvTFlmWlRWU0Z3Z1B4THdqcGZQQ0lJSHBBYXJSdVZ6UzBV?=
 =?utf-8?B?Y05SZ1Nxd2hhQjBJMllyek03dXZWOGp1SXFBK1ZwNHFhOS9mQ2dNdnpjZ216?=
 =?utf-8?B?WFhUOGtETVJ0OVVQY1I3MGI5bWd2eXJtS01IK1ZIeGRMZkUyVEZZSzdGeStM?=
 =?utf-8?Q?0tgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEoyY1FGM2xjcklOKzBDMVNFaEsweGtOTExPbWUxMzdGYW0xYU45TjNTTTAy?=
 =?utf-8?B?WTVxcnJxbDM4aytmaTVHTEI2NUhOd3RCTDJ1S3o5RkVqMWtPZjE0MldjVzFy?=
 =?utf-8?B?V25SelF0eER3Z28yb251WXc5MGZKZFRhVjJ6QWlvcUdibHhuUjNObmYrdU1O?=
 =?utf-8?B?Ujhac2tHdElhZ2FxMHliczVuclRFLzNDY0p0OGk4NU16MTBMemNCRjdETzIx?=
 =?utf-8?B?ZDRnaHB4eEp1UzJzUFA2eDQwcE8zc2xzaUhqMmUzQisrajlMcGhENmpadHhr?=
 =?utf-8?B?Ym5aTHJZRWFQWHlaSVBPdDJwelEyUFBJRU5kTjFQcG9XOEIyUm9EeWpGNjZk?=
 =?utf-8?B?UnFZSFNYY01kTkMzSEJOc1Z0RWQvVXFuUkNaZzJRQythVVZSS0NUUHlaamJ6?=
 =?utf-8?B?VG9qRThzUVZRTnF1VklxSGNUNnhGOUZ2UWlnTUFqRmF5cmp2N3VBZi9VSDJU?=
 =?utf-8?B?YnphSU9CT001V3REM253a09penNFQUdxdlYvcXBrK1YxVkc2RmZQeWNGWldN?=
 =?utf-8?B?NVozc3NWWGdZSzUwaTRBaFV1RG1PSmpxQnp6Y21KRXdwTHA0eUFSc2hXOGtx?=
 =?utf-8?B?aGFXbFdIV2p0OXcvK21ETWhldnMxU1pwWjRGYmRQM1lJZFhvckFqUzBoek9n?=
 =?utf-8?B?MlIzTUEydU9UQXN2NDFTbi9GQzdKOEFZRTY3QWpwVmxqdGoweTEyQVcvZEdE?=
 =?utf-8?B?UCtOd1dLdUFPOGRDMVg5Z3ZoYUhLZ2ppQkN3SkhEcHJwTlVYZ05kY2FHOFJ4?=
 =?utf-8?B?ajBYZ2JUUW9lcDFUTTNXVHlWZXlVb05tSW5vMXhjNElhMldiajl3WjhvNjZl?=
 =?utf-8?B?cTEybk9PcCtDREo4c1UzWWJDTUwvSCtsY1VOUFNPcmtsQSt1N1NNZmlpU05Y?=
 =?utf-8?B?STl1UlZrWXRNa0RoUGMxVTVLaEZiOUdUbGI5cTJMS3NmVVFPM212ZEdaR01Z?=
 =?utf-8?B?L2NSR1NLeTZnSDM4Vy9WOWVsd3Y1UStIT0c0MlVZaE5TaldGb1RYck1KMlNv?=
 =?utf-8?B?SHg5OE1XbTJOWmdSRFBkaEN5TWw3L0FzaVdGT3paeW8xcE01KzdZUGZ3RTNK?=
 =?utf-8?B?Ynlqa3NiMWNyMUVVSXlHdVBKVXdOV1M2WTlRRHNvYUg5V0NHMWRSeDc1WDRQ?=
 =?utf-8?B?UE5PQlFXUjJsQ01XRXl2N2xucDBKNXVmaGd6WlVYMllnSC8vb2ptcHI5OWFz?=
 =?utf-8?B?amZtazFKeldGK3ROK3dudGJ3bUtTYW5hYlFiSHMzcVk3emFlelJ6L3F6ZUcz?=
 =?utf-8?B?VlRTdDRhV1hWOW4yUlNuQnVxSWU4Q2hDckNOS3hPaGVRRjNUSFVCU0ppazQr?=
 =?utf-8?B?TmxhV3FYNUo0dVk1eit1TWc3VFhkdy9EMk1EdUo3RjZGRnBONHdpSVNmZmlp?=
 =?utf-8?B?Wm53Qk0vWGpaM0N2K2cvaUIyYWRVNmI0UG10ZWZQWkcxYkVLMk0yNk96UFhn?=
 =?utf-8?B?cGhTc1RPZHpvK1lYMDFRSW03QlNWRmpubDhuQlEwRE9QeXJ2YUpMQU96YnpU?=
 =?utf-8?B?M05HUy85ZTEwM1VDMFdqK1VCRE9SckI0Wi9kTExrZ0R2NzRKR0lHaTFqNERX?=
 =?utf-8?B?UUNuUGZKeTVlVWg2cS9iRXd0bmQxUkhjZXE1NnRZd1JWVjFyMS9wTCt1MGUr?=
 =?utf-8?B?R2RUby9hUmhnbmpwbDVFQnVrcG5oS1VSbXQ2eWN3eGNNV290U0w4dHRvaFBt?=
 =?utf-8?B?SkRhWkpES3ZBVWozVWtPaHVGWUxwaUIvME8zWGZlOXRGbUFYWGgrZnZEaVJH?=
 =?utf-8?B?YlhVT0RqdXpLUVFVaVgzVklMN291bCtYemhUNy8xQTliYVkwOHZBaitWdFM0?=
 =?utf-8?B?WUdnMjJjb0VBOTh1QStzQXBJaWIwd3l4TW5OdzZ1cXM4UHI1dVI5Ym9RRlc3?=
 =?utf-8?B?aDJmanVpVlNSd2pXdkdXTy9QUjBNWHBmNWlzRUZSc3Q0SWc0M1RlQjlsL2tK?=
 =?utf-8?B?QjRqVFV3YzYrWGNhVDdEVDUrcUxUeVJzWSs1NC9sSGVVTThITVYySUlQc0tt?=
 =?utf-8?B?bDF5SFBMak8vajBDU05LUjV2aHVaNS9zbDExZFY5UE9KaWVwYTRHK0xaZ21O?=
 =?utf-8?B?NEpmKzRkSXY3eG1rcGpMb2dQT1dJY0RZb1ZYdEtaZ3plK0lJcFYwUWdLRTVN?=
 =?utf-8?B?aHNWTXpoQ3BzZFIzNk1jcE5uUjVwUW52YXVCTHhQaUxrd0xSZTJSNjlmMkNH?=
 =?utf-8?B?Um1qNGdkVlEwZk1FWEQ0eUJlUnd4cHlTeDhIb3JxVDlLVjdKRTFzRjFNS0lu?=
 =?utf-8?B?UkRJekZ6eUZGQXVRa1oyMjFzOUhZdTdqZzZ6L1hiSlNCTlhvbWNBc2huQWkr?=
 =?utf-8?B?ZjZOUXoxRE1sQ2lqUUFHVmpnSnMyRmp6OEczemFWWkdFR3dkd2NZakZXQkJm?=
 =?utf-8?Q?Rn/HtR7J+CX9KwXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e387673f-e24e-47f1-4940-08de732da253
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:48:16.8295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNyQFPiVjx3+IZzds8oa0jl45wVDnNjjrR0qfeIG/OwestSsMiLKLMB17YJUj16FyzO1APUP8x8yDWgLI66tnhLiwOsC/5CjT9L/LlVpy5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
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



On 2/23/2026 2:42 PM, Julia Filipchuk wrote:
> On 2/18/2026 4:26 PM, Daniele Ceraolo Spurio wrote:
>> The default case of the PXP suspend switch is incorrectly exiting
>> without releasing the lock. However, this case is impossible to hit
>> because we're switching on an enum and all the valid enum values have
>> their own cases. Therefore, we can just get rid of the default case
>> and rely on the compiler to warn us if a new enum value is added and
>> we forget to add it to the switch.
> I understand the reasoning but prefer just adding a 'mutex_unlock(&pxp->mutex);'
> to keep the check. The case for XE_PXP_START_IN_PROGRESS does this before goto.

Which check are you referring to? it's impossible for that code to ever 
be executed, so keeping it doesn't actually change anything at runtime.

>
> There is a similar pattern in pxp_start that correctly releases the mutex on
> cleanup. Any reason to remove it too?

Yeah we can remove that one as well, but it should be done separately 
since it's not a fix.

>
>

