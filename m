Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771AC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 17:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4E10E043;
	Wed, 17 May 2023 17:27:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A9710E043
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684344430; x=1715880430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SLbEsOegiMTOuCPOzl1xnYCD3YOD/I3imW5kyP80hM4=;
 b=Z8NguwfOjr8TbpHLOvZ9beYBhSD6hmDRYr+NFl3FIrF9BjbxpcCEa0oZ
 3AqjQY2tQ+SHn+A2cvYMNM+4z9wA9xk8t2G5HyN75UNI3daGVbNc5UE4g
 WWgJ+IQE8sfJ/OgIs9uLE1f5mH94bNTrzclXdM7Lj6wYB13nbJSuPtY2k
 qcTGfmQbuFHssO/ljcffKTqM49wmZ5+ulrqMxay17Shaxyi1RvNtwfy/c
 BM8fToXRhZzqo2M+oOzi6ODWndIAyEtXT0GHOoVVuLfOFbhE5p11k2X9h
 zR3uAqZLiMW9HHBtKo94zyQNfZrQbdu2kU/6UUkyxQoOtO2kio0TFMxEF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="355001752"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="355001752"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="695973583"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="695973583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2023 10:27:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:27:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 10:27:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 10:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVjtj6i50i38EehP36DRXNHzbOlY11OOflV7YoPw37GZL76SN9pzBH6v36u2ogWtiQFej+HIctrQod2ffHasWECaYikXcacsuYrTuEUjBuxK4Il5BQ8TABSJUIbcqU+YVNQMzoWz2T1NDa/dK2G/CRgTTyXesoXy4EoO34pwD5Kb2uleUquA6pRvIKFNxtJdQpk8pvtYq/LKw2rBJx+PGYBvfu96KL0RBJ9akattEgL2weXpXTT9DzchR/fG6SuUHfze+cnqpaolVFDuXGXfeJa1M0NrKSOPmlKpH4rnLk5TT7rQPH7yiomGngxfKbiSQm/eM6RDCymJqNVneV7JTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4iS/uh3v+N7441DQR7QkdwJaTmGBoxaopHuTI3uoFU=;
 b=ns+3lkRN/8R5sAYSvHgJ+QXe92oXf7OsymZLqnl28sNMI7Y0gKbpZBkAssg0n7uKmcLhyASe1Jt5jYNDFNbCoreFbAHyJYQK2mYKAGBawT+9GrcsBrsIeQefWuC3Re/uzwGXl+iBsNfCGcdVmKtS8Rv6losbr1EyGEirOJyJbieVF2ZwZCvWnuVatZTVgD+AbV4ytxisjhfqgvv7kGO9P9RTUkCXvzERbhP6B8jpA8ANRAsTuyu2QREkQgu5XiX3oZtoOxv3NicDapi9cVz3IcRzJ3YY5oo68wl259X9jn6kehb07/okH0ddrrbxRQsF11fGaj+noJf7PlxuiOUwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.34; Wed, 17 May 2023 17:27:04 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 17:27:04 +0000
Date: Wed, 17 May 2023 10:27:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517172701.GQ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcc552a-62fd-4215-c7a3-08db56fbee2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zc7+y07Zp+hvcF68vXpGgUbnfv/twcSxHBjt9cpwKn8VdWLP9uKRKhE5tTA6kLSd0YHvwtAfsCVkfm08e1t41hCmZ6helA3NKjlq0fS/5Y/LILgHAvR5AZ3v9JVLhvFdByHDGa3g9nl5MTZo+zxNXGtpLAkyQjXc49zW4hfJ9pmnUtMsiSDL88hY/KXqusGh+ycNo/XuVvA1/lFCEinFKYRP/4vyc3IfzVaPqE1U479Qz8D+NIs6QMOLBjCRTEGbBkmCgRgpajzg3bfRbda8Sum6S/hQnQG51nL4zAXMjJ0OuKgzvs9QjwssqvNq4FTNxsBdo7ki6bNmEPmZ1gMBYErOy5U19e686r6YC+bfzzPv/vrDl9WFXJzrIgWt/JxeYC7WcPHSrFOJGGBRoGpJcPdA8+5mR5OwdsM1IddjaHItpu/udrLmnJueWTMamlI8t5AiAsSIiHoqv7Jy8J50QImB6odVjUS8WTqJYaddF8ITHXfUh5cD2UYfW2YVSK6F7ZC8554hqb5UnkLYn0SgFVmG4wps1jqKXQAnWnaotpMph+50xuAxOkHc7Cbl2Xmt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(2906002)(5660300002)(83380400001)(6862004)(8936002)(41300700001)(8676002)(6666004)(66946007)(316002)(66476007)(478600001)(4326008)(6636002)(66556008)(33656002)(6486002)(1076003)(26005)(6506007)(6512007)(86362001)(82960400001)(186003)(107886003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pgd848F/+vBEnFJ45mqVnyVoH5LzQUsdeFs+GGHOHXMsui+HHzlTHxiFcgBt?=
 =?us-ascii?Q?AFiIIpLFwzxRd4LhEj7Gc6Tqr9PjnHxLwey8hHcPqntbyDST7PNquksJ2CfB?=
 =?us-ascii?Q?UkfzUKf0mWaCIUZxXMmzyp6pkZYX5R8NgdvkbDqRe/S6BrbJmAEd04HypYN4?=
 =?us-ascii?Q?JWNLKHq0miI3/awCOGrHGMpUiu4AfgSOtJn9iEg5Wl8az4Kdu4ylMcY4UFlz?=
 =?us-ascii?Q?bIkUGWQZUs9D8XaeOFWv99pUmHveZtC5mB+P/RZwTPyfJMVf51lyq2vQejPP?=
 =?us-ascii?Q?wsSYAbdxosKKFEO5ris1dQ6LFMS4nXFbTTM8GuabKvaV2u0nn82MHTYkqcEA?=
 =?us-ascii?Q?qefcs+CE3Z2NczXnY7sEZgDk43wtZwfv1mmfidivK8GTUqoq8Ys01QOOCqDe?=
 =?us-ascii?Q?bs2gySxnsbdtjm0atT0kDU24Mcpm23DlnnffVzQU38ucaRjpW1U08Q152dgb?=
 =?us-ascii?Q?9cs4uN24ZRUMvhrb8OS3cvDqx8ynRUPxzhdOtzo/gU9MFsO3MK0E1GqPIg3W?=
 =?us-ascii?Q?WhU8fcMvoxZzoVdghQq+wkBPSFjuV+MTuyk38ZEwJOBaGVwI+J6eh8o8DKoa?=
 =?us-ascii?Q?7hjlRgasxhCUVe1eYOppR1f2BlhKOSo8WB8Xjuzn35wDPUslCP+Jq73Xzq6m?=
 =?us-ascii?Q?qr51i6FJ6P63a6cWDcQN62n0DOCLMF/e0w8kfuxXVguY9+tpotjJeMwmsyQq?=
 =?us-ascii?Q?941t7OJI+9cc0CQf0G3MfjQP3Ov1I9OZrWAyLr3ivTCJyFmIhaspdiTGJxdd?=
 =?us-ascii?Q?HQvXlb8Wm6yMxZTeUIpRrZnDEWfTEP7CxZBkL0slm9JQOm3beVGrWzL6GfaM?=
 =?us-ascii?Q?bjEwesUD1eDEKEsDtGihloSngVGmu3VQpUeVuNsz9cBFVFo2HBD6V4Wv19rH?=
 =?us-ascii?Q?GymhQzaEzMO1SzkvKYUKkWHm8i0ieUPY55Ct9OlouvDI034lK6hJvA563Srf?=
 =?us-ascii?Q?4AwDcmS8Kd1hBVRjpEJDTG1k4uwksnt/27ekjo8v5A+4ciZu8g9AVrMLiRF6?=
 =?us-ascii?Q?QDoak0luuMvYOpnmfdA1O1rjINDh4gZvmSIGDmW2mLau3HtbCfYbjxMxIrt/?=
 =?us-ascii?Q?F9ygulP4dKklBLe3UdDLtkADL69r6iZPxTOi0En4Goy0qMdGny4lj1KPWniR?=
 =?us-ascii?Q?X6MdqDRwye8t49QFKhZIgxho+YussFf7E/nIlb48nXdiOqjwRwF+rCliLdjf?=
 =?us-ascii?Q?zjwoTxzZVRDw1H5vzAb2CeWt8M8xMuD6fuDm1PSqzYqEE5+IoWIMT4ZeDJdM?=
 =?us-ascii?Q?R0KglgxWfRxZDYcQpZiPH88Vp7xTTe7tEOXqSs6mCXJAtjtbPHCgDr1GIyoi?=
 =?us-ascii?Q?oLCUUMxQd+siWSfNqPcgRCxs3W4HuJBjoTbY5uQVSEnthr/uwpg0kBFPFwju?=
 =?us-ascii?Q?mLW017G3k4TpE3OULeP39yy1chvnLofjbOFgAzYwGk3HXyYkq0K5dDLz1jaM?=
 =?us-ascii?Q?q3/SWyhBZOUSCccBeq6ZRZ01+xIn9TfgHPnzfdjyP1H457MM0FDmaYuhXrhe?=
 =?us-ascii?Q?EwHgG834bv20Tu1/zehRvj1q2LeggMu2PlDx36+Kk1+0b23rlM0oHKhe3vWM?=
 =?us-ascii?Q?7XCU9Gt0KpO2wAV1X0NwIAOP/dzX/LIXDaqrkEBZiFsWIDMsxbbgwYIOWun5?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcc552a-62fd-4215-c7a3-08db56fbee2d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:27:03.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVLyQKzQIkXErKemC8fUl1L1EW5xnDMB+ulOVLhdon67jBmL9+exsmAyZ1hUPrcONSYVFYPzyXA+qVlBNEcbKM8EmxFjC+YDeJOctXMmc1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 4/9] drm/xe/rtp: Allow to track active
 workarounds
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

On Tue, May 16, 2023 at 03:19:45PM -0700, Lucas De Marchi wrote:
> Add the metadata in struct xe_rtp_process_ctx, to be set by
> xe_rtp_process_ctx_enable_active_tracking(), so rtp knows how to mark
> the active entries while processing the table. This can be used by the
> WA infra to record what are the active workarounds.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 48 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_rtp.h |  4 ++++
>  2 files changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 1485e53c1496..d20536625020 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -113,7 +113,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
> -static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> +static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>  			       struct xe_device *xe, struct xe_gt *gt,
>  			       struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
>  {
> @@ -122,7 +122,7 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>  	unsigned int i;
>  
>  	if (!rule_matches(xe, gt, hwe, entry))
> -		return;
> +		return false;
>  
>  	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
>  		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
> @@ -133,6 +133,8 @@ static void rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>  
>  		rtp_add_sr_entry(action, gt, mmio_base, sr);
>  	}
> +
> +	return true;
>  }
>  
>  static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
> @@ -159,6 +161,38 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
>  	};
>  }
>  
> +/**
> + * xe_rtp_process_ctx_enable_active_tracking - Enable tracking of active entries
> + *
> + * Set additional metadata to track what entries are considered "active", i.e.
> + * their rules match the condition. Bits are never cleared: entries with
> + * matching rules set the corresponding bit in the bitmap.
> + *
> + * @ctx: The context for processing the table
> + * @active_entries: bitmap to store the active entries
> + * @n_entries: number of entries to be processed
> + */
> +void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
> +					       unsigned long *active_entries,
> +					       size_t n_entries)
> +{
> +	ctx->active_entries = active_entries;
> +	ctx->n_entries = n_entries;
> +}
> +
> +static void rtp_mark_active(struct xe_device *xe,
> +			    struct xe_rtp_process_ctx *ctx,
> +			    unsigned int bit)
> +{
> +	if (!ctx->active_entries)
> +		return;
> +
> +	if (drm_WARN_ON(&xe->drm, bit > ctx->n_entries))
> +		return;
> +
> +	bitmap_set(ctx->active_entries, bit, 1);
> +}
> +
>  /**
>   * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
>   *                        the save-restore argument.
> @@ -184,15 +218,21 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
>  	for (entry = entries; entry && entry->name; entry++) {
> +		bool match = false;
> +
>  		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>  			struct xe_hw_engine *each_hwe;
>  			enum xe_hw_engine_id id;
>  
>  			for_each_hw_engine(each_hwe, gt, id)
> -				rtp_process_one_sr(entry, xe, gt, each_hwe, sr);
> +				match |= rtp_process_one_sr(entry, xe, gt,
> +							    each_hwe, sr);
>  		} else {
> -			rtp_process_one_sr(entry, xe, gt, hwe, sr);
> +			match = rtp_process_one_sr(entry, xe, gt, hwe, sr);
>  		}
> +
> +		if (match)
> +			rtp_mark_active(xe, ctx, entry - entries);
>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index f2b31be294d6..274bccaeb72d 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -363,6 +363,10 @@ struct xe_reg_sr;
>  	struct xe_gt *:		(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
>  	struct xe_device *:	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
>  
> +void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
> +					       unsigned long *active_entries,
> +					       size_t n_entries);
> +
>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  			  const struct xe_rtp_entry_sr *entries,
>  			  struct xe_reg_sr *sr);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
