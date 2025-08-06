Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13846C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958A10E3C5;
	Wed,  6 Aug 2025 08:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atSJplwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5410E3C5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754469443; x=1786005443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iwnl3mkaW9lVqqnidT5jF4+0jcPytFwmnntB27JvyXY=;
 b=atSJplwYXt5tkZ3ZdPy2BQlaEnzpxXj8xX0jodoJ9g7MiRtFuR5pFAff
 wAY9Qi21B4KQ1xCrO3QBDzbv2VgXlRWLQq14yqAYY9ffBt06zs4f7xc+U
 B0xzzJQWgV2azxa3v5Qk4fRdMBeJCO6+40n7+MQjju4IATTwjlkQ+TLc1
 3jqtxVfjRqiinoq8RFAx7ZRAmLBlXWK12+b5MYcb1tjY38ZDxyMJTbRi2
 nAFvlOO0yLXe//dSAJZ/nktDq7QyNMkAw67SLFhaBEC2xQ/CvzRGi0dAE
 zN1GX5mdjtndvTLPqoH1NDMuj0/r2y+7AGX7Pvuo7U2eBdKQlxhO6VAyK Q==;
X-CSE-ConnectionGUID: cMdrFAFJTX+ljUtKnn3zdg==
X-CSE-MsgGUID: ZfdMbx+lTn2PVIvW/DJhnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56857110"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56857110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:37:23 -0700
X-CSE-ConnectionGUID: BvRe0NmoTT6Hic0Vr5QM4w==
X-CSE-MsgGUID: QGuPgM6STU2azBtwujzhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168966730"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:37:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 01:37:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 01:37:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 01:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3V+xvTv6cGK+lmSzZsRhnxmvIxfR26r70T9PFXINhhnq9BZ6tmg9BTJVzfXuQBFRA6f2kpFmjiqZKbEFyPfog6M789zXdbn00gv6AdBQEfxBYVqq+tY1jnuPJubPV1Ftzu3hXcPstkiYCOJUwqyh4bqmu8tEwVdiZ6ucvxtFHCsyHfppWU4WdDHglQBt6IJ7xPzJj3YEcYbLPiPpzcvBTvKbRvJAvwwuF8bGnkmuJ+DaAw39RyI6XnArPjvQB9GHs9/E8U99+OV0BR1Xj3racl2PchNXPXL7sMWrQabsEdkbt4Nt85Sv/ZNxpRwGZeYBWIbamPsWm69qEMYlIrQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LgU1H6EFbtg0CMD/DGQqtt5+k2nR3qCS3+FrE8WUgI=;
 b=JP4m90ySIuMzeMabFMq/CHLGIAWRINpwVFIhetKGAx3N4FzjM5SM9mUR5dtnPwO27BHutyuqebMEjk2kswdzVInf+y8IbVgg2YkVDPeiNvbn7zb6dUrVGHLKME6PAB4+SRQWE00R5yfEToTpCb5YIABQufygQUEJKF12qbkBz/OPGbvOTwQHJHfUeDMeZMQSFJxnLzzKT27sT45ZijBgihWQSTnzBtqJ/l29mFgV6kZaia/LTPC5Dm8FcWOQegzXGa6NBu/JdiIn8piq8uwBHjq8sv7SwYk716wFTI/4Whtp72C2qOCCArrGaP2UgAD41sHc9MLRkHXo+6toU/g9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 08:37:19 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 08:37:19 +0000
Message-ID: <7a670853-0c61-4d8b-adec-41e08594d696@intel.com>
Date: Wed, 6 Aug 2025 10:37:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/xe: Don't update wedged mode in case of an
 error
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <matthew.brost@intel.com>
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
 <20250731123756.29259-3-lukasz.laguna@intel.com> <aJKCfFvucbl-7lKN@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <aJKCfFvucbl-7lKN@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY8PR11MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ed9747-f65e-44e6-7ed6-08ddd4c47459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U04rT2c0MW9IVVRVSmVEbVlIVjZSUEJQazBCK2RHVWlSS1NmT0xSbU9XKy9W?=
 =?utf-8?B?ZkllMXpSRjZCOUdzSWR2Uk92bmkyNlVodVoxMGN4K0JDdkNUSnhjaml3bzFs?=
 =?utf-8?B?czVJYnRZTGNabkNkV2tKSnU5SUlJMmVOb2NWcmY5SDNZQ3ZWK0V5cEF6dkFl?=
 =?utf-8?B?UlNyS1JZM0F0cEVqUHB3cStjRjBOYVBzRHJ1U05lcFpWVENhcG5tTngvRkp3?=
 =?utf-8?B?a3F3OCtHVEtuZnhwVFA5UksreVl4eDdNaDZDTXZkbEZDUy8wRmJaY1E5azBR?=
 =?utf-8?B?T0FlYkNvRWYvczNiVmZCUXE2OGsvRk1seG9LM1h2NXBXSCtCRnlwMk0yYUFp?=
 =?utf-8?B?ejMzMEttOHhGYlNKaEV2TjI5TkFGVkl1V0J1YnowLzdtdmlkTmtoV1lSQ3VN?=
 =?utf-8?B?Wlh0ZW5QVWIvOThSdFFWL2x1S05iNHF6dzJoV3lGTDNMZHpsVXU4NnByMzJP?=
 =?utf-8?B?NTJpRk5SaW83MlgxeUJ1aGUrV0lnV3FIUy8rQWxOczhQbzUxR3dJSEVhbTdl?=
 =?utf-8?B?K2tPSG51M1pjQzhvQW1pQ0VhT3kxT1ZYN2RoRXc0SngyazlKaEo5WUZ5U1pt?=
 =?utf-8?B?ckhUaTVENlBKNFN4ekxYY1lqeGdDc2E4OGpyVkFkeXNockRKb1Y1YjZCclJK?=
 =?utf-8?B?MlFnb25ZYjRSRjF3R0VpWldYWlVtN3JIV201QWhxb1dYdXhkbUpaWEE1NTRo?=
 =?utf-8?B?emhJSE9kbzYrVGt6VlpDeGxKU0RuWHpsSXJ5RVZYUE0vaDhOUUJZRWd4RkQ0?=
 =?utf-8?B?Z3RhT0c4RmNadkpCK0QzSmEwU0M1aUhYUkZ4VjhDNkZZQWdDZ20xWW5tU2lu?=
 =?utf-8?B?RUVwMEdnV3U0RXpnM202TkhRMkN2Zi9vN3I2MnhyMFppeGN5ZlRlRWQxZW1D?=
 =?utf-8?B?NDlKdzc5THA4SlNham5QLysvdXRCbGRXTEgvczgvTjZOMXRoc3JNdWFIb3F2?=
 =?utf-8?B?Ylg0dStpYk9vQ0pOUXBoUjJpMDdRNVZ4UENlQk1oWFdCRXlINXBMWFdYazNM?=
 =?utf-8?B?eDJRaFVOVEJZVzg3M0ozWGQrbFR4emEwNXZ5Rkd4Z1k5N2R4Q0I1dUtUdE9R?=
 =?utf-8?B?L2RlejhFT0hzWmxMZzJnR2ZFNmVNZnNrQVdiUkVObWQwbDNIcStGUG02aTZR?=
 =?utf-8?B?OVFxTXdITE44bElWUE1ac25tUUg0dTU0akk3aDF4ajJsV3ZLRmoxYkRRTmFR?=
 =?utf-8?B?aFc3dmZ0eE5HeDdYWDdUQk83c0I0WldKdXF0NjUwNnFrNVhIbXdxV0hqbGZS?=
 =?utf-8?B?ajcvRHM5VHY1cWFzWWVBaTVkanF3ZE5HTnluUkZFU1d3SUMrVlUrVU5DZDY3?=
 =?utf-8?B?VEJRTjJNK3V2SnllOEVXU1M0TmluZUJXOXNaMlRjZlBlRWwzcmhCNDFYZkd2?=
 =?utf-8?B?enROQjQ3dUdoeGdLRFRrU0pIbVp3UHNjUk9Gc0NFZDI4Wm81SHd4QkthcnVF?=
 =?utf-8?B?SEJWUlVBT2ZTMk1BQ082RnE3cG12Nm83WHNtbDJMZVUybTRQMHZ2U0daWDFa?=
 =?utf-8?B?cjhKSGdrNTQzNVg5c29mR1M1cWNxUWpLelRYdzE5cm5EZDBNcDhDZzlnTW9U?=
 =?utf-8?B?TVNEdEVTRWhMSFhtcjF5Y0NHVTUxbEJMblV0MGZhY3B3Q3ZjWXMxdWxWMDRv?=
 =?utf-8?B?OCt0eGdVaDBOeW8xQlBObXI0N0l0Q0xsbVIvcXhEdEJ6eHVpWXlVUERXclB3?=
 =?utf-8?B?SjRtZFBUS2xNckE5Z0JvSVhqb1NtcXFVWVVvL3ZKa1ZOeEMxWVYxM09SVVow?=
 =?utf-8?B?NWxTS3RyZTVFS3RwWWRXNXpRWnpUL2xlT1lPTFdJWExvSHR5emIxYmMyODFz?=
 =?utf-8?B?M2VrQXoxQXJBK3Z2aHZDNVI0UGN2NjVkc0dOQWwxUVlRTDBXbk1PZy9FeWJm?=
 =?utf-8?B?aWFyNlVEM3orVW80QmFVb01TTTR3anJkNHBsYXdvWkd4QkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZONDRnSXVDZVdudU1lK0hYWmdnMUtjN2FZOE5UaXNjNVRiUG01STdFTU0v?=
 =?utf-8?B?RFdiaWplOHZ2cTBFQzVJTVVvekx4dTQ1TEdXRW04STZ5czluNUdMREhoNmRt?=
 =?utf-8?B?T0RIajQvd25yelFrVFRscEIrL091bldNNm8zak5GVUl4OHUzRHZtWlpPUTEv?=
 =?utf-8?B?NGlNUVArcnFXTTZkRGgwdmppbnBlSnpNeHFrTjFRaE5rYVFibU0wR1ZkZW91?=
 =?utf-8?B?dEpxc2hRaW14VWh2WENNUWZxZFlxYTRLSG9WZ2xlWEJCRHdRa3VKRjZJQjVH?=
 =?utf-8?B?YndQdTdXZDJaRVZGWUFraE50VXcrREYrK3ZobkQzQzk5T3FNZnZHcTA2TzR6?=
 =?utf-8?B?MDZjOEVWb2hEOHlyT05RWU8zWXRwRTR0TmpXdzlqZUN5NHNRckZMdkVXVU4w?=
 =?utf-8?B?d3dhSkt6K1Qvb0dKZ1RUWFdBWUJiZmNqeWoxUFY0NnZMMEM5QVFRRDRsUU0y?=
 =?utf-8?B?Ym1tUEpoZ0JWVmpJQnNDWnRXQXpRNU5XdlZNYUhackc3dDVLYUtwbzJycytw?=
 =?utf-8?B?ZlBsQ3VXS1RnY2M3YWFpT3BzS1BZYzF6cXhpWXRYdjN6NkVBeWdhT3hoYUxV?=
 =?utf-8?B?ZHB5THVSZnVManFBV1hVL2pJRmRDMUkxWnVVdXIrNHovaVE5SVJTM0RpZ2FD?=
 =?utf-8?B?RnhYRndhOVZGN05aNVJGbGtUWHJEdkRKSzRuRlVrNkcvcjZPN29kZmhBbS9N?=
 =?utf-8?B?ZkRlaDRlZEFLSFBkSUVSZVdRN2VtWmczYXdYK05wTWFwQmZLR3JJUzBpMERj?=
 =?utf-8?B?OXJjT3BCbGY5ci8rMzhvSGRKRkVLb3lHTmtEK3R1VnhwSkRLVCtLcjZXL0py?=
 =?utf-8?B?dUQvYkp1aFd4VDZHU3J4M0hKeW1reHpOUW82elRnZ2tDVjg5K0FSNkltUDBK?=
 =?utf-8?B?UjRuaTEwL3VSMEtvbzQ2TlNOV3cxV1NkdFlUR0x5elczZDJMZFFnTklGcEpE?=
 =?utf-8?B?RWplSXkwNGZaTk85Z0JrbGhsaDFmV01lUHg4RHBybjc3ZnBJNnR6YVdzTks1?=
 =?utf-8?B?c3BTUFVhSkk2eDZmaW9lQmpTWnBqT00yWmRsaWF4V1IzWnRnSXQ2NHRFOEpE?=
 =?utf-8?B?bnE0NDhyeUdqZHlkQkpxS3ZmNm00ZlhhM1greitTUkh4NHBpMEhUaCt5OGlS?=
 =?utf-8?B?ZGdndzhmWkl0RlBRM1U1SFErWVNHaW9ybEp2TnMwbUdTMG5HUTdKYVV1VEh1?=
 =?utf-8?B?b3NoeDR5TkpDY2puVTQ0QmpHS1B3WkhZb09JU3JGWUxPcG9NSGlSMW4zUzdH?=
 =?utf-8?B?TTFBc25aeS9Qc2R6YWNORzJENTQvQ3ZPVlhsTWlwRnhPWTNCWjZBYjR2Yzkr?=
 =?utf-8?B?Q05Dbi9NNGtodUQySzF4UktVSWlmL0pOQ3o0c25kSU1WbVJqeFdWVEZONUlJ?=
 =?utf-8?B?N2JRZkZMbUZTemdCeTd1VjY0MDJod21iSTBhUkVEdmNBaHRzM1BMK0FoelB6?=
 =?utf-8?B?NVBqeUgyZjVFSitoaXBLZkE0Uk1MTFJRUVJ4SzFIYnNGZU1XQ3F3c1BJS3FX?=
 =?utf-8?B?MUp1c2hHWU9FeW45M1o4SHpxdDNiVXFkYncvenlxSHRLTmFMUzZjVm5sQnFY?=
 =?utf-8?B?ZGxnbEpGRW5WMHArcHZaMTVUN25pUFgzRjc2YllsVWk3ekdRbWh6MXlxQVBk?=
 =?utf-8?B?Skhib0tXcjZmaTNWazFybUIyeDU5ZWVWV0ZMaDhqY0lPcDhBRUV4VlQwZFN5?=
 =?utf-8?B?T2QwbGlNb0RHbWhTaEVBWEh4dUNwRnJUdkxZM0kvbTNhUlY3bXVGU1VCWTJ4?=
 =?utf-8?B?WmhGMXJpRHpYWDhXUkRobUQ3NDBZRnM0MjNJWTVtbE9WNmtSWkF5YWlEVGpP?=
 =?utf-8?B?ZFA5RWhIQXVVYjMwUjVDSmxUVGNUVjRPTGlJNG5ocUlaeGVGNVVZZEVWTzNl?=
 =?utf-8?B?QmNXYUhSckZJNGpJRUFuRDl1NUtZWVhpT2F5aWtLSUN0QUNqSGoxQmxWUDdQ?=
 =?utf-8?B?dCtIeGdGOEhWTTNxUjcyaTc2L3JUcHYwRVNVK2JNMW0zTHNXdXp4UzJxbUR3?=
 =?utf-8?B?TUR3N0FXb25yajF6M0NteDJtNDRKZERSSWhyVTY2bXNIQWZObjRLRGprdGpQ?=
 =?utf-8?B?ZHNsWHVwdFJXVGNSd01rYmlzYzVBRzBOaituMGtzQ3RxbWJNTkZ5VjRFQ05L?=
 =?utf-8?B?YXFkM3hvQzBLd3hhanZqbGVKcGIybjFuNi9Zc09aTEgvbXVQOTdLRHIrUWlD?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ed9747-f65e-44e6-7ed6-08ddd4c47459
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:37:18.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/u70qR/cicWhYvAOPp1yd+ZEOtEbldLf2qAsFG9bvpa015phQ6LOniLA14cz5n+ChQiH0lXM9U7hz/tT5L5Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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


On 8/6/2025 00:15, Rodrigo Vivi wrote:
> On Thu, Jul 31, 2025 at 02:37:54PM +0200, Lukasz Laguna wrote:
>> Change driver's internal wedged.mode state only in case of a success and
>> update GuC's reset policy only when it's necessary.
>>
>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v7: Don't introduce XE_WEDGED_MODE_MISCONFIGURED enum field (Michal)
>>      Add needs_policy_update helper (Michal)
>>      Rename wedged_mode_set_reset_policy to set_reset_policy (Lukasz)
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      | 72 ++++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
>>   4 files changed, 68 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 16b2e306559a..8aff93401eb9 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -251,14 +251,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>   }
>>   
>> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>> +{
>> +	int ret;
>> +
>> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>> +						       !(mode == XE_WEDGED_MODE_UPON_ANY_HANG));
> mode != XE_WEDGED_MODE_UPON_ANY_HANG please

OK

>
>> +	if (ret)
>> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>> +
>> +	return ret;
>> +}
>> +
>> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
>> +	struct xe_gt *gt;
>> +	int ret;
>> +	u8 id;
>> +
>> +	xe_pm_runtime_get(xe);
>> +	for_each_gt(gt, xe, id) {
>> +		ret = __set_reset_policy(gt, mode);
>> +		if (ret) {
>> +			if (id > 0) {
>> +				xe->wedged.inconsistent_reset = true;
>> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
>> +			}
>> +
>> +			xe_pm_runtime_put(xe);
>> +			return ret;
> Why to return on the first GT? perhaps we should continue and just leave one
> behind?

But why continue if we already have an error on the first GT? If it 
succeeds on next GTs, we'll end up with inconsistent state.

> perhaps we should have a 3 times retry attempt logic before giving up?

OK, I'll add retry logic.

> perhaps both combined?
>
>> +		}
>> +	}
>> +	xe_pm_runtime_put(xe);
>> +
>> +	xe->wedged.inconsistent_reset = false;
> then move this to the beginning of the function
> also ret = 0; up there

OK

>
>> +
>> +	return 0;
> and simply return ret; here

OK

>
>> +}
>> +
>> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
>> +	if (xe->wedged.inconsistent_reset)
>> +		return true;
>> +
>> +	if (xe->wedged.mode == mode)
>> +		return false;
>> +
>> +	return !((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
>> +		  mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
>> +		 (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
>> +		  mode == XE_WEDGED_MODE_NEVER));
> This is worst then the one above... please expand this to inside
> the function instead of this overloaded return full of not-or-and logic.

OK, I'll expand this to inside the function.
I just realized that additionally this logic can be simplified. Policy 
update is needed only in case when we change mode to or from 
XE_WEDGED_MODE_UPON_ANY_HANG, so it's enough to check this.

Thanks for review.

>
> Some wording about what cases are this in the commit message should be very
> helpful
>
>> +}
>> +
>>   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   			       size_t size, loff_t *pos)
>>   {
>>   	struct xe_device *xe = file_inode(f)->i_private;
>> -	struct xe_gt *gt;
>>   	u32 wedged_mode;
>>   	ssize_t ret;
>> -	u8 id;
>>   
>>   	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>>   	if (ret)
>> @@ -268,22 +318,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->wedged.mode == wedged_mode)
>> -		return size;
>> +	if (needs_policy_update(xe, wedged_mode)) {
>> +		ret = set_reset_policy(xe, wedged_mode);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	xe->wedged.mode = wedged_mode;
>>   
>> -	xe_pm_runtime_get(xe);
>> -	for_each_gt(gt, xe, id) {
>> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>> -		if (ret) {
>> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
>> -			xe_pm_runtime_put(xe);
>> -			return -EIO;
>> -		}
>> -	}
>> -	xe_pm_runtime_put(xe);
>> -
>>   	return size;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 1e496845c91f..829252db3a47 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -546,6 +546,8 @@ struct xe_device {
>>   			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>>   			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>>   		} mode;
>> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>> +		bool inconsistent_reset;
>>   	} wedged;
>>   
>>   	/** @bo_device: Struct to control async free of BOs */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index c4ea4e6d82ce..7f58d77e0ab9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -1033,16 +1033,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>>   /**
>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>    * @ads: Additional data structures object
>> + * @enable: true to enable engine resets, false otherwise
>>    *
>> - * This function update the GuC's engine reset policy based on wedged.mode.
>> + * This function update the GuC's engine reset policy.
>>    *
>>    * Return: 0 on success, and negative error code otherwise.
>>    */
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>>   {
>>   	struct guc_policies *policies;
>>   	struct xe_guc *guc = ads_to_guc(ads);
>> -	struct xe_device *xe = ads_to_xe(ads);
>>   	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>>   
>>   	if (!xe_guc_buf_is_valid(buf))
>> @@ -1054,10 +1054,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>>   	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>>   	policies->is_valid = 1;
>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> -	else
>> +	if (enable)
>>   		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> +	else
>> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>   
>>   	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> index 2e6674c760ff..9879aadd22d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_GUC_ADS_H_
>>   #define _XE_GUC_ADS_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_guc_ads;
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads);
>> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>>   
>>   #endif
>> -- 
>> 2.40.0
>>
