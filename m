Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6399AC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 21:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E31110E365;
	Tue, 21 Mar 2023 21:16:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6C410E365
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679433393; x=1710969393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WpvycfP2BYHcBnL1p8ENxuI1f7/Hq2vp0qGDHwkX8ng=;
 b=OWUgFUZ1ErnxjFUBUTANs8JoxwgCboZ4foO5vDOjoS/heXst51m8NsK7
 WFea9VV+E5VTq5Uqu74+0UBaoVD42Qb6+8E5tct5uQmbdb3eL1PebyV6i
 hJK/03uq0V+W+Tta7EojQ+xxKmB9gohdw4Y0zb0fm67nGX1h7+LLh1Dpg
 6XhChxUqJ+w6kjV5H85IOwk6l8zh81lBrclkGLfD1PxX9J6fQdjXOt/GZ
 UWMZzms9aq/nLG3izKLVYhnj1mub47rwX8F75PqjdIOHr+8kbuh0T9lQG
 x0BqVLnCSb7YCeZZk8gqM2fuEPg7uXMxvDC/lC93Ba1jJhUvJJpcHIcYy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339101269"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339101269"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 14:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="805569384"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="805569384"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2023 14:16:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:16:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 14:16:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 14:16:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 14:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGODEOnls7wST+ui1F5ooynrzI5bd18R9sYDS1ITVyiBHMNBXqdifhBCHEs1YXBDC05THzYc8ZPn2z52+Z3MD8wR7/1wZb5qmbABALF88e5WRUE9YXkTDbYJOCL2z7bEtTovB/R+3Pt3xybZURg5JOum7v9YzShNv55LGgxE7IawiBqIbGm3cA4bMX7jkk53m/QFKrd+ir5Sjz6LwfRTcvYsNQMAMIq9VFFjJAfdvXHXW+mDy1A7LZF2Z+/I68R56qs3PhxxtyTuvxEUc2pRqh35Ji9LoefsQc4sSo5+gpqZvCXg2Z1ifxON6E3iYY35ZxwrrSD9RYD0k5+du5XZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKYDA/8um2DIuWlUKGF8RJmr219Ms+Vbqs1oVEBVcQ8=;
 b=F8yDyIhoB/r+/XOJ6jRqolpFFVy61gPaD5FJWA+8HXH7NdaUPfwFGOc6OIcWroy/xIBOj7XxBVPcLwy/jXvbyzHY4IXmTFq6Bp/jPp1hxR486dxKOudzHIHa1tk40wGsG8lcK7aJJLnozU1WNcumH2H8Saelinh2fkTLnyYt8hNw4T4CPSTNK3Yy6ISl36AoGQNiiPK3cEj/cO05OXBdcgw8imQpxNLvx4u/rwiGBGLhMZ2N9Cp1YmLeussH5e8DkMZV8zSv/aKiRYi0aaPAjL8YHYLHgEJKcYKd41FwRnnYbAA6EJ4HHayBpUwewmMJMGc0aEMhL5/Cz36DAQYK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:16:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:16:28 +0000
Date: Tue, 21 Mar 2023 17:16:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZBoepzf/llmw16rr@intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <ZBnBiLcpjSOhgbXM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZBnBiLcpjSOhgbXM@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 133ac2f5-6835-4c5e-9d5b-08db2a5188e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cc4RvDBoY745Vy2cZGFgR5gU15JBbZi9TDKzJYHWctASOYhMQwEKPOjQB8P8pqeXGQAqpXQBHAaE4EaX0CbTgxyO3sf23J0n5NdVH3jqJF4dUK/4H4eQcp48Ae4tlISQyvUHwkTWCbXHlEL8+3i7GRHCsGjY0/xtNgw8/oOAIAz8L9eTopQXtyDPJxvUDK4bToygjbRVM/ukZK9ukRsGthBi/RDnJX0T3xq1vDpX2CA4xLw2BicPVPbcxIVUMX7rj/ZfxJ+K6zY5woG879oSjqRLNk0Ke/g7C5+yIG0eosm3xKRXGqjSdxyTl70Olm4Hfj6pdv5A4sENnTD2bTaaGNjYY34dzhxNjs3e7mLAme1zvHsyG6vnLrmsfgcfqhVrr83GvRZ/NZURi/83C0jbVXZCuGexqQAm0IwuB/zA/gAwzjemTfMR6ImdHw2/VI+qh9FuBHJuhunxctEkuZ1HnJO5MU/1jmFGFzSlwDnPmdReTvUDr8ZTM/3x5eeU2j959awxGtJLNyaPh2cJgyGATIHfHo49NcL5CKsV4sWBdR6bacyXCS/H3bR0a6H3bc39E9TeEjuvvFCom+lxjCsB2SHvdfPOZLiZ7wjpk6z1vt5KhXQr+MIqsoGdvLjCgZVjmQcxc05K61hsQXBSwKIdtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(2616005)(41300700001)(6512007)(186003)(6486002)(4326008)(83380400001)(6666004)(478600001)(8676002)(316002)(37006003)(6636002)(66556008)(66946007)(66476007)(26005)(6506007)(6862004)(44832011)(8936002)(5660300002)(38100700002)(2906002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxkNnrFSj2YVl01MRFEqMnNBG4YWRB7gj5dCmgqju24YmUd2BCyVd6JJs+ja?=
 =?us-ascii?Q?uJdrkn9LAUcIS6ZJJlWwD7tYRIlr9SvlBtntHJGX+b8Pi5XAyXWOtUxG2mmB?=
 =?us-ascii?Q?yz93KP7GhWAwtmslLtTceUdIDAbvosbh4iJoWBIePFg5fOlax/LprQ2oF4OU?=
 =?us-ascii?Q?GaFxAzIQi/LdLWFOFN8ZGmLHIu4VGg9u21UrYTOdLNbptGMyab+0+O1XVyqL?=
 =?us-ascii?Q?XFguodwcCKdbdftHkjWZzlPI8zCzv8D6gWow5gXVruzkV9cZaABIRR8HSouC?=
 =?us-ascii?Q?ARlwr6Emo1q+bVfhaDc6fyBUUsd3oF96yYbStH93C6B4bgOiMP188x6S6mBl?=
 =?us-ascii?Q?2XLz4FovqNb+Z4qiCMZLDVkhxdIEsx1SG2AVCIy+D0liGzx5+tJOlkfLy37X?=
 =?us-ascii?Q?judPiLQwh/Rth5h7DUp6Z+w/c2DpNlhcs+TFfYD4zkFTt8ILirEfm0e/E6rZ?=
 =?us-ascii?Q?TRF2B3XsTJRznpwFnI36YxHLi5vMQK8J0jkm+/8UQRBCzgYKC6M56r5iFnz6?=
 =?us-ascii?Q?L2f0s5XHttNnd1llsS3/3ukxgLlio4Mn/50kTHzzRZ2ibK3GTBqtI4Y4Jtk3?=
 =?us-ascii?Q?2C0zd2gJ8OSxGFFJoINpnM4fsEWHYR6BznR6X1hrknszlTvBGaGeYux4CUPE?=
 =?us-ascii?Q?havF1grUzW0lovt6EBRwShY13Vq+hFE8LljDckV1ClCFGQu6i21OTXoKi1wF?=
 =?us-ascii?Q?1fDT18fSkD48dByQbpY4HBZUGZV3BIKcviWxoqjiUg7C8MGyyW24CMyC8MKp?=
 =?us-ascii?Q?z2DqRrcMTRIAl6D+ejqa0dpkAu2iEnZQ0w9VLovK693iN3UXXQq3TT5XPV04?=
 =?us-ascii?Q?cj2St/3sFGyzAmY8g7kItBB9nxuahx284D9RX5gEpl2me2We0ITAXHzN8A90?=
 =?us-ascii?Q?ckpXBIvlK7+Ww29qDwHwFGiizvmG/gLr1hspU/xgiT/8EAyiVV7vL8yBw32j?=
 =?us-ascii?Q?XCHVrHpHnLpf3UaWh1gQaC8ccicmxoo7utCYXeN+H6NVz1sOeFYrQxF/2toO?=
 =?us-ascii?Q?Xe7MgysdL5PC6SIUjjAX8GLVHTCeB1TBiSB7SJsp8jRg3A8q2D52jfqKKfZV?=
 =?us-ascii?Q?anKkEysAvXAJv09uDNNhatImG4RIAsMsiDMHLBAKVixjIUGRoMss547/rAV5?=
 =?us-ascii?Q?iCy7hhThwtVR4jeJctkG2KSRM491ElDiwh4XczjGJpB15vEUuM/u5aKERLJg?=
 =?us-ascii?Q?j6TRYJRB+oExE2DCHyHprmI2rfHx+20mwYBVO0xKSbDZtrfK897eDnc342DO?=
 =?us-ascii?Q?LUr42kRJaeUTo3+whE348a0ghpUbrb7meK/JcKBwGTklricMKg5pBsx8iE6Y?=
 =?us-ascii?Q?TD1wzpHb10icjmQhcXksqE0Ik6Dqj9bm+4hf6+deNdVC5Hs+e01jwU6TXZGc?=
 =?us-ascii?Q?j0Zju03M7xbtAjhxgnP8K7pGP1MRNzV0ShMyBWcjP9ekeWYS4vD0v/BkBM+/?=
 =?us-ascii?Q?K/3SxtW1oSw0zGfLtqZ/7dFku81ibEsYcLNdpG7UBB9lBJoDUV/r0VMcXxps?=
 =?us-ascii?Q?C0gqw4vNqAYSPLn03nYHorCxD63Pj6Mwzab08hnbxF6h3iPmkxOxhRp5HIbS?=
 =?us-ascii?Q?FL+W9HMPrgEyoJGliGRS080c8OAAFadzR/uBho0jKocbpjLSE3hhHH7Zr64+?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 133ac2f5-6835-4c5e-9d5b-08db2a5188e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:16:28.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3OGJarUXKaPpZYMIuwQJ93/TsJpKNrn4c6rUp5ZFYIBQmRttTMZQt3rpwol8fJ6Ao5WYjqsvS8dRoC3OCXhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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

On Tue, Mar 21, 2023 at 02:39:04PM +0000, Matthew Brost wrote:
> On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
> > xe_guc_ct_fast_path() is called from an irq context, and cannot lock
> > the mutex used by xe_device_mem_access_ongoing().
> > 
> > Fortunately it is easy to fix, and the atomic guarantees are good enough
> > to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
> > 
> > As far as I can tell, the runtime ref in device access should be
> > killable, but don't dare to do it yet.
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
so we can unblock PVC.

but we might re-thing the mem_access in general and consider
some serialization like 'foo_' example at Documentation/power/runtime_pm.txt

> 
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
> >  drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
> >  drivers/gpu/drm/xe/xe_device_types.h |  4 +---
> >  3 files changed, 13 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4eb6786b11f0..ab179b1e24c1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  	if (err)
> >  		goto err;
> >  
> > -	mutex_init(&xe->mem_access.lock);
> >  	return xe;
> >  
> >  err_put:
> > @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> >  void xe_device_mem_access_get(struct xe_device *xe)
> >  {
> >  	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> > +	int ref = atomic_inc_return(&xe->mem_access.ref);
> >  
> > -	mutex_lock(&xe->mem_access.lock);
> > -	if (xe->mem_access.ref++ == 0)
> > +	if (ref == 1)
> >  		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> > -	mutex_unlock(&xe->mem_access.lock);
> >  
> >  	/* The usage counter increased if device was immediately resumed */
> >  	if (resumed)
> >  		xe_pm_runtime_put(xe);
> >  
> > -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
> > +	XE_WARN_ON(ref == S32_MAX);
> >  }
> >  
> >  void xe_device_mem_access_put(struct xe_device *xe)
> >  {
> > -	mutex_lock(&xe->mem_access.lock);
> > -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
> > +	bool hold = xe->mem_access.hold_rpm;
> > +	int ref = atomic_dec_return(&xe->mem_access.ref);
> > +
> > +	if (!ref && hold)
> >  		xe_pm_runtime_put(xe);
> > -	mutex_unlock(&xe->mem_access.lock);
> >  
> > -	XE_WARN_ON(xe->mem_access.ref < 0);
> > +	XE_WARN_ON(ref < 0);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 263620953c3b..96b4f3d7969e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> >  void xe_device_mem_access_get(struct xe_device *xe);
> >  void xe_device_mem_access_put(struct xe_device *xe);
> >  
> > -static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> >  {
> > -	XE_WARN_ON(!xe->mem_access.ref);
> > +	return atomic_read(&xe->mem_access.ref);
> >  }
> >  
> > -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > +static inline void xe_device_assert_mem_access(struct xe_device *xe)
> >  {
> > -	bool ret;
> > -
> > -	mutex_lock(&xe->mem_access.lock);
> > -	ret = xe->mem_access.ref;
> > -	mutex_unlock(&xe->mem_access.lock);
> > -
> > -	return ret;
> > +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> >  }
> >  
> >  static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 9743987fc883..0b8c4ee0ad48 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -230,10 +230,8 @@ struct xe_device {
> >  	 * triggering additional actions when they occur.
> >  	 */
> >  	struct {
> > -		/** @lock: protect the ref count */
> > -		struct mutex lock;
> >  		/** @ref: ref count of memory accesses */
> > -		s32 ref;
> > +		atomic_t ref;
> >  		/** @hold_rpm: need to put rpm ref back at the end */
> >  		bool hold_rpm;
> >  	} mem_access;
> > -- 
> > 2.34.1
> > 
