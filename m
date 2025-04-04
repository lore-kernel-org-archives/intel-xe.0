Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72397C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 10:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AC310E025;
	Fri,  4 Apr 2025 10:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W05Oe1zy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E66510E025
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743761046; x=1775297046;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XCo1svn38Al7/a584po3x2J4zvSkK2Ke0t+UO89Lzmk=;
 b=W05Oe1zy+sZA9rsOwVKiGcMK7+ZgKw6d30NklZWDlrY6vbn8lZNwyBtQ
 yX5PqzN1b1mescF+PNKecPLb8U1gfgNry3KFizGSQHG6I4RxYF94u1Lpj
 sqD9EYFM43IUHn87rpgQmxOx88SBPPHFYWk/k8mGXAHsu3MrY+ruiXLyj
 mBLX90L3mwVjhhGlvQTJRrnIKwdPpPdn4eD2faTJnZsddcE6fHdFq81SJ
 WzVzUroCtZYqFr+GHX4iif9H9XaHJQh1HfCrIkTx9shz6woJC1Gp2qgQF
 Z2IPYhxH81a2utktM4Ya563LJxhtT1jxerbHPBequsBp46L3G+0rDagdL A==;
X-CSE-ConnectionGUID: AedUrx+ARxu7S5HEEtnj/A==
X-CSE-MsgGUID: Sko9vHYsRp2R3mmKtpa48g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48849881"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="48849881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 03:04:04 -0700
X-CSE-ConnectionGUID: IXKDMIFsTCOM0WAHvNN86w==
X-CSE-MsgGUID: 69V+70BiRzuFEEfknUtylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="150479162"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 03:04:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 03:04:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 03:04:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 03:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oviMFHidGfdqb3JR3VEf9tp7agzrT/KJEUssSHc/0WBCNiQssfTMqLQ2T3oy3MWu403WqWaJkUdQCoNUy672Nhw7TWNcYvvlLpr/hQt4hNQ1Y8VFeID2n4MOrsCtp4eyeHX08E5A4h+YY2ydn/GWzv6NjWu9wXkb5UASWYqLvn1uz9w4SQMEe+TKdUG9dfoFuffKRO6BXdu/yXt8SlLGDMbHXN0myLk9VAFwzs9SQWrWdcSt0qbTMUxHyzQbApgiMWBeO2kmCGHBF7lKwP+nkUMpoUu2Fg1wuwyI9lGFs6uAITxHKGo9qV65FYnYNcSJqGOY1cQlTShTzVmveswE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhDHavTRASMrtffhdtszxDkPL9C6ZVPa+zOQXRPoxCM=;
 b=Ahwl4aJxY6GK6kk+nif4whNysNy3O5tVrnByfWhSmJVdrHcnbEjFPppBb8mqsLSstx+sSBIrea7f79jw9LTuQkYShTyH0mBmRO7fshuhCj4l6pag8Rk9bm++ToVSdYTmuPrmxQSWH/vVjpQAmDoHR0Y7mmQGP9VXGfxrqw7+7kuJ4UEL4iK1rs7icHI2KrPRmWy31haWosDk3//8V04Pj9IQvhmovqlg4OA85Wszlt7/Fjy1CeI4Z9A/96n7BykEAdbjddXL+U2bW8jbbUy37t5LwxyrIcuXTfUZ11rpiLfC1ObuRCMwfaFrSS6MDNmXQmvwixMDzlpnvOUTh+2pSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 10:04:00 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 10:03:59 +0000
Message-ID: <f13a6dde-6b98-4da7-a078-70b879841ae7@intel.com>
Date: Fri, 4 Apr 2025 12:03:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't update GuC reset policy when
 changing wedged mode
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-3-lukasz.laguna@intel.com>
 <285deebb-2cd0-4a85-84ce-35d4514cd793@intel.com>
 <0b7b846b-f39d-49ef-9afa-56d818a0e69d@intel.com>
 <9635fe3f-038b-40fa-be18-aaa4cb8fbd78@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <9635fe3f-038b-40fa-be18-aaa4cb8fbd78@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e33f1f1-e419-488e-2473-08dd736004de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWxsYUkyS0xRZU5nYU5NK2hJWW1MckFsM0pKcmtITGZlTkh4czEwcW9xd0lK?=
 =?utf-8?B?TjRrcnZCeC9wWWRUZ3ozam94S2NJL3RUTzVSc3l2RjFINld4K1V6MjdQeTV6?=
 =?utf-8?B?MVFXSDZBWWFxTGFJU1JEV3Y4OW1KdytkdS9GRHhxaENGaXNPcVZUa2lNOHFK?=
 =?utf-8?B?cVhXQ25yR1RXZjMybUg3ZEg0TDJ4YUNsb1ByOXFGVTZoWElmRHJTcDh4aTBB?=
 =?utf-8?B?SGtENGJuU2xBYTdvc3pCYlNzaHZHUnpoZ2JvZjR3TTlJaFRxY0pVUDAxU2d0?=
 =?utf-8?B?VnBVSFNFQWluV0tRMjNLVWRnbE5kWFRSYlNTZ2RBVmxRTG5WSTVLU2RSSnBK?=
 =?utf-8?B?WFkrMkx5VWtVcEppbmtJV0VoR3pZMmNKRDliVjVHUm5FNlVZUWdTSTBlYlZj?=
 =?utf-8?B?SEZFRG51NlpsNk9NOXh6WEY0LzBWZGZpazZ3cmFNbmNRdWZud0wxMEtKMDRR?=
 =?utf-8?B?Sk40cTN1enJaN0w3a2Rwek4rN0FhTUdrUjZPcU8vYzBZTmd5dlJtUnNGZE01?=
 =?utf-8?B?UGpSamtGT1M1aTlwRSttZDBxRjljT1F4eVd2aTJRYVRNMDNuYmh1UEpKZ21U?=
 =?utf-8?B?ai8zeFRRMWFMQU0wYXlxc2grbW9xNXAwUy8yWVJFcDVSU0NkU2p6V3VvbkVq?=
 =?utf-8?B?M1Bma1pzeDZLcmx0R1hoVitzY0lMbFRkVE5xOUQxcmwwWE0wN0xCQnk0dGEz?=
 =?utf-8?B?Y21mMWpQcFdWV1czdnVQVkwvUTZ0alQzeHo3YlJTemIxRGo3MzlHNEU1RXdJ?=
 =?utf-8?B?Y3BYRGhEblM3d3h1ODE1SHZ0cS9mODFOcXlDSTdyZlc1dThQcG5HazNDS3RN?=
 =?utf-8?B?dFU1VFdSN0hJY2t3QmpjVHhKbmNFYzNFdlU3ZFRheXRaWm9kQzd4UkMrL3hs?=
 =?utf-8?B?N2pCN3VyQXJScWs2N1BJZXFvRGUvWnMyTU1GWVdYb3kwV0M1Nk9BTXY4REto?=
 =?utf-8?B?MzMyMmNWSmo0aW1EQUxJV1lLYVJOaEMvQk14dy9kb05YeSt5cFhsUHBzMFdN?=
 =?utf-8?B?V3k1TElsZTFvY1N5Um5XUjlaWDhxTWJaNkxmWkNLMFpKelRtQVNkNUtjR2E1?=
 =?utf-8?B?QlY0VWcvb3J3NExNN3BtTU9EY1Nxc2pKYURGOUhjNzllSzRaR2Rnek91aytJ?=
 =?utf-8?B?ZkRUTm0xY1hUcVJtZS9HUmw3bitSdnQzaWkrcXpqbUpYcXEzOE8xbXJjeitR?=
 =?utf-8?B?bGMyY0J1QmtDV1h2UU5hZk4vT21vTHl2dGRJeXdyUGpGMWY1SnBWU05rU2NU?=
 =?utf-8?B?My91K1Z0dTczTlAwdFBTV2tMUzVoOEVpRjA1eWdvOFJsQUlWVzZBZnB5Nmpy?=
 =?utf-8?B?STZ6ZXFzQXZDdFpCalIvcTNUY1hCWHU1UHZGb0hKU0NhaUQxTmhnSmpla2xZ?=
 =?utf-8?B?L1FJcC9uTGlDMkRValgvMlZIRUN1NGRkbUhWY3RxMS8rOHY3N3FNYUFBZmpE?=
 =?utf-8?B?d0NuNVJ3LzlVTU9jZzZBdmNoN0FzVXFTcHhCTFBWeHY2ZWpsbEFnb01UeXlV?=
 =?utf-8?B?VlB1dVYwU0ZvdDFRUWFHWEJ1NGI3SVc2WFJFZWx1ZHIzVzFhaFhESTh4Z3Bt?=
 =?utf-8?B?bmRyNStwQW5Od0xPbnFteGFmd3dGeE9KNjRWa3FEM3FGU2xTSzVXWFJtbTBV?=
 =?utf-8?B?Z2x1bngzQjhrNDVVVm1hNEhnajlNWmhPR09ZT1lwRWZPY2tmRkM2Q3JwMUJt?=
 =?utf-8?B?MzZocHBsd2pIOVBxR1Z4V2QxQk45YzJPaERIRDBTb2N4TG1sSXRBVFBISjhK?=
 =?utf-8?B?OUFmM3NQWkhjaHpBUXN6R2krZGNJK285YlVjYmdwNTFDbTB4VW9xbHFEZTRq?=
 =?utf-8?B?QW5vTWRZRStGS05yRmZ2UGJld1BoS253Z0FVZ3V0SFZJL1hNZjFlVG5XbG9l?=
 =?utf-8?Q?H0VYGSZ44vAV2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHF4RVVqQ2NLaFNvOGFKZTN2ajJFYk9WaTIzakJ3a2FQOEVTcFl1NmpyS1RO?=
 =?utf-8?B?QXBkaHQ1LzZscUh2c25pYUs2eDl0QTJ0NXpNK0VjbE5mY0lFVHE3L2kwK1Qr?=
 =?utf-8?B?SnpVdm04M3NST1lnZXNBSnNBdWJyanVQNFFtS3h0TEZoa0tnWmtFUEM3NWxG?=
 =?utf-8?B?MW85a3EwSGI3ajk2YVdMR2tVWVBEVTBkR3dTU2hKdVc2cEJMaXR4Y3BGZm1n?=
 =?utf-8?B?RndnYzRtTm1Tc0k0Z0lkTjdJT05lMlZya3JlSXJZTmhKVE1xOUlUelI5amRW?=
 =?utf-8?B?ZVR1Rm1pVHJWSC9BZXptQXZPK205RDc3TFNvYnpPTXhSa2JtdndsaVFSbFhp?=
 =?utf-8?B?TWxHUFcwQ2VBNDg4anZtVG1UYk5UdFkzVXNSRjc1M3kzbVQ0T2hIK1djZmdw?=
 =?utf-8?B?RWtmamQ3SURjb0xOMkFWQldEZ1JYNnJPaTVUMXJoSTBhTGIyUVczb0dyWTYz?=
 =?utf-8?B?RWkrNjlWZmdCaDRhVFZGU2pmMWFHVkVGSDRBeXM4YXpQUm5PMmU1a1NPQlND?=
 =?utf-8?B?K1dQTHI5eXZaeGd1S3pzdGtZQlEyZ2U5QnZ6SHVnUWY4UGNQS1RLVDNWQU1w?=
 =?utf-8?B?OEVwTEhqbTBVMUxqc1ROOG1HbzNuK25jZ3pnOXhuYWlLRmhyTGpyQ2VlNlo2?=
 =?utf-8?B?b3VLUEZNWlBhMzFqMWI4ZjdkMjVpMlNmNGpVcmpNNlFqcVJ1L3UxUzNCWHdk?=
 =?utf-8?B?ZE5sUDFwcXlmUEF6Ykxma3lRTUhGZmVNVG4zZHZMK3gzY21wNFRIU3Vzekp0?=
 =?utf-8?B?NDV4V1pyQ2NmNm81SDRJUG9VZjcwb3lla2l0SnZHQXREQ1MyU1pVcDFvTkhK?=
 =?utf-8?B?QVFDd2NvZFp0eWR3V3hnc3IrYkUxUFVLaVp2YWFKT3hUTmEwbDBhNnd5YXAx?=
 =?utf-8?B?eUppSU9SbzJwa1VmU1QvaFE0M0hyRENLbTRhVWZnaCt6THQ1ODhialNVM1Rs?=
 =?utf-8?B?eThMc1B0R3pwZ0YrUGFKREJOejU1MXZPc254ZkR4Y2tocndRc05PYm5TVUpN?=
 =?utf-8?B?MUhPaXhWOXd0OXVPcmdFNS91SGdzTE9UZjd2cmNnRjg4dk9zdXRoM2NnRnB5?=
 =?utf-8?B?SFpTUXJnc0JsWFRHVk9IZ0x1UDdsSStiQ2JFMDFBa0hEMHd2cXd6c2xGblVZ?=
 =?utf-8?B?cjA3SUUzaHNzcFB6Nis5TXZRVGM1b2k5QUhLVzZGZVA3azNubHUwZFBZVWlY?=
 =?utf-8?B?bnNGQzh2N3paVEJWVy9wOTJQZ3p2TTF1VHNzNlEwWEgvQ000Z01QQ0pld3Bs?=
 =?utf-8?B?UFkzQ1pneWVtaytISDd0MWgzMmptQzFUTjFOZGVpaW5WdEFoa1BqcGxOSzF4?=
 =?utf-8?B?RjVabURyZWFLRk4zclFVRmZhOWQrL2cwODc1MFI3RkxQaURzMkUwNlJjcWp1?=
 =?utf-8?B?S3hXUWJ3Z1NVeEovVGFjbGtNWGdERUI4Sy9RaWNPb1ljd3JMOWVRZlNPZDNj?=
 =?utf-8?B?UUNkNzliQ3NyZEJRZ21XOUJ1Q2VNOEFmbWxnMUMrbEc1ZXVVZ1dVWmNmald5?=
 =?utf-8?B?SlhKQWs5M1lXTS9xaVJXeG50OHl1VlFtdiszOXJ4ZHZnLzhYNzQ5SXMwdGZO?=
 =?utf-8?B?ZG80L1R6eEpoblczSE95ampXMWJVdEEyWTdhNUNJcEdsZllJTDJ6eUk5bysx?=
 =?utf-8?B?bUF2S2tsR3VuNmlLcWw5MStXd1JhVWMxVVJ3c3NPVlgvM0pYcWhISmp6bEZR?=
 =?utf-8?B?S1UzbEFRQ2M0YlMwaGdQWmIyT05sSVVhdzR6WE90QnFWZ0hVay9BS01scWJV?=
 =?utf-8?B?WDVmSWF6dXRWMEQ1YXUrN2FlaFdDWHZ3QWJHQmp6L1lENmw4VGRXQjdZZjhi?=
 =?utf-8?B?YzFjekFZMGZFeTR3MnM4Y3h0MWJFQjJGUEU2eWl4aUl6d0pWcm1JMGhHa053?=
 =?utf-8?B?SVZ4MHlJbFJjUHhGQ3BBbFBnY0ZOeW0rdTlVS3FHc21JL2d4Q3FMUTQ2Z3JK?=
 =?utf-8?B?MlVkNEpQVEtUU1VyU1RuU1BIdDgvd2NYdW1uZ1EzRDA5bWxNUURaY0IvRE1j?=
 =?utf-8?B?dUpEZ2FOcjFDRVMxWk9ndTYzek1nVnRNS3pwb2kyNjZ2QVE0N214VWU4NGRi?=
 =?utf-8?B?Rkl3cEVxcy9pd2xiaERMWUdhdzZnM3JOWDQ5cG5iM0J1a1plZ090QUpHVmVp?=
 =?utf-8?Q?ACFt37rThfvDKG76/vOkdnaUe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e33f1f1-e419-488e-2473-08dd736004de
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:03:59.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgTqEJIWiZcBjFiAgN51j1YjysVilNACm8kNSMz43KfdgJDbV7ieuRzOp4tzPyDo/1Is05n1fBDuA/zzPumL/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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


On 4/3/2025 18:49, Michal Wajdeczko wrote:
>
> On 03.04.2025 17:17, Laguna, Lukasz wrote:
>> On 4/3/2025 13:05, Michal Wajdeczko wrote:
>>> On 03.04.2025 11:41, Lukasz Laguna wrote:
>>>> Prevent the VF from attempting to update the GuC reset policy when
>>>> changing the wedged mode, as this operation is not supported for VFs.
>>>>
>>>> Log a message to indicate that GuC may still cause engine reset even
>>>> with wedged_mode=2.
>>>>
>>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/
>>>> xe_debugfs.c
>>>> index d0503959a8ed..062668d02365 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -171,6 +171,11 @@ static ssize_t wedged_mode_set(struct file *f,
>>>> const char __user *ubuf,
>>>>          xe->wedged.mode = wedged_mode;
>>>>    +    if (IS_SRIOV_VF(xe)) {
>>>> +        drm_info_once(&xe->drm, "VF can't change GuC's engine reset
>>>> policy. GuC may still cause engine reset even with wedged_mode=2\n");
>>> never use drm_info_once() logs for places where multiple different
>>> devices can be reached, as then doing something similar on next device
>>> there will be no trace at all
>> ok
>>
>>> also should we change xe->wedged.mode if it is N/A for VF?
>> We can't change engine reset policy, but I wouldn't say that wedged.mode
>> is N/A for VFs.
>>
>> We can still disable it (mode=0), or use mode=2 to easily wedge device
>> with simple exec timeout in order to e.g. validate whether driver
>> behavior in case of wedged device is correct (all IOCTLs are blocked
>> until rebind).
> I was referring to the code where first there is an assignment of the
> new wedged mode and then we abort and eventually print message that it
> wasn't applied - IMO this is wrong

Depending how we look on it. Wedged mode was changed and driver behavior 
will be different. Now device will be declared wedged on every GPU hang.

But if we decide that in wedged mode=2, engine resets MUST be disabled 
then I agree that wedge.mode should not be updated in case of an error 
of reset policy change.

Next thing is that we shouldn't change wedge.mode and return error at 
the same time. If disabled engine resets in mode 2 are not a must, then 
we should return success.

BTW, I noticed some inconsistency. Looks like if we set wedged mode = 2 
using module parameter we don't disable engine resets.

>>> btw, what is our approach if someone on the PF already set some policy
>>> on GuC will not do engine reset? or it is n/a after a VF switch?
>> It's global policy - engine resets will be disabled for PF and VFs, and
>> that's something I would expect.
> my question is whether ordinary VF user expects that such policy could
> be set differently on different setups (or changed at any time on PF)
>
> maybe for the production PF case we shouldn't allow changing PF wedge
> mode (something like we do for EUDBG or CCS mode case in PF w/VFs)

We can change it on the fly only via debugfs. In production it's 
possible only to set it using unsafed_param. Should we block creating 
VFs for production PF in case of wedged_mode=2?

>>>> +        return size;
>>> shouldn't we return -EPERM instead?
>> I returned size on purpose, as it's expected that VF is not able to
>> change reset policy.
> hmm, but by returning 'size' you're saying "OK"
> not that VF can't change it
>
> when read back, there will new wedge mode visible
> (well, it won't work as expected, though)

Based on what I shared above, for me it was "OK", but I can be wrong.
My POV: With current implementation we can successfully set wedged mode 
to "upon-any-hang" on VF, disable engine resets on PF if needed and 
check devcoredump on VF for debug.
Do you think we should make wedge_mode=2 as N/A for VF?

>> Still, informed user that GuC may cause engine
>> resets even in mode=2. I can add extra info, that if needed, engine
>> resets needs to be disabled by PF.
> I'm not sure we need detailed messages for that in dmesg
> good release notes about 'wedge_mode' should be sufficient
>
>>>> +    }
>>>> +
>>>>        xe_pm_runtime_get(xe);
>>>>        for_each_gt(gt, xe, id) {
>>>>            ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt-
>>>>> uc.guc.ads);
