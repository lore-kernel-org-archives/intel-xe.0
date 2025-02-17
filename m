Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C82C021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 05:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13C10E152;
	Mon, 17 Feb 2025 05:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxSYnJd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F37D10E152
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 05:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739769993; x=1771305993;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dUK/IoGuqjAmP8Rdt97Tu/9KBT/j7sdGUjttPg7aHuQ=;
 b=BxSYnJd7r79kH7TeNxWJ5aFGuO8ApYUdKJxCDxf9/7vbbQ0caudJrpO2
 BofvirlsjlNVMETjIRQ7iF3LN4mVTTVT2RDiuk7LilSnib6dSES+JZJnc
 imIbJM7Lvt2GwYuZ0d3PNJuW4EJk6IG0j4XmH5EyCdbDdV8mCkktVVgLD
 eR3OUfsTL/Xsq/4WjlBny3W0QGc6B8uoxYBULizCSRmc8x13vNOaIUM6S
 LR4EVi3tW2RR1YxdY4QX48y81SVSOIaAsCgS5C8CtFAZy6hf+Yd6ZhFOc
 ZzRhD38zAH34TQn2h/ppa1ITdmewUKVG3JqONP5LICQ9N1QtwMPbXBXA2 A==;
X-CSE-ConnectionGUID: lUmMHXCJRqu0QD+tujid6g==
X-CSE-MsgGUID: NmLuwbE5T+mih8iWzTtdmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43272090"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="43272090"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 21:26:32 -0800
X-CSE-ConnectionGUID: 1YKxBQAyQ9WO9c3e9KUEjw==
X-CSE-MsgGUID: mKIO76jFT6aQ2KuXxgQQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="113996649"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 21:26:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 21:26:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 21:26:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 21:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzeWchkeS72eYehFsgVybZUFZrA4UrahYNZSj6PwmcuF0JRDxYj/a2pClkTitv4AVPcNLbG+j1Nyz4529Nyub1fy2xe/i/6QYJLJGGRxgSPST4lXrk9Vx41BU32oTsDyn6m8wp+fx69JTcDWkGJ5X3uO2U8PwPzhIqLYwQwCfjhR707bTWOrlOHXSM1acun5Bem2emutMnICZ4FHcImSMchHauN1LA2pXyoThgT1ySD1OafiEzMWBG2RjnMg9NGBNYmqQu+kmBKxFbgK8QWG2iqRlHnQK+A/NyABsji0xqKII3c+FX8d05+S5RCAOm3KUrs4KZ8yUq3TYM5Pu66bHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd50WMKRCokd2mQwKdrOLZV1J5Z6WncYwtbDzAj+2GA=;
 b=eV/3WfAgdAoCFyZHN+9NpF9TPy7H9tL4jEwyI/3vAEwspjhVw0vCVDHczWyD1Cl3mZB+Zl/3tfb5p+/9op9zHdimUZOIVPm0jh1/OLo0hQaghfvADs1htMdTMPVOSz6uhdInU6+QXnvSWbXlUUnr64HLJXn9C6i4G5J4xqjZhXqH5eEh8DGMMN+2eewTBt/b2kacUhQ+IDfV+k5X7fwQRhel395iXm5L1uoojtJYatXIlUvgd/rwF/9GImlfD227YmUhaZt5Ja0SctsVFqBIC7ijseBJamkvyqKyITW0SGtzy++cZ9V5GVHTFPbrdRz/2FNJHS56W/8kVyWVWFxdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 05:26:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 05:26:28 +0000
Message-ID: <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
Date: Mon, 17 Feb 2025 10:56:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
In-Reply-To: <20250214212313.1767562-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d518bb7-3ba6-444f-5f2d-08dd4f13a127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dURscHJCYVlLdVVWL0t5Qk5yTU1FUHB3QUhVS3dtWDFCOElOd0NwdzhtUWdk?=
 =?utf-8?B?U2FnUnIzSkIxVHk3a2tLMGJyQUxhRG10Nmlrb2NQc0E4dktkR0hDVFkweG9z?=
 =?utf-8?B?QWNucll1MnpKbFBEZ1FBaEQ1dW1EM2hwTVg2VmlENEJFVkRodi8vYXEvOHls?=
 =?utf-8?B?Sk1JWUNncGxnTjVTaFpCa0NFT0p6aXdoUEkxR2JadHdCS1prMEYxOW5vbjBa?=
 =?utf-8?B?VVZLWWRyOFFLUVBvS3A3WjRTV2o5emtNTnVBb0RqdGtzODJiUW4wamkrU29h?=
 =?utf-8?B?T0ViYW1Iazl0dnlQbkp0M0V5ZkMwT0NuMlFZQWd0cmUrcFFBampReHkrc2pB?=
 =?utf-8?B?Y2hEb2xrTXNKNmlkV3F1aGNJMjFHN1ZXU0JxN21QNmRVTmJKVGErTTVqMXNW?=
 =?utf-8?B?ODdTdnZ6a01QNkRLM0RoSHpTeTBmZmxuM1dSL3ROTllTUEJyZDB2WUNFK1Nk?=
 =?utf-8?B?M2M4TkNGU29aN0xLMDM3b09mQmVDeVJ2eEJRSlpUVUpkUkJ6WTJHbFdySjM3?=
 =?utf-8?B?NXpNOUx1TlM0ZlBlK1ExTHQ4MHlTZXUwbjltNUxXYmNIa2ZHVTM3MkpCZ1Zq?=
 =?utf-8?B?UWFPK3M1YThGeEpiSU5kS2VYalRSZTZwUDVSbytaMnQ2R0IrbW9ERzJONktV?=
 =?utf-8?B?Qjg1UjVRSVBzak1haXFvRUszK3lRMHVLd2Y2OC9tOXZGL3dmd1laMG8rRGZn?=
 =?utf-8?B?M0V5Z3RqTGdtM00zSHdTU1AycDBzakJ6cERkQUphMWZPT0JjbEU3Mnc3cmla?=
 =?utf-8?B?UkN3Q2JlWXNtbVUzeWVMa2xIeEo1QnBuMVBBOENoSzBSSi9jd1BnTFVqWTdz?=
 =?utf-8?B?b3luOVpuZXlKOVdhTkJWM3QyRmZONm50a3J1WEczK2ZQTmw2TGtDWXR6Q0NT?=
 =?utf-8?B?ajk4eDgyeHBaV09xVzYyY2FOY0lHTm5JMXNsNUtPcFhkMGhxN0JzbmQxT21Y?=
 =?utf-8?B?OU84dkNQRUxlanUyTE1FUEJHekU3MUI0YThXNjlwdWJtNU4rZHFpNDVka0Nj?=
 =?utf-8?B?ZkxTSmMxZUhCdzdUWFBtQ3BqU1FLMHNObWZOVS9LTU5xcko5UCsyaHFJWEU3?=
 =?utf-8?B?cmhCam8wREJqVFpreTR2MEpzMWNjSGVFb3VPS1dKTlZURDMyTkM5OHp1SXZ4?=
 =?utf-8?B?aGY4eitmeXBibk1lb2FqTjJIdEd5NWhQTkVLclVuWWZaKzV1K3B5NkRUY0N1?=
 =?utf-8?B?R243Tk9wSWJrNVNGUjF5VXlIWkJJQzVkUnhodzk0R28xMTdIdDhKL3RBaXlY?=
 =?utf-8?B?MmFnUmRDVEl0djVhWVdoODZmaVdYbWVVM1hxbHoxZStNaHpCODJESDlWdlZo?=
 =?utf-8?B?UWZPVFFSR1A1c1ZsdENmV3BkM2NQSW42SlR5R1ZxdEhWWnFjWXhYVklHVVdY?=
 =?utf-8?B?Mi9tWHZ2a1p6aEhHTXVLdmpCTHpCMUVkZU1IdXp5aDRoa2x1cnlnVW82VmFL?=
 =?utf-8?B?SUNrZm9qaVk3Qlp4YkFqU3hEWlFTZUl2WW1qVkNNNno0Zno1anlYVDJnbEhp?=
 =?utf-8?B?V3JsU1NWcDlGbCthYmZ4T2pjTlpJbTcvY1FBTzNybE03d01CU21FbE9OZzlz?=
 =?utf-8?B?bWhRNHEwcWR3eDBsemVQYWRaVStZVUI1ekV5K3FVeUhrbGRwaDJINlJ6QmZU?=
 =?utf-8?B?anBEa2xSYWlzV0xORkJuWU1WZ1JYSE5UenhlNVp4Y0xSUXZiY1hMMWJzYkR6?=
 =?utf-8?B?RXYyaFZtcTJPOGlBN3JZNmEvQzRoQUFITzlrOE0xVjJGR0toemtJSklYM1Nz?=
 =?utf-8?B?QzQrcUQwQkZvdHdqTlVQcWNjQk9aZUhVaCtlcDM4Q3FUa2VQSFVkNHhuYk9G?=
 =?utf-8?B?UnkyNzdXRVpyVFdQYng4UkplNE1Wa2Qzdk1xU081MWZwdEZzcy9vdFovQ2JY?=
 =?utf-8?Q?lDR9S4HFyu2Nc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGYwcWZOaEtuK0hLWVQxUEd2c3JNUXhzUUtYOTVjbmRCSklsbjNOTUZDWTZQ?=
 =?utf-8?B?bXUzbnBXbFhZNC8wbkZZWkc3VDA3WVU3K3NRVHk4WFplZ2JVamVvQ1RpbXRi?=
 =?utf-8?B?ZmQ1b01tMjFRckxtTTJ5M0J1VVppREhBenYrbG9tQnhmQkNBZXVrSm9MNEgx?=
 =?utf-8?B?WGFheXVRZE1GVzd1OEkvdnIzZG54N3FGMCtISktIUmFjOGZvcjk3NU83TGpx?=
 =?utf-8?B?ejY4Zm1hV3dSWlc0WjcvdnpJZWNVYVZ4V1F3dzVxb0RkclNUUGo5cEg4RzFy?=
 =?utf-8?B?MW1RTWIyRWV0d1czWmpyZXVsSjNwTEwxQ1pheGFqQ29HTW1MK3FvRmwyVE1t?=
 =?utf-8?B?a3ZLWEk4NzJ4YXowUTF1WG82OWhuTlhhdlJVQWgrUU8rTnpNRStjUEhPbzRw?=
 =?utf-8?B?aGxZU2Vlbm92azN6N3o1bE80RFZhMk8zTDl1VGpDUnpqc292VEN4aEpRazRh?=
 =?utf-8?B?MG9VTWIzM2ptc3FXYVJrdFg4L1dWWFY2MGFWMllFa2lRYTYxOThMMld6WDh0?=
 =?utf-8?B?bnNpcFdQZklOWGc1aXJrOEtPZWNDSzFxa3lHRis2alhzaE9oZllHSmI2Q1lZ?=
 =?utf-8?B?OEZTeE56ZWVmclhPVE8yQlV1NWhBTnB0WXFQQUI3RnNHUVFMQ2l2b1VmTHN5?=
 =?utf-8?B?aTY2eW91ZlVid0xaTUVOTXl2Z0tsYk0vMGNUYWk2R2JqNzJ2a3RqQlBiNkRG?=
 =?utf-8?B?WUMxUldpRk5yTVY0RjNKV09BQmErTkVBTlh0RFg0SzNvSVZ4amJRZERLM1Na?=
 =?utf-8?B?UHZST0drd0taSkxLMGJPMW5VdDNML3ZtRnYyMmpQdXUxLzJJbVFGV3I0TWNs?=
 =?utf-8?B?NHdhWlEwMHphZWhBRWFzc3BPOU5WS3BRd0Q1MUMzSjhGMFFuZkJOQm12ZWM5?=
 =?utf-8?B?SUhlM2M0S0dCazBZTGhaVWpOYURzVGNlVUg4NDBaZXR1T080S3BDdVVNVDVp?=
 =?utf-8?B?Uk1uM0NaZGpTMVhSZ1d2Yy8rWEQ4eU5BVGVlc1MxNzRTN09rZVgwSm56cG1a?=
 =?utf-8?B?ekkrc2w0VUgrTTUrUzJHMkJzRDhKOXBTcCtMNm5JSUw1WTlBNWd3R1Eyd1Jx?=
 =?utf-8?B?TEhNenRQVDN2SWxaU0lNZkcwVitKUFp6ZFJxTjJYL3U4QXZoNW14NHJUN1M0?=
 =?utf-8?B?NmpJaVN3SG5YazVDdlRHb2JXMEdDRjFESUhpNUJ0NkdqQzdHN2N1NkRwbDUr?=
 =?utf-8?B?TUt5RGNOcUtFRDB4ODFJOU93aEZKOUYzSHA0cWwxYWVqWU1BK3UvWHFYaG8w?=
 =?utf-8?B?TEptdW4xVll4d01aTVR1SXBtMGZva1BYNVFaRVArak14Vit2SHQ3MHZsSjRB?=
 =?utf-8?B?aWJSTldGWVNaK3M1RVVsRUVDcmV6Z2xKUUhyZEFZSHBaMlNrVy93VFI2eW5z?=
 =?utf-8?B?S1d0L1o2RVVudlZhemlxYTBZaFQ3Zmt4VUNVbGZ3R0NGMlhqNFFaY3VqaG5H?=
 =?utf-8?B?K2ZzNlQwVnNleVRJRXRqV3gyZVkzeTh5Yk5ESFJFUXlQVjg5R1BLdi9pY05G?=
 =?utf-8?B?RmlZeGN0c1dzMHdBRUV4NWordUE3ckJuS01Qd2oyWTR3NXNYN2JQQnpTVFA1?=
 =?utf-8?B?VE1RRDNnem0veUN1ak1wR0IyQnRNNjFERm9abDJTaHFacGYrSXJGbFFiT0s4?=
 =?utf-8?B?M1RzUUw0aXUxdUtZUlpCc0N5QjdnOVdxVk1xRXNUbnZGL3hwY25vdzZ0QTZY?=
 =?utf-8?B?UTE0OVExVUtwVVJxNGxqMGlUVnJEVUhtUTNTUTg1R3ZMUmVUbXdxNmZwVmsy?=
 =?utf-8?B?UlFkMjNrOHJoMk1DUElOVHdGTS83RllGNENOcHNpcW4rSFU5NC9VV3VNd3Ix?=
 =?utf-8?B?Rk0vWlVMenQrV2lKaFJINVhacitESWpyNUVPdDZ2bWhaNXBjMHpyZTJacEw0?=
 =?utf-8?B?aitFM2tvU2hIUGJVSU5ObEthc3N1QVNJZkFTdGhnMlRrRGxBaUZJT0ZBckZY?=
 =?utf-8?B?N1VYcjM3czRZdmhiaVFyMnVoNk5ZTkJ6M0R1bVVHTVFpdVNlUDBNZ1BTZHpq?=
 =?utf-8?B?L2ZsdThkMnJud09ZczZtOHo0VFdvdTdabDhTOXEvNlhCSnB5eEtHY0RtQUxP?=
 =?utf-8?B?dzF2bWFmOUs0SVdvdEdKMlNwYW9Fc0k5RDJtK280Zi9JOWJ6NUI4a0h6a2o2?=
 =?utf-8?Q?qE6vys+hDLMjWLCxZUzlPOVBX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d518bb7-3ba6-444f-5f2d-08dd4f13a127
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 05:26:28.7166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIjfE8tnvCbRf7t1kBCqmFG1uYJUQxQjaWllLVusiOnzWDMTA6ia+t8GoKtExB8gxAkDcMY+gmHbhRsk9SrzNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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



On 2/15/2025 2:53 AM, Lucas De Marchi wrote:
> There's an odd split between xe_pci.c and xe_device.c wrt
> xe_survivability: it's initialized by xe_device, but then finalized by
> xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
> the flow entirely.
Hi Lucas

device_probe_early has other init calls that return error. And since 
this occurs only when pcode probe fails, added it there.

I hadn't added the fini in the devm_action because of the pci_set_drvdata.

As, the remove function is moved to devm_action. IMO it would be better
if survivability_init stays in the err condition of pcode probe because 
if someone decides to move pcode_probe to some other function, it would 
be intuitive to move this too

Thanks
Riana
> 
> This also allows to stop ignoring some of the errors. E.g.: if there's
> an -ENOMEM, it shouldn't continue as if it survivability had been
> enabled.
> 
> One change worth mentioning is that if "wait for lmem" fails, it will
> also check the pcode status to decide if it should enter or not in
> survivability mode, which it was not doing before. The bit from pcode
> for that decision should remain the same after lmem failed
> initialization, so it should be fine.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c             |  7 +--
>   drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
>   drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
>   drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
>   5 files changed, 48 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d88c0fddf0680..782ad564d0ba4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,7 +53,6 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_sriov.h"
> -#include "xe_survivability_mode.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_sys_mgr.h"
> @@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
>   	update_device_info(xe);
>   
>   	err = xe_pcode_probe_early(xe);
> -	if (err) {
> -		if (xe_survivability_mode_required(xe))
> -			xe_survivability_mode_init(xe);
> -
> +	if (err)
>   		return err;
> -	}
>   
>   	err = wait_for_lmem_ready(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 06dc78d3a8123..992ee47abcdb7 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>   		return;
>   	}
>   
> -	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
> +	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>   		ret = heci_gsc_irq_setup(xe);
>   		if (ret)
>   			goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 447eacb355d7c..c18c58447d9fe 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	if (IS_SRIOV_PF(xe))
>   		xe_pci_sriov_configure(pdev, 0);
>   
> -	if (xe_survivability_mode_enabled(xe))
> -		return xe_survivability_mode_remove(xe);
> +	if (xe_survivability_mode_is_enabled(xe))
> +		return;
>   
>   	xe_device_remove(xe);
>   	xe_pm_runtime_fini(xe);
> @@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	err = xe_device_probe_early(xe);
>   
>   	/*
> -	 * In Boot Survivability mode, no drm card is exposed
> -	 * and driver is loaded with bare minimum to allow
> -	 * for firmware to be flashed through mei. Return
> -	 * success if survivability mode is enabled.
> +	 * In Boot Survivability mode, no drm card is exposed and driver is
> +	 * loaded with bare minimum to allow for firmware to be flashed through
> +	 * mei. Return success if survivability mode is enabled.
>   	 */
>   	if (err) {
> -		if (xe_survivability_mode_enabled(xe))
> +		if (xe_survivability_mode_required(xe) &&
> +		    xe_survivability_mode_enable(xe))
>   			return 0;
>   
>   		return err;
> @@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	int err;
>   
> -	if (xe_survivability_mode_enabled(xe))
> +	if (xe_survivability_mode_is_enabled(xe))
>   		return -EBUSY;
>   
>   	err = xe_pm_suspend(xe);
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 04a341606a7c5..7ba02e085b5b1 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct device *dev,
>   
>   static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>   
> -static void enable_survivability_mode(struct pci_dev *pdev)
> +static void xe_survivability_mode_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct device *dev = &pdev->dev;
> +
> +	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	xe_heci_gsc_fini(xe);
> +}
> +
> +static int enable_survivability_mode(struct pci_dev *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	struct xe_survivability *survivability = &xe->survivability;
>   	int ret = 0;
>   
> -	/* set survivability mode */
> -	survivability->mode = true;
> -	dev_info(dev, "In Survivability Mode\n");
> -
>   	/* create survivability mode sysfs */
>   	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>   	if (ret) {
>   		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return;
> +		return ret;
>   	}
>   
> +	ret = devm_add_action_or_reset(xe->drm.dev,
> +				       xe_survivability_mode_fini, xe);
> +	if (ret)
> +		return ret;
> +
>   	xe_heci_gsc_init(xe);
>   
>   	xe_vsec_init(xe);
> +
> +	survivability->mode = true;
> +	dev_err(dev, "In Survivability Mode\n");
> +
> +	return 0;
>   }
>   
>   /**
> - * xe_survivability_mode_enabled - check if survivability mode is enabled
> + * xe_survivability_mode_is_enabled - check if survivability mode is enabled
>    * @xe: xe device instance
>    *
>    * Returns true if in survivability mode, false otherwise
>    */
> -bool xe_survivability_mode_enabled(struct xe_device *xe)
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>   {
> -	struct xe_survivability *survivability = &xe->survivability;
> -
> -	return survivability->mode;
> +	return xe->survivability.mode;
>   }
>   
>   /**
> @@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>   	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>   	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>   
> -	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> -		survivability->boot_status == CRITICAL_FAILURE);
> +	return survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE;
>   }
>   
>   /**
> - * xe_survivability_mode_remove - remove survivability mode
> + * xe_survivability_mode_enable - Initialize and enable the survivability mode
>    * @xe: xe device instance
>    *
> - * clean up sysfs entries of survivability mode
> - */
> -void xe_survivability_mode_remove(struct xe_device *xe)
> -{
> -	struct xe_survivability *survivability = &xe->survivability;
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct device *dev = &pdev->dev;
> -
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> -	xe_heci_gsc_fini(xe);
> -	kfree(survivability->info);
> -}
> -
> -/**
> - * xe_survivability_mode_init - Initialize the survivability mode
> - * @xe: xe device instance
> + * Initialize survivability information and enable survivability mode
>    *
> - * Initializes survivability information and enables survivability mode
> + * Return: 0 for success, negative error code otherwise.
>    */
> -void xe_survivability_mode_init(struct xe_device *xe)
> +int xe_survivability_mode_enable(struct xe_device *xe)
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
>   	struct xe_survivability_info *info;
> @@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe)
>   
>   	survivability->size = MAX_SCRATCH_MMIO;
>   
> -	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> +			    GFP_KERNEL);
>   	if (!info)
> -		return;
> +		return -ENOMEM;
>   
>   	survivability->info = info;
>   
> @@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
>   	/* Only log debug information and exit if it is a critical failure */
>   	if (survivability->boot_status == CRITICAL_FAILURE) {
>   		log_survivability_info(pdev);
> -		kfree(survivability->info);
> -		return;
> +		return -ENXIO;
>   	}
>   
> -	enable_survivability_mode(pdev);
> +	return enable_survivability_mode(pdev);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index f530507a22c62..f4df5f9025ce8 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -10,9 +10,8 @@
>   
>   struct xe_device;
>   
> -void xe_survivability_mode_init(struct xe_device *xe);
> -void xe_survivability_mode_remove(struct xe_device *xe);
> -bool xe_survivability_mode_enabled(struct xe_device *xe);
> +int xe_survivability_mode_enable(struct xe_device *xe);
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>   bool xe_survivability_mode_required(struct xe_device *xe);
>   
>   #endif /* _XE_SURVIVABILITY_MODE_H_ */

