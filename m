Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC29C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 05:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0D910E00C;
	Fri, 18 Jul 2025 05:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfHQFBfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D25210E00C
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 05:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752817693; x=1784353693;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/NdLnZgPWj5fPODbOy2FkGRFNyQpNDSVmNyAWnqdo1c=;
 b=OfHQFBfQr6cR36YRUKTCNR3lmklypAqzdXDH5oEtT7XVK5eSH/S4zph5
 N92uCHzKBhOASmNFGjt7AAuG9AFJJv+q6GImU4w2TcC0zgVPX7KxTjK7n
 PiEyvlU2ulhJpCTOUNFDEorkLnb2aH3dgSxyw6w6OQZkR2OQnrbbKDbXP
 3pM8UHsO4GBdl4+4YI7gQRSp2/4PRR2oli3QoTKX+823okvSWGqJQfs/K
 Mh7zRb+nlSG6tayP5gfUsLUscvdDGt6pcu9VbMutnsCCwoRfdBbsA98oK
 O4ZxkCiB9ufNC8cN/sif/GrrdePNCEMbXYnTyorOc2WLi4EHlJiGHDkop w==;
X-CSE-ConnectionGUID: R7OdsYRRTvaGDa7c/9hUXw==
X-CSE-MsgGUID: 5HBKY5fMR3SUOUH8ZZf9Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58918039"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="58918039"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 22:48:06 -0700
X-CSE-ConnectionGUID: wtwwrd0yQQqlb8zQzXl2Kg==
X-CSE-MsgGUID: BBpplhmmTDmZwX7wTEYSCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="188931275"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 22:48:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 22:48:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 22:48:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 22:48:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkTzZDMiOBixn4DYqDk/bqFgVvsN/UnDG7r7QH8stExze7lg0vxF8S2f8BJy+f/kCT+u1vViwv1PPGLZq+ufOyYs6bqbGGQK0jPVMc0l7Tdqul/gcVNoojhBYUkTROyfN+hGyQWg7TzRiuRC2f3MP0XK4Gh+Y//bFrx0RGmVCiSrkZ/PIYHDmd1BjKtJQLmn6pNc3HnnvzG/R1DC/XVseyzyIkZMoGVMd1uXTfnH2XSs/JALAwrJfwfDd/m0xI1rshZuGX4G30WB0LWFlsHsRHVuK6gv3yh1euxEtwDN9ZG5MdnLLyKqqmvsVbtVn+rU4Z1XKi2nq8mC9FY3hEJ2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1HQKnlKbzPzdY8Kz/s6nb7qs+L0jbpkSgabVoiGook=;
 b=gDET67ZKB/Xr+5n+V7AS+U3u4F2lNXX7jVQYkbvwA2lxQysKjj8jyXJ99uUzlrsR+k0qzhAUpuuuHXV3Y7grofaAUv3oe7LG2doxUgfDscJWgo40KPYBy+/nDGr8NRPiR4MXfkMaFChQiBQo1IN7ihualffkiyaw/wrFpEXhawAFd/jP5c5fgYP9T6KRogTBN3GkRrLzqXabXif2mYF0QBgluFA+t66rXsz+iNh2YbZLTCCk+tHjOdkoqQn4+qiQ2nAmKJCFET4WtAR8u9OdQhpvtQGIktT/mPa7mLTIezjBDQ1AwD2ZnTykPjUSKk+xa4JPXBx8Zq97s5rTb596oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 05:48:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 05:48:03 +0000
Date: Thu, 17 Jul 2025 22:49:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 5/5] drm/pagemap: Allocate folios when possible
Message-ID: <aHngfEfHPmiNRJ/g@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-6-francois.dugast@intel.com>
 <aHnQcwv0qYcP/zis@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHnQcwv0qYcP/zis@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 967b3e38-fd66-4164-2ef9-08ddc5bea92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWVyb25KV2dKd3BZMStwc3hzdzYwZFpuY0dPUVNsSFpEbkthYm8yTHpGemNu?=
 =?utf-8?B?UC9IRlhzZGJTZzFqVzY2VDl3S1hiaERwSUdGd3ZIdHF5RjBvZDlYRG9ZM3o5?=
 =?utf-8?B?WGdiTEczVHZ5T3IvcGVIaDJoNmhpN1hiMm9BK1h1eXdLcU1INjdoVzBCTTU4?=
 =?utf-8?B?anNIL0o1NUxhSXFWdndhaGV3NkIzSURZK0FnTU1pTk1VZXN4QXRJWWlTNExU?=
 =?utf-8?B?SDFuWkhva2FyekZhVkJpLzJOQlRET1dOQVVtTU5EcE1Ea2QvTlRiYjRzbkRz?=
 =?utf-8?B?VXovWVowckM1Snk5MkRSZW9FUkozTGZFQzZ3M2tNSU96eFo5L0h0V1VYNXVj?=
 =?utf-8?B?Zy9XVFdNWHR2NTRDeWliTDZVVmgraHRodFU5MXZ0WUVtRFBTUjcxeE91Yjli?=
 =?utf-8?B?RXlqSVo5MjBsOWEwd0xWUG1aV1NwaDBWemNOYUttNUYwTHlJTlVubVNndkpi?=
 =?utf-8?B?cjZYeS9aUGwyOTlNL0hvZjZRSlJ0aFovVWRXdXh3YWdpNDFyRk0xV3lvQjJG?=
 =?utf-8?B?RnBsVjFMVHY5bVIrcjU5OThLSy9aRUo1TzJlMVkwdTFHNFZ6ODNRSGtFSW5J?=
 =?utf-8?B?RGZ3WUZBYXk1cUhaemFWbWNCeWN1YWc5dk1nMVNaMjkwenkzSnFEb2xhSzhQ?=
 =?utf-8?B?dFpRdlNSZzE3RE45b2Z5STBCai96V1l6WVhTVW1jQ1RKUXk1aVBWMmIxZ1c1?=
 =?utf-8?B?dncxdmtmbElrbXFmdTk5MkNDeXhLRDFBSTd3WUVTSEpXWjRIT1RzcDVNNFlq?=
 =?utf-8?B?d3VnU0VoZkYrME9zL0NBQTJMZTJoN2lPSmZTNXdoYzlmdjlORE1PemdRSXlW?=
 =?utf-8?B?UTd3SWRkU0pLaU4vTWg5cXd4TUE0RDZzWTJaRFpDR3g0dTl2cTQ0K05lbWtQ?=
 =?utf-8?B?anR1aWpiN2IxWnlTeWNkcytSYzBPUWdKZmJkOW5JQjFoQ3NwRlRKZUlIZnlt?=
 =?utf-8?B?ZTMwakpiRnN4cTh0Nzl4djRxc3VNYm1YU056QUE4WlNlZHZCWTV1Y2ZPYnZF?=
 =?utf-8?B?anZZcnBXUjh2THBxc3g2SDY3NDlVMnR5LzJKREdoYllSb2FoeUVzM2FsQnRn?=
 =?utf-8?B?bXZxVGtHNEl0SDFTeFIyY21IN0JvNUNrRkpEdDNiZ281aFlyRHdrZTc4dTJv?=
 =?utf-8?B?NkYrRHcxNjMvY2dvb290QnQ0Vi9SbXRXWXFxWkRGRHIxY1dOeTVsL3AwSElF?=
 =?utf-8?B?eCt1Z3FvMlFWOTJTem9WY2lESFhzbFNUMW4rTHUxSmZCTVpKaitzNmNUU0h5?=
 =?utf-8?B?dVFCVWRLWE1qTVJsdTNWT01zemo5WjdsZWNpcDdESjh6VjducXB1UXduU3Jp?=
 =?utf-8?B?NUdTamNkK0x1MFM1NHR4d2gzUm9DbFhNcncwbGtiM0NUMkRlSHp5VE0xbW5B?=
 =?utf-8?B?YXg3ZGZMbU1kZHYvcmhESFJNZTl6aVdJSzdJc0N2dnFWRllESHBLclhaeXUv?=
 =?utf-8?B?SjBPTVFQeUxaWUhwV2VUdFVZYkpBKzdrNS84c2thZEU0MS9TdlFCblJUeCtX?=
 =?utf-8?B?MERiYUl5SGJHR2RKZzVyQVRUeE9iSHhQM3VDOXNRdjlmTU5oZXYzdjgxWWsz?=
 =?utf-8?B?eWJzZ2ZiZ2Rtd1RXeDFhSUZrSC8wK3VCOE5qWWhoRE9UTDZIRFFBcHUyWGth?=
 =?utf-8?B?SFd6OHFCenE4L1oraEwrUHdIWmdvT09WVnVUL25lY29NMW01SWVJcVdyVjVh?=
 =?utf-8?B?ZGYySFR4VHZYYUFST1NKQ01VQk1EeElpUHFpT0hIbk81RCs1N0hsQkRtWjVV?=
 =?utf-8?B?TW12UGFLWDdaWExVeWdpaUlwalkyekViTTAxbTVjWjNJNXA0UGZxLzIyeVdP?=
 =?utf-8?B?QW4yQXBIZ0pJdHpOai91YTlOa0RROTUyWmMxT2llR0Fuc0dEM1ZHQit6UjZj?=
 =?utf-8?B?Qy9ROW5vRjd5cW91T2xuSkpHYzJ5V2k2VHkyMFI4SEJ4WXpJTVlpTjdlbHBj?=
 =?utf-8?Q?QYA/LzNvHtM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJxVFpRN0g0b1loRjhSR01uUVlhUzdKVk1pb0RFMkZYZHZBNHhrT1lnSlk0?=
 =?utf-8?B?SE9xMEpSa0NTWW1ST0xpcUZkOWhyRzhEY2RtUithdmpLZjZJYWR5Vmkxd2VQ?=
 =?utf-8?B?R3M5OStibjNqc2dLenpWcVhGVzZlaTlPekpzRUlmSCt4M0NZSWRJYnY4blVC?=
 =?utf-8?B?aTV6UnR1S29ia3ZqQ2o3cU5RcWN5c3E3VTZUTStPbHBBWlREOHBqZllicDRr?=
 =?utf-8?B?cElQZFo5ZktYVEZsTzNHWGlObkNCVXRLSUp6bVZMblRKMjY1MldvZzFIRTA3?=
 =?utf-8?B?SjM3bmVOQkJWZEFwQ1RaZnZIY1MwQUpGbWxIdUhJZFdoNTVqQ0VvN0dzbjhq?=
 =?utf-8?B?aGhubFZsNnBWU3FQRjQ0L3RIUTNudVJyYVdjQzNpelM3NUFsNGlJckxJWTdF?=
 =?utf-8?B?SG5EdHdJOG1oc3VVeVRXYmgyRkRVN1ZRSWw5cHdNSlFJUlA3N0VyT1VJdWtv?=
 =?utf-8?B?a3prV1JpZWJNbUpidjBTaFkrRFIxL0MzZHllMmhYSHdLNHhBOUc5dEMyQ3F4?=
 =?utf-8?B?Y092RVBQY2s5cUs4U2ZqRHh0cDByY3A1WmtBTldlOGM5OWZzN21LTU4vOFh6?=
 =?utf-8?B?OElGY1k5bWFab3dUdm8zRTNBdU85L1lsZ1pMcUVlcURtWWZkbmc4OStVUktB?=
 =?utf-8?B?eldiNXQxay8vVUtYemx2T3MxL3NHNDBqQlUyeDZLaG1DL0xaSFdIR2pkUktx?=
 =?utf-8?B?OUlHTitCZ2hCWXdKTUFuOWNUb2hPVWFwVldSQm1RZnovdzQ5d0hnVHhtS2FH?=
 =?utf-8?B?UTNZQzAxZ3lKVGxpYUtOek5vU0lId0MvSDQ2aktoN3ZkUzBGZHZZVjc0N2VS?=
 =?utf-8?B?WVh6WHB4UC8zeFZ5SDB3QkNQNStuYmU1YXNLbkk1SUVpcFBiN3BFMjJnRm51?=
 =?utf-8?B?VTNDaW5HeCtsdHZLVXNKVFduVFRxTFliRkRQMStHSlIyRHRjRHdaaHdHN0ll?=
 =?utf-8?B?QWd6TU1uZmxxZ3p2VnRFNGFrVmpUb0c1L21Va0M2bDVLbGZFZmMwU09INklx?=
 =?utf-8?B?N3lDT2dGeVJWZlVjVTNzd0RwNnV1ZUlzdTlKNjhSb29ZVnVpZDRpODg0S3o4?=
 =?utf-8?B?WVM3eWxIL1ArZEJkV2hWUUlOMlVSb0JQSGtSNWZYSEFNYkdSWVR4bE1RWHFC?=
 =?utf-8?B?eWtwU1hUeEhtSksrQ3FuT1FUV0VNRHFXS1VtbVVsZlVWWjQ2WENwMDljRFN6?=
 =?utf-8?B?ekpDblc5dEYwSzVxSG40dUxaRE93QVNBTlNnZ0RHY3B4eUR0Z2tpbXlNUW9k?=
 =?utf-8?B?QWNqRjJZeWs0Nks3VnczYVEwclJQejRCVFh1eVFuM2RiUkZLRFFQVXRIZzB6?=
 =?utf-8?B?bTdBbExIRWZwVDd3WkNLMFBXRnlaMU41QUt6ejhNb3d4OStqamZtUXFqeVM3?=
 =?utf-8?B?VENsU3RFQ0ZtckZzZlVJYXdZSWlqcUZtK1loRzZ4VWtzWGEyNnRFdEZzT2dI?=
 =?utf-8?B?dFBCdFl1d01qYkNtZlo1RWZxMzFJbml5NlF3ZWJGNC9NcDNFSTZQMy92d2s5?=
 =?utf-8?B?QkxadmtvckZWVWczOTJxQkNjdlozbWY1bTZYek1qa1FiZlNCQmZta1BwNHQx?=
 =?utf-8?B?Uzd6V1Z2bSt6OE9PdHNIbHFzN0hsUWZWZkNZUVVIb1NGMVZieUFEMHJZNWlE?=
 =?utf-8?B?Y2dQUUt1dU1OSXM2RW5PMnN2UkoxUUFsTlpKdEdiNkJ5Vys1NTFPRC9YLzE5?=
 =?utf-8?B?MXg1Rmp2TWZLRjZMai9SdTZTVEFBMm1VU2lzeUc3bWVnUjB2UnVlRVdGdmIz?=
 =?utf-8?B?NWRENkIvdFNKL0JxeHJlZkFxRmQwc3NZeGQwNmxZTUtjbThWeDcxbGQwYjBU?=
 =?utf-8?B?TFF5QUp6V01UTnlxbzZWcVNXWm5kRnh5QWpQYm9nandDWmNxNm5qbCtrNVhp?=
 =?utf-8?B?cU56eE9jMi8vVWk3OXdRVDZYakFoaDMzcHJZYjJ2Mjh1QnJ1Zjl5MzVYcjhi?=
 =?utf-8?B?Q0RDa1pycG9qQnpMdDZwSEtHZFY4MkxUcUxWMUQvQnUwMktEU1hLeHduVnQr?=
 =?utf-8?B?Z3U1ekc5SlBjZ3VHMFVPWFdYUHZjVGNkZk9xTlgxcFhvRnpDc2w4RVg4b3RC?=
 =?utf-8?B?cnlSajBTSlU0YUxDSnozT3FDek9ERXhrckF0WmFsYnlWUGpmUjNBZGlXOVRq?=
 =?utf-8?B?UFpkUlMwRk15L3hnRXVLNUJhb2haTy9IZ3ZFN25FOFlNeWJxTnBMSmlXM0RU?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 967b3e38-fd66-4164-2ef9-08ddc5bea92b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 05:48:03.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4l2Ov0Gi7e2g5L9j0effVM/SGLUk9vWfmnCtXJBbFIvRaNt2fAtpdQSU7+el9Ut3S/ictehzaglKXz3lf7Jyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
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

On Thu, Jul 17, 2025 at 09:41:23PM -0700, Matthew Brost wrote:
> On Thu, Jul 17, 2025 at 03:38:27PM +0200, Francois Dugast wrote:
> > If the order is greater than zero, allocate a folio when populating the
> > RAM PFNs instead of allocating individual pages one after the other. For
> > example if 2MB folios are used instead of 4KB pages, this reduces the
> > number of calls to the allocation API by 512.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 33 ++++++++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index de15d96f6393..4f67c6173ee5 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -438,6 +438,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> >   * @src_mpfn: Source array of migrate PFNs
> >   * @mpfn: Array of migrate PFNs to populate
> >   * @addr: Start address for PFN allocation
> > + * @order: Page order
> >   *
> >   * This function populates the RAM migrate page frame numbers (PFNs) for the
> >   * specified VM area structure. It allocates and locks pages in the VM area for
> > @@ -452,35 +453,45 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> >  						unsigned long *mpages,
> >  						unsigned long *src_mpfn,
> >  						unsigned long *mpfn,
> > -						unsigned long addr)
> > +						unsigned long addr,
> > +						unsigned int order)
> 
> I don't think an order argument is needed. A better approach would be to
> look at the order of the src_mpfn (device) page and allocate based on
> that. This would maintain congruence between the initial GPU fault—which
> creates device pages either as THP or not—and the migration path back,
> where we'd insert a THP or not accordingly. In other words, it would
> preserve consistency throughout the entire flow.
> 
> Also, if you look at the migrate_vma_* functions for THP, it's never
> allowed to upgrade from non-THP to THP—only a downgrade from THP to
> non-THP is permitted.
> 
> >  {
> >  	unsigned long i;
> >  
> > -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > +	for (i = 0; i < npages;) {
> >  		struct page *page, *src_page;
> >  
> >  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > -			continue;
> > +			goto next;
> >  
> >  		src_page = migrate_pfn_to_page(src_mpfn[i]);
> >  		if (!src_page)
> > -			continue;
> > +			goto next;
> >  
> >  		if (fault_page) {
> >  			if (src_page->zone_device_data !=
> >  			    fault_page->zone_device_data)
> > -				continue;
> > +				goto next;
> >  		}
> >  
> > -		if (vas)
> > -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > -		else
> > -			page = alloc_page(GFP_HIGHUSER);
> > +		if (order) {
> > +			page = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
> > +							  order, vas, addr), 0);
> 
>                         if (vas)
>                                 page = folio_page(vma_alloc_folio(GFP_HIGHUSER,
>                                                                   order, vas, addr), 0);
>                         else
>                                 page = alloc_pages(GFP_HIGHUSER, order);
> 
> We may also want to consider a downgrade path—for example, if THP
> allocation fails here, we could fall back to allocating single pages.
> That would complicate things across GPU SVM and Xe, so maybe we table it
> for now. But eventually, we'll need to handle this as per Nvidia's
> comments, THP allocation failure seems possible.
> 
> Maybe add a comment indicating that, something like:
> 
> /* TODO: Support fallback to single pages if THP allocation fails */
> 
> > +		} else {
> > +			if (vas)
> > +				page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > +			else
> > +				page = alloc_page(GFP_HIGHUSER);
> > +		}
> >  
> >  		if (!page)
> >  			goto free_pages;
> >  
> >  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > +
> > +next:
> > +		i += 0x1 << order;
> > +		addr += page_size(page);
> >  	}
> >  
> 
> The loops below need to be updated to loop based on order too.
> 

Also the mpages return based on order.

Matt

> Matt
> 
> >  	for (i = 0; i < npages; ++i) {
> > @@ -554,7 +565,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> >  		goto err_free;
> >  
> >  	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> > -						   src, dst, 0);
> > +						   src, dst, 0, 0);
> >  	if (err || !mpages)
> >  		goto err_finalize;
> >  
> > @@ -690,7 +701,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  
> >  	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> >  						   migrate.src, migrate.dst,
> > -						   start);
> > +						   start, 0);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -- 
> > 2.43.0
> > 
