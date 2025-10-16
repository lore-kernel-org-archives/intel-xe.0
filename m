Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C934CCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 16:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FC210EA55;
	Thu, 16 Oct 2025 16:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiDU6WkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1EC10EA55
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760633675; x=1792169675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lcm1oTk2Hazuspy/Iu9OxSbmWCZedO93MaT0V5sNx7M=;
 b=KiDU6WkYOC+FeTMo0XJ72hZTen0t56MX4Vn8tNYUBxwsQLpWOJDm3YH8
 GlSNLHO1Qp1R2Ow2Tqasu85blissGw0zQTrjcu8ZjhXh1Art+c4/XEQWk
 Ffru6zgOt9Vz/kEIdZ1LT6fNF+YqX6QnkGgUvSwb8Qa+3zuFtxy0Dm/yO
 mmQ/SabKij7qf6hEvY7aha3liPyqpQ9i8dA90b0kfClz/uf2TAACpzDDA
 i7+KSWR0Zi8TmHBQlDsk9PmJKs5NJhQ1OlQN+xsbBJuajKrXziqzMU9gu
 8GOBV+vJz+0lhB/5BVX3tJXCYAdsqyxdgtZiISgHBnN+8D7gsG3xoy6sD A==;
X-CSE-ConnectionGUID: kJ0jS4LYS0mPvKIAZ5nUDQ==
X-CSE-MsgGUID: 0J78pHwbTg61k3ILkFG6+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66699992"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66699992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:54:35 -0700
X-CSE-ConnectionGUID: sl1gfpIXQgGUvxB9eRCXLg==
X-CSE-MsgGUID: ZdzgGnjnTAqnET8TNOTV+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213468695"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:54:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:54:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 09:54:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRQAvk+JQISe6kq9szWQ6QIAWvxp+DY+7u2u++ej1lvfK9CngsTWPl5UMVvIB63Fs89Q3bmNNPS+pN3y6QlcIHUBi77phZpYwOvgQv9O9L74O9HxUZSQ9JHu15JhexuawJvk8DgjLi7mmdggRo5S80Fg7RBQe0jXsN2VvseGou8srWWsGxg9sIVofz/HXzHhMjsy4ee2OKOsh7XDp1LijNFPsIoosPVYGyjFd4CrBVpnWt3kgV59RuLZQAcjeLuUN7B5lLgIU1FNZDVoKdAUlFhMscHAbH3pykvx9BXdjidVVykbX3wDAXmD0wg+DqJWMyVUUsODQRYDPe4QLQseDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIR7+VWW3GsSiCVNm92LHlgyfqxGXlsBTj9dDgHFVwc=;
 b=uQzOa8xqesLQVXSLci4anlC6a14NLkgTX5PJdzvXtkmhYSIdd6NGQ+n9ufscGdT3KkMs9Re73svVycIw1vyl7HZwuLpyoHH31mW7QGGrlrOQNIa0k1E8ogbXsTNkAfEB9t35yS0R/h7sgEamci3783uznq7Q2/7PcUKZvFIY3rt4V0rfaP4kWCnTYF/gXvZ+xm6M44++ybzn6+9rW3aDIq62Jl75NQTn0dTfNyVgl+53PPpTGJL7VoKRkfxPapHBW1EvkGGAR/YsatWMyDXWsZ/OregF1VIHGOaIfSOqGz+zoDcXUMEFR/X4kU84QNSrVf0Swt+GqD3QA++RwfrxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 16:54:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 16:54:27 +0000
Date: Thu, 16 Oct 2025 09:54:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 20/22] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
Message-ID: <20251016165425.GT1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-20-b9189b3056a2@intel.com>
 <176061785811.3168.4643994654849150356@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176061785811.3168.4643994654849150356@intel.com>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: f6eaa7ed-c40f-4068-9d96-08de0cd4aaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LJJ/UmmoYTZGUPKFzqo8yBIAqjJz2xYLi6PjQKYlzMC1yESXQHSzi9FhOEMu?=
 =?us-ascii?Q?LkUca8pF50BpObM4CY0RA6BdNnIDypvanJECzLUIlWdWbGHzXtz9w1szEWRA?=
 =?us-ascii?Q?e+WC0Ej9xd9/NNQ7Gh0dKrQ1tM/yI3ApLq2Aph/TFZkBszT16jh3P6laioEy?=
 =?us-ascii?Q?v4is6ONLpY4BEOx2ryws5V9PFd5exA+lReQphFgdE5fGGMYayWXmzQW+4Opo?=
 =?us-ascii?Q?zqmDR2RiG8hypAY960HoaquFEb+2ClhdYwJFQvQ3wZ6PpKd+qqQSfSMcHQTq?=
 =?us-ascii?Q?nbx85MRpsQxsvUsdT+WQ10ktVK4OglPDyHYXbjBpkK6CaORRrD56K8Hc4GFz?=
 =?us-ascii?Q?Wxi+E+KJIXcLAc2lcLD+KEUgK0kXEkvjzvI5pqJXkG5MQnJcLJ79o/CUkvbP?=
 =?us-ascii?Q?lz7BiMMkmUa2sGHIte2xkiHSIUqquCbE2u2RMw7I9xkdEawT0xrWvmzNgkls?=
 =?us-ascii?Q?/zi9gigVbZ1W/9tdPFTesCmq8mVbBsZYX1g0xJrugbHR4r8PtalXH370OkSj?=
 =?us-ascii?Q?RMSiT61GM0xeTplAXvdCDD72L3km2PZWexNZOqTQ0Aij5C9f6ulVQK8XSDVS?=
 =?us-ascii?Q?b0922GjtSTvo0g+i9dsbgD2frt1LpJG8MwsZOvmEY7V1y3P8UegUJE4jgCny?=
 =?us-ascii?Q?JLIPlmvpcPEQIGH6iIuoy7kUsqijStDwIj7i+j0v3eyamqMxBNmGjQPE4T52?=
 =?us-ascii?Q?KoIYyT8NDn/XB0ujaqRpfQExxT3LRdYbaoKW0IZUpdooBk/2MzXqDlrEw1U4?=
 =?us-ascii?Q?pkx6bdxkL1HY5vGHrd5OsBudWPJFCsRJotOYF6rih+vmo8w7uBbpmjLWAPGb?=
 =?us-ascii?Q?0cLsFELjKBJNEFTgE3h0IMGZeTapC4aVVgZN4DEy43YqfJ3yNbAs/mfFImCr?=
 =?us-ascii?Q?zntEDU3eV76f+KEqHmEpWTw4pX13RLgQoJpjD/Y9fUcacoJVzh+w2ZySI2dO?=
 =?us-ascii?Q?uT5CqfF/Kk9fGsTIbgLn+YY/RqOJHGPviBTtGMw7MMgwvnHBtt+AjrL2sF1G?=
 =?us-ascii?Q?3rdfVL7Rob0p8K/2cb20CqXuN2jingvN7JyJa0LiCg1ZVWEXuDusAiyhwCOW?=
 =?us-ascii?Q?Jm60Bcq6qNHhaYxDc3IEpx3tapapHYLeIg79mFWqE19NFdr+rtAev7ra0iVh?=
 =?us-ascii?Q?Dh7zDmMZtK496KmeDv8zRPvHnCyNLolXkNnH15FotubwERca2/NSYhB25G0H?=
 =?us-ascii?Q?+vjmpBOFDGvw++l4BGv0vQ2XRZpeqA0uJIm6CPwvZKrdgNwd52SclI6HchtQ?=
 =?us-ascii?Q?yrQe/2W5EUSMAH6xvQrZ/GEND9I9MalLd7aj4LpZ35P1zjCig8gatDsM2BWh?=
 =?us-ascii?Q?kYWC9sV6U5Q7tZTnmMSMdUhZZA8on+epJDrTRre7eqBmzBzxNCddwi0U+L9f?=
 =?us-ascii?Q?+8Lniptpb6PwMJgrEGIMHFlcAYUILJcNdXBBgWcTnMIoBjouzRlm/zgxbmtT?=
 =?us-ascii?Q?k0dyKf6Em8lKezNSWSbOY40BG+8UL54M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8iB+3RzIwYR7hYXw1o8eidER7ES6q6waJBoOmnzFecMIQvPkqnffmtv2DcM?=
 =?us-ascii?Q?TsnGTYDBh08fFfKA7FEn3aJHigNkypOTDieKeFj2l31OrWZf628oZWT10n9K?=
 =?us-ascii?Q?96cjfXlgwMJWWEFRhy+Fqp/WxDDoeBc/EXjdxeUs6JzQroVUKuCHD0+3f/Pb?=
 =?us-ascii?Q?TjZyv8h0CkgcIu9HG/ut2d6s+SwDCEHvA8mwMZzgzYw3HmEWTMlSRFrIaMMH?=
 =?us-ascii?Q?SaS4y6rJL4YtPEeUe0wrYSMegbAqRgLLkUe1D9kxF0BFkWYd99w/AUu+tEmJ?=
 =?us-ascii?Q?7eOsF6h86oe/j9CoCq6KKMnZG3BDH9NnOpE5CUJga2624bfRKF/GYR7bUlio?=
 =?us-ascii?Q?WwgN53difRbYejhhM5qbLKgPX1N7qogKmThTp+04tYMwDlkwvTgu4tZEeNlb?=
 =?us-ascii?Q?GrpZE0bvuyiMm+xM8Zguaa4GqbVpi9wj/StIdT8/Xo7AHeWUV5sQ2sQRYMp9?=
 =?us-ascii?Q?X91G8ZPp2JOrIudrA6yorLDmrJyALdiTx/JHh9FFHdYMpJ4wjNS4wgaH65iU?=
 =?us-ascii?Q?r30guFCdUiTU8VC9o7NgO3hWLz2nV3ukNJsGgs086IcCxk9HLyKdINNljv6e?=
 =?us-ascii?Q?BAm16a3zZrnCBEa38n4Dl7h8fBXirIEf0dh5hGVoIAtrJDNZTssUfq1sb75g?=
 =?us-ascii?Q?tM535iCWN4pAWhTdmmjhtEBU/+QCmjH00t2FcwiFAlO4n07KQLx7RPZkfamX?=
 =?us-ascii?Q?PCkYvnPXzW2yTOVwgxgTLcgbNUz3hL8jZ2k8YkfSfaeoLA3gYWY9IzYqiI9L?=
 =?us-ascii?Q?IlNTvm+YFUaxGBwHNs5fY5g14YNYCHujAvx2PeuSrsau2uodDznkKIOT82P7?=
 =?us-ascii?Q?m1pidhNYfQPV/33BJbmsW09EEGdfwFsxVaxGc8ANn6yUoWT/Of8KPXaDxsOx?=
 =?us-ascii?Q?wJWkFarm9N3MnYaNu3NI1SXgcNNS0Xhmml+WtkgMjNXArh0HoZ3P6xvzkeN1?=
 =?us-ascii?Q?ipaYjWno9iilY+uCBibLGpR80b3qCZNhRJj6ahLM9Ta2cZ1iOJMkqzTpyi1w?=
 =?us-ascii?Q?7Xqlz2YqTC950nQ3KhlbRC5d8Pt0+t8yNvCBmgH7590ZkZLFexBJ7SWWO44O?=
 =?us-ascii?Q?xL8s0s4c6nZyxQ0DkNHDSDdooItAcnDEuC75dVMXPphlgdnoM0MdH33NV6Mq?=
 =?us-ascii?Q?4RVLo6xEcAOiHqsmlZ15jRw3vrNwduzZ7BawwCDGYVUxg5dP7NuKGpni93vH?=
 =?us-ascii?Q?Lvc0mvi09QvPoGWS4oDurSGW2tuM5GuLHu4BO3kiqXmjSbpTUq+z6MCaVOwD?=
 =?us-ascii?Q?vrzhXY9UmylotiqtjlyPsjPufyXdo17D7JSh1+PRvcnXKpRlEaqUxkTqFcX2?=
 =?us-ascii?Q?YNm/bpprrc0hh5KsMaLcJJqzJSE2pxT08rEWTqEHvyze7C35YpG0CtdPr558?=
 =?us-ascii?Q?QoXPY8hPhVZ+xyxd4dSI+lkdoV1Fm2mRIcSnHQQyQplNEUCulkx73AIGysQD?=
 =?us-ascii?Q?+uqsDmRn1Qp4Tcgp1awejoY+sWX+GRnfIdKf3gaxwSDN5+ds6P4HV6cgpJ/5?=
 =?us-ascii?Q?XLiCGBI5delV3WrKtanPJ5TiyR33BcJXwku8mmFHYxj1M9fokSgQLku+QiEj?=
 =?us-ascii?Q?As82kLSJtFYViTeJZvCnFdaMoAet+BI8IAA1e51Y3YVrZxTN1rmLRLOb/64x?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eaa7ed-c40f-4068-9d96-08de0cd4aaf0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:54:27.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKQUk7v1vrH0kNxhH62JQfjKOeKj6LY+8RzjH88XUS4ierYqKVtN5GujHOtsK3M+iZKVSNyCPxYPvhL9akrlhAAU6jcPp13ufOS/WjAvdl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

On Thu, Oct 16, 2025 at 09:30:58AM -0300, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-10-15 19:06:35-03:00)
> >From: Matt Roper <matthew.d.roper@intel.com>
> >
> >The compression overfetch tuning settings only apply to platforms that
> >support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
> >compression) some of the registers being adjusted by this tuning will
> >not exist or may have been repurposed for something else, so we should
> >take care not to try to program them.
> >
> >Note that our xe_rtp_match_has_flatccs() function will also return false
> >on platforms that do have FlatCCS in the hardware design, but have
> >compression manually disabled in the BIOS.  On such platforms the
> >registers still exist (and it would be fine to continue programming
> >them), but they would have no effect, so skipping that tuning is also
> >safe.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> >Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_rtp.c    |  7 +++++++
> > drivers/gpu/drm/xe/xe_rtp.h    | 12 ++++++++++++
> > drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
> > 3 files changed, 25 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> >index 66707cc89ec97..ed509b1c8cfcd 100644
> >--- a/drivers/gpu/drm/xe/xe_rtp.c
> >+++ b/drivers/gpu/drm/xe/xe_rtp.c
> >@@ -378,3 +378,10 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
> > {
> >         return xe_gt_has_discontiguous_dss_groups(gt);
> > }
> >+
> >+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
> >+                               const struct xe_gt *gt,
> >+                               const struct xe_hw_engine *hwe)
> >+{
> >+        return xe->info.has_flat_ccs;
> >+}
> 
> One possible issue here is that OOB RTP entries are processed before we
> call probe_has_flat_ccs().  Not a real problem right now, because we are
> only using xe_rtp_match_has_flat_ccs() in gt_tunnings, but this could be
> problematic if in the future someone added a
> FUNC(xe_rtp_match_has_flat_ccs) in OOB rules files.

I don't think that would be a problem; xe->info.has_flat_ccs at that
point will reflect the architectural availability of FlatCCS, which is
what we're actually trying to test here.  The value just won't be
adjusted according to BIOS settings, effectively removing the caveat in
the 2nd paragraph of the commit message.  The only problem would be if
we had a workaround that specifically wanted to check whether FlatCCS
was enabled/disabled in the BIOS; in that case this function might not
work properly.  But I think that's a lot less likely than
workarounds/tuning like this one that need to check the architectural
presence of FlatCCS.


Matt

> 
> --
> Gustavo Sousa
> 
> >diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> >index e5b8a9452e29e..ba5f940c0a961 100644
> >--- a/drivers/gpu/drm/xe/xe_rtp.h
> >+++ b/drivers/gpu/drm/xe/xe_rtp.h
> >@@ -491,4 +491,16 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
> >                                                   const struct xe_gt *gt,
> >                                                   const struct xe_hw_engine *hwe);
> > 
> >+/**
> >+ * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
> >+ * @xe: Device structure
> >+ * @gt: GT structure
> >+ * @hwe: Engine instance
> >+ *
> >+ * Returns: true if platform has FlatCCS compression, false otherwise
> >+ */
> >+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
> >+                               const struct xe_gt *gt,
> >+                               const struct xe_hw_engine *hwe);
> >+
> > #endif
> >diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> >index fd58ea5e78bf6..7c140d8cb1e07 100644
> >--- a/drivers/gpu/drm/xe/xe_tuning.c
> >+++ b/drivers/gpu/drm/xe/xe_tuning.c
> >@@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >                                    REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> >         },
> >         { XE_RTP_NAME("Tuning: Compression Overfetch"),
> >-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> >+                       FUNC(xe_rtp_match_has_flat_ccs)),
> >           XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
> >                          SET(CCCHKNREG1, L3CMPCTRL))
> >         },
> >@@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >           XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
> >         },
> >         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> >-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> >+                       FUNC(xe_rtp_match_has_flat_ccs)),
> >           XE_RTP_ACTIONS(SET(L3SQCREG2,
> >                              COMPMEMRD256BOVRFETCHEN))
> >         },
> >         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> >-          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> >+          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> >+                       FUNC(xe_rtp_match_has_flat_ccs)),
> >           XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
> >                              COMPMEMRD256BOVRFETCHEN))
> >         },
> >
> >-- 
> >2.51.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
