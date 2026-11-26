Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fb51/Y/P;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JJ6tcMS7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC301121B6;
	Thu, 26 Nov 2026 09:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EA81121B6
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795684407; x=1827220407;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=9jkiphkb2jqP/4/RX7Dr21LJY7KXOq/WL7hjYRNlzSA=;
 b=fb51/Y/PgQhiR2tj2DoI/OVUYfAL4LJcx/DvTC8DeJZdCOKvxGMzcEJ5
 K/OVpgOQUoWczUSH6dRb+a6u2ciCiT+TfZMjEuVnM4ILgtIyoGHkcYZC7
 HxIbjkZQRWjwKqzoZj717UlIReT873Rs7ysn0sIpk5vbr36t+mDzOGQPV
 pvvDnCN4eeNEHnwktPmcwVkIRV12iSGNn7CD6UhzcqdJyQ9j4qv+tZ7eU
 S3m+H3b0t7/L8I4Q/RbAi0mHBnSCX6jZwfI9JZsB2eHQDZBrbvykROVvq
 dFX/arC2YfF5kTHdMbXvFWm5sMkt7ZNNrqOZ0VtbDOIOgHIm4ttVUY3do Q==;
X-CSE-ConnectionGUID: X5roOCiCRK23MUPN9+bZcA==
X-CSE-MsgGUID: Y9t0SxzSR2OsVLyBLjz6XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4512292"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208,217";a="4512292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:13:22 -0800
X-CSE-ConnectionGUID: QFmzyjZaTF+wXX8ohJjQkw==
X-CSE-MsgGUID: 2itEYphAS5SKkOqb2oi5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208,217";a="12613351"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:13:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:13:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:13:20 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:13:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPvj1ozpWPHUT/JYyYmuesPyNUvaXqtuoMh/9HONnioH0+FKIBKeFOfpvBK0Zad7ds9dH4wdM7J/lpwLf8vOhTjiG0Xfb9D4TCAehKWHEx+lgji7r13LZyu1qJOUEs1LVDADTbvkMOIEWezGy0HQYdRNJgfDvcc0CSLh+IqyAm/mON/mRBrAM9OoXS8m5RJbQpKVM45MgXpnrq0qmmEpWJsw49vF5W/P6TmSzujiJLHjk4mD5tz09djG1ejMRojKl0fvCsg49Se5HH70sKN9LrmG69rNJiHtZNd1eV4b0DiWIvETa/djBZu1FfmvRUCcS8EIHfNeChmiW6d8PuyUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlIrB7bLjH+1U98Y0IDYb98ppK6xrzjAbxMyENkWkQU=;
 b=XEBevzfZeO6gsEWxCMvp8nIVZCaRVEoR7vR4/vPTQUBp0uaZYhWj0k43HgNEzJ+htyvohB9L18+UbcIjrTEFVKoIi6lclrWH2QIH1i4IpfK5ESUkTjoQP1DlYJgTduxqtQrDjf55+mlXCFew59oeFsh9pKjbbdeBxRCKljsF7HccYuWGvyhXNueozSvaJj4O7PUdYQPadmVB9fgcs02Yo3iloRCZ1ueKU18yMF4ZwVV224dlGCsPHXfRHD72eShJ3YBkfZqruk2ACFduLB9YdThGNv/24xO0G5alGnFLtfBSZdwlTGReecPio5fFp+4QR91vtqY8OPvGjZr1k8kPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlIrB7bLjH+1U98Y0IDYb98ppK6xrzjAbxMyENkWkQU=;
 b=JJ6tcMS7ZO+r9O8p0JquuW/pCSIjOMQXX0bYAuQRnEqqdoFLVE5YfzzFiZcCKI+V7Dw+8gX2oR90o3mUFWjYlYkoNFu7kwqe4NrJP1gn4aV2Ixe6Iu1Sht3Q/9HJG0a2PEobs9yHDIHAS7E4a+yTF6I4k19oM9ObydnACNTJ3NU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by PH7PR11MB5794.namprd11.prod.outlook.com (2603:10b6:510:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:13:18 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:13:18 +0000
Content-Type: multipart/alternative;
 boundary="------------9hut42fBcbnw61lnNnnepP7h"
Message-ID: <fcc18829-a2fe-47ed-a51e-5f282ae737a3@intel.com>
Date: Thu, 26 Nov 2026 14:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
To: <tilak.tirumalesh.tangudu@intel.com>, <piotr.piorkowski@intel.com>,
 <jesus.narvaez@intel.com>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
 <20261126090445.1220148-2-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261126090445.1220148-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|PH7PR11MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: fed27046-71ea-40c8-e382-08df4b9d8234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|18002099003|261009223027099003|22082099003|3023799007|8096899003|260925022911599003|260925021311599003|56012099006|10067099003|11063799006|260925021911599003|261021121427099003|261026140227099003|261022105027099003|261022113327099003|261022075727099003|261028144727099003|261026121527099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: xJTgc769F26FRRHpYyQOg3fTbFX0FXy/4ZsIqcdK6Q+xznX0aQqA8ZnfK9FfcTDY9lry1e20GbbYD6lTMNzT4qRJFuA2XWyGaJ23HnEd8L5zaz96qjZcUDBm4OMJJ9ai0IFaSdWOkIdF50CcpZlkbg0DGLtygJovlPySJNZvDoEsf1TEIveBZvEsNxVAj04gUw76dE0eKY5On9BTkGP5k4UV/likHsY8hLyskD7ryp04N3jz2HSSoPys2YA5IlnKZO2DYmAnZ/+4YMwPeI3tnmzwNtND0qcWcdjMcdLy1mbllQnw8HcZSJbBQrmQcfAMXOhrMSkkNEt1wCI47G32g6VcRn357KTtfqF8U1d5OofLvD+0sbgw/pRhkNfDNvEqZmtElfCQiohtoZP8rAASx8ALfDavsCresWhjB3u0xHYDD+qqpGINv8YswYQsCjGZvSUPlnAb0M5q/Kkgp3ujJoVolYdvI67gXVgl5LQg66CGBrLSNxSmVzSVMtdfebF0tZ5sdDMoFKOIR04qzIrWmRYEpxJTaSeNEE/2DdAZMd3SBy9D9wy1pwaBtQa8DBgIEe8U4TAyZ6tATeYU5jcEp4QtAYyj16HOtW3u7wtq+8GYiOxqSg7tXLxYZllkFxus27zz45RQPgx3qD6ZF1FK06ojIWhK8ZIK1p9xsh2BZQc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(18002099003)(261009223027099003)(22082099003)(3023799007)(8096899003)(260925022911599003)(260925021311599003)(56012099006)(10067099003)(11063799006)(260925021911599003)(261021121427099003)(261026140227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(261026121527099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjVkMHJvcGk3YXNNeEhCS0ZOSEl3YStaUU5ETW0wTHh4NjBhMkRZejJ3QU9r?=
 =?utf-8?B?dzJrMDMvcy8vSm5POVU4b3JZaUttMUVSWmFZVzlra0NIdUFhZnZ2WVgvMS9w?=
 =?utf-8?B?N1ZkYmxxZXZiZFQ3MHNkbUdMeWtyYkpPMUhyUW1GSHRzbUNLcU9uTHRMdytU?=
 =?utf-8?B?R3RHV1VNYmxNa2lIL3RPLzVvR2s2TGhWdGVpMW5RNjFYeks4cXNvUEhoMzlK?=
 =?utf-8?B?TWY1Rlo5aDRPS1RYaEgvWnJlYVdOalZiZzJZV0dLQ0phNGlscTZDRVQzYWZD?=
 =?utf-8?B?OUkyaEJQd0NhVHB2aVVPU2pEaHF6NGhhU21rT0I3RXhIOTMwejdjb2w2K3dT?=
 =?utf-8?B?TzB1T245YjNRYmFJZlg0UlpmSWJvYnM5YXp4UHV0d2hkTFNMMTFUNTdmYUU4?=
 =?utf-8?B?NmtrU0lRNkRScWtkMlRzMzVqS3QyNEpHb1NMTnk1b29OM2s1R1RBM2swMnk2?=
 =?utf-8?B?emhma2xLWUZKTUNLK0F1WStVQUF3STdJQ0lqM1VidUdsUFJwRGErZUpUWkRU?=
 =?utf-8?B?KzdzV0gvSnk5NUFpTWlobWhtRzNuWkRZaUtuUlltWStxZkJwdG5qb2xtUHBC?=
 =?utf-8?B?enRBYS96Y01Gb05pMTZkU2dpT2hNcld0bi9ENHdnbDZXT2xHYXNDVjhlYW9R?=
 =?utf-8?B?akZhNHJSUnpZcjdaZmdzVUdmdXc0Y2t0cEhpMXdlcUE5bFhiajFJQVVCVW9z?=
 =?utf-8?B?cFAwb2RVZVBnVHhnbUM5azQ1YXR1M0pCUjQxdi9uODZjSVJSMUZzVnB0aFhX?=
 =?utf-8?B?VzdFc3Nha3gxclpsK29wamVFamNTMnFqT1hDN0Y2d2ZmRkxzak84RkYySW96?=
 =?utf-8?B?MXh4L2N0VjgrMlRxNStHVjdMcWhtRnY3ejN3a0pTSW9sREJVd2thL1NRUm9i?=
 =?utf-8?B?OWtqYUJ0T1NSV2pTYUhyWWx5N0tkQjhUMXEzZXRxUDhyUWYweGsrR3pUMHNi?=
 =?utf-8?B?L2ZMdTJVL2hFdklFNDZ3Y3VudE1lV0wyWVp2SUxTdEVXZGwvVWplUjg2bmFD?=
 =?utf-8?B?Q05OSHl4QjNQeTBNRklxZTJxUURBd1J1YjlQUTh0WXNIQnIxTWdwS2ZjSGtW?=
 =?utf-8?B?OUd3Vnp1VzFjRWxuQW9TOCt1RHQrQjUxOFNMdjBRWUhHeUErVFpsTkM1aHBR?=
 =?utf-8?B?alM1SVRJSjV2eFBCSWlrUW9tUnFMRC9PQlphUEg5RldvdDdmdWc0eWlwWm1x?=
 =?utf-8?B?RVFDblpIWlFOd09RckxDdVBYdjVGb2thTmswbW5oVEpMKzhSU0hOQWpMU1Nm?=
 =?utf-8?B?bDh0ak1iZjNWbG1rSFhNY08zMmhmYW5kSzRSKzZYc01lZFo4TUwwWmQ1bTE1?=
 =?utf-8?B?ekU4anZTa1VuU3VoMmtEY2V3YWRlUjNsTTdXOTBOQVJkK2w3bWluWFl4Ynla?=
 =?utf-8?B?VFhTM1g5THc3bHcraTZHYWxBc2FrZzBJaDR3WWRZdThzczlqdkRka091NmNC?=
 =?utf-8?B?Y2l6d2oyTjY3eVF6OEdFdHNnbk1JSW1GbnFOc2FySFJQU0RELzRwZ3RWLzBm?=
 =?utf-8?B?d0hBTGFtcE5xT3BGdGtxR3o3eFBOQjdHUDFWTjB5YmNsSVBJU2UrVDVxejZy?=
 =?utf-8?B?UkxRbkRmWlQ3LzNCSTZnRjFib25wK0IvQ3p2RURVeWpkSmQ3dENWUDNmY1ZG?=
 =?utf-8?B?M3pYcWoxRTFJcktBYnNwZVkzekN2cHRBcjUrUm1ONzZ1MTd2TzlJMTV6TUFF?=
 =?utf-8?B?ait5Z0dLd0dGZmtuWWU5VmN1QWxnWlJobXJSMnYzNW8rUWJ2b2hSd1UvZ0p3?=
 =?utf-8?B?d3VocnZuMkZRMS82c2FyTGhuU0ZGcmVGK3FCYVZWYWpTSFVMMFp3SXIyL1d6?=
 =?utf-8?B?Y1Z4Z0l3UVJwMEdQUkkxUmdSM0VDMGJRdHNLcXhmbmVBUmhIcWNBY2NGUGZq?=
 =?utf-8?B?RnNSN09naUhoSUo0cmhlKytyMmltQXJSYk1hV1pnVkNlU1MxcmY5MDl1VW1S?=
 =?utf-8?B?ajJKTncycUsyV2RaTmdvcGo5czg3MXZMSWp2aWpDaDJqdFF4eWwxR21jSkJ0?=
 =?utf-8?B?dkwwVXU0UjMzOFAwR0I3ZU9LVWt5d1MxTy8zTjVUWVEyRXFVQWZ1ajdCUUc5?=
 =?utf-8?B?TzR3QUZwbW9xT3doZytyZ0lJNmZIbXM0eVFuemFONTk2ZFA1aFEza2t5WDQ0?=
 =?utf-8?B?eWZCaHE4dFBReHZHTGkydXdFUU5LSjVWTjBnUlgvdEpYY1J5M3MzQUJUV2NV?=
 =?utf-8?B?TG9scDQ2emFSbjFna3ZucHVia0lXSkdtSzlTNVE1eGlUTUZjbDFoN2NsbUc5?=
 =?utf-8?B?TDJLdlU0cWJlUFkrTDNpcG9JdWtzTTB1bmhrVkNqTHFuczdFTGsvSU8xOW1W?=
 =?utf-8?B?NFYxT2xpNkVyTmNzZDFqVGZWNWhxbVQ3U2daUDdDYlUyZmNIcHlEcndTMGZZ?=
 =?utf-8?Q?sIdZBIfEA3XIatYA=3D?=
X-Exchange-RoutingPolicyChecked: ZaGVMDhfb8OvAnbg/R/4nTYmpWhx7jI0RZKMePZjcZk0yAyWwG0b5nYhfxMv/5xBWQnJjLcC21CSSAZnAaGyytNaiBr8aNkJ0jmTFbxa4QBzFrYRLTdrRf5lVaCXyTCh3m91sf0HR/c/WpXdebTgCL9S26p0Wuw9Ro9mdi6ex6tE08iZtkTCHChTNp9/VESiczfZv1uQUxcRMqYUH3bAPCFtGtBw107K6q/7RknXRNcQ8qpMpiuXIXQBxTGQIZT4s/UXJIzwpyGDqlK7PXh61puIZZxyGrhjU/+PrVjqk0w19XuHQj9JOpw7LvrwbLIzAnVh9WgKxWW1W/MXd6QYBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fed27046-71ea-40c8-e382-08df4b9d8234
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:13:18.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPPiE7M8tFKCHHJ8/pu548v/jpTjISec/W6eIHq8EvIuizVqTA/gnZ7S2Cr5riCeBRl5xvjABgv9xmwpbEcaOHUNJSwC1EYNw3IpqyHshN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5794
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------9hut42fBcbnw61lnNnnepP7h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26-Nov-26 2:34 PM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh<tilak.tirumalesh.tangudu@intel.com>
>
> Wa_16029281913 recommends using the MI_SEMAPHORE_WAIT_64 instruction
> instead of the legacy MI_SEMAPHORE_WAIT, due to an issue with the legacy
> semaphore on some Xe3p platforms.
>
> v2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
> v3: Drop the WA comment (Satya)
>
> Assisted-by: LLM
> Signed-off-by: Tangudu Tilak Tirumalesh<tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 835ef75bbeb1..75e6a4d0e79d 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -48,6 +48,11 @@
>   #define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
>   #define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
>   
> +#define MI_SEMAPHORE_WAIT_64		(__MI_INSTR(0x3b) | XE_INSTR_NUM_DW(7))
> +#define   MI_SEMW64_INTERRUPT		REG_BIT(20) /* raises the semaphore-fail interrupt */
> +#define   MI_SEMW64_32BIT_COMPARE	REG_BIT(19) /* 0: 64b compare (default), 1: 32b compare */
> +#define   MI_SEMW64_INHIBIT_CTX_SWITCH	REG_BIT(15) /* poll in place, don't switch out on fail */
> +
>   #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>   #define   MI_SDI_GGTT			REG_BIT(22)
>   #define   MI_SDI_LEN_DW			GENMASK(9, 0)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------9hut42fBcbnw61lnNnnepP7h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-Nov-26 2:34 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:tilak.tirumalesh.tangudu@intel.com">tilak.tirumalesh.tangudu@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261126090445.1220148-2-tilak.tirumalesh.tangudu@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Tangudu Tilak Tirumalesh <a class="moz-txt-link-rfc2396E" href="mailto:tilak.tirumalesh.tangudu@intel.com">&lt;tilak.tirumalesh.tangudu@intel.com&gt;</a>

Wa_16029281913 recommends using the MI_SEMAPHORE_WAIT_64 instruction
instead of the legacy MI_SEMAPHORE_WAIT, due to an issue with the legacy
semaphore on some Xe3p platforms.

v2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
v3: Drop the WA comment (Satya)

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <a class="moz-txt-link-rfc2396E" href="mailto:tilak.tirumalesh.tangudu@intel.com">&lt;tilak.tirumalesh.tangudu@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 835ef75bbeb1..75e6a4d0e79d 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -48,6 +48,11 @@
 #define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
 #define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
 
+#define MI_SEMAPHORE_WAIT_64		(__MI_INSTR(0x3b) | XE_INSTR_NUM_DW(7))
+#define   MI_SEMW64_INTERRUPT		REG_BIT(20) /* raises the semaphore-fail interrupt */
+#define   MI_SEMW64_32BIT_COMPARE	REG_BIT(19) /* 0: 64b compare (default), 1: 32b compare */
+#define   MI_SEMW64_INHIBIT_CTX_SWITCH	REG_BIT(15) /* poll in place, don't switch out on fail */
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261126090445.1220148-2-tilak.tirumalesh.tangudu@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------9hut42fBcbnw61lnNnnepP7h--
