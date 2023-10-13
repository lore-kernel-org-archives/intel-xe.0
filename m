Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79480CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 20:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C84A10E63E;
	Fri, 13 Oct 2023 20:04:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6110E42D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 20:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697227444; x=1728763444;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ma9+J3i5u8CrvLeKWIr+iv+Yie28QTxtBn6hC3RuycM=;
 b=LBhWx2Ho7tvDQJZG0V9aU+yaDPEdB8C8SfCjmas9/oRK7t1dv6R9lFbI
 T8IwXsHpTCwdCbV41QRIkAYjE9Bxkd6ZPlPqvGqx36ZnqKniYDjnQC9x9
 KAp8eB+zZsE4UnTw5xtxpepnoG34G28x6dm04zJd1v1AkfuTIsM+ql2yt
 gyvycdC8la+hifodji6IVZBczZRydGunt1HI0m7Iq1N/zquPcwABVnrb3
 xulCfDPvgx6R/btW18+cqPYV2vQ+CxtHpShWzoFQUBsaDN+2X73yc9u6O
 wa5ikcPy/KbEIVMwotuz0AI2Avi784xIhBN+SfoxSR8wLRzO1T58JoM7m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364616065"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364616065"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758599575"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="758599575"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:04:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:04:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:04:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:04:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeZvByC45HeDrj3qRr20lEapkGoXowXeozAfWQ+XJhYdLJ3jx+vqpWmkzdEUIlpGvbi+u77ki4KkOVkXiKLjWazdicMXlc9/nkblVKDfRRFNlx5C38dtlcLf86svxmej7Uw+oGaOSlNvsVuMiykVJGD337wjv4pYh5NHAYLw3dOuYPaZHQfJ3JOqfMN4CTbRTOwAlf4xa5Yr3Q3yY27v27KH9dTbJENz932qSnDaWrQ8XXHs8PjNqq8RZVOatUvUcc2piUiOyHy9RUK1RYmMtY5SsLklWzapGpp73sYN4TSliq44afH/fM+FGpeQwKCwf0JoBr4sLMrdlT3PxKNGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybsXt1MXCUToQ1Cug1MZeOnmWz0R2UquBX9KRMmzcxs=;
 b=irTdqw/2Tw7poBqJ5y9mKnaS0azikqfbvb+Sbv+2ugwMGEpId6KHzOra3Slk+sZyZ0tdaT6rSbOHLEhCv+4Lmx+iU/AcwKrFwGR2xOm4WV5OPYRDuvgbpJTBQtPYqYTd6ZLiM83dDGOpa9O6iQsAXrSK/+oZ4xEKO70lsEgVl2BQXsppDRnS8kDL3XCIRs1dDHbkIWNT1iczGxU/PWaiX3iiU6ubtXdmLu4SgzlZjkebxmLV8tn1UHk1Ey0rF6PQJx04/qpxuMK/vXTwi+e60IQY39wVYzjuP040a6a6VubLGBkiNcFCpd3yrfSt7I2TIexk+Wih5ShhuM5uJzmxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 20:04:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:04:00 +0000
Date: Fri, 13 Oct 2023 16:03:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZSmiq1PZsMWcFnXm@intel.com>
References: <20231011174252.10427-1-bommithi.sakeena@intel.com>
 <87mswo2oap.fsf@intel.com>
 <gvcesx3btnumlf6eufzvdjl7u4zjbkdlvnutfz6gd2a4323zha@pmb63j73bnpk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gvcesx3btnumlf6eufzvdjl7u4zjbkdlvnutfz6gd2a4323zha@pmb63j73bnpk>
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: a46dd557-e64e-4f1f-c125-08dbcc2789b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P3MzNOXRdZoCV9GTWdrvAXzDbTLpzVZOMwR0hbTfmw7kb/L4M22NA7UjRmsIH2xJrMCtXgUjtCH0JSZ7dLBVwTfkfPDyOOQMhh8E/9pFKAJ2reBHIddruOBKa55/a2x9VSiBCyc5FyGb4zE4iUdvyvstWvnFF9wcHX2ssSaFr4ePncTLT/TkJQbzynJa7zB0e1CB00Gh65jgCP+q4xONa2umCqAiiF505l7MeHqCWbgsXZ6zQ4RETSmAFuq/3AjIb+oTyycd3LcLsTVkzTSou98b3BVFDtXI+P4PZb6GdeqtyVj8dF6p300X5McVqru8c4cObibe6L0Qxb0C0livt2yBfIswrAFBWRv+dJhuuxAG20On6Z97E7rfQYs16QDIit20vwL2MIHasxPQ12Ty5MlXUg3eCtMn/b9JEt1S2XtOWiLpojHsxD/fFtgv3+cKDinxuwh1EM62OTqyltXuccAa9kiddq4XetZkqGNpYfxX0q+Cvk1le+Vz91HBfo1BHPXA1INQKy/G85YMQwulvvKH4OBGeJT6EFQFiLSZAi9OH7IrEmkjZpgdE0npbHVJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(66556008)(6512007)(82960400001)(86362001)(36756003)(38100700002)(26005)(44832011)(83380400001)(2906002)(30864003)(6486002)(2616005)(478600001)(6666004)(6506007)(8936002)(6636002)(4326008)(8676002)(6862004)(5660300002)(66476007)(66946007)(316002)(41300700001)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ji/Qe8mBBjLRZ9uGwOTDi0x9HbNYf0o8U55QlUqRwOmMhm9G4t3fhsvsc5?=
 =?iso-8859-1?Q?nFUMgg7GzWSvrX+ecqB2aAjMXPHpVNLbgfwI4mlhKwL9rQcuFDxLU6Tz4J?=
 =?iso-8859-1?Q?6EVKrU/X30cCpRo2Giokpt6yp17GEIzmcu02LnjX9mKDBK1HIF/5dviWl4?=
 =?iso-8859-1?Q?8V/Y2vEFAQNyJv/d+2dtXM68AVo94yphvWGFfkK2jc4kGGScUKIirgyKkw?=
 =?iso-8859-1?Q?+KQGDkn48kN4Sci/NbYDVoSzMbywppadTsZGhJh0kjJ/tM7qZ7eULjO9h/?=
 =?iso-8859-1?Q?/fhPfr3SRSQ+IMCtB1sXiUo49vGfPK6aS7Rr6F7zTMVlPKv9W+6X2wOeRZ?=
 =?iso-8859-1?Q?GUWG0yl+w3adFUIYoANov9zQ9nMeSXAM/PYuX2MIPH2xaOVaO2yyXBHBHi?=
 =?iso-8859-1?Q?fMeEW2ODSzhDn9zzVkbXqd5N/iKkGkWF2e8/7huPapJ/EQgrbKrrsiKmxv?=
 =?iso-8859-1?Q?NObXHIwf6ZVWO5WZqGX7rUwIQGMKqdEIXjkhb1D6AsfZK0VXZU7S8DVeYU?=
 =?iso-8859-1?Q?1BpMxmm6iVechEMh1M9SHpxZgUrjkQFVReLMlO5oDHM6JrwSKZdPnSUcGC?=
 =?iso-8859-1?Q?1FnHAPHTO4YzlWr25K0cnipkH2y+pY4Lj2JoS0O7yqhncyEfP/OYvMEDqa?=
 =?iso-8859-1?Q?nCywenMTUZQKFYtmD8IQsphkHXxtTDua2wElBHv7eS5vPIJ7ReaAdcU5VU?=
 =?iso-8859-1?Q?H1NndjM1vTavZ56semeik/iJjdeIDG8zgBDN8zI+Th5hch7OEFaeIcapp2?=
 =?iso-8859-1?Q?w/TcOePZ+PDTCuf9PXVxWgJ0i2HEf/EsQPgqUnagvnXNCqK9fRCkvW0LJE?=
 =?iso-8859-1?Q?auoTpBX1/F8Vto1h6Wej/d0ywo9Urnoeevzwy3QFAi/qlMet5HzUu59vw1?=
 =?iso-8859-1?Q?GEA4c+yP6Pg5QX+ySjlwnxCAtpgdBwd2sY1OprgOTw4f/GkCb8rrVA1x0n?=
 =?iso-8859-1?Q?CA7ELaHxv85X7qKYqs0u8HxEEW5X/+5yYiy6wH+5WucE+O3a/F/02ldCkE?=
 =?iso-8859-1?Q?mCD/HO8qTheFIi4nZV3wEB1eG3w7+WdFPx+Xrw6WD98RO9Z8XlfFb0mGnY?=
 =?iso-8859-1?Q?uNm6A8FWNxCz25p7cqmq+yzWpDTGqyxntNG7OlcCQ7ZEqgUZCxijyqnDKS?=
 =?iso-8859-1?Q?aDsZib7Z6rD0KEUlP1ig/rfWIUEzwCL4kix8EGAKFSEni1TsCwSY+4u/a0?=
 =?iso-8859-1?Q?DffuGaXyqgl1L0+l6cdXlFR+ipmMQ5JrLj2OE/icl9eacfq6Pmk9q9HfJc?=
 =?iso-8859-1?Q?J8v+WbpDRG6QgW1lLbW31J/6q2TpwGlXYpRw3JQDvNpmYAKnnGCgEV3zxd?=
 =?iso-8859-1?Q?urXVmrPune5cWe3Z+KSRf5B5asYKMjSn0Opq0tu3kmvE56AtH8Xdp3epD6?=
 =?iso-8859-1?Q?W5Rqbee6mV77u6xYlIMShSRwbi25Z6YQ5QweKWrG3Ool8fIVDCOo2xYqnW?=
 =?iso-8859-1?Q?wFyEqdhp4pz2+SKiFs378Ufw8PzaLHg2Aa5vVTZJ1S7GbFdN+O7DVcROeK?=
 =?iso-8859-1?Q?O0C0j8KOGSdqSU2Ly1CWz24S15W3O4DvaWbeoYO+pqsTm7QkF1IcV6BfO/?=
 =?iso-8859-1?Q?sVKZLweGECzHgUjpXmkxNnk3RKjwlw4t3+hH/BIfEK2WKeIJ9BDN9XvCfn?=
 =?iso-8859-1?Q?5rL08C+RHE/c7vsdfzptshLo/UU9pzru0UUgGaa6vuYzI+dPUnXvJmBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a46dd557-e64e-4f1f-c125-08dbcc2789b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:04:00.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D7M9josry0Ak7R8ME/Mae2oxIjK3hMQ3mE3+aTWdzhbwo28tUOSqxG5ibQiDaaxGsrzp/cByzlevr9wGrljTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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

On Thu, Oct 12, 2023 at 09:08:41AM -0500, Lucas De Marchi wrote:
> On Thu, Oct 12, 2023 at 12:16:46PM +0300, Jani Nikula wrote:
> > On Wed, 11 Oct 2023, Bommithi Sakeena <bommithi.sakeena@intel.com> wrote:
> > > Encapsulate all the module paramters in one single global struct
> > > variable inside the new xe_modparam.h.
> > > 
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c   |  4 ++--
> > >  drivers/gpu/drm/xe/xe_display.c  |  6 +++---
> > >  drivers/gpu/drm/xe/xe_guc_log.c  |  4 ++--
> > >  drivers/gpu/drm/xe/xe_mmio.c     |  4 ++--
> > >  drivers/gpu/drm/xe/xe_modparam.h | 23 +++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_module.c   | 32 +++++++++++++++-----------------
> > >  drivers/gpu/drm/xe/xe_pci.c      |  8 ++++----
> > >  drivers/gpu/drm/xe/xe_uc_fw.c    |  8 ++++----
> > >  8 files changed, 55 insertions(+), 34 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_modparam.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index ef42c33e3055..0cf908089483 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -25,7 +25,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_irq.h"
> > >  #include "xe_mmio.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > >  #include "xe_pat.h"
> > >  #include "xe_pcode.h"
> > >  #include "xe_pm.h"
> > > @@ -224,7 +224,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > > 
> > >  	xe->info.devid = pdev->device;
> > >  	xe->info.revid = pdev->revision;
> > > -	xe->info.force_execlist = force_execlist;
> > > +	xe->info.force_execlist = xe_mod_param.force_execlist;
> > > 
> > >  	spin_lock_init(&xe->irq.lock);
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > > index 391f08c1caca..0b55037c1da1 100644
> > > --- a/drivers/gpu/drm/xe/xe_display.c
> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> > > @@ -27,7 +27,7 @@
> > >  #include "intel_hdcp.h"
> > >  #include "intel_hotplug.h"
> > >  #include "intel_opregion.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > > 
> > >  /* Xe device functions */
> > > 
> > > @@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
> > >   */
> > >  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
> > >  {
> > > -	if (!enable_display)
> > > +	if (!xe_mod_param.enable_display)
> > >  		return 0;
> > > 
> > >  	return intel_display_driver_probe_defer(pdev);
> > > @@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
> > >   */
> > >  void xe_display_driver_set_hooks(struct drm_driver *driver)
> > >  {
> > > -	if (!enable_display)
> > > +	if (!xe_mod_param.enable_display)
> > >  		return;
> > > 
> > >  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index 45c60a9c631c..111ca5433c69 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -10,7 +10,7 @@
> > >  #include "xe_bo.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_map.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > > 
> > >  static struct xe_gt *
> > >  log_to_gt(struct xe_guc_log *log)
> > > @@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > > 
> > >  	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> > >  	log->bo = bo;
> > > -	log->level = xe_guc_log_level;
> > > +	log->level = xe_mod_param.xe_guc_log_level;
> > > 
> > >  	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> > >  	if (err)
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index e4cf9bfec422..717fcdcb5c7d 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -18,7 +18,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_mcr.h"
> > >  #include "xe_macros.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > > 
> > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > @@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> > >   */
> > >  static void xe_resize_vram_bar(struct xe_device *xe)
> > >  {
> > > -	u64 force_vram_bar_size = xe_force_vram_bar_size;
> > > +	u64 force_vram_bar_size = xe_mod_param.xe_force_vram_bar_size;
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >  	struct pci_bus *root = pdev->bus;
> > >  	resource_size_t current_size;
> > > diff --git a/drivers/gpu/drm/xe/xe_modparam.h b/drivers/gpu/drm/xe/xe_modparam.h
> > > new file mode 100644
> > > index 000000000000..efa246616d3f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_modparam.h
> > > @@ -0,0 +1,23 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_MODPARAM_H_
> > > +#define _XE_MODPARAM_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +/* Module modprobe variables */
> > > +struct xe_module_parameters {
> > > +	bool force_execlist;
> > > +	bool enable_display;
> > > +	u32 xe_force_vram_bar_size;
> > > +	int xe_guc_log_level;
> > > +	char *xe_guc_firmware_path;
> > > +	char *xe_huc_firmware_path;
> > > +	char *xe_param_force_probe;
> > 
> > xe_mod_param.xe_param_force_probe is unnecesary tautology.
> > 
> > > +};
> > > +extern struct xe_module_parameters xe_mod_param;
> > 
> > To me this is half-baked. Either keep all of it in xe_module.[ch] or
> > move all of it to xe_modparam.[ch], but please don't add a xe_modparam.h
> > that has an extern for something in xe_module.c.
> 
> any reason not to just keep using xe_module.h and have a `struct
> xe_modparam` inside? I don't think we need a separate .h and .c
> files just for the module parameters... xe_module.[ch] are small enough
> to absorb that.

agreed

> 
> > 
> > Please also aim for some naming consistency. File xe_modparam.h, struct
> > xe_module_parameters, variable xe_mod_param. Choose one, and stick with
> > it.
> 
> agreed

hmm... how to keep consistency here?

considering it is inside xe_module.h a good name for the struct is
struct xe_module_parameters
or
struct xe_module_params
for shorten...

but then to follow the consistency with the rest of xe, the variable
would be something like

struct xe_module_params module_params;

but this is exported symbol, so it should be good (mandatory?) to have
the "xe_" prefix in it.

It looks like the way to go then is:

struct xe_module_params xe_module_params;

Will any compiler out there complain on this?

> 
> Lucas De Marchi
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 7194595e7f31..31ed68fcd087 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -3,46 +3,44 @@
> > >   * Copyright © 2021 Intel Corporation
> > >   */
> > > 
> > > -#include "xe_module.h"
> > > -
> > >  #include <linux/init.h>
> > >  #include <linux/module.h>
> > > 
> > >  #include "xe_drv.h"
> > >  #include "xe_hw_fence.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > >  #include "xe_pci.h"
> > >  #include "xe_pmu.h"
> > >  #include "xe_sched_job.h"
> > > 
> > > -bool force_execlist = false;
> > > -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
> > > +struct xe_module_parameters xe_mod_param = {
> > > +	.enable_display = true,
> > > +	.xe_guc_log_level = 5,
> > > +	.xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > > +	/* the rest are 0 by default */
> > > +};
> > > +
> > > +module_param_named_unsafe(force_execlist, xe_mod_param.force_execlist, bool, 0444);
> > >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > > 
> > > -bool enable_display = true;
> > > -module_param_named(enable_display, enable_display, bool, 0444);
> > > +module_param_named(enable_display, xe_mod_param.enable_display, bool, 0444);
> > >  MODULE_PARM_DESC(enable_display, "Enable display");
> > > 
> > > -u32 xe_force_vram_bar_size;
> > > -module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> > > +module_param_named(vram_bar_size, xe_mod_param.xe_force_vram_bar_size, uint, 0600);
> > >  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> > > 
> > > -int xe_guc_log_level = 5;
> > > -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> > > +module_param_named(guc_log_level, xe_mod_param.xe_guc_log_level, int, 0600);
> > >  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> > > 
> > > -char *xe_guc_firmware_path;
> > > -module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
> > > +module_param_named_unsafe(guc_firmware_path, xe_mod_param.xe_guc_firmware_path, charp, 0400);
> > >  MODULE_PARM_DESC(guc_firmware_path,
> > >  		 "GuC firmware path to use instead of the default one");
> > > 
> > > -char *xe_huc_firmware_path;
> > > -module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
> > > +module_param_named_unsafe(huc_firmware_path, xe_mod_param.xe_huc_firmware_path, charp, 0400);
> > >  MODULE_PARM_DESC(huc_firmware_path,
> > >  		 "HuC firmware path to use instead of the default one - empty string disables");
> > > 
> > > -char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> > > -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> > > +module_param_named_unsafe(force_probe, xe_mod_param.xe_param_force_probe, charp, 0400);
> > >  MODULE_PARM_DESC(force_probe,
> > >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 99ccee07f8cd..29bcf7565741 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -21,7 +21,7 @@
> > >  #include "xe_drv.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_macros.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > >  #include "xe_pci_types.h"
> > >  #include "xe_pm.h"
> > >  #include "xe_step.h"
> > > @@ -414,12 +414,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
> > > 
> > >  static bool id_forced(u16 device_id)
> > >  {
> > > -	return device_id_in_list(device_id, xe_param_force_probe, false);
> > > +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, false);
> > >  }
> > > 
> > >  static bool id_blocked(u16 device_id)
> > >  {
> > > -	return device_id_in_list(device_id, xe_param_force_probe, true);
> > > +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, true);
> > >  }
> > > 
> > >  static const struct xe_subplatform_desc *
> > > @@ -587,7 +587,7 @@ static int xe_info_init(struct xe_device *xe,
> > >  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> > > 
> > >  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > > -				  enable_display &&
> > > +				  xe_mod_param.enable_display &&
> > >  				  desc->has_display;
> > >  	/*
> > >  	 * All platforms have at least one primary GT.  Any platform with media
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index 138960138872..854e4ba027e1 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -15,7 +15,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_map.h"
> > >  #include "xe_mmio.h"
> > > -#include "xe_module.h"
> > > +#include "xe_modparam.h"
> > >  #include "xe_uc_fw.h"
> > > 
> > >  /*
> > > @@ -219,11 +219,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
> > >  	/* empty string disables, but it's not allowed for GuC */
> > >  	switch (uc_fw->type) {
> > >  	case XE_UC_FW_TYPE_GUC:
> > > -		if (xe_guc_firmware_path && *xe_guc_firmware_path)
> > > -			path_override = xe_guc_firmware_path;
> > > +		if (xe_mod_param.xe_guc_firmware_path && xe_mod_param.xe_guc_firmware_path)
> > > +			path_override = xe_mod_param.xe_guc_firmware_path;
> > >  		break;
> > >  	case XE_UC_FW_TYPE_HUC:
> > > -		path_override = xe_huc_firmware_path;
> > > +		path_override = xe_mod_param.xe_huc_firmware_path;
> > >  		break;
> > >  	default:
> > >  		break;
> > 
> > -- 
> > Jani Nikula, Intel
