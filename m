Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C9606A329
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lTW51+gv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bsxYIzdj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BF01125F3;
	Thu, 26 Nov 2026 16:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5310EA04;
 Thu, 26 Nov 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795711917; x=1827247917;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nqDKnOetZHlhv62UGmkcLtWID61wRlh5CB/c8LUwRWc=;
 b=lTW51+gvE9bjStxS9ALklpvmf/+VO/5HLNzwQ9W0ZAdv4OWkj0B47dmv
 /ICqu2RrUUto5FV9bvDLxAjQ6+8cXeCDdMPgsj/aJl16wPAbGrMaq1NPu
 tvnljGgoP3rFnaeuBlV72ds//GwI1VT+Epp9cdyuRHMzIhQw815hHCTah
 QphAkAFKbvEu1Y7Yji6BJMCjojtH4lRYeaShw/YrsntPsobhiLFKzb0hr
 SRKYCb6oIDpQ7m8XUzEiB4F9N2T+g9Kr9TEOetP4C9H7zbJmaQxUON5sE
 3PMVwW+t9OGQC008DhiINEBfice1iAicWh11bw37q4YhWH7tjABLyeIak g==;
X-CSE-ConnectionGUID: Elhv2yqUQ5yjS/CIVLzTHQ==
X-CSE-MsgGUID: zvIRowFgRDy6rblRRuNj2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4715639"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4715639"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:51:56 -0800
X-CSE-ConnectionGUID: QOQ8rOjVT8iNFU190HxlXg==
X-CSE-MsgGUID: VdbhTgz5SJOQj35dUHnkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12817416"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:51:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 08:51:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 08:51:55 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 08:51:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXhVPlI/Df16UXvg22uvZmawXB+gYQaGpZjTGqFMKfuZOy+OKDJ/z4/NpwoIeAebAnB7/Sz+HaGl/DVvjsfnbWjjwHWQhvegsnQbFfaSmU4quUkxjI2oB5aH9NIIvlAUvKrcCb/WZP9HCBIE6ZGZ+fpQD4hvt3i5B0HmVurkjdIKBe44i/zpILkZKBcNy0ZCW5SoACQ1aH91nWV2/JOm1OvMLkpkCcWeINwt8BXvlpdyPeGjp+4V9+0ksDZOGsog86LRiJUhe3Ylb3OtM4e3HMDB7cLqfz7QGSrvUG31p4VMjPT65WseozPMY4oyra08BFCvM7G6/U8U4e0VdUFqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2XYTBSxELiD8Lb58KTXLs8K0+V7J5WBLbco8OowKYI=;
 b=wLdtWyRl/Z6vVOv2E7HQXca87xLj+UCAPdInoI/+/JYCLWVAPabsC6OB8PWCeJpHYhSVfJOhog0jMWWbN8R9Ht6X2NUKqhpKz8KFnqXY7SXy5+tNJIEXtihoUDGI9Zbu/IXDRZSvKncUVF4etr9dn842dQSH3+zQNAY2dvHIdGNwRfpm37ypsrIqxn3vOEdOLMC69a5rfoZlVTp40RSiX9jbixy00VnWfwHdkm6lV+etalC7r0CLj6xHoFiBOG+4oiu+DabYqA4WXF8j1YbCjvFXVAL9108phAOgaUtmkdtxhDPs93MZeUYRbSxcG19LInk4iMymIrC6Wnju/dDThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2XYTBSxELiD8Lb58KTXLs8K0+V7J5WBLbco8OowKYI=;
 b=bsxYIzdjJpVtJgQfNlbCSrxxWCREforuxYP8FzrfvROPIEJmh+AzvCvedNJszoKz/J8gNYTw6JW++CmHYNsVhTajb1licJ9OGnlRJKNpkfMDjmOYrm5j7iNb8mFr4r4pHR61T4aR/3Z2w3DM4RrwUq3zTYoCZGs/h2wwCVQIcFE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:51:52 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 16:51:51 +0000
Date: Thu, 26 Nov 2026 18:51:37 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] drm/i915/ddi_mgr: Add support for dynamic DDI
 allocation
Message-ID: <awhjmf8uIAZcCgrF@ideak-desk.lan>
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-7-imre.deak@intel.com>
 <b5aae9bb49d36cab599df615ce0546a572ae37a8@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5aae9bb49d36cab599df615ce0546a572ae37a8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV2PEPF000480EE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::428) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d68a2e-f001-4a58-2e31-08df4bdd91c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|4143699003|6133799003|261009221227099003|261009223027099003|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|261021123027099003|261102123227099003|261021133027099003|261026140227099003|261026135527099003|261021121427099003|261026130827099003|261028144727099003|261022105027099003|261021135927099003|261022075727099003|261021130227099003|261022113327099003|261022115727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 0RHkKpvl/h+Aiem8x6znBGFuTEl23wYkRYkD7wmXDHdVOlknLFdrQUaIgT1BskHABW0Np7Sa6rKGyHfA4gDfIT10pvd5m9c7NAS4VmuWrBW9Q1Vmm4tjiX8EYP3nS3462XUgTvOS65e51bAK0pmGnXzzPPst5QgHFoGjf3tWQEBJQcBkf5Vdf8T0OygG5cAEJt9vj+7JRM/yHZ1ZtzNBh3kuxcRMgIAr5H30y1QeJcpY6CyecXU+/JrS0VZJJxV8ZIAjENGSUWVC3+0WHC8pOfwFRetQwbGxFH0fr4xEpuE1XJ/VY9SRJYB6vM4Q+7lPtPUDNw4qbCM3vRsAG6+AahvDFgwnKq0nVM5MBnfVNnGosNuhXcn80ZPnS1R3F890ff0aoVEgOsOWhdN07t1UGdSsOjBKrqDM4sz6dIArK8wn7xJ8+WzSOzn30dl3x7tCI7yiRx/59NiLL7TQotaA3DcF+UFkFFjoOuVXsAChPqkKQuDZ+4bIDN+CZsb3PMSXAWFe3mG8P88YuKuSsSlBKw4+7WcVwVNZ4bj3MZUYpkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(6133799003)(261009221227099003)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(261021123027099003)(261102123227099003)(261021133027099003)(261026140227099003)(261026135527099003)(261021121427099003)(261026130827099003)(261028144727099003)(261022105027099003)(261021135927099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022115727099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JPw/GIGvAWeIsEGKx3wDbZVdhQhPczO+X5Pie0eb5eYgbTCJBW3Aj4bF7J?=
 =?iso-8859-1?Q?GXaH2netfQIsBgP4umw81ZOwZmSQOX8ELAUyCr9nan0blfVcC6fVinZdVa?=
 =?iso-8859-1?Q?Bde7xiB6LQ6FWFNg2lVslFaULTkDohRU7PpcsJRMfPtyWHqNAxUg6+kgpW?=
 =?iso-8859-1?Q?Oed20xr9WaHJ57kyfV5nb44r/2k0nF5pjp9rAaK7NM6+lq9Jqd4Frude1a?=
 =?iso-8859-1?Q?ZiqpMpCpPdO/I7VyBfg9prs/VHQBz073xtsOuBZFMQQbpVX7WLy6T0Brw2?=
 =?iso-8859-1?Q?eHZA6AXwK8NnA/femWcND/iAr5wgo4N/B07hF7KEo8RExBinyi7ZowbLAR?=
 =?iso-8859-1?Q?UC+6Pt8iDxWnuVvLdgwtyHTyIPH7uQX1/jV7N2B1/TQInEiM/B7qY6TFSq?=
 =?iso-8859-1?Q?pR4YpuA0aZbMzmDKshoCGwGFICtkvquMaif3LfKpk6T6M8V9GAZE07dujz?=
 =?iso-8859-1?Q?lXiyCDAWcYYmUk9cPZA8GYQ5OcQxaYoSW9lUzsIGFhi0oiPYp74LrkKq84?=
 =?iso-8859-1?Q?iX1XKH9s0B1DnyMop2QM8ELpw7zoKFVDIiUFjG7lpHqomMl2SKZ255Ed0T?=
 =?iso-8859-1?Q?vXkSeXgdfLztKNjFZeKQPkJ5AwV/wtB3EZMaryWkxnEIXBLwMFoMnW80Nn?=
 =?iso-8859-1?Q?BUPLMNlEA/oeR4HhIzoopJcukNUDd2ocKBZfBcHZ59r4T/BAnFNdq/A+nc?=
 =?iso-8859-1?Q?F4hzNJjTFiUD3qh8zZEKFHUQV/koxXpaT6IoIjxampMPh2JKz6Xli7F0Ny?=
 =?iso-8859-1?Q?gTSGzhc2y1rCF5bG1FXSI0wBamTzQnfSlSOVHVZAU6z1/ATuO7elj9He3l?=
 =?iso-8859-1?Q?mUHgcEJT6zK181h73lmPix3LJtXdrtEPAeh8TR8VjQrO4X9XY+G16EiEfM?=
 =?iso-8859-1?Q?+FVtux0KmXCP0bcEWAGUkCBBI7Fw4zxqWkQvl1kLjdp7Xr2kaFOGW9D6IQ?=
 =?iso-8859-1?Q?2OA8rYhBcC7DTWashGIua13/7OvUxVbOCkFTaDXuiqlxVnaXCaxoTh5RgY?=
 =?iso-8859-1?Q?ipPdEt7J3lQqCMxS1EnVHCpE3kmbftx+NKOac9k/PWnsDZRFKJCK8L18++?=
 =?iso-8859-1?Q?bgdi4cxQxNwqbP7M3cg4QcKCnZApL87lXtLcHk+iu2CKi3ECoFLb3sn97O?=
 =?iso-8859-1?Q?HKgPAVfiWmIjklcqk42NN2beOepLDyWFlY8xAN8eCLHZBUOOain4uIlIji?=
 =?iso-8859-1?Q?6KkwBdFntx2H2NbI/5GIuAWw4gSTmm55dT1ot/5mVgMVgVbNViYnlFJSrG?=
 =?iso-8859-1?Q?LWzX+WRC535ddi8Kl9WQrDnakssCzQJ+BqyVeN8wxHvtsjiCp8y22jAW6Z?=
 =?iso-8859-1?Q?7NMbvFBFhxoae7pLh2+DBtzgjAcO9evZNhZhdP560aYcMiZor74PsI8hEE?=
 =?iso-8859-1?Q?ZpqxTia2GMI/gbGu6AU4Dotn0w/ILw1uPhKf57uV7EzXjlHfaF1QKM1wgl?=
 =?iso-8859-1?Q?cNpuFjEs4k1M3YYKQz+s4kphQ0lU/bknKEfWROGoaJLxfuZv8lWDYvvU9N?=
 =?iso-8859-1?Q?2U9SzkCfrazZqC3q8Kpopjki7EHW3AZPoNS43sMbCXY49qO5uQtry51tmJ?=
 =?iso-8859-1?Q?5LP4zT3Jhcxp7GXEOmcV2aSO1h95JjkcDrT1Cj2PNUM/0SMqji0hJBtzzL?=
 =?iso-8859-1?Q?whanY90uK9C5IHb9EZlAdraM2e3rM+g8Gbx8i5JyB0cOrLLbeU3u8XIlH1?=
 =?iso-8859-1?Q?XP2N3prIjpagXpDTEirV8GBZjXc25hyr2Ws6hqAHK8opr+Y3ujigdy2LJp?=
 =?iso-8859-1?Q?qrtvMgQH31N4KMkJG2X+sjU+Q3rGVuG4+UL0wro7GAmBgXj5MLeVcK1ngG?=
 =?iso-8859-1?Q?ji67uLaqjg=3D=3D?=
X-Exchange-RoutingPolicyChecked: nNibcc4rEdCwh+ColkYxqayCE1vAuBBakzhi3c4opXkIEJ+8f6xQOXXoNICj1sXbGskMFLfuApPhwa2ZOyCmn2NqUkUjYY1RbLeTO9/ml3zSO6uIGwMmYrs9iPSF9s1FpNAWNh6NXltxOVn/6yGMUpMzyjgfxBolI4du+RNGFsOkvElFTSrwYtAybZO2JjyZqdD+HQu/6or8qtHdXFqcyyiCypT4xRddooeqQI3kXl25IBV71IEW0Ba8fwq8i7ots8DEJYDrkN/QL3b0/tmIYNwgFucl78k24bt/7IslBs08wkS0JI9I5cQB+zvX4WBXv1ll1JVm07oxnDYBxUDtCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d68a2e-f001-4a58-2e31-08df4bdd91c5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:51:51.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lK88MkCWE1+NI9SOPi1/Y7Wmwqn8gnRj0knhc34tIR3jcMeKZt/eccLwi6UwU8IELGv3+mfq8LPD+MJcMYoi5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 03:23:32PM +0200, Jani Nikula wrote:
> On Thu, 26 Nov 2026, Imre Deak <imre.deak@intel.com> wrote:
> > Type-C ports described in VBT need a DDI assignment to drive a legacy or
> > DP-alt PHY, or a TBT DP-in adapter. eDP panels on Type-C PHYs and
> > dedicated external ports have preallocated, fixed DDIs; the latter are
> > not controlled by the Type-C subsystem.
> >
> > The driver allocates DDIs for dynamic legacy ports; IOM and TBT firmware
> > handle DP-alt and TBT-alt allocations, respectively. IOM_DP_RESOURCE_MNG
> > exposes the shared pool for VBT ports with dynamic-DDI support and
> > eligible alt-mode ports. A free DDI can be assigned to a PHY or DP-in
> > adapter on demand.
> >
> > Firmware allocates and releases DDIs as alt-mode sinks connect and
> > disconnect, regardless of whether userspace enables them. Connected but
> > unused alt-mode sinks can therefore occupy DDIs needed by a legacy sink
> > the user wants to enable. Driver control over all allocations would let
> > assignments follow the requested display configuration. Alas, the
> > hardware design on current generations does not allow this and instead
> > imposes a complex allocation scheme involving both the OS and firmware.
> >
> > Add a manager to read VBT and IOM state before GMBUS and output setup,
> > inherit existing legacy DDI assignments from BIOS and allocate free
> > supported DDIs, preferring DDI-to-PHY identity mappings. Each DRM
> > encoder keeps a fixed DDI in encoder->port. The DDI assigned to a legacy
> > PHY determines which encoder handles it, whether inherited from BIOS/GOP
> > for an active or inactive port or newly allocated by the driver.
> >
> > For now, this enables only static legacy DDI allocation. Legacy DDIs are
> > inherited from BIOS or allocated only during driver loading and system
> > resume, and these assignments remain unchanged during runtime. Runtime
> > reallocation support will be added in a follow-up series.
> >
> > AUX and DDI/PHY/PLL register accesses use the allocated DDI instance.
> > Legacy HPD and GMBUS DDC pins identify the PHY, while DP-alt/TBT-alt HPD
> > sources identify the DDI. An encoder selected for a legacy PHY must use
> > that PHY's HPD source, DDC pin and VBT capabilities, including link
> > limits, and switch to legacy Type-C mode. Its logical HPD pin stays
> > fixed; the HPD mapping selects the HW source. Other pool encoders remain
> > non-legacy, including those whose DDI is unallocated. PHY-specific VBT
> > data follows the selected PHY through encoder->devdata; AUX channel
> > selection stays tied to the fixed DDI.
> >
> > DDC adapters for pool encoders must be separate from the ordinary
> > per-pin adapters:
> > a pool encoder's original VBT entry may specify no DDC pin, and its
> > default pin may already be used by a non-pool port. Each pool encoder
> > keeps the same DDC adapter while only the physical pin driven by that
> > adapter changes, so its HDMI connector's userspace DDC symlink remains
> > unchanged. Ordinary adapters retain their fixed physical pins.
> >
> > If allocation fails after successfully reading and verifying the pool,
> > keep its encoders available for alt-mode sinks and disable legacy
> > operation. Earlier initialization failures retain the original port
> > configuration.
> >
> > Follow-up patches will add the connector and DDC adapter support,
> > suspend/resume handling and activation of the pool.
> >
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/Makefile                 |   1 +
> >  drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 808 ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |  18 +
> >  .../gpu/drm/i915/display/intel_ddi_mgr_regs.h |  40 +
> >  .../gpu/drm/i915/display/intel_display_core.h |   3 +
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  6 files changed, 871 insertions(+)
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index ba7eecfffdca1..3357d84ca56aa 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -349,6 +349,7 @@ i915-y += \
> >  	display/intel_cx0_phy.o \
> >  	display/intel_ddi.o \
> >  	display/intel_ddi_buf_trans.o \
> > +	display/intel_ddi_mgr.o \
> >  	display/intel_dip.o \
> >  	display/intel_display_device.o \
> >  	display/intel_display_trace.o \
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> > new file mode 100644
> > index 0000000000000..7dc547a617990
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> > @@ -0,0 +1,808 @@
> > +// SPDX-License-Identifier: MIT
> > +/* Copyright © 2026 Intel Corporation */
> 
> Copy-pasting what I wrote to Suraj:
> 
> I would pretty much like to mandate that *every* file in display/ *must*
> have a DOC: comment explaining what this stuff is about, what the
> acronyms are, etc. Obviously not all the existing files have it, but all
> new ones should.
> 
> You've basically written most of this already in the cover letter and
> the commit messages. Add a bit of pixie dust on top and you're done.

Ok, makes sense, will add it.

> > +
> > +#include <linux/iopoll.h>
> > +#include <linux/seq_buf.h>
> > +#include <linux/string.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "intel_bios.h"
> > +#include "intel_ddi_mgr.h"
> > +#include "intel_ddi_mgr_regs.h"
> > +#include "intel_de.h"
> > +#include "intel_display.h"
> > +#include "intel_display_core.h"
> > +#include "intel_display_regs.h"
> > +#include "intel_display_rpm.h"
> > +#include "intel_display_types.h"
> > +#include "intel_display_utils.h"
> > +#include "intel_dp.h"
> > +#include "intel_gmbus.h"
> > +#include "intel_hotplug_irq.h"
> > +#include "intel_tc.h"
> > +
> > +#define INTEL_DDI_MGR_NUM_PORTS 4
> > +
> > +enum intel_ddi_route_mode {
> > +	/* DP-alt/TBT-alt, with allocations managed by firmware. */
> > +	INTEL_DDI_ROUTE_ALT,
> > +	/* Legacy DP/HDMI, with allocations managed by the driver. */
> > +	INTEL_DDI_ROUTE_LEGACY,
> > +};
> > +
> > +struct intel_ddi_route {
> > +	/*
> > +	 * Physical legacy PHY, or TC_PORT_NONE in ALT mode.
> > +	 * TODO: Use a PHY enum instead of enum tc_port.
> > +	 */
> > +	enum tc_port phy;
> > +	enum intel_ddi_route_mode mode;
> > +};
> > +
> > +struct intel_ddi_mgr {
> > +	/* Only route entries with a bit set in pool_ddi_mask are used. */
> > +	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
> > +	u8 ddc_pin[INTEL_DDI_MGR_NUM_PORTS];
> > +	u8 pool_ddi_mask;
> > +	u8 legacy_phy_mask;
> > +	u16 ddc_pins;
> > +	bool has_hdmi;
> > +	bool enabled;
> > +};
> > +
> > +struct intel_ddi_hw_state {
> > +	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
> > +	u32 inherited_resources;
> > +	u32 current_resources;
> > +	u8 pool_ddi_mask;
> > +	u8 busy_ddi_mask;
> > +	u8 assigned_phy_mask;
> > +	u8 allocated_ddi_mask;
> > +};
> > +
> > +static enum port ddi_to_port(int ddi)
> > +{
> > +	return PORT_TC1 + ddi;
> > +}
> > +
> > +static enum tc_port ddi_to_tc(int ddi)
> > +{
> > +	return TC_PORT_1 + ddi;
> > +}
> > +
> > +static enum hpd_pin tc_to_hpd_pin(enum tc_port tc_port)
> > +{
> > +	return HPD_PORT_TC1 + tc_port - TC_PORT_1;
> > +}
> > +
> > +/* TODO: Fix the regular HDMI default selection on NVL+ and reuse it here. */
> > +static u8 default_ddc_pin(struct intel_display *display, enum port port)
> > +{
> > +	if (port >= PORT_TC1 && port <= PORT_TC4)
> > +		return intel_gmbus_tc_port_to_pin(intel_port_to_tc(display, port));
> > +
> > +	return intel_port_to_phy(display, port) + 1;
> > +}
> > +
> > +static bool intel_ddi_mgr_is_enabled(const struct intel_ddi_mgr *mgr)
> > +{
> > +	return mgr && mgr->enabled;
> > +}
> > +
> > +bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi)
> > +{
> > +	return display->ddi_mgr && ddi >= PORT_TC1 && ddi <= PORT_TC4 &&
> > +		display->ddi_mgr->pool_ddi_mask & BIT(ddi - PORT_TC1);
> > +}
> > +
> > +bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +
> > +	return mgr && mgr->pool_ddi_mask && mgr->has_hdmi;
> > +}
> > +
> > +static const char *iom_lock_owner(u32 semaphore)
> > +{
> > +	switch (semaphore & IOM_REQUESTOR_ID_MASK) {
> > +	case IOM_REQUESTOR_ID_IOM:
> > +		return "IOM";
> > +	case IOM_REQUESTOR_ID_TBT0:
> > +		return "TBT0";
> > +	case IOM_REQUESTOR_ID_TBT1:
> > +		return "TBT1";
> > +	case IOM_REQUESTOR_ID_DISPLAY_ENGINE:
> > +		return "Display Engine";
> > +	default:
> > +		return "unknown";
> > +	}
> > +}
> > +
> > +static bool iom_trylock(struct intel_display *display, u32 *semaphore)
> > +{
> > +	u32 request = IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_DISPLAY_ENGINE;
> > +	u32 mask = IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_MASK;
> > +
> > +	intel_de_rmw(display, IOM_DP_HW_RESOURCE_SEMAPHORE, mask, request);
> > +	*semaphore = intel_de_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> > +
> > +	return (*semaphore & mask) == request;
> > +}
> > +
> > +static int iom_lock(struct intel_display *display)
> > +{
> > +	u32 semaphore;
> > +	bool acquired;
> > +	int err;
> > +
> > +	assert_display_rpm_held(display);
> > +
> > +	intel_de_rmw(display, IOM_HIP_INDEX, IOM_HIP_INDEX_MASK,
> > +		     IOM_HIP_INDEX_RESOURCE_MGMT);
> > +
> > +	err = poll_timeout_us(acquired = iom_trylock(display, &semaphore),
> > +			      acquired, 10, 100000, false);
> > +	if (!err)
> > +		return 0;
> > +
> > +	drm_warn(display->drm,
> > +		 "DDIMGR: IOM DDI lock timeout: owner %s, register %#x\n",
> > +		 iom_lock_owner(semaphore), semaphore);
> > +
> > +	return err;
> > +}
> > +
> > +static void iom_unlock(struct intel_display *display)
> > +{
> > +	intel_de_rmw(display, IOM_DP_HW_RESOURCE_SEMAPHORE,
> > +		     IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_MASK, IOM_REQUESTOR_ID_DISPLAY_ENGINE);
> > +	intel_de_posting_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> > +}
> > +
> > +static int resource_to_available_ddi_count(struct intel_display *display, u32 semaphore)
> > +{
> > +	u32 gray = REG_FIELD_GET(IOM_DDI_AVAILABLE_MASK, semaphore);
> > +
> > +	switch (gray) {
> > +	case 0x0:
> > +		return 0;
> > +	case 0x1:
> > +		return 1;
> > +	case 0x2:
> > +		return 3;
> > +	case 0x3:
> > +		return 2;
> > +	case 0x6:
> > +		return IOM_DDI_REPORTED_MAX_FREE; /* At least four resources are available. */
> > +	default:
> > +		drm_WARN(display->drm, 1, "DDIMGR: Invalid DDI availability %#x (semaphore %#x)\n",
> > +			 gray, semaphore);
> > +
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static u8 resource_to_pool_ddi_mask(u32 resources)
> > +{
> > +	u8 pool_ddi_mask = 0;
> > +	int ddi;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++)
> > +		if (IOM_DDI_CONSUMER_GET(resources, ddi) != IOM_DDI_CONSUMER_RESERVED)
> > +			pool_ddi_mask |= BIT(ddi);
> > +
> > +	return pool_ddi_mask;
> > +}
> > +
> > +static void verify_ddi_counts(struct intel_display *display, u32 resources)
> > +{
> > +	u32 semaphore;
> > +	int available_ddis, free_ddis = 0;
> > +	int ddi;
> > +
> > +	semaphore = intel_de_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> > +	available_ddis = resource_to_available_ddi_count(display, semaphore);
> > +
> > +	/* The hardware count covers all eight slots, not just our four TC DDIs. */
> > +	for (ddi = 0; ddi < IOM_DDI_NUM_SLOTS; ddi++)
> > +		if (IOM_DDI_CONSUMER_GET(resources, ddi) == IOM_DDI_CONSUMER_FREE)
> > +			free_ddis++;
> > +
> > +	drm_WARN(display->drm, free_ddis > INTEL_DDI_MGR_NUM_PORTS,
> > +		 "DDIMGR: Free DDI count %d exceeds supported count %d\n",
> > +		 free_ddis, INTEL_DDI_MGR_NUM_PORTS);
> > +
> > +	if (available_ddis < 0 || available_ddis == min(free_ddis, IOM_DDI_REPORTED_MAX_FREE))
> > +		return;
> > +
> > +	drm_dbg_kms(display->drm,
> > +		    "DDIMGR: DDI count mismatch: available %d%s, free %d (semaphore %#x, table 0x%08x)\n",
> > +		    available_ddis, available_ddis == IOM_DDI_REPORTED_MAX_FREE ? "+" : "",
> > +		    free_ddis, semaphore, resources);
> > +}
> > +
> > +/* TC PHY consumer (legacy or DP-alt), rather than a TBT DP adapter. */
> > +static bool consumer_is_dpalt_legacy(u32 consumer)
> > +{
> > +	return consumer & IOM_DDI_CONSUMER_DPALT_LEGACY &&
> > +		REG_FIELD_GET(IOM_DDI_CONSUMER_PHY_MASK, consumer) < INTEL_DDI_MGR_NUM_PORTS;
> > +}
> > +
> > +/* Caller must first check consumer_is_dpalt_legacy(). */
> > +static enum tc_port consumer_to_phy(u32 consumer)
> > +{
> > +	return TC_PORT_1 + REG_FIELD_GET(IOM_DDI_CONSUMER_PHY_MASK, consumer);
> > +}
> > +
> > +static void format_ddi_consumer(struct seq_buf *s, const struct intel_ddi_mgr *mgr,
> > +				u32 consumer, const char *origin)
> > +{
> > +	if (consumer == IOM_DDI_CONSUMER_FREE) {
> > +		seq_buf_puts(s, "free");
> > +
> > +		return;
> > +	}
> > +
> > +	if (consumer == IOM_DDI_CONSUMER_RESERVED) {
> > +		seq_buf_puts(s, "reserved");
> > +
> > +		return;
> > +	}
> > +
> > +	if (consumer_is_dpalt_legacy(consumer)) {
> > +		enum tc_port phy = consumer_to_phy(consumer);
> > +		bool legacy = mgr->legacy_phy_mask & BIT(phy);
> > +
> > +		if (!legacy)
> > +			origin = NULL;
> > +
> > +		seq_buf_printf(s, "PHY TC#%d (%s%s%s)", phy - TC_PORT_1 + 1,
> > +			       legacy ? "legacy" : "dp-alt", origin ? ", " : "", origin ?: "");
> > +
> > +		return;
> > +	}
> > +
> > +	if (!(consumer & IOM_DDI_CONSUMER_DPALT_LEGACY) &&
> > +	    REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DPIN_MASK, consumer)) {
> > +		seq_buf_printf(s, "TBT%u DPIN%u",
> > +			       REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DOMAIN_MASK, consumer),
> > +			       REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DPIN_MASK, consumer) - 1);
> > +
> > +		return;
> > +	}
> > +
> > +	seq_buf_printf(s, "unknown(0x%x)", consumer);
> > +}
> > +
> > +static void print_ddi_allocations(struct drm_printer *p, const struct intel_ddi_mgr *mgr,
> > +				  const struct intel_ddi_hw_state *hw_state, int err)
> > +{
> > +	bool printed = false;
> > +	int ddi;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		u32 consumer = IOM_DDI_CONSUMER_GET(hw_state->current_resources, ddi);
> > +		DECLARE_SEQ_BUF(name, 64);
> > +		const char *origin = NULL;
> > +
> > +		if (consumer == IOM_DDI_CONSUMER_FREE || consumer == IOM_DDI_CONSUMER_RESERVED)
> > +			continue;
> > +
> > +		if (consumer == IOM_DDI_CONSUMER_GET(hw_state->inherited_resources, ddi))
> > +			origin = "inherited";
> > +		else if (!err && hw_state->allocated_ddi_mask & BIT(ddi))
> > +			origin = "allocated";
> > +
> > +		format_ddi_consumer(&name, mgr, consumer, origin);
> > +		drm_printf_indent(p, 1, "DDI TC#%d: %s\n", ddi + 1, seq_buf_str(&name));
> > +		printed = true;
> > +	}
> > +
> > +	if (!printed)
> > +		drm_printf_indent(p, 1, "none\n");
> > +}
> > +
> > +static void print_ddi_resources(struct intel_display *display,
> > +				const struct intel_ddi_hw_state *hw_state, int err)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	struct drm_printer p = drm_dbg_printer(display->drm, DRM_UT_KMS, "DDIMGR:");
> > +	unsigned long pool_ddi_mask = resource_to_pool_ddi_mask(hw_state->current_resources) << 1;
> > +	unsigned long unassigned_phy_mask =
> > +		(mgr->legacy_phy_mask & ~hw_state->assigned_phy_mask) << 1;
> > +
> > +	drm_printf(&p, "Resources=0x%08x, Pool DDIs=DDI TC#{%*pbl}\n",
> > +		   hw_state->current_resources, INTEL_DDI_MGR_NUM_PORTS + 1, &pool_ddi_mask);
> > +	if (err)
> > +		drm_printf(&p, "Configuration failed: %d\n", err);
> > +
> > +	/* ALT allocations are only a snapshot of firmware assignments. */
> > +	drm_printf(&p, "Assigned DDIs:\n");
> > +	print_ddi_allocations(&p, mgr, hw_state, err);
> > +
> > +	if (!err && unassigned_phy_mask)
> > +		drm_printf(&p, "Unassigned legacy PHYs=PHY TC#{%*pbl}\n",
> > +			   INTEL_DDI_MGR_NUM_PORTS + 1, &unassigned_phy_mask);
> > +}
> > +
> > +static int verify_ddi_pool(struct intel_display *display, u8 pool_ddi_mask)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	int ddi;
> > +
> > +	if (mgr->pool_ddi_mask && pool_ddi_mask != mgr->pool_ddi_mask) {
> > +		drm_dbg_kms(display->drm, "DDIMGR: DDI pool changed: expected %#x, read %#x\n",
> > +			    mgr->pool_ddi_mask, pool_ddi_mask);
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (mgr->legacy_phy_mask & ~pool_ddi_mask) {
> > +		drm_err(display->drm,
> > +			"DDIMGR: Legacy PHYs missing from DDI pool: legacy=0x%02x pool=0x%02x\n",
> > +			mgr->legacy_phy_mask, pool_ddi_mask);
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		const struct intel_bios_encoder_data *vbt;
> > +		bool alt_mode;
> > +
> > +		if (!(pool_ddi_mask & BIT(ddi)))
> > +			continue;
> > +
> > +		vbt = intel_bios_encoder_data_lookup(display, ddi_to_port(ddi));
> > +		if (!vbt) {
> > +			drm_err(display->drm, "DDIMGR: Missing VBT data for pool DDI%d\n", ddi);
> > +
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (intel_bios_encoder_is_dedicated_external(vbt) ||
> > +		    intel_bios_encoder_supports_edp(vbt) ||
> > +		    intel_bios_encoder_supports_dsi(vbt) || intel_bios_encoder_is_lspcon(vbt)) {
> > +			drm_err(display->drm,
> > +				"DDIMGR: Unsupported pool DDI%d: dedicated=%d eDP=%d DSI=%d LSPCON=%d\n",
> > +				ddi, intel_bios_encoder_is_dedicated_external(vbt),
> > +				intel_bios_encoder_supports_edp(vbt),
> > +				intel_bios_encoder_supports_dsi(vbt),
> > +				intel_bios_encoder_is_lspcon(vbt));
> > +
> > +			return -EINVAL;
> > +		}
> > +
> > +		alt_mode = intel_bios_encoder_supports_typec_usb(vbt) ||
> > +			intel_bios_encoder_supports_tbt(vbt);
> > +		if (alt_mode == !!(mgr->legacy_phy_mask & BIT(ddi))) {
> > +			drm_err(display->drm,
> > +				"DDIMGR: Invalid VBT modes for pool DDI%d: alt=%d dyn-legacy=%d\n",
> > +				ddi, alt_mode, !!(mgr->legacy_phy_mask & BIT(ddi)));
> > +
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int verify_ddc_pins(struct intel_display *display, u8 pool_ddi_mask)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	enum port port;
> > +	int err = 0;
> > +
> > +	for (port = PORT_A; port < I915_MAX_PORTS; port++) {
> > +		const struct intel_bios_encoder_data *vbt;
> > +		int pin;
> > +
> > +		if (port >= PORT_TC1 && port <= PORT_TC4 &&
> > +		    pool_ddi_mask & BIT(port - PORT_TC1))
> > +			continue;
> > +
> > +		vbt = intel_bios_encoder_data_lookup(display, port);
> > +		if (!vbt || (!intel_bios_encoder_supports_hdmi(vbt) &&
> > +			     !intel_bios_encoder_supports_dvi(vbt)))
> > +			continue;
> > +
> > +		pin = intel_bios_hdmi_ddc_pin(vbt);
> > +		/* Match intel_hdmi_default_ddc_pin() for non-pool encoders. */
> > +		if (!pin)
> > +			pin = intel_port_to_phy(display, port) + 1;
> > +
> > +		if (pin >= GMBUS_NUM_PINS)
> > +			continue;
> > +
> > +		if (!(mgr->ddc_pins & BIT(pin)))
> > +			continue;
> > +
> > +		drm_err(display->drm, "DDIMGR: DDI pool DDC pin %d also used by port %c\n",
> > +			pin, port_name(port));
> > +
> > +		err = -EINVAL;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/* Record the DDI's mode and legacy PHY in software. */
> > +static void record_ddi_route(struct intel_ddi_route *route, enum tc_port legacy_phy)
> > +{
> > +	route->phy = legacy_phy;
> > +	route->mode = legacy_phy == TC_PORT_NONE ?
> > +		INTEL_DDI_ROUTE_ALT : INTEL_DDI_ROUTE_LEGACY;
> > +}
> > +
> > +static void fallback_to_alt(struct intel_ddi_mgr *mgr)
> > +{
> > +	int ddi;
> > +
> > +	mgr->enabled = false;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		if (!(mgr->pool_ddi_mask & BIT(ddi)))
> > +			continue;
> > +
> > +		record_ddi_route(&mgr->route[ddi], TC_PORT_NONE);
> > +	}
> > +}
> > +
> > +static int readout_ddi_resource(struct intel_display *display, int ddi,
> > +				struct intel_ddi_hw_state *hw_state)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	u32 consumer = IOM_DDI_CONSUMER_GET(hw_state->current_resources, ddi);
> > +	enum tc_port phy;
> > +
> > +	if (ddi < INTEL_DDI_MGR_NUM_PORTS)
> > +		record_ddi_route(&hw_state->route[ddi], TC_PORT_NONE);
> > +
> > +	if (hw_state->pool_ddi_mask & BIT(ddi) &&
> > +	    intel_de_read(display, DDI_BUF_CTL(ddi_to_port(ddi))) & DDI_BUF_CTL_ENABLE)
> > +		hw_state->busy_ddi_mask |= BIT(ddi);
> > +
> > +	if (!consumer_is_dpalt_legacy(consumer))
> > +		return 0;
> > +
> > +	phy = consumer_to_phy(consumer);
> > +
> > +	/* The IOM also assigns PHY consumers for DP-alt ports. */
> > +	if (!(mgr->legacy_phy_mask & BIT(phy)))
> > +		return 0;
> > +
> > +	/* Reject legacy PHY assignments outside the supported DDI range. */
> > +	if (ddi >= INTEL_DDI_MGR_NUM_PORTS) {
> > +		drm_err(display->drm,
> > +			"DDIMGR: Legacy PHY%d assigned to unsupported DDI%d (resources 0x%08x)\n",
> > +			phy, ddi, hw_state->current_resources);
> > +
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	/* Reject duplicate legacy PHY assignments. */
> > +	if (hw_state->assigned_phy_mask & BIT(phy)) {
> > +		drm_err(display->drm,
> > +			"DDIMGR: Duplicate legacy PHY%d assignment at DDI%d (resources 0x%08x)\n",
> > +			phy, ddi, hw_state->current_resources);
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	record_ddi_route(&hw_state->route[ddi], phy);
> > +	hw_state->assigned_phy_mask |= BIT(phy);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ddi_mgr_readout_hw_state(struct intel_display *display,
> > +				    struct intel_ddi_hw_state *hw_state)
> > +{
> > +	int ddi, err;
> > +
> > +	hw_state->current_resources = intel_de_read(display, IOM_DP_RESOURCE_MNG);
> > +	hw_state->inherited_resources = hw_state->current_resources;
> > +	hw_state->pool_ddi_mask = resource_to_pool_ddi_mask(hw_state->current_resources);
> > +	hw_state->busy_ddi_mask = 0;
> > +	hw_state->assigned_phy_mask = 0;
> > +	hw_state->allocated_ddi_mask = 0;
> > +
> > +	for (ddi = 0; ddi < IOM_DDI_NUM_SLOTS; ddi++) {
> > +		err = readout_ddi_resource(display, ddi, hw_state);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ddi_mgr_verify_hw_state(struct intel_display *display,
> > +				   const struct intel_ddi_hw_state *hw_state)
> > +{
> > +	int err;
> > +
> > +	verify_ddi_counts(display, hw_state->current_resources);
> > +
> > +	err = verify_ddi_pool(display, hw_state->pool_ddi_mask);
> > +	if (err)
> > +		return err;
> > +
> > +	return verify_ddc_pins(display, hw_state->pool_ddi_mask);
> > +}
> > +
> > +static void ddi_mgr_store_hw_state(struct intel_ddi_mgr *mgr,
> > +				   const struct intel_ddi_hw_state *hw_state)
> > +{
> > +	memcpy(mgr->route, hw_state->route, sizeof(mgr->route));
> > +	mgr->pool_ddi_mask = hw_state->pool_ddi_mask;
> > +}
> > +
> > +static int find_free_ddi(u8 ddi_mask, u32 resources)
> > +{
> > +	int ddi;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		if (!(ddi_mask & BIT(ddi)))
> > +			continue;
> > +
> > +		if (IOM_DDI_CONSUMER_GET(resources, ddi) != IOM_DDI_CONSUMER_FREE)
> > +			continue;
> > +
> > +		return ddi;
> > +	}
> > +
> > +	return -ENOSPC;
> > +}
> > +
> > +static int legacy_phy_to_ddi(const struct intel_ddi_route *routes, enum tc_port phy)
> > +{
> > +	int ddi;
> > +
> > +	if (!routes)
> > +		return -ENOENT;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		if (routes[ddi].mode != INTEL_DDI_ROUTE_LEGACY)
> > +			continue;
> > +
> > +		if (routes[ddi].phy == phy)
> > +			return ddi;
> > +	}
> > +
> > +	return -ENOENT;
> > +}
> > +
> > +static void allocate_ddi_for_phy(struct intel_ddi_hw_state *hw_state,
> > +				 u8 ddi_mask, enum tc_port phy)
> > +{
> > +	int ddi;
> > +
> > +	ddi = find_free_ddi(ddi_mask, hw_state->current_resources);
> > +	if (ddi < 0)
> > +		return;
> > +
> > +	hw_state->current_resources |= IOM_DDI_CONSUMER(ddi, IOM_DDI_CONSUMER_PHY(phy));
> > +	hw_state->allocated_ddi_mask |= BIT(ddi);
> > +	hw_state->assigned_phy_mask |= BIT(phy);
> > +	record_ddi_route(&hw_state->route[ddi], phy);
> > +}
> > +
> > +enum ddi_alloc_policy {
> > +	ALLOC_PREVIOUS_DDI,
> > +	ALLOC_IDENTITY_DDI,
> > +	ALLOC_ANY_FREE_DDI,
> > +
> > +	ALLOC_POLICY_NUM,
> > +};
> > +
> > +static u8 ddi_mask_for_policy(const struct intel_ddi_hw_state *hw_state,
> > +			      enum ddi_alloc_policy policy,
> > +			      const struct intel_ddi_route *old_routes, enum tc_port phy)
> > +{
> > +	u8 ddi_mask = hw_state->pool_ddi_mask & ~hw_state->busy_ddi_mask;
> > +	int old_ddi;
> > +
> > +	switch (policy) {
> > +	case ALLOC_PREVIOUS_DDI:
> > +		old_ddi = legacy_phy_to_ddi(old_routes, phy);
> > +		if (old_ddi < 0)
> > +			return 0;
> > +
> > +		ddi_mask &= BIT(old_ddi);
> > +
> > +		break;
> > +	case ALLOC_IDENTITY_DDI:
> > +		ddi_mask &= BIT(phy);
> > +
> > +		break;
> > +	case ALLOC_ANY_FREE_DDI:
> > +		break;
> > +	default:
> > +		MISSING_CASE(policy);
> > +		return 0;
> > +	}
> > +
> > +	return ddi_mask;
> > +}
> > +
> > +static int allocate_legacy_ddis(struct intel_display *display,
> > +				struct intel_ddi_hw_state *hw_state,
> > +				const struct intel_ddi_route *old_routes)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	u32 old_resources = hw_state->current_resources;
> > +	u32 new_resources;
> > +	enum ddi_alloc_policy policy;
> > +	enum tc_port phy;
> > +	u32 readback;
> > +
> > +	/* Prefer previous DDIs, then identity mappings, then any remaining DDI. */
> > +	for (policy = ALLOC_PREVIOUS_DDI; policy < ALLOC_POLICY_NUM; policy++) {
> > +		for (phy = TC_PORT_1; phy < INTEL_DDI_MGR_NUM_PORTS; phy++) {
> > +			u8 ddi_mask;
> > +
> > +			if (!(mgr->legacy_phy_mask & BIT(phy)))
> > +				continue;
> > +
> > +			if (hw_state->assigned_phy_mask & BIT(phy))
> > +				continue;
> > +
> > +			ddi_mask = ddi_mask_for_policy(hw_state, policy, old_routes, phy);
> > +			allocate_ddi_for_phy(hw_state, ddi_mask, phy);
> > +		}
> > +	}
> > +
> > +	new_resources = hw_state->current_resources;
> > +	if (new_resources == old_resources)
> > +		return 0;
> > +
> > +	intel_de_write(display, IOM_DP_RESOURCE_MNG, new_resources);
> > +	readback = intel_de_read(display, IOM_DP_RESOURCE_MNG);
> > +	hw_state->current_resources = readback;
> > +	if (readback != new_resources) {
> > +		drm_err(display->drm, "DDIMGR: DDI write mismatch: requested 0x%08x, read 0x%08x\n",
> > +			new_resources, readback);
> > +
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int configure_ddi_resources(struct intel_display *display,
> > +				   const struct intel_ddi_route *old_routes)
> > +{
> > +	struct intel_ddi_hw_state hw_state;
> > +	int err;
> > +
> > +	err = iom_lock(display);
> > +	if (err)
> > +		return err;
> > +
> > +	err = ddi_mgr_readout_hw_state(display, &hw_state);
> > +	if (err)
> > +		goto out;
> > +
> > +	err = ddi_mgr_verify_hw_state(display, &hw_state);
> > +	if (err)
> > +		goto out;
> > +
> > +	err = allocate_legacy_ddis(display, &hw_state, old_routes);
> > +
> > +	ddi_mgr_store_hw_state(display->ddi_mgr, &hw_state);
> > +
> > +out:
> > +	iom_unlock(display);
> > +
> > +	print_ddi_resources(display, &hw_state, err);
> > +
> > +	return err;
> > +}
> > +
> > +/* Update HPD sources before TC initialization or HPD IRQ enable. */
> > +static void update_hpd_sources(struct intel_display *display)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	int ddi;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		const struct intel_ddi_route *route = &mgr->route[ddi];
> > +		enum hpd_pin logical_pin = tc_to_hpd_pin(ddi_to_tc(ddi));
> > +		enum hpd_pin pch_hw_pin = HPD_NONE;
> > +		enum hpd_pin hw_pin = HPD_NONE;
> > +
> > +		if (!(mgr->pool_ddi_mask & BIT(ddi)))
> > +			continue;
> > +
> > +		if (intel_ddi_mgr_is_enabled(mgr) && route->mode == INTEL_DDI_ROUTE_LEGACY)
> > +			pch_hw_pin = tc_to_hpd_pin(route->phy);
> > +		else
> > +			hw_pin = logical_pin;
> > +
> > +		intel_hpd_set_pin_sources(display, logical_pin, hw_pin, pch_hw_pin);
> > +	}
> > +}
> > +
> > +static int init_ddi_resource(struct intel_display *display, int ddi)
> > +{
> > +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> > +	const struct intel_bios_encoder_data *vbt;
> > +	int pin;
> > +
> > +	record_ddi_route(&mgr->route[ddi], TC_PORT_NONE);
> > +
> > +	vbt = intel_bios_encoder_data_lookup(display, ddi_to_port(ddi));
> > +	if (!vbt || !intel_bios_encoder_supports_dyn_port_over_tc(vbt))
> > +		return 0;
> > +
> > +	mgr->legacy_phy_mask |= BIT(ddi);
> > +
> > +	if (!intel_bios_encoder_supports_hdmi(vbt) &&
> > +	    !intel_bios_encoder_supports_dvi(vbt))
> > +		return 0;
> > +
> > +	mgr->has_hdmi = true;
> > +	pin = intel_bios_hdmi_ddc_pin(vbt);
> > +	if (!pin)
> > +		pin = default_ddc_pin(display, ddi_to_port(ddi));
> > +
> > +	if (!intel_gmbus_is_valid_pin(display, pin) || mgr->ddc_pins & BIT(pin)) {
> > +		drm_err(display->drm, "DDIMGR: Invalid/duplicate legacy DDC pin %d\n", pin);
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	mgr->ddc_pin[ddi] = pin;
> > +	mgr->ddc_pins |= BIT(pin);
> > +
> > +	return 0;
> > +}
> > +
> > +void intel_ddi_mgr_init(struct intel_display *display)
> > +{
> > +	struct intel_ddi_mgr *mgr;
> > +	int ddi, err;
> > +
> > +	if (DISPLAY_VER(display) < 35)
> > +		return;
> > +
> > +	mgr = drmm_kzalloc(display->drm, sizeof(*mgr), GFP_KERNEL);
> > +	if (!mgr)
> > +		return;
> > +
> > +	display->ddi_mgr = mgr;
> > +
> > +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> > +		err = init_ddi_resource(display, ddi);
> > +		if (err)
> > +			goto err;
> > +	}
> > +
> > +	if (!mgr->legacy_phy_mask)
> > +		goto out_free;
> > +
> > +	err = configure_ddi_resources(display, NULL);
> > +	if (err)
> > +		goto err;
> > +
> > +	mgr->enabled = true;
> > +	update_hpd_sources(display);
> > +
> > +	return;
> > +
> > +err:
> > +	if (mgr->pool_ddi_mask) {
> > +		fallback_to_alt(mgr);
> > +		drm_err(display->drm,
> > +			"DDIMGR: Cannot initialize DDI pool: %d; using ALT mode\n", err);
> > +		update_hpd_sources(display);
> > +
> > +		return;
> > +	}
> > +
> > +	drm_err(display->drm,
> > +		"DDIMGR: Cannot initialize DDI pool: %d; using default port configuration\n", err);
> > +out_free:
> > +	drmm_kfree(display->drm, mgr);
> > +	display->ddi_mgr = NULL;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> > new file mode 100644
> > index 0000000000000..b1793b848c238
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/* Copyright © 2026 Intel Corporation */
> > +
> > +#ifndef __INTEL_DDI_MGR_H__
> > +#define __INTEL_DDI_MGR_H__
> > +
> > +#include <linux/types.h>
> > +
> > +enum port;
> > +
> > +struct intel_display;
> > +
> > +void intel_ddi_mgr_init(struct intel_display *display);
> > +
> > +bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
> > +bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h
> > new file mode 100644
> > index 0000000000000..2a65c27a1f099
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef __INTEL_DDI_MGR_REGS_H__
> > +#define __INTEL_DDI_MGR_REGS_H__
> > +
> > +#include "intel_display_reg_defs.h"
> > +
> > +#define IOM_HIP_INDEX				_MMIO(0x1010a0)
> > +#define  IOM_HIP_INDEX_MASK			REG_GENMASK(3, 0)
> > +#define  IOM_HIP_INDEX_RESOURCE_MGMT		REG_FIELD_PREP(IOM_HIP_INDEX_MASK, 1)
> > +
> > +#define IOM_DP_HW_RESOURCE_SEMAPHORE		_MMIO(0x168038)
> > +#define  IOM_DDI_AVAILABLE_MASK			REG_GENMASK(30, 28)
> > +#define  IOM_DP_HW_SEMLOCK			REG_BIT(31)
> > +#define  IOM_REQUESTOR_ID_MASK			REG_GENMASK(3, 0)
> > +#define  IOM_REQUESTOR_ID_IOM			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 0)
> > +#define  IOM_REQUESTOR_ID_TBT0			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 1)
> > +#define  IOM_REQUESTOR_ID_TBT1			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 2)
> > +#define  IOM_REQUESTOR_ID_DISPLAY_ENGINE		REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 4)
> > +
> > +#define IOM_DDI_REPORTED_MAX_FREE		4
> > +
> > +#define IOM_DDI_NUM_SLOTS			8
> > +
> > +#define IOM_DP_RESOURCE_MNG			_MMIO(0x16802c)
> > +#define  IOM_DDI_CONSUMER_MASK(ddi)		(0xfu << ((ddi) * 4))
> > +#define  IOM_DDI_CONSUMER(ddi, consumer)		((u32)(consumer) << ((ddi) * 4))
> > +#define  IOM_DDI_CONSUMER_GET(val, ddi)		(((val) >> ((ddi) * 4)) & 0xf)
> > +#define  IOM_DDI_CONSUMER_FREE			0x0
> > +#define  IOM_DDI_CONSUMER_TBT_DOMAIN_MASK	REG_BIT(2)
> > +#define  IOM_DDI_CONSUMER_TBT_DPIN_MASK	REG_GENMASK(1, 0)
> > +#define  IOM_DDI_CONSUMER_DPALT_LEGACY	REG_BIT(3)
> > +#define  IOM_DDI_CONSUMER_PHY_MASK		REG_GENMASK(2, 0)
> > +#define  IOM_DDI_CONSUMER_PHY(phy)		(IOM_DDI_CONSUMER_DPALT_LEGACY | (phy))
> > +#define  IOM_DDI_CONSUMER_RESERVED		0xf
> > +
> > +#endif /* __INTEL_DDI_MGR_REGS_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> > index 72183bfee07a3..ec02f61a13706 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> > @@ -41,6 +41,7 @@ struct intel_cdclk_vals;
> >  struct intel_color_funcs;
> >  struct intel_crtc;
> >  struct intel_crtc_state;
> > +struct intel_ddi_mgr;
> >  struct intel_display_parent_interface;
> >  struct intel_dmc;
> >  struct intel_dpll_global_funcs;
> > @@ -312,6 +313,8 @@ struct intel_display {
> >  	/* drm device backpointer */
> >  	struct drm_device *drm;
> >  
> > +	struct intel_ddi_mgr *ddi_mgr;
> > +
> >  	/* Platform (and subplatform, if any) identification */
> >  	struct intel_display_platforms platform;
> >  
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 52f0d5dd54680..ea8ab7cb16204 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -263,6 +263,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> >  	i915-display/intel_dbuf_bw.o \
> >  	i915-display/intel_ddi.o \
> >  	i915-display/intel_ddi_buf_trans.o \
> > +	i915-display/intel_ddi_mgr.o \
> >  	i915-display/intel_de.o \
> >  	i915-display/intel_dip.o \
> >  	i915-display/intel_display.o \
> 
> -- 
> Jani Nikula, Intel
