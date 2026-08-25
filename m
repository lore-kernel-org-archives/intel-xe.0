Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF45C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 18:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C147410E12B;
	Tue, 25 Aug 2026 18:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikp4KJaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E23710E12B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 18:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787682119; x=1819218119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O0TDzZyScLFYcEQWic4cEnarmMPYp9MeGNQYmVBcOko=;
 b=ikp4KJaWCmkJHeXYlX4wDXL+1/z7vzR41UwFqZe39a/1FPYm3Is4iwM4
 LWpEg6K5Kmd1DW4cgA1ginUjZ5IiLDG9iX7cfIEkYvbhZeZVZEx6nAIYF
 oXDpl1wtAzsJwq45YGAerkjzk126BSYq+QwNBJfVYLkSERnQqTwGZUT+B
 kqMyozqN8N/KsCCr8p65HaZ2QqasPY4f66ylTxoAKDLlTugrrgA37fAVJ
 Kgg1LfLm4ikZYswlCAeCMmYC8s3FKYaEtcztUdNaok9K7SpGlAm4SCmgO
 mvnBvIqKO9J47Jhh6MXKTjqTggASS5xjEG0aC5GxZMzVybVIHzdkr+eiW g==;
X-CSE-ConnectionGUID: DM38R/JZQQ6nYt+yO2bmUw==
X-CSE-MsgGUID: L+5GC3q6ROattpY91PHkPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88186000"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88186000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:21:59 -0700
X-CSE-ConnectionGUID: 4gI+NgEbQzOUDR1BcpcHvw==
X-CSE-MsgGUID: Vpx8TZgrSeOx+zPn1+HkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="263060835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:21:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 11:21:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 11:21:58 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 11:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaCRc95oryJZHOtlQTRWNEQdixDKQkAjcLkYkLwzI34ybctt446RCXq61hMuRoL140si/fSx6uawcaHUgM6gbMnVLNLsy8XJoiayMNZDT24eRzr7dFufpA9P9mgjDudX9Z9SjiuOpOh9eHkRoQFSuaJ424zCsozQHWRN5IyoeXbrr7RuVf5D/qP1IhDw92MgAxGDzpUfkDfDeD2XF71Bob9z5w7fFU0KIuY85cwgBtiNEziTiTMq510ODbxqhifd1Lq2wJnX9Wsz5lQrs+0y2jkr34nTTBCA9zwWpaeW5/r4ORQgQ83J3pli8F/tCOLi2MWX/8duorq/w4IIffLw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBU0gL171gFrZ+3vw4iDNIaSX9zeE+Z3ouOK1b5rWo8=;
 b=sZrI/tIoOpp8CSuHSXTTadNNiQJyQkhernKf1teh8ixx1TO8BqCDzdf/9cMsvYHXg1HUMyaaxvL+92IpFQwA6nAF5H3jMWypLw6gOV8/AONglak/JIkg6rjUc5TV+GnaQ0rtlT+xalNrvm05pfAsR1Rm5yO7EAQEF4ldnv148VLV/3BvjAn0ITCgK5RjXIfgiQZTeyc3LsgWxPTvALolAd3OHaQPxq0PTdchZ1pbH3m3l22wKsxLTB8MS7/ruGUSBrC3RxOIz64ZlpMKg7cFkuZoLQ50Lo9f7XAxZpkzdAbuv/yVxKI/5xPjXt9ixqWcXc4GAxTDg5X2F3QmRuiP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8797.namprd11.prod.outlook.com (2603:10b6:208:5a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Tue, 25 Aug
 2026 18:21:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 18:21:53 +0000
Date: Tue, 25 Aug 2026 11:21:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
Message-ID: <ao3dPhsS0j20XIDL@gsse-cloud1.jf.intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f040f80-aa75-492b-d22e-08df02d5bcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: oO2g2h8vidPUxpA9KnZ1OAi/z2ZrsTH2aa88Hvjv2LL6etHhlVkgjPAJqorppYxbu+5Px+j09qaxcrsoVoKat0WDGPrtMP7qu8BiFinj0MBpglwne5ZhxDN+Qlcod0zHdnIyGvU1zm7l9ks0NLkF8b5OdPZu6VF3xcDwt5/2Y6qSl84W19B+G5bSOoRr2rvKSBRBwCv5txfUB2o4t5kfZx6JavXAkVs8RfwO4nLRO02dNOih1BBWQfyOG4uWJZgC97JisU264PdcfmQuz0+seeBKDsWoSon2/oFUg0K68UcsK9KYPXqhXylltTH/b+YqPZezZZskrNBcHebXvv7OiuMffmPAQ56v9G0zHN47k3unF1B9CcE9bWyzt/qfP7yo2mchCcke4X8njgB3olAeEpAIQNAW6J34RTuwUEew75bfXTZcSO2CDZe77VY/DokUiMtbBXTpWjauvWJJMquqbAB07WYRhIqv71jJ81ZLdHvmDTD6XtUIfF4ONvxfuRD40hP2zgfgZDTrZcxkNebh35VxvEa7/4MiUasMmLiGVlZ0ZZ4Df3hm2AMBsEi8qpM+jJlpYgI+dAl4pXH9LqnvJML71xtMxmQ71GrsOidVAOY/1OCjVaJM0GEmE9s3YQU1WJiZVwieV3Y2GH//7/JobV5w7vTBwx0Ha/zQ/j1kG3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?24NFvgbK301BsJHOoyhwuaSS3PlqD+BTR1S/h6aXRVM9cSdudqj+v0UoJXU5?=
 =?us-ascii?Q?P2v4Y6IKPM7S+FvPlUrOlwVlSUg7BQ+QnuUM2d78bjc9ki9YjrtHC+JzHJx/?=
 =?us-ascii?Q?uykfwXQXFOfisWvrv+3QXWWQTLzmcQu9AMAmcxL9C4BreBL5t24Y1WE/T6ob?=
 =?us-ascii?Q?FHxKd9PD4iYIpw49YU5Pm1fYA3MmozTbkivafmQiRZbRDqSrCNioVc/V7loO?=
 =?us-ascii?Q?cqnDQV1Pvk7gXel6bZzSNf5vN2xx6jeMPX1xKqu+Z2h0Zck2KKH0nsSWFZTl?=
 =?us-ascii?Q?drb8DX1vw2YgxlSzaAFDsjqxlR07i/WlVF1C7x+s1gNrdcJor40iMXUa9Z5w?=
 =?us-ascii?Q?YKIAvCRamoW9Uh+kXGnP7MsM+ADhxfZk0avn130OKgkvwmlWkpqbcrKQn2/v?=
 =?us-ascii?Q?/fsa3z+8WFyiF9y7t6BS8Xa9acaXVwDN2dqks12HjGKCWDsHLDSPHunZUeZ8?=
 =?us-ascii?Q?3kpLBc6IpPJ2SEil0mPvopHTSIVbDk7hCLjo5eUMg3eZGaAyNnElK55jr6of?=
 =?us-ascii?Q?yWGdIw94cTtvcqBLLGfePOJrvCBW2EY+zA2SVTl8ek2/duxUKAtfxBoXyWZz?=
 =?us-ascii?Q?9/pxuielON2fXPiF/pAhTl7dTuVVEJQ/RodYfC97QcXV6T3nEs4Z770cBvQB?=
 =?us-ascii?Q?R6pDDcRHUyMtpC3mNp8hkzf9S8eiPsejwtMVRChBMI2naQoL2ZATz7JKetW2?=
 =?us-ascii?Q?1ylDFwm3eD9kA5AdqqQeCTir988xxXRuesfi94fQ6XMedbZbpbjkb3b3+5gp?=
 =?us-ascii?Q?vIAUIDScBLwKkR6G9LSZaUef0KgBpd3JhD8CcuE5jC9WPKQcPqNzFXwUXt2Q?=
 =?us-ascii?Q?QN4rIshvX4zd1kxP2s8dchc8TCqig3o4N/mAIBRttWryvUDcYfseXGGIN9aQ?=
 =?us-ascii?Q?fAgHlHF2SQGZuxy/ZAD4AKdpDAL2BmBTqTy8LK+btD7tZ8+jzX5adLxnynrx?=
 =?us-ascii?Q?Z2LSHTVi6orWCqtS/nNNVYP+OcOvMrxgmohfGjhrp7DkxeVd7sSaPqEWg0tk?=
 =?us-ascii?Q?gX7Wv3v/pViaJwA3ZTetyaKpbdoht+VFhWSQWw8cBVndRYJCnaG6sEx6uFVe?=
 =?us-ascii?Q?GbieUw0jO5Bf0e/5L54IhQAcDv0udROPRKy7rpy3fqNB/3XRENk0Pq0abc9i?=
 =?us-ascii?Q?f1GIR2WYcuDi0xk8bKcLcj90M9G7ecjv0b/aAhdw/3mFHEZwQ0Ckd+ONzfUj?=
 =?us-ascii?Q?Jb6jK5ziMZi0NQGq3/KVIDYG8ikX+Y6DYF2A9OKF4adjnGkhJL2vJ0hHoW2y?=
 =?us-ascii?Q?fHRRKdpFe2nBAlUpYrmT+4EoKQxqS/u/0v6rNDRwtHt9xqWrYb2UUeeiGGIP?=
 =?us-ascii?Q?gOjeb3c8yUHIencycwkXJLu4efS+hI8Gn6fb97uOnfrCcNqzXSyxA+Oh3WC8?=
 =?us-ascii?Q?213HhafmgrSia3+IuHIPo5nIIK+AFU723cmpR+uuhdCzqp03H/vQJnld4iRM?=
 =?us-ascii?Q?CvjneyC+k67W8ILVVW6SPDld7XlNJKm+wXSLB+sM21gvgmeuwciNACGC4TH1?=
 =?us-ascii?Q?R5dslgeZm5iFG24C0I4dKTTDBb7I1bo0pkurteA1LqiL6xIxE/IupeK6CRxH?=
 =?us-ascii?Q?nnGkUS51B8Ihtf+cdVHV1kfknpTJxo+qH+0i8TOPih2/Lzmsz6f3HFrUNQv0?=
 =?us-ascii?Q?OnajyV5XTyrq+hAE335ulMKG9LlU5dJMpzxdcbCCG2CadWrCx9R6ng/aAYjO?=
 =?us-ascii?Q?p27cm/LY09Fvm+SvdT8ItEJ1J+ocML/cn/42+TIWv7Mw8W0PfLvbDI2eD1ZS?=
 =?us-ascii?Q?kNDjglKlUyaVKULACDAOrwG5oDjkqxw=3D?=
X-Exchange-RoutingPolicyChecked: 1uhO4jm6zNkweB1+p3ZERxySC2A0GKey1/8woPKPkeByspEkSKs4BHXp6Zh1gNAWvYvdciFPgLhRZUvzMCmYqacwK0s7wwLSO8nkzyf6GeYyC6RLeOpM3jNcpc39ULtySQe8SqYBFGrf2OSjaUktKmE5V/zNUw48/UFoYdV124wjk/EBu3IiV+NKeJCh93nbHPbjatiVKw2CJb1+z4z0nHT6P94Z8hdowC/albx3d5kSPzduWS14HxfpwjmZe1QsEOZgZswufljLgmbem9DPn255JAg+9Sef/fXxs9fxFQt4WJEBooNGxIk6yGsg4tjaPxlis/tKcJ1R9FwVx48wuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f040f80-aa75-492b-d22e-08df02d5bcd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:21:53.0997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIpnzMbn2R6bGDpSBwzXdZrKYBBAotlGG7OwnJZPsH5mcfRPPQh0OGCWK6OFy3NidVsQzBZHAw6YpTFZ02eRXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8797
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

On Mon, Aug 24, 2026 at 10:04:58PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Engines cache GGTT translations in their own TLBs, which the
> xe_tlb_inval_ggtt() does not touch.
> After a GGTT unmap the engines can still hit the stale translation and
> read the old page.
> 
> Issue an INVAL_FULL (intra vf) invalidation on GGTT unmap, gated on the
> GT having any multi-queue engine class.
> 
> v2: Use xe_gt_has_multi_queue() helper and other knits. - Niranjana
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 4cddd69f0e99..0f8946fddbaa 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -464,6 +464,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>  
>  static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  {
> @@ -502,8 +503,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  			      xe_ggtt_node_size(node), use_scratch);
>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
> -	if (bound && node->invalidate_on_remove)
> +	if (bound && node->invalidate_on_remove) {
>  		xe_ggtt_invalidate(ggtt);
> +		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
> +		xe_ggtt_invalidate_engine(ggtt);
> +	}
>  	mutex_unlock(&ggtt->lock);
>  
>  	ggtt_node_fini(node);
> @@ -612,6 +616,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> +/*
> + * Drain engine-side GGTT TLBs on teardown so a recycled range's next
> + * occupant can't hit a predecessor's cached translation.
> + */
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> +{
> +	struct xe_gt *gt = ggtt->tile->primary_gt;
> +	int err;
> +
> +	if (!xe_gt_has_multi_queue(gt))
> +		return;

For future-proofing, look similar too xe_ggtt_invalidate():

It should attempt to invalidate both the primary and media GTs. The
media GT will either be NULL or have xe_gt_has_multi_queue() == false,
in which case xe_tlb_inval_ggtt_full() will be skipped for that GT.

Sashiko also flagged this as a potential issue, not functional thing but
good feedback.

Matt

> +
> +	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
> +	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
> +		   ERR_PTR(err));
> +}
> +
>  /**
>   * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
> -- 
> 2.46.0
> 
