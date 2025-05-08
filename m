Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D645C3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 06:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3430B10E32E;
	Thu,  8 May 2025 06:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv1siTrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BC110E32E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746684561; x=1778220561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9rQxf8FJlpk+XMtOwB3E/QG0NlK3FIfe7SO6/8fqUfs=;
 b=Zv1siTrNTpoV+zNdjlgjzZjeABZwqFL8s5w9v6lFnE89vOCRpU1W+c5C
 pFVpTdpcXylizz10twapAVnrRiknSyTSOKUmtdKRRM7OuevF1V9JZwK1x
 baHTmesytug5uyPlGT2LWYWiOaPfkUjr6/rU/fp3sFTeHsTWxw9QjOaTY
 lC+U4zKVcx8tQH1/8lOcVO31uKTMQJr6KKcjEhu88Mn0xoeMo5UdO7+KA
 E6pymA/G+nZ8g5SI5BWHVKeSFxYHqVK5PWK0aouFGWAdzikuT6XZNgeBd
 ZAp29QIub7g1rJsS4NRmsCpMS8sjiSpexneJH0h28bhaPZrw4krxmfXxd g==;
X-CSE-ConnectionGUID: 9rBNjns0TEi8ZyfT75dxsQ==
X-CSE-MsgGUID: B6Mzuo+kTY2BLEPyCwfHqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48559310"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48559310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:09:12 -0700
X-CSE-ConnectionGUID: SVQt9XXURl2GcGmtbfquYQ==
X-CSE-MsgGUID: pacXLnF+QVipfq4nnCWF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="135890698"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:09:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:09:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:09:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQK3WcY1reCVxEtSUYkmKo9IH9cZXHLmAPD5UrFu6UVuSF+lFI2ezGk9cHl79XBZfe677KNjjkvC2U+/SryP+kL9ivYM+6FxFczYXfxzVwZbLvLOUUibbo40wkEdP+XIWoLJ1jUzklqN6/WLR3/bSFg9/xm7lr5vYjDFcKO/+04mVRDJ65ut+J2FhgmkGLD8CQm/mTZA+CheVQOwZR4l2GIuxZXxCYGikN4O8mhFefaWLVySJhcY18JQaZ9IVcd6j5OJbnb9Kdsak6BFjFZ9Co9z+aJwJ8NH1XzSz3+n4qeGy0irZZllse18LtN8G6aDmDPGpsUqI4sygTCzT5iJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuLB9qbt/CSsJ6uhkCULFgceW3Mp+zTMmxLxQInwY1I=;
 b=mBUGz0C1zqi1FHdsUkHYvzJbHV4HOx3W+PNzFvcMXmlALKapoObH1MbM/78i7IrY6+hJjsuhhgftaKa8DeGC4GSknQnFgEjkSY8Ce7FE/vWNLXt1uS2C1E1l/ngwnl3D+JkWjuAw56OqD+TVKBd4vUOHfYsaV4LDQL4fbaLPSHOerE2lWWStWbejRF0AeFfFL2wj6vzfCjTj97Nw0LCI2hsnJHhTb6E6czG2OTqZVnQvhbYC1lLhPydjaKDBW3BZPpCKzQjCeI0tVMHrDZAQalVWldXmGfA34HLgrHeqwoj4M62BaRNQjTYaVTWGdq7AJGSCmZVrvzOmHeAVAtwrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Thu, 8 May 2025 06:08:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:08:48 +0000
Date: Wed, 7 May 2025 23:10:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <aBxKxazQfqy8eK1w@lstrano-desk.jf.intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
 <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
 <aBvPBb5lzKRLlmyF@lstrano-desk.jf.intel.com>
 <aBvqFxhkzyPfu5d2@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBvqFxhkzyPfu5d2@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6cef24-d87e-4d19-cb23-08dd8df6cc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qURIVUibpbrNV2B5dDH7u3uGwEymqTi6K7RSCv/pQXjLgim8n3VcUQ9m0Nh?=
 =?us-ascii?Q?fUP67NwS4uca45B2pu1ZQd1L8aTlnL9wjAN1gzima7v3VmVvNAiBE1F1hYS8?=
 =?us-ascii?Q?vQQbzKWRCC8UknbkVx9rs4TMqXXGE+iNCUjCTdYoaELh0Bmw/FjYUP8tjHv3?=
 =?us-ascii?Q?LVJgHMt3HHVIxaytuuLf2GHlyvrw5S5zl89XX62ScPDUoCOuLMq6VFe8xPIe?=
 =?us-ascii?Q?UJWm6Y3j1Ky+dROtmF+fUeIau4r6zSS+Rf2RsxmnzI3ikxUx+VFj1k4nyF54?=
 =?us-ascii?Q?Kor7xoLM4lVphzK2PGdnmjXKXXg2jWzneNhUQ6ZzCWyOCtS0/Hur8bZJCj01?=
 =?us-ascii?Q?6gcUY69BJh77Ex0LmBi3tBZwd2SFCxau52NVgEspuLhM4JABNALN9K5ega+Z?=
 =?us-ascii?Q?1t4TgZuIwWKWRpblpd/uEggmFShnAUyb+Wj2ZRuNCiceM3FZ58FoUhh1BID4?=
 =?us-ascii?Q?augyKxjjc/4A4ddPyGnKQgn5hXKeCl6GyYzPoP5LDqthUSO47axUkIT8VRlJ?=
 =?us-ascii?Q?v/eY2gIoegBkfZXQSpk5CIPygbNvq7f4SoJOMRSvpPIrl50j+NiJHiz580z1?=
 =?us-ascii?Q?g51X2D6I8zjUOZ9KOZbpN/8lA2g3GuGIcfQgQYDgV81cA/X2OqoWqDZmKKtP?=
 =?us-ascii?Q?nbS5bbGISWUOvDFj+R2FH7oGa/B6tmHcDbZIA/lH7EwdRKdriSXa9oANYDzT?=
 =?us-ascii?Q?pRu3ZZaS06qdQsJlf7qjSTMfA8HqimsvNshhHxr0SmIjmWgh2LaaOyXtY2jE?=
 =?us-ascii?Q?IvMyfnYkBte3Ht70gFxQG+8XLusibysjEPv7z1FrAYLy/D0Rx9qdClJNCj65?=
 =?us-ascii?Q?0x5aHlr3aeVx8NOzJP8PPxEJQYw1/934WZXW/gYCGPS5ybaoPwthu90cweLY?=
 =?us-ascii?Q?BkZfWz07NSivvTJl8OHB66/oRl+ogJ+1EYY76u4k0B3g9O76fRcm3kiTXsUJ?=
 =?us-ascii?Q?+tIiMSNdFdlMbBSfJaP8eaQBifM5HhKNuWSlXKFr5cTYX+VNQuSRbharsXOh?=
 =?us-ascii?Q?udErBfKn2iWdww7NhWR0RBJgtVgMxTf0QTtGKGyWGVSB3VWTIeU9oYVJ4J8w?=
 =?us-ascii?Q?ys+gqPr8dgTRiBWbr10tkZaeuMcFTWM2DGRj4mqqIOpHsKuv3fZiDvx2eQv4?=
 =?us-ascii?Q?yCWXZyNN0+ap01LbHXqbEbsDcAzjbP84/ncU+wa5Vgpmt5MTmRWvTFo+LZTc?=
 =?us-ascii?Q?+CYCm2nEcidR6AuzxxEVO6TEnCRJEo0jKsj3RoqOPzfL3NwJXJccOn81B9Qn?=
 =?us-ascii?Q?x8YHfL/MP0LiWnFjC99DxATaE95Yzhly/F/hdBV2udh2CU9ZVVSxtoOk1AHn?=
 =?us-ascii?Q?YG1eRLjFs3SNJo7moHx8Z7hAC5Rq9hlNMprXixWJHooys5Jxagiey911eFZh?=
 =?us-ascii?Q?12q4/5U+6ZDnoJhwaXO4KHy3eofDl6XaGFv5NcyyDwaUczTpyeRCSJWO/Ht6?=
 =?us-ascii?Q?L4CsBd1+21A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iNWQFG7q9DSuY2NIDUcxZqNPc1SnM19+0KN7nxAKHz9+u5pwyqPM+IWz57Sv?=
 =?us-ascii?Q?uETwdJoykxxXtbim0Jo3eBUTehfZtNyuetKyGay8DZvVfwByP4em0NMN3zAc?=
 =?us-ascii?Q?zKsDnaqlHJSXY9ehKuNHeXr2NSDly5uw3nyRAfwVtx4tFOBvoQzGKhrTgvnz?=
 =?us-ascii?Q?53807EkQl7F9vIpIuWIDiusTn+et70bz72iN3cSesN4riqT2QMzV52FEPe/H?=
 =?us-ascii?Q?TgHoUdOfWF+mVCQ6Qjj/ThRaSnvh8w8FstHyo17l22XpGO7Dz8YIWKbekcjM?=
 =?us-ascii?Q?RP0nN0NoAVRAoYv+vdqBBZXXds8r3KhFnVGeVQDQgpDFYvyRVbfoWWp9N+p6?=
 =?us-ascii?Q?0//7jNdbpBe/SLWwFcGUX2Qf023VyQB90ylXUaLYOwRYVpqZmYTL+myfsj99?=
 =?us-ascii?Q?9MJlP9yQbdlg8Dh/rB4r3mYyuRgEvpJq4LUPNCMXYTBqBDYhymLS2KU7ki3y?=
 =?us-ascii?Q?9I8a5H4nhY9ACqm/iEZ7Uydc1xMTFqNDbcmphCMN71b3TB4AI6Zqp/3lB/gt?=
 =?us-ascii?Q?QDP9Vek55sk+j0jHPO1+sFlwNqAEXDUkpyvbyKBE6IkGAN8vqife99J3tzKp?=
 =?us-ascii?Q?gi3GHToW4X5W5nwmOl4V4lbzP/8KY1JjPFPS4xyhnzSJAlNbrs3cc0q33pJo?=
 =?us-ascii?Q?ay7ilkdKivD5PcFbG70Eox3/csK+tm2aWZTSMymuM/LLGNXEHRApQaJryjXu?=
 =?us-ascii?Q?dvLQe8oFXQKqpVwfgv31iOvNh2F9x8DCdrGdBLNXEP325vPQU3DVfLCHkDmx?=
 =?us-ascii?Q?BE1U/s9boadc/VZFKKiqJNpR6wxBWu4ognWsRLFB7XIbw8xj4I7Pbhq9Zoqf?=
 =?us-ascii?Q?DfUJiPaHKNb6+Qwg2WOA7XsyFDz7dUHO3gf5aIgAU6TGnUplwxYK6kpihw/N?=
 =?us-ascii?Q?H2YP3cbaAqDVKAVo3rM/Qlawn7YLxp2Ah8Ax8FeNjJVUzvSKSHvnmcJMupfN?=
 =?us-ascii?Q?xyrCk5039t6dP+Xsmp2D/cqxy/CTpQ0T0SaE4A4ff/3JMB+luOyjL7bBBX+U?=
 =?us-ascii?Q?MvdVY2iBS0H0+YxEXXm88iCdu/jdUMoldzO4reGGDV16djH2+GgG3OJFg7Dl?=
 =?us-ascii?Q?1tR3/V9xOL5H7MUNJzDxP+N59eklYfmINNwUnU0DrHXuUM3H5wUcZsnF8NkZ?=
 =?us-ascii?Q?krNwgmCTVo89W8Qj4k08FaqGCa/j9t38Vbd28lUxT11WNZDxQ7dE+yXWqIdn?=
 =?us-ascii?Q?8CbVrzNzmcjPL1FmnMWRWszy1/zrSc57aHsK+MAz3+U70q4I5G2OsHcaZrO2?=
 =?us-ascii?Q?0jewZszrs4cvCi63n0OB9Ys92Fva7NqOC5UQCNiSwb+/9drlbmYB6XS7dVbk?=
 =?us-ascii?Q?zLONF7949GWxtsdpJ3AKj6XHhH4YOdg58I7D5kh33q0qKPFO1dZpNsFhmxcJ?=
 =?us-ascii?Q?56shMkCu3EZcVHNE0cx9X8tmxOOh680d9UH3rA6kt51SoIm7Ob5gIZL3kiWx?=
 =?us-ascii?Q?PZIl2owwSxaJufofrhj401V/gqjjjkhv8kEaJI5AJOtNYWmXYJHA7ZQAVAer?=
 =?us-ascii?Q?os9lH5sgJ9eGVCcu9Jjrz8+KaKUSzC6sn+qwLrmuNhSf90vJRH13wvnjYpWN?=
 =?us-ascii?Q?VApO/Zjf+3UYWu91MR2/b6YFVsBJ9+43M5Btln3WuSLDNY/tanoTvWK4cV2Y?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6cef24-d87e-4d19-cb23-08dd8df6cc33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:08:48.5670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBG86oDHn7v38+KdLzRVrI90XXAma+RdwWZ/Hxzgw7PoU6hjmtMDPo1WMgH0ZLSsrANYkIdhw4A6DvJ42KwUhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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

On Wed, May 07, 2025 at 04:17:43PM -0700, Umesh Nerlige Ramappa wrote:
> On Wed, May 07, 2025 at 02:22:13PM -0700, Matthew Brost wrote:
> > On Wed, May 07, 2025 at 04:14:22PM -0500, Lucas De Marchi wrote:
> > > On Tue, May 06, 2025 at 06:30:42PM -0700, Umesh Nerlige Ramappa wrote:
> > > > Where available, add support for 64-bit CTX timestamp when calculating
> > > > job run time.
> > > >
> > > > v2: (Matt)
> > > > - Use xe->info.has_64bit_timestamp instead of version check
> > > > - Allow timeout > 100sec on platforms with 64-bit timestampt
> > > >
> > > > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
> > > > drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
> > > > drivers/gpu/drm/xe/xe_device_types.h     |  2 +
> > > > drivers/gpu/drm/xe/xe_guc_submit.c       | 18 ++++---
> > > > drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
> > > > drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
> > > > drivers/gpu/drm/xe/xe_pci.c              |  2 +
> > > > drivers/gpu/drm/xe/xe_pci_types.h        |  1 +
> > > > drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
> > > > 9 files changed, 90 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > index da713634d6a0..52f4c96c01dc 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > @@ -154,6 +154,7 @@
> > > > #define   STOP_RING				REG_BIT(8)
> > > >
> > > > #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
> > > > +#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
> > > > #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
> > > >
> > > > #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > > index 57944f90bbf6..8619244b7c7b 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > > > @@ -12,6 +12,7 @@
> > > > #define CTX_RING_START			(0x08 + 1)
> > > > #define CTX_RING_CTL			(0x0a + 1)
> > > > #define CTX_TIMESTAMP			(0x22 + 1)
> > > > +#define CTX_TIMESTAMP_UDW		(0x24 + 1)
> > > > #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> > > > #define CTX_PDP0_UDW			(0x30 + 1)
> > > > #define CTX_PDP0_LDW			(0x32 + 1)
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 495bc00ebed4..9446a739948c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -334,6 +334,8 @@ struct xe_device {
> > > > 		u8 has_sriov:1;
> > > > 		/** @info.has_usm: Device has unified shared memory support */
> > > > 		u8 has_usm:1;
> > > > +		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> > > > +		u8 has_64bit_timestamp:1;
> > > > 		/** @info.is_dgfx: is discrete device */
> > > > 		u8 is_dgfx:1;
> > > > 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 813c3c0bb250..bef32f2b0081 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > >
> > > > static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > > {
> > > > -	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > > > -	u32 ctx_timestamp, ctx_job_timestamp;
> > > > -	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > > > -	u32 diff;
> > > > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > +	u64 ctx_timestamp, ctx_job_timestamp;
> > > > +	u64 timeout_ms = q->sched_props.job_timeout_ms;
> > > > +	u64 diff, max = U32_MAX;
> > > > 	u64 running_time_ms;
> > > >
> > > > 	if (!xe_sched_job_started(job)) {
> > > > @@ -952,15 +954,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > >
> > > > 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > > > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > > > +	if (xe->info.has_64bit_timestamp)
> > > > +		max = U64_MAX;
> > > >
> > > > 	/*
> > > > 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > > > 	 * possible overflows with a high timeout.
> > > 
> > > this would not be true anymore with a 64b counter. Anyway, why would we
> > > need to be soooo paranoid to increase this and consider a diff >=
> > > 223sec? For the timeout check we can leave with the counter wrapping at
> > > 32b afaics and not change anything here.
> > > 
> > 
> > Why? If the counter is 64 bits I don't see why you'd wouldn't use all the bits.
> > 
> > > > 	 */
> > > > -	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > > > +	xe_gt_assert(gt, xe->info.has_64bit_timestamp || timeout_ms < 100 * MSEC_PER_SEC);
> > > 
> > > the assert is on the value of q->sched_props.job_timeout_ms.
> > > Why are you removing it? Or even why is the assert in this function
> > > rather than on init?
> > > 
> > 
> > Admittedly a bit of an odd choice to have an assert here rather than on
> > init. Also in practice the highest value I think timeout can be is 10s
> > without a special build of the kernel to allow crazy high values.
> > 
> > > 
> > > >
> > > > 	if (ctx_timestamp < ctx_job_timestamp)
> > > > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > > > +		diff = ctx_timestamp + max - ctx_job_timestamp;
> > > > 	else
> > > > 		diff = ctx_timestamp - ctx_job_timestamp;
> > > >
> > > > @@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > > 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > > >
> > > > 	xe_gt_dbg(gt,
> > > > -		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> > > > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
> > > > 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > 		  q->guc->id, running_time_ms, timeout_ms, diff);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > index 9d9be9383207..b5f5547c7c4f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > @@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > > > #define LRC_SEQNO_PPHWSP_OFFSET 512
> > > > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > > > #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> > > > +#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
> > > > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > > >
> > > > u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> > > > @@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > > > 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> > > > }
> > > >
> > > > +static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
> > > > +{
> > > > +	/* This is stored in the driver-defined portion of PPHWSP */
> > > > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
> > > > +}
> > > > +
> > > > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> > > > {
> > > > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
> > > > @@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> > > > 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > > > }
> > > >
> > > > +static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> > > > +{
> > > > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> > > > +}
> > > > +
> > > > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> > > > {
> > > > 	/* Indirect ring state page is at the very end of LRC */
> > > > @@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
> > > > DECL_MAP_ADDR_HELPERS(regs)
> > > > DECL_MAP_ADDR_HELPERS(start_seqno)
> > > > DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > > > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
> > > > DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > > > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> > > > DECL_MAP_ADDR_HELPERS(parallel)
> > > > DECL_MAP_ADDR_HELPERS(indirect_ring)
> > > >
> > > > @@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> > > > 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > > > }
> > > >
> > > > +/**
> > > > + * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
> > > > + * @lrc: Pointer to the lrc.
> > > > + *
> > > > + * Returns: ctx timestamp udw GGTT address
> > > > + */
> > > > +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
> > > > +{
> > > > +	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
> > > > +}
> > > > +
> > > > /**
> > > >  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
> > > >  * @lrc: Pointer to the lrc.
> > > >  *
> > > >  * Returns: ctx timestamp value
> > > >  */
> > > > -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > > > +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > > > {
> > > > 	struct xe_device *xe = lrc_to_xe(lrc);
> > > > 	struct iosys_map map;
> > > > +	u32 ldw, udw = 0;
> > > >
> > > > 	map = __xe_lrc_ctx_timestamp_map(lrc);
> > > > -	return xe_map_read32(xe, &map);
> > > > +	ldw = xe_map_read32(xe, &map);
> > > > +
> > > > +	if (xe->info.has_64bit_timestamp) {
> > > > +		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
> > > > +		udw = xe_map_read32(xe, &map);
> > > > +	}
> > > > +
> > > > +	return (u64)udw << 32 | ldw;
> > > 
> > > I understand doing this for the next patch, but for this timeout I think
> > > we could just discard the upper part and let the 32b wrap.
> > > 
> > 
> > Again why? Seems odd to not use all 64 bits if available.
> 
> I would use all the 64 bits. The only problem with 32 bits is it appears to
> be small, maybe if you run a job for something like 500s, then the wrap may
> have happened twice and we won't know.
> 
> Is the LR (long running mode) not subject to drm job timeouts? If yes, and

No - LR are not subject to drm job timeouts.

> if there is no practical need for 64 bits for regular mode, I can revert
> those parts.
> 

IMO we should still use all this bits available to us, but agree there
is no practical use as long timeouts violate the dma fencing rules. Do
whatever you / Lucas seems best. Series LGTM.

Matt

> Please advise.
> 
> Thanks,
> Umesh
> > 
> > Matt
> > 
> > > Lucas De Marchi
