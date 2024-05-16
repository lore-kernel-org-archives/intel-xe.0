Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C34C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 10:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968010EC4F;
	Thu, 16 May 2024 10:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPGZZ20d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86210EC4E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715854157; x=1747390157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dtSZF5J6sqCNIyFPc8fHDcI1tuEL6QsAnueQG6wj+m4=;
 b=lPGZZ20dgvsEZ23evmh5+gu8JB/8vpnGoHNvGtyUczpW8pxmxBPRbydR
 vypeHfYfrA3R+CHgiUzGej6UW1l+rS89uRlU3PfLXN69R+/SNEaxKakIx
 el2wHdSM4KtCh4fSlrf/06SrtDvPLrkisrApDVFhj9jOXDygX04HebPse
 kSfMliE/w+36QiLX2QRs40tZAl5vaZ1jaLon+faJHvK2wOEih5sJ2xFdz
 p8A+v3sl53p2TWbrn/8v+3DdNK+FR75Q/XSjSIR8ijQ1XGzzcCtIWUI0s
 1F/IVN0RiGJYe65zL6jTtcyu5CjloC4k2Ga6Ce48MQvLG3kTDEYOYV2yX A==;
X-CSE-ConnectionGUID: tKZmc9lvSoC88hJeMe2Qyw==
X-CSE-MsgGUID: zFrCDwjzQkCr+Ga+Rw49GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11899548"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208,217";a="11899548"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:09:17 -0700
X-CSE-ConnectionGUID: 6zfkxYlmRN2atrWOsGaOXg==
X-CSE-MsgGUID: 2X+16AQgSTmqjtkZJt9WUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208,217";a="31953568"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 03:09:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 03:09:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 03:09:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 03:09:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWNmb2rjPFg+8t8opAAWWtV3JdwDCNU6III6Fkodtc4PRXHlJmS+8PVQEpy/9MY0tWUaiRmY79jq0UX6viiFwoSB59ZFZG5vEjH/7AmYyl4gOrqbdNX8Z58DKTEjYpKMY7MiL7VozLSy/sFC6rs5OGnn70Z5MOeSJUTYThor+o2QNICYaRNpA9Hf3vLA63OEKxelMrUjiy7Z+FGeEvj0Gjq+z8vRZ+c2lztTRZTKVbORKpHcLBiuBdi5X45oeLl+/CHCXEfUOL103ivgcPyfemkM64WXaZ+IpVPD9fpwqBZvawUdikDMRWpRCwiNq1t1uwQeYSDSgKWuq3KMZO1WWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTjtTAYo29R+fjjLPEO3HJUOR3KzjVRN32qSQKi5aak=;
 b=YsXTmmjTSVZ9KNDmklvoFL/VQ2OfsaaYfStubPOoshaaTNktkL2RgHy5DmjcIZCLUZVNjQKSrWrc2FPxgqOC7+DPPSXug+ZZ5ehNSZCl2u7/AZDy6wy0AJGIafAeAh0smOUqUbPGjuRR/jWwP/r3YPGn2Urkp+Z3efuA4KVe/4nodWwKAeSJ1lIz5oMvWLCgIimv+/S/WWrNMBpp4XLONhm71HxO+ttcEFbZhhvlHD9+qFccMs2oNQx6gWI7Apc2MUnfukqX/6yfdNaQC1SxRZ2km21FmAcv9YdGvBrGwLKStFqFkm/SxnP+DOYL9gn1lSDWpm4+/VhPUBz01EbZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) by
 SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.58; Thu, 16 May
 2024 10:09:13 +0000
Received: from DS0PR11MB6351.namprd11.prod.outlook.com
 ([fe80::fb73:b370:2aa3:454e]) by DS0PR11MB6351.namprd11.prod.outlook.com
 ([fe80::fb73:b370:2aa3:454e%5]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 10:09:13 +0000
Content-Type: multipart/alternative;
 boundary="------------Smr7r7Z39txIcuuCxYPOGtXg"
Message-ID: <cab17605-39b0-4617-915c-a71c4fe4f056@intel.com>
Date: Thu, 16 May 2024 15:39:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
To: "Konda, SaiKishore" <saikishore.konda@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
 <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
 <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
 <171533219643.7531.15603783689137370423@jlahtine-mobl.ger.corp.intel.com>
 <MW4PR11MB705636A5456E4D03F69005E0B3E72@MW4PR11MB7056.namprd11.prod.outlook.com>
 <PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
In-Reply-To: <PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com>
X-ClientProxiedBy: PN3PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::14) To DS0PR11MB6351.namprd11.prod.outlook.com
 (2603:10b6:8:cc::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6351:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: f1695693-e5de-4901-5816-08dc75903c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3hra1ZDU2QrUGF6QVA3NisraGtiZzE2V2Q1QzRFNDJ0VzBjU0JTWWtkaUxC?=
 =?utf-8?B?WnB1OW5rVHdpVUI4TElhV2pRQzFGaUpOZThXU3RzZk95QmRJOWI0K2R4Zloy?=
 =?utf-8?B?WVdNTStHODRjUHYzS2xQakxpczdzZ0twK2ZtUFRBSC9RWlZTOFJtc3p6b2lq?=
 =?utf-8?B?OW5wV1lNWVFSOWFOL1FISXZ2NGdYWWJHT2F0QU1zZjRvNlh4Q21kNHNQZnkw?=
 =?utf-8?B?bDVabnRVazRtWWV2M3d4eEFYeUMwbU55bW1PNmpUcmJCOGcyVDgzL3cyb3RN?=
 =?utf-8?B?a041bXFvQXRlMVNxNXByQXZFWk5OSDBHOTN1MGpNY0VQU0M0NFJpNXVVSlI2?=
 =?utf-8?B?VG14SWE1dlEvWElXL3FiUUFNcExXSmRXMG5IcnJqcS9qV0E4TVpjcXN5ZzZT?=
 =?utf-8?B?L3JJTFFwalZ1c29qQVhGODNCbnRCZmkvYzZocStpSlRWYnhsZzN3MDdxVXNz?=
 =?utf-8?B?SUttUkhOTm00L3FVSnRNV2hJV0h1VFdIQ1cwd1FXMnFYZlpENWtZRmJjVTlP?=
 =?utf-8?B?QXVKOTdaNytJVHFaNGZLY0dtamR0cmJmZGpTNWVGS3BhczMyRS9IaEIzT0pz?=
 =?utf-8?B?aTQxRitWaEpsUTNyWVJlck1NUEZZejA5Nk9lWFRBTXZQeEtNalh5L2w5Z0Vv?=
 =?utf-8?B?S2tMV0FwbjNsVVcreU04c1BqMis2WE8vdVRMelpCeW8rMmlBL2hJd2w3ZlFa?=
 =?utf-8?B?am1UMFlxdlNNYk9Ca1AvMjU5TDY0VW1XM1QvZW1lTVMzcVFYY1ZCRW1PaHlM?=
 =?utf-8?B?c0x6ZlA5VlVueEc5QWdoa01rbDdNN3hpdytpdEN1TlVEdXdYMHNoRDBFWUtU?=
 =?utf-8?B?aWFmMlNqT3N0RHpkUDN4TTM2RVRwcVkydklSelJiUWRZSU1QL21vYUVuS0pq?=
 =?utf-8?B?SzFHNWN3ejhSMzNGVVkwbmxtLzFZNGFZTjduMlFMQmI2NDJoejRKR1dlUTdt?=
 =?utf-8?B?OTNETkg2dFYrMWRtODgrK1RVNnkrL2sxendOYjU0SGtPcUlFRHJSWjdlL0NX?=
 =?utf-8?B?RnFqQjFvTkVEb1hZeDkzcVZtcFlXSTFzUUlYbFBIK2cvRW1MSjRKV3Z4MmpE?=
 =?utf-8?B?dnpnazgvb24vR1RiM3FZN1lFSTJuYWZ2UTZZZE1PUTRZWFN5dW1xbFh4QUtL?=
 =?utf-8?B?bmg4RFR5UlFzK3FDZmN0RS9GNWdJNnlFSUxFZUNPWThKd2NtWk5HRGhyYzh0?=
 =?utf-8?B?a2NOL3hKOVp4Nk9aMzM3L01lSVBGcE9ETUgxaENtRjJzeUZXQ2FNRGRlZm9S?=
 =?utf-8?B?NzZhL0JuTkEyc1ZldmlGUTJKRDJVTEdwdlFtMWM2QVBreXNvK2dNekxiUjNN?=
 =?utf-8?B?ajBxNEd3RUowUHhuNG1lVE9qMktpWm9GQTM2dVNabGNXTXp2ZnBwbkR4VFhv?=
 =?utf-8?B?emdHR2pzb3B6K3UrZm9sOHFiZGR3Q0Zyd3g3ZUxpcXN2Q3VmVXlYdlhuUTNW?=
 =?utf-8?B?bFZaN05PU0h6SmwwZ2haamJteGxVQnBTMjFzSzZVTWxMM0JqNXdocEdITWsv?=
 =?utf-8?B?WGlLU05iRGE0L0dXdzRVWFduVy9rSjR1WEs4UEFEVEVtclAyU3hNUG1iZS8x?=
 =?utf-8?B?Y2dsbHEyOGlKdVZRZkJwcUs5ZzBLdG1mSlVOcnkyS0lzWjUzQldwQjNDbWIy?=
 =?utf-8?B?eFJXa0JEUmxGWDcrNmdGeVBQalZUMzluampCbXJkR0xjbmlNaHVqVjJnYUdL?=
 =?utf-8?B?ZTNwVm5hck10SHk1VlIyL3MyblN0Y1ptQ3g5SmRDaUZTcndpZVRjRkRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3UxWnhpYjhHc0JKOFNzUWZta1BmRGJtOU9pMEU0cG1pRW94K2pEbkFDTjh2?=
 =?utf-8?B?Y2huU3JORWozc01wT0JQZE50anYvZGVIQlBucVVXSGtwUnNsWDc0Wmp1Mjls?=
 =?utf-8?B?Mk91akVENXBPTS9Bb3BMbVljR01YaFpyeGhtK0pvaXVzUnZmMXRseHJkOU9H?=
 =?utf-8?B?dm94S0l4cHhna1FmbkdGRDRQK0lkQjRnOHIydzBSMHF6VzFXRFlTR05DbjFD?=
 =?utf-8?B?djNLcmhUbU9yZ3FBMkRaSWZEK2ZMMmVGZ0hGQWNEdTRhT0dFNkdNUkRKSEFF?=
 =?utf-8?B?K2JKUGtMKzdQMmo2R1pta2ZSOW9SWEptb0pjU1ZyY3hoOHY3VHQ3TVc5cHlw?=
 =?utf-8?B?bUF3dnFSMnFIMGR3SkU2UzdKQ2N6WVlLc0ozdTU1L0xtM3ZkcDdsS2MrRWFX?=
 =?utf-8?B?N2t0R2xkeUpORzZKSTVlL1REOVY4ZVYxVDhTaVk4TlJOYkN5OFJ1cFArK1hJ?=
 =?utf-8?B?Y1kvTmNXL2NDdC9aTWFMTkdYTllXeDNENzM4WUVwVHBlbjBlSjJDQlNmUmVF?=
 =?utf-8?B?TUphdGhSVFBjaTRXbnhrRm1FWmNwd24vTTNocVRVbnB0WE1Rc2tNQkpNalEy?=
 =?utf-8?B?K3EvcXQ0dTJ3YnN1WnU4T1JhNjlkczlJaGJyUEJxbWhRbFRxbFd2V2dFSkVq?=
 =?utf-8?B?VldjbEkzbmhGL1NRcUVTR2RON0FVdjc1WGZRNkhLQlJIeGJTM3dZanhEMmNV?=
 =?utf-8?B?YkhaVEhFbHNHdEtEZFZkN2lxYUV4VGhJc0Rta21RYVlGMzg2aERnMk5ETktr?=
 =?utf-8?B?b1p4Sm9LTUJ6YXloNmVQdnlqa0VHUXo0Rk5UMFZ0SXUvSm5aSk0rUW0wMXl5?=
 =?utf-8?B?R0dMTllrcnkyZlNJdkE0M0hmSWZVUXJGYjUxK2djcklzbkJpMkVpNzhGdmxS?=
 =?utf-8?B?WGF1Ym1qUG9iWnBxMjJTdUkySkVDbXVFQjRyUHY3clVhVk1CaTkyYkMwYWw4?=
 =?utf-8?B?RGQ3cWJoT0hJd0t1USthNk1iODZXeHU3RUVBZnlaRkVEd0s1czN6eXRRRG1Z?=
 =?utf-8?B?MWZ2ZEsremZFS2R3dmpyV0t2R3lEVnRlNHhhQlhPT3hONUxhQTVOOEsvYUhJ?=
 =?utf-8?B?UW5BWlRXOWVmRmxTeW1nMWNHYzdEUERWWm53azM2cG0wS0ZXUjMxQjcwMTZx?=
 =?utf-8?B?anNCKzE1Mi9VelhkSDJsMG03RW92cTVtR2NZNUNtUmlYS1ZMZkZzT2VmRnJC?=
 =?utf-8?B?Vm1VaE13cTRMNFBaTi9FREFmbVVkTW5JcnYvU3BCZ0o1MVVjSnJQaDM1dGhz?=
 =?utf-8?B?SVJFY1dlOFZCVGhDMktDVDRjZlRSRUlwZHhVTlhJS0xlNlNOam1UdU1aYTU3?=
 =?utf-8?B?N1pLQ1hHTFZ2akxFNmlMVzNtQ1FVb3dWNzFSZE8zcnFQazl5Yll1NWlXUnAr?=
 =?utf-8?B?dDA3OGZ5QzRhWDlHRGo4TkJTa3lDaVhvTHhZbmpSdHFZbkxpR2NZMW9JakVL?=
 =?utf-8?B?MnhVeVNnelFXMUFsMWE3djJVVkY4KyszZjY0ajM2dTQ3RHZyWjVoNmp2RzJy?=
 =?utf-8?B?RzBuSHBnNEV6SVRJVlZsdnhoMGlrbGE0MC9qRmp2dDY4eU5Jb2JlS0ZnYW5l?=
 =?utf-8?B?aWs3S2pyVlN6Nmd1UlIvdjdhRjdNWm8rS21xdnczcytBelY5RWVGVTZoWkpS?=
 =?utf-8?B?QXdGNVUvbXhJOHQ1bVdwSjI0Qk5RMUtmRGJwTXdHMnI3c3VrQmNtTVJaTVNo?=
 =?utf-8?B?TitSY2JJSU5uci80REErZU10dWRsOU04V1ljUkNWUkcwTnV4YTM5R3kxQXJy?=
 =?utf-8?B?cEFid01JblpibzZGQzZPTmliVW44cFRncWg1Rmc3ZjVYZk1jUlI0bHRXVlI2?=
 =?utf-8?B?REVRSkZlTGc3S1RTV1h2MHZRU0hZeEdmR2RFY21iMHhTUUlXd1c5YjRZaUx6?=
 =?utf-8?B?VDFxZ05KbWFyV3Z1ai95TmJVNElBTnFucmpUY1RlcW5DWWpFM09zc3kwZ0Nx?=
 =?utf-8?B?NWhQY3d1S0Q4a1dpMDRPbmFpdVltb2xPU3kxbVVUVnFXOWtFQ24zdTlXNThj?=
 =?utf-8?B?bWFFRVJidDA4d3dPZ3pWM0pZTk5CRzY5MkxNL0wvNko4VVZHRWRpQW5wcm1s?=
 =?utf-8?B?eFZ0S1o1d0hNbCt3cjIxK0E3M2ZkNjIzQlA0RjlsaUMvbThFTVc5VE5vMGtR?=
 =?utf-8?B?VnQxNGlJNWdrZ0IzR2pqeVFhcmhMeXdZbWNqb1NLSnd0T1JXU3N3VjMwNEZF?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1695693-e5de-4901-5816-08dc75903c44
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:09:13.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN2iJUAFRuNreZk7YxGnZ2DiUsWgQ/sRNXxz/aPvPI9pIwEHma55fRBnQq848BfsmBpO+qSPDwdpKkaduq4aUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

--------------Smr7r7Z39txIcuuCxYPOGtXg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 5/14/2024 3:47 PM, Konda, SaiKishore wrote:
>
> Hi @Ghimiray, Himal Prasad <mailto:himal.prasad.ghimiray@intel.com>
>
> What was the conclusion ?  Will XE team support this ? Sysman 
> consumers use single KMD Config and they don’t have different configs 
> for different use cases.
>
I discussed with Saikishore and He will check with XPUM E2E team for 
usages of L0 API which are programming exclusive mode.

> Thanks
>
> SaiKishore
>
> *From:*Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> *Sent:* Friday, May 10, 2024 3:14 PM
> *To:* Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; De Marchi, 
> Lucas <lucas.demarchi@intel.com>; Brost, Matthew 
> <matthew.brost@intel.com>; Konda, SaiKishore <saikishore.konda@intel.com>
> *Cc:* intel-xe@lists.freedesktop.org; Upadhyay, Tejas 
> <tejas.upadhyay@intel.com>; Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> *Subject:* Re: [PATCH] drm/xe: Modify minimum of various scheduler 
> timeout to 0
>
> ------------------------------------------------------------------------
>
> *From:*Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> *Sent:* Friday, May 10, 2024 2:39:56 PM
> *To:* De Marchi, Lucas <lucas.demarchi@intel.com>; Brost, Matthew 
> <matthew.brost@intel.com>
> *Cc:* Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; 
> intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>; 
> Upadhyay, Tejas <tejas.upadhyay@intel.com>
> *Subject:* Re: [PATCH] drm/xe: Modify minimum of various scheduler 
> timeout to 0
>
> Quoting Matthew Brost (2024-05-09 19:00:43)
> > On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:
> > > On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
> > > > Remove the min/max configs and change minimum values of 
> preemption and
> > > > timeslice to 0. The sysman teams must deactivate preemption and
> > > > timeslice to assess exclusivity mode. They depend on configuring
> > > > timeslice_duration_us and preempt_timeout_us to 0, ensuring these
> > > > values are set at their minimum.
> > >
> > > nack for now, based on this explanation. See below.
> > >
> > > >
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray 
> <himal.prasad.ghimiray@intel.com>
>
> <SNIP>
>
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > > @@ -10,41 +10,17 @@
> > > >
> > > > struct drm_printer;
> > > >
> > > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > > -#else
> > > > #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > > > -#endif
> > > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > > -#else
> > > > #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> > >
> > > previously one could configure a kernel with a different max.
> > > And now it's hardcoded. How is this better and related to the
> > > motivation in the commit message?
> > >
> > > is this commit doing 2 different things?
> > >
> > > 1) Removing the _MAX from config since nobody is or should change that
> > > 2) Modify the min value to 0... That seems weird as basically there is
> > >    no minimum.
> >
> > This is true.
>
> Maybe I've missed some discussion but what is wrong with the previously
> agreed approach where KConfig would determine hard _MIN/_MAX bounds
> (and maybe _DEFAULT) that the kernel can work with, then there would be
> sysfs min/max (+ default) which the sysadmin sets as comfortable with
> considering the expected use-cases on the system and application then
> choose within those bounds (if it wants expedited hang detection for an
> example)?
>
> > > I'd like to hear Matt Brost's opinion on that.
> >
> > I chatted with Lucas and second his nack. The requirements for this
> > change are coming from sysman and are unclear. If sysman needs to set
> > this to 0 (akin to no maximum), why can't sysman build the kernel with a
> > Kconfig to allow this? This use case appears to be an HPC/AI data center
> > scenario in which the kernel is probably built with a non-standard
> > Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs to
> > be addressed clearly and publicly.
>
> I also thought we agreed on doing different build for such scenario
> where the interactive desktop is not expected to be used, so larger
> delays are more allowable.
>
So you are proposing an server only build where it can be set to zero.

Regards

-Ayaz


>
> The default build simply can't allow unlimited blocking of the HW by
> certain workloads in order to make sure the desktop/compositor stays
> operational. That can only be enabled by default build when the 
> long-running
> workloads can be isolated so they won't interfere with the workloads
> using dma-fences. And I don't think that code exists yet.
>
> Sysman should be able to report a feature missing from the kernel if it
> detects that it can't set the limits wanted. This can be reported to
> user via error code and/or error message asking to install a different
> kernel build.
>
> Same strategy has been applied in the past for various kernel features
> like realtime/virtualization etc.
>
> Regards, Joonas
>
> >
> > Matt
> >
> > >
> > > Lucas De Marchi
> > >
> > > > -#endif
> > > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > > > -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > > > -#else
> > > > -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > > > -#endif
> > > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > > > -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > > > -#else
> > > > +#define XE_HW_ENGINE_TIMESLICE_MIN 0
> > > > #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > > > -#endif
> > > > #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > > #else
> > > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> > > > #endif
> > > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > > -#else
> > > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > > > -#endif
> > > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX 
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > > -#else
> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> > > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > > -#endif
> > > >
> > > > int xe_hw_engines_init_early(struct xe_gt *gt);
> > > > int xe_hw_engines_init(struct xe_gt *gt);
> > > > --
> > > > 2.25.1
> > > >
>
--------------Smr7r7Z39txIcuuCxYPOGtXg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/14/2024 3:47 PM, Konda, SaiKishore
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US">Hi
            <a id="OWAAMB3B24BE1CEFA408B8563DFC28E3AA050" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">
              <span style="font-family:&quot;Calibri&quot;,sans-serif;text-decoration:none">@Ghimiray,
                Himal Prasad</span></a><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US">What
            was the conclusion ?&nbsp; Will XE team support this ? Sysman
            consumers use single KMD Config and they don’t have
            different configs for different use cases.
          </span></p>
      </div>
    </blockquote>
    <p>I discussed with Saikishore and He will check with XPUM E2E team
      for usages of L0 API which are programming exclusive mode.</p>
    <blockquote type="cite" cite="mid:PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US">Thanks<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US">SaiKishore<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span lang="EN-US"> Ghimiray, Himal Prasad
                <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
                <br>
                <b>Sent:</b> Friday, May 10, 2024 3:14 PM<br>
                <b>To:</b> Joonas Lahtinen
                <a class="moz-txt-link-rfc2396E" href="mailto:joonas.lahtinen@linux.intel.com">&lt;joonas.lahtinen@linux.intel.com&gt;</a>; De Marchi,
                Lucas <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>; Brost, Matthew
                <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Konda, SaiKishore
                <a class="moz-txt-link-rfc2396E" href="mailto:saikishore.konda@intel.com">&lt;saikishore.konda@intel.com&gt;</a><br>
                <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Upadhyay,
                Tejas <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>; Siddiqui, Ayaz A
                <a class="moz-txt-link-rfc2396E" href="mailto:ayaz.siddiqui@intel.com">&lt;ayaz.siddiqui@intel.com&gt;</a><br>
                <b>Subject:</b> Re: [PATCH] drm/xe: Modify minimum of
                various scheduler timeout to 0<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        </div>
        <div class="MsoNormal" style="text-align:center" align="center">
          <hr width="98%" size="2" align="center">
        </div>
        <div id="divRplyFwdMsg">
          <p class="MsoNormal"><b><span style="color:black">From:</span></b><span style="color:black"> Joonas Lahtinen &lt;<a href="mailto:joonas.lahtinen@linux.intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">joonas.lahtinen@linux.intel.com</a>&gt;<br>
              <b>Sent:</b> Friday, May 10, 2024 2:39:56 PM<br>
              <b>To:</b> De Marchi, Lucas &lt;<a href="mailto:lucas.demarchi@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">lucas.demarchi@intel.com</a>&gt;;
              Brost, Matthew &lt;<a href="mailto:matthew.brost@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">matthew.brost@intel.com</a>&gt;<br>
              <b>Cc:</b> Ghimiray, Himal Prasad &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;;
              <a href="mailto:intel-xe@lists.freedesktop.org" moz-do-not-send="true" class="moz-txt-link-freetext">intel-xe@lists.freedesktop.org</a>
              &lt;<a href="mailto:intel-xe@lists.freedesktop.org" moz-do-not-send="true" class="moz-txt-link-freetext">intel-xe@lists.freedesktop.org</a>&gt;;
              Upadhyay, Tejas &lt;<a href="mailto:tejas.upadhyay@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">tejas.upadhyay@intel.com</a>&gt;<br>
              <b>Subject:</b> Re: [PATCH] drm/xe: Modify minimum of
              various scheduler timeout to 0</span>
            <o:p></o:p></p>
          <div>
            <p class="MsoNormal">&nbsp;<o:p></o:p></p>
          </div>
        </div>
        <div>
          <div>
            <p class="MsoNormal">Quoting Matthew Brost (2024-05-09
              19:00:43)<br>
              &gt; On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De
              Marchi wrote:<br>
              &gt; &gt; On Mon, May 06, 2024 at 07:04:47PM GMT, Himal
              Prasad Ghimiray wrote:<br>
              &gt; &gt; &gt; Remove the min/max configs and change
              minimum values of preemption and<br>
              &gt; &gt; &gt; timeslice to 0. The sysman teams must
              deactivate preemption and<br>
              &gt; &gt; &gt; timeslice to assess exclusivity mode. They
              depend on configuring<br>
              &gt; &gt; &gt; timeslice_duration_us and
              preempt_timeout_us to 0, ensuring these<br>
              &gt; &gt; &gt; values are set at their minimum.<br>
              &gt; &gt; <br>
              &gt; &gt; nack for now, based on this explanation. See
              below.<br>
              &gt; &gt; <br>
              &gt; &gt; &gt; <br>
              &gt; &gt; &gt; Cc: Matthew Brost &lt;<a href="mailto:matthew.brost@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">matthew.brost@intel.com</a>&gt;<br>
              &gt; &gt; &gt; Cc: Tejas Upadhyay &lt;<a href="mailto:tejas.upadhyay@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">tejas.upadhyay@intel.com</a>&gt;<br>
              &gt; &gt; &gt; Cc: Joonas Lahtinen &lt;<a href="mailto:joonas.lahtinen@linux.intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">joonas.lahtinen@linux.intel.com</a>&gt;<br>
              &gt; &gt; &gt; Signed-off-by: Himal Prasad Ghimiray &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;<br>
              <br>
              &lt;SNIP&gt;<br>
              <br>
              &gt; &gt; &gt; +++ b/drivers/gpu/drm/xe/xe_hw_engine.h<br>
              &gt; &gt; &gt; @@ -10,41 +10,17 @@<br>
              &gt; &gt; &gt; <br>
              &gt; &gt; &gt; struct drm_printer;<br>
              &gt; &gt; &gt; <br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
              CONFIG_DRM_XE_JOB_TIMEOUT_MIN<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1<br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX
              CONFIG_DRM_XE_JOB_TIMEOUT_MAX<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 *
              1000)<br>
              &gt; &gt; <br>
              &gt; &gt; previously one could configure a kernel with a
              different max.<br>
              &gt; &gt; And now it's hardcoded. How is this better and
              related to the<br>
              &gt; &gt; motivation in the commit message?<br>
              &gt; &gt; <br>
              &gt; &gt; is this commit doing 2 different things?<br>
              &gt; &gt; <br>
              &gt; &gt; 1) Removing the _MAX from config since nobody is
              or should change that<br>
              &gt; &gt; 2) Modify the min value to 0... That seems weird
              as basically there is<br>
              &gt; &gt;&nbsp;&nbsp;&nbsp; no minimum.<br>
              &gt; <br>
              &gt; This is true.<br>
              <br>
              Maybe I've missed some discussion but what is wrong with
              the previously<br>
              agreed approach where KConfig would determine hard
              _MIN/_MAX bounds<br>
              (and maybe _DEFAULT) that the kernel can work with, then
              there would be<br>
              sysfs min/max (+ default) which the sysadmin sets as
              comfortable with<br>
              considering the expected use-cases on the system and
              application then<br>
              choose within those bounds (if it wants expedited hang
              detection for an<br>
              example)?<br>
              <br>
              &gt; &gt; I'd like to hear Matt Brost's opinion on that.<br>
              &gt; <br>
              &gt; I chatted with Lucas and second his nack. The
              requirements for this<br>
              &gt; change are coming from sysman and are unclear. If
              sysman needs to set<br>
              &gt; this to 0 (akin to no maximum), why can't sysman
              build the kernel with a<br>
              &gt; Kconfig to allow this? This use case appears to be an
              HPC/AI data center<br>
              &gt; scenario in which the kernel is probably built with a
              non-standard<br>
              &gt; Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to
              zero? This needs to<br>
              &gt; be addressed clearly and publicly.<br>
              <br>
              I also thought we agreed on doing different build for such
              scenario<br>
              where the interactive desktop is not expected to be used,
              so larger<br>
              delays are more allowable.<br>
            </p>
          </div>
        </div>
      </div>
    </blockquote>
    <p>So you are proposing an server only build where it can be set to
      zero.</p>
    <p>Regards</p>
    <p>-Ayaz</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:PH0PR11MB5674E8EF849E5B47A847B70594E32@PH0PR11MB5674.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <div>
          <div>
            <p class="MsoNormal">
              <br>
              The default build simply can't allow unlimited blocking of
              the HW by<br>
              certain workloads in order to make sure the
              desktop/compositor stays<br>
              operational. That can only be enabled by default build
              when the long-running<br>
              workloads can be isolated so they won't interfere with the
              workloads<br>
              using dma-fences. And I don't think that code exists yet.<br>
              <br>
              Sysman should be able to report a feature missing from the
              kernel if it<br>
              detects that it can't set the limits wanted. This can be
              reported to<br>
              user via error code and/or error message asking to install
              a different<br>
              kernel build.<br>
              <br>
              Same strategy has been applied in the past for various
              kernel features<br>
              like realtime/virtualization etc. <br>
              <br>
              Regards, Joonas<br>
              <br>
              &gt; <br>
              &gt; Matt<br>
              &gt;&nbsp; <br>
              &gt; &gt; <br>
              &gt; &gt; Lucas De Marchi<br>
              &gt; &gt; <br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN
              CONFIG_DRM_XE_TIMESLICE_MIN<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN 1<br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MAX
              CONFIG_DRM_XE_TIMESLICE_MAX<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; +#define XE_HW_ENGINE_TIMESLICE_MIN 0<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_TIMESLICE_MAX (10 *
              1000 * 1000)<br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT
              CONFIG_DRM_XE_PREEMPT_TIMEOUT<br>
              &gt; &gt; &gt; #else<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 *
              1000)<br>
              &gt; &gt; &gt; #endif<br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
              CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1<br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX<br>
              &gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
              CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX<br>
              &gt; &gt; &gt; -#else<br>
              &gt; &gt; &gt; +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0<br>
              &gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
              (10 * 1000 * 1000)<br>
              &gt; &gt; &gt; -#endif<br>
              &gt; &gt; &gt; <br>
              &gt; &gt; &gt; int xe_hw_engines_init_early(struct xe_gt
              *gt);<br>
              &gt; &gt; &gt; int xe_hw_engines_init(struct xe_gt *gt);<br>
              &gt; &gt; &gt; -- <br>
              &gt; &gt; &gt; 2.25.1<br>
              &gt; &gt; &gt; <o:p></o:p></p>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------Smr7r7Z39txIcuuCxYPOGtXg--
