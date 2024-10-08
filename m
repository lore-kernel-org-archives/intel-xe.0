Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119C0CEF172
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45E10E570;
	Tue,  8 Oct 2024 14:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZM7CrMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CB910E570
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399407; x=1759935407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jofprhDfwM1dsivAkRmKhuyF3LHvbZ1ZObNR4y1CzSA=;
 b=iZM7CrMewzJHpURcWpDCDcK9V9FRC3gjCqLyb0dxMd4CoOUA5kv5MD08
 Ar21bAsO+908/FrzS50sW3M3GkyEYjlqrJymgWCxGAgE71J94/VuBKHQ7
 SpnkUHgNduwagLlFgr6ya43z2PCOJAfXtuhyTNbumNhigSosxzbLWuOls
 PBBQqnahi7ljQFT8Il6WLYSZI0hhvr18RXPWi6+dfs2DoWE6uBuuZYZMv
 +dx5uMh/w+Lm0vSZD9J221FbdLeXQOqV6dap2sgh2i4syiRXznhii4FgF
 4NhxSHTQbzR01uzsyVn1N5H/JdJhSkZjp4JjPwE4kfH/unNAu2MdlJQnn w==;
X-CSE-ConnectionGUID: a3NatOswSWGDCPyX2pHsCQ==
X-CSE-MsgGUID: zS5eBK+7QQW2GcpWVlkOTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31305013"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31305013"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:56:47 -0700
X-CSE-ConnectionGUID: C22otuwITyGDygoVadDSgw==
X-CSE-MsgGUID: HzQMl+fsQ5qrlD0swd/CXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75826287"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:56:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:56:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:56:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:56:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3jdD9JtjLUGyvq4i5WTXerCR7Pg1U23oegAuBknAqss39322C3xOddGYB9myuJdT//94qEqzZLk/V8Sd3i/mo+J0PO4H3MtmjVlg7lfEz7a0mfiZOways0f8Kw1cm6q6+0mm5G50Y02LzwDM4L9LWSJxvOMpyTtpvwOV7SYn2BHiQTMeghj29ol72ju/vtPhfWIBHI28FNbs+R0JRwVInBPic/StEKkJaMSKYC9wTBX/VJO5kZRbYy8pwnFr6KTs1kql2dsLCMqoC8O6sqflofEzbaW3QTB6EW24UxyQbpdsBfWOWgp0ACY9rW3weWNSRDdmSqAnkekt30cJYE6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYNFR1gwy7/ne+M4ClAiPoDt0qwYe46y7VYjrxt3XbE=;
 b=d94mGjvfnbl0dfrZnBBd84z4b01l1neh2gghx/Xwd4vr92CEAmXfUmlLThdIM06TAnUc/XjwlvgRZfnuoyhGIVFGuEN9O/EYddf6S/vE8sFI9fppvmG3AlRjX/ZuhrRg0ROLYN5qPbo6PK6vSJN7K0x8xCXBQu3E9Xq4e6E7PRhZZqjyOl8ix7B0AhRBjcbSEUqwv+GZPv351zJll5rU/PUTRiUrVHvTzHC/rleez+kHfSqvxpke6GXtEQ/HffyUoLA8jnf1TgsZM1OJw/+i9mkijkKzioZHVL74MSM1a+qHuue+JnBZ/Zbu9x9L4D5OdhAN28SU2u77trj3REFHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 14:56:33 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 14:56:33 +0000
Message-ID: <fe93e452-e0db-4ca7-9be6-7890f4e6d54c@intel.com>
Date: Tue, 8 Oct 2024 20:26:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/26] drm/xe/forcewake: Change awake_domain datatype
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d60d31-003c-409a-2194-08dce7a96636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0RTNGFPQ0ZQcm5yZFpHTnMvZzlFLy9yWm5VVDIvZ2haRWVYZHZaaWxqUFBa?=
 =?utf-8?B?Ynk0VjRNYlpZL3MvUDF3bzJNaWV1UUVTaTZxWjMxeXZUbHVvamFNOEVhbyt4?=
 =?utf-8?B?dTFRNUF0ZEszSFB3a0UvOVRlL1dJaHZqRUJ1ZVQ5L3hOY2JYNzRrR2U5ckRV?=
 =?utf-8?B?R0MzV0ZVVlBtTTBHdmJ0c0h0RTlvMzQxcDU4YVVRTXJKZVVIak5TVzBLcDdo?=
 =?utf-8?B?Z1JVOW5RdCs2YjIzSjlNb2txOHJLNUNyTnpuaGpobzduUmhUVUIzdm11Mkx3?=
 =?utf-8?B?WHpJRXZ1OGx4ZVo0MVNXdlhTMjBDcU5LanYreGRNVWUwaC91OXFmallyVDJE?=
 =?utf-8?B?WmhWeVhZOG9hbUpsaWMzdVNUSkpkRkFsVHJUK1B5NjR5cHRvbGhKNzZST24y?=
 =?utf-8?B?SXBFOGNEaVlTNkh1TGZiN2lYQ1YyOVZ1OWpWUkZ0dWFmWTZsK0ptYlJIV3NX?=
 =?utf-8?B?VmZ5eXhyTnlVUThvVTBhd2xIeEgwQVhnZjhZcmFrdG0zZW90L2tJWWRQTzg1?=
 =?utf-8?B?NUJLNjBNbUtEbXlCYWZkZXJadno2M3lYNTFWeUZNK0hVVWNUUmdsWkhKMnRy?=
 =?utf-8?B?bkMwalBiS2Y3QzNlQkM2Ni8rWS93M296TGFtanowZFp6R0Z1NWVucm5BM1NO?=
 =?utf-8?B?RGFYbUhDdCtmNVQwbDlROSs0c01xTXVEdlAyTFJCcHAvTEtUb2JqbVNZdklY?=
 =?utf-8?B?dUdSMGFaZEU1MXk2RDlIVlVYREdEZXowdkFqL0ZRajBQRnVtNnVFY3p0Qk9Z?=
 =?utf-8?B?ZVdJZlpCZHIxQUR5UFNHTTVZcmsvSGhTN2xrcE5CUmJsa0FvOXVlWnBPeHVs?=
 =?utf-8?B?ODdxaFd4YXR4UUdFRTYwUXk4M0RvTk42NGNTSG9YNlRpVnoxSjRpTlYrdEli?=
 =?utf-8?B?Smx0Qi9kTXIrRFRVN1NqZy9mR2MvdExIN1RCQUVGNW1sbTVsOWtRT2tqS1pl?=
 =?utf-8?B?WG8vUVdJTlM5TjdKd0toelRkRlZITEZkSzIyOHdjZWc1VnpFT2lRN0llWm9K?=
 =?utf-8?B?eVUybGVxSXIySTU2cTd2eXNocGk1Vjl6eWpuSEI4amhPaVpnSlBPQnYzMDBB?=
 =?utf-8?B?Y3VlRHdYNDU2QWFHNnQzZTA1SmI2SjFCY29ZU0RKRWJqb3pOTG5Ka1FIczNE?=
 =?utf-8?B?bmE1M0hlWHJESDc5Rk1XajhodGpXSlp2cDd1ejJvbEJQTEJUUGpEbkpFZ055?=
 =?utf-8?B?RnlaRFlNeUZDZzdBdDN5SlNMQmsyMHVjdGNwdm53UW1HazRIMWlIaUJmYnl1?=
 =?utf-8?B?SGJ3RnpodVF5ODNUQXFiV1BSM1ZVN25jNlNpY0NleEFWUGxERU93NG1MdTRS?=
 =?utf-8?B?OUkwVzVQN1p0c2s4MXVqTmM5aTdreENGc0VMU28yVWRrcGlYMDRYbTN3S3JZ?=
 =?utf-8?B?OFo4L2ZMYmNHK1N4NUttb2Fza2ZuWS9PY2RxSDBpSjduc2tmZDl4RUt1Ymx3?=
 =?utf-8?B?R05zQ2lYUGhjYWRyNTRrVGdMbmtlcDVNTCt5VFFWRExlTCtKc1kwTWFQa0xS?=
 =?utf-8?B?N1RmNExsMGVLeGo0R0wxOFZ0RUFZZGk2NWRuS0hTTFlVTEQ4OWdlU3FGMVRI?=
 =?utf-8?B?V1IvMFhGbXVUb3h3V0d0RHZkT1FZcnlndlJMS1lXS21xQnBkTHNOc0R6Ly9O?=
 =?utf-8?B?M3EwK1M0VWpCeDRSTWx6QjlSc05WWFQ5S25pSDcyc0IwSmxYUUJDODBHZnFV?=
 =?utf-8?B?OHRpUEdxZ3pwZ1VNazBTYW9xTE1tZzlIRFRmRnFWbUkranNRVVoxQ0ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXV6SU9wNEdlajZaajBmRkRGbU5rWGZsazVOb1NVVXNkZHRENDB6R1hBdFd4?=
 =?utf-8?B?OHFKY0JaMytOT0c2Mjh0MVZ4cE55VEppaDg0ZGVjSytzNnd1RXczT1I3RThH?=
 =?utf-8?B?UDNhVlRMOElCbjB2YWFIQU1YSmdMam9KZ1pkelkydytIcnZJcnpLeGZSWFFu?=
 =?utf-8?B?MzBST0lIcmhtNXBkSXVPMjNNUWF1K2dLWXA0RmUyWG5DTjR2SFhXM3NSTFQ0?=
 =?utf-8?B?ekM2d1VmSmpZNkhES2pYU1VOeklabjN3OVJsNVEzN2VvaEg4U3NMQm9ONE9B?=
 =?utf-8?B?QnRIWFpodGQvQ1lDMGxkckhoUnRhWHhJNWN1SkMxTWM1NnJ5dG9hdXRscDNx?=
 =?utf-8?B?RnNqbnRocEtQUWh3T0pSdWtCUjlrYWFIUHR1TVBJT05ZdUtkazZtaEE3dmdk?=
 =?utf-8?B?UlgvQjVRVVBpM3Z5am51OWNKZUNCdXFDZExCQ1hoSlFqNGd1UFlZTTB2L2tY?=
 =?utf-8?B?Qm1UOE5JZlJacWVoQ0I3eWxaVUhYOGFqRGk4eEs5RGl4cjNzc1NnSE10NXp2?=
 =?utf-8?B?YTdSbUNvYjYvN3NpaXZheSsrVWtIdk1zSlhpZEl0RDBVWTlrWEtWdXNUMzJC?=
 =?utf-8?B?QWRGdVBWcjdGdXJDVnFzVkpkR2RmWDNORXdxRkVCM0pnSWt4alU4d01MUmt2?=
 =?utf-8?B?U2pWWVA5Smo2RU5YRkg1UTRHUFErM3Q2NXpqakFaVzdXWlJ0S28rbW5jaC9Y?=
 =?utf-8?B?UVF0alNuLzdPckNSSmdNN21XZU9NY2drWHZ6Q2d6Vm1YSmxzMTA3TTlrTFZR?=
 =?utf-8?B?OGVkeUpscGNxdk9VWExvZmFOTFdsazVMWUM4dC9GSHZZQUorMkFOSzZNSENu?=
 =?utf-8?B?N1pxTlE2WHMzeEgyWldabzdncExYRVRwb1lYQXNTMFJzUFNYMFRMQ050dHhT?=
 =?utf-8?B?MjA5SWc2b3NoTk9XcmZyOVpZM2xMSDA5c1VhZXhvaW9vTTRadFdTRjZ2U21H?=
 =?utf-8?B?UW1JcXlZTVR2Qk1LanpYZldJck9NZXNzbmxuZzZDR1BacmIrRkFqRldhMnQ2?=
 =?utf-8?B?ZzVqQzR6am44VnpJNWRCMmc3S1F6aytaQ2NzZG9nWSthZFdFbXdVdHdoSWJ2?=
 =?utf-8?B?YnUvNnVoUHR5djZmRzBrWVFDY3NuRDV3Q0Q5OVJEWHp0SU1EdldoZ2kwS0Na?=
 =?utf-8?B?eUxUdFJJN2krcGJOUHh6NUJNaTk2N1RHRnhUVHBKOWpvbFd4ZUJYKytyazMw?=
 =?utf-8?B?Rlh2SDNrMFZoSHRkMkFGNkJ3RG42US9lampPQkRHNk1SQUN1WnRoQXhQWEpt?=
 =?utf-8?B?Mk44L1NDR2wxTW1HRU5WbjRCS0xZM05uemZ6QTM2K09sMzRDWVNlYjFFVDdh?=
 =?utf-8?B?Vm4vSGM5dmdQNGl1OHo4NEpvbFdJK2pIbE5zZksyZlRnVTV6MjJTUnpDeWZy?=
 =?utf-8?B?Rk5OOEltb1dWYmcrOFRDTmt5UTBuajdGS2NvVklZS3BrZ2lKVzVMNFE4Yk9n?=
 =?utf-8?B?VW8vN1lKN1ZvbCtDTVc2SUxicmZvZUlVTGxlS3JnU1lGM1FoZjkwMlBPSzZF?=
 =?utf-8?B?blUwNHFENUJybjRkdW9jVFJkSGwzTDgxR1pJc01zUExyNmp1K2hLK0M4U1ZB?=
 =?utf-8?B?UkJIVkZKb3FUK2FadytKVklJQmpyUFVNb0dlbis1RWFJNTRtSXVNbHFNNjVY?=
 =?utf-8?B?R1F3a24yNjA3bDBUS1hWQ3h3MHplRW9uQzl4dlJNOHZINmNqQmVmeWR1V3Ns?=
 =?utf-8?B?NWtmaUU5U1Zka0xmbzJCWEFaYTdPblZGS3ZZSWVCbG4zYlVsdUNaRUVLSzZ5?=
 =?utf-8?B?Q1ZqSTRob2QyU0srOHJEcXVLUHEyTTFoRUJRSVl5TVVSK2UxVURmSlJYZlRp?=
 =?utf-8?B?Y0M5TVJ1eCtlaVl3MHlLMDNCVEQ1UGlCb2JqWHhGM1pNelVjYXowdVBJR05B?=
 =?utf-8?B?V3phbTkzVTJ4MCt5cTVJUnNFNTlQYmE2dFlUT3I3SE9hZjJtekhRb2hjZ2Fm?=
 =?utf-8?B?Z3BPRnpqYWJPdG9Va3JlRUZsN2JtVXd1a2RKd1YwRWhjTXlqQjQ1NGFIMWpM?=
 =?utf-8?B?MEw5YTRGVHlGald2T09TL1gyNzJtUEVwRUhYc3JSSVViVmVYZXhjTkIwSU5p?=
 =?utf-8?B?c2xna0FLbmV6TjFMb1FQM3poR1pDQlY3Y3pPUkZiSmk0V1JDZFlFbm9KeXc1?=
 =?utf-8?B?ZitaY2U3dG0ycnVwNk90SStJY042NGhvbWxlMC9Zck5hcytNV0tkbjUvdzQr?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d60d31-003c-409a-2194-08dce7a96636
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:56:33.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6YbA9bhMyzcj+wkyQaKKMm9XWWjLCZKrLkp6uDmjKDSVmFntkmb+PXbhnFPGqfcIgIsM3iK+ZH/VOA1gbz53g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> Change the datatype of awake_domains to unsigned int to accommodate
> values that differ from the enum xe_force_wake_domains.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 494240777d03..fde17dc3d01e 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -78,7 +78,7 @@ struct xe_force_wake {
>   	/** @lock: protects everything force wake struct */
>   	spinlock_t lock;
>   	/** @awake_domains: mask of all domains awake */
> -	enum xe_force_wake_domains awake_domains;
> +	unsigned int awake_domains;

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   	/** @initialized_domains: mask of all initialized domains */
>   	unsigned int initialized_domains;
>   	/** @domains: force wake domains */

