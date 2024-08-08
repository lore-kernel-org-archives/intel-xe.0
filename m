Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852F6C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49710E79B;
	Thu,  8 Aug 2024 17:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZlM0mih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4226D10E79D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723136479; x=1754672479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NozX8etiS7+uIAemla0dRdUh6Tq9Ey6ilpjihvlWGNM=;
 b=aZlM0mihcWxxvVXhv/Y87vjXSZkTl8EAoBbkU9ODam44OjCXe1h+qWCX
 M+Gmdi98XyWrCFHbVbFpeZm+dwoS0UI2FldEpcLN+7AUlZhkCWPNSU1cv
 KhEE20tjvCOx4Y0D4XF5afPRvvY3c+fVxuR28nxvTaBg2zTi4vXWe74rz
 dp0F8rI9QN9KEYDtwLqwewhs1ggYb/WM42g/p4xJSJwbeXOLBTx6wIfFX
 UcjPlutSIqhzu48DloR8iZCl30KTvV2uTdLmBS9RKnl7yhEdaz6E1L/E+
 YsSxbQ23Dalv3RH3CFBjya19OZFNrSrxGkyFNWLXZyM3uQROHuEYO1xp+ w==;
X-CSE-ConnectionGUID: TTDFQMAVSFCZ9tW0LxppnQ==
X-CSE-MsgGUID: cuLNpRjjQRSRIayTZSiVcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32425966"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="32425966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:01:18 -0700
X-CSE-ConnectionGUID: TvEvrLgDSP2ubuaXVWjgGQ==
X-CSE-MsgGUID: m4VW0QBaQly09M+Xjr5dhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57984538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 10:01:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 10:01:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 10:01:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 10:01:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 10:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njapwqWA2VYCJGepjB9qY6Ame8kJKPTVfgtV/LnK3k3GSByIOa8rqUbrrElgUEnVNwEbORCMwApdvsxHdMJEKtbWs7bWkHF1pQr2uE81hPygGUANEtI+z0zE53Tm/0e/gk16tjTrJiSuxcQ+KuFsOpn1veD6gbbo6YZm/RnFNVcZkfl0Pl/+xgmbdM1CVkffN77KxF9cC/xQvmBVenHX+RD5P9TgLZya5Za8pcYC8BeBeqkackUhDpF+yJlG4Y4ZfzKrPPcFTsC6KqF9YYn9+0bvKi4Rxjir+4vrBsIoveT+Mq+Xldhio5D9cwV2FNyV4jbA5B7pWVSy2H0NzbVmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsRaJj4H9Qc4mSckddU7MsEw8oKPVxJRgQ67/r1h2d4=;
 b=TTdg41uk4On4+JBmLKEXB6dd9llUxN8oZob0jNFdXVYs2gUJ16TdzPu1by0Y8I2Xm8Jd3l6T+nrqjJ9O3pWfo8WPTp1drl9xlx+9I2K8HO5WjGkDJAs3+ob4ExTAsytyCJpFCj5Q/8kf1fYCiF+ZK/xiFyi5y+CaV+iUZ96pjKQ9HB0+Za10kSHSy0VBldQ9TYhTJhOrRSIE71xlOguQf/UWh6Mo5va6W5+rkavd18+THi5HnPzGQ53j/OmgluEJcTLGhufFpwolQpIQIe6M2xW/i/GMHYK33pNPKOEk6/AuhRetQ9/xneWIw00s0jKsag/bvyTgk3ynEubmoP3QbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Thu, 8 Aug
 2024 17:01:14 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Thu, 8 Aug 2024
 17:01:14 +0000
Message-ID: <9617a5c3-b599-4e19-9da7-4f371ac5b37e@intel.com>
Date: Thu, 8 Aug 2024 10:01:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/bmg: extend WA 14018094691 to BMG
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
 <20240807235333.1370915-2-daniele.ceraolospurio@intel.com>
 <20240807235647.GE5774@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240807235647.GE5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d259439-7c69-4e01-c2c9-08dcb7cbb5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVpPclhEanBidThMYUtYMnJUTkZPTlNOVzZ3RHVhdkdLemI1ZXhYWFczdlRC?=
 =?utf-8?B?R21XenZ4VURabnJwVmhPdmREWDNJN0Zsb1N5azF4ektYNWNZMmRXWXl4cGNl?=
 =?utf-8?B?bG5sZUhmOEE2M08zNmxzUHpJaTBlcE9rbFd5YU40ZEJvWVJmcG44WnJ3RGtr?=
 =?utf-8?B?NjIvTC9uQVF4cGNhdEt2T1VWNkt1OWVoOURhQXRBMnBaaWhXdmxDcHlSRFZj?=
 =?utf-8?B?bE0xOThrUncrc3A3eFN6VC8raXM2Zmw4dGlRb3dYTit2dU5IaHE3Y3FrMVF4?=
 =?utf-8?B?RHBEdWdoM2hXa3ppYlpRZnNOUlU1QzRRSG5wYVgyT1ZYdkpUZWV4V1hFVGR6?=
 =?utf-8?B?OHpsUXEwSVpDR21sTm9FbFE1WUh4Sjk2UnNmWHkza0Rwc21LTThYRFAxVnow?=
 =?utf-8?B?R3VOQ0hMT3l5cWhFaGkxKzdnYTZDbUVzZjdxQWxSWUgzUXNoOHY4L0hkdkhL?=
 =?utf-8?B?bTFxbHpwMzkvMVcyankzN1pGeXJrV05udzJvNzRreDJoR0QyOFN2ejVJd1lk?=
 =?utf-8?B?QlZML0gyWjFxWDM1Zm80T1haOFVqNmdGS25jQ3hCYm9Oa2dzYzN4cHBHdENi?=
 =?utf-8?B?NjdkVTZwUFliNm40dXdKMWx2cS93UEVEYXJWUWNqSzJMN0doY0pGZWYyMVlE?=
 =?utf-8?B?bnI2eHpvakswVkZJMDNmTk9oSlQ1WGp6VkExVFpDN0xkQkZ6R3pzWjJwSlhY?=
 =?utf-8?B?Tm9DVDhFdis2TWxXa1MzY1ovRGlzSW9hZlA0Z1VWWlNESVZOanVJTjMySUxN?=
 =?utf-8?B?ZVE4RjVpRWN4NFpqcVdwWDY5bmVGMDE4Rk50QWYxNFRlOXhuRHFrZjYxMkQ1?=
 =?utf-8?B?VDAvSEJPYnhaRzFCWDl4c1FBTHVZanJHc0JDYW8zSlgyWDZkaHE3cDBwRnpi?=
 =?utf-8?B?b2N6ZXhFekFvU0x4UUlic1o5U1F5M1NvNmhBS2hnS2xyNTE0VzdGQi94cXAr?=
 =?utf-8?B?c1hnbGN1aWFIRUxKOWtqOXdEOW9tbUk3ZXlhZlVBbE9GRC9YWDZteHdUM1Bk?=
 =?utf-8?B?UmdJM09pV0pkeC8zb2R5anI4OWd1SWlDaDFGUzJJa3dLSFp6VzVzR3JXU2Rn?=
 =?utf-8?B?V0JwaG83T2h6MGhSRkFHQ1N6d2pLeTgxbWFtY3hxS2xpMDJzd3g1NVk3TFRz?=
 =?utf-8?B?S0xrdytoQ0RmYm51bzltRzVGbG0rcWZsYWtyUDZsMExyNE14VE5RSEFSTE43?=
 =?utf-8?B?azQwckdWZllBaU5hdjRCOUM2eUsxWjJqTHVtbytQVTdFRnlqR3lqeG9aUDNl?=
 =?utf-8?B?NGRQbm0zdlF5UVhGbHJOWUp4NDNxSmxvWlJvSEpMbUd3ZFpUdmVNc24zSmxT?=
 =?utf-8?B?SndEYXV6MXk4cDBKcDRycXVpR1pWZW81bHA3RDdHZWtoM1Y2MkVtTGUvU3Jk?=
 =?utf-8?B?Z29rQjRXb2FjMWFBc3lFQjlzWDBZYUlqTkVnL2NrNlF3OHhwNGZOa2pTVHRr?=
 =?utf-8?B?VGVZNWd4S2VZTkhJdmZMNDI5Q1RaclNBVEV1dDhKWDMwK0kwaytDMG1hMnFF?=
 =?utf-8?B?RFBnWVJDdXN2RHdPUTVFTW1sNHRrMVVsSWk4UmZRV2Myai9IL25mSjFzMGJo?=
 =?utf-8?B?Vmo1QVF5K214cVFENGp1T3lzVEJWMVlOOFdWOGExVmNWUndrUGVSZEMxWXll?=
 =?utf-8?B?T0c0U3ZaR3lRYVpaWCtEcG1ZL0FHdDZPTllTbkxUdXVCcmVSSnowSG9WaE1i?=
 =?utf-8?B?VzFpeVQrTlVPcnkzMUpyRjdQOFpyUFJOWi8wdnZBcGhQaHkvcXVTK0Uwa0lv?=
 =?utf-8?B?YzVKTTFqRERuSDdIR3dzcWhDOXFURC8zWUpIeE9MWDFLVE1LNDVrd2NpVmRt?=
 =?utf-8?B?MitRME9NR3RoaWpqOTNCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxHSzhJWFMzOTJUL3BGdmsrN3NZTzNrMEtXMjl2UHNzVHQzZEtLZFVFU0ZR?=
 =?utf-8?B?TGNEVll4bkw5eHBjL0drV0JWV1htMkNmcWc3RmJZVFdocUZqeGdvV0VGYmlp?=
 =?utf-8?B?OTd2NDFZRnRLaXN6NkZ0SWR2KzdOS3RYZVFJR0czMUE4eWRObGEyOVNSSG1R?=
 =?utf-8?B?NS9JM0FaeTF1dCtiTlc1SkxRV20xaUpBcXJkV044ZGN4ZHNOMWwybVdGUGNN?=
 =?utf-8?B?cUtrVmRKai9lMExTTmZCM0lBemQzeEV1YkpjMkpJdysxbklPY1lCeFBQTXNS?=
 =?utf-8?B?bGlXa1JyY2F3UzhTMDRRd1JZM0lUUEkwWHdpN0NrbHN0MjRTVkwzdEhiSG0r?=
 =?utf-8?B?b1dMeGZtQU5ZeERyRlFyeUhZbm4rRWROakU5NHhodElTYXdBUm9KV3gyN1gx?=
 =?utf-8?B?RUpnRk43S1lWOExHNmRXYUtsdXBUZkE5THlEY0h2ejdXMWlQNVEvelRJYXgv?=
 =?utf-8?B?bUJzVmQ2cnhIaVJCMlRRaEdKbU5ZSzdaTExmaHJtZ2lYZ0xkdkM2OGs0dEpz?=
 =?utf-8?B?d3R5cGtzalRCaCtkOEo5ZGw5WloxR3l3bjl1WXpEaU1icHJyY3o5MUJFcTZ1?=
 =?utf-8?B?eDl4WHY0TFk2Skx4NUNpaWtWbXJEYzZLbVpYL3lINVR0MUkzOGxwNjZrdkxo?=
 =?utf-8?B?c1lQRVpZTkZYSjJpSEFDdWQvZ1RsY2pkUm1aanBuZjExQ1llT0xjWHFCT3Nm?=
 =?utf-8?B?V0cyVndYc2NWa1kzV1Rza2p6MWpRTTkzQVowQ2lJdVliMFowd0FnVmZWM3lV?=
 =?utf-8?B?MlIyOFVrMjBDbE1tcm54WXZRZWtJekpkcXJ6QkY2UjJJWGNGcXJHbERZM3Nw?=
 =?utf-8?B?ak9tNFQyWXBsTEJHZHlDMmxyZzgwc1REalZ2SzBvMFlESFlkaHd2bVRMTlhN?=
 =?utf-8?B?Rm9YSEhFYzdBL2xyR0MwUmRSdHkvRkhGRnp3Vkc4UUJZd0xua2tSWk83VzE2?=
 =?utf-8?B?dngzYWUxRnFTS0U2ajlvUGsxdW4wdjFzVHB1YzZtWFhjV2FlVXlnT0FFdkRG?=
 =?utf-8?B?K29EUHhXR042anBkSWVLNy9iU2QyWnlXYkFkeCtsMEI5R3dWTy9nREJLZVdw?=
 =?utf-8?B?R2FpaVdjbXdQYWxBakw4V3lRUnpxYldhUWdWTWthYzZCdEV6VnNuUnZxR3pq?=
 =?utf-8?B?WU1yMSt3bHVnRjg1VXVtWlU3VFIyOTliZUZET2tqQWYzSkhiVWttbzRvbWkv?=
 =?utf-8?B?WFhaMG5jVzYyQzUweTM1enhnb2RGM0NjMC82NWMrckovRkVnS200a1EranlU?=
 =?utf-8?B?UGphMDZqS3FrUThSOURoUkh5U1RFaVJTaXVySUVOcEdRNXJGY1E5Mmd0b3dW?=
 =?utf-8?B?N2ZOSmoyK2pSVkVCOWpGWkdCczdrbU03Yk12WXN0TWJzbjhYelQyL09nRUll?=
 =?utf-8?B?MHZ3MVkwcEpNMEs2YjlMTHRKVDl1ODIzSFEwNFRqZFVBK0VEYUVCRldUVW8y?=
 =?utf-8?B?ZllrdlJjMWE0VmN4YzBFQlltYkgyMndIcUd3Nm81L0dEdWt1K3IycGxSODBW?=
 =?utf-8?B?VWVYakw1a1BRQmg5NGJHZFAzQllGUU9vdXJ1b1NxR2p5NkZPZDBJZjdvMjN0?=
 =?utf-8?B?MEZzWFc4bitGNy8zeWV5ZGhWci9Ka0VPUmxIRjVBdjdTNWFBUURBQTZaL2dN?=
 =?utf-8?B?TXlORFJxT0lhUzVNWFN0MnpocTNONHFoeEtNRHZrNDV3Q3V4RHQ1TU93ZEtF?=
 =?utf-8?B?RTFId21HakVNc1FZblZPZGlweENWN1A3aE51b1k4Q3JvVGFiNkRXMFVUTlRP?=
 =?utf-8?B?eEdJOXhWbW9xaC9RL0xsZktBeWxKcEY0MmJkNTZGNXR4NjNzUlliemFGWC9D?=
 =?utf-8?B?SkJKZmY3WmV2TW9QczUrcllBYlo4ZjQwckppdW8vdnpNZCtQY0tZRzJuWmxE?=
 =?utf-8?B?TmJOVXFMV2pvVG9QcEpjOGgyUWVVcDVuVnc4dnRmWUU5eGVXR09Xd2c3U0R0?=
 =?utf-8?B?VXNnZWFxai9LVG5uKzJhTkJVYWFTcnRMSENRQjFiT1pncU9QOUlJNll3OEtP?=
 =?utf-8?B?ODRmMVlNWlFKTEJ1MU1wRXE3cVpqUFRoRmpiODgvUXRNYy9PdWh6NFZEeGIx?=
 =?utf-8?B?bUg4cGRCUU9MT29ickFwemZHdGFzd0RVRVoyTHlzSVJSRWZYOEpyaEZ0YytR?=
 =?utf-8?B?bXhEMWIrbWJXN09FNzYyYVNKeXZzZWltRGJPZVY2U2tnK3M4cFMzM0NEKzB6?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d259439-7c69-4e01-c2c9-08dcb7cbb5fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 17:01:14.0907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV4cNoVj5EZ6DOsj9fVxK96YgTiDyJME4LwSkJsTWVcAx3NQ5mdsTeT1PWSYMrCapnxPt8cGOEjvUXMCOOGN7O6wg8HuWWu8TqMf+MTTGTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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



On 8/7/2024 4:56 PM, Matt Roper wrote:
> On Wed, Aug 07, 2024 at 04:53:33PM -0700, Daniele Ceraolo Spurio wrote:
>> The WA applies to BMG as well, with no changes compared to LNL
>>
>> v2: rebase on use of GRAPHICS_VERSION() instead of PLATFORM()
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Lucas pointed me to an update to this WA that says that on BMG the IFWI 
is going to do the register write, so we don't actually need to do this 
from the driver. Will drop this patch.

Daniele

>
>> ---
>>   drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 540d38603f32..f62cf6a4f6af 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -19,7 +19,8 @@
>>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>>   		MEDIA_VERSION(1300)
>>   		PLATFORM(DG2)
>> -14018094691	GRAPHICS_VERSION(2004)
>> +14018094691	GRAPHICS_VERSION(2001)
>> +		GRAPHICS_VERSION(2004)
>>   14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>>   18024947630	GRAPHICS_VERSION(2001)
>>   		GRAPHICS_VERSION(2004)
>> -- 
>> 2.43.0
>>

