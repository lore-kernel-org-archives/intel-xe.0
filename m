Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1338CEE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 21:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBD510E049;
	Fri, 18 Aug 2023 21:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D2D10E049
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 21:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692395826; x=1723931826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mFP717ipN6LPJ94RaEVXDLYFA8smJXv7LPnTsU3Iiuc=;
 b=R/t5K6P+PgSj9O46Xz9eql3ArGbatn3dZdUuKyq59PdKLb+3J3GryIgs
 ao05pqRcofJDtRUWdIuXnOy2VS4zhu4Q5nq6EEGc1V/3bgH7en6yuVLfk
 DUAsHVRqQhQJpkE2aj4/aGk+bD7JSTxxxIrqiMr6ldB9ayQ7r8x9aexPD
 WHWFxIm1XcTZY1JiUDPobojgWBXo/tpK1PqQjw3mbSNxadIwCgwvHNxzs
 yLZKVRq4joZx/rmYGyuGLeDn4hV8q6H9bj+7KdzE1AU1rPcjO5fv6IPJb
 SNIs9DEwoWjeDrqdpkVgQ/ohDDIwTbyLishyRdo6JPsoPIjmbWCQSWNID g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="459572756"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="459572756"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 14:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="685021760"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="685021760"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2023 14:57:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 14:57:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 14:57:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 14:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGZ92OIaUGQbwHFLAVwz/0dRvRNn1S+VNu8LswxSMD5x/AxjIeQvDDBJGe+wPpr1Uq20CFy6YL6tgGCd4+2YOfnXcXV9A8R6SEfeO0G7fO3+YkHsQXzMrAFlqMTEhTeD5DHGY3f5Ag06exB2gCDRZvRpZ2cqW5HSu+d6Y0VYwJT7yyBWO1RBvyFMC5z3bMf7yyCzRDKpFC6nFQJl5PMsDWTW7ZezqdTnDRSSaQ2l/Kuy8yeTd93PWi71FQgua2NC2CpMY1+enOZ5EnAntCVW18cgE5s9tgXB/SAm9vV6FzE/vUjAq8ZswrcMZW/WMR72/+a0BYodfXMuh6HpczCQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR0yamy0Afn/LXRShu0T2sJj0XC78y+33x0EfUpOK3o=;
 b=eKlX/TmSNWLKQKevN1N5upHVGJLTageF15kCdnNad/YVpj1tlx/3rWFp8EgsjTkiAbpeqRpbmq5NPYdw+bQvCXgSU8ys7RAcUXed0CLX8CRZY79CXvRVBu0yTb+PD4h9QtkGbobXOf4u+2fYSRhK/g1wXKw44H+Azzbz0o3zyySpP4kjfz+9us+zXFPFmy17zBAvZstES7xnJS3OuriXR2uEhyjU+4zPbJM4LdZpMnu74pOA8laFUAG4gK3MxShUA5IyTNeIztWGYq/ngouGtT5IorIRJywBOyfu7UesCchDy5XmeS5yinWTRZ8KXpQKoH/zfLSicyHquF5QXpvp6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 21:57:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 21:57:02 +0000
Date: Fri, 18 Aug 2023 14:56:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <7toeluzylcybdp2v4iwg7jbuh5lkds535phvionvjpropr3biv@cpkipxgfmubt>
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
 <20230817230407.909816-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230817230407.909816-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9833a6-55fb-4513-d671-08dba0360dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PSXxt38hWXJLbK8fSurV9Yq/+TLjIIkizXLtbvCqKYfRfRZaN/lEvwPZ4FRgdczm9B6q4SmkS+zkg9hN/+uLw5O5cEVXdRtL0miUVu5/r++ufGReg1FFp9gXEjr2PwkY5ukIA1R+x7zjl0WZJ15noq6c1WLQ8eXeiSsb44gtB21EtBiluJJk0fwS1nqoK4//g61v34PhFPm1gaRQu3/ez6u7z0fBlzlS9XBUKAGtjGtnHKgbPuZcD54fBbS8ksTLx0y/H3p2sigGBr9QnjRxFYj4bmn2K6xaOLOcw6oOg9eVa/Ct3aOhmxn0ZwKp2sSqD4GPYxCSJ7RbMpWWO2SuXlUx10nibAKGn9CVmLkm4g4u98jQFGxID7KuSEOAEdY/r2dl8BetXwp7SsfdJm9YR6wm/dr6Mr2dSNAK+0T8DGuvRtGe+8AoHpB/DLk/ouSfk/bPXYrXHykxWIaH/TPokvUEQqOZ8MdF8NKufy9drvAe55oDrblynwAOyQjIRpYOskfJFnnXcUSR44KvouvGgIWi9H6glPrO5kysSuBrlQXG5yjhU5oLa4p9HaEuX6EWCLLrN0SVnRWunZ+cMoVPYxPOehJMaDzkfjgFzKq9RTzy1u4vmOgB4t2o3i2mXWfY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199024)(1800799009)(186009)(83380400001)(66556008)(6636002)(38100700002)(316002)(66476007)(82960400001)(66946007)(478600001)(5660300002)(2906002)(4744005)(41300700001)(6862004)(4326008)(8676002)(8936002)(6512007)(9686003)(6666004)(6506007)(26005)(6486002)(86362001)(33716001)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0AAvx5qkE3JVCA8lo5Gp8EBHm5XsgrQ4eoQ621VGz2u6ELsYBJ2BnZhwQhd?=
 =?us-ascii?Q?G56ba1Q7WawvwVuWGigBUH7xFUl9BcbpDumIyvtKCDGEfR5WEn9LfOoLKB4y?=
 =?us-ascii?Q?prO9KzPRzOQWkf4bwaqaSnIEJviYqVv456mfoWx8pUjMt+Nbxyi4UqlAP/nH?=
 =?us-ascii?Q?sMz30cdO9p17yZQ+XlQR8PXnFuVx2aohVfwNW2dN7h5wpi03+JuzjpwO+2My?=
 =?us-ascii?Q?JnozSevSFNsyqSWQZGfrsGR6j6FSOWEiXZTQpnMHq58dyDSNoNv2vdnmjWwY?=
 =?us-ascii?Q?418ICGyJogk74IYeOdWDcwDZ0gl2EAjtVszAUCePoWZSw0+/YpKq2fozYyjm?=
 =?us-ascii?Q?SRGRUGeAs6B2qTpIKCN2fOZ/hyFB+6ZULBUFj10o4GpJI6vHzeJqVPyiLgp+?=
 =?us-ascii?Q?Jk57fKwzFDTqUoFUkF2Ip7mTDhVUuFZFThGePbLXHVmJxmV+PDiMXGCALavj?=
 =?us-ascii?Q?HZsXS9tdlYcz+FY3s+bJaaRNVuBkWN8h2OUczeCahqiVG7QeNpopsoOSu9Hu?=
 =?us-ascii?Q?ml1LRseTOZ+ObCNKG+LyULEwesiEdHuzIRI75N5oreMzLH/KMUuUT0NlPxrg?=
 =?us-ascii?Q?nzWxmfv+CXGqz2TLtJ/5mBWEJHfZUZArZm4DZjgLTuFtOx3YidR0l+EJpRWs?=
 =?us-ascii?Q?L1GOkukAMvp96Tpmn0N5F+JSmknsWzlt894Y4phimejMrVAV3UBQdVwUG8F7?=
 =?us-ascii?Q?EaoaNA+1aL4ZN98iV4Cq9Mnmi9qakcNikMdPMrgbnKIS8nx0loNao/tAw29u?=
 =?us-ascii?Q?Gv51lJFaMRIjg3xjrIeY+onSYJpcV09mIkmJsVvts2KkDaNLcLT6tpdHnrm4?=
 =?us-ascii?Q?3GUOuHpPJwxoosqgB9PtFbNzHZadcAO/7kVETqHFABTUJ+VjeeLzlGRaIWaB?=
 =?us-ascii?Q?ZzLx8xpVDjoLB0fGRPHKvGYjk1n3k91rfvtJEHKFrusAJSa5iszFrjDN1dvW?=
 =?us-ascii?Q?SzTXjtrIVcVQjM/WOFWClj/KDobVX6rt5rA9jDnckR6phYHxMYZ3DFIMRrcT?=
 =?us-ascii?Q?i+LOkyr8ZViFeuWADnfB+E7pyth0H24EgKMb1qpuMiD6+bQTCo9u6bIce+Cg?=
 =?us-ascii?Q?uAHdRqF8VivaJp55bNJP+Koe4qk04/LMsAqMgBBJxGXZ4IcyYRAPSVxlNp36?=
 =?us-ascii?Q?rFvXX4Medv0sGAJfMnv6bVBSN2bkthfa7Jwqb/6uRyoUTtaukEXD3ENf0jjD?=
 =?us-ascii?Q?KzKS2PSrSuWHKIk/Bld5hdRA+FZ4abzP9JVrviQ3VaX7yFmqv/TfV0H650aq?=
 =?us-ascii?Q?2wJIJ2sq4/Hp5UCghlLQCX+gfpDdomPQExDMkCh7NJMBzUe9QpO1fnMDfdb1?=
 =?us-ascii?Q?A3puKR6cEpXolvhiJrQdgFf4SZlc0ueG8S0iVNXP6R5BZjHpyGKxmRYnuKJ0?=
 =?us-ascii?Q?bZTNxbJluUvkwwF4rV6DcVGlRJB8aTNlVMum57E04c3cksMqi1IVkUNdUv3T?=
 =?us-ascii?Q?2niy6e+nqFPkZ7fDhmHeliqn2pbNsS/FAO3D1Y3KXbSH88AC88npT335sVLk?=
 =?us-ascii?Q?pKQQ/eaX7F2keXP7IJAJnWDG2x0OdeSkeA8RVCWSpS4sECfIvcChKCSqFOL1?=
 =?us-ascii?Q?FCC8Yp3h2TmYUGXDZnJUyjmC+hyR7gz5ADTyFuoAfeeer3HKrCG14SWgalJy?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9833a6-55fb-4513-d671-08dba0360dd8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 21:57:02.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ld7VriKIHh7mHjCTpeNEZ9dwsrD81Rs1967ulBHbu0RDk1lU7IBnzwGjLxqbjAjfRfNZsGhxInmfmX3I6V14F9BIAreMagcNonfdQwKhh54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 04:04:11PM -0700, Matt Roper wrote:
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>index 234df629af8d..d64d34181790 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>@@ -136,7 +136,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> #define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
> #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
>-#define HAS_4TILE(xe) ((xe)->info.has_4tile)
> #define to_intel_bo(x) gem_to_xe_bo((x))
> #define mkwrite_device_info(xe) (INTEL_INFO(xe))
>
>-- 
>2.41.0
>
