Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A1C7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79DE10E121;
	Wed, 25 Jun 2025 20:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/w970v1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9FC10E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750883974; x=1782419974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h95ZXkb7v2xyo+MGfPaDq5VEI7zYjRaGkvkfF5v0WAs=;
 b=e/w970v1bNvMbtmycCt5oWkuA/qA+SKfmPrFkK7tY+8P6EFbX0jBVlup
 dx9JdB/QLVFga4jy6GxW9B9quMAST7MB4AB2ec37oawtjeFtSRCdcpreX
 AD/sfT03uBjbzT915wCc0siH8ypjSYq+qH77GAqKhVPkEroGAs6Y1b3Yd
 bFtIsJtuq6z9l3WYlOlEfP6dRK9MpnVqvr72E71Uj8hu4rmkpG69Iikyu
 A67rADrfisAO3eGxfMz8rsW8aG6wsWoupS88GboWKoEHzdMk0brflmEff
 txVANGLBqqUVisoeV5PivhzChMIwAL+n/hy9UDB56Z0HFPDOPxCoVObrP g==;
X-CSE-ConnectionGUID: le+W7gAdTb2CVJKm9nRxqw==
X-CSE-MsgGUID: ONaiV0JWRjWGhcU8kz07Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53135281"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53135281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:39:34 -0700
X-CSE-ConnectionGUID: g7AiMVcjTjijZxRz0uuxvw==
X-CSE-MsgGUID: n1XxLYMYQVOAtZA7V3mFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="158081497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:39:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:39:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:39:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0Bh0EVEWVun16VHsUE2RfinSC9Sc51k1MKaNFGfNOpk4kzfeZJ2JjEAiYZxpomtrQKdj+LsdejrHUU5U06XSyUNCRW4Bt5sSPwvpzYr8lvH+PngphwS5J+K25anFkkPjrJBZXiCYkeCgYDV6VOCSjdLxC7a55Xpacw43QHKb0SJwogwKGCv7QJZKU2A0YoP7ukHQrlU8Bys+Ct+G8wOqK96CiNPyERRIY5DQOz1GGMk+7LgP7v1vpnYj0yTtjRq7xmY65utI2P2iDhL0l4SLhvsRAAEhbZePLA+nijPz3X/gXhFKDSVZOCxjx1sRY+9FdLV8HjxcJgndhaF3qPWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6OD6z64qVq/BtQmundXY+A7u64ClQ9r4ggPNPnLSLs=;
 b=gsi0GAzfhZkykM6mbmIGNZufauVXHYLmcsal882ACB7QhGBam2pdPUqKIfT4oJjZh5ulWXGPR0poejhkxz5uJcQ6mInTvhiHDtq4juZIMEc6aYnkutNwAGYasqj22blcVQ7hJIDsXGAejMSRFN+ZSftqZvAZb3q8Gib/B0f3QWV2BxFZ98TPALFW65mxJ4th+PdwDbzQ4F7JT4TafQiCjimKAUkh1pHkL3ffO20k1UTEUJA0L5oNmhLp3PemxpBhlYUBbOIsp+u5FExizyCBDlIyzakhd1KTA2yLWP25d+TkuT0LbFDQ5TflUHUsWLvCp9z6bObvU6UqTBx+agDT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB9352.namprd11.prod.outlook.com (2603:10b6:208:575::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 20:39:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 20:39:30 +0000
Date: Wed, 25 Jun 2025 13:39:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe: Add infrastructure for Device OOB
 workarounds
Message-ID: <20250625203927.GI4868@mdroper-desk1.amr.corp.intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
 <20250625193340.38971-3-matthew.s.atwood@intel.com>
 <20250625195104.GF4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625195104.GF4868@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 898ab06d-1f9f-44cc-0827-08ddb4286290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cuPvMOUt2J1g0Ymo/K9pFPhvYOOAhL2CxKa3K58Q2IMu/f7VjB5jKYvFUk65?=
 =?us-ascii?Q?e6Hokvebl0jjXIPT9Jzfb09ulZpBXXT/zE67TOqVNJmSC5u6BKxE4RoLOY1t?=
 =?us-ascii?Q?LEY0JlYEAEXQWWDEvHmHsgI0sLeCMx2sZhoYheblnhnY1DjOOqmKsFvdGwTy?=
 =?us-ascii?Q?YBDTCHReo8mgVpXVrrNnGVgHx8AUlUKZjuxCVEnOxJAR2V7dfo9JgvKuo/qb?=
 =?us-ascii?Q?PeyywabTaTM05YYteRm3UYCk7CGLf6z/xUYgsNlZCXXj7s03Tgk+BY55uXSK?=
 =?us-ascii?Q?33KkFphgO7yGhyvzRbzvDKiWKmm4nTI/BqZfQI5rK7VfF7zet/Z4uRmSUD/V?=
 =?us-ascii?Q?G0ZDzKjBnQ44Ll8WQOZb4wu8zDb2Iuondm4Z+aNXptXkkl21QYo6/gDmSr2y?=
 =?us-ascii?Q?8IA+MXZUnhsxPfpj2Vov/BeqmTvMtp7UrNXV7U1yvTz8Bfx5YWtlCWOYbAN8?=
 =?us-ascii?Q?/dbpdbAfmu1A784MaVMD76YJaHZE/IiVCMWhRxZvN6i8MeLE1RsTD7jr2lkS?=
 =?us-ascii?Q?5DmPnlPpfjnn6j/VVN1fo/zCnIPQuJ+s3D9A1lbrM3QL65F/be6dogaZeUPT?=
 =?us-ascii?Q?bstlrT9f//9E4On3//TM/ldddFCapzLijttUGn0F9w1wCZu/c6B0UCbwjQrU?=
 =?us-ascii?Q?j/8FiAHW7c6jVlQ6GSXoVvmZUUlguNm7vwyceFnxwvHGk2N9e5LJWhG+x5Qq?=
 =?us-ascii?Q?d7dFAIcRkQyU7z/ib7cZre//msgzx3HPgGNIOGtxDolcFmq5s3lkILn+48lY?=
 =?us-ascii?Q?E9KyTOSPk/Qp7d2t65G3jGJNX+GcMFmlkhyVZQQ7x0xKkf7OFM5bEYvOFEnK?=
 =?us-ascii?Q?6v7CBSsHYI/PHk2Po8M+Bnc4IyyJfgG3Byb+c0go8PJswW00DC7pfGAUDA/F?=
 =?us-ascii?Q?70JLNjSHy+lrWkJT+DE6M5iMUzqkaN/SieVcpzGSN/t29rxm7UBty4c+QErF?=
 =?us-ascii?Q?ka5LeBGHcjpH+FDCtDnQaHLycMM4R7QoHkIKqgsxLLrgsXSuJU/VrDd5QdCA?=
 =?us-ascii?Q?pNVgq/A9FWCYJYE3CE+yDFjEeJGO2nNZXC2vd3mcbud/Q0o6MUY0eNA0NN4c?=
 =?us-ascii?Q?lyk9//O8Z+/SJiWQkmPz0gwgUjydU/Wb713aUX350PQvG5L1QxqBhYFMap62?=
 =?us-ascii?Q?1PFq1DARyeduim7TyIO8sEzYgbtPkRiZbxEL3rixruF7MMuFAEowvrkV5/J8?=
 =?us-ascii?Q?pjSdVCeQ+yXI+Z3bc57GUnXlc9SbTRRJpt2VGSBrH/42HYVOHX2df2KYMlW0?=
 =?us-ascii?Q?8z1DnjnTm3H0Cf1cLurDJOBZI2DPG28pRlKMR/IQ6nVBSiB9GPetXnGQ8+vP?=
 =?us-ascii?Q?cBaSiPLMS9MkndvsSLuT+tQiXNseXYGw9SHjLBQPIxRotASriX0iYmMxON7R?=
 =?us-ascii?Q?yWrdLOeo2/tQ94yFWawT7LsrGSGOuQEJsr1LT6fbtsJM5Wh3MBq4yrkII2HS?=
 =?us-ascii?Q?k5z6N9BXIMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CTscbYEdR81zAAzbet8pM4Q2PaN6ze/Hs2zWv2LT81IekIj1j2r/X9ANP9AZ?=
 =?us-ascii?Q?aZUR3o/NxM19SuRFaI/ey7Vd8Me9Qjd1bUDdeNz3oFyCWXNO2SKkOn7nNo3k?=
 =?us-ascii?Q?gDzt3TGtLVLcyNIloaOV8TtxnvCs3NnJcwmTIzGtoVuCmma7VQOCsv2/iMvE?=
 =?us-ascii?Q?8irbP37ZkX3pIAIRGflrmMWRYRqQ2usBrKXtK40E/7sXNXrPxMs5ayiEXpSo?=
 =?us-ascii?Q?5V5uklLPU0IV54YN+lgmcib9tpXn7T9T2FxV7rE31bAm5LabuSjNW5xQ84YU?=
 =?us-ascii?Q?ko9DOyP7zRxjJEALQfVxHIdQNMgciX68H0MMDQVvD85x/gwRjXQayIbDgQjE?=
 =?us-ascii?Q?hbYuUtEftvCF8N2bNc1pY/VjeCa8oP81DHXKOsaliQp1Qpkt03ay6OZoqKZF?=
 =?us-ascii?Q?HKgLLrcFPpAzxkWjeO7mD+5BjKJl6eM+jNgS4Y/0XYaXf6F/dVpt920e9MFw?=
 =?us-ascii?Q?Ktgq6eiPi0WDFM8TOfYfz9zQILFExCr3g7fpKZ+ZBbpO8bQlvKfxvQDWMg1q?=
 =?us-ascii?Q?fA8gqRvH+dZ+KbXUNU55y47LntO2xdN7DehbyJGSAyQbeysTN6gUnWzRjkwZ?=
 =?us-ascii?Q?yrDUq95J44Pq/9/GzZdXD51Q9BxD+v02t97BlssjDu7Df9Z0mFW/VMcHyX/U?=
 =?us-ascii?Q?OQeRFIVZpT5y7+/81ELvlR88dFNx1t5YI9P0T0FyKH07wVi5HtDMzsYI1m/q?=
 =?us-ascii?Q?GiqMo1G0i4vSuRgT8TABksNmIWS9VVaaO6W9g8NAlD7zb17PlKY4qngWJdQk?=
 =?us-ascii?Q?slbN7NgxEdMVoLuZrYdMR0akf6yQMkk7jF4+gaTlh3cT9nBzJKXOXVfA/f85?=
 =?us-ascii?Q?xgwjm/F5dMv3eIhR+ZoCmj2JX272z9TBFMKmZne7+ZOrU/P7EQn8IEbb3vmC?=
 =?us-ascii?Q?D+pnQH8LFhr3LPvrwjN1PcUiJWWF1SoZ5m6zU2+3YHLFKIMsRsy5nNIjQXUq?=
 =?us-ascii?Q?DtNNKUJ/HqSDMUw/lX+KyzjlpsRWjCeTkA2r/ST05hdNMGysMkp3k10TZeGK?=
 =?us-ascii?Q?Yq7KkLjG6JVHCxypEWz0Iz1BBHZO2p3bTU08UXyBDK4y5/hIjgKvm01wAOJm?=
 =?us-ascii?Q?kpmviGmP9GeWLd5VP2IqWl2VjLNYEKiFD9dF4ipSBVhPUiP8jaEeFWLMr5qF?=
 =?us-ascii?Q?yKV8TmNtDgGlu+lWir99sv9XDMDv7uuOyNIH+i9Fcc19tfFMfeG/vb7S+em/?=
 =?us-ascii?Q?kK84x25suTk0KHTI6JCjYrtansUKgVBOyfxf/cJ6u8QpSYfRub6xgwZ8nTOk?=
 =?us-ascii?Q?U79c2U9BFUw+h9ssbW11aJglkXCd51HJqY2hOpoD0IXLMAxaQEt5jbDaziaw?=
 =?us-ascii?Q?xwrflAJKfN86YbVQNl0SmAM72bRLgxhOTdVdDw88c2+R0qLMFphkAX3X1SiR?=
 =?us-ascii?Q?eBPl8lfS3MOyLPg2JQbDXDoQ4WLolY4aRDZFt4NOaoQFSR4tXUfU90YvkHJZ?=
 =?us-ascii?Q?pSMJY/7pHS1KblsPEB9mZqziF+q3maYS30JNTwB0TD3SawSaR6nu8m84ja98?=
 =?us-ascii?Q?4fUp6M9zPfnYMvEugMiU3R3YEv2/z9eY9Vh1Ge5h8p8YJ1CZmJsHeEqHZvGd?=
 =?us-ascii?Q?xcDDDNDNT95x6jyXLP2M9B7ws6kGAlHCFgBnLYWcju46v/eXwq2sPY/8HOwR?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 898ab06d-1f9f-44cc-0827-08ddb4286290
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:39:30.2843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrCSnYJSAILxUwo0AqRZ40gkr+QIGxit9ERTB0uUFQR4DczKVKPqBFbVGCrDsxOC/rPAK/on1wrKMIgIwa9JqFrTkqTEkftf3S1ARh7v5d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9352
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

On Wed, Jun 25, 2025 at 12:51:04PM -0700, Matt Roper wrote:
> On Wed, Jun 25, 2025 at 12:33:37PM -0700, Matt Atwood wrote:
> > Some workarounds need to be able to be applied ahead of any GT
> > initialization for example 15015404425. This patch creates XE_DEVICE_WA
> > macro, in the same vein as XE_WA. This macro can be used ahead of GT
> > initialization, and can be tracked in sysfs. This should alleviate some
> > of the complexities that exist in i915.
> 
> I'd be inclined to break this into two patches:
> 
>  * A patch to RTP that adds devices as a new type of RTP context.  This
>    should also add WARN_ON guards for all of the existing RTP rules that
>    require a gt (similar to those that exist for engines).
> 
>  * A patch that adds the the the tracking information to xe_device and
>    calls the init/process functions at the appropriate place.
> 
> > 
> > v2: name change SoC to Device, address style issues
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  9 ++++++
> >  drivers/gpu/drm/xe/xe_pci.c          |  4 +++
> >  drivers/gpu/drm/xe/xe_rtp.c          |  5 +++
> >  drivers/gpu/drm/xe/xe_rtp.h          |  3 +-
> >  drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
> >  drivers/gpu/drm/xe/xe_wa.c           | 46 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa.h           | 18 +++++++++--
> >  7 files changed, 83 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 6aca4b1a2824..62f09d2923c3 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -360,6 +360,15 @@ struct xe_device {
> >  		u8 skip_pcode:1;
> >  	} info;
> >  
> > +	/** @xe_active.oob: bitmap with active OOB workarounds */
> > +	unsigned long *oob;
> > +	/**
> > +	 *  @xe_active.oob_initialized: mark oob as initialized to help
> > +	 *  detecting misuse of XE_SOC_WA() - it can only be called on
> > +	 *  initialization after SOC OOB WAs have been processed
> > +	 */
> > +	bool oob_initialized;
> 
> Did you mean to wrap these in a sub-struct?  Because right now the
> kerneldocs don't match the actual placement.  Also the "SOC" stuff is
> outdated.
> 
> > +
> >  	/** @survivability: survivability information for device */
> >  	struct xe_survivability survivability;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 824461c31288..a9f708608f3e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -32,6 +32,7 @@
> >  #include "xe_step.h"
> >  #include "xe_survivability_mode.h"
> >  #include "xe_tile.h"
> > +#include "xe_wa.h"
> >  
> >  enum toggle_d3cold {
> >  	D3COLD_DISABLE,
> > @@ -832,6 +833,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	if (err)
> >  		return err;
> >  
> > +	xe_device_wa_init(xe);
> > +	xe_device_wa_process_oob(xe);
> > +
> >  	err = xe_device_probe_early(xe);
> >  	/*
> >  	 * In Boot Survivability mode, no drm card is exposed and driver
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > index 29e694bb1219..2a0b0a1a8969 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > @@ -196,6 +196,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
> >  		*gt = (*hwe)->gt;
> >  		*xe = gt_to_xe(*gt);
> >  		break;
> > +	case XE_RTP_PROCESS_TYPE_DEVICE:
> > +		*hwe = NULL;
> > +		*gt = NULL;
> > +		*xe = ctx->xe;
> > +		break;
> >  	}
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > index 4fe736a11c42..ac260feaabef 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -422,7 +422,8 @@ struct xe_reg_sr;
> >  
> >  #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> >  	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
> > -	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
> > +	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
> > +	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
> >  
> >  void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
> >  					       unsigned long *active_entries,
> > diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> > index 1b76b947c706..123579ebf2cf 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> > @@ -112,12 +112,14 @@ struct xe_rtp_entry {
> >  enum xe_rtp_process_type {
> >  	XE_RTP_PROCESS_TYPE_GT,
> >  	XE_RTP_PROCESS_TYPE_ENGINE,
> > +	XE_RTP_PROCESS_TYPE_DEVICE,
> >  };
> >  
> >  struct xe_rtp_process_ctx {
> >  	union {
> >  		struct xe_gt *gt;
> >  		struct xe_hw_engine *hwe;
> > +		struct xe_device *xe;
> >  	};
> >  	enum xe_rtp_process_type type;
> >  	unsigned long *active_entries;
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index f51218a7a580..2cb2fab20070 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/fault-inject.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> > +#include <generated/xe_device_wa_oob.h>
> >  
> >  #include "regs/xe_engine_regs.h"
> >  #include "regs/xe_gt_regs.h"
> > @@ -876,6 +877,13 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> >  
> >  static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
> >  
> > +static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
> > +#include <generated/xe_device_wa_oob.c>
> > +	{}
> > +};
> > +
> > +static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
> > +
> >  __diag_pop();
> >  
> >  /**
> > @@ -895,6 +903,39 @@ void xe_wa_process_oob(struct xe_gt *gt)
> >  	xe_rtp_process(&ctx, oob_was);
> >  }
> >  
> > +int xe_device_wa_init(struct xe_device *xe)
> 
> We've been trying to be better about naming functions from xe_foo.c as
> xe_foo_*().  So these new functions might be better with names like
> xe_wa_device_init() and xe_wa_process_device_oob() and such.
> 
> At some point we should also probably go back and rename the existing GT
> functions to include 'gt' in their names at the corresponding places.
> 
> > +{
> > +	unsigned long *p;
> > +
> > +	p = drmm_kzalloc(&xe->drm,
> > +			 sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),

Overlooked this before...this winds up working because the size of a
pointer (xe->oob) is the same as the size of an unsigned long.  But
logically we want to know the allocation size of each long in the array
here, so passing either *p or *xe->oob would be better (preferably *p
since that matches the coding pattern used pretty much everywhere in the
kernel).


Matt

> > +			 GFP_KERNEL);
> > +
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> > +	xe->oob = p;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_device_wa_process_oob - process OOB workaround table
> > + * @xe: xe device instance process workarounds for
> > + *
> > + * Process OOB workaround table for this platform, marking in @xe the
> > + * workarounds that are active.
> > + */
> > +void xe_device_wa_process_oob(struct xe_device *xe)
> > +{
> > +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
> > +
> > +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->oob, ARRAY_SIZE(device_oob_was));
> > +
> > +	xe->oob_initialized = true;
> > +	xe_rtp_process(&ctx, device_oob_was);
> > +}
> > +
> >  /**
> >   * xe_wa_process_gt - process GT workaround table
> >   * @gt: GT instance to process workarounds for
> > @@ -1000,6 +1041,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> >  	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
> >  		if (oob_was[idx].name)
> >  			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> > +
> > +	drm_printf(p, "\nDevice OOB Workarounds\n");
> > +	for_each_set_bit(idx, gt_to_xe(gt)->oob, ARRAY_SIZE(device_oob_was))
> > +		if (device_oob_was[idx].name)
> > +			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
> 
> This function generates the contents of a per-GT debugfs node.  We don't
> want to stick device workarounds at the bottom of a per-GT entry; we
> should probably have a different debugfs entry outside the GT hierarchy
> to report these.  That would also ensure that we can track device
> workarounds on platforms with no GTs and no GT debugfs (that's not
> something that exists today, but there's been a lot of interest in
> letting igpu's run in a "not GT" mode for debug purposes, so we'll
> probably have it eventually).
> 
> >  }
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > index 52337405b5bc..09d065e0abb5 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.h
> > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > @@ -14,7 +14,9 @@ struct xe_hw_engine;
> >  struct xe_tile;
> >  
> >  int xe_wa_init(struct xe_gt *gt);
> > +int xe_device_wa_init(struct xe_device *xe);
> >  void xe_wa_process_oob(struct xe_gt *gt);
> > +void xe_device_wa_process_oob(struct xe_device *xe);
> >  void xe_wa_process_gt(struct xe_gt *gt);
> >  void xe_wa_process_engine(struct xe_hw_engine *hwe);
> >  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> > @@ -22,14 +24,24 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> >  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> >  
> >  /**
> > - * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
> > - *         other more specific type
> > + * XE_WA - Out-of-band GT workarounds, that don't fit the lifecycle any
> > + *         other more specific type,
> >   * @gt__: gt instance
> > - * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> > + * @id__: XE_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> >   */
> >  #define XE_WA(gt__, id__) ({						\
> >  	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> >  	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> >  })
> >  
> > +/**
> > + * XE_DEVICE_WA - Out-of-band Device workarounds, that don't fit the lifecycle any
> > + *         other more specific type
> > + * @xe__: xe_device
> > + * @id__: XE_SOC_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> 
> The "SOC" here is outdated.  Also the wrong header is referenced.
> 
> > + */
> > +#define XE_DEVICE_WA(xe__, id__) ({					\
> > +	xe_assert(xe__, (xe__)->oob_initialized);			\
> > +	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->oob);			\
> > +})
> >  #endif
> 
> This is probably fine short-term, but I think eventually we should just
> have a single XE_WA() call that _Generic()'s on its parameter to do the
> lookup in the proper place (gt or device).  If we don't want to _Generic
> it for some reason, then the existing macro should probably get renamed
> to XE_GT_WA() to clarify its purpose.
> 
> 
> Matt
> 
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
