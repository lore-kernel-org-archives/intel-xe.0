Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC5CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 23:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9598410E505;
	Tue, 17 Sep 2024 23:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GllhntI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0530410E505
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 23:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726616424; x=1758152424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MX2U8YCMvd8QdhXGlJK3PVkKhN2uQ5D4WqW37v2Owpo=;
 b=GllhntI1CzNWa2aNa0kEPA+n85U4+3zzDUbYRsd0NyXm8lIdModgaEfM
 SCRaY+l0T8CgDNOLcWBq3CsEzJ0pS/e8hKIEZ4qMBrSVXr9unoRrj9z94
 YXrd3lXhOr+VhFHdITgWHjfA0I+5Z1aWPT/Z2qgIIY36/ktekDJn3WkAI
 lL6ZF+TGQIDJwnKp25tLpk/N283/8n3DtQR/kS782zuTBD0WYTPQb3ya3
 81yrxLQp2kc33OTegxwppvSbJMYZXQkFk2+Sz2hAZt+S+uRtLyF5UR61G
 SqiJNy/5VIVikt12aE5GFmerVchihJK+bwSXpn6sBG//+oeLjGceRyce1 A==;
X-CSE-ConnectionGUID: EFgFjQtCRQWuAHfinAJ86w==
X-CSE-MsgGUID: JqNW0MavSQqb7T6uaI0RlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25389871"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25389871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 16:40:23 -0700
X-CSE-ConnectionGUID: 9p3o1OlzQUuk9mSyXw4V0g==
X-CSE-MsgGUID: owJIl6AiSi6cMlYu7jZ9qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="106819752"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 16:40:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 16:40:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 16:40:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 16:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrt/uGU2esjV9SJQpnD7ZHCJx46zJ+oEFNN699PCyqPWiXezLa9cue/nn/V5XwnXiPWsarT346YXt146v8YDPd6eMNhvmSdbx6PxXxoPkCn72llublIhuIu3nyj7s1BNp3PwsYY3KaWTbE9vOpZDcfqd9f1q8lMMOTAIGXUk8v15Nh8p7xiZIiOaMAAXBuh+WnjBWRUOHIHlsoC5Y5ePVCvNh0okVLeLojePku+Is68fNJT4NjsK18jeDCtL7s4BLXrCCzFrULaNG8dzvK2DPRzGdX4qal4ZKQJHjH4KdKxr5asXESJXhD7EVX5qHdaOBJAp27ggqrKN0o0aWKt07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pht30WcN4AMJj/3b4VHu/Z7l8zT6f1417FYGtKsvOKI=;
 b=pcDYyFQ0iJQGfnEerbHd9bJ2v2IQ64N+g+4T7SWZ8P1xhppryiDSvj4+ANTWGaWKzLsKSnziWKmL9C2NIh5buk4MkuoKvtzsds8Uf0L3JIRY0KoCRDguBmDu/2dvSNWeeIP2joI8ZE4QOcwk5l2R4EIX3h2D4YZy+0ntg1B0Rj/8S1+BGBsjqRBFoLdsaAdG+T4WG9j2EgynGqMV449mWOna1dSnu2nb1WV3DHhlkDC6ZH3DIx5lHO2aAdqeevOPfdwbFjVAaAICcK+V2LAOpkyO5uxZ3Y4CYBIXYiqJeTQinSOGo5wckz4SbCBaOz4vV53XW2QWeGacTqm+iFsRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 23:40:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 23:40:16 +0000
Date: Tue, 17 Sep 2024 23:38:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/oa: Signal output fences
Message-ID: <ZuoTA0H76Btd8jIf@DUT025-TGLU.fm.intel.com>
References: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
 <20240830221618.2103948-5-ashutosh.dixit@intel.com>
 <85ed5h7wmc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85ed5h7wmc.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 362f48a3-bed7-402f-b6b6-08dcd772155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jws0IZL4/F4YP12sUZBBgnczSuknuvla1Ez+ODfiQJDRf58Jxa28pqfUBJfa?=
 =?us-ascii?Q?saz0c1VvQfcNryfOJVFciECZN4mwLHS6UmzRcMvP5zxSOS7wN3mkhrHe+HKW?=
 =?us-ascii?Q?4QhCPJdzJWh46acg883W8Ju8cnllqm1Dze7k+fV97aQt6aGC1dQgkm19XEgo?=
 =?us-ascii?Q?Zcskg/GLpY/EkJM2Vg239E7DHBunIGGezFoVXAD3aLKkNRmkFtZNzDx55QNg?=
 =?us-ascii?Q?Jjso+359MoASXnEs04SQHYKjTgFzVEPpNFBEnNjKNHmrj2MfigSBvcpS/Kl0?=
 =?us-ascii?Q?OXu5G/AJYclYqZ9BxehNbOeuB6z6clsjj+wy+CsuecI9ZjzAKHFAG6a7JTfZ?=
 =?us-ascii?Q?Avn1mZKlAHE0gaBMEzuf2YTNbzbdXSYAphr0iEPZDiWonWvl6OpqjdOvqgxG?=
 =?us-ascii?Q?swcAfc4kFr1LU/gn2yvnnXqDqUC5xmQ0Ge1eqqt5P+N494XrhiS0XpdWJV98?=
 =?us-ascii?Q?mK/j+Lytyp59v+7xLqn4AEXbqdC50ZR4CmX41MKfFOE0mOesrWsPHXkVEkkI?=
 =?us-ascii?Q?lBLUYkfyoffO8EXQ7L5ae84Bfvk3q/TNKmvsE3jAeDoyY1fVFzA905PrjAdw?=
 =?us-ascii?Q?mTMkotpYpH5F7cYqkfEeO9PSakl/XS2Biab6bsd6h5oFWG/c2+s9L7shh3mZ?=
 =?us-ascii?Q?HMNZy4lYr3e49C4Np4Kfth9EOcrBryhCyq853ZhjmepsEBPhAMrVbBzDH8OW?=
 =?us-ascii?Q?9uXOSGpNvqhe22S1UiEqBvxNK64w1Rci2YRE/vJTBCQaL+v0FqJ6nlqC8pP8?=
 =?us-ascii?Q?vctxApYHfi0mMCyo5DhYV89BLoiOB2WqOsbRCVCXZVGfNeoUFvbDjcLhEgCj?=
 =?us-ascii?Q?u7Jwz5vO42XhXpNa0BmcMBSTpErU286hmX+Ie1rsW0cf9osl6CXVn430odlz?=
 =?us-ascii?Q?rmGAIkZPh4mVcjBgMwGFV8QOI/QJw71gGI6SzQzhq3gH2ZdjEaOrQoQTyZx/?=
 =?us-ascii?Q?Hn7nSmSsFlfYaeriyyH8UUHXWi1+VWF4Hz2PBU2cDIXJPesOvBRj5SxHZf+2?=
 =?us-ascii?Q?syiuwkv+ySXHnr/eFJsnxDF6t04B3OjH/PcGeeXQJSJHQPMZ/7RP5Ba5+QQF?=
 =?us-ascii?Q?HxZnTzRFBcfeZVYzGaZCiACRVKjd8XB6HCYy5NGp8YzY7+YiWneEnezayZRG?=
 =?us-ascii?Q?EsnMyAqcS1DuuX8NyxUJ+Ij3Al3X+C6r+qX6Jk/OhkW3uAFPMSeAbs9By4pI?=
 =?us-ascii?Q?q0djaZ+VdOkhqqL4TWQnoilDc1rJRy+aoglYYCS+tLQKq3CTAIicPxj1aJW+?=
 =?us-ascii?Q?Vz5nkIxg7o26fo01cKMcpJS4O4MXXvJ0E9YFy0AwndUk9OGBB+6ZfcfYs3Ur?=
 =?us-ascii?Q?PS4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZK94KMzyxMTalu8vDzQ0aUDJpArJ/q/N6TY1GyalY3hu9D/Wv2H5hCIRo0/?=
 =?us-ascii?Q?/t8QnjOZoGCJ67y8aYKUColHc3nWIyt9usOXFrvkzGhRs8+ZYYyL7wbYsfbP?=
 =?us-ascii?Q?cbVvLgym4N1wqfE1C4LBaAfBp5ywrgb17jY6OJV3tzjt7r+HAfIYBuCO4+ze?=
 =?us-ascii?Q?YG9vtMnCr/SlVWkWPNKQaDHhucfb7irLZCtn23FFJyayDy4kZJJQayt6hNM1?=
 =?us-ascii?Q?RIE8iw0fhYqk02nQvUIePLN46Flmwjk1w31uAAdrQFeLWpIt4KVzLlw2EHtX?=
 =?us-ascii?Q?FTbI0UplaqgJ/D38/RRYStINlT6ESiwM+qZHQ3KbYyZh35/Pr8i8CCFRd5Mg?=
 =?us-ascii?Q?PWDZ/7gMnyHLRQY4oiKf25iX3WwYJpz5ZP3KvaUPu8lZDM/FOe0Prg3q5fN5?=
 =?us-ascii?Q?roRCLYN3B8aLw1tGAQniyCfa186Pq+u9ivgeHzcknGq9/x1Lvh/iOm9ODNLM?=
 =?us-ascii?Q?g4JJhSPI39CC0AdMxQCCSXswtwwhxH0onh0IBBwEdELZVe9luX/GMqgUzwUq?=
 =?us-ascii?Q?hKxkRI8HJAMZU2lDhR8TxsgeE5gWaOMQBcFmHr2Xie7e4U8ojLEGNgEmlqh9?=
 =?us-ascii?Q?jjBEWRa1EH26HCTDoNUlZAGr5TeZnEk0cC7XHRqhBzWzheLgHgvqKEGwyPPo?=
 =?us-ascii?Q?b9PhjOfqAWPpkf+so3h8DwP8QzuEjNgF7535Xk5SP0Ch6NUxMDB5f4TNPlLu?=
 =?us-ascii?Q?oZZf5EXuloFy+HD9eyxRxsSh6bdAUPifhJFO4cap9cLAJNGpodZeqN+YZI8t?=
 =?us-ascii?Q?k2w2S4WfAw98KjqW38ljo9XE5/1GoiVWEk1BXAA8Tc7YAxB3nU/MBCEQv5+Q?=
 =?us-ascii?Q?aF8NPL42tOVemnjC0GodSQ7I0Y0d4WiLx3I0jyQoQWhI+9nYEZwglJdjZVhc?=
 =?us-ascii?Q?GhH/nfPsuL5mCUXadWBsbfIO/bZ92yfLOB9Bnod8g4nZzDDRV7wwagcpsR5m?=
 =?us-ascii?Q?e8l9OAIAHqv7QeNdfA4HPjfmwYk2nashb2EM1tc2aEa91JrJna8LTqkx+IqE?=
 =?us-ascii?Q?mMob3Em9SZM68GSBNvyrTeNh1a+eb5YYQVsQ+mCbWX6XAaK+i+caDyFSH5mA?=
 =?us-ascii?Q?ik3hsvU1rjkJb6WTuLOkSpYlJ6yfZL+/gF/VjdfG8FF4hsusyCVLzjI2EFgA?=
 =?us-ascii?Q?1n7M5DfSBEMqqxTuKtsfvyDVJ+CAm5mEhtiRyFAH34NpnzxgWEYgTjJrUsvA?=
 =?us-ascii?Q?HLkLll1OAsDYtTgbmCUXtLyYxb44U5jAEGby3CqRJJ4VI9f+kVzJBZ0L0uwi?=
 =?us-ascii?Q?wz18Q+g6uoN+pPvP+0mJFpynK5W6GysUg25uSXO6GMoEP23wLBi7e8XLHU1Q?=
 =?us-ascii?Q?Ma5H1ZADkHXzlDCUFNUbhq1CMadSb2tQaoz6yG/Gx3z5AWWK4NHSNz1NgSw/?=
 =?us-ascii?Q?pdwWb0W7Hm0x9g35HivCUltcSThtHlf/E9o2FfXh/HtMWHG6YlBqCJeEnqqb?=
 =?us-ascii?Q?PSQXI1URfKKLRi4a36D0leX1O5BVu8k3fGAKep0eapYlwlyPCWLlyCdxfsj1?=
 =?us-ascii?Q?ZH+wkLYlaXJ28B9pWYgZcaqkAjNYorFnQXEY9uZ2K2Tgbx+j1BvmIFPm2KPV?=
 =?us-ascii?Q?lBulOZsQU+F+ThI45Ewpc6VFzJwqk6XhExkbqQSEyHi4yzY6NC28fG7TpF1t?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 362f48a3-bed7-402f-b6b6-08dcd772155a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 23:40:16.5427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx4RIbKaad+M+eLAMiq587waF5KGqGnb8aOSQfbhV76XeJUeP7+ONXB8QC1H11ZHGrav5mm2gzxhlz0npcJMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

On Tue, Sep 17, 2024 at 03:18:03PM -0700, Dixit, Ashutosh wrote:
> On Fri, 30 Aug 2024 15:16:15 -0700, Ashutosh Dixit wrote:
> >
> 
> Hi Matt,
> 
> > Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
> > output fences in the xe_sync array. The fences are signaled
> > asynchronously. When there are no output fences to signal, the OA
> > configuration wait is synchronously re-introduced into the ioctl.
> >
> > v2: Don't wait in the work, use callback + delayed work (Matt B)
> >     Use a single, not a per-fence spinlock (Matt Brost)
> 
> Want to check with you about this "single, not per-fence spinlock" issue
> below.
> 
> > v3: Move ofence alloc before job submission (Matt)
> >     Assert, don't fail, from dma_fence_add_callback (Matt)
> >     Additional dma_fence_get for dma_fence_wait (Matt)
> >     Change dma_fence_wait to non-interruptible (Matt)
> > v4: Introduce last_fence to prevent uaf if stream is closed with
> >     pending OA config jobs
> >
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_oa.c       | 117 ++++++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_oa_types.h |   6 ++
> >  2 files changed, 106 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index b4b68019d35b7..56f95fd431bf9 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -100,6 +100,15 @@ struct xe_oa_config_bo {
> >	struct xe_bb *bb;
> >  };
> >
> > +struct xe_oa_fence {
> > +	/* @base: dma fence base */
> > +	struct dma_fence base;
> > +	/* @work: work to signal @base */
> > +	struct delayed_work work;
> > +	/* @cb: callback to schedule @work */
> > +	struct dma_fence_cb cb;
> > +};
> > +
> >  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
> >
> >  static const struct xe_oa_format oa_formats[] = {
> > @@ -172,10 +181,10 @@ static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_se
> >	return oa_config;
> >  }
> >
> > -static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
> > +static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo, struct dma_fence *last_fence)
> >  {
> >	xe_oa_config_put(oa_bo->oa_config);
> > -	xe_bb_free(oa_bo->bb, NULL);
> > +	xe_bb_free(oa_bo->bb, last_fence);
> >	kfree(oa_bo);
> >  }
> >
> > @@ -648,7 +657,8 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
> >
> >	xe_oa_config_put(stream->oa_config);
> >	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
> > -		free_oa_config_bo(oa_bo);
> > +		free_oa_config_bo(oa_bo, stream->last_fence);
> > +	dma_fence_put(stream->last_fence);
> >  }
> >
> >  static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
> > @@ -945,40 +955,112 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
> >	return oa_bo;
> >  }
> >
> > +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
> > +{
> > +	dma_fence_put(stream->last_fence);
> > +	stream->last_fence = dma_fence_get(fence);
> > +}
> > +
> > +static void xe_oa_fence_work_fn(struct work_struct *w)
> > +{
> > +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
> > +
> > +	/* Signal fence to indicate new OA configuration is active */
> > +	dma_fence_signal(&ofence->base);
> > +	dma_fence_put(&ofence->base);
> > +}
> > +
> > +static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > +{
> > +	/* Additional empirical delay needed for NOA programming after registers are written */
> > +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> > +
> > +	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
> > +
> > +	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> > +	queue_delayed_work(system_unbound_wq, &ofence->work,
> > +			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
> > +	dma_fence_put(fence);
> > +}
> > +
> > +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> > +{
> > +	return "xe_oa";
> > +}
> > +
> > +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> > +{
> > +	return "unbound";
> > +}
> > +
> > +static const struct dma_fence_ops xe_oa_fence_ops = {
> > +	.get_driver_name = xe_oa_get_driver_name,
> > +	.get_timeline_name = xe_oa_get_timeline_name,
> > +};
> > +
> >  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
> >  {
> >  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> >	struct xe_oa_config_bo *oa_bo;
> > -	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> > +	struct xe_oa_fence *ofence;
> > +	int i, err, num_signal = 0;
> >	struct dma_fence *fence;
> > -	long timeout;
> >
> > -	/* Emit OA configuration batch */
> > +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> > +	if (!ofence) {
> > +		err = -ENOMEM;
> > +		goto exit;
> > +	}
> > +
> >	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> >	if (IS_ERR(oa_bo)) {
> >		err = PTR_ERR(oa_bo);
> >		goto exit;
> >	}
> >
> > +	/* Emit OA configuration batch */
> >	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
> >	if (IS_ERR(fence)) {
> >		err = PTR_ERR(fence);
> >		goto exit;
> >	}
> >
> > -	/* Wait till all previous batches have executed */
> > -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> > -	dma_fence_put(fence);
> > -	if (timeout < 0)
> > -		err = timeout;
> > -	else if (!timeout)
> > -		err = -ETIME;
> > -	if (err)
> > -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> > +	/* Point of no return: initialize and set fence to signal */
> > +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
> 
> About stream->oa_fence_lock. This was added in response to this comment
> from you in v1 of this patch:
> 
> 	/* No per fence spin lock, global OA one for user_signal */
> 
> here:
> 	https://patchwork.freedesktop.org/patch/607602/?series=137058&rev=1#comment_1104327
> 
> However, I just realized that, the way it is implemented, there is a uaf
> here: lock memory can be freed before the lock is accessed in
> dma_fence_signal() in xe_oa_fence_work_fn() (when the oa stream is
> destroyed).
> 
> Of course we can implement some reference counting etc. to solve the uaf,
> but the simplest way to solve it seems to be to go back to the per-fence
> lock, unless doing so is incorrect? Looking at dma_fence_init calls, I do
> see per fence locks being used occasionally (xe_preempt_fence, vgem_fence
> etc.).
> 
> So just want to check with you if it's ok to go back to the per fence lock,
> or we should solve it some other way.
> 

Yea my bad on that suggestion. That is an issue, just move the lock back
to the fence.

Matt

> Thanks.
> --
> Ashutosh
> 
> >
> > -	/* Additional empirical delay needed for NOA programming after registers are written */
> > -	usleep_range(us, 2 * us);
> > +	for (i = 0; i < stream->num_syncs; i++) {
> > +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > +			num_signal++;
> > +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> > +	}
> > +
> > +	/* Additional dma_fence_get in case we dma_fence_wait */
> > +	if (!num_signal)
> > +		dma_fence_get(&ofence->base);
> > +
> > +	/* Update last fence too before adding callback */
> > +	xe_oa_update_last_fence(stream, fence);
> > +
> > +	/* Add job fence callback to schedule work to signal ofence->base */
> > +	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
> > +	xe_gt_assert(stream->gt, !err || err == -ENOENT);
> > +	if (err == -ENOENT)
> > +		xe_oa_config_cb(fence, &ofence->cb);
> > +
> > +	/* If nothing needs to be signaled we wait synchronously */
> > +	if (!num_signal) {
> > +		dma_fence_wait(&ofence->base, false);
> > +		dma_fence_put(&ofence->base);
> > +	}
> > +
> > +	/* Done with syncs */
> > +	for (i = 0; i < stream->num_syncs; i++)
> > +		xe_sync_entry_cleanup(&stream->syncs[i]);
> > +	kfree(stream->syncs);
> > +
> > +	return 0;
> >  exit:
> > +	kfree(ofence);
> >	return err;
> >  }
> >
> > @@ -1479,6 +1561,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> >		goto err_free_oa_buf;
> >	}
> >
> > +	spin_lock_init(&stream->oa_fence_lock);
> >	ret = xe_oa_enable_metric_set(stream);
> >	if (ret) {
> >		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> > index 99f4b2d4bdcf6..935f98772a948 100644
> > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > @@ -239,6 +239,12 @@ struct xe_oa_stream {
> >	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
> >	u32 no_preempt;
> >
> > +	/** @last_fence: fence to use in stream destroy when needed */
> > +	struct dma_fence *last_fence;
> > +
> > +	/** @oa_fence_lock: Lock for struct xe_oa_fence */
> > +	spinlock_t oa_fence_lock;
> > +
> >	/** @num_syncs: size of @syncs array */
> >	u32 num_syncs;
> >
> > --
> > 2.41.0
> >
