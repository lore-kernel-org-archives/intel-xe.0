Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E14DC6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 21:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D416E10E365;
	Tue, 21 Mar 2023 21:14:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE53D10E365
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679433255; x=1710969255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ckEUBW0IU2ZNPwYT/5MLq2naGt0Cso+mHkvZ/NXM7TI=;
 b=T54AoLfxttV1l5SnEyXGq8c7ijhmmW5kIdvSSNPRFVpdU1iJKb3dzMmv
 wRWlxFQoNUHBMsfSPEnbxisaS7exO/GzJxKMjQnO1JuG4zE0tju5FmzeV
 9/KqIDqBIr/FzwEMXfK4wVnFa643Q7eI3g3LxSUGwPvAZ4GQ3na1IV8Q0
 Wyw81jdUSt+dDStrURCR7ecGycR33j5FlOr4H2pM5gjPEUW8bu2f2kbfP
 VIM+fkj+greP7MkftqHcDhTjEZGQw+wxiNWbHlX3JyUUwUbXm2PnvpDZh
 Xd00rndTVe+DUGXOG/+xiQizds0O3A89/qRs3Lr2Mzqt9urKzXPMYL7eT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339100454"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339100454"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 14:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675009486"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="675009486"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 14:14:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:14:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:14:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 14:14:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 14:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdbNEljwesZr6d+DE4GND7KlyfzwWYqem/Mdl47Z6cj2JLsm1jyYLkW785esZrXOpthgXJow5D4N2sY3ZgMdb1Qbjktvp4Bc3nPoi4yzjCFo+8EBX3/rk22DXO6VeqwfBgVOXH6F9dblYSWMiLQgy7n6wiNcggo/qhgtwaz0NJweDiQSIzPXhX93coocqDZeMgO/kuDtVl02iwYKvK5qfXRjJGiPXcSza8uFmZFPTSx1nizjPiWzui2Lnt3zEvszbQnyZ0I3U/2M3uAoEbwZvA0dAXHQqniq7LL17sQvT/6u3PKlJIcXnR9ooKY3xdWi1hZF9f1DYVDCfPNpFIcc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcIVPvFZNJVgkKBLCJaSDXxv7/WvmOfYeTG1+42KBWc=;
 b=PFoOZ81vL6h0Xzm1BMviqxRclQb6Opy4KhYXueF60kcXOMGLFT8gkWhEWNadBKzTzbHBYU/yXmzK6NIVWY2vGAr3b7UF8CZhZD1rkRcWrACvoDBvv0weDPkrofAEsSTL2fmli/WwcOMW+IPJS9L5sEn/fVrzav/51OuIsWw9/SdofN4Rk2PMV49HV2ogtaSnT0p36S1tX9MNO95WJ0BwpHg0iy9KMp13dhIPMLZOcLTV23owdniG0OiXpG52ADD/ZiwbCoYBwGNG8BuMXZ6aFJJwh4Vtuj4j3wFfw6h7X+ojrwpn83SwpKT7Nm9McVEtuBtcC7RpAXTb0QcJPUiTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:14:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:14:11 +0000
Date: Tue, 21 Mar 2023 17:14:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZBoeHi82lpK+w0vg@intel.com>
References: <20230317002221.211065-1-matthew.brost@intel.com>
 <f85589d5-b3ac-89c8-6a24-9c51d10d3710@linux.intel.com>
 <ZBnAdXk4+Idtg9lo@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZBnAdXk4+Idtg9lo@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: ea143a7b-bcc8-4814-120d-08db2a513703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xE2ehtZavp+2OVOcHm0/2Yth27Sa+VKFXwIEkvXmV/OYBRa8EnoeZBbmmhIiyz1MPQb1aUjKCU8lK0mZwNRZsMe+qRG8duSWpj9cq1Wb3dGacFIHSRwUHpWjTRKGfoun8NfNG7dIMEOcv8H4tToThL4FM2V8tD0dan+7Aay8n5rNEFOEbzVRPon9ZJV24NlyCKLXT3PWPNbdo8WwZXboVp8KpxGoW+7auPkeBRRTz4gCrvJ1fg5XnWsQ+7ksUxNTO8Zj9J7lAjR6LK+FJ8y0KGEsfIiHRI1DTgF7kNQtPw5q3EgLulRS6PDdTg4hU6hAwy1Q6k9eeEIVFkjpyZ7DWLC3KPjiCgKqdw/EkHjPtHBqBcUZhrrMzZ0xDOnH7FSlEYYDxlt6IgoAdJM5sZj3RkNN9nHLl/sybIyqIp36M/mlJJByhFVDlNyMfg9X4A/qftr4iVLd9YIOlmLNs5UVTO51qpiMHLNt3aE9KSR4V7TLT/RarTSKwY4WxnKq0/GUoeDu0l9sbFAHA4Uh1dbOWjtwEWM7KnbIDqQ2VMadIEDAtgpQEwv++kLyb4jQ9JbXjuxGhOkkmOdHlG8gFhSsRdKBY7PUfgq7+dLfhUf77yl/cj8j8vSXvWY+cxXXbnVgsCVvarPAGR0im7HJA2Timg1prvomXVwF+z5u59RU3ae5PHN/B1TQbnzpkAdkWzve
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(38100700002)(86362001)(186003)(6636002)(44832011)(316002)(37006003)(8676002)(6862004)(66946007)(5660300002)(36756003)(8936002)(41300700001)(4326008)(66476007)(66556008)(2906002)(478600001)(83380400001)(82960400001)(6666004)(6512007)(2616005)(6506007)(26005)(53546011)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2x0a4+rO6xIZinHn0GGuupI8Rr9KiGMMPEkeWtRq3JYR9plc/ZM0DYItW8Dl?=
 =?us-ascii?Q?nNcKtVOUVAhhDyO2OOFgQtoB/jf93OciGZqKBmbfuHhbb85vECj6d6WeHL4c?=
 =?us-ascii?Q?46+J7IZ0KF4LtjK1Wefp4M0XBXmysAYjCpWfMzS37oCNcw18EkVEpD5Nqev9?=
 =?us-ascii?Q?oXAOVV2iEjm6/rUBL7WWnP5NVirPSLUcedvcjSM5SSgnnjPMB23zQkopNSeD?=
 =?us-ascii?Q?7nSJhN7WWlyVhCQRiSG00Ddu8D+Hapso8cg2U0umvwVh/yv4+7hjPOTOqScT?=
 =?us-ascii?Q?FfceDPgw5J30mDOReQqqdQJReSvCxaUCsEGqfNTUo74Ingb9SD3TPgcVG44N?=
 =?us-ascii?Q?Affxf4GHeWgkap/0Gj00LnJZhAf8fGBGjYb1nlj0t/STrZGXtyNV2Qi9KmZS?=
 =?us-ascii?Q?VnqSIj65xm61Tn9VTm6Mff6MD6oJ9SCUtjRzVglZimQ+TNjup7NUYu/oacvG?=
 =?us-ascii?Q?USh5nLwpleezyy69lf+nIxw0FtAoYkeeRMg/eT5PuJVJFPA4yqT682erBknB?=
 =?us-ascii?Q?eFUMBO86CKQrN4V4UEDVOHv9RrcXP4b8tsn/ZlkEKK6U+UGJqQnRNSQihtpN?=
 =?us-ascii?Q?Ja+SafRieTlaNslBWH5nCiLoIAucrNm2VTg+K7chBsrF+pVrXK8z3UgJ6VUm?=
 =?us-ascii?Q?NQT0IJ9b3q1Z5a5oMmn8IklsHjgc7G0ZxYBgkYWG33T6nKTlHLQSsPrZy5hY?=
 =?us-ascii?Q?eVW1uSiakodeAdAEkNJt+952KcWz5hu2sld4IracaUhedT8GOYGuD7PJ0YM2?=
 =?us-ascii?Q?TwgTW5+yqrCNWMWReejlmVpph3yKaN0FCT3Za99J1htvf/7Lb/o7Wpj1G7xF?=
 =?us-ascii?Q?VX0oRXPKZlLdJY8zr51HcFo7f8yUmw+e+yP/yLXocGFhCjgRrSRS2Z1Hb+1E?=
 =?us-ascii?Q?6omOayooQKbLUppRzbkAzCsUThcAj4d3mo+ic5r3lgfjZxi/d/4l6DuEduI1?=
 =?us-ascii?Q?3k1VZimREhhyP7rNPyUeD4HbCYcJJwvwPjRJmL/hPEDCNcS6uYCxBGQ662Hc?=
 =?us-ascii?Q?kZN0dvLwpB0LLOjtph5w0Vkp+RZ82PguFEG+A4timnO7SWC89Xrt9b/3R4Ns?=
 =?us-ascii?Q?nOo31R4S+19Uhye2pEq7djWa7VatlID3k4ElPEMmpn772riowRKNqTqDFvO/?=
 =?us-ascii?Q?/fUQLnNdi+0vynMZ814751bpLo7MHtOO5Tl17GFRWfh9KneHsZF0CMpdXvff?=
 =?us-ascii?Q?q+Ol8NR47DbWg9L898xflNvZl6pF3Jven0DriuhVhOybJOax2PFjQNK+XV3t?=
 =?us-ascii?Q?m5mjAE3bRsZmNqwNqrAowEDifisPro1RWb9JxLPL1ZcZ2dNWTkan/FCjASEY?=
 =?us-ascii?Q?+gndEkN9BYMHahPaCN7vkjqAVb3yLwRXDlsjYG1nJ6sVdVsnYY7eWAsG0/pU?=
 =?us-ascii?Q?dQKyXxKjvuyHeWnBjA1hLJs2JX1E+ZaqH26V6mewSU8/6u0AGoZMBdOiy6aL?=
 =?us-ascii?Q?vXtjZsSvuSUAtN32HywlHstjgtWVwZTNCGlwnxKoxoj5j5OPui1Xz/2b9Gju?=
 =?us-ascii?Q?21uP+OznHzTD2+2mpTiChYcnEqnRobZIMoyy3zVBzECmJyDNPBJFr6FSW0Du?=
 =?us-ascii?Q?VFlcdvMEW+AriYekyKgvBV1fOx6VdRAAUK7n4QZEjT6CckcZWL/WxpsljmqG?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea143a7b-bcc8-4814-120d-08db2a513703
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:14:11.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1DmQ86gbYUivlUpcvQOErFQBmyGqkYAJCW4m2ZnAB/pYK9CZp3QaLJfg9TUYmL20iXA+tC4mT228ith9UQmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix locking in CT fast path
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 02:34:29PM +0000, Matthew Brost wrote:
> On Tue, Mar 21, 2023 at 01:25:51PM +0100, Maarten Lankhorst wrote:
> > Hey,
> > 
> > I'm afraid this is not allowed, you can't take a mutex in an irq handler, not even a trylock.
> > 
> > From Documentation/locking/mutex-design.rst:
> > 
> > The mutex subsystem checks and enforces the following rules:
> > ...
> >     - Mutexes may not be used in hardware or software interrupt
> >       contexts such as tasklets and timers.
> > 
> 
> I wasn't aware of this byr DOC makes it clear this isn;t allowed. 
> 
> > Lockdep will likely still splat too as a result.
> >
> 
> Lockdep is happy which is very odd since clearly this isn't allowed per
> the DOC.

This is strange... in general it is loud when you try mutex inside irq.
some .config missing? or maybe the trylock itself misleading lockdep?!

> 
> Anyways, I'm thinking your atomic fix is needed

Yes, this is becoming un-avoidable. I would prefer some lock than atomic.
Maybe a spinlock?
Or we need to be really sure that there won't be any race where we end
with an access before the wakeup.

The runtime_pm doc even suggest that all the memory accesses should be
serialized instead of what we are trying to do currently with the
mem_access. Thoughts on if it is possible to serialize them on our cases?

check for the 'foo_' examples at Documentation/power/runtime_pm.txt

> but likely also need a
> follow on to this patch as well something like:
> 
> xe_device_mem_access_get_if_active();

hmmm... I didn't want to grow the mem_access into an rpm wrapper for all
cases like we ended up in i915... but this might be unavoidable for this
case...

> do CT fast path... 
> xe_device_mem_access_put_async();
> 
> The key being we can't sleep but also can't power down access to the
> VRAM when the CT fast path is executing.
> 
> Matt
> 
> > Cheers,
> > ~Maarten
> > 
> > On 2023-03-17 01:22, Matthew Brost wrote:
> > > We can't sleep in the CT fast but need to ensure we can access VRAM. Use
> > > a trylock + reference counter check to ensure safe access to VRAM, if
> > > either check fails, fall back to slow path.
> > > 
> > > VLK-45296
> > > 
> > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
> > >   2 files changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 25c5087f5aad..0cc4f52098a1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > >   	XE_WARN_ON(!xe->mem_access.ref);
> > >   }
> > > +static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
> > > +{
> > > +	lockdep_assert_held(&xe->mem_access.lock);
> > > +
> > > +	return xe->mem_access.ref;
> > > +}
> > > +
> > >   static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > >   {
> > >   	bool ret;
> > >   	mutex_lock(&xe->mem_access.lock);
> > > -	ret = xe->mem_access.ref;
> > > +	ret = __xe_device_mem_access_ongoing(xe);
> > >   	mutex_unlock(&xe->mem_access.lock);
> > >   	return ret;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index e5ed9022a0a2..bba0ef21c9e5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> > >   	struct xe_device *xe = ct_to_xe(ct);
> > >   	int len;
> > > -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
> > > +	if (!xe_device_in_fault_mode(xe))
> > >   		return;
> > > +	if (!mutex_trylock(&xe->mem_access.lock))
> > > +		return;
> > > +
> > > +	if (!__xe_device_mem_access_ongoing(xe))
> > > +		goto unlock;
> > > +
> > >   	spin_lock(&ct->fast_lock);
> > >   	do {
> > >   		len = g2h_read(ct, ct->fast_msg, true);
> > > @@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> > >   			g2h_fast_path(ct, ct->fast_msg, len);
> > >   	} while (len > 0);
> > >   	spin_unlock(&ct->fast_lock);
> > > +
> > > +unlock:
> > > +	mutex_unlock(&xe->mem_access.lock);
> > >   }
> > >   /* Returns less than zero on error, 0 on done, 1 on more available */
