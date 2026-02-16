Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35730E81A3C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F0C10E031;
	Mon, 16 Feb 2026 16:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XL7hlPz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A1F10E031
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771259240; x=1802795240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=85yXFyKALVL/nSLpnGxaEqxzy72nD5z9xXdnihCzCpg=;
 b=XL7hlPz1MuexfXvT7bUD3mz3DLM5NKU9ybjAwpEGyPTuEIDadNxNYrrn
 NFTKFMPBxzfuOxjzwZr34pes7z1hVxIUJOAfAaUPtIqwikB+WiW3l/Eyp
 TQQ91TmWhUh4hLcwv2QR9+JQ2X7UwwYMZ7y45s2s9ilt9Ksj/U4Lg5sP6
 AzIOVDjzw+XCdb0lF8x2snDABPsFjOsNq4kwMalVgAD1XvsVuBIDOZomh
 igxf6aOk2DScXWKEIVA0NBmlWSunxn0MPHDos2i0UwBB5ATts6CZVwLO5
 db1CMequ90BRZkMKVmCOTR0CKjo0RnbZ4DFUESF8p9iL7d8d289C8wlPF w==;
X-CSE-ConnectionGUID: 5vatKTLXTT+IGNLonfzckg==
X-CSE-MsgGUID: Hou4BzH/TZmd8wLxrUhbSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89753242"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="89753242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:27:20 -0800
X-CSE-ConnectionGUID: gzOt6gNfSX6u5bdYN/r1Kg==
X-CSE-MsgGUID: 8ljWk9aHR/qgjRZvhY9EdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212616969"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:27:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:27:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 08:27:18 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:27:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we3FlOxXnkIG40mmVvW4Cd6bse5fA+/2+oAv4uP9mNwR4mtp3P8HemNHENHcip6oz2N+/vB58CTg31fzEC4lB/WH+c86L96kPBXOxW0K2vYPdyUT7fsH1ByH/V69Zg+mrndZxIeavpz8rAe/E5GPS4cAwqISjmAMbuHkPBvpv3pw/R/GghiSGhu3BDaqpt2s6ELyY8xPGnWM3lssJanNHZ8HMDeqCqvjf1Qbadd2EvlJH9gDLrkKnCah7DmiQCd2POVJf57NytXdaNxLffPaY6W9uWkdKWTt95vP5P5JY0Tcz2+KeBs96HZv+536auoJlmwV4suxlW5gVAxhZOJ3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWs/g6pLrAOrkfSDz0T2GH7nWSSjMwhJdRnpA6YTGFk=;
 b=UUMKWBlT2rzzmRFxGpcmppq4n892U7DUCvrQ71LuqqAkmdYCVkTESjSRN1V2WKW4i18vyR3uKfhXCG5AgKp10Tx3MgvvlEl3QFc9cx87lNf4xVJor3PFVhhYHcF1zBTeZYxSF1CxmC1uWB1UOCwI4x5wIzDGQ2+kvayDbU3+9B7sjOrXUo7s7h0afZX8GT4T7GkXLm0OaFJ+BIMRVA/reAzPLNUTY0tHlz14LlbrC0JmLJWxJe300m2qIDzIV8iiKCQ4mbC0Ult9cTrnxY8r1XpZaq7jQ82TqCcEgQWL++Ro9FGu8vLO57VcSfu1FINYSvSdKGPsTa3ZJRANt9DFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS4PPF267298081.namprd11.prod.outlook.com (2603:10b6:f:fc02::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 16:27:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:27:16 +0000
Date: Mon, 16 Feb 2026 17:27:13 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/xe/pf: Don't check for empty config
Message-ID: <20260216162713.y54edzwhqcw2jpci@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5201af-236c-4180-d7fd-08de6d783fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFRCcFZoVkovUzR4NTNpR1hyczA3RDlaSVV2TWptUDhrVm9sRUhUc1FwNUQw?=
 =?utf-8?B?WllsOXNqMmFxeVlrTW56VW9DY01zU1J2Ny9MVFVaMVVRb2h1dUlXaTZHNDRz?=
 =?utf-8?B?TjFRdWJvOTBYQU5ZdmNOdmF5U1JENmNwUGV2eGlPenB6Tmo3T01qZFdoS0wr?=
 =?utf-8?B?R2ViS3F3aG5HSjlISUpMc0lGRjNTc0FMeFIrdVcvZUU5ZGNua1JrQkxnVnMx?=
 =?utf-8?B?K3JFYVU0aGtZUjdIQWpqMUVxYW5xUW9COHVWL043bzNtMkxXK0wwTVlIVUkv?=
 =?utf-8?B?aTZJUTZhSVkzc2FuYlZkMytaMWVXRUw1S29QaE9UYTZLVUpNMWV0ZkYzaVFJ?=
 =?utf-8?B?WVRIWHVGUEVGVnEzMFBVb1NTdCthVXd0NDhYUXFBZ3dTUkRDWnZFTWdrT3Ar?=
 =?utf-8?B?YXp3WmxHdWJackFvUHN5RU1lamhydkxoQ3VCODJ4OHk0OVJNTHJiNzEyN0FJ?=
 =?utf-8?B?RlhjdzVyeFZ5bVk0OUxER0pjeGxqQkFxRCt1MXdvZUdyLzRqWVFnQmgxVzhm?=
 =?utf-8?B?Z0txbm9qTU9iNUtJU1o3MDdIK2wvQmJRTnI1R3pwQzZHUDR3VUFaOUJVWm9T?=
 =?utf-8?B?NjRidlVraEloRmRiMUtOOVhXZGNkV1QzcHpIa1owamtnMFhMSmZmYVBlZi8r?=
 =?utf-8?B?QWFTc3ZSVDBzRU5mQTRhZ2hrNHlNYW9MNUxFYTBIbUVETzg2V1d1aFNhY3Fo?=
 =?utf-8?B?SWIrOU12TGd1Ylo4ZlhIeURxUXEwWmJ5ZUZFY0ZTcFJLNzNoMDFyNXlnU0Ra?=
 =?utf-8?B?bHJCbmN4UW5oNjFvZisrRkNLTUl1QTNOa3B2a1V3T2dxWmIvUnRoNlBkanRO?=
 =?utf-8?B?QkFRdjViaUU1MzIrQnZjaEhYVG9OQXBCMjhkb01WM0RVVXVOTisybkVXWExh?=
 =?utf-8?B?aEtZZ1VFbFdKWGtvZStkVzl4bzdhdkppc0lLVW04bk1jdGoyNHhvUG1WUVFu?=
 =?utf-8?B?SFkzbEg3NlYxOENoY1FmdndRclhJbjdZS2tlbXFSck1IUjFkT3d5V2t2Y0V6?=
 =?utf-8?B?c0JaQVJ5TUgvbllGdEc2dmFNYklCdlpQdWFlZFEyNXk3YkswUXVjcnR3eDYx?=
 =?utf-8?B?ZlQyRGZwVERlMkRxZWVsMTlXejZBcjhJYWtuWjdmTkk2bklxU1ZKRzRZdGVQ?=
 =?utf-8?B?VEVhd2x1Y2k3ejNsVTRlUDYwMnNNeWdVSlZjNUxFa3FhUXVhbjlpbEhvc2da?=
 =?utf-8?B?amphL0xpK0VROXZqSE9oSXJQVnRyRExWN2YyQUJ4SVRpMjRNSXYxL3dKNEty?=
 =?utf-8?B?bVlIZG9yd3FSeDNFNm9oQXVqdTBaL3VaZCtzdUxnV0NqcVBscjZuUkZPbSt5?=
 =?utf-8?B?cUNVbXg5a1FQVG00SmliMzdIOVhNdy8xbU5PNWlsTFN5K3Q4M2QzU2xWdWVV?=
 =?utf-8?B?U1RMQW9nL3RRbzBsdGhFYnhSQTVwdlZPV05IT05GSlZkY0JTMUJOK0JnRmgy?=
 =?utf-8?B?VWhDOFRhQlFFZXM3dGlGb3hBaUNmVlFUOUNTNVhZT2Q4cTJubW9QcDRYek9X?=
 =?utf-8?B?bk8xNDY5c2xIT2lpbno5NnBVOFRRODRWRlZJdnV4K09ML0RucEkyQXg2T3ZN?=
 =?utf-8?B?Yit2ajc1NVl5c25qN2NvK3dRckVDZkhldVJrTHJmUHNMTnc0WkZSaU1yR2M3?=
 =?utf-8?B?dHg1aSt6ejBHcnB1by8xR0haVjNQeFhUNk9EeXJvTVN6R1RxRWhINGYrQ3R4?=
 =?utf-8?B?cCtkTFB4SUl5U2FaQWYwRnc5UUUwTVZiWi9rS1BMZG8vNm1rWVU5WkxoVklz?=
 =?utf-8?B?YTN3bTh4bWgwWTNYSEtuNnI4OHV5bGFCdm5EdGV0M0thTWZ4OWxEcnd1MTJn?=
 =?utf-8?B?dGw5Y3c2bVRobU9NN3FpR3dIUExhYTI1angyM2pEMGZ5YzRBTmlGWUU3ZExa?=
 =?utf-8?B?Y091dlRWRDhVaTQxQVFrQmVrUzdQZUhDSUJxcU5yZmdnZVoybzFjSXl3L0Iw?=
 =?utf-8?B?MUpVZ1Z0bndiTnpYNFc2anliNzlOUzlrRW91blNKQ0psUmFaZFlIZ3JOcUNN?=
 =?utf-8?B?Vi9lU0lCQTBla2FlY0p0ckVINVN1UGZyRkoxcmExTis2Qy9zWVlMWGpTemhZ?=
 =?utf-8?B?akR6QTZLUXpRRFFKYWVud05jQ1hMUTA5UVkxQXBpUGtQeVlPTnRDcE91OGFT?=
 =?utf-8?Q?cIhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdUK05zeE5RM0grUU1nTEpOeEVOUi9GdFkxNnMrVllIY0w5N1hFN3ZyTUF2?=
 =?utf-8?B?WmlDR0JrcGpOVy8yL3VJc1lpVDhhdzFtQjBocm0vZCtKdFlsNDZnNjdORkxx?=
 =?utf-8?B?TUFmVzJTTnFROG5XTm1la1pGS05qZS9rYXNIV2Fld3NEQXBEQklFQXFuZVdj?=
 =?utf-8?B?amFQQjVrWVZDWnhtMFZlTUg2N3diSkM2enNVYTErekE5Vk01N1VESk1SRzlL?=
 =?utf-8?B?Q2NFUWtJTTB4QXJ0NlphaEd6SHEzQUg3cDFyUlVJZXUzSU5lRTZ1YkpHdEIw?=
 =?utf-8?B?WTFZenZ0dkd4RXI5czF0TFNxVHJlRnByRlN3SitXREVhQVROZlRGbngzRnBW?=
 =?utf-8?B?TGM4Z1FzdCtoVW1FRENsNk9pWjJyV1hMQjJHMFRIbXFLR2VFQW5jMnBaZzcz?=
 =?utf-8?B?QUxLQzduTDJMaWZodytQNlkzSTVsaVhKcUdKdGQ3Y1F1ZG12bnYzYkF2czNk?=
 =?utf-8?B?cXB4WU96b2xnV0U2aDMzR3cvUHh1Z0R2ZlVMMERoOE80WHpjQU5oU1Jibm1w?=
 =?utf-8?B?QlRYeDhzWlRwVlR3QlpVQTcxcWQ1RzNPS1hLc1RvcnZkS2ZPUVVhUm95Q3h3?=
 =?utf-8?B?dmZwUFRyMGtsdE93YTUxN0d3SkhMR3lHakNvMXZzZkMrUzlKdXlxaGx3Qkpk?=
 =?utf-8?B?NlVmL3E3QUZBR0pHVC9nV0NudnBkZFlTczVvTWhDWjBZWkpIOE1qOWlRUnZq?=
 =?utf-8?B?UTc3UzlWZk82OVphVWwvZmFHYW96NGJOeFJ2UDFPZHFZak5yaXlUVEkrTllj?=
 =?utf-8?B?MHlNYXJaWnlFNnJ3ekZ2R1FnZ2hRTGN1aUxmT3lBMlVKTnVlbC9wR1RMU25W?=
 =?utf-8?B?M1Q1Smd5RHpFUzRlb3g2WXNqMGRrZURpazZrVGhOR2Mzc1BoWlJqdThWSXRL?=
 =?utf-8?B?VWlXeE10Zk9sRXM4ZGR5OFdqbVEzQnQwcnh4Z01YQVBBSXZLSjhvWXJtTDhF?=
 =?utf-8?B?akcxd1lzTFJINVEwS3U3ZTJ3aXlVdGtIbkdHaWhFdksvaGZnSUNCMnkxczlx?=
 =?utf-8?B?N0JlY1lwUHA1QXErSDNYc1M0c3Z6ZHZCZ28zV25pQXNwcSsxK3VPVW1saXVo?=
 =?utf-8?B?QitKeFJZWS95UzFXZkpCOXBNenR6eENHaFBoazkwejM2bFBzdXdrZFBjNy9R?=
 =?utf-8?B?M2N1NTcrODY4Z2kxRHQvZVhDZjRRVlM4TEdDUEVVTnZCUHFJLytZZkNONmg4?=
 =?utf-8?B?TFhlS1lUNml4THp2QzVicVM2SldHM2dhV0FEWURNbUNTMk8rLzJEQVFkL0N5?=
 =?utf-8?B?aEhaYm82WjN5N0loaCs3V0kvSWkvNTBub2ZsVEhSU0RlS3hXMDNsTC80SnpW?=
 =?utf-8?B?UXlGRjlSVU5GbCtkV3JxcW01SjZZb3Urd2VZMUFsVHJsQTYrM01zUWNBWVRv?=
 =?utf-8?B?eXV2RCtQZkdzWXQvVWZPOTJrMzNCTkhjN3M5M2RUazJ3QU1Zc29jbm03MnZS?=
 =?utf-8?B?OGpNNzJ0OFd5UmVPL0p3UTA1ZEtYalNWYW1FMUl2czNRSDdDUmxhSVFSU0VD?=
 =?utf-8?B?ZjdadWhYM0tpSnhvK1ZOOEdVUGRRTzRpdXhNaUhQMS80azZQRVpFTTJpaTNp?=
 =?utf-8?B?QVpFakhFL0pJOTAwQmhmOXl5Q1MrV2wzVzdpdEdscnZLbjN3SEJQK3AxaE5C?=
 =?utf-8?B?M21jNm9EVDZua3hkZWFGMGtDRTM0WlhJVVc0QzhuNmg1QjI0UENsNmZtRE9p?=
 =?utf-8?B?YXQyTVJEaWM0L0VnSGNLeW9MZ0M4Tjh5Qk54bHFpNUJQY2JnVFdrVCtpVU9j?=
 =?utf-8?B?ZjhEeFljZzhEMW9OTWN5Vnlla2x0OStJNm1IQnRmdjdJR0QvUGJRY1VZY3Jp?=
 =?utf-8?B?b2xoN3NscEpQWTNFeHhJZEo0VzNaZ3VYWVlWeHhXaDF1MkdnaFlYWHR6L1Zx?=
 =?utf-8?B?Rnl2NkNIT2FGbmNYdzA5Tmlzak9MZlRGbGpoREh6V2paVUdwekN2VEkrTUdD?=
 =?utf-8?B?cGxqenFic2lydzJvQXlXcUhRRmRvZkxBbGl4TEIwb2srM29HMHFwTC9WZ0o5?=
 =?utf-8?B?SnVlbzV0RWs0TzRCNk5RbkpyaFRzalBwUG5VRHdJVEQwYkNLazRSckJpdWZP?=
 =?utf-8?B?c1ZJalNYcjk5UzBMYVBBeWpwYnY4M1B4by9wb1RlL3BGT2VBdUFjdGJES3h5?=
 =?utf-8?B?b2ZzNGhWRnlKOC85SzFHejdwejhEVXg5N1h0emV3S1hjYytXUWlxY2hNRllX?=
 =?utf-8?B?MVl3eFFVcmR1OXJXMjJkVkdaT3pTOE83M3Ztayt2OENoa3lJcFM2Z042TkhX?=
 =?utf-8?B?Rk9vNXIwWVkxdkdFU2pXd0w2RGh1eVphSmxTQXE2TWdVRm1IWGVMSjZNRFo0?=
 =?utf-8?B?SVQzYXFvdmdWSUVEejN3VlY1dVhIbUZtT3l5VVJkOU9nd293T0JVVW13NFh2?=
 =?utf-8?Q?M64Me+CYdJ3cA4e8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5201af-236c-4180-d7fd-08de6d783fae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:27:16.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQx/9IezOZT/kIctfoyYJpit34Pjb38gCdGEQaTkw2E5b5ZDoHENt20gShJKpcfNsIeoma26LU1WonqfbRUWxoKPB4F+vVS2tlxRzBAcNf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:20 +0100]:
> We already turn off VFs auto-provisioning once we detect manual VFs
> provisioning over the debugfs, so we can skip additional check for
> all VFs configs being still empty.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index e7187d03fe1b..95c8f01e0264 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -32,17 +32,6 @@ static bool pf_auto_provisioning_mode(struct xe_device *xe)
>  	return xe->sriov.pf.provision.mode == XE_SRIOV_PROVISIONING_MODE_AUTO;
>  }
>  
> -static bool pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
> -{
> -	unsigned int n;
> -
> -	for (n = 1; n <= num_vfs; n++)
> -		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
> -			return false;
> -
> -	return true;
> -}
> -
>  static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
>  	struct xe_gt *gt;
> @@ -51,8 +40,6 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	int err;
>  
>  	for_each_gt(gt, xe, id) {
> -		if (!pf_needs_provisioning(gt, num_vfs))
> -			return -EUCLEAN;
>  		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>  		result = result ?: err;
>  	}

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.47.1
> 

-- 
