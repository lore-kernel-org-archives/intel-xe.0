Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B2BC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49B110E360;
	Fri, 21 Aug 2026 21:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODtHHBo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79FE10E378
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787347015; x=1818883015;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vxAK33kLkOIk87SSs5R0QlxnzF+o3NXYeutKq/kIE/0=;
 b=ODtHHBo/WWz7d43VK2vh1z9vNa28Qf4QZ2t5u6GO/t+w0sCPuKHF7cwi
 aqVRmG0b2Y6L0dz+iNGOBh5pmohhk2TTO3TuzjB2ae7xTjwpt1Pl8qF+i
 ahlnXQnL0CPe4aNwEfgENdsLW+mds9996rz860DgPkBfcu28pgT0YfAuQ
 zdhtaErmeJEMEm0N+fLJc+77y8JDMgw2vVPxd96VLO05+NqtDjhhydhDG
 mgXZ6HRYLngsXpovYpC8C1kV5kddZQGmEYphsoHVbUDsG7NidkMv+dsWw
 F0KoA6I/vrV7CRnuEfSECaBB6v6V9xasaukZUdISL/2LVCnIq2Zmy+wfr g==;
X-CSE-ConnectionGUID: CzXmBttYSL+npVPdEMF98A==
X-CSE-MsgGUID: 1MdVuKcyRpe+fLnqTb1obA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105280217"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="105280217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:16:54 -0700
X-CSE-ConnectionGUID: SEtZGRQ9T9iF2UamK8iUqA==
X-CSE-MsgGUID: B9WIWHaLQUKQKg0mMW3+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="263801328"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:16:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:16:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 14:16:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y30puPbPr4WR+m9+nPD2CMSiRgizM0kuhdFyjW2JUQF/XR92oDQ6yEOGtpAICwL3yXaQX9F28OZfnxG6hymAysWDvylTurN4KB7UoGO7uoOxqzy/AzkKwzt31UjhU6+FEmg/gOzlRWanwzPUaYwcH6vQrvPfK9Y3HVHmP6AoPZzXuCsPEdLnZSs9jtKQImm5E9e0kbVLRWT7Ii6M2TlEMkYcl0561gSFfz2/p/7oVuabftUekMkwgY2fYy3ECWT/k0sGFZkZMb3LiIVKw+WCHFzZlytOdwxg1wBxVC4KY6pVb89DUr7Xhk/huIAPPeN+C7e2T8HdseV/NavZt552JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1dXw0AKjT9rrtCdzH/gofUpMwLJ0/5n9DFETxe9Gyg=;
 b=UlPgl1zwlxWKUtvlQxx7/mU8A3jd37+Yprrr+XDmw0FzGONz45V6WOy4x9VlJRnnHLBTen1LAkOR6PbNhcxkWvhfSdbObn2QR1NR4JOtJ6ZJMBhot2h+nccn7370QrizofNasyTUlgUmHUScvuRDhsbK6g3AooLIFBbTLdQOUiC42kUHStXpAMvUdhE/hLzIXUijbvj/7SMkRPGjcS8LJmK7OHsFiMfJpXUB1uAm+NcWesxbmdN/VYG9mbGICmLWIQcl+bxEcn5/kN7bObM6C022Q28/Cvvh6CSWScCpy36pwHuwtVVB/8+Rvgp/bIiSh50uBQJVZ3CSuvOiwgTylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 21:16:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 21:16:50 +0000
Date: Fri, 21 Aug 2026 14:16:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 03/10] drm/xe: Split out configfs data structures
Message-ID: <20260821211648.GF681121@mdroper-desk1.amr.corp.intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-15-stuart.summers@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820210639.107524-15-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaa70f1-40f0-4062-1769-08deffc983f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gMi2ArgSvXKz7DAXj+UwPw+MO8bd29ftpVUUELeG8hWcFu1NKkKAXolEXmzUjVv6vXMh7msxGzwGKtxOjwbdBOWU+4sWrxRO/vX0WsJRKTIQUT+/W8FWHyKYxyle/VY8wFDpPQLSy9UXFk3L8I4qhniDd0ct4HkPMxIW9EpC/AGJryEOaqvg7FsBAS6qk5SGrEYoG2gESzoBmqrd0YQkrNBiDcx2wW3PBtNx8UpO1BIW8pEiDiafa3uci2TERbU2TKZ5qZTKPLVRvERKkY0UlVC69T9qRqfUOX1AG+htqk7qK2ZWPH92qe0NoHpaKdDMeU0jlm8vWsUkLD3GVEIQzSPxZ8lYPwbvdd9WGhB9yYNMYaeFpWVIfj7pPnAL7ECCBUZerKqntJLVeYzwu265V/mVNatOXSaL2tzKhWrEVXFvlZIaviZrEOK3iDaoSf0gZt1b3GuUuo2sGUc5+Biy1oo93lgxDl/rzl5AbiASl6nYProbDWTeais9+aAUZ2YoO3S+ZlCpMSQjTni0My2sFEwR/QRC9FvdT1Kn4QAi4/ot43tIoaWt92Z5FdUCgrc+aczHBolfJqlwEYXynQFfy6ETbrHrTyyo+jOyhmbFgrFL6patV24loCS/SwDrdkEEcvNY9qBfKBcwS0m3UNr9ePTg51w+OwxJOK8X4B1BLLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XvtVfbFkJQBYmijJZH9eRWLra/Edoic20hScD61kCzYeShn/zmrUhQCKlC?=
 =?iso-8859-1?Q?ZbXu0z5Vaay1hsBmCr6KvMjolqm5Zpp8hlHM8ElENA/iCxOaNISF/SbZ/u?=
 =?iso-8859-1?Q?1IonU/gbj1490vsVBtSGATzi3IgI5jqBscG6J0E/a/uup7Ax9bx+0hdmcd?=
 =?iso-8859-1?Q?0hAHpLDaN5SCPExPVV5xtp/4oygNdOEygzkXn47F66g1/a6H7zSsL4iS31?=
 =?iso-8859-1?Q?35IffOMaruOwO4L418hQnm7ZDUdIfZ/b/pExWO9pxO/aSwLkSE8/j5AuFd?=
 =?iso-8859-1?Q?L6mRajbZeK3+tVYiyi/l2m0TJabP9qjaUeDtIhEBo8QS/JP7pQvzR7HOR4?=
 =?iso-8859-1?Q?mhDM3HCVQXloXCwJ1lk2kApP//Nx4LOjq4la4nHac+wYlowyP8+lXxCICK?=
 =?iso-8859-1?Q?nZVFgOzM7cnruixrjJxzx3W2wNtRW19ju+ubP6r6xrng3cZnQhRvSLKnss?=
 =?iso-8859-1?Q?zr7OvT5X49603qZzXr0dr3817tDIWMDatdhgnBFhRtzjZh8OJgo38OnOmr?=
 =?iso-8859-1?Q?L2m/rNuxxNIvFPsVMPW+zePFEi7Xc+m0DqQXRNPyZmtR4ib6Gxuj7OT+36?=
 =?iso-8859-1?Q?GpZx77KZk1UqWpxuiBFVTg82ddt7lE3a5ay6uPLAtmq5RCvlZrv9OiCTa0?=
 =?iso-8859-1?Q?IAd71aP6BVpxDDyFbHuvZaHETTkcLoRw5E/lHrtKPwt60FsO9UAf5G53rL?=
 =?iso-8859-1?Q?dxYICjkM1uM/9O17E9K5qr9xA24GfB0P5HgKLWwKcmrtP4t42/zPQCsST9?=
 =?iso-8859-1?Q?Q/wkrdqCmRn6lkzkq1bsZ2GFF4bj08cZUmThW10/vGrTku/0I9Jo9cn1Vq?=
 =?iso-8859-1?Q?ZgIXlwVaIj3eSHqU+jK431tJcndo9p+EWqFQJFRDTpJbfUGptNSJkBp6ht?=
 =?iso-8859-1?Q?lgwTLEX6rxoKidnfFnXQPKP1/qVYG3wyT5CJfsgfUCtKcnGl4mn4vr0XJD?=
 =?iso-8859-1?Q?2zVpoLoe592VLvPf/l06Y3GW80AUCTI9QUj8mkRK2d+ej48VEYKlg2+iAU?=
 =?iso-8859-1?Q?Bs9o4D5e1QDd6qO80DepJ3NrhSN0BkibsnTy2O1rmEGNZbxmutMOh8nf98?=
 =?iso-8859-1?Q?kZDXsSXwwmOO+oV+L4Ho3X11nSzRfB6h6amWIqvkniCvtgU9hQwdOFmsHW?=
 =?iso-8859-1?Q?lKN887S33LPJbiE0AqpG52Tr4ZL3uIUrVoqkTcndaUNS0jU/KCN3eA2vew?=
 =?iso-8859-1?Q?gtrF5nv1zFtWs61KYN7xZGlKMCsVPhPd7pv9degfKQg3Sxbk0FvzvkO4Eb?=
 =?iso-8859-1?Q?ClzT0oflYAfN9C8mmGXG8yG8o4bXbH18LX9DvbM5Lk7Jk9AfL5OutIgpqD?=
 =?iso-8859-1?Q?2hUxjuf0Q32uVQoDdHqvPHz8lWLIQFEkeCw5pHXyZyV5XGAqWJWHNN4wyN?=
 =?iso-8859-1?Q?XJf/DsvD1sM6iRXEB9WZnfIOiwMg5u4us8BnqJZqrbRp2CSZi3K0o2iu+V?=
 =?iso-8859-1?Q?bQlWHwgzKMfOAwklg9QIEeB5jIf+vIAYWdg4F2I0zkT+a1j93WhGd2E2vL?=
 =?iso-8859-1?Q?oCrRrqtBmy8e0Ubx8Ee67B+45TJEIPAVu/ByAG4TWuMSQ5SMbCy+QzVw1r?=
 =?iso-8859-1?Q?hgCUJZj1cmwno3aszP3Cf6hKRPehFZf8wSVQHT1r7IMTDcn4G7QupPMIOM?=
 =?iso-8859-1?Q?QEgYRoip1k3qaR3/387lQb0edfkCeLlsJDxMm1rjecdGFDuuT6vzRJIDyL?=
 =?iso-8859-1?Q?rYpVMrkyfr8dKx/JhvZ9wx9r8vFJLuK8mKfmbmci9Bj6fYdlAZ7/yaSqq0?=
 =?iso-8859-1?Q?vy3DXhqdggEL0eWkXLu/q2iieJ1DW9kZyH2MMUHXW1qruIfXs84NhODl0b?=
 =?iso-8859-1?Q?iw5a0XP/9gLY3xCHBL2t/z7YCyzsQFw=3D?=
X-Exchange-RoutingPolicyChecked: K+tPTT+MiwMTKltNyvHNV563fCtyboNFp7UNdar8DbuEPIxAG1XpAMNIDCwDjxtHeGK416M5+VOaJKuITQHuvceWjJHev7GljW7Tw6rJTrWChHOpBEXy1YWwQKDf0WfaaHF/0XiZe/z8x+8uUnQrDEJaZW6CoGvZ/ekFydIk/5+wh452GukpxabL7Arhe+zHf3ZshpBCUwhZ7mcTSXgq032VszH133M6iN2wvpmZnbT945mahcFu7Lv7T6i7bnNLCoY32sFbLoIilqwB5GE2BTkp73CJc3t7ZjGXbeNWU2Bu+CX/DbyVeaJhhElfnKJe1yo+uomvldYQukVCZL7D8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaa70f1-40f0-4062-1769-08deffc983f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 21:16:50.2273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXTVO2GjYJn9iuSHatMehY6WnL8TePG5wYrIUMGQibtoL+heeIUPEOP50+9JSor8QvYJmGbWM0iJ4WGjELgc61PxUFrv0w7FVkNSt73Mkdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

On Thu, Aug 20, 2026 at 09:06:42PM +0000, Stuart Summers wrote:
> Planning on moving debug specific configfs parameters
> to their own file in a future patch. In preparation for
> that change, move the structures in xe_configfs.c to a
> new _types.h file so we can easily access them in the
> different configfs files.
> 
> Doing that separately here instead of combining with
> the patch that adds the debug file for ease of review.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c       | 41 --------------------
>  drivers/gpu/drm/xe/xe_configfs.h       |  2 +-
>  drivers/gpu/drm/xe/xe_configfs_types.h | 53 ++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index cb6ab1fcb8c1..029c9f682c8e 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <linux/bitops.h>
> -#include <linux/ctype.h>
>  #include <linux/configfs.h>
>  #include <linux/cleanup.h>
>  #include <linux/find.h>
> @@ -17,10 +16,7 @@
>  #include "xe_configfs.h"
>  #include "xe_defaults.h"
>  #include "xe_gt_types.h"
> -#include "xe_hw_engine_types.h"
>  #include "xe_module.h"
> -#include "xe_pci_types.h"
> -#include "xe_sriov_types.h"
>  
>  /**
>   * DOC: Xe Configfs
> @@ -259,43 +255,6 @@
>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>   */
>  
> -/* Similar to struct xe_bb, but not tied to HW (yet) */
> -struct wa_bb {
> -	u32 *cs;
> -	u32 len; /* in dwords */
> -};
> -
> -struct xe_config_group_device {
> -	struct config_group group;
> -	struct config_group sriov;
> -
> -	/*
> -	 * Fields sorted by type (largest first) then name: struct arrays,
> -	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
> -	 * type, entries are sorted alphabetically.
> -	 */
> -	struct xe_config_device {
> -		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> -		u64 engines_allowed;
> -		u64 gt_types_allowed;
> -		bool enable_multi_queue;
> -		bool enable_psmi;
> -		bool survivability_mode;
> -		struct {
> -			unsigned int max_vfs;
> -			bool admin_only_pf;
> -		} sriov;
> -	} config;
> -
> -	/* protects attributes */
> -	struct mutex lock;
> -	/* matching descriptor */
> -	const struct xe_device_desc *desc;
> -	/* tentative SR-IOV mode */
> -	enum xe_sriov_mode mode;
> -};
> -
>  static const struct xe_config_device device_defaults = {
>  	.engines_allowed = U64_MAX,
>  	.gt_types_allowed = U64_MAX,
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index bba592fb612c..7db2f46291fa 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -8,8 +8,8 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +#include "xe_configfs_types.h"
>  #include "xe_defaults.h"
> -#include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  
>  struct pci_dev;
> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
> new file mode 100644
> index 000000000000..3be7d6160b4c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_CONFIGFS_TYPES_H_
> +#define _XE_CONFIGFS_TYPES_H_
> +
> +#include <linux/configfs.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#include "xe_hw_engine_types.h"
> +#include "xe_pci_types.h"
> +#include "xe_sriov_types.h"
> +
> +/* Similar to struct xe_bb, but not tied to HW (yet) */
> +struct wa_bb {
> +	u32 *cs;
> +	u32 len; /* in dwords */
> +};
> +
> +struct xe_config_group_device {
> +	struct config_group group;
> +	struct config_group sriov;
> +
> +	/*
> +	 * Fields sorted by type (largest first) then name: struct arrays,
> +	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
> +	 * type, entries are sorted alphabetically.
> +	 */
> +	struct xe_config_device {
> +		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> +		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> +		u64 engines_allowed;
> +		u64 gt_types_allowed;
> +		bool enable_multi_queue;
> +		bool enable_psmi;
> +		bool survivability_mode;
> +		struct {
> +			unsigned int max_vfs;
> +			bool admin_only_pf;
> +		} sriov;
> +	} config;
> +
> +	/* protects attributes */
> +	struct mutex lock;
> +	/* matching descriptor */
> +	const struct xe_device_desc *desc;
> +	/* tentative SR-IOV mode */
> +	enum xe_sriov_mode mode;
> +};
> +
> +#endif /* _XE_CONFIGFS_TYPES_H_ */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
