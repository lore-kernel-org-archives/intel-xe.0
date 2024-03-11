Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C51C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFB6112B84;
	Mon, 11 Mar 2024 16:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GktoGqID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DF112B82
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710175315; x=1741711315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/+I5c7svMZ6V2YR9G6d2HqrZNBBbfGpKxvnL0qDlBCc=;
 b=GktoGqIDNRhJyTvTu2QkHqh+Jg8jGtCt2BYl2S6tBc1/EwQrnrEiFUz6
 PHmuntzktGqjp05fdlRWK1sIbD7lrMwInJQoqLhX8umet6NYDTVMhqKVU
 4zG5ad25w35IrKx4wF/Vj+kyGZsjK3UvNBtKJxcQxtMBvOw2Y8y/szsv2
 h/WjBxOdZVSrV5LVlT8pd3awabXUyiwKCyqoTwYfikAZTSrIhAiFP692o
 by39JLBTsCoA5vf6RX6eyrO/M95OPSCLVbatrqKZSMKjs5XWavsiOroaB
 q9lq+uUxYh4GPk17m0oGGEZAbDEhAzqTyz6Obt9NdmTZnPT1hY9vNRB5q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4964645"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4964645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11296989"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:41:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:41:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:41:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vk0pYD2RjfkrAGL8NEH/NKbhdQ207OP2mwvWXMx+lYD+TobsyrhlYpc/ra7dJaookppu6FUVRY3wn0cq5QEkQWnjmEXOpdr6AzHe1lCgSRCHXtAyjygvpuvlxOAB3lhFlgvx4GJhPsFMAkDf6UakXB3781VxMXSJQ8Kqw0yS9T0iS8CF8Bhpz+Frb+/EBErKxGLJu3sGz6cit/GR0NApIGbZZKVXmg+pzAaf0VmrbGaaUuAluF0pVyS8bWRqpolIX0zypGs4112Tzpd/ECiqbq2ojbjuNfsGlSDNvLX7bpvY+t5iDGB8ZMoNaQYz0OhT3OvrSggIYaueIx3TpsiY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esislq/o8frp9mYq0vUoHMIcgoNSC3Lw8KNat/LCtig=;
 b=DiZyWLSI07Es6FSQzqtFhfb6Dw6vBLtj9gzeUYzRuR25c/5cPGYs6btCysbY16wC/SzpNKepdih9rxgSO5V855iW0daJtZI1gAt5WVUkiLM+KsfPGrIMWj6H03xsRivlNT9Qa3DTHoWyJ+UC6l7c4LMKZRd7gspidNChg9xa2voODRsRvoQZxdJtSp+BNZq2IwK18i6dpDHwZ3XdpXfySKz78GfpNtJMLVQfY2I3h76eBnjY4Loi1TdmeE7b03epEJPrq87BAC6WN95Dqm6XHbWmkR5pOCAdnDvcQbK+mPAkGMGVoLRsI8rMGnoqkHORy1qBVniQL0YeA2zR7QoLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 16:41:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:41:49 +0000
Date: Mon, 11 Mar 2024 12:41:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <badal.nilawar@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: re-order lmem init check and wait for
 initialization to complete
Message-ID: <Ze80SdCDFHrgy-8w@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-3-riana.tauro@intel.com>
 <Zesj1vgtwk877OhR@intel.com>
 <td4nrxpvrlvzlzqwi6patg7blwpzngnjmvuklj2yiha37lngma@vsi477nqcf2s>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <td4nrxpvrlvzlzqwi6patg7blwpzngnjmvuklj2yiha37lngma@vsi477nqcf2s>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d13786d-07fd-495a-809b-08dc41ea260c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8SuQy4uiSGIeiK7HtQDakp6gbvMDyR2xNt5wPWPG1LW8AyAT1ZQTnk0/ug2xVN1acedrUqFprPTpfk497WNrjCz/RQNkR/5LZLWn/aTuwJxNHPF+XKHGmumY6fpOsTn0bM0ekVKlqIOvVneEclueokd3fHZYkzaIUQn/1d4pNqiC8ROSifpM6HMVDE3oUADx08QlZXyiVAnqGmrfpMZSC1NcYNNPg+sUC2hhr3ZVLNwaxzamP9ft3A6A2PTpzxVhwpq0R728dP2paYA4Qs1D/E8gR4cCdsUYLKBXysv+Joc7O9GuEmGL/n8jdSmsrADo25Bm0XuyOKt7sMHmp+WIpQF1WMAEWY8CmUJWfFDnx+SOyxJFQmVRalSxST9aI7EauOwc5IMS1kIXzMCKT8V8FSSA44jBryRYpE6sSf5iXHTnD6/qH3ef0Pk/JpgZP8IRSH3CPVrE4RLzkTen7YMUo6+VgGvgY8VId/GzF3K8oo2VQwTv8zpCcnZG/1btKQPDjbcy3Nvz0et/juveSfy9twg+BSS6MG1UhcsKaIVx7uYlDbuQox4KfXr4rHlX6sf5h25r9mMkTR0QRYftYY/mNaAMipRR+QPl1SlMvAVNcJF4aCp0JUXZg8poYrh1pvf9I4Hb6JOwneHN+oufT9CcTNlfk/6FdC2XsMQ1ogPxuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VX8KMFiulSPLr5my9GUfSAberzH8Kxpbocsq2r5ZjfEhCkw0rDdQjP6fsD5s?=
 =?us-ascii?Q?w7HahmC0i7qjTTf7EUF4+Z6o6h90E0bKV0EZl4daxvhW/nJB6IOhM64qJL6s?=
 =?us-ascii?Q?FYk9D/atM/YpF2Lpp/FVgw/J7LPs3KoAx4m5fH1GWzJKmMGXORqQsMvYxYzl?=
 =?us-ascii?Q?80oDinCUzqhN7eZmdMjbmK8YaJ8aUXLtFzKYqPksq4PC+TA6fvT2QSu0mJCQ?=
 =?us-ascii?Q?8Um1R73i1vqoteWMpv0stBdS9BcaaVsj3LaQfaUb6DyG+ao4Ad+mnoD6HkUn?=
 =?us-ascii?Q?qQRBVWMA7lUP0zJcDwZb7NSBScmQoJxEno/ulut4v8Q7KEw8JlJn6bF4p8qo?=
 =?us-ascii?Q?O6HFeR8gr2O3O7xIOCkco17GXGEVUoCfGQhy9rjADFXVRduhv+JjR+mJqf8+?=
 =?us-ascii?Q?sUw3IdGqxrqlRONr9QRf3Sl53IhEVlPVfzR6ICBdTOt1/qnZtVjrsq0VarIV?=
 =?us-ascii?Q?eR2OuRKZM2qycnjN1U8gBf23QhnGB7eNAKwQeWTInAGWZh0ZjAF68gntkGMM?=
 =?us-ascii?Q?GER3oP4iay0t2Z7CM08MVFUX/zFqpcBCMyvD/bJLh88OjYuOLZC0GZKHizyJ?=
 =?us-ascii?Q?nSUtRPTPoTWyezBpFI1f3df56qPiVnANuPcAXtk+tq68olk88DPwWPOotkIQ?=
 =?us-ascii?Q?WqvX7+ttdlqoa30AElwR1To92gELoBJbH3414xwgp/Akw8d8BJX8taBQMUM7?=
 =?us-ascii?Q?ob3fN0zLcwh55faEZfyMLMxFP6F1Ux/UPZbg+zCAO58hRY4ShoafkAuQD/O7?=
 =?us-ascii?Q?ornE4XM6uVtU17tUgfHZiJrgyoJTCppjA/IJitUpo/1qTYGL3aIVdjz+xhUK?=
 =?us-ascii?Q?ZZsl9xJeGqdWGGF59pcF3tu5Yp4Omztj+YI8iar+sz/PJhbHPTgbkCpt5Jn9?=
 =?us-ascii?Q?NK/WfPInT9hlhpIKrByc0MKjDD9vBBZdLrlKVE/elvzo+u+hnEJGYxYPcsKk?=
 =?us-ascii?Q?cGpp8atZJj833imm416T1gl9TS9Nh9iQcE1ov/nSm0P5FfhP9mJ1qgbZZBwO?=
 =?us-ascii?Q?tC/OTY2MmcgcAv3fx+F1pRKNpT/hFQqrKhgti3a9248V1l7Iq3iFg8tQ51Ch?=
 =?us-ascii?Q?f2QoJq+tNB2phsb0WGPnV2yOgTq97eIU5sBzilBUq3k5tI5oi2qeBmuOGHAW?=
 =?us-ascii?Q?QBJ2rfcC7yGRTRLPaiFB/y7PPZHY7yxln6SKmWiJfGSNpyvZiGrF/LgqFyCA?=
 =?us-ascii?Q?hDFKhlAV9A/QiQvDG/4CXEsTBHqojDPRHlggnGbNH/gLIAwXrK5QVbQ+SAZK?=
 =?us-ascii?Q?ugoCYl4df0sPRZTTnIqMFp1WfhrVToebhBaJkx6zvnNOB91K1T5f6Z74VrcM?=
 =?us-ascii?Q?ayT8hW5JrhDdOAwNcAqt51a9NYWnlgRe4susptdyQzYRzKfcsmsF72gjQML8?=
 =?us-ascii?Q?y8Nn06ZmQ8Gld5qgRr4g9uif2q4qJ1fHw02GScHxlPkylTmZ9pQbU37Lg+ml?=
 =?us-ascii?Q?gRxuBUffDupmti4nDQnk9nhRVxPqLOgBAiGVglZIN32aazeh3thVNxipmUgx?=
 =?us-ascii?Q?8MvhbFBS/7MFpIPBjBY8LorESGSCjZP5VdEBOt0Y5ei7uj0a/oQSgPmQgdZj?=
 =?us-ascii?Q?O1HfrpRZboIuVQA2sum3pnUNNHVyGPcnsS1vX5ihIjfoNdiZU88qFKEXxNji?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d13786d-07fd-495a-809b-08dc41ea260c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:41:49.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av6ElZwcHnvxjMTu0W8IGNMK/4k/2Ge/kM5griQHLER0PI2JSFjnmvM+lCTm5606GCW8Zk7oNSvxnKOoHghOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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

On Mon, Mar 11, 2024 at 09:40:10AM -0500, Lucas De Marchi wrote:
> On Fri, Mar 08, 2024 at 09:42:30AM -0500, Rodrigo Vivi wrote:
> > On Fri, Mar 08, 2024 at 02:25:17PM +0530, Riana Tauro wrote:
> > > Lmem init check should be done only after pcode initialization
> > > status is complete. Move lmem init check after pcode status
> > > check. Also wait for a short while after pcode status check
> > > to allow completion of the task.
> > > 
> > > Failing to do so, can lead to aborting the module load
> > > leaving the system unusable. Wait until the lmem initialization
> > > is complete within a timeout (60s) or till the user aborts.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 53 +++++++++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_mmio.c   | 29 -------------------
> > >  2 files changed, 52 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 83dd60f68566..4806e7806be5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -413,12 +413,59 @@ static int xe_set_dma_info(struct xe_device *xe)
> > >  	return err;
> > >  }
> > > 
> > > +static int verify_lmem_ready(struct xe_gt *gt)
> > 
> > maybe bool?
> > 
> > > +{
> > > +	return xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
> > > +}
> > > +
> > > +static int wait_for_lmem_ready(struct xe_device *xe)
> > > +{
> > > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > +	unsigned long timeout, start;
> > > +
> > > +	if (!IS_DGFX(xe))
> > > +		return 0;
> > > +
> > > +	if (IS_SRIOV_VF(xe))
> > > +		return 0;
> > > +	/*
> > > +	 * The boot firmware initializes local memory and assesses its health.
> > > +	 * If memory training fails, the punit will have been instructed to
> > > +	 * keep the GT powered down; we won't be able to communicate with it
> > > +	 * and we should not continue with driver initialization.
> > > +	 */
> > 
> > the comment is negative in a positive outcome.
> > I mean, one reading this comment above might conclude that we are returning below
> > because we won't be able to communicate with the GT.
> > 
> > but the code is right and we need this change. thanks for taking care of it.
> 
> 
> I'm confused if it's indeed correct. See below
> 
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > +	if (verify_lmem_ready(gt))
> > > +		return 0;
> > > +
> > > +	drm_dbg(&xe->drm, "Waiting for lmem initialisation\n");
> > > +
> > > +	start = jiffies;
> > > +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
> > > +
> > > +	do {
> > > +		if (signal_pending(current))
> > > +			return -EINTR;
> > > +
> > > +		if (time_after(jiffies, timeout))
> > > +			return -EPROBE_DEFER;
> 
> -EPROBE_DEFER will instruct the driver core to re-attempt binding to the
> device later.
> 
> however we are already doing the wait here, why are are returning
> -EPROBE_DEFER to re-attempt it later? We need one or the other, not
> both.

I believe we need both.

We cannot wait for a very long time here otherwise during boot, the
probe of other drivers would be blocked and the systemd rules for other
drivers like network would timeout.

But we cannot keep just postponing without wait otherwise the bus reprobe
would kick us out of the reprobe list after some attempts vs timeout.
And perhaps that wouldn't be enough to get all of our cases covered.

To be honest, I believe the right sequence would be something like:
on the very first attempt: do not wait and just return -EPROBE_DEFER,
then on the follwing attempts increase the timeout. But we don't have
a very good way to tell which reprobe attempt we are in.

> 
> it would be good to have a fault injection here so we are actually
> testing the error path since I don't think we are triggering this path
> in any machine in CI.

That's a good idea!

> 
> Lucas De Marchi
> 
> > > +
> > > +		msleep(20);
> > > +
> > > +	} while (!verify_lmem_ready(gt));
> > > +
> > > +	drm_dbg(&xe->drm, "lmem ready after %ums",
> > > +		jiffies_to_msecs(jiffies - start));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * xe_device_probe_early: Device early probe
> > >   * @xe: xe device instance
> > >   *
> > >   * Initialize MMIO resources that don't require any
> > > - * knowledge about tile count. Also initialize pcode
> > > + * knowledge about tile count. Also initialize pcode and
> > > + * check vram initialization on root tile.
> > >   *
> > >   * Return: 0 on success, error code on failure
> > >   */
> > > @@ -438,6 +485,10 @@ int xe_device_probe_early(struct xe_device *xe)
> > >  	if (err)
> > >  		return err;
> > > 
> > > +	err = wait_for_lmem_ready(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	return 0;
> > >  }
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 7ba2477452d7..7fc0c5453b21 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> > >  		iounmap(xe->mem.vram.mapping);
> > >  }
> > > 
> > > -static int xe_verify_lmem_ready(struct xe_device *xe)
> > > -{
> > > -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > -
> > > -	if (!IS_DGFX(xe))
> > > -		return 0;
> > > -
> > > -	if (IS_SRIOV_VF(xe))
> > > -		return 0;
> > > -
> > > -	/*
> > > -	 * The boot firmware initializes local memory and assesses its health.
> > > -	 * If memory training fails, the punit will have been instructed to
> > > -	 * keep the GT powered down; we won't be able to communicate with it
> > > -	 * and we should not continue with driver initialization.
> > > -	 */
> > > -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> > > -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> > > -		return -ENODEV;
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > >  int xe_mmio_init(struct xe_device *xe)
> > >  {
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
> > >  int xe_mmio_root_tile_init(struct xe_device *xe)
> > >  {
> > >  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > -	int err;
> > > 
> > >  	/* Setup first tile; other tiles (if present) will be setup later. */
> > >  	root_tile->mmio.size = SZ_16M;
> > >  	root_tile->mmio.regs = xe->mmio.regs;
> > > 
> > > -	err = xe_verify_lmem_ready(xe);
> > > -	if (err)
> > > -		return err;
> > > -
> > >  	return 0;
> > >  }
> > > 
> > > --
> > > 2.40.0
> > > 
