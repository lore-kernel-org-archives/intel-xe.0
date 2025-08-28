Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6202CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 19:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C0410EAAD;
	Thu, 28 Aug 2025 19:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1ZDQ+us";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F82B10EAAD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756410259; x=1787946259;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HFO6iRJygTgTdpGASxTAU4UEbRGpifschGG84+tlRNY=;
 b=X1ZDQ+usiMENA1yFRt1Jp/U9iJ3P7ARmGMAvCgcBd+2v0J0dHT5FCEuN
 WnIsap488VQ6Ak6YGLmmB6Hdkaf+YLmybxskUrOjkLSC8rLYhqZr2k9e1
 NhFOwgc+b/4X9yiHYv5RJhrIomIcXGo1/UNj2CKh5n3dD4WFh5nmcIcAU
 toakvRJ4k3hcR0OoqBvSCmS6NAEBFhedI8C0F19+kO5Iu39g9+AD1mQV6
 rsL5+F8NDQX0IvMWA9OMgLCin8v2TixyNhoyiNRtmXIRHFwOP10+84PpR
 +U6NKw466rH8qy5zb+gpZd0WJsVKCkn0qZ4n2f2p5sY+//zg/4121st1e A==;
X-CSE-ConnectionGUID: hModBVK8T3azyvM6mGd2lA==
X-CSE-MsgGUID: 4TWE5o8RSlC989+xxgFzfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58795935"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58795935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:44:19 -0700
X-CSE-ConnectionGUID: HIUPd4pJTS6z2SowUG9h+Q==
X-CSE-MsgGUID: GGcXhguXRg2134PqlY52hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174372154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:44:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:44:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 12:44:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMX2ru17XpEjRvUXTnqT77HyJfM82TvZ0LQuyib3JLCgx1kL9dDqsaE+LO/Us92CaJg16Eqx1TCqisqiiz2TsG9xqyB+6zlLAcfeVCj7CWdeWqPdmjJjz5qpm0+4BJql+Bc5Igw5DgxKdhGQYYV3/x8ZD4c+tbUTWcOQZBGwnPrvUHH07mkE0xzYTM+gOIdXr505l+WgQ1kV18dFJ0Jt83gJj7wTKLcqR1uXq9gZX9pX9tzUCmYV24t9o40u5hfIHwUdycDV3GF3Yuy4RxJi/6xRbvojSV3o3w568AvGwgeZyJZgKLUneY3dfGH3FMBaF6pOL4MG5ZOsUQ8uAO8Z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpQh6ivqpWT1W5rg9DuFkTksntPK83aZ/bqCmcbzG1U=;
 b=nxrvjG34NIgeRybgvoZJXWJCoe4mcy4SXgnAmu6CRjOi6/I02jNmI37IA8K1tJnxFR5m4/iOuCbfzY6TOUjG6yXi18+FWuIb+31Pa6OmpOhpdtcGtnDKdkda/oH2yYe7rnhSOhG2uTx9OTI4nzOllJqO7Zq6v1jkC4T6GdXV/rHh9DvHLVm4Wd0qFbQt3Bni9JBNAi7eAJACmGUC+8M/H94KYtsTR+noeHbIZl3zUYjkLJ5ZghaNWiULU1LmmjnpgV+Veppq0NwgJlj0NvGKAvbTAs+CUspCr5m+I30DuDlnp1forPFU8drGTiKRlZTx6PhhdIL5g3T8ogRC7aBUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 28 Aug
 2025 19:44:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 19:44:11 +0000
Date: Thu, 28 Aug 2025 12:44:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aLCxiF6v7ii1RBSY@lstrano-desk.jf.intel.com>
References: <20250828184221.919221-1-matthew.brost@intel.com>
 <d4646aead883e87b473b96d2ee9af06bd753648d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4646aead883e87b473b96d2ee9af06bd753648d.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 526b61bb-710f-4eeb-b103-08dde66b4290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wTNmfBXy/DmUKVsCKAtK0R3SdblEKAhF9qVwTReAJgj3KWlOy8SOz7lE2j?=
 =?iso-8859-1?Q?cfjKkJu6jjuIe+ppDY/ozOoHbPheWYRSW8xk6h6Gt9ihzds/bEAJ+HPNlI?=
 =?iso-8859-1?Q?KTGdNcHXHMGPaAXNMf4L3ssYM0zL+AzZlFeQBaTvjBdZRDm2vrhztmrzKF?=
 =?iso-8859-1?Q?At7L0ztT6CD12YwOKk/WTtWOrVClO/bNqlt+h/UGwpeSIBjUDk9mhKBu+G?=
 =?iso-8859-1?Q?/YuBTJCd8EpavosXQxivFvtS5756PmWetcKmqo2/9s5ojg+iCh+jIPPO7n?=
 =?iso-8859-1?Q?ZKhGw+ylikbLhhlgoY6Xmg1eZkkTwauR1zaBnYbLXHxEWuHohiaYcVTuSA?=
 =?iso-8859-1?Q?8ZO/Z4V43RkeZAIwAgcxJxFf06ifQceylgSIpcGU/SzCQpyrwABQbU0nxh?=
 =?iso-8859-1?Q?ftIIWC0J++epUDIaKsDj/Ma26pnbSH2o/MHhtym+RYqGJuPYBgdaG5Sm3i?=
 =?iso-8859-1?Q?JcR1qaEJuF+Q2rlHCzpf6jeAd3xo+xJwHpDIwmaKrXyptfvP/EuaR40umi?=
 =?iso-8859-1?Q?0uP0T1S/4Mwx5fuqM5HrhWqwpE/rT9RpnvTGM7iM2M51ot0u/SzTkEF8Lg?=
 =?iso-8859-1?Q?Ul0Y/J2uAuqLnDfuvGS8Le0esMcsCzYa3+vqWWHo4DhC2cu7ZNYsteivMm?=
 =?iso-8859-1?Q?8bzIIp9iqrl9vfM1lbMCfx1D9WvGq7OmP2zuLtSSvPKs9I3QgcQqJvTMaQ?=
 =?iso-8859-1?Q?pOx2/7KIHndZFQHq+wn22vO1ZzISKbeGLsBcLPT6Dm5C10sFHfPWgCD+UK?=
 =?iso-8859-1?Q?YuJTOnJTM/pisl+NVVHf6GmJefzK5QI1HDdxwG/Uk19KwAQurZ2QVAL8p2?=
 =?iso-8859-1?Q?bkLDZv1RBq3fZV0OUcEIjuUxAK+lR8WC/kDsDXMIr0l3moY2AG5B5p8BZw?=
 =?iso-8859-1?Q?aprn52LDhK0jHBBJIaMOX8eT2S1IamvU6cMiflir8XnoVvrlCZZ9hSsWlI?=
 =?iso-8859-1?Q?K+U6H/8B79QDDx6xS/jXQ2DSr7dD7DcI+R8pv9Jgy0kuT+M9+ycuYymTcK?=
 =?iso-8859-1?Q?qPvyg5xj1srA+lazTXPdVyqxWOqhcvZhyodGMHDFY7nXwKR7eiK10xHDX/?=
 =?iso-8859-1?Q?Kw1eadinj+mTwKwS4JaJo++fgx10sV8F2kqfoL88erqZhssB/NIHMpsX5D?=
 =?iso-8859-1?Q?JVMfkBUuBtprLwkwRVJlG3UcuYMA7CcNx/nQlhPae/T5rMjDFhX/dOQ0db?=
 =?iso-8859-1?Q?n9qRl1r2QbxfqwP0gWc8Gb4yy1P1q81+w1fCBy5LDJ9A/mzJcAvV70M51V?=
 =?iso-8859-1?Q?O2SFZRopjjkIJMOs68MJMVytVeuAvr5URPeZ4rfFIAWPkK9DgW+TGRrQDV?=
 =?iso-8859-1?Q?ySjnuYJGWsTrHp9IRF1zq/RJsXj9RDA5Fz7MSDhezqz9XvAzri4oeX2ZZX?=
 =?iso-8859-1?Q?0J75YC7/XyPQY+mThEgMSFdkZhnGdpESQMTBfBvutltTX51+6qY/x/r0OT?=
 =?iso-8859-1?Q?l2dnOQEXqB3QRkzcYBu7UsHTC3QOOi3sJhwkM6GdDOyO7sW/wg3C0QB7UY?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jE4zww8vrIjmVbKvt6ak4SLk683SbyH1vHQFMFtVO4NWxo8na1uR4QcJlw?=
 =?iso-8859-1?Q?V+21KvplZYaNgp7sB4O5fM1rIrtT7QsNCZREczuBSuXDVJQ3mNfiMjcEm2?=
 =?iso-8859-1?Q?DAT3GBLm68NvLlMAyCtFQ0eUdVbqJ049pOBhiPm8mBup++L7homXr230MA?=
 =?iso-8859-1?Q?m8z0yphxnyD5lAiwciRKKP5/iUqNcHxRjWoRKTpKA4Uq7ZUbQ6IaRQpX5V?=
 =?iso-8859-1?Q?XKKiZiz0MUkyb6B4vrtCx9bMDMl9AhsVS27CWYavDDTCVQd7I1QsQui9We?=
 =?iso-8859-1?Q?KTYHbceaeaXi87HTolHArc0rW8MWlNRoxCThw2d+xSod6Ww1bsPRJyM3HB?=
 =?iso-8859-1?Q?SYCcOSjxiQsMjWFOt65iYl2yVHWkRVxsVysRWk9vBgFiT1Rvbpve41ud48?=
 =?iso-8859-1?Q?nMfYyG6k0EbPgOTHGfNHZwwy8cU6f7fJb3CLk/g9OAzsL0dYDARq5+hTCU?=
 =?iso-8859-1?Q?TZjjPEu8RFpOGZC5CrKxMSuVV5adbNbv67pgSZbnwUvMUDFBLfh160oM7v?=
 =?iso-8859-1?Q?NKYtktQaMK/mD2vFCGKyV4wyl5/TmmEeecRMxWEPmkyuvnMl3+IN3uaLCt?=
 =?iso-8859-1?Q?ciD7lc+Gd7P3mOYVK/tEi7Ld6KCwaRXi4NFVW/GEModxhlNTcYZQP3pshz?=
 =?iso-8859-1?Q?DWRLituQ5KVub8yVXG5UwFjDocg2ypTXAk45vVGNOVEOQKwAXIUE7594/B?=
 =?iso-8859-1?Q?uXqSkavojKr349lJ5Ba40DSqC6Vao3oN2yP/VSU4aBhKylZHTrY1TBpYhx?=
 =?iso-8859-1?Q?ucUSJXhx3ceFFsw5zisyhWdwGTo6HUfuy2vLZM97QHGB3SStKiDcr5gz+l?=
 =?iso-8859-1?Q?8rxHhb56uznfHr0N6PhWCFVUaZ9f8Sd/WMhUSkHTpA4HV90OmsxsO5p89Q?=
 =?iso-8859-1?Q?I8Izhy8FnuIQ2kzRILbC4Wyg6/FWeK354ZuvVeweKTun+jq2Nb3xptKVJ9?=
 =?iso-8859-1?Q?+g6PSXKDA19eAEOVm0Mw523FLzefJc5t/3lk2dpQhgNZjbdQA6i0BpTE5G?=
 =?iso-8859-1?Q?WWEmGReqadmlBgtak3Af+YMDB00+RnzGL2WPio5mQSv6Fbt7RKqGl1XNjN?=
 =?iso-8859-1?Q?AjPHp+msoM3O9CBKUJQTpi/KEJqBQx0jv9hppRP+KNBkjIktqmicomNWTM?=
 =?iso-8859-1?Q?Gdp446k2nCxw5VpB7LxU/61zlJQ/yeHjVk3xqPsUMnNux5/2Vbmxyrq0Aq?=
 =?iso-8859-1?Q?CxNDNiIlpaMKJVgi4cqHyN8c9a6XAqEnHOH/k9LtBRR912iGtDeKj7C81h?=
 =?iso-8859-1?Q?dvjuPM9J3uTpw4AIc4v7PXEv7qRAuyTdYZuYlzTveXnIKeBpVBS9NwN3Dh?=
 =?iso-8859-1?Q?rYpsThcvCgXUCNaCg6hGmHl+JReFZpnOJF3rQz+6SdUl5UbEEFSx2MZr/O?=
 =?iso-8859-1?Q?F+XgLzqFnofDB3vgTN9hBqkv30QVfD86Cb+DF2aZ/aqkJ6fYid+eZBBgmt?=
 =?iso-8859-1?Q?uVh0iPDag3EU0y37ZG0yH7TUrqMU3JzbOV3AjJDorTfKndcmWdls6jbu4a?=
 =?iso-8859-1?Q?E2Bqin1gCteitCMLo6RQnSeewOQUhrGiLnvOz2dMF+P5mu6KZwzO4ylx6B?=
 =?iso-8859-1?Q?kDhfcp//w1hgXU/47QQrovSSqyzWNJgNjKn9FPxLAFkjHXO4ktRqweumaN?=
 =?iso-8859-1?Q?47wbvlJXf2r26JpTXMmjrdI3WWCfTXoqJJT5oH3KirwOrNQAGOmG/5NQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 526b61bb-710f-4eeb-b103-08dde66b4290
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 19:44:11.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJzl2WNvsMRoEum8dq8nomLTAnFESSObAvIcxYU0H1Aflo5U1D9U4BDDGEGOF4aja3GBt4EieWOAPiTOGSOm0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
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

On Thu, Aug 28, 2025 at 01:08:30PM -0600, Summers, Stuart wrote:
> On Thu, 2025-08-28 at 11:42 -0700, Matthew Brost wrote:
> > Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
> > instructions per 2M copy (1 vs. 512), and the cache hit rate should
> > be
> > higher. This results in increased copy engine bandwidth, as shown by
> > benchmark IGTs.
> > 
> > Enable 2M pages by reserving PDEs in the migrate VM and using 2M
> > pages
> > in xe_migrate_vram if the DMA address order matches 2M.
> > 
> > While here, correct build_pt_update_batch_sram to handle PAGE_SIZE >
> > 4K.
> > 
> > v2:
> >  - Reuse build_pt_update_batch_sram (Stuart)
> >  - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
> > v3:
> >  - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as
> > needed
> >  - Use stack incr var in xe_migrate_vram_use_pde (Stuart)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 71 ++++++++++++++++++++++++++++---
> > --
> >  1 file changed, 61 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 57e6d5a8ac39..6bfda6441836 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -56,6 +56,13 @@ struct xe_migrate {
> >         u64 usm_batch_base_ofs;
> >         /** @cleared_mem_ofs: VM offset of @cleared_bo. */
> >         u64 cleared_mem_ofs;
> > +       /** @large_page_copy_ofs: VM offset of 2M pages used for
> > large copies */
> > +       u64 large_page_copy_ofs;
> > +       /**
> > +        * @large_page_copy_pdes: BO offset to writeout 2M pages
> > (PDEs) used for
> > +        * large copies
> > +        */
> > +       u64 large_page_copy_pdes;
> >         /**
> >          * @fence: dma-fence representing the last migration job
> > batch.
> >          * Protected by @job_mutex.
> > @@ -287,6 +294,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >                           (i + 1) * 8, u64, entry);
> >         }
> >  
> > +       /* Reserve 2M PDEs */
> > +       level = 1;
> > +       m->large_page_copy_ofs = NUM_PT_SLOTS << xe_pt_shift(level);
> > +       m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
> > +               NUM_PT_SLOTS * 8;
> > +
> >         /* Set up a 1GiB NULL mapping at 255GiB offset. */
> >         level = 2;
> >         xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255
> > * 8, u64,
> > @@ -1741,16 +1754,19 @@ static u32 pte_update_cmd_size(u64 size)
> >  static void build_pt_update_batch_sram(struct xe_migrate *m,
> >                                        struct xe_bb *bb, u32
> > pt_offset,
> >                                        struct drm_pagemap_addr
> > *sram_addr,
> > -                                      u32 size)
> > +                                      u32 size, int level)
> >  {
> >         u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
> >         u32 ptes;
> >         int i = 0;
> >  
> > -       ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +       ptes = DIV_ROUND_UP(size, gpu_page_size);
> >         while (ptes) {
> >                 u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> >  
> > +               chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
> 
> Ok I see what you're doing here now (also responding to your comment in
> the previous revision). I actually think we should split this into two
> patches then: first patch does the support for arch page size > 4k and
> second patch adds the 2MB PDE update. This makes it easier to
> understand the sequence when we look back later to see why we have this
> change.
> 
> Or otherwise I think you should be more clear in the commit message
> about the two pieces of this patch.
> 
> Other than that though the rest of the patch lgtm.

Sure, I'll just split this.

Matt

> 
> Thanks,
> Stuart
> 
> > +
> >                 bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> >                 bb->cs[bb->len++] = pt_offset;
> >                 bb->cs[bb->len++] = 0;
> > @@ -1759,22 +1775,46 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >                 ptes -= chunk;
> >  
> >                 while (chunk--) {
> > -                       u64 addr = sram_addr[i].addr & PAGE_MASK;
> > +                       u64 addr = sram_addr[i].addr &
> > ~(gpu_page_size - 1);
> >  
> >                         xe_tile_assert(m->tile, sram_addr[i].proto ==
> >                                        DRM_INTERCONNECT_SYSTEM);
> >                         xe_tile_assert(m->tile, addr);
> > +
> > +again:
> >                         addr = m->q->vm->pt_ops->pte_encode_addr(m-
> > >tile->xe,
> >                                                                 
> > addr, pat_index,
> > -                                                                0,
> > false, 0);
> > +                                                               
> > level, false, 0);
> >                         bb->cs[bb->len++] = lower_32_bits(addr);
> >                         bb->cs[bb->len++] = upper_32_bits(addr);
> >  
> > -                       i++;
> > +                       if (gpu_page_size < PAGE_SIZE) {
> > +                               addr += XE_PAGE_SIZE;
> > +                               if (sram_addr[i].addr + PAGE_SIZE !=
> > addr) {
> > +                                       chunk--;
> > +                                       goto again;
> > +                               }
> > +                               i++;
> > +                       } else {
> > +                               i += gpu_page_size / PAGE_SIZE;
> > +                       }
> >                 }
> >         }
> >  }
> >  
> > +static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr
> > *sram_addr,
> > +                                   unsigned long size)
> > +{
> > +       u32 large_size = (0x1 << xe_pt_shift(1));
> > +       unsigned long i, incr = large_size / PAGE_SIZE;;
> > +
> > +       for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); i += incr)
> > +               if (PAGE_SIZE << sram_addr[i].order != large_size)
> > +                       return false;
> > +
> > +       return true;
> > +}
> > +
> >  enum xe_migrate_copy_dir {
> >         XE_MIGRATE_COPY_TO_VRAM,
> >         XE_MIGRATE_COPY_TO_SRAM,
> > @@ -1804,6 +1844,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >                 PAGE_SIZE : 4;
> >         int err;
> >         unsigned long i, j;
> > +       bool use_pde = xe_migrate_vram_use_pde(sram_addr, len +
> > sram_offset);
> >  
> >         if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> >                         (sram_offset | vram_addr) &
> > XE_CACHELINE_MASK))
> > @@ -1828,7 +1869,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >          * struct drm_pagemap_addr. Ensure this is the case even with
> > higher
> >          * orders.
> >          */
> > -       for (i = 0; i < npages;) {
> > +       for (i = 0; !use_pde && i < npages;) {
> >                 unsigned int order = sram_addr[i].order;
> >  
> >                 for (j = 1; j < NR_PAGES(order) && i + j < npages;
> > j++)
> > @@ -1838,16 +1879,26 @@ static struct dma_fence
> > *xe_migrate_vram(struct xe_migrate *m,
> >                 i += NR_PAGES(order);
> >         }
> >  
> > -       build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > -                                  sram_addr, len + sram_offset);
> > +       if (use_pde)
> > +               build_pt_update_batch_sram(m, bb, m-
> > >large_page_copy_pdes,
> > +                                          sram_addr, len +
> > sram_offset, 1);
> > +       else
> > +               build_pt_update_batch_sram(m, bb, pt_slot *
> > XE_PAGE_SIZE,
> > +                                          sram_addr, len +
> > sram_offset, 0);
> >  
> >         if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > -               src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       src_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >                 dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> >  
> >         } else {
> >                 src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > -               dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       dst_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >         }
> >  
> >         bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> 
