Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510BCCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 21:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53E10E965;
	Thu, 23 Oct 2025 21:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdmq3j7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E45910E136
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 21:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761256355; x=1792792355;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nnE6snw4PLge0YxdZ8Cz3gQyr2hu7TqveElA/zgcr9A=;
 b=mdmq3j7FsagRIBtyfnn5w/S4HDhgVr8nkhwvbbF7Th47jxBRWOXzFonO
 JRHL811TZGLJp4N+kTShwY8eAU57YfjSfcVtnGQc188sVYK3/SozS47Ki
 4tEf+VNBJCdCaGcBX+JKBs+VjLNRy9O5R14nyND2gKT6oRERB2UynVVJf
 TQZ9lOxbNgJgViZC8FXhsj9fYTlvtXLwAe3+syhc0spryI04GoKZp3xSf
 SLr+uSa7yXOjPlUntbxnErp6Me98JrvrDUSD2nfxpf384yj2iDHsc1BFL
 vJKoZ8gsNN2q15lj0CaelsTWVz9+pL5U70JyzClZVoXendCjWLS+I6ITD w==;
X-CSE-ConnectionGUID: /VlScUavQ8io6IgBiPeufg==
X-CSE-MsgGUID: 82kxkPwRSdqfcKgWSJ7Nwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67305668"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="67305668"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 14:52:34 -0700
X-CSE-ConnectionGUID: jgZA6hu5TGeRG2LyjmRQAQ==
X-CSE-MsgGUID: FP0dy1qIR8euJj8sOVrqCA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 14:52:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 14:52:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 14:52:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 14:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyXGifzLH5fbaf0OaelHjsO75WRjoYTkVx4jHYWobi/A/4XISCqVid28RcFVfF060Ct4K9xdhOVQ7FyuJS5PCiv+6tIpG9WZpkc2qpprAk5BF8/hyotIHZw3ZTg+4lWZ28c2YML4T8xa/6nYlItjuBdhZ4MIIdzkpxM99kIIZMBNTVBJxAvuuXVWMiTn2xHjjVqo0EsTukWE1B8bUsEHvqdXARkaE8ORe96gg71Iir4jksiw9IubaJbEhxiN7Pz7+e3aVF1+c1Xi/Pc2XKKj2eJQ7T/pjm2G/NZ/eQZ+lP+8nBLdE0gFhs8rSSfdOqQmNFlGWfQ6fd5XFmbuNNieDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uf77hSXt9vtdmCtje2qabF9YaYFfBkuI4nyhM+Dcuc=;
 b=sUXMLPy7vSiOjqH3I6pswskqSMv5kMjn3XeDD1H/xsThD3dLuGcjxyhW1VNosjMuW6pus2oNVulik2el2jZxRjUy3b2tMG2VyXQD+GAlvcjhx4Ph+pvRdlrokXC/IOBYSqWGL9OlEj6pDLpXg6cXcvJxB/+6uL3LexnN5ADhKZCgalsogwJqcMKkOLmZw3lMUeyyIFjMHYPbd6Yyw7mm1mrfGpbZEa5lL29/HkpwGpojZ3qknM3gvzGSPtfL2rCYBx/jR3cI6cR1pFQYLlPn5GpdLpizvj1mW/2koHLZk/0HP4o8bRPSwfMpXVV4aZ1JATI8CHFelZxzfOzSj8r7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 21:52:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 21:52:31 +0000
Date: Thu, 23 Oct 2025 16:52:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/xe3p_xpc: Add MCR steering for NODE and
 L3BANK ranges
Message-ID: <n5h5f7cbrq2lm55kamfw3uyi5w24e6ryv4y4sm4tym6eul6bal@pqjaixsnvmwb>
References: <20251021224556.437970-1-matthew.d.roper@intel.com>
 <20251021224556.437970-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251021224556.437970-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 10370630-2c4e-470e-234e-08de127e7760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1OxcYDf/uxybEIEq+xDSA9Ga073f7fW5KXebDniq0O+XsedTn4+GF7gY2p2C?=
 =?us-ascii?Q?0BpvS4gh/V4W22DfYNhLe7gceP7MZulfYCTAEL6kZP+YuJ/9Nforrg5DaTI+?=
 =?us-ascii?Q?Fn7ZJyLx0eAymAKKl8iAreuI2rxK24Vq+adR4cFTctmTshjmZFzb24phx8tV?=
 =?us-ascii?Q?1g7dFEm7sjkvy3IirJGTQjWOUDW9O7VXE7/TmJQ8Ipl0a4C8wKYxtIrHfSds?=
 =?us-ascii?Q?Uc0GVu7+I8xQ3oJUufVs3HsMmY2WjK0Gu9w6U6myVg4vdoIsJCmCzMtk0sGX?=
 =?us-ascii?Q?+VaVKdkstD1Q1XnZeoFBrpRYQ3NWFFzRUALouODiGMDDhEK0DIp4d1iiVs8p?=
 =?us-ascii?Q?uERr0z1ghZcxXiK/JP476sbyy1ecicTe42SeTfJsrb3AVvEKs7JVTB4OrupV?=
 =?us-ascii?Q?iFs0ASgWuSQSZt2gwWXZbmkxKDWz8AbUx9klDOWAiE40MrnXwdelG6TL5g88?=
 =?us-ascii?Q?f+28un5+ZToG+7+cF3u0Qi5XH9wNB1/Px3f1FzL5cEXh+0iGGBM541kpTrvs?=
 =?us-ascii?Q?Nnc/Gc61pa6Mv32vm3CaulYiijHJ/kF4RTgb+B/l5LOtPvbMOdtSp7WHiOI0?=
 =?us-ascii?Q?zZFUpyQ41i7pwH60F5Mov65qv+hUa0RakppmyRGYdVa/OkZMy97scHSArX1y?=
 =?us-ascii?Q?BTUsfwlgQNN6Av+50/YRA09ilJhoUSdonyAM1ssJn5kEkhGmxvdHMXCekVAc?=
 =?us-ascii?Q?nahBMXL6j5s+J+fdXZmIk3Ov2iFIm6vgltvcppvae2GmqmqnquYwVGyx1Ret?=
 =?us-ascii?Q?tYMN14oTIgI/UJxFzMjrUE+1CjBsYCw5UZJTiGHFpcG3lrM7ykfqJPj4GMrf?=
 =?us-ascii?Q?pXF3xUMrSicGv/ywGa7b7/6lrmUmZ7agny8OCaNBTSlavo5w81H029jSxtol?=
 =?us-ascii?Q?ZeHG5CRKmzGwELwYt0Mw9OKzSc1i2jmfmMPmpYkyumrjjeHok1yLseMosWc6?=
 =?us-ascii?Q?J9r9V3UBZ1jDiPzFG6I42P7OVuNunZgKyJXDPoLnII+ZDp3by9/KUjlEUPgr?=
 =?us-ascii?Q?JWiMYFFzhe9qy48T8+GaR8LQozqKDMGzd0cQudyGOnk0GwGvhpUqHgJIoDtD?=
 =?us-ascii?Q?BEKtgbEHYVS/C46dF0rI7VUmabayCFRYxiWcnIEMdW8heGWaPKJINbef84uy?=
 =?us-ascii?Q?WRwd2XSMnd/CN2InczrXd8Nqr0KyKYvFHmuflCJDyVUoWMMsHLRmIBdXu64q?=
 =?us-ascii?Q?etnpwcmp71dEphI3ixdCqZBDgmaOKDF1elP42DziLwlbS7PZ0lHv1+y9QXiS?=
 =?us-ascii?Q?ahRNMkIya8HJ17hHyBGwM1igWOW0tpizUUMpX6d+lA+1Psv501w2Cnl7t4sw?=
 =?us-ascii?Q?twpwv3VxXtgs8VaAXjc4VabT8kqh6DMMPKOTxUnkevO+D4Uz48NnjxpXAKVh?=
 =?us-ascii?Q?uEtevP60MRRqAElr447nkoUy7X1fNLShBhI7Wm+rikuzDRuWsTlRgtYi24Ct?=
 =?us-ascii?Q?dMn7DNUzrJpSNzCZXme+lv7b24ydRl9Zy3PY9OI+DA+mHHwAp/7XNGPG7/Qd?=
 =?us-ascii?Q?oVYOsVKNZO22EZ9P7oM7qm5y4eXLTqclPxtQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAsNGeJhQZculWQE7uvGCVcNmIFpA6JbV+osH1buFJGTRlyJbtwiPN2yapqh?=
 =?us-ascii?Q?GPF2NBd8majPkIwzbTW2CvpPe4mahotO1Je01OLhjhfbPnDcP0gpfwLxnxcG?=
 =?us-ascii?Q?gtDCXjYPFwP1A/mZKUQOFVitLrXeBuH7kAa05uo8EgbMoSuzNSODp+70p7wy?=
 =?us-ascii?Q?IAUf5wSHZrnXYmgeic8P1RCr5VWZmWXQ+6PsG0ugXSJoY2vOQhbPv+8m0omm?=
 =?us-ascii?Q?m7Yre+stKCqRFXh2oYjIE9RPNbsHvFvjjGPEyGSJt/DnstGI8ezzBHRsafVr?=
 =?us-ascii?Q?d8rcYCiSOvnrzr+Mrh7Zz7Q4EtvjJakadIQ/kfC5r2eQQY8VLKAyvMWk12k3?=
 =?us-ascii?Q?CUbk2yptxV2YGZghlgMNAgEK0pMeDXgFp7ExRJB9CPVxRGbB4CLrWyOUr0dp?=
 =?us-ascii?Q?mpSSEkwYrbkAu4r8hrAyqzwIjrnV8d42marNYhxI2ME9tms+ea7EZ+Vi1Nnd?=
 =?us-ascii?Q?SvUYSnOPIrIJSKgnVvlkMlqqrhB1wZOLd3Umd8vOCjmkn1pRGfQ8hARBoDPG?=
 =?us-ascii?Q?5V96gFvy2ceVrd2OTCd+cLhpAoFgjNquh7Wpw7Yhz2N24wFjQDozbAEuq2Cx?=
 =?us-ascii?Q?Olw8ZukuB+tBrO95VG+KTvze/UtwIjpZxk2K+CzLlRHS+oZEf99x2Mv0iW9R?=
 =?us-ascii?Q?l55BNsnUt93gjFOEYv4qlqh2c8lg8DGmnDJOmVdknYWe+UjD0wuS6La2fwB0?=
 =?us-ascii?Q?cTfuF2gzYeTkpqxWayZCeZCZIjHx1YkUGKTdRJvueTA7ddDpcvHNIvSvNOV+?=
 =?us-ascii?Q?ZIyngqpZlm06roYrmvqP90MyVBLqsTutW2tVFAvZVZGaNHwYrA/giRpTPPxQ?=
 =?us-ascii?Q?VkNMb5y4YNWAdSuQl1T8zzXnzbSVZpA9aEnallXjgwVcrrmcEq+9rYptr6ka?=
 =?us-ascii?Q?YmRyWsUXtiBUCc1l2adOVWWHRCg8bLFwgAOYPdzKm65NZ8i9fVcbHEf11Tmn?=
 =?us-ascii?Q?CdeAGX26+lm/8OaSDqRCFprT5GZXSqzkttlPxFBLOEgBizROkuITaxLKIvy+?=
 =?us-ascii?Q?hfDNSc4FiVhL+8kdfeFv0uL6avu8KW7Ly5hPBE372ln+IaOX4iyGS/RAJYrL?=
 =?us-ascii?Q?z5SN+URx5G1g90OdFvXcT911IaZcvaCQJlYSOMgBw2wkdvTNAOk9sum73ez7?=
 =?us-ascii?Q?PlNm1e0uFP6mRE+yn/DOtab3DFEruCp0b37nmqzI6dU26n3RGHEVvGYGMwmt?=
 =?us-ascii?Q?p/TO7sdVu/rWVEt3YYHJwKQhoIodISLvUbyPMHGGtZJUchjvWjjjGdRexH0M?=
 =?us-ascii?Q?VdtDy/4nQLfHH96mD8SS36m/hDq9bB3mELGqwQky43X02i80PbbJDmI2x2V+?=
 =?us-ascii?Q?qgxsfj7jbZ67J6p+EKux1gs3JgAG5g0Sai68sJ5iQtDl/237SbtqTxG5ARJw?=
 =?us-ascii?Q?xISXIEneeZUmfzhmpchHsjqYSYDAKAa5mL5W7wNc8zvj0PdkyUKRTxQdHVi2?=
 =?us-ascii?Q?+9H9G4FqUP7x+3JIHwA1F01UcI8cLVRBp3xTpOFyXUzFFOytwA3TNTLw5jUj?=
 =?us-ascii?Q?0T00oJxnDhj89d240gFt8udnyCz8TBUeshvGcUqA5V4tJ1O/QvarnEF6aElm?=
 =?us-ascii?Q?jT4Rgfswspj1QIHajw4+IeQ6yp00Q6ORb3RH4XHLfLcb08gQVp0C5f9UZW+M?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10370630-2c4e-470e-234e-08de127e7760
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 21:52:31.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ULdtCny3buX1I5J/Niwm925yv1tt+RLA4aAfR8fNLIP0aNj1w1tFCH9qA809yiJZFO0QJ1ZCNwgZ8QuBRcO7UrsbJiLBL5w73glxgaBMoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

On Tue, Oct 21, 2025 at 03:45:56PM -0700, Matt Roper wrote:
>The bspec was originally missing the information related to steering of
>L3-related ranges.  Now that a late-breaking spec update has added the
>necessary information, implement the steering rules in the code.  Note
>that the sole L3BANK range is the same as the one used on Xe_LPG, so we
>can re-use the existing table for that MCR type.
>
>Bspec: 74418
>Fixes: be614ea19dad ("drm/xe/xe3p_xpc: Add MCR steering")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_mcr.c      | 27 +++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_gt_topology.c |  7 +++++++
> drivers/gpu/drm/xe/xe_gt_topology.h |  2 ++
> drivers/gpu/drm/xe/xe_gt_types.h    |  1 +
> 4 files changed, 35 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 0b4b617d413b..42e764564ee3 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -268,6 +268,12 @@ static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
> 	{},
> };
>
>+static const struct xe_mmio_range xe3p_xpc_node_steering_table[] = {
>+	{ 0x00B000, 0x00B0FF },
>+	{ 0x00D880, 0x00D8FF },

it looks like we are still missing the Steering column for this second
range, although it seems the description below the table is sufficient.

>+	{},
>+};
>+
> static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
> 	{ 0x00B500, 0x00B6FF },		/* PSMI */
> 	{ 0x00C800, 0x00CFFF },		/* GAMCTRL */
>@@ -277,9 +283,23 @@ static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
>
> static void init_steering_l3bank(struct xe_gt *gt)
> {
>+	struct xe_device *xe = gt_to_xe(gt);
> 	struct xe_mmio *mmio = &gt->mmio;
>
>-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>+	if (GRAPHICS_VER(xe) >= 35) {
>+		unsigned int first_bank = xe_l3_bank_mask_ffs(gt->fuse_topo.l3_bank_mask);
>+		const int banks_per_node = 4;
>+		const int nodes_per_grp = 2;
>+		unsigned int node = first_bank / banks_per_node;
>+
>+		/* L3BANK ranges place node in grpID, bank in instanceid */
>+		gt->steering[L3BANK].group_target = node;
>+		gt->steering[L3BANK].instance_target = first_bank % banks_per_node;
>+
>+		/* NODE ranges split the node across grpid and instanceid */
>+		gt->steering[NODE].group_target = node / nodes_per_grp;
>+		gt->steering[NODE].instance_target = node % nodes_per_grp;

reading the bspec I think it's easier to understand by doing:

	gt->steering[NODE].group_target = node >> 1;
	gt->steering[NODE].instance_target = node & 1;

i.e. we are splitting the upper 2 bits and lower 1 bit into
group and instance. But yeah, they are the same thing you are doing
here.

anyway, lgtm.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
