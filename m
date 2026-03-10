Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E48AEB1041
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 10:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4296910E214;
	Tue, 10 Mar 2026 10:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnJazhPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9210E6AB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137929; x=1804673929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6lSTg5unHUne4RM054q6EakDqJOnzodXte2DOKsu6rI=;
 b=GnJazhPv4PfDUSOS1EcAPnbv9KFB9AplBWNP5+Lq2Hgixp4FA6qrZ+JX
 bWCcRKNtmtz8d9u2yVd54VhvhTsgcYz/E0HlDYaiTSvTsz1OVlIMMQisO
 VUa3EW+PzblW7n3JpqLcj1Avd/0vMVy5uXTax8lDstMoFSbWxXYQUGCYT
 g5CfWLx0g+Fude5+FC8Mr4eAbT99c+oIkYENL9TBfmlVWA9cZ56gFDx7K
 ttT9S4QsrYgs9Yy2CGHsanLyiMQmqFVmTb8CQ36Wmk0hngXYd0TWFw2ff
 0gyOI6bpZdDqHHe9O8LcEmkOUug1STsNwXNlFgo3W2BZHaUaj+h1Q5ZBn w==;
X-CSE-ConnectionGUID: BPJFhabIRDCWHQnZnenEOQ==
X-CSE-MsgGUID: z9xu4VxoTXq11lQHAoeLSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74096570"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74096570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:18:49 -0700
X-CSE-ConnectionGUID: pzf5wER+QzmwaLe7YXaagw==
X-CSE-MsgGUID: VmOEo/usTvKgP8FkzagkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="222673048"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:18:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 03:18:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 03:18:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 03:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8v5QHtXOcXDpqbONXW9cqKy2hkvzCBLxlzbr3xrUDiOfqFYR6deuEOGYaUw6V0KdtD60acFDpJxxlLrXrJiEvd57PFShZNYdUkhd6fzwhroNVLLITRPL1afazNjgRO0UYRhPtkBLBjctt3BnqMJFT51q7AjRw/0dmfrR2+CReQ7E1j3kR5ljMVV0PoLexZ9C0pzIVDyDtN+AykBxzURw8XBJE0PT17G3MeNu7BiXApueVTcIMelfVQBNHO2kMiZ7psHJ2hsVQLoXch8Uj6ZwRissNEpa9SKMbh7aN/ylyi0A+GeFkAqSegqlhxLcpYUTuzOgb2cacYqVUX5NkPRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjAO6crm+WMW80jfbQjByCoP4OHqwaxqnT4gWpsYs1Q=;
 b=Yh3KLBzARr8INX6qr/kBEfycp9ms6ldO8XEFxbnRqB2S29bMjmi8eQwkSt76Ch9Y/D6BmkahoMFQ0y9k+kMy1wN8zGjVz3iBpvN70pKOwond/90ObOf1oRQNcKm+Zcqwh9OErilRhmDXqGa+O0tcm4GWIXTjrax3fhYxjSzqzq/chTzfNzCIB4OG9xU7zXI+J6VPaz8MtoWp1nxE+6vOyBunDSzLwdl4WQh1C8fFdTKcPkKztAzd153EDm+wcPdumks27mSF0BDA6ttz7E7qS0OgNLnw8OrIP175ACdHNW98JW+OuhK2HvSpr5Jco/SwDCXpPiVp0AWdk4BTFlQGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:18:45 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 10:18:45 +0000
Message-ID: <69bc7fd7-b1ca-4949-8eaa-15208ae1d38b@intel.com>
Date: Tue, 10 Mar 2026 15:48:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
 <20260213081644.2085314-5-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260213081644.2085314-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb78982-babb-4836-0d93-08de7e8e6966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: MHgLj+PfaPrwDVpCm8I/4WHMp4ww4uSCHZgcFonWw6uo0YRDCZPLlsZfGFXS6OYg19QU/nx571JeLhWIhVFYa9/kAVsUKZj5yCYsSYiwEXkekp9ZsJ2s1CfbuJLpniE2v7PIhDeNf3Q/UskEN91BEvB3GAMfh8vOtQjDSMou4c/k1oc/2gVA1jAerPqbviBnEzDjNzEz2oTrfY3sks672z2/O/uLTc3YR03nXXD60Me0wgSdlzA3KAQjiTH6B+lT4RWWNYYNjs8SAimR9PcO+R+4okMgrmsy5ExQqYOyiH9y/5MXAg3cITrMzR5LYsR+5v02WwECKKXvPR4I/xUHD7JZrsDv3PzALfSAB6KsfNJJAyPGB9gJ0EsQqP3qVWPMo1kPRI+fF+2Q96P/csZEFhHkA4WI5G9Y3D7ecF/lEF23JPMRfMU45y6YsH3gdNSl5BrUTg7iZQ1W3IgsR7V1jiF0xZ7Rnvgs+PHZCInzpzR0FQuwn4D09M+nLqaFK1cWUPPw0RO9YdHUZEFLbmPvNE09sCX4jzDk5u0PJoNLnz1eClYDN9GQ5CkMfb2h3wZMi6rS/D7hIAlN8URRslJZad+C5uGphrMTpkezLPsDfuKPtyYQmkbRx4/VNpkJKc9Nf+WAjoJ81GA2NNQAKa9XctNbSL1C8mycpjOWt+6Ncm4srQussdoqN6afUpmyEYS0G5Z2Y18ZxL1JeTly6SwLv7ULOcscXHNVSbhJyRwORvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0plLzNzdTFFUFlUTjNSUmFZTXdEanlCdUlKRU4rbWNBT2IwUkZPQ0hrbVcw?=
 =?utf-8?B?SUZkR3FUSTBJWTJwTytTcHVGRVcySUhxSXNpNmt2N3BtVzViem04SkNpbXdZ?=
 =?utf-8?B?R3JZTDY4MS92SXVUM2N4UGhkQk14YmMvbUdXeCtVMkY1ME53bVh1Qk9UTGNX?=
 =?utf-8?B?V29KcEdQYmFrY2xaTitCWXZ3eCtYdmZ3SVZqY2FlSjFRKzFMR3V4Um5LRk94?=
 =?utf-8?B?Z0p2MTByZzNGK2t0Ry80NkFyR0tzTnFoVFY0bHZQSlRrUkNla20rdnFyNFZ2?=
 =?utf-8?B?am9OeXU5dmJSTThSZk84eWhWdjl4Zm1WT3NVSFNpNnkzZmFxL00yb29IUFRU?=
 =?utf-8?B?T2Z4MEZBS3ZibDU3U3JLem1aYnFtemxFb05iMGhvN3c0dlZIWWVMWnM5OGl4?=
 =?utf-8?B?NWd4OUQxY3h6ck03OURsY1VjSGpFNnFEQW1xVXdrQ2Vpb0dLek0vN1BsZ1ZI?=
 =?utf-8?B?b1ZRcFBTc21UazZsbSs1L3NXMUhrdXBvSjRDd1dOSGN3MFBab3htS0ZLaXlC?=
 =?utf-8?B?TjBGa0JNODZZeE5GVmxwN2h1UUlILzU0ci9wank0TlNjc05PQTlleWNjbzE4?=
 =?utf-8?B?d1ZnWko4aXRLaEdPM0RUZytNSHVrbG5aYmorR3JSQllKQUlyZWVrTjZmRU5U?=
 =?utf-8?B?bVdZdUhnbkl5MTYySzlETEdzMEFUSUgyTWVXL0hlazhXM0ExWnJjcXVrVnNW?=
 =?utf-8?B?em1YbzRYalRIUVNnWlFhQi9Rb2xaK25lWGFSMk00UkVpRklBN2VZeTlXKzk2?=
 =?utf-8?B?Tm5HRTNTU0JSQWpLbXU4Z3JRemNRS0NEcWRsRWx5S2U5eHlDYTQwUGJlY3cv?=
 =?utf-8?B?SWRFQ1Z4VElxdXl2SXFPMlNuSFRPeWRCbkt0a01tcGhaWW1EZWpMcDVnQWdI?=
 =?utf-8?B?NitzQ0NSbjVnVGY2SlJuSFI0YnQwK01pNVV6dHRzcjBlZHA5Tlg0L2VuaGZE?=
 =?utf-8?B?RTJPUjltUVBtako0QlU2ZmFXR1FKd0hsK0t1ZXVxTUxEaFN0enNtRlZyZkJq?=
 =?utf-8?B?dHdMd2NEMVhtUU84bTVmM0Vlc1dsVFlCVzNINldGQmxXdDljMXNSMW1XK3lq?=
 =?utf-8?B?Q01SMkFuamcxZk04djFqZDdsdzY3OENyL29ZYll5WU5JbXhZcXdBbXFFK21Z?=
 =?utf-8?B?ay9lMjJwL2dEcWIxQ3U1aXhDWVFMOWt1c3ZncVZwR1ZzQ2ZSSHFjdDE3R0FH?=
 =?utf-8?B?MmR0TDRhVXl5bGF1YXdUNkp1c0svbVlQRmdmejMzUHhaQTd1K0w4L2JUaWpn?=
 =?utf-8?B?N29MY1AraGwyeXl5Uyt5ZDhhUXFPeVZFazRWWGsrc2lNOUphdER5WmpjUUYy?=
 =?utf-8?B?MDEra29GK3RmYUdac1hYZXIyUTFENkZmQ2NoVUhaamF1SWQ1Yy9hKzh6dXFF?=
 =?utf-8?B?a09vaWswK0xwdFhHZlFEcEcvSURoaHd0WGRIMVlReDRBU0RVeHlnVXZpUFMr?=
 =?utf-8?B?Q2xtRXJ6ZXM1SFRDTHBWNUJIcUdhOUs5bVNKamhiZFdWQ2N4TWY3dW93cHVz?=
 =?utf-8?B?b3B2dnAxRUw5Y0ExZEtSK2hDaG9xV0FobWRsbDlRZGllY202b3VNVXVzeXVZ?=
 =?utf-8?B?ODdRQW5ubGNMMmoxdllybkRROGVlcUtyQkQ4alhxVEo4akpoTXFvMUVYckds?=
 =?utf-8?B?d055a2h1VCsybk5xMUhNL0N2K3BoSWkySFpKMjJoVkdwdktzSE83amorV0ls?=
 =?utf-8?B?RytKZnhtSFArSDVDbzFZTjZZcXBHN0lZeDhNQzFyNmI5UmRVSjRlL0pQSHgw?=
 =?utf-8?B?bDNMRFNucVdWVVdwVzdFTHdYS2RlU2l3aldWZ21Ea3Vqb0hLOWtHWDNtcWRL?=
 =?utf-8?B?ci9CWE1TTjVsZDdLV21ZQmg3bzJWNGZnTTRFdk54MHRmYWZwSW1KL1JNRTFE?=
 =?utf-8?B?b2svWFQvOUMzMFFDTStuQm1CM2RpemxlMk5CWlcxTDFOVFFIR2czNjNIOEs2?=
 =?utf-8?B?UWFsNnhpZXJsckdwWnBpYzNkeHF0K2UzYXVqL2pGZWJUVTE1ZTZmTUp1eXlX?=
 =?utf-8?B?dkttZ1BPK0YwQnIwK21qck13c25uenFLQXNYWUVjTmJsNzF2bHdoVzJSazR4?=
 =?utf-8?B?UGZTVFp5WEp2Z2NzdUhPZmVBbDcrYWcvbDNWbUNTVU5oanpmdm1SV3ZZL0Uv?=
 =?utf-8?B?ajdlMStDTUFMdytYNWlpWmZJY3hheHQ5Sk1CbDM1NTRoV240ajROUHhMSTFN?=
 =?utf-8?B?eXlNQUN6L3F6RGdVeUFpOGQ3S3Ird3Uwc0wrQzRlRXhsQ0FlTE9SWlYzM09R?=
 =?utf-8?B?dkFuN2EzdWtURFBKMG9EdDQ5UEFkNEVldGZwOFNFQ0MyNnBDUWlvdHBqN09j?=
 =?utf-8?B?MDJzMzJLTC8zbklmOCtodXVyeFVCc0g5YlVnWnpYMjFSOEt4eVlwMnNlWGhB?=
 =?utf-8?Q?kPqKndhmQXYGcfK8=3D?=
X-Exchange-RoutingPolicyChecked: BljD+sU3L0xWH4OxQGzHW8PahIMEXWNwNCvr/RI8SBIhkeLxPciKdw1Sz+HPDiyBZsJA9qLhF7r0Fq/HWjbfii2hD0Ch6UhwKbMxzfHkvEGbkl2aTs7KhBzm4NyM314wugb92Og5e41/s3wWXi/7uJfwg+84nHiy/nnmWrB/BOGUBiaHtMO7+fmFxebd2RiQJW5lCdVaj8Bb7FS9qUi3Tvuh4QMsfAadoKMllvRVnGyWRZ1Fei5Jwzez5CJT11V3dYw+2R+GB5XCVkxIw/pkLXK4PTnw470jqJ/Dj6q/tHM42InZl+kODxVsgNQ/KRYeNCpcBHGxYZ6B2oiMiaDIGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb78982-babb-4836-0d93-08de7e8e6966
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:18:45.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aasQMPkEHbSPyFjsRqMPLLF2uojylnypMITvg3e/nD6T3ZCs5ks+05hflHpyhL6XEi7w3blxgA/baYHGAjyMOPzLNknXQIYdl6YAX94BMfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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


On 13-02-2026 01:46 pm, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 87 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 79 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 183 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 59e083f90d7e..7fc67c320086 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -111,6 +111,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..413c6e62cd50
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED		= 0x00,
> +	XE_RAS_SEV_CORRECTABLE			= 0x01,
> +	XE_RAS_SEV_UNCORRECTABLE		= 0x02,
> +	XE_RAS_SEV_INFORMATIONAL		= 0x03,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED		= 0x00,
> +	XE_RAS_COMP_DEVICE_MEMORY		= 0x01,
> +	XE_RAS_COMP_CORE_COMPUTE		= 0x02,
> +	XE_RAS_COMP_RESERVED			= 0x03,
> +	XE_RAS_COMP_PCIE			= 0x04,
> +	XE_RAS_COMP_FABRIC			= 0x05,
> +	XE_RAS_COMP_SOC_INTERNAL		= 0x06,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
> +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
> +	struct xe_ras_error *errors = pending->counters;
> +	u32 cid, sev, comp, inst, cause;
> +	u8 tile;
> +
> +	xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> +
> +	for (cid = 0; cid < pending->ncounters; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
Unaligned access of member cause penalty, we need to check.
> +		xe_warn(xe, "[RAS]: Error:%s Tile:%u Component:%s Instance:%u Cause:%#x\n",
> +			sev_to_str(xe, sev), tile, comp_to_str(xe, comp), inst, cause);

Spam kernel Log, we can use rate limit right?

Thanks

-/Mallesh

> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..fdefe0e2fe98
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..0afcf8bf982d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			21
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error - Combines common and product-specific parts
> + */
> +struct xe_ras_error {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_event_threshold_crossed - Event data for counter threshold crossed event
> + */
> +struct xe_ras_event_threshold_crossed {
> +	/** @ncounters: Number of counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @ts_high: Higher 32 bits of event timestamp */
> +	u32 ts_high;
> +	/** @ts_low: Lower 32 bits of event timestamp */
> +	u32 ts_low;
> +	/** @reason: Threshold cross reason */
> +	u32 reason;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 7c3041f4196a..876754f9fe35 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -7,6 +7,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -37,7 +38,7 @@ static void xe_sysctrl_get_pending_event(struct xe_device *xe,
>   		}
>   
>   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +			xe_ras_event_log(xe, &response);
>   		} else {
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>   			return;
