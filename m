Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90338CF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 19:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6070910E05A;
	Fri, 20 Sep 2024 19:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuudS/+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4910E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726860415; x=1758396415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=19oVVkO9NMnAv6CHbD9JaSe/+fxA8CPIrg7punm/7dg=;
 b=iuudS/+wxYFyY7OdMWN15HPDwsHu5Qt6WexviHFeI/MxQNXwl1xDAPxZ
 MWOVjqexaQa+3Pc1Ey7BVQWxmyQ8X5lld5Guphkt+YccAVXUI17q77RCb
 soECi8oaZxYrBNixqP5yknv3Zx4GJgU4072rN0geBHenfFTU8peAJR6Nc
 9g4JDykNv39tA/DGoO4tQ9kfDyr0nZ3sxmWltvSsC3lOpaOh+YXy0maPQ
 icrPGcieQJBHKm6nX8Kuglvu2AugJuWc8viGDq8B0oqcjCFunx1jZbwzi
 Xs9bdKGoOM8vVmWUPltgpqQwo/zJvvzsrnb0QPgkfoqja4DyOs+mFxLNz g==;
X-CSE-ConnectionGUID: eVAd8376RFamUPtrE88MrA==
X-CSE-MsgGUID: bT7/AOkqRa2ZCKCTgxSGZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="48408562"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="48408562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 12:26:55 -0700
X-CSE-ConnectionGUID: TgAbFNZbT6miRCbR5ByUGQ==
X-CSE-MsgGUID: A3H5Q6gcQIW75ZVzoK2wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="107844192"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 12:26:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:26:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 12:26:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 12:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seZpuLgWuQSK893IHls4Nw8hheEipaUnGyaiJppbrAeeVOSLT2HHn5/Oq6kKUjJovk2hs3zr5WUmzO7h/hjmw4ga/qlsuHFoIYgH0+znWTIIwGGxFYE57RC4HTI1jaotHyKTS3m3a7gP8q/dlig5bmAnbtvg/CNa5A87tzxn7xEObXDLFQwfXzbviIqsYxnSdn1Tw4pDR74DiDiTfub6D+jwEX1mL4F7FleBl1T+riOW0XH0rKPbSgPjO8Mlw4XXu8km4pXGIns7h2Vk88irRJJw/Tu6/3MTipp5cxwwU8MUN8VhYfG1stbDrIrAU8xsgB41VNVOFGszEADed7X+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMPcaMKjjSaKS/UAzCIGSrxsAWo9Jq3HH2VRh+Cea9A=;
 b=pzQxrPWy1yvMVYeYnbbPoioRAq4dxkcDbtfme7qM+Wb8XXjENmGC4B260fM9Q1k+wYTRyHh4xx2GXQNykIGgWJQ8EZtyd/vDYpS3I9MdwH+8UOAkbx3oT+GXlENDUiH7gvnSlIgxq+BIAOL0r9jmNvmwL85c3uc71mukTl5ZNBPqbn85YatjvLmKEkKkq6Ws6Ax1A6JL/V+Fp8ohnmsXsgpc9fKNS+FY2rb73SglwRYZjVtilb4fOrIwyvQroLfAt4vyoEC+rPMJ4hQKbmR4cWoMeKpWL8ACciqY8ZFgZjNUSo5MjST7QZU/DLBS9n7oIvc5wc72EpJHytfTNL0u8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 19:26:47 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 19:26:47 +0000
Date: Fri, 20 Sep 2024 12:26:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Message-ID: <20240920192644.GW5091@mdroper-desk1.amr.corp.intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
 <20240920171223.64969-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920171223.64969-5-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 105c70c5-1268-4d81-0cc0-08dcd9aa2b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oh7OaPgA2RHUyq5yd3Ggr3qNuLsKGZJPZQgn5uUMv6P7BD/bzuy99T5wl8W1?=
 =?us-ascii?Q?CXkhryVTMaldQM318IBnE1/x5QdjHqxBwq/9SX2d4cKl42lUjSBcNKGqAfEb?=
 =?us-ascii?Q?WnrYIY17/AAp1QaMNKHit/IO53X0XA6MvbF+jgUunpu4I5UG0QoOKo1CVVnW?=
 =?us-ascii?Q?IY9D7mGo9+58d/TFaURgf9gnUYukBV9D2uUIV9CA3PK4bSQaXfGSREIC2xUe?=
 =?us-ascii?Q?iL826FLBNgcUnCbKzu7YwX50Z0k3WWSJKLXgcEmJQiXjNOj0cKkw50/y235+?=
 =?us-ascii?Q?PVfi+GgYnzxi+qnHkOGpyn59xCG1Ce8Bparqpe1hBYMZMmx2LnN8uVxWEY/C?=
 =?us-ascii?Q?ZFPaIEYEmkrGhfQBgLBSVRzbsUUjlHENq3Oapfns5cJHKfg5dyFM6TrZsGTI?=
 =?us-ascii?Q?delgcZOwtA+u3veo5PiEnqX0KSXeM9TOW5LsjIIU9A2EwKKhdySb0crY4XU9?=
 =?us-ascii?Q?8+ixoQcqXTMyR1uKhGE4Oh+9FE3IO3PgpIjY0o124xOFIDSGmsmm03M2gYT0?=
 =?us-ascii?Q?6oyhPfY9vaz+yykFWUmqqcsWu9oFQMga4GSrVlvmiaKQgYj0cxheSLLSOh1V?=
 =?us-ascii?Q?ra1xGwwkMTWbRzVH/1WKU65shyXTLFje3sfRMZVV8HRtcf5kS9phvDcp5MYK?=
 =?us-ascii?Q?BFqIxGcBzN+jKECSHa/CtsnmR1Y+Dodp0A3jrji5Fy3+h+h5cX3LbtTFNxcY?=
 =?us-ascii?Q?A2HU1SaQFKBbuNr5OGJqtwPsQ6EI+r1QAPF9LuJE5RDCOyq16deWY2dD8nFq?=
 =?us-ascii?Q?tM8R/D4+6hkiEapODyq9BVKc9B5w4PVn0m0ubJZCsV4eB0rQT3YIfcYzmDmb?=
 =?us-ascii?Q?+Vr7Uu/0yHICP6QGWk//44juofzAIdXnc77dCYWTUHimE9BGsY3+Vl7Mzd6q?=
 =?us-ascii?Q?DTYoi8Hx7lSAeQNrEFaFrPc15+coNgJn5sOObXm3JGRh5A74IwT4Fti8YCqk?=
 =?us-ascii?Q?QhCXhViOq3NYcHEv4vLj/qpNVwacDuC8UzVa4xzzHpp7lvu829z1tRO2Fxmv?=
 =?us-ascii?Q?vjQmlZ2L1abO1ylCHpYEASQLGJRLTnGJjCCPGfZxYIhDq5a1oQJMnin2C+jG?=
 =?us-ascii?Q?6oiu+TLI2h0LVr6mz+/MzFTKmwcnkqUHh7+J/Da+o9taZttWZ11Uu406DY/h?=
 =?us-ascii?Q?WFqdA02Zd4dg8xdOnVepmmTu9GrITZVEivapaduDhXIHS4SK8EBmZev9XlH8?=
 =?us-ascii?Q?72p7cqI2vq7ojI7Hhjwl/UmsmT0eMa9p+J1xmJ0Pk5X2ELWmciiQ7wXVfIFN?=
 =?us-ascii?Q?S4e00RAb2C6fq0JMEh88+6lIBn5mcK06Z0kdAyhUHcEBikkWqLBD+JFL6OwK?=
 =?us-ascii?Q?V067Q4u8En/8HbyLEPzzu6YGBFyj08I1wPjijsGWzYUvPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i1vGxVUohBGHmimanN/xEQ4xSluq7mEFBfPuOSKMZUx+A1sGTL1hV61ibzE/?=
 =?us-ascii?Q?q0vjdSUOenaoS+BhEWP13oiNhLHzRef+eMxIVGmKrCwnHZKNla6T+cNwKXlU?=
 =?us-ascii?Q?LL2nTaZM15IeOYkW6rI1aMnyjkHmeLYKLiBXc/PP20Iu662U9zeCLVxF3BPt?=
 =?us-ascii?Q?TP8crgq0zZ/OdpQzpftsbP1tNi6QPEF1lCzhHmhYyoH5Rzh9qk4fN7kshPET?=
 =?us-ascii?Q?PyASOhOUL68stKPhSakLdKlfD1YcPZH4OxbmmpupnkhW0595US5FMA6YC+Yn?=
 =?us-ascii?Q?cmST2yy9QMYOLowb1WIJ2wE6mitIqIsrR2WPtU5cwJYPdccdp6OHfci75ni2?=
 =?us-ascii?Q?QhC4M4QpzV51vtZiKMVz+m95VFtcCqVvwjx2ryU+amjm85nL13CAXRnwlwl3?=
 =?us-ascii?Q?dmmctvATCBuIUzOSupqrvpR5PAVm1kSYoBk1lgT8m/5Ypz4sf0BwsGzCTWnt?=
 =?us-ascii?Q?pv2ZDTphq6dQlRHnlk2z1aYvqhZ8rcKoawaVJEVh91fbuJgPQKniZBmksorS?=
 =?us-ascii?Q?atKf6MoKnxJX+6yDSoHD+9vDOw3ukp15sWeEivZhDydJ5BihI/2zPE07/XQb?=
 =?us-ascii?Q?9gcMoFfymQHkvt6AF50v3Lw42VvksWV+mRy+SZ0AGPK1Kw2i3rAvl6i2urzE?=
 =?us-ascii?Q?ThodHMOFJvtoToa+n4T+rtQEXTWEyL38+jtPUGgt6EHkvDYz2Vo7ra5OOYIC?=
 =?us-ascii?Q?+S9CM3X7T+EkUwP09xXNXwYCOUaVDLhhX3AGk56G7J/SBD2u0mcfzTTgiieb?=
 =?us-ascii?Q?Www2KPAPz0jMwyXxnAdnQxldBJpJSeHAklMGkzNlChhd9WjAu+/u73UomZgm?=
 =?us-ascii?Q?GjW0msWXLZkDYo5FWa76oGNgygOZLTiqeS8bCwHAfVLfhqK92rkFnQ41nPFd?=
 =?us-ascii?Q?RdIyZS+f/7y8AKP9FegCERfy/VyCHQzqlBVXCtF5EHjSyTpy+fbkX2EWbFLB?=
 =?us-ascii?Q?KnLAa1gGQzsm00U0RKs0H2y3PzcQ+I1Lw11k/EISMIvzxmhr2wSpkWoAO6xZ?=
 =?us-ascii?Q?fYwfKKAJQNf9ltqGEBNqLKB3Qc2+9rULVXzdnVwDKs9DI/7P14dMGhcVtrbH?=
 =?us-ascii?Q?JOx8M5XYX28N4ArwX7J0g9YJRJi68v6AjUIRpvbg/m0OI25BXqSHYXlA85ft?=
 =?us-ascii?Q?QA3rOTeEVLibC6UZ+N0MOIqEN2cuc6k8WHuJGL9KRjU+Octbam4moET1UPZk?=
 =?us-ascii?Q?dYbNiXntATosxGMDWAh5LfFdUq7xMMIGgWJFPnodtgaI4Bv/3ODDyvMAb3Ad?=
 =?us-ascii?Q?8M3GH49qiPCIOgpupFlZcCmXIltV/ygfkUuhBnaDXsynNeAxkPNFcLzOKZRF?=
 =?us-ascii?Q?8CFTxrw3SX/7eQXBZk0TwbsTTLuxKd4jJT4nDaIO3VSMf1mht2vJI8imHEWm?=
 =?us-ascii?Q?3kWor1sEV4dUgmMNPmCT3Qh+O+7t8BQw0AGeDkR8ny0V2+Zf6JAA2AGxkpIn?=
 =?us-ascii?Q?UkT4FmmqAztvxbjrKZrkJdwQz1TNzpjKIkz18nvKUqKpgLtJutjF5P+JELsc?=
 =?us-ascii?Q?YEsASu55/j5p+2KuLTSeA3Do3eMCXVXIMKjfQ7+M3OCD2PY3Fj//coZVy+s1?=
 =?us-ascii?Q?Q1VSRMIN4MfGzci/kvU+fEW1f20UBZ/DRCvaT6diZKIHLDam+Kb0Xv5LOq7B?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105c70c5-1268-4d81-0cc0-08dcd9aa2b12
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 19:26:47.1324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyyBISC43tPHYT6oOEzjUSY7hQcBwgsvmKhqDnWi+OK5spHxQkp2+gxGFHC2ZFuBbPztzcZ4fa1XbhqJw7YGd2qi8g9xDcKnQ/Q+L/kMG68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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

On Fri, Sep 20, 2024 at 02:12:11PM -0300, Gustavo Sousa wrote:
> A recommended performance tuning for LNL related to L3 cache flushing
> was recently introduced in Bspec. Implement it.
> 
> v2:
>   - Fix reference to Bspec. (Sai Teja, Tejas)
>   - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
>     Teja)
>   - Use SCRATCH3_LBCF (with the underscore) for better readability.
> 
> Bspec: 72161
> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 07315eb72eff..8d8f6a113a86 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -388,6 +388,9 @@
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>  
> +#define SCRATCH3_LBCF				XE_REG_MCR(0xb154)
> +#define   RWFLUSHALLEN				REG_BIT(17)
> +
>  #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> @@ -405,6 +408,8 @@
>  
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>  
> +#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
> +
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>  
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 230369f108ab..39f50b6f94ce 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
>  				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),

The bspec tagging on this one is a bit of a mess right now, but when I
look at the ticket that originally added this to the bspec, there's an
underlined comment there that says "only for LNL."  We might want to
check with the hardware guys to clarify if that's still the case and, if
so, make this one of the special cases where the tuning applies solely
to this one version.


Matt

> +	  XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},
>  
>  	{}
>  };
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
