Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2765C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7729A10E07F;
	Wed, 14 May 2025 19:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ/5MQLK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7316889CF6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747251251; x=1778787251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QhiOfC6+7ig2YbbSBGcFIqg4zHtHy6J+1jkufl8yXAw=;
 b=BQ/5MQLKsZcVSuibne+rK9zolj2wvjZ9wFcAqayg4GbcNi6o//YBuvLL
 t37S36N5D3KzImmycSAiTlPDRPcbia4lNRukiafTCnVwUM5cTBbPvt26j
 jbegykSkq8zeRqJQ19omTDygvhwq+4mzbj2L+yv9f7M2sI5vdExIo6726
 c9YeiF/ovq9Ix8nyKMjv0Qn5wjXkCDVk+FOqOoZFgeYI9RLK/Q6kwp+WI
 3Zp899HbHw9rZ6DwVumv6V2YzGkxmek3nM9dyqmlo7UVhaJwdBWKocNNa
 KCZSMx6PaQ5ibxfO7eQ+6l1eZ9Eo72ozGnKSz9nNR2pvx1rGTrhtEL139 w==;
X-CSE-ConnectionGUID: GVkR8m+jSAWLdf++W/masA==
X-CSE-MsgGUID: 4/7s3fG3TAGpSPxWUG6a/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36788729"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="36788729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:34:11 -0700
X-CSE-ConnectionGUID: 6WSEdsPZSuamPxOQLwamDg==
X-CSE-MsgGUID: phhbD3zvTUqqDRcSdkdD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138558007"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:34:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:34:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:34:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2MgQhTRuYWGrfPSAAD96BMxu9ol7pCT87cf7DIsVbJwZ8W4DJSeuQJJtKxwZmtra2kzzCBgK6+vVAGUW0Eg+WbkYqGB6vdZD+3PVFmkqR/8f7iGTtuoYNFOo4e6RiZ+YHvagEMNiXOLtDj8F4s0OSO4+bv4Ey3Pk/nenBkZDsCR/n8+CDuWzyXsFJxvbFx+K/0WH9Q7fbNRwD90U8227GV21Pe3M/Crgf1WrRUDoJRf/o9lgRGNmR8BxVMp4rcUzrQ+cJgdS7EC75GuyeICC1CIkpBTSB6gABrfuBmqr18VgJSw9jaknE75/l/eK4lHGOTr+ItrDRxt6+VdgWbbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXATvwwCTl7aYENqI2op4UgOJQC04RNTFffkJseBG7s=;
 b=Yv/+FdOgeQzKh7zihxAe0DPvqgaqAMvcbRx2MV4QTb1nK1q/+h1zEiZaNAPFNFKVyR3Ul5Rin/ml4LoY1WQ7s38BfuoDyT8TwoAyTHp/KOA+3WFiihbNc7aS4OdhlWRYjgQT+jnPFIkEYqK2STXHob3FOt5mdJmjHHd6X+LSebRPAZTrKgmPttgDKZgQqMv7xX0tN3ruZ3wb01sCg9wA52LNetlpja20B1uEm0HDYeEIxPzBSkKA1kI9pUKBjGp7ZZ5Xa/v4Acepvc93J5FmlJk/ci6eCgWnEYqv6yOK73AWO8Z0hWIRpUDTHAA4sfG8mgiCiWlLLTnmcjQeKJUg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF31D2DA56C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 19:33:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:33:54 +0000
Date: Wed, 14 May 2025 12:35:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 28/29] drm/xe/bo: Add attributes field to xe_bo
Message-ID: <aCTweU2MTdi8d7EC@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-29-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-29-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:303:2a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF31D2DA56C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae9d7bc-3f26-4a03-6549-08dd931e4356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yjp0iPOcy/XO5PE8nvK5S4JYKUMYYT/H8tehmeW9IRQrjOQb/8KcaIra7cGd?=
 =?us-ascii?Q?+NCu7nGNTHbwCLylIO5MmaACCg4SgMVq8mqKpcT9W3jwnqhb62L9wYCnSK3h?=
 =?us-ascii?Q?VE3QAZyFEfQP8tmbGQ3nrXuiwd3RN+kSV719ix3B466Hr6veQBPYgwM+OCuv?=
 =?us-ascii?Q?4PvDS81wjHamOLdjA2rUhqs+AwzFF9lbcu0DyO1GLe0841WHxvlXGo8z5baf?=
 =?us-ascii?Q?VJivr+Q0G8MO0aLh3QMAg0mS/2cu/3b4rgRX3pnh7hZofDSvh4aVDIPAS5Ac?=
 =?us-ascii?Q?Fw8C17DnyPXu4RyRd4LQ/21PNNwUbmHvF5MpfPKGKdv8Yu3hfSsorS1UMAdo?=
 =?us-ascii?Q?GW2NtSLdJSULTHgcFuHqeC/7Psq3pF/0X3HSOtKPyBZUaUGtImLnsrDbjJV9?=
 =?us-ascii?Q?6WGh5aA0uCSKZk69FH2/Vkr2IVNARdSiXqDIMPD0XraNoo5la7C0rcbIn48v?=
 =?us-ascii?Q?+ulJuQOnPo+TjaqGlfGLe/hxwTCIYXuAYaY2UOOBIJEu7KisQaRL7PqFXT/w?=
 =?us-ascii?Q?nT1ejJpGN26RuWw46XgOXhWPnPkNw5Omf/st++BLd0IRCdzBhhnvW+NBzbIL?=
 =?us-ascii?Q?rp9xM5+xY8xaYg+EF1CkE0wQ4d6OiikqGh9A0YpQACySUq2spcu5KySU74JS?=
 =?us-ascii?Q?aNbm9TOTeGAZ5QVdPh7GNutfqVUHv2S8yiD0sR1qPTh/ORSJPX6N3rlUIywD?=
 =?us-ascii?Q?PLvEodzSGPwM0Q6/Edq+8Bx3bGorl1erBICANTSe4XyP1ccKhEzmvc3pT30U?=
 =?us-ascii?Q?Nm9dJByb/GVf7x055n39lZsagQn8OlYCHI8cDK1keMvskL9dZ4fy5jI1nYHF?=
 =?us-ascii?Q?GrwCzNnGISeTGOPlFhOD79jlAiSR3KDMBmhtKtXL3GSJf1wtLYTsYJ/2SuPh?=
 =?us-ascii?Q?DJPexVnTVbweGnZMx9rLSlA5EEiTm/xIgWIgS1ERo+bxUeunXA5vAW52+WzL?=
 =?us-ascii?Q?rKhOCz1V+G5aIVowOC5O6NoHSaLr7M/Hx0J2WnCRhz8tpC/ahFvTlIBX98MF?=
 =?us-ascii?Q?kdHYOS81brJlnLKRT/DLbzCP1ayNskQFqheAgAVn1aI1TROQIZiPfsbew7Fb?=
 =?us-ascii?Q?eo73UbU3b5/kKpsOpaqrhRgEvL2DveZw6olAaljisWcVvxku6NGebt4n60dR?=
 =?us-ascii?Q?H7VJl+vIFGm9ePRjBjn7kNKg4r2rz7azYb9yH+uR4Mjboi7LRF8wUQNf7amw?=
 =?us-ascii?Q?LgUBjFdvErIutcqj+eSbspZJIbTAyvpt0tLT7vFGyIDbRTKiKmkfCuZBZdAq?=
 =?us-ascii?Q?/IuPoLHx7FgNNvgJ7bgNBxJo5s4OgQkJNoeTUuCHnqu+HU+y7kXrExZ6kZAV?=
 =?us-ascii?Q?p/pn4UcOTBMbAievs8Fv47sMWtqKbSZP+sMpc0TETkkR6Yt9awW26x/OMJ6g?=
 =?us-ascii?Q?bj5Mr+e1hLxFuqxbC685Ri63OX7DlBUbD8uCia2nt5cD+AMfQm6XGRmtWEGi?=
 =?us-ascii?Q?ovYwd1/EBww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHBI+6i7p02QZGMbHAkXkDOI75HTKs5Ht6J46GhiF9VugwkX+VxRIOKur27k?=
 =?us-ascii?Q?9Lrkn/CCO/fG+yUVrXXzo4AFYtyiq2ZF+d6ZU4HtOdkJZVjWdQbX9550Ilmd?=
 =?us-ascii?Q?wx39CTp5a+eswUW5xbANw/15UTpceuO77FHxYxIGaQlRtwIxAE1RacLi4PkR?=
 =?us-ascii?Q?4iWRZeoyUcq1dNXxjXa4VPA6imfP6s69OGTGHxRB5lStjAnCw7RJ3W2WDYER?=
 =?us-ascii?Q?ARWh79A6mqb+t/1g6xQm8ybhS6kUDTFIwlP5LdwEvRrtxBnOXIk3l236xlI5?=
 =?us-ascii?Q?H3DQyRIEcEl5n5pmGVWKnDdAgx0Hjvs8ILZ4Renb0HnwkX/zTXgZlg80QCaW?=
 =?us-ascii?Q?W8vHLrsn5WRWH5jfkP1WuUUNIQAolkROJlX5QXDSyazIzId93Uxi9YGedngU?=
 =?us-ascii?Q?r7aSc1Ok9pCpN70pdvE72UDXm3UArvqtUipZdBDZ2hUTTr3/xofjHT9dCfl8?=
 =?us-ascii?Q?OQ9J6BzpDOIUHfHzC6oG9O5I0m8ZOJoRjvx6yuliHeUNWEEB9gVAC2tyb+fX?=
 =?us-ascii?Q?+W0VhaftBdJEQ0LQqVUlz31F9RXTAKnhllSowPgvk5qjqktdvLrFTddcxUlm?=
 =?us-ascii?Q?HY98PtKO5oubLLsZwHIMw+k8TndKUoFEIDiMfaFbHaQS/oHC4PJD6EPJdscY?=
 =?us-ascii?Q?l95fz5Mr+HuVONSHALI8gEVRjXGFAkrkeob0xcAg0moDFQigb3Dwfy8mu9B8?=
 =?us-ascii?Q?NeEXCFf5nysHSFSOfWfdO9xOoiGKU/FyZYYYULt4XVUxgOJyYTLhPNLp/Ias?=
 =?us-ascii?Q?SpsPQX2TRVLdIYrkVOAaxJojHZ+E4qQas+ZGjuzVjo/NYbzMZ9s08FzlKK5g?=
 =?us-ascii?Q?oeG6ZH1po3ZP/KNoj8gevTW0U2mwSSnvuKi1ZBjrMWkCNDO0ANrJihi8D331?=
 =?us-ascii?Q?rSqYfwhPK0igctTY+2QFtnr3NAFekiL+Y+59zKHzm/1Gi/CdNOramRZ1y0cb?=
 =?us-ascii?Q?VQi6VZVjTR0Md+gI/OWfKh+s58qnm+x0fJUN3fPzAGDkaUA/TMLvFg0p0XhW?=
 =?us-ascii?Q?hPrBrjXyTvg3T3YNvoHSnY0XptvuzGnvJRmsSk1dMJ0atnNjI3h2PAHNVIvB?=
 =?us-ascii?Q?qZmui7xKlcsGrZUlmjVwR/dQ56ZCUehlmYbyEzZrJHU9jEqvqjrnCZlt2ZvM?=
 =?us-ascii?Q?FKR44zsQj3hDiT1HbHMXiS6VV1wDb+AROaFl6lxqHgUrKuD3cYwwwBxTKHZd?=
 =?us-ascii?Q?Lu9qUTTjmb0CzLobe2IR2vjK2geKAh9Md7Ey/zN1DxQykSRS8AXQSOoLnkST?=
 =?us-ascii?Q?VdbKiZdyfKHzwZ8v7URd3cQ9HxUKys6V1Byr6R53umq/KWNt+XH2sRvJ2G5D?=
 =?us-ascii?Q?LwjUTqy7oh0hdeHc0XA8uNwrMjsK3TRDXcr7d1/Zxk9qBQouRf+qew8Qrw/s?=
 =?us-ascii?Q?6n7K5DkBhC5uHiTIHJpDNV4XJb+m2sNdr1PYJ/QTs0hqu/kcrdFDQVaBFBfO?=
 =?us-ascii?Q?c82vEBX0oJKVc44Ffeq5MZ4TNn3YmuR8A/bs2zQ+V/7TgvXBehkjaHhqLKZy?=
 =?us-ascii?Q?LMqVjwC0embCktJSxNoVsCkPvcTgCdRhlDermKvaSy7MYCCDI+B9zAgreB/9?=
 =?us-ascii?Q?vC7maMQWIaB09s3WlF58Vd4JDtnYRNGl1B7KtFHtlMc5IEDszNjws1+M7l52?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae9d7bc-3f26-4a03-6549-08dd931e4356
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:33:54.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6/QNxBx1bh0via1WR4LS5Q+jRDhTy5xHWTi+HKaxltB9HMGkVDcT+pRexp8FTkrSDEJd0KAbfc5NsSSAtdO2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31D2DA56C
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

On Fri, Mar 14, 2025 at 01:32:25PM +0530, Himal Prasad Ghimiray wrote:
> A single BO can be linked to multiple VMAs, making VMA attributes
> insufficient for determining the placement and PTE update attributes
> of the BO. To address this, an attributes field has been added to the
> BO.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 15a92e3d4898..bac21a4f6805 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -58,6 +58,11 @@ struct xe_bo {
>  	 */
>  	struct list_head client_link;
>  #endif
> +	/** @attr: User controlled attributes for bo */
> +	struct {
> +		/** @atomic_access: type of atomic access bo needs */
> +		u32 atomic_access;
> +	} attr;
>  	/**
>  	 * @pxp_key_instance: PXP key instance this BO was created against. A
>  	 * 0 in this variable indicates that the BO does not use PXP encryption.
> -- 
> 2.34.1
> 
