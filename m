Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4903BC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAC510E82E;
	Thu,  6 Mar 2025 21:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml3VpMWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7399410E82E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741296905; x=1772832905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nd28oyjSqPWBZ3zy5Ta0mjHDlnb9SzSR3kELWIREh04=;
 b=Ml3VpMWpHTIDHRqgwI+KjGNfLrpVsqJAy9EY3eDh3KSNjdbXCDMqiJFI
 YO0ywmq4dQ+joTcLk6FAK1Ohm6apwpnj+TM5unmsd62jvoBC78X9pk+Hl
 NA6OHZ27RBWz0oaVfbiBTUoRpLOM8Kp3DEhznYVH5VVuBPYz3QTdYdTJb
 S/gbXWOL+hRPc0K35K6Yo3Zuh3zB+GRTU/V9NNDIoK3aedvsqXpTIlcf7
 vk2o85s939OuOe/6TuJjx1P3I2fDdkNE/0UMLw52QKcgK7zC2PZpKNvea
 NTZM1QJEoP8ldPVlodyEs2YeB6G+7UGODc4Ufk/80LPXTKLLEBGn5y3hN g==;
X-CSE-ConnectionGUID: ohJFraf7RrOtO/ahHyrY+A==
X-CSE-MsgGUID: KFuEDrBxR0+8Op2YOVLgew==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41584211"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="41584211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:35:05 -0800
X-CSE-ConnectionGUID: 5dTDPPizQD2kX0Wf0GUcRg==
X-CSE-MsgGUID: ednoz7QfQ76rMIVJezvT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="118973597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:35:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 13:35:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 13:35:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 13:34:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/O6UlaqExs8nqsAUiPJ/1hbqeUUhgSeQg6CTWJoeH1pyHzmyiWqQSJu4S6rZuzd9Mh5s/TBHNcJ05w6B47Kj0dN8VQvWIZeV8748jt7YpX5bGklVqE1+JGzO9q7gabvisDImX99yK+X6XyIDU2MM9jCUYQrhmWx8rVn6LxC47v+Bf/1fpdAZrgXU+KnnWvennVT+PTnisvD8KiurSBOoiLjoH6FijmVyO7TRAMsnuvdiqrzMoqAaCZ8kLGAaUFcSr7diQ5l60stbCQXg+nQ5ZtfGyp04I30mKAeUrAYcFp490RMjyYLcPpIiMmBCDYMeWd4YF61M3Wsb0CLyVfacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tE6/eXaeRXFK7iBwNnXW2Aa5FcMud5rJzPzEuDZMtg=;
 b=YXltQ5VacajPlzHC3Qcuj9MkTswaZo7bt+03oZ3eqt3u68tgNtV8amyM/sT6SIx/hNhyIHW/1IYjoCpp61Pf1OUbXD0DY6u8+p7yLPZKQwY5grFMRuhN+d/G7k9O6Sn/BPWymr/Co/bNfLYfpsFiM+4aVf8vVcWe7m1mhEUS+aC7PpZ5Mxho8Pl1VG1E67o3Bqp+xeMcXcajyO8GEDX04LslBZDQtIXn6/VhTtH5oySzu91RqaOPeZ390uYYo/plgv5w6ZqFZno4PNxbS5xaYf21tRRjLqozvJIwSQv26XEY9Unl9OAJwmfepKy3swXtzJkZmQ2NpAps8x8XmAmSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:34:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:34:07 +0000
Date: Thu, 6 Mar 2025 15:34:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Apply Wa_16023105232
Message-ID: <bo6avog2wss6bmme74jlkzittwormczq3iruqj7xv27jrgtnha@qxakweupxmun>
References: <20250226032934.1789134-1-vinay.belgaumkar@intel.com>
 <7c70d716-0d1c-4797-bf6e-65f00acf6c6f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7c70d716-0d1c-4797-bf6e-65f00acf6c6f@intel.com>
X-ClientProxiedBy: MW2PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:302:1::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: b56e6c02-ed39-434b-fbb0-08dd5cf6a007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E7IyuXc4onh5qhpGR93oeNY6/bsmigGZhXvM++CO74A6CIcYwCv5hmKto1aa?=
 =?us-ascii?Q?KtprVRJv7jOKDeeqgFByLtxHurQVolIcK6dZ2njuOKVUc3RLJ12n0slVVwUu?=
 =?us-ascii?Q?DeiP1KjGvi6HTE87EAYWCqzgstpZe2wxKUEjhrDG1I8PL4mJRhOSIem6bg6i?=
 =?us-ascii?Q?iE3aohPiudvKrHDFECv3WRHtxz4KLjlnI3QBO/y24X/tcxVl9LkFKfMRgVKQ?=
 =?us-ascii?Q?t2zbl+LhqAqS0hoIfUPAP74ah/hNx5KnW0Kw/S/U0oAm2cOYhQEc0tx0K++n?=
 =?us-ascii?Q?i6Bf5C2txSARMQc5DfPXJm1WOLT9SeLUMAmGsMqmQMde329NLQ1hvQHXsQ94?=
 =?us-ascii?Q?fG5yxQEWSPh8oIDA+04sfHzgNyyWKCuIoccpDCD6COFHo8edkiuV2CcERu7J?=
 =?us-ascii?Q?y469TR4VEnCIGHBxdCqrcDxgF5leW+qTeOR9jh+3SCuGKVpIn8rtraWIDxw4?=
 =?us-ascii?Q?gXsU6fRpdO+KjsA14B9DKev9pLOR+Q6psLGMHlhBEPlTQiVan4MVVzrN6raY?=
 =?us-ascii?Q?hxk4fi4RXch0sBYcjBtZ43yy5AeK/S5YYSvQOYdNz+4sIfZqOz58lbeQdva7?=
 =?us-ascii?Q?tV4Zy9rFD56dJ6oAWZ4PL+GZLbafId/I7+UKlb4Uv8TyiFvv1r0X6xEWyM22?=
 =?us-ascii?Q?Hr1OPpm6z4LDZJrzaxpzq9rkFd8tyIAOQmQusmA/bkI3++XnU2jEhlI6EA24?=
 =?us-ascii?Q?kmeENs7POZOqqi8MgvUGyvc/xda2LLon+A1/utFJliVZn1VV7AXjpITETrOq?=
 =?us-ascii?Q?HFOujXBIccW7wj+mdxIi5RWVluktuMay83h0jOST3QixkZYHrsFAodrJm0Iv?=
 =?us-ascii?Q?oYZDPaveLtP+zHipECkb2IpazAEmHDnZ2lmjTEa0vzZ+tUYVCaVBW9zbiZGq?=
 =?us-ascii?Q?iR0bqOvmVMm62LaFhQw4ShDnwl18XdMNDJwE+P2a5mlLg2DuHCEg9GouauFG?=
 =?us-ascii?Q?EO9W0EJ3bNplR+7Tudib17AX8PnPydahf3g0e4dJY19Xu+8RZO7rnhwn0+8q?=
 =?us-ascii?Q?ZJLo9Nbed7iU049iQ4uhI89kN4dqDzSAn99smt1waw/ZTcgKvvwvm7VHkxOk?=
 =?us-ascii?Q?wlciUY1DgnMjDGPQ2qzKpEP4Qbt7JplGwPljKIqgMquNf03Z0bDyMdSVqw5x?=
 =?us-ascii?Q?LPowGKv6bm1uL6l+yxaUqfsYsKqXF+N5BEyA70e5tRzSa7HOONT6M4soE5YK?=
 =?us-ascii?Q?hnpiIkJr8lTfKYgwbe+tAb68dkzFvRfOSiDix1VHw99eVyVq33qhsYFB/PzJ?=
 =?us-ascii?Q?LmN6hG207N8o3sMTwu3KjQhJF2cHWNdSb4Jq00DV2RmDtkaRoqfxkBYfHu9c?=
 =?us-ascii?Q?j6qr5rUUUfeF1FDDCZonVOKJHi/mEeBxgP6VElq6W6hTWegxqv4mYU+AX0gl?=
 =?us-ascii?Q?66KpLhEpbHFoKGolx7YB62WYypPUDCHxwpphh8OZJEoGbdS+z4KPSjD5sl08?=
 =?us-ascii?Q?hP0aq+KJ4DuGwGQOLaS+OSt0WpCcd/iN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NR47mVR/tllx9RIGdpuzM1PeEnF50AY/Q1/RWTyHpyRIvr+X5OLkB9ZMeqGG?=
 =?us-ascii?Q?jrPkoE+T4pkdAWBGtRnMxrXO74Eb86kORdSdU3S/XS2/ZSbS0ny3uhpw5L0m?=
 =?us-ascii?Q?0K7gjOftE6DV4txc7V105MOvorUfuGFBMiF/J4Ho7WTcWWa/GM9ZAbsqH7QP?=
 =?us-ascii?Q?L02XhJuzYn+VMdZ/AWDyQW7L1gnsKvVBw/9QWWuuZl3H3KlnMZ80h+aUqcpB?=
 =?us-ascii?Q?lLDoBfKIiwbX564XcZsJwWWNrdC3IClb3i0Vb9HhOYFHk1NkQTxA1IHtLrid?=
 =?us-ascii?Q?AozLXFUnHAxCZGSVMLfEnWaVeND6mIFcdjH2acx7Oztl4k6ZqIc69gt9w59C?=
 =?us-ascii?Q?nSN59HpPw6E37B36s+nxdwRC93SBNX7K51YAeKQIqFMnZgvjj+HEtKyAEvtG?=
 =?us-ascii?Q?S6LSvYAs9EiELCDNNmK5rvrA1j+uE5d4paiu8nsbkoLkA8kNqsh2BNllXx0G?=
 =?us-ascii?Q?Teyxj1ZWa+RMTlnw3Dn+mto1PwlZlcG7HzecJvfloZKv5Ybyjz7XioUCYTCR?=
 =?us-ascii?Q?u9hz5343HwSe9ok37BK9cS35wo6SN40xpPETMYAZEibLGByuSCJanVwW1Cz9?=
 =?us-ascii?Q?YmAz4cvWmWYL+j1y1YgbixC/w8dBCVildcwN4aFEfkW7qtG4218qE9aEBBvH?=
 =?us-ascii?Q?VjhobDtRDzwF1hjELXxA5TcNxVRl6u104vjUUjln6mRPa1VDlptuaw9CZG3n?=
 =?us-ascii?Q?Ewsve40JiSrKKXvn5jXgpYOEEWeCwHn6/y7AkbUnQO0vwr65tz86s5mibM7A?=
 =?us-ascii?Q?DJPNGYftbd4+6BuHDg69pxYbxuw60Qi5FdpAEyt6U4P/H6E1ZaEHY+V73dr6?=
 =?us-ascii?Q?34HMdSerxOuT1d1N3CAa4lQaDN/goDXIOxcMNl8eCZQ31D5O++8HrLJT1yIi?=
 =?us-ascii?Q?LWHPSw0i6dZ60qkJvTvzIcMLE2S5RGj+9SlkebkfLq736Qa/Uoihllu3MYI7?=
 =?us-ascii?Q?C/QblmZNKAE/YDvlpQiarRrA8fommcSorne7Ei6PMPdRct9OLIWqybmqN3x6?=
 =?us-ascii?Q?jXp64dW9SSIVKbTC2ev0atRSWfPMSX2/g99WVTJISqqshWLyHDP4hIdvvBp7?=
 =?us-ascii?Q?r5lTlBMQ7F/w5zsT80qNwBWA/+o7F9pb0K85C4FEz8NyPPZSBNuX4dDdZ/PQ?=
 =?us-ascii?Q?YwFc69gJbchTmXqNGuPD0OjKH5YR5hmH0LdpHpbueuBiZBr+xInVs1Y4KrIx?=
 =?us-ascii?Q?fWY4hdgvCWHZK3PCPwTf5Hd6/6cY7BPHTfGKsR5viXFi4XmNRRAMOwSD5kFH?=
 =?us-ascii?Q?s96rXzKahxLhEaTtETvp6Q7ISi9xhbo2eQ84NSVDydVNVtJ3kGwS90VrqYKa?=
 =?us-ascii?Q?CtBz+cCkl5FShGOCRcFI8Ff+KjrXBTp91ffO1eyCUJH00W7mrzaRmy0wVeyy?=
 =?us-ascii?Q?Y/03qBLavLa2JbecTpJk3yFpPi2SnZ7h+Xme6j8K5Jkv2rXrzbpwE+q7ymoU?=
 =?us-ascii?Q?4YiB+xJ/O5tOHKFQrbCQXKWVmdVpdhRdDnXhejs4wPTEeoBRsksLfN8aC0iT?=
 =?us-ascii?Q?4vaR2LpwJa7lG5H7t6YVZOTk2K35gx3K6VZ9/ShS7NIX0kjiYNraqWdL7Erc?=
 =?us-ascii?Q?d4lZ1vgNatMfpcimK7evb8wgT9o4mSi1dGCYkKZ+FshNIhwccCrDB8q7NkLR?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56e6c02-ed39-434b-fbb0-08dd5cf6a007
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:34:07.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g3Yd9QNewsFQLOVIxFOILieuWJkiESM7VmT+oBxdqE+nE/fC98uYUbYQB5wyNjSRSmmQX5AWt/CNphBv1tmaBLXiiPe664S1w60SpTVA4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

On Wed, Mar 05, 2025 at 05:50:48PM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 2/25/2025 7:29 PM, Vinay Belgaumkar wrote:
>>+		{ XE_RTP_NAME("Disable DOP clk gating"),
>>+		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000),
>>+			       GRAPHICS_VERSION_RANGE(2001, 3001)),
>
>XE_RTP_RULES() does an AND of the rules, while here it looks like you 
>want an OR. Maybe use FUNC() helper?

A "OR rule" is also allowed. See:

	{ XE_RTP_NAME("14020756599"),
           XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), OR,  
                        MEDIA_VERSION_ANY_GT(2000), ENGINE_CLASS(RENDER)), 

Lucas De Marchi
