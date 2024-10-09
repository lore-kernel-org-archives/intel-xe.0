Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C737CF042D
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 00:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1F710E1A4;
	Wed,  9 Oct 2024 00:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWTfDD9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117F710E1A4
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 00:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728434561; x=1759970561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cAC7zO3dddMz8twEx7PzKlPUDUQIKq3wH3FXihzgQsA=;
 b=hWTfDD9/KUh17lA9z+SHxxDGU9bzdOckNm9ZZOHhTmvoy3S6Bbl8D0Ta
 kRkqsGNAtWYcGOgix9o9sUn27IU//WpXO9BrVjDmjd2ERnEvYx/vm1Pnd
 FE0Eut6FeA6GQbm9EnQpoAIC4/bWuuUwXVa1RXGOoYIL982l4i7+cJDqP
 N/dG7uH3pZQ4wUCHLC1JfuwVShX48n2BGMm+PHDxhOWb726Yi5xVDa5+8
 K+L1PTF5nf4HLL5lzizgLrMYHbvcA4ONo/jdxQyyjShuB9u8sPyNohWTK
 alN5Qvu/CUwgbtzPmZjeKSKICNcVnaNW7N+eVv2KabSXIK0xIkBwBdSM1 A==;
X-CSE-ConnectionGUID: QXmt39+tS4OW2ZfWmWbnGw==
X-CSE-MsgGUID: fmTVvKBMSYiwXfsipPSbXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27858864"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27858864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 17:42:40 -0700
X-CSE-ConnectionGUID: fNeibas5TJmhlgcKJvvpmg==
X-CSE-MsgGUID: Q3lQu8/YSm2osduu9S4Zlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76294855"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 17:42:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 17:42:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 17:42:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 17:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq+GyQ28Tk8S9jHWlAW33ICc/obnx6iTTJrK9xrDZQv1yfCVTAVm39vRFajJv06hAy4HTdQGxnH7dGdwWOaSerePOtRIJSN99mFURnrNKzp81EwXkSs7QyU1bEjNcR7U+/A5ioiZb11vPzsGCcBUNXc2n7PUbNFSFQwKcEbM/PRjj92+1zFQxNQ5fQLZcLwI2ae26j7pn1fZky1t15phx1VpCWtLLZxej8Cd+7v8hJr7fabeOtH7erCUDQCkjS54gmduulRzXi8zDeUaCuL1tu9CniDuF9SyTR2yuBJJn+x1FcdhH2pzlqpgHYlLhRolnmvDhOHdAQkCidPiW+J36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK5HfKviDdc78JuZQQMGAPWgDYg0btkcI3aiQbJWSBc=;
 b=CiVVyiNuFskqKfeWwk4iVhTGDCPnH+wJZ4vo466+78NOodINnPMJHjcGagUgwoTI1qw3s7mktvNflUkrHFNb60P/15u5UtQaVV7nD5G/cdZz5yYuk/9elTkWuXq2f+keOjZwNG/Vbe4QRtF31AZH2DPkwboWF6EIfgp6tmwv8AdqW3VKRRsRz2d2lzIr3fimPbaUjWEz2N5ZeyHcBO1ukr62qs4O/2jImArWlns1JDFnRpHVoMrP6uvm3SfRPaoP1pPO2+T04Qkn42v/DXQM42p83xNIXlgeKNxgmKYjDfxQ9ZPS7tvTICSzUlBl9FEBb8eGW9cLrmW+Iv18qhPQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 00:42:36 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 00:42:36 +0000
Message-ID: <29b4c644-f70c-4608-b8cf-7a24d8c6817c@intel.com>
Date: Tue, 8 Oct 2024 17:42:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-10-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb8fa7f-c173-4477-3bdd-08dce7fb44f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWdyUllzbWpHbEkzQlVsQTlJTVFVQmx3TU1xbVlEM2xmRVVVVjMyOUZnejBR?=
 =?utf-8?B?MDJCZHlzME9NM1d5ZUtWVWlBeEsrMktMejg2bXJWTStiWjdMWlZFVzdtY085?=
 =?utf-8?B?UFR2aFg1bG5XbForODR4WE1zR2xSbFRXQlRlZjY4VHI4U2dBWTc4WFBlSjFT?=
 =?utf-8?B?WS8yTDdBaGMzd1QzZXJ1ZEhGNUVEdGRiMlJJRkV1emJiR25EVDEwbTNzMW9T?=
 =?utf-8?B?UzYwSC8yY2M0d25TZzlYM3RDS0xhSXBjNlcrQUlua0Vod3hjSFM0K2o1Y3p1?=
 =?utf-8?B?UGdDUmFnYnNpSXpQTHpCcDFCbWRKRWx4ZWo5S1o0YTBMN1NISEdYRE9zdVo5?=
 =?utf-8?B?R1VFdGlvdzNjOVNmYnZGZWZSMTgyK3lWdGEyb2dWRDRaaXF0SFkwWTFPQUly?=
 =?utf-8?B?TEtmd1duNE44MnlkYk9sS01BWWR4a3ByVi9zcHl3QlhkL3pzblFjS3NOMlhM?=
 =?utf-8?B?dzh3eXBpQk0yMC82dWxIbmVuQW9GUlNWeXh0K2ZxRUh3Qkk0Y2RJZDNqSlln?=
 =?utf-8?B?VDNFbFU4dnZuK3NkRmNwRG0vL0VHSktzcDA2TnFRcnFiVWJyc1V6SUcrY2Nm?=
 =?utf-8?B?b0hvbnc2THFHTEdRTEVCc0lvcDVXRUhJN3ZtZWRwODFtVnh5SGNaYXVTTjhp?=
 =?utf-8?B?T1VmbXNWU0RIdlZTTG80N28xZjR4Y0t0V2ZqdWE4NC82TTk1SDI3TmtTaHVR?=
 =?utf-8?B?cG00d0lCNVZEYmVmWGN2T1UwakFvMllpZStnV2VhYXBYaUd3TVg5RUtkS1Fu?=
 =?utf-8?B?S0FnRWc0QnBRVVdzWWRlYXp3azlYbEFkTXhDS0ZNN3NpNmo3K3d0S1I5Slo4?=
 =?utf-8?B?eEhlbjJ6Q1NjOStuS2VOQlIzQWdyNjl3S2VIVU1Yd016YnBvdEpSSzQ0VFJJ?=
 =?utf-8?B?UlNjYm5wZllCa1dFTXJXT29KL3BDUkp6ZXhXUDd3WTdHNTZESkVCQktVSWdR?=
 =?utf-8?B?UUR6aUticW9TR0NQL2ZLc3ZMN2J1VTBNOG4wRnBldXBxMlErN09GV01ES3ZX?=
 =?utf-8?B?aG1tRDUzNmdKY2ppQzg0VUx1T2Ztc2hlZmx4OVU1UUxHTXhCeE5sNllwc3U2?=
 =?utf-8?B?d0YvZHFEb09rSnU4ZTFHZHE1cVR0VGJJd1IxSS92V1VIT0t5TWNJangrYytI?=
 =?utf-8?B?b1hOS2MwT3QrNDQrNjBPRWpqc2F4ZWNvQUtrOFFqQzdBWkJldVFCRnAxRkpk?=
 =?utf-8?B?dFFBYlcvMUxHZDF5NjJBTkxUUGFNNFBaVEl1dnhNdXFOd29xdCtuUlA1a0JH?=
 =?utf-8?B?N0gyTTVUMWd0aU9vUklZZStVdHVuMnRFQTdtR1BFM29WUHhvajBKQ0FEN3Ry?=
 =?utf-8?B?WjFwR2VRUXdnck5Vdk5lY1pnakJlK0t0bWlPZXFCamdSbytNZnhTc0VHNHJv?=
 =?utf-8?B?cDlmK1NXYnpZWHpRUTFwbGFVblpPcnNKakVXeTczZ2tqemUvSnpjbUJSMG91?=
 =?utf-8?B?Ymk4cWN4alVmU3p3dGYvQjRqbHBjK1NnZ2h0T3NkYTl5WDJBMlp3bk50NGY5?=
 =?utf-8?B?WHlDRkZLL2xLUG5RcThUaWJmY1ZPTWlDRHJ4QjdkVTBUZmlsaDI4b21MVFpj?=
 =?utf-8?B?RVdQdXFpbFBlbVovdGJ4U2FMcm5YRVd5eWN3d1JWbGRtdmE1T2F1a0pDQTNU?=
 =?utf-8?B?VXI0a3NDTjl1cmZ1ZWtUT0t0SnFTWXUyai8yelBsSGEwRVlScW1yTE4ySUJ5?=
 =?utf-8?B?YWg1dTEyYjFZaytGcDJ4T3o0dmptQ3p1ZzNKRFUzTDAzaXF2eUw4dkpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3lhUjdwSkhWY2EzcTlSL0VXTytML0VCcXRQZ0x1anhnTEFSNEtxR3BKOWh2?=
 =?utf-8?B?WmpSU3JGQUZHQ1VLajI0YUdkSlVFVFdHSFBOdjZQQWg2N3NZa3gzcncxMVF2?=
 =?utf-8?B?Ymp4UHllazVtelpZVkwzWGpMc0RwM2xlV0hrWERSMWJnY3BkSnZWMFZxQjRB?=
 =?utf-8?B?NTBkOGJuamh3Q0ZNQ3c1b0VKL1hER0lTTUNKTWQ0dGZWY3BkOUp4d1RDRWFx?=
 =?utf-8?B?aWNkRGxVMmhHY0tBazNvRDJmV1drT0wwYkF1S3ByUmFoOVpjM0JaVEpzZVlq?=
 =?utf-8?B?dWVSK01sMUhITGFlSlAvbEV4ZmNvenZCUXp5YTBlazB6QzcxZHFUTzE4dmNy?=
 =?utf-8?B?SzIyMGdQS3FCZkwwRm51cnUxaXFJMCtNTWVoeDdvL1ROZ2Q4elpNQzNoVE5o?=
 =?utf-8?B?Z2tGZWpOYUoyTEdJMWlaMVpZbnZmTVFEemwvcHJqVHBtd284UzFGeS9DUDJW?=
 =?utf-8?B?YkFucVhkM0hoQ0RqVzVtQ1hMQkdOR2JhTUd3RHVoblcyUW93TytINWpkU0h3?=
 =?utf-8?B?NCtKMkFkcWZacFg0S0JrZ1ZNN0dLdkdobkdXOWw1ZElaKzY0aFZuemcrQ0dv?=
 =?utf-8?B?cTBERVpCczJUdEpHODAwNXNuZXNXYWhHSVJrMURIYThMTlIrWktwenlienpY?=
 =?utf-8?B?MEtoVFI0NDRhOHV5cXQ5UVFBdzhqVHZvNTBGT0toalJSZUhyU3M1cVRHQnFE?=
 =?utf-8?B?RjFxUTdVOEpVL1Mrd3hNZmY3QmUvc1BFTlNQTkQ1elRVMmJ1aWo5ZFZ3ZmZy?=
 =?utf-8?B?ay9wbGluTXVtbHpvaUtUUnRodDExRUFnVzFhL1JpeXc4VHRCRitOcEh0YUtJ?=
 =?utf-8?B?RlRVNmt5TEZNYy9ocWZLc29JTkJpQ2o0QTF2U2hVcmU0K1FXMVN3MDVSQjZs?=
 =?utf-8?B?azdPMmt4TU50N1YzNWZIcUs3cXNQMnl0d1RiajMrUllJbnpPUWJRMmRnaEVh?=
 =?utf-8?B?RWlBZ0NSQXYxQzFDckpPWTJFb2FaakhhWVZxdGRoYlpmanBtMVlZRjcwUTJP?=
 =?utf-8?B?UHJhTTNtMHovTlRTM2grR25HZmdTOFNEczN3NzQrdFVQWTJ6VExPU0Mwekdh?=
 =?utf-8?B?ekVGRzF3cUdzYzJBTDV3Sk5VSGxQSmM2VUprVFFQdHZWbXdSdnN2VWN3Rmkv?=
 =?utf-8?B?TGZEU08yemJ2cG9UWU9Oa1MrYlNQb3hycXJKQzg5US9URVFFU0JtZXpNWVBh?=
 =?utf-8?B?dGF4QkxlbUhobTYxbHZ5Y0dJVFROVTZROG9ORTh1MGtpdUcrT0xkdStSbjJy?=
 =?utf-8?B?UjNoK2k4dFVRZXBXczNQUkd4U3V4dlg1Z3hkRndkNVgrNWllOWZSNkhpdnpZ?=
 =?utf-8?B?OFRkckZZVTlYdlZNK09mZHFFdWdNUWRQdVN5SytnQmZUU3ZaZDJ2aFFwRGMr?=
 =?utf-8?B?RmxEU2FNeE4vWEdvZHhOMWJCNUNDN09tQ3dwSkw3aEMyeWFXRnkwYWwxMXZ6?=
 =?utf-8?B?ZjYwaisrZ0hSc2M5R2lhaWRUSjJqeWw3cEU2TittZkl4ZlIyMXdGZXZkVmpl?=
 =?utf-8?B?TnNxb0JYNnVGdFVXTW82TFhiYzRUSXlPdnh5Zy8vUnFENzdsNTBLcjdTdWd3?=
 =?utf-8?B?MnNYMEs0c1lDSmoyblV6cWR2UElzRVB2NXB1ekNlUElPR2ttZmRJdk5Tbm44?=
 =?utf-8?B?KzZJT0FjcGlndjMybXp0NGdUYVdmb1lMOGhESFhMcmYrNkFFWlhYNTZWWGZw?=
 =?utf-8?B?bldSR3JRVlI3OEd3VUpOOGI0ZTVRNnZiV2ZxQVB4dHhWTUl2ai9iMkUxZTMx?=
 =?utf-8?B?QjFIaWRrY2RxL3V5RkVjUWtKY0pFQnNVU1JQLzZDMzJhNk43emlsN29zZnJo?=
 =?utf-8?B?cE94VDJhRDI2VDBDdWZQdmFzRi9UNXJoQWVMRUk2QkMxdHZ0RC9WWlZRV093?=
 =?utf-8?B?MHh1bnVpWm1RZEhVU1I4M2JjaUgwcjdOVlZHUnA1L2NGMjNMc2l5UFlrWnRV?=
 =?utf-8?B?M0p1UFR6NW40VEdtMUJQN2htSkdxNUtFdUlEV2llVGp1bERmRmpHaWNKZklI?=
 =?utf-8?B?TXB4MFg2dkxJbHowWkNNM2dsYTcrQzAyUkxhYllkL3Q5a2J1TEltemhGN0w4?=
 =?utf-8?B?d3VrUis4eTlnZk9nZW0yU3FWdlVFeDRlWEVBbC9QTkhYYzFtdCtjYTdwTEV3?=
 =?utf-8?B?MmV3R2gyMm5CdFMwTmtmQm5SdXpCeHV0VkVhUk9UcUF3WmZId09PUkh4czdl?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb8fa7f-c173-4477-3bdd-08dce7fb44f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 00:42:36.0721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlemmk+2cIMi9ajXycYiXr7xKU1aaLlyoYb0COs5p4mCnyRRsE+hyQSTT7MtDKAD4ZnlKv1bcJ0bdw2ELhOxC0EkXAqjW5OUcGyxchURjDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> The driver needs to know if a BO is encrypted with PXP to enable the
> display decryption at flip time.
> Furthermore, we want to keep track of the status of the encryption and
> reject any operation that involves a BO that is encrypted using an old
> key. There are two points in time where such checks can kick in:
>
> 1 - at VM bind time, all operations except for unmapping will be
>      rejected if the key used to encrypt the BO is no longer valid. This
>      check is opt-in via a new VM_BIND flag, to avoid a scenario where a
>      malicious app purposely shares an invalid BO with the compositor (or
>      other app) and cause an error there.
Not following the last statement here.

>
> 2 - at job submission time, if the queue is marked as using PXP, all
>      objects bound to the VM will be checked and the submission will be
>      rejected if any of them was encrypted with a key that is no longer
>      valid.
>
> Note that there is no risk of leaking the encrypted data if a user does
> not opt-in to those checks; the only consequence is that the user will
> not realize that the encryption key is changed and that the data is no
> longer valid.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   .../xe/compat-i915-headers/pxp/intel_pxp.h    |  10 +-
>   drivers/gpu/drm/xe/xe_bo.c                    | 100 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_bo.h                    |   5 +
>   drivers/gpu/drm/xe/xe_bo_types.h              |   3 +
>   drivers/gpu/drm/xe/xe_exec.c                  |   6 ++
>   drivers/gpu/drm/xe/xe_pxp.c                   |  74 +++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h                   |   4 +
>   drivers/gpu/drm/xe/xe_pxp_types.h             |   3 +
>   drivers/gpu/drm/xe/xe_vm.c                    |  46 +++++++-
>   drivers/gpu/drm/xe/xe_vm.h                    |   2 +
>   include/uapi/drm/xe_drm.h                     |  19 ++++
>   11 files changed, 265 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> index 881680727452..d8682f781619 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> @@ -9,6 +9,9 @@
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   
> +#include "xe_bo.h"
> +#include "xe_pxp.h"
> +
>   struct drm_i915_gem_object;
>   struct xe_pxp;
>   
> @@ -16,13 +19,16 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>   				      struct drm_i915_gem_object *obj,
>   				      bool assign)
>   {
> -	return -ENODEV;
> +	if (assign)
> +		return -EINVAL;
What does 'assign' mean and why is it always invalid?

> +
> +	return xe_pxp_key_check(pxp, obj);
>   }
>   
>   static inline bool
>   i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
>   {
> -	return false;
> +	return xe_bo_is_protected(obj);
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 56a089aa3916..0f591b7d93b1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -6,6 +6,7 @@
>   #include "xe_bo.h"
>   
>   #include <linux/dma-buf.h>
> +#include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -24,6 +25,7 @@
>   #include "xe_migrate.h"
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
> +#include "xe_pxp.h"
>   #include "xe_res_cursor.h"
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
> @@ -1949,6 +1951,95 @@ void xe_bo_vunmap(struct xe_bo *bo)
>   	__xe_bo_vunmap(bo);
>   }
>   
> +static int gem_create_set_pxp_type(struct xe_device *xe, struct xe_bo *bo, u64 value)
> +{
> +	if (value == DRM_XE_PXP_TYPE_NONE)
> +		return 0;
> +
> +	/* we only support DRM_XE_PXP_TYPE_HWDRM for now */
> +	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
> +		return -EINVAL;
> +
> +	xe_pxp_key_assign(xe->pxp, bo);
> +
> +	return 0;
> +}
> +
> +typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
> +					     struct xe_bo *bo,
> +					     u64 value);
> +
> +static const xe_gem_create_set_property_fn gem_create_set_property_funcs[] = {
> +	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_set_pxp_type,
> +};
> +
> +static int gem_create_user_ext_set_property(struct xe_device *xe,
> +					    struct xe_bo *bo,
> +					    u64 extension)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.property >=
> +			 ARRAY_SIZE(gem_create_set_property_funcs)) ||
> +	    XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY))
Two overlapping checks on the same field in the same if statement seems 
unnecessary.

> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.property, ARRAY_SIZE(gem_create_set_property_funcs));
> +	if (!gem_create_set_property_funcs[idx])
> +		return -EINVAL;
> +
> +	return gem_create_set_property_funcs[idx](xe, bo, ext.value);
> +}
> +
> +typedef int (*xe_gem_create_user_extension_fn)(struct xe_device *xe,
> +					       struct xe_bo *bo,
> +					       u64 extension);
> +
> +static const xe_gem_create_user_extension_fn gem_create_user_extension_funcs[] = {
> +	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_user_ext_set_property,
> +};
> +
> +#define MAX_USER_EXTENSIONS	16
> +static int gem_create_user_extensions(struct xe_device *xe, struct xe_bo *bo,
> +				      u64 extensions, int ext_number)
> +{
> +	u64 __user *address = u64_to_user_ptr(extensions);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
> +		return -E2BIG;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(gem_create_user_extension_funcs)))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.name,
> +				 ARRAY_SIZE(gem_create_user_extension_funcs));
> +	err = gem_create_user_extension_funcs[idx](xe, bo, extensions);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return gem_create_user_extensions(xe, bo, ext.next_extension,
> +						  ++ext_number);
> +
> +	return 0;
> +}
> +
>   int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file)
>   {
> @@ -1961,8 +2052,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	u32 handle;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> +	if (XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -2037,6 +2127,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		goto out_vm;
>   	}
>   
> +	if (args->extensions) {
> +		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
> +		if (err)
> +			goto out_bulk;
> +	}
> +
>   	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
>   	if (err)
>   		goto out_bulk;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 1c9dc8adaaa3..721f7dc35aac 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -171,6 +171,11 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
>   	return bo->ttm.pin_count;
>   }
>   
> +static inline bool xe_bo_is_protected(const struct xe_bo *bo)
> +{
> +	return bo->pxp_key_instance;
> +}
> +
>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>   {
>   	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index ebc8abf7930a..8668e0374b18 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -56,6 +56,9 @@ struct xe_bo {
>   	 */
>   	struct list_head client_link;
>   #endif
> +	/** @pxp_key_instance: key instance this bo was created against (if any) */
> +	u32 pxp_key_instance;
> +
>   	/** @freed: List node for delayed put. */
>   	struct llist_node freed;
>   	/** @update_index: Update index if PT BO */
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f36980aa26e6..aa4f2fe2e131 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -250,6 +250,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> +	if (xe_exec_queue_uses_pxp(q)) {
> +		err = xe_vm_validate_protected(q->vm);
> +		if (err)
> +			goto err_exec;
> +	}
> +
>   	job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
>   				  addresses : &args->address);
>   	if (IS_ERR(job)) {
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index ca4302af4ced..640e62d1d5d7 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -8,6 +8,8 @@
>   #include <drm/drm_managed.h>
>   #include <drm/xe_drm.h>
>   
> +#include "xe_bo.h"
> +#include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_exec_queue.h"
>   #include "xe_exec_queue_types.h"
> @@ -132,6 +134,9 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   	pxp_invalidate_queues(pxp);
>   
> +	if (pxp->status == XE_PXP_ACTIVE)
> +		pxp->key_instance++;
> +
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
>   	 * it to complete before queueing another one. We update the state
> @@ -343,6 +348,8 @@ int xe_pxp_init(struct xe_device *xe)
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	pxp->key_instance = 1;
> +
>   	/*
>   	 * we'll use the completion to check if there is a termination pending,
>   	 * so we start it as completed and we reinit it when a termination
> @@ -574,3 +581,70 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp)
>   	spin_unlock_irq(&pxp->queues.lock);
>   }
>   
> +/**
> + * xe_pxp_key_assign - mark a BO as using the current PXP key iteration
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @bo: the BO to mark
> + *
> + * Returns: -ENODEV if PXP is disabled, 0 otherwise.
> + */
> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	xe_assert(pxp->xe, !bo->pxp_key_instance);
> +
> +	/*
> +	 * Note that the PXP key handling is inherently racey, because the key
> +	 * can theoretically change at any time (although it's unlikely to do
> +	 * so without triggers), even right after we copy it. Taking a lock
> +	 * wouldn't help because the value might still change as soon as we
> +	 * release the lock.
> +	 * Userspace needs to handle the fact that their BOs can go invalid at
> +	 * any point.
> +	 */
> +	bo->pxp_key_instance = pxp->key_instance;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pxp_key_check - check if the key used by a BO is valid
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @bo: the BO we want to check
> + *
> + * Checks whether a BO was encrypted with the current key or an obsolete one.
> + *
> + * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, -EINVAL if the
> + * BO is not using PXP,  -ENOEXEC if the key is not valid.
> + */
> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	if (!xe_bo_is_protected(bo))
> +		return -EINVAL;
> +
> +	xe_assert(pxp->xe, bo->pxp_key_instance);
> +
> +	/*
> +	 * Note that the PXP key handling is inherently racey, because the key
> +	 * can theoretically change at any time (although it's unlikely to do
> +	 * so without triggers), even right after we check it. Taking a lock
> +	 * wouldn't help because the value might still change as soon as we
> +	 * release the lock.
> +	 * We mitigate the risk by checking the key at multiple points (on each
> +	 * submission involving the BO and right before flipping it on the
> +	 * display), but there is still a very small chance that we could
> +	 * operate on an invalid BO for a single submission or a single frame
> +	 * flip. This is a compromise made to protect the encrypted data (which
> +	 * is what the key termination is for).
> +	 */
> +	if (bo->pxp_key_instance != pxp->key_instance)
And the possibility that the key_instance value has wrapped around and 
is valid again is considered not a problem? Using a bo with a bad key 
potentially results in garbage being displayed but nothing worse than that?

> +		return -ENOEXEC;
> +
> +	return 0;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 868813cc84b9..2d22a6e6ab27 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/types.h>
>   
> +struct xe_bo;
>   struct xe_device;
>   struct xe_exec_queue;
>   struct xe_pxp;
> @@ -23,4 +24,7 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   
> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
> +int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index eb6a0183320a..1bb747837f86 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -108,6 +108,9 @@ struct xe_pxp {
>   		/** @queues.list: list of exec_queues that use PXP */
>   		struct list_head list;
>   	} queues;
> +
> +	/** @key_instance: keep track of the current iteration of the PXP key */
> +	u32 key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56f105797ae6..1011d643ebb8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -34,6 +34,7 @@
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_pt.h"
> +#include "xe_pxp.h"
>   #include "xe_res_cursor.h"
>   #include "xe_sync.h"
>   #include "xe_trace_bo.h"
> @@ -2754,7 +2755,8 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_CHECK_PXP)
>   
>   #ifdef TEST_VM_OPS_ERROR
>   #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -2916,7 +2918,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
>   
>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   					u64 addr, u64 range, u64 obj_offset,
> -					u16 pat_index)
> +					u16 pat_index, u32 op, u32 bind_flags)
>   {
>   	u16 coh_mode;
>   
> @@ -2951,6 +2953,12 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   		return  -EINVAL;
>   	}
>   
> +	/* If a BO is protected it must be valid to be mapped */
"is protected it can only be mapped if the key is still valid". The 
above can be read as saying the BO must be mappable, which isn't the 
same thing.

> +	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
> +	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
> +		if (XE_IOCTL_DBG(xe, xe_pxp_key_check(xe->pxp, bo) != 0))
> +			return -ENOEXEC;
> +
>   	return 0;
>   }
>   
> @@ -3038,6 +3046,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		u32 obj = bind_ops[i].obj;
>   		u64 obj_offset = bind_ops[i].obj_offset;
>   		u16 pat_index = bind_ops[i].pat_index;
> +		u32 op = bind_ops[i].op;
> +		u32 bind_flags = bind_ops[i].flags;
>   
>   		if (!obj)
>   			continue;
> @@ -3050,7 +3060,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		bos[i] = gem_to_xe_bo(gem_obj);
>   
>   		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> -						   obj_offset, pat_index);
> +						   obj_offset, pat_index, op,
> +						   bind_flags);
>   		if (err)
>   			goto put_obj;
>   	}
> @@ -3343,6 +3354,35 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	return ret;
>   }
>   
> +int xe_vm_validate_protected(struct xe_vm *vm)
> +{
> +	struct drm_gpuva *gpuva;
> +	int err = 0;
> +
> +	if (!vm)
> +		return -ENODEV;
> +
> +	mutex_lock(&vm->snap_mutex);
> +
> +	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +		struct xe_bo *bo = vma->gpuva.gem.obj ?
> +			gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
> +
> +		if (!bo)
> +			continue;
> +
> +		if (xe_bo_is_protected(bo)) {
> +			err = xe_pxp_key_check(vm->xe->pxp, bo);
> +			if (err)
> +				break;
> +		}
> +	}
> +
> +	mutex_unlock(&vm->snap_mutex);
> +	return err;
> +}
> +
>   struct xe_vm_snapshot {
>   	unsigned long num_snaps;
>   	struct {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index bfc19e8113c3..dd51c9790dab 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -216,6 +216,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>   
>   int xe_vm_invalidate_vma(struct xe_vma *vma);
>   
> +int xe_vm_validate_protected(struct xe_vm *vm);
> +
>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>   {
>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9972ceb3fbfb..335febe03e40 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -776,8 +776,23 @@ struct drm_xe_device_query {
>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
>    *    is uncached. Scanout surfaces should likely use this. All objects
>    *    that can be placed in VRAM must use this.
> + *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this object will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. Objects used with session of type
> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
> + *    event occurs after their creation. Attempting to flip an invalid object
> + *    will cause a black frame to be displayed instead. Submissions with invalid
> + *    objects mapped in the VM will be rejected.
Again, seems like the per type descriptions should be collected together 
in the type enum.

John.

>    */
>   struct drm_xe_gem_create {
> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -939,6 +954,9 @@ struct drm_xe_vm_destroy {
>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>    *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
> + *    reject the binding if the encryption key is no longer valid. This
> + *    flag has no effect on BOs that are not marked as using PXP.
>    */
>   struct drm_xe_vm_bind_op {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1029,6 +1047,7 @@ struct drm_xe_vm_bind_op {
>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>   #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   

