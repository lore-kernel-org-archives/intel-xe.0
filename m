Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F4AC88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F48110E05B;
	Mon, 12 Jun 2023 18:19:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F52510E05B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686593958; x=1718129958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LaqvN0lWMdxtq+wiNkYFN5YO1x7E0MQxGl0+R0fMI+8=;
 b=B/FAFQ1jQyd2l4zxkeeICl57GUyG+uytARK4RKZsHX9rRDy1FKb57Lcc
 gxghcXtgop5LV7+DUK0aMqK3S+XzpcA8svQ911iU+qUAs9JeLFccm+qvD
 jHLZVksZNF4YrBmFEfBJROJifisCiq9EFAqAqCpY7/HrrCAPLIwPKCxtu
 qhxwBbeZfAwX27mUsEsjoK9PcpRQdiSKCrNqEekbNFEL9WeTaU0PZ2H3F
 jFdneoY8nxj5fYTBTqseClFgn0joMsGzq4M8CS/usGN3MWbmspf1UuaOG
 qLa2xSOthzmpzOh8jUu4v/73PmASGHnrgsk2eAZcVeeFvng+reJRavOur A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444503959"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444503959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="855758909"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="855758909"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2023 11:18:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:18:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:18:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:18:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:18:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D88igbpUhuqracH4FYJESKb6u9m5QS12LuI078REbuiPn0BwQl+N44CP5FwJC2PmdktRBJyGWo6q1XZnscfbf87g7nszOv+UUtbzx0DcyxGTOestiX6d+XlYtXVVYMleyXlcpl5nLYkj8GzGXSgFGHkTbe/yrkaRAGg6t2pPr2t4+EAXeZ/lvVUW+75j/uURe9lXRGTzKEKg6TLJBTixmeG/Pz3guY/75CRz/nCaxbSmaw5M9gjU5DAyLZyEIN6FfS3IHfRUNu81NX7EUpAOQJsorI9A5B5u9vinjRge0o4+/vcJ4jK8bPpOkvaz6kZowteeiowJH+PNs/+HbIC8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHTqFZGtRxuMNqPOKATzsV/4fJ8buMwYQ5a+BqC6WHw=;
 b=NjGGjYE0HloC77y/XcsBfi0sqnRZmkkhZLju+fOgbmOro+2Q/9ze9y0Lu5WjqjwB/mnHKjoM53ph144iEb6HIEFimvE4Zbd6zGyualqA7Z0MYVQdAxvQghKI/CAmBRsX1fjV2rQq1ina6mSj/PHRlJJonn/k4mUemyVtew+QQSJ93TjCP+iArt/JGVAKoquF+dw/YCg9MYXVYIfPbA6rFJ0y7AwdgDHQrm0c4ABB+SQEP/wdQ3Bax2TFHarKnvevKXxNqNZ4gmtBi2xjSWVedsfLuyaon5DXlzf/wEdaUi4KXUWtd1aWs5QZsI87hRMoQEXrwd8LE5QpZwrwn8HM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 18:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:18:41 +0000
Date: Mon, 12 Jun 2023 18:17:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdhVQF8Q1Cy/YVx@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230612171225.88689-9-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: a2250a6d-ffd4-44ac-c490-08db6b717329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8TBLNwctOy0T1aT24tzq+zYi0eUjxjWA5i0tuh3L9/J8FmVAje4hOUkxXzJYyePirDC8B59sNRSDKasADWZeM5CBrVPYoBbliFRAaWsfW5kOzzZ0YjGwTgiDSU0xm/97mpsO2c9YHe8V1V+KfF7Fvp6UJh/GYBggrJLnDKFGs9n2d04EvOqd9AamJHSNp2YcvrSJyhSJU8uLZ/4ZuSQwAbGqgUIl4rTrwtUW1AiVyQltdARbXf312JOr490ZHnEvAwC2NB/kfQpWijPXpnL6qBmwq5xVLmugTLn5NjeVJwRwhshVLIB822PEOIGYTf/Nv/XEYZlQm2ODRzSQwPkJSrFi3ipCjo2bObyP8qF1PWUiMP0ZCnQcbSfzo983vh6CpDGLkcNqwQIHoJkqyIYObeg+ShROD2MUSR4JtcZkY5htia6tIrrn68zOk4jSEZpSAIfjrPvfE0JKmDs4RGy/MIgATgoC12NeA4PA4N5/dkWTwjLELVNwVSTAdX1s3bzksyfCKYY1L8oQ/oOHq6LXW09UNT/oX7r2S9bB2QaDCYC2llghBEADQnBFbuFVe56X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(66556008)(66476007)(66946007)(8676002)(5660300002)(8936002)(6862004)(478600001)(6666004)(6636002)(4326008)(41300700001)(316002)(6486002)(38100700002)(82960400001)(26005)(186003)(6506007)(6512007)(2906002)(44832011)(107886003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GzYnNAclaOcf6gGb0qKQXrqb/K8T/gwkeagaPR740cbblf8QwX+ep8kwD7n2?=
 =?us-ascii?Q?QykyFc6pcxl6mJh/nE12IfKnNrlN7dnZ0zX45I2ENbKaRQQCPLp6Ya6hPF4W?=
 =?us-ascii?Q?wotpmoadROtoQF/2JdZw9HwgRFKJjwwv3ONUjiFzeTi+gpP61mVu758SbhB6?=
 =?us-ascii?Q?UKQGqL1/UJoLJ6H2aBRMhsuuOnAkZxFXSYwbLR/1MKOMUJddjSgbirXxexBO?=
 =?us-ascii?Q?qKZcSGyh/BTwDLJLhGgmEhH+vwNcSV7qvPShkUI4ngDciTVstueqk81NkCu2?=
 =?us-ascii?Q?Qf7zlucJpi2PBZsULj++LqpDPQActmNOtJkzKLG8q1VAO8BEu/HYtXoo0F1e?=
 =?us-ascii?Q?6+fexyMcoryxnsOIbcw3ve82tCTTGVXG/M5aYn786LfHk/fsDuWdZ/BOMzgS?=
 =?us-ascii?Q?FOcR2ZWE5tkGI/5QM5ayv61G+GRZy4miz3YeB9o6KYKJ7LySb6ENLD95R7x3?=
 =?us-ascii?Q?fZTMEXhls/m7zKDW817pKlVtADcdpS+UqZoSxCZoekltuEZuGwCopKMhclLz?=
 =?us-ascii?Q?+t0mggoWLsrz0y7YBarpNHcM0ME4YtGdSvqy7r0NMIUgYkFEhKBbydfrUhZ4?=
 =?us-ascii?Q?w4voFnP6wWpmEkcGmO2U4Fkx/SmpxcXIL9TG9jrKE0igN7E918tTPJ/AaO3N?=
 =?us-ascii?Q?DH5+f8BFqXa5aBvU7jA0ouA7wPUVyFh18SVWnI0m4UmI2AAoThzRavG7fJ7g?=
 =?us-ascii?Q?AykDXwqz+ZJhFOt3qpUT8eGSv98N48PzWA/T6moq/2pE7oGsHbUinqvdyFsY?=
 =?us-ascii?Q?T2SEllP4IbkDYZirHZtM/GgGLQ6OOqwje+LQviX4CNx/QToz63hpu/qzQ2vD?=
 =?us-ascii?Q?q3TJybQxjolLE7J7iCZc0dn4x6UnQ5px0RvgeN+1V2ORdj/1wovObd1C/OFA?=
 =?us-ascii?Q?J5tFTungCurZIhOydnSIOwRQocuh+DfyURvlA4TOs14pbeqq9imuV6qQ2Grr?=
 =?us-ascii?Q?149yOotvUD2/7rBMQlzPZI21uLw1vhbG3C3Cr9vJugspnF980xE1ycEnH3Az?=
 =?us-ascii?Q?oQLeYdb6yZY89skpxyPN6hdIVZTIZ/gUKgBFe+gKFwVHKU5t5xG5rW8Cvf4v?=
 =?us-ascii?Q?vP9WnuR0mqQstPymV9GZaS8Ug+LUF0Ytf9bL8rhZ+Q0d4jwyRTDb7Tkf8g7x?=
 =?us-ascii?Q?EkAvU1yWq3CnWApGT6o1eBlW3VxbugqIgx3Wu/vDjoeyF+oofyCEHUfoixgv?=
 =?us-ascii?Q?/ueVT6aMPUHM8Z3qGiGDIExtcShvsDJ8/IQdumpy5Rt40khRGXeU1/+kEmff?=
 =?us-ascii?Q?0YGmZ+2JAX2h1VeioaJcEk3Dv2+J2GwBAFOF1CMe7MUSC38PIYL6k7rXpSLQ?=
 =?us-ascii?Q?dULuDj3R7EgPWj2+m02nyefB2DTrVjNzkHdNUbunzduvLj3TB6p4I9T3X8ae?=
 =?us-ascii?Q?YSr+lwNmu9zLYRTI7Dda59Toat93xPAbtnwNV0waZICJCJetwcDvASf3rKve?=
 =?us-ascii?Q?jaiN7FdoZw7EtHuvZ8Jo2XnIKHRdyRWydcipszFeBDj1S08Sq6IkkgZaxMhr?=
 =?us-ascii?Q?HZKMeJPem7pYKHiK1I+n4plT/wnvYBA2mo20hY10jAhkQJwoMUFf3rsiH0tv?=
 =?us-ascii?Q?AHpEdPdrvBxR+m067SrcDVj+o6lX1r41wjXMoLhcvAONnrqCTAHWfQybB+Br?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2250a6d-ffd4-44ac-c490-08db6b717329
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:18:41.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2Ws5gCCx77T5wbuprk4ruyC6BmLZyJsuOnraX6nY9F5EaeCL1/w1Y5flapaCilbKwy5P7UMAJlv9Il+bYu6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 08/12] drm/xe/mmio: enforce
 xe_device_assert_mem_access
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:12:21PM +0100, Matthew Auld wrote:
> The mem_access is meant to cover any kind of device level memory
> access, mmio included.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 3c547d78afba..1a6f0fa9e04e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -10,6 +10,7 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  
> @@ -25,6 +26,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> +	xe_device_assert_mem_access(tile->xe);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -36,6 +39,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> +	xe_device_assert_mem_access(tile->xe);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -46,6 +51,8 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> +	xe_device_assert_mem_access(tile->xe);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -69,6 +76,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> +	xe_device_assert_mem_access(tile->xe);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -79,6 +88,8 @@ static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> +	xe_device_assert_mem_access(tile->xe);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -- 
> 2.40.1
> 
