Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754E1C52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68E10E004;
	Sat, 17 Aug 2024 10:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq3CBnUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627310E04B
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723889674; x=1755425674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Pl6qJTSRMyjSNG6qxFYCYF172ojJW2fsAe2Lnb79Y4Y=;
 b=kq3CBnUku0YCaSYXsLYqSrdatCjjvAQEHvhnJo3un72B0Ct17R/yQ+ws
 WFDNHZyWimFjAoqFQkmHxESAEhR21IhrGLJb51AwuTWEQ1OgFSTwlt5e6
 DtnHda7t3N1rwgfvQECCVPNuqJ6KJ7tn/Wg0GiNgIh8E9rUFhSe26lNsE
 L9MPPD1gCHom/MTzL0BHdLotBgLlGRdsxqwlbadiKKhdsrT3qZLACn+aN
 P9X1GBUUHht4OM72u3XcJzW2vLXK295ODwbThDrSfPdSbwotz0T43TvGv
 Jc/qu9kLuqSh7MUuB4am1etPDti49thd6CUuTh1Tl0wyyRdyHwaLfJwZw A==;
X-CSE-ConnectionGUID: BmxvbM4fQ7WbWZWOEumr9w==
X-CSE-MsgGUID: SdNetKTZTlaawCIMQwUh0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21992803"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="21992803"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:14:34 -0700
X-CSE-ConnectionGUID: 0LlEjQ6ZRLCxtxwPBe/cHQ==
X-CSE-MsgGUID: 0jC8HnIPTS6E8kR5QaclUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="59751771"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:14:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:14:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:14:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRzKYaHTXZhsnAeURqrie4W8lmFjh+rM34zNCPr9wC4OF/DfaTCkrhWqVEjEclxQU564JmB70QV44J0ZjlewlT/1U2os21k+igUm8gGM0KUj0egnxvpkuubRrDGUO/sy1b7rEOg+OS5DxK/3TfwJTgPh48RO5hu8R8TXvyXzCGEXw2VJbi77l5UcoVlKOf7QWtkJm6mrgVK6VME16Sri88cOzq+pf/Lj93jMzNMgvIYObuaI5UR0pobqSjixJNXWLfbafClD2CvavEf4Rwb4v+/5+mzcAAOKpytYgCeGWhAKpfKh/rTraNzyFAJSZq9OYy6waX0S8NnHIbH6DfOaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZktgKcwxC+1+qUz85H4mAJVOrzyMEBr5AIfnjq03/w=;
 b=Y4OmHs7qGVMVmoR2V2e6ZKPRyTyRnx1Y/aA5hdQFtc7kSNFiSZA9jWhsttZ/mS+fnzbz9BtrplyMQ1liOZZqhkhdagTRAFiD//WtRh67FiZIjidXTcCyUOYzRlC9e5UJRFM3Mzmh/Y9TWu5U7Y+ii97jkHmOUQUSsYViyIZBT65q5wH3LMMRgBzaHup2+cKTIJCsipEkWh6f40JqzeGGugLXkgKtHHqjDAf0Lo916fiGfr+J3MUEnJMKLMtI4VeGoXrEY7JwgQ8tGoGOCl1Nj5lY9vmLd+w76BGUErpIZh6kN3pgE/1R/YLuvGGt5cGUb5w5+Yy02kTjRYizsl/Mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sat, 17 Aug
 2024 10:14:24 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:14:23 +0000
Date: Sat, 17 Aug 2024 06:14:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <ZsB3-p0Dho-f8jcl@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-12-rodrigo.vivi@intel.com>
 <mjynpl7ebpbmpzqncu2meyhwb7hfqpwxmu33pizqrfyluslxri@nvvhez7ybc45>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mjynpl7ebpbmpzqncu2meyhwb7hfqpwxmu33pizqrfyluslxri@nvvhez7ybc45>
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BL3PR11MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: f27a0895-44ee-4f23-5e09-08dcbea55ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XRcOyjredQXeur1lq4fmRKzuj8189JOtVqVF8IGT/AOJGcnfqlExQaMJA2?=
 =?iso-8859-1?Q?sZf2epTLbX541xs7oaHBcUMmAzhz+eG3s6oBKb6Ib1WbqXdHjEmQT4SIuo?=
 =?iso-8859-1?Q?Ye+NdmWwIgtvkHN8OB4ryv1YOIYzPw1sdCRRrkx+Jb4QP4Laq0ybmTdnUL?=
 =?iso-8859-1?Q?NL/Ib/oxEVqiuVzqnDyy+gwgKTAr/TUOYSzdMRH/dfK9Fd9TGLMD8CnGNJ?=
 =?iso-8859-1?Q?90axjLBSErF9JHqdzJ+jn602aTe8Iv0O9a4g3kqtNCKlAdhV2HQdkF5LPq?=
 =?iso-8859-1?Q?sWADIjo6Alc9Tul8A6cAetcmz4kfDCiqmZsF11QUIK+FAdl761Mamjaf6z?=
 =?iso-8859-1?Q?6/gHhQ2Nul1xRrc5yLX5JtaIJxKLG9G8GGkZDfy1q75j026hXLxi9GNWv6?=
 =?iso-8859-1?Q?sA4yQK0vpOgo6b/mPPLepkuvygf8EH7YJDY/YYuAx2lPpPleU5MYy6fYBS?=
 =?iso-8859-1?Q?V5swyef/+vkMVFUvgIl64cLKdMv4RwpVulqdCA1zr8OZkAPNwQXuuaqynj?=
 =?iso-8859-1?Q?Bs/wOHMQ7svXCyY1Kytz5c8x6v8A+WZW7FJlTiCrKIuHeMgi1YeWU3GMGK?=
 =?iso-8859-1?Q?d7yChF71jzjMnYWJi5UrVwnJNv2RpjCCwu3MviH81U/FCx2cdaDQPt0uQB?=
 =?iso-8859-1?Q?vKLGR8pPZ7DlEF9uCA7QYj2g73BbgRUzZR+G7LCFQhDEPLZqpSGHSy/R9V?=
 =?iso-8859-1?Q?x5fIEBCrYuz9rEFHBB65GjZU/RT4NzNQGG7mJ6e0inZmXCB8j8j4RrzwOw?=
 =?iso-8859-1?Q?cJ0lT0fPPvD4gY4sF7Gg8adFAQaVyiXhnNZ7uDpGw19sdjeW9OLpSKQzZg?=
 =?iso-8859-1?Q?MS2bAs9zLWir/FTKPfTDgyCqHo6gdzCJVsk9/bg1iNRUAVpkZw7X0pjer4?=
 =?iso-8859-1?Q?KLpV5ZKxacL4gP5b50OpIphSQVjnQEQduheQJjejftGH4ENlwuIMxOjMoX?=
 =?iso-8859-1?Q?BlsxGzIvUZJ7Js3nTF3Ao8tq8KOzm99oJnpxFCnZCtMojvRnHKTMTCJpN1?=
 =?iso-8859-1?Q?dqkTS/7+1ZLgwpvNQ3IvFRXW2f5BdynmmX7fw5E4mfD2YnunibOaoRJuc1?=
 =?iso-8859-1?Q?oAs3lLG+E4CJoKTN1txZFFfAYcDDLHvYO3bdhjylK4lE4MRJemC/gn59+w?=
 =?iso-8859-1?Q?Jz3T2dUZK6POhLtA3trxkRfp7AQEeO4c4iMUr3w+MexgAh/RUBmp3+Z987?=
 =?iso-8859-1?Q?leFuVtRVohaB/RMBi2/uXBFpKyK40jX4Onl+m//LTXQPj5R5g34UvaqKZI?=
 =?iso-8859-1?Q?1IoR2GkFSZHdZScY56ShjMe38mH/sq2M1OH7xLUr5OSWNABMJUsqh25BEp?=
 =?iso-8859-1?Q?KAbflXkBUpAUU4SVceddf8k6IAi9wVJd8z13Nc+dio5PYRc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Db6slqLJhQq/Iv39HsHD6pAhjM1kh1loQYwhuUaoQd2lRNGwXFEaL4TFUn?=
 =?iso-8859-1?Q?skh3qwsD/t/+FwKR3ctdeoClAvrgqMpmbu5ppL34sNu0OIDLyDUtDd+ckq?=
 =?iso-8859-1?Q?uUEGQekmYuNx5iP/fo00G+T89o0aAbpLJIv8KuIkZgzrVMqDxkco9ENLN4?=
 =?iso-8859-1?Q?24/Fn42jMmNmjhdU1X78uSP8LbRq7cfTWo1+/C8ctGpfkBmVThINAxTJIx?=
 =?iso-8859-1?Q?Fgij/f4cIbANRHxSwWXEI4RSCjDHge1hFnRAil5Ih93O+p+llci03F+7t5?=
 =?iso-8859-1?Q?Ip40lG0b8WCtI2g7SGJrPul+opTQL7xZ4YW2HxuyjxjeSv7hjgeUbIA5pe?=
 =?iso-8859-1?Q?+bYs+0QHO/XBvcOqb+S17cYlrbSWpAv3eIuDvI3IiqKlUzRzHrYO2nov9w?=
 =?iso-8859-1?Q?LWlV74DE7pbTqLmvW0E/OrBf4xsWwvPtKW4VtY7GKwadRu5YKjqiSssZe7?=
 =?iso-8859-1?Q?o4MyvVlkdhQZsI/kzFOJz5NLSXoORubhPEnwdmiwj4hYfAm7kVno0CunUq?=
 =?iso-8859-1?Q?yTrl//2hUzBBaYcUA6s/aydmP643Ubk+I0+IUfLfSTt6ztQxmXna5NKL4j?=
 =?iso-8859-1?Q?dk4fUqt+eoo3FbQBAOKMRHfO82Dhr8qz3XOdOEjOEtnMJEfEuE4cFwZDn0?=
 =?iso-8859-1?Q?ymkFtxJiWFquvWNmXUcVySYQT4KYlC1wGSG6BvSxWlEM8HikHYNz5hMbiR?=
 =?iso-8859-1?Q?0K5Wq2z8Exfvbj6r4zr5v0PzxPLOHOb24/7SSkg8XLnn+hLLZuqC1I4vNS?=
 =?iso-8859-1?Q?DqdPsZVsDaHvufdcF97lZp2DWcW1oJLi20KgyE2lGFlfrcoGuqyv/A1tmU?=
 =?iso-8859-1?Q?zsEWaxaInJ3jmqVeXUcCAZb4aiJaYg7z+d6Wi6oHkgXUyAe8gsR7gNE7hy?=
 =?iso-8859-1?Q?560IHPcNtShi7cTtlTBb9VFv5PL6sn6tZ1NViyoFbLCqi3+BRNr20o2Ucu?=
 =?iso-8859-1?Q?unat7ti81nKmX/Q4xZAX0zPLS0jqQBmYhMHtzWGoYrfAA/iy0KX1e6W2iK?=
 =?iso-8859-1?Q?YnnHe+ecqZgnf1LZO/C5FL6Zx7Lse9/Fw+UqyEVg4dx8GcNfXy3KhefFkj?=
 =?iso-8859-1?Q?z+r3xqzuq4LzI1SxCKfZub90pTSMYi/X+COkOtbZFd5zBJfvHOc0bgmuAM?=
 =?iso-8859-1?Q?5kh/gOGtWCO04Tv2XxszlUUM314jihF+yooz8aymG/++QDblkuJ36gh4E5?=
 =?iso-8859-1?Q?gyBHd6VBSkrGbYMQBhyML7ZxbP/7zbsZGpLMrIc3XBps+K25TTztAtcbo5?=
 =?iso-8859-1?Q?1Keg0aR4PWz578pRoFOAy77vs0uz7httcyNCTUf7bLk9hgMumNkgKUUJzb?=
 =?iso-8859-1?Q?tBXzyqNBB7XfeuoAahYqhvNS54cU6hu8Y/xiLRtPN3Dw1ELIZUm5/iXdkR?=
 =?iso-8859-1?Q?3nMEdWfxtMsUUyWoGHGwmyqYoBbsDxo8roGKmmiXnPOKxblGNnfQ97Uxam?=
 =?iso-8859-1?Q?hsII1UMHTOinPyATA/n4mICzYqmDq4VANt6GBFXOi0nRuICy4w1xocrUlc?=
 =?iso-8859-1?Q?+bkpdj8qmCKG0qhasvyR+ABhDEvJMxbBxe71RKtEafvVB8oupP/KevgKHX?=
 =?iso-8859-1?Q?N7J4wpUXGgmQm8P0CyfeBuU1P/mQwxCmPknXZy8XW8yaHdwb1/P0aQEvc2?=
 =?iso-8859-1?Q?abz87+rUOD/LCscc7d3n9umqAbLGCIJIL+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f27a0895-44ee-4f23-5e09-08dcbea55ccd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:14:23.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUESjlN+qvoCDKqEOvYfAAFaZZFk1zAjISB4OhO8kY0scIahJSo8PgFTaueO9pA6P8fJqzsgm3E0SCcov0sYCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
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

On Fri, Aug 16, 2024 at 11:08:26AM -0500, Lucas De Marchi wrote:
> On Fri, Aug 16, 2024 at 11:02:43AM GMT, Rodrigo Vivi wrote:
> > Defer the ggtt node removal to a thread if runtime_pm is not active.
> > 
> > The ggtt node removal can be called from multiple places, including
> > places where we cannot protect with outer callers and places we are
> > within other locks. So, try to grab the runtime reference if the
> > device is already active, otherwise defer the removal to a separate
> > thread from where we are sure we can wake the device up.
> > 
> > v2: - use xe wq instead of system wq (Matt and CI)
> >    - Avoid GFP_KERNEL to be future proof since this removal can
> >    be called from outside our drivers and we don't want to block
> >    if atomic is needed. (Brost)
> > v3: amend forgot chunk declaring xe_device.
> > v4: Use a xe_ggtt_region to encapsulate the node and remova info,
> >    wihtout the need for any memory allocation at runtime.
> > v5: Actually fill the delayed_removal.invalidate (Brost)
> > v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
> >    - Own wq to ensures that the queued works are flushed before
> >      ggtt_fini (Brost)
> > v7: also free ggtt_region on early !bound return (Auld)
> > v8: Address the null deref (CI)
> > v9: Based on the new xe_ggtt_node for the proper care of the lifetime
> >    of the object.
> > v10: Redo the lost v5 change. (Brost)
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_ggtt.c       | 107 ++++++++++++++++++-----------
> > drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
> > 2 files changed, 79 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 5c04c1bc8417..110acf828974 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
> > {
> > 	struct xe_ggtt *ggtt = arg;
> > 
> > +	destroy_workqueue(ggtt->wq);
> 
> better to follow the inverse order of init_early, but doesn't matter
> much in this case.

hmm...
maybe it does matter:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html

but maybe this was only a missed case of xe_ggtt_node_fini that I just
fixed on VF case...

But I didn't understand why you believe this doesn't follow the init_early
order? I intended to flush the wq and get all the nodes removed before
we destroy the mutex and take mm down...

What am I missing?

Btw, thanks for all the comments. Addressed almost all of them with
the exception of s/invalidate/flag I believe...

> 
> > 	mutex_destroy(&ggtt->lock);
> > 	drm_mm_takedown(&ggtt->mm);
> > }
> > @@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> > 	else
> > 		ggtt->pt_ops = &xelp_pt_ops;
> > 
> > +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
> > +
> > 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> > 		    ggtt->size - xe_wopcm_size(xe));
> > 	mutex_init(&ggtt->lock);
> > @@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> > 	mutex_unlock(&ggtt->lock);
> > }
> > 
> > +static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> > +			     bool invalidate)
> 
> you don't need the invalidate arg anymore. Just make sure it's always
> set in node.
> 
> > +{
> > +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > +	bool bound;
> > +	int idx;
> > +
> > +	if (!node || !node->ggtt)
> > +		return;
> > +
> > +	bound = drm_dev_enter(&xe->drm, &idx);
> > +
> > +	mutex_lock(&ggtt->lock);
> > +	if (bound)
> > +		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> > +	drm_mm_remove_node(&node->base);
> > +	node->base.size = 0;
> > +	mutex_unlock(&ggtt->lock);
> > +
> > +	if (!bound)
> > +		goto free_node;
> > +
> > +	if (invalidate)
> > +		xe_ggtt_invalidate(ggtt);
> > +
> > +	drm_dev_exit(idx);
> > +
> > +free_node:
> > +	xe_ggtt_node_fini(node);
> > +}
> > +
> > +static void ggtt_node_remove_work_func(struct work_struct *work)
> > +{
> > +	struct xe_ggtt_node *node = container_of(work, typeof(*node),
> > +						 delayed_removal.work);
> > +	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
> > +	xe_pm_runtime_put(xe);
> > +}
> > +
> > +/**
> > + * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
> > + * @ggtt: the &xe_ggtt where node will be removed
> > + * @node: the &xe_ggtt_node to be removed
> > + * @invalidate: if node needs invalidation upon removal
> > + */
> > +void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> > +			 bool invalidate)
> > +{
> > +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > +
> > +	if (xe_pm_runtime_get_if_active(xe)) {
> > +		ggtt_node_remove(ggtt, node, invalidate);
> > +		xe_pm_runtime_put(xe);
> > +	} else {
> > +		node->delayed_removal.invalidate = invalidate;
> > +		queue_work(ggtt->wq, &node->delayed_removal.work);
> > +	}
> > +}
> > +
> > /**
> >  * xe_ggtt_init - Regular non-early GGTT initialization
> >  * @ggtt: the &xe_ggtt to be initialized
> > @@ -482,7 +547,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> > 	if (!node)
> > 		return ERR_PTR(-ENOMEM);
> > 
> > +	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
> > 	node->ggtt = ggtt;
> > +
> > 	return node;
> > }
> > 
> > @@ -499,46 +566,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> > 	kfree(node);
> > }
> > 
> > -/**
> > - * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
> > - * @ggtt: the &xe_ggtt where node will be removed
> > - * @node: the &xe_ggtt_node to be removed
> > - * @invalidate: if node needs invalidation upon removal
> > - */
> > -void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> > -			 bool invalidate)
> > -{
> > -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > -	bool bound;
> > -	int idx;
> > -
> > -	if (!node || !node->ggtt)
> > -		return;
> > -
> > -	bound = drm_dev_enter(&xe->drm, &idx);
> > -	if (bound)
> > -		xe_pm_runtime_get_noresume(xe);
> > -
> > -	mutex_lock(&ggtt->lock);
> > -	if (bound)
> > -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> > -	drm_mm_remove_node(&node->base);
> > -	node->base.size = 0;
> > -	mutex_unlock(&ggtt->lock);
> > -
> > -	if (!bound)
> > -		goto free_node;
> > -
> > -	if (invalidate)
> > -		xe_ggtt_invalidate(ggtt);
> > -
> > -	xe_pm_runtime_put(xe);
> > -	drm_dev_exit(idx);
> > -
> > -free_node:
> > -	xe_ggtt_node_fini(node);
> > -}
> > -
> > /**
> >  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
> >  * @node: the &xe_ggtt_node to be inspected
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > index 0e8822ae13fc..8b83610c6ee6 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > @@ -47,6 +47,8 @@ struct xe_ggtt {
> > 	struct drm_mm mm;
> > 	/** @access_count: counts GGTT writes */
> > 	unsigned int access_count;
> > +	/** @wq: Dedicated unordered work queue to process node removals */
> > +	struct workqueue_struct *wq;
> > };
> > 
> > /**
> > @@ -61,6 +63,16 @@ struct xe_ggtt_node {
> > 	struct xe_ggtt *ggtt;
> > 	/** @base: A drm_mm_node */
> > 	struct drm_mm_node base;
> > +	/**
> > +	 * @delayed_removal: Information for removal through work thread when
> > +	 * device runtime_pm is suspended
> > +	 */
> > +	struct {
> > +		/** @delayed_removal.work: The work struct for the delayed removal */
> > +		struct work_struct work;
> > +		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
> > +		bool invalidate;
> 
> as noted above, I'd move this outside and always use it.
> 
> node->invalidate_on_remove
> 
> or something like that.... should make it simpler IMO so you can ignore
> my comment about using a flags arg in a previous patch. Up to you if
> doing in this patch or as a follow up
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > +	} delayed_removal;
> > };
> > 
> > /**
> > -- 
> > 2.46.0
> > 
