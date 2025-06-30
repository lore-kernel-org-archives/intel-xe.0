Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29750C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 14:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554310E463;
	Mon, 30 Jun 2025 14:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVAWUta7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B628110E22C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751292973; x=1782828973;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N+ETTDGnGs9PVK61dmK83e4N45Tcv2YHjHjEkllvyFc=;
 b=NVAWUta7rqTJpwfKihFAfASRq8uCo8qzb8Y+m3nZXhEDrhHTT/YJcP2f
 8+MbkPlZg6HGHJo1DFy2mByScCsg3DuemX0zKiFySIJ6uEst2AAFVx9rN
 moKWdQ5axS80VoWTBoe9X0GhKr4/ZGky4I3YRWA+BoFbBjUKk/gU2FmUG
 0/8dXM8HdoMN6H3U6vrz315vqMRe5nwTi5TlX4//bIuyuDMERv/NRy8Bv
 uYpmi3LUCbEUBnL1+dM4NDXQ1NXfuBo/M9BgOgFJTRo/V9Em59lRPEDIg
 46p+FDsaMrcxxBLlXWGD0/4L6noYzeVdwFOxOSDabjsoXQl5GSAmtRuL9 Q==;
X-CSE-ConnectionGUID: iVgzYPltTu6KCzIXp6GlNw==
X-CSE-MsgGUID: Vx7q1vxASg2rgFNM3ex9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53394820"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53394820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:16:12 -0700
X-CSE-ConnectionGUID: 75kxNuzJRrmOn5qymMsUxw==
X-CSE-MsgGUID: KR8E/IV/QFOm4UamabcgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="152863261"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:16:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:16:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 07:16:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzsUcuNh/ojcVKRWSCjGDmcKYnqVNnY3tZ/dCc+jdqUVIswyK1CWNG4bDSKqem8fb2kk5Y5cZPfJb/MxwNJwicZyf/DDBiyjWwGdTBJ2+XSntcsOFmJzGF/0KRx09zOcBImp8sKdd58+K/ieG3Rjb8xyc1HuS/0DnNNefmF6OV1VY+GDgH0D8kRgNLaKRuKqqlxfMesoD3iXEZ81M9PaCU6+XfOPg6eUKEBOZqh8RNftLQ+C/C1r6AaEjkPMdjTJGZ9Iiq8TJicT2A/vlG68sXaqFFXr2FmvtNNVpnDG5sfnNbgCLTmvqq7naYVerk464M/UNDf0MfzlSToPYvp/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXdm7hXzrRlh3N1TZAj+SuZUejKLIi+sXYLq/Vn3rak=;
 b=wl6LUnZ8mxUv0SYPlhsNZrRfdY6EwlBIsJ9bjz7RePcKv00HaV2vJTlHFkiwVe98PytMgjqnvHhXPOvAQB+2QeXWmyIX4jWrMG6y8tA5XmAb0hQdZ1/JSTMAm3K9iwvLfSlf3oYdK5ZZskkEalHE1TVHPU41AKVos1xGwrixL5OWntj/e0ygtA6ZmM1ilBEi4tLNlmFxsNnEqnNUjPmhS5QGI2O7AOuRiduKk60yDbNiqSrZyb3GXmZ9513ThZmhi5ZLGMHmW10AjPV/aZbq4HHetZA/HkPOuvUUwRG8toqCWS85U/kaj/V2vDrsCquZusG5oSPe7gk8UYLta6rOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 14:15:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 30 Jun 2025
 14:15:53 +0000
Date: Mon, 30 Jun 2025 09:15:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <jonathan.cavitt@intel.com>,
 <ashutosh.dixit@intel.com>, <jani.nikula@intel.com>
Subject: Re: [PATCH v8 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Message-ID: <3gz3qi63vhc522kx4my67fjroiaiokgn3q7jzhzazectdanf37@33xoisjz2bsi>
References: <20250627190041.238015-1-soham.purkait@intel.com>
 <20250627190041.238015-2-soham.purkait@intel.com>
 <a85bfdb5-21d2-4cd7-95c0-9b6984ee990d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a85bfdb5-21d2-4cd7-95c0-9b6984ee990d@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 72863f84-a32f-4348-ac98-08ddb7e09f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSDSv5HQcY+jdZGq0224tesNjN9bNrymMvqzUNIh1sr3CCHhVVMthNtT9msv?=
 =?us-ascii?Q?AYn3mL6rlS9i7e+mfu8ZtKGSXBU8h8aqXQ26xbWrWCgGXUJkr4ZGCdRyG8wc?=
 =?us-ascii?Q?7+Uy+a4Gav/f03a5Z9fS2vRhH4SdKFlA1NtLUmHkD5NT5mExcjiMnRjLgFJY?=
 =?us-ascii?Q?nTsWaldVpWVS7urZ6kiI1GYpaZh0lF1OH3yWXODFc8CDug5wMuM6fJwzMwCq?=
 =?us-ascii?Q?6wcqbfx8Ghw4L7tGBuQsFLH2hL9kM4Oix+338Ki/7mIpjOVFaM5e/R1ik5R4?=
 =?us-ascii?Q?fZUt5B1r8x3UdRbzy+AVCEhoe0UlBueJBfX1B2ptsMpHzvg9WS5GY4PIbAH4?=
 =?us-ascii?Q?I5FjciHsfDwsMo7VJQs2o+z7ua5+4o2jDPwyo+y5Zs8IpapVex99yqG637HH?=
 =?us-ascii?Q?cVJAAGvu3mJlKGG7mVL4kX3Cn51qpXqVykXOG/+yaVguOAh+1F5yk4elzgpB?=
 =?us-ascii?Q?Og+TtQnppQRYy9UI2f3pG8bHh3n3fwc+C3OP9R1SqYALKHx5m540RNZzRQIK?=
 =?us-ascii?Q?dOxwnR2GE4I0koZlIiF+bNyM/yO8xHxYtluzqlslWqi2zadXsqtMpKzDvRXP?=
 =?us-ascii?Q?oAWb2+sv3RRxRTXbWiBxnAJGf70hSWl+qVnXecJpCer+lAlY7yu0j4c9uWOl?=
 =?us-ascii?Q?J1oGG216+xErPUtTsTqPtCU2nnm0tJ36v8F/QUZVMQ7jUuVTcvOHojRd5Rxi?=
 =?us-ascii?Q?ETD5BlHk0DgrHWJ7kwiNkT26cs7BTV6+OBlWHXaRhJhRVuHu6oG3kjnvCAFl?=
 =?us-ascii?Q?UAnAT3fVwUu7Hot3o21fIobjSWySVmSSfX6kpR5FLGW4ZNZtWibh+JrTWGnU?=
 =?us-ascii?Q?lrZNu8HQ9vKCw0iPUyvoRrXtfEC/UFk53Dej+pXmIqSZYzXv3ik/D6i8w7pM?=
 =?us-ascii?Q?Rfw0YDKA1pMVzbe65A4Pr0HFT+KSgzTLcsufxtXCJTvQJeXjLpXFrYXkZtOW?=
 =?us-ascii?Q?TvTIXpV903yEfrRHBd9a4+ZNGBZyFWg7PVRwtzzYEjfjUsykZ5LNWMV4cHSP?=
 =?us-ascii?Q?ZFhndEW3vpD+GJnLx+2HnczFAi9pnWQNqE0r24U7n0MLBJ7vOErI90X0YglL?=
 =?us-ascii?Q?D/VNZzDOISK6Y0VFXlfxM/C0yb9t0BaAVynsvid2zxek4D1nWfG3Bx6N1Ine?=
 =?us-ascii?Q?HvU7sc5iW2BythbnVlRt0biOUCFB6p5oj34qJ+lR0Y+IyX0lk25Gh6h5izZP?=
 =?us-ascii?Q?EJMZIvoll1ctcinpfiUnozANqdEW5ykWYtTVF4L+psUi7OueEgEfiWC+18VD?=
 =?us-ascii?Q?tkoJo16bgj4oSPsVtaxOYcbJYA1hpXCLTveUrNt3FijuiBbZkg26IM8LkFCr?=
 =?us-ascii?Q?7Lr4/yJ8CsBjTOtgLM6gbF7CQTvh9LLcV9WQcOFlzXiY6FLl8/sA4g0UXW9P?=
 =?us-ascii?Q?8Ons+WBZPD+KMW3vdez/DIeJogScbh3pkB0+bDZo1xsbkXeSoV8mjkwBWnqI?=
 =?us-ascii?Q?7IJOaQe03zo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?td8t0YHJNVUlJgL0N0w2hd1Ot2B6lcz8chfKXnzRtnT2FNxHstHRvIELhzHI?=
 =?us-ascii?Q?YfeXezlWm4zVFuoDbqvDH4RJR6KosB+zhDsx2aiOmN607N93Zg/lQ86AHeGR?=
 =?us-ascii?Q?waA/l/Vny1ZwYFzaKTvi9YSQpnNj208PDJAx4gtVfnG4GbSi5hN+l2X9rHO0?=
 =?us-ascii?Q?uaIUr7kAL2y/QGrC9dcmtuesIfM4nL2UdHnwC9kaLrepat4iBe8xazRMkFIB?=
 =?us-ascii?Q?qKZeSkYYkJto2CO8x/Ezksflwi7RZljHkD79LULbZIbm7MdNau+baCzaQ/7A?=
 =?us-ascii?Q?gKUQUIEtSFKWYjuvPhWX1agnFzF/N5AHCskBjgxHVixLrPdyAx9qVNMid8zi?=
 =?us-ascii?Q?uMid38lZMiZe3jD3mYn7tOKGVMt5BxAgjj0Ch7m7hoHeBf+OTMJq9meSHMLs?=
 =?us-ascii?Q?vW9ekAtlyslkbdkhvkG9IeKXl3bwfW5pa6GOKX35o836Dt24hmW1OibuKbrX?=
 =?us-ascii?Q?98s6VkkUFwAwgCMXjGmgZ9KO003tuiZwnB8MdharMiBbEjueTtGYw3AjGnhY?=
 =?us-ascii?Q?mL3C7s/aIC2qB50MBIqLDAerWlgS8ZHXDz0PrdmwefHNzpsIDi7AINBmXYu2?=
 =?us-ascii?Q?YChhZgqL+NOiWAk80r+53rx0rn9YqGX0AUD9ojTTsBMh85K9BsbI0WPIMowU?=
 =?us-ascii?Q?nAXEM4Mc4+V281QmP83MmiB3myMeHp3LNzgX6fizuiAD/p4tfMz816FRjmGE?=
 =?us-ascii?Q?PdfXiP7nxxpbNLj+Plxw6XuHQ8f9tC9Aam3TIxGiGdv1A0muKkrjAFMlsiRl?=
 =?us-ascii?Q?HFgyfHxMFfWRmpjJdGfo7pGjubb94BmU6KB5iN8q6cEKGPsXyI61W4G8uQTN?=
 =?us-ascii?Q?2whwsIXWdzd1lbnrSBOBUSDD7aqEewkzvx3DxERHYpd5+ba4vnRbvUJ4aIom?=
 =?us-ascii?Q?a5pMNo0c7JH7i9y3g0KzJodFT66jLGbnwO6MtphIHyLP8ZcNEq9aaUg9rbjC?=
 =?us-ascii?Q?tZnDFd2Im18EinYPDIz7WXK9xIVnUhugGigknuZArP3walIOwZD1kD8L3uoe?=
 =?us-ascii?Q?DLOL2a6m8AgoFiXi53E+1iuUlCRkDj6Jj7XOSJpDAxFahK177q5ZrMq96KPp?=
 =?us-ascii?Q?TOxVBD/PXlslwMrZPcOPFqMLJfG6uyTuqD1B9u/7BSkPmYY62U5jcx1JoxTM?=
 =?us-ascii?Q?nTjpOmLT7kn4KijG5kEXcXxzCKYnOIG0BulwYpKsVUIRhdkZ+Mcjm+heyy/N?=
 =?us-ascii?Q?NSCaItpjqna53nMVZq41JMFd1tcBoy8bz8f24TrfbyA5/no4+Lmwbh1lF7Ht?=
 =?us-ascii?Q?ZjGyfd4nA2KCjP4EW/iXyoYnVyJBg3a1KtFQSy7ErR8hNYgvWRp5VWMUlcQL?=
 =?us-ascii?Q?+ymbkBjB4HBQSFbl9a/6sBn+YLCbIzlGOksKEaGabZQY0tKJi/nb2PRxXd4P?=
 =?us-ascii?Q?VgjPpTfA4mU6oYXL0whrL8H3CoU5oZxbAEsjMtlZ1fO5LHb8IbiO6sbLw3EY?=
 =?us-ascii?Q?1VEEi3zPj38R4oM1c8pYTCjefQcGjFYtqrLNJIwVO235n/Y4wkevo6n/XEqz?=
 =?us-ascii?Q?5SBNm2DywLvCwI1cPWmTklz+e1y+3v2SBxhWUiwrngbB7HjMbIeUpUYdPlyH?=
 =?us-ascii?Q?B4htk9fElX+gxjfGDh2kVTBvWDCvEBb9peYtZY6k245Nm8n4hl8oG8x7wW+X?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72863f84-a32f-4348-ac98-08ddb7e09f3c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:15:53.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG7LyhAoudkKBW3KbDcsdePA7OM2gFB0AzDVnp6y2yZLwkqrJ/4RH+6aAakTZb5nSGe+PagiR036PSFQvwjSiwetMNgMzxjEF/CqWyXRCks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
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

On Mon, Jun 30, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
>
>
>On 6/28/2025 12:30 AM, Soham Purkait wrote:
>>Add G-State residency and pcie link state residency
>>offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
>>respectively.
>>
>>v1:
>>  - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
>>v2:
>>  - Add BMG prefix to PCIe Link state residency
>>    offset macros names. (Anshman)
>>v3:
>>  - Rearrange residency offsets in ascending order. (Riana)
>>
>>Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
>
>Looks good to me
>Reviewed-by: Riana Tauro <riana.tauro@intel.com>

but please squash the macros in whatever patch they are used on. In xe
we usually don't add the registers unless there's a user and the most
straightforward to guarantee that is "include where it's used".

Lucas De Marchi

>
>>---
>>  drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>index b0efd9b48d1e..038f34698206 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>@@ -21,4 +21,14 @@
>>  #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>>  #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>>+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>>+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
>>+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
>>+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
>>+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
>>+
>>+#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
>>+#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
>>+#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
>>+
>>  #endif
>
