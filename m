Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504A4C636D7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 21:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2110E188;
	Tue, 21 Feb 2023 21:39:55 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856EE10E188
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 21:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677015592; x=1708551592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pewMGVLij5PqVHu+ihBHgqNojBwq8bANCeI/uOUU9SY=;
 b=TQmT9dLG1cWcwNiWT0UrDkd5NbiAzqu90UU/HDkBrSpLk8d5r5AkNyQi
 KiFdbdEiy2Fckatg8aD/y2UxzO3A1tqDGQTclPjARF1nlPghPlzzDT+Gr
 tLwwtyzfpx9gSpJRBbQVWxkO0MILPKaitFilVAyaT6MfpLfO1kVd8kmHb
 i620weg6EZCt/p/FV42CqfyUP4W6uBC57bIDTa+iJN09CG2bQk6KS3ekj
 Q77k67kuwyZcOHC9NeLylEPXhKf1Nx/bAm2F0zQqWL0er3jAbSBuBSu8p
 0Ov9qJhZrp4nLagUv906n5Spz+QtJ4qdRFvOBDmxKBEOE/5fCv5sJSwc5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334122293"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="334122293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 13:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649326583"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="649326583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 13:39:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:39:51 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:39:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 13:39:50 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 13:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwbSqEBA8YJLGC0UKWRgN4ubvJIVm7KSWyjBMOQxO3+ZFdxf3aqSWKKh9Hiia3Iv3fs2yWPThnyclwMh+e2dIY0vet5xUPHsnf0blMqpBi62ro1SujV8jJGFpvzAVIlVir8kzOzbJ8s2nCaYW4px3R1v/yNu4XGOBxoDaxewbz0EzFzIWL7CDYsZd+1BM41pDfbBp4bKRvTHYGIen9+OARqSmY735HjsH4DjWkv32WRATVy3Gin1it3epthmVMaTfaMSHmFXVf0Xf3YgsNU5Xo7euD1a7Ijl3kJB4g+N2Y2eT9eb59NIXqByb1wwKWCFH+2WMcICuGF5PyanXPLUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLRzlwERmO2K9Sa6dwIOzc3SVpdAQ4S4Sikz+gKg6Ug=;
 b=N/iXFdcr9FOQEWODZd/3wlEbIRHQCbBp/nbSWbpYfVNDoAn+7fQZF4/RfvW6Km5yDENdoVemfpKMUj1+aaoYgJCqUz3nugpMc82F0TpcolLLaglWU3mTxpTqwyKmZ1XuJS0K6nfr9JlmrZ2QaLDqPa9UXUgGfDy/ELf17WKMzB7x0N4jvVq8Ldi2STfgTRPYPYO9JuqiBr8PyOSWipAbEJmQ/YqwbA4gmhDpAi6Ju1eI/Jtz24iOcOU4w2YV4O5zu1ErQQi7rFapRc+tKgAj3iy83PZWAW0iHTojgfq4YGT9MGuabrSdfpbrRjdHAjE5CPsXaRG9GC/YbcEut6DRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 21:39:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 21:39:48 +0000
Date: Tue, 21 Feb 2023 16:39:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/U6IKUQxF8AXCox@intel.com>
References: <20230221145221.105361-1-matthew.auld@intel.com>
 <20230221211649.novuq4b7ur2qlrs3@ldmartin-desk2.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230221211649.novuq4b7ur2qlrs3@ldmartin-desk2.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: c589510f-d18d-46a6-629c-08db145427bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZIPEjtoe1cBdVuHMK9FJ++IpkV37Nn/lU3VFxM1xwo5ivFVBPEtWUbAuw1mirT/zZrBaXLYxdELkv3PTb2nSWjDa4wO7TkBxHrz18cWVM0ax8K2+bcUhxjn+rVt9RTH+jvyW05V0pwos9MOWWWgHKoZxlGAwWZAcrvA8V3nyMuHGbbwpof9xlMZCnZw1nxO2awkLecPF6UbOqYC+DBmzFTyDiP37CUgIRfdZoGmDCGIuHRu1Vtgv8jrtQnjxJdPvZUzwrmZKSjEmSTgcSmZhgi07uh7JiN/4i68wZGfkBKeIdQ+GbobwukqlNUSndWjOSG0fG4synOLrJQMhjTXy/PSRXe/rxJUtWU3hX+FkrXfQFXALvJ3IkbwXHJdKkwF7os367b3ze8B5M0X+8cnwgrHD12Tsfzr63gqH4SAJUYxr8pT12gUB8+mX4ItnKzjHj4P44unPoK8aICBkUYu8CjNlp09hGiXpjhyiGI0a84LF54b9LeYr233uhbGWtxUnx43J7G5JX7BlqwHjZ2Fp+fnQP9ycH0/RZtoPcpgYAThubNfH1ChGN6LJ5bFWBTUULiXQs85mh7zUeyspHPAMTKh9DBimePvrmX5exHFugW9WjUUa4BSRBy99XB1KwNmd6fGeBaRLSjeV2X9A/8vvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199018)(38100700002)(6862004)(41300700001)(6666004)(66946007)(4326008)(8676002)(8936002)(66556008)(66476007)(6506007)(478600001)(966005)(6486002)(6636002)(37006003)(83380400001)(2906002)(316002)(36756003)(86362001)(186003)(6512007)(5660300002)(26005)(44832011)(2616005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0uUVn8UM9o2F/krQIOUQxg3V5msnUFQqCEXsuw/BTTnihqlrd4SEG+x7sRTM?=
 =?us-ascii?Q?EJamc3X8OSetjEeY/+/OUm8Rl4LXpDwA7K5IenLO1mLnggEwV3L7OEdOfxg6?=
 =?us-ascii?Q?ZosS20oEt9up46eP/zRmBc3GR0jFk9PqEYjCOh+A2mL4kWM7ysK12HHiNNoN?=
 =?us-ascii?Q?2OGL8OtW4VDgnBK4z9OEn8TvfDOl7JXyDCDVYX9XFrwi0w938rhhO6kXWNtf?=
 =?us-ascii?Q?UkNLBux84cg8OEBg1CMZLt/y85Y29VQ2ikyURv8xWcpbJCnFxiQ7wvdvKCAW?=
 =?us-ascii?Q?1Y8k3TSJZOSKk5dnGHtjV7sAW1nfsOAL1ZOPNHkstVIWysKzrTpQYMzj07Xp?=
 =?us-ascii?Q?KblFaVzNx5sdrv9dJ4LndMUf12JfR0L6aFwHHGcQx/fswwGgW1wS4QRDdox4?=
 =?us-ascii?Q?CYDRX89/LUm5RukP8enArg91YeyPfgw1JR/LQwluXIrRoTqpCrZahIUbRoVL?=
 =?us-ascii?Q?YJSEnwG12Dh3hIKzHtKXVIMfgF1/0/yoLlnx3a7J8Os1R1fVKapG59mnOkSk?=
 =?us-ascii?Q?O/9UJQu4P1mqn29h7dmKlBNTVYKAvu4qHHvqyo/bGBfgilOKRzh11LoJAESt?=
 =?us-ascii?Q?+VsSany0GKL9p4Uk+bUXMhdckYB9QwhRmdxCWXVMTPXTLm2+uPQkWiMRfCDh?=
 =?us-ascii?Q?lxuQW+7Dsw/z2S+Cu/KeEO4nus2FhjGxv9LOQ5e045GsBWxkHm87ut9Vm412?=
 =?us-ascii?Q?n6otTjmOFGzR5jBRxhQ4ZLKOj/ypo2+pqcJM4Sx5grJxpawgSx3kScw1w3y9?=
 =?us-ascii?Q?6T5y2HQZtZ4BEgq8ea54Hnxrv6/SRk1nTElLdlvyeLUoiYhnYJUCbW4adrY4?=
 =?us-ascii?Q?8ziDbw8V5xTnNGAmoJLIzMQ3E4U37F4jx88eW4o+n5dV9xtoHykJZwa15I4n?=
 =?us-ascii?Q?bwnOTNdGWQek1bRDRcWEIT0Wk1oWZ9+DtNLpAX/jiHFomZ8MdQMLaRoY6dMM?=
 =?us-ascii?Q?g6LM185tubN0BhoabuHW1MTAE3kHco925UcqNanIKBKZhWl8kBJGQAXJK8Np?=
 =?us-ascii?Q?L9Nv7L+D35fe30m/s3NMA36h1BZHsCM+dNpHSHAMPu9gE7KptCSoVVQSAquL?=
 =?us-ascii?Q?RebEjKl+M0/3Mtcs+Q+pMqfZhgiaYasStYHXBhqEBWp6yqih1i7JQQYbETEO?=
 =?us-ascii?Q?C6JiUGqoVleo2DQ0YfgYctk7b2m378RHhF9XjPCPILVoQt72tc44Wqtf/6E3?=
 =?us-ascii?Q?Cu+d3cZ8XhUAa8LKLfZeLDJk6NREIrbxzBS79x+CkeBoRcsS4X/htGXAjX62?=
 =?us-ascii?Q?yRNugoWk5Z94FEpk60uU8k3TFfM4MziBKCwO9/p5AY9iKXTMGdV0EKKPQQ6M?=
 =?us-ascii?Q?/BE77VlpV3xKF2qzWPyL3r9319jJ5Qe+ma+52ySmHMsqqdDE49juvMp3JVAb?=
 =?us-ascii?Q?P7GLN/kRfJBhEiYIre+H9NzVsJ4/hNRlrLaZanzx58vGIZbRDk2CPDCtTRxf?=
 =?us-ascii?Q?B8947QNLPv39CVDGlGo1SWKGE7Laeb8emQGxXdRwwRqAUqbRZekBa++iMj/f?=
 =?us-ascii?Q?hhQu7mUHUYTH92h9DOaq0V5+0TBDnWb07DBDPCHRHTpsTejaKe2erIaELbvS?=
 =?us-ascii?Q?rP7xY/57thTxzN2eyjLpHqADC+a2uTWga+pZhRamQWysiIrCMHaqAS/qg9Oy?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c589510f-d18d-46a6-629c-08db145427bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:39:48.3116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAmWNgCVN0ih7S0f2RiTzS2sbYLys0sK3W3GNq14oGDU2pQoT/sJGEPdlClkz6E2p87njU7rsluW2FiVXJfcmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: give the core kernel its rpm ref
 back
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 01:16:49PM -0800, Lucas De Marchi wrote:
> On Tue, Feb 21, 2023 at 02:52:21PM +0000, Matthew Auld wrote:
> > In local_pci_probe() the core kernel increments the rpm for the device,
> > just before calling into the probe hook. If the driver/device supports
> > runtime pm it is then meant to drop this ref during probe (like we do in
> 
> s/drop/put/ to be consistent with the terminology?

yeap, put is better...

> 
> > xe_pm_runtime_init()). However when removing the device we then also need
> > to give the reference back, otherwise the ref that is dropped in
> 
> give? we are calling pm_runtime_get_sync(), which  would be "take".

and get here...

> 
> > pci_device_remove() will be unbalanced when for example unloading the
> > driver, leading to warnings like:
> > 
> >    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!
> > 
> > Fix this by incrementing the rpm ref when removing the device.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193

Thank you!

> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pci.c | 1 +
> > drivers/gpu/drm/xe/xe_pm.c  | 7 +++++++
> > drivers/gpu/drm/xe/xe_pm.h  | 1 +
> > 3 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 25598de3a1fc..85d337cd8fbe 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > 		return;
> > 
> > 	xe_device_remove(xe);
> > +	xe_pm_runtime_fini(xe);
> 
> after xe_device_remove()? Wouldn't that end up calling the last
> drm_dev_put() and thus triggering all the drmm_* releases?
> 
> Lucas De Marchi
> 
> > 	pci_set_drvdata(pdev, NULL);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 44c38e670587..73d81621d960 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -128,6 +128,13 @@ void xe_pm_runtime_init(struct xe_device *xe)
> > 	pm_runtime_put_autosuspend(dev);
> > }
> > 
> > +void xe_pm_runtime_fini(struct xe_device *xe)
> > +{
> > +	struct device *dev = xe->drm.dev;
> > +
> > +	pm_runtime_get_sync(dev);

please also add:
pm_runtime_forbid(dev);

then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> > +}
> > +
> > int xe_pm_runtime_suspend(struct xe_device *xe)
> > {
> > 	struct xe_gt *gt;
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index b8c5f9558e26..6a885585f653 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
> > int xe_pm_resume(struct xe_device *xe);
> > 
> > void xe_pm_runtime_init(struct xe_device *xe);
> > +void xe_pm_runtime_fini(struct xe_device *xe);
> > int xe_pm_runtime_suspend(struct xe_device *xe);
> > int xe_pm_runtime_resume(struct xe_device *xe);
> > int xe_pm_runtime_get(struct xe_device *xe);
> > -- 
> > 2.39.1
> > 
