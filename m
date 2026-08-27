Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ECDC5DF97
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 00:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10E10E364;
	Thu, 27 Aug 2026 00:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxcamAyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED7310E364
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787790762; x=1819326762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H3tTv0fvY+Ycpifr3qDrjBKn3GVe/eFAdWrLZasaN04=;
 b=WxcamAywSsbwOnxo3RTr9i2DNQoZ88loGMX3MDEWI1tfBPNPgeDpCn4X
 T8thIZNOKJDC9iEQDb2t87cVudSEHjbVrVTP6/dkyfzPV5N33jCEE88xs
 tDQ6t3WdnE+zHZ/LMSIl8ACPM4kflRA4cbcD37cRjcaBExkLQU5sczsZx
 FvT8JGIcoxOKqHxTCVy+3Qkivz9hIxjW2Mc/BS2F69SFRaxJ+a8lMj6GA
 dj37z9ulkicEmfjbH8dZhTpE3qvu74I4OSizU3MtUNk61fXeoKYhk8Tzt
 jk1Z7IVEc0bG0z9ujA/xA8+igIHHBD3GdoEmQ5a/8lBQeNTAMirwd0UaT A==;
X-CSE-ConnectionGUID: +/nkqDQKQCyONyt+O9X7qw==
X-CSE-MsgGUID: FHS0Sw33RKSAAWYx0TOcRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92147188"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="92147188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:32:41 -0700
X-CSE-ConnectionGUID: aH18e0KkTyi0tBNgLfT85Q==
X-CSE-MsgGUID: 9GqvQA3wSMa+cjhvdOl5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271520851"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:32:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 17:32:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 17:32:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 17:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM77kPb9dSFIHCcUj6/QS+h9yWpnL/8jMgwvHD6JTmQsO+tuqpUwyvkFVYBuuqlzw4GhVn7nrzJzsOWBUBbH3oRVkTAFnaAApxJPy06KIKy+c5Rx1LS8tnRN5/oWTqX4SCeB6n1hqoo/IG048QiduSCjujgyo5BhtpUvdRUBcGMZ13PdlTB8IuuNIUzVHNbcqABx9KSQWhUfHsOuLuSPca+MlMFM0cw0e+usiP7vOlz+sdy8dGVrfmn24zfemuh7YP17PXir48nGGtifHnKpZTS4oSfOFxO2cje4mcWFPzyE0XqUqjP9FuJWQG6AtOX9ZAR49KgSRhseylystKbPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6TJ2mSZZEyX71NmBOrOFhKiGNlQaqho3U2Z+DhxumE=;
 b=n16HHJu7ZFalnc2Y4WouaFwUgV/wNE9XwxkJ+uhcLB/F+9fAdDawhWqV74kzg5FGjgco5Z6kNXTyi1I/2hhatrwbLGdoNFf9gGi97o09SzdOO5pW2CPDiEuVxBi2UDdLz9NSU/RoJNxKKVs8OWs3Kw70tu3yqmASf8Ese3D/wjl8m4fLI3GIZO7+ehRXkfy81/9CRRXwCZ6JAF2kBt8yi/OanheI6bneoEUWwZbpOUi8w5iYE/3ukk09PFEP5r5DjxcutxcSbWwecwXIiyG7HRjDnRAWg6p+cr7GuYtzeWiTXGSqnNtrT/JKRd5ZJoMVHkVCsCfim+vToe8xJWF3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 00:32:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 00:32:38 +0000
Date: Wed, 26 Aug 2026 17:32:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
Message-ID: <ao+Fo7E9c81pJtKT@gsse-cloud1.jf.intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260826112533.3289978-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: b82abfff-fec1-4c38-c1a6-08df03d2b243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XJBp9/7e4u5BwH1Lh5HgoOvnl6lFO0+XnNDA4IPUmc2AzUPKe+4gnRstNEkt1ZU5QF6Xhh9o8EDTFCImZeGq7Pym5ebBgnPjxmdLHFd4HUS+OjG85EbrJtJMWbqjoSqUkK6nw7qw7IWqxQwqyEd3B593vsCGDSmSFVi3j7hIpLYGuuqTCiaJC0XDMCWyi7sqGkeZHuC4H+Kmj6q5kZ6lyPpNOk9QNMSp0cmVlorQUKowKDBbtEN6htmX8Hb6Y2WrFbFeO9R4YGB+Ld0ENSVkoqzDhByxgEzjM8j5xsa0d6unGab/+cYwUS8/f8Sli4AlfOCSu9OkVY5d0rdb+sz2QCmaMUbpHHaRbANu6mUPqm9nGgEHaiv6oWX7lVi66k3RBdY/P87xVIjiueanu3pud4j5vN8q3mSFM5UDtailqypMhzcDSYhyoy9ahrsNmRHve/0PTfD5RW3NBr9O+R7lkK+Tn3/J0bkXnho1Ms/Amm4BAW0hTTLgVwR2FdszQNwaMEAQWCQ/tHNALcU6m3oUZykz0gBeiaTg1kXaKNplFizi13U5PHvTq+bJ7GBwL2107pzE+K1/NVzQs7tWopVRfrBR0VFRloBmPKo++Ick+Pw6+O39l6C8B1k9E3BrD1bn9FQvfEE3kDQS9enu7cMqxXd7LDgNb/NAgKq3g8eLd5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/wH52DZtktKIT2W0UHSs2rcGeYtC53B7rZdWWiOzzY2h9obM800HC4D0jlF1?=
 =?us-ascii?Q?ZNB0fLq+zeMntqMCAiO4vc1EnBnUwSlpp/pBYe7RBX0jJOrsC9sPubGAxJBe?=
 =?us-ascii?Q?ASVtgnBsjlIKMUw5Ktsgbuc4CBc5pIXTyGboZwA3mbzZQZItNibGoN+viuqN?=
 =?us-ascii?Q?blPspjebtTiryttDcVKrmelJ81yL5mXfO5+SznV8FkveMsUhyJiDuueUC1Sd?=
 =?us-ascii?Q?RTUiR33ERI5L4IgV9cDGNnb6/NzwjOpzRqEwZoQEwME5rFuQJY09Bb18bGNi?=
 =?us-ascii?Q?nq+JzVXlbro0YlxOvZgmJiZD/n0rxjwWinK8QUXirncgBlFnmPRCDeDP1baC?=
 =?us-ascii?Q?nyLGMsrHZGc/1WUBhe7act0inQTivevldlF4hjjhN42IOCcV1oafkhzTJsDu?=
 =?us-ascii?Q?azAvW+OxEBB+r6kMLCMwQ4gLJXEQNhv2UCoGMPwr/sbULWswpoH5J8LSYoc7?=
 =?us-ascii?Q?C6O4HGkWHD9rIyCJsjimI90qshdYYt8ZBd31/8MIWIjp/sB9Siewggid5EOo?=
 =?us-ascii?Q?WeZMsd65+NcQOJuFSlZrnldvTgNWoaSl3FfmKg+XEP27lOLBJAzlcmJbPceW?=
 =?us-ascii?Q?zY9aUglcjn4/OWSujsvdk92gdyjG38UNtN9mYfS7kS+Ew085j86oLDAtCp3o?=
 =?us-ascii?Q?hqj1KwanUeG2bUi9fnCSg4fOIbNK84SHMEU3u1P7BQQZAT11i3jvRpH0AAUv?=
 =?us-ascii?Q?Moc51cmAwwbvF7xqauA6itUUZz3qopCx1quAyDu55vLz4xIALD7MECm7WGF+?=
 =?us-ascii?Q?N1q/aVsg8IU5TNTqfesa+Ev2mj3KVnIS6vc2/rgyvHD7ElGd1YgT8xTqY0GG?=
 =?us-ascii?Q?lf47fi0sk4bCap7ssdUqEPLdWyc7JdKG48Z7TIIp6FVmXDpO4sWAHlLiUXQw?=
 =?us-ascii?Q?VMT3aL0qgVTUDFweynmHDl8M3Gzrk9gfOJuEdFT0waeIxp3z+2y92qkYCyOX?=
 =?us-ascii?Q?5NzbTNitoSVlv1jv48WwMwmqugZ+PpG5uHFig2e+bnNU7Kg5sldErfKSSzcw?=
 =?us-ascii?Q?6sPc1aoVKpItqlMgVvUbCpC/k5NnSlWDowTdianw+qewK1/PsH4F/32pBHHY?=
 =?us-ascii?Q?zm84W9Kx4dmwp1PfBWhKNfs232skkOtGYDRYtLr+en2R1BDgBkM2Aiyj0pZw?=
 =?us-ascii?Q?AlxwBUONX9mh7FZYhNyivKX4a1vmy0c++WW+fmR/k6DTpMeVymuz8CW0gvWC?=
 =?us-ascii?Q?GB4SHmdr5XvfFv4Eyp3iKuzPWXuIFdj56/0MtqnBtL6PU+5i639EC7H22gjH?=
 =?us-ascii?Q?E1JN3wtwbIafA8SzBQPnN+zXKXGLX8MXhkHgknRcC03WT5tIA9RNJa2etrhp?=
 =?us-ascii?Q?80yx54Ruvy50F79thGplNCuTxBKzcjRYq/iG+fF+oXGpXVvu+cL977qpZ6m9?=
 =?us-ascii?Q?o7eT6UQhX+RKiiPHZv0Yo7KGErZonDiYmEeGkDPWW2hNvqRKTKVD4gP6PH6/?=
 =?us-ascii?Q?IUJgynF+uZZW8YbXSmNH6dOufDMF0IbNjmAdszgkr53LHLyjBuKYH6oKPjso?=
 =?us-ascii?Q?GuxOdBWldspZ1mJR2Gv1XTLmHOA6bS6ehVy8mwm2BF9zTqsaXo6mpyELZD1q?=
 =?us-ascii?Q?Wvw3PHo2vq2WSfViChDJguiUxfe5jqgpxXLf5nm1iOlCrJdb7LzjEQezovLF?=
 =?us-ascii?Q?VotWS+P2JOdc3SibW5xQplVZO7GUrAPX8RUY6/FbGDWvL0psxm1Y+s7asTD2?=
 =?us-ascii?Q?kBvEuzR+ZNG3GHoh8NYJfHHdwuLev6+t5mrnyiyEZScNa6ZfUtNnQVLSHp0g?=
 =?us-ascii?Q?0GxVpNe69cHLVYiHwZZBfl5dar4kSKM=3D?=
X-Exchange-RoutingPolicyChecked: DgZiImxbH28lwKtN8Kn/tyXb0UIDvE4ooAVBmIMO/gUcWV5jiEdCly3xPRE5AdweRzh4J9bJ7FAa91vh0P22UVc/kHW4wiF2xZgi9sPKXclWFazNE03Us+d5w+pxGN/gYlUVVN45RFdoxm4toBKyXVNtYbX+iy3keFv1hoN9VxfsGSsIGv8bvWmye6yrd2TxfsquM2SKUCfede45Wq8yfSylcTsKSwuv4Ab3didYL08/LFcXq1YiGgKnFuJ38TaDLcUWdobJdffB9iBVPtf5WOmusqwvelksqLVW26JTkATp1wV5r4z73Avcr3Wvxs+L2hZB+CO9klHozKOTitHV3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b82abfff-fec1-4c38-c1a6-08df03d2b243
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 00:32:38.3183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqTjQBc25psKXWcnl1wcXr+q5A5vMpKrNvzvikl+DC13wjLitfvm/Vat4gT3Z8FtszqwRkqJ9lYeV+wfLrY2ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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

On Wed, Aug 26, 2026 at 04:55:33PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
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
> v2:
> - Use xe_gt_has_multi_queue() helper and address nits (Niranjana)
> v3:
> - Invalidate both the primary and media GTs, similar to
>   xe_ggtt_invalidate() (Matt Brost)
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index bd65100283e3..cc43089de34d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -451,6 +451,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>  
>  static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  {
> @@ -482,8 +483,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
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
> @@ -600,6 +604,29 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> +static void ggtt_invalidate_gt_engine_tlb(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	if (!xe_gt_has_multi_queue(gt))
> +		return;
> +
> +	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
> +	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
> +		   ERR_PTR(err));
> +}
> +
> +/*
> + * Drain engine-side GGTT TLBs on teardown so a recycled range's next
> + * occupant can't hit a predecessor's cached translation.
> + */
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> +{
> +	/* Each GT in a tile has its own engine TLBs to drain */
> +	ggtt_invalidate_gt_engine_tlb(ggtt->tile->primary_gt);
> +	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
> +}
> +
>  /**
>   * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
> -- 
> 2.46.0
> 
