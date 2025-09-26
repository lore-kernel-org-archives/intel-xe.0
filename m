Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04193CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AE910EAAC;
	Fri, 26 Sep 2025 16:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZCxExDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9DE10EAAD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904794; x=1790440794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RVrnOripdIV3Ju/q3nfGcOOUlU5XQVoOoEamxMpj+JY=;
 b=QZCxExDqG/bTJOB9vBcnlU2tbH78yfKoefRRGCmqmosT2YL9jMgy/bK3
 geDSjmwxzm0AdJCm6WXtly/Tt+vslKOa4XHpXjIrWRPzOR41MpSs0XGEa
 2TxgYaOVuLz8gmnzTvMi6KzIvQaESO6z5GDI/fXwb4tjiFc63L/nHga9g
 ZNIo6vxZmeZORJpm2+3dkLJvoNJVYGguuclcG/6Qans4oIXrdqqzHC+ke
 B4TMk/9yzZD71Zxtj8NZWEWZll6QYZrFKcr2jVHWKWaNOGjCH99DCqEaI
 gXMSDMYJT/kI4zUNKsnMKdZAc4ubWOdQBQrEefydU6ShQeGtX8dnC133e A==;
X-CSE-ConnectionGUID: ofQ5cRgRR8+Q/9dUmnI0qQ==
X-CSE-MsgGUID: ItapRqAbSFu+/8hrkyzGeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61409677"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61409677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:39:54 -0700
X-CSE-ConnectionGUID: 1C0dJp+2Q5WP/0oqeHZKRw==
X-CSE-MsgGUID: nsFUeGDxQ8yTkKjU2V3+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176922628"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:39:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:39:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:39:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCISrHe+DGUsLAS0llUkSVvNw4U/mFU7amPdvQNd7v3RbBwh01pJ4mzNb7waOmAUarY8bk/NAJ6cCTbKPa0wU6yM1iO+GY5lb2JnKbFhsj0wch+iVVreNoB1HAbmnlMUVY4R4hGLQTngS8xcDFuPn1U3w0vkPCEnXhHBDB6PItt4D6YMwqmGJK4u2S3AERRCUhJPXMzNrMrFRFGbEnXGGovFpWboTN0dJalXCseYiinMxFkAWYlsBzVfa8IZHL4g1sP/6qw5AoJ2NMvo2nA6i1rQnxRaeyq6OmeN/vyEEPK25l3HfOY7LN75lr3e8NavOnA5rCnc0i9ghq2vusUPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQfXSsaDswFzNC0zS0AS1HWE1AlvDrLqwvta8rNppSg=;
 b=oxCgt2FxZn3GBEzSXYr4+VrqnPNCClPhN93IP7en0EHLuRDiMcSiyh0b1Knv94tF57TYs7B5460VqKE+WcobCekfBjHLF475aScjMcS9SrUKq0lsjIkakJ//pa1KdYnOUmABeAcdhspDVO9VYRhXzWx1kwzuZwgxzjltpH/SDnwW4gSCrUId3VJ+lQM1Sjv8ws8+JFhfrcs2pdZzD6FlKQ8KhJVxsWl8etgWz23pvZrw7VN3Z+FFqcFtex7tSmgB9zTzYApkKHroL6iuk1sYK4IiM6lnZVOxQnSxJR9LWrVqjz4tXUs1sUyOaz6l/byw7JOfatnHDca887mgn8GAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 16:39:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:39:50 +0000
Date: Fri, 26 Sep 2025 11:39:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/22] drm/xe: Move 'vm_max_level' flag back to
 platform descriptor
Message-ID: <utdtkk2glwunbavotvvgg6nbczq7gairq4545xf75q74erd4ad@3lqrdt3r3okn>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-28-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925234628.2112163-28-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de5e680-be59-40e1-91a1-08ddfd1b4faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJ4uUs1Ddcg7zrpy31AMlORw7McanYg9MJjqf/Ap6uG9zyC/86P3pT87wZXG?=
 =?us-ascii?Q?tC2axqK8r9ivVzt6QQe/3qp4gTWCtPDJVjW6VUwaz9DHRlfSHlG0ObNdCt8G?=
 =?us-ascii?Q?si/5daORWL2euv9nYBO/RvJrVsQg92K7gHTSB9Dpg0IehRHdlTdn9UXxFfV3?=
 =?us-ascii?Q?j1FGckxYcQYB+qdUZ0dh2oJR0/RdfxXatetbO0IC/hRiWfWJUoKSvfPdaKuR?=
 =?us-ascii?Q?RGy/ThM33ALLUfDZvrZLVrjPmCgq4JwTUNmZ5hcsnwGk2hxCQ2+BX97ArBPN?=
 =?us-ascii?Q?Pyq4FxtJ1gPNVrd5M6LkscxU8aOQKPSfCii1ejjkHsyfvMpVsxgWLeO75ooc?=
 =?us-ascii?Q?zW+yBs7v/atoOv7xz3t3RYurEyAH/McVf3gcgkMore3rxNG2BCBh0iDu9Jt7?=
 =?us-ascii?Q?0t9U7o6Iq3mHNbiZsNtDHTD7lbTfVhsiOJPKm6Ejp/+zY5DJs6qvdGLJ6Fff?=
 =?us-ascii?Q?KcNwBUXQQKoOwcOuvXCGw3YALX4sahimOop+Ry00mTntIOFR5HrOtUlJq1nw?=
 =?us-ascii?Q?uUYfZX0to600jNjmYxgvqc7HSoeRz0X/dO6bA4r2phv87pMrQBWJJc4DQpvd?=
 =?us-ascii?Q?EiL2Kj0e/Zdwi42JkfdGBh0nguYn6FpHp9Ssjrr93N1F5TPtFj4peWGSjsJH?=
 =?us-ascii?Q?fZyLAJ+LpQqxc4KDDBVbrvmpwa/kPQS269sao0LhXFN3ofZHeq+JYEKQniPE?=
 =?us-ascii?Q?SMHe0ayIqu4NLK6D/wy/cXgC+7zjWKEzYnRA63ZgrhBsr9vLftA6uvQw/QLb?=
 =?us-ascii?Q?AaKZ7YD/lvQTohjCIH7oyvcd3MNo5ix46uGYyzl5QomdpjTZg/jhTtU3J4Pn?=
 =?us-ascii?Q?R/n8zkm5W00fX5f9WTAmO7QdVEMgqa+UDN+UV5vNdzFyW03NGhGmDy8n8aQo?=
 =?us-ascii?Q?fWMoQm39YV176DsMX5xAJzWm3oNQIVNi7csAbe1u51W9rNs43xG165+tFM0a?=
 =?us-ascii?Q?eX/LAveMNQ+m5/bhBgmojh7Bv5XpsNRE+MOsE2oipZTzuEEz39w5D05B3Kxt?=
 =?us-ascii?Q?P8Ha4a9PyUbDBlel0d4TisMQjzwrZoCSriW9P0HNRVlC5HlAxqeoLuzkUh9T?=
 =?us-ascii?Q?1GE5Bn1OUtSebbEQSIAe/wVAP7V6gAr7Kzw79GVU+uNeIARkuybsdcfO3MXO?=
 =?us-ascii?Q?QJ+/5ZxQOkhTnap4vgv0J7CGmekBGl//ixijSCdT6v1yy50s8n79fCZo+b9D?=
 =?us-ascii?Q?5g1RCI/KVPhHoL6eWEDmiXLyNAWTIbCtZHWk0lRcodwLfI0kPVvrV7BmsLy1?=
 =?us-ascii?Q?pz84dMOEUUF61hSjS3r/VgoFO6yhuamyHKP8v8ExZQpJ0BKfXSH3IBzjgODT?=
 =?us-ascii?Q?gQIVGjTFu43hgERMfJJDFHzy+bMxxAT3xgELQUD1uw7iRw+b3FaR1xG7ALII?=
 =?us-ascii?Q?vT3DOqyvxPhCVg5NQSD/DVlDQadMHdjNA0gxP0ZYi4xEN2Vz75nJEK8V8iel?=
 =?us-ascii?Q?skHMyuxiR4pTs33x3ScPcp0OI7VCRbMq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xRZB/nSl5T0MZ0BS2n3cQRGxk8UL7JlW9jnQ9p5vqnoX0h+VKn1jMuS/bH7e?=
 =?us-ascii?Q?kgmx92gldnmTMOuEeAU82x+3payac2vvLth2O/QfCHCrR5476usPP1iTScMu?=
 =?us-ascii?Q?8Id5Kx7yVg9/jxxzB0HZlcnVuaQrI9MR0TxoCy7zEnIeppoQYxOsdM2bCCW4?=
 =?us-ascii?Q?5dn3jH5rbVFGcxzuO1IZ3w8/UgQ7Ahw1NODE1f0lgD2PYb2MWWr+gBiDeY1Z?=
 =?us-ascii?Q?vg/1sSXcrUNWCMSjQD/22x36P2pKvCxPIaTpGOITfU9w3ABuVUC1pv+gcT7+?=
 =?us-ascii?Q?cd36X+OPQjQRA+YO69c5s3FdIDyJlKvS95YLIH5YnHA1c/XbLS57LmL029d/?=
 =?us-ascii?Q?sQlkQ1VuHRdwaV+bvRM3N0rVNQQRtOsk8efxf4BnzJS35qZCu4HqpGmdUm+Z?=
 =?us-ascii?Q?RGVaqJSSgn9XQP7MX5fKDxYwT99jGdrmqpuTFpM0mtEcu74SQMJy3NIjEpcN?=
 =?us-ascii?Q?RiQQiy9iI5DBx9XFOtaSKJt7q3rSQ936+TSkHM6ZXFXGcl2wgyX8hVmbdBnA?=
 =?us-ascii?Q?n7Mhwu1D/F8CorIx4GtT9JgKigtJJ0AWDB2cZVEQJFSNwsTQn71aCglXgMMO?=
 =?us-ascii?Q?/enxG0PZj/jxllFmmRhztfQYTXsDDbKwUHJowqE8EP1WR6BR24pG3cOpfJiC?=
 =?us-ascii?Q?9vBa/TdtGOEf5FgKqsT9PnjI8XNq3zYdwMyyARhCVraZ6/SWdF50ZnZdA2TB?=
 =?us-ascii?Q?vCa2/WhOjV2R7F2Z/I6So7S2+Plnw9FlfMAtEb4BdvUNv1LYL06G3xTjFni0?=
 =?us-ascii?Q?f2QVdX5MqOzDfIF+QlICZtA5Ii25jR6jg8/TiSeJfDN2a3dL8JGfx6Jkw7cz?=
 =?us-ascii?Q?U7oY8pB/CFnlU/dNyLQobRg/GbrFXumSd/gKDJV3C4zOoVrxbeYg8tKf7zxz?=
 =?us-ascii?Q?e9kGyPiOr8Pv1DiPlirW4WS3Ee3PmaShz19GdOdxNNxoXt9r1AiruVUVQFZl?=
 =?us-ascii?Q?pat/qyyoggQ+QZGkVgPgA/mqjx1vnfp8rMZ++FYJXECwEz7RBBGDKfSY6QDA?=
 =?us-ascii?Q?ZQ04gytJDO03JuOUYq+/4RKLq6xtW0L98E+mA1RGUi36UoCYajB70exSU584?=
 =?us-ascii?Q?vdrUQFURVhVUftU5NszGJOk6dxINm4ShZr2iqVpVuGzEn3VzB/Jw/soCfKux?=
 =?us-ascii?Q?bJzzGVpnJ9JTQ9kEtugDQx6N9qRxvOYDCqry63EnOjrqUFt7QRzwgyGzsSCz?=
 =?us-ascii?Q?1BxanS//GpYD3TBc4pl1cev5MISYcBV2dAll+CIZMVDX2HqqFqTqBmfPCV/b?=
 =?us-ascii?Q?hK0q/7Vggj5ox+7sNTq1XbdQH4ultTh7QHiQ//XR1EcMrtc+rMDqI9eTeA51?=
 =?us-ascii?Q?wPeVtqa2Bh4yDe2hG3BTf2uZm0UKDdZ8Gb0V5iI2JRiipBZjPughlV69ZI7j?=
 =?us-ascii?Q?kvpWpmHKDxeOkjY4RmmIBOnjJtqNh1tG1Ued3a6HDaiHMQZU+Pi6aJ/hMr0G?=
 =?us-ascii?Q?mcgt2xj74TW2ryWgCssJsjFt7jCimfqK1szu8ohA91Zw3rnkGacpzs0YslO3?=
 =?us-ascii?Q?USXqxqRZ01VFqM2+kvRzoGua56sTDwKcdpdSzfonyEloV7ivNmypT/0HrPW9?=
 =?us-ascii?Q?/q5C3EwjR1CfF5oKTFBIOCPnz8lDkQ5yEpko2xz7HmRun7wOiTZQ1a0EcsRT?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de5e680-be59-40e1-91a1-08ddfd1b4faf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:39:50.0771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6w365pgXcTqY+YjLR5UOR2WBrll+8Jar72+gG+jX9QMnhRBgj/eqwqM+ZJP/Ukhldh0PtMDxksHHAHg012T4ZvQKu14jqoT8Z0KW5QzjU7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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

On Thu, Sep 25, 2025 at 04:46:32PM -0700, Matt Roper wrote:
>The number of page table levels for PPGTT virtual addresses is something
>that should be tracked at the platform level rather than the IP level.
>Even when mixing and matching various graphics, media, and display IP
>blocks, the platform as a whole has to have consistent page table
>handling.  This is also a trait that should be tied to the platform even
>if the graphics IP itself is not present (e.g., if we disable the
>primary GT via configfs).
>
>Since all platforms officially supported by the Xe driver use the same
>value (4 levels) and only some old Xe1 platforms have a different value,
>let's make this the default if a platform descriptor doesn't specify the
>value.  If more platforms show up in the future with different numbers
>of page table levels, we can go back to requiring this to be explicitly
>specified for every platform at that time.

Same comment as in previous patch... making it explicit IMO is better.

Lucas De Marchi

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c       | 17 +++++++++--------
> drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> 2 files changed, 10 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 90dae6fa7fc8..0851fbe92cba 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -51,13 +51,10 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>
> static const struct xe_graphics_desc graphics_xelp = {
> 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>-
>-	.vm_max_level = 3,
> };
>
> #define XE_HP_FEATURES \
>-	.has_range_tlb_inval = true, \
>-	.vm_max_level = 3
>+	.has_range_tlb_inval = true
>
> static const struct xe_graphics_desc graphics_xehpg = {
> 	.hw_engine_mask =
>@@ -82,7 +79,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>
> 	XE_HP_FEATURES,
>-	.vm_max_level = 4,
> 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>
> 	.has_asid = 1,
>@@ -105,7 +101,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 	.has_range_tlb_inval = 1, \
> 	.has_usm = 1, \
> 	.has_64bit_timestamp = 1, \
>-	.vm_max_level = 4, \
> 	.hw_engine_mask = \
> 		BIT(XE_HW_ENGINE_RCS0) | \
> 		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
>@@ -181,6 +176,7 @@ static const struct xe_device_desc rkl_desc = {
> 	.has_llc = true,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.vm_max_level = 3,
> };
>
> static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
>@@ -199,6 +195,7 @@ static const struct xe_device_desc adl_s_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> 		{},
> 	},
>+	.vm_max_level = 3,
> };
>
> static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
>@@ -217,6 +214,7 @@ static const struct xe_device_desc adl_p_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> 		{},
> 	},
>+	.vm_max_level = 3,
> };
>
> static const struct xe_device_desc adl_n_desc = {
>@@ -229,6 +227,7 @@ static const struct xe_device_desc adl_n_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.vm_max_level = 3,
> };
>
> #define DGFX_FEATURES \
>@@ -245,6 +244,7 @@ static const struct xe_device_desc dg1_desc = {
> 	.has_heci_gscfi = 1,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.vm_max_level = 3,
> };
>
> static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
>@@ -261,7 +261,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
> 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
> 		{ } \
>-	}
>+	}, \
>+	.vm_max_level = 3
>
> static const struct xe_device_desc ats_m_desc = {
> 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>@@ -582,6 +583,7 @@ static int xe_info_init_early(struct xe_device *xe,
>
> 	xe->info.dma_mask_size = desc->dma_mask_size;
> 	xe->info.va_bits = desc->va_bits ?: 48;
>+	xe->info.vm_max_level = desc->vm_max_level ?: 4;
>
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.has_fan_control = desc->has_fan_control;
>@@ -712,7 +714,6 @@ static int xe_info_init(struct xe_device *xe,
> 	}
>
> 	xe->info.vram_flags = graphics_desc->vram_flags;
>-	xe->info.vm_max_level = graphics_desc->vm_max_level;
> 	xe->info.has_asid = graphics_desc->has_asid;
> 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> 	if (xe->info.platform != XE_PVC)
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 095133a1aa44..f45b45a7f76a 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -31,6 +31,7 @@ struct xe_device_desc {
> 	u8 max_remote_tiles:2;
> 	u8 max_gt_per_tile:2;
> 	u8 va_bits;		/* default is 48 bits if not specified */
>+	u8 vm_max_level;	/* default is 4 if not specified */
>
> 	u8 require_force_probe:1;
> 	u8 is_dgfx:1;
>@@ -52,7 +53,6 @@ struct xe_device_desc {
> };
>
> struct xe_graphics_desc {
>-	u8 vm_max_level;
> 	u8 vram_flags;
>
> 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>-- 
>2.51.0
>
