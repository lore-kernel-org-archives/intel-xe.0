Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C3BCE7A91
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 19:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AB410E942;
	Thu,  5 Sep 2024 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX6F9ee5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24F810E942
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725565836; x=1757101836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OBdee4okEVe+8hLHsWVJvWzt14qHJibTNht/TiYw0+8=;
 b=DX6F9ee5KhbPZZtoMKfrAlUaRp6XU6VGibx6lIThUrEsbmulT1UcFnC6
 wqr0jXiYRwetWGCSUU1l+204L/yuD9BkXiLGtbT2OT77Ob3AErrAFK3+U
 CidFm2lAJZiOmpEH037kYiot86yIH/UYZpuEzuK5NdsDKm9Y/G+63WI9D
 YWsbq1/xR/RyAWNLN0QHqL6xDG7gR/QnbAjIl3JfdRG8NM+f5o+h5hX5S
 mmD+23x5oK9DPy6pOjbRdO965IMS6RdJcTQo5vbEG9XtUIoriSg1y+BoW
 Ey3ctu29WdP/+JVGE0ZcfnRM2+lM/nGIZG6pz4F3luPqbmdltRVnxNOjt A==;
X-CSE-ConnectionGUID: RtryE2P+TrqKPAC5aHMnkg==
X-CSE-MsgGUID: gmgy9RQ6SAKVG1CQEmGFBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13394570"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="13394570"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:50:35 -0700
X-CSE-ConnectionGUID: a6hm3ExtRMCRGs/YJZfcCA==
X-CSE-MsgGUID: hnnpX1ZYTwWOfvtC39ve+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="69872099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:50:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:50:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:50:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAUKH/ELfL59NegZT2Gh00pVD3I3s1ALndWJdQ3mvxdIwaklPNHCZB+SjuymfIPaUXDscVyBl1hLVWzUXCbUyfffUhQsMUm8Jow8pPj52TjyDlgBp9Kl/ISj0oQ3TaLdnBxGtBt18sUTelFnPxDxkCOGlxBeeknwaIcdnwnS04UVVpFf7yRhfYO+jqPY+I572FzqG4Muz4MxQwrzFFQa5D9b73VjBXHhUc5fuyw28ruy31kN2KMlT82HPt/HRf2hviSfMX1JgE0Fr9mRe2UfzWLe2i2CecHjjTB4aaJssJkvV/cWZfaKifrXYZdfUYcxiL59I1zJMnNr8ZTQY+w7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLypr5t6G6aWkQ59mkSLi7lI1R4Meum+uiEOrlkHbJk=;
 b=H6QOjM1YBc/A6hDkXhmebND4rG3CB9t6oPr0aGqeNZEwS0/C7imIQ8loZFYR0I+/j5bX5QXslhZfJdaxZQzg7hBxB4e4b/txpNtcvuMy1HmHEUWfzgfhd+1jXfcS8aIK5v8G/RJmi2QWVOqcX3dBGRHCJhySxdqz/5nRKxS19Em8eJOy5lehiChTMKvUTy9yyvlIttqJ/5Dqv/0gs0e5zme7EMD7m24KFwBldlskzb2uzhtDCKK8a0nAEi6tewwKQSf7N3fVBnACVYw8Z/VW8BemU6M5z/YCC4xC3dS1gD+/bcWsY8MU/JC6kTyalkhRJZJaaBJLv7ZKKJP7DrFujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 19:50:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:50:31 +0000
Date: Thu, 5 Sep 2024 15:50:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
Message-ID: <ZtoLgxQ50JLhpwaj@intel.com>
References: <20240905052813.4169007-1-riana.tauro@intel.com>
 <20240905052813.4169007-3-riana.tauro@intel.com>
 <9acd12c5-274a-486a-90d8-7e9232a3609b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9acd12c5-274a-486a-90d8-7e9232a3609b@intel.com>
X-ClientProxiedBy: MW4PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:303:b8::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: e50aac2e-f49e-4374-62a6-08dccde3ffc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UUqddsijRiumcmyYIE56Snx1e5J396KEPtg8bd0LRycDE45fkM/gYhnE2/U2?=
 =?us-ascii?Q?0ln3YfMxFrJelm49FniwW5xQOdvfymLzZnA39o0gxa5Hh5DfLcjUtMg9x91y?=
 =?us-ascii?Q?VDIt1p+dpGNdiw+yAXm8BgyZpVvICNjpxMjdIVvNjiO/hy+VXuKrgXJUMoLo?=
 =?us-ascii?Q?UY2pmqa6DsYZDR7EYWGqFPsf61UNL4XC1aoMtONWMZr7df2AR8kvZToV6VJz?=
 =?us-ascii?Q?Uy2qjC0HTmjXRpqLJwF5NhgSiw+9KKXGbwavkhExgM4nAAPDnNCX9p7OD4HX?=
 =?us-ascii?Q?27KlV7PT08jffZT1ggc3AuS9DrozGOi0M4uHyCkoKL2RJz1xT213BQSfCH4P?=
 =?us-ascii?Q?OWaytXUR7ycso9KNRVgOCXy8LBeB8panhjUxdVLrGhOCMthP9HdPI8nycKUx?=
 =?us-ascii?Q?IaF6kvXLlhqMRpf/jbz3qhzmCfCIsb/inoWyOG40KfrXmObNysemI3gZGo2d?=
 =?us-ascii?Q?9R0HwJ6fVoZd3DR8byUSiQSgNT5oxzqMHQHGcvVe6NEvUjuqMBU/Bw0pg5n/?=
 =?us-ascii?Q?ABmxC8YRTO5FKG7tQLLU94AIax4xF6/ztAe8hYImmGgi4/VM2JLjOI4F0Var?=
 =?us-ascii?Q?8dgCcz4Qk05dKhLQJgGoQ0dDBv0AyYjWQA99EkvGM8udODk9qiPMNJEiS1qw?=
 =?us-ascii?Q?34yLqNiPGx5FpQWOb6AgCR/iYsnLG+fVc2qaaYo9peRDgTsQCh3D5840c/TG?=
 =?us-ascii?Q?/BvJI1Z6hrfjUM1aFtWxcY0uDVywOzBoLXi8nGctjGvg+Oovcgulo+U5U5aP?=
 =?us-ascii?Q?q2Ao1Dam1w86CcN7++Yfpt0HVeEWQKn6CwRVjhobMybClVhmw7uejTHR4jMA?=
 =?us-ascii?Q?KEpvUg+tUSPuO8uOUVOJVREiLDRG06ZU7nzRhrGepQ9MHfJg1G5KfwOhKUMD?=
 =?us-ascii?Q?U4Sx7gz0ndYh6NAT/LBijaeLrF0+W+fypIx2z7ohdNDKPdGhnZeVVcNc9Yxv?=
 =?us-ascii?Q?FFUr0GTWsVVjLWv6kEXzKlrJIMyWdHDEctKA3jQlnw6emYDSjV7gClgJwr6E?=
 =?us-ascii?Q?nCJeCHHAjkwvqvqEJX5o1/SNqGVIq/VDQGy5B1bKyj+weChYxyzjfd2Du+7g?=
 =?us-ascii?Q?RMbpd46Acn7dZCqFxuLH/Ni0ArmYEU3bFYIdPOVAQ5A4sBB2fr01XK6LjnBh?=
 =?us-ascii?Q?2vJvHTOcmnQlOFPvXFCjW8rc7xsbXrdeUWzRVhN/c17L6ym+FyNbALE7H9Bd?=
 =?us-ascii?Q?EDYlvF7BGbHNEiRdb3/a4SVcHobC9YDFAsAg/KNjlM5Rr/oywGvujg/HONAF?=
 =?us-ascii?Q?WsnFNVDEXNr/h5icSbitrfLQQO4ez8rmdYydfbeKBLXP7waZh9NhroFDvqAO?=
 =?us-ascii?Q?kLHjLH6O+Oy9LeJcnYNHoUB75Bceta31JpBuibYV7GjbQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+PH0uhOg2+YGXrJVjxhGu1bA0M5pp1mQMxkELsfZ7yk94M491efLk9qLQ2U?=
 =?us-ascii?Q?c35/7tp6PMw4G1SXzujiimwfChN70zc4z9m3d1udTdsX0UzmkVuSWWTMZhmM?=
 =?us-ascii?Q?FV86CGBkUU2ozGomBl3HFU0dduKXatQhIrrN6Wpv1YIj2CL/zCZ9jqdCfUMO?=
 =?us-ascii?Q?7K3Ycr/xxdrJLffRgFO0190w9yeS1QK8PVrmD058gfI487P4VGYMx6olY5z9?=
 =?us-ascii?Q?orcFrsh+k+eg0ISqv1r13/8f9d9WaXQGeFIL7UbI5m9A+Vpv75a4M3KbdoOp?=
 =?us-ascii?Q?rmhAzPJRJSmxYAT7+LXMzpQZijMlOSVIMjni4HrygITeLjpph80BEV8KAATG?=
 =?us-ascii?Q?XC3BZQph9MQzyQCGXxsZl9Yvjv4B+FXW7UJnIcospqa+E8+IFqasju0piq/I?=
 =?us-ascii?Q?wOD/wrNVPLyXroG+lpAuH4JcQbwud0PTD8HZA3lwcZI1RqFj90SBJ4slDlt3?=
 =?us-ascii?Q?frhjVAX7AkagOUedaKqgn7pF/pV48T+PoH3AN94rUD2ueo7QLm1ikpGulued?=
 =?us-ascii?Q?v/hX9xjmpK6qbDwc7pF+MHdsX3ayBIkLh6v8q8TfLn2Ec4mSgjbDhbbhwmrN?=
 =?us-ascii?Q?RuUgeFz144mCIoKIRmeQOXz1m3CMnditVWP4W3xHavGn4cS23+37TFG2bsMs?=
 =?us-ascii?Q?Q2DcvNXmfGUx/m28pHbVFH6WLwyHEoeQQABiFsOqLDRXkJjfyjdqaLZTA2/L?=
 =?us-ascii?Q?ssp2sAGgbMw9pu3ud+dsbDFHSOq0+RERvjWqb2j4aFRX34CMCyXMvK45UDby?=
 =?us-ascii?Q?8REmWlKH1s12rroH8KesKpTF+qsTlY9oFlvXsmn7R8aUYqI3VQoBbft3z+kM?=
 =?us-ascii?Q?F1xmLsflpQcfd0RQVSYt15ynUCFTnm/dUTuPCAEouilIA5zbLzLBM8tICpsy?=
 =?us-ascii?Q?PBXd3KevUmXLw/u/bf9T21hZOHrUeePlSzT3mX7xZWRjUgSzTBkx2PaaT4Th?=
 =?us-ascii?Q?aFEq/F87QirSEADjMqJvghHgEP+qO7MWVnz7mJRBlDzorv/O27USnI/jG/Yb?=
 =?us-ascii?Q?gRFKouUSTbDKhpKGJEqs1ALKqNB7usmEw+Or09pb+pRqlIKP1gdggweagbwd?=
 =?us-ascii?Q?mULoyVFo7jH1jxwKBwhiRgJ+7EtiDxHqG48nfwZAih+He/EoVUKJ3+wFk148?=
 =?us-ascii?Q?+RHBq8PCmoQQDyt0giYO0ieMI1/9h09pGFOQgpEqjOsrwYFpFnN+0qLDoEmP?=
 =?us-ascii?Q?RNo+LGSaZdnXrPdKDBLrpCN+CtD01S0I9v8tm+I6Ce3Ioc1eAnvWYASAaah0?=
 =?us-ascii?Q?k2a5LZcglcBEx1v1/BIJrdARy50+nIKgctvE6NhGfIa48D95zVUdyREBk7v/?=
 =?us-ascii?Q?SoHCQConNO+b8HN3jMlrmNTs1GpubQrQE2dr5z7fR49Jr5pp27DDSocouGss?=
 =?us-ascii?Q?0+ljJmZ0GAhasPJirxcj1gZXExahYlnTXuPOjLtbNZV3S6kujAHzK7EBkQGK?=
 =?us-ascii?Q?wmtLKNyDPt0m6P54d14pil5HWoMFHB54OmA/hcMJu0TUWF2k8WYGW8YVIZnb?=
 =?us-ascii?Q?wgW3fynXII+ycOz36xx5qkVnJmlC36pBZ8sdFIr8A+bzx60vkNL/lk84Hu28?=
 =?us-ascii?Q?Oy549pjIXV9tJ8lCuwIIofoc5/oAtUZ4PTn9iGd7RZ4YgYNuF+BYtNKoS0k9?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e50aac2e-f49e-4374-62a6-08dccde3ffc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:50:31.8255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ofih3S4G2E2c6oUKX/O8Hfv+IhaG2nsZXORosrkWHaDunAFZTeW+uIfrE/KdbIZS6WKP1b1CpgK7EUlwTa8Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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

On Thu, Sep 05, 2024 at 04:45:56PM +0530, Nilawar, Badal wrote:
> 
> 
> On 05-09-2024 10:58, Riana Tauro wrote:
> > Coarse Powergating is a power saving technique where Render and Media
> > can be power-gated independently irrespective of the rest of the GT.
> > 
> > For debug purposes, it is useful to expose the powergating information.
> > 
> > v2: move to debugfs
> >      add details to commit message
> >      add per-slice status for media
> >      define reg bits in descending order (Matt Roper)
> > 
> > v3: fix return statement
> >      fix kernel-doc
> >      use loop for media slices
> >      use helper function for status (Michal)
> > 
> > v4: add pg prefix
> >      do not wake GT if in C6 (Badal)
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
> >   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
> >   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
> >   4 files changed, 114 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 0d1a4a9f4e11..cbead3f75fad 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -341,6 +341,14 @@
> >   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
> >   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> > +
> > +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> > +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> > +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> > +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> > +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> > +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> > +
> >   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> >   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> >   #define FORCEWAKE_GSC				XE_REG(0xa618)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 8f95d3a5949b..cbc43973ff7e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -15,6 +15,7 @@
> >   #include "xe_ggtt.h"
> >   #include "xe_gt.h"
> >   #include "xe_gt_mcr.h"
> > +#include "xe_gt_idle.h"
> >   #include "xe_gt_sriov_pf_debugfs.h"
> >   #include "xe_gt_sriov_vf_debugfs.h"
> >   #include "xe_gt_stats.h"
> > @@ -109,6 +110,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
> >   	return 0;
> >   }
> > +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	ret = xe_gt_idle_pg_print(gt, p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	return ret;
> > +}
> > +
> >   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> >   {
> >   	xe_pm_runtime_get(gt_to_xe(gt));
> > @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
> >   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> >   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> >   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> > +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> >   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> >   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> >   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > index 3924f9f3d0a5..85a35ed153a3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
> >   	return gt_to_xe(gt);
> >   }
> > +static inline const char *str_up_down(bool v)
> > +{
> > +	return v ? "up" : "down";
> > +}
> > +
> >   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> >   {
> >   	switch (state) {
> > @@ -155,6 +160,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
> >   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> >   }
> > +/**
> > + * xe_gt_idle_pg_print - Xe powergating info
> > + * @gt: GT object
> > + * @p: drm_printer.
> > + *
> > + * This function prints the powergating information
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	struct xe_gt_idle *gtidle = &gt->gtidle;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	enum xe_gt_idle_state state;
> > +	u32 pg_enabled, pg_status = 0;
> > +	u32 vcs_mask, vecs_mask;
> > +	int err, n;
> > +	/*
> > +	 * Media Slices
> > +	 *
> > +	 * Slice 0: VCS0, VCS1, VECS0
> > +	 * Slice 1: VCS2, VCS3, VECS1
> > +	 * Slice 2: VCS4, VCS5, VECS2
> > +	 * Slice 3: VCS6, VCS7, VECS3
> > +	 */
> > +	static const struct {
> > +		u64 engines;
> > +		u32 status_bit;
> > +	} media_slices[] = {
> > +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> > +		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> > +
> > +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> > +		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> > +
> > +		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> > +		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> > +
> > +		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> > +		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> > +	};
> > +
> > +	if (xe->info.platform == XE_PVC) {
> > +		drm_printf(p, "Power Gating not supported\n");
> > +		return 0;
> > +	}
> > +
> > +	state = gtidle->idle_status(gtidle_to_pc(gtidle));
> > +	pg_enabled = gtidle->powergate_enable;
> > +
> > +	/* Do not wake the GT to read powergating status */
> > +	if (state != GT_IDLE_C6) {
> > +		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +		if (err)
> > +			return err;
> > +
> > +		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> > +		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> > +
> > +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > +	}
> > +
> > +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> > +		drm_printf(p, "Render Power Gating Enabled: %s\n",
> > +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> > +
> > +		drm_printf(p, "Render Power Gate Status: %s\n",
> > +			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> > +	}
> > +
> > +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> > +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > +
> > +	/* Print media CPG status only if media is present */
> > +	if (vcs_mask || vecs_mask) {
> > +		drm_printf(p, "Media Power Gating Enabled: %s\n",
> > +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
> > +
> > +		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> > +			if (gt->info.engine_mask & media_slices[n].engines)
> > +				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> > +					   str_up_down(pg_status & media_slices[n].status_bit));
> > +	}
> > +	return 0;
> > +}
> > +
> >   static ssize_t name_show(struct device *dev,
> >   			 struct device_attribute *attr, char *buff)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> > index 554447b5d46d..4455a6501cb0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> > @@ -8,6 +8,7 @@
> >   #include "xe_gt_idle_types.h"
> > +struct drm_printer;
> >   struct xe_gt;
> >   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> > @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
> >   void xe_gt_idle_disable_c6(struct xe_gt *gt);
> >   void xe_gt_idle_enable_pg(struct xe_gt *gt);
> >   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> > +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

on the series:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Regards,
> Badal
> >   #endif /* _XE_GT_IDLE_H_ */
