Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77998D12D4F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 12:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCFB10E120;
	Wed,  3 Dec 2025 12:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h97MN+kT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1970110E120
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764763996; x=1796299996;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+8vl0Cwc0pFPCZRDDZHHBfF3um6FdZ83zfifRUnLkSA=;
 b=h97MN+kTN4GCveb7okyKRaSam0rlO1yehbGJR6GlHn0SC93ZEPhUHitr
 9hDQGVypSsNTyF41xZkj25Ic4K9cmwZrsPNIeCgBNL2atFN/75OylOcjC
 W3Cb9bizeWZikQqqvySKm4iHCbsnjIr2rl8jjVdaDTcDUwxlYeDQsDkuK
 fqK4YZRlATn7Hca6f5Chazod+JhuSVcuFBySLllOMpyT+JhunyqkJjQtM
 IkxdzjMFAlOEHCes9TaUaLPlThz20zxAepkqc19I/vKwH2nFiIKCtYbV1
 iXAINKZT9SDY5aWOm+pc+XTx247AWTasJo2Oy2eOGt76OKwBCZo2IXWuo Q==;
X-CSE-ConnectionGUID: eeM6ZR6fQY6lKl+in67CuQ==
X-CSE-MsgGUID: TpTfD9CQR3GoR/0PkKRH6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77377151"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77377151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:13:16 -0800
X-CSE-ConnectionGUID: R38XJ7srS2e4flzyfNRf9w==
X-CSE-MsgGUID: V/oJvABqS3q1w1cBO461uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195454828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:13:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:13:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 04:13:15 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:13:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2VNuWODuvRQteZ5A81V1YSUMFPKAzPoeAbsRWQhQxVFuQQBQ1wFTuozhnmmKIZVZAuetlwbzxzNGT6OVyMd89mR+VvaiiYrDMyAQ1E2r+3MUVA7u7bM2awuXH9sAVtZ2T72zZpqOeKZE3T5AyeZtWpQr80CcFJZ5Z47cJZgRMw1T//B3opcHGd9fu5wHDFnzh1HTnhUj7zVVhX7LRztIlMnIq+QEKWZyshN2+luag8nYB8B/EY9xtpOrIxPsOFtg/hhdAC5t4ieei5UyJg/tw0Yz1SUXsDgMNpIZqhYDOJhn9sGwQHq+0B78AAYcPE/MYXBNbfMOmeVkyLxxQNSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8m/lYEDiTCmJo1LfzhsSdM5Vrug/coFTJqKG7bt8/8=;
 b=gdcGN6e8tuD2YbNCZtV8ZxY3aauilVShkFRNTWpuRsRqkX8O7xsvXY1tkzPXXVtYVNVEzvSKq3ZBuuU3DdSC1DUyJnGhovM++0gB2HuH9hUuO7QEEMzn1qU2K33IhXIY0wf5+KfKgP9ApYEZHuZFGNhLbdmPkuFA9KFiJicpQqOmBiE82mVtTamKtU19JSYgsb39PIcR2q47LEPGh5nTUes++avhVd2vb7k3rCVLsBCtZz1G5evt4MfFUoliISbbH3Xdy+ZLT+0tH0xhh2hyotuBFlp19UIS/1QZNkZnk8Skw+sMdKf19vGph+n7vpROaFLcRTpDRLRcgrYYB0s6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 3 Dec
 2025 12:13:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 12:13:11 +0000
Message-ID: <b93b6b26-651d-4565-9833-d0114147496e@intel.com>
Date: Wed, 3 Dec 2025 13:13:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20251128171759.2775650-6-naresh.kumar.g@intel.com>
 <39541b74-2fe5-47a7-bb97-76e3ff4799ba@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <39541b74-2fe5-47a7-bb97-76e3ff4799ba@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0037.eurprd03.prod.outlook.com
 (2603:10a6:803:118::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7bb7bf-d0ae-46a7-11ac-08de32655424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTUvRm5rNi9xZTMxYktDcmlyUHM0OUU0TEp5WEFmOFpqQkd0TEhlYTJWQ3ZY?=
 =?utf-8?B?dnVoTms2cG5ycGhrcFp0NlZVZTBGTEk5YkVBY1psMVdidElMek9OMGtIMk42?=
 =?utf-8?B?aEFYVExRVGIyOWpINmxiV0lnaU5QUGhWVm5RVy9QR2FQM3VrTy9rb1AvR2Fz?=
 =?utf-8?B?ZDJ0NUYvVFMvTkxHUmFEaTJESEF0SEdqVHY4bExYRDUyK2tRak1tcDZaWWMy?=
 =?utf-8?B?U01wY3ZNbFB3a2w1WVY2K1I2eXdNQTQvYWEyM0xoR3kwcStNTThaQjBkYmhK?=
 =?utf-8?B?QUhTdkFYN25KUVcrUmUrdFpHY3diS095TVlTUmcvODF0eW9lTUd4Tys5UUpD?=
 =?utf-8?B?azY3bm9DME1vUXVHV1ZSQXZaVGlseG0wRWpZck41K3hzOW9LdUk3aXRSZXBm?=
 =?utf-8?B?TTdvaVE5OWRHcEtwMTVzY2QxNmNVSkh0UzFKQVByT0U5RkNudzlMZmdScDIv?=
 =?utf-8?B?czRBSjljempTbWk5TnQrUHV0dzYrOXNlV0RjOTRqcTBUTnVkQ0JwaE0vQTNX?=
 =?utf-8?B?UGhzTC91L3ZFY0NzaTh5enUzNW0wRFBabmZXaDFzVWtrQVc3N1I1QVZiZU9L?=
 =?utf-8?B?NktLN25SbW90Y2JFQVRiV0pQeUNoaTVBdFVCWkVyeWE5cHAxbm81TFNrZWtw?=
 =?utf-8?B?VXppRzMzUDN6anZYMlhncEZ4TmJoM0RFRjJ6RkhtN294RkxPKyt5eEFldXFw?=
 =?utf-8?B?WmtCeWJoc2ZjRTdFR081cFpuWGIwTEdXR1RPVFpGa0RSS0RjY1JlbVlaRnNq?=
 =?utf-8?B?TlVRcXQzR1FPL2wxTmpmcnkyOEJrTnlFOGFQbUlTbkZYSlBrRGZKeE51dzkv?=
 =?utf-8?B?Q3BueGF4MjdDb29LZHRhbS94cGhTSjExKzNtMEdZZVdVaUxzV09MRHpYVlRw?=
 =?utf-8?B?K2J4VGoxQ2h2cFlscHdEODhGUTFtVFkxOEkwcnVXR0xGTGxRNi9jL0NvNkI5?=
 =?utf-8?B?UDRGbm5RMytFT3dkdXBSODFCcnhSRVVvSzlMcGcxVmtHeTVPOThPQ3MrR0dR?=
 =?utf-8?B?QzMyZTVTSldwMnRyUGw1RytJbloveUptYVpNSEZjT1l2TkcxZ2Zab1BBWWwz?=
 =?utf-8?B?c1M3bjNDUEtWeXNJWEhHWWpoR3NkMXlTNXRIZHNDaHF0Y1JDajhyWTdxWVhr?=
 =?utf-8?B?S0NtY2QwZi93Qkh5RHN5OEVneVpycnZQTHBDYkQ1RzE1YXliQ3JKWFMzYkov?=
 =?utf-8?B?bW4vQUVManU5eEpwUWYyUmYxeHFGZm9uU1U3R2dHWnoydC84WElwajFocjlE?=
 =?utf-8?B?ZUN1RkRKN3BQbXJCSldZV3MyNUFVckI2NVRlU3Fxa0I1YVgrcDg0QUpVQ3Er?=
 =?utf-8?B?K25Sby85QVM3bTQ2ZDlvdHU2eVc1VW1ML2ZJS2tIalgyY2J5SzhFV0JoZHEz?=
 =?utf-8?B?Y1FucWs5VnJTUEcyUWhKMUNKWEs0MTZNYnFXaHErQ2ZZYjdGNXhUUENYR1JU?=
 =?utf-8?B?Tm1CWWlJbVMrREZLL2RDR0FLbmdWYWFKcVVHUjJhTWRYbWVwWVdHbkY1Nkt5?=
 =?utf-8?B?L2czbHRnWmJKRFlnaFArVFJ1R04zckw1ZjdRUWllalh4UGMwczZKUVY0SVMr?=
 =?utf-8?B?NHZkTTlOekI1QXBQWi9Kck5XVjlNMExlZ0NTTmUxc3ZYYmprOFltK0dOSFVy?=
 =?utf-8?B?SmZ5YnpEOGN3T1lpVGxQSWdHbmFZeEp1YlAyVXlZc21ETElXNSthV1Q1anR6?=
 =?utf-8?B?YVpHbG9nMldKanlXR2cyVWx5dzlOQUovbGZTY3ppOVlteVBFektrMzVkNnQr?=
 =?utf-8?B?dk5YM0RyT08xQkZjQ1QwbDAydHdqRk9pMkF6MjhUWG9YclNjNVM2YTdhejBr?=
 =?utf-8?B?Q1JCVWo0Sm9iazNmV01UZlUwK1dUdVBzejNYNjQzT0QwWVRQSzFLOFppVUd0?=
 =?utf-8?B?Q1J1STBtd0RxcVdod1NhYjN0eFhXTFVqcmVuNHdLRWVndGhiWjhaT0g1NHUy?=
 =?utf-8?Q?gDg/BNkJy1mzI/J0KwzksMaoZwVbJ8ob?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXlVeUpJbFRzb0JiQVl4YWZMY1dPY04zb3NkM1MxT0ltTzdjMFRWaHJLbTNi?=
 =?utf-8?B?aXpia3pnU3dJNUJ3ejBDajE3MGNVUlZOZDhXT2YxalBtQ0wzalpHNy9IM0kz?=
 =?utf-8?B?YVpWN1J5N0V4aEwrbXNNQ1Fkc1A0VENvdUlFNWdUeHNtWjNLazB5VW9kV2pk?=
 =?utf-8?B?N3lPaW1JUVhoN0V3SlNmWEp1ZDB1RFVDVU4xNkE4UE1qNzhkNDRYaDdJVlVn?=
 =?utf-8?B?bGg5Wjg4c2VicEhMT3lvbUJlazcyS253Q255ZkxMVzJtenJaNmNjOCtOVEg1?=
 =?utf-8?B?dkoxZk1VdGl0M2tkNitBZ0loMUt4RWVIZmlTYkN2NlRkblpSZHh4WEdNdTJp?=
 =?utf-8?B?NzcwTDRLbGhVMEltVU1LWG81eHlQVytLNCtCdlFYR2hZdm9HeEY5by9zcUtl?=
 =?utf-8?B?ci96Q0dvdE9TV0FwdHNtcCtiQW9GQzd4SlBTWlBIV2h3a2QzL3N2clhSdjEz?=
 =?utf-8?B?NXlYUnc0b2xUbUsxT0lVWDVxdjhIR3NmQVN6dzdtbWcxWHg3Q3lsdnF0dVJV?=
 =?utf-8?B?NDZvUXIxWjhBckhaVDBZbE5KZmUwVExkalhxTk9oRVExV0lwTTRoL2RkSlMw?=
 =?utf-8?B?NnJPaDJxT2hHVnNjQ2VwdEx3NmI1Z0xEMWR3QTh6NHhVckFtVThjUGNEdS9K?=
 =?utf-8?B?MjFDdkhJU21WcGZITkM0RnJ6Y0JPcmczQkdzemRhNXJLRGlnZzUySlM2Zk56?=
 =?utf-8?B?eFdkbnkwbldUdnlmT3dnK1BYdTVBQlprQ05wWjBRREVEQ0Ztb3dzQkUrMC84?=
 =?utf-8?B?ZnpIQk81bUpyNVhidTJObVRjQWVFOHByY2RRZzljWnR5M29jczdUbG9QYlNT?=
 =?utf-8?B?U2VuTHhiYnZCTlB4ajRwQ1JlYTVkeXFkMjErSHFEdlJ3WmgveHUzQmk2N1M1?=
 =?utf-8?B?SnZIamlaK25BVDRRUGNuaHdPQ0w3bllFa0M0UnVwV1pUbnJmQmFHdG9LaUNm?=
 =?utf-8?B?RWhNR0RvdzNCR01WQk9yYklLanpwSDFranZMbHFhTEVXdEExQk5Ibzk1T3c5?=
 =?utf-8?B?RkVlLzhibytuYmMwVzJIcmxMVXJZMlJrQlI2TExSR0hsaXdOVkoyTWNyeXE5?=
 =?utf-8?B?aHRWSEc1WFp4SHY5b0lNNVo3MzQyNGQvMDJlK21DNmhxT3pzbDI1YkVZUGtk?=
 =?utf-8?B?THYvZzFyLzFqaEx4aE1OQWpoOVd2MU1vWjgvK1czTEc1ZTE1WjNpTUxSU1JN?=
 =?utf-8?B?d1pVWEtjM2tQdm9iTTlVbTY1eHk1elFKblRiT3hJYmhWRi94TVZGK3lNcERC?=
 =?utf-8?B?TGhONFI0TXdCSFU1eXBtL3l4RHU3RDFvV0phb0VuNllFZ2tXTnYrVW4xRzRC?=
 =?utf-8?B?R29DNXlXdjc1a2hqZ2FCQ2g3QnlQTWpvakZYZitTYUNvNmFYdFNHS0EzTk9P?=
 =?utf-8?B?ZnZJVnZEb3ZVZ1VZbUIzZC9DWnlJWnh5RWVRS2Rvc0N1ZHdiVlJQZmJhejhG?=
 =?utf-8?B?ZFFnWFhLY09aSVFCbDQwWnZ0bVl6eHhNR2ZlQ1cxMmhOa3R5VVg2Nnd6OWhK?=
 =?utf-8?B?ZXBVSmsvL3JQTW40a053eU9KcEhsM3dFamdOVklqV296TzYrSWtnSEdIN3FD?=
 =?utf-8?B?U0tmVW4rZEdzT2tMWmRweEM5czEyd0hLditGYVBsUUtmL1BGM2VQNEtySVZz?=
 =?utf-8?B?ZUdlUTVhUkFkOFo4MnNMRzViSUsyTTEwMHdZRjlNR3ZqeWhkemdnZ1BLa1BG?=
 =?utf-8?B?STY0N2dhWVdVMDFFR2s4RlVVdUxKU1I5bFRCRUZOYlcxVWJISkFCekZ0WVVG?=
 =?utf-8?B?bDRIay9XSmFzbVJFZmNlSGRodmZHaThkd0RxaS83Z3JoaWJ3UWFYdlpMZWFH?=
 =?utf-8?B?Y3cxQzNJWWxZWThtQWJRajhhQTZXNzBRZHNodE9XQWdIMUlPSDVZbDM2Wi9S?=
 =?utf-8?B?NmhOM1F4UXdISjdvZmxyNDFwaHl2R0pQSmhqSGt3d216M0libVdqNml6dnRV?=
 =?utf-8?B?WlA5K3g0ZGdNSkZra3NZTHFmMzdLMjJBVEVpbXY3VkRRaDRNVWVCLy9icnVJ?=
 =?utf-8?B?a3FzdGVCb1YvT3ExV1lxK0NYZC96cFVkYnV2UEZ6V3BFb0dqRHlCWktoNVFN?=
 =?utf-8?B?NGhlNmJWdm1ENkxiU294bUFSUXVPMFVOM21WT1ZtUTdVa3cwUWRGS2pibzBP?=
 =?utf-8?B?QyswQmlWZnZUelpmaWltRVpsU3ZqMVVTVUd4WTRWcXJIVE5ucDJhMk0zaXc1?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7bb7bf-d0ae-46a7-11ac-08de32655424
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:13:11.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43wqwofYs4TG3AHdLyjcHn1/disjpSrPN346st0m0GVi1WVQEHTuLGxoYVIBw3R5aP0Ak0v51nOA8dylPSng1cvqsroOrO/XO9ZLRvCFq5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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



On 12/3/2025 9:52 AM, K V P, Satyanarayana wrote:
> 
> On 28-Nov-25 10:48 PM, Nareshkumar Gollakoti wrote:
>> Due to SLA agreement between PF and VFs,the alternate CCS-mode
>> cannot be changed when VFs are already enabled.
>> Similarly, enabling VFs is not permitted when the alternate
>> CCS-mode is active.
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
>>  2 files changed, 57 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index e146e00b0ca2..6652c468e1be 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_gt_sysfs.h"
>>  #include "xe_mmio.h"
>>  #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>  
>>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>  {
>> @@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
>>  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>>  }
>>  
>> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!IS_SRIOV_PF(xe))
>> +		return 0;
> 
> The ccs mode will not be enabled for native mode (non-virtualized mode) with this. It should be something like
> 
> if (IS_SRIOV_VF(xe))
> 
>         return 0;

actually above check for the PF mode seems to be correct since below we are
going to call a PF-only function and it will assert if xe is in native mode

note that while the naming might not be ideal, these two functions prepare/finish
are just to handle coordination with the PF (or more precisely enabling VFs by PF)


> 
> Same comment for other places as well.
> 
>> +
>> +	/*
>> +	 * We can't change CCS-mode when VFs are already enabled
>> +	 * and we must prevent enabling VFs when alternate
>> +	 * CCS-mode is active
>> +	 */
>> +	if (xe_gt_ccs_mode_default(gt))
>> +		return xe_sriov_pf_lockdown(xe);
>> +
>> +	return 0;
>> +}
>> +
>> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!IS_SRIOV_PF(xe))
>> +		return;
>> +
>> +	/* Allow enabling VFs, if CCS-mode changed to default mode */
>> +	if (xe_gt_ccs_mode_default(gt))
>> +		xe_sriov_pf_end_lockdown(xe);
>> +}
>> +
>>  static ssize_t
>>  ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>  	       const char *buff, size_t count)
>> @@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>  	u32 num_engines, num_slices;
>>  	int ret;
>>  
>> -	if (IS_SRIOV(xe)) {
>> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>  	ret = kstrtou32(buff, 0, &num_engines);
>>  	if (ret)
>>  		return ret;
>> @@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>  	}
>>  
>>  	/* CCS mode can only be updated when there are no drm clients */
>> -	mutex_lock(&xe->drm.filelist_mutex);
>> +	guard(mutex)(&xe->drm.filelist_mutex);
>>  	if (!list_empty(&xe->drm.filelist)) {
>> -		mutex_unlock(&xe->drm.filelist_mutex);
>>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>>  		return -EBUSY;
>>  	}
>>  
>> -	if (gt->ccs_mode != num_engines) {
>> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> -		gt->ccs_mode = num_engines;
>> -		xe_gt_record_user_engines(gt);
>> -		xe_gt_reset(gt);
>> +	if (gt->ccs_mode == num_engines)
>> +		return count;
>> +
>> +	ret = gt_prepare_ccs_mode_enabling(gt);
>> +	if (ret) {
>> +		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");
>> +		return ret;
>>  	}
> 
> The function gt_prepare_ccs_mode_enabling() never returning non-zero error if VFs are enabled.
> 
>>  
>> -	mutex_unlock(&xe->drm.filelist_mutex);
>> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> +	gt->ccs_mode = num_engines;
>> +	xe_gt_record_user_engines(gt);
>> +	xe_gt_reset(gt);
>> +
> 
> Do we need to apply gt reset after changing CCS mode? If yes, add a comment with why do we need it.

note that this is existing code/logic

> 
> -Satya.
> 
>> +	gt_finish_ccs_mode_enabling(gt);
>>  
>>  	return count;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> index f8779852cf0d..53a595b0882c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>  	return hweight32(CCS_MASK(gt)) > 1;
>>  }
>>  
>> +/**
>> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
>> + * @gt: GT structure
>> + *
>> + * Return: %true if actual CCS mode is single mode, or
>> + *         %false otherwise (CCS in alternate/multi mode)
>> + */
>> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
>> +{
>> +	return gt->ccs_mode == 1;
>> +}
>> +
>>  #endif
>>  

