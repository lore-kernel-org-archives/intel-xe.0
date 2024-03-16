Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A9DC54E58
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 01:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CFF112874;
	Sat, 16 Mar 2024 01:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaYn9peO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE197112874
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710552629; x=1742088629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ppHi8+F/PEdyC+MnCJZXgXWnGMG3NJJGocpKUCtZqBk=;
 b=AaYn9peO6WuVu1dVZehKBLN43Xawu8omCgrLQo79AssfZ5TuO6pm7Wav
 fuQTCRpFv9MUaY+Wow20R7X45gQ3CHTHJ0c9tEM2pi8smvZgGidl0RFAN
 hZ4dlS4jjKu3cUcMZKrfGfRfwwqyjCtjSWIz5pPo9QNvv743r9m0hE6b7
 ywHAFLQfWSEpDXi8QdKrEcNeRoeghxIh0leI47rforWKjWvt4mHMR4uGS
 Hlc2JJz3ZW7kfH6hTlvluhO1M6xCJeudP1L9bXzHYUnT1Rujyv3MP22Vj
 zUGM0Dx2eCR19NxSGW+HOvJrz6MqK2220vc6sS474X0rN+YZDEpS4SpWr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="27917730"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="27917730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 18:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="35981145"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 18:30:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:30:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 18:30:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 18:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRjTl7EKHHb0mVPGFbNa1UoN+oVejeXjr++gFAg7/SRs69xBRB8ULVKnq+1tEtcfhtEA+2QQRNmNUf6rE6M4FDTscfHpuSVNziKC6KY44fLGMN7fNMrIoPd5mQvNEuFDdqOXgbQ8Lfuv2ZifEyXQetpJ8rxW9EhS1LNjUyd76O5SU3j0/v/RLgDN+5YtIOp/jIYLOljiDoBifwDnDVAsfc+sTAs2MaEUkWNxR0i7+F/exP/ydYpRn8h0kvD0NgXodHYV9TZC3x0Hhe54GlJP6o1Gj9FfTv1QJkTl40nsceX/M95Bd50h+hBjxYHSdxIuaEGnOU12IG0CeVprqxtQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve2u6n+c+KA9rpIQvEaTPNNs4LhdJToIQr8Qgl4InoQ=;
 b=J5hzenA5SjBz9gX4JNMs7QciBDEMInYDmt1qyfdZcDN4DcVS8njiizIh0ziNQwnBS+Mpeod0riu3LxJrfDt07rYP9wvPybD1g0ZlDdOVbOQeG0wL37Cm9sA4mx0bxcO0MvUWy4x6IwpCMJjBesN4hwzyMUtIkv08dQD7t9Y5ae7foxWpqs72/sH40Jc3+xHHYYrNh96Rv40ddrxrkJ4nFkncYn8XA+Sh1Dfci8xooc0tYAMEnMUWVqv/uGF6RrVoHQ6aed1sW4IdnWK32Rc/WPSpZ6+TEfDzEHUbYpnHZBNNtNKO8yur56H0juBnGXr7PoVmOPY0yANWRDp3G0r2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Sat, 16 Mar
 2024 01:30:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 01:30:26 +0000
Date: Sat, 16 Mar 2024 01:28:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Warn on NULL job when user fence used in
 xe_sync_entry_signal
Message-ID: <ZfT1zdhMaNhvCZZa@DUT025-TGLU.fm.intel.com>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
 <20240314095442.32153-3-nirmoy.das@intel.com>
 <73503874-c5d7-4f73-a9e9-7ff62cb5745b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73503874-c5d7-4f73-a9e9-7ff62cb5745b@intel.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a686b7-9dd3-40b3-683b-08dc4558a825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nP2B72bJ8aiE/uVqe4ajisTM7J4J68DY6+OdAqBZUpIS+gPvTce5uFlnNqAvxSqQDw40MMgOw7QXdo8nSzprHW/+WAyrTxfbIvLwLQLVqtnidVDXnYzL2N9AvoqanP/eGBSM6zmOwiX/V8Hs/250QqtIFisqJcX8YF4235ewpS8riEhm3D03XR4HDQxe+ZsybM2YpqwuYKtnL0BIs8227sTv7KA2e0VM+udx++xgC81u9Nxz0aeOBLpXZxQkhNkLNdlMqg5IP3rQkc5bGMYic/VuqzjgwrMhlDKjLqbYvIADNAQ0IZvsJb1gHR/UD+4PTmueV+Pyj780ER8nMbPLU6dtWlPUa5T9qisZ3jYpq9lR1SFRtyMMMwCJIVytNNqQvAqJxixsWPiT4KtL0iznMoS0wnj198vWhP5F60sfLOUQ71ofUM1J4pNLV5oPPO5mIylYmRLNe7TgAQecSWxxBnRDZ5d1fEVdNCH4xJKlA5A2wXj6Kp2osiKC3C2jM6c5kITCs/4QDfZKEG+oZ6MHXGLE2Lf/18GcJVf4scNV8IhC6LLfIuKv62DvZSyC+tMnlckoqvQ3J4p/QqM3KRcQjc1AshlIKMhCvSRcp4oS3esH9U2Zl2hFEfgG8dmeIh9gmd0KMm28Xn9RIcKlGG11aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6t1BjOhFDS25HfZwaEAXmHtdrksh/5Zj1RlMGoFVJ+L6Rl9gwYUZngKVXJ/M?=
 =?us-ascii?Q?3NQLZOKySTp+OIcKqfetTt65xBpOaTZulsqtLty9sDg/p2YPYCcnM/lCx3ew?=
 =?us-ascii?Q?NUcHcQ8et18/b5mm4St5+o+1/pQEzca3VrJ297ka8WsBUsbOk5wjgRU8369d?=
 =?us-ascii?Q?mXtevXT+ldmPkeAVbgiM5kzjsuSWpGdTsQF/w92viUhJZodHNROR3Nllj1zf?=
 =?us-ascii?Q?yuARBJ72Qxt6PjMeHLm5vNHFTCaq+ZievypC6GsUfRkVKKa2PEB39c2b04R0?=
 =?us-ascii?Q?RKVtEErfjxOaPFm6VoBy3o6PqHHwvCw064GPbtOTTy0WgqlFVeZgbQZ7AIr9?=
 =?us-ascii?Q?47CiTT7Gkrf7eAMuiwmfJyVIF9tjwO4aiVaDAzHjUflnjn2kAosFdj8bCAYC?=
 =?us-ascii?Q?EfUnT54WtxNcfylFatLgxBzB729u+lX97qhEVBsisv0sRq0HKiEtuz6BToit?=
 =?us-ascii?Q?SMD7frgMrX0WNqvOP77S90cHby8QUnotWLDU9eA6y6G1VDnr/uI2jCHN0tqi?=
 =?us-ascii?Q?+K9gk0UrGkk3j+NSEtXqdIZCjYk9I4dMAx1kxyX9PhAcE+MSmrI3+xUJFDPt?=
 =?us-ascii?Q?mUgJZtCIv/UEAhTIZ4kEN+K181w8QJpxjnL0n2sUuHiq40b6kYSsJrBILMJC?=
 =?us-ascii?Q?CSntsTEDcU22J6JrB3dSDAntkaNPhTjZbbk90RxXLqWuGv8jwKgJYH3XvJ/j?=
 =?us-ascii?Q?SEmXsg6CbaTzU6K38RtoesENp77kEpw/cvAQWFMm9Q6EFuodVZsrI9kfT6b9?=
 =?us-ascii?Q?+rajvhf3QXgwtXilJ1tjiOtvlPZzV3SrJ/gSZSksv4N9dhJO7TMk5eAuH4hn?=
 =?us-ascii?Q?kxrynch6GedWRDT1Fdb72NVA9guWgskjfNZiQFs5LHWRlgSC5k4+1zBmvfYh?=
 =?us-ascii?Q?edKW3jYnV1APResh+PhoDiGZgh+iisnBKQZw8jkWVLMr3dQYT4GGGIY3DndV?=
 =?us-ascii?Q?RusuqKQZFHhIRZHZ1yRGKnaSOUWScdEZp/rTqJ6B+kyiRM56wh8C79hyP0lb?=
 =?us-ascii?Q?0sl3wrMDtfiHFIKds6lg/r8fSAGUmi3Q39RwqsZiSWUONiDcEBXPUCw2U+lY?=
 =?us-ascii?Q?lPTExOI033O5GCkl8xQ1cMHsU8TFgFDSvso3OXrjW8Zli63hJtgfMFfpFpLW?=
 =?us-ascii?Q?XfGaT1YuVHSRD54Z3kBPsJLHYHtubbeFGyxNulbjWjpnF4timYXAyAA04mcH?=
 =?us-ascii?Q?egnsNfsqXXh+QB/tFDaS0BafYgAm2sJbV6fTHWL6/OdnyCQ52n2L3F0Jv4ve?=
 =?us-ascii?Q?Ltg66bwHITG/Aly4+xZogCpUFkVed4+KjseprLYGNehiXugloJrbTeVR70yj?=
 =?us-ascii?Q?GemiHOhIX2ZB1caOa3bTQ7tx78SaGGU6w4eWZif9FasRlqh+WxGWMbHpXHd5?=
 =?us-ascii?Q?wbloI1Xo8DXvTLsGxOt1gxc0odQtj20azveTq+Glgluni/EzwrV61zn0uswN?=
 =?us-ascii?Q?2FsedYNEr7/yPxkJ7O9hSrGLzbqqb+2w7Fn1cmQqNNaJoKcFS78+8VI0alh5?=
 =?us-ascii?Q?1nr2SM5uQzBS/wT/Ws7mDKz1ftYIvhj5J0ei7Xxbvb4Z4yWQk4EaiKx1m39G?=
 =?us-ascii?Q?mmloJ8GKx4LnCdShrF85hfYxq10JQKW2xanSnguGGW+zRfqYaxjZcUdUe/km?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a686b7-9dd3-40b3-683b-08dc4558a825
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 01:30:26.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB3enpnwVQykJ43Et33FumEtdLw95mOrAVADA4lR77Rx+bNvDgIGnKP8dRKkl5n/PhaZsfO8JdDKGssVhH0nmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Thu, Mar 14, 2024 at 10:53:20AM +0000, Matthew Auld wrote:
> On 14/03/2024 09:54, Nirmoy Das wrote:
> > Added a check and warn for NULL job when sync->type is
> > DRM_XE_SYNC_TYPE_USER_FENCE to prevent potential crashes
> > and aid in debugging
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_sync.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 02c9577fe418..fae466ba8e75 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -255,9 +255,13 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
> >   			dma_fence_put(fence);
> >   		}
> >   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> > -		job->user_fence.used = true;
> > -		job->user_fence.addr = sync->addr;
> > -		job->user_fence.value = sync->timeline_value;
> > +		if (job) {
> > +			job->user_fence.used = true;
> > +			job->user_fence.addr = sync->addr;
> > +			job->user_fence.value = sync->timeline_value;
> > +		} else {
> > +			XE_WARN_ON("NULL job passed with DRM_XE_SYNC_TYPE_USER_FENCE");
> 
> Just wondering if it might be better to just let it crash if that ever
> happens? Assumption is that it's impossible and would be programmer error.
> 
> Matt, any thoughts here?
> 

The usage is probably add an xe_assert(xe, job) and then let the kernel crash.

Matt

> > +		}
> >   	}
> >   }
