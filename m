Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C3C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 17:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ED510EB53;
	Fri, 12 Jan 2024 17:52:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9351210EB55
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705081936; x=1736617936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uns98+knK1/kQRvtDDo4aihfdg4oQ5u2mAiPj2OjAts=;
 b=Odyaz1YL1VDcdEjwyccya9wFxCynNsuhfgMoFcmO6G0qDoCQHFNJdVGT
 I6k1FjXDF65z+iAZhuo+1itZNoJSwSkB7J8yfXj4NO2K3CvaVgUCXY4rN
 HzevbCI+9GbG8X7470S8qAkguPvv2eObZUNmrxodMdBX11CP1OV+Ns0tt
 AYEXoqOowAMSaG+9pt6bCwzCjfdcLcV8FniEl/1cpwnI3ObUlT01IoBfc
 GOkR9PMeOh1F6bcGWjBIuu4pQa11hqvm4K8wAKGf9EfeJ3KYnpGoJaUVJ
 uaQK8uZFv1eGpEgIbmCFowKD0fx7Uba8YDccbI11YWP5Ct3nzLARfO4Th A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6606654"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6606654"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 09:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="17462132"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 09:52:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:52:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 09:52:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 09:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoIqs5EWp+GryseKbRH8IUKYZVi+8rQ7ZRhQWRCBhKSSMtNAZI8l0Hya6GV5AYSGotaKHzjZH/4cgkPPU6RvZOtS8CsEcaehU4rsBCbryobMIrok1n5jZHmsLV3R5p9YvK+6x6pSaaFpsHO2kj/xOyOIT3Mna5JNhiUFztX2Nb7r2qMA9ehAKH1CUS8nxQpSZ4vpmAn17ZigH0bDz4JFubPPyvcPyvs7DXAskLa4RyUseZVktJDgqCtVGtHrsskONIXPURaEQgYyqbCjgvQWbw/yj3LW5guZM9PQD7c0umG/x99pui5P9hw7eLtKR+F3aMGGpSzvvdIqGYnjPaPMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyFCeXzwH6dvOs/VzAXm0GmcYyo8itW2t0/1JxqurPk=;
 b=QhyIQqmfumpNWJVb8mxcCcwRxRK/1pb1HfIYT5P+yyzCucF8+8j7yV4wLN/9ifzQebh/BnpGBa70qyiupXf0CSfwW8ZdKXt/YtLEapa1OqFsrAYEkG00DaPPsIqmonb57AiIqWV9HxaHlnZ+wFIm43YxFuoYGblscwXtgokF0QCH6ZMlCpWB24W9yb+A0gx2u8hEpXiFi61ppgOshUtMobfYhT3Lpc06J6C2zr2wTkG9nPoVfyRmi1f5t0QjoaXe8xmmJzSeEy+femsgkAfFgvXm2BVqCtgU2achiHBztm68KNmMG6RNupoMrTQ1R5c5xovD3Ot23Js8WvKmD0W3PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 17:52:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 17:52:10 +0000
Date: Fri, 12 Jan 2024 17:50:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/guc: Add more GuC CT states
Message-ID: <ZaF7+Tj1WGKqu3/i@DUT025-TGLU.fm.intel.com>
References: <20240109230149.1399302-1-matthew.brost@intel.com>
 <20240109230149.1399302-2-matthew.brost@intel.com>
 <c779504a-d010-4c9d-9c95-fe17b8520c66@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c779504a-d010-4c9d-9c95-fe17b8520c66@intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: f87c4073-a7de-44bc-8b7a-08dc1397335c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1JTy8aoBnMJcwjSAdoZ1howwXjCufHPMjKardpKGa+aGKCic93JAE0DP/ZIPxrauVNSSN112FlBpV1avbVhwKhgfVvdl0rK1rEEg7xoLwztuLaOc6ecUIsI/qJ6oc4fT46iuqtAeMjp9Y2y5NKGHTZBh2TPZvNfnmIZCM/D1lFjUzKuhe31YYRvVEyfYSuzGB0eDxdhGj6dsqL4mYr+/GIothdT6Bo31E1W69HDb0Qb61ruSm35fzNdCgQYiBaBGECI+J1v5k0lgQUKMeDBl4GOHrkcXHd6IcOK5exnYETj1AnIZeSHEtE+qAVBjE2ZcLqFrrj/Ct54hS7M5eVziJWj78clVLFoOrkJkHpOFLnk3eV9x9OtfNKu9DjCIBe+lLJZ5p2ZIvxOLgUN+7MgHJZXftqYWWzCrM8ZIGb0xMGQUXVhbzwQlwUDOUv32oxsSJYosNLB9YI1IGedSIJ2fSbiIVa1eBN+hby4giYlqwziY4th9ziTO+tDOFXrDTThxCLBgrWUPcmP3U3KyJpH/zy/wXVXCjkT3Jr0hsgYasUI0IfcgcUBTuIgpPre7stlCXcsdlEcbawrIeKky7/9HRweYgcrCiHlak7jI2Xz5qCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(478600001)(107886003)(6512007)(26005)(4326008)(6862004)(66556008)(38100700002)(5660300002)(44832011)(8676002)(53546011)(6666004)(30864003)(66476007)(6636002)(966005)(6486002)(54906003)(2906002)(316002)(8936002)(66946007)(6506007)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2pT1yr1MojBM3eaaHngIZS37e8FI/x+NBjahUe1unIn6VfVVLUtNbtBHgSMF?=
 =?us-ascii?Q?XFFWNnMNoPHdlHKRh3sVkSTQUz2KU2gsxJtm+hu9NUK6iNjMr7/8S/8xfsq/?=
 =?us-ascii?Q?e4NkATj1SHpFOoHwC44SwqihPGilqTlESh4cEV2K40EQFvR2+HI6YECwB1fP?=
 =?us-ascii?Q?rBGzQZwultNIXLQV630GbfoGTBrfV4mYwVlwaBE7lQwuOZXBfJ0IpyGo4ABL?=
 =?us-ascii?Q?00FOfvJOIjhIgLEvusWzyKrdwI0cHEs6epSzWutsAXoUyubW8kHxXdAZ9MUF?=
 =?us-ascii?Q?8v1eV6LT/ryfMA8JZk06jgj4BgOPSst8PXfZrgs6UR7Iikt/lUgfUiBNYo4r?=
 =?us-ascii?Q?LcEMcJDMYrY2dbEE7cVKDabIB08gLpPsI1jKBUCV5GLbhw2QtH8/IZYXkBH2?=
 =?us-ascii?Q?Vss/arVGQX/fTOAntlZDuSc1ISozYGGT5/6HBw/4e1Z2EUcRpM8kVBLFDGbW?=
 =?us-ascii?Q?WRhVuUPfY0/eVQC2b68SLj66B9ESDvY4vx5ztAbubQ9uP2OjrmZGrqR6QtQ+?=
 =?us-ascii?Q?hZ5TMLUJc3HzCZJWIW1l1tAd6AADr4mWylBfggaWR+/GYze0h+1Y02bkVlVc?=
 =?us-ascii?Q?HHok6//pyq4lxXK9x4pkMyLpHo94znQYUOvvrW9PeDNtdDOArwd4iTj/8qtI?=
 =?us-ascii?Q?vYwfOIkn6GvVvn1MLJYeQslFkHMDS7M8NXFLbYE9yRavfcgpN8gg65R6rHlV?=
 =?us-ascii?Q?6fIty8aPSgYAcR199l7CK1QHGnPgEJDz00PEEB6D5100i0I+4CDz9BhNfjML?=
 =?us-ascii?Q?mx/tlK1hzvGnieK5t/lIpnRjXrGhze9JQB0egJYUrfqHtNkHUR/ENnSqkndb?=
 =?us-ascii?Q?+N//wRgUcE2+0kJcc40S8YnuW9U9NVeMbyuZ+AF85c/VLhdA1YJef/XcJtO0?=
 =?us-ascii?Q?5Bm9uxB0cluUUKddQquUArbH482li1CM9fIsNAMwWUJmq9OzK4Nv0BIKx+NS?=
 =?us-ascii?Q?vy9K7gIH30lPZoPrlguGXVSKjg5c7xRxuaMOKksVa6Hd+IWNdmFUbiuw+UYD?=
 =?us-ascii?Q?/XCQYC97L0v9Jz/cvV3NhjrBBrFJTISlxtISBkQauG0/DCPcn0NOXgZgvMrG?=
 =?us-ascii?Q?Zrqex3fBtoH1ITKfKlqYveYuzxuk4JpMjpPnOxlR0PYIu5sLcPfzaWqv3zfm?=
 =?us-ascii?Q?BALGdctf4QpaMw4bfABGco0koAcIlZurrxjPqI8vT8V0j5nS4eMyuvIGirxz?=
 =?us-ascii?Q?mbFkafKi9WarDTZkaw+4XDG0Y0yBCh7jCR3rQc5S2pCwOS1qfvgSqjpltq29?=
 =?us-ascii?Q?7QKOMbtV8kwl33tH0hZSDRvK/6dj82gUCCF8HvkxjJPCqGAcosXRtjlJxHQM?=
 =?us-ascii?Q?EX7HOxFsWks5nXGcxLH2Gsx+H+0iCJcE2I3gnGtu0eUO8pSvamh4OGcTxPDX?=
 =?us-ascii?Q?Nl7Thm9eaRicEnYujrlg1nFy68NK1qCrb62NEz8VKa7Hrbu0a3SDOd2MIpcQ?=
 =?us-ascii?Q?wCvArc4EZkJoKDiEnEAwKPeZQf5kdWZbriz/mj1gPMG2foOv6spD+979zwwZ?=
 =?us-ascii?Q?rTdINw4bTCQYJy9CuS/rLAn8TVcrFnT8NXPERb4TUGDm86g27ZCEkL4oCvAN?=
 =?us-ascii?Q?FOeCfKsm4+WJzL3mZTSQHDYYaG8rX99PfiZGQbgZS5Mp+tWOOZv4PPStIfmI?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f87c4073-a7de-44bc-8b7a-08dc1397335c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 17:52:10.3730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yR9ifXkHsLuStAaDJyzZyHUiPHgTEtkxV8rVPEicMhtlzCDlLhmoTGr1S/xhMmkdOLzeVZIAy+vosKreqS4qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 12:01:55PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 10.01.2024 00:01, Matthew Brost wrote:
> > The Guc CT has more than enabled / disables states rather it has 4. The
> > 4 states are not initialized, disabled, stopped, and enabled. Change the
> > code to reflect this. These states will enable proper return codes from
> > functions and therefore enable proper error messages.
> > 
> > v2:
> > - s/XE_GUC_CT_STATE_DROP_MESSAGES/XE_GUC_CT_STATE_STOPPED (Michal)
> > - Add assert for CT being initialized (Michal)
> > - Fix kernel for CT state enum (Michal)
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 56 ++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> >  4 files changed, 65 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 311a0364bff1..c28410958990 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -656,7 +656,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >  
> >  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> >  
> > -	xe_assert(xe, !guc->ct.enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> 
> btw, what was the rationale to not allow MMIO communication together
> with communication over CTB ? note that GuC still monitors MMIO for new
> messages after each H2G IRQ and in upcoming VF specific scenarios we
> will have to send some acks over the MMIO, even after CTB was enabled
> 

See reply on your patch.

> >  	xe_assert(xe, len);
> >  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> >  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > @@ -838,7 +838,7 @@ int xe_guc_stop(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > -	xe_guc_ct_disable(&guc->ct);
> > +	xe_guc_ct_stop(&guc->ct);
> >  
> >  	ret = xe_guc_submit_stop(guc);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index c29f095aa1b9..5b122a926ccf 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -164,6 +164,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	if (err)
> >  		return err;
> >  
> > +	ct->state = XE_GUC_CT_STATE_DISABLED;
> 
> maybe it's worth to assert that ct->state was UNINITIALIZED (unset)
> prior to this initialization ?
>

Sure.
 
> >  	return 0;
> >  }
> >  
> > @@ -283,12 +284,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> >  	return ret > 0 ? -EPROTO : ret;
> >  }
> >  
> > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > +				enum xe_guc_ct_state state)
> > +{
> > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > +
> > +	ct->g2h_outstanding = 0;
> 
> we used to clear g2h_outstanding only while enabling CT, now this is
> done on every state transition - it's not what the function name says
>

It really should be set to zero on disable now that I'm thinking about
but regardless it is harmless to change on every state transition. I'd
prefer to leave this as is. Also fine with the function name.
 
> > +	ct->state = state;
> > +
> > +	spin_unlock_irq(&ct->fast_lock);
> > +	mutex_unlock(&ct->lock);
> > +}
> > +
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	int err;
> >  
> > -	xe_assert(xe, !ct->enabled);
> > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> >  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > @@ -305,12 +319,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	if (err)
> >  		goto err_out;
> >  
> > -	mutex_lock(&ct->lock);
> > -	spin_lock_irq(&ct->fast_lock);
> > -	ct->g2h_outstanding = 0;
> > -	ct->enabled = true;
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> >  
> >  	smp_mb();
> >  	wake_up_all(&ct->wq);
> > @@ -326,12 +335,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct)
> >  {
> > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > -	ct->enabled = false; /* Finally disable CT communication */
> > -	spin_unlock_irq(&ct->fast_lock);
> > -	mutex_unlock(&ct->lock);
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > +}
> >  
> 
> shouldn't we provide kernel-doc for all public functions ?
> 
> while there is no documentation for old functions, this xe_guc_ct_stop()
> is the new one so shouldn't benefit from relaxed _initial_drop_ rules.
> 

Yes, will fix.

> > +void xe_guc_ct_stop(struct xe_guc_ct *ct)
> > +{
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> >  	xa_destroy(&ct->fence_lookup);
> 
> maybe it's worth to destroy xa under the lock in xe_guc_ct_set_state()
> to protect against another ct_enable() followed by ct_send() ?
> 

It shouldn't be possible to enable immediately but sure I move this to
xe_guc_ct_set_state with an argument to xe_guc_ct_set_state which
indicates fence_lookup should be destroyed.

> >  }
> >  
> > @@ -507,6 +516,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  	u16 seqno;
> >  	int ret;
> >  
> > +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> >  	xe_assert(xe, !g2h_len || !g2h_fence);
> >  	xe_assert(xe, !num_g2h || !g2h_fence);
> >  	xe_assert(xe, !g2h_len || num_g2h);
> > @@ -518,11 +528,18 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> >  		goto out;
> >  	}
> >  
> > -	if (unlikely(!ct->enabled)) {
> > +	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
> >  		ret = -ENODEV;
> >  		goto out;
> >  	}
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> > +		ret = -ECANCELED;
> > +		goto out;
> > +	}
> > +
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	if (g2h_fence) {
> >  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> >  		num_g2h = 1;
> > @@ -710,7 +727,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> >  		return false;
> >  
> >  #define ct_alive(ct)	\
> > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > +	 !ct->ctbs.g2h.info.broken)
> 
> maybe instead of having two extra 'broken' flags better option would be
> to also add XE_GUC_CT_STATE_BROKEN as new state ?
> 

Good idea. Can I do that in a follow up as this series is needed to
unblock.

[1] https://patchwork.freedesktop.org/series/125804/#rev1

> >  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> >  		return false;
> >  #undef ct_alive
> > @@ -996,14 +1014,20 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >  	s32 avail;
> >  	u32 action;
> >  
> > +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> 
> this seems redundant as you've also added assert(enable) below
> 

Even if redundant I prefer this as it self documenting. Also compiles
out without a debug Kconfig.

> >  	lockdep_assert_held(&ct->fast_lock);
> >  
> > -	if (!ct->enabled)
> > +	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> >  		return -ENODEV;
> >  
> > +	if (ct->state == XE_GUC_CT_STATE_STOPPED)
> > +		return -ECANCELED;
> > +
> >  	if (g2h->info.broken)
> >  		return -EPIPE;
> >  
> > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > +
> >  	/* Calculate DW available to read */
> >  	tail = desc_read(xe, g2h, tail);
> >  	avail = tail - g2h->info.head;
> > @@ -1302,7 +1326,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >  		return NULL;
> >  	}
> >  
> > -	if (ct->enabled) {
> > +	if (xe_guc_ct_enabled(ct)) {
> >  		snapshot->ct_enabled = true;
> >  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 9ecb67db8ec4..5083e099064f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >  
> >  struct xe_guc_ct_snapshot *
> > @@ -22,9 +23,14 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> >  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> >  
> 
> not sure about rules for kernel-doc for public inlines
> 
> @Rodrigo ?
> 

I think we are allow no kernel doc.

> > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > +{
> > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > +}
> > +
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> >  {
> > -	if (!ct->enabled)
> > +	if (!xe_guc_ct_enabled(ct))
> >  		return;
> >  
> >  	wake_up_all(&ct->wq);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index d814d4ee3fc6..e146dbeddedb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> >  	struct guc_ctb_snapshot h2g;
> >  };
> >  
> > +/**
> > + * enum xe_guc_ct_state - CT state
> > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT not initialized, messages not expected in this state
> 
> with little effort we can drop this enum and just assert that state
> shall be non-zero, note that we never explicitly set this state, so we
> can just rely on compiler that already zeroed this field
>

Agree I prefer that state as it is self documenting.
 
> > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > + * @XE_GUC_CT_STATE_STOPPED: CT stopped, drop messages without errors
> > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> 
> still a typo
> 
> -:223: WARNING:TYPO_SPELLING: 'recieved' may be misspelled - perhaps
> 'received'?
> #223: FILE: drivers/gpu/drm/xe/xe_guc_ct_types.h:80:
> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in
> this state
>                                                           ^^^^^^^^

Will fix.

Matt

> 
> > + */
> > +enum xe_guc_ct_state {
> > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > +	XE_GUC_CT_STATE_DISABLED,
> > +	XE_GUC_CT_STATE_STOPPED,
> > +	XE_GUC_CT_STATE_ENABLED,
> > +};
> > +
> >  /**
> >   * struct xe_guc_ct - GuC command transport (CT) layer
> >   *
> > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> >  	u32 g2h_outstanding;
> >  	/** @g2h_worker: worker to process G2H messages */
> >  	struct work_struct g2h_worker;
> > -	/** @enabled: CT enabled */
> > -	bool enabled;
> > +	/** @state: CT state */
> > +	enum xe_guc_ct_state state;
> >  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> >  	u32 fence_seqno;
> >  	/** @fence_lookup: G2H fence lookup */
