Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7717EC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 21:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4537010E8E6;
	Fri,  3 Feb 2023 21:48:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0810E8E6
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675460907; x=1706996907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SahiORYgBrytqebghdwfODxIgwglY+ANKRLeGOsXfP0=;
 b=hwQ6bI5xlXKNWf2vTN1XL42tBgHVYVtHsqb32y5XYRBNmwwhL0PZnEwq
 /PG9WVb3XuNKS/ha7p7hzWZmlV1Z5k+fnBlt3B8VvkRAKxMRi3Aksv6jm
 /PdZHJSWGefdMG0QdxDiXvDwLBAY9EvNqUerGpekcPPa0znHE1I/qkk88
 d1shp4FP7yTXEiuZEC1T0STsl3rokInsVTabwwajs1iOOvMkxhbnePWYx
 UVhbWr9sv29Xn54ILnp/j4GSNgUnc9873PLjsGlb81+2d6xbYfqXoVFBf
 +a5MtNNwOwOtK1mbcZwzL9BLa0PdHRAkC3Y0rhHhX5Jd6/9+GOVOwmkBV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312520898"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312520898"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 13:48:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789832060"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789832060"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 13:48:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 13:48:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 13:48:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 13:48:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 13:48:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlp2HTU2CbboPZHbt+UlA8WdIHux4MyxIVX7LsdwVdbspRuUy+hgZyZdN0aoqt6wTrlVqiFjcCInj2orfsUSATyDHYJsE/HIKNyuqJjg1EV4r/Lsgib9p7zZvKWOP4Q62+4JZz2zBho8gl7Oo5/vPiMtgi8OpUYE0QxaBNq718qgsUzRtEoW2xRQqpO5xT1aRo/Xu+ElsougWWIvQw5MEUDgvsskUZ69duqg7Arq0Ww/Okp5/xu7WQOdjDk0CENmCbyEZ2cjC4QfG0Mc/Ifj2spvHIaXEHDoQcPlmLa/epa4c0l059REiOBpdMwKXJpDayD4QKRYkRAIIZXSl7nU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+fsUUgUSt8XVUAEnw/TClH1nfRR0cugsANNLprVCLQ=;
 b=FegPIJbs5lKgzYBQsOuQx+5xT5Ef+wK9u/ZlCQLLKKlOFgYkQm1K79dnroUer9R1bNB5CgXUujLvz4iUeXPU3RLiUbj0U4w5ufx7DaNJEyZTfzzE4gY+CAy766ddnAgke8iarLl1Yi79SL4Jk1s5qWInD6AwZ//2nKazzHdO40SrchKfefQ0dScHs7yxfSdeizf8ffRbuqxH4ushZFErQkBKP++oYNTUcg3BUzkSZj82PWUDMOKX/dkEXEOKJ99qcwls/IjItFVpfx3e4MLfYE1MKOwibShNc9oSwDB6X59MEgMHC1tKxn0fOI1VeYSlO9emrvXTIY10GjnlTenTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 21:48:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 21:48:22 +0000
Date: Fri, 3 Feb 2023 13:48:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230203214820.y2goalo6sk3dbrsq@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
 <20230203201758.573775-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230203201758.573775-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a2714c-fbf1-4133-6991-08db06305ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XS0Ab6cSPcs/YTnYy2t/OVhH5n7YfL1U7+G9ojjhwRE83KuSr023j9KT/7h6gPsDSz5ZqdPcq8J2lPnHJENTlSEiWILdm6MQ1J2n90lFtB5rIbskTQ4NVClP4VDl4wSDuiJG2NYtPVgKKDNqoSr1v/uRZ2wn7piGcLU4N18wft8DE40t/dcb7vsBDh5eU+uHb0qHH+sb1209vksI16NvcBxrzWIDQWP7AblNXyOu0PNrd/2rbmU20xt9SUxwBCWvHhvl5sd7yWntXKjZIqTIyZ4mZQ8CXqTV1Kb99EiqBkgRLzQRfu/Wkyl9CNUJAvOHbM/VgkhPK6n8wDg/nwnRgxQ/ZS5d4mo5S9hYe3Q8i/+mj10xEjDwD6XhPuc5oRvGrOCVsUfoT5nKiylNJBIbK8Wl7PXzoAcjSP86bppxr6vubyqCfWDuOQiOChLmaXL/jfCWWqv/TR3U5pAQSGxiaem4sVde/W7RJ/GnpoiCjv4Peow3kBHW6VUYsLWu8YWY+/EnxxNfjJpoLaqAhjnic0ZK/Gevzty9jtCg5BrtV6ZTpwq8hodsnlMdNoxtfuT8qtKcGIe4tlk2+oImN0mfGJavSYGO2idtGzZu6l2L2gK2TKArnpVdI3nz4zUqul7AOsifcj5vxGOiAddU21UpOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(83380400001)(41300700001)(66476007)(66556008)(8676002)(66946007)(4326008)(316002)(8936002)(6862004)(6636002)(54906003)(186003)(9686003)(26005)(6512007)(5660300002)(33716001)(2906002)(1076003)(6486002)(86362001)(82960400001)(478600001)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?urodUEsKg3gSLoqLd0Opem7E1mLEmnWH5W32w+mYEKg8cHHLkN4z0n5piUm/?=
 =?us-ascii?Q?0WLaVLvtE8HW/RkLDrmrkekgTG698ShE8sb3oJFqaEBZ5lfeS7HOAhaA0ZVz?=
 =?us-ascii?Q?i3nHVB8LL02TAmmlItBFfLEJNUPrlPfEejYPbE4e9dxQf2tpSBF1InsfVwHF?=
 =?us-ascii?Q?fbjfpDrxJfhLvzqMC0cgSjOnLY8Tu9Ei5LXad3vgUIyjRy5GVDme01deWAHu?=
 =?us-ascii?Q?SKVqA3KryKxA8BIndlYinE5XyGlwHSbmTWMTg58NXZ/vGuwRjPy57k6kkmfO?=
 =?us-ascii?Q?l67kf5lNP8umSiTMN8vg/GMX350stY8rMjqEO1wNmWysMbh8xL69RDs2bJ78?=
 =?us-ascii?Q?Bg7iyoPmHDxdBxvxq8x7A3KHeLcQXShoMoghWX32d5D7TlL5FPB0R+GFM/WA?=
 =?us-ascii?Q?aq+vadbSvARxEYkkG975Zbp8kqeCVvOOC6NfveZOsX8pDsGw/fkZ29+LB4nn?=
 =?us-ascii?Q?rTV8NO0wDKzcWhFpO63DdOVxFTeCP7vbCGtupkWgePIJnwEsTZowOMSD5vlb?=
 =?us-ascii?Q?Y3KmXUluqs5B81QrqkAVWTPaz1x55B/xq+UoYJwEIwwWYXC6BiCFsxylLGcd?=
 =?us-ascii?Q?KNC1SRyIEh+IVfh/uNox19Ji7YPFepWc02Ove7ogWa/BN/3o75Ic38dmIG2B?=
 =?us-ascii?Q?R/4oNZ4fgPNglyN+NBYiU+Gz+RUlaCP2XJCCOetbLLFqfdEmFwE0Y0rT4+0/?=
 =?us-ascii?Q?0MESOoCKV1l0o07VdKpHzkyqARceMT9Sa/kjCkqNRh9ShLcNL1sQG+UJ52jB?=
 =?us-ascii?Q?/wrkLhkQghV8nuPVUClFnj8GQalDrekpkTMsAOHVjpC64Acz6S3lczO7oNXx?=
 =?us-ascii?Q?WjtyLSELJsSPbEEu4NdpaH8B2HTv2I/K0fqajKzMcLXAQBQkKsYczLaEbgof?=
 =?us-ascii?Q?Wm+O/aWs/+WTO5GIxyoYWFPCLNBfk7+iZVAufau2n+N64vPRa6Yh7jNlnKeU?=
 =?us-ascii?Q?7pX5b2OjpwgxVxWzyhGnyekkoEYi7j6H/2IKkWVNdQsjIVEjRcNFy/zSxWyU?=
 =?us-ascii?Q?cRA1Ji7a0deKDtCutdQfceglp1ZTl7lTxv5CyWXGCyvZ2ouclf+qYG1EdhXr?=
 =?us-ascii?Q?KKI9wCZS+XWBJsBWi/ODsvblsylqrV+KgZQh9psXGNjgrKX09Ko1Fat5X059?=
 =?us-ascii?Q?o9Gq7cttGo5ljmsKXXHp7wqVurfxt8DfF/qDzYuMTH0bsa4QYHUu5xKm8U1Y?=
 =?us-ascii?Q?v5QAkTEkXV4jZFRR0NXsmSpW/Gz5zlGSQa5lEb3BYZTdys52D168pwX16yfL?=
 =?us-ascii?Q?vV/fCdW3UIQSqzq86+boNQ+Mb2qpDaj6j1i3Yz5go/LUeUqgZZkb/38hRm5j?=
 =?us-ascii?Q?c1W86IfQjAkm/Og2szmVitxGvAnl6+p/5uJebwviUM+dFyNQOgS/ID9QFCAh?=
 =?us-ascii?Q?RDlSWGmPhZQeC2Ar04V+h7iR4c7CR/ZPK+C/LcYp5hwY3A5b7y5+zCtzFtzP?=
 =?us-ascii?Q?WHsZD+mKzm97OfVVN2jYRFHcCSf1aNYe4ia04k/f9rpjQM0wYYDHLaAvrkhU?=
 =?us-ascii?Q?dormG+iRHwWddCB6lXhp9d+qUYKx1qcaIA0HOstfAJppbLX+Os66UZeASbNG?=
 =?us-ascii?Q?i0YTD4qrtuibv6R0+XLij6SUb+6HC/mKMNoF8XO6DtPxA2bTlrKtlXNCQ/3S?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a2714c-fbf1-4133-6991-08db06305ec5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 21:48:22.4999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mNgFiKiRO7YkhvN5hXGrtOOrg5rgu00imIOZQKwcUffmZqDqngZpgvGWwNhXM/TPdKaKVoI0CiRFpVt7nOBIXyCYBVCxDkD3A76BdTRwm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/fbc: set compressed_fb to NULL on
 error
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
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:17:55PM -0500, Rodrigo Vivi wrote:
>From: Matthew Auld <matthew.auld@intel.com>
>
>On DG2 we get a massive flood of the following:
>
>[ 1068.790446] xe 0000:03:00.0: drm_WARN_ON((!!(fbc->compressed_fb)))
>[ 1068.790465] WARNING: CPU: 9 PID: 637 at drivers/gpu/drm/xe/display/intel_fbc.c:843 intel_fbc_update+0x605/0x670 [xe]
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

alghough this display integration with ifdef copying i915_gem_stolen_insert_node_in_range()
looks ugly

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
>index 82bc21b09332..13f03c6ea818 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbc.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
>@@ -75,7 +75,7 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
> 					ttm_bo_type_kernel, flags);
> 	if (IS_ERR(*bo)) {
> 		err = PTR_ERR(*bo);
>-		bo = NULL;
>+		*bo = NULL;
> 		return err;
> 	}
> 	err = xe_bo_pin(*bo);
>-- 
>2.39.1
>
