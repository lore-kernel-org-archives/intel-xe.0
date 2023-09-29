Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625BEE728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDFA10E13D;
	Fri, 29 Sep 2023 20:39:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4FC10E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696019970; x=1727555970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BG4q7uUgiXxL76L9D6a5xEQRritXbW+PjQoDqxuvHys=;
 b=XrcfnXJD44O4kMkDB3viXkMGLI9/QvVPBwKDIZstfRIcu9dq9sCCFJXz
 Y+EPJGUmWEp3xpvKJB1Kt3NhpnybJ1Y0d2STsIRifGHrxFboKxhqzGamz
 E3Ou/5cGxlo/aUGWgFDn4AeZVHePSsh5FwCSgIT4HOM7Q6DvirwK5q/77
 9hHl4xlkjQtfiY3RU+hcK0sfCseNaOGufTRt0uI4LG6cIhu/6mXwtIBv0
 MgXX/zXdLu8l7lDbs0UbWsX1/0LwbJZYctDteQ086P8q51lLZlwFVcdFh
 N6ul9cT33EBRK3Dukp88ANmJR+MVhIIGHAXNxUuTwDAdQtuVe3xK+6DOD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="970758"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="970758"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="923689048"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="923689048"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:25:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:25:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:25:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:25:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPywjUacz/mM+meDgi+8mo99qrtiC7tiUzVZEzGIPRVIW90Kj8DoOPii6hK9WQnIDKaKLI6kg4PlYIzXlUEzWmwWk9KWEKYoUq+A4Q/diTxZisAWY7KLh8HI1WaIXQ5JY6+nXjtSbblfhxBnBX+3+1cyjfGlDGaDqgBwl2t6K1q42cV5wCVhKx69G/docrn/1S9+K0z6kPxXyBco29HpSOKCSy9BZ0/A1LAEvmuaqWxX2RRltthHyGkjO3X6wid3ddYcaFTSNzJWJsI88RWdV+g9rHVtExgOgY05XSTNf6QnOjPe+ANGNpQT+m05bh6SLAR5Y+V6okJugiPOQp4rNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WymsNV+Wl1XUiHjrnMBL5GRHxQAB4GWcg1jTofrN7zo=;
 b=oFFm3k7g5N906kddFdCetUvEGESg2s7FGvrcMD0TxXEGjm+LSgxcsXVxT2D+r/fBJxUZcxmzoZDNk+jThytKzlMwuic68yTcmkvlfByVZn5bHhvQ7iJ4yzK+YE1uYO+6Yun9DiZ6InOCT8MLmczO4+9/ilvr4DCdrJoUsXfV62aExoRQrwru7x6D6ymrApa8Y9EucYxgIcS23bfwBpI8Y6otKy05MGl/SeBChtDgXUdniohf43FbZGG1GUSSLXyu3qPHxu0nirUeiVgdCohH/3OEN9ySKIzhQia7pnrvEAL5n6z5gyFG64Ug6YxZla/df2KA97VxWO6nd3bC7mX5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6894.namprd11.prod.outlook.com (2603:10b6:806:2b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Fri, 29 Sep
 2023 20:25:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:25:44 +0000
Date: Fri, 29 Sep 2023 13:25:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929202540.GL233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d75b01-2fa0-4784-2919-08dbc12a4181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MEtEWN9cNwwACPzaV89VpM2GYg8Ua3NnXBDfVtch50YikY5KKgK/dlx9SvZ16ZXLpK0fxt09zBkUJp84GUm3Hsq0WH7Kn2/h/rmRMxZBWKiOcVV0spuCpQtgp9YQgOd9dXGx0uV60zg2/LoRqnCrZzoXJBEZRoO0mvMyyVn3cvuw01bljO9uj+KqLZ3bsqH7uRRvcD83IpP0Pso7jVNOnbqxf7yhq8e5/3UZBTt01dwbsmnxPI0PsZAsYlWib7jvIBAXJntw3GVzBy2Fjs4/gFpmbesFjc0xyKTmlDgDLwSneWAThXIKLc264S6Qd5u62PYF1hC/i9NGe4C9vNeBdaG0yKbA9v3iOPdUmL3aIAya5dM7vP4M94ruqZgPzLPdLXGi3oKtQCW3uxZp1FVSEdg3wZEJyPSHdQMX3ORXATiN7YyITo2QxrPMuUO+IiMrVDkCT41TdrigZmDGjo41U8oYkx8/qK2w8yiYmnrqA25c9190N62eBtQFkEQo+Rjz2XX0tX9mjN02Be4DuoGlkdGCeMEOleQ4reA2iR8uTqUbq9TPkuoAdshPD2Y1j+Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(316002)(66946007)(66556008)(66476007)(6512007)(6636002)(8676002)(8936002)(4326008)(6862004)(41300700001)(1076003)(26005)(478600001)(6486002)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(33656002)(6506007)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oN89XBRfFHasWcZv0+iZl/HpX/ZFOV6NpY1s8tJEe0IDujlhSL+AMB0jn7J?=
 =?us-ascii?Q?ITjjQQ4S1z+U5vi/bvAIn6e3+r1JD3zYJU3AjXG+ep5x8SIPl6HSBWrHy35K?=
 =?us-ascii?Q?gZp4qAXVM1qHmKyjpLw8qYS1WMs4eSpTO523mACVLZJenRGhjJErC2Wfkp4O?=
 =?us-ascii?Q?cE7qDbjOwD8I/t7Zzbg0m9XExbYteqkQ4ZvobIOKqQ4/ZWuhfr/xKykm/eWN?=
 =?us-ascii?Q?ei1B2nokDc9LD61tJaMM/lRhkWS89jJsnl4XRL3oSqnOqI6CBwR2G131ERYS?=
 =?us-ascii?Q?3k1oljmFsNCAJCWudmWjV+r7OhI2dWw7DRvNSs8qZQR62UcYn0sqhujN9hYj?=
 =?us-ascii?Q?/voIHcL3x2EL9dOeguesYIUmK9iAYCw3qfPXdaf1xYChMMrZjUOfxBst7m4x?=
 =?us-ascii?Q?zw67zM2jtviTagFnMvoRnU/jkv+gPV8rYXPJKMImMIaX6oocuwtSEUKmFoO2?=
 =?us-ascii?Q?A43nVFiHVqKkAu2eIPS3EEWVXZFtuSzMyZvuzu5cD167/eXlSigMYsAoZ1hL?=
 =?us-ascii?Q?an4j88KcM1TxU/8C0V9rZCUilLp6jD9C3I5Jmc6V1FXhuuZ8f93Wc578B2y5?=
 =?us-ascii?Q?Gi4palZ57Wi0ZpRwlsP1G0ez2JJNO3f7461xxIPsfpr0SXAWEddCrda6BSgC?=
 =?us-ascii?Q?l1VT+AaD2qFjxjV/tp+8nQni+cwtaQy0HzBUNvvL35313iJ3tbdGExAswkEj?=
 =?us-ascii?Q?kc2EQjB4ayG3b7+P+nkjRxKmkJog9qUmFSnsFT/Ei9YWhmG0TLh0j9fQ926i?=
 =?us-ascii?Q?FiHZo1moKhdwvkrpZ3ANdRp06SL1xmW3CCGBhl9waQGIw7yrUoRVYLSzNF5t?=
 =?us-ascii?Q?BOFzSwkjjpmPNy4sdjTgIlFzH4O/c0YxFEQIjFbIZORZSYd3OVuwAOo299pj?=
 =?us-ascii?Q?GbyVDElg06w8FUT77K6uZLqCETXa5ii+jsiFxxFe54QbYGOpvfLsRNdw63Be?=
 =?us-ascii?Q?IiSLYWOyX4+s9D9AZwcTEcZp5UsRa+Dgv48wGauU0ky3ZsqVm3UBDjR817wN?=
 =?us-ascii?Q?8yjeivNhCeW5LNqkKPKTKckWhX2akTO408+th7oHV8e9RgWOU6ZCXeqV69ZL?=
 =?us-ascii?Q?acACao4vAlp/+Qq4mHX9ee5ggOWLPHtJgw6KYoMx/9+mfufbpGtrsiqMRZzR?=
 =?us-ascii?Q?QUQE/UcZ6K182iubX8ks+EYKOCIU4s5dCY2n+UWjsHdKsBImzxKqDNbpctsg?=
 =?us-ascii?Q?JDTCeT06jQyMkQ2k1CwY2wpa+h8YguZUdz1M41fQgh7USpNoGLne070hbuGv?=
 =?us-ascii?Q?wa4HNzuC4L9cUKp/9Nm5ibLciPHgScZWSwrgq90ODaSjTa5u4nYp74ONFEjw?=
 =?us-ascii?Q?UiwLZVBH5SZUBGj2Iud1TmN2sHIrrv9m4cF4h4kSx1fevJeCftw9dMCYllgX?=
 =?us-ascii?Q?isYQ+tdnOp/N0idVFkAn/PI74Th8jSix8Rs1EBfj7ngAlGKHpDsSyaSfPIIi?=
 =?us-ascii?Q?fAeOZZDxD7iMigkPS9mgCmNy0T3x5b1iHSiZHOB+oFSNLPGBwc6XESIYaRBN?=
 =?us-ascii?Q?YeKEZW2KZRJnFuNq+8aDjBk7WQaNdsc1i840O8DBtg/ifuKdVoIWYgRHvgvU?=
 =?us-ascii?Q?eZUNzgnizCe7GjZH6/HacC6HOMfOJtV5oCTR1K/c/BKilU5SgSy/t8FDFJzF?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d75b01-2fa0-4784-2919-08dbc12a4181
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:25:44.0548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PQUls7PZlKPAoUpjomSODL3hhVgivvz5fVGliZj8zKyqFnlg1hEWPtlQJVtjj1mNuDaY25c+C8wlHaQbS6LFiJjoNXHENWlGQ0k0ErNSZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6894
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe/xe2: Follow XeHPC for TLB
 invalidation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 10:02:49PM -0700, Lucas De Marchi wrote:
> Register GUC_TLB_INV_CR is gone in xe2. When GuC submission is not yet
> enabled, make sure to follow the same path as XeHPC.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Matches the invalidation descriptor structure from bspec 59311.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Although I am uncertain that the general invalidation code here is
entirely correct, even for PVC.  Since completion only gets delivered to
the GuC (which isn't up and running yet at the point we're using this),
we should probably be checking that the 'valid' bit has returned to 0
from the previous request before trying to submit another invalidation
request.  But assuming that's needed, it would be a change for a
different patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 99b54794917e..d7b3d008ce57 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -263,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
>  		struct xe_device *xe = gt_to_xe(gt);
>  
> -		if (xe->info.platform == XE_PVC) {
> +		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
