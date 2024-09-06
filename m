Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD6CE7AA8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 03:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F84E10E96B;
	Fri,  6 Sep 2024 03:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyRlzBQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3B10E96B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 03:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725593587; x=1757129587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0lf2iJK/6Q3UlBLaUFJAwgx4WpY7+0xqQGVdgUh6ZVw=;
 b=gyRlzBQ4UuSf3Zz00+2QGUj1oHd9z37aMeqagxqhsST++XacaTicUa5H
 +ofdMihd8WYS2pom9CdOZGdTkQ0N+cjCJ3+Ew+3rZwsGpg5/GxBFne4XP
 OpXIY37/jncRhAPkC4i4URdVVfPLmc1f8ClnEtKoJrzqP/SRERji3j0yd
 W2pqelkq0uMnrSbFSrdECxiAxDVdSJbAG4T567Q/fG0uOsBt2Zryrt25u
 eTLxMxIT2Q9Mj84GEbyNAyoq5fvJlDyi7qCtu2nlbiTf9Yv5axdKSdsIk
 yHrBsQ9OQxKzLH8J7hcmafkb0E6Es7dwjomz2tk0O8PbEPAnkEB9uUU3Y A==;
X-CSE-ConnectionGUID: XbMkM5EiTDCOtOMYhnIrYg==
X-CSE-MsgGUID: 69zpVvw1RJyKvHRTbn4Iig==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24537793"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="24537793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:33:06 -0700
X-CSE-ConnectionGUID: Y3OYNJvhTkyohtyyqQGgcQ==
X-CSE-MsgGUID: hEu7ttG0S06ppanW+WeLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="66370865"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 20:33:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:33:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 20:33:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 20:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KszBA0q7+idB3jLJ6Qs7siSm21cNDL88jQ5X9LkaqtLayNpGIaPHu4lIp/2KO9Pq6P16gvlounEv3MPP8wD9KUaEu2pb8MyWO8a9v7VPtB1/XHiB+xOixjBvT6smN9kQ+yllb3zwLYkGzshpxtAg/5Rfz9lJIIxFglksGKREspFeWU+H9vH06JLzog8v782WXplhP73FcZPmGemPippBKhzZ9faG0U5BHm7lbakbGQx4WDLnCMIezm3jUO5Xz0uDJJU/4AMVfbIJdIgPZ29d2DwSKUtrGlSu5s0Is0wmX4ms+9O26CaZd47poCokSD+he3P4piFJ+9FNZVe6ykOjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoZluxroI56quUvaNcssvO1TL5Z0HW1utz5fwqdyC+w=;
 b=HIC4USkb17Jc0KbYBfzhteyRh+8VYCS/Vx0PWPrjvLZOL9oBBIWA9j0U1SuzpwkuTGBifXKuPQZ4cj+6vWYXn/x3dWbsPfs/unRf/iLiIW3mnqM+UUW5p2lMCazyNeEdmAFYInIY4mpfMCT4DuE2wiRsj9M/uCuBN+9KiZHKtU5DO6+fcKLIWU/VpUPtrpusPWX1GMC6XVqSe9+Q9d+/H5zh6S751M4wrjDrCyEUtp8mG6XcFENl2RzeP4xmWFtLXi0eSqtfOkUkBgnAcZS7Qa3mFCLLPF2Gm23eVb0RPlMmt3XGVMIw/tAgDZ5/T2MzY3jgMiKRjU/qvm3F5rmfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 03:32:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 03:32:57 +0000
Date: Thu, 5 Sep 2024 22:32:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/43] drm/xe: Adjust mmio code to pass VF substructure
 to SRIOV code
Message-ID: <r5oyelbh2b7l5kcu7kbzskr2tqoeq5dbqbkflfmnvfkimjihgc@abjfkavoyaq7>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-53-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-53-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0168.namprd04.prod.outlook.com
 (2603:10b6:303:85::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: ba849325-5678-41da-1aba-08dcce2499f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLFKnp2iL+Nv0ifG6YrT9WpEO7l3Tj6uMeV9u7e1ggId+9UM3YaYcQJVzSqe?=
 =?us-ascii?Q?s4EzaXY0QGf+QURYITxG+I4G62L5DwDEKvy7xHCvf14beTj1ficZxAYg9o1u?=
 =?us-ascii?Q?H/uXQhng+UrEB29XT01mQuHfJ45pW4tm2WrmlvQXpBC0p1tslKmd4fRtZF84?=
 =?us-ascii?Q?H1Jf5p69uyifHFfiVimwxIyRc1Mz7ASJxxAW4DevfWIV2XTAcX6VOL7V1/OA?=
 =?us-ascii?Q?2qkYs74BpWPejDXIz4B7/Oxx6PBUvA4BHy8dnUpPvUGedUd9iQ+xwVCbG/ub?=
 =?us-ascii?Q?MNwqnXZYSyuSvUhRpoTiyx3WS4FQmlcVtHg2WBeaYn72xWkHycoUhEaR6WcP?=
 =?us-ascii?Q?DIiAvaOj9jkrdLNJ5WTV8AqJGOKTyXxMoDy8IUFMU4zH7sAepClnUkP3HyT6?=
 =?us-ascii?Q?ODFlhWx7GT6lNd/3/rEi5wA4tlQWSo3T/u4x3DZxsZLg/eXk9lMPFys7WSDP?=
 =?us-ascii?Q?4S+a9N0vnteWfAfOInvcWAli8NKU819ucuFfW+Kme2ZUkZSLkWWeNRDu9vPQ?=
 =?us-ascii?Q?l/lycUqi22LozPpaZVpRjS3mnUaY/H9IovAalyEUVwocXFtEI7d+C96IM27h?=
 =?us-ascii?Q?u6x5hT1MC5jh3lj1edUVDpQ2mpoCf4GLPqXgHyzX4xT/abl8oHRGbYEiMW+L?=
 =?us-ascii?Q?y24xG4qNobH3Zur4Lwl+33j+NxV1KgHDkd9hhpMk4bg8fDPvr4vjmAK1yOHs?=
 =?us-ascii?Q?uaV0/OD0UD5rQMvoTwRD/h1ckRmsxWXWeUm6P4pgIVPbHX2OtTIcO/6gau0k?=
 =?us-ascii?Q?g+5Ff4ai3wkDkZ8jwfZ1LjvOCdvrRwU0ddoWOKMRs8y1BJ1uVF24DuqkDV0i?=
 =?us-ascii?Q?/X6Sfuv14P5LJIsj5wQsGEHJilhhsSjhEz2EAlptpuNMn9wtojxrgNbwZib5?=
 =?us-ascii?Q?fgO1wrcPPLIorfnmfw3PBydP1jOF8c0aw8GrDHn7MZM/DMrcOT3zB1SPWglE?=
 =?us-ascii?Q?8oCJbrGzYnQ3zOIupvD+/zPzW8vXjq0TdkLntu//jNR+zfelInGyKwS8z0CZ?=
 =?us-ascii?Q?5XSlmUUM1DlRyH6560wU+2tRYEKjoenKabSyZr9Qp1Yv997Fj7hr8VFSv9tc?=
 =?us-ascii?Q?WlNn0kaBjiYo12dom1ytfdUCOB3DO7W8rVXg7v5NspiaGYFtQYf/AiyL9QnF?=
 =?us-ascii?Q?2UrFd94lrgIgCUN6s+XyobHgJAxd86PoaVrh1R/OhoXmAhpsY6m4I4KhoLeK?=
 =?us-ascii?Q?VUzZYRjvucDkvXMSvzzMuVKvKWPHfEaCvK3p/EZWZLgk6LEBw6r0sxUfM10e?=
 =?us-ascii?Q?bUe5c6ts14ha7AkzSAxPH9sA343KTIY+AsOnlkjU9qLAdzSAAcisPU6naFAD?=
 =?us-ascii?Q?S/c+qGNHsnY1UusQWpbXSKh7zmrr+fUefAxAwJabN/De1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//r1K/yLf/KPoph6LzoIiqrBkr7qktKDfET4I1fsY7g5A8LgkKoxuvit9Pj4?=
 =?us-ascii?Q?8TvydjujRqkYGRJejIKyg2vJZ1LQHxjEZ4agGJOetRSQY0imX929lh7eGWsH?=
 =?us-ascii?Q?Z+l9U7PyI7NG554sebp6jzyJ7CKFBPzU50lXKz98eZXRatzx/rlNV0tssMFD?=
 =?us-ascii?Q?xDCOD6c2Ob1hPjuCRqOmnfXye0ntpwnpF2eU7WCaoO4NF/VjRhrojM8IOMv4?=
 =?us-ascii?Q?yC8/+sF0wn9QWMvgoOHyQnxGEeOdyUxd5O9oMnwsRNd+QTgC0yDOyrStA0Sy?=
 =?us-ascii?Q?7BNs1ucznkQ6DN2k8ZF5yZ0s35E42LqA9JmZb31dC8hH+V94D8aBHGgEGgpz?=
 =?us-ascii?Q?cvMw7CD5iZwGFtpCeRNfea2Ke9+NSR3bjwwbfPw56yHORObHoaBKIqaGX31L?=
 =?us-ascii?Q?tR21uLOOxUsvGJGRLuseFGAAroV591AwuXOhzEl5efcKU6tG10a+8iMELgyd?=
 =?us-ascii?Q?VVGYiPogjapI3dJ4fEQMTtAtT4/25xiJpoxuwbG8q0zEafvAv/91knZj7DEW?=
 =?us-ascii?Q?wbJmb4tlZ9SwpIafZFI079YFJsq3VKpIT1vIkd92ipNhZPzwfk+EXg6I9tWR?=
 =?us-ascii?Q?iYs7W74YP5PFQN1esvvMnv2Q9yXh9bNrmK5UPYl20YVWprN8ZsfACgDj2vWB?=
 =?us-ascii?Q?WT7QD7L3ezkp5SgNK69jMrLYeAtqxkLeGV3ScRESEbtDuPbKA/1gcxmjPLzg?=
 =?us-ascii?Q?yqqqX62Tp1VtocPvLnBfwq1UKPi1C13bsIebL4nNuP+lTThKtGqnoos4SGdn?=
 =?us-ascii?Q?SsX5m5+rtn0k/xIjB/4CSodIqyhqEq4OrVLXTyU0cEGlBMsOein038qzUWGk?=
 =?us-ascii?Q?OUG9xu1NrUN4RGodr+5OqEv5U+Flxo2xFysgj8jQ3uWVZTtupTutxxSJMxpZ?=
 =?us-ascii?Q?APYttrzvQSrcm/lDxEnp2vHfgjQmGi5+XwFioS/wu+Q+vEB5PRZTMY60WbYP?=
 =?us-ascii?Q?6eCGQUyobDzM2B7yZbr2pMSGQQQC4pqNWb6jjIqK1PTN2a/5bMjrmHn/jZpI?=
 =?us-ascii?Q?gMIWUIUPXM7IHDVbKuSTajtkG4XAQBGsRD3o5tRFRjbMYja8cKw45ksqDlSq?=
 =?us-ascii?Q?FNQhb/s2k4CHjkFMOIGK3ITehLGadXh9uL6qSTrwTjgmYFUvVHf2VsQrryOc?=
 =?us-ascii?Q?IbYwue0q0Q+Izp8J/w4U8wu+DX1bb7vrxI/RcvS/tEa68ops0ZJ7pJud+4Fr?=
 =?us-ascii?Q?ed3u5zjF+YQ8Syz+SE1ahacSeDxJjhIkgUB0cPNl64qJ7KF3pY/bvf9a63BQ?=
 =?us-ascii?Q?nh03cFzEFyWXgU6pJSAA3mhEaQA/9B8s/38qKKfE30bs0/jOBZqVGpd/76BC?=
 =?us-ascii?Q?xru5h6yPKwdzdco5zjlwc9FrVxU/d/H76no7F4PFKBR9/OrN1h2hSMiVPdOu?=
 =?us-ascii?Q?sbRYR6Uqfw729d+RIRwH93JtIgLbDLAlGqmMv6aiRucGWx5Ztnwtd6KtpkXd?=
 =?us-ascii?Q?LQD1rTELZ76FJg87SSYkvYhvp9JaAAL8LIh8uzPUX4F1MjgNvi2VsRAuE6Ol?=
 =?us-ascii?Q?v3Avs9eTyxSLyHRIcsLK0KdSzI8NuJRPPk1VPNsYgA5Fkw4iJoOvxJCdD0yI?=
 =?us-ascii?Q?RBXSpegfISPslATen1BclIQt4fa24oyN3gIkvFsguQfhfb32WgNSYKj5eQFw?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba849325-5678-41da-1aba-08dcce2499f2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:32:57.8822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2kDFgihTmptFDyoAq97RyO/JgkBatsJmpi0gvO6bi5kiprzXdUbaq7+Lt5pQrRq7ggKqltRV0wPP4jVjlCvBQ36qHcvRAXMvFqIm0jHMSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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

On Tue, Sep 03, 2024 at 05:21:09PM GMT, Matt Roper wrote:
>Although we want to break the GT-centric nature of the MMIO code in the
>general driver, the SRIOV handling still relies on data in a VF
>substructure of the GT.  Pass this substructure, rather than the GT
>itself, to the SRIOV code called from the MMIO operations.  Most of what
>the SRIOV code needs is within this substructure, and container_of() can
>be used to get back to the GT itself if necessary.
>Also store a backpointer to this structure within the xe_mmio in
>preparation for removal of xe_gt from the MMIO interface.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 3 +++
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 6 ++++--
> drivers/gpu/drm/xe/xe_gt_sriov_vf.h  | 5 +++--
> drivers/gpu/drm/xe/xe_mmio.c         | 4 ++--
> drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
> 5 files changed, 17 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 19c21e55e153..15a371f81c60 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -121,6 +121,9 @@ struct xe_mmio {
> 	/** @regs: Map used to access registers. */
> 	void __iomem *regs;
>
>+	/** @sriov_vf: For GT regions, backpointer to SRIOV VF structure */
>+	struct xe_gt_sriov_vf *sriov_vf;
>+
> 	/**
> 	 * @map_size: Length of the register region within the map.
> 	 *
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 4ebc82e607af..2c61882ea411 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -879,8 +879,9 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
>  *
>  * Return: register value obtained from the PF or 0 if not found.
>  */
>-u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>+u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
> {
>+	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> 	struct vf_runtime_reg *rr;
>
>@@ -915,8 +916,9 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  * This function is for VF use only.
>  * Currently it will trigger a WARN if running on debug build.
>  */
>-void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>+void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val)
> {
>+	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
> 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>
> 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>index e541ce57bec2..0437c937f5b0 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>@@ -10,6 +10,7 @@
>
> struct drm_printer;
> struct xe_gt;
>+struct xe_gt_sriov_vf;
> struct xe_reg;
>
> int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>@@ -21,8 +22,8 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>-u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>-void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>+u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg);
>+void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val);
>
> void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index dd2076b9003e..8068663e7d28 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -239,7 +239,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> 	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>
> 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-		xe_gt_sriov_vf_write32(gt, reg, val);
>+		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
> 	else
> 		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> }
>@@ -254,7 +254,7 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> 	mmio_flush_pending_writes(gt);
>
> 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-		val = xe_gt_sriov_vf_read32(gt, reg);
>+		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
> 	else
> 		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index e222539022d5..04d34fd015ce 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -715,6 +715,9 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->mmio.regs = tile->mmio.regs;
> 		gt->mmio.regs_length = tile->mmio.regs_length;
> 		gt->mmio.xe = xe;
>+		if (IS_SRIOV_VF(xe))

I was in doubt we could actually check for SR-IOV in here, but we can as
xe_sriov_probe_early() is called earlier and anyway we protect the read
for the mode. Also for our fake dev in kunit it's also fine as it sets
the mode before the call to xe_info_init()

Cc Michal


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi



>+			gt->mmio.sriov_vf = &gt->sriov.vf;
>+
> 		if (MEDIA_VER(xe) < 13 && media_desc)
> 			gt->info.engine_mask |= media_desc->hw_engine_mask;
>
>@@ -738,6 +741,8 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> 		gt->mmio.xe = xe;
>+		if (IS_SRIOV_VF(xe))
>+			gt->mmio.sriov_vf = &gt->sriov.vf;
>
> 		/*
> 		 * FIXME: At the moment multi-tile and standalone media are
>-- 
>2.45.2
>
