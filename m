Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38665C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 17:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45110E143;
	Fri,  3 Mar 2023 17:43:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF0F10E143
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677865432; x=1709401432;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lpR2FV0YZNQeYR71XNAliLffQJogFf1V9FTcnVayfXE=;
 b=JBdJC9KYJZanP82LTq6mRwISB0ZiSmMLN69EdPxDugZ5YjxjhIc6zKo8
 XBTHQJMOQ2B6Mb6hc1YwRTlbdF3gI/2MFmBuWcLKrj2BtX3LvPIIXWFug
 Zpc/eK1cS9fDYv1q0DHhnpDOHK5rMJ8rIZpJ4jg6kZ1URMooGWj+uBxN1
 xO7SMA9aLle15jX2dWCWIq/giYxREouwCuCzzXKz5YL2u/ZdUU2E9ITxB
 bhgx6lG0ULW4vzHcTbFVw1t2G6i/QjV2GjAURi4x0PZjItOjan4M7F35w
 DhlJNsbUO7rYLGn7V9VTJ3TegxCvDZFzlFANc+I915kNsTJ1wGQ3JZvae Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="397692777"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="397692777"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 09:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="652868117"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="652868117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Mar 2023 09:43:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 09:43:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 09:43:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 09:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grpr1fB3oJLScSKJZfRUQHvPMznWLH6TJRol0ual6cdhwqR1z34NxM7fVvISqRn19p5LD2Wcbp3e+CeKcnZ9oxoH/1V9eoket8bsiyAyWoW3I3Es70zRRWn6JRmvdOnMzpFecWisD+KjJjdbAjQpme6hOCwrA8g2KZCmNXTEcuS7GQ9fkrnzlidet6Sa9UxR+cQmdAsMr27zyAxMPxaT4OnHzlwKF1YnA9XSq+0o5QvNh59zWassAdkiyEWT/9W1RCTJcW3bVb9vJcrkkEb/Itk+l9xZExaPGCUtis87iD5f1SrA75CAlLkmKkvywu/L/R2NK9+yIViLoi9g0Ds9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQlev4ExqWHkS07eIpFpi79VQILwnz4GTinwy7SU+FY=;
 b=DiJoiA3UGZogQQLL5IvFYcwJcdji71FLaL/sBW5lUAsH++cBiiDB+XAmr21ZfeSdKupWDxmRS2VjLj5vjAANc9JRWyTYD6LsUA41XTrIxE/Ju01AUmo738AWhSKDWolEMjPm9sB+UaF+cDqNkgmpEZphcAmrgMEbJAhO0jxmQmL+3zyFBCJ2rfMJh1gAin6MpCWKbsW3Gy9+7OsIhtjXPzcOXBslBiPGcbgyesAoEoEocPBIQgu9oBKOD7qqKkmBmhOsf+L2Wotu9PYMBG4K4kKG2be72TGkA8abi2rll9nN3R1rzhP2DGwVHwkNS9230o6TYZfrsiQyQkkb6r8lDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 17:43:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 17:43:29 +0000
Date: Fri, 3 Mar 2023 09:43:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230303174326.7a37h2hjh6nlgeaz@ldmartin-desk2.lan>
References: <20230303170555.91242-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303170555.91242-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: d16548ca-aeb1-427f-975d-08db1c0ecc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eI1L5BoTu1WdCKHlrrleUBwIgXA0NXLgUyI+rq/Y8ZTWSY7SX0CB/FcmaGjuEFODfFJKuoB7PCAo+kLAoAAFBcLoafwwGGwvyEpLExr/xTQp5AYTxEgy9fGDkZmFx3DsLvi10hgK5JE4aFviMr41GmxjxkSdZPQ8QaDC1cFp17epyPE4IwppdJJEE2sck34wk8bMWoFn3pJWmbZOliXys78COXUR1unxFqt2/oU4ep7WPEog69DLrYvLcps0gc2RYsudv6UiqsQGKUshVKAzDHFpKkeocjXNMCpg3rvv/8Vm8PgbYZRv6wOGMHnc2IBkbbK8ZK4xBYXbl3SG2qylTsrwpdjzjIwgWoj413KXmT6y+nachLvh2cx9xQBBmbw1QdmrRH0b0JsOL0w6NwruevFa2pNpVV9cbFJk1/AG/Th1chmITYHqqwLo0DfFvPgpnmOKlsJRlZb+1Ac4XklWPapas9yHGf0x2lpt2s+QOaUubAEvAAexZG1K+w43gowKcvdIKOAvXpPDYMd4y2F4+MkVQtUOhv5Fa8RdurbkpLFRKF6LJWAhuYMgWybePkm/8Rx+HXtyOqWKts+8JPMPnGLQW3Xmtp0we6gCkrgPsPKwAdzpPoceno35yez+m2Tb+CsQwpw5Oyq1M+1uP4Ffg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199018)(26005)(186003)(9686003)(6486002)(4326008)(8676002)(478600001)(6636002)(66946007)(66556008)(66476007)(6666004)(6512007)(107886003)(83380400001)(6506007)(1076003)(316002)(41300700001)(6862004)(8936002)(5660300002)(2906002)(38100700002)(82960400001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/8aQEVGj2cZNqRx2tjd478stGpz6Cqzc4ptdKTECKourGRlRD7mtqwtqJC?=
 =?iso-8859-1?Q?odvdr8V4BemRhz6BRtN/gT+IKsTCwXj08Bv1uOr1xuHmiUsuQ6nHJBrwSo?=
 =?iso-8859-1?Q?NF97dkCxin6Kv6LnZRIVBdw/1f1Q6HvbGoQ+UD0tDQpkmEIMZa4QPnT/7M?=
 =?iso-8859-1?Q?rTG+5hdzk+TqaQUbRyCXm8ZINSc9TkjWDH5cCgvstHgxJKSOXkZGM77VkZ?=
 =?iso-8859-1?Q?Ik5VIve4fiDbEaTORamql62bkr5ZFN9gci5yQZKak9onT5pl1+rGI2ODGZ?=
 =?iso-8859-1?Q?GN0pWVfOBcGyQ9a8E2IWalJUOpZLHfH27okidkluPrr/yrnuHApFa7t2EX?=
 =?iso-8859-1?Q?ZnYioiBVQpnndntxjtVI8ANDHNvcC5KyGJucF3GLq0zvKhzU9VhfS9+7Jq?=
 =?iso-8859-1?Q?BM/6sE7h48an0dSn2IiegwVQE8xyxQOCvoeMh/wIRfxKJx0uOuVtvdUPMk?=
 =?iso-8859-1?Q?qGrO625EGSeYLHjtlouQ6z6NVgLZqPds9aRvyXf7EoTpTy6Lc0JmTJPRjo?=
 =?iso-8859-1?Q?P7dM/1rvYvIG25oZSqgs1+wBXwgXLU110TB/JNkji6J7fgdOaCGGTI5EMR?=
 =?iso-8859-1?Q?Wgjo1SK4m07a99c5LaM0/OZSjSonaxGTtetIPEbR73NPNbnSPqZhryW8qd?=
 =?iso-8859-1?Q?142/9ZXIhbpeqVfuWID9FqDtNS4IjQD5eTZh/KyvuF1GOzb1FWyRol8BRp?=
 =?iso-8859-1?Q?UJ0rCqRXyAkNy4DXWy1tNOQixQVtgLNeFTSCM/Ja6I+PLlYmzt0bzl5aVe?=
 =?iso-8859-1?Q?0+O5eU1nP+WNrslLVOeK9WcXVHjYnWEeX76qLDTtvW6hXPLoIaI9Al4AX/?=
 =?iso-8859-1?Q?l89y0wGeYQBhf2S3nBrA9SIfqNtVSf9qlY1beSwaAE28yan719AsCufv0T?=
 =?iso-8859-1?Q?CtKSacn/hBcfQ8DZ2dg26PFmcHkLxyJE+3ZsjDpXg10g7SXhCwkadqiWHT?=
 =?iso-8859-1?Q?Z8RjIjhBSxDpB3ecWJVfKB2ErNPUQdaKglTfwvMEAO2OQCkM9u0Yp4sbmZ?=
 =?iso-8859-1?Q?ifXZnzGlmZJv3zzvtkQoil2MKpBN8YneeINSaoXfWdyct46Ba1zfoBmcA5?=
 =?iso-8859-1?Q?tZMJRn8LN3E66OsexHzywWCxnkpvtjfAJV2S3cg3GVqiCMpzkBMZyhrNjo?=
 =?iso-8859-1?Q?VG5zdgPFWLtk/4rWJarohW0ntyHjaDOh5fojmnjm5AuGJNxqmL0upuDfCL?=
 =?iso-8859-1?Q?rUSBTTpUZcxP0+sRs5wuMy3dRi+yMKaFiM6DuXWTzYzngvOV5qB6bkx7Cg?=
 =?iso-8859-1?Q?iGSSoLk2cJ6IyxkDaYmrqaMdOFYKjRLnxYQyRVfTtaBsATp/N+lV++WrSl?=
 =?iso-8859-1?Q?Y16yLBd06KGiOHCFV0BQG82M0JY1BbpuNBXqe2478OB6ePsTNw8g171dMi?=
 =?iso-8859-1?Q?bvFtLAuc9NT8O49IJKTXpqngwm6b44Sqw7cIV42Uz7K4YdDmqo4VzEkZdI?=
 =?iso-8859-1?Q?fcajVX3+YiPqeh87/zVAEijAXRYvO3uuUvWGRG7M6P6Y5U8nya2OgXghe9?=
 =?iso-8859-1?Q?sS8SUizU0aM/caFmX9BCGyVfMUNTjNkUzy2MO/B/jYyeGPUrQuV8EyTdEX?=
 =?iso-8859-1?Q?uLnnS15RBSL0qKtv41WR/FGUSrCalFbDpmJKcijKzMZNrddlNit8mGSdeG?=
 =?iso-8859-1?Q?Qbis2exZcW8qZuhhFih1bM0/I+R1OCk7v18Q9ZSKqQe0fU0iWThgVotA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d16548ca-aeb1-427f-975d-08db1c0ecc64
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 17:43:29.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4wAeMxq+F4DInqVgclTcsG0h61gs7Ao7tcM0sJl6K78CwCKhGiiQWzeES9Y/76efiAMAG2tGW2wO8+1uRLylXMXz2OVf3vKPqxTfVpTbkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix size of xe_eu_mask_t
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 09:05:55AM -0800, Jose Souza wrote:
>XE_MAX_DSS_FUSE_REGS was being used to calculate the size of
>xe_eu_mask_t while it should use XE_MAX_EU_FUSE_REGS.
>There are no know issues about this but fixing it anyways.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index b01edd3fdc4d5..74b4e6776bf16 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -31,7 +31,7 @@ enum xe_gt_type {
> #define XE_MAX_EU_FUSE_REGS	1
>
> typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>-typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];

since XE_MAX_DSS_FUSE_REGS is 2 and XE_MAX_EU_FUSE_REGS is 1, I don't
think it was triggering any bug... we were just using more space than we
needed.

The fix looks good as the xe_eu_mask_t is supposed to be the eu mask
*per DSS*. This comes from commit d44a3291d2a8 ("drm/xe/gt: Read topology from fuse registers")
before the initial squash.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>
> struct xe_mmio_range {
> 	u32 start;
>-- 
>2.39.2
>
