Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA69C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 22:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8D510E927;
	Thu, 26 Jun 2025 22:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mx1EPP2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199B10E91F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750977963; x=1782513963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0w3jJeeSmnw3oF6IFUXcN52AXrWtN0a3VG2mPVopQBw=;
 b=Mx1EPP2UCq3fIjiPLAFdoYVF/iu+nSM7XWJFEtx51eRbMb3FSOzieD1f
 KDXTIsAZomdyz2n3swH08L3lfjBVklGeyIKBG5I+Md66+uxhRy70NOrbg
 YsNpNaDcSjhGtQ4MMfZSZ6qZOfafOiPXNL6AW+ZOBRblJW1UtpvLEudoO
 /VPOSgG58R/zqmBpri1OxRCsjZXHONwM3deKtYhOk2MQpNT6JnOcTlEtK
 FsGAsBPcJ3WjotCKOYCZRz08ov4dzsECAlzOOxfWHaDJ7sVsmy9EHO9Cw
 qUttO7A66DTZG6dGPQIQOEyl6H3ZqAUjDy3iPH9ZMZEVZQqcFR1DhIQ3j A==;
X-CSE-ConnectionGUID: QLDjYTvDSSyHsuv2dE9YLw==
X-CSE-MsgGUID: d8BjUYFQTcCJytXOlybGig==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53253673"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53253673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:46:02 -0700
X-CSE-ConnectionGUID: tLB8btgUSlKp0lwa4Fwftg==
X-CSE-MsgGUID: 6ex4wGawTpOYKIpFVBpPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157203802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:46:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:46:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:46:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7XGwHh4xXR1V8tponsg/XS1vvFcMmjqUyScaCtlX1k6+5XLAUyGRkcLWEnxAcP8bGWeyzznXdWG/oPlWPEveMm8iZwS8KtXfQry75N3Iwk4TCDcPinlLx7S/fyxh9P3A5Yh+w2QjOU4rGoynUTywtHrDKmbbDHyZR7BwbOkNa5jhmPcDfpdEHZOrlqNjp0A/vHVh+f+pUERDrDzjudsNqyXOn9Rq48IeROQ+9wejsdMXgxoGNrPMIyqYR70fUCqGinJwtYd0NyP4LTW87pR+CjyXVmvfSZBzzGbqBDpdU0XMscgEAEDTuBUPpbQmtD76SBLc1gveH38zRtV1eLadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+0+9c5LPcM0Mi1edaPrvpI/SHE4fGIjGBp+jT4WtWE=;
 b=AcBXQ/1R6lxMxx6+64V6z/rsNnuJzrcgvFRvmbh0afOCxl4F+gCRpD7UaNU8EyfBCIwcUHpFC37962/VslDI+0G5lipsm0Vl6QQz5I1SO/nZ2R/fcqW8BjQrHVkWwpCBTuNwyawcMEDLdRsWtti6jx8glv8zXDZobklzGUmKgmYnHUAV3xvvXnDhlXWh084qfhjniFCINXyWrQ8Msy0QnhLvuQdUOTB+t5djRxCq20vgSGEPb+pEQS7vLCX93cOqUm1XiwpnHrUf0+U2N4EfurQH/1rZM3otUTtGEsBMh3YAcPTn3JDpAKXiPtrh6ULrEBlJ2pGgoqD/riRnBhzI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5186.namprd11.prod.outlook.com (2603:10b6:303:9b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 26 Jun
 2025 22:45:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 22:45:43 +0000
Date: Thu, 26 Jun 2025 17:45:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <qu6c5gpzqkc7cktitdnab6d7bljpvnbveyphvmdkgutie23adu@j55duxm2l7ik>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
 <20250625200751.205166-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625200751.205166-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 63688c06-8a46-44e0-4b07-08ddb5032efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MkmqwKwxjULbBa5HCskU3sPUpIJc1xgl3DQPyvEpJJRFVF6dmjPEi14l8Rwl?=
 =?us-ascii?Q?Bs+SvVU6N+5jPBBZ+cyyAtmKTXe8JeKt5IUS3vNIqzD1oI91FGlQUmBV/m+y?=
 =?us-ascii?Q?OTQ+AG36NPMZlLq9SK0zm2+EhzY4alBa3LjBMofpVt9RECri6GRukPmd3PIO?=
 =?us-ascii?Q?kXgm4jBnARovEzP5uSCs8wesw3UMf36/IO972D98GGxMjhea8tD6V9C3G4Hh?=
 =?us-ascii?Q?8hQoQQ6v/SZJQTdqzdO1ChkbH08QVLY0w0TTy2yGXwqq/rGjbgnPdncorNxz?=
 =?us-ascii?Q?zV/d33MMWOB5PaNaAZ5iTqRUwAPkVjUdCMH+QetEVEN+OaAFfXUJINjqQWSi?=
 =?us-ascii?Q?XkVO/y52qNz58Ts+Zr+BWNZA3hiQYUI54YOWEGPuasrcILBMFJ9BA1zTTidD?=
 =?us-ascii?Q?pjc3eItmozP2C6g85VUhIkAAhxRE7Fs4dE7kje8h0HsMbDgMPWWFhHmkumiu?=
 =?us-ascii?Q?UqFXxs6pWrggML1zcg6BB74+hzre3o6bQ8hSM2bfb6HyynRZXs1weNU+GJVx?=
 =?us-ascii?Q?83qLMCg69rR5+BRBMSPp4BQkjmYrbQCdgk0lrx/A/Aocugtn0Ndoq94CBjTl?=
 =?us-ascii?Q?Q5nybTjy2788XlEt2Y4lTpYnjeYg211ujtiEogYjToamyoPbzteqpzsX9e+z?=
 =?us-ascii?Q?yXZljQA83PpwxlfSIxc+w253TUEepzIgSYriJskRPeMTVYB/yKi7F0FcwX/b?=
 =?us-ascii?Q?+vXVb+6U1g40Q5oxc0v6HbwVDm6lXObHOtjptrAXLE1x6DSeSNgZrG/LbInv?=
 =?us-ascii?Q?8X5aBMYp4VLXm/jhcNvoMj4GLkjclURNXFUhj0o+iliOkAGtB0CpylwzgCh2?=
 =?us-ascii?Q?Oh4+w4pNBdmYcrMuGbYEQyy7BUKuKRwmAL5WsvQQAMZGkAsVGncl4AQEAPTu?=
 =?us-ascii?Q?QVRna4vciVgMZKMIGEJimTJuEIUsPJ4ayDMv57Ge6wTHR4ydLEHN6+b5NaF4?=
 =?us-ascii?Q?/4CSAxLeOX1LfaWkfEYh3AZaMxbas9JC1Ygr2DDZux5LNI01Cg82zNh7s5Td?=
 =?us-ascii?Q?RXUJFHWsZHrya3XK1Q+z1OJpPwuOwXmljK/mL9XCAJnu+mWEoNEoUrgEe7JP?=
 =?us-ascii?Q?gSG1x81GBwOekkp2Iun8R5lXDnzEO6LpQwBUP6jY8KpvOdhkBugM2cxJ4v59?=
 =?us-ascii?Q?tudlmoMsPBLBGleSRYK2FkSFuIwcCBDXN+yyYm+QQz0PtaXZNG46xvEXLq8Y?=
 =?us-ascii?Q?B0ld/1lEesKxByT7QtMiOUhpzKfuDEh4m5G4KpqxQ78s04scyNWJqgwYLrju?=
 =?us-ascii?Q?UZ5CTiaHSe32bene+Vs1+fXRB6Bt+ZSXujn2nwRc+isKHYktg/oPKh4BfHBU?=
 =?us-ascii?Q?wx1197JzfRDG6nY+V09AMezHoXjnlH2QDcy/HGV3uaa5FRWC6HL8heN/nmLN?=
 =?us-ascii?Q?XB2Or7HpSrot++v0tUC9SMa4FQNgCgl4KWuviJNPBOgKBwGwOB3/6uRLZfQl?=
 =?us-ascii?Q?Wug5VxO2wAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZtD73qiHweXSTgkGDkONGQPsrGcwwbSgm/7T/DZWKsjAa0hs25GN0Qmsvywi?=
 =?us-ascii?Q?qEgjNKcdMqGvw19Xn8lASQrcIQHBRuYum6FRbfAD8/Cf/ry2t5Eikhq/9OBH?=
 =?us-ascii?Q?dn2GMCJGJumyDyHcuS5xPHSLFe3N7uyFP60Sou7/TyUtNYO43PICIwQZ2U4x?=
 =?us-ascii?Q?TPCgReCCYqFWoPCoIvYNy65rmUcHp8bQXFZqO8odkMhtOcR54QxkPcQkq/DQ?=
 =?us-ascii?Q?gtjmtnFkWtI3RDrCOa94cBaWre2vh+tkBTJaNVKburoTaLVxsvxX7+CjrGKT?=
 =?us-ascii?Q?VIOSiacnxqqrfdbF0RmGulOwymg4Mi1kjIM2hXIcIcWj2BSMOA9rk8e8Gu7D?=
 =?us-ascii?Q?2Ci+9w1T6LIeKkygJZ6xVFEt6rNXmnfShQitjEadGMaZYwOvM9so7BPF/UgA?=
 =?us-ascii?Q?FbQ26j9DMl3+TbmbnBQp3oen0hOyn1ZVlyLhri5Jr7Gp2INZ7u933uUfaGQJ?=
 =?us-ascii?Q?2nV+Eijy/hGfmyLgVsteyupO+3EGT3Eo100Fjr4PdcHzDdHgEdqNp83KKrMe?=
 =?us-ascii?Q?JA+t3ztIL/LKT0w4Ad+M8OBLJIyeJYYHW20c00zdzWi0P7EvevLQoLB4+kLa?=
 =?us-ascii?Q?auP/tZBqtEkxKoCDbOg942xqwWdBP+6dzTF8zdnP7nnc5SLmIkm4O2v1ILkR?=
 =?us-ascii?Q?yKUwiF9opVg+mmFQ4D4aKHuu8t/OLudkpuJFjO7+CYGX6uQsh8t3YVPbtipw?=
 =?us-ascii?Q?4QcMBGgNXzYw2M4izKywF3e0cXD+vW2ppicSQDRDpU41vHOm+JFNc9xWR217?=
 =?us-ascii?Q?9QZbNo/TQFnw3qmAL1ektXz94WCfliMyz5+yp0pIuplA19C7TClbs7ne5PfC?=
 =?us-ascii?Q?ibOHJUUKSGudHgLltqddeFkxe0CJl5Ik4kvDXm1CnadyjYGLV4QxVsAQTcpE?=
 =?us-ascii?Q?IthfG8ehyw7XEj5UKKcvez4Cd1zxixS5oEwABLoZgYHxbokb+UG1FXiUbXqW?=
 =?us-ascii?Q?FKjCoBtrL7NAcUxwtWLvkawTWoJTQ8ppP+1tQ2Nsii5ko2AqQp/k034tQDHB?=
 =?us-ascii?Q?aZCDcW94wJ0tRtktqmF2ZfOnjyZ8OsXbFqY/vEMeGSLNSAowSrWUI6HlLgAB?=
 =?us-ascii?Q?CSCNpx/LwkHIG7PQBcLV6a92X19zqp0XMJR8NRQetlHIIl9+g1rSCtXC3R25?=
 =?us-ascii?Q?ixMgvWzlbHHqtyip6OZqTsEZHDnTaAXL70WtgckLk0BhPQIPKRrIRECuO7Tt?=
 =?us-ascii?Q?ggm2+5TjD1T6cMfcvUuVjO0Ut6SiGLvFg7dDhIw2EoSjPdVXSePWipueq5BG?=
 =?us-ascii?Q?9vAd2CRBqk/BMrJj1mstf+3lsLQ8oZijovgdQOGJtdrYcMZdLSz32goXcVbR?=
 =?us-ascii?Q?TpOv7dgAqJP0C06590SASVLlHIaCtFQhL/UApIYkfiBfaAIBJNfOF5f5p0l8?=
 =?us-ascii?Q?+26lzDrsssKtkPV5jCUXRZsYzOWIO14DlX3I+UCAReVA22nBM8RhkPYyvnWV?=
 =?us-ascii?Q?pVXTjTdk/Dy8pire1fFp5B77BVouxXy9p1L9kSOHfgoKoDTHs3psHh+X/aq0?=
 =?us-ascii?Q?d+/RTPvp/2ABD6z+lglWgr/S6Yu3ikkpv+qLeNWud4u1ZZi9I+CXs7NMccLp?=
 =?us-ascii?Q?GuW+hYwgdNvS7bxqI8Jhk6/kC/aLE6NPbhT+PQUgjnslWGLRg9/FJaJTb6R+?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63688c06-8a46-44e0-4b07-08ddb5032efd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:45:43.6291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABO4cwxhCtD5Fx75pefnEs5KPpe0/BVUg6m61+GE7UqP8JNeojGkeYpigWyhKYWbr4lmSwZUJY4kX+DYdoFRdHbMPJImjxY8iv3Jkdhxdy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5186
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

On Wed, Jun 25, 2025 at 01:07:50PM -0700, Matt Atwood wrote:
>This workaround only applies to PTL Compute Die A0. The reality of
>modern platforms is we're Multi Chip Packages with logic spread across
>multiple dies. Because this information is not available during PCI
>probe it becomes a bit more complicated.
>
>This workaround needs to be applied on PTL until we prove that we are
>not Compute Die A0 stepping without reading any MMIOs. So use the new
>XE_DEVICE_WA infrastructure to apply early, until we can determine our
>stepping.
>
>There are at least two ways to determine Compute Die stepping. This
>patch uses the Media GT stepping to map to Compute Die stepping, in this
>case Compute and Media dies step synchronously.
>
>Since we're using the Media GT information to determine Compute Die
>stepping, use the XE_WA and the oob infrastructure to come back and
>toggle the workaround off when we know its safe, and after GT init.
>
>v2: rename SoC to device, avoid null pointer dereference, update commit
>message.
>v3: rebase
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c        | 7 +++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
> 2 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index a9f708608f3e..a294a1b26d8f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -34,6 +34,9 @@
> #include "xe_tile.h"
> #include "xe_wa.h"
>
>+#include "generated/xe_wa_oob.h"
>+#include "generated/xe_device_wa_oob.h"
>+
> enum toggle_d3cold {
> 	D3COLD_DISABLE,
> 	D3COLD_ENABLE,
>@@ -896,6 +899,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> 		str_yes_no(xe->d3cold.capable));
>
>+	if (xe->tiles->media_gt != NULL &&
>+	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
>+		xe->oob[XE_DEVICE_WA_OOB_15015404425] = 0;

this is totally untested, right? oob is an array of longs... for both 32
and 64 bits up to this patch it will have size 1 and you are supposed to
set the **bit** XE_DEVICE_WA_OOB_15015404425.

>+
> 	return 0;
>
> err_driver_cleanup:
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 96cc33da0fb5..255e67113406 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -70,3 +70,5 @@ no_media_l3	MEDIA_VERSION(3000)
> # SoC workaround - currently applies to all platforms with the following
> # primary GT GMDID
> 14022085890	GRAPHICS_VERSION(2001)
>+
>+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)

I don't like this disable logic. This would make reporting 15015404425
as always disabled when looking at debugfs. I will need to look at
earlier discussions and think a little bit as I don't know yet what we
are trying to accomplish. Maybe if we have 2 positive checks with one
being a "_early" variant (based on the commit message here)

Lucas De Marchi

>-- 
>2.49.0
>
