Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36E8CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 13:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EB410EF48;
	Thu, 11 Jun 2026 13:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wcvl4zNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ACC10EF48
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781186022; x=1812722022;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5svI27HOlnNIiXUkg333rra374NTrp1q4kMoVknrbdA=;
 b=Wcvl4zNBumaH+XynUFElbOXL+eBAgy8u8JoaGTrJkyHxh957h7gRXrKQ
 yXTNvGOd6Ox561hH4+pZF5XdAp8xt3mTOz4fAVA0ElS729xl7dBU/vTVz
 vLs+kx0WFudUzw9Toq76hmVP+XZ7Q7wmanpwUssv2U4WGDqnXm7493Cew
 4i53GRPE56NDmXALr5qwf1eJheMQ4rQc3NS7IvRdUKnYyC+0LJiRzks69
 uTmkr4bD6YCzMt7kH0P/7VdTemhZv3XgKfkeRhed3NehRg52IxDOSDnZ2
 Oo/bW9VYkhLWMM0CwDk7JoEErhWIH2ze6UCx7w6kCZK3Xwj2J3dQEFDji A==;
X-CSE-ConnectionGUID: 5GgP8TzPTkyZSbr5e5ThTQ==
X-CSE-MsgGUID: yJvwMXKESEWLSbm5/wEQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107435242"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="107435242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 06:53:42 -0700
X-CSE-ConnectionGUID: UYwi73IcRguucbVzjoTNaA==
X-CSE-MsgGUID: nMvnAmlmSAWfzmftnLyMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="246520781"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 06:53:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 06:53:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 06:53:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 06:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5lSfat7Ci4MGABwIzfYrXioNsXgElb8LyXKjaEJorG3yOBWiTHcZCwCKbYmWuGDQgfCZ9yu9IyRXMUeN5nBazKwMaFB6XJlYgRQuP6l55f3NxCfXR9Xq5xWQ74agdQ4j+yDUV6wFI3UZncYQ5PUlgtu/h8nr028Hy+rPlfRlvYy7in3ZKtF1zMMRmv1UACG7dUJLGrTk7vSgSbkCCpC/qPGMDtanV2Xr4xTQtFJGnkf2aGleivHztCVwvvu/4T5KfEOceX0W1iXRsWw2hiAYlYz53puHOYSVpu4o+DLi53Ajz+7gnQYmiP7fYwdUQH71dA13Fqn4E236Y/ZgyYq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHD5SHzsYvItIRb7Yo3CYfoauGpEktyYOqIEWRuYqm4=;
 b=nu/dxZ+R8Gq/bwxn9qFERnHvvtgxfXd/n77Gt+F9cb9wQLEukuKYFuNQYykQ0fwzImxR4cl8fhjtW1wgBfDC7c+6odmbUshn67WNuxbQ0F4854i2mLRYI/kcsqGVrmeimtWHAM9NDGTfnhd8VrxvoQ6Nh3uq++WQppTsibbpop2gTrX+hb7KPi4C6c2XO0NoqQo4s5DSAi65rRNVzzWK5PMcVUt0SkKiiR6Uj9a2/SgswAXWl7hvSri0XVNTzdO5nKErP75ps3HD5P5aP3A7PBz5Cbel/g1Dj/714apwJVegPv0vXe8ITJHpQNzYpzero+MuJsakYqXFfi4M2L0fXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 13:53:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 13:53:38 +0000
Date: Thu, 11 Jun 2026 06:53:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
Message-ID: <aiq933i+fJm2a/Fb@gsse-cloud1.jf.intel.com>
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
 <aimExeYtw8KZBsUq@gsse-cloud1.jf.intel.com>
 <aa4085faf0ff44e161a034e58a5150989ca6bf65.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa4085faf0ff44e161a034e58a5150989ca6bf65.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7beed4-14d8-4b15-1a5b-08dec7c0d694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|5023799004|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: DHj2SiEmutr8UVEYEXQmIo9QCkSpa0mQQZFd3jplGwRACQaTGgS8uzestL2QBq29vx2x4hv+M0nfu9sff7tl3rZ7hSVvE6OgvyGdncvctbuWZQ3XnppNdsNArPiz6Icub79Ui2wUDS9Vk7SIVApofLp/cED7HrGELTEGZ09jM2B5BoZvSa6de5IhZMACwpk0xwpuu1SDHJMkPb9kqMEVuJdC5vPbUDcDGf63tBVLUsV5xEIokTKcyhqUoZeProgiUfEoMyWvF7Fyt4UmKiq07zJe/JHCfn1eddg3Kp1nKzBJkpkhSKzyXbGKc2ZdYsL25np7HugkeMdN+LPLf1C6AfcvkmIskHFYD1rUVuQY8/n0qloa+HF2LHlk/puvEQClCC5reqCv6FPgXXvZgOvHDgrPAoRFA7czUzHQRKfPXYCgI0zSYWleE3QSE0NWNqrjrFdIeO8tHGA8z8OU/v6uWKCwNMEGZDwafd2s24EnOyEgQBDkOuQbwDq/xcgUWwT20PDKYxBxspCir66vOAW1zYdDbVZ8yDo/gx6CVU2G8tZ884YluI7GrqreYHrjuZKZ8bJ4RsBOfBi4EwPGRHo3fkIJi9y/LcY5RKpR8zgwNiNwS7OXe5jFKaz/XpFSHZHW8Sb8HCOsGbt5eA7F1NGRa2Ut6OAftQZ7qwYmPZZ6JUlb4SkvDIlCneJDP2O6vZUK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(5023799004)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REhrV3g3WlBrais3Z0U2SVgzdnJyMGJqWSs3QTJKT3NKajAyT0N3a3BHZDZ3?=
 =?utf-8?B?REhqa3MwZi9XaExXR0RGRWZsNlpxdWlNM2ZYWE1helRCNWs3cThBQmlaQTYr?=
 =?utf-8?B?dVFyWTEzSEhjL2JrTjE5Nk9xeWdkaHFxZXEzNzczT3VibTAza3JYRExWb01n?=
 =?utf-8?B?NFZUOU5lME5iM3owZzhUdTFYc1E0TVlySC9FWTdKSGtkWXpWOWllbkl1eG1v?=
 =?utf-8?B?YURONFUzYWtNV3VJTG1iRjRtc21CeFFnVTQvTTJ5S1oyZWFyV1hjb1czUzVy?=
 =?utf-8?B?NzJwTWppSFluK0JuSUFSYyttZGNZZ3UybE8wMnpsMGduNmg3NGc4cHJReThu?=
 =?utf-8?B?azR3a09tNnFtQUhHcGdYdTZXeklqdkd0UFhmaURpcm5BclRsanROdXFFRG0r?=
 =?utf-8?B?V2ZoSks5LzhNOUgvNm5GK3FGdDVLZHhTZXVaMmhLMm5qVU5XMytzMnFSVEhk?=
 =?utf-8?B?TmxwUXZaZWgrMWZ3aCtWZmJ3MmpiSG1tSXhuVERMMUFjTWdBYlUyVjE3OGN6?=
 =?utf-8?B?Y2JSWGh2RTkzV1pBeXNzMktjY284elBGSVZWcCthZVhuaHJ2allpSHppL01E?=
 =?utf-8?B?elVObDJrT3VyeUxabStEQzRIdkRYeUNmL1MrZXBnbEJXV3UrVHBSNnpFT3NZ?=
 =?utf-8?B?dmh6R1lOWStLVVRhSGJQNm5HWU9POEJid2IvYUZXREZnMjRkUWQwaWNxSFBW?=
 =?utf-8?B?SkFSK2pXY1Q0RExXbk5GR3FYTmxhSFRSeTMyWUsrYUhlRUphZmpQUlBSK1lt?=
 =?utf-8?B?R3hKMlFraThha2Rvem1jOXd6RVZ0RnFGYi9tdEtCbXlhd3A5YnNRd1VkWGJn?=
 =?utf-8?B?TXl1MHM4YUdxK0trcDhKMVJyMk4ySTd0QnhiVkFVbDkxS0x2SVBId0F1US9x?=
 =?utf-8?B?Y2lPMjRwcWdsK09tTTZqeVZLbnMrVUIva3FHTlZZUlRUdzNyWFlFQ3ZucUh1?=
 =?utf-8?B?VkVUa1Y4S0FlMXJsRnM5K2VqT3NLanJFRE93d3pqb2txRTcxdTUyRmFsOGw4?=
 =?utf-8?B?T05WVkxlM0NrNTlybXZWb1o0c1dZNTNZL0MvZFFkdm9DQ1dSeTNkZTRyWU41?=
 =?utf-8?B?cHNuTWU4VzllTFZiZHVxRFRFM3NEWmhmM0VUTzI1RXhMRFlPRzBVSXJHQytC?=
 =?utf-8?B?NjdIZ1RzY0hFeXIrcHd4d2sxUzFWVVdhOWVaRWl6Q1JyUmV4ZXBsakkxbzRo?=
 =?utf-8?B?TEF0TDJUZWNzZDFjSzhJbWFoWXZraFkyWGM1Y0htTkF1YWhtdlpNcU54alhI?=
 =?utf-8?B?RkFXZVVoQjhXWWcvUFd3U01Gdno5U1lmSzlUc25PZUJFR0ZHV0xQTWdzYW1i?=
 =?utf-8?B?ckx0KzZIM1NXZnhSWUFxcThTQmcwbWRXSXZHYXAxRHMyekxhRmdtb21KK3ky?=
 =?utf-8?B?OFFWenNtSlUyL3BxZHIvUlY0VXFGUG5DQmRUUGxYL1U3azl5bDEycVo5ZEl5?=
 =?utf-8?B?NW1DalN2VmYzcmRXUXVGZVZyc2E0aVI3Z0Y2YUthczVJbnk3RjIzTEUwdjdz?=
 =?utf-8?B?S1p0NEhobGJnaWpQOXh3aXpCdzZpRWJFc2RYRHJQTG5GTkh0cHN5RDdGQytt?=
 =?utf-8?B?QmxKR0daL0pnN1hMcFdUbTgyQ2dJd1dZYXg3di9mMGFub2c2WUNyYnF3ekg2?=
 =?utf-8?B?eHhGU0U1VDVQVUMyMFlpVUgwRjVYTUpaT0Y2emdjUkhpQkJlcEFlcldVWC9n?=
 =?utf-8?B?bFRsU3dPZGVDRkRobjZMdjlvNE5MaUVWQmxwanQ2WXhoWHllRVRSd2hQVmdK?=
 =?utf-8?B?bjhuSnhWMXpUK3RKYmtlUzM5RldZMlBLQ2xXaHphZlpUYVBaWHo3bHhsZktW?=
 =?utf-8?B?aGdES2RLQ1ZwRGhzclhRVW9SVXRGRFpXV2xjd0ZRRGoyZWF4M2VGZk5Md1Bi?=
 =?utf-8?B?R1lhaEdoOGpzY2taaktrS28vc09SaDhFZUkvTnlWcDdjOXRtc3FHOHlRVTkx?=
 =?utf-8?B?VmJWTTFvdGNQdm8xeG90dmZOODBZVFk4Mk5TMUg1K1Q0d3JLcndBdGd4OHdQ?=
 =?utf-8?B?eVpjSnRaS1hZeGlEcmtCTUMxaWUrVnlHMGYycnlEK2J6OW4rRWxUM1NiMldj?=
 =?utf-8?B?NGhXNmd5MXBVWkVsQlY1WkVubi9reHdtQ2ltTzRoc25KRVI4bUtnVDhleElJ?=
 =?utf-8?B?MkJneTROOFVDamk1YkYveFZtVExTMGZjS3hsVWI2M3hDOEFmTk5IREVVTGxI?=
 =?utf-8?B?anlYZlZMdXVQUEdVUmlaQ0ptVkoxTFhYaXhNRm5GOVBSZ0YwU2xSeW1xZldO?=
 =?utf-8?B?WHl4RWtDK1FLa3E5cC9aaGpaRGFSUVVHbWdweFJYK0lwOEsyTTFBUytmZnN2?=
 =?utf-8?B?VHkxWFdRYkxmcVZEaDZ1YW11SHRGb3FCSWxZSURtbzlwM0hTMzVmRUdBaGhW?=
 =?utf-8?Q?BETA960ZLnmg4ZOQ=3D?=
X-Exchange-RoutingPolicyChecked: fvjuYS6lvoTIZzbnheDbarE6MTKJw3s1Xoeyqu7a0WUaWNmxj1YSdeoTDROPVJXRqx4OG39CnoWB0pN1oYePBNqKoqJ0pciRtdQNwRAW5RyLagGGz6hmQBZZK/cTayMT39r8u5zomBrB35ZgAILibJPlyJn9+OT9X58G6+swcXSpiNUABvsh5CMlDA54/ac9rmYDUb8h+9R4od61dEwPj9ZNHqqwktJelYKdICWS3k01Bcq/BpbfZavYYIDfzd6vyBnCrfmUOsAx3DVZJSAW49o4TD/0yKdAnYW1kyPdXc4IYYrGIOM4QIY0TJ+VVaCf1M+wEvzvM2GjrlC8KMIOrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7beed4-14d8-4b15-1a5b-08dec7c0d694
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 13:53:38.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABzAVYTFI2aQ/9dCxo7gZ0sK1m+siIcAugV/z3J3tExaY309Zlc5iEnu9VoUDxXWRvg6bkgZdFVM82UMhTAIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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

On Thu, Jun 11, 2026 at 09:42:01AM +0200, Thomas Hellström wrote:
> On Wed, 2026-06-10 at 08:37 -0700, Matthew Brost wrote:
> > On Wed, Jun 10, 2026 at 03:34:50PM +0200, Thomas Hellström wrote:
> > > Drivers that use the GPU SVM core to DMA-map system memory for GPU
> > > access may want to keep track of how many pages they have mapped,
> > > for
> > > example to expose statistics or to detect leaks. Doing this
> > > accounting
> > > in the driver around drm_gpusvm_get_pages() /
> > > drm_gpusvm_unmap_pages()
> > > is error prone: the number, order and kind of the dma_addr[]
> > > entries can
> > > change between map and unmap (migration, partial unmaps, the iova
> > > vs
> > > non-iova paths), which makes symmetric accounting hard to get
> > > right.
> > > 
> > > Add an optional @dma_map_account callback to struct drm_gpusvm_ops
> > > and
> > > invoke it once per &drm_pagemap_addr entry at the exact points
> > > where the
> > > entry is DMA-mapped (sign == +1) in drm_gpusvm_get_pages() and
> > > unmapped
> > > (sign == -1) in __drm_gpusvm_unmap_pages(). Since the map error
> > > path and
> > > every unmap/free path funnel through __drm_gpusvm_unmap_pages() for
> > > the
> > > entries that were actually mapped, the accounting is symmetric by
> > > construction. The callback receives the full &drm_pagemap_addr so
> > > the
> > > driver can use the order and the proto field to distinguish system
> > > memory mappings from device interconnect mappings.
> > > 
> > > The callback must also be usable by the core drm_gpusvm_pages-only
> > > API
> > > (mm == NULL), as used e.g. for userptr-style mappings. Relax
> > > drm_gpusvm_init() to allow such users to pass a restricted @ops
> > > that
> > > only implements the page-level hooks; the full-SVM hooks
> > > (@invalidate)
> > > and the chunk configuration must still be unset in that mode.
> > > 
> > > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_gpusvm.c | 17 +++++++++++++++--
> > 
> > I believe this makes sense and is useful for debugging/profiling —
> > the
> > same applies to the next patch.
> > 
> > I do have a question, though: drm_pagemap also performs DMA mapping
> > for
> > migrations. Should we include those in the accounting as well, or was
> > there a reason this was intentionally omitted?
> 
> SVM migration was initially intentionally omitted, because the primary
> intention here is to debug UMD size-aligning's influence on the number
> of 2M pages we get.
> 
> But for completeness before we merge this we might want to add the
> transient migration entries as well.
> 

This makes sense. However, one benefit of including transient DMA
mappings in the stats is that if we leak a DMA mapping, a warning will
appear when the driver is unloaded.

Either option works in my opinion, but if transient DMA mappings are
omitted, please mention this in the commit message letter.

So for this version /w an updated commit message:
Revieved-by: Matthew Brost <matthew.brost@intel.com.

> We might also want to add similar stats for the PPGTT PTE sizes.
>

Yes, that is probably a good idea but PPGTT is per-user/VM, so unsure if
global stats make sense there. IIRC at one point we had a patch to dump
VM's via debugfs, we could look at reviving that.

Matt
 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > >  include/drm/drm_gpusvm.h     | 19 +++++++++++++++++++
> > >  2 files changed, 34 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index 958cb605aedd..c18f15c77e94 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -393,8 +393,15 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > >  			return -EINVAL;
> > >  		mmgrab(mm);
> > >  	} else {
> > > -		/* No full SVM mode, only core drm_gpusvm_pages
> > > API. */
> > > -		if (ops || num_chunks || mm_range ||
> > > notifier_size)
> > > +		/*
> > > +		 * No full SVM mode, only core drm_gpusvm_pages
> > > API. A
> > > +		 * restricted @ops that only implements the page-
> > > level hooks
> > > +		 * (e.g. @dma_map_account) is allowed; the full-
> > > SVM hooks must
> > > +		 * not be set.
> > > +		 */
> > > +		if (num_chunks || mm_range || notifier_size)
> > > +			return -EINVAL;
> > > +		if (ops && ops->invalidate)
> > >  			return -EINVAL;
> > >  	}
> > >  
> > > @@ -1162,6 +1169,8 @@ static void __drm_gpusvm_unmap_pages(struct
> > > drm_gpusvm *gpusvm,
> > >  			else if (dpagemap && dpagemap->ops-
> > > >device_unmap)
> > >  				dpagemap->ops-
> > > >device_unmap(dpagemap,
> > >  							    dev,
> > > addr);
> > > +			if (gpusvm->ops && gpusvm->ops-
> > > >dma_map_account)
> > > +				gpusvm->ops-
> > > >dma_map_account(gpusvm, addr, -1);
> > >  			i += 1 << addr->order;
> > >  		}
> > >  
> > > @@ -1584,6 +1593,10 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > >  				(addr, DRM_INTERCONNECT_SYSTEM,
> > > order,
> > >  				 dma_dir);
> > >  		}
> > > +		if (gpusvm->ops && gpusvm->ops->dma_map_account)
> > > +			gpusvm->ops->dma_map_account(gpusvm,
> > > +						     &svm_pages-
> > > >dma_addr[j],
> > > +						     1);
> > >  		i += 1 << order;
> > >  		num_dma_mapped = i;
> > >  		flags.has_dma_mapping = true;
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 8a4d7134a9a7..87ad2dcaa7c4 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
> > >  	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > >  			   struct drm_gpusvm_notifier *notifier,
> > >  			   const struct mmu_notifier_range
> > > *mmu_range);
> > > +
> > > +	/**
> > > +	 * @dma_map_account: Account a DMA-mapping change
> > > (optional)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @addr: The address descriptor of the chunk being
> > > (un)mapped
> > > +	 * @sign: +1 when @addr has just been DMA-mapped, -1 when
> > > it is being
> > > +	 *        unmapped
> > > +	 *
> > > +	 * Called once per &drm_pagemap_addr entry, when the entry
> > > is
> > > +	 * DMA-mapped by drm_gpusvm_get_pages() (@sign == +1) and
> > > when it is
> > > +	 * unmapped (@sign == -1), so the driver can keep
> > > symmetric accounting
> > > +	 * of the pages it has mapped for GPU access. The @addr-
> > > >proto field
> > > +	 * can be used to distinguish system-memory mappings from
> > > device
> > > +	 * interconnect mappings. May be provided in both full SVM
> > > mode and the
> > > +	 * core drm_gpusvm_pages-only mode.
> > > +	 */
> > > +	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
> > > +				const struct drm_pagemap_addr
> > > *addr,
> > > +				int sign);
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.54.0
> > > 
