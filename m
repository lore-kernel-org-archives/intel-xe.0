Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54096C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7E910E035;
	Wed, 26 Jul 2023 17:25:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECEA10E035
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690392303; x=1721928303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ghAL124kHyTSndqNeOF1zbQA7qgf8yJYCRmZ+Eey5j0=;
 b=ZECyIUO5KD/HPDgHcLhI98lpFMIQ09eS8qA+Fr/4gXIkGgb3PE0IjjT5
 O924OH2kWnfGf/Jy65Q9f0COyHlBYtSpHyBNbI240C6GlWM/cZMvzWypo
 v9wkQIvYEin6y9Z4yThmOzI6HoSMFx/1GWiKMYNxP9NXzKoCzsOtKuUaJ
 ujCIg6Kb+2PzRZ3kGz3sGcTxDYL21DRKNLd5CNLcok55fCPhecrBPnS9k
 9/ysCWg2ldbXIJ3d37zSd4/OoxjB7i3SAbvAGV4iniy3J+/7X0ukMlwR5
 55e/hivKyks2vL5HRcoxhKc+oeqaqb1Pz8ZFdLXoC2UTLtkXdGAMcIV7f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="366961831"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="366961831"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729945954"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="729945954"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 10:25:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:25:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:25:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:25:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxrmRU2XHUZIuOjspDTV1PIzKeSv/Zw+pG0fdJf9hJc0N1TvsQKT3dhVbXAz3WViz5eiApWi55kesZ7bwks4kGZTExndYIeD1zvApirNQPCv238U4nGiSUH+77XjR2AbjkjeHeDrtWiTBYRRla2E5oD2L0fhXtj4YgUFsotEl4948Py5eSGNWNnXA03To2CEGd8B9Siw6ZlybdhUTuV7iPkzH6IZbBFoGM1RtnPJt1vxB0wC4o+cERrtO8G2PKZmw3QFgOsiujp5NkjacIkUCdZmMjIJOdBu7/L4trXQTL1q9Qd2ksJ596Y45YJZNd+VbO2ZRCHqPM1HFTW8FQ/44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41Fb73x2uQrbOz4huQa/j2m1uhkIE30pcllLe6n61S0=;
 b=Hz8r8PiuUUh3mIL9QecNS27MgmqBOLQAasDBiBKbmF5/sxtDi/YmU3+L16KLyFdYihJLl1PRWqnQWwVg2QmriduJEjc2+NXuZfjGfTFQSklNCl5/MNYxWPYKuW0JQpimyO8t6T8o4oZfwYPEwphasAe/xrTHAuo+tQLmtClYSj7qe9rPKn3Cvne+oLndWDG838x6deqJ+YsZEyAjTiz7IOdvdGhsytjj27vkRqgNovalS/ljsJvjhwP9u+3KO1uziLd5ckJjiL7pud5NLy0VjHD45hACPZJqlnZ1u4WhwLlrYa+GTCGJj7tn7TkvuVhOLmwwTdro5/5djdYP1WCrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:25:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:24:59 +0000
Date: Wed, 26 Jul 2023 13:24:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZMFW6AkUQCWNGdpl@intel.com>
References: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
 <20230725201758.329342-1-rodrigo.vivi@intel.com>
 <5041fe3d-2183-86fc-ce5a-db2537713eba@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5041fe3d-2183-86fc-ce5a-db2537713eba@intel.com>
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 33042705-8c4b-4ece-059e-08db8dfd3d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: us7zM3rWXTDDpxwHTyn+yMqjXhk6ruZ2+ExONr7g8xH0iu+t3nGo6rxo2WlCOTva8VAUAd5Ta1R4ZCzm81aDw1a1U98XWgsPCpXJXJytsuyblh6B0nO1SgcgLCNQS2uUTL6mNVZ6frYnbzoZuwkvu8jSgbYZiAPb0gO3o3iFbwEPM/UEU2qcBLYxOUKXlIiOJTcnBBQi1CpJuony3jLmvhNJC4foGuWOSTpoHS5oOLWLOmU7/mw145Tl5jXSZcxm6WNc4RM9JvbU2ZI9BaSXvADKTOhZoOrpO4EdHEfPlf3mP+Joa9Vpmbium4h79mH1q4pQEwwx1CRJGgKT7T1ox2HJS1ROGcE1qi9xTQ/3u1O8rkAbXe/mVntlbTkWLTsBMj8wTNRw3oiz7e+V0BYm1Km1stZm1PZ2/S8Vs+nGl3FcDG0uKKaiNFsWXzUahK5UJbRGKcqOLOqrIR5lWjmruA4eJZzIm+5NGrxOZEPmQ6zZHGap+u39kjiaL83XijDN5qIdBrCriwkRpDlFOo2cJq4BGnDVzJDEhV59VRaSDMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(37006003)(6666004)(6486002)(36756003)(2906002)(478600001)(82960400001)(316002)(8936002)(6862004)(5660300002)(8676002)(41300700001)(38100700002)(44832011)(66946007)(6636002)(4326008)(66476007)(66556008)(53546011)(186003)(86362001)(26005)(6506007)(2616005)(83380400001)(966005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zzGyPYQ9kux95V3VI00Rmb+h+w04RbcJqB/D8W0eghT66L8y7LA4UbCHrZ57?=
 =?us-ascii?Q?le8mCGPknX/qPOS7jyMYkif43HUfWOSLLdYlZVhwqTp1txVimCBbn/QmijVI?=
 =?us-ascii?Q?qKVzj3ZRxB9Inn4SQXA5OXyjgWNSUwQByDx7T/tn10ZMfN/siUV+hrBpAPAS?=
 =?us-ascii?Q?goNdh7KywJ+8/d7dpcsUSiQsHMrC3dNC452Ef1/x3c/ZBSyCUm7lCmyHGXcV?=
 =?us-ascii?Q?109Xey1eQqbG5FBC7FdFEaBohcHvas9cn5K7RRdYkg18HktkGFisTVZke23Z?=
 =?us-ascii?Q?JWpGte7zGntkzkrDNOJNFG8Zf3QDraS2MmkxtrOtnMkphSnPmIEG1guFo1dH?=
 =?us-ascii?Q?wAh9TVgHj/nBDgPCSlT+JvhazKoLAjeiq8yP22hKow4iAYyjr55nWYhVGzpX?=
 =?us-ascii?Q?bfLsqwqV3u5+NZCQXXeqjwovCd6Y3nLYlyuJm6ROkW8sCjm7dC3EiGN2PF1x?=
 =?us-ascii?Q?gT3NiHDtMP7xDBdwWEYtRhAhzQ/C4Xaw7Z/YQJbhHuVKzbqcfrol4Obxznm2?=
 =?us-ascii?Q?Nlzu8r1jDeE4cRzQZPv/Hw7lowmKEiYhW2iynkZXvNUxFoiVVhj+WnKc50FT?=
 =?us-ascii?Q?40qeQHj7PRTRPnHbTspzOFCVaQCEu81/EhDP5VwwI6xKj9t73iBYILOUvgKl?=
 =?us-ascii?Q?ip9vo7AsroSekulE6+5R0YoRlrn+F5eYNi1CzHAzaZQ5qrdPb+lj+g8vC0mu?=
 =?us-ascii?Q?muH1zyY/HpnIhTG+3SLiZDG9grLms9tyuTVNh1ELgv6RNWlQ3CgibNutLlwh?=
 =?us-ascii?Q?3al+5B76ZGcAv8IiXiCt3CmPOzQ1MJyl+fHGk4i9Imfl3+mJvjfO1PFCZTMO?=
 =?us-ascii?Q?arWEcsOg8KmGRHkuFM2zCr0tLesHz32TmXhebIW9/4x+mkBTBs36Q7Izc4QO?=
 =?us-ascii?Q?ecTvJqHu01qfCBaW4/pp4UC2g565arGfuVR+ECBFW7iM9OSeYbBBuk7F2zpC?=
 =?us-ascii?Q?RRb56fY3Tc4DGjK8sfIVsxKzbXwEtpcv2IXjqKJFZOUMf3fYKW2zLtlOS42x?=
 =?us-ascii?Q?FaqUsiumBkI0cAW+q4eJB6owcUGF4i+L+6SPhN809Qih1eRGHMzs2cImwjS8?=
 =?us-ascii?Q?rmha4xpWDBgUhKOPqfiJNwaEha+jl1g6PeKHKpHODwriQL6UiiD8QNFDefzx?=
 =?us-ascii?Q?FJxQIAfGHKki2RD5odnw/PVCd6TTiPd4lLV2QIBBDWM0q4/K/VzSsbZy1Yqa?=
 =?us-ascii?Q?VaykWAPyN3vHbpZFNndHPEbcsSmZsQ/AGWPU1xEAg92fTE2TVVYAQTnUcjC5?=
 =?us-ascii?Q?5vc5MK1v3C/xyImY0ufPZR83F9TrM/ZUBKpsvexpSlXBU/Uf3BxXp5NJrDfy?=
 =?us-ascii?Q?BGiYebmisMkQg4FbhcwtQXYFklVh61klonxuHjv1pbwIGhSpWE6/DNMY20XN?=
 =?us-ascii?Q?ibGi+eV2khUmDGxz+r2LdgzBarSj5rd8SKeUA12uP8umt3wX2th+IqXd2r6g?=
 =?us-ascii?Q?AwI0OOqmQhAKhxtmXWtig9m2VP/6owj2dvkKuYs4osaNfIEanFSZwaYEj84g?=
 =?us-ascii?Q?+CuLe/c10HeeXo5iEeQel3P+L8pyvOFgb9uBWbd+OMC4iFjun45a1FBqiWys?=
 =?us-ascii?Q?l78j2LalOGs/riFgd0bP+UWpBg91S5iqCmJd581E9ALpPj35ou5wYIX2acx+?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33042705-8c4b-4ece-059e-08db8dfd3d26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:24:59.8459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb+9yNm2iazUpGFShgp2iGxe4wuT4tYazA6f4m59Uqv3QqzjdtvJ8r/2qIr48YnSK2htT4NaJ396LvU6xbNd/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On Wed, Jul 26, 2023 at 12:38:53PM +0100, Matthew Auld wrote:
> On 25/07/2023 21:17, Rodrigo Vivi wrote:
> > We cannot have spin locks around xe_irq_reset, since it will
> > call the intel_display_power_is_enabled() function, and
> > that needs a mutex lock. Hence causing the undesired
> > "[ BUG: Invalid wait context ]"
> > 
> > We cannot convert i915's power domain lock to spin lock
> > due to the nested dependency of non-atomic context waits.
> > 
> > So, let's move the xe_irq_reset functions from the
> > critical area, while still ensuring that we are protecting
> > the irq.enabled and ensuring the right serialization
> > in the irq handlers.
> > 
> > v2: On the first version, I had missed the fact that
> > irq.enabled is checked on the xe/display glue layer,
> > and that i915 display code is actually using the irq
> > spin lock properly. So, this got changed to a version
> > suggested by Matthew Auld, along with introducing
> > the lockdep_assert_held at the display glue code.
> >

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/463

> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/display/ext/i915_irq.c |  1 +
> >   drivers/gpu/drm/xe/xe_irq.c               | 32 ++++++++++++++++++-----
> >   2 files changed, 27 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> > index fbb0e99143f6..ac435f7f854b 100644
> > --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> > +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> > @@ -107,6 +107,7 @@ void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
> >   bool intel_irqs_enabled(struct xe_device *xe)
> >   {
> > +	lockdep_assert_held(&xe->irq.lock);
> >   	return xe->irq.enabled;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index eae190cb0969..d6b001f6a3c5 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -309,6 +309,13 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
> >   	unsigned long intr_dw[2];
> >   	u32 identity[32];
> > +	spin_lock_irq(&xe->irq.lock);
> > +	if (!xe->irq.enabled) {
> > +		spin_unlock_irq(&xe->irq.lock);
> > +		return IRQ_NONE;
> > +	}
> > +	spin_unlock_irq(&xe->irq.lock);
> 
> I guess spin_lock() or spin_lock_irq_save() here and below, since this is
> inside hard irq?

I had considered saving and restoring the flags, but exactly because we are
inside it and we sync before disabling, we don't have the risk of blindly
re-enable with the spin_unlock_irq(), no? or what could I be missing on
that way?

But well, maybe the spin_lock() and spin_unlock() are the right one?

I'm doing some experiments here.... so far with the flags I'm getting
some strange warnings...

> 
> > +
> >   	master_ctl = xelp_intr_disable(xe);
> >   	if (!master_ctl) {
> >   		xelp_intr_enable(xe, false);
> > @@ -371,6 +378,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >   	/* TODO: This really shouldn't be copied+pasted */
> > +	spin_lock_irq(&xe->irq.lock);
> > +	if (!xe->irq.enabled) {
> > +		spin_unlock_irq(&xe->irq.lock);
> > +		return IRQ_NONE;
> > +	}
> > +	spin_unlock_irq(&xe->irq.lock);
> > +
> >   	master_tile_ctl = dg1_intr_disable(xe);
> >   	if (!master_tile_ctl) {
> >   		dg1_intr_enable(xe, false);
> > @@ -574,10 +588,14 @@ void xe_irq_shutdown(struct xe_device *xe)
> >   void xe_irq_suspend(struct xe_device *xe)
> >   {
> > +	int irq = to_pci_dev(xe->drm.dev)->irq;
> > +
> >   	spin_lock_irq(&xe->irq.lock);
> > -	xe->irq.enabled = false;
> > -	xe_irq_reset(xe);
> > +	xe->irq.enabled = false; /* no new irqs */
> >   	spin_unlock_irq(&xe->irq.lock);
> > +
> > +	synchronize_irq(irq); /* flush irqs */
> > +	xe_irq_reset(xe); /* turn irqs off */
> >   }
> >   void xe_irq_resume(struct xe_device *xe)
> > @@ -585,13 +603,15 @@ void xe_irq_resume(struct xe_device *xe)
> >   	struct xe_gt *gt;
> >   	int id;
> > -	spin_lock_irq(&xe->irq.lock);
> > +	/*
> > +	 * lock not needed:
> > +	 * 1. no irq will arrive before the postinstall
> > +	 * 2. display is not yet resumed
> > +	 */
> >   	xe->irq.enabled = true;
> >   	xe_irq_reset(xe);
> > -	xe_irq_postinstall(xe);
> > +	xe_irq_postinstall(xe); /* turn irqs on */
> >   	for_each_gt(gt, xe, id)
> >   		xe_irq_enable_hwe(gt);
> > -
> > -	spin_unlock_irq(&xe->irq.lock);
> >   }
