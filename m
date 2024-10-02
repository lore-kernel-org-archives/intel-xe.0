Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD87CCF8540
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 21:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6210E77E;
	Wed,  2 Oct 2024 21:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPZXoHZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78910E77E
 for <Intel-Xe@lists.freedesktop.org>; Wed,  2 Oct 2024 21:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727904418; x=1759440418;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=906ITll2b8Qt97J6Zb3En2DMkzoJ19VKEa3gB+EaCls=;
 b=bPZXoHZlivxLvv/YD4hy90gUhWuVAixOTIx+GEwL84e6wOzUVi42XLeg
 LS2il0G/CsGi2qsmaMsfbMxWS+lRyCQ4pjtWm0utIz7eVO/HBQFCtGtdY
 /oHF68VOwvr8+QW3vmnf/H2AulTI+xImIq39ah8JPiVlBzy3DjZ/+jMYt
 mnAoCt3Khz0ngjkbI6BIyYdVajR2WTWp32UoJXGxZQlHzALWwnB5iThAW
 v4z0ES08JCNlP+vG8YRuZ+S+5Xp1Jvd3Iz+eIPQE8rJ3IH5cGPG5dW2HO
 305/UzTAAOrIkHVySYnqCpxmEaWrwMXe4Pzf7QIdGGBWUKr80ZLaJAAMs g==;
X-CSE-ConnectionGUID: 9LVDDXY1T1uqI4YC9jBHUw==
X-CSE-MsgGUID: 5stlKCQmTuKaY7TJDHXMPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37673673"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="37673673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 14:26:58 -0700
X-CSE-ConnectionGUID: ocvTyvYCQIW+Lomwv/Vc0w==
X-CSE-MsgGUID: qFBp3KhFQnWKRGb7Xj0xBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74941059"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 14:26:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 14:26:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 14:26:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 14:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUddUQzEQ7YfZvcz51s5xW3Iu/Wj3olD9RSDm8pkvZ7iNfqXdKpjmQrTuwgWSRrfvbddNFzSsUboFeWZYfY6+A1fy+DeTyN+7AGd1tD6Cjjqu0Bp1P5dZo+6BJxWkbz+6m2GxYNd+7HiB3SSPu06+mENoSPmML3tdC3tOS/SmOtwlpwE0l+6A2WW/LkgXASjaTvhd9wRlCSlptUjrfrKGnYRMwStTxMaJu3G6fe3CW0A1NrGNIYKD4AOrz/kURESyM8eEOciAEu5lLc93umVOA03JFLe3jyvfUEXqTCRM7pjF/oQidx6ZOldO66hjTk4wHWRO05YT5XLE9PNaRWgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSxlOaU/QCRtP4C3KSmuG8WO5naiRGRepYjoKPgHGmk=;
 b=q28Ebol5HIp/NTZqcF9gyMEZSJRKh4C0Ztmh4aZq3aBiJI8+KjqhubUAKC+hTX9/DLHSPtHDbAgZlpN37jXO5NhfiklzrT5CtrYTQRBJeXyHMQnW9sqLRB/kHiGs+S1uGEnvYheGklaLbK5MW6qN8dLJArdUGdtAySKsSe9Uz3gkpf4lbLWzPpJIZbVpwtljzDOwfjZy+B9Sym51KwRlVTmLWfnXQZhXgW1KUbdIYPMucxiqt1nxD4Jd9Hzps1HMNVzWgQS/72GBdBAGBCrCYXPmv5K3cstGj0frMggKvfV2TR2n+X9VJ84KGS57SpBNohUq8sjd7bCJMOrEJtsBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 21:26:47 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 21:26:47 +0000
Message-ID: <b80ce05e-bf97-4798-b4c7-3a154dc06996@intel.com>
Date: Wed, 2 Oct 2024 14:26:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/11] drm/xe/guc: Use a two stage dump for GuC logs
 and add more info
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-7-John.C.Harrison@Intel.com>
 <fa0c4e95-fe1b-4473-8a06-7b20b7809b1b@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fa0c4e95-fe1b-4473-8a06-7b20b7809b1b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:303:8e::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 58167c54-0151-4fa0-7fbb-08dce328ebc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVQN3hWenhadlBwcGxIWHBVK1ZYUGx3Q09helYzcUZ3VnBKYVVZR01nb1dm?=
 =?utf-8?B?SWd1a1NsYW1UK2RqMURZRXhzUFBwUFlEano1VzZmN04yNzFVZ1hTS2MzcXlM?=
 =?utf-8?B?a01uU2ZqaFIvZEo3V3Zvai8zdzRXWW5VdEszSjgzcGFlTEpHaStDc3l3Q2JJ?=
 =?utf-8?B?Q0ZtTTBYTk9vQ2dNbWZLK0RJdGl6RHc0S1lua2EwU1VQOVc3bkp0M1Z0WEZy?=
 =?utf-8?B?bDBlb0I5Si96ZFQ3eUhoWGFpMEsyVnJnY0Uxb2xaUldFZ29jb3M0WENoYjdI?=
 =?utf-8?B?bktJRWxwNGhZWjJCMGlDQytJMUdsZG5HNlFZT3lBZUIzK3k0aVNDdlJYTm8y?=
 =?utf-8?B?NkZGVVlYa3ZRcDNUK3FHaFgvM2xraGxMV05GZTlEcjVtYnlwTVBHS1ZiRnBC?=
 =?utf-8?B?eGJJczlJK3I4T0gxSlpzemwzdm1DVHFkeUFkV0Jic2dtOUtVNTBLeld5K1Rz?=
 =?utf-8?B?ZWYzVVprZ094VDdlVUR0RS96YUhqY0tsM1ZJUUpkUTNTRFhSV1c5MFBRYVc2?=
 =?utf-8?B?Y0FpOFlYcjVuVHc5TWRIakltYnNXei8rSHpReVRRVm1LMWptSVNhOFJIMkVH?=
 =?utf-8?B?aVpUcWRacjFreGJjL25hUURhZnlUbnRKSDJtMVUzLysrWlVVTVJJS3lISFZh?=
 =?utf-8?B?My9jR29DbG9tS3lRYUJWeTVGMk1JSzVxQXdYbVVoV2xVbFNTc1dtNnNIbjdP?=
 =?utf-8?B?bVhLOG11OEU3TUUyOVhlbDllVk5hemsyTG13UWtOb1FpNEU1VHdIa251UC9p?=
 =?utf-8?B?RWpheUdVMUt3OWYzWVJVR1BzNjM1Wm1RN0dBR3BWczJzTnNFVWVPWjBrYTdw?=
 =?utf-8?B?cW5FVnl4aUxwaDkrN3l3QWtBUHRZTDVnZko3YjlQRjd4eGU0cTFLWkFPR3Qy?=
 =?utf-8?B?M2Z0RHBhbHUwdU1jWmVCbnJRaGhsZW1DdFBPcTRNQlNPQlBTWE41K2l4MkJr?=
 =?utf-8?B?WVlGRUNRd0U3aGFIRnVVcURtTERVVURVT1lDdG81dXVnU1ArUEF6ZmpMU1Zv?=
 =?utf-8?B?dFMzb0ZSTk5BaEhQTU96SEVZeHBmR0t1ZkN0SDcwL0NVcHlZcWZXaW85aTNl?=
 =?utf-8?B?OHRlVFJ2cjRaOFArUnhvTFlFQ3VIdWdJYmw5YW1KQ1RkVVhIR1BLN0ZGSmp6?=
 =?utf-8?B?Y0RJK3FIMzhUYWtqSjNZcVg0bWVFK1p2d01wQjJ4aXhNT2Nyem51Yklsa3JW?=
 =?utf-8?B?UDBNRC9aUmx2V0I2Nmo4LzJMSDJ3U1VaOFlOSHUxaFNtTmZ2TGdSYlJpZnMw?=
 =?utf-8?B?VXVyaGx5QVJ5ZS9sekN4WWVxV0JSeVRBQm5KWG1oLzNtdXgxYzlldklsWWts?=
 =?utf-8?B?Y01lZDQxNkpnaDRGMS9GcUFLcWlFY0NjWjlqN3hsSWF4TmQ5czgyWGUvQkhi?=
 =?utf-8?B?Zkd0V3B0SzgxaHJ3QTh5UWdwWjNFUnNFdlQ3bTdDa2NIM1p4a0hUeHFYRUZE?=
 =?utf-8?B?VDY4MGVnWHV0clNiald3Y1lYRmk3WExmbWladjh0OXBpdEJENlFTbUMyNVdS?=
 =?utf-8?B?eG1ZWVBEVXEySFpmMlp6QU50SSswcjdMM01mT25HcGVmRnhnTWZ6d2pEbHZh?=
 =?utf-8?B?OWIzbUxuZnF6K3hrVUUvSGhSNjIzeHl0ZWYrMG84NUFhV0FDZEpBbytTZjh2?=
 =?utf-8?B?RDZjaENxVFQybEViUUowdVhhdmRWOFpVcisweDFyS0d4ZHlPMXdTMktnMExH?=
 =?utf-8?B?eWx0K2hGTjlZQUlXUmtSMnFGc004UHpGaXhCWU54MHhnaG0vODQxZjZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9WS2ZtQVhXWVVQbTdYLzlIMnlFYzJIUThmbE8zdnFBOGxkMlExeXV2Z3Va?=
 =?utf-8?B?T3VzSEJOODQrQTBlUXhNVk5vYzFjVFkxdlV5UkFtWEw3a1VxWktGSUxkOTJD?=
 =?utf-8?B?VitsQzI1bHg5U0tSbUd0cFFoVUQyNkVBTUlpY3ZLQVFzWG9Hem9zamhLamls?=
 =?utf-8?B?UWR5MGpSeE1ENVlwNnZxcVRRdFBMQ0czSElLUjlTQVhlK0MzVDlRMWt0bk00?=
 =?utf-8?B?U0d3V0VSYk1zTUJxY1V4TGY3V2pLS2RKRFlFaWpTYnVjN3NGc0JJSDdKYUFo?=
 =?utf-8?B?OW1GWlVuVGcrV05FUXRpT1ZSRmVoNGtRakpWeUhqdVIrS052L1VTMFBuVm8w?=
 =?utf-8?B?RUxQZ0haTnFxWU9zbm5lK2lSaE5yRkNKZTBBNy95NWlCTHlvQlFMeEVFNTZI?=
 =?utf-8?B?cFc3Q1BQV3ZlVGNBYlhZdkoydWhSWUM5UnVQNWpTbVYrUGpoWElCRzVwRFd1?=
 =?utf-8?B?MTl4U1dFZXQvWkw3Z3V0YzZJaWd1TzR0QzlPZUJidGM4L2oySFBlUVJFendU?=
 =?utf-8?B?UzZrU2FNWVNEM3B1MU5rNDdHZlE0UTVjc1ErckZ0NTZ4U2crcDhjTHNBVGE1?=
 =?utf-8?B?V2IzVEpLeWtiKzhiQ0FySlhPaUhwaXZISjRobzNZMWNkSFJjS0dZR1JlQ2Jl?=
 =?utf-8?B?ZmRVbG1abWJocUN5UjIvY0hwUnhoRVVZdVdOQmd3VEQyVjVkODNhejZqVzky?=
 =?utf-8?B?OGVoOG44M21PNjBsaDFROGs0ampJbHQySHBVSEVYNnl4NHVVcnAzU3UzRmpL?=
 =?utf-8?B?azl4YVUwQUxReGRYWHZISnZiODlPamlNSXd1TXZyTnI4ODBGMS8rT2F0ZHdy?=
 =?utf-8?B?elM5dWIzRWJjc0tuenlObEtWOTZxREprQS9WVkZ2cWdQa1Zod2o0SEg5eU9M?=
 =?utf-8?B?Wkl4ay9Ja2RnTHFZWDk1ci81S1ZQL0N3dExpL1F4d0FNNmcrVDlBVFZuYS9H?=
 =?utf-8?B?eEJhTWhFeVNvdXdabmFOSUVuNDkzMHJ5YUtMTVlvaGhhQ25sdUhtQThERytQ?=
 =?utf-8?B?Qmk1bkoyc0FhVjJRRm9NZHRFK3kzTUlWSkpBa3l1blRVSHhVbVY5ZzBXKyti?=
 =?utf-8?B?YXlLT056KzNZRUwraWJybUkwRUtLb01WUWRpK0tLMElqOFZhaDlhR0h3TW1Y?=
 =?utf-8?B?SDZpeGlEQ0tzZFN4M2g2V1BxN1hwSHJCYks3aVpPRlBGVXlORGJkL0o3bG9k?=
 =?utf-8?B?d3dhRmZlbDlsN3ZWT01HSnVqbnlnZGV4TWJZK2NSZXF5ZUdCb096ZXBkYmNY?=
 =?utf-8?B?enRKbENBY0hJRjJnRHhxa05mMGsrU1VSbkpWSG9GZ2o2b3o1SHZMbzZlRThY?=
 =?utf-8?B?eUcvK0ZmRE9LdndiaXpvMWllYmVadVVTc0dtSlk3dTFDWSt0Yy9xZEJWK2s3?=
 =?utf-8?B?YzMxWlhWYU85aERmMGpSTGlSOXAwU0liWG1QbzJURVA1bzN5eGVZOEg1QTdp?=
 =?utf-8?B?RTZLenFZQUIxbWxQend3emVPbFhQSUpmWkVOeXFGdUZFQlRzNUxYSmZSK0Va?=
 =?utf-8?B?SEdGK2lzaTdhY2ZSVXhYU0xidEQ1bVFRVzdrN2JxcDdkWlFWZTU2ZE5ubStx?=
 =?utf-8?B?WUYyOXBQQlNqZStBZ3FpSlpYbEJ3SkJ5OGlCaElpNW8xWDVWSnY3NXV1eGo2?=
 =?utf-8?B?MldKdG9IY3lMK0lmdTgyVy84Y2JXQUhML1dGVEFkaGh2S3Y2b05TejZod2FT?=
 =?utf-8?B?UC9WS25EZzZBTHBjbi9NL21kRVlsZ0NzMWVTejVTSFRwc0gyOWdDQW9ueGY5?=
 =?utf-8?B?TTBiK25GWnM0eDJnMm1LbjZXLzcxaWoxMmZzbGFRdFd5UjZqU3ljTFhBM3lN?=
 =?utf-8?B?bjMzZ1NTQThqY3F2cWc0bzJTVVdhWXNHUlBRRHcwa2w0dzA3bkkzR2QzYnRu?=
 =?utf-8?B?dS9FZDl3N2tnYmp2Y0ZYOEJhbUxnNXVBTEFBR204MDgxdGx6WWlNK0dmNDVh?=
 =?utf-8?B?YlRXayszWEdtOG9ZZVFvUG9PNFpZZGhRYWNucGg2dlZ0NjBFYkR6dDlRVTJq?=
 =?utf-8?B?VENFWlpSV08zTjBlTlVvTDlnMkhjVnZ1dGNiWE1BZjBWWWg4RGx3dHM1YXhr?=
 =?utf-8?B?Qmo4U05DNzBreVN3TkRJdkM3WG1qUHdSU2lPYzhBaFp4NVpEWDNtcnZROFNx?=
 =?utf-8?B?aGRYS0RvTHVqZ2RNV1VCQjdWczN1NnljOG93dHlia1pZd3ZibXBhcHg5Y0p1?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58167c54-0151-4fa0-7fbb-08dce328ebc4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 21:26:47.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obvXMqVUgjAbgi6/WaXKvUYeZosYGkVsdZ/0x7K6qyFWHK2qWIxz6dXb11sfjZJRLfvi5gxSF1EsVT9uFvwrhVcr0zMi2vHKspzPUzI21H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

On 10/2/2024 13:53, Julia Filipchuk wrote:
> On 9/19/2024 8:21 PM, John.C.Harrison@Intel.com wrote:
>> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
> This register seems to be the lower-32 bits of a pair. Does it make
> sense to read the full 64-bit counter for the log?
Hmm. Probably. Eventually.

The problem is that the GuC log only has 32bit timestamps. The extra 
four bits might be available but they are not used (in most 
circumstances) within the GuC firmware. And the whole point of printing 
this out is to allow correlation between the GuC log entries and dmesg 
entries. So printing a larger value than is used in the log is not 
currently useful.

And note that it is still not a 64bit counter. There might be 64bits of 
register space but the counter is only 36 bits total. So it still wraps 
in under an hour.

John.

>
>
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err) {
>> +		snapshot->stamp = ~0;
>> +	} else {
>> +		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
>> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +	}

