Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C289C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 14:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27B510E857;
	Wed, 18 Jun 2025 14:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zuq/UYvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B1310E85A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750255727; x=1781791727;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=07iuxbUfvNl1k62iaQfPeaCnfy97HKNAVmVPoh2sqZ0=;
 b=Zuq/UYvdAncRFkZINfBJUeeFk+nFALtvFvrOazpvmf9P4me9yXxfl/Us
 FnMjkgSiyaeczhPJ4bt7iAY9FIHOEsvEckLeoMYgsm2BeVngGnBIXkkZB
 LanY5e8QerifDuBQyykorBrL4k5ZdGZqwTefdIJM+LY4mwi3UMwSUQiRq
 rqytKcxAQfMSUQQL1fonwlMHdmc/pyg3Qa1I8Cxg0jnBSOsez1UDoya/g
 yi3C3GSSbrtlve6xJwxDF4k5Re3MKToCM9Tyne1PeyFMF7IFXAFw8hJHw
 zDUKlD4AyrO5dylQyQ9YZ91lK9fLFs8FWWRYT5NuL3IhawyXesh7EAxst A==;
X-CSE-ConnectionGUID: YInk32rARP2Aiwaix89+Xg==
X-CSE-MsgGUID: LzZeKUvqRLuL/cqYEVQNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63515564"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="63515564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 07:08:47 -0700
X-CSE-ConnectionGUID: aYPLpm+VR4CGvs1YEURdcw==
X-CSE-MsgGUID: GY/FxrpJRQay5evX+4BUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="154319847"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 07:08:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 07:08:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 07:08:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 07:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBXLd5G0YIHmCwtS6fFe5J7yeXaY881qyMgVnf4s3mHsH548c1dId8p6DxaZNijDVW8W29Jwbn2q9rv2KlIurMJsRzlPDzcO6/fpd2Cty+HQeWVRG+6AJ4X1x3YsRUgaIYJ7vFCcXjqMrSy6GIL45f6kMoAxSj+LRIWde5C1W4ZKmRQKvvxKV8d5BMqDxx8G022AviOlaZakar8Xu3xJIna2mUTd6oxS3r+UBGauVMaDbZxq1LY60Awhy0kpQ5olmJAU+khrVOcF2fm6j9Zbgdx1q599ov+8/keO1+RKRO4MdzOVXDQIgJuFBbjUK/rKVcfdMW/3pXOpUznVS1prag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH89E8uBvRXPnLagEwcJyi3BkyXWIu2/7iQ9EW7MX7U=;
 b=O40zpprlJqzXbhwybhDTwV6sm7sMl4xi1T9y5p/akQtGpZQ4bwn+3+sC51oRlK4btg7+PtNn48kdTDJKospD3Snl+jkxMrztPVZ82EY+RKGobDklXtMRgaQaqowtD0I66IidPPndPX4elhbdrHp/2SssCrCcTE8DdtFY9FXJX4C0JHqcApZROKhjcMeHmhKjrMZmcXGRgTTMCnb5BR+sUGqDj7F5AdRlBHr9N7x6YKa0rsIMqaaeOkv3YmPfSKuPYbfjmdj5Uaz43BWZptNmcG1x3c3YLGBrXpo135QawjN/b9W3ZGjEbWeNGtTFiRqCUYLTwwF684arzKIL4KMGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 14:08:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 14:08:43 +0000
Date: Wed, 18 Jun 2025 07:10:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aFLIzZX/NRd43t9A@lstrano-desk.jf.intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
 <20250617153730.2136174-3-matthew.brost@intel.com>
 <84bee0bf7f0bc7bff3127e45da1b3db1862fba25.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84bee0bf7f0bc7bff3127e45da1b3db1862fba25.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: f2917bdc-7690-40f3-8eb3-08ddae71a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qjYHFgrW8kg5OoOO4seCTxC5gX51KbYX07e/ODMKjUi+BW4I8Az1Ja/mB2?=
 =?iso-8859-1?Q?yOBUKkmRVLBJJdzUQ+XzPCjBgs8MyG0U1RTL7pDeukkJponwK8is207QZC?=
 =?iso-8859-1?Q?msIoi1tBWIt6hkfUlYh0GmPUEmUY9Vr4H7j6hEYKWr6XvcaLwKC6JhFymY?=
 =?iso-8859-1?Q?4cRSIaM/U6NmP2mdDqL0UczH7FIilg/fdp7V1GV9o6q5XlypSFWzHH0VzN?=
 =?iso-8859-1?Q?dY8kdp0cmf0f4BC8xYRAAp1pyhac5tViPYwCkb0dMU1xwKcUD7e4IWY7v1?=
 =?iso-8859-1?Q?yJfjl6b6kXdT9hZkrU1rP5JBXG/KFR+tFpwEf935HLls1YPaPD6PEDN5HT?=
 =?iso-8859-1?Q?Q0eT6Hl1jK8YSsrTZKmRRUvzZGLTQxnkA/K402gHfqbiZCdpjtB883RXqw?=
 =?iso-8859-1?Q?l31Lg1pgu8LhVSH04YRceF4vJv5dPoSvjSsAqcjC9a7Dyo07MjTsZyi2S9?=
 =?iso-8859-1?Q?5olSRmSQ+l4xLNH2kI5L2D6MKoqLPuGYwhqKIB7IHfoAFzcqNuAIiddPkK?=
 =?iso-8859-1?Q?f1yhu3qxStHi8ViaVV/ugVe4Hh2NFX72tlimkSrQHH1CKSmtN3oChvWpL3?=
 =?iso-8859-1?Q?8Yq5Dy45YPXua/dDfuqViXKMs55unej/N+yfoG0b+hPOCxH5qKOXHkfrFt?=
 =?iso-8859-1?Q?1CzPEz0vYsXb5GCMrVA6QDzmC5JQOs8EKPt/lrrb1Hgo+UUtInLXZuEt73?=
 =?iso-8859-1?Q?71Bc/tXfhX6H0+gSEXQECr07NJnKUs5qsUzfcwzaWjH0E5IDxMRvFsx7On?=
 =?iso-8859-1?Q?iYeRzVXmnpCo4lXEiSKUpo4lWWkiMDoijBMUBMD8RQLJWsPw5ZZanECpbL?=
 =?iso-8859-1?Q?tWNmb1rtKrnE9UPj/Bkv+DcEJ8vQI+Ur96dljmDp5pIVHVeP3kLxqPujHw?=
 =?iso-8859-1?Q?yspvPT8p5ooKUMQI0hQJEzSIBnCTP82/wOGg0E2CtNJsPN1uSdadQOvW3w?=
 =?iso-8859-1?Q?CAGdGw5N5vZQ1QVN7Jv+dWLQndnh8NG+9CAA+1MQI/pInYdd2xBJ9xnAqK?=
 =?iso-8859-1?Q?rrPMMiPweBX1DCg6C3h0Pr0O/fmu75xPzSr34qm5fogCnibFpKipmhtxib?=
 =?iso-8859-1?Q?YtmwC15ChjZM/BGb0obzb0YlBPVORU8lXngdJpZInTK+NeGPqK0sESAWRK?=
 =?iso-8859-1?Q?hQqU4Do8yQChK4iZ6JtlOoAV+zGpUCohtgDOIbwM4aGOzIbB89VIYmhSWO?=
 =?iso-8859-1?Q?VR/1UJRZHX8QWogc7coeDzzEcropMU4BEw8wncBfBRDJPLmprKArUSZ9+r?=
 =?iso-8859-1?Q?4BHmK6qO5NED4Ad5NmphBCM3k3vU7Hu6CADa3hGorz+RrCwrBzS2KbGUA1?=
 =?iso-8859-1?Q?O/KwUi/GYmIK9sEQxyykuzqheYDsgLEexOwdaPDrFXqU2ST3YeJGZG8tYR?=
 =?iso-8859-1?Q?lieCvxvBvMGGFFkp1QUfcJY11Tl+FNRJEqecOXIxbdqgxio8UkNl5067tV?=
 =?iso-8859-1?Q?kG82ndRYbDuFwJ2G/V+wAiUD6PlBab7XcsbGesq0VUiwUTEt963xGCoXED?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nbNG12pY9gqK+KXwclV681pawCUMvEL6+oGJQCgvC75gMX4qJC961u/Kty?=
 =?iso-8859-1?Q?3VWi5R5Cm398R7aBaqA2YoIbD/tWLLB7uitO+4MY6UlGawK+/U5E+/NOgy?=
 =?iso-8859-1?Q?HRyG8kvQiDLP2DQI3C3i1JeX+ib/pIIA4658G5/xxZT2H0tqxRREtkOA6m?=
 =?iso-8859-1?Q?KXloktUqfGaSBzFDqoVA6hGEeXTBj5CLi4IFsOUlosl77vE7CXHTl15JUG?=
 =?iso-8859-1?Q?c5O1EgWMgc0BdkbEP4f+Fnl7j2q6Jv+uzHYj+fEsbAso/fT7IZ5BAx3kEN?=
 =?iso-8859-1?Q?FNzb/Hb5IMcFl1XjXY+drOmKpD+j/PLnqOqjqT1+BfZa2PWhz/0VwgoPar?=
 =?iso-8859-1?Q?kpS0RCd0rt1v/P/kXScd4D+VFH2pgc43rJHEYXREMWaCRKkEYMEoGOxVnm?=
 =?iso-8859-1?Q?llZnfIxxwGsCkvQEjy8XyaI1uTYrDmGbi3qyzVTOs4xpeHikjbIqjBm8En?=
 =?iso-8859-1?Q?RW6/yuv0GK/XCWXjPRMwbGJTPQn0MV/raiNqMf7K76gJipeUL9W8UtNVsJ?=
 =?iso-8859-1?Q?nhehqiNAxZmhN/ksmJuQKswPwJai6CPup7FX8bgtIVPFPlAepmaOeq40WU?=
 =?iso-8859-1?Q?BaT9niJhiwaOlIDis4yn68ux/ZarHj6XK6SDc0Mxq5WrprLMF4WBQkn0+B?=
 =?iso-8859-1?Q?Bo5jwHULCrxnzT8g7YdROvt40Rhnpofv9/xs4uOcD5pe0Olka5B6CusZba?=
 =?iso-8859-1?Q?VGhtHCG3gJTB+L24PO4tuq2j1vcPdX8RR+Q+ovLIbN9yfaHDl0MEs2cUI0?=
 =?iso-8859-1?Q?HbvitUIZJpwtrUZrEMBbSdNDDBhQmCi/qtsemy2ZPJufIdB9Gm6CTGzHJS?=
 =?iso-8859-1?Q?48FrI26pUyQuYW/NFMfepUL2Y2heziSLD55HJi79sBTLL2Pr60/V2mNBfB?=
 =?iso-8859-1?Q?+UvRD/YiFynhowaPB9BfJVk3gKzHGZGv9VXi2op3PGHe+9LBfOu+mXEImW?=
 =?iso-8859-1?Q?U6jzkaMAuf+AONIlwXo6VxcaCADVffYPGSB+kKXpLPiAaE3Ap27u5/ahdb?=
 =?iso-8859-1?Q?5ootCgCVt2XGhLXxsI1TGbPRjh/4EngTTpY6B3wck8YcJPl12ht36xePw2?=
 =?iso-8859-1?Q?r1rqECWGVxmiKPtSLy9h8vD5AGH1PSw+sycaCzPTdByyMRrW/ARBFNNhMc?=
 =?iso-8859-1?Q?VBF9GkTlNUcQgCuKSDC3er8GCT96g4QUffsESfSpZUA4KQd+jlbkhfrWFK?=
 =?iso-8859-1?Q?yPrd3VP15SXOmp/kUBXYSMBYGdH2qF9r5NpFdB1Aim8Fq7AlPHgVDmrBS1?=
 =?iso-8859-1?Q?d+QLB3xtFcnM6/x9enIA36e6W63N+kNiuzgLVazn7LbCKepTC5RTaxZ1Ng?=
 =?iso-8859-1?Q?Tkebh8hTHJsSw8fEtUddm1odIbDYUR1VPyM7IQa1ApIwD4T+4tO6cY7nGU?=
 =?iso-8859-1?Q?Zi+XMzsaShS/hnqiXeI0rpwMDAI/H2SupjXeplY0Jkqh6aWNmuOaQhHxPh?=
 =?iso-8859-1?Q?uYeqWuCHx6KJhzSJwiaR0HsuM6h7KrnyOf8UjNLRmMvd/w/daMLnLgvAIh?=
 =?iso-8859-1?Q?uViuLPsFstggTvSjCeTGXC9sHNrmnL9d1XJAMxFqdHQVle3j+xR8QCxPz2?=
 =?iso-8859-1?Q?TXDxBPAk93GoB4R2AX3judF3nu5CMkamgZnJNjvjV4ygHNzs2AlJJ6vQHp?=
 =?iso-8859-1?Q?zb2fbXYRQmognVOJ2dl/el4HC8rmbdmAvJ05w36xZtw9wV9pEzjgAx8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2917bdc-7690-40f3-8eb3-08ddae71a21b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:08:43.3619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNnqzEUYzk3Z1Rv7ZdazMu5BDC0OAKqE/M6M14IVS47PLb9MJM6WpqnasDbzNhqTLnVjq1EtGS5xo/CaYfoZfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

On Wed, Jun 18, 2025 at 01:20:42PM +0200, Thomas Hellström wrote:
> On Tue, 2025-06-17 at 08:37 -0700, Matthew Brost wrote:
> > Add generic dependecy jobs / scheduler which serves as wrapper for
> > DRM
> > scheduler. Useful when we want delay a generic operation until a
> > dma-fence signals.
> > 
> > Existing use cases could be destroying of resources based fences /
> > dma-resv, the preempt rebind worker, and pipelined GT TLB
> > invalidations.
> > 
> > Written in such a way it could be moved to DRM subsystem if needed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145
> > ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
> >  4 files changed, 196 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index f5f5775acdc0..3523bd093b7a 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> >  xe-y += xe_bb.o \
> >  	xe_bo.o \
> >  	xe_bo_evict.o \
> > +	xe_dep_scheduler.o \
> >  	xe_devcoredump.o \
> >  	xe_device.o \
> >  	xe_device_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h
> > b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > new file mode 100644
> > index 000000000000..c6a484f24c8c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEP_JOB_TYPES_H_
> > +#define _XE_DEP_JOB_TYPES_H_
> > +
> > +#include <drm/gpu_scheduler.h>
> > +
> > +struct xe_dep_job;
> > +
> > +/** struct xe_dep_job_ops - Generic Xe dependency job operations */
> > +struct xe_dep_job_ops {
> > +	/** @run_job: Run generic Xe dependency job */
> > +	struct dma_fence *(*run_job)(struct xe_dep_job *job);
> > +	/** @free_job: Free generic Xe dependency job */
> > +	void (*free_job)(struct xe_dep_job *job);
> > +};
> > +
> > +/** struct xe_dep_job - Generic dependency Xe job */
> > +struct xe_dep_job {
> > +	/** @drm: base DRM scheduler job */
> > +	struct drm_sched_job drm;
> > +	/** @ops: dependency job operations */
> > +	const struct xe_dep_job_ops *ops;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > new file mode 100644
> > index 000000000000..fbd55577d787
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/slab.h>
> > +
> > +#include <drm/gpu_scheduler.h>
> > +
> > +#include "xe_dep_job_types.h"
> > +#include "xe_dep_scheduler.h"
> > +#include "xe_device_types.h"
> > +
> > +/**
> > + * DOC: Xe Dependency Scheduler
> > + *
> > + * The Xe dependency scheduler is a simple wrapper built around the
> > DRM
> > + * scheduler to execute jobs once their dependencies are resolved
> > (i.e., all
> > + * input fences specified as dependencies are signaled). The jobs
> > that are
> > + * executed contain virtual functions to run (execute) and free the
> > job,
> > + * allowing a single dependency scheduler to handle jobs performing
> > different
> > + * operations.
> > + *
> > + * Example use cases include deferred resource freeing, TLB
> > invalidations after
> > + * bind jobs, etc.
> > + */
> > +
> > +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> > +struct xe_dep_scheduler {
> > +	/** @sched: DRM GPU scheduler */
> > +	struct drm_gpu_scheduler sched;
> 
> Would it make sense to support sharing a single drm_gpu_scheduler for
> many xe_dep_schedulers? Thinking of the first use-case where we'd

So do you mean sharing a single drm_gpu_scheduler for many
drm_sched_entity? If that's what you mean, I think that would work. Each
entity gets its own dma-fence contetxt and that is what we want - so
we'd assign an entity per GT, queue tuple.

> probably want just a single drm_gpu_scheduler per GuC since
> invalidations are ordered anyway?

A scheduler must be ordered in at job completion from job issue order
which fits here too with a single scheduler per GuC.

That said, I'm on fence about the ROI of doing this type of refactor so
it would make dep scheduler API a bit more complex given entities now
need to dynamically allocated, added, and removed. I can play around
with this restructure and see what it looks like in code I suppose.

Matt

> 
> /Thomas
> 
> 
> > +	/** @entity: DRM scheduler entity  */
> > +	struct drm_sched_entity entity;
> > +	/** @rcu: For safe freeing of exported dma fences */
> > +	struct rcu_head rcu;
> > +};
> > +
> > +static struct dma_fence *xe_dep_scheduler_run_job(struct
> > drm_sched_job *drm_job)
> > +{
> > +	struct xe_dep_job *dep_job =
> > +		container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +	return dep_job->ops->run_job(dep_job);
> > +}
> > +
> > +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> > +{
> > +	struct xe_dep_job *dep_job =
> > +		container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +	dep_job->ops->free_job(dep_job);
> > +}
> > +
> > +static const struct drm_sched_backend_ops sched_ops = {
> > +	.run_job = xe_dep_scheduler_run_job,
> > +	.free_job = xe_dep_scheduler_free_job,
> > +};
> > +
> > +/**
> > + * xe_dep_scheduler_create() - Generic Xe dependency scheduler
> > create
> > + * @xe: Xe device
> > + * @submit_wq: Submit workqueue struct (can be NULL)
> > + * @name: Name of dependency scheduler
> > + * @job_limit: Max dependency jobs that can be scheduled
> > + *
> > + * Create a generic Xe dependency scheduler and initialize internal
> > DRM
> > + * scheduler objects.
> > + *
> > + * Return: Generic Xe dependency scheduler object or ERR_PTR
> > + */
> > +struct xe_dep_scheduler *
> > +xe_dep_scheduler_create(struct xe_device *xe,
> > +			struct workqueue_struct *submit_wq,
> > +			const char *name, u32 job_limit)
> > +{
> > +	struct xe_dep_scheduler *dep_scheduler;
> > +	struct drm_gpu_scheduler *sched;
> > +	const struct drm_sched_init_args args = {
> > +		.ops = &sched_ops,
> > +		.submit_wq = submit_wq,
> > +		.num_rqs = 1,
> > +		.credit_limit = job_limit,
> > +		.timeout = MAX_SCHEDULE_TIMEOUT,
> > +		.name = name,
> > +		.dev = xe->drm.dev,
> > +	};
> > +	int err;
> > +
> > +	dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> > +	if (!dep_scheduler)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	err = drm_sched_init(&dep_scheduler->sched, &args);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	sched = &dep_scheduler->sched;
> > +	err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> > +				    (struct drm_gpu_scheduler
> > **)&sched, 1,
> > +				    NULL);
> > +	if (err)
> > +		goto err_sched;
> > +
> > +	init_rcu_head(&dep_scheduler->rcu);
> > +
> > +	return dep_scheduler;
> > +
> > +err_sched:
> > +	drm_sched_fini(&dep_scheduler->sched);
> > +err_free:
> > +	kfree(dep_scheduler);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler
> > finalize
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Finalize internal DRM scheduler objects and free generic Xe
> > dependency
> > + * scheduler object
> > + */
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +	drm_sched_entity_fini(&dep_scheduler->entity);
> > +	drm_sched_fini(&dep_scheduler->sched);
> > +	/*
> > +	 * RCU free due sched being exported via DRM scheduler
> > fences
> > +	 * (timeline name).
> > +	 */
> > +	kfree_rcu(dep_scheduler, rcu);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency
> > scheduler
> > + *                             DRM scheduler entity
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Return: The generic Xe dependency scheduler's DRM scheduler
> > entity
> > + */
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +	return &dep_scheduler->entity;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > new file mode 100644
> > index 000000000000..853961eec64b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +struct drm_sched_entity;
> > +struct workqueue_struct;
> > +struct xe_dep_scheduler;
> > +struct xe_device;
> > +
> > +struct xe_dep_scheduler *
> > +xe_dep_scheduler_create(struct xe_device *xe,
> > +			struct workqueue_struct *submit_wq,
> > +			const char *name, u32 job_limit);
> > +
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> > +
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
> 
