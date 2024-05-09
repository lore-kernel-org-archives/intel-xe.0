Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71FCC25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6E10F0A5;
	Thu,  9 May 2024 19:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1wnWO39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDBA10F0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282228; x=1746818228;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Drm4l+0byfwwOlGHLMl27KlmssCa8yuFrhbksQC2kXQ=;
 b=V1wnWO39mkNU49IMR4EFJBKBV/Ff2U6vjtyjIt21pLLxmARTV+PF/14U
 Bi33q4yzbasGg2b+xXOTsF9/yXSTdcfBzgcCuIudMo0UNSmb6pnjaKR+N
 n72bT/oGLK1BjV+Lkiv0JbNXTE53S4s9Eag5ZBJ2mB6BUnYOVB/rs9lQt
 EqHrYFuXqVSiGUgsZJfSDNapAqen8NlZqDuxqVTyZyohGqNrc1pZ5Blhe
 taY6oQm3NdzKaeI9O9sGE8hF8BvKuBaiwbMf3Skwd52ceWVYFUx9D3rBB
 0dImIARnAIb4zVQ6Kj+wwsZIP0SQXPGbwvYfE5yfPQNRoetIT3EJov3fn Q==;
X-CSE-ConnectionGUID: ktP/Ivg2QAC50RIlOgvZpg==
X-CSE-MsgGUID: R5AGKkvgQ4e9k7z/6cP+zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038455"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:06 -0700
X-CSE-ConnectionGUID: GbdljvqETXmqubsIDXJ9og==
X-CSE-MsgGUID: obTaGtTYSFKbREHY8+A3hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879275"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzJt3bfbdws4gn13YnbQ8fjHK7JzCF3Fqm2NfFHocMqw0m5v6+kh7S2pd/8qEzR/94PWaO+Bkkyu0fY6wRNBLgQcGsiwlCafaON8CMRMMHTeXafIq13vHvwawVfqKYHzoSdlYZCi6bhxbB3U+m2S+OdFbic0HwcKDCHij70eqghfMNHis4iucwS5Hzktd2PWEkRWtsRWALuclCU2267HJylu3cnGDc6t+GOjsRojzZ27mJ0kWJ7ZV3sC6xQiNXWjIgXVA0C845EGEMhURczgGSUunUyRriTYUePPxB4I2qBzvuP0MKiVCnuMnRhl86A+ZUBO2tVLPE9o/YxLzHUveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvwU3B4Rqmc6bBUgXDAqHKR1i8R5K9IZWqZckrph7Ec=;
 b=htOIl3oV4AqpRN4AZ4qaz0JpnUH19xXG2w1JpbPZ+R/A5nF7AXSzbObl4S2oJsGLT9ruT7ZFjR1mLjbDbS5EhtF8Q/zpq35XWOjsYBJ+oc5RA5vyBdkcr7QyoiGamrvyJI01ziYdo750kiMXwn2YRQf8+bhLu7NGy8pJopu/kz+Luc/TUNnF4LWRl8Xv0cYDKvf0AjNXN2iG+46kXK6VCHD6l0svEn6CMeZbFz1yxqXpv670qcxel9nTPwufmqYRxnxeAwftvL1kCWXalF/Nj5Eet6YDQfJdkq6UuuQZoYPfqrDAC7VoOhZHaa7JxxRmRqd37T7i3ggT0JCbRvpX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
Date: Thu, 9 May 2024 15:16:51 -0400
Message-ID: <20240509191657.504300-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:302:1::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: e297088d-f47a-407f-4f85-08dc705c9a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjBFNXR0R3R4MnVKQjVpdUtYMW1jNnJZTnJIUnNPNWFrdDJvYTZmdVovQzlT?=
 =?utf-8?B?OWRaTWFIVHZFWDllSWxEaW0rRHhyQXMzUjl4dHJBK3lkR1krb2dlMFlPckNn?=
 =?utf-8?B?QVo5dDVxZmFpclZXQnZBM0FVaDVDTWpWeEpQTDVyUmRmMU9UNXRScFEyZEZO?=
 =?utf-8?B?UXhwb3F3SXRMUlF4ckZ5RlRlS016MVNLd2pEQXRFTUNZUjVvaEErUzJocGxV?=
 =?utf-8?B?SVVVK3h2dXhtTmJscXdtU1NJb2VqZ2tRbXVoMzlLaWFNMWYzMGp0YmpHcEgz?=
 =?utf-8?B?R1RzSHdzMXFqcGtyWTZmQ0pCNFVzQURxSzJYWFlHaUVCUnAyaXJDT3pManV1?=
 =?utf-8?B?ME5kZENDbFcwTVZGMzdQWEtQUlU5WElDN0c2bHB0a3Z0dktSaE1XY2JZcm5U?=
 =?utf-8?B?WHdrZEJlQU1iaitLa015TzZXbzg5ZjFYWUdpc0hOcTZLZUxNMDR0L1pzQzJK?=
 =?utf-8?B?WWNPcHdkRlhmY0pIK212NWZEV2pMU0piQ2orL0hML08rYlhYQ2IwLzZhYWdG?=
 =?utf-8?B?SVhWY0JRc1Ara0NHempHclFIUjYwQ0RNMmNiUTdPTEpGNkw3aXEwYVNibzJY?=
 =?utf-8?B?SmRmV21ZSGhuelR6UEdLYXNaUFQ3VEM4elp6YmVqcW5LUUl5MFh1K0hnSjJE?=
 =?utf-8?B?Wjk3R050a3p1ZlZRelpVY1lwemc1TDFBYSs2cFRiZ3g4NGdlZHRCTjA1T3FI?=
 =?utf-8?B?Q050MWhoZFRPSmVZbDZWdXc0V3lTVFJxZFhMeEEvQytWeW9NL211MXhNYXhL?=
 =?utf-8?B?aEFRdzhtYWtTRHY2L0ZKMnBPdnBITlpXaFNXS3RWNGJMckg5YkdwcHV4WXZs?=
 =?utf-8?B?THZ1aXlRUTE4VytXenUxQmxUc0hXTUFzZUlpNTVtdFhzQ1Q1VTEyRzM5Kzkz?=
 =?utf-8?B?YWM3UEpTb2JNcFh5WWJveFhSQlZReVl2UmlycTJmSUZEYzhFU3NpbHE0R29z?=
 =?utf-8?B?VHhOQW5PQlR4OVJFSjk1a1BCcEFLSnZMY0p1U1A4bk5aL1F0VWhVbU0yUjZ6?=
 =?utf-8?B?SjRkT05KN3l4Qk9mQjFPQVFrblhaRGM3eGo0Wm90cGw2MS9oeWhPWkx2eUJK?=
 =?utf-8?B?M2d4UmEybGFqWUllSzNQQjdDdmlGZjQwVm5yaHdYaHVDVUxkaE53WUhRamJS?=
 =?utf-8?B?NUJ6MkRTcno2U3FrRHBJL1NDSWpRTnFaUk1tNXQreVZQaFg0T1JicWVIUE1C?=
 =?utf-8?B?NVM2dDFXZmhzVFJrcHVnMmY1Y1J0ODNPbytFWkh6eDdMTnBUU1BCMnZyZW1L?=
 =?utf-8?B?cklVQW9lSm1ZczZUV1UzV245TEFhMC9qRFk5aWFWak1qSlFjVGR2cmdmRWVQ?=
 =?utf-8?B?Nks3Ulh6N2l1Uk1JS24rVFdXOExJaVdJOU1MY1I4cnJKbXJZVmdHbTZlNkhU?=
 =?utf-8?B?dVRrQ25BTkhzZnM1UWdvYzlYK0l2TkRBaGp4eTdNZ3BHNzQxNjRPYVRPNG4x?=
 =?utf-8?B?cmNXL3hnNThuYTd0dW1DYXFyY29PczBGTWNVZGdQOG9OMHo1akNWempUN2xC?=
 =?utf-8?B?NjBqVUViZHA3M2Z2Q2FhU2pUUzBTWnZsOXlnVWcxdE9uUkZMQ3UvRFU5Q2JK?=
 =?utf-8?B?OEtyK0kxNTk0aHNNRk5iSkVqcVdxSGYvTlhpaFFoalRLbzFVRlRUVEJ2Q3JV?=
 =?utf-8?B?Ymh2MTdJeDNDaFZRYXNHOHJWY1lMeFRSdkxidEFhejIzTGZqRXZFelFTc3Nk?=
 =?utf-8?B?S1pFUWJqQmc3cktIWkxacm1YYWpxUkljMkx3clJCYUFEZndacEE5d2N3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NUUC9ueVh1clc4R1RMcU9XV09VMS9TbVkvTlZBNit5WWlzQnpKYU9XcGJz?=
 =?utf-8?B?ODBRQXV1ZktsZktEczRMRkt0RG54OVdRRm5GWVhjL0JsWkNJK1lIQmoxNFFJ?=
 =?utf-8?B?a0wvaDdLYWxFS240Nm1FcmZEcUxWQ0dqa1pRVUdoem1zUVEzWXg2QUJyNklw?=
 =?utf-8?B?NnFLOWtWRzQxa1hOckw3cWEvbW53OStEbDlRSVc0MGhNd25qT0xxcEVHVXEz?=
 =?utf-8?B?S2NYSFJoSUE2WU5NQjkzUkU2WVdsaXozYlMzQkVuYjBwVTREdFY2ZC9saU93?=
 =?utf-8?B?aFl0UC9VWWtlWmtpbHNjdE5EUDVaZDVhelpUZTNScTNLdkhRZE0ycjRtRW95?=
 =?utf-8?B?M2pmUk80UGFmb2hBdk1QU25mNXprMzhsS1pLTjZSOG41RkJHM2p0Vk1uUzZQ?=
 =?utf-8?B?M3JWWmF0T3ZrNGVuTHcrRzhhTzkxOSsySGhmSUNZb0J2L3NFTGxGTklOMFI2?=
 =?utf-8?B?T3p6RFBKOERjNFdoazJiWENnYzk0NXZ2U1Yxc25ha0tsSXdTYzYvY3hxU2lZ?=
 =?utf-8?B?RTdZQzRxaUpDSlU0dG1uMmRMeWJvY3p6WXhmME5TQ0wyaEhjT0lKemkrS1Iy?=
 =?utf-8?B?UElnYVlTZUtsZm5IZkk2ZXN2bERXTlp1cUJ4YXhzbjhxMUc1TjBlY1ZKeUVn?=
 =?utf-8?B?NEI5azdmZCt4UWJNMjZZRmc4T3VOZEs2ODhKZ21iTjRwWXE0TllhdDhwSGpS?=
 =?utf-8?B?dDdVeG5RVjFrR0VYNzRac1JVaWJMYVpPdDRZZU5DSHdoa1RLOHhUR0N0WEZ3?=
 =?utf-8?B?cU5lKzdrQVdKWVBxdmpqUFdzVkplU0NLS2hHRHBNaVQyeDRyUFRFdXIyalZp?=
 =?utf-8?B?RGNQVDhGUkJjYXBlZyszZWFLcy9JeHZSUnlySk1TaWJrQU90QllqZDV2K2xR?=
 =?utf-8?B?aWduTjFlZ1ZLY2x1Y2g0TkpQdWZHbUFYbFJTWkNHQWtOaFY4NWw1a3JhRExy?=
 =?utf-8?B?cElwY3lucDFuK3htVmdPVE9BWDZzWFFPaC9QbG5RM3phNmVYSVdzcGkzekpj?=
 =?utf-8?B?K0gxbGJtZzR0d09XREoxWTFwWGV1TzF2N0hZaTJCZ3RpeVBPdHhYblRzbVZB?=
 =?utf-8?B?QlJUQjFwbkFWRE8vNG55cWRtd2xTNzlKSEYrMzBub2R5RnJCQUo3MlVSOG8w?=
 =?utf-8?B?b0pKNytTY01MN2dWRHloL0MwbE5nYTZwengzWldVRVpCczlnMTZrcGwzSnU5?=
 =?utf-8?B?NXFDL1ZReE40SkxhelhlVUI0c3AvVHYvOGJhZERBVW1EcGhBbkZjdFhZLytT?=
 =?utf-8?B?bFRGNFlpY3VCbk1rTmQvWjljRXdBT0ZJRy9hSFVkMVo3OCtFa2E0MkttQ2lE?=
 =?utf-8?B?c0p1Zkk1NkVjKzhHU3FmTEYrNGtMdkgzR0tlc08wemVkekJKMDJ5d2cvUStq?=
 =?utf-8?B?ekF1bVNVekUxTjJZa2s5dXpSV1VhUEIvZWYrNWl4VWF3WkF6akRIZzJCRFQ2?=
 =?utf-8?B?cWpSQnF2L1hYTzh6RXhrblJ5amRjRVM2Q2tkNllEZXkrOGt0d2RYamJhbWxi?=
 =?utf-8?B?T0dZV2tFNDJVK3J3b3lneEo3OXZOK3dtTnRYV211L3hCZkd5ajk4YmpOVGlk?=
 =?utf-8?B?R0VlSUJiNUFJVlVsY2F2NFp6RTRQeGNKMW1WNlFpNDlPUTE5V3VJeFJyaDZR?=
 =?utf-8?B?a3JQcHU5SVlYWkE5WVNSWjBxR3IzT0xIR3d5OVhycWJSSlowYUt2cUc0bEti?=
 =?utf-8?B?ZkluSXI4d25VRnM5a1ZjTVA2dWI0SDk0SUJXaTBwb3V3OEtSREowMU1lZU1t?=
 =?utf-8?B?VzN2VUtOOEg4Z2RLTE10eVJ6MU5tSUNndVYwc0NJOGFyTzd4SUN4OXJoZHZF?=
 =?utf-8?B?YUNoMFdmNktYYWMvSTk3N0xGaVhVWTZ0MU84MStxblpnbEc3OHgrN1VmZnQ5?=
 =?utf-8?B?TGRuTzVIMFdJaWMwQVIzbFlRdFJPOVpubmNscXVFMHNxVUxJQkJPVTZpVkQ5?=
 =?utf-8?B?TXZXd0R6eERtcm1JUU1QNzlYNkVqeWxHSGt6VjEvRjZYa1RWY1Y4ZENFWmV4?=
 =?utf-8?B?SzZRR3Z3d2dHYXFaRHU5VGpzKy9Ta3FRR3lrclo1Ukx3YXkzQnQxempQOG9a?=
 =?utf-8?B?YXhMTXdYM1JDQmM2ZUhPT1RoNzVObHl0bUpNSTNRaS9NQ3lVTjNNb3plK2l2?=
 =?utf-8?B?Qis5SHZNemh4L1FHU0UzbG1yYzRrZWErQU5vc2dHVDBxdnZhZElsWmtHSHFN?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e297088d-f47a-407f-4f85-08dc705c9a7d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:01.2943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvYXzMCFwSc6DiGZt7Q/+OzEkPHIPSn3Q2TZsLXQmpYLofp741i9fOxw+j2T1DkV3jho3Cs+BBI1kc8i/eevHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

Current callers of this function are already taking the result
to a boolean and using in an if. It might be a problem because
current function might return negative error codes on failure,
without increasing the reference counter.

In this scenario we could end up with extra 'put' call ending
in unbalanced scenarios.

Let's fix it, while aligning with the current xe_pm_get_if_in_use
style.

Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_pm.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c1831106ea4b..d14741f35cc4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
  *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
+ * Return: True if device is awake (regardless the previous number of references)
+ * and a new reference was taken, false otherwise.
  */
-int xe_pm_runtime_get_if_active(struct xe_device *xe)
+bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	return pm_runtime_get_if_active(xe->drm.dev);
+	return pm_runtime_get_if_active(xe->drm.dev) > 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 18b0613fe57b..f694005db278 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.44.0

