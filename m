Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56809C52D54
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 13:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DF310E96F;
	Thu,  1 Aug 2024 13:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYxC8zhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5D10E96F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722518183; x=1754054183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=If3xpNpCjyTkmPgLxXvPI2SxAv3SvJTUKM347JjSN1Q=;
 b=QYxC8zhMY0m8OCswIasG0MR1ObpZno7bApngKLIXOBba21IKkDMYJANp
 6E7Al6b4DTUPml/6br+t8evcrdE87vxu5SmU8r6hU+MXWUroEzXDXidZ+
 fuFtnbPxy4ZZ7FAtfUjJFgI/gqPgoXr3Keu5xQyKQIplRYMLACBzhmVLZ
 DipprhmZGfyjJ4MVUC5YJchvV4EPHEhc5ytnSWXCeFFJLHob9Nw2Wfxg0
 7MuwqQY4lkGVdfkVPqZu4U8dy5iciFc0K8VQELyiqtxYNIpjeHjrOauu7
 MUUrFJyLy/dpcrODpcHF8KFKyJVOWAAwoYBxuW/nFMkLWY5bBQecVizGI Q==;
X-CSE-ConnectionGUID: VeWySZAHTmSkkC0p1CuAyA==
X-CSE-MsgGUID: 6qjja2skRsWWPmy4rBSdJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20624964"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20624964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 06:16:22 -0700
X-CSE-ConnectionGUID: 64LrQ+k7SJOqHjrOjhB1OA==
X-CSE-MsgGUID: WaPFIsVVQC+9AcfbEFV4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54696528"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 06:16:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 06:16:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 06:16:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 06:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hr69SpMEefO5PmMvy73AJGqAAJHK5/OWaoNKf+Qeh+3SThipQpnvfTar+fEyoGt6/U3pJZzPsDXa8RCibTzGMEn+ZScOrQQUerV/h/pcTdjGE3PbPtiTMHAzcC2J/00k0pVUOIMBPLVwX7F9dzQLMv0HUsaPWbOeuE/AO6xf11y4p6sb6UymgcwGZ5ZcTCiQ0um5ct1nomEmVaINr0QfSxGd/cR5Hug3a4ILH4xwcZzbr6ULCVKrM9GLQF5j3VnWdpEkJ+qbi4Bd1cx55Awv3PMta7fZefkT9BWJmC/yvQITFbU4tVqf6giHK6ngD51M38UOJNa/SD+Y+snZ8SFLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPaCVFWV0w8uR+7+wAv2BoemseIT1nJjq92W+DOKxJU=;
 b=Q9YebUfFbsXd7lSh0rXW9izI09iLtrh6T7xWd5GUpJMEUXHKhNrzOuSfxONr8KcYv9H+dysmalecrEjUIwTaQDefQvkdmHM1mFQ36Kuzq7V1MjmO0oURj6Km8FNO8J2kgm9I3r4IBBSy4VGegkkW5DerXpQYS/qSZrJfDAvfBiu2pJY7kXAsP9QZs7cP9QgNmHn5pchZpj98WEoH+tml9yOkd0t9bO9LMVGVmmgr2dx5CclXI8Gf+UAwQxHG8LKOPOTvcmh1VwOr3bKOuGw+f4+fkpmlMsGyMCxDkaLq973awihEkxNKAou8Ngg9eerz4bo0wMa51fYM6NfzNm/Gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 13:16:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 13:16:20 +0000
Message-ID: <bd7dfd17-0052-4176-8977-5b2b3bacbfad@intel.com>
Date: Thu, 1 Aug 2024 18:46:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-3-riana.tauro@intel.com>
 <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d33c1f9-9356-451a-6261-08dcb22c222b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTZRbldOQnV0NXhmcHdTVzg3cmgzTk9BZHM3TDlaVTMrVDJabkJzcllUbEJU?=
 =?utf-8?B?b0JiaUtNUXlkZkdJL29yMXRBQzJSRy8zemxieit5U1BWdDZQMHJia1REemNJ?=
 =?utf-8?B?OGcwQ2hzTnFLN0VhZUdlaCszQjVjYzNydEhRU3VVQ3hFTk5NV1NJSmY5Q0Zv?=
 =?utf-8?B?Rm5NNzVTTUV6aGg5eVBhMU1CZDgrazA2KzY3RWRReVNtSlZDbW1Lalh0aElG?=
 =?utf-8?B?NGRvVlBHa3NlRmhUc3Q3NC9Da0FLU1BIdmFDTEdTaFk1Yko0QVo3N0V3L0xB?=
 =?utf-8?B?M0lXS1NTcUlldVo4T0ppSDY0Y25jWVNIOHlCVHhrUER4V0lxTFZ0bnFlODFy?=
 =?utf-8?B?NWxpQnUwK0ZPdjJCSGc2dHk2eFBDeXNTaCtrQVZ0WDAvc2YwQkRiMlFTWEk1?=
 =?utf-8?B?NG9Dd2JSc2Qxb3JTUGRRb0dyLzJhSDV0bW1nckJhVkw2YktNaWlZdmdoZWtI?=
 =?utf-8?B?VWtYZGJ5MUtBNVNmSVhua2pLSnNSSmwwcEVqY3hZK1hTd3JuQ3dENC9RWm1U?=
 =?utf-8?B?Tk9KV20waTNZNDJDbWtjS2pNV0RuQkFPUmZUdWRXWVhVK1lmaVdjQmZmZGxX?=
 =?utf-8?B?enBwRUg4TEhjREk3VTJKYWlFakRRSnE2blBodTFtREhjQStkVU9RWmt1aXRv?=
 =?utf-8?B?MXB1TGIxSlVmaUdpVmxnRlR4ZnlxY2plcVBpMGg3bkwrQVlJOUVlVkFMdWlM?=
 =?utf-8?B?eDcyaExlbHQzUVRiVzdvNE9LWHlPZGZiMnRxSU9RcjJrWjNPNWtialNUT3Y2?=
 =?utf-8?B?WG94bzlwSExudldWMUxSckxmRFVFbDNrUkJpKzMrVjVKY0FnYURGOEwvMjBN?=
 =?utf-8?B?Tjk0dWhKWGdERWx4N1hOOE5DZW9zU2xCR2dGNUtsYzZDcEorRHFRTUI3K3E1?=
 =?utf-8?B?eG1TdVdIZ2czS2U0S3ZsQmxoVjVJbjJoSlF3SVA3cmFSN2ZZWUxLQUxodmZE?=
 =?utf-8?B?aHYzUlRDdTQ4aFBtMVAvK1hlMHVGZW5uRCtleEM3aEVpZTMrM3ltYkllREpM?=
 =?utf-8?B?VzI4RzBJV0cvS0tuZ3ZoQUtmcHdKRDhoQ3RWT25zM280OEtwT2oxcmxWemFs?=
 =?utf-8?B?MnRuUkpPZzhmeWJyTXJHNFIzei9yTGUrOTkrMjdQQ1hVRFVQVnkwUVlGQ0di?=
 =?utf-8?B?WnJvb2tIS3RnQ0FTMXRHdUpPcitNUXZvU3JjQzhFZ0tZNUxSNlBDMWxHUFJ1?=
 =?utf-8?B?eEZsVDBDR3hGcDJORjF0blhuclZUT3BybVBhVDJ3Zy9qRTJXZk5Nc2orWEVo?=
 =?utf-8?B?MWRGR3YxNUFkUWZSTThZSTZKOTBYcGlDRGJFdmgyVHBNYlRYWWpZQndlQ3lh?=
 =?utf-8?B?YVROd0tzNGlYWTFIaTJkeGZ4VmVUaGZwYjVORGFJSzhzK1ZuWFRtalYva201?=
 =?utf-8?B?VklHSnlRaVg1c2MwdzhFcUhSRWx5THJzN25TL1ZjQkRtS0ZteW9qUmlqV3N3?=
 =?utf-8?B?YjNyMW8rU1pZMEdac2R3bDMxRTZ0b2N6b01oSHN1cm40TE9FdkhyTk9lVFZN?=
 =?utf-8?B?WThZRmhVK09aaHlneUxGMDFmL3VvRGpvaEpCRW1kYjEvU2dmakYrUGJuZ1JD?=
 =?utf-8?B?U2RvaVRpeHU5ZFZJSmE2MWUvZUZHSENuWEJrYUNhR1ZKK0g5cVdxUGQwZ0gr?=
 =?utf-8?B?NHFFazlVYW9PaVpOd09ocGMxbHRkdks1TkxTOE5WOVoyQUhuQXM1Ni9zTGE1?=
 =?utf-8?B?Zy9wRzk1c0ljRUdITnNMSjJQNWQ1VHg1bnhhcWhpNkxzc1VQRXhCL2ZEL2lV?=
 =?utf-8?B?T3I3QkdpNG95cUpKd3ZqNHdORFY5cnN4UUN0ajVqL3NEVHFuY3lLQzcwaUpE?=
 =?utf-8?B?OGd2Q0NGTWhjdzYySnk0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tMZUhUa2ZUUjQ3WEVrbGFGbUlvSjVkdTZ5cjF3ZG5NYWQrSGgySCt5ZER4?=
 =?utf-8?B?dmhGTStCeHhYa2JPQ1gyRGE4eDRybndIZGF6ZnJzWW01Qjhub3NNSDJRamZh?=
 =?utf-8?B?WkJmSjNMUlNuelJNdllzQ3l3ZTJSMFNIL0FZZ2laWDlsbGxOVHg3ampLUDhl?=
 =?utf-8?B?RFMxZ2hycVM5bmkzZm1hWEJ1QjQ3N1IvL1AydmIzc29EN2FQU0REem9kbk1m?=
 =?utf-8?B?VUJPcEtudFQxa3IzUDJxV21mWHZyRVFtN2ErNFlpQklGUmVlS2VQQ1RPZjZX?=
 =?utf-8?B?eDl4V2hoYWUvQ01EMGdnUmFBZEpTQ09hUm1EUlBNL3hpbW5rT3BMWVBIakJw?=
 =?utf-8?B?ZHY5NmxoamRtVFgyQzlSbS8zUnlQRXNuSGtUSDJZK0Y0Q0syZVduOFBkV0Rn?=
 =?utf-8?B?blF4Y1A2bGVPQUJ6RldRQ3ZsWFBXM21qWUZEb21WVnl5aGI4QVQxQnBYaVRJ?=
 =?utf-8?B?WjVMSDNOMWtHdzVFWGczN3dKQ05oN2NyclVTZGwzbE5wV05GTHpveEY2NFRn?=
 =?utf-8?B?TDQxVzBnVjFjUGVqaGp4SlhCWEVxN2RveUFLR3pEL3I2NnZkc1FwellDRE83?=
 =?utf-8?B?blNnOVl0OThYczB6UHlCVjF3MmpCbUR0ZXFxeTFSWDhBbDI2ekt1Wit2cllG?=
 =?utf-8?B?eXRZdzI1dkhMZjlZZWZYQXM5d1k3c2JYdi95VlQzV3NaWnVzM2QvNWhiZk9R?=
 =?utf-8?B?S2lXWUtNc0NjZndjVHJhbGliMVRuNmpYTXdCVGRDSFFBMUc5K1BVV3k3bkpo?=
 =?utf-8?B?aUwzOWJCcGU1T2Z4d1hmc2xTOFRoK09HeE1LZk5GQmJCa3NKSlV6YWNEQkR6?=
 =?utf-8?B?cmhWcHcxdW9ZeFRVc0NuOG9pWFp4TVltb1JXT3YyRmNVRURHUjFNNm1oZjZG?=
 =?utf-8?B?VTJSRWNicW9FUUE2R25FYlNhOUM2VGZpWThCWkRsRkpCeG5jcXJxVTFBRndn?=
 =?utf-8?B?REl2Mkp4WUN2eFlmVVU3RlZYMWkzU0JlSVlZR1haSDJFTkFEMlRmdEtteWdT?=
 =?utf-8?B?UVZrRFFOWUNMcFJ6WUV4MG8wb1VxOWdYS0YrbVdaRUJQcnJoYVQ5VjJUUlpS?=
 =?utf-8?B?TXZTNldjVmhmQ2F1NHBMU09ZQlU4Z0VPU0MvRmNKblFXNm1aWXJCRWl0TkhC?=
 =?utf-8?B?SG13aVI0aXZkTytnbDg2SldSRlRKNnU1NktuNzRuS3NhNHNXMHVjRGhNdEJk?=
 =?utf-8?B?VVJSOHlzRFJ6NTRtMlB2aGJSeWIzRWpwOTNJcVh1bGpJSFBPUGlvdVdVOVZy?=
 =?utf-8?B?OWgwMUFPbUxPSG9wOGZNWDJhcVZQRGpFWUFWcWlvVmZ4bmFmSDlSbjQrKzZy?=
 =?utf-8?B?M2xmdzBGMFVXdDNkUnZ1cm52ZjJnOHFGSXNCNjduSXY3ZzhGdVlieFNHckJL?=
 =?utf-8?B?cnMxMVRZVzlseUYxU2RGUm9WSDlSS25KQ0ZXOHlHODloSGxKaHpGNlpXcG9S?=
 =?utf-8?B?MFBMbUtTdVdGazk0dlhvTElveUQwdTROakpXOU4vV0JhUTNMMm5uL1lrYnRS?=
 =?utf-8?B?RWo2ZXBtZEtSVFVkdWRHcHFPR3c4elgrdmtVMTdQb2hEOHdhVnRVQjhZQ1Nm?=
 =?utf-8?B?MndNT0ZzTXVSQU9XYUUvMkVGRVZNamdITWxFbk5ROUkwV2VMbGZVQzdTRkdI?=
 =?utf-8?B?WXdlQ01QamppQzlsa0tLTWpId2ErZHBZb1VVZGQyUW5WUUZxeE5UTFBZVTJM?=
 =?utf-8?B?WUpxSzgwS3IvcC8zdklVZ1ZpbmNIQUJYMkV5N0l1TmExalhrZVBQUm41WTNQ?=
 =?utf-8?B?UWRRYlhtNFRYd0tEK1pYcDE3MDM1NHNvWXhrVEJwSSsxQXFwSVFJa1RHeXc5?=
 =?utf-8?B?MXhlRElvdHAwcVp6TnNHRGxkU25LM25wNHJhRTZmbnh1ZWMrUjFQMVJISW91?=
 =?utf-8?B?WHhuL0ZMWDl1T003OTA0SjJucnMzSWRGTURMTi9CWWpVa1F3ME9LaEdPdVVH?=
 =?utf-8?B?QXkyRS9rZlMwVjhxK1dyd2VFUnNTdlpsblU1OHljR25qMTdPMmgyVVhkb1Nv?=
 =?utf-8?B?VUhINVlmb1BKRDIyMjZoMCtCMU9xSFY3amYrSzdjRFRkTEpuS3F4TVM4c1V0?=
 =?utf-8?B?VGk2QVVyNlNlcDM2dElZUFNaZW80cEN0cy9rc1ptUnFIVGRWL2JEWmh0WnV6?=
 =?utf-8?Q?WgRSZE/Bn2mD61tOSgEcS5QPN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d33c1f9-9356-451a-6261-08dcb22c222b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:16:20.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r2ULh0eBGRmEQ5z9IThMz0q/0ra4MBIfTY/HuhsEmt2VV3sKGKNaQhfLiiIv/po9+wV1h4TqRURf0UuFZD/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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



On 8/1/2024 3:33 PM, Nilawar, Badal wrote:
> 
> 
> On 01-08-2024 15:23, Riana Tauro wrote:
>> Coarse Powergating is a power saving technique where Render and Media
>> can be power-gated independently irrespective of the rest of the GT.
>>
>> For debug purposes, it is useful to expose the powergating information.
>>
>> v2: move to debugfs
>>      add details to commit message
>>      add per-slice status for media
>>      define reg bits in descending order (Matt Roper)
>>
>> v3: fix return statement
>>      fix kernel-doc
>>      use loop for media slices
>>      use helper function for status (Michal)
>>
>> v4: add pg prefix
>>      do not wake GT if in C6 (Badal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>   4 files changed, 114 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3b87f95f9ecf..279d862c306a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -337,6 +337,14 @@
>>   #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>   #define FORCEWAKE_RENDER            XE_REG(0xa278)
>> +
>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0)
>> +#define   MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4)
>> +#define   MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3)
>> +#define   MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2)
>> +#define   RENDER_AWAKE_STATUS            REG_BIT(1)
>> +#define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>> +
>>   #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>   #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>   #define FORCEWAKE_GSC                XE_REG(0xa618)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..47e3a1ca2394 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>>   #include "xe_gt_topology.h"
>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       return 0;
>>   }
>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +    int ret;
>> +
>> +    xe_pm_runtime_get(gt_to_xe(gt));
> In suspend resume path I am seeing PG disabled and enabled. Will it 
> cause any race while this debugfs entry is being exercised?

I checked the suspend cases and the enable_pg is called before the 
print.  But there might be a case where we check the idle_status and see 
  C6 but before dumping it might be in C0, reporting wrong status

>> +    ret = xe_gt_idle_pg_print(gt, p);
>> +    xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +    return ret;
>> +}
>> +
>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       xe_pm_runtime_get(gt_to_xe(gt));
>> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data = 
>> powergate_info},
>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show, 
>> .data = register_save_restore},
>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data = 
>> workarounds},
>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 7188542aea43..2ab0eaafa7d7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>       return gt_to_xe(gt);
>>   }
>> +static inline const char *str_up_down(bool v)
>> +{
>> +    return v ? "up" : "down";
>> +}
>> +
>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>>   {
>>       switch (state) {
>> @@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>> +/**
>> + * xe_gt_idle_pg_print - Xe powergating info
>> + * @gt: GT object
>> + * @p: drm_printer.
>> + *
>> + * This function prints the powergating information
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    enum xe_gt_idle_state state;
>> +    u32 pg_enabled, pg_status = 0;
>> +    u32 vcs_mask, vecs_mask;
>> +    int err, n;
>> +    /*
>> +     * Media Slices
>> +     *
>> +     * Slice 0: VCS0, VCS1, VECS0
>> +     * Slice 1: VCS2, VCS3, VECS1
>> +     * Slice 2: VCS4, VCS5, VECS2
>> +     * Slice 3: VCS6, VCS7, VECS3
>> +     */
>> +    static const struct {
>> +        u64 engines;
>> +        u32 status_bit;
>> +    } media_slices[] = {
>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>> +    };
>> +
>> +    if (xe->info.platform == XE_PVC) {
>> +        drm_printf(p, "Power Gating not supported\n");
>> +        return 0;
>> +    }
>> +
>> +    state = gtidle->idle_status(gtidle_to_pc(gtidle));
>> +    pg_enabled = gtidle->powergate_enable;
>> +
>> +    /* Do not wake the GT to read powergating status */
>> +    if (state != GT_IDLE_C6) {
> How about if (pg_enabled && state != GT_IDLE_C6) ?
Always enabled so would be unnecessary check
>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (err)
>> +            return err;
>> +
>> +        pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> Is this needed?
can remove this

Thanks,
Riana
> 
> Regards,
> Badal
>> +        pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>> +
>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +    }
>> +
>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>> +
>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>> +    }
>> +
>> +    vcs_mask = xe_hw_engine_mask_per_class(gt, 
>> XE_ENGINE_CLASS_VIDEO_DECODE);
>> +    vecs_mask = xe_hw_engine_mask_per_class(gt, 
>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>> +
>> +    /* Print media CPG status only if media is present */
>> +    if (vcs_mask || vecs_mask) {
>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>> +
>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>> +            if (gt->info.engine_mask & media_slices[n].engines)
>> +                drm_printf(p, "Media Slice%d Power Gate Status: 
>> %s\n", n,
>> +                       str_up_down(pg_status & 
>> media_slices[n].status_bit));
>> +    }
>> +    return 0;
>> +}
>> +
>>   static ssize_t name_show(struct device *dev,
>>                struct device_attribute *attr, char *buff)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 554447b5d46d..4455a6501cb0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -8,6 +8,7 @@
>>   #include "xe_gt_idle_types.h"
>> +struct drm_printer;
>>   struct xe_gt;
>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>   #endif /* _XE_GT_IDLE_H_ */
