Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F738C25B79
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 10:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DB510EC4E;
	Thu, 16 May 2024 10:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Htd/OW0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE710EC4E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715854291; x=1747390291;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zs4kKzRXhEpoV4eI0El0hkNn814OgS7rJkzLAXMdB48=;
 b=Htd/OW0sGDtc/ZWIYSayh9sMYGkb2UE1V7/FdUeX60eJjNZdMZX/POvQ
 Ag6IjPBTo3wt+as9G1dh4GfXUGBcttHrttYWzP5Pedc8VhG29SK6R9IjP
 YnFTfPBNq3lBZffja9yA1GrYpg36+xPX7AsDaPBWYjfvK1IYtXxlzLLAB
 vzNrmpE7EbYERJfGvU79Yx/smIPCwapl9OCO56uiIuQubhVmCyzW3JF3z
 4jQDEkAyqUKkPcX3X54wPQPbbXr8xcEN7Onnzy3xFjJJXKDmYBSXXBTHz
 7vI8FA/w6AIzjaC6VKSg4Zxk0E+U8zVWwsCKdT+B1XMuuKmbar/MwF++w g==;
X-CSE-ConnectionGUID: 7QrpoxUDTUObBGbr9EoRWw==
X-CSE-MsgGUID: itR8ORS8Qfi0BdxRms9C7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23091643"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23091643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:11:31 -0700
X-CSE-ConnectionGUID: jHKXwk/ZTHusiP3IA+2qLQ==
X-CSE-MsgGUID: 3EA0d9ayTkKj92gbDYNOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="54587548"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 03:11:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 03:11:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 03:11:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 03:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlLt/qY0vUqrUM7CFte68Hs+xX5lYxcxXISCsOG0NkyqssmqmIi9OSD547xSOSia4KxUYPhtfYKYMMG8eA88O+LTz4dkEps20vwXZfKCBMMsVIkUAjDFIF5XRLRPpSMQs3L+Bnw6ov1oi+Qnjn98Fp6LKF1yUKG7bh6a1mjKq0jLXqL3umlG7H5L7l7JIq8IJY0PXYSWEeSD7ajupEFyhjVpXEmzv0wwkkpaN1hSUG65DmqD7QpQnTKZKYiOVniDVeoAZQANmAMw6Brmtl+z4D3zJbx7XfedZ5hyswq6xM3LiNn9cArAxrtuPCa8zOAEsxShhPLczABHBmepdY8jCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBxu98Cr/WA2ZVhh0+ZEpUmTMBRDs9zlrkhSNf0kYtI=;
 b=CzLvDd3Z4Wc9AAWzFR34lspCWq55vgKSklsogzQdCyFCXytthHX5PFlo5yenmstL3VD5ow39auQgkPmli7Zest0y8sPHktDNB3FSiuezlmXQwu+fztbS6MJESCdI/670su3uhwhux3fVJRLumSXMcEwqMwph8KQ2CzyiTT9YZunMEYeFDhT8NB0tG3uNGpyASfFF7IweXTi/xQXoOy2Qfkt5rRbGABOnTbsyhz6bX4wXfds5r8NSRs/c3SL7YDGq4ywNELio36SoIzkFYgMcdMhk/DDwc7SNQzeACcaSR2vtvf30RohHuHexxZpGdpqbEjQ0eloWxQzfUPPW7i4NLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 10:11:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 10:11:19 +0000
Date: Thu, 16 May 2024 12:11:16 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/vf: Custom hardware config load step if VF
Message-ID: <20240516101116.ugyoubng4e5ww3su@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512154915.2040-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a1f56a-5519-4b37-7adf-08dc7590879a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnY5Zkl2YXFTN1hGa1h3TXhyeC9kdDQzRzNPZU4xejcyNXBuUFRuSjNZT0Rn?=
 =?utf-8?B?akFSM1NRb1B2WGZzcHoyT1JZei9lWHovV3ovSVZ4b0VkTUQ1TjQvMVVGb1Iy?=
 =?utf-8?B?SXgyMi9KU3ZPTUR5Yk9BYVozU1VFdm9mcFFqcU9NQXY3SlcvU0E3T3FISmU2?=
 =?utf-8?B?YTJlU1pEWFpONitOemQyMVQrUUE3S3FldFp1THBaUEszcHRWUjBWcnEvcXNZ?=
 =?utf-8?B?TjQrZXc4MU5qaFA3U2ZnaCtSWmFWeWpFekcxaVRheWVEZy91VUlhRkVYS3Fq?=
 =?utf-8?B?ODZ6QXdpa1lOK1pjUVNrbWtybkRVZ0E4Y3VKdUsraHhhNHNqcms1Q2dLQjJC?=
 =?utf-8?B?WnB3dU16ZHhuMEozU0pzdDdmUERnWVhlTkJjMXBvYytSUUlUVVpZWTdDdnI5?=
 =?utf-8?B?SDZybExLR3NEU2ZFRTNlZDc0bERsenAxMkhscEZXbGY1cXUwNFZVNWgwSUlB?=
 =?utf-8?B?QkxyamJQdU5RblN1bys3K1FJalh1NlNpazNLZ2FwYmo4VDFBTDc2dXd2Qnhj?=
 =?utf-8?B?V1dVRXJqM3dDMGR3bGVpNG9jbkxpOXExZm1JYWFCZUJzT1VDRkc3VHFud3FR?=
 =?utf-8?B?SFJ3UmRId3hKMmFsL3l0ZnRCUzBxMDl5ZWVQLzF6cXZIQ3BxNkpldUFic2d3?=
 =?utf-8?B?bUpvUDN0UzM3MUVXQUpQU29TYW9aU0thQ1A1bE5EWHZMSHJUcEV4N0xhTzJF?=
 =?utf-8?B?ZGhhU0dMUXExdkc0bTVLbmkyVXN3L2lUZTR0Nm1ZK1lQazEvY21CeVNrbnNO?=
 =?utf-8?B?Um1iVzVvdXYyaUUraDkvZ050U09hY3VqL3pGYVVEV3d4RnhRKzUzSEVoemdI?=
 =?utf-8?B?Qkx4N21XYkM1K1g3a1ZIa3pvc3Q5ZkNCU3A3L0tGRkk2aFp2d0hSSVNBVHk1?=
 =?utf-8?B?NTRXTzAxa2QyYTJXS3ZkdmlyZW9wRStMbnNXLyt1KzV1US9mc0xmczl5cW9n?=
 =?utf-8?B?QklsMXIvKzdIMi9rM0VPcHVQOE1CTnNLWEd6L0E5QUMzRlJId0RKZGNQaTZy?=
 =?utf-8?B?eDk4NWpKYVFManc1bnpsVFhRR2lYRWRnVXRESkFtOHIwR25xNGNITElKNkJC?=
 =?utf-8?B?cGV3eGFzYU9KUVBHd3FmSm5ZeGxhMndXSFVaQktDaVAvRDJRWDRJbEZPazBm?=
 =?utf-8?B?RmROWERVM0lYclVSQmp5VTErcUFNUjBUdkluNllITy9tWWZLM2h2SnA0bHNq?=
 =?utf-8?B?MlJ0aWJsSDVtOUN6UVJZQ3UyNENkOHZlVTNkdFM0L2ZSS0JVKzJWQjVIZ2ti?=
 =?utf-8?B?bXlPc3JpVFhhdit6K3pHbHc3SEREZmZxWVplMGtIUG1vWjFza0JaaWwwN0Nq?=
 =?utf-8?B?WCtSUWVqZkZENm1HTmZoMEZjSXdwdTkwNEljSVBTMFVjMmFGTDN0dW4zcGx0?=
 =?utf-8?B?ejJpZC83L1owODJIaU5yaksrWEQvdWNCME1hZDNrUzhrcTM0aUFIQzNwTnZ2?=
 =?utf-8?B?ZVB1YVpEbk1MNHhNSm9sNm02R0E4cEtMTWtNWFY2VG5DRzlHUFhiRkhSSitF?=
 =?utf-8?B?VGFMSmZxc0lxVWVRVHN2RjZFU05vZnBIYnQ4YW1BNndhbjg0Tk1KSjUzSC83?=
 =?utf-8?B?TytubUZZUkpodTJ4d1FtcXdxY2hCNVF2QS9uSFpJUVVEaG42SVY3TE9RU3FU?=
 =?utf-8?B?eGNVZGtwb1ZyZ1kyRHhCUi96Y0hPN0RpMGlEYUUwMG4wUnBoYVVVNFYyMDdt?=
 =?utf-8?B?TlJ0YXR3eGpEbmZFdS9pUVlYWGJSRUFjMll1OVlZOWpZajdDNENQYU1RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJOUnU4ay9tblFZMnlZRk5zNU8vQkJwYTFxUUM2TjNhcmhHa3hWRDNyTTlm?=
 =?utf-8?B?clFvR0xmTEdZVWRLTmJ2WjNUQ1EwQlRyYzR1dWM3VzgyeGxkNlA3MGNpdUdy?=
 =?utf-8?B?VkFidER0QmdFSEpERmxlVElHdGpLVTY4dzlHTUVhLzZUaExzS3hyUWZOSkVI?=
 =?utf-8?B?MTdEbDBRUStXV0FGaWNoZ0lNcks5UEFLMGkzTVBCNXhmT3dzWkowZGZNdGxJ?=
 =?utf-8?B?STZmeFplbCtuM3BvaW9LL1F6ek5HeVNDNXhxUFErNEh1WkdxeGdIcXNQNlBh?=
 =?utf-8?B?bUIySXE4bVBkWWlOVWQxTElOWmJ1TFRoUmQ4MHRJb1RMZ0dCMk9nVDB1SmMr?=
 =?utf-8?B?d3FUamg5NDVDRXpTZ3VzZG9aNTdJeHhMdkRyODJ2T1F1RERTMkczL0pqYjVr?=
 =?utf-8?B?bTc1Y29ZeDVaa2tCOWNvclIwakd2alpuVVNuZ2REdFhRV0RpcEtlMmxMYlRz?=
 =?utf-8?B?dUl1QmVjVGpiY1JGaloybmh6Y2tocENVL1UwMlF5VW9GdzNNdHNpOTB0L05Z?=
 =?utf-8?B?UFoxazRPeUVFT0JscXorMTBTTVEyNTZtY1l6RlpCaGk5U2Z0eGI4UmVIeGtO?=
 =?utf-8?B?dGR6N2lNbW1oREdTdGJxc0Q1QnpCWlJFVkt2TkFCQmxMcndwMitjRlpWNklZ?=
 =?utf-8?B?WUkyMjJQbjczVlhoa0Zaci96N09MdDNVOW5pS2J0RUZSNzQ5NXJjMGhPaUJI?=
 =?utf-8?B?L2JVeVNhWHVDeEJsNDRiSUVORnd5SUQrTTZidjBNdzB4VFVFYnc5ZXI5NUh2?=
 =?utf-8?B?MEZudUxLQkk1ZVdlbjVkV3NPdnRqcUhzbTd2SmJFZmpJRlBuT2lybklXemZX?=
 =?utf-8?B?QzNab3VBL3dNUHJxTUV3Qjc3QWp5amwxMFN3ejE2RHVvclVabEpTczFoTHBP?=
 =?utf-8?B?R3Q5K0dqQVVkK1hueXlIMERnNENWVlhtc2lHUUY1b1NHNzdBVlh3dDFtRHdl?=
 =?utf-8?B?eHhSVVRIbHFzZHl3bWdqdlF4aWR4OWNuQ0hDYlRLZzZKRUs0T0RWaEh2Q21j?=
 =?utf-8?B?eHQ0YTJTTWY0WmYyY0J3Qjkwa0hPTlZ2T2xFenJ5VW9EKy84d2padC9kelYv?=
 =?utf-8?B?UndiSEhTYk4wckZBc0NUWGxRdWptSk5uMlVwczMxbG5xNXBaOWszNWlVQldT?=
 =?utf-8?B?VVhOL1lNRDVnQ0Z5eSthbXAwOFdqb3I2RktlZ21XUGd1Y3k3SXc5Vld2Qmly?=
 =?utf-8?B?UzdvQVNxblI0SWR5bEU5UUVhMXp0MFZvaGh5UDNkazdPUkN3N2FUT0dxcXB1?=
 =?utf-8?B?ZC9yMk9YWkZOcXpOVWxldVJnOVgzL3RodGZUVU5zaWV6UzhaWkpVL1FGbGdt?=
 =?utf-8?B?d3RHYk1QWlMrSFh1dGVFajZXOHRBa2Q2YlFrQUdyR2tySnFKK3dHclJaSTZx?=
 =?utf-8?B?L0lDNDdld3VyWmdtWDFmT2RKNU9KUDVBMmVOcFJSQmIwOXdYWC9ma1hSTUtT?=
 =?utf-8?B?ekFNTjJPeHZNS3dBd3JWdW91QXdoQnRpMWVoU21nMTl0dWhMdjl1SHBzaHlL?=
 =?utf-8?B?Y05pOGpTdCtwOVYzcUhiTldKK1hHc3N1SzFxRHo1ZmM5SG0rcXNYdE9yUnlL?=
 =?utf-8?B?TlRFM2JZcGUxT1Q0TWUrdE5SclhBYnlScll5ckJFaVZrM2h1aENzWmNXMWxi?=
 =?utf-8?B?bGFHQzV4dlplNVpNS2Y0aitsbDlBUzBSQlpCUmwrSXhBcFRyT3hsT0cvSHpQ?=
 =?utf-8?B?Zmhnb2xFRkVzQXp0a1JjVWt2eXJYZVJsRzR6ZnFJT2NQSnRmR2FldGwweUNy?=
 =?utf-8?B?U21paTE1WVFPVUcxVWhtWnpFZE5yV0NaVmNFL0R4U3VCVzFXNXl0bWJOTGtE?=
 =?utf-8?B?VERBbnpJYlNieHRtVEkvOXN2RHJtS0NOVDI5VDFndWlkU09HRkk3KzZHRzhl?=
 =?utf-8?B?WkFzbWtmZkdLc3UveTV6dG94RkJRbEIwWnNYSHZNOFdWTkZmaFJjZXFJMTNw?=
 =?utf-8?B?emdtRjJjNVZYV0NoR0hmSXhNWk1NUWhXNVE5T0hCb2FvR2gzMmxSWUdwalll?=
 =?utf-8?B?enViOVd5K000YXFoaVBWc05aT2prV1hYdEdWa3RVNmtyL2tCR0NsU2pyMVN6?=
 =?utf-8?B?SE9JRWo3WEV3YUY5R0NEOS84bFpuVFBjMlF6c2R1MTc0M0hNcEd2OW0yd3da?=
 =?utf-8?B?SkFZUlc2Uk9pYXpEK0ExZmFuMUtia3hadnRNZmpNQWpFTTMzT2gxQ2R1N2M5?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a1f56a-5519-4b37-7adf-08dc7590879a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:11:19.1442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VqPjikpBIVmGKRxwuYuDTl2DOqwwuiE2eZfjDfMLfGgFah4e8pr/esohz2ZRtxCpFQuGEw4yr12D/JA/vMd0kncwomZNc9XFfzrX4Csjts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:14 +0200]:
> The VF drivers may immediately communicate with the GuC to obtain
> the hardware config since the firmware shall already be running.
> 
> With the GuC communication established, VFs can also obtain the
> values of the runtime registers (fuses) from the PF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0c9938e0ab8c..762fab403b86 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -19,6 +19,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ads.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_hwconfig.h"
> @@ -538,6 +539,38 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  	return 0	/* FIXME: ret, don't want to stop load currently */;
>  }
>  
> +static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	int ret;
> +
> +	ret = xe_gt_sriov_vf_bootstrap(gt);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_gt_sriov_vf_query_config(gt);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_hwconfig_init(guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_enable_communication(guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_gt_sriov_vf_connect(gt);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_gt_sriov_vf_query_runtime(gt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_min_load_for_hwconfig - load minimal GuC and read hwconfig table
>   * @guc: The GuC object
> @@ -553,6 +586,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return vf_guc_min_load_for_hwconfig(guc);
> +
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
>  	/* Raise GT freq to speed up HuC/GuC load */

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
