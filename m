Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E087F8A16F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 13:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E534910E1D7;
	Thu, 16 Apr 2026 13:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4zLs0tU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1F10E1D7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776344854; x=1807880854;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pV0zeCL1zOSv1XRtjMazL2L5HXLHSgys0laOUQfdYLU=;
 b=K4zLs0tUYmD+SIZrnUPRrdxFM3N2NapqniZwgni8GuYti7AbY3s1FH6S
 uBYyIYc8jWOwT57ikhSVADg8sVqh6gc4VQCc/4ImA2zgYT/t/euhsSwHO
 a+NeM9GMCy6TOmXLrOdgDUuHsSJ9KnQDLEvmfFJjKNBzf30w1BsXM/px7
 RjHnZirb8IDNpYYQ9sFUHMaAFsbre90bcKuyzW6Kzps6IRUxL1/H9dd4e
 zRAM1BbDRLgp5atm7yrm5kBwsmN5XRu4OeoSpex5TGQ2h2bVXT8hMEr7s
 lU7aXtfW9dzFrw+nAFkV2eoRdqeeb7eCk2hTx076xw9HWL6il3lC6N6yS A==;
X-CSE-ConnectionGUID: OLCTOSdiT+mxFlMffSoHPA==
X-CSE-MsgGUID: bfeSgwoSTyOMnCdDrqL2Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81222952"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81222952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:07:33 -0700
X-CSE-ConnectionGUID: Fmr1F70tQYq6W/AgRz0Yiw==
X-CSE-MsgGUID: ud3SNoRDQj+CoMitwXSY4w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:07:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 06:07:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 06:07:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 06:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOvnp6Obf6gAf0WeedhujEmCZzGU4W0KK/hJj3HeqwCNpU+3TJ51sO119z5WHvzdakUZBc877KTrJzZdk+iTPCzDL9NEFxUWKtuiCZ5rNNc85vTGGUvNTEsgBzapkbg1HpdI1VjoYPt4M2JFMKR+HtBymyY8bW0mXcgoQ9JS1R8OMbMUpGBGiuGLjQF06wq1Xu+6eTz05X7hw3G1posFcI/LffwSiS1r3GSS5Sk3hOwu25UoBslVjbFQ/ey9vEFE8XeMx5fcIYEwoGpm8NJFVGp21EXi7B83TTfbxrvVTsAxbnr8U7K2omu0byOmDqlShiJnllbwbEEfsnSAG6X9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7Q1kW/Yhs8xIWpD1rUAdHYbcizOIVzn1Goq15yNJkg=;
 b=cr+TcbfZCPJv5WGN0ovJYk/QgIgA9/MuOQyfOiqWo9LUp7w3pkClZ6RxkkHDCZ9DRRXOZZi7RWQw5CGemOv/9L1hSz6IN76hqkUmd6TqGg71P3dil5Sltq9auH4JM49qEqVEIXsgBKEBNAPu+HIOKQIV/srRenKwe6EpV8BNwK8+wXJJHD4CL0edklXNhacI79JNuWbNRkPPLwaRMkxLaNyYNKVTWQDIXIqS41x+3ml0LpOJOMtAeftulELlaI8L/P4KchOrsN3cPxztpocQVuscMqYOg6sfFXHNfknrrxYerslDfzT29K0EUrD5yVA7bpgIuZUC9YKsHKCmCWvaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 13:07:30 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 13:07:30 +0000
Message-ID: <14f6ff92-7f68-4d83-9d5a-c5587a3d0221@intel.com>
Date: Thu, 16 Apr 2026 18:37:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-15-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260402070131.1603828-15-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 736059c4-5468-4059-06f0-08de9bb91dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: rZ7vzXdVCb5OM0JDKiO1DMZIe6h9p2c8Ix9y/PYgOAmHYT9DgJM8cDyergPV/5YvIUKfwqbXR5Lfp6TBcHI2Wr38mPL1YW4EldnZMt2/ypUaXx/TH27HPBg65p7OoUviQmHuHQR+z14NSytdIdh2j9kzasz+u9utxPWUMOpjNLUKuwU8Dxmc4TKg/a3x8nT3mngJsbBM7TQQTCCOmVzufj9q1woQvlyyeWNjY+ZWdoPoCqcCq/qpXkkD3bF/ZaHUd3/t8lKyqX5q5X6+iMaV42V9x15z2GbDXj5L3oROrF00Kz3x31HR4h75vk01FlxuHpczcMCTgjArYQf7TJcrXYuJWkWmUpqYrMwGBGVndaY2u8CKwD+rzRsY5Nt7iWHwj9XWYw6kmRWd/yE9Yahz2PGNLWRRYT2sCmKfw9yzufSAcRDLhuGJmJtBF/KJZAe2OT8xcRjNMwxgi2pfKql6TQI//2+6g9OvBHfhhgxk+iY5oAP6dj3QTZ5wfDUFKgtrf2fQT/yKx7rxujp3Qw60myVetBDyQm27YQsIynFyzT7yeaP0MdteB23vBjQMaHbwNM55tT09kPn15NzOtK3TgzsTIK2cV6yxxHYmRSFWttbBoJj3REOczPgeGuKRw8bk3GdtE3oLT65B6ZdksHM7n5wBIXUkFp4ydlO0r0febdzMtJDD1EY8jEwaVfLKHqSEtfZJYERwOltPAwD7p4Dy1O3xuHJIBLKQszxidLaH70M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5aUnlQM3JNZWZKSzhYWUFNRVVCZy9HVEJoaldJTllYblQ5UVo4ZDdkdVFK?=
 =?utf-8?B?N25VeExMaTE1T2h2L0tlQklwWnJUamlnWGpsYVh0NVB4eUNsa0dpeGdzTWU5?=
 =?utf-8?B?NUwrbVYwd2ZCSjhXTi9QaUlObnhnQnNzRkVETzJqWEphWnN6UklDMGtRckRU?=
 =?utf-8?B?cFhzSDlrOWpMQWtrRUl4blBoWXl4dENzTHZ5S0V0S1lzTml0QWUrY0U0Ykd5?=
 =?utf-8?B?T092UzZodUkzcEo1QzBYL0hmcjdpd0RKb2o1a2dDTkFma005MVcwNzZqUEFB?=
 =?utf-8?B?Sno3RHhNaGdIYkRMNnBaUVZEVVhIWHJFSjJiU3FlcEp5L1VwZE1KTC96eFhx?=
 =?utf-8?B?eDVzOXBFclJJNmVXRTVnejBOTllrSEpub3NSNXh3Rm83RVFGZDZCbmhmSFIx?=
 =?utf-8?B?dUl2RWVqTWh2NUwwU1h2NXB0TWZHUzV4WDBSNG14dzdjVmM2emxuTjhsTFNL?=
 =?utf-8?B?L1Q5MEFtNWJjMDhRaTk3cUQzVk4zN1ZZdjUvS21DVHVDaXp1VGU4eEpmZitH?=
 =?utf-8?B?MFlEZEdueW5rK0N1NHViQXFBZWlycTkvSDJCNndTTHd1VUpDd2MwSDM5dzk5?=
 =?utf-8?B?d3BtdllaZUh3ZUFKd0Q4dElaMG9iWHo0YWxzbEg0ZU0zOTQyUkUvWU5VdGlu?=
 =?utf-8?B?bWsrZithMitLbmlKWVc1VTd3MXJsVXpvanRWb1FCNlNhZFE1K0xaTW8wREdN?=
 =?utf-8?B?bjdObkVFZ2pNQWxLU0pQNUZpWjRabW5CbTJlVWx0Wmg3bDIyelBkTnE0Q1lt?=
 =?utf-8?B?MlBmWnU0ZHdtSVZRcDVyaytIbWJYdUVlVWI0d0kxTzR3bitVZ3dIRDdqWGhO?=
 =?utf-8?B?K211bS9ldWg3dGtOZUhlLzFrRmhzMGNCUFI2RmZDMGRmbmdCZTRHUSt3TXVJ?=
 =?utf-8?B?WHFvNnFzbzJsaDdBSHN2YVhLT3M1MXN2Z0t5VXFicDl4QTExK0hHdW5JVzl2?=
 =?utf-8?B?M09QUjlUY1hVVVR3M29VNTd0SGpQWlRuNVJmdEQxUnpwTFNlMjZhY3RqekFV?=
 =?utf-8?B?ZFBZdytKazUyODB6MGdWb0NZdFVaY3Z5MHhFS3NnMDg5RVJuMFpqZFZ2Mnl4?=
 =?utf-8?B?UnVxMU9xVDFoWU52L002aU1MdS93M1NpbmRvNGh3enhDM3dRZWtxMzRleVBs?=
 =?utf-8?B?NzJRdThVdTkvOGJsWkIrVFAyQ1VZTm84ejlwNFpMd2VRMUliTThqd0NzQ0dn?=
 =?utf-8?B?U0ZFdXlPU0lRYWNPVW96S2JIakprNUlwMU1YSWw0TG9qbVk5TVhHeEU4Szk2?=
 =?utf-8?B?d2ZmZ0RrZ0NCaGt5V3Q4TkxtMFNRMW9vbEh6RmNjK1E0Z3IrdEErSUdkajJk?=
 =?utf-8?B?QWlvNTVWTGVCakRid3Y3R2FKbnVPWUIwVHpuNXpKSFEwM1hwUzFSa2h5Qjdx?=
 =?utf-8?B?ZlpkaVU5Tm41NWJtU0diTm44Wm5wUHRUaGVZL0d3QkR4YksyVHp4U3BwaHNV?=
 =?utf-8?B?UzQzMVJtNlhyL2EyY0ozSloreURkZ2NwMjRmVVpNb1MzYnl5ZEZLdWg2c1hO?=
 =?utf-8?B?RHl3Z01icnRvdzlWbWFvRVBDNS9tSkFNTGU0OUxCeHN3ZGkzY2tqQVZzNHN3?=
 =?utf-8?B?cndCaUpqRWdNSTUydGw5czNaWkxacDNNSzZHTXdRT1VrQUZES281MC9nYnZG?=
 =?utf-8?B?M2tZZ1o2RVdNNkh5Zis4V0ZzSVFKVThDcCs1YUhNRU1SSGszNDcvcUNUUkY3?=
 =?utf-8?B?SGFjVW9DK3M1Z0pRRjBjcWU4cjdMN09aZFlZVGVoYjMzYmdjYm0vTUlyNEgw?=
 =?utf-8?B?UWVjaWJsQTdJNGxDc1pranN0MkVacVFMcThuRERDUUthbU9EYjB6NGh5SGxX?=
 =?utf-8?B?Vnk2b0h5ZFlRQVdOM2tmT1lwQ2FWMnk0Mmdab00zb0dYbi91TEZwRUxTakdV?=
 =?utf-8?B?OVZEV2Vic2hVeTFYSCtqWVVheVFZSkR2aFBCb0pFOTd2ZkQ5cmdoZFp1VVpi?=
 =?utf-8?B?clQ2cGdmc25iMlNNckRaVzd2ZmM2ZlVpL21pRWowUzhHQjhPNk5ETmZtemJt?=
 =?utf-8?B?WnlaUjVHU1krdFQ5MlpuRkdFSkdVaEwyMllQZkZhV0pMYWVUU3dWQ1ZERFRF?=
 =?utf-8?B?bGN5YlNSZDcvSEZ6TStnR1l1OGNyNVZXMnZKVHN5ZE5kcFgvK3VJRnNpd1JO?=
 =?utf-8?B?b3R5dU9jcHRWNlJwVldXTkp3dm5odWpYR2h5dzZuZXdEWjJCWnF1RzhYbWlz?=
 =?utf-8?B?QkN5RWd2ZTRyb1VobjVOcy8wdDU5N2RpQ3l2ZzM4dEZtVHpQTEFNM3gyeWdP?=
 =?utf-8?B?OUR4ZHphT0EvS1RRa1hkRkF6dFExbEg1NTkxWVpCYTF2MkJ5Q3ZYcDVaNC83?=
 =?utf-8?B?d1JzTzJGOFp2SFhyWUNJa2RrTjhQVWRxczZjZGZoY2E1bk5IcThVb3poV28r?=
 =?utf-8?Q?PJJUO23hnUj3KbgY=3D?=
X-Exchange-RoutingPolicyChecked: KzSi/GyQp1sgUXsbiioIJEoyV9NzX7oym4uQrA/NNEHf8VNDFwC/qWh7/+yDpSHHdR/RKTU4WRrlzQU6QaB4zFqY07jbWDBX8Q7Xnr4RNxQ1qjvUzQpJfiZ5gwChGqGdePpvASIZH/dLuXAKyC5RiNmmpbwUJpevXF/0MSUW2pJkxhCN+O4PgpcmZFcObQRsz58P54CekvHt/Mxeqg5yxMIN4q40WW/XettJM1i6KrXuaKz8H7Bi0QRaypliwq//MqxODtpEz4st45mpcgmWNuzYzZcshWGNOUKZK8DDz31225NfXmgBivj7ibMGWQ25imHo+KwlhO8DOgtYodWWPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 736059c4-5468-4059-06f0-08de9bb91dcf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 13:07:30.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vfv/y86KlssfkXjsHpEKFa/0DDb2tOoJmyJt3X6KbnWZPttjWU9pT+5TB0XZ9x3+3tSXXIK/MQef7PcR8Jj/J+fBJQDx5oBWwM99WeKPa9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
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


On 02-04-2026 12:31 pm, Riana Tauro wrote:
> Add devres grouping to handle device resource cleanup during
> PCI error recovery.
>
> Secondary Bus Reset (SBR) is triggered by PCI core when the
> error_detected/mmio_enabled callbacks return PCI_ERS_RESULT_NEED_RESET.
>
> Once SBR is complete, the slot_reset callback is triggered. SBR wipes
> out all device memory requiring XE KMD to perform a device removal and
> reprobe.
> Calling xe_pci_remove() alone does not free the devres allocated.
> Since there are no exported functions to release all devres, group the
> devres allocations and release the entire group during slot reset to
> ensure proper cleanup.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>   drivers/gpu/drm/xe/xe_pci_error.c    | 2 ++
>   3 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cbce1d0ffe48..d0b29d94edd2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -440,6 +440,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent)
>   {
>   	struct xe_device *xe;
> +	void *devres_id;
>   	int err;
>   
>   	xe_display_driver_set_hooks(&driver);
> @@ -448,10 +449,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (err)
>   		return ERR_PTR(err);
>   
> +	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!devres_id)
> +		return ERR_PTR(-ENOMEM);
> +
>   	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, drm);
>   	if (IS_ERR(xe))
>   		return xe;
>   
> +	xe->devres_group_id = devres_id;
> +
>   	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>   			      xe->drm.anon_inode->i_mapping,
>   			      xe->drm.vma_offset_manager, 0);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c9fe86b670bd..c89e2d31583c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -497,6 +497,9 @@ struct xe_device {
>   	/** @in_recovery: Indicates if device is in recovery */
>   	atomic_t in_recovery;
>   
> +	/** @devres_group_id: id for devres group */
> +	void *devres_group_id;
> +
>   	/** @bo_device: Struct to control async free of BOs */
>   	struct xe_bo_dev {
>   		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index cd9f39010278..28b2f4f7c24b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -64,6 +64,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   {
>   	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
>   	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>   
> @@ -80,6 +81,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	 * requiring XE KMD to perform a device removal and reprobe.
>   	 */
>   	pdev->driver->remove(pdev);
> +	devres_release_group(&pdev->dev, xe->devres_group_id);
>   
>   	if (!pdev->driver->probe(pdev, ent))
>   		return PCI_ERS_RESULT_RECOVERED;
