Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242D2C021A0
	for <intel-xe@archiver.kernel.org>; Sun, 16 Feb 2025 01:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8E910E0F5;
	Sun, 16 Feb 2025 01:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArGjxooO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5669E10E0F5
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Feb 2025 01:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739670567; x=1771206567;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FvurcIvkqobesRDJCDN2MOvcCEbtMuf9cMLvhfq6Z34=;
 b=ArGjxooO14pf33NYGQV2kua9Y4evf00zf/yP/MT//BzNPu5+pkFr30Ij
 cyBN8VPnI3TF9JYZMKaSB2TszJp6S26aXH6BBf5ohqlV0PH91EK8Ptlcz
 fBjh7TOQjZRIlxOm7xmzE7d+hT/kuuS5PfkPMjKmqU9qlcAbNCSCENbCb
 HQM9QGNsnjJxe+S8/YCTybVbWAWmNJqDq24XGuVJpLYXT1lUriXTatYbM
 Cb6LO6FyW30p1rcRmhtcV1SrvT3bEwjmcBqTeMimifX75uLyrR9eY+71L
 B0rqHFra53EnJXTmG66Mv52UIVYd0Vityw25BHDx7dzOCkI7cq4KQmVJi Q==;
X-CSE-ConnectionGUID: o4A8HgImTmunu6V/lbuiIQ==
X-CSE-MsgGUID: UUc/xGsgRoGYvSXOups55Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51812582"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51812582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2025 17:49:26 -0800
X-CSE-ConnectionGUID: H/vTla3VSvmp7hfU4DFeqQ==
X-CSE-MsgGUID: uSrj/DULTDqj7807zkH68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="113532531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2025 17:49:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 15 Feb 2025 17:49:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 15 Feb 2025 17:49:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 15 Feb 2025 17:49:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF3sgqW+LrjjqYzV4s8TRpFFKmRwYSgU/Vk994P11QWyXIY03rZqyMZA1UHRSxVfMtJIFSXfPB45qV8BnBVe4XEKCFGMLLey+F8HiIWU6sm7EIbroeVtuFTff4x1ufZqE+3t5qQCx5PfCA+NYWIasE2E3VOPIP1zytol0HSZBCKe9LVEbuQxlSrQvIe8xni1TtFAzuAZTMLYLrPWWynkGqKWH54SaiP71A4xp8dqQKEnvsedSFU5q3e8pktM3v2ZhjnZemHZDfzwy2sGCN/aJ6C4laU7LYX7TBzpfdbbs1bhrNL/IaANEmJQ84HcwudH1Jrg47zF0ye5fLCUg0Wt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpHviY6EYDOGWcRdkmqmaSFsoiY+6jewt+vWRtHdgvA=;
 b=Wp7F0AE6IKFcI4PtXeQ/3Ys4YUhMBlOoEzVqf5O5H3vzrujML8WIAjMqIiwQkI4OsBHLlI0mSybF04z0heTIGxOOaM/CvzLcHxJqH1WbSFICb8hbV4lJ22Vd30OxZrqTtkRvFk6/D23qE7cX6SVQdV2B4/+/DznPk0y6LLxYmgrgoCjkzzwJ184YG5USZ7QQCXxP3j/ZaEJ1i68gJUFGiyz1qgsksHoQqZVpETcdB6gWaZDzK6UnZLndZGpP1WAZEsg9ygl9snFbnTc/ojuvvx5UyzsMBkmI9XpFNK7yGvzkSbfdYVK22sxNkZ0dtrYLUSNQJwbRbaUn8eJNsswnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Sun, 16 Feb
 2025 01:49:21 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 01:49:19 +0000
Date: Sat, 15 Feb 2025 17:49:16 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 2/8] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z7FEHKxuSKrdH3Ze@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <36d701413aeb171c86d5dd2ce7272918eb4ab818.1739193510.git.harish.chegondi@intel.com>
 <85h6512ybc.wl-ashutosh.dixit@intel.com>
 <Z600wXtGm8a1bfD2@intel.com>
 <85v7te7eks.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85v7te7eks.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cf10c4-a82e-44f7-0559-08dd4e2c20ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjB4MG5qSVlqWmJON2l6QmY1akJrcXRjSkkrS1VxbjR1c05lcFduVStndEJD?=
 =?utf-8?B?V3A3Sy8rS0kwUXJmaDNsSzhkR2tIWVdBdVBqeENUN3ArMjV0d0ZlSFk3S1Bw?=
 =?utf-8?B?Sk1Zb2lCcnUyVjMrcENsdGZkSC81eWlLcVdPUWd1MWptYXdaMFlqYzZJS294?=
 =?utf-8?B?SVVESlo0Y21ISHcyUzJOWklxSGZZWVNFcDd1Z0xHamM5dzB5YWV2M3oyVG9n?=
 =?utf-8?B?cFBhemRPaDlnaDc4dkduanVabjVLZkJMazAwM3JjeGJpTVd4QzIxbmtWWmJU?=
 =?utf-8?B?TWNiOFIzZWpHNGI3cTA0cjV6ZDNOYmd6cU81TldqMWNJTC9zSEQ0Tm9FUjVG?=
 =?utf-8?B?Nm5jZXlmcXVKMjhWdmpIQTl1WmFieXVuR1M1UW56ZFpPNVZ1UnFUQ3NFMkdr?=
 =?utf-8?B?Q2lyTzZnZlJ1a3ZtL1A3NHJobzI5em9TWTRqUldWeXo1SEczZzc0SmZaRFNo?=
 =?utf-8?B?aHgzZmhwTzR3WGhFWGhlS2dMSUpSL083MzRGZklMUEhWYjBRVHBKeVY1Qkw0?=
 =?utf-8?B?cmV4czJYd25aU3JHR1FLdFJyQlNUZHdHWjFIcEtvQ0NQSmw0cjRPOUNhbFM2?=
 =?utf-8?B?bHB2SlJ3T1Q1enFPYzhQa084cFdXcDRWeGloYlVvbVQ4c3RiMWYvOXd6aHpv?=
 =?utf-8?B?S2Fjbld0d2s5ei83UFhEcWgzczR5SFI5OHZFQ3VoelNleE9IMFNHSTQ0aDYx?=
 =?utf-8?B?eXJrK0h4d2hoWkpSNnRVOG5aeFJPTFoyb21aanhRR2VyaysvdngzSDRyREZN?=
 =?utf-8?B?VW43bERZeDJDWVhxelBDYVhya0QyT01DT2dIRSsvbFpFUXRjbGhHdnJKMTFU?=
 =?utf-8?B?M0g0UDgrSmpRRkVORDJKb0V6TkpqQWxKanVjdWdPVStFUnZtQ0ZKWEtMa1lH?=
 =?utf-8?B?L25rczFFblU2a3lzMlJKRUdlazRPWXFpanlQSE5NdzhJU3cwRTJWNy9FanFN?=
 =?utf-8?B?Y0FhUWpYZm16cThGMkJNZ2paaW12QkVmL0VBVjd6cnN2L2VpdkpVOU56bW5s?=
 =?utf-8?B?Ny9PT3pGdEN5SW5XRy9BcUpZak8vbUJDYnE4cE91R29GVngreFRvajNkbE5L?=
 =?utf-8?B?YytDVEIxdmtxVlFtY1pFMk5tcngvaTN5Vk5oSnJ4QWZCekNCZDQ5ci9uczhZ?=
 =?utf-8?B?dmtLWS9UQTF2MGdRenJhWFlHcWQvN3VCZTRIem50enN6YTc5QUhBYVZNK0wy?=
 =?utf-8?B?cXhRZnJBN2p5K3pzTkd2emN6VXNWRHJGWUFlZVI4Q0VmY09Ga0QwS211eVlJ?=
 =?utf-8?B?bDJGTFYwMmt6K0VEUE1WV0MybXpORVllb2FzbFc3dkZlL0tMc0ZIN2FtS2JZ?=
 =?utf-8?B?RXdtUmRja2Q4V0g4dEdyVWVDVVh0S3VYVnlvNFo3clFpUmczYVg2WUx1alEz?=
 =?utf-8?B?UU5rQ25TYklyYlQvdDE0dkd5Tk1FS2tiNkZiL25KMUd4RWx6MjJNWEMxRFpm?=
 =?utf-8?B?NGJmMk9pNGo3RS8rQnNFN1dVNnJ5KzlCdmsrRmpKOFRrTzN0RmdPNU1jZmM3?=
 =?utf-8?B?ZmtaUE5yQVQwMUtxNU9lSDZCdlNXNHNXa3ZQaDJ0ZXRaeVcrSGlUYWRpQ2U5?=
 =?utf-8?B?V1dSaVp2MHEvbHlNRUJUUFZ5WWpXQTJQc21WNWgyQ3hESzFaVFFQdDZoUnR6?=
 =?utf-8?B?YzcxMG9FWWQ2R0M1aGlGWCtzbi9veVl6SzFzMU1UNjRPOEdkUGhUUTlCdGsv?=
 =?utf-8?B?T0JnRVlzNWdQWGJEOWFrdXh2NmNrZ2JtSThlM2lVeSswWVBXT1VrSjdqTkl0?=
 =?utf-8?B?L1Y5azBvSVR5cUo4ZFI4MGwvdE0vZ0t3WHNDNWlHMDQwTW5zRWs4amNOOTJ3?=
 =?utf-8?B?RThaQ1ExeVl5Y0l4bGJFOXJraFVYdFBSazV4RnVUMnNCQjJUT2xlVHFkQXJQ?=
 =?utf-8?Q?n1AJ3p27nKwwQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXE5bzBvM3BsZkw3a0kyRUZOU1gxR214TzFhTk1FaGI2aUcyc09paWw4dllG?=
 =?utf-8?B?TzlIUFRZV1NtOHMvdnNyMjJkbk9kd0RYWnc2b0JacGc0QnZGSEtvUEd3VGRz?=
 =?utf-8?B?eFV6UXNWWkZLYWtiZzE1bzFnMHVnKzFZQ015Q1FRZUlTUjAxeUxDNmJCWWN5?=
 =?utf-8?B?a1pxL2hWdWxUdkhyRWovRFFOdE16RjNzZllPYjI1bXhIMVVzalhiMy9USnA1?=
 =?utf-8?B?K2NHWTVVZ2lRNXVSZ2ZIQ2xjRVhjeFE2TTJvTnNTQ0JvcU5jQ2tZS0VVbjNH?=
 =?utf-8?B?Z0N1c29ta21rRThvVlpGV2RGNGEvT0l3T095K3RoajJLaHYrNzRqMzUwZWtB?=
 =?utf-8?B?SjJZUm5jSFpHOVdNWTBNRXlLZ05iY0pxREk3SlJOcXhmS1lLTnZmalJiVmZx?=
 =?utf-8?B?V3dSZFZCWUVKeDZIaElJTkRqb2EvTnBjKzMvQkdGWSt5Vy9KSFZsSWxLcXp4?=
 =?utf-8?B?cHk1TGNhMFlkQUxrRDVkczNNYm1ndVdoZ2xNZ2hMOEVaQmhhVHlCZSszMnhr?=
 =?utf-8?B?OGViZExLRnk4ZHVCb0VtUUxSUERVRFlCWkc3aWpRbUI4VnFUb1k2Yml4SHF2?=
 =?utf-8?B?ZVIxY1VaejhHNUcxa2V2eVYwa3VCKzVyV2NaOExZckE2UmowRFZ0VDZJREVN?=
 =?utf-8?B?ZEh2RWpqYVQ1bnJXT3ltZFBqdGM2blhrZXF6RlJ4Wk1sZXlGdGdQRVY5cjZq?=
 =?utf-8?B?WnpXN2ZxZ3J5Wk9iYnJMTHB3Unk4Q01EWmoraEt5aGhtanBEa0Fnd1djeU4z?=
 =?utf-8?B?eXR0K25tVUh5UVJjNTY4SWx6b05UV09PclNFVXRtS1gwT3VRWk1XMmdXVzh6?=
 =?utf-8?B?Z2E2VUUvcXFuVUo4TVJMdzFSdjRBVzN0b2JqMzFuZVRXc2VTRmlsdW5vN2xi?=
 =?utf-8?B?ZTdleTZSMmM4dDVqb3FrTnFFZ1FZa283SGlUblJOMHYzTkdvaFNyVXVNNFMw?=
 =?utf-8?B?TEJvdEhHU2wxRU1NT2lBeUs1eURITjVabGRUcldZcHpZTnpnTlpYRWp2eGJn?=
 =?utf-8?B?TzVDcWcwbmsvakx4QThKRUlIRkN2eWZyK3h0Mm9lOHk4R3Y2c3hSa1FYZndK?=
 =?utf-8?B?ME9kU2J3bjQ1a2JFdU5xcUJXajBmYjdnb3FHOEdOWkdpdzVtRW9tRzdUdTRr?=
 =?utf-8?B?VEJodDZHL29yWVJsTEZiamxyVzViMldMdTEzc2czbEVSZ3cwM1V0RHdDTHk4?=
 =?utf-8?B?aFhBWmsvNWQ4ZDlMblFkSzJGZmU3ZFhoa2M5OTdEOWZYdTlvSnZUdkIvdFNT?=
 =?utf-8?B?bnlFMW9lM1d2Nm1zU3B0a2RMZUlaWWhjVUZmSk51TXliSE5pOUJNQm9KUVha?=
 =?utf-8?B?bERPTFBTT0YxVEMwdnNubjF3UFFtQStPcVA0VjZNT3NaY0gyT0NFVE42UFJs?=
 =?utf-8?B?UUZqSXZLOU15bzlLNlluMkhUUWovTit5Q2poa3BxMVEySFJlTWlYRE9jcFd2?=
 =?utf-8?B?cGROL0xaQXVVU01oWXdZb0hhVStLdGNQN05ZYnl1M1VCMzViYVBxWmhUcDNF?=
 =?utf-8?B?bENudmlzMFlJbitnam1xY3JyNER6UmlOTWZTaUVnUUxYdGFZc3dQQmNlWVFY?=
 =?utf-8?B?TmdPSURBajFTK0tkUUhvNGVJdVcyWEQ5S1ExeFRVMzZrZ1FjckEveVl3WVZ0?=
 =?utf-8?B?K043elRVY2hGSDlGdmgyUG1ManptKzdLdjNCRjJMYVJJOEhReVdxSDJGLzds?=
 =?utf-8?B?QnZ1dlZPK1FTc2tLbFV3SVRnQ1h0bFVGR0cxSWlFeXJ1NTI1ZnZxQzFUQ3FN?=
 =?utf-8?B?L1RVb3MvUWdGOHd6UE92dFBQU1hJbFZNd1FZZUlzcGV5OWRYM3Z0bnFWamc1?=
 =?utf-8?B?Z2crQmhSMGNQRWE1Wmhwb1VydHlVUTRmc3d3dytDdDh0WTM1K2g0WFBDZUtZ?=
 =?utf-8?B?c3ZuNURSMWpSelJjM2VySndSSU1UK3lmbDNCNXJaWG9pdnY2ZDlPdzRNQUFQ?=
 =?utf-8?B?UUNJMWZMNEl1eVVrTzBTSERDUUs3TnBOV0lPYXNIdXJ5YWxPbDlJa0JKZ09h?=
 =?utf-8?B?VFlDWm8wOTRSd1MvREhpQWNpOXlpcEY1cU0rK3oxdFRGZVVmMytMU3BFa20w?=
 =?utf-8?B?dzZPVEQ5U1V0SXJaaGpxYkhIdzZ2N1N5dkt0MldQYkF4RFUxV2ZOYk91ZEo3?=
 =?utf-8?B?U3l2UDVrSXhFVDVRbzdBN2U4K1NDWWRnR3hqalh1Q0IvdGNYS3Jzam1uNUJa?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cf10c4-a82e-44f7-0559-08dd4e2c20ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 01:49:19.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSm6rm925+s0siUOdyRNL7fqcHZF3TDXib1NmMHjkO3xv+13pcJo3jBLemhiONoseRz++2Wi2lfg6sDRXCJD3SjecTXLVkJbT1gXB0O9S64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

On Wed, Feb 12, 2025 at 06:39:47PM -0800, Dixit, Ashutosh wrote:
> On Wed, 12 Feb 2025 15:54:41 -0800, Harish Chegondi wrote:
> >
> > On Mon, Feb 10, 2025 at 03:07:51PM -0800, Dixit, Ashutosh wrote:
> > > On Mon, 10 Feb 2025 05:46:43 -0800, Harish Chegondi wrote:
> > > >
> > >
> > Hi Ashutosh,
> > > Hi Harish,
> > >
> > > > A new hardware feature first introduced in PVC gives capability to
> > > > periodically sample EU stall state and record counts for different stall
> > > > reasons, on a per IP basis, aggregate across all EUs in a subslice and
> > > > record the samples in a buffer in each subslice. Eventually, the aggregated
> > > > data is written out to a buffer in the memory. This feature is also
> > > > supported in XE2 and later architecture GPUs.
> > > >
> > > > Use an existing IOCTL - DRM_IOCTL_XE_OBSERVATION as the interface into the
> > > > driver from the user space to do initial setup and obtain a file descriptor
> > > > for the EU stall data stream.  Input parameter to the IOCTL is a struct
> > > > drm_xe_observation_param in which observation_type should be set to
> > > > DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> > > > DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> > > > drm_xe_ext_set_property structures in which each structure has a pair of
> > > > property and value. The EU stall sampling input properties are defined in
> > > > drm_xe_eu_stall_property_id enum.
> > > >
> > > > With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> > > > can enable and disable EU stall sampling with the IOCTLs:
> > > > DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> > > > User space can also call poll() to check for availability of data in the
> > > > buffer. The data can be read with read(). Finally, the file descriptor
> > > > can be closed with close().
> > > >
> > > > v9: Changed some u32 to unsigned int.
> > > >     Moved some code around as per review feedback from v8.
> > > > v8: Used div_u64 instead of / to fix 32-bit build issue.
> > > >     Changed copyright year in xe_eu_stall.c/h to 2025.
> > > > v7: Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
> > > >     to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
> > > >     OA. Renamed the corresponding internal variables.
> > > >     Fixed some commit messages based on review feedback.
> > > > v6: Change the input sampling rate to GPU cycles instead of
> > > >     GPU cycles multiplier.
> > > >
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile         |   1 +
> > > >  drivers/gpu/drm/xe/xe_eu_stall.c    | 280 ++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_eu_stall.h    |  16 ++
> > > >  drivers/gpu/drm/xe/xe_observation.c |  14 ++
> > > >  include/uapi/drm/xe_drm.h           |  38 ++++
> > > >  5 files changed, 349 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index be73362ef334..05bcb9941c38 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> > > >	xe_device_sysfs.o \
> > > >	xe_dma_buf.o \
> > > >	xe_drm_client.o \
> > > > +	xe_eu_stall.o \
> > > >	xe_exec.o \
> > > >	xe_exec_queue.o \
> > > >	xe_execlist.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > new file mode 100644
> > > > index 000000000000..0ceb3091f81e
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -0,0 +1,280 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/anon_inodes.h>
> > > > +#include <linux/fs.h>
> > > > +#include <linux/poll.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include <uapi/drm/xe_drm.h>
> > > > +
> > > > +#include "xe_device.h"
> > > > +#include "xe_eu_stall.h"
> > > > +#include "xe_gt_printk.h"
> > > > +#include "xe_gt_topology.h"
> > > > +#include "xe_macros.h"
> > > > +#include "xe_observation.h"
> > > > +
> > > > +static size_t per_xecore_buf_size = SZ_512K;
> > > > +
> > > > +/**
> > > > + * struct eu_stall_open_properties - EU stall sampling properties received
> > > > + *				     from user space at open.
> > > > + * @sampling_rate_mult: EU stall sampling rate multiplier.
> > > > + *			HW will sample every (sampling_rate_mult x 251) cycles.
> > > > + * @wait_num_reports: Minimum number of EU stall data reports to unblock poll().
> > > > + * @gt: GT on which EU stall data will be captured.
> > > > + */
> > > > +struct eu_stall_open_properties {
> > > > +	unsigned int sampling_rate_mult;
> > > > +	unsigned int wait_num_reports;
> > >
> > > I already said no need to be so specific. Just use int or u32 as types for
> > > these.
> > Okay, will try to change these back to u8/u32 in the next version.
> 
> Use int or u32, not u8.
Any reason why I can't use u8? The maximum value of sampling_rate_mult
is 7.
> 
> > >
> > > > +	struct xe_gt *gt;
> > > > +};
> > > > +
> > > > +/**
> > > > + * num_data_rows - Return the number of EU stall data rows of 64B each
> > > > + *		   for a given data size.
> > > > + *
> > > > + * @data_size: EU stall data size
> > > > + */
> > > > +static u32 num_data_rows(u32 data_size)
> > > > +{
> > > > +	return (data_size >> 6);
> > > > +}
> > > > +
> > > > +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> > > > +					   struct eu_stall_open_properties *props)
> > > > +{
> > > > +	value = div_u64(value, 251);
> > > > +	if (value == 0 || value > 7) {
> > > > +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	props->sampling_rate_mult = value;
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int set_prop_eu_stall_wait_num_reports(struct xe_device *xe, u64 value,
> > > > +					      struct eu_stall_open_properties *props)
> > > > +{
> > > > +	unsigned int max_wait_num_reports;
> > > > +
> > > > +	max_wait_num_reports = num_data_rows(per_xecore_buf_size * XE_MAX_DSS_FUSE_BITS);
> > >
> > > This seems wrong. Instead of XE_MAX_DSS_FUSE_BITS, shouldn't we use the
> > > value returned by xe_gt_topology_mask_last_dss()?
> > Yes you are correct. But not xe_gt_topology_mask_last_dss() as it would
> > only return the last DSS and the DSSes can be discontiguous. We should
> > use the absolute number of DSSes * buffer size. I can move this
> > validation to xe_eu_stall_stream_init() where we can do a
> > bitmap_weight(all_xecore) to find the actual number of DSSes and return
> > EINVAL if invalid input. I did a simple validation here as I wasn't sure
> > if it is worth doing the extra validation.
> > >
> > > Note that a large value can result in the poll/read never getting
> > > unblocked!
> > >
> > > To solve this issue I think num_xecore should be maintained in struct
> > > xe_eu_stall_gt. Though let's see what happens to 'struct xe_device *' arg
> > > to these functions if we do this.
> > Probably not required if this validation is done in
> > xe_eu_stall_stream_init() added in the next patch as I described above.
> 
> OK, we can do that. But in that case just check for 0 below, remove all the
> drm_dbg's and also remove max_wait_num_reports, since that will be
> validated in xe_eu_stall_stream_init(). So that we are not doing any
> invalid validation here and correcting it later. Maybe even check for 0 in
> xe_eu_stall_stream_init. You can add xe_gt_dbg's there if needed, or even
> create a small new function.
> 
> Actually I was wrong in saying "num_xecore should be maintained in struct
> xe_eu_stall_gt" because xe_eu_stall_stream_open() is a device level
> function so only xe_device is available there not xe_gt. So if we were to
> store num_xecore, we'd need to create a new device level xe_eu_stall struct
> and put num_xecore there. This is also device level information. E.g. OA
> has both device and gt level structs.
> 
> So depends on you. But we can do xe_eu_stall_stream_init for now.
> 
> > >
> > > > +	if (value == 0 || value > max_wait_num_reports) {
> > > > +		drm_dbg(&xe->drm, "Invalid EU stall event report count %llu\n", value);
> > > > +		drm_dbg(&xe->drm, "Minimum event report count is 1, maximum is %u\n",
> > > > +			max_wait_num_reports);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	props->wait_num_reports = value;
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> > > > +				   struct eu_stall_open_properties *props)
> > > > +{
> > > > +	if (value >= xe->info.gt_count) {
> > > > +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	props->gt = xe_device_get_gt(xe, value);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> > > > +					struct eu_stall_open_properties *props);
> > > > +
> > > > +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> > > > +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> > > > +	[DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS] = set_prop_eu_stall_wait_num_reports,
> > > > +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> > > > +};
> > > > +
> > > > +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> > > > +					     struct eu_stall_open_properties *props)
> > > > +{
> > > > +	u64 __user *address = u64_to_user_ptr(extension);
> > > > +	struct drm_xe_ext_set_property ext;
> > > > +	int err;
> > > > +	u32 idx;
> > > > +
> > > > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > > > +	if (XE_IOCTL_DBG(xe, err))
> > > > +		return -EFAULT;
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> > > > +	    XE_IOCTL_DBG(xe, ext.pad))
> > > > +		return -EINVAL;
> > > > +
> > > > +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> > > > +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> > > > +}
> > > > +
> > > > +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> > > > +					     struct eu_stall_open_properties *props);
> > > > +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> > > > +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> > > > +};
> > > > +
> > > > +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > > > +				       struct eu_stall_open_properties *props)
> > >
> > > What is the reason for not using the ext_number argument here, which is
> > > used in both exec_queue_user_extensions and in xe_oa_user_extensions?
> >
> > When I reused this code from the OA code it didn't have the ext_number.
> > I will check that out and make the change.
> > >
> > > The reason for ext_number is that the extensions can be chained in a loop,
> > > which can cause an infinite loop in the kernel when parsing these
> > > extensions. ext_number is used to break out of these potential infinite
> > > loops.
> > >
> > > > +{
> > > > +	u64 __user *address = u64_to_user_ptr(extension);
> > > > +	struct drm_xe_user_extension ext;
> > > > +	int err;
> > > > +	u32 idx;
> > > > +
> > > > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > > > +	if (XE_IOCTL_DBG(xe, err))
> > > > +		return -EFAULT;
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> > > > +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> > > > +		return -EINVAL;
> > > > +
> > > > +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> > > > +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> > > > +	if (XE_IOCTL_DBG(xe, err))
> > > > +		return err;
> > > > +
> > > > +	if (ext.next_extension)
> > > > +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> > > > + *
> > > > + * @file: An xe EU stall data stream file
> > > > + * @buf: destination buffer given by userspace
> > > > + * @count: the number of bytes userspace wants to read
> > > > + * @ppos: (inout) file seek position (unused)
> > > > + *
> > > > + * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
> > > > + * before calling read().
> > >
> > > We can just retain these two lines of comment. See below.
> > >
> > > > + *
> > > > + * Returns: The number of bytes copied or a negative error code on failure.
> > > > + */
> > > > +static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > > > +				       size_t count, loff_t *ppos)
> > > > +{
> > > > +	ssize_t ret = 0;
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> > > > + *
> > > > + * @file: An xe EU stall data stream file
> > > > + * @wait: Poll table
> > > > + *
> > > > + * Returns: Bit mask of returned events.
> > > > + */
> > > > +static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> > > > +{
> > > > +	__poll_t ret = 0;
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
> > > > + *
> > > > + * @file: An xe EU stall data stream file
> > > > + * @cmd: the ioctl request
> > > > + * @arg: the ioctl data
> > > > + *
> > > > + * Returns: zero on success or a negative error code.
> > > > + *	    -EINVAL for an unknown ioctl request.
> > > > + */
> > > > +static long xe_eu_stall_stream_ioctl(struct file *file,
> > > > +				     unsigned int cmd,
> > > > +				     unsigned long arg)
> > > > +{
> > > > +	switch (cmd) {
> > > > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > > > +		return 0;
> > > > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	return -EINVAL;
> > >
> > > Just return 0 or -EINVAL in this patch since you are going to add locking
> > > in a later patch.
> > You mean remove the switch statement completely and just return 0 or
> > EINVAL? The intention of this switch statement is to specify the two
> > IOCTLs that will be supported in the uAPI.
> 
> Each patch just has to compile and pass checkpatch. You can add the switch
> statement in the later patch which adds locking, in
> xe_eu_stall_stream_ioctl_locked (to avoid unnecessary code movement, see
> deleted lines in that patch).
> 
> > >
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
> > > > + *			      stream file.
> > > > + * @inode: anonymous inode associated with file
> > > > + * @file: An xe EU stall data stream file
> > > > + *
> > > > + * Cleans up any resources associated with an open EU stall data stream file.
> > > > + */
> > >
> > > As I said before, these comments are completely redundant. These are
> > > standard file_operations. There are one million instances of these in the
> > > kernel, all of them have exactly the same arguments.
> > >
> > > If you have anything specific to EU stall here, we can leave it. Otherwise
> > > I'd still say get rid of them.
> > >
> > > Or get rid them now and send a patch later to add them, we can review that
> > > patch later, if you really think they add value. They were included in
> > > i915_perf.c, but I don't think they should be in Xe.
> > >
> > > If you think these comments should be there, let's get a second opinion,
> > > from one of the maintainers.
> > >
> > Okay, will get feedback from a maintainer and will update.
> > > > +static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct file_operations fops_eu_stall = {
> > > > +	.owner		= THIS_MODULE,
> > > > +	.llseek		= noop_llseek,
> > > > +	.release	= xe_eu_stall_stream_close,
> > > > +	.poll		= xe_eu_stall_stream_poll,
> > > > +	.read		= xe_eu_stall_stream_read,
> > > > +	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
> > > > +	.compat_ioctl   = xe_eu_stall_stream_ioctl,
> > > > +};
> > > > +
> > > > +static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> > > > +{
> > > > +	return false;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eu_stall_stream_open - Open a xe EU stall data stream fd
> > > > + *
> > > > + * @dev: DRM device pointer
> > > > + * @data: pointer to first struct @drm_xe_ext_set_property in
> > > > + *	  the chain of input properties from the user space.
> > > > + * @file: DRM file pointer
> > > > + *
> > > > + * This function opens a EU stall data stream with input properties from
> > > > + * the user space.
> > > > + *
> > > > + * Returns: EU stall data stream fd on success or a negative error code.
> > > > + */
> > > > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > > > +			    u64 data,
> > > > +			    struct drm_file *file)
> > > > +{
> > > > +	struct xe_device *xe = to_xe_device(dev);
> > > > +	struct eu_stall_open_properties props = {};
> > > > +	int ret, stream_fd;
> > > > +
> > > > +	if (xe_observation_paranoid && !perfmon_capable()) {
> > > > +		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> > > > +		return -EACCES;
> > > > +	}
> > > > +	if (!has_eu_stall_sampling_support(xe)) {
> > > > +		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> > > > +		return -EPERM;
> > >
> > > I think we are using -ENODEV for this, at least in OA.
> > Okay.
> > >
> > > > +	}
> > >
> > > Move this has_eu_stall_sampling_support at the top, this should be even
> > > before the perfmon_capable check.
> > Will move.
> > >
> > > > +
> > > > +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	if (!props.gt) {
> > > > +		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > This check is not needed. props.gt cannot be NULL the way
> > > set_prop_eu_stall_gt_id is implemented.
> > If the user doesn't pass a GT ID, it will be NULL.
> 
> Yeah I commented on this later. Depends on whether we use a default gt_id
> of 0 or not.
> 
> > >
> > > If you need it, use xe_assert(props->gt) in set_prop_eu_stall_gt_id.
> > >
> > > > +
> > > > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, NULL, 0);
> > > > +	if (stream_fd < 0)
> > > > +		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > > > +
> > > > +	return stream_fd;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > new file mode 100644
> > > > index 000000000000..d514e78341d5
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > @@ -0,0 +1,16 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __XE_EU_STALL_H__
> > > > +#define __XE_EU_STALL_H__
> > > > +
> > > > +#include <drm/drm_device.h>
> > > > +#include <drm/drm_file.h>
> > > > +#include <linux/types.h>
> > >
> > > Because these lines are replaced in a future patch with '#include
> > > "xe_gt_types.h"', just do that in this patch itself.
> > Okay.
> > >
> > > Also, as I said, I am not going to focus too much on the patches, only the
> > > final code, but in general, if you are deleting lines in these initial
> > > patches, think hard about why you need delete those lines and what you
> > > could do differently.
> > >
> > > > +
> > > > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > > > +			    u64 data,
> > > > +			    struct drm_file *file);
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> > > > index 8ec1b84cbb9e..cca661de60ac 100644
> > > > --- a/drivers/gpu/drm/xe/xe_observation.c
> > > > +++ b/drivers/gpu/drm/xe/xe_observation.c
> > > > @@ -9,6 +9,7 @@
> > > >  #include <uapi/drm/xe_drm.h>
> > > >
> > > >  #include "xe_oa.h"
> > > > +#include "xe_eu_stall.h"
> > > >  #include "xe_observation.h"
> > > >
> > > >  u32 xe_observation_paranoid = true;
> > > > @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> > > >	}
> > > >  }
> > > >
> > > > +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> > > > +			     struct drm_file *file)
> > > > +{
> > > > +	switch (arg->observation_op) {
> > > > +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> > > > +		return xe_eu_stall_stream_open(dev, arg->param, file);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_observation_ioctl - The top level observation layer ioctl
> > > >   * @dev: @drm_device
> > > > @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> > > >	switch (arg->observation_type) {
> > > >	case DRM_XE_OBSERVATION_TYPE_OA:
> > > >		return xe_oa_ioctl(dev, arg, file);
> > > > +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> > > > +		return xe_eu_stall_ioctl(dev, arg, file);
> > > >	default:
> > > >		return -EINVAL;
> > > >	}
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 892f54d3aa09..1d79621f267b 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -1496,6 +1496,8 @@ struct drm_xe_wait_user_fence {
> > > >  enum drm_xe_observation_type {
> > > >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> > > >	DRM_XE_OBSERVATION_TYPE_OA,
> > > > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > > > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > > >  };
> > > >
> > > >  /**
> > > > @@ -1848,6 +1850,42 @@ enum drm_xe_pxp_session_type {
> > > >  /* ID of the protected content session managed by Xe when PXP is active */
> > > >  #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> > > >
> > > > +/**
> > > > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > > > + *
> > > > + * These properties are passed to the driver at open as a chain of
> > > > + * @drm_xe_ext_set_property structures with @property set to these
> > > > + * properties' enums and @value set to the corresponding values of these
> > > > + * properties. @drm_xe_user_extension base.name should be set to
> > > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > > > + *
> > > > + * With the file descriptor obtained from open, user space must enable
> > > > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > > > + * calling read(). EIO errno from read() indicates HW dropped data
> > > > + * due to full buffer.
> > > > + */
> > > > +enum drm_xe_eu_stall_property_id {
> > > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> > > > +	 * EU stall data will be captured.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > > > +	 * in GPU cycles.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> > > > +	 * EU stall data reports to be present in the kernel buffer
> > > > +	 * before unblocking poll or read that is blocked.
> > >
> > > before unblocking a blocked poll or read
> > Okay
> > >
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> > > > +};
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.48.1
> > > >
> >
> > Thank you
> > Harish.
