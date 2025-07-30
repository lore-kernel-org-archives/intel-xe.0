Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA509C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 13:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052B10E6AA;
	Wed, 30 Jul 2025 13:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0iXlXBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54B610E6AA
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753882745; x=1785418745;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3NvLGzu40YeqAHOL9Un6aBWXDiGlgtop0zZsMlJFV5k=;
 b=Z0iXlXBY9SFeQcE7DDelAfxMipC3XbhvWnOh68Quhix5ZuCXVnI0pydH
 xTh1d3YdNGuUW48xAL5no/0Tu3P4mFJcAVwSOAp5jOJE0y9o809u9lcpa
 VhCJNZ4F1/mTLbBnfseIlH0sdWhamMlCPWfcV7iJtQSS5bHrU982f4bKu
 w6Vk66sAyFa+J3dsvIHn68MH9pvrZ/Kk7gh1L8OJcvvVCVJlLq7oH+QYH
 uS+sEqj/G4POueWZ9Gdva9MZO3PRuLAgMhi9V2QIYJhrNpkMq6E+jaW6p
 keEeQpAYBzTnuwsEaCRz25EG7aiu44XTEyYaGw7uHGcfG+y4n6CG5CkHn Q==;
X-CSE-ConnectionGUID: WuFFrbtsQHqUuAajlBNqVg==
X-CSE-MsgGUID: x2ki6JTvS+Wrb8VFIsPeYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66750788"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66750788"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:39:01 -0700
X-CSE-ConnectionGUID: YiW4sRNET4uzF/MXUX2a6Q==
X-CSE-MsgGUID: dOcRae7WSQi4mS4BFB4L2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163769903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:38:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:38:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 06:38:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPQoj2sAnJa7wAmGo7pMz/yAXZgst/4IQilZM9P4VpsPoUf/I9FCefIM5lhoovwFQtyI6auM1Dy0LLwiCPIxjBJAbyxE3XV6VKzZwRT+sbk6Yh0CysvctQ/TvfPyOiTvYcZcN9urT95HkmjLMoIkLswm78co9bkCdUWfiI4tkbyVnr0D3tJWVb6WggtoNmgICYYSbiGQHUXdMJ/WEXfqq3FCvt7hg0vhYGqhgELsgEhi5uXJiAinNvGV33Z/RqjpXphbAUsBeMnE7LPdEBYlNEe2R5Te0P4llwR2q+6GuA+g+ITyxtpaj52n5xuupCHwhP2VU1EbkmxzDjB1+lX9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sIkxuEL8h8r5EpySaAX9uhS+RVkMv2QbSCetn8qb+Y=;
 b=JpNiwKI80PDQKtglYsXYajrkSV5Fcak0Cq21JYZbB563ZxOgus48cpCt1Ep8kmRoUvtZ8mvdbL3O0g26wu8OBLGwZWmyIZIfW3gwrEg6ypccCCBF13VtXi2is9Djv31oojcBCJVamfJt+572FqJqdubKseTkf+Vb/y/4HTjh4E1TQCCpQfX8+A23yKP/izFSsLARRcNJIwGgWVr4elAA0d2zc656L8N9fmtABzto/UFEaiONaPHTiBEPdHivsIHkrk+y5DeRzwaJ54WS5m+5zU5BV5JPDitUqgNzmhRbjLDCc+LXEaDUdYf2Wuwh1X21jtI/frODwNaM8d0G0flv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH3PPFB6E746C59.namprd11.prod.outlook.com (2603:10b6:518:1::d43)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 13:38:56 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 13:38:55 +0000
Message-ID: <3bfe1c29-64d6-478a-971f-aaad2948a1b4@intel.com>
Date: Wed, 30 Jul 2025 15:38:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe: Don't update wedged mode in case of an
 error
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, John Harrison <john.c.harrison@intel.com>
CC: <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
 <20250521122511.5760-3-lukasz.laguna@intel.com>
 <6783b88c-cdac-4730-be80-716ffdfd675a@intel.com>
 <e1dd1213-fe6b-417a-8146-e5007d6b50e2@intel.com>
Content-Language: en-US
In-Reply-To: <e1dd1213-fe6b-417a-8146-e5007d6b50e2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH3PPFB6E746C59:EE_
X-MS-Office365-Filtering-Correlation-Id: 8705159a-796d-4517-0a20-08ddcf6e6e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25xVGdLOUpLOC8yNkdVUXdlcklYSGIrSVUwQlNUL2ZjVWlHSlRzLzNDeTM1?=
 =?utf-8?B?MVFsTE1JM2ZTU0l4cjlZV3d2aHBHZ0x6MUtIeHIrdEpyQWNNbWVhMEQ5cWxJ?=
 =?utf-8?B?K3hBVVZMdHJQaFROSmkxSlRyMGJFRmp4dEJJRWxNQ3Z6akJXOTgrUGE5MjZY?=
 =?utf-8?B?akZyUllDWEUxMDEzVmdQNnlHT21na1FLV3VxV3NFajVWem5RanBrUXpTMVFw?=
 =?utf-8?B?L051akRNODRhUjhpZkZQMGFTUDJHYkN0S1E1MmIva21xRjIrOUtaeCt1Rlhk?=
 =?utf-8?B?WXljT3F6cUh4Ritjd2xjVnI0Tmg1YWRsdDYyVEhsMm9Jb3NwUXh0WU1NeW5F?=
 =?utf-8?B?NnYzSldGQ1Y2aWFJVEhqUEJWa1NSM1ZPUEJxdm9yR2U2Rk9pK3BhSHNTV09F?=
 =?utf-8?B?RFQvWXJBSkVCdW9sTWlLeVhRajg4eHhFZjZxUjI2OTdibzErMkdoSUp2VHN4?=
 =?utf-8?B?YTE5T3dJQ0t0bVhmQS9nMmpGSXpDamhhRS84djZSZlJYVFpZLzdBUUprbmJx?=
 =?utf-8?B?eFM0N1poTzBMZk1OeDBYN0VNdTNGWFNwK28zeWdzaVpqdEM4RjZMM0tlZVFl?=
 =?utf-8?B?TnlZMDljalBCUTZxNnNsYU1hb2hGeVpHWVJLSjRMSWluZndBRjk0MGxQeDJF?=
 =?utf-8?B?RWROZEprM3FHUklEbGV1ZEgybGcvYjRvWFJwcXdZU281NUpWRDNCRjZPNExu?=
 =?utf-8?B?U3JvUmVSd3k2M0F2UlJNR2tndHJQbmtRZzFqMHJYQ280R3dzWnZ1bUh6eVNi?=
 =?utf-8?B?dnQzWmFzTXZ4bFBqemVsRkUvMjkrUHlUN05Ic0lUWkl3SHQ1QWdwaTBSTkta?=
 =?utf-8?B?dDlRRmRLZHF0S2FxZDhlZVJWY3p1MUQyR0t1dDcxaThOcmFPTENiQnFyWEY5?=
 =?utf-8?B?VEhsNGswSFlwQVdZL2lIRDhORzdFOStNTFpkYUxoSjJvckVUT3J2bmlBSys3?=
 =?utf-8?B?WWErQzlFTy8vNUVVbTNtTi9ncm1lUytJUkhkZmNqbTN1dHZCTFcrYlhsSmxU?=
 =?utf-8?B?YnZxZXhUbWJiK0gxQ0ZHc3ExTGdwdCszZ3ViSEdCUFBnaFNuNTdVQXJwUUxE?=
 =?utf-8?B?bllnREhYSDY1TzBnWGZWMlF6L2dKMStuZHRBVTZSUGRlM01kclVQb1FkUVpl?=
 =?utf-8?B?SU1jdVo4WklMQXVxMGtWY1kvUDI2ZFc1bWttOUpCUm9lUGhmdGpGUU00R0J5?=
 =?utf-8?B?M2tWYU92czFZZWlZYXFyVmpvYUpvZFRKNGcvS3dLcEZaa1pqbDFxd3h3UzZQ?=
 =?utf-8?B?eHFSZmhXRG01WVVqcWpDa3VCelRRSVBTdXVkeVRhYVZNbUg1c0dkZ0lCYnVD?=
 =?utf-8?B?U1UrL0x3WStZYkUrVkFvWlQ3Yy9BdHZpbzdYcE1yQ0xnTGk5bnRrbUpmamFB?=
 =?utf-8?B?NWp4TytOZjBJWTJGTllwb05wTC9OaXhuZWV5NmZEamZpS3F5RDlIclpQdmI5?=
 =?utf-8?B?cTgzaHJzdCszbzVmY3ZBNzZZN2V1M3BQK2xyVkk1TUVTNDZqaDF6bkk4ekd1?=
 =?utf-8?B?RU1tSFpqNTIrc1l6UkZ3b0haRjc5VUZEYks1VFNCQTVKNVFrK2RBcFRBRmho?=
 =?utf-8?B?ZVpGMERnbytubU1QM2hBVDNSVzlSOGplOC8zMnRFZVh4TmhTMGNyMitXbWh5?=
 =?utf-8?B?Y0RJcUVxUGovTktmNlNXWG9pbGFWWWJwdExPRFh3bDFjeWFYUDlnMjZPeWRo?=
 =?utf-8?B?dlNTNTZIUXlSeGVhaW44NlRSaWp4L1ZDUWVKMVoyY1BUK0NwMDVNblZWNnEw?=
 =?utf-8?B?TitkMCtRVVlhMHhlN1ZNUlNMWjhyY2lSdFY3L2RxMHRkV2JvUU0xdElTeVJ5?=
 =?utf-8?B?RzdVeHM1elIxeWMyTzJORGNWVHNmczB5Vi9BNk9oMTBmS3N4Z3pOUWdleURT?=
 =?utf-8?B?R0lzblFkdk9oMWx1ZGFURldGUkpReFd3TkxtS3JvdzEwSVRYVW80SEI1dUlS?=
 =?utf-8?Q?M1QrHro+WHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNZdEFBNWt6Q0g1UmRtU1ViUEYvYzNCclpicFpsSGVuNDRxQmJGc1BLcmow?=
 =?utf-8?B?MHp6QTc0YWF5UTc4RTZONG5BYVFYbjBkdVN6Vmt6YlFiMVh5RlhEQ2d5RTFo?=
 =?utf-8?B?WnBsY3o0dHdzNXBPemRLV0ZoLzZwM0FjaTFRdEthazA0UVVSOFlyeHZYeWhh?=
 =?utf-8?B?LzlmUk5qcjgrUUpHZW5FeEJEdUhaREJZbXo5VEhDZ0lPdlpkcGd4TExhOVBZ?=
 =?utf-8?B?TE5Jc1g2RlVGUkYwelM2eW9NT05aSi9NRUJaYUpCMEIvYkFsTW1uS0VUbFVz?=
 =?utf-8?B?bEZuOTZ2dXBUV0tQVktXS2ZaRkcwQlFPSEpkMS9FSGZqQW1yZjBHNUM4N2d4?=
 =?utf-8?B?VkgrbjY5VU5UMEN2V2pTY1JJcEVEVExqcWwzYVcrQUF0cnlNS0FXYkpjVWtC?=
 =?utf-8?B?S0x0YTJJdk56YnNTV1BTTkdEZzM3cVhMalFnK3ZtYjFnSFZPcmZnZUttWlBF?=
 =?utf-8?B?RURVa210K1ZjZzlhQ1ZtTXZGQTduN1ljOVIvcWZRZG40SzIyamFHWUJ2VlpP?=
 =?utf-8?B?bUJ5Tmtqamp4SmxBSXBORk9aNUtweFBLVFl4WDkyT3dnbkpCckdzNEpwV0F6?=
 =?utf-8?B?alBmaHBzQVdVT1J3L05oMGlKbnlKQ0pQRHI0NnlLSEdwRVh5Rm9MLzVyRnJs?=
 =?utf-8?B?R0RTemhuSjdYckY4Tk9MS2NibjMzMk9tckx6MDc4N0FUUWYyMVlRS3UrOXl1?=
 =?utf-8?B?RmltUWpSaHd3UTBOWVVsR3JhOHNYdnBEVTVRWHQyWTJzNnNuVStKYURHbUZO?=
 =?utf-8?B?LzYwZ0xxQWlob0JCTVFnSVdMdmo0WUFRZkFDZ1JGa3I1Q2JWb1lkeExnSXFF?=
 =?utf-8?B?akFtSXFuUG85a2xUY1BQdlViQkhjYWFKQU45ckQ5Nk5mcERJSTBSWDBXK0ZT?=
 =?utf-8?B?OU1NaCtLR0JoNkNBelpsSDBKSnk0d1F4RHpvMTM5V0FnL3k4ek5aZ2pwY0VM?=
 =?utf-8?B?WXhWb1FRY2JwTGdEWnhGWTRoT0lScExTaldQRjRERFZraTBCL1JYUllzbW91?=
 =?utf-8?B?MG9YQm9TWUNiZzZuS20xU1MzQ0poMnVScFMwbFgzNUhzS1hkZDR6Zkx5aXdm?=
 =?utf-8?B?QWZvVDVkblF3alZnTFQvbk1tRS9FSjlQb1FLTDkzWDV1TmNQNFpHOTY0TXRC?=
 =?utf-8?B?djQzb3BtamJNbGh5d3BURjNsY1R5OUFmekhPaFhmTVJ4QWl0cGNMcWx6SWN6?=
 =?utf-8?B?WWc2R0puOFphL3B0VG51RUxia2lrN0paaHdHOVNZQkwrQTF4dGpuSExSdXl2?=
 =?utf-8?B?aE9EU1JmTXZBUlhXOWtpdlc4Nm53bXhuR1ZpblRzRSsrSWNSVW95Wjh3Z0F4?=
 =?utf-8?B?MDVsdGozVzd4MGE3Slp0SGFiOXZjUWZ1OFk5M0xEODBSeGRFN2w2RVdON3o1?=
 =?utf-8?B?ajh0aGVWN3dDNlNYZVh0ZmZ0UDVBZXg3Mk9veXZJeXRZd2dUTnFVMSs1bWNF?=
 =?utf-8?B?NyswbytEbUQxWW9hMStxNlc0Y0RSZ2JudUU2Qlp5dGJNK21Xc3VjUjNIbmRL?=
 =?utf-8?B?dU56eDRrWlBFUHY5TnBJWUF6WWdYWnAwSVl1QnlxSTQ2YlRPaXNaWHNFQTZU?=
 =?utf-8?B?eXhCalBEZnJGOG5MbjVpbll4ZXM0WExUY0ZtUUMwYXR5TGJXSXFDdFBJUDVG?=
 =?utf-8?B?MDVMcFVucTVKdjBhWjc3TXExNW5ISWhyWXJlQ1FXVWs2OHRJazN1ODdVc0Rl?=
 =?utf-8?B?bExxU09qVVd1N1pqRGFlSll2T1Z3Uk1zbmxscklxLzFvb0IxNmhFZHJGRE8x?=
 =?utf-8?B?c0ZkcHpkNENUN2ZielRIT0xjYlNaV2tHeHVzaHJnZWN1S3RLZU1qbzEyZXhO?=
 =?utf-8?B?ditWY3ZPb1dEdGc3eStnRlU5NmJGQ1h2NUtnRGd3dGN0T2lwYmZsQnJnSVhC?=
 =?utf-8?B?MFg4czIzQ3pmaVBTTm5vQjR6SlJQWkErM0FFVFhMSHhYSld1S05scUFVZnEz?=
 =?utf-8?B?dmFwNVV2SUNlL0JGNk5sdDNyZGpTdDRmRjdiRjVsdkdLRVFzSy9tV245Z3JQ?=
 =?utf-8?B?eWdTNDZsOGZZT01lcitoRU1VSDdPMUF1dzZGYkplTkIvdDlqS2x3U2VvVHVH?=
 =?utf-8?B?R1ptdUZTL2phRVRzS3RRbVFYZ0d4UDJlbFNwcGw4Y1JZVjRzLzFFbmFRbFZG?=
 =?utf-8?Q?TEJ4vzp+q8i3aN/eSiOM2u7IK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705159a-796d-4517-0a20-08ddcf6e6e09
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:38:55.8136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQR2D8yGJPcqF1/g8pk2ceXDEVPtSzm3qRozBFeoNiCj9sjKdgZPBhOGwQut+WSAOrHGpF1X0WjS1kFWbldNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E746C59
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


On 7/30/2025 15:08, Laguna, Lukasz wrote:
> On 5/28/2025 11:17, Michal Wajdeczko wrote:
>>
>> On 21.05.2025 14:25, Lukasz Laguna wrote:
>>> Update driver's internal wedged.mode state only in case of a success or
>>> set it to "misconfigured" in case of inconsistent reset policy state
>>> between GTs.
>>>
>>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c      | 34 
>>> ++++++++++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_device.c       |  2 ++
>>>   drivers/gpu/drm/xe/xe_device_types.h |  1 +
>>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 12 +++++-----
>>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +++-
>>>   5 files changed, 41 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index 5dd0ad3f9bae..5bc4fe5aa9a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -150,6 +150,25 @@ static ssize_t wedged_mode_show(struct file *f, 
>>> char __user *ubuf,
>>>       return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>>   }
>>>   +static int wedged_mode_set_reset_policy(struct xe_gt *gt, enum 
>>> xe_wedged_mode mode)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    int ret;
>>> +
>>> +    if ((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
>>> +         mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
>>> +        (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
>>> +         mode == XE_WEDGED_MODE_NEVER))
>>> +        return 0;
>> this could be a separate helper:
>>
>>     bool need_policy_change(old_mode, new_mode)
>>
>> and might be called before we enter the for_each_gt loop
>
> good point
>
>>> +
>>> +    ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>>> +                               !(mode == 
>>> XE_WEDGED_MODE_UPON_ANY_HANG));
>>> +    if (ret)
>>> +        xe_gt_err(gt, "Failed to update GuC ADS scheduler policy 
>>> (%pe)\n", ERR_PTR(ret));
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static ssize_t wedged_mode_set(struct file *f, const char __user 
>>> *ubuf,
>>>                      size_t size, loff_t *pos)
>>>   {
>>> @@ -170,19 +189,24 @@ static ssize_t wedged_mode_set(struct file *f, 
>>> const char __user *ubuf,
>>>       if (xe->wedged.mode == wedged_mode)
>>>           return size;
>>>   -    xe->wedged.mode = wedged_mode;
>>> -
>>>       xe_pm_runtime_get(xe);
>>>       for_each_gt(gt, xe, id) {
>>> -        ret = 
>>> xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>>> +        ret = wedged_mode_set_reset_policy(gt, wedged_mode);
>>>           if (ret) {
>>> -            xe_gt_err(gt, "Failed to update GuC ADS scheduler 
>>> policy. GuC may still cause engine reset even with wedged_mode=2\n");
>>> +            if (id > 0) {
>>> +                xe->wedged.mode = XE_WEDGED_MODE_MISCONFIGURED;
>> hmm, I'm not sure that the rest of the driver code will properly handle
>> this new unexpected state - do we really need this? can't we just try to
>> revert recent change where it was accepted? and if it fails there it
>> still not the end of the world
>>
>> alternatively we can try to track GuC reset policy settings per-GuC, so
>> we will know where it was left inconsistent with global 'wedge' mode
>>
>> or just wait until next mode update or GT reset where likely we will be
>> able to restore the consistency
>>
>> IMO it should be fine just to report inconsistency, and then let the
>> user decide what to do next
>
> OK. I'll remove this extra state and will just report the inconsistency.

Looks like I also need to remove:

if (xe->wedged.mode == wedged_mode)
     return size;

and needs_policy_change(), so that the user can try to restore the 
consistency by setting wedged_mode that in normal case doesn't need 
policy updates.

>
>>
>>> + drm_err(&xe->drm, "Inconsistent reset policy state between GTs, 
>>> setting wedged mode: (%u) %s\n",
>>> +                    xe->wedged.mode,
>>> + xe_device_wedged_mode_to_string(xe->wedged.mode));
>> this new state is not the one exposed in modparam description, user
>> might be confused what it means
>>
>>> +            }
>>>               xe_pm_runtime_put(xe);
>>> -            return -EIO;
>>> +            return ret;
>>>           }
>>>       }
>>>       xe_pm_runtime_put(xe);
>>>   +    xe->wedged.mode = wedged_mode;
>>> +
>>>       return size;
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index fa4f1a3ac1f2..0aea87994541 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -1206,6 +1206,8 @@ const char 
>>> *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode)
>>>           return "upon-critical-error";
>>>       case XE_WEDGED_MODE_UPON_ANY_HANG:
>>>           return "upon-any-hang";
>>> +    case XE_WEDGED_MODE_MISCONFIGURED:
>>> +        return "misconfigured";
>>>       default:
>>>           return "<invalid>";
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index a8dfacb951c1..8ec1d891a2ab 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -562,6 +562,7 @@ struct xe_device {
>>>               XE_WEDGED_MODE_NEVER = 0,
>>>               XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>>>               XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>>> +            XE_WEDGED_MODE_MISCONFIGURED = 3,
>>>               XE_WEDGED_MODE_DEFAULT = 
>>> XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>>>           } mode;
>>>       } wedged;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index ca8bdb0ec08d..f2c4c4e292f6 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -1008,14 +1008,14 @@ static int guc_ads_update_policies(struct 
>>> xe_guc_ads *ads, const struct guc_poli
>>>   /**
>>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>>    * @ads: Additional data structures object
>>> + * @enable: true to enable engine resets, false otherwise
>>>    *
>>> - * This function update the GuC's engine reset policy based on 
>>> wedged.mode.
>>> + * This function update the GuC's engine reset policy.
>>>    *
>>>    * Return: 0 on success, and negative error code otherwise.
>>>    */
>>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads 
>>> *ads, bool enable)
>>>   {
>>> -    struct xe_device *xe = ads_to_xe(ads);
>>>       struct guc_policies *policies;
>>>       int ret;
>>>   @@ -1026,10 +1026,10 @@ int 
>>> xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>>       policies->dpc_promote_time = ads_blob_read(ads, 
>>> policies.dpc_promote_time);
>>>       policies->max_num_work_items = ads_blob_read(ads, 
>>> policies.max_num_work_items);
>>>       policies->is_valid = 1;
>>> -    if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>>> -        policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>> -    else
>>> +    if (enable)
>>>           policies->global_flags &= 
>>> ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>> +    else
>>> +        policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> btw, do we correctly update policies stored in ADS that likely will be
>> used again by the GuC on the subsequent reset ?
>>
>> adding @John
>
> I've just checked - xe_guc_ads_populate() is called on reset. Then, 
> inside guc_policies_init() ADS reset policy is configured based on the 
> xe->wedged.mode.
>
>>>         ret = guc_ads_update_policies(ads, policies);
>>>       kfree(policies);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.h
>>> index 2e6674c760ff..9879aadd22d6 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>>> @@ -6,6 +6,8 @@
>>>   #ifndef _XE_GUC_ADS_H_
>>>   #define _XE_GUC_ADS_H_
>>>   +#include <linux/types.h>
>>> +
>>>   struct xe_guc_ads;
>>>     int xe_guc_ads_init(struct xe_guc_ads *ads);
>>> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct 
>>> xe_guc_ads *ads);
>>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads 
>>> *ads, bool enable);
>>>     #endif
