Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E5CD31A09
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5F10E002;
	Wed, 14 Jan 2026 03:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTEweZco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEBE10E002
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 03:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768361224; x=1799897224;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TLZLuXqIwFe/YVyaq+QuylB4/c6TYYjNTA34YhPnsWY=;
 b=nTEweZco5r+FKgKqyKM2jyRi3xSUefdmY925PunT+SPNaNK3O5C0TTH6
 ZW/8ikn2EEbx3lDD9MiL6nTZMCUDT0CL1OgbRqgl32EFUNvsB78cOlM4t
 Iv7J0Llwc86icgmB3xQPMbUsn4wAlwNwGCErlLg/q33fvC3DCqYWlwgw+
 g3LutYAHId9a5VU7T6U6NA1/PadU/fsYfmoUnLJ1WHLpOgG485R8F2tjV
 1B7WjxHUIOc16fOdm/fIf6racEHvtQdTefPerjQyJvtunB5d0ObXeQovV
 QY/fMNIHZTD2EndU9kVH4zsVjW13X3bgfhsheq9yItfkM0jKrZc6gBMhX Q==;
X-CSE-ConnectionGUID: 6rg7KDkwTSuYyG0RXxeXfA==
X-CSE-MsgGUID: 4x56/ba8TgeMLBdUcq/wEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72240667"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="72240667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:27:03 -0800
X-CSE-ConnectionGUID: hFGil+1oQWSHLtLj0Pw+zw==
X-CSE-MsgGUID: llZdnEQ/SrGs9PRAUGssZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="208716466"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:27:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:27:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 19:27:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:27:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELCqYIcEJ6+uS0LQMrlwzLBx1mobYdWE5bZ/5Qt+uEdyqH7SB7yUdAd2LbNRO/dFOlSbmKvHfQJZtnzn/pAQezvSK94HwsYfrvwB6rQ3a1obu+dUnFlzpvwk4LVJvJSSLrkNhb6VRxuLOSyWMNdAHWl6D4TmH3FTyRQAdm0l9zbbwPahpb5MW6833K/6c08ST0yrDHvJhGWT/5lG7fR/nFIMgpzmDcP4f6c/YIPhTTFKeCJPjh4/vqclbrxvcGpoNsqofiHqjV5bPYBbUFl8IFd1Lkg0OVGgbU6BVd032yavbAnZnJpegLf4/eWt5Wa3/6cUZ2WvOY5whSAYtcxcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddk3tygNLQNS7P+Ba2mQHaC/3wqslNqqejOJ1ZkcE7I=;
 b=X76G7x14rOkplPDAExqJDCzxK8HrOYW5c4u8FqgaMN/5Ntq9azO5j4ZIpOhGZ7WkFTvFGu+ctG4iTIDeZ0y7LXO1xYgM9UpTTLfhRIoZXvEgOuuJuVTS5hZyV5bDGteQ3rxgZHOJ/i7X6XhFVjiC8KQLB6dNnr1r6/MEdZj/1u4i3AHNp6e2nAQk9VaxoomAsMOVUoQFzDpms6f2MGmC7Po/bxZQ4gT1nVyfYp2ayozIpG/1JunS1tYIu5h6mKSLfTtXE0c8sH/8rfBdxPRnm5g6uIuIM3fJ13WQrAi7qtAD+0ukKja1CE8LaTOXIi+FKFeta3H995gaC/brjU63qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 03:26:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 03:26:55 +0000
Date: Tue, 13 Jan 2026 19:26:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Message-ID: <aWcM/ODpvs403f0z@lstrano-desk.jf.intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
 <20260114000421.331082-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114000421.331082-2-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c02e2a-2035-4eed-c83a-08de531cc46e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjR3TU0wU0xtRk8xYnUxUEtoRU1wajRjdEhhNmt2OG9VV08yZzQ1K1BPeUhz?=
 =?utf-8?B?ektmMk5Bajd3Sm9iUGxpaE9JOC9ieWwrVTYzb3Ara0NzV3dGWmcrd09WZ2dV?=
 =?utf-8?B?OXZIVlR3VU04NG1JWGxacDkxWGhQSTFqQ05DYnRuTk1uS1FCdEpTRWh3R2Ra?=
 =?utf-8?B?UmZoY0NwaE5sNUpNdUhyWFdMNXJYWWV1SnhpYnliTnd6azJpVm5qdVppUHdF?=
 =?utf-8?B?QTdVQ0FkZkt2SXhzbkJCUG9kM2Q4M0VMd1kxWFVMa284elRpTkZQbk92YlRW?=
 =?utf-8?B?U2lIVDV3bEgxblFQaHJWZXAvN0RYT0VvRGtIZ1Q2ZTdoRUlRRit4ZC9USDZU?=
 =?utf-8?B?UXF6RUVORlhwVU1aWVRnVmdQRUova1lub3VsRWlvTForVUkvbnNWYWRCdVBT?=
 =?utf-8?B?cnpjRVJkWEpSVmgwNFRJMjFOUnBEUDZQZk9ZWmQyMCtWWWVyM2RlbVU0Q2xE?=
 =?utf-8?B?OWZqcnNMdnR0MmNQQkJ2SGhqMVZ1bGtjRzR4aHk0dGp3VGJIcHh6ZGFWOUdX?=
 =?utf-8?B?a3ZheE9kS2k4enNPQVNDdGxZazhKOGg5VkkzdTRQVUdWK250MEtnc3pjYTY3?=
 =?utf-8?B?UmxQZzlRNFNHR01SbVF3TzBBNWVCYXMrb1NJNnFjN3g1Ymg5bFQ1NnhHWmRV?=
 =?utf-8?B?KzVNNDhXYVJ1dmxld1NpRDlWeTdVaVd0eHgva2ZjSk5LSGpacEpPSmxRNGtu?=
 =?utf-8?B?SVdaRklnOWFrZWc4YWM1bUNSVjYzV2FvZnZCL2tIbjVBMDZQc3pWeGxJRUZ2?=
 =?utf-8?B?cDJCclJiVDJCakFJNW5vZ0pONFVWc0VQMWZSM1RNQUNXelVhL3k1cHlFbytP?=
 =?utf-8?B?QXBDenA2OWZzMmYwY3J5clROWlRBb0s1OWY5OXNYWW41VWZTSXo2RTIrUElR?=
 =?utf-8?B?bzJZWi9zL2lZUVhYVkVvNktBQjZ6cFZJUDZTZVNaM2E0azJSc1E1VGIzZHp4?=
 =?utf-8?B?YlptL3J0WmRPcmpobFB2ejREblk5ZmhBQWpzRktxZ2xDc0VNRU9DMTJqdFBh?=
 =?utf-8?B?ZnV0Nk5ZWXo2UzJJNDFhT3oxN2F3elY3end2bkpWeHgxQ3JLd3ZURis3MTI0?=
 =?utf-8?B?VjVvMzJOT2dSUGVZd3pXQVdQSVF0YkRwWHVVMDJZa2U4N1ZrTzNWSXkrdWhi?=
 =?utf-8?B?WFRjNkd1Wk5sakNPU1Z5dE9NdFpvYVpuVFo0cHN6enM0aG9jYTAza092ZnpU?=
 =?utf-8?B?TjQzOVpFUkkzYUphZ0JBeHY0Zit4UStNTzNyTjcwNnlhc1NicWlFTWpreDZV?=
 =?utf-8?B?dlcrZ01pVTUvbDU0cUhHaHoydDBjM28vWmhvd2gzU1NHY0ZaSlVMOHA4aEVN?=
 =?utf-8?B?RGp6dllPRGgzNW5hY2RBczN6R1RveUhUVGFZYlZ2aG5Cc2hUWkpPOUpwK05N?=
 =?utf-8?B?NHIycHBJdWp2SVZ5RmkzcWFjRTlzWEcwZlg1ZlBKYlBEbnZWK3VwUHNyMGwx?=
 =?utf-8?B?TENiQkRML3o0OXduZldjV21OTTErS2pKYlVUV2FOZllEVHZ1bTg0bURjc05o?=
 =?utf-8?B?cHRKU2lJbDhGekhDMVdMRUEweTR1Z0s1TUc4c21ub2ZNMGdpd0wxRHZUUy9h?=
 =?utf-8?B?NUxjKzhrMjJJUWRXWFBOa3hGa1NJMmpjb052NGVnUmlXS25XT2xxVlFESFli?=
 =?utf-8?B?ZnRsUCtPbFhYTDlLV0hISUZ6aXRTc3hqQWNkYVdpcWY3Um5ySDMrbkJmZUF2?=
 =?utf-8?B?ZEpINklNb1FWd1p6d0NicytqZC9MVGxwWnFqMFg1YU82ZjVHMU8wellsTVcy?=
 =?utf-8?B?S2FteTJiOVFib3pYN3RZcENhcFQzNCtxNUt5elhQL2dBWlFBNjUzSnhCNDdT?=
 =?utf-8?B?UHM3M0thamlWbitaNThiMlNuK1RDVzJqRTlxd1prK2Y4TDdoTVVQVUhFVmhr?=
 =?utf-8?B?eWJxSHNFUGtRK0RGS3FwN2txZHBSZGhvQlRwSUxkZVhWcDNKa1FwUURqWUNR?=
 =?utf-8?Q?gJfUaxRAFKdKDXuBNSRApPoO/OvN1rSy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxYa3ZiMHUyeWtZdG5rQUNXUEc3aUpwR2hnYmN4MjdBM0M3b2JRb21hRHFk?=
 =?utf-8?B?bzJGM1haM09IR1MvYXVLTEVBdDdrbTVmNVF3a1Q4TmZwanRTeSs3ZkRzN2VR?=
 =?utf-8?B?OEtteXc0ZTB3Nk1RVHFndnZvTE9uRFptTjRHZ0FDaWJiM1pBcUF0NS80eGZK?=
 =?utf-8?B?VkVIVFpEVVpsRUV6ZzRuaTFHNk9JSWUxWUVjOFBBMFFnYjdEdjR0OTNBZG5Q?=
 =?utf-8?B?L0REOFRpM1J5YXQ4UUlReUlmdmxwUnU2UXRRTmlQTEN1NHBxSDRiZEwwQWg2?=
 =?utf-8?B?ZzU0ZXArTlRhSk5PWTlqQkkvZkRXSmtNT21GZlQrSnFhUUZzaWtPSFR3MDBk?=
 =?utf-8?B?UzFKMmFPa3dRMldEWTB2OXBZSUV2L09ZZ29CRkhhS0YvNEtUSEFUd25rYzls?=
 =?utf-8?B?T3l3cmN0a3kwb0JvUkhtUkVBaHNkT2lHY1NKaG4xS24wbithbUlrUDdjWnpi?=
 =?utf-8?B?ZEZvRXZNZ1YrRG1EQzNseWlFZ2sxblg4Q0pEQ1pXZlFLdGJIZ0JkVzlDSDB0?=
 =?utf-8?B?QWhaUm1WY0hnZS9kYXZIcENYbjU3TkpZQzZvbTU4ZVoxckRzdm5RZndjQ01k?=
 =?utf-8?B?Z3Ftc2lQVGVYM1FEMVpueXlPMGdQTlpFejc1OFlZS1ZhNUF1dmRVOUFYMUpN?=
 =?utf-8?B?MXZCcWlyaFhHendtbFZMTUxJN1NXV1lkQm9lSVJZV0dWbzczZkJPdUF6Rnlv?=
 =?utf-8?B?MkYrVCtXTkc1MnUrQ05KK0JPV2FSR05NaWZZZWs3Mk55aTl2bFNhZ0JVeUQx?=
 =?utf-8?B?VGVtdFFtOFpvVGdpZ3NrK2RsN0NhbjNHSTBMTFdHRDEyQU5VMndBdXV2S1Js?=
 =?utf-8?B?Z291RjhLLzkzN3o2NXY4TWJaZnFOaUR6QmJPWWFNd05NYTRyTUJXWXMvVjhv?=
 =?utf-8?B?NW1xVGJBK3RmUElaelZ6TEhTTmxqUmRiVVBWZmxaNklKWVJIcjhDVmgvZ09h?=
 =?utf-8?B?NGFndHNpYnhOWTZyWEZ1SUdKM3gwOFY0VHlaWmdHUktOdEpqMDZmb2dLRStk?=
 =?utf-8?B?WVFFNnI5amhBb0dvdkQvdTdRc0g1SWxxZk44N28ydllrL1pKVjhTbGJ0RXlB?=
 =?utf-8?B?Yk0xVjF6bGxHODhncFpzRnpXU1U4UzhrUGJSRi9iSmxHWWxwMkQyZkl1Tkda?=
 =?utf-8?B?NTlQOXYrVHZZNHJVQ2hocGYzcU9LTjJzU2UyVG1JQ0lxSXJXUG9adXZPVkg4?=
 =?utf-8?B?Y2xjZlJOTk5SODg5dEZwYVFYaWVmQmhQNm5pQStTRys2Rk5Pc3Rwc2ppdmFk?=
 =?utf-8?B?WWJGbzlIdzREMWZadGllK2NDUmxFQnRUOE1vQldyUFJ2NUhYMWJabERwMVVO?=
 =?utf-8?B?S0o0RXZIckRwS0Nsd0VSaWc0ZW5aUGx3eG5VU3VvVDA2N3NLQ0NjeXduVE1B?=
 =?utf-8?B?SXRzRU9VcFI1dGYrZE5XWEJaRnVCOGs3cW5pbDB2NHlPbWNQY0RjZk5tSi94?=
 =?utf-8?B?cU9POGZEcjRmYmZGTTNrZVk3ZUZGUlk2d2JvV0pyOFY0ZklKUjdacWJhaWph?=
 =?utf-8?B?RlNBT2p5WmFLaktRMGNIQlBQMThNdnJzZllEWUVqby9pVkhEd1pLL1c3emZI?=
 =?utf-8?B?TlpmTlN5VTU5OXFkV2V6YkZlb09DaVUwcE9reVhSaStQclBxNFA1SVpvMnpM?=
 =?utf-8?B?MVRHSGROMWIvcCsyd3FSVHhUVGhkQ2IxZkVKaThRSHpSTWsza2lBd0RrVDM0?=
 =?utf-8?B?eDVKY3ZtN0V2Q3ROdU5XZi9hZFVIMmI3ZkYxYXhhcGxlZGswRkp0QVcrYU0x?=
 =?utf-8?B?dGE2bW5WUllONEZPTWFISE9qaUl5Z2ZrcXVxRVZRNTROb2FlaVFNeFVwY1lh?=
 =?utf-8?B?MWZGSGRCbklUWldTSnptdzhlYlphOEtvNzlVUFlLUjh1QStqeE1udGVUaUl4?=
 =?utf-8?B?cEwveUhZRXRhVEJsc2djOGNWQVNXQnJnbGdVc2YzbWhqNHhzYnhPbWJaWnBL?=
 =?utf-8?B?MmNsNzB6RnhHWWdRdzdvcEVPWHNkODdXUUlsVnRScStPQTRTaFcwMWl2dlIz?=
 =?utf-8?B?VEFFRFNNejVSMDcrbmt0OEVjcHU2MW1uSXVTVTFhaUJwaFl5NEpPK0tBOVAw?=
 =?utf-8?B?UXdWRlNNSjVwZmhxSFpWanJTMXdWYlhBbys5YXNjRzQzRHZUQWorYUxkdG1X?=
 =?utf-8?B?dEFTRVlucjB4RjlKTkNsTlg1ZGFwNHlrMzNURnYwcVh5b0ZDL3liZ3p2cXNR?=
 =?utf-8?B?RmErYUF6U3VSNERCdHd4b2E4S2gxUndzbTVCVFVUT1dWVjNYd3cySmxacGFD?=
 =?utf-8?B?VS9UVXBYcER5T3pFYUpPQityanBtaUtpZnlxeGdITFEwVkdJOWlhZU9vQm95?=
 =?utf-8?B?R0lBMUh5ZUhNMWVyTmM2YWhaUDVjWndWZDdnU01VcGsxNWRSZmVmZVE4d1RI?=
 =?utf-8?Q?YggoPLwmhsyZXV8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c02e2a-2035-4eed-c83a-08de531cc46e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:26:55.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7r4HBDJeCrM5SfqwTIrHaKAVn+wOFJfyvtUGcAL3dAEu9NHMQo8Cerd6UhFlsVXUfcJLjgoTVvUdP/5MLaugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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

On Wed, Jan 14, 2026 at 12:04:20AM +0000, Stuart Summers wrote:
> Current hardware does an implicit TLB invalidation on
> context switch. This is required for various use cases like
> preempt fences where a context switch will happen without
> any explicit TLB invalidation from the KMD.
> 
> Add a hook to make this explicit as part of the ring
> prior to batch execution to allow for more explicit testing
> and sequencing of user batch execution.
> 

I don't this patch is needed rather this an existing bug in xe_pt.c...

1974                 if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
1975                      xe_vm_in_lr_mode(vm)))
1976                         pt_update_ops->needs_invalidation = true;
1977                 else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
1978                         /* We bump also if batch_invalidate_tlb is true */
1979                         vm->tlb_flush_seqno++;

I believe we also need this at the end:

else if (pt_op->rebind)
	pt_update_ops->needs_invalidation = true;

My question is: does this patch internally change failure rates? If so,
I believe implicit TLB invalidation is hiding a bug in the current
IGT suite/KMD/hardware that just hasn’t been caught yet.

Matt

> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 1 +
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  drivers/gpu/drm/xe/xe_sched_job.c    | 7 +++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 3 +++
>  5 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f689766adcb1..fa193e0b906d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,6 +355,8 @@ struct xe_device {
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
>  		u8 has_range_tlb_inval:1;
> +		/** @info.has_ring_tlb_inval: Performs TLB invalidations on context switch */
> +		u8 has_ring_tlb_inval:1;
>  		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
>  		u8 has_soc_remapper_sysctrl:1;
>  		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5c705124270e..a2ce9da2e3cb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -893,6 +893,7 @@ static int xe_info_init(struct xe_device *xe,
>  		xe->info.has_device_atomics_on_smem = 1;
>  
>  	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
> +	xe->info.has_ring_tlb_inval = graphics_desc->has_ring_tlb_inval;
>  	xe->info.has_usm = graphics_desc->has_usm;
>  	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 20acc5349ee6..783ebda6eae1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -72,6 +72,7 @@ struct xe_graphics_desc {
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_indirect_ring_state:1;
>  	u8 has_range_tlb_inval:1;
> +	u8 has_ring_tlb_inval:1;
>  	u8 has_usm:1;
>  	u8 has_64bit_timestamp:1;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 39aec7f6d86d..c3b3d9c56dbb 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -246,6 +246,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  void xe_sched_job_arm(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> +	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct dma_fence *fence, *prev;
>  	struct xe_vm *vm = q->vm;
>  	u64 seqno = 0;
> @@ -259,9 +260,11 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  			xe_vm_assert_held(q->vm);
>  	}
>  
> -	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
> +	if (vm && !xe_sched_job_is_migration(q) &&
> +	    (xe->info.has_ring_tlb_inval || !xe_vm_in_lr_mode(vm)) &&
>  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
> -		xe_vm_assert_held(vm);
> +		if (!xe->info.has_ring_tlb_inval)
> +			xe_vm_assert_held(vm);
>  		q->tlb_flush_seqno = vm->tlb_flush_seqno;
>  		job->ring_ops_flush_tlb = true;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 694f592a0f01..8e0ba2eba21e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1619,6 +1619,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  			vm->batch_invalidate_tlb = false;
>  		}
>  
> +		if (xe->info.has_ring_tlb_inval)
> +			vm->batch_invalidate_tlb = true;
> +
>  		/* Fill pt_root after allocating scratch tables */
>  		for_each_tile(tile, xe, id) {
>  			if (!vm->pt_root[id])
> -- 
> 2.34.1
> 
