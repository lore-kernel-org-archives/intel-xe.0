Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B24DC52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 18:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F7A10E512;
	Wed, 14 Aug 2024 18:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSUpyuNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0E610E512
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723660994; x=1755196994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jp3Hstu0Yr9fizHFxHdWBZWFGRv7n1lvM5tfTf4lsR4=;
 b=TSUpyuNF9HrJsZZxQE9uvJ1CiD3VjRD/MxyzK58vj7y2Gnge57k3CXOA
 cMOMnijd7SLx0rhR30eYnI+IKo5uRdFutUZRttp1rMse2hXbhha0jXi+K
 fGyQTOkLe5k+zGKMS2sXkZET/Nu+OFN8YE6oVE7S57cwIkIeJtaug6/3c
 KkdDETUDyzZMArbwekmY41qjOElNA6lTeXRssSoymyrOFoASHKpFxJR5h
 tE/xM8uzXGxm7LRLLSQ2/EfiB4x30puI5dnB710x0lhs4iFbywMs6yqdG
 8lSH9ybOVuIyBVhnZOyEiULrFIKPBg5SPrwNR5k12FHD2QTIdb15//his g==;
X-CSE-ConnectionGUID: 6cLxtDJCTNGo4rlUiThCZA==
X-CSE-MsgGUID: f6tjnlugRkiKvJylROOrBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33286346"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33286346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:43:13 -0700
X-CSE-ConnectionGUID: /FJVSpFWSa+U6VUudtSo7A==
X-CSE-MsgGUID: ppEJis0VQjmjmqB9vF4e6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59390509"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 11:43:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 11:43:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 11:43:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 11:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgXAQpMNMCgUi71GvhUplUiqgjMunSZ3Bq8TEHq5QuDkEDtReyda+B6tUk/G04SkdpBfH16pBzBntdMasKS4B2h4snjRWCg/icLo7qppiGlzCd3eLn0NkSawiM0TXQ/BDlHDvehJGlSJZo1Ym2O5UfCCRxxg7/eELFDTZcGSW59RZjlpHhLtRLVudbTW2oPl7lvJCx8/x/7LXv/RCUWEoFHeT7FEd2CE7eU3MdiLCL2lZ0ilX9QEx5bjnKTqf3PLYdHYvHoh2ZALtcePQK0PbGhaUfm8vQyEGSjNoEuaeeqA6u3Vv5kZ9Q/DcCg35nttVXq6NJsgbctSaeULsfW3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awlCWjDylbcpqusrsgRyTO1OPvaZhCyEBCbCpxXWUe8=;
 b=CGg8DWFrk1ershP6t8U2GaletPUGIk0roMVMqX/XLaOqvzkdtPRiO/CLkdraWTY4ls+gXgezGkMRi1knKHbf27hwTMCV+sq7gsaxN9XO4n3J9neEouobZ1c0jutT0JOgM6OZOrWuJzaIamqTAj676/+PVxToUKkyNYRuMwVR+sh5cjWS8y1uS8X/ChoTA904Ufqydtq+J32UQkE0ZgtLvCN1BEJSG9HXdvyM4BPrVpN1EdEsMFSMpaDK4VYRqTCZ53Urct+maQ7VIhstd0+pK0hF1IsyAsYrNoRqdGTt1MquEKgQ9AOi9FrpUEdY8oLUgLh9hFn2Pt/JcNgksSGrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 18:43:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 18:43:10 +0000
Date: Wed, 14 Aug 2024 13:43:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Farah Kassabri <fkassabri@habana.ai>, <intel-xe@lists.freedesktop.org>,
 <farah.kassabri@intel.com>, <rodrigo.vivi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe: add wopcm device info and set region into Guc
 registers
Message-ID: <3wbg35ieeexx2cr27vdwereemt4c7mcwiqvcp5z6hlr2y5tzeo@3nflwkxudwx5>
References: <20240814120432.2040511-1-fkassabri@habana.ai>
 <172365802388.1939.8883103491907881343@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172365802388.1939.8883103491907881343@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:303:6a::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d2d998-09cc-4d24-9745-08dcbc90f1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YP6xLcat/ewTHYCFfARk3t1hTA0UdlDZEr86c38BenDz+QPLv/vRPmQF8cHS?=
 =?us-ascii?Q?io5oX5Jfkacyhd/c9iDasMRtzS4FNWCcuJjlBmEajmB/nxjsiP9e5ve1yT6d?=
 =?us-ascii?Q?dccOV1aaKbABgyfLBlbAaXI0VEU4RnxN8zAdnIVVZgvqOpctqAz3nafq7+Dg?=
 =?us-ascii?Q?4ysX/l6dLbRyjuijubp3Zxr7/lX6okKMtoMf/8ThVEv9/Dqds5O3aVkveYQk?=
 =?us-ascii?Q?a6MYttNObkTySeVcDxKMjBzaHzEsmPevfjs2lBNwCKwLqEsndAzROwOsk0lf?=
 =?us-ascii?Q?i7uLL36+EINlqI2YEsTyt6eIZ4UF8hjACF8X7mgGzwbHD7x6Q74k6bBNaJ4v?=
 =?us-ascii?Q?AuJ83KPElAVYnehBPyICI8t++rZ4MR9uABDGdc/Y+Fu2aAZp8XmDmgMVLiv6?=
 =?us-ascii?Q?dAyfKS+ueT61GU9c4FpbMNctl20mfKqWbLX98wAuIWBj0uZ4o5wraHVElex2?=
 =?us-ascii?Q?w+TU2n2vIX9YZLLeMKdH3JY3yq0VMPqQhe/QgbDDv6TOROOH8svwMpdoQqm5?=
 =?us-ascii?Q?sM8jfxnjZX5j4RAAT7tsjD+lULdMzQ8jWZIkVnutpF3cHUzaPoFGkNYNofEq?=
 =?us-ascii?Q?kuOPnN6cNaJ23N//spVtKc7e8Kqcn2MB+2iJZbkSk36xF2UQdCUDoqZ8RziX?=
 =?us-ascii?Q?hNOe8UQ3eYTo2gRW490PaLU1zjyHz9NxvQH08rFICmL8oHkdB+C+vzk6NR0Q?=
 =?us-ascii?Q?zTg5GJl7oWLUZtEKIFLpCILdO5Itf1z0L25JWE2J+v/7PdkHOBih19jSS8y3?=
 =?us-ascii?Q?qB6G++fHsRxamY6FeT7Jww8PnLdJwHJUJbTfTumnQbUMVpRTQcxOFuQxqeBM?=
 =?us-ascii?Q?zqdvMRCzaxGc55JRNTs4m2kqWe2MKPiBmbGCkhGbVJTEA2jV2XxN9BLGO8P/?=
 =?us-ascii?Q?UDlpFkfwpWsd1+0KoqSgNM1Fd8muiizexH+i14AadG/PTnmkCCOV+R6jLDbw?=
 =?us-ascii?Q?9PMjsyKdP1aIQQYhyhPWfdqGaOzUhFnylmcv9c/a9gEGa/+EISFzl8pS6vkt?=
 =?us-ascii?Q?lx58sz/GJ4Qgh8g5yjrGFBsKS/UFL2VQEoI6vMu2GvHpQ0cNr1q7iaTfNrue?=
 =?us-ascii?Q?7KIeatgBi4h7Z4kXRVdIHz1XK14b6AEqOwEY+QC7cmC0LiuRW0cV8V4y5v9e?=
 =?us-ascii?Q?Mw+XDCTauuqM+El2O3/1MLXpCijdVX5rfoqDtVcD9uC6s+oufISxZ2RAfbqF?=
 =?us-ascii?Q?Yb+7AIvMjhYn3Ep4UPNACzu0F2AfmJ9fxtdd4BE42XIzD23nkX2HHTPUQDWJ?=
 =?us-ascii?Q?q9iM/oq7GohPnwN8MB8nzRNOfi/+lydYHIQVuqLYXVBS/DFtWRLfAapI+adb?=
 =?us-ascii?Q?cZ1UcMxQrlunBwdkVN5a7EyZh8Ll6cqyhKM6StQjVIWi7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnLUSCEFG/yARLi14gYUViztVcO+6dyuJSHWCwiq7lBxcLT6w6wAGp1cnnfe?=
 =?us-ascii?Q?9h0oikUIqFZVpPtCqg5zUSlU/DSekjIaRoYSAoCfThvfcnZQn+V3H3bXQyT0?=
 =?us-ascii?Q?zK156SRkcLQxuBq+3AXzUVICD8jq2oqQHI6ynW7ag8o5lbgA24uXg2ym8Dge?=
 =?us-ascii?Q?VktLLh/CWkBe+PtNsmupfUw63fJITliQ1gHA+3zIKZv8PnCZPETQqh9HyfTx?=
 =?us-ascii?Q?nou8q1fFcs4UpL3cPO7P1ZTIKPXKRr+eHJERDIG11Mu1JAhF1Go7uLdBxlqD?=
 =?us-ascii?Q?7RiarQTI8nJTA7KMGTTgctqHy5muPfUB1O+G+J01txBA6CWrsnEDstI+fHIG?=
 =?us-ascii?Q?seciGzxSt5eE2Ha1QzrVGWHUScOdruy43ZlVCpHllCzaqvhcAe3t4FmQNJOk?=
 =?us-ascii?Q?mLTJnck66/Kv30JPHm91masZvHVtxPt4cIxZ/mQE+d3GhQP6FQi1gnOSjp0z?=
 =?us-ascii?Q?fYt8xAxQ8yIABIhJq5K4h2xrUBzkx7az7VyE3BD0YiAjmFPwGThscJ8r+wio?=
 =?us-ascii?Q?49upzpDlsQaIu+092g7ODdR/m/GUoFl/rkze7tE/I2Q7KO6cVvMZ4SaCrZD3?=
 =?us-ascii?Q?uCiFAl7dxHqpkIA+NNagw7xXKzmQyLvoqY+GSUSkK+00ESMxs1CuzEAQP92s?=
 =?us-ascii?Q?ajZmEz4ku1ynRUhj/98UbHLzu/lQ46tiQSUXYv1gQPgUhVspH54224GFoRJS?=
 =?us-ascii?Q?EgKDL+0N5zsDvxqav1wnxh4Bx8/P7euilPDzWexeCZ7xt84/na38bhoj8hyL?=
 =?us-ascii?Q?wI9NClI75PjaVCstiKgJ5DZahC4lJyupBzlMnV71l6g2w8qlkhb55sIgAmvE?=
 =?us-ascii?Q?GIf/KKGYPbZCacOl02W6wjPGvKAdfffeNonuWLspaN/BZpGFchivthZk250x?=
 =?us-ascii?Q?PSpEkA8AHt28yId5x9cc5k46PsUvM744D0EheKJNNgdRYO6EOtZ3Kcx2+pIo?=
 =?us-ascii?Q?tthcldcW2clUCxadJzOVwUK8SNJnhSM3XYbsRi7tGfALx3bcVQbVoWeW5CIA?=
 =?us-ascii?Q?khHOLJifKxZ0sCwO7AUDF6mYFEVj4nbdHjcZZGrtgEE0VKAfJp4mcM+PttDt?=
 =?us-ascii?Q?yEWACrWkBRh8B5OkVj79j4UxWm9Ql48mqDVPpoYAEllBTmig96+uFPnberOu?=
 =?us-ascii?Q?G5RRWPL9ywTCHsMY7W7A3DJIbrv8lfjvYpx8tfsa6r/K+6E4+sqowHMiDU2n?=
 =?us-ascii?Q?5Ygw7Zrku02DaX+TcxSfM/AU9mlTo9klwj6ss34J0Zum5wkOYFunlwTIVfO1?=
 =?us-ascii?Q?sBxRGDHtsxlb9yK4ETq8UrT8N4haz/UNYqXd1BYv1O+wwUiQmIbc2L/xnmKc?=
 =?us-ascii?Q?2OMDXu14EMAupW2u0eE+HHVkA7TWUhxM9xiz15hW5UV+wijNkSTkXb14w5cy?=
 =?us-ascii?Q?DQo/hbj8eTgK7umutWYVyx2SciIeu7K1ZJW3u10GgXZh2lwdGeID9jBTy1vZ?=
 =?us-ascii?Q?A8pRSKJvhzJRr4LG0w4qd13fce1xz319oinBAZxKx1ZEPLWHrakVvejevifP?=
 =?us-ascii?Q?X299Zy8okE/dwF+JO0gH/m7keub4j0yL9bBu8fDJDkMOr4Nc+sYpS6S6UcaH?=
 =?us-ascii?Q?YMKgCmWF6R35p2Lr75IM+KxBCoKOA3k0dI6Pi08j8bO3xg5yIwLdsANoxk1o?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d2d998-09cc-4d24-9745-08dcbc90f1ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 18:43:10.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPqMoYAXmIxqR/ZOmgV38Bh3LQXglRpcE228bRbrFlI2jHqZct3h+i8tfO+8ZL+8SoOXvdzhyzD9CNKdxMF+57/mA4UAg97GJC/w9l3zWf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

On Wed, Aug 14, 2024 at 02:53:43PM GMT, Gustavo Sousa wrote:
>Quoting Farah Kassabri (2024-08-14 09:04:32-03:00)
>>Guc FW is loaded to the DSM WOPCM region.
>>Guc DMA engine reads the WOPCM base address and size from
>>guc registers DMA_GUC_WOPCM_OFFSET and GUC_WOPCM_SIZE, do some sanity
>>checks and alignmnets, then load the FW there.
>>This patch will set the region size at init.
>>
>>Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>>Changes in v2:
>>Keep the xe_wopcm_size function and return the new attribute
>>from it.

wrong trailers here

>>---
>>
>> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>> drivers/gpu/drm/xe/xe_ggtt.c         |  1 -
>> drivers/gpu/drm/xe/xe_pci.c          | 12 +++++++++++-
>> drivers/gpu/drm/xe/xe_wopcm.c        | 12 +-----------
>> 4 files changed, 14 insertions(+), 13 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 5b7292a9a66d..013d61d11288 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -241,6 +241,8 @@ struct xe_device {
>>                 u32 media_verx100;
>>                 /** @info.mem_region_mask: mask of valid memory regions */
>>                 u32 mem_region_mask;
>>+                /** @info.wopcm_size: wopcm region size */
>>+                u32 wopcm_size;
>>                 /** @info.platform: XE platform enum */
>>                 enum xe_platform platform;
>>                 /** @info.subplatform: XE subplatform enum */
>>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>index 0cdbc1296e88..6d3b3ab50b93 100644
>>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>@@ -227,7 +227,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>                                &xelpg_pt_wa_ops : &xelpg_pt_ops;
>>         else
>>                 ggtt->pt_ops = &xelp_pt_ops;
>>-
>>         drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>>                     ggtt->size - xe_wopcm_size(xe));
>>         mutex_init(&ggtt->lock);
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index 7bb811b4a057..fc7dbf5ef74d 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -54,6 +54,8 @@ struct xe_device_desc {
>>
>>         enum xe_platform platform;
>>
>>+        u32 wopcm_size;
>>+
>
>Are we safe to assume that we can know the size of the WOPCM without
>asking the hardware?

I don't think this is changing the current behavior (if all the
desc->wopcm_size got assigned correctly). This is basically moving what
it done programatically in xe_wopcm_size() to be more declarative per
platform, using xe_device_desc.

>
>Note that xe_ttm_stolen_mgr uses get_wopcm_size() to ask the hardware
>for the size.

Yeah.. it's very confusing. xe_wopcm_size() keeps returning a hardcoded
value forever, xe_wopcm_init() overrides wopcm->size if guc wopcm
is already locked.  And the real values from hardware is actually
what xe_ttm_stolen_mgr is using.

Maybe we have some layering to fix.

Lucas De Marchi

>
>Copying Daniele here, since I recently talked with him about the
>subject.
>
>--
>Gustavo Sousa
>
>>         u8 require_force_probe:1;
>>         u8 is_dgfx:1;
>>
>>@@ -223,6 +225,7 @@ static const struct xe_device_desc tgl_desc = {
>>         .has_display = true,
>>         .has_llc = true,
>>         .require_force_probe = true,
>>+        .wopcm_size = SZ_2M,
>> };
>>
>> static const struct xe_device_desc rkl_desc = {
>>@@ -287,6 +290,7 @@ static const struct xe_device_desc dg1_desc = {
>>         .has_display = true,
>>         .has_heci_gscfi = 1,
>>         .require_force_probe = true,
>>+        .wopcm_size = SZ_4M,
>> };
>>
>> static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
>>@@ -312,6 +316,7 @@ static const struct xe_device_desc ats_m_desc = {
>>         DG2_FEATURES,
>>         .has_display = false,
>>         .has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>+        .wopcm_size = SZ_2M,
>> };
>>
>> static const struct xe_device_desc dg2_desc = {
>>@@ -321,6 +326,7 @@ static const struct xe_device_desc dg2_desc = {
>>
>>         DG2_FEATURES,
>>         .has_display = true,
>>+        .wopcm_size = SZ_2M,
>> };
>>
>> static const struct xe_device_desc pvc_desc = {
>>@@ -330,6 +336,7 @@ static const struct xe_device_desc pvc_desc = {
>>         .has_display = false,
>>         .has_heci_gscfi = 1,
>>         .require_force_probe = true,
>>+        .wopcm_size = SZ_4M,
>> };
>>
>> static const struct xe_device_desc mtl_desc = {
>>@@ -337,12 +344,14 @@ static const struct xe_device_desc mtl_desc = {
>>         .require_force_probe = true,
>>         PLATFORM(METEORLAKE),
>>         .has_display = true,
>>+        .wopcm_size = SZ_4M,
>> };
>>
>> static const struct xe_device_desc lnl_desc = {
>>         PLATFORM(LUNARLAKE),
>>         .has_display = true,
>>         .require_force_probe = true,
>>+        .wopcm_size = SZ_2M,
>> };
>>
>> static const struct xe_device_desc bmg_desc = {
>>@@ -351,6 +360,7 @@ static const struct xe_device_desc bmg_desc = {
>>         .has_display = true,
>>         .require_force_probe = true,
>>         .has_heci_cscfi = 1,
>>+        .wopcm_size = SZ_4M,
>> };
>>
>> #undef PLATFORM
>>@@ -620,7 +630,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>         xe->info.skip_guc_pc = desc->skip_guc_pc;
>>         xe->info.skip_mtcfg = desc->skip_mtcfg;
>>         xe->info.skip_pcode = desc->skip_pcode;
>>-
>>+        xe->info.wopcm_size = desc->wopcm_size;
>>         xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>>                                   xe_modparam.enable_display &&
>>                                   desc->has_display;
>>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>>index d3a99157e523..35878b5384a1 100644
>>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>@@ -45,14 +45,6 @@
>>  * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
>>  * context).
>>  */
>>-
>>-/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>>-/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
>>-#define DGFX_WOPCM_SIZE                        SZ_4M
>>-/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
>>-#define MTL_WOPCM_SIZE                        SZ_4M
>>-#define WOPCM_SIZE                        SZ_2M
>>-
>> #define MAX_WOPCM_SIZE                        SZ_8M
>>
>> /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>>@@ -179,9 +171,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>>
>> u32 xe_wopcm_size(struct xe_device *xe)
>> {
>>-        return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>>-                xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
>>-                WOPCM_SIZE;
>>+        return xe->info.wopcm_size;
>> }
>>
>> /**
>>--
>>2.34.1
>>
