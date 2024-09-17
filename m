Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B1BEE6426
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 14:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4210E486;
	Tue, 17 Sep 2024 14:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGJlrM+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC15410E486
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726584039; x=1758120039;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1vTvBZlWZYC1pRRNQpzK+n/vk2050JH/TznvTYmQPfc=;
 b=kGJlrM+9Rfesl2WqRdDQXfvPXCrQqQFk/x4/l1/QUc0mpcJFr83Njwfc
 dERgiUTict4GBmaDVqoEq2UAD1Q9DJ0DYuz4Nli6D50rmvkIuKe8fvh4N
 IvowR93atQich655Ajww6IsjfagjnVnma9IUxVxsHXchFnDVfyR4D6+dK
 ATFp8XlvklrIaHCCguSSFqoA/6KGUxQyEWXTvokRhc0lXFiB8ZtVW4DXh
 2g7QQwGT9EeThD0qLbWudSz4annKNOIzqNRurNqjzSwGLkCF/FJYrd+x+
 ktu/+QhYTpVuQTMB6soEMaWl2/IytU9upJiPVe6wf/UY29+1sACrdS4hA A==;
X-CSE-ConnectionGUID: ORJDkZFGQOy7G8B+UHSqcQ==
X-CSE-MsgGUID: p8gtQB08SXKkHCkVZHKKog==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25326989"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25326989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 07:40:38 -0700
X-CSE-ConnectionGUID: o7cw5RKQQFqvhLDMdkPHkw==
X-CSE-MsgGUID: HrDMWczXSoigWyS6psasmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69081003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 07:40:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 07:40:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 07:40:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 07:40:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 07:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5lAwdnAWeTDLTBrzPtphGbnWu4kHqA1pgMiB1YcCcwK4G7t+7HoW+NmiQjLdPupzOhN4Uml6s+RIEqCtDy/UZ0QnbQneeXV+GKXTDPLw2CtHeEuxvtVr2HoEPf9AtghXUSoWcPh5ggrMoOPY41F9jb2OK7KftT0DAgSY97HviPlYCrR0Vt+A+nSqjUrFUWyktUT9IYFFhY4Lqyyh0D7UlPf0CL1+TtonMUGTaHp0JHEXJzIh6NQLt2Y3gZNCn/kw/Khi+Cxb7OaardpLoW2et/f+A8Zd30vi3JfXIozL3kmgNSD/Bi8h+EukHSSIkWlkWpF60XHd++3YVP1VqlqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nmlmXphyPXJIzJVGNMl+BsmpF+KsUB0fHmoQCdi60E=;
 b=Q0gYpKWhabRUVqahMBhH18qJhO6dS9OGYkP3F6YtfNho0fvzHOBmD24+KTEdmavwwi2S0UQ1n6WT+mRFQ//XLVONONvK04W1/Jn4hZTq/QiFuowookFBOWr7sonIxEJHpSmVNRMxnsmL1GoB5xVAOH0jPxnt9/XcQDZOXqtplWJZ/AVXmcjoh8fFVa41nyHUMNC/MXGlQxNhbEkVFQH1kWPSo3cun93Iq0NkLb4vYsZKPiQRCtfRC6dJMvt8H2+K7TuUk2zoWiW+mK4Wqp0kBPlMWm+Cp6l4kn8HRZ2NmGcVoVBzKuYTUUqBQiRiK+KFi2ZQB6wwLfez425dQCrIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 14:40:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 14:40:33 +0000
Date: Tue, 17 Sep 2024 14:39:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
Message-ID: <ZumUhcUYGBLUdfrW@DUT025-TGLU.fm.intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
 <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
 <ZrpFwv+GlJzqzibT@DUT025-TGLU.fm.intel.com>
 <Zug40aMNkJ9ZibYC@DUT025-TGLU.fm.intel.com>
 <5ee3eec0b0c8585b0b278d9f2f779d299aa51e3a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ee3eec0b0c8585b0b278d9f2f779d299aa51e3a.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb2f6ef-6d74-4806-e4a3-08dcd726af37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/EezrumeLPZp1LCb4iDWaTKlVRKLoyTMRyOrjiuVQzg1WcRDZyhq5eeaDG?=
 =?iso-8859-1?Q?d9vSJS9RdtBn3bl7mo6E6iRlys18Pev1myWlmDtRf/GGgFgdFST0UzLIHW?=
 =?iso-8859-1?Q?m5xaIAMOe7z3j0D6ESIxgoBnKE6H0mtlfElnUZL34BDoKU4kgtHTuI4g8s?=
 =?iso-8859-1?Q?sRJ0xtZBVp0u5XziJ2LS9EjtgOVe+KH+4bf5t2V2s3FPr07sUyZU8b9pQz?=
 =?iso-8859-1?Q?R6yvJz5WQ1WZ3dWZCsT69Zhmn9v9VThab9lsRqYymB7yf5w/PIEgQ8pIEP?=
 =?iso-8859-1?Q?ZI3IG6k5+RO9G3GOPvMbwNGkYMkQSM+sNy10hO5RCsX8PN9pKsu6C/U0ig?=
 =?iso-8859-1?Q?bi4YPAMOcBfeUdoOnypTWDjYsbIsHlQHoH/SenCp1snNKBeO1/jNYtXTrO?=
 =?iso-8859-1?Q?MYjni0TDMTvhrO5WjT0awB14KUxI8xDZgnxskcvqLFT10mSvTGUUOsTjR/?=
 =?iso-8859-1?Q?m4kp01kyROrwvABL4t6zUpi0CKgigf1xquVmyRH7sn1n3fJ5YrX+/ImEkj?=
 =?iso-8859-1?Q?dikrhm3R8odbB/ScoNSG96TRRVI7YcIF2fpIsiOgjNG/O1F0+3qcX/eWF3?=
 =?iso-8859-1?Q?mX2DMYqzRmx/djpRECW1Mo/usyBWNhSl/dGiKU+tG71nSVzEBJ0JiE12bR?=
 =?iso-8859-1?Q?IpvwhqE6izkjGYPi0EjIgPruo5bre0AVoVlvEYiVc+I+CgDRwXPAtOsbIG?=
 =?iso-8859-1?Q?n8I2T1Jr1v/X4Q2oRBiHlWYE50tSjJdD1H4R+RgUBFcWh8CR3H5Ic6EGsG?=
 =?iso-8859-1?Q?anRK+bhCMVNz2Fpr9txnc9VZm9HeRxV/9IEp6adaDY30Gzf8PVTfQowU2R?=
 =?iso-8859-1?Q?MjC1L/n83Adc7QvlR2+R2TRhEq9ZRmdHaqs66dahregaA6dWtZCgsidJY+?=
 =?iso-8859-1?Q?g+M1UN7E31rJI4wyLcdmWfHPN5tzJZrweTRJIW5mZ7LkZrpA8eFI1Hr5Bl?=
 =?iso-8859-1?Q?jmOWYawpDdtlQbqpuSYVjpRhvPE4jqXCJ/Afcs5IuxqzNIuxIH5rfbfZQa?=
 =?iso-8859-1?Q?Hid7eze1QqX2fzLqCLsp9mMvMV2doxSgMu11OozUlO15ChECqz/HdZqreg?=
 =?iso-8859-1?Q?VSaHQY2HJjAcLJFsNVE1uin4dBkmnbaZeUAMc83cTfLahg/39ben0On590?=
 =?iso-8859-1?Q?D8VhDh+eO9BHxRGb8NForm2xQDju1m8xiV1XS8P3ec6FCxrrAI7PyuHw5S?=
 =?iso-8859-1?Q?vDIEE86mMjl2LK3RgHDkJ3qsTmpLDMj4HHnoDagrsRYDte66Xpi27XaYWM?=
 =?iso-8859-1?Q?B2q3OEaANgdFis4CmB5sQZsWel8/JTf68oiDW3PMWG10sQEuFgSGTFb7Uz?=
 =?iso-8859-1?Q?Uk6acphFygmcjfOE/CszHUMbEdVAO2HDcfCftZhTu2+plac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XeoH9JF8rlOq5K7gjFJWtIyO5uH6w88KRrRJre5Kqy4umHlH61g+C0qsW/?=
 =?iso-8859-1?Q?fn9Xc9qfpED4RFhQ9t+lcxL9Uj3Uvm2RZZrZOtL5xSFGybChgKE1DHZgkg?=
 =?iso-8859-1?Q?5eupEO3d8Zb3MMEuwRmDx7sdWbS6MOyhiKFH3OWbJrvTIIbCmxERjxkTdp?=
 =?iso-8859-1?Q?wotbwVxDN1JyXXNwUc6ZVJyEjM78XhYvzLmJf2qpsRP59mEPAMmvkR8EsB?=
 =?iso-8859-1?Q?fsZkkCdZ32bTwGFkAsDiHGaPN12OtBMJFWB+XRE6mW9bxmIZIbbx3XW+mC?=
 =?iso-8859-1?Q?YKUti0K6RQ58pNe0cHk0TkMy8zMIFjkFQJEGBuQLR2x8bNtSi0ewAwFLYQ?=
 =?iso-8859-1?Q?kLSl6Mx+Fd6/2dpfTVzo95+GDoSKHeaQDfZJVCBhn5+dm4n4CCaCD4KLAL?=
 =?iso-8859-1?Q?ImtP5ZGpVh/sFPTpYWTa2KLggwAuO0aPlh2d6zA0oepxcIDtxx5KthzYvG?=
 =?iso-8859-1?Q?5wHFz6TB8OXxCbBoU4JooN23f0TvAAqMTpIbhA2idulAkc2g1gDPa0pB6Q?=
 =?iso-8859-1?Q?wGM1lwuUr7q+UxMNVtVDKUG4bn5Ci4T+//Fo1X5hCFl0Kkwn/d2NMgKDK9?=
 =?iso-8859-1?Q?VxumjpMBkvHRm+v42FPg8r06Xg0zruR86UM9PfdYni3x8h8JkEIsfSig1t?=
 =?iso-8859-1?Q?8UyNkOQ6qDduqyhrmRHjd9kDruVN8nQS5pwW75abNL1ry+4TQ2MQ++UI0l?=
 =?iso-8859-1?Q?Wnh+dNQFfaQO02YRveLIvAeEIFK/Laj92/pJAF2gfpVzIjEXWFI+haZrIo?=
 =?iso-8859-1?Q?S0aq+BePZ4ibJmiqUVfneo/KvraDO58I8q832t1AFfnMW/kwMZGniJqa3+?=
 =?iso-8859-1?Q?1SsCpwOarx2sSxlPlnhGseQgSt+mIuBuysp5i13ntu8OCGQCEAs9+gcMjC?=
 =?iso-8859-1?Q?UjyKDVoMU9o9NDrHQ+zDEoSBoRMWqq2nD9OIsv/uDCM1EtoBOV9MB+gR5D?=
 =?iso-8859-1?Q?SFM1Ly1H/jqkaBaPnT03wDNTXc4O4cYcSwGS0rTdHYW5efclgep2WTGCrv?=
 =?iso-8859-1?Q?3B9vnzvm/IYxoHAIi0hOEdxIiu5K4392cYLFJAuwQoCyIdAebJFzpd+URW?=
 =?iso-8859-1?Q?3byubnNpfaxXLAjlke8gyvNaHMFm1Ta3kdJvwGzcyJV+xXWplHL6HufDEr?=
 =?iso-8859-1?Q?nFYz8YwLxbq2TGouImzho2Z3C9ofSzc69AEZ7aEfKDPLMHkS/emYiIR98k?=
 =?iso-8859-1?Q?CsxoTMhVMYgrmPMLOJhW90a+OFTkchRJmOGgABdqQXqEsQuPWZlgS4WIXN?=
 =?iso-8859-1?Q?hDhQ1kJhIugT+b6h7uyANPDod09eQIXYjpb1rsu5V4fnyAVWbZkJ2rfypU?=
 =?iso-8859-1?Q?uJVXKmctVQBvmpvxnQ5IFrjV9uGcJJK/FtsxflnOkPYzLzbngFTsqmDzxR?=
 =?iso-8859-1?Q?GtBeyX8J7Zni2G01oHFMA9wSiCUSOPxbWIKZ8oGw4gpF5uquYvBSh45XEC?=
 =?iso-8859-1?Q?xEXXCGJDy+u0rk66FHHSkilSH7bH1btjfmHGuqtNrTJGKDCUr1GVxb5Q5w?=
 =?iso-8859-1?Q?WvwCXkH7mnyfy/c1LbQzY4gQ0bMeUVBLqEBrmMNzTxM0mHOK01IAnVLS7y?=
 =?iso-8859-1?Q?5Fd4eLmjOgyjzCs2wdbPWMxtzY+lIYtq794iWqRgTUg+QtmrmYDshTnyst?=
 =?iso-8859-1?Q?i16QA6rfn5Gh7YiCQybG8pWtxEKhBZwmvJ56dWuZoha7gNQHn/lPnTZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb2f6ef-6d74-4806-e4a3-08dcd726af37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 14:40:33.0723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjchwgvTQZdyCtzf8ulZPv/SwEIQBSFBbAzPhgA6m1O2TR26qcwjqi7YYv69PMfOwGY1f80TjCtba0kWOoIlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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

On Tue, Sep 17, 2024 at 08:59:10AM +0200, Thomas Hellström wrote:
> Hi, Matt
> 
> On Mon, 2024-09-16 at 13:55 +0000, Matthew Brost wrote:
> > On Mon, Aug 12, 2024 at 05:26:26PM +0000, Matthew Brost wrote:
> > > On Mon, Aug 12, 2024 at 10:53:01AM +0200, Thomas Hellström wrote:
> > > > Hi, Matt,
> > > > 
> > > > On Sun, 2024-08-11 at 19:47 -0700, Matthew Brost wrote:
> > > > > Ultra low latency for kernel submission of migration jobs.
> > > > > 
> > > > > The basic idea is that faults (CPU or GPU) typically depend on
> > > > > migration
> > > > > jobs. Faults should be addressed as quickly as possible, but
> > > > > context
> > > > > switches via GuC on hardware are slow. To avoid context
> > > > > switches,
> > > > > perform ULLS in the kernel for migration jobs on discrete
> > > > > faulting
> > > > > devices with an LR VM open.
> > > > > 
> > > > > This is implemented by switching the migration layer to ULLS
> > > > > mode
> > > > > upon
> > > > > opening an LR VM. In ULLS mode, migration jobs have a preamble
> > > > > and
> > > > > postamble: the preamble clears the current semaphore value, and
> > > > > the
> > > > > postamble waits for the next semaphore value. Each job
> > > > > submission
> > > > > sets
> > > > > the current semaphore in memory, bypassing the GuC. The net
> > > > > effect is
> > > > > that the migration execution queue never gets switched off the
> > > > > hardware
> > > > > while an LR VM is open.
> > > > > 
> > > > > There may be concerns regarding power management, as the ring
> > > > > program
> > > > > continuously runs on a copy engine, and a force wake reference
> > > > > to a
> > > > > copy
> > > > > engine is held with an LR VM open.
> > > > > 
> > > > > The implementation has been lightly tested but seems to be
> > > > > working.
> > > > > 
> > > > > This approach will likely be put on hold until SVM is
> > > > > operational
> > > > > with
> > > > > benchmarks, but it is being posted early for feedback and as a
> > > > > public
> > > > > checkpoint.
> > > > > 
> > > > > Matt
> > > > 
> > > > The main concern I have with this is that, at least according to
> > > > upstream discussions, pagefaults are so slow anyway, a performant
> > > > stack
> > > > needs to try extremely hard to avoid them using manual prefaults,
> > > > and
> > > > if we hit a gpu pagefault, we've lost anyway and any migration
> > > > latency
> > > > optimization won't matter much.
> > > > 
> > > 
> > > I agree that if pagefaults are getting hit all the time we are in
> > > trouble wrt to performance but that doesn't mean when they do occur
> > > we
> > > shouldn't try to make servicing them as fast as possible.
> > > 
> > 
> > Okay, there is definitely something to this. I have an SVM test that
> > serially bounces (i.e., each bounce results in a GuC context switch)
> > a
> > 2M allocation via fault about 1,000 times between the CPU and GPU. I
> > applied this series and added a modparam to enable/disable ULLS to
> > the
> > tip of my latest working branch [3].
> > 
> > Without ULLS enabled, the test on average took about 3 seconds on
> > BMG.
> > With ULLS enabled, the test on average took 2 seconds. I was
> > expecting a
> > small gain, but this is significant. Other similar sections I have
> > seen
> > a speed nearing twice as fast. It seems to indicate that this series
> > is
> > definitely worth pursuing.
> > 
> > Also note that any operation using the migrate engine will see gains
> > (e.g., clearing BOs, prefetches, eviction) in terms of latency.
> 
> I'm still concerned about adding this, and if we do we should only use
> it as a last resource if we see significant performance improvements in
> real-world applications. Historically all the latency optimizations was
> what screwed up the maintainability of the i915 driver and I think we

I agree real-world application performance is the acceptance criteria
and maintainability is always a concern. FWIW I thinks this series is a
clean implementation so maintainbility from PoV it not a huge concern.
If it created all sorts of new concepts I'd be concerned but it doesn't
- it largely fits in the already defined layers rather nicely.

> should be extremely careful so we don't end up in the same situation.
> Concerns also around power management.
> 

Agree we'd have to look that implictions of PM too. I added a forcewake
but really unsure if that required aside from keeping our asserts happy.
Obviously a spinning batch will use some amount of power but the UMDs
are already doing this too and that was deemed acceptable.

> Regardless, ULLS only really should improve things if we fail to
> pipeline migrations on the HW in the non-ULLS case, assuming that we're
> using a single exec-queue in both cases. Is that because we wait for

Single VM per device actually due to locking. Yes, the single VM tests
show a much larger perf improvement compared to multi-VM / process tests
due to multiple fault workers in parallel feeding the copy engine avoid
a context switch on each copy. There still is an improvement in the
latter case though albiet not as dramatic (~80% vs. ~21%).

> each migration to complete before allowing the next one? If so, is that
> something we could look at?

For fault handling within a VM, that is not we can easily remove due the
serial nature of the migration API as copy is expected complete between the
migrate_vma_setup call and migrate_vma_finalize call. Then *after* this
page collection and binding still needs to done in the GPU fault case.

For prefetches, I think we basically are going to have pipeline things
for performance but I think this a bit easier as we have a large working
set upfront compared to 1 fault address. This will likely get quite
complicated though, likely much so compared to what is in this series
(e.g. software pipeline with fence generation and async waits / CBs,
possibly multiple workers, etc...).

Matt

> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > > > Also, for power management, LR VM open is a very simple strategy,
> > > > which
> > > > is good, but shouldn't it be possible to hook that up to LR job
> > > > running, similar to vm->preempt.rebind_deactivated?
> > > > 
> > > 
> > > That seems possible. Then in is scenario we'd hook the
> > > xe_migrate_lr_vm_get / put calls [1] [2] and runtime PM calls into
> > > the
> > > LR VM activate / deactivate calls rather LR VM open / close calls.
> > > 
> > > Matt
> > > 
> > > [1]
> > > https://patchwork.freedesktop.org/patch/607842/?series=137128&rev=1
> > > [2]
> > > https://patchwork.freedesktop.org/patch/607841/?series=137128&rev=1
> > > 
> > > > /Thomas
> > > > 
> > > > 
> > > > > 
> > > > > Matthew Brost (8):
> > > > >   drm/xe: Add xe_hw_engine_write_ring_tail
> > > > >   drm/xe: Add ULLS support to LRC
> > > > >   drm/xe: Add ULLS flags for jobs
> > > > >   drm/xe: Add ULLS migration job support to migration layer
> > > > >   drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> > > > >   drm/xe: Add ULLS migration job support to ring ops
> > > > >   drm/xe: Add ULLS migration job support to GuC submission
> > > > >   drm/xe: Enable ULLS migration jobs when opening LR VM
> > > > > 
> > > > >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c            |  26 +++-
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |  10 ++
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
> > > > >  drivers/gpu/drm/xe/xe_lrc.c                   |  49 +++++++
> > > > >  drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
> > > > >  drivers/gpu/drm/xe/xe_lrc_types.h             |   2 +
> > > > >  drivers/gpu/drm/xe/xe_migrate.c               | 130
> > > > > +++++++++++++++++-
> > > > >  drivers/gpu/drm/xe/xe_migrate.h               |   4 +
> > > > >  drivers/gpu/drm/xe/xe_ring_ops.c              |  32 +++++
> > > > >  drivers/gpu/drm/xe/xe_sched_job_types.h       |   3 +
> > > > >  drivers/gpu/drm/xe/xe_vm.c                    |  10 ++
> > > > >  12 files changed, 268 insertions(+), 8 deletions(-)
> > > > > 
> > > > 
> 
