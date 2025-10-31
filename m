Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F4CCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948910E2E8;
	Fri, 31 Oct 2025 16:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQgZ/jtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DC610E2E8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928845; x=1793464845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=70TSaLL1oPAmfEs5tXzj13VecOjjmTCEGah2Uxk6st4=;
 b=aQgZ/jtGRmcgAB+/Tuk3bmXTyGo2fVqi5PGQ9BrakjpxKjjWtFKFpOUG
 Q2arFVk+FXUu1FV4dDu4c55FTTlv+Q9/BiLpuNTeSMfckN6F9NKJM1xw6
 OG8ZMSsUGLGr3/bU0RvVHA/7gBxEG2yAo3kOCqzRjf5RpYMCZa6wXGnfK
 O87GeQdWOlQAwhBQhrjN2+W7G+IEdOKL+cbNTATbZFtayVZK5HEVbv5wN
 +hXwnysWP5YwtjMLxtT/Yqg6kXAjVFbtLyZuDRL7r+aDBnD2BFWas53ed
 gRXDALnaPDS/aJHow1+oK5gA/Rhf8gkzU1LOM2kFcjg0g89YpVkVXrNbC w==;
X-CSE-ConnectionGUID: 7ac6e7U6SlqFy2+Gk45Hzw==
X-CSE-MsgGUID: 7liZy5UpTt2ZhZb1rzR7hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67954605"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67954605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:40:45 -0700
X-CSE-ConnectionGUID: REjxaGQhTFSKzQ3R/mHeBQ==
X-CSE-MsgGUID: R0AxlxhcRq2R3FDiHLPWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186213758"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:40:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:40:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:40:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLxEAMYOC/A7mij1xjqPZFRH6GBan8133yTR6u83KMsrrCbmfdJ/sn+uoIo0oMgFEREoSn2t6ohyXhnzgs3rEJOC5kJg+wcTcLXqhskD+VnDykLuE94jbh5ehQbc6VTkw2otYDgde68/JVyjVSW069rSD2SlFeRNb47Yt198pxAUcdC3PKubr9fXWXXZHCIlkdXULULbDt8/VIiNsxOZu0YsNmbsbx5sTxAKBbSa/bDQg0hXhcJQ0O2QI6v4HPDqxNvnBQ9fHdgfSoFUF701ltpL1IggdHbRQhakDvhNuMFdfRkYJj4qfAkZxVukun3QlzqFOLWOGCXGwsByONX4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0n/1zmEm/y0sbcxwxkZmwhtR/FkD2YsEIMTe1OpVK0=;
 b=qMPrFEU9puk9ptaBJGjkEPyy29nRfbaCJ8WLRsnEXbM4Lu2nbMrOv1ZoRbMMr1tuJX6ZvLpRhwTtOEe1i1aBx2dQ/wn7S7+t6tqqtAkqi17eistpi+gOy3jgRn+2LlOwen9pmPt0DSCvPGoFzi/4Zl2efR2eOahJad3kTFCsMHXG5ZNcQnaiLlVAF8QQqf3Ez8hO6uv1UgrivSw7SLS/s3lC1evbaYg7D3RqRzhR9JpzC7Pr3+R42i/zFVNQuR9wDenSMcKiVe9yxDuoGvTxxkw9xLkAAtBIuc2139p+5ZgAYJhSLY5pL//ivIIoG8i+GKCDdtZs/uW6KqIWyc3/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:40:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 16:40:35 +0000
Date: Fri, 31 Oct 2025 09:40:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aQTmgc8CexOuoend@lstrano-desk.jf.intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
 <20251028035843.2488613-3-matthew.brost@intel.com>
 <aQS8RTAavQUlBQsl@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQS8RTAavQUlBQsl@fdugast-desk>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: cc72e614-78f1-400b-a992-08de189c3710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?UzsNlv9FEPDcfqMh8jfxCyD42ASgCIlFn0PysEETCeb98onSZVgiK0a+tL?=
 =?iso-8859-1?Q?lyqbSG67ug0uQUyii68wIFA8ArUcGL8kmy9bDczDvjs8oA3qxPFA9Wr+MZ?=
 =?iso-8859-1?Q?rSgysr6WElLeXTw5b/aedtE9OUJWNxJeGnID7za7kAHMd1gGYLwOnimifk?=
 =?iso-8859-1?Q?kC08GC2hIilv5eE4gYVNdwsypIs8ox2ZMyk9ZbUbbZfqJnbwBgWgmhL6Qt?=
 =?iso-8859-1?Q?N7GD5Z3XVzpJiVJRDPnRz8+DTJdUda5lcsArIsmmKYfKA8oN5eFhXXTzxQ?=
 =?iso-8859-1?Q?Hf5dsOagdskCwtChZWZyQf8KL2oWOHBJn7qmznVVEvgKpjV/EjL749v4m/?=
 =?iso-8859-1?Q?xfPoozgD60SigcYwn12yvuH4zynfWYcrzfm6geWwR0fRuSTmWvMkmKhrOM?=
 =?iso-8859-1?Q?E5VNWOit6Xhy1q0Tup9wZAMQog6k8XtrTKd5VxyRzOrUE5Yzb6c4Zvdt+n?=
 =?iso-8859-1?Q?FeeeEa331fNNbWmZERS3hs61Q/BHXwetn9Zw1+hVNWQK8wrOzfG5tMOOJ8?=
 =?iso-8859-1?Q?v6O2f92iCfkBznB8AhNcddR78yQsjfGrwXWBCMeOA7sxzPh51+YDnipAUG?=
 =?iso-8859-1?Q?tqfwN04Or2wvPOWuFRMUJJe2b+2FzNUkbJ/b1OAKK7ix+aYTZFcWLpRNk4?=
 =?iso-8859-1?Q?CGAwHbF67GHfG5JrHLj/GxMBShN2y3B7PlQCa8KMGwszQNsMvhot1KKstv?=
 =?iso-8859-1?Q?S+Ew7H3Hf6+Q0kOb3Dv6YthHa9+oii2yCnvWVsBw19RWUIPV+55Vnq8HL4?=
 =?iso-8859-1?Q?mA9YDTA+iRTQKKLv2c5WHGOP92GZVtLFkf8RZSJBaRjsXxTZ4wNHgat9ZK?=
 =?iso-8859-1?Q?K671do2/IYPHT8I5N2KsADc1gNHyUmxGO3m1HvtStF3HNQuMRSjGezwES5?=
 =?iso-8859-1?Q?AFzUMI8KoiMydXHxeMaQ9mzR7QUdxesXxMRAqdd7vQJ8MeIlsxIa/9KCcH?=
 =?iso-8859-1?Q?iy6DG7R8EOUNYIa0GiqheyGEW96VCxwYXpgXqoZMwUN1t6Q5Yj50z1sjgf?=
 =?iso-8859-1?Q?uR0xxgGY64CR1yOekeU422tKRqElokswWCKZf9bm+OOILUmy3ZJwyOfr8x?=
 =?iso-8859-1?Q?vMi2SNqv6wzUlzMLHJM32jTT/eMtflvG9c6KgepEoCpeuxfDP+V5C3EjHW?=
 =?iso-8859-1?Q?NJLYFT8nyH5ZFWXiLgH0dF+AIBlTJNsfIizif3vaoWAO7oG4pQftkhRVoK?=
 =?iso-8859-1?Q?lHnTw5BJ2H4kDSxBy0EmBqG6bDzKk/aYv6fKF4J4txiLrSh2kq1s2KmXzf?=
 =?iso-8859-1?Q?cpuR75h6CIs1SOgJ6LrPgGorlqgUh7CVXw2Xmp0hcyVIkGbQphuBWheBtN?=
 =?iso-8859-1?Q?51hFsV60mp1ZkyS0dwV5m7xP/AzaFVZ9rqR7M7I5Ygted8/06CEaw3DEUc?=
 =?iso-8859-1?Q?qnaubQ1yBYJ5R2sLZcoThssx+TtFPpu9yib1tuHN2Ajdx3BhEW2Hw32w0P?=
 =?iso-8859-1?Q?1UaKC11kt14Kk96KIYdVLdjjS3tHlQIAYbhLbfCOR0CV9xOHYVKJJ4gV1r?=
 =?iso-8859-1?Q?DjgFQqwV2FqGnStPddwZt2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7BnKCb1QQpTF04jiGkEzrxBhL6f+RmcVq5uFxwKd+uxEb3mGDasr/9hVGr?=
 =?iso-8859-1?Q?4LOvPpKbngmdGoakySUDuxiNbgBSTGYzDR7JenSb0cQ/jW9eeSxk8srwsj?=
 =?iso-8859-1?Q?7fYy93/rURBzzHV8No1oImMC5e4/5wP5y+fTEmLKdMHolUpSrSDPjiksQH?=
 =?iso-8859-1?Q?yDm3g6VekL9EjSKOdMK/N7QaHPoxxllg7IW1mUygfbdxCiVu1eUviWyrRd?=
 =?iso-8859-1?Q?kWmsnls1IXGDT8nb56jR6OiEpux+/9X+Rn6CInQtgO75PjgJ7rt2/drcZo?=
 =?iso-8859-1?Q?xWak+Tsv8kP1GP3zRXj0UM9b5Ac0Ehbxn6U8hFVSL/SJ8yJX8l1SDRea07?=
 =?iso-8859-1?Q?QyArtfYxcekcu1k8BHcdYoqr1lK9GEwtt6mqvxvcCHiBDOxYLkEH857HEp?=
 =?iso-8859-1?Q?p7ZCvB8EonIwFbzfTwTENauDYC4rBTW3cqGNjFCl+Cs7t2vM/z1LC988iR?=
 =?iso-8859-1?Q?pHkV9yFOXO8pFlu9L/FPVxPBzRjycCidmRDWzVvGyiDD+OiDNri0p0Tl+S?=
 =?iso-8859-1?Q?wsH50iZnl0/WwMvxsGftd0psEsJtPlxutA2tmrLgJ3xLReQQ4nJGDB5Q+P?=
 =?iso-8859-1?Q?V4s8wrTdCdYryyHXUNqcjA+pUoex8I9W1cjh+FzhcrwWkZJpIlvBr+EvQg?=
 =?iso-8859-1?Q?jKo3mdlPGiZEHD7ytbdePY4xP9agWR1yo0FGEUyCmjrX2SdXDcYBG2lE2L?=
 =?iso-8859-1?Q?TkFYmCBnfBmriFu01DCBT2jq8BOhHZiTkO+aFD4ovVfDrTjvI2fFrZrrff?=
 =?iso-8859-1?Q?dds9Lr8UY1VyCQCSFaSsQaCI9a2FlVKP3Lk2s6fIVCyLjRsTvwy1CtJfZm?=
 =?iso-8859-1?Q?PLhqOt3JfZI+6g+Jg8YdC75I+OezI8mIEKp6aYYZxCwUeHeLpG4yj6bFlN?=
 =?iso-8859-1?Q?vM9zoaWv541BOf0hvnGHNm2xi7eX6X/msz3CMPoDzAmdRQl2cgPM7+LO2i?=
 =?iso-8859-1?Q?3WQAdJ7pSHXxya8b4rfpfRDPBHjcuirpBKzYHWgX4awcTTAKaDXDbpDVsd?=
 =?iso-8859-1?Q?Mk7LKGCQei54BmfXKJmw382XbQdWE3JPY41nl5CmYDdpAMwOpj6c7Q2GbQ?=
 =?iso-8859-1?Q?yYyhot8YRFTp/5dVuoojDbHh3qLhqwACGx5KUfgshCfUuwMng8BXQUjhfU?=
 =?iso-8859-1?Q?DIVOfKNtQJcsm8Xxl53uabznKHojcrrtLzCDzgszLuiZJFQS4zsTeCRXxy?=
 =?iso-8859-1?Q?NOlOf2Qy0uV/wO+dRWF8nWy58amwRuEnmjku9W+IGsx3dQbE1KftMmn6nX?=
 =?iso-8859-1?Q?s37vPI77ivGParLvhU150ogfkIDSxgDwPzm8FRY61aqZzu4XUX1Riw2mDm?=
 =?iso-8859-1?Q?HWXthf7xQ43LWYzjALEsX1eKV6L1RIp52MW0FQqDX2/pbXWt+FWIaJMH3t?=
 =?iso-8859-1?Q?IYK3QL87vPV8rOEpt7eH3d/17zZ+pkn4ERWyAHtE2NQiBTRcSym8a4zKAn?=
 =?iso-8859-1?Q?5+c2fguIZm1PnKUd65R5hdOGLah/68LAdiViATw80f33YUazJwqgoVAqCe?=
 =?iso-8859-1?Q?BJuVxe7ukwAK/VBUCh/FBZ+Nv5PySUEQ4dIwPj+2FUmkgnlqzK9/qI/C/P?=
 =?iso-8859-1?Q?mVJxmZ/zeouBn8V86EC4a7LfxaRlvv2TbwspO0SPnkDtgsPsWJ/xYuASM5?=
 =?iso-8859-1?Q?5FOz+4NuUqG8ZKcXo+MNH3ej9V9PKI2VIUjgqzaKmAZcmrFhhXkw5utw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc72e614-78f1-400b-a992-08de189c3710
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:40:35.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMEvMiyzhxLi1ZfB9u8mmIQcskExWHWNL1EHEN4wH18R5XFE3AweVsvRqgcdfgODOyVBZXUrzc2Y7LVpFFgzJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

On Fri, Oct 31, 2025 at 02:40:21PM +0100, Francois Dugast wrote:
> On Mon, Oct 27, 2025 at 08:58:38PM -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
> >  3 files changed, 107 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 47f5391ad8e9..c17813c469fd 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -52,6 +52,7 @@
> >  #include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > +	err = xe_pagefault_init(xe);
> > +	if (err)
> > +		return err;
> > +
> 
> It seems these lines ^...
> 
> >  	for_each_gt(gt, xe, id) {
> >  		err = xe_gt_init(gt);
> >  		if (err)
> 
> 
> ... should come after those ^ otherwise the number of EUs in
> xe_pagefault_queue_init is incorrect.
> 

Yea, this version is busted.

> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index af0ce275b032..7baf15f51575 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -18,6 +18,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -418,6 +419,16 @@ struct xe_device {
> >  		u32 next_asid;
> >  		/** @usm.lock: protects UM state */
> >  		struct rw_semaphore lock;
> > +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > +		struct workqueue_struct *pf_wq;
> > +		/*
> > +		 * We pick 4 here because, in the current implementation, it
> > +		 * yields the best bandwidth utilization of the kernel paging
> > +		 * engine.
> > +		 */
> > +#define XE_PAGEFAULT_QUEUE_COUNT	4
> > +		/** @usm.pf_queue: Page fault queues */
> > +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >  	} usm;
> >  
> >  	/** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index d509a80cb1f3..43b26e7d090a 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > @@ -21,6 +25,71 @@
> >   * xe_pagefault.c implements the consumer layer.
> >   */
> >  
> > +static int xe_pagefault_entry_size(void)
> > +{
> > +	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> > +}
> > +
> > +static void xe_pagefault_queue_work(struct work_struct *w)
> > +{
> > +	/* TODO: Implement */
> > +}
> > +
> > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > +				   struct xe_pagefault_queue *pf_queue)
> > +{
> > +	struct xe_gt *gt;
> > +	int total_num_eus = 0;
> > +	u8 id;
> > +
> > +	for_each_gt(gt, xe, id) {
> > +		xe_dss_mask_t all_dss;
> > +		int num_dss, num_eus;
> > +
> > +		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > +			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
> > +
> > +		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> > +		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> > +					XE_MAX_EU_FUSE_BITS) * num_dss;
> > +
> > +		total_num_eus += num_eus;
> > +	}
> > +
> > +	xe_assert(xe, total_num_eus);
> > +
> > +	/*
> > +	 * user can issue separate page faults per EU and per CS
> > +	 *
> > +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> > +	 * without it. Follow on why this multiplier is required.
> > +	 */
> > +#define PF_MULTIPLIER	8
> > +	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > +		xe_pagefault_entry_size() * PF_MULTIPLIER;
> > +	pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > +#undef PF_MULTIPLIER
> > +
> > +	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
> > +		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> > +
> > +	spin_lock_init(&pf_queue->lock);
> > +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> 
> These 2 lines ^...
> 
> > +
> > +	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
> > +	if (!pf_queue->data)
> > +		return -ENOMEM;
> 
> ... and those 3 lines were swapped since last revision. It is probably
> too early for pf_queue to be used here anyway but was there a reason for
> changing the order?
> 

I was fighting CI and lost. Have a proper version which should work now locally.

Matt

> Francois
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_pagefault_fini(void *arg)
> > +{
> > +	struct xe_device *xe = arg;
> > +
> > +	destroy_workqueue(xe->usm.pf_wq);
> > +}
> > +
> >  /**
> >   * xe_pagefault_init() - Page fault init
> >   * @xe: xe device instance
> > @@ -31,8 +100,28 @@
> >   */
> >  int xe_pagefault_init(struct xe_device *xe)
> >  {
> > -	/* TODO - implement */
> > -	return 0;
> > +	int err, i;
> > +
> > +	if (!xe->info.has_usm)
> > +		return 0;
> > +
> > +	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +					WQ_UNBOUND | WQ_HIGHPRI,
> > +					XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.pf_wq)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > +		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> > +		if (err)
> > +			goto err_out;
> > +	}
> > +
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> > +
> > +err_out:
> > +	destroy_workqueue(xe->usm.pf_wq);
> > +	return err;
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
