Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E0C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B610E324;
	Mon,  8 Jul 2024 21:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5XAJlHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A4110E324
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474636; x=1752010636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O1hvcAf3uKVuc98BA98XUIJofSiy161pRTiera5dA8U=;
 b=d5XAJlHbD3aaOys2LsxzkhLnqSoIWg8WKkOb1wnzA63uJAct8V8MAiUR
 2W9YmnKPrcyai2ayxNKR5Cuk7V87zStgxijItdn7/EwP3KubmBcYiCxfy
 1D3Wb+YWVwIBEx1pN4D7icqYD3Zil+o2ZsBjS/MsyzRTFoXjRu5h706C3
 fNtAXUbr+jLhFqlcqOlVP3A3awmMyqyntWzdllbG4Bg5mnGyAkE08+8La
 XQ+cXeV8vsGiflrVD5/1pPBvEXlFefaJx4XBMBjYvzpgPeejsYQG6JjWV
 vux4g0YTaOlNnU8RhKaUkIFryTTtL5md1dIvJgZRY1dqkQNq8ugOwlJ1C g==;
X-CSE-ConnectionGUID: l8x755u7QYCgZM8M997vag==
X-CSE-MsgGUID: 6XR4OitKQLWNw2VvbuI3Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35138592"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="35138592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:37:15 -0700
X-CSE-ConnectionGUID: iIt+hBQATG6ZQD5DDlit7w==
X-CSE-MsgGUID: aBmZZtm1TbOOnxuJUNIDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47712799"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:37:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:37:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:37:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:37:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALyCBnnCjgpJdp3FFPkepwM+wGZ6/joG0l1yUx2AVfZbDu6Y6M/XhNCJczINLGuwRkqkx8aUhroLUNu2R7/xMv4guIkdt6aFrXUVTukFDls1a/BHC5Sm3Y0Ewjffn4LKqAW02viH9XmfI9i38nixTOcyfmv0U4h6np505nJknOKgOhk/dgMqI8cHHt2/XW+Dbfk+HyJrP1l3HqknhfKLqKw1uD4ARgtDmvqvQgS2WbREC8iN+SahnA9P/BNThN1toJc2u0P0jSOluMsABZ+X+sSFYS0cwyINVDC43nGqASRkNJygYNCcAsR3vr+0Swqs1qpVwhJfu+f1+oH75hQHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0/lTMCsq0mgtRK61EAeG/V/drPeFv3kGjGkFgY2A1o=;
 b=GDTB90/Gvvi8/AglQjrjRTm0bp+46HxR94N022lV1qb0QjOszJMfP/9i9i/5gzS9nVpMsSjI6SUlKfTH5dUvF1aDc4MDv7hoejzlxha9Aa/Y3L/mr+7bpAi1AcJ6LHRxL4WSQ714W6xjOUdtqEEcSpodfJU1YzjLDI5JarpuE5MSCAbYX7fbghKnnY4VPF0pCezGfrg66CFbLgo2aCMF/rxLJ3KGgLgSJZcUZrtq2qZl7dhD5B3ZWJQCMBwAwxMc7wZgr5gPdhWdCrJ1qeICBxSyHMfANqlmN55dh0uyZPXCmSSuChY9iY+wbD65oO9cfCYM1n9dhS3kUPWYhzgZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 21:37:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 21:37:13 +0000
Date: Mon, 8 Jul 2024 16:37:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 0/5] Have xe_vm and xe_exec_queue take references to xef
Message-ID: <ebgbtrfdimxzzbe5hlv7shnpl55xdx3epayvwrv5ckepqbrotd@tzt3chulb6fc>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0369.namprd04.prod.outlook.com
 (2603:10b6:303:81::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cee39f-08d6-4b4f-366f-08dc9f96210b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9sDFdiDTZgZQuRyDfDDeLTfSC17mFTkf7Lr44iTzjN9KWP1eDRi/cY7X2Vy4?=
 =?us-ascii?Q?qvC8sv+4tzxppmVSO7VEdDv337FZ+VVPMgKWh5E7N4QV1VtMcHEkSuUBQ+6c?=
 =?us-ascii?Q?mKZACLB/Wu5YmNoCKAiixoIwzGQtNT0Ks/ECTvnCYYwA/nHn2Zfg4Ikfwc4W?=
 =?us-ascii?Q?cxd1sIaEZclIRZ54HFR8LTdSEAGZtQwvShriWCL790VurBS2ahLe+8WODCDK?=
 =?us-ascii?Q?9FvAWNEbz8O1MypVbQpFlp+cToay7rGU2dZ2L+1ZxEgPDlXyYUTIpLb+AMvJ?=
 =?us-ascii?Q?tV5qTRWK7NkFTfO9ccIe32pebEqmY7dkLFcNOoyilBDOOB0G2YKHI8b4lonk?=
 =?us-ascii?Q?pohFDhv2VYOwg1oC9Qc8+T6MbQCoKdAK9eUpPwYZDMvDq9hl4MpEDX0LOHXF?=
 =?us-ascii?Q?8Ne+ryo3iw9X6OkxHGiD3gwuQGPQ8Jc1jt4Hp6MWUC9dhtjsFYGpbvq6FCGJ?=
 =?us-ascii?Q?i1koZIEgCUVO5aQRnJbAX+wwK37YqtdEbnrgJMu9soDRMSh9koByEw7m2azh?=
 =?us-ascii?Q?YlHguH1l+sYN8UmzoCJ4hLoERPUzADJpODS1eJNvHd180ZLMzOeOCsZkoVyS?=
 =?us-ascii?Q?+GmnQaj3uSEG18uIyDiTfwCLWE8HAQveuBIjWDXEW+f+MB6vFrc+Xqk4Zlay?=
 =?us-ascii?Q?vhF/fx44CFy+2QujLY0uL16w+b+H04ffXMrqUfu9aWhOuKyxUbWjO2rvT993?=
 =?us-ascii?Q?Yzz+T48jys/oDqOqpDUmTtfMgB8+lRnQ9TNdsBlu2QWESJs8F0QwijXaqyAo?=
 =?us-ascii?Q?fgM/bUVcODMBvATginZDVuAaO0ZEY5Bvl2rpcVM1eGB0JvM7gbhWeEgI3iev?=
 =?us-ascii?Q?crRUu9wi/HoTHmhto/F8ph/TXeXj7iql6UW/M7GW1ExJzzwaz7pKMPU91xDZ?=
 =?us-ascii?Q?Vgqumcv0SLtuOFL3dS6oxDun9jMuRVvr/v7SxBY/w5eqUFXx6o+78nOzdudz?=
 =?us-ascii?Q?7oEvLlpa9NbR0DKQl6gdhwakxq0YC+zoJJgwhKLZGF2GTGBKmUaUVGlK/JL2?=
 =?us-ascii?Q?mXycfih78B3hXDc3dqZmpm1HsgQ1uaxbtzzHuCzvP1bG9VvYcsHJmTy1yyNr?=
 =?us-ascii?Q?RfDbiYtUOZjOBQQX0hSUP+aXT3mvJ1wG/y/zHP9y0iJgZXnXmvmqcb5GOpu1?=
 =?us-ascii?Q?seSF5gs0cW5f3na8XpL1BeyXmu48RNOdZH6GJhPtbC7ingKLUb19cnljRDBF?=
 =?us-ascii?Q?SGVoS0/7gBMoDCsQ1foIux62c5qnb8FSwUwRJe5X/2pyZ7GFe+bpSAQUci2W?=
 =?us-ascii?Q?WuST+/XlmRsHrCtnOsEUuDgw1Gh/M3UyKRz4BwjCEOWAYNDpitIKOwf23jw9?=
 =?us-ascii?Q?iU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Uva2Ye71H5ZUu6zb15iagGXphnjKuhR6RmVhEa+AIX6080hFcD2304lERus?=
 =?us-ascii?Q?0l3MxbxWOZTayPTxiaxFWt4zgINnPvWUtRFmlWnv8UayHAY1VL9jrsbzF0a9?=
 =?us-ascii?Q?3CpXB+DZsB6CsDg+y+zXJpdZjQZ1M4KO743QfYk6P0ie/WwrnB1sNFJbHtdP?=
 =?us-ascii?Q?AVBRMZdRAS6mNJBPCVrhCwbw+1ca6Gwwgqq2NPGxENmnZfGewzQxJpj7XI7v?=
 =?us-ascii?Q?EgLYRTewXYtyRKBD0zCh6r6q+tpDCYUQSFq4KvRw3FqFIj703Q8NzrGChkHG?=
 =?us-ascii?Q?RDzbMlveWN4qOu+DH5zX4ksWcHjnEKLBPTesD7FQDatwginkozAKG6TR+Oo9?=
 =?us-ascii?Q?Q0BiWY+OXO5hXoiIzAOMXC1LuNvBTrA/mbWhkUATaTgKjyfVyf+dx5cQITAO?=
 =?us-ascii?Q?RDZHsjZrZuDxKkopBZtLCszPeFyniXrcAYLVqxm1Ks0UNH1Hc2NR8nI4AMF3?=
 =?us-ascii?Q?wz+nbQahoyGL7Vk+1C2cY3fdPv7mGH/53/DAp4d4B2ubL5ROIYbl4VotNvtp?=
 =?us-ascii?Q?CvCtf0dbo/pm2hcYQnKJX+nJYPEkDlsSbWsjHV9jFcg2WsBNitm5rV4WQnfM?=
 =?us-ascii?Q?3T/smHY1f18dOTX2rq3IvNgVS1nIr9swBkM30pDcWZNakHfhiANQb+nTk5Ck?=
 =?us-ascii?Q?7lSEM2ZZckPWwTq8gCGak3A3KrfThPEayNf2bIfNAtZBVn2xWzJW8qNMPFoH?=
 =?us-ascii?Q?DrXN7UUuxgyxPu7qDUL2mb8TedFH5m/ZQMgC/UgDGToc6I0ZamDQdSATJyjt?=
 =?us-ascii?Q?+2ZbCDXg2WrJ0rI8qw57KxkSWQzwoU/bcUq4XT6MJGeywgyEO7UBVqZY+C8Q?=
 =?us-ascii?Q?nwijnaIE7qrmR+RRA+BEiU2hnk2nH0REX3Dbhn1PyXFl5dJ5XYJIuFQWrCoI?=
 =?us-ascii?Q?VLmrFMwXh0DYFN7LdMV7dszy8ojQcjXQTPJJzzeqHs0dZ33ehEOXKPXlWMjg?=
 =?us-ascii?Q?YvAtdeV+VtNnWmCmOGtswik3ul5PWxFbUUAaUOJBWa4or/EYqhB6kWau3A9w?=
 =?us-ascii?Q?1QcQxhym6aDxNnC7xLC+XeeezwB2ftuDQHIQpoS+YbYStA7f04anR+Rrk5Mt?=
 =?us-ascii?Q?k1qzhoMXBkb/gjf685sKQLu9xVUB31yMZ8bWZe1IsNsV4GDqCCB1xXkkLcnh?=
 =?us-ascii?Q?1vPMPpQtZPcFImaDJxpwdnJgiq9y2Q/9wm25MJTj+3JShscMC2elv7EujQTB?=
 =?us-ascii?Q?XziJa41O1mqYlqsDOfwICy3Q9xBcbYZU/7im1IYbLdGu0FbA9z9pB7/tkrqU?=
 =?us-ascii?Q?83qdjaYXkWy8boBpOW6uVIc+b1pSa23EP1ZyKMhlwqcC7ABJuuuRXfQ2CsXg?=
 =?us-ascii?Q?Z6oroLc+C3PTLDoN47b4HzsZf9haoww50l9vEobPzXpkhzza53+tvfh+Yv2u?=
 =?us-ascii?Q?C5mwPPiYDW7vO1CZeZAVTnJbWrfqGTx2acFPIzbJbdykqy+yEnPIM4X+ibtG?=
 =?us-ascii?Q?umLQHk+IbLEYThkEAMtxGeZDQahkmQBGGRUDd2mnbn+VZhc3VLiPkx2NzXt8?=
 =?us-ascii?Q?9f56C581Fl7UZMqXTPDErK+CfQyd4FodcV7CVE9P4iui8gPSo87nsXdvRvBw?=
 =?us-ascii?Q?A0e2Vhlc8y5cwHJ+hLrZ7+ZDwkSpX2Y8jMX2hKPhM08Ql88ICDekjxsKqvGJ?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cee39f-08d6-4b4f-366f-08dc9f96210b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:37:13.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMNAyadUV+Vc46cGac0EMVWKRSDtVuC17L9A8XcIblZ9HIDjLPJkX1qe91y3ndDw9j663GwWXuOvSO2bFibyAT6w+FSG1EKFR6pf/H5hnVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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

On Mon, Jul 08, 2024 at 01:20:58PM GMT, Umesh Nerlige Ramappa wrote:
>xe_file_close triggers an asynchronous queue cleanup and then frees up
>the xef object. Since queue cleanup flushes all pending jobs and the KMD
>stores client usage stats into the xef object after jobs are flushed, we
>see a use-after-free for the xef object. Resolve this by taking a
>reference to xef from it's users - xe_exec_queue and xe_vm.
>
>Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>
>@Maintainers
>I need to use the below tags in the patches, but not sure which patches
>to apply these on since all patches are part of the fix.
>
>Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

I think we can merge the first prep patches, and then use the stable
syntax as detailed in docs:

	Additionally, some patches submitted via Option 1 may have
	additional patch prerequisites which can be cherry-picked. This
	can be specified in the following format in the sign-off area:

	Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
	Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
	Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
	Cc: <stable@vger.kernel.org> # 3.3.x
	Signed-off-by: Ingo Molnar <mingo@elte.hu>

However we should probably squash the last 2 patches and then make it
have 2 Fixes: pointing to both the first original commit and the fix
being replaced since it was not a complete fix.

Lucas De Marchi

>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Umesh Nerlige Ramappa (5):
>  drm/xe: Move part of xe_file cleanup to a helper
>  drm/xe: Add ref counting for xe_file
>  drm/xe: Take a reference to xe file when user creates exec_queue
>  drm/xe: Take a ref to xe file when user creates a VM
>  Revert "drm/xe: Do not access xe file when updating exec queue
>    run_ticks"
>
> drivers/gpu/drm/xe/xe_device.c           | 39 +++++++++++++++---------
> drivers/gpu/drm/xe/xe_device.h           | 12 ++++++++
> drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
> drivers/gpu/drm/xe/xe_drm_client.c       |  5 +--
> drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++++-
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++---
> drivers/gpu/drm/xe/xe_vm.c               |  5 ++-
> 7 files changed, 58 insertions(+), 24 deletions(-)
>
>-- 
>2.38.1
>
