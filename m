Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A87BC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 18:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4978E10E76F;
	Tue, 18 Jun 2024 18:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiXhUlYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566ED10E217
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718736317; x=1750272317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zdOTe8UnJV6KuZNWcAukkt3mjTwdNZj43oWaQS7ODTM=;
 b=JiXhUlYmiQ9ywoQtRK27SpvmUAeLJXAAlCvhiGecohVQYpd5bxwewruF
 RMIxunoKbNTsVKI/bc/zGG9kV+HBiptTi64KUVjm7UahnDsigf7BXNf8X
 mCA/glglZJ8fdVvZoIu4hihr2sIJbxd0Vzk44A5Il31fAyrd5yKKLEJtn
 QZZATeazD0se+1vSI1cD++jEkDuwILSmRTrBG6HvUjOYKfQvLzxgADhAC
 bOulDkPKZdlJbpvtXIsho3n3b/8U7l62NByR8jtK1H82wPHU+oiUpEjNR
 Qev1DaZtuSRWDpndKofDm71+RAWFxodYnImycwPg9ZYtof0YZKbJ++V7E g==;
X-CSE-ConnectionGUID: 6qRS8vsBSDCnAxOHWSHrew==
X-CSE-MsgGUID: Vj656TDSSSaEvqBRf4a+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33108573"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33108573"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 11:45:15 -0700
X-CSE-ConnectionGUID: nH+DZXMhSBKGB2PQCKDNtQ==
X-CSE-MsgGUID: eAQfCBhqRDSAuN64bIkatA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41499575"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 11:45:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 11:45:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 11:45:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 11:45:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 11:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY2J3T3wGMRe7iY8Dlys/ly+GnzIdz2HjE9WHBF/SU1XEA8XnxwgNOj5o7v18QNQNB6ItFkuexHwcTDyAZ4GtjfiUCKv69DjdlsmPol37HspXJtaqjxCxscvMRz+RyXWgxBqpVw0aFd0LDd5Q4AOYZGVRW28lOz6IUkJChPtMuD9y9QG/POV4pAhOhqYUAM9G0yWhIet3LXCOl499ElFairC5Gu83wKp72tRr+NqzNoToNGXh+OkSW7w8nUzzbXLOIakMcFijCvY9xkTZ5H1FzCDd3HCvu8dZCyfm4aY0V6jj0CiWSEvaOPTFN8zMO+/QmPqHL8xxiKyc5JnG/xCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5QkvVMkaYEBeIrs0aHEOchdleZ7EgsLBW1jdpcdemk=;
 b=oCJ20SZO5BnMtWTrX2Q5So7BkuqEdFV/PpwVDPJBAlBeTRo2oQFyBvi6pYzR+PYbUv9iWnJtkhGUAuamuqpsciCkIQ9KDW72iyrIjNragWCor5x98wOFv4L7ZctZz+thwPav3R9741TwovQnqlFcSIEsTpQ8RaVgxNI3uvopQa+kZ2N8MCaJOfdN+Qu2nY/yv8i0RdsM2CcbIy7SJMGJrrtbx969GXC9Eto04YKYlSmzomOEmk69qTWbu6ipZAJx0ZJRsLwyG+cMYnGc2Jglpjayfhdv6yyPM7ANfjTBUZEoF7HhGYBTugCxWN5P/8Cub5JBWfHM/Y2gOpzNaszcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 18 Jun
 2024 18:45:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Tue, 18 Jun 2024
 18:45:08 +0000
Date: Tue, 18 Jun 2024 18:44:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnHVlJkNFRjARuNQ@DUT025-TGLU.fm.intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
 <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
 <ZnDgBvtYGtAJt9Xv@DUT025-TGLU.fm.intel.com>
 <b002361e-5c40-4902-abe0-107608ab8a08@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b002361e-5c40-4902-abe0-107608ab8a08@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4c0428-27f0-4322-973c-08dc8fc6c6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KrYUQjgnIOa8KUnC1t6+dmb0KhSOqzQqedw+vOqiA4Au2lwt4Lm+m07MCVjL?=
 =?us-ascii?Q?7lv958V6YxdCwVP1EEJUI9ijiPshcwM7o+RHpr4P5QRVbV5g2MPcuBBNEg69?=
 =?us-ascii?Q?GihXPDNSb/+IC2ajoiqrQrz0rjZthHy1CfG8AT/a1mjKDJMCKYslbarZPRNI?=
 =?us-ascii?Q?roQTKyH4zf4gnQqF75HQtluoJ9XzTa5JnDKzsUBoCoibyvRZPYxd3Lxq2RnR?=
 =?us-ascii?Q?LxCarFkQuU/FOpkec3Blr7nHtdThNq5ZzPbo4LFnnF6RwmfJiudoJ8uENULL?=
 =?us-ascii?Q?nRr7Vwh3SzAZ4e5RjaWbitKyOpQpkqWE2QGgOuimE0M11s2Suuw7hPJ0p7Bx?=
 =?us-ascii?Q?kSFAXexC78+IcgvKAKS0dcGIPxfmxRiWpLOdEVGJ3ucLZC4EVoziTtE+Mbom?=
 =?us-ascii?Q?+6o2TWCwMjmf8FFqafc/5//9Z3FQeJqQGIbGqMC7CvbVhbinb+F3LW7lTuSX?=
 =?us-ascii?Q?qB8rK49Xpinm71MD/cy7KYRqXAFmayK9FFq4FssZqY9qJzAcC0EeQEoyasW3?=
 =?us-ascii?Q?vxZ66nUKllJ5Z9ETy8rlk9lCTWXNHbbnmD305czSgs8xXDfo2S8Bvr4F6b0o?=
 =?us-ascii?Q?DaYZ2IEXbbxYrxhC6f1bClAZqbSR2VRo3Y6sKJ2avf8WA8k+l3lOv7b/FeAo?=
 =?us-ascii?Q?0TBMJLktMrc9P6ucBE4S81fhu/Ai2gxvYK/gHDxhkjLsGtlhh3Wgm+sYr97P?=
 =?us-ascii?Q?0oH4AN2xcO7sIb9EeR2kHKwoXDDtIZwZhVdCyRrHvOrsOmjrViP+IdwTHMQy?=
 =?us-ascii?Q?3p/q3qMglhiqPjoyW+sKuhezFhBk1ilsBCbX5knY7GvinJGdtV/xOd8GCPIf?=
 =?us-ascii?Q?3UprjoZO7A5dKKQnR+l4PjrSSEL+wHqmDhhpZnmBMKvMva5MH4S2K4+fjvjq?=
 =?us-ascii?Q?mckfPSicQd11wDomJrFmwoA/93+668634eSFe6+I0LDL0LeB/cJ1SCFlVqpR?=
 =?us-ascii?Q?iOWz0yjEuna76mSASe0VZ/+V5W1x68ROT1u17fyl0NAkE0x81q1SsNAYugOY?=
 =?us-ascii?Q?zN6jW1rtORw5PysXq7MaowgAG4OtkygYySV6bDU61T/LbjeOGplXFIW/LnG4?=
 =?us-ascii?Q?Bj+HzkUSgDv/R2Rm4gw6l9uoqneD6LLZATYUX4sTK+5XzcXQ9GjbewgotQIT?=
 =?us-ascii?Q?Q4CRqYnuMXhoqfazew8jnqCrXxD1MdhF0CdxX0+yJ/lfoPzL/VxS5vwTLsAD?=
 =?us-ascii?Q?EJNvUQwcvKVhxTTnk+UsJeS+fI831zP4f1tbmEyfdxJp26EJ3ayIoxN57U/A?=
 =?us-ascii?Q?F4HDaRN7q3cKGf1XZfJjTZBfsOLiZ4MZ37NjNirYTw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KMPtEcGvjsROrL3mQGo1SILaTeZlKrfClhJ1xubM/CjCE3Ygm8WdC1IHUuQy?=
 =?us-ascii?Q?G8bHBJt92iMJ2VTgxDcAyPMBcDbIfpqNCiTNpE1PLOXSRGbsjHTvySBOJO9M?=
 =?us-ascii?Q?UK1DrENnDFrjfA/VkXf1jeKxxRAWYTjrILXF2xKtpkk9txu2xzhXrbpNnLLo?=
 =?us-ascii?Q?DqUcpiCBGAjrDHDNjvu7LLafSQEutgj80cDgyC8X4qcg+DLFioWQK5unRxwI?=
 =?us-ascii?Q?eNzYTHOC0h6Kw+t1D9AWRIin+f3AymNRd5C5ZSQr/RZ6vA5tKBFfaKH8jxSY?=
 =?us-ascii?Q?mBiumnP8EFQEng7iMdje7xnjz5P0mX5fmG/+xCFvk2kCpjv4VXvd1lqByC5Q?=
 =?us-ascii?Q?QEtQeeTO/2nwqMjYKteXTHK0dljOMrGRo7AS89cGVoT8nlQYKqB/b1tQQQzI?=
 =?us-ascii?Q?oKLtOohC3H5PvwmEhSIA/w6Pjv/+am2harNTZ1Ic3+g6PUJF/kr5luPxaR39?=
 =?us-ascii?Q?bG0FSpN2pGbOIzSeP3/CBKu2wy/OaNvYVIjyxJwxgoGXeg2OHG/Cph8Af28L?=
 =?us-ascii?Q?s7FsW4ickItdh52FSxv7XGiPsqX9ilE81ZZ5cYZf8goyhmVebKP63klX3zXY?=
 =?us-ascii?Q?JK5dOnHeOzNS9XQrw9aYXMloHJYDA6y4XHlStOOScfZVEqY25em+yKlwNR8x?=
 =?us-ascii?Q?s9GkPnmJLqi31jEBTFZa3rlX84VaG5GjiQZn8C8mkhOvJ66yXYqQVGPNNgwZ?=
 =?us-ascii?Q?SOJ1H6R5X4KFT6MOidzx8U2B0DGgH+wITb2U/ctOw7l4hoHUV9Vo+1GWj6LN?=
 =?us-ascii?Q?B14XAlI8lFWxGx6QXjOtCUxiTgp7jw9miLc7hfx/vjlgnxmyWjRu8wVh5f7/?=
 =?us-ascii?Q?EGKUsXnCF2uKHSJSy9spW+i37RLpxooMUCi3ZScBfqukYwXO+6uJAy9Hoowm?=
 =?us-ascii?Q?Ft5FJ+N3gEtbWE2jVEZzI7BInVOv3niWo7VtRyHpYhEMu+aTPtsymimHNIiL?=
 =?us-ascii?Q?4Q8ugXc71uI6qPWZcjq6r0bEe16WuhF97G96JijBfvEJGC0AGHd4dPcWO7B3?=
 =?us-ascii?Q?z9zELon4bB530lM1tA4t89YPr+Iurpd9u0DxwFcRuRrItG9LrvCat91vOc7m?=
 =?us-ascii?Q?RtpQSJAivRfm++VT3OEBQ6WtgB4gmb8ZqXLadP6HAGmmL6IxAIsCJoC6Qu16?=
 =?us-ascii?Q?kZiRuyVFyKBjxC3HiWg6VU3cRT2qtSwGku4LRmgKJzuFj2v8rQOgoiDhFOxf?=
 =?us-ascii?Q?m4bns973LtvHNNg+df084FAkKfsYgke80OH2ChNdIQOqXt9aUzklf28XrFuE?=
 =?us-ascii?Q?BYIt8wV3aV5Iw3/2zARv3HMhW1oOXGJlQLQuM4pgxugUT32K+KtmW2ibF0q3?=
 =?us-ascii?Q?REAFMayyQfzKVKBtHYiCnMkCPdZU5Wf8Zog4OnA4tUNVudCgy4kjARoAUsSK?=
 =?us-ascii?Q?+Tx0ULULMWJEviFzhM4Zc3/v4nGPLC3AWTj57k2J2iPLFWmKv1nj0KQMhwWf?=
 =?us-ascii?Q?7HIQFf4HeHZuXbMYUMJvPBRsj1Dd9Hf6cQTsfx1TrTtCkbJ/WwzWK7OLL6+5?=
 =?us-ascii?Q?FMXHxBXqUy/5ZloNbO4NBG/QUKh6QJLoDSy0J4YLvbuCk3dp5I3BlJVzkmaM?=
 =?us-ascii?Q?us4omPsMdkyVMn2ESA6gvoJgfzNgKUIFS8V4KgOfNtmRslbCb5OvLThoQ0Qc?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4c0428-27f0-4322-973c-08dc8fc6c6e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 18:45:08.4336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9I6YVyUIDqIsXlQkI+mxZWj4usnbfjuC1SeRFzFuICv6YioLKqkuTtF7M1rZnUJ+N+gV2tIcuZ6j+6NaDqceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

On Tue, Jun 18, 2024 at 08:08:05PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 18.06.2024 03:16, Matthew Brost wrote:
> > On Mon, Jun 17, 2024 at 07:54:41PM -0500, Lucas De Marchi wrote:
> >> On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
> >>> On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> >>>>
> >>>>
> >>>> On 17.06.2024 20:00, Rodrigo Vivi wrote:
> >>>>> On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> >>>>>> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> >>>>>>> There is support for 'classes' with constructor and destructor
> >>>>>>> semantics that can be used for any scope-based resource management,
> >>>>>>> like device force-wake management.
> >>>>>>>
> >>>>>>> Add necessary definitions explicitly, since existing macros from
> >>>>>>> linux/cleanup.h can't deal with our specific requirements yet.
> >>>>>>>
> >>>>>>> This should allow us to use:
> >>>>>>>
> >>>>>>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> >>>>>>> 		foo();
> >>>>>>> or
> >>>>>>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> >>>>>>>
> >>>>>>> without any concern of leaking the force-wake references.
> >>>>>>>
> >>>>>>> Note: this is preliminary code as right now it's unclear how to
> >>>>>>> correctly handle errors from the force-wake functions.
> >>>>>>>
> >>>>>>
> >>>>>> I'm personally don't like this at all. IMO it obfuscate the code with
> >>>>>> little real benefit. This is just an opinion though, others opinions may
> >>>>>> differ from mine.
> >>>>
> >>>> except that is more robust than hand-crafted code that is error prone,
> >>>> like this snippet from wedged_mode_set():
> >>>>
> >>>> 	xe_pm_runtime_get(xe);
> >>>> 	for_each_gt(gt, xe, id) {
> >>>> 		ret = xe_guc_ads(...);
> >>>> 		if (ret) {
> >>>> 			xe_gt_err(gt, "...");
> >>>> 			return -EIO;
> >>>> 		}
> >>>> 	}
> >>>> 	xe_pm_runtime_put(xe);
> >>>>
> >>>> and thanks to PM guard class we could avoid such mistakes for free:
> >>>>
> >>>> 	scoped_guard(xe_pm, xe) {
> >>>> 		for_each_gt(gt, xe, id) {
> >>>> 			ret = xe_guc_ads(...);
> >>>> 			if (ret) {
> >>>> 				xe_gt_err(gt, "...");
> >>>> 				return -EIO;
> >>>
> >>> Just responding with a question here - haven't looked at the rest of the
> >>> comments.
> >>>
> >>> How is this not still a bug? Looking at scoped_guard, it appears to be a
> >>> magic macro for loop which acquires / releases a lock or in your
> >>> purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
> >>> step? I see coding patterns like above in the kernel [1] so I do assume
> >>
> >> with __attribute__((cleanup)), the compiler guarantees that
> >> it's executed when the variable goes out of scope. What you are probably
> >> missing is the use of CLASS() declaring a variable inside the for, which
> >> uses attribute cleanup:
> >>
> >> 	for (CLASS(_name, scope)(args),
> >> 	     ...
> >>
> >> GCC's doc:
> >>
> >> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> >>
> >> 	The cleanup attribute runs a function when the variable goes out
> >> 	of scope. This attribute can only be applied to auto function
> >> 	scope variables; it may not be applied to parameters or
> >> 	variables with static storage duration. The function must take
> >> 	one parameter, a pointer to a type compatible with the variable.
> >> 	The return value of the function (if any) is ignored.
> >>
> >> 	When multiple variables in the same scope have cleanup
> >> 	attributes, at exit from the scope their associated cleanup
> >> 	functions are run in reverse order of definition (last defined,
> >> 	first cleanup).
> >>
> >> 	If -fexceptions is enabled, then cleanup_function is run during
> >> 	the stack unwinding that happens during the processing of the
> >> 	exception. Note that the cleanup attribute does not allow the
> >> 	exception to be caught, only to perform an action. It is
> >> 	undefined what happens if cleanup_function does not return
> >> 	normally.
> >>
> >> This was only possible with the recent change in the kernel raising
> >> the minimum C std to gnu11 (uapi is still c90 for compatibility):
> >>
> >> 	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
> >> 	Author: Arnd Bergmann <arnd@arndb.de>
> >> 	Date:   Tue Mar 8 22:56:14 2022 +0100
> >>
> >> 	    Kbuild: move to -std=gnu11
> >>
> >> 	    During a patch discussion, Linus brought up the option of changing
> >> 	    the C standard version from gnu89 to gnu99, which allows using variable
> >> 	    declaration inside of a for() loop. While the C99, C11 and later standards
> >> 	    introduce many other features, most of these are already available in
> >> 	    gnu89 as GNU extensions as well.
> >>
> > 
> > Thanks for the reference, will checkout.
> > 
> >>> this works, just confused how it works.
> >>>
> >>> With that, any code which isn't easily understandable IMO is a negative
> >>> ROI as it just creates confusion in the long / makes problems harder to
> >>> understand. Again this is just my opinion.
> >>
> >> I think that is mainly about getting used to the pattern. I think we
> > 
> > Agree once pattern is understood, fairly easy change.
> > 
> >> just have to be careful not to overshoot on trying to use everywhere.
> > 
> > Agree about overshooting. I think we agree we want to use cleanup.h
> > semantics in Xe we should start by converting kernel core components
> > (spin locks, mutexes, rwsem, kfree, etc...) to use these semantics
> > before adding our own ones. Also with this, I think if we use cleanup.h
> > semantics, we use these semantics everywhere we can (e.g. directly
> > grabbing a spin lock is akin to open coding and not allowed).
> > 
> > Once we convert Xe core componets to use these semantics then we start
> > adding Xe specific ones.
> > 
> > Thoughts?
> 
> IMO if we decide to promote new cleanup mechanism for core primitives
> like mutex/spinlocks then we should already have wrappers for Xe
> specific stuff like PM and FW handy to avoid mixing patterns and allow
> use them together if applicable/desired:
> 
> 	scoped_guard(xe_pm, xe)
> 		scoped_guard(xe_fw, fw, XE_FW_GT)
> 			scoped_guard(spinlock, &lock)
> 				foo();
> 
> and even if we just allow, without immediate enforcing this new cleanup
> mechanism, then it still could be beneficial to introduce PM/FW support
> to start closing any gaps we may have in any of these areas and to do
> that in small steps whenever we make changes around problematic code

I believe that mixing styles (like goto/unwind vs. RAII) within a single
code base will only lead to overall confusion. Personally, I strongly
oppose adopting RAII semantics halfway in Xe. In my opinion, we should
either fully commit to this approach or not at all. There will likely
always be exceptions where RAII doesn't quite fit, although it's unclear
how often that will occur. Therefore, a quick RFC to convert some core
components to RAII could be helpful in visualizing the impact on the
code base.`

Additionally, there's the question of how far we should extend this
approach. Should we create RAII helpers for get/put operations of local
objects in functions, etc.? Is this even an acceptable usage?

Another consideration is whether the larger DRM community is open to
this change (i.e., can we begin using RAII semantics in DRM code)? A
cursory search on Linux cross-referencer doesn't show any RAII usage in
DRM code.

> 
> > 
> >> For example, I don't know why there's already a second use in a separate
> >> thread when we are still discussing it on this one.
> >>
> >> A very positive thing is that this is not xe's own invention and comes
> > 
> > I agree, it is core fairly new core thing which seems to widely
> > endorsed which is a positive.
> > 
> >> from core kernel, maybe from the hottest path that is the scheduling and
> >> locking. So I very much disagree with arguments raised here about
> >> a) this is an alien thing and b) performance will be severely impacted
> >>
> >> I've used __attribute__((cleanup)) in several userspace projects in the
> >> past and it does help avoiding problems on the error path that is
> >> usually not very well tested (and xe's track record on error path is not
> > 
> > For sure our error paths are not great but it isn't like this solves our
> > of those problems magically.
> > 
> >> very good either: those were the main issues being submitted in drm-xe-fixes
> >> for the last release). So if we have a way to improve (and that I've already seen
> >> being used successfully), I prefer failing on trying than on repeating
> >> the same mistakes.  In kmod my only regret is that I didn't start it
> >> earlier, during the bootstrap of the project.
> > 
> > This merged a little over a year, so quite new. Xe is still fairly small
> > and I don't think it would be to painful to switch over to these
> > semantics. If we want do this, I'd say we do this asap. 
> 
> thanks for reconsidering your initial strong position
> 

After reading up on this a bit more, I'm coming around to it. However, I
can't say I'm completely sold on it. Additionally, since I'm not a
maintainer of Xe, ultimately it's not up to me either.

Matt

> > 
> > Matt
> > 
> >>
> >>
> >> Lucas De Marchi
> >>
> >>
> >>>
> >>> Matt
> >>>
> >>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
> >>>
> >>>> 			}
> >>>> 		}
> >>>> 	}
> >>>>
> >>>>>
> >>>>> Well, on the positive side, it is not adding a driver only thing like
> >>>>> i915's with_runtime_pm() macro.
> >>>>>
> >>>>> But I'm also not sure if I like the overall idea anyway:
> >>>>>
> >>>>> - I don't like adding C++isms in a pure C code. Specially something not
> >>>>> so standard and common that will decrease the ramp-up time for newcomers.
> >>>>
> >>>> does it mean that the use of other guard patterns seen elsewhere in the
> >>>> tree is now prohibited on the Xe driver ? like:
> >>>>
> >>>> 	scoped_guard(mutex, &lock)
> >>>> 		foo();
> >>>>
> >>>> 	scoped_guard(spinlock, &lock)
> >>>> 		foo();
> >>>> 	...
> >>>>
> >>>>> - It looks like and extra overhead on the object creation destruction.
> >>>>
> >>>> from cleanup.h doc is sounds there is none:
> >>>>
> >>>>  "And through the magic of value-propagation and dead-code-elimination,
> >>>> it eliminates the actual cleanup call and compiles into:"
> >>>>
> >>>>
> >>>>> - It looks not flexible for handling different cases... like forcewake for
> >>>>> instance where we might want to ignore the ack timeout in some cases.
> >>>>
> >>>> there is scoped_cond_guard() that likely will be able to deal with it,
> >>>> but I guess we first need to cleanup existing force_wake api as expected
> >>>> flow is not clear and there are different approaches in the driver how
> >>>> to deal with errors
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Matt
> >>>>>>
> >>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>>>>
> >>>>>>> Michal Wajdeczko (3):
> >>>>>>>   drm/xe: Introduce force-wake guard class
> >>>>>>>   drm/xe: Use new FW guard in xe_mocs.c
> >>>>>>>   drm/xe: Use new FW guard in xe_pat.c
> >>>>>>>
> >>>>>>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> >>>>>>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> >>>>>>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> >>>>>>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> >>>>>>>  4 files changed, 82 insertions(+), 50 deletions(-)
> >>>>>>>
> >>>>>>> --
> >>>>>>> 2.43.0
> >>>>>>>
