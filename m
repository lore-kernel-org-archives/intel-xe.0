Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854A5C4453A
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 02:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF2E10EF7C;
	Thu, 23 Jul 2026 02:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6bUQMG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EF710EF7C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784773395; x=1816309395;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=epkMelTzYdRgy3nj6hWjmm2x96ZVUkcfNhl/W75W7vM=;
 b=m6bUQMG28hR7RMWjYJmFlUhk5uLUlyYRFs4O2vElPQpKJar79+kwSdze
 kxc+OLg+lud8orXVeE0YBQU7PubQiNt+vpXwT87+C5Pe7QgCqSKU7vLuP
 K2LA2GyYfn3rmVWDl4tHTjAcsuo+zR33Kj0/jvlSr20p882H67ExZxZMb
 JcuH9qXZrAQhNCHXq0GXUziO5MkqYLEa8hMJ0igLPYwv96jPvUFgJ6J/I
 7G28Xcnznt2vGyV6BvnDG5TDVCF0YDI/Wd5MxGofMc21G7kH43dEcouIs
 yESJaGU4K0iFkmOUoaJLUFhwAxGkjjnfK8qwU+rIKkFsR/QGEEoboMxIc Q==;
X-CSE-ConnectionGUID: gc73wGC/Qu+z9Wfg7TY2gw==
X-CSE-MsgGUID: F7kkYVY3SPezceq7803QhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108212374"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="108212374"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 19:23:14 -0700
X-CSE-ConnectionGUID: HhP4aDXiS7CvGeTVsIb6rA==
X-CSE-MsgGUID: P1jwbMJJSkCrJ5O4JPeA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="258958233"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 19:23:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 19:23:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 19:23:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 19:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raWKQ2/KPbRb+rh9kj0a26l2zK99RCvYEVvLSEqM+3OqHPMlrqQTuLa8+LvsJ1/Jkrn7IEKoLKTyrP/p1chVLPBf9tynB/XCWdVmuOe5LgSZJM3swG5FIY4lESFwuX3UfkJMFsKXALbb5z+wftWl2oPYNo2N6vR5oxISHe8b6En30SMteZjlXo3DiA4U4Pllx44bZOa0MOomVVBFQrBNwAE2ARyLydUmSpphKDa+o8D2x2TH6zNb2ghyAsQ9IgRTtiCGGUSm7GTvtnH9rurddI1Kp95OvppMBUJTwwRBW7EsGnhraim1MIsfVs6o4g/tI7VZJxFwkKv2KbTjUiPcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te/Coye+XvNGSoRd1zhbnHiquN1pCXlg5sVq/ncdeL8=;
 b=CGyrWq+mZGobODe9luoRoqNrx7WmuVoboBj+UnNhGFcvhbu0j5ibIzuQA6V1zlcl6PtpSxygKC1Nim2ypH4kMmGJAfPf+/pF58g6sSm3stddLf7hJcrfKfqaYXHsXA6HUnFSnpk8gWhZ4v/WMTFIBWsTDXfM/16oR0gNK8MSIITNUJRkEswhGcYsOW59IV1mykYXVDrCixLRkJagomBYA4n/TAjY2qfkPqcTrEulWOYAqntSVFQQ27OnLxfAqXwyzhfv5KFmBCykDiobDssC4TFzZyGFwDYblpi10F1EuUSrr848SySD41mAt0Qnu7H6m5RAsYMPgeoe2UCtYmRWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 23 Jul 2026 02:23:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:23:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/nvls: Drop force_probe requirement
In-Reply-To: <amExwzj4sF1lbBfH@intel.com>
References: <20260722-nvl_s-drop-force_probe-v1-1-db944d940cff@intel.com>
 <amExwzj4sF1lbBfH@intel.com>
Date: Wed, 22 Jul 2026 23:23:06 -0300
Message-ID: <87jyqmculx.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 853e1562-3474-4995-7307-08dee86156c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VZLmXPOSxgbDHs9MwF8piivXtwwuqzjYcyRV6PYMCcbj5Oho6n3dwTXkuAA4ARuLgJEtpniAAY22eyCV8Um1Va1hkb+ewLi3J37RRt7xot1GzZQs3xx4AMpY5mB/cmE1SnVmq7822TuYFexyocisP81hgiI0lOYRDOdWImrRV6aVly/DSKaKCQHde7ZJlpo+8W5XlYJPxTzDvKwj+QYVQSYv4TGG/9XBlflJZFFT7adWFslqFFNZG+Nl7sIoO15O1ZYx9WvbXcY8IHvW05ejfAXW4047HGgc8dMBuCoeK+rQMxJ/Tpq8hmcfwIJ7sdJ7eRKy3Fqn7Z1PWoqYjQJ1Frq32Ly7Wi0krsoyMw51k9VJuFCko8gw2LEXifyerJiyqFLaYudA9DLibH+MpEoRuKCjA+m1kYbFAmVoHL8RDBonsHuLAp9cPEaXvbKnA1Nkf1ehRkYbGtgEluWPkGoSyBfTv/63LhzANKKB5kZBfocPKcEuXIVmjf4XAzy4FLcq9Ov7WqyGa0T7ZLm2F8ltCZ8z2ufBRf72qr/CxI0RWLBH4HahBePEymYUfJKjzT6AuXVxSfdKOc2JkBLlcnulwBaC7NxGReopnBhpTQdU/qiUh2OA0YXtvWmqbRatEJ+SEnfpjwDzyl4+UR1O0RFz44dcFk1Xv2uo3xHlksBfYmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5yaWhJUGo5ZnZYaTdiTm42dmo1bVBoeXpmQzI2bnJNMkc3UW9NVHZZNnN1?=
 =?utf-8?B?RUVEN2UrVlZMbXNNVEsvbkZvZTYxNzlQY0ZXOC9ZSTU0aXVoWVNFWHZITm1a?=
 =?utf-8?B?T1o2R2FXNjMzTmNRYXM3SzZpZm1PN2lrdjhnTDFKK3luME9GeHJ3OEtQczlj?=
 =?utf-8?B?OW1YRDlTODZObEpLaWxUNlAvWGRrL1A5QUdhOCtpUWxPaytISVFsUWhodEMx?=
 =?utf-8?B?eTJpWUJHcUNIS2lZUFg5aFk4N3BDblNPNkhmdjVJWnJQRWFqMDcrR0MwRlpr?=
 =?utf-8?B?eGJMOTcxeWExVnp5S3R2bDNBWGVrdVBsaWJTTmdUNlBwU3R4bnAvS0ZxOGFG?=
 =?utf-8?B?cWdQMkxaMTNISW9jeTd1b05jNzFHV1o0T0p0ditVOGlKSzV3OTdoWjBKSGt1?=
 =?utf-8?B?RFF2SGUyYmhXOXp4TkxrREQyWjFIVDcrR3F6Ty9wYkxHMm9jWDZYbG9YNmZv?=
 =?utf-8?B?dlZZOEVSeldVNHI2K1lWVUs5MWI2SXBldWFNVkNrWkRCS2EyaXk4SC9Rcy9l?=
 =?utf-8?B?OFlVWWhOY1RGSUQ4SDlYeXlJbTgwWWwxeHFvRHcxYmJIUVI0ZjFqc2VXcVFZ?=
 =?utf-8?B?dkN2SWxjYm00N2VUUnRXYTVwWXpmR0Z0ZFJNTllSMytGczN3RGNjcjNUZldG?=
 =?utf-8?B?bFZoWWN3eENjT2ZVYWVyVk5Rc2dHNWhnYzZuenNuZi9wMy9WQ1cyL3o4eTQw?=
 =?utf-8?B?WFI3NVNSd2VwdVRIM3BRS24xVDhVOWE0SGhzZ2kyMGdBM1FBSkNEVUhHZFhL?=
 =?utf-8?B?bVQ1RENDelNFdW1YMTRsU1RpZ1cwWnZlVWhUTjVZY2NHMm9RVTBGY1JPTzNj?=
 =?utf-8?B?RnlXWllBNDBkYnZWV1F0V05abmVkTVo3ZEJKQUhnZmFCQlI2QmVOU3RLQTZK?=
 =?utf-8?B?Si82UVB5MmNXenBHSHJYMXhBalFQdEJOUmUwdjJJcXdwRzRiRkt3bTR0Qy9y?=
 =?utf-8?B?RHlaaTZLN2RqTHk4dEt5ZlBOZ1dzZWcxVXdNbGU2M3lDeVNaL0d6R3pKbGFI?=
 =?utf-8?B?eFM4eTRheUJGUjlBd0JabkRUcjMzdjVBOXU4VzFWNmFlcGJsZE90QzkzWURE?=
 =?utf-8?B?TXdSUXZnck4vRzNnUnU2UjZNR0NMRWxvTlNhWU9XK0RUYzAycyt0UXk1N1hr?=
 =?utf-8?B?N0VHQng0YlVKc1hRY3ptTXc3MzY2RmtidFVwNkJ4Y0ZkTjA3dEgzRjgwclFW?=
 =?utf-8?B?UzltOEo1Vzk2Mit0MGdDVVg0cDBxc2tDV0xCRVhaWCs3WGRtREhIR3NWcUZv?=
 =?utf-8?B?Rko3SWpvYjJVUE9iTTMzTTlCeC9zbnRWK2g5R2ZLL3RnT0FvTCtwUGQyNVpr?=
 =?utf-8?B?QWNheE1FbkhPUEdYam0yeitHQys1TCtUcURzTE5wQUVzai8wMTJrOEpENmdv?=
 =?utf-8?B?UFpCcXZiTG1ucXlVNVE1VnkyZW12VXFqV0I4RTViUEdyenVJQXZDajd2V2RR?=
 =?utf-8?B?a0swOEpaV0IyRWdXQWlNb1RiZFB3eWNveERpNGYySXNiK3J6WFdNc1NKc3Bo?=
 =?utf-8?B?MWltNEx0NzQ3NWpndnpiVnNLY2Y2bjB6ZS8yR2o4UVQxWWdKeC9ZckUzaU42?=
 =?utf-8?B?RlA4dGt5WXlKQmZreTJucEFXd2RWUXl3RnZsMVFrTytoRnpoeVlvbElGVUJ0?=
 =?utf-8?B?T2Q2MUlwZVFWK1puTWxkajEyUEFyK01ObENWQlhiNTFodDI2d0JUUVJnN3RT?=
 =?utf-8?B?ZnRocXZTZ2tHVytBNDh5U3QwSDhLdnNSS3U5aExzQmRIZVI5SUpxaFk5UDZI?=
 =?utf-8?B?bW1HUUNpWHlHdTFxcjFwRnNhOGJQWFVSMlVJYVMrODBvZVoyUDFQdkdHVW5N?=
 =?utf-8?B?NjErL1RpWjcyVjBhekh1WWdTRjA4NXMxK2pVTEFEYzJZSmgwMTBncDRZMTRt?=
 =?utf-8?B?SU1SWDd1WC9UY1FDWlU2QmpiRHd2V1RtL2xyMWR4OXF2bWNtaTN4elZHVUt6?=
 =?utf-8?B?MHhhdjVPRlp2clZqdVJadjhIZVpPeEt1TUJBSGZrVW82cm13a0poMFdscmh3?=
 =?utf-8?B?SE5mOGU4Mm9CMEVFRGFRdWd4b0syaE1XVDNuUjZORXJJeDI0cmZscmVweTlQ?=
 =?utf-8?B?ZGhqcXdHTkJEUCtzaVdKZVRNU3B5WnRFYzRQbmE4d3VLcDhQb3hBNFcwWnNN?=
 =?utf-8?B?a3EramNUdWhTY2xJWW15MXJEM3h0aDNlY1c1YU02Wm9IYUY1QitIcUlGSFBH?=
 =?utf-8?B?SVlZKzhRTkxXTFp1dTREZnc0emt4T250Ui80eGVlNzFVTHpxU1FRMVJabjFT?=
 =?utf-8?B?MFlFSmNZVXFZeFRaUHErbEF5MmRHVWlzeDI0NGJ2TVFUbEE0T2VvRVN0d2Fq?=
 =?utf-8?B?R25Kb2V1TEt0RlpKZ3JYWE1NTldPdjVPWXpFWXUyYlhHL3p1MzRhUT09?=
X-Exchange-RoutingPolicyChecked: a+txlPeZAsDoGpMGQ4xFFWHHusdtlmyKcZA1hDpwAVK8ZLoOqbXqLGKa3I67XNd5SCRlO+x3jJhZWoWExGmQwxR8fgaldoJWDEdQqPrQJfqtaKogq1VX6kOjwnccmRtWXDy1fId9bglDK/o7ZSKcz+PbbYQ9lCZlsVtvMtQKzQW4y9wOYJoujVkUgWcr8v4GPn0yAA99v4R/J+Wu+P/NZ9DM85Ze+apOaRWbOzLP1VUSDfiE9m4sw+1cjr2nUpunpg6OB7Y3dvpsng1S7aHD1eeXUvypS3VmSClBSuNmcOBgH80XlUqexeLDWaBLZX9uum4IBrzkH2uPUvT+h2/jfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 853e1562-3474-4995-7307-08dee86156c8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:23:10.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcQ7RA4UL2xO2z2eyI5Yn/via+JrRiKqcSqKnLy1UsDYUONbImjVn+eRU17oY/H9aXdMUR7xhq8koYw9gEn46Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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

Rodrigo Vivi <rodrigo.vivi@intel.com> writes:

> On Wed, Jul 22, 2026 at 09:52:57AM -0300, Gustavo Sousa wrote:
>> NVL-S is stable enough for us to drop force_probe requirement. Let's
>> do that.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>

Pushed to drm-xe-next. Thanks Rodrigo for the review!

--
Gustavo Sousa

>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 123ffd4c1ee9..36d62927b969 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -461,7 +461,6 @@ static const struct xe_device_desc nvls_desc =3D {
>>  	.has_sriov =3D true,
>>  	.max_gt_per_tile =3D 2,
>>  	MULTI_LRC_MASK,
>> -	.require_force_probe =3D true,
>>  	.va_bits =3D 48,
>>  	.vm_max_level =3D 4,
>>  };
>>=20
>> ---
>> base-commit: cfee1b098ebceda0381298e945031733a5aec8dd
>> change-id: 20260722-nvl_s-drop-force_probe-5f9699142548
>>=20
>> Best regards,
>> -- =20
>> Gustavo Sousa <gustavo.sousa@intel.com>
>>=20
