Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D96AC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1C210E376;
	Tue,  5 Dec 2023 01:01:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F6010E376
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701738086; x=1733274086;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NmXaNWxMvPWaJlVu3RU9GW5POHatEsCfWTeiZAL/E3U=;
 b=OxR0QjekjsXMH513zYj/3oPbx6/mqBH9jHVyqwIleYKSkmJzMmeTlAR0
 UjYP+/urh2dLyqwQ52rfwZiRyhHi3xk1ftPgZ/qN+5S41LYpfaRgeUW6G
 PlG2STTNb754jKKJEA674zH325KAfxBF8Q+r9fYsjo/ruY1kUHItji3ge
 zdh3mY+sMW/+iXaJ6z08R/XR3KPDP7omJnVF3Rj7Nv6tCakbfd8YfxERQ
 Kgn6ND7dGCf618y0sppp6nazOJ6Ddj7W09ek/D6KD/+0SrG3dqIFUg5Cu
 ddje4XveYQcwSQJ8dH5dV7Lvo0QGFLWTm4nIX7ACSBtjIr9zPj2z0scXn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="878822"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="878822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770723354"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="770723354"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:01:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:01:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:01:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:01:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNt5OzcPZxDzCBTGcPbF1ZY861mUKWzBrfeuApZli/aQ4DSSm3hosGzFnM7xm9b/XFXl/7vLf2Kb96WiBQe10v0qRvaXq+4OxflYdMF0/H7ldcKKUwJBjGS3E6WQ9EMnbt8PX8hZN22f7RVLYMV5bPXfVG+A8cCavIz862ahZN01rcrXv8g32guLCo/v8fL84b+9iyuO8W+vR0O16aQUpcEW0txX9T/EOpuOHt7q5IAQqMn43mzztZAO7tLgEqyqx6M5H29ii3VLGLENn5J/B55HhuKKtcMyTRRHa8TMA3UOqkCOJPoVfFxPwJ6lHwvvV8Hms5P6yPvaQZm3tMTqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rf1D/USY1NmUHI1XNm2JgnI0LvX3F4IxpcmANEt1Pxs=;
 b=FDabie/grs7CIfpZax/GVYQXfEy19F06GlTAW9YHRJcaBLk3a/FLyGHcm8CwApCvOhCmUvsBwXdhn+fLmXE7oa9VwtATlQx0o//BgLZC68vxld+Q0/Wx2PeLSPtERgkjl0340EXbCcYSULhx3b4uhYNUCqeaMS759Go1S91Ezdxc6Cicio42MH0w41SxlHxq4jqYiz7mb/KQEeD6Ux82DsoGIafAC7TiHcOkCMPxbQGBpl6BFm4+ZsQw4Tlyfk4SsB1T3HT9ZY/8x66B6rtktxsAUvYbAO8CjBi8nI7ah9LVwe1KA5yfUKN46fFoNEccRuKfqpnRfMkXTrzhQAd2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.33; Tue, 5 Dec 2023 01:01:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:01:17 +0000
Date: Tue, 5 Dec 2023 02:01:15 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <dl3g3rjy7ngnknpubk3igueas3nrau7fdjsekmscutnuc6xoeg@otoyoprc237k>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
 <20231129214509.1174116-7-michal.winiarski@intel.com>
 <uuv67u4h4mrned6xsdyvyknzlau4t4faxfbn3wdqs6ect236nu@fp3263ivgjfv>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uuv67u4h4mrned6xsdyvyknzlau4t4faxfbn3wdqs6ect236nu@fp3263ivgjfv>
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: b789f5b4-520e-423e-f150-08dbf52dafaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: epQIKsymu0buw+JNsahxdNjOnqTcK9owcoawHYZxw8+FEAOnCrKt2BUBv3alyQietdAZmwseEV4D6NDNoeJHTHOOuPbEivKytNIOYBAnXUJfrWtrxOKJfnsLHgEW0KWzyQQuoogbskmFJVaPS89+K4YKYtZX3hrxQs5saJF93KSWR2e/nm427q70cEOuP4GTdS25D1fZ0P53KHTPk4GzLiFmmqpSsWkC4OVA6kbMzKVaPK+fZn64pP4nseaKw/jBofZBGWiqbM0wjRclQRmaNUk7QlzCamtEYNtiv7cM/l6Hx/HkOG31m/vXzF2srdK3vI1G8xj1Y5SSt2lVUga+YGm1yxbRwE/TcAA/Ve5xFrUMaSZO8z6wxPCDes/euFqUyPxOS85NgHoA6HtxYb45Ywxbhc6v7IQd6eQvtZK3vdk0ZcJgteqys5IP2dCj6Mz2g3GvI9MWQh3p/3s6b+Pqr2ZJ/tk9p+CNaGVMyBCY+ExzklT7eqkWAZCsfP2Vjki2V+APEe6mndA7ancz4s4AWOGRftmnQr/dmyCFqZfuMDXX/tQhdJZR2slDs3ZKOGWp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66899024)(66476007)(8936002)(86362001)(316002)(8676002)(4326008)(6636002)(6862004)(66556008)(66946007)(478600001)(6486002)(41300700001)(2906002)(5660300002)(26005)(9686003)(6506007)(6512007)(83380400001)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9GbUFIT2FYVDN4M2hTcldmSEhWdmNiUkxUWEVackFkWTQzL1JORkk1NEdN?=
 =?utf-8?B?YXQ2US9USkRrQ1ZkNzJIUWUyL2RTeUt3U2FXY0FCWDNaUzdBK1FhV1NacnZB?=
 =?utf-8?B?SU9UUkZmNlRmcVVjTytNWm9memJxdUFjQ3N3akdqNm5Va215eXljWjY1czdM?=
 =?utf-8?B?SlR6TmYzbDVraE1SOFZNY3lYSUNNUCs3cG10Qk9xdHlvRnp2TXd0WVhtNnZT?=
 =?utf-8?B?WWNieE9NQSsyNy9sRk1QaHVkcTVTckxZWTVVbEs3ME4rOW5PbXI0em45cHFL?=
 =?utf-8?B?dFBXdDc3aWNZeHRhTFIxdHdFSEJwT25FaDVzM0FDNngwN0RJV0dyalNyYnRw?=
 =?utf-8?B?UGhLbUNsTko2ODhLM2VMbmo2WEtLdEcxOC9XT25NMWRkSDRaOEgraVVHUDRR?=
 =?utf-8?B?QThXc2tTbHlhWFlKbmNQK3FYOEU0SkQzZFRiUi9uTjFiTCs0dlJMd0hndlVX?=
 =?utf-8?B?cTVubkNwOFZjZFc4ZDI5Q3RqUmNQOHAzWUg3eDZ3ODZheGl0SUhUWUoyWHRo?=
 =?utf-8?B?VHh2c1p1Vi9YTlFsSmxtaEpwTXJwY3NUS3dxOUtzU240b0o4S25vUFhWdU8r?=
 =?utf-8?B?a0RNbm9FeFZhUXBXeHZmVW9saEFQcGVlOVRpbXFhVU5zREhsa3g5Yy9hUDhj?=
 =?utf-8?B?aThDaHFWUzMxS3JQV1I1cVY4QWFrWVMyQ0swMDEweS81MnJVK00wNzJOUlU4?=
 =?utf-8?B?U0ZjdmcwY1FjSWJIQU5Hdi9tL1c2QUhlSHRPUFUzM0drNkFXcklDc2RQVjFZ?=
 =?utf-8?B?Qmt4ZnVjNGh6NERGY1Y5dFlIVmdBemVHakdjR3IxZGFSVUh5T2NmWm1FdExn?=
 =?utf-8?B?aTVCYk9PTTVTZVZaSy94RTdmd2RZY1lueFNKUHpxLyt3MlNoOE9TUU9zdG9B?=
 =?utf-8?B?M1prajlJc05wQVZaQ2tIWUxES0pIQmxJK1ZQM1VLYlpsYkhBT1N3T2hCSkl2?=
 =?utf-8?B?KzRhdnN3UGlqRVZHMmNuZWhQd1RGSEovaWRKSGNOeC9tRGp5K3p6cC9seWVu?=
 =?utf-8?B?aEFYNitHVFBvWm43ZlkyUEhsTHJPUHl5TllGY3NaR25NODhBK2cwdjdJVGZo?=
 =?utf-8?B?S0hMY1ZiUUs2UkxXbDRyRlB6RzEwZldsOUZka242UCtUWWJDZmpKaGlJdmFu?=
 =?utf-8?B?YmVWbGZrRjlpclVQbndMM0tTL1JtQnd0R3pKMTVxN0dscWJrVGpLY3Uwa1d1?=
 =?utf-8?B?blNVdHdmai9kcDNQWWZYd3RRSFB0TmM1UXVkaGxWWSs5ZW8xRjZvVXVJVkdV?=
 =?utf-8?B?Q3NwWXRYbmszdGFxdGR3Rkl2Y2I0UDZEUkRXSTNhWHBzeThmanFKQzZMS2dS?=
 =?utf-8?B?dWJpOGtNUVd0SjYvTlFYVTY3a28xY1pFam1oZmllWlAzS0orZC9lRzcxVi9s?=
 =?utf-8?B?ZGowTER1ZUxIeWRxMzFiU3NBRnlkUCt5ZW1kTnEvaUpQaTZ4aVJnM3JhNFFR?=
 =?utf-8?B?UjltNFVOSi9SaExNNzA3dW1QYTRvR3Q4WXFobHB6Vkk2Y290QkVvbnlUUlFj?=
 =?utf-8?B?RXpyR2tpMnVBenNZREFXNWRVQzNNckZhVHhGNU51YUt5eTVRYm9vNzFtTUZu?=
 =?utf-8?B?OHRIWWJaSEx2YzNDaFNNS1ZjaTNPVFhhWFVPVFNoNCtCV1NZUGVXdTJNSmFP?=
 =?utf-8?B?ODcvSFladS9RbGFUSk5OZk96cElzUXNmMFdJNDM2d1RDK1doRG9TZUJOTE9N?=
 =?utf-8?B?ditOcmtQbk14c0pzbEkzQnpWdmpscm4yekZNTDZ6c3IvWGZmdFZhZW1kRVVS?=
 =?utf-8?B?Z01PVkJXMHNKY3hvMmFnVUwzazU3S1d5a292VlZjOHZQOVh0VWRidW5KdDEy?=
 =?utf-8?B?Z3U4SFFabG04VjVjU0hOQnVpTFVrYjBHYXFmcWdZV09XUEVNSUZTaFp4Z2Fi?=
 =?utf-8?B?R2QrQ3lzV1RRTk56UWhtNGdjSmdLRmE3bHFiVnVpbU9TSlJGeVc4NVNXQVlE?=
 =?utf-8?B?MmFXRjQrc1IxK01xdW1MbXNhQ0FySHJiSGYwZzJQTnh0U0RuWmlwanhJeVBu?=
 =?utf-8?B?bEQwdE80U21kamVhZlh3dEN1cVlmMC80V1ZEWEFRMUFzMUxicjl6ZEUreVpw?=
 =?utf-8?B?OHczdFZ3aE9yMzFnckNKSkI4Sks0REUrK0h4QWZvRm8vYzQ1MDNmMHdJVG4v?=
 =?utf-8?B?MTRxM2FxRTFRd0xPU2xPQUhiQkdsZ0gvZVNVbEw4SWtOZkRKeXhuS0V5MzVE?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b789f5b4-520e-423e-f150-08dbf52dafaf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:01:17.5093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PixI7JzO7Co3XP7DX00B9QUZV8RPiJXzFtM3OGurxYSrGhMUnHhOz0d3oMI3xNSPdk+vP1SGPqAAJp/NXSl9kBMNE4PLvSnMOv9S9hOccBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 07/14] drm/xe: Split xe_info_init
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

On Thu, Nov 30, 2023 at 11:46:08AM -0600, Lucas De Marchi wrote:
> On Wed, Nov 29, 2023 at 10:45:02PM +0100, Michał Winiarski wrote:
> > Parts of xe_info_init are only dealing with processing driver_data.
> > Extract it into xe_info_init_early to be able to use it earlier during
> > probe.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> > drivers/gpu/drm/xe/xe_pci.c       | 44 ++++++++++++++++++++++---------
> > 2 files changed, 32 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> > index 306ff8cb35cb1..f2cdc9bb4612a 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> > @@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> > 		return -ENODEV;
> > 
> > done:
> > +	xe_info_init_early(xe, desc, subplatform_desc);
> > 	xe_info_init(xe, desc, subplatform_desc);
> > 
> > 	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 074ed456eba6d..e5f1fefcee120 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -535,6 +535,35 @@ static void handle_gmdid(struct xe_device *xe,
> > 	}
> > }
> > 
> > +/*
> > + * Initialize device info content that only depends on static driver_data passed to the driver at
> > + * probe time from PCI ID table.
> 
> The preference code width is still 80 cols, even if we don't warn if it
> goes to 100 since some times it's better to keep it in one line rather
> than split, which is not the case for comments/documentation like this.
> Everywhere in this file has comments up to 80, so it becomes
> inconsistent if we keep it like this.

I'll change it here as well as in the following patches.

> 
> > + */
> > +static void xe_info_init_early(struct xe_device *xe,
> > +			       const struct xe_device_desc *desc,
> > +			       const struct xe_subplatform_desc *subplatform_desc)
> > +{
> > +	xe->info.platform = desc->platform;
> > +	xe->info.subplatform = subplatform_desc ?
> > +		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > +
> > +	xe->info.is_dgfx = desc->is_dgfx;
> > +	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> > +	xe->info.has_llc = desc->has_llc;
> > +	xe->info.has_sriov = desc->has_sriov;
> > +	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> > +	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> > +
> > +	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > +				  xe_modparam.enable_display &&
> > +				  desc->has_display;
> > +}
> > +
> > +/*
> > + * Initialize device info content that does require knowledge about graphics / media IP version.
> > + * Make sure that GT / tile structures allocated by the driver match the data present in device
> > + * info.
> > + */
> > static int xe_info_init(struct xe_device *xe,
> > 			const struct xe_device_desc *desc,
> > 			const struct xe_subplatform_desc *subplatform_desc)
> > @@ -546,10 +575,6 @@ static int xe_info_init(struct xe_device *xe,
> > 	struct xe_gt *gt;
> > 	u8 id;
> > 
> > -	xe->info.platform = desc->platform;
> > -	xe->info.subplatform = subplatform_desc ?
> > -		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > -
> > 	/*
> > 	 * If this platform supports GMD_ID, we'll detect the proper IP
> > 	 * descriptor to use from hardware registers. desc->graphics will only
> > @@ -575,14 +600,8 @@ static int xe_info_init(struct xe_device *xe,
> > 	if (!graphics_desc)
> > 		return -ENODEV;
> > 
> > -	xe->info.is_dgfx = desc->is_dgfx;
> > -	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> > 	xe->info.graphics_name = graphics_desc->name;
> > 	xe->info.media_name = media_desc ? media_desc->name : "none";
> > -	xe->info.has_llc = desc->has_llc;
> > -	xe->info.has_sriov = desc->has_sriov;
> > -	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> 
> now we have a conflict since this got renamed to skip and there's a new
> skip. I fixed this locally, but then noticed the split is not 100%
> accurate. Why don't we have skip_guc_pc in the in the early variant?
> 
> Does it make sence to have both xe_info_init() and xe_info_init_early()
> receive xe_device_desc? It seems to me we would have a more clear cut
> split of functionality if we had:
> 
> 	xe_info_init_early(xe, desc, subplatform_desc);
> 	... /* find the correct graphics and media desc */
> 	xe_info_init(xe, graphics_desc, media_desc);
> 
> btw, subplatform_desc is not used in xe_info_init()..

Doing xe_info_init(xe, graphics_desc, media_desc) makes sense to me.

Thanks,
-Michał

> 
> Lucas De Marchi
