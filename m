Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3CCC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9101310E0D0;
	Wed,  2 Jul 2025 23:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1T9Iq6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0C110E7AA
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751498587; x=1783034587;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=gUtlyvaFKgSKFXuQ052VtWeDSJJrVp7+5ktP22Br06c=;
 b=C1T9Iq6bnaLZvt4hz0zKi2+q1R1i4vbsggPtBoN5oRYJEEKsWiTZYBGL
 tns8BOzY1wBwpk/8RD5ftw5T2Pr+Ng0p5L00fiEEskkxMxpqMePJu67i6
 hsh2uG50iNnOL/fHAy8+qvombDr4BniP9jTXUjtr0172vr4h2MsezsEqJ
 NCibyLEdpm/MGac8qhpD/HDLKeVKxM9WynVWgbEL/79sr2KqbiVkMS1Ei
 Rlgynx09iZBLB8qAFNnnnyuAVD77SBTxh+/U6Za+C9vN6g0s51POlzVI7
 urUK9jaTqzfJlIwQCJ9yEl3z5q8Mq7EAvhB8LUTgKeCwlKfNdz5Uyxv/i g==;
X-CSE-ConnectionGUID: wJNvSLE0RyimIqJOKxbKug==
X-CSE-MsgGUID: iuuNcTlGReOqvZJea0rS0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64509270"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64509270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:23:07 -0700
X-CSE-ConnectionGUID: IiudishiS1WBkSRx32ULlQ==
X-CSE-MsgGUID: 4oEzf+HrR+qizWsvng/KjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154283743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:23:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:23:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 16:23:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTlsXZHLhejolaDknG4AKSqStYukQ1reRC2iHxL5xOj12okvmjgoJE3Lgc6yLK96+SeO6BhCnjXTiKE5ZBARVCz5K3Pxsa/bCkpMy4BKhH46mb25CBH1ne2WAiRij6cmr875pCcsNTsdCKMaIRvikqgiWv4pKBzoKNMS1bkkR4VZIdOhkWDyy4+FFLDtLqkKlzJhgHqTKJWDXXdvSOHikMR3Jp8aJsAGlDn6A/g4ugHKN4WnBGpcg/m27PfOiEoABnjTByb/cafJEo8NA2AAFFGhB07tbx7l6SVKo9j0j9MnYeNpct4qXm2CgGJDeNl2HoIZH4zdx6JEN2e5Flf5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snVji77UfNEcb5nLfFh/4p0H4TBA+EdHhe7r0S48B08=;
 b=xdlzONQUOvhMd5n2CijGQQNvLjeGhAijDPTm0UudF3dZaGmUPqWRgBQaqLoCvpo+yNvjyUUh2mVx3Z7gj98qxFlzaTi92ud6N2+0ftytRoxL8lm/VHuyOkaDwzMACSJakSVD7OmLRAmjiWYG2/rQ+AwC7+pvOmREiITb4427D8a8GjYqZLIruA2AIozaSnYcb0NsXBBjVoauXj+NHYyt/D9iobBaMJ7cqFKvemdcq1XYOuZoUQdmroFjOFvaqbcgkI7wqBl0mMxzMpVeYWQSK7z+7f63ML4mNNviDTFPEyhVcUyq3d5kP+Z0qiuqq8XGS5Phre20kP3KP5mS0DqJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF6915D992B.namprd11.prod.outlook.com (2603:10b6:f:fc02::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 2 Jul
 2025 23:22:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 23:22:23 +0000
Date: Wed, 2 Jul 2025 16:22:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Future-proof for multi-tile + multi-GT cases (rev4)
Message-ID: <20250702232221.GI1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <175149611152.129624.2249927135641139129@1538d3639d33>
 <20250702231426.GG1204996@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702231426.GG1204996@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF6915D992B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5729a898-a7a3-420e-c7ea-08ddb9bf4ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YYVwU/6zIcF0umQYbOid2sxhzjPUmX6JsGSMAhaYO9pfMy8X0/FE1W+5hRMx?=
 =?us-ascii?Q?Tbjqh+vp2RPgHhgiJ1ROLAqkbGX3SFBmt2xRB/lqKQfd+I+eaXIzt85SQFH7?=
 =?us-ascii?Q?z7XiBVqSqG8dpwn0o9eFTT46qsIgSfdF1rFkKV61B7bUPWZCtEuUm9lYmGMV?=
 =?us-ascii?Q?ylwW+KfJX9KEenm+uy0s2Wzj2Il7AjKQoPBz4jOtOMA/As3QHln1X4W8B3WR?=
 =?us-ascii?Q?Xx5dicL6gWMfUkadcnajkAeNJ6MTb2O4Y18Rccr4CAq5ku/ribgiFrLio+ib?=
 =?us-ascii?Q?kmUppQBT48SCXU2xyC1OQMXlxcq36uTtDSjsOg2VWqphlAN2OtVMZpF+NtqE?=
 =?us-ascii?Q?0k/Q9SNS/7PxOceHF4ccUArN65qAe+DHCu+mbDMQ6JfkgsQ51+Dn6UrB83q0?=
 =?us-ascii?Q?SivVAfj5fMAJMNtpAgEeLjIojSADoC4wUxqtVrJxl7pa6gCOcNlE18dTDGRc?=
 =?us-ascii?Q?7tV0+zZnyiE7t9gDzvrSwIuAJit8S+aneTrUimPTm/eJsxfUAWhSvJ+2YR1v?=
 =?us-ascii?Q?oHJOyugW1JcztiFJPsNq2L2G2I/qSk3YptR0SiZwLGl+3HbJagjLvbe6MjC0?=
 =?us-ascii?Q?CmnGuqJnpOqA2mMC+LaLV+ApukP91lSzg82SqRfw4+i7jFfBXKU0FGcf5ib5?=
 =?us-ascii?Q?+YQ8+mSKfIjFm2/3InnNP9DuMSULMhcZtLvmUyllX2c/vfUO+srxGq9dVOa/?=
 =?us-ascii?Q?7/K1GjprFk8XH5bL88eqpS4ZqfWsM9JXAVhJRKTJ0pWz6HAIH5tpsckTrUeL?=
 =?us-ascii?Q?4RBRXEkhVCOryj8L4zsf4Mzz6hG/UqZ3WYps8GwTVFekJu5+VRJySrcKxRYE?=
 =?us-ascii?Q?mTt3+s2h2X5IJcPkMGs5Fp3d12BQ8FQXnmZA36AiJGwd0MvtyhGIUXv3jmJv?=
 =?us-ascii?Q?tj3Y4RFQYumjSJMrAec+1tQL8H18BK8dCMw0/tA48dIZps4iXsn576+WiYpp?=
 =?us-ascii?Q?x0XU+srjixsiEwTFzSBJZNI/4or5fMs4XCagprDAyzfcKTe+YQDHkp+fBrXi?=
 =?us-ascii?Q?XkrNSx27Kvn5RgY3zjhPqetE0q5CD+p98L4WHNTPHEmpEUcp3ZK6rFIP9d7s?=
 =?us-ascii?Q?Df+t90V6hje88GPg+Kiy1Y3ycXkPpiPDv+7+OOTwl25bjgLKuwo60tWGy4Qy?=
 =?us-ascii?Q?jxoV38b6Wj5sGunXB6v9JLut8efMbyRW6tgVXaTDFyoSV212gzfh59WcHDhz?=
 =?us-ascii?Q?gYA9mJ6B+G49gYRm/Ccg7vTNswa9U53HTqoP2/wuVrdOK/f9js9SZSRsorqM?=
 =?us-ascii?Q?cvMuMUIwKU3Z9vKl1jw5oPHeP1wogImVDWdWVFfDI3tBifpFMPwzsfZHz+2w?=
 =?us-ascii?Q?SiWYgQ+yhkqdjXmNmxsfoGIX36oBo6B5SVmrJiVXOBFLwHTqNwnUs/EuWowY?=
 =?us-ascii?Q?7AExVCU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqNthwPDfir5BQFt099yld1BxHlOz3incKlSD7bVqEBc7o3IRZ5cMRojH/Go?=
 =?us-ascii?Q?DoWLv9Fu88MnvFdpIEpS7PvPOcokxPSIIGlcRm2SqiUgtKSL1iVcyjEk6GEm?=
 =?us-ascii?Q?rT7td4NVPj3dOOEZSu2yT8XgLme7XrB14SvzRBtMUhFfLtYf0QhlnGMYGcsb?=
 =?us-ascii?Q?E9TyUgeNKyg8z9mAWcUbDRVYauz2UYqXQoMaNy/ZXzX9IyhKa62wYpLK/6tU?=
 =?us-ascii?Q?8+/cTBm/jE8HQrz2kRKSBhDkWEVKejaPxyL5/Ckhrh4lJdFed2PoKFwjiQRJ?=
 =?us-ascii?Q?bXGBDQlhlb+GzvFc9bmuLswurn1AOnTw4ECxW3tHmpmWjnC5UIwNs8xWRava?=
 =?us-ascii?Q?xp5qcWxcR+jOjh7JcXXXTgvwnwmJWeXeeC5L/cOHHMM6KF7Lb9mvbhLCaQBF?=
 =?us-ascii?Q?fSOMZStOb0AUzDN4X8tQSrssJ2WcNSPmV08fVuKhH8IIna08yJMPtVwiGTLt?=
 =?us-ascii?Q?bKfCFVzq4zXepvqUE6WUenpgj+UgYhdkbZfv0a/K8kUBfftXw1AiP7pA3QCw?=
 =?us-ascii?Q?cm4Pq4GksQGhMUcqa7h0N8ZkyZrDoMVZ9Z6rwB+P9h0NwEsv0Jc8GUEtQMHm?=
 =?us-ascii?Q?SJS/vWycE10aLp/iaYiaz6EMPtSP9gGF3DEeQ5xC/OzvIuaCcLE+FeOt9JIn?=
 =?us-ascii?Q?0uT4uGQKapKGPNacp1LmNYnKmp2ZmZnhrXp6qh87roK7IcMlSaYHRuruxZ46?=
 =?us-ascii?Q?M2+TAjjB0Z+T9X5WST64bgpKe/bAszqnNUW0twtZiZK2UYGS0ytAd90ZAP2r?=
 =?us-ascii?Q?IWCq7uNdW19p55iV1ksQP+mD54u2uGoAar07+JALQSvYvA/WHkIA+FrhSX5I?=
 =?us-ascii?Q?X5L176oqCSJuktcqNMZA51K+5WMsfYWVaNCfVEFlyQOcToZjF0zpVqCNoRi8?=
 =?us-ascii?Q?4OeoVeHAmTPxHuYKV6gdBPRGIx3uYuEhoqT5C5Vnu4g5+dfTGUg3bIgSRE5N?=
 =?us-ascii?Q?KMnx2qxsjxqcVFy6pi50qbOq2Owa7Yvz0N9cVjyh8ZgaO3lVjdHO8n7L1Wwu?=
 =?us-ascii?Q?6uTNS8dOQzltC0UQ7j3vP4FKAt0eI4hg+ajdF1+ARjYM4Ai6RL+wb+00P4aj?=
 =?us-ascii?Q?igZC8jQ8FVrjmUsrvO0hJWcoc6fL8LfrI8UmjyHULRMJiV9PkMXgOlWAKt5o?=
 =?us-ascii?Q?xLgIA4+N1sI/7WJ13Az7WXQkHdzdyg5mTUruzGOnAzzTezfyGyluT0KoxG4O?=
 =?us-ascii?Q?SNjIMF3/EFy5yVaCf6NlSs4GFK9YZvHDBlmqB3RwHoz5UTKDy5nBRJpqeqNo?=
 =?us-ascii?Q?NRZTPgll2KcMadC46hjcAU7qjPj0267kR4IkiSh9qHoGN9Wsh8hrDhBdqEgA?=
 =?us-ascii?Q?4NDIHJA9IA6cnoo/6EqDhNJ05hh0rM+vSc7B8EnnHOb0vJaZaw7xNlipdXIa?=
 =?us-ascii?Q?21EvLWQKjljb5nd0Dh20lMBE0TyWxHf4byFN2Al0leRi+gWhUPQcZEQPJw6w?=
 =?us-ascii?Q?cpdMPxtiYpO37DIBVjhb3VrEqFPcy6UNTYLBsDSSpPHa9swGHlv7r1AMTHAy?=
 =?us-ascii?Q?hmC1kEMFZcnLe4ehxFZusH1M7Fe4GGdfweF8B5eFfj2ZYBzX2nswhvSOegL5?=
 =?us-ascii?Q?By8gdqMFnwSfwISmHPAdBDCw1/hw9BxcjhzJ0xAiYglo96ETF5yvec+26Vgx?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5729a898-a7a3-420e-c7ea-08ddb9bf4ce3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:22:23.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOqmeXD3UqUFTJcZVjPTmbtod+yIQ+yVBt1VIVnJbIOS9jJ2jnORTy/GqPNkGQca4wzSmFoH4HQILn6J3PuXmnFK9sx7b3aKtE5zaBRbXmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6915D992B
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

On Wed, Jul 02, 2025 at 04:14:26PM -0700, Matt Roper wrote:
> On Wed, Jul 02, 2025 at 10:41:51PM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: Future-proof for multi-tile + multi-GT cases (rev4)
> > URL   : https://patchwork.freedesktop.org/series/150192/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8_FULL -> xe-pw-150192v4_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-150192v4_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-150192v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (4 -> 4)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-150192v4_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
> >     - shard-bmg:          [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5058
> 
> > 
> >   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
> >     - shard-lnl:          [PASS][3] -> [FAIL][4]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5165
> 
> > 
> >   * igt@xe_gt_freq@freq_suspend:
> >     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
> 
> System never came back from suspend.
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4620 covered this,
> but it was closed as 'cannot_reproduce' a couple weeks ago.
> 
> 
> Patches 2-7 applied to drm-xe-next, and
> https://patchwork.freedesktop.org/series/150943/ , which is equivalent
> to my patch #1, applied after them as discussed on the email threads.


Hmm, I just noticed that this CI email is reporting on v3 of my series
that was sent over two days ago, rather than the v4 I sent yesterday.  I
didn't notice how slow and far behind the CI system had fallen and
assumed this was the latest.  :-(  I think v4 should still be okay since
the changes were pretty minor and self contained, but I'll keep an eye
on the v4 results whenever they eventually show up to make sure.


Matt

> 
> 
> Matt
> 
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-150192v4_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_async_flips@invalid-async-flip-atomic:
> >     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#3768])
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#3908]) +1 other test fail
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> >     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> >     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316])
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> >     - shard-lnl:          [PASS][12] -> [ABORT][13] ([Intel XE#4760])
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> >     - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543]) +1 other test dmesg-fail
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> > 
> >   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> >     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#367])
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> > 
> >   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> >     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> > 
> >   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2907])
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +11 other tests skip
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3862]) +1 other test incomplete
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +76 other tests skip
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> >     - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113])
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
> >     - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3113])
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
> > 
> >   * igt@kms_cdclk@mode-transition-all-outputs:
> >     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2724])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
> > 
> >   * igt@kms_chamelium_frames@dp-crc-fast:
> >     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-fast.html
> > 
> >   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> > 
> >   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-32x10:
> >     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455])
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-512x512:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> > 
> >   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> >     - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291]) +1 other test skip
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> >     - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#5354])
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> >     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#309])
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> > 
> >   * igt@kms_feature_discovery@psr1:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1135])
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_feature_discovery@psr1.html
> > 
> >   * igt@kms_flip@2x-plain-flip-ts-check:
> >     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316])
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html
> > 
> >   * igt@kms_flip@basic-flip-vs-wf_vblank:
> >     - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#3098]) +1 other test fail
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> >     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> > 
> >   * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> >     - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#4543]) +4 other tests dmesg-warn
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> > 
> >   * igt@kms_flip@flip-vs-suspend-interruptible:
> >     - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_flip@plain-flip-ts-check:
> >     - shard-adlp:         NOTRUN -> [DMESG-WARN][52] ([Intel XE#4543]) +4 other tests dmesg-warn
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> >     - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> > 
> >   * igt@kms_flip_tiling@flip-change-tiling:
> >     - shard-adlp:         [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#4543]) +1 other test dmesg-fail
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +2 other tests skip
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
> >     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651])
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +5 other tests skip
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#653]) +2 other tests skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +2 other tests skip
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> >     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +2 other tests skip
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +5 other tests skip
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> > 
> >   * igt@kms_panel_fitting@legacy:
> >     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2486])
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html
> > 
> >   * igt@kms_pm_backlight@brightness-with-dpms:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2938])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> > 
> >   * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
> >     - shard-adlp:         NOTRUN -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> >     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +1 other test skip
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1489]) +2 other tests skip
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> > 
> >   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> >     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1489])
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> > 
> >   * igt@kms_psr@pr-sprite-plane-onoff:
> >     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#3414])
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> >     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1127])
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> > 
> >   * igt@kms_setmode@clone-exclusive-crtc:
> >     - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1435]) +1 other test skip
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
> > 
> >   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
> >     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +1 other test skip
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> > 
> >   * igt@xe_eudebug_online@pagefault-read:
> >     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4837]) +1 other test skip
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_eudebug_online@pagefault-read.html
> > 
> >   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4837]) +2 other tests skip
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> >     - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#1392]) +1 other test skip
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> >     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1392])
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> > 
> >   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> >     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#288]) +1 other test skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> > 
> >   * igt@xe_exec_fault_mode@once-userptr:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288]) +4 other tests skip
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html
> > 
> >   * igt@xe_exec_reset@parallel-gt-reset:
> >     - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#3876])
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
> >     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#4915]) +36 other tests skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4915]) +53 other tests skip
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> >     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4943]) +3 other tests skip
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> > 
> >   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> >     - shard-adlp:         NOTRUN -> [ABORT][89] ([Intel XE#4917])
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> > 
> >   * igt@xe_huc_copy@huc_copy:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#255])
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
> > 
> >   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> >     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2541] / [Intel XE#3573])
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> > 
> >   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1173])
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> > 
> >   * igt@xe_pm@s4-mocs:
> >     - shard-bmg:          [PASS][93] -> [ABORT][94] ([Intel XE#5255])
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_pm@s4-mocs.html
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_pm@s4-mocs.html
> > 
> >   * igt@xe_query@multigpu-query-config:
> >     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#944])
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_query@multigpu-query-config.html
> > 
> >   * igt@xe_query@multigpu-query-uc-fw-version-guc:
> >     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944])
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
> >     - shard-lnl:          [FAIL][97] ([Intel XE#911]) -> [PASS][98] +3 other tests pass
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> > 
> >   * igt@kms_big_fb@linear-addfb:
> >     - shard-dg2-set2:     [SKIP][99] ([Intel XE#4208]) -> [PASS][100] +2 other tests pass
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-addfb.html
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-addfb.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#4543]) -> [PASS][102] +1 other test pass
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> >     - shard-bmg:          [SKIP][103] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][104]
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> >     - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][106]
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> >     - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#3124]) -> [PASS][108]
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> >     - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][110]
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> >     - shard-bmg:          [SKIP][111] ([Intel XE#2291]) -> [PASS][112]
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> > 
> >   * igt@kms_display_modes@extended-mode-basic:
> >     - shard-bmg:          [SKIP][113] ([Intel XE#4302]) -> [PASS][114]
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
> > 
> >   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> >     - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +3 other tests pass
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> >     - shard-lnl:          [FAIL][117] ([Intel XE#301]) -> [PASS][118] +2 other tests pass
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> > 
> >   * igt@kms_hdr@invalid-hdr:
> >     - shard-dg2-set2:     [SKIP][119] ([Intel XE#455]) -> [PASS][120]
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> > 
> >   * igt@kms_hdr@static-toggle:
> >     - shard-bmg:          [SKIP][121] ([Intel XE#1503]) -> [PASS][122]
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_hdr@static-toggle.html
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_hdr@static-toggle.html
> > 
> >   * igt@kms_pm_rpm@basic-pci-d3-state:
> >     - shard-dg2-set2:     [FAIL][123] ([Intel XE#4741]) -> [PASS][124]
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html
> > 
> >   * igt@kms_setmode@basic@pipe-a-edp-1:
> >     - shard-lnl:          [FAIL][125] ([Intel XE#2883]) -> [PASS][126]
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> >     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +2 other tests pass
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> > 
> >   * igt@xe_pm@s2idle-basic-exec:
> >     - shard-adlp:         [DMESG-WARN][129] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][130] +7 other tests pass
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
> > 
> >   * igt@xe_pmu@gt-frequency:
> >     - shard-dg2-set2:     [FAIL][131] ([Intel XE#4819]) -> [PASS][132] +1 other test pass
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@xe_pmu@gt-frequency.html
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_pmu@gt-frequency.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_big_fb@linear-64bpp-rotate-270:
> >     - shard-dg2-set2:     [SKIP][133] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][134] ([Intel XE#316])
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html
> > 
> >   * igt@kms_content_protection@srm:
> >     - shard-bmg:          [FAIL][135] ([Intel XE#1178]) -> [SKIP][136] ([Intel XE#2341])
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_content_protection@srm.html
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_content_protection@srm.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][137] ([Intel XE#2312]) -> [SKIP][138] ([Intel XE#2311]) +4 other tests skip
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#2312]) +1 other test skip
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][141] ([Intel XE#2312]) -> [SKIP][142] ([Intel XE#4141]) +2 other tests skip
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> >     - shard-bmg:          [SKIP][143] ([Intel XE#2311]) -> [SKIP][144] ([Intel XE#2312]) +3 other tests skip
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][145] ([Intel XE#2313]) -> [SKIP][146] ([Intel XE#2312]) +3 other tests skip
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
> >     - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [SKIP][148] ([Intel XE#2313]) +4 other tests skip
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> >     - shard-dg2-set2:     [SKIP][149] ([Intel XE#4208]) -> [SKIP][150] ([Intel XE#653])
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> > 
> >   * igt@xe_exec_system_allocator@once-malloc-race:
> >     - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#4915]) +3 other tests skip
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_exec_system_allocator@once-malloc-race.html
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_exec_system_allocator@once-malloc-race.html
> > 
> >   * igt@xe_peer2peer@read:
> >     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1061]) -> [FAIL][154] ([Intel XE#1173])
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_peer2peer@read.html
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read.html
> > 
> >   * igt@xe_pm_residency@cpg-basic:
> >     - shard-dg2-set2:     [SKIP][155] ([Intel XE#4208]) -> [TIMEOUT][156] ([Intel XE#5328])
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html
> > 
> >   
> >   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> >   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> >   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> >   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> >   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
> >   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> >   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
> >   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> >   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> >   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
> >   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> >   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> >   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
> >   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> >   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> >   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
> >   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> >   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> >   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> >   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
> >   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
> >   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> >   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
> >   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
> >   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> >   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
> >   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#5255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255
> >   [Intel XE#5328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5328
> >   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
> >   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> >   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> >   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8 -> xe-pw-150192v4
> > 
> >   IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8: e6e27e79a726f8bf333d13521aba32f6466035a8
> >   xe-pw-150192v4: 150192v4
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/index.html
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
