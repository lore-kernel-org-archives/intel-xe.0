Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31088C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 23:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8FF10E03D;
	Fri, 17 Mar 2023 23:26:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB4D10E03D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679095563; x=1710631563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JMZyfNzity+BbAX9FZg3127EyKUkelg40Z30etrVQqE=;
 b=W5gV/jrn2mEWiIHER0byFM5DmugUMPhoZHnuRNuJhIeqE8gfYbcArSoe
 1FdeqQegHmUDr6aY9WzpW0qAnTrMiS/Isq5JzCiLQFF5N0dvgMNH11OUH
 22P7wy/NG4BqEaJTqu2jymeMHkLlqZly4pDXbBb7dmF4OP8esSjCXLCJk
 n5rI5MkUdFJytQS9dn723KQtgoZv4rwhNVKmdGceGHeP251+6imEXxL9w
 HhcQ7DZ8OKHpyEFJNf0UA32R5Oz7acbe4DFa0LAtTfZGB6EtWKivYJRgz
 uKGVgVwVpU0+BINYA4wcLTwZUPozbfjkq7xJtNA23On/iZYmy2mhTYUc/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339921120"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="339921120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 16:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790920471"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="790920471"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 16:26:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:26:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 16:26:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 16:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpQGvsrPnRFj/GV8QCcDfLtr5Ht0nnNlTJwgnX2yiEtF/bFmFzQMYaMxkrFSHaYxb0kMahXx9CQqlPtw626z9D/VBMiokZEr8n2jTsCBn3wSQDTpQbxr64kO/csHBpsWCTljo6tgZl8AkNa9aqVLys2o3dqdNndu5+go5XzrQuw8QZ4HeJe7VTw6QEucBR5jIFzYzJdGmJRLMa4w2kRBgCoNBn+zzJM+q3rCiwFf3Us4DGwaMvbzwYhDJQQ7vmaHkHXBXEa52niWVci26wk4Qs2eLcnoZuCtfMc/Ku047An4CVekUAFGUiR/GK6tATOJ9wD74Sw58tPnLZTPN2uWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajPL72Z1lPOss7aiV8GVSTa7xIIryCgp5H5DO/fcLnc=;
 b=D7rsReSAj4UoMYyCfGcB1+jiCudjBX/HbkpO0ZrwgSp46T75/sIcd7vqbbsIZZNVMIvK+x9yHrGmzvxIBu+fyKhSquFyxIKWjl9LVFesKPyt5E+Do835vsOvg8YmNoJjE5xZNP6tmH1yA9K+rBhl10pL0QTYBi2hRoiRcmFtH5BYYaapCuCDjsWKHHyz0Uo+8EmkC5XprPodnEK4Z9MP6Hr+cbzs6rL5MQ3At6pgcgMa1dTc8xQnh9GIqBhKvtKXoSDHf8xZqpX1kNFpr4ZkuvcN9E6aWSmZcLydITXPTz5hZHmaLoa2SJobh2Yg01pcb3IZNrdWGKEStYItkc/qaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.35; Fri, 17 Mar 2023 23:25:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 23:25:53 +0000
Date: Fri, 17 Mar 2023 16:25:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230317232550.GX1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230317223441.3891073-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230317223441.3891073-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 72989da5-64fe-4b10-082b-08db273ef39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3KrdV/zB4qm2Ka5U9ZGHwSvkrMQpLBuLapGXZzQoNJyQd1t2fpNyObztLXBifCfvB1tKf5sznK5QjtdojjzTxPypn9KvygMrNmYx897PhzxQt4o/lRWl0BwynXDuGyOrVoU9/j4j+uENIjBjd+x8qSLyaIU1e5pmCw37mp1/95NCj1r1hR5lfXr5t8s+w6Zx+BsipxoTfe2pPcv6n/zNek9OHjfwmyJZd/rk/HL7zsGTc5COvxzWYHUjNfrULi7udZlubcm7jMEM8E8L8vuzjT9wB/vpqhsFFWrJUYksCNAb7OK14aeSYi7eDGReCoQ01bZ7hxHIBXty3KvSfQ8/EJ+M67SgajKhbXN4V1Z8LdhTk82etRRHInp7nph/PeGA9Cd5dhdIFjZOZdE4Rd6xJABG6EZKOHaySfPS/PiPa5Q8IjW7vtxsSf/tLsNOTSryCQ6EFxjbOt8dDNdJdJ2o6UqS4qroSLaH1h41n2LLbWPYph+AA1zIFwLxIxeSqmhUbCOnfPteq0wrhcgrzw7uP5zy8wsunsr6LT3uRoBmHSZ2aIyh9sEYzPyrTZMPSW6NaWonRWYxefxMFoVwutd99AVZjwFD3o2oHm6lfyi0zP2cXsW/ATNkJIqzrFX5gRMS2B/CkokMHfplA3ZEqaX4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199018)(8676002)(316002)(66946007)(83380400001)(33656002)(6636002)(2906002)(186003)(6862004)(8936002)(41300700001)(66556008)(66476007)(4326008)(5660300002)(38100700002)(86362001)(6486002)(82960400001)(6512007)(1076003)(6506007)(26005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEg3hDTIp+Ri2xHkmrYIR4KTN0QzKVv0zs5L3c6N83a+NpUZ/Do4dLfDibND?=
 =?us-ascii?Q?4c96t7qB6CDpPyLrUiF7wILrAmDjMNs2TQEEG8NLT6yt/OWoJIfzKsYSyPm9?=
 =?us-ascii?Q?ZldgXMN5LvkBaBsNfsK9b3iuKBJyDi9uov5IOXKUIXwBZq1NfQ6p9hnTnICY?=
 =?us-ascii?Q?HSjLkW28PS+t8s1YftWbhn156oCs10x0Dyf9wl3TMlfRP+Ftl0aJX2mBTTrd?=
 =?us-ascii?Q?tyJ1cj0UGRzfMDJmQzJSNqNlgQYQRlKQCVWSXc/PGFeXYXepYmk79aAkaCTo?=
 =?us-ascii?Q?aR5SEQedBpkbK/PC4OZqwN7Fddn5PBEkYFl7ZdP1q54n3ruwDfzQcHNBKZjC?=
 =?us-ascii?Q?mW2B88AvhJKvCclZWbu8xQ5hK3CjSLjM3NROfqK8CKzhdrwjl8+Dh69ASKgR?=
 =?us-ascii?Q?p5Fnkik74Gxf/qOr4NAgAHpodHO0udjuRaVUE9vW3rzc74HRZ6F15r0A3cK/?=
 =?us-ascii?Q?yPjitUQPLmQ7mIUHT5SpaDaWRUpHWSAKM1lLhDAci2Ckl4XhC0tTOXnVTVLo?=
 =?us-ascii?Q?AgYqVzxnR4WpcrB0kHkL0DHddV1OvCVmIDkw7kgSlXLcjjjzZkxcxJJgK2Fi?=
 =?us-ascii?Q?3+z8LSMuAe4hcw7l7bzKjUbirRPHuV011tgPlHaFeyS/RnGVXUm30yQaECMK?=
 =?us-ascii?Q?r48KElpEPZzgeGBX+t/BcKf7a0cFV6sSvinjBh/7lHoAjC1UexowFd3DbcYC?=
 =?us-ascii?Q?VDS9cmg8HQ/8YRxGF7Ou2OLlytKpC/lVheX20d6srBfHlC3urk+qov86iIj1?=
 =?us-ascii?Q?FP+EiZwdx/dnuuRSh8YLmiANSkUJt2z/twmF9SrTegNHsL3CKJ9diuT7qK0S?=
 =?us-ascii?Q?7IjXjwLvpfBGPpzRgCgirKpNOSyyj6YXpEHRI59Z6CoWqm/izWcpxDdaDDBd?=
 =?us-ascii?Q?1zU4katHa5QQgApu1NSUraJHUEZ2pm+zC4ifEIkTjn+yQJoWkv1eFchNJc3e?=
 =?us-ascii?Q?wAYqUTeKTgqqcYxwgtmnBuM9YrB6L9UIlwBV59d6emoZ607I8VJBz0uAAa9r?=
 =?us-ascii?Q?hZWX0W77hsNzIliE6FKjF8TAvGdX9a/W+AebfYLDKqEIquFVxb15Z4UQlFcF?=
 =?us-ascii?Q?aaCRg471CqcBjrthAUt7eX8CII1vgIq/iFN6pU9P4+W/YL3KM0GT7+fVRpRZ?=
 =?us-ascii?Q?k+iQ1qYc+mpx9BG+d9knM5Nh2PF35Kpvs4VyxdPnuvp3NE8ZO5485ue+JctG?=
 =?us-ascii?Q?mvlWECBd9o4h7nnJ8Ss/s3bt0uuqkU9FmJ2d1/hnkwYuH3z9o0dUzC2xrj0Y?=
 =?us-ascii?Q?oSSPgU2L+vj8ng/Deg0eWyqzrhE/WIiRBf4ALWKWkuvBnDt7WvvRmuPQ1skp?=
 =?us-ascii?Q?/DxGiw9awO9kCJu+bEbkfGJc0LV8o32DpktzzHmEflz1oLnL+ev8FKZuikS1?=
 =?us-ascii?Q?OikpaN40sTGG4AXQvcc3iDEM/l9Edxpb1XjJOl8MOrnVd4GwpAYLZFNJNVCh?=
 =?us-ascii?Q?VvTmqcxoD5T5t4aLbCy4I6TgZhcewjDj+cjvxsfGmIF3rwRwMhRJU07jJstE?=
 =?us-ascii?Q?0louLXmamLQzYCLHKtMbH6Y/cl8Te2vi5LYB+g9SkKJlChELbF00YHYvxx/s?=
 =?us-ascii?Q?hScTQ9uD23Y6dEpKhBFbE/gOPBnOccwd3V/fCFmEyssL6kz3IncMHc4XwOrc?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72989da5-64fe-4b10-082b-08db273ef39b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 23:25:53.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2ZyVFqT+U2YBuYGnA0MkXIslTFpjfM/Nl5DxEB+DT22Otd1Vx+nldjOS5acWkxyHcIjxKgmST8kvZkpeP15bxgYvSbavLwd3GMzDmztStQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mcr: Separate version from engine
 type selection
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

On Fri, Mar 17, 2023 at 03:34:41PM -0700, Lucas De Marchi wrote:
> In order to improve readability and make it more future proof,
> split the engine type from the graphics/platform checks.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> Easier to see the code move with no behavior change with:
> 
> 	git show --ignore-space-change
> 
> 	
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 909059112179..5412f77bc26f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -290,22 +290,24 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>  
>  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> -	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> -		gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
> -		gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> -		gt->steering[DSS].ranges = xelpg_dss_steering_table;
> -	} else if (xe->info.platform == XE_PVC) {
> -		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
> -		gt->steering[DSS].ranges = xehpc_dss_steering_table;
> -	} else if (xe->info.platform == XE_DG2) {
> -		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
> -		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
> -		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
> -		gt->steering[DSS].ranges = xehp_dss_steering_table;
> -		gt->steering[IMPLICIT_STEERING].ranges = dg2_implicit_steering_table;
>  	} else {
> -		gt->steering[L3BANK].ranges = xelp_l3bank_steering_table;
> -		gt->steering[DSS].ranges = xelp_dss_steering_table;
> +		if (GRAPHICS_VERx100(xe) >= 1270) {
> +			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
> +			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> +			gt->steering[DSS].ranges = xelpg_dss_steering_table;
> +		} else if (xe->info.platform == XE_PVC) {
> +			gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
> +			gt->steering[DSS].ranges = xehpc_dss_steering_table;
> +		} else if (xe->info.platform == XE_DG2) {
> +			gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
> +			gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
> +			gt->steering[LNCF].ranges = xehp_lncf_steering_table;
> +			gt->steering[DSS].ranges = xehp_dss_steering_table;
> +			gt->steering[IMPLICIT_STEERING].ranges = dg2_implicit_steering_table;
> +		} else {
> +			gt->steering[L3BANK].ranges = xelp_l3bank_steering_table;
> +			gt->steering[DSS].ranges = xelp_dss_steering_table;
> +		}
>  	}
>  
>  	/* Select non-terminated steering target for each type */
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
