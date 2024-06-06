Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED19C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 11:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312BE10E902;
	Thu,  6 Jun 2024 11:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSksvLNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50D10E902
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717673924; x=1749209924;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h8XXGBauYZl14o1Yi038QSQhr0xW6YInripOAvIfkQw=;
 b=kSksvLNZzWut0WhqUl8D12uRO+sy+wuwFJWbP4/kJfSjMV576Pb3h+mL
 dhlbju8Cyan+3WpQRO1tAOeKOUR5CdLyKeqe1/b6VUYY+URInj/p6iIVJ
 ChVKVGbh3FsAKu1wDmz58cc9Urjaw2em/qo8lQWVUEoh7v1OmnMR/2uxo
 m/RFvZ3aou1h210u8rChpnUScSgDsnLRsD2gmlj1iL7qa30Hbcbf1mOoB
 pn1iC7Q48qe6d+p1/uS9CwE+8DCKaPs6LOssRHrR/HBmJUM7okDT8n5xD
 qACbnuxgWqf49basF47EXiYHaPOd4QzxHrH5TQqY5KXRmu62ln1MnqC1Y A==;
X-CSE-ConnectionGUID: OHZhf8adStSievjS1x3HUQ==
X-CSE-MsgGUID: lFfBRnaLTV+rD6TsycvaVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14470199"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14470199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:38:42 -0700
X-CSE-ConnectionGUID: 3Pjx19FKSJKfN6LkbxlL8Q==
X-CSE-MsgGUID: YL1HdJKETc2fYSGdhBMMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38008544"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 04:38:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:38:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 04:38:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 04:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVXchgKJ/RKANVH+UNbJZFCcjTUlqeTvDYVh+KRnUUkMAybKfzHnJhMyv5LaeYlxBjdaix8vIRV171bGqwIvJ/ccMJC7E597P0LPKFcHWgTmRjaBAQpoFBfsukkS7wSyF9yDi9bzuY03W5tNnyQatFs/2qjfjx5sC6fPs7BgAJIdK63kYvGAzoebf3GQBSXQqdpQZ9F42Z45E1+I97u2bdmMfJnffFcFhv9aRiFSCZMtQz2NGYLbavjEm3QkD3h2yDPQKof4Y4BwzM17PdPmbYBFw8bnwJsnGePTuAKV6/9AhPyY4Fx28M99FX/cQA5WK35iAEnNjvYRFANQVVsgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYMdtnpgpjCihSj1Vq3D+ZP85bkTXxZDG01bQ+7g1A0=;
 b=EvneBpR+iIcTJ+cPn7Z6scDReaggwvfe2uizX3spb6sz39zzeOwcwWz5qWoHvTCVEbMhmAq5h3JUGQlzY2kjVqYGthiL/RuDkOG68CUkPadQjEIpL0l+7TumqXQNg3+5pjTDuMTdY36cYjD2IgBsWyaQrwvtOJyqbTZjxhHvmvjQjCtsk0Fdn4Fed9PRm00AwKtAOFvF4fpl36CtnZRrNjVV5rjrX+uAXFm+38FC+QMA8L3vP/cjewsohGFgbRMb+NBVBLoty5deOLAIEw8jPlJ6V+D5MGAQKizzYpTA0aMYvui0m6kODLS3m6n5Qhs8ChWP5kxffaBTc31UPJBslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Thu, 6 Jun
 2024 11:38:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 11:38:38 +0000
Date: Thu, 6 Jun 2024 13:38:33 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/vf: Custom GuC reset
Message-ID: <20240606113833.ktltecbiym5uqgkn@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
 <20240604212231.1416-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604212231.1416-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 7352b3e6-cde6-4f85-119f-08dc861d33f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkdrV2l5SnAzZXZXL1BTc1BaV2p4OXlpV2dMeG1QL2RqZmRCVmRick83clNq?=
 =?utf-8?B?akVkVFpSeUhsWnpKYzJkKzdxdTlCQXJFZGEwYmtDOHlQVEp6MmNYdmFhR3A4?=
 =?utf-8?B?VUhyRFlFalRpNjhHWGYzdXJ3UlRBdGlPOFBJSFlVSU94ejVvbHhHK25Xano0?=
 =?utf-8?B?UFRYRE50ejVVbXBTWGxXcXVsMUdoOXRXT1FObmFqa2w5aHBRbk9sYzIraWtx?=
 =?utf-8?B?NFIrUUYzbXRJWEFBSENCblFibjZqVTVUM2JBUlVnaWFSN1F2Y1JMVnN4K0cw?=
 =?utf-8?B?eFJIVldmbUN0OFlMRkZpLytKaXFXbzN4TUowYmRzeUx2L0FtZDduOW41VXpL?=
 =?utf-8?B?MzJkY0JXWWdqNnp5cjZVbWxvN3hkc01hWVhLcHhWNVlKbEV2VitKTEZpWGJC?=
 =?utf-8?B?TTZEenloS091SVpLeGpzWkFwa2svYkJDL0Z3b1RibnNGcm9QcXZURlB0SWVs?=
 =?utf-8?B?ZFpwdTRPSzl2Lzh2RmlqWTN6TitMTGY0a2l5a253Z0lqZGRCV1piT291aVZQ?=
 =?utf-8?B?Y0VxRUFZV0pyY2F1Zkh6aTR4UUxJdW8wMHZuSitWSFVYT21ubTErMGhjL3FV?=
 =?utf-8?B?YiszNnpnS0V4RjM1Z3RweFc3NHlUZjFGM1VPeFJEU1NrZTJwWVpJL3J3SDhj?=
 =?utf-8?B?TU5CZkc1cTI1ajRUeGJwZ21iMzZ1QytqRW5QM013MklHVXVmZzNUQjczSWdZ?=
 =?utf-8?B?NTlhSHZxT2xQMmNad0g5WlAwaEFEY0ZkZXNvbkRqZXJDVEs1NlkyM2xmVzRa?=
 =?utf-8?B?bE1ZcFJlSkUrcmp0elpoNCtON3FkWWVrNXBtaXBsZ3dTaUxyQ0M5Rnd1S2Nn?=
 =?utf-8?B?a0JpZmQ3ZXNaekdqWVNKMS9vNXBKMnpnVXpvT1J4Q0dYN2ZNelZuL3FkL1li?=
 =?utf-8?B?U1ZsUjllak0yN2RGc0ZyWjJoQVlWMkxlOWpydFFkaWhYZjhSeEFzbGFUeFNS?=
 =?utf-8?B?dVVYWDc5WjQ3OHFOTFEyS210NlNNY3RhQ2ZNemZlWFJxN0lCazd6dWsvZHFh?=
 =?utf-8?B?ZElMTGQxMm01elVFSGt5UXppTmZrQTg1TjBHVGJLUHNPUUc0UFpLQjBZK0N5?=
 =?utf-8?B?R042UFlseWJIdmluakNrMDFZdEprVy81TkhJdURQb2doclBDTzdpYjcvT1E2?=
 =?utf-8?B?QldOSk9JcE1IMWp1RzArN09RQjRJcTA2S0JPMDdzT0JkRUhkeER4MkQ1emhU?=
 =?utf-8?B?dTcvVnVTK3VGdGdJbC90dWRMSWhYejBibFFZYlB6Um1sTW4wZkNvdVB1c1pH?=
 =?utf-8?B?aXZwYWNVWVpvd0dxUWJ5VXdVdTV3L0h5M3MwSVZKQ0pPaytsT3ZzUGVIRjlD?=
 =?utf-8?B?b1J0NTVOSGIzTDlLaGpmT0pXeXRLUmF3SGF2bHdDTzI1MDhmTHRHTXRjTDlo?=
 =?utf-8?B?NlFBcFlDMWQyZ0hsYVNkWXZpZ1hySFJBZVUyYVI2ZnNaeDA0QWpBZXdlYlFi?=
 =?utf-8?B?VitnejdzemgyOGxNeHNWTW9jNGFGdjRYQ1EvNHpKMVFLS0FZQnJjQjQ1UTZy?=
 =?utf-8?B?Z2xKYXBlTE16dGJhOS9zYVR2VFMreE9QTk5GeEQxQmE5L0k3ZEg5M25tenJL?=
 =?utf-8?B?c3JTRU82WUwyODRIUXVjU1JEdUdqLzFXbnRmdEtoK3dKL01GU1FWdlRuT3FX?=
 =?utf-8?B?OTdOUEZTVkh1N0tUSThSZnRkUW9rSmFGOExKa0dNSTVGRTZ0dTFkU3Z2MWUr?=
 =?utf-8?B?dXVMTjQ5V2pKR2dJazQ0eURKcEJOYklSUlRLaUhpZlBVdWNBTTRCV3o0TWZT?=
 =?utf-8?Q?pvUeG9YHPqC4tN5XBY16kwVnm+2GbEyUtmh+/CS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVlnb0ovTWwyamJCZ2xmWEUzMkNTc2RwUllKMlQ1SDhBNGY3MGNmZTcvTURB?=
 =?utf-8?B?QTh0eDA2U1pyZ3BwY1M2WFNVbFVDVHJ3MytSM1RlcDI1OTdNOGgvNG9ObkZv?=
 =?utf-8?B?YmhWaXpOSVpEN2VSTzlQRVZ3VE9Yd3RZZGI2NnNsZ2p3d1NJSDlYZXU1cTYy?=
 =?utf-8?B?cHh5RHNTNi9zT3Z6TXUyTGhSNFFqdm9rV1JjY3E2VXNrelFuYVpyUGJSZXBo?=
 =?utf-8?B?UWVuOVhwOVpqR25qWitRZXJPd1Y1R3M2THh2VlVhbExYcVlUSC9xZ2tRdkJQ?=
 =?utf-8?B?czM3SW1majg5TjFDSlArZlp5YU1oUWptMnp4bUV6d0NELzNtaThBVGZnaERP?=
 =?utf-8?B?QmZTSm9MaTAzcEdkZzZFcTZ3V2owbDNxblZRd1RCZGhkUWtSQ2h1YnNoeFA1?=
 =?utf-8?B?TDZPanNhVWdmVTlZRkVNcXF4dmMwZTJWdU1PTXFaZVVYVTlwTWxCZml3VFFX?=
 =?utf-8?B?UTdCUDJsUVQ4VWxqZGJPWnV0eFVMM2ZPbmlWMVdNcVF0UE95ZGtXMXhZcEx0?=
 =?utf-8?B?QWNlY2h0SFRiaHhGQ09kSnpHcGdReGkyMTgxZW1ieXVkOXBQZG9MNC9XOURT?=
 =?utf-8?B?QVI0MEpBclBrTlhyd1RFN29tRWo1L0RIR0JOdy9UR08vQ0JNQUwwYWY4ZFls?=
 =?utf-8?B?S2VmaTF0R1dWZUIvQ3V2emlOU1IycWlKVTBmSi90d3N2b0dlTXdKbmtHclVN?=
 =?utf-8?B?NEdURXdBb1BzQ0hndjZZQjhvSDBpUldUS0dSYnliN3d3NEhFaG1CTVpmWjU4?=
 =?utf-8?B?K3AyMlZPL051MWpCbFJ2WXRnQ1c0azFoWExMOWRHWTZJWWI5Ry9JRTNUdUtp?=
 =?utf-8?B?SHMwbEd3TWVhMDJjNTVrdjVySXlvTXhkTXVBUHA4aStLRzE5VytIak5VaGxF?=
 =?utf-8?B?K01wb3VZOS9TY044NjVlRGQvaWNTd0E4L0k1VlQ4RmNjUEo4UEJLNzlFbUtr?=
 =?utf-8?B?YmYxbmpqVTdzcHBzV1FuWEZEOXBIKzhSRHUrb3AvaTdtUWdXdCs4dWZRY1FQ?=
 =?utf-8?B?Y1NPSVd5elM4U1J5UW1hcUdsSXVBT2FkSEpkcU9xYU5meHUyZCt0c2JpTm94?=
 =?utf-8?B?ckJ1WGxLekVwbnVBaWxkeTNzU2ZVVVRDYlFiZFZPRHc4bkZTL3I2NWdoTG9P?=
 =?utf-8?B?N2wreGtaMFFPald5c3VuYW1NNmxINnFLbytwNFFvMGRHcHZ6UTBRSGhIdlha?=
 =?utf-8?B?c2dtZ1p6UGNKcG4rbW1WTkxTUGpuRHFsTGVJYzdjdFp2dnhaTlRaYVZYNUQ0?=
 =?utf-8?B?c2ZvVk5BdExDN1RZQi9wZDZ5ejJlQS9SWG5Dc3lRN2R6Z1pIZzN3akluM0Ew?=
 =?utf-8?B?Q0tUemhsdTJtUHRnWi9USEtDTDhpcW81ZmhjZmtZNWFpZGFRa0xrQ01UVFpK?=
 =?utf-8?B?eVFpMGpyNFo4eTIzZ3NNQnExNU10VmdRMnExdS9tODArREdjUk1kbkFSNVAx?=
 =?utf-8?B?WVVqeUJlMmhKOHZJTnVxWXRMZWpOSlVuRzdUTDd2azJWVVA1UTNpd0x5V2tV?=
 =?utf-8?B?UGxEbjZQTldYN0NvZ3ZsOEM4N2VuMnBBdnFsc1FUQUlvY25zdkFEL2VYNDhm?=
 =?utf-8?B?SFVhMFpsNWFNVlh6OEEzQ3E3eGNrTlJJL05ZT2FGM1dpcGRRcFdkVFlYZ1p5?=
 =?utf-8?B?Zys0SVpCelZkS09wKzJueFBIRmxYamxrOGwzN0E0YUNDbi9sNTJyT2RxUlUw?=
 =?utf-8?B?Q2E5K2lXV3ZMeWdHcnlPajFINFFEMWlyN2hxQ0RVUTN1UHJnYWlWTnQvMmRs?=
 =?utf-8?B?SEJqM2M4aFNDZW5CSDdpM0JBWnlWMmVaZGlwQXJvMDFlNElmUi9qN3Q5U0pR?=
 =?utf-8?B?aTR6aEM0bC9CSEZvWE1WY0J4bEIzVWZjRW4vS3J5TlNYVE9CeWRORWdReHBs?=
 =?utf-8?B?TldWYTlYMXI5WjdjQncra2ZuRVJPNlNaTWp2VjJScFMzYVhHVHRzc1FReUQw?=
 =?utf-8?B?SmV3bXRiMFhjeS82b082cFpTMmVmNlY1VnZXeEwyNzZjeDN3WEk5RjRHMmYz?=
 =?utf-8?B?U2I1L3l5UmVLUWFhYk9zMkVJMGZKek01bWJnRmM5c2NLR2pnWVkwTUlueElk?=
 =?utf-8?B?TlA3OWxmNk51YU1FaXpJenRaUW5OVTRWZTcrSlMrL0lzenA5MENUaE5KNVRu?=
 =?utf-8?B?cjdxdmgvT3NDZjd5c0xvZWFzYmpKTy9BUVR1QU04ZGpTUXJLK1puTFNSTlBq?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7352b3e6-cde6-4f85-119f-08dc861d33f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 11:38:38.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgAf70gPTz8UbE5pPyk3aCXgTP70PJDLoFhiDQ/Kmz26tnWh9VoVkJE4iC3+FgyW5Y0HtQSGhwGEczPVC4ohsrlEEK5NWjm3iaKAjIFFFgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-cze-04 23:22:30 +0200]:
> The VF drivers can't trigger real GuC firmware reset using GDRST
> register, but for the VF drivers it is sufficient to send VF_RESET
> message to reset any VF specific state maintained by the GuC.
> Use our existing VF bootstrap function as VF_RESET is part of it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 086a048876ba..0bf6e01b8910 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -430,6 +430,9 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return xe_gt_sriov_vf_bootstrap(gt);
> +
>  	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
>  
>  	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
