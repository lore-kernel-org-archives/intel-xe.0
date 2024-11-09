Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6992D64076
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 00:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBDB10E2A8;
	Sat,  9 Nov 2024 00:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfxfsXy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DE10E2A8
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 00:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731112800; x=1762648800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GlmfGUKqqBUAmCgJNFdCNfPIN56Elzwf+SMxN/Iwflo=;
 b=JfxfsXy8X1zsGU9rUsonK2wa71NJHCYp7AM8E6H7XirUX96GotzCq7eZ
 4zHflabUeV2qDP6+zU7DIacrjBhFm3ClaBMYSRe1fwUbUZXW5Dx+LmGGK
 QbqUbGanCKJOj2IgdCPtm491N30lAM4EboTssUAbo7TBWSWrFv/PvDjGn
 1cteFxTfeugKr4odxaBkO1QcjLO2UYibS5iE8vPXJqXxp6DCzaXojL3Cn
 +LkrvmFb5Z7nKStlaDDwem/mY/kqp9DTTNF8ogRyUMKy50adM/wHd/QJQ
 btQwEBY2vSuNaRc6ErtBxFAHLHk8SgatQfX9x6coGsHi7CV9I54Ybn/iK Q==;
X-CSE-ConnectionGUID: DT4QeyuWTIajxMpJAaF10Q==
X-CSE-MsgGUID: Aq+UeGQBQWKL1r5PK49Dtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41573991"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41573991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 16:40:00 -0800
X-CSE-ConnectionGUID: HyaqXhmuQmu0nRYtg4uY4A==
X-CSE-MsgGUID: 5DASujyPRMmRR4tJNW3k+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85805137"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 16:40:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 16:39:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 16:39:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 16:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxoEFKRcvfpeKQolLTrstDsdBEb++u/mVKD5oof//Gs/a8y3y1FjAB9SQADVZuaHo0liupejgqlj9f5YndjP0wGe+D8RjtD5m6hR5GnM4C8G0xMu4Xs1z8IfSnb76jIScT76b/zQXrvu+MuPxJOUIBpL4eyUAD9DjgjeEVGdpVNEt8DojtTRdPzyfce3Q5Z/fWKc7lVHPvDB86soo+xOq3HiWzs1Y/bEjb3gSgDEjLFBVic4GxonFNFkbLSHqurvCXs1d9DTaUQ4xr8gcZ672rJF/x9Ynk3IzqBLrSxCwkJch9c2CqMrhI/keaBQmBa4mUrEFAWJoRWigD5/eYnKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmFbn14twTxxFFR4o28/WXrM18fOm0Nl9LlV08JtzRk=;
 b=AICzeAcbUyBwf3uc4DfMz7HBL/Li8zy6HvQBCz2ZxX1Cta3JuOJXOvYR/2B+wnz3075Q0zt8WXkbM5+4YiCHfSntDFp1upCKES3r7mtvjCjPGGhFWvE6uq1jjtBXLkv5AiUhsWbV271Ubp+xU2BG2IHLK42IqjBl8vhxISQZCD87KPgnY+nTDxbwu6yZo/VmlLDm0WvurYaxvb99fSujquoZRn/eP+OPaSR512fUy9T9TnmZQWahwYPFSTIQNtzzGQldDAh0Ai/hHye9mfZysbqeSebmI3Cl0OiI1k9oGN1TFtua5ihZXnLnU9qOT2F+2Y3ZXs2CsCy3AGW9sM9rGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Sat, 9 Nov
 2024 00:39:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8137.019; Sat, 9 Nov 2024
 00:39:51 +0000
Message-ID: <90f215aa-5d52-46d0-9f85-0cefc580c707@intel.com>
Date: Fri, 8 Nov 2024 16:39:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-3-John.C.Harrison@Intel.com>
 <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
 <22a9423e-53b0-4541-91eb-f743f0cd3de1@intel.com>
 <Zy6lKMVs/G0ZRbBK@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zy6lKMVs/G0ZRbBK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:303:8e::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 0886a401-966c-4d01-f4c5-08dd0057058d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejZrTktoWFlOOHV4cThlYmRhVG04Z2RWV2NsemxEWlNUcXVYOENtSDJaNTlo?=
 =?utf-8?B?bE9PR1F2MVdsaEdxQmRBYWVrUXpYc3Z5VGx0TFJ6NzlXa3VCVHk3cEltYjZI?=
 =?utf-8?B?bkYvai9Sb1gvSHp0K3VaY3FWTVZQZDJ1MVBZYnBmRGZEaTJKL3VWbHlRN0xk?=
 =?utf-8?B?MVJwRXFOVzJ1R0NadzhQMUZUNE1aTlA1MWpuUDZ6SWxkaGpkSTVtZlZBNnJO?=
 =?utf-8?B?N1ZmaVBIc3JPbENjSVNPWXh4LzdtVlhlNllvaExDOHkyRExkTDhHbEhGQUIz?=
 =?utf-8?B?dlg2K3B0cnJpekVhdVhQMU9vbE5mc3VoV1gvTXJPdFd5MUVWVkVRZ090V1hh?=
 =?utf-8?B?VXMzdVR3ZWZWSFpEaHY1cm1HVGVRNjNueExoYk1Ld0xHNHZjcmp6bVdKSi9l?=
 =?utf-8?B?UzJFc21hd3NtZUc0V1UzQWpDL2lQRE4zVWFoNXlBNGVLZnE4N1FuVzViTG9q?=
 =?utf-8?B?Y2RkZko4MnJKNFhXQ0tFS0FLalZGV2JWL1JyOXlyd2JUR2JUVFQ5WjBrRkxB?=
 =?utf-8?B?NkhBbWZkbkQ2Y0M1dk83Y09wZEJwUnRwdzJpbDVWWWllYlA5NlVKTFI3TkNz?=
 =?utf-8?B?WDliSHliVjBJVy8vK3Irc012LzhNY05IdnJNcVNQQU1tcGFaNXZ0K2hYSGxz?=
 =?utf-8?B?bk1Cdm5mV3hpZHkrRGpoSVovRkNHazgzaDJ3eSt3MnBPL3E1QjgvL2Z6MmFF?=
 =?utf-8?B?d3JtcDU5VVMvMlJYMjA2NWl4V3JHK0RPelRpRTUvc1F1SXRSc2ZJWXhDNjdT?=
 =?utf-8?B?VndaRjhUaGtHVmhSaVkvQk1hRlJpWkRmKzM1bWVTdEZvSHlJbVNXS0xBQ204?=
 =?utf-8?B?SS9CWGFsZ3N0bS9FU3J3K29GMW05TmF2Ym1hS0JnaHBZYm9HZitXeVZ1eHlp?=
 =?utf-8?B?MXVLV0RzM2hZMGJsZXp5YlJDYkU0cWFTek5GZng0TGVxdmROaFZpc3A4NzN5?=
 =?utf-8?B?QUczalU2ZTdiQVhzbjF4Tm5jQ0dqTnlDSXhFeDNEa1FncWRCb1dNVmVtbkxh?=
 =?utf-8?B?REdqWllORTJhaEgzQXFEdTYxcStrSWFWUGJtb1BvOS9lTGxPdDM3Y29rY0tD?=
 =?utf-8?B?OExRNlhpbittT3hJOVRGR2xSU1FvYTFmVmZMdGJkQkRrTUxja1AvSnVRek1L?=
 =?utf-8?B?T25MZ1E3b1N0dHpvd2owbGFxdFNrVklRa1pJMm0wWmFMR1I1VGFSY0JPeWt0?=
 =?utf-8?B?aDlqT0trWHkxWjJHZlQrbi91WG1kbllWaGFPSENoS0J5UGd5OWJKYTl0ZXpG?=
 =?utf-8?B?bWdhbjNKczRzalAyQmdxVkw4ME5vZE9uZERXM0haTXB3ZWt1N0puQXlJRjZY?=
 =?utf-8?B?V0lTSEVCKy9VcXZFUWt4YzN2cWNCOHdPMG9KSUE5dkNmNENGRmd2c3lKTXFD?=
 =?utf-8?B?L1R5TWJoMzB3NnRLaWVHTUFJVEVndGVXSVRabzNYVkxiLzA0VXkxNnk4cnpL?=
 =?utf-8?B?aUdycHpwU1BWbDdpQURpMGNiV2MyWE9KbGNpTVNId2hZWW82NnowTGlzWE9s?=
 =?utf-8?B?RTVnamRNaHBkQXl3Y3V0NmMxdmxML0tWUm1VTzVVQmZ5OHZtY1d0dGJjb2xJ?=
 =?utf-8?B?Sk9vdFlCZVhkKzlHcnR0YlFSU2FSQ2xiUjFiYlJhY0o1cThVd0dBQlp3Qy9V?=
 =?utf-8?B?MHFxRk9LNmtNeG9wcld4K3lpY0ZoTXJ2ZEJpRmRLdnhFeDlhc1FnZE1wWjVT?=
 =?utf-8?Q?bY0VicefwCPEo/LNXx7b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1REWEgrb3VYeEF0SmVoZVhJNG10VWtWWjlrUnNkemluN3plNnZzSjNrZWlo?=
 =?utf-8?B?N1lmb04yS1hjWHp3cHZtSm55OTFUbDk2dWZqUmVMenE0N3JvMU8rdGlKb0Fx?=
 =?utf-8?B?SG1uUFQwTjB0b2h6ak05dk55TWFxY3FZbzRhdGdvWkkvS0J1bUZXajMrRTZO?=
 =?utf-8?B?SEQreXFjblN6NHJwRE0zSVhnb3FCc0JKcThYYW0yTjVXbnJnY0FqdzRvZFAz?=
 =?utf-8?B?Y0xRY2NIU21tbm1pcjM1OXNYalVXUUJ5RmhCcVluQlVpcTBSMEFYUEh3bUNm?=
 =?utf-8?B?N3IyaUFpdFduNjVJamNTeVdRMTg0ME9HaDFyUkRwbHh0b1pZSVhWaFVqcmt3?=
 =?utf-8?B?cC9qdHlEU0VZMjhZU2djQ2k5QzNmRjQ4eitYd2o5WFhJRjIzM0dESGVYMnRT?=
 =?utf-8?B?NmpJL3I4eU1nNWtqQjlpZDFXeDJtVHkvMFdCaTdJWmpzRXdpdHdZOFRqRGdY?=
 =?utf-8?B?elgzV283L0oyRmxjcUY2Y1pKOTdEZ204NERJTlN6dHYySk1zM1BETGhuajd3?=
 =?utf-8?B?dFVKT3lDTTEwYi9vdWMzRWFaSEFrWjhwNkp1eGVkMkpPdjd2RkdXbnNaODdG?=
 =?utf-8?B?NW9BbVJhSDhVeFZzNXUvdTBNUnJoMGFKcnlaVWlJS3J3SnRNZks1ZlhDNDZn?=
 =?utf-8?B?SVFaWjJpWHh1NUE4Ulg5Y25ZQkZOMmhIODU2aExzNThLbXE0dTFYc3VjTHU4?=
 =?utf-8?B?ZDZKeDRkc3hpWm1takw0N1ZaTU9SVW55MEpESTM3MVpsQUhxV3ExcUZHTEJE?=
 =?utf-8?B?MXBVeFhRUGRiRzZxM0dPMVFqVnVtb3MvdXJKUDVGcTJCanRvblQvS3VlRmRG?=
 =?utf-8?B?ODRFaVM5YzRaNWt3SWp6YXlNOElGYnBWTEJiZ1JlQzhPdTVYVTNRK2FVRVZq?=
 =?utf-8?B?V1M0QlVyQnNqd0ozZGpSVzBrUStrRWVJRW42QWRObFlZM2pVRk5waHdmQXNl?=
 =?utf-8?B?RGI1b1pqVGlsNS9sZWQ1Vno0OHk4cXA0dmpneFRjYVByQmoyTXZhMU9iZENE?=
 =?utf-8?B?RjlZSnJNOWFZRnA3K3MyeVdGcnI5bmNsSlRWYzRmVFJQMVFjSmovZkNxSEVK?=
 =?utf-8?B?azMySFdFbUt6aCt2Tm1ycWw4WnR5c1M5RDJpWmkxTDRhZytkMit0RjZ3TGVX?=
 =?utf-8?B?R3NCTFBhYXdkektTTHlQY09ab2lpSGxmTlArazhoYkhDT0NmT3pQaG81TGJ2?=
 =?utf-8?B?TWRiSXdPamtvdnRkcVdJNVo1bEZtN1IyS0lib0YxT0RnLzB6eEZVb3FzTVlK?=
 =?utf-8?B?d01tUlNjb3BLdDJxS3Ztc3gwT0NrOXp1TzcvYzNXd1FZd1dKTkh6SHI0RVg1?=
 =?utf-8?B?NlJ3VGZLaXNHbnV1NGQxZWdJVGtpOHlyQ1VzLzc4MFlhaVpQb3RlR0N5Wkhn?=
 =?utf-8?B?WCswQ3pOaVlOdDd5d2JZalJvK0hxQ2dtYmF4VTMrUXRTM3RpeFU3WmVkQUJw?=
 =?utf-8?B?V0tMb0xLclZMbTRlT1g3eFdCaUdjeDJYOTdDazRESkZKazNTUGJuYUZJUVJi?=
 =?utf-8?B?ZmpJWkQydEtFbUJGdWFGTDArT0pMUExOTHpSSTYwNGNLVm9oSXNscENpQ3dm?=
 =?utf-8?B?Kyt4RGlsNE1Oek9yeGx4ZkJrOE9UWW9NVkRFWjRLZkxFZnJLOTNwekZleFQ0?=
 =?utf-8?B?QmMxWDJac0ZGZVJ3cWlaQ0xEMWJhWEFmZ3Q1SThHblg1S2d4VklYVk5CazlY?=
 =?utf-8?B?eTU0T1FZVHQ1UzRncXl5WjJocWJqVHZVRllucS92OXlLWHd0L1ZNblpqSFhK?=
 =?utf-8?B?UjFsdHQyRnhKbzVaZCtaR2NTRU5ycjh5emR6LzdhTzRRang3V1ZhaFN1M09H?=
 =?utf-8?B?QlFXOTZpZlh2YjFtMFc4c2s0azlGQndTanNhK2pBS3haWW9IZzFwZHhiQ2xD?=
 =?utf-8?B?Y3YwL2ZKTHZxNDhjQ1ZNUVUwT3g3ZWlpUzY5cjdyT21BTklsekdUVDRaLzM0?=
 =?utf-8?B?VTl6THZEaXdEZ0E5KzY5RlY2STNqWXBpMUY3TEdadTFoT20yemx0MG9nSzhZ?=
 =?utf-8?B?VGhnRVFRMXlZRnBtaXdvQkhBd25keUw2Mk92b1VwdzEwVnNrenpIT0hhSEll?=
 =?utf-8?B?NjJ5cVpRVmVMMGxhNXpFb3B5UlFobWNBcTlMUHdSWlk2djlYS3VlcHVrNGxJ?=
 =?utf-8?B?QjdPN09iN2R1cFJNeXVYN3VZOTJtNFJsK3lmZmRVUTdLUktuMmxJWWdUdVVp?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0886a401-966c-4d01-f4c5-08dd0057058d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 00:39:51.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvLp0JvKL9EDF4JVSxI7GL5YIq5kGuGubLfduDp9wkllCQMchmqi8pU2xPsALf3GLogvvZWCRY2yEnPCv+YTbuE/Kgr5koepn0R5T9A0/Ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On 11/8/2024 15:56, Matthew Brost wrote:
> On Fri, Nov 08, 2024 at 03:51:12PM -0800, John Harrison wrote:
>> On 11/8/2024 15:35, Matthew Brost wrote:
>>> On Fri, Nov 08, 2024 at 01:27:37PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Add support for the two crash dump notifications from GuC. Either one
>>>> means GuC is toast, so just capture state trigger a reset.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
>>>>    1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index 63bd91963eb1..7eb175a0b874 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -54,6 +54,7 @@ enum {
>>>>    	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
>>>>    	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
>>>>    	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
>>>> +	CT_DEAD_CRASH,				/* 0x8000 */
>>>>    };
>>>>    static void ct_dead_worker_func(struct work_struct *w);
>>>> @@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>    	return 0;
>>>>    }
>>>> +static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>>> +{
>>>> +	struct xe_gt *gt = ct_to_gt(ct);
>>>> +
>>>> +	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>>>> +		xe_gt_err(gt, "GuC Crash dump notification\n");
>>>> +	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>>>> +		xe_gt_err(gt, "GuC Exception notification\n");
>>>> +	else
>>>> +		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>>>> +
>>>> +	CT_DEAD(ct, NULL, CRASH);
>>>> +
>>>> +	kick_reset(ct);
>>> Side note, we may want to wire a devcoredump to a GT reset too.
>> I have a work-in-progress series to allow creating a devcoredump without a
>> scheduler job. I assume that would be a re-requisite to creating one from an
>> arbitrary GT reset. Certainly coming in from an async event such as this,
>> there is no scheduler job to use. Hoping to post that soon. Should be easy
>> enough to connect it to the GT reset then.
>>
> We appear to be stepping on each other feet, just posted this one...
>
> https://patchwork.freedesktop.org/series/141110/
I did see that. Haven't had a chance to look in detail yet. But I don't 
think it really affects the changes I'm doing. Either sched_job or 
exec_queue doesn't make a difference, we don't have access to either 
outside of the submission path. My other changes are more about 
splitting the print code up a bit to allow dump via the dmesg helper 
(for internal developer use) as well as via sysfs. The bits I'm missing 
at the moment is how to get to engine state without having a job/queue 
to start from. I was also wanting to allow capture of multiple GTs in a 
single dump. I'll see if I can quickly clean up what I've got so far and 
post it so you can take a look.

John.

>
> I had to code these locally while working on something else so threw
> them on the list.
>
> Let me know if I missed anything there or if you want me to hold up
> merging as I was planning on merging once CI is clean.
>
> Also agree it is a small rework (don't assume we have a queue) on top of
> this to connect this to a GT reset.
>
> Matt
>
>> John.
>>
>>> Anyways this patch LGTM. With that:
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>    {
>>>>    	struct xe_gt *gt =  ct_to_gt(ct);
>>>> @@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>    	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
>>>>    		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
>>>>    		break;
>>>> +	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
>>>> +	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
>>>> +		ret = guc_crash_process_msg(ct, action);
>>>> +		break;
>>>>    	default:
>>>>    		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>>>    	}
>>>> -- 
>>>> 2.47.0
>>>>

