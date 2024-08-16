Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE23C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067AF10E7F8;
	Fri, 16 Aug 2024 15:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzmPe7xV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E210E7F8
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723822509; x=1755358509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/b10OeIxfUcFwGyQOil0LWN2kQXjMYXT1da5derPhMk=;
 b=gzmPe7xVUpB7CHNqpqrSWaeZZpZLdgv3HyWMLvuiQ+W1ShzcMSmvI0Px
 p4TYQTvRM2E/jfFuCWkNJ1jqLSgas0LfAdrrOzq1ZG3c1oO8tZTrCDC2x
 dXHWkbp1aZh6myJ3taWdW+0Xm8LMAEilllWxBKsQPHI5QUs+DhXHky/3u
 kfg/9JeUXn43JG1jlNMc4cKuFYivetrTMX+9lpTlQPWV3EmGX4VGyIwnG
 lT5h0PvCanm1oeWU3CWrwUrz5AVG3NNlRhzKiaajof25tVJo/KThFtzuZ
 zBBwKPKJC1P0HD/agzgFkZkSSQik16/dsrWVjSl18R4FsReyE1VdNaBf/ A==;
X-CSE-ConnectionGUID: md23fS+6SSu09UlQH4qjTQ==
X-CSE-MsgGUID: XUYWYUfURQiPxVvHn8xQxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22269215"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="22269215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:35:09 -0700
X-CSE-ConnectionGUID: 7l7qRHS6T4270QUu+yb9jw==
X-CSE-MsgGUID: tLIX7jLYR4ykj2LkCU5xHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="90431878"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:35:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:35:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:35:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:35:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxXLEQ44ZqzASHobbTjc9+gAKDc0gSSRBf5rhdo642C27Ft30+5c6OnQmhq6O66Au6SVYlNtozfGoXtNG1o4oc6EtzxsrXs1zZj6KMZkBKtjqztdkBsNY/Pricafq/aMlNqVqlbgg/cYWnVNKuA+tW3h4nR/y/udePbXOzPBIBy7FVKbjtYP/I/ExcmJqRcfgvuAMWDYtTpKxd83PstluK2wJDMjaPmnJazM1h+ZjrBIwRvyeVFBUg3PsET5hVAorQ6J3uKIhbOmzgn3THvi5Mahug+EEHSbBAaRxE2lYrrnx17rGZBfN/dXeFzEk5gBrDAMouBQOllN2ifCIqkWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPbFZM44Z/PJuz/0q+mwbirq+uN2gQjdzNmL2CoDZ1c=;
 b=rIXrvGhu9qx4MOd56J7QNYJvfpabP4Hx9L9rRfTGTV6pjN4yg7Z0sNw+DxLEsVh4LzsXhz9OFFNna5xURcZ6mhBgSNrZ98hGtVcd/01+JIDMK5R0R00y8UE1WbyTl/Kd1QILY427ILHPGi12oSXG2wo2Ri9elqn2f1ufZOazfD1buGgMWbPmMmLzyKBHVuiWuk/Fn+42diSDzmoCxA9Jm8ToQwRsK9E02/MxWUkbusDuo8s0hFnNFCvEm7VZklWdkK1l0KrtlM0dt5NSpOkjv34ys3rabMarVbjn/l7G5irq5v+bfwAiRxuBd4YTImKdCyZmECKV77dV0zn5KFMeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 15:35:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:35:04 +0000
Date: Fri, 16 Aug 2024 10:35:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Message-ID: <4nangwn47ci2n4ajdd325gfwdmoxsa7pew5es6ceq6dmzg5c27@ub57yqeliuhg>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-8-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-8-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0389.namprd04.prod.outlook.com
 (2603:10b6:303:81::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fb16a1-1cdc-4338-080a-08dcbe08ffb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YBCzK+/6rXVr/ngFQIuUknFsPMyQ/bq1bGhGtvR1NAs5J22ndm0XKlnSSIrz?=
 =?us-ascii?Q?qdhihzwH7so9p1SYzgxc0Ky9pNQy4qfqnANsKxeQxR6bqwHjD35GBVGdy07q?=
 =?us-ascii?Q?QmDwl5lGl8Y+QlxLseq6PhLuuT1yogIYRlbaYM0TYpFqbQuir14dJ10Mau4B?=
 =?us-ascii?Q?Er4XUzFAdVm21Jt6IHAy0+/iDaj0kfUWoGhEoUjPXNhfeQCFiPI+FQlbrJgM?=
 =?us-ascii?Q?F41xsJAxakL9u67z9yPjazywYme8x5B2RH5mcuE+btohXCf6RK+b7m/H7Sau?=
 =?us-ascii?Q?a3UtBngOSW+ALpM6nczRASMnp4YnwTQoKjIIKhKgMJSr2W9iiD/1R2PR3smE?=
 =?us-ascii?Q?y1FXICpIlIBwTbMC8+V8chspsYpYgnLkwUzCM5NvavvR56S42dvW7bexxeLS?=
 =?us-ascii?Q?czmvnm5XOCoZUjI38gKD+nLL8UmYVBgisvpR1nEJK/rM9cQrJRtK45N+eOEA?=
 =?us-ascii?Q?bBRUDpiEKHYcODw4is0h67bhFxpBPD3BKKKExFmQ96CnODmnJjJ/Lbn/Cemx?=
 =?us-ascii?Q?dXzDjTzsSBYBQxvAN4UrKCn2ASJTW03KywQsb9dVnNRD3rele+1F4aq0NCIi?=
 =?us-ascii?Q?8sZFt8TkpkYJ5TYINTWitUzGlsF4F/KKlcuu4NAqr67yqjsjsQ5W68326s3H?=
 =?us-ascii?Q?2sDJRG3sBPcvWM4WjMZaNhFrKiSh7KF+he5cXPVo/aDztuL9KKWQuGzxwwY/?=
 =?us-ascii?Q?+kxD6whkhys76LfiwOBX/cL1vDJbJQi7LN1qCaQgjVVkVvpBViSFVSD+/9WR?=
 =?us-ascii?Q?w0ok98nEyG7Z+czHLVclf/8srNFlOX/riiXVissgz7I+I6gVVwriXgTd4rtv?=
 =?us-ascii?Q?BG3Anw2bz+cYF+Iy11ZE9PdY666Abb822ZHR2k9F2fJyw/wEmxugdOtUQ1Wf?=
 =?us-ascii?Q?qgI8kGyDli5HkNE/n9yqAV9phskjRdjyRybdu72bKLoYdQZF7qk7y72DaO80?=
 =?us-ascii?Q?V0u0ZEBIihFQgb0qYBsQWEpK1pxuX4DnXs5d4YaYlEWNY3HG6F93O+oXqFO5?=
 =?us-ascii?Q?eRDujh4OgYqf5MirXXFYJlokisk6MpWU36brsCWFtxoXs2mubtko4wn/YcZJ?=
 =?us-ascii?Q?toOarycvaIoC1X8uMpGXjBxfP4gVS4Ax1QErPX9bxSu3y1WWZJIONEs/ikLl?=
 =?us-ascii?Q?CkjNJWJ4dbj+ymtsxYBIrcspoeEEIa8bGeGlh8AsJ8gQMLxo9WyHDsvC3png?=
 =?us-ascii?Q?JDrmP6CLt2eYr1JUMmlAaPDVugIphoA1FV5eqa6xMeDl3UGjB24NxI3cRDla?=
 =?us-ascii?Q?XzlEYXtscnty0duBptiLSQqy+bkZZJae92W85Sp/v6X7dluHjucFVCOQ21Pa?=
 =?us-ascii?Q?Yzlq6xWlP7cubSgTfqkwyOd6Q1WIM+bXYLRiMpptyj2pCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LRzN2MVZ5ni4tq/B5DiNwOQqESW3gLr62pZtiSRXoRv+n3On1XqVv8E/9++m?=
 =?us-ascii?Q?+U4KY8LPX0bwSeWz8r9/hKF3vZCKB4sAN5a979kpEj13HT1ogkuH6qNNJBYz?=
 =?us-ascii?Q?Wbqt7rkgpxSznYb4HT0XkX5HvmLVwwJWNOCJcMzjxQlo++4xkRMfb+AfprZk?=
 =?us-ascii?Q?UHI8vi5U4x8iDnRpTp/d02VJLXEAxdm+6hp9nwsAamY+OqStutpQ/3WY9MhN?=
 =?us-ascii?Q?PPrb8jXTnp08r83HX49fM56yXWDLtBcGVeG3jD/u7D2XHn1j6H7jzdojxOT2?=
 =?us-ascii?Q?syahN1KV2Mf39qA9EZRIhMUvEwbPhdSNwcchfqwRS1gN4yVsuJgwgaPB49vD?=
 =?us-ascii?Q?FL3EFFpWgEaB7K5ivIOPtUbaScE7gKzdUv8oQSkXXmrfgWYUDK1qkxlwlB+q?=
 =?us-ascii?Q?1bDjhx+4PkeGm0lwPgZW+1MDGWcxM9OsbT6uz2GH53Xfm3WEQDCJmqNpkbq+?=
 =?us-ascii?Q?joTN5CNUC/ILmlusD3POikw3dH/YfSj/zFhUdP7Jj/Z6RRkSFXclvbrtjmAi?=
 =?us-ascii?Q?NYlXZvyLNN/j14wmGUYxRTaRxHzmZQcZ5qhTaW625ipHl47/Z0c8Vluy6oT7?=
 =?us-ascii?Q?S5SrXuRrZ826hWIArq3DsFITQMHywMWL5JJ/0/epsb6/RCaH6GCfjhHCA22q?=
 =?us-ascii?Q?nevJzdvnnXssVcm5lWkAKOnuKCgToMnoVRyp5RAvhhMAK6y1/4l2Jzh5H1oZ?=
 =?us-ascii?Q?ELPbpxTZCyBwf9PXPPJjHchaMgLeNmJehbTmVTbBZ5GNA2d1TE8ivoAznsgg?=
 =?us-ascii?Q?uoGQKs6VB+5SHEd3MyIFLAsArQt5LWzGfdAsRHLAfaBQ1Hoq9312GPBIJn+6?=
 =?us-ascii?Q?pvx6RPN3j6ZgWN3a+I6rg3sA7e5bDEsltLSrTwslc//PAZEOhPvpiS6Cwzr8?=
 =?us-ascii?Q?uUaAydwrh7cuUF3NuEnemzJ0CpQSGn0512e7kZaG/nEMJNNbpqQlXtvi9WhI?=
 =?us-ascii?Q?R+c7elQbfsHzSoFnnFTCxYCRap2ulSevkEBJ5sOIjspAwLrZsv3UNtgzDFpD?=
 =?us-ascii?Q?5ZOBMEb89DBMZf3PmJU0J2F3HT+Q5I2yxRogGOzB0e7rmUbVM0cm8LwZ2drK?=
 =?us-ascii?Q?42mRy1t5/HaUSMxop8eXfh1X7AQwIlDeK4De56G83vI+0hokq1UxenanGxBV?=
 =?us-ascii?Q?nSbuXxbyBiSWB7TgK++dq32uFxlCKZ3ZYfEqJUUG1yI9M2Kw3Nexu+D0fX3z?=
 =?us-ascii?Q?iMrmopa3HaQmpafJT7UlQ2WhFG5p0BgokAt34z8H9LcWcjqcietOtF/tHuqp?=
 =?us-ascii?Q?I4uJZaJWzqjoeU/TM2pJnQxj5UUEIrdxIYiKn7xrWI0OVFg3O0aXFchAg9wL?=
 =?us-ascii?Q?y3anmmhZwAk/ir0x+QMEegsAH83LdFWKKJjNWvrfJRLYdcy5e0DS50eh7MgI?=
 =?us-ascii?Q?ZyC6CFQzsggZlAr/Gwo3E/UwE5vQse+e5Xv7tzt1AxYfcJeXQDUM/0urCyv+?=
 =?us-ascii?Q?evsJhq88Jajezw+v1YjqiZJL1i4R/rThJ3I799WpgqDh8Pg7vaRFXJ1Nvffa?=
 =?us-ascii?Q?l1FonbCka1hXzhEzpHQQ7OX4miCX/ZQJTrthCZcljELw5sc7itcNMEZZI3Mi?=
 =?us-ascii?Q?q76w7yBsT6UDbZS+cXl0g1wu7oNArOnRNk3AOvW4wQRR57W/TIL0Eg6ny39H?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fb16a1-1cdc-4338-080a-08dcbe08ffb8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:35:04.0647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpNqsTy1TFoH0ytRGkDZrh7XFPl7YM0pTDOTTMg13fYo9Jz1h8VTtylA5c1u2pZ+BRPplS6j+we4xXgBCn9P/L569LtaPBgGKJ/KUMquB1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
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

On Fri, Aug 16, 2024 at 11:02:39AM GMT, Rodrigo Vivi wrote:
>Introduce a new xe_ggtt_largest_hole helper that attends the SRIOV
>demand and continue with the goal of limiting drm_mm access to xe_ggtt.
>
>v2: Fix a typo (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
> 3 files changed, 38 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 7c8bbaa30fca..2d055f489879 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
> }
>
>+/**
>+ * xe_ggtt_largest_hole - Largest GGTT hole
>+ * @ggtt: the &xe_ggtt that will be inspected
>+ * @alignment: minimum alignment
>+ * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
>+ *
>+ * Return: size of the largest continuous GGTT region
>+ */
>+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>+{
>+	const struct drm_mm *mm = &ggtt->mm;
>+	const struct drm_mm_node *entry;
>+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
>+	u64 hole_start, hole_end, hole_size;
>+	u64 max_hole = 0;
>+
>+	mutex_lock(&ggtt->lock);
>+
>+	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
>+		hole_start = max(hole_start, hole_min_start);
>+		hole_start = ALIGN(hole_start, alignment);
>+		hole_end = ALIGN_DOWN(hole_end, alignment);
>+		if (hole_start >= hole_end)
>+			continue;
>+		hole_size = hole_end - hole_start;
>+		if (spare)
>+			*spare -= min3(*spare, hole_size, max_hole);
>+		max_hole = max(max_hole, hole_size);
>+	}
>+
>+	mutex_unlock(&ggtt->lock);
>+
>+	return max_hole;
>+}
>+
> #ifdef CONFIG_PCI_IOV
> static u64 xe_encode_vfid_pte(u16 vfid)
> {
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index f816b3c0732b..31060fe7644b 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -29,6 +29,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> 			 u64 start, u64 end);
> void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>
> int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>index 947750d97d7d..1852ff45bea4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>@@ -590,30 +590,11 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
> static u64 pf_get_max_ggtt(struct xe_gt *gt)
> {
> 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
>-	const struct drm_mm *mm = &ggtt->mm;
>-	const struct drm_mm_node *entry;
> 	u64 alignment = pf_get_ggtt_alignment(gt);
> 	u64 spare = pf_get_spare_ggtt(gt);
>-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
>-	u64 hole_start, hole_end, hole_size;
>-	u64 max_hole = 0;
>-
>-	mutex_lock(&ggtt->lock);
>-
>-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
>-		hole_start = max(hole_start, hole_min_start);
>-		hole_start = ALIGN(hole_start, alignment);
>-		hole_end = ALIGN_DOWN(hole_end, alignment);
>-		if (hole_start >= hole_end)
>-			continue;
>-		hole_size = hole_end - hole_start;
>-		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
>-					hole_start, hole_size / SZ_1K);
>-		spare -= min3(spare, hole_size, max_hole);
>-		max_hole = max(max_hole, hole_size);
>-	}
>+	u64 max_hole;
>
>-	mutex_unlock(&ggtt->lock);
>+	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);

optional: I think this would read better with a single name for the same
thing:

	max_hole = xe_ggtt_max_hole(ggtt, alignment, &spare);

Anyway, checked with git show --color-moved to make sure it retains the
current behavior.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
> 				max_hole / SZ_1K, spare / SZ_1K);
>-- 
>2.46.0
>
