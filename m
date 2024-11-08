Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973EDD64074
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4DF10E288;
	Fri,  8 Nov 2024 17:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="et0tM+ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9928110EA25
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087998; x=1762623998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xmuvd5242RKYew9RLK2uEJ3/lfAL9vor66pCKHPuTZ0=;
 b=et0tM+ecUJ0g1V3ZMI3JpHOz2tHU3lXzHe95R69jFJisLody2uNUiel6
 W9uwqzHdml++cWOp9pdQJ29cZ3BkWGgRoyxmVktW8rwf/1LBSXvlhOVkt
 NdyoYsxBDUxx4RyzHUfJYqY6a4f0I0dnJeiYAoS1Kr4UDPlb9q3g7rXNK
 YcxpdNApjG51T46d0EO+rUxgRQl729Ky/gUDeexqYzUcgewAadncQNJq4
 dPbuRU7mpaaRhoepMbnZgAMra3TSPVGTP0lfMdONx2DtkbCRLFHymFZG8
 0uwQqPXM/xC07SMTJ8Ws3VXvpp/HDPZWWuBPKWUFrI+6IcXv0YBzXE7jS w==;
X-CSE-ConnectionGUID: 8y4HHfD/QMqnWIJTywOoFg==
X-CSE-MsgGUID: N4MeQjitSfKf7urCUEZlWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34766508"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="34766508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:46:38 -0800
X-CSE-ConnectionGUID: AzQ8V8LCTRugNLL4NCxMeg==
X-CSE-MsgGUID: isBWOSt4RkSPojD2sCltsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="108952777"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 09:46:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 09:46:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 09:46:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 09:46:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtzGPk2ikSGR2ypbCeYZ62nfmzBD4HYNo7l1KXAc7BogIuQH3mQhOZuDQmvnIJhYpHHX2mNIlePvnC9SNaYx9AT9DKRO02TqAPI+S35uDGdOiT0rMM6L+lkEHC6Nui7zQG95NBpsmDB8xK7CmfdLqW2h4oeShdAIYTS0at9palMHagL6zHx9j5EtubTUlzUW4Gq5/a7sgtL7E673oyPGks7f4an9yvjE2dVFhV/iLtMNP4BB5AP+3zJIcwntBuzpQ2xQhwQPSNXPqlr1G2MIR9oFnfdJ0zYpJ7a+7pL4voDT9ReyMl2mwXkfhQG11wSO1SoEgYGugcmzsPB8C8A0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhuPKptZIaKZbUAYNgwz23b/Yl1jrULSnOF8xxccREU=;
 b=bYQm//2GqaSSsXlwI/Wbxfp0uOyk6hgCA0zeFRfEwjkzTpMBqGB+bK22jt89Z7DaQwNXgXRzF0xH1dSlDKrtn87ZvWp0NEfEFu53kMUfj2bij9nu4+VAccp9awPtNzfayFnFAhQLc5yd9dSb1A6j9TQMwIhWuGZgDuEnTg2ngirn3+eSQ920KvQFYR+/SSxPKdaJwnpbG/At25L64KLjYFuH6/m9c24lGDdo4cTexzb85eq2ExMM8FLb1Xp2NwD/JuBp7z9hlu4CBebTUJhle9CYqGd/6m07byfZe/PJS34NpGnLbJz54l0Wb6eEMJgEKr+1VG44B8g63gueOoB1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 17:46:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 17:46:31 +0000
Date: Fri, 8 Nov 2024 09:47:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <Zy5OlxyoDXM1Va+l@lstrano-desk.jf.intel.com>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
 <Zy45chxLtJGTR7aA@lstrano-desk.jf.intel.com>
 <Zy5IeAwHVCSMr2A6@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zy5IeAwHVCSMr2A6@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:303:b9::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4793:EE_
X-MS-Office365-Filtering-Correlation-Id: 498d63ed-9cc9-41a5-3e97-08dd001d478a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jvckEkL7Q4VTsrswUSr2f3pOPcUYePKJeL9kNGlfwinG2zUylkCMY/uXWR6y?=
 =?us-ascii?Q?rhZ+t6hvkwPz4L/CMAHmNEQaGiYBktZqSjk5/gFQi2mrsZK9+2m6QHEyd2jY?=
 =?us-ascii?Q?mc0M7tBWLOsAnQLF2c6KMiDTjPIVSCV0PvBkgYjvaV2MJZd2kDDKL6pPKbP2?=
 =?us-ascii?Q?oTgQysXo81aZdhKx9mPeld1Cmx3hr25OnHRtN3KdfO3mGnO/dTtWaNSbbfmQ?=
 =?us-ascii?Q?/RuGrOI6Rr5lzD/JcmzM8UhUHgM/L5zs+J//peLKs9fvWs70Dh2B2sHVEw7q?=
 =?us-ascii?Q?RTq55sg2hHPVIR6jz/jgzqqUvgHh2gx8+61Md3IMtpLDGItPSnKp99KcZpKV?=
 =?us-ascii?Q?Cl3ShZCYjDTzc0l2+42N28x02Fl/05fL5vhXit14fTsWf8kAo1gPSNW2iili?=
 =?us-ascii?Q?jjWZWwYycBsOl7OILQYHgZjv678l4yLVCHa/MZeTgQCj/DPhaDqWtehiwIvq?=
 =?us-ascii?Q?smSa5MiqKUXYXx7lWwnqxrZGWGqK7spRKuTHtSS24wkcZfXEpN6gTo7sytMe?=
 =?us-ascii?Q?agQtDBFkvxK2xq+5w2/VACkg+2m96CbbNljMNKE1AEQRu41hopqqjLk4xttU?=
 =?us-ascii?Q?TUOZP9V8QCdjCi1DKRxt3q2GxSTZUrKpkHZONw4wYvgEW4X//1GjcbNfimCX?=
 =?us-ascii?Q?45embf7pM4H0NbEwjqrRpnKfU2uFMlcMhrBIzUV23VoXr8IFgp0uq+TAsOej?=
 =?us-ascii?Q?8Emd0jnFjwfVKmCToJ1ZIO/H25JCF3QWPor3t+z3qchaSpApEtkuQ5FxDokt?=
 =?us-ascii?Q?KHsaVVN39rQk4tdUcVeUhHJsyZwKXXT34K3nWYIN+nLoStzMNGF8TRjsPDuL?=
 =?us-ascii?Q?cwCwMChXnvP/0dKiJ8mo/+/KgyVdZX7iG4WLZAGWgJJvzIFYhHDVNdZDNAQu?=
 =?us-ascii?Q?LEXGYF59o5ILCpS9fVmPpdWR8SP6y68XwJI3XFfokeklWqmc+0eSTY7aFQiW?=
 =?us-ascii?Q?Y1w2GAxlNOrV6chXJS2aDNjKgXNz54PxTlV1lXF5BT6ofaawGTvtX4d0z2/a?=
 =?us-ascii?Q?Vkaz1+2g1H3lM2vxbyr+9xY68RnBmL/Zi5TsGjfLhDsdxc8kguqA7nYu+bYp?=
 =?us-ascii?Q?628QtmbWUpjdUTDzjXiPOPaJc/GnIhWVFhhblpN2SxFkz+kp/bIUeJcHhEv2?=
 =?us-ascii?Q?p8h0NWS/atyXECPT0DQaFtUGIfdWUh7gi7jVb0BWxptHz+DDLcs06/xaAxT5?=
 =?us-ascii?Q?ZGL5wGrE/swELq/GsYiYtER8KwyJj6YuSE7/zBgeO99Lzk8cBrNdfu8sRSrZ?=
 =?us-ascii?Q?lb+Ec31D+GKd0jqdis7iDrSzy6UT2+hvTJUIzsTkI9AloAjJoN0zfijO1VZf?=
 =?us-ascii?Q?vGxAWTGMXzocsZ6nSHhDp9Gv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n/b79gvW8EDmsRMQLx83Cu3qYasoJThqWDzom6cBNXm7oM81HgCYd2dv+KzL?=
 =?us-ascii?Q?hrKevHd07Qa+134K7DHAArOMtHGR1HZVJW6MXqmVn2kxopa5gRHNu39oV+h/?=
 =?us-ascii?Q?mOk5St/BbwntuhqEn74qaF8ExpqVWNFnmfLg2ooBp4nIrx1Fz/E9/MYePDjU?=
 =?us-ascii?Q?u9oM9agXSKkQ6Do5Gh3vIC7xz+uCYdg4yuDKsfHn9YAKyrfPNx3VzYXik061?=
 =?us-ascii?Q?Dol6XnZMUcJcOr4vHPffCG+B++V/9F9+UB+/N3iz8fQ3P32lMGBMpOtqav6P?=
 =?us-ascii?Q?ClZiL1wO8GQBH+W+btvciXNNejZWdwgbiTu0zUsAmvEDfy7GoxWu0tAZKZmC?=
 =?us-ascii?Q?vHguqcBebz7QhBiB1QfESxvChjvCs91AeoXIXpS4JQjO/gS1IUOLhHzHD9kT?=
 =?us-ascii?Q?kvPFBspZPPkqV5S/ecYwfsTMrmIw4bL4LqjRzIqNJ406qAScuTTuOF1O0D2V?=
 =?us-ascii?Q?oo4w92Yp8Ar/+2c3N1AXugERB/OiocHa93Yt1SoTfJ2jX8t6ho+iNVeV6Aud?=
 =?us-ascii?Q?Ygw3+uA4KjonBr4ZfkifVHgoS2N5rdfIddWMa/wRS5Nv4PvBQA6FzVtoEUAB?=
 =?us-ascii?Q?H+CBwEXPLi6nRe586w7YX4SOxFBnsKwg4XC9YUlvrE0XMiuSiSgfeSYlxBVz?=
 =?us-ascii?Q?ZEYLjd7vU+cOaJ7xBpxgD2SERjyM1S5DIwVNSmpxaJgKc/ZiVj9VeZt3QCYS?=
 =?us-ascii?Q?mDo85XcjmM3B+cGC5HiDNrHnoZRRtevD/ttEuDgKIxoY55DwF0KegARnCX9E?=
 =?us-ascii?Q?TURWac0TfV8VKxZwK6QERAVBGMhstYR1gWHknKLeT2OA+mjVxMKRVwSFU6gI?=
 =?us-ascii?Q?fpnj1P5qiX+WuIobS6ReYZ9JZ1KdkEItY1hI5cqQkzHlneyFn6+SqWlthH2F?=
 =?us-ascii?Q?0ypOKO+GkrBqG8Zi87xmLAXWfxV5k6IuGu58m2aOAQtiv9lObe54I47QbHW2?=
 =?us-ascii?Q?56nQc4/VmGWEPHr6mOZTMtSyR2hQf9jgL8osG4wS4IkZdSqPAg0fffs12mfY?=
 =?us-ascii?Q?dmk83etlAPni1sLqN/DfjPRPoSh+UvvBk1QKjCr8RA/WhUiDaBM4k7pKjBPg?=
 =?us-ascii?Q?gOOjlFMLgux/LV8Cy0Dd+buuiyB1OjToBO308s6zcocSBRgdLWCB8Vf4EQVz?=
 =?us-ascii?Q?0nl2y6biYXHjgOdFhkJOXDezAicosAsnjeXLFT7MNfB3p0J1k+u9IgGiUFur?=
 =?us-ascii?Q?sbK6Jpl/GzEtOq9+2FYtxTJ47cFf5e6EFeNh/j0ekaeFAN7TTbP5rwOgUocz?=
 =?us-ascii?Q?LeIcez9ZEL+c0CA4KQSWvp4RNWTh6K6v32EiZl5Dj6yqCgJc90bPjVyWxw1/?=
 =?us-ascii?Q?F9dYiSJrrqpV1OF3ZHvudEcMbM/PQk4WGviWq0djma4s65nZg+xUoMWrKS8Q?=
 =?us-ascii?Q?kSmDbQA3OGK0dmJCNNLymtq19Zf91BrmZCs8yDp7vwC+Nmt2ALYhHSlQL58j?=
 =?us-ascii?Q?2Mp7gL8tD/OeykJxx701DpmeRX5C7eZftY/i+EgwdJRkzju8i6w+fvNhOAI2?=
 =?us-ascii?Q?1+1nnFI3VE/GCM1SYIm21SFUStEdR3HgXk3qjXndTBiGW3wU6v1x6OVf+ynt?=
 =?us-ascii?Q?vYmmw7yd2znwpqW0SDKTOCpQ+mljPx1Ue9/zB2X2YsQ+dNgbAv2XUuMUF0JU?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d63ed-9cc9-41a5-3e97-08dd001d478a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 17:46:31.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNsb85/DKeOJg0lEI6UyiPpW9X92FdAXuIPHEbDIfKOVlMKfhVIPAxMLik0lrG+hb5jxUFKA6OeU05DkAQUWYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
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

On Fri, Nov 08, 2024 at 06:20:56PM +0100, Francois Dugast wrote:
> On Fri, Nov 08, 2024 at 08:16:50AM -0800, Matthew Brost wrote:
> > On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> > > Use fault injection infrastructure to allow specific functions to
> > > be configured over debugfs for failing during the execution of
> > > xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> > > thorough testing from user space by going through code paths for
> > > error handling and unwinding which cannot be reached by simply
> > > injecting errors in IOCTL arguments. This can help increase code
> > > robustness.
> > > 
> > 
> > Let also add xe_pt_update_ops_prepare and xe_pt_update_ops_run if possible.
> 
> This was just to show a couple of examples but it is straightforward to
> add more, for instance this is enough to add xe_pt_update_ops_prepare and
> xe_pt_update_ops_run:
> 
> 	diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> 	index e111698abbd9..684dc075deac 100644
> 	--- a/drivers/gpu/drm/xe/xe_pt.c
> 	+++ b/drivers/gpu/drm/xe/xe_pt.c
> 	@@ -1852,6 +1852,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> 	 
> 	 	return 0;
> 	 }
> 	+ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
> 	 
> 	 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> 	 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> 	@@ -2132,6 +2133,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> 	 
> 	 	return ERR_PTR(err);
> 	 }
> 	+ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
> 	 
> 	 /**
> 	  * xe_pt_update_ops_fini() - Finish PT update operations
> 
> and in IGT:
> 
> 	diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> 	index 43d3a2da0..ced6edaea 100644
> 	--- a/tests/intel/xe_fault_injection.c
> 	+++ b/tests/intel/xe_fault_injection.c
> 	@@ -233,6 +233,8 @@ simple_vm_bind(int fd, uint32_t vm)
> 	  * @xe_vma_ops_alloc:			xe_vma_ops_alloc
> 	  * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
> 	  * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
> 	+ * @xe_pt_update_ops_prepare:	xe_pt_update_ops_prepare
> 	+ * @xe_pt_update_ops_run:	xe_pt_update_ops_run
> 	  */
> 	 static void
> 	 vm_bind_fail(int fd, const char function_name[])
> 	@@ -282,6 +284,8 @@ igt_main
> 	 		{ "xe_vma_ops_alloc" },
> 	 		{ "vm_bind_ioctl_ops_create" },
> 	 		{ "vm_bind_ioctl_ops_execute" },
> 	+		{ "xe_pt_update_ops_prepare" },
> 	+		{ "xe_pt_update_ops_run" },
> 	 		{ }
> 	 	};
> 	 
> 
> Then in the next IGT run:
> 
> 	...
> 	Starting subtest: vm-bind-fail-xe_pt_update_ops_prepare
> 	Subtest vm-bind-fail-xe_pt_update_ops_prepare: SUCCESS (0.042s)
> 	Starting subtest: vm-bind-fail-xe_pt_update_ops_run
> 	Subtest vm-bind-fail-xe_pt_update_ops_run: SUCCESS (0.048s)
> 	...
> 
> ... which triggers vm_bind_ioctl_ops_unwind().
> 
> I will wait for more feedback and bring in those changes in the next version.
> 

I haven't looked at the IGTs but the error injection point here LGTM to
promote to an non-RFC in next rev. 

I'll likely want update xe_vm.bind-array-conflict-error-inject to use
these points too and drop TEST_VM_OPS_ERROR / FORCE_OP_ERROR too.

Matt

> Thanks,
> Francois
> 
> > 
> > Matt
> > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
> > >  drivers/gpu/drm/xe/xe_pt.c         | 1 +
> > >  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
> > >  3 files changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index fd0f3b3c9101..b999db5f5c19 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > >  
> > >  	return q;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> > >  
> > >  void xe_exec_queue_destroy(struct kref *ref)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index f27f579f4d85..e111698abbd9 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > >  	xe_pt_free(pt);
> > >  	return ERR_PTR(err);
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
> > >  
> > >  /**
> > >   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 624133fae5f5..2e67648ed512 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
> > >  
> > >  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> > >  {
> > > @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
> > >  
> > >  static void xe_vm_free_scratch(struct xe_vm *vm)
> > >  {
> > > @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >  
> > >  	return ops;
> > >  }
> > > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> > >  
> > >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > >  			      u16 pat_index, unsigned int flags)
> > > @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  	drm_exec_fini(&exec);
> > >  	return err;
> > >  }
> > > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> > >  
> > >  #define SUPPORTED_FLAGS_STUB  \
> > >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > > -- 
> > > 2.43.0
> > > 
