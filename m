Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACDC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 18:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913710E245;
	Wed, 17 May 2023 18:46:39 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EAB10E245
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684349196; x=1715885196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6KEYOr14TVy3AvU0mKrcy2Xd418M8Oxw2lPoLIm/uUQ=;
 b=bA/JepHkAZ/Y71oYdAb369whjHzXf1Ft/CUYwMTq+OVh/vG3fDt7s5DL
 btDw53Y2FciYCP4ERbvxrBXPBrxt1wQF9ZNzU+vobgLD2ccTbfCMy+XVh
 G+wjuqzm8qfeVpnF5rkPxbdFJ/9GXm58lQceJtI9if/zZkxHIYlzwWl58
 avsFEYLZ53LXGrZif7R1TIjS+z/RlNDD6Pse6lfVEc1kkiPJP7QmqaYv3
 CnCx1V2WYoBBQnguG1LSFBP9HTqAepyyc5rPMP/TsMqBl3Zmgib5qW7p+
 f+GyRx7tBoFWHh8/XtGziNGCDatRy6jas/tKzZPNQunf7k61vEk3inxqG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="380044235"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="380044235"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 11:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="813980284"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="813980284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 11:46:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 11:46:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 11:46:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 11:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzbYOZPE+e1l3iNl2CdpeK9kfU50DmUvtuZlX3mKt17ZFhnU6riFKtuc6VWYiBo9rfxb7RMQ6j38Z7PuIMNxJYutUGxqgGjcIOEuy6a3ZyPhlsElrqMpTAA34vOYIjvAVtr4UjaVHQ3VE1Q0pm5EnJhATjwchXzDgsFNggjrfm5lv9Bc2z/0hO17ws/u1IyJR32efhjW3wvQ8xOkCbPNbqWNnNNWbg3+HlcaOi0INdWe9OhdGbV4B1r87BXVZy8+uTaWslHTdt+5GFPyRJZmYx4+8KZh2aml69p+FiojnUtm+E6YFSKHyLj1ZqpQNXw0d0mX1lQfMFjNXJjUVCECiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TkOwa/3ccWRd8i1nJH81laZpXA+kyksaBoQAA5PDCg=;
 b=Xj8xLEDccwsVNneuHXTlSUK3DRdYbN8YBTGU4DyaizlzAPTPpEjUBh/1jD4KPzTqgNfg/AC/qFu10dOL7H6uDu3F3ApjY3dsj2ON5PW0u01ac4Ay3NjxjqJzr21izCLjnsBEg254O6gZabmw9ZA6LMKBknksYYgW/8OnzsQxcZTKcXMypuVYI7p+WcXZ1WWSGsQvOJE4I1vYIYLjZUTtpI/FwXKfe3uoEZz+qlsfgNwuqXFIIXViw/UcSJw76qo68WeENtp2W23TF5WrSPA1P5frPSxiAs6o95om99VvKU5Q9BLaBJK5qebNvpFKOHKOsws6SzV8okpuTvYIRfvfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.18; Wed, 17 May 2023 18:46:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 18:46:33 +0000
Date: Wed, 17 May 2023 11:46:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517184628.GT10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9cc359-1ef3-402b-83fe-08db57070821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkAMTn5OiPESyCiPKipECAuheWvNQwJz5cjRvrM4B9DUN9GtDAf2yX7JSEOVkZ0FH9WrFAyBuPM2JfBhsfymzeETSgFnOU3qybqZFWIA7gGqB+z9z+KfNLs55dY0qTC0Ex0MOqVxLg3px3DBjHCYHx3BcLvlCVvPt+hn3HmaT9FsCWfARjD3XlDrNqF7n78td0tZKcSLJQToq9tq8X0KAxXZTIIze9VYGDqe4FAC0NVU+TeIVhTrtILsECOFpHuM4tkO59EUKDwTv9jzck4rAXL4nWUjYUrJIaJ72LyrXDalX1LHrrbGlAyUaSMV1QT+xVzn0zhy4tqjbJP4rq3h5ymjkdbeLC1eZdjk7ayWLcd/XHIDBWH+8xemxgbGwbL+pYR/upUrjvNemoOuHmZru7cuIHIHeoV2VirWP6NdCtbGxdHK7hor5L28ipkO4voxwxV1vU5pzD0uItAp1wZw8lwiD/5WvKlRfNJ8kFpi2LJf9q2xUz7QhE15Y75tV4VWo6wFVOwaM2nG2MM0qFq092wUH4uXtFteSy5eoVab7K+hpRdUYBFzIH2FvUBhYwb7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(82960400001)(38100700002)(66946007)(316002)(66476007)(66556008)(33656002)(6666004)(41300700001)(6486002)(5660300002)(8676002)(6862004)(86362001)(8936002)(107886003)(478600001)(2906002)(6506007)(1076003)(186003)(6512007)(26005)(83380400001)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wioNnTQrIJSNF9UUABQgfNr6pmFF7aVEOwEfL+F65aiyW6z1vyjhWQl9vygW?=
 =?us-ascii?Q?6bdFa/l+u1X58uCDip0FQN1I141hAIw6CSBlO0Odp+5aJsZ5bIeybY4/ZTX2?=
 =?us-ascii?Q?Ygwg81fHHHsPEToFvK0UpFTVvDP/Od3qRmLC9w0Z3HK2qpLC4PK/Or69De+I?=
 =?us-ascii?Q?ir07FOIpGA5RNSB4jq/zHT6M2aExq3NQIYiOteltYfVknfpQbTcvotwUMeFq?=
 =?us-ascii?Q?SuU+uMfxpH1+o84alMI3vkMoROYfkzZR6jcv1S39D7CUV3wkKPZxXeW23IlF?=
 =?us-ascii?Q?RnrOIfOYZ224clLF4c7gK/Y9/mTIUxYgF7dCJy7lD4e9ZwphaTnpnjHsBgE4?=
 =?us-ascii?Q?c+tMb/XKoEpYPOnxl3Yga9MZsADJZW3S3VUEmgyShIxFiFVdtBx4Y/DvjE1C?=
 =?us-ascii?Q?qrW7rl9lzQ4KlFPZHaRDkY9IIPdQajNFJvakiwcw758oGmonmroUXx0JbCoh?=
 =?us-ascii?Q?Wpd16A1qhSG3aLLIYVZ1Ylce2lfkGpWGMjjhVHrwtdeUoLAinO54vQkMOLem?=
 =?us-ascii?Q?1UUOdVTkYxC36f/ii33PbMPMTNVYPVz12DUZlitb+wbGq2ueTt5IzBq0svnh?=
 =?us-ascii?Q?JMFrwm7pyjqbEcvmRjHhMMUdmw2RS9lAFDJKxkP5KzP9k5Rd0GXBeYWCddic?=
 =?us-ascii?Q?Kh7A+C1QSW67AihVF3EYwWwNaH4LQ3UR83n+CLWh8iyTC/k/R5OP073Ljmg/?=
 =?us-ascii?Q?t+XFml3f+LTHjyfmModOUoBV7MSbB8EEnapnReo8/1fp415ft7MvV5D4hCnp?=
 =?us-ascii?Q?2SlJqFmswH5DItaor+Vaj54zQLZNM6QVX01zIuP8b8VExdKmBbdMJRPRj3kV?=
 =?us-ascii?Q?oCjevFLwYxDxNuR+6QK0ftvOPZQHvmHa4Nfh9ZmeWa27pLrY1/756yPFiKC/?=
 =?us-ascii?Q?aViu/ue4M4Le7s6kYgC3hhmCb1RtllMGC3+TVwvRKQgiWGG8ITm2ATEw4SgI?=
 =?us-ascii?Q?aqAZzkJ2EZvy0YiuqbvdL569zt3cE2lElTu4h8ogReGQHZkUXT3O1sdy3pnW?=
 =?us-ascii?Q?wPspyzKYvxvPdR4WcYxB4e18CmM9ciq0B49xxMqZ9/Ciqkz+4StnD6jzBkgb?=
 =?us-ascii?Q?dWRUq8hylLJdBTjIWof7ibDx8whuESvE+Zl97OyXkUZViZgbGRrIdYC9euC3?=
 =?us-ascii?Q?DrxWpN+cJwPETAaeFjQt6GIUyQ2O/83SC+johXBPK5/z0XVbO0AyQTthdMgH?=
 =?us-ascii?Q?4zl0NWGScirMY3JcKohIIWAyWQOE8gpbTYG9zddMGkCFS1WfAu4oD0Z3m0/c?=
 =?us-ascii?Q?UwBax3bpvLcZiSz/9sp4GLQwsyIVp3SH6UjcV25D2j1k2Mt6BS5X0/5AOHxn?=
 =?us-ascii?Q?2JMCRVnw2qHFaKkp74C/Nd1l1+05LeJHxNU0VG14JaiYGhYXvhI4Q6XD4zR7?=
 =?us-ascii?Q?tS026k3leeucrrYFOD7K6pkBXxKvy/iDJm94RJ631hwKbG4ODIn0G7BoRajn?=
 =?us-ascii?Q?AyA7bdrgohLclXufb7GInZ/wjXoqfGipsTSReNbWMVarDVCmvRhN7NVUxRIc?=
 =?us-ascii?Q?wqTflu6qehnTm0GRRMz5qGfhy8SA2em+yqFk9zOapu2Dw2vC2BHK6zNzCGwr?=
 =?us-ascii?Q?8si8Qj8lmdXr1K2H5wmRL6d0pe51RY1msBqJVY96o77spmX4JE7LQdwdHUVG?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9cc359-1ef3-402b-83fe-08db57070821
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:46:31.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doClcyFZ2uHP+RYtYQ2tMrwn5uJmv7p0AtbqWK2anbSJgmmNM2lsfLqjWC/lIhysnb/M2RrogcroKgQx3vXlI53NnYwB69w1xlMABYIoWgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 7/9] drm/xe/rtp: Add support for entries
 with no action
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

On Tue, May 16, 2023 at 03:19:48PM -0700, Lucas De Marchi wrote:
> Add a separate struct to hold entries in a table that has no action
> associated with each of them. The goal is that the caller in future can
> set a per-context callback, or just use the active entry marking
> feature.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c       | 65 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_rtp.h       |  3 ++
>  drivers/gpu/drm/xe/xe_rtp_types.h |  7 ++++
>  3 files changed, 67 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index d20536625020..db0f9254efd2 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -26,14 +26,14 @@
>  static bool rule_matches(const struct xe_device *xe,
>  			 struct xe_gt *gt,
>  			 struct xe_hw_engine *hwe,
> -			 const struct xe_rtp_entry_sr *entry)
> +			 const struct xe_rtp_rule *rules,
> +			 unsigned int n_rules)
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i;
>  	bool match;
>  
> -	for (r = entry->rules, i = 0; i < entry->n_rules;
> -	     r = &entry->rules[++i]) {
> +	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>  		switch (r->match_type) {
>  		case XE_RTP_MATCH_PLATFORM:
>  			match = xe->info.platform == r->platform;
> @@ -121,7 +121,7 @@ static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>  	u32 mmio_base;
>  	unsigned int i;
>  
> -	if (!rule_matches(xe, gt, hwe, entry))
> +	if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
>  		return false;
>  
>  	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> @@ -182,15 +182,18 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>  
>  static void rtp_mark_active(struct xe_device *xe,
>  			    struct xe_rtp_process_ctx *ctx,
> -			    unsigned int bit)
> +			    unsigned int first, unsigned int last)
>  {
>  	if (!ctx->active_entries)
>  		return;
>  
> -	if (drm_WARN_ON(&xe->drm, bit > ctx->n_entries))
> +	if (drm_WARN_ON(&xe->drm, last > ctx->n_entries))
>  		return;
>  
> -	bitmap_set(ctx->active_entries, bit, 1);
> +	if (first == last)
> +		bitmap_set(ctx->active_entries, first, 1);
> +	else
> +		bitmap_set(ctx->active_entries, first, last - first + 2);
>  }
>  
>  /**
> @@ -232,11 +235,57 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  		}
>  
>  		if (match)
> -			rtp_mark_active(xe, ctx, entry - entries);
> +			rtp_mark_active(xe, ctx, entry - entries,
> +					entry - entries);
>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>  
> +/**
> + * xe_rtp_process - Process all rtp @entries, without running any action
> + * @ctx: The context for processing the table, with one of device, gt or hwe
> + * @entries: Table with RTP definitions
> + *
> + * Walk the table pointed by @entries (with an empty sentinel), executing the
> + * rules. A few differences from xe_rtp_process_to_sr():
> + *
> + * 1. There is no action associated with each entry since this uses
> + *    struct xe_rtp_entry. Its main use is for marking active workarounds via
> + *    xe_rtp_process_ctx_enable_active_tracking().
> + * 2. There is support for OR operations by having entries with no name.
> + */
> +void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> +		    const struct xe_rtp_entry *entries)
> +{
> +	const struct xe_rtp_entry *entry, *first_entry;
> +	struct xe_hw_engine *hwe;
> +	struct xe_gt *gt;
> +	struct xe_device *xe;
> +
> +	rtp_get_context(ctx, &hwe, &gt, &xe);
> +
> +	first_entry = entries;
> +	if (drm_WARN_ON(&xe->drm, !first_entry->name))
> +		return;
> +
> +	for (entry = entries; entry && entry->rules; entry++) {
> +		if (entry->name)
> +			first_entry = entry;
> +
> +		if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
> +			continue;
> +
> +		/* Fast-forward entry, eliminating the OR'ed entries */
> +		for (entry++; entry && entry->rules; entry++)
> +			if (entry->name)
> +				break;
> +		entry--;
> +
> +		rtp_mark_active(xe, ctx, first_entry - entries,
> +				entry - entries);
> +	}
> +}
> +
>  bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  				const struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 274bccaeb72d..0fa9b584ed92 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -371,6 +371,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  			  const struct xe_rtp_entry_sr *entries,
>  			  struct xe_reg_sr *sr);
>  
> +void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
> +		    const struct xe_rtp_entry *entries);
> +
>  /* Match functions to be used with XE_RTP_MATCH_FUNC */
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index b1e77055f9cd..1091a79d0fe0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -95,6 +95,13 @@ struct xe_rtp_entry_sr {
>  	u8 flags;
>  };
>  
> +/** struct xe_rtp_entry - Entry in an rtp table, with no action associated */
> +struct xe_rtp_entry {
> +	const char *name;
> +	const struct xe_rtp_rule *rules;
> +	u8 n_rules;
> +};
> +
>  enum xe_rtp_process_type {
>  	XE_RTP_PROCESS_TYPE_DEVICE,
>  	XE_RTP_PROCESS_TYPE_GT,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
