Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850DCEFC21
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E310E20B;
	Tue,  8 Oct 2024 16:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMGG2F1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F810E20B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728404122; x=1759940122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kmu2TrnHWeVMX2RhmszUrkMdWQSW6xvkJU/S80zttMs=;
 b=SMGG2F1hXw/4PIPCoXx8jE6Pec/fi7CaSnc5flLdsRzospYaG0BRxE0N
 n6WH8n59ekrd5ze9q1JzJ2X/FkyKXjN6bM+TOmeaOMksjLdgm8/fMWEek
 nyvCgY7YbPOhU61/vrxA1UkQ3PORpoLkPOdkraPvcoHGdXjl/pown2Qlx
 vQw5dq4yblw8ErDUsPlQk8zHYS/rqabIygoiaE8VblHDkGa4Mq1+Eyx+z
 ZBSsCRBfz/HYlkbAtXdyP8OkzRZgY8PPohlQdL6jcs26K9tb/WiGuqhID
 aN9wJaIkhvDItVPNfdbhNml6dCqvRFx72tNA6wACyZPPSowKLnhgYN4R6 Q==;
X-CSE-ConnectionGUID: XxRV6ub2Q5+tCvqfATlhPQ==
X-CSE-MsgGUID: EjBQtU+ZSZycnt9km10b/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45088883"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="45088883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:15:19 -0700
X-CSE-ConnectionGUID: 2fwE5ViVQtKQLfPWo0+o3A==
X-CSE-MsgGUID: nS4qi8NLQmKuDuTjzGF3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80677197"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:15:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:15:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:15:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7UqIlidolWRn/FjaeYvNhgiyXT+sstuJI6fksxnpPf2aM9KSp2HAO0Mhwf0gekRwPZqQGG2SD+2Hn2BpFPVWI8Igr5yErKEu2WdWaxAw5MvPTC8wDo9uPJeI6GHxqTKkwrw/WDXzu85KQwUvdpL2zHkNh4jfGf/mRV0GZV1hckk90lpaIqbhvnE15S2wZhPac40jkY5sJC3rgv8ou2Kxh3hCD2Lb+N9RfZw6ZhhNEuPB7w0mstAYEF4i6JDYKlWCBezyqODL1mP8dabAiJfApTn+6QMJkbrCadBTfRbaFgMltX1VBV2h23uPjgkVTA5mvYzPsg/agbKItGAgRLSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbOtu8CJyjmnBbd1JGx3N3oWmBqBUN/26RzZQ6DyHCg=;
 b=mlMKlQH2yvfdbPvJ6CZH7hziXF0DwJaF8iipsfc2pBoeg/82LteDWFGghfFJqiewpY657gNMKFKWPT7g7XFLbjprUg9qWk0183Vc4+L88vCAzKoGQtI2MuGJ4fujQd/k3wb/0phFc/o9Xvcgh7LmupMKj395RJxH5g8WpcTsb2cTla5OThA9YXNwUMQ4cp2i5mn45v6ZFRuWjpSiiyB1Qu4Pj6LfEERa1ngCM53805kDVyspHi2XTYOBy34XCWaWBc67hlSZiTJuBQt5KfGyWTdSJtFZ2AspuxNn3t66tJdjIVzRIQiL+zjn9JbqKWYd/3q3E/aYd1lGqBAtz0rFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Tue, 8 Oct 2024 16:15:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:15:15 +0000
Date: Tue, 8 Oct 2024 09:15:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
Message-ID: <20241008161512.GG4891@mdroper-desk1.amr.corp.intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-3-matthew.s.atwood@intel.com>
 <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5134becf-149d-446b-9ec0-08dce7b46503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvSoMm9LIT2GltKwUseTxiRwCobGkIMwFxWKu7+YMh4DA0yat30Mg/C9vqHg?=
 =?us-ascii?Q?IP7+WOOSAJL78iSk2uze5gAQV3YKOjNyMZ+2hM0W5VEvQASbTf5D+sCEwGRs?=
 =?us-ascii?Q?AOuyl9VsdkOx+rkIz9VdLbBl92oOUt6fEMs7VMvyLqCC6e7Q6pOatn3dJpKb?=
 =?us-ascii?Q?3UhagZfMDA/NZ+IALNZlT1CL1031bDagHsm3P7QHmz1rWVp2OgOwPK2ORZmW?=
 =?us-ascii?Q?zuZPc18jROb8TsjV3ivYRxaC4/lDDdNev8vwBgLR7yAwc2y0/oYevAAIlRkK?=
 =?us-ascii?Q?SXpexGjn3+Ty5AzqLY0dCEDmx6BVH7jZKaud/9b5UOUwnPEIBYO+S8TUeAdX?=
 =?us-ascii?Q?jqOoBAqylVpjfmfwUbYNPlaDtCUmnI3aF+Ci7AbPisEPHs6FJN8x6V+Zr/tr?=
 =?us-ascii?Q?XWP0c/ZJYZpDfpbT0kEOezcJzojumkGBgc4HCXq7djYB7Ycsg4tcnlTZKuZb?=
 =?us-ascii?Q?ybsvjgEsGOxxhB+iUIewtUIgFgKjzaQQfShapTEU4YagCkmMu8hKc7ciqP2+?=
 =?us-ascii?Q?+mG9rIL2vf0LHCKDsLCioHGkcY05uNSpS/Ssn1zpi5dK+P5GN88//WlN/c/C?=
 =?us-ascii?Q?fmU/voRraHwHwki7KLi+UsEfw4IcIIp52vE6Qvy1gq5JOaHMRXaH3wbUzmAA?=
 =?us-ascii?Q?fhLjR88C0/otu9wcGZqwxHByeJUpjEuir98tQgxuDfuaFs034fxeOslZyoTa?=
 =?us-ascii?Q?oplRR+NApkkApzuxsaxZ5Buh0BUFzCfJQK0r17M65bnEQXcxxLCBtnnt6gif?=
 =?us-ascii?Q?nQ5gZK2bgaWhvJWc8Oh0zXejFzir+MSF7JrJABJ0FAYWuvpc9aiGh48Qa9PO?=
 =?us-ascii?Q?r3fUR6InsL46piYu6UeCYb37jaB9qoItF1J0fEHdTCjIpuP+NqCFdg0FQyU9?=
 =?us-ascii?Q?8jIDXCtYAqbEAaJasaCXMg8EHIJbpgxsq1P8ST8DMz5DrkK/K9UT/i3D3YI/?=
 =?us-ascii?Q?YjHGbwwd/OkXDiyLdDGgTy0bT4rcfgfmVwg4LlX/Cvd4lonS3kiFvQ2v7LPB?=
 =?us-ascii?Q?AzxeNgCaSzNVaiYwDQ44iCmHi6p/SFVLkFxOkvo1vweCdizn3GGTSHnf9yPr?=
 =?us-ascii?Q?jNQ4h5ACkwIGutgz/gK/erRtFeVDnLcJ39OgJ91vMw6ybS3ZS2SWV03jJITc?=
 =?us-ascii?Q?ldEhbXAHywYEugKtnbcihbiQCMjVVQxA06SiNZkfYuKm+Ag0m97dHqZCF4Hd?=
 =?us-ascii?Q?n7m4a3Y3wqFXtlf6ZY+5wq3eXBRNVlh1dhrnOsCXl7K5U2+u3LcTv57vkC8u?=
 =?us-ascii?Q?lv85FHLKSJkCVIwvT+64h3kPovEfiwP6Y+xJkQajqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wvl/nlFJH+Z6xS5EJkwA5iI+W6YJedVEwXyyP2qhG67rO36oDBdW81xUq+RC?=
 =?us-ascii?Q?DvVYJgDdiJddq/e/ypbfa8Smt3xPfrG+3ZtYTGrGqKwFkf67sQvXXIr0XM46?=
 =?us-ascii?Q?zBo7+nlsIZ59Wzp1nQn/oqZVnRrJqgjtWCw3n1k9nLVNweXaIyWeKOVWpyVJ?=
 =?us-ascii?Q?Jcd41me3RR+Inc4m0T/QRfQdAhqk/Yq/2ma970wYJOXOGp00bgkLQDOvALhV?=
 =?us-ascii?Q?GOHClKn/c4GY2tLx+qOfMqDQu148hLVhnSCBB/NRRTDIai8itOh1BzxlNVwY?=
 =?us-ascii?Q?NthXTTYCU5W9c6fcM4EuY7FVQLW1G75LNYtIy9GAmQiBYYlFSdmzSEnTyopZ?=
 =?us-ascii?Q?8bsE++YXWLnjcjO5aUIEYmr37L1WeqCgStDhIqjXaeQb5FuKvXs+9H9a2bWK?=
 =?us-ascii?Q?Wjnx9UcnrsaLi3DSepHDLThuTqNX3VBR+vRxy8ImF/+2gAEorhfy16Qu+CJl?=
 =?us-ascii?Q?JbT1SSS0oya/kKC+U+j1Q6Ixi0jZdAm9uZn1nYzYvAakg/9b/bt+HU1l7kXY?=
 =?us-ascii?Q?ktUB1tQmEIMByueyPJrn6UgsTenLHVHB0CrI3eL6ibKIUMYh6x8NQZO0EJIi?=
 =?us-ascii?Q?vQVLo5ilXr2DFwo31wVwe541WScca8PZgCEpihXfiETg8xhOcNOh1QFvwQPM?=
 =?us-ascii?Q?gDnV6y2sbVwyS6fSduQ1EYdly8IUnXrJFWS2ahhSk4xm6S47WQ5ozjqdK98J?=
 =?us-ascii?Q?372ni38pVGb+vPKPWRF+HJRvi8BSoDrIiGxteEikHVEKRIwFNHudNDAHHFqF?=
 =?us-ascii?Q?6e0tqZyTwZndpG6WUwuV7h6fJp0PYhbJQ4Jnt+o1duZ9cTal/tXBT4UDiAGR?=
 =?us-ascii?Q?eAdQT12XxuDRGLBbgpwDfFQkGlKQt50Ao4F8qV+D6H7NbsBvhMYKyGCWpL7n?=
 =?us-ascii?Q?WMRJfoHntuc7K6kSB6GYD82w2Sv+mwuFw4gVtkXTcir0zU7u1m2nLwLHxIh+?=
 =?us-ascii?Q?QvYiiguCR6CJvTzT55m73GH9t1hHWSel/PsbHZeVmRdKS5xGqOvVkMCkYHaf?=
 =?us-ascii?Q?j8pShUF+edVrwIMau8mzhgIfRlZteejHNB17dVKDVzTMGvt8ZImHcZlpmkS0?=
 =?us-ascii?Q?yKypqIggMpwV+x1uugoeGOJdbrctcdpTfoxE//UGKX8Bi030ku33BFe75Zm9?=
 =?us-ascii?Q?h5MJwvPPqIVukqYQ3tcUrlO/khulsxrS/LaXespKd3vsz0ZOjaeI2FUjKkiD?=
 =?us-ascii?Q?iR8zONt05jkVyQhFURDkJKfhqrKI9cx10zCSHiNc7P5Fjluy3a9chnFo8aRr?=
 =?us-ascii?Q?xn3sC08Ixe2Cnu+827UPioUK0KCvVLMnH8wTlO6Sop6PWAs/jHB895SIHhlY?=
 =?us-ascii?Q?YoveGR+JC7bOiFaINhtngNyeGDN5ZWNBTVcEF5Zn1V75TSj2AiYoNMzQ5GTX?=
 =?us-ascii?Q?dqKZMTv7pQlJ2V9D598JND/FQe8hKbYuHtjw2PtDm/yfCQkRpjZ81tUPqXeA?=
 =?us-ascii?Q?PZ3xcLr4sjiw7Wdr/IK+6b7cJwX3QozPI95RhwWU1ReiOw9Q2Ryl/mUP0ssV?=
 =?us-ascii?Q?gLkArLa/MPQLR2oZwraFRFzOpNDCuOl0zaCwIN7+ynDNVQHbYylw+Ph71YpI?=
 =?us-ascii?Q?ojnC38V1311/U58whA+jS6QLkCC9svLuTviG6UKh+S0AqkrbmRYsGi0IQFij?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5134becf-149d-446b-9ec0-08dce7b46503
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:15:15.5856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: junAIhRr8eCPqkN3kCq7FVIG9UJFIGWn/YgWY6Rty1t0mEA+3d34iIaL6JE959iaQ4eF3ZsnBtZzE7xthiRZDMM1JJQj1PmAlqYqWRUvUuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

On Tue, Oct 08, 2024 at 07:53:00AM +0530, Chauhan, Shekhar wrote:
> 
> On 10/8/2024 7:05, Matt Atwood wrote:
> > From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > 
> > Define a common set of Xe3 feature flags and definitions that will be
> > used for all platforms in this family.
> > 
> > The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
> > platform.
> > 
> > Following B-spec details inherited from Xe2 feature flag definition
> > commit.
> > 
> > v2: reuse graphics_xe2 defintion
> The patch itself LGTM, but since we're re-using Xe3_LPM with media_xe2, I
> believe we can have a v3: Reuse media_xe2 definition. Also, there's a typo

That wasn't a v3 change; this patch has been using media_xe2 since its
original version.

> in the above graphics_xe2 'definition'.
> Both of these are minor things which can be addressed while applying, so,
> with that,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I think you copy-pasted my r-b here by accident?


Matt

> 
> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> > 
> > Bspec: 58695
> >   - dma_mask_size remains 46   (not documented in bspec)
> >   - supports_usm=1             (Bspec 59651)
> >   - has_flatccs=1              (Bspec 58797)
> >   - has_4tile=1                (Bspec 58788)
> >   - has_asid=1                 (Bspec 59654, 59265, 60288)
> >   - has_range_tlb_invalidate=1 (Bspec 71126)
> >   - five-level page table      (Bspec 59505)
> >   - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
> >   - platform engine mask       (Bspec 60149)
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 7ffee06fab13..2139edba9062 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
> >   };
> >   static const struct xe_media_desc media_xe2 = {
> > -	.name = "Xe2_LPM / Xe2_HPM",
> > +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
> >   	.hw_engine_mask =
> >   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> >   		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> > @@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
> >   	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
> >   	{ 2001, &graphics_xe2 },
> >   	{ 2004, &graphics_xe2 },
> > +	{ 3000, &graphics_xe2 },
> > +	{ 3001, &graphics_xe2 },
> >   };
> >   /* Map of GMD_ID values to media IP */
> > @@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
> >   	{ 1300, &media_xelpmp },
> >   	{ 1301, &media_xe2 },
> >   	{ 2000, &media_xe2 },
> > +	{ 3000, &media_xe2 },
> >   };
> >   #define INTEL_VGA_DEVICE(id, info) {			\
> 
> -- 
> -shekhar
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
