Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70501CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2A10E845;
	Thu,  2 Oct 2025 21:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWWeBBuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3210E845
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759441585; x=1790977585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cBVS4byJSuHTagbgszbxtbjf2Pj1zbBXMY3H7yYZSRM=;
 b=mWWeBBuBxWgtSOEU+t9TlGskFK8D7eZjk8GEgrg6CsRFlDErgJmqIyPY
 pq1zogYynUm/E40+eORe+91F1yf25WoXgug+YbuewAefyDMsil7t5SWui
 Dsh8HeVxm45Zqx//4gIn3p6JfRTX7+PA3ZUrN5WOQDMxH5jtWHlqXGFcr
 IoDx+88jMYdHwC5nNzL0nOxcC25YkgyQYvoQNFs8uEdc3leyPCZOt6L5q
 zR20rLlMOEy7/KTaBYMZ8ZjLeJS6yMUkXJ7Qyncuup0iif7SqKOAGfq2R
 mDJJx3w166pSkXJWZOl1A2Cj9jLUUHb5C+jVrheHiH/7UDHK7WJ+xlshd g==;
X-CSE-ConnectionGUID: OYcHl24HQX60sAiP8MbxJg==
X-CSE-MsgGUID: uih0WkXrQ6+gE99KF7qjdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84353174"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="84353174"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:46:24 -0700
X-CSE-ConnectionGUID: k901CfQJRKayM/jrvkZMXw==
X-CSE-MsgGUID: DaF5YXv0QFuxXlvgPufycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179087051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:46:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:46:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:46:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9GXUnbq0+yvHpPPmA+oKjgxGnBph6aLiLVo+WF2b5EyCsy6EY73Wt45kM11Rd68gTvJbZj7GoyHMQcFq0M9mrNMOCMj1FVB76/Z4bsnu19JaT0loNSszEKpPXU/jatnpQQi5WGBTddycIMr7HAZxRJDmxTMW2yI/EXO7SY85nIY+beyRf7MaFJGUTElRzY+NTvunCxyJE0nIh4nj6Q9RZnY5OKSDreklH2hyJIl88n65GYTV57pB97CMo1hRNeSbcOwmO56KkuhzhoB78tBNLo6YofdN/2krcRzSm29j2nI2+Mhrm/Cn9K5J/HVoDSGD6IAANRJ+s3KgAVdvBA6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTdUq/ncg9IhILNASTMEET18bgawozgcES80pdIqhH8=;
 b=fn6h0FASMTo1cEMIOsOVSjA3wW/a4SAvuEMVw6aQJEiof9W1KwqMBAdbNoTqquwd9P6W36d0+zqwbQetIjmSUAL40ZNNxiwP3hCQ17IS/2CHttNSwqcy/C+6uWmiVlEumgEcN2++R9VCFNErRyd4zYsuHYaIupyGBjLJ6BRWUHIZkEnDkrPcTYuMnhXZKpMddH6L3DXtBC0T3afJR445dAs3ObO8nZlzc+4WkggVzu3EC911KmINn70lTdIrbZC+oNSjM0xJcoK5IFGlSObGV+eyz15JAs3jPjpcn+MZAR2JY8xuiKLV8IKaHpNFnpQlfpdzfNA4Eob/IqEFNWB5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:46:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:46:16 +0000
Date: Thu, 2 Oct 2025 23:46:12 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/pf: Unify VF state tracking log
Message-ID: <a2z46e4jg5rkfkkk6jl47khnsm5bp6pz6v2wek5in754hvr2mz@jr4hybmaefyq>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df7f1da-59f8-4e1c-82ec-08de01fd1d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWw5K05NdVhyUDFlZFlVWHM2TlpNVUR5OUZjR1E5ZWx4cEd1b0tuTlNJak9s?=
 =?utf-8?B?em1zdVBld05IRi8rWWNZV1p4ZlZMU1VnU2JoSDFGUHZKN2d3d2d6TEd4MUZE?=
 =?utf-8?B?SWZFbzVhU082cTlCc1hzSlU0Rkx3Z3Z6dncrMVcwYW5JNzJyVFJyV0RwRTBm?=
 =?utf-8?B?U0E2NTNLdHlaUWt6R1VxOWdldkVZZUJpUnhHMytLcjN5QStCdHEycmNIazhv?=
 =?utf-8?B?UzZ6TGZhTzY2Si9ucTJpcE1MUHBucXVXRlkwaW1BZlZ3QXVMN0UySHRxc2xh?=
 =?utf-8?B?YmdRbXBhWi9ZNzZESVJ0S3d3UVprZ25vZnQ4eXd5WFFaRXdwWnlveXE2Z1Zx?=
 =?utf-8?B?MkE1bWhSTEpvdDVNWGZuak1ZQWpsQkttazA5VkU5cStyaU5BWFBTVTVLWm51?=
 =?utf-8?B?TE16U2JORC9UUFo5RnBlbW1HaG5MdklaQVh4VEROcWVSblBSMmNOVUhZaDY5?=
 =?utf-8?B?c3VUbUpqVlc5aUpRakxjU1FTRFpFSVFFY2dsMzFXWHNtK1M5cGVmQXZYVlhq?=
 =?utf-8?B?SG1BQ1dqd29XenM3VFlienNaZjNBandiRUlkMmlpcldjQ3NWNjlCSTZ1eHpT?=
 =?utf-8?B?MHIxaG41aUV6b0l1dnNjWWh0WkFBNUhuaWxldThocEt4aDR3Y0Y3bjRzemxw?=
 =?utf-8?B?a2ZZVUgwYzgyK1d5WHZsVG4zUFNPRGFpYTAyL2ZpdFF2bUtGSVhPZVFWMmNw?=
 =?utf-8?B?VCtZK1JKVUpPTUtLdkJ6MTNBTjlHTlJKaU8zL1RJNGc3ZXdmcklEcFVERytR?=
 =?utf-8?B?MUhiRGlsNUh2cmpmeUJMWkNUVGtqZFFTWm02ZGxVNjh4NUNFZTRXVjRGbjNL?=
 =?utf-8?B?NFhWV3dFYUoxV2NqajhJbUhrRnFDbkR0d3o0OFNQM0M3ZFhLMm92dVFZMjZm?=
 =?utf-8?B?SUN0NDVpSm5QUkR2TlhBM1NJSzZMalpwSlBSVEZLVDg2Y1RxRjRSakpUNG4z?=
 =?utf-8?B?Q3dXTFhvYXJFUStWSVpsTjk1ZWlUdXlKbnhXRXhCaElsVlA4K3M2VDRWOHVD?=
 =?utf-8?B?dTZKUmQySExDdnE3bWh1Q0ZWbXJlcDJiaXVxQ3RiN2ZjY05yZi9Jc2I1QXo2?=
 =?utf-8?B?b243OW1PSDBMY0VXUzQyekd1aCtwZ1VyaFZTdHoxSTBBejNHdDROZDJtZ0dx?=
 =?utf-8?B?UC8zWnZDS2lQRitrdnh2RXVwZlhzVVVGWmVhQmJKTFNGUzR6aTNaUDlPYlN3?=
 =?utf-8?B?YmZGY05XVFlmMTM5VUltbEZxWDd5UU5jMUNlK0R3SWNWQmRvN3BFdWtZWTc4?=
 =?utf-8?B?ZmNrUkFkVHJkU3kxdkJnYlBGSEhqT1VYOEhPSnh3djB0Q29DQ3BPQTBhVU1s?=
 =?utf-8?B?Vzk3aGlFQzcrV0FSNzVCeGNGM1I4WlROVlBNczA5eHhhTzRSWjBWakt2UVpV?=
 =?utf-8?B?N2tGUGRRMGM1STgyYXU0NVVPdjFFdE5IUTIydXltS2VOL2d3QWlzeHBsVjI5?=
 =?utf-8?B?dVNkYVIxQWwxbStZSDNQUzNhSmFrd0pUamw4SkhsTVpEbmZsSU53bktDTHNC?=
 =?utf-8?B?dU44am84amJkV3JGTUVSUWlYQzk0dUhrV1I5Q1ZCOGFpNFFCbUJzUE14bUEw?=
 =?utf-8?B?RVp6TlhUMTJXWEVaOW1OUklCaU9ZeEpIUUtoRktrYUVoVHdjL3MrUSs3M3ZP?=
 =?utf-8?B?dHF0QkFpNlNGVnRnQlFZUFlLUElpWW9ZVHhsT3dseFJTWUw5dnFVVEkxWUo0?=
 =?utf-8?B?dnZkbmkrRmxzV0xCd2ExQjg0UmdQdUd6VlZxT1FqWTU5REIwSWpVVi9jU1hG?=
 =?utf-8?B?TStaTWdVcytoK0hObXo3WkdmN0RWdXhtdG10K3ZWRFJIRi9NUWE3c3p0ZHli?=
 =?utf-8?B?RmErTGQySFN6eWk3bW1sU2JmV3poWnB5NVo1ellCenZjaDNwUXEyc3ZOOTZw?=
 =?utf-8?B?cGJ4M05qa2lVenovLzgrdWZ3OTluWEMvSktLQnI2QzVEK0ZpRFg5ZEMyV0Qr?=
 =?utf-8?Q?iAiuvAeO2qt8mn+YYvNKcpgpmAQnbG0L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0wzWjA0a0dwcjR6R1kzK1FoR0EzMm1PVzUvbEdvT3ZFMDFUSjlBV3dzb21s?=
 =?utf-8?B?S29XT0p6OFk4T3ZUcUtmOHNTQTdNMm9nUVFJajhNSTZnaXRncHNyQUVUVGUx?=
 =?utf-8?B?L3FtWGptUCtjb1VIdy9ueEhqWHk5TEt3dVdXcFphTE0vR2M5VFcrdDcrNWl0?=
 =?utf-8?B?K09RcThwNm9JUVVnVCt3bnVJSk1LaVpMVDBSWEJ1U3pVa1Z1OGNlajRXeFRS?=
 =?utf-8?B?QUVSUVoyYk9ZUTJpVzM4aFJ2SFJSL1RQRGJsRzFFQW1weHBTMzJHdll0MjNH?=
 =?utf-8?B?L1lZOW5CUnNNWUt6MEhlbEJuQjJzbCtYQit1cTlZSHJFbVN2RjNsQk9sU0Iw?=
 =?utf-8?B?TkpoQ1Z6QTRRL2hnb08xMW0vWEsxQk5ZRGc4bFJxUVhQQ1Y4cDM2OGVZUFhp?=
 =?utf-8?B?YkhxT0JEbS8zeDlNQzdDM0YxbXUrb0FPOFltZVRFaEt1ckpwN2dydUVIc0FC?=
 =?utf-8?B?cW9TZTdkeWFheFFjWW5zaFJuZVNWSjRHc0pxbTBxU3pxeC9RRWZ2azBkUUxR?=
 =?utf-8?B?NW0zbm9iYXJQNTlQeFRxM3FMSTRjMFpVdGlwb0lOTlZyQjJSTkFkVjZYWmx4?=
 =?utf-8?B?UUZMQ2ZaSms2TWRDbnVzSDk1OWlQUnFoa1ZWZGVKWjltZSs1QW03ZnkxNVlG?=
 =?utf-8?B?eWN6a0V5NTVud09hOFZrNURodURrRG1NZTZOWnBXMW9IYnRQUk95TGhPUXRQ?=
 =?utf-8?B?dnl2R1REa0Nsc2gzaXZMUEV2R1R2L2tweXg2YjU1MDN4bFd0SStvdEo0SG9O?=
 =?utf-8?B?eEtuQlpnc3JIWEsrUHA0YVR3VTRNNDZoUWpFYmtsU1Z5dkZhdnNrRDM0QUty?=
 =?utf-8?B?eXVtWW1wc0VIdGQrZkFrN3JIeGM4SVNGQVhtcm5YSWYwS1hBMHpKOHZabEM0?=
 =?utf-8?B?WmFiTEtFT0N0MHFFQkcycEE2ams4UGgwL1dBSnVQTzZOcEUxbVo1RW92ZzFK?=
 =?utf-8?B?WTJoQXQzVEp2TitzVkZ6c1JsNWJHalpsZmU2U0V4ckJVRmNHZnlkZ0hCQWNy?=
 =?utf-8?B?d2tZM1VEOXJsVWZJN01ISEk2OFNBMGhub0d3KzZ1c3gxZzc2MHZzekdic08x?=
 =?utf-8?B?cUFzbkI3azFCNHhPdkN1Mk5tUmZMNzE1dUh5azg1eDV4alVZV000ZVRNWVlY?=
 =?utf-8?B?U1JlUlZkUkk1bjhxYjI0Z2NyVTZaUDQzTXpWbVRRZ2N4dElTbnpaT29PNVN4?=
 =?utf-8?B?cEprcndXM3VpZ2MzNHNZUVJoSk05NjlCUXl5c3J1a21FRDg5Vit1aCtoWUVL?=
 =?utf-8?B?dE1FakhtczA0ckR5YjRNUytxamhTbWpNZUxyYTNsV3ZkMVRPN3ppMDcxUXU0?=
 =?utf-8?B?WllsdDUxUjNDUElMNGJESTB5YzkvQ3JLbkpWdUdjSndmSFZwVWhtcDRSV3R2?=
 =?utf-8?B?TXZTeUVVc3B5b3ZpRnM5aDZKY0NsZHdnWklqcllYbnlOeUN1WTBEVERlbzk2?=
 =?utf-8?B?YnoyT1B4TEV6MG14NHNsNjB4V2dnQzFKMlAxalp0UmkrUjZsMVlQT24xY1FL?=
 =?utf-8?B?cVkwTmZlNmZBOE8zNkM0QURMbXBwK1pLKzRkSjVUZHN0bFpLd3NRSXlGQ3ZP?=
 =?utf-8?B?SHhSWmh0NWFkZ0VaNERyRFV1K0lYY09oUitWQ212UW9DOUNvRnFYTnByK2hw?=
 =?utf-8?B?QjZSSXRoVDVxaUw3TTlPSDNqT1hFeG8weHFhTDIrNEQrZXFmbVJ3ZUdIRThQ?=
 =?utf-8?B?ZTJwY0J4REZXRytpNmd4RHVWRXFpK1NYb051NWYvNjdtVWNTbXA5TFg5cTBW?=
 =?utf-8?B?eURtNytwYWRqdlJtVkRhd3RDd2RUbGR3czRyQlZRM3FGTXVxb0lDL29jbit2?=
 =?utf-8?B?ZFBkbGxhYjBjVU1HK3lTaWZqOVl1UCtZTDRPTlpYNmtYd0NiZzFhTHJDWk1D?=
 =?utf-8?B?MTNoYk5WWUNKWlduWTZTWENhbjZwS2xaQS9VenUzc1dnaWgvMXJxYTlNL1hQ?=
 =?utf-8?B?T1NDdGdYMmF3dWFLNkxWMTJrRjgwd3dVMnRzbVc1c1dFZk1GRlEwV3U5cTJV?=
 =?utf-8?B?RElrYVJzU1lyN3hSVnlZNUVqNXNHczB0ekQxNHNTd1ZxTlZvZ253U2YxSHBI?=
 =?utf-8?B?dlNsdzZaNThGSXVEMThjN214bFlJdXZvTFVhMmFIb3Exb20xd3JOTGtlWWUx?=
 =?utf-8?B?YXVCaVZIL2pHS3JyT01PZkt6RkpTRitpMWtjaHFVK29TbWo0cHJDMHpjZUlO?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df7f1da-59f8-4e1c-82ec-08de01fd1d33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:46:16.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQ1odMgCVGBcPGvVA2uSuabIwmsTrL4fLlxqDpVV89oITsjvnUNJgTFOGNi248i7iFCrQ0FhGNP1bok9osT2i8L+ApZBJR8AQqDTOoHDAnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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

On Wed, Oct 01, 2025 at 01:35:22AM +0200, Michal Wajdeczko wrote:
> By using single function that dumps VF state transition, final
> logs are easier to analyze as there is always the same call site
> in every debug message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
