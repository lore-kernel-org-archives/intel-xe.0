Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA8ACAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 15:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FA810E279;
	Mon, 15 Sep 2025 15:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DY8rwgHp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398DA10E279
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757951500; x=1789487500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PmnbU6hGKAq76SwDO9lz4LKAoU24h5ASkp1+93ggdqU=;
 b=DY8rwgHpT66bAmX/HJMnbQj7Nhi5QbEA09C88ytgQlW0W1TUi+yiV9rN
 NPYOltBL9H2Bkh2E+nTXK5osxRqzwempEeD2MjAeCMOq2eASaVMJyaZui
 UUDJR7L31CMn43LeQC7gdz4UIwf0FTdrV+jOk0crBLeWVcj37tueJQukp
 Dazi+45m9vfOtQcgYMHt7V4GdRStcBZ2QHGDSGTlVdjYR9ApMt/WSxugs
 UsKdopYe0+wPAjlhdBaV/aSrZI+CREou6vx0Rg/+s2i2aig6XKwrqTxcp
 5cKTsPfbOKpUE/OY/1cdU2dnNflovnGCVkubvSL26XXbjAjIisBr/EP5J Q==;
X-CSE-ConnectionGUID: SJISJQkgQLyvrd1x51WzpQ==
X-CSE-MsgGUID: qpBYMnUmSKuO9WOMggV9OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62845567"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="62845567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:51:40 -0700
X-CSE-ConnectionGUID: xP8HaUV9SPWGWi2Lw6HRmg==
X-CSE-MsgGUID: Re3IR86uQpaZkkV8vh7QcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175094585"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:51:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:51:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:51:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh5iljBymKTSpO4SKnNA82eMPwARlDQCEykyPk6Okiv60ICqINsgodVkBdHzBGgJXAgTkJQBKcb4kWluY7dlDixPvvkD8oA4XbBFxuk9qFOrN2WupggwK+253IU0BPZw/oS29G3NSsYUrxj2VJo9kI4gCFN+NTvHP48BSXULvEou0HBsdJl6dKQhUHiRc7QUnfu/zZFnOPeXLFYgnDGBXz3yfUxEowd2h6QafzTYh/y3w6RMYEQusEAyF5Qwf6lKxnOvgNOG9KhCb1BrScIRzBeCxNUYe59hOkWAEpa9eCKTxZjRJpJZ0LC2R4y5hET/H3+hIMjbisJx9Wsh9ooeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ez5smeYJgT6+o7gVvdV2ZmseILzJcIndk8OTyMyo298=;
 b=jcLtwbcu2dwKLPSSD+l9KsEkqHqzgrJOkh3t4CR29a/5Op9rYp2SgZviqRHGGiOpHekVUFWNL2v6YxG6rDDft2aJihGIWkbDekxwGgSzSHqw+//BU1roXGDWd0u9PKKvLLtYqjTq1138ZMZDS76dkIDurVA8bepqKd7pt78MvLbmRXJ8uzDieTSf6gpgMlnSsoQ1ih1UEQ7poes9RdnPz9AMSIl/9IrF8+kmsPEuJ1Zgr2gQ5DsEDQlmxes3bHSBe2P1G8TPAZICW4ImSy90QCAKKpiJjL4pz3oJyM7OZJTeQQGmKyCu5roD96VmNncp0C5b/GA5/S20Z4cw/wHEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 15:51:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:51:37 +0000
Message-ID: <25c43237-e102-45aa-8e3b-63f7891d38fd@intel.com>
Date: Mon, 15 Sep 2025 17:51:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
 <aMgt994Z4Yr99mHF@black.igk.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aMgt994Z4Yr99mHF@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0281.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a914041-d1c1-4e41-685b-08ddf46fc0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWRzTmNVbnJuTVdrMlI2N2Fhb0E5VUtSeDF5L050dXZVSTNpSTdtaURmUlRD?=
 =?utf-8?B?aGgrMitSeHdFdVVCa0QvcGlrV1ZnVWdBSWM0M3JhLzMzMGZ4bG1zRjJ4SGVR?=
 =?utf-8?B?MXdGOHRQYnFIWi9qbVpPdW9lNjRJL09hRjVCaWtBVmg5REpZUldLNkdHOTJ3?=
 =?utf-8?B?ajBRYmgyUTJyT0NsQU9iR2NWNVdkYWxCb1dTOWNrN3dyZXJVcmdUazhsVTd3?=
 =?utf-8?B?azE0VVdxQTZmeUZ5bmRUWjFNTmNjTkV4K08yOUpldEh1YVNKeEJwL1VMa041?=
 =?utf-8?B?V3E5dmYzbjZRZW5FR1hKVVpTdGl2UTlEWk5WYXJseDBKRUNRSDFvbHJPQ25L?=
 =?utf-8?B?MjdIR01JNjJxUXFvU2lNMHdvbWdtc3JxNzl1clQvZWt6TWxFQWVNeFpDc2RW?=
 =?utf-8?B?ODlJR1k4ZFhYT2szb0FJUFBWY0RjMGRGMTRyYTRmcytER2VJN3FibXJrRzBV?=
 =?utf-8?B?a0RONE5lMHZjbS90NmR3RHQ4M2Q5VlZHSGhKeFd0SU90SGpkdDVyMUVuUzRP?=
 =?utf-8?B?TFhhRDI4UjhoRnlzd0hvTHlYSjFTZXBpMGl0VlVGZ0pJZFdQWXRldWFLbm4y?=
 =?utf-8?B?cHRMTElXSDMrN083OWxaMkNrNmtWSk85UkVyZ25CMUFYbkhWb1JBNzNqNmRW?=
 =?utf-8?B?cnJGdXZ0OFl3WmkzbWVOeTlXWXN6MzNySU1PSXJMc3JLTERVWWl1dnVwUUFG?=
 =?utf-8?B?STc3WW0rVVkyUDQrcmhaUldLODBNdU9WUFJVVlJJUjNCdjFHVElmUEFyaW1X?=
 =?utf-8?B?TXBZS2ZrRGhuWVpwNWZnMTBqUmtBTDBiWnFJREVldmlER0k5dGNDaHlaWU5t?=
 =?utf-8?B?bjMrUXhFSDYzUFg2T2JmUS9MZXdoSFZoZXo1dkZUU2lqQXRmTisrdEFrZE9N?=
 =?utf-8?B?NjgxdWRxRUl1eHh5OE5neWlkcW5Lb2xtRlpQLy9FdUdYenVhMlNhSE40M2tH?=
 =?utf-8?B?US9kU3lPd21MdVpXckN2TUZ4UkoweFNRUlpncWpzeFJGOWF5WkhSdFNmdGFm?=
 =?utf-8?B?S1NKL2djNjZWcnFKUFcxWlFpWnowanVYbEtoYzFzdDZxd2EzYXUrb3VTZHVJ?=
 =?utf-8?B?NEx4c2h4NVlvai9UaEI3L0ZSWkFzTk51M29OTTdzV0o3MzEzRWJjNThWTVUy?=
 =?utf-8?B?UXpjenpBVkZDMXlRdExLNmVmQjZXM0RORjFaREJvV3FRWGJhY1l5V2xyQ2Fr?=
 =?utf-8?B?dFo2aExnS0VyOHBoT2VuZVFyV2RXd1hWZEFBazByUmM4ZElaakVRY2NJaE40?=
 =?utf-8?B?RDNSWVhYd1FOa2s5VjhGT2ljc0R4bnJpa0E3Y0FLTWRKU0NYa2plVVB2WEx6?=
 =?utf-8?B?NGgzQTBHRTl0aCs0aVErYWR3RHBUTStRY1BJQS9VRGJUL0UwWjIydWJ5R2Qw?=
 =?utf-8?B?d3RkQ1dralhvc3NhQ0RXaUJkVFdLTHRkazcwYThOUXdUNjJRS1FIa1VZWFhB?=
 =?utf-8?B?K2FTMVQzK25tNEFrNFVlRVhJRmFJNm9CeWRQNmdMMWxsT0Jpd1VKWm9iSnIz?=
 =?utf-8?B?NGt4NzM1WFpZUzlXT3Z3OFZLMWQzc0JKT0EyQ1I3K29JRTVtbUFpdk1yVFVM?=
 =?utf-8?B?ZDBCOHA4NlllbUY5d0xXMkkxZEdnWDVYbjNVR3hUWi9oaU90OW41NHdGNGI5?=
 =?utf-8?B?T0w2R2h5aGRJSXJ4R1FaT2RBdy9LaFpwL2NSMDFIZE5KZWUwTnd5NnRBK2lw?=
 =?utf-8?B?aEdwSEplVmtzSHlRM0dsbnA2ZmJCbTk2Mm81ZVB1azRtUjR6YTVWUmZ5SThw?=
 =?utf-8?B?Mm8vMCttU2xtUWFTMFR0aUUrOHA4Ry80RFN1M0w2QTJOZTRHbVFmUzJ3TjM3?=
 =?utf-8?B?Zzl3QmtZYnZEWGh1V1plTExXbkkyaHNuYzhyR3lkTG1OKy9IZkU0STJaNUVU?=
 =?utf-8?B?T25WR2hjVVdidVkrbitWbHlWUnB1QmpJYnNPSGQrc2RyQXBMdmhJai9OR3Rj?=
 =?utf-8?Q?ynHDIVREknM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0c3ZkpoVU11bFNqa3MxcVhoNUV3RUlydXhpczY0N3RjQU5LSkhMMS82M1FZ?=
 =?utf-8?B?b1hveHYxdGRkNVo5bW4zQ3MzNXJ0YS94N1gxRHRQSytKQ0svLzBVMVE2K2lY?=
 =?utf-8?B?bkRCVXFMQitpak1NR29LVUNpbDV2TDFmVWlOemt0ZHF3a3ZUeUlybHFnU01Y?=
 =?utf-8?B?ZGF5VUdZZG5CQXF3U3JyRGJBOVJ4TFZObzgzQ3VUbHZmU3VWK1F2d0NPajJT?=
 =?utf-8?B?dFF2WG9TbEd2WktMN2FuQ0ZZZS9taFo4N2tFTm9JcXkrV2dhbFdPZ2V2dXpT?=
 =?utf-8?B?TGwzNTNCSHJtZ2dRcFNpNG96OHBxTmxIYzBSQ2RnZC9yYk1RMWRWb3RYZW80?=
 =?utf-8?B?MG0vY2J0VTlOVWZqM3lqMDluZDQ4SUN6OC8wN0NtRFE0S2pYTGE0eSsxclBx?=
 =?utf-8?B?RTJlWnZHTitVRjN6Sk5SNEtDUFhyYk11V1RoNmpjLzNaVmhJVGpNM3hiY3lI?=
 =?utf-8?B?M0ZJYmRhd2NwL3NTLzVlR0Q0Q1VyTE1ES0ZGQS9ITDlzS0dHaWtOMjhNQ2lj?=
 =?utf-8?B?WDhobW90ZjQvRGpQTVV5d0JyZ2VFbnFsay9pdnZhVDZiV1B5SDIyeE45UmRo?=
 =?utf-8?B?ZUpuajk2RjhFaDJRY0ZxbG44N1FFY2ZraW1yL0FrMitFVHlxWTAzRDZqTkhU?=
 =?utf-8?B?cnZyTlpNSFd6dHRwOFBjaGJUOW9BZEZYeHQ0eGNBSmErWVBrMXJPQml4ZXl3?=
 =?utf-8?B?WHZONzd1eXA1ODZSejJoNkk4UkxqQ0xDbzlZUDRJQXZveWlwWHRqQ0FqazJC?=
 =?utf-8?B?L0luazl0OXhQY1AxZ050N1o1UHM5K3lvdHhLUWJoT0FabS9RQk9scnkvbHZN?=
 =?utf-8?B?WHNsMmZRR2RXcUxrTE9DVEtqaVNXbDE4U0cramZzM28zVmxNcHh5K1VGYU45?=
 =?utf-8?B?T3lobnZNeXJDQmtnQ05qMExnWFlabUFOWUt3WGtONW9ZMzFEUS9HRHNMWUx3?=
 =?utf-8?B?V0VuZmoybXFLU01HYjREZlcvTzZLL3hvUksxYkk0TEhBVkg5bkpib1Bsa3ZD?=
 =?utf-8?B?SkNLVStIZlFqMy9IZEdPWm41eERPR1pydHdtOUd4bXVqNG5vQ3lsMGZlcnlr?=
 =?utf-8?B?UFpKRE9IOE9XYVlYbTY1dmo0OVdTMW5RSFA3MkljNk9YSk1qdFdLVHc2NjJQ?=
 =?utf-8?B?dzQxZjhYSmNuNkZsdE42TTNSeEdITCtFeFVteHkzS29EN0tkbVFBRTF3cTMr?=
 =?utf-8?B?enFEUlVPSzlHSGhwZUJyeVo3WHNUelNYOUVyY01mZU4ycUdqM1lXNGVTc0hL?=
 =?utf-8?B?UTJtdnNhSnA5NCtydWRWVnNGRDgvZ3VnTHJIaVBSanplSjBmMjNGSzhFYm5H?=
 =?utf-8?B?dFNDeGd6Y1Y4MGlSakczcDdtMFoyZ0NrdUNqQ3lXLy9ta0xKOFVqL2JvSU9O?=
 =?utf-8?B?Y1ZvdllHckJXQ3BXWi9mUW1VTnRILzdLM0w1dWx5UndBSDBDZGVVdzV5N05i?=
 =?utf-8?B?MlJFaUc0WGtwMUhndTJPUUR3MkFZUFp1SEdQYUt3R1F1bS9Ha1c0dWhwUjJS?=
 =?utf-8?B?ajdtaTB4azZiTUpTRDUzYWpEeHZ6MFRXcFg2elZnYlM0TkgzbGNlaURrck96?=
 =?utf-8?B?MzhMdzk1b1c2MnJtTkM0Vkt2eWVwTEhCaFkvUFNpU1QvekNPY0FuR2t1M0Rs?=
 =?utf-8?B?eHk1SGNGVTYvZTBTN1BzWDN2OXc4bVZ3RzVzbGlvMUI4UThzK2FWZzRESGRs?=
 =?utf-8?B?RGIzOVBiZVdzb1FpMFNrOXdjT3ZYNEFFNnFvYUhuR21NWVdJUWxQT3lHb1R6?=
 =?utf-8?B?S0RqaTVibHp1ajJ2eDFvUGN4SS84dmg5UEUxbmYycEZqYklVZ0gwQjNJeVBn?=
 =?utf-8?B?RG5zRFEvcXpHZjA0RFY4THppYmQ5eTJURFlTaURnZktwK1dWdDY2bXhEbHRY?=
 =?utf-8?B?c2VpVTNpRVZxY0E1bThnZnY2VEVqTjIyRkJVSmFrMC9jaklhSVo4MEJRa2tJ?=
 =?utf-8?B?WlUxMUVaK0xOcEprb21WMy9ac2tGUWNKOWpiRkFDdHMwL2lDeTNQV3kzZTB2?=
 =?utf-8?B?ZHRMdXpDdFJNT1VXcFI2RFdVOWdrTEYrZGJ3clZQYTRkMk52NTB2Y3FJMVo5?=
 =?utf-8?B?SE9VS0tHQ05zQU5sTmdCRnZUR3JkNzFNamdOcjlPR3BubDVlcmZ0SWJSeTJ5?=
 =?utf-8?B?Mm1SWFNJdXl6SStKWGZRUXhmQUdsRitxcWo5eVhEZVR1enZNNlk0UVk5MmZJ?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a914041-d1c1-4e41-685b-08ddf46fc0e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:51:37.2596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/0wRcAD8vjewUSCwFgGx9GZnre55CJOYk7bIS5TOtPFHKTpZCmmfMJi+8vbJXoaTE+yzftHTa6QgS0dWezsoZIhQjEpCfEwK+yAYcDlVco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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



On 9/15/2025 5:17 PM, Raag Jadav wrote:
> On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
>> Instead of manually maintaining each sysfs attribute define and use
>> attribute groups and register them using device managed function.
>> Then use is_visible() to filter-out unsupported attributes.
>>
>> This will result not only in less code and smaller footprint:
>>
>>   Function                                     old     new   delta
>>   late_bind_attr_is_visible                      -     183    +183
>>   ____versions                               80832   80896     +64
>>   vram_attr_group                                -      48     +48
>>   late_bind_attr_group                           -      48     +48
>>   auto_link_downgrade_attr_group                 -      48     +48
>>   late_bind_attrs                                -      24     +24
>>   vram_attrs                                     -      16     +16
>>   __pfx_late_bind_attr_is_visible                -      16     +16
>>   xe_device_sysfs_init.cold                     20      21      +1
>>   __pfx_xe_device_sysfs_fini                    16       -     -16
>>   xe_device_sysfs_fini.cold                     21       -     -21
>>   xe_device_sysfs_fini                         271       -    -271
>>   xe_device_sysfs_init                         421     135    -286
>>   Total: Before=2848898, After=2848752, chg -0.01%
> 
> I find the summary to be sufficient but upto you.

sure, can strip this (if there will be v2)

> 
>> but will also fix some bad error handling that we had here.
>>
>> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
>>  1 file changed, 39 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index 6ee422594b56..5b0b98ac9b17 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>  
>>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>  
>> +static struct attribute *vram_attrs[] = {
>> +	&dev_attr_vram_d3cold_threshold.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group vram_attr_group = {
>> +	.attrs = vram_attrs,
>> +};
>> +
>>  static ssize_t
>>  lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>>  {
>> @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>>  }
>>  static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>>  
>> -static int late_bind_create_files(struct device *dev)
>> +static struct attribute *late_bind_attrs[] = {
>> +	&dev_attr_lb_fan_control_version.attr,
>> +	&dev_attr_lb_voltage_regulator_version.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>> +					 struct attribute *attr, int n)
>>  {
>> +	struct device *dev = kobj_to_dev(kobj);
>>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>  	struct xe_tile *root = xe_device_get_root_tile(xe);
>>  	u32 cap = 0;
>> @@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
>>  
>>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>>  			    &cap, NULL);
>> -	if (ret) {
>> -		if (ret == -ENXIO) {
>> -			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
>> -			ret = 0;
>> -		}
>> -		goto out;
>> -	}
>> -
>> -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>> -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>> -		if (ret)
>> -			goto out;
>> -	}
>> -
>> -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>> -out:
>>  	xe_pm_runtime_put(xe);
>> -
>> -	return ret;
>> -}
>> -
>> -static void late_bind_remove_files(struct device *dev)
>> -{
>> -	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> -	struct xe_tile *root = xe_device_get_root_tile(xe);
>> -	u32 cap = 0;
>> -	int ret;
>> -
>> -	xe_pm_runtime_get(xe);
>> -
>> -	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>> -			    &cap, NULL);
>>  	if (ret)
>> -		goto out;
>> +		return 0;
> 
> Should we keep the original log so we don't have to guesswork our way around
> random pcode errors?

hmm, I was assuming that PCODE_LATE_BINDING is also used elsewhere
so it will be reported, but it looks that it's not

but OTOH, is it a right place (sysfs init, or now is_visible)
to report any missing firmware cap?

maybe there should be xe_lb_init() somewhere, where we can report any
unexpected problems, and then in xe_sysfs_init() we will just use
already retrieved and confirmed cap?

but, still the aim of this series was different

> 
> PS: I've found patience algo to generate much readable diffs but ofcourse
> it's a personal preference :)

it was patience algorithm already ;)

> 
> Raag

