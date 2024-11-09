Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F44D64099
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 02:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D539F10E326;
	Sat,  9 Nov 2024 02:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuW1drrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3DB10E326
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 02:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731118205; x=1762654205;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2T/jIOGVeHWOgqqfR61vtjyggZPjobjlzqCc64TEs7c=;
 b=CuW1drrzIpq6eKUrd2xenTOGJDcUCX/+j2HJDqcLDStorS/B9nujrDWD
 rCt0GwA0LYQzEeYURVxFGNu1gAs83Cf/w4kIDBEK1PbbtDHSDk5mQWXp4
 lZ0yrmk+BswAXhUnLDYtn+t28hNiFoNOfnMR4U7sCsqs9XXJU1kbfFKFS
 S8+3PpDu9jt6hUsUX4c97osArqGEtWZNfcpespLcJkZhgyFh1tsRQuEks
 gFA/rKrROBc8T8GgM8AGqlblQJ41UOTLD4LfHn5fXsgcvJW24oMAev7HD
 YavqyFxXOJ/cwktIOjhMlqgyK1cVDrD/g60fcAxJe2MKH+snWhucfa0jV w==;
X-CSE-ConnectionGUID: 63bLq8fWSvW7uQHwd1+zBg==
X-CSE-MsgGUID: BFW+uam1TIa/gkepZeaVYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34951251"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34951251"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 18:10:05 -0800
X-CSE-ConnectionGUID: bRoQzV2XS+uwRgu27UYNKA==
X-CSE-MsgGUID: D4PUzyITT4GBoGtq5uI/jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85476689"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 18:10:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 18:10:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 18:10:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 18:10:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSW7NwzAJk0B7NofVAli3jFANsNRFbstel4BrIXYnlpPYtM4LN5IYx12BCMF3Pkt2XzUWs7osCgOvnam/7yB4Mc2MYsGLONRedHykER8L2dNB+Yymy+DD+FtGuPPEZ/R1l2aw3g7NXByaCRQElD7YA2x9Eg/tx4nZ6l9DOC+hJq9HLlYQlHmU22tNDH7h6n4RryfeiYu62yvyvarFHEo2oh+LZUGrZdeq5iHhDLQy3nb9L5RtT0xAmBamiu3xdGdl35nTPL1jB251OTm0ci1pMY01jsb6GBkmRR6JaQlJj+DGqXxuVqxNn/7fRR3/7BNNBIi5mZnWu30eiI5ub2xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdUJn+HxySVJWZrKCsMFnj/b1myxhr1xhqq7G2w6O0Y=;
 b=togjOjfWLCpEqCBHMXIh3sgphV/lSUZNPtGGJDWDVPrcjk56pTFgQgmhj0SGwIoWiIQIxmsjtH8AYYvcJT39s8P2hBo2ygTB7fLyKzfX24NjOPgeIMHlpRT6gsXU6oOXstUgXdvDStnnGnZD+mLDsGPv7UfcawOiEQ8xGCgjR2i14OAAXxj2SrLSc15q8Bq4ltDurCNtdKvslHhdlZ5lH/WSX3Xqww+ps/NW2kUd5dap3PxTj217VUmrO36Hb0M5cN1SSNyPZNQ7rfgPg40SpCUTylOrfsaU4pU65NE2XnMCLQdXIz2iJMqdwuP1O0GMw04s1814VI85b9xGm9v8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Sat, 9 Nov
 2024 02:10:00 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8137.019; Sat, 9 Nov 2024
 02:10:00 +0000
Message-ID: <7a2641b8-2cc4-4f1c-bcb0-b82d8a7df125@intel.com>
Date: Fri, 8 Nov 2024 18:09:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
From: John Harrison <john.c.harrison@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-3-John.C.Harrison@Intel.com>
 <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
 <22a9423e-53b0-4541-91eb-f743f0cd3de1@intel.com>
 <Zy6lKMVs/G0ZRbBK@lstrano-desk.jf.intel.com>
 <90f215aa-5d52-46d0-9f85-0cefc580c707@intel.com>
Content-Language: en-GB
In-Reply-To: <90f215aa-5d52-46d0-9f85-0cefc580c707@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:303:8c::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 419669e5-d913-4999-9ff8-08dd00639d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWVkRE5JSjhTMkJXL3A0S2ZiZTViZnVGS0hRSDVSRFJTaERaUE5qOW0zT0Zp?=
 =?utf-8?B?VnpsYWtHYkg5ZWM1bmQ3RHpEcHhGT3lwUkdIOEdsTzV5c3lCUWdzSk04SnlI?=
 =?utf-8?B?VlFCK2tvNmIvWmM5azk2VFdKYURHN3VvZnlnbzl6b2VocGxOc0V6MW1KRU5t?=
 =?utf-8?B?cW9HNzNBRHFnS1hxczIrNG83bW80aGczQUVuK2NUYkJ1d3o2T1pZdFVRM0Jk?=
 =?utf-8?B?d1pKOElYMU5WbHhUTmcxL0V4VWk4bkZYNkN2M3pwRXpPa3VhemNyRkMvby9S?=
 =?utf-8?B?eUVSbkdhZWZKVUN2elpETnQxMG5JTHd4RnZZV3VMQTFUSTQxTzFSd0FCUU95?=
 =?utf-8?B?OTlLK1ozNDROS0MyZ3pjSW5oSW5rWWp2bTJCQXU5TUc3MlFkZWY0ZXlMR1oy?=
 =?utf-8?B?cjBjSU9BakNBQkJCUmczYll1cGliWHg4SmRORkJ5SEdCNU5xVS9wWFFCMEx0?=
 =?utf-8?B?cVlSWjJUT1FkdHhnZXE0SUpUUGw0VjhXUWZSSXF5QzBkWmJvUXhmc25CTW5k?=
 =?utf-8?B?ejlGZ21heGxFNDMwbUg1Vy9GNEdVSGFkV3JlbnpoUGJ2Smc2TXRSZVliRnJS?=
 =?utf-8?B?a0dVSEZCUTkyL29oYm5iQ25PRENpeUErSUpDY2Rua0s4MkFDN3VYNG1TdmNR?=
 =?utf-8?B?b3dneGo3UmErS01BKy8raXg5emdsTzArc3k4bWltU2tLZStXL1UvN05KenpP?=
 =?utf-8?B?bWt0WVdEKy82OWsxVE0wYnl5YlBDcXdhT21weUZiVlVqZVJYRVkzM0VTbng5?=
 =?utf-8?B?RzdTd2VyODFmamlrZlJ3QjhjZkNaYU9ZUDEwdzI1TnVuN1crVTJQRjBRbGly?=
 =?utf-8?B?aWR0eWpraVN0SVd1TlRZcng1RHRtVm54NzFvODFhR1dhMy8ydjRoZ25NWFNv?=
 =?utf-8?B?aFFWSkFEVno4OENiVXN3WXAzQ3hkMGNoR3lKQ21rMFJWcHgwQ2lWT1lmVkF3?=
 =?utf-8?B?aVlrVzduM1pDYi9pRHVqQzRBR243RU5RaitsejNxRHR5U1NjVmc5ak1sajI2?=
 =?utf-8?B?dDhuTnBJcFFKVis1MStpdHc5K29pS2pqN1JZbEg1TEZuNGhWTWMyZ2ZxUkV3?=
 =?utf-8?B?YUg0aC9PaHh2QndPTEFGTm1ZbWVtNGx6Y0tOZHIvd2g2dHMrY1o4VUFHaE5P?=
 =?utf-8?B?VUhMVVNGczZ2M1FvMnk5M3RXYWV6OFVNTmdVVmRKV3gyU2xOTzVMT0VKWThJ?=
 =?utf-8?B?OW93VlF6WTFGQVFYNEpQYk9NUC90THlObHJ5bHVhek4xb1JORTF6T083LzNC?=
 =?utf-8?B?MzJCMmlXMGZMWCs0ZGZ4U2grY05nSHpITUI4TFZESWVsV2lZSkNwekt3NlRz?=
 =?utf-8?B?RWpNV0ttMCtZRVk2allmRUFNemVVRU5RRHhsV3hId2VMTERmTENHNmI5QTd4?=
 =?utf-8?B?by9telllZ0xuUnkray95ZHpFM0ZIL2ErQTMvZFJLWWNoMXF0czNmdHNKY2tG?=
 =?utf-8?B?RUo5aW1MaENqVVA1VUNUYU0rcE9SUGRtOC9CS1hqSXBNakxUSmZNb0xmRWZG?=
 =?utf-8?B?aldSSXN0cEh4VGRhYkpwT0lHNVNtbm1oakJaMHZvSmhJQ1Y1Y1BxSEZaWG5E?=
 =?utf-8?B?UFdEN3ppczB1SGxlWnoyYW9wdTRFeUZGaDJTMnhrRmVHOTFuZmNJZVQ3cEFQ?=
 =?utf-8?B?MHZ3ZWdLWFB1WEJEUCtScUJySlRqd1RwcVZFVDFXRzl4SWZJZWZGZUtmdDZu?=
 =?utf-8?B?SlpVYkdGSG1IU1R1cGg3d0pTbFV6Ky9zLy9xSCtBaGtUOE5TdTJ2Qkl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEhaV0UwQlFQRi9wTysxSUlIMEordzJrRTZTYmRKLzBJWTEyditrYmZuTWw1?=
 =?utf-8?B?dkt3Ym1zT2xFMHVNQnhKdEdDdDFGeHRaZW11NEVFZ1BNRlhIM3Z2em5KUUs4?=
 =?utf-8?B?eVdoako5am5STUJycXdxVERZc2xWTUVvdzRPOWY5akd6U2hTVXUvVjdUOFZV?=
 =?utf-8?B?V2tUYnBxNVI1dVFPYXhKbGhSbzhTL1loQkw2YSsrb0ZQTU9RVXhSd25VS2tT?=
 =?utf-8?B?MDBzOVVLcVZYQi9HVjdrSzViYkw4dUszbGl0ckgxMVdpYzY2N1F6ZHFuMmFa?=
 =?utf-8?B?Zkp4czJLNVQ0MVRpSFUrV2hFdlpDdU5CdnZBYzRqNkZlT0txSDVNb2U2TVdt?=
 =?utf-8?B?dWJ1aWxyUWZhczhsZS9tMFVOWEQ3MFVHTE44Y0NDTHZXVllPSWQ4cG9mcmxo?=
 =?utf-8?B?SmdiZHJMeGViWGFYd1FCbVh6azV3aDRUSXRtd2x6R2NEeXZqeFllRGJXUkg1?=
 =?utf-8?B?YTJpdU4rZmtYWGIvOUJWUHRRaEVWVW1PZCtzaHliMUVoejZmaHVacUI2UHJm?=
 =?utf-8?B?R1hxZEtPTHRlMmxCakVxU0l5NVdtbUhML3hvOFdYZFEvY0I5aHRhZFRkSTUw?=
 =?utf-8?B?MmZpbzFWcHc0RHlGM1V1S2l1QWhIanJ3RFR2WUplUXovSEg2TUpYUWZEbzJS?=
 =?utf-8?B?MG5MdytOclJwRXArbzZPWWhXK2NJMktlSnR2MGNHb1NlR0ZkbzN5a3RkZ3I0?=
 =?utf-8?B?WkNDcEhRQmVRZHhSazRlRlkrTTR2azJPNWJvU29RT3JkZmtobjkyeWQ1UGcx?=
 =?utf-8?B?SjYyeXF5M29BYTZ4WlpSQk0zeTZ2Z1BKY0dURCtsblFnekRqRDNRTEx0UGEw?=
 =?utf-8?B?OWRPUytFQ3EwSUJXUkh4Ukg1ZjFKN05aTFJ6MExGMzAzQWNBdnVZVCs4VXdU?=
 =?utf-8?B?NXJnVlRXQitHQnRoUVp0K2tYQnRKWkJFUE5ua0xOdkd2Q2tYUm5VTXZPeWZv?=
 =?utf-8?B?R3RmN0NWbGRJU3FNZDdTVzY4ejF3VTU4bGtYWTlnb2FDRzJrNVFnVzVGSTQ2?=
 =?utf-8?B?S1hsRHMyNWE4U0ZnSVdJSnZGQjVMWEtBVXFSb2tSNWJwWGU4TElET0xRTkdt?=
 =?utf-8?B?dUlnbm91R3c4b0ZKL3FxR0t4dXZ1SGlvWmZka2M3WTA3eWhyU2cxTkNoSy9v?=
 =?utf-8?B?SFpQMDRQcW1tbkNEY1NORjdvem5JNEYxeXBXalo2SzY0cjI0Mi9SMnpablJz?=
 =?utf-8?B?UjB0YVJYamVOUi9qdHFIS0sxZTNIR08zMUt2TEVROCtVRWhaY3RKSWFXMTk1?=
 =?utf-8?B?bGEyYkZFY3MvUGJwNWxGNm01UlpXMFVMMitYWEE3OSt2bml3dkRHNis0Ykdv?=
 =?utf-8?B?OCtHQnczWmtaSE9xUFo5RjlmaElSUG4vUEhLOWtHKzJWL3hMTk5NNjFGQlVy?=
 =?utf-8?B?V2VhNTYvakJBbzRyNldjcXVBMUFMQnZKRzJMSEMvd05HUERZR2ptYXpzK1F3?=
 =?utf-8?B?allFSzFiRlY5aXhScjZDVzJ5d2hiTVlkeUN2akozd1U4MGVTMFlwZEM5YkQr?=
 =?utf-8?B?YTQvTDhiUW1INmtZVXlpbXN4SC9tdWNYVGVTL0REOE5DYkE3RytWSDdoRUFD?=
 =?utf-8?B?aGJQNlVsQytDR0ZhZ2kzb0RCcS9IY1lOZGl5bjIvYUZEaytHdFRSazBiTEVV?=
 =?utf-8?B?VjhlOWhrbEt5aUMzS2JrMzF1V0t6RkF1UTBMWm9JL2NseGFVOXU1VEREL2Z6?=
 =?utf-8?B?dy9tOG5OL3NwLzZHdGVxUHIvcENnVWFFZFprdjM2aFB0RXBJS3lDUyt5bTF2?=
 =?utf-8?B?a2l2MzZYL084YzFMNmFUTG0xK29oTkMwTEs3d2dQTC9SRkRhalNlaTB4ZCts?=
 =?utf-8?B?NTFWemtqd0JLdUN2NnFUeDFmYU9DS29oSXJ5T3dtZzQwRkZZZ3J4WjZFVTFJ?=
 =?utf-8?B?S3BWbHhKT2VPYW1FQ21mbFZtVzQwakFHcHIva21IaFVvdWs1M3JsM2NRZElY?=
 =?utf-8?B?ekxScHhLWi9QRGx5RUNmMHU2VjRYbUdxd1VqalVhbDh0Q0E0cmxDVUhGdWo1?=
 =?utf-8?B?bFYzMk5kWndzQTZlMnBxSzB5WTBIMlY0YVBRSFg1R3lwdTJjMHphbTQ3MHN4?=
 =?utf-8?B?dkV4RVB2WEMyK1Rxanl2b3EwOWhEd05ua1RqRm5JbmY3SldBMTNXUitGK1Nn?=
 =?utf-8?B?Q1RDQ3RuY040WVdFclF6UDkzRnhYWFE4dnFSM3dVamZWU3RGUDFmcFhDQmxa?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 419669e5-d913-4999-9ff8-08dd00639d7e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 02:10:00.2761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S5bg02bKrJSaqYr23bFpjorVAQygfGjrLsabb+thTWzQzn+thzQ+LuM3Ve81bawr94QGHEaeD7sBVJ0ARTlyMYoh9f+/SWb8s4w22WN2+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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

On 11/8/2024 16:39, John Harrison wrote:
> On 11/8/2024 15:56, Matthew Brost wrote:
>> On Fri, Nov 08, 2024 at 03:51:12PM -0800, John Harrison wrote:
>>> On 11/8/2024 15:35, Matthew Brost wrote:
>>>> On Fri, Nov 08, 2024 at 01:27:37PM -0800, John.C.Harrison@Intel.com 
>>>> wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> Add support for the two crash dump notifications from GuC. Either one
>>>>> means GuC is toast, so just capture state trigger a reset.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
>>>>>    1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> index 63bd91963eb1..7eb175a0b874 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> @@ -54,6 +54,7 @@ enum {
>>>>>        CT_DEAD_PARSE_G2H_UNKNOWN,        /* 0x1000 */
>>>>>        CT_DEAD_PARSE_G2H_ORIGIN,        /* 0x2000 */
>>>>>        CT_DEAD_PARSE_G2H_TYPE,            /* 0x4000 */
>>>>> +    CT_DEAD_CRASH,                /* 0x8000 */
>>>>>    };
>>>>>    static void ct_dead_worker_func(struct work_struct *w);
>>>>> @@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct 
>>>>> *ct, u32 *msg, u32 len)
>>>>>        return 0;
>>>>>    }
>>>>> +static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>>>> +{
>>>>> +    struct xe_gt *gt = ct_to_gt(ct);
>>>>> +
>>>>> +    if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>>>>> +        xe_gt_err(gt, "GuC Crash dump notification\n");
>>>>> +    else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>>>>> +        xe_gt_err(gt, "GuC Exception notification\n");
>>>>> +    else
>>>>> +        xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", 
>>>>> action);
>>>>> +
>>>>> +    CT_DEAD(ct, NULL, CRASH);
>>>>> +
>>>>> +    kick_reset(ct);
>>>> Side note, we may want to wire a devcoredump to a GT reset too.
>>> I have a work-in-progress series to allow creating a devcoredump 
>>> without a
>>> scheduler job. I assume that would be a re-requisite to creating one 
>>> from an
>>> arbitrary GT reset. Certainly coming in from an async event such as 
>>> this,
>>> there is no scheduler job to use. Hoping to post that soon. Should 
>>> be easy
>>> enough to connect it to the GT reset then.
>>>
>> We appear to be stepping on each other feet, just posted this one...
>>
>> https://patchwork.freedesktop.org/series/141110/
> I did see that. Haven't had a chance to look in detail yet. But I 
> don't think it really affects the changes I'm doing. Either sched_job 
> or exec_queue doesn't make a difference, we don't have access to 
> either outside of the submission path. My other changes are more about 
> splitting the print code up a bit to allow dump via the dmesg helper 
> (for internal developer use) as well as via sysfs. The bits I'm 
> missing at the moment is how to get to engine state without having a 
> job/queue to start from. I was also wanting to allow capture of 
> multiple GTs in a single dump. I'll see if I can quickly clean up what 
> I've got so far and post it so you can take a look.
>
Posted: https://patchwork.freedesktop.org/series/141122/

> John.
>
>>
>> I had to code these locally while working on something else so threw
>> them on the list.
>>
>> Let me know if I missed anything there or if you want me to hold up
>> merging as I was planning on merging once CI is clean.
>>
>> Also agree it is a small rework (don't assume we have a queue) on top of
>> this to connect this to a GT reset.
>>
>> Matt
>>
>>> John.
>>>
>>>> Anyways this patch LGTM. With that:
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, 
>>>>> u32 len)
>>>>>    {
>>>>>        struct xe_gt *gt =  ct_to_gt(ct);
>>>>> @@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct 
>>>>> *ct, u32 *msg, u32 len)
>>>>>        case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
>>>>>            ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, 
>>>>> hxg_len);
>>>>>            break;
>>>>> +    case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
>>>>> +    case XE_GUC_ACTION_NOTIFY_EXCEPTION:
>>>>> +        ret = guc_crash_process_msg(ct, action);
>>>>> +        break;
>>>>>        default:
>>>>>            xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>>>>        }
>>>>> -- 
>>>>> 2.47.0
>>>>>
>

