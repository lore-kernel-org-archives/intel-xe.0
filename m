Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4E5CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 18:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A01510E532;
	Thu, 12 Oct 2023 18:59:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130B10E532
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697137189; x=1728673189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iGwhIJMFEw8mj+plDzSexX6VqdT0OCJvF73Mmzx7O3w=;
 b=gB+30F7Tp/vHq5y0vro1Sl6BHbCcvxDlXT0PkOp5dKPjMOrUs3L1OFUk
 gPWpXr5WSgxGTJiPcizbkIauy/raZOT+yMdZTnDDfQwJkOH828mtTK2an
 FjfMbbcd3hPq/c9bliPkkq8z118WLJZoQxMTSpgIyutgycXQyV14Sr3Vn
 DW6uAvkX0z7cbFVKZQr08wV+ersy+2+FlEry+n0gWlUKAFRYzqHy9I587
 gPq0Z3ROopBt8/cg4x4mpK3Rjm9UY15y8StaP3L0Jk/QJvdDyhEFNzV//
 K4fvS5NbE+0X8hjSktLn2voVvlO+1o4Hs9qW1y+9mXS/v1SFqJRiUICmI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3605363"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3605363"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 11:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754405473"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="754405473"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 11:59:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 11:59:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 11:59:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 11:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftTNbOOCX/qC34coCm9BgLnP4C433ZpjZTlH2O0AMgwHNRiOYzdeqgjUAel9Nl3SI7VGoRETjWOfYh24jz0lwJ7RcpxItLI9OypHjnkDbszgtZDAiGbz3+fUheqOhoNrwtkvVMSDM4q1aolzdCgvHMHo4gVC0fhpCD6qgaX+aW3nc5zp1le8nShxc3Jtn6B/oIj4lulbf2y/b1suQZIEP6MKZCstOgxZsYPU2HeGMFOVQpwtEkp2UXcre1rsKbIknZ5n9J9URFv2Mdtd//RJFXODmDUblfyUBx7xooLTCZB64oSQqzbskOOnP5gpOmTdUJSo94TyyvgVU0ZPKNbp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FcDnfQUE6OfoAwczbBt2lJnpT9O/Sj3DpiDTJam4lI=;
 b=NcsCtNdnkF8Yi+IRjxY+sxxkwHIs+VN75BFvCCS7D81sWZI7atiGF44rQSzhLN5waygS5Q+9urHbVQRKkyvf3nBRV5ljUtQq79PrfZ7K9x/LINPE3f17wa/GRewkxnvSqZQdsHpubj1pI2vT8Kl61dxNsKViK1zkFYF4Arsnh7xltbHWl5T/C1nHqk0vWYnD/2bJ0Uc0O8szHVlLe8pkIb8xkKNgWm573w3ZWljw5LKvdFT33uqhWJUVPG3MC0ftTbgQ417nXbdrALPWjh4NfufjJ30NT1xKL654PrEVtorocqo6tCgDDyPnziuChRCBpK0eVYUk02bdaqQ+tEZAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 18:59:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 18:59:45 +0000
Date: Thu, 12 Oct 2023 14:59:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Message-ID: <ZShCHmEtCjXzfsiL@intel.com>
References: <20230919094737.743358-1-luciano.coelho@intel.com>
 <20230919094737.743358-2-luciano.coelho@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919094737.743358-2-luciano.coelho@intel.com>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7dc7f1-3333-4483-1415-08dbcb55664e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBFha6lp5b0oF5aO86kF6SNlIY+nv/1D9QN2Ku3FiFDbcf+NhGfrnxLIG1AjbRsBU1o9uEnMvsEJatfVL5zZoQrOgkxzAL8E/jKk6BLhvQ+OCJPBi2Rb6Q8HOQNAvJVUSugNmECVJJqVIpJmUYOTyQpPqWnEFoUpu80jFUQ6Nfbr4tvptK6gw3FG5G4wLOlQrMwavsLg3QTKPa56gvLXZ4IgUqbSbt/DvT9qCxDFpMLa9/XnqHNwwHLDGHYomczO7PxFgmuk37JSltS8wzEFW2zKMXaAQMtPAUbJtZMVT2a56YDbWXxgXdViaS0L3BYs8wyur1pPObG4QYe+RgkBKUztZZlFopaYUobBov4FyMnhFdEFRF93KRMaBWzPcXoveZ0g9VZI2paKnzP69Ub1LgqrME5mzsLP8ylpU5yu6o3Qfl0iVMm5T/dpVmEK1hgwKjqAahFl0gVqhHKG2t+seyIQRUh/ckuIbzxWWTqQDIRXfNXU2RPMgSgSPkEm27YCYw8aUMmAM3jvfVC3kQb+wILoLNDBo2lycQooiKrl8nM8t3iy+IkRnriAqUJs7mV+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82960400001)(26005)(6506007)(44832011)(6636002)(36756003)(37006003)(316002)(83380400001)(66946007)(66556008)(66476007)(38100700002)(86362001)(6512007)(2616005)(6486002)(478600001)(2906002)(6666004)(5660300002)(8936002)(4326008)(6862004)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pc9+DDcqTKVych9LheYr5q4LMmK5oJU6rPL1x5DW9I8R05y/1EQR786FW96+?=
 =?us-ascii?Q?10cjLWIAJM5TQ7G2xNzgrrtP6ctKjgrsdRWkSmPMW1hC7xOTeRE3TsXE1xvv?=
 =?us-ascii?Q?Big0QS9VY4fwmo6yAP2uK1gAbFYuhEmlwoIeriSO7NfV6px9KFOZi3Er6CvN?=
 =?us-ascii?Q?nrMC1H5qmG7hPnysQvS3xbhrDPnNlxtrr9pwKqf2xpDkomJ/inj8uEhdNBsr?=
 =?us-ascii?Q?+N99Cj4ryibMZL9lyHFEJPsFt3AJIflTB2pNjpdWcIKfmk3fGi5Ql8d8u98H?=
 =?us-ascii?Q?FaIUl8wEh+DBTqGAGX5mqbHsydrTKPNcCXWktCQwKTftPaMBSXJpwIhUD+2W?=
 =?us-ascii?Q?lEen125zTtfhFMa/ZHfg3vw0BGJcJH8mtzJLSzBhW81CibGTpMgpycyu2r82?=
 =?us-ascii?Q?ZP7cDUIr2dq5zIDRqMvGK2bQa4pEZw2kqCCbUnSY4URrhPrwW/Kd82dI4Ln0?=
 =?us-ascii?Q?wkWSZ7HHTaTl36vMZG4H8DSuSukEl/+Br7/jUS04bnaR5VDEfQiSyr5Q9+oY?=
 =?us-ascii?Q?HsvnrUlcY4lEqVkndnoRXjBuXJf84jjbUgasW87L8RW6S0UcPXlUJvd1Y1Ag?=
 =?us-ascii?Q?vYCwW/S5V4UvbMX3vXNu+30eZ+R/eGcmlcz68FEWGX3ywVUWhv61EScAp2+M?=
 =?us-ascii?Q?puTHMTnleUYZW1piBOKwHvZo9VYsDr1iiO+srRcWfRAX7X/B4jOsAL3Czg4n?=
 =?us-ascii?Q?BZ+w8cSvm+ixwleY4Prur2+3qskqznQyn8pULjMHWkDHs6xo4ao0N+bjeICs?=
 =?us-ascii?Q?IP7r+yLcJr8trlbDUod7Vq7g28TZUUSPGBgslp7QP3wpVGTjLCV1p3uOgwzO?=
 =?us-ascii?Q?nGita7XTpucOrztNOFwr8o5bYj2cSpj/51xPv3ILiEhOcZ+2+wgcJjkNm9Sq?=
 =?us-ascii?Q?3Bxee/LCdYfeAoTxudNcWHfMvTAAsp/6FDGci54sCaRcRH/tRlEXAbeQJvjr?=
 =?us-ascii?Q?kh9OAj+ZjG8r4vJ3gz1Sw/cr5+DWQHskrqVFenkadlMSOGiKFgmB3DwE7Oqc?=
 =?us-ascii?Q?gtql+rbHqeirCWzTNJXRnax9qaDA2A8WEe9qMNsyCMW6WmC5HtLdfJvqk2IY?=
 =?us-ascii?Q?wg7Ra91jnbhD6HqUes+OYc9rzHlNRmKwddl7R1c7o4M/9IPw+KbSEHR5I/oU?=
 =?us-ascii?Q?GHxqd5ER404EjEJ2RSAseket/cpGyDwjkXgSID9O3hsmFJc9wz1wty/8eiOh?=
 =?us-ascii?Q?A3PgOtXX1GdYEyC2WFsdct7/f9+MnkZm+eMWsKVftDtSJKdKElLLWMjcI703?=
 =?us-ascii?Q?beTdYW/fzVc2egiNLE9FsUotzcfA9Z1tLQzcnCn9OJcWlkzsN3zlNf0LBBRI?=
 =?us-ascii?Q?dMnAKtfbLd5asLSXzcGsfmKodHFyy7/7aZfBug72PkmEvnfEP0qDRuyrV93W?=
 =?us-ascii?Q?h+TaWSRsawHUAWfK0FIeR5GSv5oLNnPm9F9rpMQ3STO3HVV1xcRayGeP4Ug4?=
 =?us-ascii?Q?LuvPkuKszeEPtFsa+o5yN5iEl+ntYC3PajlF6HS9Otq18bnAz42S7RO+1Qij?=
 =?us-ascii?Q?I6Ma8ZBA6krCzuW6fPC8BSUHU671ZsrWvEXvMOvuKeZjpFRyoce0c/jDIXES?=
 =?us-ascii?Q?tRTU0rOxBu3WXkWVBB12Qy1sZcFEiP0toIeyMRSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7dc7f1-3333-4483-1415-08dbcb55664e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 18:59:45.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIZBvaDhtusLKvPOuypOPucsU7ybd0Pu6rHRZ1GPpA/qcRYtoSonh57Z3SQ2UO5oWBetCiZsTdLNjBgKx5sRVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915/crtc: use
 irqsave for locking event_lock"
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

On Tue, Sep 19, 2023 at 12:47:36PM +0300, Luca Coelho wrote:
> This reverts commit 0aff77c2fbd20da430763bdb25db5eaa6245650a.
> 
> The interrupts are already disabled at this point, so there's no need
> to use _irqsave()/_irqrestore() in this context.  Most other callers
> of the drm_crtc_arm_vblank_event(), outside the i915 driver, call it
> immediately after locking the spinlock with _irqsave(), or at least
> _irq(), and that may be the reason why this was added unnecessarily
> here.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 23bb3bb9c7db..182c6dd64f47 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -670,15 +670,13 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
>  					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
>  					 false);
>  	} else if (new_crtc_state->uapi.event) {
> -		unsigned long flags;
> -
>  		drm_WARN_ON(&dev_priv->drm,
>  			    drm_crtc_vblank_get(&crtc->base) != 0);
>  
> -		spin_lock_irqsave(&crtc->base.dev->event_lock, flags);
> +		spin_lock(&crtc->base.dev->event_lock);
>  		drm_crtc_arm_vblank_event(&crtc->base,
>  					  new_crtc_state->uapi.event);
> -		spin_unlock_irqrestore(&crtc->base.dev->event_lock, flags);
> +		spin_unlock(&crtc->base.dev->event_lock);
>  
>  		new_crtc_state->uapi.event = NULL;
>  	}
> -- 
> 2.39.2
> 
