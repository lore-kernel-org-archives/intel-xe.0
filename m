Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A1FA3751
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 13:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802F710E21A;
	Fri, 13 Sep 2024 13:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goEPPSX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C72A10E21A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726233467; x=1757769467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vitFcij2oq/Nae5fHzp+LavNlaKLFKrJ4KF84Q986Ms=;
 b=goEPPSX8rdIPXKZjbX7Vm31ru7qSe50Jg3c/Jep/XwVFgqexs2JP+1mX
 mmEluwVugaA70krHQW8UtwpRXcoYX8AOJtU6/BHh9EHvlAcebSR8S0Ew8
 uSjHB4evwx4D6Pfl6KF3kHgkecUBiv8+OQ+8ceV4brm9q4sdnfKAG5grZ
 fi5+UKPPe0IRKzK90nv8f2KhyUe4OM18NFdliLuXDbUxArHsg7oVSkHxX
 6jaEv4U7P/nVvWFpIERsIF3b7peinoCoKss3oBEfcqXdqeNXOnwmDY2Yb
 CR7OW+hn9yed/rqoAZ/0CQruDoJJ9ush68LtSJS9wJFsbXC0fl0FF4dXd g==;
X-CSE-ConnectionGUID: YLZfMmqiTSaDpHwvjDipGw==
X-CSE-MsgGUID: SglEQL0VTdqs9ZJPHXQLsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25285875"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25285875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:17:47 -0700
X-CSE-ConnectionGUID: JbUjDO9oTcS853mawyCS5A==
X-CSE-MsgGUID: Y6GqL9Q6SjaZw+J4CZsv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="98746714"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 06:17:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 06:17:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 06:17:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 06:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZPPE1ZMgAWqdO/EEfZZtBT91/7ug5JJgBsPTWRFDreuX06JozMDuEODGGFuxpoQobV9rfeXKiTBAxp+RAL2xoBFudBnklNPle52BjKTYzdoSnCUCSP6WrlrYtMvqzln5hr2M/VJ+tfFNxeZcka7vbfBaOJisa8R4H3vZBZXlsavwbG/H5V1FSrjqcYSlaitzGUTf7tnDQPw0/dMDT+L6RXKD1C+SNVjDB+2sFyC7LGFvS1L9VGFIB3itEGKAMXd6AiucjwG0SW4YQH3J0efnhi4fGDukWTcuCNKmMCxDY0ZNP1Kqwb86Eya4h/uBWRnBgtB3X4SMc7kY9/+1HwI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKUZ5cnNbzAdOYLt25LaQF45B06keIzpC7aY971V+KU=;
 b=zWYvYBbqNtsn0Mpd9Duil/ngVNOWoG+ymdIlnfJErFPoX2ecZx92FxLTTv4HiGO36AtG1iU6eyF9Zsc3trJa10EFnLWZRnFmO3NczgiEyQgKCxzsJBKW8QpXgY64ON0P61zkEACh8xLn43meEvHGmOtcDBfnN1QrCam+jOL7Bxwt3exlbjm1OaDeUd4zWQxk+ubAzsSvURmJ5+xrpMNoiuMeK2OrOOKoVy4+FZotksp0Dn32+AsiOCB61DTQjKhamXRT9OmQQwd1lTKagcc8kNBIRlBn78npZZuUb8rg6ZwkWBAGzS2MNwRU4Z321MxEAgFMRHrDVRzEFc2f/8t18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 13:17:44 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 13:17:44 +0000
Message-ID: <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
Date: Fri, 13 Sep 2024 18:47:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5ee5a5-82e2-45c8-9aa6-08dcd3f673de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnJzdjNkNEtmTnVlTjlPemZUK3ZPT0dvVGlqTnQ3YWdMemhseXYzOHN6UXc4?=
 =?utf-8?B?Tll1QWt3Tkp0a1RGRlowZXV6Vzl0OUxvYWdFTm16Q2JobTQxRjVWL2NJQkgx?=
 =?utf-8?B?Yk16SkxDUmJRNTA0S1JXWjd1WVg2dCtHZnNuMDR4eTRhNEpDbnNCaEp4Tk5y?=
 =?utf-8?B?MmRmeU1lUzFNQnA5b3docWF0aHZhNG0ySVNVczN6aWkrL084Z2xSUktaR3RK?=
 =?utf-8?B?OXRrcnpPTnAxaHJuOUl3U3FkRG9vRHNpWGc3S0FRM1NJNEZNN24wNmtRMmhq?=
 =?utf-8?B?UGgvSnZ2aE1OV20wWTVpQjFaUFQyNk9lNTROS0d0YnBWSmw3bzg0dTFMQm9z?=
 =?utf-8?B?eFlMNG81bW1KVGZFNi80WnpmMW0vMi9BTisvODBMdVJRaXlmTytlWWhlMG9S?=
 =?utf-8?B?SDA1SzVLaHYxRVNKd1NqV08vQTdBVElxSmd1YzFyQnQ5YnQ4YndWZ01QYU14?=
 =?utf-8?B?elF2elBYcE1QQVBQa2IzZzBWL29ZK1hZTm05SFdxMVpscjZ4Z3hYYVJmUUtV?=
 =?utf-8?B?TkhYeFkxRnZBdUx0Z2VOTlE4cGRkV0RJMkp0TWt0QkZwd1B5dksyRjBVSWF3?=
 =?utf-8?B?SFowWlZtU3AwZ25mcVpOelQrUFQyVEhmTDQ4NURVd2dCUkc0dmtGMCs5MHFx?=
 =?utf-8?B?OEpPYVdlaTZYblFLYlozeVVzTXlmKy9qOTdKUHg4QkFqQ3hoS1VPcERmenhM?=
 =?utf-8?B?R1pnUGZtNDY0aHA1WFlHSFRaUVlTQ3JpME90ZXZtVThYOVB3bDZNYWhEak5j?=
 =?utf-8?B?TURjUURMY2VNU0Y5UW53bWhwcDhqY3RjbmxjQ3BGY1h2bjRhTlkxOG5XODJB?=
 =?utf-8?B?QVExbU13NGF4RlhPSG01MU1FNWVsbGxEazUrZDk2MGlrRVhaVTErYlJnSWw0?=
 =?utf-8?B?emI1VXhHWGFkR2l5b3MxaXV0aERTTGdBUUtwb3pOL0s2ZFlHQ0FRcmRDZlAv?=
 =?utf-8?B?MzltaTNtamQyWDNzMWFySzh0T2pWRGU3YVM0ZU9UT1hSK3VCcUFTbmRkZmRx?=
 =?utf-8?B?cHpteWRjTmZkMGlsR1JWSUprZzZUVUxMdXVsUjVabEUxTWZGT05hSVdNNEt2?=
 =?utf-8?B?YitBUVhMVnk3K3FHaW5QTTFpWjhBanRzS01VL1dyS0NwbHE4b1pUYlE3c3JB?=
 =?utf-8?B?U25tWXMwZ3lqMTNCbHFLNGVRbmlEZXRRYmxYSlRic2V1cFRMcXdpNHZtUjZs?=
 =?utf-8?B?ZStkamlrUzdpYmlwbFhBYnJHcElNSnZrLzR0dUo2Zm9Ea280NU12UnFkMGUw?=
 =?utf-8?B?UGNJN2VmZnZWeXdCUGtpVmtQSnQ4ekRqWUl0b2p5d0JBYXpFUmtlSC8wRURx?=
 =?utf-8?B?Qjk0ZlpXL2lhN3NYZVdzNFFXRDdRVTlvbG82enRJVUNuNi9hT0xiQUJpMzZG?=
 =?utf-8?B?YlZNNmRNdkw5U091V09CRytSWWFlSFl1cHJEMUdJRmRZNERtYXV3L1dXeEV0?=
 =?utf-8?B?TTFkR29JRVVLa09Sb09McTJRRy9VcG1mYVVpMk9obTBsbWRUZjA4Kzl5aDZs?=
 =?utf-8?B?aWhaSjluWUFWMkF4WjNCYUVWa2VQL01IbU1JcVpTUVY0RDNFZHZOZ3Z1amxs?=
 =?utf-8?B?eWp2NGxaUGFhTG1saFFjUTdBaUlaRWMxTVJDcFEvZHp3Ri93YzhRaFh1ZUI1?=
 =?utf-8?B?RDgyOHJsV0xTRGpJUW50d1ZGMHYxb1hmYlFoQmpOeEh3cU9KOUUvTEkveWpV?=
 =?utf-8?B?bnQ2cVUyODdQQlY4RjM5OTRFclE4QVZ0Zi8ycmZrS2pwejkxTWR6YjE4djBQ?=
 =?utf-8?B?Tm1lUG50bk9kRGpMSGxtQ0pxOExBR1VPV2FoYmUycmlEdGJnc1ppSUtSa3FS?=
 =?utf-8?Q?x3eEKgEKJXlBsh9PofnNbzxIvktsXX8W7DX24=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHBPY2ZHYkVWdklVb0RGYXk0cmlINlQ1RytCL3UxZFY2RkhjcHBQcXo5akh1?=
 =?utf-8?B?eU1BMUJEWWtUTmlONFRJOVdpUCt5THhYL1pkWEEyNGZ4dGJvRDc2KzFMOXBt?=
 =?utf-8?B?VlpCMXJ0dDRSR3BmSDJROGUrL0h5Z0g3Zll1N0R2L0xpTDl2TElpVHd5ckpJ?=
 =?utf-8?B?ZUdZL3dLYkFjcEdvaHExRkoyZlYxcXlDZ1ZVZlMwY2ovZkNGWkdWdEVFWXVk?=
 =?utf-8?B?cUxhYWVpMGxMUDJJcDl3NmNNdUg5NW5PM1JwQlBra25TMTVzeXM4U1VPaE4y?=
 =?utf-8?B?YThZQWhmSFN0ZWczb0RoVzNoQzRIbjZNK1JSRFUyS1EwN2tyTExYYm95MDl2?=
 =?utf-8?B?cEZYSllaWWZaZGpKZ3VNK2plT2ZBdGRYMzQ2dHFYWVo0bkxySDhrSXkxZUp6?=
 =?utf-8?B?N0lIcnpNeUk1VTZHd1pwdkhSU2l6eWtjY3JSUmZqcTdkN3l5ZXBJU1NTdlZw?=
 =?utf-8?B?Sm82OVVtRjJXNWMzanF6Z3dHM0xUM0VKRmorNFRBeHFTekdKRUkvaG9YY3dp?=
 =?utf-8?B?eTN3WlZTSGtRMXVDY1BMd0JNZzBpTFpNZnc1SU9lRnk3cjI3UXFnQzVCZDRD?=
 =?utf-8?B?VTJoU1AwLzdNRE5ROGgwSi9vaGhWUm1tdW4rVlRkMmZhL1pxblI5YlZENmpl?=
 =?utf-8?B?a0hNamg2ZXo2aE1SU2Q3MUdOekZUV3BobnJnaWsweHhra2JoKzBIcmc4WHlq?=
 =?utf-8?B?Ui93NTFzVzR1REJUNUEwNU0yVUtmMGx0VllLSWxhWnd0U2xPZlNzdkFVZG9k?=
 =?utf-8?B?R2tLUVZFK0NtNmlSbnF5djVXVW16NTFydUtndmRWVkFzSlRWcUtqZ1lTSDJH?=
 =?utf-8?B?WWNNb1VhSHdkbVdPa1J3SkpMWEIxYjJJdkIvQWgwSnpCcVRCYVppbi9XelJk?=
 =?utf-8?B?djh3cENMdTNKaHJOUHJ1STJxaWE5UE1CY1FydWZrT0hkUDM5RnUreHZhanoy?=
 =?utf-8?B?djRVR2NMcXJZRVJjcE92SHFiNThUN2FxRmp0dlp5aEdvK1ZjL1M3RWRoRjln?=
 =?utf-8?B?emlIcE5DN1FjWlR1V0FWQzYzcTg4M2ptbm05Sjhack5zTkYyUWMzUzdEMVl5?=
 =?utf-8?B?VDlZOC92SFZZTWs1bHBhYTlJalpEcEtucjIreHRNN2pzaUc3Y2RnbnJlMmxh?=
 =?utf-8?B?VXZzNkRhazFNOFFjTWpmbHVMdGJiZVMwS2swWTlpd1FpMDFQYVRuanNOa1kx?=
 =?utf-8?B?c2QwUnBRVXRtRUlEbEdLMVEwSHA2dHorMFNlTmhpRTk1bTNGNGlqTm45Mlpv?=
 =?utf-8?B?UVBYZTl0U0ZhbFBlcGQ1MHNibFpOMUtPaW1jM09vd2Zrc3E1TldUL0FZd3VZ?=
 =?utf-8?B?RU05dUdvVTNUeHRCWWRLVW0wWit2K1prTWdqYlkzdFRkRDJSS3NXeXR6L284?=
 =?utf-8?B?UHhsTHFQR1l5RTNudjk1ZDRiWjM4RDdDRHhBeGhpT2REeHRDQVg0bmd5b2FT?=
 =?utf-8?B?NUp0b0crU21hNEhlNUU4ZGljQS9LUktqOEM3Yk1wWjIzS3M2ZEZ2T3BHZjNL?=
 =?utf-8?B?c1gvcU9zd3ZybSsvMWVsVWN0bTF4S2JKd3F2YlN3MFl1Y0FQOCsyL1NsY3VK?=
 =?utf-8?B?bmxiS1BQZWsyc0dGRi84RU1MdWJQY3lvS0cxWDZKdUszaVpTeXlyaW1rM0dG?=
 =?utf-8?B?SDVoQTMxM2VUTWY4U0hMWGUvNFVSSTNVZjNacDhuNFB0QW56c1J6Z3RlWFoz?=
 =?utf-8?B?OWRmdlBQRnArZWpYRkM0ZWw0c3JKMTVWcm9rL2djb2RMVkUwU0FTYWdZWVdj?=
 =?utf-8?B?ZFVsNlRwTFNFemYwZFl6aWdpKzREdURUTXZBZGxoMGgyd3lOd2tKVUNxL2tL?=
 =?utf-8?B?WHNOVmdpbGJuLzhWSmtQUDQwVE9NbmU1N1NXZzJlSXcySTMyZWdzam9jUlJO?=
 =?utf-8?B?RW9SODRkVjFyNnBrUndCM3BJcmRWd1BSa1lhVENsbkluYXJRSnBLU2NnNTlw?=
 =?utf-8?B?Wkc0ZUlmZW5obGx3ZE9PcjFncy9paEhvNmNXK1FRd1dXejZaMS9UaFUvK09Y?=
 =?utf-8?B?VndCRUtjUFhjaU5YbkpVTUs1T0Eva3NqRWRsY0VHMWpROGlXRkVibzhzVFVr?=
 =?utf-8?B?eG5jWmllK1B0RWh6VWZyRWRuL2c1M0Y1TFozTUphWU1FZ3NzZ0ZjVTM2K2J1?=
 =?utf-8?B?WVVxdEl6aDZXVU9iOThpNkFiWjhsZTJhT0NWOUZwSkxVWGRyRkRUczB6TFdJ?=
 =?utf-8?Q?tjsIJHWInL4i9EZ7FRS8pFs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5ee5a5-82e2-45c8-9aa6-08dcd3f673de
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 13:17:44.2222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u7Q0LXcpS2I9c8ow/YnI0V1sfM9/zg/2cOm6SploSeT5HIo3fzN42mO88IZlybfgUYH75Tfwug8TA+AAbhK0+OigDHFS5y3BBj749JzkIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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



On 13-09-2024 16:56, Michal Wajdeczko wrote:
> 
> 
> On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>>
>>>
>>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>> increment the reference count for the domain. This ensures that
>>>> subsequent _get calls do not incorrectly assume the domain is awake. The
>>>> return value is a mask of domains whose reference counts were
>>>> incremented, and these domains need to be released using
>>>> xe_force_wake_put.
>>>>
>>>> The caller needs to compare the return value with the input domains to
>>>> determine the success or failure of the operation and decide whether to
>>>> continue or return accordingly.
>>>>
>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 35 +++++++++++++++++++++++++-----
>>>>    1 file changed, 29 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> index a64c14757c84..fa42d652d23f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>                         (ffs(tmp__) - 1))) && \
>>>>                         domain__->reg_ctl.addr)
>>>>    +/**
>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>>> initially, wake the domain
>>>
>>> while likely this is still recognized by the kernel-doc tool, this is
>>> not correct notation for the function() documentation
>>
>>
>> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
>> will fix it.
>>
>>
>>>
>>> [1]
>>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
>>>
>>>> + * @fw: struct xe_force_wake
>>>> + * @domains: forcewake domains to get refcount on
>>>> + *
>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>> + * timeout. If a timeout occurs, decrement the refcount.
>>>
>>> not sure if doc shall be 1:1 of low level implementation details
>>
>> Does this sound okay ?
>> This function takes references for the input @domains and wakes them if
>> they are asleep.
>>
>>>
>>>> + * The caller should compare the return value with the @domains to
>>>> + * determine the success or failure of the operation.
>>>> + *
>>>> + * Return: mask of refcount increased domains.
>>>
>>> if we return a 'mask' then maybe it should be of 'unsigned int' type?
>>
>> Agreed. Will fix in next version.
>>
>>>
>>>> If the return value is
>>>> + * equal to the input parameter @domains, the operation is considered
>>>> + * successful. Otherwise, the operation is considered a failure, and
>>>> + * the caller should handle the failure case, potentially returning
>>>> + * -ETIMEDOUT.
>>>
>>> it looks that all problems with the nice API is due to the
>>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
>>>
>>> maybe there should be different pair of functions:
>>
>> I am not convinced with different pair of functions:
>>
>> In current implementation:
>>
>> int mask = xe_force_wake_get(fw, domains)
>> if (mask != domains) {
>>      Non critical path continue with warning;
>>       or
>>      critical path:
>>          xe_force_wake_put(fw, mask);
>>          return -ETIMEDOUT;
>> }
>>
>> do_ops;
>> xe_force_wake_put(fw, mask);
>> return err;
>>
>> Above flow remains intact irrespective of individual domains or
>> FORCEWAKE_ALL.
>>
>> In case of individual domains if (mask != domains) can be replaced with
>> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
>> since mask is 0;
> 
> so maybe we should have (by reinventing i915?):
> 
> // opaque, but zero means failure/no domains are awake
> typedef unsigned long xe_wakeref_t;
> 
> 
> // caller should test for ref != 0
> // but shall call put if ref != 0
> xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
> 
> // safe to call with ref == 0
> void xe_force_wake_put(fw, xe_wakeref_t ref)
> 
> 
> // helpers for critical work that must be sure about domain
> 
> // compares opaque ref with explicit domain != ALL
> // can be used by the code that obtained the ref
> bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
> 
> // compares fw with explicit domain != ALL
> // can be used by the code that does not have direct access to the ref
> bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
> 
> 
> // helpers for checking correctness
> void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
> 
> 
> then usage would be:
> 
> xe_wakeref_t ref;
> 
> ref = xe_force_wake_get(fw, d);
> if (ref) {
> 	// ...
> 	xe_force_wake_put(fw, ref);
> }
> 
> or:
> 
> xe_wakeref_t ref;
> 
> ref = xe_force_wake_get(fw, ALL);
> if (xe_wakeref_has_domain(ref, d1))
> 	// ... critical work1
> if (xe_wakeref_has_domain(ref, d2))
> 	// ... critical work2
> xe_force_wake_put(fw, ref);
> 
> 
> so above will be very similar to what you have but by having explicit
> types IMO it will help connect all functions into proper use-case flow


Agreed implementation/usage will be same, will use explicit type for 
clarity.
IMO typedef unsigned int xe_wakeref_t is sufficient instead of
typedef unsigned long xe_wakeref_t;


> 
>>
>>
>>>
>>> // for single domain where ret=0 is success, ret<0 is error
>>
>> This leads to caller only calling xe_force_wake_put incase of get
>> success. so in case of caller continuing with failure, he will need to
>> ensure the put is not called.
>>
>> for example:
>> int ret;
>>
>> ret = xe_force_wake_get(fw, DOMAIN_GT);
>> XE_WARN_ON(ret)
>> if(!ret)
>>      xe_force_wake_put(fw, DOMAIN_GT);
>>
>>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>>
>>> and
>>>
>>> // for all domain where ret=0 is success, ret<0 is error
>>> int int xe_force_wake_get_all(fw);
>>> void xe_force_wake_put_all(fw);
>>
>> In case of xe_force_wake_get_all(fw) failure, how the caller will know
>> which domains got awake and which failed ?
>>
>> ret = xe_force_wake_get_all(fw);
>> if(!ret)
>>     No way to put awake domains to sleep
> 
> in case of failure, it would be the responsibility of the
> xe_force_wake_get_all() to put all partial awakes immediately, since it
> failed to awake all requested domains (same as in single domain case)
> 
> but let's drop this idea
> 
>>
>>>
>>> and
>>>
>>> // input: mask of domains, return: mask of domain
>>> unsigned int xe_force_wake_get_mask(fw, mask);
>>> void xe_force_wake_put_mask(fw, mask);
>>>
>>> this last one can be just main implementation (static or public if we
>>> really want to continue with random set of enabled domains)
>>>
>>>> + */
>>>>    int xe_force_wake_get(struct xe_force_wake *fw,
>>>>                  enum xe_force_wake_domains domains)
>>>>    {
>>>>        struct xe_gt *gt = fw->gt;
>>>>        struct xe_force_wake_domain *domain;
>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>
>>> it looks that you're abusing even more all enum variables by treating
>>> them as plain integers
>>
>> Miss at my end. Will address them in next version.
>>
>>>
>>>>        unsigned long flags;
>>>> -    int ret = 0;
>>>> +    int ret = domains;
>>>>          spin_lock_irqsave(&fw->lock, flags);
>>>>        for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>            if (!domain->ref++) {
>>>> -            woken |= BIT(domain->id);
>>>> +            awake_rqst |= BIT(domain->id);
>>>>                domain_wake(gt, domain);
>>>>            }
>>>>        }
>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>> -        ret |= domain_wake_wait(gt, domain);
>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>> +            awake_ack |= BIT(domain->id);
>>>> +        } else {
>>>> +            ret &= ~BIT(domain->id);
>>>> +            --domain->ref;
>>>> +        }
>>>>        }
>>>> -    fw->awake_domains |= woken;
>>>> +
>>>> +    fw->awake_domains |= awake_ack;
>>>>        spin_unlock_irqrestore(&fw->lock, flags);
>>>>          return ret;
