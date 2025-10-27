Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9503ECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1810E0A5;
	Mon, 27 Oct 2025 20:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cO0Wk850";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A729610E0A5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598340; x=1793134340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s7ebCB2rzg/XWLZxKW23013WvNAp445AoDimtbwM6gw=;
 b=cO0Wk850Uje4EfjA0OVDn/oZWjUfgPl0hcR9daQ1N0BSoZrTs5Nlwjcf
 gl6llOVikeV/L2U+fTMv22j8+ryrrhF7f+z9cYU3hm8TKLurtfz3H5L27
 O1HrOKtv/1w+I1hozFl1OWMxpCj8xefukn4yizyJ7DClsMnxEgziDRFN9
 Fih1EKHuIs5PT2p/w0Dspizsz37xfptt97ZzxLyR4ZGwFaCjq3Bo08882
 ZUPBvvpvf6jsR56aiUOHamFgpgvEEboQXoYmKwCVtppW0Spwcc9x5lbOZ
 Bpkl0VwxxdrMOZUKYlNXsx4+6+qu9G4KPM6j02uuYAx2Wn+AGxN3/s5+s w==;
X-CSE-ConnectionGUID: uZ6MCRxdRUu4QKZjD9iGHQ==
X-CSE-MsgGUID: cX3S50LcSSeWWy+e3iyiPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62895915"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62895915"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:52:20 -0700
X-CSE-ConnectionGUID: nOm8Fd3jT0a6sQPWsITM6w==
X-CSE-MsgGUID: MP97inndQjuBnSWZ2oSlvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184328270"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:52:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:52:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:52:19 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:52:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQlBcxFj7HE/q1RAxBxV42AZ1lyMSAQf4mmim17GPSb6UYRuzPstQGc8qCDnFYIW99X7jen7o758yxe25DFJ7rHlVfW9Y3cql/bBUL4RKbZIEwZ4eEgdbOA1eZBUfaYFV8CLUcWOJgB6Lyvwqab5GaIUq2hST0iX52wwnJ8MCm3m2vvYBKalMnLuwXZCRHRQxV7o6myR0en7lr2XdmfVfT8FqDkmClllIskMRhBiQh6pPXgzKNY/wC0T/LFC5BKzrMpma6VR1jBd+bs+zgO9U9E1WjKKQgk8sWfXKeMUXPgq0H83BXGIQ/pNVSoTN6zaGoQBvU6h8fHAo8ddubV5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4q6s1DnC98Jxdz2U5Xdwm7+REz8OiYs2pYdv9384yM=;
 b=OFQ96V+QNTYFhamCuS8IawZxcbgymRgusrEswZUXrDWc1tqg0plduko13p9OX11ilMYcwUbnHW99sQAFBxmJzJbc/XbuwnuxW8HUOhSvJX14Vm2xg/GVSXY5DjydJPF+g6y250BmAD5bhaOh7VKj7+nvC9Zgb7xChPmH8sr1NLNDcs8zFpmUTnU7UZV1ZskMzO4c452vjuK9IGcGSlzpNsHsCRox31X1s9wKX9Iu62smEh/nPvv4l2Ax9HE73AsB7nWZ67OacCQB8IDrsXUWEtvS4/Nvtvvgg7vkRqb1qJsqKfnMnjl6TT2EL2qsqXMao4M7hEDv7uiz3gXOld93KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:52:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 20:52:17 +0000
Date: Mon, 27 Oct 2025 16:52:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 4/4] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aP_bfUFLUUV1s54v@intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
 <20251027123057.3738059-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027123057.3738059-5-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a2f5f3-007b-4d98-f680-08de159ab71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1XSuJmH0axwR4hNFlqdpEJKFyWnbObCq/NtbEaj6njsazYBqLGncHseZ4AfH?=
 =?us-ascii?Q?6MuYjz6vCrd9UY4YaHJDDyLUCyBeVQfOXYRKbEdtsMxHI/qxkmsj2vluk9gB?=
 =?us-ascii?Q?0rLg0H2kqDS/2fBwRN7BfrLStH0TEC9F9/GwSFWYIBTWI/lcytdM4sLPWJos?=
 =?us-ascii?Q?cRCCCMcS5xL6fyKPb/RNkezdH4nsum8wBU622wKK7MYmEpsLRPa7sSzc0j0b?=
 =?us-ascii?Q?lL0pJo88RkhsNI5PaX/q6f3ez7Bw3nSb2SBqVG0pet6Jbg85CbuqX95vMAUj?=
 =?us-ascii?Q?frkTGAefcw1eyzyIahjq4VnXauZas4RsGoCjHIml4DvCF0odtZWwQiqOvdj3?=
 =?us-ascii?Q?KLUMNHFEWn2x/xvJpWk1XlU1oCZSxiJK2GrGDEQv2B5vHwprvL6CmntXBszE?=
 =?us-ascii?Q?1bQCLUXzIhSnTMwlU9r40hS/lx+hooaCwSe6ofTJ+YqmWGBz3C3ZgUKuAATq?=
 =?us-ascii?Q?5ImbisgG2+Z67PnPrvoyRqbckODKNYfXvoSRBq+38TQpjreIWeWGrRiTWq6O?=
 =?us-ascii?Q?4hy0q3R7UczJEsfRP8SrJs41BJ5BfUhECue/SRsRc4JMv45/AoaX2hwWzmdt?=
 =?us-ascii?Q?HixUaQRla8Nfs9JdDwnY/BqJauUzXz1c9y2vhyYw8y6Nccjb8UsrMAmdwQdE?=
 =?us-ascii?Q?TbtiEiqbeEB3dek3JH5tmxSL1XnjK/vpwlSVs+uox4h15hSblKHzpvd1aQ+I?=
 =?us-ascii?Q?O54qZoBHPYRX5fG4uQs7NtmIEJ9xc4lW7HO58I3Hu4JGrpjPxqUeX/QuaU6I?=
 =?us-ascii?Q?fWmpuc56+nZrHLsg/rWTf7/qOOt8/HTPVJJfQi2Fvc1owUiO+i1vPW9sGodb?=
 =?us-ascii?Q?5Ic2A7sNeVFg2tIm1nm7cUjf0eR6wZoVndwBbFT3/eQwucVSeQZ+EC/Y4giy?=
 =?us-ascii?Q?FGaSLd5bVzEd7o1fVI9BEFYqurihZo4p729WbFJBCTtnVOuM2Sq0BA8qh/hx?=
 =?us-ascii?Q?QFjNGpe4fCQvryLP37RRGvJFQdSuwCgqAREAvVAh/mNUOhVUXOXwYuqkCOy/?=
 =?us-ascii?Q?/ak5+2oLchXMjtAM8a7Jtwg+cGT3daiDa1DpoSZiuoaojIU6EbWmuDF/H4Bf?=
 =?us-ascii?Q?1Ok8vUzyitHqO0vY7hiZQAXnIiXTrkrT7WpJGI0GDRw03najuJCN3stIeuQK?=
 =?us-ascii?Q?i7QLWR9g2eEE4d2kAQTKRZXbO5iFq/P47GzJ/EtfJU6fc5TV/Xk8dx/aoXAJ?=
 =?us-ascii?Q?Md4CIdJvueOHg3vCInTEOHLBBfeE59yY9CtQK9Fe7m6lSXVvLGRl4kYnCjCW?=
 =?us-ascii?Q?P0bxReAzX92n/net9bz3+xpvQKBWrK3bMQ2eetag00wkhnMSmZufmdVHsbon?=
 =?us-ascii?Q?W9vz+g0V8eeadW4553rTOh1oA1WWh/ttTVsAuEokp3URue8tOKpo+KA013Jo?=
 =?us-ascii?Q?a8VgJkVRFBv10hrxtdksYPdApr87OzQV1fK7oINAaJhp45uc9PkWiurYe+wO?=
 =?us-ascii?Q?vSE5SqHbg4kjzh6uIz8ADVF6yutobEEW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o8CoCXIorwQe9bQDq5NyS5pMrfFBLE3+GbywkwWGizYNjen7sNxTmngTO5zx?=
 =?us-ascii?Q?J7S/P1SrpRPchs70qzNd41dW9CIPZqBIQBJ6dkAI6jvTDoZn0eB607XJbIRi?=
 =?us-ascii?Q?Uu1j5rC9rrhrB0XXdlrNwvxKzjWGUiY/dS/mbu32plt6atiq0zkYNexoFHPf?=
 =?us-ascii?Q?/eGChl2xZhgPE4d0IdxyFup+tyQCG16Ii7P+y5pLgHY2Cl769ayJiiuhorn5?=
 =?us-ascii?Q?VrmY7YHZvyAJCMfJgOEK8yc9yPJdUcBImoBuEEAlmw/Q1sJZmgnSkHcLU0O9?=
 =?us-ascii?Q?kTYjr6Sii7y45HyO6MFvRCBCue+nCAN8J64SK5tvdDhZQTLZW0vps1/ZmKYo?=
 =?us-ascii?Q?KlM72kEjgGizxj4aN463JDEaFnwssCaOCQ0V3sVYhhxQjkMKPT6fQUuHUz4Z?=
 =?us-ascii?Q?YK05lWillJB05mCYLRrYPmwJnR0cV/B9NcZkAnt2MCnqqmydVCzLRq0n4DIj?=
 =?us-ascii?Q?rpyAMM9Ys/vgk5xFJvse1D931wa9/57kQ4UOHxCleAbQVTgyIElDg/dmr/KT?=
 =?us-ascii?Q?Qgm9Eib3maWgzF436fGa/qxl6CoMYsf+b/UptsXMcOySo9KswlSJRFn/TDCS?=
 =?us-ascii?Q?TVu8DBeZV/lCEABzGciNRRMQTsjoJw66t/13PFSIftF+mkmpCo+yZQ7tKjGZ?=
 =?us-ascii?Q?wE7nannVrDhF2k8K0itCq6GQFx5w0bEA+AV80sjnjz+BGM2bIIfs0qrRhQUN?=
 =?us-ascii?Q?UxBS3C3hQb7Ag3qN9ylNkauaqeFE7kf91ONd3WpIy3Zx6H2wYw3ol2N+EmUa?=
 =?us-ascii?Q?hVZMcyGVX058OxYLMG6f4r0UCXq7Xgikan3uTmigGwgk6C3JugDypH4+WRIZ?=
 =?us-ascii?Q?VBiZQcPCXhncyHi/FRdtxiWpzpRtCEIakABY/FNFhxayitUOqhLX4Y2jmhBa?=
 =?us-ascii?Q?JjXbv0KxLLLYSAORTrEBZwHz0hAbqe/R5y7RwHljJjuxYQ/FJOgewCue64A5?=
 =?us-ascii?Q?hCe7U9UQLb+5LfF81do2hYyfAtqrRAinThNLQyvN6yojbjC8g+2XWHLswKfX?=
 =?us-ascii?Q?UcctcRxEV+VYlYuFsPwaXs0MIildx37aVRM/ro2Fg49rVCd1d3AiOEX13me4?=
 =?us-ascii?Q?m7LDBRqJfTDky65NrFshei2Ng6K5XAO3jAeCwneUYMpdN1RhZ5KPJxjqgo75?=
 =?us-ascii?Q?j93V7WQuZTp5i7fu4IP/e/we2JUlk+l7cz6fOMwSDO1HdQHgRqW8tT79z0AQ?=
 =?us-ascii?Q?EaQ2Pr/pYuV+LYJL8dLUzBvEAJINqCG8fiWdAebY4VTXW3tPXDZ/GqHHGTai?=
 =?us-ascii?Q?EjrjKS6olQlaXYa+WY2XFLZYf4xfETLlu1H9OeN13TSndg8fKP5eT3lcaZdG?=
 =?us-ascii?Q?isuyATkKeRT3YzCkoBfVi2tu18gOuA5DrrMouRfKiPqiwh22pk+IepFkjcpx?=
 =?us-ascii?Q?CX9mwgrZn2Milc+opsf8iDNaBItHbNCsKuevMtosEzBbup3ATraV9CCUADZh?=
 =?us-ascii?Q?0OuBJ82IBtPMCY53O5a07vHaGDTz21KBohHt8bAQT/PkjeCK6OcQJxAS/E0d?=
 =?us-ascii?Q?yN/jg0E832FcY4216gS3myoAySRMsUDY9EYHn9un4XT37B66Hsd2eHZY21Gm?=
 =?us-ascii?Q?0/vgCoFk1zW7iHhGL1u6DHfgFkr9bJJrgvtnLYoqKgnbryy8nd7qY/7khZMy?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a2f5f3-007b-4d98-f680-08de159ab71d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:52:17.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTbpgfVG8xwGVRApokCHhHgZqfmNR6purDOY1uVSBCO49xy8mEW8o0/eOayoN+CflqJf/m83egoR/nHG1y1Ozw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

On Mon, Oct 27, 2025 at 06:00:57PM +0530, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full GT re-initialization. Introduce runtime helpers for GT
> which greatly reduce suspend/resume delay.
> 
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>     Use runtime naming for guc helpers (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>     Use runtime naming for ct helpers (Michal)
> v4: Fix tags (Rodrigo)
> v5: Include host_l2_vram workaround (Daniele)
>     Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> 
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89808b33d0a8..0c300f8dd588 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1008,6 +1008,66 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +	xe_gt_disable_host_l2_vram(gt);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_gt_enable_host_l2_vram(gt);
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9d710049da45..94969ddd9d88 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..ee35f1d8c21b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1607,6 +1607,40 @@ int xe_guc_start(struct xe_guc *guc)
>  	return xe_guc_submit_start(guc);
>  }
>  
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	xe_guc_submit_disable(guc);
> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> +	 * directly enable IRQ.
> +	 */
> +	guc_enable_irq(guc);
> +
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	xe_guc_submit_enable(guc);
> +	xe_guc_submit_unpause(guc);
> +}
> +
>  void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e2d4c5f44ae3..fdb08658d05a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e68953ef3a00..a7b8d16d4041 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(ct);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_restart(ct);
> +}
> +
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  {
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index ca1ce2b3c354..5599939f8fe1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 53507e09f7bc..403a61e98ad8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out_resume;
>  	}
> @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>  	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
>  			goto out;
> @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..6a58b33248f5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_declare_wedged() - Declare UC wedged
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.34.1
> 
