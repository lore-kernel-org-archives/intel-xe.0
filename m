Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A415AD0EE0F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CA710E439;
	Tue, 25 Nov 2025 18:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbEj9vab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA7B10E439
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764095856; x=1795631856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Zz+74qHVYEH52zIxpIBrOLsfVCYKnSt+rrJKOeatX4=;
 b=VbEj9vab2chJK2pPd/gsZv9bORvuSEHShu3xANsxiEYbbWwmnYfSJW7B
 g9xZFF7eg4xCfyAZxIFgxG3IU3Pp5LJTNbuwmSjv0vocE4EoHbchcelZw
 gAZ2oj0VZoPDPQNOdfumSYAXpWz0RC2AyDLR+YWOSFhezcZLaNUN2DBPi
 3wSGVI7gFjGKTNV4GDn4JFaUVihMLCOQV61PqoLhTlSJ1E2sDFd5iP7Py
 nyJ9qM0bpI/ZHuRFix+/OjW0NNwovpWxUX+Utwb0ocvkzFR3fZnX0L35x
 HWp9BB7Q4oLflq6D4Ee8iCHbapOIkOdRlvQthJowjoQgFIx4ZFiNhZaGm g==;
X-CSE-ConnectionGUID: EUSGjnarQj2Kz7IrC8CPWw==
X-CSE-MsgGUID: 5s5ApSsERGqynw+Dj6ROkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69982746"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="69982746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:37:34 -0800
X-CSE-ConnectionGUID: zysdGj51QlehHq0BGO/AdA==
X-CSE-MsgGUID: iNKEWtTeSeiEZDkc+u73Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="197195027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:35:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:35:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:35:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:35:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOQa9wgBES+RVm4UFlF2bCq67RsmOl2Zd3HcRm4DtUp4oPgr8M93j6TMDYSQocEmhlQSPi5LpvolXa2DIGGbwChHTErihxek6t3IRLixT4PmK6Fbu9ZhsfBarvhZBrwL0bJaKEM0H2PQDG1KveYvRNeUXWGIp/56yxhCj2i1PK7aiHneY3qrl2iLE1xKkWRSd+DQ0LC+8h6G3syJ4giLC92fMBbTDBze8qi5z6/5RC38zUvx46NmRpW9N4EzCcsw+H7fO75NAPpst/BAYW4mwwHwpax/StaM4H0UeZ0vn9aTAF+/V44/YGh7FtRaIykrxVG1ZhCk+ZNf2HBrNsQ9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9iWQX0/nBxeQKLd6D11zmI2fdk4Xk2dd3UGJDsTXwE=;
 b=atCxciZmvB9KIG8NF0l3K5fVkufu76flUqB8K70KC0Rm+c6Cb290U4lwtgjgML2Z5PBzKWhUzEDw8S/wySGsx33e5L64Wvlbjm4IIZdniwnJu66MyPva2jB/AjD0gQ8hbeT/nQhjM9t+J6zZ835mbYRFjuGncyeFtdLnEiaMOzRXVC6+HiyOUEl/yDRjXOrGq/XYM5/rqmVYjVYp/S2iEpOes81L4+aKpNhkpduogKfYgs4fr+nHkxJOdN75i8/KgsXmiUuu9+SgkYCjmhzndT5NbiAd/36dvjRkFllsXct8A/XTy+9PUxooP829YNSsTBhRjaDX2plkEddino3BMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 18:34:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:34:22 +0000
Date: Tue, 25 Nov 2025 10:34:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Message-ID: <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:303:6b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 97befaae-2913-4605-b1ba-08de2c51408b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfSG89Rtj6uEh7k0p+mCY7HYAnxj7enAvz8esmFhCIfDB0xGtquv3O/YKZ5m?=
 =?us-ascii?Q?4iC0atVqyFyHLV7UBhhlUDaKL18H1yQY9Jb5xNJJae9im8arKrnzca43EtfC?=
 =?us-ascii?Q?5ewakVh65KbL/V9E2dWZ2Cae9h50l7Rsl3iHIjciGNrinW0576sz2/VFBWK1?=
 =?us-ascii?Q?tn7c8uB7n/f2fiJy+rKMXFBDFDW+ZhUSpyEWW+mseTim7VzKxDCvSQ2c1fPP?=
 =?us-ascii?Q?kj15SgxCs333oCe1VDooMR3ONQV0BKY3Mo8lKBgbDdsqkFrbWrtDG5FYLcah?=
 =?us-ascii?Q?0bqRXDdwZ77hOo0PnBL5q2Biul2yXlfXxJCzYe78JejjaQdyk48meM7JEG+0?=
 =?us-ascii?Q?X6SdhjhemN173AFnXfvG7horD0dQRO0ITgWdZ4u4NGoCAIsR114VMrpiFpNW?=
 =?us-ascii?Q?w31RxbP56trWh8CbSSbaJUiIxeJ4ons3yZk3EliwncqpnOK80pblGMiszv+u?=
 =?us-ascii?Q?qRekeE9QJgi/kMG9a64ciBzqhDoDDWxulxAIoSMGp/3K7pZi3fswuuB3Lm+i?=
 =?us-ascii?Q?1uxfvUtwR86Yz/aLHCt+atWcoS3BvizF333ksZ/NyVbqgrXCA3TZ/1eF2Gd+?=
 =?us-ascii?Q?LPew2dcYO9GDTakM8yaW2qs9m0nZOkDuc01f5VXrghGb21BhoXipypuzVTrz?=
 =?us-ascii?Q?801vnG54TKpfbQPLataLOaU65cYWxIn+LWFlSp+w4w0UnMCe1eogqU5Qze26?=
 =?us-ascii?Q?qC3oI70dphhu7XJTmB0/UhAXpYBf1n+0vDG2WpOA0NMcTH3UoE2vdeLpMEKS?=
 =?us-ascii?Q?ze4BvmqL+Wx1Fa1vkLw9vWKLJqtSENd69MTa0j98bwNlve1odb8/Z4btoDcb?=
 =?us-ascii?Q?KYFEeVqaRPyqnRjtsv5pZGCVt/qg8gvsq9vfIy1fvJbhgZ0EHmEJRH/oH+VH?=
 =?us-ascii?Q?dJaRBMK5T5JE64ZbwzGk2EzY5ZgYR18BDU8MB0DRXHwGLrI9INIj62TnrJbJ?=
 =?us-ascii?Q?KEfhe+Ocvwm3xxFAxDKFCViXq0L6EigBl0MRpqQo2f2+WVm/wmxRboZzDKA2?=
 =?us-ascii?Q?aLDw1WdtfHZddXkzin4M4nBLMh7xjPMebd/PWXI7ZgwoZkutK5ZH5yIPbM1y?=
 =?us-ascii?Q?QJokZSI0/kbEhZIo+Ds1orrmjyXm0xtzd+sBQGqTRLjQBGghOUIl483wKbJm?=
 =?us-ascii?Q?vAIqzJf2v/lxprROIyBJ9M84xnkgE/L8c0Zwvmr2Fkd2VXFHmHABfd5PIwTs?=
 =?us-ascii?Q?sp0/JSUqNZOT5dp1u3Xts9AG7ejVTwGZykydGzANo5ELLvjUtaLSKoOCV3Bw?=
 =?us-ascii?Q?zt+vrJ5O62LcHrQdA7mVvudjgW2vxiUOGUMl/lMwDX/Ie45aXdpWXTlbz9OI?=
 =?us-ascii?Q?ze4ptMl4Tkh5q2I4l0YBwuOGJs492VgXf5TZ/CZFGx7xmpoQNK6HQEhDBJup?=
 =?us-ascii?Q?KXTc7DVC0cdUc0v6nhYdrvjoUEOwUat99uOl9bGD/2cIj6HRYwammrsN/OrP?=
 =?us-ascii?Q?6MviKTh5GA8edJTtyw6dFzFgOuVpWCs7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjr0TMVjfZ+zLUfRFd0429C4arx7kMdq69EACob9katwG8jsMQ0sW4447D+H?=
 =?us-ascii?Q?pSwN9Ms9JhKwdPLsEh62r4Ivn9C340GsYjd/vco1iaOjlpj3CJr9OicNRdfb?=
 =?us-ascii?Q?k2/RMDkAanufEmmbF+ri3kZhTwbqKcISPwYrrS+lE5kq3g4IBMBneuqqQhcx?=
 =?us-ascii?Q?i8q2H/QoeOb3cNSYbPQAW6zI4Mf51DP8EkRHlUev8LWi9ZHNjix13pyqJkrM?=
 =?us-ascii?Q?U+nOJtgdC/filHVevjnH7zHwMuMX7X325aeQPdgWjVFm03WfwaFcwA0bxvFe?=
 =?us-ascii?Q?B59Skrf0iaJrxFuvwT4Gv2VzZOaForx8zorkJ3ygAwmYn6SWH6WbwPklDy5b?=
 =?us-ascii?Q?CMhqnrwVUkIXd7zoGHd4WbahV8T47iS/7ZodEy5ZC/rM07o5xOOozE7nG1/H?=
 =?us-ascii?Q?BqU8HALDRMJAxRw3w2tjndVU6hkTXaGzSN15oXdM3WLi7HQQuTpki+qPhE8t?=
 =?us-ascii?Q?9/Nq4oDd0hEjG5ev/pPK7+OaSRDpub6T8X/XQVtsrFbdQm8giux5ubDnK9rC?=
 =?us-ascii?Q?nprHEfVOx7pnbRLZ7V0ma6E0PeQ5yq8ftxFfVmMGuI1RMioPqrOKAS8+jtzN?=
 =?us-ascii?Q?gercdwT/SExn9ffDg3I3gPUhpu7iDeD6mEItMGvNPoeXNixSt1ZPWBEemv1H?=
 =?us-ascii?Q?3lHNLitTptWZ+EfyP/SeOXO8kfJbd7ngACFO0YFvxTtrNEu/6lsv8MhipVz1?=
 =?us-ascii?Q?mdk2di2cX1tmInCWiuxTfQhvDrinbThDiAl5xmRRjqodWKWU7/weO44op88A?=
 =?us-ascii?Q?VGqHBW6+VWWQ7FzxiC3cPT5F8ajrZe9rWrRQmWyxisRp0JVMOlzzQTftATAh?=
 =?us-ascii?Q?HgHk/I0Cexvt+gMXgfsbQAUpNP5v5Efmxicjxez/+02g6COV+S6YQ6bxmqJD?=
 =?us-ascii?Q?KL5OTYMQLpIIXVXikq0wfcKbArNywUAziEmVVajioRpnt0gvleS5/z2uePKU?=
 =?us-ascii?Q?93+Mkpx9yD0QPU9vHh13VKcu1WP02nmuqx/nRKXe5SJCVyHOfkIFaBH1UGEl?=
 =?us-ascii?Q?Bd+hdbCFhH9eogcRD8oZku+DfnhawMKDYyXcbhXjP0WkTUoOu5bJ0D2m70wo?=
 =?us-ascii?Q?3fqDg+YxEZ6H5phaiOO+6bSJbp5N4W/dlYVyRblFIjDZon2zPtQMMZLCKEZ0?=
 =?us-ascii?Q?NxsoUl3HNQwEAOJrM7ZDDiNEMhN9UJQ8N8KvHZzr2hAxHND9lmA82J5+0FUl?=
 =?us-ascii?Q?x/0YF5QdiEKaw2AZjMWgKXRhK7//++5VUKFQorvyHa40+Loqyi0gWpDSRhQw?=
 =?us-ascii?Q?exFemOP6SW0XCt2jGNIs2VnFhCp1IwOXk9/iWx35yi69KFSf3gujzAWTBtDy?=
 =?us-ascii?Q?sgbulKovsBiKvssXmSFpVT8Ofdjo/+FZgpk3wrTrr0MfxYRA2UMtw4xv2UQ1?=
 =?us-ascii?Q?J9zFEbmvztPByZSC2f07xFpjdozkO8707JZdxeNb0q3MqIZq8eqVRYN7IQff?=
 =?us-ascii?Q?SYtgqTGUiEg5ia96d8nbYYFBQhwoUbqbRpuYumnZ2lRKzc9R0g279uFQwrJW?=
 =?us-ascii?Q?2hTGLMrhrKEYBenQjHWXTuPwYkRTqXP05yl85GVzO1ZVp+z0P92X1D2ocP+4?=
 =?us-ascii?Q?0L+fzn5Vq0HOviIDRa586/hUFRCm4AlHjlLdn+5SoQI0/xhF9C2fkHXUQL1b?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97befaae-2913-4605-b1ba-08de2c51408b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:34:22.2281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVZ4HtXD973LJEmbCWA6rs6pluiSn9gqK94F8iaxBx0mvrsUHE8/vky8IwEN8yeXWwO7HdYx0WBNNq4z5b38mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > Page reclaim list (PRL) is preparation work for the page reclaim feature.
> > > The PRL is firstly owned by pt_update_ops and all other page reclaim
> > > operations will point back to this PRL. PRL generates its entries
> > > during the unbind page walker, updating the PRL.
> > >
> > > This PRL is restricted to a 4K page, so 512 page entries at most.
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > >  6 files changed, 217 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index e4b273b025d2..048e6c93271c 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > >  	xe_oa.o \
> > >  	xe_observation.o \
> > >  	xe_pagefault.o \
> > > +	xe_page_reclaim.o \
> > >  	xe_pat.o \
> > >  	xe_pci.o \
> > >  	xe_pcode.o \
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > index 4389e5a76f89..4d83461e538b 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > @@ -9,6 +9,7 @@
> > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > >
> > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > >
> > >  #define GUC_GGTT_TOP		0xFEE00000
> > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > new file mode 100644
> > > index 000000000000..a0d15efff58c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > @@ -0,0 +1,52 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright (c) 2025 Intel Corporation  */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/kref.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "xe_page_reclaim.h"
> > > +
> > > +#include "regs/xe_gt_regs.h"
> > > +#include "xe_assert.h"
> > > +#include "xe_macros.h"
> > > +
> > > +/**
> > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > > + * @prl: Page reclaim list to reset
> > > + *
> > > + * Clears the entries pointer and marks the list as invalid so
> > > + * future use know PRL is unusable. It is expected that the entries
> > > + * have already been released.
> > > + */
> > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > +*prl) {
> > > +	prl->entries = NULL;
> > > +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST; }
> > > +
> > > +/**
> > > + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list
> > > +entries
> > > + * @prl: Page reclaim list to allocate entries for
> > > + *
> > > + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> > > + */
> > > +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list
> > > +*prl) {
> > > +	struct page *page;
> > > +
> > > +	XE_WARN_ON(prl->entries != NULL);
> > > +	if (prl->entries)
> > > +		return 0;
> > > +
> > > +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > +	if (page) {
> > > +		prl->entries = page_address(page);
> > > +		prl->num_entries = 0;
> > > +	}
> > > +
> > > +	return page ? 0 : -ENOMEM;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > new file mode 100644
> > > index 000000000000..d066d7d97f79
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > @@ -0,0 +1,49 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright (c) 2025 Intel Corporation  */
> > > +
> > > +#ifndef _XE_PAGE_RECLAIM_H_
> > > +#define _XE_PAGE_RECLAIM_H_
> > > +
> > > +#include <linux/kref.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > +
> > > +struct xe_guc_page_reclaim_entry {
> > > +	u32 valid:1;
> > > +	u32 reclamation_size:6;
> > > +	u32 reserved:5;
> > > +	u32 address_lo:20;
> > > +	u32 address_hi:20;
> > > +	u32 reserved1:12;
> > 
> > This is wire interface with the GuC. Bitfields can based on endianess of the CPU. I
> > know this is a iGPU feature for now but it could possibly change in the future, with
> > that, to future proof can the layout of this be setup via defines / macros?
> > 
> 
> Sure, I moved over to the typical FIELD_PREP/GENMASK macros used elsewhere
> for the guc interfaces.
> 
> > > +} __packed;
> > > +
> > > +struct xe_page_reclaim_list {
> > > +	/** @entries: array of page reclaim entries, page allocated */
> > > +	struct xe_guc_page_reclaim_entry *entries;
> > > +	/** @num_entries: number of entries */
> > > +	int num_entries;
> > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > +};
> > > +
> > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > +*prl); int xe_page_reclaim_list_alloc_entries(struct
> > > +xe_page_reclaim_list *prl); static inline void
> > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries) {
> > > +	if (entries)
> > > +		get_page(virt_to_page(entries));
> > > +}
> > > +
> > > +static inline void xe_page_reclaim_entries_put(struct
> > > +xe_guc_page_reclaim_entry *entries) {
> > > +	if (entries)
> > > +		put_page(virt_to_page(entries));
> > > +}
> > 
> > Kernel doc for static inlines.
> > 
> 
> Added.
> 
> > > +
> > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 884127b4d97d..532a047676d4 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -12,6 +12,7 @@
> > >  #include "xe_exec_queue.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_migrate.h"
> > > +#include "xe_page_reclaim.h"
> > >  #include "xe_pt_types.h"
> > >  #include "xe_pt_walk.h"
> > >  #include "xe_res_cursor.h"
> > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > >  	/* Output */
> > >  	/* @wupd: Structure to track the page-table updates we're building */
> > >  	struct xe_walk_update wupd;
> > > +
> > > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> > > +	struct xe_page_reclaim_list *prl;
> > >  };
> > >
> > >  /*
> > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64 next,
> > unsigned int level,
> > >  	return false;
> > >  }
> > >
> > > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > > +	return pte->level == 1 && !pte->base.children; }
> > > +
> > > +/* page_size = 2^(reclamation_size + 12) */
> > > +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > 	\
> > > +({									\
> > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > +	ilog2(page_size) - 12;						\
> > 
> > s/12/XE_PTE_SHIFT ?
> > 
> 
> Done.
> 
> > > +})
> > > +
> > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > +				   struct xe_page_reclaim_list *prl,
> > > +				   u64 pte,
> > > +				   struct xe_pt *xe_child)
> > 
> > Nit, xe_pt can be on the same line as 'u64 pte'.
> > 
> 
> Done.
> 
> > > +{
> > > +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> > > +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> > > +	const u64 field_mask = GENMASK_ULL(19, 0);
> > > +	u32 reclamation_size;
> > 
> > Nit, I'd make the last variable declared on the stack for readability.
> > 
> 
> Ahh got it, reclamation_size moved to after num_entries.
> 
> > > +	const uint max_entries = XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > +	int num_entries = prl->num_entries;
> > > +
> > > +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> > > +	xe_tile_assert(tile, reclaim_entries);
> > > +
> > > +	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
> > > +		return;
> > > +
> > > +	/* Overflow: mark as invalid through num_entries */
> > > +	if (num_entries >= max_entries) {
> > > +		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> > > +		return;
> > > +	}
> > > +
> > > +	/**
> > > +	 * reclamation_size indicates the size of the page to be
> > > +	 * invalidated and flushed from non-coherent cache.
> > > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > > +	 * Only valid for these specific levels.
> > > +	 */
> > > +
> > > +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
> > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /* reclamation_size = 0 */
> > > +	else if (xe_child->level == 0)
> > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 1 */
> > > +	else if (is_large_pte(xe_child))
> > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /* reclamation_size = 2 */
> > 
> > What happens if we have 1G page? That doesn't seem to be handled.
> > 
> 
> Page reclamation hardware does not support 1G page. This should
> be handled and fallback to standard TLB invalidation PPC flush. I can add

Make sense that we fallback. I am however not seeing where this fallback occurs.

> a comment somewhere discussing this but the format for PRL only
> supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
> mentioning the HW support being limited to these pages and rename the
> is_large_pte to is_2m_pte.
> 
> > > +	else
> > > +		return;

I would think for the fallback, we'd set prl->num_entries to
XE_PAGE_RECLAIM_INVALID_LIST here.

Maybe I'm missing something?

Matt

> > > +
> > > +	reclaim_entries[num_entries].valid = 1;
> > > +	reclaim_entries[num_entries].reclamation_size =
> > > +		reclamation_size;
> > > +	reclaim_entries[num_entries].address_lo =
> > > +		FIELD_GET(field_mask, phys_addr);
> > > +	reclaim_entries[num_entries].address_hi =
> > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > 
> > As suggested above, use macros/defines here to setup the entry.
> > 
> 
> Got it, moved over to using other standard define macros.
> 
> > > +	prl->num_entries++;
> > > +}
> > > +
> > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >  				    unsigned int level, u64 addr, u64 next,
> > >  				    struct xe_ptw **child,
> > > @@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >  				    struct xe_pt_walk *walk)
> > >  {
> > >  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child),
> > > base);
> > > +	struct xe_pt_stage_unbind_walk *xe_walk =
> > > +		container_of(walk, typeof(*xe_walk), base);
> > > +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > >
> > >  	XE_WARN_ON(!*child);
> > >  	XE_WARN_ON(!level);
> > >
> > > +	/* 4K and 64K Pages are level 0, large pte needs additional handling. */
> > > +	if (xe_walk->prl && (xe_child->level == 0 ||
> > > +is_large_pte(xe_child))) {
> > 
> > And also here? 1G pages are unhandled? Please explain.
> > 
> 
> As stated above, page reclamation only supports 4K, 64K, and 2M pages.
> 1G page will have to fallback to the standard tlb invalidation with PPC flush.
> 
> > > +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> > > +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> > > +
> > > +		for (pgoff_t i = 0; i < count; i++) {
> > > +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64),
> > u64);
> > > +
> > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > +					       pte, xe_child);
> > > +		}
> > > +	}
> > > +
> > >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> > >
> > >  	return 0;
> > > @@ -1654,6 +1738,8 @@ static unsigned int xe_pt_stage_unbind(struct
> > > xe_tile *tile,  {
> > >  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
> > >  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > > +	struct xe_vm_pgtable_update_op *pt_update_op =
> > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > entries[0]);
> > >  	struct xe_pt_stage_unbind_walk xe_walk = {
> > >  		.base = {
> > >  			.ops = &xe_pt_stage_unbind_ops,
> > > @@ -1665,6 +1751,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile
> > *tile,
> > >  		.modified_start = start,
> > >  		.modified_end = end,
> > >  		.wupd.entries = entries,
> > > +		.prl = pt_update_op->prl,
> > >  	};
> > >  	struct xe_pt *pt = vm->pt_root[tile->id];
> > >
> > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > >  			     struct xe_vma *vma)
> > >  {
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > >  	u32 current_op = pt_update_ops->current_op;
> > >  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > >  	int err;
> > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > >  	pt_op->vma = vma;
> > >  	pt_op->bind = false;
> > >  	pt_op->rebind = false;
> > > +	/* Maintain one PRL located in pt_update_ops that all others in unbind op
> > reference */
> > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries) {
> > > +		err = xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > > +		if (err < 0)
> > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > 
> > I don't think you need to call xe_page_reclaim_list_invalidate, right?
> > If xe_page_reclaim_list_alloc_entries fails the prl should be in the init state.
> > 
> 
> Yes. I'll drop this call for now then.
> 
> > > +	}
> > > +	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> > > +NULL;
> > >
> > >  	err = vma_reserve_fences(tile_to_xe(tile), vma);
> > >  	if (err)
> > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile
> > > *tile,
> > >
> > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> > >  						vma, NULL, pt_op->entries);
> > > +	/* Free PRL if list declared as invalid */
> > > +	if (pt_update_ops->prl.entries &&
> > > +	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
> > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > +		pt_op->prl = NULL;
> > > +		pt_update_ops->prl.entries = NULL;
> > 
> > Call xe_page_reclaim_list_invalidate for clarity?
> > 
> 
> Updated.
> 
> > > +	}
> > >
> > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > >  				pt_op->num_entries, false);
> > > @@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
> > >  	pt_op->vma = XE_INVALID_VMA;
> > >  	pt_op->bind = false;
> > >  	pt_op->rebind = false;
> > > +	pt_op->prl = NULL;
> > >
> > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
> > >  						pt_op->entries);
> > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > xe_vm_pgtable_update_ops *pt_update_ops)
> > >  	init_llist_head(&pt_update_ops->deferred);
> > >  	pt_update_ops->start = ~0x0ull;
> > >  	pt_update_ops->last = 0x0ull;
> > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > 
> > Can we introduce a function called xe_page_reclaim_list_init for clarity? It might
> > do the same thing as xe_page_reclaim_list_invalidate but it would make this a
> > little more clear. Likewise later in the series when a job is created, you can call
> > xe_page_reclaim_list_init there too.
> > 
> 
> Sure, I'll write another helper for this and modify both those PRL creation points.
> 
> > >  }
> > >
> > >  /**
> > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> > >  		&vops->pt_update_ops[tile->id];
> > >  	int i;
> > >
> > > +	if (pt_update_ops->prl.entries) {
> > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > +	}
> > > +
> > >  	lockdep_assert_held(&vops->vm->lock);
> > >  	xe_vm_assert_held(vops->vm);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 881f01e14db8..26e5295f118e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -8,6 +8,7 @@
> > >
> > >  #include <linux/types.h>
> > >
> > > +#include "xe_page_reclaim.h"
> > >  #include "xe_pt_walk.h"
> > >
> > >  struct xe_bo;
> > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > >  	bool bind;
> > >  	/** @rebind: is a rebind */
> > >  	bool rebind;
> > > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> > > +	struct xe_page_reclaim_list *prl;
> > 
> > Can you move this above the bools in the layout of xe_vm_pgtable_update_op,
> > likely just below "struct xe_vma".
> > 
> 
> Ahh got it. Moved.
> 
> > >  };
> > >
> > >  /** struct xe_vm_pgtable_update_ops: page table update operations */
> > > @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
> > >  	 * slots are idle.
> > >  	 */
> > >  	bool wait_vm_kernel;
> > > +	/** @prl: embedded page reclaim list */
> > > +	struct xe_page_reclaim_list prl;
> > 
> > Same thing here, move just below "struct xe_exec_queue".
> > 
> > Matt
> > 
> 
> Moved.
> 
> Brian
> 
> > >  };
> > >
> > >  #endif
> > > --
> > > 2.51.2
> > >
