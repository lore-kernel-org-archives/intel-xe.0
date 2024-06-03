Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91010C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC710E3D0;
	Mon,  3 Jun 2024 19:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSHKVbHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275710E3D0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717442811; x=1748978811;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dq8kWdcdKUjdlkQuQoliCu+GgQQzFfhet2DGC/goCyM=;
 b=iSHKVbHum0dLse4xCPnQmNxMBIY5b6//ms91P+WLhwv8SzbvTdxWwWCi
 8RViZo0P4DOdSOBKCiLY+h9CymbqWJtUjRkj0XDyy2jwo5jAiiOpstwtX
 VXCqnat6rbZ7JOFmzX+KnCqk3zX4nISUhtisr4nmmvBwd6fzqG3y7NXdM
 Qu0CU79um3yaCwnIfj8sdmfOCWk/ZI08mmwlRLsDebqNkq0NBSS/4Wf8c
 WHpQlSlfemcPyDBeNcdh8ZFSzOCQxr5Paz/X++pmMrhIl8zzNM4XsAfST
 HX3m8Jl1GbO21pdrbS5uzckgwiudGuTmZnaPBbKpj3VTVQsx9Btm6nXJo Q==;
X-CSE-ConnectionGUID: BtQu8f/MRSuCgAT45wWtyg==
X-CSE-MsgGUID: KxfvoPIdSwuc+gfuJHLuXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25354888"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25354888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:26:51 -0700
X-CSE-ConnectionGUID: Q/wtBx+6S/uVHA+O3yFT7g==
X-CSE-MsgGUID: wtI5OH+EThS5KQd10Exv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37092181"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 12:26:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 12:26:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 12:26:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 12:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBzn7IGCVe6uTe0lu1CLSRAaaGtj5PoLHe9cH6KjC2W7TcgPyq6GnqnorYkT9rFOswO1T2Iip/7xeP/gHjeTp+Qb/youxA532AIRjtX556IkxVqAOfI5zUOroessNBVknUVEoBmFnheWldnI1O6IZx4+bA24B/Fb8uyGxJBQDV+Bz6JDmpsswrYucFDNeNvW6V9l9nnLBzIJMVubXAgFoY+N7RsZnbvfm1FMur0mrpZHPQh86tcgfsyvoYmbIRzEDfaT87t4scp8gfM/0Hc6/alrhqlSGv4AmyOR31vP3hdE7NSVqZL6+XnUCKAk3aTTUy0DLZ0kUWSil2wafvQY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxhSKY+ozD+20cMJuGo+nNy8n188dTZffyKF95vOwvg=;
 b=WCRnthbRku6QeZU24cmFHJsLODAC6Q69GFwlOvDUYOCGKb7R63w8RmcZd29QO7PMBB19YcQ8udI4BLjPXr9g/g8A3a91Mh5mthkzFrL2UXHfeHGtd8AgOoVpvvAOQbbsrhwHlIeLlMD3SZlodWzPrgRQVIaGM2yUHbrc9ILZ3pHg0rCxK16zlR0Ren532QhEPIgB0oDRwohzCEKq3C2EVBNcpsXceCYdW64r3BDuKh0XfAQ3wchbUorrcSARcZLCrOh3pPkRkSKXBqCF51ZawN6EmzvGx6RAZwug5Xs8rCXpzquUp/++iAaEFa5Q6OjwKOx7VO6xXU4HAi7pfC78ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 19:26:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 19:26:42 +0000
Message-ID: <29c5f614-4b45-47d3-9ea5-03747033f902@intel.com>
Date: Mon, 3 Jun 2024 12:26:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Request max GT freq during resume
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
 <1a85d036-42a7-4cd2-b015-98e7378461f9@intel.com>
 <bd32e680-e4ed-4269-a634-d97b2dafd968@intel.com>
 <248127cd-0ada-458c-bd07-2f2fa9d2e58a@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <248127cd-0ada-458c-bd07-2f2fa9d2e58a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: f503df06-d4d6-42ef-947b-08dc8403190c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUhzcGlVbXBhTmVWZzF0RFMxZm11T2RSL1V6a2Rrd05DODF2M2VmVjdmMnJs?=
 =?utf-8?B?aXpZTWc4aUxmYlFVQ05JalI4SXl5cGRtUjJVRmw0VTFqcWo0OW1LNFd1SHNO?=
 =?utf-8?B?N2hDbzM5ZnhRd1FXbm1GZzR1QkxJY2k1S2RlbzMxdStUZlNLOFJ4dWtOZ3VK?=
 =?utf-8?B?WFdQZlQ4VFlXaVF4OVYwM0RNc1NUcnRjME5raStMdkp0WnFBTkRXRFJwejlF?=
 =?utf-8?B?L04vYkZGazZTaVdhVWJ5RVlhL095RkozUjdncUtsQWlMUW1abWJVdzB6dWlx?=
 =?utf-8?B?ZVllMTl6c2lVdWlTb0xMME5YK1JqUzQxdFRDNDlQVEgrMXlrU1dxanl2ZE5o?=
 =?utf-8?B?NVpSS2dRdithbU5xTE1tQ1YxYTFXK1ZlWG5QWDdjdlBaNnc1alhxUlA5SDQ1?=
 =?utf-8?B?QmFwZ2hYYk1YN01sOXU2RXdHbVJnWmhaeERCT1FFeCtDYzdDYlhsU21lNXBP?=
 =?utf-8?B?SVlQMXdyY0paRDAyQ21XaXlJQVJiYlNGd2VDRWJNbkpjSm9jZFJueEQ5NVQ0?=
 =?utf-8?B?N1ZGenNJV0tJV2poQVRpV2RGV2c3WFd0Y3dJV0t0dmFGaEVWSVlxNHlDNkVS?=
 =?utf-8?B?cGk3clcvNThDVG9RVG1RT2VXaERVaFYwaldBeno1QWdsOTR0NFp6ekxzdDUr?=
 =?utf-8?B?ZEZsazlMbzJkdXFidjBOcTdqRTFqWncwUGI3bm1XNHZPVzlRTWdVdUErWHhj?=
 =?utf-8?B?WjVweXYzdXFlNFBKN29yZ3RoOU5sNXMyeTF6N091Q25SeTlIQ2NLbHg0MkNq?=
 =?utf-8?B?VmxySHFDN2pRYnBxMW1VcWpxa0toWXU1M3lMOVJnMHhjY0d6Tm9HNk04dENI?=
 =?utf-8?B?bTNhNTM3VVZsYTU2SmVRdklGWW55M2w0b3J1WlBXdGpFeWVIWDdVcTNNdyt1?=
 =?utf-8?B?Qm9Rd0FpUk4wdFpsKzFSdWs1M241NFgvWXNJWlQyNW5IOC9paVJBRGdoTmJN?=
 =?utf-8?B?UFowdDNadmxuN1ZBLzdxelZ5R3lTemVqZE1IQ1RxUHgrdFp4Zmx6RmRDbitV?=
 =?utf-8?B?eWF0Z1gvNHJTdmhkME85OE51clpTbS9zWGI0YVpvRmp2U2Jab2cwYm1OU2c2?=
 =?utf-8?B?TFluOUI4ejJVbitrajJDR3NDYm1BblVyMVlvRG81MzhvcGpyaXpGQ1k4eFF0?=
 =?utf-8?B?cXJ5ZS8xR0lVanZ0R0lQLzYxYTJCV0ZpbmlsZm43a0VRci9DT3lhRHo3OG1s?=
 =?utf-8?B?ZVl6RjUyM2VLcnNmdFZrSzNhV3gxYnkzOWxrdk1VSzh4K2ZyL2daZFVUWmht?=
 =?utf-8?B?TVZoVnBQTDlCNFQ5cGptckxJUWg2Q25GUVJPNFYzR0JRNldiRllEMVVBTnZN?=
 =?utf-8?B?NnBhOUFTQ2h3SjBqOVpXRXJTakhsb1V0emtTak0wNGFNeVp5d0FRakFveEtq?=
 =?utf-8?B?cGVZa1JEL2dYNVVmbG9ZN2JQc1RGaXBzYVFMcEM3NERjYWFjRDl1c1ZHczlX?=
 =?utf-8?B?dFhTVWpabHV6YXJkSVFOVmJyVno0ZmVFcSs0dklHR3J0N3ZmcnNPZVR4dEk4?=
 =?utf-8?B?U0ZBY21YRkRHc1YveGY1VzFUNVhpM1VJd2xjZEJENFh4OFBsd0FKUlg4TDRY?=
 =?utf-8?B?NStBVDVvSUUzRUhtTmZKWWRGL0JKVCtHcjNxZWhINSs4TGM4VVJLK2VNRzBN?=
 =?utf-8?B?dDRmcHpVQzFZbVFLTXY0ZlFnbUlZMS9zNnJtbFZUVExGZC9DclFsa25sRzRw?=
 =?utf-8?B?OE9LWXNTcThmZDF2cDlBUGxnOW5Jc3BkcHlaMER2OUswanh2NStNVWpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJCR1RmMFh6dUp1eE9rVTVUK3NSVXdMQjdON1ZadEQrYm1sOFFPUmtjL0t1?=
 =?utf-8?B?Zk1ZaGFSYWtGQjJjUXR2cFc3ZlcwcWdFeVZaRGV4S2lyZ3Rub2dtZGhWSEJI?=
 =?utf-8?B?cTdIUjBTby9GWXB2cUZnS3lRT3pWRnhPWDUveDMrNXdrZ2lRYTAyc3ZvSWNH?=
 =?utf-8?B?Qi8xUUs5emJFMDVWS0JSc3VFREEwakJaaGpIUzdwMUlqY1BGVXp6ZFJieWNw?=
 =?utf-8?B?bW1LdFhRRHp2aGgrYm1kL2Z5UTBJYnRrVis1RUVtL0loUDI5cW45YXcrL3JP?=
 =?utf-8?B?ODN5bXZRaVZHN1Y1b1pkTlNLODVuNjFCTzdnSVQ0UnZSZlc2YmZrYTJNcjRw?=
 =?utf-8?B?NUc5aHdoMXpYQVg4dFIwNXBUSUV5cXBCRjh4YjE3NDYyUUhqdkFRNitXYy9L?=
 =?utf-8?B?TWF1YTlwOWwrS0xoWk0yZGdIT1o5SkYvbldubWdhMUYwN0Rkbk1MelJFQmN0?=
 =?utf-8?B?OXp6dURSM2VXTGhaeWRBcHdXU3VuMnoyYXZPdG1EeVR5WnQvTmZCWXRQUURI?=
 =?utf-8?B?ZHYyZVF1UzdENlpENmJXRlBYcGNNZWRiTWhZZmR3L2tFVEIwaGJLMVNUY1p3?=
 =?utf-8?B?ZHFXaGtxVlVMSHF2M2t6anUzN3hQTDl1MDRHdlAxTFNJakFEMFZ6OU5oR3dF?=
 =?utf-8?B?VmphK04zVC9iSS9iZXZsVmYzdzB0UnAzNU9mMy9pWGdWS3h2KzJpOEhrNDBK?=
 =?utf-8?B?WTNCUkZYYmxIZ1ZCRGwwbk0zaEd0K3JYaG5BenA3U2lrS01qSlV3bkh4bnh4?=
 =?utf-8?B?MDVSZE9rTDhwM0tjWkt4YU5zN2FZS3NTS0UxbjlISmtrUHRsWGh0dCtHeFUv?=
 =?utf-8?B?T25DSzVSa3RvV2loYmxjMTYwZWloWnhjK3hTNzFuSjltUURkNjBUVW82RDB5?=
 =?utf-8?B?OFpqaEY2eXRqcjd0Q2NOTXBxdVRpZEFkaW1HcmtKUVppMmtDZTRNNi8xekRj?=
 =?utf-8?B?blJ1dlcrNHpjOXNjOW1IU0xZeUg0Z2prYjlRQXp6b2xVWUZocW1oOTBidUpp?=
 =?utf-8?B?b3gySkF3czZvN1BTVmZaTm9HcUVJSkRDaVFwR3hVNDRJNUxIN0R1UWVHUUxw?=
 =?utf-8?B?Rm1Fc0RVQzNNa0RKYWw2bFk1eWhWalcyMGN3YWkrbGVHRERtclJWQ1JRWWd4?=
 =?utf-8?B?K1JMa041MENxbG03eVRFWlhWYXVpd0pteWcyR3Z6NTQxL2M5cTd1TCtWNnZl?=
 =?utf-8?B?M0tCcUd1V3Rsa3BUcnRxMDh1ZUltS2JTWmFGZVFLbVR4eHp0NFBRYnVvSGJq?=
 =?utf-8?B?ZnphajNUQlk0RnF3Rit3elhTQnF6Q0JUaVY1NlZpdVA0SDJuU1ZyU0dGVjA1?=
 =?utf-8?B?dnVQZnhiY3l0SXFRcDBPY1UxbGp1a0NGVlVneXNMWmhkVWxieGQxM2pwK21w?=
 =?utf-8?B?eTJuYllUcDNyTVBQZUNPVGZVVkV3bHU3SWNtRFpkUDVNcEMzNnN6TmowQW8x?=
 =?utf-8?B?cGNBREhkeUJ5OG5hdnJqOWVqeHk3YS9KWW9NRjlCRnVpVm9zaFhWS0VLZzBU?=
 =?utf-8?B?Q2h3ZDhlT3ZtL0NQWnVRRXhyR3NsR2FxUEIyRnowejVLNnplUXJtNkJveHRR?=
 =?utf-8?B?SUxhU0pMaTU4QTlBVzFjdFMzL3Ird3RUb0tLZlA3UHpmTTRtSHJKQXNCU1dq?=
 =?utf-8?B?RDhkWVJjUzdzMjIxUWhjeStUaFNNMEtNY3k5Tno0ZHhzUDVlMVFZZUJ6b2tW?=
 =?utf-8?B?WmtaNmMyVmU2c3lETG9BZHpXYTFiY1FqRm5aRWp1UGtOSDkrd2V2OUNOSVBI?=
 =?utf-8?B?a1NaUzlCZGt3R3RiMDlZYUZQRlJpWjF6aTlTRUtWeUt6T2FtWWNaRVFJa1Uv?=
 =?utf-8?B?VnR6a0sxanFuNlV4aGRnVERUUWhmU09EcWsvNFZMZUZHd25meU1jaW9kdzBM?=
 =?utf-8?B?TXB1ZllaWjFyNTRpOU9rMHJxcmQzeHplODNwQTB2SlNJVFpiWkV2MFpyZWZE?=
 =?utf-8?B?UFNjbG5XQ3B0YnRwd0lva3R6a2xPS0F4cEFVOUNHcjRURnFIMk5obDhmUzJI?=
 =?utf-8?B?TjdTbHNhaDhDaVlPa0NweUZhMDZBRGJPV0M4RTFxWFJWQWo0QmU2UHdaUWdr?=
 =?utf-8?B?UUhmbk9YcHFKTXY5aVI2WVlvdS90WW10RWVyVjRWOHQxMnNIWEhiZ3RlQVhr?=
 =?utf-8?B?UzNkQ2VnRzJGdndobFh4eUN3K2pBL2NnQW0zeWszMXJPdkpuaTVOdkVqK2pI?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f503df06-d4d6-42ef-947b-08dc8403190c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 19:26:42.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIynlwfHAsLcuOXTFtkvzzvKbwh4uLr2f6fVWq/lYbUbL0i+hFePa3Xn4MSF99Liv9SOyuqbAJG0UNA7sCvfOPOvPrA4NpkvsejqS9OZi6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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


On 6/3/2024 12:17 PM, Michal Wajdeczko wrote:
>
> On 03.06.2024 21:06, Belgaumkar, Vinay wrote:
>> On 6/3/2024 8:28 AM, Michal Wajdeczko wrote:
>>> On 31.05.2024 23:42, Vinay Belgaumkar wrote:
>>>> We already request max freq in the load path, moving it
>>>> to __xe_guc_upload will ensure this speeds up GuC load in
>>>> the resume path as well.
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index f7886c00af01..63e1b685bd4f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -694,6 +694,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>>>    {
>>>>        int ret;
>>>>    +    /* Raise GT freq to speed up HuC/GuC load */
>>>> +    xe_guc_pc_init_early(&guc->pc);
>>> maybe it's just me, but usually we were using _init_early() name suffix
>>> for functions with some early, one-time, likely software-only
>>> initialization, while here this xe_guc_pc_init_early() seems to be doing
>>> something else and now it could even be called many times
>> It is initializing the internal variables to the fused frequency values
>> as well. It is still being called only once so far. This patch just
>> changes where it is called from.
> this is now called from xe_uc_init_hw(), so not once per driver load:
True, more like once per guc load. It is called 
intel_rps_raise_unslice() in i915, so might be better to call it 
something similar.
>
> /*
>   * Should be called during driver load, after every GT reset, and after
> every
>   * suspend to reload / auth the firmwares.
>   */
> int xe_uc_init_hw(struct xe_uc *uc)
> {
> ...	ret = xe_guc_upload(&uc->guc);
>
>
> int xe_guc_upload(struct xe_guc *guc)
> {
> ...	return __xe_guc_upload(guc);
>
>> Also, as of now, I don't see any other location where we could call this
>> from. If that happens, we can rename the function.
>>
>> Thanks,
>>
>> Vinay.
>>
>>> maybe it should be split/renamed to xe_guc_pc_boost() or something?
>>>
>>>> +
>>>>        guc_write_params(guc);
>>>>        guc_prepare_xfer(guc);
>>>>    @@ -779,9 +782,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc
>>>> *guc)
>>>>          xe_guc_ads_populate_minimal(&guc->ads);
>>>>    -    /* Raise GT freq to speed up HuC/GuC load */
>>>> -    xe_guc_pc_init_early(&guc->pc);
>>>> -
>>>>        ret = __xe_guc_upload(guc);
>>>>        if (ret)
>>>>            return ret;
