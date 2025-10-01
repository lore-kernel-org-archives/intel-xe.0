Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F337CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 11:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E0610E33E;
	Wed,  1 Oct 2025 11:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJhZNpoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B7110E33E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319527; x=1790855527;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lRxFfFuopIcF1CQw2J0I8/6mqctzqaKXZlFYb4cYCpc=;
 b=cJhZNpoTOty1Nh3zdVlSTgKZByGc/yv5IKoQXYGbtTYzjg/bsA9IMWDn
 +NVG2C1PKWvvAW2wFq7G9FtXDI8TBAZ8UROZwWJtRG7ySrPYYf2fM7qxR
 pmgfFeeoIk0UtPh5IGh8To5G5Sz9A+li4ARSUEof+vvPdRh9WHRBNgF+y
 ApyEAqCFTcjR5aBvnQUtmBDDOXzxCskV00fnbq6TNo+KS8fjOTNuseP4l
 tk7y+GOxnKGVoQrQr5lsRVGMdMWP6MspwsCzMDcsqYKc9cZUm8Q8jCw3I
 bIlNKK/owcrzPYHlhIlaHIm5K2oSQTmob23ObnhwE//HJ8p384/YqnznH g==;
X-CSE-ConnectionGUID: mhsyG18uTrCNuCJiv3X1Mw==
X-CSE-MsgGUID: ZXAszRW9Q3qmdf/bYEfRjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72206365"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72206365"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:52:07 -0700
X-CSE-ConnectionGUID: 8uzEL86HQxu7DADLh3uKIg==
X-CSE-MsgGUID: 91kCv6pgQ9CE0Ab3fiVYww==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:52:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 04:52:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 04:52:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 04:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDO056aTaZtrj/VkySk8zb3IRtOO10ohIWKjqU251m36cTDg0RRZ9SAP5YAWKYEeP/1k2zQ75T6dMmGd2mrPmooMhEZw1m5+KnFVorODUkXHfzNknjrDuu8ugPZY8Bc+i0DGc+/fuFiGkeS8qkXhGYFOA8X0fujk0lcKrhhK/DMDsxDIwI/dZjmsJLNVoKzMq377inMyMDuSbgzKlbkJxsoWys0DfTGSMpLgJObeT9WURfGkEGsgA6OLxhA3qnldB1xlb/6XILTKV5Wjj1T/uL8ID+f5pFW0U4o9Zdb4iu1q2kZSMQJSSQx9Bf8tOyQ93tUo4JNEiHYGshvgOpzlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ANJp20UPWx4u38PiWDfdB8NFThhjy2yIt3Qg7KFvO0=;
 b=A0U0IlvgG1RyrHlj9xIxZH1P8374lLcQgL99yok81SpxSdZn67iVWM6vdfWNxnvwQA06OXEWBQVDDCRI9KsDSqtTMUiTHVyFZDeR5JsPgWsr/a54gd+y5yilx524nOWpVerGoTvYy/KXp26bTw3z3fqlqXvZrd9Z8ftkRYnB6ilWxbh52pIk5mVyIsjkL5VQETXkjK1c2pqhiBdCO7CJnyOfi42JQdGucZ1omwAsdVkg0mFtTIy8kWH1kAf8C464V/gsQC/qSEcHOdpIudMW+vIZR2gmXndHO/D0HZR5ovYFQZ2qIrU88Yiw/XILtrxoy+Pzimf7KfiAlYTrXZ5z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 11:52:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 11:52:03 +0000
Message-ID: <ceddfd57-7a33-4b65-9644-e2387cc80544@intel.com>
Date: Wed, 1 Oct 2025 13:51:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-48-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250930225618.140071-48-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0110.eurprd09.prod.outlook.com
 (2603:10a6:803:78::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: ba80dca3-9918-442b-86b2-08de00e0efd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MENYTllGR0wyWnB4ZFRJeENzTUhuNDd3T0VLOEE4dEREWVVub0ZpV2sxSmhH?=
 =?utf-8?B?Z1Fvdm5nOTVHdzRFWHo3N2swQWcxSkdlSFZoNFBnazhzMGd5ekRSWmZCRjBI?=
 =?utf-8?B?KzZURHIybU5aWWV2NXFmbGNkc2RUdjkzRzU0QkdZYUMrYjZkQ3QrSitPRzd4?=
 =?utf-8?B?TUQ2TEVFL3cxZTRVc216dGxYZlBrWWJqWkRINXFvUUJDQUZLdlhkcTU0MnZP?=
 =?utf-8?B?RnNrV2VCMlNGMkowS1E0VVRTczE4RnBzcDdad3FUUGM0dXkwL0JqSzR0b0ly?=
 =?utf-8?B?UHRiUU1EWVhzSXd3ZkpuSFFQMnpqaGJKdWpPdU5hWjUrWmJqVUVSekVjQUtL?=
 =?utf-8?B?WnZZc2lQTFNLTkl6SDZ6VDRnWXJHNEFodWoyNjdtT0FpYVhyUEZubTNEU2hy?=
 =?utf-8?B?aXlSNmNhank1aDF6cHlYK1BQT1ROWkFWckJWMTFsSFBmVm85clhvOFZEd29P?=
 =?utf-8?B?RUtXVDhLM3h3UVJMOUltR3VYekRCRFJqMHZQdVBrOG5FU0pEbzJ1cHZpVXhw?=
 =?utf-8?B?QUVHTmthV0hzbE9Hdmd3eUFRdW5lTzUzdFlGYjFTaVFSV2VGazV3dVU4Tjd3?=
 =?utf-8?B?UjNqWTJRSy9nenZoMkpFaEg5QlJxR3ZJTDhTWW0rM2lYdnRpMEp3THdSYUNj?=
 =?utf-8?B?bGMwNklSa21mMDNDRmxrMEpLNVBPbGlnTGo3WHh6V3Y0OUpEam9OZlBIYmxk?=
 =?utf-8?B?c0N6dlhkNDdIek5OWERTR2ZROUVHUncvTEtrOVJnYTRHRFRlNjdlMVBFTXQv?=
 =?utf-8?B?R0Z6QVZucnZIRndzcDFkNDY4ZVlLd2JFMHUvYzU1cmhCdmJXaWJkamlMODFh?=
 =?utf-8?B?Zkx5dloxMUc3RXptZkpDcUZUMENNb2pKS2hpZXF1RHhZeGlpcHBqQXRhRTYr?=
 =?utf-8?B?SGF2aGtjYnZEeVJYNnNLVFpydVpFd3JZZ1o5T1FTUm9pUzJmMExSWlJ0ekM1?=
 =?utf-8?B?alMyTjgzK1lPbVNja1IrL3kzN3kyV3JnZWlzdlhBVHQ1aFZ5WWZ4SW5tMVFS?=
 =?utf-8?B?cisyN1VnRWd3VWpiTWE0SWpmV0paZjZBdUdkQnZmM294V3UwQ3RiM1Q0c3Nu?=
 =?utf-8?B?ai9mUHBvcXVIc0pqWnpodE5SQUVYcXl6bnoxRTUxK1lmZWNHeVIyMDcrNjFJ?=
 =?utf-8?B?V082RGY1Z3NPbHM0bTJIcm1zRzJNejhrUW96c3I0V3IrZEh4K1FidnlTUk5P?=
 =?utf-8?B?WnlSOURIZmFWZEptdXJJaGlxclE3VEo1eHdScEFUT2JHY0IvMkJKZUpTWmNH?=
 =?utf-8?B?bkIwZGR6cWZpYlYzY2xYRWJMcUNVQUVmUFlQTDU5VlFTWmQwL2tPYTQzbmh5?=
 =?utf-8?B?ajQ4R2NGcmExYzlrWmlpbkFtallwVXE0aXhqVWdjVXlLZllLTlIrNnlPbzVU?=
 =?utf-8?B?MlZOdFJodC9MV1Y5YXEydkFmSlZnVEYwNnlSYm90TEF5NEltQXByK2FOcXl5?=
 =?utf-8?B?ZDJCdTZGb3UxTU56dFZna1g1RHNnVCtBOFFER3p0UC9mNjIrR1FSRzVUbm5j?=
 =?utf-8?B?UEp4eUt3S1ZvdzluUXNJMTRtQUVldkRGTFhJV01jT01GcDl0ZGJ5dkFSRUV1?=
 =?utf-8?B?SzVvSlNiZVU0dWthb2xocGR3VStmUS8rdngrS0lkWTByeDlUeWZLaEhBOWI1?=
 =?utf-8?B?RDVOVUFKa01STU5sWlJLbWs2eWp0bkhieU5qV2xmOXNLMDNxUk0zc0ZOd0k0?=
 =?utf-8?B?b3FXUmpjUFlxM1ZuYWRlOExNeGRnQ3M0T3pxVnJKSXdjQS8zMjMvVGgwYTZy?=
 =?utf-8?B?SHJFTzdoRllRWGdzOGNyOXE4SE5Nbmo3N2J1c1R1Q2t5MCsyYXc2RU81TFJn?=
 =?utf-8?B?VDBzQThIRnViNFVJZTRtQi9NUVpVSGZhVytzejR1L2NFQ3Mwc09ENFMwYUFI?=
 =?utf-8?B?dmxIVlJMZ1Z5UVJ1ckM4TUgwRTZKb2NTbkp5a2NSb2VBcEZ2SllDYXBuMEs0?=
 =?utf-8?Q?2MM9pWCjV2WGsUY25m4KEP1HGV7dBtuN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWp5QjA0YllIemV5UUtEMWxEN3RqY2svSzJ1YkZMSHAvdTRyUEt3U1lPMDdw?=
 =?utf-8?B?a0pvdmI3ZFk1MnVLclZyZ3l5em03Y2g4S1h2UmtPWkRPRU9UVFY3VUlYMytM?=
 =?utf-8?B?a041cEh6WDQwKytubmJzb3M2VS9YdFFsdHV6S0k2THI3SWRuM0xZb2JBWXdE?=
 =?utf-8?B?WHJrTmkyalJCWStTMEEwU1I3TlA4MkJERHMrU2l3dkkwQVF2REg2ZG9oN0Zs?=
 =?utf-8?B?NlZNVGVOWUVtWnQ1bFo4TFh1YWVnNFBLcmIrbDhHMHo1Z0NITlJQOU80UTFh?=
 =?utf-8?B?eEpOM2hySTd4VXNuUHhXYzZmZ1MvVUx3WFBSRFpxSWhMYUJzSnZXS205VUdV?=
 =?utf-8?B?amc4bGtXcWN4bkY2NDNoYlJ3YmtLUjh1Y1RaZ2pqOUR2VkExei9KbURxR1h4?=
 =?utf-8?B?azIrK2RJQkZtcXhjMytMZlJVRWE5c0lENm83UFJma0hkejFJM2VuWVphYnc3?=
 =?utf-8?B?em1sNndKcEFQSlkzM3U0T1pmeHU1cGUwVmhzY21KRnJ3RW5SdFVpNVZSdnZo?=
 =?utf-8?B?bk1kKzdpWWVIWS9YNldJcXpTdVpyZHhoZVd0SUxCa3BxeW81TkJhcUNYc2FI?=
 =?utf-8?B?c1hsSnFjZ1M4VzlpU1FGOVFwMC9taXhMNGNNTnU0d3d1K1pBSUlkZmNwSTZ5?=
 =?utf-8?B?bHVNYTdlMDB5bkNHSnJuNTNFcDl2VE1QUGhHaEQ3QTZXQk5VVDNCTEE2TnNj?=
 =?utf-8?B?cHczcFRzZUJrWHNlWjE3eHdzVnBUNWw3KzhWc2JQeTd4UUtjb3NKaU44VEox?=
 =?utf-8?B?TEV6b2JjbC9GREFEbjRpVHJudlBaS2VlUDNTb25ybkVST240amdYcjh5ODZD?=
 =?utf-8?B?V2lkZ2kvQUlZNDh6WWdnMkM2UTE4dytIMFd0bi9VMFBGWFRmSXlheFJsVGtQ?=
 =?utf-8?B?L3l6cSttOWpYdWFUOU1Fb1UrYW5XRDhZRGlUNVgvL0k1cjFKVEJJaGt4NWNs?=
 =?utf-8?B?Ny8wc2NZTmFsdDdsUFNnRXc1R1RiazF5Q3FKVVJCZEFjeDV5VUdVY3pNWDBJ?=
 =?utf-8?B?elBOcktWWi91K0IvSnl5Q01tbVRjZWt5NXI1NnJnVWtpdU9MaHg0VHIzbUhj?=
 =?utf-8?B?WFZibVBkU3FRK1JWTUV6SFVSU3A0UDJNYWRKNHcxb2xBakU0MEVCem5oZUd3?=
 =?utf-8?B?SGkyY3F6Mjkyc1pqemRmMUY2TDdTRFMyRzV4WWZlTjdQcXE0MzYzZXgyNTJO?=
 =?utf-8?B?YjdFSGlTWlpzdUcrOWdsSEQwRGc4Y2RkTkJ5TkkrakNhVWxIMUxaSEpFcXo3?=
 =?utf-8?B?QlNNN1V3b25xQnEyazRwU0dwaVVVV05yMnpoaTM3ZEdVYm9FL2NRZkRjRTQz?=
 =?utf-8?B?bEo1bFNleVZpdkRtcDdFcmJucHkrU2lkVlVTME9Uc3VlQmtQdzdmTVVSWXdJ?=
 =?utf-8?B?Um9ONDk1V1V1NXFNcThFSDRBMWdrMnFaempyZm9oZUtuOCtYL2tLM24zb25s?=
 =?utf-8?B?SDR6a2h4WnB5ZTlMZVFOMU9SSWsyelV0MlJPYTVWcVVBVzAwbURhM1kyazdS?=
 =?utf-8?B?WktkQnptd2Z1MXgzRld4WTlHSFdIMzlQSE03R1ZUK3VVTmcrS0RSWHpUY25V?=
 =?utf-8?B?TXBSOXNJSktBcmRINXQzYlN5SC9maDlscmNTamZ5VlR5SjkzY2FmSHI1SDJu?=
 =?utf-8?B?dDZUaUJXSWJMRDhvem14Y2dqdjZVZVRjWjZZUDYrcmlCaVhkTnVsZ1cra292?=
 =?utf-8?B?RE42TjdXSXpTalVzTjlQT2h6ZVUrVTB4dll5N3A0TFZ2VENGYnBoaGdmaFpj?=
 =?utf-8?B?d1pZYUpaYUhRWk1BY3h0anloSWRHN0NwQytsY2hOVlZKaXpZUWxiMi9hQmtz?=
 =?utf-8?B?Rk11b2hqN3dkVzRqUGhBVEZscTdXTndxTnZXVmxtRmR3WDUwRCs3dWN6TU1I?=
 =?utf-8?B?YkdjZFdVK0o3TVRnRU5OejJmSHVGQzNWZFBhQmpQZlJQSlc5V0NuK1NVNXZx?=
 =?utf-8?B?akQ4eXNQU01mZVY3V1lTeTNRVURhUDdoSElQb3g0ZjJRdE1VcVBmQ1BMMFBa?=
 =?utf-8?B?TlN2dzNVWUVCbzJwUUhPOGw5Qk9DQ1g1akdaS1JSdE5mUVFqdVhtN3ZSbWxh?=
 =?utf-8?B?OUdNNXkxSG1NUGp3U2xra0ZCTDV1RlFyeDBqLzEySzd6aDdFK0lIMmYrOU9k?=
 =?utf-8?B?SXIvMFNLU1NKSUJ0NDU2NmFqSzI3TzlOZGppRnByTm92T01zUHJ3bWJlbVp3?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba80dca3-9918-442b-86b2-08de00e0efd2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 11:52:03.1421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sg1fOk1ovNj3BpKy07qIIb0gTQxgKZ9we6fF+K0r0ARtmkUiZgX61P+vKsKQCCXQfoO6/+89XImWTJfmEHZNeh5smEgrhWlt9Xv2UYeg5xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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



On 10/1/2025 12:56 AM, Matt Roper wrote:
> SR-IOV operation relies on the primary GT's GuC to operate (in both PF
> and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
> If the primary GT is disabled in PF mode, force the device back to
> native (non-sriov) mode.

can we split this into PF and VF specific patch?
> 
> v2:
>  - Move handling to xe_info_init().  (Michal)

oops, I meant _early variant, see below

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4a792e1037d5..44f99c1a39e0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -763,6 +763,18 @@ static int xe_info_init(struct xe_device *xe,
>  	int ret;
>  	u8 id;
>  
> +	/* SR-IOV (both PF and VF) relies on the primary GT's GuC */
> +	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) == 0) {
> +		if (IS_SRIOV_PF(xe)) {
> +			drm_info(&xe->drm, "Disabling SR-IOV because primary GT is disabled.\n");
> +			pci_sriov_set_totalvfs(pdev, 0);
> +			xe->sriov.__mode = XE_SRIOV_MODE_NONE;

I was thinking about clearing .has_sriov flag somewhere in the
xe_info_init_early() like:

+ 	xe->info.allowed_gt_types = xe_configfs_allowed_gt_types();
+ 	xe->info.has_primary_gt = xe_configfs_primary_gt_supported();
- 	xe->info.has_sriov = desc->has_sriov;
+ 	xe->info.has_sriov = xe->info.has_primary_gt ? desc->has_sriov : 0;

then during SRIOV probe PF will always return as native


alternatively, we can add new condition in xe_sriov_pf_readiness():

+ 	if (!xe_configfs_primary_gt_supported())
+ 		return pf_continue_as_native(xe, "No primary GT");


> +		} else if (IS_SRIOV_VF(xe)) {
> +			drm_err(&xe->drm, "Cannot probe device in SR-IOV VF without primary GT enabled.\n");
> +			return -ENODEV;

and for the VF case, maybe it is sufficient to properly abort
from the read_gmdid(), which now returns an error ?

nit: we can now use: xe_err(xe, "Cannot probe ...");

> +		}
> +	}
> +
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers.

