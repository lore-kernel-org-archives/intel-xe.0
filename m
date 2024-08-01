Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D78C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 21:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9A710E0D2;
	Thu,  1 Aug 2024 21:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6/run0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1D510E0D2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722546230; x=1754082230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i6vN57jtH3540o9xXvA1Zl6W7YzsC80mT4bnftgFDGE=;
 b=n6/run0YiMWsKK42bIvjFZtqcwK9lFvHVqzR0otUbt9QsUFDTiV+KEv1
 kJSteDlDzD2g3v+WN2QoARwCo1vKNV0msepT1KY2hgYQO1L7tHKQwywzn
 ymcaixbrlZPwSarIGeSbJVFNzyw0p8Did7kJXlQlU5bTZfmLE7l/mlfFR
 rzk0gawFjWncNFGx2iEBKkAzg42AVVRYYn8M/rCb/R8Pp8vyUT4Il5h+I
 ZYwPZG5TprbTGPAOFQrcRq8gcifOp1zeAuNeSvTtMZRYHPmXyV7uM+r9l
 Tue132wgZVKozlaWUUfpZQEIH7mcEQdSoQGHN/7rEQPx/A6zpmwGGPRS7 w==;
X-CSE-ConnectionGUID: FdjGp6tJQt6EcJ5JxkG+bg==
X-CSE-MsgGUID: yVto/5ZPSiaFUkh/1yZnvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24328223"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24328223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:03:49 -0700
X-CSE-ConnectionGUID: GHFN6Xp3TtS42c/oZ1PeIg==
X-CSE-MsgGUID: 5m2CpllZSyWRnldd0Uuhyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="78443819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 14:03:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 14:03:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 14:03:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 14:03:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 14:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNNB9QI/7eO7GV4iieQrVh3TpLQnuSFb7b6e0AyjossAWJHs3+GJGeRI5Zq4TPD8d1yWMXt7u/WbM2eixwCS16nXCJWzbH6Jv7+DSh9AnJ3OiSf42IsEy+1/KLeIvM+OdEWQkE44vJMHGio1P3BmU35fKfovsliAS1arIc1U5Nb9Pk6DI7gDsMwujYv80rlJBhQK0raI8Ry2bs84/ufMSAYSDnCLaReAFLvbD7Pjj7wUfQXZ3rbZK5Rj9OnrRQjnMo+xMyD6IPkTe9MkQHb0OagBksFRDUAREPxZI3Dm4qIYI6BVyhRrWEsbdigGiik8nTTtadyzGlhoUJreVOqQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC9/DKnRxsqvBobgagWulqSJIaGBZyYf6Wb+6H/KWQw=;
 b=Wf2G1XXxzlT7PmnVXGaIpJaht8v4YOhm57Dtulz9qgwl+GklWFZCZnKMqSCZZZfnZTowRR18dmhvj7Dj5ItGwfo4vclT28JJKdSir9X4JNdJoT4RS2ZaYk6iSZqnoPb1jbkj004a5/97KLpxu05h3wh3TKOAbFQfoRs7bGCIS5zuEFWesKY1KiKGZvmJiGq01xoVHA2C4xHrO7jtxgSigsSM/h+0pvx4em32+82RNjQTHxUgxEHGZ6QpQ6sTHgp9yKSfYCrseYfOGOJemW55DK5euq6u0ibd7e5TWlPdwpKcJa2TwLIYpwkxkedMF7J0UaNX83DhE609/7xpVOPJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Thu, 1 Aug
 2024 21:03:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 21:03:08 +0000
Date: Thu, 1 Aug 2024 21:02:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <Zqv31ekKxKHVFZu1@DUT025-TGLU.fm.intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-3-riana.tauro@intel.com>
 <ZqvzU2rYPy4Citg+@DUT025-TGLU.fm.intel.com>
 <3659cc23-7860-42d0-9c63-5a86edc6da25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3659cc23-7860-42d0-9c63-5a86edc6da25@intel.com>
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2764eb5e-f4e9-4074-6766-08dcb26d582b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cONkK5IOpIBEwavXxs7uU03sACky/8uiqXd1GWSsMds4yTrX/GL91cYi5ara?=
 =?us-ascii?Q?UilAinqjNu0Qjy9zFDCkf9HdMRxyjY6P97pvCri/lrslRa7U6dtmfguPStjA?=
 =?us-ascii?Q?2Jcx1VApLYS0vYKi/aVEzpt/tgDvxi/9mryUbw6xwQcnwgxRKGp8B7u3YFXu?=
 =?us-ascii?Q?vwuLh6WJDmk9sbLTcwHHxdM665UqH2UMYKKLlyzIZvA5zZQZTYQfljscx+yh?=
 =?us-ascii?Q?NJZU+i1BC9nhH0t/Jf7uknhQewZgip5Wl9Z2bn8vHvy2aJdpEHspsOghO0CO?=
 =?us-ascii?Q?cNOIa4kqX7GnGcLGzgXvruACqT8d7ZPbBdof9T82iR8BA/Gz+Yt1nMwro9Wj?=
 =?us-ascii?Q?jGCeeLDJZCR0M97r5R3G1lH74ym4BkCXLcCwU+dMESg2ro+MOcXo/qTpfCxG?=
 =?us-ascii?Q?bP1T7EaB8Rx6keRpNRA2PPq/dCcftGAUqt780d1cU/tq4uiHSBBEaLIurVwC?=
 =?us-ascii?Q?m00L9w8cNXqYjgG8P3dLzUzqVCkdVr4uF/tnBYgGwk+zMxWIY+TRr4vpNLiP?=
 =?us-ascii?Q?DSjxSbvAGrK/egHC49NEarLxWEZlBxKcC6L59byx+my+rvunTD9CHnvyxrAw?=
 =?us-ascii?Q?x5Jl1+TfF4XsVuefiD7ZhaF0zwzqG1gy5fvV5PqA+zRcsxVBS4SJNljreG2n?=
 =?us-ascii?Q?DX7oxyl7orV7/a0bZFzNaOY0/1UDKTo9JUyA1neKhHPdhBR66/oiPrVj4emI?=
 =?us-ascii?Q?mD6RCxp2vMhrwEc3j0sqKgZmHdtRZUjRsvf096GuHN70krW5BIGNsTtX78rU?=
 =?us-ascii?Q?KvEitAdDCvzURdMJwrJJR4cTBmDUN+vImaIkPVLdudk4jhjSaixchQd9XNo6?=
 =?us-ascii?Q?mhAn4BrURwJ6VdkmhIAWjfFJWkZqDCIYnrllwYfFs6G0Xt+EIEeSN3wQAa6i?=
 =?us-ascii?Q?TkCflx5axxaoZ/uw+hgK1h0Lzy/0tLIz3JRk+E2O6lwy3Shd09id1RBnbpL7?=
 =?us-ascii?Q?OS37mdtiqTkxr377ZAROKUNWy/q0ZLOukrB6ze3izXUI7q2TTse3Dt2UzI1a?=
 =?us-ascii?Q?g8cA7VLMGkOR2N7dic/wf6YDxEKSQkqPqRksTn+fPDSolLFsZ10UkSn7xnS7?=
 =?us-ascii?Q?5IghLS+dyr9LRlc1l4wEpWurt52+mjFz8pHuTbXP/mVjpO327ZkwYgDp7OhR?=
 =?us-ascii?Q?JatRsvAVOcY2TysPubR2AQV1eZlgWX/GiGYBTjI3lIBzqZBloaptpVjCkviw?=
 =?us-ascii?Q?Mkl20CypAOe3d/96PQ8VHaDLzGXOprfpQuMAPKiuKOdplTucbO3l0wg7XP/d?=
 =?us-ascii?Q?frSNv5eTQ2JwOvFk9VWqBG+zw7Is8o4cd8uIT2XAHupu9KttBfv6zDmFarII?=
 =?us-ascii?Q?Two=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OjKdlrXeE9mimdtd6oPe0ZXaeTaEXswIcMFSLEMcaK2go1Ol7FnMmqntG1R6?=
 =?us-ascii?Q?r3HmXiRCf3aU5V/X8TCSTo4laSzA9YKwv3zFiPdRFx7/ZYnLuqvbT9H79SNX?=
 =?us-ascii?Q?xx9ygfCE+y3RJWuTu5zT/11/c+Zu8zYmDH2IJOKgjQ2UpdjpOjmEQ23TV8tH?=
 =?us-ascii?Q?vNnplHIFOVSA1wW1qsxBtTGgW0OM4+KlrAwzvWpkvAGi5+cuEIS5cDCslc1r?=
 =?us-ascii?Q?IM/a1uA+JCjPLY885prbYaYJqPzsLqr1v/HITGDY4IBgJbulIZe0syDNag1p?=
 =?us-ascii?Q?NAunnCG91BFXhFOXrpQDimhu0XnJEsC9JVyBGj0+2nDoLGV9lk4nwJNcpfNd?=
 =?us-ascii?Q?fNmknhWQmqtui539dC8bVT5XgO5lwEWWZ8xfo4xdk6Xi0ZNpu9+nFXG0ILP6?=
 =?us-ascii?Q?gY5O+QoatGm7GI0lloblvSp8TFm3Oe5EHhAnpn7YepO5XplwSov9a5QE/g1q?=
 =?us-ascii?Q?o8WhPmxItj0l0agUYkbNIpXIAcEcxdEBradVJyiNv/Y/Kl7eMqvHSAD2R/t8?=
 =?us-ascii?Q?A7fXBsk8oEZ6cKBVEXtqQ27DTX0BX7ThRvBUlWQP3Uqx+aHsfcTn4GeqZzLN?=
 =?us-ascii?Q?X6cxor27jvnk508frvlkLjCAVFkwxqDnpgbeUC1JZlXt9cXSoyD18Na4NnFd?=
 =?us-ascii?Q?T1CgDKnzlb8gSAjcK+6gtgz3vuTJsfJkUFrvo+AdWDLfIzpUFZ7BnxfVcppC?=
 =?us-ascii?Q?9NqRFwOd+1Qp++eSMbb2Q6I5ZlRNASzKBbtBDeIuJia5lzzoYXD68mGtaMBh?=
 =?us-ascii?Q?dEhZkgAv0SmQ7ore0aO+gXGI6ITdtV0rAW7JH9OaUVR09ejM9kBAgAXY2dN4?=
 =?us-ascii?Q?W7xXlnl+zqLV/45+P01luhmzmKJ+thCA9o6TDgf1AkpSaiZ6b7T79gDeGyYc?=
 =?us-ascii?Q?eDq3+MQvY63C+ApDKO7O+i4gqLFPXkubKl1jR1BVkKsmrWzA4/K4tDFgmddx?=
 =?us-ascii?Q?KYx3ndiaya6m5KllN390nXWnHlObyZ/cNw3jocTdaiqKQWSRLOs2iHCnm+SC?=
 =?us-ascii?Q?AOUu15mxcixBsvDAKmmFWflQ5MC0uHNQjqheOi4TT7HIE75diXZdXeYPb1+Y?=
 =?us-ascii?Q?lAR8Gb7cpjutRzbZFqWsQE9bcvzVnNfWN0bwp6bANb366dSVDEwbIET/IQBi?=
 =?us-ascii?Q?2EboG8orlPFIbrPRWRP7Uy//g4gGkeuftqExbeYP8rOsLpUIcKSgVU+ZpCZv?=
 =?us-ascii?Q?D35FedEspspCOR1JBGhdeb97SjuUJc64Y66mY0AJ0VlVtFoup/Yx335eBatV?=
 =?us-ascii?Q?5gR16AoUN2Jcw3NC0dY/k8OmE1YNn3G0VHyfbX7kielB4WFAdS7KKD9ZUTyY?=
 =?us-ascii?Q?0Em24cfr2gFyYwaPv3AX1Kv1HF8h61sgFZ4oKsoARj31KUGyuBbQivomrsaG?=
 =?us-ascii?Q?Qa/loBdTUsBN9Xt1urQAhjFcxJNjiFIC5K62G5kHXNyO76s5CPR7cuf79Gj7?=
 =?us-ascii?Q?HI8/AVXhq32QoN+NQ2q3RajT9v7YzbWqTkmbQ4o1kNRYa40jzpoFWpYWxo9q?=
 =?us-ascii?Q?FprIm1xFO7OXONRwQ/i2b5uew/CEFhVpcd46x6Nz2sHrhrt7MVGjPXfLdxXM?=
 =?us-ascii?Q?9eQSETNdMmqM3OamLs9S6rF2Qsr0caYElt8aF7CFbfsD06Z+Xt1vh76Vhqg7?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2764eb5e-f4e9-4074-6766-08dcb26d582b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 21:03:08.1194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3cVbsyoC+bIIawBwbas+jpud1f2APzO9xqS5mDQjzjJOMjQMyn3PQ7l6WFKco4Vb330hJLnfnE4t7wJ6iEjZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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

On Thu, Aug 01, 2024 at 10:55:07PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 01.08.2024 22:42, Matthew Brost wrote:
> > On Thu, Aug 01, 2024 at 11:29:41AM +0530, Riana Tauro wrote:
> >> Currently GuC is reloaded for both runtime resume and system resume.
> >> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> >> is not necessary.
> >>
> >> Remove GuC reload from D3Hot path and only enable/disable CTB
> >> communication.
> >>
> >> v2: rebase
> >>
> >> v3: fix commit message
> >>     add kernel-doc for gt suspend and resume methods
> >>     fix comment
> >>     do not split register and enable calls of CT (Michal)
> >>
> >> v4: fix commit message
> >>     fix comment (Karthik)
> >>     split patches
> >>     correct kernel-doc (Rodrigo)
> >>
> >> v5: do not expose internal function of CT layer (Michal)
> >>     remove wait for outstanding g2h as it will be always zero,
> >>     use assert instead (Matthew Brost)
> >>     use runtime suspend and runtime resume pair for CT layer
> >>     (Michal / Matthew Brost)
> >>
> >> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++++----
> >>  drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
> >>  drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> >>  drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
> >>  drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
> >>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> >>  9 files changed, 131 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >> index 58895ed22f6e..e0b13dc7663b 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
> >> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> >>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >>  }
> >>  
> >> -int xe_gt_suspend(struct xe_gt *gt)
> >> +/**
> >> + * xe_gt_suspend - GT suspend helper
> >> + * @gt: GT object
> >> + * @runtime: true if this is from runtime suspend
> >> + *
> >> + * Return: 0 on success, negative error code otherwise.
> >> + */
> >> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> >>  {
> >> +	struct xe_device *xe = gt_to_xe(gt);
> >>  	int err;
> >>  
> >>  	xe_gt_dbg(gt, "suspending\n");
> >> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
> >>  	if (err)
> >>  		goto err_msg;
> >>  
> >> -	err = xe_uc_suspend(&gt->uc);
> >> +	if (runtime && !xe->d3cold.allowed)
> >> +		err = xe_uc_runtime_suspend(&gt->uc);
> >> +	else
> >> +		err = xe_uc_suspend(&gt->uc);
> >> +
> >>  	if (err)
> >>  		goto err_force_wake;
> >>  
> >> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >>  	return ret;
> >>  }
> >>  
> >> -int xe_gt_resume(struct xe_gt *gt)
> >> +/**
> >> + * xe_gt_resume - GT resume helper
> >> + * @gt: GT object
> >> + * @runtime: true if called on runtime resume
> >> + *
> >> + * Return: 0 on success, negative error code otherwise.
> >> + */
> >> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
> >>  {
> >> +	struct xe_device *xe = gt_to_xe(gt);
> >>  	int err;
> >>  
> >>  	xe_gt_dbg(gt, "resuming\n");
> >> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
> >>  	if (err)
> >>  		goto err_msg;
> >>  
> >> -	err = do_gt_restart(gt);
> >> +	/* GuC is still alive at D3hot, no need to reload it */
> >> +	if (runtime && !xe->d3cold.allowed)
> >> +		xe_uc_runtime_resume(&gt->uc);
> >> +	else
> >> +		err = do_gt_restart(gt);
> >> +
> >>  	if (err)
> >>  		goto err_force_wake;
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> >> index 8b1a5027dcf2..21f27ca23b67 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt.h
> >> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> >>  void xe_gt_record_user_engines(struct xe_gt *gt);
> >>  
> >>  void xe_gt_suspend_prepare(struct xe_gt *gt);
> >> -int xe_gt_suspend(struct xe_gt *gt);
> >> -int xe_gt_resume(struct xe_gt *gt);
> >> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> >> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
> >>  void xe_gt_reset_async(struct xe_gt *gt);
> >>  void xe_gt_sanitize(struct xe_gt *gt);
> >>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index 1ff49318f001..e1923a00a9f6 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -881,6 +881,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> >>  
> >>  	if (register_ctb)
> >>  		err = xe_guc_ct_enable(&guc->ct);
> >> +	else
> >> +		xe_guc_ct_runtime_resume(&guc->ct);
> >>  
> >>  	if (err)
> >>  		return err;
> >> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
> >>  	guc->submission_state.enabled = false;
> >>  }
> >>  
> >> +/**
> >> + * xe_guc_runtime_suspend - GuC runtime suspend
> >> + * @guc: GuC object
> >> + *
> >> + * Return: 0 on success, negative error code otherwise.
> >> + */
> >> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> >> +{
> >> +	return xe_guc_ct_runtime_suspend(&guc->ct);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_runtime_resume - GuC runtime resume
> >> + * @guc: GuC object
> >> + *
> >> + * This function enables GuC CTB communication
> >> + */
> >> +void xe_guc_runtime_resume(struct xe_guc *guc)
> >> +{
> >> +	/*
> >> +	 * Power is not lost when in D3Hot state,
> >> +	 * hence it is not necessary to reload GuC
> >> +	 * everytime. Only enable interrupts and
> >> +	 * CTB communication during resume
> >> +	 */
> >> +	xe_guc_enable_communication(guc, false);
> >> +}
> >> +
> >>  int xe_guc_reset_prepare(struct xe_guc *guc)
> >>  {
> >>  	return xe_guc_submit_reset_prepare(guc);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> >> index 13e75573f7d0..ddc87798e176 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.h
> >> +++ b/drivers/gpu/drm/xe/xe_guc.h
> >> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
> >>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >>  int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
> >>  int xe_guc_suspend(struct xe_guc *guc);
> >> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> >> +void xe_guc_runtime_resume(struct xe_guc *guc);
> >>  void xe_guc_notify(struct xe_guc *guc);
> >>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> >>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> index beeeb120d1fc..9e42c5d29971 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> @@ -419,6 +419,37 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >>  	return err;
> >>  }
> >>  
> >> +/**
> >> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> >> + * @ct: the &xe_guc_ct
> >> + *
> >> + * Mark GuC CT as enabled on runtime resume
> >> + */
> >> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> >> +{
> > 
> > I'd assert here g2h head and tail are equal in memory to ensure we know
> > we are doing with the PM as we shouldn't have any g2h on runtime resume
> > if we have the PM correct. If they are unequal, this isn't fatal just
> > kick the g2h handler.
> >


Based on Michals feedback below, I guess we xe_gt_WARN_ON here too for
g2h head / tail check + fallback to kick the g2h handler.

> >> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> >> + * @ct: the &xe_guc_ct
> >> + *
> >> + * Mark GuC CT as disabled on runtime suspend
> >> + *
> >> + * Return: 0 on success, negative error code otherwise
> >> + */
> >> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> >> +{
> > 
> > Nit, I'd write it like this:
> > 
> > xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
> > if (ct->g2h_outstanding)
> > 	return -EBUSY;
> 
> IMO neither option is good as xe_assert() is not to be used where you
> plan to use fallback path [1] you may want to use xe_gt_WARN_ON instead
> 

So like:

if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
	return -EBUSY;

Yea, that is probably better.

Matt

> Michal
> 
> [1] https://docs.kernel.org/gpu/xe/xe_debugging.html
> 
> > 
> > Matt
> > 
> >> +	if (ct->g2h_outstanding) {
> >> +		xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
> >> +		return -EBUSY;
> >> +	}
> >> +
> >> +	xe_guc_ct_disable(ct);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >>  {
> >>  	cancel_work_sync(&ct->g2h_worker);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> >> index 190202fce2d0..0cf9d77feb35 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> >> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >>  
> >> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> >> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> >> +
> >>  struct xe_guc_ct_snapshot *
> >>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> >>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> >> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> >> index 9f3c14fd9f33..c73a728a7450 100644
> >> --- a/drivers/gpu/drm/xe/xe_pm.c
> >> +++ b/drivers/gpu/drm/xe/xe_pm.c
> >> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >>  	xe_display_pm_suspend(xe, false);
> >>  
> >>  	for_each_gt(gt, xe, id) {
> >> -		err = xe_gt_suspend(gt);
> >> +		err = xe_gt_suspend(gt, false);
> >>  		if (err) {
> >>  			xe_display_pm_resume(xe, false);
> >>  			goto err;
> >> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
> >>  	xe_display_pm_resume(xe, false);
> >>  
> >>  	for_each_gt(gt, xe, id)
> >> -		xe_gt_resume(gt);
> >> +		xe_gt_resume(gt, false);
> >>  
> >>  	err = xe_bo_restore_user(xe);
> >>  	if (err)
> >> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >>  	}
> >>  
> >>  	for_each_gt(gt, xe, id) {
> >> -		err = xe_gt_suspend(gt);
> >> +		err = xe_gt_suspend(gt, true);
> >>  		if (err)
> >>  			goto out;
> >>  	}
> >> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >>  	xe_irq_resume(xe);
> >>  
> >>  	for_each_gt(gt, xe, id)
> >> -		xe_gt_resume(gt);
> >> +		xe_gt_resume(gt, true);
> >>  
> >>  	if (xe->d3cold.allowed) {
> >>  		xe_display_pm_resume(xe, true);
> >> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> >> index fa98e9f22631..8e535153cc62 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc.c
> >> +++ b/drivers/gpu/drm/xe/xe_uc.c
> >> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> >>  	return xe_guc_suspend(&uc->guc);
> >>  }
> >>  
> >> +/**
> >> + * xe_uc_runtime_suspend - uC runtime suspend
> >> + * @uc: uC object
> >> + *
> >> + * Return: 0 on success, negative error code otherwise
> >> + */
> >> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> >> +{
> >> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> >> +		return 0;
> >> +
> >> +	return xe_guc_runtime_suspend(&uc->guc);
> >> +}
> >> +
> >> +/**
> >> + * xe_uc_runtime_resume - uC runtime resume
> >> + * @uc: uC object
> >> + *
> >> + * Called while resuming from D3Hot
> >> + */
> >> +void xe_uc_runtime_resume(struct xe_uc *uc)
> >> +{
> >> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> >> +		return;
> >> +
> >> +	xe_guc_runtime_resume(&uc->guc);
> >> +}
> >> +
> >>  /**
> >>   * xe_uc_remove() - Clean up the UC structures before driver removal
> >>   * @uc: the UC object
> >> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> >> index 506517c11333..1e223d67086a 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc.h
> >> +++ b/drivers/gpu/drm/xe/xe_uc.h
> >> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> >>  int xe_uc_fini_hw(struct xe_uc *uc);
> >>  void xe_uc_gucrc_disable(struct xe_uc *uc);
> >>  int xe_uc_reset_prepare(struct xe_uc *uc);
> >> +int xe_uc_runtime_suspend(struct xe_uc *uc);
> >> +void xe_uc_runtime_resume(struct xe_uc *uc);
> >>  void xe_uc_stop_prepare(struct xe_uc *uc);
> >>  void xe_uc_stop(struct xe_uc *uc);
> >>  int xe_uc_start(struct xe_uc *uc);
> >> -- 
> >> 2.40.0
> >>
