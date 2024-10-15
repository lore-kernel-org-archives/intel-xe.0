Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0BCD1D89A
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C8D10E5EF;
	Tue, 15 Oct 2024 18:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOnlFI9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EED10E5EE
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729017764; x=1760553764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hvaOYyscUV4Kq6JBJbcncbQYKnzYEILCo8kgvbumBcw=;
 b=gOnlFI9ERZZIRKOxDEfJ/BQmhg9DcMZzf330XxwGfP5LyggZWoj/0XT6
 9beRqE8FRjVSSg3WTOQCkhYdjUSSpGuT+SX65jSCre4kXrclSV1Nl6vVN
 qQ/VCcWlIDGBFPXG+P6xfR8SZ1pry1oM/piI6SCZNbxHvD0oPTfI+xGPb
 pDqRAcK09L+DyHH41sMsHoyS+LUZllQz8D6gr7/OmfQHSI2alGVjdiUOC
 hS3wHAXl2fbR8A84s2sO6UjwSjq0cbQKePOgW6SuHival++mfquEkPoq8
 iidAjPrr8AmIsLDzHIS+SM4Ta9PxtW9eteZYa9qamWYIE7TL2JQ9pxpmw Q==;
X-CSE-ConnectionGUID: iWEslFMcQdCY17e16ZCuEQ==
X-CSE-MsgGUID: cdH8zGaCQASR9yOFBxILJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28530513"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28530513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 11:42:44 -0700
X-CSE-ConnectionGUID: Gaiw+/OPQtiYtF7iCbE0yQ==
X-CSE-MsgGUID: dukrYFwTR2WWvsWQvdh60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77607878"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 11:42:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:42:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:42:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 11:42:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 11:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFOZBZb8Ews5OZFPFPpdVRE1ovaGTOK+TKUj0PchVb59SBI9NCJBGsZpDSOQBgzm3eHnzbj07cJtlJGCIvjd4jus54FNBCPgfAmGLVHfb4ihmziTZMIYMSsbKsPybqz2JbXQAYz3nLGOGLTfqtruN6a3VRzU7guwbzaSkwbkJm6CrbIfUKKwqJkfYKu6G+ReJUaZ3Yv2/GIVfJ2XO/yjv00R9o1N/gUGfMGfinDbftIybNQEFIL7P8aRuMxfkG52+sFbrq3yzv51vTzyGhpE6DQaNlVBdGwSKabdpMAlNNocDQnZn07UrXBIIA64hfbiwX9W3qWUaozG/s90hCje0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFX4tiGFQM9UJW1YURaZ7LHWUTZ7AX2fOdTUK/G3vLE=;
 b=KhFFgavBatHUeIhqSItjFxt4Mk23LRvOzJwiyfnTlsS8Qjf7vA1sf4vNJY9SvhKbXOTcYMg/4umJ1UyRAiogjeTq31t9FRAjkUIbQmCae6PeolOYbc0rvJC8hRdTFAzgEDbzSP/EV1oeYlt09PJ7+zYK/cw7oww1BXAHsiO40yykLBVaWzC/ml8/NkH0NlGmbCvtZxLvPjMDPmM73OhzxWneroOKB/JND7UWs7ZQm7j5TD+XP2j1XUV0XQK1/88TjUEvf668Tr3fH6NUT78IDGinL15G7vM44No00oPnu5/gyRMn1CcmwPotZ7dE4gW4+vgUyVkJR2UPzlHxroAvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 18:42:40 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 18:42:39 +0000
Message-ID: <dbead11d-87c9-4386-ab94-a631a32cc52a@intel.com>
Date: Wed, 16 Oct 2024 00:12:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/26] drm/xe/huc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 371f9f6c-afb3-42d3-e0f6-08dced49255e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ay9VWm5JZTlaajkyWTV6SUdFR2RDdU1YS3BzUSsxdkFiTG5iUXBFdmduVUlN?=
 =?utf-8?B?cnluR3d4cWFrMThqYVdTTCs1Mlgwa2lkZ2J6MUZHWG1BQjl1WUxra3VWaWQ0?=
 =?utf-8?B?NjNMTlBiNUszM05jaktSV3RWaFpGVHpOVzNhZktNVm9vLzM2Sll0Ym1kMis0?=
 =?utf-8?B?di9GbTR1SVczNUNURW1SMWQweG0xRFptbThhQ0J6bmsrbG1uYVFUL0NDaWx3?=
 =?utf-8?B?VDRKdnNNTEtJYTh1cFVsbzJyRGt0ajVGTExXcUFMeFFLNTFpVmEybGJTcjVu?=
 =?utf-8?B?ZHY2SGxNdnBOZWZ4YmQwcEFmWWduRjJHSUp1QzZhMzRSYnVXLzBad3psWGEr?=
 =?utf-8?B?LzNCUm5wUnphT3Qzd3c5cHhaMmJLNHJVZVBZMUQ3clVKd3JGWlMyYlk2MUkw?=
 =?utf-8?B?OXkvdWFMMDRWY3JSaFUvWENZb2FsSFYxK0RCK1lmaVFrelFGQjBiaHNLd2Vz?=
 =?utf-8?B?bWoyM1lpeFhxb253RDJhNmxLc1BSaEFtSEFvTDI3V2NMSUVZMzVvNlQvYkFp?=
 =?utf-8?B?YklnL0lVY2lPZlI2RnliQXpsd2N6MzR4K0Fub1ZxUmJXOUhxY0FhQStwRXp6?=
 =?utf-8?B?QVVmR3BpcXJrV3poMlZLeksrNVNXL0ZpUlJzK0p0NVZoL3hkY0dkVEM3M3FM?=
 =?utf-8?B?TFBzNkd3VnByakpoUnJEVzZEM0FpOS9xSHBmbHRXVUJmVGxZNGtiNzFIMEty?=
 =?utf-8?B?ZDRtT0ExaHVLTE1OVXRVS2FQeUo4ZThxYnZqb3NKWW1SU3ZMaTA5ZUlzMFZR?=
 =?utf-8?B?dGVBVkM1YndVVjdud1FHNFhkS1UvZi9WemRnNlZQcER4U2pFYXRyb1ZSSFpR?=
 =?utf-8?B?ZmpTQXdrbVJ1WEg0UmJoRmloR1Y1RHVrR0N5UHB0YkJEZnBBSWw3U01hcjVo?=
 =?utf-8?B?alUzbkJyVUoyODJVYXVaNE4zc2JSMnZaUkxvN0ZEWGJBTS9VTGJOYXFuQW1n?=
 =?utf-8?B?aXRiY1RFVWFKS2p3VkdsK05NMERoZ0NuRU43eERLMWE2eDlVV2cwNG9kTmo3?=
 =?utf-8?B?NndpUkRJNkpzTmpDTTRydkcrbmFlT1VlN0F5c3FrWXduK0hvd1NGcG9IYWN2?=
 =?utf-8?B?SE9lU053VWx1dzhlMkhhRlFYMXpLMEVGaU1tOHl5aDQ1b2JnQXBtOGZiSDht?=
 =?utf-8?B?MWcvTTVFSW5jTmpSQzNQajlQV2tUQUJJc0E1OHIyTGNma2V4bGlkdEdBYkZQ?=
 =?utf-8?B?d0hFS0dTSHJTUUhOUy9BV1pBejdXR05JS2F3RHNtT2dmSExQU1N4MzdTTUky?=
 =?utf-8?B?YWJPUmw4UU9FV3RTc056QjVzaXpScjE2T3dIUHNva1JVU3RSbEVXcVYvNVVL?=
 =?utf-8?B?ZnlYM3FLcEpGamw1eWZqZXpndm1FbWVYQTA2VGd3YzlicmFRR2VBL09WUFVX?=
 =?utf-8?B?UHY3dkQvc1hjSkhEcDdvUmxRNTMzMXdvcVcwS3gzYWNvdzU4VVpLUlphd0Ns?=
 =?utf-8?B?eDNnWlJzbzR3YVBZenJ4S1RQZGpOemdqSFY5cE5mckFoaHRjbFUxOHRCWnlt?=
 =?utf-8?B?RHhQSjNCVnRiZjRRQnNEbzBzWW8zYjhhVHpBN3JIRlMxLzBadi9IdEhZdWVS?=
 =?utf-8?B?TGxQMk1wMFZIckh0MTlrVnhkZFhlQ0VneXBISHpQb0hBTGRTSGRoSGU5ZTBl?=
 =?utf-8?B?YkVCNUM0MTBzY01LdDh0QXc5cEVZZUl4WXVaUFhEK0dVTHRWNTUzSElXalBP?=
 =?utf-8?B?SlQ3NExvLzdjTVhxd3cvV3dPdHBQTjIvUFlPN3JFYTg5cFhkclBrTFhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZrWHYzNkFjWjFIWS9NSzJ2VVlQSFR3NXdSaUI3ampIUVprcm1Ub1o3Sm5r?=
 =?utf-8?B?S2NuRkY2WngvZXo2L2wxVlZjQkEyaFN5VWppblNMV0V5LzFjZFFjRU5PTjZY?=
 =?utf-8?B?WWZoUldoanU0OElOZEJtRFYxTTM0clZNZkQ1aThMZklPZHY3VzljbGl4QU5C?=
 =?utf-8?B?MWFkSWlnemdCV055SGFHdzBqd2sxRWptSWdNdno0R0IvRFM1YVdjdUlydG16?=
 =?utf-8?B?dFNpMmhlMFhuRlZhYkRKNnZtMWlPanBnZVlpblNwKzB4ZDBKeXZSWDdDRk96?=
 =?utf-8?B?cS9GcEhjQ09lT0Uvdm9lNVRzT2FvRmZRNlhZSXJ5VUl0V0JmRnBBOEJZdndt?=
 =?utf-8?B?ZG44dnJRNE4zR3pzVm5rUGlZMXdZYXdtRTdjQk9DWW9sekVIMHhnRmFaRWF0?=
 =?utf-8?B?RmV1ajltZzZCeGwzbTNxN3l4Vit4V0dQUXNUaEpyUnpHOXg1ak5EcktwMlNj?=
 =?utf-8?B?NGVtdEN4amw2eUpDdzBJbEZoS1ZsNWFTQytnU0dZSDNpS2lwTnlSRkxqVzBo?=
 =?utf-8?B?SUZnSXI5eE5xc2VJY3NzQlZDdkRKTjVKWlhXbUR5dHFkcmJzc2FOWTc5MXh5?=
 =?utf-8?B?YkJlci9ONERYUjJMaGZNcUx5cm9Hb1RXRCtKYjY5ZEZ0VWxKL3NjZWsrSVpt?=
 =?utf-8?B?d3VlYmNBMUZQQ2tObUtDKzVQT3lLWTczVXdvek5XdDZGVlZncXo2NEJsd1gr?=
 =?utf-8?B?TlNIM1lEaTlWWnkxVWtJZ1gwNUsvOWdydmQzWWlSZEdoeEVzTkZCeTAwUWhB?=
 =?utf-8?B?Uyt3Y0d5VWtvME8wcDJNZU4xUU1Lenppb3RnK01lUEU2NU1IekZZRmpPeUpZ?=
 =?utf-8?B?eFNaZkJIUzgwZXBKSEthNWg0UUNlbjR5NGFoajNWaVBsQzlKWVRZTjY5ZGQz?=
 =?utf-8?B?QnZPU3JEaVVLTTZMUHlVZVFRWXpSZWxYMCs4ZTgwZzg3Rkl1R1lmVlMxbUs4?=
 =?utf-8?B?cXFwd0g3d0dHRVJPYzVPVDFYWGdYRTQ3VDdWd0d2RjlTUGgrcUl6bTd5OGFy?=
 =?utf-8?B?NkRrNXduNThIdXYrWWZ4bEtjRW4wZGcrcnM4SFBFVm1hclpZWGdOclQ3aStC?=
 =?utf-8?B?T0J3RkdvTmNndUQ5Y3dEUUZuRFAxck1jbHlxOHM3UVhXZUdlNkhCTG81Y2N5?=
 =?utf-8?B?S3hpUTZ3U2VkT2RNekdKRGhZYWpLbGpzckNJR09PaUFkazhIN0dVRWoycGw2?=
 =?utf-8?B?U084elg4S1N3eTVtUmZocFVyRTRQcURBRjc3VjArM1NFQnRuVm1STXA3UXl0?=
 =?utf-8?B?U2tSZ1N1WkZLZGJWd1NIV1ZlNmlCaFdBWDZxaEoxMzUvb3VZaVVUaE0zcW5X?=
 =?utf-8?B?K2xmY3E4T2IvT3BSQTJmVXp5Mi93cmtWUTZBOU5QTm9uSHpTOWtwQ3F2WHE4?=
 =?utf-8?B?VlB5TEE0b1kwUy8vR1kydk5RdVNQeVJEakpEc1dVM2FGekROQW5KSDdYZWlk?=
 =?utf-8?B?YlhobmwvSDBQaldPRml3QmZvRER3cHltQStBNGRmVEJTSEVZR1I5Qk5QK0xZ?=
 =?utf-8?B?M0hjV0dJbEFFc3dWTWVvZ0dFNWxCb1BnaUFxNW1KcERYekNmZUo1c2lKenV3?=
 =?utf-8?B?cFBUWCswWFBNL0JNOHVjZmV3bE9sOHdHNlk1d2MwS1Nyd2VPRi96WDZUN0Jz?=
 =?utf-8?B?ZnBVRmNweVJzVlJkUm8xd0crZW9OdkVIT1gvMnVGUnJXbkJvRTdxZVpocjlM?=
 =?utf-8?B?QzY2bitkQko2a0xBOUJucGFPejR0ZEc5MEF2SjlFM2FZUGNHNmJkcG9qNXVk?=
 =?utf-8?B?Yk9jK0NSREgxKzlYT2xuT080QUNSRnRONTN2QXJubFdMU2xJYmd0VytEQW51?=
 =?utf-8?B?Tk9ia0lkVUt3V3E5dDRBRDlrcXdwSkdhSHplME9qVzB6cGZTbmwrRDZqN2x6?=
 =?utf-8?B?WU5LOTJzbXFkTGVYV1cwWFRSZlVMSGk1ZU5WRE5IcnErQW9peTk3U3BUMzQw?=
 =?utf-8?B?eW53VWhodWYrTzVLNDFTKy9tdGZBa3BJMkxWR0xXMnBRWTIwYWtNYWRRNkdJ?=
 =?utf-8?B?YXNyNWlOQnViTnNYOWh6eHhWemxjM2t0NFB5d1V2Yis5QUpOblc1RUcvMGxt?=
 =?utf-8?B?QnJjang2b0JJZXZzTDdjVVZwZVZNYmwvMGRIM3IwVXRFR0EwOW5xZzZvUCtF?=
 =?utf-8?B?bVZUd2NaaEt3dEkxYWI4eXlSaXAyN1BMOVQvbHhBRXBRaEdOb0lZSE5UL01Z?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371f9f6c-afb3-42d3-e0f6-08dced49255e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:42:39.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DBUHym/y/UDdVQEb3c+VMKO1PNMPm/i/Fa8kPJ8n6pxSwFETHPZICEJbDyBuJSRpH6RvSmzYmXV4zKdLfhZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v7
> - Fix commit message
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> ---
>   drivers/gpu/drm/xe/xe_huc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 77c5830309cf..6a846e4cb221 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,19 +296,19 @@ void xe_huc_sanitize(struct xe_huc *huc)
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> -	int err;
> +	unsigned int fw_ref;
>   
>   	xe_uc_fw_print(&huc->fw, p);
>   
>   	if (!xe_uc_fw_is_enabled(&huc->fw))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	drm_printf(p, "\nHuC status: 0x%08x\n",
>   		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }

