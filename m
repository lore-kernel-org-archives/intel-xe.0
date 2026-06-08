Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4F9CD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 10:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADD510F0FF;
	Mon,  8 Jun 2026 10:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTfl3VFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80810F0FF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780913947; x=1812449947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cRfNbfVVJr9afDD5C+SrPZb/LGwJlz7PzVf20nlZ01M=;
 b=RTfl3VFMjujeKbfC3WtP+VghiE03keq2H/ol4m3o2AATSKKb+YKOwAdd
 NGOOV7wBWallS74QTcaiaT65z3/U5lqqBn8nAaAhkaBz7vPZNp4nVLAK8
 MUK5wdq8PG1NcWF+p+T8cSgOTEyHl/1F5U1c2qHGJ5kBNV+qAHVN4T8xf
 yCdZD7m92RmhYKZs211eFODNFkLJxQgotMqFCpcW1z46/8sfEMGpYENvX
 FGKs/SF38sBMc1H08f8kPO0dWDCqzTx0Bpt7zoiUZsN66G6CFnT63uEM1
 DEbMTuxBIC2ZScjFnMPsDv+tPjnJ5mw8wCin+PxU4/hyy6/wneuN4pzlS w==;
X-CSE-ConnectionGUID: ur6tNjsDSwOgfpxMMJ31uw==
X-CSE-MsgGUID: 9FwwzC/jR6q6xHsYEeBO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="92213408"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92213408"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 03:19:07 -0700
X-CSE-ConnectionGUID: 9GjwbXrkRVeKiYrIK+wnzQ==
X-CSE-MsgGUID: YJL/CAfsSK+ws5Jg4SKEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="245604960"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 03:19:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 03:19:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 03:19:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 03:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXfCFBkmFzJs016X5pE11Juj7Ee0d7CJcQg6RG9H01OeeZxBJ4d+YG3D6FYdMuN8fO5makhpR6nUDRYVtNdKoSlf5EjRCfJccz8iLw6l73XZ74MYrdk/I5wFU4y/odAvIvnFKNZlTrLJUhEMerY9BjuAFWEXN/Pd692J6COgqgp/Jz2hfWqjSVNbzLRfd7ZTT1VjWtSBohFhuwoNfhFLU9pDQ+ArBBjkgkYrei9Am7Tb3RFM/EqQvHpLV+tdAf46Esv7Cuy0Aeada9UQ33fvc7D+PdYZjTK6QghpNKryAaG4PIJvP2k+3E88wWChwzebHFx0IvCwbCP+GPk2o4PZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jbk55rJQaWLJ259n6+B0D6yIySJy+miPdkGLhNqWA2A=;
 b=VFgh+7vQIBDp8l0suxiZFjRalYdCjYb84v+Zwba5MawRhCFri7mZQbhMv7QwyFCbYtpElS4YXFJtawN3QT10BC52ntPKP0Bhl6SGqJ5NA2Rhs1zkpGR1P+btAEZTxYSEQwmR7oluvh3OmqmMdkbJqrSN0wPB3Dt6PpiAzJcJHtp9uPLxrMWBjW8fV26kICdFppfWAqSVQ2U4j8hWb7E44JnRkynl7TgRF7MptV8YKusD9aSbiRJ5kc6U/6A8bDlV5K7h/5eNhEDiT9hMXF94IUkphGTmqAHSMMUR3b3BSsGNCCTGnerfBurt7QnRLA7NWgq6pnd6EcsUygwQ8I6+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:19:01 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 10:19:01 +0000
Message-ID: <cfc3bd8c-7abb-4f34-9c5a-35fed43fcf39@intel.com>
Date: Mon, 8 Jun 2026 15:48:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/15] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
 <20260608084700.640376-28-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260608084700.640376-28-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de87f6f-1536-4f16-a502-08dec5475c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: IlcdbkU1YPIV4md2PP5MNPZCwHdC98HUPrcUV4z3YzpYYmRWc9g21RCywKDKdSAjTZ7PT0E7HaOhGy3maB5FvQkIW+i58qpPmJJStAbtMsF9lR115S28XHLmkp/SnzDphUxio76XHUsVIssU+ayNG82+DHWrdzI5T7Qi0yjJMhXrZnM4UU9jFJlZ5Eg6bXU1/ih4o45RmGi/nC0WOsIPWM+G42Q6uBk9pdfI8S+ZE4bv07JfHN/xqYNdckFBdDFnztgN56Jx2QAGh6lIWfS3bn6aULS+QUBtNj1U7qo08HgjtFm4H4+XzH76WhnpfR9F6ey75FWfDm9emLcAZRyfcxt34ZymU+go5mDzAK5D6LT47ZwB3H2kx2KUQZgrt5eWk1z2d24v+j1K7QOqimsDGS0UlRGaMF1SkKOZOGdXgK3KAyQdKtnqWSJLTxWEMP5mR4rTxKWSBVF3DTynYeBTpdCko1Fh20XJfNW7fyMgvooC9BdW+/XM0vWzWGP8oy6xaM2cPj3PHiRF7RhMPlgSt1el64Psf/FxCWyyZyRFNGbOWAREWubgoCgB0Z8YocyvtBu7hilmuqz0wLD367hAFI1f8MJW8QiAb8a2LLPhC7Q/A+jK2xOtNLZt/ZFu4myAA+/cdEG+9j3wauLCUhn4v/du4IiZMMlv4OspJKCOf71DY/SEcJkRH+pV4SC+viqZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZtUU1JZmJKV0pSQ1B3TGVpT2Y4bzNtNkUxVXpWdUIvUlVrN3dNOFVja0NZ?=
 =?utf-8?B?eWRsS0o1ZUNTNG8zOXBlaEt1eFV4bWEwWS9YQTZpV1hWd2crMFlTZXVPR2NX?=
 =?utf-8?B?bUt0TDZ0aisxQmJvTk1XeDZJVkZDbnI5TjRZUFkyK013bG1CSENXZXlPZ25T?=
 =?utf-8?B?VXgvbys4bGd2N09jd1VwWXVzdmJLaXB0NDlxOG9yNEpaY3cvRlFHeUdXck5r?=
 =?utf-8?B?ODErZmpDZGZMT0VvNlJaTUVRMnF3QVdRckdRZlVHWEpMY29URWZkYXVJM2lq?=
 =?utf-8?B?N20rdHpneVdOaEZBRUttZFVac3pwZ1lyWFgvSmtjd1Z3VUhQQTZqM0Rjak5P?=
 =?utf-8?B?eURoYkgvRDFtOFZYOEd4TUVUZVJYZDYwUFo4Z2FGNkJjbElQTVdzcmtSd0Mw?=
 =?utf-8?B?bGZQNmVHMGVmUWY5ZjA2Ui9rWFo2RExjOXErK2Vxdk9hVHNIMThTZGZjNlY2?=
 =?utf-8?B?ZXBxakJwV2JhTEwvZERoc1A2TW1zSDlGdTUxdkFKY3NWdmg5M3Z4OUlFem1h?=
 =?utf-8?B?Sy9LVzlwT3FxRk1IYnp2dVpxZ1pTa3pQV1FSVkJDanFjM2dxa1lEejR3L203?=
 =?utf-8?B?RmxzdUdjaW5ZL0dIbm9jcjc3V2FjRVpqVTFCazQwSFlGaFZ1ajFRenRHczV1?=
 =?utf-8?B?Z2ZZUzhJWXM0VG1vVk11QzA2NUVaOGRNbFlVUnZYSGtLc2kzRWpLMnMxUE1T?=
 =?utf-8?B?cGM2Nk9rczZwc21BSUQ4VHVFSG85U1dOQ2JRajB1dmlvUG9kdk1lMHZqa01i?=
 =?utf-8?B?dVJ0d1NDZWl6dFBGZ2F6ZGF4MG5oWHoyR0kyYS9IMStONGFuSU5mMUdPTGVz?=
 =?utf-8?B?bVg3RXFPbEE1VjNldWZqZzJCTysvUWcrZ2pVQU83dzRhZGRBQ0RRRmFBN05P?=
 =?utf-8?B?M2loQUN2K2hhaXNwa3VZYnppTWNidW9UQzdBcU5xWHdSS0JxamxIS25IMmRW?=
 =?utf-8?B?Y3hNNC9GUXFyelJJT0RiajlsMmpJZG5JdlVZWVRjblkvOGl4MXFtbHlLZWY4?=
 =?utf-8?B?VG14Qmd2SndFZERJemo1bGhhZ2xrOTdjdWxpVDJLM1RsSGE2Z2k5c0RVVWFI?=
 =?utf-8?B?Wlp0dnZBMmFVd1pLZHRpa1BkSnN0T0FyNjJBYjF3alNJN0ZQOWxuejhKQkNJ?=
 =?utf-8?B?ZDJGYjZiZkU3TjVkTnJ0NUFCajVQUjNqamFHamNLMG5CNlIvV3JhRTV2dE1Y?=
 =?utf-8?B?NW9IWUtvSzZ5OWNxamZUNUErV3BHYXhJSU1RVWhGZTI5SGhYWVhIN3J2dGtk?=
 =?utf-8?B?UjNDd1U2ZDdIOVRMeVZsc2ZpQTROY1BXbUlzcTRTYzhiRllrSmo4UEN1aUlR?=
 =?utf-8?B?Z3FuTmlKNDNzR3dTRVhCQmZPYlAzSU83eisxdDRsQkFxNnFnVTNIY29CblU0?=
 =?utf-8?B?ME1JbUdscGZDcXhkL3VDaGlmUStiV1IwWmkxSDMrcyswM3RZVHFxUXMyaFAy?=
 =?utf-8?B?K3pLRSs4WDFZS25RSTd4bjRWa0x3RDRSTExSQld6bjNWZURpVSt0ZzduU00x?=
 =?utf-8?B?akdCS281Rm1QM1hBSmNSOFVRc3VNenFBemM4QWVMUEg0WmdaRkdwRzd6Nmx0?=
 =?utf-8?B?cDZjT3RzTkFicUNXQi9vYVRhOWdQRW4xbHBOVWNveVR1V2RLOUE0OUV1SEZB?=
 =?utf-8?B?Uzl4cldqU3RWOEtkejVDeCtQRWZyQjRhNEVyZ29nWWc4QzI4VUdEczlEMHVV?=
 =?utf-8?B?R2JkY1pYMWtVTHRQS29nd1UwaDJGNGxlQk8zWGIwNW95blJPaDZpb2dhOGtV?=
 =?utf-8?B?Q3A5NE1nY3VMSTlsK1cxaFh4ckJoRnNDM2xTTzRWZHJSL0wwNU9OYkZya1JV?=
 =?utf-8?B?NDNQTkQrUWJTUzFvS2ZRRWtobXBiQnFaQ2ZNWHhsVVRlaUFJbWF3NEZLZEk2?=
 =?utf-8?B?Ni9CbTN2Q1psQ1BTZXBPRGZ2MFE4ajhLTDRrYVNKYjhuazY0V01VRWpYUk9n?=
 =?utf-8?B?QjdvMDJoR1J1Y01JMmhJRW5RUGZOTnRxbVZaNjFhYm52TGxQVWY0K1hIN2Jw?=
 =?utf-8?B?R1pwR002NlVvMmVJUy9xOHkyb240enYzRFBwbGxvaGgrWWZLZjliRjFiVnI0?=
 =?utf-8?B?cTdyaUNhRk9GV1o3S21GMW5tR0FQVUNIeGdFY2dHZ1FDclZqMU9ORkV2bGdz?=
 =?utf-8?B?d2FjVW9Kd2J0UWhrNUQvQzlMeXkzMHVvYmFlMWM4a3dEb01OaEpRZy9zNElj?=
 =?utf-8?B?am5veFBWSW1DUnFESmMxQSswd1cwZ1Z1RzMzZ0FwR3I4cklKa0NqNm9OY2hR?=
 =?utf-8?B?Q2ZpYUNkaXFJSGx6S09iK0Y3QXVKT3VSajF2bkV5UnQzUE00U0VwSTljejFU?=
 =?utf-8?B?czJKTkViQkpsVUlJYVYvS2hES2Q4NENvNEJTbFhkTW9sV0N1cUVyd1k1UFF6?=
 =?utf-8?Q?1bm/xIS+NhaZTaHM=3D?=
X-Exchange-RoutingPolicyChecked: nY4JGMqgBMkFkyCwnvNLSJCLXE1dTCNVSkVYnp01m8HCfQxZRp638ghkdFVTTwOEPsSib6KNnUyl3LsXLdnfFa7afYX7c64TT/6htztewTTFnq3LDQPwFAzR7dOpkQyYFvN7m5Wztu5ZeMa5J4DWTLRcjf4TOaZ7za+ITEhGCjw7fR40VFffBtnYW4fpnuZ84YSd9hgYFuWYoyw4ptua+K+QrwDJw04/NagiW5V/m0QB4KOG3jES4W2SNNb2PjFi+GHMbSg7XGESofblD04xyvetW7R3s6Ps8pLNHwyJCdv2FGVpxGpKdKXiQWQNwEGAyu/RpjXu6jPlsj9z2xUi+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de87f6f-1536-4f16-a502-08dec5475c2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:19:01.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ff8JTdjkIwpqthu8wdVOEhqYr92/j9tiv5sK1RcGo0uvXp9A5LW7rOGKNGFhl+iQfifJVc5TFzRB+88xah9WaIa98RRtUvP4QxTl9cXGKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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


On 08-06-2026 02:17 pm, Riana Tauro wrote:
> Query system controller when any non fatal error occurs to check
> the type of the error, contain and recover.
>
> The system controller is queried in the mmio_enabled callback.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: use ras recovery enum (Raag)
>
> v3: add comment for mapping
>      use const (Mallesh)
>
> v4: use switch (Raag, Anshuman)
>
> v5: call pci_prepare_reset() before requesting SBR
>
> v6: rebase
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index ab17418aa164..b08601f470d6 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -9,6 +9,7 @@
>   #include "xe_gt.h"
>   #include "xe_pci.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_survivability_mode.h"
>   
>   static void prepare_device_for_reset(struct pci_dev *pdev)
> @@ -28,6 +29,21 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   	pci_disable_device(pdev);
>   }
>   
> +static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u32 action)
> +{
> +	switch (action) {
> +	case XE_RAS_RECOVERY_ACTION_RECOVERED:
> +		return PCI_ERS_RESULT_RECOVERED;
> +	case XE_RAS_RECOVERY_ACTION_RESET:
> +		prepare_device_for_reset(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	default:
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +}
> +
>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -56,11 +72,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	enum xe_ras_recovery_action action;
>   
>   	xe_err(xe, "PCI error: MMIO enabled\n");
>   
> -	/* TODO: Query system controller for the type of error and take appropriate action */
> -	return PCI_ERS_RESULT_RECOVERED;
> +	action = xe_ras_process_errors(xe);
> +
> +	return ras_action_to_pci_result(pdev, action);
>   }
>   
>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
