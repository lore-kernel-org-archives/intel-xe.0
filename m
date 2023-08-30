Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF85C83F12
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 01:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055E110E4A4;
	Wed, 30 Aug 2023 01:03:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439E210E4A4
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693357429; x=1724893429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uJEEZXH9FTx50LrjN6f0c97SOwr49rNMDJcQf2CdYz0=;
 b=b5/wCmGeos8LN9JbJ+VcAolw9QPNDkYPTiNQuXPyYeQb4ius5NLoWYiG
 zSNLbPhfNfhBcDA6VmZNr853+mnzN+Aq04awKIPy/a2fHoh+FiCCqCTs+
 7GyJfLEs+r0dAOZV4a285O9ACZfazy4UxucHPpw1ns7Ky74F5+/CMx/SC
 rpcyipb5L3B/N3NreJnN7i3NLgRRJAC21MZvQ4J5sbARGx+MIPEDKKVb2
 f1ZSuussB4paWk0cTVjzRYD1+1cKdc9ybw6gMMXMXmNkZkNFQgxiRw7Y+
 08rXPpv6EYwsGVurfhKra9SUD1AucWl6Sferk0r4yAfNqu8yRGBUzWSeG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355028202"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="355028202"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 18:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985551419"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="985551419"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 18:03:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:03:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:03:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 18:03:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 18:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR4Y80fYIWGIn4rCisJ17lOKtkmW5c70XwYO2AIzaSqq8lfrDYj1S59R0MPTh7JpdxAqR1qn5RyPZlv0TJ+637CjhM9NWnIxxlWih08E3tROvCF+ioH8t3GMbJoI9S3RPZs8JsVqz853JKD0TyupSxNYzSbo8dmzPcb+RN1O9Uxgd/DOdXJ09ZVTYLnvJVZNBm7rzpIWN4nHBR36jNdSo5kMT5wwmU+T67FEp4tqlVMLgSsYNa65lubl9SWMH9xVsptykqx0HUsD9f58ybtl7DA1kv9RzYTp5lukpHOHSDqHG5M+DcbqszYKiZd4IULmPEOqxLPOeImVuH3gqCoFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Un+607Wk8dwVJY6aBFanOU3z+dUDxgrNnAFxEBLawHE=;
 b=Jf9cQv6CJM+Fo4i8bfPUV0AVCGrYLP0Y0VYDC68idLnr8HC+OmqAgPWh9TaWLqjNSooIyar8Fy+1AyDaOII/7K5dKGypmbkFZh74UNo4rZqAovXg4zt1uRRVXwQmHE8BvB6jce9l2hDSdciahcGb3b/W5wgR2plwxNkBjzDkgrH5j7ClhHh7IgHcHunpscnGIdB7KoqBX7bQEzmAHhGJI5jl3AMrdJcI/32378AjSbARwdlUcxbT8l6mCgknZOnXPk9cD4jgJyxTZNaAxOBXZOroaRlsFFxELdU7Fj/iCw4OB9+Nfr0/CXduicC4DemH3tVaL46hvEPpZdYxdhwO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 01:03:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 01:03:24 +0000
Date: Wed, 30 Aug 2023 01:02:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <ZO6VI51suZq0AnNN@DUT025-TGLU.fm.intel.com>
References: <20230829181335.779696-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829181335.779696-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: c9754182-22d3-4b3d-d716-08dba8f4e973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBf0T8Vq5b9q4Ezgfp4EU3w9vQN7RJj37C+bPhLuZ3ZVy2LEZsl3xxsU8EVte7RuofydP7OTKygETSbOhOLQXVuvo0wXp4BKjesutzOvDf8DweXr9Zk3xqltJF70R2cadfj5UlawbEBUWa5rnnPd3aNOnCtPf+TnR/6YKyAKE2AH4fTQUdDb0RD4cByjvspJ285le9QSlunKb+UO1bT2cfsutFV+PsZ1iJOi2HNIW0pJraoCCfXV251ScImZVxuhsCyQ1RM45SVquSdLrXEghrPkF85itL9Nzeiz+wkPhvgvjLREdMslh2Lrm2CaI4uqcKZXJGpcXNUE8WPmEL33oyiKzLkV8tExI2pAU3zzpfjsJ1iSuNicARBOzg9/IiwFy4jbJeDaCv6cD4y6GZUGdBleRynuD+uNLWYKglWjK7BmzTkBCWSraqslROGrDuCsfx7ND2V+jzrzSHn10j50zGOqddEOJ/jW1LjikODUop+9br87RVKBrCTPTDlBjUcXzc+Z7zATwNLxm36iKPIsHZCUzLZdPG/x2Ckzn7r37lBDPXfKEIg1eXCJyu0TthQC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(186009)(451199024)(1800799009)(2906002)(66476007)(66556008)(316002)(66946007)(6636002)(41300700001)(6862004)(4326008)(8936002)(8676002)(5660300002)(44832011)(6506007)(6486002)(6512007)(38100700002)(86362001)(82960400001)(107886003)(26005)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHbPBTiiNTtP1agUmokkItuVS3GPXwALTzFwYxXYYhSxoYJQkMEsApkROjkZ?=
 =?us-ascii?Q?fxZ6VYoz2KLIdhpJIA3m5fT/Z63rj5URQqiUSj3sY+wiwFikFlV/oBRW69/c?=
 =?us-ascii?Q?Zi7xboVeh8Mn39inmawD1ur528F2LnXc2+8cWNFMVDSJIlV60GLtcK2Z6svj?=
 =?us-ascii?Q?PLyb2WacfRtShn32xrRZ+Td/fqpyNgINGC4HxkwKlFg4khOF/VVG1gvCt1lx?=
 =?us-ascii?Q?KrcWFxSBUf9zEh7MWhnqkxmpA/TD2DUAHBNB4OdOKcRpT5CVAxwhR25BU3I8?=
 =?us-ascii?Q?CFXzKnrXu7MqiIj+YbkuYV2aDkRF1L4CqKvjaTlLZtB4A4JJmo8eVqQx3aA8?=
 =?us-ascii?Q?EcJzQW0u1QyfwryPNqUgnNl4stm8IBzOi1ERHJPrP0hXgTOGWweo0XP3d5E9?=
 =?us-ascii?Q?wBpw4WmEDoCFQ0EAIOUirj7RQJmWaR1FZ7NEsIoCul8CJarFWcm9NkfswbXq?=
 =?us-ascii?Q?YQKXF6ebNShUK5u4lxIROIIN2PXVk/jSpyc52E2QbHPxlP6Bu8q51JtCcTml?=
 =?us-ascii?Q?xwlHQmLEnduPESoOd/Bx1PAp9moodkCKlXtdWSkaP+jb2bIknDHAHKj1llz1?=
 =?us-ascii?Q?ITvcKIwzMz4g+fT48ZFQiUzbvECSmSvB381B9yNu3sXvT+Eu7jJ5jD2wMURE?=
 =?us-ascii?Q?ZtVsNS84EAjKIWcICpfL+BnBSQHZy8QOdCq0a2SLtTTOlFiqhVEpusjtH9zI?=
 =?us-ascii?Q?dPrnpgubkVh7mB2SB3794RGJpMhwU07W1DDhCKogrrIRh1N9/C/sZFdeU/uO?=
 =?us-ascii?Q?HMS6h4EqVlERiax/nQb/CulimanSp+v2Cw+ef6whtQGmC35CUCu7gqe02JNt?=
 =?us-ascii?Q?/A1e/BCRy13Fn8wGWWfSksqvozDnA/+zZ5locCYn0Kk0+DpVmCPAStUVtz9a?=
 =?us-ascii?Q?WFSzVEs78Nq7cIkb5mdovDgwLN+AOGSGCq/qMykcV9PFH1OeEFgr/CQqWxjZ?=
 =?us-ascii?Q?YLtHMyB9TgWZuAIFwVdlawiXa61BmTjzTrsV54e0DIwjXdwLowcpxfwRIpiU?=
 =?us-ascii?Q?okm1u8+L0pfF066reTXulyM9v5bNA6G6zZT+a4ya2aQ47jPy9XCurP16e5cw?=
 =?us-ascii?Q?Gej5ua8Gmd2c9bonh09xGqpJ3HsYr605Nd0MQoDk8DsphYkW2wybqFYx1KaJ?=
 =?us-ascii?Q?FQ88i5AUwzJ3iM4wjRw3OOLn3+vJGSY25uBA49z7/jVzEZetF3yVKqBtFrpW?=
 =?us-ascii?Q?2fQnA6b0sMz41c9AJyqYp5aMiD4a6WMC6GHqdctM5yaz68clxlgGmgrKRIqz?=
 =?us-ascii?Q?ejnqmoyn5SqW3RW/FR949q3Y7/pUbZv2wOZ+auUgVvLbwCaqoQLmqLgvCDlu?=
 =?us-ascii?Q?RHyDNJ446bDRpcVzlxlP185fzIIVCGooNBzBFskDZasCAVqFKnUvCb3lxCyX?=
 =?us-ascii?Q?TxlfNu8JuHpIwF2DkgQShLm3ckOIPgnli/Ara2YkNvkGAopDrfqIW1wmjioa?=
 =?us-ascii?Q?bEhtoWfgh0cZN4IyezcLPyyExtAxD6ZM6HMd2YmkrLk3fDcoVQkvwIjfY8pP?=
 =?us-ascii?Q?c9ivnsUjOMEfTZjJa8nCcahMiiTBsUUMPIWJoOLCUskaEvO17QL9DCM41FE9?=
 =?us-ascii?Q?yTTV/PAU3btasBPSBQZw5NkOIyB3yxCAlQTMOVOvjYbbTOOEpPQ2LKaSQSNs?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9754182-22d3-4b3d-d716-08dba8f4e973
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 01:03:24.6508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggOO5fDCi0ujBhU2T7wE7wcKpVmyxd5g03ur+i0451tEMQdkv5y2c/5e5/yeR3SChyHr8xisTU3fpKBbKzznLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent return with locked vm
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 11:43:35PM +0530, Pallavi Mishra wrote:
> Reorder vm_id check after the one for VISIBLE_VRAM. This should
> prevent returning with locked vm in error scenario.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1ab682d61e3c..6a8a41dafe88 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1785,17 +1785,6 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
>  		return -EINVAL;
>  
> -	if (args->vm_id) {
> -		vm = xe_vm_lookup(xef, args->vm_id);
> -		if (XE_IOCTL_DBG(xe, !vm))
> -			return -ENOENT;
> -		err = xe_vm_lock(vm, &ww, 0, true);
> -		if (err) {
> -			xe_vm_put(vm);
> -			return err;
> -		}
> -	}
> -
>  	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
>  		bo_flags |= XE_BO_DEFER_BACKING;
>  
> @@ -1811,6 +1800,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>  	}
>  
> +	if (args->vm_id) {
> +		vm = xe_vm_lookup(xef, args->vm_id);
> +		if (XE_IOCTL_DBG(xe, !vm))
> +			return -ENOENT;
> +		err = xe_vm_lock(vm, &ww, 0, true);
> +		if (err) {
> +			xe_vm_put(vm);
> +			return err;
> +		}
> +	}
> +
>  	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>  			  bo_flags);
>  	if (IS_ERR(bo)) {
> -- 
> 2.25.1
> 
