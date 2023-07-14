Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D2C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 15:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B996210E8B3;
	Fri, 14 Jul 2023 15:17:13 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377DB10E8CC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689347832; x=1720883832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q8jPLUYTXDGMSMhiA3bplgEbpDx4YMjAVzZ7HREaRUI=;
 b=B6K90mCQhkJj/bNcb5FJZZUzlzKmBRzSCLvBkU6/IVisHBrjP6Yv/G+i
 OO4eVXvsXmI4EOz1WEHivl4ePRVOmcvAXbBSt2Lg40weoshoqVziOr5pt
 tNjuT/fFH7EkUny6rmvGTA0fMWts4FE7vUctjpao7xXctw/gVGJrOe8nV
 y3FECFpfNckmvdX1+Zcokxfyy/bnTR0i3bail6hrwDQJZtHnPEGcIZRrW
 YELuFGWvl5W4DQavUCAgKcsVY/5pGjCp2H2360Fr7qdHA0BAidbWwZats
 tVKrtfRGkhiBdeSw5pGeymsjbOni54m4P+OLrQ0oxqT1+HnTTA1x84BQF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345810015"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345810015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 08:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="846483552"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="846483552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 14 Jul 2023 08:17:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:17:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:17:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:17:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 08:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grn+xgkxJbSugRM5yi2sYFv7eHbXLOFZSNybQnaG8dT7RgW2o3ntAOSJ/bDTvnVCwZ3IMygAATXNL+5au8SKcTEeKQa7+wu+R4iwWMMc6dVt9oKSYfpKXeMGGVs0wcuSGOmau9XhAPhFPgf/w8sSbCZrxxyVvrkO7nibILKS3ce7YzzhAO674+PKRL1yC8rQ14WrbMqSrmntBRDWpx+u7JYQaU9YOBB978GtIKpVylvPYRdee5jLvMNNkraKhZWBYbwZZ5btBQaXlpcfBcJq1080Wxv7XmAEwbzNmare+YEgmCZx8J0SerobgrDposVtEG15cG1mS1oxvLl8ajpkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80iMVSpevGHvFPo76og5A4XlwL5o/hN/uaBGOFnrjAk=;
 b=VRbijxfBjVvwsU6/LlRVZ8ELkJXUlDAxBOp4yQ9B3PCQmy6Ntf6GaZylRO873y4/KZeAf6KX6COb4lE8o6/vgKprcbK1xBKeRwA7T+T3AFbG33jFGlWLnc1iGW2lyOJvZ/spVpc/FoT6uImj2oiMtop/kbg8ghRpU+GuwMRKOyqrrVG2eOWxyI5glASLHvkowIeOaYlC4r+88fuOSM9A/FMaZcbef0x1sqj+CoqNPeDTTa0EgDoK3j1sl9FyM7XJVVsdzq8Kck4qx8C9XE6HP8YRL/9hBfKuEx1Mc8nLgXiFEtL1v6hZczs7YVrmal6zjJ2d9IfRCM4mRp5VAHog7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:17:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 15:17:06 +0000
Date: Fri, 14 Jul 2023 11:17:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZLFm7rtPXRzrdGky@intel.com>
References: <20230714053008.1430254-1-riana.tauro@intel.com>
 <ZLFlVyosnfu8dPe3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLFlVyosnfu8dPe3@intel.com>
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2cbafd-d691-407c-f2ec-08db847d6278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFHzFXuQFLY0KW/XttsuRXNi+gVJq2Ir2nL78QWF9iONr/Xna3Lm7lfNaqk9kBcHsAFBr7ocQNN8/f3+momKwjaVXOF2i8TuxYLTq2YPoGZwJdUz6JIyiJqD2r1gCibaW7nAj7bb66QKevs3oValfRKPOmvJmFz/EGr1S0lBQPznkjwxlekfuWo4VL5WvHKEKUK/x3dcHJWIj7U0ckcIC1nkR8kPp7RPGyT+Wy/zhKzP50hLgr0oLps2H/QXk9bfjnGLnbxL3dEJZy4RYFT6eBsMAQW7MLpfdXOza/7p5lv2j3bTLtLuwx3ADXlRb8SVzyMSbndfTHf0q1KlSfW+TUZiVyr6IVunHyEMIVqCELlctzR+vQ2LFRFMQyS3+pFUN4z7EKzo6h9uQVINJyQBEECAlVIxHqFgLpXaFbawLMfewsvn/eY3MuNsCdXpDZXLMOKicm0nv2tmrbZ/thnZW3lbsAFewGldIE+L106MlJ1Eo9algxFRNhisxnJljvGSJuh9PoTfkZ5oVBDWaCVeEuLQMi91d3jYjCFhQcY5Bv5N79lmNfdkwyxlOrr6FNSLEw4EveUqhEiqQTY8WyTHyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(8936002)(8676002)(6862004)(38100700002)(478600001)(5660300002)(41300700001)(66946007)(66476007)(66556008)(316002)(4326008)(6636002)(82960400001)(37006003)(86362001)(2906002)(186003)(6506007)(26005)(2616005)(6486002)(44832011)(6666004)(15650500001)(36756003)(83380400001)(6512007)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77/eVg3NAffJeGDer8Q9dm6bI/vJhUmGh4y/p0yHw1t/qbjCcARAOyYXX6Fs?=
 =?us-ascii?Q?zeRYsr6zp6x78fCMMeDX1DEq0HvifjoTJNHpYV8xk9HwcTKzeLi0gKphREmR?=
 =?us-ascii?Q?xSo6yzzAHj/7Gl3CZf7p/FxxLSl2gBXnZv6XDLsvBDXXsp8oobY4j28im7DU?=
 =?us-ascii?Q?vZxMGyq1+raAtfnjtFsBpnTWe0yeZclCzJBQtoWCUJ3V5keR4tCeTbI3wTw/?=
 =?us-ascii?Q?dlKjplKBNdYKxLS+8ppVMBG7FbmIm5krtXtZzV/+V1EPWMaUKJNKrx/o/AqH?=
 =?us-ascii?Q?o5CVrrpmiLvigXSSfEP0DFBzPawbSzY/srzwlGVuV8F+UqO8qV205KDVssQy?=
 =?us-ascii?Q?NLswD7EMOosSbbJ3xe5YH5A6f6F0P/3pXaVA7DxKS1YElo7iLsxIu8LYpY4y?=
 =?us-ascii?Q?wta0v5kWHLvfVoe5A5IPcO5iEK+QrGyRugZgkmfJb/d9os98Or9xGUUiOqsG?=
 =?us-ascii?Q?wWCt7dqzn6AGmL//fXG0Nl/0Ty4kxEqalg1NDT851USnk8Fx7M7kl27MjHAg?=
 =?us-ascii?Q?b9Lh3TecK6JlzVCyiRcTlMVUkzgZ9fY+14bDJZ2OhyssRekRKsEMiczU4g3y?=
 =?us-ascii?Q?LhT8bi/tqgMRov+CWUEYsSF6spf3oE6ANyBUbhFKlPrCLreYxpJP+4WKvI7z?=
 =?us-ascii?Q?uJYBeSLWsbdiXho+SE0XGR2Mqv99rckvsTwASTTGxKJtsvvBrrHqMbRQjYaE?=
 =?us-ascii?Q?Np+Gob6D00+mIRMnt1/U1kwT/UAsCDU01duAv3lwqXfDHfaApHp1svBkW4ED?=
 =?us-ascii?Q?LcftssLAo/3mczF1pO+dNQASykHd4Fz1ckIRn15Ry+TeBpH1gf0yonhjQeL6?=
 =?us-ascii?Q?VRk0/hkJFqe4gopxpaeaRw26oJwc/st1iq1Ym8zXi4c671clxI+nb/ygt/0R?=
 =?us-ascii?Q?CRBgkdcc/ZcBpBMLgPiBLfHs8/LTPRt+uhxDLmR4VsmIAuZXAitMVkZvMn/8?=
 =?us-ascii?Q?gya5+3BULZ7GuF+cExIN1N73d1a++9k0jySpQsIZ7pnXVGBHBLZJy9tWrUg4?=
 =?us-ascii?Q?jHcXtWv4A8A8wLwhmJEsNfQ9KgbWhjUUKmTEN5ytEha9Eb4WWt/9dboAehIE?=
 =?us-ascii?Q?nJsiq3W2q/uSAd8NVaqhh9zHyfQiO3pHo1dZbWvIq1J+bujQl+tOmSa2z1Z0?=
 =?us-ascii?Q?7Dr91tCtSSJ/XlqrpcENm/duoo2UGgqfee1Pi/o68w3rbCRR+2aNGtFtvXFV?=
 =?us-ascii?Q?EL3uUoDypsrmfyXhicw75AhVzidINT2uqgZ+FqoJSc0FSZ6CiyfLdtU3c8Rv?=
 =?us-ascii?Q?skySPDsXnUHl5nFFUAlMRGc+d1DacGLJcFUhkEDyFheU50fg12h2lPx9WgQ7?=
 =?us-ascii?Q?rwoYWEsNNyCYBmETuVp2Ahth+Vezy7fLjPxvo1hj9UkQOtcBmZdnx2vKpeV9?=
 =?us-ascii?Q?z3iRghJfqW4K5JO5rEIF8idH7/twdyQVnQ/zZ+ppK6c1xB/NBtQb6PHIpkFH?=
 =?us-ascii?Q?y0oogBI4CJTaMqXKrDgcBbMf2FsjpTIws+JngOGTeALPYgWpxrVdVO7+yDVz?=
 =?us-ascii?Q?vE5D5XW6VJqCmJ6zO6X9Cqf+SP3qUm04FLTQu6ciGi8QspvvecyuWjI6X224?=
 =?us-ascii?Q?cNFWgzpLmFQlyh80acKg4fqKwDGoS8+k+UAqrxvXMzroYmL7gnqLZnW3GyOM?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2cbafd-d691-407c-f2ec-08db847d6278
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:17:06.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V805556042IkKAa68vZCLkkmCbdLf1lPIwWbrVILZEGMhjr6TNrtTmjXCXqujSyHV6UAFapV84G1+VXTTCNjww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: remove gucrc disable from suspend
 path
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

On Fri, Jul 14, 2023 at 11:10:15AM -0400, Rodrigo Vivi wrote:
> On Fri, Jul 14, 2023 at 11:00:08AM +0530, Riana Tauro wrote:
> > Currently GuCRC is disabled in suspend path for xe.
> > Rc6 is a prerequiste to enable s0ix and
> > should not be disabled for s2idle. There is no requirement
> > to disable GuCRC for S3+.
> > 
> > Remove it from xe_guc_pc_stop, thus removing from suspend path.
> > Retain the call in other places where xe_guc_pc_stop is
> > called.
> > 
> > v2: add description and return statement to kernel-doc (Rodrigo)
> > v3: update commit message (Rodrigo)
> 
> pushed, thanks

ops, I have removed it after I noticed that this consistently break BAT:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-120263v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-120263v3/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

> 
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c     |  1 +
> >  drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
> >  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
> >  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
> >  drivers/gpu/drm/xe/xe_uc.h     |  1 +
> >  5 files changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index a21d44bfe9e8..b31ef2a8ff17 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_msg;
> >  
> > +	xe_uc_gucrc_disable(&gt->uc);
> >  	xe_uc_stop_prepare(&gt->uc);
> >  	xe_gt_pagefault_reset(gt);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 3093cfeff0c2..9a7fae727dfa 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -730,7 +730,15 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
> >  	return ret;
> >  }
> >  
> > -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> > +/**
> > + * xe_guc_pc_gucrc_disable - Disable GuC RC
> > + * @pc: Xe_GuC_PC instance
> > + *
> > + * Disables GuC RC by taking control of RC6 back from GuC.
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> >  {
> >  	struct xe_gt *gt = pc_to_gt(pc);
> >  	int ret;
> > @@ -827,7 +835,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  		goto out;
> >  
> >  	if (xe->info.platform == XE_PVC) {
> > -		pc_gucrc_disable(pc);
> > +		xe_guc_pc_gucrc_disable(pc);
> >  		ret = 0;
> >  		goto out;
> >  	}
> > @@ -850,10 +858,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
> >  
> >  	xe_device_mem_access_get(pc_to_xe(pc));
> >  
> > -	ret = pc_gucrc_disable(pc);
> > -	if (ret)
> > -		goto out;
> > -
> >  	mutex_lock(&pc->freq_lock);
> >  	pc->freq_ready = false;
> >  	mutex_unlock(&pc->freq_lock);
> > @@ -876,6 +880,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_guc_pc *pc = arg;
> >  
> > +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> >  	XE_WARN_ON(xe_guc_pc_stop(pc));
> >  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> >  	xe_bo_unpin_map_no_vm(pc->bo);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> > index 370353a40a17..81833a53b3c9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> > @@ -11,6 +11,7 @@
> >  int xe_guc_pc_init(struct xe_guc_pc *pc);
> >  int xe_guc_pc_start(struct xe_guc_pc *pc);
> >  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> > +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
> >  
> >  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> >  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 70eabf567156..f8cbd292d6d0 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
> >  	return xe_guc_reset_prepare(&uc->guc);
> >  }
> >  
> > +void xe_uc_gucrc_disable(struct xe_uc *uc)
> > +{
> > +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> > +}
> > +
> >  void xe_uc_stop_prepare(struct xe_uc *uc)
> >  {
> >  	xe_guc_stop_prepare(&uc->guc);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index d6efc9ef00d3..42219b361df5 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
> >  int xe_uc_init_hwconfig(struct xe_uc *uc);
> >  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> >  int xe_uc_init_hw(struct xe_uc *uc);
> > +void xe_uc_gucrc_disable(struct xe_uc *uc);
> >  int xe_uc_reset_prepare(struct xe_uc *uc);
> >  void xe_uc_stop_prepare(struct xe_uc *uc);
> >  int xe_uc_stop(struct xe_uc *uc);
> > -- 
> > 2.40.0
> > 
