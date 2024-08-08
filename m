Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B88C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 19:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87A10E04B;
	Thu,  8 Aug 2024 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vs0oAbQ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEEB10E04B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723146685; x=1754682685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ahcXJl1cZAH4fTGyHacZ+84DR2tHRwmoPWMPpfYvKg4=;
 b=Vs0oAbQ7cWPUwjfxc3n/RbSG+Yp0LHdmOcCO5z6aVJFFxj/QqcWCc74e
 fGGjXEB+3dKjZ5v+I6WAC+or6RgJFGSbLlMLzpyAIccyvEZHvDQrHpcSW
 2RXWN4q8bq+aBIcMs+otGc4UzBaTUFhUvynfAk5glBD4Ilxm6AoGcJGxv
 jIQnVXrdmJ+N5OKS5H/lPpdc2SFSCwp1dQfc/4FQPFRlubOrxa6A+D0q2
 58LqVu/qkeyuRtSSrBG+GEXd8ZMvpjlA1zjjPAPebd+jMvdB9Fz1VWGpM
 KW6U9WilamRiox8973YF8vKWrMiL8TK/E5y0A5uESZxLycp50pi864lGn A==;
X-CSE-ConnectionGUID: cCXM31m5RC2YcBoTmq3KVA==
X-CSE-MsgGUID: PkpV1XuVQ7+Lzxf39abAZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25066235"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="25066235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 12:51:24 -0700
X-CSE-ConnectionGUID: jWOAcLfVSje6vfrJb0GmoA==
X-CSE-MsgGUID: 4CR/cEigSUGiK0BP3/SRVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="94859885"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 12:51:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 12:51:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 12:51:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 12:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpUjQoIOMGlvcZ4H6RT7fGsdWCfZiUHuS0+xa+FXnF4mlXCBla3Sw9EIZsjq/P/cTlZ0vIpNJkHQb6PUn2L5usECCubccmbtSJxScZNO16F3yrbv1ELRgcUI/dPDaYVYMqb+5PR437UlsuBDTc4Y3JcOclqJJOes8y/fgTT+yUx9IkQhTCqAlBqlucw/1erHHiX/dU7WfwevYvt9502fFsJWZ3hz/6fcx6hmlTshC2mTuEj4yvj6tf4hN62wM+aUmK/E81b1/JByMegg//hLXNhnqhZrJaV/fv3EYrJSfil0L1GI5rJmxyJwQs8X0ByHWBxRKv92eg58NbeKqdXwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6evHws3mmIUUxRFZCHLzmbBScI3OxbxDFCOl/hEZCII=;
 b=YjrQ+OfL3B3rc3eTvFli4jD8s28Nc2Fu5/XCfL4VoHbbguGYEq3D1f2XYtMWEJIvMlY2CFBJYqlJzGbYJRsqwvW/H9qsFu4akUZIP0ZP/54UW1CIoiPsFYWVtpDnX8Ey3ZkBrZC+4etkSOBgExEH+3jZYEz+EAXmiZT/VW643rcjO8KeNL8HaFVb2tuMQAWLO8/jQlky3wiTlRwuyDIJdsZCc02QrjsFY9WYV8Gd2fIwK5+okLk8T+IAsCuNBrgZIfH8A91jVMOnF/9Ws3wJ9nNPoHCYXr5elc1ochO18rlLUdGT+7ebSp9WPVOUMEfpCnIqbr4iW5t4mvHywkWkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7771.namprd11.prod.outlook.com (2603:10b6:610:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 19:51:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 19:51:20 +0000
Date: Thu, 8 Aug 2024 12:51:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Message-ID: <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
 <20240808092826.585276-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808092826.585276-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 226e469a-f1b2-446a-b169-08dcb7e37922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jVhAGcgEg4yvoC4NmFt4Jd5Oo1vFXuJcLGlapRKapMnO07TKwlaOMkpLOhU2?=
 =?us-ascii?Q?hlWX/V1qroJzJXBl3Jy3frLtbilMDhJOm8epDGL1exgkeuRij3s859lsEaeK?=
 =?us-ascii?Q?ZPk5bFSAGByCysb451uAfoxUpAlo4SnxhzKpQaXpY0LP3E3j0m3p082irz01?=
 =?us-ascii?Q?8BaFDT8TzZq4Hf5Y2WCidNwLhH7LfLtUsPiCDCBCY4z7ph8ljHs7YqIfMIZ6?=
 =?us-ascii?Q?JpXBJ+9fqSXRNeK0wahsmJRV6LUQo8hNwTIQXFim8N87CU37AHa1blkCcr5x?=
 =?us-ascii?Q?65PegEY3y4/7wYBHSExaUo/inF2QKC29BDDFd/v6atUiZNh6sMk6wYszWnDF?=
 =?us-ascii?Q?kKGAth5hAcM6AA+uqBPt+XEyLMnZrmqeRFBjSKyHT4DKinAMSwlcVvd7ZX1r?=
 =?us-ascii?Q?NV5UIP80buB4YgeULvKEuIT686Qj7+sVt4JOkLaoTMXeEmClrYsotCt4kKQz?=
 =?us-ascii?Q?/veFa4H/prNM6X0WG6pvfdKzIjjjSzui135mJGAE5mZSfofVUB34IMNI0LYP?=
 =?us-ascii?Q?UpDo3iQNKLqARuz6HXOyGpeQcVP0RtY/7KJ7cwwjrVCyffS4lS1HGBR8WH45?=
 =?us-ascii?Q?6lBQVvphR++UR7p0Z09lDHntLsQQK+9e2DITkNnq07k2O6Ebvkn22b28HDpa?=
 =?us-ascii?Q?TkMuc6dzQVvsjtPw89tRx/+8VXpTNDIBiVOcjO69E8lsP2+7q6YdUSgjl4WW?=
 =?us-ascii?Q?X8OCztRpBWPdTYM7VtziTR6r+ms+L8WpTtksGTwG8B3gVAiqRi19xM1XgZHs?=
 =?us-ascii?Q?CuSXGcDfv/cyb5emDkz/jD6a0Hp53XnD+5lblwSp0JKzXnq89XFsgzLcD/cg?=
 =?us-ascii?Q?XcsjZX1gEdjJEGUTDm95H6k6IM5pyi4Li4BahJqqIJxnul0aknAJSS20bvaB?=
 =?us-ascii?Q?upfY+dvHx9P4U6ncTVj1El0JpYcJ3WO/O8bIwxUJlUUqOeBG532M4TqHE64+?=
 =?us-ascii?Q?3OIJZ6F2SvcU7cCV8BocB+QEi57ObY9HcS09IiDQzcD8Q+8yzssb40ysNOf0?=
 =?us-ascii?Q?Wxl6U7A3FCiJtyPcQ5ohud0F6LuhTQBc9X3MIrvMTfdXozR6sA2eeSV61bxf?=
 =?us-ascii?Q?uwJN7hI7V5DTbntUDjsc0t89latosdgbvmwq62BT/Rz8Pxbx9Y7xfm0HcNNx?=
 =?us-ascii?Q?CyKO/z3pf34jp2vSPmMgUEADe8y0ooYtYta+qlpCfsg01eOtc6T6BSOZ3o5E?=
 =?us-ascii?Q?P1fKMPneecIkQ+7O9QKHqaGBxskw+gNJCo/+3cgje6aXRQPclc0mL2nhNQPi?=
 =?us-ascii?Q?VAvZ9oM8bwhjDcL+dC6spjKGC+g6PWDUXWswegIckJZ285EbdhTIW9e/FMSN?=
 =?us-ascii?Q?5hroHEORrnfyYD8e/M1krQVAK09lr7VLESa0m9I5cEP1dg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CSB0H4KtOifzm5D9MuBxinbsdiHpGlHXde73HVe00EQamn5hMR2gld23Q/iU?=
 =?us-ascii?Q?bIulyzxqEmTuDQ4PF7k8SZXBdXPeoGpfQJDFVtrj7cPpEDyLIxdBBKB9OcKx?=
 =?us-ascii?Q?woN43HTVpNQLceglOWBPh046kSRIQ0Bl4FNyoX6Eguq/1ueqncsLpoBw5kvK?=
 =?us-ascii?Q?dYdktgXjiVxYgDNz+rpv6b/H68JMQusqs67gpCjy2MBHEiI9in4rf9jtEHZO?=
 =?us-ascii?Q?Plv+HVuAahhaBuSr/wBfrG0Xk96zLgHoSWrqfN0Mb7FYQI0lZ8dr8eSHCETA?=
 =?us-ascii?Q?beQ3t/2Cvjhf21qo3bxD8p7qICuNoz3s96IHdZCN/2fCrV/8ySgQEYDNdmh+?=
 =?us-ascii?Q?T/f93HZ/Sa34ddBFaRyQXSEs6Y2QSjo6hX6XG6kgNZxRk7LIFEpX+lBYpk8i?=
 =?us-ascii?Q?NGveZmUQyoI5vQB1RXL7QL/l7/zyLtWJNpMpISICAK1Z/oKdAnLV/7BqxPpt?=
 =?us-ascii?Q?8L0aiHBr+Yv/7j2REHQYI2twHgIEc4a8varH7BDyKvCX7Cc1zv+KxcD1UTjS?=
 =?us-ascii?Q?jW6OwkMyCH4JePyPbu/k5Mm1G83awnr8yCL6n2Ax7ZaJBpmNqyZyA01IMI0p?=
 =?us-ascii?Q?1bkLQufiC0MQZqIHSp3UHej0ReQ0XUVkWRrWECWh6rDyifK4IgjJ1YRgWmQC?=
 =?us-ascii?Q?4swTLvVS/XjR9NWEgV7K95oSuz7V/lH2rtAOn7u+BwGOlzWmM24DiwSbp0D3?=
 =?us-ascii?Q?ik5d+Q6ql0Gyu4tSn/eQDZGk8s/7rrQT8QEbxQ6o8pebR8v/qLx47E/vReqi?=
 =?us-ascii?Q?OnhAboKUaYfY80wITbmRvbUskwGpa2coYMQNABqJ3nRiIeODoIm8aCcCpP51?=
 =?us-ascii?Q?UcIeSRVCU0cUK4qyN1yeWk+VfHyd2OrKJr92+atLQhc1bQobN9hg5a56oqxu?=
 =?us-ascii?Q?Q/LtHmLFaw/ZTjcMhHcpTaBm3yEAJXJ1tJRVGYt0SVIukQlXbgR576HL3gwo?=
 =?us-ascii?Q?nU0UDcB7CNITV1ptJPeEI+5YNDkfMgY3ITDYDat0ARt/th2wmDzGS6/BQja6?=
 =?us-ascii?Q?Iy36pcOr34maylgSTAzngJABg4SXkx701RYtP5dX4MAv97/bF5T0e12AVhKg?=
 =?us-ascii?Q?CuqIyUxbVsqlRSbyYeebYnbmEXbQzHBsJfx5/V8pZrl2mskjkcQdHNwaow1/?=
 =?us-ascii?Q?B660w2BnKep0jqLfcQ4GeJxtDZENmAQQl6jfJmR6kJWapAcasWx3vnt3JXDG?=
 =?us-ascii?Q?VfOH6XafR0UlQ8/TmYkSYuxYeifdZ6YNnBx2Fq8K8JGo2jDvSF5ouJJ/ryrk?=
 =?us-ascii?Q?F7PVKbxSUD89h3HvZRv3P7wPN6LJgz9IROoZqMmMWU5Gn/NjbGAFEkLJEXkg?=
 =?us-ascii?Q?ZqxqmRUKzG69XqXYmxuXv5ykPr4jcC1GHpYZKOr+03CVaB3kqw2d6iCn0wXg?=
 =?us-ascii?Q?PVxIe49sv3BvKcLl9KNt3yfxcBdL2yt7MK1of2rrEF9xVzIwx2qO4TS3OmOb?=
 =?us-ascii?Q?nCBOgCachHBfmngnUvgSGCOnIvwp9vq1uKzr0VocrpI1/kn+7qXN/QGiaVAW?=
 =?us-ascii?Q?Wp5Hu4PsK8G/9FBc/wMnetCLHld3Qlg3qDZWLqjvuDVZa5LEIa6GOFSbZxgy?=
 =?us-ascii?Q?YiUxVcgm/JsTPPIq8tZ4b4IRg8ebbQtlEvk3oNJJ/OtvxMSZSVQ/a5Pgm4ly?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 226e469a-f1b2-446a-b169-08dcb7e37922
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 19:51:19.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhCb+bZB18bUqblwPgMghS9ogSGAwhl3M2QmBSAbF3OYHwqtcX2xTosezQ3SkTRf4ad3JaIxBhWaIOXj1PJoTF6R3j5vcoBqIoEhq8KzUAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7771
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

On Thu, Aug 08, 2024 at 02:58:25PM +0530, Tejas Upadhyay wrote:
> enable host l2 VRAM is example where MCR register is
> getting read before fully MCR init is done. Lets move

"is example" makes it sound like this is just one of multiple places
where we're incorrectly using MCR registers before MCR handling is
initialized.  If there are indeed other cases, then I'd expect to see
more patches in this series making other changes as well.

Also, the title seems slightly misleading as well; it makes it sound
like we're changing where we do the MCR init (which would run into other
chicken-and-egg problems with topology and GuC init), but in reality
we're just moving the L2 thing for Wa_16023588340 a bit later in the
init process, so it might be best to focus the wording on that.

From a quick skim of Wa_16023588340 it just says that we need to do this
as part of initialization (and GT reset) without really specifying any
specific ordering with respect to other initialization tasks.  If I
remember this workaround correctly it's probably something that we want
to do before we start having a bunch of CPU writes to the LMEMBAR.  I
think there are some CPU -> VRAM writes during GuC initialization (e.g.,
the GuC ADS), but maybe not enough to require doing this workaround
earlier; we should probably test this carefully and/or double check with
the architects on whether they think this would be a concern.  I know
the really heavy CPU -> LMEMBAR traffic would probably come later once
we initialize display and the fbcon starts writing to the fbdev
framebuffer, so the new placement is still early enough to avoid those
at least.


Matt

> enable host l2 VRAM after MCR init.
> 
> V1(Lucas):
>  - Reorder patch and reorder flow of L2 VRAM enable
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58895ed22f6e..238c7d1053f0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  
>  	xe_gt_mcr_init_early(gt);
>  	xe_pat_init(gt);
> -	xe_gt_enable_host_l2_vram(gt);
>  
>  	err = xe_uc_init(&gt->uc);
>  	if (err)
> @@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  
>  	xe_gt_topology_init(gt);
>  	xe_gt_mcr_init(gt);
> +	xe_gt_enable_host_l2_vram(gt);
>  
>  out_fw:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
