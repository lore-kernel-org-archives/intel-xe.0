Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F089BC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 05:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CCE10E15B;
	Mon, 23 Jun 2025 05:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOPiypoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B8010E15B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750656747; x=1782192747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QU31lbqkTG4PuJ8Oxr+wdhUXTdsBwyrvLan7KTL6toQ=;
 b=OOPiypoMjazOOe1Ia0Rd5uC86wCl3EZAiyIhQoBJ0h9yfYvHH9CU0UGa
 jynXo5MqdztHbToWGXDTdWdU1vth4+VaouZ5anRbgv6c0Mz4rCUeyzDpV
 fTIIBz0xCtkw38NWUHqbVuYC4o4TG6MUaLhhr5PXose1arzNoi/x1vgHc
 FGvUoaTHd3AzZhwe2K+jc769gZpr8xfO2mvNApJYSDiuAVHRNzVQzr3dt
 5AvrQqx0kb0WXrvCd+PBqbv6XgScuLPetLJPBpaEdDlVpZdfo6bnnFoXA
 qqoa+r7DE8ycQgltJHxqPjSHW1DlkFVomxLgFH2IqkmLOgseQaX3c5rh+ g==;
X-CSE-ConnectionGUID: QAH/S4DpSNiu3vYuuSqD+Q==
X-CSE-MsgGUID: KS9WxmdvRiCk5EqFM+hJFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52937254"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52937254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:32:26 -0700
X-CSE-ConnectionGUID: Eh4O1hMQTLWG44q11xv7Ug==
X-CSE-MsgGUID: YTj8J2WpS3Ok2hmVGKB27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151079184"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:32:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:32:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 22:32:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DywGxIWhgazIJ0Yw+vaVTTl397EfXdPTvBB8qF0qLx7VfNFaiClyvB4fonDzyx/y0Nks9tMjW4IlrJxhXsTPSAfkkTE2Z5Jhj3IwYI4NQQewgPjaH2BA7gye8XsIZ5rgqzYOcKaTlX7r8uq1NCK5R1ndAeF+BU1WYwMHSruM7oegjq3kH62XTe1bufMz8R9AuXoe+r/JVUM0F4Zb/kA6SrhTcTvmet7mjz6n89bQ7DBKRdIUv9z3Tdp9MybNFA/DiqsAM7mZ/Xvwm8OcUTFFtN+HRkOkjtOaIiiL7eukKxNLQAGG5Pt43fZwBbbF79S5spez3LHZ+vM7D/jmXSUMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpyOrrzfwRfSoNXVNwrgtbsNJXwsFhHkUT74UOM/ckU=;
 b=XJcgn2YrN61VbDnrXeUlktB2EiFMDKWmHPd6qik6Y9WQQpxtrm30YqH/IFDG0bvis6l7S1q74mdTTz5gBL9r1ucyZxiO1AJs84Q/Mb4r7p34ctbGktdgIjxhcw0OvDXx7zmyguFlqLRHgIXptNxt8yt6zajgQEfiaj7QaF5LuSgrlpTPiGoj8uYncADc/kyFP0MoFWevG/cvy10FtvUqwg5M7+yZCtkcxiJwuB9uN3QPGqZFRMz0LKUhx03+E0gJSqDgquMSADhjW8MQbWJf9Ti77RCiZMAh16P8n22e7R8cjVzar/qnISoSNPRwYpgMpspaq5Ra4ditJDaMkWbKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 05:32:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 05:32:13 +0000
Date: Sun, 22 Jun 2025 22:33:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 09/20] drm/xe: Implement madvise ioctl for xe
Message-ID: <aFjnQO4KdaFwWckI@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d561e8-9e09-4dd2-650f-08ddb2174eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U/HgFhlqDrb2blJk1G+T9vDynxhW4svOszNSLR9hMnLMIi5A1YTlLXzW6b?=
 =?iso-8859-1?Q?boyWzM3AIrVMWNX2rd/hO5EBG/SlfQ03w8B5UqE8r3Wvu2T+1yt1MUbPoo?=
 =?iso-8859-1?Q?DddIim0tQbklg62mfw/IXiOu4W8GTNHeAis+Ax7Rnw4JyVJ7TKJMRVbso8?=
 =?iso-8859-1?Q?4P4Xl5xDJryrQisMQjD3oisjP9Y9PgGsS1CPio71UWd8RDnSyStJiPujIA?=
 =?iso-8859-1?Q?CPeAxyjYaSMErj0PLzFy/oNCe09cfER0RLdzGyEuN6QAJCGzTqZUPtIJ5r?=
 =?iso-8859-1?Q?Y5EEvGxQBBNvJQj242q7TanEIQTXiSeGFQz/I6qHeWirWwU4iO9bkd3jlq?=
 =?iso-8859-1?Q?56/8VDE3e5O4r+/1olxVLZy5G091xUGycOwqR1FdJaPzNCMj5h8u9JYrs7?=
 =?iso-8859-1?Q?knXSkWiVWySiiRLGHGjHFmDb67TQXpnnEWEwpAYBaISLIyw/sORg4S+Od2?=
 =?iso-8859-1?Q?rWPdYgA8UZgWfadNRPPcjCQMioYmUzFy+rvtoXJsEyBfThIqazwkSf5eY7?=
 =?iso-8859-1?Q?6gb/1M24MAsGX5E84HaW6rpnG7tbMU68w98jHNLkg/MZG6XAoS+NsDTSId?=
 =?iso-8859-1?Q?ZFkwME80eKqqecpl4Iw/kwB5Q5rMqTvib5DEtbWfyUKZ2FIFpqNUfsWxeD?=
 =?iso-8859-1?Q?pjolYfHTpzVUcvB7wC/jp62q2JGbDg8akxGOAS7p87VoMjMtWLKyFijQ8A?=
 =?iso-8859-1?Q?u/MLAhdDtFEEPoihCvwsuhomMRhHUafEyCVZZ08aATnCDKW74kTsXybXM9?=
 =?iso-8859-1?Q?yQzAl9LkODxmeExyFXo48JRfbkDoCYGGS8gS8PGiNfk9swEe6OCBcjIPgR?=
 =?iso-8859-1?Q?Hh2KtMywJBqkfvDsQ3eWw3uoFaUV4RpwasOAsmkTQqwepXHC+ozcu4z05g?=
 =?iso-8859-1?Q?F0SHAVreE+zdhnohPS0H+kazTC5wi4/naL+bxXw6VCL6GbqlGjit/oXzGc?=
 =?iso-8859-1?Q?uS3dlSupQdzwLXQtL2uiREnY8FyeD83/v9Vh5urmSlTenD7FO56OiLsRK9?=
 =?iso-8859-1?Q?amKRVGq67dTK8eQxsBV8fhI/UY3yVrKTu4Gpudof+3NSjQLSa9SekIC+tJ?=
 =?iso-8859-1?Q?EQu/bEthIwkQlZT/9e4KXypNSD8FMk34QyFnVX5dYhtqoihyuLtMjIJysp?=
 =?iso-8859-1?Q?1oTChR8BUbBWfKmC6f3KL5V6jd682pnVkMDFuxaC5evGABup7+ZU7SkJ6U?=
 =?iso-8859-1?Q?wo+bVRYGkD4KaClkWezMi8h6HCiu/qTOkzTaS6zKF2/3b8gvVK52yN1qbQ?=
 =?iso-8859-1?Q?eOsumqHdUAPQ5tZP5Qs4LRW/jW4fxmGdYf30hyAeneKlZHNores67anSah?=
 =?iso-8859-1?Q?WrfQ76F9j0CeuHh3jtS8e2NdYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tjLgWalRC+svgTGV+ltFJk3OrDq8cg6Ne83m67cJ2nSnBlL/2GNn839tjS?=
 =?iso-8859-1?Q?PLE7EY9TbSM3Wl42vwH0Y9bYr/XwJULVXXc2mIGh/B6Y0IjLEBj4dG1AHL?=
 =?iso-8859-1?Q?WXayhBZFe62B/fWSFI4eVh2M1QJLYQ8aSH28qiUIyCZUfRJrb926SMvQPk?=
 =?iso-8859-1?Q?GT6nVXM17W5dzKAb4eoklVyWOVhaDDNYLGmSX9bnaQWJTmiYTXlMMzXfnn?=
 =?iso-8859-1?Q?y5BbLuv2yhuHVHURSSrK7Ij7Ovlc9SeGye4hNpKyCfMvXJdde/+xfVOYS+?=
 =?iso-8859-1?Q?UjxQ73Vf1MQ+5LbEiQaB5aJ9N/Bm6EiMjXSRMptdmVMeXlXUyL0EfmFxwq?=
 =?iso-8859-1?Q?tkJMLyGe9IFEMI5H4q3Fm0/cdthoBAA+ey76by6xlS45/MawlCQdTuEvG/?=
 =?iso-8859-1?Q?e2MV3jKc+KYPGqoM5fREXPrSxD0l0zVLkcDomiPq4QzPAXO5yafXk+LAUo?=
 =?iso-8859-1?Q?ehp0RxG/tFkGCLFcbhNoloIHqv8gcyYKSDLlM7XAfwe0mahOBFq614z1cH?=
 =?iso-8859-1?Q?oAmGUiMdfdfzO52Tjbck+cqcDuJWGdGJVsw9XVQKyv2Z8qwprExJQjLFfR?=
 =?iso-8859-1?Q?qRpc/+TLGp69CQ2zK4yzQPzpM4aEPr+PrMabLoz+aY8/0RDacpeGT272zA?=
 =?iso-8859-1?Q?xi7q5FJ8b/MpGvI78OwzVxkNbHZwRddd6J/fI9qtxqn7q1YMn7a9ZQAWDY?=
 =?iso-8859-1?Q?hsneQ6wRAiXNNxqZ0vW0oskpmTnWO0Nos8DVS4pmonl/dZcAzZ+mC3II3P?=
 =?iso-8859-1?Q?2jjKOeLEjJojvZFO49YC0iCcz1H54dO1jumi7SL7gYhmkyqvFmsBXIpOnz?=
 =?iso-8859-1?Q?4zfcKdmjLKDRmadgWiu2nXzEYd9KdRa4OH7MkV5YvWW0ac6JEhRSLpbfjS?=
 =?iso-8859-1?Q?L003EETB54X8P02H35yCgtFejjCIx5zIJbIjnJiJkkiIHZ8cjQKFc7N70A?=
 =?iso-8859-1?Q?4zoUDyQvf1LBedo35yzs6S+3wFqxdMl1fvLajdwq3kCO39OetOyPaaJHY+?=
 =?iso-8859-1?Q?Q1x3Zac6CFUgOdTcAxvdnJC1zYCifMrLsDAV7d5TF0OBPV/y3BXY+2lVK4?=
 =?iso-8859-1?Q?y8N0EemGNQeV8DHcpZYTolMcCwLfOEqHDUejDh1faXSxc7jtavyosipEgx?=
 =?iso-8859-1?Q?KG+DpQacHxDN6Ax1pL84TIfz6fAvG3jABSEs9y9XOEF/tu5VeFieHlFn3y?=
 =?iso-8859-1?Q?kAj3vm3Nd2XDqQk1SGkY6FlebHlAuoSkU1f2ILvJxHfYhLG+LKvZNjhjwS?=
 =?iso-8859-1?Q?3Ktgo9iV7AI60xc8WVS7V9sPY9IOFzeO4+SDBJg/m2fYKEdNaVrbXYIj7j?=
 =?iso-8859-1?Q?VTkiy1aLIVkQWUNnjgB4z1y2RTNcsFPWwI6CWNge9NYnoN/gKr+yHw5c/w?=
 =?iso-8859-1?Q?CCD3yIlqZFB3SvuSlraQlsUz/ytuG0DIYg3w8SUPVsZYWZbSPlCKUHq48b?=
 =?iso-8859-1?Q?K8/WUD9U/wgzoVxifev74dp2DwetnYtizJIW0B6zh3eJdUpKoHwZk5PZpd?=
 =?iso-8859-1?Q?XOl590fD6O9u2Iuhznl2HLnswuH2wzRZIw5HWopNonk94M0X8v0VRO1acl?=
 =?iso-8859-1?Q?bjmxK4OlkC5Ui+1EO/cXdwtN3yUSLQD0p9bcgKfmP5YDackqXd1t6409jc?=
 =?iso-8859-1?Q?sSK2DDY0u4mWDetnh+KArW7BukYp7Ls82+7YOC6ERaAe73rMGjvNs99Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d561e8-9e09-4dd2-650f-08ddb2174eca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:32:13.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHVNBUV/yxCbQ8Y66K6jO0ZQ0vsM3OzHj9Tcr3JAzDIgNMixb+zvLbKZ9nNLpV4OXSSdMyTeVrGMuG/wRqwBjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On Fri, Jun 13, 2025 at 06:25:47PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> v2(Matthew brost)
> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> fault mode too
> - fix tlb invalidation skip for same ranges in multiple op
> - use helper for tlb invalidation
> - use xe_svm_notifier_lock/unlock helper
> - s/lockdep_assert_held/lockdep_assert_held_write
> - Add kernel-doc
> 
> v3(Matthew Brost)
> - make vfunc fail safe
> - Add sanitizing input args before vfunc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_device.c     |   2 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 282 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  4 files changed, 300 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..d375b549c30f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7d9a31868ea9..632d3ab12392 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_vram.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),

I'd make this change the last patch in the series once the
implementation is complete.

>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..ff560914ad7e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/ttm/ttm_tt.h>

Why do you need the ttm_tt include?

> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"

I don't this you need the xe_gt_tlb_invalidation include.

> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +struct xe_vmas_in_madvise_range {
> +	u64 addr;
> +	u64 range;
> +	struct xe_vma **vmas;
> +	int num_vmas;
> +	bool has_svm_vmas;
> +	bool has_bo_vmas;
> +	bool has_userptr_vmas;
> +};
> +
> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
> +{
> +	u64 addr = madvise_range->addr;
> +	u64 range = madvise_range->range;
> +
> +	struct xe_vma  **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	madvise_range->num_vmas = 0;
> +	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
> +	if (!madvise_range->vmas)
> +		return -ENOMEM;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_bo(vma))
> +			madvise_range->has_bo_vmas = true;
> +		else if (xe_vma_is_cpu_addr_mirror(vma))
> +			madvise_range->has_svm_vmas = true;
> +		else if (xe_vma_is_userptr(vma))
> +			madvise_range->has_userptr_vmas = true;
> +		else
> +			XE_WARN_ON("UNEXPECTED VMA");

A NULL range would be odd to set madvise for but I don't think it
warrents a WARN_ON, rather just ingore it.

> +
> +		if (madvise_range->num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(madvise_range->vmas,
> +					  max_vmas * sizeof(*madvise_range->vmas),
> +					  GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(madvise_range->vmas);
> +				return -ENOMEM;
> +			}
> +			madvise_range->vmas = __vmas;
> +		}
> +
> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
> +		(madvise_range->num_vmas)++;
> +	}
> +
> +	if (!madvise_range->num_vmas)
> +		kfree(madvise_range->vmas);
> +
> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
> +
> +	return 0;
> +}
> +
> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				      struct xe_vma **vmas, int num_vmas,
> +				      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			   struct xe_vma **vmas, int num_vmas,
> +			   struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			      struct xe_vma **vmas, int num_vmas,
> +			      struct drm_xe_madvise *op)
> +{
> +	/* Implementation pending */
> +}
> +
> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise *op);
> +
> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> +};
> +
> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)

Return a tile_mask?

> +{
> +	struct drm_gpuva *gpuva;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +

/* Wait for pending binds */

> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		if (xe_vma_is_userptr(vma)) {
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +							     DMA_RESV_USAGE_BOOKKEEP));
> +		}

You don't need brackets.

Also I think BO move could make this pop. So this might be incorrect in
xe_vm_invalidate_vma too. Maybe let's check with Thomas on this as he
added this to xe_vm_invalidate_vma originally.

> +
> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma)) {
> +				*tile_mask |= BIT(id);
> +				vma->tile_invalidated |= BIT(id);

WRITE_ONCE /w pairs with comment.

> +			}
> +		}
> +	}
> +}
> +
> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u8 tile_mask = 0;
> +
> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> +	if (!tile_mask)
> +		return 0;
> +
> +	xe_device_wmb(vm->xe);
> +
> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> +}
> +
> +static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> +{
> +	if (XE_IOCTL_DBG(xe, !args))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
> +		return -EINVAL;
> +
> +	switch (args->type) {
> +	case DRM_XE_VMA_ATTR_ATOMIC:
> +		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_VMA_ATOMIC_CPU))
> +			return -EINVAL;

Ensure atomic.reserved is zero.

> +		break;
> +	case DRM_XE_VMA_ATTR_PAT:
> +		/*TODO: Add valid pat check */
> +		break;
> +	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
> +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> +			return -EINVAL;
> +		break;
> +	default:
> +		if (XE_IOCTL_DBG(xe, 1))
> +			return -EINVAL;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * @dev: DRM device pointer
> + * @data: Pointer to ioctl data (drm_xe_madvise*)
> + * @file: DRM file pointer
> + *
> + * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * input range.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vm *vm;
> +	struct xe_bo *bo;
> +	struct drm_exec exec;
> +	int err = 0;
> +	int attr_type;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	if (drm_xe_madvise_args_are_sane(vm->xe, args))
> +		return -EINVAL;
> +
> +	down_write(&vm->lock);

down_write_killable + error check.

> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	xe_vm_alloc_madvise_vma(vm, args->start, args->range);

This function has a return value, any reason you are not checking the
return value and erroring out on failure? 

> +
> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> +							 .range =  args->range, };
> +	err = get_vmas(vm, &madvise_range);
> +	if (err || !madvise_range.num_vmas)
> +		goto unlock_vm;
> +
> +	if (madvise_range.has_bo_vmas) {
> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);

| DRM_EXEC_INTERRUPTIBLE_WAIT

> +		drm_exec_until_all_locked(&exec) {
> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
> +				bo = xe_vma_bo(madvise_range.vmas[i]);

Since BO is local, struct xe_bo *bo =...

Then delete struct xe_bo at the top of the function.

> +				if (!bo)
> +					continue;
> +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +				drm_exec_retry_on_contention(&exec);
> +				if (err)
> +					goto err_fini;
> +			}
> +		}
> +	}
> +
> +	if (madvise_range.has_userptr_vmas)
> +		down_read(&vm->userptr.notifier_lock);
> +
> +	if (madvise_range.has_svm_vmas)
> +		xe_svm_notifier_lock(vm);

These likely should be interruptable locks too... 

> +
> +	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> +
> +	kfree(madvise_range.vmas);
> +	madvise_range.vmas = NULL;
> +
> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
> +
> +	if (madvise_range.has_svm_vmas)
> +		xe_svm_notifier_unlock(vm);
> +
> +	if (madvise_range.has_userptr_vmas)
> +		up_read(&vm->userptr.notifier_lock);
> +err_fini:

The error handling is wrong here. You'd leak madvise_range.vmas on this
error path.

Matt

> +	if (madvise_range.has_bo_vmas)
> +		drm_exec_fini(&exec);
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..b0e1fc445f23
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
