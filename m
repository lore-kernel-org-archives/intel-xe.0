Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D161C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 22:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAC010E567;
	Wed,  7 Jun 2023 22:48:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEB610E567
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686178093; x=1717714093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oa7clwIr6KcepIsO81ZlIa8wTXJ6QsOLy1QBttWrgMU=;
 b=emBJHuiatvBdJjuup/dte0hzDNLSG6OpTpaKiMM9tqHg7xOz7bvDu3I7
 4le6ZTsfDp+9Yl5W1WOP4mPFrEG2zX5yp6gLofPBIbRRYN/CFJ9sGuGA8
 vCAWT/kyVV/5JXiISSk+syk7AW0XIkEY5vJNUEW5Ri61mcC14JTTxq1l9
 pxAUO8/N7UPNiMTT6JOGvSrqERqYsleRYAANsXHA/qvm0QJoJhdydqBMu
 zkS4wcRx9d3hOL+rgN5kU0oqkVOTs9rJe7Tc03jLHkPYPP/03k9Bw1Icg
 rYhsJ0zf+3giyv716JRWlPj6thJV/eLUNLSr8UCsnoyHS/GKJC0IDwM5g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385464102"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="385464102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854083887"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="854083887"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 15:48:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:48:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 15:48:10 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 15:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2v/Mln3YyDmCK60j/pOG916FuPMxsUDoTPqlQzKD4cE6ufP7uRo2mBG7l0tFJD6PCMMxuB5RoP4wLH0dMW8dafe5vBldliPY3HoHHxuciwDEur4ik7eRx+e01WFSKRaPq1rX3C0bL0LTvwDSP0FA98r2Zk9mhs4jnyXXThUjHBK2oWSmeH347er3lnCg1zoDP7Ci3JV1TcduO0APbPuo8TO+aYIwxlX8NslB9vPtFY0T6vfdROe/Te+HKYYKQZdvkg5j1INeM7FXd4RpfJsdRD8Ewn5JT2JqY8KJihRhgv2Gpp63ayuujyb6sVg2Un8Qy+K51ijKeUzx/2iiPSd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev+IGwtQUZd4fsXKO1EzM2ZAfrr5QMGhHnR9nsMJoLg=;
 b=Bc6EQ+sfYiLBwsOlbNuobimxB1bPoW0GmnxMhXKuoRr6I02jyaMGT0RFiVhPzSoQcSxQBRw4tV4M/LqaT32xcOaiUoQFmT2SLglaHA0oQahESGrHXKW4OqWlsu8Gr2r7ROC8lgiAc1YBEKG40s60IXFrzcgun0qYL2n9NJ3+/tebrXI3FsiLPc2BmqeEBcXSFrK9igtU69slPHo5S1497E6s68uMdRsblmBXobCTmF2c8ZGm9LhdYWDpkuO9tlph/2+T/ny372FwSQXMye8p8FINZngUrGjs4JqT/yjhcdg1X/lxFpx6ERr86fGrej00WWTZFoujSsjURUwBSanCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 22:48:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 22:48:08 +0000
Date: Wed, 7 Jun 2023 15:48:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <20230607224804.GP5433@mdroper-desk1.amr.corp.intel.com>
References: <20230607081004.887428-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230607081004.887428-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: b370c29a-2697-4349-d5f4-08db67a9430b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BL3QrQlKqYq5TYjn3bYBDONyRal9K/uy0qYexgbVwu9Mv9gyEhk+nc4s8oans32B9GerXvNWvotCU20iQ/AmUM2t2tT9GDPkdjin5hpzAyky/CaOIAIQa+H/G9Wcn29KN+CtwM1AZ2rQNjiMyf0NRJZTu/kP8su7rKk8BBpvysykj3YWwiqiBofbue6nbqrD+YQkfx/UpJotZl1ObBcMyjNs4WUWjlZISU8ZPhi86pvzl5+CadnSZgBuvil+2cYoKzjjwtl11V6AGwOo5Hts0fRKoOwKxu8IWTzrz2p0NnMy14utKHcPWrrw9u6XuwrusGWMIEVbllG3lNx/d5KkqYYSvhdvrXQVyINA2BWnjCz4lzvRypnblRGIj+bBeEXH4VADyahvfirpUWavGKZtSCmZWeZvn5+6CiW/2aibjMErff8pZcBqQuNIakVkOMKWaM6BptQNTQ+FHjXb0uk95VzhnTQk9gqhlT9Fi133efU9zko4APK5Ffm+oq75VW3Sker21xGl9KKTbYwxHMOoMCrX7tjWYkGmNrKIXgO9jUkWSxaZfok44a54WNBvF4Qa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(6512007)(107886003)(38100700002)(6506007)(1076003)(41300700001)(6486002)(6666004)(26005)(186003)(83380400001)(478600001)(66476007)(4326008)(82960400001)(316002)(66946007)(8676002)(66556008)(6636002)(6862004)(8936002)(5660300002)(33656002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I6OpknITmXZgJGgFkmOOE/DPhJ2+RJWdoS/o5cDga75Q1+9v5TEj0tkJDLpB?=
 =?us-ascii?Q?fphSv4Yjmt7cQn7ko4K4Zk1IWg6U/cDuhE7Cgr5RTqw4/1bPAh+NInRQyvHG?=
 =?us-ascii?Q?ODjEQ5vC2UoMAJ2IjVqzADMHhdihm7pse4B4vPl+nJZF8pVPCBjI/F7el3pE?=
 =?us-ascii?Q?MMzthOjmiGuwsHa+wF3nVELBeILmF1hwiR5Q5q7YUWBvaInm4WYFpyTPLV0m?=
 =?us-ascii?Q?jraJb2jUTZ9G3cedXMJnCFfbUaIAINE0JtCZVHoBmMnCKf0a1Nj/Sa+wYyVD?=
 =?us-ascii?Q?OHfGJuqOtaz0WConF55ftpgRcy3LZsfNOuPo69xGNzAZ1FaLiIwpyFgxcges?=
 =?us-ascii?Q?i5oaOcNj7V9MLwzqWRx6yywQLj/Git9X2V/lbcp3JZgZioYHDUAfXE/5MPZR?=
 =?us-ascii?Q?zk8UB3VYf3twMJ8g/2xE/y8f1wSEwdfrVUpjBS3BLZLwGZkI1PASs8KGC5CY?=
 =?us-ascii?Q?uzDXGWgUoUTSHMqH6nQXNHHm83fX4VctAKQ3uFggDWFTYO/TD7spqiwdPusu?=
 =?us-ascii?Q?H8eLSQOGDvdzyzluFx/0iAnkIEmMXPo3I/0bdDkRnJaDQYFwt2orpASqd2TC?=
 =?us-ascii?Q?3r0UnXAWuxuFUBEZrxNeNdVeNus7Y8ze8Zuc4Nv3ozLQ2G491/X+LLn6eEeF?=
 =?us-ascii?Q?jpu+cvf6PEbZ8b+Njj8biFhlk3pUAka89YLplyPb03D5mnnPVORj7AfSAZ/O?=
 =?us-ascii?Q?H+Uuqc+KmqlyjUWhwpgogUk2MHkP7/OXf8ddc9ZrpzlOQ5KxxgOzrlwEk4aZ?=
 =?us-ascii?Q?CTat6KKFlJ3WRbtc+tkljvy9G2wwIDcnCDmY5KC5wlZ9lJAjXN3XcQV9SMdl?=
 =?us-ascii?Q?MOdE0SAH327ulKmGoIuBNG2xty7EHhrFqSUhNsGXc0I1KBSRc7BNwR/8Yqs0?=
 =?us-ascii?Q?hzrgs7lASEibZNlbKvFijRqhCcLOQzcJ8970Zs6pt+TNs6DFPYk83APRCZ+T?=
 =?us-ascii?Q?/Q6YhRUX2FLULTRaqkJ4CxcatKIVIgB/w2bhLJCS6Klzn6tm5Gpuv1vrEvVG?=
 =?us-ascii?Q?91PBIFbXJlhdfjR8cJh0IKjcUHlRbIGNobZqU8eS3480QzE1PwQ2+d9y5CHf?=
 =?us-ascii?Q?fPHyOqEW4fXpT+4vbdap1cBAAyJpcqlt40kNPzmoUjQJt/bzy9eefTEHVoqs?=
 =?us-ascii?Q?RdVsUy/6CF5VcU1UoSKS4q/LXFkoDmXs8Lqt8IyvG9O93Nbq0UvMtSuMN0T2?=
 =?us-ascii?Q?f+Y2bG8Mde+fmPbjorT1V1W5b1j8WufywCvothF9dlE/OfviXLtovLP0uSEV?=
 =?us-ascii?Q?Zgwon0iccikcA+OBl6qK6k+pIkDYDQvYrD7cMcvdpZAVYqgB+1IQhIF11Wiq?=
 =?us-ascii?Q?3Pybn+kPDeLSlDH3qWuB+jlRrvuv4ZzK6/1ISCYbx9mKR7hF1YYkIM3yyA2O?=
 =?us-ascii?Q?kJu6eTPkmx91v1fBXk0YNtGvtQATbz3BzfgDpwOJAsfBEKMRPxHHVkbBWKey?=
 =?us-ascii?Q?wZ8J5EBrvMifzFfEDJgioagPS5kOCVvYfBv0naVACMO20YhFbWnxrt9qvWYl?=
 =?us-ascii?Q?N35mQ9/2t17PQPg6wJkmZVfh9ADjXuDeY8toZ9zff3/pq+rRhDlj6aZordqe?=
 =?us-ascii?Q?D+MXP3drA1B5f4bHOGnyv6IICkyn/JQxl+6PbSaWM89zgV4F8aOn8VtIBHnd?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b370c29a-2697-4349-d5f4-08db67a9430b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 22:48:07.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpHNUd0I/5z3v7o4WwQ85UqiDb07pA5FXUHiFEalk3MQYOXsowCwjYoKQv81O70l64S3z6UibE5fPRz6Fvsd1oBO7o+oRocdI1188Ul9m5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Donot apply forcewake while reading
 actual frequency
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
Cc: vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 01:40:04PM +0530, Badal Nilawar wrote:
> The registers RPSTAT1, MTL_MIRROR_TARGET_WP1 doesn't fall under
> any of the forcewake domain so doesn't require forcewake to be read.
> When GT in RC6 frequency reported will be 0.
> 
> Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

RPSTAT1 is an sgunit register and thus doesn't need forcewake (which is
a GT-only concept).  MTL_MIRROR_TARGET_WP1 is within an "always on"
power domain and thus doesn't require any forcewake to ensure the
register is powered up and usable.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 67faa9ee0006..d04600b943e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -371,14 +371,8 @@ static ssize_t freq_act_show(struct device *dev,
>  	ssize_t ret;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	/*
> -	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
> -	 * to verify that our freq requests are really happening.
> -	 */
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
>  
> +	/* When in RC6, actual frequency reported will be 0. */
>  	if (xe->info.platform == XE_METEORLAKE) {
>  		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
> @@ -389,8 +383,6 @@ static ssize_t freq_act_show(struct device *dev,
>  
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -out:
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
