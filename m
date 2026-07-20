Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502B1C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 22:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025810E1FB;
	Mon, 20 Jul 2026 22:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV0YVJey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3B10E1FB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784587553; x=1816123553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=03vpLqrMxg0WXvJC4XkRfKwN5HpZA5UqkHcJTyWpCyg=;
 b=bV0YVJeyWusS/LU8i75oYxbsQeCz4ZWxA/D2Bcix3Z1BX/voPl83e7ZZ
 h6ggitHr/FyJYcpeHXTpun+bhXc7NJMvK5N+hChlxoTmqz47YPoVAFdX7
 vxSKr+QYO+47rugVKXSJiiMfPMfFuG27l6PK29KZXo7mOXeoScZfeNgnE
 GwS8X4MDBfBCMl2CDHxaL10+YroKdljsQg5k7l77Gd/MTS/eVNXKjxGO5
 jXdf02Tmw3e+gGwaxWxp47uwjmT0KPyOqqTbkS0NiqKG8K+u5ZS1k3S3u
 foLnpgz9K01G8eEsHu0wN1t3ouiz3MxNLP/8a/EShuLQ6JTOpZZG1UkDj Q==;
X-CSE-ConnectionGUID: 1BeM9kpXQ8+Ehxdg24e/EQ==
X-CSE-MsgGUID: zwttKgP6SfqvFaPQkCdseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85036810"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85036810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:45:53 -0700
X-CSE-ConnectionGUID: Y1ljStw3RWK7FZnVi7CdHg==
X-CSE-MsgGUID: +ScbJ3ubRqGCzxEsrfr/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="261861366"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:45:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:45:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 15:45:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2bGOqjTX99pRqjeC/omM1HD78zrMuUIZvDg9JjsgkgyJhJ9VNiNRff/te4A7Y2wXiq+Fk+v5LEwsDLgiIwilAu7s1JIF3n5+GjhGJ13nKBDwNgwlEJ8rfIQdyR8OcTyp/9g18aukxkAIjGOnD7rkFj/cAP4Admmx6H6zFc0U4IGOvE0atBEkwgVJgV9EGBaxZtWAfqGwygQCdoZbXPubWVX5Oi32/qYfiom+/rH8JRY7SfljxIdWfum3679qKpuc5cZyd4wps2SXCrlgyH3TJfg6n1FDA0lKr8GMZgegB45+XxkExOg8gOVlQWPELvKi7t8ojb4SLYcGebNi3pYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83jfCFWJoXmjyeI2GnKd+iUs9VQEd8zQKPVIwe4ps3c=;
 b=qLLkbPTU0X9oh1vfS1NCJC8tbzIIoQ2tXZKb1YT0C6KMrWl53wAoKXDCpAp3XRtM1gaDY0k3gRGEr/EjaKxeGIVfYAVeumZq7ZGNUL52rj3z6RHlXaRqNQugJjXi235yujBnaiI+bW7xHwzV49pdaphY7B9OAAew85eGiO4VQ8xKE6eSe/KwcYCNPjf6VlZJpzORuI+fMweBceIVOe1yG0O/tPx7uKTkoQBE04XK1JbjJ5Llb/BPPaikuUGlBvbA6PuS1AAKtt48qJ4Tcd1Rh9w5CVUiJ5QuOR1R7tJ9vXA7zbYgJ0MtaErImyK7ccUXoHmY/T2He9vNdOHYOISrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 22:45:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 22:45:49 +0000
Date: Mon, 20 Jul 2026 15:45:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Message-ID: <20260720224546.GE2327163@mdroper-desk1.amr.corp.intel.com>
References: <643b0f5b70e4635b5fdd0544e764fd4596ab6f93.1784062276.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <643b0f5b70e4635b5fdd0544e764fd4596ab6f93.1784062276.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b19f5f-3991-4516-6054-08dee6b0a4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uMYubxUEaQg3giibtSTLRevwwRsFJ3bYNoU+8ig5S594t5GMsYLVNMEsp+ItUCB5TLWhz5XHoCCD4SI7mVuSTiam+RQwYq7ilWKH+hjTXPc2NVfXGvkGxwQnItQxBq44JiQjLYWAhZWgqh6sgq33fnRsJV5DCDTJ3I81WEtvJJpX3+iwThUQym30v1sC9WeZx2WCX44k6hCSjNzxM9nc0pkJ9JBhF+WV4C7s0E8tv8TNwXvnmqwi5aHNcDgC05OW2HC0fJ80eGo+tIL2Tmtb9HPu8hp3qd2jZFMkR4EN/yQ7P2v1Rfhj1C9NJqbG7OP+FJiglIwS15lXRqh7s2OLE7ibDkDvtziR/zG1543VvWuOAP4cZUK7SD3+ue98Z9QNLCTf3flcJjF3KGa/dn7WLajVSmfGHPDMtC2vEe24y/gN0AwlP47gi9WVg7jf+WAC3TEUzTb+Nyz/Z1uC7R0WGg1q99PLP60L0V+tYkdy68bJdmb1YwzeYOtXKAiWZxZhu4ToXLNlNHPK0FFKNYNhKa9UInKdEkFhAwFvfkddW5OgcguMaF2X6GAI1SBsvw1ZIiDXNQqPRo//GoyOvx/v+jPdSkB3erynp9SWemtX2yC38BlyAmzv3HRLX9PtQRTMgsorXQfbCOj1/fpRbMJenS6wADxNREx6gZYQ/UJrLRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYVFvZwTW5tid1hPTlIGlOYzzkgDTuvhljzBtVK21VVCgiFw4psHuYOOwdav?=
 =?us-ascii?Q?Ai7Frlw1z5kKiKOe55xlA2PQonjvH8v1OgsuoFO0oJh6t4OYrigRaYU2kHJl?=
 =?us-ascii?Q?T3hdHi7Tg9i/rzrjeoWxnrDBcoqlbb8EsbnJbEEYaIEPl2puNZBhHpX5lKPs?=
 =?us-ascii?Q?I5xNHhEdOqwNhQPCE5wHSBfq59868Mgi0i7h7gAmUMWS/9DuL0Tg0hc3qs2z?=
 =?us-ascii?Q?OkbOc742mF2aTBmUXvEXw9xrygrIpQL6e5NXpcdfmEN9G0JGLB/1FOFfhjKR?=
 =?us-ascii?Q?2FgIoInjZ/LDe0JTcAQmntgS31kzVtLVCNnrSbiO13iWwzECFc6QHnGhVyD6?=
 =?us-ascii?Q?Q0jjsGzyuJ50fECWNgIKGGrvNtlCrxvy6VOWJDETGVop70jMgGf8RQwkfQ58?=
 =?us-ascii?Q?dB03lOpd8AZa9zgHQ0ih3Bn2cWeboCUDydbok833f/ctANxC6VOap12DNKX8?=
 =?us-ascii?Q?Euf6NtMADWQSQ7060XXoS7R+QjqrxmCwc30RH5tAhzVQscrWhmw0EBCn9L2H?=
 =?us-ascii?Q?zGBPor6Bdxm9gPH0lqim0S8JSr7F++Rz+qyyyrhrJs51S+pHnm1QOySycvkA?=
 =?us-ascii?Q?Sv/JMSir7zyQvwPP9/dHfNcTaHIXUGXflMfS5uOfKR9G4clId4xZ5f/D9ySt?=
 =?us-ascii?Q?Q20lnH5aPxxF1X53xG2jfiOfRYNHSb/jKqYoRrtYOAFdT05CSKQ7n1AG0IWE?=
 =?us-ascii?Q?U3FfdVLzztiMz76w4GKtTDooJxpU2HnMFRDsha1aWjp6XV+9YbbEVUei4GOA?=
 =?us-ascii?Q?HOVNPZrccDzcA/4hrAc8coRbKAQwPyOVU7e0FNafkqcn3SMpURsOoTntPEFl?=
 =?us-ascii?Q?bldey2DWASoQtBILnku/JMGn0QE7Zd6NRUH4C6oXu+4ZFOu+KBgGQ8RvA3SD?=
 =?us-ascii?Q?v2w8y/bCeqGQ4pe3bvZF52FYmSmcjP5K96D3QUQPf9RQYbM10luk1cJA5uH4?=
 =?us-ascii?Q?lKPshN7fyfWWBUNy/Q9MoRVsAvYOWEsZWumU6mFesvLu5eZZ9Hzcvfqkljmv?=
 =?us-ascii?Q?c7VAnGTEqnrBrrm3VqYFaJmXDvcj1YdssCsnddTSL9TUJ1Q1l4jUqXJXnRF/?=
 =?us-ascii?Q?hwbS4gGLPdJWGY3hkEk7D+YjYwtmF5pcDYOoDyI+MkYOGf7HTNTYq+PSDoKe?=
 =?us-ascii?Q?YCZrjTIsXtdHB7PFh1mwfQG/e41HBWdydhwJpLvyz7LNGH5CpEfw82CJQm3D?=
 =?us-ascii?Q?+ZGXdacVx49MZKvet+lewxgTm3WR4wV3uPYU24xbOaXVFihtgRPwmfkRDLXu?=
 =?us-ascii?Q?vKbs6R3fcuU2Gy6zOTMetBAyF1h3eqV5zA9KwGFa+8os+cSV5hsM0sVQul24?=
 =?us-ascii?Q?c//PEoZQna4NNAIS/5Sv++Xjb5z4/0/3XnBJO6N7KXRgv/1Jt4E+3DOta2sJ?=
 =?us-ascii?Q?wQN/Wd45bbG7q+eFrsSJa68kGAd75QEtofRF2LbYdp8psDg9KGYdCbzhyKAA?=
 =?us-ascii?Q?NvTAFyq01PckBzFmOUojSKhvRSxvMywryq/Iy9yZVM6ruIyOxNuFTu1XDk07?=
 =?us-ascii?Q?d22GjrJr+LDBkVzLUu07xd1QXvDe62hByv8tfCDmgr9U3LubVoOS9I5G8myu?=
 =?us-ascii?Q?tJ0kLbyG5+v9HYsV60FBdD7dVJxUpTLy03EA9hgOF/ge8m57FokO4H1HcU+k?=
 =?us-ascii?Q?vBsFwDakFdYENl8DVhLjbcrMXowGDNY41oGTE8/KdKQA8UFJyJ0xZ1iFkqIz?=
 =?us-ascii?Q?MvP58SwM8qpmz4B0+4Hi0G0OcfvXmGh+o76UGZNayU/J/PIFJiJm8HwZPeTy?=
 =?us-ascii?Q?niTcjzqeGOJJqHfCJfeRmjgADUeXM5U=3D?=
X-Exchange-RoutingPolicyChecked: cl+Yrry2LMYESaKgHPJ0TkUa/RXZ7iCVSS+xmcJfMULd+rJHG8dbsjKPxNH6iasZqKPmL61t1v6QuP1IvKvV/2SJLLODVqn/wzG3nsCxw0X9y8DgzUUxdCmPS1CIodp1Pyc9eeYX2TT3mQ1imAYRxugax170G/o8jyyb3Hp0xSu7xwyoau9KnY9Xd6RPYFY2GgewgL1ZYiMMa3sRmRZecpmI0ullZDNrpVnx1qQB/2G6ZCz5c29ATTIGV4wUHFtuCEpZVXHhoM7vQflVlQzdql3J/vGlbpreRmEh393PxqK+7fFKSa/zHSOGO05KkY5YjuVZr4VfJaVFWP6+mUjj9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b19f5f-3991-4516-6054-08dee6b0a4d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 22:45:48.9165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n3bRq5whupiO3HVcp4cgtbtsjMACmYgXv2y3GDLxL/71LSlYJkGYA1kg2xwEf+txsVY0RokbdmzSLrsSppnbD/bCE/LBILxB4E8pgIdvP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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

On Tue, Jul 14, 2026 at 02:03:41PM -0700, Harish Chegondi wrote:
> WA 14027054324 is implemented in the firmware and is applied before
> EU stall sampling and reverted after EU stall sampling. The driver
> needs to notify the firmware whenever EU stall sampling is being
> enabled/disabled so that the firmware takes the necessary action.
> The driver uses a scratch pad register to communicate with the firmware.
> 
> Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> register to request the firmware to apply the workaround. The firmware
> applies the workaround and sets the scratch pad register to 0x60
> as an ACK.
> 
> Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> register to request the firmware to revert the workaround. The firmware
> reverts the workaround and sets the scratch pad register to 0 as an ACK.
> 
> The firmware is expected to take about 1 ms to apply/revert the
> workaround. 10 ms timeout is used in the driver while waiting for an
> ack from the firmware to have adequate grace period.
> 
> Bspec update for the SWF scratch pad register is still pending, but has
> been confirmed offline with the firmware team.
> 
> Bspec: 53188
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
> v4: 1. Use xe_mmio_wait32() instead of read_poll_timeout()
> v3: 1. Make SWF_SCRATCHPAD an indexed register and move it to xe_regs.h
>     2. Use write instead of rmw to write to SWF_SCRATCHPAD register
>     3. Reduce the firmware ACK timeout to 10ms
> 
>  drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
>  drivers/gpu/drm/xe/xe_eu_stall.c   | 35 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ad93c57edd17..6ca8b1f2440c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,6 +7,9 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define SWF_SCRATCHPAD(_idx)			XE_REG(0x4f000 + (_idx) * 4)
> +#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)

Nitpick:  Since this isn't a true register field, I'd just move this
out of the header and down to the place where you define the REQ/ACK
values below.

> +
>  #define SOC_BASE				0x280000
>  
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index d37770c58c5d..ffeae6e09f58 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -7,6 +7,7 @@
>  #include <linux/fs.h>
>  #include <linux/poll.h>
>  #include <linux/types.h>
> +#include <linux/iopoll.h>
>  
>  #include <drm/drm_drv.h>
>  #include <generated/xe_wa_oob.h>
> @@ -20,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_observation.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> @@ -27,9 +29,15 @@
>  
>  #include "regs/xe_eu_stall_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  
>  #define POLL_PERIOD_MS	5
>  
> +#define REQ_EUSTALL_ENABLE	0x20
> +#define ACK_EUSTALL_ENABLE	0x60
> +#define REQ_EUSTALL_DISABLE	0x40

Nitpick:  Since SWF_EUSTALL_MASK is defined with REG_GENMASK, I'd also
use REG_GENMASK and REG_BIT for these values for consistency.

> +#define ACK_EUSTALL_DISABLE	0
> +
>  static size_t per_xecore_buf_size = SZ_512K;
>  
>  struct per_xecore_buf {
> @@ -682,7 +690,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	struct per_xecore_buf *xecore_buf;
>  	struct xe_gt *gt = stream->gt;
>  	u16 group, instance;
> -	int xecore;
> +	int xecore, ret = 0;
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -693,6 +701,18 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		return -ETIMEDOUT;
>  	}
>  
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to apply the workaround and wait for an ACK */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_ENABLE);
> +		ret = xe_mmio_wait32(&gt->mmio, SWF_SCRATCHPAD(0), SWF_EUSTALL_MASK,
> +				     ACK_EUSTALL_ENABLE, 10000, NULL, false);

Nitpick:  since the 10ms timeout is used in both the enable and disable
paths it should probably be a #define as well in case we wind up needing
to adjust it on future platforms or something.


Aside from the small nitpicks above, the rest of the implementation
looks good so with those changes,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt


> +		if (ret) {
> +			xe_gt_err(gt, "Timeout polling for EU stall enable ACK from firmware\n");
> +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> +			xe_pm_runtime_put(gt_to_xe(gt));
> +			return ret;
> +		}
> +	}
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> @@ -730,7 +750,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
>  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> @@ -840,6 +860,7 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  {
>  	struct xe_gt *gt = stream->gt;
> +	int ret = 0;
>  
>  	if (!stream->enabled)
>  		return 0;
> @@ -853,11 +874,19 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to revert the workaround and wait for an ACK */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_DISABLE);
> +		ret = xe_mmio_wait32(&gt->mmio, SWF_SCRATCHPAD(0), SWF_EUSTALL_MASK,
> +				     ACK_EUSTALL_DISABLE, 10000, NULL, false);
> +		if (ret)
> +			xe_gt_err(gt, "Timeout polling for EU stall disable ACK from firmware\n");
> +	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5d6574ec9dee..f02ac9bf7424 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -71,3 +71,4 @@
>  		GRAPHICS_VERSION(3511)
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
> +14027054324	GRAPHICS_VERSION(3511)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
