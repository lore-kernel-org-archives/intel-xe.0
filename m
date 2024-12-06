Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C36E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 20:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3B10E06D;
	Fri,  6 Dec 2024 20:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVi+Yi4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD07D10E06D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733516880; x=1765052880;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Mu2zekwYJvHP9fazefOYLuTWnraR3XGMuX7ylQOVFZs=;
 b=HVi+Yi4xDzrwlqNFH4zhB3oL4LqjV8t9Lcb56mybg1h9HjencigeSmAs
 h//8097Jzu8SjAwntPNDwI86U1t0pCWhOSwfFoV4HAVVRsPDvKjSbTo+s
 hkGxjdcb1dvDDkdxBw4Js6mXurJww1SDBcTbW1grOwXFQu/iGWI9K5Phk
 VdxwBtZDJpGiwQ4TCmnt+VduQPVm0yid+VWzIPZ596lMqmS6h3+D0yJrX
 GR453n4l9Bf6fsqRRMuthCFZwiOPsfSnyQDWwm2V6V+R9LUUJX+zWeb98
 B4XPM7+iFBfpBQ9CSwyIPJ4Hdd9YTGQLTORwKU5pFw3bTtXidJlNXnL14 Q==;
X-CSE-ConnectionGUID: mu6HhkntTDWSYmD5HRUp2w==
X-CSE-MsgGUID: 2GTt2SKqTTGROjkX+uqyjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33765664"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33765664"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 12:28:00 -0800
X-CSE-ConnectionGUID: /ZCbvUedQXO0sqWQpRSIbw==
X-CSE-MsgGUID: n9/IIatpT9im64w4Qy/nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99544985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 12:28:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 12:27:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 12:27:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 12:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKFRI6jd0tzlrsPRt9I4Z6hXn3kYZEweRC1QlxHeUtdCLXlWed8wQatpc0jqVJ7QTGwwP3Hw1HJwjb62tnI7ZeB+Eu4OZJukQ1Jk4504LToR50v/64rY/C326ip6YbOJC3gpkas3pIp/fxbG5NQf2KLdQjeZTXuG9N7YVkhslt/zp2T+ksZs0ZcWRqpe1VD86NZfMejXideq2qtcFmBX0Rv29GZz/GTouT1sGd/evlK8gprPMA4DBVpDFmXmQISGEL/IpEacn1B7GPRSEgw9KdPh3XWzBUIkFMReRrftQhg1/FKD72o2lfChV4alEsQRoucoMyiwxeMG4SUl51eQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/z59zOeKSrkLXaij2UqlAXdxv3M0lTdcFTpcc/hS7E=;
 b=v17lfifZPy2tEoV8QQvFywFb1dDu34t9I40lzXOCgF6GD3REzM3wcsB7N49nzt7S2PmghrdxzCnATMdEzZcmsucZ+AZD09yxnzSXb1K/CNONyqEwYf9uqfSQcizpJN1FylUlnIrwM7kIp/n48jZiA0C0YtGX/iMpHIZuZQ2gWs+v/n/cZMfxJevYK84hLV2kP1PFmzOX9rqW/j3W8/i/35cTOEi2VZhWK0f6b2tmakvcHIYbwdqmukdk8V7diFzr8DM3wnKrsFTqfQTUu9muE/PWOOYX2QZ4In0nor4RQqlt9XJ7Fmf7xIyRrqGNJn+augKMZdQf7AhIK7NkATQBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Fri, 6 Dec
 2024 20:27:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 20:27:56 +0000
Message-ID: <59aa7c8e-6ff1-45c6-ac6a-fb494785f382@intel.com>
Date: Fri, 6 Dec 2024 12:27:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/pxp: Add VCS inline termination support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-4-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f0f86d-bc32-4dcf-79c5-08dd163477df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmJYbUE1bkRZTGwraWpQOG9uSE5RTStjS2J0eTM3bFFnMGFqRGFWT09Ga04w?=
 =?utf-8?B?NkwxU1NIenBoYW5EdTRMZTE0Q29WaXZDVHBIczRpZ1NEV3NwQUJsT0FMb0J2?=
 =?utf-8?B?TG43RlVJc1dkNFF6R2daUDJlbGZvM0FSR1lURzFSVGMvdEFGeGJWQzlIRTNC?=
 =?utf-8?B?US9KWFhvaEZRTVMwOW5nWWZjY1Rvam1BVndSeWZmV0FHdVZ3WFQ1dlhuWS9L?=
 =?utf-8?B?YU8reGVGYzlETmdSRFhMU0xiWjA4NHQ0WW43MFRoZHJsQkhyL1R4dkNtUGJl?=
 =?utf-8?B?WThWNzNsSjBHZ3p6ZzJTUC9jSC9MaDJudFczZzU2dEhlUC9Eb0lyUk5GZzZk?=
 =?utf-8?B?Snk4RGJ6QWFINmF6MkdkNk11TktzZ0lMb01NZWtKbEFpdjZBSkdVNFRmajI0?=
 =?utf-8?B?enRZRmJBbEZNT2ZXV0RyNjBpdVN1MUVqNjQrWVNqaVRZU1M1SFg0bDl3bnoz?=
 =?utf-8?B?dHFHWDVMOHo1bmo2S1NLWThNMHZGZ0VIVEl0Sk1VNUtKeFZsVTBKbWFuS1Vk?=
 =?utf-8?B?dnpadXNHL2wxYTdlMDZ6citkREhDMVk1eVE0ejlGQUJDQzFyU3BaRWRaU3Nk?=
 =?utf-8?B?Q25TYTJiaGF5T2ZRMkRHWFJNYXE4M0JsdTI1TFBZb3RJZ2tJNlcwdW9wa3l5?=
 =?utf-8?B?bGJIdGx1bHpBY1orTHp3UTY0Mmg0SG11MEo4NlpRTnhFV1IzUXRRNVY0eGhq?=
 =?utf-8?B?cERHOWJIQXlNMXB4QUVmenZCbnpzeXEyVnd5dXI5SFZkdi9xaEo0bTBJR0ZB?=
 =?utf-8?B?MU02REZhcW9RaDZleXRlZ0R0bVRRNnd6Q20xTXkzc2xQenJlaHl2eW8vUGtD?=
 =?utf-8?B?UFRqdmJDZkJPZFBTVkloeWNBa0lXRG9TS0laYUZDWVA0UXRJczNVZTV4cEVz?=
 =?utf-8?B?aFNxSTl6bkJUQ2w1Mk1wRW84R09FbW4veTYzK3FkVElmNnVqRVFpeHdIUnBv?=
 =?utf-8?B?Z2FFNm1rWWxXTFRYRDIwbkdtSldOWWxDRkpCR2xOK1ZiZ0NLa291b2tLczdW?=
 =?utf-8?B?V2pndXRtRVp5WTVlc0d4TkxMeHRMZ0MyalBzeFFNZk5rRFRjeDJML2s5eWYr?=
 =?utf-8?B?VVcwRVRpNWxPbFZHTW04enFheTh3Nmcyd2VmN3VlTU9DNlErVitDMnh5MWtV?=
 =?utf-8?B?R0dLbHdBQ1kwb09wMnBDRnJVNGw4aGFTNGtvcFVsR3hhNlpWY3hQV01qRUNM?=
 =?utf-8?B?VCszRk12dDV4akduQkRURDVOLzNOSUtTejNDa0ZocDZSUUVrdnhsS0tCdHky?=
 =?utf-8?B?b1NTcjZOWUdPZFgraWpXSlBBM1Z3SzErMjAwait2VWFxQm0ybEZpR3MwVnRO?=
 =?utf-8?B?aUdETU0va21ZeDdQbzZWQSs1aUxQSlBTdHBDRkdoQ1U1QTVjTzlZSVZqaFlq?=
 =?utf-8?B?ejQrNnBNWEN0VmZvYm41cVJWeTZXaVFpampjaVhJMUlqaFRoODJrZlNPTmtN?=
 =?utf-8?B?Nm9QOVFJKzNoSHJtTjhvaGcrSUFoYWFSWWZsbFhFRm44dklDSXVGS1E1clVv?=
 =?utf-8?B?UENIVUErWHo0MHNJek92QUZYWkZRa3RvcFdLaDgzVkVyWkYvaEo1WldWdUpY?=
 =?utf-8?B?dXhZdHNSOUJnQ1ltR1hiNTgyNTJFbkpNK3FoSldWcWZhQTZVSzU2ZlVkUFhx?=
 =?utf-8?B?OTNsNkZPaU5UQklVMmpLRGM1bHBZbDgzMlZTR2t3b1FTL0VITGNMQS9ZTXk4?=
 =?utf-8?B?SElicFVXZE9jUU83em5Jd3V6eG5Ld3JOSkFLQUlkTXFlalFHS0tYaGlnWnhC?=
 =?utf-8?B?cmZsNWNMbk9lR0VvTFYya2E4VU03anZJdWVKdzlTWk1HNVRObUYweFBCYUJK?=
 =?utf-8?B?d1NEVC9VV2FlZzdoUjBNdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm5VMkpVZmxRRW42aVdVd21pK3VrSjlQN2tBaWp6QWpQa29OaVNFT20yYnJQ?=
 =?utf-8?B?eGVhQklDS1U5QmwyRzJ0ckxXRmhEN2YyZy95YVM4NHNwMjNWSllKeHhrVjFv?=
 =?utf-8?B?OXZzZGNacVo3STZLVVpBMHYyajdEUGhQdlJuLzZQMGRlOHJyVzFNSFR6N3BK?=
 =?utf-8?B?TnVRZmJaQ0RkU3lRM2JhZ1Fkb3UycndVMDhCRFhMOXkzWTZFTWdsbmdYaE8w?=
 =?utf-8?B?dG50SlJCZGE1U2swVWg4QmpvTkJTTnBUbHFMeU92Q0pyeitLS0svcTI4dWZD?=
 =?utf-8?B?LzBnVzJBQjd2M3o1STBOM2R3U1dOcm1LRitGWE9RTlIwazhPdW9kWlc2UEVw?=
 =?utf-8?B?aEJ3SzFFdTY2NUVKQ0FkWnc4Uy9IRkpNdnRHRndrbWZ4V2VBdFgyQm9JOGlq?=
 =?utf-8?B?S05EZkVZWWhUVFlnUDJCOFhzdVMwK0ZlenpHbDV4V1VVT3J0VEhmVnI1cEpI?=
 =?utf-8?B?UFRvQWRROG81RTE3T0k0WlErK2dTQ3lvQ3o2Ung4aXlPWjM5cGxsdnJkQ2JW?=
 =?utf-8?B?TjlXc1lIUnNtNWtlV1g1S081MTcwZytaQXJzby9qYTNSRkFXcUt5eDlCMkJZ?=
 =?utf-8?B?eU1JQkNNT1ZwS3BuaDhLRXhqMmo2M2hJSGZOVFE1YlhKazkwS1lNKy8rc1pp?=
 =?utf-8?B?aENFYmw3MjIxcElxQk1JMEdtS3hBcE5uRzdUR09MVElVV2c4dUZIeEZPNGRR?=
 =?utf-8?B?WXR4b1E1c04zaGhFR012bzZRRHJVaXpHYXN6UGtZRUZPZDNlSEdEbmJtZ2dk?=
 =?utf-8?B?TGNrSTF3bm5JZ09CQ3dpQmt6MFZyZHhkcGZaUUEwWUlwaHFERHBHQWEySVRn?=
 =?utf-8?B?QjdvL3BNbnRxUU01Z1ZFVFhqN0hBRDBVZEU0bElrMjhHTitBWGJ3OC80MDVS?=
 =?utf-8?B?cTNRRThWdkFXRmgwK2VOT2FYRExJclNXRUZWakZIaUNvTUlYUXFvNmVyN2xS?=
 =?utf-8?B?SWdmYVRRbXBCQWcvM3ZqcEcrdTlqT0Jmdm1JbFpoS0ptOElpS1g0Q0diZk05?=
 =?utf-8?B?OUZvcFpzOHVxZ01PUmlkY0xKTHc4dy95TlVza0dBd2FCQmZwZlpVQlBsd3hH?=
 =?utf-8?B?c2hVR2pWWTAzODBsRnJPWXc1b0NIOS83WFdZSGlhRlR5RXhBcHZRNUpMdkwr?=
 =?utf-8?B?aDFybEM3VUM5RzYxYWM4VWhUTUdvTXRseDBRQ3hpdWxPRUJWN1l4QnZNbzdn?=
 =?utf-8?B?OFA0YzRBd0FGY0UvNXlrK3RIUU92TEZWQTZIQlEzRm9GcXdWSkszL0ZUQWQ5?=
 =?utf-8?B?RlcwMWRuWjNVZmg4SURSMVlXOThIc3haZ1hKbDBzK3BwVGp2MU1ua3hudENk?=
 =?utf-8?B?RG5WcmJZVHVFVFFxejFNb2xGb0xMUlRMbXpBWk4rMzlFSFNIZlMwVytiNG53?=
 =?utf-8?B?M0tHTXJCTU1rdUxZUUxlTjVlZnVZN29IS3JpMm5Bc1VaSUt5N1pjUVlKWUF0?=
 =?utf-8?B?TGxJcHhub21xOTNOWVhvRGhxbk5SRFo2dk5wZHhEVHY1VlB6dDlzTkZHMHI5?=
 =?utf-8?B?aWNjRVhVTDFwdVBSM0ZZdkRnSE1XdWxJNk00WC9BMElmbXZxb0JXNXVCM1Ez?=
 =?utf-8?B?M3A3WVVLOVlkZ0N5Q29PS24wdEF5cFViTUJqSTFJTGxFbG9QSEtrOGNzWC9h?=
 =?utf-8?B?dndHNHUxTE9KTTRHY2c1b0h6MnE0UmM4MHZjTGV2WG1rZTdqdmFLTkM3ZE1N?=
 =?utf-8?B?ektjeWFWVjRVNklFYm42WUhGaHFScHVUZ1NRR1VwMXFla3lCTlY5MUsreCtp?=
 =?utf-8?B?dVphS0hHSVZLcWdwcEdxOVVGNkREQ1NtVXlWVGFzK0xlUzNja013S3pFS2Ur?=
 =?utf-8?B?dkVQaW5ZMS9kd0pvcE94YldKQjNMWmdXdW5FWWIvVHYyeUFyRU8xbm9XVDkw?=
 =?utf-8?B?UlZnZFhWVWViMSthVHRSTlFJRDkwVHMxQzNIRVcvRytEekpVa0tWc3IvRW53?=
 =?utf-8?B?VDFwM2lWaitpOHp3YkdvUmhmQ1ZoQm1leGhLbG5saDY1UWRnYjdGRXJ4WVRR?=
 =?utf-8?B?MTRwTFVGNlN1a0ZUQUhIdDY3dmcvZVcwSFN1NER1K0lJbUlCR2VBcVVvakM5?=
 =?utf-8?B?dXNXdFVIQnJxQ25KOFpKdW1zMW14ZTNGM09CZkNSK3diTG9iRjQ4YjMzOWVQ?=
 =?utf-8?B?SklGaThucGFlcU8wSDVhSHBCUUh1Q21YOWRFd3dkVTdVUDVRU285OWJRQmJm?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f0f86d-bc32-4dcf-79c5-08dd163477df
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 20:27:56.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRUnzsDLJ66o/w2QEYkFkJZoV7p4ZkNDhNONpCl3vnqZoFLGa1GeYAZl7+encDEpBnz1ARTy26zmPEW92aNFyDcIT9W0pZVymsaW48LhH5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> The key termination is done with a specific submission to the VCS
> engine.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the termination flow. It is separate
> for now for ease of review.
>
> v2: clean up defines and command emission code. (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>   .../gpu/drm/xe/instructions/xe_mfx_commands.h |  28 +++++
>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
>   drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 113 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   4 +
>   drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
>   7 files changed, 155 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> index fd2ce7ace510..e559969468c4 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> @@ -16,6 +16,7 @@
>   #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
>   #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>   #define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
> +#define   XE_INSTR_VIDEOPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   #define   XE_INSTR_GFX_STATE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
>   
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
> new file mode 100644
> index 000000000000..3c0c97f78e90
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_MFX_COMMANDS_H_
> +#define _XE_MFX_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +#define MFX_CMD_SUBTYPE		REG_GENMASK(28, 27) /* A.K.A cmd pipe */
> +#define MFX_CMD_OPCODE		REG_GENMASK(26, 24)
> +#define MFX_CMD_SUB_OPCODE	REG_GENMASK(23, 16)
> +#define MFX_FLAGS_AND_LEN	REG_GENMASK(15, 0)
> +
> +#define XE_MFX_INSTR(subtype, op, sub_op) \
> +	(XE_INSTR_VIDEOPIPE | \
> +	 REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
> +	 REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
> +	 REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op))
> +
> +#define MFX_WAIT				XE_MFX_INSTR(1, 0, 0)
> +#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG	REG_BIT(9)
> +#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG	REG_BIT(8)
> +
> +#define CRYPTO_KEY_EXCHANGE			XE_MFX_INSTR(2, 6, 9)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 10ec2920d31b..167fb0f742de 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -48,6 +48,7 @@
>   #define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
>   
>   #define MI_FLUSH_DW			__MI_INSTR(0x26)
> +#define   MI_FLUSH_DW_PROTECTED_MEM_EN	REG_BIT(22)
>   #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
>   #define   MI_INVALIDATE_TLB		REG_BIT(18)
>   #define   MI_FLUSH_DW_CCS		REG_BIT(16)
> @@ -66,4 +67,8 @@
>   
>   #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
>   
> +#define MI_SET_APPID			__MI_INSTR(0x0e)
> +#define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
> +#define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index b459dcab8787..9bc86c1fc16f 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -39,7 +39,8 @@ struct xe_lrc_snapshot {
>   	u32 ctx_job_timestamp;
>   };
>   
> -#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>   
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     u32 ring_size);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index 196c0e5bbb17..326baea679a3 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -5,15 +5,21 @@
>   
>   #include "xe_pxp_submit.h"
>   
> +#include <linux/delay.h>
>   #include <uapi/drm/xe_drm.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_exec_queue.h"
>   #include "xe_gsc_submit.h"
>   #include "xe_gt.h"
> +#include "xe_lrc.h"
>   #include "xe_pxp_types.h"
> +#include "xe_sched_job.h"
>   #include "xe_vm.h"
> +#include "instructions/xe_mfx_commands.h"
> +#include "instructions/xe_mi_commands.h"
>   
>   /*
>    * The VCS is used for kernel-owned GGTT submissions to issue key termination.
> @@ -198,3 +204,110 @@ void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
>   	destroy_vcs_execution_resources(pxp);
>   }
>   
> +#define emit_cmd(xe_, map_, offset_, val_) \
> +	xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
> +
> +/* stall until prior PXP and MFX/HCP/HUC objects are completed */
> +#define MFX_WAIT_PXP (MFX_WAIT | \
> +		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
> +		      MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
> +static u32 pxp_emit_wait(struct xe_device *xe, struct iosys_map *batch, u32 offset)
> +{
> +	/* wait for cmds to go through */
> +	emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_session_selection(struct xe_device *xe, struct iosys_map *batch,
> +				      u32 offset, u32 idx)
> +{
> +	offset = pxp_emit_wait(xe, batch, offset);
> +
> +	/* pxp off */
> +	emit_cmd(xe, batch, offset++, MI_FLUSH_DW | MI_FLUSH_IMM_DW);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	/* select session */
> +	emit_cmd(xe, batch, offset++, MI_SET_APPID | MI_SET_APPID_SESSION_ID(idx));
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	offset = pxp_emit_wait(xe, batch, offset);
> +
> +	/* pxp on */
> +	emit_cmd(xe, batch, offset++, MI_FLUSH_DW |
> +				      MI_FLUSH_DW_PROTECTED_MEM_EN |
> +				      MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_DW_STORE_INDEX |
> +				      MI_FLUSH_IMM_DW);
> +	emit_cmd(xe, batch, offset++, LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR |
> +				      MI_FLUSH_DW_USE_GTT);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	offset = pxp_emit_wait(xe, batch, offset);
> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_inline_termination(struct xe_device *xe,
> +				       struct iosys_map *batch, u32 offset)
> +{
> +	/* session inline termination */
> +	emit_cmd(xe, batch, offset++, CRYPTO_KEY_EXCHANGE);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_session_termination(struct xe_device *xe, struct iosys_map *batch,
> +					u32 offset, u32 idx)
> +{
> +	offset = pxp_emit_session_selection(xe, batch, offset, idx);
> +	offset = pxp_emit_inline_termination(xe, batch, offset);
> +
> +	return offset;
> +}
> +
> +/**
> + * xe_pxp_submit_session_termination - submits a PXP inline termination
> + * @pxp: the xe_pxp structure
> + * @id: the session to terminate
> + *
> + * Emit an inline termination via the VCS engine to terminate a session.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +	u32 offset = 0;
> +	u64 addr = xe_bo_ggtt_addr(pxp->vcs_exec.bo);
> +
> +	offset = pxp_emit_session_termination(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, id);
> +	offset = pxp_emit_wait(pxp->xe, &pxp->vcs_exec.bo->vmap, offset);
> +	emit_cmd(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, MI_BATCH_BUFFER_END);
> +
> +	job = xe_sched_job_create(pxp->vcs_exec.q, &addr);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +
> +	dma_fence_put(fence);
> +
> +	if (!timeout)
> +		return -ETIMEDOUT;
> +	else if (timeout < 0)
> +		return timeout;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index fd21ac935be1..4ee8c0acfed9 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -6,9 +6,13 @@
>   #ifndef __XE_PXP_SUBMIT_H__
>   #define __XE_PXP_SUBMIT_H__
>   
> +#include <linux/types.h>
> +
>   struct xe_pxp;
>   
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
> +
>   #endif /* __XE_PXP_SUBMIT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0be4f489d3e1..a4b5a0f68a32 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -118,7 +118,7 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>   	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
>   		MI_FLUSH_DW_STORE_INDEX;
>   
> -	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
> +	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>   	dw[i++] = 0;
>   	dw[i++] = ~0U;
>   
> @@ -156,7 +156,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>   
>   	flags &= ~mask_flags;
>   
> -	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
> +	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>   }
>   
>   static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,

