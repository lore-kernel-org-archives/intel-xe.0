Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFB8CF31BE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 05:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70D10E7A1;
	Thu,  3 Oct 2024 05:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJbmqij7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03710E7A1
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 05:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727933481; x=1759469481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aKArOoVyoMPnLQajx4GGr7SXGnrFG/QL0BAQ/xpgFCE=;
 b=VJbmqij7BlGyjbJ0ed5hBT4w00anzR81jotcmwfFBjq2B6IpJOZWsvDk
 tm0+BkN3Oqry5+RZRguJ4kvxRPj3zq6mgN3/0Zdeti3KLAemNtaOWuFe5
 CEXAEeyMakd1b3ogDb2UpKzuO12YXRKHusUgn1gWEqFcdzoIqk7QDmh+v
 LE30D+bSqRQUdbHsI7DPuQZIjyybU2eNQvi+TGB+X+hT7PAGRTmLN10cV
 pnpx+6UwfB/m3R2PjK5rb8XtmkHA/9oJphIcWrDk3BuKKZ39ZAgcdeHjF
 QcuXDUaSa0rl3Kbh9OhtNjbCsNRZvrUa0e2kmgj7XNtetwGmbHiXANbSb g==;
X-CSE-ConnectionGUID: dLfGmKSATqmVCJseL5JBhQ==
X-CSE-MsgGUID: zeg/UgRTSiGBc0DC1VgYDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27001876"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="27001876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 22:31:20 -0700
X-CSE-ConnectionGUID: 3josiQsiT6CvVqT7ZdLwog==
X-CSE-MsgGUID: +6Y02ZEOQgyxGtMcZW6xYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="111696382"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 22:31:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 22:31:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 22:31:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 22:31:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoqJESuvj2+ac/b+vaXPgvsZv67E0mznJGlUeZ19oqMSqLQ9rRao6jBKyzDlrHAeOe1Cbr3+pKrP2dDJrCRFfpBO2MIMBBeKXFtO9IIaBmBohzpJKFHD8pRig44+bqP4sLyvqKDWTtJr+kE58yBjtUNCbWy+QW6zKR/z0/RsrQt+0wxfarOjrT/5WfxOfQSbJwJA2zgb9Nn8GlSB9PC2yKDO+rJ13Pc2l2R1Pqms0bnDFtWAnQ1MlvNuUV+dKxzHrUmNsSe7T3BchIDux7Ak2JwNiR8X/8ZHuRX+yuc5/HksL5GXn2CQy1WfGoQBqvTPnZKzUY+C7UHDc+pBcZYrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8j6eSaTMRJTHCir6/jAhxLYepmoEnc8O1vWlVhdGuQ=;
 b=rTHwVJjVAKAca8xYnTcmUL/vPdJ0W8bLm+/ZwGpKJ/nw+wYq26hky0f/YcK2IKN25mM66uU+xQ4/c752CUkDoN1F2Unos/vtAH26cLdffM6LI/Qc/5kicQXH9m2jrGzNonC3uRh0XEw5jopv/1rBXdZEL5BvYZvGZwFqv4M4Aeyiuuj5DaA4Ye2gGJ6Dlw2QTVri4MF+xNy0oBrVWa9gJ9xebYuMB+anz3hI0AGz37GoZiZaNF7QudMGefAJo3tq2Ux8WCFEw5pTtrRhBxCwVT/e67REahuzbQqX1vN64V5uPkWgxRNFJ2LWCPsvrotpwWcHH891PEg5kjCqPWU6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 05:31:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 05:31:15 +0000
Message-ID: <764277b7-1dbb-43e3-a918-5088727e4ed3@intel.com>
Date: Thu, 3 Oct 2024 11:01:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/xe: remove GuC reload in D3Hot path
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>,
 <lucas.demarchi@intel.com>, <varun.gupta@intel.com>
References: <20240814105919.2408428-1-riana.tauro@intel.com>
 <Zr14g9D2jxQ2nKm5@DUT025-TGLU.fm.intel.com> <Zr4foqJV28sXjJRH@intel.com>
 <Zr4nQn541KPaaLlU@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Zr4nQn541KPaaLlU@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: c0784b28-fcca-4b27-cd91-08dce36c995e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEg1N2JzVGNhWHVnUFBtTjluV2gvdUwrQ2hxSXBLYWMwZTNUQlBvV011b1lB?=
 =?utf-8?B?Q2tTTDNzRlk5ellFc1VnbmxQbjZoUjNPK3lUTlpCcFZ6Q3FHZUkzdDFjYXNx?=
 =?utf-8?B?VWZYKzR2Mk5ZVzlzYWZYWWFoY0xzRGlTdUdRV1hZVURyZUI1VEl2ZE5KTVpy?=
 =?utf-8?B?Yjl1Ty9XUHN3cnRBY095bHo4VHpXOUkrYWZQbUZicjU1dFBwQTdJdFFQQ2ZR?=
 =?utf-8?B?WEZHbFN1eTBBYWllUkdtQ2thaFVoK0UySEVvMjRwUjlhdWR2N1JZVWhTbHBJ?=
 =?utf-8?B?SjVPZ3ZjNGNXN3JQTFZsUGZYYzRHU04wUzZyYjZ5eTkxT0pGNG9Td1cydURZ?=
 =?utf-8?B?T0Flb2FTZ05FREM0ZUphajF2Vnd5TkRCSUJaLy9FMi9CRjJzMmo1SlhCS0xU?=
 =?utf-8?B?R3FUekx2TmR5ZEkvMmV3NzVjTUdEN0xpTmdyRkRDYnd6YjgveWlEQmQ5MVNh?=
 =?utf-8?B?L2VpN0RxR3lZT2NJTjgvT1ZzUWlRenB6MUhOaUpPaEZBbW1CTm9MZW9ESFhl?=
 =?utf-8?B?dE9PWXpQa1l6NzhrYkxKNkFieTNrNncvaXBTVzZDTmN5Y3g4bnpodFhMbVpW?=
 =?utf-8?B?THV1em1kelRsL09zc0tJdDdDMG9pT01oNEVZbjVwdlFSZU9va1hZT3kzV1Q1?=
 =?utf-8?B?YUxraFZJaWxUUUxxM1lvamptcHM0ZnlNVC9DcXFGaUtEUndtOGxJdTZhR2JP?=
 =?utf-8?B?aW15Nm5CUmFYQXFIc1NCTVprSThydUlGc244blV3d3ZZVFVkZlFBcGNtQytD?=
 =?utf-8?B?b2lvUTFOVFA0SkxQWXZ6NVNKbVozTFNITUtyTytiL1dHZXB2aEsrV01WWmh1?=
 =?utf-8?B?T2pWM2x1NE5XK0xiZ3ZwVUFLblYvcTV1ZCtDUXRtSHJOK2FhVkJTMUJOQWU4?=
 =?utf-8?B?ZWkwbTcwYjNES3dMd0JUUCtuc21zU1JwSTBGRkZ1aDFoUks0QUdWK3M4cERj?=
 =?utf-8?B?WHBCM1psby96V1R3UXF2elg3TUtRdDY2cGF6b01oemVxOXRMWjVER1JGUWNy?=
 =?utf-8?B?N3BTZnhnWWZwbHBQSXZIRy8zZnJva0N3QmRFblg0UTVYK0s4TWY4cnV2VEQw?=
 =?utf-8?B?cnpwREp1WUc0SU9xd3NTUkhTaEk3QkFoNVdXdGxpMHN1YUgzMW9BZ2NMNWtG?=
 =?utf-8?B?bjIwVk83bGduVzY2YWdZOWk1ZytKaE1wWG1jQWpZbXppME9MMjNpaUg5dlRP?=
 =?utf-8?B?RWlPaWFUUXdnSEZQdFNBSnc0LzNXVUFhQlNLdHU2Z2VabHNMcG9PQXd6MmhE?=
 =?utf-8?B?UUNXOVAvcFQ5REp4cXpPYnNYeWtzR1JGWjBMY0lSRU0za1lraVZndFdyaEdn?=
 =?utf-8?B?YktjUDlJTEFZSzZ4K3lHL3pYWm0zanYwU3JxcG9yd2JQT1lhb2NHNHpSVEdX?=
 =?utf-8?B?L1o0ako1YW14V1hUaTByZkVoRlViLzFtbVVvS3N1T1R5TXdUMlVuSjNXbUV4?=
 =?utf-8?B?RmRxSFdmR0JzMDE2QUZyTy9MTW5HakdaUDcreU40WEhGSE1iSnNhUUx3Nldo?=
 =?utf-8?B?VkpwSzM4eHZyY3kvK044NnVzcDBRa1hnbXZDUWVFVFdHR3BjOE5uY200aVh1?=
 =?utf-8?B?TXJ4aloydlpIM2RrbHdmeHl0cXVFK1pUZEpCc1E2dlFoUEJuRG9KeWppVGkw?=
 =?utf-8?Q?PPozjyTo35JXAate0lTphd1gN7YoFDKFXje7COVl6k98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRYZFhTNDFPRUhHWU9wKzJONGhOUHM0ck92ZHRhYlJFWXBCL1JPcnJCb0Ez?=
 =?utf-8?B?aHNWSG1RdFBHQkY3Qy9XS1NvT3h6ckVqRWNFUVNWOG8xNDlDM0hBTHJKVHNn?=
 =?utf-8?B?VUYzV3c2a2ZHTXBSTmNjZXA1U05SUWV5d2xFYnFEVlpqYlFyaW9xL3lLeVdk?=
 =?utf-8?B?dmJZallEbkR2TkdVczNBZHBRaWF6TDNKclNvNWd1QkE0dnhEWVdJSTUvNURO?=
 =?utf-8?B?VEZ6RFdJN3F2RjEwSWlPYk9WRWozaVlkMVF6dk1BSDdlQXk1dUdXM1RPbVFh?=
 =?utf-8?B?WGh1SkI1dE51WmNLdFYzZXZURDBnM2lpMEVsdmoxQlpLck5oWnRBTjR2TS9E?=
 =?utf-8?B?UUJYTkl3bnRKWHExdnorWk1Nc3ZqUW5MdFpNRkNvMFE1dnczaHBaWDFSTjRQ?=
 =?utf-8?B?Y0hONTM3SXZnNFRLWUQvYlhBc1Rwd093VWZkL0FDOEhVbEpmOU9YNDhDWFlD?=
 =?utf-8?B?Rkl4aERTOFNXWDhkUTdQM0hpMGxQUFpQdFZESUcvTmh6WG15ZE4vY01oMjNS?=
 =?utf-8?B?NlVnR1MrZmo5TWhSeVhDdXNzT2JXeXV2WkYzOWNCNUw5Ykwrb2praDQ5Uy9w?=
 =?utf-8?B?eXlaN21BQXVMQlMySVhPSnY1MGgwbE0veTJERlNTWCtkSTRtRGJTVklFK3Fw?=
 =?utf-8?B?MGxtWm0xQjF5MWE3SEtBSGFGNkdxb0VPa0NMSWg0S1BYUy9MWjZicDduR0F0?=
 =?utf-8?B?K0pOZVVaOEx2U2VGN3VuQVdRSkRxck04U2t1bnQvQm9jWFRjczg1SzFNQUQ4?=
 =?utf-8?B?THdrdFRFUlc0TktrUmR1Ym8vZnFHOENnaDhJeGJRTmw2Z2Ric2lXQmwvV3c5?=
 =?utf-8?B?SFlLOUpYdFRJSXI1Mm5XVnRDc0hKM3FJTDU3ODNOMW9TWjJPZUZSczRwUCs3?=
 =?utf-8?B?ZXFvdW1YbTRMeTZaeTNWd1ZtZjVuMjNIK2tOc3EvUnBJYW9yNVlyR3VnSTdP?=
 =?utf-8?B?SEppSENmZ3JYQ2Nzano0Q3dQOUY0S1Zla3JhSUx2MW5aTjA5bWFmR2tRWGxB?=
 =?utf-8?B?cjhsUlIramVxMUtweENaaElqaUhMekx2aHF3MHhodW9tM1VFSmx5bDc3Qmw5?=
 =?utf-8?B?dXhJdTdBTS9uMFYxbDZkRmVnU0ZyL3lHY0tuUVpyWmVRZ1BwSXQyaHQxVUg5?=
 =?utf-8?B?ZzNtdmhzdGN5OGNDTDJlOFFJWkZrZHJvVitWMDFqTHdvL2tqenZBNlRBSWJR?=
 =?utf-8?B?N3IxOXNJWFRKYXJibVRRdFlackNLeUxXWTEwRVpIQStlQlBxTGc0MWx2L1VJ?=
 =?utf-8?B?QkhxbEVrNi9FZlFEVi92RHBqSW9MU2RGTXhwY2tWUHVQenhWazVReDd6bU8y?=
 =?utf-8?B?LzlYSDBhd0lqNkUvdHF4Rmd3NWEvRUxDUEpDTkV0UkR6aHp1bFVJb3p3akFi?=
 =?utf-8?B?K2RlNzROS21TRnhUaGJWU1pXV3BHcDRiU2lleXpoRUgrOWFCN053UlBuR1BF?=
 =?utf-8?B?ajl2THZMMTFwRGJHWS9kVnI2Yy9LUWNMOHJyVDEvSjZjWWs5TU81UmZvT0hn?=
 =?utf-8?B?bWR5YnZraFkrQnF5TENvWU1pNU9FckMvMXcvMVVkNjVLYXlZWlZFMEp4L1Ba?=
 =?utf-8?B?b3pUTGIzOVlqb2p6MTVUbzZEUVI0NzdOLzAwTWNLTWlCdk5HMHlMRE0xeU01?=
 =?utf-8?B?TVVTdVRxbE5tekVCRS93MjVwYVRac3lYWFJGTTRDd0hCVSs0NlJ2Y1A0YnZu?=
 =?utf-8?B?QWQ2Y2VBSnlPdEZkeVQ4RTcyL1RGWkZDYVlybGxhMVNQQktVL1I0UmlBRm8x?=
 =?utf-8?B?b1ZESWMzV2IyTmhpRjFPZnNsNGw1ZDh6ZHoxYU9jZUZmWlYzcnJDS3IwSnR5?=
 =?utf-8?B?ajFRc2JLa29aZHJKT1Zxb0dudXRHdzB1aXpZYlVLckowNFlNSituNnBiTGpE?=
 =?utf-8?B?VVhpc2srU0J6cEhsMVRRNVNHakJHbzJKNFh4UktteXFTZUttRFZTNjBEckxp?=
 =?utf-8?B?Z3N1YmZSUGZQY3pYL3VtR3VUMnZKL2RiT3NnMjJwMDZ1L3h3UFg3d3RmNkRQ?=
 =?utf-8?B?RXR6T0xHY1pmMnMybDFhYWZsZTRqUzhKMGVjR2h6K3U0Wk5PeGlEUXB4OTQz?=
 =?utf-8?B?Sjk5blNhQXZ4T0dFT2ZuMTRRV21GMHdIcCtHSWZXMjB1YkwraHlNdzJpNmcy?=
 =?utf-8?Q?ugdO/WPDi0mn/DMS2DAc/l1Zs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0784b28-fcca-4b27-cd91-08dce36c995e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 05:31:15.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCII7q+yzF2axpzCmP/c2BEVMJpXGg/tK1oCNbp8ReCHOxaxCg2MCTKj9CiIs76l+YNEmVMrhWhNPP4Ujj8BAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
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

Hi Matthew, Rodrigo

Sorry for the delay in response

On 8/15/2024 9:35 PM, Matthew Brost wrote:
> On Thu, Aug 15, 2024 at 11:32:50AM -0400, Rodrigo Vivi wrote:
>> On Thu, Aug 15, 2024 at 03:39:47AM +0000, Matthew Brost wrote:
>>> On Wed, Aug 14, 2024 at 04:29:19PM +0530, Riana Tauro wrote:
>>>> Currently GuC is reloaded for both runtime resume and system resume.
>>>> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>>>> is not necessary.
>>>>
>>>> Remove GuC reload from D3Hot path and only enable/disable CTB
>>>> communication.
>>>>
>>>> v2: rebase
>>>>
>>>> v3: fix commit message
>>>>      add kernel-doc for gt suspend and resume methods
>>>>      fix comment
>>>>      do not split register and enable calls of CT (Michal)
>>>>
>>>> v4: fix commit message
>>>>      fix comment (Karthik)
>>>>      split patches
>>>>      correct kernel-doc (Rodrigo)
>>>>
>>>> v5: do not expose internal function of CT layer (Michal)
>>>>      remove wait for outstanding g2h as it will be always zero,
>>>>      use assert instead (Matthew Brost)
>>>>      use runtime suspend and runtime resume pair for CT layer
>>>>      (Michal / Matthew Brost)
>>>>
>>>> v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
>>>>      assert and queue handler if g2h head and tail are
>>>>      not equal (Matthew Brost)
>>>>
>>>> v7: split functions into runtime suspend and resume (Lucas, Rodrigo)
>>>>      move enable irq code to ct runtime resume (Michal)
>>>>
>>>
>>> I know this has been a lot of revs, moving target, a bit conflicting
>>> feedback but IMO looks really good and ready to merge. The CI failures
>>> are a bit concerning though, can you hit retest button or send a rev8?
>>> Hard to tell if noise or genuine issues.
>>
>> Looking to all the test results for all the reviews I'm honestly
>> concerned with this change. It looks to break exactly in tests
>> that exercise suspend and resume with some strange kernel warnings
>> right after it resumed...
>>
> 
> Concerned about all of CI too. Display is all foreign is all to me, so
> no idea what is happening their but from my PoV TLB timeouts in CI are
> also scary too. If the device goes into suspend prematurely TLB timeouts
> could occur. I thought I changed the PM [1] [2] for this to be
> impossible but might have screwed that up. So agree all of these failures
> to need to be investigated.
> 
We tried to reproduce the issue locally but couldn't, will send out a 
new rev to check if tlb invalidation failures are seen.

Thanks,
Riana Tauro
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/136256/
> [2] https://patchwork.freedesktop.org/series/136226/
> 
>>>
>>> Matt
>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt.c     | 76 ++++++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_gt.h     |  2 +
>>>>   drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_guc.h    |  2 +
>>>>   drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
>>>>   drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
>>>>   drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_uc.h     |  2 +
>>>>   9 files changed, 202 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 58895ed22f6e..466908c91f44 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -831,6 +831,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_gt_suspend - GT suspend helper
>>>> + * @gt: GT object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>>   int xe_gt_suspend(struct xe_gt *gt)
>>>>   {
>>>>   	int err;
>>>> @@ -881,6 +887,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>>>   	return ret;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_gt_resume - GT resume helper
>>>> + * @gt: GT object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>>   int xe_gt_resume(struct xe_gt *gt)
>>>>   {
>>>>   	int err;
>>>> @@ -909,6 +921,70 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>   	return err;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_gt_runtime_suspend - GT runtime suspend helper
>>>> + * @gt: GT object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_runtime_suspend(struct xe_gt *gt)
>>>> +{
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	int ret = 0;
>>>> +
>>>> +	if (xe->d3cold.allowed)
>>>> +		return xe_gt_suspend(gt);
>>>> +
>>>> +	xe_gt_dbg(gt, "suspending\n");
>>>> +	xe_gt_sanitize(gt);
>>>> +
>>>> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +	if (ret)
>>>> +		goto err_force_wake;
>>>> +
>>>> +	ret = xe_uc_runtime_suspend(&gt->uc);
>>>> +
>>>> +err_force_wake:
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>> +	if (ret)
>>>> +		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(ret));
>>>> +	else
>>>> +		xe_gt_dbg(gt, "suspended\n");
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_gt_runtime_resume - GT runtime resume helper
>>>> + * @gt: GT object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_runtime_resume(struct xe_gt *gt)
>>>> +{
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	int ret = 0;
>>>> +
>>>> +	if (xe->d3cold.allowed)
>>>> +		return xe_gt_resume(gt);
>>>> +
>>>> +	xe_gt_dbg(gt, "resuming\n");
>>>> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +	if (ret)
>>>> +		goto err_force_wake;
>>>> +
>>>> +	ret = xe_uc_runtime_resume(&gt->uc);
>>>> +
>>>> +err_force_wake:
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>> +	if (ret)
>>>> +		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(ret));
>>>> +	else
>>>> +		xe_gt_dbg(gt, "resumed\n");
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>>>>   				     enum xe_engine_class class,
>>>>   				     u16 instance, bool logical)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index 8b1a5027dcf2..402322ab8096 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -55,6 +55,8 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>>>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>>>>   int xe_gt_suspend(struct xe_gt *gt);
>>>>   int xe_gt_resume(struct xe_gt *gt);
>>>> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>>>> +int xe_gt_runtime_resume(struct xe_gt *gt);
>>>>   void xe_gt_reset_async(struct xe_gt *gt);
>>>>   void xe_gt_sanitize(struct xe_gt *gt);
>>>>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index de0fe9e65746..bf365c6cea4d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -1101,6 +1101,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>>>   	guc->submission_state.enabled = false;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_guc_runtime_suspend - GuC runtime suspend
>>>> + * @guc: GuC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>>>> +{
>>>> +	return xe_guc_ct_runtime_suspend(&guc->ct);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_runtime_resume - GuC runtime resume
>>>> + * @guc: GuC object
>>>> + *
>>>> + * This function enables interrupts and CTB communication
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_guc_runtime_resume(struct xe_guc *guc)
>>>> +{
>>>> +	struct xe_device *xe = guc_to_xe(guc);
>>>> +	int err;
>>>> +
>>>> +	/*
>>>> +	 * Power is not lost when in D3Hot state, hence it is not necessary
>>>> +	 * to reload GuC everytime. Only enable interrupts and
>>>> +	 * CTB communication during resume
>>>> +	 */
>>>> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
>>>> +		struct xe_gt *gt = guc_to_gt(guc);
>>>> +		struct xe_tile *tile = gt_to_tile(gt);
>>>> +
>>>> +		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
>>>> +		if (err)
>>>> +			return err;
>>>> +	} else {
>>>> +		guc_enable_irq(guc);
>>>> +	}
>>>> +
>>>> +	xe_guc_ct_runtime_resume(&guc->ct);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>   int xe_guc_reset_prepare(struct xe_guc *guc)
>>>>   {
>>>>   	return xe_guc_submit_reset_prepare(guc);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>> index c3e6b51f7a09..cb062f8ad868 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>> @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>>   int xe_guc_enable_communication(struct xe_guc *guc);
>>>>   int xe_guc_suspend(struct xe_guc *guc);
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>>>> +int xe_guc_runtime_resume(struct xe_guc *guc);
>>>>   void xe_guc_notify(struct xe_guc *guc);
>>>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>>>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index beeeb120d1fc..41bdb9437634 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>   	return err;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as enabled on runtime resume
>>>> + */
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>>>> +{
>>>> +	struct guc_ctb *g2h = &ct->ctbs.g2h;
>>>> +
>>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>> +
>>>> +	/* Assert if g2h head and tail are unequal and queue g2h handler */
>>>> +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
>>>> +		queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as disabled on runtime suspend
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>>>> +{
>>>> +	/* Assert if there are any outstanding g2h and abort suspend */
>>>> +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
>>>> +		return -EBUSY;
>>>> +
>>>> +	xe_guc_ct_disable(ct);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>   static void stop_g2h_handler(struct xe_guc_ct *ct)
>>>>   {
>>>>   	cancel_work_sync(&ct->g2h_worker);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> index 190202fce2d0..0cf9d77feb35 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>>   
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>>>> +
>>>>   struct xe_guc_ct_snapshot *
>>>>   xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>>>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 9f3c14fd9f33..0b8e984ffb5c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>   	}
>>>>   
>>>>   	for_each_gt(gt, xe, id) {
>>>> -		err = xe_gt_suspend(gt);
>>>> +		err = xe_gt_runtime_suspend(gt);
>>>>   		if (err)
>>>>   			goto out;
>>>>   	}
>>>> @@ -427,8 +427,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>   
>>>>   	xe_irq_resume(xe);
>>>>   
>>>> -	for_each_gt(gt, xe, id)
>>>> -		xe_gt_resume(gt);
>>>> +	for_each_gt(gt, xe, id) {
>>>> +		err = xe_gt_runtime_resume(gt);
>>>> +		if (err)
>>>> +			goto out;
>>>> +	}
>>>>   
>>>>   	if (xe->d3cold.allowed) {
>>>>   		xe_display_pm_resume(xe, true);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index 0d073a9987c2..7bbc8b3c556f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
>>>>   	return xe_guc_suspend(&uc->guc);
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_uc_runtime_suspend - uC runtime suspend
>>>> + * @uc: uC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>>>> +{
>>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +		return 0;
>>>> +
>>>> +	return xe_guc_runtime_suspend(&uc->guc);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_uc_runtime_resume - uC runtime resume
>>>> + * @uc: uC object
>>>> + *
>>>> + * Called while resuming from D3Hot
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_uc_runtime_resume(struct xe_uc *uc)
>>>> +{
>>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +		return 0;
>>>> +
>>>> +	return xe_guc_runtime_resume(&uc->guc);
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_uc_remove() - Clean up the UC structures before driver removal
>>>>    * @uc: the UC object
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>>> index 506517c11333..0beec5efde6b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>>>   int xe_uc_fini_hw(struct xe_uc *uc);
>>>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>>>> +int xe_uc_runtime_resume(struct xe_uc *uc);
>>>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>>>   void xe_uc_stop(struct xe_uc *uc);
>>>>   int xe_uc_start(struct xe_uc *uc);
>>>> -- 
>>>> 2.40.0
>>>>
