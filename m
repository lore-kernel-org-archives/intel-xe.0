Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6067C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 21:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2462A10E17E;
	Wed, 26 Aug 2026 21:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXeT7l7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8D810E17E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787778653; x=1819314653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Dn2mQWDDn4GzcNjFVheD81W277Z0LlW3LWcI1L/Dxis=;
 b=mXeT7l7gRD/Bj+gD+9K1N8nizEkvKzkforCgFsbWwWIiFc7nIlHRCLPx
 1a+N4RDo9rcelesKYHtmLSbVBEhc6zqLZ54DOMF9Df0HOIbFzMpT3nT4F
 sceFaH95lzk6j0DzkEWuwoGW9bOMh0OX/YZUBLJxDX9J/hwYV4xv3/nBL
 Vq+VLsC4wl2BNcBysCq9HmWq0fvrKyyaoKMaf3ce+vgxyDdpqdDSPyzEt
 XY93Wku08/3/NbMUVd+4QMNTOOvc74G9fyYuHwIBORrsrDa75SG61+eXd
 h8xU8dKeIHsBkqyMgC0C5l6WvKVJOyFh8pFGHuXxeS4EPSiG3b9LsukUo A==;
X-CSE-ConnectionGUID: pYhxQqJNTmyHXXLncg3RUg==
X-CSE-MsgGUID: Eha8WC80T7K5oZQJgxG2Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88299455"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88299455"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:10:52 -0700
X-CSE-ConnectionGUID: mzLfdTCHRtGPTRJBT9OH8g==
X-CSE-MsgGUID: GXI25kclSOyTDLUMrpVnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265087116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:10:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 14:10:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 14:10:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 14:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE/JFiHq6yCxkzOI+pv6qIo7suS5fqoLin1le6TnLnaniEUvWa9DwhYsUkxzsCcleAhQiFirAczzvYpk5lFmzMAP5slbbSjbK+hn4NR5hVk8+WLfrjDtSynEx/Q3CSurL2dlpybOZapkYezwBN+K3FKGMWdEfHKHXraqTyeFv2819Wb0mpdUoom6uOf/cZDS5UkMNsVGvLhCYAzZHw09KEqkLw5Ca/9bVs8z8utA5XoaMRsYcT2MG5afwLc8If+VS19GsqGavBQGDv+MO+ePSGfXZEaF5tVNUtnuOSIkqVdtYW26MhGn8xVn6paR4QE9NY4a7jnJ3pkWQdvl12xpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOE4RtcJa7mBDeGXA3rV9/sPYOVssRcc6hAZhgVepcE=;
 b=WRQEB739qzyLSOmHr+eUefejCacj5TMy9whvTJvRlfTvFvzbN29IhJBqMJq57Xnk+HKKzJFjMgN074ZH1YFRSDntGjlZJFsxUl4/d/s/hWypns+zvdUtZIyU2PENEK4mbwRdMsQ3jCeks27NzTh10xLwLJ8FZ11RvIJSXoDJkwWY9tzmt0mMt8lkWvhd+6WB5XuY4g5J1JPlPQ+kPXMV1zFGnwZaB14kPlhwREN5TURom0WH0pLFPMsr98ueV4ie/XRc1EJZlQGDjjy0vpZ7EawnvyWw8h2I2JDcHRDRlIvNY3N04su0R2Py5cRI+i/kPja3McvJ6ukuVnKQtYduKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by IA4PR11MB9202.namprd11.prod.outlook.com (2603:10b6:208:56e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 21:10:49 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 21:10:48 +0000
Date: Wed, 26 Aug 2026 17:10:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
Message-ID: <ao9WVAcHmROhGq8E@intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825114450.1371821-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|IA4PR11MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: caafaf2e-6c33-4ff0-5fdc-08df03b68094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|13003099007|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: Qhv4MrT6siQFC8PNXOZ19zoNBP/UTYBhHyTwtyBcjSpmje1aEZo/xtjAoExawd6JIaJK2uaBpI1af4t8O5zlMMjpnMGjU3ysHzks4Px3MhVd2HT6vJB98Rkf+x4aY5jSSL68b2fsjMyXFfWjzo3sDknI/9ttH376nNQb11XGBDe43ASYmUjMku60sGZL9bzEXmVGHn5nVhu5vTRh9Z5ivpe1umqnltNFqWid5U3762Cmbo62HSMzmCLAqaZTVc541HwTU77zdE0M3SN2c4iRCbzEmvnRltte63mrwLNKEpgeSH1L1ImCY7InGu/tYQxCC8MlfYOHccQeWGBi30y1jQ/J2AeTInsksQSx13mfaaet+3CxdCq986KnC1QuFc8xNiXwrVBh9wF2ZLdz/HQPFPNud9e0NfufdrqK6I5y+su/TGJWY1EfK5P+bJ6f/I6OF3yiZKZ29zc3Kg1Lz7G9B2WTF+i2Q4yzO7HcCaqHk9ge5aHxxrSzL3eh99qU7V3hbvNQpHafF0W2dIUUCqCMrgRcX0rj5HjgKqj+1nA6G1W95lcKSNeIYUc9UgDpWV7YJ5XAfXx9xMf9BsqCIh13UdoAkIvIPC/+s+1UuHSSBaLZUBdSjR3ERdEfN2Fud+88
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(13003099007)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2NzMW/KnHuyFDKOO55qYVTBfty4wqiuzleOa3LJCc8RYIqxFJGHGYAEXLw?=
 =?iso-8859-1?Q?/WcklJiTtnbprlqkqKNeFsZ2e5ipsds7jhdMGNkUR/v75qdSnP0X8pTcjX?=
 =?iso-8859-1?Q?uTqA98D+N4z7mnXyRZWt5g99xhM0P2sAzutLHHNjFRM8xaMN7IbU/Vyr36?=
 =?iso-8859-1?Q?BxeeAIeoFHqSxswcVlSddV6vTaHEmq01Isn1YHZPPeUPba3eaa972TgmSp?=
 =?iso-8859-1?Q?5Gypuns9uGDAuWIOoJdjmlZh4UhSL03hRZoBzmb/q1505OMtXELbYSRTxs?=
 =?iso-8859-1?Q?BuZQyGkv9Y28HcM6cU+fA26R1aGjE+Z2u5o6ezPPwAfF22R/UoWYO+KZrU?=
 =?iso-8859-1?Q?z3F7MuSJ0ijE4RPCdhGG3/GLONjdVXhlUpNy7rWBqOQteASK8DQez5v98/?=
 =?iso-8859-1?Q?G2l+vBXzfIkCk1nJt+bsOVjaXJGHRbBMV27svdvBiTw/1KtkPNxsToYiln?=
 =?iso-8859-1?Q?SIABr2xAeFhtdHGeUyJ/cdDCLcg10WgTLeClkFfkXEF1aJDFugzci4vL+o?=
 =?iso-8859-1?Q?FRPL0j4c+iXN+rRaGMDFay54lkgdNxnbjQR6yDjJpKKHK0lLuoUZD9quhB?=
 =?iso-8859-1?Q?MbzVw0f1fB+GMAjVpfE/3ZkoFxmSugFJUCgrTEE3DtgeshbFLJoG3NOrPp?=
 =?iso-8859-1?Q?svB1gs1hSzN48FlZtmrB31q5EHLUiSdezkatTodkLoUo/D2+rL/4z5de/k?=
 =?iso-8859-1?Q?r/IXQhQm+g3//l19UNzuHWGJ3H4w0BOcTw2uGaP8AhhaFskyGNbLOHkAys?=
 =?iso-8859-1?Q?+4SlscN12RsyqJJDr0STmjVxmykksnDnuK8lIX1RBYBxGV6loMX1ZtpikX?=
 =?iso-8859-1?Q?fprxqWgq9xCT4386kDnIcAj/5lRCOzpKONkWBQeUCEiHyBwNuJz+xa9lEd?=
 =?iso-8859-1?Q?fpSAJeJLaRqd6D8lDAY32f5CkN+KZ0s5qdAQQ0JY2b/BvNgcwmK+lKV4zv?=
 =?iso-8859-1?Q?r+4kAoPlFupjS3DvEtbHRlwPBpGY9Q1qCeDfAawkP5jXmyXcdJL5YEHlDy?=
 =?iso-8859-1?Q?iucm4thY0AtU7FgrbBQf5V5daZHbCU+NfUqkafqYXYLuR/bv/33bM4Vhgm?=
 =?iso-8859-1?Q?AKN29xJEKNF3e0Q5qFW89V2HW9nDkHEcROAL6MGaCcjLoGYpfPaxStheEy?=
 =?iso-8859-1?Q?GGMsK95w1ZcPcatN0yymJZc30K1ffmYNSqmIj3T9lXXhDcw2E8H6AwArTW?=
 =?iso-8859-1?Q?o8wMpt/2xYauZ3YqTbkrmhB8v6LPe0P1M3wZXLV6lyeMm6DbvfFdABSU+c?=
 =?iso-8859-1?Q?Uj4a3RI78eRd1dExnUcLwSNXuG1y7KJi2GJHSvB4nh64zjQ3spt6YN7ahH?=
 =?iso-8859-1?Q?yqv5soRRptvwattUTvw+V/4tPxwddNLVE165nqG0XPRIFWYXbw2XpMfs03?=
 =?iso-8859-1?Q?nrGFjsoymo/9rzf0iY9xSmiI4wWzhBH1k6FTvxZOb/oEbAwOISE2ucZLAn?=
 =?iso-8859-1?Q?EI5o5f0ZwSGo7Yggcz2CA5mb4pLkXQ/mVO9ba+7axpbSBvAMwLGBdF35My?=
 =?iso-8859-1?Q?AbkNKEWx8aiKbaHnW4m3mLUgWyxFdNBeTUNRioi4zOqhFpkgvftVqt4+lF?=
 =?iso-8859-1?Q?dbiN7yrZg9NeigU4L1Z/xm9Urov0SJ2bmVRFf/UjCMeSz6FyLdXdfg2VhN?=
 =?iso-8859-1?Q?Nek6Sy25l6wPnfy1tHGkQRvprpAM8GF2O9IycqoCJJdVu8fKm9RD85MG6x?=
 =?iso-8859-1?Q?0gCYURRd0duhk0lsm87brycfRkug1qFtCDf/38+Pydm6eQJRlIWmtYn3AF?=
 =?iso-8859-1?Q?JKnHuFIckjrsh6KfWklQA2GHOXYDwjI+TItQPG0X8Lh0RG8zaMkX2QXe/n?=
 =?iso-8859-1?Q?SUYlr/JKBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: gNc9b3skNitoN6K96AD0rDvOQsdqr6dJvQFl8HzFzWuSbW+LzKG2uSUy/Y8VkA/bHy1eGSeblMKsaXjavbn4SkDlDEdNLLLzHWFu9Brd/UQ5UI5CoYkpMdb7IjU78Xfg2jInRd5MrNJzYCn6r/pXn5iyCtTezGZfSNxWKIjso1o5cx3vpLmVKWiabdNsvZ9I3jKUkveJa9AJpG68L1RORNG4HmPbT2seW34l5dlwQA3pV+i8sE7PdjEzRLc0EsoPICNlrHPWbwXIjMK92g7NLAPYN5tTyj0znaVQ7stYbWsbIPYT/I9MJisZ8kJL3hDFKPRlr4P5WC3z1RB3j20ivw==
X-MS-Exchange-CrossTenant-Network-Message-Id: caafaf2e-6c33-4ff0-5fdc-08df03b68094
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:10:48.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxnvSBxXWSo/RD5OHEUcjxnrY/Y6mUBQNuG7X9BpzDZYqGkH7e1+RyLT4ONLtMXt1yOCRqzOZsDYApc/aFg1WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9202
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

On Tue, Aug 25, 2026 at 05:12:43PM +0530, Raag Jadav wrote:
> Consolidates all wedging implementation into a dedicated xe_wedge
> component. While at it, add a worker to schedule the wedge handling to
> be done async making xe_device_declare_wedged() safe for atomic callers.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> PS: The original intent was a bug fix, but that's just a matter of opinion.

I had thought about this spin-off a very long time ago too...

But please, split into 2 patches, one with the consolidation and one with
the worker. This one is painful to review as is right now.

Also, please use 'xe_wedge_' as the new prefix for any non static functions.

Thanks,
Rodrigo.

> 
>  Documentation/gpu/xe/xe_device.rst   |   2 +-
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       | 172 +--------------------
>  drivers/gpu/drm/xe/xe_device.h       |  11 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  19 +--
>  drivers/gpu/drm/xe/xe_wedge.c        | 214 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wedge.h        |  24 +++
>  drivers/gpu/drm/xe/xe_wedge_types.h  |  25 ++++
>  8 files changed, 271 insertions(+), 197 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> 
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index d3a022362ade..8baed81580c9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -6,7 +6,7 @@
>  Xe Device Wedging
>  ==================
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
>     :doc: Xe Device Wedging
>  
>  ====================
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index adc2de37e768..c739a50b6896 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
>  	xe_vsec.o \
>  	xe_wa.o \
>  	xe_wait_user_fence.o \
> +	xe_wedge.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_I2C)	+= xe_i2c.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..d3a7034fac01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	 */
>  	assert_lmem_ready(xe);
>  
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +	xe_device_wedged_init_early(xe);
>  
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
> @@ -924,14 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
>  	}
>  }
>  
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  {
> @@ -1148,7 +1137,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>  	if (err)
>  		goto err_unregister_display;
>  
> @@ -1394,163 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
>  
> -/**
> - * DOC: Xe Device Wedging
> - *
> - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> - * be used. The conditions under which the driver declares the device wedged
> - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> - * default recovery method for a wedged state is rebind/bus-reset.
> - *
> - * Another recovery method is vendor-specific. Below are the cases that send
> - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> - *
> - * Case: Firmware Flash
> - * --------------------
> - *
> - * Identification Hint
> - * +++++++++++++++++++
> - *
> - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> - * admin/userspace consumer about the need for a firmware flash.
> - *
> - * Recovery Procedure
> - * ++++++++++++++++++
> - *
> - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> - * the below steps
> - *
> - * - Check Runtime Survivability mode sysfs.
> - *   If enabled, firmware flash is required to recover the device.
> - *
> - *   /sys/bus/pci/devices/<device>/survivability_mode
> - *
> - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> - *   firmware and restore device to normal operation.
> - */
> -
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
> -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> -
> -/**
> - * xe_device_declare_wedged - Declare device wedged
> - * @xe: xe device instance
> - *
> - * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The method can be set using
> - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> - * is set, reprobe (unbind/re-bind) will be sent by default.
> - *
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> - */
> -void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	u8 id;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> -		return;
> -	}
> -
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -	}
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> -
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -	}
> -}
> -
> -/**
> - * xe_device_validate_wedged_mode - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> -{
> -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> -		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> -			mode, xe_wedged_mode_to_string(mode),
> -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EPERM;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_wedged_mode_to_string - Convert enum value to string.
> - * @mode: the &xe_wedged_mode to convert
> - *
> - * Returns: wedged mode as a user friendly string.
> - */
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> -{
> -	switch (mode) {
> -	case XE_WEDGED_MODE_NEVER:
> -		return "never";
> -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> -		return "upon-critical-error";
> -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> -		return "upon-any-hang-no-reset";
> -	default:
> -		return "<invalid>";
> -	}
> -}
> -
>  /**
>   * xe_device_asid_to_vm() - Find VM from ASID
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6c4cfaebc44a..c984972bd0f8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,6 +11,7 @@
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_sriov.h"
> +#include "xe_wedge.h"
>  
>  struct xe_vm;
>  
> @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>  {
> @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>  }
>  #endif
>  
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> -
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..f307d7e5e6b6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -30,6 +30,7 @@
>  #include "xe_sysctrl_types.h"
>  #include "xe_tile_types.h"
>  #include "xe_validation.h"
> +#include "xe_wedge_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -45,22 +46,6 @@ struct xe_pxp;
>  struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
> -/**
> - * enum xe_wedged_mode - possible wedged modes
> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> - *	when critical error occurs like GT reset failure or firmware failure.
> - *	This is the default mode.
> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> - *	any hang. In this mode, engine resets are disabled to avoid automatic
> - *	recovery attempts. This mode is primarily intended for debugging hangs.
> - */
> -enum xe_wedged_mode {
> -	XE_WEDGED_MODE_NEVER = 0,
> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> -};
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  /**
>   * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> @@ -534,6 +519,8 @@ struct xe_device {
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling to be done async */
> +		struct work_struct work;
>  	} wedged;
>  
>  	/** @devres_group: devres group */
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 000000000000..52d4661a2dee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_defaults.h"
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_log.h"
> +#include "xe_module.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_wedge.h"
> +
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the cases that send
> + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> + *
> + * Case: Firmware Flash
> + * --------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> + * admin/userspace consumer about the need for a firmware flash.
> + *
> + * Recovery Procedure
> + * ++++++++++++++++++
> + *
> + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> + * the below steps
> + *
> + * - Check Runtime Survivability mode sysfs.
> + *   If enabled, firmware flash is required to recover the device.
> + *
> + *   /sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> + *   firmware and restore device to normal operation.
> + */
> +
> +/**
> + * xe_device_set_wedged_method() - Set wedged recovery method
> + * @xe: xe device instance
> + * @method: recovery method to set
> + *
> + * Set wedged recovery method to be sent in drm wedged uevent.
> + */
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> +{
> +	xe->wedged.method = method;
> +}
> +
> +/**
> + * xe_device_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}
> +
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The method can be set using
> + * xe_device_set_wedged_method before declaring the device as wedged. If no method
> + * is set, reprobe (unbind/re-bind) will be sent by default.
> + *
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> +		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> +		return;
> +	}
> +
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		xe_pm_runtime_get_noresume(xe);
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);
> +
> +		schedule_work(&xe->wedged.work);
> +	}
> +}
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> +		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> +			mode, xe_wedged_mode_to_string(mode),
> +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +void xe_device_wedged_init_early(struct xe_device *xe)
> +{
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +}
> +
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 000000000000..fedb30c99398
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/types.h>
> +
> +#include "xe_wedge_types.h"
> +
> +struct xe_device;
> +
> +void xe_device_wedged_init_early(struct xe_device *xe);
> +int xe_device_wedged_init(struct xe_device *xe);
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> +void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> new file mode 100644
> index 000000000000..ffe7f9c64166
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_TYPES_H_
> +#define _XE_WEDGE_TYPES_H_
> +
> +/**
> + * enum xe_wedged_mode - possible wedged modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + *	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
