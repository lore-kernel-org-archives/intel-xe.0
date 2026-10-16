Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18510CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 12:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C70C10E246;
	Fri, 16 Oct 2026 12:38:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024F10E246
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792154294; x=1823690294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YzbrvlVTMrOvvt4hyIWI6YEOgUxSJsgzyks/6KwDPCk=;
 b=h7tMDZHhexoJDIbP67LEkERCCwJiVG0bmU9yybXJ8OAsYyIYZASG6n2M
 SD/KbVl4/B2IVJ68mf9CyqZdtw6HEbynjw8SaJ727dGK5/Wor8+e+pusd
 X4vZTHx1nViEAZKLrfI5iEAOHq+GgONYWieVws4K/vbBMmHdOp1cFbhCd
 hAghPTWtshkF4aN+x/zcWTtwt5xq9U5aQOLWq4t3wqAwEuCB/HMBiEoHv
 udT66BRDZAe6+okpykBl99Gm8akITkJm9aFQAUATWfufrP8AwMR9ayCqY
 /7nM1PtglVnYDqVpepGUZRr6sZBGn1/YHrbmPFBpVSngtF3rCeoTlyN0I A==;
X-CSE-ConnectionGUID: nmmZHIjjTaKVl2NbfsfQvA==
X-CSE-MsgGUID: 7dtt7AzSS9SRJSnHBuCbZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="822524"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="822524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 05:38:13 -0700
X-CSE-ConnectionGUID: 1HAbPvOnSN+gnhpy44CHWw==
X-CSE-MsgGUID: 3BS0N/LeTfW+xJNXENwRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2001215"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 05:38:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 05:38:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 05:38:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 05:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIupXCFioFocdGIzPBaf0OKWMp+sjOVn4QppS+1mKBKosLOUbs5i63SbtyCeAawjsE0Gb3A0q/OnmKfkGka5Knfd9QqUJKvyMbO1MAwfwKVg9AU6X9rG/vt1M2tiUHX5oXqyp66h/TDga7lbn+BFWGlv02ISZ2a35qoOm9+aHtlHyWQdgnqZlBRM1nUDAjHa02t8QiS2bxLAAdCGRzqRcjil8cS1N9yXCWZod03Xv4qL3Or1hrfeZJmR7RuXcIV868HrFBsNXTdjSRrc7w/AHwt9qgvZu1VRkpMJCCe79aBWezheRMMFlrNOJVtZ25YA05T5BU+iNc5WQUuv5CeVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qplPoWmD3IYnTGpImh6tv4xk7Dv5/aHaM239qaOlKTM=;
 b=eO2SiLHvBzwD8wp7nN0dj5kxQaPExd2efE1FtUtZVihhmAJW7ZnuxxQyDiYUY3c8pTkWlehXQRYcVo7SBwR6etaq2C0KAw8x/JKSXXIwcDavLlepKA5/v1/KN+wUU1Li4Ryb69HR4J9eh+RFAIMI6bjena1EK9y/SKjohJCHM+PUCYBO0lneiM56tPEg95C9BRqtxu3RGg2fvlqZ9TOgGjYZ0afNG2Pr8KuDgAW4Vkx1Uf+HKWKxzD7ik38ZygXnFz2zAnCQPOvIdJrAu8tjUwCnokxufVCekvknwK3gNeeF5SkvVC5kprckPxo36GUsMQRcm78zTVuqgqcO5T1lEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 12:38:08 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 12:38:08 +0000
Date: Fri, 16 Oct 2026 05:38:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 8/8] drm/xe: Favor evicting WB-cached BOs within each
 priority band
Message-ID: <atIarQkc0+BMXKwg@gsse-cloud1.jf.intel.com>
References: <20260731022439.2446486-1-matthew.brost@intel.com>
 <20260731022439.2446486-9-matthew.brost@intel.com>
 <55cee314-d5e9-44b7-98c4-8989bff2ce14@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55cee314-d5e9-44b7-98c4-8989bff2ce14@intel.com>
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 260fa7e7-9f8e-4b8e-1dd9-08df2b825542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|18002099003|56012099006|22082099003|260925022911599003|260925021311599003|260925021911599003|3023799007|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: sHC5XB6rp46ydgSlanKB9xnS2CZcnhwTkcA9325RkiwwnuJ0QpxN1XyGz5qqDbvMEd73wss6Uzmxxb7cw9xSWyXeSOPwW+v3dByx6r8PWTBFKc4ybROcrK8TQjF4hyY58RZkTrrGVqHVcEDpsYP1jJjVLkt18BHGT05SnkJwD87k966PXfKARXsiVIF3XEAPSoTIfTLqEH8jA0fNWXrf6w5hATf1B1oXIR9WQId843KjPVmvHL583mJeZXPtPmmFi/Gg+Dg9/A6ruusSN5pXwaU8OZOUEVpJbHcIdBtDgNmTY3b1UVP4cQm9V9VuR0yXNv5dixX2r9ayXrgtTtvKbKD7PV/A5VgFXhiLpdAp2qzGlJ9NpOawRHfiRJjAQRx3pNbgtY4mTZgt6q3DSvrXopZ4E0RIneYmmD8Z7zccPbdVsj4YSUgUPVT4DUaUXg7ksrKASwH3qYSbrPH1/xNghNi9Te4iuCrrs+Cl4X9aaH8Ldt9oYvq0/+SciyPtOyOGHK/Sri2XEGAVbyy2AfTE62Yaa7+pbiai1iYFJS7lT8Ui59UyyRokr2lzOlus6kzpAp2dPIGkLfjcgwoGIhvJNQE3pP+P0iZVkk9kYcvqAXeNPsZjnwOIgCEa91aEdQZ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(18002099003)(56012099006)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(3023799007)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f2VbOII0KydpeG/vctRYE516q8F/DBmiUEaHHKU+9inNAuGmFsG8pjAG+Ag1?=
 =?us-ascii?Q?F4xTtOiW2X48sPKItcSlpN1RXyAPYDRG4n8irmte9saaoxk5vf2AuG8Pdhv9?=
 =?us-ascii?Q?jrx1vmfM1xEyj5WuZyzmqTQNKOhsq61Y43AkMXL0juidNUusyOZbKbhM+0UP?=
 =?us-ascii?Q?vpRI8W9c9em2aqSf3xU37qbl68ai2K1HUIJolD8m8pBM3AA0RB1sU11JmqKx?=
 =?us-ascii?Q?1JNIB7FoYZJKZ23I9LUKNp9BuMXK0nohy/2JaP2I826PfaiSIX9plw92grzB?=
 =?us-ascii?Q?bAVk+V/zgIMXdIXmE2TPJvWeTfgrog1sJxcz+sbjXIXtBp23NnFav+8mJjIU?=
 =?us-ascii?Q?RfOB+cyKFzrzsNCF+Br880CF7iwtAnl4paq3jufHP/NrXXWuOFd1NGiu6YTP?=
 =?us-ascii?Q?wnYDb0hxVnv/KXeT/e87RRSj1MQ7+gQITZE/8ruiofC9nt82WZxUsndiJKzj?=
 =?us-ascii?Q?5EIndfC9snSpXTHQwPjrU9VcdcGMXZNTDzgSBgF74Ukh2rAYSb3Xvi7TJKez?=
 =?us-ascii?Q?ifHCxpybAwC7A8S8r0iJlFquWadTXpLlRmStATbBkL0maJPd7HWtpR0ryaSa?=
 =?us-ascii?Q?XLVdT2VG/LMA+mLbZqOuCXD7y/j+fldkv9tGgjCYGJvKi/8ag+YceiaZKpiz?=
 =?us-ascii?Q?TbLJGi8nSLXvXzFNvrVIc6y6VTBAxIKnRFWC+r07VAyWVUmpXhOGx1wQgTWX?=
 =?us-ascii?Q?wfj0ahdMrbHM1yQ99thn71l6VU+YogACPveeWDZnGxSu9mJWT9BdBfZk7jWB?=
 =?us-ascii?Q?9mVVSmvloxcuRQfUgMVuOB26m5/lCFdM0IQnNCtcgSpb7pDj55PiQEXjbKOW?=
 =?us-ascii?Q?ep/RkC/D5puX5WqIPWKu9wGWQIvUW8kMc14L05JBoxvi59ThGFNTYfyefPtU?=
 =?us-ascii?Q?fOUCMbRw+tinaxBV9p/1OmURznOFqQoBMq28vQ1u72muBqgyrc5dCCkZQ0nn?=
 =?us-ascii?Q?mCIJPRidEgyNRg9zul8wQsDWN0HsJEr4HfriRF1VNKTD31LFKTHHw3miIfQt?=
 =?us-ascii?Q?FBpG1OYKwcGsY5aR8/LEtJO61eTw+Yu/DGWp0WAdFpkfjaIIkMq0rcMSbANs?=
 =?us-ascii?Q?UdVwtCFdQYFRRmbq/acP/wfaaSF0c3ufLoHPhSTlXFFtTIBwIfkcM7BBlY2S?=
 =?us-ascii?Q?+UCxew0Bb4ZYlaUh3ELSgUdHqt08uPU1RJoP2KOLk7aaeC3jGuw8vW/Xbprw?=
 =?us-ascii?Q?ithsHINJHPJOXGPDitl4x1rPc8xOyd82dV0Neo68g+MUBsc1tl9x9i+aOGST?=
 =?us-ascii?Q?bujePr2bbxFV0mxy7VaYzIik4GgOUz09qPtJ0lPL4Ot+DIbbh9nN17h9cR+5?=
 =?us-ascii?Q?NYsi8Vnz+M1GWPyZr6lnJurB3RhztIq44YiFqGAxliYpBX+aCuUfP3TvAef/?=
 =?us-ascii?Q?Wkftz4xqm5IwlL7lhCfOruahseDroX2JkzfsFdtWqRCZjT0K/pLwdxAg1Iqo?=
 =?us-ascii?Q?2dmo1UvizXk0RENGZrFJUsHIDs7AWxyAkRdJC4n4UQTqWjeqgiQdune8y5nG?=
 =?us-ascii?Q?lgCE0LkpOnnEP8TnSF67TOw9bM8i3wTOyan1sOwqdROHtrrkZO8tmw4SPY7I?=
 =?us-ascii?Q?jkH2r5LT3TZarWNaDJQvE98MKgzrenCHRqLepm9RuYuMqkhjCEZ3Ch4cbP9+?=
 =?us-ascii?Q?kWAses0dGYs4okoVF2l0Qpllx07aH3kQOLEO+H1ELImc5Crs1WN4f6n9bwK6?=
 =?us-ascii?Q?iT9utCFhPj3vv7zJH234g19BGUv5eC/dgs//l92rueihUoUjDNh6ern/OcCP?=
 =?us-ascii?Q?uyaKNH6ULg=3D=3D?=
X-Exchange-RoutingPolicyChecked: dmVTLzcak2kaEIoA+1BGERO+xbfxGo7/LzqunFzSyMT1mhOXMorDfgnOuCIFFhLh7H3A/ypP4NsTcNQZoDhVfo23Gt0j8tvJaFSJOJIVmMRunZ5FiOwWquSi4h4REdccC2jRsAfDzGZisNib37hOzfRrf7l0jL6Q5hAZqeXc21qLlJk1mgSvxlacKf5ca2bS0Wvh8b7zOpdp1EFmVz8uqyYaKuPllO7tnja4j9ZDBkI8xFL3mwREgnQm/dJnoF+t9Yl492t12ZBMIEETY6WtMXhz7E2fVIbmx1rjx+3vTWw6zQW4RdnjzCiyMQJP+1/E7VC03mt69OBXwwKgVDX4CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 260fa7e7-9f8e-4b8e-1dd9-08df2b825542
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 12:38:08.7435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfHyRGiWUxparcWsuP2kctzoUcFEbWeyhg50EoCnOFzavWy93xWkYVmczb5JKzCXmZG4DIC/3RFml3rQuUEAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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

On Fri, Oct 16, 2026 at 11:40:54AM +0100, Matthew Auld wrote:
> On 31/07/2026 03:24, Matthew Brost wrote:
> > Split each of the four logical XE_BO_PRIORITY_* bands into two adjacent
> > TTM LRU priorities, using the now-doubled TTM_MAX_BO_PRIORITY (8). Within
> > a band, buffer objects whose system-memory backing uses write-back (WB)
> > CPU caching are placed at the lower (evicted-first) of the two actual
> > priorities, while everything else - VRAM residents, write-combined/
> > uncached system memory, and kernel BOs - lands at the higher one.
> > 
> > Evicting a WB-cached BO is comparatively cheap since its contents are
> > already coherent with the CPU cache, so preferring these BOs for
> > eviction over otherwise equal-priority peers reduces the odds of having
> > to evict a more expensive placement first. This distinction has no
> > meaning for VRAM-only BOs, which always land in the higher of the two
> > priorities in their band.
> 
> I think this will also implicitly favour non-compressed buffers over
> compressed buffers on platforms like lnl+, given that all compressed buffers
> are also WC. Might be worth mentioning that in the commit. Not sure if that
> is intentional, but is maybe an interesting idea, since compressed buffers
> require a GPU blit + device wakeup, while non-compressed buffers just need a
> CPU copy, so are technically cheaper to evict. But on newer platforms you
> can technicaly now do WB + compression so we added a bo flag so userspace
> can tell us if there is potentially compression, but this is also useful
> when you have WC + no-compression on lnl.
> 
> Would it make sense to account for this by checking
> XE_BO_FLAG_NO_COMPRESSION somehow? Just thinking out loud.
> 

I think I'm going to drop this part and go back to thid verison to avoid
TTM changes:

https://patchwork.freedesktop.org/series/170454/#rev4

I also need to rework the shared BOs priority handling as Google is
carrying the above version downstream and it turns out many low priority
clients share BOs which are causing a priority inversion (or equal) with
compositors.

Matt

> > 
> > Add xe_bo_ttm_priority() to encode a logical band and a BO into the
> > actual, stored bo::ttm.priority as (band << 1) | !favor_evict, and
> > XE_BO_PRIORITY_BAND() to recover the logical band from a previously
> > encoded priority. Update all existing readers/writers of bo->ttm.priority
> > (xe_bo_init_locked(), xe_bo_update_ttm_priority(), xe_vma_destroy(),
> > xe_vma_update_bo_priority(), xe_vm_update_bo_priority(), and
> > __xe_shrinker_walk()'s purge early-exit) to go through these helpers so
> > they keep operating on logical bands.
> > 
> > Assisted-by: GitHub_Copilot:claude-sonnet-5
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c       |  4 ++--
> >   drivers/gpu/drm/xe/xe_bo.h       | 34 ++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_bo_types.h | 14 ++++++++++++-
> >   drivers/gpu/drm/xe/xe_shrinker.c |  3 ++-
> >   drivers/gpu/drm/xe/xe_vm.c       | 17 ++++++++++------
> >   5 files changed, 62 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 2669c487b778..b3d77ee44746 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2413,9 +2413,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >   	bo->cpu_caching = cpu_caching;
> >   	bo->ttm.base.funcs = &xe_gem_object_funcs;
> >   	if (type != ttm_bo_type_device || !vm)
> > -		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
> > +		bo->ttm.priority = xe_bo_ttm_priority(XE_BO_PRIORITY_HIGHEST, bo);
> >   	else
> > -		bo->ttm.priority = xe_vm_bo_priority(vm);
> > +		bo->ttm.priority = xe_bo_ttm_priority(xe_vm_bo_priority(vm), bo);
> >   	INIT_LIST_HEAD(&bo->pinned_link);
> >   #ifdef CONFIG_PROC_FS
> >   	INIT_LIST_HEAD(&bo->client_link);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 6506001730ab..ab15d0909832 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -8,6 +8,8 @@
> >   #include <drm/ttm/ttm_tt.h>
> > +#include <uapi/drm/xe_drm.h>
> > +
> >   #include "xe_bo_types.h"
> >   #include "xe_ggtt.h"
> >   #include "xe_macros.h"
> > @@ -164,6 +166,38 @@ static inline struct xe_bo *gem_to_xe_bo(const struct drm_gem_object *obj)
> >   #define xe_bo_device(bo) ttm_to_xe_device((bo)->ttm.bdev)
> > +/**
> > + * xe_bo_ttm_priority() - Encode a BO's actual TTM LRU priority
> > + * @band: The logical priority band to use, one of the XE_BO_PRIORITY_*
> > + * defines.
> > + * @bo: The buffer object @band is to be applied to.
> > + *
> > + * Each logical priority band is split into two adjacent, actual TTM LRU
> > + * priorities: a lower one, favored for eviction, for @bo's whose system
> > + * memory backing store uses write-back (WB) CPU caching, and a higher one
> > + * for everything else (VRAM residents, write-combined/uncached system
> > + * memory, and kernel BOs with no cpu_caching set at all). Evicting a
> > + * WB-cached BO is comparatively cheap, since its contents are already
> > + * coherent with the CPU cache, so preferring them for eviction over
> > + * otherwise equal-priority peers reduces the odds of having to evict a
> > + * more expensive placement first. This distinction is meaningless for
> > + * VRAM-only BOs, which naturally always fall into the higher of the two
> > + * priorities within their band.
> > + *
> > + * Return: The actual TTM LRU priority to use for @bo, suitable for storing
> > + * directly into bo::ttm.priority. Use XE_BO_PRIORITY_BAND() to recover the
> > + * logical band from a previously encoded priority.
> > + */
> > +static inline unsigned int xe_bo_ttm_priority(unsigned int band, const struct xe_bo *bo)
> > +{
> > +	bool favor_evict = bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB;
> > +
> > +	BUILD_BUG_ON(XE_BO_PRIORITY_NUM_BANDS * 2 != TTM_MAX_BO_PRIORITY);
> > +	xe_assert(xe_bo_device(bo), band < XE_BO_PRIORITY_NUM_BANDS);
> > +
> > +	return (band << 1) | !favor_evict;
> > +}
> > +
> >   static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
> >   {
> >   	if (bo)
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 7b02552652d3..dfbce9e5b8e8 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -23,11 +23,23 @@ struct xe_vm;
> >   #define XE_BO_MAX_PLACEMENTS	3
> > -/* TODO: To be selected with VM_MADVISE */
> > +/*
> > + * TODO: To be selected with VM_MADVISE
> > + *
> > + * These are logical TTM LRU priority *bands*; each is further split into
> > + * two actual TTM LRU priorities by xe_bo_ttm_priority(), to favor evicting
> > + * write-back (WB) cached system-memory BOs ahead of their otherwise
> > + * equal-priority peers within the same band, see xe_bo_ttm_priority().
> > + * Use XE_BO_PRIORITY_BAND() to recover the logical band from a BO's actual,
> > + * encoded bo->ttm.priority.
> > + */
> >   #define	XE_BO_PRIORITY_LOW	0
> >   #define	XE_BO_PRIORITY_NORMAL	1
> >   #define	XE_BO_PRIORITY_HIGH	2
> >   #define	XE_BO_PRIORITY_HIGHEST	3
> > +#define	XE_BO_PRIORITY_NUM_BANDS	4
> > +
> > +#define XE_BO_PRIORITY_BAND(ttm_priority) ((ttm_priority) >> 1)
> >   /**
> >    * struct xe_bo - Xe buffer object
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 81895b587b56..682594baa17a 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -84,7 +84,8 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
> >   			 * rather than walking (and trylocking) BOs that can
> >   			 * never satisfy this pass.
> >   			 */
> > -			if (flags.purge && ttm_bo->priority > XE_BO_PRIORITY_LOW)
> > +			if (flags.purge &&
> > +			    XE_BO_PRIORITY_BAND(ttm_bo->priority) > XE_BO_PRIORITY_LOW)
> >   				break;
> >   			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 1be367b1c671..93d19bd0a8e5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1235,7 +1235,8 @@ static void vma_destroy_cb(struct dma_fence *fence,
> >   /**
> >    * xe_bo_update_ttm_priority() - Change a BO's TTM LRU priority
> >    * @bo: The buffer object
> > - * @priority: The new TTM LRU priority, one of the XE_BO_PRIORITY_* levels
> > + * @priority: The new TTM LRU priority band, one of the XE_BO_PRIORITY_*
> > + * levels
> >    *
> >    * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move set to
> >    * their VM's LRU bulk-move range (see xe_bo_init_locked()), which tracks a
> > @@ -1248,6 +1249,9 @@ static void vma_destroy_cb(struct dma_fence *fence,
> >    * its bulk-move range moves it with a plain, non-bulk LRU update instead,
> >    * and reattaching afterwards re-inserts it into the new priority's bucket.
> >    *
> > + * @priority is a logical priority band; see xe_bo_ttm_priority() for how it
> > + * is translated into @bo's actual, stored bo::ttm.priority.
> > + *
> >    * Context: Caller must hold @bo's dma-resv lock.
> >    */
> >   void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
> > @@ -1256,12 +1260,12 @@ void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
> >   	xe_bo_assert_held(bo);
> > -	if (bo->ttm.priority == priority)
> > +	if (XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
> >   		return;
> >   	if (bulk)
> >   		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > -	bo->ttm.priority = priority;
> > +	bo->ttm.priority = xe_bo_ttm_priority(priority, bo);
> >   	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> >   	if (bulk)
> >   		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > @@ -1300,7 +1304,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >   		 */
> >   		if (!drm_gem_is_imported(&bo->ttm.base) &&
> >   		    !bo->purgeable.vma_count &&
> > -		    bo->ttm.priority != XE_BO_PRIORITY_LOW)
> > +		    XE_BO_PRIORITY_BAND(bo->ttm.priority) != XE_BO_PRIORITY_LOW)
> >   			xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
> >   	}
> > @@ -3622,7 +3626,7 @@ void xe_vma_update_bo_priority(struct xe_vma *vma)
> >   	xe_assert(vm->xe, !bo->vm || bo->vm == vm);
> >   	priority = bo->vm ? xe_vm_bo_priority(vm) : XE_BO_PRIORITY_HIGHEST;
> > -	if (bo->ttm.priority == priority)
> > +	if (XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
> >   		return;
> >   	xe_bo_assert_held(bo);
> > @@ -5132,7 +5136,8 @@ static void xe_vm_update_bo_priority(struct xe_vm *vm, int priority)
> >   		struct xe_vma *vma = gpuva_to_vma(gpuva);
> >   		struct xe_bo *bo = xe_vma_bo(vma);
> > -		if (!bo || bo->vm != vm || bo->ttm.priority == priority)
> > +		if (!bo || bo->vm != vm ||
> > +		    XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
> >   			continue;
> >   		xe_bo_update_ttm_priority(bo, priority);
> 
