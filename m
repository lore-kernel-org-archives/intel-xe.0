Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C77ACDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 16:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F6F10E50E;
	Thu, 12 Oct 2023 16:51:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0510E50D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697129486; x=1728665486;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VvdUUm0sGhNlagd8ie8uBuQYxvZPwUXPny8AVbbcwms=;
 b=h7FdgFSC3aKMpaFGJIfNmA5mEszeLAjBgVja4oBv7rr+hHU9VoHEz/YO
 m499StggGAFrR54nhMzsFkqOdNs5DW+u9kiGGwcj7uK9mxDCHzYo2GahB
 UPf3Ipv5XXBwxPPOa5UYLE3JeMbzJw35de+2q7J6effktheFheKqmmLqX
 h7vyXyWXpjlHnoS2j+ENhuqUu/Bj+dCxiVLJTzSl9WIPc+AimqG9F/6Gj
 Dw8NiOb90BMeLOO3+nGSK6LXEjsUAo/pPWz2qx4llyjY6GUr/7C95St7r
 uxRcyH+bdQOLbbnqdo9u6Vc6fSDYHTly09hy4LzALP9k3Py7FigG/IQvh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375328379"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375328379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 09:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898189327"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="898189327"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 09:49:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 09:51:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 09:51:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 09:51:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 09:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIZLSAhCuJ6bVObOHD40W0lHCIuJ2XYceBzhAtYZ0OVk/nLXhrWmk+r/ANxYrZmHdrODHu1R1tidgXJDFHnbvlqGq2GLRBkdoI0pd2+SjUuuqgBnECp4jm8fhvmGGgG86ERCgd7QnYz8E6RzauiDf1N01AjWqcCsTMEEDiARkhos9te3oXUVqbiiB5zcOicOoSTFdwAsnCSQLOaeehwPSz5znX1np0+HaP4rE99ENOJQKfD4ZnnJ5zF5SJmD2Q4CX1UpjfNGt2UjuTk3bkJgxC05fQCiECUihCwlQVUCiRibn2NZ+no28/dp2wcgKYKvpmBmrC5lBYEEC0cax7dMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4QRKHNqey62pCQPsc6J14U2N/Wy0ZRRdFYhmM90kkM=;
 b=h8JwYvfCkqwBa3t0wvDh/V/+b8Ba3cp7krXc79CPbCFZA5mCegyhjOWd0yUMfxlvhhxUvNTqCyJXBAIMDVzzPnnBz5jfg1/obhf37nt8maCWfQ9Bxt90gH70sNIio44lfWbKTV0PkRN9idErZq1iMZZv1zHbvjgLlshhhNfUjWxDABg9KaplOxevqN5aK2q08XWcYCZyzUYeKvnY9cXNd8fvjeO1Oe8R7Xo8PAqma1nE7REeKg6jPU32UA8HjIvt+62EwrzvMeyxaF0oOPAaET8QwlMtat/knaOqldBsRQr9TeSh9vQ1MHpK0l0hKzd0LpFrfvI+tGJvebW5H5Tthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Thu, 12 Oct
 2023 16:51:22 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 16:51:22 +0000
Date: Thu, 12 Oct 2023 09:51:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSgj/AzRIL1Ge//q@unerlige-ril>
References: <20231011172643.826452-1-ashutosh.dixit@intel.com>
 <20231011172643.826452-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011172643.826452-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8ff062-ae6f-4229-e7c0-08dbcb4376d1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGnUrOaF6nh3vkB/hjx6+bWg6YQBCjxZhTJ1PvclHvl9ps4ZSMUTgakWL1SxxAncQYWX3mEY2PpWdTxN3tcyfJahtERcwI5uSnQw03lttesusSWUeM0BPDTX4TD3FMEMOF2OcIM+YDf+2tCiC8Am8PsDmSkQCVvjP7RmjzoAFIFwLBI9s49iLDBWbUD1p/6fajb7EScICNPfHOlaaX1OIY1uMGjN0PElYByo+bvjbJAYKyLUas8K2kJG/3nGarpZQlQ+QvS4zsBgZHrprUkz/QD+Rr3LYreOycbC65+AK7vUOpn5H7keLSAWOphNDvIDKxeu0anbc5bjNjqe9YMJFY20DpNPFekV4+DwCenrShc7KmLH5RgB49tpHhSwQEgTAwZD3MieQeokTIvncLBUpELm4FoeE0kSxk6pvqERsivLdTKlko7382B/YBtMbojre41P2GYQllVUnaXisVLJenpPCQmIxQUD7LcUEOu0kEpnoxz+PXJpid9kUbx0DANN9mOwuIgW84acLA+eBY+LdbxSYMCntjgtG7/eXg+vSm0+QdvyJXwp1ZL2OpsSUxcc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(9686003)(26005)(6636002)(316002)(8676002)(86362001)(6506007)(2906002)(83380400001)(107886003)(82960400001)(478600001)(6486002)(5660300002)(38100700002)(6862004)(41300700001)(8936002)(4326008)(33716001)(6666004)(66946007)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dlLzJkakVPQ1BRUjVJSHlaZStYNGVpNUl2cGxPcSs1bnpNaEQ1K2ZaTmo0?=
 =?utf-8?B?Y0lEckpCNUR5TUlsZmVOajAxcXlmT1VrYTE4MUpEczFnRml0UXlRdFBvOThL?=
 =?utf-8?B?R2VhKzBUTWtiTzRoSDVHMXJsbGxHaEpOdkt2anNoK2dFdnpLcHhubS9VNUZx?=
 =?utf-8?B?end6dXVtcFhMYjZ5eGJ3dWJZQmtJd1FhaGRhMytzb0RpNFk4cTJQd0pYMm81?=
 =?utf-8?B?S2dHK1F1dEx5dWZsS2syU1J0NEZ6cFhtd1FycmFVQTJ0bG9yN21UZm1kMW5u?=
 =?utf-8?B?emhSWEtTNUxJazJXMy9VTTFveUNkdERuMy9uRzVteFpJZVdmMlgvWXZEaVQz?=
 =?utf-8?B?eGE5YmR2R0d4VXViSDdGS2pCTFU3ZDlsTFFtbDJNZjQvWUJveW00bjVCT0pj?=
 =?utf-8?B?N3ZydGxjNVlQTS85WDgxdEZNODc2SWI0c0s3dy9icHdJRkFzQmQ3dDJGVFJk?=
 =?utf-8?B?ZWJJMUpTU09pWlJDUytFK1FKMkF4UENnNWcwRWNEdER2b3ppMGxVbTJ5ZFdJ?=
 =?utf-8?B?YVZzRmRrWUJteFI0QjhiSHBPVWo1K3QyN05oV0tFWXFFQnV0SHVKeGxJbEZF?=
 =?utf-8?B?K2hSZXBoVTZWcG5kNnVKK1lkV1JiVWhwOXR0eWxFQis3MFg1SjcyTDkrMG8v?=
 =?utf-8?B?WWQzOWFJSjdnTWg5RXl2YmdUVmd6UEdkZ1ZoOGgvR25saTM5TjZpZnpYazF3?=
 =?utf-8?B?cTM0NUFXdkh2dGdPYWN4WlF2dnU0OWR0R1dnTzJoUHBvUzQzT2drVmlvVDlI?=
 =?utf-8?B?a2Nzb2dMalZscGcyWDRGNzJaREZpYjFPWUdLT3ZBUzVDcU1jVzN3V3BnY3ND?=
 =?utf-8?B?Nk1XcUtXVmVLYm95dEFmbkNFbm8rOXZEYlFwNkRKWm03MHZyblRQa2QyeXdZ?=
 =?utf-8?B?UnIvWnMzMGJyYnplKytFSXIyWEQ0SEpFR3lTaUNyaVFKaTlybkE3SUlCSlpN?=
 =?utf-8?B?Z3JmQVJ1NVY4RWJUZTFiakNLQ2JxcmEwdnZrL2dqNFpYSFhFSy9wMlZTQnpm?=
 =?utf-8?B?TlM0bHl2TGxMWUMwM0p3dTR3dlI1TXdxUmIvdlFOOHF1MDEvSGFIbVZsb0Zt?=
 =?utf-8?B?NnhDSW5DQlFTSzhpZVN1dHY5QnczdHdRSTBQZEVHV0tkanJFSnQ5Q2pHOTRT?=
 =?utf-8?B?NmFhcnZkblNKcE1rb1crMTN4RnR3NmE0a2tjbGhScTQ0ejBpd3o1Wlg4Y1Z1?=
 =?utf-8?B?eDlGUkRYdEM3ZjUrTVJKeEdqYmhEWndBZ2R6MXF2VE91LzFyb1BsYWlVcUEr?=
 =?utf-8?B?UmF1UlI5ZG9IaEVObk1Cb0p0bzhMNXBJSWFERkMwS3htNFNQS1UrUjRpTXNE?=
 =?utf-8?B?M0pHUzBJMGwralNhUEppOVdOQit3U1IySitLd1JDQXg0eXNoU2pWTnRLam0z?=
 =?utf-8?B?UmFEeHgvRFIxSWI4anFBZ0E5bnJQMUFoNzVmcUhNN2VLV2QvOU5tWFVCYklS?=
 =?utf-8?B?SXhNRXhWcGtMamJBM1Q4cENmdGNoSzU0cXJ6SlU2L2N0NG1MTGFCN1BweXFq?=
 =?utf-8?B?c0RUUEdnK1UxdlJrc0FwdExDY3dhbHJURlZzMDVCUUx0R25WbzJsZ0V6MCtw?=
 =?utf-8?B?SnZzY1ltQXIwZDJocE9QRGFYV0JReW5sMXI0QTJzT0ErY2VoMDFXcHg4b0cr?=
 =?utf-8?B?WUU0Y1A4MTM2aXJzZkJBN251MlY4bHlYYWwrQ2xNcVhsQ0txb0RHb29kVnpQ?=
 =?utf-8?B?Vy9kV3ZKbFg4TGYrUjlYc2NPQjg3aUh1SE5YeTV1SnAyZlJJUmR1ckNWdHR6?=
 =?utf-8?B?Z3hpditXNVNWSllCSHVuMEJPcmV6YlhHbFViYXVySVgrQi80d21UY2hRZk9l?=
 =?utf-8?B?ekJoUGttSFUxYUhMYkpYVFlPbXdmV08xMjJNenpnanRDaEp1UUJQcG1VcHhX?=
 =?utf-8?B?ODduUGF0dG0xMHRsY0xLLzE0NE1laHk5dld0aEc2RlkvdGZzYWlxVngrN3ZH?=
 =?utf-8?B?UzdIVlJCMjBsbGZMTzl5RnpUd1pkWC9nRXkrZ3puZ05mS0dDajljK3dhWXlq?=
 =?utf-8?B?eWlLenZiSldVakxDckNTLzFMcjFxNjBRdm5GOHZtZlgwK2RLWGdwbUN5MTlW?=
 =?utf-8?B?S0lWZG9xZ1plL2dBaW5mK3RTamVFeUhzb2RqeHVBMjBEN3B4cVlvalFtWXNx?=
 =?utf-8?B?YllvNm1HQlppR2tGM3pGb2hrMHV6eU0zZHZTUFdVdkFuRFVTQ0x4R0l3TUty?=
 =?utf-8?Q?2VJUQww1GFvtJ9cYK4VaRlc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8ff062-ae6f-4229-e7c0-08dbcb4376d1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:51:22.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZVX9fWRfel7i4I5h7/qGzjX8yfnf8VlmT6iIDEf1dn2qwpH9Cdi+lr28Mk4cOjcxeNfxYhPb6v2yv0H3f7lZG1QmZ/Vi3qGRaYDPlFA3bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: "Perf" layer to support
 multiple perf counter stream types
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
Cc: robert.krzemien@intel.com, ogabbay@habana.ai,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 10:26:41AM -0700, Ashutosh Dixit wrote:
>In XE, the plan is to support multiple types of perf counter streams (OA is
>only one type of these streams). This requires addition of a PERF layer to
>multiplex these different stream types through a single set of PERF
>ioctl's.
>
>In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
>defined. These are expected to be common to different PERF stream types and
>therefore are defined at the PERF layer itself.
>
>v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
>v3: Rename 'enum drm_xe_perf_ops' to 'enum drm_xe_perf_ioctls' (Guy Zadicario)
>    Add DRM_ prefix to ioctl names to indicate uapi names
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/Makefile    |  1 +
> drivers/gpu/drm/xe/xe_device.c |  4 +++
> drivers/gpu/drm/xe/xe_perf.c   | 47 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_perf.h   | 18 +++++++++++++
> include/uapi/drm/xe_drm.h      | 49 ++++++++++++++++++++++++++++++++++
> 5 files changed, 119 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 175a357366d96..fb3eacbe3d6cb 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -88,6 +88,7 @@ xe-y += xe_bb.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>+	xe_perf.o \
> 	xe_pm.o \
> 	xe_preempt_fence.o \
> 	xe_pt.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index ef42c33e30558..3c0c28c6f9fb8 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -28,6 +28,7 @@
> #include "xe_module.h"
> #include "xe_pat.h"
> #include "xe_pcode.h"
>+#include "xe_perf.h"
> #include "xe_pm.h"
> #include "xe_query.h"
> #include "xe_tile.h"
>@@ -128,6 +129,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
> };
>
> static const struct file_operations xe_driver_fops = {
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>new file mode 100644
>index 0000000000000..de430065e0d27
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -0,0 +1,47 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/errno.h>
>+
>+#include "xe_perf.h"
>+
>+int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_perf_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->perf_type) {
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
>+int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_perf_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->perf_type) {
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
>+int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_perf_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->perf_type) {
>+	default:
>+		return -EINVAL;
>+	}
>+}

I would just squash the 2 patches here since this is a new interface and 
we don't care much about what existed earlier.

>diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>new file mode 100644
>index 0000000000000..7ee90491132a0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_perf.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_PERF_H_
>+#define _XE_PERF_H_
>+
>+#include <drm/xe_drm.h>
>+
>+struct drm_device;
>+struct drm_file;
>+
>+int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>+int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>+int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>+
>+#endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index d48d8e3c898ce..d734d2ee385b1 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -111,6 +111,9 @@ struct xe_user_extension {
> #define DRM_XE_WAIT_USER_FENCE		0x0b
> #define DRM_XE_VM_MADVISE		0x0c
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>+#define DRM_XE_PERF_OPEN		0x0e
>+#define DRM_XE_PERF_ADD_CONFIG		0x0f
>+#define DRM_XE_PERF_REMOVE_CONFIG	0x10
>
> /* Must be kept compact -- no holes */
> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>@@ -127,6 +130,9 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>+#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)
>+#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)
>+#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)
>
> /**
>  * enum drm_xe_memory_class - Supported memory classes.
>@@ -1093,6 +1099,49 @@ struct drm_xe_vm_madvise {
> #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>
>+/**
>+ * enum drm_xe_perf_type - Perf stream types
>+ */
>+enum drm_xe_perf_type {
>+	DRM_XE_PERF_TYPE_MAX,
>+};
>+
>+/**
>+ * struct drm_xe_perf_param - XE perf layer param
>+ *
>+ * The perf layer enables multiplexing perf counter streams of multiple
>+ * types. The actual params for a particular stream operation are supplied
>+ * via the @param pointer (use __copy_from_user to get these params).
>+ */
>+struct drm_xe_perf_param {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>+	__u64 perf_type;
>+	/** @param_size: size of data struct pointed to by @param */
>+	__u64 param_size;

Since this structure is expandable using extensions, maybe we don't need 
to worry about the param_size. We can drop it. The size would matter if 
the only way to extend a structure was to add members to the end.

Thanks,
Umesh
>+	/** @param: Pointer to actual stream params */
>+	__u64 param;
>+};
>+
>+/**
>+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
>+ */
>+enum drm_xe_perf_ioctls {
>+	/**
>+	 * @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream that
>+	 * was e.g. either opened in a disabled state or was disabled via
>+	 * DRM_XE_PERF_IOCTL_DISABLE
>+	 */
>+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>+
>+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>+
>+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
