Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD90CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 20:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4B10E0D7;
	Tue, 19 Sep 2023 20:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA27E10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695156333; x=1726692333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AzSK+MedWdkd2aq8whomQIg2KVf+5jBG4fu3/4Mm2jo=;
 b=LV/PBx8cCTPvK03L4bz/gG2E2GVKnQ6mftHQQTmQxgHSUU/IGVDzt/h5
 t7Q3rYblcqJVrxdMmrKECXypldYx5MEGWwCAi4n5lrlYVoBkUlU6PJqN5
 +/tmAkTE1lM+b65eenEFJOEo8TJW8QvWDvkDOKerSO9lc2cPv1X2CWUzY
 LE2JFEzV+qMq1/f8PEsA1SCfyq/co0b3ZvVocCLfdeePwHbt2asfL8Izy
 WPTwVQ/3vZl20eMI/81OL4LtkozUA34fVj+dlYPWlZ54+4zEcbBksMwxb
 EESdpM8/+PuNH53rvyRoGZyylKjd6G0Bp/43whIyHrnl9di7RbrtQr3p/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365094569"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="365094569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 13:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861689807"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="861689807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 13:45:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:45:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 13:45:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 13:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFbhtEmGCO5S++vfCBiaAnVTT2VrlTA1SSDDJ19VzKLK5va8kKjgOM3pWXK8HIucf+qPYZmIhm1I/V4lEfa3A0gIkD9K4Mvnq8jJub+XhSBCxyvrnb8VbEsIMGC+lvoV7K90D4s49Jsuzwb2cnBk+hDcVdqf38CYPLigQpq8oSB1kuTc494JKug6e+szSwExlHeUTST0NCraDyq7fn/N0d/EtiNRFl0Yun2ZAojEy95PnxpdEHY+fqmLAziwbbpm3O0SGAQ2dAcUHyZvD0esuBn+IHB2XD0Ag8ivgOemXiqE2TbH3V8guqUcfeXpiIW7imPpPZ2zEkZYijDw8i5zGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XlIfByq0YfiowIh1z2fsZqnl8K4Zw9a5CopwkMnTh8=;
 b=BeFV/F52G5a8nFR1XTct3dGN/xD4Son0MY15wN3Qd6rjBxIcinPowC96hmtp7h8193SJWFBzU81RRbXPBzZHrfoyc4ARNWvAZ/5LV06NRVy5NJdNFr+fTZe2+8ewbv8e7iIjIfMQ29skYV/9zSXH+vhVPvZvo9qLk9hOs/cHcrq7JCJtgMbn7ETRQj7bgHvRDmRuzsflM7gV44pD3Wwt+pMd5Ita9c5Xq5wJui0mpsYZ5qdJxRxISv6kckvLRRESqf8kecAREgZISRZPz7VJWD0m1QwgbqGlyU11ojxwKgE3aEsAZFKAfR//JqJzaTs1NavJNYfvekTbYzQHMvcRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 20:45:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 20:45:29 +0000
Date: Tue, 19 Sep 2023 20:44:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQoIJTFgfc40jgZ8@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-15-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-15-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 0795dfb7-6486-4e55-870d-08dbb9515bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQb8kHco5vjHTlyRUZW/TsIUvqxCT5hawjdDVagr38v4J5hv2E/9yfbSFad/l8V3xSJE1QHbGWbp9JKmqPJiOT2GiJHUo7ezXloinLYIfbVYhCpA3gpFReVyi51jRK/zgmww5R9EoPaS6JnQ9ZR1NM3z1bkYb7cOAMri7ej2yS8o0h0bKvljCuiqxHBEbYicOQaIfmqPJUBE0oQAHAFwvHHPuVD8aHq6CfvEKxP8TP8m0aFlAj1TJhZ9WahkMB/DH2vm0CIV7d6E+TBV5EO0AREoZnQzOtQJEBOeaKMpHRMZKlkkPRONgJLCyvf9xkpiZ8KEBZlV0t/K688SMvebO0bZxhLIU5Q9UlmRonPuk7zzw6GNNosxp4q0Q4QJwtxg4e3zGFH4FPDHTM70ZBTpDT42pt/fvvYE5ejLFHWC2T+5x2+1huXjd5vyNDBXbMQj76p3lIG7UKUmUve0JGt/MWj6vt+t8VLPWi46IF2X2BL0rDt1t9jpFBnodz+rn52VtNg/4qsuY5KCObInwhtZ7quwLaDmjDGONMiDx8nRCtUKzDJKprGlKMCtET5mLypA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(136003)(376002)(366004)(1800799009)(186009)(451199024)(2906002)(44832011)(5660300002)(26005)(41300700001)(66556008)(66476007)(66946007)(316002)(6636002)(478600001)(8936002)(4326008)(8676002)(6862004)(6486002)(6506007)(6512007)(86362001)(6666004)(38100700002)(82960400001)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7AfktJaf4ttI8qP2y6XhCkSxWvOAekjiUZhgRfQyWmtlNHf+85xfBb7njm8x?=
 =?us-ascii?Q?NbmuMId1Po4isD8olmuTGGQeH7/5qXpX6ww1bu49ialwdz27brDZJqUmiPMI?=
 =?us-ascii?Q?doOJ4kCcmXxhRio6rgxASA0/VHtz46mogx0MC1jZIsKBD4xDgkp9phsTnbd9?=
 =?us-ascii?Q?6O8BWYESrPLZCpF+For1ckkt8t8pZCxJYysQjugXllohIUHLbyZBQtfPKlJr?=
 =?us-ascii?Q?3c7jEMXytHQutMrjIs7UFueWY1F0qLk8bAUqemNzDcc5p909YzQaX+VS9SGn?=
 =?us-ascii?Q?DnR+3WEqbZ3xgrmNOmBn5vEI3rM+F0iwqmDsL34N7lS3KKavINmqZrXLOWBH?=
 =?us-ascii?Q?2SMSzkQBpWBNsfFB84cA59qDM8dbaxhk+l+ae/h+V9PzohE+yFEzLx8iVMLP?=
 =?us-ascii?Q?wctLheRFwoA6rAuo3NotUoH8l4V8vN8KXgJLkuLyuEQMLEn09XCYEU0CB/mE?=
 =?us-ascii?Q?qV74D7i4p5UzWZX44vqtKiVwDcxNfJdGVVfmP1uyGpTt2EKWq+dqw9Ak5SSh?=
 =?us-ascii?Q?vBktku28UmOwIuW3gqpZb0kQex98PKNBPFFqbNR8b0vkCciMp0Kzs2lswIPd?=
 =?us-ascii?Q?rIsM87VrcN1usZ6KRkSTjORRYTvb0+1S4PIguV2FUKw7QiNUAwEOvZGTjcFu?=
 =?us-ascii?Q?mXG3M+AlRpwwyjm31I2zjMi+Ul7EHAS+HH5qeS3BvdimWzGNf1hSgrqFIUO4?=
 =?us-ascii?Q?gV6hkVzbWmzr3B5BFi1pIwe/A0WqVoMHBt5D2/M/cnhhXCZF3mZyVfswX5oV?=
 =?us-ascii?Q?3NH1e36xhMrorhUgjsCq6yj50KZGvuB0eIRT/74fxzTVJ+NpBllI3qHorN1m?=
 =?us-ascii?Q?GJEaad9pUHzl5TsUxQF0XKHvllHpeGn6VcurhNDSrTiAHfhGjpajY4RYFv3M?=
 =?us-ascii?Q?ftGidaKFUAjj8+koKkQRNqCNPp00qfqsddo4oxYfRctTTAdXveSlD4L/PDEb?=
 =?us-ascii?Q?crs570DDzuE1B3twMoMrdoIwP3krdBpDApS5ODDXKDZV+ektU+4HiRShA+5P?=
 =?us-ascii?Q?gl7g4AoSviekNnwPWgSJnQFrCmdsEqC2IGq9P61RbtcLyPQRFadwz0XdAkqK?=
 =?us-ascii?Q?KOvnAaWocksFc9X9rx848ma/wDVUqY1OoDx3cdLC4Q7sh7bSZPb7ZPZSUXHm?=
 =?us-ascii?Q?cedGRlQ73D+brXVKBdJI460vyDZnYRSNaZCK2+nlaOUkSaYy09TW0PHEBp2s?=
 =?us-ascii?Q?hV5r9S292uvPzNMH0inbutb9WdTiN1U+lWaZXpRXceTqb/022BMC5uibnlQo?=
 =?us-ascii?Q?6YNfDHuET3IU9AN0y5Kjo5K5qELmwsnEIBfaGurtsSf2AZDL1ITSsO/DeCP9?=
 =?us-ascii?Q?Lm8M7szDQVklsOY83F/Jyv+2GROLev3HoAX+bribWeLSyK/GGwTp6O4XU3Pg?=
 =?us-ascii?Q?wzLMSLMd+uDSNQ2Ws2qe0Wo0/XKk06tlajUECad8pXWD0p+hRF3FNrDLTLGS?=
 =?us-ascii?Q?ch8ugKMSQG8O+E8ubh61nx1BQA7t2mjVXlumW4FQcjD9maadMhUhNYq2nReK?=
 =?us-ascii?Q?2+1admKex9GwhNvmU0VGDei9KwqYfoX9VqIsQzbdtn+qzoxYuUAMKi/2S/1Z?=
 =?us-ascii?Q?zJNukMQYWPf9b7ffPXYZlRHDn3ILngPqQoGGbzAHc/BgLmJJNuXqfTd62S22?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0795dfb7-6486-4e55-870d-08dbb9515bd0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 20:45:28.8448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q0N5awUcfHGhFVlfBI6NNZ3vRbM3QMkg6WgMrFMGzFMpTn5khLqtyMNsIDh+9ZsVzlsmQJrL9mU96FmrIz6ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/17] drm/xe/uapi: Replace useless
 'instance' per unique gt_id
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:25:01AM -0400, Rodrigo Vivi wrote:
> Let's have a single GT ID per GT within the PCI Device Card.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c      | 4 ----
>  drivers/gpu/drm/xe/xe_query.c    | 2 +-
>  include/uapi/drm/xe_drm.h        | 4 ++--
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..d3f2793684e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -105,7 +105,7 @@ struct xe_gt {
>  	struct {
>  		/** @type: type of GT */
>  		enum xe_gt_type type;
> -		/** @id: id of GT */
> +		/** @id: Unique ID of this GT within the PCI Device */
>  		u8 id;
>  		/** @clock_freq: clock frequency */
>  		u32 clock_freq;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index dc233a1226bd..c6cd0c7b1082 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -599,10 +599,6 @@ static int xe_info_init(struct xe_device *xe,
>  			return PTR_ERR(tile->primary_gt);
>  
>  		gt = tile->primary_gt;
> -		/*
> -		 * FIXME: GT numbering scheme may change depending on UAPI
> -		 * decisions.
> -		 */
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
>  		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index be9affd4f181..fb448e76fb0f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -379,7 +379,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>  			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
>  		else
>  			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> -		gts->gts[id].instance = id;
> +		gts->gts[id].gt_id = gt->info.id;
>  		gts->gts[id].clock_freq = gt->info.clock_freq;
>  		if (!IS_DGFX(xe))
>  			gts->gts[id].native_mem_regions = 0x1;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ad344b3324c6..ca93b43fe3c9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -350,8 +350,8 @@ struct drm_xe_query_gt {
>  #define XE_QUERY_GT_TYPE_MEDIA		2
>  	/** @type: GT type: Main, Remote, or Media */
>  	__u16 type;
> -	/** @instance: Instance of this GT in the GT list */
> -	__u16 instance;
> +	/** @gt_id: Unique ID of this GT within the PCI Device */
> +	__u16 gt_id;
>  	/** @clock_freq: A clock frequency for timestamp */
>  	__u32 clock_freq;
>  	/** @features: Reserved for future information about GT features */
> -- 
> 2.41.0
> 
