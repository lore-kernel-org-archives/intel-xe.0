Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D10AC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33910EB38;
	Thu, 11 Jul 2024 17:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7QTRQp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AED10EB37
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720719930; x=1752255930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7TXXSIHF2J+D0nECnOcgUq3Ff/g5ovrx7aG1tPHdxY0=;
 b=V7QTRQp0eoKwAjlgPCz3itzzqFlBBXdY3DG7xjRQG9tw8Y5+GQ9Xo9eG
 xeM1Qgp7Y3uY5qDAcLc3t8rzDR5C+tHbjmsXpV3NUm558GafXpodPcIjq
 rW/zfRFLT7tT60V901yHOPobw/1iQJI/+ZVyPt4XbsoKT7jm0vbul0uzP
 4b249j9UuyeXCE7b9S4YsPim5CrT0h9HV8aOfCkN9+DPDTNFRv/qOyVrJ
 QnXXU2Z9q/Rwczht2Oa70SePiMf8mw1Z6V23pUeHR+MbLPq4SLHE7mEpL
 42NSKfckJnC1EJR/V/jzKUv3axucKcuygY5vtdtbJFApLBUhEnRfAkkj/ w==;
X-CSE-ConnectionGUID: mlx9x0zuTUeq6bnGUlWy+A==
X-CSE-MsgGUID: qDDs7AFfRW23j/cNrriLAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28795371"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="28795371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:45:30 -0700
X-CSE-ConnectionGUID: UeW0l2sTSRemEBJOkzNtNA==
X-CSE-MsgGUID: fE4bSjIOTpeY4iLCmgHfgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48710475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:45:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:45:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:45:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBTIt6v4SFo6DYy9gM+TuEI4FjMtmMGFFvsCFCeXFpB7G9uHEbkKUTDAOfZEWgqG2gE0dACqL5s0PLQ0RWC3qLcCrK0Ar8X+0o3PhIkRz6ZOJNa8L/QTwC/osNm6O1n1GOvyKq2xtohIXKs/uccQOrc/9fMgzdULz2vHHiFJIwkdAN+YABjAniqIvBhuVpA2gIeEOexuY0LIPn6YAtix/1AQ04hKE1grE1FCR+RwHmgWFvKzNJQDWFL1Sc5lL2XNmSjT4Vn0kJEVti3+MX2wYv+HQfPf1B8EP6hRPWdl1zk8i1HIyBkVAn+BsclauYqsxo7H3iLTxrL6jVgQ00d4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhYZGbeEQWc2RfGQDNAL9aGQQ+thYqLUQNSJz40/FHU=;
 b=bAkKd55yjfzWomR3AjNjWJOVKWe9V+1jUE8rcvXiXwq0tMiodjh0ylsA9WswNgerEK066DxWSlHoBb4m4p68bT1/lXV0QRvimlSKCRJsAz/ZsE6O8cm8IhyFLfQHVLgIwvqL1sHgVXIHzSWNV+Qbougif4/BT9PA0K+h/rq3qe74iR8uyZ7nZsIaxp93FX73XVUHM2Iifgp2CmP6Pz4jpfQSiKp8uIsbK+Y+60U6k6f+wdY/Z2GY7QdSS/hBxUJTax0I4uDk8rbycFktEnzoXacOoDAyyTlxZvv+88h9s1rFie9qQ6FrTIRVpcSAPeJquXA9acsdvDF0KP432DAizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 17:45:19 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:45:19 +0000
Date: Thu, 11 Jul 2024 13:45:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <ZpAaK5OjjziS3S88@intel.com>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240710220446.2169797-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce6be16-84e2-47dc-5aad-08dca1d13b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XrXCNp81SXCn/o2apNzI0QZePgoJDrxLqXYGHv34mZmsIANV7MZNCPTpp61N?=
 =?us-ascii?Q?7NkY2wl4uvwUOebuyIIeRUSnJwZsRHGjyGmLxNYok8dNApIEUkjhLLrUc+86?=
 =?us-ascii?Q?26elnpLvqZ2IGQAB5MVjF8RjYcbwplwxt/8RKVZSuc6hBdRUhALdi1MgzIwC?=
 =?us-ascii?Q?euHvQh3v6rIH5L2WilKNrez4utMFBu9TPZJTMN2u3BZOpD/2ZLSAFESPsDTe?=
 =?us-ascii?Q?ESj3IQNGAPo9Je1WNIuqxM6hU8iJQ06qHPjPucr9LulfbiCod2TZYPDGnaDs?=
 =?us-ascii?Q?ykQcfJLeU9H3XMJfe06reFNdOzCX/+gchwBc208D8ScpVvlbORJAxIZbV1Z0?=
 =?us-ascii?Q?0FMmxYgZwhnQRmCTzjr32oK3pZo5WxEMyU3uvFlww8CLk0Futgjzlm/Q2JN4?=
 =?us-ascii?Q?a/xG24ORM+PPUgiel9RG/xePpeTAqaNySNrHbx2HK31622Vvvq7t8DWzy3uw?=
 =?us-ascii?Q?77JYlQbGkTbh/PfcWaeS/HTf42WJMuYJ5WJm4p0TLbiCqy5ShV2nNjoGv0GA?=
 =?us-ascii?Q?9CoGRHeGgfwxVC5AVKKDIyeRIy2UOb4cCuHgUM3hwJkHiTdZia+oA+0MTjbC?=
 =?us-ascii?Q?ngaI8ZLTV6YJ+ZG9k4bjjDFMzeu7pSx6D772CF/bRyOXcSSbBVNsOLX+dnI7?=
 =?us-ascii?Q?lvD+Hvh0Yk0nLotCpQq6MwZeeN+dQ0njmBPyv6mkj+5O5cpE5fbYteJuV+z9?=
 =?us-ascii?Q?sREb9GhbR/M2u6ck4T6wTp4PCnLMB1ljb6TPenkKuqPn0reXlRDsqfVQSKNl?=
 =?us-ascii?Q?SU9W86qlAx9ah3mJ+q0hfH+GbWEdcyNR6AsmzI7PGW9sVn8ZFfErHBgpL8t/?=
 =?us-ascii?Q?6omJIwBpH60GDAMcPPu/eiWy7JWkJy+BO1/Bty2xGHEuYLUpwifLyK3md1Zi?=
 =?us-ascii?Q?izN3urQwG9ngtP3sXv/wDUKsXMeJfJuK0roS5PG2sNF2XXXA3fOo/1dhZ7H6?=
 =?us-ascii?Q?ycWYngd26quWoedXTlKMtzcPz0dz4h5fWe5Sk26tQMaE/b12r/gYgaJXdSux?=
 =?us-ascii?Q?9RWsIDslE4vLCTlEI9pT+vYDN+nuWIaQn81PzHivM/I4XTFhyBUJ7vZSjdf+?=
 =?us-ascii?Q?BboH9e/+f1Of0i4KP8zCZR8RaRilIa/6gjX6x4nvcXOry1k4V9vSESTT/uxA?=
 =?us-ascii?Q?ogNw/PzJNq0RU2emzNOX20Tvl0iVCk+Z3Shb++gyXEGMD70PJolWxR35BJ5J?=
 =?us-ascii?Q?LcqWT8Kp+0TNkwgcehe045/sRYXARuhSjXY0CifrdOp+/OuhngF+l7gKVR+y?=
 =?us-ascii?Q?9T+kmG2kb+i5dnb3ci2FM+gvTNEuh6PsmBtICb7ZIsGuqZdqZV5VkMbShZrl?=
 =?us-ascii?Q?lGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqKwqMLepvlqtGNlGbrlY/DxVe6lCJXQ75xdCDG+TgDF4Wfc7Nak1JofXtcg?=
 =?us-ascii?Q?SKrLYOv3nLruv+PDTa5k3vPqhjyz8By8Y4wo5mOAU798pYEi+hgfkD3qVbWt?=
 =?us-ascii?Q?hDPNQu6EOOb3gNqY2zeOkkc7JYxWzh3/iPzbgw6y/7FD5JD6Q/6DUhNCX8fA?=
 =?us-ascii?Q?aT8qDemDgPM+oTojhi+xOUQeu41cSooJiVLJINssw37MpjYHlbTZug+ZsUzF?=
 =?us-ascii?Q?7y70WiOoSQz7qorqpK+T6HEoczhpPojHN4P+rZDHd78BH3JazXHwcN1R4VFN?=
 =?us-ascii?Q?zsc8DiuADU5wYfWRLGTGLUJ1/mcIh7GeKDOuWHF2nwzqB9dGEPYl9QJKIU0X?=
 =?us-ascii?Q?tdm5iAz4L2aosjbw2wH30djkPg1k/EwtbZFoFit9mDlLDOSolHVTo3Lpg86J?=
 =?us-ascii?Q?+WnwBJqmdph/vc82RalmfuAurI25ingMfJBeqhqSj+PSNJnZmdEio6mlIcj7?=
 =?us-ascii?Q?97XegZRY5AK54ECAs09L1H6xqsPCdAR3RAyV9lcE6M5iRQwQMd0jUspihAcQ?=
 =?us-ascii?Q?voKPFWAK67wiTkWM12A58NfeSXQRBk4ERSnVBE7b/odopUjTROBlu22CaZk2?=
 =?us-ascii?Q?vJWzR3sBaegq1ty8sofifaQ3ffmGKn4Bct9Qfa7uBBxvIBNbVDXOwf4XkkCt?=
 =?us-ascii?Q?/bSaxRkpZf+l4ug62jN1BCNdyViErRJAge7/vLV1wZmJpVcETrBCFphbDUWS?=
 =?us-ascii?Q?DWAJXbut69WTjkFoDqIeIgB668i28LURw6Od3KJ8DGXDJ+9miOHQicGkhCWb?=
 =?us-ascii?Q?paL5sDjUrhAWEM0m/37O5b3U4ItFYT61UILfIFqnXtwQtgFTUw7pqtDHvxfG?=
 =?us-ascii?Q?MWgoAjirmZZirWt0Dcl4rP1GU5G6HwLQIHwB0tcdOqPSYXehS15oFG8KDnKr?=
 =?us-ascii?Q?yCNsNdGy/rqh3m03JmHf9G1oyv3qsDWU8Hq1kgPvFL9gaYbCl55IwLWQkA2M?=
 =?us-ascii?Q?K3s2swW7OEAsdRurtDmW6Y582BzMp/Hd9pXTHJYg6xwNUqSxcf57aUjL5Nd+?=
 =?us-ascii?Q?LKEvaGMd2BK5OKn864Kr63yNkUMZK8wMZB/1esZYicFxYJg2jBjkHEEMIdAA?=
 =?us-ascii?Q?pd7Fv8zjeijq0CjzeGUNF9TYOEHqQwG5dfY2gVFo0vrzKtWOppmj+Wsr0MQL?=
 =?us-ascii?Q?c6bAR9DS0YPzmoLi9CjEHUiFcXnsbvNAbw053upDHUNkOzHrom8AxprJYZQh?=
 =?us-ascii?Q?khaMGkjKu2IBjwpiKSPiebm3kuNi4UDChVY2zwJDV27P0+p2JitEgMbdTiVf?=
 =?us-ascii?Q?u4BXvKVkP+LUBpg5P1uA1TgQzd2TkiF0Thm8JBSsaS0/RMGIo7HI5C6LAUwL?=
 =?us-ascii?Q?rZJe5DBZQP8+Z/3jTcvH2PzTY6TQP1jocLIgLdi6hffPf1QAf5SvjNPab/lB?=
 =?us-ascii?Q?U8rXT5ZA5Mcls/9m0BM6vt/aL8tZA3Cd+TQOY6GIfGdTbAPfBS56k+2t78v1?=
 =?us-ascii?Q?LH3pSUOWwyyYMTchHUlxiakTctC4bNvLNah/M6F4IslpkWfQlK070mMk0Ghv?=
 =?us-ascii?Q?EpsNU+DdDf87qxoQ93BJPE3mNjQSUJpPAWwe0Il//TvT/8ots4djxpEluY/V?=
 =?us-ascii?Q?bFmYnLWGEVUxvXmK4zWPyqkbIdyct+LEb7V/lY+d2GFXxrfshnJ2weDxQmGQ?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce6be16-84e2-47dc-5aad-08dca1d13b08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:45:19.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0sQ2BICJgBfes8qQp50wBMEwD04ZFSfnfKT5CjvgOkhM0ntxQG5t08fnRFhf5aAfTMv6J5R1P4ejNldCBfhXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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

On Wed, Jul 10, 2024 at 03:02:27PM -0700, Lucas De Marchi wrote:
> PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
> reporting for PVC the number of 16-wide EUs without giving userspace any
> hint that they were different than for other platforms. Xe2 and later
> also have 16-wide, but in those cases the reported number would
> correspond to the 8-wide count.
> 
> To avoid confusion and make sure the right number is used by userspace
> depending on the platform, add a new item to the topology query and drop
> the one that is not available. The new mask reported for both PVC and
> Xe2 should now match the numbers reported via hwconfig.
> 
> v2: Use a different topo item with EU type in its name to report the
>     new mask instead of adding the type itself as the item (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Tested on LNL to check the behavior in dmesg, debugfs and ioctl.
> Test-with: https://lore.kernel.org/igt-dev/20240710220050.2169596-1-lucas.demarchi@intel.com/
> 
>  drivers/gpu/drm/xe/xe_gt_topology.c | 27 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_types.h    | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_query.c       |  4 +++-
>  include/uapi/drm/xe_drm.h           | 10 +++++++++-
>  4 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 25ff03ab8448..5a1559edf3e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -6,6 +6,7 @@
>  #include "xe_gt_topology.h"
>  
>  #include <linux/bitmap.h>
> +#include <linux/compiler.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> @@ -31,7 +32,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  }
>  
>  static void
> -load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> +load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
> @@ -47,11 +48,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		reg_val = ~reg_val & XELP_EU_MASK;
>  
> -	/* On PVC, one bit = one EU */
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
> +		/* SIMD16 EUs, one bit == one EU */
> +		*eu_type = XE_GT_EU_TYPE_SIMD16;
>  		val = reg_val;
>  	} else {
> -		/* All other platforms, one bit = 2 EU */
> +		/* SIMD8 EUs, one bit == 2 EU */
> +		*eu_type = XE_GT_EU_TYPE_SIMD8;
>  		for (i = 0; i < fls(reg_val); i++)
>  			if (reg_val & BIT(i))
>  				val |= 0x3 << 2 * i;
> @@ -213,7 +216,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
> -	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> @@ -221,6 +224,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	xe_gt_topology_dump(gt, &p);
>  }
>  
> +static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
> +{
> +	switch (eu_type) {
> +	case XE_GT_EU_TYPE_SIMD16:
> +		return "simd16";
> +	case XE_GT_EU_TYPE_SIMD8:
> +		return "simd8";
> +	}
> +
> +	unreachable();
> +}
> +
>  void
>  xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
> @@ -231,6 +246,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
> +	drm_printf(p, "EU type:             %s\n",
> +		   eu_type_to_str(gt->fuse_topo.eu_type));
>  
>  	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>  		   gt->fuse_topo.l3_bank_mask);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6b5e0b45efb0..01ea87d8886b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -27,6 +27,11 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +enum xe_gt_eu_type {
> +	XE_GT_EU_TYPE_SIMD8,
> +	XE_GT_EU_TYPE_SIMD16,
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS		3
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
> @@ -343,6 +348,12 @@ struct xe_gt {
>  
>  		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>  		xe_l3_bank_mask_t l3_bank_mask;
> +
> +		/**
> +		 * @fuse_tipo.eu_type: type/width of EU stored in
> +		 * fuse_topo.eu_mask_per_dss
> +		 */
> +		enum xe_gt_eu_type eu_type;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4e01df6b1b7a..73ef6e4c2dc9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -518,7 +518,9 @@ static int query_gt_topology(struct xe_device *xe,
>  		if (err)
>  			return err;
>  
> -		topo.type = DRM_XE_TOPO_EU_PER_DSS;
> +		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
> +			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
> +			DRM_XE_TOPO_EU_PER_DSS;

have you considered setting both for backward compatibility?
And then highlighting in the documentation this duplication in the case
of simd16 and that that should be checked first?!

>  		err = copy_mask(&query_ptr, &topo,
>  				gt->fuse_topo.eu_mask_per_dss,
>  				sizeof(gt->fuse_topo.eu_mask_per_dss));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 19619d4952a8..29425d7fdc77 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -517,7 +517,14 @@ struct drm_xe_query_gt_list {
>   *    available per Dual Sub Slices (DSS). For example a query response
>   *    containing the following in mask:
>   *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
> - *    means each DSS has 16 EU.
> + *    means each DSS has 16 SIMD8 EUs. This type may be omitted if device
> + *    doesn't have SIMD8 EUs.
> + *  - %DRM_XE_TOPO_SIMD16_EU_PER_DSS - To query the mask of SIMD16 Execution
> + *    Units (EU) available per Dual Sub Slices (DSS). For example a query
> + *    response containing the following in mask:
> + *    ``SIMD16_EU_PER_DSS    ff ff 00 00 00 00 00 00``
> + *    means each DSS has 16 SIMD16 EUs. This type may be omitted if device
> + *    doesn't have SIMD16 EUs.
>   */
>  struct drm_xe_query_topology_mask {
>  	/** @gt_id: GT ID the mask is associated with */
> @@ -527,6 +534,7 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_COMPUTE		2
>  #define DRM_XE_TOPO_L3_BANK		3
>  #define DRM_XE_TOPO_EU_PER_DSS		4
> +#define DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
>  	/** @type: type of mask */
>  	__u16 type;
>  
> -- 
> 2.43.0
> 
