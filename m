Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCA7C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3110E0AE;
	Thu, 13 Aug 2026 10:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DakVdzQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BDF10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616342; x=1818152342;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VGvr1ZSwvG/oX7GaUlbLUi0MThGsArvzaLy4sbZl5zg=;
 b=DakVdzQaSDMdEQdh4XU97iaPfDTCLUjOe8+wx6t1fkdx+hrGd2Xn0s9E
 3hns20zaYaoMxNlkJ4Bff9yZASeh9zuPAYyWiRVTqVI+EaFsXsWOAQnE1
 wDyQ1o22WR9OoSvCGo1r0BwCu2ffs5lpjMHLiZnoDT83zErJz4GaXqtkY
 E68/rVh90aInlGJejT1C0T/vLOpCTTuQwUqVDcQwPzOe1JlFNWkRglP3x
 YHnHhYdjkA1VGFmp8T7nOk9LbJPpM1i7eG6+TWejtwk2I6SBk2vPEeObF
 6YmCx64lkPqft4FDeBtP1aUhaOyF66dOUiBOCUv/pc0ORIOywtgGF1JB1 Q==;
X-CSE-ConnectionGUID: ayRA3ghcSiGJR9KgBJExQw==
X-CSE-MsgGUID: pAXs+g4HQhSlgTnubzlSmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87207641"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87207641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:18:57 -0700
X-CSE-ConnectionGUID: TxXsXeYEQj2RK+r2VgllKw==
X-CSE-MsgGUID: 5uEcPl3VRraz6CRYBTRTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288688053"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:18:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:18:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:18:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjRXRTfwKcLm+baFA3J7aeySEb0drIN+uklyUneX3cM88o4z6pBnJPM9APcKnF6Nv/y/h4CDvaI8Ev/8/MZj6aIUSCwntwOJ1zvhuYxpSIe+QK47XQQR3aZaeC6aKAhzbXMU8hL5Ne/IUSMGqJmozCkfJOl3TFXtfTJH94y0e7UHRduKe0lEWepkHe5dDUz3ZMgw3uZ/+Bgp+9RnHdEaeFVag0g6Vp9OGoWjAKw19F19qw5R8ewI7UnHA9x6CannFV0to6G6/NND0h6gMaH7u5v/YmaD5Zl0c93zwyIt/zgwYd3YzLUzlBe+bMPgdOgIHBXEcNLbWrfwQOTmaGhmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/iOG9JlFnPAGmVveZc0T/+9hFJVPu9HtD568IWlnU0=;
 b=uSu/afPRSXrbzOVTXfhxrzG8Te5yN/+G0283iS1vm2iqkNhQ8KpJCnsMzABWB0IhCNONGbTkOhNBY9+CmzZb33OYp+/CPVmcxnQyOGOMBU/FVjHAqlAtLl4aEQmD1KuWysR7P7HI0AbbJvHcnKf8WDmEaa/eUGR+iKYckkrDxrY9uTQjAx8rlEMcEwm9HfJUqDw/7R7dGJ6KVAosqJxSk47PNxz0JPsgjsK1mu/bU4EPlB1zwE0AWk8PYx+UoIbtydsfbc/SYM8XG/FNWZN/cJlzu7G4gLkEYpZpPZNZ1gqCLqQRA+GJDL8Ro68txLaY2N2SYFcVyHlkPDnUiBQxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 10:18:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 10:18:52 +0000
Message-ID: <2662b52e-6fbc-4fbf-8528-e55656c387c2@intel.com>
Date: Thu, 13 Aug 2026 12:18:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
 <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
 <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
 <b0d83bf9-a060-4593-b040-7988b91bef79@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b0d83bf9-a060-4593-b040-7988b91bef79@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 805ba8f6-aacf-484a-5112-08def9244629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|10067099003|56012099006|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 93enlfWtigE6JoZRHDFtZLz8raQudDekeJQnAPHExUpCuK/+TuWzO04vNrzX2QLotaCnM3MiQR+TLlf98pRy/zKwfxnauPzO/nlzecWOoB+zZlqBEeakyUGQG7y8hYyPTTMMCtHo2r+zr3Lsm5M0qzFvLmwrAmI1YNE+ERTZW7X+tqv+fUbc9ozGjRBDxAJwH7MPNk+Yr9RPn5Mk/uEVcUyd6/UpTqHSs52RFDzEhyUGKWM2VEVjz49grAMODhh/shDvAR1v9ua5FBj6xRU/CdoTVhkz65YQDc5tiCVsboqzwjO+svulBxs9vH1n1SO90aPkFTbM8OciFMj+6te2EGvDhVW+MMPKvx4EPan8Tp7LIIHom5Q+vXpPFkEWxwmpWM+gl/u6ZeTAO0SYYvDhSzeTctzi7yX+puGm/V7R+Xiq1vhxh/9YwRV9cvxAzWWKjPncT6jqFovWAmAMUTbgFqPnAlokHZKkX6yvUqPpEggAMGfbUlZhgA1zmayViJWUgFdpHnUyjjOleZOH6IB8nM8AIFxjdv+t9PkgvC6gbI8sNm1Ikirt+FfZ41evOM8IOqmHXKlro+nQmdCWFaNSON02VdWO6UTa1s+A+8cnlntEsSB4pKjADyp1oAlhtIDPaHcYMMhdIl3x3q1gj+uXFTH9p9hwIuHWDyn33bkWRK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmhZc1pXc3I5QmpiTi9PZXFBdkRlNWFreUhic0RYeWJhQnVUTzJpaEo2MDE4?=
 =?utf-8?B?Z3VQVVJuV1crbVJwL2Mrcm1iYW9aMDVIODNoSVl6NFFlMUlRWCtvblkzOWdD?=
 =?utf-8?B?dS94bkhrQXlNaGFyV0QxSENFYWtYT2FkbE4rdTJyV0tKVjROS2JMc1ZINll3?=
 =?utf-8?B?RWN2RStKaXNmVHc3VFpCSDZyK25qMllISkZjc0V4eGZldGtNaWdOQVRpL0dO?=
 =?utf-8?B?Yy93bjN6dUVpZFMxNFozcnlSVnUrVVZuQXFDb1dKcERFU3ViendycXZlSU5y?=
 =?utf-8?B?eGZIK1dBNXRLMW92blZYOHRvV1VUK2R6R05XQk9YdUlKMXJlZWNmZThHbW5t?=
 =?utf-8?B?dkROemRZNEZtbEoycjUwVElGMjZOVGlFeVloNUNIOUY0dXZBTy82VGYrQWJ1?=
 =?utf-8?B?SEEwNHpGVjZxcnA1TjRJNDFRV3pZRWJ4NFo4cEtsbUc5S3Qvem81WkYrTlVi?=
 =?utf-8?B?b0FRckFiMXJRZHZveC81eUNLOVczMytQZVllWHpHRFNYRERmSmcrbDNZUENl?=
 =?utf-8?B?Z2h1UVpFZDhTa0tSYmd1cGN1dlZPN011ejZJSGZwSUFVQlB0R1dXNGJJWGRj?=
 =?utf-8?B?WFphaEhoUVNDVGhmV1cvcFdMUmNLZ0FUVFpFNVZXNGxZLzIzZCs0dFhnam41?=
 =?utf-8?B?SUtwTGVkVWJwM1BvR21qR0E1RFB6RWxyc0Q5UnJUcnJTRGhWVU1lTUFFNEpF?=
 =?utf-8?B?NmI0REpoSDIrdkRSMHNBUExSSnZZMktCWGY1MTh0bnlIdVFYYmhhWWY3U3hD?=
 =?utf-8?B?a0x3WFdSZ0JvdjYxV1Z6VlppckF0ZGg0b0EwKythSDFUT0FvS0VyeTFCZ3V3?=
 =?utf-8?B?MnVzSUw2ejJMRUVrZEZzakphNnZXUUM3SDAwUi9HZ2FLc2NtQzhVK1lmTkhr?=
 =?utf-8?B?Z0VHd0k1WUQzTS9iRzI1NEcrQnJxcGFTZ1pyM0lrMXVjYlp3NG1uVWYvc1Zj?=
 =?utf-8?B?SXR4VGQzRCtYbnJaenFCOUJqNmRPbStIWWhCczRuOTJEZjFwdWoyZHM1WnBX?=
 =?utf-8?B?c1pMMGE3RzRERUg2clcwVzl3KzlJZ2xaQXpSNzhUdWJBY1A3OUJhV1ErbFFD?=
 =?utf-8?B?dUZuMXUwNUQzdFd4bTVMaVYxREFzR2RDWkpGd28yOStJU0dxNW9hMVlWbHJZ?=
 =?utf-8?B?TktkRDFpUHUrUmg0NU5LOW41bURTMCtYaXpDeTUzRzlZRTNBYUs2Z2xXdTB5?=
 =?utf-8?B?dldjU2ZlMEgyVVRkemppWFVRMmNEdVhLZjh0aE4zbG5HK21BelplbDFWR056?=
 =?utf-8?B?ZzZ6anR0YTJVKzE1TXVlTmE4SE1LRDNxR1NybDN6SzlXb1lXQ1FwSmVibld5?=
 =?utf-8?B?QzBEd1pmNmE2TFZxenU0Rm5TS3ZhQmVnRllsQWNjQUVvK0xsWEpGaUFKYTNS?=
 =?utf-8?B?dGRhMmh2UlF6ZlZvdkNFZkFDVHBPa2ROQmZyY0pHaitFRVdwOXJVL3dyUjZQ?=
 =?utf-8?B?M2VFK0gydnRpWTNwbFpnOUV4RmUrci9wSXdJUnUwRXk4S0pwcXFtd1hUalI2?=
 =?utf-8?B?QlBncUd5WWRxaWgzRGRNWXdQYnZMeU43RnNOWEpnWW1ydjIxbW8rOWJKeDFG?=
 =?utf-8?B?TG1EVW1WOVdHeFRLVVdqbUE3akxQYVZNNWRMNUgySVJnTllMWVRGaktOVHJr?=
 =?utf-8?B?bFBUTmNudTJkWUtvdGMxRjA5WWZKeGN4ZnhYZjR2VFJVOFlvN0RaaGFOQ21p?=
 =?utf-8?B?RHVud3d1RFcyL0cvVG13REF1SnE5ZzhJejhhNDZhYXAxcGRtVVgybEpDR2NU?=
 =?utf-8?B?Mm0vZFRoYkdTK3E3eTlib1VLUFpESk5QQkhST25JdjZuOUdQdGpLZFo3ZTkx?=
 =?utf-8?B?dXIxM1hadFdTaysvZW5KL1FWSVNCUk5HbnFnNC85VS9rbCtRSFlPLy9tQjhw?=
 =?utf-8?B?bXh0Qzkxd2JJNC9uTXRjSzEwWjladjFUYjlQS1FsWUpNdjUydnJtVGpPVEFv?=
 =?utf-8?B?a3R2bmJ3UkxzUExRWlQrOEd4VDd2TWR0RURHUzBFL2tPb2k5L09mTXQxTi9u?=
 =?utf-8?B?RjlkWnh4MDNxU0NKTjFjc21RVUpSakh5MlJOMTFRWEFsS2MvelVhTUdtRFhh?=
 =?utf-8?B?UEZ1OXNJTDVCRzNIZWVzYjl5djVmSzZXUUJQVUhmdnJkd3BMYkFlMXQ0SVRQ?=
 =?utf-8?B?TTlSNXZJaTdTZnhXSGtoYkc5UDBueXloOHpwUnM4QVp4T1djWEJ3SVk1RnR3?=
 =?utf-8?B?L2U4RjA0QnZXd3I1TjUweTc5OU45ZVRZV3VoUkUrL2xlNlhDTnJLbHFzbmQ1?=
 =?utf-8?B?QzJ0RW9sN041OE5qRjhMV1lENXF6cWg4cHI4Tkx4MkxVT0hGNjBJM1VtalJS?=
 =?utf-8?B?Y0w1Q0JONHRIT1ZwRHlaTU1kRGdKY0o0WVFDanZwTi93dzFxeDdldm56YkhT?=
 =?utf-8?Q?r3mY8sJTJCuKy1ls=3D?=
X-Exchange-RoutingPolicyChecked: jjeRnLUtyaAYeNjM6bALx8MexaDOXZxK2Ki2VnVqdQ949/kYrTsaFkAJ4siSUbGScBT6eCvf5sgRAjvD/Ggnr0ryfWLj4R8SZIZKn3IiHXye/9q7PzblpngXdAlJLNFa0x2Zq70Ds2yOUDI4qpuFEuGiOwrzZ6sFq+kGrKYuskBVomu6WnKQffvVlOXtq6QJMMZNeGsVe+S+lUTJQYwqFGv+6p39dvyGKoBmGS45LvBibMw4gra1OT26Dlb9dph6CQvA7wneWAmpQfsgdH6jRuMUWdFwhRvqPK7j8Uy8qMf420CC0FwZvPGg+/Ca4p4CSHuCGHwQmk+IwmbfS45cUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 805ba8f6-aacf-484a-5112-08def9244629
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:18:52.6452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkGZ9FrdMAtJLI9QAn+4GyZN4HKlhYr5n6c2KNJHLcVyI7RSubPsrCK2zhcfm5EI6fVRU1xC1dB0//c1YjFy7ntaQ/WaLSeI+Ox2nz1nVpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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



On 8/13/2026 12:07 PM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 02:58 pm, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 10:38 AM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> Report 'boot status' details using xe_log_err_fatal/info() macros.
>>>> While around, move static helper code closer to the caller and let
>>>> it take xe instead of pdev.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>>>>   1 file changed, 19 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index 4c506027fa94..85b4c125a217 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -14,6 +14,7 @@
>>>>   #include "xe_device.h"
>>>>   #include "xe_heci_gsc.h"
>>>>   #include "xe_i2c.h"
>>>> +#include "xe_log.h"
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_nvm.h"
>>>>   #include "xe_pcode_api.h"
>>>> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>>>>       }
>>>>   }
>>>>   -static void log_survivability_info(struct pci_dev *pdev)
>>>> -{
>>>> -    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> -    struct xe_survivability *survivability = &xe->survivability;
>>>> -    u32 *info = survivability->info;
>>>> -    int id;
>>>> -
>>>> -    dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>>> -         survivability->boot_status);
>>>> -    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>> -        if (info[id])
>>>> -            dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>>> -    }
>>>> -}
>>>> -
>>>>   static int check_boot_failure(struct xe_device *xe)
>>>>   {
>>>>       struct xe_survivability *survivability = &xe->survivability;
>>>> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>       dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>   }
>>>>   +static void log_survivability_info(struct xe_device *xe)
>>>> +{
>>>> +    struct xe_survivability *survivability = &xe->survivability;
>>>> +    u32 *info = survivability->info;
>>>> +    int id;
>>>> +
>>>> +    xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
>>>> +             survivability->boot_status == CRITICAL_FAILURE ?
>>>> +             "Critical Failure" : "Other", survivability->boot_status);
>>> Since log_survivability_info is called when survivability->boot_status == CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.
>> well, that's the current usage and function name didn't strictly say "log critical failure" only
>>
>> btw, printing fixed "Critical Failure" string followed by flexible %d also doesn't make sense IMO
>>
>> that's why I decided to make this function more flexible and reusable if needed
> 
> Totally agreed, u made it generic one, however current usage, we never going to hit "Other" case, which is dead here.
> 
> btw, "Other" is "Non Critical Failure" right?

only if boot_status == 7

but since BOOT_STATUS is REG_GENMASK(3, 1) I assume that there
might be other values, beyond currently documented 4 & 7

so even if we print "Other" there will be still numerical
value "(7)" or "(1)" that could be used for debug/triage

but I can add helper

	static const char *boot_status_str(u8 boot_status)

to return friendly name for all currently known codes
(and "Other" or NULL for unknown codes)
> 
> 
> Thanks,
> 
> -/Mallesh
> 
>>
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>>> +
>>>> +    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>> +        if (!info[id])
>>>> +            continue;
>>>> +        xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>>>> +    }
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>>>>    * @xe: xe device instance
>>>> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>>>        * v2 supports survivability mode for critical errors
>>>>        */
>>>>       if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>>> -        log_survivability_info(pdev);
>>>> +        log_survivability_info(xe);
>>>>           return -ENXIO;
>>>>       }
>>>>   

