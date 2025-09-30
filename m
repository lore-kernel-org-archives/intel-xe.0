Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E15CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 19:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239D010E2D7;
	Tue, 30 Sep 2025 19:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOC2CWDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD710E2D7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759261865; x=1790797865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LhV3OniO3czIde4/aOH8U941Uv91/kxLI0GCb+ktmQk=;
 b=JOC2CWDqTMtO1kEb5ZlIyUU3LZ9e1KFxbm6MYU2a5Uer0FeAlK3QC73P
 c7OpFcPc06x8I4ym4wr1Z972LsNMpsq6gvanTuoqou/NbC66rY8q0Kp2I
 06QphFBHNGGgMIYCb1251WIDn3ZKmjI8yTmQNT0xsiJMLYiK9pDwJFbkH
 6Zj1dl02LoeIWrJCz+2fnWUJ8t2fj32echpothRbL8DyeeiTNIOR+dsGp
 x2fB6uROBGAzZ/OGJmTT+6syZaWlmBr5f9XsttqzfonwDtCugOUBq8Qps
 NX9GRXZVUnRTSTwvJMzCzBCZwioSUDg33BQxUcG/zEHyPQ+d49fypK/1E w==;
X-CSE-ConnectionGUID: O0zAVckURcurbKPcyCaWzg==
X-CSE-MsgGUID: WsXefJ60Qpa268r0f9zgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61420954"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61420954"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 12:51:04 -0700
X-CSE-ConnectionGUID: ryRdEHbJStCoel3SNuR/AQ==
X-CSE-MsgGUID: QpyTRVmCSomzhA+vcRZLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178193565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 12:51:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 12:51:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 12:51:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 12:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp8ovrrD5zEAUyRvsoFhxZU14pYbAURTli0SG7mRs/xHJp7cMzieQcX92XjfPFHkWNp9+tK08392kcRGSTTA2e+7YuCxkBsxYo5FH0TfzqECmPRmDGc8D7xsSUHl/SVr9Szp2UtuQ+auN1YPzDy7BqiZQCI7ivYAcGeQmsbnCO6Pacoh5I1+mltXNwzlwAY2flEIzdyPDDG70/LKJ28+RWRzOHViOdHShmBlXqmYBPl1qk9KznTouVuc+aeYnPbOoC8Ujq0UfQsSWAT39sAnSIJi0dn/1IfcJRMSq7jIGZc0mIETpQ3cVloCWwWz2zDCETYN6eTo6hwXe9yj7QkNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfIfy0Gy8vfktYceqZZiZSWJ+fNMUq+kw3IvxeMSkbI=;
 b=mt+H5GOWZfsUldvpSvQVnxXEQxso7EX6bKuE7ssuY2SC58mDgO7RV2gdj4K25HK3aSYRC35hyNR7QMOKZN1hfOsJIImPtLsmKsqDpPvsoQojm/QrKHdmk5m9bgM1to709EqgFA8ISJ6SAQONJt9CdwijzkebV9xtsC3skWvPhckRb69DhY4QZiAVI5IwRGTF5Rhz/5t9SKxDFJIhenuPUIxkAgG/ow/4qZeWvb+UYOxsRc62q2puRXeGlox8dPBjCETKfDjwjxGz0jMRGw8M6PDx67cPfIY2D09l1Lc1WW13d/iEBAJa5PxkdrxKamRoLKRHH+irbSIp2k9i4VOk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFFCD58DF03.namprd11.prod.outlook.com (2603:10b6:f:fc00::f63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Tue, 30 Sep
 2025 19:51:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 19:51:00 +0000
Date: Tue, 30 Sep 2025 12:50:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Message-ID: <20250930195058.GB5409@mdroper-desk1.amr.corp.intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-32-matthew.d.roper@intel.com>
 <SJ1PR11MB6204A152184AE9D2C4A0C5D2811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20250929212549.GF10167@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB6204FE23C2E49E378DE08B1C811AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204FE23C2E49E378DE08B1C811AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFFCD58DF03:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d3e9ba-2b03-44fd-95a2-08de005aae5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tXWEODkm2/eiuXBWxrHZCUmHewxAEjNkpCyB/3FZyazpASpZtMmNN0xKN/W9?=
 =?us-ascii?Q?KyMpup2VtJoplsbJc3ashLzrNvgYfnOU0HB3FPM6ChNb57qGz2De77uF21ZG?=
 =?us-ascii?Q?ttVV7UakIrJdCtGAU116e3FH0fz4cyoqpVbGj+Kt5dnHkpTqERjobNhMjHuN?=
 =?us-ascii?Q?I8oqnryNc9cQRu7//qlwnAC9SXD4yhJAZGI6MiAGoResa62yPM+dHAeyqvI8?=
 =?us-ascii?Q?tVF8Gw2eRX76z4SwPLIZZ3Wj0zGjxwMsl5wBCh3OtYOQ4+R4cyuc4cUwkLfO?=
 =?us-ascii?Q?8XUE5JhQi4DDc/wTR8ZhhATh8/xpugnKAj/zpsSMIytlX6vCO4byg9MMGM8V?=
 =?us-ascii?Q?wUOJP0yn9idoJ9goNFUz/wUkKuI4cAKX9A6qDJh1L/PoeH9cjUWBp5OzQDWD?=
 =?us-ascii?Q?JF1bkXyBORy6VW+tIFvmvZQ6CIRzX/6WzA/ZHePnHLmCCS/nlqs5teKFZZ25?=
 =?us-ascii?Q?5TvVYFiY8kEANemEvqUIl2uborzxaptbcyBAFRMdMilbb8ZTF3wAv52p2FW6?=
 =?us-ascii?Q?hsiNO8WV67wgXjh0O4KJbQb2A+8sU+A5mbbolK5sq8BSLGXr+jWEf14tCs4Z?=
 =?us-ascii?Q?GjlxxK857qSoPhvEIvYkhFp3J2dsXfB2SIzoVqJCQhdeT6tl00KLxXML1BfN?=
 =?us-ascii?Q?rRmAaHhAV4rmkyKAak7W7DNtzySXR79fEpcHTRd3+VYSG6k0dY3LCb8TJnvW?=
 =?us-ascii?Q?2socOWAHEhvOVGncHoBx8TD8vLKicfQM7SGoZjGynjTJPOlauaM23OSzM2vy?=
 =?us-ascii?Q?WJwYJGo5zoAWHfhkjRz+dGL+1LVRF7A0ppSIYCuQQbUUh9HocNbqtucP3+jG?=
 =?us-ascii?Q?uNgPMQGQZHPtQdopHme4WfL2p2bl00PSNNWiLXqAQralzs06JuFL3BnD14Al?=
 =?us-ascii?Q?sB6DXrs2v98SC5h9iI7Z2QjnqGM7B4jbzf1z2K/XIElqPgMdFn8MWlWZ404e?=
 =?us-ascii?Q?m7iYAo05zc1TKupywLEl9mymV2cKVKaMEHS7FHKDCfTT15x0bkwdNrS2/tw8?=
 =?us-ascii?Q?HrRb+zyTPUN/vuaOV06dUdpmqlDSl8kgfqdC68U4mBhzF/Vwn7By2Vt+OHHS?=
 =?us-ascii?Q?V4guE3TvpZBOBFGETek6838i6VEtRJrkicCCxyzRLjy68VxuJg+ZYhHTktKE?=
 =?us-ascii?Q?cQphinOA6K2PjQzBVv5ybHyjO2tprk18toA1YK0OzGMs9eUjFDN7fgJsaIkc?=
 =?us-ascii?Q?fEYU1Q8kaeF4gPhHUHbleW8/g8xmkAKbIEJzIvcl3OQnc9ZXKKC5fJFJtUci?=
 =?us-ascii?Q?K0OGr/66W1tu2OdukntoBbHUz9JsvylOhy+OmYBlAhvPjGI8q60WnbGflFCX?=
 =?us-ascii?Q?YbxWfgSMrE9eU/g+3Oegbuat0wZ8DPUIYlJ/vC/mkJ9am99tr9fTCw4gyX5H?=
 =?us-ascii?Q?3V0uZL1W+h2I/9by6GQ51aiu1P6RHc5Tah/oa6mIBBczIC1zryJB1FtnFDQt?=
 =?us-ascii?Q?Mf3t2YVNNQJ/Vz41Hf9xr8PaDvKiBX8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?keXoCNop15h/bkDtglkVuvRF6sUT71pyWjPK9WTJEmpwXXEWe4I8Qyfb1udU?=
 =?us-ascii?Q?oSBvH0kRlONqy9dvmQPphujg9p39ZsPD5MQWCuz+rhpru2QmwBRfNc7TPP8X?=
 =?us-ascii?Q?FarY8deeO03U1crZm+z7lbX/0pkWMy3KggTp4vktm8w4fIpG5N9oWPSyLMA1?=
 =?us-ascii?Q?i8EkzTbSyGHoNNoOqzOLTMCpPOstcZLbQgjtjTkBDWH0ARiBMePtkXupUzxM?=
 =?us-ascii?Q?9qHnQRpKJx0OOhs0hwROnqB2KQCSlMcNd/3ewWYKT4qAXSGZDvNmewPq7Wd3?=
 =?us-ascii?Q?62ihdeN40neSKOvLNmWN7sDOy+Y+Q5grb9CVF9oG7HyKGhU3E1vvPlWwU8vp?=
 =?us-ascii?Q?cman0Tf2hLUIcyVM9KCdMRAyXBQ1gGDk8sqBQoFHOA/rC/FoJWOZvwUN8dAR?=
 =?us-ascii?Q?/OpPewd4KlagpqYKP2UZeGhRe9Y1+HvsYzw0rb2o+Tfigceyc/Ur8lVA/888?=
 =?us-ascii?Q?HQTmVbONQVOCfguwG44IkOAF8eARa6p+VohfbEOEGD9NPnx/8N4/3kjDS2+F?=
 =?us-ascii?Q?rskHP8/gNVFDcIEdjdyJtgL1uqfgs04ufX6aR6/43CvfhS9/cUTfumqQjKHo?=
 =?us-ascii?Q?5hf7eadhK7rZ56kyQBceVipuLgSy2C/XqN+D0HPWp1AlAoIQ5sh9DoV6mVKR?=
 =?us-ascii?Q?6z4vhan1AsbmCCpmjiDO+q9dhGkBzyJudmkrGknvwAxK+n5770kUbA7GVSME?=
 =?us-ascii?Q?zya/PleMj5RPuiksgNNlYqc807zMZ55Pk6WR8wBgqoJL9UPWd4880auztlrT?=
 =?us-ascii?Q?mMTDnWu0E/PJjjXHUmvyHFoTHrrpisHttLDWg+Khyh4dCI+YIf6OTGjECgO6?=
 =?us-ascii?Q?X5yNnvcTs0nc9ny3HnP10blFK5a1LdcfUzsYctzKfkAVKtueBcfcr81qVtQ4?=
 =?us-ascii?Q?HfYNb+nLB9G9Pc9UcpJRpqlKrJ3uc/Trt/7bowzzDqDod5gya+SSR0l7ihHX?=
 =?us-ascii?Q?pkrWDPBVUVzhh5lvFSXaZ+kHIUSpG4+9YTLSUrCdtisYMQ/xdszqmzqALNl1?=
 =?us-ascii?Q?Q5wLuNhHK+6Oza/QMgQd21ym4uBAeQfmN+LRjDyrtsDB07veulyZOcy2Uf9B?=
 =?us-ascii?Q?crDFI5IBwsaJFXZQ+Paqu30RZ64CmuM3whf5L3YhtKssSI1PsxNM5nE0dxoE?=
 =?us-ascii?Q?SrlBEfIn6oieztR4ieVOrQX3WenqGazbI6ci1joEV+tdeRupyjhiCAHxNmyY?=
 =?us-ascii?Q?c586Ay5SFy3UJIEq1GJs5GxWC4b0oXLjVEV/QUTEdz+ih6ci7Y7Sr2/HpBW8?=
 =?us-ascii?Q?gOlpWZ59XzshlVvvRjR+CgH8IG2HOt7t5qJ1oVaFj2F/ZIi0iOvV+F6qWPjg?=
 =?us-ascii?Q?aUhWrt1BmFgG+5Spt+JUg5y8kkKG599s397ZbLHBrrQzJQKZ9Vfg+cNhQKkq?=
 =?us-ascii?Q?dQD6nZ7H1QgmrvZTsgSvfrMZhoZm9jPScj7JGJkdlqYFssBG8K0Eqh70jDB2?=
 =?us-ascii?Q?DjZQdz+++pPQjfUMzf/Qm9IF/kBLbCzsmali/i5YyrQGXnXWJ/RBS8H0VSrt?=
 =?us-ascii?Q?fvR5dUwrd1CHsQHoNN14bBCgTxSWgxEXS0ybSFEgUsRhAZ4WL9aIYraQY0DE?=
 =?us-ascii?Q?ShnL6SX1MT/2qJZr/gdUtb/6dX7FKtpxC1xjRjNVpzsJy7G77HHhhF/xlboF?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d3e9ba-2b03-44fd-95a2-08de005aae5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 19:51:00.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i+4T7Q6BwYAtGcw0JWdbgMIU3XUdT5O3cfmp3va30hc0mXgDoasF/1lv/bGzXAvKu6sgVbq45nFZfQkdp2NYPZOjUKU0O2GIym6rUwtZEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFCD58DF03
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

On Mon, Sep 29, 2025 at 10:04:40PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: 30 September 2025 02:56
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
> > GT is disabled
> > 
> > On Thu, Sep 25, 2025 at 10:50:18PM -0700, Upadhyay, Tejas wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > > Matt Roper
> > > > Sent: 26 September 2025 05:17
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > Subject: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if
> > > > primary GT is disabled
> > > >
> > > > If the primary GT is disabled via configfs, GT-side L2 and TD cache
> > > > flushes are unnecessary since nothing is using/filling these caches.
> > >
> > > Is it because PPC/render engine is on primary GT only? And its going to be
> > same way always!
> > 
> > The device cache that we're flushing here (sometimes called L2, sometimes
> > called L3, depending on what document you're looking at) is part of the
> > primary GT.  If we've disabled the primary GT via configfs, then nothing inside
> > that GT (RCS, CCS, BCS, etc.) is active or doing any memory accesses (no reads
> > or writes), so the cache usually[*] shouldn't be getting used or require any
> > explicit flushing.
> > 
> > We also simply can't access the registers (0xb404 and 0xb418) if the primary
> > GT is disabled.
> > 
> > [*] The "usually" here does get derailed a bit by certain workarounds like
> > Wa_16023588340, which cause CPU writes to VRAM through the BAR to get
> > cached in the device cache, even if the GT itself is sitting unused.
> > That aspect of the workaround is only relevant to dgpu platforms though, and
> > I don't think we expect to allow the primary GT to be disabled on dgpu's
> > anytime soon due the extra reliance on BCS engines for VRAM operations on a
> > dgpu.  On an igpu platform there's no VRAM, so no CPU writes filling the
> > device cache, etc.
> > 
> 
> In that case on xe, we don't handle l2/td flush for non-dgfx, (in xe3+ its handled by HW). So primary gt null check here not required probably!

If you pass a NULL gt poiner to XE_GT_WA(), it will cause a crash,
regardless of how the XE_GT_WA() condition would have evaluated if the
pointer had been non-NULL.


Matt

> 
> Tejas
> > 
> > Matt
> > 
> > >
> > > Tejas
> > > >
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c index 09f8a66c9728..bf99792e772c
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -1061,6 +1061,8 @@ void xe_device_l2_flush(struct xe_device *xe)
> > > >  	unsigned int fw_ref;
> > > >
> > > >  	gt = xe_root_mmio_gt(xe);
> > > > +	if (!gt)
> > > > +		return;
> > > >
> > > >  	if (!XE_GT_WA(gt, 16023588340))
> > > >  		return;
> > > > @@ -1106,6 +1108,9 @@ void xe_device_td_flush(struct xe_device *xe)
> > > >  		return;
> > > >
> > > >  	root_gt = xe_root_mmio_gt(xe);
> > > > +	if (!root_gt)
> > > > +		return;
> > > > +
> > > >  	if (XE_GT_WA(root_gt, 16023588340)) {
> > > >  		/* A transient flush is not sufficient: flush the L2 */
> > > >  		xe_device_l2_flush(xe);
> > > > --
> > > > 2.51.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
