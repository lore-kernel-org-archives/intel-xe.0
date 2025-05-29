Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F847C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 01:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3CA10E1DA;
	Thu, 29 May 2025 01:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPok4yRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9542910E204
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748481612; x=1780017612;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=62AastAcDAByFwOeOHHBq9c9fQEUTYmRg8Q9z3gQhis=;
 b=SPok4yRygDnht24v4vr6Yanejvq+6xHTPpGoZAiWZFBVdUWpmfKP+3US
 3rsWBhG5FrvymXdCSCjLmmEfy85FqodoVrmFGdO1hIClGaoLpjXmj/N6b
 Pb6KX1Pn2qbsPoafEK1D/xoh6xsmZygcKRgQ7XBQQTAgBkC/yPpwICLhx
 ENDU1MYcH49pQwfi7fDPzox2M1XpJfbXlZIoFDu0J8yvmoOJVoN83JMJR
 BLPWjF2NNZfZRgiq29S8KidNMNGyLe+3ocXW8fcFnhCdkEe/8MzJIo8fu
 mJGgqvwaLBcvmZvopNOZUbft7Kh02cud8bPEe+rUV6Vs5qCXkLe6cwDIR g==;
X-CSE-ConnectionGUID: +gLV06FtQaSk1kTVf+XbJw==
X-CSE-MsgGUID: upiCTwYWRr+cg5erM/cw1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50453825"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208,217";a="50453825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:20:10 -0700
X-CSE-ConnectionGUID: 1CVFgEPISR2chRlXMRmGig==
X-CSE-MsgGUID: w8PcljhtRBybi4L4t8N3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
 d="scan'208,217";a="143308778"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:20:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 18:20:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 18:20:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.67)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 18:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUAQVqmhhZz2KAaJ7Vvn8afQei/HXbRearE0F0Tm8g/Yap6XqkwZL+Nvg6CT9FHGBwlACKcEHCF5GaidOu5iXDazhbqbhKXqqX7GTV3m0RZd2xIuzZTKPgij4TgF34pYBqNJbRAvnTpI0TH8BG1pFSb6AuNhq+S4tJOEe0nwmSRfuc1q6NReM3IqKNaVvocG6SKmyK6Z71nEQahJOEUnby5O3t0/wQKS54MTNNriR2OM15plhnMRE/RThn8km4CR+3Y/rpDOSzoCz68mIAxhKdkD9Sa5l95cIRwzhPZoyv0/pceygE8Y0fZyy71FS9LnzMyCtYyulZMyftZPuVKnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pGxIMRRZeMHiWwY2JiGhKT1PYD5bF5Q5CKhz6O1K+4=;
 b=Ldi/a7OL9BmIua1pX82F2L8pteUlt7yXaLs0RuIoQuXYCaESK1HGGzUFOhzykbJgEPyudAm6V444675YG8QYZsP25kZt/2W68zU37UPrLV2e/PV55EecBFhvFRVeySgwbSHYzA4MgDxINWrlfJStQkdG9xpqh+lbvG/euFM+GIo/IYOoYpCRpO6F7EhUeeWxcsQ/Ts46gaN57/rcHe6gPNCeUIOquOpFPzQowYoYQCTYi/tvZMfUviYKRv3gU8uGIC+J7TD1aNUfwbeq8FF5ltoYUMWBO+af2AC1Uz8YWa0AkX80uK9fkWFBM4sQXAx/JdVvMW2SbTtXlp8mKAst6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by IA4PR11MB9009.namprd11.prod.outlook.com (2603:10b6:208:56f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 01:20:00 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:20:00 +0000
Content-Type: multipart/alternative;
 boundary="------------4dppTigdfyV04pZ7dl076lMv"
Message-ID: <aa15a9d5-526f-4c7c-b2a5-c581a9e8faca@intel.com>
Date: Thu, 29 May 2025 03:19:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-7-tomasz.lis@intel.com>
 <jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3>
X-ClientProxiedBy: VI1PR0902CA0039.eurprd09.prod.outlook.com
 (2603:10a6:802:1::28) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|IA4PR11MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: d400cc39-5fe0-4ecc-56f5-08dd9e4eee4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZNdWlkaWxYbXE5WDVsVnBGY2R1UUJ0TlZoeTdWT08yV0xQcWcyaUlDT29H?=
 =?utf-8?B?WUFMaE9RTjd1eVBjTUV0NG9QaE1MeXQyNytyTGc2RE91Q25Sc2w5OGhTTnNX?=
 =?utf-8?B?WXpVbjlGdmlYeTU4ZWtra3JsTjNNSGtibkxoSTUxZGlUeEljNU56T3J5TnJB?=
 =?utf-8?B?bFhsV3ljUkp6c3ZJem8wK3daaDJEdmFlWjZJbzJ1TEpBVGt2MnRCenQyYjFu?=
 =?utf-8?B?YnE3cU50NEZZL2VRRjVwTGlocFRTVmpudHZWbkdIenEzYzRxT3FUcmJXWjhD?=
 =?utf-8?B?SU1ZS0lvUXZWaHdCZjY2Q0c1SHg5Slprb3ZBekVseFFEYnBMQUVqd3piaTNE?=
 =?utf-8?B?b3BwMk9MbjlBQ3RKU1RPMjBvakZ2R0xOakdjSGVNQ1ZxZzZ4ajU3aTQ0NHoz?=
 =?utf-8?B?K3BRbVNWNU83R3JwVjBzMU0zdDZ5QXkvLzdVNU0rdFR1YlFmRWUzUmNkMWY0?=
 =?utf-8?B?Z3hqNms0RWI5REJ0ZEpXajhyNWQ0TDNmbmhMMkVNMVJCVTZSTEh1eUpySTRC?=
 =?utf-8?B?NUNKd3B3WTVROUkwMERMV1NsenIxT3lqcVVhcWdCUlJDcVRuVFNiNkduOVlp?=
 =?utf-8?B?K2pQU0d5SDhEWldKWlBzREFQNi9LRkhJNXZSNXFYVFVSK2srY3g0eEhCUGlR?=
 =?utf-8?B?MVdrREVaS1ZpREliMW5CcjZPR1YyR3drbnRzSzViSGVQSU81dG1wMnNLN0FO?=
 =?utf-8?B?U2VBRWlxUFExVVlEZmxkWCtXcElWSWoyTTNKa0lxdllNcHZPd0tuNU9uYUth?=
 =?utf-8?B?U2JDVW1kem5nNkg3SEdRUHNpRW8waXc5RWt5a2ZONnMzLzU4Q0xNY1ExWUwy?=
 =?utf-8?B?dEk2amcxbTFZaTN3T282MElXZk5Vc2pHY3J5N2czRmN3UVpZWE5BQXZRVW1K?=
 =?utf-8?B?WHAvaDhEUk5SU3dXY3FaZzV4SllFVE5kdmI0NWl4SFBZZGlZK0dRa2lYSXp6?=
 =?utf-8?B?RzU0cHYzb1BsZGV3VkFOcTBXOHAvMzUyV0hkQ1lPZ0JPSk1oaDh5NU15Rm54?=
 =?utf-8?B?TmVuVGtWZ3lnR1MzNDRja3lWTDkyVzVrS3hhTEExdVVBUUpVUmFpeitlZW9l?=
 =?utf-8?B?Y2sxN05JSlRMN2JEZmJ5MzJhZkhySzRhNUR2TGwrT1p1a0w1RWZ2UTR1am5x?=
 =?utf-8?B?Q2UxT0lQZ3h0WUoxM0hldGtpMTBmRzRnV1EybThZekU0WDNPc2g2OU5rbW5N?=
 =?utf-8?B?cFU4bitxMHJYanY0UWhUSmhZTjJwSzBKMWdKM1Faa3lCbDh4RmtjYkVxQlkx?=
 =?utf-8?B?RjNKcjFqY0hHL0FnZWc2elk0czZ3NXd2anA0d3JxWmZWRzhBWkl5RFl4RHUr?=
 =?utf-8?B?TUNPWXV4ME5TQVh1Vjk0UlpmdmtUclRINTljdHNDbUhzU1RtQXJJWmpOc1ZQ?=
 =?utf-8?B?bXVyTEQ0VGhBN1Zrc29Mcy85Uzhxa0dKbGVnVjBQaUIvWG1RU1VSZ0kxM0lS?=
 =?utf-8?B?cVJVWlgrMUFDQi93RENBNmR6MEI5bEJjSTU3S2xXNVRVTWZodUhsTTA2anIx?=
 =?utf-8?B?SHJIVGdjQlJ3Q3ZaY0ovS1pmeVBXQ2xGaFE2K2lSZjhrd3FhdlNEUUlXR2cv?=
 =?utf-8?B?VFlNSGd5NDZ2bm94TmFMR3pOdVp3TXZlRVA4dHJUNU5mbWIwYndaRE5vY1Fa?=
 =?utf-8?B?dmowN0pBUzhzQkJaRU03dVhEL0Y4a2tCMzUvbVFpTThiNkt0RDNTNVdoczZZ?=
 =?utf-8?B?dXRkMTNjYkVkTkNzUEYrWFN3eVVTM2RuNkwxMFpzUnVBek5oQkIxakQ1ZTlx?=
 =?utf-8?B?b1VNNkprYXk5QWJVUTJaem1CazNMZDlxSEhHLzFSbTg4RXFsajNiRmkxMFhx?=
 =?utf-8?B?S0VEOGZ4bU1HRi9KUk1lRGpjNVFxK0V5d1dpdi9wdjUyUERLcVMyUTZieHpj?=
 =?utf-8?B?STRUWE5FKzg0dURZWmQxNWRTRGN4N0VTSEkyY0hYeEV1UXRheHNRNEVjd1lu?=
 =?utf-8?Q?pRTticdoY2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRGdVYwTDd4bFA4Smdld3p6UGZYWlNqRDhOVmJKUXdIQTFzZjkwWEdQUDVD?=
 =?utf-8?B?VTEvTDNqR0tybDRyZmYxWFpjNU45aXlXZFV0aHovRVBDcFF1UEwvcjl1dmoy?=
 =?utf-8?B?VmhMR0JsTlBhTkZvaUZtYTRSZ253ZVRVVUdYa2dCVWt0aVdOaFFkZkJ6UnQ4?=
 =?utf-8?B?Wk9GVjVlZkpkYjZlQVc1SDNMdU41SHdtd3BQcWlKV2M2U0NQV1Q3WUxFL1hL?=
 =?utf-8?B?bENDRFRHWXpEN1JkTDZvVCtDUkxrSTEzc0FCWWFNNUEvOWlFUGJEa3dmalJZ?=
 =?utf-8?B?dFdRelBVcWFVM1ZXLzhXc1VsbGdpTGdzVy81ZnZWMlN4eHFnS2pyTDBpdDZV?=
 =?utf-8?B?eTc5WFBnNlFEQlpXNHVMeFFZalArRFduY0RMK1ErT001bXZEY2t6N1lWQXdB?=
 =?utf-8?B?WHh0YVB2OEUvSUs2Q09HR0NId1FrdlJONThQWDFxNGViUnpSTk1sZ0V5ckU2?=
 =?utf-8?B?VU43ZW1ZSFdGam5STXpoV1BWZWlkNGFXRFd5bFNUMHg1ZStWeUxtWnovQkE5?=
 =?utf-8?B?SEpWTVlTQ2NrY1hzMy8xeG1DcUdvOG1kWlRKS0NzNDFGenNtSm9EbzRUbE9v?=
 =?utf-8?B?bEdtUldNZEVjYlk0WDRNNlJ0THoxc016UTlwTGo5SHdJdmprRFBVY0FvQmdm?=
 =?utf-8?B?RmpwZHF3WHBHMmUxcGhKNGdhNDdHM0VlVy9zZDNRcmY1OFN0V1lSWXNoUnVy?=
 =?utf-8?B?bHdWOUd6OFF1OUdhTGo0eitpVTNYaGJFQUxtSzE2YlNRQm5GUUpvQ2l0c21M?=
 =?utf-8?B?MGFMOEROUEM3MmlHYStNamRYWkxucERYOVhsUjRFNE9tOEhqM0NrOVJpV29V?=
 =?utf-8?B?VW5reENPK1c4Y0tzeGgyQXBid2VqWDFyMW05V1hYbTVPcTl1eXVSSkx6SXRZ?=
 =?utf-8?B?RWtrU3RRRmtTdEJLOTBWQVNSQXFTcjRreXZvNE9VRVVLV0d5ZkVOZ1dxcFpx?=
 =?utf-8?B?WlFUOGNwNXdzVmFMUFNBWEgzdTRyQ2MwdElWS2pMR2hXTWpLc3R5amJFUUw3?=
 =?utf-8?B?cUh3dHpackdWR3UvY2djNTA2QTVpWHJ4cFZwSnN0WmhBMFc4Yk5UMUVkR0F1?=
 =?utf-8?B?UWEwTC90VitJcVBlelRKWEJvTWw3REhhQ3V5UEVmaEc0RnQ1bjJQUnRtN25W?=
 =?utf-8?B?L3N1M2NNanl0eHlmSktUNzFWcCtlbkpMZ0d6VGRqQU1hcXUvNVFIR1VieExi?=
 =?utf-8?B?MCtjNWxhZm1BcmxrVG1oK2YyMTMzZUJEOTJQMW85RVc1ZC9LQncyRkVFdGs3?=
 =?utf-8?B?NXRkMjFITWNkUWpHcEgyQkFFTjZmaG0vc3Uwa3RaZkJZN2JLTGtKczJwSHJX?=
 =?utf-8?B?N28zMTNBSTdYZ0N1b25FWSt3NVFWV2dYMjMrU28zbVQ1Y3RoUjYwbzlVUEV0?=
 =?utf-8?B?dHUybitxNnFBRGZpZ3pGYlNsUC9ubTF1TlB4ajJzckpyRWVlUU1sU2txdW5M?=
 =?utf-8?B?dXo2RVoxaktSdEcrWDFDTEhqRVN1dG02K3FEclVuRnNRK0ZHT0FCMFZLUlVU?=
 =?utf-8?B?MnJOa1BNcURXeEl2ZmJERW1uUllZcFpXaHhuWHhWdmNydlFpcm80cWJHT3I5?=
 =?utf-8?B?WlRBQ3ViWjRNTUlzMGE1NkQrY05YYVYvZlp1MG5kVGxtME51M2RCbUhXVUVs?=
 =?utf-8?B?V2JoNUgyWXMrNWhlN1czOEUrZVRPMlRFdDJBdWpoMDVnRHdtTWVSWWJaRzFl?=
 =?utf-8?B?UGV0d2hGMGRIcVhBak9TRnpyMzdETjhtYXRWdEw1a1k2dVdvZ2RXT3hoSWVh?=
 =?utf-8?B?dzBpQnNHVnBzN1BKc3pVcGhCUWx6RlBhSU5vL1UrZFhBMUlPcUducDZlYkkv?=
 =?utf-8?B?RGJGTmVKNkx1eS92SHdxY2VIbDRhVW1PMmNDQXNSSkt5d2lYUmhWV0FkTG9X?=
 =?utf-8?B?b0hqRnVTT3RJTXdkaVhhRWEwYW5TT1BmTmYrTlJPZUtJUG8waUlnQ3p0N1l0?=
 =?utf-8?B?OTc1MjhxaVp6bnJoVkdQUGdmM0lMODdjaTZPejd4NTdsTU5nNXJZRFFmM2dy?=
 =?utf-8?B?NGR3UlhJL0lMYzgrMmlwc0YrTmdJTHpKdVNLV0I3WDRGYWNXM1FnSTl2T0tO?=
 =?utf-8?B?Y1N6NmpmZGdVdmE2QWcxZm1kV2xJY0MrcW81dURLZURvQkhKazBKYXdxeDc0?=
 =?utf-8?Q?+42RFr3nezdAixzcQbDhLlIuF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d400cc39-5fe0-4ecc-56f5-08dd9e4eee4f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:20:00.3396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2WDb3HZoiQp770MbGY3SGT+3QpOFcz85tAuhk/dJYmMYNIhyf3nyZp8qyqYJFRgJSBmta6HZAUGFeO/B8sjfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9009
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

--------------4dppTigdfyV04pZ7dl076lMv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28.05.2025 12:44, Michał Winiarski wrote:
> On Tue, May 20, 2025 at 01:19:24AM +0200, Tomasz Lis wrote:
>> All contexts require an update of state data, as the data includes
>> GGTT references to memirq-related buffers.
>>
>> Default contexts need these references updated as well, because they
>> are not refreshed when a new context is created from them.
>>
>> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>>    set_memory_based_intr()
>> v3: Renamed parameter, reordered parameters in some functs
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
>>   drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
>>   4 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index d696c8410a32..9c3e568400e0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1051,6 +1051,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>>   {
>>   	int i;
>>   
>> -	for (i = 0; i < q->width; ++i)
>> +	for (i = 0; i < q->width; ++i) {
>> +		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);
> What if we're not using memirq?

We currently do not support VF Migration with Xe driver on any platform 
without memory-based IRQs.

But will add `xe_device_uses_memirq()` condition - MMIO IRQs should not 
need any additional code within VF recovery (we're already re-enabling 
IRQs during kickstart), so that's the only thing required for the support.

>
>>   		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>> +	}
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 525565480aef..959ac9c5d39a 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>>   	return data;
>>   }
>>   
>> +/**
>> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
>> + *   of given engine.
>> + * @hwe: the &xe_hw_engine struct instance
>> + */
>> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_gt *gt = hwe->gt;
>> +	u32 *regs;
>> +
>> +	if (!gt->default_lrc[hwe->class])
>> +		return;
>> +
>> +	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
>> +	set_memory_based_intr(regs, hwe);
> We're using set_memory_based_intr() for gt->default_lrc, and
> xe_lrc_update_memirq_regs_with_address() for q->lrc.
>
> Why do we need 2 different methods to do that?

Real context state may be in LMEM, while default is just a CPU-side buffer.

In Xe, we use iosys_map struct to write shared memory, and we have 
wrappers over the kernel functions to handle write/read from instances 
of that struct.

Therefore, we cannot reuse `set_memory_based_intr()` for real LRCs. 
Well, we could allocate a cpu-side buffer, copy data to it, call the 
`set_memory_based_intr()` and the copy again. This is actually what I 
did originally - but it was problematic because required `kalloc()` so 
it got changed on previous round of review.

Going opposite way, we could use 
`structiosys_mapmap=IOSYS_MAP_INIT_VADDR(regs);` and use the 
`xe_lrc_update_memirq_regs_with_address()` on both real and default LRC. 
But that would require getting rid of `xe_lrc_write_ctx_reg()` reuse, 
and it wouldn't really eliminate any code - `set_memory_based_intr()` 
still have to stay.

So - yes, we use two different methods, but only one is implemented in 
this patch.

>> +}
>> +
>> +/**
>> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
>> + *   for given LRC.
>> + * @lrc: the &xe_lrc struct instance
>> + * @hwe: the &xe_hw_engine struct instance
>> + */
>> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
>> +
>> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
>> +			     xe_memirq_enable_ptr(memirq));
>> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
>> +			     xe_memirq_status_ptr(memirq, hwe));
>> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
>> +			     xe_memirq_source_ptr(memirq, hwe));
>> +}
>> +
>>   static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>>   {
>>   	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index e7a99cfd0abe..801a6b943f6e 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>>   u32 *xe_lrc_regs(struct xe_lrc *lrc);
>>   void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
>> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
>>   
>>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 0f0d1a97ae1d..0a9761b6ffb5 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>> +{
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	for_each_hw_engine(hwe, gt, id)
>> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
>> +}
> Device-level functions live in xe_sriov_vf.c, GT-level functions live in
> xe_gt_sriov_vf.c

ack

-Tomasz

> Thanks,
> -Michał
>
>> +
>>   static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>>   	unsigned int id;
>>   
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>>   		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +	}
>>   }
>>   
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> -- 
>> 2.25.1
>>
--------------4dppTigdfyV04pZ7dl076lMv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28.05.2025 12:44, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3">
      <pre wrap="" class="moz-quote-pre">On Tue, May 20, 2025 at 01:19:24AM +0200, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">All contexts require an update of state data, as the data includes
GGTT references to memirq-related buffers.

Default contexts need these references updated as well, because they
are not refreshed when a new context is created from them.

v2: Update addresses by xe_lrc_write_ctx_reg() rather than
  set_memory_based_intr()
v3: Renamed parameter, reordered parameters in some functs

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
 drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d696c8410a32..9c3e568400e0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1051,6 +1051,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
 {
 	int i;
 
-	for (i = 0; i &lt; q-&gt;width; ++i)
+	for (i = 0; i &lt; q-&gt;width; ++i) {
+		xe_lrc_update_memirq_regs_with_address(q-&gt;lrc[i], q-&gt;hwe);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What if we're not using memirq?</pre>
    </blockquote>
    <p>We currently do not support VF Migration with Xe driver on any
      platform without memory-based IRQs.</p>
    <p>But will add `xe_device_uses_memirq()` condition - MMIO IRQs
      should not need any additional code within VF recovery (we're
      already re-enabling IRQs during kickstart), so that's the only
      thing required for the support.<br>
    </p>
    <blockquote type="cite" cite="mid:jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		xe_lrc_update_hwctx_regs_with_address(q-&gt;lrc[i]);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 525565480aef..959ac9c5d39a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	return data;
 }
 
+/**
+ * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
+ *   of given engine.
+ * @hwe: the &amp;xe_hw_engine struct instance
+ */
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe-&gt;gt;
+	u32 *regs;
+
+	if (!gt-&gt;default_lrc[hwe-&gt;class])
+		return;
+
+	regs = gt-&gt;default_lrc[hwe-&gt;class] + LRC_PPHWSP_SIZE;
+	set_memory_based_intr(regs, hwe);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We're using set_memory_based_intr() for gt-&gt;default_lrc, and
xe_lrc_update_memirq_regs_with_address() for q-&gt;lrc.

Why do we need 2 different methods to do that?
</pre>
    </blockquote>
    <p>Real context state may be in LMEM, while default is just a
      CPU-side buffer.</p>
    <p>In Xe, we use iosys_map struct to write shared memory, and we
      have wrappers over the kernel functions to handle write/read from
      instances of that struct.</p>
    <p>Therefore, we cannot reuse `set_memory_based_intr()` for real
      LRCs. Well, we could allocate a cpu-side buffer, copy data to it,
      call the `set_memory_based_intr()` and the copy again. This is
      actually what I did originally - but it was problematic because
      required `kalloc()` so it got changed on previous round of review.<br>
    </p>
    <p>Going opposite way, we could use `<span class="k">struct</span><span class="w"> </span><span class="nc"><span class="highlighted">iosys_map</span></span><span class="w"> </span><span class="n">map</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n"><span class="highlighted">IOSYS_MAP</span>_INIT_VADDR</span><span class="p">(regs</span><span class="p">);</span><span class="w"></span>`
      and use the `<span style="white-space: pre-wrap">xe_lrc_update_memirq_regs_with_address()` on both real and default LRC. But that would require getting rid of `xe_lrc_write_ctx_reg()` reuse, and it wouldn't really eliminate any code - </span>`set_memory_based_intr()`
      still have to stay.<br>
    </p>
    <p>So - yes, we use two different methods, but only one is
      implemented in this patch.<br>
    </p>
    <blockquote type="cite" cite="mid:jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/**
+ * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
+ *   for given LRC.
+ * @lrc: the &amp;xe_lrc struct instance
+ * @hwe: the &amp;xe_hw_engine struct instance
+ */
+void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	struct xe_memirq *memirq = &amp;gt_to_tile(hwe-&gt;gt)-&gt;memirq;
+
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
+			     xe_memirq_enable_ptr(memirq));
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
+			     xe_memirq_status_ptr(memirq, hwe));
+	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
+			     xe_memirq_source_ptr(memirq, hwe));
+}
+
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
 	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc-&gt;gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7a99cfd0abe..801a6b943f6e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
+void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0f0d1a97ae1d..0a9761b6ffb5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		xe_default_lrc_update_memirq_regs_with_address(hwe);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Device-level functions live in xe_sriov_vf.c, GT-level functions live in
xe_gt_sriov_vf.c</pre>
    </blockquote>
    <p>ack</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3">
      <pre wrap="" class="moz-quote-pre">
Thanks,
-Michał

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_gt_default_lrcs_hwsp_rebase(gt);
 		xe_guc_contexts_hwsp_rebase(&amp;gt-&gt;uc.guc);
+	}
 }
 
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4dppTigdfyV04pZ7dl076lMv--
