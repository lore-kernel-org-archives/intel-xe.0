Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E1A10FC45F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 00:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937C010E21D;
	Thu,  9 Apr 2026 00:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnBUNrjF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67F910E21D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775694413; x=1807230413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5lxrSGDzudvkjusedbwUCFm27kOSF4iweL81pG6swhk=;
 b=YnBUNrjFWQwTrHyaXXp5mvXBa7GQzo5xH79EgSgviJd+5Tl/A7E3hcjc
 3Bc1v0iw5mzmQ9kDsqW8ok/KAnYDorZc+P7mwQ6X2EKTp2t/gHnzxkimD
 TH1aaYJa3InoLWHnhFUBRCA6oNEWJr3GRnrVsfuB5aXDlpyVcUSw5AWAs
 MCI3vFRjVhJD1uFrz893vW2HCzjFA3jKFmdmzpzxQqfqL1g6UXt9rAHbW
 xaWKov2cPbKVXFJjd4LAEods8cg61ixD5KWikOoIQiRxdxrQ8rrThtqlZ
 3w5yzlL0SErU3zkRsKWrdL3f0Dn0rx6oj2zuoeQ7pz6CJ94v27f/KtjGZ A==;
X-CSE-ConnectionGUID: ARdQTvv5QS+ZR34d68ZDSw==
X-CSE-MsgGUID: qq92WpK+T2G5L2JDk5g/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76881083"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76881083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 17:26:53 -0700
X-CSE-ConnectionGUID: 2oVrFvSeQ7G6knCrlQ2gIw==
X-CSE-MsgGUID: sE/q2NJiQCiKF6yoBcaCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223859143"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 17:26:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 17:26:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 17:26:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 17:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYGb7uTTj9s11L72mgC/l7bCi5Y15KNCpHnc5oQAjewOnx3xkv+Z92UKGVT/Qy8YUnMvu5qnmlsRnR7sUQhWuKhpLchJaL/IEY9iOF/FJ29HpgyrLjtHsnGDxta+7lOadITAxow7mzQlLzMx2ChpCznCvDKuzka+1aBnuDM+q7E714ktWhRCs61tZPxdkEpdlOhw3ifAJZKEimp7HIMG/Mx+UUlR492oPMBOJM0xSBkrJm77iYEtR8zVzF55U6i4M5YAsu5ElmPQFsdNeK0Fr12p4B7hKBCjuifJwOl8xrVRjgGvqGvQ1ISmCuJ3WR034WvByXdTr0u6kcVqpSZj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyNa/Lt9+2ZJzQPHyvAYmS2HfNdbT7BQtP8tQeA/uZk=;
 b=ikuCeubRABoPOg6ugHKBifpmd+nVUdxNEE+EU4I404r2mar50S8T/gbh5l3FFfhIGl/KhMxFqflDfkyr+RTl+0cRjG/TjbWxgBCddzwUsV8gPMxcpY7VePDUmLSgXhcrpl7SHZv6uIHJCs68b4FA60Kl06zRWwkQo8lhJi5hAyLOYsy902Ajxy2blAr/q//7RA1arnmEWIiBiI+w4WFmVc37YoUMERPbW2diIXaOLSpfwq4WxheJnmldQz0sm8OxEoMYqdTr/2E1Xz9HMA5O/Iak4Xw7dWQ9nPP9QMDnyyWNDqMd4EAB1Dvcat44u5M0GGJOfuZR6CEsjf/HaKUQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 00:26:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 00:26:49 +0000
Message-ID: <47f371bd-a8b2-4319-91e6-f1bbc4fe89db@intel.com>
Date: Wed, 8 Apr 2026 17:26:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260408182130.9305-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260408182130.9305-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:803:104::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: e749cb59-343e-457c-d9dd-08de95ceb0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: OjhniHQHlO0bLTGvbXtRifW98Kn8uyzBFDTcex3QyDLW14j1KHm0TISVRPyrfKeF6Zb1wJUDmgsZBCZJbKpvwVfwt0vjqTb3Av8AYzh3iIfR1qleVCvwTDXm+2gVllDbHLAueWCKJDvQcrLXxWu34Mt0vcTf32tIBiH25E1u6kN3/vodCvqi4k1MXJhDTGGZ8sop6cEWTKSXYqd1Ubn2+EXp0cU9+HiwGp5npId8y0zdtRRh/C7iq8M8v/o3pNu15KIathfDS+7DtEBv2SKTKi5wqMdEXKxSaEP142qvCTeCTd3E+7BjjIvF10bhyUGWX219yJVaUaFyxgrVTF8KC3WQu/CalsCIcQ3Iae5dXqpxXNK5ZIPF5fibEuB0SOMjLTYakP02FUo+TFHLLHCdx9xAr/SKWc4LJBCn+i3I97/y8WB7J1IRw9AejrVgOgcZySEbnA3dgLEvqEQP97JudtCqimPhDIQ3TeBpsEDPlGnjQVw4SSB4LGTzTJTgkgl2y7yEhl4OlBLmfvhOjoOZWN9xjLSMP11n7qrvfKu8CSfqiCmbgold4bg4xTRVFsBwdWHfKheR0GjtCu4pK3XPHgqxOCcNG+RGwakTSDKhuVtXM03Y+PEbGLdaeDzU32/SQcmKeXG+sQsKd5+KUaYzNSqRF+oxbfHEriXTyaebkeSphMmUVwP19OcNEUjudR+K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhsTnowWjdHMEJBWm1OTndqbWNxN3huQ1dseTBYcHVGL1RibnpqUWJiY1Zk?=
 =?utf-8?B?NU5rRlVCME9PbzRWcW4xNzE3MTZZclZDWE1nelpCQm9KUkpMU1k2dmQwOWhk?=
 =?utf-8?B?UzRXTTVyT1RpbjZMMkh0VkVvTStIOGE3akNTdC96ZjRYZDRrZjR6MWJEdVRO?=
 =?utf-8?B?dWF3VXpyWGcrVmxsaDJVdHJtMStjUit5SmppUGRMNXZBa3Q4L29aNkxQUTFM?=
 =?utf-8?B?TElBSm1aZ09ZWEhtOFl0QS9PMk1zSGtzc01YL0FkbVU4bldJR21BdTZUYzhy?=
 =?utf-8?B?aDh5eFQzYjVlbEMrVmdYRm9VUXdDbXhOR0JGUmI3dkNCL0tja0ZwZS9JY0hU?=
 =?utf-8?B?VFl2aEtrSU1HNlVpUGg3L2Y5SEZoZnV6bG12UW8vTmhnV0orZ0pqOCs1R2Rp?=
 =?utf-8?B?ZllaSnJiZGh4dm00REkvc3kzS2Y5L2R6cEhxSHdWWS9TZnhMeUxiMjdlcDgr?=
 =?utf-8?B?M2M4RmpCdytVeTUzVmtMVUhobW9KRlhSRmxJdE90ZTBzL1pkMFQyb3BKM0FX?=
 =?utf-8?B?RkRLd3o5M2ZBRlBWRWpPSW5HREluVXpudm5XVmZBd0JEYmkyRUNaYlBYQk1Y?=
 =?utf-8?B?dTltNHI3TFIwNDk1a3R5MGdzTFFJdFBpNUprRGgxRE53UXlCUFM5Q2VOUmVD?=
 =?utf-8?B?NlBpRStoeUN1YmdIZm53aktleDRkMmVJRWI4R2d5ZWxMUXVkVFJiMnZzQ1RH?=
 =?utf-8?B?VEI4Z0MyVnE3eUl0N0xxWlczS2M5OXhndHl3ZURQdk54LzdBMDJLUHYvZEFu?=
 =?utf-8?B?eitweWdsWG5hQ0JOU21UdGlVRmN1aWhvUkdTUGFEaDVOSjkyNGliaWhaaWo0?=
 =?utf-8?B?d0NVakd1bVNkS0hQQXM4QU5GS3lLa3BUdm9RQmlkdFdaM3p2K1A3YWJWeGtv?=
 =?utf-8?B?UEdyRHpoSTFtRzFJbXFWNThDQWlrR0lianJvZFp5RHQvcnhSdk92bmpWL3I2?=
 =?utf-8?B?WDF4cGYzaEwxaWc0dDltbDBrVGtFVjJVT1QzOVJxSkJ1SkIvaWNYeE15TXdM?=
 =?utf-8?B?c2RwbjE2RGNPbjdzeElNTkVWNW92aEk5alFwMG1WZnI3Y25Fa0hqYUthekpx?=
 =?utf-8?B?Vk50eDZWMFpYZnk4Q21BUG5ZN1o4OEEyWEJzdm9VM2Npc01zcXJOYWxnQkI2?=
 =?utf-8?B?bWdUR3VMOWtOMmd4Y3d5QlFMUzZ3LzBLKzdvaU8xaHFkVzVmQ2JPWFMzRVNK?=
 =?utf-8?B?aCtuVGlXZWtmeHo5Kzlta09RT3NmUzFBVmdFcDFnVEJNLzBWNEpwVDE2eHR4?=
 =?utf-8?B?SzRSWVVOWFRuQ2xGeHNkQms4MFozd05zTTFtUm90YXkyYTNhNm1vT24xK0ZB?=
 =?utf-8?B?VHV4RUdXRzhqc2tOYzlHUy9xMlQ2d0VMWll6OTZyOWpnRTZjdU83YlFtYUpO?=
 =?utf-8?B?ajBuRG5sMXFDNHJubGVCN21ZYTBJSEVXV0t3TFVISVc2cE1xTzZORFJ6SDFT?=
 =?utf-8?B?cGdSRnFraWVIdjRNeXk2L2R4UjBVeFFraVp6QTFUbEx3OHZ3UVk4ZDJIdE4w?=
 =?utf-8?B?YWkrbEZYTnUxMjNCenJqRks2MVpiS3RyWFgwclpuYVYrbW1JNkZFK2VIOEp1?=
 =?utf-8?B?QTVUTk9VMU1nTkpPOWg2UExCcS9ZK2FBK1ZMYm44SnR6VVNHNVd2eDJDTXU3?=
 =?utf-8?B?UXNzRHNHV25yQ3NJLy9idlcxWWxEZ1NwYUdNNm42UVhIcy8vUElvdnc4Mm1p?=
 =?utf-8?B?b2pwc29DclJsK2lBVVZ1WkhqaXR1dW9JY2lGeE80bGpybnlBcnZEbkU5OVFX?=
 =?utf-8?B?TGF3Tm5wTWNBMTA3MlVsVFBBL1hLWjZWVGZVcFQvWnB5M3ZUWnhqVEh2S1FY?=
 =?utf-8?B?ZGVDbi93UWNuRnNwcEM2TzRsejBwazdEL0hBQ1l0UUlwdSt0QVBtQXVuMVJw?=
 =?utf-8?B?a3lZTlhpTXlXKzlCd1JNT1lGNDYvZkJTQUFSVklpNHF1NW1jcmE5S2VWcjJ5?=
 =?utf-8?B?KzhIVFhiZjFBcnVLclNhRlZmQVlyU212STVUQnN2dFM1Y2tNd2IvUTM2RElk?=
 =?utf-8?B?WW5sUW11azRkV1hIZUNwaHVDMm1OdDZPYmRuQ3pwU2ZoSU8wc3NnNGlsMFdj?=
 =?utf-8?B?UDdPaitpOGtLSFYxVTRwL2tCalpTK1lCS3FJZWtCRVRJS24zSVFkS011QXRZ?=
 =?utf-8?B?VWIxdS9vQlgxUjRtbjlPNGFNVm5wdGVjKzBoNXdqODY1QXZKckJucmpKWWRC?=
 =?utf-8?B?dlZrZm9qeWVGa056ZWhrRFM0V3FXMThPWVBZZGJ1N0pVb2F6QkRvQ0JoTGJW?=
 =?utf-8?B?bG1MMURNMUFYald5MUFBV2tXaWpQcE5SeHVhbVNJQkVYdDN0UDVvb3czdkxz?=
 =?utf-8?B?dzBpeHVsek9lZUtqT0VnZFJtdVhGbW1ERDRGbVl3QnpEVEVHcEF6Q0llOFlC?=
 =?utf-8?Q?d07j0EmO3HDUfjx0=3D?=
X-Exchange-RoutingPolicyChecked: rYv+kM03qKNCcYK5Hxz5H8pD6bUJaFmrhe7xRvUnRmHIZGOoH5qvRaSxR5Acj+wE42c6iHQ32eZYPg25xT4uUA9rkV2sVcrv9IQJefgTVKHiCD+o26CkfLvmH1NpAsTag2KMRZ17JfneCKr7ISj36w1YKUL/gADCwtzwIUv4JKbQBqHhtqmpFQ6kZH1qV8PEuEF2fY0uuSr2l38L4AxPNHOZSE01g5kPpJU+DQnkkEljcE9rIlEd0boXt5XEs/UzbBUWABVLNThZiBzC4UOJqR1enVy6vuxP2e62mfbQnPwb0FGS1Y9zgzHocrHdjMhDkY+aCR9z7HPixNLjASxHlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e749cb59-343e-457c-d9dd-08de95ceb0db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 00:26:49.8809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PYbvh1fn+wAV81LVvSVO3xR4ikoIYBhJj2GSWmLWFka+2LH0mMq+QRtGICpJq2EO9P6Z1zxNww3Em5KY33TuccNMkDJyt4iG24qsgpj1HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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



On 4/8/2026 11:21 AM, Michal Wajdeczko wrote:
> We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
> but it turned out that GuC also uses that type of messages in CTB.
>
> The following error was recently observed on BMG after adding VGT
> policy updates to the GT restart sequence:
>
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
>   ...
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
>   [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
>   [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config
>
> where type=3 was this unrecognized NO_RESPONSE_BUSY message.
>
> Note that GuC might send the real RESPONSE message right after
> the BUSY message, so we must be prepared to update our g2h_fence
> data twice before sender actually wakes up and clears the flags.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
> Cc: Matthew Brost <matthew.brost@intel.com>
> Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
> ---
> v2: rename helper, add more in-code comments (Daniele)
>      add and use g2h_fence.counter field (Michal)
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a11cff7a20be..ad8f28d255a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -186,13 +186,16 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>   struct g2h_fence {
>   	u32 *response_buffer;
>   	u32 seqno;
> +	/* fields below this point are setup based on the response */
>   	u32 response_data;
>   	u16 response_len;
>   	u16 error;
>   	u16 hint;
>   	u16 reason;
> +	u32 counter;
>   	bool cancel;
>   	bool retry;
> +	bool wait;
>   	bool fail;
>   	bool done;
>   };
> @@ -204,6 +207,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>   	g2h_fence->seqno = ~0x0;
>   }
>   
> +static void g2h_fence_reinit(struct g2h_fence *g2h_fence)
> +{
> +	memset_after(g2h_fence, 0, seqno);
> +}
> +
>   static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>   {
>   	g2h_fence->cancel = true;
> @@ -1331,6 +1339,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
>   	 * and g2h_fence_cancel.
>   	 */
> +wait_again:
>   	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
>   	if (!ret) {
>   		LNL_FLUSH_WORK(&ct->g2h_worker);
> @@ -1356,6 +1365,14 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		return -ETIME;
>   	}
>   
> +	if (g2h_fence.wait) {
> +		xe_gt_dbg(gt, "H2G action %#x busy: counter %u\n",
> +			  action[0], g2h_fence.counter);
> +		/* we can't leave any response data if we want to wait again */
> +		g2h_fence_reinit(&g2h_fence);
> +		mutex_unlock(&ct->lock);
> +		goto wait_again;
> +	}
>   	if (g2h_fence.retry) {
>   		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>   			  action[0], g2h_fence.reason);
> @@ -1508,7 +1525,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		return -EPROTO;
>   	}
>   
> -	g2h_fence = xa_erase(&ct->fence_lookup, fence);
> +	/* don't erase as we still expect a final response with the same fence */
> +	if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY)
> +		g2h_fence = xa_load(&ct->fence_lookup, fence);
> +	else
> +		g2h_fence = xa_erase(&ct->fence_lookup, fence);
> +
>   	if (unlikely(!g2h_fence)) {
>   		/* Don't tear down channel, as send could've timed out */
>   		/* CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN); */
> @@ -1519,6 +1541,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   
>   	xe_gt_assert(gt, fence == g2h_fence->seqno);
>   
> +	/* reinit as we might have already process this g2h_fence before */

nit: I'd modify this comment to be: "reinit as we might have already 
process this g2h_fence before if we received a NO_RESPONSE_BUSY reply"

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	g2h_fence_reinit(g2h_fence);
> +
>   	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>   		g2h_fence->fail = true;
>   		g2h_fence->error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]);
> @@ -1526,6 +1551,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		g2h_fence->retry = true;
>   		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
> +	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
> +		g2h_fence->wait = true;
> +		g2h_fence->counter = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
>   	} else if (g2h_fence->response_buffer) {
>   		g2h_fence->response_len = hxg_len;
>   		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
> @@ -1533,7 +1561,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
>   	}
>   
> -	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> +	/* don't release any space if it was an intermediate message */
> +	if (!g2h_fence->wait)
> +		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>   
>   	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
>   	WRITE_ONCE(g2h_fence->done, true);
> @@ -1570,6 +1600,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>   	case GUC_HXG_TYPE_RESPONSE_FAILURE:
>   	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>   		ret = parse_g2h_response(ct, msg, len);
>   		break;
>   	default:

