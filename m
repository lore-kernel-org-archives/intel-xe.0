Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5946BC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74C10F9E7;
	Thu, 21 Mar 2024 19:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7n2a1Wt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF5210F9D9
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050084; x=1742586084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K8V13PJGO8clTQ1FEHU827Fb/88EnTxq4z4QDEQcXwc=;
 b=F7n2a1Wto3M4azMl19hmBDS7RzWGMDCdDFuLIc8Gx9eSlvinc29a1ExH
 j88me+aQBtFYDaTs55XpZuRh8Nf93RE2agEK1uaE1/PNdKeCXA4mzwo90
 KwfU5mH2MgVGPgd1JCK5R9CxRAmHB0+SpeTQU65IjvDoCfOkkozQD5Nbr
 5x1r8prhcEPHsjCHnVXo4k5ZJn/CTsh1hIXcZYx3utvRleTRzrpsuwzL5
 SelN43Q/NcCNziATquM67F4/iVH8Yi/fOtH7OJgMFvawd7mJGnhVOoBOG
 YJucgcb5h+xGHlz9m8Iqy9PNqGbzhD9QpmjF+el+THt16LfrfqesB4osp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5965381"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5965381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19361333"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:41:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:41:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:41:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:41:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md19qmQ9sPq6VeAnHRXICTBZXzowe/fSKA+ie2qNaZ0Ci0oRty8A7sNBd3u7O7OmqS+gr+VQDPMQnolqXxCtYpaJCynOxGSpHSOKxJIfd7I/UxxM6Qqcm5+HIVFp+0h0WJF5gQbJT4wr1lAR9MxF2ecRtOTYtvVCWhcdhBb2nahLCClWewtdx32n4Cmgfc/sIzBZWQNB+QC75ROeiqOfFN1JgDWNTXxweHvGD9G7vt/NFoNWkVoKHimGQzaBCPUltAp5K0AtbgrtdAktnoHjSR2/yesXcFzUL4w1ydjgLX64h3k4WcsYnD4FTuVTEJYZ6ecpz/SH/h2p7Q5UWrAgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO4+fPGA/CY0LYVadWFqRrfagqbqDxPOCg3RUSzo7g4=;
 b=CGotYuXx1LuOGT+xclskiORm9flcCKdZ4Uc5u66vY1jfYXiaYffw7folmbKn1x9vJq+X/mREOQM2J/knJYbi+/0rvvQVnreuUCtfQtkx8DDlLWZKWqm19CTHqKQZ5N4Ncg7Az5M9LUdeARvGHGTyZHBHRHIOfQdhw8Q6WE2HYE1ahFnqIVRFNVltVvZSVof+8N/La9CdTZ9Dg3GDXzYQcmfSqtBpWScxornUpe+E8ddAtHhTx39Amim9El7aKaHAC/JzLpl518FGBrcjrXsMvy7Q9CO4pgnGQnmxk6E7RZGm28KmCqKfwu/S+RcoYLq5jhXzuaxv5KOBbPU5N5GiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Thu, 21 Mar
 2024 19:41:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 19:41:19 +0000
Date: Thu, 21 Mar 2024 15:41:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Use enum instead of hard coding
Message-ID: <ZfyNWr9TNDxQxs55@intel.com>
References: <20240321103928.3310349-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321103928.3310349-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: def71353-6a85-4a4b-30b8-08dc49dee120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Rpb2f2zC34gV3LlWEAKEozbCyB1f5OuRY68wvX50m90bCKUxWCypuY0iCAVgaRBMmEUJu/OYBbwt+PpsmrT+h99TdFRLWK+lolc5lftQHmgPGfqXnORs0nsgax/AWLZjQQz5qA81Wjxng6R6IHDQXE46tI0ke07rCHDJqtw5Hf0rXPFZ30zzxxoYMB0zwEyiHWnnZxkxKyRW8eNRKXe/e4Wza6W7lUbmwh9vpRW9LxmiQfqPkxXNtVzirxlvA5Ksihp5Ysz8XLm1r0EN6RWBaBDyOPGMRXa2kJLPyqDTGEdGxOT28RlsBkfEGfVmO1zFGpJSvSoEpLwHZxBk/R5nREn6crV4qD79dGQo/Y5vGzous5DqWde0FNoZgH9HnFWXrCj93Bk/JTTPWS9qeEQ0XxTwpyF3BqBBdo4TKfp4Uohrhhz8PmLHQwfnvPBb6Ovh78/MvsfuBYjQ/+crecM9hL1RXJeey3v8NNdlgDhFjDDx3Z9BnvPVO+0YaG1Eqf6h0LqrZU8SHJ09fAuBjwlA3UCMHb1SX12bfCLKfI9ZIgVM9winSG5EP/v4Evu189gWfJnSrzkYtXWE6kFsL8aN9YEDroqMMQVxgpm1J67Tt3pQri5bxeAIVKgDu9yDtwhueX/2OBILFHO16hKSvzeZI+xKJQwT/Ahl/R4mnIDqEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kY8EggYEB99f9CyT/6TpexxPhwQCJimNr71IpRIHzYj+7kt9N3IB0IXzFohz?=
 =?us-ascii?Q?LHiWtYF9+HMEebRLnzF7+dAZ4ikA136EBd3x9NZ33dHu9BUVWfRbpCpBVj1q?=
 =?us-ascii?Q?hbGq3SvtaBL2hnrG0yZX6Ef+YRuvNEjasbhTM394tuklEhBhssvT850pdyND?=
 =?us-ascii?Q?yV2VHCY32EDiT49XA0J/wZBynQNQkZ+Coxx23nxaIdiXwzO+XM9tpyKE6PZX?=
 =?us-ascii?Q?b4COSjWSyaobJrgn9I7IA/+pXEIwla8fDdrV4OjBXE0pgA6nxjcFIWO4Rq+Q?=
 =?us-ascii?Q?fkMQRchEEtVninJY31K8nbkHz9FeL1xiqSHF+0+uJydd48eAP5fH0EMxAgo+?=
 =?us-ascii?Q?JbPXSiPN4vGiC91I9cNBFFD5IHz7RdcAiZn4rmMyU8F8lOOK1TLr15xUN9wx?=
 =?us-ascii?Q?suSn8op0X2uvceIhDyCfc4V1ErMdURG4ntSMiRpZBZKEB8eIVXqDF6Z91YC7?=
 =?us-ascii?Q?OJqxPJZk50o9LD86HUPV0FGvfTVorbipqla+QB5nmd8jrA/B5p34Vfi9FVFm?=
 =?us-ascii?Q?cut4+axwl7qNSCyTa1UqkCyzOGr9dJEBhCPQwGVA4MUrXsJZPUEuPrXREeuZ?=
 =?us-ascii?Q?XZ9O/o71/+7oB19KxAgO6zPAB7Yu9PAXa0BRf2I6JlLRzz6rrzSMe//xlo0+?=
 =?us-ascii?Q?X+cOGoOgu0Dkf51DOkEP1BS97m+Oy1JiGWnu3czNUlM5DUDUgK8x3tdFlAcm?=
 =?us-ascii?Q?sK/jVa6Ljq6S5dSXADMuworDr4CySUrmJXDxiqq3aFgZ6o6BvQmhs73QGCDJ?=
 =?us-ascii?Q?XK0FvhZPWDIAbkPbUVofOR+Mr4OByIIK8iDla9dTjaybTHfDcsQmEb61VDgy?=
 =?us-ascii?Q?vTwvDv99fnRhgXlQfiCz2ZPJxjrXcVSatrKlpbL/vEeurh7Adwqdvn6yUDwF?=
 =?us-ascii?Q?eWWGtyvOnsnf3vgEsozQAl6/4dTLVKX96jVUraPyQjEkRAxeGj/RYYvp011N?=
 =?us-ascii?Q?W9hA6Os3i6Q1IGyGK3GJsNlx9nq5rqizO8q9moLAc1L+rI2hRF26TVHw4qDh?=
 =?us-ascii?Q?F2yOBPnCOtKlUOTqVdPpC2qiG/3NUDF4V2CrXSg5wCDHKmpmEZrysFRcxHja?=
 =?us-ascii?Q?qkEDSoOCxLCEcSn6+Rc867BwuUahuMrj+3nD6AKTK21h7ZVyNiPtA6wg49gO?=
 =?us-ascii?Q?KaJl0/wK74qthnn6SyIiQpNdJGqB/SFe6OkO9ymgjKWiKdqdm36PoMNFi+TP?=
 =?us-ascii?Q?QC823HyfmDnH2dSgpcgNwV5zdupBQ1p3jAF/AhnMPZh+MOfvMQnKk8w2iyg3?=
 =?us-ascii?Q?AzoJ2TskDyTVG3VZMaaAsv3q4X+bOTNmfnlqhu/5Cf/NwVWZbsuwxP+Z/NR9?=
 =?us-ascii?Q?ox3GINPKwXiez2hVZEsjPTrCsP7qV6IOTedo+c4swARGHb71lt9coYFyulLm?=
 =?us-ascii?Q?d/2IM0Xw78lr6uJeqQ5L68CUAEbIpzasFW8cZ/OMkC+1C+cByxMguB3cQ9fc?=
 =?us-ascii?Q?dhTCH0PkHM1FFKavjg6IAm2onA+xKYQ6eBoaHwketDEVITPcRj5NnQRaWjMh?=
 =?us-ascii?Q?BblpOHZB14bUhzTAztbAtGbyficbrxnia2hTtjY5MCXgMSXNNx0gSvPemgPQ?=
 =?us-ascii?Q?0J6RMempjenDjbdt34YBM20Y2oIHzYn+jM8749Qh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: def71353-6a85-4a4b-30b8-08dc49dee120
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:41:19.2387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dbet0jc32iZ4bLlBzMguFr/JqeH8JKpH28tcp+JlqIxCccWr/EJBUot0lGh1hCUySj9RF0PExEaKRL7583AbpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

On Thu, Mar 21, 2024 at 04:09:28PM +0530, Himal Prasad Ghimiray wrote:
> Use DRM_SCHED_PRIORITY_KERNEL instead of hardcoded value 0.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

as I told you offline, with the xe_execlist also taken care of:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
> Coverity Reports "Parse warning (PW.MIXED_ENUM_TYPE)
> 1. mixed_enum_type enumerated type mixed with another type"
> 
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..1f712f4fc76a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -63,7 +63,7 @@ static inline int
>  xe_sched_entity_init(struct xe_sched_entity *entity,
>  		     struct xe_gpu_scheduler *sched)
>  {
> -	return drm_sched_entity_init(entity, 0,
> +	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>  				     (struct drm_gpu_scheduler **)&sched,
>  				     1, NULL);
>  }
> -- 
> 2.25.1
> 
