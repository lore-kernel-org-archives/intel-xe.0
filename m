Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B05C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7310E0BD;
	Thu, 27 Aug 2026 16:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTXEftnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE6F10E0BD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849060; x=1819385060;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/9oQRvgQemiDQTcRPJ3zMkfiPUqSIJE5ewVuLK8nMUw=;
 b=cTXEftnPaUn5lBwdKF3egkoG9zAI8EWC5QSoR+/sRP0X5hb/hL2rXFe1
 zlzhX0P5zB5PQFD5U9kvagR00urnXL9AvolauMr1tRpl648UsRWNqdljg
 3jbyyiw01QDxLh3gySDiFhsI5jQ/iek0uE4KPiTZ5HI+fH/rEJ+3w6cVa
 giATRX5uI2Tfy0ruSr9jeNNCwyNDWeq47OvpUs5blVWryNHctc1QL+jUQ
 aC+UFRgMjV9RhVZ5+FU1sU4GxuRkXWbxpNdDX/lJr0EJ8CzKCfFnW1+Iz
 7mNx4Z2vJAvJkbmFtndAN8E33AkyCwhp/kZ4Zsc6rTfEDhp2JS89ErZ8b g==;
X-CSE-ConnectionGUID: uTbN78kJQUmmfZJabcQHbQ==
X-CSE-MsgGUID: F0lVz6uoSC+JdkZU5ChxmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="98690865"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98690865"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:19 -0700
X-CSE-ConnectionGUID: mN/rATR3RcOBjKgU75Mr6w==
X-CSE-MsgGUID: tVXg7hAfR8SLz/hT7Gi1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264164319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:44:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 09:44:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPxh37H4Hi2jylRYQCRlYP87A/pte+W0HSu8SGnJkzI2CvbiIaYEMMLBHcrLSUeHUbQ/wXs1YPr+so9Viw9BtYRDqFrS/16RFiN2jsQrHuqjyCwUpcdkZ/ga7fK1pWe8WyTgyL94YFD86SA0Ab3oHAmMWQe7taMP1KsZ40HGUHMpht7hgFfPaIdAi5zntbPamAzRxQ0kdyAShQAPPsHWPkBdYv1aB/AyiztSlLtV4tHp4EXGw9A8S03CgafqdOo9iJH5UquiOcijipkOMF6y9/dfiEp4N0M/Xucm7IAxiC3ISzdsJdwEMjCmG4kLc961Zae/csRp7A+YV/WWElgvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SogZmvLb902UZLGqhNEnt20mR5awpPZwqXPTMzSzOYk=;
 b=rmOCMjnV79amiwLz5jnJg5WbCqyP/D7Cuqn7I0CBJcVL2k3uml7VCJng8of6zExUc+lEOLYA/sVknCgkYCdGpsAplK20lulDTzhPHPTVaXsFoTwRg6Usener3JbYmGIp6ZPcPypx8/llBGfKAggiSov/i4b5jnD2PjORv5OqNWbR4LpV0OmZadXsH173V7VDYDkK9FWHjpfaJE9jeecVTVUajM8EJ1uQAZ5E4DCE1R62k5BuTWYvWyVQ+2kMQfQwDQup+rcFGErcsXE5SsL3D4WvmNyrkb5QjvD+7+/91e4CAxogOfN4ioj03Rrc4TBOD12u7DNZYjbP3ABvwh7BiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7985.namprd11.prod.outlook.com (2603:10b6:510:240::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 16:44:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:44:11 +0000
Date: Thu, 27 Aug 2026 09:44:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
Message-ID: <apBpWBAyiAPMAkMm@gsse-cloud1.jf.intel.com>
References: <20260825224819.2182540-1-shuicheng.lin@intel.com>
 <ebc4797204a5aec94f122094e2fbe2fb1d0536c1.camel@linux.intel.com>
 <DM4PR11MB545658D01D36A23A72096175EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
 <ao/Psuvcjjxkt8iH@gsse-cloud1.jf.intel.com>
 <DM4PR11MB54565CC96CAE42FB1C25434EEAAD2@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB54565CC96CAE42FB1C25434EEAAD2@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a8164f-ae7d-45dd-5b56-08df045a6b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xm649HtLYPtsnon+asVAdmBGdmp1rcp+Yw9quO+kspY3wT12Y+/V6jIhLVPyDux1RII9b8NOGEUK81U+heVRqyeOCHXAWr3SgMIyatFdMB5s+8pXJByXsdpIOvixsZt0+FgPdhDra+UkcQqKkSm8FmtKEUKOyWr9UffnyZFrR5OCp+nqvOlzeSHobAlBFqyFNvUNzRsi8VDZ8PcXqmp7PEeli4TCW9UOLZK/pWKj39Cv+N5XLgnOqwgl9RdKtx/ui35Sa8Q0xQwjB9xOgkBrCIZfF1CVz8fUiO0nzXFfJBbfxfW08tPc5kd3pYIwXwk6Uv5e7AhNdf/C38nUPemaWj1OWcolX2FuSY3pO0HtZ2o+8fAPkRM77/by9JvZrVHffUpsKqdTmMh5W/A9N0A43krGgNJ8n4wzdeRY/gT0RLuqEwRt1IAUbUescQPfFtrrVy/eRy2azatYTWzFM5lr+Dss4RiqPso3b4vRyGD2a5ihSPkBh40RfD8WIL4nz7Izvl0uuguerOYAr5aujrckoffPXOqQSyISM4eLsH/cCEea07ps7H0PuVTLcL8CkQzck7TwaEWkqfrm8SRQsOb/0Q5TjjdjsszuM7Wlsik3vV3J+6b1v1eCFa7uYo6hdduVHSGG/5B2mz2YuuBAlHuEt/fltQEmx72FhLDdPrpUh5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qdPpb/p+78S3Ej/uc09E2jmDftoxyhNuWg86TbIjkeZCiXc2gYEzcdAQaT?=
 =?iso-8859-1?Q?QoC8gVZ0UvdDVRFM4HbENyOyrbwPnrEsy6a7501XDY9LPV/wPB8ZKyg+OP?=
 =?iso-8859-1?Q?j6hSXLxZE4TiP9wI9DJNfAa2iYXeyeWbnGm+yrDOuxBUFuh8zOeWOVnOQw?=
 =?iso-8859-1?Q?yd95dICqN2nAQj+pACcNvEq2SVfouyZIMZY5ggz1LkMWNq6YP0sdjdicN8?=
 =?iso-8859-1?Q?reXdzb9Gp9fLdre/+kcxe9pSgBvfNhrRkeKdIRSaYfGonkbPnA5TmYXK0d?=
 =?iso-8859-1?Q?nxNTk25kMqYwiDpQ+RNzulB984QnLyjt6sxRi+l6extaFFNRfDEnH9176a?=
 =?iso-8859-1?Q?6lRAOvugYmDfsjF7e+wyp2xwdadv57pMhfsIe0CVWF66KMcx1pBFpPrinl?=
 =?iso-8859-1?Q?Gk15nbKRwK4vcHm2NLZfEJ+IPZq8ENAIoy2q4VRNdE8EFSkuAh97L60Xxf?=
 =?iso-8859-1?Q?ZOQZm3ZPn33wZisYQbArthM/23TIhfZYupzf6FzzBfonDEQWIWxrJHPExF?=
 =?iso-8859-1?Q?UmoIK36ncOkPvo1BhTsZ5qddMRrue4HgoDtUelDewcrohMUpXUfvJMSgsm?=
 =?iso-8859-1?Q?RfyMhQ25aDVQoyCqM3IeAoJefuXuJeor0WOM5QbEXdu+3zQGOVvXxqyUDD?=
 =?iso-8859-1?Q?1oid2AK1QfZvRreCCdY0jEL1TxOkkbSu3E2/J8a1A6vPNaz4Lsn0VyxKaF?=
 =?iso-8859-1?Q?Mh3sB97L7POm4TQFH2muVvGHjimbRTrvXA+LUSpGuXVV53L9KaeUSZpCDV?=
 =?iso-8859-1?Q?QSsYCfwLOc3eZ5Nx5eJzTYNaXMSCM6HW6P2BR59EzwuQMPr+C4NylWqCov?=
 =?iso-8859-1?Q?i5YuK02oN9iCLpcgW/hQ5Nyx3NmmvF7YsYP3GLlwgJPM+gujesSyV1pD8N?=
 =?iso-8859-1?Q?xdveNBnDL1//dwphNAawtELgGcHmrXqgkxL3v2yFK/EaqJjDez2i3kF8eN?=
 =?iso-8859-1?Q?IN7ohm2B5x8ieZfjYdH2dd0T3VHSp60YDBf/zQcSak1/CAYoXd3CAycyWL?=
 =?iso-8859-1?Q?owRB2WSciEmfInBfG1MRqiXBXn7fYfSSF6/4S3rVhrzNOA1pKBCjGQJRf2?=
 =?iso-8859-1?Q?pe7vq+n+wTqeZwOY6ZCo4Ve5JyMZyFoPjBbH+3loBYaK90jUL4qbyTsUuH?=
 =?iso-8859-1?Q?GJ7hy+ryd7yWZK/WDushkBdjo5AYtjxCPxpZB0tLQpIWgkEnR0aFgEwojh?=
 =?iso-8859-1?Q?BsThNLCqGpy7V+cSBuk8QiTXu+gv5h8gDS9mY5PBWs9YWmaGaHbE2px8LG?=
 =?iso-8859-1?Q?jIGnbb0Ta+DxC3zOR2mL7z2IkqSDEHSxLn0JGY6/GNLJXa23RBW96TbAuq?=
 =?iso-8859-1?Q?jPDuONzNQfFU1LEDOL0UNll54cSUlgob/X3aypwr8+Uncg0AAzoQkDXi+n?=
 =?iso-8859-1?Q?adZFSyDnKf7+ZnSvdYoHStOg6+3sR67gDecgpNrNzK9IH7aHhZ9kKQP4x7?=
 =?iso-8859-1?Q?Og7D0tjFv8iYk1mA24BhdYPg3aJOBQvs0C5kZVxit30Y5rqTF7ULrJBzjl?=
 =?iso-8859-1?Q?NqTCLuEGdvV3JsfmrAkPOAzw1AQb7AKo1+4Wiv8nt+yT6CrsQ0/UDOjOrP?=
 =?iso-8859-1?Q?LTrrwPlSORNu8O3SOeNBFL9quXu5VkVtF4FB7mCq4cXFgPrjgSLcIiXF9d?=
 =?iso-8859-1?Q?tXV/cqIOz6VN0GUQcZp8/whjwjA61XG1D4du6OjkSRMmH5r29rykLH+x4H?=
 =?iso-8859-1?Q?zjPbv+yLae6uV7ClSgM2HC8EYmYhPb4moUzYPCaw7ukIfvPX2ic643ShiS?=
 =?iso-8859-1?Q?Z/ixNVjpQ594qxCv/Omg+s15G/C7FF+EQkRt1xYqfQYwf/cZ376e4zH/b1?=
 =?iso-8859-1?Q?17Gp1GCo2PibRX3vRh0eDohJil/9jZ0=3D?=
X-Exchange-RoutingPolicyChecked: iLmvC2/kR0SZYfhTuOf+5JevapAC7WVp+zzsgbdu17gaIUI/mxc9YH3qn0jC74K9/KlCZof3EOk5x/lOhjrB/f7qRbpsDIhiBknM8NIzmSTIPyZ82t9EuldTqLoyXUuHp6mEfTsd4Ja2EhLX5RJwVIVXSZ5wMnIEQe3qh9h5hMMgG5WRRxt3Dcz9hSnolVgEjpbI8d2hS5007gY7Gi1kCJDNvtEpdYIYAg5/vEZtDiEio+pec8tNjhHG8ohgL3ce3cmRxavDM0x825r3Gw+idSPMF2ij2jI39JB+S4loaHRbnfVCEEGTv/NSi1/6wJVlxYVK3vtYEwQBtdhJUeEknQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a8164f-ae7d-45dd-5b56-08df045a6b80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:44:11.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjvWLfJlIZwj2Q9Y9vIQSx3XIpLa1XLeFS3G5dLY9FtXFqNxX3MVGR77wxN1d3HAXaCcg5vAgYL2DAcTTpjfKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7985
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

On Thu, Aug 27, 2026 at 10:20:10AM -0600, Lin, Shuicheng wrote:
> On Wed, Aug 26, 2026 10:49 PM Matthew Brost wrote:
> > On Wed, Aug 26, 2026 at 10:10:38PM +0000, Lin, Shuicheng wrote:
> > > On Wed, Aug 26, 2026 1:01 AM Thomas Hellström wrote:
> > > > On Tue, 2026-08-25 at 22:48 +0000, Shuicheng Lin wrote:
> > > > > xe_bo_shrink() only took a runtime PM reference for the System CCS
> > > > > backup case, and only after the purgeable branch had already returned.
> > > > > That branch calls xe_bo_move_notify(), which reaches
> > > > > xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and submits a TLB
> > > > > invalidation over GuC CT.  The non-purgeable branch reaches the
> > > > > same code through ttm_bo_shrink(.allow_move = true) -> xe_bo_move().
> > > > >
> > > > > When the device is runtime suspended the CT is disabled and the
> > > > > send returns -ENODEV, tripping the XE_WARN_ON() in
> > xe_bo_trigger_rebind():
> > > > >
> > > > >   WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> > > > > xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
> > > > >    xe_bo_shrink+0x20f/0x2b0 [xe]
> > > > >    __xe_shrinker_walk+0x174/0x410 [xe]
> > > > >    xe_shrinker_walk+0x56/0xf0 [xe]
> > > > >    xe_shrinker_scan+0x10c/0x1e0 [xe]
> > > > >    do_shrink_slab+0x176/0x7e0
> > > > >    shrink_slab+0x137/0x990
> > > > >    drop_slab+0x7f/0x130
> > > > >    drop_caches_sysctl_handler+0x9c/0xf0
> > > > >
> > > > > The invalidation is always issued for a fault-mode vm; since
> > > > > commit 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo
> > > > > cachelines
> > > > > manually")
> > > > > it is also issued for a non-fault-mode vm on hardware with an
> > > > > optimized
> > > > > L2 flush, which is how this surfaced.
> > > > >
> > > > > Add bo_needs_invalidate(), mirroring that condition, and use it in
> > > > > xe_bo_shrink() to compute needs_rpm ahead of both branches.  The
> > > > > reference is then held across xe_bo_move_notify() in either path,
> > > > > and is not taken for a bo whose mappings would not have been invalidated.
> > > > >
> > > > > Shrinking can run in reclaim contexts where the device may not be
> > > > > resumed, so a bo is skipped when the reference cannot be acquired.
> > > > > Have
> > > > > that skip queue the shrinker PM worker:
> > > > > xe_shrinker_runtime_pm_get() is gated on the needs of its own
> > > > > backup pass rather than on this one, and on DGFX it returns before
> > > > > queueing anything, so without this a scan where every candidate is
> > > > > skipped makes no progress, reports nothing scanned and returns
> > SHRINK_STOP with nothing arranging a wake.
> > > > >
> > > > > Also gate the System CCS term on !xe_tt->purgeable, since
> > > > > xe_bo_shrink_purge() frees the pages without a GPU copy.
> > > > >
> > > > > Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU
> > > > > is runtime suspended.
> > > > >
> > > > > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > > > > Assisted-by: Claude:claude-opus-5
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > >
> > > > Nice catch.
> > > >
> > > > I wonder, however, can we skip the TLB flush if runtime PM is not
> > > > available at TLB flush time (runtime_pm_get_if_active()?) Assuming
> > > > that if runtime PM is not available, no contexts can be active and
> > > > they will flush TLB implicitly when becoming active?
> > >
> > > Do you mean call runtime_pm_get_if_active() in
> > > xe_tlb_inval_range_tilemask_submit(),
> > > or lower down in xe_tlb_inval_fence_init()?
> > > I'd prefer that too, as it would simplify the code. Two things stop me doing it
> > here.
> > >
> > > First, the PTE zap also needs the device, and it runs before the flush.
> > > xe_pt_zap_ptes_entry() does xe_map_memset(), which asserts via
> > > xe_device_assert_mem_access():
> > >
> > 
> > I agree with this - the zap is not optional for fault mode, it probably isn't for
> > 'xe_device_is_l2_flush_optimized'.
> > 
> > >   Assertion `!xe_pm_runtime_suspended(xe)` failed!
> > >    xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
> > >    xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]
> > >    xe_bo_move_notify+0x1b3/0x450 [xe]
> > >    xe_bo_shrink+0x20f/0x2b0 [xe]
> > >
> > > The zap isn't optional - the pages are being freed, so the PTEs have
> > > to be cleared either way - and xe_pt_create() uses
> > > XE_BO_FLAG_VRAM_IF_DGFX(), so on discrete it is a BAR write that needs
> > > D0. Skipping the flush alone leaves that behind.
> > >
> > > Second, I can't find the implicit flush in the code.
> > > xe_pm_runtime_resume() only calls xe_gt_resume() (do_gt_restart())
> > > when d3cold.allowed; otherwise xe_gt_runtime_resume() just takes
> > > forcewake and does xe_uc_runtime_resume() - no reset, no invalidation.
> > > That doesn't mean the TLBs survive, it may well be a property of the
> > > power state, but I can't confirm the assumption by reading the driver.
> > > Do you know if that is guaranteed? Thanks.
> > >
> > > >
> > > > IIRC It's not totally clear whether this would work for "has_ctx_tlb_inval"
> > > > hardware, and if so we might need to add something similar to this
> > > > for that hardware.
> > >
> > > My understanding is that it falls out for free if the check sits above
> > xe_tlb_inval_issue().
> > > Is it right? Thanks.
> > >
> > > Shuicheng
> > >
> > > >
> > > > Thanks,
> > > > Thomas
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_bo.c       | 62
> > > > > +++++++++++++++++++++++++++---
> > > > > --
> > > > >  drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
> > > > >  drivers/gpu/drm/xe/xe_shrinker.h |  2 ++
> > > > >  3 files changed, 72 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c index 2eb5d6aac523..274ff97d8542
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -734,6 +734,32 @@ static int xe_ttm_io_mem_reserve(struct
> > > > > ttm_device *bdev,
> > > > >  	}
> > > > >  }
> > > > >
> > > > > +/*
> > > > > + * Whether xe_bo_move_notify() will invalidate the GPU mappings
> > > > > +of
> > > > > @bo, and
> > > > > + * therefore needs the device resumed to reach the GuC.
> > > > > + *
> > > > > + * This mirrors the condition under which xe_bo_trigger_rebind()
> > > > > below calls
> > > > > + * xe_vm_invalidate_vma(): always for a fault-mode vm, and for
> > > > > + any
> > > > > bound vm on
> > > > > + * hardware where the L2 flush is optimized. Keep the two in sync.
> > > > > + *
> > > > > + * Context: Caller must hold the BO's dma-resv lock.
> > > > > + */
> > > > > +static bool bo_needs_invalidate(struct xe_bo *bo) {
> > > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > > +
> > > > > +	if (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
> > > > > +		return xe_bo_is_vm_bound(bo);
> > > > > +
> > > > > +	xe_bo_assert_held(bo);
> > > > > +
> > > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
> > > > > +		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo->vm)))
> > > > > +			return true;
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > > +
> > > > >  static int xe_bo_trigger_rebind(struct xe_device *xe, struct
> > > > > xe_bo *bo,
> > > > >  				const struct ttm_operation_ctx *ctx)
> > > > >  {
> > > > > @@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > > > > *ctx, struct ttm_buffer_object *bo,
> > > > >  	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > > > >  		return xe_bo_shrink_purge(ctx, bo, scanned);
> > > > >
> > > > > +	/*
> > > > > +	 * Moving this bo out of a non-system placement makes
> > > > > +	 * xe_bo_move_notify() invalidate its GPU mappings over GuC
> > > > > CT, and
> > > > > +	 * System CCS needs a gpu copy when moving PL_TT ->
> > > > > PL_SYSTEM. Both
> > > > > +	 * need the device resumed.
> > > > > +	 */
> > > > > +	needs_rpm = bo->resource->mem_type != XE_PL_SYSTEM &&
> > > > > +		(bo_needs_invalidate(xe_bo) ||
> > > > > +		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
> > > > > +		  xe_bo_needs_ccs_pages(xe_bo)));
> > 
> > This is a complex enough conditional that my current feeling is to just
> > unconditionally set:
> > 
> > needs_rpm = true;
> 
> How about keep the XE_PL_SYSTEM check?
> 

I think checking system is reasonable, and better than my suggestion, as
this implies we don't have GPU pages (no invalidation) and no need for a
CCS copy, and is keep check which is easy to understand.

> 	/* Both the invalidation and the System CCS copy need the device. */
> 	needs_rpm = bo->resource->mem_type != XE_PL_SYSTEM;
> 
> @Thomas Hellström you wrote the original code, what do you think?
> 

Yes, let's see what Thomas says.

Matt

> > 
> > In practice, on iGPUs where the display is in use, we always hold a runtime PM
> > reference. It would be very unusual for the display to be suspended while the
> > shrinker is running, at least as far as I can tell.
> > Let's drop this hard-to-understand, likely overengineered conditional.
> 
> I could only reproduce the issue with display disabled. And the CI machine that hits it has no monitor connected.
> 
> Shuicheng
> 
> > 
> > Thoughts?
> > 
> > Matt
> > 
> > > > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe)) {
> > > > > +		/*
> > > > > +		 * Resuming is not allowed from all reclaim
> > > > > contexts, so leave
> > > > > +		 * this bo alone and ask for the device to be woken
> > > > > up outside
> > > > > +		 * of reclaim. xe_shrinker_runtime_pm_get() is gated
> > > > > on the
> > > > > +		 * needs of its own backup pass rather than on ours,
> > > > > and on
> > > > > +		 * DGFX it returns before queueing anything, so ask
> > > > > here.
> > > > > +		 */
> > > > > +		xe_shrinker_queue_pm(xe->mem.shrinker);
> > > > > +		goto out_unref;
> > > > > +	}
> > > > > +
> > > > >  	if (xe_tt->purgeable) {
> > > > >  		if (bo->resource->mem_type != XE_PL_SYSTEM)
> > > > >  			lret = xe_bo_move_notify(xe_bo, ctx); @@ -1369,28
> > > > +1417,24 @@ long
> > > > > xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> > > > > ttm_buffer_object *bo,
> > > > >  		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> > > > >  			xe_bo_set_purgeable_state(xe_bo,
> > > > >
> > > > > XE_MADV_PURGEABLE_PURGED);
> > > > > -		goto out_unref;
> > > > > +		goto out_put_rpm;
> > > > >  	}
> > > > >
> > > > > -	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM
> > > > > */
> > > > > -	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type !=
> > > > > XE_PL_SYSTEM &&
> > > > > -		     xe_bo_needs_ccs_pages(xe_bo));
> > > > > -	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > > > -		goto out_unref;
> > > > > -
> > > > >  	*scanned += tt->num_pages;
> > > > >  	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> > > > >  			     {.purge = false,
> > > > >  			      .writeback = flags.writeback,
> > > > >  			      .allow_move = true});
> > > > > -	if (needs_rpm)
> > > > > -		xe_pm_runtime_put(xe);
> > > > >
> > > > >  	if (lret > 0) {
> > > > >  		xe_ttm_tt_account_subtract(xe, tt);
> > > > >  		update_global_total_pages(bo->bdev, -(long)tt-
> > > > > >num_pages);
> > > > >  	}
> > > > >
> > > > > +out_put_rpm:
> > > > > +	if (needs_rpm)
> > > > > +		xe_pm_runtime_put(xe);
> > > > > +
> > > > >  out_unref:
> > > > >  	xe_bo_put(xe_bo);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > index 83374cd57660..fb6ec77972a5 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > @@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker
> > > > > *shrinker, long shrinkable, long purgea
> > > > >  	write_unlock(&shrinker->lock);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * xe_shrinker_queue_pm() - Ask for the device to be woken up for
> > > > > shrinking
> > > > > + * @shrinker: Pointer to the struct xe_shrinker.
> > > > > + *
> > > > > + * Queue a worker that takes and drops a runtime PM reference.
> > > > > Shrinking can
> > > > > + * be called from reclaim context, where resuming the device is
> > > > > + not
> > > > > always
> > > > > + * allowed, so a caller that needs the device resumed but could
> > > > > + not
> > > > > acquire a
> > > > > + * reference uses this to have it woken up outside of reclaim.
> > > > > + The
> > > > > current
> > > > > + * scan makes no progress on the affected buffer objects, but a
> > > > > subsequent one
> > > > > + * can.
> > > > > + */
> > > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker) {
> > > > > +	queue_work(shrinker->xe->unordered_wq, &shrinker-
> > > > > >pm_worker);
> > > > > +}
> > > > > +
> > > > >  static s64 __xe_shrinker_walk(struct xe_device *xe,
> > > > >  			      struct ttm_operation_ctx *ctx,
> > > > >  			      const struct xe_bo_shrink_flags flags, @@ -185,7
> > > > +201,7 @@
> > > > > static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > > > > *shrinker, bool force,
> > > > >  			xe_pm_runtime_get(xe);
> > > > >  			return true;
> > > > >  		}
> > > > > -		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> > > > > +		xe_shrinker_queue_pm(shrinker);
> > > > >  		return false;
> > > > >  	}
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > index 5132ae5192e1..86d2a322cadd 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > @@ -11,6 +11,8 @@ struct xe_device;
> > > > >
> > > > >  void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > > > > shrinkable, long purgeable);
> > > > >
> > > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
> > > > > +
> > > > >  int xe_shrinker_create(struct xe_device *xe);
> > > > >
> > > > >  #endif
