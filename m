Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC6CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 16:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87010E446;
	Mon,  6 Oct 2025 16:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LX48ln/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D479110E446
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 16:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759769294; x=1791305294;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bpZ/QPpAvQY78gifbcr5uCZK08UlsVd6wXCooJaUeeY=;
 b=LX48ln/bygX4T6ixcbzLwkN9YplUPe4clPQRu3ID4qRtLK01CYZTmwDI
 WdbMv4JXHpdRZAKgB7ppZu1S1nY+86LkutbNEb46dPJqceg0/WShIZufx
 HuJxy0iDZpZmXe6gZpTVcfv3bsmtx2Lb/LyfLB+rBdDoI0Id7tXSM/XX2
 FW4kkg0Jf2mQMpfGb7Vsx5i1AJsCs6+2nUOSQHIPnazon8wNT3ylWFM9q
 M5szslbJxVhdEFCSZcKOstyain8FYu25KxQOzq1l9tArLL135GDvVd7a2
 0Sn2/SiL3OYaj/7ES4TGGqs30SE8XMyPZ+QCy3AKc0XyTm75V0gG0kN9S Q==;
X-CSE-ConnectionGUID: BLUWglXKRU6IjKVgepEZaA==
X-CSE-MsgGUID: Gh3sQwD7S0udSu/UFp3jyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72560981"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72560981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:48:13 -0700
X-CSE-ConnectionGUID: k/N5sRNFTYSmnk0DgdBOgg==
X-CSE-MsgGUID: AfL93T2NSmWSWDfWJKM19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185092413"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:48:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:48:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 09:48:12 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 09:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cARZTXT+PfZ2Bu2Y1+HY6uATeKwngrJt/jg3lEeWslw+o41UoP2Js56yNclOzq+9xcxtoVHS1URAYadev5hpHmGjR6G3O5zg9xJvbVNdGE16N/XiQMAyFRFR19v6Mzl/evhHHFh2l/FLCcJosYlzsaZ+9/2mgP1Sr2VdifL+95ChTLOIWZwPgLlY6mJUuLVtIfkvOVIcNPatHNqvZ+HJokQgzeEQxBGm6hS/hJz8RXWEIZzJuLgQ0ROc0s1nOgTKesmozW6/2xUhd5p6JqR75cb8lRUgekrh0WSOVJKJhL/TwzTF29R2sM1ZcenTyCnYjcV0t6vWUuNKdalLops3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U0SfMtqgO3NW6Kewn249Gh0Ud0Jh9qp2tqzUqnFuXY=;
 b=mHIlEY0/r+9FqxpI9D9XNbPC/AXIFKLc7SXG7vzRJD5McSX8M5U/Dl1UynV1FhVW315SOAeCll7/q2bIGAjFSRLr6JOPtBKlKq+ja7KDEjBlNMC30p8FxBsGkvk2EeXVyp+MkipkKCcrJQIgO1O8DgPFhh+PPz7u13cyFC4cN5hUBnVvz66c1culnlayoyw0lfUDuUBfvl19wmRjjeuWIxSKsolz61eBe4r9in18QAI1WhpAi5hnikf0EWZ3DjI02AxG5WcuSyGsAUYqJPDrGSgCHEQ5M2HC4oBo6vagG2bzo9cCRkMHf23zEkOuV0A+/86iLRKVgMh80F0wEMv6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:48:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:48:04 +0000
Date: Mon, 6 Oct 2025 12:48:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Message-ID: <aOPywRsc9aw_p3-1@intel.com>
References: <20251004000425.2489291-2-shuicheng.lin@intel.com>
 <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 6371a9e8-3c7a-4cfe-88f4-08de04f81e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6+D8zm+Hlp7d/9TI8t9EhYWq29VzP3kQSMvZEq8dzPhqFLqk3fVy1wPGfK?=
 =?iso-8859-1?Q?Bqt+JssBK+ONeVDaEQy9nkrQXoGKESnMkRJ3kh3ItmuLHZ4aoWoiltybCA?=
 =?iso-8859-1?Q?MMW7NyINfE/98o2y39FzxEcoy/zapAlbUEC2YtKuZdSJA/zQiQvp9mzkPx?=
 =?iso-8859-1?Q?WD0auQbXuGZTSa0Sg81KEkOl3YZu/PiyRfkUO+yPrJ9gHxm33MVBSP/jcQ?=
 =?iso-8859-1?Q?MokyoKK/rzEO1hLK25d663x5Dq+ccYW2NZwW0XLCEhyJ9jQ2WdYR10oLXR?=
 =?iso-8859-1?Q?TmPrqFO47VCNxoOiDVLwt8KsOH0FKokzvRMf3JswnYxpDl8sjmqaPMhhjF?=
 =?iso-8859-1?Q?O3jFBFt4j+BAIi3LbZldYAp3Y1Y7NOiOM7qSNkdEVuALD8cEkgWtJiuhFt?=
 =?iso-8859-1?Q?dWqa2NnJqQUEBkeQGur4ohct2pggx6T0aoCTQ+pQeXx0gJ27n7kO8Puri8?=
 =?iso-8859-1?Q?sISpeMCVW+Jr2x6QsvdO+JEBsAdiGbLs2s+YFo2O/8JVjrKx7r7+MWXgcM?=
 =?iso-8859-1?Q?D5pXA0zIJYTVhmYlhSZy+KvejHULh4Wl2fytGNnPGHJpvxU6HU7TW5ljPZ?=
 =?iso-8859-1?Q?zkTHPbybKY1fO8CgY74JmQrHD3r0GXY4sa+/RRw8jGU3eKQSvpYI3HukS9?=
 =?iso-8859-1?Q?sbxIL1KiHrqnzTBKWb1Zju3HyJPxBPvNUjTAmGI4fQQcP3/oyO9y4iisrt?=
 =?iso-8859-1?Q?Pe3LMLlyWYU90yHozQ158whmeRyM9nVfy2lAK9zMb6OncLx80IjEp6ncOy?=
 =?iso-8859-1?Q?agRcht6tO0JBHg+QANOg7wjEPnDjtizj04kg5XLgpPXwO0ha4KmZ8MeYBm?=
 =?iso-8859-1?Q?bKDZ3LeEg0C0hNF53mceoJ0YzNzshiowKJemMbV90nHgJ6ucqetbANs38j?=
 =?iso-8859-1?Q?aydY3yzpV1ViUtv3co4sKMkOoK/Tqz+O8oei/9smJOyRqO8xyYljmMTNYk?=
 =?iso-8859-1?Q?jHWXXRa99gixdTHOh0sOnahhe9Elg5SvANrHC6fVA1BuoDU5fZ/qur2XE3?=
 =?iso-8859-1?Q?5VMv40q+3ivxpfvgtaVBsLlKhQTOZqINmOiSGN+ixJ0uMzz2WzMquIvTdv?=
 =?iso-8859-1?Q?VP8AtTJdRI7Gz/+dASEgW8L2HDIo2VWVqkkSnjPl0IWEsdAm1NjnvHlxrC?=
 =?iso-8859-1?Q?VN7y5FqrDhQVDcBTspqimyoSeKIEi7AG8UWk0zHfkZcdyWSFUFPg3A537w?=
 =?iso-8859-1?Q?pd/6BM4KVnOFdmjMlteC2mvqI2V7bBw6tP0z8E1+99PyzVX6F6cx90F1sT?=
 =?iso-8859-1?Q?4ZFANgU4ZZNis/CeIi2vuXSPEnENPOepte1yswDREm+mbc2HxOZMB/DuTx?=
 =?iso-8859-1?Q?gS1kv4yeJAwGOpylvciqOde4QG5ArqO3D/BrKFToDUNNBHotdNfx8ygVLB?=
 =?iso-8859-1?Q?2DphcnbR1idT2oThlNgNgCi0RR/HIKDXVWQv505rGgaR9ZxbUCjclMU4HU?=
 =?iso-8859-1?Q?CovU6Ma0bWPDW/aev++TrqewRBP4StlJeULVXTVucYr6hfg5NrxfHnGf1t?=
 =?iso-8859-1?Q?QwkwZ1+6dCAD3yWd8gGosH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MR9TcGqdIQn//K7n22Xn6zkQF/ghDTF1/IXoQ40rXC1aiHTYm7J5bVlg+g?=
 =?iso-8859-1?Q?uUtPDLPDyKp81MX1XVrz0+MaQ/dfZM73VFzT3UzcKmdtDJo/6nabSw5/zR?=
 =?iso-8859-1?Q?8VcmBRBgkTd1oZeohTKecscxQjui6LH4z/T1Mu/byvQCU2YUCtyioTSNmo?=
 =?iso-8859-1?Q?jrZnm1W8MgOTKy7pbbk70DCn1UmduaLzCdtyp67uD1rx9GkwkUF6zHFWqa?=
 =?iso-8859-1?Q?CUYP6UyEDosVHpgKkfGltWKW893zJ7F/04FXLIKITscvjFyJKgLaYrCPKZ?=
 =?iso-8859-1?Q?2NMA+ewp2Kfz9jvqPWX7jfp8panHAYGE4BVsdBCtHj3EXR0EHKcn5TCVf3?=
 =?iso-8859-1?Q?jnCPWhLoNIyJt+EmLntiqY7PBm4sCtjt84nC5tknY3sElJpagmpoQuwk/W?=
 =?iso-8859-1?Q?eJDJMoAK6I/H8WFj8gJKXspzdg3TKbznwkDq6WQNxwsKPnJWLrDyXqIotY?=
 =?iso-8859-1?Q?IpVaED80XlvmsK41t7cNznNGQo4XbPWWz/D73dvdhfjXgDS48yZPL6nMX1?=
 =?iso-8859-1?Q?iGmAa9hRqFcGAECX17PCxuOg4p0Zig311NUVW2wp0m8Lq5OGMZY1xQxc5S?=
 =?iso-8859-1?Q?eARcY7swwIIGPBQuBCRH6cNeOk6vvSvL0X60OMtGRorytJ+xSWLmYQniru?=
 =?iso-8859-1?Q?T6Goz8fQVTeBwpoBEYl3NEUsQs5/98/Q8duc2DwKORE48bxGJVhRKnCGYU?=
 =?iso-8859-1?Q?mNkuOW7gkmGchKCpufwkWrso/fd6j9Obg8QBbuGl7X4WUdmha2DuXUBxz9?=
 =?iso-8859-1?Q?7shOmbSWD34la5Rn3e5R9+IBVXELztq0pQq3DE+MEQCwprMTqEfrJlR14j?=
 =?iso-8859-1?Q?HA+/hnN0dob39poyyD8p/zAPuN/UKYDRvdSN0ADamLXl7fHlV3cH40bN8o?=
 =?iso-8859-1?Q?sZ6bbC89yQPmCSmNve4C6AhQ9UwpHgy4BJh+B4+540Srmf/6dT1YNOmbJR?=
 =?iso-8859-1?Q?hcof2PWUPNvnD4LFOvtAdzCWSLQe3pS3MRs5aBgaR1YNZoQKrk1YA0paqA?=
 =?iso-8859-1?Q?7OXj14PAuckR/wKo2w0krDeG4/Cf/WowwikcfNqxJ9v5tjQCptSM7AWJr/?=
 =?iso-8859-1?Q?tI9NbXJn3Y3bxoqDsubk/EMgY1oAF5SS19sRuwzrqx5j/NR8goUCdVq1oO?=
 =?iso-8859-1?Q?yx5pDjXi7v7mY7q9kngTPAvikW81C4r73ebaNMOmk/YB5Oo7hnv/rwANsz?=
 =?iso-8859-1?Q?IfuB2gH7x07T+hxw169Kwiq9RQrx+9dkUnQaUpygzowF35XGlJNoijj+6U?=
 =?iso-8859-1?Q?26z4W9OgFPS48mCBeVD+c2CWMg0kLhhrjbgXbQBFGukFu4qdFJ4AlstlEP?=
 =?iso-8859-1?Q?KrN46l0oVxsJvcsUhqCPXdi8U9ggj1CyrjKsnM0xzt+3NOwvxecZ4Wgdai?=
 =?iso-8859-1?Q?mBcfckDRQGvB5mPzQttwlc0JwC0LD99Z8UVKty13o5ugClD/9imzuGonJd?=
 =?iso-8859-1?Q?jWp4EJaBQqwRKXccmrOuYqebvOmpYMdnbXA7fk2UOUY7eZMrc1gCKg26O2?=
 =?iso-8859-1?Q?OE3tEfG9S7x6QoYM5SRIpMOg5r5gUl5Hc2SgyCUQdYvqgA1Km7lmTevT24?=
 =?iso-8859-1?Q?sttx3haNgf8bAv9gblhY6Yu8Yz2TUwAPbup+Dq0nQuJP3TYkFkg8SuTzDJ?=
 =?iso-8859-1?Q?lUSwxQru913RhvY1gsok1LpDyZr4uVcWwN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6371a9e8-3c7a-4cfe-88f4-08de04f81e20
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:48:03.9997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRMKpm3OfrLIzHT75RZIrjqkn6MED1gQe1Q8RHLqm99gt+0SslC3HmjqtgTIGb4rnZB63ND+MWimcrwu+L4/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
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

On Mon, Oct 06, 2025 at 09:19:59AM +0000, Gote, Nitin R wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shuicheng
> > Lin
> > Sent: Saturday, October 4, 2025 5:34 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> > Subject: [PATCH] drm/xe: Fix copyright and function naming in xe_ttm_vram_mgr
> > 
> > - Correct copyright year from "2002" to "2022".

patch pushed to drm-xe-next. Thanks

apparently we still have 2 more occurrences:

drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c: * Copyright (C) 2021-2002 Red Hat
drivers/gpu/drm/xe/xe_ttm_sys_mgr.c: * Copyright (C) 2021-2002 Red Hat

> > - Rename ttm_vram_mgr_fini() to xe_ttm_vram_mgr_fini() to avoid
> >   confusion with generic TTM helpers.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 9175b4a2214b..9f70802fce92 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -1,7 +1,7 @@
> >  // SPDX-License-Identifier: MIT
> >  /*
> >   * Copyright © 2021-2022 Intel Corporation
> > - * Copyright (C) 2021-2002 Red Hat
> > + * Copyright (C) 2021-2022 Red Hat
> >   */
> > 
> >  #include <drm/drm_managed.h>
> > @@ -284,7 +284,7 @@ static const struct ttm_resource_manager_func
> > xe_ttm_vram_mgr_func = {
> >  	.debug	= xe_ttm_vram_mgr_debug
> >  };
> > 
> > -static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > +static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> >  	struct xe_ttm_vram_mgr *mgr = arg;
> > @@ -335,7 +335,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct
> > xe_ttm_vram_mgr *mgr,
> >  	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
> >  	ttm_resource_manager_set_used(&mgr->manager, true);
> > 
> > -	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
> > +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_fini,
> > mgr);
> 
> LGTM,
> Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
> 
> Nitin
> >  }
> > 
> >  /**
> > --
> > 2.49.0
> 
