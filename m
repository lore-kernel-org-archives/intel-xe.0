Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4926C87FD3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 00:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999CF10E320;
	Thu,  7 Aug 2025 00:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlKTk7KD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008A10E320
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 00:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754525580; x=1786061580;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+xVV1hSqYEMEOyz2JO4rgw2GHy5oDOs8MFfaMFWNxsw=;
 b=jlKTk7KDX5uN30k3Es1KLSn/dg1VzL//dlZ5YeahV4bQxLJVz3HdmUBs
 +y9aG4I5V7FKDMTAAySF4dy/UKkC5FlwUwVh+1yvprNWsGtqcbApHWylA
 JuiTQlh5sz4xSlX5Ssw+S7rosJYgbIg9li64YwZTP+wVgyuOEKpNvoI3N
 kIH8kaPSkQcu5W9+c8StptFzU3vgNCG8Sl1/AZrjgdnecV6HHsap3T6Tg
 caqSebHFLusdXusw60U1HqMatxQ592MOrLIvlI+Z/IwPRnt1QO5nKq86O
 8Ekk2xhgqOVwx6vo2sA6a4YYFwDKz0ZYIhWSDDrw31tmuruIlOV6qWL4i Q==;
X-CSE-ConnectionGUID: 4i/0jZhBREqjw1L19YnwPw==
X-CSE-MsgGUID: Yuet5LOIRHyZOinr+FiUyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56748555"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56748555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 17:13:00 -0700
X-CSE-ConnectionGUID: zWB018puThq2hMi7umDZGw==
X-CSE-MsgGUID: 3PCdNxpnRlCU0vWGmArZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="202070498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 17:13:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 17:12:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 17:12:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 17:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSXFDJM0EygoWxGBEhVKBIbfC9coIPFqIZ6lRk/G+8KdfM4PH3kxEs2xnlYtNtMo1wemb2XkyC0pZGGfGFHbaFFL4+yAVJHezhCX53CLU6VrXR5Q9uycsgRBvlejF1MFaUm1wnD7HBmnMguJZteY5lhjj8LtQNRLpzVRhsQ6cjVi+/uXNsmJtVn8mnJFjmNUe3gu8eyjxSD7Tz45P9UBjRsk2YYN3E+kFK9+5voWALr8oiBwIvPsZdbEoAABfg1Ac6b0w4UMzaUYVJ8N49i5pSrkN8wicXeiZBZDnkZ1a9kt6ELM/lXNcI+7hOrjC0kJtlukgy5AzYZBc6QxTWLTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKvqB5EBSEbijH09cYLW4OIpzNOkqvY6mlQ7tHIb3WA=;
 b=CNdlVkm1m6SWeyPVC/Bj/mfNBe6inwbUg3J6FGih5Qe/wkMo82VZujjrBo72EW41+n+Uu8n8NwFpOO+IZxwMvspB6PQghOezf3FPIMUJMm0cwJUV1iR+ekdDLiS8f9kcdK/9jaEdF54pWISQLCbMOmLYAMWxdfYdCjkuOKtJyOjrQyq7dkRJcvMvz370yRXhNz1KGpvqkQBElAweutmgxGxICNs+LwPIHq6bsEHyHxFP0nwNYv28epZDwAe3ZxDq46cu5CKktaRRWAM/jn1ef9whzCibayYOssZdCLbpaPo8yvewJXAQc4ey+ISUhn3LqPeunJkb7wk4QHZTAQtYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 00:12:56 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 00:12:56 +0000
Date: Wed, 6 Aug 2025 17:12:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Message-ID: <aJPvhZikeKEbwOth@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-4-matthew.brost@intel.com>
 <ab3197ac98e3a60065f846fb0bf996092f861e64.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab3197ac98e3a60065f846fb0bf996092f861e64.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:303:8c::17) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: c28287bd-45a4-45ec-8a48-08ddd54728d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dlifs4ydEUn3hWEEc6vKEjevDoQHSkasEk1WVSkIZnFP54iANZ8OTkHnXg?=
 =?iso-8859-1?Q?PpjhJWjasyEyFF/jkfV39kIRJ9hdsw0T0EU8jJbc1t0fOn8qLuISy/jjos?=
 =?iso-8859-1?Q?nWTh9NVw+Mg05LouAbtXLHIz0z1gdxm2tiDoPW1m+8Zk4zrnTkrZN7uyBt?=
 =?iso-8859-1?Q?hzVC+OJHGx1mdZ2lnF4C1s9ygQg0AtW1+j7XPSDtPrVEHCLnM4cyhZ2HIH?=
 =?iso-8859-1?Q?w3y4Ni5SkaN5JQQtas08UeGHInBUHda3Z2AWZ9YjPIWpKDB3IVpU9IdBB7?=
 =?iso-8859-1?Q?E+jUGEH1z7L2UCYJi5B0pzXVZWPzMIyD2Xyi5SUBbGyNfvKGPUnqnEKNZZ?=
 =?iso-8859-1?Q?TVd787J+XUfmN/3xneEDqa1lMVUG5vCQvyACuFpiZQ6iTXY9mgm23k2hyu?=
 =?iso-8859-1?Q?Sxj808oTSruf/EvbMqHZdRSj9V4kfr60aiEftpUMxe0mvKeOBY6K4pDq5w?=
 =?iso-8859-1?Q?R1VDMKfd6g6GCUZX2oCdOgILXWaVvHC4TDXzf0tNVZcdssrJv8atCT76N2?=
 =?iso-8859-1?Q?scnU2gxFtaOzMgSkki2Gzso434ei3ydz9ZH9TY8m2Dl63rBzapuptzv0mj?=
 =?iso-8859-1?Q?9JgqW7aMZb5sOFPk+uspfXYNT6Q/rtgGm2WX7COQ0boh8uX3nZ9jUzj1fB?=
 =?iso-8859-1?Q?h7gw9VDrTgAXN2f4I/iI5q39hK6ImALcf9LNMVTm7OrvdazJQaqxnOtGRN?=
 =?iso-8859-1?Q?ZaA3c90yj/q1Aoh2qFKAb3rwFMrFpSVinU6JdJyjfTBB5z4Rd7+cQKnCTi?=
 =?iso-8859-1?Q?n9raD5npAko8r+uOkUn6foroyAt3ZcM2qL0XJWteT16/Y9dCmgOqBxX4Vi?=
 =?iso-8859-1?Q?f8AsoAUYG9xGkr/quIKKyVH04msusn1OsJ+zMktx+ET1jeBiXytIVTWz41?=
 =?iso-8859-1?Q?uWvC21TbOV9R9IbetR7DI7qhZz7eHGLbikiWU2fdx5jF+VQdh1zgBavZWu?=
 =?iso-8859-1?Q?JjU7UWwxYeivC8DwWO+jhngG1SElIMHFHSLpNJfzJekJaNTyVepx6gjryD?=
 =?iso-8859-1?Q?kuvwes+4OKfduCJ50FBf/iqc4HwzjZtz6gYYOyPLpCMp7S0Mvw66HO2rIY?=
 =?iso-8859-1?Q?bdLFpLN3iKK+QlRcWC51w/1A9pPRLZHYEmu8UwCctbb+hlLsqodbh1A5xr?=
 =?iso-8859-1?Q?edxROldTS1I3zToQAOiCAomL7WkCevVbjpdCngykN5bkt+QWCFdxnWzs1U?=
 =?iso-8859-1?Q?lVCWSxkFQOBOzlto+QhMWxgST0TtXopFJRUIgq3Vl499/3KaRaWYNXlkvQ?=
 =?iso-8859-1?Q?bovrYZe/Ormiqj+4cCbCeT0V/bWPBYC8fPny2NiD8DG9o8FkoYtBjj8863?=
 =?iso-8859-1?Q?Ai8flW+BRlmP/cxMq9soxOGsRUseJBC41KLiwSrgskJm3elR2RI18zarud?=
 =?iso-8859-1?Q?5SR9tw0TTrsAGYweA7/1iXArNCij/IH0ENKQfYuJU8a44/OrFldoY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QBXFIA3Ym08emeiqgxvJN7wdwaUbM1MW+DzJ0m9swN61jEyGiyjAb787ut?=
 =?iso-8859-1?Q?jN7OT+pXsBNxmGHJn39YOiyLVTPoGryia6iFRL7p+RspEbkmk9+L45xhdm?=
 =?iso-8859-1?Q?WDnuPCaotVbi5E65QDpbDj+nDtJ+810kxrJkniRPoIpoBrxWbpm/fL53CQ?=
 =?iso-8859-1?Q?568ysLudvk9rpQd2MWIRfDD5CEzSIZwTHV4EJk+AGE4hT/is3CeA9x6S5t?=
 =?iso-8859-1?Q?zggWkDJWL3wzqJ6yBdtx+U95InPqh1QpVZURmcy7bXcpqR13TWUNCtNaNK?=
 =?iso-8859-1?Q?quEix2RM1iGUap6KONqhxy3eYwDLm3AMWX2aOh5StYHG3Mg6WeHltus3Jr?=
 =?iso-8859-1?Q?GJCy3AtGh5/1YvhMA1PYx2Bc3iYoWGCI0tnS3t2Hzij8ScxhXEke3N+guv?=
 =?iso-8859-1?Q?GXeB5UoV33GH6YNJQflEdDneFvhkXE6UZkYOVuOYqD6F/tYHx/7sp+oLU+?=
 =?iso-8859-1?Q?9dpU8e/CLM34wQTeZioU7I/JqnBY94m3PQLFT3HctqsACIxHmeWbtzIYn0?=
 =?iso-8859-1?Q?4pYcVo+rGXDfO18kkrEPFna4Vv5SmHUC/x5rkZi78vPOJxmK5s0xetP1D6?=
 =?iso-8859-1?Q?pZ5htqbWXCMtK0OqxRgvjRs39625bLPV4C6KMXTtiPqwcK7sg0RjYKnTQK?=
 =?iso-8859-1?Q?wb1tJGD4Nses6HNhXm01dPZ2ad39B7yzi7MO3RG9Ed10bAuzcmfo4/i8x1?=
 =?iso-8859-1?Q?Al2Ui2/7kpVJXIHmpdD4DcAzq1BY8ojovEhJG5iDgFUiclVVcOVr21EdKU?=
 =?iso-8859-1?Q?Vzr4gCG7196NVmyO5j+cOQFGqd3tvZ45/iwe8tzJGBbdaOqpMnK8MiWBdN?=
 =?iso-8859-1?Q?OaBPeVJUgG1bDWky57dn6qATD2+0jPj8ZSt6EiKQSb1ZR7IHdgimeNzRw5?=
 =?iso-8859-1?Q?zzwesPMkUtXUGEEnBAjjlcmkc7D8eBZXUWr2Yn0JLXW+lvkuGVGeg8unUL?=
 =?iso-8859-1?Q?dA67iE2aGkVv3X29CdQLj3uLz+bSWbJfPDZSoTBR/sha3Br/gpSgsmOIYy?=
 =?iso-8859-1?Q?zpgGr07Cb2iTOVzBxCIhbBh2HImz76Hi4YXe7U0HQUxFhdAkg7kQD+sPH9?=
 =?iso-8859-1?Q?tZujtyYhAbmJ+fdzm86di9TI4+V/vBcmhxyeHKS1jp+rllnEMpx2FcgEqU?=
 =?iso-8859-1?Q?bqWoIlmehjor6Cbwm7Ka+4mqbF8WwuAWAMqGLPFH+FpPoz1GkkW61nG6VI?=
 =?iso-8859-1?Q?Gt2jyHsBclR+49Qd/cEtcKsuLaHEWB2AKJ3UZBRsqtUAs0N/gkBIl3piZS?=
 =?iso-8859-1?Q?AFKd4akFwg+U15JprzqnNxAWLLrexWyE3lkLP7c0ppaKciNLgCR3N7EX4O?=
 =?iso-8859-1?Q?SrwPzw9qiIm52OkMy9qOdZ96TN4I9VjWCW6BR0tT6tbyA8V+XAXdMY+BQ9?=
 =?iso-8859-1?Q?wcjeDo4OqxBeIyV1I4+nZ2FIwxodelyRLKvZkkMjpbxa8z7KtmwUFPEggG?=
 =?iso-8859-1?Q?P2YA0hF+Bnt/Pyyqldl47H9RcO29LPw3aWu0+IqTrv9otAclzSesTVEWfp?=
 =?iso-8859-1?Q?6oG70NPtarEbRyQr5+OoX4Zp0W2v2HslTGgB0UtNPl0rXG9A77h5GKj+p0?=
 =?iso-8859-1?Q?o7SCIlAvR0iVchemkuTO8kpXujxbDP14Ub3ln0eU5wapxH5ROuMvjaV1+D?=
 =?iso-8859-1?Q?fEHC7zGEq/XmfXXkk1EWscq9aGI1KVEiqyQHlhefImJUUtMf/j/Bs++Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c28287bd-45a4-45ec-8a48-08ddd54728d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 00:12:56.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWj4R4cCnGD3xtW5IaomqSO4/tpLm0eBv6nWdo6otcK2di5+w5eoVxdseeSQ9Xj5QD3c4Q8ztNlFd/fgu+d39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

On Wed, Aug 06, 2025 at 05:16:26PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Squash any pending faults on the GT being reset by setting the GT
> > field
> > in struct xe_pagefault to NULL.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c        |  2 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c | 23 ++++++++++++++++++++++-
> >  2 files changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 390394bbaadc..5aa03f89a062 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -50,6 +50,7 @@
> >  #include "xe_map.h"
> >  #include "xe_migrate.h"
> >  #include "xe_mmio.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pm.h"
> >  #include "xe_mocs.h"
> > @@ -846,6 +847,7 @@ static int gt_reset(struct xe_gt *gt)
> >  
> >         xe_uc_gucrc_disable(&gt->uc);
> >         xe_uc_stop_prepare(&gt->uc);
> > +       xe_pagefault_reset(gt_to_xe(gt), gt);
> 
> Can we just pass the GT in here and then extrapolate xe from there? I
> realize you're thinking of dropping the GT piece, but maybe we can
> change the parameters around at that time. Just feels weird passing
> these both in at this point.
> 

I think the style is generally layer accepts the main argument first
exported function. ofc we don't actually do that everywhere in Xe
though. Here the main argument for the layer 'xe'.

Can drop if you prefer, I don't really have strong opinion. 

> >         xe_gt_pagefault_reset(gt);
> >  
> >         xe_uc_stop(&gt->uc);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 14304c41eb23..aef389e51612 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -122,6 +122,24 @@ int xe_pagefault_init(struct xe_device *xe)
> >         return err;
> >  }
> >  
> > +static void xe_pagefault_queue_reset(struct xe_device *xe, struct
> > xe_gt *gt,
> > +                                    struct xe_pagefault_queue
> > *pf_queue)
> > +{
> > +       u32 i;
> > +
> > +       /* Squash all pending faults on the GT */
> > +
> > +       spin_lock_irq(&pf_queue->lock);
> > +       for (i = pf_queue->tail; i != pf_queue->head;
> > +            i = (i + xe_pagefault_entry_size()) % pf_queue->size) {
> 
> Should we add a check in here that pf_queue->head is some multiple of
> xe_pagefault_entry_size and pf_queue->size is aligned to
> xe_pagefault_entry_size()?
> 

We can add some asserts, still would get an infinite loop but at least
CI we catch a bug quickly we introduced somewhere.

> > +               struct xe_pagefault *pf = pf_queue->data + i;
> > +
> > +               if (pf->gt == gt)
> > +                       pf->gt = NULL;
> 
> Not sure I fully get the intent here... so we loop back around from
> TAIL to HEAD and clear all of the GTs in pf_queue->data for each one?
> Is the expectation that each entry in the pf_queue has the same GT or
> is NULL? And then setting to NULL is a way we can abstract out the GT?
> 

This patch [1] moves the page faults queue from the GT to the device as
having a thread pool per GT makes little sense - want our thread pool to
be per device and enough threads to hit CPU<->GPU peak bus bandwidth in
what we'd expect to be common prefetch / page faults cases (e.g., 2M SVM
migrations).

When the fault queues were per GT, reset were easy, just reset all the
queues on the GT but now sense they are shared on the device and
individual GTs can reset, we squash all faults on the GT by setting the
GT to NULL. This patch [2] ignores any fault with a NULL GT in the
function xe_pagefault_queue_work.

Matt

[1] https://patchwork.freedesktop.org/patch/667318/?series=152565&rev=1
[2] https://patchwork.freedesktop.org/patch/667323/?series=152565&rev=1

> Still getting through the series, so appologize if this is also
> answered later in the series...
> 
> Thanks,
> Stuart
> 
> > +       }
> > +       spin_unlock_irq(&pf_queue->lock);
> > +}
> > +
> >  /**
> >   * xe_pagefault_reset() - Page fault reset for a GT
> >   * @xe: xe device instance
> > @@ -132,7 +150,10 @@ int xe_pagefault_init(struct xe_device *xe)
> >   */
> >  void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> >  {
> > -       /* TODO - implement */
> > +       int i;
> > +
> > +       for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
> > +               xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue +
> > i);
> >  }
> >  
> >  /**
> 
