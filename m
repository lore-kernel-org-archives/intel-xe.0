Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA77C83030
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 05:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED5410E13A;
	Fri,  4 Jul 2025 05:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bw7dWjqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BECE10E13A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751608752; x=1783144752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uQvfHqovVYQew6yO0BC1lIzbd2neSkU3WV6E7OvHgto=;
 b=Bw7dWjqR50CEVmFU33qqxTxubvTSuOl+x77buihpL3Jg02oKlDn1PJiv
 7O3UC6cubF96Lg4Ei/FFqp53Cip6WG7G8EkBcy1faD460hrc2hXCQb/j7
 TKGsyjO6okzqK3I+uJ1/W2+RPezzId8scFQW9hnj1NBjh/jiFjL10x6Pa
 y+0qSutiFZepA12JUom8/St3xLNOkyqlDDWtVmpO/jO6QYWKU2Es/ex/9
 F6jOGUhQ5/ghNBH0OdKnViqL+Nx5KcVYgmahdswRA1rSQbYJSnxZXjfTa
 Awq3rmlYqR+arl+TemctiQJvRnx2O34xiVvVeuWUds67JG1xlENRI/Ja3 Q==;
X-CSE-ConnectionGUID: xfwr7BccQueG8CFFiKTIEQ==
X-CSE-MsgGUID: BpKEg0/qS4OaOwQbKwIaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53163556"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53163556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:59:12 -0700
X-CSE-ConnectionGUID: Wz257MYrSsiXMMBJGs8Shw==
X-CSE-MsgGUID: q6K25D1BSoeDynK2JtJyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="185584147"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:59:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:59:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 22:59:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN0U+uSPIBvN0tuElzdkP2cvli8f/qm0KdMH+oB8XbKQR2ZNgjs0AM1LfLHL25yED7i3zJLt4Q9808eoSH/Nhtu+80vd2f9Lm2k2x/Sa32CN0dqt1kS+JOZ6HxGDoHb9XFdAFN7eEMoevk6x7U4SxTBdTQ3js9TOR9Y++Yi8o62l6TPOdnJQWA1oxvPZ2SeC7MeoOtDW+ufxFZnebCGMNJYmNbGHqn68hUHv15Lz8mIaEYq4PO96W4Hqh5w/tYzQ8rjuL/yv6e6sglfSfpiGOzaSZfKtOeMK+P4X0w6vnG663bIjylgEUZx9KhWlE5U9QMDDnaJ0++guREKfAYAo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiBuEshcKOe4U7BUGeLWcsol5TwIs6d92AygJ5fsZxY=;
 b=NU11VHBr/+mQO9IuBFkAvBhfaJiNzCm0lft+W72K+kutUYBgSNc0I9JkrvmzDk7L5LXY/UELSmxmwhXe2arGIoM1TDgzKoK+0wTz8OSxFqzc6wZZj1vd1F9vaQfnjDdWCHfkmqni83oQrLRt5aAjiI45pAFReUFtcqURTE0BLwrI9l8CGziLLcGalo9+DA1oagOuiAW/eLxNVpJy7SP4JVAsgmrnMdbLdWIGRmWyzgEIqAcam8GD5HeAorKw0XeV3/gw6n7PPGAHZoUXNwatnACgjRREPUqFd2DkKXsyxLUZcyDbSwKXJLXce0ggdnbgKoee7NQl3rheLZIyLDMZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 4 Jul
 2025 05:58:28 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 05:58:28 +0000
Message-ID: <4bb11be9-76f5-45b8-934d-33d8d323bd23@intel.com>
Date: Fri, 4 Jul 2025 11:28:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Expose fan table and voltage regulator
 information
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>
References: <20250702143909.2443100-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250702143909.2443100-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 032434f9-7012-48b4-515e-08ddbabfcbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWlyT3FrQ0JxbVlCL0FCeGRVN3RXbVRSZWx2NEROZUhBSHRoczRodUt2MjU0?=
 =?utf-8?B?VHQwVkF5bWJUQ2Y4MG14OTM3aksraWxKSGZoZFRHSlRkNWcxelhCdCsrazJ3?=
 =?utf-8?B?bW11MCt0bEgvRkNHQ3ZCUnE4dTB4aEowZkN6bEsvL3N5TVgwblcvYWRZQ2VI?=
 =?utf-8?B?VWhhQlUzYUJabjZ4K2dOMHpiME4rdXkyVkludW1EcG12NDE0Wmo3SkxBTmt6?=
 =?utf-8?B?OUE3Q3oxdUNRR1JEeDdEajhTaFI4NFB3dUtFTjhTc0pILzErOGhJeWFBUmx2?=
 =?utf-8?B?Mlh1UkgySkN1V2J2LzhaejlwK3gyR0hVSjE3TDgwTnV0djF5TTkrVlR5by9P?=
 =?utf-8?B?TDA1d2t1bUNSZm8vUGRHVHhoYWV3dFRXRUQwR0c0Sm1EcjdVdGRRZnJlc2xC?=
 =?utf-8?B?Skh2K3JvTkYyVElLMXl6N2ZBdjlVZWIwYTRqclZMSE9XOG0xeHkxWGJVNW8r?=
 =?utf-8?B?a0RIcVhMYWQyaHVhYUhaeWpkWll3L2xiS0VHNTJRUjFSVWlKSFByYVFXN1lq?=
 =?utf-8?B?Y0pwbEw5N2dvcEtWaFRLRWxSd0QvVWU3VGMwTVd5MDhzTkhSN0xlZ3hPWkkw?=
 =?utf-8?B?UEpyblBoMC9zY3ZoY2ZmMDc0cTg2YUhQSUMzdTE2V1JVaERSTE1KUGUxbUkr?=
 =?utf-8?B?QWZrbzJqYWx3YTVJbGhkUEhHdjlPeTFwUlQvV29RaEFRSlpQR0htcjJWWHpy?=
 =?utf-8?B?cURvSldGMEh5bXVaM3ovMjcrc29xckNqWHFBZVgzT2tMMXptU3dTaHhmYVNp?=
 =?utf-8?B?RWhHQ055YWlERnUxL0U0OTA5U01SQ0pLQjU4VXlYMWFlNHExVEYwbGFRVnl2?=
 =?utf-8?B?bzJqcVorc3hnNmFHRThVckRKQnVUVkQ1TmJtclhTL3ZydVRBZjIzaEwwN2JG?=
 =?utf-8?B?NS9HMjdnSmF1RENpeVQ0eE5tRWZhZU9WQkdlUFJLdXJUNHRIQU1Bd0JoT3FC?=
 =?utf-8?B?dDFJb3NsMk5aSTFFZ3FBNjVkekJnOExpTlFma3QzWnFsTnJ3QU9EUkFobnJF?=
 =?utf-8?B?T0ZVZ2NhN3BsM3VLZlJaMkw5RDNsRWdDWmNtRENEV3MrZjBsSkljdGhZczdx?=
 =?utf-8?B?UGRHWGUrTGJYUEJPbTgrdk52SDdPWXpoS3YrbFNGVVhyMjJYK2FDZk04Zm8r?=
 =?utf-8?B?SjRyekpvRzBrbXV0OHp6d3J6WW5mZ2hyZms2S3Q3YTJRVWUweHczZ0grek9q?=
 =?utf-8?B?ZllJN2hqcFA4c3FYa0FTSng4NlJJK09iNWdBYjNSeHBQeFRQanNiSWNmUkhV?=
 =?utf-8?B?eUViZjBPcEFYY3VUdXJkWVBnejRCN3NaOGlVSnRSWkM2Nm94OEFGK1cyU2JM?=
 =?utf-8?B?dWdVMGkrRUlQZkMzMzdUZ2VkRXFvOGxueEY3aTk0RHRneFRBWm1VUWlla3hN?=
 =?utf-8?B?czFSOTdWQU5hdFdtQk5tUEthc3FDakJDRm9ZaEYvMUV6VXBzSCt4OHZDZGwy?=
 =?utf-8?B?VDRSUnhWNDhuZHdYT1M1UDQ2QU5QRHZVMHhSd1V1RUV3eWF4aVJCUE0zL3pp?=
 =?utf-8?B?TllLUGJiTm52enk2eFhvSFdTQ2xWR2o0MjgvMko0Nmw2N1Q3d0FmbC9uWUI0?=
 =?utf-8?B?T21mVU5saW9CT094OURraHEvTUl6Yk9LY0o3dkdoOWpjVFduNGUvMDY4bXdM?=
 =?utf-8?B?c2NpNWZXSzV1NGFISXRKZ0w4YkVKb3JtYTd6TDBXdlBKSm80alN3TWN3ZDJ4?=
 =?utf-8?B?ek9uYSsrejhnU1JQdld6Y2QzVDJsVTVRaFh2Q0pNWkI1eUQ2MXJtVld1a2U4?=
 =?utf-8?B?WlRDMUFueERiMTNmV0drUkNZd21RbmVncXJ6RUpRUURPcjh2bFpmdmxnOUtM?=
 =?utf-8?B?bTB4amdZQlZRa3dXOStPVXQxMmRLb2Q4UXg3YlpLSGpQRDBzS1dGdFF2SFh5?=
 =?utf-8?B?alh3STFTK1VCclJVeXBERHU4RlFWT0lBQjZML2dIVFkrTkpQcHBpYUJLemR2?=
 =?utf-8?Q?1i0DObx5I18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVd2Rmh2QjVaZFNZVE1KWEVHbmt6bnV5Z0ZUc2RQTGFQMWF4bGZURGxMMndh?=
 =?utf-8?B?RG1WRmJ6ekdlK2RvSExFazRwY2llczVxVjJnSGU4MEkvZjlOVTFnRC9iTzZy?=
 =?utf-8?B?VGcyeFNZT2JRWXYwSVhpdDROdEQyTTFnNjNlME43R0VXY2EyR2VNOWErUkw2?=
 =?utf-8?B?aWc4V0Mxd0RPVjNnUUt0OFpRL1JvMzNsZ1dUdHRHbE5BOG1tVVp4eHlKR3RZ?=
 =?utf-8?B?enNSUkJGT2RlK0VqdWJWbjFmR1haMkIwR1AzbitGdXVWTURhTjg0RmJZMXRJ?=
 =?utf-8?B?ZCthRlFsVDVtWGtEelJLNXpkakdDbUM2WXJjVFFpd1FVV0NDenJET3M3T0xC?=
 =?utf-8?B?RTgrMFFBeUlQQys2cnNSR0NDSW02UzBieE04Zk5mQkJnTnl0ckVZaExqN2di?=
 =?utf-8?B?aG5BVDVUTkhVSDhpNUg5NFFWZlZqSFNwckVrWHdRSjgxbTB4ZzJ1WUFPejFt?=
 =?utf-8?B?ZnN4RXk2QXNrVzFScmFveVA5T1A4RUhVNzFNY0F5SjdjYVRlaStFNVBHcDE0?=
 =?utf-8?B?MjZzNmR1ZFhjVmxPV0FuTHltbDRjWDJVbmQ5NkJBMVhCV0VmTS9Ya20xVDEz?=
 =?utf-8?B?VlM5N2orcUU0d1pGTzRqMU53bEpJN1BacFNMdG94OTBvRVdZdmYrS0pGL1dq?=
 =?utf-8?B?QXlWMW1JRlB5SDdYL1JZeXVjZWV0TkdEaCtEdjlKWXNWSkh5SXk2YjU5c3Er?=
 =?utf-8?B?clhUcEJSN0tEOWljNGQrYjl5Nk8xdExHejJUY3JISkJCNGl6aHJEMnowOENs?=
 =?utf-8?B?SU82bm9DNnoxakk0dEdFWnVDUCs3SDRCN0ZYT1lDNWFhZFlvM3ZpOGpRN3ZZ?=
 =?utf-8?B?NERPMlBKZGZTTzgwWkR1NE5xSTdGSmV2dzBHZ1NEWW52eTZnZmlmS3Y0YzVk?=
 =?utf-8?B?QXRLL0lxOE5SaThndU5YZjJRTUNYOXJ6dlJIQWJhSDZXREJOT0FwOXBTQkxL?=
 =?utf-8?B?REdJRTVmVUpQU2YyelV2TGdMeTY5UG9xQnNUc3N6WTlwd05rN0dlb0JPY1kv?=
 =?utf-8?B?c0RJMWJZYy9ac0dydlBrRWxOSEwwUlF6TXZvbFRJUkptUmJ3eDVXMnRMaTBt?=
 =?utf-8?B?Y2hLQTR3ZnRnTjUzRnovZ1RVSFVyNllOcnExcHVoVlZzTDJmV3RqZGcrcVVC?=
 =?utf-8?B?YjlDMlU2d3RvaUdmdjBGbVE0aWJOdWRvRUZZRjBpcjdUQ3Z4TUg2YkQ4L2d6?=
 =?utf-8?B?a203V2p6Wjd0c1QxRUZhVmZCTWt2Zk1vR21ObXdSS2h3YVc2RnlXZmF1SU9U?=
 =?utf-8?B?UVNEemlTSHBWbG5wVkNrNXh4clEwOVFiUzZVTXRGdE54RVpQR0ZrU2NrTVhY?=
 =?utf-8?B?U0Z2Szk5WHBoUXVaZk45TjJKaGp4ZlI3eTFEL2Q0R0RoTFlETUhhaFhNYUJk?=
 =?utf-8?B?UmZmMVUrUG0wUEFkZGcyQ1dmWU50R0phUFhVY3hyME9rYWdmMDFrdmpQTWox?=
 =?utf-8?B?NWxyZGltV1dnQndPa3VqcWJ1NnMvTDB6b2Z1RVE0aHlWR3NRSXdsSXozR25n?=
 =?utf-8?B?K25qRWEvV0NjRk5sdG5XNVJNMVM3NGthZHhMVG5IM2FxMWtzekpsbFZFSWdo?=
 =?utf-8?B?Qld0d0diMUdBaXZuREZsTlhIZHpyMlEwNERYSldaV0o2TDdxN2VIWUhMK2dr?=
 =?utf-8?B?cG40QjRjTXorVVFCai90V1kwaW1rSkJ0MkNqTk1WMElDOEhtaURSamM2Zy9m?=
 =?utf-8?B?ditCWTVTamhVK2VBNnJpZXhxRVFhYVJNQ016VWMzS0VUbzdJRWJpUWNOWXds?=
 =?utf-8?B?c1pRWGxDY1grSzl1SXlTRklMVGduUTdaRXgzU041NFg4TG5jQ2YrcUFONGFz?=
 =?utf-8?B?ZVA3VU01NldiVklKaXl5UmNpa0pTVlVvZENkZXdFcWdhcjhRc0UvMVZ1T09S?=
 =?utf-8?B?ejNKemVsT3NvaCs3cFhDbXhYWkcxYVpFbTl2RXJuOFIzZmZKbmJKMlN1T1lS?=
 =?utf-8?B?V3BIeHlrbEkxN2d5RldyNjFmSzE1QzlZenRobnA5bnd1d1Exem5OYTJyd1BG?=
 =?utf-8?B?TkcweHZhVnlldnR4QmNBMHhqSFBmTlpmUVNidjA2SVFTQnRBQVJObFk4Qlhw?=
 =?utf-8?B?SVhENlJXa1ZXYm9Ta0VUakNUUlpyL1pNcFBPRkx6a09zeDR3aDBPNVhGZVRk?=
 =?utf-8?B?SHVKOHZIajlnQTlWOHBGS29mbVIwSkVUQWtyVjdyQzI4ZHp5d0pXTCtKS3Z2?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 032434f9-7012-48b4-515e-08ddbabfcbe9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:58:28.2253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGzrs52oO8rhoSvnWSSoto6u1z8gnX8wLGPb8kvhKm3bmgQkAh10Iuh3GRmK7kDygs17CQfIrmgClV4KLQLwqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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


On 02-07-2025 20:09, Raag Jadav wrote:
> Expose sysfs attributes for late binding features which provide information
> about their support, provisioning and bound version to the user.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 120 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h    |  11 +++
>   2 files changed, 130 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index b9440f8c781e..58e68270483f 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -24,6 +24,14 @@
>    *
>    * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
>    * which vram save/restore is permissible during runtime D3cold entry/exit.
> + *
> + * late_bind_fan_info - Fan table information of the device in comma
> + * separated format as ``<supported>,<provisioned>,<version>`` with optional
> + * ``<version>`` field which is available only if late binding is provisioned.
> + *
> + * late_bind_vr_info - Voltage regulator information of the device in comma
> + * separated format as ``<supported>,<provisioned>,<version>`` with optional
> + * ``<version>`` field which is available only if late binding is provisioned.
>    */
>   
>   static ssize_t
> @@ -65,6 +73,110 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   static DEVICE_ATTR_RW(vram_d3cold_threshold);
>   
> +static ssize_t
> +late_bind_fan_info_show(struct device *dev, struct device_attribute *attr, char *buf)

Lets align naming with xe late binding patches.
%s/fan_/fan_control
%s/vr_/voltage_regulator

> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_CAPABILITY_STATUS, 0), &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(V1_FAN_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(V1_FAN_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(REG_GENMASK(31, 16), ver_low),
> +				     REG_FIELD_GET(REG_GENMASK(15, 0), ver_low),
> +				     REG_FIELD_GET(REG_GENMASK(31, 16), ver_high),
> +				     REG_FIELD_GET(REG_GENMASK(15, 0), ver_high));

The version format is major.minor.hotfix.build. Let's define macros 
something like this

#define  MAJOR_VERSION_MASK          REG_GENMASK(31, 16)
#define  MINOR_VERSION_MASK          REG_GENMASK(15, 0)
#define  HOTFIX_VERSION_MASK         REG_GENMASK(31, 16)
#define  BUILD_VERSION_MASK           REG_GENMASK(15, 0)

> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(late_bind_fan_info);
> +
> +static ssize_t
> +late_bind_vr_info_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_CAPABILITY_STATUS, 0), &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(REG_GENMASK(31, 16), ver_low),
> +				     REG_FIELD_GET(REG_GENMASK(15, 0), ver_low),
> +				     REG_FIELD_GET(REG_GENMASK(31, 16), ver_high),
> +				     REG_FIELD_GET(REG_GENMASK(15, 0), ver_high));
> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(late_bind_vr_info);
> +
> +static const struct attribute *late_bind_attrs[] = {
> +	&dev_attr_late_bind_fan_info.attr,
> +	&dev_attr_late_bind_vr_info.attr,
> +	NULL
> +};
> +
>   /**
>    * DOC: PCIe Gen5 Limitations
>    *
> @@ -151,8 +263,10 @@ static void xe_device_sysfs_fini(void *arg)
>   	if (xe->d3cold.capable)
>   		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>   
> -	if (xe->info.platform == XE_BATTLEMAGE)
> +	if (xe->info.platform == XE_BATTLEMAGE) {
>   		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
> +		sysfs_remove_files(&xe->drm.dev->kobj, late_bind_attrs);
> +	}
>   }
>   
>   int xe_device_sysfs_init(struct xe_device *xe)
> @@ -170,6 +284,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>   		if (ret)
>   			return ret;
> +
> +		ret = sysfs_create_files(&dev->kobj, late_bind_attrs);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0befdea77db1..6cb7114bb5be 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,17 @@
>   #define	READ_PL_FROM_FW				0x1
>   #define	READ_PL_FROM_PCODE			0x0
>   
> +#define   LATE_BINDING				0x5C

Let's add PCODE_ prefix here.

Thanks,
Badal

> +#define     GET_CAPABILITY_STATUS		0x0
> +#define       V1_FAN_SUPPORTED			REG_BIT(0)
> +#define       VR_PARAMS_SUPPORTED		REG_BIT(3)
> +#define       V1_FAN_PROVISIONED		REG_BIT(16)
> +#define       VR_PARAMS_PROVISIONED		REG_BIT(19)
> +#define     GET_VERSION_LOW			0x1
> +#define     GET_VERSION_HIGH			0x2
> +#define       FAN_TABLE				1
> +#define       VR_CONFIG				2
> +
>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */
>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
