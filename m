Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB2C5DF8E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64A010E1F6;
	Fri, 21 Aug 2026 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0PuVYor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961C010E1F6
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787310106; x=1818846106;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JjyVd6KpZuLPvi0Wx9PH+8bE0rGQd7WpdcAserDQt0Q=;
 b=i0PuVYor3/oivSq4rWEVsjfX9oOsfWHk/CZCDd9Z3YQ83LJdnB/BuoEJ
 4E3auglocxkHsm+Qjd+QeHvG2Gx/qfx+Eez57Rb0o9gRiCaLBox3PiWzs
 OXgjmTddELccTaVYrIHfadyikxPXG99++vSemOlsAK5d6rQ24O78hmxb1
 RBuxVeN0XroZf3VV8Ijlw87hmTp8UazNcImyhQ0/6CKYoFokakBT8eCHc
 1KT85dIpDa6ioEM6AJ9vrIeWuBrGSybKtOgiqN4ilVL6nwKpB9EHhR2ih
 /FLmkgt+1awfuCPbqj19dzYLpGCXyHPWwM/MHNFfNJF8p464oSoURGBOd g==;
X-CSE-ConnectionGUID: 9Ca8/gEiTOSBz203bceeKQ==
X-CSE-MsgGUID: NeYEKPQCSEWs2Dg0XdCZVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91535495"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="91535495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:01:45 -0700
X-CSE-ConnectionGUID: wl69aIQ7TjWUSf+kxfp2Ug==
X-CSE-MsgGUID: NWbUOUk1SR2Jxa0P8g9b6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="262035496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:01:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:01:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 04:01:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSBaLdi0z4/GH46WPX7TSkrVQg5C5+q3UsBK3CUfvqd4uEEz1cRjy5urKWxcZ3gYgnZMNIWF1z/a1EsJKtHL6jjD6ipDdUDAd6yfpEJXytnM+60iMIQCYOKAueGlnrJmsTPUaTpuUmKlJbLlfEyafGH66XsGMEK9PdD9mgcKLKvEANIVfhi9GhvRpbaalzEtKXnGuhtQ4aBe7eQMxvixWdvYg9Gx5ra8QPIRuWCYmHJ7M42qPOyWArsRa5u89QVkTME7v12Z4BjPblb2RiRlKPv04dsB7NimsI+e9SrKW8niJP++y3iNzqPxwkFtMqmyfeV4wNicCTGQK6Sm3+MzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCzoPa0ym6KxVdNNuuIgM6fGFlMJdWqJ4GZrFfhQN5g=;
 b=B1ILMSXP0J2JqDv0PHrobELlS9A9HDT81VMkTEtwUwbJLb+8rqd97qG1VCjrJN9SXEfJOnWOIuqHTvMJ+k/qcwkANZ+arMUSRcgvMabEaOuk22aCQPoj4ZFiCBtpranvMOJc1FMKpD3+ZlyVydywodtEhE2vH5pd4lTTx5Jf0bpMiQHdnNJ/43kOUkFfrijDSV/2bQkOre5Sx83dvbdQV+RpwH1s2lH45nYNTPwF/7SPUmg1JeISHoeCTXzLYYrIzmYB1A8PF4iT5t5p5NXYNnU8yG1oUrjiicvY3brHT38EPO3FwLImnD8mG972yJZNxdiUsRXE7UsTq9uKVLxEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 11:01:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 11:01:40 +0000
Message-ID: <2bf7c929-8228-455b-833e-5d1d98fe8540@intel.com>
Date: Fri, 21 Aug 2026 13:01:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-16-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260812124313.1377582-16-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF0000015E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86a) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 338f4f27-b42f-41dd-49a2-08deff7393ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: c3eTPKlchxpWJbu3UoYCRprC6rAgGjBZn3aESPTwbNlAkFYhisU47mSAB77tU/PuPS/E5cAswFNvdw33s0VEUouXxTIcE+BYDJwIyUHUvnIci7KOtH+qegR+REmLMeZz3eKDY3YzOcD3lAebFOyB9hEGax0poy+iNMOTMAZ+8vYf5ub50vCTDsOSeHGF/BsgktT/i+Ixh173vdqDMMo9kA7/NtEOrYhf5BZsCwenw/o/fTSyfEE8emLacIKJC8YI/hedZ64BNb4ME6PJYKyD0MOwXsXw2OoRSyNkkUQDmNzNQJEcMSq+AagzKHAlp+HrK/F4s5qyRfCpBYLkmS7VSyLVJdRRi1rCEZPBViPvBZagBI7ZcBCOQr7Is3gmRMsyCuBhCp+CH6IWBqBqVB4Tv1Vfy7kZu/gbOu0P2NNumNqvCEpRlBPmSAIskCPk65pLhJShrYu/fOPCoR51FF9OWC6G+o/IPo0t5PLtvxG5327yY7x/5PV1oB5Ftan0Y+E6wyNch73OqE7JOsEtZojRcjtoaEZc29YEmLIY7aYAe9Ey9i2l6nkZUSvRUVAxFwe8smuyorHhXFj7zDqOpXeLE9aIKK1j6By6K6mEBfn9lCCnG6TzF69CsfZpZULyBRzfulqQyPLB/lcL92OyOcwehryM12Wx38BQ3vpfvKOY3Xc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2krZVN0UGEvRnEyTnRza0lhVlJZY081Rm1BV2hmb3FIZXBGME1ZS3RVdTQv?=
 =?utf-8?B?eGhsQkZTQUFWbCtaTUJzMlYzZTd5WjlqL3VzeDNPbG9zUG1ZVUhhdmNrQml4?=
 =?utf-8?B?WVpoeFFIRitvODdMRFFLNFNqcmZScS9neHhOSDZQM09nUmhyR051ZndnY0xk?=
 =?utf-8?B?aWtONVZFdGptOUNtRE0yTk5XRFVmb0EzYm1Oa3JrWThiZTBBbTlHWDd3LzIr?=
 =?utf-8?B?WVJOekhhMCtMcGxveXpFeVNwbzkrclVKSGl0UjBwakxuZDJLT2ZJK3M4RnEx?=
 =?utf-8?B?S0dxWjJIZUEzUVlSUzNKNlZ5NlVHanUwQWRVQmVpWEo0NEtnOTdKazVxd2tY?=
 =?utf-8?B?OVVPajNIY1JhNERWMzE1TVVJcXlyK0Rya2F0UGprM1lXdEFDdEh5TC9JOXpv?=
 =?utf-8?B?Ni9oUzRSb1NCZzFSOERkYnoydG5lUjRyS0RZcHNtOFR5dFJKbW9wYjQ2K0ts?=
 =?utf-8?B?WXgrLzdWem52QjNYejYzcHpGWEZMZC9oZm9JVUJZdmtTVkRaZjl3NWI3YjBL?=
 =?utf-8?B?MUFMQzQ4eEdPWjIrOG1GZVE1KzRrMVZPbXpBMzVTNXBldjlwR2pjTEdYOTBv?=
 =?utf-8?B?RENMSmE1V2NNVVRmcTU5QjlieU51VHhPeEtGMEJqVnFBeUJoTTBhQmVaTWhS?=
 =?utf-8?B?andZMjFjVU1DZS9QU0VPQ3RWSDJKYnNWdHM3QncvNGlZamRKdEhEVHQ2ZzJX?=
 =?utf-8?B?SkUzRDhESVRPNGU5OXpwS1ljazhrbVlVYTM3WHQ1OVdUVklkYXFsWTZydUdE?=
 =?utf-8?B?UEZLNjlwbW1LTWdMcFFHVkp2VHJmUXh1aHkxd3JFTlQ0eEl2V3p0dVNUVmhl?=
 =?utf-8?B?UkpKekFzdFZ6RlNTSTkzTVZCZVprOHBzeVZZUm1DQ0Z0MnlKR0xFcERFa0Q1?=
 =?utf-8?B?UEFYU2lwdWtTc0FhcjVQcS9jZlRnUUdjUjI3Uk9aOExFVi9wKzNKNUNQbGVT?=
 =?utf-8?B?aVhFMDVkYVNTQk4vL3M2M3dJRi9KYXE4aUpVcUVFd1hlcGNzMFhJVG5oMUZt?=
 =?utf-8?B?Yy83anZKQ0ZvWWdVKy9YYWRpWmljQWlrTk9SZHE2NmhhOU4yNjNYVFFsV1p2?=
 =?utf-8?B?a2E2Z1FiWElEam12R2hjNWQ1SldtUktwU1JxZXZ6aVFmdmpPWm5icmNaczZz?=
 =?utf-8?B?REFFOFdXaGV6b0tOR2UrdVVRc1IrL0dmTmJwQjFpY1EzbFdLYWdXN0M3c0dG?=
 =?utf-8?B?TjV6dTNRSm5ocVhHbVJtcENvSUJvbFRvblBGaVlpOFYzaWIxNmQ1TTgrRUti?=
 =?utf-8?B?NWtVbTNqK2ZzZGFTUjcxT1dsWkJQa3pRRklRU3RrQUZsK2xyVlozZkRzbmZI?=
 =?utf-8?B?bFIzSTJWRzA2dUw5cEc3N21LWjhyNHhqRjdWTVFrdnA0UWVNTlVQMXNLNnlq?=
 =?utf-8?B?djBtUStQdmRaSE51cXhpeldMVko3TVYza0N3WHRuQUFnSXdSendrU0V0ZEtB?=
 =?utf-8?B?Sm5vNk5QWVdiRDZSUUhORTZ3ajdNZWtVSHZFUC8rVG9BK0hCMkF2QitoSk5t?=
 =?utf-8?B?dFFXWXp0SmhoNkI3aXBIWkdaTTlzNjRwU29ha0F5cVd2Y1VJOXJWYTgwelph?=
 =?utf-8?B?dzR4ODRDQ1RRM0NQSEk0RlFtcitYYkgzdFBIM1JwRlR3QXVvYm1SNmxWMC9G?=
 =?utf-8?B?VzhMUU5Pb2hhbVl6OGxGMFFtU3k3TXB5STVCN1N0L1lDS1ZGYnY4YzFaTXlm?=
 =?utf-8?B?dG0wZEk5QUxCM2NGNUcxNzk4djcwRDlCOVZuUk0wby9yNVo4U09YV2puZkJp?=
 =?utf-8?B?ZTNLa2NBK1QraDFIOGppN2V1VXdqZ1NpQkFhcGRNQ1JHd0wyWGJOZUt2bm8r?=
 =?utf-8?B?TjZWaHMwenpBSXNPMTZRZmJ3WEZUNnNrY3FQbkxrYUhYMWc1NGlpS2xtN29o?=
 =?utf-8?B?RjJaVWY5WERqeDMzalpSWGlPSnpJeEZCUzJrRE55dmVURnhpbEhRSWtIWER0?=
 =?utf-8?B?WlA5VEZaY2tqMldNeVhNSFBYdHBjK3lUVC9xcFNWSmxqaUVDL0I3WlI5TmlK?=
 =?utf-8?B?S1hEQzkrYmZuWkJhQUZrSTJyMjhKMklwMW9maHMxOW9zVEtLeFlJSWcrUkp1?=
 =?utf-8?B?bENzMTlXS2FQU3RzTjFZSnVmb1VxK0p1MnBNTjdjbE9vWGQ4QTRqYW1LMTJs?=
 =?utf-8?B?NzVScVArS2JuNkJtVFZvRU9rQmdMMXR4VTBGL2hVandqdkoxYVM3d2MwdldP?=
 =?utf-8?B?RWZxaXRZTEpDWlkwMVF4MDBjR2dYRzJPdndyWlRwUmREVDZBSzZ0Y0hDZmRj?=
 =?utf-8?B?bXFRYVJmZVNJeVNNWm5vUHN4cGdMSm5hUkRFUXNFRWhtcE91bElVN2pWRmUr?=
 =?utf-8?B?V3R4bmc1WXhSbFRNUmdUc0haWkV0NGpyTVRxc1lPcGwvek03OC9hcWJORmo3?=
 =?utf-8?Q?o9ziOh2FxRdbkPbU=3D?=
X-Exchange-RoutingPolicyChecked: Xsq7NRLHAsWqN5+F4dzY6PmBcRelw7Uw0rALqhHt+8xotn1MhPgi335icUx3uN/znMfApI7jbcBJQPBheOFWJBZMT6Xwm1uo99L65LuJkj3i7EzCVEUwV7MLPpDmc9UZv3aJmi3xSHVcgsoMOzTx+kCAUnOFEyY+5xH+ku3whVv0JqEvNFjqsLKS9bKO/t3rkGBz53JAEDy/NXI99ldeSwjjvFfDny7+k58AXIUtwAVldUfmxrDyUfGGQBv1yEENR4UNULyZ2fSqu83atDByoSCQHhS3BflCHmUKiSSgnhKp6kVbjQ6JLtc9jY4EJtIYveql3sSgmudQc7wd6R+N7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 338f4f27-b42f-41dd-49a2-08deff7393ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 11:01:39.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD+Buop8fKwjvlIZ4HpaEJKhTUIFdzvf1YEQkyZsMWpSvrIxgxlZEUPd3Aw6AnA7Ck10QVIRez+shZLc2KQmuzWIDsQEdAm7NcnAKYhQNvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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



On 8/12/2026 2:43 PM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
> bad KLV responses and verify that VF can survive without crashing for
> the invalid configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V5 -> V6:
> - Fixed review comments (Michal W).
> 
> V4 -> V5:
> - Added alignment tests for vram, GGTT base and size (Michal W).
> - Separated stubs for ctx, db, vram and GGTT (Michal W).
> - Added new test cases for xe_guc_mmio_send_recv() (Michal W).
> 
> V3 -> V4:
> - Changed stub function from guc_action_query_single_klv32() and
> guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
> - Fixed review comments (Michal W).
> 
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 484 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 488 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..8cb7f3cebb31
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_guc.h"
> +
> +#define TEST_VRAM		SZ_8G
> +#define TEST_GGTT_SIZE		SZ_2G
> +#define TEST_CTXS		1024
> +#define TEST_DBS		128
> +#define TEST_GGTT_START	0xa0a00000ull
> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +} vf_ctx_testcase[] = {
> +	{
> +		.orig = TEST_CTXS,		.query = TEST_CTXS,
> +		.expected_ret = 0,		.name = "same",
> +	},
> +	{
> +		.orig = 0,			.query = 0,
> +		.expected_ret = -ENODATA,	.name = "none",
> +	},
> +	{
> +		.orig = 0,			.query = GUC_ID_MAX + 1,
> +		.expected_ret = -EPROTO,	.name = "overflow",
> +	},
> +	{
> +		.orig = TEST_CTXS,		.query = 0,
> +		.expected_ret = -EREMCHG,	.name = "lost",
> +	},
> +	{
> +		.orig = TEST_CTXS,		.query = TEST_CTXS / 2,
> +		.expected_ret = -EREMCHG,	.name = "reduced",
> +	},
> +	{
> +		.orig = TEST_CTXS,		.query = TEST_CTXS * 2,
> +		.expected_ret = -EREMCHG,	.name = "increased",
> +	},
> +	{
> +		.expected_ret = -EPROTO,	.ret = -EPROTO,
> +		.name = "proto_error",
> +	},
> +	{
> +		.expected_ret = -EIO,		.ret = -EIO,
> +		.name = "IO error",
> +	},
> +}, vf_db_testcase[] = {
> +	{
> +		.orig = TEST_DBS,		.query = TEST_DBS,
> +		.expected_ret = 0,		.name = "same",
> +	},
> +	{
> +		.orig = 0,			.query = 0,
> +		.expected_ret = 0,		.name = "none",
> +	},
> +	{
> +		.orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS + 1,
> +		.expected_ret = -EPROTO,	.name = "overflow",
> +	},
> +	{
> +		.orig = TEST_DBS,		.query = 0,
> +		.expected_ret = -EREMCHG,	.name = "lost",
> +	},
> +	{
> +		.orig = TEST_DBS,		.query = TEST_DBS / 2,
> +		.expected_ret = -EREMCHG,	.name = "reduced",
> +	},
> +	{
> +		.orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS - 1,
> +		.expected_ret = -EREMCHG,	.name = "increased",
> +	},
> +	{
> +		.expected_ret = -EPROTO,        .ret = -EPROTO,
> +		.name = "proto_error"
> +	},
> +	{
> +		.expected_ret = -EIO,		.ret = -EIO,
> +		.name = "IO error",
> +	},
> +};
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +} vf_vram_testcase[] = {
> +	{
> +		.orig = TEST_VRAM,		.query = TEST_VRAM,
> +		.expected_ret = 0,		.name = "same",
> +	},
> +	{
> +		.orig = 0,			.query = 0,
> +		.expected_ret = -ENODATA,	.name = "none",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,		.query = TEST_VRAM + SZ_1G,
> +		.expected_ret = -EREMCHG,	.name = "overflow",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,		.query = 0,
> +		.expected_ret = -EREMCHG,	.name = "lost",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,		.query = TEST_VRAM / 4,
> +		.expected_ret = -EREMCHG,	.name = "reduced",
> +	},
> +	{
> +		.orig = TEST_VRAM,		.query = TEST_VRAM * 2,
> +		.expected_ret = -EREMCHG,	.name = "increased",
> +	},
> +	{
> +		.orig = TEST_VRAM - SZ_1M,	.query = TEST_VRAM - SZ_1M,
> +		.expected_ret = -EINVAL,	.name = "unaligned",
> +	},
> +	{
> +		.expected_ret = -EPROTO,        .ret = -EPROTO,
> +		.name = "proto_error"
> +	},
> +	{
> +		.expected_ret = -EIO,		.ret = -EIO,
> +		.name = "IO error",
> +	},
> +};
> +
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	int ret;
> +	int flags;
> +	const char *name;
> +} vf_ggtt_testcase[] = {

static const ?

as a bonus you likely will not need to initialize some members to 0

> +	{
> +		.start_orig = TEST_GGTT_START,	.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,	.size_query = TEST_GGTT_SIZE,
> +		.expected_ret = 0,		.flags = 0,
> +		.name = "same",
> +	},
> +	{
> +		.start_orig = 0,		.start_query = 0,
> +		.size_orig = 0,			.size_query = 0,
> +		.expected_ret = -ENODATA,	.flags = 0,
> +		.name = "none",
> +	},

we need all those negative test cases also for the initial query (orig = 0)

> +	{
> +		.start_orig = TEST_GGTT_START,	.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,	.size_query = TEST_GGTT_SIZE + SZ_1G,
> +		.expected_ret = -EREMCHG,	.flags = 0,
> +		.name = "overflow",
> +	},
> +	{
> +		.start_orig = TEST_GGTT_START,	.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,	.size_query = 0,
> +		.expected_ret = -ENODATA,	.flags = 0,
> +		.name = "lost",
> +	},
> +	{
> +		.start_orig = TEST_GGTT_START,	.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,	.size_query = TEST_GGTT_SIZE - SZ_1M,
> +		.expected_ret = -EREMCHG,	.flags = 0,
> +		.name = "reduced",
> +	},
> +	{
> +		.start_orig = TEST_GGTT_START,	.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,	.size_query = TEST_GGTT_SIZE + SZ_1M,
> +		.expected_ret = -EREMCHG,	.flags = 0,
> +		.name = "increased",
> +	},
> +	{
> +		.start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE - SZ_2K,	.size_query = TEST_GGTT_SIZE - SZ_2K,

it shouldn't be possible to have unaligned original GGTT size (size_orig)

> +		.expected_ret = -EINVAL,		.flags = 0,
> +		.name = "unaligned_size_4K",
> +
> +	},
> +	{
> +		.start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE - SZ_8K,	.size_query = TEST_GGTT_SIZE - SZ_8K,
> +		.expected_ret = -EINVAL,		.flags = XE_VRAM_FLAGS_NEED64K,
> +		.name = "unaligned_size_64K",
> +	},

ditto

> +	{
> +		.start_orig = TEST_GGTT_START - SZ_2K,	.start_query = TEST_GGTT_START - SZ_2K,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
> +		.expected_ret = -EINVAL,		.flags = 0,
> +		.name = "unaligned_base_4k",
> +	},

same here, we should never store invalid GGTT start
> +	{
> +		.start_orig = TEST_GGTT_START - SZ_8K,	.start_query = TEST_GGTT_START - SZ_8K,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
> +		.expected_ret = -EINVAL,		.flags = XE_VRAM_FLAGS_NEED64K,
> +		.name = "unaligned_base_64k",
> +	},
> +	{
> +		.expected_ret = -EPROTO,        .ret = -EPROTO,
> +		.name = "proto_error"
> +	},
> +	{
> +		.expected_ret = -EIO,		.ret = -EIO,
> +		.name = "IO error",
> +	},
> +};
> +
> +struct config_mmio {
> +	u32 response_length;
> +	u32 response_value;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +} guc_mmio_resp_testcase[] = {
> +	{
> +		.response_length = sizeof(u32) / sizeof(u32),
> +		.response_value = TEST_CTXS,	.expected_ret = 0,	.name = "same",
> +	},
> +	{
> +		.response_length = 0,		.response_value = 0,
> +		.expected_ret = -ENODATA,	.name = "none",
> +	},
> +	{
> +		.response_length = sizeof(u64) / sizeof(u32),
> +		.response_value = TEST_CTXS,	.expected_ret = -EOVERFLOW,
> +		.name = "overflow",
> +	},
> +	{
> +		.response_length = sizeof(u32) / sizeof(u32),
> +		.response_value = 0,		.expected_ret = -EREMCHG,
> +		.name = "lost",
> +	},
> +	{
> +		.response_length = 0xffff,	.response_value = 0xffff,
> +		.expected_ret = -EOVERFLOW,	.name = "invalid",
> +	},
> +	{
> +		.expected_ret = -EPROTO,	.ret = -EPROTO,
> +		.name = "proto_error",
> +	},
> +	{
> +		.expected_ret = -EIO,		.ret = -EIO,
> +		.name = "IO error",
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);

hmm, I'm wondering if maybe keeping config struct + KNIT_ARRAY helper
closer to the actual test case code will be easier to view/maintain ?

> +
> +static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
> +					  u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
> +
> +	response_buf[0] = sizeof(u32) / sizeof(u32);
> +	response_buf[1] = c->query;
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
> +					 u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY);
> +
> +	response_buf[0] = sizeof(u32) / sizeof(u32);
> +	response_buf[1] = c->query;
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			GUC_KLV_VF_CFG_LMEM_SIZE_KEY);
> +
> +	response_buf[0] = sizeof(u64) / sizeof(u32);
> +	response_buf[1] = lower_32_bits(c->query);
> +	response_buf[2] = upper_32_bits(c->query);
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +	u32 key;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	key = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]);
> +	KUNIT_ASSERT_TRUE(test,
> +			  key == GUC_KLV_VF_CFG_GGTT_START_KEY ||
> +			  key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY);
> +
> +	response_buf[0] = sizeof(u64) / sizeof(u32);
> +	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		response_buf[1] = lower_32_bits(c->start_query);
> +		response_buf[2] = upper_32_bits(c->start_query);
> +	} else {

else if (key == START)

> +		response_buf[1] = lower_32_bits(c->size_query);
> +		response_buf[2] = upper_32_bits(c->size_query);
> +	}		
else
	KUNIT_FAIL

> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
> +				      u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_mmio *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	/**
> +	 *  Let us take help of vf_get_ctxs_cfg() function to test responses
> +	 *  from Guc.
> +	 */

do we really need this comment?
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
> +
> +	response_buf[0] = c->response_length;
> +	response_buf[1] = c->response_value;
> +
> +	return 0;
> +}
> +
> +static void test_ctxs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ctx);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_dbs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_db);
> +	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_vram(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config_vram *c = test->param_value;
> +
> +	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_vram);
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +static void test_ggtt(struct kunit *test)
> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
> +	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
> +
> +	xe->info.vram_flags = c->flags;

hmm, if flags are only used here, then we should name it c->vram_flags

but OTOH maybe it is overkill to test for 64K mis-alignment if we
already have test for 4K and the code under test is the same?

> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ggtt);
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static void test_guc_mmio(struct kunit *test)
> +{
> +	const struct config_mmio *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +
> +	gt->sriov.vf.self_config.num_ctxs = TEST_CTXS;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt, ggtt_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_guc_mmio, guc_mmio_resp_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index be932ebe6a8d..d6b631cd4dfc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1684,3 +1684,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

