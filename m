Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214CC282D0
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 22:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A358110E2EE;
	Mon,  3 Mar 2025 22:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CidVzkjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D89A10E4E1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 22:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741040204; x=1772576204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M1VcsBJ+st3NvHSLvnGClxcwEAttxbsrjCEAWPeODEM=;
 b=CidVzkjzbp56lSuJuHE3BigEoX7HvYJMNEvSWcgu//kr1XAIWiO5M/Ev
 e5q+psCL5ghK8dIDbZrp26btvidyyxOor0IFaygMBO+7tw+Wyjgbb911Q
 gcHJGO/7gyp1OQEj3kPKe4XyQSFKl6I6GEBmo1wLb4xDZclRHEQfI/kqn
 qr1MT+waHIH8D624fyHqGOzcFVRzbBo1jvBY3gdk5yNLzm0CiLIj46u62
 TI6EdmjIpIQRYo1tLV982eg8GnPZZzEnoXX7CnMu4dCPG+FSvzP5VmWEn
 4gY04yg9mI2eD1WAyA75YQS7a8iabQzCeddtOXiBLPOmMjD73rKpDikjE g==;
X-CSE-ConnectionGUID: EURQh4OSSJCZA76fUZ3qzA==
X-CSE-MsgGUID: eUR9gKzYQ/Gw0bbrwS8tXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59347555"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="59347555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:16:44 -0800
X-CSE-ConnectionGUID: BIiXrcNoS1qz5Tk0itENhA==
X-CSE-MsgGUID: 5V7eOb3NRfCIxzwXHzLAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="123126734"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:16:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 14:16:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 14:16:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 14:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXdYjDtVqn913ZLLs5bGKXTxc9KDEtuqM1mK1ocf2MY73CrAvK7P37EeMyTqmWXI8y0ZOGSY0NQmyBpQzpx4j1WnVHqk4S1cgFN2l6QI+nZuaK4kO4aGsBJFaXA2rpoRt/GH6SoB9L4ojq3gE5rgaHxuIyYjNxkcAUDPPorEHCHke1+HALf/hCuKNOTYqiYVL4PSuwJ9X6EhqK6Bv+BS28So6hCxmLxGYXAM5UpZqXiMcafAKBPaLgjAz2hUGLgG1PYOIESXvQsVzeBPrhEZWWExFukSaTcpQgAzGKqLx/8MuBcu/c0kP5JfsNn1eazmlvO44ZkZN8BCkppmc/KCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PF3mQL08h6p4t3PTSV7NZsDUjFk2u0CmmadndqlDUgI=;
 b=nwAtpSSnjfUwyCWt83iyjoTr30tZ6V/KLqttHvWSFjnCQxoXD2OLOtb2q0+3SPb4C28oel1XmL9kajbHFUd3jUgnrPud80EbQ6pkxuzP8C7OvB9+HWkZIfeL8tGZirP11RS+gxlpJuD1kdKGutpQ1HWORSY/8+GrYluvVnhmHXhMfX/DH2m2CGZhpvUcuTWthPXhtW5PGCaE3yTWsYlOV/eH1G0gbW1Hw1GmV4Qp1VyJuGXNrsTAlt9e9cwY6eu5QDsK573Nh+yDP+t4rg59uB2gbTwHFP0QFK7LcdCJ7BjFmwa7Z8f1jfXzkyzhlNf3EQnolASx8mMs37Xonb08qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Mon, 3 Mar 2025 22:16:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 22:16:39 +0000
Date: Mon, 3 Mar 2025 14:16:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/vf: Stop applying save-restore MMIOs if VF
Message-ID: <20250303221637.GE3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250303173522.1822-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: ba200b98-5c42-4640-d2ac-08dd5aa11200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2aTW4Oh+GKjQHvmFhLzELtsKm3rR6YY+XCSjLDGlWECtg+zR4ZX07khtUBfd?=
 =?us-ascii?Q?U7qP9f2LvO56DF5SNe6ZaiqawsmSCkldn1sQonISepE0tvJ3rxD9YBVIm75L?=
 =?us-ascii?Q?KFG3SXaZRdCjwNdK9xePwHHsqK2XzixGRbTn29TD2VEku1wBT61+5n6h8tPy?=
 =?us-ascii?Q?lYjClJMycZvcduSMknwFW13op9e0GZYmH83brhLqV90LnfNa6mP6JKazf980?=
 =?us-ascii?Q?L/f5diWkJ8Y/pZ+RsuA2spA0fUQjwtvVdSl40PyVME/ov1UayVhkp/syW/C4?=
 =?us-ascii?Q?0jFgF/PAdhztDDhoI+i14fjHWPDBuaSnSU7S6bV/JmHRGrBxGAVwnsSkkFF8?=
 =?us-ascii?Q?L2B6YwXYD2dg4wIm46nxO62M/AVsrocIHFX+pttWmtqJfX0Z+557+efsseVU?=
 =?us-ascii?Q?ORpkEXZICIXuTd87sCw5m22PHn0cGAf53d5P59k3x3XgMften1ZUguIpKeK7?=
 =?us-ascii?Q?P8FWU2ozLPhX9+8XkNp4MfuKGfnnlzdLBofOGTJEgACs7iT5IXFDI7bhtyIj?=
 =?us-ascii?Q?fVhmb635vR3YYdmHJI2kU8+Sk8uoQuCPTEjt5pRUTT8/SDDDJJAs0dd6AaDv?=
 =?us-ascii?Q?JUXO4tsBhCX1ayz4v79Iao9Fiy0k0yV+/jpEExHQdjZ2mFQAy/kIVLMyk4h2?=
 =?us-ascii?Q?LDyaKAsEArpaFgyXvEnZ9NWpKC8shS7CmcPoRBnQbt8R6zUcU15/DUxayhEH?=
 =?us-ascii?Q?6rhUUJ7W42MQbfNbJkMyt/m5acVQbIDSKaNqtOlFOZokvvzngpxzP+MLffRE?=
 =?us-ascii?Q?Hq/UjB0MegSmFhzUNQF/uvhXIIYI4+WUx5nQiyiFGhH9N0RpxnguSYNzVfYg?=
 =?us-ascii?Q?Ype/HwL7tImecZVZejZKpkBKYw97JBWkK158rF6ci/E0EKCfWioHlhIL+yF+?=
 =?us-ascii?Q?47sfSyO07kTuiRk8VjD019QYK5y1h6EP5xVTtndW3a8ztSGTCRCRbSaBSKeJ?=
 =?us-ascii?Q?DEdF6/aS4CFU/GxmA+5Vzy5ux97KDANG3JetCJiuQZnyetCMvGL60dmWrF/y?=
 =?us-ascii?Q?SkTQBHNShmQyjOHrd5uDxBXuKU2GHBFJHSsBEeNdsTMogZIlpI9u6lVjnmKg?=
 =?us-ascii?Q?Ms/qYOJa4n6x3cS58BZbb6g9slzbaLAqFEvnAtaV+GjeJy0dBa3w4578/9Um?=
 =?us-ascii?Q?2KksfcGeR1IiS/vvAzJO1erAc52leKCs4lO0PEEcTMUdr2cLf1/xItCnBwbb?=
 =?us-ascii?Q?RmomR3/e2JKFERM453FBb8ZSrP0xUKUKmhWQiQY/ucL7Cn0gznTvxZdx0C1q?=
 =?us-ascii?Q?zIdQnfzO6nYP7ivYDwd2QExeSMjZpnqt6ufaI5uHcPd9T+JavIVWChc3/RdW?=
 =?us-ascii?Q?JtZIVut7U8gbQy+3cY3gjNuG2eJSnjIndfw3tTMnMFmYkANKDXFwYUDCsHbE?=
 =?us-ascii?Q?gknWtPBkD12PSWp1YABI9Z7Pcpvt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tqQCG7Q0R3Bh9uXAWs7SEDvxBITS9QXd6jA9GMcGr0anixA5S0OgOfl9S72N?=
 =?us-ascii?Q?pQF7i5GcHcWhTQZhBNcGKy47uMwXGvyvk8D96dnEOEAiPv3eat99DerjQrK9?=
 =?us-ascii?Q?kqV9VHQUHSQTzijzLg0m/rWK0+oNKXZ0Gs0LfTMKoopsaqT1doJJ9To+8w4/?=
 =?us-ascii?Q?TwUdBkVN3SswQpIFkjKHdSKacEtn3mxe1Jcxx3KML0vsirgnMcvpxPBCE10L?=
 =?us-ascii?Q?NtjVQrvc0kALXPLg51KdDNLV0UkNfrVxMMisoS1AMEhKY4mQKuPbuI9QexAj?=
 =?us-ascii?Q?q/W0yKuD9tIJLq3sfqdL6E6BxsFJ3tojLSKUH4dYAwwbqsPKkFk6r2zbjl2S?=
 =?us-ascii?Q?1bf4y3rdkjpf8S9/KCDzyekYRLjCaoUGyjwzeDInULED0KhMeEYZ4WpH6wvt?=
 =?us-ascii?Q?qJcNjTJQdBLcMZRXCQXOcdmelY/b4fZ6E9tcajSC9C1jf0HeFq28poWbEGTT?=
 =?us-ascii?Q?kj5adR/AM7c5RylZH+EUIkp4Yz+epA+2va02xCKDV0NZCFFO4VzMDb7Ou8oK?=
 =?us-ascii?Q?v/2qRnHak6eysJk4xrKTACwzB5J68GRsmYHJEp0ll/SQZbDqZGsvOdnBr8l0?=
 =?us-ascii?Q?3Ag79VqbBTo+yKqLQ2wzYo+mwZeUyGTAqUJs5oy6K/uG/d1YED8vH0G2vtaO?=
 =?us-ascii?Q?VSsx+OeDA5e0X7SNhQ5Zg5CXsngia82Cz7ilNr3/EXH51fOij5kWDSZAfGCj?=
 =?us-ascii?Q?sNWem4O7S+9pcgS/ECdK6OkBaF0ILiyUe6gLXKSwqezvAzMBmlUAfGZWl+T5?=
 =?us-ascii?Q?8VVztPnaYlv1O9aXiFn1BASBClRscgnSXZxsnKaf/ViFsdaWZI2ib3qnOOnM?=
 =?us-ascii?Q?szhCIC1GoRpkNBi2oXITv6TOpyLlozRjE9PA59XyarqRLossciP6MpFqEI3j?=
 =?us-ascii?Q?Vf318Vp56WBhTd90LoyFACfLxG4ALeJxYofj6e1tEPC3w63UsLUyURdrhASJ?=
 =?us-ascii?Q?xrsii+S8MSL8y9IWphoyl2vlEbhPo/e/O0XhkOPPs1xKDWbvVgjIkORClcnW?=
 =?us-ascii?Q?IHV4BJsIftqeunazH2J2kDSh850d2CiEpwEAFyzRMzokExWnlS3OurEttolv?=
 =?us-ascii?Q?PFq4TjEpQ2VCGCJ5wGe28bZukL8+wb15Zx/OtnLHuHQya1bIOXXLAqojo2Yu?=
 =?us-ascii?Q?OOh9daGcXZYffN++z/T9Pw4GT2pr6RVtV597guSKrUddR8xOnzQejlMZFOf+?=
 =?us-ascii?Q?7gLbn2QqWzX0or6CNrs/1vT4HTp1zSbk5VzAuQTopq540cfvsZ8QLHKAvGcG?=
 =?us-ascii?Q?eEv7TsuHHtcqFUG8LGzi/ldEJ6GgUU0eCrwc5qZoNYL9pIMQTK4QV2JloY3l?=
 =?us-ascii?Q?A87CZAJjXfmi7kcSarTtllSjWOm56pXwOPlTlwq/+IULkcWhB/DFUDUCoqxg?=
 =?us-ascii?Q?PJwId9C7aJFXa+Z8hsACfH+c/Z+Qjnb+5oPx5/Wut79RFtwpcfmFycYkzgdC?=
 =?us-ascii?Q?UKuIMDuMC5GU/OCzDbdUQ/jCTylY+Rd5c51y9LS47nzpkw++yK07WbAd6zp1?=
 =?us-ascii?Q?HEgGhb1rDiQdOYvgIyAtp3RjJYhJzhdHwd/fYIe6c89xEapIJvdYHXM+L8Yi?=
 =?us-ascii?Q?59LITvpf8R5yq9YvbQEhsIyfIorDIOcdhp76raGWHBZHkV6V/k6V5jxPsT4E?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba200b98-5c42-4640-d2ac-08dd5aa11200
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 22:16:39.7174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaJk4LDeZFHsivYJjGRfnAdRHJbqiRiNZRemBJe7al4hGMJknsCRxwNqyluTQIchV7UtjxzVN2kH9e1U9BCBKOqaCHoymtyHdZLgbP3U94s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Mar 03, 2025 at 06:35:21PM +0100, Michal Wajdeczko wrote:
> Currently we are blocking processing of all save-restore rules
> by the VFs inside the xe_rtp_process_to_sr() function, but we
> want to unblock that to allow processing of the LRC WA rules.
> 
> To avoid hitting WARNs about reading an inaccessible registers by
> the VFs, stop applying save-restore MMIOs action if VF, without
> relying that SR list will be always empty for the VF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 9475e3f74958..fc8447a838c4 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -173,6 +173,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	if (xa_empty(&sr->xa))
>  		return;
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
