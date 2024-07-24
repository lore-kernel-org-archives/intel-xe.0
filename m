Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1401C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 16:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0FC10E751;
	Wed, 24 Jul 2024 16:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpzMD7HR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C78D10E751
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721837867; x=1753373867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KXYN/dKB4li6Mc/+asAiOd3zyhVk4PB4z2qD+8wcWnk=;
 b=BpzMD7HRHjwijO7ib3VHrpuHjjerAJ7Q+asGOviuY0R+UKkiDzh6n3FM
 q0Hsy02Lh/tdDnMBAiFjFq3LAUMKqauLhdlwk+BqP8jY9VskzRNM6DXcy
 72hwK9AN9FtZS/qmlIsaRDxyTfzw9Ye+3CU4STkslDLMUKI4PwTgOeiIX
 qHevHRrn5grStiIsGZL8UxQAlIo5snhPQjl+AMlZahyC68eAdGJZssm7V
 eceqzE0iTFFmcONucLPmIfQLiWJ2nfl6xOeGlJsF6jFrt/KUcFvL4I3Am
 vaj3ebzbL3Hy0QthAqSoqUP9GjP7v/vK/k++QkFEE/L6mHwLk8WfgJP3k Q==;
X-CSE-ConnectionGUID: PG+TBd7/R7uXha1/6i4s0w==
X-CSE-MsgGUID: aK3v9YBnSsmaAE3dCgjLzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19491254"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19491254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 09:17:46 -0700
X-CSE-ConnectionGUID: c1A+tMZaSMmtbyGgFnIZCA==
X-CSE-MsgGUID: RhFKqPJuTPKoBNu5mtL+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52554518"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 09:17:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 09:17:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 09:17:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 09:17:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 09:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clexo6aNScxYCBufEOip4QpvXTsW3DtFIxvGQ/Um1CUPocKNG+Vg4+kn0Qwshx2rhFYP0E4Z/UStlWR8sWjyBKsYrP1nOkNbJgxstjAXT3lFGBCJzGTqiNEgVierBlJfx/jAtrw4M0Uc6Gr0CRigNiIrcE+B7kYhjkxbVnTQWE8SinuSlUFn/3AsKGFpC2PBRW6KNnlMO9WCY43SUCDKFohyfnUFYMXZNEuWgctk/M5HF9K7tgZM91LOs9HXXg0gXqBz1PdjaYVi8ItLlrifM6GvJNrEZ/F67JdOsuX/7klOXwEXtC1TO03gvSZ+NERibwwI3vua396iLKZfq/KyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UyZErhbKrg7gw16ZDgFOCrHruDljFaQAUibn2IFRQ0=;
 b=aBWi9C/Xp/nElSm8EJvQcMdWYfBun2HzfG+ToIscSUtZymsyGqePcSW6YXBGTvfE0E11rk5S586tIi5K4D0HLLBqhYRd9nKVP8ii0mBDn8SuFBrZQSlHJKaL/gp2io6yTliufLuKkhSv0HNp1qRqGeq9+S+Sca4IWtT/7ZzRCqZYsYR2N6lFxPfW/pN+tyYAAdjAYlAucDZEkh+9rPNkleMo/jAqKvxzDqMbWpCTYs/8+2UOkvmrCXcFbwhP5RqSZA/m0hI6RcXEUOPHGNUo5W9kRfjb7+a188z2ntweBvpeYWcCcP6tRk6/ac/ZKOkroWIDpN/HQgoTwtnPK11+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Wed, 24 Jul
 2024 16:17:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 16:17:42 +0000
Date: Wed, 24 Jul 2024 11:17:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add assert for XE_WA() usage
Message-ID: <4ejbrte2gap5kefhxqqy5f4oncqcc6mfna6px56y34js7obdkq@7i7o4jo72cxx>
References: <20240722160815.4085605-1-lucas.demarchi@intel.com>
 <f815e741-3578-404d-8eb9-099bcb3f22b0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f815e741-3578-404d-8eb9-099bcb3f22b0@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cbe577-b088-442a-b2b8-08dcabfc256c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Z+dr9k0ojARBZC4D6OIuBOO38uD2mtOf8FYziA3g1STR3kJoK+XVCSRqj0D?=
 =?us-ascii?Q?L3PBMTkZ4hL3nIIj0MU5NlVcj/gsr4ULcWDSo17p9YVZFYpac6EQjEFpsjcc?=
 =?us-ascii?Q?vCQ2HLJQK71RopOJC0dvSRgcF30JXKR5c/vP19mQYTEpM5S/Swr6O+tOy+i/?=
 =?us-ascii?Q?rlI4y2gXbzsM/A1zQjfFSTF9B3ZDyWANBzrwlPDeCDxjUuveDA7Qp/QquFBl?=
 =?us-ascii?Q?zp7BcrfoeLPhzY/VPHulMG7EVPD5of1QbCjBxiyq0aAhXMgHjadwpMBbeM4b?=
 =?us-ascii?Q?3hHXYHskyUgNhEZFscQ0PlahFzwqSh9sM4c51U1hPNm29rrVSSnTBy5WTDYo?=
 =?us-ascii?Q?PTO9aVhn/Id63NWEdJqv5yRgldzq48m6WnrhFGMBYsAov+2Ze7h7E2SK9rkY?=
 =?us-ascii?Q?q6bz8lN2WeKBTY8539jQv9z6N0DBBWxkDrIITeHuvOtchUWP2VmruHaM29bv?=
 =?us-ascii?Q?bUILUt7y6TE/3iYcH0ra08wUiAlGVXvBRlRz5rEaAH1bme+MD0dizHe2MX88?=
 =?us-ascii?Q?tzLqjQOeYGY4AkI3KTh4yQsHylew/ADekPNWw2MZ6h+kcnUQGepNBHlWSwCi?=
 =?us-ascii?Q?qq3N+N5SYX53tb6CSSSYgGPsFLChftT+JNf4OxloyDmUoCQ12mpECoYNNFHY?=
 =?us-ascii?Q?sydjLL8MJa9pzpxOFGyKzgyYPOL8MyRfnG1AnrbvwVJZI7bUryiISIopfbOX?=
 =?us-ascii?Q?8Os28RPW91waCE504k4JD7BpxtaNS+TXqfhZ3nE3N/7rgPM8bTlGxepRLSVj?=
 =?us-ascii?Q?HPPX6Br8Y5BhUAmAo3xcxrLj4DVOlxnFCoF9tIyHfV1OlgRJPTV/sd8e5IY6?=
 =?us-ascii?Q?9Dv4fbVZ1x8PyRou7ShQPJUsM85fkkYKOToRofmLBUAo4VyiAlvfA6XEX0Yv?=
 =?us-ascii?Q?0rWDPBcs8G4lvY0JJwuAPzCyxJBSBKxPhpm+Vs4Fjq7qSSQwzQZd4xFoyoXJ?=
 =?us-ascii?Q?uMsXC112ajUqj8x9RDJ9Ie+Edz05Rh44qxMT/xsKFTy99GKw/TF8nLBibLrg?=
 =?us-ascii?Q?teRfFCeFy5DVEdn/H3ULIh8Z5/ULarGqXoEDDo3sAtDu6+paLQILimdD5y3E?=
 =?us-ascii?Q?ajilFSl2bes9vPJf8s3UPNjEV1drfJ4qolISp9jaGTKmkADPWIFvM2TQHWvq?=
 =?us-ascii?Q?Exy3UIkMu35Kwv1pSkIraItmcr7kUznwKTTR74ynyFWPeJ8GFWYv74lOrHE1?=
 =?us-ascii?Q?jx95EsHKVDzEPgdpHB/ReYW9iQJVO/A7AoJ5QwhaMDfaivFN6pAHFWRtPenr?=
 =?us-ascii?Q?Ly6K8uWQOaLbcROuEnM+xZwiLvL50MUG6HQEH08Q6G7iTojQL8cYWPjUyTcM?=
 =?us-ascii?Q?FDgFuEnoZDqn05DSVQ//qZhhj+9aGuIH6S3/4n5eTixMpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bVE4Mq1qeLw5CJ/F8JG2/WWkHgcEdv8ERRqOTZ3q9nSMpMgjesEpK7ao/bp?=
 =?us-ascii?Q?8nnXEAUoiPhzn+atXuNkGfRBnXHddG8IgTxDhGkSLzYlPfDF1xxsFFO8cZM+?=
 =?us-ascii?Q?KJY4Si2dnP1fGhHmmIZOPTgKa2r/wvJNTj1EHCB0dr4TeSLeavXpb/TY703o?=
 =?us-ascii?Q?34S4RVeA3pYVCqSC17TQMvzcShXkfPVK1AiT4MdWJ2r1j2qHdKxQXwG/Mm7b?=
 =?us-ascii?Q?vvVGZcRRopzqJTN4ESDpQ/y6VQ0Ix/3e7e9v2BSMif70w08sNuL+BXuWL05d?=
 =?us-ascii?Q?PGlXpP0wL0RdPcy9V04uRB39jrdHhzmumIeSKbDEUBGCAL290S7hOBrM7AOY?=
 =?us-ascii?Q?UcW/dF8dKni9HBHzH9LxodGHyYzKyNaSibQ45LHw+1Fw/+LCcZysdQXDnNG2?=
 =?us-ascii?Q?LFiEbXzKUqXnSbKRieBBZ/8mGPZjMoKhmFhEpFqtAAyB0A5gpR1vYw5lBCcz?=
 =?us-ascii?Q?lak+09Pq7WzqPh19Im94RPcGpTaT+ePXiUbJ5/kW0RQfkRYOhdVGlzAHjwgq?=
 =?us-ascii?Q?f8gPdBHHiRo30ioQQkyZYEyWCuJ+71NrnBeDXp2DGGXOoijoH1SnBdzZLFaK?=
 =?us-ascii?Q?PZanboyppQQY0B3gr857lqMi8eBMseKCKGT753eFLaRRau59nn/SS7d5rkmN?=
 =?us-ascii?Q?I+eF6wdIPw3w7+2qSz9fXg9a5624C5lEWqCZqpiq/M3UeJTtRf9UQHzu3wyT?=
 =?us-ascii?Q?/V6i1Tj663UEzsXh0aSMTPzqmyr6ZZJA+eLiZfUVA+yVd7mzphC1T77yIYTP?=
 =?us-ascii?Q?1BUyp87d8anzJWVQzd6ThdSZAcVAJ9XvWYRlFWXVWZHc0yqnBe+v1KN5EDzN?=
 =?us-ascii?Q?JquRa9ahOcerO3Z7nP5QFC/zVww+7urkPvqM++9WJATFv7ipSkQirchnNLtX?=
 =?us-ascii?Q?B0++wcQk2zIBcsyMtezH6nilHU33jJ37kLUsjwHPIXfPOKyrQQy7opcti7vk?=
 =?us-ascii?Q?0cUoOBYWh0Qdj/w0ArSdOqA0QjkaDWAp9UqNja7a8bN2Nrc0QVv6ww2HBDiF?=
 =?us-ascii?Q?EcP4NmvEKd8saYX6g1iArY5M6w02yY5bLTM4KY3o7WD9ED2vpZrgNuuiiAzx?=
 =?us-ascii?Q?9fMjlCSrn3peAiFRq8u3cjcdoEir4R2Ug0v6uePpsDur/NHgBgUAjQX7oyCW?=
 =?us-ascii?Q?SfZnzvgqC0PEIo77Q4Oya1KMwoP0FWzzuNNkndp6Nw1AgJvsa2fgsd9iZSLS?=
 =?us-ascii?Q?31noCiGeOi7Qmx7BvCn6G2d3EohCDcV4yjb2z+PHEd7YGLe7i7cnViswia2k?=
 =?us-ascii?Q?e8qHsFCunV9OjEEzWqq4WaZkuEt4yfU1FrO9nqI0/l4gFngBRDsHNv+Ov6XC?=
 =?us-ascii?Q?MeMV1pZ1iR9o6Y9cf2FA7FOl8vKI8tQHVY46BeSa1mTm7O/Y8XUncdQgU5p8?=
 =?us-ascii?Q?r/oOIaliN0nAmUUy62cq+RsH+B5vRRbIhEmaQ2HvrhMBfjKiLeVTqzYVOcXW?=
 =?us-ascii?Q?OqsSDEzdkAEG3EKGE4nlH7iCtKFoK0SC4gxx/lyikIu2gO6We+wLzpqJs0ae?=
 =?us-ascii?Q?fH90bQ+sjkB89GpX0438ntefSgMgeNLnq0ZNAQpXNRNZ+NGXDtbVmi2mk9gF?=
 =?us-ascii?Q?m4+kcoEMUolUWeYwh1G75bMGRWHUZzFAYrik61sYOLmXoaCvoH2wzdE7DmFj?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cbe577-b088-442a-b2b8-08dcabfc256c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 16:17:42.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6fvigv50iZRTLhedBRvQgv2LYDvZHDiiBqQzKYMzV4AdGsJBymI9Yjny1IILGnSm3/2ljPEmwyYA0jEYbZYGbnVEjoIMwHALxYsrFKGydo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

On Tue, Jul 23, 2024 at 02:58:51PM GMT, Ghimiray, Himal Prasad wrote:
>
>
>On 22-07-2024 21:36, Lucas De Marchi wrote:
>>It's not always safe to call XE_WA() in the driver initialization. Add a
>>xe_gt_assert() so this doesn't go unnoticed.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>
>>v2:
>>   - Fix kernel-doc (Tejas)
>>   - Remove needless initialization (Tejas)
>>
>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>>  drivers/gpu/drm/xe/xe_wa.c       | 1 +
>>  drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
>>  3 files changed, 13 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index ef68c4a92972..4dd01adf63c6 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -389,6 +389,12 @@ struct xe_gt {
>>  		unsigned long *lrc;
>>  		/** @wa_active.oob: bitmap with active OOB workaroudns */
>
>Since you're here, please attend the existing typo in kernel-doc.
>s/workaroudns/workarounds

thanks, updated the comment and pushed to drm-xe-next.

Lucas De Marchi

>
>
>>  		unsigned long *oob;
>>+		/**
>>+		 * @wa_active.oob_initialized: mark oob as initialized to help
>>+		 * detecting misuse of XE_WA() - it can only be called on
>>+		 * initialization after OOB WAs have being processed
>>+		 */
>>+		bool oob_initialized;
>>  	} wa_active;
>>  	/** @user_engines: engines present in GT and available to userspace */
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index fd009b2c68fa..564e32e44e3b 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>>  						  ARRAY_SIZE(oob_was));
>>+	gt->wa_active.oob_initialized = true;
>>  	xe_rtp_process(&ctx, oob_was);
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>>index db9ddeaf69bf..52337405b5bc 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.h
>>+++ b/drivers/gpu/drm/xe/xe_wa.h
>>@@ -6,6 +6,8 @@
>>  #ifndef _XE_WA_
>>  #define _XE_WA_
>>+#include "xe_assert.h"
>>+
>>  struct drm_printer;
>>  struct xe_gt;
>>  struct xe_hw_engine;
>>@@ -25,6 +27,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>>   * @gt__: gt instance
>>   * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>>   */
>>-#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
>>+#define XE_WA(gt__, id__) ({						\
>>+	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
>>+	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
>>+})
>>  #endif
