Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93985CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBDC10E3B3;
	Mon, 25 May 2026 16:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGYhUxQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E46A10E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779726399; x=1811262399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Z4mVFhtPHevr9owmV26EVWGgYtpL/LVZweh+41OH/g=;
 b=JGYhUxQ/JCnjQ3CaWHj4VsofOdXyIx+CCNUey3bntNfCdVSut6FA42Lg
 kxgFfdGepAtvmNs5VsxFjkpZOvtgZ+SzGdrCprzEn3yOrOKQswc7Uun3w
 isOPoVoBzL1Zv+J6eWMfbEghOIErEtwKxvOc/ueOv+EUOq9l5yVvhHgJx
 NFAGfZc4RP3TrS72adNjffF+G8lJcpUcDAkPYV/VLKDJ/qraqA1SpIqyU
 jmjdXvzKwwENPEWq2ymNcH3fdnZLjrloohQa5D+kddCC2uXJ2OMS0jVwL
 Z0vd36dd1wk43o5MkiRWrnSLhV1eJ0tjKseOU32XB6TRal6EQ6Gqccdap w==;
X-CSE-ConnectionGUID: ByhOJiS6RWu11A/P/R/y5A==
X-CSE-MsgGUID: mB+UEsRMTHqcB83pj5BpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80532018"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80532018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:26:39 -0700
X-CSE-ConnectionGUID: x1uHiXtZQeSPDAqZH7ExLA==
X-CSE-MsgGUID: NvXBNm/hTo6IuUQ+vHJTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="279756777"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:26:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 09:26:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 09:26:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 09:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alADIrD9wIIYMnntcsXWuXKRPpwQmcHiBlatiMX/W26WukgKmVIuGBiBPYixz2yz0YVN/H8WxfnKbwraSSQHLkIESlRVnNSSjxcj+/6LO+G7G58hHEfU4T7pzW7Wx/Zl+gQUNsH9b8Q6VP5pj2AXr1Qt4hDGSnpG/p18kaBSI5YfjbdL7WDrUHnIk25DU0KyzkuZCgk/UyebVtviYgv/vKoc2+/GFcV72BubG6j+NjueW/1YhWIrxlqHoabilJ0ZYJr+8nVk95bulJuj6AB6PcpaKozqlla0ZXHoY8dp/rhysY3yQAS4rcaGBiq8oJg7oCNqFqiDzUTx+fzHWcZKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQEmnIftTaPwzIA6YuL2jahN6MqugNbkZ5tBmnKJCmg=;
 b=eF2VeXmnCbGMAsM+IiLXzG69D89NUz/460a8gDidev6bQx7Ax9XjS1TotpU0ZucdA041XOJ2uRIhcoq8hBvvK0ZFQYzfR8aM9lg2/KV+hx/8Ls/ZuH1E6/xxaikHJO4XctB1hmqvHFuYl2rWAs//4Nx6gBI8JSjCEtmvIqHpb9p86BWLMSybRhlDdGEobQRUc5tninDqVRpZAkDr3qvJKdBxZdzMJIZnU0WcEuJBUzy7JIvl53WojQMoxon8daH2LXpdbWKd1n5Iy0Kv9dekORAFhF7ANuoCyCvBojFeo/rkf1G9v4O1GUmsg3fPT60nInJCriPOw63LlYgas7dluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 16:26:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 16:26:34 +0000
Message-ID: <6e354e53-4428-4e24-b774-b51681f078d7@intel.com>
Date: Mon, 25 May 2026 18:26:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-19-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260525100619.3155663-19-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0243.eurprd07.prod.outlook.com
 (2603:10a6:802:58::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f496bb4-62aa-4645-72a1-08deba7a6337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: kYZzXI4DbZOB+V50ZfQbyR92OJYydD4D3bSjTdgaQSC+WaURwIiBPFE8qujPmcrou9vhYOixHm4C9VZGeTAIpczvHM6AxjUDTeM3XtTFIkQDwhUgLHLOuMgBBiXcMZ8Obw2UEzbsp904VPEs+3K8t172L3MAqGjbPj6QqO7kNPDPvjaFJHOq1NHJVuyyVzKEDszVAlUh403ZOpChAxQw1BwtTtu7JLxTQW5lfW7QRdBIQqpnQXqR09yIdOwxP0pIY0MaX+2HhKzvR6hWb1jJ9NRQfwiSfLg9BHBrmUkqD9X7CJd8v89te8pFVXD8JHF1fro5D58oAOWVst0kwXBj6k6sEn1dDgMG88DL92jDaccoOap4IaeOkFBex9/+nq9jUkD4KwHIz8c0MXY6z9ovmTpITAuJZhJ9+p9p79QQj4jnfjMVfFGglatC9iBjZCxxzF38N3KVMNNiH5v4GdVeihQSD96U5AaNPOAC3/SPpBcDxDigYUBAlBrB47kIVjHyY/ahW/mf/fQ+qa5721ncXEsL23PZ40dbYRkinUC29Wrlt9UEUuy02S0H9+BoCm+zOCM1q2OURweTcFGLtoGBG41oeH/GEgUpkALhfhEti9WdHCyrY5rUHu1GnmswWAvfPq+p2dv56m9rOGoYpQWN72SRSUXw+ZTnUDZKhtdsF3mLuQx5AKu6NWmukVa6SyIO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhKd01OR2N5b3hVZEs0dUQyTk1WdFlKbHUrQ1M2SUE3UnRqVDVPSURXZE5P?=
 =?utf-8?B?ZlJWNFRVK3dLbzVIMnZ5ZHkwbXlTaUxLVXhhdzFjTFM1dm5xWWNDeWpSeDJj?=
 =?utf-8?B?UmoyVzZKajJ1cDE3YWpsWjlwUXhocDF1QnJ1Qnh0OG1MOVRIcExEdHM3Q2N1?=
 =?utf-8?B?aDdUWXRiNzc0VS9CZEZGM2VudHlkdlVnbWhndDNUdTI3aXAzWGx6Z3F4elBn?=
 =?utf-8?B?SnlsUktLeTBsWTFKMHhqREFEVWIyZHYyQVJEQlRtSUN6M0ZkLzlNSkUrWXlK?=
 =?utf-8?B?RXhvNXZTQmx2Myt2bDM5dkxKcjVTS2lrMUp3SEs2V2VQV1NKSEFBd1E2NllW?=
 =?utf-8?B?aWFqT0h3aVRycGZaSjBjZHhVdndWVExGdEo4SkxJbTdpVWZiNENSemFUc3BB?=
 =?utf-8?B?UW5QcTJ4by9TTi9HcGRaUk82TUV4aWg1cks4dlB3RVNFSnJxRFFtb3JZYjJn?=
 =?utf-8?B?NmlIM3BvTERKR1hwUUtKUE9WVnJGazc0QjFDWis2RENpWG40ZzBoR3Rlelpm?=
 =?utf-8?B?MjFhOWMzQzlJZHpvMXU5SXU4NkVaVWtna2Y0bzdIRi90SU1nOVlBbTRiL1cx?=
 =?utf-8?B?SVFWaGdEZ2J6bmJYQkc2d3dqSFFrdG1VQkVmMWZFRURDS3J0RXBydk0xcTJ2?=
 =?utf-8?B?am1ZMWx3aUNSNm0rU2pnUStCNFZocVovY0JXbjVwN1F0VTRsTy9rSGp2cmpx?=
 =?utf-8?B?YmxWZlJRYUZhQkl4bTBzNGlhUkZPMUlwbitEWmNEZHV3NmNlUkdYT1E0Z3Aw?=
 =?utf-8?B?Qk5rNHRFYldhZGFzSm14SW5KdDNWVjMxbmNjb3pDN1VHblJhNnVjNDVyZFZh?=
 =?utf-8?B?OUZiencrRzlPaDlVcWpjbUY0dkpjTTh6bHJsSVNhZXBzU3Q3OG5NQ1FXdFZR?=
 =?utf-8?B?SlNZbXFEVU9CcHVwTlpESGJtY2h4RWl5RUNWeVZEYXJCeXIzTVZzdGhaRHUy?=
 =?utf-8?B?ekpTSEJYNmlnd3JKUUFIZlF0N1VxSEdHZFNJYlZVNXFzZ0MxK2lEZlFYT04w?=
 =?utf-8?B?cVNXTXZMYjhkR3o4ZmZNWGVMUmpUbzZZLy9RZU41WWs5MTc5VHlhYXVQSW5r?=
 =?utf-8?B?VU45Y3psZUZEbEhTK3UwZ2d2ZXRTbHdsQkx0STJEWUM2SkQ4U09BNHVIb04v?=
 =?utf-8?B?R1lPS1pOS3N4OTNTaXU5T3Jlc1hDZzNOMWhVQXd1WTFiMWxzSi9JMUptVjlI?=
 =?utf-8?B?MzJlMFkwQ1hTZkRDaG1UWFY1WmFrY1hlazJoaUpLLzlMWHJXd2VaM3hkOTcz?=
 =?utf-8?B?bUJvVzNzQXRBQjBMdXdvOGl2aGtYaFlQa0RFVXlJYXFJL3JINHlIMTljdHVF?=
 =?utf-8?B?ejd3dmUvOGxhT2t3NjRnQUZFVVhFdnMzajhTNHlVeGU1Q1dDNnJUWGpwVkNG?=
 =?utf-8?B?VG1kbHBxb0RRT2pCN1pDTFB4VE40UHRqOU0yUnR0QjVFL2NSaTVvUEt3S0NG?=
 =?utf-8?B?OXlWV05kYUE2RkMzODdabGZKVEluQjhWSThZZ21KSW9yb0svQlB6UzhMYXVX?=
 =?utf-8?B?NGpSVnNwZDYxU09GVGsyS1djaDZJU2FGU2ppRU5jWWxrVzl0NFNJSGRvSnYw?=
 =?utf-8?B?a3p3VEdObHZidUVmaWtqVFFjKzlDVkJvdVgrUFB0MmVoZ1BuQk82Z05CNUw4?=
 =?utf-8?B?YUZFV0hFOTZLSGg3RnJHcXlHMFB2dGZYa1dHdWxXaW5EM05ZYjJoU2dlRUdT?=
 =?utf-8?B?Z2llc2dVQUxad3lQRWsrS2htTTc5dmpiSXN6SzRWUGcxSjArOHgwOGN5MHdm?=
 =?utf-8?B?alFQdTZZYnpMSXhURC80L3BhMjBHbVdrM1BoMTNZSlM1d0NUZXF5QVdsdGR5?=
 =?utf-8?B?S05jRjJyZG5HNlg1OW55cldoWkNpdUgzclZyYUd4WEpmSEZnc1E3K0NpbWpC?=
 =?utf-8?B?TFBmb09EYm1uckZ5R2ZTdXJxMmVlcnVmMkd3c2pxZWNrTFlISjNnNytRWHpk?=
 =?utf-8?B?ME9sR2RoMXZ3aUZ0YVZyMVdub2FmdDB0WC9aRy9yelNDS253bU02YS9sVUFo?=
 =?utf-8?B?ckFVSzVSVnQ2MnUzVkdHWHpPaWIvZTl3ZWVlZzJiYVhGc1NpQlltd2pWeHNn?=
 =?utf-8?B?UElWZ0pYMkFVaXovUTdoZ0FTbFVzWE5XV052VVdaWU5JTlhKOUdKS29YWjY3?=
 =?utf-8?B?dHVJMHlMajF0UDFRSTFHNTZ4enlxY3JpQmIzd3pXY0o4aThYa2ZkYXExRDJG?=
 =?utf-8?B?eERHVzlYWW9zNmdiM255enNmSFBYaEU5SERJNk5HdHh4Vktxak8zbWJLbXpt?=
 =?utf-8?B?Y09rL3NLd3llb2JMY1lqV0Jsdi80SURHbDA5VWtWSGVWeFo1SDk0akFaeVFs?=
 =?utf-8?B?czhOTnd0a3VPTVNWcVlDbEJmZnk3QWo2TXJoNlZMRUhVMFR3SEFLaGJQRE5u?=
 =?utf-8?Q?uKTUhzewYz7HvHpY=3D?=
X-Exchange-RoutingPolicyChecked: PpyRM4DfIgu1PEfnC6drcTJAXhEqYNv416hGJ2dcZSU4sRlwjoKV03W2mFY8E8Qoa5uFNielJ44Sf7CL45vBa34fWaszplWEFbOE0Te3vGAxULH7+NY9i+d7GlF5/g6DqYVu5OIGH6qFcLr1fsow/gCqK41rhRbO55oxRbLMYb+2ob3RljTLZDUEnYRTwr0xQswtWHvfxOkKEjGEkMRtvU4c5h5LcTSMieGzdmcYG/dYWpO6XLj4EKJwWr4eSqSuATA5RAj/aoDAyzwuZt1vd1XeZrHMVUWTvG4ET6Yk9DRG5KZbZVxbnB+MrnGuirX7GUYjzNC3Td1XP3SV4o/PGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f496bb4-62aa-4645-72a1-08deba7a6337
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 16:26:34.7538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iacUGqiHwnUmfQUhviYWBsNATCbjwNbK3vn1MGI3TSFY6oOEuiSip1xDdI+7wzSR6f6nB5jWZAP0Gj/D/FJTrOehUGP5De9aYMwSkCwPI9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
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



On 5/25/2026 12:06 PM, Riana Tauro wrote:
> The sysctrl command flood limit was defined in an event specific header,
> restricting its usage to event handling. Move it to the shared header
> with a generic name so it can be re-used across all files
> using system controller commands.

shouldn't all FW specific defines be declared in the abi/ headers?
this way we can keep clear separation between non-negotiable ABI
definitions vs driver internal structures/helpers

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: remove duplicate (Raag, Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>  drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 3 ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index b4d17329af6c..faf6ba89ce98 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  {
>  	struct xe_sysctrl_event_response *response = command->data_out;
>  	struct xe_device *xe = sc_to_xe(sc);
> -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> +	u32 count = XE_SYSCTRL_FLOOD;
>  	size_t len;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> index c16c66b9fa7f..348768ca454a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -10,9 +10,6 @@
>  
>  #define XE_SYSCTRL_EVENT_DATA_LEN		59
>  
> -/* Modify as needed */
> -#define XE_SYSCTRL_EVENT_FLOOD			16
> -
>  /**
>   * enum xe_sysctrl_event - Events reported by System Controller
>   *
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..0fa786a9e8c8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>  	size_t data_out_len;
>  };
>  
> +/* Modify as needed */
> +#define XE_SYSCTRL_FLOOD			16
> +
>  #define XE_SYSCTRL_MB_FRAME_SIZE	16
>  #define XE_SYSCTRL_MB_MAX_FRAMES	64
>  #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\

