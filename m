Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B6CC47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 19:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB39112575;
	Mon, 29 Jan 2024 19:55:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BF8112575
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706558124; x=1738094124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mUaljgO24zYMrlJ0CPBwuyOsva00HAEKPKYnJtN9p2Y=;
 b=dXZquiykVmKMX7EpgOe2PQILAZE475i5DLZmy7mR341rfAtD73gCAFSI
 cId4NgtComDe4sk5WH1GrAPZafeBSCDwrTaxAIGdu7mLLHwq5lQcHm/5L
 66oBohRhOmmjkuFUYpm4LqPH2SMWo5Dzc/Qr/izTxdF3F8KmttN5UPG1N
 cf7A0Ofi/Iw0Lu7CUajE9pv6iGagNxasXcTy7tqCKvR3VXNE2chrSij0x
 soiq0nHkG6vgwwwujqrDJjKe1Zo+nL3hed0te7w7xFqQH1j3z1yoDFkCC
 0chZwBoaSZ5hRK8vOToXLdtE06OSLK7J1HBvta1iPnPlT4K+S9CAE9nxL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10462204"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10462204"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 11:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="821961768"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="821961768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 11:55:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 11:55:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 11:55:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 11:55:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGm+yAq3Jr7vNiQe73/+np0aopmrWM0PtxZGL7jwjXLaRpwtCoAm0CkrjHAvT0tgybpBpct27k2MUAiFou+fXz9S1FuvFZdS/20rCo3S8ZhpSZ5BGDNNL81IB5u22XZmwqmxSiWkamWYg/Sfb9jWwU9znGyzHFZh7e73G/zKrmloy4HJv7Mc1HQVcMtno4bA/07VxPFiGoGVFlbHDa72aTjIA0JSAi+CNKR8fkgg99SaeNyITDT0tGKYRArI+46wYpn3IhL+Gj4GjUHfp1r/2U0+bReqrEYrht1kqcwkAT4Jpkn7h5Lc1nEIT3sl++TdJkBnaGuNUpBTp/Yx71Fx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUn1YnZKa8KQbyLdo9/L0NOpwksyx1N1HkTVpuJOmyM=;
 b=OXUjtJ1rXBfXjfy3I1V5Uv3FJUySv3vw8k1bYcbPPx8Q+rWLuXdeN+RkW5NO8Ju+qP58hjoLX4Iw/DSzd2c6mir/xQwlGEMlvGn7BlyPC/NNsw54qKzUeJGiszC9y0/vSFWrQB2iMNRgRAdQ17hzg9vA/wk8lvFI0oXp+yMG2oQE3z15ETWTL5ellyK/eORzAiQugKTwItVVr8VR7gdzuW79BcApmkmxoMoaMx0TvrZQWVDxjXRW/EwvtCc3F+mT50vRnA3TpUBdS82QKPpQZHKP5UcRobVwiBn0uXZnHaYOlZZq2Swdl+8GyUgvHAEZGw/ifQNp4d2Lz+lPVdmDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 19:55:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 19:55:20 +0000
Date: Mon, 29 Jan 2024 11:55:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Message-ID: <20240129195518.GH5506@mdroper-desk1.amr.corp.intel.com>
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
 <6359a737-a290-48fc-ae3c-fa6f460a8032@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6359a737-a290-48fc-ae3c-fa6f460a8032@intel.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: c93c8fca-d0af-472b-b07d-08dc2104392d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tk7AzrV8ZXLeNmOlTs9bculxfqRg4TCrIyTXeCvf8MReke7uL8qM1BV870pZWL+guBDtkIN6hrGFSbGgyykhxT4xgoWhUa4jzxtKp+MauQPoZe2QldnwpFkG3hb4jgdV8r+0c9Z0/UA6PLrhO615/pyBlled3pE1L/7s4IXue0a4UiRUB9wGjDaAFbA3h6dWXxxe4MJMg1tFvel+x0/gq62yikPqqtVE7Fx2lq/cGLBUgDXKNJOVcCdNHrb0gFKTCPbKbdDs9XXxw8GgxERYEQTvxkJas3YTPeWuG9i+8WfM3HapYzZZM8DV54fZZcsqsA3VoFgwh6nBc9wG5H2DX71X5Yp3ajMWqKGQ4VwLAYL6i0xyHpQ54u01QgghMtPc69+9r1cykjntGuLzBrubn7OB//W+p3YWJKsOu43fog8NBAu7CzQLdWa+EZZst6SNazrK2wLgMAsRzcCp40uhvF47UVymbOM365/OdSsBaz0hSdIt+Acb2xWXYEdgLuP+ru6pvsU6Hqv9V/XeR1Eh/L5fcg48SlGbtYqZQb3QXPOm8YqKRHqHXG2BBZKul86O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6512007)(1076003)(38100700002)(26005)(66556008)(8676002)(4326008)(6862004)(8936002)(5660300002)(2906002)(478600001)(6486002)(6506007)(66946007)(66476007)(53546011)(41300700001)(6636002)(316002)(86362001)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dteaqSdAikkPmCQZU/gUmvilH14VdpV+6J3kaTAZ3tuMIAOlqTyZWiktJvGx?=
 =?us-ascii?Q?uRn7CeUIrUt69EndnpQSzE6s8jbz/zlkvbUj7CkxmR+37EXKkXHbSdE6itDn?=
 =?us-ascii?Q?Roz35G90jmNQiRGAaVwJqZlHymzv8iS0BF/qB5/nlr1KnTZmZw6ylq6CAHhb?=
 =?us-ascii?Q?JX8G1K/BfHb115LJ8vjBOu/TrPXktxW34VS4M1kCfUhNZiBRgQRhIYAwjOp+?=
 =?us-ascii?Q?7ZUrvFOT1e3OYxt97gZwvlpQy1UOArVs/AoP1ebD3pdKRpW10ueL6E0U2Asl?=
 =?us-ascii?Q?+J95otPBMzSDtROq4kFVhFvfLSJvhHELDkUaumlSM1EsuO7Uvk+AxFYN6+yC?=
 =?us-ascii?Q?fZrcloOXwDe75KT6YHlUbM2lQ0UtqLEF5Dcck3JuhbHnBJuxGMf3wzihVnZ8?=
 =?us-ascii?Q?Xa7tPh6g2EMXz1m4T8O6CN1rnH/pAkXece0EFTD3UQ6l++y/o/9VArpySIPc?=
 =?us-ascii?Q?i4EeK6taGSH4HyHefAv3+Hkh19Bz2HAjXLUnRVOWEIsOK2ApxGvqX6uhNr3C?=
 =?us-ascii?Q?QI/DMeuOjWGjfueXaOPLn5IvyMSS6UKH9acsnyl5KjNx5kH7egcZitFnNIjt?=
 =?us-ascii?Q?r542Q01piyVMMtqbWSbY+d/jVFr5hR4dupepB8fWsfrR/TtcA8YWF3VbsTCP?=
 =?us-ascii?Q?qj9CGf+tT0sORA3+g9ZKPt53NSRFtb6j/B2KxGPMOnzA6wuO9Bb17crnvan7?=
 =?us-ascii?Q?6RKF1HpwI1gBMVj6t6WKN/Jz3qSXP70pgK4i3I4M7dQ3afpky9Vj6tkj5xx5?=
 =?us-ascii?Q?Wm+k6jHrKAf+AfXNDs2fnYmZs2TZbX+NS9Ft35vXPowGabwfyYMT8Qxh+lqR?=
 =?us-ascii?Q?uMNE6H5SI3l9gDge5OTb3tMtuyqLVcuJ7FreLTZoGVlNFZEQ4TafWKTRtlsH?=
 =?us-ascii?Q?OT4HpyO+aZ4VpAK2W9IaxpPdl5Ud1FQGlc7X55qK7iy70MQxobMH9txmbO/8?=
 =?us-ascii?Q?Y8SHac4UEl3BNkMvWdDNskix20KE/9EmhGL9RDUYjwvbYqSqaHtTGZ7iVEyl?=
 =?us-ascii?Q?uGeQs+y+5CYz1fqL3dScHvr7r0oXZHMYraF7FEcMg+b9MqghsWIZsHRGdmyb?=
 =?us-ascii?Q?2L0b339tVnFXswY3mQrLGMX5PBvEST4JTgwirjz87KmBEz1vqpmuzGYFo5PS?=
 =?us-ascii?Q?yukSaMab7BUNRer4dG1D2sLINEjRHqB9vHFnoaLDovFeASAcKgIaU9gFzZsy?=
 =?us-ascii?Q?XhPOF+4hH1a8CUK8ty8FiDExdu0e2d9UMTJ/T2RDeB3R267SWMbURjcbO4jU?=
 =?us-ascii?Q?uFJkmcOUjD0NN8U+Qj8X/cnLwm+G8xDQgyl04Cw233GsWpc5JHgWomj78cT1?=
 =?us-ascii?Q?NOYC2s+bvnjWV6pKPH/i5Z/GQcthOi9QSNIvi2lg8cyGsdqCepo6UDaj74nt?=
 =?us-ascii?Q?+3OBYzIEjbjNnWDGMEsVemJwXrWENFaSkYBhjuoAId89rWr3/7a3AGPY3b9Z?=
 =?us-ascii?Q?c57Pi1bFbXe/0/IfZ5tWyT9whwnegLkQwz21PBOJfGXHfHoikD8NvYv6m6kf?=
 =?us-ascii?Q?LzuF1sHeo9Il6Fb5XRbTwH55OESsku1MjLhjNJ83OiYSpJnHamhqRzfIiWZ7?=
 =?us-ascii?Q?xBEfLOyTutQizM7es8j9pzuPZkhJRYGUcYzTYA/3pFWXDdFHhMyb/ngql797?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c93c8fca-d0af-472b-b07d-08dc2104392d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 19:55:20.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxFH7lCeh6aD23n4LI57gMrqvIQQC7y0sTKlwlCjRwxUNJcP2LgnGfQpF4L1kAd52ybiyQWtRyYci3pjGJzq6JbGC03APShV6oh5wi1mdNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 10:04:01AM -0500, Dong, Zhanjun wrote:
> 
> 
> On 2024-01-26 2:48 a.m., Karthik Poosa wrote:
> > Check latest platform first in xe_hwmon_get_reg.
> > Move PVC registers to xe_mchbar_regs.h.
> > 
> > Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ------
> >   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  6 ++++++
> >   drivers/gpu/drm/xe/xe_hwmon.c            | 24 ++++++++++++------------
> >   3 files changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index cd27480f6486..15ac2d284d48 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -490,10 +490,4 @@
> >   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> >   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> > -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> > -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> > -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> > -#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> > -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> > -
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > index 519dd1067a19..97652b4297ff 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > @@ -41,4 +41,10 @@
> >   #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> >   #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
> > +#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
> > +#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
> > +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
> > +#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
> > +#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
> > +
> >   #endif /* _XE_MCHBAR_REGS_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 89c6f7f84b5a..c19a0daf7fd7 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -77,32 +77,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> >   	switch (hwmon_reg) {
> >   	case REG_PKG_RAPL_LIMIT:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >   			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> >   		break;
> >   	case REG_PKG_POWER_SKU:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_POWER_SKU;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >   			reg = PVC_GT0_PACKAGE_POWER_SKU;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_POWER_SKU;
> >   		break;
> >   	case REG_PKG_POWER_SKU_UNIT:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >   			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> >   		break;
> >   	case REG_GT_PERF_STATUS:
> >   		if (xe->info.platform == XE_DG2)
> >   			reg = GT_PERF_STATUS;
> >   		break;
> >   	case REG_PKG_ENERGY_STATUS:
> > -		if (xe->info.platform == XE_DG2)
> > -			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> > -		else if (xe->info.platform == XE_PVC)
> > +		if (xe->info.platform == XE_PVC)
> >   			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> > +		else if (xe->info.platform == XE_DG2)
> > +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> I see concerns about check latest platform first, while for PVC vs DG2, I
> guess the sales for DG2 should be much more than PVC, should we consider
> that factor?

The convention in Xe (and in i915) is that the newest platform should
always come first in if/else ladders and case statements.  That's purely
for code consistency and to help avoid mistakes when new platforms are
added in the future.  We don't try to do micro-optimizations based on
which platform is more widely sold or anything like that.


Matt

> 
> And, above is equal to a read from 5x2 table, reference by array index might
> be more easy to read and expand in the future, and no more if/else needed.
> 
> Regards,
> Zhanjun Dong
> >   		break;
> >   	default:
> >   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
