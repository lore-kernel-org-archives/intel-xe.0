Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5B1C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B74A112C42;
	Mon, 29 Apr 2024 12:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX7FHimi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38B112C42
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714395033; x=1745931033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=efNlXRdtNlj+rijGSdQxWKXvMuij8ZF1siHOr0QMJWs=;
 b=eX7FHimiJiHFwsxaeIy5ewLbEKZRIYgM5fuR4M0mwbSRwiyqekIVIguG
 D1nAarJizCs58L8vJgivW600TS5BIn3TlJRVShGhRbc1QUauW4c0lyGjC
 RAjjExq5RLl+wPu5OYuYoXZUvgGJOWwnxP6NFalnrVNAWGj4ou1ZK399A
 14xWkTPd4ezlXOBoCU1B4pl1sCe7LSR7bS7RCx1EI4N3sZ6evcaqIW35A
 Goi6DvAXNtJ9ex+EhppifjxgAMrwdpBTSAXUeWLY1/uLbf/nMWXu+nWuD
 sU+9csaEe+5sP5Gnuqe2Cz/r2qbC5XBpLzESy7H/UAhOlIsLW2LfugVwM g==;
X-CSE-ConnectionGUID: /lHXBA2cRNS4M7drVoSnHQ==
X-CSE-MsgGUID: qM7Vyv12QvGGAJzZlCd5AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20739770"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20739770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:50:32 -0700
X-CSE-ConnectionGUID: HkhschSjQsWN58LoCL2Xyw==
X-CSE-MsgGUID: y0bc6YPxQomzcB/R8vHLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49310660"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 05:50:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:50:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:50:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 05:50:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 05:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd9nodUILLImImaaIZgnSe3cRLM8GyMsoNsfPq80TdIYkwQLLq8xiRX42YYSdaZSA+W86xGNPlZp0C/yOQmS27Zf8JrILsCySJiRNn8hLqex7crbiZSmMB8mjJvCS1zQyyCuHMtc39wcOqIll33at1BI13yT61oS4O4oFf4ZrNPVSCuBLutXiQwFmtwJhiTq7uMkGutfdMSaW5yvdWqCRGRvK2XP5Syu92ltlbrsYTUUDpeQZoUd4NyXGvUIK0gsNzGxo8OikqJujWb8U+HRZOwc/fRkz/GSWGXaje0t8eD5bKDD5q6+WnvRL82TnzzE2P4BwvigC9Ue/CaskcjEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idKtvtzoJMDifGxDV1XxSd6xR8QTFnqSZv0H8wh8RFk=;
 b=U1IJEfarE9c3dKrmp1BSxAcspgHA7Vkta+HP8OG2O0M/7trB+K1elMMs95n2rpyiI1QcVMwE1TuOq1E3bbqwzaW1DTCzUHWP/gJpJaoaqv3Uw3jG2Oqc+1DG+8VQ2lX8cHwZfGmryp1aOBUi5PMjGSwKBMe4bF9iV6QbwprcVuigyn8IYRhVgH71amtVUhzLCaI2gLX20KPJ4tfX/xWfh59XV8FJo8AqlQB7mC46ksCxYw+v97liB+CJXMeyZgCGs/yHSaVjZZdMrtJEk4qHfYnEOdNOV4P20aVwLP0JITd27cRqu8DzOt4WxzEA+N8Ei9lnY5mvrs8RLLoMQIJEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 12:50:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 12:50:28 +0000
Date: Mon, 29 Apr 2024 08:50:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Farah Kassabri <fkassabri@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ofir1.bitton@intel.com>
Subject: Re: [PATCH] drm/xe: add wopcm region size to the device info
Message-ID: <Zi-XkHc53zitMZOn@intel.com>
References: <20240424104802.311322-1-fkassabri@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424104802.311322-1-fkassabri@habana.ai>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e08fa2-44d7-414f-e73a-08dc684af245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bI4fATuj+AO5gyIfsKM8sjZKUNo2DavhpGWJLkC6qhjzRCt7nDWcr4b8h1pH?=
 =?us-ascii?Q?iNFv0RKhkZQBIZ0psv3EXH0dro2AB7KyqEqM8+4sEikJadxCjhzt5qJYMScl?=
 =?us-ascii?Q?pas3VJZKO9dTx4oa2moOY7ksdSAlFKMS6xgNE5aQkxvT1au7qfByoupTz8gO?=
 =?us-ascii?Q?F6zbkj4o/mlsQaswJVdsMm/mp9KnUXbJKBO1+6PPinQsnITPX1HPa92pqRMm?=
 =?us-ascii?Q?xV7chi8gtprazL4wikEiKd0iGB93aOV5bBnac/UyQ66yEVxSRCXWwnDYbQLz?=
 =?us-ascii?Q?RtLlQzOk4l7zv8uOJysr9ZpDOZjaVhG+TEdz1mHpY46lk/OfMCfof7RIQfez?=
 =?us-ascii?Q?TCTNb6Fzl7naVppokWrMRo4Q6qFw7OGc64w9bDdN2KYc0i4cKzsA/AQk188x?=
 =?us-ascii?Q?diKS7nkfDzMAk9c6sjB/Z1UXt+pVva795cKtbFJiRP7sJsGHxKO/HqDgeub6?=
 =?us-ascii?Q?HZm1Wsw/XVesvZHKrOZf4ZfGo4JKI+Qo7tXbv1pJggR2OZMgPFBlHxKjre4t?=
 =?us-ascii?Q?zjwJxRfSSm2R5qhX5Hc8F7vMqxODh6rxaSf/aI2ns1YK2a1S628YGZETyXHV?=
 =?us-ascii?Q?0y+RrTYFyBclUyUoZvPkHnTIUdyeRYMqQGg/0kChwmChQO50bAAKtXyxxGSo?=
 =?us-ascii?Q?3N5lwXl5zVkXfP4D4D/tKvID1+bRp8iCMS/TankrXKsFHklKY6juYIN0S+18?=
 =?us-ascii?Q?1D5wvefuUjS8XCoh0DDuC5rF/QVamKO5plg257K0qQTbPp1wXfh1DOWnKnWS?=
 =?us-ascii?Q?MOP+qFMJBfDdGICoE7idvRuibjwlgBtF8QhGEXI3V7g27SjItoP2NdUIaY0K?=
 =?us-ascii?Q?HERatXrTEndsNn0RGrfuVWNtyXn0LZVJxZtou8zL1pPUQ04kiFgw+Y0uR331?=
 =?us-ascii?Q?AmQ0XBxAd9m0wkxh/AjHjqSy4B68kXiN/5fKD6hfTQxdQy/0JaDo2sclOfCS?=
 =?us-ascii?Q?4lly+ReddbTZ1qoDMoVEAvfeTlXaqQMlDlbtLJh5wKLj+kGdU41crs92ubo2?=
 =?us-ascii?Q?gH0xFA4Qayq7TesNBP6gslStFQRroH79AbfeoGvd4hKBmeX91QC6IJYFiUGk?=
 =?us-ascii?Q?QN+gOo09aSKTfzKdWQ1FpvmXG/NW0oKWvpY0ic7YIvJzSWge0aoghCWZdKhW?=
 =?us-ascii?Q?FkpyfE0UzPtkntUurSMl2rSO3lJUw09jPs4HOFEZcle8AicjCq4jl8WN+hut?=
 =?us-ascii?Q?ZZIMHU2aGYrxmbdeurxaJyvvx65fY3U8JhGpx6FPiYtVrSOL8zQpx1v45POj?=
 =?us-ascii?Q?5ioPNaM4Jr+oNWIL4+p0Dai1znA9k+MpNJ//hmxJdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TlDOwqT0z6X6TBW+NVRbXG4Sxq3pCUGklu63hHzZ1KPi0CckONTkK6IXxko7?=
 =?us-ascii?Q?yO9R10blGhjpRjThioac+EohmI+uSj1P91ih03xJTSxM9OAdk007FED0LvBG?=
 =?us-ascii?Q?xFSAhPz1l/bNa+oK9GVo+foa68u8TkrSZ9cZMiKkZSOj9xkMbP/HvjQgk+BK?=
 =?us-ascii?Q?NLizUeWYPATs49nMts8b49n6Uw6neLJFetkTmu/hBrnRAUI31eeUNxVu0ft/?=
 =?us-ascii?Q?wf7vdyOZmO/l94+hTKbhMGIeDvwu0IKTuolTteP2IlcPoI/FYrTB5sZSbXre?=
 =?us-ascii?Q?paHrmOoShQcQ1MFNIay06rgDPSt4mR2kqek0kjLDyfM0LwaIFQJFD8Ok1W1O?=
 =?us-ascii?Q?mRzObVIwon7lzYaekNlKD/1doqFA2xMoS5zU+HbsR60EAxRfG9LwUmnpTTcL?=
 =?us-ascii?Q?zLH+GasvBgyfCuoBlVjF9WD+wsqROKhfAn7iCAYnNybREFzXhSu0Fi64ULda?=
 =?us-ascii?Q?R7UJ/rAh1j2V0G8bS/r2i3gkS5Y7UsUhZnY3HhsDYUaIL20YtOZjDXjScMQU?=
 =?us-ascii?Q?09pA83V6uIu0yjlDIlSbd2DG5+ngAvTShFAqigts+7sLfVzcAoa36NRaQaN1?=
 =?us-ascii?Q?2jerVPWoYQ/97FFGli1t0r6p7893G4X2vRfmKpFSaKtpguMnOBXH9oQmwI/n?=
 =?us-ascii?Q?X2ZV70XEjwetCXugYQ+sy4GmaJrzJ5K859V2k3zr+b8t3QL6yVskT8Bn30n+?=
 =?us-ascii?Q?cko3mpP8ikXlgv01rXR1E4n9l+ix0Hb2hZb2iwA5oYgYjYUr80TxmD8oHe3w?=
 =?us-ascii?Q?lSO4H1pY8L7b1ofWmvACi19dc6VkjYasxHg/Tl+oWZfygEM15d7wusxgB8Kr?=
 =?us-ascii?Q?PAnNPKuwNAHx3ipuIRiVPXHKs7OlLEtMOxpVLAkam7ivFj+vh7mu4JRWZzx2?=
 =?us-ascii?Q?13zipr09b4PaPXhqiMs7fHQqnT9yy0YA+wZz+Mrx18xEmQ7RJrFTRkSSQymJ?=
 =?us-ascii?Q?8/VqWdy9Sr+7gVIFNz9lX5vpaxeVqcBxpzlZI5tCaiO9Bz93aaW7QQcwqar5?=
 =?us-ascii?Q?aW6XfJxkvJFL/p15bgN8ngaV12g1HEkMkW9XvBcZWZ/+P5IYSH2dQSiZjuE+?=
 =?us-ascii?Q?Ub9vUBYNKD2/cc/O97Gott5EcGd9qoWN7yf/1AdFTPckCekeR4znjojJX0em?=
 =?us-ascii?Q?urR4xwcRCKP9dZrbnwFLuFGq+npcli7Q6UkM8YRkZb5Op+IeGG69TBeiPblW?=
 =?us-ascii?Q?r9g/vTCWqt+VvCTfYUOTWJn798ab/i9oDJBEev6mW9guxQq9+bV7NoI95GPN?=
 =?us-ascii?Q?rUWBTVtAja2yK+hwCqTqGdbQCzJJk9qY8wCtMy3ypySwNHVClKEL2xMPx0ZT?=
 =?us-ascii?Q?aFgL4vPiLA6IrDLX3qYwXUGL52fGvbiwhpQJc8Hly9Y+fIy8UrqYer3g/RJS?=
 =?us-ascii?Q?Tbs9r6zWHhtZtXypaJuGhy9CC4tPDDOdO410mftlAdvVh4tYMMMfkgO+IOER?=
 =?us-ascii?Q?b1vF+8/y9JVLL0O/4ZuUZGRAlUqZysJ8ralDCoUEF1OX3sJTlvlxdPI45TgU?=
 =?us-ascii?Q?LVNvBY7igpWeBqNgd8qnv1vNWtS557S7Z7oBflSwSnmb2OJTC6P5ASqUacZZ?=
 =?us-ascii?Q?oAZd0xD6dzLiiz2mdT692Hkk2U3vKye/6A0CuBFH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e08fa2-44d7-414f-e73a-08dc684af245
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 12:50:28.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvOqdJhZnYbQSBjhe6j/a4RW9r7iCYbRfa+d6Zz/wWYcu3flhhMBBhuHqFAOH0BjNu90HRrWNAvk+3HBxdenFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

On Wed, Apr 24, 2024 at 01:48:02PM +0300, Farah Kassabri wrote:
> As each product may have different wopcm region size,
> it's better to have this information as part of the device
> descriptor, that way we won't need to keep adding more
> else cases to the function which retrieve that size for
> future products.

agreed.
we could have kept the function and only change it to
get the info though. But anyway, the patch is right:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h       |  2 ++
>  drivers/gpu/drm/xe/xe_ggtt.c               |  3 +--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 ++--
>  drivers/gpu/drm/xe/xe_guc.c                |  3 +--
>  drivers/gpu/drm/xe/xe_pci.c                | 12 +++++++++++-
>  drivers/gpu/drm/xe/xe_wopcm.c              | 17 +----------------
>  drivers/gpu/drm/xe/xe_wopcm.h              |  1 -
>  7 files changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2e62450d86e1..fa3c7ca2f2d4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -230,6 +230,8 @@ struct xe_device {
>  		u32 media_verx100;
>  		/** @info.mem_region_mask: mask of valid memory regions */
>  		u32 mem_region_mask;
> +		/** @info.wopcm_size: wopcm region size */
> +		u32 wopcm_size;
>  		/** @info.platform: XE platform enum */
>  		enum xe_platform platform;
>  		/** @info.subplatform: XE subplatform enum */
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0d541f55b4fc..b4e089c3333d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -188,8 +188,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> -	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> -		    ggtt->size - xe_wopcm_size(xe));
> +	drm_mm_init(&ggtt->mm, xe->info.wopcm_size, ggtt->size - xe->info.wopcm_size);
>  	mutex_init(&ggtt->lock);
>  	primelockdep(ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 79116ad58620..18b7aa8d1f94 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -575,7 +575,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
>  	const struct drm_mm_node *entry;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
>  	u64 spare = pf_get_spare_ggtt(gt);
> -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> +	u64 hole_min_start = gt_to_xe(gt)->info.wopcm_size;
>  	u64 hole_start, hole_end, hole_size;
>  	u64 max_hole = 0;
>  
> @@ -1932,7 +1932,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
> -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> +	u64 hole_min_start = gt_to_xe(gt)->info.wopcm_size;
>  	u64 hole_start, hole_end, hole_size;
>  	u64 spare, avail, total = 0;
>  	char buf[10];
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 240e7a4bbff1..48468c0bcf7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -41,8 +41,7 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  	struct xe_device *xe = guc_to_xe(guc);
>  	u32 addr = xe_bo_ggtt_addr(bo);
>  
> -	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
> -	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> +	xe_assert(xe, addr >= xe->info.wopcm_size);
>  	xe_assert(xe, addr < GUC_GGTT_TOP);
>  	xe_assert(xe, bo->size <= GUC_GGTT_TOP - addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a0cf5dd803c2..55f977124647 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -57,6 +57,8 @@ struct xe_device_desc {
>  
>  	enum xe_platform platform;
>  
> +	u32 wopcm_size;
> +
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
>  
> @@ -221,6 +223,7 @@ static const struct xe_device_desc tgl_desc = {
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc rkl_desc = {
> @@ -282,6 +285,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> +	.wopcm_size = SZ_4M,
>  };
>  
>  static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
> @@ -306,6 +310,7 @@ static const struct xe_device_desc ats_m_desc = {
>  
>  	DG2_FEATURES,
>  	.has_display = false,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> @@ -315,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
>  
>  	DG2_FEATURES,
>  	.has_display = true,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc pvc_desc = {
> @@ -324,6 +330,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> +	.wopcm_size = SZ_4M,
>  };
>  
>  static const struct xe_device_desc mtl_desc = {
> @@ -331,18 +338,21 @@ static const struct xe_device_desc mtl_desc = {
>  	.require_force_probe = true,
>  	PLATFORM(XE_METEORLAKE),
>  	.has_display = true,
> +	.wopcm_size = SZ_4M,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
>  	PLATFORM(XE_LUNARLAKE),
>  	.has_display = true,
>  	.require_force_probe = true,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc bmg_desc __maybe_unused = {
>  	DGFX_FEATURES,
>  	PLATFORM(XE_BATTLEMAGE),
>  	.require_force_probe = true,
> +	.wopcm_size = SZ_4M,
>  };
>  
>  #undef PLATFORM
> @@ -567,7 +577,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> -
> +	xe->info.wopcm_size = desc->wopcm_size;
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  xe_modparam.enable_display &&
>  				  desc->has_display;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index d3a99157e523..0b5a11dbd770 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -45,14 +45,6 @@
>   * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
>   * context).
>   */
> -
> -/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> -#define DGFX_WOPCM_SIZE			SZ_4M
> -/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> -#define MTL_WOPCM_SIZE			SZ_4M
> -#define WOPCM_SIZE			SZ_2M
> -
>  #define MAX_WOPCM_SIZE			SZ_8M
>  
>  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> @@ -177,13 +169,6 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  	return err;
>  }
>  
> -u32 xe_wopcm_size(struct xe_device *xe)
> -{
> -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> -		WOPCM_SIZE;
> -}
> -
>  /**
>   * xe_wopcm_init() - Initialize the WOPCM structure.
>   * @wopcm: pointer to xe_wopcm.
> @@ -209,7 +194,7 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  	if (!guc_fw_size)
>  		return -EINVAL;
>  
> -	wopcm->size = xe_wopcm_size(xe);
> +	wopcm->size = xe->info.wopcm_size;
>  	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.h b/drivers/gpu/drm/xe/xe_wopcm.h
> index 0197a282460b..37a38d10f897 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.h
> +++ b/drivers/gpu/drm/xe/xe_wopcm.h
> @@ -11,6 +11,5 @@
>  struct xe_device;
>  
>  int xe_wopcm_init(struct xe_wopcm *wopcm);
> -u32 xe_wopcm_size(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.34.1
> 
