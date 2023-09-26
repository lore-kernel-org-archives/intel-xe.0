Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BEBE7F130
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 21:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA71310E437;
	Tue, 26 Sep 2023 21:42:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE50010E436
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695764563; x=1727300563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZDntF9qp9SwnaMNRZXdLozHyV3RXxdcaojy4/QAfR/c=;
 b=abz3RJHSlAru46DeEiSHG6tIlHNrM2v/5r+Ccdm7aPEIoc3nGnlAEnhW
 H/mucD1ndntjXZuWSHs4QHWkrGjRZjSa0+nzYg+HhNeln2Phq0lkRE3P6
 Cb4DwSziwMwEVzJjDSYgEDEKI31tgPON2Qxb62EAsyTRI24K132+6IPfp
 97GtwSUK9hRwN16K5UPTp+Vb+AJhqmcOgda0dw2Jr2iW/PFWH4h/T53BY
 x1iZyXiADiw3DTq0/2JU6eH/Vh4sd426r+M/I8+Bve3RaaGwyrTC3rFxu
 jkNAdcUDOGiBEWB8CJDC/KLO50q0+hFEcuXf6Gan6iVuLnwMWsRm74nJ9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="380542374"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="380542374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725579711"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="725579711"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 14:42:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 14:42:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 14:42:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 14:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhzLG2bQzmo4lFCjYnC7fvLWZYHxoWIvinGGhNh6xxda91HW5Ktq7+XhmD8P/PTP+LQfU3tprNBKdc7sZ2Q1xyQnzbfCinfWTI3uiUjaIPNWUgMo5xfP9GZUu9B6O3veWkWGtjdXpX6kIWPl8LwzDYkbHoEW05gq8Ao+zEDe5jZrQHkxC01esZ0ua8nxl+e1tAT9zNMJxZ2Smdp/ey+TDDuXQHWp9Gd+qpVGu0CvUkTTpHUa3pdd9gAjV3RrOgmSqzegGg7v2Qh880vsaBmOc/gplLaPPdV13QSgnzr8mPM0FhG2OVV75d/EfafKpfi5nMCN19KkYj6QmRrHA+deYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/aSV8YFGv39mWX+sdZj1wOzdgYr6DjRsYora0yPWeA=;
 b=YhU7vdwPwTmIru9G3hz+MHphmoqIwGiib608IrKBIvGEukNEGSFAPFx1c1MZGXlAGnd+2GF39rSZHtqL/h/ppRP0KDPT0HsytcH96bAwqMc0DCc/1S8kalihqhYY5/0zFPu0lk9PnZ4Tv3ER3+ZtAgdEEcdRFr4BuzraNIBpypWwxWd228dpFNhY6ZHNfmHwC9et3AY35xCWXUag2tpa/5TR1/QC9NZ/74l2oo7PZMGRqh2mDXevXhXXBz8qUpdUAMO4pg7OadJAZ3THyKRS2TOVKE0vWXs6ooDUapZjvVyXglADt5b+KaL6c4rNUySQqHcXLaTVzg7m+qt+f5FVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5558.namprd11.prod.outlook.com (2603:10b6:408:103::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 21:42:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 21:42:33 +0000
Date: Tue, 26 Sep 2023 17:42:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZRNQRSE3dxYTCaD3@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril> <ZRMnbYcsX+GSEgA3@intel.com>
 <ZRMp8rRXkuybDH3E@unerlige-ril> <ZRMr6JXpSurNe90N@intel.com>
 <ZRM2avt22erTAimS@unerlige-ril>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRM2avt22erTAimS@unerlige-ril>
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: d072e71a-e8de-4b54-ee2d-08dbbed97da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFqxcERuQ1Tc5tR3/yrLJB6jQfA1XpZ8BLGumGZwtr9AoYkGPVLJR/my1wtWdi+rpfev+2yAWKbI8bbDtg6Fu9TYeslOxhhPtmMnkUcpHj1Ntq8WYhU7Nb5aLCiz6eCiJO2u+e+zgjHTolkrkvAnmyYMT8PZlrNM5kKcvxGwg8YtuhUV4vNDCizvOfpFl968LHQ6knChq8PxFRDDI+vhzAqOLYTg6chtrAW4iqRjE0FqiTcrKyuagFjfDByHWvzU9426ktHKm5oafKUiHPqa19+eEaH5yHDE3wSYj0Puotaoj6kN6UwMMtEfQ6tzVMJ2oA2HgMovg8WblvEsDFDpj0nXlWTHTYof6rmtOqySrx4lV5yglYCQJKBsz3fFNJyif24mzQhaDI5V2xWENX8HVZ+u8hawEmga7unwK6r4a0LdQiz9UGUgRJL053TL5LnneTfuX/lQmpxcfDkPOa6fb/FkV0JBQGxNzKQi07O+4VFjmdqvw0DdCy3Mj0HZFSWjjgucgPl7xPQpO6Uhh5JX9bxMlkOdgjUHTrDnIulJELMRag2i5JR9d6VBsl+DRR8dFrgMuityEduj/Vgfd+wNZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(107886003)(82960400001)(6506007)(316002)(41300700001)(44832011)(66476007)(54906003)(37006003)(4326008)(66556008)(8936002)(6862004)(2906002)(36756003)(6636002)(83380400001)(5660300002)(8676002)(66946007)(86362001)(2616005)(6666004)(6486002)(478600001)(26005)(38100700002)(6512007)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJQjhGXhEt8HtVLtN3gPyaOIKxVU/Qk3yHudamFDB5Mp3J9pWvHcCG7Ly/gI?=
 =?us-ascii?Q?UzRirGc6OB3lpp03lvDza20dRoAyIdGgIQLvS9PfZktzmlvVcazll+zcW8MJ?=
 =?us-ascii?Q?Iegn+NRf7T7+ytG3fcsHhz7/gH7fIBQXw9NULQbXKYluv6DDWuNFtujZE/9M?=
 =?us-ascii?Q?FHwSABmzpa6yjKmDHxPl7a5sIJHMHmieg63ENlAqbTSA7PVZ4ZibEZZ/SWaV?=
 =?us-ascii?Q?BnJQdGiVOOenx7mDI9SRc2fH75Mi/rgve2gcmaNKwN88AluPMK63+RtauV6r?=
 =?us-ascii?Q?cyT/JxG+Z7TpSNvoOqw1chvq0jOkuaWgP7oWPfPn6FTeAal6BYeU3PfyAk2P?=
 =?us-ascii?Q?16irG7Mnt7YNDsqUSCCldbfaCbFMgLTN52/I2iFV3sF/CKmiAukRaO16Vflc?=
 =?us-ascii?Q?LW3LaWALl5/ygUEasbw1dnevZuNpnXAa0/xq6pzJZGnQ5HOomXhRo9sTjmSC?=
 =?us-ascii?Q?9ljHvdRgmhz46pGVZLdK0lS38mAXqoCTHM2NPoWfmQ9djwelR8ysc/u9p/gx?=
 =?us-ascii?Q?Ma5wQ3JzaeW8DaYXMC6x5lVs14mwUCDpdPy3B80J2pJYeWpIbQIOs2lI7h+F?=
 =?us-ascii?Q?1f8+HpvMo6/VXIqtSlu7rgyg/VR8oF7mKQKQtMZBKOC+PIZ5rMF2/MxStR4I?=
 =?us-ascii?Q?R4OpG13R2JMxheYrbRR8YGRWeY5Y0bXLPquVyuCuzk7rzNRw88RNrDM0f0vV?=
 =?us-ascii?Q?kH7VINVs8WM4CPREYyRuGsSdd9JH5Ad0hR8trtLm9xsegcSaCKiOL1mPOlDN?=
 =?us-ascii?Q?klIhPm19AT2vBIauUvVOZaLZZ/bhPAiKXwC6cSnka/vLG2twI/hpE1s4KwsI?=
 =?us-ascii?Q?BIJSSVWTROuHqWLNwWpQv5JEJoiiTMVHl67Tvzed/0C0vAIey4v5nU6OeYUn?=
 =?us-ascii?Q?vV8zSOxz7ioUG7FX1yJaTDgk+fbIFdW95mKt31jzvu2Bc3P1LjzHEEs/KoXj?=
 =?us-ascii?Q?ILttSOdswt4xIosX9VgdfNNjDnqQBYcG4L6evT8G9ar92dhluG+fhG8MKDUh?=
 =?us-ascii?Q?A08AoqZnBldGD+DHa3EnPSGmgGD3/xC5rFtaOYwtST3SgqX9w3u+S/ybLRxi?=
 =?us-ascii?Q?zLf+1KpT9NSumEXMMQWmCf3xIWsNwYOLWcoWoLlZghKoM6kmBFrqzkHW2lsU?=
 =?us-ascii?Q?X/KxlbT0En0t6RueNJj3Bkp1m4cLmUZwYFh+Obw8BOvzDayzJHynoox+aal6?=
 =?us-ascii?Q?KA6F/emWeUzYd5Hth1r6HweWsm/iyFbdOQqaCq3BUJfuxS8HV6+QYcIqCQqJ?=
 =?us-ascii?Q?Y+moE3mOfYPDRMT6Kl+Af4DPpPIUhrvR3OyP2+H1o+b4yqVv5COSozKPM6zg?=
 =?us-ascii?Q?m3IAJTjGAFnaeuufBdSG1wAKKo9EIIijrSjVh5S0BTuCXW/hPC2EoCGSA5yC?=
 =?us-ascii?Q?fVsGdohjzyzg8yoy6n+LCCmEBUAP5u7dW/17TLDoK4rz58krxTRIE5MVLema?=
 =?us-ascii?Q?ie4D+DZFBHcnXI3l/BxT4Qgp0u1uE8zmjklWLv1JnPcO5WvOK4VfNSWNmEK4?=
 =?us-ascii?Q?xq4XzvOVPDTeVGNIfjI2hwbgKSxBm+ZdXqlE87rP5VWD7y0cXs7BhXH26mmi?=
 =?us-ascii?Q?BTcIl/76PDXQMQZu5hMcOUETRJFe25SL5hcptgb0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d072e71a-e8de-4b54-ee2d-08dbbed97da1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 21:42:33.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEphEGnqPTIU2qhxfy+1+jwXJKbWzc+69bhDb+8aa3Guw7kX137LT4um7dRjFManb5zjMxuTsRBLxaeeX64hEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5558
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 12:52:10PM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Sep 26, 2023 at 03:07:20PM -0400, Rodrigo Vivi wrote:
> > On Tue, Sep 26, 2023 at 11:58:58AM -0700, Umesh Nerlige Ramappa wrote:
> > > On Tue, Sep 26, 2023 at 02:48:13PM -0400, Rodrigo Vivi wrote:
> > > > On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
> > > > > On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
> > > > > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > >
> > > > > > Perf measurements rely on CPU and engine timestamps to correlate
> > > > > > events of interest across these time domains. Current mechanisms get
> > > > > > these timestamps separately and the calculated delta between these
> > > > > > timestamps lack enough accuracy.
> > > > > >
> > > > > > To improve the accuracy of these time measurements to within a few us,
> > > > > > add a query that returns the engine and cpu timestamps captured as
> > > > > > close to each other as possible.
> > > > > >
> > > > > > Prior work: https://patchwork.freedesktop.org/series/87552/
> > > > > >
> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > >
> > > > > Should already have an R-b from Jose based on this -
> > > > > https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1
> > > >
> > > > While incorporating that and fixing IGT, I noticed the inconsistency
> > > > present on the v2 that was not part of v1.
> > > >
> > > > Why we have the struct name as engine_cycles now but the query itself
> > > > is still cs_cycles? Which one is correct? why do we need both and
> > > > cannot align in a single name?
> > > 
> > > Jose had commented that XE does not have the concept of CS and asked for a
> > > rename to engine. In the latest revision of this series, I had replaces cs
> > > with engine everywhere.
> > > 
> > > We should use engine.
> > > 
> > > Latest series - https://patchwork.freedesktop.org/series/122440/
> > 
> > yeap, I got from there...
> > I still see
> > +#define DRM_XE_QUERY_CS_CYCLES		6
> > there
> > ;)
> > 
> > I can do the renaming locally if this is the right thing to do...
> 
> oh, I think I missed that. It should be changed to
> DRM_XE_QUERY_ENGINE_CYCLES.

while finishing the rename here and looking to this query, I got
myself thinking, why isn't this already doing the gpu_timestamp
calculation and showing that directly instead of sending the cycles
and the crystal clock reference for umd to calculate?

the gpu_timestamp directly would align better with the other fields
in the struct. and by itself already avoid the gt reference clock
duplication in the uapi.

> 
> Thanks,
> Umesh
> > 
> > > 
> > > Thanks,
> > > Umesh
> > > >
> > > > >
> > > > > Thanks,
> > > > > Umesh
