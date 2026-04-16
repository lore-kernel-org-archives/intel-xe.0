Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205FBF8D763
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 17:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6510E92E;
	Thu, 16 Apr 2026 17:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhkPzRlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4217310E92E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776361628; x=1807897628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DL5iZ2SMawhhJ5l+Izy4w311iHsfkXbiGsZM/X2foA0=;
 b=dhkPzRloYLLDoZhQITEaJb748nbszEzzZaF5g1kmX2UD5CodGkipvBy6
 0D2Cq1ZrzGuIwZJPac91N/u12+QTJFqLpVB7AdJditDuUcwe57z8EURSd
 lmmSe5iWvuUAOT1+9z3Ds06pZjvWqCkCOJNUPISHIPnMmDK1ql5uQVGjP
 7+CKH7IFrflv/J+95rQTO6z064aLKQxxpi3vT08zJP3NxGdwCGU9kqf36
 NsacqXcOePJn7aEXE3ZEvFFZY8nMTTgkM1Xvog91iRHZeikzB05X62XiV
 E+MPXhovdx2X3NV4Hg35Jgk6fsR3wWPR3WXsdF5bLPyc1Ba2P06WDi65E w==;
X-CSE-ConnectionGUID: BsoydRCKQ3SrZKY/O7k0CA==
X-CSE-MsgGUID: uz9ZkZiSRQGx7I/rIiBBJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94939703"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94939703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:47:07 -0700
X-CSE-ConnectionGUID: GCz0O7Y4R8ygr1YT4HbR5Q==
X-CSE-MsgGUID: IoL54PeZTyGHAkIPZLYqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="231049013"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:47:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 10:47:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 10:47:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 10:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAIkIZnJok0oXtHlwXxN80RO5w7LpNG7M8U0shWvoWEPBtjSsvglGjXtTMwBVicPQsaLMXiujHih42xzRuXEGqa7ycSTeN9mgWmO4j7Ja/s/ndQjVs/1OuHNmGiNq3wwjHqhadImd2os6dijnw7jAn7HWQmGukFQsthOrmp64gtyce7c/HaVGXD0IFbniF4yWbd/enw6Di5senaA3ijcuuWnsr+SYBOrm0uXxCeLCoz9GUiVWAHgBn1qh5ynpu7JOW9TAbGo71uiCazqeZpXrHyMn/qUT2if33VH8p5UzvX0Z92BvBpgTb8NjoLh2B4s5Sh1TFJ9KGeGSVE1D4OQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVHaWUH8SKE58L/PUNlicrdBTajBi2guAFfV3NQGVis=;
 b=mdwKvWp7WvkoneZ+bSg74OAFkC75Lj0vfWjJr/XNlVp760EP3cSXUBvyAUhnqyxZSreYbksSpdTXpVTpTtAs0sky1TpOHpJvlUais1O9z3IPn/7UOfCzzx7OSP4Rm22DyigI8dz4MzEw1tOmbPV+TJ8YJntnNIckzddBwPK8Wup4PbA3a1WRLBkbRZTnXmRIRXTB9xwSb1qt1u2IuRz3C4pSF+fwggtqguKMUAAvc/lUnB9TwmMoXRu8lrxsBf+IdgK174slQv3i7QABUwWAoi0L1B/a1ykdr2r0iffNEWCJfnJAzZr/1Ex+evHkW1X83bVZDCDiH6WdNJOnbENXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 17:47:03 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 17:47:03 +0000
Date: Thu, 16 Apr 2026 10:47:00 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/eustall: Fix drm_dev_put called before stream
 disable in close
Message-ID: <aeEglIEXfPo40zvU@intel.com>
References: <20260415225428.3399934-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260415225428.3399934-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d96701-e810-4c77-c78f-08de9be02afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: PF6CmNs78wvZih9ZsZXndN40x962rsVD6k6ukHSJ/CI/ywFdozfSsz+ZTQ4WxeptpRGNAFUze3ZvDJ6ttgNesUQAQ3CpjdbsTHH8haMQifTg2dWCXIwMj4OqCB2jfCQmJGypc3RFA/kKdQlXMSBLBzz6kB/IxrsccrMKQd8DW6EFcHZSA+PqKnyjO5Rxco7dL7uO+MxAmbt6lNf5qB/17Y90IEIm+l/j+g1rIK1KHyohX7+/7XwGupIXfH3AlBEOOQ0Yh3WF49FesKpeiQhM8QpuZag3tinaIVKRiE0L1c/KB9MVqR8TVNjKfknDLcPfsHrEFkE812s/GYcb2VTtujvpBM/Eumyp7kiF/D1nP8hV0nTLUkQZR2i86/H5SJA026eo85h1jJ8Uoj2Y5Lncql8boXm0WZJuzReXaLBGpH5RyP+LRVpPasFLjKJIgBrqs2dwoOOYyGuFnImpLBFFS9mlmcEOR1Wf0svSdnowp8FGL6469tGN9Gj8YVZvCJA2u9SDYQBy1ymn0aaYrvEv9wv2cm7iP9B0MaB7tinqjn7vYtTSkiapl1AQUC3a6NuKEDxOzMYpCcv/LXbFoUWqm0Cj/W+8Ru4rtJ1m1NXbENeFSpEnFO3Zjsl8iaVP/KWiaTkNoPnLIoZURSdSDvc142iV7SL6WBFoUVZnQQdJKefI4L2P0GKc/M+HBZcdjLcYONyHg2x0ChvEXEt8FspJRMyJkQpqhj5+Pg1JWHI4COI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymh3UTI0MHNLMXZlSjFVUXB3alhZbWhkcExEYjhSMjNmRjdpS3poSXdWaFhq?=
 =?utf-8?B?dURnSFV4aGs3STB4VXZRODVuMVdsYXc4TFF0TFFFaUhYWnZOcTZEN3Zib0oy?=
 =?utf-8?B?SWxEbm8rQ0dXb3Q3UmNmU2w2emxpemVPNkhRMkNrTERJWEwwb2NxenhMSVlR?=
 =?utf-8?B?L1o2aUN5LzVKWllFYjdrdFhXb1VwWmhSSzIvNWtmK3RyYlRFeHR4Tmg1ZHJ6?=
 =?utf-8?B?YUdkYmtQTDhYQnhYV2E3aWkzRXNzaDRQMURMbVRHZ0pVdzJ6UmVhZndVUTMw?=
 =?utf-8?B?aVdibWt2T1dtT3VEMTBjZHRUMHZaUzhKUjR3bU9YVktkWVdqZjdBa2RvcUdW?=
 =?utf-8?B?YVMzRHg2Q0tmb1pTRUFWYlIySUxQSUhkeUNsdzVRLytoTnMxeEJ3dzJ0VWNk?=
 =?utf-8?B?ZFo1azdobFJ2aFZ2SHBWSHc3dGc4MzVEMmdKTFgrNjVic2tRMjRVS1B0bllV?=
 =?utf-8?B?ZFZiVEY5ZGVtVVY2YXplSzJudEh4T3Q2K2R3WjZRRHVnS1pJcHRoaFpnbXN1?=
 =?utf-8?B?cVQ5ZWpYTG0xWVRMWTlSdCthN3J6b0xGb0c0Y1JmNFlVK1VWRHVRckRZL1Nh?=
 =?utf-8?B?VmVhb3RQMVVkcWpzR1dheFN2SWovRGd3Q0ZhZHpPR2diaDNrOVozbEZMTm5J?=
 =?utf-8?B?cHpFYi9NOFhDQ3lQQm8zQ01QYzZ2Q2gyRXhIdEQrR0NGNUhENGlSS0lhdGxv?=
 =?utf-8?B?VnFhblE4YnlxV2hNTnlIdnRMbk1rYjg0VHlMM1p6MUN2MEd2T1I4V1N2ZEJN?=
 =?utf-8?B?WkE2bDBxTUxkNzVUNWd4UkFJNC83WkNISk5xVEtDdXBnelR5ci9UOEw5eWZ6?=
 =?utf-8?B?K2F6L1ZRbzdYNXVZSm81SWxaazZ1M1VycHp5V2liWGNVOUNNTkFqd2lVZWtV?=
 =?utf-8?B?NklqRXhTWlBLUjVEc3Y1WUtQWHBLM013QVZaZUdkRUYrV01aR3Bsc2daQlNi?=
 =?utf-8?B?ZkROMjFRNW9jb3N2UWQwVWV1TmNlT0JkeUdJNzZNaHFTaDF0NkFZaHVGakZR?=
 =?utf-8?B?ZUZEeG9OOVE2Ti95VjJpL2RHTjlYYVVhNWQvb3FTRWNSdlVqMEFTZkR6YUhl?=
 =?utf-8?B?ekdQbFRqL2dBVGprSUZYc0hsK1d3SjBnamJSTHhMR3p5dTIwN2pFZW9aZDVZ?=
 =?utf-8?B?aXRVWGVBYXhGSEYrdVdjblFkVnVydzZNNmZ2WUNiRXFzaURXL2VLWVRTd2tU?=
 =?utf-8?B?eGNCUmpNZWRDaTdYQ1ZzSnRJSzRsVlRqcEExaUNyZEhYcktXSmVPU1I1NmRm?=
 =?utf-8?B?cEZtOHZ0d3gyTllacDZzVUJrQTdtWEk5Sk1kQ3Ntcko2UFRmNDgxeU9ZMXF4?=
 =?utf-8?B?MkIxQkNaMEpmODZzdWhZNlpLSG9mSERsVkwxNW0rRWl5cUsxRDVnRzcyR0F5?=
 =?utf-8?B?bnNUelpsc2FNYkZrN2o0UlMySHJvZkxBaDF2bmtnaS8vT3IrdlYrVlE3U2pY?=
 =?utf-8?B?WWh2MTl6MERKaWUycCtrWHc2ckVKcGlMYkxKTVlCaFB3UnBaekhyUXVsMFFG?=
 =?utf-8?B?WS9rc1FWcStJODVuV2FGOTU1azRmbmZyMFBmRWpYRGtGL2xsTE1mUVFaRjRH?=
 =?utf-8?B?UWFxNlBIOUhKbmtLaTF5Rjc2NGZVZk01dEJPbHRKeDZKWU1KaVhzSHQvUUVH?=
 =?utf-8?B?NTN3WEJ6ZzJZTVlsd1FGbUNkQS9BN25HZERrWDlRaERSdGZBS2N3bklLQkNT?=
 =?utf-8?B?VVFVTSs1ZDF6NFVjUWF5SjUveHEva0t5UmxTTmhRTVBHS0hqVVJIWUIvVDNj?=
 =?utf-8?B?SGNDWGxZZU1Fc2E3dnJIQ3NoUGdsU3h2NlpnMURPNE4wU0NvdTBad2NQbHBJ?=
 =?utf-8?B?VmVnUjNkNEhtaXpyMUhMN05uWmZuN3dRRTNmU2o3cjhBRWFQRnpnUTBaT0NG?=
 =?utf-8?B?TWNoVzBwR1QyVzVORTRzNU11UEZMWVRYSnBpMVNFNWlhMk5Sa1g5T2REeDRZ?=
 =?utf-8?B?cWF6QzFINW9zR0dscjkrUGlvVXp5Z0FGaXE2SXB4RG1yaytKQUg1L3JaT2d0?=
 =?utf-8?B?OVluT2R5Y2JnVG1lcWpCRVBEK2REVHZVcVl2REhxQmJSS0tUMGdCRlBxRGE5?=
 =?utf-8?B?ZFhhdWVWYkRTS0VaYXF1MGZuYk0wYTA5QUh6S2ZiNmQ2L21UeTdwbms1VzJ4?=
 =?utf-8?B?SkI5ai92MGtnVGZrc0c2c0RxRVI2ZCtpSStPbDFIeWpnbGdybTM2ZVM5cXNO?=
 =?utf-8?B?Q2N2dkJrc3J4bEdtNU1qK0hkT3JHbG1qeWVDd2ZjRXBYYWRnOE02VTBIcWRP?=
 =?utf-8?B?S2hISXR0RkhuSFJ2MWRWai92MjVNR0JkZXBzNUJCanNpdkJESW9ack40M3U3?=
 =?utf-8?B?SHNhUXNkS3dzSkR6S0dtRis5OHFPMlcrVHJXVDk4YzJMaGtBRHFpU2o4U2Rl?=
 =?utf-8?Q?vnG6U00C4dKdyTC4=3D?=
X-Exchange-RoutingPolicyChecked: c0J3sO30Qvx/mTd4BCoOc6lDdowidFbEdUz+HPytxEoJuBB2Czr3n0CNm5iswrpIB0Taroa+8HnFfXG+t2EnkWNyGkS0PSJrLj7o2i4cyrNoe4MVGbt7i1mnPIt6y6Tm1tx4T4egkxgj9zFqXjoPT5SZQ6ZMzI7wWlsf5YjELTDE6bczfIS9o5wOWHaJN4GABG0Fi/KcAiT1jfxwKYtav4DCRbp5lsgQdGUEWIBMbMdWXXQHRO5Rxttued8AFhUv9JEV7qv3E6Y+cBeoDtWz1OKsxKCI0WFcDcNoCqbJlhWMnTWSw6cx1wjzAiPLUyyPwwQ+VjM6Pn9ddFWQ0HgHTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d96701-e810-4c77-c78f-08de9be02afa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 17:47:03.2245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa1tA41+AOeyBlY/ZKj4DWVQUwJd1dqk8Z9Clm1NTUywnkfH3ON6KsGE4GK8dHGPU2u2vE4QJwr63ESX5pXQN2HtkS2MylAqkYdV8A9+L4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
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

On Wed, Apr 15, 2026 at 10:54:28PM +0000, Shuicheng Lin wrote:
> In xe_eu_stall_stream_close(), drm_dev_put() is called before the
> stream is disabled and its resources are freed. If this drops the
> last reference, the device structures could be freed while the
> subsequent cleanup code still accesses them, leading to a
> use-after-free.
> 
> Fix this by moving drm_dev_put() after all device accesses are
> complete. This matches the ordering in xe_oa_release().
> 
> Fixes: 9a0b11d4cf3b ("drm/xe/eustall: Add support to init, enable and disable EU stall sampling")
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

Thanks for the patch!

> ---
>  drivers/gpu/drm/xe/xe_eu_stall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index aaf3fcc12363..b88b6c49c54a 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -871,14 +871,14 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
>  	struct xe_eu_stall_data_stream *stream = file->private_data;
>  	struct xe_gt *gt = stream->gt;
>  
> -	drm_dev_put(&gt->tile->xe->drm);
> -
>  	mutex_lock(&gt->eu_stall->stream_lock);
>  	xe_eu_stall_disable_locked(stream);
>  	xe_eu_stall_data_buf_destroy(stream);
>  	xe_eu_stall_stream_free(stream);
>  	mutex_unlock(&gt->eu_stall->stream_lock);
>  
> +	drm_dev_put(&gt->tile->xe->drm);
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
