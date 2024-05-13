Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F3EC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 19:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F4610E2B7;
	Mon, 13 May 2024 19:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FW/Ji4yN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFB610E2B7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715628878; x=1747164878;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4cuKA/jH/fIXgsKdgz5h+bKyzKKfZaLY+aCBlpSFU5w=;
 b=FW/Ji4yNaXa7waig1Mk0bd3yXbTfcmA2bzFVjXqQ4PfMbWdFa0oTq1wg
 zxZNqh2C25cx/AFPr1vvEvxgqsTLKTU2qnMZJSqGkyHY6cJjtzqPVwei6
 g6xiYKWJjJ2bPoDwhFoAmT/eC0wRIeFn0UZVNeZ1joMdr7tEUJBaWnkAb
 dGD7YnjVczrmDIY5tsg0sEiPvXzamIrR0p98B99mcrtiuZmuzhuo9sgOd
 0hAqaFzVVj92eFlxAF30DJOOjLEjVE66C6LXPaialDDKrYLQyt0thi6nA
 RWwhZJwnWf57a/ke3C/hpUDubNs8vwnhUFObMn2uva1zzMUpX0gejgZ4j Q==;
X-CSE-ConnectionGUID: IzyB3nfpQ9WIfeudCKw2Dw==
X-CSE-MsgGUID: EmOoZlN3QFixr3ZXuXyW3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11405217"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11405217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 12:34:37 -0700
X-CSE-ConnectionGUID: 0fD/LSA3QtuR+7ZIxwQg1A==
X-CSE-MsgGUID: kro74GI7QV6wiRLj/6UOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34878106"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 12:34:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 12:34:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 12:34:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 12:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JecXNbxA1S97ziy9KdZfZo/BLkvJch3n/WrFJevcCUH2Mh96AWAMrfGS3FuL2TGSOoLXx/B86mIV5nhYqoqllTrzesoi5mtwb9y5YPrM8StKRPIu8TBrhFon6P6moUMMSuk0ptEaKYS4TkgS7rtRlFZkMNeuamhpYbvg/l60jFvAjMgXdtwurJ0ZuiB8EG2YtqPbM4nT+EOQUi62m9QwVoAfIt/ihIua8VGhnj3Kd/lEVilPLilXSVr8Bf1ahE7UC4jGG3RxqlfwnPZrhF6o5sdjDrnP6uUjFl3sCEJcIbgn3UirDC/Zn1ZGoQ6eiU/l2Yq5RZk0v/xfOezOojJv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2ygpGitLPpLXnprHLe6fO8Rq/BNb5yn5X5h/D6ialA=;
 b=mneZuLVfy91DInphBMIkIMEO3pyGYqpjh+tmN/tlweLveg7owguzihqMt+aMlNrLbWhhcTDg96ipiCqU6uxQXvfiRSVXaZ5iJgOu9cjBL93kSfZdazaQ5ZCY7bL9Kf4K6XfdzX1NmR0wuMiYm7KWmIEsZxpNhAa6f3mN4wCWam0LC4kUCJ43eVF9vdrvy3IftnUqotTA8qLm6+LMCDlp5Im1vsGsPtoBEjYJ4gxbFuEq7018M9jVAPhJsou5m1qZx8iZPY53aOH8vij5szbX388HUdaR/aYuUa/zbU6gNsuAALL99IMIdmCHf/v8FjQpx7HVjdILk08JUxg3MXUscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 19:34:33 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 19:34:33 +0000
Message-ID: <d038777d-dc89-4ee1-aa33-ee7fb63474dc@intel.com>
Date: Mon, 13 May 2024 12:34:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] drm/xe/ggtt: use drm_dev_enter to mark device
 section
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-27-matthew.auld@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240510181212.264622-27-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS7PR11MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: db95c35f-c384-442e-2754-08dc7383b77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExDM08vZG02OEk1bm9qNzBiTXJQZ2M2WUxyTjF5ald3dG1iaGZ0blB4eUNG?=
 =?utf-8?B?TkxXKzlHZUpGQTZkaEdZalNndWtHWEY1cUFtUlBMb0NxVWxtbXZjb0tkQlpE?=
 =?utf-8?B?cEJvbG1mUG1EdWcwREI3akpWeW5yTDRLVzFNd3AzZzhuS0paM3krRXdmVWhM?=
 =?utf-8?B?bVJSOS9Qc3dycEU4YmlnNFcxZWVWMUpqcnJLbytSeklWdjBwY0ptczBpblZr?=
 =?utf-8?B?d3BONzNCcC9oN1JLQzFCV0NvRHhwN1RseGR6NDMzd094SWtXNktZazc0Ny9R?=
 =?utf-8?B?UU5ZMTd2eTFFTWRGREprMmFFSEZTY0FaVTI1OFQrNHR2akFZQ3MzSFNHcGts?=
 =?utf-8?B?akpSdzYvZ05vTkZlbEFqUGY1MzMzTzBJNVdCdlRaSFR3Z2hGUE1jeDIvUDE5?=
 =?utf-8?B?NEJCampvcDdPN2lIZFc0ZFIvbGxrL1BZRGk3Qkp0N1BOaHgwSTRmeS9QekVG?=
 =?utf-8?B?QzlkM3FqbVFOYm0ybFBIY3ZUamlreSs2YVZIdHdUVzhiYXFVRUFGTXJ2ZllG?=
 =?utf-8?B?M3RGYU4xekRMMEhhb3huVDNzWE9ycExlaVVtcnhoVGxVeWdMWW9WbTRqQTlo?=
 =?utf-8?B?UE02WjE5dGZqTVUxS1orZHVDWE81MHdDTE40dG5oZHhTbklodFBhZ0xBVlJJ?=
 =?utf-8?B?UnZZZDY3VFNRVCtPd1hSbk5tbmFQK0NIT1NBekdVc3FPb0NlUVdrckorOFlW?=
 =?utf-8?B?MTlrOGZnc3RpMEJKbmxkUnRsYmFRTFdMUVVPMitVdkt1bzZldy9nc0MzVGo2?=
 =?utf-8?B?TmpaYjdYdlU5eXhEZVhNd3JxcXI4UC9jR3E1cTdIOGoyN1F1aHR6WG1meU55?=
 =?utf-8?B?SGhNTGZlYm5DNUJ0bzlnSksrQVdJb0syckFwZUhIZlRROWJiZmd4bFVpcWpU?=
 =?utf-8?B?VmlLNENmNzNkbHk4Wmh2YUFGbHRwQjJiQ20vNEFoRFlUN2JRaGI3cHFGNHVt?=
 =?utf-8?B?YnIwNmdHNUx3L3JuZXBLSnVvS3Z6bVI5VVg2em1DYlUxREdvM2ZXRUlreWcz?=
 =?utf-8?B?NG9TL3A3emhFd1owQnBLSC9oL0dxQnZDVi9ra0ljemQvZ3M2ek5qZDN6QVFM?=
 =?utf-8?B?b3JVZU8xeEdHZlI4Q1lLME4zL2xJOG5BZlYycS9wdmUvVTRwTUxZdnp2eFhZ?=
 =?utf-8?B?a1l3V0FSbDhCNTJKTWZXc1BnY3ZXd2JhenNQY0ltWERuaWdXREJVTEtSMUQ1?=
 =?utf-8?B?OW1Wdm5lalZONXYwazFqdkh6eGpVYUJramttMHpzLy9adDRhQlVXajNTbk5G?=
 =?utf-8?B?OEFZUkRrVjQyTGZQWVQydjZlSHB1YXlKMFEwMWN0ZmoyOWNRRkhlV1RoeG5U?=
 =?utf-8?B?TEJLUHNmRWwwbmVHY1Buc1l5VFVudThqMVR4Mk1iQlpES2lzRWg5dWNUdG9K?=
 =?utf-8?B?ZFRlbHZTOTlSNWdUK09FS2ljQk9JbVRHYktwZFF0bFgzWGt3dTArb3NJRzkr?=
 =?utf-8?B?UDB6TW9QZWJzakw1ZE1MQ1Axdmo1TW9EZFhBZnpwbTl2Uk1RelRyeFU2QnRx?=
 =?utf-8?B?eE04aStoNWhZVUtkSlhHMlZ4bWZ5NHFMTDFTN2lOdWFveEg5TVVwSk16Tmpy?=
 =?utf-8?B?MERyeXVrem5JUFRPZjQ1clErVFgrMG1DQnNaZmM5MWFubHprWktmYWZ0SjVy?=
 =?utf-8?B?bk9RZ2h0c3FyTkFjRVNyWkxKUVlVanc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhBYmY0QmxGaVFUZTkzOGVKQXk1Mnd4dVJMMktqUk41ck9mWU9jUTlybnZ6?=
 =?utf-8?B?WW5CNWhuRDlNNmxCa0g2UitibldnZFBKZGkzLzZPaUg3NWM0VkMrK2hzNzZV?=
 =?utf-8?B?RmtUT1QwYWRjZWR0b29YM2JOQ2UrVFNvWlRSbGhtWXFtUEJacWx5TDl1ZGpr?=
 =?utf-8?B?Tkt4SFFLb25zSERaKzVjYkt6UGFlYVFsamdkSk1WL1IrWFVxV1VRK1lwTEtx?=
 =?utf-8?B?T2dmYnV4Rkd0bHZ3d0FGVUh6R1cwZjRHZnhRRzA2M203ZE9scmNCT1FnVHo0?=
 =?utf-8?B?WDBIMFkrMm5WVXZ6VTNqKzU0ZTlTSXVTcXFkbUJrWFBPVGFGZ29IL0FjZGpH?=
 =?utf-8?B?SUZXYmJHUFVhLzJTbTNMcHNuOVBpc0hBNU1TMThlVFZDMGMzZ1Q2emp0aTBj?=
 =?utf-8?B?TVg1SmNsZjdqaTcrRXRNRm03eStDWGJ5S3FrR0RiOUI2UVRIb1hhcGV6OGRj?=
 =?utf-8?B?Qm9IaGI0MGxJK2JONTFObWlFdnRLZ3FzZS8wNWVlKy9VTzNZanM3elBvVHA0?=
 =?utf-8?B?WGFnenkxVCtVcEJObWp6V202ZWdqWEVkTmRRcnliUzZSMlRoQnVDZ1hOaDNX?=
 =?utf-8?B?VU80OERnTzdxTDZDWG02Rk92UldWTVpBcEhieFpydkhjYzZZei9FMlU4bmNi?=
 =?utf-8?B?b3YzNEkyd0VQbGZVdWxqN3dYWi8xZnN6ZTNCNytkdEdodkxnVlY5amRXSmEw?=
 =?utf-8?B?YUx4S0VxYngyOXUzWUlJcGVGVDJ3ZXluam9wdWVBRVozVHJFUGFPOEtxaldu?=
 =?utf-8?B?elR4K2NpQkhZdnBBOE5lc0IyUmZpK05KWm1XOEJaV1VDM2ZwSUU3WEVuYTdS?=
 =?utf-8?B?cTk0K1lEWVlUWTZZd2p2QllRRldtZFJlUkVuZ2h1VmtPWjJjSmJOelVwRkhL?=
 =?utf-8?B?VW1RSUdaVEpQZllMSHdSM0pKUFk0T1lMejZPeE9uS3ltVTJYcTJhS2hQVjlp?=
 =?utf-8?B?aDVaZ2ozVDd2L1FZcWt6ekU3SWtyeDlpY25vRVVCbTdPMTAyMXpPV0JuWFBv?=
 =?utf-8?B?ZVFqVXkyWWtibGtJTTBSTW5TdTl4TGRoN3V0UTV6cHJNeHo3UXRjUi9sNjdF?=
 =?utf-8?B?RDlHbm5GRklWTWkrMUxNYjJNcFJRZ0txNzBrSFZiVkdqRWFtNVE0eEVGM09p?=
 =?utf-8?B?bktzbVdOZTZ4SkRwdUhBYUE2K2dtS0xDbTI5aDBCOEo4UlFLYXRhbXRLbVVs?=
 =?utf-8?B?WElpT0plc0M5Ynh3TlNrcGtZK3NNTW50NnZiWkcxVk9vUkdxWnUzellRQVpm?=
 =?utf-8?B?cFFSSSsxRUlQaGpNT0U5MDRWYXhIdHZRREJ3YVRrYXZpMC9lNWc3UTJzd25j?=
 =?utf-8?B?SXdBZThWNXVnbElwSnEzakpWWFZrenRFZVY1MFAxQWZZTDFlME9Fa01WODh6?=
 =?utf-8?B?TFNSYk1WZ3FUKzVCUkFLS0RMOG9KR0ZJTm44QlkxR01QMU9aeGZiQzVDMjJE?=
 =?utf-8?B?OWVIMDlqbko5UDNQNFFyNlEyd3pTWTgrVkZ1WTB5MWY4L0FQMVZTZHRBNlJ2?=
 =?utf-8?B?c1hPSnRrRGZEbEFoVGZHYnJoYWNjcURHc1pQVWpkZ1pMSldvdTYxUVVqVHlB?=
 =?utf-8?B?ZUFsbktmWFNCWG1pbEptZGgyL3c4ZUtOVlYzN09WNmVjRk5XeEdHYXB4TGJO?=
 =?utf-8?B?dDk3TUZ3ek9iV01HZVNYR2tobXh1MXdQNUV3QjJCdGZoR2RkQTJ3UTlFdjFx?=
 =?utf-8?B?UzlWWWlPRkVVK2pnU0tEWFZ3V3ZnbmpaOXJFVGcyMjhpNXVSNlhIb2JVYStX?=
 =?utf-8?B?Yzl6KytpU1dkNWVxTHloa0diN3ZpMThQRnp2WHBmL1NJNFB5amE0d1d0S2Uy?=
 =?utf-8?B?UytPT3BJWDB3aXlFbGlhNXVuaUlsOVJpOUVXVk1BSm5Od2NETzFlUXU1eWtL?=
 =?utf-8?B?RkNLVVhRN094NXkwU05ySzFaTklFalpiSkFZR2NDWjQwdHhxYXUyM0JTcmww?=
 =?utf-8?B?cUUrMVg3SWszVVZYenlVQmFmd2xsTkRaNFo3SE5tUnVLQThEcGxrcFhvVGJN?=
 =?utf-8?B?Q1NVUndXRGFJaXFlSjlVdWFJTUxKQ1YydjBUMHF6QVVTeFc5RDVwVE1LandQ?=
 =?utf-8?B?TDdzWWJ0YW90ZXl4Nmo0TzZ0NGVzYWRROEdYU01LVy9jS2tTSmoxVmFjTEVD?=
 =?utf-8?B?ay9EblZjaWMxYmtnbUlKaHhrbUJQZXZack9HWmlHSG5Sa3FLRVlaRzRjTHY4?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db95c35f-c384-442e-2754-08dc7383b77f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 19:34:33.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PDEuHBp2WUkruHnTyrme8MD4kpUvTPKtmljW+gMAWkOm9HZY2E67kWCKObfRkgfkPlVSliRlKdMiFx1OaVrdLwzqaRYLLVVQxfNJXzXtM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
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


On 5/10/2024 11:12 AM, Matthew Auld wrote:
> Device can be hotunplugged before we start destroying gem objects. In
> such a case don't touch the GGTT entries, trigger any invalidations or
> mess around with rpm.  This should already be taken care of when
> removing the device, we just need to take care of dealing with the
> software state, like removing the mm node.
>
> v2: (Andrzej)
>    - Avoid some duplication by tracking the bound status and checking
>      that instead.
>
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0d541f55b4fc..17e5066763db 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -8,6 +8,7 @@
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/sizes.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/i915_drm.h>
>   
> @@ -433,18 +434,29 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   			 bool invalidate)
>   {
> -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +	if (bound)
> +		xe_pm_runtime_get_noresume(xe);
>   
>   	mutex_lock(&ggtt->lock);
> -	xe_ggtt_clear(ggtt, node->start, node->size);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->start, node->size);
>   	drm_mm_remove_node(node);
>   	node->size = 0;
>   	mutex_unlock(&ggtt->lock);
>   
> +	if (!bound)
> +		return;
> +
>   	if (invalidate)
>   		xe_ggtt_invalidate(ggtt);
>   
> -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
>   }
>   
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

