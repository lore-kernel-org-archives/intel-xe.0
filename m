Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2F3C64ED8
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8410E02B;
	Sat, 25 Feb 2023 00:48:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8BA10E02B
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677286122; x=1708822122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sijHtJXj4pScy1Mi2rlx8SWcIFRePSG6FScBu93b+Ec=;
 b=h3AG1GKyjoCEBUwjZ+Qi9K+KrBAHdUQGm0Rljh0LLX11+niKXDYmmiJK
 nc77qE1hOEz0NrHU24UMbLdiwhE/1jLjD23AVxC937ipjDpSd0sNRJppn
 AJ/9urH/AavhBlRGNF+9GTnhetr73V67YphO8LdoynC+RPkaO59wybI8K
 l4KNBZkn1QnLj+M0qu91u0MEcLSMOoOjM0cDCvBzLP+kX/3qrTw/eb+TP
 zP+PfAy78Feb2jd+PoDI83jZpifrPYdNe2qfJg3EHrsfVsFt0Us0tm0T/
 FQjnYVt/ooORMFjzTIy/D6oVGpDWaftF+wZY0np+KN4dKUDEq+WE/l5c4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314001594"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="314001594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="703360387"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="703360387"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 16:48:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:48:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:48:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIpSk0vWOreMf0+F5TYVNwU6yhdeSGdaG8xuaUvrzceDEtXNUDR0iKjzGW3vPaP5uZuKex4IYVML1yxR0jN9po7Vh9NXZDhHjQE3dziMjF2aQzZD0ybyZBzKJXs44gDKCym16SqwjrVWmMoKkHqglKyg4nr1PjhLLdgT96M1S2Ws8IoQmNDPnRxh7z0ptiFAJpQ07u5IUmxSxqtLRbyyrsF2jpOJff+QuOVqL2BXhIC8kwjAs/KmjO7NsSD+Xd4rQgDdEdRSvZv0Y8HiyVXHFs/tGJAL3js8tW8rE+qEKv6eaxRM6Nb941K8Lr6Xg4KaitOs9qdqqXrl+nONJ/PIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cbTRzezewCniE6u7ZIX/mtr2FvSuM9Tm9rXG9VrbpQ=;
 b=SbM/kdbV/ZfE1H4a2ZlfWBUGIeL2TYVJbN+FJLwuxph0KwkUArNY1Dr67iHfn7nmnEjcsjnULZyccjdhk3/6ktKedkji0kG6wN9LQYfus6GvXtJWYJyeD9N3Yq7BHh+5m2MOGEZrGQH/H3j5JFqpoEoAnKL39OeKxkTmVPWoj28QqjQQkPFqx8rjhUv/1KLiNA2xrh8r3n7ZapootY9FmF2w8c28tqo2O/nBYyBSoKgaWMQW3LKeYrqnPOvDC9jMMk8S88G6+CZW5TqVaL6nakPbWCwXhSJuN0dxxdpQo5IUTmRjzuXxm1/lZb/tYs20h3fhKBkciVBHbsEmIm8Fog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5000.namprd11.prod.outlook.com (2603:10b6:510:41::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24; Sat, 25 Feb 2023 00:48:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:48:39 +0000
Date: Fri, 24 Feb 2023 16:48:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/la5HXodsbmcd6U@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230225001548.1743820-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2105c3-c85f-40e1-3c80-08db16ca08bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0gUnc8WTxbulKB30esnrMiiLBCmrQzUCGMAvVkkh2B2nZbRyhMxHRzyuYyfGG8pRuj2mNDg/o8UNldk4ye/FQLShuu8OuPdZfCbcdwKMTu/AuEagvZ44bLm2jKpLO4MY7QSpv6T25uU9opwLrmf3rBNUVLaDwP3KfZ0urXTHhAxS4OgdaR6AsP4kWccjJPD4vmX9VLh0gxIAt4TDuqJih3lfsdJqxEN9omKib2EQRd3PS2YxBknD+jPhnhSTl65dkCM266Js7l7uD89pmNYcnGNgecC+jetENwI6hxbHLrG/9WbEntBP4GqDtrZsmSyicqdZ8Ojx4n6dR+t06rF6LzFmzVbCwpQM6trE4vpLX4OBKYA+s7kMoSwkw4rb3AvPAHfs4ycnwmhYkUMZ80tLMokfyIWP2ay4Y6kFNqv8Hn6CJh6ui3M1DzJ9y5S2i4gYbZmLYVJdxpjVg4NY6yeQEgwglGnGlsYxkZ7a2QTaWLg5gtx/iLVLItkLEHjsEnJlM3RJM1u/oVzE2RKRRePnixQG4GJ4Pdl2G6rdzBFBmI6reTg7kW2tDRF5wYowABF7bY2dI926FKhPYteChUMqvh5WpZQlRRqOUTELTPh4NqCkFwfqFn8H+1WMgYIs1IeQmJLLecER5kBZ5D440dH5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199018)(83380400001)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(316002)(8936002)(26005)(186003)(6512007)(82960400001)(6862004)(6636002)(54906003)(5660300002)(38100700002)(86362001)(6506007)(478600001)(2906002)(6486002)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjDHHx9uzaQEgOXCtn5PsMQeMU0NPh15oWBhgsIudu4vkM9uqt1nKv8zOtuq?=
 =?us-ascii?Q?/NX0RiOpkGi/nbI3CYbarOar4YyjnCU1R26vxeQIiCuOPD+gmP7TqY57L08K?=
 =?us-ascii?Q?fQm0rto1VS9wQZVmSujxnugTK49hkD4T8AYl23P1wAhZvUvnppKzpSrZxsi+?=
 =?us-ascii?Q?59WoFeA8vV605cQXDmGPuEOs9WJW/e4t0R1LNynpGqeEeEw5QCIz5RfXJRiv?=
 =?us-ascii?Q?IT/PuVnUdcKrH8kZMopJTcfQ2cBMIiRHx1y2BMUM2fDWC/akincv4paw3YDN?=
 =?us-ascii?Q?/o5AhT3vY0HDQGCDkt3JwzSWfrqiyFPJSF79ljHPDvLBe8IByZgRP6tvAFOq?=
 =?us-ascii?Q?Xthv7e/WQBEj/5p7H07uozXlvsrStTtOdxxgXQo4SX4sXRej9kr3dFBDS64U?=
 =?us-ascii?Q?3lAKu4JwaD5uSLARf2Gdwg7CFjHVye4+db6S2JGisBhpKpWXQ3TJei265zZH?=
 =?us-ascii?Q?gn7cN/JFW+a4vhRNcJDp/IonmE/+BPIbEYA3m7gkqvoz8IMiOSINw3OQY53F?=
 =?us-ascii?Q?FbGWDRnZNyCOZT8svUTwB2dzJPrlle8+6cbsPhVjJ3D9XHSaV90eXUUxT4zJ?=
 =?us-ascii?Q?3GwKaJ+/idBV6PdH80ef2iLsGSTrCaEbe+kwrzCqWr/+GY5OyErqj0ZebONM?=
 =?us-ascii?Q?RTIxYwHBMKl1PXAWIl7rlRvBifHfuHzikujOxO05yxWdkpvHKMIBuqHBR75e?=
 =?us-ascii?Q?KqK6MEyVcYN4xhZytVpYTixJ48avKe7hB2n/SFAMi8lQ4oqPgpgx8X2hG70u?=
 =?us-ascii?Q?hERW+15YnHXG4OQAtTf3j/5iswlneedT6kj8QQsfGjaonpF7H96XZHQvNB1v?=
 =?us-ascii?Q?ttwF2AokNLtZCaKFgyNor4SB6qPeimIQ5hWLOPmRDLcKPPV81lTmXJo5X+c6?=
 =?us-ascii?Q?Abb/4fnOdJ9wJZdNOaoS8fqnww3QhB+6Zz4nHaD/zrUxxFaPNYc0aUQzckcG?=
 =?us-ascii?Q?QlTD3NJ6B+kKsQkAKD5LZQVVrzKaCtJ5buSbyDMQmhj+5OcH3EFneZ07/FaL?=
 =?us-ascii?Q?5m2VRfnVa1teosEMLxFS1wf7gD8jKwnfYgXqVZs0maYaYl6Zky6GIIpjHL4b?=
 =?us-ascii?Q?rg5qh2QItmkwyz4uD41xMVVykgMW36k0ccs2cfVHbNwcP5q70oHNMAKW37cl?=
 =?us-ascii?Q?4sPc77qO9X++s2tvLdgUAQorI0UujChjK1n5dYMg0VPhm7RNhDD3+3UcpOYf?=
 =?us-ascii?Q?g9oTyQLP3XdG5SqKE3SFn1runlceq5RR56x8NHb9DHAGYuxUe0aBjcC8FEIk?=
 =?us-ascii?Q?dH1ekCwXmUZMZjcqHFcFHulQZOdUCB66gwbEFKRioMD5lRyVzIk1vU9n8JqV?=
 =?us-ascii?Q?vYANhCh10MzFY4CUvCff5aU903/8QxuXFmH9Zm32hdiSKC61XXKwvZdhrCbi?=
 =?us-ascii?Q?6um3Uyva/UI3UL5owB3f7vKIbL1VDw9/8h46yB4QV+Z/jnlHP9JQe3tm7DPw?=
 =?us-ascii?Q?wFOcyHxDPB7aW9EKOARLjxYEfuR4ZAx4D02CJ34PAO8gS/rXsV3LvbYik7be?=
 =?us-ascii?Q?8SLa1hCiixELtdMqTNDA9psoc+A6WATkgsV077Jg7Y4PUotHbbOwLNmHuPk+?=
 =?us-ascii?Q?UIuN3kdS0J5FeDbQ28IC+hVVmLh8wIWHbqO96IDGirmjtjQAqtWCjr7BLGcz?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2105c3-c85f-40e1-3c80-08db16ca08bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:48:39.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyZPozwmW80RYv8xYGi16MVth/YuGvzf/gyh8muKZW5APCPydHnMZ9JBpXWZ8jUZgGtOn+IAclQpiFxgOqg4zYDh/PfhuXZjB2ljQhv/bPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5000
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 10/12] drm/xe: Add missing includes for
 i915_reg_defs.h and others
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 04:15:46PM -0800, Lucas De Marchi wrote:
> Several places were missing the i915_reg_defs.h include. Any place using
> the i915_reg_t typedef or macros like _MMIO(), FIELD_PREP(), etc should
> include the register defining them explicitly.
> 
> This has gone unnoticed due to the way the display is integrated. By
> including the display headers the i915_reg_defs.h is indirectly
> included. Also, although the Makefile tries to add more cflags for the
> display part, it fails in doing so: those cflags are actually added to
> the entire Makefile (see subdir-ccflags documentation).
> 
> This change is obtained by temporarily removing display from xe and
> fixing the breakages.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 6 ++++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 ++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 2 ++
>  drivers/gpu/drm/xe/xe_migrate.c      | 2 ++
>  drivers/gpu/drm/xe/xe_pcode_api.h    | 2 ++
>  drivers/gpu/drm/xe/xe_step.c         | 2 ++
>  6 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45e3c740fda2..8f2b2acd4024 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -31,6 +31,10 @@
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
>  
> +#include "../i915/i915_reg_defs.h"
> +
> +#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
> +
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_file *xef;
> @@ -405,8 +409,6 @@ static void device_kill_persitent_engines(struct xe_device *xe,
>  	mutex_unlock(&xe->persitent_engines.lock);
>  }
>  
> -#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
> -
>  void xe_device_wmb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 0e7047b89a83..19403dbea9f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -20,6 +20,8 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> +#include "../i915/i915_reg_defs.h"
> +

Does this file actually use any i915/xe register stuff or is it just the
generic FIELD_GET() definitions causing a problem?  If the latter, then
maybe

        #include <linux/bitfield.h>

would be more appropriate?


>  struct pagefault {
>  	u64 page_addr;
>  	u32 asid;
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index c76aaea1887c..264d6429318b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -10,6 +10,8 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> +#include "../i915/i915_reg_defs.h"
> +

I think there are some registers defined at the top of this file from
before we figured out what we were going to do about register
definitions; those should probably migrate into the new register
headers.  And then we can just include the register header instead of
the reg_defs.

>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6c0033cb238f..d845f7cadbd4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -28,6 +28,8 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> +#include "../i915/i915_reg_defs.h"

Maybe another candidate for linux/bitfield.h?

> +
>  /**
>   * struct xe_migrate - migrate context.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0762c8a912c7..2103f684a8b5 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -5,6 +5,8 @@
>  
>  /* Internal to xe_pcode */
>  
> +#include "../i915/i915_reg_defs.h"
> +
>  #define PCODE_MAILBOX			_MMIO(0x138124)
>  #define   PCODE_READY			REG_BIT(31)
>  #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index ca77d0971529..e5e77cb9ea09 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -8,6 +8,8 @@
>  #include "xe_device.h"
>  #include "xe_platform_types.h"
>  
> +#include "../i915/i915_reg_defs.h"

And another linux/bitfield.h here too?


Matt

> +
>  /*
>   * Provide mapping between PCI's revision ID to the individual GMD
>   * (Graphics/Media/Display) stepping values that can be compared numerically.
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
