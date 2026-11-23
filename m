Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7116D606A333
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2vEgFoO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PC1rBty4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5D910EC03;
	Mon, 23 Nov 2026 10:47:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531D10EC03;
 Mon, 23 Nov 2026 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795430865; x=1826966865;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=50Z+Z0TvPq9LRNnkcv9oE+1lzy4WfLAz/26M7vIFadA=;
 b=L2vEgFoO058mmJPBBJZcpuaG3w5Cu4zRZ0tHa2pHg9Mnck0ILGiDnPt4
 UNZJVeM0+cyfUvwujlnENR6A05kMKMZ84lWvaEhQTmYD9LTpwytljSuA/
 ANH4XaDY+FoW14GoOq4izSVcOO6n5FVeGklcynzb4x+ds0uSwO2hQFTcc
 PFiSP35Ll6L+4ehDukuP+MR5t/XLOClh+Tj2Ohz1QIfcpH6LJNRalWmeD
 Xo8+9IhqLYbhtPLQsHmyoh/aJybeGtTfXfFFHcIQE1us9RYn6as/Cr3Pt
 EdFdKSi5j5MmOr2+f4LgIaGrh7w9Lz55+Ax6YD+O0JNP3+uj8JUcUcYcS Q==;
X-CSE-ConnectionGUID: ZCx4vodvRcir/8DM+5Lk1A==
X-CSE-MsgGUID: 0mbik07sTQazuf/UdCwuaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4126436"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4126436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:47:45 -0800
X-CSE-ConnectionGUID: CCNphWEaQGW218dRGR0axw==
X-CSE-MsgGUID: VaIH1jULRXyykAh5RCjR1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11354113"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:47:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:47:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:47:43 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Amxr22VdQo8mL/KSbSSWtJlVCYRAGf23SqwNA0uvdManZ9R8I2q/KeqS3vbkERXyJD8l7Yz5PW+4aO9Ya+G4X364QEvvIjGs46quMGx0aMuJq2D8oY4h6s9otktPwXKAAmIZ0TQxn8rOW3E+hLGVqBJ2hGqMsEbfgLS5FgEIjMRKKDtcVir9vdWvNS+FpByY7htkldwc5AgBtgcgcA6SDaorR3ij6DHEaKzTSIZpyojIgPQ3z8Yqlxvv2vBwgpjFUuVb+hiQqOdDCmpsrjMFTh0Q3PSZw559cVALhBhAUi0TyZtqyQ8OUE6SEmFEd1M7sRdHbKa+/ZahTXDBY+vFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jiulV5IuohAffj+m0geUBOjv9y+askbXBuJtqUBNW4=;
 b=F0F9LAcpSMDyXNo1jhi4dYRUUM4c8Od0PjmOX6ApH2j3OF7Y8Tcj4GFNXx40biYBC+znpFVpV0t304tDZByIHNYddIy9udQbs2Zzb9QqijhPHZoRK4MjjBYjwtTH5HH2QPfcE5pfWnTBUUI5zh5zoD5vXa84IcS+eRzN4Z6kY/i9OrbJsZfiT6tE6h1Ebel9DTA/jcaEasJLMs90xQxvF3GcggViZOa2hdS6IRTBo+1R006YJlshP21o+qRzq5dSHELlKF24Rhe/XjeDrjuteLSWyr8zgIvTe8HLqnoxR8fIoZvDQ64skeVKlBmBOHGw2Rzr6uxtKzy4XmmzeXLf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jiulV5IuohAffj+m0geUBOjv9y+askbXBuJtqUBNW4=;
 b=PC1rBty4R/PzhdIet8c3XWDuC2zFDsLxiXEuzf+fPbivOdK+EH5+b6e/u/E+YmAZn6nWzzPAvomycTESYl5Z8x4Qsd7DkHYMfW5Oy3G7EeRYcT/vqxx5YREuk1yhOG+OGptibSAsjdiuzQRYbFkG9uifIPhlKKC/MxjbzaTQF54=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by SJ2PR11MB7427.namprd11.prod.outlook.com
 (2603:10b6:a03:4c1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 10:47:42 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:47:41 +0000
Message-ID: <e564c1bb-3b90-4331-a2b3-02489ceaa096@intel.com>
Date: Mon, 23 Nov 2026 16:17:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/color: Program the 3D LUT on the plane's own
 pipe with joiner
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Uma
 Shankar" <uma.shankar@intel.com>, Matthew Schwartz
 <matthew.schwartz@linux.dev>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
 <20261123090251.934904-1-chaitanya.kumar.borah@intel.com>
 <awQO4Lln7Y1YQQ6d@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <awQO4Lln7Y1YQQ6d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba5e8b5-51bc-4db6-39ed-08df494f329a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261022113327099003|261022075727099003|261022105027099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info: kF/EM2vvIdRZ4YYHAe95NgIdJ8/naUPSAqN1oRUuJcXGu7Q13oU3YxjkdDWEWviWTbcsWyVtQrRKeKU+W/E3vt1iEvVBkN0r/sGupLReB2qww6dx1UH5VImA0gGWtrWgxSE9V7hLID1S1DccqcZvhF7tWaQNY7ryMeh9dwCdoIDvJVw5sXACRsUQ8r/NwHWyuWC5LDF+hOzNHkIAb/Gp5uvUGX3yi/1jJ3Ki/HaMJ6EbRpw7AJq+LYg3Iuc+xt8e7zIIs+xxDhwrKK+Zax9ZOx/fkEd7cWK5Z/H4JC/x0AXrGljY4M7KTYJLfUtXrYS3KdUsmyyjWhB76EMbpv947GdYNskFentGyHjJaKqyjKkkCfh6xJKjomjgMHdug8kiiOQoHkbiWMdA7VdRyjCsMVkZ8jnmwl8qEvg1N709Jg2tqCoRSzxqx92SY4RPTvqUxouwsGhvxPxp9KgtPW++PcvDhmTMQrrhfNo5nMkBE02pcM1nXX5i5EnqvKnSvXoQb2Woht3d4s1s6vfCmPf+2V0ur3oE/wxX/Kzs53poz2wELlDvKDYgDUkN76yCJ+aUey/yzFf99bcCuFDq4NgbqV+XxovIWNQOqcE5Id7BiKbtafa7QYoZLlVoFK/qhkSa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261022105027099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3pReWhBdFRiYjB2THp5eStLR0RNOWU4T0Era1JoUThpTnFSMnJBTldmVTJI?=
 =?utf-8?B?eE1qNng0Qm5BRXU1eUF0czJFc2FST3JBK2ZLWXhPejYzcGFzZG41d1JXSVMz?=
 =?utf-8?B?R2FqUCtHMGN1WlBKN2ZvWDVxanJjUmV6MExKVW5SK2E1Y0pHdm1IM0ZHVDJ0?=
 =?utf-8?B?cjFRbi9Kc3REZ0o1MWo4THJpYUFuTWdxaVJXZ1VHRitaTlBNb1lBaDc1dFY2?=
 =?utf-8?B?QmFUNFpyK05qdnBMQ2NMRnVIbE1QVzNPRGo0RTZmNS8vTnVIVTdRTndDeFJH?=
 =?utf-8?B?V213VWx2Tlp2VmFQYnV2YmpWaE9HdEhhZFZTaVpZUXl5SCtoQmRJUCtmVE1V?=
 =?utf-8?B?QytPSVJrenRKVlFNdFJNcTgxZzE1TEFnQzFqSWVWa2htRVFjd2FSL3pqZ3dv?=
 =?utf-8?B?UXdnL05BVEZ5MjViaXVsdkJYcmZvY0FENEJ0aTN0eS82cjB0bGJ6bzFtWm5P?=
 =?utf-8?B?K2tmelkrbWhVSlJpcmFadnRLNzdpbzUrZ2NaS0ZuWC9wMTlYbmVyTlYzeWVo?=
 =?utf-8?B?c2Z3MHNCL0o4YysyS3NRU0tZMExxM3hGeFNnVm53VmJ2VW5JSU0vMklvMWJI?=
 =?utf-8?B?MjN2M0xndVl2c1pUZnVteUFVY0xKUmJTNGR1blF2Zml4MHVrYmhRaXJ5cGVN?=
 =?utf-8?B?NEtYZTlvZ1l1emh5aldtcjA0QjdXZ2pKckkxMms3dkV5a2lCMER6aU5ZUzM0?=
 =?utf-8?B?aGxtLzhnVXE4MUMrMkF6alAvVmNMRWZOYXZmekRkVW9KLzZ1WWVscE9OVzlr?=
 =?utf-8?B?WWJ0bE5wM2h1aU1NUHh1UDZodEIwK2JkY1BDN282STh5emZ4VGNNSk50U2Yr?=
 =?utf-8?B?dFdMOW9WMWtBVFl0MTc2R0lTMzgyL2FaRHV4b3dudXFaWDNwWmhTQTBOQ3JD?=
 =?utf-8?B?YzMvczl5eHdGK2JpRXFIUk02ZWRTb2paODVWVUVyNUdCc2pJeThZWXVBTUR5?=
 =?utf-8?B?NlYwdDZkUmRRRWZ5bnBZWkIyRnJ2Yy8wb0RjTFJIWEllSFB6Y0syR3dLVlNi?=
 =?utf-8?B?eTJia1RmamtKZFllNzFlbFVmWWJTU2R3Q0tCaHlSUkI0bFRwM2lBVVVkQ0NU?=
 =?utf-8?B?NU9UK2d2dGUvdDF1K0Zycm00UWc5Smd5eEY5Q1M2bkRTRjBKd2U2ZjRLb2JX?=
 =?utf-8?B?UTJWZDYrandvTFZYU3VmY1d0TkZaaGtuMHBtMFN0TGNvQm9rWVg5VlllT3V1?=
 =?utf-8?B?THpZbzdMZmhLcndhaHZaQkJHTEF1Zk5qK3RYdGZ1aVBNdlkyTmhvZmpxZE1M?=
 =?utf-8?B?a3d1dS91MjRRb2pKbXFxK2l0T1R4bzhhR3ZTMEQycWJzZDNNSWlQNERHUmpH?=
 =?utf-8?B?a1llZVZNVFZmTGNONFduWjZQU0xUbitzWjh1aUxkaDZhdmtPNy9YNnBzRmJv?=
 =?utf-8?B?MU45ajFpRGtUMWhyZy9BSDlBN2ZkWkNVZ0VrWTJVTGZXOEZSbDFGSXkvbUNN?=
 =?utf-8?B?WER3N1A2NkZmYkQ2TmZPdFhkcDRZT2FXSGxaclQxdW5hV3d2UFd4eTVBSWtF?=
 =?utf-8?B?cDhxZEIrUng2S1lsNEdIOFZJZXFiOEdUK2hxVFBmWEdrbUgwN0NqcVd6K0ty?=
 =?utf-8?B?VmpLSnBWWWg1RFM0eWh2ZHV3enU1bktjVkVOdWg3MHNGVDFZNE55azdMN1FL?=
 =?utf-8?B?ekZPZGtXSEY0bzNwMFlRTXlERzZ5Mi9ld213SXZkR0wyQm03VkszejVzWE9j?=
 =?utf-8?B?NjN5ODZwdEtzdlFkdFUxY0hBcGpQQ2Q1Qi9JOEpwZG45Q2lWanQ5K2tQY3pr?=
 =?utf-8?B?c2xPWVZYYXhYN1BkQ2xTTlJtdWJkUS9DQzFjbGlTaUJJQm5NaldzNmZBWS9K?=
 =?utf-8?B?YWM2ZHY1Ym5XRk9IRk9oWEFUUzBJcEZ3akxSNytUOHpJcjdSTVcwR0tJZXpy?=
 =?utf-8?B?NDRvT1plb1BwVjByWEF2MXY4QlVLSFRDWmthUlFIRXVNOHN4S28xL3Z5WWk5?=
 =?utf-8?B?U2J1bEVvanpSYm9hVlZKUU0wVlhqVUtrNFVMYXc4VHpscWlZdUlNM2NCa3dv?=
 =?utf-8?B?NUJCL0N2bll2R2pTS042MkZRS0IySk5tRTFzZUV1WERVcGs2aGM3cG8weUVX?=
 =?utf-8?B?UkcrSlF2YXNnRlhUeGpZeE9EYUdmenRua1laV0t1US9rbk43YmYxUHZEYm8v?=
 =?utf-8?B?TzQzQ05PWkdjZ3Y1ZVpIeHppbHJweVdPQnFtc1luWUJINzlDRVo2L3doaTV4?=
 =?utf-8?B?NHVTbytFVnNJM2VWYThFNnNycDcxMFNWMnlqSVRtNkU5ZXNNTC91d0dDRldD?=
 =?utf-8?B?djYyN3V0ci8vZHdtNFc5RDFNRm5mYS9FVjkyVkx5dTROalZLQXRxY3FldFA0?=
 =?utf-8?B?NzFNSWg3a2hIQVdkM2FwSkxRaWJ4K0RiS3Y2ZkxRaUE0aCtFSGJiWStyb0lN?=
 =?utf-8?Q?It2MMsaflba1uqTA=3D?=
X-Exchange-RoutingPolicyChecked: czBknWyN0p6xjoE9h3+PO1y/zyTMfjjhsMkFABMsbZdvQGhutQAlLm6uYHOWMmdTLK5i2M9ZrZXCzAm14Ac/Qz89pYULvKqtQc3NDsP0J2QZAmLTk5RWmTmjoXgA3v+d50m8mYtgqx0vEp0NI9zDbu4+pWDXSdf6wqzMyjIt4/I03ehdtqnMquHIb+Kha1EpZlefM013lOrltrFspfiuAs7SO3w5gIReoDX7FbmhWFxhxak0usu0/dr/PpZMzg+ry1KhT6j5LnguELbJQ+SHTc5vkdMHH868TnAgAyQRTMH4sUzArIGRB2AyLQspS64vmrFaWYASBnDdkRt24xT5aA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba5e8b5-51bc-4db6-39ed-08df494f329a
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:47:41.3253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9E1ctLdldI4e2uLXl9uS9y7sBGpH9fCpaKJCj3Jai4PDOK4CMsil37IzCHv92HrJP0zlrjTC9axURxdVQuminh1HPsGDsyljELoNh9gF/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/23/2026 3:31 PM, Ville Syrjälä wrote:
> On Mon, Nov 23, 2026 at 02:32:51PM +0530, Chaitanya Kumar Borah wrote:
>> With joiner, a secondary pipe plane gets its hw state from the primary
>> pipe's plane, but its own uapi.crtc stays NULL. intel_color_load_3dlut()
>> and intel_color_plane_commit_arm() take the CRTC from uapi.crtc, so they
>> skip the secondary plane and its pipe's 3D LUT is never loaded or
>> enabled, leaving that part of the screen without it.
>>
>> Use hw.crtc, the CRTC the plane is actually on. The linked Y-plane of a
>> planar YUV scanout also has hw.crtc set but no 3D LUT state of its own,
>> so skip it in intel_color_plane_commit_arm() to keep it from clearing
>> LUT_3D_CTL.
>>
>> v2:
>> - Correct the commit message (Sashiko)
>> - Skip the linked Y-plane (Sashiko)
>>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Matthew Schwartz <matthew.schwartz@linux.dev>
>> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>> Matthew, the is_y_plane check is only needed to keep this patch
>> regression free on its own: with hw.crtc the linked Y-plane would
>> otherwise reach glk_lut_3d_commit() and clear LUT_3D_CTL. If you
>> rebase your series on top of this patch, the check can be dropped in
>> your patch 1 [1], since the owning-plane check there already skips
>> the Y-plane, which is never PLANE_PRIMARY.
>>
>> [1] https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwartz@linux.dev/
>>
>>   drivers/gpu/drm/i915/display/intel_color.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>> index 4070dc8d97d9..e5d40575aa95 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4278,7 +4278,11 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>   				  const struct intel_plane_state *plane_state)
>>   {
>>   	struct intel_display *display = to_intel_display(plane_state);
>> -	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
>> +
>> +	/* The linked Y-plane has no 3D LUT state of its own */
>> +	if (plane_state->is_y_plane)
>> +		return;
> 
> I didn't think we exposed the 3D LUT property on anything but
> one of the HDR planes?
> 

Right, it's only exposed on the primary plane (PLANE_1). The check
keeps the current Y-plane behaviour: with uapi.crtc the linked Y-plane
was skipped, but with hw.crtc it would reach glk_lut_3d_commit() with
no LUT state and clear LUT_3D_CTL, disabling the LUT that PLANE_1 just
enabled.

>>   
>>   	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>   		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
> 
> This is where the problem seems to be. Why is this not checking
> that the plane is actually the one exposing the 3D LUT?
> 

Ack, the missing ownership check is the underlying bug. Matthew
already fixes it in his series [1] by letting only the owning
plane program LUT_3D_CTL, so I kept this patch limited to the joiner
problem and otherwise preserved the existing behaviour. The secondary
pipe's overlays now hit the same pre-existing issue as the primary
pipe's, and Matthew's patch fixes both. His patch can then also drop
the Y-plane check.

Let me know if you would rather have it folded into this patch.

> Also the 'crtc' NULL check looks completely pointless. This
> shouldn't even be called for a disabled plane.
> 

Ack. I just kept it as a defensive check. Will remove in v3.

[1] 
https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwartz@linux.dev/

Thank you.

==
Chaitanya

>> @@ -4318,7 +4322,7 @@ intel_color_load_3dlut(struct intel_dsb *dsb,
>>   		       const struct intel_plane_state *plane_state)
>>   {
>>   	struct intel_display *display = to_intel_display(plane_state);
>> -	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
>>   
>>   	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>   		glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
>> -- 
>> 2.50.1
> 

