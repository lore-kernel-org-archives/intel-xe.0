Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7879DC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5F310F6DD;
	Wed,  8 May 2024 20:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzbaba1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FD210F6DD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198890; x=1746734890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5wYpH3njiaDzmUZNhogmnFo04u5qOtnI8iPvki1mnug=;
 b=lzbaba1Vv0Asi4Ur1bnGiq+YNF/X6sBFFlz+1iM797J2qFCNo3sSBK0c
 4UDJN/ryHrCMtpLU2Fc9B/ja6QeX0dnyx/LPSMNaQ9E6SGBhEWfU5vQYj
 ji+2aOVFq8u69woG7pf1HCfU7EgyFipTdbUjdtcjGplhdTnuk8dp4sqXA
 eqyiVcsyxcDG4nmwNbZ3+7jBgJ+EJD/BwyLMREvFuGgaS5GFAmc3mZoaf
 HsSy0P0Iilo+N6Wx9t+VqZOtweYGWdZT5mL+1qgOUt30rc+zpde7rCFjo
 aPs8izIszHm5sYHX59jx1x5+sULZeEOTfADmNuluuyyjso2+Jjj1dHv4d g==;
X-CSE-ConnectionGUID: /3aO7O96RSqTttVx6EibEg==
X-CSE-MsgGUID: YvqRHJwcTQSpTM3JjuRjDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14882474"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14882474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:35 -0700
X-CSE-ConnectionGUID: ICKqd2pnTFujnB7SLGWHQA==
X-CSE-MsgGUID: GwISMFXgRzKLycllg3oatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29042472"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUgerwv8I04l2a04wdznjIT0YhszHxUjYgD2c+4b0D7N+Q12ia26GEz8tX7cMcvfVoDne3GTAGCzX78SVzN86Fylnxp2ocJOh7nv1o6JpD/n2LHW5++PddXN+A1JGd0STopahfoH9dFylwdv9jSHtIje1tpCisNxeFoX3Qk6X5oSRJD4dYJyj32+lV7R4gwvPAS+4CQlTsb/37NhUT6DgdYMWHo9CST2ub5YASU6I4t8ISgEoCo02CYIWjXc3Fd+UzSgUI8sz7vapmtmww4rq/ntwVNWO1H4LxHW9kSxVj793i5WylyWgXVL4ZX7td3sCwRW8YzYkKyCVwI2HpNJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzBPrRFBic7ZSGhAptNUxikzavzqSrSD+9BsVyxBIfQ=;
 b=oGvZRmcZOw30AzQd5/05dG6iDLK6gds2gmQuvjQ+ll4IW4A0sobRBN+hHdBEdaNUoHtcDTFdoCk5tOXp0RHlxFZf6CooMnPfNisHcmZEx39ys3hU+KFaSfTT3JJh0ZRHJzuQ8QupzlnqhxNthmzsW8Fjrva3ZrNAxNzJPVlFEuhwcVLLx+zq96ZcztaDqtPwTYsuSadIMtzFSifx0v7BqN7Frgv7DljFwKexuZkvFZZDwblZff0PzNsooZFf4wm8MqsWYzX/IVKdPd6r/dzCJhAUP1Jy56MvNCpV31Ru+rjGCQCUA9xH+b5gfujrpBz5oAKhJRcYzVhM3RqkgcTDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Wed, 8 May
 2024 20:07:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Francois Dugast" <francois.dugast@intel.com>
Subject: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Date: Wed, 8 May 2024 16:07:04 -0400
Message-ID: <20240508200707.375414-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec999c8-97e5-4b0d-d780-08dc6f9a7832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk5ZVTlYR2xFQTE2RlRvMnVVVERib25MNzJ3WHZmZktxekEwL0JyUU02UzRR?=
 =?utf-8?B?MUc3TWFzSTRKZWNFaWVYeENEanFxaWo1bldoRGw5QUdXT0JJK1l1RkxCdjZz?=
 =?utf-8?B?VnFYdUlEaVNrU3VxOGdNQ1RjckpSZlpmSlBtTnZHS3V4dVJHMVBtUTJzNlVj?=
 =?utf-8?B?aERzaXUvMGpvSERGTzZZb3lpVnJLcXNnY0xSbjQ3c1Z6N2xqNGxBS2xCSlJy?=
 =?utf-8?B?eDg0d0Y2WE5OUG82dWJMWVJ4RCtUU05SbUppZGRtU1IxTTg2ekxSenEyM016?=
 =?utf-8?B?UW0zRXFoMEo1SW9TVnhPb2Y3SWlBTE92Q3dZdFRVZGRoQXJWc21qb2VLYWo5?=
 =?utf-8?B?eEtBUUhjMy9BdkhsQUdxcUlZZUJ0R2lwWHB4L1VEaHplTFRkR0hKR1hpZmJn?=
 =?utf-8?B?aDBENC85UFB6dEhpQU9raDJKamMxVnlJZnFtWHl5N0hjVU00Y2p6cTZRY3Rq?=
 =?utf-8?B?b2RUUzE4eXQ0dmtkalJRcnhjRE83OFNCb1plaEowQXBjQ1BsaDBWQnJvWEh0?=
 =?utf-8?B?K3lHWUhXcGNOYyszZnRzQk0yaEwyRlA5cGl2WWQ3U1pGR3JuVDdnUlp1UHY5?=
 =?utf-8?B?MWVldGZtaHhmZnFXMnRSVVNqbHQwSEJnNk56ZVJvRUU1aWZiNkwwUWZGN0xk?=
 =?utf-8?B?QzRpNHAvK0lreHlWaGo4aW5kbFI5QjJQVWpROFJoWmJlUHJmLzBUTW0wRy9t?=
 =?utf-8?B?STZ0K0g3YTB0Mk55Tlg1SDJuMzdSNW1pVThrSDR6U2kvMXJRNFdNQkhRVGtm?=
 =?utf-8?B?a1EzcWowcDlYeEJ5RjhxaUR6aCtJV3EzZm5pVnlMSHpzdmE4UHVEUzVHZDBp?=
 =?utf-8?B?K21ZdlFjaXp0UU5yT2NhdGQ3bGoxeUIxS0pEZFhFbG94cmdDM0I0MWxXeC9B?=
 =?utf-8?B?RWREUU81cUlnRjl1SERyM2lzUkZuWVlyaEUvZGFFZ29MZjVlRFlTenRDNlEx?=
 =?utf-8?B?enZLTGE4R2pIUmwya1BBcG1BWVJlNkZnanYwbzNiNjZveCtkcjhFS1hvaVJL?=
 =?utf-8?B?L1BpN05qTDRqVkFzWHpraGhKSDFzNDNqRE96cEZmaHJrUmU2Q0ZmRU53Nk1M?=
 =?utf-8?B?dC9oRWQrOFp6ZUJIS3YrbzRHMlR5SEM4TjQ4MS9kWnVLWHVoSlRFV1NnaUt4?=
 =?utf-8?B?NlJ4MHJPSzFpZmZUcFg5RDBOVmp2ZUphWEJ0eHo2amdJaEUxOENPTlNxNHY4?=
 =?utf-8?B?WVh5UVloU2NlMi9SenIyZW85Qm52SmdFRkNUZ21WUFZQSC8zUk9RUkxBaCtx?=
 =?utf-8?B?WjVVcndxQUxjcS9tRW1RK1F1NkNFcXhna3NsYi9Ea0ZMbm1sV043b1pjQ1pG?=
 =?utf-8?B?TUpjclVUZ2owWXIrQWhmWDlCTm9lY3Nnay9oRVpFNGoydEt6MU95ZXNvdWM2?=
 =?utf-8?B?UHE0N0habWNvakM2eE1qTkx2L3B6aVlPQzJMZ2lPQUFkbHRlSzd0S0lHOG8w?=
 =?utf-8?B?RDE2bDBtaUc2WkxhZ3VUQ1JSeTVHVUEzdTRzWkRtTEJncEx3Qll3eHQvdzYr?=
 =?utf-8?B?d2p4clpXVXl0VVQzTHRQVXZRcndkaU14Q05zdVNpeGFwMng0TjREZEh5WFhm?=
 =?utf-8?B?TzMzYVh5eFlHVkI3ajQ2YjMzbVdPWFY2RTRUc2JEaHF1UnpKcmJRRUt1K2Uz?=
 =?utf-8?B?RzhMaFV3TDdnV1EvMUYreDU2bnNndUpyS2hYZVcwMzYvaTVLZWlFWFdBdk9o?=
 =?utf-8?B?ZEhucy9FUWs0N2pzSTZuazJQWkJJRXJUb2k4Rm90djV4azVTL0g1ZGRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akR6QWlQanFWZXdKNVlSOGZuMUJMMkhYcXh4N1pkalR5UDlrTld2eHdqYVRF?=
 =?utf-8?B?eHN0SStySnN1MGpKYThZQ0Uxam9JYVZjNE1PSW9VYXBmb0Y1ZHpKL0RjUi8y?=
 =?utf-8?B?KzFMS2JTK3J4MFFFcXo5cmppdWdSMWs1cHBHZWt5cUFnSVFPb0VkVWtSWE5U?=
 =?utf-8?B?NjJubmJwUXVSZW90TURxSEUxRUVjMHlWRTZIVEhsU3J1ejZqZm85UTFwR3h1?=
 =?utf-8?B?a0k2bTIzRGdyR090eFFSQkU1YjY2VTFncnZNZnk4cDdFZlF1T3JqZHZHYy9R?=
 =?utf-8?B?VEVqd2VMbzRYM3Y0LzNpTUkzaGFIVXhxaDNYbmNhSDhnNDRrL1RUbkp5ZWFp?=
 =?utf-8?B?WGJpS3pPeFp0NTNZN1lBTnN0RHlGNCtwaWh4Q1Vnb01YMDNiSnlGajRPeUJX?=
 =?utf-8?B?aGpFRmw1bHJYbnl5d3BQYjNUQUd3WWVNbnBiNHVjVEcxemxwako0UDcxR0p4?=
 =?utf-8?B?ZE9GV1A0dXV1WDRqWXpPU3AyNExIQXFNUkZsNjdXVzNRckNFMFp4VVJRWVFj?=
 =?utf-8?B?UHBZWFNaSERYTXZOaytRKzNRSjUySGNTSkl1RkF2ZldYalo0VkJiVnBTcFlO?=
 =?utf-8?B?djIySGw0SmZVMDhTZkNWOVNqSzA3K1hGREtaYjc4emt1NXhoWmZRN0w0TDlS?=
 =?utf-8?B?dEM5dk1PWjVmUUVPN0U1SVdoVFJuSUFPdiszVFNkQTM3UHR6U3VWREJIKzMw?=
 =?utf-8?B?MG5TQ21RYjdObElreVFjSVVIakp6WVJGc3d3U1FwNEYrTnpEaGhBNkR5NXRS?=
 =?utf-8?B?eDlSWU5vVlczdmVEY1dCeFVtNE1mb0p0TFYrYWpuVFFkRmxuM2FHcmc0WjdT?=
 =?utf-8?B?L2VuVWVQVzNkRXBxeTNNMUhJU29OUUZrbzMrY2NEc0piaW5LZmkvbktDSHVF?=
 =?utf-8?B?T0x3dWZPbWVGamNDcU96blJZZ1Z1VTdoL2ZPZGlKcEF3bmFvSEtLSjk1WkhE?=
 =?utf-8?B?dnMySGpjSDFTZVZ4YWFqTkszdHBVUkw1NnFGZGxTM3pEbGI4c0xhQXh4N0U4?=
 =?utf-8?B?NjZwUUMwL3hvSVV6STJRUTEyRFZGRUFNZnRXQTcrRXRGMW9xcXBUM3ZFSDgx?=
 =?utf-8?B?d3ZlcmQxSlFHMWJtQ2tzWDRyT3FtOGRNMjE5b2xXYzhnQWk1bGlNdHJsRXBl?=
 =?utf-8?B?ZDZ1MnhxMnRPdkN3OGZtd3lyajRrM1BkQmk3bFV5R3J6QjRDcnVlekxyeE04?=
 =?utf-8?B?TVJtbk1Ybkw4L1plN1hvUXhiODBqRld5UzhzUmZuNmo0eWRsWnRVUkR5algv?=
 =?utf-8?B?RUtlaWJ3OS9yWEQrN3EvYmFHYTIrRUZIWkNWUXJGOHZuU3RGOFpHQTllTHc3?=
 =?utf-8?B?SkVQL0x0Y045enI5YkZhTzkvRjFZNXVrZ2FQdjZROGdhaWdkSEFqRjc2NGg0?=
 =?utf-8?B?bVYxVWNwaWlwUkg1NjRjRk9vM29RM25UZ1RZTEJxZ05nMkx2aGdrOFJreXoy?=
 =?utf-8?B?TmR6NnJTdVpzWjNLSW9CM2hwelUxczQxOXJJdlZwTFd2L0R2dXloSkR4WXZj?=
 =?utf-8?B?VFVWZFkvRW1JOEVKUCtwUW1KcWJDekxQY2o4Sk1raDh3MzBOMU5PeGFvWXVY?=
 =?utf-8?B?eDA5YmpSWjQwNGN5eU9NdkdwcWkyaHpDK2xZRlNSamVWN1pQcEpXZm1RTTNB?=
 =?utf-8?B?Q3hCYXFWcDJkaXRPelczVnN6eS9TMjJlWWpqUUJVZ0pDdkp3YWJ1ekNWYkVV?=
 =?utf-8?B?M1pEMXludkhkRk5mMDdHMGtGWkpGYVdyTW9aQUlyZjFBYVRyeGU0a09kTW5J?=
 =?utf-8?B?MlU4VU9UYWRTMjlwT0k3d1lIdUI1RXJ3Q0EvNTlaMDVqQXo4Y242Ym9aR2xZ?=
 =?utf-8?B?ZXoyUkNvSVA3WWtoYjl3bmZkOU5DL0pUVXdyTHIrTDBoVlhJRzRDUHBDbnFp?=
 =?utf-8?B?M2xhdnFDS0VIRldnSlNNa05Lak9DbG9lRmxIVlowNXBkZFhVZGc5WFVvOTVZ?=
 =?utf-8?B?YnJUWCt6QnNvS0xMZ2lEdnlGOHpObDFNUkNQQndWM2RHMWYvSnNTQkJ6WDBP?=
 =?utf-8?B?WTZxV0d5YSsycUhMamJVKzJmNm81RjdxU1B3R1dGNCtEOWpzclhOaE1vOVZW?=
 =?utf-8?B?U3NBQndSZFZNc3U1b2prbzNxZEg5c1M2NHRCdHNrTGRnN2tEdkZReTF6bWJE?=
 =?utf-8?B?eTlZNmhrTlpMWUpocmJudHpKc3kwWmlBNHdNaHBtRGlkelE2OFN2MERCVWtr?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec999c8-97e5-4b0d-d780-08dc6f9a7832
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:22.0325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgWBmSuh85mHQ/1gh207HxviR9oO8E5ocgb64apB9D5+Bd2dplkud84o1c8bo6zg8xzRPWzbFt/QdO1e2V5xuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

In the regular use case scenario, user space will create a
VM, and keep it alive for the entire duration of its workload.

For the regular desktop cases, it means that the VM
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Limit the VM protection solely for long-running workloads that
are not protected by display cases nor by the scheduler
references. By design, run_job for long-running workloads
returns NULL and the scheduler drops all the references of it,
hence protecting the VM for this case is necessary.

This indeed opens up a risk of use case without display, and
without long-running workload, where memory might be mapped
and accessed with direct read and write operations without
any gpu execution involved. Because of this, extra protection
for the special vm_op access callback.

In the ideal case of the mmapped scenario of vm_ops, we would
also get references in the 'open' and 'mmap' callbacks, and
put it back on the 'close' callback, for a balanced case.
However, this would also block the regular desktop case.

v2: Update commit message to a more imperative language and to
    reflect why the VM protection is really needed.
    Also add a comment in the code to let the reason visbible.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 03f7fe7acf8c..7980efe139ed 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1171,11 +1171,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static int xe_vm_access(struct vm_area_struct *vma, unsigned long addr,
+			void *buf, int len, int write)
+{
+	struct ttm_buffer_object *tbo = vma->vm_private_data;
+	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = xe_vm_access
 };
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d17192c8b7de..f2915741fe16 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	/*
+	 * Long-running workloads are not protected by the scheduler references.
+	 * By design, run_job for long-running workloads returns NULL and the
+	 * scheduler drops all the references of it, hence protecting the VM
+	 * for this case is necessary.
+	 */
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
@@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
@@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	mutex_destroy(&vm->snap_mutex);
 
-	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
-- 
2.44.0

