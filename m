Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B4DCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 16:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363BF10ED35;
	Wed, 10 Apr 2024 16:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX9u5Mf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6F410ED35
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712766539; x=1744302539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ns5ANpkvxAxnHRFlW0CnRO3IvUDj7PIDU1ixs/BJ+Ic=;
 b=BX9u5Mf+rsxGeFeP31Y9Ai4Phe9L4H3IogJYYgcuLz/+8f+YjKx3dn6H
 wg5jRsHrcEilrUKldh8/giRMFsT/EIKXHqehEnpg1HecXb2tJChO2vDWv
 XwmlFNnRgRm7bDfT+ThXfdB9Xhoc2mW5U5kFA7xqEUSeZMacxWtdhrGqZ
 iX0BibX2O/b4HgGnF2SkWKGFZRzRCvoVoY/vYROGsejUugp9SVnImsTni
 j7Sq3Xy7lhELn2n6te9uIGvyGTUfHfP1S32ToGnxqnz4U4lwTBYxFY26a
 tl6vxxnZkyQa8lc7vymYOYbJA5yObnschORWRRAbJEr5mDjVb6gG2DQ9/ g==;
X-CSE-ConnectionGUID: +OcEqHCtQ7SiFNAfBEh8FQ==
X-CSE-MsgGUID: 4dLW1kmKQJq8QB4h6yQXXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8303875"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8303875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 09:28:58 -0700
X-CSE-ConnectionGUID: 04ayG6LaSSuZJPGZEldYyQ==
X-CSE-MsgGUID: Sq6PYBo9SLqDLI7jm8oduA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20628590"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 09:28:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:28:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 09:28:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 09:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVcj6Oq1IDEV01ehRX5JDi/Hw5Lc1NEq5kFdoHuXY1mce2SWBVqCDrFRs84XAESQgLleA44TlTZLuAVMXZTl1Nf0tPXqf/PSj47zFF4prO47ZCbWySk0y9wmZwhHl4MM5WQdyUqgMlxUwr1fH+xpCekxmNNmEms7ycWohxgFISeBSJ5irsrKKSOm+tz9gr5vgWH0zojs8Ze3H1kMl+YZuWMcv4TRRBjVGT1rueCSVA1vD2Az2KNJSWxY59ZC0C8R3OY4fps7sRMq0nNbIXc7OKZllUuFP6XfLLDc7AlYma3UoHJdp1UCcHuCwLt2BkHoAJ3D4djtNzo3jun7Upxzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrYE2X3Er8VpkvLNGLO21YjWjpWyM+uikM8DQ3XzJR8=;
 b=hX96XN6Qck2iUuFIRcTyApqibUN2JoANH0X4DDLkhdNdAzMwo6l64zNNfy9nC4vGcOHKgN7/homNWS4Vqqv0/HWrmy4kpJwm84c2BJgRIzJUkKtddreLSpK3CzRNA0ZhIqt3PdEBwIm5kWffOi3O+Cp13eV5JkhiNPNv8BLlq1UkfjyQktM4Rzqe1ePP0qx6cVPQ4d14ittxwnAvWGCkmuoCi1NES5neDoBycBwNcjaz1umk1/hcz1dhCrJI3axsEV1h9Xv910gPwbqrfDCAaXSFzkzvuOB+pHR1AfIdiAffhQSvo0EiLHoSbQk90sB2GColCIQ7hKG3a6v6PVzwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 16:28:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 16:28:55 +0000
Date: Wed, 10 Apr 2024 16:27:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Don't overuse ct_to_xe()
Message-ID: <Zha+BaMJS3WGSV/E@DUT025-TGLU.fm.intel.com>
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
 <20240404193647.759-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404193647.759-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8NIfEQCNeL9WM0faQXnKZXe1/I3FA2Z8FOCz7lRUKb7XPSGPPzcxwHtA1U4AVqf7chZCYZL4scXFS2gh/E2ilUFEZABetGR9xR60H033+I5CBaiQw+AVvkgjCMGPNIIYSTaZfi4+qdnIusmuEbz7tY9d4XSBzpA0HYhIF6w/OEExSjxtEYGSpamq3ezMno3IMUs9aLLH2vXgfutEge9+dVPco5Ryz/5cTPKA1kUAg5X/Uw9gAwDIbsFpXlHWnd/j2OrY5qOXxyGmVh1tRkP6UQ5juxny5JLvL14Qedd2WUP7z1orLit5rqbDuMYz9iufv58CA1hmXFgdNnp71dEKJgPWicUnyzXd4aZk29H6sAKlJSKix+ePaJaeXhgjmxkO24pmbiqEKknSkWooUZp5qOo3byCCuQosOo9dZn7/ay79Ve9BbJ7rLclL+sewm0l0WZQ+z1f3cfV4dNpS6PDcEp+11rjJYfBA1hlKjKAdj8xXt9BovUNiQ5cvwLMdJBocdAmilHgc6e0Ri3OiVuAE7GAdHJ0SHqWDeB0yb3HlfpJDJV/cI1eKTX+C9KteEMQq3o5fdA5+Gty0yneRtv58VHA5QCSwrRcjKTjiUOHiAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+VyV64pPUs1G3I8JgrJD5jNinTQ8D0e9Kims+bL8ZPAM3Fed6oeLuO6mJn8h?=
 =?us-ascii?Q?p1pNot6beS7kYkIlhuLsavGY0beqHuWdjmxMCknbTg7nQZbskMfh3nms+7Gj?=
 =?us-ascii?Q?heTPz1mDGwzNAy5sGg3ggReGF8H1kOjh+e/HrCmyD+8vohPjunazI9fmGEG4?=
 =?us-ascii?Q?Vt1VMn/0mLKgYS/K6DZMX5nLPBUnIBqoxB44/luVULd95xECbGSy2fqsY5S6?=
 =?us-ascii?Q?TQiIwBcyzzAZAwGHAUuHv1nlcWx0kVxtHm6f7BsDKwtAvyatPQN0piLR7uuV?=
 =?us-ascii?Q?jKOSOp50BSz8SuFdlarZfWQBswMP1b7xVsjXwmJPcrQQqVfK2PejoCf6pwWx?=
 =?us-ascii?Q?fkMRsEqcZRoGmndTwmt2JPjKRFYv5ia3GaR29rPISMtJsxM9MF+Mb5CwSz7N?=
 =?us-ascii?Q?93XARYlEd0iBkfaQ2eFPo73hs16XQUxWzyjf7quSThrTIfitdp3JtEKOKH+q?=
 =?us-ascii?Q?opvAitfnS6G/fLVzt5aI8f2XtNlV1wFhEMs/DwGsAe/A47tnQKZ9CuLEJb4T?=
 =?us-ascii?Q?rSojhNagv8vg9pQtxt6XSRELb3OYBUPyiBuk5k0hGARfOo18GB6mQfxgRPiI?=
 =?us-ascii?Q?DlRLTCw9zfIO/ap1VarOqgk87V7WsLRsBsaMz03RsvYJ0jp/SfGdmniYnOf3?=
 =?us-ascii?Q?RWTnDpwmfqEpKrIPffnTfv77KcTUC3MFH/n/fo2Bj1F5IQjdG7LorrYYhIVC?=
 =?us-ascii?Q?4yGgRq+IiMCPG1gXuVQj+SflI26nYfofJhh/GwtFm1Zc5xOgjSyBkbWytMJT?=
 =?us-ascii?Q?Jnz8hoFzbLL4NdEG2rQuFWZ6AzpTg7vO1wltasHiJLIr0+DsbpJCGEPlr0Zn?=
 =?us-ascii?Q?IPqmOf+ZGNPzflSh0jKM1ziYFxU9Z6epDBT5YkAS63Mijjsf0F897TrweqeK?=
 =?us-ascii?Q?PK95p9WE1E7d6uZAQNopVhEkSE/GmsB7iT73VJIWXe37Fz0KoyUcsf/crU6s?=
 =?us-ascii?Q?hJFAJiNHfrEFW9bJIoaEGoocHeW/OH/2kZtbJYh4jCSLOLWqqO9oQl9/hTgE?=
 =?us-ascii?Q?t7R2c39YHlOaH+zXCHZrlOV3YA5zpCs1zyy4PPZ+azvTi4Yfq0eboY2sTASt?=
 =?us-ascii?Q?WQYqt9omjxWiEE4bTgQ2lFNIbJFtCL2SL4T2EyMeesHW2FA2eWAqGIAv/tpB?=
 =?us-ascii?Q?YusC+kUZtP/6ISmlMc+/3MERx1hW3JFSg1SeAGVxEDH+yD4jHWQ5o8UGa3N5?=
 =?us-ascii?Q?gWRhSQx8HFgIjJngD21B11ToyCpE6Ml6RG6Fy4smul9zwqlTFi05fDST5qG7?=
 =?us-ascii?Q?mKbCoCfsOsRdQf2o4n9skpuz9HhRQsjCCKjGSCVBVLS4IBdNvsng6Owyf/zJ?=
 =?us-ascii?Q?21DhHEFRlYjOewuQV1MXXw7ejB7sPNMjanjO8lcYQ353QBYZXIKuMkP/YskB?=
 =?us-ascii?Q?K0DDkqQj5IQtzMMvW5TFIMez2a6K7g0Xl13tzNYM6u9hOtVobs29rcAsh67G?=
 =?us-ascii?Q?5ieadp/C6Z4y0Owqlh4NGipoRzQtE+7NVyTd6VawCi6cEXdL9dx1wpzxegAW?=
 =?us-ascii?Q?es5yZ/ganNFDJ2psdfaD6oSQOvLpsofIlSv+pZiNguo9ziQXcp2FxTXBW9TT?=
 =?us-ascii?Q?iTs5AjYxVMISrSl9/ZYWWCmC/AA7ccaJ8udrjd66fACVmDjQnTQoEVKFx8Nq?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8be149-6ff3-4b17-b0fb-08dc597b5100
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:28:55.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIgyF60hYODjQYtd3g4v9TvUXbmJcKVtqyS/EhMXL8EQdl1rGM59mqoHlu3k0Hf0wNSlIIY+tFFPUXYLJNMcdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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

On Thu, Apr 04, 2024 at 09:36:47PM +0200, Michal Wajdeczko wrote:
> Pointer to xe_device might be already available or could be added.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

This is going to clash with [1] so I'd drop this for now and then
revisit once [1] is merged since [1] is an actual functiona change that
Rodrigo has been working on for a while now.

Matt

[1] https://patchwork.freedesktop.org/series/132240/

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 06952b0480f7..ae255dab6516 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1210,8 +1210,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>  	bool ongoing;
>  	int len;
>  
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> +	ongoing = xe_device_mem_access_get_if_ongoing(xe);
> +	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)
>  		return;
>  
>  	spin_lock(&ct->fast_lock);
> @@ -1254,6 +1254,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  static void g2h_worker_func(struct work_struct *w)
>  {
>  	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> +	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	bool ongoing;
>  	int ret;
> @@ -1281,8 +1282,8 @@ static void g2h_worker_func(struct work_struct *w)
>  	 * responses, if the worker here is blocked on those callbacks
>  	 * completing, creating a deadlock.
>  	 */
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> +	ongoing = xe_device_mem_access_get_if_ongoing(xe);
> +	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)
>  		return;
>  
>  	do {
> @@ -1299,7 +1300,7 @@ static void g2h_worker_func(struct work_struct *w)
>  	} while (ret == 1);
>  
>  	if (ongoing)
> -		xe_device_mem_access_put(ct_to_xe(ct));
> +		xe_device_mem_access_put(xe);
>  }
>  
>  static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> -- 
> 2.43.0
> 
