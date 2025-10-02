Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26FFCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4B210E7EA;
	Thu,  2 Oct 2025 14:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrW5G9t3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0910E7EA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759414231; x=1790950231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iZjUkAANwXBenWcoDsseW+T0yOrWA3Kge81mpHl/i5c=;
 b=VrW5G9t33yuIDh7M2L+hJRCfz/qR+y6DtdjmkkfaAZx5cVhnBG0zAy0Z
 UqX0hIlLtJhaajtcjf/JpKKrDnNuMphWNN9XEC3TS13g1spqk3Jh7GcXB
 IZoq+KL+Db8bkrKqB5h8QCfM/sOHuOF4+FRRQdo+XimBekWazRl+ZLZBF
 GxlSvGcZu7QdsjwekJKWjeq1qR0FuAwS4wWaOlDdBUezY4odPZCG+a1CM
 1eP54D/t9sr9f2FyMsDOK0gOBqoOwzfiV1QF7zMnRxZ9+7tXpGC9Ej51H
 rJOdO7FN6MWmNbLsAaCNrUivJKSJtakBB+0CTkCqXyd7Jv9e69kAeKFzO w==;
X-CSE-ConnectionGUID: vzCBQu3iSy27ifk07crDeg==
X-CSE-MsgGUID: Xqv0RqXjQO2Ni1oNMilxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79346901"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="79346901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:10:30 -0700
X-CSE-ConnectionGUID: wHg4ScacT3CLVoT095nCsA==
X-CSE-MsgGUID: tYCOwRpvSw+NU8WYe4ZJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179069492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:10:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:10:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:10:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neRdn/hNrdvrAfv/1SdKkLii92tU9cBL7eooIvl+L82CJWrSY4yNdoDaSPwmuz2tRru2r1QjHLwUpYqNvpWFGUMaiyDm1EcdunYsJxYbHkmJsQ+w+Bgt7sFmQSfsKFZV6YIDktjbRDhVXooi5Ov1UaEMybDFi9dcOC9Xq8tBreCMYrg6zrgWr3UZea5xAjWBt3pQmvBA5UDCG5wd6j1cXE8/WcwRVOIp/79MwbtNsqiAAXN3vQj1603NjipaLyDMr5lcsDA034Sf8qHFFhNwhYSy7N+rRwA57H/aYwp0ZpifYHjd/sT4ITucx+2ngZ0z803AnmPZ96HPFYIm/q/q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaDscqLys25X6yAG1btqY6U37byyeZrUUXslat6Qu7s=;
 b=C0OcA+nWu2tjHWLSCmG8dyUR1D5iugRRVDnlttcV+BiaL11DCf8/Wvmf2Ob3lgkYYcCW7uoWFbsaUW5Fsxgf6sCr+ECGTFBU1a+/WqAftMtC+D45aSSJ7TbdvZWTd/AfTitpkCWNjKjPXtP0apdDy34rdyyAqvIr8wqtIXGG74VWLU2pDet5DJO6YVPD2bkoaZaFfx6xXJlmNNM1l5UZM/oR75EXiqxYaboYLFMGQ//ObIdexuyFqQbj4f0JGC08D/YuD5P4g9u1u5aIo68D5hpc1C2LSpIFr5TFkKY9rYu0Ctqq3tijiIqIMf35ErEC5jPmsdwuQ5GCkF5Qzggw1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:10:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 14:10:23 +0000
Date: Thu, 2 Oct 2025 10:10:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Message-ID: <aN6Hy6JZRq-vi08T@intel.com>
References: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c12ea5-cd6f-400f-982e-08de01bd6da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9pND8N0sBEi6uNaZMksDB3Pmo6JLHk2RGO55KTeapt7cLL47Am5qty5SBqtv?=
 =?us-ascii?Q?eFKujZ4wtE48fjX2LDvX7AQML74hveyKYFQE13hhB4iSMOkPUjTcC+nkYcCI?=
 =?us-ascii?Q?isHTEDn1hBBv87JIv5bRBMsn3xnI+X99F8RzVq5GE3Drfpy5dQIrBkoSr5Pp?=
 =?us-ascii?Q?d3njp1sm99fQOSi8nuCbgxwjbD+YLnPHsVDk4P+E5BxF7hTH/mHP5n2rKP4T?=
 =?us-ascii?Q?hsNvI+XZPC3NjJV5JDWXIJ6lwboIrBr+iwa+RXv/pUSTr9vIiALuMpInM5YC?=
 =?us-ascii?Q?7v10jclO5IhJSrxsjcaKsv/Wx+UJ6z1ci+vP+KnyzAxbzPP7EZf+mr959W2K?=
 =?us-ascii?Q?lO+jSJiyt9jN4ZXV8ro8wnKALbfHiwR2XRCD7G2o7AoCq5ZmYV2jahjzIAbM?=
 =?us-ascii?Q?nBJ0vOidIpva9c2DjLQ4oXE/L2GpD5cPI0oU0B7STNxI2tebRVOxsSdFDYuz?=
 =?us-ascii?Q?pcWiaJfOW7kwwpHIZ3bpl0JqNdcV+OL129xO+uH3FmLX81p1zOtNXuB+1BX1?=
 =?us-ascii?Q?sRIneDIQjbOLfVe0NAYBWScMqxlkFSztNdGDK6c6u5i93KZMtD3WqQKGcoqA?=
 =?us-ascii?Q?++mDCDwNplico2oGpXAH1Q71et+ch4g5MpcEg9h8ecjevPIU7D5j//5LVLgB?=
 =?us-ascii?Q?CONxnITbXeVBB2ZRkKG97bXC+KdkWW0xkNAR0jMxPYSBcIpw1XnoShuGkWjt?=
 =?us-ascii?Q?8dpIrhV/l1QuNKBnCri1LX8Nni/j2TT10YoEsBz2lFzL4oru5Bztp2D6WQhV?=
 =?us-ascii?Q?5rsqcVjNV2zj6+NAtzXc5CTOdsM4bxVrRYFt7gjSDqzAX2vk1RFU/GjLROkI?=
 =?us-ascii?Q?Gn/ksKFtP09dPsxBi0LFagnPSDEHcNQfgEBjII4Tm18sYxTSZE+5/cmhN0sY?=
 =?us-ascii?Q?tHHMbryB3MZDefIBarw9/kyP0sVU3YubHq+si2dp3GA53zBHCxUcMAlURjBk?=
 =?us-ascii?Q?V4urKu6Raz0OvM3WAFt7QKMWlmz1WaJdmSnBiMJVH9PeIcAb9NHyievh1wkK?=
 =?us-ascii?Q?D1yRNvYiPLsX1r2Is3WMWTXz2aZfxRInpNw2sYmL1b5ZFSFKX8Z6aEC8WtWO?=
 =?us-ascii?Q?j3f0mIHj8oqYIQ/wC/UAd6yOXCwazp/ycligh25DPUbwkgBMmMwmAMt908SQ?=
 =?us-ascii?Q?1wENtlvMin0D16Rinhp/gfaLOMfM+bR7kdAxOqVCcRJVQuFDF/M8rvFGJWxP?=
 =?us-ascii?Q?PyRFE6X7wNOlXjH/pE6tVRrHZvw2Rhem0HEwH+MvwFEE8KkENFK4R7Jo6sMu?=
 =?us-ascii?Q?+z4/yKuRXuNf0d/WapHj03gVr1Vsauc7mr8vjLmExFpqHWOezSzb5+KEs9xs?=
 =?us-ascii?Q?tN/wDVQkqtsz9+3RLTwfekI9Of3IR/Nc8qgNyqZoGUpy3dCKJ/13GfasBeHS?=
 =?us-ascii?Q?BV2TWwI108MjQcVtNWNi8px0HnRxD+8M1WF7hu76FDEpJOGboZn+m1lOc3rn?=
 =?us-ascii?Q?fmiyHFEK+oYjdmPBTbr3OSZqNmlj9o7w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gs9HOZfaoMis7lT0eGPhzDV2blIB0lQ6lvRAU4bUFRXMcLgA83xKWMhNoZRs?=
 =?us-ascii?Q?BGCVHJ9mF2iAt+A4GJvlGjlbt+iDL1nzI6xJnPd976XyuH2IdAX5CBPPdLzS?=
 =?us-ascii?Q?8vyQ33nWLqWvRtfLaohEtYsQThoG2Kr6hVTIb48gr61OVu4tta6DsRp+CYzh?=
 =?us-ascii?Q?MIVdAo7Q+jEy+tyQ5bJAY6WZlTPq0Kd+sUJije0kiEN9qdIiVBumvrwXMIdb?=
 =?us-ascii?Q?msVQtzuLAFvdO/Zv51NWZ082YQFhXhvq2C9JpdWFr+772eElOJXqbXVRFOXL?=
 =?us-ascii?Q?8G26Sn19updCQuVMi0kTPRG5mKpoHKkswfXtJAxB1X6l6IT9Lf8Ma/AVFV56?=
 =?us-ascii?Q?z7RFtnKRE8YSUEZ1S9gk8BsU/g3NKPJt9hHUZlEyjtyJ6VNVSfj7sbJTr9JG?=
 =?us-ascii?Q?3RB9DsBVzyWKEp3GeDBPEcpGqJtBzAiwA1aMOX1haDkJK6Pf6i3oRwVUGp1S?=
 =?us-ascii?Q?6x5LS8NiXMz2re00yxEkd3m2Jbq1woyac2n8Jxd2tI9FN/F+oY021lMaM38N?=
 =?us-ascii?Q?MKZsYG+bOuTN5poPvqUxC0zPrKfdcZm9sfG68o1aZtlKM+KieqzSdYGOqxqc?=
 =?us-ascii?Q?TTo4PtffGplchugw58KNg4dfkiuTAU5Awz1dJMJopwNr37wXlsW33IVNmJO8?=
 =?us-ascii?Q?GfiHJwkbzOFJz2Arvzi/rt0M9+IllHZHdn5xdC32iC5fnKm3UcWmioe6Wo7G?=
 =?us-ascii?Q?KzCmVBBvRpM4lm0ho/OmTE6+FFvXRoTasFmZ3xAX7js4ny8QLAvW1DK8cJOF?=
 =?us-ascii?Q?4DEeSpzAmcLD9dIwECko3hdD31Qcy4gNflYP+b2es+SEEmD9GBnzNhyqdlfd?=
 =?us-ascii?Q?cf7k0xvqqvsNF/yq3RqoLEVUoV7Yf11YF8Krk35l7ly8VOEdvCRKJqnpDhnT?=
 =?us-ascii?Q?zH66FsWJQxH3VmZRJzWJCbnC/56gEkAO+Uf57RPD9s78PVbtjrqTU6J1l/Y+?=
 =?us-ascii?Q?sSLq+L6GEpyiSEFO4z3Uq37EVUJ1qavhwGC7qci468BB654HTqsOoo++vkXL?=
 =?us-ascii?Q?rRHT3U847W8ZLgv+mxwHFcDBz/wnF2uL1ASJMP4EBPM6bIc9GQP/fnIVfCvS?=
 =?us-ascii?Q?jTDa11c0bd6J8iNHXUG7Z+roY43cUbWNDX28xg1mbHYaFw04M7Ebz1NtizFo?=
 =?us-ascii?Q?lRL1B8AzEh5h6qLBh3SkPrfygKii6P6OvPFWq7bd5bbu1yaC5G1g9MabhdgN?=
 =?us-ascii?Q?zUCTbH7whEuH3X6LCQkHLY4/T78/corRLagHPOZ83JYWFW+izxjP5ss+fSKu?=
 =?us-ascii?Q?jEDcjyvy7qRXX/HggqheR0XEWeDSVTxg9MELEOgHUcLJsYCKQQBUiUx+KFZB?=
 =?us-ascii?Q?iiAl0+br2xPKB/L55I1j3g4QDnuBq+D5SlM+450BeEQ28cPv4KkFCp87xTwA?=
 =?us-ascii?Q?P2xPCPZ0PfL+IatEigjBeMKL5hr8tnyc5WT+GS++8UQayWwXCmoTE1kOv7VP?=
 =?us-ascii?Q?qGMFt5BTXz5x9LmixCu6KfFzMDBgcQt5eH8CVtNDChQkIYZB5Ls8a/c2iR2/?=
 =?us-ascii?Q?ynqVdtnSIS7jTW6FPJVA0Tq5zQWTjoHNDuMDUzxAljPQSTN26UzrBPLwRbIf?=
 =?us-ascii?Q?bdmuw8LiQaEW4z9IiBg8yDV8DxErYN/8gtLbqfh6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c12ea5-cd6f-400f-982e-08de01bd6da5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:10:23.6349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyqr3Qr5asUzkwb5OdJUaM/jk3a6jNiEa/+dXRKP0qc2OKSnptAj6KSpRuvwuFWNk8MXfIIS13m+MN0Iwlz2Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Thu, Oct 02, 2025 at 06:26:48AM +0530, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
> Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
> a potential use of uninitialized variable warning and ensure predictable
> behavior.
> 
> The variable is passed by reference to xe_pcode_read() which should
> populate it on success, but initializing it to 0 provides a safe
> default value and follows kernel coding best practices.
> 
> v2:
> - uval = 0 which serves as both a safe default and the fallback
>   value when the pcode read operation fails.
> 
> v3:
> - Handle MMIO failure (Rodrigo)
> - The function should probably return the error and make the uval as
>   pointer-argument, like the pcode_read.
> - Change the caller of this function to propagate the error
>   upwards if mmio failed.
> 
> Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing soon

> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 8f5082e689dc..768442ca7da6 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -184,17 +184,13 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>  	}
>  }
>  
> -static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fans)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	u32 uval;
>  
> -	if (!xe_pcode_read(root_tile,
> -			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> -		return uval;
> -	else
> -		return 0;
> +	return xe_pcode_read(root_tile,
> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
>  }
>  
>  void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> @@ -314,7 +310,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>  	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
>  
>  	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
> -		num_fans = xe_late_bind_fw_num_fans(late_bind);
> +		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
> +		if (ret) {
> +			drm_dbg(&xe->drm, "Failed to read number of fans: %d\n", ret);
> +			return 0; /* Not a fatal error, continue without fan control */
> +		}
>  		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>  		if (!num_fans)
>  			return 0;
> -- 
> 2.43.0
> 
