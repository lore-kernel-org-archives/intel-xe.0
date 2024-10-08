Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB85CEF17C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8F110E55E;
	Tue,  8 Oct 2024 14:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nteGFpnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012B10E560
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728397289; x=1759933289;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Fpjdwfy3HZiOzjBfdfFlhnbycEhanhMJ3JzPiHRNVM0=;
 b=nteGFpnNBuhjAfffmCzjLCmTrjIuIDZxYKMGWexe2Xs3LjUZTtcU5IUA
 GGHfWpvCoDStWeVd/O1GsPVGWLzmYMD4gHM3CeKvv6oGNQO4BEb26mahh
 Aqux2teUJnAHkK7JGgz3o4AmmtYgUouBc4d6CPzQG1x9ecvUUqRrB57VK
 Is55bEJ5sHKjNiyOdElsXiE0VYyqay43f30Qr1Jtlabm/NjO+SWCUALNE
 tGUc3tgTsZFTy+Kr2IXlj81koVtzy41uq4N6InfXtmTe4Y4dljjBdryRS
 xt27grVHYDLaNHNDA+fd9OAgMRbAAfnAj+hvXeL7L4VJ83njmM1vy5Cwj A==;
X-CSE-ConnectionGUID: XLGDbWV1SN2rMO6k6ttZLQ==
X-CSE-MsgGUID: 0zklfFWbTBe6t5U9VeWS4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27083453"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208,217";a="27083453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:21:28 -0700
X-CSE-ConnectionGUID: EXm40V6tQnOtGhPt1KcPCw==
X-CSE-MsgGUID: GKk0Gg+wT22jLDmeiMzRYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208,217";a="76224217"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:21:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:21:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:21:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:21:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:21:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl3f59pwjc6TLvmV6kmreww5sYqUYnK7B+hHpqi1CI/jnKXaLAKTlm3xZdWoVRRo5lYcrMTaqm9AU9aQzA7ytix9xSZ97iCZb/FJQngyze+x+cHjlVuZQElow1BqQFABJddVSGxY3lZCLeuaeSMWTJoq1fYo8wuG6Vy2Cp9hRLlq1gJEEHVxeJRrdy/g2WNircLw7erWbUxuyRjyX3luXYOKJaTcNnFFxDAz55UI+j5iPfu0emuCtAwBkKVOFeBB5ILfKBvUhqS25QJZE6so5HJBF3vKAN5ox92MnotMWc7TltI3GcO9PRvczrWXYaqMyLHE6laa5w/s6q0e3Kr5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9DIOlR2+p1dtaLnDBEMbgVkGlvEPSJ3SFrq6j1lemE=;
 b=nse1laerabGWXXhp4FiY1xIHDX3RlpNq7V8hGdlHSAtNXJWQ3hDY/u0ZDs7O13C7brr2Pje42JlCLCEAIo/xACWZ5gkLwh75t5na+sLyjijMXr+d50Wl22nfdqyYaJGPmtRiVX0Z6aoF3cQcMsmyzZpuMvwEWpsb3iWZzONl9mp9KHCnO1ngSjONoCXngy74k+wF3OsXIqPwXgtKAmKGIcohsbNrdRxDjPQo0rmWfVCoJviFc4bPrTGWHH0XUEOQkkL1bW4LjlcEPMYSwn1+B+nvuqQJg4BbYgL1j3IoYj5tj4fwESQjrKBQ5shnCF3MftYh7yS4Qh2qw9WCWNIYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 14:21:19 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 14:21:19 +0000
Content-Type: multipart/alternative;
 boundary="------------4UmhcghfBzTf2q6OoYm5lShD"
Message-ID: <f57ebf08-2906-476c-89f9-5d32c445f77d@intel.com>
Date: Tue, 8 Oct 2024 16:21:14 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vf=3A_Pos?=
 =?UTF-8?Q?t-migration_recovery_worker_basis_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
 <172837924152.1202832.18197135408135169579@2413ebb6fbb6>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <172837924152.1202832.18197135408135169579@2413ebb6fbb6>
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: fae1f28c-370f-4f43-ed72-08dce7a479d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnJqRjFmdkg1SFJnNWYwTmRMa0t0ZG1NWVROcDJHTGk4K1FBcW9NQVpiYkhN?=
 =?utf-8?B?N3VpN1EvdjJyMXJpQzNyNWlLQnZQSmIxeFJ5VkpVZ1FCclE1T201MUpiUm9I?=
 =?utf-8?B?dG1id2JqZ09iNzhBUzIzYjJMbllUOW91TWdqZFBKM1hXRXlUSmJJYjVXWlRD?=
 =?utf-8?B?TENlQy9IY3RUdkFBT2g1VjA5QUxZTERQRU5ZRnZPaFdHWkFBMzhFUkphVjNU?=
 =?utf-8?B?SWlrOFhyaFlBRnY0bmtISTZCUUFCUDdOTEliSEZMdE5qNXg3VHI2Y1pHaSty?=
 =?utf-8?B?TDk1SFI3TDJWd2t2Z0NTcDdTd2xyeU5Yd1RZcjlQSDZXak1laGhzSWJueG5U?=
 =?utf-8?B?anlIWnZWSmZ0VWxCbXh5MVdUeXlEK2J0Rmg4S0NMT2FGNyswVWN0bG9Fcm0w?=
 =?utf-8?B?WFQ2MVNMejdocWx4djFBeDg0OTZtV1NKUTNKZUlPczdmVnZER2NaUHNGTnFr?=
 =?utf-8?B?SHZnOHBIUVZoRlA1T3N6YnNBUk1FdXFWR2F5YVdGdTQ3ZXgrZjhRWUZmMjRi?=
 =?utf-8?B?L3lvSXVRV05PcjJUZTZpTXk0T1dNTFFLTXVjL3NUblY5a2ZVZWZoZE9XT0Za?=
 =?utf-8?B?Q0hVSStNeUxNY0JSa0c2L2dGY2VsUURvQjhzbDZwZnhEaXExdm02UkFVT1Ru?=
 =?utf-8?B?MmlmL2lKU21Zekt5OTRYWm0zc1RrQ2NvT2NOcVZ1N1NGcU5JSXhmb1N5UUU4?=
 =?utf-8?B?cDRibHg1WU1DbWlCZDJEUDduZzdjSTVMRFNMT3owQ3M1WGVVWkhTeXhxYkpy?=
 =?utf-8?B?azI1VDlJeU9GZXdVUFQwM2tPNk4wTjNUVitQcEdqNVJSVCtJTTFMNUt5Qjhq?=
 =?utf-8?B?RDh4RUdPcElsWlNYcmJZbVF4YlNyT0pMZ0plU2lWRUNjWWFxcEVBZXZES05C?=
 =?utf-8?B?a0YwTzhkU2c2Qnc3akxRSG9mUWtXS25xeEl2cDhlY3hkRjl2ZEw0OFJJNytB?=
 =?utf-8?B?QXJYLy81Q0hwV0V1YS9jL3N0S242d0ZvZDUxQ1JkbHljTFF3Y2UxVCtMc05T?=
 =?utf-8?B?ejVWdXhGdzliS2ZJeWQyclA2Y05INEtoc21MaUFiYVhDdWlxdkd6ODltUkRF?=
 =?utf-8?B?alZZaUNrRFVkd2pUUmNKVWUwMVNyRFNTd0NwRmtjc2RkVHFLNUxSYTBQTFFw?=
 =?utf-8?B?TlRiN0gyME11bUVrbVlROGZMUXhuamQ3cGxKQm02NHBGaEdWdUJraEhrR0N1?=
 =?utf-8?B?TDR1VzhUTmhuZ1NzQURKd202QWhUdFQxNWJYTWlScDdlU3o2WHVVUUVPOUhn?=
 =?utf-8?B?YUR5Qks2bjNtQlJGM21RZ25aU09HRjM1T3VBdUJUL2Z5WnU0NVA4NVZ3TzB6?=
 =?utf-8?B?djhRaUZjOSt3U1dQVVVDQVZzQk5mYURGR2huVEYyNEFDS0dzbUhuZkdyWE4w?=
 =?utf-8?B?dUU5RjJiMzZUdkFFK0lXeTZPTjhJUmVRTUl5Sk84aTk4eGR0TUhMZTVtY3Ix?=
 =?utf-8?B?N3c2MHcrMkk5RHFGdHU4WlphbHhBUE9ZYUYzZHJTLzNNTEVsRmk0NjZPYi91?=
 =?utf-8?B?aDJkRXNleklwdTRRSW0vb1FtUkZnMVhGOUtNSGxhbjNmb1grQ2FFSDJGUy92?=
 =?utf-8?B?WnpoeXZ4UHBObys5UlRpQmordERnTlBpalUyVlZSNlNtK1Z0dTErYVRXUVFq?=
 =?utf-8?Q?m8gg4s7iDk5o/NFf1P+0YnypC9aoTcMAcFvU/K5w6qH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndZQlZCYktWMVZ3V1YyYjZxTERqSU1sTFhJMnkyWG9zR0EycjVJN05PRDYx?=
 =?utf-8?B?cjZSVW91c1JlQUUwY0Jza0FXMUdsVWJFeXMzQWtSdVFTNEJ0dVd6VEFJbzRQ?=
 =?utf-8?B?bVVmM2ZhamtSSHBlMEdmbG1JQWhDelRMNmYxWjRGMDlod0gxRm9xa0FNQlJ0?=
 =?utf-8?B?RFUwYk42OXV0R1k5NzhEdFMxb2FlZklMd2hMdVVJR2VyQ0EvYjk4THFyT0xq?=
 =?utf-8?B?bkVJWTVZdDdCaWFnVnRIbmIvWnA3NTU4dmJ5cHFBdjJONWpLMXdxRW9vSEgr?=
 =?utf-8?B?eFNEdE82VU9MbmpBSU5yTDA0clNuSUgwdXFUZEtBYmFCeUcvZDdpU0tvMkJx?=
 =?utf-8?B?a3huSXVNNlc2MS9aVjZnZFRQM1NsSTZuaFQ1VUxVbG9GdnFqMFpzbGd5ZUtB?=
 =?utf-8?B?SVhzZ0Uyc3hwZVpXZzVkRVY2b1I5cUozdlRJejBUZU53VHVvTU9qaVBlVzFz?=
 =?utf-8?B?TWZiczZaT25oNk94dHNFM0VGKzRXSERxY2RsNjllRzM5MVIydC90SEQvUFV4?=
 =?utf-8?B?UFlEZmJUeTlpc0JwMldYSWtkeVFCdWh3dFVUTjFPc2MwbnVtbzVsWUxwbmMr?=
 =?utf-8?B?eTdjNlhXVis3ZlhqRDhkVExpQWNCK0k2WUtNLzNiMmUvdWNaaDFQMkNzcDdG?=
 =?utf-8?B?ajB4T09seGp1N3ZrbGFldmJrT3haUmFveGwwV3JPN2N4a01EblRkMVVGb2ln?=
 =?utf-8?B?MGJ5dlRVNkF6aE9Ed2sxU1J0aGxTOGJMOUMvaHh2M1l3VktNZjgxSkpJUWhl?=
 =?utf-8?B?VGxrSnJhejFPb0VkUXNEUHN3aVJQNEJSRnBIMy9XL2ExSjlmNXMxWnBCUEpD?=
 =?utf-8?B?eGF3L3V4M1RWZkMrOVZ3d1FyaFkxZVlUZm9rMUROcHJaZ2txU0pMV3BQVS9L?=
 =?utf-8?B?VzI4NVR4dnYxeTBvRjBpWHErNEUwS2JDeG5FUjlBN0lyVjlNRExhTk5iUi85?=
 =?utf-8?B?SkVUZHJsNWhhNjQ0eFN1ejVpQlFDL3VCS1NxTU1lVHc1U1NPamFiVXZwa1R1?=
 =?utf-8?B?dmZtWlVEeDZqZHlyeVNzSVpjc1VGcWdpbFB0bm1xZnJXUzR6d3NoY054Y1pZ?=
 =?utf-8?B?QU9Pc3JzYW5ONXlOZjA0WTgvbTU3eDd1MEFFWTd2TGtrdTBOT0ZmM0V4U0pq?=
 =?utf-8?B?OHhnakFZQnpRbWxwbEg4VCtHOTQvRXFPKzJFY3JZb0ViN2J4ZTZTN3NGMVIz?=
 =?utf-8?B?c1hCREtXWndHbWo2cERBQVRVVHVZKzVEZnBoVkxONG54N0VzSGRWdGtEdWY3?=
 =?utf-8?B?aFRSdUhTTk1NOGhFQmFzZTgyRkpVN2srNmI2NlAvMnA3STVpY1NndzNyV0o1?=
 =?utf-8?B?ZUFXYkI1a09La1labTdlSWVpQlJTbmlYMHhQMUgyMTRzRUZYZ1lQTlJnb3Fo?=
 =?utf-8?B?V3J5bVlHUDJ5TlJaTzlISjYzNW1jeEZnbllHeUd1Nis1d0EvMDNaS3dUc21o?=
 =?utf-8?B?VXJ5aUV1WjVoZk1rRTlUOWZ1dkFQR3JiQnVxTk5lb3Nlcy9lNEpVdVNKUlAy?=
 =?utf-8?B?d1JPa0ZwSDdMTm5QeGcxZmFSeUJFZkp5amlZNnlLZW9PdnM0bExwRU10UlhT?=
 =?utf-8?B?VUM2V2Z3SGU0WmNwRmFDRCtiRHNnQTFreUNLT3N4TlZPMWdUZWo1UDhhWmR3?=
 =?utf-8?B?SWtyTHRiSGRYbSsxY0hjWWMzRGZZZDFwRG9yRXVFV0NCTGdUYTFMYnIwRCty?=
 =?utf-8?B?bjM3azRCQ0ZxS1dVZmwxQVVzM0JDZUdPR2MrV3J2MVRlOGxmNUtiaWtHTHd1?=
 =?utf-8?B?MlJDZDFGSzZ4KzAweGpWanMrRVp2UnRsejZJc2dvZE0rTTErcUx3ZFdVL1lH?=
 =?utf-8?B?YXFpZzhsbGNpZkdkeXBaNGQwd0dQSjRFUy80WDEvK3hlZS9rZWJvQVFYV0ZB?=
 =?utf-8?B?QXFvdTBiZ1pERUJteEtYTDV1WkFVZ3hpVjNZV01FTW4vWUZxNU5melVRdjVk?=
 =?utf-8?B?YWQyOHhGRzhxQnNqSG04VlVpV3ZxaWJSN3lxSU9ZeG12RTYvQU1qdkgveGtX?=
 =?utf-8?B?TTRuNnR3N3ErT0JIYUZhODJJT29EZUJNZm81SjZqb1lUdjNET0dycDUxSkxh?=
 =?utf-8?B?SHRuK01sb3pZNnl1TXVzcmI4VFpqS0dqa3p6NkMwZ3BBR1JMK3JsT2lQTDJk?=
 =?utf-8?Q?lyJpTj/KHO7vRl2FKEtLDUy1U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fae1f28c-370f-4f43-ed72-08dce7a479d5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:21:18.9621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swnc2fyyM7aHrzrIbA/CH5GQ4B84sIdonqkQvpQjP0j2kF6zmJXd8OxRXk8YOBSg/vJOHSTPPFQjNjX2ubt/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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

--------------4UmhcghfBzTf2q6OoYm5lShD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Comments on fails:

  *

    igt@xe_evict@evict-beng-mixed-threads-small:

      o shard-dg2-set2: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html>
        -> DMESG-WARN
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html>

within `xe_guc_sched_done_handler()` -> `handle_sched_done()` -> 
`deregister_exec_queue()`, the assert got triggered:

xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));

This means we have bugs in our queue life cycle. We assumed there was 
already a call to `set_exec_queue_destroyed()` before the 
`deregister_exec_queue()`, but that was not the case here.

Someone working on submission should take a look, but  - this is not 
related to the series under test, nor with SRIOV.


  *

    igt@xe_exec_sip@invalidinstr-walker-enabled:

      o shard-lnl: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html>
        -> FAIL
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html>
        +1 other test fail

The jobs executed during the test were unable to finish in 5 seconds, so 
caused engine reset. This is how this test normally works - in the 
"PASS" example it does the same thing.

However, for some reason, in the new run IGT considered the execution 
too long and failed the case.

This looks to me like a race, with both KMD and IGT having roughly the 
same timeout set. If KMD takes longer in a specific run, the comparison 
on IGT side - and therefore the test - will fail.

Looks like a test issue to me. The test author should take a look. 
Regardless, this has nothing to do with the series under test, nor with 
SRIOV.


  *

    igt@xe_pm_residency@gt-c6-freeze:

      o shard-lnl: PASS
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html>
        -> INCOMPLETE
        <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html>
        +2 other tests incomplete

The machine did not returned after RC6. It's very hard to tell anything 
more. Very likely a hardware issue, but who knows.

One is certain, this has nothing to do with the series under test, nor 
with SRIOV.


-Tomasz


On 08.10.2024 11:20, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Post-migration recovery worker basis (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/138935/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html
>
>
>   CI Bug Log - changes from
>   xe-2019-d6a4624817a46144a4dbc125c9371439edc82295_full ->
>   xe-pw-138935v4_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-138935v4_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-138935v4_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-138935v4_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-small:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html>
>  *
>
>     igt@xe_exec_sip@invalidinstr-walker-enabled:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html>
>         +1 other test fail
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html>
>         +2 other tests incomplete
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-138935v4_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html>
>         (Intel XE#1701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-edp1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +3
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +3
>         other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (Intel XE#2050
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_hdr@static-swap.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2332
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332>)
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-3:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-a-plane-3:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-fail
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +11 other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>)
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms@plane-77:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-180:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html>
>         (Intel XE#2055
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>)
>  *
>
>     igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1
>         other test fail
>  *
>
>     igt@xe_ccs@block-multicopy-inplace:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>  *
>
>     igt@xe_eudebug@vma-ufence:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_eudebug@vma-ufence.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_evict@evict-beng-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_evict@evict-small-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_evict@evict-small-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-cat-error:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html>
>         (Intel XE#1962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962>)
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +1
>         other test skip
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pm@d3hot-basic:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@xe_pm@d3hot-basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@xe_pm@d3hot-basic.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-9/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_wedged@basic-wedged:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_wedged@basic-wedged.html>
>         (Intel XE#2919
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html>
>  *
>
>     igt@kms_cursor_edge_walk@128x128-right-edge:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#2791
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (Intel XE#2958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2957
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         +6 other tests pass
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html>
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html>
>         +1 other test pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html>
>         (Intel XE#2760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html>
>         +1 other test pass
>  *
>
>     igt@xe_create@create-contexts:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_create@create-contexts.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_create@create-contexts.html>
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html>
>  *
>
>     igt@xe_exec_balancer@no-exec-parallel-rebind:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_balancer@no-exec-parallel-rebind.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-rebind.html>
>  *
>
>     igt@xe_exec_compute_mode@once-userptr-invalidate:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html>
>         (Intel XE#2754
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html>
>         +2 other tests pass
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html>
>  *
>
>     igt@xe_vm@large-misaligned-binds-2147483648:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_vm@large-misaligned-binds-2147483648.html>
>         +2 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         (Intel XE#2961
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961>) +1
>         other test timeout
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-2019-d6a4624817a46144a4dbc125c9371439edc82295 ->
>     xe-pw-138935v4
>
> IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2019-d6a4624817a46144a4dbc125c9371439edc82295: 
> d6a4624817a46144a4dbc125c9371439edc82295
> xe-pw-138935v4: 138935v4
>
--------------4UmhcghfBzTf2q6OoYm5lShD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Comments on fails:</p>
    <ul>
      <li>
        <p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
        <ul>
          <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html">DMESG-WARN</a></li>
        </ul>
      </li>
    </ul>
    <p></p>
    <p>within `xe_guc_sched_done_handler()` -&gt; `handle_sched_done()`
      -&gt; `deregister_exec_queue()`, the assert got triggered:</p>
    <p>xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));</p>
    <p>This means we have bugs in our queue life cycle. We assumed there
      was already a call to `set_exec_queue_destroyed()` before the `deregister_exec_queue()`,
      but that was not the case here.</p>
    <p>Someone working on submission should take a look, but&nbsp; - this is
      not related to the series under test, nor with SRIOV.</p>
    <p><br>
    </p>
    <ul>
      <li>
        <p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
        <ul>
          <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a>
            +1 other test fail</li>
        </ul>
      </li>
    </ul>
    <p></p>
    <p>The jobs executed during the test were unable to finish in 5
      seconds, so caused engine reset. This is how this test normally
      works - in the &quot;PASS&quot; example it does the same thing.</p>
    <p>However, for some reason, in the new run IGT considered the
      execution too long and failed the case.</p>
    <p>This looks to me like a race, with both KMD and IGT having
      roughly the same timeout set. If KMD takes longer in a specific
      run, the comparison on IGT side - and therefore the test - will
      fail.</p>
    <p>Looks like a test issue to me. The test author should take a
      look. Regardless, this has nothing to do with the series under
      test, nor with SRIOV.</p>
    <p><br>
    </p>
    <ul>
      <li>
        <p>igt@xe_pm_residency@gt-c6-freeze:</p>
        <ul>
          <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a>
            -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a>
            +2 other tests incomplete</li>
        </ul>
      </li>
    </ul>
    <p>The machine did not returned after RC6. It's very hard to tell
      anything more. Very likely a hardware issue, but who knows.</p>
    <p>One is certain, this has nothing to do with the series under
      test, nor with SRIOV.</p>
    <p><br>
    </p>
    <p>-Tomasz<br>
    </p>
    <p></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08.10.2024 11:20, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172837924152.1202832.18197135408135169579@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Post-migration recovery worker basis (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/138935/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/138935/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2019-d6a4624817a46144a4dbc125c9371439edc82295_full -&gt;
        xe-pw-138935v4_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-138935v4_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-138935v4_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-138935v4_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-freeze:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html" moz-do-not-send="true">INCOMPLETE</a> +2 other tests
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-138935v4_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701" moz-do-not-send="true">Intel XE#1701</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659" moz-do-not-send="true">Intel XE#1659</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send="true">Intel XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050" moz-do-not-send="true">Intel XE#2050</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332" moz-do-not-send="true">Intel XE#2332</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864" moz-do-not-send="true">Intel XE#2864</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr@fbc-psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-no-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-180:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055" moz-do-not-send="true">Intel XE#2055</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488" moz-do-not-send="true">Intel XE#488</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@vma-ufence:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_eudebug@vma-ufence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_evict@evict-beng-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_evict@evict-small-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-cat-error:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962" moz-do-not-send="true">Intel XE#1962</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@xe_pm@d3hot-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@xe_pm@d3hot-basic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-9/igt@xe_pm@s4-basic.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@basic-wedged:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_wedged@basic-wedged.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919" moz-do-not-send="true">Intel XE#2919</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659" moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x256:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791" moz-do-not-send="true">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send="true">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958" moz-do-not-send="true">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957" moz-do-not-send="true">Intel XE#2957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864" moz-do-not-send="true">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760" moz-do-not-send="true">Intel XE#2760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@create-contexts:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_create@create-contexts.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_create@create-contexts.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000" moz-do-not-send="true">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_balancer@no-exec-parallel-rebind.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-rebind.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754" moz-do-not-send="true">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958" moz-do-not-send="true">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html" moz-do-not-send="true">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_vm@large-misaligned-binds-2147483648.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" moz-do-not-send="true">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961" moz-do-not-send="true">Intel XE#2961</a>) +1 other test
              timeout</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2019-d6a4624817a46144a4dbc125c9371439edc82295
          -&gt; xe-pw-138935v4</li>
      </ul>
      <p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2019-d6a4624817a46144a4dbc125c9371439edc82295:
        d6a4624817a46144a4dbc125c9371439edc82295<br>
        xe-pw-138935v4: 138935v4</p>
    </blockquote>
  </body>
</html>

--------------4UmhcghfBzTf2q6OoYm5lShD--
