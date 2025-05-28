Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E57C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 05:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133610E57E;
	Wed, 28 May 2025 05:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoBWskYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E767410E580
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 05:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748409836; x=1779945836;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mLraWBhA0shq4tPxOJGc++/L3q0POR3ees7GE1xOAS4=;
 b=NoBWskYPwskxwdTVfnkBx+DxbTa4n/q21pd5dL9CRUzTAiHcjlLmuVXV
 DNLjI708/5STKFfsnn1fNehcUEfTrk1TDaRkzUpmaZLSip7davbeDFMww
 7RM3hLmHLUZATwdqRVMxBkd2jeFMpEuwnzpmDeHdjGFNOIWeERgHRFqdr
 F2nEsoEPMXMYaOcKH4SODMXgWK3OxAlTHZP+Hzx3KEByCFGKvU1teDvkP
 KtzmMyNxxGC/iqmI7jrVy43OIaOEO79AY4bfLFzBeF3uXFjiqYHytbG6D
 udzkwDX1WKwqjoj7KGnK2iKulieiq4C2pXXUzhvlqUjxblrroSznAGTss w==;
X-CSE-ConnectionGUID: 6mmfzGCtRuqnZUwkqyRL9g==
X-CSE-MsgGUID: eraM8a+ZRgqHDb10vH/ftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38043213"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="38043213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:23:50 -0700
X-CSE-ConnectionGUID: qVI1n40LRR6woblx9uQilA==
X-CSE-MsgGUID: pO/dy9nJTEaFqtP2ytWKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143744646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:23:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 22:23:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 22:23:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 22:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrvGCFVAziXbxsBr5IEZy9clTkqU83c9qLeD4KRIF8ru8wobDCXgDbYflrl3/CagPjaryhbAHm81S/3tEij24wY4ecOjG8IV7+ITEyXJ+bPTwxy0Nlpt0QAnIfC6htJHF2fbPgw2+RBg1MORL+KjjCStGXT4B6pFAbbHqJRlOLTbh/OEQV4rx7DzVuyH04npZSJMxhRfmCi1kMIbVU/E5l7hdMM+flvTUSkg3RCbTbObG2E+hdXKQX9JAE7gzYRJPlevEbI5LSQgaDjdy3kFWjBO9ZXlt4ksWPB8NX2FNroZCsvtkEHWtWW0z5ExdyFuVg9uZnCJLSaelbaoya/2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcfvCSdLrWLTu/BFJa7pX6zn52qYgKoh/RDuoagtpng=;
 b=oTLJ2GPSfDZUrT/DUzyhbu4T5cS3W06Ee39AWR0FA2NjhhvBm410oOk7LHQQTVTahu3SH3wHsZvvd10NLkPQdN5GxT9ZWFqzO+L9HJwJ1735S1eox6DG9w31KYV3pHmIPChyQHHuB8uUmobxniCKvMoFDfK9YiQIW7H30UglVMEHnU00Ut7T9R/Wy+9Cu+53qJ8ir6upyO81qhIqR8UcfCyYzYuMGHJifMgELQ3lfVkFGLr2W6xyISmFxq7S2YQ+SSHXU0/SEE3melXw5pYASL/0NJIiXnxeYGu/h3ZlhmiEX2ZcBXc92EvBb2cT6gaF17agfKKxxmfieBth4RCx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 05:23:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 05:23:04 +0000
Message-ID: <8e04adb6-f679-430b-ac79-4b7ca26a8c47@intel.com>
Date: Wed, 28 May 2025 10:52:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/32] drm/xe: Implement madvise ioctl for xe
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-24-himal.prasad.ghimiray@intel.com>
 <aCUOBPal7m8PF67H@lstrano-desk.jf.intel.com>
 <2e935f46-a904-43f4-a597-9a503560be58@intel.com>
Content-Language: en-US
In-Reply-To: <2e935f46-a904-43f4-a597-9a503560be58@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b8d026-bd96-4525-f1b6-08dd9da7b91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azgrc2ZLODI2SkZMcGdXc0t4Y3l2SnVLdlZVNkhxRWIyVktVckY2Viswdzk0?=
 =?utf-8?B?M0RTak1wR0x0a1EzaHMrRXBNS0xtL1I5R3R6RHhySjJJckdjMm82TVVHNmdp?=
 =?utf-8?B?WVNDNkZYT29MOElETWE1Mm5HQzBKajMxc3FzMm5wa1dqVGgxRGsxb2Rmb3Vo?=
 =?utf-8?B?emR1VkZFTlNWTzhTT2VtMFVmbW90ZGxLNGo5SUFzRXJIMTBLVEdLVm5yZm9k?=
 =?utf-8?B?Y3B5MGFiSWt6WC9IWUZkS01WYkR4WGttVzB1cCt0YlBsM0twL3IrdmRWZFds?=
 =?utf-8?B?MnpQWnlQSjJMeFN4R2NNSnhEa1pRNUpTQytZSnh3aGErVDNLZVpVMjI0U211?=
 =?utf-8?B?TUdob3dqeXkzNlQ4R0dLdFNFRVM5Y0RMMjErc2MwY0doaGtCL2RlQ1NIN21y?=
 =?utf-8?B?UGVWbmtxU3QwM014ek5yTUpIYjhzZTd4d0M0WDdYMVNXTkxBZUdyRHFPeENj?=
 =?utf-8?B?K1VxZ3dnZ2dEZHczR2ZteVVMMjZVRndMME9ab25iQjBnM2VRaitEY09LSnI1?=
 =?utf-8?B?MTJBeDl5eWRlM2NLcnNJTWJ4WWxhQXJVUFNSVDRnMnF2disrMnQ4VzFQTmpP?=
 =?utf-8?B?dTZlZmo2dkpydkdnYTNGRVdIUUNxb3JKNnZJSVFpYXoxTGNsclE4Qlc5SjBm?=
 =?utf-8?B?MHdRbEdVL082SzNvTkUyaHF4WVhySlRPZ3V2WEFrbytYdmRxenBTQ1FxWC9F?=
 =?utf-8?B?eGpkdkJORDMzSEFhcHc4Tlp6VEMyaXpjaEM5SXdGSXpac25sUXFqM2xsbW0v?=
 =?utf-8?B?ZjVlTCt4c0hCNTdpME5SL2dIWXd3Z0dBaGlGb01qc3FYeDBNdjBTWFVZYktH?=
 =?utf-8?B?U1lGbXdVTk1nSXgycGp6SWFmODdWdmFpQlhoWDdaWDdhWGNQU1k5b3BMS2Qx?=
 =?utf-8?B?TmgrSVhhMXdqazdEZnRQWjgvQ0tsYk9HWW5LWE4xc2JRU0NNUG1sTEZ2cWNx?=
 =?utf-8?B?L1kwOVNMTS9JeWYzS3pqZXo0Ti9PYzZvbE5BMURMRzFtRmtOZU93dWZxcXhi?=
 =?utf-8?B?cDFGRllaaGEzU3hOVkgxUW83NFE0VHVnZHdKWkRzb1hMVjVmSENhNDc1NmtF?=
 =?utf-8?B?aUlsdnJ2ZS9BSTJ6NGJuY1RzeTVlWVJSMnFBNHMzdXlZVFozQVQ5ZXBqMHhK?=
 =?utf-8?B?REJ1L2RwQ1pPSStrQis5QU5xd09kVm1iNUwwSFhJdVowN3RFR2p2SEdrOFpT?=
 =?utf-8?B?RWo4SHhrWW9VU2N2MkxidlZoRXZBZUE3TDY1SDhZc2t0ME03dmp2MmpRS0FO?=
 =?utf-8?B?aWdYMzNxOVo4LzRieStBekFSWldYSzlDZE1LQngyN0d2UXhuNCtDdmtQMjBJ?=
 =?utf-8?B?VytzSHlaaDF2Wll1YjQ3eVh1cG1IQzNQSGpWeEgzYW1pWHF4Uit2Z2k3bm9E?=
 =?utf-8?B?UWp5SkprR3JLMXlnM2JqNkpQdGNpdXZOd1JFVDd4dFlqVVJrb0Fwd29SMHRE?=
 =?utf-8?B?eHJsbk5OczFRRjMxdTNYT1VMQmNKaE1rWTVUanREa241YS9MRW5FMFlWMFhh?=
 =?utf-8?B?SkZIVGgwV3dodlhoc255cXMxZ0ttZnRYVmJVZnN6TDBRMm93V2J4TGg4ZGly?=
 =?utf-8?B?eTRvYnU5eXJnS2FkVENLOE1wQ0xTY2dvUFgxZ1hWbWttVGNENHRkOXIyMXBi?=
 =?utf-8?B?d3Qwa0RpYm5TSjlONVhkNXRmcDUvRWwvMWZUUUUzYk5QVEEzZnRhVXhwdTJD?=
 =?utf-8?B?ckJrajZIb2UzcGtVdHAzdWRrN25FWHMzT21BendyNzU1Sjhmdmkvb1hTTFpI?=
 =?utf-8?B?alcxRWo2TFFJMGpUbmJxanpaMUgzdnVnd2xVQ0QzUEFWa3c3dDlvRUtRaE9v?=
 =?utf-8?B?Qml1K2tZczV4cmNkb1BKaWNtbkt4aFNHdURsS0kwNGh0QXcxUi9OeTA3OTBL?=
 =?utf-8?B?ZDFhR0lrOXhQeUh6YW5xbjdCaDVDVXRaVkhSUlBOeE5YNG9iMWNqWmZheUpz?=
 =?utf-8?Q?Sued5S/5SNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZ5MFpKb3FvYUJtNmZxWXlqRGRHOFJtS1ZnWVFTSXJjdGJuVmpMWCtsb3Jx?=
 =?utf-8?B?UEw3d29UczRzSjh4YktHZzhGKzFXaWFBdnZTN0IwYUtyVUdFN2x5YUJ0MHJ2?=
 =?utf-8?B?anVsdWlzQzUxR0xBZjlRQXJBRjB1L1Z6ejBadDdkczc5d2JxUHVJUVdCNVZz?=
 =?utf-8?B?WTE5SS9zSmFrakJDZmo1eFlIS29CRmEwSlNTVUxaMnNUMVlmV2E0ZEhWNFh2?=
 =?utf-8?B?enJmK0Q4bjFEMjljdWI1STRwS29yVCtsV0EwcklqU1pBNGl3UzkwTWlWblNF?=
 =?utf-8?B?ZEJYUmpSVUdtMmpwaUlsZkxoN2lUS1g3WnNmVnRZUXdHMFBVRjZxSWgxZngy?=
 =?utf-8?B?cGdQY1BKNjl6WExmWnZsVStaWHZMdzJjVzZNdWNld0xEMlEycUprZEkxNG4y?=
 =?utf-8?B?OTZjYXVyd3VvQ0VUREQ3NWpTbjJKN0V4c1M3UWNpNEhPWEMxT3VGZmhyb1lh?=
 =?utf-8?B?OTlwNzh4UTFmWW0xVlhxblVGSkZZVk1CUUliRUFVZStZWUhDZGJuckVSU0J2?=
 =?utf-8?B?eGF3ZEJyaE85MVFEQ2RIQldDd3hiY05adUV5ZktLenU2K2VwSnJhKzI1QXlr?=
 =?utf-8?B?T005d3VXYy9JZi9LL2hBcEpXT1lzTkRUeDFLeXlCWkhZT2JDSTdta1ArSGJo?=
 =?utf-8?B?TFFlWGpkdjRlM1craENKUS9HZWdZVi9QdUhWRG83dzAzN3pablNOd0dKZzZB?=
 =?utf-8?B?NXBJQXlqaWZMd0lOVXBGdTUwZEVFV1hzbmU0YUpWaGVnb3VxVzNjdlgveVR5?=
 =?utf-8?B?MjhpanNocWt0WVNKNzdxT2pqNm1GT2hqR0lTMGFZYTRtdUpQYm84bDE2M2hr?=
 =?utf-8?B?T2F6K0NxRDdtbGlGbWJPL2VXeEtERzRBZDNNdWtSRWF1c2d6U01hY010REZV?=
 =?utf-8?B?S2xqcU5GeVdMSXdrZEVvQlhobTRPK01McldvVmRkSUl3aHBHa09kNUU4eENN?=
 =?utf-8?B?dEdKaEF3K01qalpuS21PeTZDUlZPR0JFYWZheFFrZlgyMnNqcnVQS28zWFVs?=
 =?utf-8?B?UlhJYk5Rc2lGMHIzMk9lYUVBTEdRRC8wZHlMK0ltbTU4bjN6UWFFM2JXbFBN?=
 =?utf-8?B?RW5vMks1WlRsUThNWlIvRlBFbSt5VVYxVzNvTkNiMmptSkNqSkcxaTZrcWdl?=
 =?utf-8?B?WEh3UlgvZENpdzJMakZxVlpLNytLN3VHcDI4SE5sY2kxdUgxWFZyZ0pkdjlw?=
 =?utf-8?B?ODR4M1AybTZ2dTgzOEFEUFFYT25LeDRuTDVNcC80dU9SWVUzQ3MwcG5adGZO?=
 =?utf-8?B?R2krTzlRQWoxRVhzdzMrdi9xeEl4WWtucnRnc1JnVVVJU1dSQUREWmZmS0Fp?=
 =?utf-8?B?ek12OXhqWWVyVDVMM0k2YzlUcGN5V083WjJ6NGh1Z2hhakFsNDYvQ1NIL1ht?=
 =?utf-8?B?UmVPRjJndy96SnJFM1FlSUVRRU1JYnVWQ3VtWStvdXpDRjA2VlVtdWRDU3d1?=
 =?utf-8?B?SDNtWjRseUh3Q0JFZU5sVFo5ZVJwV1FmbVp0M0ZMZFBOSnBnMHZmUXFmYnhY?=
 =?utf-8?B?WTR2c3Y3RFNrYmxxN1JSTHZWWkNDQ2k5TGtDUUJrYkQrVXNnVEY1a0E1Z1B5?=
 =?utf-8?B?VXVzVkd6RnVpOXVrdlczMVFLRHhPRkRGNEV5aU1nQjdueWF0WWYvM2xXbFhu?=
 =?utf-8?B?SlVYT29nWHl2YjlWZGFkRmwvZFBKalU0aTgrR2RrSkxrR1JXK01wZmxVbVV5?=
 =?utf-8?B?d2xmTWtDMzlIWmRNUEdtRkR0Vis1T0hWaVRLUFQ4bHNxZm5XZFdzVk5VT09B?=
 =?utf-8?B?ekg4TmFuRWhjRHFmcDVRSStTTjgwTnhCM2RsM2NFdzFLNitnZkRXNWh3ODc5?=
 =?utf-8?B?TGJldTZvY1VGZ2o3b1REOHE5dmZ4SVhqd1FJTncyNFlCbGdOd3MrUzlQZms3?=
 =?utf-8?B?MU05aUk4MThGdnltMGFoanJLaHNsQTEycGZyVEdDSUZxeVlpSEpnSHdsVXc5?=
 =?utf-8?B?dkVFcDk3UDVaWm51VlVxRysrc2IwYld2V0ozK0R4Z3FMcnBWRUt6R0VlcTdH?=
 =?utf-8?B?K0JpczBISDB4cHU1MjRzaU5WeWdiWDdkZXVSK1oyZWhROUNiNjQ2NnlxdDB0?=
 =?utf-8?B?RS9vamhnWjdNY3RPUUZhZ0l3UFp3RXNpWXdreUdYOFR1RWc1THQ2ZFZOdGNh?=
 =?utf-8?B?ME1LYkczNjlMS0VXWUNBOXlQMFpNL3hUMmRhdktqWTI5bk9VSUJUVlBNT3Jm?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b8d026-bd96-4525-f1b6-08dd9da7b91a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 05:23:04.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BSrtHWEJuNRGxeBBGaPNTMm9X/ugrlSr8P804tcTNiGEGVQ+R+yuRZZ/o1jVakokov2diMRet0uTn9CeshCoArrluG2aeOVt4WvdMxgVD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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



On 20-05-2025 15:45, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-05-2025 03:11, Matthew Brost wrote:
>> On Mon, Apr 07, 2025 at 03:47:10PM +0530, Himal Prasad Ghimiray wrote:
>>> This driver-specific ioctl enables UMDs to control the memory attributes
>>> for GPU VMAs within a specified input range. If the start or end
>>> addresses fall within an existing VMA, the VMA is split accordingly. The
>>> attributes of the VMA are modified as provided by the users. The old
>>> mappings of the VMAs are invalidated, and TLB invalidation is performed
>>> if necessary.
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>>   drivers/gpu/drm/xe/xe_device.c     |   2 +
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 309 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>>>   4 files changed, 327 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index e4fec90bab55..3e83ae8b9dc1 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>       xe_uc.o \
>>>       xe_uc_fw.o \
>>>       xe_vm.o \
>>> +    xe_vm_madvise.o \
>>>       xe_vram.o \
>>>       xe_vram_freq.o \
>>>       xe_vsec.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index d8e227ddf255..3e57300014bf 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -60,6 +60,7 @@
>>>   #include "xe_ttm_stolen_mgr.h"
>>>   #include "xe_ttm_sys_mgr.h"
>>>   #include "xe_vm.h"
>>> +#include "xe_vm_madvise.h"
>>>   #include "xe_vram.h"
>>>   #include "xe_vsec.h"
>>>   #include "xe_wait_user_fence.h"
>>> @@ -196,6 +197,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>>       DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>>                 DRM_RENDER_ALLOW),
>>>       DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, 
>>> DRM_RENDER_ALLOW),
>>> +    DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, 
>>> DRM_RENDER_ALLOW),
>>>   };
>>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, 
>>> unsigned long arg)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/ 
>>> xe_vm_madvise.c
>>> new file mode 100644
>>> index 000000000000..ef50031649e0
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -0,0 +1,309 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_vm_madvise.h"
>>> +
>>> +#include <linux/nospec.h>
>>> +#include <drm/ttm/ttm_tt.h>
>>> +#include <drm/xe_drm.h>
>>> +
>>> +#include "xe_bo.h"
>>> +#include "xe_gt_tlb_invalidation.h"
>>> +#include "xe_pt.h"
>>> +#include "xe_svm.h"
>>> +
>>> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
>>> +                u64 addr, u64 range)
>>> +{
>>> +    struct xe_vma **vmas, **__vmas;
>>> +    struct drm_gpuva *gpuva;
>>> +    int max_vmas = 8;
>>> +
>>> +    lockdep_assert_held(&vm->lock);
>>
>> lockdep_assert_held_write
> 
> ok
> 
>>
>>> +
>>> +    *num_vmas = 0;
>>> +    vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
>>> +    if (!vmas)
>>> +        return NULL;
>>> +
>>> +    vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, 
>>> end=0x%016llx", addr, addr + range);
>>> +
>>> +    drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + 
>>> range) {
>>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +        if (*num_vmas == max_vmas) {
>>> +            max_vmas <<= 1;
>>> +            __vmas = krealloc(vmas, max_vmas * sizeof(*vmas), 
>>> GFP_KERNEL);
>>> +            if (!__vmas) {
>>> +                kfree(vmas);
>>> +                return NULL;
>>> +            }
>>> +            vmas = __vmas;
>>> +        }
>>> +
>>> +        vmas[*num_vmas] = vma;
>>> +        (*num_vmas)++;
>>> +    }
>>> +
>>> +    vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
>>> +
>>> +    if (!*num_vmas) {
>>> +        kfree(vmas);
>>> +        return NULL;
>>> +    }
>>> +
>>> +    return vmas;
>>> +}
>>> +
>>> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct 
>>> xe_vm *vm,
>>> +                     struct xe_vma **vmas, int num_vmas,
>>> +                     struct drm_xe_madvise_ops ops)
>>> +{
>>> +    /* Implementation pending */
>>> +    return 0;
>>> +}
>>> +
>>> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>> +              struct xe_vma **vmas, int num_vmas,
>>> +              struct drm_xe_madvise_ops ops)
>>> +{
>>> +    /* Implementation pending */
>>> +    return 0;
>>> +}
>>> +
>>> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>> +                 struct xe_vma **vmas, int num_vmas,
>>> +                 struct drm_xe_madvise_ops ops)
>>> +{
>>> +    /* Implementation pending */
>>> +    return 0;
>>> +}
>>> +
>>> +static int madvise_purgeable_state(struct xe_device *xe, struct 
>>> xe_vm *vm,
>>> +                   struct xe_vma **vmas, int num_vmas,
>>> +                   struct drm_xe_madvise_ops ops)
>>> +{
>>> +    /* Implementation pending */
>>> +    return 0;
>>> +}
>>> +
>>> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>> +                struct xe_vma **vmas, int num_vmas, struct 
>>> drm_xe_madvise_ops ops);
>>> +
>>> +static const madvise_func madvise_funcs[] = {
>>> +    [DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
>>> +    [DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
>>> +    [DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
>>> +    [DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
>>> +};
>>> +
>>> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 
>>> start, u64 end, u8 *tile_mask)
>>> +{
>>> +    struct drm_gpusvm_notifier *notifier;
>>> +    struct drm_gpuva *gpuva;
>>> +    struct xe_svm_range *range;
>>> +    struct xe_tile *tile;
>>> +    u64 adj_start, adj_end;
>>> +    u8 id;
>>> +
>>> +    lockdep_assert_held(&vm->lock);
>>
>> lockdep_assert_held_write
>>
>>> +
> 
> ok
> 
>>
>>     /* Waiting on pending binds */
>>
>>> +    if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
>>> +                  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>>> +        XE_WARN_ON(1);
>>> +
>>> +    down_write(&vm->svm.gpusvm.notifier_lock);
>>> +
>>
>> xe_svm_notifier_lock
> 
> ok


While testing I remembered now, xe_svm_notifier_lock takes read lock 
whereas xe_pt_zap_ptes_range needs write lock.


> 
>>
>>> +    drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, 
>>> end) {
>>> +        struct drm_gpusvm_range *r = NULL;
>>> +
>>> +        adj_start = max(start, notifier->itree.start);
>>> +        adj_end = min(end, notifier->itree.last + 1);
>>> +        drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
>>> +            range = to_xe_range(r);
>>> +            for_each_tile(tile, vm->xe, id) {
>>> +                if (xe_pt_zap_ptes_range(tile, vm, range)) {
>>> +                    *tile_mask |= BIT(id);
>>> +                    range->tile_invalidated |= BIT(id);
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    up_write(&vm->svm.gpusvm.notifier_lock);
>>> +
>>
>> xe_svm_notifier_unlock
>>
> 
> Hmm
> 
>>> +    drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +        if (xe_vma_is_cpu_addr_mirror(vma))
>>> +            continue;
>>> +
>>> +        if (xe_vma_is_userptr(vma)) {
>>> +            WARN_ON_ONCE(!mmu_interval_check_retry
>>> +                    (&to_userptr_vma(vma)->userptr.notifier,
>>> +                     to_userptr_vma(vma)->userptr.notifier_seq));
>>> +
>>> +            WARN_ON_ONCE(! 
>>> dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>>> +                                 DMA_RESV_USAGE_BOOKKEEP));
>>> +        }
>>> +
>>> +        if (xe_vma_bo(vma))
>>> +            xe_bo_lock(xe_vma_bo(vma), false);
>>> +
>>
>> Do you need the BO's dma-resv lock here? I don't think you do. Maybe 
>> double
>> check with Thomas on this one as I could be forgeting something here.
> 
> Sure
> 
>>
>>> +        for_each_tile(tile, vm->xe, id) {
>>> +            if (xe_pt_zap_ptes(tile, vma))
>>> +                *tile_mask |= BIT(id);
>>> +        }
>>> +
>>> +        if (xe_vma_bo(vma))
>>> +            xe_bo_unlock(xe_vma_bo(vma));
>>> +    }
>>> +}
>>> +
>>> +static void xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 
>>> start, u64 end)
>>> +{
>>> +    struct xe_gt_tlb_invalidation_fence
>>> +        fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>>> +    struct xe_tile *tile;
>>> +    u32 fence_id = 0;
>>> +    u8 tile_mask = 0;
>>> +    u8 id;
>>> +
>>> +    xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
>>> +    if (!tile_mask)
>>> +        return;
>>> +
>>> +    xe_device_wmb(vm->xe);
>>> +
>>
>> We have the below pattern in a few places in the driver. I wonder if it
>> time for a helper?
> 
> Makes sense
> 
>>
>>> +    for_each_tile(tile, vm->xe, id) {
>>> +        if (tile_mask & BIT(id)) {
>>> +            int err;
>>> +
>>> +            xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>>> +                              &fence[fence_id], true);
>>> +
>>> +            err = xe_gt_tlb_invalidation_range(tile->primary_gt,
>>> +                               &fence[fence_id],
>>> +                               start,
>>> +                               end,
>>> +                               vm->usm.asid);
>>> +            if (WARN_ON_ONCE(err < 0))
>>> +                goto wait;
>>> +            ++fence_id;
>>> +
>>> +            if (!tile->media_gt)
>>> +                continue;
>>> +
>>> +            xe_gt_tlb_invalidation_fence_init(tile->media_gt,
>>> +                              &fence[fence_id], true);
>>> +
>>> +            err = xe_gt_tlb_invalidation_range(tile->media_gt,
>>> +                               &fence[fence_id],
>>> +                               start,
>>> +                               end,
>>> +                               vm->usm.asid);
>>> +            if (WARN_ON_ONCE(err < 0))
>>> +                goto wait;
>>> +            ++fence_id;
>>> +        }
>>> +    }
>>> +
>>> +wait:
>>> +    for (id = 0; id < fence_id; ++id)
>>> +        xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>>> +}
>>> +
>>> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
>>> +                 struct drm_xe_madvise_ops *new)
>>> +{
>>> +    return (new->start == old->start && new->range == old->range);
>>> +}
>>> +
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct 
>>> drm_file *file)
>>
>> Kernel doc.
> 
> Sure
> 
>>
>>> +{
>>> +    struct xe_device *xe = to_xe_device(dev);
>>> +    struct xe_file *xef = to_xe_file(file);
>>> +    struct drm_xe_madvise_ops *advs_ops;
>>> +    struct drm_xe_madvise *args = data;
>>> +    struct xe_vm *vm;
>>> +    struct xe_vma **vmas = NULL;
>>> +    int num_vmas, err = 0;
>>> +    int i, j, attr_type;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, args->num_ops < 1))
>>> +        return -EINVAL;
>>> +
>>> +    vm = xe_vm_lookup(xef, args->vm_id);
>>> +    if (XE_IOCTL_DBG(xe, !vm))
>>> +        return -EINVAL;
>>> +
>>> +    if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
>>
>> Do we want to restrict this fault mode? Maybe check with Mesa if they
>> see any use cases.
> 
> Ok
> 
>>
>>> +        err = -EINVAL;
>>> +        goto put_vm;
>>> +    }
>>> +
>>> +    down_write(&vm->lock);
>>> +
>>> +    if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>>> +        err = -ENOENT;
>>> +        goto unlock_vm;
>>> +    }
>>> +
>>> +    if (args->num_ops > 1) {
>>> +        u64 __user *madvise_user = u64_to_user_ptr(args- 
>>> >vector_of_ops);
>>> +
>>> +        advs_ops = kvmalloc_array(args->num_ops, sizeof(struct 
>>> drm_xe_madvise_ops),
>>> +                      GFP_KERNEL | __GFP_ACCOUNT |
>>> +                      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>> +        if (!advs_ops)
>>> +            return args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
>>> +
>>> +        err = __copy_from_user(advs_ops, madvise_user,
>>> +                       sizeof(struct drm_xe_madvise_ops) *
>>> +                       args->num_ops);
>>> +        if (XE_IOCTL_DBG(xe, err)) {
>>> +            err = -EFAULT;
>>> +            goto free_advs_ops;
>>> +        }
>>> +    } else {
>>> +        advs_ops = &args->ops;
>>> +    }
>>> +
>>> +    for (i = 0; i < args->num_ops; i++) {
>>> +        xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, 
>>> advs_ops[i].range);
>>> +
>>> +        vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, 
>>> advs_ops[i].range);
>>> +        if (!vmas) {
>>> +            err = -ENOMEM;
>>> +            goto unlock_vm;
>>> +        }
>>> +
>>> +        attr_type = array_index_nospec(advs_ops[i].type, 
>>> ARRAY_SIZE(madvise_funcs));
>>> +        err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, 
>>> advs_ops[i]);
>>> +
>>> +        kfree(vmas);
>>> +        vmas = NULL;
>>> +
>>> +        if (err)
>>> +            break;
>>> +    }
>>> +
>>> +    for (i = 0; i < args->num_ops; i++) {
>>> +        for (j = i + 1; j < args->num_ops; ++j) {
>>> +            if (input_ranges_same(&advs_ops[j], &advs_ops[i]))
>>> +                break;
>>> +        }
>>
>> The above loop doesn't look like it actually does anything.
> 
> My bad.
> 
> was intending to do
> 
> if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
>                         needs_invalidation = false;
>  >> +                break;
> }
>               if(needs_invalidation)
>                   xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
>                         advs_ops[i].start + advs_ops[i].range);
>  >> +    }
> 
>>
>> Matt
>>
>>> +        xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
>>> +                           advs_ops[i].start + advs_ops[i].range);
>>> +    }
>>> +free_advs_ops:
>>> +    if (args->num_ops > 1)
>>> +        kvfree(advs_ops);
>>> +unlock_vm:
>>> +    up_write(&vm->lock);
>>> +put_vm:
>>> +    xe_vm_put(vm);
>>> +    return err;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/ 
>>> xe_vm_madvise.h
>>> new file mode 100644
>>> index 000000000000..c5cdd058c322
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_VM_MADVISE_H_
>>> +#define _XE_VM_MADVISE_H_
>>> +
>>> +struct drm_device;
>>> +struct drm_file;
>>> +
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>> +            struct drm_file *file);
>>> +
>>> +#endif
>>> -- 
>>> 2.34.1
>>>
> 

