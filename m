Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C4CC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC17410E55D;
	Fri,  4 Sep 2026 18:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9UG6XL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E88810E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788547482; x=1820083482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z453emcMGuGfhtO46A7rPnfyH0FH0jCJz45jXL8jcF0=;
 b=F9UG6XL3Ko6tyLoJSNwlgP3futka3WcCUp7ZDP9RQkJwFJ8CsKvtdF8e
 z8WvSfxCKbnjMF9KVvmGsQ5jLytxL1NA38XPDp/GBeYv3kAD2I2QGuwLE
 byNC+Zx3NO7rK0ZmAInS2JLlp0ClzHb318mKAiZtQURlmBYosnEh7mfgj
 MS4YNjWV7r8+ApdsbsoyfDptEyTof68HGR0DumTfABo5vObCvznUayG3O
 PqeVZDB3UmrBJqa9O5W0ZoFiUoBJo7ez/jsCTnL/NYaIsfnq3E72GO9Af
 akdwaMv6cKuEyftPwIbj70T2Wo/uLyh7zI8uh8agAwXfc8Lz8ZQryyfJF A==;
X-CSE-ConnectionGUID: +tAiSEBFRKG95gHYxaM2EA==
X-CSE-MsgGUID: lNe4ojK2S1CSOOfl6n0qgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="76614079"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="76614079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:44:42 -0700
X-CSE-ConnectionGUID: 8puuUo9OQ4eXz4S9cEBKWA==
X-CSE-MsgGUID: lLREsepLRgS5DhVXxGFCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273634276"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:44:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:44:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:44:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTq6BWW3K/RKnU7X7gjATLeo0akKR0AKhUXRnsBUC5/8PFPAwDWGqdduBfi3FJHCYP6fc11hv8KS24m8IuUO/ZwCOjvajn2aLWZBxWvJZpAanVW5vSc5XaCLykhLonUcNqPwP4uKktCOFPyalLgORdOh4PQR7uD1dX1bjfgmakd3WC0CpLj4iIYUgUN29Gvsdto6epGTYv+hoKbdougoZJJJnn/5HXFyKfgVvkEn9Vv/xO58T4tz3b2nAlWnaFzu0thUAVJC60/vUBVi3+mu/wPcCcUjSydhed4WZZBo6ruXtcbO2CD38cLpEre1PXBYeShY9ygz1wiuKJdSBdshkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZpagqr74/WjPLw8ftgvQtYOMWxijRH+Xv9KT6ibdTc=;
 b=JFZHHmvsTHdhyJMG5XnFfp70DRMuSYl07nrgyEdTtjt+hh7YuL/X7Yf+VT64SvQFIk+0N4ziYx6+0tGJww5hHNKJQR8xtWJX72SvNUnveKGgA5e6W47EFXTSUlK70P3125kcjLWDXZln2LJI0TJeRqm3np4UvCJuoRsiNeqg/K3VlRfLlMIE71kj+g6PjjYMzS6fJlUwIcL6B61c0cfUkihBxxOlYx4ODbNxfTNmBDk9wNH1ogdpZV3kdyFbZOFf77h/XwPU25DXhYQApjf+mYgmfaWYmcsVXNA8o+cRNwjgT4AtDjS7VinLzzqR1xnRqeVUaM5oEbgg13fIm7HusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:44:36 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:44:36 +0000
Date: Fri, 4 Sep 2026 14:44:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/log: Relax location ID recognition
Message-ID: <apsRkDLe6bamwhSx@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904170531.516-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b17a9b7-4711-4d0f-e7f6-08df0ab49143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|10067099003|4143699003|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: MdIINNET8YYk3+dbP+XtlJUVV7OMLvvWcUDG8ITEdh1K7IQBorfZ/scEH1z3fM08XFtYNs5kqPpiIiQkYHlWDfqMQAHHkmM5/YtwQ+rTXhfsyBS44ierQhy5KkTazQQ7yN21x/oV4zx4heKRN3WLe5x0j2ex4LsYZiyqlUBh63L6OQKnM2bwvmxGMOwmVM2PqG7nYYhxVAyuFtcfY3Z8abrd0Ef1TNUQgqzw0jW245+KUBL9J8f81TYfPDKhwE4zCHZl2OqTxEXbUBWis0lFtXnFX8D/305XJbgnCJqspQE+hpf2C/KvpsvWv8I8AMGOLaV8B59WN2YyhySxkI/WTQH3AsewU5lxip8yrm3htGm5r5aXWc/WnWj0CRlRD39UxV6IZO9cXgnYz3tKs0dKDu0se1zyySkCUW+GgY8jEmoznkrD6MQtP5XJCpUzzLbjktOxEKeXPZBn4eYFzmSKL4pNVEftn/uT6PE+yMibPltk7I2Er16rj2xSdoB3rQynM4tsO2Zi/8Hr66MYONX2hrGQyBVSuKC99CUoOg9sGO6iTlQX3gVcSMGd//y0yuN1Pt4lLjEnDLevqA2MoQaG1zUj5gUy0s6mM3AlNXKH9F7TQFcSmuT2Y5lvnCU6gmA8mMzMVQmo5tdzrZRNDrT7CzHF0zF4F1fUHSum6HMInMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(4143699003)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1VAbaEoed8e6XAy5XHVSdNtlws3CvS1RSTJEPbPlyIAizSv44LueYnCj18GV?=
 =?us-ascii?Q?IhxRLVDWx5EGb0DMb0rZqaYvhBOvJwmI+fGQhKuW3EP6TOSi3GaniF3qujUY?=
 =?us-ascii?Q?K7FJ+KHuUEbeQfVtJo7LvDZI8DhXFuKjZTym+2sxZUdQxbIaM7JrdCAyTXuS?=
 =?us-ascii?Q?aBxME7Of/mVDb3OL5NE0DWvOOuf4bgP05ASITBJ0c1eAjdD5U+xb3Yo6fhbZ?=
 =?us-ascii?Q?CPs9cpHgz5qCohtbF4dEWAFyUJxyZx+cFnyvb4tdtSQkOOBWYwrSEhPYk7TU?=
 =?us-ascii?Q?VCD6jPpxWF4O7RK7gL/1X3GHTZZKhCirg8l1lx5mGRZMFBmauvQHfWEqU0Ca?=
 =?us-ascii?Q?Uo4duRnID513DtiCri2XoaC1DnjL9vmVho8YURktDT2XzkFmOwqyQnf2rhW1?=
 =?us-ascii?Q?SdnfCIgRSgdBeu7BrNJzDYGqFeexnLgjhEagaI5CfrDvx7hl/IuBdICwpbOT?=
 =?us-ascii?Q?KaA8cUOTlld25CmjRE+Rxfk5CAuPgwNKsuqak6BmOrHoRRUoaKE4P08paom1?=
 =?us-ascii?Q?oJDzmgPXX34K7q39Bv/gEvMlr3lfCGwrzzQ1u091gdqboOrhWN0jPgD+/07D?=
 =?us-ascii?Q?rvZNEu/2dYZyu5r0FiHxoFs47nSv2Oc7CQuS/j2Z73LO1efcoum8yAwnuiaI?=
 =?us-ascii?Q?3OiJrouN9Md+7CRBRI9nRZLIq5RVindETyr5xssbkrS76BENl3x8a9+Pq1RF?=
 =?us-ascii?Q?pbTwnrbIonAxfhG+F4apL9h6++JrYU3JbhpoSnIgEhwtxkVN2jRzHtxOr7Et?=
 =?us-ascii?Q?P4XsOyOEngwa5RKL1iGPfoFE34Uj4fvOo9F1MixseFY+Gm+/+16N5Sg8GOtF?=
 =?us-ascii?Q?kRf/C2SER2Ahk+bYRRcjvwkNeylMO9UQOwCc9gHOuzBXyUqPoTl2+eCTfj6q?=
 =?us-ascii?Q?9olWvJ0jJBT9QhJdvY2Cc0hUdsdWrtmLaoCWyV9PEaksM2iriuMRb8q9MpMW?=
 =?us-ascii?Q?5l8rWjpOLsbWiCxdBzRiKL9XKgVkpLL24+VdqIfQD9o48fFc4C9QitfRTXt8?=
 =?us-ascii?Q?VWkplN4+2rz86R20IusXDltddxa7D+fDfaPeWhiExCWWxdmzfCA0/fBJm2Ne?=
 =?us-ascii?Q?na8aZLl0AIg3pNt+5rrILHKTDqFgvOc/5OcAaAregGg9O43trNSXm2swfSat?=
 =?us-ascii?Q?UgWp+XlM628QdE4jNmeKanfRLH4Pm9GchUZR1yVuImxv1EhHCm4rAw1Jbbtr?=
 =?us-ascii?Q?EZNhLhWaBwGMxNtyvuIfo8uuezKBwQv+tBLtpf74xLvC+y7LDwK1VP6UsCW+?=
 =?us-ascii?Q?g+rME9lT9qTUNF+9R0n6PnVPuEqt+oDBClHnsDbyccOW50JbVUtD6kB7H9Nn?=
 =?us-ascii?Q?PXHPfB98NGaawWiGXNRVAgiou02va+ZpaAS3ftUOJiqCC6vQxYg1XfnzawbZ?=
 =?us-ascii?Q?rUs+7grM/mPN+BolxVJDYGs1DTqTbXqA6Sx6cap3qvQ8gxMm3QzmBznwUq4N?=
 =?us-ascii?Q?6Hs6ZNKseoyKIr4Viliqqm2HlGyPqWFgLABnliDToFpTTnHM2RLhVEEB7mIC?=
 =?us-ascii?Q?rAtOEbuqgWbqEZPqBJpdM81W6S7Y9tNjHydg+KomykhgZI2BBrD5/Ypm7hF+?=
 =?us-ascii?Q?MwycLnkGolc+LFQ5fmIfHq/1RLgYOHK+pVWWedxofSQw59QN1D+ZEVbHS5/t?=
 =?us-ascii?Q?MLu3LlBKHZW2IWYYnYvNebNlezeabu/UorvM5NBlIN5FyQ22FE4kqCqSs08j?=
 =?us-ascii?Q?wJK2YVRNMddr6lNCJiKb3npYcdXR/68Es9awdRi64uV4tdMepfXmuQL/3X5W?=
 =?us-ascii?Q?g21JJWin2Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: nNnOfg7w3JI4ezxKIQdv0btmzE8rjqQQuGOTdnHkU6VlmOCY/1ZgxcEaMy/uOsSC0lL2C+T7EBFHCytgvEMg2wwjt1jn3otWL0POoyeL47QokN/C16ax5EmnJBmC0nWIDdvSVkuV27fAH6IgPQF/wHXmSwsiJUPtS+nchtIU4L8H1ELn6Dtsgtra2NlR/0MHN1D3Wr0e5IvRCnOOWAtRLXR61vg9SkFeJ4ashZ27++h5mSR9BTlTCdXV3c8ZZsAoHYxWQ3HzzpCmRPjOITZDyq42qYP0PMRmKQ4V3LyJFegDtVZZzDnmqoiidODKuTLKd8WvLmdpRLAuqc7Nlkk+iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b17a9b7-4711-4d0f-e7f6-08df0ab49143
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:44:36.1324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt9r0QYFTEoX1t20tiKHPQa5WCcMX6apJNK4DVNTi+JJXmUptCLWGWMC2ixbsgXNmAYihi9mgISkjQsiiQgVQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
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

On Fri, Sep 04, 2026 at 07:05:30PM +0200, Michal Wajdeczko wrote:
> It turned out that during early probe phase, VFs use detached from
> the xe_device, temporary xe_gt objects, which when used as location
> in xe_log() macros, will be treated by the dmesg decoration code as
> bogus, possibly triggering a WARN, and the output will look like:
> 
>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
> 
> instead of expected:
> 
>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
> 
> Relax the tile/GT id validation and instead of looking for the real
> objects, only check if encoded id is within the range of possible
> tiles or GTs on the current xe device, using data from the device
> descriptor rather then the object list.
> 
> Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd..29eb16db3320 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -10,6 +10,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_log.h"
> +#include "xe_pci_types.h"
>  #include "xe_printk.h"
>  
>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> @@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
>  	return component ? log_unknown_component_prefix(component) : "";
>  }
>  
> -static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
> +static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
>  {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	return tile_id < 1 + xe->desc->max_remote_tiles;
> +}
>  
> -	return xe ? xe_device_get_gt(xe, id) : NULL;
> +static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
> +{
> +	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
>  }
>  
> -static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
> +static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
>  {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	return gt_id / xe->desc->max_gt_per_tile;
> +}
>  
> -	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
> +static const char *location_suffix(bool valid)
> +{
> +	return valid ? ":" : "?";
>  }
>  
>  static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
> @@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>  			goto unrecognized;
>  		strscpy(buf, "", size);
>  	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
> -		struct xe_tile *tile = get_tile_safe(pdev, id);
> +		struct xe_device *xe = xe_any_to_xe(pdev);
> +		bool valid = xe ? allowed_tile_id(xe, id) : false;
> +		const char *pad = location_suffix(valid);
>  
> -		if (!tile)
> -			goto unrecognized;
> -		snprintf(buf, size, "Tile%u: ", id);
> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +			 "LOG: invalid tile identifier: %u\n", id);
> +		snprintf(buf, size, "Tile%u%s ", id, pad);
>  	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
> -		struct xe_gt *gt = get_gt_safe(pdev, id);
> +		struct xe_device *xe = xe_any_to_xe(pdev);
> +		bool valid = xe ? allowed_gt_id(xe, id) : false;
> +		const char *pad = location_suffix(valid);
> +		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
>  
> -		if (!gt)
> -			goto unrecognized;
> -		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +			 "LOG: invalid GT identifier: %u\n", id);
> +		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
>  	} else {
>  		goto unrecognized;
>  	}
> -- 
> 2.47.1
> 
