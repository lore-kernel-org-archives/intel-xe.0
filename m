Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC36CC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696810FC67;
	Mon,  6 May 2024 13:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVgfMNJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DCB10FBBE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715001355; x=1746537355;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/SLSzpQzJyRdQawbTopNvNSgYt6M+q2K0eUsUHtzWZU=;
 b=YVgfMNJl98eL2sMp8s7YhQwMluPNFzLhUFLmmf+bic2XppSHxvoP9thn
 LLo1NXSnk98lApkZYj7E2vmbZe3CR/dW5MlkXqXOiKq26nuSMizn1B2oQ
 PKw752h+sHyZWwfZ7YGz/pAondc6eCBCqKFm3eeb0YdeNWTbY3yyg8JCK
 O7SmxiRARPiIXS9wcphPRs8/5I7f92kRR1LTuVDcwEoDRd0THqv55/23h
 1ix5vC+wdrdmo2AUbXtwvr9ZwhlzI9VhaxrxPsPixWc8Rzees6zX7weVA
 HUsmLZpgEVLGeYvoMJwznGg7oQiPEmmRq3wau8mK5xTdQYokivGwmIR3B w==;
X-CSE-ConnectionGUID: WBa/VROsSy2a888YCeL9KA==
X-CSE-MsgGUID: VQd/XgCYSOatC3H5XnFiFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10867355"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10867355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:15:54 -0700
X-CSE-ConnectionGUID: ClO7TiajQlqYUQTqrTen8A==
X-CSE-MsgGUID: 5D4ahaGcRQGuKa5lyXHqrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28747315"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 06:15:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 06:15:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 06:15:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 06:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpcbhSFi0x2xI1d8tcd51dSu4XcPhin5lTbIJhDBOD5GbTOXZ+GPRl6HAeBchr8gRTKEmOgtTZkk4xsl2CMxoTnTc/bd8NjBW1UNoFsLrAH7va8OAUVrnVRR0qH66GbxSW8pccsL+tKgrY2lkmNcloiwKPP2ACkYqiC9rorh6B6WH8fMRvhYQGMu2UAGTHTE2Vb3DMuYuLAcMlE8uyNivISiDCSGr1Of8p6mZrE5ZLnjYqAd11OaQsonn452qgs0AF1YtKp16z+TwnO0EdnibDaKFGAdYqAtnU4c/LTYgcoTP0iyNpG+DtygP3twdjDKKpgnJgU2tvJLX2Luyf4zmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74BCT/i1BEsN1zq4pfZ29vtc/0dAlLnJlCBjds+yPrs=;
 b=HYDwEub9YaEO25GNPBipZwwaXop3ltE39Bho4OrYSNwbUeF/7O+SzFwUA7fj929Gkbuh4L0N/5S1d5o6nPuW+ulN3anSIWt3SyPj5YtdSWrwSwS8VYqqEiDu2JWZ8IT9jjjzuUl7fA2riVRXboYIJ7yTWDKIeoKpXfBg/FuNniNDy+GJV2dhdqteKrSqDhGrHDvdJH966/76SXaHekqbZFuKO3t7HffwRQU9v8NWwKTaUGPq+IQQbbDSAltP+PAoxgaLfDJTjx1lMCAGsExpEn62FZGlwoZvyB80TYfxoCJa2/rPRk9VOg+IvMRDBaO/Uavk+Neiqm5ZZLts0gN3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 13:15:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 13:15:49 +0000
Date: Mon, 6 May 2024 15:15:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
Message-ID: <ZjjX_5L5P7JR2vgH@fdugast-desk>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-2-rodrigo.vivi@intel.com>
 <7fc1de2451b583b4f89f2a0d938bfba55a6acd98.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fc1de2451b583b4f89f2a0d938bfba55a6acd98.camel@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR03CA0092.eurprd03.prod.outlook.com
 (2603:10a6:10:72::33) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: a135248f-5380-4ab6-d4a0-08dc6dcea5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dV24AQXyWmY1apa2IvKxw2dx9LmmjNAx+WPlDJa9gtEp8K/GbtihkC+mBe?=
 =?iso-8859-1?Q?A44CQnT9gXVJVAjuMwZ8hEwAzUMU6IvsV4keivGjxHYAZaiUwYopDpMn9E?=
 =?iso-8859-1?Q?q4dDV5hxEC2+n8jsX9YrvMG70l3homY2XZ1GyLxR623qpGtw4hTYFFmP24?=
 =?iso-8859-1?Q?k3IcWrzzVm4urFnJJ8ASvXc+nld+3SLIG/IkLcQ7x5T/rTiTtEtenPXS8r?=
 =?iso-8859-1?Q?9juXqs/+1QC4Tbzy03AIcEw3DVH6XKzN7uhOZ7oKlKJdHcnjZg9/ONpzuT?=
 =?iso-8859-1?Q?0kYePTwIPmrqUz+X6HiZrGziJVQvrHYxM9JFwwULjqCklC8PbfdLw3vvmp?=
 =?iso-8859-1?Q?qcAn9IdiltOO0rLO4rcO4m0hYbwBPZBrHw6g6m0o3KR2u4+Ip7QblJc/vA?=
 =?iso-8859-1?Q?VzAfySa7GR0ow2rgTa2CgPlTXCYOWTSiRshs29ew8okBK5/rR7flBFn0b3?=
 =?iso-8859-1?Q?8BX1AZzFtHyLMnsDK4rHbMh6yWiKWLO4lj1cbPdkc7aAmt3J61HzwRE+7a?=
 =?iso-8859-1?Q?LZqPUQGtCZKINWGBoZPWKzqxw3/qcpx6I1KYg0ePG5RutimZEGL7h/2m80?=
 =?iso-8859-1?Q?hX8+xb9d1zLA+9+bl5VFtHPrrccZw4euNOHySexuQgb+QG3l76lgbdQOPy?=
 =?iso-8859-1?Q?zeNhtBKofoWC9mhYsbsEBJF7/9i3ttxbxto0e0Te5i4XjEDxmS1NNkYc+v?=
 =?iso-8859-1?Q?mEvahHcy72KDIN67gkPkDHaDNJlo8qxKNS4nBWIXYK84BOpb7Iase98wKy?=
 =?iso-8859-1?Q?aHmk72//u5n73qOXXitQNs4lQvm0nIIqV2G93+cpGTEfBrFFWtNJNs30eQ?=
 =?iso-8859-1?Q?QKUk+YyT/musatr//ixN8SBLbD2JZ34ku6tMN0BSUwWKy8sMGVp8kMM2GA?=
 =?iso-8859-1?Q?aUtwJ5VR3n46dLHP+Ojkbr/KPfUjlzzId5EOzioXzT0ak22jFWPCLLwFTC?=
 =?iso-8859-1?Q?qFtHveW1rBS7WJ48wpjz6eiFW3PmYH6arhW3fWTiyhAHtF5Ya+tbYv9+Af?=
 =?iso-8859-1?Q?v9QVFDxDYWWGIW1VAbQFtS+mtD1HIAa1YypKmLr9gfwQ1wElpuuihKEabw?=
 =?iso-8859-1?Q?gwd5wgCFSPpMRzZcd5bNSggp5XIqQEPghd7/YvGnWNPWr+icYvahmda/ab?=
 =?iso-8859-1?Q?QGqDh0QzWCUaueHkGGY+8FGPJaMGbG3RR3/6iuQR3kWt2dc+MI+E2bK/tw?=
 =?iso-8859-1?Q?F44LU4z8RCShe7LtQnjlCgoz+BxYCEEfCZdeDnBv/uP85U3ivCsAkcgTTt?=
 =?iso-8859-1?Q?APmBc/VjUaa0TwEtZfI8w6LvomREmGTak74aqXRuCDilcktHu92tBgev+O?=
 =?iso-8859-1?Q?BQAOwMJWXU0SVKvbi86HN3NVPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nEkCgRZGt7RNArjdycvZ5cW5FQ9HqNiP1rBWSMUm3rwjQX+tNY1XyFhPO/?=
 =?iso-8859-1?Q?IsNSMAXBPTxkYNcPo2VRro9RI2bgfY2ttFhN4yXlBiBZbxbhie4WA1zWhC?=
 =?iso-8859-1?Q?C9g5bLfj0a/09O+wBs6kZBr6eNqiPlfrSGXEo0Uw86mymGPUPQKb8Wx14w?=
 =?iso-8859-1?Q?qjDSKBDl262zK+eWydFWQ4dRSZ3bVwjEw4f/3ESz/BBPjN+/iAefp4OCmo?=
 =?iso-8859-1?Q?iFK6Ess0dze+pwx6DqA7qxs2AZsHVjp28B8JfV2N9XbFfsVcPJ3pyBrNFi?=
 =?iso-8859-1?Q?HBBGWFJp/3e3HCKZ2LF86bzXpLq9gAecKcntyO+YIBrl5rkJX+aozb9zSu?=
 =?iso-8859-1?Q?pyXYAl4TX/Oe0Os7ignTFyuO6o2IwTaa+316ssLT2my/GkCrXuw+5j8z4L?=
 =?iso-8859-1?Q?ZE58kaYuVRY/Ms5K/aLHh4Hu9ltpVSLpiSA/tsZyiBUN28juYpJzvuMzrv?=
 =?iso-8859-1?Q?8x6T2JfZYk2VoWoUIv/hgnpRfRTzhRkEvLwP1YwZf9CgotLAPFdx0Wxev+?=
 =?iso-8859-1?Q?rXR3Qgn+AfFuxXmcMzGYNw/Uw7t21YWbgrD0vfdjBJfXNaNOle+4qjatXj?=
 =?iso-8859-1?Q?mhwJqAhJSCTJiQH3lyv9wjNHy6yixMCi0Vo3AuoUk6yd3fO0LWkj1H4BYs?=
 =?iso-8859-1?Q?0v8L2zz4G6x2A0zwzoihgMljWLiganRrQfep4EOzhzVmOnTnsV1VHx+Y6Z?=
 =?iso-8859-1?Q?CmeBseeF45x1gtnBXG8kSt55QWlf47r45HZnbxC6WJ9oBZsAzbuwIvmuXa?=
 =?iso-8859-1?Q?jsZCABRpoiE0XKtTxflrjWxZ8JoYBx98thR1HZAY8R9ZmYU7M8iuXHbQl5?=
 =?iso-8859-1?Q?2sO2vLlx2h29DDjDrjZcebBjafI9LjSgGcMuItBq2OL6LoRLnAkN2G6Pj4?=
 =?iso-8859-1?Q?5iGQq/FGtbh9skPVT/cjsHt5WsQsNdm+Mdrn3KKBDvhuWkrEpuxCnRgwOI?=
 =?iso-8859-1?Q?HeYiaMufkJHZxRxCWCC4CIT9Y+Z060CzT3XTcace+N5f+R5ByQf99Z0Rn5?=
 =?iso-8859-1?Q?AEJEmSnZPjQqcBQNnUrhoLoeVEWvyrFC8s+xn2YFxn/DnntkrKwTPdcpCa?=
 =?iso-8859-1?Q?zXIGbHWZ+ZiQD+AasawOQI4Yqtl76WEl7p6kZFMAMKP5EdGQk2McUjlPJQ?=
 =?iso-8859-1?Q?7bvo0Xp5V/YON4/tyqubuA07/G9/oMOK9heVF2fBZcCINdM1fNUGF2S2RN?=
 =?iso-8859-1?Q?IRRTvVVXZzwat2n61yFFEFeZWAYZAt28CA9xPrvWRnU8CSuvHFqbTL+jco?=
 =?iso-8859-1?Q?kGijPl5CHsRaBcp2JVR0f7gv9kZ3DliJMqE/Sxp5JXuNb/8YgYB5Yq8gNg?=
 =?iso-8859-1?Q?gh0Kodr4I8zqVTmg42uVJizOIWbPIkLRaOK5WkeUoSJvFMBpaKqS1nB04U?=
 =?iso-8859-1?Q?bWkgUz2476AZbQlbHrwBo5QC+q1N06xAwzZtxxxLnkiU/8BXHrBUv/v4St?=
 =?iso-8859-1?Q?i2psp77QN5Yy2WO9U/vnsEEpV9meNJyo64WiD4tiG6NYusHzMDfqAIEBjd?=
 =?iso-8859-1?Q?G4kEWuQKoJ3r4X9BNSaDWJ+YNzUQBN/gI4ZkEEdqwsLfwhx+vR/5dVMpG/?=
 =?iso-8859-1?Q?0qaStavkepthBKS9QGpvKdg84ScU5V3+9aHzDzAFcyNPEskrKUDWuuKmDa?=
 =?iso-8859-1?Q?F45qwFJftE1kNPLIi3VF3IQllh/0gC7HLUq31Re4+PjcDE+P0ndVPH5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a135248f-5380-4ab6-d4a0-08dc6dcea5d2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 13:15:49.3960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v5Ad2smLCywvzZ1jBeUF6E+EIlq9IEEhnGlqiCes9puAy9PNzd5Aq0MRtdS87SgjWnz7rZr7M+mMwuwS4FP6qnAzptWk/Lf/OuhUK2yyPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

On Mon, May 06, 2024 at 01:47:56PM +0200, Thomas Hellström wrote:
> On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> > Current callers of this function are already taking the result
> > to a boolean and using in an if. It might be a problem because
> > current function might return negative error codes on failure,
> > without increasing the reference counter.
> > 
> > In this scenario we could end up with extra 'put' call ending
> > in unbalanced scenarios.
> > 
> > Let's fix it, while aligning with the current xe_pm_get_if_in_use
> > style.
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
> >  drivers/gpu/drm/xe/xe_pm.h | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index c1831106ea4b..eca977d1e1cb 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device
> > *xe)
> >   * xe_pm_runtime_get_if_active - Get a runtime_pm reference if
> > device active
> >   * @xe: xe device instance
> >   *
> > - * Returns: Any number greater than or equal to 0 for success,
> > negative error
> > - * code otherwise.
> > + * Returns: True if device is awake (regardless the previous number
> > of references)
> Nit: Athough both "Returns:" and "Return:" work, the latter seems to be
> the preferred.

Hi Thomas,

This is indeed what grep shows for Xe (for DRM it is less obvious). The
doc mentions "Returns" in Documentation/gpu/introduction.rst, should we
update it?

Francois

> 
> Otherwise LGTM.
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> 
> > + * and a new reference was taken, false otherwise.
> >   */
> > -int xe_pm_runtime_get_if_active(struct xe_device *xe)
> > +bool xe_pm_runtime_get_if_active(struct xe_device *xe)
> >  {
> > -	return pm_runtime_get_if_active(xe->drm.dev);
> > +	return pm_runtime_get_if_active(xe->drm.dev) > 0;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 18b0613fe57b..f694005db278 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
> >  void xe_pm_runtime_get(struct xe_device *xe);
> >  int xe_pm_runtime_get_ioctl(struct xe_device *xe);
> >  void xe_pm_runtime_put(struct xe_device *xe);
> > -int xe_pm_runtime_get_if_active(struct xe_device *xe);
> > +bool xe_pm_runtime_get_if_active(struct xe_device *xe);
> >  bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> >  void xe_pm_runtime_get_noresume(struct xe_device *xe);
> >  bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
> 
