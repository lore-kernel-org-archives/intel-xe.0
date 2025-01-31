Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59CC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 14:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4A010EACB;
	Fri, 31 Jan 2025 14:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImoJhRuO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201110EACB
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738334610; x=1769870610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=caiDARKo4tFh502Yo5xVxuDZTPvKmRDhwTDhOjZABwc=;
 b=ImoJhRuOBEYecS4yjYS8X6q1WSYg7lCBD9BV0QIjMFhH/tnhdd4B3J7U
 KR29YfvRy5gvl0fPLTU6fAzLpQJ1b9kpBlshSYEV3/2fzba0ZUIovCBsY
 OFgJdSSHXbhgv5eAmKR7gmUzu/5xR7QfQHeDkTB9VTBxNKokQxY9DbFOR
 6KbxqQJ4r7MLCJ+9ktO52bSXEQPRotnK5Qy7m1JS5fJEu6SQmaKM3WJVO
 s2mnTMfdjAHWGtKjmQchK+ouVpIOxEtc3NolMWs1gZ28CPHsgmFoNV2l+
 Jhi4fzo/36VJ2Ryj7Is3pDmXkP+HNMQyK/y3+p0b2juevz/TgQxziYCSj w==;
X-CSE-ConnectionGUID: hSvNypPcTpiURW7olOWwGA==
X-CSE-MsgGUID: Oo582XsgTv6x0z4T121erw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49163223"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208,217";a="49163223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 06:43:30 -0800
X-CSE-ConnectionGUID: LKJQm+z3TOWbQY+rGgrunw==
X-CSE-MsgGUID: OOHXD0QhRSiMPlukgEPkkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
 d="scan'208,217";a="109478345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 06:43:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 06:43:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 06:43:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 06:43:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1qEnHcN2e7c7OkD1pZMCfERB8kFmO6kNKBGnZHfPyYnOnJdGCiBr+2XxpUVio1mHRmcyXGomMm8X2SpGFm5d6GLpXZzZhcHfB2flBXX1YNMYuT80bJZ8j7k0BhDJ20vZtYhh056wswFhDRnbEN/4JPG6NSRup85dgZb9ZwBKSKyri/v7lEGuHgu5Wjlr067tcAJooGc338vI1/68shnWW4PBfhhxr7oXKnOYzNu1WYcFrAxLvFw1o0/dKFEMy/AEVa9DoKgjH+Po3+/QrdaMuQbId1YJOVSiLPNkCPwgnVZuRv5TZiOx6s18ZD3UNjuaGE08D+6rNCpw+lUT0Wi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUbAHEVW22/CtaDcdsnbDdF8uDHjTO4Ixkk43sLWAhU=;
 b=KUQGvsOfuIZykrYLGPhXmj2WlMQ746hp12H3mogQ2w8hA+xCSgoGrK3wF19kC0VDjLIdigFiolQJ6OsbviLjwdFNyw5K/3am7naGAHwcoNhz/hGDdArg+znrS8o2qWgERQptK+h3fD8cYWlkvj0LaZJYpyW5NdLEkSRoj+cyk9aGYNB2Ri/pZGSfqXZXuOHmTEVy3o+Bc37tAXOTCoOwytOXU44g9iGdr6Ddo3EccsWIAt1wgO+zqBXxDn+FTnPYnI+sknqbE9B2odKnEvUKlGDTUR22kYovyUp6BSbGZddZhKVXoFXmpiZ6B2A0GynU5jaUwdcqxRL2VpSMPfK3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 14:43:23 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 14:43:23 +0000
Content-Type: multipart/alternative;
 boundary="------------UeDBN4NKgaHspFmT3n6Mf02X"
Message-ID: <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
Date: Fri, 31 Jan 2025 20:13:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Content-Language: en-GB
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250131054502.1528555-1-raag.jadav@intel.com>
X-ClientProxiedBy: BMXPR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::26) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 4623262e-699c-4a8e-e209-08dd42059cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlBXZVBZMmkvdGVXcW82NGtFTUdIK2JtRnlwbG1sZWpkYm81bUc2S2hERDVG?=
 =?utf-8?B?bFdtT3lMcXNWRCt2Z2xnVHA4QisyQXZqOW1LNnF4a2FSNHlzWUVTZ0JmMkls?=
 =?utf-8?B?MEozSWZmU3NPT0t3aW5OTEo2OS9mQVBsRGpEL1J3NFFvNUQwU2lMSVhWcWZD?=
 =?utf-8?B?NVZlcWYxS3VPenZRL3JucDNlOTFmbGY3eUhGaFp4aEVzZXNlOXpSeU1FSTV2?=
 =?utf-8?B?N1ppYjdzVjNPK0t0bm9UV1Nid29RQ0JYSGx0U0dzMHI2dndrQ2NtY0s3WEpZ?=
 =?utf-8?B?cndVSStkYXd0R2Q1QWd3ZWl6dzNhOFdMK3JBbmZGaVhaQ01COE9YajZqYmE3?=
 =?utf-8?B?dnNNNkw0cnY5cDBQek11aDlNTGVTc3ovWUl1RmphZktFQmpaK2dIYlY3d1RH?=
 =?utf-8?B?cVJHTkhpa25zTlhDeXY2THd1Vi94dm4vOFd2Yjdna1Nick9yNm1wL2dieGlX?=
 =?utf-8?B?eW10VWlYd3pDWlFoaStYa1ppNWxrSFdvZFJNNXF2WGYzYlEyWkd6UVlWSCtE?=
 =?utf-8?B?TnMvTUN1UHdLT0lHT2o3RTlvYTRUbTZTZVorV2h4VlVsTHVzV1ZTOEpUV3Bw?=
 =?utf-8?B?cGRzZm5oY2prL080WmhYQkVkL0dFdHNkYW1rZ1pXYm9OV2lna2RRbVJnT2V0?=
 =?utf-8?B?VzdDS1NsVXpTaHJSeTFJd3RDL3U3TytMcG44bm5EdnVLbWpRbTNsanhHWHI4?=
 =?utf-8?B?OC9ZZzRmQ0xXaFZrZldDN1lBS3lacWw5Ri9STU9GOTl0NU5nWklHeCtGNHpP?=
 =?utf-8?B?a3FFSHFJVFc0VGZicU5XTHgwUmpGcURyQVdrOXM2Slc4MVE4T251dG81cWFJ?=
 =?utf-8?B?ZGpsaWJGZWRVUkFNU24vTHRIQ28zT3RvbXNhR0crTUtnazlTUkNFMytRNkV3?=
 =?utf-8?B?TSszOVpYcG1Ya3l4S1dRM0xXdG1EYlNDYW0wS1pwQ3J4THRTWlhLeHh0S2Yz?=
 =?utf-8?B?K0toZ05XVWVBeEtWT05nOWgyd0NvYmh5c0pQcisvdkdKYm1xQXNDVFlFNGhG?=
 =?utf-8?B?VUsyZ0M1Wnc3RndtRWdqR01yTElsUkx3OEw4UWM0U3dyK1FHV1BnS1dDRWpN?=
 =?utf-8?B?Qjh0cmdCdzZ5VlFNUFV4UXBLNDA5RjNJRU1XSVRBVUo4RG8vdm1MS09acGcv?=
 =?utf-8?B?REpkcmIzMm9rckx3NHp4Y2MwNVNxOGtFMnFoc0tLSUFTWlM0cFpmUy9iY3ox?=
 =?utf-8?B?L2V5dGJoRnRzVll0WGRYNHJYTk40czM5NGRER2YzTWxQQkhiR2FubXBlb1hT?=
 =?utf-8?B?Z3RWby9TWDV5NFdZRDNSOEN5Uk5ENHFzRkM5WDZwcW04dDZTRGdiSmVOMWdG?=
 =?utf-8?B?bDliczRYK0dIZXJ0VGtKUmhRK3JDenM0aDAyMDhqVXp1Sjd4SW9rUVcveUwy?=
 =?utf-8?B?bzFNa1c5NXNpdC9CS2sxdmVUbUx6WENaZHQ4MzJoL3VnOHFPVGVSZWJjc041?=
 =?utf-8?B?NXR6OEo0YkhQVC9SSlZmK2JUZkV1SFJoVmVydzRpcncvR1pncXBGMU90aUxW?=
 =?utf-8?B?SGoxOFJEaHR5R1o3cm1NczR1ZW9TbkpWTzJqd3dDRWkrUUEyZ2tjay9ja1lp?=
 =?utf-8?B?em1zZk5laENGUWdpaWtxRFU1SXVTSU04OU5hdGpIK3h6VzJRaWpTZzFYR0xs?=
 =?utf-8?B?Y1p3R2pNODZMZ3ByVVJlMnFsMitobnpGS1JXUXlCdUxCUFhtVGg5K0cySXd6?=
 =?utf-8?B?OVpKMVdnSkF5TmMyUkJYVjNmY1JwUUJRMDlWZDlYLzFPRFNTbEJ2MEh4OVdy?=
 =?utf-8?B?dERYNUxsR0VacUtuTjdGM2ZzSCsrZXRUanNDN0RrY2QxUU5NQURVdS9OVEtU?=
 =?utf-8?B?VlJZWlNRT0I4MFRKd2o5czF1Y2ZJMStpSVZvMXdkalgrTis5bmprMEZkbGVs?=
 =?utf-8?Q?Xh8yQ0Wv/VBJW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHExR3dLaDFlOWxDRWU3cVVnMldXb3pFSjRYUDdodkVZaGliMmdIeGU4Q1k1?=
 =?utf-8?B?YkNHSmlQUDIwcGdkeHZOdjRRY1JvNGdEVTJ6ck1kWDh4V0RNMDFsWjM5aFZY?=
 =?utf-8?B?THhra0hXMXlZZXFWcEg5R2pGVUo4OEJxaFlYSDN3ZzFKWXpNUE1idUhOV3RU?=
 =?utf-8?B?VEpiZFluaUQ5MzlNNDJvTjRMOHNzU0RrZ2lXSit0UkpWTGpWRk8rQzZQQXk5?=
 =?utf-8?B?VVNwNTJUb1AyZ3JKZ2FsT29VdU80R2tvZ3Y5UE12ZEpQZmJvTkRUK1ljajdC?=
 =?utf-8?B?UWFBaEJVUFpKdXdkeTNpNEhiL2hNNUhKTWFQMTR5cStSS1h6OTVwOTV3K2lK?=
 =?utf-8?B?QVZHcHZSaExVQ1FPSUdCNGdPZTFJdkhWSW1qd0ZNYnVNNllETFV4NVpvSTAy?=
 =?utf-8?B?a3pNVE9FdzJOQTl5TE92dXJSMS9lYXFxbTVmS0RIa1JyV2VGeVVCMWM3c2xK?=
 =?utf-8?B?Q2dZRWlSd0EvZ0ZhS1RPai82UXZVdXpITkh3NXZoMHdORXA5SjVYWnRpMUVW?=
 =?utf-8?B?cVJVTzFtc29BN1VFSXhUNFIyM0F6VUtjSUVnMFJDVUpDN3NzS3g3bHcrUkxH?=
 =?utf-8?B?T1B6Vm9KMll0SlpQYmEvNzRoVEJHMDQwK0REdTVmNnZDd3FQNmNlZE9PMTF1?=
 =?utf-8?B?WVRpbXZGRFM3ZjFBYkp4SnF0S1pCdms1TWpYVXBwNDZ0d3BDSmdPQXFtQUll?=
 =?utf-8?B?L3ZRQUM0cmNLdFdBdDlVdXg0QUQ0QjVvU25zWEQ0WEpyQzVVM2JwanhTZGVv?=
 =?utf-8?B?RFgyZzBnYnVDTk9kU09xTHRoNkc0a2F6OGZMV01URDliMmpqdlIvdUkweG1K?=
 =?utf-8?B?UFluTEJIUjF1QjB3cFFYcjF5blhtYisxWGk2ckswdTlLbThxak9Md2FJVG1M?=
 =?utf-8?B?cFEwWjMxWVdnT1FRam0rZ3N4dTJtMEhYNFBlUE5IeHlxcm4yTGVrYURJTDFt?=
 =?utf-8?B?OFY4eCt5dTJVRjJXT01La2s5NzNrU283bEVPZTJBSDRDUWFEbzIvQk1jWWRE?=
 =?utf-8?B?bXgvY29kbXZlR3BXNitiS1VRSHdBYkJoQmxrQ1FIY1h5ZUJOZlNvUTNFb052?=
 =?utf-8?B?Rmk2QzRtdG1NRitybGhDeGc0V2N3WG9JUVY2bmFqQTZSdG1pTGJkSmdabkpk?=
 =?utf-8?B?TDFXUC8rQTBtMDVad2kvdkJCQkg5Y0h6ZldPcVZ5QyswT0tVUGZJWVM3VVlL?=
 =?utf-8?B?NHpCcXhGVnQxc1J6QVY5NjNTTnpBcVg3Zm1UN1hQeU9QN0w2RHdzWGxwRXMz?=
 =?utf-8?B?RkhKYnZMa2Zacng4T2N1VFB3TXUrUENjL29lQUl3QU82MzJ6Y3VwMVgwcXUy?=
 =?utf-8?B?M0pyM09VSkpySUQyL25xd0Rrenh5UXpFbEhGUGFtbXBaSEUwTGd5RVJycmhs?=
 =?utf-8?B?cy9PRFZaQzNsbjA0SGxXUExxTXpPS2ZEN1lhMDdpK2l0Qk50RDAxTmFUdTFz?=
 =?utf-8?B?Nk1HWTlWTllyU2I1Y29pRlJjWjhMYVZjNjl3ZkRTZWJiajR2TmlXV3lnRTA4?=
 =?utf-8?B?WjBPWUR1VE9NWVRkT1ArRWRiY3pvbHZYbmRuN1l0dUprSURYd1NZZmVlbkVN?=
 =?utf-8?B?S3lFNHFNbnB3cWxQcXUram5aS3hoVGNZR2VuWitHZnNpMXc0OGFFb0h3ZXFB?=
 =?utf-8?B?b3hrdFJkQ0k3TUlDcVlscy9FWWlJUHltN2RTL2Zwc0FRd0J3a0tkNWszNnRR?=
 =?utf-8?B?N3hPOW12dmhmUFhCeEJlSjdtNndydGIxVnI2Wm8ybEFYcXFxbVNMT0xXczY4?=
 =?utf-8?B?TEtFbUJvR1UwSm9WWTI3TG1UL2pscndGWjhzcmxXNXlseTJCSDArUG5iMzVI?=
 =?utf-8?B?VjdSZFdGZVlib3BVekVwRkNGYm9QaGJoY0l3UkF4ZS90UkRiTVJMZk5hWjI3?=
 =?utf-8?B?UG9ZM2lsRzUxTlBLWUJ3b256eDdWVUk2WkhTRHA0blM4ZnIvTWNINWU5NGVs?=
 =?utf-8?B?Wm5sTHZxWnhOS1d4dnltNjdJYW5HVllzR09IWG5Mdng3RG1sSFpIbWNtZi9o?=
 =?utf-8?B?bmRxTlFJWlZpZVladU5JZ0J2ektSQUQrR01OSjFscDEvM1AwclVWaEdkL1J1?=
 =?utf-8?B?YVFXYTBwWnByRE1tTW9BMHFHTlhSYURkUjFYMmJPakV1TzA1NHhDRTlUTnA1?=
 =?utf-8?Q?a++I2JYPBWi1AhVMi/+3WaDWH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4623262e-699c-4a8e-e209-08dd42059cdf
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 14:43:23.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99nDGTwqjv0mRWMCyQwiylViNfQtvl3qRtUFefZkutVVVPDXO4/EhErWwcvyv7b9f8uUv1r+6DuSPY6E8cpukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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

--------------UeDBN4NKgaHspFmT3n6Mf02X
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 31-01-2025 11:15, Raag Jadav wrote:
> Add hwmon support for temp2_input and temp3_input attributes, which will

Add hwmon support for temp2_input and temp3_input attributes for supported platforms

> expose package and vram temperature in millidegree Celsius. With this in
> place we can monitor temperature using lm-sensors tool.

With these changes, package and vram temperatures can be monitored using lm-sensors tool.

> v2: Reuse existing channels (Badal, Karthik)
Add a new channel for VRAM temperature, channel 3.
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
>   4 files changed, 81 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d792a56f59ac..9bce281314df 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Package current voltage in millivolt.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> +Date:		March 2025

January 2025,

February 2025, if there is a next revision after v2

> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> +Date:		March 2025

January 2025

February 2025, if there is a next revision after v2

> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..f5e5234857c1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -34,6 +34,9 @@
>   
>   #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> +#define   TEMP_MASK				REG_GENMASK(7, 0)
TEMP_MASK -> TEMPERATURE_MASK
> +
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 0b0b49d850ae..8846eb9ce2a4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,8 @@
>   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>   #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>   #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fde56dad3ab7..7f327e334212 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -6,6 +6,7 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/types.h>
> +#include <linux/units.h>
>   
>   #include <drm/drm_managed.h>
>   #include "regs/xe_gt_regs.h"
> @@ -20,6 +21,7 @@
>   #include "xe_pm.h"
>   
>   enum xe_hwmon_reg {
> +	REG_TEMP,

Any specific reason for adding this at the beginning of enum ?

Generally addition is at the end for any new enums.

>   	REG_PKG_RAPL_LIMIT,
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
> @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
>   enum xe_hwmon_channel {
>   	CHANNEL_CARD,
>   	CHANNEL_PKG,
> +	CHANNEL_VRAM,
>   	CHANNEL_MAX,
>   };
>   
> @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	struct xe_device *xe = hwmon->xe;
>   
>   	switch (hwmon_reg) {
> +	case REG_TEMP:
> +		if (xe->info.platform == XE_BATTLEMAGE) {
> +			if (channel == CHANNEL_PKG)
> +				return BMG_PACKAGE_TEMPERATURE;
> +			else if (channel == CHANNEL_VRAM)
> +				return BMG_VRAM_TEMPERATURE;
> +		} else if (xe->info.platform == XE_DG2) {
> +			if (channel == CHANNEL_PKG)
> +				return PCU_CR_PACKAGE_TEMPERATURE;
> +			else if (channel == CHANNEL_VRAM)
> +				return BMG_VRAM_TEMPERATURE;

This doesn't look good.

Can you add PCU_CR_VRAM_TEMPERATURE with same offset in 
xe/regs/xe_mchbar_regs.h ?

> +		}
> +		break;
>   	case REG_PKG_RAPL_LIMIT:
>   		if (xe->info.platform == XE_BATTLEMAGE) {
>   			if (channel == CHANNEL_PKG)
> @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
>   
> +static umode_t
> +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_label:
> +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	u64 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +
> +		/* HW register value is in degrees Celsius, convert to millidegrees. */
> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
Can you add debug log, printing the unsupported attr ?
> +	}
> +}
> +
>   static umode_t
>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> @@ -667,6 +715,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
> @@ -699,6 +750,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	xe_pm_runtime_get(hwmon->xe);
>   
>   	switch (type) {
> +	case hwmon_temp:
> +		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
> +		break;
>   	case hwmon_power:
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
> @@ -752,6 +806,12 @@ static int xe_hwmon_read_label(struct device *dev,
>   			       u32 attr, int channel, const char **str)
>   {
>   	switch (type) {
> +	case hwmon_temp:
> +		if (channel == CHANNEL_PKG)
> +			*str = "pkg";
> +		else if (channel == CHANNEL_VRAM)
> +			*str = "vram";
> +		return 0;
>   	case hwmon_power:
>   	case hwmon_energy:
>   	case hwmon_curr:
--------------UeDBN4NKgaHspFmT3n6Mf02X
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 31-01-2025 11:15, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Add hwmon support for temp2_input and temp3_input attributes, which will</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">Add hwmon support for temp2_input and temp3_input attributes for supported platforms</pre>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
expose package and vram temperature in millidegree Celsius. With this in
place we can monitor temperature using lm-sensors tool.
</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">With these changes, package and vram temperatures can be monitored using lm-sensors tool.</pre>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
v2: Reuse existing channels (Badal, Karthik)</pre>
    </blockquote>
    Add a new channel for VRAM temperature, channel 3.<br>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Reviewed-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d792a56f59ac..9bce281314df 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -108,3 +108,19 @@ Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
 Description:	RO. Package current voltage in millivolt.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_input
+Date:		March 2025</pre>
    </blockquote>
    <p>January 2025,</p>
    <p>February 2025, if there is a next revision after v2<br>
    </p>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+KernelVersion:	6.14
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp3_input
+Date:		March 2025</pre>
    </blockquote>
    <p>January 2025</p>
    <p>February 2025, if there is a next revision after v2</p>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+KernelVersion:	6.14
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. VRAM temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 519dd1067a19..f5e5234857c1 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -34,6 +34,9 @@
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
+#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
+#define   TEMP_MASK				REG_GENMASK(7, 0)</pre>
    </blockquote>
    TEMP_MASK -&gt; TEMPERATURE_MASK<br>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 0b0b49d850ae..8846eb9ce2a4 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -21,6 +21,8 @@
 #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
 #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
 #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
+#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
 #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
 #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index fde56dad3ab7..7f327e334212 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -6,6 +6,7 @@
 #include &lt;linux/hwmon-sysfs.h&gt;
 #include &lt;linux/hwmon.h&gt;
 #include &lt;linux/types.h&gt;
+#include &lt;linux/units.h&gt;
 
 #include &lt;drm/drm_managed.h&gt;
 #include &quot;regs/xe_gt_regs.h&quot;
@@ -20,6 +21,7 @@
 #include &quot;xe_pm.h&quot;
 
 enum xe_hwmon_reg {
+	REG_TEMP,</pre>
    </blockquote>
    <p>Any specific reason for adding this at the beginning of enum ?</p>
    <p>Generally addition is at the end for any new enums.<br>
    </p>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	REG_PKG_RAPL_LIMIT,
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
@@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
 enum xe_hwmon_channel {
 	CHANNEL_CARD,
 	CHANNEL_PKG,
+	CHANNEL_VRAM,
 	CHANNEL_MAX,
 };
 
@@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	struct xe_device *xe = hwmon-&gt;xe;
 
 	switch (hwmon_reg) {
+	case REG_TEMP:
+		if (xe-&gt;info.platform == XE_BATTLEMAGE) {
+			if (channel == CHANNEL_PKG)
+				return BMG_PACKAGE_TEMPERATURE;
+			else if (channel == CHANNEL_VRAM)
+				return BMG_VRAM_TEMPERATURE;
+		} else if (xe-&gt;info.platform == XE_DG2) {
+			if (channel == CHANNEL_PKG)
+				return PCU_CR_PACKAGE_TEMPERATURE;
+			else if (channel == CHANNEL_VRAM)
+				return BMG_VRAM_TEMPERATURE;</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">This doesn't look good.</span></p>
    <p>Can you add PCU_CR_VRAM_TEMPERATURE with same offset in <span style="white-space: pre-wrap">xe/regs/xe_mchbar_regs.h ?</span></p>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		}
+		break;
 	case REG_PKG_RAPL_LIMIT:
 		if (xe-&gt;info.platform == XE_BATTLEMAGE) {
 			if (channel == CHANNEL_PKG)
@@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
@@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
+static umode_t
+xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_label:
+		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
+	u64 reg_val;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+
+		/* HW register value is in degrees Celsius, convert to millidegrees. */
+		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+		return 0;
+	default:
+		return -EOPNOTSUPP;</pre>
    </blockquote>
    Can you add debug log, printing the unsupported attr ?<br>
    <blockquote type="cite" cite="mid:20250131054502.1528555-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+}
+
 static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
@@ -667,6 +715,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	xe_pm_runtime_get(hwmon-&gt;xe);
 
 	switch (type) {
+	case hwmon_temp:
+		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
+		break;
 	case hwmon_power:
 		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
 		break;
@@ -699,6 +750,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	xe_pm_runtime_get(hwmon-&gt;xe);
 
 	switch (type) {
+	case hwmon_temp:
+		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
+		break;
 	case hwmon_power:
 		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
 		break;
@@ -752,6 +806,12 @@ static int xe_hwmon_read_label(struct device *dev,
 			       u32 attr, int channel, const char **str)
 {
 	switch (type) {
+	case hwmon_temp:
+		if (channel == CHANNEL_PKG)
+			*str = &quot;pkg&quot;;
+		else if (channel == CHANNEL_VRAM)
+			*str = &quot;vram&quot;;
+		return 0;
 	case hwmon_power:
 	case hwmon_energy:
 	case hwmon_curr:
</pre>
    </blockquote>
  </body>
</html>

--------------UeDBN4NKgaHspFmT3n6Mf02X--
