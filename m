Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A03CEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 15:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0317410E4CE;
	Wed, 19 Jul 2023 15:29:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B700310E4CE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689780552; x=1721316552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HeH1VJRpGd8m0Y0lx/9hyd9nOtBdrT8IIEOR0aSAIVg=;
 b=WVy+m8vWi6Atjeg6tM8U5RJlg6dW+WZ3Nlpz4rX1T9mOmLdLVGGLvnR2
 joFKgF4P7N9d/vr5KDGjO2Mbe0ZvmJMwUoU4IMfPx6bYH0i5EsVVfgn5b
 ysL8ugTeg6ADsIgp6E1a7YwapphMFn/ByQ7DmyxyyefxJ5J8ctCBqcAIS
 P9QT5TUjivYajNo0Gm7PQ0fI/4F6Boxn2T+mFW1NcwK+5V4y1A15xXJl5
 83v3ZQHNYU2Hdck2F1mS1sa6x3d8/yWiw6ZxkwWaEZVXpcb+QAGi86gZI
 L+QUUCXlaBg6rWVK6L8eHF5SP86SFQYb4F5h1SXOutauE8cPPIyvO836P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365377356"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="365377356"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 08:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="897954893"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="897954893"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 08:28:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:28:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:28:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 08:28:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 08:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXhG/JJaepd+QPRymP8HO9NieHPLvQ0OjJzlbatbceXWBd4BtJyruuom+3n4QXrpd46O0nO72y/vJpZgw09W3fYAbaXD1YYeZpsyJD5Kmu/AgR5gENQ3OmUsUfDq+Ve0pxaa7B1J86N48dqolMUcfAXkF5RxpdAIsAoSBFyH9cLylkBIhD/SDdwMUs2rHBY7WamHeuaqt37bGgJ9FwInY5wx3Sd0pavsiE7E9bzqxPTjp3FjHU+W+t0ZD4CrDy7VkwXvbw1aQfETQyAgIV8GASYNwXNMHb/YU5yr7fa3F2+EOBiva4TH92HFwEAqiTni7UkCu829kekiOUyiHED4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UXTELpfv8BlQEl5XYR3k7hx/lBNZioi6ZNZ2chYr1U=;
 b=X2g8ZbLN8+2LkMcRt1H7V6oPzP8d4YE+H6Atbh9VQYISomaBu7Egd91V4tVN2f8jdfz21Ky/vplrEGiAhO1ruMCAE1C3D7cdjLuTX1z+8tSnu7gv3RrH4McjcUod/PgPqjvxYjEja3b3K5K6TxcghdDnvd+HZm7KrvN1WjyLG5mxGPZppeiTkwPj1nK4ESM7UYusMR4KRI9US5XmesZ/k+irDaW4HOpNrOUuVVUXMjhpS1+GNhiQgmIBNVVjVemRfdGDklUPf+mrE6ehO1YmvfJYHd6Nw0/Awb3CuD9KQkZw89DRY8QZtwkSXTtdC3SFPRyu8YixKNvy8zlK860MQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 15:28:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:28:47 +0000
Date: Wed, 19 Jul 2023 11:28:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLgBKwPAuBbDx83n@intel.com>
References: <20230719135108.7-1-francois.dugast@intel.com>
 <20230719135108.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719135108.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: e84aa356-68e5-48d2-881c-08db886cd817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9RLrFhS1iUaCNmJ3UBnif8tyazzYy82K5HaUep9pxjfIbJm1FQiFGQtzBmTzV2m5QaheKthAQpI1JfNLWHTLubOzIWHRNLTIxb5hoZq15VNldEegOA7Pz/v+PT/9huqnJpWfIhjl1f8fdJsujKnBetX3ejueDzF7/OmPS4qxc4ijYQHNq0tAHhVTb+zIcBCV765OxyvIIfCk9rfQN5v7JIXVr7PbpPleWNefitkjJnV6b1uuKSPCjFV7fVFgC4cp1i84EDuWkL/KJxbY94k7qJcPuRqcIkBBVy2yCICU3cotoBl643PktpU3hCE2DR0crytV9ybRCLKROSx1hb/PUUiOwfa9c0zpT3BZltD6wK2uLuKBONweH3AwLy5ZMy2jjvJ8PQegar1WAehIkEj+67mdq+b6Z+Sub0RjAAt+VewiAlDWmfAL33FVfpJ1QOqxyW0dJq/Xco/EuygPsoDVrgIrhvQbVEt90FwUa0Qe0xWbbKW4hjpAewSutJoW5f8nvIIVu8OCoGGRKTPegbLkw1QOHF6tuC6kmxiu+B0n+dbCm9FuLO+b5adrmIrATSG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(478600001)(37006003)(6486002)(6666004)(107886003)(186003)(83380400001)(6512007)(6506007)(26005)(8936002)(4326008)(41300700001)(66476007)(5660300002)(6636002)(36756003)(6862004)(8676002)(66946007)(38100700002)(44832011)(66556008)(316002)(2906002)(82960400001)(86362001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ba+zUpQY2mrSAPpLyTenQWJ71JKJ9TOlqEyd6/53Dv7xC5ANz/Z1zaAq1Jrz?=
 =?us-ascii?Q?xMhxjIwDHiYoV0nETRv67+t7k0WSNzpfrUC/CjMM44PnfuUml1nHGGBJQLuc?=
 =?us-ascii?Q?F5tsUGZ0LzqeiP4Ne8XxyN62D/UXkZXmoGtt3h3NpDdwJMo2Rk3eCGWsAuFZ?=
 =?us-ascii?Q?Jl/tMdGSrU9tbVKQfFQ3Gox8/rc+M1lwSdcpQMd2vQPZz8g6agZ3IeV7sYtS?=
 =?us-ascii?Q?71VTxCckIMgutlpvJbb6AYirpgVjY/14OHWn/ZP2ysuZRXYT3VoHwqm8UINO?=
 =?us-ascii?Q?39GvZkKqiHPqJH8kOlAdIfpVUkCKcVPY2FlWpAoZGSXyfTXbsd5PHuKfTyZ7?=
 =?us-ascii?Q?YmyW2zNwOW3XsgOpev4O/9B/OgNow5zEJSmcgrNraV+Rmf2HZH51TguxElW9?=
 =?us-ascii?Q?6evrYlRaDbu9b3Pldq0e+/6j00S0qIS2cqq4b60ro3Q8PDkBu/j9XvmLf/j8?=
 =?us-ascii?Q?WtSjs6HC1fqHsPJZUwVGNopm+W9/KG9o0hkyalsxqkEe4ItgrDWqcPe9ztph?=
 =?us-ascii?Q?e7PoqBMJpUd6Fwg5cMcSiV1v2aQXjybik+Z6V8BzMSjoKNdb/CQ0noLS2LTq?=
 =?us-ascii?Q?5ePVyyBXEttiVdP/83HFnfX4Rf0qrF+MbtPKh+Ed1/iHKn1GqvorZzOGxQeu?=
 =?us-ascii?Q?+bv6Cd8mA5EZ/POgIiAijcWR4bBm0UVjvj52Dwed1Jfo+OblFmXhHwOT89g5?=
 =?us-ascii?Q?UK6sVdl0fVFodPeQKXwPI0m6ZH1dBebks6pItLdnE0ZbXGpED5FdVELwKIc2?=
 =?us-ascii?Q?IjMKbMZharqaWuyGVW8r7TcRMo0LcUMZFiCw9R/T12kdHZ2I2487YBuFs/Ux?=
 =?us-ascii?Q?QXcSv9riajZOsT9yrJuEk2PSYCSZoeIsC6KPI0n1nrBEz3AS/dCfMlfyxohe?=
 =?us-ascii?Q?4wrcepToWt4h6WJVv6G3Bxh9yW0JZQFaAMwubxcAH9uUFsPtlJXtk+Ra8odw?=
 =?us-ascii?Q?3m72kU/vYXBVHHTRxz5AuFmEmUHf53f0q/jKVCapjWEEKTvVCmRXyGZZ1I/E?=
 =?us-ascii?Q?mTji/Qe+X1ikrMMAJ3LXWDEqiKMaZHOB8Z/XFlFGveDHjCXrW5zWsw8PUyUV?=
 =?us-ascii?Q?BVG3p/Tmopga4vJjxTHYOYd5N7hkv7ejOKDpsCTEgqpywonb6OikwsB9EOQT?=
 =?us-ascii?Q?7lylluwgMyUBvrLmtDA+XY/BCTItVQ3y19Fy/yrB5FNrHKhNNppGdI6An38z?=
 =?us-ascii?Q?/1M+6tEqEeEgmSyJoYQQG80d1aSSzJd84Bzs7RH/wP9BHzt7KwqnIuqBBMQe?=
 =?us-ascii?Q?5TjmqAbIyB5Yj5iC74Q5ghOQ4EixMIsJ9l4esJqnleL3tieHEjlpzDX7oTF3?=
 =?us-ascii?Q?czXV84GVKOYwZeZcvgW2nuGc4phWIfh02EQXl+O+bZdGgQM30VfzB3N3F0iV?=
 =?us-ascii?Q?HnaeIZAuOZCGYaBnslyyqlYuVkgCdmVdwIGFYWylOnJcUUnnSAsVZIHe1f0M?=
 =?us-ascii?Q?uDGwpBxMCAComZMkLJycouh9UcOR2kSDMCMVFMFzLpdaGIq4rBe6+qX0gfm9?=
 =?us-ascii?Q?zIVVBg7zbvthfC3hQoovFzinZe235gqTiGt24QZ8MUvyFCrgu1eRh95uVBhX?=
 =?us-ascii?Q?pHJWXCdet1hen1AKTy5K8ZwNzrjR8bPvoFbgjIPbXurMFbDSBlq8zUI94msj?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e84aa356-68e5-48d2-881c-08db886cd817
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:28:46.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZah9Aa9H7Nf8qcBTw62t00PTOQYuOWAJd9Ihi6x0e4bCcjGjmagwC6ljDqDIfaCfGE1gAW2gv7euG3lST6+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/execlist: Remove leftover
 printk messages
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:51:07PM +0000, Francois Dugast wrote:
> Those look like leftover debug and are not even being used. If they were
> real debug/info, they should be using the drm helpers.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 46293c9bb6a8..3aec37985f32 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -47,8 +47,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u64 lrc_desc;
>  
> -	printk(KERN_INFO "__start_lrc(%s, 0x%p, %u)\n", hwe->name, lrc, ctx_id);
> -
>  	lrc_desc = xe_lrc_descriptor(lrc);
>  
>  	if (GRAPHICS_VERx100(xe) >= 1250) {
> @@ -125,9 +123,6 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
>  	if (!port->running_exl)
>  		return;
>  
> -	printk(KERN_INFO "__xe_execlist_port_idle(%d:%d)\n", port->hwe->class,
> -	       port->hwe->instance);
> -
>  	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
>  	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
>  	port->running_exl = NULL;
> @@ -176,9 +171,6 @@ static u64 read_execlist_status(struct xe_hw_engine *hwe)
>  	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
>  	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
>  
> -	printk(KERN_INFO "EXECLIST_STATUS %d:%d = 0x%08x %08x\n", hwe->class,
> -	       hwe->instance, hi, lo);

This one is indeed annoying when it happens, so we need to get rid of,
but I believe we need to have at least a big drm_info somewhere to let us
know that execlist is in place. Probably at execlist_engine_init ?!

> -
>  	return lo | (u64)hi << 32;
>  }
>  
> -- 
> 2.34.1
> 
