Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB71E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 18:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2032210E44F;
	Fri, 13 Dec 2024 18:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbBFjG4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE510E44F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734115048; x=1765651048;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TpT7U//g3eTeyXzqfVjY2VQRxsrUPqvfmP5AZ8FEhQs=;
 b=jbBFjG4FOsjmUg0M+2BQDxfT9VsQx7/OMus25YAxCfBiFRlqlGJvLA1D
 m2T+F+oWMyevH1/ZAPz1TlrpI/0kV9xvprEoblfTsFrVoDevUodaKSqOl
 FTq1nxWybIMEmlsxs++6hdiodKFIbSexF+RJQhihruw7WFGlNv2tcysk6
 KHL/Qa5oCE7MebtCf4pyJ0ib2amznOFLdVufIPIsdrWC2X17g5Zz5YCn2
 Ctl1y+d1NGQEElI9eXDhtlmiQQ3H2GKbhghnBRUp8nXbP52OuNX/EYaxR
 SzJprYF4rpUhT7tveAXEoMEZd+b2IaABBULJ5dm1NQgw0tfxfv04+R++i g==;
X-CSE-ConnectionGUID: pC+n2BvYQ02GHTZNfpKp8g==
X-CSE-MsgGUID: 008LdqIzRkm3H2vMN/QsYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38258003"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="38258003"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 10:37:28 -0800
X-CSE-ConnectionGUID: TlO3JZcoTrK0ktDzmp75eA==
X-CSE-MsgGUID: YqLyIyqMRMa7WNY07dJrog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="101450920"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 10:37:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 10:37:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 10:37:25 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 10:37:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtlTBJEqcHGlvzlaHAwaN2Qcot284yD/M3685r7ndldr7Cb1AdkBj4QDthtE9DaiuzxKL/pvnZYfGeNqdnMu4DpkhdtflPBVYLs1alTFYr8M04N7gGk9XIJ1gbQoFTP7FdlN4QShmny68HQIzhcwxVNPbzrwOGjIS1Zsy5eMtRueT62KlF2bk7Km3MO4kaj4sGyVDBSkPfN8aMPYMNF5JEPi933b0zBCiSsUNhY9qJfhh83xrohctqtYXiVRwzSx09cWgcG2AAF8jrpzkdHpCJW7gc7XPjas1IcosKesonNuN6B106nPmTnqnPm7evhh+rjCjhY/Lwg0RuiRqLuOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ettco9pmNipl68HxhT1/+VxtjCW6K/nM3ZoMhwyoceo=;
 b=qw29HrnDuqzoWtjErIVuLXW/rOCAfRtkGl7GEaD3/2RWnziBlxsO8XYWWgdmRxHEDM7EFzRJz4L4AwjxqSmY8f8uZ5Bn3IQ0J1jvZYoWW8SzHHNsRsRRayZ3v68HMQ6YJVHuDv995G3RaxyncjpTLPy3E4i8n7Hv5r6c7ieALyjs1rVeLqDhXrgA3rKLHzZar8pR155tE1ztjsnq2AAdSrk+4Ctn7neWTmVZQTFCnWX7gXPgxMypr93cy0gg2RGn5AIR7YHGhcwttPWOGYzB9E57RYaVZDokkvykE4VV5leDHJVZ0lmuKQZQ1S/cWfRx+cde9qNit5MVL+Ta0zkWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 18:37:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 18:37:23 +0000
Date: Fri, 13 Dec 2024 10:38:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Z1x/Dd9WaaKTcABC@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
 <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
 <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 4010b576-56b1-4d4e-5673-08dd1ba52ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vftjOpp+pduveZD84Ea8XmLcBkiwWKkCmwyPf0EYOoLIjpqRM0WLhRu1YU?=
 =?iso-8859-1?Q?xF9plBek9sXo/rc0a1c6HiRP5gtCtNND0Oy3SuxjG5r52ijxLN3g0UedTD?=
 =?iso-8859-1?Q?UOe2lYxxRxsBmwuihQg3Rwf723u5YKsi8D07LWKYi5yvOELxcHy8q+tVI1?=
 =?iso-8859-1?Q?NeWMKBa/6ImQHuDC4+YVMXp2C+nCVz0A46b1NU4aLe4NXKYFUsy7hN8Byl?=
 =?iso-8859-1?Q?HTDnWTNUNw68sWsHSXPzyYF3MJuNzlkkp7uCsMyCjFTnF//yzyJQL4CWfS?=
 =?iso-8859-1?Q?d6b2rTrAMJmD1ViLla8vHDKis5zexET5I1kHQSHrvjaCJ8lzzV5UsG/Ptr?=
 =?iso-8859-1?Q?lP0rf9+J+6jk8jOIifsY/xCUzJBxsBDDR6r4uurvanlCRCCMDtPdR1fb7O?=
 =?iso-8859-1?Q?fuwWtQHFwSnk7RZfGzOhvXbXQwo60aRwEcJMb+RcIvVLjJDqFnZ8Zii6Os?=
 =?iso-8859-1?Q?ALKpR+KizCXEVi25o9pKndiVS5So4kwnZhp4ngFLXlgpwxjZu78aAbnRm2?=
 =?iso-8859-1?Q?Yhp1xv1UuWIFH4PNFzldDVPwdTglndYE0ULqg0fc2WJXAYtt62TKNLj7IP?=
 =?iso-8859-1?Q?eJmbakGDSqkaMehUzKUpaaGDd/yIaI6oyzW7NCiuTsdJFM22i1MUVyox7J?=
 =?iso-8859-1?Q?fMT+zkEExy8iyuX8UCcoV2UgInD0vois4401Fj8ISqMXxeqM6/fOHU5umI?=
 =?iso-8859-1?Q?jpFmcpXzZ6o+xiszzxEkNwTC4GMh+Pyh9C+d7NnyI8gSf5l1ISyPbfb8mc?=
 =?iso-8859-1?Q?3uWgqY3l4Lzyj3A4e+MoUW2MqGKbigU/0uCCZwS+BLt4aCWijsngdxGyFQ?=
 =?iso-8859-1?Q?a3Tp5/tAqxLcMCIEaI/jTrL1fB6b0oyvp9XLQIiIgTXbm2mptO91WMkM2j?=
 =?iso-8859-1?Q?B2w9DDpkYC2ABF3snfvpW1+gBbSuyKe5p7cQSE4vAa8mZjKRh9k2cvr+/U?=
 =?iso-8859-1?Q?mbRZNYBjhvt76UPvXXcZ77+4iDS5xWpnMBm8YZQfzsEAPvo5OPBHNTa/aq?=
 =?iso-8859-1?Q?4SzPMO03mdOYu2j9+IXcokwOkrXnLQNafT4taFmvHzAG9GQDBkXZ6YKOpH?=
 =?iso-8859-1?Q?qN39xrlOUrfugLvrquaRewOtjOt6MP5dA15edSWjn3i24oGNXQ/iLc5UUW?=
 =?iso-8859-1?Q?9vGYpRDF0e4+/qVQa1bLXDGKmLPb3x6tpnscrMY+Ay81HbUEQH+J9WmPmm?=
 =?iso-8859-1?Q?A7eEqrv2zznqgmdlfwrk5M0BoQIG8RxJFEAkxNugeFrVaz+8je9/1XI1vh?=
 =?iso-8859-1?Q?1DtCESZRaIFSBozsvAwMV+VB514nOv4Y3eQSSycX/8VegOXn0g8F4mJmDT?=
 =?iso-8859-1?Q?o4kaw/CA790V40FOfs/6u/ejZM6vQ82OVaeZ8IvbWX11eVZIrZo4zOYGbp?=
 =?iso-8859-1?Q?xDV/GxNOAiPDeSRVV6ECxbVBkivDvQeKTnAHGpTrFnklX0/OyetaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IpDW90p3+XQ8G0U7gpCe/h4z6DYT2mjI9PlhfKQxb84JlI/iEFhtY63EPN?=
 =?iso-8859-1?Q?sFHFDDPYE4yQhlbtWqjp6Gh5kZBMjBoxO9+UaCRPtaUQMPRosItjkdkYgX?=
 =?iso-8859-1?Q?rhCVFr/IA5fAioQfsdMdlTUIrrRzuLaKiN6xA5SmgKOv0roJicDGlMh2nD?=
 =?iso-8859-1?Q?dtqCMwyLLGxAUfV1VIMuOc21xieZXRGPEe2KqHC6XxnjVfkvRJGBRdt6ua?=
 =?iso-8859-1?Q?YRcIDfyDoGO4QkQA+F1v1G1Ki0+949eQRySWjd7OArkDo8ucBdx4gQc7Ws?=
 =?iso-8859-1?Q?LOFOBEma3FpllCWF7YcLCXkLqO2elWYoplOEriLZbVlShokePJMXEd0oPe?=
 =?iso-8859-1?Q?jCVNTunbZnZUcupuRZFtWv++oe/nwjGQ7g+dnRzUBiAVqzrYyT6s4gl0NE?=
 =?iso-8859-1?Q?Tbg+5wR0g0wuptl9CdCD1owAjsSmgArK1xrDQTEt3VQ3ecLgLpRoDKy0Cy?=
 =?iso-8859-1?Q?fDgqJewwP3PbhoYBcvNn+RnQIWA/z2WxXx7yjdfdc1+T7iPViI5ls1U9GK?=
 =?iso-8859-1?Q?4e+UVWiQMrLUOGjayd91ZBSZAXdCs1R3zY5JeUssyPqyd82yi6Ay8Uvdi9?=
 =?iso-8859-1?Q?aayhSnA5PMVfzUnusr1BkBXQ7YzBAGeVDt2PDwjVk/bx2X+At5KJPRTCzW?=
 =?iso-8859-1?Q?q0xNn1OxDDcQl8Q4D0a61XVL1nMBUicIZWtF+hLsagV1VYuiw88x8ujyBC?=
 =?iso-8859-1?Q?LbiZXCmihZOSErLfrdaY84JdJnCediu+CzoqjstLWs19VaRzwZvr+jTST6?=
 =?iso-8859-1?Q?0S9CyNWQ4OkIjNjpx/7h55JF3tgpew2JXl1mvgIhlcgW6H9D9Z0i6e4S/s?=
 =?iso-8859-1?Q?fm7aS2KjyF8neA7cuUQ9TGXzAOS3Dz4PstBY/W9mlEjXniUTwxOUYsLzM3?=
 =?iso-8859-1?Q?4hquYCmugInImzG7271utcf9CuujKESLyv1r/6hb//QWb4cTNA7bTpvfQr?=
 =?iso-8859-1?Q?WhJ7+2HMXHmeIdgkmPD9L4+wc1lKRR4va0Xxjn4t8Tte9gOT987hMOLcUe?=
 =?iso-8859-1?Q?Y3Ss/CoGXVqBsvtjarjmuFc9gnJo2CNJu88bVwzFeeBJahdcSSAa4UkdOU?=
 =?iso-8859-1?Q?s/6COi6o8lfZPoHXn/idX1dHcUhI0NhKdM4wyWg7huNdM9DvA5v/B62lI1?=
 =?iso-8859-1?Q?n/8MnzMByjV3GqQxpdyEeVxnQnsy87ha4nvuJr+PTvOC4tceDRzw9V4nBi?=
 =?iso-8859-1?Q?eBRk0humu7MEjn7Gn7Nehzn1atetIPgxMp9688fd6ET+40EwNErwK+Cckt?=
 =?iso-8859-1?Q?/Alzon7bFkJE79M2ihHb2hD/9KHuWXIQKVleUAbKsaRA/jKMdwpKwpaTen?=
 =?iso-8859-1?Q?0ifVVWotRMlLimzsY+LOtEmM2x0CBPSo4to2Yyc4FBeSesvRMhphwFIEVy?=
 =?iso-8859-1?Q?FE3DBFsXYRpMmQynK6QawqOb4qr/pLdL4qr9w3G16p8AgdkACxGPJz+M4K?=
 =?iso-8859-1?Q?pBNqeaEpcCDOCCofiM2ZGyteb2dXeO11WtSF7st3PnU2bAeW4EqMWKZ2Ez?=
 =?iso-8859-1?Q?7IOVGrcLFIBKPyrhCBOcscHWcMZi6rXf986Xd+rohGLyVa0WLg6zXcZww9?=
 =?iso-8859-1?Q?aa0wiQOG4PfSl2HltPLvuKDCrfmYOkQUMW9oqyXb7JPvCfE0QOqGK1wsBx?=
 =?iso-8859-1?Q?GvucTL0q73OyGF+letOOE7b9Pz83fygVf/dKke1nz6SUjYE0IabH6xBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4010b576-56b1-4d4e-5673-08dd1ba52ef9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 18:37:22.9956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IAIQk9WM3SeEgPNVqvynnBcA4aCcgReeqiVGkoRKuh0zS2TDHJU1FVzhhavRXg+Pv+O8fpSlcfDHXWRaLJlTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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

On Thu, Dec 12, 2024 at 10:48:34PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 12.12.2024 04:30, Matthew Brost wrote:
> > On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:
> 
> ...
> 
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >> new file mode 100644
> >> index 000000000000..9e123d71c064
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >> @@ -0,0 +1,28 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2024 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_GUC_BUF_TYPES_H_
> >> +#define _XE_GUC_BUF_TYPES_H_
> >> +
> >> +struct drm_suballoc;
> >> +struct xe_sa_manager;
> >> +
> >> +/**
> >> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> >> + */
> >> +struct xe_guc_buf_cache {
> >> +	/* private: internal sub-allocation manager */
> > 
> > I think this generate kerenl doc complaints.
> > 
> 
> or maybe not, see [1] which says:
> 
> "Inside a struct or union description, you can use the private: and
> public: comment tags. Structure fields that are inside a private: area
> are not listed in the generated output documentation."
> 
> and CI.hooks is also fine with it
> 
> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members
> 

Ah, ok. However AFIAK we don't use this style anywhere in Xe so maybe
double check with the maintainers on there preference.

Matt 

> > i.e. Should be:
> > 
> > /* @sam: private - internal sub-allocation manager */
> > 
> >> +	struct xe_sa_manager *sam;
> >> +};
> >> +
> >> +/**
> >> + * struct xe_guc_buf - GuC Data Buffer Reference.
> >> + */
> >> +struct xe_guc_buf {
> >> +	/* private: internal sub-allocation reference */
> > 
> > Same here.
> > 
> > Matt
> > 
> >> +	struct drm_suballoc *sa;
> >> +};
> >> +
> >> +#endif
