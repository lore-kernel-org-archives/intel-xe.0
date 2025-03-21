Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D676C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 17:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D6E10E198;
	Fri, 21 Mar 2025 17:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aG96qKqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7B610E198
 for <Intel-Xe@lists.freedesktop.org>; Fri, 21 Mar 2025 17:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742576858; x=1774112858;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k76+VxtPPCX/WMJPYZF1ODuIyy4FaY34vvHirIyJbNo=;
 b=aG96qKqewawhpUzk+A9QmsGyyAqV5GM0WeR6NsqsDCkXKgs4DZ6lzK9n
 xmKC6S7AWMactdcWkMtyati8CtoUE2wuhw9ObR/HU9SEaLu94CdXZQmjU
 SgEUGimNurRs07aR2+DkgqHvU1qv1Z3rg57ckKacJdDwbR4YILvGDknep
 z7jEalELrRzLy9WF20zWroI7vCvXSIKrCS7OTpOT2HhoOL+zbD1bmIIF9
 MIfoRFZcSN6/NCrC9DbDkT8ZKcHemFDQRJ0Mz9XAJJ7prV2K0o6UivrBt
 hQvB0OlBvEdc8aenqULU4gcd/cI0qxr+A5dRJwtz+9xVkTdxGzhqc9Jp1 w==;
X-CSE-ConnectionGUID: Y9dchH9cQxyudBg6sMgSyg==
X-CSE-MsgGUID: Hr+ZrfU2QQSnTtzMLtiiZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61372426"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="61372426"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:07:38 -0700
X-CSE-ConnectionGUID: mG6LlvhdQf2/38neGnnUqg==
X-CSE-MsgGUID: 0broFg6aQy6z2PQlxeIyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="154350532"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:07:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 10:07:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 10:07:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 10:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmymmRcl1Vy1qahjASfO1CPLPvA5QlicNy/AQw3Nyp7pL/mbN54PPXJ7tjnMUyRspYu/i8FHaIywqYySm36aSNyApUgvXR2R84wnp0DYFEPYDoMbs+v7Mqf0JZjZqvv99Lh5WC8ODg+nFFVjVlIDEKQDwqRv8WBtg9PmI+xKBqWgYjL6PnhWG+jFJAdKoOOdkTHEJLHWGZCEcebLLTQ9qstVCUP16NlWThYo+tt6ZzZngGYFbmgfJswezEgEgmATEVC22H+63jOIVz6dNve8lJAKA4PxqRjYuidF3FgvAjtNTsArzxzr/gmE9VQB2naQw9NoJCXlK8PoZZRRG/vOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fooTC0vDsYrYV1rjOCMomFb7MKmnfwyXL1gZNG/3KUQ=;
 b=Koahwq6tgmp+Y7GPYNJtiKrpEFk3woixBZ4nsNFsWzA1XXf1WS/G6Zt6xzxCRnP8/7ohGSFaa2se2bJyad+kYumWDhvBL+wWxIiLz0A62LHTgQdv1w/EaB/a8dTpPBB1ZFvGnhRTEmcUUY/A94zopv6yKqxlcLOBXyKIZXUpAM2qdbO3UMV1zIOGhGDzMM/sIEee1AEzxu0kxHTudPXzlzTaErYxRSXhXH9esgUPU80ZWMyFH4XuiQqSF+t6mlerwK+mdwoLPCvQkHpgUSmc9MOTG+EGRmbROjmTiCf4ms5f2HzwfbsyzeHf8RvFvfrgTeQIiLhGCeNqQd1RI0fbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 17:07:34 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 17:07:34 +0000
Message-ID: <094db2ab-de03-4505-9256-5fa552babb0a@intel.com>
Date: Fri, 21 Mar 2025 10:07:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
 <eaf6cf82-6d5b-4e2b-9a61-bc61d447c5ae@intel.com>
 <a72ac04b-dbe6-4840-8f5b-475bac782382@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a72ac04b-dbe6-4840-8f5b-475bac782382@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5c2fdf-d03b-4129-9134-08dd689adf8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nnp5YUt0bnMxMGZYREFCN3piOXdiUVdGTGhGWU80SnBSWGlhWm1GdUROYmNr?=
 =?utf-8?B?dXpwYVZZc1FNRE9zME0rUjBObnQzVmVTM2gzb3pGYi9wbzU0T0hZYzYvM3d2?=
 =?utf-8?B?MHlVbWZRazNJYmNXcW1nMzZWbU5DSG4zWmRVaURPSTNvcHh6ZUc1TDd1cGZM?=
 =?utf-8?B?U3Y5MFlibG1ic0h2UENNZGpPNXBMTDlLS0FQcmJuMUxBaUxzWXZKL0JGMGRh?=
 =?utf-8?B?enIvRjl5cXNGdEx6ZS9LaHY5aFRzOHlKTHlOYmpadnV3NktJcTQ2bEFRQU1L?=
 =?utf-8?B?WUJ1NHZjTForNW1JbTRyTUN3L25SZ25rWUJKOUNCcXF1WWV3Q1dPa1MvcGpv?=
 =?utf-8?B?K1BSNFNzc0FxbUoyaTBsaVF0K3o2SXFGQ2pHK3NRUTc4S3hreVZxRG50bzVN?=
 =?utf-8?B?RmJQOEw4ZDFjbThWRnVZa3h1aVN0emZBbGZiRmxjU3duNERRd0xkaDBGNnN2?=
 =?utf-8?B?cW8rVXVseW9OUS92RVJIUC9yZ1dzK1ZiaWRmcXZPSHRMSEJrM3QxZFNwQjgw?=
 =?utf-8?B?MG9jc1lhVTRudHRnRmN4bS9MVXJ6Q0grcDNtYzA5Z0lxTWorQ3VJeHFBMjk2?=
 =?utf-8?B?T05LSDhuUE9BMTZVUEhLWVhWTzVZQ1gvTko3SFZzS0U0cGlnMDdaajV0TGs0?=
 =?utf-8?B?d01seGk2NDNZUk4xb1JrTnlvZTZyWE1pK1lsYnIvSzVIWVM0MkY1eVpRRGR5?=
 =?utf-8?B?aGVTRGRhSlhRbnB3L1hpK3lnY2M0Q2p3ZkNOazZ2bGpFdklTZ0VDQ0NEWldS?=
 =?utf-8?B?UE95SDVqamMwSGluOHFQRUMvYXl5bHZ1SXRyOXdPb1NDUzBlNjl1WE40UnI1?=
 =?utf-8?B?OGUxYVB4WlFxUVZvM2FnOHdZbVpleVg5THQ2eFd4K1Rvb0ZBYWRxVTA0NjBF?=
 =?utf-8?B?TnF1Q2VHenVQSDdlUXNuaXBvSlZHV1RpNFlpcklqanZUUlYwMlNCemJ4Qkda?=
 =?utf-8?B?UFRrUUNMSHgzSXM5QmVDOTRmaGFiMy83VGErQXhSOThyYlo3T09IbC9oQjNU?=
 =?utf-8?B?c0FUY2R0eUd4UThscm10dkZ6OTVHMzFTdGVkK29PU2RLaGVtRXcrNWdBeEp1?=
 =?utf-8?B?NzBOY1VnSkxtUmpZdE5xVlVvN01USWc3VFJkNXRrSGdFKzd0ejRCc0FSY044?=
 =?utf-8?B?bkRFN3drWTZIeUl3NHNybC9JOUJqb3pRRUlBMVlCU211WTJiR0dkUjMwd3Bl?=
 =?utf-8?B?a1Q4SktmZFJubjZ6emUyTk1EZzEydFdCbXdJQUVZTlcrVzFydDQrYkxvZUF1?=
 =?utf-8?B?S0lsOURuS2t6SWRwMGlqV3FoL1JROW5LODBhcXdjWmNoUEhEcVJYMTFMeGpn?=
 =?utf-8?B?cEtERENSaWJiMEFaY01oU0dCVmlheCtab2JRV2toRWM5dVFiT2JibE1UR2tl?=
 =?utf-8?B?WlpCRGtnd1ZEZjUvTG5qMGpzOGZKeE1TVVFjVjlaRUkvZ3BnbDkyMFhkaDFx?=
 =?utf-8?B?TDMzdUZiWTdYb2VnUnpISnZBRnJNWHBTSXAxOEp6SzcvaGFmVDA5d0UwbjJm?=
 =?utf-8?B?SEZsbVRjcjVlN08vSW5JckhzV2xjbjlPb0F0ejBIYXVzbGV6bUcxaFg0RFNI?=
 =?utf-8?B?eG1GekhWeW5hNitsc0Z2VklCcGV2WE9ueDVPVlhrMFZtbkdQekRMY2V0bGZP?=
 =?utf-8?B?ellBMjV0ZWxWNGpBak96cFYzeEMzT2ZrMVdSV21NaHlDRzlxbHdLbnZ1YkJv?=
 =?utf-8?B?Y3BWcjBONDRDLzJVeUc4TjRrWXBxbFFYRVMrYm02QStLTVVKaUlTeUVNUnhS?=
 =?utf-8?B?WWduaTFMd2J4Y0h2eU5YU0M5d0o1VExLeUhPbkdSTXJtNnNuMEc4NmVnZlNp?=
 =?utf-8?B?V3l4V2txc291R2k1N2ZSTmtKdzhoc1pyZjNldUxncERLVFQvWUMwWHB0Mmw2?=
 =?utf-8?Q?0LAw+TnWpU0o4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QStNQkI2eWNaeUxWSml0aWdIOHd0ekRPbk9hS0JiWGdKRVZyM3VDQXZaQVNB?=
 =?utf-8?B?WVdKdkRlTEFhSkhZTzgyN0hYR1p4KzRIWUZ1K1NzWWhpUHB2U2tyL0lEaDVY?=
 =?utf-8?B?WElGaW1CTzVvbE1QVzNNV2NvaVdUVmJ4T2VGUXpFOE9zZHhoNnoxVG5WUDVS?=
 =?utf-8?B?dkJZNk8waFlUUnMxY3JvemRkbmg2UHRQQ2JsTlhSTHc2anhuN3V0RHZDeUVJ?=
 =?utf-8?B?YUltT2pobWhqTEtOWkFqaXZsMW93UXRqeGNDM3l5WXJkWVNxaUhBK2RuemRP?=
 =?utf-8?B?dkt3c2RmeDJUbk8zeTNSTGRDTGJNdStkc2J5RFp5c2VFR1pTQk8yL3lGUGdL?=
 =?utf-8?B?eUNLU0ZRYzlLVHZtZlBrQStleXdmQ25pK2l1V1ZzckZMNG1hV1htMVZyL1Qx?=
 =?utf-8?B?SHQ4LzNWVDJIZWVEbWlmYjhqSlZ6LzU1eWxBMDdHV1RkelNtaERDbGlFZElS?=
 =?utf-8?B?QzBXemc5eTV5Q2pCUitLWjdsdllSSmZiTE1jNzlKZVY3YTJhU2l6U1hvajlT?=
 =?utf-8?B?ZEZpLzJkOW5NL2E0T1lqa2p4eEVWR09xK1Y4SkRvRjhSK2FkOHJ2MVRpZ2lB?=
 =?utf-8?B?SWU0L3VWL2I0RUtTTHdxYTU2Znc5aVJPWWlMOXJSYlZMUk9HbXdyQkxxcjlm?=
 =?utf-8?B?eE5oV3hNeGFyRGVELzR3eXBYekRjRjZMRFZoLytjdCtXM3o4NDZBQm5jcjBv?=
 =?utf-8?B?a1htM0haajB4M2tLemY5VDVoTWovUk51MDlTcWFTOHpTZHQ2eTVPUXZtQm5I?=
 =?utf-8?B?V0ZWMEdSeG9qMmcyRVRyN0tQRXlHVENhVzZZTHBlYjRwUG9odDhOY0RWK25Q?=
 =?utf-8?B?OU9VSHBRM2piOUtrQUtOdnRKblE3L3BXemx3N0pVM3hjTElvOGliR1MycnM5?=
 =?utf-8?B?YjhNZEd3bG5ZZkdmMnUrQ0FtWjdyd3F1VXJCNThyZ1Y4bERXZDBjNHJyUnZM?=
 =?utf-8?B?RG1QOXpsL3RPZ0s1bEE4dHczc09GR1NicHJKS25zekZVdHZlK2lyVzlXRTBi?=
 =?utf-8?B?a2MxVGhNMGVSOGdzR2dEWDFjcmZJcHlFS3VWTnhTS1R6WlY5Tk4valRacSsw?=
 =?utf-8?B?T2NaZmFrSWtjVVZtdXJ2UEVPVDdldUcyeGJqR29uSk5iUE9GM0lEc0ZJd2NE?=
 =?utf-8?B?RFhsNHordEtTdGZjUm1XRE5uTXA1a1RZSThKcjM2OXBKUkFNaFcrcFMvNTIx?=
 =?utf-8?B?bkFQMVNVeUFQc1ZLZnRPUGRwdEQxU0hONnF2TVlwVkNXOFRIQVJvWlVpaERW?=
 =?utf-8?B?WjNQd3pxQXVWNC80V2JFZ29kYVVRQnN1UFUxNEpTTzhOOGc2Y0pjVDFLVURM?=
 =?utf-8?B?bE1XL0o0Q21HemVVWTllcFhSQkhHVE1XL3RxcEJwWHJWVXBFTFludHJ4dkp6?=
 =?utf-8?B?cVh2Q3VwUWFRT3RaaXFOWkdLTGhDMmhPTHFFL2VhWUlicGpEV0hkVWpoOVlz?=
 =?utf-8?B?NHpYQWZiNlhvaVBQREkwOTdJMEZjY3FzZllIWGpRR2dHWFBXK3lOVHBkU0RT?=
 =?utf-8?B?WXo0M04zbGs5Y3MwMXZWR25Vdk1LV1pudEd0K09zU2lUOUVzcXdpZXRzd3Ez?=
 =?utf-8?B?SEgxaFJveHhhdkRKNlJMWmlYREpwV1RNZkE1M3E5T2EzeHYzK1VKUkM4eWFi?=
 =?utf-8?B?ZVUvaUZCblRWSDU5NmFyTXJUUWhmdit5OEw1R3Y2ZXl0bUhpU0RmbTVMSmlN?=
 =?utf-8?B?eWZCa0ZpbGF2RUgza3RaN0t1NWJjWXVXNGNlaWJlMjhiVFVRcW1jOXUwWDcy?=
 =?utf-8?B?ekpCeUZvWVQycE9tNmVqWFExNWlGTSt3ZnZrTHFRcTk0bE85dmJGWEc4QXcw?=
 =?utf-8?B?OGNpSUhLVmRZb054MlRJR0dNclpWWXQ4L3lScGN6bU1qODRZUTBVOUxyOEFl?=
 =?utf-8?B?TWp0ZE90MDZUWFdNVXBqSm11SGVnM0dhTHYvQW5wUU5UckozMjZzZXN1MHdC?=
 =?utf-8?B?ZHkvMEZidmlLV3pyUGREUzAvcnRDKzJtaDdvUFNoRXR0dXBzYVJJdlFZczNP?=
 =?utf-8?B?S3oxMzNvY3BmZE1nbmw2a2ZicTBKQWw0YzFaM2s1YnFJWk1SY0Z2ejZSaFBn?=
 =?utf-8?B?SjhRNTZtU3JLeFBHUDJuZEtXU013S3d5bzU3bWpPWE1OQmR4MFpqaGw3NTR5?=
 =?utf-8?B?YWFiOTJ0ZmdzRDVHSDBmYVhUUG9mdXFFVVFEekxmcSszVFVsOVRTenUzYytw?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5c2fdf-d03b-4129-9134-08dd689adf8d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:07:34.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhigPoPgMxqpsug0bOz+Jp+8/1IuMBujHDJgIZc8xtTo9tLzZ2XZHafCoVYUL5uHQGsdw9QVxJtuTUFwDO5E3T8GbeqOoaAUQaMGJY/bdRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
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

On 3/6/2025 2:48 PM, Michal Wajdeczko wrote:
> On 06.03.2025 02:15, Daniele Ceraolo Spurio wrote:
>> On 2/20/2025 7:14 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Most H2G messages are FAST_REQ which means no synchronous response is
>>> expected. The messages are sent as fire-and-forget with no tracking.
>>> However, errors can still be returned when something goes unexpectedly
>>> wrong. That leads to confusion due to not being able to match up the
>>> error response to the originating H2G.
>>>
>>> So add support for tracking the FAST_REQ H2Gs and matching up an error
>>> response to its originator. This is only enabled in XE_DEBUG builds
>>> given that such errors should never happen in a working system and
>>> there is an overhead for the tracking.
>>>
>>> Further, if XE_DEBUG_GUC is enabled then even more memory and time is
>>> used to record the call stack of each H2G and report that with an
>>> error. That makes it much easier to work out where a specific H2G came
>>> from if there are multiple code paths that can send it.
>>>
>>> Note, rather than create an extra Kconfig define for just this
>>> feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
>>> to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
>>> option.
>>>
>>> Lastly, add a define to document FAST_REQ error 0x30C as being the
>>> error most recently hit. Not sure why it was previously missing.
>>>
>>> Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/Kconfig.debug        |  10 ++-
>>>    drivers/gpu/drm/xe/abi/guc_errors_abi.h |   1 +
>>>    drivers/gpu/drm/xe/xe_guc_ct.c          | 106 +++++++++++++++++++-----
>>>    drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 ++++
>>>    drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
>>>    5 files changed, 111 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/
>>> Kconfig.debug
>>> index 0d749ed44878..ef2c456c3f2a 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> @@ -86,12 +86,16 @@ config DRM_XE_KUNIT_TEST
>>>            If in doubt, say "N".
>>>    -config DRM_XE_LARGE_GUC_BUFFER
>>> -        bool "Enable larger guc log buffer"
>>> +config DRM_XE_DEBUG_GUC
>> Do we need a maintainer ack for this rename?
>>
>>> +        bool "Enable extra GuC related debug options"
>>> +        depends on DRM_XE_DEBUG
>>>            default n
>>> +        select STACKDEPOT
>>>            help
>>>              Choose this option when debugging guc issues.
>>> -          Buffer should be large enough for complex issues.
>>> +          The GuC log buffer is increased to the maximum allowed,
>>> which should
>>> +          be large enough for complex issues. It also enables
> s/It/This config
>
>>> recording of the
>>> +          stack when tracking FAST_REQ messages.
>>>                Recommended for driver developers only.
>>>    diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/
>>> drm/xe/abi/guc_errors_abi.h
>>> index 2c627a21648f..c25ea52a6e61 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>> @@ -40,6 +40,7 @@ enum xe_guc_response_status {
>>>        XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>>>        XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>>>        XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
>>> +    XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,
> we don't use/need this specific error code in this patch, so maybe its
> definition deserves a separate patch?
It seemed unnecessary to have an entire patch for a single line 
definition. And the definition is only uses as a developer reference for 
understanding one of the (currently) most common FAST_REQ error reports. 
So it makes sense to me to include it here.

>
>>>        XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>>>        XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>>>        XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
>>> xe_guc_ct.c
>>> index 72ad576fc18e..2d59934b87dc 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -624,6 +624,43 @@ static void g2h_release_space(struct xe_guc_ct
>>> *ct, u32 g2h_len)
>>>        spin_unlock_irq(&ct->fast_lock);
>>>    }
>>>    +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> do we really want to be left without any clue when FAST_REQ action fails
> on the production build? without saving the stack, the cost of tracking
> all fast-requests should be really negligible
Just copying what you added to i915. If it was deemed too costly to be 
permanently on for i915 then I assume the same argument would apply to 
Xe. If you think that was the wrong decision, we can certainly change it 
here. But there is also the argument of what is the benefit? We would be 
adding overheads (even if small) to end user systems for improved 
debuggability of bugs which should never escape our internal CI. Do we 
ever get FAST_REQ bug reports from out in the wild? I don't recall 
seeing any.

>
>>> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>>> +{
>>> +    unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>> +    unsigned long entries[SZ_32];
>>> +    unsigned int n;
>>> +
>>> +    n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>>> +
>>> +    /* May be called under spinlock, so avoid sleeping */
>>> +    ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
>>  From the name it looks like this "save" should be matched by a "delete",
>> but I can't find any docs explicitly stating how this should be used and
> from DOC:
>
>   * Does not increment the refcount on the saved stack trace; see
>   * stack_depot_save_flags() for more details.
>
> saved stack trace will be kept in the depot forever ...
>
>> other examples (both in i915 and outside) seem to also be missing the
>> delete, so I'm assuming this is the correct way to use this.
> we only have few points from where we send FAST_REQ so it shouldn't be a
> problem if traces will stay in the depot even after we remove the driver
>
>>> +#endif
>>> +    ct->fast_req[slot].fence = fence;
>>> +    ct->fast_req[slot].action = action;
>>> +}
>>> +#endif
>>> +
>>> +/*
>>> + * The CT protocol accepts a 16 bits fence. This field is fully owned
>>> by the
>>> + * driver, the GuC will just copy it to the reply message. Since we
>>> need to
>>> + * be able to distinguish between replies to REQUEST and FAST_REQUEST
>>> messages,
>>> + * we use one bit of the seqno as an indicator for that and a rolling
>>> counter
>>> + * for the remaining 15 bits.
>>> + */
>>> +#define CT_SEQNO_MASK GENMASK(14, 0)
>>> +#define CT_SEQNO_UNTRACKED BIT(15)
>>> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>>> +{
>>> +    u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>>> +
>>> +    if (!is_g2h_fence)
>>> +        seqno |= CT_SEQNO_UNTRACKED;
>>> +
>>> +    return seqno;
>>> +}
>>> +
>>>    #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header
>>> and one DW HxG header */
>>>      static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32
>>> len,
>>> @@ -715,6 +752,12 @@ static int h2g_write(struct xe_guc_ct *ct, const
>>> u32 *action, u32 len,
>>>        xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action,
>>> len * sizeof(u32));
>>>        xe_device_wmb(xe);
>>>    +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +    if (ct_fence_value & CT_SEQNO_UNTRACKED)
>>> +        fast_req_track(ct, ct_fence_value,
>>> +                   FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>>> +#endif
>>> +
>>>        /* Update local copies */
>>>        h2g->info.tail = (tail + full_len) % h2g->info.size;
>>>        h2g_reserve_space(ct, full_len);
>>> @@ -732,25 +775,6 @@ static int h2g_write(struct xe_guc_ct *ct, const
>>> u32 *action, u32 len,
>>>        return -EPIPE;
>>>    }
>>>    -/*
>>> - * The CT protocol accepts a 16 bits fence. This field is fully owned
>>> by the
>>> - * driver, the GuC will just copy it to the reply message. Since we
>>> need to
>>> - * be able to distinguish between replies to REQUEST and FAST_REQUEST
>>> messages,
>>> - * we use one bit of the seqno as an indicator for that and a rolling
>>> counter
>>> - * for the remaining 15 bits.
>>> - */
>>> -#define CT_SEQNO_MASK GENMASK(14, 0)
>>> -#define CT_SEQNO_UNTRACKED BIT(15)
>>> -static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>>> -{
>>> -    u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>>> -
>>> -    if (!is_g2h_fence)
>>> -        seqno |= CT_SEQNO_UNTRACKED;
>>> -
>>> -    return seqno;
>>> -}
>>> -
>>>    static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32
>>> *action,
>>>                    u32 len, u32 g2h_len, u32 num_g2h,
>>>                    struct g2h_fence *g2h_fence)
>>> @@ -1141,6 +1165,47 @@ static int guc_crash_process_msg(struct
>>> xe_guc_ct *ct, u32 action)
>>>        return 0;
>>>    }
>>>    +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>>> +{
>>> +    unsigned int n;
>>> +    bool found = false;
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>> +    char *buf;
>>> +#endif
>>> +
>>> +    lockdep_assert_held(&ct->lock);
>>> +
>>> +    for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
>>> +        if (ct->fast_req[n].fence != fence)
>>> +            continue;
>>> +        found = true;
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>> +        buf = kmalloc(SZ_4K, GFP_NOWAIT);
>>> +        if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf,
>>> SZ_4K, 0))
>>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>>> %#04x sent at\n%s",
>>> +                  fence, ct->fast_req[n].action, buf);
>>> +        else
>>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>>> %#04x [failed to retrieve stack]\n",
>>> +                  fence, ct->fast_req[n].action);
>>> +        kfree(buf);
>>> +#else
>>> +        xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x\n",
>>> +              fence, ct->fast_req[n].action);
>>> +#endif
>>> +        break;
>>> +    }
>>> +
>>> +    if (!found)
>>> +        xe_gt_warn(ct_to_gt(ct), "FAST_REQ G2H fence 0x%x not found!
>>> \n", fence);
>> Not convinced about this error message. the fast_req array is only 32
>> entries deep, so it wouldn't be weird for entries to be overwritten in a
>> busy system, but the read I get from this message is that something is
>> wrong with the fact that we didn't find the fence. Maybe go for
>> something like: "FAST_REQ G2H fence 0x%x action unknown". Not a blocker.
How about:
                 xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer 
wrapped?\n", fence);


>>
>>> +}
>>> +#else
>>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>>> +{
>>> +}
>>> +#endif
>> nit: for fast_req_track() you only define the function under
>> CONFIG_DRM_XE_DEBUG and then you conditionally call it based on the
>> define, while here you define it for both cases and call it
>> unconditionally. Not a blocker, it just seems weird to have different
>> approaches.
Just copying what Michal had in i915. I assumed there was a good reason 
for doing it that way.

If no-one can recall what it was, then I can add a stub for the tracking 
function and call it unconditionally.

>>
>>> +
>>>    static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>    {
>>>        struct xe_gt *gt =  ct_to_gt(ct);
>>> @@ -1169,6 +1234,9 @@ static int parse_g2h_response(struct xe_guc_ct
>>> *ct, u32 *msg, u32 len)
>>>            else
>>>                xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G
>>> fence 0x%x!\n",
>>>                      type, fence);
> hmm, to some extend, all errors are unexpected, and with this new
> tracking we can emit just single but more meaningful message:
The point of the 'unexpected response' is that FAST_REQ messages are 
supposed to be GUC_HXG_TYPE_RESPONSE_FAILURE. If the 'response' field is 
something other then that is indicative of something being even more 
badly wrong. It also means the error/hint fields are not valid.

Trying to have a single line of output in all situations means having 
really messy code with an explosion of if statements  - have stack/have 
response, have stack/no response, no stack/have response, no stack/no 
response, ... I think keeping the code simple is worth having two lines 
of output.

>
> // stack available
> 	"H2G fast request %#x failed: error %#x hint %#x sent from %s\n"
>
> // stack not available
> 	"H2G fast request %#x failed: error %#x hint %#x\n"
>
> // unknown fence
> 	"H2G fast request failed: fence %#x error %#x hint %#x\n"
>
>>> +
>>> +        fast_req_report(ct, fence);
>>> +
>>>            CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>>>              return -EPROTO;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/
>>> xe/xe_guc_ct_types.h
>>> index 8e1b9d981d61..c6b89b757a76 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>> @@ -9,6 +9,7 @@
>>>    #include <linux/interrupt.h>
>>>    #include <linux/iosys-map.h>
>>>    #include <linux/spinlock_types.h>
>>> +#include <linux/stackdepot.h>
>>>    #include <linux/wait.h>
>>>    #include <linux/xarray.h>
>>>    @@ -104,6 +105,18 @@ struct xe_dead_ct {
>>>        /** snapshot_log: copy of GuC log at point of error */
>>>        struct xe_guc_log_snapshot *snapshot_log;
>>>    };
>>> +
>>> +/** struct xe_fast_req_fence - Used to track FAST_REQ messages to
>>> match error responses */
>>> +struct xe_fast_req_fence {
> nit: name is little misleading
>
> struct xe_fast_req_info ?
> struct xe_fast_req_tracker ?
> struct xe_fast_req_record ?
Well, your one was just called 'lost_and_found'. At least 
xe_fast_req_fence is a structure that tracks fast_req messages according 
to their fence :p. And that's the point, this isn't a required thing for 
sending a fast_req message. It is entirely about tracking fast_req 
fences so we can get back to the original fast_req when given a fence in 
an error report. So the name makes sense to me. I could rename it 
xe_fast_req_fence_record or something but that just seems overly verbose.

>>> +    /** @fence: sequence number sent in H2G and return in G2H error */
>>> +    u16 fence;
> rest of the code uses "seqno"
Again, just copying your code. And this is really based on the GuC API 
which also uses fence. If you want to rename it then that would require 
renaming the ABI header define otherwise you have 'seqno = 
FIELD_GET(FENCE);' which seems much more wrong.

>
>>> +    /** @action: H2G action code */
>>> +    u16 action;
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>> +    /** @stack: call stack from when the H2G was sent */
>>> +    depot_stack_handle_t stack;
>>> +#endif
>>> +};
>> nit: should this whole struct be wrapped in CONFIG_DRM_XE_DEBUG? Not
>> sure if any code analyzer would be smart enough to mark it as unused if
>> CONFIG_DRM_XE_DEBUG is not set.
Um, it is. Or are you saying that it should not be?

That '#endif' just below matches a CONFIG_DRM_XE_DEBUG that was 
previously just wrapping the DEAD_CT structure. Now it wraps both that 
and the FAST_REQ fence structure.

John.


>>
>> Apart from the nits this looks good to me:
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Daniele
>>
>>>    #endif
>>>      /**
>>> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>        /** @dead: information for debugging dead CTs */
>>>        struct xe_dead_ct dead;
>>> +    /** @fast_req: history of FAST_REQ messages for matching with G2H
>>> error responses*/
>>> +    struct xe_fast_req_fence fast_req[SZ_32];
>>>    #endif
>>>    };
>>>    diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/
>>> xe_guc_log.h
>>> index 5b896f5fafaf..f1e2b0be90a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>> @@ -12,7 +12,7 @@
>>>    struct drm_printer;
>>>    struct xe_device;
>>>    -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>    #define CRASH_BUFFER_SIZE       SZ_1M
>>>    #define DEBUG_BUFFER_SIZE       SZ_8M
>>>    #define CAPTURE_BUFFER_SIZE     SZ_2M

