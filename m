Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F26CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CD910E58A;
	Wed, 17 Sep 2025 19:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD1Wj2qi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6A810E58A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758138753; x=1789674753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aRIDC99xo6qWccuGPFTnOp7GxOKstBhhRqxeu9MkBtg=;
 b=LD1Wj2qi8lADOxlKbbIRUoxe6KgUTitjExx4VmYgj1ArM+t2rfDRUrkU
 UlvSbCJe5O7nujZPzP6lqDkqu46D7hCNFw1vAt6Ybd7G5d6pwq/rx/807
 IOVFn9SKPDlcqrX5xqruPOW+XNOa7FdRuJ9fQMPBNNRIl5W8u5qGmwrtT
 o4HZh8oFFaZbihYp3udOVN73k1yilFGbozQn85s3yjefIfm1PwZcZmHjK
 4wdfwmRgafNQ1Oj3livyl9tSTbVZY4yuwybzLC8j7fPR6nOpmxHPuuhO0
 RK5LzqmocwVjBNRCczWjRdxbiZ1S/N9cPGIdDOYvT1fhQlBU4rLg9ESZ3 A==;
X-CSE-ConnectionGUID: 9aJ7CdfCTCaIVjl7zCriSg==
X-CSE-MsgGUID: deoZ1V6NRDyuLaVS2IwWqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60152795"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60152795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:52:33 -0700
X-CSE-ConnectionGUID: mKlZ+ObvQxinrcz7PCb+AA==
X-CSE-MsgGUID: x2HRTw6pTSmgoOBzDeyHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="206124372"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:52:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:52:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:52:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjjhBt+LMvAAZEsGohFFIYEoJNfyXm39G8xGJC5aIqLobalWdwAZv5G8WcWFi8OnKIBW+5xUO7oE+Lnq+XHrP3dLQwHGM5cc3PEJbGdyWRN8G4kaNAe+Wn9So1+rbCL36P5lOzILCyzvKnbFhjayqj5T01C6NCPGNpFIinfh3+9mHuFKcvSUXK+3yU7ylHqNnnJOT94P0sZH+NjAQTMVYxxunFD5bXNQZ7/savBWVdYIU6FMGA3wrMbMGxPPn7JQ9pc9DUBBcd8skJguokg86ii9YCtEIZ1Lr2f5u6/RLW14bPwhC1deW0gME/2GLzlcI30Ifnva+JAxWLwAX4PRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yG8E3ejEM6poeQcMsVtkCwhVsvmv1+2dwY0E6ng2yo=;
 b=ntzaOtiVMO601wSzNkyS4TV2Z901P4Kphqv0K65Kj5JBDjLlVxNHRlSakKGCW8Ud66mJrBjzqnsdSjZwyOcb8AYb2yQLjHmHWFOX0kJrJ17Fym6JqP0OXV/qKNPxSXd7Zbl9XHvsB+tzZJemOO+jmENrkh5VOzHeUURt/qdz2QXxX82wfWKq0z3yO9+41zFYO78jDqiRnk5sktnsSGgUO9MK1vCqQjHjDqk4OgQuvarmXpCy0B3XRPlk6mMbhlUrVMp97wd44xf925eq9fCxkEjlg39YaZhZbRp4TFWrdYRRoOVpC8cA1n+8KrAjMBJnkKAVkj+3VYNe3THA4yeveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 19:52:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:52:29 +0000
Date: Wed, 17 Sep 2025 15:52:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 5/7] drm/xe/lrc: Allow INDIRECT_CTX for more engine
 classes
Message-ID: <aMsReM70YRm0TtoY@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-5-306bddbc15da@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250916-wa-bb-cmds-v5-5-306bddbc15da@intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d679856-0f3c-429a-ea05-08ddf623bb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jMeV9mAvRW8aHVPwOj//abtto+2UvKH6XgKSreaplw15VT8JyeMxDCt4wL9Y?=
 =?us-ascii?Q?F2IfNkS91KKcw4RiCuDaDddApeiRJWr47X1tmghXaHKaBWpejnzFJ3SSQukc?=
 =?us-ascii?Q?Vso/s9u8bTXT809lK4xLgPRlmUZRwC5HUQMf6x3q4DIFUC8lwAYUWVo8Ehm8?=
 =?us-ascii?Q?5+oE/b1u1K5JvclJ5RUYuHpH4EmReFobdMMIoZWV8zCXWvZ7CprAxBg/mKce?=
 =?us-ascii?Q?nwthN3zyQQXS/RLH5ekLuTw9hcebuiATjd3+UfmgundkjzHZfvRmbKlykBy9?=
 =?us-ascii?Q?K36liBpMMZS/6JCoeRODx7W1QBMFf71M6nEJ5UErqKwoW6TRMp2B/6vIgJ8P?=
 =?us-ascii?Q?mYDocyemfgb6+y9G5C74RlE3PhgHh5hGfEgdXyy3A3Yw29Vv5Bgq9HR3+GnG?=
 =?us-ascii?Q?VYQxoThC1mP/Y596sHC+hzyMjz9Q7b31pcBEEulRB33sNs6lqOBZhHMZ2qKi?=
 =?us-ascii?Q?wx9oMYvDkhI8IM412JdevOChyRSNQQuHXcZr08n9CB0sQQfuELqBBhIAZNbU?=
 =?us-ascii?Q?NJnwaSNTkPCuK4dKg572NxSMn0oM3pCKorfO6C2JbyBzx8Kuf+bGab6y1vFu?=
 =?us-ascii?Q?Iuv1gup73V5qENmEhoYrHJkSemJofhYLFhKTKlljmKYfSNhxUVI3Uh+nI/vf?=
 =?us-ascii?Q?i4NYjTWaSVQKlaYns6tClMEppsMv6vIfyDMF/GHpBBz2sPVKLVmTv83RwfEm?=
 =?us-ascii?Q?LS6wJIUc9jTEFMddwboo6hl+UQjm/8LnjCROsa1gR2NoRTUX3duitRkt4OAQ?=
 =?us-ascii?Q?XVGHt4xk+cd6y/Fe4KjkerFW5AwQ0fBjixnYvvtwJZaoBiNIPJwRqCmopJ47?=
 =?us-ascii?Q?iZbzeqVT2M9fpxXc/Xy1GrG2Iy6ZpZmIzZPoRzT77qVaYERIBBcMuNFpQgGb?=
 =?us-ascii?Q?mUxIEg+zW3zioJARXAXSf8mGXKrogZNqAlktzQInwg7A2GWL+4lR7UFw2K0q?=
 =?us-ascii?Q?w/AYcg3G4iVrY7bOX4NysrBlUgE0bBKUQkSjAd9EfJDxN+1qhaepS6T6UjEC?=
 =?us-ascii?Q?FcS1qbK7/2mNzefEDutffExkFwmqmpYwnME1OcnGc1+Dlca2FTfqpEVGGl/i?=
 =?us-ascii?Q?P0QdU+nJNAHkoAG9akA+abG8ws0o/f84MI7i927TB9/HMI6BcGNRyPzaHbTo?=
 =?us-ascii?Q?YtKEVBHKEiIWn91CkhDYEWZwhQ9iFdXjqdAOUWsPur8d5F9Kx2GACIeJJkAw?=
 =?us-ascii?Q?nylBY8G3sF7jpd5TVhGmeYGyMFOyZwzY16HUKXYLRo2kJLtB5MhXOTTh7bmR?=
 =?us-ascii?Q?Ei5APXUgWs+8o2sQWrp+LJl80XgPpsBzbQHG3i2dF3v3f10zdlgIh0o5ITRR?=
 =?us-ascii?Q?JvYf/TE6j23W1R/T+XFyT6a7AuewfjgFUO3z8oON8WJL840fugsW7gF/LcxR?=
 =?us-ascii?Q?MWg0gwKnWLyljaUHUAL4EaSA1yKzyKSojXLzyBKHGtoYJ6tbHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1+zhL1n3GC6wbKbdZ8PmAGJWA+GQ29uJ7QUyjvUaDlKrGcQ1o/k98Zna0Kg?=
 =?us-ascii?Q?75xBfAw8KQHKQ+WUIMz0riX8bZrkYtfm0LnaVa65LOFmazWmrmsJIcm45kYA?=
 =?us-ascii?Q?Jahrfq3dFCapFCl2u86WTk+x7DQw5EL+A0dvhpuYBOLyKk6mgQ4UpfqogGXb?=
 =?us-ascii?Q?0ualR3L84QU/qjmnOzTrNqC7tjWF1BEmHlckEDDiT1YQ140UZ+PyGlvqdiec?=
 =?us-ascii?Q?VwQcbrAYwbyz9TRoLDnhoI2k3jkC8mApkvkrDuUi3abACYNoCS2gNEBAiIgY?=
 =?us-ascii?Q?CezYMUQKNA7z+oRtkKyvn5bDrUHZ9zXtIke0RDQxTEDvhOxl6OCleG1u9jdH?=
 =?us-ascii?Q?v0hsbMn62hTMthwjr1cT39UwR7qAQ5jUCkZOo45q9coy/BBMbfpMsXM7e3rH?=
 =?us-ascii?Q?+Je0wxLRYbFezPb19swF8sfEtkYPttvaH9a4vjFdptUkdUa1InCftBU8nEsy?=
 =?us-ascii?Q?Y6suRSeX82PqlILSbnsyrDFNqaref0TuUfKWYNRcxz6Ni3X+M7MPqSz0lLwS?=
 =?us-ascii?Q?Jpc3I8cK1GHS01HsvHe/9pZA3LX5J7FDl+sud5WmwTNnV0UpeevTZKUGyqHb?=
 =?us-ascii?Q?Dt0/dh2BuJvNg49NVEW3DmH0UQB1gi+S3HNd3X0JrrwDEDD2J2jyAJ2RkVE8?=
 =?us-ascii?Q?W5mlPbKKZ7B9q2i7qyvp1pfT6U1zvrbcFboWksGvIaEzYU7PtHLL9xh0iwB6?=
 =?us-ascii?Q?xJgXtWIs8Cv9GRQn4xCPCXSXIYJ18Vo9QQukMnpF9HfnS9wBktkplyU4Vju6?=
 =?us-ascii?Q?ylJpujkLE5O9Gs9uSi/r1927T8JUKxmA7VL2SMPfBQltZBcCwhOCLlllTbel?=
 =?us-ascii?Q?kbeAkZHVJQ5DdNPyWFj3bny8fFPHZFMfFCJhhUS+EUHRt5fvT9gtBMM6qGFD?=
 =?us-ascii?Q?G44LiEYx7d9V/stw5Z2gflnQ/zcXBYxAzbIjSqLNpTOVeYFecwNNhnt+s/bM?=
 =?us-ascii?Q?HLv1xL166PcpVgISkxgeVTXTtf46dDVnzTE+hn1dIvsFX+LDTvylfT/HcEcv?=
 =?us-ascii?Q?f1HO8/KzYIIKyda0S9SbTWV/P9ZGuv/eNZAI6sdM6cbvhH0z5EidyLXV2CmZ?=
 =?us-ascii?Q?jHaBL5jNbHKuSN1n2FSkXAZxiD15TzqOu11A8YZgL0yNKYqWuPc/SCBZN2h4?=
 =?us-ascii?Q?Ko+HYmT0STqFlUrgAR/wFJ8IvFUMb/pDK7I7DBnz/4sFbflQFIL1gpgllHeG?=
 =?us-ascii?Q?dO7p7CA/UYY2oAS/nDOQUtHprp3ADXk9kdVeRIqgsv+AxmaHlot0+CH69fYR?=
 =?us-ascii?Q?U0fVmJve4LNgcCWnPazAjB8/th0mCTJBRwOj5dhriL2PumDOq5uuKwgkDAdg?=
 =?us-ascii?Q?iHkJQpvob24CIwCFOJZQ9963O+7Ksmlp/XzCUKjBuv3CZ8Oq8vE96NhzA3Pc?=
 =?us-ascii?Q?bqvHUpJPjWiJL1C0NRosmnVvtrlEzBr7eab1gdprutuiMZBLTSd7daT3BenE?=
 =?us-ascii?Q?BPXbxHS0K5vnYX2SPhnNWIOQZoheEEgUOf54P75l3IRUQnnXTSBzTvf8dIek?=
 =?us-ascii?Q?sErYzXBcJl3Rwec805P6v3taUXShB/+XHtIsbCP6OuJ46KjKlYH8dFJGUlQr?=
 =?us-ascii?Q?7LeyINZYcGSOeF3wBSZEs1B5MCiH9GIpqOrMhrB1tU/kLqjbjauGmz21x6hQ?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d679856-0f3c-429a-ea05-08ddf623bb7c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:52:28.8722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsrvqzlBNuZ0xmmJDaW7I/f5ASaWcGPVYxSx3az3/ybXo8FNyNsTjQFM+lmViuunDyZWfEj6KARNqHL+eGOVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

On Tue, Sep 16, 2025 at 02:15:42PM -0700, Lucas De Marchi wrote:
> Currently it's only allowed for render and compute. Going forward we
> want to enable it for more engine classes. Let the XE_LRC_FLAG_INDIRECT_CTX
> flag (and thus gt_engine_needs_indirect_ctx()) be the deciding factor
> for its availability.
> 
> While at it, add the missing const to rcs_funcs array. Since
> CTX_INDIRECT_CTX_OFFSET_DEFAULT already matches the HW default and
> gt_engine_needs_indirect_ctx() only ever enables it for rcs/ccs, there
> is no change in behavior, it's only preparation for future use case.
> 

thanks for the offline explanation and pointers

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ---
>  drivers/gpu/drm/xe/xe_lrc.c             | 14 ++++++++++----
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 1b101edb838bf..b5eff383902c5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -40,7 +40,4 @@
>  #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
>  #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>  
> -#define CTX_INDIRECT_CTX_OFFSET_MASK	REG_GENMASK(15, 6)
> -#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_CTX_OFFSET_MASK, 0xd)
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c706585611d55..0ab99c210d882 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1281,9 +1281,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  static int
>  setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
> -	static struct bo_setup rcs_funcs[] = {
> +	static const struct bo_setup rcs_funcs[] = {
>  		{ .setup = setup_timestamp_wa },
>  	};
> +	static const struct bo_setup xcs_funcs[] = {
> +	};
>  	struct bo_setup_state state = {
>  		.lrc = lrc,
>  		.hwe = hwe,
> @@ -1300,6 +1302,9 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>  		state.funcs = rcs_funcs;
>  		state.num_funcs = ARRAY_SIZE(rcs_funcs);
> +	} else {
> +		state.funcs = xcs_funcs;
> +		state.num_funcs = ARRAY_SIZE(xcs_funcs);
>  	}
>  
>  	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
> @@ -1326,14 +1331,15 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	finish_bo(&state);
>  	kfree(state.buffer);
>  
> +	/*
> +	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
> +	 * varies per engine class, but the default is good enough
> +	 */
>  	xe_lrc_write_ctx_reg(lrc,
>  			     CTX_CS_INDIRECT_CTX,
>  			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
>  			     /* Size in CLs. */
>  			     (state.written * sizeof(u32) / 64));
> -	xe_lrc_write_ctx_reg(lrc,
> -			     CTX_CS_INDIRECT_CTX_OFFSET,
> -			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
>  
>  	return 0;
>  }
> 
> -- 
> 2.50.1
> 
