Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5914DCF9C6C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 06:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76010E79C;
	Wed, 25 Sep 2024 06:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjmHRl4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2083510E79C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727245324; x=1758781324;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tTnfI8bGmQzxWt3HSU8JGamWc0asISb8zWRnX674twk=;
 b=KjmHRl4FhGPtfNPgyJXMpshtQna2lzeTMjL7uNZ3ufac5SUFgXPvPrBa
 yaEXVZpIo+dtWBBEHX/qAM3p0siOQ5Zvyv70jDlmOtOzpMsL6DbGinSy0
 05/yi7MwptleTa9juT0cjSJ/BJO9hrqw69UNfBpzse2RciFLilaa2BvSs
 sfScAIERraasuGxsCAwmb/XoYNaHPIlZJpfLTUl13WvweikeSUA3q5HVA
 XSh0gYnJ5mCbYM0rPeIpNgG98ftaUdnitLwHlmKdOaDOgkzqOSXxagjCi
 7x4WWQk6VcdeSn9zvcJAV8jrVMFvcSlIkgvxx6VonyqfgrUxXdRDEgVlg w==;
X-CSE-ConnectionGUID: KkF5uroXRIyA+5wi+I9suw==
X-CSE-MsgGUID: LH3zJyPLSTqfza9YYbST0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26144039"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="26144039"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 23:22:04 -0700
X-CSE-ConnectionGUID: 8KRXpAdMRz2j69ow2lvhSQ==
X-CSE-MsgGUID: s+rrOapSSlGW3XOC5wT5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="72118863"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 23:22:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 23:22:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 23:22:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 23:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckDysHrOIeoOmXlPEGSwWlfXpkhh6P5tW3mXbhK/8mMbPW9cqYQ3CC+pTk0f12VQerK/Tl4FgzzpmZmeuqCMDP9mFSy0ti+w4jgP2YIyNLxAWXmmsgm4uAP4ZZBtv5wu610RhFVQq/rez3WfDbxT/Ea7fRn5RKBYiDyRocRk3suhYU4NoydJQC7LtGs/fcDw2roYuFwWeyT3BvVzm1mqJlpgwcMUkUSzP3tQ/YNzadWtnDogVnBhmpYJnIgW6wJAUpmhoL8BckyAfHXFEJmd7sGST8rjjilApv25z2xk5WBlyPAqSTqT6J7kHlG9Jh/jVt6pOHEzwT3+E5LNdLaf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbMLaPdJJ5cp/u1fVmUJbKEVrVl1HNO2dPDgN3EjwkM=;
 b=LX3SdwBRaPZo+R1x7HVc1ImwcMmcmtWR6QSi7e5ujLXjVQ7jBBSSQrKjD/li5k/7pQ+m+XQ4XpCBkNY4ES0eR4lNRAsDyob5VtvaCfe7YNGPE154oM+45lCacjH6EtTIK53MG26T5opk0Q8oo28G4toF6qKUTFoBZXLZFhOWiD/W0V9A/j4wbK3nLtrB9pNf6cbxkC0QxxiHN/wToMDoukY+9T4XCglXX6rgbbRZMAk9W8GWyqS8mmwVY5B/dKtm7ntl7nA85PoJAyIM7+WOKUozeDXzBNG87od+gZ3pkg+dILUJl9TP3NRhzXxZO9uVMi5tXascJwpkoqvnmp6OGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 06:22:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:22:00 +0000
Message-ID: <6bcf9dfc-56f8-48c9-9ba1-7c8a4d4d2422@intel.com>
Date: Wed, 25 Sep 2024 11:51:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
 <b76291a0-5f02-4601-86ec-c6da607705f1@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <b76291a0-5f02-4601-86ec-c6da607705f1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fd6b83-14f4-4d44-e7b8-08dcdd2a5d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFNDRlplajJjVWRhMTNCNVYzeHVzMnhjZTdUOUtuRURqdThhNnlyTUl5TVNB?=
 =?utf-8?B?dE5CREZMcy9EbzVUU2ExNTVhREhvY004dVc4TjJ3bHFiR1JuVjN0eEtkeWEx?=
 =?utf-8?B?ZjVCbDkxaGowR0FaUUdnWGhncDFOQmpGOE9oYjB5dFhKMERNYmY1QlVRT1lw?=
 =?utf-8?B?K1FPZlgyaWR0UC85ZUN0Nno3S2kySXo4WVI5S0dzRmhGZlI5dWxzeC9hL3NT?=
 =?utf-8?B?N3Z5RmxBZUtnVGNYQms2cjdHOFZDaGVsZ29ONkQwSEE5MDRUdlRIVzVZNjYx?=
 =?utf-8?B?WWt5Y3NwQzd0MU8xbndmZk9sYzNQNjR3empkcGZPaDBoSk5LYUNIZFZ5eU10?=
 =?utf-8?B?WjJIVzRVK3FqTVlHMFJ4SGxvSEx2azhUSUd3N3hwS2dLSmJWdTB0eUdOc3Uy?=
 =?utf-8?B?MlZZYnBhd1FudVNDaUdHYlBqUiszQ0N2VnJwekhqekZ5YS9yM3h2OXAzQ21n?=
 =?utf-8?B?K094OHVZUWtKd2lGSUViYU9qcUhpdTg2dFBYWXkzUmlvUGJldjRxenA2aVVh?=
 =?utf-8?B?TWNDK0JrbVJDZjhaTnNkVkVZLzdIKzFlbysvcFNQN05zalVtWUNySlJ1Tm1R?=
 =?utf-8?B?dkE2cDZtK3RENHRONFJXcGR3bjhFeDhyU3hFWW5RenFXNStxYW1yaWJ1dE5V?=
 =?utf-8?B?WnFyZFV0UnJDak5CL1pFaVZZVmUwQ285THRFYjBDaWRaOTlYME1LWlZlNHAy?=
 =?utf-8?B?bFZmSEF6b01tWWw1L2RXNEs2S0x3VzQrbnBac1NlTm9VNHJpck1ZUWZnNmQy?=
 =?utf-8?B?eDdodDRSb3grckFYLzhDdWZ1QTJJZU4yUEdicjdKMUFvNkdaVXNPWFdqQzdS?=
 =?utf-8?B?cW9HTmQrMWtTcFRGaUJnWE03N2pDR1FqUjVOLzRGeERzWkoxSGVvcUtRUHNo?=
 =?utf-8?B?RFBuNWdmM1hKbGYwRS9rTlkrOUl2aFpRN3RuUWdabnFWS0xXRml2cU91SURs?=
 =?utf-8?B?OHpUR1JicHFJUEthK1BBMDJJOU4zeGhXN2pKMlBQN2dzdDVudGo2dStGSUxi?=
 =?utf-8?B?dVQwckFITmVweXpjcjZxRUNoM3ZRR2NvWmJKd0g0a0pZZC91QUlmK2lhbXJj?=
 =?utf-8?B?WC9zQVpacXhiWG4yeml1SXpHa0NERkdiMThGejYwcTFqbkxiMHQ4TTVRRmd6?=
 =?utf-8?B?RVBsVTR5eFhPejhMM0IrRy9WdDlraTVRZXMyVzYxZFo2aTRIbmtxYkFHdkp5?=
 =?utf-8?B?dWpGQW51T0N2L08yZjhoNnFab2E1WE44NkxhcUpOQVF0dGtrZ3pBcEVRUk1u?=
 =?utf-8?B?L3Q2VC9lUGhURUtUYUNiSE1oUFFKNmN2Y2FsS0JMSmZoVUlGcFF6QWY1LzRl?=
 =?utf-8?B?ZmZSZTNWKzFLSWMvN3djUHhPYkN6YVJ0YmpPTEsydzdzM0NaYmNvWFBZSlpx?=
 =?utf-8?B?NDliWlQwamdVWVpzbEEwU1ZXZVJWZWNoY3hZeWY4aEtXSnlETmZiaXJaeFN4?=
 =?utf-8?B?MFdoNmN6eEQxbitwSkZpZzNtQzd5U0lmOHltUUYvUXdKOVZkWUVRbVRVeVM5?=
 =?utf-8?B?MFpzbzBvMHFueXV3c3FMY282VGZZNzhWYlI2Wk5KVEc2SG9va2xnVWxtdStE?=
 =?utf-8?B?NjBLSkFVV2ZFaEVic1RpNDBlZUxveFRWRVF3T2lLazBaeDVJTytSRDN4L0FO?=
 =?utf-8?B?TmQ5aGZSUStwbEl5UXV6c3lDZ0FRNEl3K09vVjVGdHA3RDU2NWh5MHpxaFg5?=
 =?utf-8?B?Smo5Zm9hRmVLa1lhQkdFRk90NDZZWm9OakpnbHJVZktTZVpQUjJhVEp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVF0akFuM2daRXc0VWtvOXRJWmRjZjRHYklPbk5VcE5WL0lqcTZwT3hvTmJi?=
 =?utf-8?B?YTlObEZ6Ym1iek1URWNhQnBVNDViWUREdHBpdnBXcGt5Z3g5TlNuRjBXQkcz?=
 =?utf-8?B?eVQvNmx2amlJT0dQVWZkRjVQUUo1amliRWVyMVZacHFCbGwwUS9TV3lxZUJZ?=
 =?utf-8?B?T2Nsd0xHT1p5OW9rYmdhb0IzazhRYSsxcGplTW1DdHJUT3JIaGtUL1pXUmM5?=
 =?utf-8?B?QzBPb0RmbHE2bzBQR1ZUcGtxc3BQVDdOSDJKZWVWS3Fkc2tpb1NuR3lLZHVx?=
 =?utf-8?B?dTF2ZEpJTVlZZzJhb001RTA4aUtEQUdrN0dhUVdXenQrUExEMVJEdXpQeit1?=
 =?utf-8?B?R2F2MDlkcmFFcFpaMmZuamJaM2xKS3NnZTdBcWNCYUJ0dXNBU3hjRjBtRVdi?=
 =?utf-8?B?SUx3QUQvQmM0cWFHWXZsR056Vkp5QzJlYzJyMVdSZnY3SmtIbU1UZFJ6MDIr?=
 =?utf-8?B?NUQwSURUc3V4dlR1OGhzdmhiWFhBTi9vaDk5dHZheURsUi85a3l3VkVjK0d2?=
 =?utf-8?B?OXVEYmhWclVIRlBwYjVydlc0OWs1SXNPWjRPL1lNN09PVnBFTXlaRytnSXJV?=
 =?utf-8?B?aGRrQUVpbEhrRzg1MndhblFwYTVYVkJDT2wvcHR6RkJtK1VTMUk1QkFJWmQy?=
 =?utf-8?B?NUpwSmFXVDYzcXRmcEswYndmdVcyOEpwMGRaV3JDdEt3N0VsU2Z0WnNIcTc0?=
 =?utf-8?B?NXFUQ0hrZDZKRFRhNE1BNkhpNUpUUys4b0dkU21MRUlvbGpoaGNzZVZpNDB5?=
 =?utf-8?B?Q2RrT3VIMGtOaVJ4QjRMckxYc0hXREc1a2lSdWcrYmp6ZGtaSmJSWjBHU3Za?=
 =?utf-8?B?YWdjdkFBVUZCV0ZnVWZiYjJKUEpiMEk4c09ENStlalRoZS9GczZMVllRLzR0?=
 =?utf-8?B?OXhreXl5RVgyTXVtSlB4REF0NVI3aitJM3ZFUExzZ1ptQXNJdjJCOTJ6SGw2?=
 =?utf-8?B?dnZVSUxkS0ZsakhTSU1ValE5NzZnaDVOWHM5ZVI1QndQOUV4aTArSUdMN2tX?=
 =?utf-8?B?T2Fyakx4Sk1JcFFDZWo3bXJMVVdKb3ZMWnUvSmRsUHJQVVp1cXI0bmZUcFBD?=
 =?utf-8?B?VGx3ai9ZUGZPWW1TWWNDQTVtWWxxK0NqNHJMb2xOaW1XbDUyUkdKekdTRXdE?=
 =?utf-8?B?SWdjVVFYQTlIMnJ3SmF6bjdGcXFrTm9oQTczTmY2dFp1RVFLWmhIMDlwOWRI?=
 =?utf-8?B?emdXRFhBOE1qaEplajJZUGpiR01iYm1hLzd2SWxaWXE5bXlxV2QyeDBxd3Vz?=
 =?utf-8?B?UmtBRXVFS0lhR1hocDk0elBoUjhiUlBEeEt0YS91RXd1T0JLYXpDUStWUGdZ?=
 =?utf-8?B?a3hZUi9LL3A2RE8rODUydXE1QlZkODRzV3Q0bkVlb2F0RmVHNDVrZmlWVlZX?=
 =?utf-8?B?WDNQa2R5em5Db3ZUcFhHN1lJQWlTT3dFeVdmY0c1UHlYS1BXOC95M2hnbVJM?=
 =?utf-8?B?bFZMYVJJa2NKQzRpT3dsRGVMazVmdS96dTBOaE8yMTVlWlRyMWo1MjRtaGFC?=
 =?utf-8?B?YjJDeWFtckFPOG5VZVVlamhoOHBIdHd6Tmx5ZzQrVE9ITVBTZ2RybWRsMlZB?=
 =?utf-8?B?aSttdUJERlk1M25yL0hrLzNnYml5L3B3dHhtbVVBS1BKMzBjcStkc0hkY1RB?=
 =?utf-8?B?U3M0cmlRSlRhZ05JZ01wWnBIVjFmaEJjZjJQbXZrWFZVdXVFaGhqcmdLWnBl?=
 =?utf-8?B?VzhUMFZMOXJNRlQ0SlpHdm1xczRDcDllamdYZWJBdndTWmg3S2tsc1ExWmZx?=
 =?utf-8?B?VWU4VU9rQWpyNWZadWZBa0ZuVm8xU1R2RTJMUEhLTjJ5ZWtTZ0s1Zi9yUlph?=
 =?utf-8?B?YWlOcW1jYnFvWWJpMWh0N1k0VVF0YWxyTlhUNGkvcUhsclN5K1JxZDlLSkEx?=
 =?utf-8?B?SWNoeW9IQnBSUWozemZvWDhaN2cxNEZqNU0vbVYrNDBHQy9adEFZTVIyNjBv?=
 =?utf-8?B?VXJwTGRKWUlDSFNkTWlKcjArZkFCWnVuT05iTVRhQ0JudGw0Z2ZDRXU4K0Fa?=
 =?utf-8?B?U2NFMGhyTmVma1ZncTQyL2E3MkhrWTZVSWcxWFFpdmRJdkJ6MXdJNXFaQTYr?=
 =?utf-8?B?OVZGOXFlN3FabTltZUw4NTZkOFBVd1pjeXJ3WHNUR1kwRWNNcUUzcU9Sc2hT?=
 =?utf-8?B?anBkNFBWREF2eEZNRllGNFZKSlcrT2ExaXJJZHM2SkdjZVNmOGRDcm4xVWx4?=
 =?utf-8?Q?U7oLtOdjPFpiYdlCTzMfRwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fd6b83-14f4-4d44-e7b8-08dcdd2a5d6b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 06:22:00.8334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 581Rg+KFTthkuRKE2nECeUfK0qETquyet9/ENxEUFvl1HATioO+P1g1NHaZOdK/kdyVu7zF1c8vDHZASBDWN/TQxfQiz2s7Auwko/fM1zyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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



On 24-09-2024 22:57, Nilawar, Badal wrote:
> Hi Himal,
> 
> On 24-09-2024 17:46, Himal Prasad Ghimiray wrote:
>> If an acknowledgment timeout occurs for a domain awake request, do not
> 
> s/acknowledgement/forcewake acknowledgement/

Ok.

> 
>> increment the reference count for the domain. This ensures that
>> subsequent _get calls do not incorrectly assume the domain is awake. The
>> return value is a mask of domains whose reference counts were
>> incremented, and these domains need to be released using
>> xe_force_wake_put.
>>
>> The caller needs to compare the return value with the input domains to
>> determine the success or failure of the operation and decide whether to
>> continue or return accordingly.
>>
>> While at it, add simple kernel-doc for xe_force_wake_get()
>>
>> v3
>> - Use explicit type for mask (Michal/Badal)
>> - Improve kernel-doc (Michal)
>> - Use unsigned int instead of abusing enum (Michal)
>>
>> v5
>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   2 files changed, 31 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/ 
>> xe_force_wake.c
>> index a64c14757c84..d190aa93be90 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>                        (ffs(tmp__) - 1))) && \
>>                        domain__->reg_ctl.addr)
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -              enum xe_force_wake_domains domains)
>> +/**
>> + * xe_force_wake_get() : Increase the domain refcount
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * This function takes references for the input @domains and wakes 
>> them if
>> + * they are asleep.
>> + *
>> + * Return: mask of refcount increased domains. If the return value is
>> + * equal to the input parameter @domains, the operation is considered
>> + * successful. Otherwise, the operation is considered a failure, and
>> + * the caller should handle the failure case, potentially returning
>> + * -ETIMEDOUT.
>> + */
> 
> Here especially for FORCEWAKE_ALL case caller has to strictly compare 
> return mask with FORCEWAKE_ALL instead of just if(!ret) and return. 
> Which is fine.

That is true, if(!ret) works for all individual domains but not for 
FORCEWAKE_ALL, whereas if(ret != domain) works for any domain(including 
FORCEWAKE_ALL).

In subsequent patches I have used (!ret) for individual domains.

> 
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +                   enum xe_force_wake_domains domains)
>>   {
>>       struct xe_gt *gt = fw->gt;
>>       struct xe_force_wake_domain *domain;
>> -    enum xe_force_wake_domains tmp, woken = 0;
>> +    unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>>       unsigned long flags;
>> -    int ret = 0;
>>       spin_lock_irqsave(&fw->lock, flags);
>>       for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>           if (!domain->ref++) {
>> -            woken |= BIT(domain->id);
>> +            awake_rqst |= BIT(domain->id);
>>               domain_wake(gt, domain);
>>           }
>>       }
>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -        ret |= domain_wake_wait(gt, domain);
>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +        if (domain_wake_wait(gt, domain) == 0) {
>> +            fw->awake_domains |= BIT(domain->id);
>> +        } else {
>> +            awake_failed |= BIT(domain->id);
>> +            --domain->ref;
>> +        }
>>       }
>> -    fw->awake_domains |= woken;
>> +    ret = (domains & ~awake_failed);
>>       spin_unlock_irqrestore(&fw->lock, flags);
>> +    xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to 
>> acknowledgment awake\n",
> 
> Forcewake domain%s failed to acknowledge awake request.

ok.

> 
>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>> +
>>       return ret;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/ 
>> xe_force_wake.h
>> index a2577672f4e3..6c1ade39139b 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>                  struct xe_force_wake *fw);
>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>                   struct xe_force_wake *fw);
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -              enum xe_force_wake_domains domains);
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +                   enum xe_force_wake_domains domains);
> 
> Looks good to me.
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks for the review.

> 
> Regards,
> Badal
> 
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>                 enum xe_force_wake_domains domains);
> 

