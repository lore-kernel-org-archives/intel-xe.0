Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8542CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBAF10E2C7;
	Thu, 25 Jun 2026 23:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAcmFT4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4E10E2C7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782430509; x=1813966509;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uLYl2uTi3ncwgiAES26/cELhIv8ShlVIXV+UERkcxMc=;
 b=VAcmFT4+qvDp8cH34fr66YW24yz+jfME3j5P0GlV8iI6GDoiXsBkLzh7
 97x+qjMXKL4VTZUWbidxGZ7EqGG7VFfsGYVhONBXoPUyE6utzrE4ZyEu8
 vHU61capBJoW9r0hZuwylWn/o9Bqqc16safJ42lf8Tm3GEWKQjhKmNUwW
 Ga+cEeU2/6O4WMi03dMoOi6SqJIXH7YnZ8NgpXIsXha2FljUHTmRz3SYd
 UQbzql0OB7EaleQrSoQi5/JkQXgGgdHw6LkJWlSfoHFZgx8HqzSbdE95U
 APZf2o2riGBBNPMpJq9QmhUkTs6+InCD7g3y3SPItYGXFPLWWk1386B4a w==;
X-CSE-ConnectionGUID: xjo8aI2BR02nhwMHzLHiSg==
X-CSE-MsgGUID: QVxqVKhkRFCatqps82+/UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83285083"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83285083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:35:08 -0700
X-CSE-ConnectionGUID: yH7Y2wA9Ro6M8Lw7npOrmw==
X-CSE-MsgGUID: Ejuj4sOxQfedvxzvQHDWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="253054791"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:35:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:35:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:35:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OydrntVNctt0egdGHr7GmMiC+gp6/+m5EFOsxclTsoWRnjZ7Cb9XafI5QKynzbzgpvsUb+qmNa91yJ38N7hMnis8sx5crKKMD4h871bgBZwsmdUVpyPuqSrE4cypoAWbru3NI2D3r2GvcXQEcsXaGw3g6df35kN3qmPiL2a2i5wiveg4ZhYQQL64RBTcnaA88TAS3B074Ya0XYpWvrTtdLTjIiLySiXXDNKbIFrVi6xn03eKCm28azyJ6eHs1MIGCo4twakfIPir/SZEcrdqE7Il4Yh8W0RM1WHBa6fkDQTUpZMX0wmppjY76ZtPDoLnekOBpSrlnjWLTGnbkEL86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3kQnNCsUWXW4zFRiaC7ibL0A/UbqCgTkG8EkF/+sGI=;
 b=wQb+PQcuhIHfbdkLFvZP7iQHC+6MoiSGh/7udDXzpLKI6njCU5MxUmkdLvOZJ2suMpmqxVgJSH8KD/qjlhAaIzDEtTB4wShKpBIppHFdLhCf/eYxS4Gf8bd4/iegil50gEygCTD8bhdZy8r8V94IsvIvX7xvr10dyCccDv9bf/68TmbJozDEVRxZnPDu+NBAODeIvT2pIyT5XWBC9Y+TwVwTbPsbYpo1BupnY+jTuw9b3UdvN+V9+WJhwdhiPfNy+9Aybw1cCTZIOnf7Cuh2rxTnRSObLBcuRDOAlB162bszc+yfutDzk5mp4miKkrak93DdBx03jEVhYiwvUukhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 23:35:03 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 23:35:03 +0000
Message-ID: <eb78960a-070c-4c69-8efe-f94f1930303c@intel.com>
Date: Thu, 25 Jun 2026 16:35:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
 <2fb6ee84-c5a3-4889-ab42-93e84e6d9694@intel.com>
 <0ddae88d-04bb-4b97-933e-cfcf873a3750@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0ddae88d-04bb-4b97-933e-cfcf873a3750@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb3eaae-1795-411b-e50c-08ded312615c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SBLEfe19ksHY1EIylKfpNLrHxcV/X4VEJpZKlemackZF7qnp9e/AFEgMP368ReDhsizxmJkBD4K1Piy3EPLaw54FlLegHdRVq0OPtK1PNlzsgGsO1CuuX+asg+Zc/aHAhfc6fPyEm6TEOXKSM/uwMRycoLZvNiVaSDsnwahHVSeSY4tMqAop/SXiUXNX6cLEkSo42bVDWJDsijGVW2dq0pDMDfPB0ezWnvv63ZnjwjlZnx1i0rRwifCUOmgillED34MNZoajgeyza37gLrbhoipA4igj3uC1LPzARrjOQAqLiTec7duBJAeQQBwJ8W0V1Nh+ekHQVbiaLjSEXW+xsDkF4hCuESMzVBE9JRskvb7dXpjX5d91anOAqYXTL6GlJJYH2LOIaCpWcs6XJPAjlxTEszn64sYUpcPPNTkp7MU79sy83+7ZX+yHZdQ4qQUJYkEAYosKgzmHtsnQENJPt9b2QDIvduGVjm7OVrbOObKxz6SfS6WPycm1uDGNZRnWaL+iq/402aXgDiSrDTu+z690mEy0L+QZQZN+fOF4k3W3ZDjkWpN4beEXC16sGfpSgkiJP2xpYEAqvXMHzgDDifPLV/je/23I8fDBceDan1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjQ4MTVMbEtlaGFpSlpnVTJZNEtmZlUzWDRZbE5STlNOYnFIT0g1THE4Nm1F?=
 =?utf-8?B?OVFGL1VLZEx2ajNDT3plRDB4WGJISFE3em02VkZzdkJmMFhlOXFCd0tUTGsw?=
 =?utf-8?B?T2srVFZkdG5vdS9BcXA1bHpYYm9KYWNGVURZQ0tIZGN2STV6WU1QbWx6dUdt?=
 =?utf-8?B?d3pKdjdlZWVFNG1ya3RVb1RQV0hwZDVhc0ZNVWhDeGgvYkNYNmYyV01OYStO?=
 =?utf-8?B?eWwrUnBBS3N5L1AyY3pnbm9nenNjMXFtRk9SbVBFVCtVRTRGNGR3VlBmWm5Q?=
 =?utf-8?B?dGFTbTV1V1QzM0hleTRBOGR2WnBHVXl1SzBuVjV2MnFvWjl6ZEg4MUJDZ2s5?=
 =?utf-8?B?QjVIS3UvMmtPWG4xTlljeUV3cXl2Ry9LWTJERjlNZFBKSDIveWsyVU5iU3Mx?=
 =?utf-8?B?enBMY0NVZm5FUWpvemllZ3piV1hOalJScGJ6VktnSXRTYXZRTHNqUTAxeStw?=
 =?utf-8?B?bDQ5TFk5dEhlaithRS9TbDNzL0RHT0hyVVR6K2NyV1dYQUJBNENudkJpUzU2?=
 =?utf-8?B?dE1XVU1ndm9MTGwydCt2anNzQlY3SUJEanZrRk93eHNNamNncUUyeGJTR1ky?=
 =?utf-8?B?VUkyRWpsWFVUYmE2ajVnQ0hJT0ZSbnNydWN6TWFHeTdHdzIxMTJHanl6Z0Rw?=
 =?utf-8?B?QVFhcmRiTW5GNmhETFUzVzliT0FoZ3M5TktUZHI4K2YxM205WmF1ODhWVkdn?=
 =?utf-8?B?VEJHVmJCV0k5eUJNekl1QWtvSWVMR0RkekJJc281Nm5CNndGWllQRC9Iekw2?=
 =?utf-8?B?OFNOais3bTltMy9hWG85SjA2eGg4T2wyeWhjZDVLNUUwTTlXOHFYUnlRV3VR?=
 =?utf-8?B?ak5jUGVJVTh5NFF3SU5YUDdWTzMyWmJOUkloSm5iNkxrYVQySW9tQ2ozbmd3?=
 =?utf-8?B?N0thNzNuYW9TaGpId0FETTgwblZDalpCRUFaWVNHemwvNHZJK01oM0xDOGlG?=
 =?utf-8?B?V2dldW4rVWdpOUlXcFJNcTl4M3c5WG5Pbi83MVhjMUt1K3BOVkJsNVl1anJv?=
 =?utf-8?B?N0hPcVVyNGFYSFphRmt5RnpCZFBOMktOUVVNdWR1MEpxK2tYZTBlcTRGSy90?=
 =?utf-8?B?bC9jNWlkMXpOQ2Q0UjZKOWswaUNKaHQ3akRKUmV2UktLNU4xenhVdE5heXVX?=
 =?utf-8?B?d2c3dmQ2RElqMmtESko3S2wwODZ2Z1ZJNVM4WGJuUkk1Qk1CUEI5Y2pKc2NN?=
 =?utf-8?B?Rmx6ZExiMXI1OUJpSTAyeWhWeUJKdTZtYTNybU5nUlFRZGE5TUQwNGxOZDNE?=
 =?utf-8?B?b3JKbUdQc3MzVEF0VllUSFFUbk9UWTlPZFZLdnpza05EejFXTGIwdkR5NmNl?=
 =?utf-8?B?emN1M1duWDRJSUtoRzJtMlVyUVFqMFFkVks1MzQyaXVscmFoTFZIb3Btb285?=
 =?utf-8?B?bkdsNStWWlZtaVVQWEtUMWJWMGI1UUxVOGhLQXl0MkhQaSt5R3JCcEtFaGox?=
 =?utf-8?B?Mm5HbDZnc3R0WFZqMDJxQ25IZWo3SEhpZG56RC9nY0dsUldLWDlCeHFOY1k4?=
 =?utf-8?B?eVI1KzJZdFg4YnlSaVl2bmJyUmV0cXcwV3BhWWtjRmRHSG5sU0hNRTd3RHla?=
 =?utf-8?B?L1pPa1FWcWozSGthbWdnR3M1bTVYR205SU1aRWlWZE50UzB0VnFTWmQzOTFi?=
 =?utf-8?B?NmtRQlYvR0cwOXJ2eUYwbnM2VTNTMWk4WUt2VElDWUtodkN1Z0xqUzNESWtB?=
 =?utf-8?B?N2NUM3B6QTFNU2Z3UE56S0ZwRXlqQ2N4ZU9VTXhoWi91c0dUUjNlQjNXTlRU?=
 =?utf-8?B?MXBjZC9PRE9saFlzNWNQYU5Id2NQTm0vWUxDSUJrbmNwYVk1dTdJSzkvaDNi?=
 =?utf-8?B?aTF6MHhEa3hjbXZDVGdTVkw1SUJVTmJmNUU2RmMyR0RKV3d3bWw4Wnd1R3Bl?=
 =?utf-8?B?K1o0L3pYN1lIVExrZ1Q1VVZsQnRoVUNvRG1KU0NxODM2clB5Vm1wWXBCWkt1?=
 =?utf-8?B?YUkxZGZIeHRBbGlhM1JxQVZxUUdlK1N0THN2Y2QwT0FHWkx3aGFEWnhGMXp5?=
 =?utf-8?B?K3crU0RLOE8rSVRENmRpR0M3clp4K2RqOFNNNkFDdGhONWRoS0Zhd04zNHNr?=
 =?utf-8?B?Q2RveXNzNHB5dFZXOEZWQXVhQk5ZY0VOQ29KUlJnOWUxdjQvWFZKU25SeWVO?=
 =?utf-8?B?U29OZ280WXVQdU5pL1lvSElOc1BKTzBlTGx5SkJvOU4vaGczR3R6SGpaQmk4?=
 =?utf-8?B?VktkSDg1UmMzWWJOdk9pZ3RkT3pwM0NjL2JvMzZ3dEIwM211R21FeTRrTGFV?=
 =?utf-8?B?cEM1S3R0ZE95ZjI4OUtLUzVmY3ZpbFlZbk9UK2RUdDV6aks0RHpNWFBKaFdD?=
 =?utf-8?B?WTZBSTdvbGdURVR6MmQvTE85elVDUmpaWjFBNXZ0aXJjUy9FSisrN1Fyd3NY?=
 =?utf-8?Q?6XgGBSAtKpPig8Cw=3D?=
X-Exchange-RoutingPolicyChecked: MfEFVTkX5waXTFJOHAeCvpjCnWO8mxxdVuBwKNjv1mWC3bYyWK6WDd+JdSEphbjxDZoJdDtAq8x+KzdaTyttFUVe4LegDsuf97JGNT0790TRODSyMxW7b7330GuLRxaih0cjcMuaU9fkmbMUuk1voTi4b1VlmfWJuKveOxH+3NiMyjegu87DOBCAQB+6LTB8P9yZSG48rjZPoSsu+kOxBlwgkbKrAaxnfD2G/KxSrgo2uZZ7Y39y3Zm4X0lX84R/xujuIa5V74kIIfHnHwPPloDj9v3s6dU7b3A0Or6icz6U4G732t2OomgZJLvSIPuG2wrt9Hy8xqKRPEod5kN8Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb3eaae-1795-411b-e50c-08ded312615c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:35:03.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMK/KO/I3WcJcn9xKhiWEl9RjP3KWFujFQRJklz9ImrxgOWXZyRmxrpXg3vSpwWVc5bPLBYTsaKJVxER2vmsX36w7gkbrJtHXWuH8BWlF6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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



On 6/25/2026 4:03 PM, Michal Wajdeczko wrote:
>
> On 6/25/2026 11:42 PM, Daniele Ceraolo Spurio wrote:
>>
>> On 6/25/2026 2:21 PM, Michal Wajdeczko wrote:
>>> On 6/24/2026 11:56 AM, Michał Winiarski wrote:
>>>> Notifications about VF state are generally not considered critical
>>>> enough to warrant PF GT-level error
>>> hmm, but without that error we risk that we will not notice that
>>> we missed to implement handler for such notifications
>>>
>>>> and subsequent reset.
>>> hmm, actually this could be our "problem", as initial idea of returning
>>> an error from the CTB event handler was to print the whole CTB message
>>> for inspection and later we also added the capturing of the GuC log to
>>> figure out why this message was send and if it is legit, all this done
>>> by triggering a reset to leverage existing capture mechanism
>>>
>>> maybe we should change the CTB code instead and trigger a reset only
>>> under a debug config ? otherwise, if somehow we still have some gaps
>>> and GuC will keep sending some unrecognized notifications, we might
>>> enter an infinite reset loop
>>>
>>> @Daniele, how you see it?
>> The reset is not there just for the capturing. Our assumption is that we should never get a message that we do not recognize and/or can't process, so if we do get one then something has gone wrong; since we can't be sure of exactly what has gone wrong, we do a reset to re-initialize the state and start clean.
> but after this 'clean start' we could still receive that unexpected message again, so we will run in circle...
>
> if we believe that there should be no unrecognized/unexpected message, maybe safer option is to immediately declare wedge?

The bad message loop is not a likely scenario, so IMO it's better to try 
and keep going instead of wedging. If you're worried about the looping, 
we could add a counter and wedge if we get X (3?) unexpected messages 
within a given time period.

We've had a few issues that were due to bad timing, for which the driver 
recovered just fine with a reset. For example, we had a bug in i915 
where we would in some very rare cases send 2 context enable messages to 
the GuC and then get 2 replies back, but the first reply would clear the 
pending bit so the second one would count as unexpected. In that case 
the reset allowed for a full recovery and I don't think wedging would 
have been better. This was very rare (showed up in CI every couple of 
months or so) so it was extremely unlikely to happen twice in a short 
timeframe.

> or separately treat the -EPROTO/-ENOPKG errors (wedge), vs other (reset/capture in debug, just error in production)

I don't like the idea of the upper layers acting differently based on 
the error code, that seems very error prone to me because the handlers 
are written by a lot of different devs and all of them would have to be 
aware of the difference.

>> Note that the addition of a new unsolicited G2H message to the GuC interface is considered backward incompatible, so the GuC usually implements an opt-in to keep the compatibility (i.e., the G2H message won't be sent unless the driver explicitly opts-in to receiving it); a recent example of this is the uncorrectable error notification (https://patchwork.freedesktop.org/patch/732697/?series=168465&rev=1).
>>
>> If you think that we shouldn't do a reset in this case, then this patch does the correct thing by processing the error within the handler and not escalating it. Maybe we should make the message error-level though, so CI will flag it?
> the sooner and louder we will report the gap (wedge) then less likely we will hit that condition in the production

CI will flag both a error and a wedge the same way, we just need to be 
careful when assessing the issue.

> IMO reset should be triggered only when we are ~100% sure that it would help and it's unlikely that we run into the same situation again

The issue here is that there are cases where we are pretty sure the 
issue won't happen again (like the previous example) and others where it 
might re-occur (like bad programming), but it'd be hard to distinguish 
which is which in code. I believe the current approach is a good 
compromise to avoid over-engineering, but if you want to spend some time 
on it I'm not going to oppose it :P

Daniele

>> Daniele
>>
>>>> Convert the error to dmesg log.
>>>>
>>>> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>> index 058585f063a93..65f015d0ede51 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>>>>        case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>>>>            break;
>>>>        default:
>>>> -        return -ENOPKG;
>>>> +        xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>>>>        }
>>>>        return 0;
>>>>    }

