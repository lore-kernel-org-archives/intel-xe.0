Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5894AC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB4910E070;
	Tue,  8 Sep 2026 06:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDUU/Fm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115110E070;
 Tue,  8 Sep 2026 06:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848763; x=1820384763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uyVyExas8e9hPH6IxulxzyatOWqaYjxVep/shR6OkWg=;
 b=QDUU/Fm9P4uwjbhq23YqJXRDFWxOrfdygYeT34hQFu8tBEQu4y8aydcj
 9gt85ufM7V845Zcp9rkiModjyVBCsaNYJZc6Pg/n+UlN8EmEA8kz68PJo
 6O6zzTU1ga3VaaV1Nzgdlnr1XYZ4mmQoOXSUZS1ZsW+rjgHbUzPB8CEVz
 M3vYmL1K0Q0SIMbOhFPWXOTPM7/ILYDpTvHNQ8CAGVEswUwypvPL4FwZp
 tBuoShj0gy2xdF4DdITrnYxOXu/CrpQaM+wRmVRc3WwcsZtHEvauVM0xQ
 jb08i7jVo/JH9z7vgT3REYULvdujm0nNFjLv0jnazJLYgacksvw+fZBE9 Q==;
X-CSE-ConnectionGUID: f/A3QsyTSwazCnZKjiLkXw==
X-CSE-MsgGUID: 7zyqLbTGQOenbb/2G02lgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89446445"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89446445"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:26:02 -0700
X-CSE-ConnectionGUID: Gz2oUpkFQ7aG9kCJ8ZdGDA==
X-CSE-MsgGUID: Pfm5H+Z0TLKSzJ0ETDPCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="270859712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:26:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:26:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:26:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvVJNAzUdvmLcyX1OY4a/1WX74w+t9HHKOrg47DSmQcpIlXJzJDtz+jPjN/PvZQDvlo3pdlxGjglEhbCbobsxQrIMxTvwRrkHL2ZO1abUXFlZgVstC6o5slv462neCdFtP4X9RfZ4bKNNvK5E/YIWyhQYCDlvmV4C1p+H6byeCRJ/q3G09OZKiggxgsDgcNV6hWgPwosZNmXRjIRlVE0Q6tXrxf7JKyY7c+ds2u/kkfxF49NszH3Nz+HzZ5DjSiASxDX5LfFmaZ1i6t93eKdCcJ6e9ta8BQxsf7jvNvSnwiS5tH30RObyF6wkB/uKQmoJTgTomm1p9EvpmKTo6RidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4jR1hdH0Fn/KmopEbr+kElIijwt6GdCvU4V5VZFQHg=;
 b=n6z3piRHvk/67YrrnZ0yPby3mTuu3q9tDnFA+fClL1Ed8tnAi1a0X7LgRiwtnJcf0yzA92FZwUR1z0O6Q6mUT7TL+xQT09LSdjS72py4IQ79n3A7CJJZyBOdd5Y3tzR75cXYFlBaPjpJTHKetkoiiRrlHtx4e3dggFqrh3fU6h6kNL8iL4UQsu238WHReZOfK248kMxuHgjbgQtIT4+L4oM46SJ59SNXLg/o3IpsB82RpMXgT0r2xEOxHVjQG1B4u/HOEutzC59RnCDBpYHC+TCu5yDTqjxQg0fSb2WuBZYBQYFioe/mI9YMelJfGJbpeaiFAB/aNbttdJbzzrb0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 06:25:58 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:25:58 +0000
Message-ID: <d3515e34-839d-4f9d-96df-40018afdc09d@intel.com>
Date: Tue, 8 Sep 2026 11:55:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
 crtc_state
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-10-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304FF139C3FC58351950B2DBE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304FF139C3FC58351950B2DBE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: f5496f69-2e65-478c-c310-08df0d720b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mVS4rFdfq438HHVzrNgikD23b9nPL3AIFzqgiA0BC9YvPF4VVSaxEBbYBxMJu3mb6JqDwIPpRN7Q/gR6CJiaIVvCiuhpeGBjJeFk8hBrWxSproWdONuOG+ftnuYBcOncoTRIV1/whHLRQDdU/0BjlbpqCMOaK9uETZNyFeJpB+YKrLmZQQ0WidhhYL/6U8pUyZeRPSJgi/ziABSEWhxCRZUy46YpaSfomO3QTLkYvERybACvpovPlswSIDFFUKrtFzXh/jWUG400FozQCHhCM5z7kWVNmdPIzeUh+FyzD5ASl0n9IrkIPoQltrKEh3dGbA+/jFb6M+Is8pSagi6zV9P+Ap/kF1iNeQbDKoQrnddJ/MImhoVrcmFUcr78Ptk5TVWRqrdM8i7CcxaUAyLJqgrEZCqFyJdZV2t7ojxUovO/oQ1jUp3QjHuJ44yE/Vu/LgAKUMdjaQH+DtkvdeB7mG+tzyfWSd9PRA65z4iHd7r9Emv958+YXbzgUSKVkm0x9Z6oBz7YcwAwSndMfWAhuqt8gFX/gw+BUzlgr2mYSxPraGZY2Qwqlo8AMv/jT02Iy94U0vHb5NaEMuE2d80/GfkHn+ZguseJaIsJGbzVBBrV9NM6VBedGHJ55Lh20siyLkTfWWhb4NlUa1y2C/Z2RdY3Q0/3ZVJKecHhD+l8DaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhRNjRjZjNuQTk2WktaUHNIL1owNThZUnczejJEcmd6cHZ3UjRKbGhQTkM2?=
 =?utf-8?B?WlF2OUVaNFJQeVB2TmxVcGdCT0lGOGtYQytOa3FiYUxEdko2OExxK2FhSFdo?=
 =?utf-8?B?UDROMXpXeDhKa0JVeDJ4WjRCUDNYcHA3Vlk4dGlXOXQyYllOTysrbUJIK25t?=
 =?utf-8?B?dm5CTTBLS0FTejA1Q0dDL1lBNC9XUjBGaUVSWUhwb1RZL0taSDhkOFZtN29E?=
 =?utf-8?B?WmhRN3VUd0libEd1ekx1UFFUMmxTclRpUUs5MXRMaDBHZk5HRVR2SUZYcSto?=
 =?utf-8?B?MjFvSU5Yc25lOHFSKzBjL01DeGtvTU5GSFQvL2FaeDkzOEllbXB2SUp3UEdk?=
 =?utf-8?B?MFR4RkNLM1dvdWRVSTlZM2xUVXVWQkJkbmdkNFRyNm1ZVkJVN1lYczhvcUo5?=
 =?utf-8?B?OFBlNTJ3akJNeWpiRjhidjB4TTkyVjZMK2svNUhyeit3V2g1MnpRS1gvckVt?=
 =?utf-8?B?VE8wMDQxL2JTNURIaWJGRTNidHgrZ084bE5sTzhuWHZVODVwK1NXWWJZNDNs?=
 =?utf-8?B?bVBRUldJYzhxdEVMTlVDdHVjQkdVN044UW1QVFBpNWNWNXZpWVhzUDkyOStz?=
 =?utf-8?B?Sk5rMHVlSTBtVWtTTmM2UnFzMEJzcGx0UEJNM2ExUDZOcTZ6anFmNUUxOG9X?=
 =?utf-8?B?akhCRldjMVBnbit2S3pQbVZISEl6UFhwYmt3SndDaGdVL1lncS9VdmhrRkVZ?=
 =?utf-8?B?N3VpMExRMVUxU1p2bFJ3WWJIYnBLUG9xbEFySFA2YUJ2VVlHU0ZCelgxa01n?=
 =?utf-8?B?RjZLaGd4QlNBb0UzUXNCU2t1VnlRRUpiTTN3QW9ZZ1Jhb0xrRFJKZUR1bWta?=
 =?utf-8?B?OFVPUFBxekVmckNOdXhxUTNxQVdGNjhiNTNkemNXK2V5TmxVUC9JTjhQK1NY?=
 =?utf-8?B?Szc0YmdZZzNhZENzMFF3WXVaZnk5M0UxV25uK3Q4VVZIdmhvSUFNMFNETE9Q?=
 =?utf-8?B?ZnF1d0NDc1dOSFNoajByN040eXYvMVBLcU5LdHMzcFByeDlBQzRPbVd0akVq?=
 =?utf-8?B?Q1RXRkJzZE1GM3FxNHpmbG5Ud0g5bjB5SVJ0Ly9NVmNVNU5UeWJLU3pZVU9G?=
 =?utf-8?B?aFBEdGFTeUZpNDFsQktDTDh2OVVFcnVESXJYUkFNUy9Bbkt6UCszUHRPbXVG?=
 =?utf-8?B?M2o1NFF3Qk5TYVVOcmtFYUJBUzFHVDd4alJsZWtQZjNtZmI0V1crZlJpbXYw?=
 =?utf-8?B?NmtySm5BZDVkdWdHS1B0b0FERGlBSEVWNG1jdTBwRWE1VmM3dFhBY090U2xs?=
 =?utf-8?B?bjBHNE5tU0tnVTJiZkFKdkRLNnRmaEtTQk9OT0d3ZlJpZzc3R05xdVFSdWN4?=
 =?utf-8?B?SUpWUWJMR0FPWTJMTFRLdjh5WmhINk44TFNxTFRnUWdLbGw1T3liRHd1Uy9I?=
 =?utf-8?B?L2NKbFZGcCtmQ3FOTlFwVGpHTlBNSHoxYTlKTlk0SGlITENueFY2MzF3Rmx1?=
 =?utf-8?B?dEs2TEdsOUZSMm9MVjR4dTYxUzd5OW93cWJKamVHWk9QZzJhRnJ2NGwwNUVt?=
 =?utf-8?B?OGFDeUJZYWVNQy9IVFdCSkVENlRjUUxtR2E0MWN6dzc0dEFvUDQyWjJRcnhz?=
 =?utf-8?B?bTZJK0lpT3N3UnFzMVkvaU05dmFCU0ZuR0QrWE00K3dveFdqUkRrdTVabytP?=
 =?utf-8?B?ak1ielU1ekRkaE0xWmhFUHBuMjI4UElFU0lNbjVUai9IbTFNeTBUSExFdy9l?=
 =?utf-8?B?VUJEZGsvcG42M1ZnRUpzRXQwdVBUOE5TU1NlNDhOLy9XZEMybnViUUF6MWxE?=
 =?utf-8?B?ZWRNUWdhdlo1UEN6ZnExb09tcm04Q01qZzY2T2tBbU14cWlCTnJQUitQSWtr?=
 =?utf-8?B?dkVOZVJzYlZzNmJPdVRBN0Fmam5Qd3c4VFl2VFIzNDNJT0ljOVkwL3hVdjBZ?=
 =?utf-8?B?SktZVCt3Q1BkVEhXY1VzcVdJemRuT2JObVA3WnAveWVjMjVSaGRzMDhkbDRB?=
 =?utf-8?B?V1A5WHVmUFozQWJ2TlY5OGhDNmhMSmEvVWlta29SaUZDWm9uWjY5NkNWRzhG?=
 =?utf-8?B?RXJ5RTVhSjI0YkFSWStXRGVnakxLaCt4eVUya0txRTNnbzVwNlROamIxeWh0?=
 =?utf-8?B?dnpHTURQZC9HN01MdUpnUzg2UUV5SnZYOXFUV3VMMkkyamNKenNrVWtUa0I3?=
 =?utf-8?B?VndDWmwrT1BjZkIzS3k5aDZCVjkxMEhmNVFPM1A1MllMWVdCNmlqcTBNN1dB?=
 =?utf-8?B?Qmlhcjc2cWtRanVMNjlVclh5Mkt6VnF2aU82UE5HRGdJeEh0RU4wbXd2eThP?=
 =?utf-8?B?akZTMHRvcHl2UFp5VnJLRXZuUHIzQjRSSWtoelpkaW43NU5uMnpjSTRhYXVQ?=
 =?utf-8?B?R09IK016ZklieUwxWlErZk16SW0wd2VLcHBBRWNOSUErVEFUQmRrU294RHp2?=
 =?utf-8?Q?IyJel71qymmlfBkA=3D?=
X-Exchange-RoutingPolicyChecked: s99NWdEvaK7uTwtvh8yEJGaUk/BfGFruU7+bmumFZewojvd1tMLWiEkXQ70V9NQdZbw2Ws5GYUvoYOvyrzhsI1+f+AMKxrkN6gUAODYPNdzgndAtBG6ybeomLcr9jf3YjRDhTd+pznDgkeHQSKpje0vEfY7cRakJQ96YMM2E1kMFyshRNp9cLhx1PVfwbfhA8rd6j9tBIHkBURelxzSU20WGjUYVt34oDl+cR6UnC6GdDdCj6gJEmgMHiJNIbbMGIzx2Oo4oSe0uQPN8U1167/RNI6pXkl81Kwi0Xi64qtGom1MGoj8LJhK3Cuxt0ify7d1ETgeUveiK74M05x+WVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5496f69-2e65-478c-c310-08df0d720b7f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:25:58.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3tJTwPvTNnI8JcchVCisf8LWPx43fWSZvfT81hiHTjvuJrsEv+PLwY58W+CwcAIzizBhVyoonE1J09y3oG2FUp98InkILrTT8pJkUk+FVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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


On 9/1/2026 9:00 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH v4 09/12] drm/i915/dp: Store SDP transmission lines in
>> crtc_state
> This needs to be either drm/i915/dip or drm/i915/display
>
>> Currently the driver only programs the transmission line for the Adaptive-Sync
>> SDP, while the hardware controls the transmission lines for other SDPs.
>>
>> Starting with Xe3p_lpd, the hardware allows the driver to program transmission
>> lines for additional DP SDPs. Prepare for this by adding fields to struct
>> intel_crtc_state to store SDP transmission lines, and include them in pipe config
>> comparison.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dip.h     | 6 ++++++
>>   drivers/gpu/drm/i915/display/intel_display.c | 5 +++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
>> b/drivers/gpu/drm/i915/display/intel_dip.h
>> index e9959356226e..03ef749a79ca 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
>> @@ -51,6 +51,12 @@ struct intel_dip {
>>   	 * The programmed transmit line is (Vtotal - value)
>>   	 */
>>   	u16 emp_as_sdp_tl;
>> +	u16 gmp_sdp_tl;
>> +	u16 pps_sdp_tl;
>> +	u16 vsc_sdp_tl;
>> +	u16 vsc_ext_sdp_tl;
>> +	/* Common SDP Base transmission line (Xe3p_lpd+) */
>> +	u16 cmn_sdp_tl;
>>   };
>>
>>   void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index c84ee0e865ee..8807897538a4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -5508,6 +5508,11 @@ intel_pipe_config_compare(const struct
>> intel_crtc_state *current_config,
>>   	PIPE_CONF_CHECK_I(set_context_latency);
>>
>>   	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
>> +	PIPE_CONF_CHECK_I(dip.gmp_sdp_tl);
>> +	PIPE_CONF_CHECK_I(dip.pps_sdp_tl);
>> +	PIPE_CONF_CHECK_I(dip.vsc_sdp_tl);
>> +	PIPE_CONF_CHECK_I(dip.vsc_ext_sdp_tl);
>> +	PIPE_CONF_CHECK_I(dip.cmn_sdp_tl);
> If you doing a compare in this patch itself should maybe assigning all these variables some values in comute config too in this patch too.


If we assign the values in compute config without readout, it will 
result is mismatches.

So I have introduced the new members and added them to PIPE_CONF_CHECK 
without compute config part or readout part here. Both of these are 
added together in Patch#11.

Regards,

Ankit

>
> Regards,
> Suraj Kandpal
>
>>   #undef PIPE_CONF_CHECK_X
>>   #undef PIPE_CONF_CHECK_I
>> --
>> 2.45.2
