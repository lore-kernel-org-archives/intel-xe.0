Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C8DC83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A50210E9E5;
	Fri,  4 Jul 2025 10:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rox1KKcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005310E9E5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751626130; x=1783162130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fd9GorFKOPpOUodrSRjgimjL+/3ePnLb0yOqBAhJ2OM=;
 b=Rox1KKcg+WDNyMS41otvYN96cRDXZ3Je3RjCv+yxlpbHdmQTOtzaKqhn
 F1TDloiewnqlgmOj1quwu2HUCDdXYto38vFaUz5q5X3LhBwJ/txXjaiMd
 Lu2VVALMSEOrQrUfxwAv7m1o/mmBk6T/xhSzNUbyawBW5BpJzaugCwFJL
 9oFHoG99HHBqSpTRKLEzTgBGlSxie9wFhKkZ182Y1UCTU9YAGOhuzdGDA
 +WpA9lgQ9BGICZVmbEDER/7Y2h0hdF3xWUZ4xgwFMxg66ZpoNBZO/UYGL
 8Yd14EmQfVHNxM1IvhcWIBdm+vKpewDhZjQxbrp9EIvOa9YKRqPZJtYYa Q==;
X-CSE-ConnectionGUID: Wgp3p/Z5TGK9Z2so8lcuKg==
X-CSE-MsgGUID: pz8gU+fxSxOw/sS23HRriA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53832919"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53832919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:48:50 -0700
X-CSE-ConnectionGUID: AKVQhMcUSz21GimIB0uD+w==
X-CSE-MsgGUID: Fc4tqpypQh66gfrWMFmctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="158647850"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:48:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:48:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 03:48:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6m/rJiiqoLbhRASTvwaz61tUotv50lJ+maGs4D479Pbi6gozXLkLHkbJC7fsi8YAkKb/K5mPqWlqlXM4JQIUj3q7IKDtfLZk9zFCVb9nr6cqzzqsK1uBzsqEGV8H3NaqRUiM4nHm1PVz/RptODsI/Sweztg0gdQzldz0oMKwbGFimeTSzyMFozzzLFTVLkb8uHkjaqCnA5ExtmNyn1tCG5Ec8VDf/liKJPerTHWk183DIF35/ijrn87AlV90a21V1SXtlHLGe7wcrUZjwLxRDQYWjVot05Pjot0rLsK9/dltttj93GuLonSqYzoqYedgPhLEIfzwFnX4XgmgM9viA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1SYJr4HButn9GzD1G2xH4XjNcS0tL0gYTuG3wtYS9Y=;
 b=f39LjFef8NIoK/kL4YCJgj75ZUw1fA7QreoEW79QO9OHF8qppcSXcKcAADvIFzSS8P/VX1er3+qh23d+E/b9PrpLD9f1GOTZr2M1fWtns5Diro8dlFUVjbKCNh7YQA0EiJjwo6HlQS2xEqXxM3AVkpupBeXuSTumMYr8zozRxNvXZVgMxQZS4KkTzP69NraGWKFFCswFkJcUo1J+JTO90+jNmr9iZd0x1YAuPKQ2YZqtWkMv5yIqx+jZ7euF+DyAX3wwMhT4zvrt1c7ecnzcEPHuT79HZpyqLbSrenQWeyjkZ7kbUIFIsEedOvxhfhUHjcsO5RXq9Zcz1eUZ0DWk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 10:48:12 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 10:48:12 +0000
Message-ID: <f0421dcb-0bb1-4fa0-8c8a-b515b41f1567@intel.com>
Date: Fri, 4 Jul 2025 16:18:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: Add one additional PCI ID
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <balasubramani.vivekanandan@intel.com>, <Vodapalli@freedesktop.org>
References: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f06358-c043-49e0-a98b-08ddbae845dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2VhZS9qamoxVndpTjVpWm82cnlPeGtObHg2R3NZazlpSldTTVJCb2ZiRGFE?=
 =?utf-8?B?elkyeDBHRmdqTGN3aDNyMkk0TU4venU5ZFVKaDlteFR4bXp5OWJERWpOazMv?=
 =?utf-8?B?c0VzWGlJdE1Eb3JMUkQ5L21NLytjem9qYXNNY0xFWS96MXY4cys5enh0Y2h0?=
 =?utf-8?B?UzVJdFU4KzdQUDUvb1VlbG1PTm1xUnA1YmZyOWxKSkNhT29CeEFvK2VlMHQ2?=
 =?utf-8?B?V2E3R3F2VkFzSktGUVM2eGtpNmJvd2pQR1hUY2hqdzR5cGlmbWxMdkUxVlRi?=
 =?utf-8?B?TTlRQm1ZVWNiUXNiRGIrYXlUSUZMMXZ3ei8rQTQyTGVLNkIrWTZDbzNGS2lX?=
 =?utf-8?B?NFh4SUJaeFhlWmI1MkpCMGs0SGZVQUg1ckRCRXFLWXVwZk1SUmNsNi9PeWhM?=
 =?utf-8?B?SXFNUlJmOWptY1dyeFRXT2VzNTBvR2d1MllYZ3JGbFRweTV3dVdZdnU2YzZn?=
 =?utf-8?B?anh6cVVCTkFjVFVBaDZENk1PZDJQeElza04yRVBHRGRkS2gzUnZURHI5YUgx?=
 =?utf-8?B?OWx5UmNIcDR2WjlaN21SZ2Y3R0FyM2NJdmM4VmdTU3VPdS9LQnpiVFJuekxD?=
 =?utf-8?B?U2lackpDeDZNNUxWM3JiVTRSbzFYSGt0M2pqQ2x0N1NGYm9sckdpbC93MVpo?=
 =?utf-8?B?NkRYTldDaGZMeW9raDI3bVBkK3BlWmwvWU9JUkZrMUpkZ0NyaXZ3UkFxTlYw?=
 =?utf-8?B?Mm1vTk5WQ3JycGZlczVaQlFUZXBzTHM5MFBMeWcwWFo5WXowUWZnWnFVTXhh?=
 =?utf-8?B?OEtOdHpvNFo4M2poU3FxNHFKNjhTMEJhR2hlOFZ6VnZ5MVUzZlZ6NXhUTC9B?=
 =?utf-8?B?S3g0aUlSdVJuaUx1SUdiMEUyNlgrMXI2V3FGdVJYODlQWmFDbWNIVnNXNXNM?=
 =?utf-8?B?TmxhT1dlMDROQXZMaGxabGo5ZmRFZm5uRlZ1bHhHdjF0UE1uVno4amtnOWZY?=
 =?utf-8?B?a2ROWW1XdzVmVU5Ca1YyM1FaNE5VR3FFYnltWSs4YlBZamZEYmI1aWh0ZHA4?=
 =?utf-8?B?R0tLbjNkdk9QSHFMclBBZlZsZGd2QThRczlQT2tLN282RXJ5WStRVFJzN3M4?=
 =?utf-8?B?aGtkdjBSU29NRmVGbFFiVXJPdmhtakJZa293UWd5SUlPVVp5L1Q0OHZRaHYy?=
 =?utf-8?B?aDFXRnpFRVdpS0pPc3YrOXdlYmt4SkNFUEZHem9mN0FCNmJ0OTJsck00ZUQw?=
 =?utf-8?B?NS95cmxnRXFpSGxhdDk3WXl5YUIxV0JuYldENVNHYjhIaE15dEJvM3A4Q3U1?=
 =?utf-8?B?MTBvQk4xOW1jSjZwNDJweG9PTS9SSXFINVFRZHVuM0k5bWdPNVNKMlBlL2xV?=
 =?utf-8?B?Yy9DSTdMeGsxMVBORUxVbU9DY0gzT1puRWdpYTA5dU1GL0g4U212NkJ0SjNz?=
 =?utf-8?B?ZTMyV3ZQMjc0eDZDcWEycC9TNkxjeEdpVlBqS2c5MkhwM1V4UXM0cDZBMG1Z?=
 =?utf-8?B?Vm5KeHZaeWhLK0xMRVFWYSsyQ2RqM3JHTjNtOEJpWmlPY0dURjROZzF3Z0xz?=
 =?utf-8?B?SjRYNkVFUVEwNzRtMHViQ2FzOXU2N0w2bG80dDNXZW1aMnB0cmh3Y0xBdlUx?=
 =?utf-8?B?NmtLVDlraitPeHpPSEI1VE1iOGhkRE5Oa3VtZ0pKREd1U1IwZVlPd0RkMzd1?=
 =?utf-8?B?UGZqVDFyY0xhV3U3aHJHZjZkamwxZHpGSU1aRUlkejMrcjRjYzhLMXRuNTlj?=
 =?utf-8?B?MXBCTlBxd1NNM1J5cWVXVDRMcHN5aGpOenpuczZUMGFwRGJzdnZuSDd6Z1J6?=
 =?utf-8?B?MlgxSG1lb3dheXJOeDNPNTFZbDFwVERaamJkWTBmN0IvMHhFVjArMjY1clFB?=
 =?utf-8?B?TGZjbWVCNVFkUlN6NkdzSVo1YVNva0x2cWVvYVNPUEIvTWU0Y1VUQlFnWTlu?=
 =?utf-8?B?alJjRmw3R0JveUpoNFpVZjE5b0JHencvUzVYZVZlVnpwbUxPc00wMVRSVjI5?=
 =?utf-8?Q?djNOi6Pc8MU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BTVUFXbnIvRGJxZUZDamRKUWZmOWovS2MwcFF4ZGZheU56SVlGNkpxMWJ5?=
 =?utf-8?B?ZTQ2cDB5WGp4cVljTkVFOHBqVnlVZ2FpWElOa1pFNDRHTFJkWjMxbUJrY3VN?=
 =?utf-8?B?cUdhS1pjMm95ZFlDallGc3c2K1FNeExlVWpJcmliN3dvMHZwQ0tjeTRzUUF5?=
 =?utf-8?B?VnFOTitjaWl6cUlmVnpSL3d6MDNDdWl0dXFGSWN2cit0djdHYStUTkIveWRM?=
 =?utf-8?B?eHFRa09oZDRhMDJ4U013bjdIWGl6Vm0xa2hNL2YzdTJ0NS92VHZrNndUajNK?=
 =?utf-8?B?WS9OV3VIeU14VHFlcHMvRjJOQUhVakplU1dwaDl1VkxhVERqK2tPVThEeXRO?=
 =?utf-8?B?THFxdjhGTHV0YU9SaWVaTUV1MnRkVHRwSVBtc3ZJengwcXNiSWtZVllrWWN1?=
 =?utf-8?B?UEowRERtTHFacFBCWU5QU1QvenRuVnJ6alZWbGh1Vm1ydmhHWFN0Nk0xRXZl?=
 =?utf-8?B?YzlpdnlvblZtajhDNXdIYTh3TDFpc2p6d3k4QUl1NktnNHVNRzBQVllZQTFX?=
 =?utf-8?B?N1ZpRzd3ZFFuaXUwekZWQUZsTlNkRlFlYjJsRGRGdHRIYXdobnBMTjBpbkd1?=
 =?utf-8?B?OHkza3F0L0FzVThVYTRkUzVDL2VpcUhNdFNES1hVaW85emp3cVBYdERvSXFK?=
 =?utf-8?B?MjhyZ3ZaUzR3SU5tWWxCUkxia3B3SkZDdWdRWFoySlNRN3FwMFR5Y3V6REtP?=
 =?utf-8?B?YXhobHNZVjNXVWNlaDhVN1NiSUhLUU5hSm1sVTNQcjBBTlAvb3RNQmwrVUJQ?=
 =?utf-8?B?bjRlUXJHYWpvZXc0c2U4VDVydW5kb3NpdUhHUUVNTWY3V3JJZlhIQUp6S21R?=
 =?utf-8?B?aWdLMENVQzdUVFU0bVh4VUdpbEw4ZjRGREd6OXVTQUNwdkVsa1gvNk9mM25O?=
 =?utf-8?B?ZzRIRSszbVNGd2lZbzdGWjAyNExvUisxYzNvNGVFL0FZMFZoZVFLTGFIY1FR?=
 =?utf-8?B?bGFSTk5BM2VJMG5uM2FjaVJza29GdFF3V0YzdHRSeUdPWDFJbWZMa0E2RytB?=
 =?utf-8?B?eGR2NmlIa3BPWDVRd3pWanZZS3JkSXVHS2lNQTlaUWxrZkNUQkRrOUZTTVZH?=
 =?utf-8?B?bFUyWlZPS3BpdWVxVXFZaWhQd2ZGeGozcDJiNFk5bWh5Y0pUb1FLelY1OHpq?=
 =?utf-8?B?dkRqZGs5QW5sUEhtTjJZZG16L0FvOVgwNktWaTVwNGJxRUVDdkVzbEdBaWJX?=
 =?utf-8?B?dm1tb2lXaFRpOXBDN3gvL1kyb1daZklCd1Y1NVhaSU5ibkhjWDc0dlM0TmdN?=
 =?utf-8?B?U200V3FNZUQ0Q2NpY0wyenVxaVNtTUlST2hBRUVDTjlzajRwaDVDUERKQ2JB?=
 =?utf-8?B?Zkx0dVFPQWV5M0NTaHZIT2ZPSDBKTEVuOFcwdHgwejhyR2xHN1VLbGtia0hr?=
 =?utf-8?B?RkNkVU5ISnJxRDFoeGZyN24zajBzREF0bVdmMk9Rd1FxbEdmcFA1bEtzV2U2?=
 =?utf-8?B?ejZxcnE3SEREYlJzWXBzditPdkVZN2tDSHcxUnVTeFdRNnVGMTJteE9Tb0sv?=
 =?utf-8?B?aEZMOWc4cmRVR25QMGdyd3c2Q2h3L2dYcUl1L1kxcEV3VjU3djlmU1RCWmVv?=
 =?utf-8?B?aEFNNDlXMzlxRlRsUVVvMFdWUVp4L0FvUVVBQ3R0RlNuSEludjY2R1pydURW?=
 =?utf-8?B?aWxadmNyOGdzRU1IdXlMdjc4aUNBOU5wTGJ1VFdvS1R4Mys2Q2hxQnlkVFNX?=
 =?utf-8?B?YjNzOW5naHM5a25VZHdrS01CalRCeFdua2Q0R09LWHJVM0syOHNIZVZrRlEx?=
 =?utf-8?B?ZmtqNFpWVXJnZTRzMDZ5dmpBTUR1K0Z5OUZhSEthS3pFc3U0VkNaYkpXcXds?=
 =?utf-8?B?N01KN0dxVThya053Yjh3ejlGWDZzaHlxVWRReXRvaG9ub0JOYTRKT1NkTjFK?=
 =?utf-8?B?Y1FYS0gwZTlGam4zdkZjL09jSTlTa1o4YlpnSDdsRmRuZHNzT0FBOG8rbnBR?=
 =?utf-8?B?dnJYZ1NLcFYwVTRJcDR2aENkUnRyU1hqdEU1ZVhyUDhTczhQWmVydUlocGRG?=
 =?utf-8?B?UjlIWi85c082N2I1RStNS0tjbTdraEJBZnhFbzF2U1ZEWGMweHN5MWtNVnVQ?=
 =?utf-8?B?c2tjM2g3UXZBM1JKN2NiaGlyZVRKNGtsR2RJcjRvWnhBZ0szVmhZTC81aUNT?=
 =?utf-8?B?UjdtdFE3aTBqZUw5TEMvRXRxQ3NyRWFRTjBLR0ZLb1NNT1pVcS94aHBZWG91?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f06358-c043-49e0-a98b-08ddbae845dc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:48:12.6746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLte1hAY9Ipi6tLV0vVLCLEAY2O/Mo8x6qMyS2EGOlEdERyC4wb9w1qD0ydP+4z6gIm47rZvurHV8iN4/z1tSzC1PmEPTAI2+6XEzLb8wcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

Note: Although it pops up as part of an older series, this is due to the 
fact that both the commits use the exact same title. I don't think it 
causes any trouble.

On 7/4/2025 16:05, Ravi Kumar Vodapalli wrote:
> From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
>
> One additional PCI ID is added in Bspec for BMG, Add it so that
> driver recognizes this device with this new ID.
>
> Bspec: 68090
> Signed-off-by: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
> ---
>   include/drm/intel/pciids.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index a0180d10e260..76f8d26f9cc9 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -846,6 +846,7 @@
>   /* BMG */
>   #define INTEL_BMG_IDS(MACRO__, ...) \
>   	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE209, ## __VA_ARGS__), \

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>   	MACRO__(0xE20B, ## __VA_ARGS__), \
>   	MACRO__(0xE20C, ## __VA_ARGS__), \
>   	MACRO__(0xE20D, ## __VA_ARGS__), \
