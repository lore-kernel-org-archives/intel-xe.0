Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B30CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944610F545;
	Fri, 19 Jun 2026 11:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC+x/VRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644810F56B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781868138; x=1813404138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aBv0ffwBulChXvxMoD11bDWEvnAGP/EO+g7lL+Ym/84=;
 b=NC+x/VRV2gUbnmh54uNyRb28V761DAhAF/sCeMsCi7OjIp5crgDuqH7d
 ILvlF/FULJmkw23yKRxj0VvLh6s0nQ0K9xCDRnt2bp86xKMTh5cq4/+vD
 bBPIFrB5oqXH4TrbZWQvrexRjzwquN310pw/B4m122onFtszJDF3iKXw4
 QzzxJQCswmNHJryYPwyhxibtp1YvXxsE9HmQyng9LPI7KlLg3GFhLDrXK
 s96VAC/LN1zILzWVMvo2ud/GtusrvyjnX5Ezko34cmbwMe0VZ10M4QIMU
 OpVOBjD35hoe3jIQUQOldrp4qJhintbyNi8Tb23WEDrisOhIfLqqOIfq2 w==;
X-CSE-ConnectionGUID: RF5Hi7XfTd6/hTKLbWzT3Q==
X-CSE-MsgGUID: 8/0pJsPBQLyFwmCPAG9XxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70228193"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70228193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:22:18 -0700
X-CSE-ConnectionGUID: WM9vwYZZRrGh40Fljz4B5Q==
X-CSE-MsgGUID: JqYKNuxLTW69totodwefWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286735367"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:22:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 04:22:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 04:22:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 04:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcVg5XjuzW/0bxrq2+gjoVC0hMYaO6M4eJkHyPYPd1XxJa3Ox5Zp5GYJsu5FZ94OOG9+sppPCfnaeOnMncKzyzptSR91EyE9E5bzw7F0cg03Zh/BoE8bxEagMj/9plpKA2ENXnf9pTYsMbTW3P8Q5sTj/n9MSJtZKzwRmb6AGUmbO/mz3LmZUo03NQwh+yqiBjysOklRX1PMFberPSh3KBVsQbdan2DVL2TRDpIqCsh4zU9XjxUJ4kgIogomFvw8cBIUCPSOlkyEFanmBwNkLVOP18DbwZouajx+AMgMJczxA7euPrF5lpDVzHsENoThu4pYP9YVqIlMsdQQobmOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csLTS2PWpOYbGH/b6sm1cPjipDoIpYtw3PM4gjTLF+k=;
 b=hTDoSYzadq9JInRQOdnd6e8FMdrSKovWyOG5369NdS33xrFje5/TV6pYC8MzTYi5r3SMNbt9kwwg3T5DOPZhVabXvPyDNP2fEBH834NC6loxhUGtdcuAYmNzu2RQNy3dy8H2yTiW6NxQ5U88DmrDE/2cJzSC8+AdZE43AidO7XHlsuB7TbR64y2wnLvGHw9gFeq5HRJCRVJ6Jof/qDmG+0OB41LcBu4DKXZaqGB2TG7zkKgoAoR+b0DY+zCaghgFEUpEb9IVQJCbZizC+I72+JlPPcBSS6UbOxZL7XgZbR1iuEwSJTnkw1+/GOcKtaCsPdIeOoIGfdj87cJLhzoAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Fri, 19 Jun 2026 11:22:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 11:22:14 +0000
Message-ID: <abd12fe2-0d6f-4b1b-8e9d-107cf3d766d9@intel.com>
Date: Fri, 19 Jun 2026 16:52:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/15] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
 <20260608084700.640376-21-riana.tauro@intel.com>
 <ajUeL4DutqTpg3HS@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ajUeL4DutqTpg3HS@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 2addf69e-1e6c-4bc3-6a9e-08decdf50328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: MpwFZSLG3AkPSUA0Ni1w2QTSt93SHo6qmwv5FO90ZELQeqLE1OJAf5ussznocrMw3Wo26mBI/6Alt0nkr2HmTAc5vMYFH7S/RdP2gZxuyKKCJj5y+fQKvWFypdDqeRlBUaLJQoo54v8aFBBkYiAnhvHYZYB1GaAntAYsiC6my/UaMAlh4enSIs0eQe1G5jPrl2QIfkPBkhvtNEPshX6t+OCuOJy2baNERmsH9SKXLrGiwcwUDobPxLqe+KHk4GUgbLINO2I0eJsuiqJxMvMceEaUxm3uZjmO1j/a4YJBWNl090FYnSBniisQ4qSBCMvxvymZ/pkovBvii26dgdkCzI8+Ipeo5G5rsfKX7ugpo+wMRI2iX1EFYztEfsq0YsbnWn0BY87yHZ1PRMGUBN3uaqlfV63PZH9NFXDu1iDoizwjWX0igBkR3Tf0jeIYaooLFrz82vbMCZiKseNsgJo8hY9rxhpred0Vb79Js1qflKdv3oj3MIULFkTIAqPd6AlK3eEnXv4JhtpmMLjeqRaDyUI/bDjDh3vvf53ikEq3xjba02s7KURNtIVzK/PCVAAHC56CiFAqBiI7jj/UR5vyEaTaxjiWXTXA7Ffbj5zLx6u7btXYd0T4GdZ6kjnlMwKmK8jlzXlsQOZz8VFVAh11S1zyKiZMFLskwPIYUKShMWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFZFNVBDU3dPc0tleG5zSGdJRHh2TlFCaGF4a05UMittYVhTam0zdEJrN1h6?=
 =?utf-8?B?MzlpdnJNdjIraTMwem9mdXdFNU16UHdyUTZ3eGVJWVNqUlpDS1A0aFVFZTQr?=
 =?utf-8?B?aXB5cWFmVGpJTnlDQXhtSllnb2hFUU51ckoyYUhUVUcrZUovcXdHRXJoUnBP?=
 =?utf-8?B?dzU0SFBEeU9QVEtPdysrK1lualJSSmFzZDM1QzA1WnRYSm9nbVpDNDJVN2ZB?=
 =?utf-8?B?a3FWQURyQ2kxZlo4eEtpVlJndTZwU0VDMzRVbUpKcWtTMjVzRzVOZGY4YUxD?=
 =?utf-8?B?RlR0T0JpMUVMYno2anBZazhLQVE5YjVySnA5dnQxTUdFUUFSbmZzQzlPcWtF?=
 =?utf-8?B?VHpSMk1mVHkxMTlwN1A0RmlyR0pjdkpGcVRjdUxNaWR1UTNGSmtOQzdLNVlQ?=
 =?utf-8?B?RHoycDZ5OGRudjhVSUVlU0pwYXRJUDBDNm9ETHFoK2hyS1Z5c1VCT2M5VFMz?=
 =?utf-8?B?OWNXL2VFa0pnbWNzU1hWcHNhUWxLV3Z5MlM3WW15ZHR0bFdhOHJleXVBZ3hM?=
 =?utf-8?B?RWFDRmtmSFNmbkVyZkJlVGN4cVNIVS9YbU5Na0gxWm5GOERTWVNIaFYwSWpk?=
 =?utf-8?B?a0FWaFp3T2pITHVUcGNPY0o3ZE45Z2RPV0w3aW9hS0dsN1VRSThoOEpKdW8x?=
 =?utf-8?B?M3ZwZ0JGbUxWd3hnTWpGOHpZWUw0U3RDbkxjazc3S2FZNlhXY1RtNHVEVUJZ?=
 =?utf-8?B?dTI1OU0vOEpmZHBFVmJESnZwQm9kUmZ6c2hBOVYxZHJ4V2tFenp0OG94dU4w?=
 =?utf-8?B?UzRnNzVlREFXekZKME45MjRkNHZONktFVFZiWi93cEpJVkFIemsxRXRqV1pk?=
 =?utf-8?B?cTJYR1o5WHdVWjg1NkdrR0Z5R3dYeXgwNDlXOElXQUcrK2Iwd0k5OHFZUFhh?=
 =?utf-8?B?aUxKbzUxZXZmYXdsWXk1eUVQbWVwT2MvWmlwYi9seTN5SDdJV3ZBemxCZkww?=
 =?utf-8?B?VzBoZUhWdStzVjEvNyt5bDVKN3RBbHdPOWNBaEhmbE9SRm5GWnBneWhyL3hS?=
 =?utf-8?B?bHY4R3JIWWZPTSt2V1JUY3JDUTdHZ2tHeVM5aFhhQTRuOE5vdVNxcEFPNnRr?=
 =?utf-8?B?MHlDenVvbVIxQ0tRSVd2UDM5VUV2V3ljRjRmbXMvamp6cm1kSHE5ZDUxYTJQ?=
 =?utf-8?B?VFBNSjlqaHNZVWlnWThWRXVlMHh3VjNMNkFObHJnQzJsNExnckk4K3ZKQ1ZC?=
 =?utf-8?B?b1VCOVVISU5scmNFVmNFWmNYUmFPYzgvMGw4ZUxJMEZSdDBOais2OCtnSnZZ?=
 =?utf-8?B?bThKNzh6YWRoL2d1cGdMRTY0am9WWHU5aExLdFNXd2RpbGlpNCtQNUdHcEdZ?=
 =?utf-8?B?dXdLNUpYeml0dHZnSHVZdnBSVmlac0ZOaks4bW5URVdlcUx4WnVKZkdFSWxi?=
 =?utf-8?B?c3ZQQ241d01zQnAxVE0vS25udVl0ZkJhWWVLTk9nMWVMZnM1cUJQVE5XQVZP?=
 =?utf-8?B?SGFmRkp1Y1BJUVFIY25KY3lyVHdrc1NNQVUzaEQwU25aWWlka3k4V21VWHo1?=
 =?utf-8?B?S29pNzZhVTZtWFpRckN4WERwMjJabjZ6MDkrWHZvamxXVS9aNDlnWWsrMERG?=
 =?utf-8?B?RjVuTll0WVVOZldZbXpNSi9XQVA5NW16L2IzdEk4enp3UjhJdDhXRm9MSDFJ?=
 =?utf-8?B?Z0MzUkRSYSsrbEo5blhKbWFNdjVmSkVVa0FpamYyRUV4ZW53MDZnMzl5MFU4?=
 =?utf-8?B?V2JVQnJSZEdPRTY2OU1QcERqaThLS2c1NlJMc0FEcDYyVy9FbjZ0NE9ESGg1?=
 =?utf-8?B?R1hWUjBxVzREdWxDNGVZOUh1STZxV1NoVHBBL2dlaitDRGNPUDBEVDQ3U3R5?=
 =?utf-8?B?VFozcXdQSGRQVyt4VjI3YWpHK0lmZzRHcERTZWsxODdaS3dqOUlrMWV6THZw?=
 =?utf-8?B?eml5MzhWRHozSUh6OXdzd0lVNWt4N0VwZk53VlhXcGNueHF0KytZV3Voekps?=
 =?utf-8?B?Q2U2Z3BMUlpjM01xVkJISzNTTGZwUzJwZ3pHY01uQWpqRTNVZ0E2UHJVOFRB?=
 =?utf-8?B?aFZzNWxMTys4T3kwaXE3MWd5TmZnUUNDdVZMaXYrR0R6UjQ0TlcyTWUvVWZQ?=
 =?utf-8?B?UGtxdUhqS1V1QXZPSHRDbDVoVzJ1ZmtqN1JleGpZVDYzV2Q5UXN2ZzlxY2Vq?=
 =?utf-8?B?dnA5elFDUUpMWjVvTEJhNHh0bjNHSlpiV3E1QmJQSUFpUkFHQUtiN3kzRXB0?=
 =?utf-8?B?RjNXR3lYYjhXcHBBWTVuQ2Rsd1ZadEoyd1FDYnhOUHo4L2JIYVlDbXNuQmNM?=
 =?utf-8?B?c3lIOHREdm00dEp6Mjdua21DVVZYS0ZwYUlDNmlzZEN0STN3Y2ltb2Y2YU0y?=
 =?utf-8?B?a3pvTXBycU9JaVE2QXBhNWZUbDkzRzJENWR5QWlkU1hVelByWTFtdz09?=
X-Exchange-RoutingPolicyChecked: M9BJ0WC14kBymKehKw8tJsazpiJmcdThPDYq34jccir9pRE6DeAs3eGer1JCW4Ho98BLENG6xm2dxyNvUIS7ynd4L9i8zBkFNtipNwrrduJBgCO1y6cg7wFLj/VbAt/7BMgGzVW9SchXKcGAWRnv73NLTP4wwqMezjNbOWPm/hSWLLy3azcQZFAf3+4/BnPj6/jWLBO2qXe1HEMgr5NgfYE422RhOP5K+zmPw4RlT5EGvMMEaGh8sSFc6Z8/scbTl1Xrd2nSsLrJ2VNiE72QwKbUZwEu2EZc1teHVaN9rn1mNVvNpOkmiZwscmD7k5Vl7vskK9EUIVAef334ItnkBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2addf69e-1e6c-4bc3-6a9e-08decdf50328
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 11:22:14.0564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRw2M4lZlvkJN6WIyCKiiZu1dEThzgImvvL5S4OsR3SRb13JsPCWZO8yHXIjpHUs1ESmE7kxYxpHfnUkl2uHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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


On 19-06-2026 16:17, Raag Jadav wrote:
> On Mon, Jun 08, 2026 at 02:17:05PM +0530, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
>> to handle PCIe Advanced Error Reporting (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes inaccessible. Return
>> PCI_ERS_RESULT_NEED_RESET from error_detected to request a Secondary
>> Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback, the
>> device is queried to determine the error cause and attempt recovery based
>> on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
> ...
>
>> +	/*
>> +	 * Secondary Bus Reset causes all VRAM state to be lost along with
>> +	 * hardware state. As an initial step, re-probe the device to
>> +	 * re-initialize the driver and hardware.
>> +	 * TODO: optimize by re-initializing only the hardware state and re-creating
>> +	 * kernel BOs.
>> +	 */
>> +	pdev->driver->remove(pdev);
> Curious, how does this effect drm_ras nodes? Do they persist?

They won't persist since we are unregistering on remove.


> If no, is it reasonable to have them recreated on every single error?

drm_ras event is generated as soon as the error is received so the 
applications monitoring the error
will receive a notification of the error.

It is not on every error, it is only on uncorrectable errors that 
require SBR for recovery.
Because VRAM is cleared, applications abort and are re-created.
The same applies to L0 too

With the FLR series , the unregistering might not be needed.(yet to test).
But i saw your offline discussion, that userspace applications might 
still abort even in that case.

Thanks
Riana

>
> Raag
>
>> +	if (pdev->driver->probe(pdev, ent))
>> +		return PCI_ERS_RESULT_DISCONNECT;
