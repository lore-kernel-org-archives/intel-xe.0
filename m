Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86693C3ABC5
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 23:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4419310E222;
	Thu,  8 May 2025 23:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9L/Ukac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA51B10E222
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 23:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746745496; x=1778281496;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p6QdSu8Vl7rUbzTxVyoijiigcygr8S0xYeABcXmvl14=;
 b=Q9L/Ukac3Pht+D3mZYSEMuJuQfVW1sgUK5sY4pU96Z7UInt9THQy+9uz
 DHOErXv0YO76N4xLCOrmA9CDAm5O5EbXGrd8ig65Q5JqDcfXCNfp+Vdmm
 j+3QXIyYauiafiPr3WL9Fm+CKlAojtN9C06M0UEKixmUlQCBqAsHGcNcQ
 E7zeJzeE+8+SsApCZpR3VnJBUniYIM2V0A4Y3Cl+rLbQ2LjCciEEaQ1Bf
 dK/ZPZWCN9nr9mpwSoMaCRDPuPm7Ji073oeFIB/M65uzSzDPvTrh74NEh
 Z0xzbcEZAeY0P2wDPwQFebXkKjdA83T6vNFEbL79tgMeCzWFS3rNaO/8D g==;
X-CSE-ConnectionGUID: 5fDJvUDCQgWmbUddwcWeig==
X-CSE-MsgGUID: nXvF39a9TZ+lLJO2nJSa+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36183098"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="36183098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:04:53 -0700
X-CSE-ConnectionGUID: d6WzQ+ZyScm6Ya+EqY7BJw==
X-CSE-MsgGUID: iv3SPED7RTqiKIzDjsLnfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136373411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:04:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 16:04:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 16:04:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 16:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8lGu7AJY4RuwbhpS1g+d+YUR3VMDxXpToCyuomuYi+0W3djOw+MW9rFIe5A81krlzgrnrpXedOA0vQZ1LMIXLXD6gThfW1nQrCnzim/uH93PGr6XGX8FCOzC6TxJPj1dOcp5A5+vMA1AYrh3otDxE1eLNPJzDuvcYwrhNF8k7qaVrCidgh2sO3AWYlFAtZsTRQHMW5HfvrFq9DIztsqWxijF9EEQz/gmV1uO+rDE6A/yNIkbj9DlYU7BS/j+b7jN9BW+1PFbOiN+PaoohOElVnvno1mgmKJwU2QzUHEThlFO+6FcPlaROnd6WEXvF6fqqmZvUImM8/hCZZpjlKLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezjXZbEgDItJJzI7a7sJmFxYZfhFRzytJyDdj+BNIFM=;
 b=r6EtYX/ycUTjSIts7TSAs155WdAleBJl8P6z79nN1HJ8IqONu9jg0JjRy19hX7WD1htZPiUnnNdhCY8crLY7H0AmqROnMzY2TdYf+3ewGZap5SlVNCls9AQXLG6UvzSsWFMj4nn9f+iojosY2sTxQ7R/Zm76PQRpXUzFERuAUB2MnLLSM9EHCrLTTew52S6x/xkP+FReHGGKWNZ24ugNVe5R50NuhAvpqxYNZdUs/xr2Zc39YtsdwNVdtgQYpULYDQtp3v0yqajWMaCf0XipuvDtjv2YM1ekgrwb9t8Bln7VroXBZvwow1pImo9itnqyMw5BlpTpGaBoftKviECayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 23:03:59 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 23:03:59 +0000
Message-ID: <96b700c1-4980-4876-9ea3-62e753f0436a@intel.com>
Date: Thu, 8 May 2025 16:03:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250508190920.1343610-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca73b22-edcb-4acc-5378-08dd8e849da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWgycjMzWTYyUWY4ZDR1SVlNMjRtUkhQUjJXT2gwZjRGZHViVEUyd2JVTVNa?=
 =?utf-8?B?TW1zNDEyUnZuempaY3d0TXhydXA5eHg1cHVaM2ltT3owYWNEb0Y5SStGcDhm?=
 =?utf-8?B?Q01vM0tEcFB6R2loNlFxL0l4bno4VTkxRUt0S0JiRjRyK2hpa0liZmpEQkZt?=
 =?utf-8?B?WGIxQVpoMG1mTlR6SUttYlZ6MnprZm1xUUt5c0FEZHdpL1NHQ2VaQnYxVi85?=
 =?utf-8?B?MDErTjJPblA0Uk40cVdINVpGREgwc081MTZvdG0yY3JxUUVQdlJieEtwbzJH?=
 =?utf-8?B?Yk4xNHFiYStCQ2NYemFIQXRHK0FmZmZJQnkxdGxCdVhyN0dCV1BMakJrZVBL?=
 =?utf-8?B?bnRMVGlPQUxub2pBR1l3MmlBNWFGTi9weTh1b3ozR1ZGSlpRdG10b2ZQZHVr?=
 =?utf-8?B?YUZqK3c4NjFvdWtxWEszK2QxakRGRG1xNldONzM3ZW0rK1RWbHdvblA3elRp?=
 =?utf-8?B?a3hxRlk4T0x6NEpGUElUSVZjL08zNGhjQVN5YXFXSjhZNHpGcTh1aDU3dVpP?=
 =?utf-8?B?dHNQYTJDUGY2RndzditjNzBSZFBrUjZSL0tEZm5TZVplTE4xeTFlTitLQU9q?=
 =?utf-8?B?Z1pseUN1ZnkvWHBsNGZEQTlmTHNCR3ZyR0FRZjNRYkZyVmxGZkVNYjBLNkkx?=
 =?utf-8?B?Q1pPWkRwakx5TXF4TnR3QzVad25Ld3lzTnp5U2lmQTFQejR0UnpxTlVQbXR3?=
 =?utf-8?B?bndSYi9yMmF3VlA5TnJ0ZFF3blJINHcwUmQ1N1VBZXlXZHJzZDF6Umk3ODkx?=
 =?utf-8?B?VU11Wk5tMVNodSszV0FsT2gyMVNuT3NnNE1ESHFSeTBiYTl5eVBYclBkRmhq?=
 =?utf-8?B?ZTYvU3k1VmZJRk5XSVJoSCtwZ1lmV0xHQlNlY2c1VXNqREdPc0JvQ1E1c2Vv?=
 =?utf-8?B?c0cycjdQM0FRTXRTMENnQjZuNXptWWw0ai9MYmdHY3pmWFJJK0dCL1FHb0xI?=
 =?utf-8?B?MUhYQVEyNG8rWGNadmpoRWpsSmYxNW1JQ0RYOEh0Y3NudXJmRGo1NEZ3bmFq?=
 =?utf-8?B?N01YdXdaTDBBb1ZKNzNOVlFjLzFpRXFabTJHdGZPTkVWS0h2dHgxOFRRaWxi?=
 =?utf-8?B?bEVFa1BjV1NGNElBNjBiR2cyS2Y5KzZ0dC9ma1pJL1paNFRRVUR0LzlYQm5j?=
 =?utf-8?B?enNMTVlibFJCTitBNUdhZW1YZ3d6RmlJKytEYmtrVHdTbVNjRGJwQW5jVGNL?=
 =?utf-8?B?UDJFb0VTcXl6ZWxNTHlRZVFxWlpSR0dYR1NWVEFkdjVVVTVTODVMR0hTVTN2?=
 =?utf-8?B?T1lndHJUSVE5dFA2NFMyN09IZUtsMWdENy9FUFk0cTBaTFNDZjlwYm0wWGJn?=
 =?utf-8?B?NXRCT3pkemxCdlNiWG9GTHRYaEVleVA0UEc0ZUhybGhQU01WM0hCTWdtL2Qy?=
 =?utf-8?B?SnVyY2drbnFSNmxwdS94WTVLOFV3bUd2TGJpRzhaVWtIWXdXVFkvdVFOeFI5?=
 =?utf-8?B?MFlxNU1Ic2J1Wk9MT1dvRDI1ckFVb25kYzhIZ09mNFRqQ24wZkVYSVllZVhY?=
 =?utf-8?B?aERSVy93YnhVTXdwaWxVb3JDR1M3YStmb1VDSXZJWHFiWXBTOEUxNFJZQXFC?=
 =?utf-8?B?ZVkzK2RHVTFkbFkrM05rdVZDR0pFbVRkWm5nUVFHd0R6TkdFRXNlZ1Fwanh1?=
 =?utf-8?B?RkVvZFVEUHo1OFMwcVhzanFhNDJZTFk3eUp0akVqZUNtKzdlMk5qNEYvTEFD?=
 =?utf-8?B?L3hvb0F5M05ld1BETTNRd3FpREhWSVZaemJvZkxTY1hERFZDK29JbnhUM1kz?=
 =?utf-8?B?WEw4VTk1b29CU2FZdHFlVTZ6S3NjQTIyNGRKbmtBZS9nSUxmZkhLM2ZSOXBW?=
 =?utf-8?Q?XfqwTidxGIxmlns5//A41Z0EtjtlU4IL0hdP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmlCcXgxNmJVVHlXL3pLSnpoYWJyeWlMWDJqQVMrZi91SkVoRjc4RGp4cHFU?=
 =?utf-8?B?MWM1bzJKaE9ackRhU3Zpb2RIUGlKTkFPVlpiZWVVVFJCSkZ4YlE3WndoSkR0?=
 =?utf-8?B?RTNLNTJwNjNxSSsxbnJSRzJnRUZzVUpKNUUrczFUeU1rQkFGSThjZ1BZMXNU?=
 =?utf-8?B?RUpXandnb3Q4YzhaRk4vYStpcmtObXBGeXM5MlhWOExBeE5jR2krbS8wZnlS?=
 =?utf-8?B?UEVkWHpjS2NUNVF3cFU5TVp0dG1sQ2VObXdpVFoxNUJxVENVaExxYTMzN0NZ?=
 =?utf-8?B?c1BQd01aTU1MTG1FQTVqUDdqYWJXWk5FZnlraHFnWUIzMGhiZ0puRlNCa2V5?=
 =?utf-8?B?NGVGL3hzSFRFWWpCMHRDT21laUcvL3lsQVB4aitTV2NEcTVzQk8yNjBBbGZh?=
 =?utf-8?B?cEF5ZXZjQ2NjcERqanZYRmtIZG1rUkdhZlJrd1dFamVSUVVQL0VtbUZ0Uk5J?=
 =?utf-8?B?N3NPYzNtVitPbWhTU1RUOXlzNjFkNDIxdENwdUNHQWN6eGhNSHpqOVI1MWZI?=
 =?utf-8?B?MDdaNjBkcjZ2b3V1cWl2c2pacnpOYVJFK1g3TmV1Y1Ewb3JCNjZqQXpoRU9I?=
 =?utf-8?B?U2c2VDlZOUg1Z1VOMzR2ZEtGWDVpMGUzWE5CUHFKcEVhRThqOGhDeDB1UEtE?=
 =?utf-8?B?bGlGYTNjR3V5bnMyaTB0VE9Tdi9ESXp1WFVxc2Z4c1VJMWlDZkZmaXFhUy9Q?=
 =?utf-8?B?NVZIcTMzcTRmMXdQTng2MUFxWFVCcUVOMUVqTlBYMnZYSm9wM052OVFqbUFh?=
 =?utf-8?B?dEdwMEdyY1NRd3gvRlBoZXBLamlseExNTE1rcVZjSXVoTk1ZYWs4cGpJYytX?=
 =?utf-8?B?Qy9zYVdKZy8rRGZZOVplTHlKYmVlZ0ZJREZwWXRoclE2T0ttZEJCVVg5VHpk?=
 =?utf-8?B?dm9HeHJpbUhzR0FtcXc1OWZPL043dFhsVXBnK3lGK0pHQlBQUWVNMTVtejAx?=
 =?utf-8?B?UDRGL01FYjlpYXd3MjJqc3VmcUpCTy93c09Jb0RuS0NvdDRxeEx3Vk9IU0ZR?=
 =?utf-8?B?anlOYmpHVkoyZnBkQlphdkgwOHZsMWFQNHl4ZHRjMTFzNTlDMGVJc01SSlpo?=
 =?utf-8?B?NW50MnYwa2JTV0NYUHN2QUJYY3NGU1hUSGhPVlo5UFNsY3JOc1RaNitzdkQz?=
 =?utf-8?B?QVM0V0pmMVMrV1JySHdiV21yN0dyOGRySm9GbWpBeEhpWDdtNnRnSlFCNzBV?=
 =?utf-8?B?NTBDS25oRUlDWjRyU3d4VUszaFB0WVZSNjFJbm1zQ3dDeTFzNWtScldHejcw?=
 =?utf-8?B?VUFDMlZsMGRwakdTa3pVenlnalk0b2Z0eSt6WkhQOGk2SElYUlpYdzBwdlFR?=
 =?utf-8?B?bCtCQTJmQzhZRnN3dzRlLy9jRVNBSjBsSGVzdFhGVlBVTUxhSEhlY2ZTWWtB?=
 =?utf-8?B?WWtGcE5RaDhRRUQvTXpaMHpiZytFeW9NRlBTZGgzZkEvai9mdjhONUVWemFB?=
 =?utf-8?B?UkxuQ2RnUHlhOTdDRkpvWlFYOFlrSm1NL2VhMis3T0dma0QwNFh6MmdpTzhn?=
 =?utf-8?B?UEpkN3Z3MzVxWG9pTXR0TTBJMGZpdThzekwvMkxSNG9LRm9aU3NrSEhRWGJq?=
 =?utf-8?B?MFlORFpjZVkvNnUxa3ZraHVYUkNpTDlpVlg3SlVyeGhiaHpBWUZ1V1VLcmdR?=
 =?utf-8?B?c2ZER0c4R0l4V2RhT294RGNpWFNzTUlKSm1Tc09VUmhoWkIwM3Y0Wi9LRjA1?=
 =?utf-8?B?Y3ZCM2NHMUY2a0c4WndaTU9VOTBOMURtSnA3NzZJaXBnZC9yMVpoZTFrbUNn?=
 =?utf-8?B?cmREUm4ybjF6bjZHZWtPQ3VzcHJBVGFIbnY4VkVGOG9EUHplRC9QdjRSbk9l?=
 =?utf-8?B?dEsvMHUyM05PVmQvUkRiNmY1SHpoNmZkTVFSVnBqWWJmOE9tSkJFUTNQcnZu?=
 =?utf-8?B?VUF5YlhjUEVvdng1MUNVWndTdE4yeW9ueW1OU21zM3ZrRHJ0MlVySzlXb3Zh?=
 =?utf-8?B?cjVJTW5aLzJ1ellQZEdWMmNuTmF3SERXNmJhOHlKMGFtd01JWXNYdG9ST0Nv?=
 =?utf-8?B?YklJTGpFN0grRWNXM0dsWHJOeU9mVDU3SDNkNFV4SHo2RlpPdUFVZlJlREJC?=
 =?utf-8?B?cFB6NkdqZDV5b0JqeXRSVVRKa1pXcmcwR3ZvKzQ3b1k5MWl3T0ZlSzhMeEVs?=
 =?utf-8?B?Tkt4VGRvV0Z5eEtCVnBYNHBKMExVWVR4VXZEd3N3a3hLZXlKVVVzOFN5RnFi?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca73b22-edcb-4acc-5378-08dd8e849da4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:03:58.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNwhnDrC7qcgZnzFC9r9vXhIohNrtN65GtpD18JmwqlnZW27CpBZYiLpq1RhvSS2k/a78+E2fDEDATA1Z3CnecaROCh65eIqo/j7Z6oqNJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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



On 5/8/2025 12:09 PM, Matthew Brost wrote:
> When an app is ctrl-c (killed) any queues running on the GPU have their
> preemption timeout set to the minimum value and scheduling is disabled.
> If the queue has something active on the GPU it is very likely for the
> GuC will trigger an engine reset resulting in the engine reset message
> being printed when this is fully expected. Do not print the engine reset
> message on queues which have been killed.
>
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 369be36f7dc5..efff462ddd75 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	if (!exec_queue_killed(q))
> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
Maybe make it an xe_gt_dbg in the case of a killed queue? It is still 
useful to see such messages when triaging CI failures to get an idea of 
what is going on behind the scenes.

John.

>   
>   	trace_xe_exec_queue_reset(q);
>   

