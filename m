Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD257C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7AA10E055;
	Mon, 12 Jun 2023 18:14:16 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7D10E055
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686593655; x=1718129655;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=agCmToKHC77TM8q4LWCI1td+UeTEomzleWq9cfAs2tc=;
 b=J5qhyYa+j8A6R+6oLhloIgT525LHblW3/zcsqBbWT25Kad+45Vg7RnDq
 cZJYRNwUM++nFG8jvZvTkNtmtLQxSEZD4J7ACxyLvq/FYDJA8eH4pzNLr
 MLqEJlJ37UKJrwLvWirhgF46nHvYTDjO9qTW1nKU7Gl/aW0OGmQH3q/BC
 2KiFFLlVtU14JqoQx7TMPqbGxEUygkGcm20AcL5g3vNB1iHUN+AnmmBPH
 wt1ivQEkDX5kn+HpR03icv5+yJdI1ba4QB9UoyQQzW5FMO9tRXFjPW0Td
 f+L69tpofzOwaycnHY2Ewq4wnsXQkQAKCVTaKuq002BoDokBJPSN3R97E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444502453"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444502453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776492771"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="776492771"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2023 11:14:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:13:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:13:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUW5lxXYPLS2P2gD7CqxldkVZ3WVv5AEByqEX+9gRufkMsxa5Vpibc8XBZ6SeAaviy3cttfIGw8bW7bP4uAZZXR4eZ+Ikx3tvwciSNqTqhWWXgvBU++uajUyCFsOgroHeLGxdQGp7Z2e4qe2EOJ4ZyWCAOB6fIp1YhtMh3D5HBTKYvMu+n92cOLujaPjU+1Em+jvOUnmLT/a6PiySMl4hf9BOylVbTNRAWuZ33H1/N3c824BvtcgJbCG0qko/N1J6jyvpibeSTwCjXb7XS8pOhzbBp9NiAL91L8sehkeRv9GA5e2R6eXFd7B7/9yRL4u4f52V+T2kDsd2TjzBvoTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaBesBGn/C/om3tDXlk7EVwLp/2BZ1S5WmyfLkiwqc0=;
 b=DW1A5i7fLwrHTSRbi23x2iJChyShC2coZniTD8jUrQHPckQT8DTuraQgACBnJlFZNlk8YZyfpLRPdVd91hiOVHlKfEUDIbfucJgh7Fmx9DW1amEF9073Efd8NrOhCVQlx2UKOxXFuYvqBluxX10O7Jx9ijLE00dUk33aJ/s+4bp3JOKSDe/8ZvDctQOrZojBAaRhkovtIOLW9SdhxQwdvoV6RTxmoOcm+h7CLK3z+edV/jnMkZTz/qORGv1C02vm5zOckWUkAKO5rHNT9QCUaEaic+m1HYOY9IbBbA4gU6+A/7iGsgDHkLPWIxn9UFjf00H2Chc+oRYm0ZWIQwFzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 18:13:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:13:57 +0000
Date: Mon, 12 Jun 2023 18:13:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdgOrS9n3daGvK1@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230612171225.88689-5-matthew.auld@intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ace21df-73fb-4509-0e4a-08db6b70c9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17Y0ZRBrCpkl600XZtRFolJpY6yIfKMUT7MQGwZa7UHBjpqbprTke9mjwRnAy++84u3cfIW846qROF9gGEyT/6ufdZDsESiJoAETLpGw2kam8Ju9ZFCqFPHgpSxcAXozJk74oKEL3BQOSsmKU/oDRFT8pTQFdizL3e9yKiA64bAsw+cuFkrmJptKrz78SJmEgsm10KeaDtZwMd1yIEIq7XTAjqW9kRvSopU+J/aXz7I8brWqH9OSZCMyMGJIJh/lgtuSwkjKxW020joCPnZhr3wMZaWS9k6ZDAShC+XF1mHib1jMHBzipk+7dHz1Tkh3TlCipc/5cbzvXNyevJZayGVbvORd396CO3TBIv/3dU+Ic+iO1NOHRmgxa643TPOCycvnqt3fGCsaXnS2oTjm+COEWhhx5cjQSPpQHQZciCryVeszFOvzZr4woCYVDmpb1gM3DyC6MjDVPqAW9Bqf9K4TIAJdTs9rKkbMCUeZEDAdKGSdicoQSsy0rhvsUOKT0yD59vhjoe2eH7CNsNzhM1Z1dIKnxogYJ+6dSvd2IY5J7rfgTXM5RnW7akjOz8IO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(86362001)(107886003)(6486002)(6862004)(316002)(8676002)(41300700001)(82960400001)(83380400001)(5660300002)(26005)(6512007)(38100700002)(6506007)(6666004)(8936002)(44832011)(66476007)(66556008)(4326008)(66946007)(478600001)(6636002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?stnLLnZ1+eD8ZZPFlm3VUmMULTnsnDwOZAZ5C/XwqWR9rfF7wmesPB4BUEHd?=
 =?us-ascii?Q?csZpjy3u4RSz2sF7EC8BlwImHvNCnGh7Yu/fHVsSjim8gZkOvTRUBI/Q6xF0?=
 =?us-ascii?Q?unz4WcRFUZh0+JjhukpyKPINYDEY+RAUP5BnHj6MbjXQi6c9fjTXrxByLPA2?=
 =?us-ascii?Q?niLaqWFCug19lHzhlsspl6ABWlazDF7DOs0zEyo5gyTbVGMnCjgpC2sUHuSk?=
 =?us-ascii?Q?NisOdDQS4pt4RPpL5nyTjSmKxn5hU8hozj6Jqz+2crKqJV/eq52RIFxwu11k?=
 =?us-ascii?Q?9DW80B+7waWriRXPGFKB2clNVY9vrrWZC7L32uoPm2634WNbwzHGTrm/WW4w?=
 =?us-ascii?Q?eQul+Gy+ifZJDDiLRR9AUkMaDiJLToK8jVx2ZgHGTQNGz8DjNAzpexQtgY2R?=
 =?us-ascii?Q?NFuBknyiayKdAX10mU7s5tQmXfbrydGCmOcCAQX1yghprpWdMK31X41CoGMq?=
 =?us-ascii?Q?by+WRWGQuMNv65YEpksjWxu9aSbLqKONDOHXH9x4fsn145RD0nlnqe/pYg1y?=
 =?us-ascii?Q?t1pc24lcyaI/wZ269EYmjlw11SgCHN90/nAF8p6aUy+IpoBPVo8nQEFBDwjw?=
 =?us-ascii?Q?6k4CcjFw0ulNvFwobG7nAjar/we6zi2hL0fPTZP7rCTAsT724l2Pi181Mj2a?=
 =?us-ascii?Q?ww0QyK/bC9tnxApr1ANB3Yp/y28w3QVNMxvbWbVS50RLpMAXFYuLeurD4sTA?=
 =?us-ascii?Q?AiVvBiNsRsHS5HmIYg/l4rgR+VzRleAR3ZbyEmo8jRTFK7fS6+u/nvBvd7Rn?=
 =?us-ascii?Q?hezuqre61W1ecqBn9MjqEqYpKYyk8dEMTvzauDEsbjSiypYrKrRQ85EdVe9c?=
 =?us-ascii?Q?G1q9LceHE8rqA0Vra0Qo1iL+wEtFbFzX6Fg6fufE/kMGVe7O+oEggsDBjj75?=
 =?us-ascii?Q?XV+vKFcgSOe/1cPXwu8H7scT8+7NeE0FDF0uw1TltzrXc9EO24aVMxHCIria?=
 =?us-ascii?Q?PRuQF68r6IgX/r0u59Csa3mWvWdEdpxg2A6XPBK9jo94BRzN6HHnhbEnzMao?=
 =?us-ascii?Q?9Fi93gJUmBBImsAZhEK8KJ1443yEuEP436zCBTLamqlqu82EumZitQD/llT2?=
 =?us-ascii?Q?PgBJowxxMoDbklV3HIsSzaV5eRBIOCiw34TYCNvEZp9bT4Gge0dvcPNQmpVC?=
 =?us-ascii?Q?tIWXlGNRKthzki/UvCQg6jDu7yOsgU8h3wv6O1YDLDW1MsUUy3f30g9+gwil?=
 =?us-ascii?Q?YeDi+dKUzWDyIRkzH2438j5L7oG4p7M/DTCGCga0GowqcT25XldoYxsfU6bG?=
 =?us-ascii?Q?X69Y6Q+S5bsF+XTxHSXR/5xyLv6KdJh0GaKhioedIWPyR9LlROh017+AcxI0?=
 =?us-ascii?Q?B1JCWktgKf12//k+OBb/bvwj4OwWYd5sYOyupZOrNrXh5GjZ2vRc1ko5178q?=
 =?us-ascii?Q?sj8TRCHoPMj/wpGF4Gwjdiu7rRkNTxHzei4bXS2I3MEBEBa85jCFn3UR4kVa?=
 =?us-ascii?Q?FTQFAbX2HDj/DiMWPladi9bdDgj9G4hXE+WlFcA6afs5AxokD6BYIpm0sPyQ?=
 =?us-ascii?Q?NMNoXrxILRMj4jbnbYT5VyLNB9nHRYrXHv7dCVAYR8vVOHjtrCLb2dnb/8RS?=
 =?us-ascii?Q?EBftCQA1QcvL2RVIpuMmHx16eB4V3XAqtxXXXKFP9AKHnAJMmT4tS4ggwjiu?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ace21df-73fb-4509-0e4a-08db6b70c9fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:13:57.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0+wz/F8DsiGR/wklX4bE1YnWmnLNb4n7DiDwsHR8ldTR7X+GMMP1ievwNW2ChDOM2eTch8qHCF7ADsnuoGyDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 04/12] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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

On Mon, Jun 12, 2023 at 06:12:17PM +0100, Matthew Auld wrote:
> Any kind of device memory access should first ensure the device is not
> suspended, mmio included.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f7a7f996b37f..cc5ccbef85a4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -476,6 +476,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	 */
>  	reg = XE_REG(args->addr);
>  
> +	xe_device_mem_access_get(xe);

What about moving xe_device_mem_access_get/put to xe_force_wake_get/put?
Just an idea, but this patch LGTM so I'll leave it up to you if you want
to keep it as is.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	if (args->flags & DRM_XE_MMIO_WRITE) {
> @@ -519,6 +520,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  
>  exit:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(xe);
>  
>  	return ret;
>  }
> -- 
> 2.40.1
> 
