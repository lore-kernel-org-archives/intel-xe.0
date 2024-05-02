Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24178C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 13:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3510FA0E;
	Thu,  2 May 2024 13:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAlB9TUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6710F5E6
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714658209; x=1746194209;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=QkxC3pgCjOAcs15DmNMvCwGWfTusSz5fc6Pccc7edz8=;
 b=NAlB9TUWzOhV6oL0msqCFx5ZutVEm9Wc3VUtGi8xjC8QDtf2qT4VTNC/
 byr64Iy5J8T4Vk31ICrkWDuUUgKWZITmK4WmnZ+JdLt8Wt9BWPRmfxlkK
 NhCmB8IV1FliimvDxO2UVe9FMovc7xwcBZ+UyJhaHqWwZ6K+ls2X2D2LC
 lSUb4/BRbB8iKTNri/nmCOweXNxVCoc6QSYbI6m0srgr0RE98qFiFAVvj
 iCH/0LzFu4yHJTvRUqaUOj22+ugvSbJ3i3UtOrJ2gP2/NyV+dRt53apUE
 b4dMD9x6q+U/cGRwtwPxIz0DtILT3n9itkkduP5rZa76EqzzvCSCVV+sp A==;
X-CSE-ConnectionGUID: wzUFUUeTQAeEBp2hQmtxpw==
X-CSE-MsgGUID: CuZlcEHhTg2spu2vr2Uh7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10964414"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10964414"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 06:56:49 -0700
X-CSE-ConnectionGUID: MJ8DucIoTRWHaaOalewqiA==
X-CSE-MsgGUID: Mvk+wh0GTfeCwDURzWzYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31618407"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 06:56:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 06:56:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 06:56:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 06:56:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 06:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2WoBh0qYmNVnHYwWRaI0uDjVJy4IHFrhP1xjkXPvmN4ZYKkjNzeE2svPELs/mO2V5ePgi116zgQjFR/3sMbtJgEdaQyvDRPSdFKsGTbpQYZoF7vzwCC86Qd4X0Zp0VrmEpzsiDnhB9GJ9xL3E9uroVX1CVvyYfZ4OJlSeEWk3gCwQWwhYJ6Txxcuy92e1Wy1oR+c90g9BFRIaQrVV4vdpSToeiks4ri//Q7wVQqXZm6lk5qgXVJEgcWXrgebktgLHDfbFcX2S54LzgVyCMXEbFIFyn6batzpnyBNOnDBTuT42gVZMuvUu6X+gn+LEuFcAQWSKfja7LD9iw7+LdKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkxC3pgCjOAcs15DmNMvCwGWfTusSz5fc6Pccc7edz8=;
 b=Xbdyq8PN5WIWHBDYKxecZ7LHAFLOZIkhDZuUNRAnc9rJONJNbl46abkpPA9NLgGSJJ0PAukeRN5DODNjcwl0jyEiBpsxtCjNWtS+lkWQo40fZ7nUq8V2M38yO3AMsO7CV+p+0snKWWRpDUv9X0nFSuQz0x4BGt/EifSlCiXg5jEZVuzTxA2bQfByjApj67KQq16YWW/gAC+Ogg1IX3NSlUhNcUZ1kO14SP0GzxU3/T0EGDQx90HA94JLM56OEzEhr+u0P7xS0NsQhP5wk0VRdK2YoDJf4w/wNI2xboK+Gie1s7J5vnipNngty3UnWcYh6dDgTZCQR6Cg5ll1dK3IuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 13:56:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 13:56:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH V2] drm/xe: skip error capture when exec queue is killed
Thread-Topic: [PATCH V2] drm/xe: skip error capture when exec queue is killed
Thread-Index: AQHamv4scxz9cZrBrEeGBeQynuo+ZLGD+x4A
Date: Thu, 2 May 2024 13:56:40 +0000
Message-ID: <a869acfa2cad759a10330926274dc24b1b02e9f4.camel@intel.com>
References: <20240430131229.2228809-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240430131229.2228809-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM6PR11MB4562:EE_
x-ms-office365-filtering-correlation-id: 85816986-42f8-4a18-5f97-08dc6aafb11f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?d0lzdm5aRDNLK2xSUmJ0MnF4bXgvaE1ENElTWVlwZGpyUE9vOForc2RMRUVN?=
 =?utf-8?B?ZHFRNUJVbU5NREhOK0RpYm1LMGRyaER5dmhvS0tPR0l1RFBhckRaUzFnTXE3?=
 =?utf-8?B?RVMvcU1mQW56Umh2UFdXK3VKQktJa01vb2Z6Q3BZcmtmNFBueERZcHdpVWl5?=
 =?utf-8?B?RGJxa2o5OW0xZkhnbmNxOVpqK1laNUZYWWI5UUlaYnBvcVFZeVlzWVUwUUt1?=
 =?utf-8?B?RThRVS9lYUg4U29GWUJ1T3hWM1NBN0hFakNiRFRNQlFwSDNRNFhEeVhhMjNU?=
 =?utf-8?B?OURrRDZvWkp4Y0tYUkVmamJFZS9qRVJTeXJ3YVFVdnhTeTF3cS9vTXhBcGYr?=
 =?utf-8?B?NzF1NDZsaVlTRjZzdG9qS1dtb0JYS0hpYWNUWXdjOVBEMVRjQnFTbExKaUZX?=
 =?utf-8?B?V1U2bUdvd2hRYWM0WjEvR2dzUTluQWdwdXk3R1gzUlZneW5vZ3VDdzNLamNR?=
 =?utf-8?B?TXFrb2dHUXZ3Rzd4eDFUMlVuNGhWQU1vaUxla053RDZvWjhIQ3pIdzJyMzNk?=
 =?utf-8?B?aFpLYWphTGliY0NmL0V2UW43RGV5Wm1UeWNMbXR1RFUxaFpTRUxhdEswRW8x?=
 =?utf-8?B?dGV1SDJVYS9pMjVxMFdXS2JLb0E4Slp1bkNJVzZySjJFaEhTYWZVVlZ3YXM1?=
 =?utf-8?B?bnRQY2lET0ZuODFzY3g5QkpBYkZmR09zSnZCMnBsdXgydVJPYUd5NnZXMzQ1?=
 =?utf-8?B?MWpTRzl3RUlOZDhQd3ZjVTREdXplZXlQMHJHSnVJa1ZUNTNuSHhSZmg1ZW1T?=
 =?utf-8?B?SnV0QVVVSzhEalorSklpb3ZXWkV5S3ZQRndUOEc2YTlWeCtabTdGTGFGNi96?=
 =?utf-8?B?ZUFNMnU1VjIrU1ljNnpiS2RXcktiZ21TS09GMWZOTmZRSWszY3Bsazl3N1pM?=
 =?utf-8?B?eWVCMkUxUzNld1Q1RjBrWjN5THNFOTRBM1VmUWZaNWpXOTc4bHRXQU13SUJa?=
 =?utf-8?B?a2lBMDVsRkNDYzlLL1NGS0NHTFBPTzd0Y3VrN2lzSm1oaU1rTHVWMXZ6NHZX?=
 =?utf-8?B?WEhIZ2dKMnJtcVZ1RGp5NS9RWVVUV2NUcllQRWtoOW5pdmZtR1VqOHM1Y0xV?=
 =?utf-8?B?NTZiSmRlclBsRkxTTmNObkowU293azQzbE1nMmlMc2YvOE9TZjhmWTRTbTgz?=
 =?utf-8?B?eUJLbENhMUN1dkRkYW1TaXIwV0lHQnA2U0M0cEFyK1Z6R080eG9LRVpobVFo?=
 =?utf-8?B?NDQ1U1REMTI4WmhpZEZ5enlXYVNyTk5jK1c5OFRtN2dDQWhuYUVOd3JQMVhJ?=
 =?utf-8?B?WkZ1a1JoODUyK3N3NitYYkllTGdab1EvZEt4bk1OQXd0aE9OQUpzbm5BeklU?=
 =?utf-8?B?empENGQ2Ykd4TWNZTkM5S2VjUXZIM2lJV29LZmlVKzJISkdQNkxyN0NFK2tJ?=
 =?utf-8?B?aFA3a280RjhpZHR6K3R0L2QwMFJxSnFhaHJXMXNBcHJxYnFqMkJrdkNTelR0?=
 =?utf-8?B?bnFwczVkNGhOU2o3azhhSWdYV1pLTlA0Tmlrd3hiT2hWald1RGRDWlFTL2Rl?=
 =?utf-8?B?RnllcmtQbFE4WVJYY01hR3UyQlgwbDBHcWJTMXEvaEJwUFRDQ3RDdllzeWt4?=
 =?utf-8?B?OVdXMmowSzhrNk1aVnF3RWpYL3FsNXFWNm5aSGdTQXErV1l1eDZ1WjFDSDdm?=
 =?utf-8?B?UklzdHcyWU10T0QxMWdqOUdjVXlyV3hPRUIxMFQ1WkVFRmthaWx2ZHRRS3g1?=
 =?utf-8?B?Z1RobEhCMHMvdzdCd1JHUTd4Nm5EaURySElMSnQ5VDRpNEpsYlR4Qm53PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODZKSlNKeEVUV2xiNi95U1JzRWZsRGUxRzd6SDFaRzhjczY0OExhcGt3QXdw?=
 =?utf-8?B?bXArWU82Njd0NGVyNHZhS1E0b0tpNEI2U1FuNFVnb1dFc2c1QUNoK1EvMDZk?=
 =?utf-8?B?UTNzdXpvNGk4REZaZEVWTWxGWHpWMFNqVDVyblQ0OHZGL01TaHZ2ZjJLd1Js?=
 =?utf-8?B?czF6NGdMYWY0UnFQY0ZQVDhlQS9DTkdDTW05YTd6V1o5SkYzRzVrWUxwaGhD?=
 =?utf-8?B?TDl5cFRrWHZ1bk1XNFV2WUZsU0JvbExkUTV5cVZyYVFTM2VJeGxXMWFnZHBD?=
 =?utf-8?B?U0JRTmNYNTYraDFjOGVwMnplN0VSS0JCNWp1QUdFRUt3QTQwWlZkVW1lY0Vx?=
 =?utf-8?B?L1RPcHNSOWFQclExZHRkdzIrTUpxcGVJemVqNi9zSzZCeUxEUHRKMEMzbVlP?=
 =?utf-8?B?K002dldIZ3FUYXZwVVZaN3c3WkZIbVk3RnNtTjQ1a29QZXhPdk1UUW5oeGE1?=
 =?utf-8?B?Qmx6QWJGcW16bWxjUXdCYU1HQjkwTXB6Y05WcUVqa3FtSVk5c0xQbHhCVXht?=
 =?utf-8?B?NWFLWHYreXkxSGVvK2dldWZqLzVRbGlXOFJQVEV5U3FPUTIzeHpYNGJOWWtM?=
 =?utf-8?B?VFQ2Nzhrc2VwNnQycVkzV0FaSnliTjhaKzZFbjB2R2E1dWxZNDdFVlgzb2xl?=
 =?utf-8?B?RC9wQkRoSnhwRWgzNmMzVUR4cmV1cGlpcDhJSGdWUElZZjd5aEZYQU9GQjhT?=
 =?utf-8?B?bnlyeFpWb0xBc1cxSVdiaER6VWhyMDBoaVBzT053Lzk5QTFmRUhic09zc0VV?=
 =?utf-8?B?czJ1QStkcllKMnZOSU83eHhpNzRwMk5TOFpMV0RvOWIrd0dGcjExTytUcW8z?=
 =?utf-8?B?MlhFckVPQzRnMnk4K3M5ZkNmRUNpQWh6alZiSmJoSU1RbnQ4dGIwaGFNTnl6?=
 =?utf-8?B?eHRhWlp4Sk1GU05nNFdjb0xWR2lEZElySG95ZlFjRURZRUs1c0xyN2QrSWZJ?=
 =?utf-8?B?QkNROGlwaWZZckx4TkFzZG9WK2NabzEvcXhUNXJIeFd0d1hBQ1dLeEcyc2Mx?=
 =?utf-8?B?MGM4QnRXV0NzalVtQmM1c3BxZzdjMDNraXlTTmZCdUg4cHJicVhicVpXSXgz?=
 =?utf-8?B?R20vQlgrWHdaT0FaS0MxcEVmOXloNDFxRVp1a0sra1ROczJpbHR1czhRaS9J?=
 =?utf-8?B?RlRGN1ZwUDZVcTR2dWIxZVUzaUZ5b3JHT0dNMjdRalVxWnlDU3dpb2lFSTMr?=
 =?utf-8?B?SDdmMFlFTnk1aXJoNmswQ2Zld3d4ZUVjcFBoSHJWS3RoSWRBdWcrWWdvSjRj?=
 =?utf-8?B?bnBNdG1BNkoxbUxVYWF3Q2sveVY2T0hTRit1cnhRVGxXQkdQYlk0b0Rwb1Jl?=
 =?utf-8?B?N0dKOHJoWTlmWnRTekxkTEdGZEZJeE5QVTF1ZlhrbmY1MHc3Y28wZDQrVUxj?=
 =?utf-8?B?eE5IampEc2RQZTNmNlpZcWtnR3RKd1JMbHlpUWttSGJ3My96NlQ3YUhXNEZp?=
 =?utf-8?B?aHVXcVUxTExIQzNVMGVUbEs2enRlbTl3RFVSVXBjVFN1a1NDejZNMEY4YWhE?=
 =?utf-8?B?TGc2djZBRUR3blFJM1JMMTZpaHlVZTR0QWhFelNTTWpieU54d1ZSL2p0dHFY?=
 =?utf-8?B?SWRKSFUxaG02bDQ2ZCtHMGI2YnRQYTkxaDdUNDREdzRyMmJVZ3F0SjJobi83?=
 =?utf-8?B?OWRHUEt5UDBzRklRZnk0TlQycTJCUENYTC9VRUVJdTdnVEdDNUxOQURLREpJ?=
 =?utf-8?B?VnhoWnYzQkladXdLWENXY3ptOW8rSitjTzdwWERuV3hRSm9BdGlGTklSMTE0?=
 =?utf-8?B?Ni9tcUJ1THAyZW5neVcrSWtwdjdycTJkbC9BNUkxY1dlbWx0VVRvOU9HSnJS?=
 =?utf-8?B?QzhWNWgrUXZXWk9neTNmU04zdEppK2FUbkpycU53MFRYcUI2SURXaHdQMFJa?=
 =?utf-8?B?SjVrcFdCTW9EbUdsUUpYTUZYZW5YUGlXQ1BKQ1p4UDhQRW8ycUFmOHVsNWJS?=
 =?utf-8?B?M08wRWxaNGZIS0pnb0xKbUJPRmVMTTQzUUNmTGg1aFdPY3I1ZzBDTzBSWTRu?=
 =?utf-8?B?RjIrR2xsRkZwOVk4VnFhUDdyTUVPR3lrUC9Pd3d2UVJvKzdtTFBqcDZ6cUd2?=
 =?utf-8?B?cVdMclNMakQrRUJET0FyYWJ4ZVMraHhDaWlDUXd5RWFnZVlCU014MThiN3pP?=
 =?utf-8?B?QXhKdVA5UERLZTBaV3JKVEw1Q2FaRSs0a2xBTWdNMDIrekMwK1pFOE9valht?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C33FEB31E1F654D940F404E8A2655DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85816986-42f8-4a18-5f97-08dc6aafb11f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 13:56:40.2984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pC0VHvSl+hqQQjKfI17wrMlWcDwd/0Ltnw/6hrjIDI1/9T59pmoGZeVYHjLBCZ7VfjkuwDQ8PzrpL/BRwtZ1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
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

T24gVHVlLCAyMDI0LTA0LTMwIGF0IDE4OjQyICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToN
Cj4gV2hlbiB1c2VyIGNsb3NlcyBleGVjIHF1ZXVlIHNvb24gYWZ0ZXIgam9iIHN1Ym1pc3Npb24s
DQo+IHdlIGFyZSBnZW5lcmF0aW5nIGVycm9yIGNvcmVkdW1wLiBJbnN0ZWFkIGNoZWNrIGlmDQo+
IGV4ZWMgcXVldWUgaXMga2lsbGVkIGR1cmluZyBqb2IgdGltZW91dCB0aGVuIHNraXANCj4gZXJy
b3IgY29yZWR1bXAgY2FwdHVyZS4NCg0KV2hlcmUgdGhpcyBpcyBoYXBwZW5pbmc/DQoNCklyaXMv
T3BlbkdMIGRyaXZlciB3YXMgbm90IHdhaXRpbmcgZm9yIGV4ZWMgcXVldWUgdG8gaWRsZSBhbmQg
aXQgd2FzIGNhdXNpbmcgJypFUlJPUiogR1QwOiBUTEIgaW52YWxpZGF0aW9uJyBlcnJvcnMgaW4g
WGUgS01ELg0KVGhhdCB3YXMgZml4ZWQgaGVyZTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI3NTAwL2RpZmZzP2NvbW1pdF9pZD02NjVk
MzBiNTQ0OGY2MDZkN2E3OWFmZTA1OTZjM2EyMjY0YWIzZTE1DQpBTlYvVnVsa2FuIGRyaXZlciBz
aG91bGQgYWxyZWFkeSBkbyB0aGF0Lg0KDQpUaGUgcGF0Y2ggbG9va3MgZ29vZCBidXQgVU1EIG9y
IElHVCBuZWVkcyB0byBiZSBmaXhlZCB0b28uDQoNCg0KPiANCj4gVjI6DQo+ICAgLSBKdXN0IHNr
aXAgZXJyb3IgY2FwdHVyZSAtIE1hdHRCDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFk
aHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMgfCA2ICsrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiBpbmRleCBkMjc0YTEzOTAxMGIuLjJjMGFhMzQ0M2NkOSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC05ODAsOCArOTgwLDEwIEBAIGd1Y19leGVjX3F1
ZXVlX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqZHJtX2pvYikNCj4gIAl4ZV9n
dF9XQVJOKHEtPmd0LCBxLT5mbGFncyAmIEVYRUNfUVVFVUVfRkxBR19WTSAmJiAhZXhlY19xdWV1
ZV9raWxsZWQocSksDQo+ICAJCSAgICJWTSBqb2IgdGltZWQgb3V0IG9uIG5vbi1raWxsZWQgZXhl
Y3F1ZXVlXG4iKTsNCj4gIA0KPiAtCXNpbXBsZV9lcnJvcl9jYXB0dXJlKHEpOw0KPiAtCXhlX2Rl
dmNvcmVkdW1wKGpvYik7DQo+ICsJaWYgKCFleGVjX3F1ZXVlX2tpbGxlZChxKSkgew0KPiArCQlz
aW1wbGVfZXJyb3JfY2FwdHVyZShxKTsNCj4gKwkJeGVfZGV2Y29yZWR1bXAoam9iKTsNCj4gKwl9
DQo+ICANCj4gIAl0cmFjZV94ZV9zY2hlZF9qb2JfdGltZWRvdXQoam9iKTsNCj4gIA0KDQo=
