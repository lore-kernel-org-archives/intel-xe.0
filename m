Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73109CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 18:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D5010E8CF;
	Thu, 14 Aug 2025 18:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2l3s95R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446EE10E20A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755196787; x=1786732787;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WQJ6Agm0VJPN4JV6VtYVhCMEhrbPmrosMPZk0Gh2qqA=;
 b=A2l3s95R6DUWjlCKiEXdPMLOpE1TOGsczL0XcK0fnuWuulVCAHBw5LaU
 xZfGouO4F4ZZtj2GN2JWXcb32aE6DD/H/KZEiHSDUCutAsVDv2TtSjErN
 0O2W1aMFGo/cA92ofuuaf+w5wmFAd/lBLe1FY3zau73QmKRH2kzhPnZ9R
 3ZQuBxVGvKrqjkfSvCCZg4g/CKi/XeYl985J/zqyUZcH9aWon3Nu5vjYp
 Xwz9fAw34HEpifCQLz6Am7CNbsPKlV4pwX7QJgbbL0LiEPCxyZN9t/y0p
 DQ4CyAxjgbHpuk4ShBXSjrDmNHkjn94lH/qTSUyH/EYbveN53/dhrWMAy Q==;
X-CSE-ConnectionGUID: Fs41qKQ6QMe05DLiLMB9vQ==
X-CSE-MsgGUID: mh+ife+iSdqH+zQKl1hYGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68975685"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68975685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:39:47 -0700
X-CSE-ConnectionGUID: j+WrQ+BKRHuuHYAOtuBYnw==
X-CSE-MsgGUID: B2YrprNoQE2FVLyqwCLHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="171065680"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:39:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:39:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 11:39:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.64)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIc2Ygu7WriU1pJfndebmkoAqzZz/n0CsrZDyW+ngmhowZe1qIRs7GCB9DnsHKLlMrZjcGXKl77WrHPe36GEX3UnLnV/s7JJQvtqV/cNh4Tj+mtsMMUr0bJzluBsYjm2NJt7IIIDS6E5fI9rGW5Ob5medI/WTh4+n0XK0+hfDZtYVyVUV3sqaztlgjn/Zhts4Nob+zD+kQC/Wb5XnwQSbFTQrsX6zU5T+qwZgyvdUYZmWw1i4mmgbH762yGL1S9nV6q7XpgbCdZbUdH4pENmBtylbRpYFAzW2lbJrcJaWkPqqchuAD15AEdw/PGE02Hzx1rp1HkUx7AV80YazuuvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lB9YrVxSDum+MdEBNozKnjCjqeBzsaZnsJCdVMC4A9A=;
 b=d4xgbt4pZoUnE+B6JIWaAVENLpNW9ouHYXkxZMFiwcna4dokBBGBLiswCDxx8EnlHh+gsDoSreiVgvED4PQR75bWtWAkS+wIGxl1eR0jmdxCQHNcRcHu8fMEzs5Fk0HD3REf8cwA8ht4qTYCCYw83EGdPp1+4/4Gr+Uza9jF8cTR6emcW2v9FoqUQdt0I4M1f4OybRfG4WdzRbWsfwo69zI7g9EkKLfTmrlV5xcJ5EkoBiZjMa1tUawd0dWiZK87T9ILuB8LtKcEn997PLt//2GZLsizXUd8Kvy4m12ApAwPxjeFO9qtPkMMk1QWwI4NmYS6PVW1En1DDsGelM8aIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA4PR11MB9250.namprd11.prod.outlook.com (2603:10b6:208:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 18:39:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 18:39:43 +0000
Date: Thu, 14 Aug 2025 11:39:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 14/15] drm/xe: Convert xe_bo_create_pin_map() for
 exhaustive eviction
Message-ID: <aJ4tbEBMtCCkMooi@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-15-thomas.hellstrom@linux.intel.com>
 <aJ1jpOrhPEkIMA7r@lstrano-desk.jf.intel.com>
 <af2b09635de23fe4d5dd6eb57812979eec09278b.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af2b09635de23fe4d5dd6eb57812979eec09278b.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 04559628-2962-45fb-124a-08dddb61ef8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDlqbi8yeWV0aGNjN0FKTzAraDdwZmVJWndSaWMvWHR5YThscG9IT1d0dk9q?=
 =?utf-8?B?ZEFOcHZuQ2Q2S1NaWXNvRFhEclc0eXBWamZCdHJyd1A2bUJoQW9RbmVyYmF1?=
 =?utf-8?B?dERYRjVZb2V1aXhGUkV0REoza2MrdkZ4Mzd1QWIxdEhrV016QnZ1dVRmaVI1?=
 =?utf-8?B?ZmJvYXhnNWdVVlRCTWsxbWFIcGlRdVVhQUZZWEk0eHpkVWgvUndWNldGUFBH?=
 =?utf-8?B?eU9kUDZheHhMcHN4ekE1Vk9ucGgzbjY3OElDcHpidDJGWm9FTTZNcUc4UjUr?=
 =?utf-8?B?RUJGU1I1bTRqZXFwT2YydzFIQkFlaUpWYkF1NDBUdDNJdjVCcXErdFZMakxR?=
 =?utf-8?B?Uk1aYjNNTm01WjAvWm9xSDV4MkVMOERUY3l4dG1pbWg3OE9lejRyN1pJUmZF?=
 =?utf-8?B?VFhaQWcyNTkwRklRNGRwL1FPTEVGVmdtczgveXQ5bE5qVjU2UEZqaXBveG4r?=
 =?utf-8?B?OHhINmRuNWFHeC9iY1ZkQjFGOC9qM0h2NStvdEkzSEJoM2IrbW9kTHZZcDly?=
 =?utf-8?B?VHhPdXhDR21zN0cwQ0JEdUxtaUJkMWNxUlNLSlprZ3U2Zzd2K2xveS9nK1V3?=
 =?utf-8?B?anhOTld4dUV5RU9VcTlHUk5nUHpmTkx3dWkvc1hRaWtXRVQ3VFVjTjlOLzNz?=
 =?utf-8?B?cTNiSlA4VkFzMDg1cEMralVadDdyU3VuOTFtRFd3aERHb29aVlVrenFpM2JP?=
 =?utf-8?B?K3NSbHhxREtYclh2M1ZHSlg3Z1lQU1RoVHhTT2FhYTc1UW5SbkQ0R0dZSnhk?=
 =?utf-8?B?OFIrbWJaMVlIRFJ3VExESEtOckZzSkN2Yjg5KzdTSGJjQStRUzRyZ3NNamtD?=
 =?utf-8?B?NXFxM2Y5Y2RON2ZBcmY4dnpiUHRrTXlNTnNkRE1Ga0RiT3ptV3U4dVUxTXFB?=
 =?utf-8?B?YjlKQm1zai92NElGY08rZm9wZkJRM3pzejFXQWxxMDFCbnpqKzR1TDVDTkJO?=
 =?utf-8?B?UXBvTXI0Q2lEeTExUDVVVFNIWmpKQjFJUzE0RGhzejNZSS8rdGU5K1VDdEdj?=
 =?utf-8?B?NXdsakVIM1JMNGR2QjRVVXNFOVV3S3NwRDl1c0Vob1k3NWdESVluN3dMSXpw?=
 =?utf-8?B?QW9tYjBkK1Z3S2pmcG84Si9meGxlNnROSDFNeGtpMXNsazJITExITFJGd09X?=
 =?utf-8?B?bWFQY0JxeEJNd0RQMDA0eDJxT1ZyTzFTa1RRU0hiZHU5Y2tyaEtoVUpCZnVG?=
 =?utf-8?B?c0xYS1VNK1BhZmlWK0NlM0ZJV20rV2NpTFVmY1ZJUFFYKzlycVlZL3dpVEd2?=
 =?utf-8?B?VUhHdktBN3RuRFE5UlhkVk42RTlWV0V3U0VPNVEydW1XandDYzl4Q05KN0k3?=
 =?utf-8?B?RGxldVBIb0Roa1FBQUNaOEpjaHBWS2tzclF6WjlDTklnQ0p4cWxJbDFpazMw?=
 =?utf-8?B?c2FqdCtZbUE4enRJTEFsL2d4ZkxCWk04aXVGcS8xb1d2dVpxU0hJRmh3NUkx?=
 =?utf-8?B?OU5mN3dRV2dUY0dHME14bzlkaEpYb01kSCtoRWpDTm5KTGo3dllnUGYyZVE1?=
 =?utf-8?B?YVVOZGtwS2cyZDYxL0pRMzZEK1B2bGhhbVhYYUE5dDNCNUMyVXcxR04xL3Br?=
 =?utf-8?B?R01CRnpyakd3NU1zK3RROHlBYTZNWlh2eHR0cmJtaEQ4R20xL0lTNFVDSU4z?=
 =?utf-8?B?VVIzWTFPcmtlazFxaXkyVFBTY29UdzhvTmZMV2VkRVB5T1BxRmxvejFoUE03?=
 =?utf-8?B?TkdBQWxoRlpQRk5RWStZS1JlS0xYTUJrMC9WTkl4M1p1d3lpQkhIVExVbi9z?=
 =?utf-8?B?bmN3TGk3U2NQL3pDOWsrOVJiWXBSeWxXM2UwZTc5YlkxdVpUWlJ0L1NMYWlh?=
 =?utf-8?B?U28ycWtlZiswcXErSXo3UVgxS29FaWgwMmZYTnU1MlZJMElxQUhwZEZyMlo1?=
 =?utf-8?B?bmJkT2cvUFNRd3o0OW9RbmR0amcxN1E5bVpzdmFXMWs4MHRiSzh6cDRCSExn?=
 =?utf-8?Q?HQpqb6AMfzo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG45NlU0ZUhFelNQNFA3M1RLWlFiM3RBY1Q1VzR6S1BwRk9vR01kdEFOYk9z?=
 =?utf-8?B?WGd1djE0bGVRTldXZlkyb3N3R1V3RFlOR09zcjZSUWcyUlZZbEVUbGdQTzhC?=
 =?utf-8?B?K09RRGFOeERpQTIxWVl1RFlkRzF2SkFKc0hmMXdmQm9zUHZzenNTL0x5VFhv?=
 =?utf-8?B?N2hTOGVGTkwvL2JPMEZjMm1keDYrMnh6aEJ1UDBCS1JMNlREajV0SXBobTBX?=
 =?utf-8?B?SWlnRFMzOHl1YjdoZkVzSTMwcmVyVlBYd2ZQK3JvOHNvQUg4Z1ZUaWFWeVZK?=
 =?utf-8?B?V0NxN1B5Z2Q4ZTFMSXBqTFpiSVdJbFAxeTdUZE1tZDdPOFZ5QW5SYjM5TE5q?=
 =?utf-8?B?elpLQlhvdzZQTGJEWHVZMDY2dmdRcENYMldtbjdCMHloL2hLMHBWdUlmT1Rp?=
 =?utf-8?B?NC9qc0JnNW9MK000TjNQOGVIUjRWSXp4Y1BsSUFpZ3JBRDc2Q2lnM3k5aXhr?=
 =?utf-8?B?eGdNTk5zM0NzMmY5L2VOd2NEUnliVDcvUHBTV1l0cUVyQzFsZHE1ZlMzL0Fr?=
 =?utf-8?B?WUhCM2xDcXZEaVRiTHJsb0hWc0prYVFjSmJoVmgzUldyVVVuV2Y5Q3RDNEk5?=
 =?utf-8?B?QlcwdlJqSWFxNituKzR2cEFJZE0yeE1uc1d5RjZVLzFTZ09BYTgrdllCUGxM?=
 =?utf-8?B?UDhiRFVWSkZaODl5eG9vcXJqd2dydU55VUY2aThMSWxDUnljQzc0SzhVb3FX?=
 =?utf-8?B?ZjJhdjVFczZ6Sld1RDRhS2VYMGIzNWZZTHFlWWlTcnZJSDVDVDlZNUcva3Fa?=
 =?utf-8?B?bU8rYURnREp3aFVnYmFxam95dkZCcm5LUnNkdHNUOTFMYmxHU0NIM3UrRVp2?=
 =?utf-8?B?UFBJeFU2bXRpV3JMU1BtUmFUblY1bVZEMytXVGFmVTdJV0hodGRlU0J3cWlB?=
 =?utf-8?B?VThrZ3pLMjRubXJUOTFrWmV5TW02VHpod1VMUDZsNkYwVk5pZkdMR0lLMXVL?=
 =?utf-8?B?eE1qVytZL1hnK0VIQWRsQ1lIVmlRcnBFcGplTGZ4d3V2Z3JTZ24rS2M0bnRO?=
 =?utf-8?B?ZTdJdENjMTNXZXAyY1VXTkRkTzl3QjI2b0VtWDYxekR4UVBINHBNYU9qSlla?=
 =?utf-8?B?cFY3aUdYTFpuUkxCc3EvR0swL3hTUFV2cS9IditoWTVzckhaTHJjTGhROEU5?=
 =?utf-8?B?SFhmRkhsSGR5UHdySGp4dTZUcnIwNDBOMlV6b3hXTHUxSWx2ZzFuK2pYRXI4?=
 =?utf-8?B?U1E1WUsxUmsyVktvcEhwczlDTmpUaTdnemw0VkNMQmlja1JLa1lDUTRiK1NF?=
 =?utf-8?B?QTBGRGxtZk5NZCtiTVA0SFdsSkowdXJHYmUvd1MxNkx2Zm42dllwb3RmNmpO?=
 =?utf-8?B?S0twUTN2QVYycy84WjVhc016b2JrUS9wMTJxZHlxRXEza1k3dlRqNmx0U1M5?=
 =?utf-8?B?ZjJFS1dqaGhxQWRKdFhBb3dlMUtjcWhlYnNTdG9OVkQzcW12ZDFrTFoyU2d6?=
 =?utf-8?B?bXpzdGpHRWloeVBkTWVmYVVJeEdkTC9BVEx3bGNHOVZocE9sOURMWUZ4Zmoy?=
 =?utf-8?B?dnQ4YVBCb09JNTlCbTd5Rmxrdmt3MU9sNEFvYnFOL0lINUx2RUJJYjJTMzFw?=
 =?utf-8?B?WnY5MStaZU5FVkp0NjdLbUJJUzFrSDFYM0wrOGN3ZUMyRFIwTjFDdE9qV01B?=
 =?utf-8?B?NG5nMVJCWmVNZnlSME9nY1B2V0M4MkQwVm5BbERwTlBLbWFrV1BpMGxsakl1?=
 =?utf-8?B?WVp3Q2Y3RjBYZlNrZXJkaVB2S3B6K3hZNmVBdW1tZWZDc2toRGIzMXR1Smor?=
 =?utf-8?B?L0lVUldGcXY1clRYdjVCY2VxaW1MSVJ5akVKUnNCcXliK2ZiUWpEUEZ6TzZD?=
 =?utf-8?B?N2JSeWhBYVpuUm4yTk14M0pQSFBpTGtQMGdGQ2cyRTNqM3JwVkNvTUtEMWJ3?=
 =?utf-8?B?TFlkcTdFNkVuMTIvYjZ5WDEyNDdaSEJVeDFWa1hkczJrV2I4cWtheWtrcWZh?=
 =?utf-8?B?TXEySHI0WU5sZ3NNeGxCUzNicDZ5eEMxMElmMDc2aFQ1b1lSRFFieGFiUklJ?=
 =?utf-8?B?RkEzeFF4M1JrdnBlaDA2U0V3a2Y3TWpCRU1pNjIzTVI5bmZNakp3bWVXdWRt?=
 =?utf-8?B?c2s5R3l2SlBjZzM3cmV5bWhteUpGcWtIR05yaDZpYnlBMTdpU2RiZjVUY1I2?=
 =?utf-8?B?VmU1QVRIUFBuTTRBc05GQ2daTXpiV3UwQ1F0ZDBPUHE5VzZTZjF6WFd2cHV0?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04559628-2962-45fb-124a-08dddb61ef8b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 18:39:43.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roj8OtuKC0TdX6HJpuS2rDgyQ+dOp1XttHLrc7xJDKXQ8QbiZv02y8fyJIU1gWLyJqqFqLQGsqbS15ZX3JfLQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
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

On Thu, Aug 14, 2025 at 03:14:57PM +0200, Thomas Hellström wrote:
> On Wed, 2025-08-13 at 21:18 -0700, Matthew Brost wrote:
> > On Wed, Aug 13, 2025 at 12:51:20PM +0200, Thomas Hellström wrote:
> > > Introduce an xe_bo_create_pin_map_novm() function that does not
> > > take the drm_exec paramenter to simplify the conversion of many
> > > callsites.
> > > For the rest, ensure that the same drm_exec context that was used
> > > for locking the vm is passed down to validation.
> > > 
> > > Use xe_validation_guard() where appropriate.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +--
> > >  drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  39 +++---
> > >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
> > >  drivers/gpu/drm/xe/tests/xe_migrate.c         |   9 +-
> > >  drivers/gpu/drm/xe/xe_bo.c                    |  53 +++++++-
> > >  drivers/gpu/drm/xe/xe_bo.h                    |   6 +-
> > >  drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  24 ++--
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 ++--
> > >  drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
> > >  drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
> > >  drivers/gpu/drm/xe/xe_lrc.c                   |   7 +-
> > >  drivers/gpu/drm/xe/xe_migrate.c               |  20 ++-
> > >  drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
> > >  drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
> > >  drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
> > >  drivers/gpu/drm/xe/xe_pxp_submit.c            |  34 +++--
> > >  drivers/gpu/drm/xe/xe_vm.c                    | 119 ++++++++++----
> > > ----
> > >  19 files changed, 252 insertions(+), 171 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > > b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > > index d96ba2b51065..8ea9a472113c 100644
> > > --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > > +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > > @@ -42,11 +42,11 @@ struct intel_framebuffer
> > > *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> > >  	obj = ERR_PTR(-ENODEV);
> > >  
> > >  	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe),
> > > 22019338487_display)) {
> > > -		obj = xe_bo_create_pin_map(xe,
> > > xe_device_get_root_tile(xe),
> > > -					   NULL, size,
> > > -					   ttm_bo_type_kernel,
> > > XE_BO_FLAG_SCANOUT |
> > > -					   XE_BO_FLAG_STOLEN |
> > > -					   XE_BO_FLAG_GGTT);
> > > +		obj = xe_bo_create_pin_map_novm(xe,
> > > xe_device_get_root_tile(xe),
> > > +						size,
> > > +						ttm_bo_type_kernel
> > > , XE_BO_FLAG_SCANOUT |
> > > +						XE_BO_FLAG_STOLEN
> > > |
> > > +						XE_BO_FLAG_GGTT,
> > > false);
> > >  		if (!IS_ERR(obj))
> > >  			drm_info(&xe->drm, "Allocated fbdev into
> > > stolen\n");
> > >  		else
> > > @@ -54,10 +54,10 @@ struct intel_framebuffer
> > > *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> > >  	}
> > >  
> > >  	if (IS_ERR(obj)) {
> > > -		obj = xe_bo_create_pin_map(xe,
> > > xe_device_get_root_tile(xe), NULL, size,
> > > -					   ttm_bo_type_kernel,
> > > XE_BO_FLAG_SCANOUT |
> > > -					  
> > > XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> > > -					   XE_BO_FLAG_GGTT);
> > > +		obj = xe_bo_create_pin_map_novm(xe,
> > > xe_device_get_root_tile(xe), size,
> > > +						ttm_bo_type_kernel
> > > , XE_BO_FLAG_SCANOUT |
> > > +						XE_BO_FLAG_VRAM_IF
> > > _DGFX(xe_device_get_root_tile(xe)) |
> > > +						XE_BO_FLAG_GGTT,
> > > false);
> > >  	}
> > >  
> > >  	if (IS_ERR(obj)) {
> > > diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > > b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > > index 9f941fc2e36b..58581d7aaae6 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > > @@ -43,11 +43,11 @@ bool intel_dsb_buffer_create(struct intel_crtc
> > > *crtc, struct intel_dsb_buffer *d
> > >  		return false;
> > >  
> > >  	/* Set scanout flag for WC mapping */
> > > -	obj = xe_bo_create_pin_map(xe,
> > > xe_device_get_root_tile(xe),
> > > -				   NULL, PAGE_ALIGN(size),
> > > -				   ttm_bo_type_kernel,
> > > -				  
> > > XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> > > -				   XE_BO_FLAG_SCANOUT |
> > > XE_BO_FLAG_GGTT);
> > > +	obj = xe_bo_create_pin_map_novm(xe,
> > > xe_device_get_root_tile(xe),
> > > +					PAGE_ALIGN(size),
> > > +					ttm_bo_type_kernel,
> > > +					XE_BO_FLAG_VRAM_IF_DGFX(xe
> > > _device_get_root_tile(xe)) |
> > > +					XE_BO_FLAG_SCANOUT |
> > > XE_BO_FLAG_GGTT, false);
> > >  	if (IS_ERR(obj)) {
> > >  		kfree(vma);
> > >  		return false;
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index d46ff7ebb0a1..d8e15ebb740c 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -102,32 +102,23 @@ static int __xe_pin_fb_vma_dpt(const struct
> > > intel_framebuffer *fb,
> > >  				 XE_PAGE_SIZE);
> > >  
> > >  	if (IS_DGFX(xe))
> > > -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> > > -						   dpt_size,
> > > ~0ull,
> > > -						  
> > > ttm_bo_type_kernel,
> > > -						   true,
> > > -						  
> > > XE_BO_FLAG_VRAM0 |
> > > -						   XE_BO_FLAG_GGTT
> > > |
> > > -						  
> > > XE_BO_FLAG_PAGETABLE,
> > > -						   alignment,
> > > false);
> > > +		dpt = xe_bo_create_pin_map_novm(xe, tile0,
> > > dpt_size,
> > > +						ttm_bo_type_kernel
> > > ,
> > > +						XE_BO_FLAG_VRAM0 |
> > > +						XE_BO_FLAG_GGTT |
> > > +						XE_BO_FLAG_PAGETAB
> > > LE, true);
> > >  	else
> > > -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> > > -						   dpt_size, 
> > > ~0ull,
> > > -						  
> > > ttm_bo_type_kernel,
> > > -						   true,
> > > -						  
> > > XE_BO_FLAG_STOLEN |
> > > -						   XE_BO_FLAG_GGTT
> > > |
> > > -						  
> > > XE_BO_FLAG_PAGETABLE,
> > > -						   alignment,
> > > false);
> > > +		dpt = xe_bo_create_pin_map_novm(xe, tile0,
> > > dpt_size,
> > > +						ttm_bo_type_kernel
> > > ,
> > > +						XE_BO_FLAG_STOLEN
> > > |
> > > +						XE_BO_FLAG_GGTT |
> > > +						XE_BO_FLAG_PAGETAB
> > > LE, true);
> > >  	if (IS_ERR(dpt))
> > > -		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> > > -						   dpt_size, 
> > > ~0ull,
> > > -						  
> > > ttm_bo_type_kernel,
> > > -						   true,
> > > -						  
> > > XE_BO_FLAG_SYSTEM |
> > > -						   XE_BO_FLAG_GGTT
> > > |
> > > -						  
> > > XE_BO_FLAG_PAGETABLE,
> > > -						   alignment,
> > > false);
> > > +		dpt = xe_bo_create_pin_map_novm(xe, tile0,
> > > dpt_size,
> > > +						ttm_bo_type_kernel
> > > ,
> > > +						XE_BO_FLAG_SYSTEM
> > > |
> > > +						XE_BO_FLAG_GGTT |
> > > +						XE_BO_FLAG_PAGETAB
> > > LE, true);
> > >  	if (IS_ERR(dpt))
> > >  		return PTR_ERR(dpt);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > index 30f1073141fc..4ae847b628e2 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > @@ -72,10 +72,10 @@ static int
> > > intel_hdcp_gsc_initialize_message(struct xe_device *xe,
> > >  	int ret = 0;
> > >  
> > >  	/* allocate object of two page for HDCP command memory and
> > > store it */
> > > -	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
> > > NULL, PAGE_SIZE * 2,
> > > -				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > -				  XE_BO_FLAG_GGTT);
> > > +	bo = xe_bo_create_pin_map_novm(xe,
> > > xe_device_get_root_tile(xe), PAGE_SIZE * 2,
> > > +				       ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > +				       XE_BO_FLAG_GGTT, false);
> > >  
> > >  	if (IS_ERR(bo)) {
> > >  		drm_err(&xe->drm, "Failed to allocate bo for HDCP
> > > streaming command!\n");
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > index afa794e56065..5904d658d1f2 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > @@ -204,7 +204,8 @@ static void xe_migrate_sanity_test(struct
> > > xe_migrate *m, struct kunit *test,
> > >  
> > >  	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
> > >  				   ttm_bo_type_kernel,
> > > -				   XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > > +				   XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +				   exec);
> > >  	if (IS_ERR(big)) {
> > >  		KUNIT_FAIL(test, "Failed to allocate bo: %li\n",
> > > PTR_ERR(big));
> > >  		goto vunmap;
> > > @@ -212,7 +213,8 @@ static void xe_migrate_sanity_test(struct
> > > xe_migrate *m, struct kunit *test,
> > >  
> > >  	pt = xe_bo_create_pin_map(xe, tile, m->q->vm,
> > > XE_PAGE_SIZE,
> > >  				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > > +				  XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +				  exec);
> > >  	if (IS_ERR(pt)) {
> > >  		KUNIT_FAIL(test, "Failed to allocate fake pt:
> > > %li\n",
> > >  			   PTR_ERR(pt));
> > > @@ -222,7 +224,8 @@ static void xe_migrate_sanity_test(struct
> > > xe_migrate *m, struct kunit *test,
> > >  	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
> > >  				    2 * SZ_4K,
> > >  				    ttm_bo_type_kernel,
> > > -				   
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > > +				    XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > > +				    exec);
> > >  	if (IS_ERR(tiny)) {
> > >  		KUNIT_FAIL(test, "Failed to allocate tiny fake pt:
> > > %li\n",
> > >  			   PTR_ERR(tiny));
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index c9928d4ee5a0..82bf158426ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2343,16 +2343,60 @@ xe_bo_create_pin_map_at_novm(struct
> > > xe_device *xe, struct xe_tile *tile,
> > >  	return ret ? ERR_PTR(ret) : bo;
> > >  }
> > >  
> > > +/**
> > > + * xe_bo_create_pin_map() - Create pinned and mapped bo
> > > + * @xe: The xe device.
> > > + * @tile: The tile to select for migration of this bo, and the
> > > tile used for
> > > + * @vm: The vm to associate the buffer object with. The vm's resv
> > > must be locked
> > > + * with the transaction represented by @exec.
> > > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel
> > > bos.
> > > + * @size: The storage size to use for the bo.
> > > + * @type: The TTM buffer object type.
> > > + * @flags: XE_BO_FLAG_ flags.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction,
> > > and
> > > + * previously used for locking @vm's resv.
> > > + *
> > > + * Create a pinned and mapped bo. The bo will be external and not
> > > associated
> > > + * with a VM.
> > > + *
> > > + * Return: The buffer object on success. Negative error pointer on
> > > failure.
> > > + * In particular, the function may return ERR_PTR(%-EINTR) if
> > > @intr was set
> > > + * to true on entry.
> > > + */
> > >  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > > xe_tile *tile,
> > >  				   struct xe_vm *vm, size_t size,
> > > -				   enum ttm_bo_type type, u32
> > > flags)
> > > +				   enum ttm_bo_type type, u32
> > > flags,
> > > +				   struct drm_exec *exec)
> > >  {
> > > -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) :
> > > XE_VALIDATION_UNIMPLEMENTED;
> > > -
> > > +	xe_assert(xe, exec);
> > >  	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size,
> > > ~0ull, type, flags,
> > >  					       true, 0, exec);
> > >  }
> > >  
> > > +/**
> > > + * xe_bo_create_pin_map_novm() - Create pinned and mapped bo
> > > + * @xe: The xe device.
> > > + * @tile: The tile to select for migration of this bo, and the
> > > tile used for
> > > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel
> > > bos.
> > > + * @size: The storage size to use for the bo.
> > > + * @type: The TTM buffer object type.
> > > + * @flags: XE_BO_FLAG_ flags.
> > > + * @intr: Whether to execut any waits for backing store
> > > interruptible.
> > > + *
> > > + * Create a pinned and mapped bo. The bo will be external and not
> > > associated
> > > + * with a VM.
> > > + *
> > > + * Return: The buffer object on success. Negative error pointer on
> > > failure.
> > > + * In particular, the function may return ERR_PTR(%-EINTR) if
> > > @intr was set
> > > + * to true on entry.
> > > + */
> > > +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe,
> > > struct xe_tile *tile,
> > > +					size_t size, enum
> > > ttm_bo_type type, u32 flags,
> > > +					bool intr)
> > > +{
> > > +	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull,
> > > type, flags, true, 0, intr);
> > > +}
> > > +
> > >  static void __xe_bo_unpin_map_no_vm(void *arg)
> > >  {
> > >  	xe_bo_unpin_map_no_vm(arg);
> > > @@ -2365,8 +2409,7 @@ struct xe_bo
> > > *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> > >  	int ret;
> > >  
> > >  	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map,
> > > xe, tile, size, flags);
> > > -
> > > -	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> > > ttm_bo_type_kernel, flags);
> > > +	bo = xe_bo_create_pin_map_novm(xe, tile, size,
> > > ttm_bo_type_kernel, flags, true);
> > >  	if (IS_ERR(bo))
> > >  		return bo;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > b/drivers/gpu/drm/xe/xe_bo.h
> > > index d06266af9662..802e3c7d7872 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -108,7 +108,11 @@ struct xe_bo *xe_bo_create_user(struct
> > > xe_device *xe, struct xe_vm *vm, size_t s
> > >  				u16 cpu_caching, u32 flags, struct
> > > drm_exec *exec);
> > >  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > > xe_tile *tile,
> > >  				   struct xe_vm *vm, size_t size,
> > > -				   enum ttm_bo_type type, u32
> > > flags);
> > > +				   enum ttm_bo_type type, u32
> > > flags,
> > > +				   struct drm_exec *exec);
> > > +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe,
> > > struct xe_tile *tile,
> > > +					size_t size, enum
> > > ttm_bo_type type, u32 flags,
> > > +					bool intr);
> > >  struct xe_bo *
> > >  xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile
> > > *tile,
> > >  			     size_t size, u64 offset, enum
> > > ttm_bo_type type,
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c
> > > b/drivers/gpu/drm/xe/xe_gsc.c
> > > index f5ae28af60d4..83d61bf8ec62 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > > @@ -136,10 +136,10 @@ static int query_compatibility_version(struct
> > > xe_gsc *gsc)
> > >  	u64 ggtt_offset;
> > >  	int err;
> > >  
> > > -	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ *
> > > 2,
> > > -				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > -				  XE_BO_FLAG_GGTT);
> > > +	bo = xe_bo_create_pin_map_novm(xe, tile, GSC_VER_PKT_SZ *
> > > 2,
> > > +				       ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > +				       XE_BO_FLAG_GGTT, false);
> > >  	if (IS_ERR(bo)) {
> > >  		xe_gt_err(gt, "failed to allocate bo for GSC
> > > version query\n");
> > >  		return PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > index 906011671b60..d0a87d7b028b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > @@ -1452,7 +1452,6 @@ static bool pf_release_vf_config_lmem(struct
> > > xe_gt *gt, struct xe_gt_sriov_confi
> > >  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int
> > > vfid, u64 size)
> > >  {
> > >  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt,
> > > vfid);
> > > -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_bo *bo;
> > > @@ -1479,24 +1478,17 @@ static int pf_provision_vf_lmem(struct
> > > xe_gt *gt, unsigned int vfid, u64 size)
> > >  		return 0;
> > >  
> > >  	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> > > -	bo = xe_bo_create_locked(xe, tile, NULL,
> > > -				 ALIGN(size, PAGE_SIZE),
> > > -				 ttm_bo_type_kernel,
> > > -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > -				 XE_BO_FLAG_NEEDS_2M |
> > > -				 XE_BO_FLAG_PINNED |
> > > -				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> > > -				 exec);
> > > +	bo = xe_bo_create_pin_map_at_novm(xe, tile,
> > > +					  ALIGN(size, PAGE_SIZE),
> > > +					  0,
> > > +					  ttm_bo_type_kernel,
> > > +					 
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_FLAG_NEEDS_2M |
> > > +					 
> > > XE_BO_FLAG_PINNED_LATE_RESTORE,
> > > +					  false, 0, false);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > -	err = xe_bo_pin(bo, exec);
> > > -	xe_bo_unlock(bo);
> > > -	if (unlikely(err)) {
> > > -		xe_bo_put(bo);
> > > -		return err;
> > > -	}
> > > -
> > >  	config->lmem_obj = bo;
> > >  
> > >  	if (xe_device_has_lmtt(xe)) {
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > > index c712111aa30d..44cc612b0a75 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > > @@ -55,12 +55,12 @@ static int pf_send_guc_save_vf_state(struct
> > > xe_gt *gt, unsigned int vfid,
> > >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> > >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> > >  
> > > -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> > > -				  ALIGN(size, PAGE_SIZE),
> > > -				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > -				  XE_BO_FLAG_GGTT |
> > > -				  XE_BO_FLAG_GGTT_INVALIDATE);
> > > +	bo = xe_bo_create_pin_map_novm(xe, tile,
> > > +				       ALIGN(size, PAGE_SIZE),
> > > +				       ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > +				       XE_BO_FLAG_GGTT |
> > > +				       XE_BO_FLAG_GGTT_INVALIDATE,
> > > false);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > @@ -91,12 +91,12 @@ static int pf_send_guc_restore_vf_state(struct
> > > xe_gt *gt, unsigned int vfid,
> > >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> > >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> > >  
> > > -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> > > -				  ALIGN(size, PAGE_SIZE),
> > > -				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > -				  XE_BO_FLAG_GGTT |
> > > -				  XE_BO_FLAG_GGTT_INVALIDATE);
> > > +	bo = xe_bo_create_pin_map_novm(xe, tile,
> > > +				       ALIGN(size, PAGE_SIZE),
> > > +				       ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > +				       XE_BO_FLAG_GGTT |
> > > +				       XE_BO_FLAG_GGTT_INVALIDATE,
> > > false);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > index 92e1f9f41b8c..2b99c1ebdd58 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > > @@ -94,16 +94,17 @@ static int
> > > allocate_engine_activity_buffers(struct xe_guc *guc,
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_bo *bo, *metadata_bo;
> > >  
> > > -	metadata_bo = xe_bo_create_pin_map(gt_to_xe(gt), tile,
> > > NULL, PAGE_ALIGN(metadata_size),
> > > -					   ttm_bo_type_kernel,
> > > XE_BO_FLAG_SYSTEM |
> > > -					   XE_BO_FLAG_GGTT |
> > > XE_BO_FLAG_GGTT_INVALIDATE);
> > > +	metadata_bo = xe_bo_create_pin_map_novm(gt_to_xe(gt),
> > > tile, PAGE_ALIGN(metadata_size),
> > > +						ttm_bo_type_kernel
> > > , XE_BO_FLAG_SYSTEM |
> > > +						XE_BO_FLAG_GGTT |
> > > XE_BO_FLAG_GGTT_INVALIDATE,
> > > +						false);
> > >  
> > >  	if (IS_ERR(metadata_bo))
> > >  		return PTR_ERR(metadata_bo);
> > >  
> > > -	bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL,
> > > PAGE_ALIGN(size),
> > > -				  ttm_bo_type_kernel,
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > -				  XE_BO_FLAG_GGTT |
> > > XE_BO_FLAG_GGTT_INVALIDATE);
> > > +	bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile,
> > > PAGE_ALIGN(size),
> > > +				       ttm_bo_type_kernel,
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +				       XE_BO_FLAG_GGTT |
> > > XE_BO_FLAG_GGTT_INVALIDATE, false);
> > >  
> > >  	if (IS_ERR(bo)) {
> > >  		xe_bo_unpin_map_no_vm(metadata_bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_lmtt.c
> > > b/drivers/gpu/drm/xe/xe_lmtt.c
> > > index a78c9d474a6e..4ad468574174 100644
> > > --- a/drivers/gpu/drm/xe/xe_lmtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> > > @@ -67,12 +67,12 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct
> > > xe_lmtt *lmtt, unsigned int level
> > >  		goto out;
> > >  	}
> > >  
> > > -	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt),
> > > lmtt_to_tile(lmtt), NULL,
> > > -				  PAGE_ALIGN(lmtt->ops-
> > > >lmtt_pte_size(level) *
> > > -					     lmtt->ops-
> > > >lmtt_pte_num(level)),
> > > -				  ttm_bo_type_kernel,
> > > -				 
> > > XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> > > -				  XE_BO_FLAG_NEEDS_64K);
> > > +	bo = xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt),
> > > lmtt_to_tile(lmtt),
> > > +				       PAGE_ALIGN(lmtt->ops-
> > > >lmtt_pte_size(level) *
> > > +						  lmtt->ops-
> > > >lmtt_pte_num(level)),
> > > +				       ttm_bo_type_kernel,
> > > +				      
> > > XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> > > +				       XE_BO_FLAG_NEEDS_64K,
> > > false);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > >  		goto out_free_pt;
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 8f6c3ba47882..6d52e0eb97f5 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1340,9 +1340,10 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > > struct xe_hw_engine *hwe,
> > >  	if (vm && vm->xef) /* userspace */
> > >  		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> > >  
> > > -	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
> > > -				       ttm_bo_type_kernel,
> > > -				       bo_flags);
> > > +	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> > > +					    bo_size,
> > > +					    ttm_bo_type_kernel,
> > > +					    bo_flags, false);
> > >  	if (IS_ERR(lrc->bo))
> > >  		return PTR_ERR(lrc->bo);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index ddfad7506a82..fe0d15ab340e 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -35,6 +35,7 @@
> > >  #include "xe_sched_job.h"
> > >  #include "xe_sync.h"
> > >  #include "xe_trace_bo.h"
> > > +#include "xe_validation.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vram.h"
> > >  
> > > @@ -173,7 +174,7 @@ static void xe_migrate_program_identity(struct
> > > xe_device *xe, struct xe_vm *vm,
> > >  }
> > >  
> > >  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct
> > > xe_migrate *m,
> > > -				 struct xe_vm *vm)
> > > +				 struct xe_vm *vm, struct drm_exec
> > > *exec)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > > @@ -200,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > > *tile, struct xe_migrate *m,
> > >  				  num_entries * XE_PAGE_SIZE,
> > >  				  ttm_bo_type_kernel,
> > >  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > -				  XE_BO_FLAG_PAGETABLE);
> > > +				  XE_BO_FLAG_PAGETABLE, exec);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > @@ -404,6 +405,8 @@ int xe_migrate_init(struct xe_migrate *m)
> > >  	struct xe_tile *tile = m->tile;
> > >  	struct xe_gt *primary_gt = tile->primary_gt;
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_validation_ctx ctx;
> > > +	struct drm_exec exec;
> > >  	struct xe_vm *vm;
> > >  	int err;
> > >  
> > > @@ -413,11 +416,16 @@ int xe_migrate_init(struct xe_migrate *m)
> > >  	if (IS_ERR(vm))
> > >  		return PTR_ERR(vm);
> > >  
> > > -	xe_vm_lock(vm, false);
> > > -	err = xe_migrate_prepare_vm(tile, m, vm);
> > > -	xe_vm_unlock(vm);
> > > +	err = 0;
> > > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false)
> > > {
> > > +		err = xe_vm_drm_exec_lock(vm, &exec);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		xe_validation_retry_on_oom(&ctx, &err);
> > > +	}
> > >  	if (err)
> > > -		goto err_out;
> > > +		return err;
> > >  
> > >  	if (xe->info.has_usm) {
> > >  		struct xe_hw_engine *hwe =
> > > xe_gt_hw_engine(primary_gt,
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c
> > > b/drivers/gpu/drm/xe/xe_oa.c
> > > index a188bad172ad..a4894eb0d7f3 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -883,9 +883,9 @@ static int xe_oa_alloc_oa_buffer(struct
> > > xe_oa_stream *stream, size_t size)
> > >  {
> > >  	struct xe_bo *bo;
> > >  
> > > -	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt-
> > > >tile, NULL,
> > > -				  size, ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_GGTT);
> > > +	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt-
> > > >tile,
> > > +				       size, ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_GGTT, false);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index f3a39e734a90..33ad40418ceb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -88,6 +88,7 @@ static void xe_pt_free(struct xe_pt *pt)
> > >   * @vm: The vm to create for.
> > >   * @tile: The tile to create for.
> > >   * @level: The page-table level.
> > > + * @exec: The drm_exec object used to lock the vm.
> > >   *
> > >   * Allocate and initialize a single struct xe_pt metadata
> > > structure. Also
> > >   * create the corresponding page-table bo, but don't initialize
> > > it. If the
> > > @@ -99,7 +100,7 @@ static void xe_pt_free(struct xe_pt *pt)
> > >   * error.
> > >   */
> > >  struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > > -			   unsigned int level)
> > > +			   unsigned int level, struct drm_exec
> > > *exec)
> > >  {
> > >  	struct xe_pt *pt;
> > >  	struct xe_bo *bo;
> > > @@ -123,9 +124,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > >  		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> > >  
> > >  	pt->level = level;
> > > +
> > > +	drm_WARN_ON(&vm->xe->drm, IS_ERR_OR_NULL(exec));
> > >  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
> > >  				  ttm_bo_type_kernel,
> > > -				  bo_flags);
> > > +				  bo_flags, exec);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > >  		goto err_kfree;
> > > @@ -589,7 +592,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  	if (covers || !*child) {
> > >  		u64 flags = 0;
> > >  
> > > -		xe_child = xe_pt_create(xe_walk->vm, xe_walk-
> > > >tile, level - 1);
> > > +		xe_child = xe_pt_create(xe_walk->vm, xe_walk-
> > > >tile, level - 1,
> > > +					xe_vm_validation_exec(vm))
> > > ;
> > >  		if (IS_ERR(xe_child))
> > >  			return PTR_ERR(xe_child);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.h
> > > b/drivers/gpu/drm/xe/xe_pt.h
> > > index 5ecf003d513c..4daeebaab5a1 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > > @@ -10,6 +10,7 @@
> > >  #include "xe_pt_types.h"
> > >  
> > >  struct dma_fence;
> > > +struct drm_exec;
> > >  struct xe_bo;
> > >  struct xe_device;
> > >  struct xe_exec_queue;
> > > @@ -29,7 +30,7 @@ struct xe_vma_ops;
> > >  unsigned int xe_pt_shift(unsigned int level);
> > >  
> > >  struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > > -			   unsigned int level);
> > > +			   unsigned int level, struct drm_exec
> > > *exec);
> > >  
> > >  void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> > >  			  struct xe_pt *pt);
> > > diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > index ca95f2a4d4ef..54bd6b64dc6d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > @@ -54,8 +54,9 @@ static int
> > > allocate_vcs_execution_resources(struct xe_pxp *pxp)
> > >  	 * Each termination is 16 DWORDS, so 4K is enough to
> > > contain a
> > >  	 * termination for each sessions.
> > >  	 */
> > > -	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> > > ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> > > +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K,
> > > ttm_bo_type_kernel,
> > > +				       XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT,
> > > +				       false);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > >  		goto out_queue;
> > > @@ -87,7 +88,9 @@ static int allocate_gsc_client_resources(struct
> > > xe_gt *gt,
> > >  {
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_validation_ctx ctx;
> > >  	struct xe_hw_engine *hwe;
> > > +	struct drm_exec exec;
> > >  	struct xe_vm *vm;
> > >  	struct xe_bo *bo;
> > >  	struct xe_exec_queue *q;
> > > @@ -106,15 +109,26 @@ static int
> > > allocate_gsc_client_resources(struct xe_gt *gt,
> > >  		return PTR_ERR(vm);
> > >  
> > >  	/* We allocate a single object for the batch and the
> > > in/out memory */
> > > -	xe_vm_lock(vm, false);
> > > -	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE +
> > > inout_size * 2,
> > > -				  ttm_bo_type_kernel,
> > > -				  XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> > > -	xe_vm_unlock(vm);
> > > -	if (IS_ERR(bo)) {
> > > -		err = PTR_ERR(bo);
> > > -		goto vm_out;
> > > +
> > > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false)
> > > {
> > > +		err = xe_vm_drm_exec_lock(vm, &exec);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		if (err)
> > > +			break;
> > > +
> > > +		bo = xe_bo_create_pin_map(xe, tile, vm,
> > > PXP_BB_SIZE + inout_size * 2,
> > > +					  ttm_bo_type_kernel,
> > > +					  XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_PINNED |
> > > +					  XE_BO_FLAG_NEEDS_UC,
> > > &exec);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		if (IS_ERR(bo)) {
> > > +			err = PTR_ERR(bo);
> > > +			xe_validation_retry_on_oom(&ctx, &err);
> > > +			break;
> > > +		}
> > >  	}
> > > +	if (err)
> > > +		goto vm_out;
> > >  
> > >  	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0,
> > > XE_CACHE_WB);
> > >  	if (IS_ERR(fence)) {
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 989d84c2e82f..b3ee65126841 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1606,6 +1606,7 @@ static void vm_destroy_work_func(struct
> > > work_struct *w);
> > >   * @xe: xe device.
> > >   * @tile: tile to set up for.
> > >   * @vm: vm to set up for.
> > > + * @exec: The struct drm_exec object used to lock the vm resv.
> > >   *
> > >   * Sets up a pagetable tree with one page-table per level and a
> > > single
> > >   * leaf PTE. All pagetable entries point to the single page-table
> > > or,
> > > @@ -1615,20 +1616,19 @@ static void vm_destroy_work_func(struct
> > > work_struct *w);
> > >   * Return: 0 on success, negative error code on error.
> > >   */
> > >  static int xe_vm_create_scratch(struct xe_device *xe, struct
> > > xe_tile *tile,
> > > -				struct xe_vm *vm)
> > > +				struct xe_vm *vm, struct drm_exec
> > > *exec)
> > >  {
> > >  	u8 id = tile->id;
> > >  	int i;
> > >  
> > >  	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level;
> > > i++) {
> > > -		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
> > > +		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i,
> > > exec);
> > >  		if (IS_ERR(vm->scratch_pt[id][i])) {
> > >  			int err = PTR_ERR(vm->scratch_pt[id][i]);
> > >  
> > >  			vm->scratch_pt[id][i] = NULL;
> > >  			return err;
> > >  		}
> > > -
> > >  		xe_pt_populate_empty(tile, vm, vm-
> > > >scratch_pt[id][i]);
> > >  	}
> > >  
> > > @@ -1656,9 +1656,26 @@ static void xe_vm_free_scratch(struct xe_vm
> > > *vm)
> > >  	}
> > >  }
> > >  
> > > +static void xe_vm_pt_destroy(struct xe_vm *vm)
> > > +{
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	xe_vm_assert_held(vm);
> > > +
> > > +	for_each_tile(tile, vm->xe, id) {
> > > +		if (vm->pt_root[id]) {
> > > +			xe_pt_destroy(vm->pt_root[id], vm->flags,
> > > NULL);
> > > +			vm->pt_root[id] = NULL;
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct
> > > xe_file *xef)
> > >  {
> > >  	struct drm_gem_object *vm_resv_obj;
> > > +	struct xe_validation_ctx ctx;
> > > +	struct drm_exec exec;
> > >  	struct xe_vm *vm;
> > >  	int err, number_tiles = 0;
> > >  	struct xe_tile *tile;
> > > @@ -1745,49 +1762,64 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags, struct xe_file *xef)
> > >  
> > >  	drm_gem_object_put(vm_resv_obj);
> > >  
> > > -	err = xe_vm_lock(vm, true);
> > > -	if (err)
> > > -		goto err_close;
> > > +	err = 0;
> > > +	xe_validation_guard(&ctx, &xe->val, &exec,
> > > DRM_EXEC_INTERRUPTIBLE_WAIT,
> > > +			    err, true) {
> > > +		err = xe_vm_drm_exec_lock(vm, &exec);
> > > +		drm_exec_retry_on_contention(&exec);
> > >  
> > > -	if (IS_DGFX(xe) && xe->info.vram_flags &
> > > XE_VRAM_FLAGS_NEED64K)
> > > -		vm->flags |= XE_VM_FLAG_64K;
> > > +		if (IS_DGFX(xe) && xe->info.vram_flags &
> > > XE_VRAM_FLAGS_NEED64K)
> > > +			vm->flags |= XE_VM_FLAG_64K;
> > >  
> > > -	for_each_tile(tile, xe, id) {
> > > -		if (flags & XE_VM_FLAG_MIGRATION &&
> > > -		    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > > -			continue;
> > > +		for_each_tile(tile, xe, id) {
> > > +			if (flags & XE_VM_FLAG_MIGRATION &&
> > > +			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > > +				continue;
> > >  
> > > -		vm->pt_root[id] = xe_pt_create(vm, tile, xe-
> > > >info.vm_max_level);
> > > -		if (IS_ERR(vm->pt_root[id])) {
> > > -			err = PTR_ERR(vm->pt_root[id]);
> > > -			vm->pt_root[id] = NULL;
> > > -			goto err_unlock_close;
> > > +			vm->pt_root[id] = xe_pt_create(vm, tile,
> > > xe->info.vm_max_level,
> > > +						       &exec);
> > > +			if (IS_ERR(vm->pt_root[id])) {
> > > +				err = PTR_ERR(vm->pt_root[id]);
> > > +				vm->pt_root[id] = NULL;
> > > +				xe_vm_pt_destroy(vm);
> > > +				drm_exec_retry_on_contention(&exec
> > > );
> > > +				xe_validation_retry_on_oom(&ctx,
> > > &err);
> > > +				goto err_close;
> > > +			}
> > >  		}
> > > -	}
> > >  
> > > -	if (xe_vm_has_scratch(vm)) {
> > > +		if (xe_vm_has_scratch(vm)) {
> > > +			for_each_tile(tile, xe, id) {
> > > +				if (!vm->pt_root[id])
> > > +					continue;
> > > +
> > > +				err = xe_vm_create_scratch(xe,
> > > tile, vm, &exec);
> > > +				if (err) {
> > > +					xe_vm_free_scratch(vm);
> > > +					xe_vm_pt_destroy(vm);
> > > +					drm_exec_retry_on_contenti
> > > on(&exec);
> > > +					xe_validation_retry_on_oom
> > > (&ctx, &err);
> > > +					goto err_close;
> > > +				}
> > > +			}
> > > +			vm->batch_invalidate_tlb = true;
> > > +		}
> > > +
> > > +		if (vm->flags & XE_VM_FLAG_LR_MODE) {
> > > +			INIT_WORK(&vm->preempt.rebind_work,
> > > preempt_rebind_work_func);
> > > +			vm->batch_invalidate_tlb = false;
> > > +		}
> > > +
> > > +		/* Fill pt_root after allocating scratch tables */
> > >  		for_each_tile(tile, xe, id) {
> > >  			if (!vm->pt_root[id])
> > >  				continue;
> > >  
> > > -			err = xe_vm_create_scratch(xe, tile, vm);
> > > -			if (err)
> > > -				goto err_unlock_close;
> > > +			xe_pt_populate_empty(tile, vm, vm-
> > > >pt_root[id]);
> > >  		}
> > > -		vm->batch_invalidate_tlb = true;
> > > -	}
> > > -
> > > -	if (vm->flags & XE_VM_FLAG_LR_MODE)
> > > -		vm->batch_invalidate_tlb = false;
> > > -
> > > -	/* Fill pt_root after allocating scratch tables */
> > > -	for_each_tile(tile, xe, id) {
> > > -		if (!vm->pt_root[id])
> > > -			continue;
> > > -
> > > -		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
> > >  	}
> > > -	xe_vm_unlock(vm);
> > > +	if (err)
> > > +		goto err_close;
> > >  
> > >  	/* Kernel migration VM shouldn't have a circular loop.. */
> > >  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> > > @@ -1820,7 +1852,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags, struct xe_file *xef)
> > >  				      &xe->usm.next_asid,
> > > GFP_KERNEL);
> > >  		up_write(&xe->usm.lock);
> > >  		if (err < 0)
> > > -			goto err_unlock_close;
> > > +			goto err_close;
> > >  
> > >  		vm->usm.asid = asid;
> > >  	}
> > > @@ -1829,8 +1861,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags, struct xe_file *xef)
> > >  
> > >  	return vm;
> > >  
> > > -err_unlock_close:
> > > -	xe_vm_unlock(vm);
> > >  err_close:
> > >  	xe_vm_close_and_put(vm);
> > >  	return ERR_PTR(err);
> > > @@ -1959,13 +1989,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  	 * destroy the pagetables immediately.
> > >  	 */
> > >  	xe_vm_free_scratch(vm);
> > > -
> > > -	for_each_tile(tile, xe, id) {
> > > -		if (vm->pt_root[id]) {
> > > -			xe_pt_destroy(vm->pt_root[id], vm->flags,
> > > NULL);
> > > -			vm->pt_root[id] = NULL;
> > > -		}
> > > -	}
> > > +	xe_vm_pt_destroy(vm);
> > >  	xe_vm_unlock(vm);
> > >  
> > >  	/*
> > > @@ -3845,7 +3869,6 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct
> > > xe_vm *vm, struct xe_bo *bo,
> > >   */
> > >  int xe_vm_lock(struct xe_vm *vm, bool intr)
> > >  {
> > > -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > 
> > You add this earlier in the series and then delete it here, which
> > seems
> > odd. If the intent is to apply a workaround (WA) earlier and finalize
> > it
> > here, that makes sense.
> 
> Yes, the patch that introduces these identifies all the call-sites
> where we need a fix-up, and uses lockdep to verify that a validation
> transaction starting there doesn't violate the dma_resv locking orders.
> 
> Most of the series then eliminates these _UNIMPLEMENTED one by one.
> Of course one could do it in the opposite order to avoid introducing
> and then eliminating these but I think that would be harder both for
> the developer and reviewer.
> 

Fine with the ordering, just wanted to make sure I was understanding why
this was done.

> > 
> > However, deleting it here appears to leave a problematic path in
> > xe_svm.c around xe_vm_range_rebind, where vm->validating._exec may
> > remain unset/stale. I’m surprised CI didn’t catch this—perhaps due to
> > an
> > unbalanced xe_vm_set_validation_exec leaving stale state—or I’m
> > missing
> > something.
> 
> Yes, you are correct. There was an imbalance and I will fix that.
> 

+1

Matt

> Thanks,
> Thomas
> 
> > 
> > Matt
> > 
> > >  	int ret;
> > >  
> > >  	if (intr)
> > > @@ -3853,9 +3876,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > >  	else
> > >  		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
> > >  
> > > -	if (!ret)
> > > -		xe_vm_set_validation_exec(vm, exec);
> > > -
> > >  	return ret;
> > >  }
> > >  
> > > @@ -3867,7 +3887,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > >   */
> > >  void xe_vm_unlock(struct xe_vm *vm)
> > >  {
> > > -	xe_vm_set_validation_exec(vm, NULL);
> > >  	dma_resv_unlock(xe_vm_resv(vm));
> > >  }
> > >  
> > > -- 
> > > 2.50.1
> > > 
> 
