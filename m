Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B47606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWEIyOHi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j86jTZuw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AC10E337;
	Tue, 24 Nov 2026 06:22:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323B910E4BC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795501313; x=1827037313;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eWT7sDxd06QHa9kidUvUg9qhR4+HoX2oBkd1NA7PL+E=;
 b=LWEIyOHiX1CzttfG26koNPPT+i9/w6/a5oU+urg6zGWSRma9aa89AaCZ
 vRA3z2P9ohI0Wt2bbrz1CdA7Nb+w4ZMBAVZOsK30LMKPfT2k98CvmXqFX
 4BhEjyDZWyHMmSGSFpThOrCClOx1M6E4tFw4WNjqKxrU5rGCoQRO0Z0S3
 HwY8ViLmYtmtDpUOdCIKozBGeuBCBz8KL7OQ0hKfosAk+B9ji5aud0Lov
 MunxaInfy8+cHwVsffAxQCWisqpesDnJuG7wxMfAxhEc5Jt9gYLYAt+HV
 unhCIB3fLp8O1U5wNTu7D20KlKjjD15ZcuCSdtAJvwFhhqDNBGUOrcqEq g==;
X-CSE-ConnectionGUID: +NuCnaSWQUu20Cu3d2YjKA==
X-CSE-MsgGUID: 48acHMbNR/2H+cNT4oNJ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4321965"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4321965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:08:02 -0800
X-CSE-ConnectionGUID: GI/wDJtWTaGh5Bxe0gjEQQ==
X-CSE-MsgGUID: HGELJrbLSXaorRWYZxYJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11599491"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:08:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:08:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 22:08:01 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:08:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSd1zXH77E8oBnpar6hFlWyzNf5r98ZIn8R1vSmytsNBAUhhl0n/GnzEjmQpB+NOeH49KN5QoMRCbXzeu1NEcKib6ir3xmXqQiizj3VclU+DkPTwybzxgC+Q+RnE9YzYwHETM4g6gDvsVUZVrCA7EH7RPNp9S08Q6vIj1QfN7uWYRL39Do1GXYXHSP7Vh2L7ENrjFatxdBQyvEjmqPEfFAEhoBbBhWNaIc7cUqmw3Ba1tKzOMDEJTzC+ZSH99wu8t0AHvLSLOpLrVJpg962v+ImAZNmGX3y7X1PK6jTWNYw4p7xgdEJsOhndqc7BlA3DBfhJusvNMKboQh4ekTi+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIVFftsG6OzQoUmFWdkm7woZ4OEZbef9qTZ/6MaFO04=;
 b=ATVBGRrJIS5fiV96dNVL4rwrQ/lm1zct//gVSxN02Y3m7exizYb/LXIFjYMHbHyBrtvXoAozmr77eYbl2P7T7ehi5eA9PKV998rfUGk216o7a+PTs7RQD52ctRxLXxKy37JXVEokuOzfiCj4XsNokiPBYZQz/YjYjl8FvDyB9WeuFeZdpFsIOYuSYYHjt1exRyuqC78Kt/e7QkA1UMOeOXiWS7xlQ0bLok7XSh4TlXpXy6yK/0qp8abuotbYka/teuIpbGzb3vhIgpHSwnNuXcpsrPNJpznxgYsuuz00bC2leR+qxX7SKWlHyi6z723FPuoh5IillQw/ziE9esLuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIVFftsG6OzQoUmFWdkm7woZ4OEZbef9qTZ/6MaFO04=;
 b=j86jTZuwC44FGfGoPEGDnoogvkngvtW9DyNH+70Pvn/89rXmjvq+bT7NFcTgGsettxzGmjb0LwJtdNC5diPZAFAupLRHE/2jCMoT4CDxvFjXddruVPmi9gwlID0GBjjZ+aUnsHFTG1zACnLwRTzpF17LWqxihl58PghTVePRMBs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 06:07:52 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:07:52 +0000
Message-ID: <794daf46-6fa4-47a4-85a1-a369c5cb4666@intel.com>
Date: Tue, 24 Nov 2026 11:37:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/xe_ras: Skip gpu_health sysfs commands when
 wedged
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <soham.purkait@intel.com>, <riana.tauro@intel.com>,
 <raag.jadav@intel.com>, <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
 <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0097.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 3550800a-2a88-42f0-7f7d-08df49f145d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|20046099003|261009223027099003|11063799006|4143699003|56012099006|10067099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: PhSYM53KFSkJ3mzrUvjGQq4CvKRHDQDDinkyKprICKZENUSLSxYhiFJzi+nSGtBxgBatlYKC17TC9GYGNWq4hkKGy7q71kPqLPkxEk30/7nRtZvaowecJ5DHZsDeh9HYMv/YCI00tuLy3+zIbYfawTO7HcNXz7QKSfjCjFc8YInsddsQWjRjhXBmqKwISGYEMFLuow5NPD0Smpl/uk1zs1LsxF1dFBJHp+SieUiWMetZKVfRJNfvi9hie0E6Yf02J4OhJi3Nwi/R03UAxBbT70W4Gtx05W2oVEfatHMIe7x931Z6Lj0BYo8ITIkFjpRDcLGVIcCrRCmvEYw1ZWwa+riReFV3WH//tBahLDhkxQ/ckkM6Deg7Gv+Jv/PxK+SmfnnkjkRSqfs3RJet5Q2mwilbsvEE9K7PY2jUbAluPQttJgger4U6JalWWQhBNXwKDRCCRlRo/XyDLYj0VaVLMzonqVF9+1FrOqUnQdwW7Rkh3aarhmdBx6IC0zFwWkA/SCHooUoFjmrLnSGH+ZAgMjRT9hvEqpgPyr/m8vkKGcFDbr9w/BNu8noqfRSJxXor/m5HAH5pBNb+Kh9C0BdIiP89OQ4GCteEGTtc/zp+JnwDst+nvc+m//hsB5Y9fAa8PM1YZvnUCfi7YHEGy7w4lzq3itDJn65YIPtl8kpdm1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(20046099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(10067099003)(261102123227099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWhMVGFBbFUyd29iTVVqMGZTOVdnZml3M2dLYW5wZzZ1V2Z3S1ByR0xuM2g5?=
 =?utf-8?B?T0NjbmxhTFRLNVlXWURUSGRib0hWekFqTmUyZFkzMnBvZnJsMi9SM0Q1UlVC?=
 =?utf-8?B?OFNOTzZ4Qm5HMm16aG5oOGl1dGkrWVh4NVlaemJQTHM4QnJCWkFnTi9INlAr?=
 =?utf-8?B?eHBnOVNYQXU0aUthcjJWNElEVjg3RWdkOGk2MXlpdFJNRmhjQzI0enFZVC9v?=
 =?utf-8?B?Z24zdzR3cWF1Z2Q3YVlpMUFmeGF6Slc0cXdzY2RXeGp2K2RLVGhoaDI1Y3lH?=
 =?utf-8?B?eVdXMEpKKzZ6eEVRNmZGTEN0R21OSlVqTFZEVmZZYUhPY1lKcEVUYmJCT2dG?=
 =?utf-8?B?TS92d2FMN29PUFZudGhlTnR6TVRYeUl4QzFsTFhOSlJDczJNVEtzZEp6aTdr?=
 =?utf-8?B?RzFRYTJFNzlTRXhZaG9iMXk2UFEyM3BhQVMweG9Qak9RTksxSzIranRYWUND?=
 =?utf-8?B?QkhjaXdsWWdkSTBSMDRNaUdJNDVKeTExTHh4NWthOGI3bmxrNUsydGo0bmlR?=
 =?utf-8?B?Z3p1b2NTTkxZdnFiLzhGbTQ0OHF2Z2Z5Ti9abnZWRFJZcXdpMVVCTVB1YUVC?=
 =?utf-8?B?WStMWEN1UGtCckNRY3E4cTlJSkxzVUdRNDNwMDBzaE9iTm5CM2lBWnRPKzVl?=
 =?utf-8?B?TWpvWCtyb29idERLRTBFalJPUVhHU0lDeFFEaGRVN3hmQ1lyd1FSV1pPWmFz?=
 =?utf-8?B?TE41QmRKS0Jzb3k5VlNzV3pCT3NhNXNvRjREVGRRV1RRU0pmZ29oWU5RQkVY?=
 =?utf-8?B?NGVyMml6Sms2bGxMbDJVZVc3YkVNMTg0U0RtZldTWXRqQzAyNDdpSlNpTW1m?=
 =?utf-8?B?T3E0bFFUVTFFZWxjTGo3VnNNLzYzU0xmSEJSWDdtR0ZtaE96U0VSZkMyOUlY?=
 =?utf-8?B?ZGRtRTMzT3c3KytaNHRWUzRaRDVKNzgzUlJ0czBZVzhweVpXQWVCR1ZPUnZa?=
 =?utf-8?B?aGx3Mjh3R3ZXOFg3d3Q3OTlraUJqNXVuZ0JrSXdkR2JkMGRoU3ZpcHhtS0tj?=
 =?utf-8?B?WU9odkM1NHdOWWdzRXRGOGdrTVZ4K21HSVQrRGdJcmJTU1czZWFxOXlzbFRu?=
 =?utf-8?B?cVRtOS9uT2F2MnNZRlg2OVNrQkRvVXd0YkhuQi92MnZtc0Q3SXpKMVp2Y1hl?=
 =?utf-8?B?L0ZlaURlckpIVWk4VUZxcW5LZ1ZINFpVQURXSTdJckRHSEsxaHhQMVp0WjBH?=
 =?utf-8?B?LzVwYm10bFhtTitiNEgramNxQWhoVE8wYm03cklMWkUzMWVpa3liTzh1c1Jw?=
 =?utf-8?B?NXVIbm8yUHdNM0RVWEo4RVc4YWF6alVXNzNxWUl3ZVRiaFd2amRPbjYzcHBn?=
 =?utf-8?B?Z2U3TkV6Qk1qUTR0dEJxQXdxT3p4OFlhMnM0MTdPWVN6UUdVK2JiMGVNMTA2?=
 =?utf-8?B?RjFFNFFJaEpreWdmVnByUnZtZEs4REo1aVF2cmdzOVl4VWJaYmQ3ZnVrRlhR?=
 =?utf-8?B?OUpuaTFPbDZ6Q1JHRWUwT3l4U1ZVYlNUcjJ5QzRTQ0VsdDcrRlRWSi9rN3V4?=
 =?utf-8?B?bEVBSFRXaFJIcTNabWhGdW9uVUtna2g1VFd3cm1Xa1g4S3A4SFVoNk5kL054?=
 =?utf-8?B?Y1g4Q2VDNmhpSGlWYXdYdjFlWG16YjdrVDR3dWIwVFUyYWtpQ3ZrU2ZRTmlE?=
 =?utf-8?B?eFJyMkRsd0tJZFFnYUNRTG1sS1hiVjVyeTZaZWxzR1ROYlhuRmhNYW5DN2xs?=
 =?utf-8?B?UldNNlJNalFuTUh6SFJMeGVkd0lxTFVKYjZSdi95UnRXR3d2eGhMUTdJTmpQ?=
 =?utf-8?B?dFFpNTdya1h2R2I5clRFSnhjZC9lalQwSFFVUVNQRUVNR3Z3MHlWNWJCcGV2?=
 =?utf-8?B?bm13T3h1V2hZR1BhTFhmQkJvbFpmc0hmOVBmaDU4RzhRVlVXTmEwT2NVOHpM?=
 =?utf-8?B?RmRnRVAwbS9zSndLSWIwdktZbE80anJGZnd5MEplb1NpcFhLZGdHT2dKYkZ5?=
 =?utf-8?B?YVZxWDJXYnhQN2xFR1hYU05XVWhVaHl2VEhHK3kzZmo3azdvSUNEeVRRZUgy?=
 =?utf-8?B?SW5NZVJ4R1hOcVg3Q2xkWUZLalVqSFpVR01JWEk2WTRVandrNU96RGRrZ2NY?=
 =?utf-8?B?bzJVaml4UEYrSEcreVlzQXdjRHBQRXR3YU02eHVLZXdHR3RmUkxWeW1RVXFp?=
 =?utf-8?B?TDFDUWxNbnFQTitzVER2WS9JMnBJV0lwTVZFRDBPeHpOWUZpTXEzbUVXMnp5?=
 =?utf-8?B?UmtDUWdYM2MzWEJ6SHRUZDB3ZlRoSndRL3JEQnBaK1J4N3F1TVB2d3pYZzdv?=
 =?utf-8?B?eGw3TTBsN1BNdXdLNmU1Y25JbThxSGpwVWxGV1VCMUgrb0h5RUpqcnFOcUxx?=
 =?utf-8?B?YzZlYXNLT2o1ajlxdGFaUXhLS1VFTmkzNWs1SWFqZ0tsakdaeGtyTytrZFJ6?=
 =?utf-8?Q?dvZ4+XBkWGq6sRuQ=3D?=
X-Exchange-RoutingPolicyChecked: KL8KEFoCzQ/9ceHi8V4dEDp2ki5N5Ww9vh3i5sRxVXjQ/CZGPPPEnc9lDUKRvLmQibZxnF3N/ZDUF9tqEhe7kGrZQIaS4aOxKwFeYI6uF09TsyDYY/s3NKzRb/zX1i2VCgdY1HAArdxMYQwHX8YvIvsONbY5u0YG5O2otjs4aFtUrS7GGwHd1DAlbX5spJttuqccPNJlUBTWnWihoYQCqfyR2u0rVncBZZaPQt40P1iRHF/0u2gxJpyjPWkJq2k1oXj0XWX5aqxgPPACjC+0PStX8EPAdAYSEaGd7ZhOi5Fa7FFKE0+GqSM5nZlkpo+yfk8A0IXtsGSTt6LqBFfmvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3550800a-2a88-42f0-7f7d-08df49f145d1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:07:52.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrFR/Vwzh27yfzLGxCq6UkMZrmzIQCtTrbe74YflRxrTC3xQ+GV3SQ1ycx4oXnQ2CGlA3zkmGFerXFBz9pkAHrY2xlIf/7Sr482vJnG20II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 24-11-2026 11:34 am, Ravi Kishore Koppuravuri wrote:
> Accessing the gpu_health sysfs attribute sends a command to the system
> controller. Add a guard to skip the command when the device is wedged
> and not in XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 9b04be3405ca..0c3238cbe446 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1298,6 +1298,9 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>   	size_t rlen;
>   	int ret;
>   
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
>   				  &request, sizeof(request), &response, sizeof(response));
>   	guard(xe_pm_runtime)(xe);
> @@ -1341,6 +1344,9 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>   	if (state < 0)
>   		return -EINVAL;
>   
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>   	request.health = state;
>   
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
