Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971A4C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 20:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D7210E35F;
	Mon, 10 Jun 2024 20:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMk+ZxjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F1E10E35F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718050445; x=1749586445;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AiXFEFrJuoXrjEtDFlSrLMVt5f5YDg9vdXbBBnwk8yc=;
 b=aMk+ZxjTtcXHfkgnT/JECnEnF9Px7vX+rBr2xQR9aMWVAbQ9RbG8QuJc
 XfNOhcHS7uYVbTb0UNafiJQPpjMi22gNROGfNzjro5VW19NVssjTlHjRC
 czACagE8tsozprax/UWfqdO25Ri64zRZ99Oit+ZeahNOG3IZTz1OLbK31
 5VJFMb1eS49G6zAFBRMyk2IPej8+8VPdajC5C90pkPNJHv7q0PAqeiddK
 DRXre2rOWkmguj85BhFb6IjJdPEfiIdh6oU7/ZMhT0PlPoiX2KVcplQqK
 Dhw+JqHeicKEHzIPeh2XpjkGoP8bJfjoAL4QJtfKasr2MZgujqNIudMqq w==;
X-CSE-ConnectionGUID: PzlsHreATkCMWKPyxKk2sA==
X-CSE-MsgGUID: slIMDC0wQYOI4btEwP4WDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25306366"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25306366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:14:05 -0700
X-CSE-ConnectionGUID: bVnJk/9LSM2OsEJt7O12mg==
X-CSE-MsgGUID: /hfkOdx0TVa8WNyYJCWBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="69966454"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 13:14:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 13:14:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 13:14:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 13:14:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUPhQbSJlHtwKidny8eLDEA+5UVB/EFoNqZs59XYoe9XV9uDLPuMxNKX6K++grCEpPiq7o0dDe6n7rZ7QIb1PP4ZPwr6XcI8CEz4NvsoHPhPx8nkyZpw2LTIEe7teFYmZO3d5v8wzX+yxKg7n+K5uFx4jAdqEVz/cUZSGOCAEFilsX3BJZKTUL5G/+Dt2k8phpCQbtv9uVIh3NIRGULtGzB4eyH/wYk/rifcU1/SxT50uwgOA9TbOA1/eNo2IzqANw4UxvM4aKNc6ZNR/rzEv+PVdYAMlXMDdW8AfHcjqVgC1anNwujrGB2Jph31RDkv4mPioNJ/FDCa4BbcXLvVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA7uIx/u1EE0JERxL4B18/L1E6s2lOeaxPuPyIEBhBI=;
 b=CiE1MVi1rHvhM4ry+43m7qCOoU+ld+cIt2i7zyGeWRO1ZUOyXma2YujPIxW3pYAOFxKawd6xHEprk9DB7Szt2m+FA17J6G175iBSvJ94mT5NzEl2pNcyBst8SMms/ILCUK+fHRkoxVpWH6XTJKhZ46Iq1tykiuhdMU/flptHeaCKYknDEzf5GbXFqyrUiZ2IbC2DuU30xmI5fpeIaPpfLC2vVHUhfWgZ2w92F75TAc2aJ5RvkHMTtci8UJQzE/oQ20ZfSxBYCfXYLlkpupJyVOsz3CWyMYWAP3zMTvETzj2GsuZsk4urpMcau40gyjZi61zIPkxp41Ik88jSqYl8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 20:14:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 20:14:00 +0000
Date: Mon, 10 Jun 2024 16:13:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <ZmdehmvY7EyLl0GF@intel.com>
References: <20240610185231.1451157-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610185231.1451157-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 530ff546-419c-4816-89a0-08dc8989ddcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hC36/vtdANnPwEk/PGcaWm2wBbwFCMT5IcKJ8XIs7gs2wzO+szr3epCvt/Gn?=
 =?us-ascii?Q?7JEUZtUOd3KZuJ4aROLxUxQxg06v5bzXMShSEWbPrbcoHejTPXDNAbNystnD?=
 =?us-ascii?Q?R44Ea6kHdOdoFNRd2h2KztHWxUqBnr/v60aniyptP2tQIYIaQOwz6tY9HCLH?=
 =?us-ascii?Q?9/5+XZev3WFaB+k+F6WHYue6VhuHlZ6qZe/cQfjmYuxsifgysjDHGVxTdYr1?=
 =?us-ascii?Q?Fh1j9zwh78aLgiWXo1JK/8QnEa/yKFZnlgFAFEW8CrIQ5NYfxqRtgaX7SRGE?=
 =?us-ascii?Q?OBkVBWA4iHBMMtzZ42khgjWX3FOWdfsJT+Y2/zf6ShxukVccFzcj9p2RtV18?=
 =?us-ascii?Q?/Uu4SKX/NSb9y1Rv+FUROgWXgF4AOWJSfr4RfRiPMFPk7YrtMmf6TPk7jeSO?=
 =?us-ascii?Q?I+nX5DrtSKuQddVkStFlDfyPZvkdUze9P8D1vweUMFae7m3AHypfIc9JbJvn?=
 =?us-ascii?Q?Ru9B4if1vQzPb0rxIVUKCIc6PWYlVF0phtqystImweDAUtD37w3Kk4zufYLg?=
 =?us-ascii?Q?tSymPU4esv+x1caDAKIID3v17+WcRBdqhmmGIAKIJB5oMG2NHCu6KJZJ/WxW?=
 =?us-ascii?Q?g6TkfiZRkQbfE2bUxR0P7H/KcNzzxGD+Y/PrbDsmeJun/OfWh9SUGsdw+N8Z?=
 =?us-ascii?Q?SEtvoc6gouKlrE35SO7utTNug9+fz7a2w1niuBpEcQjlQRqD/ArfXppKL9Xh?=
 =?us-ascii?Q?fdHjBB1zm354c9SnQdN4C+VHPp529OxFLu0bhVs6iykFrbxv+pnAHkRlmjjY?=
 =?us-ascii?Q?qtKL/cwm3uMBwFcscmldTHkgVZgzqAEScbczjewx85e1/0rhSVUCynatp9NP?=
 =?us-ascii?Q?w4HQrpU7FONtsG54G6XxhjmP4KZQObnh/1CAH0pTukIl33Ze6RR99tzX48Dg?=
 =?us-ascii?Q?PIOyUc9tmoXNMbm9Qoq5ASqvusdeCGjpdqYHgiXgb2ZVTjgfeWzNq4QzNmqa?=
 =?us-ascii?Q?HYHviXxBd5WVp1UAzW03Bxp35ch80qIYHH4Q9GBaOl1KNygpX4kX22duxNpc?=
 =?us-ascii?Q?EOJiIU8fZzliJUa6CsYoT+B/Nud2GF66ka+DOi+9+fHMkNoDB8CMTjZspCwh?=
 =?us-ascii?Q?LEf4N8Fc1pMRCfZt4xn+8eDlzduTtm0ts7auUpnbCDha+esQI4LcwWuBuYUL?=
 =?us-ascii?Q?/6/HYfNeIIFqyllHwFLpfumCCQMtODum2j6n/90xhsICyTn+Wls4W1zT8zvE?=
 =?us-ascii?Q?f4zDwgt8YWoEpQOjY5r4MwvUNoiYcAwMsoXa137OCmfTtWkN1WA9milO7sHL?=
 =?us-ascii?Q?WoyO11L/xA3wM4L+uXDwGA4PaS8EeBLFfxUpU7l1eIzEs5rVc2xaDl1+26e1?=
 =?us-ascii?Q?4WXuF/F1hmg9TGsE7TFKn78O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1c8wiwvqQ2eJ9VaxfutYy+NG5Nx6XOe5NoL4M9eNmvTBTcp56jEaecXK5OcT?=
 =?us-ascii?Q?kVPaPTrOTaC63w/EB0X3pf9jwGrkYwJkESpwfDOe9H1KDc25wr0rbvU+k9cM?=
 =?us-ascii?Q?3aijjppi/D2H/fB2ZxKUsP/+d1oLO/SF4+JoQDxh2So2jyrUQtwM3XODNFTi?=
 =?us-ascii?Q?fvTSQR0wcjfzuTJ1yZhoSfU6OtV4WKaDj+yqr/PD5VgKcZctDJbwv8uwxG1Q?=
 =?us-ascii?Q?s5zhuoUcW1FL/mvrL8HNczcJ1lNu38pfGOzFsw/cgfCWkkXsiFQeQoMJ7bm2?=
 =?us-ascii?Q?B+xJepcLz4P3MHWeV5B6wVAOkq7NtakMAA4ZYgyB9n8lrJKUicMkSMfiPocs?=
 =?us-ascii?Q?aJvqXOTTD5mYJrahgQ0J3XOJguk1N/idA0WP8Doje6YSHv+NKLS6fVk475bU?=
 =?us-ascii?Q?iCvtzRCcS4blIuhXtyn3+paGHMOOabOnzWLAkGMBVDTUHRum2WKV4g93ybFw?=
 =?us-ascii?Q?os5fKd8yPdfEaJzqm3NmzTbjQNGEblptZgiL6ZqK9Vq3UN1cCpf22l52TgmJ?=
 =?us-ascii?Q?Op4vFisPKJ4RFbwD8PZ5CCxdaWhEbVXjjpxZ0hikO5ZQyj/kSGVy0PAFcNOK?=
 =?us-ascii?Q?6LwQpexwl65uKLQHh3Hswwx5WMFb8Gs0pr44Ksqip8zYwQTPleMmPQEg6vwB?=
 =?us-ascii?Q?GKoioee9GJbdu0ZCIDX2LnXOft2xttY6Wn/1T0AsTMIO2Z2J5abTIB3Nguzz?=
 =?us-ascii?Q?b5cAGQsREuXYaRMwXgHM/QJPi56fFJpkug9RRieNkOqVhigVXeAvXe+Gkh3w?=
 =?us-ascii?Q?7wQTP7dx+PRbr4iKTU3Ur6aABoTh9r3Gch5eRZGCaMctjRL9Dw9q4/4K7Ir7?=
 =?us-ascii?Q?hTHS1APf8HwaFbkhpt08VbAdFEf5yLpdvk17Mg9QiLP+u1w9ZjnJKbGMNpDa?=
 =?us-ascii?Q?4Yx5PejG8HeQgz1Opin/426D2P33aOBoBTIdHRjbYTCPsEIHjxQWpxpyBual?=
 =?us-ascii?Q?Y3FHT55Y/KEw/dzbZye69Da3JeTxJpUff0CQ5Lo4Q/HTGToAa/PukGQaWhLc?=
 =?us-ascii?Q?BhXZ/0w3QTtxgpkP360G2wkW7cbvYf8Ih4J9X/ECSpNYPHtjLbjYAgu2iKxg?=
 =?us-ascii?Q?YC1e7BDGw9wmdo5XYwNGRcW2YkkuZWjc2ZleIWwhIGXhaafjAiyjtZBlzapV?=
 =?us-ascii?Q?jDBORxXZWyiaNJl8hw9xeT9LAZ7TV82aQXYQ45pF7HtPzr/Q2l2w+3kxyOmz?=
 =?us-ascii?Q?X7QI6U5NrRry5Coz/JEB7cFg9ZNLrFTMm5Y1yGECJNVug80m7iPBeGoP50vN?=
 =?us-ascii?Q?sarr1K0w34slCGv2lHVg1NBaS0/gaI2YhMWkiBLJKHDwuTVTuQrGzmCJ7ff1?=
 =?us-ascii?Q?nwuIdZwI0Ta+a7CTnPMkNx4KJ0itczHY6wNPYkvyDtj6pRPMrtRO4VRmzRga?=
 =?us-ascii?Q?30tHJhoNdX2numCakQwCTtoKhFGA/vb+FxkAc2gRH0cIHio/gmv/tlOKympM?=
 =?us-ascii?Q?zR0IKPiMZd+dFln0GFgLHpH4WqFKHfWD2V3QYtj0BZ7p+7Jj0ev9Hn2QjGo7?=
 =?us-ascii?Q?n7iuAML2T90aSUaMBE1QgavWeB9VJCn5wp9aNwRfeapVFbQ3tgaF4XNpPyzG?=
 =?us-ascii?Q?sW5HOFr3VZoNRmW2oBJf3mp+g9ruwcsrTsE282uJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 530ff546-419c-4816-89a0-08dc8989ddcb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 20:14:00.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qggRR9OXCejsTvCFOi0Ouds8EBbMyFnU3+89/wDwjt0yyDy+XePRGBgVvU6ubCsqR05ZOgAZFPWkmFqYRYei1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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

On Mon, Jun 10, 2024 at 11:52:31AM -0700, Vinay Belgaumkar wrote:
> This WA requires us to limit media GT frequency requests to a certain
> cap value during driver load. Freq limits are restored after load
> completes, so perf will not be affected during normal operations.
> 
> During normal driver operation, this WA requires dummy writes to media
> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> of the LMEM writes originating from Gunit.
> 
> During driver unload(before FLR), the WA requires that we set requested
> frequency to the cap value again.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  2 +
>  drivers/gpu/drm/xe/xe_device.c       | 10 ++++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 19 ++++++
>  drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>  drivers/gpu/drm/xe/xe_gsc.c          |  4 ++
>  drivers/gpu/drm/xe/xe_gt.c           |  2 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 87 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  4 ++
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  10 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 478acc94a71c..ab282070fedf 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
>  
>  uses_generated_oob := \
> +	$(obj)/xe_ggtt.o \
>  	$(obj)/xe_gsc.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
> +	$(obj)/xe_guc_pc.o \
>  	$(obj)/xe_migrate.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 94dbfe5cf19c..6450cccb1771 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -37,6 +37,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_pc.h"

does it make sense to introduce this dependency at the device level?
or perhaps this should be part of the gt_idle which then, if using
guc it calls there?

>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
> @@ -50,6 +51,7 @@
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_vram.h"
>  #include "xe_wait_user_fence.h"
> @@ -668,6 +670,12 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	/* Wa_22019338487: Restore GT/Media freq now if GSC is not being loaded. */
> +	for_each_gt(gt, xe, id) {
> +		if (!xe_uc_fw_is_available(&gt->uc.gsc.fw))
> +			xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
> +	}

please move this to a function inside guc_pc...
perhaps calling the function
xe_guc_pc_sanitize_freq()

But please keep the probe cleaning calling one component that makes sense.

hmm... perhaps instead of guc_pc or gt_idle we should use uc_fw component,
since we check uc_fw gsc availability to then call for the guc_pc sanitize?
But anyway, please do not call the workaround names in the function. Let's
define a generic flow in which the workaround is the underneath static call,
but not the exported one.

> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -701,6 +709,8 @@ void xe_device_remove(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> +	xe_guc_pc_wa_22019338487_fini(xe);

end? fini? what's the difference?
Perhaps this should be a registration with devm or drmm instead of this
direct call here?

and again, please not workaround name in the function name.
Make a generic flow in which w/a is underneath, not the ultimate
exported call.

> +
>  	xe_device_remove_display(xe);
>  
>  	xe_display_fini(xe);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..58d177be724a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/intel/i915_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -23,8 +24,10 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> @@ -69,12 +72,28 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +static void apply_wa_22019338487(struct xe_ggtt *ggtt)

For the record:
for the static non exported functions it is okay to have the workaround name,
But please, prefer to highlight what it is doing instead of why the fn
exists... something like ggtt_update_access_counter

> +{
> +	/*
> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit

Please wa_22019338487:

> +	 * to wait for completion of prior GTT writes before letting this through.
> +	 */
> +	if (XE_WA(ggtt->tile->media_gt, 22019338487)) {
> +		if (++ggtt->update_count > 63) {
> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +			ggtt->update_count = 0;
> +		}
> +	}
> +}
> +
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>  	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +	lockdep_assert_held(&ggtt->lock);

it looks like the assert should be in the above function, not here...

>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +	apply_wa_22019338487(ggtt);
>  }
>  
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..89b721205d2d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -34,6 +34,8 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +
> +	unsigned int update_count;

access_count?

perhaps we should increase it regardless the w/a and then print it on debugfs?
and then for the wa itself we just use a mod % 64 == 0 to apply the w/a?
but no strong opinion on this...

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 80a61934decc..9cd154bf75b7 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_pc.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
>  	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>  	struct xe_gt *gt = gsc_to_gt(gsc);
>  	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>  	u32 actions;
>  	int ret;
>  
> @@ -370,6 +372,8 @@ static void gsc_work(struct work_struct *work)
>  	if (actions & GSC_ACTION_SW_PROXY)
>  		xe_gsc_proxy_request_handler(gsc);
>  
> +	xe_guc_pc_wa_22019338487_end(pc);
> +
>  out:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>  	xe_pm_runtime_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..1315b184220a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -816,6 +816,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_gt_idle_enable_pg(gt);
>  
> +	xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_gt_dbg(gt, "resumed\n");
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 666a37106bc5..7d8aa68e60b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
> @@ -24,6 +25,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -41,6 +43,8 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GT_FREQUENCY_SCALER	3
>  
> +#define LNL_MERT_FREQ_CAP	800
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -673,6 +677,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  		tgl_init_fused_rp_values(pc);
>  }
>  
> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)

do we really need to export this?
if so, please add doc.

> +{
> +	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
> +		return LNL_MERT_FREQ_CAP;
> +	else
> +		return 0;
> +}
> +
>  /**
>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
> @@ -684,7 +696,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc->rp0_freq);
> +
> +	if (XE_WA(gt, 22019338487))
> +		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));

with this we are setting 0 to cur freq!

> +	else
> +		pc_set_cur_freq(pc, pc->rp0_freq);
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> @@ -740,6 +756,71 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int pc_wa_22019338487_start(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		/*
> +		 * Get updated min/max and stash them.
> +		 */
> +		ret = xe_guc_pc_get_min_freq(pc, &pc->pre_wa_min_freq);
> +		if (!ret)
> +			ret = xe_guc_pc_get_max_freq(pc, &pc->pre_wa_max_freq);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +		 */
> +		mutex_lock(&pc->freq_lock);
> +
> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, xe_guc_pc_mert_freq_cap(pc)));
> +		if (!ret)
> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
> +
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static int restore_pre_wa_freq(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&pc->freq_lock);
> +	ret = pc_set_max_freq(pc, pc->pre_wa_max_freq);
> +	if (!ret)
> +		pc_set_min_freq(pc, pc->pre_wa_min_freq);
> +
> +	mutex_unlock(&pc->freq_lock);
> +
> +	return ret;
> +}
> +
> +int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc)

doc to every exported functions please. Besides avoiding the wa in the name itself as ditto.

> +{
> +	if (XE_WA(pc_to_gt(pc), 22019338487))
> +		return restore_pre_wa_freq(pc);
> +	else
> +		return 0;
> +}
> +
> +void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	struct xe_guc_pc *pc;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id) {
> +		pc = &gt->uc.guc.pc;
> +		/* Set requested freq to mert_freq_cap before unload */
> +		if (XE_WA(gt, 22019338487))
> +			pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
> +	}
> +}
> +
>  /**
>   * xe_guc_pc_gucrc_disable - Disable GuC RC
>   * @pc: Xe_GuC_PC instance
> @@ -854,6 +935,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> +	ret = pc_wa_22019338487_start(pc);
> +	if (ret)
> +		goto out;
> +
>  	if (xe->info.platform == XE_PVC) {
>  		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 532cac985a6d..760324ecdbf8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +struct xe_device;
>  struct xe_guc_pc;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
> @@ -29,5 +30,8 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
> +int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc);
> +void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2afd0dbc3542..721f673b1628 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>  	u32 user_requested_min;
>  	/** @user_requested_max: Stash the maximum requested freq by user */
>  	u32 user_requested_max;
> +	/** @pre_wa_min_freq: Stash the minimum freq before applying WA */
> +	u32 pre_wa_min_freq;
> +	/** @pre_wa_max_freq: Stash the maximum freq before applying WA */
> +	u32 pre_wa_max_freq;

do we really need this?
can't we simply return to a regular point where we had put already?
if we really need this, also please avoid 'wa' in the name.
Use a generic name for stash_prev_min stash_prev_max, or something like that...

>  	/** @freq_lock: Let's protect the frequencies */
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 12fe88796a49..a6b897030fde 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +22019338487	MEDIA_VERSION(2000)
> -- 
> 2.38.1
> 
