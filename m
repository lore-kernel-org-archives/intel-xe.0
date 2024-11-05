Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50455D3610E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 19:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2D210E609;
	Tue,  5 Nov 2024 19:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiW1aKLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58B310E03D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 19:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730835088; x=1762371088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pBRu0dGIywxVbPXzZW8YNzBX4SZaCw+hUsC99T2TJiY=;
 b=hiW1aKLVXQLiiImz5yxi8K2i1Kz8iCiDvxqiXtC4jq92PiS1GHro508z
 1RzFDued53MtZBLaWjfF9sDwlXkucgK/nuhsxWfyA7tNzoCGRccAw7SBk
 Vheg8h8rT7wqcx8S+ImZeIrkCyJfC36YkeoSWibYcg/CPAiExLcc0w67/
 ta38pdT0cyDYq9+77RP8quo6P0cvcaEAR/dLNLlUZilVaQWccxbA/rPr/
 HW55powhbzYOPPHcpFhyUePWfDvNQnz5GOrnQqiuV7a6Z0FnoycIYwnJo
 x/lr7Bo8efdzUIM0aXSiU6DfYWfBpaU1BSpHZOFUqiNIEbuHHvipj1XQ+ Q==;
X-CSE-ConnectionGUID: 4QfcY2YLT2SLKHDsbtBUuQ==
X-CSE-MsgGUID: fBdn/ymGTYmboRhG1x1LIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41981447"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41981447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:31:25 -0800
X-CSE-ConnectionGUID: UJ+FyfQAT66htO/WPjea+g==
X-CSE-MsgGUID: DKnEBlNfSuClxy5OxKU57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83798173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 11:31:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 11:31:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 11:31:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 11:31:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1vk6bEYY9hP50gpw2wjdD0ZygGt4yWy2ZsSJxmBxynDP3Y2w7A6mkYwaftqC9t+zrntvkr5JuLSQdoXKWr88dxnDYqaROvsJBUgJzxH5UNta5i3oB5nUZXYjprBOFSrAfmCcJ7WDIzYpeyDs5ECSQSlgyRdlv6h1ukKV4O4uLyQnEyu1rDiBMvPum0HBf6MSghnTnNzVmjyuivVhaIoIQyTOOwC8rIHQhCkimhqoi3ggFpVqsELyHUBNn5NxiK2iA4El9Lk9TA5v1SDGj8Y2WZwq9h7pLc3Ey+Jo/0XlXM4Zw5udiynfgqPsbkWJktqJW6w/T6+bPnc2TIfGJXNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVOSRSvDskkCVhzW7ceSacWwbSSiq4hUJtYNGaW98Qs=;
 b=bZao4qcyxqRwC0JAB7scYqGQHSvogkmwleQ0kFx5Qyvixwhe1BV558/alMTA5Z2HMBWbVRf5wM5uuuBsWEWr9+12VT/O02t2ya1+ftw0LBM+P5HaZSLyfYPyS+gh5keMg4IRbGTn9Pv6gti7aFhpsDtMr/7/NZncTlUut5z0SQxUZyqVrn5fcbZnVWoqM/fhJxDm/Qdm8AdhfewLRAlZHsVFWdaYZwwfv2qy6bP+ZkhVvFD0WUjMg/mFEXtGwVexcqndaxyb63wFwaWb4yovJeakZMwqEsJZN8sytklsTGmjVeOxQerQNFZDL5nDfYIzZe6RHJODFbvrrsXRwCECZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 19:31:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 19:31:21 +0000
Date: Tue, 5 Nov 2024 11:31:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe/guc: Drop redundant logs about invalid G2H
 length
Message-ID: <Zypyqc8ey1nddsqK@lstrano-desk.jf.intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105173032.1947-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 0371548c-a4a0-47b2-3e66-08dcfdd06da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R7Q9sDi1lBrcibU6ri+56plg5sFNc9+Fp730k+xUYb8SbpzJOZaIRtXz/vTa?=
 =?us-ascii?Q?D6/mQHck51wp1TMMoIlPboEMswFuQ7Bh1JWJRfAQzXtSdBtzeWO/dWVQqd6j?=
 =?us-ascii?Q?Qr9v6SnRQNr8CbdegifsBfsTV3HW2AdfVc1lBhS+yjpmc0rq8lhMFi5Q0Rqq?=
 =?us-ascii?Q?LVCp8J+mNUCm+tFSI6MvN5Ln5uvHBAX6KIZc1SVuu0laGej+o2Ri+HMDj5Nb?=
 =?us-ascii?Q?fcIcHnX+7MS8XiiOVuAOUOoNQbUZ7+My2jLQ2qk3fMpuKGlbSvxven5AclYz?=
 =?us-ascii?Q?nWSvz0sf+YpYzsi6p8ac5OdXEDiv67lAECsr19iDxbPXZoQGzk3zg1dEQG62?=
 =?us-ascii?Q?oCiuUm1p+3F94KZu4FugoMZI0cjZVvGZsANsOATeYGPgjrXEV0ne3chrQ6y2?=
 =?us-ascii?Q?N8SpgRiswN6c2uXK4CGsuBGU8gd4OuHi6u70+ps32jJWbQV7kEo34x1r/eHm?=
 =?us-ascii?Q?Gv4n2ZUMVb5i9sGIPhstCdOYX0OyQDIwW9gGfMXntu6N9hI+0fIEho9bRsrj?=
 =?us-ascii?Q?bWE2wMdL035c5DtDb9B5iyilpkSiUdZ224q38DogvHBLqLYkKnTKKdV7n6hV?=
 =?us-ascii?Q?E6QNnFqDXoylBUzSHDyFDIgy8IaxmbivAzM47+CgSq6DoXPHnCX4KHEoaZ8X?=
 =?us-ascii?Q?V8SYN76i4Fl5sz5jlh8pu3lxSBO+QA/fFnHBb1C15ZxFz5oHBbJo8vgn/T0A?=
 =?us-ascii?Q?eRhkPUgUS5GKOhv3HxK70GJnQHRkuRFUxYFb/Vk2XI2zA+o9BVjwwGu1N0ik?=
 =?us-ascii?Q?SLvr806O2f7KOCAN6Pt/MDVkjfbh/GhD/Dp21HuOmFALOFW3a9bl33qF05jV?=
 =?us-ascii?Q?pknc33wHlmcI4gmpF7VN/XcYEOqSqCNmE915blbgExr0wOXCE8zqpf0P+V8N?=
 =?us-ascii?Q?C0RkDk+JZEGwk5NrFB+ltja91b9qpfZnrfIUyYQSjYZjw2m9pu+zJnYboamm?=
 =?us-ascii?Q?NtK6sp6DBy72T04JiDa/WJDOzIWNxgJeWhjloFAz9T82hMsFAeqm/xrHEv4O?=
 =?us-ascii?Q?/NSk/QOcbau3gVOHMvL9qnzmtWG77vvPP0jEOG+SHrDeDpM6C2Cm33wbt3FJ?=
 =?us-ascii?Q?dxEtIdQFBgw5YHK86wvwK6jZpbBCeTqJrIMQRCLCGrkygEzP7OdvoyV7iE41?=
 =?us-ascii?Q?9tzniytrgU8rLVMSDiTOOeuFYn7MdEo5MBy686xP9Npv7bZfIozxKK9rpntL?=
 =?us-ascii?Q?MoIHlqWPY6UFnEe1VwgxF91BDb/OHe5+d9MVKrkzsDAxerNZ4lQaN6djPAoK?=
 =?us-ascii?Q?/oT+tx1tRd5jGJrGOK4XPSEwPey+DyHjBgsEaJvjE17aKqTiPWRKEbqYLN2K?=
 =?us-ascii?Q?JSSCbLRdWwqLaEmrWjqQNnaW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BDK/V3f7+JmE4yLyVH6wTuNlk5NOwsbzRV2esuwidVj2iVSQeqIgAJHAVl9b?=
 =?us-ascii?Q?UGQ9dpiDRL+9MJNvI5Xk1FGtXZoneal0453VL7ibXa4/NMzCBPnqxJ6NEe9U?=
 =?us-ascii?Q?S6Koja8VOj1WGw1kq5QTu6H5xWAa2sklaDjIlBJmqnSxsGrsxKiDwv2Ht1jd?=
 =?us-ascii?Q?gmOmij3qv76z5cc0YlELlTydJPA9JbJVPCF4CCZA7GXcdFrtwUZ7Ro4Qc40b?=
 =?us-ascii?Q?31oPzRG05+pY+/6LIEBplFngfUu5SwlvP1/SItl9I9RVe+BMLqvFHAi8Lg/l?=
 =?us-ascii?Q?NCGgNTz+B6Ge5t8L3tgDE3wdeeF8+OVS8LWyqXB6N2YESBDFojnALN8fa4Q0?=
 =?us-ascii?Q?emf+s/+TuIGG4p6fcsZKp20y9xW2nkRNw+Byo7i3CQ3jR9Ms5O76eUhsNHuP?=
 =?us-ascii?Q?pJmhSQONLvIicV6g3DTKTAJO1fTbnIUBimuV2J6cNET+PAT1zkm840W4ioLF?=
 =?us-ascii?Q?D4Vf86OtiblfkzRWQ4pg1hk5JwBMTjTcGxpEoQDAh3dYwQQVfPcZNXzgzyXS?=
 =?us-ascii?Q?hQcH7v4pS98WIo34bUmjv7aPtQPzfnetl9qjpQIKR3MeAMmMan+7wgcEGXtf?=
 =?us-ascii?Q?KbQeCEyQH9nPoU/6jC8KG1NR6Z/AyyVWQyZdl3Km9mU9T6UtlL5O3PINAWRB?=
 =?us-ascii?Q?GUBeXbN/MyXv5656SVYNulN+vjdcotzRLW7clQtoiK/3NNFRTKLR2VjG5QTT?=
 =?us-ascii?Q?2Xv58kDeakW3EyRXSG6tf7nLiU9jJ+8u/WhKdLmmL2T33cuo5RK09rQJhyff?=
 =?us-ascii?Q?0uQ5ytMOqH1o/ddaF/uQuhhQLmB+7CUy9R6R/3EzmJRuaPwlyJlkQqWrqr8e?=
 =?us-ascii?Q?jMEmDHBBzF7WleD66W0lFn3hlZJDz3Q19QxEb/s7+H+rl4TMqq5Clkc8rGb8?=
 =?us-ascii?Q?l04E98nKgtFVcDDiDxkED/xGF2p7krdVsMULUNf3fuLSeGjIuyNb766C9wRd?=
 =?us-ascii?Q?6E1LiC8kJN5qg95tKPfB+o0QZOVNxirpaWZqh2rvXE7p5AkHvET19FU8xmqA?=
 =?us-ascii?Q?1zeTQIXgkpKneacQcrz6BLPzz+T+hWGopm2nx/SbNU4u22peTwooLyGT4Zna?=
 =?us-ascii?Q?sltc5bGr8QCuouGJCldALNPHkmSeKinrYop37Y23iAJmxuWV9rzjy0lRHQgv?=
 =?us-ascii?Q?8sG5KZg+rXacQzgepu+aV6i3toOkG8Vawy8TBpNwMPHSvuoG9ddyeQSzQowf?=
 =?us-ascii?Q?icnsvCT7LrhRX20Sg4jUbJSrrUKYUd4VEOezzMpiP4lbT42ZkYylsQfUQdW1?=
 =?us-ascii?Q?cn/0SAJdgIa0tNwT1x7I9XbQxD9W0Kf03Gx7v3oG+sFm0DLMfUO5+CRFhBS6?=
 =?us-ascii?Q?iHEdsWjswuXPq2rRHF5OLxNQlwb8y2vFxcPOBErbGnjH7U7SDQZhlfo8jAJp?=
 =?us-ascii?Q?Qi5CffkVIdxbO9XyurauaeyzmUM57SLWct4ALUjGtG4ewGNcxTv8IpioiPV5?=
 =?us-ascii?Q?Fm4brQ0oDPg636CfyMlPmNh7XrtbD5X8PAIFrQ3JDrbbuMawjZQWw0sCKaQM?=
 =?us-ascii?Q?tgLLUgk+7n0HeZ8lGdGDg2raRu0uRO8RIbMVCOP9T1Jx50W+fKU3ApdMO6Sb?=
 =?us-ascii?Q?Z1v1vCX4d4YvQCkfJEaBlieprVtw+EXSDt0B4NpQZ+MQu5crFtRbJt6qw/kO?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0371548c-a4a0-47b2-3e66-08dcfdd06da3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:31:21.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/uK1rIVYKg13/mb1vqLcT+PxOGsqZD1/eRQne9+Do6Qf7wwuMMlLTrs50f00ypnNIWCLPaB8EENZCVN+KXgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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

On Tue, Nov 05, 2024 at 06:30:30PM +0100, Michal Wajdeczko wrote:
> We are now logging details of the failed G2H message (including
> its length) at the GuC CT component. Drop now redundant log from
> the GuC submit code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7afcc243037c..4481890be941 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1884,15 +1884,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
>  	u32 runnable_state = msg[1];
>  
> -	if (unlikely(len < 2)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +	if (unlikely(len < 2))
>  		return -EPROTO;
> -	}
>  
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
> @@ -1926,14 +1923,11 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
>  
> -	if (unlikely(len < 1)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +	if (unlikely(len < 1))
>  		return -EPROTO;
> -	}
>  
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
> @@ -1955,14 +1949,11 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
>  
> -	if (unlikely(len < 1)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +	if (unlikely(len < 1))
>  		return -EPROTO;
> -	}
>  
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
> @@ -2002,10 +1993,8 @@ int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	u32 status;
>  
> -	if (unlikely(len != XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN)) {
> -		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
> +	if (unlikely(len != XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN))
>  		return -EPROTO;
> -	}
>  
>  	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
>  	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
> @@ -2020,14 +2009,11 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
>  
> -	if (unlikely(len < 1)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +	if (unlikely(len < 1))
>  		return -EPROTO;
> -	}
>  
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
> @@ -2052,10 +2038,8 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	u8 guc_class, instance;
>  	u32 reason;
>  
> -	if (unlikely(len != 3)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +	if (unlikely(len != 3))
>  		return -EPROTO;
> -	}
>  
>  	guc_class = msg[0];
>  	instance = msg[1];
> -- 
> 2.43.0
> 
