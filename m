Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB20CEE342
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F33410E7F0;
	Wed,  9 Oct 2024 19:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/565ci0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BED10E7F1
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728503027; x=1760039027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xh9sDQOXRrooY3ab1oR74uGkiWEFRuSwjb/bPRUvaTA=;
 b=V/565ci0a2KB7ONhC2vC1x7klyFu6w4YEqZ7M7TulG9NqeYpkN/tuKff
 CMMujgVRkbzhsm4h85GInrBPFwJ/tzDl/Amirs8l1fmP6I9GE8zq3HjXY
 y+HjyN/mVe9bQA8EnEU0M6YDpxlMHQWjI9wWa1KQh83JYX+NvV0/SnTdZ
 mdNgxDbJ200ZZQQnEQNYrH6kRzljnjhAR+l1ew6vkgP5Tw8KmDs3/VXzD
 8QZwQRbn6506DAFhb+ICV0I+DwxiQk61v59b2USlt3O0CJZ84WuU4XZNl
 7CDMusF/cpzwrQigbf3Qwugq33E5cDDRcUQ1DZ4er5DhD4DFt1vXH2Kcj A==;
X-CSE-ConnectionGUID: TK7THXu7T0mu8i0WhjZFLQ==
X-CSE-MsgGUID: +5KSlm50SnedtB6E8hueLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31621898"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="31621898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 12:43:47 -0700
X-CSE-ConnectionGUID: pi1wJqBtSVyBGz1BJOV5sQ==
X-CSE-MsgGUID: +2PL+aIOTi6at868b7sGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="80877170"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 12:43:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:43:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:43:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 12:43:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 12:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZlsnkvqnI0j3kVIxNieJ1Qttcp1R3NgnDVPVLU+qQiYh/t8d4hsl1eKux54zIxAQ8H4BJlnTYS5EXKBmjgta11l/rPqs469G/yH13QSDlr+kaIOUlUwjQR43phTwwZ9DvGQzZHwfiP2LL/AnMWnx0SvcpIq63HW8po0gr03e1jsYvHXkzyAEy1VsGBZWEX2PnApsaDHp4wZwX8cd6mG5oghYXN68yTGxJvCChZ5rJ10EXJV6IFFIv/rLRj/6cGPOgnY0qRPiivoqNRUUjOty7XRfW1MnGgxOBimCfnvulx3rK4InfzwIUSVtZ0rhtwO5kAuR+iUWdjn6+l2qwoniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2INuULe0G4N0dnY5SyJeIQZOQHMGjCDH7p/SGJtss0=;
 b=DoLEtURBnKvgxn7w13wOpSJJZbN9VH1cA4+BE5OzmejXBxudtqs9uRWDzRQRVEO8PUE8vdWLYc+6h2lSVFiZT0uCRjBnRh6hBY2sJLWAB/G3GCipJ0AnKsugdMEn3GnV+n+JD3O8rBTnqVziDo1zlfhNv4zy3MCCv0G+bI3svw/pxGyr5i4Zxl+I89RcCZUFkFYgBpy+katD6rClNaYQJ4L3BDjAyuzgxBwgfHVYf4UMqKlv08M/8uStFFlDZJPBP6aSX+jQg4SiPXVyqMqS3WmO2wfw6zJvpk1tUBdLRDj7zBk0iWdogWsQx0jsOQCj49D3ZGcIpGoyRnXxb2hZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 19:43:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 19:43:38 +0000
Message-ID: <8711d85f-6bf3-4e7f-8c71-5a838aae588f@intel.com>
Date: Wed, 9 Oct 2024 12:43:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc/ct: Increase wait timeout for g2h response
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <matthew.auld@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-3-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241009105645.1416588-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 9364687b-ad02-472b-2275-08dce89aabe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnpsSXhqUnlxNlhES3lpb1VQOGVhNFk2Y2svcU1hYlVLMDZ1blorUlJBb1lZ?=
 =?utf-8?B?bXRGaGNoVlpoWUkzb3UxbnJZUG1wVC9VNzF0Qjl4Y2xKMnhwSVV5UDZpaTh3?=
 =?utf-8?B?K0FBckNMMzZoOWMvY1gwNkhsY3NMOGZpdDBVTUVQRGxUcnlobmNvT3Y1WjdI?=
 =?utf-8?B?TktldzY2b0hzcC9zbjZFZWtsRTczM3NsZ2t1VW4vK0RqNHRaUjFjOHRRZjIr?=
 =?utf-8?B?RlBoei8rS3BOMUdhREU0YldRNTB6R21wOWRXZTZ4Y3d0ODJERlVPMTBkVUZJ?=
 =?utf-8?B?SnVxKzlrem95L1V2ZlcwRm9YWlhCZFRRYjByMUozRll4RThvcVdSa1Yrb00w?=
 =?utf-8?B?QW9udStLSERjek9QUTB0SGRpdWhyblJDcDBrdHNuZVprdkNqdnNXYTFXci8w?=
 =?utf-8?B?aXRuelVscGFjVjVGbG5KeER5SnFkK1hWei92UnRaT0ViWG9rbEhCendsTG9s?=
 =?utf-8?B?K2hVbFJEOFhkVEx2N1dYL0lhOXpRVGF2bnVic2JDbUdpTGpGYmdNOXVFQnBU?=
 =?utf-8?B?SjVIa2VoNEF3Umk2d0piRFBTZFRIb2Y1WUFYd2lZWGZQeVNVYXFtOG8vakRF?=
 =?utf-8?B?MVlGaFcvcGNVNmFiUHFKazRMMzJFOHArY0NKUW5pOEQ1TDhob1cyVUpRM2Rv?=
 =?utf-8?B?dHkyVVNDZlpXRHF2UkhiejFMQ25kUkdnT1pHZVZCV2Q4YlhqYWJGQll6bUlT?=
 =?utf-8?B?bGZvZUViVmxpbUc1cllwSGgzTHBtc1JYMkZtSFNHOUJrd1g5eHR3TXZiNjlt?=
 =?utf-8?B?dkd1aTdwU2YvUzdDSzB2K1ZiVGZ5RWdvbVZOUFFhZVlYSVcxcTJod3RkNXFk?=
 =?utf-8?B?bjJIRWN6QnlQT1NoN05tMGNnZHZJdUNXV2hKcjZBY3VacFZ0VTVMZjlldUl2?=
 =?utf-8?B?U3kySjdkd0JNTTcrU0pDQzh2RVlPWlJyTG8vU0lxNEVKdFVBcW12NHp5Ky9F?=
 =?utf-8?B?SHdiaUhWYTRBcHBLcXc5QmtqazFQejFnSWVUOWx3OUFoaXE2MHgxb1Q0UHE2?=
 =?utf-8?B?Vkg0RU81WlFsMUNPRUNvUTVRL1NtODJuZCtpZ1hvaVJjQ3Z5M1pITUUxbkUx?=
 =?utf-8?B?OHJ3a3FtUHNKaGxFajRpVWVQOGtESmVCd2tjYUNVbHNRY21nc2dhNGpMeFVP?=
 =?utf-8?B?K05CMXBIalNCQktPK3RRZHIwclplZkFHbm9iZWFPSlJLdXMrUmxFVWhYNFpX?=
 =?utf-8?B?bzR1TkNSeGN6R3VaMjJNNXVXZlNFY25YUWZsN0NwWmpqMWUyZUI1MTFKU1lS?=
 =?utf-8?B?RjZzQW5GSFg3dTMxbkVZcnhua2ZvdHRUajJodkhlK0kya3NZRXFNaUZEMWFw?=
 =?utf-8?B?WDFpYkJITHdiOCtROTlZcUREVDQrYnFBbUZxUHVvcjg2R3NRWmlDMFFycHY3?=
 =?utf-8?B?UW8yaTJxT1I1SGVKcmFBN0hOZXFsZk5UVUNsMVB0d0lrZ1NXTjZUSVpkbmxP?=
 =?utf-8?B?N05Na2hSdTZ4SHNON3NCZitXdnBvWHRpU083YXZkRXcwcWgrWmYxWkRrUkdk?=
 =?utf-8?B?TXJWRFZjeFg1am5PUlB2SkU1Zm9POFdVWGNEeEpnRHJTNm5zZ0pHZE9YRkxT?=
 =?utf-8?B?L0V0WmwzalZiR2RnbEJSdDZDYTBLWWdJSmkwRkVGei9VZ0lYNXJDdW00SXFV?=
 =?utf-8?Q?NEaN/iCu3OE/SKvkuk1KLv+2NFiDhFDYB8N3y3v+L4S8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVpbE9BZjhVVDgxK1FGWUkraHNMcmpmMVMxSTZtenNSaVI1Nk0rQTNNQkZM?=
 =?utf-8?B?YmtzTXp6VjNBMmttdnc0RVZHTnNPTlpyeExmeVEwWTFQYm1OOWhvVTN6Si8z?=
 =?utf-8?B?TTNQR21oRFdHM2RiU3Nqd2NkQ2JNUFNjd1EwL2hUOGVrb213K2REeHdxWjBa?=
 =?utf-8?B?dTZaQ2c0Zm5rVjE3dG1NTzdQRTZuandCNVA3T29YM1JNMDNNOWd1QTVVL2R6?=
 =?utf-8?B?dzU1Vk5KeHhMSTc3enVmUC9pQWZ1cVdXS2pJd0J6REhsOFdYTGw0MkkzUHRQ?=
 =?utf-8?B?Q002TEJLSkRTdXVHRmtqQWFYN0srMmdsdDBLWU5kRWQyMWxHNHBQRkcwcHZI?=
 =?utf-8?B?ZzZObGFZaXFtWXpJc1N3WTZnVWdiVXlJdmZHMWtucHRFYnN6WUg0OXp5TkUy?=
 =?utf-8?B?aUEyQ3RzejkxdXdpVDl6Y0lxM2REbXZ5aDArcHRZcTE3YzhmVGdacDBHaDZK?=
 =?utf-8?B?SVBjS0dCbXdDZjdobnNkNitSNnMwUkp5MWp6RHQvWllRNkMwbkMrM1Ntdmxy?=
 =?utf-8?B?RDl1VFF1UnF5RWw4cFU3Q054TFJ1OGt5b3pWUC9FYytaM2IwTE9ZRkE4SDcv?=
 =?utf-8?B?N1NUSjZFNm5HbVMyME43WDFMYjc1c1preXZyY0VSeFJCQlBDWnlrZFhoZFAz?=
 =?utf-8?B?Z29TQTRMdGxkU1RuSzZMc1RCbzgzYWRuREM5K2NWZmVPNExSSHNya1dBcUU5?=
 =?utf-8?B?N1FsZDJUeWx3RTRMMzlsanlSbUZ6aEJ2bmlCcDBHaW9LdWRCS3FYUFVVc2RO?=
 =?utf-8?B?UFlscC95VG83R0l6ZFlxZjdacmhFQWwwOUExZk9vU2FSdW1oZVp2TmNGN1h1?=
 =?utf-8?B?OWN6dnRrbDd6UDhOVkZPNDlBeE5ZLzJabWF4aGszRm1iVGE0eHdxOXBROW9X?=
 =?utf-8?B?cXg0SEVPN2lRVzNTRGhLOW9wWjBPZGV6dWNWUGNXN3N5R1RLMDh2S2pLS1E3?=
 =?utf-8?B?dlRTUVhCcFpBQ056TEM2ZVRwenhFb1o5QWwwWTBTWU4wN0dvUTNjb2d6K3ZL?=
 =?utf-8?B?NytDRE96Zm42NE9HWkxZcmJBREhqQWFaemZrQm0xVnFVeUVDYk9VQ0NNV25m?=
 =?utf-8?B?M0VidnVwZ2w0aFNSNVI4Q2pPTVFxOHZBZm14Yk5TaVdtYTdOUGNOWGg4NnVV?=
 =?utf-8?B?M2Qzc2x1NnVXNndlaVNMNW1TODM1TC9OREI1K0VFbmZtN2t5NElvTEV3ZXJZ?=
 =?utf-8?B?WEwvUUJpMDhSTXJ6akQyTjR5SGJ0alVvU2VVRGJZbkhmZHAxZDg5Q1J3WjFH?=
 =?utf-8?B?R2RSNkNRSHZDNzVWQ25WeG13VWJYOVZBd21Sa3BFQ1BRMFdWcnlqRFBOSVJx?=
 =?utf-8?B?bzhob050V1liN25BTERKR3FRd002ZG4xOTE3NE51cGRvNUdMMlFlY25qSEFG?=
 =?utf-8?B?cklXb0dSY3piL2E1RHU1MFdiQ2k3Skw3V1d3K3VMdWJPNnJQMFJtU3FBWFJq?=
 =?utf-8?B?RHB5RXFXc2NZUzBsV0FGK2cvbThTZEVUaHZxYnZNSXphRktCbXZUNjFrazNy?=
 =?utf-8?B?RGRXVDN2NFdyRXZ0SWF1TmMvVzB0aDNBUGpDL3dmWHdoelJLT1NRRHNNM3ND?=
 =?utf-8?B?VVp1cno4cnFmdlpOWi9YdDVCSWhOSE43ZzZQdjdrdGpycXJ5dTN2akVDblpi?=
 =?utf-8?B?WmRYYVg2VWhSdTlVUFJXekpOQkpIczl4ZGVIQWh2SkNXd3JUWEFTOFJlWm1j?=
 =?utf-8?B?c0E4dXFqUU9ic1c5MVhEZ2tBVWg2aVhFekw5SnRNSUxETWs3TFkrTjlKKzZQ?=
 =?utf-8?B?L3NROHhXdlFKVlk2bDlxdHFwdGdEWTB3QzVpVTZRcS9IZTdGMEtmUDdRbCsv?=
 =?utf-8?B?N0ZBTjBJQTR6VnlsZnpSVHlzVW5PaWlySTZtcm5xSTF0OGd6SXVDaGpwMFcx?=
 =?utf-8?B?Mkd5ZW5NcHkzbWVSR3lSSHJwaXRCY1lFOVlUS25PTDJyNXdmUW1vdXUvbUli?=
 =?utf-8?B?cm5EZlhydG8va3hUZTU1NytlUEduUVd4SU9FSWZUems5dHBCYnZWdytKYlVp?=
 =?utf-8?B?WXZmK0gwbDE4Q042bEdXVFdkQUFSaGRwNzlxN3pDc1VTOHBuRm0yMDZyS2tn?=
 =?utf-8?B?Q2dTcGh2ZTFiL2NwTlVOU2EwekV6eENVRGJxUzdnR1ZocFRtMUFEUXlZUHhy?=
 =?utf-8?B?OHlvbVZtdk4yVHBLR2tCdUpqcWx0ejEzTW03R3lEdFNmcTduOGV3OTVXamp2?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9364687b-ad02-472b-2275-08dce89aabe4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 19:43:38.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jORm78NgdQWFYoWbsif/EyTwB38ceBqPq/KkZc0LfSiZxsWqACDpjUWKZxQ+dy0OOseqHzwYgD/3BDaCivV70QeH4Bhri2x1JFhua5LNun4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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

On 10/9/2024 03:56, Badal Nilawar wrote:
> Occasionally, the G2H worker starts running after a delay of more than
> a second even after being queued and activated by the Linux workqueue
> subsystem.
> To prevent G2H timeout errors, the wait timeout is being increased.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b93b2821e4e8..dcc95c01b6f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1019,7 +1019,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		return ret;
>   	}
>   
> -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
Is this change intended to be temporary until the fundamental scheduling 
issue with the workqueue is fixed? If so, there should be a TODO comment 
to that effect so that we remember to shrink the timeout back down again 
later. Three seconds seems like a long time to wait.

John.

>   
>   	/*
>   	 * It is possible that the g2h request may be cancelled while waiting for a response due

