Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E3C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52F710E3D2;
	Mon,  9 Jun 2025 16:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bgf4kfNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE0E10E3D2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749485158; x=1781021158;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ycj5t3smDCR/uXWXbXM96MLlUoRoq1ayc8Qmt/JILh4=;
 b=Bgf4kfNIuXEFfs4WNCIRUiAlhGoAUDs+ba6qwvHtw3Q2flAYgXd42A91
 hJCQgjfgMVY2X07K3SUahojDYiypbuCHTdDnC38uhS8hsuGQj3H4hfiKz
 IINVDkOTTrE1zksXPx4lnAbibS3Lo1U5qsUxpNZNVA0IxVATADOkzT+Pv
 iFYFy2v/hOHOeDB6M+gUhXtnoqqbAkpQgCODS7Sah7So2GqXdQCQBMpSZ
 8yX0X3khvxaly2NtF3yIhKPz8GJQWHFFhHhEIV5qAnuPazoUqd1Ft7Gtt
 48DhfsmFrf1O2PUNGOgHKd6XZL3sUPdUTizGxu21w9hTRX+n5SX6HJZqr g==;
X-CSE-ConnectionGUID: D/tOYyhrSESORYwr/tzeOg==
X-CSE-MsgGUID: +9NSupuJR3aDSs6B7bZHDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69015255"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="69015255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:05:57 -0700
X-CSE-ConnectionGUID: Y4cuK+wqR0e27CvrRYsoWA==
X-CSE-MsgGUID: B+HpsEreSsu7DXeFpTYSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146477320"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:05:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:05:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:05:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:05:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpQQ3MPB+XtYBbLMo72Rf16PuqfGjsADcVPhrMjW8pr8YmA02jOvNr61oH+2RZ8h5sMjkEV9n4L7+q51VeomR1SfuEbPkg5qfMYH/d5AgoBgvbHSYbbnt9K+wIIrhmwTMjcOhIsaeMGAv3i7sEri1aajC/ynHRA7loK0IXd9NY+SmPdRdHcN4LT3UoQxY1AUZCrVjJlvQRUxK0/nsjp7cqPj8QrFjbMLPoW0KbpJsPDa0+jBFaL4a4EtMd2uM2Pao3bp8BEXkPl5kVDbEuXsZxusYmM8um1F9bL0m2TluqnKF8lgx6A793yAkotceNJBWbKWTobXfEq2QiSAMla+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOKks0n+ylalGd6KeOre+/8tz3SUK8EEXrc3fe3GtDI=;
 b=kn/F8iODYUOQEvl6O/e4uu1rV6Twanel6kyo0hYDuvUsWqKolc9bMOBCBXpT5r+jhLTHTttlJWYdf/c1GNCdtP+XHLMp9tG4msb2oPErbubmus8IhuMBtuUHiIsJiZNinIXBpSOSkGI+6BwGhWMijL08dINLWoUX5Kb8N5sJ62UE/bweJ1Q3Oca6kVrVGHoocAP26IKcYv/pfeUeUFp7Fb+1xSGJv2uGj3ZeZhH6JXAPI/D5NzmIzJu13PpQt5AytF6B5P9X8I6FQh9lBURIqqGM8+jgPPYee8+o2Vo7osm0aqo96joLggJ62GCsASreb99vxNsdhhNE9twyzQD1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 16:05:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 16:05:24 +0000
Date: Mon, 9 Jun 2025 09:06:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "Lis, Tomasz" <tomasz.lis@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aEcGotX3epewhlG1@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-3-satyanarayana.k.v.p@intel.com>
 <aEMnXaHtgEUBolM+@lstrano-desk.jf.intel.com>
 <LV3PR11MB8695676726A4EB0187E37CD0F96BA@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR11MB8695676726A4EB0187E37CD0F96BA@LV3PR11MB8695.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: d406bddb-6bf5-466c-8c8c-08dda76f7149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VThicFJKakF6RDF6NFdBdnA0cTYxT2t1QkI4eTdnSzk0YlcxWC9pM21uc20z?=
 =?utf-8?B?dlZ6Nm52ZVd1aUZKb2xoUUlrc0xlUk9oNXRuWGJVd2sxRVNUWnREZjFqSVEx?=
 =?utf-8?B?YW9HRWUwMFdNMTlCVHdXa05JdHQyTGEyOWRYRlVDRm1waGg3QkJSY0xwY25s?=
 =?utf-8?B?M09XMGNmUlppS1pIVGNGMTJtVUFhaHpKSXpjSWdvN004ajdYZjdtQnRlSEFn?=
 =?utf-8?B?M2YwRFBSdEQ0M3ZRK2cyZkw2akJtU2xkb3JmMHF5SEczSHc0cVk3RnVZd09k?=
 =?utf-8?B?MWdtSUxOT1dEZEhrKzViUi91MFpCSDZlUVRYWStBTGNIS1NDVWFzc3V1Vzcv?=
 =?utf-8?B?ODhXcDh1enoyN0c4dzYzNWxLR2czclFFY21MZ3lWZXE4N1J5eXZtR3J5RjFY?=
 =?utf-8?B?SlN6RkM2aTZFVExWek5MTnBpYzJXckJPTGRhNFE1OHNiVW1XQ0ZoRTU1Wjd3?=
 =?utf-8?B?SC8wNlp3amVFQm5BcE5BbzY0NnN0YnNZaVlubWw5QnRQWmJVZVhnN3ltOGY4?=
 =?utf-8?B?K0hYU01oSUdCN2VjbXFsQk11NmJZSFM1R29ab1dPRDEyNmdGU2hvcjNDajVn?=
 =?utf-8?B?UFJRMnNmMUdPTUZuYkc0VEdMYUhsNW9CVzBGN2ROZ1ptRWFBZGVXSXZhVW8v?=
 =?utf-8?B?aDJialpTdVFMQjY4NGpqbWwzWXZuOGdubXJWY2U3MDQwamh3Qkc0dEdtcldB?=
 =?utf-8?B?cWZlc3N2SzdPRlZkL0lvOUJtaVJESUJldE9MY1gxdDdIRGQwY3JlUEFYME9k?=
 =?utf-8?B?MHQwT2JkUjhsbXptWFlrYjczN3h3OUFwTzg3dDY0NDRVWnZBa09WK1R6WjFw?=
 =?utf-8?B?KzFaeDA3N0puT1NVMTFGT0p5aFpKZDZ1cEhlbmxtR0hEZzdDM2w2U09Nbmtr?=
 =?utf-8?B?MHhaNC9LMExuU24yNWFEdUFLYUY3VEVoZ3p5ZmU2YXBCQWhDSDZhZFA4UHZL?=
 =?utf-8?B?WEYwN3kybnNRNFlOUnpyYnZqVGdYRGo4Myt5RUJ5OHZBWE9qWjNDekFpSGxh?=
 =?utf-8?B?Qjc5VHFvdTRCbG50b3ZCV1VzYWVUUDdLYUFoWmpiTlJTdlQ0QytQdDNEUTMz?=
 =?utf-8?B?UTB6QXdYRGozelF5TUhZbUJQY3ZTRHkxVkhMTGRjTGNhR0w2NjNZYzZhWjFa?=
 =?utf-8?B?QU9MQWUxeUducklJYjRvYXdzSkpRaHU3bFRoUmNtYTAxbWZNRGFJY2ZCZFJT?=
 =?utf-8?B?a1JHU252a2l2T1BVaUhQS2tzaUtVMkNHTmtwUmJmTE0yZ1UwSGg2MzNETVYz?=
 =?utf-8?B?L2NrTUtmZjBtTWVTRUFVbUIxT1Y0QXpkcy9FMVgwNlJGZUlVeVo0dTBCNTZW?=
 =?utf-8?B?Z3ppbFRDMFNRYVRzc0V3amx5eDdHc1YyU09kMmpBY1pMOExHN3FZVEhPcmFt?=
 =?utf-8?B?ZWpKRkNpbVVJVFVKbXh3YVRWQ3k1a2hSSWhnTmNiWWxOOENZZVlnTUhPSVF2?=
 =?utf-8?B?TmF6c1VxN2FWK21lbHh2QzBveFFKMGlQM000OHRtYUY1TGpka2txWVVQYU42?=
 =?utf-8?B?MjNYS0NNSTdjb3J6WjR6SkVyQjRnNlVaeHJpd2Zzd09IK21qOUlxbjZwMGF3?=
 =?utf-8?B?Y05tQ3dLcmpza0hUZk92MFpTZTNQd1pvQi9YQnJKU3Nzb3FOWjM0Q1dqME9I?=
 =?utf-8?B?MTdzeHQwYjNsazJvWEVuRFc0Zi81NmFSWDY5SFBNQVJ0YjhmOGdNa2lESUlC?=
 =?utf-8?B?NTc3aFlQK0xsZnFRaitTNno2UW9QeGJpQUZPQ2U4SVhZN0g1alpBWnY5c0tO?=
 =?utf-8?B?U2xCMmJBVkVhN2pjTzVsSlpmb0RTazBKdUg4QmhBbnhZNi9wanZXTm9BMnA0?=
 =?utf-8?B?WVRBRDVRUnBmOHRNNFpLbkRldE5wb29BSWxzZWQ1VlppTnhhVXJid3FPM2JY?=
 =?utf-8?B?R2I4emEzMFVOR1NqMjlNc1haQ2JQTkpNVE9CdzUzbkxQc2tPbjB0OUJITmxI?=
 =?utf-8?Q?5P7Apq9mDao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkpHa3A1b29Da2NJblJDWTUwaElxRVMwYjZ0ZXhWc21WbDZhakxqTUxoME03?=
 =?utf-8?B?T1AxbGFuMVFXamZTSkFPOGFRWmloV3R2M29TYlluV2pUQlJPWTBuMkpveExR?=
 =?utf-8?B?K3pCTjZPb3RrVW83cWVxdmNiOEphUmkvU3lYT3RGSW5HbjhnV2k0MFovTGMz?=
 =?utf-8?B?VXZONnoraGMxZU5sS1plU0IyQnUzUkZoWlAwYVB1cnVUWmEyVnoycGZSWW95?=
 =?utf-8?B?ODBJaTBVK2Eyak1mT29zcUFoOWgzR0ljU2QzeUNIcjBoV0tnWUszQ0NETUFa?=
 =?utf-8?B?a2J4YTNteGZoVldEbFpNYllJOWdUMjFhalVuN0VtT2p4cU9qTy8rMXpsNGkw?=
 =?utf-8?B?aGVpVHk4V214Tkg0UDhVUmVBdm9yR1dKWHVCL25CbXEwc25BN3NNdUVyYW9v?=
 =?utf-8?B?a3JCRlRsRzVaWHFrN21EUE1ZcWdhbWFqSVpTekFUR3hEWUZRSmN4YlFhWUow?=
 =?utf-8?B?eDhHdUlHTm1MSkZqNjFqU1d4Ulc5ZU9Ib3dLYndzQW40SkV5V0hWMTJ5eXZJ?=
 =?utf-8?B?SFp5ZWpWSnBPaVNkRjdJN0RhTEdPZEpVK24yY2liT2dNRlk1VXF1VjhvNXY4?=
 =?utf-8?B?bnY5eUlSNENaYVZjVTFFbVpPZXdPdFdSUlNwSTg1K3NULzJHRnVpeWdaeXJm?=
 =?utf-8?B?Z0ZlQWJEVnZCdU8rdVcvZmtvaVk4OCtKQXZhU2hOU0JudFU4TDNPOHMyTHdS?=
 =?utf-8?B?ZVc5YzVZNUJTcWFGTTQ3N2NYaEt5b0QxN0ZYemtodlBlVEZDL0cvMEE1YW4z?=
 =?utf-8?B?UWhEOFErNUdXb3k2WDhqZERCRXVrUmVYbzh6akcwOTErbjBQVmJTSERrOWp6?=
 =?utf-8?B?MytUeld0VGNlUStmL1VLSkw0ejZTNmZ5R251bytzcm5vMU1Wa3hjTVZhOWgy?=
 =?utf-8?B?b1owYlBIRWVMYlMzUTVkcVB1d25IeGpXVFozSTV1TXg1TEtaQXVNWFRXNjBL?=
 =?utf-8?B?eUl4U3UrdHRDdk9qTVAxc3REaFNFc3E1bVp0UTMxS3YyQ2F2ZWtzYVh0UGdw?=
 =?utf-8?B?STNjZWhyYWJCRENGbFdQU0lhcU1lNExyV3NUUVZjZ2hVQ1AzQytKMGpDREFk?=
 =?utf-8?B?VGJqdzFGaHpRNXR1UmxSbVNJSGRncllSTVlab2pjN2huVW9qK0EzVXZONWth?=
 =?utf-8?B?QVZjeWtxK0dxVlNwRWlYREUvRjhHcHg1dTFqc1c0NjkrTnBYc0MyMFRBUXBQ?=
 =?utf-8?B?Z3ExcForQXg0WkN5M2dtQ3NHRnBrbEJQQ3ZkY3VabGkvOVlQb3psbUNNRjlT?=
 =?utf-8?B?empGYldYWlhaTkNka0s0cFh3VkJ2bmdXZXhNOHd4SGpjbE96OHduNGtuZ2FF?=
 =?utf-8?B?Rm9UaVdXWGcyOU5EM3VDSHlCaTJzQ1pDOFZZMkY0aThVMWRtcWt4MkUyVWtz?=
 =?utf-8?B?NzdiU2xMZnBIOHh0RVdXcEh6b1RYcytYSHlla0o0YmRUaEhpTWFUcElFZnB1?=
 =?utf-8?B?MDh4MFBUWlhkL2JZZ2hENzlEOGY3c0VSbFBiK2p3NWIrUVBieG1uNnJhTkhB?=
 =?utf-8?B?YkJlTFVBaEdMQmI4YjJodXZ6aTUreHc5aE5FaE1SSytBSWtwU2FVL29pWmxT?=
 =?utf-8?B?UzBUR2VBYjkwZjZGczd0NEQzYTdLOHV5T2pSVkIyQTY3dUxlZWtmQXJvSFE4?=
 =?utf-8?B?WWVucFJmYmhsVHQycHcxT3RMa2lBdkZtbUw4cmc1RFFtbEd1VXgzVGtXcXYz?=
 =?utf-8?B?aFZHd1lMcitrVmMvdExjcGtTcEFtbGExelNlaXhuV1Eyc2JQT0ZBSXczaVA2?=
 =?utf-8?B?RWxnbUtBNXBCOWNpcnhkSlIrUGoyODRINnphNkdJSDV1WUJRTGdkYnZKY2dk?=
 =?utf-8?B?cFJlaktYb0xkUEF4SDRsOGdpZUhwY2lld0l6alpKNThSNFYrakdKYVFza2p1?=
 =?utf-8?B?RzlweTFlL2ZnaUh4aUhwZ1hhOHVpY1ZsaHlrMWZrQWNpLzJwd2pNQ3l0cTdu?=
 =?utf-8?B?ZmhkN0Y0SVdkQnNjL3p3ZE1BRjVMeVlIc1pHK2ROMlpmbU1LcGNKeldLcnZq?=
 =?utf-8?B?S0dZcjFvdjROZE9hR0RsYitlUDE1TW1MVkdMaGpxK1U4K3lkRWZTdy9HS0VT?=
 =?utf-8?B?cDZiNmZMRHdxTTJPTEdlc01nbmt0WUgyZDNjRFQyMlJCS3czR2h1MCs5UnhD?=
 =?utf-8?B?RE5CbmYvQ05uNzhVOHNvdWY0d0Y3Tk5Md0tjeEsrWXZ1LzBWbmVJeFZPNjZG?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d406bddb-6bf5-466c-8c8c-08dda76f7149
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:05:24.2244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQkv8FtPxDN4SV27UdIOP6bDvS5R0ux8vSShymqBFGAybm4jt1DNo2OCUFXhHaN0ryCaPuagZfDl1LJYPUTj2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

On Mon, Jun 09, 2025 at 06:00:40AM -0600, K V P, Satyanarayana wrote:
> Hi.
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, June 6, 2025 11:08 PM
> > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>; Winiarski, Michal
> > <michal.winiarski@intel.com>; Lis, Tomasz <tomasz.lis@intel.com>; Auld,
> > Matthew <matthew.auld@intel.com>
> > Subject: Re: [PATCH v6 2/3] drm/xe/vf: Attach and detach CCS copy
> > commands with BO
> > 
> > On Fri, Jun 06, 2025 at 06:15:57PM +0530, Satyanarayana K V P wrote:
> > > Attach CCS read/write copy commands to BO for old and new mem types as
> > > NULL -> tt or system -> tt.
> > > Detach the CCS read/write copy commands from BO while deleting ttm bo
> > > from xe_ttm_bo_delete_mem_notify().
> > >
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > ---
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > >
> > > V5 -> V6:
> > > - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew
> > Brost)
> > >
> > > V4 -> V5:
> > > - Create a list of BBs for the given BO and fixed memory leak while
> > >   detaching BOs. (Matthew Brost).
> > 
> > I'd still personally prefer a single BB per BO rather than having a
> > list. Unless I'm missing something, I think that would work and would be
> > cleaner. Any particular reason you went with a list of BB over a single
> > BB?
> > 
> If the provided size is more than max_mem_transfer_per_pass(), then the copy is divided into chunks.
> The max_mem_transfer_per_pass = MAX_CCS_LIMITED_TRANSFER = 4MB.

The only reason max_mem_transfer_per_pass() exists is so the migration
queue issues jobs that run in a reasonable amount of time and engine
which the queue runs on can be safely shared without migration queue
hogging the timeslices or in worst case getting a preemption timeout
causing a queue reset.

Do the save / restore queues get timesliced once execution starts? I
suspect not but you should follow up with the arch / GuC team on this.
Also you'd need to insert explict preemption points into the BBs if this
is a concern which this series is not doing.

> For buffer sizes bigger than 4MB, we get more BBs and so, created a list to track and free them.
> The Head of the list is stored in the BO, and list is parsed only when more BBs are available in the list.
> For 98% of the cases, only one BB was allocated when checked with 3D benchmark.

I understand what the code is doing - I'm asking for a justification of
using a list vs. a single BB allocation, see above.

If save / restore queues do not get timesliced, then refactor the code
for one BB per BO, IMO much cleaner.

If save / restore queues do get timesliced, then you need add explict
preemption points (MI_ARB_CHECK instruction) into each BB after each
copy.

Matt

> -Satya.
> > > - Fixed review comments (Matthew Brost & Matthew Auld).
> > > - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> > >
> > > V3 -> V4:
> > > - Fixed issues reported by patchworks.
> > >
> > > V2 -> V3:
> > > - Attach and detach functions check for IS_VF_CCS_READY().
> > >
> > > V1 -> V2:
> > > - Fixed review comments.
> > > ---
> > >  drivers/gpu/drm/xe/xe_bb.c                 | 34 ++++++++
> > >  drivers/gpu/drm/xe/xe_bb.h                 |  3 +
> > >  drivers/gpu/drm/xe/xe_bb_types.h           |  1 +
> > >  drivers/gpu/drm/xe/xe_bo.c                 | 23 +++++
> > >  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
> > >  drivers/gpu/drm/xe/xe_migrate.c            | 98 ++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_migrate.h            |  4 +
> > >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 77 +++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
> > >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
> > >  10 files changed, 254 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > > index 9570672fce33..ee31556e00bc 100644
> > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > @@ -60,6 +60,40 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > dwords, bool usm)
> > >  	return ERR_PTR(err);
> > >  }
> > >
> > > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > > +{
> > > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +	struct xe_sa_manager *bb_pool;
> > > +	int err;
> > > +
> > > +	if (!bb)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	/*
> > > +	 * We need to allocate space for the requested number of dwords,
> > > +	 * one additional MI_BATCH_BUFFER_END dword, and additional
> > buffer
> > > +	 * space to accommodate the platform-specific hardware prefetch
> > > +	 * requirements.
> > > +	 */
> > > +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > > +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) +
> > bb_prefetch(gt));
> > > +
> > > +	if (IS_ERR(bb->bo)) {
> > > +		err = PTR_ERR(bb->bo);
> > > +		goto err;
> > > +	}
> > > +
> > > +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> > > +	bb->len = 0;
> > > +
> > > +	return bb;
> > > +err:
> > > +	kfree(bb);
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > >  static struct xe_sched_job *
> > >  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> > > index fafacd73dcc3..32c9c4c5d2be 100644
> > > --- a/drivers/gpu/drm/xe/xe_bb.h
> > > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > > @@ -13,8 +13,11 @@ struct dma_fence;
> > >  struct xe_gt;
> > >  struct xe_exec_queue;
> > >  struct xe_sched_job;
> > > +enum xe_sriov_vf_ccs_rw_ctxs;
> > >
> > >  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> > > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> > >  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> > >  				      struct xe_bb *bb);
> > >  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue
> > *q,
> > > diff --git a/drivers/gpu/drm/xe/xe_bb_types.h
> > b/drivers/gpu/drm/xe/xe_bb_types.h
> > > index b7d30308cf90..b2358cc051ff 100644
> > > --- a/drivers/gpu/drm/xe/xe_bb_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bb_types.h
> > > @@ -12,6 +12,7 @@ struct drm_suballoc;
> > >
> > >  struct xe_bb {
> > >  	struct drm_suballoc *bo;
> > > +	struct list_head list;
> > >
> > >  	u32 *cs;
> > >  	u32 len; /* in dwords */
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 61d208c85281..b2ed5a36ab3d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -31,6 +31,7 @@
> > >  #include "xe_pxp.h"
> > >  #include "xe_res_cursor.h"
> > >  #include "xe_shrinker.h"
> > > +#include "xe_sriov_vf_ccs.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > @@ -948,6 +949,20 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > >  	dma_fence_put(fence);
> > >  	xe_pm_runtime_put(xe);
> > >
> > > +	/*
> > > +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> > > +	 * BBs from BO as it is no longer needed.
> > > +	 */
> > > +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> > > +	    new_mem->mem_type == XE_PL_SYSTEM)
> > > +		xe_sriov_vf_ccs_detach_bo(bo);
> > > +
> > > +	if (IS_SRIOV_VF(xe) &&
> > > +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> > > +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type ==
> > XE_PL_TT)) &&
> > > +	    handle_system_ccs)
> > > +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> > > +
> > >  out:
> > >  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type ==
> > XE_PL_SYSTEM) &&
> > >  	    ttm_bo->ttm) {
> > > @@ -958,6 +973,9 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > >  		if (timeout < 0)
> > >  			ret = timeout;
> > >
> > > +		if (IS_VF_CCS_BB_VALID(xe, bo))
> > > +			xe_sriov_vf_ccs_detach_bo(bo);
> > > +
> > >  		xe_tt_unmap_sg(ttm_bo->ttm);
> > >  	}
> > >
> > > @@ -1482,9 +1500,14 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> > >
> > >  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
> > *ttm_bo)
> > >  {
> > > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > > +
> > >  	if (!xe_bo_is_xe_bo(ttm_bo))
> > >  		return;
> > >
> > > +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> > > +		xe_sriov_vf_ccs_detach_bo(bo);
> > > +
> > >  	/*
> > >  	 * Object is idle and about to be destroyed. Release the
> > >  	 * dma-buf attachment.
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index eb5e83c5f233..481b8e0d8ab1 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -78,6 +78,9 @@ struct xe_bo {
> > >  	/** @ccs_cleared */
> > >  	bool ccs_cleared;
> > >
> > > +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF
> > */
> > > +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
> > > +
> > >  	/**
> > >  	 * @cpu_caching: CPU caching mode. Currently only used for
> > userspace
> > >  	 * objects. Exceptions are system memory on DGFX, which is always
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 8f8e9fdfb2a8..d7f3009260ee 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -940,6 +940,104 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> > >  	return fence;
> > >  }
> > >
> > > +/**
> > > + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> > > + * @m: The migration context.
> > > + * @src_bo: The buffer object @src is currently bound to.
> > > + * @read_write : Creates BB commands for CCS read/write.
> > > + *
> > > + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> > > + * memory and vice versa.
> > > + *
> > > + * This function should only be called for IGPU.
> > > + *
> > > + * Return: 0 if successful, negative error code on failure.
> > > + */
> > > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > > +			   struct xe_bo *src_bo,
> > > +			   int read_write)
> > 
> > s/int read_write/enum xe_sriov_vf_ccs_rw_ctxs
> > 
> > > +
> > > +{
> > > +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> > > +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> > > +	struct ttm_resource *src = src_bo->ttm.resource;
> > > +	struct xe_gt *gt = m->tile->primary_gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct xe_res_cursor src_it, ccs_it;
> > > +	u64 size = src_bo->size;
> > > +	u64 src_L0, src_L0_ofs;
> > > +	u32 src_L0_pt;
> > > +	int err;
> > > +
> > > +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> > > +
> > > +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> > > +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> > > +			&ccs_it);
> > > +
> > > +	while (size) {
> > > +		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END +
> > Flush + NOP */
> > > +		struct xe_bb *bb;
> > > +		u32 flush_flags = 0;
> > > +		u64 ccs_ofs, ccs_size;
> > > +		u32 ccs_pt;
> > > +
> > > +		u32 avail_pts = max_mem_transfer_per_pass(xe) /
> > LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > > +
> > > +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> > > +
> > > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > > +					      avail_pts);
> > > +
> > > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
> > &ccs_ofs,
> > > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > > +
> > > +		/* Add copy commands size here */
> > > +		batch_size += EMIT_COPY_CCS_DW;
> > > +
> > > +		bb = xe_bb_ccs_new(gt, batch_size, read_write);
> > > +		if (IS_ERR(bb)) {
> > > +			drm_dbg(&xe->drm, "BB allocation failed.\n");
> > 
> > s/drm_dbg/xe_sriov_err - I think.
> > 
> > > +			err = PTR_ERR(bb);
> > > +			goto err_ret;
> > > +		}
> > > +
> > > +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> > > +
> > > +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > +
> > > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
> > MI_FLUSH_DW_OP_STOREDW |
> > > +					MI_FLUSH_IMM_DW;
> > > +		bb->cs[bb->len++] = MI_NOOP;
> > > +		bb->cs[bb->len++] = MI_NOOP;
> > > +
> > > +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> > src_is_pltt,
> > > +						  src_L0_ofs, dst_is_pltt,
> > > +						  src_L0, ccs_ofs, true);
> > > +
> > > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
> > MI_FLUSH_DW_OP_STOREDW |
> > > +					MI_FLUSH_IMM_DW | flush_flags;
> > > +		bb->cs[bb->len++] = MI_NOOP;
> > > +		bb->cs[bb->len++] = MI_NOOP;
> > > +
> > > +		if (size == src_bo->size) {
> > > +			src_bo->bb_ccs[read_write] = bb;
> > > +			INIT_LIST_HEAD(&src_bo->bb_ccs[read_write]->list);
> > > +		} else {
> > > +			list_add(&bb->list, &src_bo->bb_ccs[read_write]-
> > >list);
> > > +		}
> > > +
> > > +		size -= src_L0;
> > > +	}
> > > +	return 0;
> > > +
> > > +err_ret:
> > > +	return err;
> > > +}
> > > +
> > >  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64
> > src_ofs,
> > >  				 u32 size, u32 pitch)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > > index fb9839c1bae0..ab5ebb44d2c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> > >  				  struct ttm_resource *dst,
> > >  				  bool copy_only_ccs);
> > >
> > > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > > +			   struct xe_bo *src_bo,
> > > +			   int read_write);
> > > +
> > >  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > >  			     unsigned long offset, void *buf, int len,
> > >  			     int write);
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > index 41fe1f59e0e9..4b5cfc0d421b 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > > @@ -5,6 +5,7 @@
> > >
> > >  #include "instructions/xe_mi_commands.h"
> > >  #include "instructions/xe_gpu_commands.h"
> > > +#include "xe_bb.h"
> > >  #include "xe_bo.h"
> > >  #include "xe_device.h"
> > >  #include "xe_migrate.h"
> > > @@ -184,3 +185,79 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > >  err_ret:
> > >  	return err;
> > >  }
> > > +
> > > +/**
> > > + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> > > + * @bo: the &buffer object to which batch buffer commands will be added.
> > > + *
> > > + * This function shall be called only by VF. It inserts the PTEs and copy
> > > + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> > > + * function.
> > > + *
> > > + * Returns: 0 if successful, negative error code on failure.
> > > + */
> > > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> > > +{
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > > +	struct xe_migrate *migrate;
> > > +	struct xe_tile *tile;
> > > +	int tile_id, ctx_id;
> > 
> > ctx_id can be enum xe_sriov_vf_ccs_rw_ctxs
> > 
> > > +	struct xe_bb *bb;
> > > +	int err = 0;
> > > +
> > > +	if (!IS_VF_CCS_READY(xe))
> > > +		return 0;
> > > +
> > > +	for_each_tile(tile, xe, tile_id) {
> > > +		for_each_ccs_rw_ctx(ctx_id) {
> > > +			bb = bo->bb_ccs[ctx_id];
> > > +			if (bb)
> > > +				xe_sriov_err(xe, "Probable memory leak\n");
> > > +
> > > +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> > > +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> > > +		}
> > > +	}
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the
> > BO.
> > > + * @bo: the &buffer object from which batch buffer commands will be
> > removed.
> > > + *
> > > + * This function shall be called only by VF. It removes the PTEs and copy
> > > + * command instructions from the BO. Make sure to update the BB with
> > MI_NOOP
> > > + * before freeing.
> > > + *
> > > + * Returns: 0 if successful, negative error code on failure.
> > > + */
> > > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> > > +{
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > > +	struct xe_bb *bb, *pos, *temp;
> > > +	struct xe_tile *tile;
> > > +	int tile_id, ctx_id;
> > 
> > ctx_id can be enum xe_sriov_vf_ccs_rw_ctxs
> > 
> > Matt
> > 
> > > +
> > > +	if (!IS_VF_CCS_READY(xe))
> > > +		return 0;
> > > +
> > > +	for_each_tile(tile, xe, tile_id) {
> > > +		for_each_ccs_rw_ctx(ctx_id) {
> > > +			bb = bo->bb_ccs[ctx_id];
> > > +			if (!bb)
> > > +				continue;
> > > +
> > > +			list_for_each_entry_safe(pos, temp, &bb->list, list) {
> > > +				list_del(&pos->list);
> > > +				memset(pos->cs, MI_NOOP, pos->len *
> > sizeof(u32));
> > > +				xe_bb_free(pos, NULL);
> > > +			}
> > > +
> > > +			/* Free-up head BB */
> > > +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> > > +			xe_bb_free(bb, NULL);
> > > +			bo->bb_ccs[ctx_id] = NULL;
> > > +		}
> > > +	}
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > index 5df9ba028d14..5d5e4bd25904 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > > @@ -7,7 +7,10 @@
> > >  #define _XE_SRIOV_VF_CCS_H_
> > >
> > >  struct xe_device;
> > > +struct xe_bo;
> > >
> > >  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> > > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> > >
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > index f67f002c7a96..9545c5cfc2b1 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > > @@ -28,6 +28,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
> > >  	XE_SRIOV_VF_CCS_RW_MAX_CTXS
> > >  };
> > >
> > > +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> > > +		struct xe_device *___xe = (xe); \
> > > +		struct xe_bo *___bo = (bo); \
> > > +		IS_SRIOV_VF(___xe) && \
> > > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> > > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> > > +		})
> > > +
> > >  struct xe_migrate;
> > >  struct xe_sa_manager;
> > >
> > > --
> > > 2.43.0
> > >
