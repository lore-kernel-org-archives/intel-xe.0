Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786ACA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263CA10E86B;
	Wed, 27 Aug 2025 16:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwqvQbOX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEDB10E869
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756313381; x=1787849381;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B1ZJbvsVtSeypZo2ZZg31zq7j2LPZ2yjCeFAkOV7VFc=;
 b=kwqvQbOXhRl4aoLJDiKkzAD3tGOyV+xNTpfy86I94DQQBwoekFXvw+7T
 lTHhHrFcBQ+tmxk3DM9Akp9DRFpW74PQ13i55BtLA516r6A9k2/J4uY9B
 C77J5u6FyppXROaLJ8/HTAA0G5PEtU2czU7qH8HjYidhapFGshquElRFr
 fxZr9nXXKEsUWzs1i6xKlx2cgzH6UXcoAt4nKaraP+HdkGpjxrFZsewBv
 1hLFUHeHBkatNHb++cK8zIQFkpJQ84MCX05IJPsc35mWl4IjVudfX/sBu
 rPXpnLD096Nl+7foD2MpsjqZSJWxpkhaQYHcOklhUa9heLL9RizuFkV0i Q==;
X-CSE-ConnectionGUID: gFjhmzauQuSOQxaDXjc47g==
X-CSE-MsgGUID: HoXqICysS6GEGKpq0omCrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61203946"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="61203946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:49:40 -0700
X-CSE-ConnectionGUID: WZebt3kMR8KE/gdpA6Ecrg==
X-CSE-MsgGUID: OK6sXf94QlSc6kmQIfHieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193536554"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:49:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:49:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:49:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AV+8kT5/++GiZuMnGCBscKxir0TKAdBcs4vBeUPqN2je0Tz0YtWKa4eNpU6Yn+s/DS58yTHkINa/TR45PHGGus7NvKoHQtBgSizq4fjg9npOC0/qc2h2QGvETWGGWi88CdCdDBURbnYlrkqjS3xWeQKPjDt9SVmBsPXHnRTVufc/tfCybSms+ptuRsksUciIosilT6qCLjqUlO13g8X0KdpHsgU9ErWHMcv+APOCJH5/TqAYZl6almcHVLQTAPw4yz3VQbYuJPLFdY2yAO1qWLcfoI3NBlXiXubnYGPoTXhpfBeBCboHHda9pPV2Jf3BlxpgRjXkGEpEIEVJ5jVmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C38lFQ2viwb6uWhdYr/02Im/nrVM5QZwgvAS/rGUY60=;
 b=CwnNp/dhP/Ee2O4i8mKk4NuD7CCnfDHDS57wh6w4+10etbmYXbfrBii71lrGj9sFW1KD6Z40hosWEidnjt11XZ/F4Bz/i7mwW537OvJM86xo2AqZtP7J6JAWox9GWJKVrH+wh48Qyn8ZDdyjxz4t7cEYg2HoETA1wf4sFL4sAO0TDW8NThufz9nY8P7LOtT9UDIj76QHADPrYAk5rFAR3sOm/YDPUMYwqqZfmQzlSubh4CnKYW7C+hJxATrX4t9yJGfQlCJH1DxiNLGUUUvGs087oTY0BF5QM0OKtfNaphyQ7xAGcNo5+dpt4A2VlqvT1+9R3kLJTDbPdDFrFcRKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.18; Wed, 27 Aug 2025 16:49:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:49:35 +0000
Date: Wed, 27 Aug 2025 09:49:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Message-ID: <aK83GpYkrYRrLr0q@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
 <aK8ypvkgu0lNWha7@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK8ypvkgu0lNWha7@fdugast-desk>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e5f5d2-050b-4ed0-76ae-08dde589b3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6SKzn0IIg163BC238aSR6I8NtyTM66Wp5QcCb8TiKDDB3JaTOFo07wdxzb?=
 =?iso-8859-1?Q?Z8Te7w0GPrTraShOII6xMUO1UIfl62yUObckWCo6ceVfP9kzqwouCijexZ?=
 =?iso-8859-1?Q?/py2UDSnw5haXmtcEGefEHs4X47Invox7zMQaFYEgmDafFKeEt7Dpj5cZX?=
 =?iso-8859-1?Q?gKl7GaGXSA0A/vzDK09TzAq0KuC7NamI9NyUcXCnO8ZfzHcbyErZeh4YXq?=
 =?iso-8859-1?Q?yN90hcyOL6kREDhg1f7tCFecg3pRkuXhHpzloFZGWQtgAYnyoaqTqFdCos?=
 =?iso-8859-1?Q?LHrR9rKs6CEQcjqF+Dq6I6tV+nUdTmn/19nvj/nb/rU8bsRCy2JbvEssAx?=
 =?iso-8859-1?Q?gSfDI3wqEMlrC1BQ2O6bR2G2xcbtYhbA23Q8hB7xVfgYOuwJuZlI/E+36+?=
 =?iso-8859-1?Q?BQ1Mliiob6xS63CEGDaE+kJXOVfraCjkjZaP9YlVMMYNZiMwpLB1d8uzlJ?=
 =?iso-8859-1?Q?eLZIg1Q+FHpEliIdePJasEf/gu6BfZlvEqTKZg1OWvG1xjGC1/6wjEVfpx?=
 =?iso-8859-1?Q?Vi3f6qAnEHVWip1q4ciIL+LbLVGvngMDmY7q3h/yH7k8yWOo/LRbsXMeU1?=
 =?iso-8859-1?Q?AwmDvb4X1oBpli+eWRjqpDLTJRhP1vrVOG4hRWWwk9oW3mRT9S9jy1Dxho?=
 =?iso-8859-1?Q?3CrMIUUbJylb5ZDSuYKcEIa4BxyQdZ4QH31lKwsYdAdRLQUpfi9Y423WMO?=
 =?iso-8859-1?Q?nC2eDtgJQmLJ60IOBnwfyGiLzHztXQC3oTLMJyjR+2rG6B5tygQuN8noiM?=
 =?iso-8859-1?Q?oaLu5IlEMRYz7x4YKt/CdNJGSp9jh2M3iKSlzf7f6HrKPfaOBBf+aageW9?=
 =?iso-8859-1?Q?Qp/8Fq9B/VIWOEOWnTdLbkWKA79clTnT8R2udIHTRmDfLYKTwnkHG03x9Q?=
 =?iso-8859-1?Q?MP7zqnUifT+02nd8qj+AzBsr0qe4ScgM8SlZiNhV11GEiNHWdMu/HOkUTQ?=
 =?iso-8859-1?Q?/J09lWqTv/+ONGp2MpUZHVISUDMdmYt6xE4ALpyEuA1Uszfj/VvcB/qQD+?=
 =?iso-8859-1?Q?cf3RuDMbzKlEY38G75/H0+7mUeYxG5tIzPEAVAivWKWdhXrRvwasEV0grR?=
 =?iso-8859-1?Q?JypsksTbvfXzr4EtBHuCA3cT+1P2CdZVAEc3w/v10aXsnD5wYOiPHi4I9X?=
 =?iso-8859-1?Q?VjcbZ1ZDeSyBFArKF3vTk8TlwcmQj3LYIbQw46ivRt+i/bIYG/GwIPVDhu?=
 =?iso-8859-1?Q?wSt54sQMxijdwxBMsX5+ZpFp/zhXPOoh8NehmC1UQA4JT4SgxqbYQclusk?=
 =?iso-8859-1?Q?jWf5LG4p4z0rwFylJvm3gxTDlUotQnBMhRu+CWKRJvTMBybXcY37Dcy3Jd?=
 =?iso-8859-1?Q?OMt8UNIVOCcg371lE6mS9xGGxFv73OH8IGmXfk3rKs53GIvnNW+Rnp3QZO?=
 =?iso-8859-1?Q?ioaaFA9eKOeBUzlMBzu4wmkicwN+hStUI4M2l64uK6J1YC/1EqiNifgxNq?=
 =?iso-8859-1?Q?5IydEmJvfuaGk0XPt2SZqqGhvreINgZTxvjC8t6bd8SpGCschQYwSpeAKd?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7u2P7oHc431TWYnTCRDsGTtknMH+B1kdwKeojaD+nl5On25374FmonAnA/?=
 =?iso-8859-1?Q?aGZYMOZ426h78fwkWII74lFI9QxOfrtwYDSfBsJ8n+vE1r3p5PZtgMgUhL?=
 =?iso-8859-1?Q?D1wzdEeCNk6vRnl5nH5aWINoeOR14p67JdUAIVuAdbwfhcFzWfFbXSRc4l?=
 =?iso-8859-1?Q?kIZWRxzxwx2qfCIDiMVJ2qpFmPooGq4JTDsA5eWG14Hpy3Y5R09hpmTOVJ?=
 =?iso-8859-1?Q?7BHfwLdQfJ+0oW2zNCGFGSknp6Ad3DhRiY84pTLru2A3LlWP89x1E0ivzD?=
 =?iso-8859-1?Q?j7zjVGAmCn0I1GkaEr79IGNFaG7PNXbC+NThAm5vUIcEox0A+hAt7Capsj?=
 =?iso-8859-1?Q?QNYrXGUU/piliW+SRDIKPE/sHbvMGW/+TqRR41ng9O5/SW2CsW8iisHcpM?=
 =?iso-8859-1?Q?WydJ5iquFtjK8tp8L5eRxNfkmPJ3J3pJu6nLcYXTaHKftTDJiRu4RnR+6B?=
 =?iso-8859-1?Q?wNhs946clBTqo+QJPgUj8iY+N1VoVSyQnElRdYYqjnyuGS/cSi/5gl5g3s?=
 =?iso-8859-1?Q?Y2xRvPovUyviEN0JTpr1L8+6IHmj34yWaQ+CMekPltu/7DBSw1xjHbz3rP?=
 =?iso-8859-1?Q?Pu6mfqn97kGT0/pU30xcbdBoK9uOFFJSt4Tb7upVHQDXr2P5POB9Netg8d?=
 =?iso-8859-1?Q?aHt/XNs5nwbkXKzO/CkgUQtYYIX7DuMwurSTzgv8XwFtC0rzxH4cWMu62Q?=
 =?iso-8859-1?Q?V+fflSzDfxfsIPWQovmr7s9XDVdBc82n9/avW/Svpi8gkiHVkKcTv3Uy40?=
 =?iso-8859-1?Q?ievvuTpqM3fMsgWy/sSptP/d0RBMS0KJJhyzsiLl4OP027/mR+DV5SyJ9o?=
 =?iso-8859-1?Q?Ulfm5P86TBIHzVVd2GBgz2D05n2mULRtcELBUBed4zV2b00LwKJnTtL1PG?=
 =?iso-8859-1?Q?VB23auiM3spql7xdYpna8ZADmFGRZR3WqvbF1ZrwufgXO+NJ0vRtCtOf9E?=
 =?iso-8859-1?Q?not5lUbWiCupWv2UGprgzzuADxtFPzZfJ6r3ph5LIQg+/pxDM4kCavKueo?=
 =?iso-8859-1?Q?RXWy1pxKJpIGzCZVQkKm7L8g7lWDThU4v2vy6kpvd5vl/yz0OZmM+cQUW8?=
 =?iso-8859-1?Q?BWtrTHl6ywHQ6UZaZ3gDs8Ga4Xym1Kg5otwMXj0lmIDuRFkTjb5dlfZ+6E?=
 =?iso-8859-1?Q?OTriBIEPJveREjgsGNvOIRd0aup43dx2M7cHzP2x6jsLuLuMUhAR+SkCzb?=
 =?iso-8859-1?Q?2WbJD3j6ImgHnw8k1Sgwz676x70GrtwBj3VC2LBKpSVtxgOEAJBD+yl2Z8?=
 =?iso-8859-1?Q?ipGqa4XiBmm0x9HfhQKWxiot/6MFuRZzzTC28juuDVXioTjct84lBZlXeJ?=
 =?iso-8859-1?Q?YDNM7z2q2GuLwP7ymH+nw9vQLroiYaN2+KkY7aV4rP5TWlG7f7P/PM7l1k?=
 =?iso-8859-1?Q?6xI3wUFbltoinuu3xMWV9FmMnbgCIAdR+mDkqu0H2zoUbMgqKgKtIdOKjr?=
 =?iso-8859-1?Q?87PZo8Skx5VE0MPfC5f47kJAJ8S0nPZI4Ox7MVugEFjHX2QwgrSqOtLHGs?=
 =?iso-8859-1?Q?sCVp0GXbKqlvq0h4w5Gt4QiWOms+ZMSaZ5n6OvMAquyIaC6CkmsY8RG3pm?=
 =?iso-8859-1?Q?6cLE7z8RiUObUAVAUCFIffFNUsLOFNEJEnvWgvmmsb22rpDAUOanKPbWyc?=
 =?iso-8859-1?Q?l8RCnFSOyxzned64LK4Q5W/fT7g8KR0Px1NgCxZK2J4csXxirq9bvhuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e5f5d2-050b-4ed0-76ae-08dde589b3cd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:49:34.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUbi19Je9jSiWuYRI8NX2fofcy4mbOTV28lBHSLZ7YMwIohkWdSSA8RbTxEb9/71hXHz3EDewEZf45l7burhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Wed, Aug 27, 2025 at 06:30:30PM +0200, Francois Dugast wrote:
> On Tue, Aug 05, 2025 at 11:22:33PM -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
> >  3 files changed, 102 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 57edbc63da6f..c7c8aee03841 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -50,6 +50,7 @@
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
> >  	xe_nvm_init(xe);
> >  
> >  	err = xe_heci_gsc_init(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 01e8fa0d2f9f..6aa119026ce9 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -17,6 +17,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -394,6 +395,11 @@ struct xe_device {
> >  		u32 next_asid;
> >  		/** @usm.lock: protects UM state */
> >  		struct rw_semaphore lock;
> > +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > +		struct workqueue_struct *pf_wq;
> > +#define XE_PAGEFAULT_QUEUE_COUNT	4
> 
> Could we add a comment why value is 4?
> 

Sure. 4 was sweet spot for performance with the current implementation
to get good bandwidth ultization on BMG. Once the THP device pages
lands, this can be reduced to 2.

Matt

> > +		/** @pf_queue: Page fault queues */
> 
> s/@pf_queue/@usm.pf_queue/
> 
> Rest LGTM.
> 
> Francois
> 
> > +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >  	} usm;
> >  
> >  	/** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 3ce0e8d74b9d..14304c41eb23 100644
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
> > @@ -19,6 +23,71 @@
> >   * with a single shared consumer.
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
> > +	pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size, GFP_KERNEL);
> > +	if (!pf_queue->data)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&pf_queue->lock);
> > +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
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
> > @@ -29,8 +98,28 @@
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
