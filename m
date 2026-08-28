Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28361C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 10:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876B10E4DC;
	Fri, 28 Aug 2026 10:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC+mcvc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF3310E4AA;
 Fri, 28 Aug 2026 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787912776; x=1819448776;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VEk2wx9voYro9ReH3ummzoSmxyuuQYggZWwKHanpomE=;
 b=NC+mcvc5SjZ8SrSjyTGSU/mKYi/3RxKwin/9mzC+n3dRkJZlBVmdqcw3
 eb2IcrfMIj4zElMbzkzZILsJZsqvsmBn2VMWN2Gzl7aJ5vdcae89XHO/8
 LcvclzFlgfW2IGB20tyAam+94SORPgoSByrJHFvNjubj4uFbcjtxDGDsf
 RP+0qIy2PbBJXEEltpkuI/OwclzsWIB6C2Cs8bVKEJAXR/sVkEqQJ6e/x
 Sx59BE7GGzmcngU+U0ftRBmVm9oU+ovhp/I/h4iZl/zCgKGrop8DlJ/SM
 wj7n5TgRTTrFGXDznByPlz+MM8OOESvuct9vTdNUG/r5ME+xkj/9FePU+ g==;
X-CSE-ConnectionGUID: a+VN1NNXS+Sslcj7KS6mfQ==
X-CSE-MsgGUID: MdoRp3DURiavxUio8X6MWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87551400"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="87551400"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:26:16 -0700
X-CSE-ConnectionGUID: wo/zp6atTT+sksxyCQ+5hQ==
X-CSE-MsgGUID: c8GONIznThCcn3oqaN1N3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="261977612"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:26:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:26:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:26:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5SNssRlc9gpPrO1hVRfigakRMuuhzSAYM31Kb1Ar8tBPsLdLX7WCKBfoaxW8wqqoWKz14GN5wYqoJ5nx/jupVzhj9gUb3tZxKsztjGt5tSE3C3h4d3uJ9fp8JbqD1aP0VKFQYS3lQlE6j9wO/KGamQ6LSf7w+XwCTedqOovvdpcoxByAwjnrd3lpfsEjJmrhZhQuzAB1iV9ZZ8LTQXOqK5H0x8lVqsD8YaWRlNwDZwf6w0pUHH51SNZ0EHu8e2oUODWUsNLBw91sPK+eqQUmgJMKKrFMnXBMe7/1St/SqWwLzjeE61aaFViJJ4dMKbglS3uoBrMQw8ZABSG+7doUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV+vIvVjf58AIxJ3R4JHNLbn1jyzcIZrWKdRDgQR4A4=;
 b=R+Q7kehaXI/X/mwgmC/DwABCE3Cjj9LRwsST+TeXRdL4LlslgQXZHjBzam76t66S+2u4rrz2XaDboAPMW+S1NAJQHsBYvBRh9NsBrW4/i7h8LdUUH3MoqI1JqN1Ckhh0dM9QvllOkil625c9EKHg+Lvj2Byi6RDHjet//ucyTM2lCU7U0wwOyjHGsm6wdlSFD0Zi0j4arVO0x+ZJ8z92/jAMCxh9cpeh7ukmdVtH2ydFVMCGdwAFi3BBIVEsk35ELbjE+79xm83yIdX1VYI7bs3rVg+nuQJbqHOEAXwIRotwIruqVIKk4w+Fn4OULaax4q9sl5FFeaaes9vlAf9+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS4PR11MB651330.namprd11.prod.outlook.com (2603:10b6:8:50a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:26:08 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:26:08 +0000
Message-ID: <1a42ff47-daa7-4de5-a1db-52917ef36417@intel.com>
Date: Fri, 28 Aug 2026 15:56:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/i915/cursor: Handle secondary cursor state
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
 <20260827164203.2371794-4-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260827164203.2371794-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS4PR11MB651330:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d6a3ef-80de-4499-6171-08df04eec60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eYiVByadDBWhZdYaUirquCY6QA5qF0DEJ/iqKgyHczSn+9mTaymAgJXh7snItMEeb/mJf2FvBOs8SLCaqwfgeRR4RYGY8tNQArDD+HQYU3sFWaxxc5uOAJFaQIY3kculPEo+W58j4W9TPPK44C+topHph9SJ6B08/8V/J4KJIFwbHQposxtLGmLFuqxChPpXNzlTxiW+ufYLB1neaKEoNJCh0ArW/Rd8pZkd9nkmRQbV1khTdTP/nh6tMJHY6gI4gPwdJqSR/ndBCHED1vGPXQfiBlhyrGoakPZ5mUUZ/7Ee3sQOE6SJtX3ONi/DEWIKWa+le6EMdpPPlMAuseDlJNppczTxODfzw8Jbf+ldySj6g9FWcQpeEWJhaDjijLy9qJEw9F1gu8rEx/OEOJNqTGa/dcfvJWKD5E1ta86tDNShL6Xx0PW3gDdTbw78ZOeQ5yL2Bf3WTAVxqJqQTxnCiFc5iJ3UCxRdHQxVE9QX04GvJinBby0hdAkDG9tkyYfX9h+htsWP+EyNE+3r3Bac2C2QwQ3DE1aL62AOo3cm8stvdjs656AZjzCOrOlzjYcHc/RNylpNz6S2kv2EWkaxPcjvLxSidM/no+PvtQeeF9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtnbnI4ZUxaemZPcWNOSzJaelVhRndWNllwa1lTK1k5R3p0Z0c0NlJPNC9p?=
 =?utf-8?B?VEFuTDZoczA0a0owR3hIZGZtWWZjTzNManJDaFQvM1dkdEs2Skk0U2lJQWZ0?=
 =?utf-8?B?NU1lZzNFVzBVbGFhUWtYR2JSakNTYmNxc3RjcmJIWEFPcDlJeHdmaTArUm0v?=
 =?utf-8?B?RVlEMFBrSHlTSnRJRG9YYStSZENEbURwYjhBbzlmSUxZbHkyL09oRFJPOHQ5?=
 =?utf-8?B?bVhXeUdZUjBWSmRUUjM0UE9IWW9nU3JEb3FYbU9wMUszQ2NFdDFPNWUyeGkv?=
 =?utf-8?B?TXV3U0hXVlAvbGlGZHdVbXZveXQ3RTBrZ25TcjRjbzh1eU9jazBqN0hRbVdE?=
 =?utf-8?B?Y2FjN0RtbHNmSnloRUZJYyswTlpNcFlZZlpUaXZMdjJxU3ZYbkNGd2JQT1lN?=
 =?utf-8?B?L3h3dEZNUHc1VDJDTVpoTHBOSWFLWjdUd29MNlRUTGdDdDdEL0NRUXlaZ2Yr?=
 =?utf-8?B?SVhBMEJKcTRlZ2dUaE5kbklwRW8vNzRiWi9lZXNxWDd4U3lqVFVkWk41Z2VQ?=
 =?utf-8?B?UG1zUkdXVW1KNi9WNHRpR05wZGtMQ3FSZWhRNzRtN0dGUE5TTHErOXhnY2xR?=
 =?utf-8?B?Q2JZYm9KSzdGanNyaS96UFZ3blRWZjJjRDJja3M3YWdldlVCejh1UVFxRml6?=
 =?utf-8?B?MVBqb1lkajlPSWlBa3J3b3ZmbS9iQXpYTFFkZmorV0RDd2dSQTVEVHlRcDRM?=
 =?utf-8?B?SW5OMzZUbll2bWlqbFVVQzNWWS85QlJGS3RudnpQeDB3dlpxWUhjbU5YTm8x?=
 =?utf-8?B?UzkyalQ3eXVUWDErQkJRaDU3cWhTOFV0NVBhNXlMVjVRNzB3eTF4bEhnbzRG?=
 =?utf-8?B?U0tqTEt1ZzJ4djQ3TnVrak4zYk1WTFpKc3dpUnNqc0N0a2RvUVhMcklhUmEr?=
 =?utf-8?B?VUJMRWgyb05BWll5K0V4NG41TExuS0tnWkJQdWpuaDNzSUltWXFHR3JVaGdT?=
 =?utf-8?B?TTUzc0JuR2U3MjlLaWFzSytmSFZUUTV4dlUrdFNIemZNZXVnWHVvMStlc25I?=
 =?utf-8?B?dTN0R2dCTWFrdDAyKzBzNG5kSXJHdU51dnczSkViamdIeEJtSEhTa3pvS0RH?=
 =?utf-8?B?MUVJSVowQXV3U01YL0c3dGNjZEpwTEE1Vkd2ays2T0p6alEwVmFFeHU1YWQ1?=
 =?utf-8?B?K1hRcG56ZE5DVTVZTjB4dHpqeDRNVzF5ajRPOC91S21ma0t1Ni9kZDBmcnhh?=
 =?utf-8?B?S2dRZWh3RExPOU4rOHFpREUxSXIxYUZOYllaNytkL0tOalUrOFAvU0VPRFRB?=
 =?utf-8?B?Y1NYcStPc2hXc1VwaXVtMDA0WTVIZUF6dnZRSGh4S2hXV2k2OFYwYzZUZG9u?=
 =?utf-8?B?cGRac2lYbDlDSm40UFFWRnp3SHVxZmxQcVp1Um1peTRGZjBydkpHTWFubjBJ?=
 =?utf-8?B?U2cvMG5qdHkzK0xldDZUSmJOcWtZdStUekJKb3RtNjR2M21DME5mZzZyb3BM?=
 =?utf-8?B?RmhxTGpuVXN2U2doS0YyNUpLOEFBWDlqejNsN0x6YkF1R0dTOWR5ZVZScEhE?=
 =?utf-8?B?NWprcjdtUHcyYkVBMW9GYng1aUs2cDRDaE1nbHZhelc5eEc4c09VYnZwOTlC?=
 =?utf-8?B?RjFLUnM1S3QzVmdsekw3bHhpTWE2TFhRc2tiUFNxaThmL1gxM1E2TEV4RDZs?=
 =?utf-8?B?Qit5M0JvbW1mcG5QY3JxcitZSU9pbTNaU1NqeUxtQXI5M20rdHN4azhFL1pH?=
 =?utf-8?B?aUJWdTJwMTlVMm5RQk5PYmZYQ3NwVXlqM28xNy83WXlkY3lIcUdJL1UzQUZR?=
 =?utf-8?B?bUg1Smx4YmNxajZvVTNybUNYNGdQTUw2b3A2MVhWMUlGU2IzQjBoZlU1cFBO?=
 =?utf-8?B?blI5OTBRVy9SaURkVi85YlM0aXloL2IxaTFIU0NlUmVoVlJvQkQ3Q2NicDRQ?=
 =?utf-8?B?WEhKSXpkUExiS1l2a29HWVlYUXVaaE4wc05TMTdPVFMyUXphcXh4NEx0WXZw?=
 =?utf-8?B?NHNpdDIxdUhGUExLMFArVXhiK21PMkdDUzd1dDN4Y2d6OGtsV0F0TnZvZmx2?=
 =?utf-8?B?Rkx3dmJRVWpyaWd3ZlQwNlg1Ty9nQVpRZWw0Y0Vib3pMZFBWbnowb21Fako3?=
 =?utf-8?B?TkhPUU1MQktsS2lxWUo0dlRxaWtrOTJxTGtSS25kVm1vSnBTRm9PQitROWZE?=
 =?utf-8?B?NTY4ZEhlUzE1LzA0NXQvdTE1bWJIRXh1Wk1WOTVWVENBSkFWU3p3alhQSm1O?=
 =?utf-8?B?QkdxQUxJM1ZTenRibTJzNVFXc3h1aTJQNkEzYTNzbHFSNnA1NnhwSk5INWlG?=
 =?utf-8?B?REVqdnRHQmo2T2loQXVnT25mdXNyRXErWnZ1NzYxRE9id3hhb0dIZjFmcVVr?=
 =?utf-8?B?VjlrN0xweis4Y2N3aFo1VHI5cFNMQkk4R09KazVFaXBBQ3oyaUNWeVZiUGhT?=
 =?utf-8?Q?BK1qDjr4kZCQJFT0=3D?=
X-Exchange-RoutingPolicyChecked: AuM3uXzNOI26Osz0arrTUNKi6+nt7n9usXlQ85Wjy+ALmvhK04B3H1ccpUUp/vZdWjkK4b8IIl2VoYlzcyBXMfSaO4kPUz/vGoDd5+fchUb7m7j4IQzBysCmhQbHA/LCrqPndy4WGymo/d33U2WxR/lLzJTh8K2A+KxS+4vuDQfSLrauc0YsyJXYdJ9Yzfn/bnHaP/Ox8G5E91qjas1qrOhobgPd/IeQ09ztA3hm7ZR2XvM/tu+Ng+FvAKBMJLNWjC08f+as/yRUxodpV0Zn0shM18Ajtr9I2xYy0p+Lu6TbCC/JEEQq+csCH0WNByTQjyZHsrcFUvMoxsMdkw712w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d6a3ef-80de-4499-6171-08df04eec60c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:26:08.4358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzD+65U9+3YHvl/XoRmL9ZXtJ4OFxE2+6ZtVSTGswXVvFzIPfrZuJekSMjtJ1iXFadGJoQuqv5JJczxyUtt7QKmkO28iGv3aOXU0acFTuKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB651330
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



On 8/27/2026 10:12 PM, Nemesa Garg wrote:
> In joiner mode the fast path cursor update must handle
> secondary pipes. Iterate over all joined pipes uniformly
> to duplicate plane state, run check_plane(), pin the
> framebuffer and on success swap in the new plane state
> for each secondary cursor.
> 
> Track every successfully prepared pipe in a joined_pipe_state[] array
> of struct intel_cursor_joiner_state so that later frontbuffer, unpin
> and error-cleanup paths treat primary and secondaries uniformly,
> and ensures the primary's pinned framebuffer is released if a
> secondary fails partway through.
> 
> Convert the primary-only vblank unpin block into a loop over the
> joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for
> unpin (or unpinned inline when unchanged) independently. All unpin
> work is armed on the primary crtc's vblank (&crtc->base), consistent
> with the single primary vblank evasion used above.
> 
> v2: Use intel_crtc_joined_pipe_mask(). [Ville]
>      Add locking mechanism. [Ville]
> v3: Drop the per-pipe fastpath mutex array. [sashiko]
> v4: Fold parallel arrays into struct intel_cursor_joiner_state joined_pipe_state[].
>      unify primary/secondary in a single loop.
>      use bare check_plane(). [Chaitanya]
> v5: Fix secondary uapi.crtc to each pipe's own crtc.
>      Rename intel_cursor_pipe to intel_cursor_joiner_state and
>      joined[] to joined_pipe_state[]. [Chaitanya]
> v6: Mirror primary uapi into secondary hw state, don't set uapi.crtc. [sashiko]
> v7: Squash patch 5 with this patch. [Chaitanya]

Thank you for squashing the patches. One small nit, "patch 5" won't mean 
much when this series is merged, use the following instead.

v7: Squash the per-pipe cursor unpin scheduling into this patch

The change can be made while merging no need to resend.

==
Chaitanya

> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 181 +++++++++++++-------
>   1 file changed, 120 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index b57b446b9788..e4a7d4d2915a 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -847,6 +847,7 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
>   
>   static void
>   intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
> +					 const struct intel_plane_state *from_plane_state,
>   					 struct drm_framebuffer *fb,
>   					 struct intel_crtc *hw_crtc,
>   					 int crtc_x, int crtc_y,
> @@ -854,20 +855,34 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
>   					 u32 src_x, u32 src_y,
>   					 u32 src_w, u32 src_h)
>   {
> -	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
> -
> -	plane_state->uapi.src_x = src_x;
> -	plane_state->uapi.src_y = src_y;
> -	plane_state->uapi.src_w = src_w;
> -	plane_state->uapi.src_h = src_h;
> -	plane_state->uapi.crtc_x = crtc_x;
> -	plane_state->uapi.crtc_y = crtc_y;
> -	plane_state->uapi.crtc_w = crtc_w;
> -	plane_state->uapi.crtc_h = crtc_h;
> -
> -	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
> +	/*
> +	 * Only the primary owns its uapi state; a secondary mirrors it, so
> +	 * its uapi.crtc/fb stay NULL and hw.crtc comes from hw_crtc.
> +	 */
> +	if (plane_state == from_plane_state) {
> +		drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
> +
> +		plane_state->uapi.src_x = src_x;
> +		plane_state->uapi.src_y = src_y;
> +		plane_state->uapi.src_w = src_w;
> +		plane_state->uapi.src_h = src_h;
> +		plane_state->uapi.crtc_x = crtc_x;
> +		plane_state->uapi.crtc_y = crtc_y;
> +		plane_state->uapi.crtc_w = crtc_w;
> +		plane_state->uapi.crtc_h = crtc_h;
> +	}
> +
> +	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, from_plane_state, hw_crtc);
>   }
>   
> +struct intel_cursor_joiner_state {
> +	struct intel_plane *plane;
> +	struct intel_crtc *crtc;
> +	struct intel_crtc_state *crtc_state;
> +	struct intel_plane_state *old_plane_state;
> +	struct intel_plane_state *new_plane_state;
> +};
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -883,11 +898,12 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	struct intel_display *display = to_intel_display(plane);
>   	struct intel_plane_state *old_plane_state =
>   		to_intel_plane_state(plane->base.state);
> -	struct intel_plane_state *new_plane_state;
>   	struct intel_crtc_state *crtc_state =
>   		to_intel_crtc_state(crtc->base.state);
> -	struct intel_crtc_state *new_crtc_state;
>   	struct intel_vblank_evade_ctx evade;
> +	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
> +	struct intel_crtc *pipe_crtc;
> +	int num_pipes = 0;
>   	int ret;
>   
>   	/*
> @@ -933,38 +949,68 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
>   		goto slow;
>   
> -	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
> -	if (!new_plane_state)
> -		return -ENOMEM;
> -
> -	new_crtc_state = to_intel_crtc_state(intel_crtc_duplicate_state(&crtc->base));
> -	if (!new_crtc_state) {
> -		ret = -ENOMEM;
> -		goto out_free;
> -	}
> +	/*
> +	 * Iterate over all joined pipes (primary and secondary) uniformly.
> +	 * The joined pipe mask includes both the primary pipe and all
> +	 * secondary joiner pipes, allowing us to handle them all the same way.
> +	 */
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_cursor_joiner_state *j = &joined_pipe_state[num_pipes];
> +
> +		j->plane = intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +		j->crtc = pipe_crtc;
> +		j->crtc_state = to_intel_crtc_state(pipe_crtc->base.state);
> +		j->old_plane_state = to_intel_plane_state(j->plane->base.state);
> +		j->new_plane_state =
> +			to_intel_plane_state(intel_plane_duplicate_state(&j->plane->base));
> +
> +		if (!j->new_plane_state) {
> +			ret = -ENOMEM;
> +			goto out_free;
> +		}
>   
> -	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
> -						 crtc,
> -						 crtc_x, crtc_y, crtc_w, crtc_h,
> -						 src_x, src_y, src_w, src_h);
> +		intel_cursor_fastpath_update_plane_state(j->new_plane_state,
> +							 joined_pipe_state[0].new_plane_state,
> +							 fb, pipe_crtc,
> +							 crtc_x, crtc_y,
> +							 crtc_w, crtc_h,
> +							 src_x, src_y,
> +							 src_w, src_h);
> +
> +		ret = j->plane->check_plane(j->crtc_state, j->new_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
>   
> -	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
> -						  old_plane_state, new_plane_state);
> -	if (ret)
> -		goto out_free;
> +		ret = intel_plane_pin_fb(j->new_plane_state, j->old_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
>   
> -	ret = intel_plane_pin_fb(new_plane_state, old_plane_state);
> -	if (ret)
> -		goto out_free;
> +		num_pipes++;
> +	}
>   
> -	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
> +	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
>   				ORIGIN_CURSOR_UPDATE);
> -	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
> -				to_intel_frontbuffer(new_plane_state->hw.fb),
> -				plane->frontbuffer_bit);
>   
> -	/* Swap plane state */
> -	plane->base.state = &new_plane_state->uapi;
> +	for (int i = 0; i < num_pipes; i++)
> +		intel_frontbuffer_track(to_intel_frontbuffer(joined_pipe_state[i].old_plane_state->hw.fb),
> +					to_intel_frontbuffer(joined_pipe_state[i].new_plane_state->hw.fb),
> +					joined_pipe_state[i].plane->frontbuffer_bit);
> +
> +	for (int i = 0; i < num_pipes; i++) {
> +		joined_pipe_state[i].plane->base.state = &joined_pipe_state[i].new_plane_state->uapi;
> +
> +		if (joined_pipe_state[i].new_plane_state->uapi.visible)
> +			joined_pipe_state[i].crtc_state->active_planes |= BIT(PLANE_CURSOR);
> +		else
> +			joined_pipe_state[i].crtc_state->active_planes &= ~BIT(PLANE_CURSOR);
> +	}
>   
>   	/*
>   	 * We cannot swap crtc_state as it may be in use by an atomic commit or
> @@ -976,7 +1022,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	 * planes atomically. If the cursor was part of the atomic update then
>   	 * we would have taken the slowpath.
>   	 */
> -	crtc_state->active_planes = new_crtc_state->active_planes;
>   
>   	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
>   
> @@ -998,9 +1043,11 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   		local_irq_disable();
>   	}
>   
> -	if (new_plane_state->uapi.visible) {
> -		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
> -		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
> +	if (joined_pipe_state[0].new_plane_state->uapi.visible) {
> +		intel_plane_update_noarm(NULL, plane, crtc_state,
> +					 joined_pipe_state[0].new_plane_state);
> +		intel_plane_update_arm(NULL, plane, crtc_state,
> +				       joined_pipe_state[0].new_plane_state);
>   	} else {
>   		intel_plane_disable_arm(NULL, plane, crtc_state);
>   	}
> @@ -1009,26 +1056,38 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   
>   	intel_psr_unlock(crtc_state);
>   
> -	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
> -		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
> -				     intel_cursor_unpin_work);
> -
> -		drm_vblank_work_schedule(&old_plane_state->unpin_work,
> -					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> -					 false);
> -
> -		old_plane_state = NULL;
> -	} else {
> -		intel_plane_unpin_fb(old_plane_state);
> +	/*
> +	 * Schedule or immediately unpin old framebuffers.
> +	 * Protect against concurrent access.
> +	 */
> +	for (int i = 0; i < num_pipes; i++) {
> +		struct intel_plane_state *old = joined_pipe_state[i].old_plane_state;
> +
> +		if (old->ggtt_vma != joined_pipe_state[i].new_plane_state->ggtt_vma) {
> +			drm_vblank_work_init(&old->unpin_work, &crtc->base,
> +					     intel_cursor_unpin_work);
> +			drm_vblank_work_schedule(&old->unpin_work,
> +						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> +						 false);
> +			joined_pipe_state[i].old_plane_state = NULL;
> +		} else {
> +			intel_plane_unpin_fb(old);
> +		}
>   	}
>   
>   out_free:
> -	if (new_crtc_state)
> -		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
> -	if (ret)
> -		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
> -	else if (old_plane_state)
> -		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
> +	if (ret) {
> +		for (int i = 0; i < num_pipes; i++) {
> +			intel_plane_unpin_fb(joined_pipe_state[i].new_plane_state);
> +			intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +						  &joined_pipe_state[i].new_plane_state->uapi);
> +		}
> +	} else {
> +		for (int i = 0; i < num_pipes; i++)
> +			if (joined_pipe_state[i].old_plane_state)
> +				intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +							  &joined_pipe_state[i].old_plane_state->uapi);
> +	}
>   	return ret;
>   
>   slow:

