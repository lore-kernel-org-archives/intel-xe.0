Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82147C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 23:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFEC10E054;
	Fri, 25 Jul 2025 23:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu4HeDyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D210E054
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753485169; x=1785021169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zJ46cJxf4IfpkALmyJeL6YxSxf4taJzfAWUIR3i/DIc=;
 b=Qu4HeDyNPjx3G8qOmUvUepj4cnvZNRnTfX4F8oVqVy17q1DkiHyzq8ga
 2lUEffrAbI0XcWSxmMTFtx0EwSWVMqHkygC0qrqwNtAKx6IOpq5LNBddN
 SaZqSePBVKg8/k4mDaORyBSadhCdiD7s37kw0IUC9+I683O52/lUI4plC
 OHTvYZaYQBF/FFlNo7axANE2IYm0p9L77fU9yRerCyoj7UjqC5Ky1toHj
 7x2noz5gz3ekSu4QDv0DeSCPIeAIcOrZoOdwFc6KLKQBtp7x2/wSV4kPy
 OkS6iK+FnEq75fpjcfCPiIuzT/5sCws5HLKdSY3cXZZKkJvo3OyFD6iDJ A==;
X-CSE-ConnectionGUID: PeCyrhlfQzuKRRAS0F0SXQ==
X-CSE-MsgGUID: +p2Xf2VQTdOy0s4PHylopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="73408258"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="73408258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 16:12:48 -0700
X-CSE-ConnectionGUID: ytfBXeJ+Qui/MUBPWwjxlQ==
X-CSE-MsgGUID: JbHeWp4dRJG2Fn7vGq6oTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165346050"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 16:12:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 16:12:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 16:12:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 16:12:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2fK2iBMV4aZ026YxLaRk4OClCp5vqPIuThsPK5l1aP5lHneT6eKbDIkDbvLBAHSzT7UYHZ/uQ9oHl0yiL+hpjTSyCl/Cug72leiDPcb1KtW1rx2XonFC8T3PprHwuVFuQd8Q5kqx7l6bup0qfqe+s7QmAUDg1gpjXJI7a+E3vTARfAzSB3gUud1WGZeqSj/pIyDaOw38Ib+/kaopjONak+bnOkYIg4rPX4CXoKCfqHM5Il8YkkSxDEuHOAB2cy6brx7SxJaFuhjsxrYtbcNHEvO3Hjm5IVVT+X+xno5wICgJ34l30NcXZnM/Q2cpTxtwjWvzdaJ+3eEt4ZL7XreIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odyIh77xwJopD2R9+JcCNnP+LM7V0XWQ0ctb/dNUHvE=;
 b=fQUPUETkiWae3qfNUcIjHfrlS4qVG267ZSNqn3OGaYyhdC3BdEnSDiU+ql+mcfOUMyc54W9eShI70y699dZz5XkKcdPBGkqG1si0AcK2cphIxURy0g2scRF169zi+SAKulglXzNGOF5UP67mNzAGGe9SZiVC1cZHRS8MPMtPh6gz1J3wjNLSay0g9FvinOLfeDFWtcKXq1JKP/UJPQKbbZ+QUDYuaSMhYmmEVx4MHLRSt1If1IuaUi7Dmh9c28nuRsY3N1ssI3YyhT1S4jURb5ZxFJek8VpHEu2iOq3ApR4q+ZL8NCOFmJy/PU5h/vThNoxLQ4obdxdS/oFLvYYehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 23:12:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 23:12:29 +0000
Date: Fri, 25 Jul 2025 16:14:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe/svm: Migrate folios when possible
Message-ID: <aIQPyTnoaPEIA6zI@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2844e5-3c74-4e4a-b8b9-08ddcbd0ba13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a952Z3nTcQ5WPs76rrJnZMQlyDQT8tJ6d0Agb5AJSpRHam07+fQKFMV3CHVh?=
 =?us-ascii?Q?JvvG3CzEbz5phl8annDnCOy0INtq36Wk1pwCaOwJK2mw1pSdBRGSOdj2RvZm?=
 =?us-ascii?Q?crC3BmGAilnFqTFqmQTHaNZeQlO36ywmFsrdG29GbEbYW0nNbdyK7UT2tI9/?=
 =?us-ascii?Q?G40fpdATycLK4Hf2bquzn1SM6y88uUehrFU5SQkeLYnolE0jRemeP/nEm3Xv?=
 =?us-ascii?Q?bs80mwu6tbfX0hHyvNd34NJjCSJL+VlTlWI75ZNGmN1OjKmDl3rnLWMRJ3yj?=
 =?us-ascii?Q?kLqqGsncgndXnqwK5WgVeDGW5l3Y3cZtYaXb3CKN6c7XccdccGTIJk4dTZQg?=
 =?us-ascii?Q?7N9oqtjXnV6ZMiSEcP33wBwbkCcPW6Q8I6ndQvsomGHrHSUNb+D+8+lxO4Gg?=
 =?us-ascii?Q?KWhV594w0rniC4bmOo2t/+M7DEUoq251wvQCEkonfNE7d6bwqHHQOt/4Sc16?=
 =?us-ascii?Q?ETqqLFQABwIjlt/CYiK3TYAnQ1RE+H+p/5O69+559MX4WpnWeT+e9UjKoP8O?=
 =?us-ascii?Q?kNidykIvUhjne7crfle54tnG9zvzKi7paoanBAMwv9F2q/SQ9Ahh/kAs5t+5?=
 =?us-ascii?Q?Bo6jt2xt8GiLoT4SgvgOTxZn4542vsG7i3wUZO2WeT4my5F2zD9gAgVFb/M8?=
 =?us-ascii?Q?6VR5PNAarL7I+6w3iqnRoHQnSzsl1iqLTPXc2R+ZxArZn8tAIAuTCyMMpxQY?=
 =?us-ascii?Q?wwZSPNUgQ+7GeGdsvk3m5gEh++/3u8uevoZpNflgYwFE0hcKIkjRH7Uz58Ub?=
 =?us-ascii?Q?DmbuomeIdU9/AxBVAPrfcXsHuDxpfuKfCl+7obdRK1648MEF1FJ9lEr90u2F?=
 =?us-ascii?Q?Kc0XzDAZyXHGGzq9tv3loibJktguvOaTJ4YBZKCzV61YZVexMAjMh72Y/0Ui?=
 =?us-ascii?Q?AYioZYpxsJJcTagFKS2tC31pckId73i/FFTpvF692PwOothQ45hCftOWneI5?=
 =?us-ascii?Q?wpUoFaqvjXWFjz5Ur0/LCXzm9KIuLj5WA9bcW3d8HLC+3ST8ySdoD0X7F4Gb?=
 =?us-ascii?Q?qSwy4AHPNEo4xjzsb6Zf1MeH0HDm0pqOi7MZmGg7zp49c+xmc/Wd3xtncV0w?=
 =?us-ascii?Q?Cdf3Hudas9r1ess0vMzuk7lU/yBDym5sNthveXurSV7PdE+Znaval14O2FYq?=
 =?us-ascii?Q?SWfaGtcALLUhL0FCxcXJiQxHlpy/9dqsLXqUI6wfpIGhP+2vU/30Ozqqh/ZD?=
 =?us-ascii?Q?S0T3Afgnxwpa+bKjvlr5yl45vhTHab6WwecFYDBmtpxcHGXgjm4Cyq6CYz0y?=
 =?us-ascii?Q?2RiIjxhwj+VwNCXk8/hDzC2FKqayvgya50XV40jKnLADatPXeyxYlMdDuvi3?=
 =?us-ascii?Q?skAJW6sabYQje6YE8/06FJyZlzCjErvb3tRQCda6OsgRDCIPjjM3VbLHCk1w?=
 =?us-ascii?Q?LeSAmhDzDd3YWUX+boYL/2VLnjT/5qEtG/+qcA8Oa4YoK7J9ASeLX8ZG7ncc?=
 =?us-ascii?Q?LMeh+0yPe4M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TMBQcbndGqX+6jsyrc1VdtjN3cemzYEfJo21VXNs+p+H9OzGsZwIx1Sn2dNl?=
 =?us-ascii?Q?oUu2E+f279yztHPCmEzMTJfvKre5pNjVOYFoVvFp8n0K+4gekNWARXTOAon7?=
 =?us-ascii?Q?dLf2RwRr88YP/8Zp89yjdwZ3pVXXMBU/nKHnzLS063YCxn1hoWtyyY6Fb3QX?=
 =?us-ascii?Q?9vn0qqOD0BUoJMsuWp3WsiyuHEPUIpE2fHeXGoT3g61th88Ye7ExOE75VRsh?=
 =?us-ascii?Q?sCzVU5Ca8UYvul3oYk1QCJAgdc9Co2nDKbPW90o9mqrA5i70MjvIlk9VWNM3?=
 =?us-ascii?Q?lOEYAIgIQioY4G5i3fhTDdCGynxcYX6EEz+WnBqb5HObUth0CJwF2Tip4VJX?=
 =?us-ascii?Q?Rf4hVTCUQESQ1DEV1svZNtMdI8Jj6JDaVjIB9tIopSDYFBgwCvDD2hGSHp0r?=
 =?us-ascii?Q?Gpey/6K4GRqKkGtB8O2/V1oFLrJRfn4KRnSI7dpIWda0ILYFe00dbYs7W/p9?=
 =?us-ascii?Q?oniAyDstYX6n2X3cAwnEIMr54qAXYAupoVJ/04AgkOhbwEFnakRN5jg5H+BZ?=
 =?us-ascii?Q?biaiWcVhgzbsp5pBSQKVBF5s56wOPEXSGH0nRHr4zVfK4H7B4p0VifFzA+J4?=
 =?us-ascii?Q?+Nyi8iryqkgwrEtPIsd0Q9d+QakAoSorkmyh4WwTT6SFrCMYAdAqjxQarAY7?=
 =?us-ascii?Q?tnrz9K048N8a7X0lbRvjYX5zk9nySvdo+mzXZyCgtbrYfFAPZHssY//Qf6C5?=
 =?us-ascii?Q?Lo7neTMc/xpM+cEb9GBJ2vSzXNEhgSn2wNJd4CN/kjMDXLBagomT7P09ojsh?=
 =?us-ascii?Q?TC65GiuaBAGEaIEYiY0hbxkMw38czGp4Ok28J/iAClGZRoSMiNsa1zaPyB6O?=
 =?us-ascii?Q?q/wpVYqDCoSZBb452WslX+xDO9JGN1XmgPfnioyA2I9+nPfmATt5d1Z1o0or?=
 =?us-ascii?Q?caCZatoMUMOAGZTNBLFYYSdgENqycn0S/aE2RSDFaMXMI9zJ/wPXdEBDfMfR?=
 =?us-ascii?Q?eryXONJQ3cMbgwFmZYKQnMyyByeLv/hV20XpO3UTjsQ1oCp3bO3pkDEdhh3H?=
 =?us-ascii?Q?u2s37BLH6PO9CDK13d1LfJBROUFJyMt7Y7m/TVtVZFh2qwnb4bG9ZtNk4PGw?=
 =?us-ascii?Q?MZbpcRTEyxRtNTuzDp/a+yg9fcUfNXCD+tgA0sz7ExMdzhH+D7b2XKMK29ka?=
 =?us-ascii?Q?QgenSCxtBFRJYgkz5ZD54QMgZ9z79136MNpvf8X0OFctzywMg/3IF4jjggLQ?=
 =?us-ascii?Q?cw0EI5pzSKeV5jY4tHouzrde94ICpYDEF3ahNeVYIgOC5+Wak7cnn+1UFWwR?=
 =?us-ascii?Q?t5EifMNMXd/ZHAiH75DqJWrAJffurPEpzqnVBf4sbjfzOnEmbqMI82Zj1k4F?=
 =?us-ascii?Q?p9CyjhvjhbmQdI8pUhoTgpDjcLSHi8u1QN6ktje8dt302TrF1PpS0G6PPQxk?=
 =?us-ascii?Q?MSxStzrp7LZplhJS6lkm5GRNAiMwTAjCsrYcUcYJw95XqI31halPnXeKGyco?=
 =?us-ascii?Q?T42dIbnJoL2GU9f3Kbh6yb1LAZEkID3057v7KUXfNFuQ/xbm7hqMXeWda/cS?=
 =?us-ascii?Q?tVuIbsi7oYnOlxpCnVqRlw+xzz1kzTkukQ6gNEAY8FSdHG1PDZFHHuhZj1Gr?=
 =?us-ascii?Q?fvS/1g/0hYTTHcq0qoBrk1OiizFgzOje7Z/taS7LjzLQkytl5vwnSpu/UW1L?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2844e5-3c74-4e4a-b8b9-08ddcbd0ba13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:12:29.3324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1dLZbAg3TTXZESnTH9EPYlXLzcJGO+iuQ+99uOfq09vpKrtmN3Px23fHGFQNPeMSk2rYU/VG4VBqdpbt6lM2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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

On Fri, Jul 25, 2025 at 05:39:30PM +0200, Francois Dugast wrote:
> The DMA mapping can now correspond to a folio (order > 0), so move the
> iterator by the number of pages in the folio in order to migrate all
> pages at once. This will improve efficiency compared to migrating pages
> one by one.
> 
> For this to work, the BOs must be contiguous in memory.
> 

I'd mention since SVM BOs are a max of 2M and it is very unlikely
forcing to continuous has any negative affects (e.g., extra eviction),
it greatly simplifies the code, and 2M contiguous memory will enable 2M
device pages which is huge perf win.

We might need a small adjustment to populate_devmem_pfn to communicate
contigous memory was found to drm_pagemap too as our driver can easily
allocate contiguous memory, but we shouldn't assume other drivers can
do so. This can be done in follow up which adds the 2M device page
support.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c  | 2 ++
>  drivers/gpu/drm/xe/xe_svm.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ffca1cea5585..59994a978a8c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
>  	else if (bo_flags & XE_BO_FLAG_PINNED &&
>  		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
>  		return true; /* needs vmap */
> +	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
> +		return true;
>  
>  	/*
>  	 * For eviction / restore on suspend / resume objects pinned in VRAM
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 1d097e76aabc..2759db5f7407 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -382,6 +382,11 @@ static int xe_svm_copy(struct page **pages,
>  				pos = i;
>  			}
>  
> +			if (pagemap_addr[i].order) {
> +				i += NR_PAGES(pagemap_addr[i].order);

I think this needs to be NR_PAGES(pagemap_addr[i].order) - 1, right?

> +				last = (i + 1) == npages;

Then set the chunk here too?

> +			}
> +
>  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;

I think the match can be dropped actually and just assume it is true if
we are allocating continuous memory now.

Matt

>  		}
>  
> -- 
> 2.43.0
> 
