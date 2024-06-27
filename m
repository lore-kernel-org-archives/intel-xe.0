Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DBEC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4EB10E29C;
	Thu, 27 Jun 2024 20:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkWaOuHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B398710E29C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719519095; x=1751055095;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=onMY6bAo9GLMnK+EYYnfV8JP8BUgj9TUl0ausJmSkZE=;
 b=NkWaOuHX1iXQUcJ+RCK55dAC1whsNHBGzuCx/dQT5dp8a7YIH4uHiZEy
 AMx/TbDR6BqYvcxN/hglWK2LJYq0r6WbdAYyMjjDVHL59kDVcx8EKxZH9
 2O8OCdnIdh8Up3EQOme6g3yY03wF+2SgTT6q5iaNGLCCFWXisa/t+cTt5
 HLBANJ52TK4ubc7hB2/59bo8VDo4yWwxPFr4g4vUYzh9yqaBnUldJr7qD
 ZxgoLRUVGRj+v7hI2Qan+b/Rf3d20NA2AJB6zyq2AdF2dUZ1lIz8omYvw
 s6Cpuk+D0ar4RtKZHRJ8M4Uri9yqHjS03HODnXbZqqox6rHyAXQ03MlHm Q==;
X-CSE-ConnectionGUID: 1hrS5YLmSq+yKsKvspc93Q==
X-CSE-MsgGUID: YpVCqj3FQ72+amr/v3/MZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16903240"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="16903240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:11:35 -0700
X-CSE-ConnectionGUID: lJnFKAuwRwCh2yN1VQQ3Sw==
X-CSE-MsgGUID: B38ZDNtfQamF+21tJCj8dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="49680012"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:11:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:11:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:11:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:11:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQhzjDtMLci3eQ163Y3Pi5wi4JScLO40zLrig09QmAt2BWw3MD9/QQLvC962GguWf1LMa5Y0ObAoHokOJBUqfJ2EcJkjfb+57k1NpZvmP4QmLdCBETxJXNYUzVYksO2U8502Ged50pkFd/Ltig+q72k1YUd2mga4NLRkuwIUvzVH/kEISyw2hJludApcv/+aXWtFc6a+JRUPA9JeuAuLoZRzboZzRwCqVtuX+stwXYalSYVn44ns8GGlbpeJhe9p6vmttk2Wp5i7WJIiHJTWZsgFCk34ivALnMrHNkEJQWTvTdfl7OfyxsGx2vAOBFUpNltUuv/Ii+R2XlBkv8kSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyqE6VDDrckWVIC1ZTjaR9OmBCkzjkEGXRrE87fD9qI=;
 b=MJnk9IvDnX1NEeoB6VFPkbf2A52Ipn/9QJvlaaM1NnziFIwdp9p5whVFng3NyU09ZKKkQ/B0g/SVnwcjJH2A/97L8IIOr781hV4gSGZaXV6cG+B45XqxIlIl5XyOjJsVA/PGGuRAr5zNwIE7GvYlsZcjRZct7lxNONxWYW3FTNy9S++WIvpkZSzsVlBVio+7bN4Vp9bhwTR82qwcmiJQR7GouFa5hm18RiYKDkU4rVDefjoDk1LIontu5hu9gQcDi3JkWF0ZyviXNK4RUSjQ5WK6ltLeTkiIFOyROxGt6PODXL4lsgiVhKh2XkPS3quHPtcWJOqAE1ca5ned2LkaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 20:11:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:11:26 +0000
Date: Thu, 27 Jun 2024 15:11:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 2/2] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Message-ID: <qotmiz2us5eiff4ewl2btcbyijqfcu6vq4gh3knd6qfieddnht@23wi4yz4tveq>
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
 <20240627172348.84991-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627172348.84991-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4665:EE_
X-MS-Office365-Filtering-Correlation-Id: 47584d0e-bbdc-4cff-4c09-08dc96e552dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CwcY5X13eO/5YrhLMpYZ5rT3piCraLho0cxlWThxvjJ+S+lbCRgvbnPiaH1E?=
 =?us-ascii?Q?bQty4Q3lxjDYbzcmFGMj1ncmluMCNiR4kc58y4tTTdlgJJuDr10g6yleqPRI?=
 =?us-ascii?Q?nl3MHESSwHJDXUALLrPtZ1t3c7JnkYOwgnOj6zz4EmVqaDfHxGK+AS6LrnBC?=
 =?us-ascii?Q?vM+zQIx2gRifov1rCO795lbHC+owkqXvuib6z3ITz1dB0AuoSSQ4X7Y2O3N8?=
 =?us-ascii?Q?3eOUB43noKJELYV6go2vKy6C/S7tTqggaFkYlqjsRidLcEGAK+Gc+WNbVLF+?=
 =?us-ascii?Q?ntnYOtPX3RRDl+GB3Yk+dX+JFYzHcKuKqU81W+6B38VT8Fcb2qP+Va/r2SjU?=
 =?us-ascii?Q?Rmx9+tmJD7mc2ODFFLi/Rz2IIz0Wzd9Bg06/giDy29kvQucpmmPMkfZ2ulUU?=
 =?us-ascii?Q?rGlEgCPTiopZi1JcHQKE/o0BVT7m1xo29aJF+d7KSJrxb82ch3+deN3BylJd?=
 =?us-ascii?Q?Zwe2LeigWBTGR2vIvojrh3/gSf5w7K8SbkuC6wBBn80N3SQUDsj3wnPuH0Cy?=
 =?us-ascii?Q?MBHsdLpPROvdV7iVHo8zdMtQ4DnMaKMzbomZcEsSVAjdA0P6vI8/Vk1xRt7E?=
 =?us-ascii?Q?PGDwpmOqj6DnVZjQtK7HbzGoeYbXkH/VeLwh5595hpArT9umnGGttA6SIWj7?=
 =?us-ascii?Q?+zNX7VIiBs6He4hkyIltemdE7q72jrHg4+HSsgYGN0Jwjq2192O3ykMMS8gP?=
 =?us-ascii?Q?xaDwR5yPj2+50eBYC2bXPUa0N7HYjssrR/W8edcn41e4/PQBy9+FOXY2wa6P?=
 =?us-ascii?Q?HX+vJqrj0K3qXenXoHWkrdrR9yun/25f426CL4/Cp4vTBFbbsYkoXaJ96aY9?=
 =?us-ascii?Q?aiuanmEECydpM8hfbgorMULmy/uOtrCEL4LoGebfbEdrsift6LfAGCZKrXkI?=
 =?us-ascii?Q?CwEPvMnGboXZscOeCAEvOnPKjwR0Jl+LiobPwv7lyjWFsFcqxgPASoFI11qV?=
 =?us-ascii?Q?6u7pWa1NQxNqiU13fjrCPqQvCMZmUcRABb2Tc535Fp7U/ns3YWsSPuNC938V?=
 =?us-ascii?Q?VHytINvujs6ZRxHiWoO3pplcg9SP05knw2RuSiW/Na9lGrjPIY3VOYLhTipC?=
 =?us-ascii?Q?3AbV7tqhQuRdMi64Obi94eZSCEvTghs2LcJ/MY6rzhV6lEhEkuApZ9tR0EWF?=
 =?us-ascii?Q?lEbCC6LOHJkobkbMkQ4j2ozHxZ1P9Gn4w2nVwLpmxIMbAzwK2n/+C99/rVXO?=
 =?us-ascii?Q?drM94vdkKjBK90zl2dnowYJs7u9genBRTq5pXVxb+KMQL7W2ZwuitUa+pZO4?=
 =?us-ascii?Q?KE0H1RmdAbm2pZrHAbYGBZxdHuQwUpNIV5zPfzIGkUdqERGIfPx/VnpUftBX?=
 =?us-ascii?Q?LHEfRxIhhWwWfZagD1zhyvc+geTOoMUjftzs+iun7fFwWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RY/HUA3mqZHMZEfGxI1ZE6WI/fxxW1Xesw18GWPBCPSs74rf9OJeFdukLA9j?=
 =?us-ascii?Q?rt+JabR7Nf3T++lJGZ+q+nw8+IQ2DXE0HgybAIgdZbrkCZ83r3LlOqELu3QG?=
 =?us-ascii?Q?mToLGKfWzgRXGe7YEYLDlhQafp8wbsVyee9YON/2lFsHw42IYEqrZWAMNK/h?=
 =?us-ascii?Q?+wZGRBOkRsnxv0F/Oxama4rZ3N2lgY49MVLZviYZ2kfGi6XEZxqEXJjHGbsW?=
 =?us-ascii?Q?GdOrVuDGxs2WfMBwWxW4OrPV1Mjr6J4drl1x7hrKz3r/lE53NiuXTFj3qQ/f?=
 =?us-ascii?Q?1piMZHwdSogLmSpuKwdedIDrkwc55gKNcPp997qMg/T/RtvaFxxxXB4edmxG?=
 =?us-ascii?Q?LCHqksCdmoqRDjtrP4TXJbYtYuKu0n3quscoF83Xu1ecOSFgon+TFeaZBpD0?=
 =?us-ascii?Q?FA4inO9KlHOscwWn1Jg/zrjHqt9uyKmF57v74iZUZhqcrU6E7lvkbTWzSX7F?=
 =?us-ascii?Q?XEgHbd+bH8Vo+nvWcVz7wcvem4g5+31IChn+IQqbD54qpFyptnj1NuycAT/G?=
 =?us-ascii?Q?oZFQq8jwjaEJld+sbviOb6DeMeyXVQZ5eQT+7Okmg03EMU9PUceRyjdfYg3k?=
 =?us-ascii?Q?iur7tM0ucH+8VqruejJx5R96OsafoLtYJ0C0XeyG6D2i9OlshfiLONgTDr6L?=
 =?us-ascii?Q?aLFs1XdfTGeZHGPtxCNt0ciKpHH4FtQNNAofmzuNMJvFfeL+CdSVlk2gZK+3?=
 =?us-ascii?Q?juG2koXfAjg+bWpAHfEY1ArYYRBzJnOf7RYWp4AToQiyqEuptohbsuRey8Sx?=
 =?us-ascii?Q?zglWu3RCgjamL2LB2cimsrtWB4yVvVB3CyIbpJdmCUWeo8+E0t3ZgIqRkT3X?=
 =?us-ascii?Q?s5Lou3f36UDiMYWjSjSt1yLvmKW9YQC5HWp0og67vSSH4n440pdG7fH+pW47?=
 =?us-ascii?Q?WaeSEiY7PYQQOaV+ukckjwFPtyK7odHxcaHugFzgfoCzAfwZdhk8DCh0FtNE?=
 =?us-ascii?Q?HLKEVMg1Qjjo/4yrxqxxgo/9/Y5td73xzxdjzPgYOyZRjm+2ZhkLBiOnJfY+?=
 =?us-ascii?Q?oz2lUA6q5MsfE8laFir0G18PSswDhUfALIvqxqpMO8P14XoORoQ9cljm1rkM?=
 =?us-ascii?Q?qUnrAAw5UwYm5yNnzj90T1KxM54rk3JIoDmn7IBARWAeI+wJArxiEaP0Hwj0?=
 =?us-ascii?Q?WZev6ptljdhBv3idZuczAm3TIzGYDGTsFS4fJefhKqkiHJUbcSpjosVsxLrN?=
 =?us-ascii?Q?RL/LJCDDHFkYDtDrLAeNVfy2dQkVYtQjwbA28lfdzusxGjvdUpDufJUnNUra?=
 =?us-ascii?Q?XjcyfbGgKAEJnQbQkUN20nR7gSxks+8Wm71nKLGNRqrHMh6ijTl+M+0T7umM?=
 =?us-ascii?Q?jRwBfiksl5vcUFBd06BvJMgnPnscRj9Zdm2c6oOSi7ew7oCmJQ9iiqs29LIq?=
 =?us-ascii?Q?cRUW+pET4Yf6GvnCROHAw8BDp4of8tN4ktyCOatBupOyDHK84gkiCuxV2p9q?=
 =?us-ascii?Q?wbYqn/1KqK7wsFYZg/jHhazZpjS9C62I3B2NieerNfMWjcVIFhltePY/0I64?=
 =?us-ascii?Q?NrKuUwcdizqlNcL3iEFzkZib4Y3t5OOnjWA6IxE/e8eSOnSV6oBda6WW4oMW?=
 =?us-ascii?Q?tO20QnL9ae7Pd01iPnH0xcdiKfI+K9h1eD6cjM5MvGLAp/FJpHoGjPen9oZ2?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47584d0e-bbdc-4cff-4c09-08dc96e552dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:11:26.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZdWdVerHLhanmoEu/nxrPHzifVTUcXmbZ/ToZvQOErkPyKQAq0P2Th27qOSQTe+9CG8CU1EjHJiihefPdljBGnH0IqQQ7CBtGk/SFVjnNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
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

On Fri, Jun 28, 2024 at 01:23:48AM GMT, Umesh Nerlige Ramappa wrote:
>Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
>the user. Current code uses XE_FW_GT to read this register on the first
>available engine in a GT. When testing on DG2, it is observed that this value is
>0 when running test on some engines. To resolve that, get the hwe domain
>specific FW for reading the engine timestamp.
>
>v2:
>- update commit message
>- use domain specific FW (Matt)
>
>v3:
>- Drop check for hwe in the helper (Matt, Michal)
>
>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
> drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
> drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
> 3 files changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index e0c4a50d372c..bc120b0b06b8 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -257,13 +257,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>
> 	/* Get the total GPU cycles */
> 	for_each_gt(gt, xe, gt_id) {
>+		enum xe_force_wake_domains fw;
>+
> 		hwe = xe_gt_any_hw_engine(gt);
> 		if (!hwe)
> 			continue;
>
>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		fw = xe_hw_engine_to_fw_domain(hwe);
>+		xe_force_wake_get(gt_to_fw(gt), fw);
> 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+		xe_force_wake_put(gt_to_fw(gt), fw);
> 		break;
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 78b50d3a6501..07ed9fd28f19 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> {
> 	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> }
>+
>+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>+{
>+	return engine_infos[hwe->engine_id].domain;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 7f2d27c0ba1a..900c8c991430 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -69,5 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>
> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>
> #endif
>-- 
>2.34.1
>
