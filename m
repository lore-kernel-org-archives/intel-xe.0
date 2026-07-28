Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E7C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 05:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DC210E05D;
	Tue, 28 Jul 2026 05:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6p1FJQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8629D10E05D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 05:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785216247; x=1816752247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jVw0TY/bhlS7WCf3YqhG1wMdLqxPcNvrVbt57HVD0ZE=;
 b=W6p1FJQDXL0h6rPAgk8IKheIVLz+mQrmdAq/B0XL6yIoKC/v00U4dTrc
 ryL4x/BO9YKgx/i/hlFh2YFMHax/MrqfZ0vPHp05GkSelUUeOVeEKIxvL
 m1ZNM2bu4rVxMNmQFdIsKgE3ML67nnzwg1f87EjgQj3uuE3C3ZnYjdVos
 0shO//RRMMkjXYiFe3bfObZfqcjy0js/ciSIwOLeb8+qt5GCYj2unAOLS
 oxGUYbxjVbdsAX+LsbFGx+IASSmnw0w0YwRTJlKqYUfalobHsE5e6briS
 JCSNVHlXDP5S0N+myCDWvecD391VgVwcgl86UEbqKXs5BDFTUCmYgLF8w w==;
X-CSE-ConnectionGUID: jk8435a/TbW0BDYzpxLi3g==
X-CSE-MsgGUID: rKxPiGGHTcObupfJHZj6SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85660787"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85660787"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 22:24:07 -0700
X-CSE-ConnectionGUID: Vul0sOVoRhSIT7q0p8heaw==
X-CSE-MsgGUID: i457q9EOR4mMXxAOqGAXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="259667150"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 22:24:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:24:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 22:24:06 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5z8VcLWiNYZLpi8zIfCcv05hh0XGAv4k9VhoA/0LdIhsLRPiizPkeCSKzuv5tSADoVULb50nWOrmKijF5iIR4CzFaZsJn2HwztaZJzJm5XYID372zc/XvGd7Hz7jnHT5Q9M/F89uIG/UxO9vRRbWDuxzqYILepzTqerMIvzt83SMMyz1Zm+2K1yLlCtS/l/lE9EOnmB+SAN0glHM2jx4U4EwzxBfGWa93vYPmabwrH3Y4SuUvsU0yoBSVc0e8Iak+Qa35535hIpQfvRAgfFbhMwWR5yL5PF2DTck5K3CKlbMJ5K47WX5/NNMf/wE4HpYpvFMQiJdCGvXLZn573ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk37OjfLRUK9CorxPQR7y/Zn0dYkQJ1Y75bD07bk1ro=;
 b=Khxk33Ze229vcQxiYSYrveUJvm5Tfu//3GtslMg592mjWmsmQ1prK+QO2ZILAXbda2yLTiGJA7wEhM5pb03/6G8XN3pEvgm1RhJqhp6bHnzwZo1NCnoxyXaIqMfWesCpruTPADb1YQucfdFidT4SWogvdJbr12jFjNa9s6gS+zHnWHlbnBjRlBfoUjAg8OfaIKcm3b7R1Ehh4bp4zo+G1466TMYBgVs46rmQOmW+iK5TPvuDfhIECFbGrq7ocr9lYxiqjnQt80af3rjOA6zo+NtwhMz2AFBx6lvePOubDk4ooehuMSHVf1LtBLhgFpTwbkKRnYM01K+cOqw10XpxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:24:03 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0245.010; Tue, 28 Jul 2026
 05:24:03 +0000
Message-ID: <06e16c41-41fb-4335-b41f-fe87cdbfe9c1@intel.com>
Date: Tue, 28 Jul 2026 10:53:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] drm/xe: Introduce xe_any helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260723203754.3782-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: e450a42e-1a4a-4b4f-5707-08deec686fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WAoDaYOGMANcdO9yqqpCS6bxJMw7avNgACoP15lMZ/34rC/E+oF6CH+DN9K0TUp7pxTy8NvxScpn0J6RHXqDYhhtbR/8/qh/vIR8Xc2/ayWSexr5Z4k17+Nhd7NrMWtQULNH5MMgtpY3yx6dNUHz82zJ9uwXW9nY9vsHJs+0Rs5yyjhH3qpWSYvoTuZ2zRSMk2U5ObVS8lp85hOTtll3Jr3VxyQgYHUthdwGsQRafiwv5cz4a6KaquU6FInCenK/TxRLPO9N5NDqtkRz0F2BlMRZ4zjKhKGcxiaAKe4bg2vLjslZohgO9H6g0u9bfyJc+61HwvxoLpxzxCgA6ht1bn/honMNc5ad0/fsA0v5XjX8HaAVYRO2JHggmlUg0heTH1dq1r8vrCpDDKVhBhxwc5k2L9yRv1Gn5MaqHWJPYrIvZ8M2glmw4FHUSQ6KhTuNQbY0Wf+5vCkgxfL5spJHPPEE2C6RxLskI6HrcF1yxW57KQy4BrA7gY2PckUKMr22VZTThENzDpRvUgBhe5ggo+3uW0JTDGMlIveM/oq7UEW6U2qF2yoc+U84mZNXGHvLxsA8CbQS+shg5HN/3zOU6xhbyQjLmORKoubibh7Z1U4Gr/hn5UsLD4BhvkxqJxOXcj3cy/SPDn3FMFnnchk+wGF0XA0HvHDIPbeWESs1Juw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5nQWFobkNDL2s2eDlYY21mbzkxZ0ZVOHBvZ0E0VWtjWm96Y0JHU1ovYVkw?=
 =?utf-8?B?U1NEUzM3elJHaXpSTEFNcTliRGdYSzVzdURxOWUwdTlVcksxOXZLZWo2L1M2?=
 =?utf-8?B?WksvRW5kc0dLenUwc3NLV241WjJBVEFzRFpYbGNUbUxYbWRIalZzejdBUTVn?=
 =?utf-8?B?THlrOHlzdERmUGFIUXVQZlpnZzJuaG5pVlEvc3BmMmI1M2ZTdDM2V0pFQnYz?=
 =?utf-8?B?b091WDZsTHBsTDkvOVhvUW1hcVZzNjE2dERqbE9CdlpGOHhjMHB4enBhQ3FD?=
 =?utf-8?B?TnFJUTExRTFGcHhLcExMalcrTHpXSGNZcHBONWFoNXZDMUJ6bkg5OXA4dk5I?=
 =?utf-8?B?T0ZQQXhJMWtoK0l1MG1TUDlxNmQzb1Y5L3cvUEFzL3JmY2h5RlhYQ0wySW1Y?=
 =?utf-8?B?bVFjdjhNSlVrOEZwYnduc3kwQytlK0srcnFXZGRqNUtER2NMUmpHTWM3TE5G?=
 =?utf-8?B?MGVHWGs4NldXcFBZSlR0RG4zT05YdEJ1K0JGdjhpRS9SY0o5cHZxUWFsVzZE?=
 =?utf-8?B?YjFvRXhPbHpNcUtkclhVeHV0c3QreDVGZTlNNmpwUis2a2R5dlg4TXI4QTVz?=
 =?utf-8?B?WlJSdWxqMkhyZHh5MHVSaXZraFJHVWdlaGl1MXRqcVRkOTlZQnlRY1hlNG1Y?=
 =?utf-8?B?Z0FYOHBnMVJoMUpVNGJnYkE4ajQvQ3Y3OE81bkNDbzkwWDFza0VGVnNlYXZn?=
 =?utf-8?B?TGphNHlQSzhDUUxXWUlFTkx2UEpvYXVBU1pXUXEwS2JzcjFqUjdHY2JDOThn?=
 =?utf-8?B?Qy9SL3h0SjVMOEVCUjFMR2tUNkxyMWsvNFA1WGFtZzZTS3BXeFo3Nk9QbTU4?=
 =?utf-8?B?Um1mWTdGdUVzcURtdkYvMlZxVFhZMDVGZjlpZ3JvdVE0bUROUkJZQmFwWkdK?=
 =?utf-8?B?Z1phOXVGYjZETEpFNC9qU2tjb2dlY0Z0aE1pUlFhNk0yV2M3eHlRa2xKRmRR?=
 =?utf-8?B?TEFKZnpYcmdRb3NUSzRoQ2xTU1RPMzRvaEpHRnJwaWFhdUtGRngrY0o1YXpR?=
 =?utf-8?B?WVdxN3R3dFozOXBKWUx4b05ZQ1ZLMEV2LzFJYnNhU3M0SUZZMlp4MTZwN09s?=
 =?utf-8?B?ZEJIWEt0aklqSDZhdU4xeGppY04reUFqN0tKemIrMkpMKzVFRmh1bkpTOVV2?=
 =?utf-8?B?Qjd0UzY0V3dWWklwdUE3UENQVDRrK0pkMExYQUNxc1NjRGJxS2xWWUtZT21h?=
 =?utf-8?B?Z2dIQjk4VU43VnJVaWNFMDBVOHordWtadUpPRjZrU3JQWHZBREtnN2NCcFpJ?=
 =?utf-8?B?T01Cc2cycTUvT3JQLzAzRWN6Wi9VTmFrSzBYVEJRWEhlck5naXEybzM2RDIv?=
 =?utf-8?B?UmtpM0xFSWNhNG82KzBucS9kOVhMWjBxVmRrazNDZ0dudnFDbFRuT1ExQWRv?=
 =?utf-8?B?bTJibm14d0crMGJzZkN5alY5YTF2U0w3Z2t1UUxoMDR5VlY1MjVjbTliM2tw?=
 =?utf-8?B?WW1FVTROVDN0a2I3VWRYMm1abDc4bEQ0akhWWm5TZHNuam15bU55WVA5Rkcw?=
 =?utf-8?B?UUZpT1BHeHFjbTFpQm9lQ0FrM1czNFJ1bjJid2pWamxtSHZ3eDBhbkNyTC9I?=
 =?utf-8?B?bkVCSnBOZTRTRCt1TEdJNzVCc1hMQzhGKzc2ckE1YVpWeTh6c1pLV3l5eGRR?=
 =?utf-8?B?ZEdNVWtHVHYrMmIrQzMyT2pzVTA1RjFYaFE1ZWFlUkY3NEpsZk9vdFJEdVRi?=
 =?utf-8?B?bnJ1MXJYZUNEY2hJSEFVeUNEKzR1OFZJejhKZWpVcU5LWDR2WUdQdUgxSlJO?=
 =?utf-8?B?VkZaS0ZwY3ZwSG5laHdwNDJCcUFqZUcvZUxicXBNcWRZM3EweUVtVUZwTkFQ?=
 =?utf-8?B?Yjd1bVQxQTg0YU11bTRlaFdxRXFqMGZoSjJ2UGozcCtsU0ppUzFPRzFhOU9j?=
 =?utf-8?B?K0FGUTdkZTg1K2hVaFVqSkJnNTVpRXBEV1FUSElvekxvUnJQazJJM2ZXS3NB?=
 =?utf-8?B?bStJNmtycjNoNC9aWHlVNG5WdWl6dmpuemNKdERxTUE1MXQwTnlyK1J4L1p1?=
 =?utf-8?B?ZFArL3oxTzl5OTVFUjhCMXFheWxnV21VK1BWeTdsVlFFU252WFZBU3lMQmg5?=
 =?utf-8?B?VFl3U2VQaytqYTRROEJkRmF3bHFPMnA2bkJ5a0ZtSkJOK2NBTHVKV1o2Rlhy?=
 =?utf-8?B?QW5uNGEwZ1MwVlVjaTJNa2d4Qk8reXhqczZVRUxDaXdXMkREdENVZCtDYm4v?=
 =?utf-8?B?bDUyS3pXZzVuQTFlV0FSN2d0ekE0NWxwQ1FsZUovdkRwbGxIN09ra3R6c2lt?=
 =?utf-8?B?SDBvcXNuUW1mR3kxN21zUnFZRGwxOTFGZU13Wk5Gd1J1VW5xTkZ4ODF2WWRD?=
 =?utf-8?B?c09nS0ZLc3QvdjJHd1l3bE5yWjgrcXFWSjMxYzNkb3U1ZmE0Zm94NXJpSVVr?=
 =?utf-8?Q?pTxwJsCogtFP52ZU=3D?=
X-Exchange-RoutingPolicyChecked: fXarA3KkkX4d9ssxjQDOW5V+rf8OKSEdHH4hA6cG00KBH76yEoGn8H7+zQc9pl/AfjKFGFo7b7HWCVInCr4Q5t19J750q865Vwj4FJ6xH7ZIrewPtdeEA/11r8bgkPQqpvzF5uTAsqfFVc/UP+0gYNqldVfZu7sTquFXQwXESyCS7Pwwt5nvTIJhRuESbLgTfdBVMFMoMpStLfzyaL/6x501PvYwcjEwgyAu4q/KsYKNEKu0PMXqByCJTWXRg+lPmPsXBVOuUzypsVjhr4wGRPC4IS6UCgw0p/CmSY1jUQAE5QPfu/xnMiJ+pA/JTD/Js4kBnFvTojCxsV9RpA6LJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e450a42e-1a4a-4b4f-5707-08deec686fad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:24:03.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEWtC8jM6JbTmuWxnD6Mu/7NJrN3u/1Qli21qauQY+t54FOL6N3Nxf46km3gixYg+bUrLEOcS3YP4/7btTMK/h3Yx4dRcF4NBvyLkhPYWDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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


On 24-07-2026 02:07 am, Michal Wajdeczko wrote:
> In upcoming patches we want to define macros that will work with
> either xe_device or xe_tile or xe_gt pointers. To make them work
> and to allow compiler optimizations, introduce set of helpers
> that will return either expected pointer type or NULL. Also add
> conversion helpers to/from the struct device/pci_dev.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_any.h | 107 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_any.h
>
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..c633c6ee83b5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ANY_H_
> +#define _XE_ANY_H_
> +
> +struct pci_dev;
> +struct xe_device;
> +struct xe_gt;
> +struct xe_tile;
> +
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 type * : (any),						\
> +		 const type * : (any),						\
> +		 default : NULL)
> +
> +/**
> + * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
> + * @any: any pointer
> + *
> + * Return: the @xe_gt pointer or NULL.
> + */
> +#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
> +
> +/**
> + * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
> + * @any: any pointer
> + *
> + * Return: the @xe_tile pointer or NULL.
> + */
> +#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
> +
> +/**
> + * xe_any_if_xe() - Get the pointer only if it is &xe_device.
> + * @any: any pointer
> + *
> + * Return: the @xe_device pointer or NULL.
> + */
> +#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
> +
> +/**
> + * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
> + * @any: any pointer
> + *
> + * Return: the @pci_dev pointer or NULL.
> + */
> +#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
> +
> +/**
> + * xe_any_to_xe() - Get the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)							\
> +	_Generic((any),								\
> +		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),	\
> +		 struct xe_device * : (any),					\
> +		 struct xe_tile * : ((struct xe_tile *)(any))->xe,		\
> +		 struct xe_gt * : ((struct xe_gt *)(any))->tile->xe)
> +

When we are supporting constant as well, need add constant sibling as 
well right.

Like:

  struct xe_tile *         : ((struct xe_tile *)(any))->xe, \

const struct xe_tile *   : ((const struct xe_tile *)(any))->xe, \


Thanks,

-/Mallesh

> +/**
> + * xe_any_to_dev() - Get the &struct device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 struct device * : (any),					\
> +		 default : xe_any_to_xe(any)->drm.dev)
> +
> +/**
> + * xe_any_to_pdev() - Get the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 struct pci_dev * : (any),					\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
> +
> +/**
> + * xe_any_id() - Get the identifier of the undrlying any object pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if nor applicable/available.
> + */
> +#define xe_any_id(any)							\
> +	_Generic((any),							\
> +		 struct pci_dev * : 0,						\
> +		 struct xe_device * : 0,					\
> +		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
> +		 struct xe_gt * : ((struct xe_gt *)(any))->info.id)
> +
> +#endif
