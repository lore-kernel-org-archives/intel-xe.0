Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837AFC5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7710F325;
	Thu, 13 Aug 2026 13:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4HHr0KN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4710F325
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627028; x=1818163028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6er0j2N1iPh7D2z1GrDzY32pI8MDDejUegjvH0UzH7g=;
 b=d4HHr0KNUbOAZk8CriaP6cTqHVusjldJu/QXJt2HgAyKZrrStVUcA0iQ
 F0C1D0dhdNaV6BKsdZV4k6bF9M6imH7gpGCxsEQEJGs049u0PqFAquezN
 m10s3v+ZZ4mtZ1yA1ALoV0jKTkkdO7GnTz6oFs4JuF1hrEcxF9j4QLVbe
 +qLfMmgDCe/VjI7w9Iz9oSCPF1ADH0m3jZFsU1wmng7BckkZ1e28mPakr
 /zZoRq9Dw2mueleit+qtbiTm92I0/jDMoVrwTSxt998N2vaVxIL4xciPY
 OxB/+mtea7WGB9NMey+nNAJb+mNgidglltTuqamdB/b5l63nO6JMJFw/w A==;
X-CSE-ConnectionGUID: oH2s0Dj2Rxm48IE1lAx33g==
X-CSE-MsgGUID: svMF5FeWS7SRJyhlojTkBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91074586"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="91074586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:16:57 -0700
X-CSE-ConnectionGUID: ocrdeQbmQ1eG7QeNeSkm3w==
X-CSE-MsgGUID: qIkBbl3lQtexei2FOTAS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267790459"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:16:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:16:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:16:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjwTInbHCP5FuPXgw9f0t8PvLGxC/QH14/9XDTX/sImkuyn5nIeNt9Id7F04abKc7EVhAvBI9xGIRdUqI3vBA0bbCxlZIaCmqQBgUCK4zd8vqw9T+iWfvSeZERExVBSJ/6dZQCnCvWcRd+KzqK+AlxM8EiKVi3HG4cEeUmM35WQKXc5Tcm1+PiH0Tp0tmJn3npAeZa6e1Fe/h9dSil6o2OgGfecsfGEJPzgrzFQ582240EeBQ30AwyLK52LuZnKx7qOW7LTgxB57b8GfV0G0D/tyO19OlIJQeWr+7im6RixFINXmBqxMf+u7DCf2PWIV8KYP1GEWU4lmPSBl4sltrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OE5u60NJK/ou2vWXBhFskGkvdlkUlqYgVvDNxUBTqgw=;
 b=P4CsTcWCR2nGfoK7abXOzTvs0OH7E1yMxyHOBxP4ykk1Op1IulNQwffZjYi+YVk57qlPYoO7WiRzrZXHwNdjBqt3FjpmFSP20H4Gzzqd2q1jaEhWYBUb62AGun53Ke+8ikL0dP0FJGVxpbSJiIpyeCwyS19UcZq7sgqSIe39NgsKx6lv+EKeA5IV36C4fysGHoSaxvLc+DYkiz8HZZA4Gy+N3x5LX931g2OFTAIeI5DB23F9YzME90zdCz3lcat1KbAvfn/V/DMj/yMQ7/FmTZTpmNKeewUZ59WAq3v68wY1NEi0llNjE/QUrs4aVt99BDg5FlnBqqL4PmaQcW/Dhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA3PR11MB468931.namprd11.prod.outlook.com (2603:10b6:208:548::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:16:55 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 13:16:54 +0000
Message-ID: <a66ea184-c38d-446e-acb1-7cad447fee0a@intel.com>
Date: Thu, 13 Aug 2026 18:46:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0155.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA3PR11MB468931:EE_
X-MS-Office365-Filtering-Correlation-Id: 702124d4-6e99-4b2c-dc1f-08def93d24f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 28UX0EJju5qfsuUJRNXx5aHpW3emG/qry8mcY3jpgxzGwQg5d0j17d6EsSY0mRLzp9WUl/46vNwfTiVCC2nM+1Y665RJ5Yb4kw83FYp7T/GWLenwtrJ0pcio8nQgLFLyRB9Np+keplbI3LHfYlkfa2Q3Y9u56A+doLInyNJBfnmTXz0dYohc12DURi73z88OwrkdOm/bmraeBFEi/jVlkVr7yFh4r9cYSyp0DNebdgCiz7kPP5WB7J/NCp6358bBLpfY0d2tFVT7dMi8O/UGJGJsObj7t07+X0l8ZDCPVXyH5hKvh4W7PbGsX1IfCPNfOEEOuviFA8Nrrss+bVHRTGBZGDkyV5rNk0bg+1s4KZRfAkktHQtqv6S8vMVNrh518OFCvnAKF3BJcEu7LhFOZkYUuP375eqkAAaUPoAjeA8uTj8nGjANQK+7HVMPFuJyPzGxx8v6SPxxphf01DwJMdx23hFTkDN8T5ZBk+NHSxMhXpgt4GWpp4Yh0mWJjoGjIp6o9FCyQ5LAMq1OzXdsWC0ivxgzQEx/RSSACFUg4ulTZ6ShjYXX6zYl6i4q78I2sAHZGV99ZWKUHsNaNLENCDc7n+miaRRWnWsAHhJq3zlIEI1ir9wdgx5BGyCeSmna
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFZ0blljajF5WEtpQjVLWFVwdWFEV2sycS90ZWs2S3FCanRVWVJweC82U1dZ?=
 =?utf-8?B?MDY1MG80dFNVY2ZnWTViM2orSW04a0ZEQXhRWXVwS25hM2c0NFpYT1d4QU5S?=
 =?utf-8?B?bXVSZ2tWeVg5K0U1aTdtMjBNRXB1aXVRK0E2ZnVFVFM2UC8zaFZuTjZxTEVS?=
 =?utf-8?B?aklFUWc1Z2xCRUJETW16ZVJmTTRoV3RBZGFnZzhhMU9FeElpYTlPVk5RTHpk?=
 =?utf-8?B?S3NVQUQzNDBUTU9Ibnd6MnJXTnB2Z0lHTXNYTG55YWhuZkdvSWw2aUI1OWc2?=
 =?utf-8?B?R2NHckg3L05sYi9SdWdCZjlhbjVEKzExd1Q3YUw2Nm83UnpUN3YzVDlCRGRD?=
 =?utf-8?B?MStORTh6Z0lVSVM2L0pEOXRlT2JrRm1HcW1HLzlIUVFMU2FHT2YxdmxocmZI?=
 =?utf-8?B?TVZXVTJLQW11aGxad0tIUndrRTBHa3JJYzdOeDRwNDFUMGJlRnlCOVRsRUxY?=
 =?utf-8?B?VFBKZ3Jma3orWWlMWHpSNGVPQmxJRnNEWDY3MUVlLy9MMm5NTzAyQ0hhN2JG?=
 =?utf-8?B?Q3l4QlN3aWZncGQyRndRNlZkMFp1M1hiWHJUVDZ2Vys3N2Q4SmU1ZHJFaUFu?=
 =?utf-8?B?cjVUQXhxUk1SRWpURE9pTDUvV0NzckgyQzMrMm9vdFF6cmQ1REF2eDJIWFNk?=
 =?utf-8?B?U3VCcTZOeUxlYnJudXJWdU9jeTJYWHVZdFlGcUJYQndSdDlwcnk2QjhvcHBh?=
 =?utf-8?B?T0MvLzRXeEJqQXl6bDQxd3h4SUNKQnR2RStJRWkxczJydU14Z04yOTYzRlls?=
 =?utf-8?B?MTB2U2Jjb2tNb2ZobXRCRUU3SE1XcHJXNUNURkxRRVBhUkV3SCt6M2ptbWVk?=
 =?utf-8?B?eWlGUUlDbit3Uk1SckNSL2lUeG9SWWN2TFpsVWgwQmhwL2xUNFFUWmhmeGZl?=
 =?utf-8?B?Z2ErQlJvV0V2Wm1pcW1YdmUvSi9zaDMyTnZjWDRUNzN4ZXlhcWs1UWhmdUha?=
 =?utf-8?B?QnFGUE5MVzFJV1gwMy9YNk5TdytuZDhTTGc5ckxMYzRGdFg2Zzk2bG5oV2lt?=
 =?utf-8?B?NVRYQ3pLN2tLcVhodmVWWkR6VUhRUTRha0lmbklJRXJ5bi9hTEZCY21LY1FQ?=
 =?utf-8?B?UWFnamFoOW1JZmNWUkNZSEJia1VNZWZwblhpZ0lYYWt0dUdnTTB6azdDVS9y?=
 =?utf-8?B?VVFYM2VwRlRNd2dQZTMvL083alZWa3lwa0kvNWRSaElwU2FxTmJ3OXhXbVVQ?=
 =?utf-8?B?Tm1GaUh5cUFDamJWSmg1RVl1K29rL21iRld2ZDVnQWd1cFBsOHNueUthWFVi?=
 =?utf-8?B?a2ZQT2VMZnd5bkVwMVl3NFQ0elBmc2x2TVlPQUF6QXJ6WGtqSmQwWmRSUHAv?=
 =?utf-8?B?T0xxSzArWnpxUlNQNGI5eFV4ejJmcVM0Yk82ZmlxME5Va2pmZTVSVnBCOHJJ?=
 =?utf-8?B?K05iZE9CYUFHMTFkZnZyVXNEdzZKZ1BneDRqZWtxa0p4UElIUlZSay9SbmdT?=
 =?utf-8?B?M3JDamc3dEJZTWtEeXdTWFBjWHFtaTJheTJQWE54RXg3ZUc2YmY3VnlraU90?=
 =?utf-8?B?ODE1UmRsMXAxV1F2d08wQ1pqWDZnMHVlQVhXbWY1TDlYMDBJQWhGYWtqaEtT?=
 =?utf-8?B?MlpSSmRaalkrajBPVk51YVlYZjVvR3lZemp6cnB3cnBFRXIxZHZja3VTWnJp?=
 =?utf-8?B?NHF5RkxPTWNtZXNBN01EdWE0cnBaNU5JOHhWcFZTUGV6QWphaVZWaHhLdU1p?=
 =?utf-8?B?b0VuS3d6eXljR3lTaC9TRGVUUnlCaTlwK1JxOGtKa20xdmx3dEpMc3BpU0k1?=
 =?utf-8?B?N2FOSFpjOVFHWjJ3dm1SdlI0am92WDR2eDdBV2N4OStYV0x1TmM1c1pxbkJF?=
 =?utf-8?B?TitQakxZQk8zK3dQWXEybVlNd29Fd1E1akNVaHhNUldJMVhZV3dxVlljQU5i?=
 =?utf-8?B?TG9RZzBkNmpRVDFSUkZzOTdBSlBUajJuZnNEdHFRcVQyNHNtRGsxbEM5S3RV?=
 =?utf-8?B?MWh4UWlJZStvMU53bWhlOE1FR3JGd2FjbDFqTkFUV1FsZC85cXBqT0RLazIr?=
 =?utf-8?B?SmVzU1FSamZUU1F5c00zaS83SHZ3L1c1UUVQU1MrK3lMVzhuV2RZOVVEQ0Fo?=
 =?utf-8?B?clduUDhHZDg2VWxPWmZUc0tUYVdiMDBLYmdXSm1MbU9tMHVTZ2ZOeWlpWmxJ?=
 =?utf-8?B?RUhBQmsrYUZoQ1Boa1FIR3lUWVhFdm9zRzVZb0RYdXBZZ21qallETEJrcSsz?=
 =?utf-8?B?ZGs1YnZ3dngvdGU1SzFmMUwzRzkzcVpWT0kwVkJoQllyWkw3NkttZU5WTDNF?=
 =?utf-8?B?dlJ3RVZya25lcUtUQ2todFNLOURGaEl5WDI4bXBjUzZ5SlVEWTc3RUdQSkpC?=
 =?utf-8?B?c2kvWVZMNW5INUJmMGsvZWhOc2xJK293bWx0djRDSVBwNTZaVmllM21yNmNh?=
 =?utf-8?Q?UN+OY0mZLz5k+1io=3D?=
X-Exchange-RoutingPolicyChecked: PrrpaKsqukiJmatAALqg7Cb7PzRxBlc2nrSPF5MS/5875jA8snKiTaBs9nV6jPH7vYXah7oZOmLhIB/Ly337cWQW5514r7A0sZ4iEcPvSsb29WvNvveNEaLEAkq7fOeaQaWUDPXrP67ulfGR7mR3zhg963BCQJUBf6M1C46lASVISKe9QjY2FOaiX3y6kn7EIDXBmRw5QlOd2LDACg2wZ2oLiTsEHFKoS6O72/61zh00zp39HW8E6ewx1Qvtf44s6aL+7gBwCjVjjniw7+3E8c0+WwcL4lQcaj4SshYkOeXsux0xw2WCoQHp+KdYOPxhI9BWb+iVJVnQJBi6iPjS3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 702124d4-6e99-4b2c-dc1f-08def93d24f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:16:54.6918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7sT+YnVFU1qxy1gZgQFrRzpZhMZDOqIMm6zDVHSBF4bHPoBUlUlh1cEwf8dmykuV0xGk4dlSqmYUfZmIxZWywWnCB4+qGiT78mSUWMukf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB468931
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


On 13-08-2026 06:16 pm, Michal Wajdeczko wrote:
>
> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index ebd288986c11..5d3315ac735c 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_mmio.h"
>>>   #include "xe_nvm.h"
>>>   #include "xe_pcode_api.h"
>>> +#include "xe_printk.h"
>>>   #include "xe_vsec.h"
>>>   
>>>   /**
>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   
>>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>> +		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>   		return;
>>>   	}
>>>   
>>> @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	create_survivability_sysfs(pdev);
>>>   
>>>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>> +	xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>>>   
>>>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>   	xe_device_declare_wedged(xe);
>>> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>> +
>>> +	xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
>>
>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>
>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>
> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731

When we pass zero as errno, that time we can use it *_info  (boot 
survivability mode), that's what Arch team told me.

@Aravind, can u please comment here.


Thanks,

-/Mallesh

>
> @Riana, @Rodrigo, @Aravind ?
>
> I need a decider here
>
>>
>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>
>> however we need to create separate refactor patch for that in future.
>>
>>
>> With above changes:
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>> +		xe->info.platform_name);
>>>   }
>>>   
>>>   static void log_survivability_info(struct xe_device *xe)
