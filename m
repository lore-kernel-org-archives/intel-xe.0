Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A06C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 14:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC11110E068;
	Thu, 27 Mar 2025 14:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLwicGr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A9E10E068
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743086491; x=1774622491;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F13XU+/48gJaYkXjQKSk/n4dWxCdErOnCaxZfF3j0+g=;
 b=nLwicGr/blTfq9PX3OkasWns1KSfby2Wp2NWW8e7pIuQ8MrQMMcpTBcj
 gWok1cwL/8oMVgmEUr57yxmWrv7sSDxPcI69W3mhMw/k/oGHcZvUMqcbF
 JfqmRev4pmsCDvFufQi+NS1rOrKoJ4qP0MtDNCTr4AmgRdJ/KJ4s4KX5t
 ryxbIfCYE1Za/SOc3y0QqzD2AzimmDw4I08X/K3uS8gTgIMK8l8LuQjYU
 GuGJ/xGnCEVdsNp+KZbjXwTXWV9NV0oX2oZqN9BaUNwG8GLdZASicGoc/
 grJG8GUCvEoDHqpVfBwupmnlO9TDl6Fd2EUtAC1tYbZCbYOb8/pEqQNYh g==;
X-CSE-ConnectionGUID: sED1wnwSRO+uUDhhh9GcSA==
X-CSE-MsgGUID: i1TYVevbQZ2y6kssxzbOHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44311811"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44311811"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:41:31 -0700
X-CSE-ConnectionGUID: A7b+gG3QQj6daKC/okaAjg==
X-CSE-MsgGUID: 2gLtMrmcTG2v33R2KyBkKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125675020"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 07:41:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 07:41:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 07:41:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 07:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLA7hjyW8XS7WojO7MRTH3GUTbnvbOeWZSWyURbS/gI9RKXFcQHoTQ1OtayTADfdlFFRW4xfXAN1j6kV+7/C1Wr9BpTTAIdzdm+Rb5yhEKIVf0vZ+0j7XpoWppBrJqiCtFde66dCGxF/2B+Xvea4Zzan7OxqfSdr5B2q5fJBINpnvfHpGH6jUv3qLdjmtCWj3K5twOrIs4MNdp/PX8koFsb1xd6X2hYoIlJt7XY6L3ksH/ZYsEdjWbzmNFsveDceqBJE5TNUhoMFftNx794p/SxYAU41KDM6BNW2ZTZgeS7MpJVVCugGuX7PZKED7P1iv2j917z3B06R9tIW/nr2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F13XU+/48gJaYkXjQKSk/n4dWxCdErOnCaxZfF3j0+g=;
 b=K9eAwZFnc09M4p4sRrQSYQEekc+7fqImLmJ93Z6naoNLAwa6ulLFDDhMc9oFSVePmtql4tY6C7QL7i7PXsDVkEWENwjmuXWF4ilLfbPRVwwatpx/rUQodhJtVY3xcDkgyDnih5/Y4qsx1wDrfqx8tlfv1YZIs5EUivcIEoI3KJzy1IctgvHap/IM9UuTUh4tUq6qceNzN63oT/T0VQvDJOUsS5d6+/DEsQYTzZJ/HKN9M9vZ7dvwnvj8K4wLUe7nJVnEE2C2vJh5CDIednOUzUNvadA6wNkCqiAJ2fyrkkKD7+Ab4Ra1msRJihpMkGIxU3UHCeU1S7x2DkNTe+zXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:40:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:40:44 +0000
Date: Thu, 27 Mar 2025 09:40:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 0/2] Add configfs support for survivability mode
Message-ID: <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
References: <20250327064204.459968-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250327064204.459968-1-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b060380-c746-4423-158a-08dd6d3d5b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NgPtTuevIGkJBMuPjzv/3YcjSDMTDFagWHTD+CXbGWm8FiG3+fXGxh2DsjmG?=
 =?us-ascii?Q?0eR5xCIyCbkjWV7A3T1eL9ODdNH46MR0he6jpOpgndvJMFEVU7Ykh4GlwXOS?=
 =?us-ascii?Q?oESRh1q1D1Up73vUFl7o7A4nDtIj6FCvWjMv4bjOfN9pYkOG8Jsv2K2C10oF?=
 =?us-ascii?Q?dA7tW9Bf/UGZFnN6Qb9+jnRsRZ70Wwd1fbPL/OEjkoZaFc3xzBoHI73N0EQE?=
 =?us-ascii?Q?L7JnL3Ui5G/zlyjPUMXIr5iFJOUwiuDQ+t5rLaK18u99lz6w93PcoQdUixBS?=
 =?us-ascii?Q?+NF/QP4Fj6OzuOAil1ix3ePlhkAmlzgrVjUBoQmDlEEG9Sh8cFqiiuPi9sQI?=
 =?us-ascii?Q?p1C6LI1Zy9nzPTTSOTFvirMLyW2eG4oJFeuCXqKVJsH+iPsYzW5fZs2dVNbz?=
 =?us-ascii?Q?LW4/HmpTdcsq396QMPb/KwgV1Q38gWmEH+Kl9CGxTvWFTT5nt5Fhwth+MvGz?=
 =?us-ascii?Q?MHMbpFBA0hlg+uqL5gGCn4p/UpVwq95lXwL4jpMJ4W3XOM0xugZoN3lYFJeU?=
 =?us-ascii?Q?RVX3vEl3BV6n0IrLMq66vRLsrq2kJ0dYH6QdItXp9lk2lKOyxYjxqUBIQwoc?=
 =?us-ascii?Q?brXtnMaQXvGQcmsO7hSogGxbI/Z7xmz5Y0w204qtLNiy1tWRlbmDf03xQkSH?=
 =?us-ascii?Q?0c28wfCb+pT7bEBZQ9WosOA2UPToOZJUcX7RDGnVDx2zXQYNEZvdnFbRP0w9?=
 =?us-ascii?Q?VEvCcP788VXLqjGgkLpU2s1IfGHLfRKBosE5FZrMPIQXlE1l1cwSqtpRKM13?=
 =?us-ascii?Q?wnpYj3cyJ8sKNxTPtSVu4X2DTKcdH0UBbBImSgFq0IgPcNrAH9dodZWWsIl1?=
 =?us-ascii?Q?ZZrxng9GZLJ3ULWcSN0t+FuCgRzEk80EJYb7ptWnohPLC9hVt+tOoQQgBQJO?=
 =?us-ascii?Q?vAp5o8Wva/ylM+lKq0AeXP3BQsjOVisZcOiQgbiNm61AzPeT1kut8syEwjhN?=
 =?us-ascii?Q?olGxM4KFRzaA3A8E38ZJ6r+V0NetP+XdZWHMP28B3hW7KDI3fZNnPrS9Vnvd?=
 =?us-ascii?Q?Y2u+KhWlTxdJf2wZu2ptQkpPtjPOOLXacDhGTGFTFEQHrxyyKC6N0j5pS2U+?=
 =?us-ascii?Q?GPX1hkG7Z2mtWd7qkQvkQh6CyaVp32V5EvsSGmxNS1k2mMKYOt1EsfPE1Br/?=
 =?us-ascii?Q?SmpkQ5G59TyTo2kDPwJvXPHTi04J3ckaqRQCDVgUnfn4/pjtq9oggDSzwavE?=
 =?us-ascii?Q?D4wBVz5ZY1iWjUCqV58Ul6ril7ZYNt11NGzgdTg55Y4kmTpdgoX5LkOWi+1c?=
 =?us-ascii?Q?Vyp7fkIjzMymXbh9R0dUe0CEG/KG82OVBNGkRpn4/SUNLXKWp/YwDWrKYM1E?=
 =?us-ascii?Q?pRO7+/9qqSSPW564auozl7yxxyFCFlJ1DAwagAYu3IIflHhvcSiJ9mVurMQ1?=
 =?us-ascii?Q?fMwnnyLIm1lWddz3t842vmar7w4EzATwkHy2OZ3/1vRGFL13QIa6eUr/0j43?=
 =?us-ascii?Q?J46eweBf1HQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiuiHaUFGR+iShmGLIo1v56f6mSZCGQHd21YABsGrMhIs0cUHnQ/XMs+J8O2?=
 =?us-ascii?Q?JP+4Ww5FL+gwUHS++bLXn9GdrLh4FjL/PFaJheyPDe6cjGWGtcci/2KgxxQV?=
 =?us-ascii?Q?/y4m+Ff2J9ccOJEaP68wM9jQiXrLj/HXm7qYDvboZ+0wzKpk+ZHQ35yku+mS?=
 =?us-ascii?Q?36fQk1uU7ho5DjOuBxJewAx3rfMMNVlfBXCrVaPNj8/vmLU3yqiDJQwEbl45?=
 =?us-ascii?Q?t8c7AZn7ji3uNHnz2dm3usc/mIEKsIxpWEOPRseR46xrK86bkgIP+C7Fc05D?=
 =?us-ascii?Q?0V+MGH642v9C4L/tjCuE2HtmKlg/FxDCmrEoAy8z20GE43n8+kQbMGZYFzOw?=
 =?us-ascii?Q?nu9YJGHkOrhDdg6iiQH9T8a0BG2TBfQZoLNmXeiiwHdgh+LE+zAU29VJLMrY?=
 =?us-ascii?Q?Da/zNo1i3TwyVStbZUl/HRvINyEB+60BMje5erVKwT8hyfVeM8OW7hk4fcJM?=
 =?us-ascii?Q?8QjMF7VPFFWY5KyVnWEVNtuiRfZGJ/zVtrbX8VUa8cZwIEh07P3lUZrlAMEf?=
 =?us-ascii?Q?TeEP+g3GsczqxlFNAUznTzJOfQ/Dj1HXj/gw7RkBjAPmp17zbhfQBXBGnCS/?=
 =?us-ascii?Q?0xKHGGGUnKAzonB2SrAGs4o0l2PfJx0ICeTsyd3sbzqCpR7VOdE8keQ46kF/?=
 =?us-ascii?Q?aStnOnsDttQmrFrXd+c45a5GfDvVBgt3DNIexarOgJ1M6SBNn3jNrxgyVZN2?=
 =?us-ascii?Q?xegcerI+r626KVF5t9R+wuMJ9VzJDNLHNXgnqXOps7tXv5lbdmwZnPZ/qij3?=
 =?us-ascii?Q?zpQJ7kHGY8kaF6uL1Ew1u5Xcp7SQXsBMFXEGCQNqyPH2Y+S2tMmWzfofQg5v?=
 =?us-ascii?Q?ycxXcDHvf5GfmAM90j3bPHFsOguDg3rdpAI/+2Qp+cGq7K2gw2A6/oi4sXLM?=
 =?us-ascii?Q?aClII8e8VunOZTacOoU1RkbG/DZBMQS8F38U8/ZMPUYfwaWMVT2CmbMMQEF4?=
 =?us-ascii?Q?jW5lDO9sksCOAK0uzIX7MU4dSuEBkVl1sgErVkiEGgob9rPOZ193eoKg4gbL?=
 =?us-ascii?Q?mIk1pKFwepLvho/vFITmcIXswqyzp3yT705Fd07/X1+6x/6DtkFJQt1Nfrt9?=
 =?us-ascii?Q?bHq4LRMTCukxDoUV3aWhwiaH2ggf/DK5HAKQA6GjJxwVqxSB9r8zDfKj9vp9?=
 =?us-ascii?Q?QeX0JfPpfqpk4O+h3ylMFNLhjbJuDhCAnKcwuHxDktUIWnNiAVYsGgXVFHca?=
 =?us-ascii?Q?az1hLVvcr56CbIV/NQRMlrVEaRTf7h7I+Nlbhc1kXE/Fi9fytKBccHO4Sefw?=
 =?us-ascii?Q?mJ5gillBv5xIWyCURLgwSQzsArBuchwNiWvdElgnO9Jxtp7c4pE//4evIUjm?=
 =?us-ascii?Q?GRPmDfSXwDJZR/GXYQDLlTvOAWdUVkLCgs5b8o3DOFIFC5Vd+1uhAbjXT/4J?=
 =?us-ascii?Q?Ut5bhhfb2sWhqBF6w1Rv+TG5C3CyKdTQIuuz5Dxaf/zBN7smizfeJ9m1rMUy?=
 =?us-ascii?Q?1/ze8GiM80LOAjUaD7MEVxC40YcPTQZYE9qzl3e/FKza1B9CPKeDjoAXEPYZ?=
 =?us-ascii?Q?2KHPMbQ+N4y6JlybHHA8/iRK83LQA3kUse2bJHb8O+JSQVA339CfHa3Hkjun?=
 =?us-ascii?Q?ujDX3wmTVwgQBGtVGZ00+1pVltjiHnY2JYyq1CCBD5Y+8GxwEGdPdhlR2kw5?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b060380-c746-4423-158a-08dd6d3d5b21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:40:44.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmlVo2rmUOydoFVade8+FMYgF8KLDOO+sPLQPqeJf8i9V244ur9Mv106+maUb9ca3JM5c1tSKScrGkrRVA5X9uK4jZ/AfFdNBpstBLygD/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

On Thu, Mar 27, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
>This series proposes to expose attributes via xe configfs
>subsystem. Xe registers a configfs subsystem named 'xe'.
>Userspace can then create directories for the devices they
>want to configure and set appropriate attributes
>
>This is done by
>
>mount -t configfs none /config
>mkdir /config/xe/0000:03:00.0
>

If we need a new version or to document anywhere in our docs, I'd add a
comment here:

# If driver is already bound, unbind it as this configuration
# applies only when probing it

>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>
>This is an alternative to introducing module param that causes
>all the connected and supported GPU cards to enter survivability mode.
>Manually entering survivability mode is useful when pcode does not
>report failure, in field repairs and validation
>
>Rev2: use config_groups (Lucas)

Awesome. I have some other work pending that will make use of
it. I will play with these patches soon.

thanks
Lucas De Marchi
