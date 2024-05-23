Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0DFC25B7D
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 00:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425E10E31C;
	Thu, 23 May 2024 00:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T174LJ3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBE710E31C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 00:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716424561; x=1747960561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NMiOy/T5LyUXL1T01wLHFCG8NwmzOpqg1T4W1y1CVP4=;
 b=T174LJ3kcCBmzQzeIWK8JnSlT8I12WN5d88AzZZGg4rjNEPp1DlJek4E
 TRjI2jryOUUty3lduNVfQdbY7KR1UBEBYVVANOXk3eGrGq5ZFV33QFrAp
 /SxlYheAUfiiEcb8nuTxfNEbzKMNR6brDjoYyPpTmUMhjZCzNZvCuGCoq
 Fd3w6ZspK9Ylk2hXW3L+BcVc9ZIpkpWAOxIB0GkloCpgXE6LbOA4Kl1ht
 Zc9Y6NewrVZqRqXYFlthnfhBg8ucLopelBVxArax/72fTfkMIpzTsb5+2
 Abi1EaYX6IjC1uvpowTnxxu4K2Dz2YUXbuaJuhf0AP8OL2JUq3CpGGodf A==;
X-CSE-ConnectionGUID: wotwZmoETy25l9O8RrOvBQ==
X-CSE-MsgGUID: 1DIit5ynSgCzQX0KzgIV6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12650531"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12650531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 17:36:00 -0700
X-CSE-ConnectionGUID: zggy9s3mSaG7nJrZEUolSQ==
X-CSE-MsgGUID: xewe19LCQvy2OGlP50TOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38316164"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 17:36:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 17:35:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 17:35:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 17:35:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 17:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0VcDcvj7FnKEBGERBO/3NkO0/gN8GL1bEakXw27dxEZ8F7zYUMI8z5i2brEoVuAitMsUvvgcmRDjZ2jZ6wtjGZNfPOZxdD/UlBdP3ESp4LM4F+O/yngKA7RAf40fnZTLiOl5auwAPa2/CT7NmxXs2zBV84ZsxCyThH4eZnPmOAPaKBt2vMVdQoWaLcyGZQ9Af2PBWoES/pd+R4NB2Ywk3lAyxF9P5BizQ8icDu+QSFuVSW9hNmeRyOnvzV8eKIjN8fCWgHjiEmS0wEVZaNWveE70wTFOx50AHNH70W7NtECt1vM4HhDG16ZPoo/WC/EAO/KA/MeMPPtBH+3EXukrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r26MewnP9awXdLXnlYuRkaPYyY6FgClqZ2AWbAUW6Mc=;
 b=fA/y74/gesvsNMXqEa8Vp/biqKi7hRBk6zwePfB7rHlpZqaZjElPWWtqNv+Ywlxfe254R02Vmxcfz259XvMOignvh0sicjg6eRfuW1Dy567FuTonakZnOLqP+aaxbesqgd055S+Do0aQLU94X9Z2O+WPeEqqaBgob1wI8iqFjhME0LnLc8oZRub9DVwGzzbwWjViTISPSCpYiluiiKz/PYn5HL8dA7/9NG43M+l3p4A3mz2q0vYKdKIOX4P2Z/5ecqntCZu4hzxXO+8Cd2wbdBbEhFitigT9sTZDyKQ87YBPeSJNQtpO48w1vruO3iyKZ2/VKpvyIUzUc7gI6U7LKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 00:35:57 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 00:35:57 +0000
Message-ID: <dccadb04-7aa1-428f-9d6b-4bc0f328ea3d@intel.com>
Date: Wed, 22 May 2024 17:35:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Nuke simple error capture
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240522203431.191594-1-jose.souza@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240522203431.191594-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:a03:54::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b735ff1-1df0-416e-2546-08dc7ac04fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFljVDNPbytXb1Q3SU9XLzJQcS9jRHhwcC9CbzNEZlRSNld5WnVBVGZaVjF0?=
 =?utf-8?B?MWtQZFRmclIyM1ZuYUZ0YmxxRndYczhpR3IwOGhCWmxhQWdvNFJoZkoyTitt?=
 =?utf-8?B?dktwRHg3dWFvUldjNWJlWWFMU1RldlRvMEh4dUtXQ2xEWWtqcGNYM3pQZ09W?=
 =?utf-8?B?L3UraHl5Y215eUlvWFR4QS9vTHEwVnUwbWxpK3RXSFp0L1F3SmYzVkJuL2lD?=
 =?utf-8?B?MEc1R2NwcFBIYnV0d25FenM3RVJndEUrUVJLSGdVRkJ6NHVYOE5jMkZqNjBU?=
 =?utf-8?B?R0xkL3BrbkxNUUZackV3YzdlZ2l4QVI5VkZJZWxadXg3Nko4WXlMUU9ucnYr?=
 =?utf-8?B?Vkp0ZDZCd29MR1dWM29WMXFocFN2MmtiVlNkbG5EcW4rNUpPL1ZqdGJPb1h0?=
 =?utf-8?B?Rm11bG5DMGk2ZUI2ZWFuY1lXR1B6cHBaRDY1UlBJOTdIemhsQ3ltcHRULzFY?=
 =?utf-8?B?M1czdmNMT0R4QWcrRmNZZ2dzM1lZdjNHSktDTnZmMnlJNmRlYU53dHVTSi9J?=
 =?utf-8?B?SEg5UFdaYXRTQUhEM3lkalhQUFJzRU5uckdINmFzMTdkU2VrckdidXh2MGpX?=
 =?utf-8?B?NmFLRHNxUjZZK2w3OGtHdldEU09CVUlmV1dINHZzamVVWlArYll6d2FjOXZm?=
 =?utf-8?B?TDNpb3d0RENzbllvK0ZMQUpNWlZyYWpGcUpXeThlQ1czQTVjTTRUR3pxUXQ1?=
 =?utf-8?B?ZWRkZk9ScUhFYlJVOWdSNVlyUm9LRTU0dWtkZlRHRjFzbDBVNWVJcnl3VVhx?=
 =?utf-8?B?YVRIR1E2eGV5ZUtEaHFHYVpHbHVjTGtPUHdaOVQrTnFoQWhKS3gwamZHcWE2?=
 =?utf-8?B?WDV0SWYzcnFyMGN6bEQ2M1hrcW9PUVE2Q1N2blNmN1haQXRQdWlvVm9PcHJw?=
 =?utf-8?B?SC9jR2ZuYS9yNWdTL1ZjRzA1TmJXZE5pSEFjSEZwUVh6aCtka1F4UDFDUzA0?=
 =?utf-8?B?WXVOaHplTEsyMWxmanhRSnJpOWhKVXNwMHM4Ri9sc0IyTi9LUGFkekNEMVQv?=
 =?utf-8?B?UGw5dm5jN2EwSndBdXpjakhtUVFzQlVVS3lJRzFyTitQcjh5a0ZjS3FwWC9q?=
 =?utf-8?B?ZFVFcmlaS1kyTVlLNFlJQnFxeXhkeGtGRk9QL2MyS3dEVXM3NDd6VWVzL2Zz?=
 =?utf-8?B?RmRTbzVUaEluT0xMeDB5MWZ0cXpsUkxaek9hRGhDVnB3bDZkUXVtRjBHMmxS?=
 =?utf-8?B?N284YzFaZDJwbEQwQnNwWDc1dzhEbm5EUGpFOXhVcDhLeWwydHhpVCtWSWJo?=
 =?utf-8?B?NkV1cXdPRTIxUzhnS0Eya0JVeXhiUWRWZk40V0RDeG1YN2RBMTEyaGRNS1pr?=
 =?utf-8?B?S0plSWcwQmF0aElSV2wvUGlVNVpQdnd4V1BNM0RYM0JJd01XeGFDbEtsVkhX?=
 =?utf-8?B?RURNbmgzUkgzbXdUak1Oc2VMNjZuVE1VWlZpUW56NlRqVmxJNXZuNndGMVpw?=
 =?utf-8?B?Qk8xSkc2bzZyd1RNVDFvNC9TWktoVENpU1liRTlCaG9kb21GWGQ2V2ZTMVdY?=
 =?utf-8?B?cTdiUnlHR1FjaXFGbjJKWGRiRklTSXc0ZUk5emsvL3JFOGhmRDFrS2JXOEhs?=
 =?utf-8?B?a2FjY0E0TG5qd3lsZ1dOQzVBU3JSc1B3djBWeXcvQ21TeWFTUjV3ekVmalhB?=
 =?utf-8?B?UDVYTWZaYjFFUnJTcEl5UExWTVBWcFdvM2I2SEFEV1dxSzNvWFJKUG9kWjM2?=
 =?utf-8?B?RmlrOXpoT0liajVybndyTWcrQ3BXbUwwOE9XZ3VRQnYwVHVCbzYzV2hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNYTWUyVC9zbkVzZURRbFNvRzNvSkIyWHBFaGFHanRjNWN3bGk0V21GWkw4?=
 =?utf-8?B?RTk1WUx5WXg1L0tvZ0RTMjhhQ1VINjVlWjlCdlladkV3R3d0UFBDRVljRzRv?=
 =?utf-8?B?cDNXNFVmdmNDTFplaHZNWW9ha0RrL3R2bkhrRVBsRTVnZmpjeDA1SkdEUFo2?=
 =?utf-8?B?aU5SYlNndWsyMFE1Um5wZnVWRUY5cHM3azR0N01MbVlSTFA1Qjc1OTVvSElD?=
 =?utf-8?B?UnRMK1V0aG5nNjFhTXF4ZklwMWE3c0xNL3ZaaUxleDJnSEN3TmlLenhLbUwz?=
 =?utf-8?B?SWYvUHBITjJVTkZKWUlTbHhaTG1zckVYN2VWbktrMFlwc1FtQW1DYUlzTmJR?=
 =?utf-8?B?UVFzdTlGV2QvcjZtcE9ZOUhHWStRVTA0VXgvSHBqWnpWS1hQYnVaUDljdE9s?=
 =?utf-8?B?YWRKOGxSSWJhZzdKVTR1ekJyaVlPVkhiL3hlMGk4aXRpQlR1VElmL0Z1aGdB?=
 =?utf-8?B?ZDd1WVdMVW94Nk5DSW0rZnRQRHBtUC9OTUpuVEFKai9TSi9TZDJTUVFWWDJU?=
 =?utf-8?B?OEY4bnlteHBScVo2Y1UwdmxXb3MxUjJKVzVtSzdzOGFiVUtEdHkzNkQwTUFR?=
 =?utf-8?B?cy83c2NWNmdIZGdUUXZWWkMybWREMkxOUFRZS0s1M1JHcGNDZWdRaVpWM0ZM?=
 =?utf-8?B?N3V0TExFMExHeUgvVGhUbzhPSmwwMlNHbTFLVE9pNHBIQjRSWHZjbWY1MTdP?=
 =?utf-8?B?bnhyMElOOVZ0OUIxVGtuamJ0VEQweVBLUXhYWXZRMm1XV1ZkdFpYakNhOGJa?=
 =?utf-8?B?Z2tDSHZPSzFaVUFSSW1Pd2FNM3NUNEJmVnJMaGtNeWlFSEExUWJtZ2xodEdS?=
 =?utf-8?B?STVIRmxjYWxBWmJNb1ZFdytrY0ZnTnBsbkhXUytSYVdyWUk1YU9PeG1Tdlhp?=
 =?utf-8?B?TFRHRVJXTVlpUVJoQ1VtZUlVc0t2ZW45UUo1Q0tXYXR5Q3pQTnVDWE4zcG1h?=
 =?utf-8?B?TURrd3JnWU43eGNtQUU2ZWtuTU9hMmhDN3Z2VjJ0OFhjZ25DbEV1NU9IQWw1?=
 =?utf-8?B?OUVKRGRqKzBCYTlRUnppQkZQSEdxdHp2NUd5WjhrL255RGZzeWtFMU9YTmd0?=
 =?utf-8?B?UVFkMGFObHQ2YzA5ZXVWYThqNXFlTWFmTG0wR0grQkw3RWhLRCtnU1BpeXlP?=
 =?utf-8?B?NmthNVNhbFNtTzkxRGF2TllpWDljTUl4UGhrWWNsUzMwQnUrSy9wYWdVcEVo?=
 =?utf-8?B?dTB4MU1LdldCdWlSTjZjUXBxMGgzS3p6VmZrWGdPUXF3WkpId0s2N3JqTVhZ?=
 =?utf-8?B?MUVOblkrZDh0S0o3NEFuNXhoQXZFemtNQ2czZkowTWlhSHkvTXllZnVGY2s1?=
 =?utf-8?B?UDBPR0Vwa2ppeDhoNy9BQ1RaM0RJelFiU1A0QVVua2FDdHE1Sk1ERW8wVFJi?=
 =?utf-8?B?NDhpbjUvcXg1K2piY0ZxNkRkSDZKeEgzemt6K2lpV3hLWVVndHBvMmV5cmdw?=
 =?utf-8?B?bmVuN3h5ekc5MGhsaC9PQUUxSzVzSFV6RUxRK3FoeUE5WHEwY3ArSEhTS0Fn?=
 =?utf-8?B?bDNEWGVjQ3puQ2JjVWNvZDI0SDFxaTVyWHVTb0VpVnlHWlNhRU5pV3JyWUVJ?=
 =?utf-8?B?T3liL3BreGgzQWg0SlNqTzc4T2ZGMzV0elhvcC9GVVVneDJ0S3F5ZmMzT3dy?=
 =?utf-8?B?SGxSQzcvYVVyVTE0YUdWZGFLUytjSFpBYW5FK0xIL1dEdi9HdHpvbGZ2bzBv?=
 =?utf-8?B?ditNRjBZUjhGVHpsR0FPS0lCNjFHZTNrQm96aURpVlY3NVFvNkFJVXpONVBZ?=
 =?utf-8?B?cE9HS0FiU1VTNm5Qc2lROGRTREIrVmJ6emRiMUV1eXVMQWZmS1VSdGg0N1lx?=
 =?utf-8?B?UUkyVnkrVlZSTjhqY0FQNlRkT1NKK250TlBvc0Y0djJHcXNqL29xcWZpcFBT?=
 =?utf-8?B?OFl1VXJjbjVZL3IzMU1RZGF5alBWM2Z5K3dQamRHUERVeWg2WjJUNEJhUkI0?=
 =?utf-8?B?d0t2aFVrVEcxd3YvZVJOcW9YN0tKeGZheTV2SXl0b1cxUStnMElyM3FBQ0po?=
 =?utf-8?B?OG9jcW5pOXA4UkZNK1BINlRJVHRHblNhNEZhakJYUkhoS241aDFna1VOOTBq?=
 =?utf-8?B?anJ4dUVhenY4RHVmemVPUTFYOUpZc1B5empBdzRyOHlYanhVeVR1cXFJYjNE?=
 =?utf-8?B?ZVhWeEtEMUluMy8wRDI4V3BZZU9EN0tMRlJ4NEEyZURXcUZBUWpwby9pSGpR?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b735ff1-1df0-416e-2546-08dc7ac04fe7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 00:35:57.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23xp5o0E6mx8+jjFtYI5M99qGEL5fhcM6McZEjvSb5nU+f+KzCNTLnoWKsppJBpA4R3sXZZX7cHzOh2JNuCifak9p4Ad3HdoWDX/rl+F6TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

On 5/22/2024 13:34, José Roberto de Souza wrote:
> This error capture prints into dmesg HW state when a gpu hang happens.
> It was useful when we did not had devcoredump, now it is a incompleted
> version of devcoredump that has potential to flood dmesg.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/Kconfig.debug   | 10 ------
>   drivers/gpu/drm/xe/xe_guc_submit.c | 53 +-----------------------------
>   drivers/gpu/drm/xe/xe_vm.c         | 49 ---------------------------
>   drivers/gpu/drm/xe/xe_vm.h         |  2 --
>   4 files changed, 1 insertion(+), 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index df02e5d17d26f..bc177368af6c3 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -61,16 +61,6 @@ config DRM_XE_DEBUG_MEM
>   
>   	  If in doubt, say "N".
>   
> -config DRM_XE_SIMPLE_ERROR_CAPTURE
> -	bool "Enable simple error capture to dmesg on job timeout"
> -	default n
> -	help
> -	  Choose this option when debugging an unexpected job timeout
> -
> -	  Recommended for driver developers only.
> -
> -	  If in doubt, say "N".
> -
>   config DRM_XE_KUNIT_TEST
>           tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>   	depends on DRM_XE && KUNIT && DEBUG_FS
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 23f73577facf6..f0a5215159003 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -815,55 +815,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>   }
>   
> -static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p);
> -
> -#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
> -static void simple_error_capture(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct drm_printer p = drm_err_printer(&xe->drm, NULL);
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -	u32 adj_logical_mask = q->logical_mask;
> -	u32 width_mask = (0x1 << q->width) - 1;
> -	int i;
> -	bool cookie;
> -
> -	if (q->vm && !q->vm->error_capture.capture_once) {
> -		q->vm->error_capture.capture_once = true;
> -		cookie = dma_fence_begin_signalling();
> -		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> -			if (adj_logical_mask & BIT(i)) {
> -				adj_logical_mask |= width_mask << i;
> -				i += q->width;
> -			} else {
> -				++i;
> -			}
> -		}
> -
> -		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL))
> -			xe_gt_info(guc_to_gt(guc),
> -				   "failed to get forcewake for error capture");
> -		xe_guc_ct_print(&guc->ct, &p, true);
> -		guc_exec_queue_print(q, &p);
> -		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
> -			if (hwe->class != q->hwe->class ||
> -			    !(BIT(hwe->logical_instance) & adj_logical_mask))
> -				continue;
> -			xe_hw_engine_print(hwe, &p);
> -		}
> -		xe_analyze_vm(&p, q->vm, q->gt->info.id);
> -		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> -		dma_fence_end_signalling(cookie);
> -	}
> -}
> -#else
> -static void simple_error_capture(struct xe_exec_queue *q)
> -{
> -}
> -#endif
> -
>   static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -995,10 +946,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>   		   "VM job timed out on non-killed execqueue\n");
>   
> -	if (!exec_queue_killed(q)) {
> -		simple_error_capture(q);
> +	if (!exec_queue_killed(q))
>   		xe_devcoredump(job);
> -	}
>   
>   	trace_xe_sched_job_timedout(job);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5b1694b292fc..53f196cf447b4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3389,55 +3389,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	return 0;
>   }
>   
> -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> -{
> -	struct drm_gpuva *gpuva;
> -	bool is_vram;
> -	uint64_t addr;
> -
> -	if (!down_read_trylock(&vm->lock)) {
> -		drm_printf(p, " Failed to acquire VM lock to dump capture");
> -		return 0;
> -	}
> -	if (vm->pt_root[gt_id]) {
> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
> -		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
> -		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
> -			   is_vram ? "VRAM" : "SYS");
> -	}
> -
> -	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
> -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> -		bool is_userptr = xe_vma_is_userptr(vma);
> -		bool is_null = xe_vma_is_null(vma);
> -
> -		if (is_null) {
> -			addr = 0;
> -		} else if (is_userptr) {
> -			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
> -			struct xe_res_cursor cur;
> -
> -			if (sg) {
> -				xe_res_first_sg(sg, 0, XE_PAGE_SIZE, &cur);
> -				addr = xe_res_dma(&cur);
> -			} else {
> -				addr = 0;
> -			}
> -		} else {
> -			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
> -			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
> -		}
> -		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> -			   xe_vma_start(vma), xe_vma_end(vma) - 1,
> -			   xe_vma_size(vma),
> -			   addr, is_null ? "NULL" : is_userptr ? "USR" :
> -			   is_vram ? "VRAM" : "SYS");
> -	}
> -	up_read(&vm->lock);
> -
> -	return 0;
> -}
> -
>   struct xe_vm_snapshot {
>   	unsigned long num_snaps;
>   	struct {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 3ac9021f970e3..b481608b12f1b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -243,8 +243,6 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>   
>   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>   
> -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
> -
>   int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>   
>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,

