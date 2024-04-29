Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A421DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 02:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0C10FFC3;
	Mon, 29 Apr 2024 02:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+E7sU/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145510FF38
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 02:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714356101; x=1745892101;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v2RfL3IXyszwvmkwMCYZ9eEq9Q5SOcNG2NYheCjYYOg=;
 b=S+E7sU/xRJeYH8wchIx/Lto491t6eLXOyCpu/pEiPu9fqMxGHcGlvTni
 k0XvLJYGta8hO9nk90hEplFXxsvyXvj1/4P74bmxICIABPx+hHFrfOr25
 erYEx9YMho4RrSSa8ma2rzvt6LtzvwHd9RWgX8z4gIBYNblh1beRk4Nfy
 UpzrIUJ6YWqZBdc88fID4WXmNDp1Rw5yB3ESi35p1NkLZTMJVE7C891iY
 JXKxjiDIR5SeavNoiT5KvO3ayI3dNwD4s1G7+dQHpQW8JHZhvikN6I4Vf
 ihHEsmRLqPKXiWyvEChcn4JzrgWWcGgm5fN3eBuKwFBslMsXDAyYvddlq w==;
X-CSE-ConnectionGUID: DSr8Df0WR6Gn7ZDk6wbpTQ==
X-CSE-MsgGUID: FuM/Njf+Tpeumwx3PYsMDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20622172"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="20622172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 19:01:40 -0700
X-CSE-ConnectionGUID: 0IR9FqxsR86crADp0SYAYQ==
X-CSE-MsgGUID: Eg1+t+M6Qh6WTj0oVkOeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="30765705"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 19:01:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 19:01:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 19:01:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 19:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBZ+I/99QRc0VJVK7mLUyi8h8LYmx74XYze43+lORbULHRoZTqeOFIi8QVTOzxrFCrRYpZ1uXV9h63ov5u1h6HUiK0cNu1g8N3FqOad7xmFV97TafrbAiAbgxP6XNbSaS2Tr+XRlHfGvgyYW+rj9E9w05D4qtWLcsVC4D8RErpmrIFMnYPHOdfube32HHtB5GxtvfNnqs9aYBc0lHbXQspCdnFP3AkDvdc+81OzM918nFCFjPbahW8sgy5RZTwHr6oWNkw+0n9Jtn1nvN0VNTe3Ny30uoBRJB02cWQc+NC3FS93q5vKz72XEbUUJnkv7xXz3FQyp7vvEBvhjarlQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RckzqqCTqCXgRPFf84XGs6ZDjfImEwIo/LCtvbZXHmM=;
 b=cvDztmNzVUly8I3TFoVv3a/Vszj5sN3lP5Oxsa2rXRSSX24ixkE0ciydwcktNZa/kbbuDkTdIhrdt8H1SFm4m7j7Bcv4DWHFw0q+RYgFSL0ZNx1yNJLoT81Vu7SC7qKhv7uivB3Uk355gE/PJbduwznESZqEm3EasviTt+Qplouun+/WoptrsRoMEJxdr7uvgNUeLJiivnbqoFuLQCHUddATB65mHa/ITuf/r0geeMjJ5/8n+lp4FM7NzDTmv7G51Dmcs3eJu8VydJjffCW2km+me7ANSrmH9RvRb62Eci+NkyFZfpMCRe55lPZICbNxPTlM+WzWlqmq7lp52PEuHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 02:01:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 02:01:37 +0000
Date: Mon, 29 Apr 2024 02:01:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Farah Kassabri <fkassabri@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ofir1.bitton@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: preparations for multi instance TLB
 invalidations
Message-ID: <Zi7/dkxWDTVd4uF2@DUT025-TGLU.fm.intel.com>
References: <20240424094244.231035-1-fkassabri@habana.ai>
 <20240424094244.231035-3-fkassabri@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424094244.231035-3-fkassabri@habana.ai>
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c27a8b-dca9-4198-f67c-08dc67f04d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZZBp8x0nndbLWywZ7FKzePCG626f8exOkAcxcKbbvyMW6WkYdNDZqGHEWz?=
 =?iso-8859-1?Q?KtSa2vr03reshynx/UJziZXEGMr7puEyV3jQ0haCfiORPSzwK4W33skp4z?=
 =?iso-8859-1?Q?QgtCaSmvyq2lm/VeBOXoDKkHtkMvT+s87CkJJGdBwcdog4yjZ2SnpRNEOv?=
 =?iso-8859-1?Q?RzpnXl5zGdp/P8l+FNjI9+YdW6iLPUdBXM7viofEK73qYEAmVcjKrdzWjC?=
 =?iso-8859-1?Q?IMY/4kS4DpIBVbf1vf/l6Agc8eE/MvBO5muC3R0AjbZfNqvX7V0b3xoy2C?=
 =?iso-8859-1?Q?TaNbcfWEtsaqgZKb0hmG4Z8eoRPQdeCUAvvwwL0faS9akZRK4Q+8N+2E5n?=
 =?iso-8859-1?Q?NJDpO32AeX1SF39RE+OC7kq0tvmRMITlum6S8Oqsp63c6eYZBZ5jeOSR9x?=
 =?iso-8859-1?Q?uWUCYx5Nxcdv8T3wEF/LA5shYqs20lfI33ElbrJ4vTikM/9OU3SfDfq4Du?=
 =?iso-8859-1?Q?ek+YmqFGDzhEjkzN5ndXAtUsnQd5+vQlx6UlYeYh02H4pbvHik0FjA7H+m?=
 =?iso-8859-1?Q?TCbiFmCxAtKVuVRNP9d2BCKujILUR9b0//r6id4IaWl+0VOQJv/955+7s8?=
 =?iso-8859-1?Q?Jx7HADNmxAAD5qC5m1H2TxmTm4ByHUKyUx8ZB1k26ZWg1jy8caY46Zn/9C?=
 =?iso-8859-1?Q?Me0i79bqkRfoxcHIJkq8Y5Hn+c0GCZgxGCcD6MiiuOZzDFI3SNMCdjY+WT?=
 =?iso-8859-1?Q?9bCMqJUUwH5el/GNdQm7GtZbpZNBHa3urVCz2WpGwyp0Ru8t03PsZmA2yE?=
 =?iso-8859-1?Q?47wpbLZNfc0qKV5p8ANEqBdsFr1Ow7NeD8c3DI3e4+Ybr2DvrHg4wCcUUz?=
 =?iso-8859-1?Q?OBYNeq89V4fKf7eL3dC8FfWCMV4HuKbbGl/WZ0UCRdZ5sXP0aQZP7vs1YG?=
 =?iso-8859-1?Q?a2pqQ5OwkXdNpsycL4VC7aSsRTNW7p3xdvHHe3L41IZ1jHvhhXfL12Cn21?=
 =?iso-8859-1?Q?wPqLOipDumiYScEaFnzp5SkFHS/wbgSo9rqIbxZUQ5uTrhlWdDv9XlZQfi?=
 =?iso-8859-1?Q?u/eqFAbn4OA835Uvre8rDzYH8cQjFyqTWh/sA6aAerTXoqGq0PHEXmG259?=
 =?iso-8859-1?Q?vNSUL0la/rHBcrQQU4naYz1ShM8i7oTZdGpRFHWKKf8zWTAJSCMOly0Fp7?=
 =?iso-8859-1?Q?kMzasXSPwfVWmM1JkdCE7sqn3n76LsOeSESc1OoOqAeMsNaX38k14zzEzx?=
 =?iso-8859-1?Q?BfOxBRg5sXKDobYUx3/dhhTnxVTf1xW/6HmT5qnDTy+MuQKz5dNh4vW9rX?=
 =?iso-8859-1?Q?pOgDcgBwL/Fh/cwPbx/AuVimMfeyHgpzoIwiqhZYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WYy7eihmNbTBRF9i8YqtKZB+Qp6t4QExpBdwEB3lnHk40m1RBXiJB83ne1?=
 =?iso-8859-1?Q?kiEeNzKAJyXMWK+7yULgHzRfewUR1EzUecU5rE7JDlamdotkLO3BHbU5kK?=
 =?iso-8859-1?Q?NyJlXLLJlBmYvNdQ4qwKncCuGlXUf0GzL9GHxv+k/MoNUCH5eCSadUjdYx?=
 =?iso-8859-1?Q?URajJ0MF1eRbr1R6TlL864bbko0JeQGtivYWG0L0qIIe8ahB6LwgO41pyI?=
 =?iso-8859-1?Q?oO0ih35iKSe7NajEZs+qH2ml+ZWejCA6sIzK8x9tJmj849VqFhAcHlQCEB?=
 =?iso-8859-1?Q?SU0HRD8EJUTOQY85QroBRojguCvBvEyohdZd8azIq70DEQnzQ8G1ZjtELq?=
 =?iso-8859-1?Q?Ujm3dzLki2n1nv+jV9qgJR7/TS5aqtYrKYvss99h97FzEV8oMNGapqbWYF?=
 =?iso-8859-1?Q?escPG7KVusq5kqXQGzRlSe5IFhh3Je8QNbHyAzNEOgW5RaOSO0wlfgykI+?=
 =?iso-8859-1?Q?Rbpz6lgtcHjCS5JI4AN8XJAscF21JSpwQxn+mAG92vUGI2Hc9HaGUUvP1C?=
 =?iso-8859-1?Q?8pexp/zMCMPSFTBWdfXfxv4SqoEo8PmkO5pSOBtT49cyKKveNgpR0HHK5O?=
 =?iso-8859-1?Q?ZgGLkwgSgAs9nPJcw1q/OdzT9lSTolz01v7XMVmQdI6KD40n8q1cBnaLyB?=
 =?iso-8859-1?Q?rwdXdS4j1K12YrkD0cWdDG+fKdOfjUBJeaY5WO8ztAo28FAS5F53Jr9UDT?=
 =?iso-8859-1?Q?/Nr87LJVlGJFRPnT2U4mmSVIgID9jH751t3XhtmbLeo2XZhS7/ZY35oHTg?=
 =?iso-8859-1?Q?5PDAU5q+SoPkL3/17fsQXLz4Gm6htS6YF8kht9nOhNYwuYNWuwoAdaLGSJ?=
 =?iso-8859-1?Q?fsqyn4vYjD6iX+KY8LyhT331RFYYXQLYqpdxenmZ97AEsgrWJkoViKe8qQ?=
 =?iso-8859-1?Q?hO3nBCzddFOVZvDLTjlN3z4Ug5HBMraywca1cDhN08AHrKc4Igy2aJerm7?=
 =?iso-8859-1?Q?T08jajuWJ3gn7V4WmoYVJDSNqekGdwHDSi/XeDY16n2rVMUrXrfkMiD4Aw?=
 =?iso-8859-1?Q?1X6aL5acXyWROMalg2obCWBixlMrljDsHdW4ezTDnDP69VlvCggB0b926M?=
 =?iso-8859-1?Q?wdhva330H0pGXUirEwk4eJZ2X0TIJaL554rCofgfZ9uOQ7Ac3Klt6DbXOT?=
 =?iso-8859-1?Q?F304k2QsjfmDJ/C5avsC3B4ngFx+T4/e5jNtWGhTiet6QX+3+OX0348lTP?=
 =?iso-8859-1?Q?mUKMD+n8zOwHxQmsDjiXOSpQE0oS2kf7VqMFOJpByfMs3NeNNdxPGfEoFH?=
 =?iso-8859-1?Q?SZHL7a7ZlEfcWI4y6JnUZRTw/M+k7+tfVCt0tCeBt3bXWwt8yTk22yTzAR?=
 =?iso-8859-1?Q?SS1gyfdHmuVi1UYYYpfKMofLNfl5GxB8ZX9QfScnO1sKxvuR86elLHE9pG?=
 =?iso-8859-1?Q?GvVw2Pd8XPw/RLL+zMG5sMEpRwHfMF8EtbEWiDbjRhv3PWLb4xN4H8q2HH?=
 =?iso-8859-1?Q?VgvUXhFugnkmEd1i9OpOl3Agl/OYG6IhKkD19mTK430TaBFjHNHz0khKry?=
 =?iso-8859-1?Q?Jfw1jaIXOoUih20BbWDMdB9RDnmHruK0T3XlxOlrB0UsxjnBKXJIFkcRtc?=
 =?iso-8859-1?Q?LRuJK5FddxFS2aPdbIUob+MPtwDUwlgyqz2tC3EOLA4C3FtHkgnEIk2gCA?=
 =?iso-8859-1?Q?o8LmJJgBsRhoAc+3NQsmvK7w6NIuheC3b9X6YOAwKKjJkxoS57BqV8Dg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c27a8b-dca9-4198-f67c-08dc67f04d5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 02:01:36.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCNNhN2/CRJYiBT8ESMCUWuAmWtUMID8xMzGPDgY1lkCBFRMyhwIhxgcl2QBWJ0NaR+dLaJgO80GisEgQTMLjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

On Wed, Apr 24, 2024 at 12:42:44PM +0300, Farah Kassabri wrote:
> This patch prepares the xe driver for supporting multi instance TLB
> invalidations.
> Currently xe driver support one invalidation flow for the compute
> engines which passes through the Guc submission flow.
> In the near future this driver should invalidate other TLB instances,
> each has its own flow for performing the invalidation.
> This patch will allow the engine to register its own functions
> for invalidation and wait, keeping the invalidation calls from the
> common code generic.
> 

Same comments in the previous patch here apply wrt to layering, won't
repeat. 

> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device.c                |   7 +
>  drivers/gpu/drm/xe/xe_ggtt.c                  |   8 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |   5 +-
>  .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.c   |  72 ++++----
>  .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.h   |   2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 167 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  66 +++++--
>  drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>  drivers/gpu/drm/xe/xe_vm.c                    |  12 +-
>  11 files changed, 281 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 63e757406595..d279cec7bb1d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -91,6 +91,7 @@ xe-y += xe_bb.o \
>  	xe_gt_sysfs.o \
>  	xe_gt_throttle_sysfs.o \
>  	xe_gt_guc_tlb_invalidation.o \
> +	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 55bbc8b8df15..5b438f0e8a7d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -45,6 +45,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_gt_tlb_invalidation.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -568,6 +569,12 @@ int xe_device_probe(struct xe_device *xe)
>  		}
>  	}
>  
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_tlb_invalidation_init(gt);
> +		if (err)
> +			return err;
> +	}
> +

This is probably not the right place for this. Lucas is doing some work
[1] on the probe order. This is just a SW init, right? There should be
place in the xe_gt layer that initializes the SW, that would be right
place to hook in the new xe_gt_tlb_invalidation_init.

[1] https://patchwork.freedesktop.org/series/132920/ 

>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_init_hwconfig(gt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e0c1bfa92730..3031a45957e9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -19,7 +19,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> -#include "xe_gt_guc_tlb_invalidation.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -247,14 +247,14 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  
>  static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  {
> -	int err;
> +	int seqno[TLB_INV_MAX_INS] = {0}, err;
>  
>  	if (!gt)
>  		return;
>  
> -	err = xe_gt_guc_tlb_invalidation_ggtt(gt);
> +	err = xe_gt_tlb_invalidation_all(gt, seqno);

Why s/ggtt/all? Without know what the other backends will look like it
is hard to say if I agree with naming change. Can you elaborate on
reasing for the name change?

>  	if (err)
> -		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_guc_tlb_invalidation_ggtt error=%d", err);
> +		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_all error=%d", err);
>  }
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b162f10902ea..7554da5c7e19 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -504,6 +504,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  		goto out;
>  
>  	xe_gt_topology_init(gt);
> +
>  	xe_gt_mcr_init(gt);
>  	xe_pat_init(gt);
>  
> @@ -536,10 +537,6 @@ int xe_gt_init(struct xe_gt *gt)
>  		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>  	}
>  
> -	err = xe_gt_guc_tlb_invalidation_init(gt);
> -	if (err)
> -		return err;
> -
>  	err = xe_gt_pagefault_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> index f994c64c95f4..469e57426a60 100644
> --- a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_gt_guc_tlb_invalidation.h"
> +#include "xe_gt_tlb_invalidation.h"
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
> @@ -17,6 +18,8 @@
>  
>  #define TLB_TIMEOUT	(HZ / 4)
>  
> +static void xe_gt_guc_init_tlb_inv_funcs(struct xe_gt *gt);
> +
>  static void xe_gt_guc_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
> @@ -66,6 +69,8 @@ int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt)
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_guc_tlb_fence_timeout);
>  
> +	xe_gt_guc_init_tlb_inv_funcs(gt);
> +
>  	return 0;
>  }
>  
> @@ -224,7 +229,7 @@ static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_guc_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
> + * xe_gt_guc_tlb_invalidation_all - Issue a TLB invalidation on this GT for the GGTT
>   * @gt: graphics tile
>   *
>   * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
> @@ -232,7 +237,7 @@ static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
>   *
>   * Return: 0 on success, negative error code on error
>   */
> -int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt)
> +int xe_gt_guc_tlb_invalidation_all(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -301,41 +306,9 @@ int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
>  	if (!xe->info.has_range_tlb_invalidation) {
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> -		u64 start = xe_vma_start(vma);
> -		u64 length = xe_vma_size(vma);
> -		u64 align, end;
> +		u64 start, length;
>  
> -		if (length < SZ_4K)
> -			length = SZ_4K;
> -
> -		/*
> -		 * We need to invalidate a higher granularity if start address
> -		 * is not aligned to length. When start is not aligned with
> -		 * length we need to find the length large enough to create an
> -		 * address mask covering the required range.
> -		 */
> -		align = roundup_pow_of_two(length);
> -		start = ALIGN_DOWN(xe_vma_start(vma), align);
> -		end = ALIGN(xe_vma_end(vma), align);
> -		length = align;
> -		while (start + length < end) {
> -			length <<= 1;
> -			start = ALIGN_DOWN(xe_vma_start(vma), length);
> -		}
> -
> -		/*
> -		 * Minimum invalidation size for a 2MB page that the hardware
> -		 * expects is 16MB
> -		 */
> -		if (length >= SZ_2M) {
> -			length = max_t(u64, SZ_16M, length);
> -			start = ALIGN_DOWN(xe_vma_start(vma), length);
> -		}
> -
> -		xe_gt_assert(gt, length >= SZ_4K);
> -		xe_gt_assert(gt, is_power_of_2(length));
> -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
> -		xe_gt_assert(gt, IS_ALIGNED(start, length));
> +		xe_gt_tlb_invalidation_vma_alignments(gt, vma, &start, &length);
>  
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
>  		action[len++] = xe_vma_vm(vma)->usm.asid;
> @@ -457,3 +430,30 @@ int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_guc_tlb_invalidation_vma_wrapper - wrapper for gt guc tlb range invalidation.
> + * @gt: graphics technology the invalidation was initiated on.
> + * @vma: VMA to invalidate
> + * @data: data used for the invalidation.
> + *
> + * Issue a range based TLB invalidation.
> + *
> + * Return: Seqno which can be passed to xe_gt_guc_tlb_invalidation_wait on success,
> + * negative error code on error.
> + */
> +static int xe_gt_guc_tlb_invalidation_vma_wrapper(struct xe_gt *gt, struct xe_vma *vma, void *data)
> +{
> +	struct xe_gt_guc_tlb_invalidation_fence *fence = data;
> +
> +	return xe_gt_guc_tlb_invalidation_vma(gt, fence, vma);
> +}
> +
> +static void xe_gt_guc_init_tlb_inv_funcs(struct xe_gt *gt)
> +{
> +	struct xe_gt_tlb_ins_invalidation_funcs *guc_ins = &gt->tlb_invalidation.inv_funcs[GUC_TLB];
> +
> +	guc_ins->inv_range = xe_gt_guc_tlb_invalidation_vma_wrapper;
> +	guc_ins->inv_all = xe_gt_guc_tlb_invalidation_all;
> +	guc_ins->inv_wait = xe_gt_guc_tlb_invalidation_wait;

So the proper way to do this is have a 'static const struct
xe_gt_tlb_ins_invalidation_funcs' locally and return that rather than
setting the functions individually. See xe_ring_ops.c and 'static const
struct xe_ring_ops' for an example.

> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
> index f7402dd0bec3..a02ee007c642 100644
> --- a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
> @@ -16,7 +16,7 @@ struct xe_vma;
>  
>  int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt);
>  void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt);
> -int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt);
> +int xe_gt_guc_tlb_invalidation_all(struct xe_gt *gt);
>  int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
>  				   struct xe_gt_guc_tlb_invalidation_fence *fence,
>  				   struct xe_vma *vma);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 8c47c60f3cd3..dba49f3ae933 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -15,7 +15,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> -#include "xe_gt_guc_tlb_invalidation.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_migrate.h"
> @@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto retry_userptr;
>  
>  	if (!ret) {
> -		ret = xe_gt_guc_tlb_invalidation_vma(gt, NULL, vma);
> +		ret = xe_gt_tlb_invalidation_vma(gt, vma, NULL, NULL);
>  		if (ret >= 0)
>  			ret = 0;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> new file mode 100644
> index 000000000000..84dec631aeb1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_guc_tlb_invalidation.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_vm.h"
> +
> +/**
> + * xe_gt_tlb_invalidation_init - TLB invalidation init generic function.
> + * @gt: graphics technology the invalidation was initiated on.
> + *
> + * Initialize all TLBs in the system, including setting the invalidation
> + * proprietary function pointer.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	gt->tlb_invalidation.inv_funcs = kcalloc(TLB_INV_MAX_INS,
> +						 sizeof(struct xe_gt_tlb_ins_invalidation_funcs),
> +						 GFP_KERNEL);

See my comments below in xe_gt_types.h, I don't think we need a malloc here.

> +	if (!gt->tlb_invalidation.inv_funcs)
> +		return -ENOMEM;
> +
> +	/* Initialize gt Guc TLB */
> +	ret = xe_gt_guc_tlb_invalidation_init(gt);

See my comments in the previous patch, I think the init function should
return the inv_funcs rather than setting these in the GT.

> +	if (ret) {
> +		kfree(gt->tlb_invalidation.inv_funcs);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_all - TLB invalidation all generic function.
> + * @gt: graphics technology the invalidation was initiated on.
> + * @seq: sequence numbers of the TLB invalidations.
> + * This is the output of the invalidation functions, can be used when calling
> + * xe_gt_tlb_invalidation_wait.
> + *
> + * Issue a TLB invalidation when the GGTT is changed.
> + * This will make invalidation for all TLBs in the system, for mappings in GGTT and all
> + * PPGTT tables.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_gt_tlb_invalidation_all(struct xe_gt *gt, int *seq)
> +{
> +	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
> +		seq[ins] = gt->tlb_invalidation.inv_funcs[ins].inv_all(gt);

Wondering if we should support backends having NULL vfuncs?

e.g.
	if (!inv_funcs[ins].inv_all)
		seq[ins] = not present SEQNO
	else
		seq[ins] = gt->tlb_invalidation.inv_funcs[ins].inv_all(gt);

> +		if (seq[ins] < 0)
> +			return seq[ins];

Here if one the backend fails the seqno will get out sync. Maybe that is
ok? I guess the interface accepts an array of seqnos. I'm wondering if
we could make this a single seqno so the number of backends is opaque to
the other layers.

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_vma - TLB range invalidation generic function.
> + * @gt: graphics technology the invalidation was initiated on.
> + * @vma: VMA to invalidate
> + * @data: private data if needed for some TLB instances.
> + * @seq_out: sequence numbers of the TLB invalidations.
> + * This is the output of the invalidation functions, can be used when calling
> + * xe_gt_tlb_invalidation_wait, in case it's NULL then the caller doesn't need to wait for the
> + * invalidation.
> + *
> + * Issue a PPGTT related TLB invalidation, which will invalidate a range defined in the vma.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_gt_tlb_invalidation_vma(struct xe_gt *gt, struct xe_vma *vma, void *data, int *seq_out)
> +{
> +	int seq[TLB_INV_MAX_INS] = {0};
> +
> +	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
> +		seq[ins] = gt->tlb_invalidation.inv_funcs[ins].inv_range(gt, vma, data);
> +		if (seq[ins] < 0)
> +			return seq[ins];
> +	}
> +
> +	if (seq_out)
> +		memcpy(seq_out, seq, sizeof(seq));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_wait - TLB invalidation wait generic function.
> + * @gt: graphics technology the invalidation was initiated on.
> + * @seq: sequence numbers which was returned from the TLB invalidation functions.
> + *
> + * Wait for a TLB invalidation to complete.
> + *
> + * Return: 0 on success, negative value on timeout/failure.
> + */
> +int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int *seq)
> +{

Same comment as above, it would be great if we could have a single seq
to wait on.

> +	int ret;
> +
> +	for (int ins = 0 ; ins < TLB_INV_MAX_INS ; ins++) {
> +		ret = gt->tlb_invalidation.inv_funcs[ins].inv_wait(gt, seq[ins]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_vma_alignments - Make alignments on vma.
> + * @gt: graphics technology the invalidation was initiated on.
> + * @vma: VMA to invalidate
> + * @start_aligned: aligned start address (output).
> + * @length_aligned: aligned length (output).
> + *
> + * Return: 0 on success, negative value on timeout/failure.
> + */
> +void xe_gt_tlb_invalidation_vma_alignments(struct xe_gt *gt, struct xe_vma *vma,
> +					u64 *start_aligned, u64 *length_aligned)
> +{

I already made some changes here in [2]. Take a look at that.

[2] https://patchwork.freedesktop.org/patch/591281/?series=132246&rev=3

> +	u64 start = xe_vma_start(vma);
> +	u64 length = xe_vma_size(vma);
> +	u64 align, end;
> +
> +	if (length < SZ_4K)
> +		length = SZ_4K;
> +
> +	/*
> +	 * We need to invalidate a higher granularity if start address
> +	 * is not aligned to length. When start is not aligned with
> +	 * length we need to find the length large enough to create an
> +	 * address mask covering the required range.
> +	 */
> +	align = roundup_pow_of_two(length);
> +	start = ALIGN_DOWN(xe_vma_start(vma), align);
> +	end = ALIGN(xe_vma_end(vma), align);
> +	length = align;
> +	while (start + length < end) {
> +		length <<= 1;
> +		start = ALIGN_DOWN(xe_vma_start(vma), length);
> +	}
> +
> +	/*
> +	 * Minimum invalidation size for a 2MB page that the hardware
> +	 * expects is 16MB
> +	 */
> +	if (length >= SZ_2M) {
> +		length = max_t(u64, SZ_16M, length);
> +		start = ALIGN_DOWN(xe_vma_start(vma), length);
> +	}
> +
> +	xe_gt_assert(gt, length >= SZ_4K);
> +	xe_gt_assert(gt, is_power_of_2(length));
> +	xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
> +	xe_gt_assert(gt, IS_ALIGNED(start, length));
> +
> +	*start_aligned = start;
> +	*length_aligned = length;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index fab65b53cb24..406e2820e8c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2024 Intel Corporation
>   */
>  
>  #ifndef _XE_GT_TLB_INVALIDATION_H_
> @@ -8,19 +8,57 @@
>  
>  #include <linux/types.h>
>  
> -#include "xe_gt_guc_tlb_invalidation_types.h"

> -
> -struct xe_gt;
> -struct xe_guc;
>  struct xe_vma;
> +struct xe_device;
> +struct xe_gt;
> +
> +enum xe_gt_tlb_instances {
> +	GUC_TLB = 0,
> +	TLB_INV_MAX_INS
> +};
> +
> +struct xe_gt_tlb_ins_invalidation_funcs {
> +	/**
> +	 * struct xe_gt_tlb_invalidation_funcs member inv_range
> +	 *
> +	 * @gt: graphics technology the invalidation was initiated on.
> +	 * @vma: Pointer to vma data.
> +	 * @data: private data of the specific invalidation.
> +	 *
> +	 * This function should invalidate range of virtual addresses.
> +	 * The function return sequence number > 0 in case we need to wait for the invalidation,
> +	 * otherwise 0 which indicate success and no wait is needed, negative number upon failure.
> +	 */
> +	int  (*inv_range)(struct xe_gt *gt, struct xe_vma *vma, void *data);
> +
> +	/**
> +	 * struct xe_gt_tlb_invalidation_funcs member inv_all
> +	 *
> +	 * @gt: graphics technology the invalidation was initiated on.
> +	 *
> +	 * This function should invalidate the TLB instance when GGTT table is changed.
> +	 * When GGTT is changed driver must invalidate all mappings for both GGTT/PPGTT in the TLB
> +	 * instance.
> +	 * The function return sequence number > 0 in case we need to wait for the invalidation,
> +	 * otherwise 0 which indicate success and no wait is needed, negative number upon failure.
> +	 */
> +	int  (*inv_all)(struct xe_gt *gt);
> +
> +	/**
> +	 * struct xe_gt_tlb_invalidation_funcs member inv_wait
> +	 *
> +	 * @gt: graphics technology the invalidation was initiated on.
> +	 * @seq: the sequence number returned from the invalidation function.
> +	 *
> +	 * This function should wait till the invalidation is done.
> +	 */
> +	int  (*inv_wait)(struct xe_gt *gt, int seq);
> +};

This should probably go in a *_types.h file.

>  
>  int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
> -void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> -int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_guc_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma);
> -int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
> -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> -

See my comment in previous reply, would be great if we can get this work
without changing any existing exported funcion. To me that indicates we
have gotten the layering correct.

> -#endif	/* _XE_GT_TLB_INVALIDATION_ */
> +int xe_gt_tlb_invalidation_vma(struct xe_gt *gt, struct xe_vma *vma, void *data, int *seq_out);
> +int xe_gt_tlb_invalidation_all(struct xe_gt *gt, int *seq_out);
> +int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int *seq);
> +void xe_gt_tlb_invalidation_vma_alignments(struct xe_gt *gt, struct xe_vma *vma,
> +					   u64 *start_aligned, u64 *length_aligned);
> +#endif /* _XE_GT_TLB_INVALIDATION_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c38e48c039e6..49a88b0d0d25 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -190,6 +190,10 @@ struct xe_gt {
>  		struct delayed_work fence_tdr;
>  		/** @tlb_invalidation.lock: protects TLB invalidation fences */
>  		spinlock_t lock;
> +		/**
> +		 * @tlb_invalidation.inv_funcs: invalidation functions for TLB instances
> +		 */
> +		struct xe_gt_tlb_ins_invalidation_funcs *inv_funcs;

const struct xe_gt_tlb_ins_invalidation_funcs *inv_funcs[MAX_INV_BACKEND]

Fix MAX_INV_BACKEND to a better name but you get the idea.

>  	} tlb_invalidation;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 965e17c640c9..b2825ed0f1fa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -28,7 +28,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt_pagefault.h"
> -#include "xe_gt_guc_tlb_invalidation.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -3146,7 +3146,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_tile *tile;
>  	u32 tile_needs_invalidate = 0;
> -	int seqno[XE_MAX_TILES_PER_DEVICE];
> +	int seqno[XE_MAX_TILES_PER_DEVICE][TLB_INV_MAX_INS] = {{0}};

Again in a perfect world we have a single seqno per GT.

Matt

>  	u8 id;
>  	int ret;
>  
> @@ -3179,15 +3179,15 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  			 * FIXME: We potentially need to invalidate multiple
>  			 * GTs within the tile
>  			 */
> -			seqno[id] = xe_gt_guc_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
> -			if (seqno[id] < 0)
> -				return seqno[id];
> +			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt, vma, NULL, seqno[id]);
> +			if (ret < 0)
> +				return ret;
>  		}
>  	}
>  
>  	for_each_tile(tile, xe, id) {
>  		if (tile_needs_invalidate & BIT(id)) {
> -			ret = xe_gt_guc_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
> +			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
>  			if (ret < 0)
>  				return ret;
>  		}
> -- 
> 2.34.1
> 
