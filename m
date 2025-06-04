Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC28AC5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0010E094;
	Wed,  4 Jun 2025 23:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+zElFt9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD510E094
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 23:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749080542; x=1780616542;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NgarLSxwj+OHlkdpAAfmDxaa2wAC9K9qbQc/33+7yso=;
 b=N+zElFt9AYd/jkE/b6iw6pJnyVpNAFW4knYwhWlYBGS/kS/0P26p+OEr
 iy17Xp6bQM4ujYn9NUwy7Tu0SLuSeS9ugciQhM4s5iKlzUhqq6tihJCS9
 BMm2bnn4F2UBPSiEAiUuryfUbE2JqA0Q85UMYX0uy07kpHy/K4J0MpC1h
 r3mlUyU/JwH8uhOssh86pOBMb+7R4Lnw77Ygjy/GhDBB6jM9Tv5C43Ejn
 WaAitJ0r8KinNg1PuyK5Or+wLNIg5vmJToVUMkKf5EvpoMQpfPIMPAV4G
 01gwLqrRLmRrmsex7GahhtggXAdRlrmf3+r5g6BEGqfExusC7hZ8384gN Q==;
X-CSE-ConnectionGUID: UX+GRts5TSCYzyRHKBDN+Q==
X-CSE-MsgGUID: olzmo1lhTqah8Ry2fCo0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="53814283"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="53814283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:42:21 -0700
X-CSE-ConnectionGUID: +eIB1/uFSYymHwAdeRESbg==
X-CSE-MsgGUID: 5huYV8hPRw+En9KBQRukWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145672620"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:42:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:42:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 16:42:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzdyiGw+Ba2dChwDWTqI8JGnlgKcwsZWIjV5LVy7tc468gzp4Zai4ip5sOjILhEpSvAkQ65FjZmPOVIE49YENwfnjwkH7UtpWXRJShrR2Lze91SEdleSzNWNi/ipSyU1WYqqCzc/Vak37sIshXcphT7iYPcCwrCMa+HkY8FynsoLerGETMPxtMmoaLcFBDADS01auB3MX1XNQk9XvUDxd99FdFVVzMT+LdjHN7CL6cqBYHcS12RFDB4nzEmoJWS7DTlB2pMm9/bfUvMLCybQ5FpwJo+27DZ5l9uV+0+MaJLFImcPaj6DsDra8p1OAfUmt52oEk40jGkTlHNwmfJwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eAzBUi1sOGWcqbnij3+PaL+YRcvrQTmBU/+zH8Opu4=;
 b=G+JcQOi1AyuD0gHhv1tt90CXyErkfnNywsD8n+1XEuTd9icZZr9papwlrpDNiSm68alAjtlJAU4QAB5sLCmxvdu0fQ5l9T9BrE5AxBDOLQ9nlXr1EDXV3OqrF7Cqe9Q8qbM6fS078tj996fOXNTjshG8nmvRBgOAsOnf3vNlfBl+Cbj1LDVP/adMRHgM8O+BazTKp8NS/Yy+1RO2HdHSoT6lBKZGZMsrpKymZ65M48DNPwUN/ecVv2/Dan8glTEp+J4vfqAtb1khSyueqDu36DJIHKg0/LDygX2+eEnIOAIJQK4Ug90LXIycqx73+/BTomD0+vhdohjEqc8Xtu7KoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 23:42:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Wed, 4 Jun 2025
 23:42:14 +0000
Date: Wed, 4 Jun 2025 16:42:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/oa/uapi: Expose media OA units
Message-ID: <aEDZzLVdL92GpeB3@unerlige-desk.amr.corp.intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
 <20250603202133.2713863-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250603202133.2713863-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA3PR11MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d74e26-5ad9-4f8e-f6aa-08dda3c16ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhDVVFnREk0VTlxTWhYNnVxWGxsOU9COWV6WXFHbUdsZnJ3Tkg4RmdZbDNs?=
 =?utf-8?B?N1V4U2p6YTBBS2VYOGtERTBQVldiOVd1YkJydHcxUks0Ynh1UDYyNytRNEM3?=
 =?utf-8?B?bjBDckxNUEs2RFdwU1BJWnllMHAwZ3BwM2NoeXVnVUJoRWJqUWZ6T1NlRHB1?=
 =?utf-8?B?RjU0eGU4VVlzZFRyWW5NelE4Z3d6MDUwdm85eDJMTmdqb2s5ZkJ2SEgzeTNv?=
 =?utf-8?B?ZThhZ0Jsd1E2SXQ1K3NpRUlMOXZCbFV6TERRc0lxdTBGK3dXL3UxYmJWbTJX?=
 =?utf-8?B?blFWOS93cmkwSW4yRWpxSG1DcENZOFhsNlJUY3QvQmlCUzBwd1FCSnB4cWlM?=
 =?utf-8?B?cVFRbEM1ZncwR0VuS0EzWEJGVkwyVktBUXRaY0JMR0tEdzJQdldIamgwQUpn?=
 =?utf-8?B?dEQ5Zk9QTjhmWmdCRnVRbDk3Nm9GNllRUVFPMW94QnoxcFBKMVduUUw4STZs?=
 =?utf-8?B?V2NMSi9raXhCaHpyVzZPa0hIYmY5RFlVQmRRMmNkeklyTExtdDhxemlwVnZ2?=
 =?utf-8?B?NnZMM3hXeXZsTjI5c292OVowdjhVSDdqKzE2WXZyQnQ2YmMrTzBpdGcvdUM0?=
 =?utf-8?B?aHVodkp5c094RmRYc3hMTVlKZG4vM214ZXc4cWJSMlFMR3VJTk0zcGdLTk4y?=
 =?utf-8?B?UTNEY2hTUTRDL3p2b2E0ZmxqYVZRdllXQStUT0NjWEU0UG44cFBqV0V4Rk5h?=
 =?utf-8?B?K1c4NXRZSHJoVm9IWUV1cFpsWXFPRnRzaG0rM2pHQ0xqMmRQWEEyKzUwOXB5?=
 =?utf-8?B?WjhyZlBQU3QvM2VHUHZlM1l2YlczekgvNUFWOGFMb3A0WVYxQ1RSS1k2ZUx4?=
 =?utf-8?B?bDRsOXdpTGRUbkZBczQweHZGR1BoVVV0VUZJdDhOM0YxWU92TXVROGpPR3FG?=
 =?utf-8?B?UWZRQ2dtUmhCVkpiV1Uya1VITmhObHNnSjF3THVid0xLTkJEUWc3SmtNWjJV?=
 =?utf-8?B?L0pVN3hxbDBQZGZJVXlybFJMWjFQQit0RFNCeW82UnJ1YWs4eFRjSCt3UzVi?=
 =?utf-8?B?cGx0WngyRWtEbHpEdFJ6L01xUVgzWkNGV2wvRGlQY0pJcnQreExIZGpsR2VX?=
 =?utf-8?B?eXppbUprNndUcHdwT2FaVGxFUFVWZnZBKzlkMnJtR3dpS3JNaDk4TFVUcHps?=
 =?utf-8?B?S1A5aUNEMWl5RDlacThyM0J6S3FEN0tvZ25ralMxd05qOHQxcTZXNC9Xc1ph?=
 =?utf-8?B?RFpKWmZxaloyOGJKSFU4a3Rnb1ExdGl3WmNqTmlwMmxESy8yY2tEdEJYbGN4?=
 =?utf-8?B?RkdUd01hMlFyZlNNM3FndVJ5OUtubEdaTmw0YnI2bFUyeG9LbXQ3QVVhNHYv?=
 =?utf-8?B?eXYzbXpBMFRpVm84cDlRcjY4eGJubjNvOWJKWkhZT1pUYmkzWEUrWC9GVUxo?=
 =?utf-8?B?aFJEUWJ0d0xKYVg3bWxvTW9qcDc4YjZGbHJ1MXBMK3orT0lOdmVaK2VHY1Fz?=
 =?utf-8?B?aDZ6cG11bkZJeUpQYkkrbExmbGxMVVYxSUhqeEszWU5peEdJcFhYRzNQWldE?=
 =?utf-8?B?L1lVN0pLbmhiWjdYcVFxQTlBZ1lLRE1saGlpSmpxYUZ3dCtDOHBQL3JHT0hH?=
 =?utf-8?B?ODA5aDZKUEs0dmFmcm9EdXJCbGUvRXpsZXpPMUdScWFIYjFwMFl4R1FBNDl1?=
 =?utf-8?B?MnFEOXpIMXlPZlh6Qi9hVTJoNkpObVVBdGVFMEgxUGVaMlBDOEFOU0VKVnMx?=
 =?utf-8?B?bStXSFBiRFpVZ25OeEtxcENwZ3k0anhZWVhCYjdUaDhJK2pmcDF1dXRlUFdt?=
 =?utf-8?B?bExlUmMwUmRXNHNxYzFFLzc2QXNLeUxrT2tQSWhiL01JL2VkL3hPTGVQMHFC?=
 =?utf-8?B?MnczdWMwM3Fnd1FJblRFMzY2ZjUvQjRCekdER3NNQVpFOTZQN29XMFJiMTBh?=
 =?utf-8?B?UHdMUVhVUit0VG1oRUJjT0RrUy92K1B6Snl1WmZqM01uc09ReXVBMi84K0k0?=
 =?utf-8?Q?/IgAsOal+V0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRPSy83Z0ZtSGJnM3U0YytmWElEVnk0MG1lVi8zKzAxVlVwVzdESy9VM1Zw?=
 =?utf-8?B?cG8vcmh4OWt0ejZHM3U5Zi9GV3UveFdVUy9kQ0ZrcDlsTXMyMENtYmZoWFky?=
 =?utf-8?B?ckF3WFQ4UFRoemRKTFlHbXRyN2h1UjlCNm13T0kwaDZyRjVKUEVvZWZiQWsw?=
 =?utf-8?B?cjVUNjZhQlBvK3F6OVVvN0pNeUkyMWNORU9Zbk5EbEl3ajBaNmNSY1BsVUdH?=
 =?utf-8?B?QjZFNFV2SmNDcEZ4Rkd6ZUV1YlFhdXVHMUF2NWtCQ3hNRkJ2NkQvbmNhcUNL?=
 =?utf-8?B?Y3dBOUFDcDhrY2U3aWZsOWcvY0hXbHViN3hsdVpVMlhTcmVWclNJMXc3dWFz?=
 =?utf-8?B?cUtxQkQraVl4VXlVd0w4RStGS2dBZkZMSmI5WUpNSURQY3Q1Y3Z2ZzRmK1dV?=
 =?utf-8?B?Q2ZRSmRxOXEzSVZnTDBRVWRxT3VIVnp0cGJCd0RWdkp5OXpTQ2lOcUVHZHgx?=
 =?utf-8?B?WSt4VVdDVVdpQ0R0ZHlUby96dktjTnBRZkRUZy9DckNVYWdXa3ZiNlJyQWFP?=
 =?utf-8?B?eitwMlB3Unk3QzZKaDNVRzYvMENIWDNHaHFBejU0a1JnUDhBTlJPYnRVMlQz?=
 =?utf-8?B?ek5UY3JidjhIekdkNGJTbitKR003K3hwd3c5REJNeWk1WEtSd2F2clFjVFAx?=
 =?utf-8?B?Tk5sMGVSdlRzQU1WYTcrZzJkdFhxSGIzSitqMDk0VFVOamhUeFdISnlOVE9E?=
 =?utf-8?B?NitnZm9lT2x2ek5hRi9yWktvMnFiMHlsRWVCdDJPODNxMENuWDdwcHYxSG1K?=
 =?utf-8?B?SWJ4cjZvRVlVc1JxMjFrUGFudjlWVVhWQ05rZWlwck1GNkRwaXY3QWZQK1JJ?=
 =?utf-8?B?VmtuTUNGMUtOSmZwV2JOVzl2VWY1bTd2VXpFcW5uWjVGR1ZjVU1TZkR4eHBZ?=
 =?utf-8?B?cmpGSGZYNG1wV3VPZUlaUktGS3d4MmQ1b3Y5RlJpdlZHTWZuSTI1WHhKcnRJ?=
 =?utf-8?B?ZndxNjZuK3ZETFVmVTJWNjJxd1VhN20xb2ozRzRiYTFTNmV5UmZQeGg3Z3dJ?=
 =?utf-8?B?N1VlbW5aTk5leGR2aGljc2Q3RUpaU1ZKeWQ0alFCUjUxSitvWHJSTmxvN2o1?=
 =?utf-8?B?RTU3bzRGZTZUT3JQVG1uMVQxUFVPaVI0Q0NXZ0tYNExoeGlVVXoxUzlKYlIw?=
 =?utf-8?B?eEhSMzZnbFl2REllWlBQODNwdVRneURueGVRdnhqR3Btck9Xc2VCY24rUFNK?=
 =?utf-8?B?bXhmWk9PWXA4d1VBd0tZd0xobDdmbjg0Y0FmeWZIOWlyWFpiWVZFQzV2YnNi?=
 =?utf-8?B?K1Q3UzdrOTVVMXA1NWlwT3FwTE4rK25IZVYzbW4wVmF2VE1ockhRdUF2MUxj?=
 =?utf-8?B?Y3NZcG1MUk95R1YwVzQrQmVaR29XZm1PbEJOL1NWODMwUWlOandDM0xyenNV?=
 =?utf-8?B?c2RwWG9td0wxNUNEa0tNV3JnZUZocFJDbFJYa0JDZnJUZXRuRTN5NTgxSlVq?=
 =?utf-8?B?dDE1N1o3TzVjSnRGTXprZCtuVGRTOWY2eXl3V2svSTc2dDBLWWEwQ05iR0l6?=
 =?utf-8?B?am8xNTQ5V08vdFZ4dnorYUZwQjAyVCsxTVhINUZQMDZsU1lidmo4RFlHMXoz?=
 =?utf-8?B?bm9ILzEwUEZ2d3ZDQnZiWGo2aDVoT3NneHZ0R2xVTmY2cHB0VnJveWpwU3ZG?=
 =?utf-8?B?UTRESkdTQUc3RDVkRHhxdm9idk0veGxOK3ZEeWZ3VG5KZlc5OFQ1MEVpMWZr?=
 =?utf-8?B?ZDhReHl2VXBOekJEbTdVa1VSR013WWROUFZWSDA2ejd1aEd6UzByZy9MTnNi?=
 =?utf-8?B?dE14b0hVN2N2Tit4dWRpWXlqa0NoS2lWQllFT2RDa3dkU3RReTNZTDE1dWZC?=
 =?utf-8?B?R2YxaG9xZytpc3c0SVViS0lzYy80RkszdjNHdnpldEtEQ0lXMkc0ZDU2QzNz?=
 =?utf-8?B?SWtraVozYlJUSmlTUmV3YjNzNm9MYUI1L3dtdStXQ1ZCR3Q5cGEzajFMd083?=
 =?utf-8?B?aXNYdGlUdUV1bjA4Z3lJSnNPYzVLVGNKMzlhbi9seGhQcS9ieEdyN01paVZD?=
 =?utf-8?B?bmtaTmZwSFg3S055bUp4cDM4VGFsZG1pUGdOcU9HYkxrMld1YXNJMjFlYUUw?=
 =?utf-8?B?Vkl6NVV6bldaZk50NGJZdVFDWVpGSHFhWEEvL3phU2NUNkFnSjFKdHRHRkhR?=
 =?utf-8?B?amtndHczRWh5blZ1NWR2d0ExK2R3dGNvUXNUQlVXTU1DM2dCSXhpQnpISVIr?=
 =?utf-8?Q?OhuK6dfwjtReaLzSq2kKib4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d74e26-5ad9-4f8e-f6aa-08dda3c16ed9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:42:14.1744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ID2h8Ste7Z3Oh0vRAugRunKUHsDZitdp3IC93pr1ka5iddqC4teVl3K/HrbmORcuCHgwWFEnAaO4SiuiJncTtLWiZM54r7j5x5mmjfZv53c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9205
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

On Tue, Jun 03, 2025 at 01:21:29PM -0700, Ashutosh Dixit wrote:
>On Xe2+ platforms, media engines are attached to "SCMI" OA media (OAM)
>units. One or more SCMI OAM units might be present on a platform. In
>addition there is another OAM unit for global events, called
>OAM-SAG. Performance metrics for media workloads can be obtained from these
>OAM units, similar to OAG.
>
>Expose these OAM units for userspace to use. OAM-SAG is exposed as an OA
>unit without any attached engines.
>
>Bspec: 70819, 67103, 63844, 72572, 74476, 61284
>
>v2: Fix xe_gt_WARN_ON in __hwe_oam_unit for < 12.7 platforms
>v3: Return XE_OA_UNIT_INVALID for < 12.7 to indicate no OAM units
>v4: Move xe_oa_print_oa_units() to separate patch
>v5: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 68 ++++++++++++++++++++++++++++----------
> include/uapi/drm/xe_drm.h  |  3 ++
> 2 files changed, 54 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fb842fa0552e5..0de0d5a18df74 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -43,6 +43,12 @@
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> #define XE_OA_UNIT_INVALID U32_MAX
>
>+enum xe_oam_unit_type {
>+	XE_OAM_UNIT_SAG,
>+	XE_OAM_UNIT_SCMI_0,
>+	XE_OAM_UNIT_SCMI_1,
>+};
>+
> enum xe_oa_submit_deps {
> 	XE_OA_SUBMIT_NO_DEPS,
> 	XE_OA_SUBMIT_ADD_DEPS,
>@@ -1881,6 +1887,7 @@ static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
> 		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
> 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
> 	case DRM_XE_OA_UNIT_TYPE_OAM:
>+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
> 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
> 	default:
> 		return false;
>@@ -2448,20 +2455,38 @@ int xe_oa_register(struct xe_device *xe)
>
> static u32 num_oa_units_per_gt(struct xe_gt *gt)
> {
>-	return 1;
>+	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
>+		return 1;
>+	else if (!IS_DGFX(gt_to_xe(gt)))
>+		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
>+	else
>+		return XE_OAM_UNIT_SCMI_1 + 1; /* SAG + SCMI_0 + SCMI_1 */
> }
>
> static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
> {
>-	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>-		/*
>-		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>-		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
>-		 */
>-		xe_gt_WARN_ON(hwe->gt, hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) < 1270)
>+		return XE_OA_UNIT_INVALID;
>
>+	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
>+
>+	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
> 		return 0;
>-	}
>+	/*
>+	 * XE_OAM_UNIT_SAG has only GSCCS attached to it, but only on some platforms. Also
>+	 * GSCCS cannot be used to submit batches to program the OAM unit. Therefore we don't
>+	 * assign an OA unit to GSCCS. This means that XE_OAM_UNIT_SAG is exposed as an OA
>+	 * unit without attached engines. Fused off engines can also result in oa_unit's with
>+	 * num_engines == 0. OA streams can be opened on all OA units.
>+	 */
>+	else if (hwe->engine_id == XE_HW_ENGINE_GSCCS0)

You could just drop the case XE_ENGINE_CLASS_OTHER in caller 
(__hwe_oa_unit()) and then you dont need the XE_HW_ENGINE_GSCCS0 check 
here.

>+		return XE_OA_UNIT_INVALID;
>+	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
>+		return XE_OAM_UNIT_SCMI_0;
>+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
>+		return (hwe->instance / 2 & 0x1) + 1;

should be same as (hwe->instance / 2) + 1;

>+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+		return (hwe->instance & 0x1) + 1;

same here, should be same as (hwe->instance + 1)

Thanks,
Umesh
