Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA2C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 07:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DDC10E3B1;
	Mon, 22 Jul 2024 07:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeytPB9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D7710E3B1
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721634054; x=1753170054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pE5prVktGifmCkgFGuhp2/14ngvFAPT9yupjYoyKNXM=;
 b=PeytPB9aVZZW3U+P8UiQfRVGCpXXDhANTiV1CNYxzPZSGOvxanCUGqEp
 A9OGeFwIlFahEHMnDGBbk2sCOWQfsVejWve9axGWWeCl5AmBmL/QD+n9X
 BKg7aPel1TM4hgPHSf2wwOLqgFlbxfdPme8JPrT54W7R2tkTlGxVLu0Nf
 +YbYqWfrbnvwn2eIxet5pzuTcFxx+m6zzCfXixStjCfcMqT5SescNgwKV
 foqQ9mZ8jS8a7/XmZSntmhFnt5CxhImf7ixRZWqxBfLaVmMcfq7ItlXSL
 FVE4uBc5vAyedM3izr2WmWR4Cd0bPEopTVaegXWywK38qcSdjuiQ8IJ8C Q==;
X-CSE-ConnectionGUID: yh2DyN5dSh+5sBQS1KVy3A==
X-CSE-MsgGUID: osr01o0KTXuPKsnLAkMWMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22950045"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="22950045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:40:50 -0700
X-CSE-ConnectionGUID: 9HyM6IrESdqsFTs6XB/Twg==
X-CSE-MsgGUID: VtzN2KcJQceEDIAO6N2aJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56903015"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 00:40:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 00:40:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 00:40:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 00:40:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 00:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMDnvb0nwl8brqFEVIYssaHAwmxou8gR43VzigVzsLCdtuKTJ/jzOouhdvu+vXKzKjlubHAXTpNPkemUNQAn1acOY8KzO2GKpQcZviJnsJmTTF40TDe6yzkPUcULRSkavRbcy6FgsFyLM4F5cqq3yka3TF/pQMD7AXhnurAocQLYIG1/vY/5QMHsSlb3oBRp6d0TeGi4W46WNKmxwX8Ma5g8fh2Wh4hZfaELr9SwcSSO+1pjJRZVuit9L2t2dVjel4mdyeEhK7laJ4MOpdgg6l0GHtHsclXaDvWB7GDatrOMAzdfEIcn55CuZXOIgkirpSnkt182oPGDFN6ew8sRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH3/C5BuEGlGsCddW7rAONdrK4c7KwJNrxr91ZBOV5E=;
 b=rXt3fcjFqSxCiIQ5K7k9TP8/C2taLEd1u8kpMR1tj6lmviHMWBLRlT/QNy4pzFu1wyKW6aj2MqT7y0r8t1CZaoEaw8oLY+amHZYX6U17XajVeh0RbfYgpnc/0DXU5WLAuFFA3j/K140uXKXLMRbJb7+Qvx/6/2PuSywShHlzmztvRMk8/kVublI1hEUELzMUv660fYNoRDsK3oTMgc4mNSBuZGnhZlXRhSJVd59HRBpWYjV7Jez2DyNbU+vAaqvMZYt0O3oibEEKAywxRqTjowZNxszoY5A6sDR6DeNJ2KNNm0gB9Hk/nxp6RslATZfE3Derrm1dn6oVdyelCyoYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 07:40:41 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 07:40:41 +0000
Date: Mon, 22 Jul 2024 09:40:34 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 1/9] drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Message-ID: <Zp4M8kQaf4wIOqfv@fdugast-desk>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-2-francois.dugast@intel.com>
 <Zpgbg9B06Wdbwirn@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zpgbg9B06Wdbwirn@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB3PR08CA0032.eurprd08.prod.outlook.com (2603:10a6:8::45)
 To CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 4477cfc0-af71-494d-c69f-08dcaa219672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xz/RtPl5eU7+dv8pmvo7zv8cHefsRsMf1qH1G0kb0kcTS7OWqzkp/fFl1PQu?=
 =?us-ascii?Q?GAL8y0gfcBh/jYm5NTEYSZQdeQ3uOenjGg+s+Ofsg/cD6lzX+lAwenkj8uex?=
 =?us-ascii?Q?Y1BKMKKOhmwIf++VSIQdX2zN4vpIa/yB4P53HtpO3pnglIsOU4MVoH0GsQ5U?=
 =?us-ascii?Q?rW56gGw6FymjJ39VkZFrl+k2e0KW//PvN+GNHlF6ASXXV+ryRV6M6jsSXdFk?=
 =?us-ascii?Q?R9AsL7559D6VAZRQ01oPyIRQpMW4L+fNyzNC6kWaAJ2++Y/YmStMu5wwdxp8?=
 =?us-ascii?Q?cEwDyNqRufSbsHpI+n9a8Zbh+txzyhQTYVdqss0C1DXY2B1u+4okR00uepBm?=
 =?us-ascii?Q?tyKnW235rRl+G9+qDsEHy5Qk27qc4dPhqTq0WRKXR0c6upI/SkF3O6/U1v0l?=
 =?us-ascii?Q?LDd5aSZrO8jDh2aEEwlbkTqti2+U8HmvnYHjZ18AQzX2X+51cWiUUjv1w4Qg?=
 =?us-ascii?Q?rHVmcYUsSTYRMIQ3yCTEX1jpLOa2YErRur8O7vTtAvDY5q9eS/HM23hyZDJT?=
 =?us-ascii?Q?mDh3UtOduzqAD/Fs31VwomDIvmpaDO8ex7FbdmItgyCYiNupqshJFVWM3yrJ?=
 =?us-ascii?Q?Gi8COFUXsLEh+uJ1oq3E9GMmuC08Fj99qSaF9zl7VIvPRf7zzZUgmri1Xm6O?=
 =?us-ascii?Q?XTgJLy2515a1N0/uF4nITZMpzGZ6p02QcPQKdkxXxgqs2Ad3No7jsyNvJzE6?=
 =?us-ascii?Q?SozwBlxXZmLHDrvmnjVWcj3VDyhvrr/1OHu2Wd8d2Ne45wZEKjn1/FOhgu2J?=
 =?us-ascii?Q?efWHVeh4lVn1vHFrbCDm25JbWr3nRXVTZ5xTgkh8keclfSYbDTEnbkovkdSO?=
 =?us-ascii?Q?xCzWrK5XeQHasQ2G+ZoGB4lBrOWPqPyNd5jnj7t7aMBhFJaVtI9PgfbwuBKz?=
 =?us-ascii?Q?FgVzw4tXY8g309xGFz86vUFmPQFLFqpvXYHp2sDJEDytk/T702hxK3tdnRr2?=
 =?us-ascii?Q?V5pcSBFjxpuwh81psK6M3djj7PtdGTmvo4s9A79T2fdLBERutJpMvPK3oIkF?=
 =?us-ascii?Q?wbP/b1Jy3oWklsQ7GiQik4UCmO9IpybELre9cmksJpM2QlPMutDfx+H2VAqu?=
 =?us-ascii?Q?dC1xnHbTDkY4bN0T8C9qxJa87mbxP7IFUEvom53nyY0WyHJaeIqtHWwl5w1I?=
 =?us-ascii?Q?Q/pgzpX7Fqh8mtgls5uqgkWfXODxQFKI8F4VEpK7ocp6UTaHPp5I1lm+C1wu?=
 =?us-ascii?Q?wq8MvIPNA275j/KawJYWKrN/weWy3R8BMpLAaQ2mXRmBGeDgIfBhDKEG4v0f?=
 =?us-ascii?Q?Z26jYUUr7sVNiYXO645j2vIoYkuIcc+XcxcXz9XRZyEZV0H1rFxnuknkAkyg?=
 =?us-ascii?Q?1FqoKSpgJnIk0BXEo+bArOUntTE7/uHoDA/pcyWPY5dvLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4mQuzfSj1xxfDyOYhf+VMRP6dQXMgahHYV9k3/T4w5ghYY9ZvoY0QDGmDoJ?=
 =?us-ascii?Q?7q72oNlninQojd9wqZlodZLiDob5rm0XalIdXsZy2PF+30iOfo7JlwDsXZFn?=
 =?us-ascii?Q?uj58UjmHSsxb62vTj/NQ+ebjy0TF2vj89qrU60u5kF6/hE75Cq1WHuHniwT3?=
 =?us-ascii?Q?yk8jXysKzVQWvB6osseOJrNfAmgO2zHSw3evHFF8QyXXhrhudovgaZGZyBCu?=
 =?us-ascii?Q?ba20oNYwi1/7CjcCbDbqYey6lwXsYS2ONBB/MN332TDf8YXdmn4myFKfZDB1?=
 =?us-ascii?Q?u4vP2E5nwLUdXCCQ/6WKizNnaEorRUE1kAs+jDAvpk61p9Emn6a5wnl5+VNP?=
 =?us-ascii?Q?DBw06Zcyj5Fe1Bzd2MY3IJUnD2dDVvYDQpQu/pn69UAkz6mxvVzRMqKrwn4l?=
 =?us-ascii?Q?bWtBzhzKjxUyhjA6dcOyMC32oUBKgUm+KS9cEWwdvZQLebUscxcQmSABW9WN?=
 =?us-ascii?Q?dZJuL0XRbW0Bxvy5xfSLivDmH3nT2xWNzaG5opEB/hgkV7o4QZSjSZDRrzWk?=
 =?us-ascii?Q?IVzAFjJ6hKIFQFfo4c3uNW0bDDzTKhTnrLVAAmGsbAfso/kr21m6rHdcHLxf?=
 =?us-ascii?Q?uM17z/0O7gdOM1CbdA4SeT7POHELSIlcpJoTLTyIzxiIGgPfL2KN7sfpk/37?=
 =?us-ascii?Q?/QP87Z/hDpEgHGBb7TvYYfy0RQ5BIYqrURjL3oYe/S3clWBPIk3ZzjfCZxFt?=
 =?us-ascii?Q?Yq/N6i6wrqtQa3pOuEL4bvjZoeusmz16AKDebg5O2yo0rI+cBjBZuNVHYc1y?=
 =?us-ascii?Q?Ix7HjMUl/MRj7iXVMLysQS11cevfIDp+YvE+3xZuvlAtTaLT6NSLjAUByaH0?=
 =?us-ascii?Q?ElbwAX3UpGYeUrS3jrSs59ZzWYfXij2U0Z4+wlbe/4Zo8sh5iu09HUuovDBN?=
 =?us-ascii?Q?XacZ7NSWArnKJXckPbB8UB1orulOUJFtpbYWPXskJ0a2nZ4B5fPLZY/YZgH2?=
 =?us-ascii?Q?FlUPySF6ah6AxE9ArkiO4M4TfejI6uuTq/wUo6RYBJYSaXF3xzBbK9z551jd?=
 =?us-ascii?Q?uesnXbkLOZye+EC7eHjqvaZnQPGgokEwzg4EfhAEEvOOIqq8blf2Mpx2arPV?=
 =?us-ascii?Q?Vx4oL70ArMNvAM4Zr9Upg0Srhz7dFUlKekEA4t3fCLj24TY4NLE0uaCVAmbz?=
 =?us-ascii?Q?u8AgPcAjKVnVC1DAxrU4T39RF5MT/E9ObCQhmGDe/PULJ2zMURnr4OcpV9D1?=
 =?us-ascii?Q?keEKu4GR9U6jZsyYmkn/ByOwDugKrfeOzeofYnIrLmYmR9cduCz9jypDPVlV?=
 =?us-ascii?Q?Lvlo4F9zAMd/jwWQR4okSZ53IEzD4zh6Ub0LntFw61fDSoBB5upXu2GB6qyA?=
 =?us-ascii?Q?9PbnRsOyTZgTPMdawo2QVnogskqLdvAsKwlL3QteHmLl1Ka1yDm+KOodEz7o?=
 =?us-ascii?Q?M74YMFTe5kDzQc9qwwuznIn7EEvXVnaQBDmLHn8D8YRUP/dONZySKkKZXHYI?=
 =?us-ascii?Q?LyASYV/ZqXMAMWqhApbCLr2B9+65ijhEGk0L4A9RfEObLg9X//c+Z6Du10s5?=
 =?us-ascii?Q?Zy9RYJ9MRbrT1r2nqUDdCWYATer3Q15UDQ9XSVtTCY4ox9sn+wFYSIirfInX?=
 =?us-ascii?Q?sAiealWVrwUSPDSVCjydUhVKGzO8aov9aH+i0J/xHwE8A5xofKVfeqj+K5qQ?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4477cfc0-af71-494d-c69f-08dcaa219672
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 07:40:41.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ8YEUyPXJNXsxx/mW2096A7Vi4DxTCgiNqiKCEsc7Ot2rCKy9CPvwyqnK/oI+nxcnCE9YhbERTIraWRYjjy8zdUj+DMIBdTHyDrAquA8Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

On Wed, Jul 17, 2024 at 07:29:07PM +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 03:07:22PM +0200, Francois Dugast wrote:
> > A xe_hw_engine_group is a group of hw engines. Two hw engines belong
> > to the same xe_hw_engine_group if one hw engine cannot make progress
> > while the other is stuck on a page fault.
> > 
> > Typically, hw engines of the same group share some resources such as
> > EUs. This depends on the hardware configuration of the platforms.
> > 
> > Currently all engines share EUs so for now only one group is created
> > and assigned to all hw engines.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine.c       | 48 +++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 31 ++++++++++++++++
> >  2 files changed, 79 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 78b50d3a6501..f8df85d25617 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -431,6 +431,53 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> >  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
> >  }
> >  
> > +static struct xe_hw_engine_group *
> > +hw_engine_group_alloc(struct xe_device *xe)
> > +{
> > +	struct xe_hw_engine_group *group;
> > +
> > +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> 
> Need to handle kzalloc failing here, e.g.
> 
> if (!group)
> 	return ERR_PTR(-ENOMEM);
> 
> > +	init_rwsem(&group->mode_sem);
> > +	INIT_LIST_HEAD(&group->exec_queue_list);
> > +
> > +	return group;
> > +}
> > +
> > +static void
> 
> This can fail, so:
> 
> static int
> 
> > +hw_engine_setup_groups(struct xe_gt *gt)
> > +{
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	/*
> > +	 * Current partitioning implies all engines share EUs therefore
> > +	 * belong to the same group, so create this group and assign it
> > +	 * to all engines.
> > +	 */
> > +	group_rcs_ccs = hw_engine_group_alloc(xe);
> 
> if (IS_ERR(group_rcs_ccs))
> 	return PTR_ERR(group_rcs_ccs);
> 
> Also you will need to cleanup these allocations on failures and on
> driver unload. For driver unload cleanup use drmm_add_action_or_reset, I
> suggest adding that below.
> 
> > +	group_bcs = hw_engine_group_alloc(xe);
> > +	group_vcs_vecs = hw_engine_group_alloc(xe);
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_COPY:
> > +			hwe->hw_engine_group = group_bcs;
> > +			break;
> > +		case XE_ENGINE_CLASS_RENDER:
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			hwe->hw_engine_group = group_rcs_ccs;
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			hwe->hw_engine_group = group_vcs_vecs;
> > +			break;
> > +		default:
> > +			drm_warn(&xe->drm, "hw engine class not handled");
> 
> I don't think this is a warn as the GSC (XE_ENGINE_CLASS_OTHER) doesn't
> need a group as it is not exposed to user space but pretty sure shows up
> in the for_each_hw_engine loop.
> 
> > +		}
> > +	}
> > +}
> > +
> >  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  				 enum xe_hw_engine_id id)
> >  {
> > @@ -761,6 +808,7 @@ int xe_hw_engines_init(struct xe_gt *gt)
> >  	}
> >  
> >  	hw_engine_setup_logical_mapping(gt);
> > +	hw_engine_setup_groups(gt);
> 
> err = hw_engine_setup_groups(gt);
> if (err)
> 	return err;
> 
> >  
> >  	return 0;
> 
> return drmm_add_action_or_reset(..., function_to_kfree_groups);
> 
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 70e6434f150d..c6f7bbcb2a41 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -100,6 +100,35 @@ struct xe_hw_engine_class_intf {
> >  	} sched_props, defaults;
> >  };
> >  
> > +/** enum xe_hw_engine_group_execution_mode - possible execution modes of a hw engine group */
> > +enum xe_hw_engine_group_execution_mode {
> > +	EXEC_MODE_LR,
> > +	EXEC_MODE_DMA_FENCE,
> > +};
> > +
> > +/**
> > + * struct xe_hw_engine_group - Hardware engine group
> > + *
> > + * hw engines belong to the same group if they share hardware resources in
> > + * a way that prevents them from making progress when one is stuck on a
> > + * page fault.
> > + */
> > +struct xe_hw_engine_group {
> > +	/** @exec_queue_list: list of exec queues attached to this xe_hw_engine_group */
> > +	struct list_head exec_queue_list;
> > +	/** @resume_work: worker to resume LR exec queues */
> > +	struct work_struct resume_work;
> > +	/** @resume_wq: workqueue to resume LR exec queues */
> > +	struct workqueue_struct *resume_wq;
> 
> Assume these two members (resume_*) are setup later in the series?

Yes they are, in "drm/xe/hw_engine_group: Resume LR exec queues suspended by dma fence jobs".

Francois

> 
> > +	/** @mode_sem: used to protect this group's hardware resources and
> > +	 * ensure mutual exclusion between execution only in LR mode
> > +	 * and execution only in DMA_FENCE mode
> > +	 */
> 
> Prefer this style for multi line kernel doc:
> 
> /**
>  * @foo: some description...
>  */
> 
> Matt
> 
> > +	struct rw_semaphore mode_sem;
> > +	/** @cur_mode: current execution mode of this hw engine group */
> > +	enum xe_hw_engine_group_execution_mode cur_mode;
> > +};
> > +
> >  /**
> >   * struct xe_hw_engine - Hardware engine
> >   *
> > @@ -150,6 +179,8 @@ struct xe_hw_engine {
> >  	struct xe_hw_engine_class_intf *eclass;
> >  	/** @oa_unit: oa unit for this hw engine */
> >  	struct xe_oa_unit *oa_unit;
> > +	/** @hw_engine_group: the group of hw engines this one belongs to */
> > +	struct xe_hw_engine_group *hw_engine_group;
> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
