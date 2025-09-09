Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0ACA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 20:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3615B10E17C;
	Tue,  9 Sep 2025 20:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmxYqyHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A0A10E17C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757449782; x=1788985782;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CA+PNOdxyrFN5iFC6UcX1vwXYIHG+IpT6wKy6oxyT5M=;
 b=PmxYqyHXI4zpkiKRTKgWhGmpQpMJWkeKD7J8lIBNRpLECeWzcbeTcSZK
 s/Q4khniKWgh9EqE4DvOEhoSVDTHXjd3RxUfKlo0zdnG67J+J19Ntl9x7
 hKsz+lJiEGB4hSNLn5jhpYS3840FnJ7zPVHyCkTkcCAzVKRJyW9UT9HxQ
 ujSui+RI0forXHpMQ//g5ZXVE9glRBNwExzRUXJoj6XGzAsWHScBr6TiP
 KMwOCzsU6s5yQbV5ihOgiL0waL4d/bmoMU96wrGN2YXTc1mlDNiaP+PPo
 Pmxt6aklmf/kZT2F4qh4sMj2fR7mE1Tu5YH65joix1UMdlhnm2Nbv3ubf Q==;
X-CSE-ConnectionGUID: m8NU9yOLQIyT/E6T+ySDkA==
X-CSE-MsgGUID: uGrMyF/NScuBbrf4xgaHfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63381508"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="63381508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 13:29:41 -0700
X-CSE-ConnectionGUID: tIxdOctcSUOY/hGxBw32hw==
X-CSE-MsgGUID: OB3FJyP8SLWOPBaJCacbBQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 13:29:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 13:29:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 13:29:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 13:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNEgjN8BwXTXfap5lvvBHfTWLkr25ZTu2gEsGaM5zQymaZm1IVHQmsqxaI8kWTKDfF54e39xZP44LCm8nrefS0Me5GixXvFeOs8pop32dw/fLkYDxnX9b0E/RA5QDoi2mEjwbaKPaDtEqNpXy5ESDj+8XfBkS4vGqxzIOSK5M2g++gt0psodo5Ww7n6z5AF4MpnuIkMrZQqkbVOcL+v8BMQS3m4gphk14o/FNq7gJj+r5fpHGEYjGUKP9TbTj2nWdRvMHHi+0RGYjSFUcm6mHgkrujZpdBk0CMF5J0ZIqZl4owA2eS0q0DDYfZSqRedoXT5qoPfYKZFivAIR337nqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qtnb4hlTxAZHoBqMN7yl8q4TL6D+v0NBxCb/sUPkzdY=;
 b=tsL/jJbuSabpHUhfcBTyOUF/4sZoTOQK9GpIRhaU2YAV1LErw8eeX10MHtc7hp3oTSDSrVLVGQ8OpEUUpCmww9Af8RNea27h8dTA/0ioVLhVGiKLV2i+XTsWTD+xx6+J3lzZLMgCmmWeL8WMYW3dOlJJFMLjmCoonBIjF6mEa32ys0kZSShGbCEzU2O5wsR4o3yguEraTTzIvLISLKMoi91SNlmGhbEnX8TshGA0PUZgmChbdw9+QX0uzYYetWr6b9cST6y2iRayNqJV6Ut0gfsy5vK3PVZ+TfwQwFIkwc3HeiscxEMkFHqOdjne5cpRYQ/KI5c01HsxreAM83qMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF2FCF00E1F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 20:29:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 20:29:37 +0000
Date: Tue, 9 Sep 2025 13:29:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Message-ID: <aMCOLgSmnPr1Jfkg@lstrano-desk.jf.intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-3-francois.dugast@intel.com>
 <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF2FCF00E1F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b139972-3638-4733-9bb7-08ddefdf9875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?P8JBMJBb8fy1oHYvZLMf7Kcpi+HU7ulcN1dOKpY4InqxtD+BOhJWkylYl+?=
 =?iso-8859-1?Q?2CNpKnPWeTvYDg67xGYyyxQ9HHCk898zuafDTXcAhtQAaa6HG86EvpapSv?=
 =?iso-8859-1?Q?2lLHEqjaKcXowjx/U6pMQYuoxOQ2fSA2ptvOPY4dS8pKUxOdTtsZ44D2RK?=
 =?iso-8859-1?Q?racQy8Y5y4wGvBmgLAMmXq0SCfVj35rL5vwYiMMs6ZtVpvEC6PuCjzAlIU?=
 =?iso-8859-1?Q?Cu0xVWduEBxz3zE6ooHHxPD9r0WDFmbSEANQDVeVlyd0VbOKZ3BAQ40MYJ?=
 =?iso-8859-1?Q?ln8JMHC4XOq0uZRhvMvcHHa5+2A6cmK+KXJMBGQNuzJzlg/i7H13wtS9nz?=
 =?iso-8859-1?Q?+avXxCQWjP7CxoptH5DzcYxlnEeSu6jjxU3Nbi/vPT8phSaWfINCL/ByG4?=
 =?iso-8859-1?Q?ZsZ7bw0/gyo5tqLysQa7Tb8SAd/TMy7XxTfyaL263Ee4BpLqu7d7rj6Pos?=
 =?iso-8859-1?Q?2HQALY+Jt90ERuNeSgpjl73MDX8ZzKeyR/3zdCehNTJbUbDhc2dyPbtvjR?=
 =?iso-8859-1?Q?xYHrdvCkzwTTGgq9GTnFdYIAHy3atGZcerHtLYFvEsOBGbfz+71A1Y7lwJ?=
 =?iso-8859-1?Q?OR7+xiQF1dk72G82lEBxBKhfNgEdUoAdpbWkTaZFAd9KLOiJaukbcdAbfQ?=
 =?iso-8859-1?Q?6kzSm/HQ4UnmY19Zn0tQRMgdm+YqSuSzmzPTNmEE1rCH9VcRidkKxWcfOq?=
 =?iso-8859-1?Q?nWes0r0xZeaNmYQlmLaVtniWhtSOI8TQi9Y9sOjsvl7f+mzWAHalnkyuxK?=
 =?iso-8859-1?Q?cDwC+aLS5aHEEzhdZwIavnB3RIB71kMzAFhlJmDJEDMF3eyke1ZPGSCT+i?=
 =?iso-8859-1?Q?gZiKYO28pdnu8Y5YfHSECS9380JzlRoNXywUinvCbdFrPApoEtKL/adu4m?=
 =?iso-8859-1?Q?8OZ7PyRsaWo+RBHvTKGHRKG7o0iVb6kXQ1J+mUydIxIBc9+XKrbMF/PS3y?=
 =?iso-8859-1?Q?8vLE/pdpYpislKHaUZgWPy8ulcCGXTGQJUIOC+2sxFQ+7TxeXyDyGw4aso?=
 =?iso-8859-1?Q?quf9Lbyd4+4D83gtJPkvUhME7XlznXb+VZyxspL9GYyF7Ie7wTztveWQ4K?=
 =?iso-8859-1?Q?xxqX/1QAD/Z2bijLXIZZuQ9VePgOaFi6C9XHkd0HsYsCIGd4PhEtVHl8mn?=
 =?iso-8859-1?Q?x6ylDxIXwps9wRTq++angLgoZIoyq87uGUuVu+pmYcgPQEMpvm1XE1XRHH?=
 =?iso-8859-1?Q?ChDIERGHQEUAFaqiRkJiU4HA9del6Nu1LPvLLOptXSyvx3UpkquaWhhLRo?=
 =?iso-8859-1?Q?xDGmiyKeNo2YpdPabtSQ13ISrOZnCNk7kWnWCtIWuvL2Oa2TXE+4q9Vu2O?=
 =?iso-8859-1?Q?E4t1JkW39s+4y0rxNy8JWSAnQQX3j96EmVOB+QPS91NRWT06IToZtzFwss?=
 =?iso-8859-1?Q?pK8vm1kq8sRqr/XRapIJ9mhuS8vHFhMhkZ3DK3HvyY3OL+aaULjkfIZDLz?=
 =?iso-8859-1?Q?x86eJYuUnSC966bYEXHeLubfqHwCpl/eyOmmS6267P9a8pN0+PPbYu880m?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UIWwlhmPFrsSTw6t80T6Qk9F2Y/qU+lIImqnjLPkEjnZCze/HzFV2sKdnk?=
 =?iso-8859-1?Q?hZVhP6IOzTf29Hdz8ttVzV76/DV8RFpixNflSJJrSFOtwsn1mxUukXPnbs?=
 =?iso-8859-1?Q?847fGuJzqI8Y7HZ5yDZ2g+ckWLlaCSnA8AEHAMSvcj9qSyDAqxafhzwhPJ?=
 =?iso-8859-1?Q?64CijYZLP5pDPmEvNWt1pPV6R26N2Vo4i3kuPmFWOfwcTGOuj1QSTZSz5H?=
 =?iso-8859-1?Q?JmFhHSU1oOXdWznmbKxffEMzV3Ive0O/gfGrA55qvyY1Kh7JHGXuqOQlik?=
 =?iso-8859-1?Q?Uut6sQJy7UnPOziGKg5apQ2FrFk2vlqQ+ldrwMBPEVKvWI8VdU7QHa+RQI?=
 =?iso-8859-1?Q?m1Q+wh67x8xJxMeCraaA4ac1xy4h5H5nVw2rYCpirbsnIIZxEt7iaKvDOh?=
 =?iso-8859-1?Q?BnOuYpd6ZeywpOcKK27FEWNCEHOYJk05G2G5O6w50Ik2dfUd4xOgDmjXmE?=
 =?iso-8859-1?Q?iFjKLjd42BJUw+8SNMtRo+lIMMdd//Trl2+Ri7rpPwetg6GTJyiuUvVGKk?=
 =?iso-8859-1?Q?8UXjrPmuglqKEcjE3wwmFd9irajx8sgTdUFUoQRNyQCl71Ez4cOThxq4xY?=
 =?iso-8859-1?Q?98aymMfr+hwroMlzXbBGf6WifPr0KVMIwd8PEuVwkER7fWmgAImbJ05czA?=
 =?iso-8859-1?Q?Rp4h8BuQeDqdDEhDtuUNdT+wRgdWUNg0bAeUhTPXFATyUELbjbtYrbuUow?=
 =?iso-8859-1?Q?uk1QYHX9A26uuPP+66S21xAt2FzKimgatjsKtZEnEvS60I8hs/p7WMYjtx?=
 =?iso-8859-1?Q?0Okk36T4Jj8XErhjNUp2cNM/v6teLelPrisYO4wtWYqTsRtUA4XAeLHwbm?=
 =?iso-8859-1?Q?3laLo5pzuTs9PfXRhRbqa9ROwgrAC+D2eqoHMOvNUWA6aDBYpGOsuFILKk?=
 =?iso-8859-1?Q?eAqG5ygEkQlaE5uis/5ZnW4zisA9/LpfbeqANMM2qZS9ed42XHY4sSfhYi?=
 =?iso-8859-1?Q?MSMrROHPMP1HiXoygQYR9TKxV5EQMaxUShwIbNDrevDXsSxp3OcF68o3QH?=
 =?iso-8859-1?Q?G+zENbvVwNqU8CmLR/K/Wy/9ovi+Rj90/r84eNAN59YnfoEFiKWn3f3Uxm?=
 =?iso-8859-1?Q?U0R2vj+1MBcoDO8Buu3ih21N6QHWNrdYG0tAF5dCirWwthnNiQDPhk3Qqi?=
 =?iso-8859-1?Q?T8SubpQfA9snQD8Mpf4Lhnk8G3fl0Sn85tlyUP0pYCVvDhPfxY+p8EFw0u?=
 =?iso-8859-1?Q?7NRTU4cBU9mXHwr5bBxE/QiDWFN0PI6uEM5KiaxOYTzkzAj12SHebC5cwE?=
 =?iso-8859-1?Q?OU5miI3PLO5JkZU/cjcMrKauDI4gUGtogrSUPJdvkBurhdw/RwVjeF8JwK?=
 =?iso-8859-1?Q?T7wuJM716OeMmUtijAlVdaAXeZxDY6hxKYRGCOHO4GAPm6XQl+w9RpTs/k?=
 =?iso-8859-1?Q?i08cnTXGReEfQSlODKozRlj2Hn7br0zNYBpEUqXvdJYe2q+/I80qZ3jre5?=
 =?iso-8859-1?Q?AsWJj5C7mKx3DV2I0BF99sKCoKVKBihLkz6O3jgRJow2KLgqJYnDm4bzV/?=
 =?iso-8859-1?Q?5OPvu8txIIhy5I9RTUodFhe9frzIcW1/N7/kgYYXhqEipYwpMeLiEgJ0Xt?=
 =?iso-8859-1?Q?trb01sCXdZEFjiedc9CgMKN6r2ErcrruhBJlbaQWZZ83PkFwfkUPhkG0Xw?=
 =?iso-8859-1?Q?HEJk3BUlZUgxoTdhCEPq3lvNcX7f79vvq4jPLH08eKuIjzY/HVt0XUYg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b139972-3638-4733-9bb7-08ddefdf9875
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 20:29:37.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQCZEGlqlytWeSTPubyP8nIP31NGMuxYya0Yp1HZwY3EQ9CXyl2sB5cnxIg2XHudx1W7tYCWZ5sGV/TpQtyRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2FCF00E1F
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

On Tue, Sep 09, 2025 at 01:08:03PM -0600, Summers, Stuart wrote:
> On Tue, 2025-09-09 at 17:03 +0200, Francois Dugast wrote:
> > Add a new tracepoints when handling VMA and SVM page faults.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c       | 22 ++++--------
> >  drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 25 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_trace.h              | 40
> > ++++++++++++++++++++++
> >  3 files changed, 71 insertions(+), 16 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d02d22fb3659..50836df79950 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -20,24 +20,11 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> >  #include "xe_svm.h"
> > +#include "xe_trace.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_vm.h"
> >  #include "xe_vram_types.h"
> >  
> > -struct pagefault {
> > -       u64 page_addr;
> > -       u32 asid;
> > -       u16 pdata;
> > -       u8 vfid;
> > -       u8 access_type;
> > -       u8 fault_type;
> > -       u8 fault_level;
> > -       u8 engine_class;
> > -       u8 engine_instance;
> > -       u8 fault_unsuccessful;
> > -       bool trva_fault;
> > -};
> 
> I'd rather wait to add this on top of the page fault series Matt has on
> the list.
> 

I agree that we shouldn't be moving this structure to common file which
we will just clobber soon. I'm not sure when I'll have time to rebase
that code though, getting dragged into a couple of other hot topics, it
may be a few weeks.

If anyone wants to take the series over, feel free.

Matt

> > -
> >  enum access_type {
> >         ACCESS_TYPE_READ = 0,
> >         ACCESS_TYPE_WRITE = 1,
> > @@ -209,11 +196,14 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  
> >         atomic = access_is_atomic(pf->access_type);
> >  
> > -       if (xe_vma_is_cpu_addr_mirror(vma))
> > +       if (xe_vma_is_cpu_addr_mirror(vma)) {
> > +               trace_xe_handle_svm_pagefault(xe, pf);
> 
> Can you add this directly into the xe_svm_handle_pagefault routine
> instead of in the outer layer here?
> 
> >                 err = xe_svm_handle_pagefault(vm, vma, gt,
> >                                               pf->page_addr, atomic);
> > -       else
> > +       } else {
> > +               trace_xe_handle_vma_pagefault(xe, pf);
> >                 err = handle_vma_pagefault(gt, vma, atomic);
> > +       }
> >  
> >  unlock_vm:
> >         if (!err)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > new file mode 100644
> > index 000000000000..431b1469d79b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > +#define _XE_GT_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct pagefault {
> > +       u64 page_addr;
> > +       u32 asid;
> > +       u16 pdata;
> > +       u8 vfid;
> > +       u8 access_type;
> > +       u8 fault_type;
> > +       u8 fault_level;
> > +       u8 engine_class;
> > +       u8 engine_instance;
> > +       u8 fault_unsuccessful;
> > +       bool trva_fault;
> > +};
> > +
> > +#endif /* _XE_GT_PAGEFAULT_TYPES_ */
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index b9f59651771e..8587982e7eee 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -14,8 +14,10 @@
> >  
> >  #include "xe_exec_queue_types.h"
> >  #include "xe_gpu_scheduler_types.h"
> > +#include "xe_gt_pagefault_types.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc_exec_queue_types.h"
> > +#include "xe_hw_engine.h"
> >  #include "xe_migrate_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_tlb_inval_types.h"
> > @@ -473,6 +475,44 @@ DEFINE_EVENT(xe_migrate, xe_migrate_vram,
> >              TP_ARGS(xe, len, vram_addr, dir)
> >  );
> >  
> > +DECLARE_EVENT_CLASS(xe_pagefault,
> > +                   TP_PROTO(struct xe_device *xe, struct pagefault
> > *pf),
> > +                   TP_ARGS(xe, pf),
> > +
> > +                   TP_STRUCT__entry(
> > +                           __string(dev, __dev_name_xe(xe))
> > +                           __field(u64, page_addr)
> > +                           __field(u8, fault_type)
> > +                           __field(u8, access_type)
> > +                           __field(u8, fault_level)
> > +                           __field(u8, engine_class)
> > +                           __field(u8, engine_instance)
> 
> Also this information is more pagefault specific and not really to SVM
> specifically. Instead of moving to xe_svm.c, you could just put this
> outside of the svm if condition above to cover all cases.
> 
> > +                           ),
> > +
> > +                   TP_fast_assign(
> > +                           __assign_str(dev);
> > +                           __entry->page_addr = pf->page_addr;
> 
> And yeah something about the VM we found would also be interesting
> here.
> 
> > +                           ),
> > +
> > +                   TP_printk("dev=%s addr=%llx fault_type=%d
> > access_type=%d fault_level=%d engine_class=%d %s engine_instance=%d",
> > +                             __get_str(dev), __entry->page_addr,
> > +                             __entry->fault_type, __entry-
> > >access_type,
> > +                             __entry->fault_level, __entry-
> > >engine_class,
> > +                             xe_hw_engine_class_to_str(
> > +                                     __entry->engine_class),
> > +                             __entry->engine_instance)
> > +);
> > +
> > +DEFINE_EVENT(xe_pagefault, xe_handle_vma_pagefault,
> > +            TP_PROTO(struct xe_device *xe, struct pagefault *pf),
> > +            TP_ARGS(xe, pf)
> > +);
> > +
> > +DEFINE_EVENT(xe_pagefault, xe_handle_svm_pagefault,
> > +            TP_PROTO(struct xe_device *xe, struct pagefault *pf),
> > +            TP_ARGS(xe, pf)
> 
> Yeah I just don't see why we need both of these from your patch, other
> than just to tell whether the cpu mirror support is set.
> 
> Thanks,
> Stuart
> 
> > +);
> > +
> >  #endif
> >  
> >  /* This part must be outside protection */
> 
