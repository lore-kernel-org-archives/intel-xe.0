Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D7BC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 17:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEBD10E80F;
	Tue, 16 Jul 2024 17:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZyD+EfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D784010E80F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721151178; x=1752687178;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=picnCI2o2yCoHGQ9PqCGu/aDaWk77Abithq2VAwF82s=;
 b=aZyD+EfFJyYfuLa/LLDPKCr7TDP7IiVhMRivOPgrW5Zgk88B/RRr/mxH
 0UOIwzK1mNGNii6FCshY2wRyjln6E/RxS60xggdpK8pn1PsKBEEmuaCtj
 jRYhipSeXp9UIg9fEwBvBrCE5kOBI/3aZAzISzJ7XLjYTToKAQbFB+FWG
 OZaeRBboipfsmii+3x8PBIIxmo5s9q23zuRfFhJxvMwqh7QzyIUr7F4Up
 IiMMHvZdfkB1l64br0uEBG533XR2mGji5nLqf+XSWDAiM8MPvNCJKfute
 1z13AVzl9pommjKlj59bwx/s0VXFquuinKE058e035fUbKpRffFmOOV0x Q==;
X-CSE-ConnectionGUID: FEuwTpjhSO6NpENXDUId8w==
X-CSE-MsgGUID: AxKBH0Z1SkSTH66JBSvhMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="41136606"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="41136606"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 10:32:58 -0700
X-CSE-ConnectionGUID: vz0kPimySRmjqw5BRYnQ1g==
X-CSE-MsgGUID: Uu9GVum4Rl2iS3t0+868vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50690321"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 10:32:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:32:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:32:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 10:32:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 10:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IskpUf+EHlXOUoT8CNQCqHZ1qakkXwlGbNF9maMvWJ5rX73NCKxNSl1FtQmqe1zb6xQ38sigrBEThsL2V6olHk6wnsvU4k5wCHvyRdks7f5LWttB6Q27hBIcinnqdrJOxYa1+S9ZGGvmwEkIc7NNgvKSMNkN8rbRbg+Ar6j5P5YuZfCLEuWC6cwcyP0gzKlNFy3VgSLsNOA8iGHvMdQgD+cSa/Inrw239B9HvqPm35g9yTX51gJyBKAedOiTgjzDKG9Yh2H2w9JsSedgvwdfKyTc+MojwdnXeFuahZpHHHr+DRfVGDiFUPpD00OVJZ3HszbzC5bGpTb9/I1qNLxvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je+LG68MHqfH7Lh/hWJ7Tufa/H701efXZEFiQI/5pT4=;
 b=XW1fY/Zsnip4PLo0zKlaIWiTPflWBsA14glrjSqi0WBkHBYLIUcQtsLb+dvML+z+PMdmYQ9YUgYzvpD/EdexTJn03Fyhv9QlEcxwW3i1A9S0OjajxV5xz6SdUeq48pKtht9blXC/fGSY0rfaP6siT5k1d/HG0C03jMboiqr8i3v0LoEMBRvtSj5DpWSZYKzlcHjaTqmQaAGEsGiqg6jv5Q4hlml5IsBvwBXRABsDza7Iuohfq+DAj365fReyzIEkDq/IGESjXTMulWM2t7+jpF8F6ohHwx3iCyGB1Ts1nSm5HAlT14mAjhnFebeQogxruO4r/ic/hjwiKhmN17Zutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 17:32:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 17:32:46 +0000
Date: Tue, 16 Jul 2024 17:32:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <ZpaukCbqvFKCyjDf@DUT025-TGLU.fm.intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240711171155.173717-12-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f71d19-d2ac-4fbf-0356-08dca5bd4e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1Gtz6aIoVQqN30j79F69C1KSfqbT78MLuVUFaO8T/aYatgIqzM+8A8B1Fl?=
 =?iso-8859-1?Q?bblA1lgWq0Yf8BuwMWDgW9LD1rTzGxRZRd6kzZn2/xVBVYCOKyghK8n+DM?=
 =?iso-8859-1?Q?LWIcLihnXWa8i3Z2uBvsJX1uO1sdweKGIhhzctIt8AvSWexqvCzPzOzvDF?=
 =?iso-8859-1?Q?Rv9LGChkqGnS2divGZkTpS6yzQA+3yhIc8oYyTQZmkRSSNUSKmLerahQ1F?=
 =?iso-8859-1?Q?dKmHsSfQV+sR4ml8WNLVFYdaR2sU2na5/pEBIGMkEUiD8n9mytRzfWAOV4?=
 =?iso-8859-1?Q?ua0ytyObeHrO+CTWysGvCGn7ENyTZlfFeIEiageMuVEipMtt2nYcrzAmvW?=
 =?iso-8859-1?Q?xoKfV8iP74sFLZcTbu9daaXDF/cl8af4PAqLMAUncVieWdInfGvlGXcdx6?=
 =?iso-8859-1?Q?YYFYg9kN2WmihyhpziRIO4QgAflEN/r8HuMirAKBCThKPplaemQbzGh+IX?=
 =?iso-8859-1?Q?HU7dFj+2Mjve9YDJj/HmDWqB54PyoxqFxu5Y+F4GGE5+82Kaz1oIxSsOzd?=
 =?iso-8859-1?Q?pm0EnZLQUgH0Ju7rQHMxuCZRoQmIMCjxGH2lFygKEuS20ruGqKnC3vXoio?=
 =?iso-8859-1?Q?yl0Ic1ArYn+jkEojcJm0+b5szAezOW3yAWPelMgVxTRIQ2sm0KceVPcuz5?=
 =?iso-8859-1?Q?I22EJ3fNodhOhwKvsBX9vvQytHvSqzxUYHO+IKhOyayEIu3n6DwsZvXKXa?=
 =?iso-8859-1?Q?Cnb4NiQHoRENpGUbSge2PqnYa4k+uXQxmSdjlMomBWMJ/67Hn1GoKkzaTR?=
 =?iso-8859-1?Q?3ZSmVoalAuYV22ZGJPcgrDE+QQCFqIoH/7QqHUNfzspJEH+3MEFXE8KrNz?=
 =?iso-8859-1?Q?/W6Uqxz9Cfz7+FO91utgq/cqN6ROZzAsHGUUB/QHSfVM7ak6RfHGev24+x?=
 =?iso-8859-1?Q?iGYcX+XdlD4MVLDXehm2Jc79QA542wd/SrC6WGxrOFjSbrGtJI/fFQEz6d?=
 =?iso-8859-1?Q?5pwOZma6qGtdtQySTj6mrC71Ug3HXMTCihLacEbe10VAuBDjyQ76pLMoCl?=
 =?iso-8859-1?Q?wMlMD/Fwt6XUICyqaKmk4l/9PKXjOmU8AV3ddwg/2QOqJsftoPPVLsQVwZ?=
 =?iso-8859-1?Q?H6ps7/auo1c+99lUQoDn05fRYkDiIv9E+divd92UXSa5MaU80Koc8cPDIX?=
 =?iso-8859-1?Q?4HSEwjj7dC/sFURC1jhu7rp8BHAd8YEwQ6t3nyhuRGV8gbr4IKhyjdC1OU?=
 =?iso-8859-1?Q?70qPfK8d+pXC4RAfyXtgthODdxRidPvZfsQEtuyiR5Yf3khx5NtFhyJdR3?=
 =?iso-8859-1?Q?2CzndO/p6j/y8sczNqb8Q6Q3TdBstSYpaHforsGsZhJCziQk9xNwnIoxbb?=
 =?iso-8859-1?Q?hoHXqHMBhjJqG4N288a9iM8BmlZuupF1mEZ3y28Fa0Lub7uCC3f0LtyuKj?=
 =?iso-8859-1?Q?lQdNdWhJda4AKaN6bBf3gEz4/tTp5Vgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qZeSKMKrF6XqG0b+GvW7SHhIY+2WlDItfAXV3w94UMR7m1NhXj1qBYtMQh?=
 =?iso-8859-1?Q?h/iZjOzmCKK5BlmYkQbylzZTPw2PPFStmTQfFYyc8gs+XYT++bgwtH2Juu?=
 =?iso-8859-1?Q?5lnLrpTN0Qcuxf3VwfM/dC/wfa7DECudVCKx07uj5cJGJRNUs1UYF8rkfb?=
 =?iso-8859-1?Q?S2m6xX+xWOgNNp8W/ua4jpOFkCkytU5Fvq6Yb2O4MeDMWCwrIDYGyFAKwH?=
 =?iso-8859-1?Q?Ix0ehd0XdVHdd5mZKvYYYx2aMh/5Q3rwnIsqLrNtNUVdCcHWvxLD+VYdDp?=
 =?iso-8859-1?Q?ehYHg81gW0Cza7kJu7rpBiA5ev0M2x44/YpPQwnffYeQJkdlnNy2GOF9Sd?=
 =?iso-8859-1?Q?aIXCV1HADisOmdrkT7jJR/LiAi1AHxm7KJwQy9W8W2Yk/59mlbimGzF36w?=
 =?iso-8859-1?Q?8P5oFlRxeuFBHXnkXSLGjmImSowl+vqW5OzzVpWClHtufB6cuZHAL51KEw?=
 =?iso-8859-1?Q?jpbg+8zeXweUKvGmg8vyoP9EiVWUaXEXfNNsl8WEUvp/dRHp6UU5Axh/iu?=
 =?iso-8859-1?Q?hJcS8ywRfd4eUClJK9m7zOsSlk4fllMESBAD0qJeZixNyHFmCSIKjGYadB?=
 =?iso-8859-1?Q?q6YVy6BInxWMBIod+HlL7Nd4FaYOVMGOVI/oQo5pu0UDrAuSrVd+qBhNgB?=
 =?iso-8859-1?Q?pO4Pxijm5cubqdB9NtZQlK3BdgA6a3EKvqhRFllFHi9RxJqz3t+UjuqD5G?=
 =?iso-8859-1?Q?5yLTwsMwrp34c8Z2IjwpREucOW+rBL82cSpDslevsFFc0P9HRPUmxEU/h5?=
 =?iso-8859-1?Q?wjMNIlEcfSVS6uQLFfnoOmSSMpFEaABhgOEma4KZDE84RtAJNxFxT/Nzgd?=
 =?iso-8859-1?Q?YHoC3GOlKprVSlFkxPYzDmcIFDuSVhq/Ga0ZbRawuiJUu9ZxHrKm+6qFuS?=
 =?iso-8859-1?Q?5hxzcmr3bejb0J5N1EG7HQJhngvcLG3cIncZv36xNn3nyjRKpvceofapTQ?=
 =?iso-8859-1?Q?oMvmUSzxWd2HEOB9IIsLSGaI7di9Z0UdeMfOQim0CUQ/tGsqo/sOIQAxIv?=
 =?iso-8859-1?Q?jZm5HfemhPbNRtGYCixC/20m2w2Bbmd/R0r84gJlR4I5exCETZMy9bm7OF?=
 =?iso-8859-1?Q?AQJx9uD0hLE6HYbaFjr1AMw4rJZEmaxNyLMU0KNmE86IH2zQMUOpeBtUeE?=
 =?iso-8859-1?Q?Jxa/eCc1TKePHq79b0nltU7eAEdNvMjF3H1wI36lDD/vl1UwuH5tPu9Lpp?=
 =?iso-8859-1?Q?OocEye/V+GxUy+AoVRqPOODNcy9G6DXVNK22Ih226mT+wSP/2P7Wn5FLgx?=
 =?iso-8859-1?Q?o1kuuEcKQnAaR8IsPI2rmTrW+28mBJJnXZ+lwuoLZYxfaARfgAaWz6eOeh?=
 =?iso-8859-1?Q?FdA98bWn5rZ55iF3bQO/K48G0+DlPPFtwUd74E2CJbn2BP7ZkI8UZoWKz2?=
 =?iso-8859-1?Q?W9Qgebj3tkk4DTge8t8rGboihIoshtcXvDwh+0qow0fuI3piHb2a4Y69in?=
 =?iso-8859-1?Q?LdAHLTLc13EXjdnafyENA9JYwZAHimr1nceB7b3cCNQ6m7S1Cf6lpqI2ei?=
 =?iso-8859-1?Q?rCUhPCQgYuQg1+eLssmNE++9vQHg/46pV5YNGr/6utm6UX4K+9MXg7hMz4?=
 =?iso-8859-1?Q?h2405W3Y5StodPJJa09QXL3sxAgU9xg9FYCYDo551sm9SdBmBIerYTBDaH?=
 =?iso-8859-1?Q?9ZAG+5W8wu1QCtdnZElUJu7XSPtnlnR8s5a/gMSMapM5J1Qt5E4qzQSg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f71d19-d2ac-4fbf-0356-08dca5bd4e9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 17:32:46.7297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfuF22tIlqTrQQRfZ0eh2b2444hyAyGcx3JacxcNejNxZF33dfKUqWLbuqQ0Qo1tsjZsjm58OSU9cQQTsWIVfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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

On Thu, Jul 11, 2024 at 01:11:55PM -0400, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> v2: - use xe wq instead of system wq (Matt and CI)
>     - Avoid GFP_KERNEL to be future proof since this removal can
>     be called from outside our drivers and we don't want to block
>     if atomic is needed. (Brost)
> v3: amend forgot chunk declaring xe_device.
> v4: Use a xe_ggtt_region to encapsulate the node and remova info,
>     wihtout the need for any memory allocation at runtime.
> v5: Actually fill the delayed_removal.invalidate (Brost)

I think you lost this change in a rebase as delayed_removal.invalidate
doesn't appear to be set in this patch.

Matt

> v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
>     - Own wq to ensures that the queued works are flushed before
>       ggtt_fini (Brost)
> v7: also free ggtt_region on early !bound return (Auld)
> v8: Address the null deref (CI)
> v9: Based on the new xe_ggtt_node for the proper care of the lifetime
>     of the object.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 106 ++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
>  2 files changed, 78 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index fe0bfd8c26cd..b57a71d54b1c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> +	destroy_workqueue(ggtt->wq);
>  	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
>  }
> @@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
> +
>  	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>  		    ggtt->size - xe_wopcm_size(xe));
>  	mutex_init(&ggtt->lock);
> @@ -276,6 +279,67 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			     bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	if (!node || !node->ggtt)
> +		return;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +
> +	mutex_lock(&ggtt->lock);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +	drm_mm_remove_node(&node->base);
> +	node->base.size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (!bound)
> +		goto free_node;
> +
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
> +
> +	drm_dev_exit(idx);
> +
> +free_node:
> +	kfree(node);
> +}
> +
> +static void ggtt_node_remove_work_func(struct work_struct *work)
> +{
> +	struct xe_ggtt_node *node = container_of(work, typeof(*node),
> +						 delayed_removal.work);
> +	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @node: the &xe_ggtt_node to be removed
> + * @invalidate: if node needs invalidation upon removal
> + */
> +void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_node_remove(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		queue_work(ggtt->wq, &node->delayed_removal.work);
> +	}
> +}
> +
>  /**
>   * xe_ggtt_init - Regular non-early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -482,7 +546,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>  	if (!node)
>  		return ERR_PTR(-ENOMEM);
>  
> +	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
>  	node->ggtt = ggtt;
> +
>  	return node;
>  }
>  
> @@ -499,46 +565,6 @@ void xe_ggtt_node_force_fini(struct xe_ggtt_node *node)
>  	kfree(node);
>  }
>  
> -/**
> - * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
> - * @ggtt: the &xe_ggtt where node will be removed
> - * @node: the &xe_ggtt_node to be removed
> - * @invalidate: if node needs invalidation upon removal
> - */
> -void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -			 bool invalidate)
> -{
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	bool bound;
> -	int idx;
> -
> -	if (!node || !node->ggtt)
> -		return;
> -
> -	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> -
> -	mutex_lock(&ggtt->lock);
> -	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> -	drm_mm_remove_node(&node->base);
> -	node->base.size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		goto free_node;
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(xe);
> -	drm_dev_exit(idx);
> -
> -free_node:
> -	kfree(node);
> -}
> -
>  /**
>   * xe_ggtt_node_allocated - Check if node is allocated in GGTT
>   * @node: the &xe_ggtt_node to be inspected
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 60cbce3170d1..5ea12ea30a4d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -45,6 +45,8 @@ struct xe_ggtt {
>  	struct drm_mm mm;
>  	/** @access_count: counts GGTT writes */
>  	unsigned int access_count;
> +	/** @wq: Dedicated unordered work queue to process node removals */
> +	struct workqueue_struct *wq;
>  };
>  
>  /**
> @@ -59,6 +61,16 @@ struct xe_ggtt_node {
>  	struct xe_ggtt *ggtt;
>  	/** @base: A drm_mm_node */
>  	struct drm_mm_node base;
> +	/**
> +	 * @delayed_removal: Information for removal through work thread when
> +	 * device runtime_pm is suspended
> +	 */
> +	struct {
> +		/** @delayed_removal.work: The work struct for the delayed removal */
> +		struct work_struct work;
> +		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
> +		bool invalidate;
> +	} delayed_removal;
>  };
>  
>  /**
> -- 
> 2.45.2
> 
