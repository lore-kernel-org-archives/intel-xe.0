Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10AC3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077F10E742;
	Wed, 14 May 2025 21:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+Z2sxKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870AD10E742
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256645; x=1778792645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ODkDzf29NzQeBwQDwOOOKjwNM397lxgu3m/FrTR9DQ=;
 b=I+Z2sxKWVYW8LikWHwv9gA0lo9UYV875556TVhHI9iSUeaUNVl1SGbAc
 VMo1TSZIyGtiQl+kKIkoJEEJR6m3vu7FvtNBZ7NRMbhggzMfkPt4O+NA8
 RwDRBGg9WEU0SvPn65pOHPTLVyaHZnOa/enmz+pZxSVFi8GZinBXtDvqf
 qig64wx3GUA9RJ+C3YV9TCyVyutCoNsmQ55XtZ9RRsGZJ65OJObhD2FQa
 H/D8PdHLofiaqKPMHciwTPV70FsEceaRJ5cUhokw3ajdzHUuNHM/Kwxs+
 3mFc/qwNCG6FEzz0tkMyMQLhSkkm9BkWFKEsFtpnpwrA87r/wvfwH5ykT Q==;
X-CSE-ConnectionGUID: CYBo1iWiQPWttkYnfhCr+A==
X-CSE-MsgGUID: QY9aiiSFS9CkmE+bDCDo6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49339511"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49339511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:04:05 -0700
X-CSE-ConnectionGUID: SR81DcayRGSYQRKKK6+a3Q==
X-CSE-MsgGUID: 2uy5yuCvTLmX2DInh8KfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169095411"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:04:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:04:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:04:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjkhEMpfA6a7JIuQm4YqgWX+pQuurFT8s57Lo6CI5IiLBr+1RnxwjvdcTPcMaELsunt8Fx87+ieTY/Ie3k4n2SJj7YErHVgn3RqqwxcRwAkcLIDSfx1JHYrNk2PQomYU5Oi3DgyzlDCO01IDiCOu/nJIv2x+ih3Vs1AaMbR6ygscI7WkEIq+PZTfE1UQTXCOgyiEs7I3vA0LTVKtzFGjCsXguY4/+XZFGHK01XhCsFgYxt6nyQon53ibfrU9UJCpwMCyb1w2Y9IRxHDfSsN268Y7SRLfl4sZANpaOc0/dtbrfAKtP/yihnurqf1RZIN3kO51gf/HNVp1nNCUDkmI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOVUgnntUi6mbW2WMl1FXLn4Aovm6O8B8heoLjZipf8=;
 b=ZDKz0z88AtxhvoC8hBrx1UPZ4ZGnCB8rc+A7k77js91cnUOz/hjq0Vh217S+JDSUTehOIRiexh+UDBlyo2VG7n+UDhHYsMDzvnwy7Mjv+RGDvwve+al8g95PWvaKs6a7Wib97VG48zP5ID02bLTLo0WvW9MzKaQO6jE5beq7IMY9UZBtffQ/k+4sC/RlwyIVAHirX/9WS/5wIQyNyEUPbCyBwsBn5dCP8LUQ9DQLhI4iGwcJQU+JxuIulsNNQ5Jl+6Swoo3dTa9JiP1bIAQqGOFUvENYdxLL13DDu9ShhhikDLenLUzxsRlouW1Qr+mS5fXmtgJMuz18Y4nFHVd5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 21:03:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 21:03:59 +0000
Date: Wed, 14 May 2025 14:05:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 28/32] drm/xe/uapi: Add flag for consulting madvise
 hints on svm prefetch
Message-ID: <aCUFlk/jxBJJwETa@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-29-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-29-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5e59bd-9869-452c-cbac-08dd932ad900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MyRRF+Qzu0hdBZniRTWKXpsvvQGExNnVl3x9BnZMD9zOkBu/MLxygJUJdVFa?=
 =?us-ascii?Q?Fmri3V+58Jl474L07g81kyK8n74gLKCZdHUr8zbg5xjha4cshSyEpphNg0so?=
 =?us-ascii?Q?LLMbVN9m4bSt/nNQKNZkz/dL8Tg0NgnYNblE4v86UmZqjkT1XSTsES773bl7?=
 =?us-ascii?Q?H6Q+ZU93TVcbRriayazqlGoFJhd6Ik7ppEaBtjhEdYCZUCun6coOkdyEFqWe?=
 =?us-ascii?Q?g6ZldwrESuSiX7iBVhCFXZv8wwxAS2gW1kjK4KmwWK8f6Br2SPD1nrJG6kKE?=
 =?us-ascii?Q?TllIJdfuHAzVI+fjGn3eDIplSadYzWiSjBulzUr8kQG3hxzoJvRYVzYCwxiR?=
 =?us-ascii?Q?9IZF0435AukuIOgC/I9homw4t13YRCEweOHP7t7aVNPogm4MrpixsmQEKe5z?=
 =?us-ascii?Q?vmJXSz8nrh4kMMGZYA1AEn2gKFlELefTxtB6UhJAUjIJED29KJ6rk9b/R+QE?=
 =?us-ascii?Q?R6jFYfi/DK7sJ2s6dsqV1shJ7sxtuRy6mX7k1UcAbojFy8MjaBfmKK9QPbbr?=
 =?us-ascii?Q?cJRVV1b6pSbznFaRkF5rpjJ9QWuBddIV+sI/x5ebjzSGSQ3NMLyXCm5x0Exv?=
 =?us-ascii?Q?T+EELwyr2QMU8m3TIehrl2eqIg7d8WoNGZsLda/X8IDv9bSDY8Pf/OE9D4G5?=
 =?us-ascii?Q?djUNBw7hx+HObd23Vvnj5hsr05ItVB42gEgrUygZUpW10V+RQFPR++q1Qr3f?=
 =?us-ascii?Q?deQkSkmN6y03PrPYy9QWDWNpGnHEpqo1/pJ0awtv3RJ5QxUNtIfgyqBGLME/?=
 =?us-ascii?Q?6apT/Z7VFIFKIfLqJ/re9o4oqkbM0/SjpYQHqPE07GQWTjESH52ITsI5hv+O?=
 =?us-ascii?Q?pPyAgBMO4ldtKgi2wXE70LOk0pidryM3lcn918yAIwncaDQoRPMPiwncF4Uk?=
 =?us-ascii?Q?N+sT3zN462vxPpughggAOitB3D6repOMv4FdwehEAo534zIdDJvVdxGIlqbK?=
 =?us-ascii?Q?2Qgl2ADMHa3BQl3ynR3h5JrvnD3/z4GWzWNAvwPVvr4f97xMCkKrwu5dM4do?=
 =?us-ascii?Q?Tm7CaqnIk931CmLXWWYb8fpV+poedVyB5ihuzDcyaKKehf2b9uDsWNET6hBY?=
 =?us-ascii?Q?Sd35x6qQAjzON40wtG0mJjNroI+rXkgeDrJzVHmvqwWS8mbQYdBgmvAimwrL?=
 =?us-ascii?Q?psadr9N+23dTuMZ8TYHKt5ux2mTe1gsc18knS/wVrc2jCumEGxSTyQqSPL6b?=
 =?us-ascii?Q?ANDL1AwJDml8oVUjbqqs/QCrQ+7+Na7RAij7dgq9zxLmM8p1MCRv+ZGVla1f?=
 =?us-ascii?Q?BOLG6QzwQXM8+1eUv/6ShnGdSqmvDCvlmB2ZzGpH8pit5uwOuoUa97YhQ/q6?=
 =?us-ascii?Q?fe8u5OejE/y0P+QBszMMdhWtG3pEe2K8rmhUnAYnW5wSIMxYjJpYawJQoMx6?=
 =?us-ascii?Q?5MxQ05vH/Kx2nEFzcvNoAb7tc3KwWwncGPkuiP5oFOz36lrdfuUS3tJ/FOT6?=
 =?us-ascii?Q?LZjX/rbZJy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JTiCzaKJYmFYoy7Gx2e/STNo7woB+XaIO2ajH7MdkytsCY+gIG+aV65njg8T?=
 =?us-ascii?Q?JEH/s5SiNZPF5w3cJCdvh5AiWTQSY6E01yx9r5OyAZ3MCvMjNN0u69CS4lHD?=
 =?us-ascii?Q?EAqdjVzgdTqNWCzikIKc2Urkf9WroVdvnTZxYif30T+tbjnsTIkTEIu+Oz3c?=
 =?us-ascii?Q?spTauTxlsJdYXKizI4HxV2c4upP572fKo53S4/VLXkUDqPS2UoH43IelOh3d?=
 =?us-ascii?Q?E5+xyU2QtvgQH99wOffFYskLW3W7bMFemaysoCzLCkewFcZLYvsomdLB0E4i?=
 =?us-ascii?Q?xsWBDVbxqjF1RMmiP1oXWVT/6P1Ffq+LB2yft4rGWk7o5QKSY092qeBotZw4?=
 =?us-ascii?Q?dTB6QbjiFYf8qTGpjhOo49bBRoWSAt9vl9CTSqSbRBEwBmH9vUaTipodW3MB?=
 =?us-ascii?Q?F3Uve+J9vmRxOwDdNUNc3TbWiZe4HS8YnqTmUpgnHZPqshVz0RRkHbDx7SGu?=
 =?us-ascii?Q?OpmRp5X5lXqlalgM62yte7rpl6Xxz15WzUITURRQGrqUdVxz+wZ3woF05yvV?=
 =?us-ascii?Q?6L9WHOzcnTT9oEJTEnudUm0O2UpIVCgpnwuDuiyazem/E2eNeXSfams+l81K?=
 =?us-ascii?Q?jhbQ5RZmG1waCdioS9J2IF4GqfITETXLLVq1R5En08X8bUNkSC2Iq0V5+S1J?=
 =?us-ascii?Q?CQC2FvWsUt785ebied88EtAdVgNm+H1NU7tuI3ZG6fPKA+miZZVSSAT8OlO5?=
 =?us-ascii?Q?TBiYI6kPtALhLLQJfmGdaWg4B+blXcfbazK0sGp2CqZ/ome4pmnXTqJdLCmO?=
 =?us-ascii?Q?e7IXDqPR1rhn0eXQY5RoYxM+NWpQgXtq9iRWMoVyAnlTbmRYF5dAqd80o421?=
 =?us-ascii?Q?Kdl8ic2I3S/Q8wEzJdQNwOdrEL/kZ/UolhHl8Aqft/xMDawfmHfo2iDnuEFO?=
 =?us-ascii?Q?sikH7gd2EtyRtOHd4XxSZMPj76QVSv/rZrnLx1gOpvT6kHs+6WmwAKPysfp4?=
 =?us-ascii?Q?ydfu5F8bfXIkT0RbPCu4VepLzlCFXsQc498CsaiNKx6hssSzIYbec2K+Sz2T?=
 =?us-ascii?Q?qA3OhijkuMWe++k5drSuCDh0z67fszuP3QCNoIJsiaCU3VWmSzya2lFqAdXe?=
 =?us-ascii?Q?+Ypz4SmP1JMl7FEYYklRkzfMYwN0h92CNr5xiDrSzDom3ikndzK3+LN/7oz5?=
 =?us-ascii?Q?NDMkV4MGTjU9MK0R1BBP6VfT1p1wkRuWZg9pxAdtRawoUgzpZK0vmFnWMZSn?=
 =?us-ascii?Q?NUbQqgKJOaNOVNiVfZT3sK+Q94+2qdD3rVPdlSqN6TsgyUHPQDRkogUtgn+e?=
 =?us-ascii?Q?RrbuHT59Jla9xBNlOkVlBtp+bPhTzNpabZ+P5QwP6/hKCa5YY0cm8MSRhoJT?=
 =?us-ascii?Q?wbAyiw4/jJbFQfJttdlMq2lu8dQ8Nn+PblLbgHHNq7ghhlYwnxT6sT/iGHvK?=
 =?us-ascii?Q?dfmdNWIL9RnMWfwLLBBdJExztl+bbONeXZZ/p4+Ud+soJEOGnXAZ6f9sLMBo?=
 =?us-ascii?Q?A8MB8IbKY+kOzL8Lw26TKOh4zAQ5G4BtUZMfCCpFpFzocsj+gy8Zchjg8lYV?=
 =?us-ascii?Q?f1PlPX639ylaat80lvJrz70zA9fBxQ9wLGJOVSKM6MrIGx3CZacGsQEHcDXj?=
 =?us-ascii?Q?QYOt+rcI2704ZdS8tpKK6X36PYxdcKhw09uP+tYRAzH5xWbKz+S+4l0Rm4gn?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5e59bd-9869-452c-cbac-08dd932ad900
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:03:59.6865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1CgdR755S2vo8bshtlamhFkjc8c+q6jWmzpzayNCUxNwf6Pg2Zhgvaf1rgFyVNXewynaGxPKwhs5iWCNn5N/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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

On Mon, Apr 07, 2025 at 03:47:15PM +0530, Himal Prasad Ghimiray wrote:
> Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
> in madvise-advised memory regions
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index aaf515df3a83..ab96dee25f6c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1111,6 +1111,7 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1

Replied to wrong version before. Kernel doc.

Otherwise uAPI LGTM.

Matt

>  	/**
>  	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
>  	 * It is a region instance, not a mask.
> -- 
> 2.34.1
> 
