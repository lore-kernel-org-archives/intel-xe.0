Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F93C624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588110E086;
	Thu,  3 Sep 2026 06:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKnKsPg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF5410E086;
 Thu,  3 Sep 2026 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788416367; x=1819952367;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4q//V4JfW8gVHIvfIz5e3LuhzJJGVqmywAqGu9pgTU0=;
 b=PKnKsPg1IGa5ohzpsI3zvP3C7B/sMK+9JFca9ibOFmwHc+qBViJ0Y6g5
 jrsAzxiIg9Auq+BbsU1M7VgeF8HW0Xj9xMC35N5EkIxHWaWDnfkD1HF0p
 /PpCpCMROfpv71UTpKo9XhrojMXrDwhw0CisrahdFr0vtA8ukDA7B6dkC
 ivG5ObwnsbHYqD74C89iExwTvsvtODd0GgAq/sTON5nflugpf5/ZHlgSj
 rZHHPxXQr0Bf6+QVTDXeN6b9234kRPh+vobtNbzb7jbTZ2BMrBHwlIUJh
 nxFKcI9SsUKHozDACAMg1e0p7N8MSX/GMAx1GDqC6mJPisE/z3YrUY0pY A==;
X-CSE-ConnectionGUID: DFlZKNvmQdmVj3esrK+6Iw==
X-CSE-MsgGUID: YZkKM3a+S96f3FgSHm0aFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100242761"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100242761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:19:04 -0700
X-CSE-ConnectionGUID: IH4EfMWJSjO5BtSzzmQOcA==
X-CSE-MsgGUID: yGOA1+m+TomhbUs3VRGRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="265922926"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:19:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:19:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:19:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.55)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgx65RBye3bleyX7Gkt40TJSihAakYdLwAut9v7Dl/9o3rBbWofK2IHfkgQBrEV0zrml/Hu2KjY3+hJmOgmnJta8QXI4IIAYreBz3ESDqFmaezYFpVkTNs/Ggs+v4Wkw3qGkoRlsmEigr0CmBD93KWpxr1XKccv2acaPR9NuIMxW7UB3kVEM8TvFWTFvR5DjNFnXr6s9kQVdRHiSnJq3oRBiGiEzVvF1rbnGCkXlx0Qpl9SiHQEouQZ10rA6/xdwLPLAogYJGsBgTrtfsY4IespXdxTOQ/Ow3Gzh5lukDmY9MWNGrY+PAgFmzi6C2RL7GqtfMEBEOzKfxl5zhjDPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sf2HS+MqBzdwdumjudjk4uwDgY9L4V19u92jvx6SyI=;
 b=k3F8InRcmx9fE8NitLRZcesONsMDZI9RRcfuG0WpfMZaV660J2pB8lbPyXri49OW494X4RMRzEX/zeGk+Q1x46BhkPshFHuouQBjvAon1OzEYh1NE61psUyR91hcFiB5A8vfGOdiQV8OjtkZAYiANSm7PhnGHHbMeuhSd9C4B4RZSOpsHTyyc53Ck1A8gPHmDbuq0WKCZWSKczd9NFni3K1KZIY9lHy0PiZmKzPcjhL4p7sfa9mhYYLMN4fAb+CBScFJkXIeEC7oxQ7LaCgwDz+HHQlvqfOjEdkFqLkkcAz9+kGBeBDUav5zhOQtcHvXbbPHzLlRsLDg6ht4LRY/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 06:18:56 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:18:55 +0000
Message-ID: <2bf083ce-b207-4f8c-b015-3cb229389d22@intel.com>
Date: Thu, 3 Sep 2026 11:48:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-3-uma.shankar@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260831213421.1804635-3-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: e64ec2db-e7c2-4fa5-9f41-08df09833b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|4143699003|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: NEvh0hLMPhBD0Xk3A5fbH2Yqu2Zdz8w4O504d/rhUXcLJdrw6ajNkxVjiCdCgkGyxlZt/B72sOLksVqIHNyssefuaDV9NzqfVkShiWEBn6cMIcDsv+FYRDnCsjj6hSJ/xGt4YZ4Mmdc50IX6ms7Zm6f6woEJhRdK9kSVx2MJDBmApL38q9IjhKE2vAD+pYQJWn7IZU5h7SPYqb3WGRNscouCQAkINbxlb2qkod/j4Z0ngyb1eWjeeNEavbu1zGjnz+UA47EKw2qChZhqHSRFDSE0B9YdFxH+Ni1wBrFTVeyWiyRV7mpcy59OT4gNap/LTdTEZR1flduBvNtyEhJuGOiM1pp00EP63UJD6QHapfoymFo4E9r6oWSNBtoQ13j3sxLMI/+H64arxrBmrvSC7ZZWaHU2UcG1OY7T4AyG9mtti9O/uyQ0jZOxNDI/2tCe4zkWjzZ9ug5/GaQjVYTH8qjZB+f4edl2S3sn5n5GyfdWMLpgQa4gYG1afWVcywTO7QLF4QGHWSvY531HPi1pCCFjzooK0wc+xr4qCX44MHyBG/w55cQ2MIgVnpE6N2w7B8HUP7tNMPEcn4ReYHRuldl8qIHYbkw/U6cCrQOwhSIHgkB9L2rUupX+FNA0KBP7cXzqJCyX4MOQbQtazFr2JgRvw10m9UJnnb2ODrvOENE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(4143699003)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEpPaHBJNUZIV0xXenRxRkxXczBkL3RZTHJQc00zeG12TmUwTjhUU3o3ZVRi?=
 =?utf-8?B?czRLVDdRd3Y1ZVRlajd0RWJuUjZPc283VUJKSkROb21IYmtDeUpSM0luVStr?=
 =?utf-8?B?elpSVFhlWjREa3hRR2lXMk1zdVBONnoxU05WOUdhU2huYWFDSDR6em53eTZT?=
 =?utf-8?B?RVRweGZkUkI3bHF0WG5uSC8rSSt6UEtIUXdMdkVLSGMybXI5TTl4Yi9HZUJK?=
 =?utf-8?B?eTdiemFxUlhmOE5UQktiWFllQ1I2bWVZMnVNNWdHZlc1eFBsaDZpenlmUVh2?=
 =?utf-8?B?c3dVdE9LRElqRlhyYW5CS0JCZEUydEpWVlUrMlVvaTZCUHV4SllPOEJ1MThR?=
 =?utf-8?B?dUZJZmVJa0RGYjhML0prb2JTNyt5QnlkK0xpWXBURkRWZjc4SWplQlZWNzlx?=
 =?utf-8?B?ZldBK2NYWTFjUXhsR0R2NnYvMmhPNkVISVREYjRJb21lVEZsUTRzalkwbDVP?=
 =?utf-8?B?MzJKOSsvem1FS0RRRlpLbG9IbDdKVXZ3NFJ5bmxNUXlyUVM0dFNUVHJENG9j?=
 =?utf-8?B?VnM0VEtjZnc2TVJYVDZKUFNoYWNOTjd4UXpEcGo4bXZrdmhzREp2ZW9VQ0kw?=
 =?utf-8?B?VVE1NjZkS2tVQ2tRRndJTGMyQjNsQU1XSWNKeHJhZWUveWVEV1lOTzBVU3hl?=
 =?utf-8?B?ZWJyc3hVRHVkUEVnTHYvZzNOZlIrY2VORXgwM2tYWTZoams0YUFpNmUyenZa?=
 =?utf-8?B?K1pWcWlYblpNVmwrRjlOaVltRlR0RXc5VG9TcGJsSkFoR1BkbExKUXdGV2Nr?=
 =?utf-8?B?emVMbVVYVmhQMmkrRk1DNit1cHR4R1grV3BxN3YzS1N3YnJwcmMveEVYa3FS?=
 =?utf-8?B?bW05SlpzVllwUGIvOFZEQjRxVjJ5MTlHWFBGZ3pqWmc1UXErZVVmSkZkT0h2?=
 =?utf-8?B?RXdzZHhLT1V3VFRveFJVWGhiYkRWN3F1S2pvejNNUjA4eXcyN0RpRm8vd1Zp?=
 =?utf-8?B?b25TMnpIbUdPdXBRRktLRmVGb3p2b01tSkZCb051R3ZWdDhKbkVGUGVQOHh5?=
 =?utf-8?B?cC82dGhYYzRDZ0hWU1JmdkV4cWMrUTF4MEoxazRRUkhLUTlybzJZeFFRRldD?=
 =?utf-8?B?SWhEZC85S0ZUM1RJYkFyakN1L2JtN1V1RU1uUy9hUHlBL3hSc3hBYnFxVGxB?=
 =?utf-8?B?MlVWZWxjakFLeGdEM21ZaStkeFYwUWs5MG93L1E3ZGNra1ZrRThQckIrMlZn?=
 =?utf-8?B?dkRPcncxWm0vMUZNclFvS0FPOHhIZ2VoNnJVMSs2bm8vSzRndjA2TXVDUEtr?=
 =?utf-8?B?b2ZSRlNtOUZhemYzZXdqZGU2MFNpTThxOVB0ZUorQ2g3NjdLcTI4RTVOaUd4?=
 =?utf-8?B?Y1ZXTXhiZXdXRStqK091bGhPZHBkYWtnUmVLekRJeWtFV1JYVUthYmkzU2E4?=
 =?utf-8?B?eElZNGpQTkRFUU1uWTYyeEhlSmlGa3BhdEJYdERtNlVDQUd3M3QwMWdFaU4w?=
 =?utf-8?B?K25IWkQ3Ky9rVU00WXhuQnc4MjAzNVZIRzNIcnRJN3pyN0J5ay9oVWlha3E3?=
 =?utf-8?B?NFdkMDFBU2dHb01OaTROZzRHRjUxLzgxYmFQQWVKOHVJWlNpTUR5S3dTNHRB?=
 =?utf-8?B?VmRZRTZHdXhLTE1BUE0wTGtkWHdFQUdtL2tHRjZCQUJZa3ZaWmNHNHNSUEl5?=
 =?utf-8?B?TFlSN0ZOT3FYNDZUU0M5eWk3c3dUT3NFY09mckkyc280dXh3dFFCYmhjVFBN?=
 =?utf-8?B?UnhlczliWGtzTFlLVldodTVrU1FEcmhxN2ppOVg4SU5kT2xVdlM2Z094Zktx?=
 =?utf-8?B?ekx2RWVCeWl3NEpLQ3YySnVvVE1YQU43blBuYnU0djE1Vll4T3NYSWwwbzlV?=
 =?utf-8?B?a3QyMktmS3BhYjBLYkNveExGc0RLdmc1TDRoQkZJaE5YM2xsdExEYVFSZmJL?=
 =?utf-8?B?S0Rnb2dIMWpCT1dnRGpkeFJuT1lXaUxLbHZYSWFQN0lnMzRuMy9KUktKQmxF?=
 =?utf-8?B?amdza3JNY0o5RVpOT3h5MXlkeXEzQi83Vjd5UUJSRHV6NDZPMHg2ZnM4WUdP?=
 =?utf-8?B?dGlwMHJnaXNQSm04MUVTNVFJT1Z5WXVFTForbDlrMVN3MkNEUVR5K0hZTTly?=
 =?utf-8?B?UEF1aHJtQ0NyTVVmMDk4WDBqRzFJR2ZWOXlMd1E2ZmlSVXMvWllpa2ZKK01j?=
 =?utf-8?B?a3BTeUVOaEFIWXpYNTVVT0ZuYko4MnF5RWFSbW9zK3pvYi9hKzh3UXRlZVdv?=
 =?utf-8?B?dUp2bjEwR1paS1RIaGlkaDdVVTFxRXIyV1JEaFlOMjVjRXJlTUhKbGF2RzhB?=
 =?utf-8?B?Q3BZS0IxMmt4SlYyVHMrZ2thbEhXeDh0VGRrZXF0L2xCYm90eDBsd2h4UTZR?=
 =?utf-8?B?VkZ5Q3g2N1RiY3hCcXR3RC8xMURLT0h4NXJSSnBQNitwMW1acHpWRlFWUzBn?=
 =?utf-8?Q?A3Mf9dIeXvQ4A/3M=3D?=
X-Exchange-RoutingPolicyChecked: hVv2AQWT2no8+CxvnQL+Bj1bP/MEIyNhzJiWHPqTdM7gRA9N+0YDXIZsrsLd1CFAk1hIDV36Ef1KucPegS599/yQsXv5QY/xU9EXCDcfdAJZ1R9bBm7kjhPJD7/+PbhSVJKSC9tdpXbVdWUSEnQqDa+FTCzWrpdYZo3wo0PuXCFceuz5wcr1QTBMFaw3pP2NUe7VlDDzaC3uouW4MrnphgKQebndr1xudjjehBkAGbRRXe8EIfg1YFduItvxujKz6e0IBJvxxj6sBoGGVZ0cEjGq2+D1MGG5Ck2R/P3RR4hhouIPw4N1j3GAuTWoyEG4MCO81Gjbp7/FGrqJACjU9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e64ec2db-e7c2-4fa5-9f41-08df09833b46
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:18:55.1207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7rapJyxBHu3V7mzduTuQcHMH0d+WQUBFGQwWg5e3cXhwi8UaQvp5VxkgzxiYdmXy90/DGJ0AbKzi7PBXCBIb8LLKuqyWkYrptGLjUJgZmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

Hi Uma,

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> Periodic AS SDP (skip frames) relies on the AS SDP still being
> transmitted while Panel Replay is active. DC3co uses the idle protocol
> which suppresses AS SDP transmission entirely, so the two are mutually
> exclusive: leaving DC3co enabled while skip frames is programmed breaks
> the periodic AS SDP and the panel never sees the slower refresh.
>
> Add intel_alpm_pr_as_sdp_skip_frames_enabled() as the single predicate
> for "skip frames will be programmed" (mirroring the gating in
> lnl_alpm_configure(), including that it only applies when VRR is not
> active) and use it in intel_display_power_dc3co_compute() to force the
> DC3co trigger to NONE. This drops the pipe onto the
> DC_STATE_EN_UPTO_DC6 target instead of DC3co whenever skip frames is
> active, without touching the DC state module parameter or the allowed
> DC mask, and only for the skip-frame case.
>
> v2: Fixed Sashiko review findings
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c     | 23 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_alpm.h     |  2 ++
>   .../drm/i915/display/intel_display_power.c    |  9 ++++++++
>   3 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index a6838e0fd3aa..0a33a89975bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -404,6 +404,29 @@ static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
>   		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
>   }
>   
> +/*
> + * Whether periodic AS SDP transmission (AS SDP skip frames) will be programmed
> + * for this Panel Replay config. The skip counter needs the AS SDP to keep
> + * flowing during PR active, which is incompatible with DC3co, so this is used
> + * to keep DC3co disabled while skip frames is enabled.
> + */
> +bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
> +					      const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +
> +	/*
> +	 * The AS SDP skip frames field only exists on Xe3p_LPD+. Periodic AS SDP
> +	 * drives the panel down to its minimum refresh rate on its own, so it is
> +	 * only used when VRR is not actively driving the refresh rate.
> +	 */
> +	if (DISPLAY_VER(display) < 35 || !intel_dp->as_sdp_supported ||
> +	    !crtc_state->has_panel_replay || crtc_state->vrr.enable)
> +		return false;
> +
> +	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 1cf70668ab1b..328920027f1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -34,6 +34,8 @@ bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
>   bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
>   bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
>   				 const struct intel_crtc_state *crtc_state);
> +bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
> +					      const struct intel_crtc_state *crtc_state);
>   void intel_alpm_disable(struct intel_dp *intel_dp);
>   bool intel_alpm_get_error(struct intel_dp *intel_dp);
>   void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 0ebec6e0c240..1b60ce2dd00c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -10,6 +10,7 @@
>   #include <drm/intel/intel_pcode_regs.h>
>   #include <drm/intel/step.h>
>   
> +#include "intel_alpm.h"
>   #include "intel_backlight_regs.h"
>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
> @@ -488,6 +489,14 @@ void intel_display_power_dc3co_compute(struct intel_atomic_state *state)
>   	if (crtc_state->has_sel_update)
>   		trigger |= DC3CO_TRIGGER_PSR2;
>   
> +	/*
> +	 * Periodic AS SDP (skip frames) needs the AS SDP to keep flowing during
> +	 * PR active, which is incompatible with DC3co. Keep DC3co disabled while
> +	 * skip frames is enabled.
> +	 */
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		trigger = DC3CO_TRIGGER_NONE;
> +
>   done:
>   	intel_display_power_dc3co_update(display, trigger);
>   }
Verified locally not seen any issue.
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
