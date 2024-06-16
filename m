Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C77C27C6E
	for <intel-xe@archiver.kernel.org>; Sun, 16 Jun 2024 04:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389F110E0A4;
	Sun, 16 Jun 2024 04:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OR8B7l2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4610E0A4
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Jun 2024 04:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718511287; x=1750047287;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=1hXBMgY4lh/tsbf1sqy0eIXoo7MiAm8ScAiaTPGk/iU=;
 b=OR8B7l2RJNfyjxVc8xsWSopHTznbYDBed7/Vvyf6Y4j2mukMws8b+FXS
 /dzxbSnWTYFICR6SN2IfeRxNuMYQ1hvpNsfFnUyQjc9l/wD4Vsb1CKMFb
 b2/C0FI8zMwpWhNsnM+WPWVzJO0sH5IAqm+32uMF5Wc+QGP337u6YX+/V
 mITZnj+Uu9VUMO+0MW1FcBIENhIoDxlr7fuRq+QyVqeUB+oRY+8NbfOtf
 UwezqB6T2fTUTmwzpe4pjkmsIeuI6Q4yqK+TTuA3bqVo4unS6Sb5SXJ5h
 oUQiIPbCmW/mPLc1GR3PLphMKuxJOxsr9tNDmr5TWj3oTkwd+WsNlijFd g==;
X-CSE-ConnectionGUID: h7i4SAACRseJfMYlWTUGSQ==
X-CSE-MsgGUID: AisXy6vwQg6nYpVd4/NcnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37891303"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="37891303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 21:14:46 -0700
X-CSE-ConnectionGUID: xMjnurI6SLmIsPtNpQLPKg==
X-CSE-MsgGUID: qROKpM9SR0qgKjWknQzrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="41026029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jun 2024 21:14:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 15 Jun 2024 21:14:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 15 Jun 2024 21:14:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 15 Jun 2024 21:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI8+UV0+DxMNA7b3Yk+HLq8wrMJZ/iHusNzSCLTofefXb8D2DUXiitbvBAf03vKvT0T079ojl8TjsxpWk6XC6ZGU34oMiWdSen/qhVkqiZPbovKPL1pL/baSokzsqjOdtWPneZ6/4DU96ncM2ji1xIyMzvznKo2EkNF9wnYY+s2srVlYDw2XokCfw5CZ78LmDWn4SLhlFgITYbZML5XEzqt0T3oZAzxuie3fK0IO21Na5kyXd8bN5OvgbjKJUZm7DbVZ+/Kkugm+HD2krHU4e2ydXxDzc3BA71aM2iqKityu9bIs/GhFm4kvLLjmSQHJ+ldUPC2ShilmZyfaDCTkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XAwDbdgmkFt071o1/sbmiBhMVAsz98FZ12DcZGgl8k=;
 b=E0I1rv/0GvJcV9KnDzgwYuMIYHYyihXqgCwNgJxPfsHwrNswKUhCT+mV09eGemM9OD1et9vH00NiSOfCwUJtEMFjQ1XmoPbsvaZCdz8U8s/lsbgE7InLV95Olb4QmeJvLa9BoMIPOyhEdTCROZGjhnpltoGZdgrkPyDzVzLMzfrKPncpmSYl7pF7Hi2qZ1n1ZbE5jRx/GIJd4iDJmv48b4g2m5Huo1Vlgitnu2RJKwyBm+CuHh059vAZgWMqUKdufRzyi+swuyNH1CC9whlP205feXPTF0vixBOBo+Mk8bZzCza7gtN1d3lKVN7tFo+K6vswsxWFS5DHPxsMxXAtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Sun, 16 Jun
 2024 04:14:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.026; Sun, 16 Jun 2024
 04:14:37 +0000
Date: Sat, 15 Jun 2024 21:14:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2lpg: Add Wa_14021490052
Message-ID: <20240616041435.GE2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240614182455.2370059-2-matthew.d.roper@intel.com>
 <171843559856.95803.8715246538037489832@a6498e030952>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171843559856.95803.8715246538037489832@a6498e030952>
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2390bb7a-0c4b-4650-6864-08dc8dbad5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XenAiw27ijstXRRo3iw+KoI9YOmMHdlfiM/joEdroazSCYLv6kVXk/9HTf9f?=
 =?us-ascii?Q?x1c/gzmt1kLPeQetq8xL3tR8nR3S+fgCeE5HUyNr780MDoPZNKM+5VprIVjD?=
 =?us-ascii?Q?PRnUUmg2+ow/EsXogpqxbyqFIAADJGMxqtFT3sBgz0ZyHnhoqUuEF2QjhACL?=
 =?us-ascii?Q?MNfjn4EYK2Uxe3/kN4uWFIYlMYpV9gSSrB8clSuROXV6l0M36kuFL3ODPtf4?=
 =?us-ascii?Q?NKnGAdoNeXQkj2DyOXoLesH6w0Iru4qYWFTKwzLAqK3xKysfQ13/gfQvXBlS?=
 =?us-ascii?Q?N9sunqaf3rDIrtIYIowLxpYSbfrLxdG3NTxNO6Ic3l/Qnf4ooxO4MA8CqDq7?=
 =?us-ascii?Q?nO4chZs2TED6dYL89feYbpQr5sPmDBb3NisJ+0YFVU1WS0ULK0PHn54mJpii?=
 =?us-ascii?Q?gltuAAiX2FjZiRmr9YuvoIb6MHEFbD1PJdrw3PMC6xhDjKMQemBRoD1Hq/1K?=
 =?us-ascii?Q?cikPoUUaCsoGDNjAanxynNSjReYj21tDeK57Q60psGiGCkmJgQJS9uxNG1MN?=
 =?us-ascii?Q?S3hVFhTYROuO4uxsq4+37sZmdjOifXn6jGza2GZ/23pDCpWt1LB4iWWbj/2J?=
 =?us-ascii?Q?FP04gsikeV1cNbTPB7cQS7LsyQg7asvqiF/3HNVa36v8T9L43KhotEPmQG38?=
 =?us-ascii?Q?HzTUiNH8n78Ud/sq5W5EyZUdgZTl2F7KlqF4BuwcoUkMlhxLmMTCIHZMuYOs?=
 =?us-ascii?Q?p47CeXuKhIYaEA9lZsfSSS4n/G9MEFQGBj05dQDmm3rSAFNjne6lg95uG3K4?=
 =?us-ascii?Q?/wUHnw4Zvs3w9lXJFn4u+7gPjDqpwXpJeCfwMMsfQsdD3fm90uNjWwtfxJT1?=
 =?us-ascii?Q?p9cogY5IKUpR8CR4+8edp05X4r47AW/KhnZ9cO4qACn15xpuh0+PRcJo8PAV?=
 =?us-ascii?Q?B1luKFg0xhOpi5+AaH/eWJmSvIpRiXZUtN7Oo+vvpzmHd5b0IsGbhVxKd9cK?=
 =?us-ascii?Q?lmxOcSvHEC2Py5Yu8f2nTn7vCgYM+5O4kB/78GJ94TG/NkkFNqUYSLgqJVWs?=
 =?us-ascii?Q?whJIcv1wlJxZKBoJyBBVnNOLC0T10dp67pjV/HoNzFJlNjAwwmZOl9LvHema?=
 =?us-ascii?Q?0F01NLl4P6UequdNBIvIB16QJABb4kM425CX/sxcasq8zZwiFazm/DL9Qa5s?=
 =?us-ascii?Q?tzu9G8dwUPdLZ3IQrUVneGPkzdnJqi4Hs+lxKfcHJrb7UUJJ3XRGewVA2C5Z?=
 =?us-ascii?Q?0TNhwTicUedg2xkD9qmthPvXmjtAZXQ8e4r0N6gULOA8eb3oD5rANKpHbTZ0?=
 =?us-ascii?Q?b2iw+WOKs073CWYLdBvFG2QuAB+XFctJPI3dNNkdvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+dlVLD38qxQoUWxGGqQYQNvqoLMIINyFloqsjl34pYxk5JvTD0DLhqP8Xsy?=
 =?us-ascii?Q?DpsBMAKJ8RIFPn9CUMqSrz1NaB7eZs/qLq2KobWNzdvuMn6/japOtIZOa3pw?=
 =?us-ascii?Q?vz3Bv4AIfSk5IOyozsXyyzQ4TdC2uTO49z/vFaoAs1XBmfRf1Wvd14V77xv2?=
 =?us-ascii?Q?epjopx3QE12vfp2QOEwIUIxw/l1jfVAsag5VOCXWjHfel6G9SNWPblH53Ejg?=
 =?us-ascii?Q?rZO4kxPlGB0AhyvS8COzVfLd1yKEx0gMs5E/0APt3LxKEznMc5qtOk5G58me?=
 =?us-ascii?Q?5ArC2tp6MRGeZ2wdXMwu/9s/X7YKLK5hnSLqUnowPQLviaamIAc1oSKUQ3c8?=
 =?us-ascii?Q?CO380ULTjc4Ktdl5U1wIthxhLoFOsfMCyKNShaGSKEodLYTuxyDGJKmS5gAq?=
 =?us-ascii?Q?Q2CBlKE4vS5Z9Wn80VsDYdM8d8Uf6fCNMwcxxCm9gNlE6eC1dKsb+OEeh/QR?=
 =?us-ascii?Q?/QXmksV5hmWVdnAGDhHfc8wCATDPMKDyWiBw4t94UTegimOOBcGRLGSVJc3g?=
 =?us-ascii?Q?jcPOuXqK56tdFl9Bm8WxIuJi/SeyZDuCtV6PaP+6sYtyAMr06BcP8dxa/RZZ?=
 =?us-ascii?Q?a3VSsimmIWQxeqGhgK/CIfcosXOesMj27HeA5nZxvkEJdJsMaWYDSo17dSrN?=
 =?us-ascii?Q?vFiPIguwub6sSWISC5mi7R2hlLSkaQlcm07Zi7LC4CA5byLA3NVSeFSsvgUl?=
 =?us-ascii?Q?ZEpkqZ8MtyqnzaJktOMczaSZki3DYwdiukNYq8L4z6TDxDXmTah6rc++tI/n?=
 =?us-ascii?Q?Uxh5s4Nj47QI6EfIeuuw7/RGpQQBLgk5OrEwQIJ5g2BZhv2fLohP1VDUNEA5?=
 =?us-ascii?Q?Gq/9wF69e7wDBctm0xQmEAcngvT5bcvzI1V3veRPJUhYGZxupW4y+9fn7Lkt?=
 =?us-ascii?Q?keNquBdORAunpA4hrDnleUB5H+h9Y55GfCEraimPCdwdbb+CykixlTDUzE4J?=
 =?us-ascii?Q?eU8iEIe+1htDZalcICWT+5kK7vAkPaqBQNrCClWHmz9Zu1ka7iat/IAOom0q?=
 =?us-ascii?Q?X5X6rm3uwqZ/ypN31xpff+EjK/ObWq0Eqxf5Hp98CDi2pcX2JOR7XNfGfJlB?=
 =?us-ascii?Q?kNR0XffiBaL9JL2153YuWQXvF0189kyIT4w6boSed+oXaT1G5QZaC3w8fOms?=
 =?us-ascii?Q?uSg0nLwfxAswUcs+l8bnf38dcV18PIfiAPjedb0VugvdSkq7sB+jA9prYogm?=
 =?us-ascii?Q?IRYIQaZk8/aFLg/5+ZZQQa6hm/UtXEwF/dp2qgt1l3iI4QiWWCMVakl3YoCH?=
 =?us-ascii?Q?r/pxYNth7nRt32ac/fpBHQM2xfvoAAEq1755zEZ1tGADrNSlG8ufYAwWwK9h?=
 =?us-ascii?Q?BbMQ9DUBsyRJGTs28yPnki42Wr/OP9F4QcEBmhYbsmEP8gFOth+kX6ZjeMOA?=
 =?us-ascii?Q?e41hNDu/K8P8fU84+1/lXfUMMGLuFS8CFTkLVvYfR8MlV5yJm6q0DfRVwSo7?=
 =?us-ascii?Q?P50NeAByZ3xEsi+DozxnQzsKUfLUfsvL33d5Ncd4GSDLf5qTbcOAJM2sgrJ1?=
 =?us-ascii?Q?zyeFAmYjszW8kUh6BZaqyKdmjuB0MmPrSwHEj3GApAaQcG8mDB80v85v/alJ?=
 =?us-ascii?Q?lJPxtmLFbku2zsNWLW0jRJ71J/1KZm8NTExgqAi7wSgqQ8qsYAzvP8Ai7Ogj?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2390bb7a-0c4b-4650-6864-08dc8dbad5f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2024 04:14:37.4173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAlvmJiF0kbVm86mF+oUoGdzTvHx54LSL8sTX+ux1lu1r6+L7T6VEVtH2RkTkl6iEr11b4juw6xc54QuMvpUoBnviZ6gk2gCGBuFL49UqLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

On Sat, Jun 15, 2024 at 07:13:18AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2lpg: Add Wa_14021490052
> URL   : https://patchwork.freedesktop.org/series/134909/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e_full -> xe-pw-134909v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134909v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134909v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134909v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

DG2 display failure is not caused by this LNL-only workaround.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - {shard-lnl}:        [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - {shard-lnl}:        [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-8/igt@kms_psr@psr2-suspend.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-1/igt@kms_psr@psr2-suspend.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
>     - {shard-lnl}:        [PASS][8] -> [DMESG-FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134909v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1033] / [Intel XE#1214])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-b:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-466/igt@kms_cursor_legacy@single-bo@pipe-b.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#301])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1874]) +2 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1195]) +1 other test incomplete
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#899])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][25] -> [TIMEOUT][26] ([Intel XE#1473] / [Intel XE#402])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][27] -> [TIMEOUT][28] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#1694])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][33] -> [ABORT][34] ([Intel XE#1358] / [Intel XE#1794])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1214])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - {shard-lnl}:        [FAIL][37] ([Intel XE#1659]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][39] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][40] +3 other tests pass
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][42] +1 other test pass
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-463/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-adlp:         [DMESG-WARN][43] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][44] +1 other test pass
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-2/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-4/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - {shard-lnl}:        [FAIL][45] ([Intel XE#886]) -> [PASS][46] +3 other tests pass
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][47] ([Intel XE#1874]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-adlp:         [DMESG-WARN][49] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][51] ([Intel XE#361]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-adlp:         [SKIP][53] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][54] +1 other test pass
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][55] ([Intel XE#899]) -> [PASS][56] +1 other test pass
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>     - {shard-lnl}:        [DMESG-WARN][57] -> [PASS][58] +1 other test pass
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][59] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][60] +1 other test pass
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][61] ([Intel XE#1473]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_compute_mode@once-userptr-invalidate:
>     - {shard-lnl}:        [DMESG-FAIL][63] ([Intel XE#1069] / [Intel XE#1330]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>     - {shard-lnl}:        [FAIL][65] ([Intel XE#1069]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][67] ([Intel XE#1414]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_pm@mocs-rpm:
>     - shard-adlp:         [FAIL][69] ([Intel XE#2043]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-2/igt@xe_pm@mocs-rpm.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-4/igt@xe_pm@mocs-rpm.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][71] ([Intel XE#1214]) -> [PASS][72] +1 other test pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][73] ([Intel XE#324]) -> [FAIL][74] ([Intel XE#1231]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][75] ([Intel XE#1242]) -> [FAIL][76] ([Intel XE#1231])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][79] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][80] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [DMESG-WARN][81] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][82] ([Intel XE#1162] / [Intel XE#1195])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][83] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][84] ([Intel XE#1204])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#362])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][87] ([Intel XE#1214]) -> [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [ABORT][89] ([Intel XE#1601] / [Intel XE#1794]) -> [DMESG-WARN][90] ([Intel XE#1214])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][92] ([Intel XE#1760])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][93] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][94] ([Intel XE#1760])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1601]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1601
>   [Intel XE#1609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1609
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2043
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e -> xe-pw-134909v1
> 
>   IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1471-e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e: e88eeea7c8ecc5b2d3bd7d52b2bdd56531ddb39e
>   xe-pw-134909v1: 134909v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134909v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
