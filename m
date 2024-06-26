Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571DBC2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 03:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DDA10E111;
	Wed, 26 Jun 2024 03:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA2vhGuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4F610E111
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 03:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719371258; x=1750907258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TAun0K2XQGOW9SrQ46Dvg7mBRpdYu338acOM1b7f8Dk=;
 b=GA2vhGuItOzMqHZovIrV4i3PDmeyt9y9Y9hN4mLPP9aGRyn6kDWq7QFt
 XL5XVmXa45YYBBh1fbss+G7Ohtq29ePDJ/5oEs1YoG5XzkI5346QIO0r4
 zwHXmc7z5/kWA4Zw4C9ynqVj2/SGT7DPWCFA9+NXebirGlb1kEkPday9k
 hNdqxHqdebUgGVSlkr6uCmVb9UhcVpCbxGJjiFNfxrF8uo9VGeqg56hF5
 nl760Ym4NQ955gGxTBbh0uZfnE/2J5d4gJtRYh35SnHIHngAstRY0U80+
 fA5Zl5rwdcEzzc3rv6DQSkRwV0GfdhVN4cFWwuiTDxnvFWvJnx0U00xOm Q==;
X-CSE-ConnectionGUID: vZKv8QjlRXqs3BD4LEyVDg==
X-CSE-MsgGUID: EFlZe1cSSJye21t9GLwycw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16384550"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16384550"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 20:07:38 -0700
X-CSE-ConnectionGUID: vQP5ieHXRvieTxh9WYmKSQ==
X-CSE-MsgGUID: wEN2Wvd+Tpi8RBuF6KOhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48833649"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 20:07:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 20:07:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 20:07:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 20:07:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 20:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz7FangwqK5lBKBDP47tQgOhs+MTAeCV2jcChrkX268v47aqsiACostOpiYD7u+6hR1W1WtjAeBtncrmKz5z1ot5cTohB1wASs6ML9YxWPOhh/v81C96aFzo5vFnGShu6u7+ERqUrd42gyDXCXamGFm9o8mVz46yl8Ufjeh73tOWUadX30XGFZNvjAkJmq/VJalHfNetFKj1auKiPJcKh/KIfPGsAyI2CoXkB+Etm4ygJN/UJ+RLAw8HllXxS0xk4LC6a7LVteqDnHuKt86y4PxY3+HRmepdewnlvAGw0AjExhnbKR2mH6xetr1fCtEuGWadRrAr+yZL3nnbc3PfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlN8GxkjnuwRQrum7SL4GApuIZd834oquCsaaYVsaAM=;
 b=Z6/XSQ1VORnBpvEr7MYt70Fp0x/fdPz6Nyl60NyahpBvAlMht0IuzPqB/m7qIhrJSHduPYlVuo78ICH2bXk7K/DTyqO8bVLFgkqJwQ+45FES6ciOxVRfDCzT7X+p5hiY9lUV339i2FoY5xvLM8wkAVRrimO9qX1MEHwRhnQT/7q4wuYZ35727wEwFpIouS2U2g+UsJHhV74I+TOCIdgd5dWnpTxzXjm66WVsVIoFW3I7X0egiMImnGRKWao7JkAAsCHDurTT7olB4R6hqKDAttAzSaQ7AAkEBYrVS35hq2XXHm2b2G4ibsy6+9k0fGXzQ1NuJHmwZNf13pTMSH1H2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 03:07:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 03:07:33 +0000
Date: Tue, 25 Jun 2024 20:07:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
 the stream exec queue
Message-ID: <ZnuF81Eh7t8AK4KF@orsosgc001>
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
 <20240626021343.1054590-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240626021343.1054590-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b13b68-44d9-4fd5-4d50-08dc958d1f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJ2ditMNVRCVGp3UW1xaE9ORklDd2E3WUFGR1ZacGdLRXl2a3czL0JaNEdo?=
 =?utf-8?B?MWYxdjRiN1BrUFJDRjlhNk1FSm9pUnFtNllZU0NaOHVSTVdEV05HRm5WSXF1?=
 =?utf-8?B?VVVqejQ2NmhRNTMyZDRrMXgyOUFwQjJKV1hSUlRhUWxzditKTVkyV0tERm16?=
 =?utf-8?B?Y1hmS0s5ZFkxUlcwWHJwQ2orU2FCY2dtNkJGY0duNVpPV0RRb1d2UTladnBs?=
 =?utf-8?B?R014SzJXeUh3OTM5YlBSYXZhMGNSODgzWW1uNCtPeks4ZTMvcXRSajd2Y3VS?=
 =?utf-8?B?ZndML1NZbXVTS3B2Ui8zdmVGaUFXUFMzN3NUVnFLWDhrYVJDZ2RvdHJUTjM5?=
 =?utf-8?B?TmJTUnEvU2JoNkhqKzJNWFNNRHNHaWJxbG9sSXorTy9jbkJvTSthYkRGZ1pW?=
 =?utf-8?B?ckVmR3JtZ28xaWNRelRFZjJYNFhZaDMrQi9maHkzK1Bwejc1UzRpV0lMSTQx?=
 =?utf-8?B?Uk4wTVhjd1lCbEJzSzA1QlR2a0xSeGlCRG85QUhQcFpQT2k4WnpsSEtsQ0Zw?=
 =?utf-8?B?ejRvSXQ0dUN6SzBOZ1liWE9PbGFrRDlxZng4NUtKMTc2SHFjQmg4K1dkZ210?=
 =?utf-8?B?dXRCcWZuNnJZeks1WnlnZmY1dVZRUVRpcXRiRDlzR0YvZUZJUVAyMDJTZWsr?=
 =?utf-8?B?MmlMdFlkWjVzZHUrWXJiMnEwVTZ4UHc2TGQvQUI2VWhWbDlRaEQ1a2k2RTcr?=
 =?utf-8?B?eTB4aElIZ3NZWjI4dzRhdUs2WFNKUllNbjR0cllvRU94L0JETENwV25UQzdv?=
 =?utf-8?B?eEsxZERnbDc3Tkp5c3VlR3loUGQ4TkRFd3ZoWTlGelJWVXVLdHBrTmpGL1p0?=
 =?utf-8?B?YWV5NEdIYnVBbkV0ZnluM3RpKzBVNXBEampiKzVIdkRXYU56cFRSV1czdk5l?=
 =?utf-8?B?aC9SWTVPZjZZZkJmQWV3RFVDT0pVWUVWNUxDWCtCZk11VjI4bXl4RVpRSWYz?=
 =?utf-8?B?RjhWZ1cwSFAzU0J6ZUNjaHA3aWlqUzhONEl1dlIvM1pNN3dRaU5nTGZoV1Zx?=
 =?utf-8?B?OUhHU1hSMm11eU8waXZBUlE5YzBiMXRoLzBlSTJhUlZ1b1FlN2FxTmhFUXlZ?=
 =?utf-8?B?MURPSlkzTFB5TkNveWhuMjVmNldibVlmL2R5WVJTQ0M0cVZSc3A3cHR3dTYz?=
 =?utf-8?B?UHJyK0ZZSFBvUlR6Ny82ZHpCVkJOSDFpaHBnMDhjUnFqZWluT0UyMWdhcnpQ?=
 =?utf-8?B?ZXYyUmI0S1VVd25hMHYxeDFxckxiNXA0Ti82ZDF0NWNObnNUUUxQOXByeTJ1?=
 =?utf-8?B?TjBETldETmtTQkhGbVFKNGVrSHdMaWF0Q0FLOGU1U3lzZkM5ZEd0VUhxQmFR?=
 =?utf-8?B?aDQ4UXRQZnY2NThlUXdiemZFY0MveDB4L1ZiMGlOQXBBZ1hrVmMvOXBacXVk?=
 =?utf-8?B?eGVZcno5RWpKT0MwVy9hcGk2WWw0WCt3MnNOQmVteHdkSStqM3RBZzN5c2JY?=
 =?utf-8?B?Q04zTTZzbTU0UnNpMG5tTDhEUUlXaUlKUEkzQVYyVllyUFViSWhDSDBieUhz?=
 =?utf-8?B?bThTR1E4YmdCMXEwTkRNcW9FbTJKV1RpRml3QVZmQmRaY2pZUm9TZHlPdUpF?=
 =?utf-8?B?eVlIcERqMnkyaUMyYThmd3pnWnhCNm0vVUpzNUlxR252WnBJYUNHSjdOVUVQ?=
 =?utf-8?B?SitQRDJnZ3orZFVlbVFOMGVtMG1LbzhlTTIweFh1eWZsQWRDV3FaTlNyVzhR?=
 =?utf-8?B?cDYxdzNzRmtzNEdWTU1Jb0JPSjB1TWJtaW82ZXluRU1VY0liY3NGTS9kV3ln?=
 =?utf-8?B?ZHp2aEVudDE3KytsN3dES05ONE5yUTk0S0ZoMVVHOGFqOXprdGtuQnFLbi9Q?=
 =?utf-8?B?bEpvT3RFNlVXUGt1UnBwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkplNmVlVW02clNvK3VBc1hZdG10blRDWCt6TEs2bEJhaThXWkpLVDNmVWZN?=
 =?utf-8?B?TjYzN1F2c3QzY0JoSGFtaHFsYW9OUGZ1dnZ4OEx0ZGxzYnJ4VmRZRGordGFa?=
 =?utf-8?B?amJ3ZGMrK0dTaWhMOFBXK2V6bjJUQlBwTXJpOCtxR2llT1NyMDFDK2NSRnVI?=
 =?utf-8?B?YkRZaDQ2VEdsWUFieUVoeTRFUE5sanJ1RzNNbTA3YkJ2N0t0TDJmQU91UDEv?=
 =?utf-8?B?a2xrZlB4QzczaHRaUDUxT2pKaXU2VUtLR1lYcUxhMnBVY2l1ZVdSZXc5amhS?=
 =?utf-8?B?T0RlTUk1S3BqZFllQTF0MlE3YzU1Y1lubm1kTlI5WUU4c2taemNmVW1zcURm?=
 =?utf-8?B?RWxFdGpjRU1IbnA4UFYweDhsb0tydDd3YSsrSEd6K1VhK1JqU0NEQ1pveUlJ?=
 =?utf-8?B?WGRvNUdsb3lMZkNQMDE2bW1INHh3M3BPbWtRK1BTQ1NKc2hVZklJRzJHNzhS?=
 =?utf-8?B?c2pBU21RWHFMZVVLenorV0hacnlOS3pDaSt2dXBBbEdCWnNsVjBzUFRvcGJ5?=
 =?utf-8?B?YndPT2tsTXN4bDdGY0IvdkdTUjhGdXJxelFEdnduUGJxOW85MjlHaTFuV3Bp?=
 =?utf-8?B?a1pDaWllQXhURjNVNmRseVVsWmhDYVg0UXYreUdiZ3NUYyt4V3VQbWFhN3dS?=
 =?utf-8?B?Zzh1V0pzRzI1R000QjdvZ1BsczF1NjhDQ241cys2Vnd6aWRoUnMvMkxIdUF5?=
 =?utf-8?B?bHZnd3M3SGJQU1JPOWJOcUIwVjBNUXhUSEY5anlsZjhCakJ3YmdaeGlzMDJz?=
 =?utf-8?B?VUxsbDBHb3hRTmdjdzdVbGkxMnB2Rm55WUZIRVZQeDhGTHFHeGpjb3k5cWgx?=
 =?utf-8?B?ZWgvSDJyRm1vVmdpV1dkQmNTVmNjcjQ0TjZUcDAzQVdZc2U5em02L0dMWmt1?=
 =?utf-8?B?SVRuM1prZnI2UStoNWVxM3hUZElpazd2Qy9FRlU5b0gybW5veVpvbk83NDVD?=
 =?utf-8?B?V05FTUpJcGZqRFFxVkhlSWVBMHZEN2YrWHV2WmJLU3VNdVRxK21JcmZmcXRG?=
 =?utf-8?B?S0UwSHlEOWJkM1hZOXloMUxEaURRMi9XT3ZEWVh3ZURRZ08vZlBlYk5tVzBH?=
 =?utf-8?B?Z2JObk1jQWFyc3NxLzMxK25lTnB4Y3gvcVlWNitGYlFYdkU0MmZRSHQrcGJs?=
 =?utf-8?B?SVlOdzUwVVYwK0phMytXamY5UmlrK2JmVklRRUJBQ1NKNGdtd2NveVA1K0pF?=
 =?utf-8?B?ckNiZ2hGc01uaXVXVzE2dkNQTnZlTjRkOVB6RDBKc1NNbzhweWNtL05tbGlD?=
 =?utf-8?B?ZTcwZ0xmdzZtSGFlUWgrdHA4VlZaNmFCTUhidVl0eGRWRGhRMVVVU1Q4UXMy?=
 =?utf-8?B?ZmlmUnZONFF5WG9VOHdpdC9Gd0psTTBqbmhpNWhtK005UW1HZkY1RDhZaTgy?=
 =?utf-8?B?dWlTZDFHT2ZDWEx3MTltSEVnOW1TZ1N5eUp1NUdWaXU2WG9aaGxVOXlVMy9G?=
 =?utf-8?B?dUFrdlpQQjdFR2gyTVMxK1hrU3RLUmpEcXVMQWZ0L0JEWFVXUlJoM3haWGZD?=
 =?utf-8?B?MEFVNWx5R0M5YTBYVFA0bHNwS2dsY0dxcFdEY0R4cGd5Rk0vZzNxUUt3dUE1?=
 =?utf-8?B?MHlGaHBsdkJtYWNzbFBmcmIybWJhYTE4TjN6SGJpY0pnNHpISWZvQ1VXZmxv?=
 =?utf-8?B?dlZoZVFRYTYwQ2hEMjdaZ3pXSk1ydGRiYXpzVTZCUUJQZytRSzZUVjFtam5I?=
 =?utf-8?B?UXNESFg4eEpadmM1SFcxQ1h6bjVONFpOTlFqTVF2OE1MeEwyRE1jekZ0UGdB?=
 =?utf-8?B?a1pIMS9RdjQ0eDEyZldKNDQzSzBtRkxzcW9UNFQ1RHJ4dVQ5ZFNSemZkMUFz?=
 =?utf-8?B?S05iV2JCcXdXckQ5eVp1TThxMHd3NlBSeUJsWXBBQVJiRG9GeFJ2WmJUZS93?=
 =?utf-8?B?Zmt2eWduYVB3MThnUXZTUktqbjJjY1JrQWl1dzR3cy9hc0Z4R256ejdrMkE3?=
 =?utf-8?B?clFidzdBU3pmMG9yMVJHOTBvTVh2T210WitlR0tYbjFFQ0pTTTBNOWxVOUF5?=
 =?utf-8?B?eTg2K2ZnR3FoYWI2cEkzUExpcUxPQzNzaEZ0bVAxUkdKNllPU25oYU5FUmJS?=
 =?utf-8?B?QWRzOWIxVHhHaC9iaUNkLzdwNkxMQjJKbHZkdEt2enRPbk14YnRMb3NSL3kw?=
 =?utf-8?B?OS9PcVF0RkJkblBQRmRUc2taR3liMjF3SlQ2Rkt5T1lNTG92eXdXaHRZbEdw?=
 =?utf-8?Q?aSbpleol426j6VeQdgK/hPs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b13b68-44d9-4fd5-4d50-08dc958d1f83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 03:07:33.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+QdXfDXrJ5kMzrk9gOs41o9pOkwHT4qWhkcsXIRU8jShfeXxcSjqfGt1APz4i1n8gebzUCTZyXQgmlfzb7Gh/NLACnw5KF9JwItde7WNjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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

On Tue, Jun 25, 2024 at 07:13:43PM -0700, Ashutosh Dixit wrote:
>Mesa VK_KHR_performance_query use case requires preemption and timeslicing
>to be disabled for the stream exec queue. Implement this functionality
>here.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 70 +++++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
> include/uapi/drm/xe_drm.h        |  6 +++
> 3 files changed, 78 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index a68659fd5386..1147035af039 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -80,6 +80,7 @@ struct xe_oa_open_param {
> 	int engine_instance;
> 	struct xe_exec_queue *exec_q;
> 	struct xe_hw_engine *hwe;
>+	bool no_preempt;
> };
>
> struct xe_oa_config_bo {
>@@ -1013,11 +1014,55 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
> 		hrtimer_cancel(&stream->poll_check_timer);
> }
>
>+static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
>+{
>+	struct xe_exec_queue *q = stream->exec_q;
>+	int ret1, ret2;
>+
>+	/* Best effort recovery: try to revert both to original, irrespective of error */
>+	ret1 = q->ops->set_timeslice(q, stream->hwe->eclass->sched_props.timeslice_us);
>+	ret2 = q->ops->set_preempt_timeout(q, stream->hwe->eclass->sched_props.preempt_timeout_us);
>+	if (ret1 || ret2)
>+		goto err;
>+	return 0;
>+err:
>+	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret1 ?: ret2);

Maybe print both rets or something that allows us to know which one failed.

drm_dbg(&stream->oa->xe->drm, "%s failed ret1 = %d, ret2 = %d\n",
__func__, ret1, ret2);

>+	return ret1 ?: ret2;
>+}
>+
>+static int xe_oa_disable_preempt_timeslice(struct xe_oa_stream *stream)
>+{
>+	struct xe_exec_queue *q = stream->exec_q;
>+	int ret;
>+
>+	/* Setting values to 0 will disable timeslice and preempt_timeout */
>+	ret = q->ops->set_timeslice(q, 0);
>+	if (ret)
>+		goto err;
>+
>+	ret = q->ops->set_preempt_timeout(q, 0);
>+	if (ret)
>+		goto err;
>+
>+	return 0;
>+err:
>+	xe_oa_enable_preempt_timeslice(stream);
>+	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret);
>+	return ret;

1) I think the same parameters are also exposed via sysfs and they may be 
applied at the engine or class level by the user. I believe context level 
granularity is only available to KMD. Hence, for the duration of the OA use case 
(from open to close of the stream fd), how do you make sure that someone else is 
not undoing what you did here? 

I don't see anyone calling these hooks though. The only place where these params 
are applied to the context are when the context is registered (likely when user 
creates the queue). Better to have someone from GuC team or Matt confirm that 
this is okay as is.

2) The other aspect I worry about is synchronization between sysfs modifying the 
underlying scheduling params and OA trying to modify them at the some other 
time. The set hooks themselves don't use any locks and I think it is because 
these params are modified in select places where concurrency may not be an 
issue. With OA, we may have to do some sync OR at least rule out potential 
concurrency issues. Again, we should understand when these params may be applied 
outside of OA.

Thanks,
Umesh

>+}
>+
> static int xe_oa_enable_locked(struct xe_oa_stream *stream)
> {
> 	if (stream->enabled)
> 		return 0;
>
>+	if (stream->no_preempt) {
>+		int ret = xe_oa_disable_preempt_timeslice(stream);
>+
>+		if (ret)
>+			return ret;
>+	}
>+
> 	xe_oa_stream_enable(stream);
>
> 	stream->enabled = true;
>@@ -1026,13 +1071,18 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
>
> static int xe_oa_disable_locked(struct xe_oa_stream *stream)
> {
>+	int ret = 0;
>+
> 	if (!stream->enabled)
> 		return 0;
>
> 	xe_oa_stream_disable(stream);
>
>+	if (stream->no_preempt)
>+		ret = xe_oa_enable_preempt_timeslice(stream);
>+
> 	stream->enabled = false;
>-	return 0;
>+	return ret;
> }
>
> static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
>@@ -1307,6 +1357,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->sample = param->sample;
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
>+	stream->no_preempt = param->no_preempt;
>
> 	/*
> 	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>@@ -1651,6 +1702,13 @@ static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> 	return 0;
> }
>
>+static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
>+				struct xe_oa_open_param *param)
>+{
>+	param->no_preempt = value;
>+	return 0;
>+}
>+
> typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> 				     struct xe_oa_open_param *param);
> static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
>@@ -1662,6 +1720,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> 	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
> 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
> 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
>+	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
> };
>
> static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
>@@ -1766,6 +1825,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 	if (param.exec_q && !param.sample)
> 		privileged_op = false;
>
>+	if (param.no_preempt) {
>+		if (!param.exec_q) {
>+			drm_dbg(&oa->xe->drm, "Preemption disable without exec_q!\n");
>+			ret = -EINVAL;
>+			goto err_exec_q;
>+		}
>+		privileged_op = true;
>+	}
>+
> 	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> 		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> 		ret = -EACCES;
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 706d45577dae..540c3ec53a6d 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -235,5 +235,8 @@ struct xe_oa_stream {
>
> 	/** @oa_status: temporary storage for oa_status register value */
> 	u32 oa_status;
>+
>+	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>+	u32 no_preempt;
> };
> #endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b410553faa9b..12eaa8532b5c 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
> 	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> 	 */
> 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and timeslicing
>+	 * to be disabled for the stream exec queue.
>+	 */
>+	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> };
>
> /**
>-- 
>2.41.0
>
