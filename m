Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A927CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 13:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A19112B27;
	Wed,  3 Apr 2024 13:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY03/h7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49464112B34
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712152316; x=1743688316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PipBg2McBo7WGscH445UM9RKzdcdOF0nWIj9EB0Yq/c=;
 b=LY03/h7EFMmkRy5RrCEf/CHLdfUZa4ZdhQ7A0JvWuXmdkuCr/H0OOIij
 PrEXW8vWLHGt0citbsn7nzdo4fSCvBneLuKlhI1FEyRAo8Mkyd4ikkXyc
 w4BKv0YSb7WGfbIUowB4sxT1NIKdy2I/vxGAAHZWETKMoHnKDgl2VIhwg
 XIzZhM8gWDo9eihME0eekpJ42b68PXdIzYFPw0zXT6N2k0umDLBSxfd92
 UVhn/vpHu08JcfeMREd5+YbnVqjeOivOZu48eMq6KPBX2vRgZv5GMdGVX
 oNcAc9LInCcUt3uT1rFuBgKNINKzKnvCA+UJ6pUg7HI1dLS/hIOJuUnVR g==;
X-CSE-ConnectionGUID: EeKemLbiTWuYS+7kyTdQXA==
X-CSE-MsgGUID: o6u6q5+CSYaDVo623DdDSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7254213"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7254213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 06:51:56 -0700
X-CSE-ConnectionGUID: PDS5W3oATSG/bQtaaG7eqw==
X-CSE-MsgGUID: 3BoyZ/xRRtuVsaSk2vylrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18365354"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 06:51:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 06:51:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 06:51:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 06:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1FTDW3YmXoPwrzmXyG4QnLrvPGtoCv4FAWyhAMTOv9+1MjZ4ocM2vW28deNHTzkRTlXKyhzhoxT9OM4qlKWMXi9NcgK/lhoQcdbq4cCfdhZ/5L3eg24noFCelsbNjT/wKjm+Ed985ezoj0wHcYNcCPasrBgbVUhAB3DGyyWDf05Twy69qzyni2t2j77qGh0SB9NbNJpFxxjN70uO9o7i8nUMHZCIBZanuFXnd5gssJ16gbCftFtXn0coJXxwDb7n0z/B+CuF44JgWFwPbduYfMwsThIE8j8MZ72aWzMz1ppzHtOB3IQzX2ud9egAJg6TpDY6mDu0zuRmwiLLU5RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUEithj5Sid0iUW5xwvK8C0floQQi7a+VIfipSswaDI=;
 b=goOVMht87Lw/kyd1f+b7q9ykiK8UlihLRosHXD5YFnwFBN9Mm1pXxxiKeuzLvQm/ZHVkn36KmHG3BNc32zYQcx7Ri+MeNOSA6r+G1EecuTpIvLnsF0OTVRVPCFve5UZcqoNFyYk8kNIti7Sf1UEt22CyC/3Ju5EmNPbRs6m5axd+zBME+4+ZWBTXmEphLVdT4QUw2U9kodaPdwGZo6gY4/5b7dAaWYAYQD9b/pQEBjvZDR6nKa8dPM7y13bzs5SfUe0T3W3oiekTZa5qN5PXUjNQ4rdWX6WObCLsy7Z+0qPg9/zGGll+X848FQpZQdA2/yJlhFFTcrd/wte/IZxxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Wed, 3 Apr
 2024 13:51:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 13:51:51 +0000
Date: Wed, 3 Apr 2024 06:51:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18034896535
Message-ID: <20240403135149.GK6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
 <20240402190105.GD6571@mdroper-desk1.amr.corp.intel.com>
 <DM4PR11MB5293C1345F7F6B2BD014B91B9D3D2@DM4PR11MB5293.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5293C1345F7F6B2BD014B91B9D3D2@DM4PR11MB5293.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6948:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CePj6POjhJAy8yV65/nUcVmd8QG6vKbG3pMOEYz5SVptX4y4M5y8x9HDn9kG9rF2O0efNUaElowS9wAvR8/7UIs2x08vO9ifFlX07PmyVsggMTCKVY3UV+Icw51RQEnGvpxZycgUa31+mYUOYp5UWij9/3go8ACyg5xLpHv5Oc6pu4aOLQA/e/1mTPXXTXSAfvNYOPpZ6KFQ38JFdFgk2RBdkGfsZe/ObOBPMzutILxaKyZo9uJf82jxXHXPxPEOnL7MoJJ9DSebqQgFHkN0vs+HKI7+BgyOkJ75ObDWjH+lEBzspkr5hQ0YAeCezlIVmteVo6KL2FlU7aDICrlYX0WXGNIvftcOanqqddp6cckd6xY4J2kcQJ9rMRC9wThgcc6ptmGtmtDQ4MYfAKmsv527eWgthYL6swzw0PvXJuVEnHj4maJU81f/bX1PfiNTfbG4EmyBUZBdkwHJHzp11oqv4UuYvgKZsihpYhKswAj6pHgxtlfzVOjueeQLuB7v1cklwk6tWslwwu3WcCkADxsgjXBA70kT5nigfqtWxz5wMiQcx7YF3CRuiqZZaNrmwp9+nSf7WH4tiV2QgIztbIjfbGhtT1BQdK063RzHq+cMbRZyVtmCOBccYheVianeWB/Yl+Ja7kIuOiH39/veZxCpg9PAWaNHzn76XzAPknI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?psKEVHV7EbZFs7a91ZKeRDElufYF/4djLVMLrEIFfj4vvYtccLgrcCGfQm29?=
 =?us-ascii?Q?2+0tyvjtL/N+Bc1D9glwmDVbYr2EtvFFPdszuMkyCSZPVfb2zh4XNTM9hspn?=
 =?us-ascii?Q?Wt+fn4Cb1ZGeMfokXJBeXh2VRo2fG0maCT1vxuJ+pQNsT1SOVNtUv/iX6YlB?=
 =?us-ascii?Q?vjenC/3OmZlX+1xLjLp9pu9syT5LqUa3lHBpYT1b1p1UpDIMtYPuYoc30Jbv?=
 =?us-ascii?Q?fvos2TkbD6GmUPmyOfdWjZLiNGZirFeuAMEveXjObjAN2ACutzcrq4JZlOWS?=
 =?us-ascii?Q?SU92qZYlXUG5IxYiuFdgmJyrdV2TOENCB9YNyaYFnxmBflo6hFNHwZTA6jxw?=
 =?us-ascii?Q?cg5+LmDBHvACAJyEpetoMAhxeeiKIXGc9nlG2OzeuYWykK4eXBFFyqnXGbo9?=
 =?us-ascii?Q?iXxtwRQMEAoELPMF6PWQ+CmGhZEuTbFVeagUS35MBbMAvmfK2GZgwmq09l1z?=
 =?us-ascii?Q?Z2+KLAWzl+hsKiNCEejC+DHkkryH+l2M+7PsA1Ud7koW8igDRDmajC3Fw9G+?=
 =?us-ascii?Q?V7aKAiPTKJXqkI3Jb3aqj57qLDKX4E1ALDrJXoO2kjDOiWQSo+8BPBMJ/axW?=
 =?us-ascii?Q?Ic+lf4cgvmgclPV+L4rZNqL0IEE9TFNcsefJe1TRFIRSrO3v9yJ1AxxwKGYT?=
 =?us-ascii?Q?C5xADsgmCZ/cWpBDR++UEsyXwAJ3L3Rana6PGut6hMgL4R5Shon8i7+arnkF?=
 =?us-ascii?Q?YbiI62yIWkX6WxwR9sInTVa7wnHfaMjp+032XDtZDXqC4r8rG/4sCmxANU6o?=
 =?us-ascii?Q?8YB/+6MmmncwjrINWvq3IWtATEBoWZZ/Ol/6yM/JAvFVvWgrq+j7+XINLsGk?=
 =?us-ascii?Q?5X7yNEWYl91HYucA304n5u8YKYIdNMQJ2IBDp22ZYbwAr3EVSSSY8dCvYVww?=
 =?us-ascii?Q?Kt3Dluz5WBEw7WL/QEbQy/qaeZ9AzqnViZBI5+Zzr8QDF9nT5qfMh0y//Kd9?=
 =?us-ascii?Q?Ms7Pu+O7fLgXAl/Kw06YAobR5NBmKhQS9khMUYduARE+N+4ozGJLgwu0R5Pa?=
 =?us-ascii?Q?66Zfz5Nt4H1Byoni6+m1MgUVv8hyxFZf6i3uT6JoZeNeNnxWzzks/07vdPlK?=
 =?us-ascii?Q?jtshcwJqc5rZHmctf+sVeG7sAUmYvh3S5lvPXZLO5a+I1iFDk2/rC52rhSFL?=
 =?us-ascii?Q?gLOPA3WiV3Aow5fwbLUQ9wUa1/BgYr4O9YzsrgWZ7qkwy6mwbH2MOndJrxmS?=
 =?us-ascii?Q?v4BRBy2mjAa9ObRWhVKfs6Mx8/4cG4q1+/5NvPw7bI5jUf84ibx/xDLluFZN?=
 =?us-ascii?Q?tqkMFpVvusmI/g+9rvFU+GxkJmze17wo7S8xp5rXVPlnH8o249p+kedBWism?=
 =?us-ascii?Q?Ahe9ALjCumhBMNkf6ShqVe8Ymbto7cmb6JJnLLXQiZiibF4+fbZj3AuY2aZH?=
 =?us-ascii?Q?66AwmnW5MKPKB7XV+qCl62KDsBFnmuzNbrHtFh6bp3Uq+Vlv7P08BLrzQfvb?=
 =?us-ascii?Q?elTII5drm09yU1Z6AovKqr8OlECTFZH6w68bBbrkQURzAcDyQQxBobBq/QZy?=
 =?us-ascii?Q?kAjPQs0F8Bh7cFI+z5UHMTVcVbzfTb6cSNAwDOy1ofWsPtKzVVC1Mkp7MSWq?=
 =?us-ascii?Q?IfwjX2RrIlKo0fJUXu0vbKRDcOD7S/1Sxqk9uJenFORisWEGcu3rZfDDyYTL?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bfe4aa-07cd-4de5-bf15-08dc53e5370a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 13:51:51.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13IwPCLpi1Yl8aH7rX9llk93BqGsAr8JMqw7FkQM2jegqR9a2hQjuI8kactYRSUlLhnsrSiTtHABIpihELNWEWlO1uQfQRP+NZp02zQFS+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

On Tue, Apr 02, 2024 at 11:22:31PM -0700, Bommu, Krishnaiah wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, April 3, 2024 12:31 AM
> > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18034896535
> > 
> > On Tue, Apr 02, 2024 at 11:41:29AM +0530, Bommu Krishnaiah wrote:
> > > Add 18034896535 as driver permanent workarounds.
> > > Also reverting temporary workaround 16021540221.
> > 
> > Why are we reverting 16021540221?  It's still listed in the workaround database
> > and I don't think we're at the point where we want to remove preproduction-
> > only workarounds (in fact I don't think we even know yet exactly which
> > steppings are considered preproduction).
> > 
> > Even when multiple independent workarounds happen to have the same
> > implementation, we still implement them all in the driver.  The independent
> > workarounds may extend to future steppings and/or platforms in different ways
> > and need separate handling.
> > 
> 
> My understanding is 16021540221 is setting the workaround for A0, with current  workaround(18034896535) set for all, so keeping 16021540221 is redundant, so I removed it.
> 
> In order to keep workaround number(16021540221) should we need old code ? 

Those are two independent workarounds that just happen to have the same
implementation.  We want to keep both of them, at least until the point
where we decide we're ready to drop all of the workarounds that apply
only to pre-production steppings.


Matt

> 
> Regards,
> Krishna.
> 
> > workaround 
> > Matt
> > 
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 74b33a3845f2..4d8e0d64cf42 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > >  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5,
> > DISABLE_SAMPLE_G_PERFORMANCE))
> > >  	},
> > > -	{ XE_RTP_NAME("16021540221"),
> > > -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> > > +	{ XE_RTP_NAME("18034896535"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> > >  	},
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
