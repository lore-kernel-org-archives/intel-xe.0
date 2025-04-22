Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1800FC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 16:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2310E5D6;
	Tue, 22 Apr 2025 16:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZCR3IRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57710E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745337619; x=1776873619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6ZWPPda51mhA/oJZNXvQ3QydmCzru0QIxLTRYNf5/mA=;
 b=bZCR3IRbzyVNIwrvznIqpnWmpM92ebK4KJj5nOrG5yHQsGH2ejFzn5+4
 XWY5UUnc2LPYuXEvmUNxVlb7bqTsCMvwPg2XyBwxyW7dVCt+x2d2cH9wf
 htDhvaho7e6qqvWHHffAUZgoVePBHHKtsbbDkqEGd8+n9WOrgFQbmR55U
 XbNSjLQ1EEanaatq6K2EcSaH/QCE6+o562vvnr1dMBVtWRSy5zf710KiQ
 ZckPergiLFX7Yf+emP4UuX3eKDifZ4NuRXm3eTEA79IA3G0Up4qiR8Vli
 roTLx5oqcP7a3TnWWv8XoS8cdK/OTtcMwVXsTHuufEgeBU6chGyM9nXQl A==;
X-CSE-ConnectionGUID: BK12JOphTdirHVc5aInReg==
X-CSE-MsgGUID: oEf3UjL6Q8i76Ra15ZGRBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="58267866"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="58267866"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:00:17 -0700
X-CSE-ConnectionGUID: tmUjdRi4SMqG1Ng7Qm9ogA==
X-CSE-MsgGUID: kmieD7DJQlStZGQr7h2VPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132597648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:00:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 09:00:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 09:00:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 09:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCh3uyKXJgujwPRskFeEDU7B1nvtu1hOOly5JMtrwVDE1H63aqVzraRhEYPkZh7WpbeVtQvJoa3A+q6PqxmPFVqEo+0f4Ii83vKgSZNvtJRX+qhIN/jN4R7NzE07iAlwf/KJkoRhuMN2DSdF9cgt0cbEQX0Fbu5g7DnaILebLBilQJwzkB8sNngGiLvkqfj93IsY0HIkDEteVBQ4Z5X5g4L/RgmgpwZv1e8d9rls5ZptlOPT5B8fjzFaIdPWBzZMxX5jv40+cRsFwSl/pc+W8Jg9lwq9nry+K4nDgHF5k6joK9Az7dXpjDdbacWTC6DkP3gkcPZa5vBj0XZlFGfz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1Bnh9zVZQ/iFwXCLtzkCXW//MFY/rGdNGzjOxYcanw=;
 b=p7/Crh6oXnB/TiO7nBgAjz26bWEHX8n6UyhRXJLt1hRJe/7lBiQ/lIkQ6WlGxUgYv3rkTpVWZaWJ8p67uXFmoPY6CwHTTFbELH9rQzDWRRWcX1gX5Dy7VnHBG0k1M8+IcpE5XApTOmsjrkUrmGCepjsohcaZhIe6XEu3HM3QO4KJrmVTrmao+qh+Izsp51QrnLbsbjSb7ls7XLsSiYCyYr4A4m8v/kJV/v7csmSbdnMCmqw6+AH8KRmHZhxhVcRBV4nTgLj8Au2RZwXI24THhLY0GIpRgadLzfvIUhrPIdm03VVzVe8SXbds2urMsQtflFKWwTXTCc0C30ybVGC+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:00:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 16:00:12 +0000
Date: Tue, 22 Apr 2025 11:00:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Message-ID: <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250410110057.2497056-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MW4PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:303:85::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: db5edf24-e9f8-41fb-1420-08dd81b6c33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jTtRKmAG7hyHGftpDG+qNFwbPRZxL8Ncx+FZt5K0fZD2JRXpNTUbqLvR4JUS?=
 =?us-ascii?Q?5YKwyDjpSU9Y8NP8Kvys3FOskpPyGdIluXYhp/w7GBpIPxYLZnrwYuOVUbAy?=
 =?us-ascii?Q?Rp6bfe442RhJV7R9g+gcVCLE2V36QwQaHmd6DU0c9ywB7uZUecKMDT4gjv8J?=
 =?us-ascii?Q?1e1naEZb6Zb9iX/MjUEbezjUJcWz9UMXmVZbsNAbgj7awmCHA7+PiFoj+4XZ?=
 =?us-ascii?Q?Uzk+ND1pjAE/E0YP/TjyYlXTE0Tg2pZJ+gG/bujVm+uvMIH39ZPzdxYv5mhl?=
 =?us-ascii?Q?DltbLxh2pP703c0c/NDoA3caMdyFAE16tWdWCmJTyFG1j/g3sU1sMo9FSOuf?=
 =?us-ascii?Q?k7yF1uW86LRrEImhAssn/CEEOywlTzSGbFkPXpAUdva6icuT33szR5rhn/Hm?=
 =?us-ascii?Q?98r3otXP0uR34jwW8CLwFnH3RjeJ60z3aQcCoQ9Fh23C43i3xgHMrbE6gxba?=
 =?us-ascii?Q?KV6o7+dCYe0WBK10DWmzWp1s/g5SSk5P7I/VeTcRWr5q8Hn5d+5rhCKbuL1Y?=
 =?us-ascii?Q?7Se+9JzvoM3xCyk2eZ5U7080Bwv1is32pTkxaf9hOGmQHzOTjM2iPRTB+eec?=
 =?us-ascii?Q?5mE94/gDQaDm2q/YUKgT5lVucaSjz7e7WYNAxpdj3zGxsYSCbcnSda05WaIb?=
 =?us-ascii?Q?OoD8oTMcug9qiqwLRDuRv35rI2bxcRmurrqltoYtMJBQgKUOJEYYAkUK1gVX?=
 =?us-ascii?Q?Cfnd5C/VP3P27RH6gNV4s+wV6gFRLPxYyQ1xNeXoFdZ3OsNF8PaLg2f7jovo?=
 =?us-ascii?Q?ICmF3N7055jt83JkIOeBBfM4+VdWKNr6rl0OnPw/m5RRJPmEzulcegajwlCj?=
 =?us-ascii?Q?Wg+cnZyymy5lNROw7F7/ynUWGO1G5gw1NJqFsHFmnvHC65xaB1l5FIdkBQNk?=
 =?us-ascii?Q?E1f1gSNPzAXyndS476pwyCSenyTlSIWPvezNeiOSRAp/S4pjE55lbLV2qBQW?=
 =?us-ascii?Q?WcIHr8ABulanCmbWuFdYBqw1dxf/RIHvSCoJwj542Jsj03dkt9pthIAgkaHB?=
 =?us-ascii?Q?MUkpgYPUuQAGJRt6DvOz+x9/FvzrvKQ080NVC1XaJ5a+ymfSjmC++YpFxN9I?=
 =?us-ascii?Q?oF2eLp4mZRMhC1OKkBGnmcLU+ixbg0PpsI6uEbgDIUNI2NbohL/YL9MWm10v?=
 =?us-ascii?Q?yKvIP+c+vXsx0Eq12wS2yoaTdlJBUsCz/OBzVl1l41pZU/1TYqX2PEjJnl/q?=
 =?us-ascii?Q?cADz/cFpWEIVH1ImilzIWX1PGp0TfmeqqR2iHgp1BAo8rtgoLOq8WpykK6PU?=
 =?us-ascii?Q?2tPvh0w3kaCy5RteX0M1OLCiI7uAELuHVbJghJkWtz6wnMAieevP+bbdyJw4?=
 =?us-ascii?Q?JDCxbE6dHBslilzFknQUoyGUxXgnN3TxDhzuYFRaUe7RWcjqgPl/dDiBnYd/?=
 =?us-ascii?Q?nPGUz0KP25qgZ92zCCpID3gnse9+7rAhWZfLReUMbMKuZ78ZHM+NPwP43D0K?=
 =?us-ascii?Q?BmSOVFg/KWI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7alOo+YwssT3qbCKu9vwKfteFstS5Zbr2kc+kBPv3kxQfzFmbLv5t6EF6b4+?=
 =?us-ascii?Q?GyHeKez0ZMy90/oKDpuwlZS+8gkpggGBgQE110/q2uA8XzheEVgF0/B2T6RS?=
 =?us-ascii?Q?btvSruKBLDvBCJUAJ4aDF1EukROlhfKwVN+YgUfCaxh9v/LqV/CYdQII/982?=
 =?us-ascii?Q?Hv83qfR5a9Q5jK3Cj9Ke16ZwV89GonO/C/VQqeq0aECtfm4UKDdsn+26zF+o?=
 =?us-ascii?Q?7cnRlhxYqYuTgqaBsjHvC+0FY6nUQSqBM4P1fAeZYcqZr65uwyVIu3+sBQRI?=
 =?us-ascii?Q?manEqGWh1+a8pUjEnX1HZtjG8Y6LUJgJ6I4bblsqaOMgtYfYbZCCv4UanXLM?=
 =?us-ascii?Q?slDLQ5NR0+u1NFYgtCFZJFIf1tvAf1dsplNdJJuQ2yeQOXTkfxMbCq4sIlxZ?=
 =?us-ascii?Q?wfOVtQxzs4zPRmNUN27wuvuPC8dKg7ejHx9+dfuMitCl6ov8T1CBox2rAl9S?=
 =?us-ascii?Q?XhwIlQm9nC1WH02U9CJEiPfoFHtdmMFnhUTihetyCxi0btJ7hJBD59RqTpcI?=
 =?us-ascii?Q?PYOze6K7n3TYT6veOBAC7wbKOQ5vZzwLsEZvtvcan3fgw3Ft5sHhJGEdbQCv?=
 =?us-ascii?Q?TpIYW88z8Etg54a5WxaSTG3HIzcpql0k4vORZJ4Eel+GlHcUO2+ugxZM4Yxl?=
 =?us-ascii?Q?XDLcOg63gZ/F3NZDA+kO3O/2o9/kPbdDLqTAsyMwIE4jT8zNvaCplJ4fPp12?=
 =?us-ascii?Q?C9SHYMOSTHQSeg7QyY2fLFdi2L12N87b3rs6WQUmR58cdo7c95Ez/bQLec3W?=
 =?us-ascii?Q?7sjegrhDoMQeg6J6kL4AT540zSXMylDwH/GFtxR7B3ZTOjBkWLoXSApn+oX/?=
 =?us-ascii?Q?gTOMQy1a1cxkpxdD+fmz3C1/37Y7sRawZ1SeQuREA4YCgnf0MLfbTfsaa0dG?=
 =?us-ascii?Q?z0awj4FnFFg7PS2mwEr+IK+yzJM73w/s1Phy0rs2oAhbZTufKIqqP89jeR7h?=
 =?us-ascii?Q?GFd9HXLLijxkFd+yNfg5Q/P2xq7jnmaB1a5mF5tQgHpNQbQeU3SsND0scIQ1?=
 =?us-ascii?Q?o9npURYcuv/MyHiRmXiWugn4+ZlVE6WmbNvMeHlUq9rdxsYKwFJtbxV12n78?=
 =?us-ascii?Q?VoPYCZJqpWhW5n+OxsCZ/7c7PGodpzdy4VgQ2eGn0njdgduFVHed9z9dzF2p?=
 =?us-ascii?Q?nqGz4obCLQ+cAlubAXYfKWxtIx7/FOlD1gsrKBIJNP2bJrSum8CtpOwkaDLJ?=
 =?us-ascii?Q?jx26NJugUL1MVUIf0jKR/g1M2XHjmvYX5kpsC9PHz6qVG0/EtN9pL4mA+B2R?=
 =?us-ascii?Q?xqPcj43TkvjJL5zg4KP3BPh5N1Fq9EeSCy9+YMbBSOpw8tUIfuMOiBHXNKdX?=
 =?us-ascii?Q?J7gyMNXLUyzSaC16OgPz7owJ9S1YPOJHMAAANW4ZgPpkn13efUDWnuYBs9Rp?=
 =?us-ascii?Q?LbOjfkSIxTmC597dsF7mfNoSbrjxJBjpbEwa7EsPv6PVmdW7+ctIY/K5gHqO?=
 =?us-ascii?Q?Mw4gjRJZxgvbBOfD6s91XtP0Hoj5gyz442NlY8H1n9hviYFwDtKyrIVI7syd?=
 =?us-ascii?Q?MkWSJx+1kW8jUlBGttfvqb/hjXaQUvEHJb7OiHmI5jEeJrVGrIAU4Qp6iAwV?=
 =?us-ascii?Q?MxmEpp1TxWP1aSaTXPygpRqlycFcrQoTjbamKvCUdr1nY1/br3FAe70qZ/OK?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db5edf24-e9f8-41fb-1420-08dd81b6c33c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:00:12.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNLyyM4iMuWJdCrrj5PJBOQcvB3zIXs6fqYN+H8yYx24H61jSv90+aXRswzS7Pm8eddBSNYEtQDQoJ7v6RzdMbB5INGEB3kBjQl/piytjC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
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

On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
>Add wait for LMEM ready during system and runtime resume.
>This wait is there in probe and is missing during resume.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 2 +-
> drivers/gpu/drm/xe/xe_device.h | 1 +
> drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
> 3 files changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 75e753e0a682..4c0d9eb51d1f 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
> 	return !!val;
> }
>
>-static int wait_for_lmem_ready(struct xe_device *xe)
>+int wait_for_lmem_ready(struct xe_device *xe)
> {
> 	unsigned long timeout, start;
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 0bc3bc8e6803..60bc92f9ab22 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
> int xe_device_probe(struct xe_device *xe);
> void xe_device_remove(struct xe_device *xe);
> void xe_device_shutdown(struct xe_device *xe);
>+int wait_for_lmem_ready(struct xe_device *xe);

if you are exporting the function, please follow the naming:
xe_device_*.

However, I'm not sure this is really needed, particularly on pm runtime
resume. At the very least it needs better explanation in the commit
message. Do we have any known failures this is supposedly to fix?

Lucas De Marchi

>
> void xe_device_wmb(struct xe_device *xe);
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 4e112fbacada..2e59670660c1 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = wait_for_lmem_ready(xe);
>+	if (err)
>+		goto err;
>+
> 	xe_display_pm_resume_early(xe);
>
> 	/*
>@@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> 		if (err)
> 			goto out;
>
>+		err = wait_for_lmem_ready(xe);
>+		if (err)
>+			goto out;
>+
> 		xe_display_pm_resume_early(xe);
>
> 		/*
>-- 
>2.25.1
>
