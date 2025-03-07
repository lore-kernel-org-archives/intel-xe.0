Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80322C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 15:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BA310EBBA;
	Fri,  7 Mar 2025 15:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVe89rgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203EB10EBBA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741359746; x=1772895746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qd8JgbEInCwDd1sfgdPQFfuWeRRIEz9GiIfR6vw8aj8=;
 b=PVe89rgiiX1pDYR0I/7rzBkojeqya0IxIq/p/eXyqSrUeyR7u5jljbZI
 7Ix/YFh+fnvAKV0OMJdmXIq23jsonL2nocliJiroihRZtw5rd/D8KHEKw
 m2nW2CQ0y1eXECGdHyc6lF5YCCc6jLAAHM4EZrmj47qPJYpByVxYDp26T
 Mgi78ZrPL6e2hPQPQ81u+MgCyGt/atf6oEMxjmRY2xOSDjw40kKcng5ak
 F62X7kFuZUzWX+jsGo7phgKk2zNVafdRwVjYhEBFhVF3/gO1PwdYwiMGW
 Y3kcNh88btBSxrM/CtQY2r+1fjDXKXm/hTxO+/MlFXEjxnCW2DItqO/kL w==;
X-CSE-ConnectionGUID: WtH95fOQSryHPgwPQIHENg==
X-CSE-MsgGUID: hkK6iGHlRRioNtmPRWD7BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45214935"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="45214935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:02:25 -0800
X-CSE-ConnectionGUID: D+UeCRuMQui63A+acsxLeQ==
X-CSE-MsgGUID: +pGgTJ1TRUWC1pcYB6iwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119337634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 07:02:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 07:02:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 07:02:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 07:02:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCrbQoVi/+FIJqplMfKGmIlCR/uYKCEs0TbTGrf0Hv5Z8ja+g4RlRLfXzGC8ZNDh8R5gxpuF6f1t4PbIKx3hBibE89IR3FQ1d7Zz9BSpfO3WLdJYnvElDeokGdwoGUTCxNmCE5tLLFlWLQJOTBQsLPhOTJBKuLXe9JBFTbT4O0ijy4msjNLqIPEW/YO9obw12rxHObB7BD19J2HXguNT52MUWJO+x+9iWF5H5LsH3lBAk6CQxQRmPsSM22tcw0Dr8lV0+uPomr4Nc2Iv9PsqrwsV/mE/4OvjLqbzOYxXwQRNEx7lZSS6GWE/WIFM2uJS6yPW/Uf/fvBGdJ6sNElBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa8+CkBui8xMzaVmELYVIDmp8fJIEDGeznq57QUelRo=;
 b=FXRCaU3mcgzDZ7lx4ijfW0qwZ0Hs3bFCh+65ME3WhpQZ0Gk5tP9z4WUFUg0Fd4KHr8MJhD/x1SXOfz/j8NFuDJeNfCNUyqPv0vf/PS6FFANreTOM28A0fVnkSS2n/+HFL0Y/gnS9gKaR05p3iCT4FLlkuE+ysAoUyBnELINGuKPo1lu3Xo871Bx+BdE5bZMSLRntkHCLn0s/4fk4f9tz+BLq1wstu+sfWqMagKnUbCmYtD2JmKvxy5xGYG5E0pBhAQBRA7DJill6tOCm7KYLRLRJxHF8Wrq4uwpHsiU5lOHi7ZX/ijVLbADiI1yxnGaVd3oaunxAJS0howffc/0Mnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 15:01:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 15:01:53 +0000
Date: Fri, 7 Mar 2025 10:01:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable configfs support for
 survivability mode
Message-ID: <Z8sKXQWCa5eJrAqG@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250307142446.1790715-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a697c2-9760-4b89-c28b-08dd5d88fef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wkBQy0TRgAfgm8/scpAJzPrYyzfSMkiHzx/QAGh9N24fjBhBbEA33k2fLVmX?=
 =?us-ascii?Q?PxKsYeKuH9M3KBZ7Ib+cSX0oCxardOmVgXcIQgLOGT5gX4BtKupothidCYZx?=
 =?us-ascii?Q?TuVGOTOzgvQO23i/92IjUc2ZQMoogfD++yb4ccSa6m97wCQEop8zHJePY52x?=
 =?us-ascii?Q?GLyPZ4d5lyIrGAuxcHFun+MI0egH0R69/fykwrjeuFvsGHSGKi2UXcnS6UMP?=
 =?us-ascii?Q?D4ZDpY/tcG/8ujA87GChT54TbP1Cr8cllwa1RqIxM8/a8gHH/ogaqqXAuNfl?=
 =?us-ascii?Q?Iou2eYLwvqGYj/9uH3H4Eap7A14Ti260xlf8PjvLEa9Gmy9h+8ARedeqtYBC?=
 =?us-ascii?Q?G5Ro3WExbo8yY6v7W6NeMGPZ/OpedEDgzIZi0fgnenLWbvKo6QqTCp/XU2Ck?=
 =?us-ascii?Q?a1iE1qa3eLIeqldMMnvnf9c7PgUtyq4SYWI9ESpb9Bc0jjIHwVUxvgqOXO63?=
 =?us-ascii?Q?lClzhKMEu60PyQYQM81RUqmBO59hcTVSzPngmEkLfzJLyz3NbrOBqLEfDNf+?=
 =?us-ascii?Q?e49+caPW62cVFtMSwW5Ll4EBDA//ZvdfXvwwlB5p0CmEi/9Z8iY2BU4yUAWu?=
 =?us-ascii?Q?0FxsqD946UtrRqKU0Om0rP2w6BEfwP/fwzF1sc1NKRDvNdVm7P+Kou9zhFc1?=
 =?us-ascii?Q?VtVWI0ssqP8Y8z7Jb/cMSgV50zrGaZfou5KJbETX6gJorB1DQAwRZwE8QYOd?=
 =?us-ascii?Q?HstcI76t/72vfAiaUqjCqlKMPNQQZla2HHMDCj8zSEOB754CVm9pQgV+II2l?=
 =?us-ascii?Q?2rifFTzcfeDaSdNxHqtvW3eZ/I2RWVDEczZ1435fSho5hBkra31rEvljABZ0?=
 =?us-ascii?Q?p7RZI1gC43SSs1gnxZdF0goYDDTEo+N8YAKH5/BiwiXdatOdzsOzlEef3bSw?=
 =?us-ascii?Q?YhFFYdukQlaSV1vQkOpYHURBsnNfsffEIvErP0Dsucd1RmGX47H5M3uSZs//?=
 =?us-ascii?Q?hvMeLNv78ZNvm2pM8D0oAEIhgS8pzb6avSZYDh68EgZkWFOLlH1aDV87p1AF?=
 =?us-ascii?Q?Mwd3jV1K7H5jm79iUW/wTJbC8fjad+tqG16bhfz3dHMM1h2QSpw5i31yc7Nf?=
 =?us-ascii?Q?PE2Ke8u/RF1QFAfOcgIhKW0ZXgZOlxVaiKuqmRVHfM3g2ZX31d7xroSGxqVg?=
 =?us-ascii?Q?Fezv4kpEUed77pMcqd4gwA0LqkfyVAZFyif13Ii5iTnU3rqgJmW5AaKxgBRR?=
 =?us-ascii?Q?0ceVl8Sz5+PiXWxMnonoUx/Pl50NgULPxWL7+B4/K7Prw0jHlKmqzeuYQQ/X?=
 =?us-ascii?Q?Uh4xpDzLLtU7sMH1QdcaOXWZqJsQBVyJBA+nowp6n8DNTvPNYvPu8e5269TN?=
 =?us-ascii?Q?urERjkNQ13510RO92WHhCV9Ef7pPcl4VCkGcG4HXdtNQOBGpawJtx361h+Ba?=
 =?us-ascii?Q?/gYWxJzDCqpWPRph7knMJZ6qUr2T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMOgnoK3jDXEfHyYalOW1gvca864BwnYr0z59Sha8UYFvvbpI6SCf+6MnL2B?=
 =?us-ascii?Q?LnzixdBrf/Xvx0f20QHA6C3XpBVCuZApgQaR8WX/34e+QSxhYh4/15wt0sfD?=
 =?us-ascii?Q?BPb2zAP7SBWcu2VT454aa5t7axMzNFEGftKfq3jhOTvXnOl25PfzD9m5zfLE?=
 =?us-ascii?Q?B5SWNr4OPVJ0dkbAr7Rmg9kj0LnC/Ofuq7TQJGXT/sk3Ims2dgSPMbZ20DmB?=
 =?us-ascii?Q?SaPLN6MNjBOXyyAGI+vs19vwcFiDh3TZmpxH1x2MF7e22ku3XR3xzbzIkzrj?=
 =?us-ascii?Q?vFCBtBtTC85/nlNR/xPWq+zkWvJMXT78S3dFQMi6UJXTjHeg+Oc52jocsmXM?=
 =?us-ascii?Q?oB6kiSnCuhV6QIvx4cCtbX0K802RPXPFOMsOaC2RyDDIOznpCABvzQCbFN18?=
 =?us-ascii?Q?U4ea//23eVS4PHGqRDVRzEN4i8pn6+QSJkuxvrJatRhQXBHnp01mRhP2uGcJ?=
 =?us-ascii?Q?krSYGCJuddQn7hvCXnWdYj4tZLtuUD4Hy+D88T3BrcyAnjQjaFmEWwWbPqg2?=
 =?us-ascii?Q?MHzW6i5JmMPG0dyS393nNUAznkAJS2k9zAY1MZFPen/9NSay4NS159OOjiq0?=
 =?us-ascii?Q?t/VQtigd2QzeIIrivnTOyodvfBl/HryRwu0h8zQXwKKaI3aDOQWKk4dPgE+z?=
 =?us-ascii?Q?zktYSAmpHMi3vevfSgwMNNvuxeJR0vpax/6ZNdo2VHxwoapQlDA1uIow7P+M?=
 =?us-ascii?Q?b5dSUUaG+J94SyUNU/hpgpyj1hF4VBm0aeFNdAzmCIcHlkULJpAwuvBlqhQ4?=
 =?us-ascii?Q?oLBjPNJYrY+AqHZtIsJeiW6s2JL4pk3ZZ7H68/Q/zzMjVh+h+yRebljzrt9Q?=
 =?us-ascii?Q?OSvzUkKZwEncSvumRzsQQo1VexHExSEedM0vP9DcLyrQhvBfsJ5VqeH8OCNW?=
 =?us-ascii?Q?XNxyoMOFBEw38abNOQSGZgI8AolrCnQoX/ThwgVacYuR+9/amPqw9aw9m2js?=
 =?us-ascii?Q?Krs+Rz1xN1nUNrHyS40JW0z34z2ioyBRZzMQZeiWhAFxqJkYSjf45viL4KgS?=
 =?us-ascii?Q?hUPRQ+bBmnDz9CTGLKSsXPiJz/GoHl5XgqJeaC8T0hxKdQlWFmVbVU+VDKTX?=
 =?us-ascii?Q?qMsGPeR35fRKg2PtWzKOoBl9kXMYmCVy+mWVAGgeEdhfdI+xoabtg/L2vpT1?=
 =?us-ascii?Q?voY3tW14hfR0LSehFFGJ+hfpQBEIdpN0vUEBiLwoNJ6Fs0GvZK3PpOxdZQ8g?=
 =?us-ascii?Q?JKqjBjFf0z7YVtN2Z8LS0Yh/nhTqueY2sTyR6a3+OafQk+K8sZCu5RTFd2JM?=
 =?us-ascii?Q?IwPhAXVCL+ANZzRzyJWdq9vHgHi6Ylmgj+d5yWBnOqw+Sy++OR9XSUEmXfUK?=
 =?us-ascii?Q?YuyxyR8IaHQTrWoCAo5uIdwDtvypGMLyMg3t7TC+Nj9eIQqJFZ4f5zhet9vJ?=
 =?us-ascii?Q?qWwiAb4p7pa4f3fhHw7D5tlH0/gVIjHG7/ZWOAgXDjAg94mITw4prHmrTjvv?=
 =?us-ascii?Q?/TJXjr7KDKsTUEtxPx/x7efpWSuSL/OloXfxTPOJWI3chtqUU11mWAzz7ZRo?=
 =?us-ascii?Q?yjx3FDosmK3+dobDWMAI5PTccV3DGj3Sx1BFhYlX09A7A7S2uwqb7D947+FB?=
 =?us-ascii?Q?C7RM+999OTAa8sNWPL/Z39Y66n2N1emsNqvXf7QzsNsuhMXBc0ZRJtksdqc0?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a697c2-9760-4b89-c28b-08dd5d88fef3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:01:53.3358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8EciqK/lzoxz6WTVHirmj8JXeFZaoxpT+c5VdAUic4El+fNZLAGKJvev862JGoxYJEs09OGfxKxHEhAM7lH7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
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

On Fri, Mar 07, 2025 at 07:54:45PM +0530, Riana Tauro wrote:
> Register a configfs subsystem called 'xe' to userspace that allows
> users to modify the exposed attributes. Expose survivability mode as
> an attribute that can be modified manually. This is useful if
> pcode fails to detect survivability mode and for validation
> 
> To enable survivability mode for a card,
> 
> echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
> echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
> echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind

This is very great! Perhaps at some point we will still need
the module parameter in this specific survivability case.
But this configfs is more than needed and wanted for this and
many other cases.

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c           | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h           |  6 +++++-
>  drivers/gpu/drm/xe/xe_pci.c                |  8 ++++----
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++++++++--
>  4 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8c5f248e466d..ce9f3757100f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -6,6 +6,7 @@
>  #include <linux/configfs.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  
>  #include "xe_configfs.h"
>  #include "xe_module.h"
> @@ -28,6 +29,27 @@ void xe_configfs_clear_survivability_mode(void)
>  	xe_modparam.survivability_mode = NULL;
>  }
>  
> +bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev)
> +{
> +	unsigned int domain, bus, slot, function;
> +	int ret = 0;
> +
> +	if (!xe_modparam.survivability_mode)
> +		goto err;
> +
> +	ret = sscanf(xe_modparam.survivability_mode, "%04x:%02x:%02x.%x", &domain, &bus,
> +		     &slot, &function);
> +	if (ret != 4)
> +		goto err;
> +
> +	if ((pci_domain_nr(pdev->bus) == domain) && (pdev->bus->number == bus) &&
> +	    (PCI_SLOT(pdev->devfn) == slot) && (PCI_FUNC(pdev->devfn) == function))
> +		return true;
> +
> +err:

if nothing else is here, please just return false everywhere instead of the goto

> +	return false;
> +}
> +
>  static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>  {
>  	char *survivability_mode;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 491629a2ca53..b03f4c7d0f54 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -5,8 +5,12 @@
>  #ifndef _XE_CONFIGFS_H_
>  #define _XE_CONFIGFS_H_
>  
> +#include <linux/types.h>
> +
> +struct pci_dev;
> +
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_clear_survivability_mode(void);
> -
> +bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4d982a5a4ffd..d0f66cc08aa5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -17,6 +17,7 @@
>  
>  #include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_gt.h"
> @@ -815,10 +816,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	 * mei. If early probe fails, check if survivability mode is flagged by
>  	 * HW to be enabled. In that case enable it and return success.
>  	 */
> -	if (err) {
> -		if (xe_survivability_mode_required(xe) &&
> -		    xe_survivability_mode_enable(xe))
> -			return 0;
> +	if (xe_configfs_survivability_mode_enabled(pdev) || err) {

no strong feelings here, but:

I believe it is likely better to keep the current code and add
the 2 new lines, instead of mixing err and new condition.


	if (err) {
		if (xe_survivability_mode_required(xe) &&
		    xe_survivability_mode_enable(xe))
			return 0;
	}
	if (xe_configfs_survivability_mode_enabled(pdev) || err)
	   		return 0;


or perhaps encapsulate all of that in a static function and then here
just:

       if(check_for_survivability(err))
		return 0;

the function can be better to extend to the module parameter
to be used in boot if/when needed.

but, really up to you... as I said, no strong feelings...

> +		if (xe_survivability_mode_required(xe))
> +			return xe_survivability_mode_enable(xe);
>  
>  		return err;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index d939ce70e6fa..5b60cbf8f7cb 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -10,6 +10,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_heci_gsc.h"
> @@ -28,8 +29,10 @@
>   * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>   * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>   * such that it enters survivability mode when pcode initialization is incomplete and boot status
> - * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
> - * survivability mode and provides additional information required for debug
> + * denotes a failure. Survivability mode can also be enabled manually by writing the pci address of
> + * the card to the xe configfs attribute. This is useful in cases where pcode does not detect
> + * failure and for validation.

or even for IFR (in-field-repair) use cases, where the repair or flash can be
performed in a single GPU card without impacting the usage of other GPUs
in the same node.

or something like that...

> The driver then  populates the survivability_mode PCI sysfs
> + * indicating survivability mo
de and provides additional information required for debug
>   *
>   * KMD exposes below admin-only readable sysfs in survivability mode
>   *
> @@ -42,6 +45,15 @@
>   *			      Overflow Information   - Provides history of previous failures
>   *			      Auxiliary Information  - Certain failures may have information in
>   *						       addition to postcode information
> + * Enable survivability mode through configfs
> + *
> + * survivability mode is exposed as an attribute under the xe configfs subsystem. User can specify
> + * the card that needs to enter survivability mode.
> + *
> + * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
> + * echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
> + * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind

should we add an example in the doc so folks don't get so confused
with the details of the terminology?

Example:

echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
echo "0000:03:00.0" > sys/kernel/config/xe/survivability_mode
echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind

?

> + *
>   */
>  
>  static u32 aux_history_offset(u32 reg_value)
> @@ -133,6 +145,7 @@ static void xe_survivability_mode_fini(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> +	xe_configfs_clear_survivability_mode();
>  	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>  }
>  
> @@ -190,11 +203,15 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	u32 data;
>  
>  	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
>  		return false;
>  
> +	if (xe_configfs_survivability_mode_enabled(pdev))
> +		return true;

this part is not needed right? as the check outside won't be evaluated
or bypassed...

> +
>  	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>  	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>  
> -- 
> 2.47.1
> 
