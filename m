Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1695CFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 07:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85510E868;
	Fri,  4 Oct 2024 07:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGkYpiNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66910E868
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728026308; x=1759562308;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8C3FkUtu63kPSThJIkIp6O2aBcqg2baEuZvm+YFTb9w=;
 b=QGkYpiNJDZ9BeFtNI0KJ5w7hyZOLu1ONIvbcOOgO2OKiZOcSlkRU4+8q
 Zuu0tx5/jmlSFjBEG2gZFvpkUj1Ywb03/cS5zlrHTHjZDOQHP6bh6/7P5
 9xRIzn0dXDwN/9a1S47U5AJlVEqWA/28W14cSZghuePXUGBRlbdpT1MoC
 STjwmm0Ps3MGmyw5G8uRgQbRHhuZZ/D/MsGupfS+8v2fhggdZql/9UwU7
 s1fuFpseK6sKikmDKxS+IO1ugjWxwo1l519nXMPDwFULR8RuxR/xt/7/u
 0CIX2cnZRiBTKouXsGbZ6tTnWoKmT3R+sNjkC3jZF9MwOBMX/7g9rhflB w==;
X-CSE-ConnectionGUID: 8SoaatucTgyMC42OBTvtcA==
X-CSE-MsgGUID: JyPrydxQSh+jjVeICHSeOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27375435"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27375435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:18:28 -0700
X-CSE-ConnectionGUID: O13K6/OwQe60IV+x/SV7Fw==
X-CSE-MsgGUID: oQgeSyUUSVuwiP60hxVXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74874646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 00:18:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 00:18:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 00:18:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 00:18:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 00:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+NOGo5mlPvkR5EQ5zsE4zRt5gIUPv0QcgcmeI1tcEBh2KPLv4Dm3lscx7yyjQ50npzhGI2bf2MFgZOO9sAan9osSUcOCW9EJ5ALgSBzKPUf4m4OKgPGk+7HILPQbz9MUZdBBCWMMgxKPJNpZYJGVRCglDjeRLFHOEDdRBEgNJxi8B/bwKnwx8F+elwlXClVqbKzdsB//Tg9FAsoUphyFS0QObn5cxMGpKuxwmn9OVYhjVpD94ZKXUIirFrymXhBOTeyRff4lZAJvFrDxq6hGfKdAyLYs8rc1z6XywvPGdzAE3y14i3kWTvN3uU60LwakFY9oRf4c4SaWvs88GrRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr8p4wlYVqMfmtYrWBZcqyBZJ8u8w+WlvJbFBxbUhg0=;
 b=Ioyig1Fql9Q3qtY73C8+YTkj/YKXtWhKvw+m2WO6U7naZVZ0S0oo6LG8i2tMYuxzHQhXiBJrzRs2lROS/XagLs+Zr3ykXFy8CefPOSlOVRbJfQQBxpLfhXiuKSYWZqPFMO0/ANfETUyJU4IwWbp0fuOZ5pT9wKldAbPg6qMBUrvvgSYjBA3FJhZECiuyG+fQlCXfO/8puhbLmqWrxWQudGfC36xoONbxU20ZG3lX1zdfSzFWY2mGu76bZGp4rRk7+jJiu55FkEX9S1XuVD/NvNavXGFHbJCL2sFZhHomYfzl4Zh+16xnODZWiKfqLUGHeQa2c62bEE3xDGz6048njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 07:18:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 07:18:25 +0000
Message-ID: <ed935723-8128-42ff-a01e-52f22fa2cbbe@intel.com>
Date: Fri, 4 Oct 2024 12:48:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/25] drm/xe/device: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-6-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240930053149.1246339-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 223a7297-7716-4b67-1edd-08dce444bc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlNpeldJaFRjRjBzREErNWVZUHl4KzRNQnFOMlFpTGR4b3dwMWFVYTFrNW1K?=
 =?utf-8?B?MUJyZjQ4SXorQVBVWFltZ1VDYTd0MTRCc2V1Q3BVakhkWXFpeGQ4d0RNWTVr?=
 =?utf-8?B?WTJIdmI0VU42M1MwMkEyQis3eDlwMG8wNFRYTFJFcmNEODZUTHZHYkZqYzVE?=
 =?utf-8?B?UmJwcElYMmk1MC9xOW01bmpISGtUZExJN016SDJQaUNYY0N1TW1wQVpMWU5o?=
 =?utf-8?B?d0xVRURFUkpDRG45SDBvSmNsWURUWVBrZGpMT0V6NDI0aVJIOUdnYm81dkVl?=
 =?utf-8?B?RlZVRjBHYkRLM253dDNBSkJxZ3hUVERSNWdrVzJodXYvZ0pNWXZ1bXIzbTMx?=
 =?utf-8?B?Qm10bkh0YmNRQmNTR2FrWTAzM2ZUdnVkaVFFK3Z1NVgrUitQbjhGbUR6SUVI?=
 =?utf-8?B?RDM1R2w0QU0vbTA0SlRSaHNUdXB0aUEwSU5tUUdWUTVReEJMb1d0KzdSY2d4?=
 =?utf-8?B?czNrT2t3cGxldTFmeDBMVnhCRVhqRmh4eGVuajBtSWtjV2FKbnp1cGZ6SmxD?=
 =?utf-8?B?WXA3ZDN2elFxbkhRQ0JwRUN4UWY1Z3VvRXRDb3VrRFRFT1p3c3RuS2xNcnJE?=
 =?utf-8?B?b1laaXNiOUxpQ0hCMHk1Q2FrbGFjSkpEemF3a1g2YzlzeERWNGJRS1BvU3hu?=
 =?utf-8?B?N1EzeHNNTGRNeGU3bTJuWWpUQVRlNnc4Vzl2RGg3MDJPNWtRTHVHYSt2Wi84?=
 =?utf-8?B?MGJVSXR5SG1OYVloN0lsMmdsbGhrYWw5alhNcE45dnRZT21JdzZGTnBCdGxJ?=
 =?utf-8?B?Qy9VV05lWm1Qblh3b3VYeUhSZWc4QzB4bnU2U0ZPc1pKTGZjV1B4Yk1UMlMy?=
 =?utf-8?B?dm5hbGhwVUx3UkNkUldlZE5OT1B1SURjUTdhMTE0a285bnNjbGJnNzIwbW5j?=
 =?utf-8?B?ZE45UmxkNWJPdE1ZWjdnTnJaTVJEU2ZmaFdLR25LdU1VMzNGbFNSSlAwcUFG?=
 =?utf-8?B?ZGJFWkZjcHZXSzlPUjZud29CWG1iU1ArVXFPZnhLbFl1a21UUVA4UGd5VlE4?=
 =?utf-8?B?YlN2akdETUJ5QnR3K2xyTFkyVWlvQlhqWFY0NzNiZDh3QnFxRXZqbEpIS1k5?=
 =?utf-8?B?UUd1OTV0dTNESWhjQ3hpWGNYWFpNQWwwTVlaOEMvQXhQenVLYTVpcUJEcmJE?=
 =?utf-8?B?b3dESDR1WGVIazdDdjVRam5WNHN5Wkp5WW1UMnhJeXhLd0FOVEdWNFdSQTJN?=
 =?utf-8?B?SWdDSWtYVjBuZTROWmFWSUoxcjBsZW5UWVdXbkNob0V3bmVpbU93UnBobExK?=
 =?utf-8?B?a1pGMFJWNjRVYlFOb2U4T1pKZ2Z5WlpzNGFTOWxGdFNobytnSnBLQUFxUkZ2?=
 =?utf-8?B?SHdkNkNaUzlUT0Q5SjlXQUI1UkoyTTJ2SEh0M3FjMnJ2VzJBUkVsUXFMckdr?=
 =?utf-8?B?YTdsMU1aQWt6T0srSVpCcU9rcW9mWVhhYU0zNnlPNXppUUdJYk5KMXUreWY5?=
 =?utf-8?B?ZDRpbFdHT3lHclhyZ1dZN21SQWUybWRvSFhvVzRwaEp3ZUtLdldqNU15bkR4?=
 =?utf-8?B?dGNXZ1NpbTIzV1BwU2dQQkgxVXZ4MEhOV01YSXkwdTA1SkE3WHVUZHlCaXhT?=
 =?utf-8?B?bE9DdHZjMFZSQ1lVdStCQ0VZMndnazZXdjkyS2x5K2s3dTB0S3dIeXJSWmRO?=
 =?utf-8?B?N0s3R0puWlM5blp1NUpKMzcvcXNHZisrRVBja3lMNmV2ejg1Q3Y0L1pIQ2pp?=
 =?utf-8?B?L0xQN2lMRDFmamJwQ2lUWmUzeWtlcG1YSjlvajF5WXl3c0Q0YkxVUlpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtoSVR6cVl4eTJRd0FYNkNrcTJUY3MzcG9wTWZKTm5wL256cmFJc3BpclNV?=
 =?utf-8?B?Yk9jeVJNbG43TnNaRG9uTUJhaVRlWEx4SGZPNVVSM0pkcGtEWTV0bktZOEJk?=
 =?utf-8?B?T3NXNXY1azBrUFlMNXhNalJYZlpiZjRUc3FWSTR1czVDVTl1Q25kNzhaR1RY?=
 =?utf-8?B?L204SHhnQ3FPN0EyaHE1bUVNbWNyQjdZTVBCdVl6bEVhb0xGOWgvUEdyOWUw?=
 =?utf-8?B?MnBsckxJY0ZuTzdpMmQzaXRTOW0rYXIwV1BCZnRXVFF6bERVck1QVEt1cEhM?=
 =?utf-8?B?U3dIVzNjYVRvYXhXT0dZbUpmSTNqaG14ZVZ4c1dmbU1vT3VFdFBBSEduQW1U?=
 =?utf-8?B?WHA1SjRyQkRhL2tjUzkwdFFvUmF5L1hVN3Y2UEhBWW9TNTNSK3phSXJIUGZS?=
 =?utf-8?B?d2pQbWM4Zkc4Zjg4OFBvVGZqVzhLOG11N2JnNzFac0Jkdi93Q2lLK1ljWXVE?=
 =?utf-8?B?VC9STzhYQ1ZOR0VtZ0JwOHFQbGRWalBMc0QxYzRMVC9pVXBCU2c4QVBYZnoz?=
 =?utf-8?B?eHdVeHdPV3lDSEhDNEZZOWdESTZQeGp0ZjZtdk5Yb2t6VGlrVm9TaXBuSzBx?=
 =?utf-8?B?amFvcDdnS2hxWldIcDlZNm5kZnluY21sc01TQ01TTjRpS0ZVK3EwL1RRcm5h?=
 =?utf-8?B?ZXdXdDBESlNZQ3ozL2g2V0V2dnFYT0tBd2ZPTjRQUkMzOVQ4cE0zTWZKREdC?=
 =?utf-8?B?MVFFV1lhMXROcHF1S2o1aEhCUDJ2OEVMRTc4TUFrOTVweW9JOFBHKzZpLzk3?=
 =?utf-8?B?S1c2dU1Pbk04ck55NUJyUHpWeExDOTdhYmFpQlZiLzhmbVIrY3NyYWVXQVlG?=
 =?utf-8?B?NXZmU04xZmNNQkpweExZV3JlVEp1b2hFR1lXZDMwNmJFL3dnQXNwMjYwS1Mx?=
 =?utf-8?B?L2t3bmJQRUcvVEhWMXdqVTF4dkVVSUdnT0xlRjl5MFo5clc2UzJQbktyaXRi?=
 =?utf-8?B?UGpWR3Q5YkpzZ0h3dmptUTdHdDYzMnhXZGpvTE5mRkhrR3luNFBiSUNhQ0d3?=
 =?utf-8?B?UHNRZmU1b2RQWWlvb2FEdTc0TEoxMEdoT1lkTEEwRm9jcG5saEpQRnh4bUd1?=
 =?utf-8?B?QVpHblhreWFxUWpkYnNscjY0MWUwVnF6dmNYZkJuVnFYd3lDbG9NKytsQ280?=
 =?utf-8?B?L3l0TFpUQnFFSVlYd1hXVFUxU0xnM2NFelFkdHRTWlVadG9ZM1ZjS25jOWRx?=
 =?utf-8?B?UEFmcXRzMEdXT2hmR25mc3MxT3JVSFlmYng4VWJQZTYxL0xjS2ltSHVTeGEz?=
 =?utf-8?B?WGJIaVFhK21hWjFaL0czUGRQbXkyOHNWby96YTFNamkrMDNyRkxjL2NqOUNO?=
 =?utf-8?B?NjI0Zm0xS3Noc2NvazQ3MlkyWUMzd0t1czNsNy9KY29UNXNhODZtRFFtcVZw?=
 =?utf-8?B?Q09VNGVxQXNCUWhXM1JrVHVxK0pxMkEvTFpsL3E3OGVEaE1jTnUvbW5DWHEz?=
 =?utf-8?B?WnZxckkyRVU1bEdEZm15dmpQK3ExMzJxK3o3TWNaMDJqajZGNXZycjJLZHhm?=
 =?utf-8?B?dmtaMERIWlhqNUp4Vk1FUHJaUUpFNWVSNkxJZFpGUHR2cEV0QkkranRRNTRD?=
 =?utf-8?B?UFVMMFBwSG5jZDFHMlFBbFl0ZDVaV2ZsZ1hwWEpqb1ZCY2JLUlZ5N0dLaTZv?=
 =?utf-8?B?Q1hiN0E0SDJVTWdRQ3F3Y212QkMzYkl3aFpxWHl4OGNKdTNFVGtUUFFCNnRX?=
 =?utf-8?B?WUVqYmk3ZCt2VmlMSkxyMHRYSzRzNk5jTVUzRHFzWFlmT3p6RVhDVkJMOGZ3?=
 =?utf-8?B?aTFJcFBQMGRwM0FsTnFwRDkwQnoyV3ZFNVBOS2lqbmoyaWd5TVFPS3gxTzQz?=
 =?utf-8?B?eWNyUGt1ejBQMGVJWDE5cU1qcmxkeEhJN0R0cG1rd1krTFAvMWhLNTZPZlZE?=
 =?utf-8?B?Ly9UMG1lMUpSUEtGNGkzUUpjSGZtSzVUUTNwS21xQjF6S3JuSnE0V2tUV2dp?=
 =?utf-8?B?M21CcDdkelNjTXFQcDRmL3EzeVc0SUo3TVJTdUJHZk56ellNRXg3YkwyR0FZ?=
 =?utf-8?B?UlRkdjEyb1pXajBJRGJ4dDZ2SmVQbVVUL2RwRnkzOHBSMFZxZzVoMHFuanFn?=
 =?utf-8?B?N0czMUNveFhaZWF0ZzhCRzg0L3FTMks1Nm81d1JlWHZXV2xZQjA1cTZTc2Ju?=
 =?utf-8?B?aVpaeWx0YkZ1UlBCWHUzVlFDWnBJUThlOWxnMTlMMmpNV0dMQk1nTEZuWnJn?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 223a7297-7716-4b67-1edd-08dce444bc13
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 07:18:25.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SKxesckOr3NwoDtSFjZ0rtEK4nIedq8DPXAEZl5LAgcO3RitdVY6plTlAoqMOVD7BgTrsQb06BuhvL1Km40mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
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



On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, the return value will be 0 for single domains (excluding
> XE_FORCEWAKE_ALL) in the event of a failure. Modify the return handling
> of xe_force_wake_get() accordingly and pass the return value as input to
> xe_force_wake_put().

Now with changes in patch 3, return value 0 indicates failure for 
XE_FORCEWAKE_ALL, i.e. no domains awake, as well. Please rephrase the 
commit message accordingly.

Regards,
Badal

> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be escalated/considered as
> probing error. It internally WARNS on domain ack failure.
> 
> v5
> - return unsigned int xe_force_wake_get()
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8e9b551c7033..e885edacf39f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -600,8 +600,8 @@ int xe_device_probe_early(struct xe_device *xe)
>   static int probe_has_flat_ccs(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	/* Always enabled/disabled, no runtime check to do */
>   	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> @@ -609,9 +609,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   
>   	gt = xe_root_mmio_gt(xe);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
>   	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   		drm_dbg(&xe->drm,
>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>   
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   int xe_device_probe(struct xe_device *xe)
> @@ -871,6 +872,7 @@ void xe_device_wmb(struct xe_device *xe)
>   void xe_device_td_flush(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> +	unsigned int fw_ref;
>   	u8 id;
>   
>   	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> @@ -885,7 +887,8 @@ void xe_device_td_flush(struct xe_device *xe)
>   		if (xe_gt_is_media_type(gt))
>   			continue;
>   
> -		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
>   			return;
>   
>   		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
> @@ -900,22 +903,22 @@ void xe_device_td_flush(struct xe_device *xe)
>   				   150, NULL, false))
>   			xe_gt_err_once(gt, "TD flush timeout\n");
>   
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   }
>   
>   void xe_device_l2_flush(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> -	int err;
> +	uint fw_ref;
>   
>   	gt = xe_root_mmio_gt(xe);
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	spin_lock(&gt->global_invl_lock);
> @@ -925,7 +928,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>   		xe_gt_err_once(gt, "Global invalidation timeout\n");
>   	spin_unlock(&gt->global_invl_lock);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)

