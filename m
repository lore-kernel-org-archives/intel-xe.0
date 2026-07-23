Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4AC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CC210F17E;
	Thu, 23 Jul 2026 16:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn1cdBre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924110F17E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784825244; x=1816361244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CSgumS8JAi7GO4NeSDxkYMVGvqrEYriAgsM4Dk3RnQU=;
 b=Qn1cdBrehI5EYdtSh1G7Aqr0bU434SfpUy/j7f0xZIb/mgdxwwsoau/D
 R1+hvnS5GZj3i/hBa0Q0peoOdkcwd92+g9FFkee1QvAFkHWpzrM9RICar
 FE6nCKVaDmRrdBqcCr5/xEMMeMrUwvHC5Jqtj1J00o15JN0oCdZJK3iEy
 EUxNqfn8w6gLeLkPAiN2XWtCg4rBrMBBjKVP9KDqs3VjV3I4P3ILMpTWE
 Qa1gjD595o9DXnU1UjM63m+WWVf8xsvLfRPc6xQdTjtrJf7N0hb4/y0UR
 MSytqvEMJrDwVPDizXDfoPYJ+CsOxaZYhv237Bqd1b7zqpGOSj1F9hEr7 w==;
X-CSE-ConnectionGUID: 5qq5OTCqTCiO8j6h3lBhKQ==
X-CSE-MsgGUID: uRiH6enSQO+ZLHIykF29/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96633522"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96633522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:47:23 -0700
X-CSE-ConnectionGUID: K1x/aeeLQqCTjy9MrYT6OQ==
X-CSE-MsgGUID: zWN0Z4l1TJa4m2o4Iq6y9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="258527073"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:47:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:47:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:47:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXWoiA0AKfk/88lQowv0gsj9BpZ6TfC3jryFhE/63sEugi5H2AbNCicT8p93JVi6NHD2a+yQOzs2rz04n89i0mgMfqYBnRSWo+grStoEsPAE3mLWNZ5QpIXW7YEv/KSM58QWopHHRNPtzoMB99z36YRwNRqjrJiKB+p9fnRPR7E2Mhn1BCHXazYZY3BRJd6VzMmYpUaYB/2dB+MnEvPniJwko6Meau174kCi85KJh0w/xPh+CZAGR239WTBDjC6NM2IlhcAB/dLp5m2FwCR3tfn9iSRI7oNBdWyxKt803LievF7r9fEyMvBAfdfFFH9Xc/XdGlkhzoQ5ETlcYv2p+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IFlZzXO9Ft3jnocyoMDzVW4jxOYxWov4jgl1g1mFiM=;
 b=WHPqoN7L6DXj3GiuAKhFew2AepkaxANqld3O4WeehO6PJjgwOK8ag34u4dhZ3IyswdRi0aL3j8NWVxXN2yOURJ+8RvtaiAb65JVyr9EsMNNGLmzIIsCbVjwb1c9Dvx2ZfuSXiSqFO3mrgli86xOqBFMyMlpcue86E01owBP7exSI7E2Y2BcH+oF8tl2XvV0n4jhWO/l6V+OA/Wz6CeuLNFX1sGPH3zXHk5QN46pwG7wmFPBXzQ7fGwm53mH5758s+pzwEGl636UOyknPkgxEVeXZTCt+KqR3HARQni3u+3ewiqTQEw5fnL1iSBxt5gRCGiPMhGBjLixeroVFYKROtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:47:08 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:47:08 +0000
Date: Thu, 23 Jul 2026 12:46:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>,
 <daniele.ceraolospurio@intel.com>, <anoop.c.vijay@intel.com>,
 <shamim.begum@intel.com>, <anthony.giardina@intel.com>
Subject: Re: [PATCH v4 0/5] Add ocode late binding support for CRI
Message-ID: <amJFf3dmdNGxuWv2@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
X-ClientProxiedBy: RO2PR80CA0016.lamprd80.prod.outlook.com
 (2603:10d6:10:2a::21) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 38cf2abd-2fea-4d17-d306-08dee8da08c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MJmHY70aeHtcsfsSWDO9pnaa98wCYHGSVSAq2rZ4GOaZw0Kpad96rGzj/caC6sZfSVPT+MKwazOjZitWkWEdFjINoeNnIy76c9kYnxSWYhllnr69t21x6NjS3yCzsx+yt9VG8aSYywqW8hPdUZBykzqsw2uvDS2sYRbplZ9jhnGoY/mhxqYMeh73EcA7S8LT+GOz+aNvEFA9+sVKsEre85t7EegpzNYPOiRklsjovx5rvviXI46e4+Qrneiz8rnztrOb9l/Z4e6SKYnL8kU7uWcKPSQd5qypf5fNuZd3GOjvdRmEdTUcI1qZD2SF1fchTalZpUf6MMuO9pUe36rIeAYR9BaTbR4k/IHLE1fauAZGzDIEjZ5etGor7ps5m+sMSvHmq3Ugg42oq0e5blCvY1blkhbSzXNKi6RYbhAs71DVEkeBB5l5z2SH6/QxC63NIsGSq0KPUu4GK7RRvMxIsZn/moXm7F966R7ra0N1zvTp+x63tSXC5otBR5O1cA+HW6svhlclizEs4FCotU6EAwCrFT1lLcgab5VoKEfw2j5Zpdd5KrSnZgs9z3yTx/Oayt/7X5YfrokxdfDqzxzMx7ZGBgiY26CZaiuCrKIPdIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYQfBcS5m30+EplUFpLTq6nHCGgoL9Myj7lvr4wY0QaHOyEYATQH5OE7tQby?=
 =?us-ascii?Q?wAxQ4iM8PRztJWV5Ya5Y3Lmi9hqnappCZ7Zqo895kJQFw5wJ1kCrT8EFepFP?=
 =?us-ascii?Q?Zgv7L8ciY6Lz9xVGlFWWSbsu7c8O5TZr4/JntBAylYsochzH6PKU9gImawcU?=
 =?us-ascii?Q?DzleCWpGrnd6jBFBIqiBLBw1ft3JdTVIjk0eSh7mLNLia4A/MN2PM14Y7jzU?=
 =?us-ascii?Q?ybBvXhTVX0KHF1fEGKDXePNqLbT11rxCTBvPu6AXfyy7K9w1J+xX2sSurJsV?=
 =?us-ascii?Q?jbL5OfqEn/YMtAVceHsb2SR4ZfoD7H9GXfvlE6PU7nzMNDWjvz5Xd6apLvJM?=
 =?us-ascii?Q?gnt5WVocgVqn1RiMXd963ckZNTFMcXpkkwUj1beYbC/rkUgaIagk+IxqLLMk?=
 =?us-ascii?Q?G+xTk6mp5ClyCsmFeGnA5wz/IALWhve/BrN47N66LkW6XK0hH2vA8P56imzt?=
 =?us-ascii?Q?Yj898uu4cKeCnJ2ThuVFK9/XH/oJU538H9XOeurgwjMeu1hPJbmnUVFXPT5b?=
 =?us-ascii?Q?DYGEIK2O6t5Tr6LQksVxJXCIoL2WRAXsFq3gurKBQmuSeN+Tbobu3ChPlvo9?=
 =?us-ascii?Q?4gCXMazBvsFGpY0p1/caLorQkdZp8BgywAffQ01UGLGliWFFYBeGJdCvPY8E?=
 =?us-ascii?Q?gtTRwSPZB8kp+kbvKwcaA+ygBOI1X9BoRGuasR/TlS592+6KoZeUz8BCTViO?=
 =?us-ascii?Q?7eiRI+lwPIZJTQeYrikFX6Thlf+a+zT6Uhaagn8KsgLfdBTjvttKL8DrLgJ1?=
 =?us-ascii?Q?P7gz3DX3ldhkPeDAwfVanZdlT8DhoJXSYFNJfi5IR1hgfY2lJh6Btp4z0Rj8?=
 =?us-ascii?Q?kA9IOpIVBm3D58YaXlkF0C+yNKaRk5ntf0a0zzz07lJw3IHEGtMMAe2zZMtc?=
 =?us-ascii?Q?S6pt9cgj1VlI0hTIpP0W7my0n+tkW9DUXAAN/FZqU/a1yrgGAF1fHFlvVHpO?=
 =?us-ascii?Q?emuc7GjvR5CUQ0TkuuqGN6NjVo0aruaCXtaIehq1EJstWrjBVCYdS7RI6ygn?=
 =?us-ascii?Q?XB42QmN7QfjjiIQfH5/gy/h4mtKc1x/8aPYMaKac4LY+BXxdJVlxGPLh9GBj?=
 =?us-ascii?Q?aGIlFZMg+r+J2BRa7J3/Kcd9YEXxDHtu+u0YPDDCOVG81urC4x6qnwrGEHeB?=
 =?us-ascii?Q?4EFGEyDHVjFvKh4cWGwRt8rRtCve49c8LWlu/if9JudMsZqGJc+J547HAUbg?=
 =?us-ascii?Q?+tDkrA562H//jRfYxu+LOvlUo9ZktQyBmr3kxzsUMc6YrFetCaDXbDS+aEEQ?=
 =?us-ascii?Q?yydA7GRHeom38qdVaKopUfJlvemQUF8CKXxIslhBURV+lis5IXtRfFhWVycP?=
 =?us-ascii?Q?RhfTYzSNQXkEgKvrGXndRi76lIUgNRaPfNAIqEitHYOI2LO0SWkFzfvAyHft?=
 =?us-ascii?Q?gvAnHFR3Z3cdODggC3d/YJSy8w/d1L2b14UuaO+bftqx+lkrx5YZvcX28A7G?=
 =?us-ascii?Q?TyPMpRQTgutrUnEqFXrgKxRfe9hlLq73sdjfhjl49lbNPtus4e6Do98gvxSf?=
 =?us-ascii?Q?nk+X3PtS+QJ0x7xI8rh+y9NuPai8RNf3fTK80QK7pIVLLeXOKD8pGSOVeUvo?=
 =?us-ascii?Q?0U3Hzy4pa1R/L3GzECfsDfNKUv378FuAfBRAADNzePaUHUqhy255tXzsMkAf?=
 =?us-ascii?Q?Q7UqRw7z42iM959RWuxdfuAYiHn2rC0juKN1ZVTeOOFryzAvqIynTWXN1+PW?=
 =?us-ascii?Q?9MDEmb2R9XDKcJs5t+ozZpsrrL64L8OEHbQf7/za9BtBavqiDaO3vutI24np?=
 =?us-ascii?Q?w2d/oBbjsg=3D=3D?=
X-Exchange-RoutingPolicyChecked: kmu7ZTiy2RXi3ll/3C36MerK/xb606SiI+WdPApZszFNHiluDKiGya3E1r+Zkltmc7T1uuE7MnCbUBhIa2FhL3CiBpOhwySu0aVuS9skE2zpr0OMaP39VYTuLbCigb+SMDkCEVBsy1CO3u3/O3pHvNP+esUkQSTetKz1/aKW5UyfisPGRbJmRgsMp2FwXLse2yxd0GloJPwAYzl1wf8dko30/ReQ/xQxWYu+K1x6DMZWnQc5eAx8O0BqT/XBiqKb0j9V2uYyFbiDzV9g7LiyKxOnhv8Bwp/nAReXqtvUZiTu3TQmt5CNS34knWk6k0/+tA56RUMnXV96KyhdyMwVuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cf2abd-2fea-4d17-d306-08dee8da08c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:47:08.3865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0sutFRIK1qeoEElRfPBrpSMeJouQ5oxTGitwpi42dSvC0N/1heICI2QtxqPmdNpfnAZ81wtM177AqV78rwJgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
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

On Thu, Jul 23, 2026 at 02:07:00PM +0530, Badal Nilawar wrote:
> Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
> loaded through late binding flow.
> 
> v2: Dropped "[RFC,3/4] drm/xe/xe_late_bind_fw: Track firmware load status"
> 
> v4:
>   - Fixed most of the comments from Daniele
>   - Rearranged the patches
>   - Introduced new patch to fix firmware leak
>   - Improved "TODO: compatibility check" comments

Please check and fix:
https://sashiko.dev/#/patchset/20260723083659.716683-7-badal.nilawar%40intel.com

> 
> Badal Nilawar (5):
>   drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry
>   drm/xe/xe_late_bind_fw: Convert late bind flag to mask
>   drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
>   drm/xe/xe_late_bind_fw: Enable late binding support for CRI
>   drm/xe/xe_late_bind_fw: Refactor pm flow
> 
>  drivers/gpu/drm/xe/xe_device.c             |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +-
>  drivers/gpu/drm/xe/xe_late_bind_fw.c       | 118 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_late_bind_fw.h       |   4 +-
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   4 +-
>  drivers/gpu/drm/xe/xe_pci.c                |   6 +-
>  drivers/gpu/drm/xe/xe_pci_types.h          |   2 +-
>  drivers/gpu/drm/xe/xe_pm.c                 |   6 +-
>  8 files changed, 106 insertions(+), 40 deletions(-)
> 
> -- 
> 2.54.0
> 
