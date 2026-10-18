Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC0CCF2C4
	for <intel-xe@archiver.kernel.org>; Sun, 18 Oct 2026 01:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9A10E4F9;
	Sun, 18 Oct 2026 01:36:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155610E4FF
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 01:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792287381; x=1823823381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cTFYvHCrPCsVJ25YlJHyE2JROVOnnlvKXC5tu2Z5jkQ=;
 b=Mc5Ckml2p4HVhRcelyQa/DjDOP1nerM+ZErmDOcbDV8Mdn8p6URx1pDb
 EllyX846sypTkTErq+H3jDzbaCPV6PrS3r+u61cMdmMv1ow47Qv0SGJhM
 C730F6qDNWY9+RVTNiDrUhhoKb+wyOp0IndZMUZRKR90YglAMBo5rARQ4
 rMquyIBb8cvII6xkmj7GWoxb4eKBL6JmCTr9OlzWJH57VtFDXvpk3F5tz
 MjozngpxL383dDr2e67K3R1p8oLRHt2rn/TX192pmWYZ/xtDeJadbS+Yf
 pk+j3ZgVexcHHnQJDtORKIWYELbNkaBAlZcPQurLx7iwZSF8iJBSj9gqP g==;
X-CSE-ConnectionGUID: zHokWM/jSAq4uQ0IIq4vEw==
X-CSE-MsgGUID: VuJ4yoNEQ6i+Qt+vhtTufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="898498"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="898498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2026 18:36:20 -0700
X-CSE-ConnectionGUID: bSVn3oXRTxGQzKEH3OHs8Q==
X-CSE-MsgGUID: l3o5g7Z9QP+bDxQbpUDQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2225182"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2026 18:36:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 18:36:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 17 Oct 2026 18:36:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 18:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b131Gh45fIthwAiup5lbQ/c8NEekv5+aXW16F5jzWQRdBAvs0EcM3N81KTW3ASj+StUnVSAYVxljHIDOuXr5TiPs3VrelAbIq4wspRUKd3+gva5yHZb7bW8903Sc5G3K/FndLzo06hMBAZWC+w5LKM/f2yGx/ZGDvwFwDgzlGcfeAnupPslf2lq51vlxOmXb0zF8ftm/v1eiMpJYrxBmzbWgGaeay3JhTAG6F9vOFBJ5jCxyXLcL/TG93g9W4doZv87RHWLstm7BL9lLehxmFgUppnJLa9ebX+uFwsw9dZP9ufcKIt6P6F5+rrkYRt4LGTjztxCopdX1mbtD/ZBBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtp6suBOi0gBxSLU99OQ5B4C9EHExNaMfcOCH34LLkM=;
 b=liKyK75oY2kqaolqLTkYdbbEkBqvgK2kfERZl48tcX7evYz5V+JjUt95PVZZw9AgR8EdNFHs83SXYCE34L7Dc8/gJvtC8se2iHd/TrsE4vEeobJdd2Ho3IY9H4+hRPWS6aE7w8gSzk23+sR664TcBWmatMi4wfQ0cE06KRjDUJMl6riILyFJ5Xdk8RENADAERMt3VMTHzl+RQ6Ke2OM8Foo9bsm75gxmyRTvB0hs7NChNvwczyCuDhG1gMu762rr9OSLwcVPo3IxPOiLiYW6EZZlIDMcQkAXTgpPronSQqbMjD5VygYsFK/A7Zi+g82YR/+iT6qugbUe1KVsmh58pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sun, 18 Oct
 2026 01:36:17 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 01:36:17 +0000
Date: Sat, 17 Oct 2026 18:36:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Memset g2g buffer on resume
Message-ID: <atQijzs8S3hDmevh@gsse-cloud1.jf.intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
 <20261015165451.154495-8-vinay.belgaumkar@intel.com>
 <atJxs5BOjChYDEaX@gsse-cloud1.jf.intel.com>
 <588f6e03-3b5f-428e-bdf9-459f74efe244@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <588f6e03-3b5f-428e-bdf9-459f74efe244@intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|SA1PR11MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2df713-3133-47cf-faba-08df2cb83466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0/dP9B6AvfqLFoey1Be/AI6Ms3uTRxKYv342I2QPd+ZuHd/jloDIo0IJnAajt9Y3FARQ4sBLTLTvRJI87fb7CCesA9stnmkRdDKSFe84s5WlWFVJBm4GtqN1Mlu9jzqkXsFqjfThoh/zXI6SSGY/4GMTlLOdq6SRlevlUh+pUVZJA6lHDMYHEa0GHdBTTSY915Mo19XnhCzpIoXfCrr02BJcFsC0mKDj+MxZC/7GS6yKe2fRGf3odqf3oaaIFjF9tyTn9jh+F6/DK+cMNN6Mtup9cwr+LRCaWU4JWnlqO+6qjeFxlr/HONpO1YeLCEqy14bYl5wcgqTa37T6Fy9Hlo9XEClqq2htTFY/GoTWzjyyl0JrgTjmYV+YHi5rOu+6h4FAwh2rhG+kIv//5H3wa+0lomKBzil/mJsbVd9SltF1Hkk+GrlgUi6Gh2e8xB9xTbFN4kMJHOh5FxtoP+BgnyP6TCN2Xzzr5eBZdDD0vCfo3wQWXnN/FMqiVv0RSLQ3Id8ksbTcbzLrad5E/v+cK/HL3DgSbehcpdZ7aCAEpIjZDJUhQJnjlNF8uVMpAAVlQU0WYl9zQwu/H38EYUfdvxYcal+564s5Ch0JRFHY7U6g+zVNP6MK9gPA3h5rVVtIv8h7PUQrfMebqcBsjFkMZfBxewvVNkQvWkQuylj1SFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JMvilHatmFJVsrqE7c8sZ7XKE5We97MfN4uROLBoBr00UWcD7Lc15pYtfDZ?=
 =?us-ascii?Q?1lpeOQpALIRIX5ghGjZNt0rLwIuV5XQvn/QFMzMyc08agDpoaU2UE5cWyv/e?=
 =?us-ascii?Q?lxgznENSCxWqiW8lTtaV09PSDTIOfm2cDcS6ffPaFYnQb/RtgcyiQgGWUHjQ?=
 =?us-ascii?Q?Aa+ukeBl1ubKV0dA/hvFRmtGW4rQ37pcIBd74OjhJDKJqZ3T2OcirSyidI6f?=
 =?us-ascii?Q?yRcvqH2AwXakCNkwkUzir/3NFKQ06BIbb+U00eIhjY5T9u9EuNxI1URCPyo9?=
 =?us-ascii?Q?cNsFEOZT+b68+m6ZUpcIixHMQGUCG8tKBVB6VJbYpB/g6V7RdleAYgGQrNdI?=
 =?us-ascii?Q?ympXjyrOIWhSzYmDAzieKkHIneZHvxuvhoKZeMKRJDxCgp/wYB2XoWmgdDMu?=
 =?us-ascii?Q?jm8yfCG9P9/LjzAZoie4kfvgdYAxw8iEuWDrBmRPXHSGo5MLbEn1BZ9Rv31/?=
 =?us-ascii?Q?xJF9XAU+3Azue3RMPnedMOnX9+kFGIiypyJCWigpdSlhi00uCETXx/p7q15p?=
 =?us-ascii?Q?EXDExwIgUOPkzsfoviS0CWBO5Ad6GCx1IwKJMwCvuKfOayoGn+yx/NhlhdNs?=
 =?us-ascii?Q?h+66TRj1VIdnI5ClQgNm7W1GZ+3c3lUm1TyX6VmH9ba6A2K1VcqWl4qEU33P?=
 =?us-ascii?Q?I1QFignBHXW21Hg5r5/k72abt+0dlGOe8ol7XtXScF8Nj8x9Kh02OQjDXLzb?=
 =?us-ascii?Q?mlbMyiJqS9nagwjO1Eb3jBcdkK18lqEXUdGRB0LDjL+qMfEz3noDdgLc+ugr?=
 =?us-ascii?Q?JHG/FUTG6m6qquOqDIDKzF5W6JHNKGHhAjiebnVZW0rDlhFfayl5+7GXN75n?=
 =?us-ascii?Q?QXC4tnFnGTzQp1MBb3tRghmW4VCWympO3Grk2w9xzuD2OapAgOVly62OLSUC?=
 =?us-ascii?Q?97Xsa+tXG9gVevAYKJGwBH3Sc1hu6PY/Fri41SK3G4SSWn8nIYazoea17PM1?=
 =?us-ascii?Q?s7nEIsMGvPqsUJGBLpVKxJ2iiDbyZWnkeeQPINkO9X3e6cZFVkjTeBKb+zI/?=
 =?us-ascii?Q?Dfel5C7NFbfxnrTOjFlOVvPIGyCjl+Et2w4u488MsYhhQw34MTOsVv46xMM1?=
 =?us-ascii?Q?tPA7a+J1M61j3dcw1BcoOnuHwJVxqv6ncmPUKrPTSCZDN/QFaDd5SYOGIM2o?=
 =?us-ascii?Q?72NQpm01BBT2elmAomRMG+yliWS4sKSyIyGyc/oKwwSzFJ97A4xd0W2p18lz?=
 =?us-ascii?Q?2d3SOHxzO7hEdLYWqvdjerDSp/3TGfbih4gB9946XDBg81Km8dP4K9ViKSev?=
 =?us-ascii?Q?7Y0pAXzvXS7L/S/rZmPjUPK5At9CsLugC1bJqu9+jKp7eyix7TnMHng74vc0?=
 =?us-ascii?Q?SC8H2/GexUZTNopPHHKP6bKYaFWETH1AtiDVLov/ANoTTCbPfR7cHjvzefaP?=
 =?us-ascii?Q?mvbNxmuVt1e61ORsvxN8M5RviLZT2BTnxpHSXwyJY9RrgW1KPPYc9qNG4YqT?=
 =?us-ascii?Q?53hdlvwUIM1xlFiizW4vGc25YUJPcgc2+sjthDP6tfFAKjRMuwn3UdCjp2Qu?=
 =?us-ascii?Q?a9X04GDr4KSv9sbjel7XezXO4dU1Hi/jEKR+ZJrh61mt11JsqNsgOoj7c9Oy?=
 =?us-ascii?Q?c20ytc33bUDPhMEPkA5HyhRS59Ro7ZkaCXv1RxASwF/+HFEN/QW3hS4Ai29w?=
 =?us-ascii?Q?vP6YQcgVCtuQfW3xCt7735Hu9K02KOt3WSYV9EbOME9SgKR+3oB0nlyTA06x?=
 =?us-ascii?Q?uzbVPkUQkYnqe98g2bgQAABDRlQJne2YrYeShwCvxbNLO4PDVDuNw+VmZTTy?=
 =?us-ascii?Q?ncZEaMb19w=3D=3D?=
X-Exchange-RoutingPolicyChecked: vRFBt8xV7cQyV2zfCyc6L3dWsCXsxlqDQCu+1ZyhE1y/ePpKN18SHZ7rJZ1sSgpJiEazx9fVYaqp+Cu9HnHyn0fS3Wk2UHJ4OMBj3GRG41B9Y8Mn0nYqhoGLQP0224n08vN0IvL+SIogrbuj419kTukowZklGDqQBvjUDs5/A8OqmYHMNLLrIXjJYbGeUSj5cEd9dvvv1mIlCOwOVqLHbufV4V8NqePVlpJqDx0mazlxiwZ9aXN7rGXGFv1YDRBz5t//MKWUMsIcA7TKuXzyXFymfJuQrK/wFvL5HSVb4fUSlWVVsY5DAFTlUjUnwfO3mUaWQTo7DoxJ/GkBQY++Nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2df713-3133-47cf-faba-08df2cb83466
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 01:36:17.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqfrlgZ4rJu8I9XVAK8Q8b1bXQGiucSitbQ20m/E6EkUIw1sMgE2BtKDPc+lDDjSnQNOukvpYIThgdWyCd9esA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
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

On Fri, Oct 16, 2026 at 01:43:02PM -0700, Belgaumkar, Vinay wrote:
> 
> On 10/16/2026 11:49 AM, Matthew Brost wrote:
> > On Thu, Oct 15, 2026 at 09:54:55AM -0700, Vinay Belgaumkar wrote:
> > > KMD creates this buffer for use by GuC, it is also responsible for zeroing
> > > it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> > > so we cannot trust its contents after a suspend cycle. This commit adds
> > > xe_gt_resume_early() function for handling this and the C6 disable
> > > during resume.
> > > 
> > Fixes?
> There is currently no user for the g2g buffer, so I didn't add any fixes
> tag.

+1, right approach.

> > 
> > Also I have question here: Does this mean after d3cold memory does not
> > init to zero? This was an open question I had which merging
> > clear-of-free as I didn't know upon d3cold exit if buddy blocks in
> > cleared list would still be cleared? Any insight here would be helpful
> > as I think Tejas is picking up the clear-on-free work and this would be
> > good input to give him.
> 
> I don't think we can assume memory will be cleared as part of D3cold resume.
> Power is cut/restored to VRAM during suspend/resume, but there is no
> guarantee of bits getting cleared, I believe.
> 

I guess the question is more of memory was clear and power cut/restored
scrambles bits. I think the answer is yes, based on this patch.

Matt

> Thanks,
> 
> Vinay.
> 
> > 
> > Matt
> > 
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt.h |  1 +
> > >   drivers/gpu/drm/xe/xe_pm.c |  4 ++--
> > >   3 files changed, 21 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 775c826b68b4..02f5d48b1a65 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -1069,6 +1069,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> > >   	return ret;
> > >   }
> > > +/**
> > > + * xe_gt_resume_early() - Early init for GT resume
> > > + * @gt: the GT object
> > > + *
> > > + * Handles GT related init before GT restart after a suspend cycle.
> > > + */
> > > +void xe_gt_resume_early(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct xe_guc *guc = &gt->uc.guc;
> > > +
> > > +	xe_gt_idle_disable_c6(gt);
> > > +
> > > +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> > > +	if (guc->g2g.bo && guc->g2g.owned)
> > > +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
> > > +}
> > > +
> > >   int xe_gt_resume(struct xe_gt *gt)
> > >   {
> > >   	int err;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 92d934d50244..9b69f36ebc7a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> > >   void xe_gt_suspend_prepare(struct xe_gt *gt);
> > >   int xe_gt_suspend(struct xe_gt *gt);
> > >   void xe_gt_shutdown(struct xe_gt *gt);
> > > +void xe_gt_resume_early(struct xe_gt *gt);
> > >   int xe_gt_resume(struct xe_gt *gt);
> > >   void xe_gt_reset_async(struct xe_gt *gt);
> > >   int xe_gt_runtime_resume(struct xe_gt *gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 1f5097875bcd..89d64aa6577d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
> > >   		return err;
> > >   	for_each_gt(gt, xe, id)
> > > -		xe_gt_idle_disable_c6(gt);
> > > +		xe_gt_resume_early(gt);
> > >   	xe_display_pm_resume_early(xe);
> > > @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >   			goto out;
> > >   		for_each_gt(gt, xe, id)
> > > -			xe_gt_idle_disable_c6(gt);
> > > +			xe_gt_resume_early(gt);
> > >   		xe_display_pm_resume_early(xe);
> > > -- 
> > > 2.53.0
> > > 
