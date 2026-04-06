Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDD9E9D83B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 05:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CD910E1FD;
	Mon,  6 Apr 2026 05:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwaoXsVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69AE10E1FD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 05:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775453310; x=1806989310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L14FWkP8AyB0rnEd1LHe2Q8L84wrmhA8HlsHqDGbVUA=;
 b=GwaoXsVyf9/wlm+tYxvJmrsq44mCKwpidaypRUyFdtI9xmECky5SOz7X
 aBJmONW/pLwWw2XeAZLxgvQKvVE4rif3G/n7R14NDU6sKJU1T8q3q4tGU
 2AEetuqId/10zlCbb4YIC3YzcrAAs4qSpcfwGDqQDmNc4UIVcH739KlUL
 UuIA/HafEcxwDejG/L0+Uw7XB/HFQwRKUNiy6+7dN/Z9GrBSxK+QHkyiD
 Hr6/iABJBeKmpy7KeQ7F2WckBQ9VhS3l6NjPjWCgbQP8PXv2jx+eR8XI+
 pMlBCg7Y2p5a/XFuSDUwmgNB4nMY7/I669IRYGgy0JBM1NmXW0I3ygQz7 A==;
X-CSE-ConnectionGUID: bSbDHS3sT0qY2WIEXgN+uw==
X-CSE-MsgGUID: zdik5h7QQ62KkElTHVSV0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="99029466"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="99029466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:28:29 -0700
X-CSE-ConnectionGUID: YK+ir3ztTX2Sp2L09PTE2Q==
X-CSE-MsgGUID: LewscJP2SLKRwJzkwaJFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="222986269"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:28:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:28:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 22:28:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPPv9JE3IJn915w052Eyp8HNiZXiN0Pkc4RFPCxDBpNH6tucudRKFroxoLhUhicQRtFFqO3gAUxS8FFXbAdfTlREA0nCbUdc4PzOXo9Tduu/UXxMrr1ix9lo2hx9wVq5XOeFbWcICa3afYoHgsJTZteq4OAOsjKssN21V2ct+TuKFjRs4Yy77VnbZxur9qgqhyMAtLE34C/qG27zkFnreq785uxYqUqJIzM2tdbKXHYrxT/TSjoCqGIr18O4AyrbKi+7xVMzq+aKZVYM1qkoVsaXbiLoFBUnRY0S1V2A16wDwSBApER0BFBVtl5HwHGPDc9F1BjoQ4YqguxqOYMtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv1/R2uaSDW2Fi0tU+AVRlc7fQWclYtA3r5tI9ERkWA=;
 b=KGxGV8HCnrpgCezgTj8irHkXkSasusO9Ua/x9pFI1hng0BVZ3uFWYqXdUKYWjhkCJ2J7H9vrqe1ZYuV76tnBZoJDUTQ7Z5MKEDThQHoPC/E0Pi3q98L0bUeEcaPUaEmDPeaSD7NAnTOgumGSrsbdmPRKoJFPXI/K1C6f1p9l0+hTjarMO8GEVHsxYaxE4AHK9Pg9ZY/h+/9FfnQAJ8J9VAa8pv3RIGkZkyZ4PfbGNDjL+83w2t384eqiPysP51fG9hfNMcYiMyyam/H71rjULQjrDeNPKWdznA2O4O5zVelxZtPRM2/q0AXaBX1/P5NJKeuq0mEGJyBXymil8dZQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by CY8PR11MB6913.namprd11.prod.outlook.com
 (2603:10b6:930:5b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 05:28:26 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a%5]) with mapi id 15.20.9587.017; Mon, 6 Apr 2026
 05:28:26 +0000
Message-ID: <ed56f36e-bccb-46ef-9ece-1f59309d8e14@intel.com>
Date: Mon, 6 Apr 2026 10:58:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/15] drm/xe: Stub out new access_counter layer
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-4-himal.prasad.ghimiray@intel.com>
 <ac7jni3tTviagHP0@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ac7jni3tTviagHP0@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::7) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1eed14-5d05-44ff-c075-08de939d53df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: D5w5hkQWQnCwGlE2oALAj5WSIysLPwUEcLCmr+9AqO5FJ5oLqn0HL2ZKEriaF+S+En7/OBUBHiTOVh/Z/cSbyO/S6ai9sDywFHUn8sQ2ZFIuvc+07aKVKykqDRS5D7p2xs+CQyVW5jiOeHKaFxKA7YyfEC2MALSz8g1Ufr/Ytg71pk+fIr+FzvITAv5jmdKmyyxRf/dNYKYxHAOH29mBBJbJZgvg/SCLat03+kt2s0NM3Pt/Kj0r+A7yOe936rc9V68D4/oGpooAnPGYt6ItOnLj39cc02rrBqVDNnqni7+A0IEcTpuvYrqrnpK9Bl83ej97/sdmKPpWzMpojVHtVLpf3wvxvbeMwrNsCEPw1UVzXFM9ZQ41WDEeMU1COlbnmxaeoMzfZznq4eI8HC/HRTu3KqK1h1gzSDsUyWMjnJr3iLDOAf2luT4AgQkK/DUIsc6xibitzBMmHY2NRjOIRfKgX3IaGcYF5QAUoZB3BdHNaSqGGZq+3iINBwZEXWBFHvpwjJU5cMSJnvY/xDlZhewReXRZ4wpX1Rz0z6yV8zpE9/262ttpUlk/T9jxrUdUiZPQVOHTk+6QK8iQG6esCj7usLUZgQiEw7i9mIlvCIoQqtbARUhVxTXLzm1WQL7eaHmZ8gKm2udUCQpLQRTuT7kHhZ8O/dKE0jKR7jcTwuElGmg3pKMHOGGdxi5M8sTz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdaZ0M0SVVHVTNSaU1YSysvcXVtVG5seW5FeTRqTXpkVlJDam5iNnZUVHdl?=
 =?utf-8?B?Mkw1OEhaY0VjVHZlTnYvREt0aHVBUUZTdHZUenM1ZDMvNmhhcE9IUmViaEY0?=
 =?utf-8?B?VjBPaUhtVTN1dUpxZDU4OVBadTZtRGc2NUNpeWtwUFJFVURyTmpkaDA1bnNQ?=
 =?utf-8?B?QjI4T3RFcHVGcHI0RUhaQjJNVWErUzlmcXUvNWx6UitaSGZKb2ZxdHhwRVFT?=
 =?utf-8?B?WnlSWXJTa0Z4N3phVy9acy9JMHk3NjJNR0VCSzFXaXN3T2YxbnRqVFZPSVZT?=
 =?utf-8?B?WFgvVTFrbVM3dzBlbTh3QW4ySldrQ3J4NktxS29GdkEvRXVydlVna2NnZXZa?=
 =?utf-8?B?NWIzaXFaL1NyNndtdlIwdDZMREh0MEswQThaTzZRRjV0TkdTVVVqbkFsTm5O?=
 =?utf-8?B?aGpGOG9ua1VQSzN2N1VIRy85SVZ5bEtFZng5elUxV0lJdWFLN0ZuYUtlNjky?=
 =?utf-8?B?NllzTkhHbUYrK2diYjBDR05LdWF2cUovY09tNi9tcnlQaldnZ0pCcjh6Z0dq?=
 =?utf-8?B?SGg3NkNJQlNuenJMRGJjU24ra2wyRm9Dc3dDRmsxY01qNHRIMjBJSUxKUGYz?=
 =?utf-8?B?KzJydCtGYmRIc3hXYkovQ3Q0a3MyU09HRm1aandJOTBGVTBPSmdQSWFlOHBI?=
 =?utf-8?B?Y1JzUUFGTFk4YkQrU3JlMUdiM1FSdUc4YXZNYmRMMnJmRWlNNU44ZjBvVEx0?=
 =?utf-8?B?dkdQYk4vK2Y2ZUEwTElCblU5b0NwU0NmU3A4SWJNZkJYQnl4Qnh6Y3Nwb21H?=
 =?utf-8?B?Z0NKSDhJNStydEEvRC96UjdwT1FyMitKbUhNUEx4TzRDTHVpKzQybWlLNEtB?=
 =?utf-8?B?T0tFV2NoQzdBd0tnS0dXbzl2bHhKeDhwVmNBTkNHaW12YzhEWk9WMG1zVWxr?=
 =?utf-8?B?aGNHY3FLdGJWNzE2TXJrRldmQ2hCRng1dXFDZlA1UHloaGR2VzAyMEQrRGRO?=
 =?utf-8?B?MVk2b0daaXAydjlWdnhlWnhlUlJSLzB4STQrdTJwWnJaU0lHSHZuaDI3QTBZ?=
 =?utf-8?B?RUhQd3ZkL2Nkd2l5UDdsR2NqdThFSzRobnk2WFQxdXBiK3lUaUZqQk1xN2k5?=
 =?utf-8?B?N3FhZndZelFtb2k3eGNGNlZZS1pOdytvREpYRXp0RnRMK3g0blM4dkR2dEtm?=
 =?utf-8?B?bzNkQnNCOThGeWp1eVVmazI5eFA5MVNKWHdSR0VlVkVjZzFkbEhrc0VlU2Yw?=
 =?utf-8?B?cmdIR21hTjlOOFpiZlo5OEp3L3pUZUJpYXVORXdTWE9VandUVGdMQVFvU0pD?=
 =?utf-8?B?dHBRQ2czZkNEWGttKytRN0Q1cFV5K3RiN2Z6aVI1eDBWUzd2bmZHcW5ZR1g0?=
 =?utf-8?B?VmU2clpzODhCYzVEMzNQbHlCRHplR0Q5bU9mMGRJMzBOMEwxR2VHMXNVVzNy?=
 =?utf-8?B?NXROMVV2ZVhJSkptYVM1L21QNWxqbFIwZXNyQ1ZnTmFsTWxySE1HYjh0cTJM?=
 =?utf-8?B?dXhMeCtROFFjSTFOeUJPOHFzaXVuZHcrUldHOHpxMVRXeUxYb2ZCTDdMOGUv?=
 =?utf-8?B?WUFqRHVseWlRenBpWjFiYWlHZXRobzlVL3pTK2xPb3pyNXV4dldvdWIvNmM1?=
 =?utf-8?B?VU1PYloxTmxDaTBucnluNXR0bU9FNTQ3TkRYZS9kcitXVG42ZWtXa1JrN0xq?=
 =?utf-8?B?VVNNM1lOYmJmeGdYK0k1M1l5TUtoQVZXN1FYcE5BNGdqOUYzYUdqYUVBMUhT?=
 =?utf-8?B?TVVSK2RMMkE0K3NsSW9rZWRjRDVUL1VtN2J4VmU2cEhtVGViQThDcHlmaXpU?=
 =?utf-8?B?U2VPTyswVG1GcUM5d2g0eG41Sk4waUp6NEZuODU4YWYvbnBvcjBld0w3SWlJ?=
 =?utf-8?B?QzM3T1RoZmhZaWxFT2JVRVZRMXFMMis5MDVoZEp6c1h5ZGVRNjBJTlNsREZB?=
 =?utf-8?B?MnhFSlVtZGdhSFNURUNSQkNqTVpKRnArUnJCMEYvc0dYSk5EY2hBVjlRQ0NY?=
 =?utf-8?B?bUFnR2Q2RkgyZ1JlV3I3aGYwa2RXMk8zL05xeU5ySm9reG0yL3hIYXdGTHhP?=
 =?utf-8?B?NjBDMXJ1NDhhelNaSHJGdmR1ejBVUUhJdWxMUy84MkRod3hzanUrODJOdjgy?=
 =?utf-8?B?V1hHcWl1bkRqTFZ1aTA4VkxIY1lubjVKakIvNWlacy9rUGNOZmdTeWtpbEtj?=
 =?utf-8?B?NzhqT0FxdURDMVEzT0ZHbzRRc2J2cnBxMGJYNUNuWWdNM1lwTjd6dEY0NUV6?=
 =?utf-8?B?aUFweVI2QUtTL2hDcVVQSTlpYU5YWmVMckVWSjNVM1JGSi9nb1RhTDkwV2Nq?=
 =?utf-8?B?bTRjNjFENi9LMlcwL2dzeGtJZG8rUjQramJxT0dPR3pDNXVmanRFM21DRE5p?=
 =?utf-8?B?SWN5QjJQR0RBVEJabnR4UjVJZTg0UnNrZDZpM3RIQkUzbXdVZEFRbUJ1eUhw?=
 =?utf-8?Q?cQJyQ7gUxFc32xj8=3D?=
X-Exchange-RoutingPolicyChecked: JYf70DFD4tEtBcoCa3F0xT6rtKtoTVNdT5M9Bld0KTXuoZqvoQwwI6uRNCSE9sW0XZgcX3URuzAtsLUZqdnDYJ/0R3fOZdCZswNcPG1/JukvnHVfV7U9fpIoBxWp6ImPfX4n+mLjs2ajEcr4FjKkrCFmDbi3bwhbzt7hv2RIO4iQ5FjdvLV8oSPF0EoCTlC7Ws0Tk80bVGOtVHXz4nU7Jpb6w+sFQ2QuxPM+G3vp4MYyUYMC6/wF1IPUDb99b4wHp0iQp5PJM0kdb5BBrEsZO7PES0qqqXjP3Unfr0OQp41TsQWHkCZBqyapuBMvAEKMzSl0BuwmFaLQbsfHtan1Og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1eed14-5d05-44ff-c075-08de939d53df
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:28:26.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDBkJp1CfYPRYc40irrEOM3A0bJRHqGOziQMefBeLNcywDsIdbiC+X53YW2ujDLF/XeVg6rlLEc1eoCBNSSzO51wNEClML4Obw5oVNAqsHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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



On 03-04-2026 03:16, Matthew Brost wrote:
> On Wed, Mar 18, 2026 at 01:14:44PM +0530, Himal Prasad Ghimiray wrote:
>> Add access counter infrastructure with type definitions, header files,
>> and stub implementation. This follows a two-layer producer-consumer
>> architecture similar to the pagefault layer.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                  |   3 +-
>>   drivers/gpu/drm/xe/xe_access_counter.c       |  55 +++++++++
>>   drivers/gpu/drm/xe/xe_access_counter.h       |  17 +++
>>   drivers/gpu/drm/xe/xe_access_counter_types.h | 123 +++++++++++++++++++
>>   4 files changed, 197 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 3a3f9f22d42a..92d8d6e4a447 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -32,7 +32,8 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
>>   
>>   # core driver code
>>   
>> -xe-y += xe_bb.o \
>> +xe-y += xe_access_counter.o \
>> +	xe_bb.o \
>>   	xe_bo.o \
>>   	xe_bo_evict.o \
>>   	xe_dep_scheduler.o \
>> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
>> new file mode 100644
>> index 000000000000..f3a8a93b5135
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/circ_buf.h>
>> +
>> +#include <drm/drm_exec.h>
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_access_counter.h"
>> +#include "xe_access_counter_types.h"
>> +#include "xe_device.h"
>> +
>> +/**
>> + * DOC: Xe access counters
>> + *
>> + * Xe access counters are handled in two layers with one-way communication.
>> + * The producer layer interacts with hardware or firmware to receive and parse
>> + * access counter notifications into struct xe_access_counter, then forwards them
>> + * to the consumer. The consumer layer services the notifications (e.g., memory
>> + * migration hints, binding decisions). No acknowledgment is sent back to the
>> + * producer. The consumer uses an access counter queue sized to absorb all potential
>> + * notifications and a multi-threaded worker to process them. Multiple producers
>> + * are supported, with a single shared consumer.
>> + *
>> + * xe_access_counter.c implements the consumer layer.
>> + */
>> +
>> +/**
>> + * xe_access_counter_init - Initialize access counter consumer layer
>> + * @xe: xe device
>> + *
>> + * Return: 0 on success, negative error code on error
>> + */
>> +int xe_access_counter_init(struct xe_device *xe)
>> +{
>> +	/* Stub implementation - to be filled in */
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_access_counter_handler - Handle an access counter notification
>> + * @xe: xe device
>> + * @ac: access counter notification
>> + *
>> + * Process an access counter notification from the producer layer.
>> + *
>> + * Return: 0 on success, negative error code on error
>> + */
>> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
>> +{
>> +	/* Stub implementation - to be filled in */
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_access_counter.h b/drivers/gpu/drm/xe/xe_access_counter.h
>> new file mode 100644
>> index 000000000000..b3a331687f13
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_access_counter.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ACCESS_COUNTER_H_
>> +#define _XE_ACCESS_COUNTER_H_
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +struct xe_access_counter;
>> +
>> +int xe_access_counter_init(struct xe_device *xe);
>> +
>> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
>> new file mode 100644
>> index 000000000000..74b903b9461b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
>> @@ -0,0 +1,123 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ACCESS_COUNTER_TYPES_H_
>> +#define _XE_ACCESS_COUNTER_TYPES_H_
>> +
>> +#include <linux/sizes.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_gt;
>> +struct xe_access_counter;
>> +
>> +/** enum xe_access_counter_type - Xe access counter type */
>> +enum xe_access_counter_type {
>> +	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
>> +	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
>> +	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
>> +	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
>> +};
> 
> What’s the difference between the types? Patch 8 handles both of them in
> exactly the same way, which may be correct or fine, but without kernel
> documentation explaining the distinction between the types here, it’s
> hard to reason about it.
> 

Will add kernel doc in next rev.

>> +
>> +/** enum xe_access_counter_granularity - Xe access counter granularity */
>> +enum xe_access_counter_granularity {
>> +	/** @XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
>> +	XE_ACCESS_COUNTER_GRANULARITY_128K	= 0,
>> +	/** @XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
>> +	XE_ACCESS_COUNTER_GRANULARITY_2M	= 1,
>> +	/** @XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
>> +	XE_ACCESS_COUNTER_GRANULARITY_16M	= 2,
>> +	/** @XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
>> +	XE_ACCESS_COUNTER_GRANULARITY_64M	= 3,
>> +};
>> +
>> +static inline int xe_access_counter_granularity_in_byte(int val)
>> +{
>> +	switch (val) {
>> +	case XE_ACCESS_COUNTER_GRANULARITY_128K:
>> +		return SZ_128K;
>> +	case XE_ACCESS_COUNTER_GRANULARITY_2M:
>> +		return SZ_2M;
>> +	case XE_ACCESS_COUNTER_GRANULARITY_16M:
>> +		return SZ_16M;
>> +	case XE_ACCESS_COUNTER_GRANULARITY_64M:
>> +		return SZ_64M;
>> +	default:
>> +		return 0;
>> +	}
>> +}
> 
> As discussed in [1], I think the granularity handling can be moved into
> the GuC layer, so there’s no need to include public definitions here.
> 
> [1] https://patchwork.freedesktop.org/patch/712600/?series=163429&rev=1#comment_1318525

Makes sense, will move it to guc_layer, probably xe_access_counter_type 
can also be moved to guc layer.

> 
>> +
>> +/**
>> + * struct xe_access_counter - Xe access counter
>> + *
>> + * Generic access counter structure for communication between producer and consumer.
>> + * Carefully sized to be 64 bytes. Upon a device access counter notification, the
>> + * producer populates this structure, and the consumer copies it into the access
>> + * counter queue for deferred handling.
>> + */
>> +struct xe_access_counter {
>> +	/**
>> +	 * @gt: GT of access counter
>> +	 */
>> +	struct xe_gt *gt;
>> +	/**
>> +	 * @consumer: State for the software handling the access counter.
>> +	 * Populated by the producer and may be modified by the consumer to
>> +	 * communicate information back to the producer upon acknowledgment.
>> +	 */
>> +	struct {
>> +		/** @consumer.va_range_base: base virtual address of range */
>> +		u64 va_range_base;
>> +		/** @consumer.sub_granularity: sub-granularity */
>> +		u32 sub_granularity;
>> +		/**
>> +		 * @consumer.counter_type: counter type, u8 rather than enum to
>> +		 * keep size compact
>> +		 */
>> +		u8 counter_type;
>> +		/**
>> +		 * @consumer.granularity: access granularity, u8 rather than enum
>> +		 * to keep size compact
>> +		 */
>> +		u8 granularity;
>> +		/** @consumer.reserved: reserved bits for alignment */
>> +		u8 reserved[2];
>> +		/** @consumer: Platform-specific fields */
>> +		union {
>> +			/** @consumer.xe3: Xe3-specific fields */
>> +			struct {
>> +				/** @consumer.xe3.asid: address space ID */
>> +				u32 asid;
>> +				/** @consumer.xe3.engine_class: engine class */
>> +				u8 engine_class;
>> +				/** @consumer.xe3.engine_instance: engine instance */
>> +				u8 engine_instance;
>> +				/** @consumer.xe3.vfid: VFID */
>> +				u8 vfid;
>> +				/** @consumer.xe3.reserved: reserved bits */
>> +				u8 reserved;
>> +			} xe3;
>> +		};
> 
> Can we drop the xe3 prefix here to keep this interface generic across
> platforms?
Yes we can drop xe3 prefix, but we need differentiatior since interface 
will be HW dependent.

> 
> Also, a question: xe3 implies these are only valid on xe3+, so do access
> counters not work on prior platforms?


  For example, without a valid ASID,
> the common layer can’t find a VMA.
  Will explore this.
> 
>> +	} consumer;
>> +	/**
>> +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
>> +	 * by the producer and should not be modified—or even inspected—by the
>> +	 * consumer, except for calling operations.
>> +	 */
>> +	struct {
>> +		/** @producer.private: private pointer */
>> +		void *private;
>> +#define XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW	4
>> +		/**
>> +		 * @producer.msg: access counter message, used by producer in
>> +		 * acknowledgment to formulate response to HW/FW interface.
>> +		 * Included in the access counter message because the producer
>> +		 * typically receives the notification in a context where memory
>> +		 * cannot be allocated (e.g., atomic context or the reclaim path).
>> +		 */
>> +		u32 msg[XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW];
>> +	} producer;
> 
> As discussed in [1], unless we have plans to ACK access counters in the
> near future, I would just drop this.

The ACK is not available rightnow, I left it for future usecases, will 
remove it.

> 
> Matt
> 
>> +};
>> +
>> +#endif
>> -- 
>> 2.34.1
>>

