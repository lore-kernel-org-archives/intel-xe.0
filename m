Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D71C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 08:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DC410E6C9;
	Wed, 21 May 2025 08:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTe5YtEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889F10E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747817456; x=1779353456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ltqj1xGOp4CwzktoPDzt2RMDhO24b7aHoUw6vpsEsI=;
 b=PTe5YtEOqYtiUA9nJzzU8mAXjnBvirg75IHhD9M+qQyqFCE/0861zViT
 Zkg9a1t2EYk7atuaTNmC21EhN0Dqf5WTfP9twa1hsMFiM38/JhJS5jq9e
 of4RVB9VkBJLo5+z0cs654ELBTP9e8IT9EWYPN3/o4rMgN/M/Ri9kBxoa
 iMLo4K/+ZnHI6xqsMhy1BTaL8T5CEWadKDcRuUS1yUwOdAS3RQSj0/9DT
 WBHRUNwuIeYM3LANWQVUMIoTnkSY+RExOrF7z6kGuXx5wbPBSz3yqjvd3
 718TES/6VmtW8JQlSJjjwafzDtRIz5QaZelWNI9yZOuhX7SiSsfOMQ8lk Q==;
X-CSE-ConnectionGUID: 67C6wDCATOi0ZP6HyKREpA==
X-CSE-MsgGUID: YPpAEV/fTDOdrZjazHNiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49844911"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49844911"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:50:55 -0700
X-CSE-ConnectionGUID: Uq95CfJBSj2JtEQPgKWH2g==
X-CSE-MsgGUID: V/+NM9aFQnq1nJQ1M89+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140493358"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:50:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 01:50:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 01:50:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 01:50:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsaUy5ASmHvZy/MKEB1IifxQM+wITxIFVlWJYZ23BFkkrLrzTiNkGRA0czMpXBc9hsDOltXaaAGkIFe8KJhPeybf0t9pfcuLRhttMrGFFTWko0wbXGmI0B020Bj0fILF3j/c/fY5lHIpg1SKT4xLCXnyQ2EpNEDkYES4QZMcyfLI+RKeV+8sgHY6LjtJA8maryTWQnFwdZ7FhDUpD0bUs0uivm4USodgG7VbcJ4hgqhjnFqDiJQsZEu0DWcHsqR8hfmbC6/dsWZZYXWg7oV6MPtYJC0+Na95ZHQOzMZagRCPUtlH8R6fWW7pfws6GjyTuXPYx9g256aTAmJiWzT08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GM7bu9EnhawllejROGp8PLzJISi7PujXXHSmw37VmU=;
 b=iBKzEnwjlwAK7yB1VFGrQEO8aakkS6LBiZNx1LqCnVuTZR8yFsT8qE2M9rs3MKigrvG8I3JynTk2x+xciEf5armGhMTxu6r9oMfySX946I9rGIvJBJ9DCfi5mlFWeX/T2kYW9nWyQy1xjx5rFEz2J201JYN52kVhE2Voj3GFxsBvW8IX76vKzx+dxZOw8gCx/9lNKKxnPeKGjhgxcBLWgJ8BgwPDgO0WlzIuCcmLQsYWw1OANxx2HM0FfI68XhkMNt4fYrSZxx2X4+LMEZ2VMBOk9wpkLPOY1GBSY7mkfZcrgmcxSh2/y5Gz8UVwVAR7ci6Jfc8uhcFXlfuB07cfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 08:50:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 08:50:51 +0000
Message-ID: <96929a4e-8914-4c4b-9d8c-a351008bd947@intel.com>
Date: Wed, 21 May 2025 14:20:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/32] drm/xe/madvise: Update migration policy based on
 preferred location
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-27-himal.prasad.ghimiray@intel.com>
 <aCUTfM2cmQktqMN4@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUTfM2cmQktqMN4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdfbcdc-8dc5-497e-a788-08dd984496e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MURyeFZuUkhWTkNkL0VKWVVFT2J4L2Y0OUZMUVBSNDhsZWYrV2x6M1B5dm1I?=
 =?utf-8?B?cXRPbXp4dnNja284c2NIZkVhVlVMZldBdkpkcEFOUzd6dllxTVk4MDNWOHo4?=
 =?utf-8?B?TmxJRmZQTXllTDUxTWpabkdwRjRHVWtoNS9pYjk0Z0tjNHQ2b21LRGxzWER1?=
 =?utf-8?B?cDZlZWJ5b1dzaDMvR2pSMTlHUlZIWmpWOTdwamNGd0dmdUNmM1pIWmk4eFFD?=
 =?utf-8?B?d3hFSzljQW9hYjJ0UmFkLzBoU2QydnJqNy9qdHpNRnIrK3RGazUyZ1lyVjh1?=
 =?utf-8?B?Z09rUmZwTHdCVk9OM0ErRkN6WE40eWRjQ0M3TmJQaWxSc1hsbEFFODdEYVU5?=
 =?utf-8?B?SkpRb296NDhDU0kwcEQrbkFzd0w4UGlPeXNhY1pBQ0Q2TWtKMWFObzRLNnps?=
 =?utf-8?B?SzNxZzdoZG84RFBYdVQ5d09yaXljb0Y2RnZLaWFXZG5QcVNDOE9ITEo1djJU?=
 =?utf-8?B?eUVZQ3VaT3BwQmt0ci9kTUdMMWNFcDFUaklsdm12Q1RaVWpRbzF6ZUVqUk5O?=
 =?utf-8?B?N3VVMUttUGpHRTRGb1VPZEhBNm1CZVpyZUpKRmZzMEZ5a2FDb3NIVFNMVGxL?=
 =?utf-8?B?Y0piU05lMDUwV0tDZ3JnMmJaMURSTklUaXR5U1NjY1dZNHBxd05rTjMxMmlx?=
 =?utf-8?B?ZjhSSUtuWE1KWFRybHhWMzFoeHArWVUvZVFXWU5GaWRCQkszWko2RjV4RGI3?=
 =?utf-8?B?TDlPcW9RZmFaTGZmWk9aYXJWTjBNOWFRUFo2dXcxSjQ1bmgxRWlQa1lxNW80?=
 =?utf-8?B?OTNpazN0VzBKaW03MzRYem9qTVhDc1ZTWWZVMENoS2E2Tm1CSnozbnhncklP?=
 =?utf-8?B?Z2V1RGJDaG43Q2ZZQkNFd08yUWs5SGE2ZFF4MUNxVzJqd2pZczdhMHBVZm05?=
 =?utf-8?B?M2RhTkdDL1pFM3BDUEFkbWFuR0VvUGlXVllSUVZTUElIcUpKUVJhdkkvQmdx?=
 =?utf-8?B?aFdLY2p1ZEo0NGMyK08vYVN6Q1BqL0x4YXBacGFrMDNUU1lQek5kNmZoY2Q1?=
 =?utf-8?B?ZTdWQW9IVjR2QXZLeEhES2ozMDRqYjJubjB0ZmN4WEQ2SFh2RmhHTWJXeHAy?=
 =?utf-8?B?Z0tOOUsxd1c0eUVOdDZzeVZIQjdvTEpYSVRLemMzSTdWQ212S2FQeE9ISlps?=
 =?utf-8?B?aVRHNzNEb1Y2WTE5bmZEdDJqdjI5RGFkM0dpVXhPUnRIWGFrSmhXdktUK0R6?=
 =?utf-8?B?OVZWVnZnc3F1bTFBK212ZUFPZkdEVUh0K2ozU3NtS0JjbzBXQWlXbTV0UkhH?=
 =?utf-8?B?R2Q1eFZxaHJ1QThrSUkyT1Y1Wnl1OGlHYjFzZ1d6anVxY0QvRFE4czFpaVFL?=
 =?utf-8?B?NGNkWWhyWndNQ1NWVFY0aUxGelJ1ZFBwMlJxQ2RLTkhad1FkSmFOWTNLTm5Y?=
 =?utf-8?B?QThsZjVTOC9ROFN1UFV4QWpDMDVwbWNkZEVwUmI4MGc5aDRSejRSVkZRYS80?=
 =?utf-8?B?Vk96Z2k0cFNzb1JJSXlEZXo2b3hkemFSdkxNY2d3SnhQL2tNM1hCQ1piUzlT?=
 =?utf-8?B?MXNURFNCQWVqOFJNRVRUK2V2N0hhaC9vYm4wMVJybVJHZ2F3VFNHbkVhTTd1?=
 =?utf-8?B?akpGaUttOG9WTVhObHdGNlh0SHBZNVNnRVBGdVNZQW5ZejFUUHhsT2N5dStC?=
 =?utf-8?B?MTdsOGpaOGpmSy95U0x6eXhiNHpHeUZndXF6dG9kaXRLYU04Z0JVZ1dkT2pP?=
 =?utf-8?B?cy8rOFVYVmx2Y3Vsd2JvVWZIejF0ckwvcE10THRSYUtvVmwxUTF0Q0lNaHF2?=
 =?utf-8?B?OVRHZUkzRGc5bGpPaE9DVnFLck1xcHEwM1ZlM0lobTBaZEZBOXNTSlVFY0lt?=
 =?utf-8?B?NmNYUmdENkJ4bVNWa29lcHFobmE1SkFVL0JpQ01YemxWV2Z2LzNrdE5Wbmdi?=
 =?utf-8?B?N3k0RHA4ZWNJakszTm9HZThZaWJSTUxxemtxMnRkVEEwcHh5ZW5uMlVRZnVk?=
 =?utf-8?Q?6UxpMJ8vMXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXgzekNucm1Vckg2SUwzMmJLQWNXdGRiTEJMNTg0Vjh0NUV0U2JTa2lGNm1F?=
 =?utf-8?B?RHJyMjA3Y00wTkQzbUNPalJRZUd0UG1lUUhXTys4cG1nUDZENFR2WjY5TFdQ?=
 =?utf-8?B?VHFHMFNCdmNVd2tLeURoTlUrZ1JoMWo5NUVvSmplUWdSZGlnZmU0d0VWMVAr?=
 =?utf-8?B?NW1kanVGMVBLQTFTVnlLa1NndVE2ZnhxR3lINGx6dnNhcm9NbkFaa3J0NFVC?=
 =?utf-8?B?QWJvTVVWeFVHaDNtWi9qTGRvam9rOHVYRkozS1RSTjVSOFNiaEFoR3JzajNP?=
 =?utf-8?B?OEV1QWtsQWZPK3VhL2ppRWxTV1dwYnJCRmJoOGR3UHViNUQxdExmUXJNTFBF?=
 =?utf-8?B?UG9jRGRFNkhWWHBiYjVFc01FSlBtY1haYnhsdU93dGlIUnQ5MWpFSko1L3l2?=
 =?utf-8?B?bXZZN1dZdjdBRG1QS3QrbjV3L0R5angwbUFEbHJDenJIWXdvSHdXQlpwQVIy?=
 =?utf-8?B?c0F4dkR4K3ZUZmtXWHFsc0xGNlRpRlpGbTdlTGVoSWdZY1FSUVNVSEhHVWpN?=
 =?utf-8?B?MTkwVUZQZWtWckRnQTE5MVJQL01GV1pDNnkrTVRPMERIbHRnZTExRE1BeVdj?=
 =?utf-8?B?Tzd1SGU4MzgxZ3pqMENUdXpFaEhKSVhYa2RvVEtCbjJjV2dRcEtKZzJYRHZM?=
 =?utf-8?B?UlhtT2gyWnZZVGNGOEdhL0h4M1k5SkxoL3ppaTd1Z1F4ay9YYllTM2ZkWUh5?=
 =?utf-8?B?Y3h4VU1sS3AzbVowMUx1akR4NlNBRytscEcxUC9ocnNPd3hWVXNTZHpmMzh1?=
 =?utf-8?B?NVY2ZlFXU3NxS0twYWY3cHRzREdiUnRWZHRVUG9XQSt3TTVKemZVbFN1NEo2?=
 =?utf-8?B?WnFZTWJqMm1ZYnFFTEl0WHRnKzVRc2ZoZXFNWjVybHJqaHFXLzlyeXkySHJh?=
 =?utf-8?B?aFRNVTdVRHFSSElTTVJueTM0THRuSEhsKzlzK3dwazhqb0tHRjZtVkVTb2NM?=
 =?utf-8?B?WVBQTTBYREw4NWFPa21aOGVvOXNGK0x5SVBac3ErZU11bE1WT042ZENwYU40?=
 =?utf-8?B?N3c2dVk1blJNSmZMUVlyNVArTVdGaisyWGxsV1FKV3VUOHRzVFh4endiRjBF?=
 =?utf-8?B?eWNiWFdCWDk0VmNnTDh0TzR6cUJxYXZVSjJjRmFKSm1Sc2kraGYrYy9hWjI5?=
 =?utf-8?B?RVVDK2pPZWh0SXIwVDZkYjZUNTVaLy9aOC9QZEZLcG9mVmlOWGw5MjJRSXQx?=
 =?utf-8?B?V05xQTZyOEN0QmJ4VjJFMUV0NTRtYVV3c3NRb3U2amxFMW1MN2Zhb0FpQ0Jv?=
 =?utf-8?B?MzE4Z3JveHVHL2hKU1RITmFWUDZOTUY3V0pJWUY0NWV1WlgzVHFiUFM5V0ZL?=
 =?utf-8?B?SHVra3EvYlBHcHEvZ2g2NktFM1ZjaW8wUTFzVmRDMS9ONEpnR1hnamRjMlJ4?=
 =?utf-8?B?SEVudXg1bTVBV0tOMnJEYnc0SWpJZnRaa2NPbmUvRXlsb0F0OUVidnlCQStn?=
 =?utf-8?B?RnFpdGU1ZEd5ZWJOcWVZdHUwUXVPdTNDVXhKRmNOODFmTUpvQ3p6NDU0R05S?=
 =?utf-8?B?MGlXOXpkWUlVS0Eya3NaQ0p4eVBmUllOK0RDWTlRN3pCOU5KcGgwS3RKbnp4?=
 =?utf-8?B?UTJ2Wko0elVUSVRaVG9lUjM3YUFhTlc4Lzg1c1d0WXFSY0FaWDdvWm42N251?=
 =?utf-8?B?d2dNdGFpdndyOEc4RFExVGZCSEJOUW1xOFpZTTVzZzdQMkg0d3FBTS84azZ1?=
 =?utf-8?B?dXZPQ1FDR25qcXdCNzJ4SlM3dS9ka2Y3UVVRRkU3djVTVTVRdkJQektCYnZJ?=
 =?utf-8?B?b0hjcVFlTUF3aUxNUWVKQlpZV3ZkQW9XcFZaYUp2aFJXNzVOWU9QYTdEMXNB?=
 =?utf-8?B?MmVtUFJFSVRMTmtwVXBHUWJKbjhOeFUwTmpjeTdGdG1qTFZ2YnI3Rk8vamZs?=
 =?utf-8?B?bmoxdHhFdEU1ZjBPbmJlMGk0SDJoMlNMTjRFSnhvdGNuaVNUVnZ0SjMvenVx?=
 =?utf-8?B?djZEQllwVkh0SjI5R3kxV01Ca3VZZ3RiMEFZcURUS0pLSTA2Y25rVE1qWkMr?=
 =?utf-8?B?WE1jYWl0d0dyUmcrajJnL3lkMVI2STU5ZGJ1Q250K2szV1dKZ0lMeFY2dHJr?=
 =?utf-8?B?RzloWW42NExoVEo3SENwUTRiNk0za0JiekJjbmI2WGNBZHZneXd5eWxQTHFI?=
 =?utf-8?B?enloOG1NaCtTc2diY2VnZ0t3VS8xcXpYcDRCR0ErMDlTVklEbnYxdHkrV2F1?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdfbcdc-8dc5-497e-a788-08dd984496e5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:50:51.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7vFPUIi0EYt0wWhFFsXdei215mNk/weRDsA2dcoOMmiq4AxXXv3CTyXXZWBid/uhrC1Xzo0as13v8+mO6JwvTJ3Zv0NQv7fmz0IK4e2eZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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



On 15-05-2025 03:34, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:13PM +0530, Himal Prasad Ghimiray wrote:
>> When the user sets the valid devmem_fd as a preferred location, GPU fault
>> will trigger migration to tile of device associated with devmem_fd.
>>
>> If the user sets an invalid devmem_fd the preferred location is current
>> placement only.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c        | 15 ++++++++++++++-
>>   drivers/gpu/drm/xe/xe_vm.h         |  3 +++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 20 +++++++++++++++++++-
>>   3 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index d40111e29bfe..60dfb1bf12ca 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -765,6 +765,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>>   	return needs_migrate;
>>   }
>>   
>> +static const u32 region_to_mem_type[] = {
>> +	XE_PL_TT,
>> +	XE_PL_VRAM0,
>> +	XE_PL_VRAM1,
>> +};
>> +
>>   /**
>>    * xe_svm_handle_pagefault() - SVM handle page fault
>>    * @vm: The VM.
>> @@ -796,6 +802,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	int retry_count = 3;
>>   	ktime_t end = 0;
>> +	u32 region;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -820,7 +827,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   	range_debug(range, "PAGE FAULT");
>>   
>> -	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
>> +	region = vma->attr.preferred_loc.devmem_fd;
> 
> Mentioned this earlier in the series - you are assiging a devmem_fd to a
> region which is a bit confusing.

Hmm. Agreed

> 
>> +
>> +	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
>> +		region = region ? region : 1;
> 
> I think the default (region unset) should be the VRAM closest to the GT
> of the fault.

True

> 
>> +		/* Need rework for multigpu */
>> +		tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>> +
>>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>   		if (err) {
>>   			if (retry_count) {
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 4e45230b7205..377f62f859b7 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -220,6 +220,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>>   
>>   int xe_vm_userptr_check_repin(struct xe_vm *vm);
>>   
>> +bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
>> +				  u32 *mem_region, u32 *devmem_fd);
>> +
>>   int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>>   struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>>   				u8 tile_mask);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 7e1a95106cb9..f870e8642190 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -61,7 +61,25 @@ static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>>   				     struct xe_vma **vmas, int num_vmas,
>>   				     struct drm_xe_madvise_ops ops)
>>   {
>> -	/* Implementation pending */
>> +	s32 devmem_fd;
>> +	u32 migration_policy;
>> +	int i;
>> +
>> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
>> +	vm_dbg(&xe->drm, "migration policy = %d, devmem_fd = %d\n",
>> +	       ops.preferred_mem_loc.migration_policy,
>> +	       ops.preferred_mem_loc.devmem_fd);
> 
> As mentioned in patch #27, I'm not sure this debug info is all that
> useful.

Agreed. Planning to drop preferred location in next version and let it 
be brought in along with multi-device support.

> 
>> +
>> +	devmem_fd = (s32)ops.preferred_mem_loc.devmem_fd;
>> +	devmem_fd = (devmem_fd < 0) ? 0 : devmem_fd;
>> +
> 
> Why (devmem_fd < 0) ? 0? I'm not following this.

Incase of any -ve(invalid) fd being passed, wanted to have smem as 
preferred location.


> 
>> +	migration_policy = ops.preferred_mem_loc.migration_policy;
>> +
> 
> Mentioned earlier in the series, I'm confused by migration_policy and it
> also looks to be unused unless I'm missing something?

This was supposed to be used with multi-device support. >
> Matt
> 
>> +	for (i = 0; i < num_vmas; i++) {
>> +		vmas[i]->attr.preferred_loc.devmem_fd = devmem_fd;
>> +		vmas[i]->attr.preferred_loc.migration_policy = migration_policy;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

