Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490EBC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 18:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092CB10E0F0;
	Tue,  1 Apr 2025 18:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru/QIaC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20C10E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 18:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743533829; x=1775069829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r36C2r4PrXcCEiYDeM8RtQG6v4BJE4TXRaB0o6pL6u8=;
 b=Ru/QIaC/FTFBEQmRiO8e31dJQO9+DpiKaR5W4XQDP5WU3419RVJ3h8pB
 L4uzzDXtqqw2jOAgoN6iagrUg9TXG88eJu9m8cTyBDUPiLdT14wpsiI5v
 Ke/+45agEdkndT9pRFPNl+KhMjqbEHBU4dpslwKBu2uy9tDac6J6oaSd5
 0z3eQJM+6BVKKwJPeGpHEslVmuLU9Vo3pkdvPK/0bLcbFUdyuDFfE50mr
 J7Xh+Th/XjcCYmuQfRDLQpIfI0FriJfbcCEzMtMoXQBQtBnvzmBw/MENT
 /9Krpaem+KaXNtt/J1bs0e0KlvmXJBhQC55VXFQkX7NWRBO6HD9OfE0v1 Q==;
X-CSE-ConnectionGUID: AYut8i5NRlqI4ckvI0g/sg==
X-CSE-MsgGUID: vndeFcTDSJCyp/nmDkB8BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44783475"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44783475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 11:57:09 -0700
X-CSE-ConnectionGUID: wGYfFWQzQdG/WaVj2mRJ/w==
X-CSE-MsgGUID: 5Sx33Cs+TRaUWfo8Sz0Nug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126370468"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 11:57:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 11:57:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 11:57:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 11:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7LxFw5w+3OX+RjZfLWTEvS9YGSRUo+dK5axJu1Ga/tS7SEeKaKZdmjOQ9n3UcDfVn1SlxI+TerpGfcIgJxNn0pz+HhIb+Qv0N6Pb3bixDAXBrKXmvUbsQfjG/jwlAoddg3ZO97O8ZoaigBDYkH/Xk8j/qST7XG6SOhCo+bOkB9f/kFzViXsiP1XnebH782o97UxMpByKigy6aP8F6PRx4s9wtJi10kNXBmTAKPiTH/XhGjAqsTLuvLY8xbLQZrNiRZqYZXn9hZ9PzKg16CTq3hybyoZqaRLRfbrPZNQFeW8FjQfmzUg6+jTV0dQVER0rIRglEE7JQq+75vZPCalQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMs0j6Aj/J9+rfaWnqrlxkhCOn2Q8d/NhOvEyKKVlVs=;
 b=YSOIQPYXCsoMMh5F4NyOit4cCWiucFg3xPrOw8lOephWq+qMWQyP9lmd9wuki2uBSQnqbroIT41FBDC8aM+43qiCe04acxdGuoVs0xYFkpycDS5wuG/ZMwVV0zLUHV0Yn6RWDwZNz0S0x9T0EbT7YX8U7I0lGDkq16WeF4xZU5PYRwd+NeR+LlSFisiqZLsjxkTD2UiuFnzf3uTopSXpnDTxLIZoC45h2iBMejamvJOIh+eI/6jys9rxQPnB4xEv73N8I6EOOkMYe9JGLzQF1gFEeLoC6cPof4ZJEvMsrjP6OrqYiHZbil88ArKrWV8MhwPnERuORMD3EPFYqMfhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 18:56:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 18:56:23 +0000
Date: Tue, 1 Apr 2025 13:56:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <odeo7fggcto4eb6du7x52bjpynuasfvw3nrfmdldbfrjsajmnq@xqqkzawa3tm2>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-9-dev@lankhorst.se>
 <z4oxa2vgrqorbediwjjwvs5nwtjxqwjtbeenmwa3m53mizdrjy@ox4klandkqsl>
 <4d08feb3-9067-4241-b6a2-e3f6578d1c32@lankhorst.se>
 <byjjxgnc5hhzgsbrwbcuj56ihqi4ixs3ihz45n4l6cczu7icv4@ctiesmev7dgt>
 <04315bcd-f676-4802-9a6d-abf8200e9ec1@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04315bcd-f676-4802-9a6d-abf8200e9ec1@lankhorst.se>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfb5c62-102f-4b82-8f64-08dd714ee5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4EVNRWVKOzykxmkcBdmndKqLgDU6JqWRXWE1yVz/9ZRpPoY+J6mkrLkg5j?=
 =?iso-8859-1?Q?7efI4YQ7m2oUqdzlrRR8HY6PM0MX6DVE60OHK4LHmvmtDtKF5voP4vDqfk?=
 =?iso-8859-1?Q?nKuQI7sZSPZ7rhRXY7u+Dw8k3qO5B3j5DD0+vNiWrlo1taKpAEO83YEOy3?=
 =?iso-8859-1?Q?iT8rUMXBXMB8Jro+vyW1hFKUkMqiMVTPnsBqV48CEXebRp+Ii5nSpEdO+K?=
 =?iso-8859-1?Q?r/aq8+N7ViN3Ye9CFGAwjUkK4OZPa59BOka+xthI798ZXu3mU8AMC43LLE?=
 =?iso-8859-1?Q?KwDKKtoA5y5tDQc7udINtRudGbaCo4BuaL6bHaK/CVHBNfbDTJ+EjRcJr2?=
 =?iso-8859-1?Q?njkw0uVg8HWZCyTK1LN4Dx/TJt9ugGP5sbSm0HeGYZFsH5vBqb01+2/lBr?=
 =?iso-8859-1?Q?ubNz76ToQEI781MQVMDUhFX2bxGhnhgoszQxtX1VzIagoSgh/NJtLuuYYF?=
 =?iso-8859-1?Q?QvrAc+IH7vCKk3NBg8+xvxWD/K5nnAbqXHCW8Bfoz61RDbztSMAu1nAoav?=
 =?iso-8859-1?Q?8XkuOL067+yr6K02dMviORAkarTGMKhTswf2N6/HDhd9Q9VwbXLP5R1pUY?=
 =?iso-8859-1?Q?XPrDqH8oJ23WgwRMWDQBUc1fsnZ5d5AtLM6FCGypiEXnFKQh1qU9O8Hgcr?=
 =?iso-8859-1?Q?3Iw5xoUKJNoWYDH2WEyZsU/q8raG0UBkHTJAZsVG/3HUQ6VWjmLHsl7x9v?=
 =?iso-8859-1?Q?SoTrEjUzMC9WzVNi0El/3nXq3jhI2gx5CY/ODw6cHFzUz5tLOkeWy9DhzN?=
 =?iso-8859-1?Q?KZnl/rAfvoOsvm1fC3pwpfDOEO2hWjsSw1d0S2m7hoacJTqvMumCAVCYZJ?=
 =?iso-8859-1?Q?G4rkG7C2zWilVSISJRW/Yh/HF4Uh4G3j6XqAEdTgLivzpWwWTV/2urescF?=
 =?iso-8859-1?Q?hLk+xUS9e7g/qdlLs5LH8Cm5cmYP4h6kpLPrWvplk51z6sdPmkzkwEL2wN?=
 =?iso-8859-1?Q?5Be5KEJHpTVtdVyIhmiyaH/OuB3TSFhYIeHC6S+YpbFyHW3dsFjfFWeBRy?=
 =?iso-8859-1?Q?VWoKlwTf5a6t0/Xx08z0w1sAJo76yq1rxZhuDJ3TDAIay21RCFOmP8kbeX?=
 =?iso-8859-1?Q?MC+EgjdKDN5FOvzZs9E4QzI1BGVDw83rvblOGtCj6JDwgEm4mPVbeTXa0V?=
 =?iso-8859-1?Q?fhqBrlUyfj0ZJm41bXwnFvIvJu2jCJv1ipGp6R7hsNIsQv8GurtDrhAOby?=
 =?iso-8859-1?Q?jEeLkFJXixqvuNYsqaKIAdH5rBUcYGPWuK/C2GByS5XBLh+XxzNL79fu7+?=
 =?iso-8859-1?Q?0dri2rskiTZlyVtsuDEgKLYqK0jXwZyTR5llv+WLhL8C4qekC5toUOUU6/?=
 =?iso-8859-1?Q?0WMzdg9cRMy7xPnHV2Zyb1Q9zJ7amt5M3mJsmkJfft9/nmah87v8uNfzlf?=
 =?iso-8859-1?Q?Iw6GIVZaRnfiA8+0Z3N9wHkHrwf3hymR0erG49nPQCjgOngOsNYiglSEhv?=
 =?iso-8859-1?Q?+0AT/ARSnCvMYtnv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B8y9MaS9LYEiZOTJg+ncP5hi6rSsIo78jJVg4bLboP6BaybFUYkqkRhjQa?=
 =?iso-8859-1?Q?oRb2YkvRZOdu0eCm1hZ9Nx/vDzdYb05k0RD0xnO6I3rshD9lZ/TRMxVM6G?=
 =?iso-8859-1?Q?oaeXMa1I7+UnQDPjzfxMppcHIBYrqzUuNcYmHxJEsVgfNGPnq7ZxEEzXcl?=
 =?iso-8859-1?Q?ZhFP4VJDIWor6LHv4BP0hoSUbzoS5bt7Hm/XAGJdeAK6RN34b35fwwkIHc?=
 =?iso-8859-1?Q?uguyKX+I59Q8yHe9A4CSEUuBWaX1HJtTii7agtSp7iD30jz6pKVYGOePEZ?=
 =?iso-8859-1?Q?qu8D73raElmy+LIypEePMdJkTq0ba0WbALgK8Lq+xzrJumIG6WgFNabApf?=
 =?iso-8859-1?Q?H3zLOoN7M23zR0Xb+YHsZve/blx3G13CByO5Y6Qk0eBniMbVcyk83maWx5?=
 =?iso-8859-1?Q?esl2vm8bAhSPnsardKrDd4k2LoCsYdsBys6LgDZ4txIHwziUlYJzuiub1P?=
 =?iso-8859-1?Q?Dh96fCj5vhWNwc5ddGDS6vezQATXNvaVAwchGc+Uqp/INkfYudAWrt988w?=
 =?iso-8859-1?Q?kMiJfeVlm5rjPMvEJcRk0DN/QibhnQHMNmdFW8nAvu0asYLLwYtHOl/Hzj?=
 =?iso-8859-1?Q?aQqO9cl6Giy3dS+NuKM1rB/RZTOT4Lxzo44IXOyy9navN+c4Jn+AS+EJ5x?=
 =?iso-8859-1?Q?CTxb1w6sLpPuHHfGYPFDch6gWkm28i5H5+ARdah0wAA2TlQKqZijToZEE8?=
 =?iso-8859-1?Q?IkfKqElaIu7ioluoNaVyeVIBx+whFusFC3X73SuaCvrkE2lWG5iQ2FWKUW?=
 =?iso-8859-1?Q?79/80FYzxDsBajvGordYdfkfwD+7tRNGDZVWXDEZQDESXPGTDRp8b3Mmmt?=
 =?iso-8859-1?Q?2ysNN3ZJ/9MUR3ZKEomkVY1CCFvukFAUYdxkIZDbOPKmGsSNw5Hb5XVt/Y?=
 =?iso-8859-1?Q?5c8Vm8VWXVNtpzPo/zFm0BZ8KwrlWxWLcCCMzygCmQDHUzS2vLpjFVD2wJ?=
 =?iso-8859-1?Q?Ik7AImoTXkYkbQ+mD7D8QzWS8G5024MweknVXlXTlEz30Nt/cGhIRqDvO1?=
 =?iso-8859-1?Q?kakWr6ybIK4iIVz6HNZfYlJ+LZ7bRjr6g3jVp6k8vWixPxiBjJgMgrPAHv?=
 =?iso-8859-1?Q?5vHIUMuR4jpEzcIQIsdv7NK2+IQApE62CJrnoh1UZwW6657XZIj6HV95ZR?=
 =?iso-8859-1?Q?CR/d3zd15JTHs8FgpKMO8/Z0UkKd7GLZ+Koh8pFgfzBK4FzNpLWw85JfFu?=
 =?iso-8859-1?Q?+RQXITXADNSJ+dI+DSh7nLMeODUS7TDgwmAOVhlCw29umoq7L08t7M1EmC?=
 =?iso-8859-1?Q?DXw/YDDlaBA1B/QipkDrOf0Zf9lsmuUwrgLwgmQKkPhsgkPv7Sf/IDvS9B?=
 =?iso-8859-1?Q?pycrbTlnj+JvcQGoLcREmkhhdFr+XVA0BveVZsnv6/SgPIqVzYg0KHCQab?=
 =?iso-8859-1?Q?AKAXj2GLZ9LO41Z1DBnquTKDGNjLU2/L1hK5GyphGsETl5yqwxZgeG9FV4?=
 =?iso-8859-1?Q?LIeJhhVxBE7ayxhAMlle8U+O9B1nyiw9mJJFvdp7D5ghMrG1HgZlBlHgoM?=
 =?iso-8859-1?Q?i5hZzUyHjnP3zaxmLZG51I0tu+Uy+LEHG+lT+wx83o2GdHNUEFBHLQ1uJu?=
 =?iso-8859-1?Q?ZPh41NlCmCHfng3cJvGug7W3IO7G56YTciXuOidS5sE+JnTHNPKkkrXXrs?=
 =?iso-8859-1?Q?EGKU7GVm6YsfvgK1HdpxH28XSKWx7RP8BuAtBw0isfxxzTMWugiPZEiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfb5c62-102f-4b82-8f64-08dd714ee5cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 18:56:23.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmm+n7pdXr8kG5j1wrvZ8qrSLoZrmZWFbGPgojlfeT86Nb9c2eaTAWkMf4inIV7GMx0DTNLKIMGyBhayRGXiT/7DURQHLm/irKhkXqjeoD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
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

On Thu, Mar 13, 2025 at 08:23:18PM +0100, Maarten Lankhorst wrote:
>Hey,
>
>On 2025-03-13 15:28, Lucas De Marchi wrote:
>> On Thu, Mar 13, 2025 at 10:19:58AM +0100, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> On 2025-03-11 21:55, Lucas De Marchi wrote:
>>>> On Mon, Mar 10, 2025 at 09:06:53PM +0100, Maarten Lankhorst wrote:
>>>>> static void xe_gt_fini(void *arg)
>>>>> @@ -471,6 +451,18 @@ int xe_gt_init(struct xe_gt *gt)
>>>>>     if (!fw_ref)
>>>>>         return -ETIMEDOUT;
>>>>>
>>>>> +    err = xe_uc_init(&gt->uc);
>>>>> +    if (err)
>>>>> +        goto err_force_wake;
>>>>> +
>>>>> +    err = xe_uc_init_hwconfig(&gt->uc);
>>>>> +    if (err)
>>>>> +        goto err_force_wake;
>>>>
>>>> humn... why are these 2 variants not merged together then?
>>>>
>>>> at the end of this series I don't know what to expect. Is everything
>>>> here sufficient or is this part of what we need?
>>> That's a good question, makes sense to merge those 2 calls.
>>>
>>> I haven't done it yet was because I was trying to solve the issue of flickering. If it turns things
>>> break, then  I want to ensure that we could undo the patches.
>>
>> and does this series alone, without additional patches, fixes it?
>> Correct. With this series the flickering is gone. Display is able to be the first to allocate memory and GGTT space, so it can safely recover the initial BIOS fb.
>
>For paranoia, we probably should move the xe_ttm_sys_mgr_init() a bit lower just before xe_vram_probe().
>Maybe I should rename xe_tile_init_noalloc to xe_tile_probe_vram() as well to make things more clear.

I've tested this series on RPL on top of current drm-xe-next and
apparently it worked well, without any flickering.

Lucas De Marchi
