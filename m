Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE93C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 20:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F8E10E064;
	Mon, 19 May 2025 20:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCp0zGxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404FD10E064
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747684810; x=1779220810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HJoG6qKFjpd10GjoTWoY0FtbcciSUjF32Q/aBEAwPEY=;
 b=FCp0zGxgbhZegx3P1pFjpBrw9QVSxXT5Wu5uO3BaKDgbtxogckujQfzo
 ac77F4Oxf937qasBVOVcmQ/EXgWEnG2RRxuhmof74bpffNY/txDqJGlVy
 eteY4zY2LjD/RxSjPIvZ6fRHLc+x28KDhQgoxyNBrQoIp7EY/gMgTe6q+
 rmrXqEdVRHMnCdku5YeV/sUfdmHhwebaYBUXNcbsjSstw1CFhZEQNpvHZ
 zqxCU6HI3DVY0+2WyG+CYCijzzHGG4eFhVcbPStb6txP3z5yq5lanKPGh
 13XRkblEL1N4oVVpvP/0n1+x3n5yYf5waRNXv1QoyPB3ao2Yjq9u1ws/X Q==;
X-CSE-ConnectionGUID: 21qqUERASMeEvYTyfSz3yw==
X-CSE-MsgGUID: zzPY6iwBQ3CCmbsEmtPixw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49298056"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49298056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 13:00:07 -0700
X-CSE-ConnectionGUID: yjDg10RgQXKXOXwO+dZJ9A==
X-CSE-MsgGUID: SRQ6fH7HTFOjELE3BQjLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144461623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 13:00:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 13:00:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 13:00:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 13:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=desS6ZTkGEbzFvAXdTqCgUjOiNurVCU5lfWJ7kX49JbguRXJqOXSqYrO/nJs8vrzr9E01a6SLXcMqyDe91+DsutVRCm3buludbE5s2ZBI371T2+sSwFBcA0Fzy5sDTpjnFgYNuS6mzqaP/E/5zrKXzhypxeJQG2Qk9tGmkGFTZG9wioQeg0rkO7VKAqg+1cG0faC05tsflIUZ3ELubd3kCFOgE5CCcKNfjqOTx8Lfbq7ykHDV79JoQqEUG4d8yU2j8AEJbIIORxPOC7kJct9iGvhJ0MFpZg/UdQ4K0aBY63H/mDFPO1hnc4wdKhduUNfiNQAw2fCD+KHph1oRX4lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX46YG+zyBKtZpWLJ7F0FTk26iMp9nxmbe1vG5XhDCM=;
 b=dwopqp3n6z+pIiwMqLIh5+GMReL21g8+HphSNUaXyNgd3v+54nAhs/qJcmGDrHgReQ0zcEyKP2DBiJhfky/bbGuXMOHm4VPS+d/HnLUDxLjPw7Bg03MLkf+V9yRo+tddj4hxeDGfwxvWblcSzxaqJUScbZ/bpUOeDY107VapjcHUaL9eo7cs8mBa0H/nnCjyKzhYfGkCdDPTnzDfmyz2KBs1nZkaGdlKXj9J60XmCTACjPi7XUriOo9S1uPLCVpgy+Y8r3ZhDjFe8eQ9W24J+6ApArtJuYrnusOb1FdjBenqdaJeTt2wVBO/5aB34T8IbXwZ/ZtVDiG4UeVoxoSoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 20:00:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:00:03 +0000
Date: Mon, 19 May 2025 13:00:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 2/3] drm/xe/xelp: Implement HSDES#16010904313 workarounds
Message-ID: <20250519200001.GR5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
 <20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com>
 <c49b4778-e0a9-4aca-a09d-05b4d566a562@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c49b4778-e0a9-4aca-a09d-05b4d566a562@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: d293ee5d-6c90-40ca-9901-08dd970fbea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s3w8mdCIA7JCdjo0WmYpqM64ga65D1ifneGFTnp/GsXRKtf/kuXLZLkTaBfn?=
 =?us-ascii?Q?1YhgeEI8L7V+GR/yd0WQDLqPa7s/tpEPU4s7xwv1KE/NgidonEUevjalF3q6?=
 =?us-ascii?Q?ZHxNRIIxUiDLrY8RmYtJO+dQymjP2zhuAwR9dHbG1nN8T05PZMA09lGLnqEK?=
 =?us-ascii?Q?eLSzFboLJCv2nGxcCLLlTdCOvMJbG4zgE3QXrHNe+IvvF3OKPRKcdZWdmScL?=
 =?us-ascii?Q?piDHlc5/LYK1G8WfWWzV+sNlOfOYHwhIgDzVMq5pGUj/4usLLJHw6IOcixQX?=
 =?us-ascii?Q?nWhwLq0yjHs+CGmUQKZ3f0X7XEuf+yhn8aGkoF76NuBLuutN+BQtvqq992N+?=
 =?us-ascii?Q?02Sv5OGRGlbNYybAV9n9uGMacn5TP1nZx28uc182wSjovlt/NQNqRzM7IPFj?=
 =?us-ascii?Q?CBcTCnjapOsLMnHrg4TM81CH6cjoyfPxYUQFKRfz/QBuUAMSEJ7K+Pdj9msr?=
 =?us-ascii?Q?00O6FE/ch3LWVhu1RDZ1Nu1bK89N2Y/+7QJGj1VyTpRIO0kcT5YKGafyhOr4?=
 =?us-ascii?Q?p+4shXGLyGbmAEY/Scaezt7BYMH48rm4oNExYHDZYyeg91o5SuaouItw17YG?=
 =?us-ascii?Q?hCEGJEeJPSvaF4UVeKo1zrICrW2l7cFhwj8Ou2GDrjHgLbHHfH69ua4xaKpC?=
 =?us-ascii?Q?gWw1HgOCzZIvIiIn0SCgFe5oaRJGJ8/sPOcQURJHTTFbvRQyJxHtCEdWxC59?=
 =?us-ascii?Q?8yAEN3OF6X2bc3FkECvNbBwfIjBgJKPqQt4hTv2M0gZFCXX1m+Foa0sRrnQP?=
 =?us-ascii?Q?oalVrzTszS03kLCtyIJsAejXutNqrYMf0qr0ENLHX4h3PQ1K13OgcDwaHX3o?=
 =?us-ascii?Q?Md0wEB+8H52LQ92PQG+Ru9255HxWMKNtvTKWxQ0DzmpM3sM/HrBYVnBRHaVT?=
 =?us-ascii?Q?IhwYW0U7aWYNEizIIbsiQ4dFggi1G7Gr6SksMyPZOm+pm0MSNEABhdH8Jp9R?=
 =?us-ascii?Q?CIR6SekJFSUixug+ohba8QMBD6gZ+Idnqdki1h5L5/uGCO3a7pN90g5QNpSc?=
 =?us-ascii?Q?C/fa2W3n5R+bnc0l7vGlLMjNqz/fWfGGErmlsCfXXvpKbWcxVSDfPaqPnxPw?=
 =?us-ascii?Q?luYuzenSXLqspPgX/lbS4w50vzx+DTH3f0KKV8PfqPMLsaRMNuUTGzW8QWp9?=
 =?us-ascii?Q?NazGgXqbGMiAIyqlO3n6AuO6WAQxjwmF51t2adkqbaHoDruITl2YZJscNMy3?=
 =?us-ascii?Q?i9aZUsdXvyKGHfBO7wn29bab2kMwVjNJEVP9xWAVWYkukUCyhrWKFjCh4tPN?=
 =?us-ascii?Q?sJQrQ0WmNWmSkrs1jjAR0IxsBziaodg+5tGUGqsvr0FoFgcXiWGIxBLDyGEa?=
 =?us-ascii?Q?/qwhLVYtiYbaBy92QulbBm6tBTj/n1b97bbMfS3uGqcWEkiSWqrHXFG9aFQs?=
 =?us-ascii?Q?xaWpZ/vWQmyB1Th2iu8aUU9KywEbOWS8/iUDvH+e2LhHY7zS4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qV999Huq30wTsnryqSH916N+9lGNKYbS5qSJiiXnncu522Vr0wVvlu9jsSHd?=
 =?us-ascii?Q?PfmbZgx9bjEzpCzTAOxRKEhmG3SbMfVEw1riZih7kpVrWNq2TpYABFSMBZ6p?=
 =?us-ascii?Q?vyCzFRUi2H6RgtO0l/ShWgHwO7rom/f4sg3K84pHcnlcmPvQ+OcwN2cJ3XrQ?=
 =?us-ascii?Q?FcK+mnnXXkAvljPxAEOOpi+/IRZrxezRcHLMunRL5zz6WsNeUb/a49sSHCP0?=
 =?us-ascii?Q?s8fKOaBsrNp2V2pvJgl5rtT9toz76wvi0u1ZSFskykOWFSelP0HelYwh2pFz?=
 =?us-ascii?Q?KCePs6boHttMoZdWGZc8mADDz5Rw3OVI8KBaRxnK97XMfPrn1zSxuv76tcLw?=
 =?us-ascii?Q?shlQeohjyZJLkOa69o3J7QMQ7yN8UHKHWTmSxX78odPHvfTESVYGD2qHc4Te?=
 =?us-ascii?Q?D6GSJblv+DrsTq4njYD7q0bVe3E/6JE0NkiH8LoClcX43flQlwWpEFTUgXfZ?=
 =?us-ascii?Q?v5Q8vesRRkb2epni1FneSfdGAS2RZ+sRyXgoqM1xSKMp/rwWALlFgCL6VuL+?=
 =?us-ascii?Q?aP5UgbZ69Wup8T2b0O7Td2Lxqva3Fv10CGLMQ4AQ01alfbrdMopJH1twKE7O?=
 =?us-ascii?Q?w5a772BkK0dYCu58b7TFfydJgZP8q7QmbPWlVenNAixYksdebF6HPag6imox?=
 =?us-ascii?Q?/6u45V2ZW+VeoYrcRwzdzWoAbCfwEj42EBmwfloiisfxzgWJUiF2/gHls9YA?=
 =?us-ascii?Q?KRrz3X2MVUK4JAb4xsa4fdTInz+rrPrI3wt0Mw4DxP9DcTfJ4VCgN1bhFQtM?=
 =?us-ascii?Q?Rrmq/LWbeA4EsRsHGj4ZZ5xo3Mbta5LuRJ8Q9Sbl06rxNQ7/LoG1hzP5JeLZ?=
 =?us-ascii?Q?+g2bqV2HIrBnImaATA1akU7LTw7fDb1RV4S2YWlbKSQkxRekz08yhutr4EiM?=
 =?us-ascii?Q?FUU3acfmVx3pJnFf9MKlmXlTaPOdQ5U8rrGsQOeTDH2uUSxkBXYyG2tt1I6F?=
 =?us-ascii?Q?gBZiXNfD651wiHCmxwYVszwp9DnGysL/LYDZQ9wBREeHJTV+47RF+w7Miek7?=
 =?us-ascii?Q?pLjTa/nBHDZ+5zNzwf22HIGVkzBWvoKSSZivXDUoLONuzDzcY2KupW6y1PtA?=
 =?us-ascii?Q?ClvS5WopNr1RQ36ngQ6m9Qjdrn8RvLvMfSnFvbV95E/oPTj4FJ9VIb7s79jb?=
 =?us-ascii?Q?cK4Zj0WTAQyoKWC/AyUtL/J37/Kxt+Z6ZTovt8NceexbuP2TkX1nY1aRkCwm?=
 =?us-ascii?Q?rEf/Zru4UsWE+vd5ZPSb19+cbm/tkUiAgh28W1R9pf/g1W6zQsvnHXe0o4oT?=
 =?us-ascii?Q?S3m84CtggzxfSNna9biRp9VSXLYvMospu/kJ2pylcAfJ3wKr93BBEMDdnZXU?=
 =?us-ascii?Q?850GkAgaN75hWwxc75nzlKvDlsrTGLQ8TDl9BapeOHwR7jBVEn8f6Q690OdQ?=
 =?us-ascii?Q?6SsPY6k/GkfikmnG1KvAh7DY+dwGehXBZ92QiwFUEopo+Oprs1/iy0JSqINt?=
 =?us-ascii?Q?lO3gr2SSjseTmv5gmbypiNtKylaCmh9pIRiX8k8FdVWcdSQgN/wI46/eS5Nf?=
 =?us-ascii?Q?291wNKKXRtoUz+vcvu4HMMZryquqIACUOTb/9S5fBEq+o87xCZ59pMRUfOTC?=
 =?us-ascii?Q?cHIsVWR57xtPt0LBTJu7YS38rZbOVMLvbx/KR3HvtECty2zQrtZA7i1ISKjx?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d293ee5d-6c90-40ca-9901-08dd970fbea0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:00:03.6731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeqRfsWteb3pPlPLz6vCg0h/k3gR4hIGqQwFcCUN6clPRBBX7Tis5EzwMxaU6OAci3dWQPwfg9ao1wALZ2d3Y2gkCWbGqXX8CyKAc+8Ik9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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

On Mon, May 19, 2025 at 09:10:51AM +0100, Tvrtko Ursulin wrote:
> 
> On 16/05/2025 20:00, Matt Roper wrote:
> > On Fri, May 16, 2025 at 08:44:11AM +0100, Tvrtko Ursulin wrote:
> > > Add XeLP workarounds specified in HSDES#16010904313.
> > > 
> > > To do this we add the context indirect workaround page to the context
> > > state and set it up using the i915 as the programming reference.
> > 
> > We should probably split the general indirect context setup/prep into a
> > separate patch from specific workarounds like Wa_16010904313 and
> 
> I considered it but thought someone might complain why I am adding unused
> code. Anyway, I can split it out, no problem.
> 
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
> > >   drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 ++
> > >   drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_lrc_types.h        |   3 +-
> > >   4 files changed, 125 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 7ade41e2b7b3..d1d2592e010d 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -75,6 +75,7 @@
> > >   #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> > >   #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> > >   #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> > > +#define RING_CMD_BUF_CCTL(base)			XE_REG((base) + 0x84)
> > >   #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
> > >   #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
> > >   #define RING_NOPID(base)			XE_REG((base) + 0x94)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > index 994af591a2e8..82723f9783b1 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > @@ -12,6 +12,8 @@
> > >   #define CTX_RING_START			(0x08 + 1)
> > >   #define CTX_RING_CTL			(0x0a + 1)
> > >   #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> > > +#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
> > > +#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
> > >   #define CTX_TIMESTAMP			(0x22 + 1)
> > >   #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> > >   #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> > > @@ -30,10 +32,15 @@
> > >   #define CTX_CS_INT_VEC_REG		0x5a
> > >   #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
> > > +#define CTX_GPR0			(0x74 + 1)
> > > +#define CTX_CMD_BUF_CCTL		(0xb6 + 1)
> > > +
> > >   #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> > >   #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> > >   #define INDIRECT_CTX_RING_START		(0x06 + 1)
> > >   #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> > >   #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
> > > +#define XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 08835e36a60d..6022068ce6b6 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -39,6 +39,7 @@
> > >   #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
> > >   #define LRC_PPHWSP_SIZE				SZ_4K
> > > +#define LRC_INDIRECT_CTX_SIZE			SZ_4K
> > >   #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> > >   static struct xe_device *
> > > @@ -47,6 +48,11 @@ lrc_to_xe(struct xe_lrc *lrc)
> > >   	return gt_to_xe(lrc->fence_ctx.gt);
> > >   }
> > > +static bool xe_needs_indirect_ctx(struct xe_device *xe)
> > > +{
> > > +	return GRAPHICS_VERx100(xe) >= 1200 && GRAPHICS_VERx100(xe) <= 1210;
> > 
> > I don't think any platform/IP inherently "needs" indirect context usage;
> > it's just certain workarounds are implemented using it.  So it would be
> > best if we implement each of those workarounds through the OOB
> > workaround infrastructure.  Then this function should just || together
> > XE_WA checks for all the workarounds that result in indirect context
> > usage.
> 
> Ack. I was't sure if HSDES#16010904313 was an actual defined workaround
> given there was no marking in the code, just the HSD reference in the
> commit.

Yeah, that's the workaround's lineage number, so the proper name is
Wa_16010904313.  It applies to all TGL, RLK, ADL, and DG1 (i.e.,
graphics versions 12.00 and 12.10).  It also applied to some
pre-production steppings of DG2 and PVC, but we don't support those
steppings anymore.

> 
> > > +}
> > > +
> > >   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> > >   {
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > > @@ -79,6 +85,9 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> > >   		size += 1 * SZ_4K;
> > >   	}
> > > +	if (xe_needs_indirect_ctx(xe))
> > > +		size += LRC_INDIRECT_CTX_SIZE;
> > > +
> > >   	/* Add indirect ring state page */
> > >   	if (xe_gt_has_indirect_ring_state(gt))
> > >   		size += LRC_INDIRECT_RING_STATE_SIZE;
> > > @@ -974,6 +983,106 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> > >   }
> > > +static u32 *
> > > +xelp_emit_timestamp_wa(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> > 
> > This doesn't seem to actually match the documented workaround details.
> > The workaround says we need to do three back-to-back MI_LRM instructions
> > to read CTX_TIMESTAMP into $lrc+0x108C.  The first two are supposed to
> > have dw0[21] (i.e., async mode) enabled, and the third should have it
> > disabled.  I'm guessing this got implemented in i915 before the formal
> > workaround description was finalized, or the hardware people updated the
> > description after we'd already implemented the workaround.
> > 
> > That will also prevent us from clobbering the GPR register, which will
> > let us drop the restore_scratch function.
> 
> Nice, thanks for looking it up!
> 
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_emit_restore_scratch(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_GPR0 * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRR_DST_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CMD_BUF_CCTL(0).addr;
> > 
> > I don't see any documented workaround asking us to do this restoration
> > of the CMD_BUF_CCTL register.  I suspect the i915 implementation was
> > either something for pre-production hardware that never should have
> > stuck around in the driver, or it was hacking around some other driver
> > bug.  Are you finding this to actually be necessary for something today?
> 
> I am just copying from i915 where it looked b8a1181122f7 ("drm/i915: Use
> indirect ctx bb to mend CMD_BUF_CCTL") landed suspiciously close to
> 685d21096f6c ("drm/i915: Add per ctx batchbuffer wa for timestamp"), and as
> former had no WA or HSD mentions I suspected both could be part of the same,
> potentially security sensitive, work.
> 
> Would it be possible to search the WA database for workarounds touching
> CMD_BUF_CCTL? In case it has it's own designation which was not documented
> in the code.

I tracked it down; this was a pre-production workaround (officially
known as Wa_1607225878) that applied to A-steppings of both TGL and DG1.
It never applied to production steppings of those platforms, and never
applied to any steppings of the other gen12 platforms (RKL and ADL).

It does apply to production steppings of ICL (gen11), but that's not
relevant to the Xe driver.

> 
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > +			    u32 *cmd)
> > > +{
> > > +	/* HSDES#16010904313 */
> > > +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> > > +	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
> > > +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > +			    u32 *cmd)
> > > +{
> > > +	/* HSDES#16010904313 */
> > > +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> > > +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static void
> > > +xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > > +{
> > > +	u32 *start, *cmd, *regs;
> > > +	struct iosys_map map;
> > > +	u32 ggtt, offset;
> > > +
> > > +	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
> > > +		return;
> > > +
> > > +	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
> > > +	ggtt = xe_bo_ggtt_addr(lrc->bo) + offset;
> > > +
> > > +	map = lrc->bo->vmap;
> > > +	iosys_map_incr(&map, offset);
> > > +	start = cmd = map.vaddr;
> > 
> > Isn't this going to be a problem if the iosys_map is holding iomem?  If
> > we're going to build the indirect context batch directly with CPU
> > pointer accesses as the functions above do, don't we need to do that in
> > a separate buffer and then copy it into the iosys_map?
> 
> I thought it was good enough for now given it is only for integrated GPUs.

Your patch as written is matching on graphics version 12.10, which means
DG1 is included as well as the igpus.

Even if we ignore DG1, it's probably best not to break the iosys_map
abstraction for igpus (or at least not without big comment discalimers
on the code) because it's the kind of code that someone may reuse and or
copy/paste in the future to implement some other workaround without
realizing that it's a problem for iomem.

> 
> > > +
> > > +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
> > > +		cmd = xelp_setup_indirect_ctx_rcs(lrc, hwe, cmd);
> > 
> > This also deviates from the documented workaround.  According to the
> > workaround database, INDIRECT_CTX should be used for RCS/CCS, but we're
> > supposed to use BB_PER_CTX_PTR instead for RCS/CCS (both are similar
> > mechanisms, but INDIRECT_CTX happens somewhere in the middle of a
> > context restore, whereas BB_PER_CTX_PTR happens at the very end of the
> > context restore).
> 
> For 16010904313 specifically? And did you mean to describe RCS/CCS vs other
> engines should use a different mechanism? If so which for which?

Woops sorry, I mistyped.  For Wa_16010904313, the workaround says:

    For BCS/VCS/VECS:
      In the Per-Context WABB
    For RCS/CCS:
      In the Indirect Context Pointer


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > > +	else
> > > +		cmd = xelp_setup_indirect_ctx_xcs(lrc, hwe, cmd);
> > > +
> > > +	while ((unsigned long)cmd & 0x3f) /* Align to 64B cacheline. */
> > > +		*cmd++ = MI_NOOP;
> > > +
> > > +	map = __xe_lrc_regs_map(lrc);
> > > +	regs = map.vaddr;
> > > +
> > > +	regs[CTX_CS_INDIRECT_CTX] = ggtt | ((cmd - start) * sizeof(u32) / 64); /* Size in CLs. */
> > > +	regs[CTX_CS_INDIRECT_CTX_OFFSET] = XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6;
> > > +}
> > > +
> > >   #define PVC_CTX_ASID		(0x2e + 1)
> > >   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> > > @@ -997,6 +1106,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	lrc->size = ring_size + lrc_size;
> > >   	lrc->ring.size = ring_size;
> > >   	lrc->ring.tail = 0;
> > > +
> > > +	if (xe_needs_indirect_ctx(xe))
> > > +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> > > +
> > >   	if (xe_gt_has_indirect_ring_state(gt))
> > >   		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> > > @@ -1127,6 +1240,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	xe_lrc_setup_utilization(lrc);
> > > +	xelp_setup_indirect_ctx(lrc, hwe);
> > > +
> > >   	return 0;
> > >   err_lrc_finish:
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > index 559c7c831212..9ce7d02ef210 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > @@ -29,7 +29,8 @@ struct xe_lrc {
> > >   	struct xe_gt *gt;
> > >   	/** @flags: LRC flags */
> > > -#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
> > > +#define XE_LRC_FLAG_INDIRECT_CTX		0x1
> > > +#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> > >   	u32 flags;
> > >   	/** @refcount: ref count of this lrc */
> > > -- 
> > > 2.48.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
