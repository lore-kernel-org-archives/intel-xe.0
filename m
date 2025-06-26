Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3636FC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 16:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550E10E2DD;
	Thu, 26 Jun 2025 16:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHk+iww2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD93910E2D9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750956233; x=1782492233;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S+oTNQ7L3Ul5f5YLzw0SJHAudGBuaYmbYLQWAjWG7D4=;
 b=nHk+iww2NwDiAQSE+mzwQiu3pCsXtHPnBYbSPKq6CXaOjsHMrLQJBEH7
 oPfa1M+OlpnjxooDhSDKSGQsAqDwhJN7v2hhUbKmbzTD4AGYaenklt45t
 L5xhq/7B4MX4WWiKaU2CB/nTwiznCHhVvJ6gHFz2cgA3DaRKPmTSq7RH0
 JdlbQSsZjV267jtwGnBt/N6iByHWgYFlAENoXhBxkrZc3Dpl+g7R19BTS
 0uKKV4cX+iYr0jhkfNVcuuuCgpK4fYyrnTbsoBduFNTTbCD8/0/5KtEL0
 KoOWU88OJ5yD7DM5I2vSGGf/Ha9tSjmSubW3ftiCL+EefGqHiJmoM7MzW A==;
X-CSE-ConnectionGUID: xUTI0ZG9QZqe35VL088Omw==
X-CSE-MsgGUID: iMmd7wTdSNO4RMyqI/ZA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63859422"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="63859422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:43:53 -0700
X-CSE-ConnectionGUID: QoBcdT3TQgCaJobMvaJdEw==
X-CSE-MsgGUID: zecakCC8SMKVNDD/hfQzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="158063096"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:43:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:43:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 09:43:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr6jl1F2Jv766EuBwU6OJC0rSek4JCpNz1T0pW2saPpe4BP/XX0voJw+r/MgsjlmbGb2xaicaenpms3vrctrh/1OxpDrkuWW9OyfW+3rBZL/lSE6tyjXgJTJyrkKAYL5mVpHp0XtURoQiBSjQC9FHflees7b56zs1ObqdGI6VmK5qWgm5uNuVMqJHrwlR1ymzdsrAGdJR+o/TOVtk3FKM7YAfozgRl9k3Ps3SH27Ic0b34dnGFCulxMXcmstHYtUxBduC9OCafoTZNIZZjN904dCzXUFP7d7of1QghFmp8VTHezsxXRXYqH490hgWllY3z/1dfChwY/B26Cj+EXGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5xGT7g+8wF50wXjKbCUEOOdmEy0nLqtTb292LsIR4Q=;
 b=c4jR5BC6rGFR0/FoOK3ILbY9lQCzVWfgd4nw8Y6JB/d7BoD/frN1R+GYNsVCrlEyixN2dNA/3d9JSgWoKxxpfBlIoHWrvNzgJhSF2H7ZzQ0vuHsVNmCBpN12rbZj/axeEPPiRzQ/hA/5X5gqQqfpkXSHO1sdNJE5q00NiHvrJ/Sqq2EuKAVdT6Bg+CMfg6JV7i+lbn3OfV1Qza0YpHe7iS0cndGzrVsbVwa5APEnJOfHgU1OxDLbQVNkxYH8GYnTHouwk7/STzB610fcDYPxlm2d0T8rwFyLOvaYpi6KAQF33446TJiHDe5rP40jgUHaNI7hARLlo8AtOFcrM/LCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 16:43:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 16:43:23 +0000
Message-ID: <bfe228ce-af2c-46ac-8054-aa3ec311f3e8@intel.com>
Date: Thu, 26 Jun 2025 09:43:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
 <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
 <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
 <aFy8IhvCJG8ci6vR@lstrano-desk.jf.intel.com>
 <aFy8fLIMg3raxA/z@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aFy8fLIMg3raxA/z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV1PR11MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc2a687-4c43-48a7-8620-08ddb4d090ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDl5aUZjeXlROWlQTWFJcXlpaE1ZUCtkZlFMSnlnVURpVjJPeHdiUXB3S3dv?=
 =?utf-8?B?RnJUQWlxWFYxZ1lsQnlLU2RONGRSejdNaUQrR2dSQlhjL0hlY2hGT1ZmMXVn?=
 =?utf-8?B?TXBpMmtmeHB1OVdXeVNiRVNMZXFaNXZGV0MvRkJCQ09GVTdpRFNwbFo0TWo1?=
 =?utf-8?B?QmM2MTJGOHdrNC9wdG1HLzZ2S0FLM1E0NnBGUzU3ejZPRjJNcHZIZWFaWFNj?=
 =?utf-8?B?MXVjT1VYQkV0TExlS0thV1JmYjNrelhOSGVrRHhwWFRmc1FlS2ZKcWZodTdU?=
 =?utf-8?B?QnhjWFRkNEVqWXNvQnR6NTBZWlR4R3VCSTdHeFJ6MU16VXJPYzBWRDUyVUVh?=
 =?utf-8?B?S3I5bUc5akJZOXZ4MXBRRTM2MERzVG8walZtOGYwdHlYeUhCZjcxRUpXL1hO?=
 =?utf-8?B?SFhKem5YVlFyOGcrQkZ6aUFpN0k0bWhZa2NEcm5sSStuRVlCSDladkhENVo2?=
 =?utf-8?B?dUZIdllPUFBXRHBwQk1FSHVSdlFIdEI4SzNQaERlMWNRRVVoWENQdnBSVTZ6?=
 =?utf-8?B?MDBSMUxsbGdHbDJHRi9TV3YwVnY3L3lzS1BwbWRDb0dHVm9ELzFwOTI1OGVU?=
 =?utf-8?B?bUtvRWp3NXNWaG1VSUR2MzR6dEc5b3Jsc29lVDBpT2JqbHd4ZEtmd1VQZ0pv?=
 =?utf-8?B?aUtDRjJKTnNhYkthdGVxcjJGd1pZSFJTQzdIT0piQ0NNUjZ2WmR0L1BqdGRX?=
 =?utf-8?B?VE53Y2xQUWtYM1I5VEw3QWVLYi9mVUdCTlpiUzRtVGdnRGpBOFVsb2tvdjlZ?=
 =?utf-8?B?WkRYTzlIVmc2REk1ektSaDAxRnNtclQ3bHM3dDNxR3l5YW8xc095ZDRGWFZS?=
 =?utf-8?B?YVliQ0wxQ01yQUpxWDFjdXlVa0Z4YnhtUUxadU52ZEJlSmxsWHpPYkJsYllR?=
 =?utf-8?B?SDhiZXB1UmN1eW9Ha2Y2dkJPdURzWnlZVWk5Ty9DMGh1azFXV3dlN3hkNGx2?=
 =?utf-8?B?eWV5dnFxNmkrZS9jc2NYU1pWdEh1TmNmWWczVkxURlYrNEh3a3JlL1dkMm80?=
 =?utf-8?B?S0tBbklqM0kveEI2dEVHVlFxTzYrZW8zUHdNRytuYUJScEp3WDFjTm1SMWF4?=
 =?utf-8?B?MTBVK3JtTTAxRktycll5TWdEbS9ad29CWklzU3c4VkxkNGk0cEk0VUpDbTA1?=
 =?utf-8?B?d1hmWjMzQUlwblNvcmNTSElUVTZRRjdab2tLdzJCNjFDc2c3dHlTMUh0U2Zq?=
 =?utf-8?B?SXVRVFZGRHFqenZLMEppL0djdFFMbENxcUFQZjNWbWJRNEdtempPY0huZE40?=
 =?utf-8?B?SGZCZXZFaHFXVldIMUM2RE5yN0dBdDkxYTIwMFpYNmViSHFRR1pJejRpUFBJ?=
 =?utf-8?B?bUcvR2c5RVdxSjQxK0Nsa1U1aUFjOUhScU1UVm1pajlyaS9IbGdXT3B1RThS?=
 =?utf-8?B?TVAzZURtN0VJSzJOSnM2ZEJUQnAzR3JRaHNtQjNwSDZaZ2tQak1GR1VkVGE1?=
 =?utf-8?B?cGp0bkRoK0s4L25nTXpIVDVmYjkxV0JFaWFIcHRiOVJPOXI0MzJjZXJWUi8z?=
 =?utf-8?B?RFZPbERYekNmdmhHdlJlTGR0ZnlaS1ZhclVHTXBVazhyWlBmNDN0RXl5ZEFG?=
 =?utf-8?B?THNPd0ZIMU5VZEsvYStmV2E5dmNqa251dCtzTDZNWDI0UHlLL2FNTXhTdTVp?=
 =?utf-8?B?dnVldGpMd2JSaDREN09VSThPYkdvU2lHeEZXbmJ3eFhYejUzdmFJTFhteSts?=
 =?utf-8?B?UFExYnZKWktFQWNxNWNLdUYvM1B3RTFzVWw1RnBiaTEzQWV2dXFPeHJGZytl?=
 =?utf-8?B?ZzBSTHN1UDUyai8rM2ZRNE8wMUtaM1VweTZqbGJPdUs2N3FVKzF2ZG1uc0Jv?=
 =?utf-8?B?eWViYjZFRnJHZmxFWnc2Y250OHRtWTZWdGlzRDY2Vks1elNvZGVHanAvTUlL?=
 =?utf-8?B?M21kRjI2L3lQUXF1YVJ4TGFSTzRxelhXcWJ6dkFYMjEvcGdtY0ZQUk8wT0hU?=
 =?utf-8?Q?fc0R2mM0ZDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtHQ1Faa1dFQ0c0K09XdnBJek96bkM5VzNycitmOEV6dk92YW9HS3o1MWNS?=
 =?utf-8?B?M054RVhRYWJBNW9VUGJ2dUpweFpPSEd6S0gvaEtCT1RXbTl6Z1FWUmtTY1Rp?=
 =?utf-8?B?eEpZWVI1TFdJVHU1UjRMcVFCelhldDFBMmhOWDczenVscFBHNE1ET0hlVTQ1?=
 =?utf-8?B?cGtncCtLbGRJRWEyTU1CeUJsM05pSk5tNzZaNGVTVlhpT3d3d1N2VUFxU3p0?=
 =?utf-8?B?WE1yL3FZYmpLZWxHQndLMFh6R3V6amhkNzRFYStXdEg1TUdVMzF2UTNvMUJN?=
 =?utf-8?B?ZTY3RnJQTXF2Mk1oRS9Jcm0wWk5aSmJzcGdDaVpidkVMV29HSzBGV3BJWmlJ?=
 =?utf-8?B?Zys5K3k2aFpMZG1kdHl6SWtzaXd2cFM3dDQvYTBVdStZQm9DTVdaVFRDZUl0?=
 =?utf-8?B?YXZKVElTRFppL29MYU1OekUwM1VVcTkvWWh6NFBBV253YlpXTTJMSFpySnc4?=
 =?utf-8?B?ZklsU3B2WUVQVTRKOWt1WkZnVkxhYUdPdWIrR2UrczVITUxmcHNmYUZodkhL?=
 =?utf-8?B?ZThRMDBGV3FaL3RYZmZpRUdzRGNRUk4velQ5aHZnWEducWFmZzBXK0hTZ3Jj?=
 =?utf-8?B?Y3RtZVRNL3ExTFRyQkIvaG4yVEZ4a0lrWjZvNmtkTFEyemgzZmhUSk9FbHJL?=
 =?utf-8?B?SFpXNC9BT3YyOTA2QlR2VTQrT244Sk15MmhSTUh0U2Z6Q2hTNDQvNFh6elRB?=
 =?utf-8?B?NlYvZmxYUjNKR0tOZzVNc1RaT2JLbFR0UmFHcGluZEhDTVdjTTRLVjFTTEd3?=
 =?utf-8?B?bGhTV0ZXZmVmTjRKRmRRMEU1cTF2aU9EUU9OQmFDNUxlR3RKQTdwNXFjWjcz?=
 =?utf-8?B?Wm5TUWxTQ0Znd3JPMVhWTzdTQlBoNDVjN1k3YlZyOGpxejRLdjdibE5vVXIx?=
 =?utf-8?B?d2RUd2xyYVR2WHVwYVFwM203NnJIdjFMTjVtMlMvK2lMMndaN2R6TGFybkpz?=
 =?utf-8?B?L2pRV3MxSVZ5Tk9FRm8vdC9xOStBSlFCdnNyZ1Q0cXc0ZVNwZXY2Y1VZT2Y1?=
 =?utf-8?B?QVZ3OWY1azhvTEFJN09FdU5QWXp5eXV5WDBjK2VWZHhaZklDbVFsdHNKcThW?=
 =?utf-8?B?Mm9xL3RvZFJjWUJVTjUxUXlxcWFEZzJlN0ltUDAvUVNWSlBRTDVYZnhyanR5?=
 =?utf-8?B?elhuNUR3WWFvSXN3eVdGRXcxNWNwQmNUSUxLaGVFRmF5Y3ZFT21IU1FtVjRu?=
 =?utf-8?B?dEFqcTdJUjhseTZXc3ZFQyszUjR6L0NtWCszVVYxMnJ3OXlQOGdLRmdZdmVB?=
 =?utf-8?B?OGJCUjZxTVYxNjNZTHkyUXQyYmQ1QXBHYnFMLzVuTmozT3J1MFZyWmc3YmJu?=
 =?utf-8?B?TGJqd2pldVRYZ2YyY3k4aU1uQUlDVkswK0E4VGFsNU9URWJ0NU1uQUJzNXBp?=
 =?utf-8?B?NzNiY1RKSlJmbXcyZkpmNDBTaXRrRGZDMVAyalJxb3BFZEM0SmlHa0hBRUpt?=
 =?utf-8?B?SnZWbnV6QzFEL3lsUVJHUXFVb0VGVkg1eEliL29EUk93UUFpbis2Q0ZMeG03?=
 =?utf-8?B?Y3dJQnU2R2h2eHpIQTNwaHJSbXBkZ2k3Z3ZIT1NvT1kyYXdkNENqdm8wazd1?=
 =?utf-8?B?WkZPTXRkajBHWGFwNk9XRFR4VGxQRDhoR05GMkhRaVBBUXErVXc2MWRZSkor?=
 =?utf-8?B?djJ5L3VnYmNiblBpb2tTb2VKWTBrNmlUazR0bWlWWXRseTdkTFNzZFVIaUJq?=
 =?utf-8?B?ZnFtTitaR3N5ZGtpYUttQnE2TllvMitpL3ZQQTdydGUvQTU2alhpTWp5OGFR?=
 =?utf-8?B?MkMyakw4eXN5MGdvSUhWb2djUGpNWmx6REkrSXdKczd2UFcxS0lhVHk3ZWtK?=
 =?utf-8?B?Y3VoQUNqMGVobThMbjRZaTBoRklIMWN6cW1sNVNjc1BNb0tsRmZNcDNuaUJs?=
 =?utf-8?B?TTU2RmZlVFQ3WFFaeVN2L3RQTDY4aGpsc2EyQ2diNDJUVmd2bHh1b1JKdEND?=
 =?utf-8?B?ZjZYcmR5Tk4vWFNrL0d4MXFpU3Nha2RhZjBibllnUEg4cVJ2KzdBUDk0Qmt6?=
 =?utf-8?B?M1VDQWxDSm9CQmhCQy9tOS81WnpTOFpyRGlIWVo0SWc3SlFzaXJWUUVxZURY?=
 =?utf-8?B?RzdvTzFhREVhUXkvM1hhWUVQa090QUJlSDR2V3ZJV0E3dXk1SWUyVmlERlJh?=
 =?utf-8?B?QmhGcEdRWVExelJsOFFQME1SbmNVS2VGQW9YK2lyeUhhdlNIM092MXFSemI5?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc2a687-4c43-48a7-8620-08ddb4d090ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:43:23.1509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofFNQaq0cW8FWWuwhAjzhl+3IQiIhj6Y0kNE8H8LGjGPGMj3ktuj2gtBbs4Vxep3nUxQEVIzw5MPa7Zbe0fmoA3hHrmKWz6NNR8YV0uBkpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
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



On 6/25/2025 8:20 PM, Matthew Brost wrote:
> On Wed, Jun 25, 2025 at 08:18:58PM -0700, Matthew Brost wrote:
>> On Wed, Jun 25, 2025 at 05:05:59PM -0700, Daniele Ceraolo Spurio wrote:
>>>
>>> On 6/25/2025 4:54 PM, Matthew Brost wrote:
>>>> On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
>>>>> On newer HW (Xe2 onwards + PVC) it is possible to get extra information
>>>>> when a CAT error occurs, specifically a dword reporting the error type.
>>>>> To enable this extra reporting, we need to opt-in with the GuC, which is
>>>>> done via a specific per-VF feature opt-in H2G.
>>>>>
>>>>> On platforms where the HW does not support the extra reporting, the GuC
>>>>> will set the type to 0xdeadbeef, so we can keep the code simple and
>>>>> opt-in to the feature on every platform and then just discard the data
>>>>> if it is invalid.
>>>>>
>>>>> Note that on native/PF we're guaranteed that the opt in is available
>>>>> because we don't support any GuC old enough to not have it, but if we're
>>>>> a VF we might be running on a non-XE PF with an older GuC, so we need to
>>>>> handle that case. We can re-use the invalid type above to handle this
>>>>> scenario the same way as if the feature was not supported in HW.
>>>>>
>>>>> Given that this patch is the first user of the guc_buf_cache on native
>>>>> and VF, it also extends that feature to non-PF use-cases.
>>>>>
>>>>> v2: simpler print for the error type (John), rebase
>>>>> v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
>>>>>
>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
>>>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
>>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
>>>>>    drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_guc.h              |  1 +
>>>>>    drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
>>>>>    drivers/gpu/drm/xe/xe_uc.c               |  4 ++
>>>>>    6 files changed, 93 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> index ff4f412c28d8..81eb046aeebf 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> @@ -142,6 +142,7 @@ enum xe_guc_action {
>>>>>    	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>>>    	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>>>    	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>>>> +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
>>>>>    	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>>>    	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>>>    	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>>> @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
>>>>>    #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>>>>>    #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>>>>> +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>>>>> +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>>>>> +
>>>>>    #endif
>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> index 7de8f827281f..5b2502bec2dc 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> @@ -16,6 +16,7 @@
>>>>>     *  +===+=======+==============================================================+
>>>>>     *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>>>>>     *  |   |       |   - `GuC Self Config KLVs`_                                  |
>>>>> + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
>>>>>     *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>>>>>     *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>>>>>     *  |   |       |                                                              |
>>>>> @@ -124,6 +125,20 @@ enum  {
>>>>>    	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>>>>>    };
>>>>> +/**
>>>>> + * DOC: GuC Opt In Feature KLVs
>>>>> + *
>>>>> + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
>>>>> + *
>>>>> + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
>>>>> + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
>>>>> + *      containing the type of the CAT error. On HW that does not support
>>>>> + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
>>>>> + */
>>>>> +
>>>>> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>>>>> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
>>>>> +
>>>>>    /**
>>>>>     * DOC: GuC VGT Policy KLVs
>>>>>     *
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 209e5d53c290..4a7c467ad669 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -29,6 +29,7 @@
>>>>>    #include "xe_guc_db_mgr.h"
>>>>>    #include "xe_guc_engine_activity.h"
>>>>>    #include "xe_guc_hwconfig.h"
>>>>> +#include "xe_guc_klv_helpers.h"
>>>>>    #include "xe_guc_log.h"
>>>>>    #include "xe_guc_pc.h"
>>>>>    #include "xe_guc_relay.h"
>>>>> @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
>>>>>    	return err;
>>>>>    }
>>>>> +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
>>>>> +{
>>>>> +	u32 action[] = {
>>>>> +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
>>>>> +		lower_32_bits(addr),
>>>>> +		upper_32_bits(addr),
>>>>> +		num_dwords
>>>>> +	};
>>>>> +
>>>>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>>> +}
>>>>> +
>>>>> +#define OPT_IN_MAX_DWORDS 16
>>>>> +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>>>>> +{
>>>>> +	struct xe_device *xe = guc_to_xe(guc);
>>>>> +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
>>>>> +	u32 count = 0;
>>>>> +	u32 *klvs;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (!xe_guc_buf_is_valid(buf))
>>>>> +		return -ENOBUFS;
>>>>> +
>>>>> +	klvs = xe_guc_buf_cpu_ptr(buf);
>>>>> +
>>>>> +	/*
>>>>> +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
>>>>> +	 * to compatibility version v1.7.0.
>>>>> +	 * Note that the GuC allows enabling this KLV even on platforms that do
>>>>> +	 * not support the extra type; in such case the returned type variable
>>>>> +	 * will be set to a known invalid value which we can check against.
>>>>> +	 */
>>>>> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>>>>> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>>>>> +
>>>>> +	if (count) {
>>>>> +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>>>>> +
>>>>> +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
>>>>> +		if (ret < 0) {
>>>>> +			xe_gt_err(guc_to_gt(guc),
>>>>> +				  "failed to enable GuC opt-in features: %pe\n",
>>>>> +				  ERR_PTR(ret));
>>>>> +			return ret;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>    static void guc_fini_hw(void *arg)
>>>>>    {
>>>>>    	struct xe_guc *guc = arg;
>>>>> @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>>>    	xe_guc_ads_populate_post_load(&guc->ads);
>>>>> +	ret = xe_guc_opt_in_features_enable(guc);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>    	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>>>>    		ret = guc_g2g_start(guc);
>>>>>    		if (ret)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>>> index 58338be44558..4a66575f017d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>>> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>>>>    int xe_guc_upload(struct xe_guc *guc);
>>>>>    int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>>>    int xe_guc_enable_communication(struct xe_guc *guc);
>>>>> +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>>>>    int xe_guc_suspend(struct xe_guc *guc);
>>>>>    void xe_guc_notify(struct xe_guc *guc);
>>>>>    int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 26c6c71dc91a..32548c931615 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>>>    	struct xe_gt *gt = guc_to_gt(guc);
>>>>>    	struct xe_exec_queue *q;
>>>>>    	u32 guc_id;
>>>>> +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
>>>>> -	if (unlikely(len < 1))
>>>>> +	if (unlikely(!len || len > 2))
>>>>>    		return -EPROTO;
>>>>>    	guc_id = msg[0];
>>>>> +	if (len == 2)
>>>>> +		type = msg[1];
>>>>> +
>>>>>    	if (guc_id == GUC_ID_UNKNOWN) {
>>>>>    		/*
>>>>>    		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
>>>>> @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>>>    	if (unlikely(!q))
>>>>>    		return -EPROTO;
>>>>> -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>>>>> -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>>>> +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
>>>>> +		xe_gt_dbg(gt,
>>>>> +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
>>>>> +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>>> Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.
>>>>
>>>> It would be useful if we had this defined somewhere in KMD headers or
>>>> even more useful if type was accompanied by a string description.
>>> The type is HW-defined, the GuC just forwards it. AFAICT the values are not
>>> guaranteed to be the same across platforms (the Xe and Xe2 lists are
>>> different, see bspec 54047 and 72187), so I don't think we want to maintain
>>> a list in the driver.
>>>
>> Maybe throw a comment a comment in here for bspec links when merging?
>>
> s/bspec links/bspec refs/

Would this work for you:

"The type is HW-defined and changes based on platform, so we don't 
decode it in the kernel and only check if it is valid.
See bspec 54047 and 72187 for details"

I'd put it above the check for "type != XE_GUC_CAT_ERR_TYPE_INVALID"

Daniele

>
> Matt
>
>> Matt
>>
>>> Daniele
>>>
>>>> Matt
>>>>> +	else
>>>>> +		xe_gt_dbg(gt,
>>>>> +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
>>>>> +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>>>>    	trace_xe_exec_queue_memory_cat_error(q);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>>> index 3a8751a8b92d..5c45b0f072a4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>>> @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>>>>    	uc->guc.submission_state.enabled = true;
>>>>> +	err = xe_guc_opt_in_features_enable(&uc->guc);
>>>>> +	if (err)
>>>>> +		return err;
>>>>> +
>>>>>    	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>>>>    	if (err)
>>>>>    		return err;
>>>>> -- 
>>>>> 2.43.0
>>>>>

