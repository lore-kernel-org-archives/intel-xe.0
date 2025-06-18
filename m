Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994FBC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 19:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306C10E1DC;
	Wed, 18 Jun 2025 19:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boG0KGj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58D10E1DC
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750274536; x=1781810536;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VXNqTH6FnkvgmSib3y2mdGSKD8L7Bi5dYaa81EEuECk=;
 b=boG0KGj0hHwZ6WEIDNucutE3xxf8FX27mdUoYxs/1BpLp8aNqcAl6NW+
 x0hNqWQLrcK3hIXJxbwXvtx125L2nqf9YnCNYLkCSIlQrJXoK304FcBmG
 fBZbTLyx9IL5NvKJ8Z4xDlAlVOItKQCCMUqkVwXCDhBLVcNI/HeoxFyiR
 ihwhPaTLl8GMgOZf57qLqfKGdIL0kp55imO6xEMnFlwBePwFzQ7V2J1i+
 qrAR9sdPY5CoTEOTKcSG5mbsVOhd+pHKHR7CZRFgYYuYjqvKwoIM+7ZUN
 fEwOiMgqLvjeYFu7VeQvil35YWGwuZc7anlZ5OdmRap48NFgUmDonuL65 A==;
X-CSE-ConnectionGUID: 5JZF2QBTSuq3y/4vuAooKw==
X-CSE-MsgGUID: pf0HOIw9RfCzCebCqV5K0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52656257"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52656257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:22:13 -0700
X-CSE-ConnectionGUID: 2VHwclXnShiivSejJ1tXbA==
X-CSE-MsgGUID: FLsOg8k9QsyFYmOfAeNNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="154648038"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:22:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:22:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 12:22:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnqAUq3YInbKkvwAtrAA3E4aMrKV4NreC8sRrJyazk/EdC51kguyPBUHU7sYzBLjeH1/iR9dA/Jxf+wgCfRexSxw/b9aKoxg0whwUjn29FU3Qd/8jjsQOrn6QGwLgf0YxJ6Pw5QO7Btnr33z1+/nthkzE4JSJDmsrWVunBaaM6Hx+ZLDM46z2kI/rVDr8Db815MOXa7M5GnCblnUcnVbVOr92KAKT13h0b4SRkt5s75sLMik7oWWdSTK7ek5RxYKsiK0c3Vs+c358XTUrK9LgR+U1bdoV/Urn2Q+RmNpSdg6BFr1Xuc//FhYvUFakay+n7d+nGPlySmEZcjv1a6l4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ9IcqAVFGUnr9nGDQ9CwIRvB9d77yiAfW2B9KidYd8=;
 b=i60M8I9/t9SqRk+CNNiUPMgXC5IdFqu8sE4KUO4zXY9aaB+I0fSCKnp596pjHIw8diJExsdnOCz5SnNcp94ckLmWHwT2gDGi42SNBRMmrclp4QlB6KAC0HjRgcWiMj/KbTD3pqe6KUiA6rsIJzoEBKVs4NGyiJxscnSKZwOYrz0xhFOyyZCNWIXKaGpoj96FPBjebcpX4Tf5AkoZwuKC14PB054WA1p9EU0Je98EfzmpuVoVPPz6qLB36gFTCF62VJSQh3OmK+W4Yd75V9REf7K7gendKUVwIcgTD5z5GjE9uAF44mUCAHUukb9d2ALYWgNzjUVHH+hlAuSqZzkCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 19:21:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 19:21:56 +0000
Date: Wed, 18 Jun 2025 14:21:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/9] drm/xe/sriov: Move VF bootstrap and query_config
 to vf_guc_init
Message-ID: <vntlvn3s75wpa22qymjemmj6lmvnvrwfpf667twcvjre4iztab@4eogyo6vx4wk>
References: <20250617180132.7059-11-dev@lankhorst.se>
 <20250617180132.7059-13-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617180132.7059-13-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6d0520-bc49-40fc-f52e-08ddae9d63d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PbI67pja211MyH6qXevwGO/t5ZG8gZ1B0DRpVTvBuj4hR2RqbwJ8C/MT+L4a?=
 =?us-ascii?Q?SNnTZZO4nFDdvSvleSva9P+l8i/nhOOgnYVWtZN+qLjxZLVW4k7pNjJ2YHEH?=
 =?us-ascii?Q?aTXuPTgblEwshxEiBYkpzPeOVZtqg78qpUZ5x6MvxkD5jDe+nPuCxoOO35mz?=
 =?us-ascii?Q?NRSN5MtP5W6CFtSN60TESoOYQp8ZtoVCUxBZB50hohbdpqPOuFsN0xveVTm3?=
 =?us-ascii?Q?rh+KyvhE+urEE7zvsif5knHqF7zUS7K4ud3ZyjPHmVEPxyb9+JgLaiMm/OWT?=
 =?us-ascii?Q?MTCDBwsX0XEHhroyMtIgOfRNyxBt/GguzJEgSfB/AlWSOpy9pbTVvTFEA0Ik?=
 =?us-ascii?Q?kUIXWA7hrISLeEb2MkYez+Lt3w/kqRrgYhqBj/mPw1M623jeGyUYQOPbdQZB?=
 =?us-ascii?Q?vKkLOglmQEU8dQ6QpUUMuCaYvhueuZ/gYlGex3crzQSxzVhMsEdrWrQZkF++?=
 =?us-ascii?Q?mEdUyNILjvfU5stYe9Arcs0MFE3teFoE2HdzOwMTHCWHll/S8oGdqKTcRbQq?=
 =?us-ascii?Q?kssbjR0pQBGMCxmqr0zRgniXugmtZGXhsh0fo6eDcPuOwyZJl0briGNOUTH6?=
 =?us-ascii?Q?Ti54Sz6nrycDnEttzeZzvdcxJhqv52KinMS1yS6ZDjLxOy/NhzCyAXTDh0Hj?=
 =?us-ascii?Q?7x5vhD83/WdHsYi/nPQqQa0QEmRQqHLikhbCLyI7PfO5k1e8q/Oh8vfAcgeq?=
 =?us-ascii?Q?C2BQaOwIX7UeY674O2RpTFIpq1AkbFKZRA3HIhRL6kJmGDfoxZJCMurDzI3O?=
 =?us-ascii?Q?zWQ/aGIz5hruhCFlqiUjf7ImaUP2DUgzzDfxpaWY4ZVkQjw8tXaGErmGE9Nu?=
 =?us-ascii?Q?il2hyxpWRUMu3vbyZFXpCf1L3PWtyy6ttCqq0DRvNgsoIh2vFVNsIVYKI8Dy?=
 =?us-ascii?Q?xIT9b+U5FHMq6vkehbdWnxQBzheLkxVdTsgL3jL79MQilWzuBvh3urI/o4l5?=
 =?us-ascii?Q?f9ULjdBICUcKHGGN3xgt62fv1OsGuBZaKCegM7Z/IkrQqvWMg5LJsfd+5bLc?=
 =?us-ascii?Q?3eGpERGdiYaUV0/RvqNf0CXGNT4yZgLnx4Atxw7QE25LecRUh1nUULJHfR1p?=
 =?us-ascii?Q?zwxMw0Ra7bpwRjxnkQ2jJvppf8p/HgCU2gN03BfSxnoJuqJn7NNIisuTcgpp?=
 =?us-ascii?Q?xZojrM75yzrmHJv2vD2/mngXQuo2RP2t52xCdlAiaznzfSEKQdn4mcqW0b/b?=
 =?us-ascii?Q?vOns/Pl/DvcOeuTIYODMSjSYC3AyPpnOHtrq6+vFUNM01nAEk0RLR34EwQbN?=
 =?us-ascii?Q?GCMSnlRUiijU2uIGDKZuBoV7fvgjsKArkPpplzLB+aKCO5vrWFD32IpMb8y/?=
 =?us-ascii?Q?gkitqovoFeAce6k4v5ZzODWeoimXIEwvBsyNb4pKU69r42tiroVTiBJz+tec?=
 =?us-ascii?Q?gToW2GzIrrZm4z5kbY0rSiha+NxwLdvICvkUtKvI5NMfNvjwMu/T0fLe1Vpt?=
 =?us-ascii?Q?QCDM1DLt0S8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIVOsnDgVGQTh1TUpJnS5gw8h/fbt1L/IAv6Luet95Qok828pezw3V3UwVPD?=
 =?us-ascii?Q?dMm8tjkXrHG97dTO/IrxTSVldM3Og+eXeaX1eW6a9A6rnvXXDGGuYOp19lEX?=
 =?us-ascii?Q?ckPQpcgm+zyGEbxz81JqAgQMMePQX8uzPJoCMukxu42Uc5UukuIhxoIf7REP?=
 =?us-ascii?Q?HgPimghXtT++DYLqC5/plOXhkhYh51uv1GxzClXkPREmk+KTTMt4LrS+gVlF?=
 =?us-ascii?Q?ePafajlS2RUdrHsviA5xQ4HD4uFK/rRbv8XdS81/dg2lHbrkExvfje/lb9CY?=
 =?us-ascii?Q?Otvpt1h0qCvXGdkjUMIfLEwQsCbcFmA8zhMX7Fj9RobvUXhzMak6dmMwmwA6?=
 =?us-ascii?Q?aH0ZFPzMSBRBW5kEbaGic57Y2JmglBztuvTEsZhUQ4ld3BGl5xGfVVsnaTKw?=
 =?us-ascii?Q?JE38feVbieiheTdDzWMFQIIcsyZ/Wxew0pndx0TwNF+/bwRRoMGsdvdTMLLb?=
 =?us-ascii?Q?NGUciVfH5CQ0YUN1KFvE1ZccMCaR1CMdFMwh6q5kmRMyCkPdBxIdZbF1K5Vh?=
 =?us-ascii?Q?w8oUCIwhd8YkrsWduO9nIeNCTneiyZm7fZknsSJ8Cdjbyzi2/nXKW5l92s9F?=
 =?us-ascii?Q?GoWPPsSgX82rNgHluaWbmxbUSJTFJY+Ojbkod5B9x7N4jLvGmhZlkK+mcAH4?=
 =?us-ascii?Q?KfHVCRw4zoOsYZ0xzIXuR7PyRxlDlUCdlSlBu/1kaDbewY6TGY79FXqNtDEY?=
 =?us-ascii?Q?1Kiqn3v4Aewxqk1k287oYXAXscVDYJ1itmqvycaVLVTNOeshQudDO4a/q7+G?=
 =?us-ascii?Q?5i50r2SZ9kViDGz5HtRgkFGjPFP2vRwvGubWXdvBjK8PVI+cXHWk0INKj9oY?=
 =?us-ascii?Q?XLc7SyKdO0r0rrIVr8rRsWIe3sqEm4BqX2bKtLox/xGGqQHWz2AWrrrWWeJ+?=
 =?us-ascii?Q?QdWmo7inK4P+CQ1ZwfGt+NC9Np9Dlow//P9QDV9DIx/KE7mD1lV1lCmHB/tO?=
 =?us-ascii?Q?XzoXoH2/9TntSBQKNmxm4EVmVJOmF+6huRetZOPOp+JDgce+JTFlpD9k/tba?=
 =?us-ascii?Q?62A6QVSXxPXX/XD8wCIpupfUC/GwkW+jSe5e03Gqn1DpkonvSZxpWFzS4jRN?=
 =?us-ascii?Q?XeM40CgayE4GlKPoIAAvvgatYZSqAJOQEP4kKCbq3mCb0U8GwSpMZE7JAp3t?=
 =?us-ascii?Q?oRSaHL0v3Ws37rer3whhggCIUOk7Ob2+Onb64UUTvebDt6qelS+IxMtyaqvs?=
 =?us-ascii?Q?2ftg1EDGlbYhcZ4I5/lo9YL/4Uow70K+wploLtFQDIhs3+ep2c6snd0eFfU8?=
 =?us-ascii?Q?HQsYFGRT2E/0dNEfACvL7vPFH/2xFIUgpHY1fI2tecoihsuc/V4pzWAHhFC7?=
 =?us-ascii?Q?tiVssRMdOrYcpjbHLXaA749saXtwPlqJMSyXu62KtqCJdrnQytoXW+mb5+Q9?=
 =?us-ascii?Q?GkGqSnihoAKP2OaVbo7RVMgTAb4P92knKG42ht2If9pP2u3lzsbMrUMv7jqV?=
 =?us-ascii?Q?jIvQHoXdWp0w5LrTGUNNYpb6lef1MAVFZdHAgBRyRQrzdJyWttw3nvVEH47o?=
 =?us-ascii?Q?L8xrmhV4pRbDeG36ql9vM4r0HW6gcHzmvNERhRvQqgctWgbTYXDU0rrGuZpf?=
 =?us-ascii?Q?EX3RpX2Nr/XVwrFDJjYMALsN4461jreJ/UuQuH727M7rT6ujGxuXoXxJdCuE?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6d0520-bc49-40fc-f52e-08ddae9d63d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:21:56.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nQRoqW3lJ3wbnezE1KA1WvCNEj1M+JbaNffse9zaMEF4HqjRBHGFjFUaE7zyMbjditS7R4aR94urX1um7RtxyxyDP9b6sEKy+bvFSxREew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
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

On Tue, Jun 17, 2025 at 08:01:35PM +0200, Maarten Lankhorst wrote:
>We want to split up GUC init to an alloc and noalloc part to keep the
>init path the same for VF and !VF as much as possible.
>
>Everything in vf_guc_init should be done as early as possible, otherwise
>VRAM probing becomes impossible.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 1 -
> drivers/gpu/drm/xe/xe_guc.c         | 9 +++++++++
> 2 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 9b2fc9db55b8c..93cd26dca070f 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -966,7 +966,6 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
> 	struct vf_runtime_reg *rr;
>
> 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>-	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
> 	xe_gt_assert(gt, !reg.vf);
>
> 	if (reg.addr == GMD_ID.addr) {
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 209e5d53c290c..81b22b6fb2493 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -629,6 +629,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>
> static int vf_guc_init(struct xe_guc *guc)
> {
>+	struct xe_gt *gt = guc_to_gt(guc);
> 	int err;
>
> 	xe_guc_comm_init_early(guc);
>@@ -641,6 +642,14 @@ static int vf_guc_init(struct xe_guc *guc)
> 	if (err)
> 		return err;
>
>+	err = xe_gt_sriov_vf_bootstrap(gt);

not really following this... Commit message says *Move* but you are not
really moving. Did you squash something in the wrong patch?

The way it is here xe_gt_sriov_vf_bootstrap() would still be called 
from xe_device_probe().

Lucas De Marchi

>+	if (err)
>+		return err;
>+
>+	err = xe_gt_sriov_vf_query_config(gt);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>-- 
>2.45.2
>
