Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B0FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 16:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4A210F6BD;
	Fri, 19 Apr 2024 16:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDZEku3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5260A10F755
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713542442; x=1745078442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=euxKqQvFs1QMhrB4T2LbGXnRtK0vxC4KI/KHxzMdnCg=;
 b=hDZEku3XwLO2+G4K6BBtqE09KJOB/Zmv4VnixuOAglZt20n8ki1EXlNx
 e+BFO05O655lco+szOb3VhHLs9m0+PqI8FBaZbOofGrkXnaCiu40CDrYP
 SWb4R93/iayq23vjdLSeA4QHGaDhtR5W8vscK1dTlCsiwxr3qkzMDEDIA
 pwtSUM6KfmSrsT4zAd4wZi+tK0Iu6KZMTOJn6Mf/a8X6rmhCpMNw2OBIm
 u8uhdGH1LKL+KhZs8tv39Y+Q/d6znwGTC0hI0S1i0woDUSrJlEQHDvLQ9
 S6eXW5lh9PYFT3xtPIKY6PTqV+jLeeBbNI9slRR8XdJmNsqiQA5RVPeKL g==;
X-CSE-ConnectionGUID: RG7Yo+jhTXWDfq0UJJ1/vg==
X-CSE-MsgGUID: RTCAZFrjQE+qJhMA7LR94g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20571944"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20571944"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:00:41 -0700
X-CSE-ConnectionGUID: dx0wGew+SXmVMiyEaQLV2A==
X-CSE-MsgGUID: kvhP2bXZRsyCFY4TWttgbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28152728"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:00:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:00:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:00:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:00:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZJHYhWX7GMoEg8K4K4ZCHfQHUaQgCqIw7reDIuly7yeYr36BUMY8nvdp0fluJ6VFAdK0ssVpVTFzea5egMAeKVuKAdvo6u9mikpLhUFkYUUsFKhvHBFwv8nFzHKtzpB7QtwUpsW7G/jpNX4d6VGLnjn479/lz28UGwoOC8MeIk11vlU+VW8nEoqD61PdZwenno1tNZVFMtX5fRIGLNUeQOCM8LXMkyCvOkXnCH2J9xAOUuQJDNc4ERZTXZOmaYQouWSLIT7/7alSIcqxaBN7gp677lkF4r7lBp4nlbY3wsxxBhnMt+LirWCdd9UkcKacxCqZFhbHdn18Y+2ZRqgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKuDf7LC85aOfJadM3SZAlZdm53qwRHrcr2xxaTsMMI=;
 b=Npsp+M4/axHPvjpuI8gPopEUcazcOFE8UCn7JE1CRcRkw1gqHEXKWf1BXoF59T6CJKkvF7Xzvr9iVV9BcmRjed7/0PYJXRAWPqz6n1QVEp8erVKez8mbFg4eW7qgt/wOna6SUpZkG3UsUwfLmgjyX60d+cF1u5ue74t+3QnyWHzNMwWfSDCEitPyvfWXKo2EOfMu6IlzV4UlrZktafNRrqYvW7AFerl3XvWpwRSzgkl+DWxnuDCsga5vKF9KVTaP+ypruMjOFF37X+Tlb+0Ra+IF/fU+nfTFSL7gbfvbyoo3vQarVLttBnfaiL2q/rSS1p+X7j3TYqzG9ptOVaF+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 16:00:37 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 16:00:37 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 12/13] drm/xe: Add xe_gt_tlb_invalidation_range and
 convert PT layer to use this
Thread-Topic: [PATCH 12/13] drm/xe: Add xe_gt_tlb_invalidation_range and
 convert PT layer to use this
Thread-Index: AQHaiwmo0pnLEWTv9E+187izxJsiIrFvz0OA
Date: Fri, 19 Apr 2024 16:00:37 +0000
Message-ID: <SA1PR11MB69915F47090A4DE598BA5CA4920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-13-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-13-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CO1PR11MB4994:EE_
x-ms-office365-filtering-correlation-id: 9078bea6-60c0-416e-48bc-08dc6089daae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?pRYkViHwPfRepMmdqlhifkOMY+YvZ67lgX6NCRPUydATvsSXALmwh/T+HLYn?=
 =?us-ascii?Q?AGhIEbx0qFq6uhauZTV/6x4+MnUkJAMtPNjstafC6tHv9NCIkO78xlq4Bu63?=
 =?us-ascii?Q?pH+eM8OXnJ5Vih5f5DHBeUjV9yue4niQv1Ctqd3+yEd1kSAwSUoRHdUbmtYo?=
 =?us-ascii?Q?sGTVgD5XyVRp0YKalu94OvGAcR2/HI04XWnrGwgAKHroKm87FJamhWcOvA7r?=
 =?us-ascii?Q?eMjxkGNlO9hxFAnf6uN5hfNYQdNPtfFLJahgfuOwHO8Ah+lodIosM0FlJVJA?=
 =?us-ascii?Q?xQp0AiVi5Vm/KYW5/yKC2mn3u+esXfifblPDUYpfjw0dwy1SA8I/6G4fl8pP?=
 =?us-ascii?Q?N/FUxQjvT6THapfIzgG0JwQHQr/QiRcY0SpNhzE0LUHYM1Tcx9rx7jgt5jw3?=
 =?us-ascii?Q?M2A7prnMVdVWNZDRJPyGnuwaDVq83IyJ+qSVvKcOGole5cblHdI+XGhxXzSb?=
 =?us-ascii?Q?mYloNKXCGuCxxKXaLrtgjD3Ti9Hjvi4LmBpPLsPnqOB2RWZQ9M3GwW63JnA2?=
 =?us-ascii?Q?doNIIpJ0fhS4+aC76hkbMPekbHHOg1gIVc9G96lDaRBdhf4sM2FLY5i+XlLa?=
 =?us-ascii?Q?phV028ZRD6qhDkOtjFT6LCeBXF7kptHZ4bfuoVVLQnEO/rSPYibmS8BISg9n?=
 =?us-ascii?Q?hElKmon2/vi9iWcn8nEzxe+Z24k/9VF00eg1oS2WwsbubPO8eooEskq4EWIc?=
 =?us-ascii?Q?JbjprdHyZZ4TVj25WFsQsehJbjzlpU9nRAzU2ulbnjxZf43P0FdmZ+wIWEgD?=
 =?us-ascii?Q?/yk31I64k66aJNuOQpqqB+YTskEtMfHWsBC1spnpm7pGd1wtWjV1nOOUNtoQ?=
 =?us-ascii?Q?LYrUF5T6uj78PHWEhVO4hqGB0Ykjfn2nKcsEJvbm+A7s4rPJvAVWV6SZx3mi?=
 =?us-ascii?Q?h9siJCTUR2pAOJni1Jefh4PkGSpPAK2guYFECequTQUFFv5sj77YrDQWTD4A?=
 =?us-ascii?Q?UNIYiRSqhHoWv67fUtg0EudzjtG0Ekw9NVt3+5y8M1eC8QEM/lxZpgnRTJXD?=
 =?us-ascii?Q?acyIkQrZbN5PnKjlHr80qooEZr+g5J19eYiXwNCl8q6SrmvF0dGVJ6+IpC1u?=
 =?us-ascii?Q?ut+myUh3d8C3DjY6dA24qMmu0SdALY+9SghdNaQHxJm9EmUfN61/eJq9aIst?=
 =?us-ascii?Q?IBPyQU90q5Nu0NTWY/MGqbfSHqTKmRlEJlrFDmLKUSzfcYpiCSR/CkX626nk?=
 =?us-ascii?Q?l+6eQXfICZvZGKRamzrZYYvTYq03h9uebIO4FrIhj84ePdk3Y1k8Y1XXXdQn?=
 =?us-ascii?Q?rKH8Q06vt+tUfD09L7MgASf4JOPiS/T8bK5JZNCt52cKBceoPuiexD9ARhLO?=
 =?us-ascii?Q?GCmFsNNJWxgFFpdu9f42wJSHBF2pJwPZ35pWux0L1VXrPQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LKtp2hYVzRBIbLf/n0lbhrURJYv6X4ICVg8cNwuVBKDnv6LoVpOpjDgcO/l4?=
 =?us-ascii?Q?TmkM0Z+C9bHgjhyPtoRtAiTLdtkxBuEIBlBqwCChO7PRmXDY2pnfVDMPnqIZ?=
 =?us-ascii?Q?TEKY4twDqzPrPFxLz+RAko34fFTiieLiU0pnpPLF3ZLRPeJoO6GNhudkvPvF?=
 =?us-ascii?Q?TD9DxAlt9LRnAYaWhueqW2KMWcPVsbIXeMwqrxsJ/9yjCbktE2qvA4i5ST8t?=
 =?us-ascii?Q?VFLPEQAunVPNe2yvv8jT8aaGsWrPeeaLRH429q69D72U52/1JxDNpI2tGBsl?=
 =?us-ascii?Q?jWwOtAIgX6Z61PLoMw6jotQYh4m2WycURUnRAsCjjmrMYrOMijLwhYtcbLOS?=
 =?us-ascii?Q?YHANkAnLfYYAFBZpVB0oDuDzDBxq4ni0lzNGx8Dp6Nd/fHYV+91V/PabDANq?=
 =?us-ascii?Q?2/Ylx3AfpBu0+jLoaTVY31INFyeY1bDF6JZ2ExQ5zFupv4N/GbCi2uFA+vfp?=
 =?us-ascii?Q?bFVnKAtO02xq19Kj+T46nE8g7zHpuCsEnTxgPkEmktnZ8NqibXVmfNS6CZ6g?=
 =?us-ascii?Q?jup3VbzArUULmpRbxAo/c/QvuDEvW51lICQT/6G89s12q9270etllcXxU7/6?=
 =?us-ascii?Q?meIuCB+ZpauiculF7eJ/ixf3LprieP6n5o2APkc7D9nAi4Y//6hJp7Up7j+I?=
 =?us-ascii?Q?XuTMw2bantJi6CRkjOw51rt9lV+MTZcBPfQnvglYky+6V2SSDsZCs4k1Hm6E?=
 =?us-ascii?Q?Z6/X9V6h+vjfk8alPNpuZIK5Lt6Nvg56d9HPwCvz9PIvY/Z8B5FjwIN6x9pO?=
 =?us-ascii?Q?fm1IGM/dlmnGVtPFlm2zeKe4cYLWp/mmYfQ0wNGbNS3po5AYfTPLsMU8BWo+?=
 =?us-ascii?Q?f5cjCZCv1O0v7u4PbHTHmj6ypHXZXASBnPvcVFw5OI/AeGA8+mD1E9ognPFP?=
 =?us-ascii?Q?L3c7W3USCObmSrgb0yjCMWMCd0VJi9Z+15C54zmqKkZDYgFh+pmPStwLWniw?=
 =?us-ascii?Q?tUEZrEIF/7F32kdhfKoVdqyDQ1KIYerzGVZ4gaGOEFy/s1QxVSB1LkyImNuS?=
 =?us-ascii?Q?WTSCjlE7sTxHosjaPWIuXrHhU7Y2CRPcZYNHo0yEtey9mR0HQi4PXw2zXMlu?=
 =?us-ascii?Q?N9WCQeaQKf31QhGVbig1sZV9ixm3RJSIIff5qGj10N80pl4tlO9QGv5HIxfv?=
 =?us-ascii?Q?5tJwsfAAMNMf4O3NXMK/Q4NUVgznjhMr8FKwbO5EpGqYMm69P3A3wgAS+Zih?=
 =?us-ascii?Q?W7bKgEEBMOISLWJzxyB+ErV4BvzdqfkPmL4KVF7t6b7WRM9GCK/cmP2uEjrz?=
 =?us-ascii?Q?Gce+MlKtOZ27DXIAkQCsJoPdIylJwgguoa/nqrddS5GwmYCu3/Wfwkq8XrsS?=
 =?us-ascii?Q?tHiOHKyBkLnxNCbSOiAZJGJFfV9KtVMaVH6+TzT5ibL0IqUi30iolt9vuWoE?=
 =?us-ascii?Q?3nv0/YJmBAyQk8KkPDZvh/dahdp7i5VBRSRNFlfvKu9dGNoecEQrrCurl+oS?=
 =?us-ascii?Q?7s40AJRcfUJYnbY3RAYnJP93TtOC7iMmebfrjqJ2Wr9I6UW8EbXJeLTteoY0?=
 =?us-ascii?Q?n/MkprHWDcW8Wr18DECCVNH50Mcz222w46UNgcMgGTjAzsesWpgVx08i1Z1r?=
 =?us-ascii?Q?MpaBgsatcS558GENxJU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9078bea6-60c0-416e-48bc-08dc6089daae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 16:00:37.5239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUOmxnoazKvTxn08er0XeZ3FNWsDhPN8/ssCqVQ5OT93NuQGj6SgRQzQpcJ0xDMgnzGZ3ver08RVlZv3WEIDQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 12/13] drm/xe: Add xe_gt_tlb_invalidation_range and
> convert PT layer to use this
>=20
> xe_gt_tlb_invalidation_range accepts a start and end address rather than
> a VMA. This will enable multiple VMAs to be invalidated in a single
> invalidation. Update the PT layer to use this new function.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 59 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
>  drivers/gpu/drm/xe/xe_pt.c                  | 25 ++++++---
>  3 files changed, 65 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 93df2d7969b3..65409f494f59 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -263,11 +263,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  }
>=20
>  /**
> - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for =
a VMA
> + * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT fo=
r an
> + * address range
> + *
>   * @gt: graphics tile
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion, can be NULL
> - * @vma: VMA to invalidate
> + * @start: start address
> + * @end: end address
> + * @asid: address space id
>   *
>   * Issue a range based TLB invalidation if supported, if not fallback to=
 a full
>   * TLB invalidation. Completion of TLB is asynchronous and caller can ei=
ther
> use
> @@ -277,17 +281,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on
> success,
>   * negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma)
> +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> +				 struct xe_gt_tlb_invalidation_fence *fence,
> +				 u64 start, u64 end, u32 asid)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
>  	int len =3D 0;
>=20
> -	xe_gt_assert(gt, vma);
> -
>  	/* Execlists not supported */
>  	if (gt_to_xe(gt)->info.force_execlist) {
>  		if (fence)
> @@ -301,8 +303,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	if (!xe->info.has_range_tlb_invalidation) {
>  		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> -		u64 start =3D xe_vma_start(vma);
> -		u64 length =3D xe_vma_size(vma);
> +		u64 orig_start =3D start;
> +		u64 length =3D end - start;
>  		u64 align, end;
>=20
>  		if (length < SZ_4K)
> @@ -315,12 +317,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  		 * address mask covering the required range.
>  		 */
>  		align =3D roundup_pow_of_two(length);
> -		start =3D ALIGN_DOWN(xe_vma_start(vma), align);
> -		end =3D ALIGN(xe_vma_end(vma), align);
> +		start =3D ALIGN_DOWN(start, align);
> +		end =3D ALIGN(end, align);
>  		length =3D align;
>  		while (start + length < end) {
>  			length <<=3D 1;
> -			start =3D ALIGN_DOWN(xe_vma_start(vma), length);
> +			start =3D ALIGN_DOWN(orig_start, length);
>  		}
>=20
>  		/*
> @@ -329,16 +331,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  		 */
>  		if (length >=3D SZ_2M) {
>  			length =3D max_t(u64, SZ_16M, length);
> -			start =3D ALIGN_DOWN(xe_vma_start(vma), length);
> +			start =3D ALIGN_DOWN(orig_start, length);
>  		}
>=20
>  		xe_gt_assert(gt, length >=3D SZ_4K);
>  		xe_gt_assert(gt, is_power_of_2(length));
> -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> ilog2(SZ_2M) + 1)));
> +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> +						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>=20
>  		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> -		action[len++] =3D xe_vma_vm(vma)->usm.asid;
> +		action[len++] =3D asid;
>  		action[len++] =3D lower_32_bits(start);
>  		action[len++] =3D upper_32_bits(start);
>  		action[len++] =3D ilog2(length) - ilog2(SZ_4K);
> @@ -349,6 +352,32 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
>  }
>=20
> +/**
> + * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for =
a
> VMA
> + * @gt: graphics tile
> + * @fence: invalidation fence which will be signal on TLB invalidation
> + * completion, can be NULL
> + * @vma: VMA to invalidate
> + *
> + * Issue a range based TLB invalidation if supported, if not fallback to=
 a full
> + * TLB invalidation. Completion of TLB is asynchronous and caller can ei=
ther
> use
> + * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait=
 for
> + * completion.
> + *
> + * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on
> success,
> + * negative error code on error.
> + */
> +int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> +			       struct xe_gt_tlb_invalidation_fence *fence,
> +			       struct xe_vma *vma)
> +{
> +	xe_gt_assert(gt, vma);
> +
> +	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
> +					    xe_vma_end(vma),
> +					    xe_vma_vm(vma)->usm.asid);
> +}
> +
>  /**
>   * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
>   * @gt: graphics tile
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index fbb743d80d2c..bf3bebd9f985 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -20,6 +20,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  			       struct xe_gt_tlb_invalidation_fence *fence,
>  			       struct xe_vma *vma);
> +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> +				 struct xe_gt_tlb_invalidation_fence *fence,
> +				 u64 start, u64 end, u32 asid);
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
>  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg,
> u32 len);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..8d3765d3351e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1075,10 +1075,12 @@ static const struct xe_migrate_pt_update_ops
> userptr_bind_ops =3D {
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
> -	struct xe_vma *vma;
>  	struct dma_fence *fence;
>  	struct dma_fence_cb cb;
>  	struct work_struct work;
> +	u64 start;
> +	u64 end;
> +	u32 asid;
>  };
>=20
>  static const char *
> @@ -1121,13 +1123,14 @@ static void invalidation_fence_work_func(struct
> work_struct *w)
>  		container_of(w, struct invalidation_fence, work);
>=20
>  	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
> -	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence-
> >vma);
> +	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence-
> >start,
> +				     ifence->end, ifence->asid);
>  }
>=20
>  static int invalidation_fence_init(struct xe_gt *gt,
>  				   struct invalidation_fence *ifence,
>  				   struct dma_fence *fence,
> -				   struct xe_vma *vma)
> +				   u64 start, u64 end, u32 asid)
>  {
>  	int ret;
>=20
> @@ -1144,7 +1147,9 @@ static int invalidation_fence_init(struct xe_gt *gt=
,
>  	dma_fence_get(&ifence->base.base);	/* Ref for caller */
>  	ifence->fence =3D fence;
>  	ifence->gt =3D gt;
> -	ifence->vma =3D vma;
> +	ifence->start =3D start;
> +	ifence->end =3D end;
> +	ifence->asid =3D asid;
>=20
>  	INIT_WORK(&ifence->work, invalidation_fence_work_func);
>  	ret =3D dma_fence_add_callback(fence, &ifence->cb,
> invalidation_fence_cb);
> @@ -1295,8 +1300,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct
> xe_vma *vma, struct xe_exec_queue
>=20
>  		/* TLB invalidation must be done before signaling rebind */
>  		if (ifence) {
> -			int err =3D invalidation_fence_init(tile->primary_gt,
> ifence, fence,
> -							  vma);
> +			int err =3D invalidation_fence_init(tile->primary_gt,
> +							  ifence, fence,
> +							  xe_vma_start(vma),
> +							  xe_vma_end(vma),
> +							  xe_vma_vm(vma)-
> >usm.asid);
>  			if (err) {
>  				dma_fence_put(fence);
>  				kfree(ifence);
> @@ -1641,7 +1649,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct
> xe_vma *vma, struct xe_exec_queu
>  			dma_fence_wait(fence, false);
>=20
>  		/* TLB invalidation must be done before signaling unbind */
> -		err =3D invalidation_fence_init(tile->primary_gt, ifence, fence,
> vma);
> +		err =3D invalidation_fence_init(tile->primary_gt, ifence, fence,
> +					      xe_vma_start(vma),
> +					      xe_vma_end(vma),
> +					      xe_vma_vm(vma)->usm.asid);
>  		if (err) {
>  			dma_fence_put(fence);
>  			kfree(ifence);
> --
> 2.34.1

