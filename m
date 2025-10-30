Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DFCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB7310E9DE;
	Thu, 30 Oct 2025 15:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9Tq74u/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9386C10E9DE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837502; x=1793373502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VfJUhF7+PRgU4yRk34wXpxjzwW4nHXmZU0SDul4XKRA=;
 b=F9Tq74u/bf9OdPyR/sInsWsxENtQTq0Y/iLSl3YKgtiEroDlnGxYP/02
 lZklG+2o3n6Ziv8eRkCfYvHJKEkG9ePf/k/24gU1magrJsTCxC1qumHV9
 kXQM2PxYXQzRmmCqaWyf/CATIL5m2peXwp2ykq8bnV3s94nQrJlctkbKz
 97dX3QpY+QWhWU+mRjqcXMOf0tPr12/4HvPNMn9uCsTKsdKTVZvBiqqHS
 +shWIiMSmVu++hz9gX4Vd8psrcTPJ94lgbhaSxvFLCswR6oNy1usYBtHK
 XwjoyxRITnb/Py+9WvReBAXa5CTBU2+vymHQIDgPe8m3p7yqiZh/ci/1s g==;
X-CSE-ConnectionGUID: OvDwzMrhS7SYSOxtqZHTyw==
X-CSE-MsgGUID: Qsb9WIYQRvC4uL9mpnW7Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63886656"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63886656"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:18:21 -0700
X-CSE-ConnectionGUID: R+wO/JhPRC2YhcBroDo5tA==
X-CSE-MsgGUID: smF+85twQmOpXrHiQGBSHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185916395"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:18:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:18:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 08:18:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pva+0U4inQIqhTeweIDvlBfuD47PjVnyNMHjcGWDz7wAi31Njd8yM3UjjpMHouD5Dwow2j2H4eVuoXgdlFUWICHzGqUKLN5GdOZzK8RuvVsSSQF93YgwUMTnZ3BTUy2zxAg1dNrB5uLzJCBuLv6PaqE/S0beR4SBrW0PdJDIWYnD1yPwmXnh7TozGsifIiEyEiZUnWv1doDQQbMGUVgqFTheRYkoHweC+FNIVf4pp8HhcrzMjpVHpxBf3EmHbpdXW8GBW7OmNHADaIUcQXXC0sN6s1zvw88htX62v65CQdafDMkL2GzyPeqpISmf4qGn+pbZpn8KUML2qaCeTU7dVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSGUMdE7zQlWb5H/UzG1Q89JdVFOTtEX4O67UsOnUvw=;
 b=Piv1p/BZMbrwlbTxENGJeEDeIrv8Y+XFbMxbAkC4Os+mbG8r/l93gEiM5gK+qA+3cE+4cEJGVS6Xh6cfrSxvWVeNW7FOBkPSCts5a5SHMlNBnTryDCFl5UndLViFss305vCyWuhfMVAm6cHCVrN4MfO6PPJmh4Xe9ngDfMhDmeVYLCzKGJSmMHUsvPTII/4R4X6c4ldP2wyeljxFxGG4KX5ufiv7BF5OBhy54iu7L3+vy8PaTI/v0F/5mRGYhKuc65qJHEJpo4BTgC+tGMqVPX4T5SgQEomqdRhf1lCch11uzf0+HMwjGEcS1kW/8anHunu2Uqzhpfcac9QecdIzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 15:18:15 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 15:18:15 +0000
Message-ID: <5273749c-6f0a-4328-b50f-77c808e62e6b@intel.com>
Date: Thu, 30 Oct 2025 20:48:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com> <aQJXIw7zBBy38Dhi@intel.com>
 <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
 <984175e33b6669dd3db02cc306465c51f196f314.camel@intel.com>
 <696c7127-84e0-420f-8ee1-72b7a64492e7@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <696c7127-84e0-420f-8ee1-72b7a64492e7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b64fed-3c02-422c-4cc5-08de17c78bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWhaalBldE1uRDJ4ejJ6SnJia3RXQy9GYk94djc2RWZSRGZOVzlWU3RDcVdX?=
 =?utf-8?B?WjhtUUtqQlMzNnI1ajN5OVJ0N2ZBZDByZlBrM3hvS2dFeVRlcis2cjdpN0Jt?=
 =?utf-8?B?K2dOQkpDMnY1MFhjclhDcytWSURCelJhSFg2cTJ2S1oyQjJzUllXaXJHSC9r?=
 =?utf-8?B?MlZGTzk3R0d1dGEwUUhGRHlGSTU5aXZRdVdnUzFIRXEvVzJmRXFtZC9hY1dt?=
 =?utf-8?B?dkZRSzdFeUNBTXMwUGQ1eld3bGh5dGdMREEvTTVtamJ6QXlSNHZkaXBZVlRv?=
 =?utf-8?B?VEx2VUV3ODBndmhYSjErQTJWdG0vSGxHdzEvZit0VFUrYTdXcXJNRlVPY0Fi?=
 =?utf-8?B?dmQvaFZrWVpLd1lyS3UrSVlFQSs0N0g1MEtMbWFNYkw4Wm9MSkxQTXpqeEtN?=
 =?utf-8?B?bDJYVU5MNFdwVjhvbzhNd1FNdVRGSjFNV3dZSWQvb2h6U3NMRlpQbWQ3b0wr?=
 =?utf-8?B?UGJETW5SVEFJZnhYb2k2NmtDaVJOWlhHNzNyOVpQMXRXdmwzNnhWRkduN091?=
 =?utf-8?B?TTlLWDJsTFUxckVRcDBBbWdVUU5Mc0tBTW0xTVRYaThtb1BVcUN2SVpEaURY?=
 =?utf-8?B?RFZCVDcwTWlTMDZRRFk2N1NLOUZZb1hRZ2xtNjR4UlBML0hlZnRyTXl3MmJH?=
 =?utf-8?B?SXQzQzNNN0czaFNWREUzSFlRN2ttemQzTldpSUkwZ2hhNGtzVlZoK1huUW1K?=
 =?utf-8?B?RWZiZjdkd01jU2pFODhGcGFKa0dOL2dQaXRqWEtOQXJ6b1dVMkxkNmFtcTRz?=
 =?utf-8?B?VllteHVRMWxndEtVSDRNaDI0RzV1R0J1UDYrMkZ5R01ISU5jcHM3QnU0K0c1?=
 =?utf-8?B?bVhlRy9jWnlLck52b1dOd3gyZzQzYlhUZWxmTUhoUUNBSXJLaDFsS0x0a1BM?=
 =?utf-8?B?TVViUUx0OExWeERPMi9kUHh6dmFQdFZjbSs4d0NReEJkRG53VkpwK0N3MWRI?=
 =?utf-8?B?cmMxRWd0MHhtUmtpOU9zNTJSWkdZQTNzSGlybXV4VGM3Z3NxcEg2MnlmNlZJ?=
 =?utf-8?B?S3pUTG50SCtxd2ladzJvWHpKVk5FQlQyeE0zNU10cFBlVENvbStjb3d3QVcv?=
 =?utf-8?B?bjlnKy9tVEI4RElaL0k4T1JIWFVtWkxRWFFWN1FZYVRGVmxaOWt6VmxSRmRB?=
 =?utf-8?B?cEdOTktzUVZ6dEY3aTJxR3JhYTU2Mis2NWJhUDE0N0x3UGxHVmNrVmMrbjFH?=
 =?utf-8?B?Z3RjYy9HczBtT0xLbTJHb2Z0VUg1Tno0SXJpcExWKzJuYVQ0RmdIMVRuMlho?=
 =?utf-8?B?cStTVjFpSEFROGE5dDJqeVR4RFA2RFNRcVgvMzJ2Q283anpBY3BPaEdXdG1L?=
 =?utf-8?B?Q2RIeFJlc0RPM3gwdkY2NXJWTlArQUZvVTEra0NqNHJyNFhFWWVNdTdvc05G?=
 =?utf-8?B?dUViZmRzdHRlMUhSRGN2eTZ2NmhhZFZ4cE5SMHgwcFdXeTlPbGRTYmxmT3BH?=
 =?utf-8?B?NXJLZGxET0dFWlhRb0ZvUnFBMFpmZ0Fhd1BoV09kckVTQStGT1ZSWVdMWWhx?=
 =?utf-8?B?RTdDQW9ybVNqVE5rMXg2cG1XVVFYQklVY1Q3V0FuOU5INWVjVU85ZitGTTFX?=
 =?utf-8?B?WVVTTFIzU2VtNHFPUVZQTnEwTC9YZDdpWmJKSTFDTVZyQ0FtU2pnRTU0MCtI?=
 =?utf-8?B?VUh5M0hPSHRlbTVzWDc1OHVFYTVIYllIL2FUTjNVeFJ1ZzA1Z1NPN2wrUUNj?=
 =?utf-8?B?azFvRmNuMmxESHlCTW9hcjZObW92aWFmRmRISG5xNE5kNWwyRXVCN0czQUlP?=
 =?utf-8?B?QTE2dDQvaVRMTlY0aWsxTnpKL0pNZFRkZnB3M3IwZy9TV3QvdHAxRFpuQjQx?=
 =?utf-8?B?UUJTV1BGMzc3MHJweXl4R3BHN0Q2RFJPS2NPRjZTcmw5U0lCWWF1SFFBb2Iz?=
 =?utf-8?B?aS9pV085amMxYkxoR09ZZThuUHhvaG9lMjl4UHcySHhwYmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEx6OGs0WElXVlVvNXlLd3luR09lYktkU3lzVVUrVmZOVjg2MExZaWduOTFs?=
 =?utf-8?B?b2g5K1JpZU00ak1aWEV2dnVOV25SWS9GdHRwVXpoL2pDRmcvNlhvZ1FxbjJP?=
 =?utf-8?B?SDJiUHE2VUhaU1pLSVFERWhFWE5nNmpkWERSQVNtYVE5THliY2dxbE1qMnlr?=
 =?utf-8?B?U3JteUtSbFdZa29JWHFvSC9vTjdhUlRHVURleWJwQThOUXNFbkxNVnlnaXZS?=
 =?utf-8?B?amZOODgrbUJTem5laGIvMElyMXdOOWV1SnRCcUZLczN3VHJhdWFVQ0dlVHNn?=
 =?utf-8?B?Nk15MzE2OTRwV0ZoTy9IOFNSRWZIbVUxWkpvTk9RZXJJcmViMElldkZGWXpp?=
 =?utf-8?B?R3IzeFdnbTEzK2JTcHVBSVpSSlhJcy9CcGd5azZqbEtLckNYYWhKVlJsUUMw?=
 =?utf-8?B?QjhMSG5PL044YWRRYjV3ekV3NUdhMEVvRDJIc0hQRkd0WGJ5RDBoYlI0QzRT?=
 =?utf-8?B?UVRZQ0hGUXBXUUFZaWNJcDJMWFVNU3RJY2lkYVZsTytwbmZZMXBVek4wS2dT?=
 =?utf-8?B?VStPYUlDaFFsU3J5YXU4aW9NOFFWbkdlRk81VnQyQ0xBZ3Y3TlNaQWVDMDlF?=
 =?utf-8?B?TUt6Q1ZxRkQ0S3NqbE5LQ0tqS0YxUUR5cERVWnhlbUhFcFlCOE1oVlU2bXhE?=
 =?utf-8?B?alBTYTB1WW9BMS85MUpqMEViNjkzU2drTEJ4bm1HV3oyb1NzUjRaN1NYUVNO?=
 =?utf-8?B?TndvVXUyVmc5UTFlb2JiWGZ5QVQvSlhic2ljUS9CbjdJSmdCRElDaVNNZkVi?=
 =?utf-8?B?clZxcVBqQkRwZnpiVnFZbXZRakk1bSsySjE5cDExL3lmcWJyRmN6OFBLMEZu?=
 =?utf-8?B?RENLMUxpd3RGWktpenVnSlQxaUZnR0xoNDExUVRSRkxJREhzb0RtbkNYem9U?=
 =?utf-8?B?UzR2bS9DZVRaZnBkVGQ5NjJXMXJIcmZLSE5WRy8yWUpnaTNBS2h6R2ovOGJk?=
 =?utf-8?B?UmFVZ05weGJuZFBLN1NmV2JVUVpiallvMGtUejVHRmNCTTQzUCtLcmRXTXpZ?=
 =?utf-8?B?bG0xQnRlc3BiVmJ1clBEMkZLK3VMRDB2TVc2Z2QyRWxhenQ3ZktFY2ZpM0hO?=
 =?utf-8?B?R084ZnIvTWhYYWcwRlloczlDREo5ZkRMY2ZpUElzNmczSGphM1VDWUpSQ2Q4?=
 =?utf-8?B?TUVRNzBvTEZidUNXWGNxVHhRNXRHendrT2laYmt0N0JUakd1Y3hSSk1yMmNN?=
 =?utf-8?B?blNIQnFYYzFWbFdVOFZLNFd3QkRVc2cva0w5RVpGdW8wWE93d3RRUUJqS0lP?=
 =?utf-8?B?d25qbDNXY1NvU2hDSWhHOUp5UXprMU53TXpWVWlkZ0RzQXRQa3E4TDhleS9W?=
 =?utf-8?B?bExzUm1PaEQvOFF6enMrSW03elJ5U09YNEgvTGNKdnBXZVI4UjQ1T28rMlI0?=
 =?utf-8?B?aUJ3dFNsZ2dDRVBoUmw2ZGhJZDBpK3RZVkg4OE1KcVZlSDY3ZWFzWCswc0l2?=
 =?utf-8?B?OXJUcCtuZXBWUkpNbEQvMSt0ZmR0blY5cHVxcmtZSElBdnFJWmRiQVFhOVFQ?=
 =?utf-8?B?SUZPQnhJQ0NobU9yLzk5NG1TMXBKM1RYSXhwaFVONms3U0pta01sL0h5YlY1?=
 =?utf-8?B?Z01XOU5WTVprd3FESjRZVzRKalZyS0tBT0pNQUVOV25uSGd6VHV2TS85NGhR?=
 =?utf-8?B?YWNMc3lEVnVIdTh1NXNrUUx4T0VtbXR5a0dJT3pob0JOWHB0U2p0bG9nK0JW?=
 =?utf-8?B?bHVxR0hoRE51WlJEVi9GNndTdGVJRGxFc2JlcFRvRVRuR1RuUzE5akM1TGNn?=
 =?utf-8?B?ajBiYXlVLzRXanRweE91N1o0ZE1sY1FQVXRYMW9KSUh6WDFYM3EzRldlNUgw?=
 =?utf-8?B?b1c5QWRpK1VpRVlHZTFQRm5pSmdHVU1WeWgyTUhRWUdSWWRueWI3b0E1Snlp?=
 =?utf-8?B?akZOSnlwY1NoUSt6WkE1M3JaeFZMUENiUHJvZ083aTF6UTh3b1pkbXFkcVR3?=
 =?utf-8?B?ckNnRkROQW5TOVA3YnZwdUMyRUFVTFV2alVndmNRd0VsNk1rbFd4cVJSaTB4?=
 =?utf-8?B?T3pBSHVROGw2b2pHanhORWl3T1AyQ01vZHlmdi95WXBBZzdvYjFEYnNqZXdD?=
 =?utf-8?B?SjBQR2lkb1hiNXViT05pb1lJam5SNjRWR2tuZEQ0MkxzWVd4cnYzMnNMeEJw?=
 =?utf-8?Q?W3wCoLn5VM/2tUQAVHZRtxIbq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b64fed-3c02-422c-4cc5-08de17c78bc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:18:14.8489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6f02EyrpkaqrPWE5UdduvkgLfkSEqNNANgUl2dqipfhTWEYGrq+Vj0lMOrNXaY785/19x3wjs0e5gaONBB8p+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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

Hi,

On 30-10-2025 02:07, Belgaumkar, Vinay wrote:
>
> On 10/29/2025 12:58 PM, Vivi, Rodrigo wrote:
>> On Thu, 2025-10-30 at 00:05 +0530, Anirban, Sk wrote:
>>> Hi,
>>>
>>> On 29-10-2025 23:34, Rodrigo Vivi wrote:
>>>> On Wed, Oct 29, 2025 at 04:50:16PM +0530, Sk Anirban wrote:
>>>>> RPe is runtime-determined by PCODE and caching it caused stale
>>>>> values,
>>>>> leading to incorrect GuC SLPC parameter settings.
>>>>> Drop the cached rpe_freq field and query fresh values from
>>>>> hardware
>>>>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>>>>
>>>>> v2: Remove cached RPe frequency field (Rodrigo)
>>>>> v3: Remove extra variable (Vinay)
>>>>>       Modify function name (Vinay)
>>>>> v4: Maintain a separate function for PVC (Rodrigo)
>>>>> v5: Update RPn while fetching RPe frequency
>>>>>
>>>>> Closes:
>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_pc.c       | 75 ++++++++++++++++-----
>>>>> -------
>>>>>    drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>>>>    2 files changed, 42 insertions(+), 35 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> index 3c0feb50a1e2..08deaa64aa85 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
>>>>> *pc, u32 freq)
>>>>>         * Our goal is to have the admin choices respected.
>>>>>         */
>>>>>        pc_action_set_param(pc,
>>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>>>> -                freq < pc->rpe_freq);
>>>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>>>>>           return pc_action_set_param(pc,
>>>>>
>>>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK,
>>>>> reg));
>>>>>    }
>>>>>    -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>>>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>>        u32 reg;
>>>>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        else
>>>>>            reg = xe_mmio_read32(&gt->mmio,
>>>>> MTL_GT_RPE_FREQUENCY);
>>>>>    -    pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK,
>>>>> reg));
>>>>> +    return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>>>>    }
>>>>>       static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>>>> @@ -408,24 +408,22 @@ static void tgl_update_rpa_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        }
>>>>>    }
>>>>>    -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>>>> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>> -    struct xe_device *xe = gt_to_xe(gt);
>>>>>        u32 reg;
>>>>>    -    /*
>>>>> -     * For PVC we still need to use fused RP1 as the
>>>>> approximation for RPe
>>>>> -     * For other platforms than PVC we get the resolved RPe
>>>>> directly from
>>>>> -     * PCODE at a different register
>>>>> -     */
>>>>> -    if (xe->info.platform == XE_PVC) {
>>>>> -        reg = xe_mmio_read32(&gt->mmio,
>>>>> PVC_RP_STATE_CAP);
>>>>> -        pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> -    } else {
>>>>> -        reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>>> -        pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> -    }
>>>>> +    reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>>>>> +    return REG_FIELD_GET(RP1_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> +}
>>>>> +
>>>>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>>>>> +{
>>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>>> +    u32 reg;
>>>>> +
>>>>> +    reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>>> +    return REG_FIELD_GET(RPE_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>>    }
>>>>>       static void pc_update_rp_values(struct xe_guc_pc *pc)
>>>>> @@ -433,20 +431,10 @@ static void pc_update_rp_values(struct
>>>>> xe_guc_pc *pc)
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>    -    if (GRAPHICS_VERx100(xe) >= 1270) {
>>>>> +    if (GRAPHICS_VERx100(xe) >= 1270)
>>>>>            mtl_update_rpa_value(pc);
>>>>> -        mtl_update_rpe_value(pc);
>>>>> -    } else {
>>>>> +    else
>>>>>            tgl_update_rpa_value(pc);
>>>>> -        tgl_update_rpe_value(pc);
>>>>> -    }
>>>>> -
>>>>> -    /*
>>>>> -     * RPe is decided at runtime by PCODE. In the rare case
>>>>> where that's
>>>>> -     * smaller than the fused min, we will trust the PCODE
>>>>> and use that
>>>>> -     * as our minimum one.
>>>>> -     */
>>>>> -    pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>>>>    }
>>>>>       /**
>>>>> @@ -560,9 +548,30 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc
>>>>> *pc)
>>>>>     */
>>>>>    u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>> -    pc_update_rp_values(pc);
>>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>>> +    u32 freq;
>>>>>    -    return pc->rpe_freq;
>>>>> +    /*
>>>>> +     * For PVC we still need to use fused RP1 as the
>>>>> approximation for RPe
>>>>> +     * For other platforms than PVC we get the resolved RPe
>>>>> directly from
>>>>> +     * PCODE at a different register
>>>>> +     */
>>>>> +    if (xe->info.platform == XE_PVC)
>>>> I believe it would be better to convert this to the graphics
>>>> version here
>>>> instead of the platform name. But no block since it was already a
>>>> platform check
>>>> above.
>>> sure, I will look into this.
>>>>> +        freq = pvc_get_rpe_freq(pc);
>>>>> +    else if (GRAPHICS_VERx100(xe) >= 1270)
>>>>> +        freq = mtl_get_rpe_freq(pc);
>>>>> +    else
>>>>> +        freq = tgl_get_rpe_freq(pc);
>>>>> +
>>>>> +    /*
>>>>> +     * RPe is decided at runtime by PCODE. In the rare case
>>>>> where that's
>>>>> +     * smaller than the fused min, we will trust the PCODE
>>>>> and use that
>>>>> +     * as our minimum one.
>>>>> +     */
>>>>> +    pc->rpn_freq = min(pc->rpn_freq, freq);
>>>> setting rpn_freq inside this get_rpe function makes no sense.
>>>>
>>>> I'm sorry I forgot about this when I told you to kill the other
>>>> function.
>>>> It should stay there, but be called update_rpn instead...
>>> Since RPn updates depend on RPe, my intention was to update RPn
>>> whenever
>>> RPe is fetched.
>>> Alternatively, I can maintain a separate update_rpn() function, but
>>> in
>>> either case, it will be invoked during initialization and while
>>> retrieving RPe frequencies.
>>> Another option could be to simply rename the function to
>>> xe_guc_pc_get_rpe_rpn_freq() to reflect its dual purpose.
>>> What are your thoughts on this approach?
>> I think you need to get to the drawing board and think on another
>> proposal. This is becoming to get really messier.
>>
>> update_rp simply update them all before the actual get.
>>
>> you don't update another thing inside a get of a specific thing
>> of interest.
>>
>> think of what are the cases where the rpn update is really needed.
>> think if we should have a constant workqueue refreshing it if not
>> idle/suspended. Think about all the consequences of the updates
>> and removal that you are proposing. And always making sure that
>> that that igt freq test is reliably passing.
>>
>> But something is strange in the current proposal.
>
> Agreed. The issue was we needed to get updated RPe. Why do we need to 
> update RPn? That is a fused value and never changes. SLPC min freq 
> changes with RPe. So we need to ensure we read SLPC min every time (if 
> we are not doing that already).
>
> Thanks,
>
> Vinay.
>
In that case the current implementation of updating RPn wrt Rpe is not 
required anymore, I will remove that. So we will update RPe only & while 
reading
>>
>>> Thanks,
>>> Anirban
>>>>> +
>>>>> +    return freq;
>>>>>    }
>>>>>       /**
>>>>> @@ -1021,7 +1030,7 @@ static int pc_set_mert_freq_cap(struct
>>>>> xe_guc_pc *pc)
>>>>>        /*
>>>>>         * Ensure min and max are bound by MERT_FREQ_CAP until
>>>>> driver loads.
>>>>>         */
>>>>> -    ret = pc_set_min_freq(pc, min(pc->rpe_freq,
>>>>> pc_max_freq_cap(pc)));
>>>>> +    ret = pc_set_min_freq(pc,
>>>>> min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>>>>        if (!ret)
>>>>>            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>>>>> pc_max_freq_cap(pc)));
>>>>>    @@ -1339,7 +1348,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>>>>        XE_WARN_ON(xe_guc_pc_stop(pc));
>>>>>           /* Bind requested freq to mert_freq_cap before unload */
>>>>> -    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-
>>>>>> rpe_freq));
>>>>> +    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc),
>>>>> xe_guc_pc_get_rpe_freq(pc)));
>>>>>           xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>>>>    }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> index 5e4ea53fbee6..f27c05d81706 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>>>>        u32 rp0_freq;
>>>>>        /** @rpa_freq: HW RPa frequency - The Achievable one */
>>>>>        u32 rpa_freq;
>>>>> -    /** @rpe_freq: HW RPe frequency - The Efficient one */
>>>>> -    u32 rpe_freq;
>>>>>        /** @rpn_freq: HW RPN frequency - The Minimum one */
>>>>>        u32 rpn_freq;
>>>>>        /** @user_requested_min: Stash the minimum requested
>>>>> freq by user */
>>>>> -- 
>>>>> 2.43.0
>>>>>

