Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E58AC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2831210E41C;
	Tue, 20 Aug 2024 16:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiupoMeV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2D10E448
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724169865; x=1755705865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZhHy/hMZb059kLx8G31BXaei338e3uin52U/AF8wIp8=;
 b=TiupoMeVluumbEZcZ2il9buhBn4UMKGyvZ7reB6iRIqxh/7xt+EN4kpx
 jCMsaTPULAIQa58cIM5NDAwn09Wi2+2kpo3+FL8kWIJ077NaGkaKvY5nk
 idPUWdbfC+GApP9xCeSMsabfU4gxJA+VyHee5i4q8G1s/fJM0Ut7CLaHr
 0Axc15BWEvqoTbIbbJ7CONBOgwa8IjqopRZq43clPjbXp9ifMjRvfl59E
 IDWetpj0wCU7b5AGyThlGm9Yf5KcjY0rv6XQTtn34b6gAV1DNSfu1Tvq5
 K3V05L0ggVEHtCWWyyVS0yoqRFHYrMJTKGWRkJwqMAAt0aySufiBwM5Be w==;
X-CSE-ConnectionGUID: iSFyG4VyT5KCv9NUiAxbJA==
X-CSE-MsgGUID: WpTEVDK7SnaHYkkVay5wrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="47876033"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="47876033"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:04:22 -0700
X-CSE-ConnectionGUID: u6aBk9CSRC2/P8CquByDSA==
X-CSE-MsgGUID: fJmANJd5TuCa5ELe6vlLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="98254367"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 09:04:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:04:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 09:04:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 09:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRczjtO0f8I114tCT1ukxQNmzIZb9mJJLjFMj/vlPhhF3JMeNjejdzg2ZoH7EIa1v9d+ckMnCNfmsCvaAfmT4NCG6r9xXQLfPyw9rjMIV5ois9IVZMs/hvyhe11M5VGVPqGIBhiW7613+E6gfLIKMhuaZWxv0gCmJt7mOjt5+5DFC15wxJDhYSwmhKOMMPv48IRUN7FB3vHeUtnJB5SqF5zMbcPBZPMTFt5zqXXnDbbCPaaa2dhnPTlkuY0kl06ITgtEw1xXA06W2lNGVqnFNDhFJzTXgyRdAqqs7EiqcUUh9F3hlvoY0ZkxNq/T0O1uWkq/N8e/VoBIj4SQGLPnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeMui0it1q07+oqjX9+WHaiFg5omcTOWR6h7qAaezfA=;
 b=LIFBkMygcc/EFPLCQlzKVNmZhstpXBghLFoNXm2mMYh8TvlDOKfulI92DzXQWGjdITdBK7R3MT5lZQ7h5Hy/kunU0Y73QosPyKAtyOg9XhzkwpNSrTfFchO8/jCbcLDZAMWqYMWPvCrEQCaHlE009NxlC2ZNbi2hSdHvbQ2RxfNvOgN5E93GfZyofIeL0Q/bygLEsPlK+7BgQoEfJHYZx6RaNcLBSU+f5txp0TjMiEcpLUzuzZndfaC87x2BLsZ13cB847mVCCMS52PSkVzsbvob1CA3j5pPU5e/eQBjoQABfkL2d3KsQ+qsNBbccuCRUQuZa6S05nNx7pYC93stsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 16:04:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 16:04:18 +0000
Date: Tue, 20 Aug 2024 16:02:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Remove extra dma_fence_put on
 xe_sync_entry_add_deps failure
Message-ID: <ZsS+MihD6XrLz/dh@DUT025-TGLU.fm.intel.com>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad616b3-3b0b-4047-f084-08dcc131bef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CdVtDvDdCeU6Td0UEwvJbXd2Q1xQYFvFMxRODBiNK/mTL5iLFxS3PXfgKwud?=
 =?us-ascii?Q?v+/sHpIO8/qntu6B4CC4D0y12k1Wboxg4IVXrc8Db4L4W67yMKHBuTIwJrr8?=
 =?us-ascii?Q?PVFpp76s9eNPuwdnBBAT2tynBI43GCKz6h867pNNK8kFv+X5jvdm7FWiGj7H?=
 =?us-ascii?Q?U9f81FyON9C1s8SRTRQEW5I9I1Vm3hzLoMHq/856IZ++6VC2r92HagJlDgyD?=
 =?us-ascii?Q?GBMk+IC8bqn5DJ3YNEk2MIfBImIEbukpNtzn2b1iHeb32BKURUP6nRmpqJf1?=
 =?us-ascii?Q?cHOcrS34HuggIOdqBrUz/xqvqZ43Xlvej+VbU05/nzH2vi/+zjdIwHhJt9SZ?=
 =?us-ascii?Q?M6WULjdVbYv2eEIcXqHOUOwR1/H/rTKvsGuseHQqJO1EEhVTAfXV3RZxkevE?=
 =?us-ascii?Q?xK/mLvq3qfMkVLJ3ujeLC7wl45hpD+Na5sHK/Ufg5T2lMiWFpJ3Qq73B2Hpq?=
 =?us-ascii?Q?Sz374MIG2n2VwnP/q8liKtVPRdIPDeY0dnwQ1jIfYRi+O77e9MPX+mW11KXL?=
 =?us-ascii?Q?LHjy+AIV7e/sxMC31eySZNDhQ7zJhAefvDUZLpGElbQsv1fg3Nw5onShXXBP?=
 =?us-ascii?Q?+KuvAnG8WO//cKDMB3TDkUshfdgeNuIV/G6oEmrRIWDRPSnJCI95ZAPZkT8e?=
 =?us-ascii?Q?RdOr8j+Cuz6yopxeOLhhU7LWVwn+nxam/V44M8WxOsXXOH8/kvpwhkG4yluh?=
 =?us-ascii?Q?bAMm3b5DkcJ63ERYJPtiYGD27Jw5VzNHbz/YPsd/qOKAG4kTciDuD1WZCZA+?=
 =?us-ascii?Q?bT25frUGvi9x1HjozUno281ebWhkCFGtescHW+Z0TXqDOq5AVU65aNZMfXJz?=
 =?us-ascii?Q?MZKh2wJVunzEwtsXV8IYpm1ynJyQXJPJgjRF3BWUYe8ehewhdhAmYlbgUPJs?=
 =?us-ascii?Q?8SBQBLyGM2YYjQYDwtJf3qlSipDZZop6JhjBZG4Eosp5OJunsVc1Lr0dzPTN?=
 =?us-ascii?Q?ozkSezrNN0OfQZZAcZ5IWJPpKnzHwSMvc5QItSr0caOyB8D1CBcnjpEPpQIC?=
 =?us-ascii?Q?AEUIRBYg4xixj+83Gu1RwlmSyJfTwxb/TR0bGHCjWaiY4WHAN9YmCWldLU49?=
 =?us-ascii?Q?Icdzi2+E4BM7Yh+Gxyae/ash0ocvnk6cMfz8w7dhkJ/HLEbqNEvWnNQBc9QT?=
 =?us-ascii?Q?MypCNJNajQ46Bn/Wtqz/mtE6AoBPH9KzVSslMMuWNvMocQNknBHXgqxUoXmC?=
 =?us-ascii?Q?pyP2M9d3cxgRM1WbbKreqtTJA3WYE8PUgxfcKXVOHgopWmQE2Tv6nv39Pq+D?=
 =?us-ascii?Q?JBqf9i5cbw+iGzL6D3wpY8Aor+EhjNPXcy76HhkkqiVeHGWIJz6XO0vy++x4?=
 =?us-ascii?Q?e5ghpxN0gLRb1L6mEI6IryJqe6FlCZ6xnkGNuOmBpwoihw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AsLQpTq1aejwKwiX3t4c+Iv1ziIeXybHgJBBrUOXbLEDgn3BuwE5HA2QjBYp?=
 =?us-ascii?Q?Grs07vCDPOWPoia+ybceqTKpIgXrzhwMOKs+jbHye90hUqRTj+sVyjCljaOE?=
 =?us-ascii?Q?cP3HlP9a50TLFRvYri6yzkn1chX20S6s3iJ5jEV77mubyw1rtxQDmgOT3pMZ?=
 =?us-ascii?Q?fy9cIO7sTmBRLn5V8//X1fQLcZcUHvfqxHSoZuZU5tJAptoP3zBDm1tUtkjK?=
 =?us-ascii?Q?N3y0yPHa1W6A7gL65kz68CzvOL8GuQW6jARuc4HaOsEMi/CHUvUhvwkX7bWM?=
 =?us-ascii?Q?fRHZe61F3UdjL66ENEDrWS13FjCUKXetNXjJ8hFV1iuCyFmVJpu0LGuqIgZN?=
 =?us-ascii?Q?zaY+M1nvI77p2TDyGEFBTBYc19ZnsNDa7ZjU23kmHkZXRW7jINpNOTObN1G5?=
 =?us-ascii?Q?380sGnqREL5KzFZwgE3AeUIOf2CDDWRtJd78fZ5jod1SDRzjRHAJp98upVuV?=
 =?us-ascii?Q?GOWC6eDI+00wFRNY4FS21JSm88XdrfYCtouENZNPLJthW3zcSE48C0JCt84X?=
 =?us-ascii?Q?TgBf/nnV93V2vC+9AZzfAdLgdsZpOTpn3/JIXprnCbclBJPiU7xc/uBkPc5z?=
 =?us-ascii?Q?NQOAGHg7ngCRFtozanBXvX+iV8KKrDrDwCn07Qv8YtEn9FUbgs7FH7GVuO4k?=
 =?us-ascii?Q?Zesp8TcCcGUX7VTe0ioX+g7PZu+yyzoFeon8bdLqPy1LGX80NmnDjFO6Pkil?=
 =?us-ascii?Q?21H7Jt3+h4n2eySZgMyQ0o6ef0NcnBRmRcqKH6UA2oz62ZhceeZ4I6yA6Xly?=
 =?us-ascii?Q?BPoJ606JEccMXNCHATqQYiOYql2Tzt8TibfVxUG3ZzvjlmXlq8TrL2dHA5P0?=
 =?us-ascii?Q?STY3dDO8hQBk3pAdP+ShH7B3WgKuBoWgqf4cPpV6P2w6oeo3uPhoSSTLHdE5?=
 =?us-ascii?Q?fKsU4abs/c1Z6/Ov3KySPa453Pq3loqQLrqJJ76bZ8Xo/adcwQRv7u2iJbmC?=
 =?us-ascii?Q?YYAGHm7a/dD9E9jQ0k3h1lTWkXO9SttQfacaVk8H03TLmcTL84PD1c9oISrP?=
 =?us-ascii?Q?OFh0rE1GMNhmdMvkeit+N1vSU8mwJxxrVb3W0/aqX+EreTvBQ+cU7MlrSUNi?=
 =?us-ascii?Q?XPE+Q6RIrBpv7pui5Ag2eGv+L3v3KmSsEsh13KTz6bpp4x9G5RjQhzNRrKzI?=
 =?us-ascii?Q?S6g0HuE8QSoTHiO9Hdu+D0tNFFWnQ1E72mQCIS90R5MH5Yg9X2LabeFWaKoG?=
 =?us-ascii?Q?+Dcbg29oiKWIs0R4LwpSRZfJ894jGIZcEBIU/RroiKnxG7GDPcf3D/yXQDOK?=
 =?us-ascii?Q?mZ2HtTqsgmu1g6XHt51Yvaw20yTKjGA2fs+F52g5EpWCCK9ZjZFPGruhrA6M?=
 =?us-ascii?Q?LbY8BJ3WtGC8eNvHix+iXWOV/Nk2kdvPL+ApnZqRjeNgpj6Ma1EdU1rcR0/K?=
 =?us-ascii?Q?5XqO4NY9LrGQSINw1/JnjpnmckExdncsxsQVEUQ+DALxHVoEVQcGTWMunLgr?=
 =?us-ascii?Q?lKKl4wcmyq3aPQTDUDwbk6Z5itvdw4grcA07rcd/Rx0poesAkSjZHdnoU7+v?=
 =?us-ascii?Q?80P/ytSt3Z8TzgqkS4XysFvyOcYVhiUJrmFyNs6+P3vdV8gn1TOTVZTt0jSC?=
 =?us-ascii?Q?qUpbEVcnyzyhlbhSSIUaFsaYvjT/zRLqVbT5lwGtcveIO0Mjp9+gNqUzcwpl?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad616b3-3b0b-4047-f084-08dcc131bef5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 16:04:18.2715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKBBpNM5M7b04+zVBRgEhTAx5GANMj7yMaf0mvK5jCyLn276qKfi0JVzwXrsTTqkN7+CLOYN3FjYDyboIHWy7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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

On Tue, Aug 20, 2024 at 02:32:28PM +0530, Himal Prasad Ghimiray wrote:
> drm_sched_job_add_dependency() drops references even in case of error,
> no need for caller to call dma_fence_put.
> 

Good catch.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ca826aeb41ea..a0675f57a398 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -206,16 +206,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>  {
> -	int err;
> -
> -	if (sync->fence) {
> -		err = drm_sched_job_add_dependency(&job->drm,
> -						   dma_fence_get(sync->fence));
> -		if (err) {
> -			dma_fence_put(sync->fence);
> -			return err;
> -		}
> -	}
> +	if (sync->fence)
> +		return  drm_sched_job_add_dependency(&job->drm,
> +						     dma_fence_get(sync->fence));
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
