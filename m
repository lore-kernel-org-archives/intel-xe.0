Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB5CC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 08:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BE410F3BD;
	Wed, 29 May 2024 08:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJKaqZp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5168910F3BD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716972653; x=1748508653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uGm4sETBdnSeUMewSbGJPGBdVOJqPuSjBw8PplTQM9E=;
 b=WJKaqZp4S52Uf/ysAyzZwIHJelwpP9VsI1btzr+3krttzrhd3CGsv/oI
 34IptHKPfYY+NH2tquhN4y0F4elZCSXI8qnMO4J8xKSmUicP1VUnoE9x3
 fbTXp3+Je2c4/2r9kXq5r6Usd4hHssubeAqvNNeAadGKP3Zknu94hBFg/
 ymiKTpbTMKPOK9iVOQobqckBx6qf1jovI3V4kcbtpvT6QL/w45z/FLVDe
 PJjzp/K3euv9hNxG/Wq6ZOaeBbOmeCqSAhYl5SNNCmatzpobTR9BRLsct
 usUn9YATtQZ86gr8seq+uztSs74RO7nIquo+BpB+XdtsAwXr1fc3cBeqZ Q==;
X-CSE-ConnectionGUID: Gv/j31MxQb+8E+nSCy9hPQ==
X-CSE-MsgGUID: OH7Hi2DEQrCF8HFaOuuTEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13591065"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13591065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:50:50 -0700
X-CSE-ConnectionGUID: WQFGGWbtR3qthxkg3HAdKg==
X-CSE-MsgGUID: 71Fh1iC/R22k5gEi2phFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="40256652"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 01:50:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:50:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:50:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 01:50:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 01:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irAjNc8YWmxpBJeVfNYScRIltFmRFmjtRjBbmtMEKooz82l/SGkF/yymTMHhDkF8tZ7IK72wq8LZy6p2KuTIpEsbwPfvcluYMvjx7Bx1MaF8BGhMM4kaJc7Kf6X6CPRzGdyQDCSpNjXbIAd2yVsAOvOFBkcQOik21Rr2AYDJKi2V2rEkAjA/tpvNWkUYDeUj+Gy6ZP5ikWhf50kgtf7snqlzsCig8vBbXL1mhjXhfNb8N1k1y9SxXSIX+uKI+ndLBHdOrc4Iblqqmyecm5gmEOUxttxRmznTHmSgKZ6DFdpw+lVTnlH7v893m3KhILBITDI4ATbRHlUx/965HPOgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjlWWkhvuaQId6a58S5HxHtkhH6mtlShSRhhTxT6B/k=;
 b=UTU4D2uO2qfWTMIq9eQ42zvbhdbay3iY33G3LdERLE+MyFX/9ACOb1tsOAsLplAeTBrkRjsw7mhRsaawY2VwV4lRpJE4BeU7jxtV/6ZXunC5LKl305eAAaRQxDlx4t0BzqJsCMkuyBcYkaEqL1XA0/J9yI50aRAtO7NxHfJw8urdzQFM49MBzNEK6KuBNTXcTykmsT89YDyNFiY3+qxY54DXdZ75dxLnPrsA65xP9QtHhYxA5Av9Jq079xYE2Fu92mqmsjXcRbXxFwpwzuV0EnJKkFJ9Tq2T5MmZhRLeY8/kr9o62Q1TOe59hs0yfbQYwJA1oBnEJVrJsZgrF4CDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Wed, 29 May 2024 08:50:39 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 08:50:38 +0000
Message-ID: <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
Date: Wed, 29 May 2024 10:50:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
 <ZlYSzzsY5xepVreW@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZlYSzzsY5xepVreW@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 995530cb-b4a2-450a-a12e-08dc7fbc6993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEVwTXp0S1NJSmdqWlVDaWxDb3NFVFRWRVpQQ0RvbXZpVm42RVF0WHBTTDdm?=
 =?utf-8?B?YnMrcjlDQTBhVmxDbitoYnRHYUxSZjY4eExRWDZKaVVHckZGbkZHQ25xRkd3?=
 =?utf-8?B?aHhFVks1d2hmZGpBbU52T3FQTnRrcjdXMUNzSGF1aWZqb2p2YkF0Z3h5cTFY?=
 =?utf-8?B?b3Y2ckFLYjdRakNkbCtORXFqZmxOR0xJYjdBVm5MWVVseGZTeHV6aFhvaWtL?=
 =?utf-8?B?OXF1cW96NHZ0V3BTS1dxczFmaTNDMGhwYjdaR2tPK0RIYXJKQUFHRG5zUWxw?=
 =?utf-8?B?djZYYUUwbGw1Mi9qU0xmbnVQMzZlQmNqYnNOY0t3TWlURHJCdWwvcmMwR01n?=
 =?utf-8?B?RUlSMU5pZkltdHVudjlKRGdNZVpwUVNpdkM0V3pjenR4L0ZnS2dQaGhubExp?=
 =?utf-8?B?WjFCN0x4a1hlNzNCL1I4dkhXbWlFQkg5cDJtQ0l4V2p2ajB4eFF5S2hlQmhn?=
 =?utf-8?B?Lzdpa1lvTGtaNkt6LzN3eGU1VGpCcUJDOXltMVJkSWlVVmZHWkhrOU04aHJy?=
 =?utf-8?B?amxzdE5SWTB1SmpMSktiZ0xObmI4cTdneWxySTJ0WXJrSEhlcHRDdHJ1WFlh?=
 =?utf-8?B?ODk4L09BcDY4UXFVNXZVY0Jjano2eVdRdnBhVmhPaDRzaWNHZ0VSOEx6UkVB?=
 =?utf-8?B?SW9BSXYrZ1JQRzlGaWwyWVc1QnZZMDQxUy9NN1NBd3V0VytRM0EwR2pvMGhy?=
 =?utf-8?B?K2l5ekFXd0wvajZNaEpvTlpITUdGeFRYNGtQc3hTbmhsUUlsS0hFemIrRDJj?=
 =?utf-8?B?TGRKd3FUczVkTFZKNHg2V3ZvZkpkYTdjNm1uOVhmZ0VpQWF2NWd0SThsaUV2?=
 =?utf-8?B?WjQ0UnlVajRMSzlKc0tPb05ZcThBQkFpeE9UOTNTQTVjZkNJNVNsd0xIM01i?=
 =?utf-8?B?aE1DdTlXTW1aV256N24zY0xmdlUrdXlKWlJBeTY2SWFhaFRIMGEyaTFINTla?=
 =?utf-8?B?T0o5YXRuajZ5aEVCcVR3Wm5wMFMyaDBLeWF6czc2M0hqN1NvaC9md3hjdXUr?=
 =?utf-8?B?RnloNkdsZjA5SXhPaXMraDZ1dFl6d3NSdlN3c253Qkx1UnFySDUxKy9WTlV0?=
 =?utf-8?B?alFOS3RoaEJJNWd0cXk3Nlpqa3J5WDdSeUlxdW5xbmZ4eml1Q3AwdzhidEpU?=
 =?utf-8?B?U0hRbXdCVVdIRi9WYlpseWR1cXlqN3NJMHVzRDM2QUV0Zk5qVk1Bb3RqRVQy?=
 =?utf-8?B?T2FGQWROOHRCVTY4MXZtOWlwQU1EVlhwOTJGSFF0VEtJb2xBTjF0bUFhdFBG?=
 =?utf-8?B?VmdWakNLeFg4bmdNNnJCcEZtNm5mMTI2emVqNGJZaHpuZS9NK1BVK2Y0Qjk0?=
 =?utf-8?B?OFE5bHpnUUZRaFZDRnY3MVZaR016ZlhYdHlsdlhKUmxZWEFmV2FmMlhwZkJp?=
 =?utf-8?B?ZTRqaU5HS251azduTitXSU5JL09LZ1dCWXEzdE9IUGVZSVpyaFphQTllVVB2?=
 =?utf-8?B?ZWZYc0d5UlIrMTZvajJVVnhrVHUxUjlZeTYwdWtTSWpWWkdCdTkyS0lNUmNY?=
 =?utf-8?B?N2lDWjBqOWxYdG1Hbjk1QWJjS3VOUVRFQjhyVzYzV3RCSHBBb05yRkFIdkRE?=
 =?utf-8?B?ODhiY0tJbGVnK3Bzci9RSVNzZ3l6L05LRnFlNXBPZ1FyZTJ0b1lMUVNPV0xX?=
 =?utf-8?B?aGM1UnFhZEg4b0k1azJKbjRTZHI1Ukg5dlNzNzhYclRXZU04T2RySkRvdzhU?=
 =?utf-8?B?VmlUQWtydVYya3Jjb04vWGJHc0ZJVzhiOFB4OG1hZXJic0JybndrWjh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVAvV1BhYVBZcWV5aDF5c3BWNXNyaVNuUWc3SDVsT29IU2J2N2RjYitZT3hB?=
 =?utf-8?B?K0dieThoZ0hRTXVjdnhPd3VYOUpMN0dGaTA4RGhJcHl6Wmk3ZlpldmtIN1F0?=
 =?utf-8?B?cTBmVzIvMjMxb3RWMjlpdlZQSDE0RU8wZHVabHcyWVh0TXZKWlRDOWNLYXVk?=
 =?utf-8?B?ZERmcWw0S1dDYXdhTnhNZWQzUEh4b2FTVEtNblo2dDZwS1ZLYWtvRUdGTnlm?=
 =?utf-8?B?OE51eHZPNHg5Ti83eGMyNlJtSFNlRGpiSlBkd2poZi9aeFlvZ0VSOUdzSFZp?=
 =?utf-8?B?VUVTNHV6RXJWOWdWNDROd0VFRDRRRllRT1ZVSndjRFF5Vyt6MHkxdlRRWDdY?=
 =?utf-8?B?c1AxR0F6SkVRSHpGblRVRU9EZWkvekZlVDNIRkt5UmJFUkxQbXFQb2FuV3dl?=
 =?utf-8?B?U0lkZWVVYXRhT3BYeG1KUmJRR2VTankxZFJrLzJQakJKZXZvQWpDYk9lRUw4?=
 =?utf-8?B?dTZmWmNINnM3Q1cyc1p4a0dBL29DOWJ2ZUJPTm85ai9KTit6VHkvUmw4QnNz?=
 =?utf-8?B?dFlrampLemhWMnlUT3M5aTV3Z0ZxOFg4ejQrMnBJTEFXVWFxTzYwSTFZbDVK?=
 =?utf-8?B?T3ZXU20yWnRFeUlGRXVqbWVnSXdKT0xXTVEyY0JOTWlGWXFDdlhIZFFyNk9G?=
 =?utf-8?B?WFliRkQyY3pyUUlTWkFDRmNBSjZtWEJpR1J5TFhIWlN6bExqRmFKeGhKRnZy?=
 =?utf-8?B?M0FodzdaMmhNRm1aRGRFYzRVOFZ1cmdKZkp1aUIzVWMyTFpIL2o5MGVZUW5z?=
 =?utf-8?B?UlBJS0VxbTRKLzVtRDMvNzdMYTZKV1VPU2NHYjU2THhkcDZ2RDNOSmlNR093?=
 =?utf-8?B?RUwwOENHaHBERHNKRThFZkFBTVBRYzQzT1ljWEVTdllVaXcrTWxncDF3MDlo?=
 =?utf-8?B?bU5jM1BWdFMyTFNxaWUyVHhXbnFCa1pUYUtQZnRDNTdtWHl5RTM5NWZ1TG1p?=
 =?utf-8?B?NkRMdVVQZmw3WDJST1ViNi8vRnJLT1dXMkV3ZDdxU2crR0hNdVJUNW1BbEsw?=
 =?utf-8?B?SE14aS9YZzlQeEhXcHlHWnMrZ3hCMWRWc3VnMUl5Yk1sY1QyYk1uSGtidEo4?=
 =?utf-8?B?RnFPNFJRcndmaUFJM011OHZxZ1J1SXVHemVGZTE3RVd4a3hWcEdPejMxSTJ5?=
 =?utf-8?B?SHJJS0hDYXZxRkxqNWl6VkkwVWZFVEg0b3o5Y2gxUWhFMzl2eGVVNnNrTGI2?=
 =?utf-8?B?c0hnKzFmaFF0UHNUU0VYOHpYc1o1STBkVWJna1BzV0E2a3J3UG1FbFBzMVFw?=
 =?utf-8?B?enlueHF4VnkxWVd0Qkt5V3p6N0hXVDExKzN5ZGhYQ3NRUGtDMllIdWdVcXRv?=
 =?utf-8?B?d2dDUVFRTTdLV1daNUdzc1ZxSUQ3QW1iTFBzdmJPcDJ5bmZURG9GdmNLb0pN?=
 =?utf-8?B?WTRNU3dJbnFBZGhwU1A0TEVPRGg3cHA0dk93R0FPcncyOXpMeUZ4Ulljenlu?=
 =?utf-8?B?S0x0TWJoODd2S3IwU1lWbGlGL1dOUWpkdzdTUEhodVM1SVZjRkxZQ0lJRVFW?=
 =?utf-8?B?aWtCczhyRThWb0lyaFg3eHNpNU5xMkRRdk9pVzJ5UUpPaFdlMkFCSE4rVWQ3?=
 =?utf-8?B?NzVWKzJKaGprZC8vTWZSdmZzSUIvaEY1WE9MU0dwQitLZnNEckpLeUNlRmgx?=
 =?utf-8?B?SHpBL25VYWk3S2x4VXFJREg5YTFUdlRJT0NkcUZTSkxoUjR6UGpxaTFOUkN2?=
 =?utf-8?B?WUdoZ3I3clVHSFdpMldwN3ZKRk5uQUtkTkVFLzVMUmsrL3o1a1RDUzF3MXFh?=
 =?utf-8?B?YmFFQUFpV3FMOHA2UWdNNW9vQWl6a2FsWUhXdzVoczZtMzRHcDI3eDlVQVRr?=
 =?utf-8?B?QXFQellhVHlITEV1dGZkZVNUL21nNWR6WWpUTHp0a2MxZnVlQ2tvaU5VdE1R?=
 =?utf-8?B?S0V4S2E2VUFramcyUDF4S091a2NoM3J4WmRUNG83c2tFU0ZaRGdObzNja0ZS?=
 =?utf-8?B?eUUzdVRQdjNOQmN0K25MVjlycVk1OEsveUt6QlNJdVkxVEVMdG9ZR1lac3lV?=
 =?utf-8?B?eVpaejhFaURMZnhBR0l2bnZnTS8xcHM1dGJDMHA5NXdzb0I2L1F0M0Y3NEtD?=
 =?utf-8?B?cmoycUF0dGZkUU1yb0tpbjBJRXVxR01VdkczTGI5dXNpVy95SG9mSjVmZ2VK?=
 =?utf-8?Q?5bbBntdHXMPkHpVBogVvMLGY2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 995530cb-b4a2-450a-a12e-08dc7fbc6993
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:50:38.4047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkt1+TX0w81318fKldUd+GEQqppscsAGUY7okle7aI+fzXhmERQF5Z7JG8lgUqH1L9J+DonRAjPHav+v11JWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

Hi Rodrigo,

On 5/28/2024 7:22 PM, Rodrigo Vivi wrote:
> On Tue, May 28, 2024 at 12:11:32PM +0200, Nirmoy Das wrote:
>> xe_force_wake_get() can return error so check it's return value
>> before reading gpu_timestamp value.
>>
>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 4a19b771e3a0..0c13395ffd34 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   	struct xe_gt *gt;
>>   	struct xe_hw_engine *hwe;
>>   	struct xe_exec_queue *q;
>> -	u64 gpu_timestamp;
>> +	u64 gpu_timestamp = 0;
>>   
>>   	xe_pm_runtime_get(xe);
>>   
>> @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   		if (!hwe)
>>   			continue;
>>   
>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>> +			break;
> worth adding a debug/err msg?

xe_force_wake_get() will throw a drm_notice on error. May be we should 
add a __builtin_return_address() in xe_force_wake_get() to know the 
caller as

the current pattern seems to be to just return early on error ?

>
> but up to you:
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks,

Nirmoy

>
>> +
>>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   		break;
>> -- 
>> 2.42.0
>>
