Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A4CFD2F8
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 22:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0608210E011;
	Sat, 22 Nov 2025 22:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBMEDML5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A6810E011
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763848904; x=1795384904;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b0hWygZ3HBwo5814Xm56t241ZI5kRyiU8nrDE4EQE4o=;
 b=cBMEDML5O+u6ZDH/KFuA5KatQVOtv2wMfWGKxHV9jhPYgVKgiNU096ml
 UoFrNTPzV3f31GR89Z3Da73LceEYrPsWN9tCgPQZTIVVuTFKKMg/vX35K
 6mUPazv0/yV4V9an8w+npgTVa6kgwQEDBgnL4fqBMA2cOR8yCXyx3X6+1
 0iUXJZ0bJ1CYmig2wmDQ/isLGK/ClawzC9TdkoQn9jKC59RQLri0cfn0x
 xdd5obXm3Bw2QCJdFjWB/6GGrXUd1b0lTkS8N5mrceuQy6wNbT9FRWF64
 EtKVT/GU+ntWtKOIYEM9t3mSj6PzTBdStpJeMJOlNDbB/EfxAFybuh9Yi Q==;
X-CSE-ConnectionGUID: V3Is99/OQMCHq00KkCFj6g==
X-CSE-MsgGUID: M6ORHxCPTRWQbout0wFzUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65091317"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="65091317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:01:44 -0800
X-CSE-ConnectionGUID: WV4Nhzj7RqC+YzftwlcYmA==
X-CSE-MsgGUID: XVVAMYWaSo+ig2W/U/Gq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191857444"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:01:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:01:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 14:01:43 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:01:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nndME/e3EF/6Ggda6IImyqN6oIIIHKRit2xW/W/vnZboBojmfh4kzEROfNZCbBesKMXF7+x9MK58xxrcH7TyhNBQ6nFQX37Ss5my7PEJkqSha1VqE+miDweejQQ2/6OPvDQkGRDz6xMdtkcbn4HOj1CV8LlZXtughmV79iRJuehAa9NWjzFoK+V/LLFpWXoZGk4m1V9+kNt3ERz5XtL06CxgN4UglW8+wfj3kiFpkGh+1IWyed2k8pMxzedvsJjDiso6gVXRqY4txpmlGCzU5lm3YZOnYV4MJwdWS/wrsmGVAteAjR7VHRS5MQHxX5rKgIjzGbWEVmsxfLQI12qoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhvugvo6m5GRiWKBU5OKGsWPeaElYxy0uyjkb1eLlg8=;
 b=wGaH1YzlNWIlDXRssrPfR75DyRj1nye+XNAT48Y6lpoCblwE2rlk12N9AS8Iw/lKBhwPFu2bGlo0gTGqvx2hP+y8N+EyugIyj6RIkPmPL+qSfOOnRjUdc0IIAxmDwztUvRyyRpJ0bzu1azDAIQt1kk19XcT+JtBzVXJOpP8urJ9LTM6/Spyx4yYGFuU8sSPFMRvnLI0lAbeGdyTuxHvYPINmUGGG1EtLHR63luL5gjSpdUT9YvnBDtKRVxE5KAoIC39+JiD4u/vNB7oP7n3rsqfriij+Ujr8p2bHZ20scCQLpIASFTWw7pY5HDtmwhfOt27HjYeoG1aa5GYaRzzuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 22:01:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 22:01:39 +0000
Date: Sat, 22 Nov 2025 14:01:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Message-ID: <aSIywKH7Sn9uV4Hc@lstrano-desk.jf.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103060957.957760-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a20f64e-3360-4c67-f869-08de2a12b657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oUtbshuiaKSISHeti9Dpog99NIyBlPEn3dxKuXyX3O1nWC9uhSUTBD5+mB?=
 =?iso-8859-1?Q?TqHMMJVD2HptdIWJ+mKl1Zl3pX8YoC0fl+wyBj5PYgcSQqlc7VqIXDvICi?=
 =?iso-8859-1?Q?Qd1wr/5N+Z0EXYf45GEh/B1TtwDa473rqzDSoBnyVUmc0rXtPliMtUJrWT?=
 =?iso-8859-1?Q?xCiJj+9JhoU8qB0rt9KSB5sJ5Ylflkfat9xPif44xAEAxV9RBR+FrpNDgv?=
 =?iso-8859-1?Q?kOSEupOdoW4vOwxP133Vz84e/JRN3PFJOxTZna+bBLUo0C7REcgqT9zaxV?=
 =?iso-8859-1?Q?8ZbX1pKxtmOZ5bkW9SCdQUh2QeFprqnnsM6mglMcQQsQSjHM1pFXltQrNs?=
 =?iso-8859-1?Q?e7F+8G54ZL5SvZd2XQZi/wUCOe6mf0LwjuDx26O5j0oJ4yL2P3b8OVnKn7?=
 =?iso-8859-1?Q?YQRkHn3Ku3q3pveLROdawz+MGQeSqx5EQLumvcY0MwVTrt3w1tLuS3lEFJ?=
 =?iso-8859-1?Q?bbLDR+Xn2vzTsrsYtJLt7YxacNiX1kQmzrzu6adkcdpm+UKC0sGIwX9VN9?=
 =?iso-8859-1?Q?MwulqgRV8P6ZpG9f7jwybTV/51bdw7Sie9+6QWQ2t8PF8Ai5J74PMZhtVH?=
 =?iso-8859-1?Q?JgaiKX7DTpDxf87acI67vascM560gYwGNqDSaKnJ8wo4NXIoVuXbDUMbds?=
 =?iso-8859-1?Q?7jbmvPia1SjSonc6eZdQ4Kzza+DpHaAaMo+O2t32dV+Unge2YzCCEU5fEm?=
 =?iso-8859-1?Q?AqWcQOes4u9uQb0SJAHQF9Swg/N5ZGr8u1AV5muVI/8F0bRrAlkWAoz9MH?=
 =?iso-8859-1?Q?3KBaH4tGapfnIDCyyqHhJxhf/+EwjJ6Qv6Y5GtzfHJkHEq3d1z7mQUCR84?=
 =?iso-8859-1?Q?9lVpV/XLxeyqennhiqxyi+XAX+EGkL5XWxV5DPYgnYxvKp1AUXZYbh0KmN?=
 =?iso-8859-1?Q?ztojjVktp4Sqf8c4sX+LWEpylBH1egZHsvyXPeohDl3qrzag4YElLDJg5D?=
 =?iso-8859-1?Q?P2b5lTcUWYTpqxt1T/mCQNYoRAuXBCqk7/DDQ0cCqYQVwJT/qLuuwQj11S?=
 =?iso-8859-1?Q?wTK93ctRAyLakxNfNhXj/4cgZJqYgwIHo+TBhoXjBjh3QLSx2E1kbjpac0?=
 =?iso-8859-1?Q?BStD+UqW+LWu4TN5jgPazg81EZqhrq172ar8xvXT3xvyICVmStUurOqgtZ?=
 =?iso-8859-1?Q?cLvjn09KH+rfQGGAtWu/kaqSqk1v5IGsFEJqgr4VvuZjzil/EOOxVcwTvb?=
 =?iso-8859-1?Q?EBB09CCHeTYvdXYUtWHLkpqU4LZk21r0rkjG97kNWq2CZ6P5bc9JvQHNWt?=
 =?iso-8859-1?Q?SpPuSsHkPNbhC9g+qk5JBAEQijvPsYkV4pYvfOS2WGrDISf7v5fxFLi7Hk?=
 =?iso-8859-1?Q?PccB03l5950ODnbeNa/4IAZjJcCWjup8Jyc9UG6Ad6Y17PKvI7bRS+s3HV?=
 =?iso-8859-1?Q?vXUsYr0iUkxhbsY48xbO8dBRhhlL8OAiHVhuG31YJSOui5LnHETdPWPwYp?=
 =?iso-8859-1?Q?sPfkcf1+ka99y6FpKpy7c8o4sgHkTUOeeWyQNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v8J/abvmgi+F6uezv8aW3sQy27LqTu8hc4KtRwjwnYe4sGvz0afwhG12e+?=
 =?iso-8859-1?Q?YgPyS8QQsAs1zXqm8TTXrkErxgScTPwfWRUKrOM626RwlSkTwKRuDHUMFh?=
 =?iso-8859-1?Q?8ig/oeJlXRdGrolBS26N9gDCWdcPkDkBOdg8javayX7YfpBkdoCWNidyHg?=
 =?iso-8859-1?Q?kROTsYuVEfQJpX8J7HYbfkEtBxrLyd5/zQQUSVeTS2wAaz9VSmJqK1ujNK?=
 =?iso-8859-1?Q?hHEIIE4WwxySelw8ilzrzLA7Ywh7X6dsN706CpCIzPwfNINALIO4uyPqIp?=
 =?iso-8859-1?Q?rormcDSejGLKesB5tZboHUDVs+7ubKw2KTjH4LKkyKUQP2i0ltoTMNg1q5?=
 =?iso-8859-1?Q?55Q7EtWFaegjLqjPk2Jc0dTN2Vxj1D4GU7c3JHOKCQEoYWCRolNip2ak90?=
 =?iso-8859-1?Q?CWYuIiQXoKDv14mlsUHTDoes1Jf7ghfcRrJqQ/zfO/zTunL9/xued2YRQF?=
 =?iso-8859-1?Q?yL/OnDbtFkw3YDaO9xDIxGofU/S/NofhiolnETj+G3i6SUufj5bAbqBCzt?=
 =?iso-8859-1?Q?cpFvg4aILflbC1lbb8ow6/6bDzLEnh7lxj6CE+DS8yPLLpVUuNK0szaQiR?=
 =?iso-8859-1?Q?rsHoxMr5P3gU5ZbfhEPhkQOCcO4vRqix5f+cL8wv5zGTGWfrUcwKNm013Q?=
 =?iso-8859-1?Q?EB0Y8TwHK3gYe8FeFIiTDOi1g2cYeeYMXzJ1qQvDrHevZBayoLGVQu8qPX?=
 =?iso-8859-1?Q?EG6yYB0C3xAAEUZ/ujtJGCFy6gwsBhZdfTG7zlW8xS6yUVp4YPU6EIbmXk?=
 =?iso-8859-1?Q?wym7bzwnrY71q1tS2C8siicUeHMDzjD46QyBcI+kc1VPPXO2codWYwjZHq?=
 =?iso-8859-1?Q?f21tg8sqOt+UdV7kdSrcv8fmUz4Km5x2sUB0wGlqO59dGn2asRtB242QXS?=
 =?iso-8859-1?Q?zbhVAOh0d+ItM41x4raFE07RNTMwyVVzTVICx7QM+seLNOHnDaLYAPW3Vj?=
 =?iso-8859-1?Q?d6wgpD+wGd83QpZbC4/+I9eXtz24tektnTNmvzJoHRPEQT6zUWT3Z3OJWG?=
 =?iso-8859-1?Q?s/7a9VilPAiuFaoMF7Q4HVNrTEXOJsmsd9U8Q3gZqtwuepD++fE8rFMEl3?=
 =?iso-8859-1?Q?z6aXMZf72yB0aK/si+AgZD2OWElzyhlvYjsrSmS1bVMjv35pJvGoWJ5jNd?=
 =?iso-8859-1?Q?QkZltHhH73cC86cln+VkwSrmGus16lAaXJlwq2fja/G0d3okSREPV+6xm7?=
 =?iso-8859-1?Q?bAWjohDmgrtMCua88oiKLKP9Zc7/LveVr6qwIkvjAi+Vm16s4CwRCvYGWc?=
 =?iso-8859-1?Q?5NvXUies2DDYAvVy3sMuzq4ZIRKkm3iAIBbKebvowgV8LGonyQQQdd7zC+?=
 =?iso-8859-1?Q?1Qjrees0+jzlFrrjzc+2jvxHtZ3PV47c8M+vGff4Sv+8z2jrr9TEO7dRiN?=
 =?iso-8859-1?Q?G2k6GMsfxXpS1JaAnSftp1Fs6dBDhoGsmjnVK6g0PVi6pBJ7U5vPrLM2Gh?=
 =?iso-8859-1?Q?uhTN1kbpBCTb3o6P2VTmJq1XoKp/MMa1cBatjcu/Utm1gzcIDiyhuBIm5k?=
 =?iso-8859-1?Q?jAQrGPIfvZcoik6D7GGYeqsKPm8+OZDNVT2ipMwNcVpudL2ClW4dLm0hNM?=
 =?iso-8859-1?Q?XfYkLgcNQm5wX0MuFxOY/kPjUEsiu05bf5/RoZ9OTSk/50lJmLuC7VSzIi?=
 =?iso-8859-1?Q?KtJTvEmZvpGnXtao4vv8Tacthl8CqOaFgPGlWdNqsbODTJLPWhazZr+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a20f64e-3360-4c67-f869-08de2a12b657
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 22:01:39.1731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GD/gN47XD7SNbhd+fgU3LPVIOOWB/bzZzLROGUF67Bt4iiyuvy7oSqFTusV++FmMW98dilne/CkhFleygaCfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
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

On Mon, Nov 03, 2025 at 11:39:56AM +0530, Himal Prasad Ghimiray wrote:
> ALLOW UNMAP of VMAs associated with SVM mappings when the MAP operation
> is intended to merge adjacent CPU_ADDR_MIRROR VMAs.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  3 ++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d78eb95a954f..12354e03c3e2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2244,8 +2244,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
>  			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
> +			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
> +		}
>  
>  		fallthrough;
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> @@ -2727,7 +2729,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (xe_vma_is_cpu_addr_mirror(vma) &&
>  			    xe_svm_has_mapping(vm, xe_vma_start(vma),
> -					       xe_vma_end(vma)))
> +					       xe_vma_end(vma)) &&
> +			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))

Do we need similar change to the DRM_GPUVA_OP_REMAP case statement which
has similar logic?

>  				return -EBUSY;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> @@ -4295,6 +4298,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  
>  	if (is_madvise)
>  		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +	else
> +		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
>  
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
> @@ -4371,7 +4376,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
>  {
>  	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
> -	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&

Ah, ok this answers my question in patch #1 [1]. But then in this patch
should we also remove the similar check in patch #2 [2] in which I asked
the same question?

Matt

[1] https://patchwork.freedesktop.org/patch/685118/?series=154832&rev=4#comment_1267065
[2] https://patchwork.freedesktop.org/patch/685119/?series=154832&rev=4

>  	       xe_vma_has_default_mem_attrs(vma);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 830ed7b05c27..7578ccada2cf 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -470,7 +470,8 @@ struct xe_vma_ops {
>  	/** @flag: signify the properties within xe_vma_ops*/
>  #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
>  #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(2)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS        BIT(3)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
