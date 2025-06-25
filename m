Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E59C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914E210E131;
	Wed, 25 Jun 2025 19:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0knzHOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6989810E7E0
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750878388; x=1782414388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WjWPQhUauIJnGjL0Ssv2GvGG9BXLBBPwArw0fbOELIQ=;
 b=T0knzHOQdTqjWdmON7UyYAp2NRHQUsC0o+r3vjvT/MB8MdY6AXQs+API
 1NjskNLwyy+wXicPIyrq9h8iDjcQFPWc0Er7NokiDOlnBUeMU4ggoev/W
 SpGIRztlvRE08D+x0U0IWUn/d7IBA4xhfcU4d3N3Nalf5FJcl7D4L0IZu
 v86MQr2ekTvYbgsAKgFxp2lVG1LuUwYmcw7t9bkuAReqPV40t7RDfbfeT
 VBRTsyrUZSkEWorFVC2qcYbQhdhjqFPydiI0j6nJuA5yNyah69paVEkse
 0WYbF/ZkoindDY8zfFLXFfiyyhy/Ty9flGoyt31Xbp6A9IbkD2LcxVtTa g==;
X-CSE-ConnectionGUID: qlpFU1FgQDSPIoXYpnmovg==
X-CSE-MsgGUID: 46iW2dqrS/OFttARp0NTJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56964737"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="56964737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:06:27 -0700
X-CSE-ConnectionGUID: g+VhGUbeR4umnR0EXzkm3g==
X-CSE-MsgGUID: zRksecnBQsyO2qszy+46hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152602413"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:06:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMZufyg2m1QVBWoptOpDc925pA/s568I0bR7bLezGvHu29jPVxh1rKtTxM4mJWeZ3IuK/FewQkNx2aY+mqnEyLb98QTAQ7uMIwNHlPKTIlWCo9xeRX62jqA+2ubej9HgJ69Qgr12dUVNLN5SBoN80AwQfRSa3FBdPYd2m+5utKbDChnzo5fmQoma1qny1HDCWTrefvnNl6c+1VqMyduOGI7E2+RjZCMiuN7l6OPqw3brOHuylLuzzgH0ArkZf2cd57BOAtfZXLDcDdrIUR68q2jwET2syBLFfpDPuaGmgKsp7ia7NpUh8xcX8tQRdfe9O8WGgdYG/KrFmCV0kYtdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJMpEJp15XMpGEIFSgFqpex6ydkofH2A3UvtcNzkfLc=;
 b=mwyIDvbMZmEtO4WIKafUsCD5ilk3H+fBy3LwGQLsEhOV8wgb3InjR03MhJisyLPpUFy6wgggZzltnUIX7UGz7Kw8i65hD0abmj+ai7P6PZvc/Wsam6P+1tHALs7HILGaFixW2A9/iuPs2dmWFVSISgX2v4X/iHyEtLTP3D4HY0bgSpb96yvjq91wHZTtfzuQ9uAirgcJ5apooYuzF5V2GI6OPvBaor1MQYg4JZhY5a0B7yGaro8USBCBbrPS8pj2iuWL2Xv2O6aTW5fMxmIfcjhJ9yvi6BNfbzIj+tl1wBIx6lOr/ucIaPdr0L9KAuFVEjOl6/bpvFKqY4To5J8sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 19:06:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:06:09 +0000
Date: Wed, 25 Jun 2025 14:06:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 03/11] drm/xe: Simplify GuC early initialization
Message-ID: <3ffxfhx22vqidr4es7rfnch4h7qdjusralu2ujeyfeollbfvqt@75fwltvdxp2y>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-16-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-16-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: de098762-49f6-47d6-6edf-08ddb41b584c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xEbuQ8UugDe/JXHW/ltESWxJGsBhfrNbzazrbqDmtLICVv3VhlkAUyNvjkEB?=
 =?us-ascii?Q?xNvmxTXLyf4SaUoqqm9a7bWrzxh4yLVOU4WyXRq0DMffo4rINBgdyoBVCAIh?=
 =?us-ascii?Q?xUQnRUpYZ4cMs+Kx4gD1+WgAI5ZWbKRTjXoFyN+Npc9VsG1SJD3BUgw7oVBA?=
 =?us-ascii?Q?45RnOiYCiF8LCGYu84hEzcjzJ7QdNUH5xqeIt5XyoYpfY1X1GH0VOxyeooUT?=
 =?us-ascii?Q?OfWkkl3mjtM7ncg+48Ws03YcF3CH+FESVOty2aotCbYVdJH+7LHXpQzBKGqU?=
 =?us-ascii?Q?wKPKa3Cs8iuKrnoyRQ31iotA6OH5LBIMay59t+YnwmirLGwAnp7nFEevGqgX?=
 =?us-ascii?Q?n+Ngy+hLWQwZi7z48apNxYNmoDENHmxrshmgY/+/ipb7hYsB25cGZ8/8i+Y7?=
 =?us-ascii?Q?l0T9yllKhY9gQYitomMxn9++nh/ZOy5jFaGbVVRSD7RQWHRaUwRHf0FB7LMt?=
 =?us-ascii?Q?O3Lq8UyhdnexOVIHeZrCcbaJGv605PxTTFA2d3J9KXlCIBncUEjHq/paoXE4?=
 =?us-ascii?Q?XBbTmlaxy1klrRxHhqcAq9DxSoQeEcA7qpxi5WuVYOzfdpDIXxlsTC8IWoAe?=
 =?us-ascii?Q?UfjtmcdV6Xw28bln3D3SJXuxh6TTY2DX8myO/QcM93JF0a9sCqGcisMhzY38?=
 =?us-ascii?Q?4awVfh1KEmVFVSUx92HY1weC7Th/Aza8YVSfhHA9BjoZQIBWW8heXW+rJFHR?=
 =?us-ascii?Q?gqvenIKYzT02e8n3jxlRbFj5oyxMA4T1Rh5EAOYIarFjYyDKlh17Suy3dzq/?=
 =?us-ascii?Q?mnFDpjJEq8vNsXGllYdwMVuIbswTUUoaxzIOchfC+zRyYbIXIVRfRsCtWOhp?=
 =?us-ascii?Q?l8wHTDhHHNcVFxJivnXFOgka7a3PKxXfFW5o1KOiVrNJIJNnfgLXzSTdYV7X?=
 =?us-ascii?Q?B6gnR1hmxponYXQtAKkC6aP/TKqDqeQgnim2r0OwR1Hkzl7CAqfpz573EO5x?=
 =?us-ascii?Q?a/M2qXbD6a9Vbq5M1/YB264VNC/PIvqYO8cCUlrC0Z6+azVsoPagWFkHc9iF?=
 =?us-ascii?Q?Gyz6s65d5Li5szpraXxhF2ifgfm4MDM2rzJfpEFrfQzf6FbJmm4+BnWf5OnP?=
 =?us-ascii?Q?8ebLDz6TaI6WqnGMYA+s6jwjwv9Cdjd/81XQ+c24bXpuAJ5pXDYA/ZE1m0qo?=
 =?us-ascii?Q?All6u4Xr2sv8VKSXhSiIAdHnre6ikV6qiMU6z9jc2OhNoRBTCgWgPUAFiqaN?=
 =?us-ascii?Q?wJ2H1SqW7R6ttoM836momrD0UXIVXmJzqiGn1xKp7/JbORJ89uHSEnRDqFaR?=
 =?us-ascii?Q?IW2tUywNayQu1nhpkYbNFNAHccYXNI3wbFV1UqtI0B5nYxVBgN5CtMB4rkc8?=
 =?us-ascii?Q?R4MhOlx4O+7/KHQCqYiTAdrPWSiKCguuMd//PJZwzGPkaH4pMbvMBqF1CeB5?=
 =?us-ascii?Q?IHsFMge95P2n1QTb3DflTPOIcmiJsiyQ1wn+jW0wiFwvmBgKumDh5TyfVc+F?=
 =?us-ascii?Q?FZWdB1IIjGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41CyZYSMQeQbH7rAcv6MeHP5lxdHABqCBmtw+zIPfaNGRBt1NyLQHSMuKoyL?=
 =?us-ascii?Q?EjDq+EGKb3LIu6/aM5OXggHRZURhouV7GqavtQULKzuxjlmy3L/ZpW4Tg3Qs?=
 =?us-ascii?Q?gjvL6/OWOjSjkreKKgPbzditjCAjRTXmE/F8E8VQr+PzFQUDn85MbWV2SLVN?=
 =?us-ascii?Q?KT9E1fEN5mu+wDXwZw2FD4gMhYFrcwCOWmTYBYegmm9W65VZhjML+1du47EI?=
 =?us-ascii?Q?iAEreUh5yga+QX8qEgC26c88kEnSzKx6z+iVDC/+nazFV0rmSEttyeOJd7Mz?=
 =?us-ascii?Q?XqjjjKdmT41wuTIer5Zp6+mcg9QZtGrhTjeriFlgG9EglgFxHlfiNZu7k2di?=
 =?us-ascii?Q?hZy4P+aVrSmvfJ/dDeecpBulnCTE9vMDImWv0fVkZSCdkA75bmzPDre5OxZ4?=
 =?us-ascii?Q?Ig0HRQXC710hOeGbR56+XDTGCW9AVP4qPAvKrXbrl5qXIddIXtEI1bxT/Jml?=
 =?us-ascii?Q?FymKMdEQlypL84ZFg8Fs06PQIsxLaZfKiBlbky6nIAtrbZ9u4Gmf/7MNyPNt?=
 =?us-ascii?Q?mRRWZKq8q9UflFkR9q5S0k3P9+LfejE+mssjuQmw2tPgX+vlNXSjrK9lvBS/?=
 =?us-ascii?Q?ZifTA9e94qw/AQwJF+6Y0ufRCzQx54X81HtWsM2M4OVC5o1zePeyHJbE4Igh?=
 =?us-ascii?Q?kFwZwCmQEvG6sQLa9vnLo1/d0FXosDQx6XDcyY2azulxbRe1A2yzbiOr9JN1?=
 =?us-ascii?Q?G3qbAfQxU7JOnh4X+x+/dIWx4GJFpns1CU+F+whsYmfafsSv6wPF7wP8SiU9?=
 =?us-ascii?Q?8OC/SLsgc4Qx5LYQ+ABu3G2ing/vWcXnCfckmZHjoDJqazx0cVVjTYwwJxXj?=
 =?us-ascii?Q?uwWmRguJOsmz3xt2HJ5v2m18GRO140NoaZuPEhxhbh+hNibYJ19gQDdEbppu?=
 =?us-ascii?Q?U/VyaiZqiRNyp6S037PvKkTrPLXj6jyNJlbQZD23ygg6yqDJq1hMjrGdqa2J?=
 =?us-ascii?Q?HHOJkSE1oyrg5aDIgjdK/yBF1b5Xw2gCXIxXfX7XC7lmsVQB9QNG0sgAOwqA?=
 =?us-ascii?Q?Af0bHZfLLD1iz+RIoaojjqADWgQpLpPqHaugmEjERi848Mz/8R7z+AvpPPEv?=
 =?us-ascii?Q?aquiI+2FQSTlllv6etu0Y9Xi0d3Tu3FuHytG+PPwxJ+F64SoMlBY/KaCbLiq?=
 =?us-ascii?Q?nNmTV2s8e+GLkl3DA7sRC5gU++ZlVliYkz/QgOcfr5UvRGQg0LgjfiRa6Hge?=
 =?us-ascii?Q?GWnLxzcLlIpD4E8fESwCdOn9+8CZ6hO3uw4E9NP+Qw7/b8kRWZ19H2/3Xhgr?=
 =?us-ascii?Q?gQtc7omOQWL0wzEGLRrqL5dGXPWYOHKEB88eUW+Do62l77z1whWrAaEFR+Rm?=
 =?us-ascii?Q?e7OPqDgiMKB2MFqI7owm7ofgiKpoMU8Qo5KSbQHx03Zka0eK+3mQCAAIF1rx?=
 =?us-ascii?Q?og81Do04iduCZn+xcGgB9jIykFL7NxPZSeVCnJ5EdoGCEd7yDMNo6WaEp+MN?=
 =?us-ascii?Q?yUClaz04npKmfoQG7OVpw0pflm7tYSogoDKeX5mYBuwkaA41gQpJf1w0YOa+?=
 =?us-ascii?Q?SrBcrs+9Qi+vBr5Ez9LanKoH6XGAL4JRq2I7e1Dfx8nGSGf4uANCVv1cxZSt?=
 =?us-ascii?Q?XWJ+jg2xA+7PTSvdhglAqIWxoCA9EhZWE+BlG9k/+6l2b7FuriYRn8H3XVhG?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de098762-49f6-47d6-6edf-08ddb41b584c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:06:09.6835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmRDDt2pd+xQzgs/SOFUw/O/5wPfoX3xCLJFX1FuNxIEPKVKjen/m6zacLEc5DDIlNIvatCvOb2NYTj4Q7qK/FC6wEdhtwU58AN5xHnCrK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
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

On Thu, Jun 19, 2025 at 12:49:02PM +0200, Maarten Lankhorst wrote:
>Add a 2-stage GuC init. An early one for everything that is needed
>for VF, and a full one that loads GuC and is allowed to do allocations.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_gt.c     |  2 +-
> drivers/gpu/drm/xe/xe_guc.c    | 51 +++++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_guc.h    |  1 +
> drivers/gpu/drm/xe/xe_guc_ct.c | 28 ++++++++++++-------
> drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
> drivers/gpu/drm/xe/xe_uc.c     | 16 +++++++++++
> drivers/gpu/drm/xe/xe_uc.h     |  1 +
> 7 files changed, 70 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 4370a4db95e05..6bc793043b400 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -426,7 +426,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	 */
> 	xe_gt_mmio_init(gt);
>
>-	return 0;
>+	return xe_uc_init_noalloc(&gt->uc);
> }
>
> static void dump_pat_on_error(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 81b22b6fb2493..eeb23f8aa9de8 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -627,21 +627,11 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> 	return 0;
> }
>
>-static int vf_guc_init(struct xe_guc *guc)
>+static int vf_guc_init_noalloc(struct xe_guc *guc)
> {
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int err;
>
>-	xe_guc_comm_init_early(guc);
>-
>-	err = xe_guc_ct_init(&guc->ct);
>-	if (err)
>-		return err;
>-
>-	err = xe_guc_relay_init(&guc->relay);
>-	if (err)
>-		return err;
>-
> 	err = xe_gt_sriov_vf_bootstrap(gt);
> 	if (err)
> 		return err;
>@@ -653,6 +643,35 @@ static int vf_guc_init(struct xe_guc *guc)
> 	return 0;
> }
>
>+int xe_guc_init_noalloc(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	int ret;
>+
>+	xe_guc_comm_init_early(guc);
>+
>+	ret = xe_guc_ct_init_noalloc(&guc->ct);
>+	if (ret)
>+		goto out;
>+
>+	ret = xe_guc_relay_init(&guc->relay);
>+	if (ret)
>+		goto out;
>+
>+	if (IS_SRIOV_VF(xe)) {
>+		ret = vf_guc_init_noalloc(guc);
>+		if (ret)
>+			goto out;
>+	}
>+
>+	return 0;
>+
>+out:
>+	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_guc_init(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
>@@ -662,13 +681,13 @@ int xe_guc_init(struct xe_guc *guc)
> 	guc->fw.type = XE_UC_FW_TYPE_GUC;
> 	ret = xe_uc_fw_init(&guc->fw);
> 	if (ret)
>-		goto out;
>+		return ret;
>
> 	if (!xe_uc_fw_is_enabled(&guc->fw))
> 		return 0;
>
> 	if (IS_SRIOV_VF(xe)) {
>-		ret = vf_guc_init(guc);
>+		ret = xe_guc_ct_init(&guc->ct);
> 		if (ret)
> 			goto out;
> 		return 0;
>@@ -690,10 +709,6 @@ int xe_guc_init(struct xe_guc *guc)
> 	if (ret)
> 		goto out;
>
>-	ret = xe_guc_relay_init(&guc->relay);
>-	if (ret)
>-		goto out;
>-
> 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>@@ -702,8 +717,6 @@ int xe_guc_init(struct xe_guc *guc)
>
> 	guc_init_params(guc);
>
>-	xe_guc_comm_init_early(guc);
>-
> 	return 0;
>
> out:
>diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>index 58338be445585..965bf72912009 100644
>--- a/drivers/gpu/drm/xe/xe_guc.h
>+++ b/drivers/gpu/drm/xe/xe_guc.h
>@@ -26,6 +26,7 @@
> struct drm_printer;
>
> void xe_guc_comm_init_early(struct xe_guc *guc);
>+int xe_guc_init_noalloc(struct xe_guc *guc);
> int xe_guc_init(struct xe_guc *guc);
> int xe_guc_init_post_hwconfig(struct xe_guc *guc);
> int xe_guc_post_load_init(struct xe_guc *guc);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 37509f6195035..20359a8d4bd85 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -207,12 +207,10 @@ static void primelockdep(struct xe_guc_ct *ct)
> 	fs_reclaim_release(GFP_KERNEL);
> }
>
>-int xe_guc_ct_init(struct xe_guc_ct *ct)
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> {
> 	struct xe_device *xe = ct_to_xe(ct);
> 	struct xe_gt *gt = ct_to_gt(ct);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct xe_bo *bo;
> 	int err;
>
> 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>@@ -238,6 +236,23 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>
> 	primelockdep(ct);
>
>+	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>+	if (err)
>+		return err;
>+
>+	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>+	ct->state = XE_GUC_CT_STATE_DISABLED;
>+	return 0;
>+}
>+ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>+
>+int xe_guc_ct_init(struct xe_guc_ct *ct)
>+{
>+	struct xe_device *xe = ct_to_xe(ct);
>+	struct xe_gt *gt = ct_to_gt(ct);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo;
>+
> 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> 					  XE_BO_FLAG_SYSTEM |
> 					  XE_BO_FLAG_GGTT |
>@@ -247,13 +262,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 		return PTR_ERR(bo);
>
> 	ct->bo = bo;
>-
>-	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>-	if (err)
>-		return err;
>-
>-	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>-	ct->state = XE_GUC_CT_STATE_DISABLED;
> 	return 0;
> }
> ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>index 99c5dec446f23..18d4225e65024 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>@@ -11,6 +11,7 @@
> struct drm_printer;
> struct xe_device;
>
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> int xe_guc_ct_init(struct xe_guc_ct *ct);
> int xe_guc_ct_enable(struct xe_guc_ct *ct);
> void xe_guc_ct_disable(struct xe_guc_ct *ct);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 3a8751a8b92dd..0e9ea57fcc88c 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -33,6 +33,22 @@ uc_to_xe(struct xe_uc *uc)
> }
>
> /* Should be called once at driver load only */
>+int xe_uc_init_noalloc(struct xe_uc *uc)
>+{
>+	int ret;
>+
>+	ret = xe_guc_init_noalloc(&uc->guc);
>+	if (ret)
>+		goto err;
>+
>+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */

checkpatch error here. Other than that  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+	return 0;
>+
>+err:
>+	xe_gt_err(uc_to_gt(uc), "Failed to early initialize uC (%pe)\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_uc_init(struct xe_uc *uc)
> {
> 	int ret;
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index c23e6f5e25141..b573b7731f62e 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -8,6 +8,7 @@
>
> struct xe_uc;
>
>+int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_hwconfig(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>-- 
>2.45.2
>
