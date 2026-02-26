Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA8EFD8FDA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E3F10E9DE;
	Thu, 26 Feb 2026 17:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlx1zXXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732110E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772127068; x=1803663068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8BKSwnZ3ck6m2YDF+E/C+JKnEWBz7PiSCTrkV13kx04=;
 b=mlx1zXXIONI+Tkvca1H4OAwZEsfgLo3hZ2OMVW8D6XeVCmsuHMu1bh2r
 qHluAES//zoIxl2NXv4dm0q8MsfNkU5MX5Y2HbxQ8WfsBAVQqyTBxodS9
 dSmTgaLd5HGK3YM6ma06yE6txRdGzbl3WN7nGVqExBH4S4X2ZHZzaSmji
 FOx6EyVsh3yhxfSBfeU6L2Q1KDtuoaJ7mZnYS996ANC6fZuIV2o6ckUkj
 QWzmhArc1UuZ6dCKQHpDVGxtmnQOZygzd2bO5jVnEjZ9Q6xTbG3DsSNoD
 c04d4Vlh0RMKRE4wDCuzDoXjrjmOYp2jCSp4rMGQPKuAMhKW0yf07QcEo Q==;
X-CSE-ConnectionGUID: BiSewfDwR3S/YUqQmrBjOg==
X-CSE-MsgGUID: LMJ/WtjTTeGecmd6Mt0qfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77067667"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77067667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:07 -0800
X-CSE-ConnectionGUID: ffscgkEpTzOTiX/7pQTHbQ==
X-CSE-MsgGUID: vDUVb8gnRJm9CZsClwIvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216540520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:31:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:31:06 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3oEnkKCya/517XzTq2CxEXegiQMp9MLOg1ZmRrUIOHNOyTVOWRndgt08hpG/1VVvfTCGS3U5LcgVpXJrgDd26AQ7UySWFabvWKY6soAlM/y+xbfol+7nBLJ7/V20oZoF5CTPIXMVvz61jzwIo43Punyd/JhCjtK+N8zS9n7DmBF6Rxfk37y7Q84Bz/8zZFdRTnU1Laar7taTURlrJyLRGPLnbLAvkIQ6XlNwPHIA4l8Y8FVtII7HpqnmZuzI60kswVQwOwvmMY9x/aOXxmPTPRSescAFp4q0OB9I71D30PNVJYZMVuEPfpR+aN15X6B9PP95oci62fUr46pCEdl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OC2toy3zUFsgXJGWXbGBLdEXmKMCM6aqHo32Km/GoM=;
 b=dMer1FMsWmjJPV0ZHLpzGVREfnJYykiN3HPnUGLP/lclTVUYcT+eBYNEYGOREQV0ptSBxb0Lgl/KHMhbdsHknL/st8bhySMcwb7bBSsdjPML61oK2RJ0uMbm5S2TgiDHHNKult1LzNUk5BWnsWf2DnsR4+H3EMBUwC9NC2R3sF7t+PQb46vVYykpL1knMlyYd0THvut2cyFIR4b/Q9OtsLY0yUwwhrYKX+9NErBt9MHYo9Iv8cy6XzL4pHmN4+pZpPDp3pDUqQKwX27kHuq2oF+ACCIMCJNwcHnS7uYBfvgs5Hy5t+LBhh68KDep0D3kD8TU9Bk0aX3DS3Ca6ugprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:31:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:31:00 +0000
Date: Thu, 26 Feb 2026 09:30:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/queue: Wrappers for setting and getting
 LRC references
Message-ID: <aaCDUCbOI4M9SX2r@lstrano-desk.jf.intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
 <20260225235447.2772383-3-tomasz.lis@intel.com>
 <aZ+k/Fd6wZ48czIy@lstrano-desk.jf.intel.com>
 <aZ+ocKctwftPBcbn@lstrano-desk.jf.intel.com>
 <906b9ee5-2bc8-4b38-a9ec-3e8993a6f015@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <906b9ee5-2bc8-4b38-a9ec-3e8993a6f015@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b6723f-94b7-4ff5-46ec-08de755cce8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: vJoZBhjVax8CibIB5IdO3g8eQAL6wljb59mfdnrDs4JVcLcH9GckhYxMbP9ldpaM2vaPZTd+w1wkUt3uslSKNoopsEGMxcnPzaQEO6O3Ef8Fzo4Izi6lNFOGKjwOr/Bq+joZQGzuPjDQDKHrwqOrOnP9w8wjpihNtQmbxvQWH3YbJZHXB5R0PQA8PpVGfASxgnQg58EVLC8soHCLjT0sduK2VIRbzWuCiPdZ5FGWhIIBSGMxZHBtCX5na7KlV7KlnAclA4hntq7m83nSHkLuQyC7g292ll504ucSmplnd6KKW6s1aOY+r9CeivBCr8THQf7doxAXh5okGGiBNyli/zo1F2UP0CADEsQp8dYjeJyQbyVJWIY1/UNkbtGZ3xM1zNSLljyNw8xdYB+wtsvbK+9vh81NXr+y5QlR1P2P6QFZJ5MbPomE0aNSBcMZqFuW7BUdrB2KxVu8A9TvS8jFP1N8DF8GkrUdfsrFivJfSgodX4no22FL1zGDul9/wbSEx4LXLcngVXE8nJWkVeMMCy7ALnz6UclxNg9hhtEy3fr/pC8k0QJ0DOoShSSO3ezUxpPFHdVB0fK+gElIBGmdY6DO2xS2u5ohzqEj45a7yEESFsvV9D7MdTlWOGiXGWotaWtBqiPLWmfQPW0VDJ7MkbDV9Kgr/zZL6ShEUIWRiyYRKTXSGUJHPyY5ro6T2N18u/Z2G8EfGc2QiySSNA08ccGTQe0WSqpBEmu66k1u+6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRUK0NDblhDQVV1bGpyQnpqWjFnQi8xU1JYay9MYysvWkZ3YmdMZUI0UnJW?=
 =?utf-8?B?S0JVMlNUTkNxMm1aaWJ1R0FRTFJtQ1k3UGdiMHdSQzJoaVNOQ1VGTDdwT1pC?=
 =?utf-8?B?UktCajY0QTZ0cHFTUEQrbURtekxZU0dHZkhBRnhoWkFSNUtYKzNlTHkxWUR0?=
 =?utf-8?B?aExZeVhXOVVMbU1XVyttMGsrNExKYzUxaDdBMDlGSFhrN3lRZFJNYXBrd05r?=
 =?utf-8?B?RTJ2Q3NLcjhhS0NlVkc1SkhWV1kvUDAzWnROSlRJeVZMMEFOT1dKajVkNUdS?=
 =?utf-8?B?OGhLNDM3RHppRUtqbTUrQXduNWpsY0ZOYTR4ZzhLMXBoK1FtbHNBdnIrSVA4?=
 =?utf-8?B?UTJzL0xzeEVqVUZtSjY1RmZOZlkzdGhkaDZmMDlPM0dUbkMrYjJnL09ESCs0?=
 =?utf-8?B?dG1vQ2FLRTNjb2hrM2NXSWZWamhWREhCYUh6d291a09GbjJBKzV4MXRmRFh3?=
 =?utf-8?B?aEFWeWNVaGd1WlliZGduUHBielhJZGhZYVdLSG56ZENjNXFwTUlxdWoyWC85?=
 =?utf-8?B?VnhNbFZaWGxzK2Z3Vk9ZUzVaU2w1SmZ5SDgzNWZ1NDBOK0NXS2VVQ3ViUGh4?=
 =?utf-8?B?b3FsVGNaYUFlOHVpUHlUYU1uZ0Qrall5aXF1Slloa29DUS9KTmFPakxOa2ZV?=
 =?utf-8?B?MDY1bllDYXQrMGhNRTdZWE9QdTVqek5Dd3Z0R0g5RStlYUpvc1d1NFBVWDUw?=
 =?utf-8?B?NVI4c25oMnRSS3BXbTZTcWkyQXIxLzRHbkx6emU5NWhyUHRxV2ZsM2dvWTFD?=
 =?utf-8?B?bXozY2RJOGxYa0ZqVHMrSFFQcEsrc2laQWlKY1RLTXg3T3dRTEpLcm5ZOVFy?=
 =?utf-8?B?b3ZzalVBTWRNWWNyK2lpQVJUVGpFa2oyVjZVN1hJM1pLMlJ1dVdTQ2F5UmtQ?=
 =?utf-8?B?dDBuOG1hNng0V1pGOVN5cEg4dFI2U1RFZ29Ea1M1QnlDRjI5WE4vTlJuV1Zv?=
 =?utf-8?B?OUlvVktTVXNMdDdzaWc5QVovcllJWDRNTWJZQzBGeFA0VDM1Y2JBZ21IZ1FT?=
 =?utf-8?B?ZEtmeC9UVEoyV2R6NGhVRi9oYWdVQWY3YjROSm5yZ3hLdGIxNHRhVTRwNVhL?=
 =?utf-8?B?cUMxY1dYVDMxNjlZV2NUejlhU3FXUTNqWisrRyswc0tyZFpDNExkNnoyaE90?=
 =?utf-8?B?MklEeGpuZklvWGZOUWFlZlhGRXZReTNYdmZOY3ljdldEUW9zc3BBUlkrQWx2?=
 =?utf-8?B?Z0FKY2ZSVmgya1FicU80ZWJtV01sVWEvYmg1dDdLcUJzaHcyOW9aQWFTZm1x?=
 =?utf-8?B?NS9GWnVvNjhySWx0VVhlRGN2b0xYVTB0YWsyazd2SHNDUW40c3FHMmtoekpW?=
 =?utf-8?B?TEVZSWdQczBlYnV2eWt1NFo0eWZqbXZWc3lweXovT0hycVJPZ1BPVWY1SVRm?=
 =?utf-8?B?QllIZ1c3bDc3c1lJYzdPM0ZuM3VreGJJVk9VeXVCcElUSVB3SHFuZkREejFL?=
 =?utf-8?B?dU50WVFrdVk2azg4UVdKMnpKNk05NlJ1NXNuemhsbVVvRmNmMmJpYzNDZDR3?=
 =?utf-8?B?d3dFVzBNMVZDQytmaHRtelRGZmlSMmZRU0ttVnhyekMzbW84MnVrS2hGOHRE?=
 =?utf-8?B?Tk94Y2VEMHRaRFRJenpiS3h4YjZMU01Sd1pUbElmZUtuUHhvczdoSFlqcmo5?=
 =?utf-8?B?VnN4aW5LeDR3SGlUWWkrYWY3clkrQ3lCcW1PT2ljK2Yrc3hSOXNKcnEyRys5?=
 =?utf-8?B?UitMSVI5Nlk2d0dKN1hQSC94cDZtaGFhVlhKZ215aC8vajdUdXJNSVhWazNm?=
 =?utf-8?B?MWlzdmhUUitVM0J3dDlkYU5mWGFOcVdudXhyQUt5L0pXQnUxMnpBbldPUXRB?=
 =?utf-8?B?RkJ1TWFPQnlDT0JmamNQRFZ2MzNHSHY4YUVId1RCUStMUjN3a1Bhb1Z3OWRJ?=
 =?utf-8?B?K1RoZklXT2JWbjhBaXNXWTA4NC8wWnFmaHRUSlFSZ2pSc25sbUhpaDBKRllH?=
 =?utf-8?B?ejh0UlBkTXlsTGtEU05kRGttK01HY25xa0VEbDVpY3RpL1Q2ZFBhNUVzci9N?=
 =?utf-8?B?N01YTExUWkhuYW44QlN2ZTBIempqN0p2T2R6Vk5RK2JlUEFBelFkM0dIeE85?=
 =?utf-8?B?TkxBYnFXa1Z0NzVOMERGdFFLcEthak5IN2dxZmpITGlyN0ZNeE5mdWY1dTVN?=
 =?utf-8?B?M0ROM2RwbzRMbWppQlhHVlR4RDdYM2VJMnRLQXFjQjFGWW96LzQ4NmdVRW9w?=
 =?utf-8?B?Q2xxYUQxYTY0b1lnVEo5Ymk5MG10b0o5RnB4OURST1JtVDd6UlN6dm10eUl1?=
 =?utf-8?B?cmtERzQrUDgraUhCb21TRnhxOTBQcEZ3emhUNnJ0OFJLZkR1czBrTUxXR2xQ?=
 =?utf-8?B?V1RVL3Z3UkZCL0ZnMnFlUzhlUWxnL2crTjBUTlR6Q0x4Qy9STGRBQzJSNnFl?=
 =?utf-8?Q?9jSZV9IPCyO6R4NA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b6723f-94b7-4ff5-46ec-08de755cce8f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:30:59.9977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsgHemoDjx+57MIF9dFBbPv5UjKlT4IBi1gi7w9UtC2npWxvBq2kCUGJF8xLImbfg9pFAbAKPJWx5J2NFlxxqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

On Thu, Feb 26, 2026 at 06:26:29PM +0100, Lis, Tomasz wrote:
> ack to almost all requests, but comment to one remaining below.
> 
> On 2/26/2026 2:57 AM, Matthew Brost wrote:
> > On Wed, Feb 25, 2026 at 05:42:20PM -0800, Matthew Brost wrote:
> > 
> > Opps, one mistake in my review, corrected below.
> > 
> > > On Thu, Feb 26, 2026 at 12:54:45AM +0100, Tomasz Lis wrote:
> > > 
> > > s/'drm/xe/queue'/'drm/xe' in the patch prefix I think.
> > > 
> > > > There is a small but non-zero chance that VF post migration fixups
> > > > are running on an exec queue during teardown. The chances are
> > > > decreased by starting the teardown by releasing guc_id, but remain
> > > > non-zero. On the other hand the sync between fixups and EQ creation
> > > > (wait_valid_ggtt) drastically increases the chance for such parallel
> > > > teardown if queue creation error path is entered (err_lrc label).
> > > > 
> > > > The exec queue itself is not going to cause an issue, but LRCs have
> > > > a small chance of getting freed during the fixups.
> > > > 
> > > > Creating a setter and a getter makes it easier to protect the fixup
> > > > operations with a lock. For other driver activities, the original
> > > > access method (without any protection) can still be used.
> > > > 
> > > > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_exec_queue.c | 71 +++++++++++++++++++++---------
> > > >   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
> > > >   2 files changed, 52 insertions(+), 20 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index b4ef725a682d..2cb37af42021 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -270,6 +270,54 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> > > >   	return q;
> > > >   }
> > > > +static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
> > > > +{
> > > > +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> > > > +
> > > > +	scoped_guard(spinlock, &q->multi_queue.lock)
> > > > +		q->lrc[idx] = lrc;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
> > > > + * @q: The exec_queue.
> > > > + * @idx: Index within multi-LRC array.
> > > > + *
> > > > + * Retrieves LRC of given index for the exec queue
> > > under lock and takes reference.
> > > 
> > > 
> > > > + *
> > > > + * Return: Pointer to LRC on success, error on failure
> > > NULL on lookup failure.
> > > 
> > > > + */
> > > > +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
> > > > +{
> > > > +	struct xe_lrc *lrc;
> > > struct xe_lrc *lrc = NULL;
> > > 
> > Actually not needed as lrc is always assigned and will either be present
> > and valid or NULL.
> > 
> > Matt
> > 
> > > > +
> > > > +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> > > > +
> > > > +	scoped_guard(spinlock, &q->multi_queue.lock) {
> > > Hmm, this isn't what 'q->multi_queue.lock' was designed for.
> > > 
> > > Can we get a dedicated spinlock? Maybe 'q->lrc_lookup_lock'?
> > > 
> > > Open to better naming.
> > > 
> > > > +		lrc = q->lrc[idx];
> > > > +		if (lrc)
> > > > +			xe_lrc_get(lrc);
> > > > +	}
> > > > +
> > > > +	return lrc;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_exec_queue_lrc() - Get the LRC from exec queue.
> > > > + * @q: The exec_queue.
> > > > + *
> > > > + * Retrieves the primary LRC for the exec queue. Note that this function
> > > > + * returns only the first LRC instance, even when multiple parallel LRCs
> > > > + * are configured. This function does not increment reference count,
> > > > + * so the reference can be just forgotten after use.
> > > > + *
> > > > + * Return: Pointer to LRC on success, error on failure
> > > > + */
> > > > +struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> > > > +{
> > > > +	return q->lrc[0];
> > > > +}
> > > Why move this code?
> 
> We've added another getter and setter. It would be very un-structured if we
> had one getter, then a lot of different code, and then the 2nd getter.
> 
> Where no other restrictions apply, we should keep functions of similar
> level in one place within source files.
> 
> When someone looks at a code which contains a setter and a getter, I believe
> they should find any other getters nearby. They definitely should not expect
> there may be another getter of the same resource much further within the
> file.
> 
> For why move up instead of inserting new ones down - it is to avoid
> unnecessary prototype (I believe checkpatch would otherwise complain).
> 

Fair enough. We lose a bit of git history, but the function you’re
moving isn’t exactly splitting the atom, so I don’t think the history is
a concern here.

Matt

> -Tomasz
> 
> > > 
> > > > +
> > > >   static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> > > >   {
> > > >   	int i;
> > > > @@ -327,8 +375,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > > >   			goto err_lrc;
> > > >   		}
> > > > -		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> > > > -		WRITE_ONCE(q->lrc[i], lrc);
> > > > +		xe_exec_queue_set_lrc(q, lrc, i);
> > > >   	}
> > > >   	return 0;
> > > > @@ -1288,21 +1335,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> > > >   	return ret;
> > > >   }
> > > > -/**
> > > > - * xe_exec_queue_lrc() - Get the LRC from exec queue.
> > > > - * @q: The exec_queue.
> > > > - *
> > > > - * Retrieves the primary LRC for the exec queue. Note that this function
> > > > - * returns only the first LRC instance, even when multiple parallel LRCs
> > > > - * are configured.
> > > > - *
> > > > - * Return: Pointer to LRC on success, error on failure
> > > > - */
> > > > -struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> > > > -{
> > > > -	return q->lrc[0];
> > > > -}
> > > > -
> > > >   /**
> > > >    * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
> > > >    * @q: The exec_queue
> > > > @@ -1662,14 +1694,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> > > >   	for (i = 0; i < q->width; ++i) {
> > > >   		struct xe_lrc *lrc;
> > > > -		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> > > > -		lrc = READ_ONCE(q->lrc[i]);
> > > > +		lrc = xe_exec_queue_get_lrc(q, i);
> > > >   		if (!lrc)
> > > >   			continue;
> > > > -
> > > Unrelated.
> > > 
> > > Matt
> > > 
> > > >   		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> > > >   		xe_lrc_update_hwctx_regs_with_address(lrc);
> > > >   		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> > > > +		xe_lrc_put(lrc);
> > > >   		if (err)
> > > >   			break;
> > > >   	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > index c9e3a7c2d249..a82d99bd77bc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > @@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> > > >   int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> > > >   struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> > > > +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
> > > >   /**
> > > >    * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
> > > > -- 
> > > > 2.25.1
> > > > 
