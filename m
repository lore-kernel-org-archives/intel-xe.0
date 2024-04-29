Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E5C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5029F10E310;
	Mon, 29 Apr 2024 20:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ud2GKt7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EC210E310
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422298; x=1745958298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JQsIGH5w/CwFpY2vDpn+q7uC48+KyliW0z7tOxSXiFQ=;
 b=Ud2GKt7i7RHMuiwdqGK/Z7XIeXFRxkTrSnJeA7Snn1bKV8/Op4A6Cb3J
 xX50Bq5Ud86AfHt+5mQSJRD+ssPMuUnavmFZpI3F5WfewUqlVB/EsrwqB
 XE2u/jjisAoRYrZ9scskp6b0N0W699o8Szaohl5aPT5P+aweDlFc1pjA+
 256fnq+vjg3A2utFb7p3kP+rIARCfByayeToxojtenu5gMBrkZzv5FNK3
 kfMc/lfX1t0p0JVvGW+uF+Q4FL65AkYkYZKICaQKu+hfyhoiZhqAEmk+B
 KiXg9QzyFdquXvkJUUIh0nLBAxgQuJU76kXB93Gbzv1oL0yzQcqKtyNBD w==;
X-CSE-ConnectionGUID: l/kW3zNFQayNhzzVBekIIw==
X-CSE-MsgGUID: q3RD8q7BR4uZ6KGOB7tnYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20721658"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="20721658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:24:57 -0700
X-CSE-ConnectionGUID: keGE4A7kR/q1d/GoZjX0xQ==
X-CSE-MsgGUID: xnQ726g7SMa3fBJZ+S6r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26091327"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:24:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:24:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:24:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAU9FKsibqcyeoFF8O8/57Bo1uQQ6LoRZ5rOVgVbX2V6B3aG9DdlwZU55hEChZmNR4mJ/lq64DEQRJ8YzzhmIkk/R3jxvy2azSJx8Fxdi+gc1piH2xcXiIyyusCtTvE7W23z63/w91MOlPeDI3Bj3ub7WcM46ImZXgHzkUQhHdYFJX7zuRunmRueKOVXJE/3ItLd8NQBZBdLilNbxXgmnn9yj4PdSUhHuHxHq3DXR/XLPNYD3h0BDcKOnSrJ04WhD2vhcxUm2gv8onY7U9T1BFfXv+PJQYSCT75Omxb0QS2VNM2dkv7ecSSY4vYKDE7PG3mEYUZ3+qnvPhotTDVuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52R4R0WSxGdoW1b8tc0aISaavvrO3J9VXhW7mjqN9Hw=;
 b=ljZHKg/+RA21zyLBOwXnN30k0aOUjfX421uUM4l/WF8FwF32ItVw0Tj25BCj6eJ88aT+NzMfM6ZLGPjT/KbnnUDBt3XBOoJreaVZUo9gOODqV/tVZD4XaYDhb/StFn3MF2zmq/cDJpcWhMvLFVQvbAlTKAkJyYx7KOWQsfm2pwWBn8sLl5cMotVuZVN/QrM9r22nlpgu+ILLtl5ohoeRgtlwpe6+9Gv2kP2utU0r7UVhIJ9A6fP/yi3SwgMWtmdCJsamq7SooUsQ/8JeGilGtnS0LjcpHbCImYe8dapIfbE7G0XUc+kzxlo3F5JTyclqVp5dxtl+qPc5mrzDZUu61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:24:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:24:54 +0000
Date: Mon, 29 Apr 2024 16:24:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <michal.winiarski@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Move sw-only pcode initialization
Message-ID: <ZjACEXsn7CER4MbG@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e58d60-bdc8-479b-1c8f-08dc688a6ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sEDX8/4Uo5FRZtHOP7R8N0hVwOqWIjamIYGzAfAu3gw+h5AcFfWZijT678mA?=
 =?us-ascii?Q?5GTOu6LIAofc39h4f8++0Ni76sE7l77GY6VLGPvzSq/+YMDiFNvadMdz0pPL?=
 =?us-ascii?Q?Q0W9ziqxb7y4FZ5HyQyFJrTx5lAfGCZ/Lg3mr6h+b1joshKuDXPlpfu6VtRu?=
 =?us-ascii?Q?R7PO1yNNXuK4V+/+RfrpuOmxxRbCi8VTqjFqEkbDsgIGo8KM44d1puavfOwP?=
 =?us-ascii?Q?Cf3VQhPZ5tTA8U2w+rzZ2rN4hRspWWLB0ZXcNVfSq9lBBnS0kQw0BUW2VgrP?=
 =?us-ascii?Q?Znu0wCaj4bZ5XOGcNVHhn5nIwRrvg52NA3r3qAqLW5kGLTjEREG90lkEyr9A?=
 =?us-ascii?Q?feSWrs1Q+Q9vgN/jw+Bx3ReMxv5stXfcTIK+vTamg9kZFNWQAhcYHzwbIfca?=
 =?us-ascii?Q?0x7qrgV5i0/D84C0L/INkBovkeasGK8FcyZEROr1xpKpTLFq1pskSYtCu0h6?=
 =?us-ascii?Q?sJO42BlAS8Li9NaakuxsdhXSEWEIPLHUbhsQNPfD9E55ptxDRK9tD1872/sQ?=
 =?us-ascii?Q?7GjWfqxB5qOhhTtRoAVWnfYaPCbMCeKU+wdAKxGmSF5jdk98n0K8EKibXovj?=
 =?us-ascii?Q?KSGwYhXEhUIxZbpdrOiWI4mtnghkDIRKXqT+ZKmDIOAuHyYDrX1dbqkU2w6o?=
 =?us-ascii?Q?fChpz2WbcdQJtMiM2lFeEHPi0BlKQQOaXGL55XsLRHqhW0bHPknSKGk07wuP?=
 =?us-ascii?Q?mq/NT/Rjfi4cJWNFHC7s08pUazxAtGc8Rwt5184dIzo1G2VFeFlW4XHhiRI0?=
 =?us-ascii?Q?B7PdKha9lKWg2ZDaqw4MqFbQ9lDcVZX7YRbcGiX74hgpuyhHgAEOPajlpFkY?=
 =?us-ascii?Q?XK8q9aaGj0kWPIuXjnOWwMdSwbKD4+Vyw2zrkOvyCOpbTGvhMix04RrdObgz?=
 =?us-ascii?Q?CK1K0lBltKQXqWqihCSJpDJqYrQm2fXDKjVvYmZ51oAAVX3eYd2XzffOGz+m?=
 =?us-ascii?Q?npBLmYW4inTOrSPhLs5LT7BPbEQxGGQ6/C16I8ICHrxkbcEVAeorYamQrX6R?=
 =?us-ascii?Q?5VbGtrYNfWoZvhP9mJxYqmzDj1eHl5XNHMcFOykMLhtotj4OyDiVuhvexPiv?=
 =?us-ascii?Q?1q01dSnyGVO8sEPktmf6TYQqmkjrlRF5YgB8CtXKLpntN3u5ZPyy67uDnKXQ?=
 =?us-ascii?Q?vXudUg6i7GTyEqnY8LWR+zS4su/ob0c+E52te505XnjcPEsghqrK6uCUvsHw?=
 =?us-ascii?Q?yg4W2CsCoPeq5joWz+brkzF9xKDfxgMlZtLnzxRX5mTisYg3CLY1mZysK6+m?=
 =?us-ascii?Q?PzKc0089hYt+LfNk50Dw9XiXXjE3sN63Mr5NeseaVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D0PtLJ/8MKWxOzSKyfS2v3COT3gWTuCMnZaw57M1GJoJwLH2S8DiQrA1y+ji?=
 =?us-ascii?Q?x3qYyvDpU0mmZz2aQxVBTBussnBAd964JaBfS/NVr7PSSg9Pt4MoKAsS2OVC?=
 =?us-ascii?Q?6ut1z1MRTrd/Ko4Jwm4gkBaF/Qumu3DCIiCVgHg7x9mM42uFrkKlzBkHDCSE?=
 =?us-ascii?Q?yeby8RZ0bK6iUoT3FKWow8jZdjvy+m+dp0ZifKDMM+hex6lIdX5hiDMLhT86?=
 =?us-ascii?Q?CgAAG5xp+cxdyG1HA1HTmWirDitBsNkR4ZnJTKhyB82mNXW2imAFQr+7I3Q5?=
 =?us-ascii?Q?ealcyuVaKXRh+kMX19yhjelp4jqw4QshoF/WJ8A1hPCjwiC38hTEPKYmwxby?=
 =?us-ascii?Q?qDb5N6NvDM9hlvwp8EngutyczoTd+ZBbbL2Ixf1MMhy6IdKbiniF2hIgJ3LG?=
 =?us-ascii?Q?AcaMT/mAJmRPjEw10DdVoGtV5WzbmS4FomL74Xqly1x38/scIeZwBUjIqrOY?=
 =?us-ascii?Q?bUoOemaVjv9JzDyu8dWKWSRK7GfvL0MAEhyE3STnVnPzoPxcvPeV5cGkUtkv?=
 =?us-ascii?Q?JUgI8uOzgWyD4cMAq+tH7mYn+WN6pdoAX+WZGZ3SK14xcrejpFugi+fb010V?=
 =?us-ascii?Q?HOplxqzW9dbEupg3lkx9BMqjyfbVe1XAQwvAjrBMVsjQlkQx4Yj9/HIK4lo0?=
 =?us-ascii?Q?Uz0hLWk6dNMvjAHpi5eUQO0VngKdrai5g3N2SB2FHGf6P1TZynQ6sU/3/Dil?=
 =?us-ascii?Q?gBPgELYhdsC8msf9w45H3Mm/D0KYTKbjKNa5X7KYAErZjbFnjG+2nfevmD2s?=
 =?us-ascii?Q?uf+Avc0i8J7BEbv5yNoyMna0Ex6pFl/pabjvK05bye4V3QxR/wsPgLceC3Ia?=
 =?us-ascii?Q?U+ZU4QQBPNvtgye6eEirpo4kYA5If8Ql/RRGlRU5hGj0x671O8RlPBSTcrN6?=
 =?us-ascii?Q?55wGnK7mN1uFuPP9F9JoOzidmvMOF1IpxYnSkLFhtyQ6v1+V1a58XD4UKf+c?=
 =?us-ascii?Q?YRhEgwOdSKWiO6PgKWhjRSSuZVHkuJCGibPc7KK5lQtdsGn5Y1R2YinuLxJF?=
 =?us-ascii?Q?L/n9mifekgtH+eCw/2cjH+xVwFNxZLbYDVLbG6Vvd1B631XTrzeHcHqzHZy6?=
 =?us-ascii?Q?rQtTi1gvF5TnXXvn/IDDO5uQ2vlfCRoo3mcXIeAghFDKtGtQxyS6qIiG+TED?=
 =?us-ascii?Q?OWv9VxqIbn7y9SwNfSeV1rHvvhUc1rtpnxFWvIYhISwjpJ4jSNxa0bmPuqD0?=
 =?us-ascii?Q?Vy+reeii9aDagF9xMePXO+8uSH2dm2SWURoAZ/fp+NuAEMImfjzP/Gltqf2j?=
 =?us-ascii?Q?8M/c9UKEDaw9BfZg++N5SbPTbKEuEP3EZiSTxGNtveoRc3C5z7KxxQl79Wju?=
 =?us-ascii?Q?0kniorKngLREUsbPf5mafPf683wRMY/kNSCsAzBI2AooplAYjde+1u7GvlPi?=
 =?us-ascii?Q?Yv+J5XGnJSVxyn+I48mx8se7GKhctEOR5j6s8wTs/Sq+ko2Kt2qtcGIGSIv6?=
 =?us-ascii?Q?rl+iNNvy2Hk8sRyi5tdGoMYWkhx59/BvjONDFqNFf6BGV4/lVrHQnGIV3vGJ?=
 =?us-ascii?Q?eAqn1xhMJqmoA31esE7XPVpsvGHCnKLttRwr7QbRltfiQyJk6Atoy6ehZJOZ?=
 =?us-ascii?Q?RWO+a6/VTCSSUnxtrbfa4A6RvHC6vu/XVS5yXgis7kFCCoP8qjJc4fBpMdfu?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e58d60-bdc8-479b-1c8f-08dc688a6ddb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:24:53.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZezAdkcIQOvqBkjdB6kVEjHSHeTix/uH3nEk/ao5S3guseD0HWI0MupsxLJQr2FSX6WYpyLbNkWmPNDfPajPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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

On Thu, Apr 25, 2024 at 11:24:10AM -0700, Lucas De Marchi wrote:
> Move it to xe_gt_init_early() that initializes the sw-only part for each
> gt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ---
>  drivers/gpu/drm/xe/xe_gt.c     | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d090c4e7d57a..c0f2cf0dc006 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -596,9 +596,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	for_each_gt(gt, xe, id)
> -		xe_pcode_init(gt);
> -
>  	err = xe_display_init_noirq(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2e8efce2799a..b6ab3e0cfb64 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -44,6 +44,7 @@
>  #include "xe_migrate.h"
>  #include "xe_mmio.h"
>  #include "xe_pat.h"
> +#include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_mocs.h"
>  #include "xe_reg_sr.h"
> @@ -329,6 +330,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_tuning_process_gt(gt);
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	xe_pcode_init(gt);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
