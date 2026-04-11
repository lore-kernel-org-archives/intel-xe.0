Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804FF45A12
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 01:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EFE10E03D;
	Sat, 11 Apr 2026 01:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXwHdp9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DC710E13E
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 01:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775872642; x=1807408642;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A0cYQwMTo843elixX8BPpfyF7JGuhhXWt35f61pg7I8=;
 b=ZXwHdp9jClCM1bH2DZMIhrIE9TACaVj0YZjL/yeRYlJiidb8S0DhwNvo
 wNVoaAnYPA8TTS+ZmUKjtwdljdeG37UQLho9399IRSKnVIBRjcZR3259c
 wDjukBPeR54MSGBC5fOjX7pDRwiY0oGnbY/ArC1Ro7oxsJ1CidpFKRijR
 OoXGpmhjFRTtGpZRzuVkts6/JPv7JS8arXiVrD8XcLcLEn41X8vRjv2yA
 y5X2bcEMfNk7RtPGgFyYazeY4m6w4DEkhYXxaQb6L/8c8Rw8wWCORAed/
 FG1xF44O9Lle7jkPWOWlfdRC13iOvY2WwVu0DqAeMTq757XjZvQzHqeXo w==;
X-CSE-ConnectionGUID: Vq3ZtWm8QvGbyDWil8F+MQ==
X-CSE-MsgGUID: LlEJROmrQ+icRDNHOTNAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102353410"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="102353410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:57:21 -0700
X-CSE-ConnectionGUID: HgmqJ2xzSi6+EC2oeqrY2g==
X-CSE-MsgGUID: NectNAAARoO7XyxbSentPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="222767838"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:57:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:57:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 18:57:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZecBz23KYaw/hMauiHasSzBG0gJBJgomGVDlE4roR9i/CBIRmszqae/znOk1frdl3uMjZZ/uESnF0vdGa2T2jy3VTuYnIIQwOet9YUqaM6HDmP6h2h0gFrhXQ6MwLG5MFT/gQhk2jT8wvWDsBm5yF8EALPDti0X5TSdFXpy9I1KeBHpJYnv2Fn91D3gaf6TkxxOMnktayOIHkYczuERxNusUgMt3GdEKlBMLhplK27JYc1GrnZjOHdkriX3sNnzePI5M8ghbbyuMpP+jhiJZhSip24eq5orePoGXZV/ej/4Zl9JM/FJIKzJ50djK8sBfstkJbI0LnZdKLELyAGIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXq0L/7pA+GnpyPdTMxH0V3efAC2+iPcpH2+mDJ4zmg=;
 b=S5r12sx+bzJuA7PBbDsBi/0GRVbw+icUjn3/NW4t2ww2M7n43Vw2fSBRi94h3B5tVmrvZQuixePS2buGjFv0QUGQj7PqS/PZq8N/BnO6AjwTB+FHyhI/q7jbLzbrk5hDEJDEFkaOBldYsIEOuykzI8nw0QGN+Wj33wavyr4zl6lPcI8Y/r0IXQXfAES9twspqw4bL9RS4eA9yWhuBCM/xBp2DVkOAPCbSmy5sRX/97aoibxSbdBWgF0FPRBBWsvGeesuzVBvi3mEU8sYoBvrk2PsevFFvz43jtMKsFB0Utrr4LJsJRZzt0ojTr0q1kXv+pJspCXk52spkBcuQtweqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 01:57:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 01:57:12 +0000
Date: Fri, 10 Apr 2026 18:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Convert stolen memory over to ttm_range_manager
Message-ID: <admqdKYQRACRj2mf@gsse-cloud1.jf.intel.com>
References: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
 <admhoW9DCLOWbwpN@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <admhoW9DCLOWbwpN@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: aba60a3d-e400-4864-3cfb-08de976da58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: KbsmR4J66fQ4v/dZ1UaYlZMvnGZqfVNbMSeQLgxts9PG3V3/SC9UodRsE5P07eumaZomIM6/tQMlTPG8vVsYTZz5zM/hXEGNvDE9+dAfixSUwqhwWUK9VFC+veo2RXXOQBA+brFdH3scqLkulOnjySM6dIgC9UEYx9vR0B1gRS/5vsf/vIC0KzFZ9oxkCSrCTzNg4zwbATevkeflXivddbNwAg0MKNc7bquQpEivzujq1p/zMuraZ9YqeaYJFjATYYN0728eaCeJM5zH9aNPgA8YStV3fYHhr1mH2RsREA6gIphpM69ADAI2n6CnQfJ0MV4npgzufr8HmA4+hDf6ti45qCS5GFCGlESrVH81itMLTmjBzfLQgi6UKFLhEld75Zr1LLPS/X/e27D57gL+rtK8MDMF4sGhjuCtmcI6QRX6gOUIxwb0JIAek4pZwFzV0eKAJK4OBBXLGx0KDs/9NoR+BxmThUzic7ZGJ7aFnLHODyYBkRnDmNI+CXg/Y/aSrYNtvErUm7O6mUYfe4p53E8alpTN2CRh5xN1n1V4q/HmEKKyo4t+C+zHPhuH/sabRGZTXuHijsusfzpilwYEILnIzDSogszcdXLLle63TMfjAFLby/JA+tcY+1J+YkA4fuEuqoHil3ccuLH8l7cPcNfE44UFdDGEw/iiQ4VxswfIHVVr0Wu7eulPYZqZARGA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtmTzlmVVZETGVMQTFHdzZ4UGxDVEV3aEJZYlV4ZFV5UndoY2dGTkdRMDJz?=
 =?utf-8?B?cksrYXpvY01xUUE3dzFjNWxVQkViRUQ2dmFTOFhVenNKWFhJKzhkU1lkcHNh?=
 =?utf-8?B?bDRZc3NJd2QzWGZ2OVZGM3NBK05MMUZmb0N2MkNFVGxCUk9GNWpUZUhPSk5S?=
 =?utf-8?B?VnFLVFVCYmpCOFhJTmsxcjZVTzBMNzE3TUpYbjREWjRuTEthZEhOTXlEYVQ2?=
 =?utf-8?B?QmdKYzk1NTMvTm5pMHF5azBwVUx0OU1OMU8waVdGR3BSS0lMR0RxZ3lRVXBy?=
 =?utf-8?B?QjkwajlQOXNXUSttSmhGUjF5dFJLZW9Xd2ZuMDlWVEtwTThqL2k4TXZNUEho?=
 =?utf-8?B?NmZsZ0o4d2ZmMm5MaVpTWHNZWVRxUlBGNGtwRGdtRnhHemRaMGtLN29WazB4?=
 =?utf-8?B?YmJqU0xYWmhVWEx2OVl4d3pWZkplT3N5SERIYlFrWXFXS0lHODBFTVpSSHNK?=
 =?utf-8?B?K0wrV200KzdWQjNyM2Y3ZU5vMVJmUmlnZTlzSWJVcG9PM0QwV0JhZzVWaWhm?=
 =?utf-8?B?aFdZd1FYOGdYZTVPSHBId3Y2QmZpMXB0RC9JWUFXQnk3Z0RkY3VKcTB3TEx3?=
 =?utf-8?B?Y2J2dWdvSjFTNS9HVkQrNmZyQ2dQMStReTV5cDdlbDcwUXVZN25uUHp2VGpZ?=
 =?utf-8?B?VXQ0WUVEWmdsMnp1MTFhTHBTQ24rRHhGTXFCVEJjVU5TWHFVSGhVSXdxR1dM?=
 =?utf-8?B?U21oTFRaaGNDWmdlditBbDcyZm1LK2pCR0ludG9BeTg0eVE2UnRNVDZnemQr?=
 =?utf-8?B?eEtIOWNRUmk1bWluZHJzWWlxZWk2cElvMnpNZitnbjVBZ0lrYlJIMkRUSGlR?=
 =?utf-8?B?cjRWcFNSZll0QUNNM1pDdjYxNDloSEVySEhXNlpuUlN5Y1c1VjZCNHRDUTFq?=
 =?utf-8?B?Y2J0SWVDS3JBWks3VEgyVDQ5KytBT1BhSmY1Z3QyZ2tHZ1Z2K3hJQXErWGxh?=
 =?utf-8?B?REdEa0JScEFyeEZDQ0VqVjJjeXpOUTJ3bm96T1dWSGJKeGpEdVU5b3ZVdTdB?=
 =?utf-8?B?bzZIRlRsbXh5OW8rMVpFdVJ6TVdnM2x5ZUp6bTdoMHF4VWJLeHIxZjlRaU9Y?=
 =?utf-8?B?UktWMDBka2JBWmxPcXFwTm1hQW5sckpJcWl6cW9PNXZsU3d3NTBZWjhkY25n?=
 =?utf-8?B?U1lkenVmekZIVE1oRDVrYmtyY3dOVURLT0Q2ZlVzbmxNZjRwaDdrckNweVZh?=
 =?utf-8?B?NEc2SW5LcThad2JjZ1JSNmtWODc2MThrZVRlS3dwaDJPaFpSUVp2b2dEZFl5?=
 =?utf-8?B?eWdRVlBvWTBkZnJkT091em1KM1Y2NVgreEdaS0dyWEtxVktsQ2NtQWFleXF2?=
 =?utf-8?B?b2xvQXlFS3NVZmdCQ2JuOG9HTUFtQVhQOXZiNXJIeGt1cWhZanBsMHYwRzhB?=
 =?utf-8?B?SmNhR0RxWHFiSC9aV1d1czNkZERSeDd2K2JEUmdlWUtEN3pvSm4yb1EySDlM?=
 =?utf-8?B?b1Z1RGtqUkViRDdjV1VnTzRJNDdMKysvTmxMR21xeUw4QmRib1pHeTNsNGg1?=
 =?utf-8?B?aFBWVC9vUnp6YVpwNWlpWHZ2a3RKbXgxbGRBamFKSytabTVFYjRiMDEydkpx?=
 =?utf-8?B?bDJCOGJnTVZvU3FpMmtsNWk5ZzNBcEl1b3daQUpmdVhHRXVOS2VnbkpDQVFk?=
 =?utf-8?B?dGp3YXJteWVkQjRHZUdNS1prWXFiZjJ4aUR1RFpJNzlWZ25ZeG9qWWVyUDZZ?=
 =?utf-8?B?MXNPVEU5cVVDdDEzUmZNVndFRlVyeXRQdVY5eWxGV3ZNTW55TWNtNy92Sko3?=
 =?utf-8?B?YXlmYnhRTFJWckp2c0NIZC9Sc3FxMk96SVdDcnU4N1RxWkREZmYzUUZEb2tu?=
 =?utf-8?B?STZib2trcHNtS1VEcG40ak1mVUxYRi85ZUFMemZhVEJZNWJ1V1E3U1dnTVU1?=
 =?utf-8?B?dEZoSXFKUmM0b1VzcGh2ZXpSSzE0UjluK1dFZHZoSmhpdWc5R3pubnVscnlV?=
 =?utf-8?B?WVpjWkZLelZLN3VxY0trK2tnZFo2RnY1Vk1LZXNjZGNadGdiZWVtcmVBWVRC?=
 =?utf-8?B?b3VtbFk2Ykg5azM4ZHNIbG5zTnBKdC9TUlo0TTV6ZGlDdTB0OFgvcSt2Mndi?=
 =?utf-8?B?SVp6UE5MNzJnbmNlNWJlUjJYWi91MHpPSHREa2JuQWY1SmJXNjcxd0hRemZt?=
 =?utf-8?B?VmlaOGVXWVB3WXZjVFJZOTMwRGhiQ3JRUmJIWS92M3pkM0FNVllnMEs3VS9s?=
 =?utf-8?B?ZzIzbWlaa056clNXWURuTzZrUFRSRDN1VlAwQ3dRSGhiYnlhbUEvSXZVY2cx?=
 =?utf-8?B?ZEJ6OGIvL1RuN3M2NTZIWXlsOTZUaU5neEFvWit4U01JS1Raa2k1SnFOZFda?=
 =?utf-8?B?VXRoaFU5Z1BwWkRxZExJR25TUHQwZDVTOUJXeUdMUkw5VTFDT1BVSEU0emNr?=
 =?utf-8?Q?9UeOstcqVZqwn7KY=3D?=
X-Exchange-RoutingPolicyChecked: gFTfWGDXAd/xao/3tTPyNg/CdP6p455WYqgtP3XIIU/kYwHO2JiVQNnYqX56UjJRJnt3cK++jo4ijfomusUHXOrH8aX8br4Y47ozB1vjzn4ZrzWaBMJfjaIUn+z4orVwQe7lXGceUOEB/jEMMZqw99ZwVFUeBj8ehH15gxXBjCltbv9bRBz0GKqrXboklvmCZFc9bhpdFAXt8Heiymk+r5RHCybEuas4X+wcvbEJ2lvpbFBrrCQBoVH3ABj0NSlsa3ZjQi6CeuM/Arn+8YyNAXQJvSJZ+UeP8HGS248qhpbw8oAuwVQWUjJHZ82V1Xpw4L48oq42ERpHQCvq8jxvUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: aba60a3d-e400-4864-3cfb-08de976da58f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 01:57:12.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyHlK3CcyyymnJR/ZER2MhV7xib/ujLrdmZLIAzC7v0GmAzhICJT5vjKeV6gk6KWIcfq02hT2BNW3klGEZ8Egw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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

On Fri, Apr 10, 2026 at 06:19:29PM -0700, Matthew Brost wrote:
> On Fri, Apr 10, 2026 at 05:36:02PM +0530, Sanjay Yadav wrote:
> > The stolen memory manager was sharing the gpu_buddy allocator backend
> > with the VRAM manager. However, stolen memory has fundamentally
> > different allocation patterns that make the buddy allocator a poor fit.
> > 
> > - Allocation sizes are not power-of-two. Since buddy rounds up to the
> >   next power-of-two block size, a ~17MB request can fail even with
> >   ~22MB free, because the free space is fragmented across non-fitting
> >   power-of-two blocks.
> 
> 
> This sounds like a problem in the buddy allocator, right?
> 
> Shouldn’t the buddy, in this case, try to find enough blocks for 16MB
> and then 1MB?
> 
> Regardless of fragmentation, the buddy allocator should always be able
> to construct the blocks in your example—unless I’m completely missing
> something.
> 
> Matt Auld is an expert; maybe he can chime in.
> 
> > - Hardware restrictions prevent using the first 4K page of stolen for
> >   certain allocations (e.g., FBC). The display code sets fpfn=1 to
> >   enforce this, but when fpfn != 0, gpu_buddy enables
> >   GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
> >   coalescing path, further reducing allocation success.
> 
> Can we not just allocate a dummy allocation on stolen manager init which
> reserves fpfn=0? Then release it on fini? Then display can safely pass in
> fpfn=0?
> 
> > 
> > This combination caused FBC compressed framebuffer (CFB) allocation
> > failures on platforms like NVL/PTL. In case of NVL where stolen memory
> > is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
> > leaving ~22MB for subsequent allocations.
> > 
> > Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
> 
> Wouldn't drm_mm just have different set of fragmentation problems?
> 
> Simple example: We have 20M.
> 
> node[0] = alloc(5M);	/* this lands on 0-5M) */
> node[1] = alloc(5M);	/* this lands on 5-10M) */
> node[2] = alloc(5M);	/* this lands on 10M-15M) */
> node[3] = alloc(5M);	/* this lands on 15M-20M) */
> 
> free(node[1]);
> free(node[3]);
> 
> /* Now we have 10M free at 5-10M, 15M-20M */
> 
> node[4] = alloc(6M);	/* We fail as no 6M hole */
> 
> Matt
> 
> > manager for stolen memory. This reuses the TTM core's ttm_range_manager
> > callbacks, avoiding duplicate implementations.
> > 
> > Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
> > contiguous free hole after initial plane framebuffer allocation, and
> > FBC successfully allocates its CFB from that region. The corresponding
> > IGT was previously skipped and now passes.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631

I just read the above link. My initial response was based on a
misunderstanding: I did not realize that stolen memory generally
requires contiguous allocations, as this was not mentioned in the commit
message. Please add this clarification.

Assuming stolen memory does indeed require contiguous allocations, then
the buddy allocator is, in fact, a very poor fit.

I glanced at the code itself, and it looks sane enough. However, we
should first align on the requirements for the stolen memory manager.

Matt

> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c             | 12 +++++-
> >  drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
> >  drivers/gpu/drm/xe/xe_res_cursor.h     | 14 ++++++-
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 55 +++++++++++---------------
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 +++---
> >  5 files changed, 53 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index a7c2dc7f224c..cf22cf8ff9f0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -601,9 +601,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> >  
> >  static bool xe_ttm_resource_visible(struct ttm_resource *mem)
> >  {
> > -	struct xe_ttm_vram_mgr_resource *vres =
> > -		to_xe_ttm_vram_mgr_resource(mem);
> > +	struct xe_ttm_vram_mgr_resource *vres;
> >  
> > +	/*
> > +	 * Stolen uses a range allocator (not buddy) and doesn't track
> > +	 * used_visible_size like VRAM.  Actual CPU accessibility is
> > +	 * gated by io_base in xe_ttm_stolen_io_mem_reserve().
> > +	 */
> > +	if (mem->mem_type == XE_PL_STOLEN)
> > +		return true;
> > +
> > +	vres = to_xe_ttm_vram_mgr_resource(mem);
> >  	return vres->used_visible_size == mem->size;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 150c76b2acaf..ffb84659c413 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -42,6 +42,7 @@ struct xe_ggtt;
> >  struct xe_i2c;
> >  struct xe_pat_ops;
> >  struct xe_pxp;
> > +struct xe_ttm_stolen_mgr;
> >  struct xe_vram_region;
> >  
> >  /**
> > @@ -278,6 +279,8 @@ struct xe_device {
> >  		struct ttm_resource_manager sys_mgr;
> >  		/** @mem.sys_mgr: system memory shrinker. */
> >  		struct xe_shrinker *shrinker;
> > +		/** @mem.stolen_mgr: stolen memory manager. */
> > +		struct xe_ttm_stolen_mgr *stolen_mgr;
> >  	} mem;
> >  
> >  	/** @sriov: device level virtualization data */
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index 5f4ab08c0686..0522caafd89d 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
> >  	cur->mem_type = res->mem_type;
> >  
> >  	switch (cur->mem_type) {
> > -	case XE_PL_STOLEN:
> > +	case XE_PL_STOLEN: {
> > +		/* res->start is in pages (ttm_range_manager). */
> > +		cur->start = (res->start << PAGE_SHIFT) + start;
> > +		cur->size = size;
> > +		cur->remaining = size;
> > +		cur->node = NULL;
> > +		cur->mm = NULL;
> > +		break;
> > +	}
> >  	case XE_PL_VRAM0:
> >  	case XE_PL_VRAM1: {
> >  		struct gpu_buddy_block *block;
> > @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
> >  
> >  	switch (cur->mem_type) {
> >  	case XE_PL_STOLEN:
> > +		/* Just advance within the contiguous region. */
> > +		cur->start += size;
> > +		cur->size = cur->remaining;
> > +		break;
> >  	case XE_PL_VRAM0:
> >  	case XE_PL_VRAM1:
> >  		start = size - cur->size;
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 27c9d72222cf..7e204d5e9cbe 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -19,16 +19,12 @@
> >  #include "xe_device.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_mmio.h"
> > -#include "xe_res_cursor.h"
> >  #include "xe_sriov.h"
> >  #include "xe_ttm_stolen_mgr.h"
> > -#include "xe_ttm_vram_mgr.h"
> >  #include "xe_vram.h"
> >  #include "xe_wa.h"
> >  
> >  struct xe_ttm_stolen_mgr {
> > -	struct xe_ttm_vram_mgr base;
> > -
> >  	/* PCI base offset */
> >  	resource_size_t io_base;
> >  	/* GPU base offset */
> > @@ -37,12 +33,6 @@ struct xe_ttm_stolen_mgr {
> >  	void __iomem *mapping;
> >  };
> >  
> > -static inline struct xe_ttm_stolen_mgr *
> > -to_stolen_mgr(struct ttm_resource_manager *man)
> > -{
> > -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
> > -}
> > -
> >  /**
> >   * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
> >   * stolen, can we then fallback to mapping through the GGTT.
> > @@ -210,12 +200,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> >  #endif
> >  }
> >  
> > +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +
> > +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
> > +}
> > +
> >  int xe_ttm_stolen_mgr_init(struct xe_device *xe)
> >  {
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	struct xe_ttm_stolen_mgr *mgr;
> >  	u64 stolen_size, io_size;
> > -	int err;
> > +	int ret;
> >  
> >  	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
> >  	if (!mgr)
> > @@ -244,12 +241,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
> >  	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> >  		io_size = stolen_size;
> >  
> > -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> > -				     io_size, PAGE_SIZE);
> > -	if (err) {
> > -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> > -		return err;
> > -	}
> > +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
> > +					 stolen_size >> PAGE_SHIFT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe->mem.stolen_mgr = mgr;
> >  
> >  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
> >  		    stolen_size);
> > @@ -257,36 +254,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
> >  	if (io_size)
> >  		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
> >  
> > -	return 0;
> > +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
> >  }
> >  
> >  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> >  {
> >  	struct xe_device *xe = xe_bo_device(bo);
> > -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
> > -	struct xe_res_cursor cur;
> > +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
> >  
> >  	XE_WARN_ON(!mgr->io_base);
> >  
> >  	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> >  		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
> >  
> > -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
> > -	return mgr->io_base + cur.start;
> > +	/* Range allocator: res->start is in pages. */
> > +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
> >  }
> >  
> >  static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
> >  					       struct xe_ttm_stolen_mgr *mgr,
> >  					       struct ttm_resource *mem)
> >  {
> > -	struct xe_res_cursor cur;
> > -
> >  	if (!mgr->io_base)
> >  		return -EIO;
> >  
> > -	xe_res_first(mem, 0, 4096, &cur);
> > -	mem->bus.offset = cur.start;
> > +	/* Range allocator always produces contiguous allocations. */
> > +	mem->bus.offset = mem->start << PAGE_SHIFT;
> >  
> >  	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
> >  
> > @@ -329,8 +322,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
> >  
> >  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
> >  {
> > -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
> > +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
> >  
> >  	if (!mgr || !mgr->io_base)
> >  		return -EIO;
> > @@ -343,8 +335,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
> >  
> >  u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
> >  {
> > -	struct xe_ttm_stolen_mgr *mgr =
> > -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
> > -
> > -	return mgr->stolen_base;
> > +	return xe->mem.stolen_mgr->stolen_base;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 5fd0d5506a7e..79ef8e1b5e5c 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> >  			   u64 default_page_size)
> >  {
> >  	struct ttm_resource_manager *man = &mgr->manager;
> > +	const char *name;
> >  	int err;
> >  
> > -	if (mem_type != XE_PL_STOLEN) {
> > -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> > -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> > -		if (IS_ERR(man->cg))
> > -			return PTR_ERR(man->cg);
> > -	}
> > +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> > +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> > +	if (IS_ERR(man->cg))
> > +		return PTR_ERR(man->cg);
> >  
> >  	man->func = &xe_ttm_vram_mgr_func;
> >  	mgr->mem_type = mem_type;
> > -- 
> > 2.52.0
> > 
