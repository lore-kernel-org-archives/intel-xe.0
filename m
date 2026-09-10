Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD5EC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D0E10F4C7;
	Thu, 10 Sep 2026 14:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5l17kZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E910F4C7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789051704; x=1820587704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eNEszjWywCzUyB/JnNMufFsfjfYsdmpEBIxhLYHXNkQ=;
 b=H5l17kZz/NBUUKe6LDwEDaIp1aZlLqvpEf8uhNZ3bRwOHi8wWILXG0MC
 mlwanSQaOI3hrGmdaWHOPizB2fw/gOQ0bP1Pbxxaf6QTjPoaXtK7V0Vup
 IGmZEsvcFqdPJ9OlQ2IAl6wUCxRgSsqfSDmBDYlFcMpOFlQrXzs3SHhne
 HZW51yNB9r2DfVjmF8/VHkya05JX3l1gEdEvHH9pWoSC0X3M3XhHCrVve
 DN0DCrEaMsFD9Ydt6DXNM6tEEebLT7C80kDA2+rLJ4SGqSp/Jyr8sl4Nq
 +hvtL3FbGlRl1sUVcPWSYLZIX6wwBeO8g3qmbGRwgXNvUVwMPtxzm98BO Q==;
X-CSE-ConnectionGUID: fcBuQDP5Qfiml367ov4u6A==
X-CSE-MsgGUID: 1Tc/zF5JTKm+sB95VHDLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115048381"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="115048381"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:48:23 -0700
X-CSE-ConnectionGUID: DhR7h289SWyX5iEwspcLQw==
X-CSE-MsgGUID: 9WVh/7tiQuWpH38Z3kH7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="15913"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:48:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 07:48:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 07:48:23 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 07:48:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojEB09k1QcLHNCi9mIiyhovWD05hX7zbs8k0fFVzU6BnthTBaprhMf5Kt+wAkI34l9x++IzyoSa5/82fQvOU3rblr7kznhLVEUgonlzW84xvtVCowzvlXB0BbBaWRRqMzyinBKC85sAB0zZJuaDjT4sivWRw8PMsDabQt20FwoNvV591aTIm1VgzM5lvIjIGqjBr0Mo51L5aknEFb0SUKjfLXxCNxq13eqaSFBDCakoCzPXedH7Ry+/FvGhm7FfEQFB9RLOR9PrvfyWUdqnFV2B1dGEpw4Ro9p1sgiAZa3zuG0duplCRovT3GB5UvAmymXIv0VNUlDGkiDmpXyl98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCQXhYWm8OlZGlsarsa6ibhRHMzKsn9lRte4oxoUQf4=;
 b=TErKRcJc/axYcRciXGRv+tRDVz45HuYWaaIhm3UiZiHvn/RZ6ZgHS03hEY4GvV8ZoqQBbI+R57KA+gtNF6TsIomcCPveb2hbtHkPJKE258MURqH0YbTjFbXKjJu0tH+w4wi3clp5rBipkWJPOwMSxGDguysrBOlrxi2L/TDy35ZxC94G5DH+FEIcnsgarOzehPBQMJvlP/0NQsruo4eWMXBL6AFy9bAaiX5wZkj9GAGLQhXgOKwwonsaBH8t/a31EzSNxLu04vbyaSqAr/KQFsdaIY/vdb46zvU8eWWiGmUx2+3SFOt81ZUM3y0VcJMI3Gk5gi4uRJ67l5ooMtI4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:48:20 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 14:48:20 +0000
Message-ID: <aa05003f-8630-4640-b7fb-6b305b93b5f4@intel.com>
Date: Thu, 10 Sep 2026 16:48:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/cri: Expose device UID through sysfs
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <heikki.krogerus@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
 <20260910124151.3135801-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260910124151.3135801-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0027.eurprd05.prod.outlook.com
 (2603:10a6:803:1::40) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SN7PR11MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9beb31c6-32dc-4c31-bfc7-08df0f4a8e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: ajlK8YMcbKy8AX3G4fExWerwCYif+HwVyFq/Gt1b591oqdJs7M1292vnRcIHPkVlApfmrD7jBJtHe+ejX/f7aL2mqs2eJ2B1SwegwvPKJE/FsGC93tbCRWea08uIPXIbxiu6p34Gy3+rScMs7wi/0BC3kzulXrJMGFk4e2BG3jMOMjF9CLkad+DkO0642IYEBKNEs7IyOWGE+/fWrgnN3a4Ovhk8kzECIh2JIviXP9aD6RRbustU7I4dHSUTl6azW7+V+LxpOynw6dV1CYdTA4GRzpIFf2WwlcKpM8OXF1Db2SH12xtOYBFbuf3uDAUKUecQ8Ij6wx6Zmq02unVOifCDN71dxY1ySuj7EQghyt61sbJ9jb7u3FyUN50PmzqPzGVierL0d4jeuGhZODuN8lyQCC2ZRqeXS/bJkOTxfA7ptDiy+YgyZhyHeILZgQxUq36gXq4J6apo5ZmUV/nfriNMpIFggLIuDKt2n+X50EQ9nj1N/p+wUbkt1ZAwHkJM/oRH38LCt0+N9x4CLFOujSEf6M9PsBgfS1xU6/2Th+8H97cI8HEbXdC/aUh0oO6V+P+Ein3CIb8NtaMKwIaa8LEo1Iv2+4PXYSEmGsGLBcXxS5jFik9hMpVnYNEamG//jy+oBZta9DpTYIK44zGqHAo/FJhbO+ZvdWAJqbwcB4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZZT0d3bzJwZzZpaXdiTW5BOUE4VnhCVVN0dk9UbGhCeC9XVkRpTGE3ckEy?=
 =?utf-8?B?VElWQTFRTktPbEUyYzlMWWdzalNFVzNBZlhpMW0zc1VoaXRCam5SZ3dWaHl1?=
 =?utf-8?B?TnB2MEg4am1RdDZNYWNzR3FoclRsSXNMTU9INTN2QjNWemh6Tk1kSHEyUWZN?=
 =?utf-8?B?QTU2VFpSdGFUTkJLaWJZdDBqcGtqWTNDeTduTTVkMmMwdm5sc2dyT25lZGF6?=
 =?utf-8?B?bC9JS25vQ09ibkNLZ0kzRTlYd1ZXYnhlMHhGa215LzJHZ2tVZzNTOFhEcFBH?=
 =?utf-8?B?QmdRclpvckpldi8yZ3JoU2x5VUJubzZnbSthV09RaXJJcC9HYmFVTVMzOVRs?=
 =?utf-8?B?OVdLWStMU2kwdGhoa2hEZHZEOVY0Z05sbGdUQW9zVFQ3bmdqbXpKWitKdHJv?=
 =?utf-8?B?TWV1UDRrNGRTdUovU0wwRnhoWmNDRkJnRHMrbjFQNlJiSGxUdU42VkkvOEtO?=
 =?utf-8?B?UXNLQWdUZVI3SkwzZWZPUGV1bDVlNi9rNEM3a2VqbEdLdmM5RzJRMmdaWG40?=
 =?utf-8?B?U1dSYVhsNzM3ZDk2dlRwaUJ2Zkp3S1ZyZ25OUGUxZndqTlFudDFzTCs5R3p5?=
 =?utf-8?B?alRRNGFVaXg1UW5kYlNQR0Z0ZGZCVlFET1puSGJXSUpMZ2cyRFo4ZjdZRVV5?=
 =?utf-8?B?WEhoSXd0S1NqL09mUWIxYkY4OVBTbEZ2ODFHY2VSb243VFlBVzI0YnNkRjJY?=
 =?utf-8?B?Um90TWtBMHIwNTFrUTYwSW5qU05NL2lsOU1hOVd3NDNzTnZERkV5Vkw4ZVJz?=
 =?utf-8?B?bXRaejZKelh4a0dLdGttQ29OeFVKbFpzRkJRenZVK0ZNYnRZd1AydjFQbnJu?=
 =?utf-8?B?ZkV5RXFnTWxjWVF2SUVTQlU0bUx4TmtiM1V4d1YzcCtoY0E4N1FoZU9CWEpj?=
 =?utf-8?B?N0ZmYTR1V2IrK20rN1dzU3pZSW43emp4YlpoVzdzR2JFM0w2c09Zam9JdWpE?=
 =?utf-8?B?aDFnMGFGYXZhYmwxV29SK1BtUG9rZzNHZ3RTbkJtQTZmMUY2VjU2dkYreEMr?=
 =?utf-8?B?VnpUeWJSaEtTNmw5OTZTeVVGd3VPazRxaEtUZ2xOMFh0eXpWNlo5STJKZ1U1?=
 =?utf-8?B?QlFKNk5MdmlXbjRRMGVKTitjbXR0L1JsUUE5dFhNNW10YUNRalVSWkI1VXRN?=
 =?utf-8?B?akZDQ29nbGVlaE1HL3VLeENNb0tVZHI4SlpydWxVVXBYNzV5dWN2SDFSM1pT?=
 =?utf-8?B?dDBnM2lxaFY0WlZaams0Z0lRWFVPOWxLQTBYVFhIUzB6NHAwd3ZzWVZSTndJ?=
 =?utf-8?B?MFhuUlpvSHJ2RWVtSmduMmxBdHVpVXBqQlkwUU9NNllYV1BKZEZNZDYzdFBr?=
 =?utf-8?B?MlZJZ0I3bUV1V1B2UVFGSmcwQ0dLMnh1ZHBLdXJqa1lKMitBWmZCT3FacWtn?=
 =?utf-8?B?cktJS3VCRWc2SmMyOWN5eVZiaUQ4ZDEzNjhPRUxENGlLRU1hVm1FbGJENlhC?=
 =?utf-8?B?VVc0SFVOYTR4Z3ExWlhqQjdObjVWRmZmb3F3RVUzcEloalltQTdTWWJydjRC?=
 =?utf-8?B?dS96cWdoTk9tN1FKbnJtb2ExSXdnS3duNkpackE1eUREUVdzS2ZNSHhNNWNN?=
 =?utf-8?B?d2MxNTUxSm5nK3ZaOHV6T0ZGSmZvWTJNcE9DSGJXSEd3UGZ3dmwxanJVZ2J3?=
 =?utf-8?B?WXBEY3dBWG4rdys0aU1TVmx1cmJtRHQvU3VpYStUUXdoUFdhT0NQSU1SOHlV?=
 =?utf-8?B?SFYvaCs4N0FxeVRKTFhONUhIR1ZUT0Z1RlpBRExCdFVFLy9iS2pHZTFyZ1hR?=
 =?utf-8?B?V2RSVitQZmovemxsWHVLWVZLekxiYjJlazRwUk9zdThaR0hPdlVPSENuTnBl?=
 =?utf-8?B?bTlXK1FUT3J0NGZOTm9JM2hYSTBtL0E0cVprY2wxZk1MRFNqWm8rK1ltKzdz?=
 =?utf-8?B?bDVGWGNqV3RIS25hVVdGdVc0Zk9DS1doVU82VDkycFU4TDRlS1QzNWduR2RE?=
 =?utf-8?B?K3p4UFhqOURmbjJ1d0xTTVNpLzZ4U2ltbWZrNkU5OUtQbjAxSGpoQmpOVzVy?=
 =?utf-8?B?c3kwSHVsbjY4QlRtekJldnVWVVdhS0phSnRMbGxndlpXQkZCUUovTHBSNnZp?=
 =?utf-8?B?c1Njb1pucEduZytWanZYTFlqUmFtL1Bzc3NXTk1uKzZmV3dQYVF3S3Y0WW9B?=
 =?utf-8?B?Ry8vQjJSS3JDYjlQRXVWOU1ZNTI2L2dWbDdjN24vMk9haitkYUpxN3VsdXZU?=
 =?utf-8?B?UldGYUcvNVl2UWMxQW9JbStlUlRJQ2RHSnZPVk1NWnVic0Zkc2U3YWViWTBw?=
 =?utf-8?B?LzB3dnVzTy85Lzc2WHo0Zjhsa2had1VCWVJyaHZnYTU2MFdhaVY3emlUVjJ3?=
 =?utf-8?B?QllibEkrendKb0FKUlJkdDZOd29sMHgyL3pXVy9XVXM0cTYzYzFtYWJyMXBz?=
 =?utf-8?Q?pH/VvDnalY7nGjgA=3D?=
X-Exchange-RoutingPolicyChecked: ovMXG6S6knYwbuwmvdIByS24/2/70pygto8Yo9jAgWZsrOQ74Aygfr80lvk/IYPBLl5UlgyYGpOcBK/ydMrmIpdXxzAUBE+Y7YbRJavQoSJ2JdmKdFxBeV/JvngRSwUuqnueRYTffL4wVjUlt05p9nKC1U79xx1n2azkZiDSuDrAnTqAaXRVHMcRxFLxL2k+wkZzsX9UNltrda1NIgq74+ghW4vOsi7wBhYw9Tcqsy4rDx4MPPfwbg8F6h1fPxGBvDXBBo03pWwtt96HlkMHlthkQSQg80aEGpgihpVE3AyGinqf1lT/pmip9FaA3bp+z84JCAa24mLRlc54Ya91Xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9beb31c6-32dc-4c31-bfc7-08df0f4a8e25
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:48:20.0681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9ZpZB53O98gaPI5wUE6avx8oQZgnjZJ8N+SP9BIdpxf6uRbSpZGgzG9ONFdBd0+6JtTZ0xtcZT//lftwVvWCMIJrsmOjmP+Sf7W6/4jcEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
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



On 9/10/2026 2:41 PM, Badal Nilawar wrote:
> Expose a read-only sysfs attribute, device_uid, that reports the
> GPU's unique hardware identifier.
> 

still no Bspec references

> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>   - add has flag instead of platform check to determin uid support (Anshuman)
>   - Fix the DOC: section (Michal)
>   - %s/_uuid/uid (Joonas)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>  drivers/gpu/drm/xe/xe_device.c                |  4 +++
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>  7 files changed, 60 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 000000000000..36182bbb1b54
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uid
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Unique 64-bit identifier of the GPU device, exposed as
> +		hexadecimal value.
> +
> +		This sysfs file is present only on Intel Xe platforms that
> +		provide a device UID. It is available to all users.
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ef4746b7b5d3..437485b5a0af 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,8 @@
>  #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>  #define   TILE_COUNT				REG_GENMASK(15, 8)
>  
> +#define CRI_DEVICE_UID				XE_REG(0x102008)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 205cb4e7f9e8..99f6d4184b79 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -671,6 +671,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
>  	xe->info.has_drm_ras = false;
> +	xe->info.has_device_uid = false;
>  }
>  
>  static int xe_device_vram_alloc(struct xe_device *xe)
> @@ -878,6 +879,9 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> +	if (xe->info.has_device_uid)
> +		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);

avoid low-level code in top level function, use some helper for this:

	xe_probe_uid(xe);

> +
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..657742c22d90 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>  	.attrs = auto_link_downgrade_attrs,
>  };
>  
> +/**
> + * DOC: device_uid

	DOC: Device Unique ID

> + *
> + * On supported platforms, Xe devices expose a unique 64-bit GPU SOC
> + * identifier through the 'device_uid' sysfs entry.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
> + * specification.
> + */
> +
> +static ssize_t
> +device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "%016llx\n", xe->device_uid);

no 0x prefix?

> +}
> +static DEVICE_ATTR_RO(device_uid);
> +
> +static struct attribute *device_uid_attrs[] = {
> +	&dev_attr_device_uid.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group device_uid_attr_group = {
> +	.attrs = device_uid_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>  
> +	if (xe->info.has_device_uid) {
> +		ret = devm_device_add_group(dev, &device_uid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f88bacf63c83..65366e8173c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -174,6 +174,8 @@ struct xe_device {
>  		u8 has_cached_pt:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
> +		u8 has_device_uid:1;
>  		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
> @@ -258,6 +260,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>  
> +	/** @device_uid: unique 64-bit GPU SOC identifier */
> +	u64 device_uid;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..2900f18c7b4c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -471,6 +471,7 @@ static const struct xe_device_desc cri_desc = {
>  	PLATFORM(CRESCENTISLAND),
>  	.dma_mask_size = 52,
>  	.has_display = false,
> +	.has_device_uid = true,
>  	.has_drm_ras = true,
>  	.has_flat_ccs = false,
>  	.has_gsc_nvm = 1,
> @@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
> +	xe->info.has_device_uid = desc->has_device_uid;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
>  	/* runtime fusing may force flat_ccs to disabled later */
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..fe327323a0be 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -40,6 +40,7 @@ struct xe_device_desc {
>  
>  	u8 has_cached_pt:1;
>  	u8 has_display:1;
> +	u8 has_device_uid:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
>  	u8 has_flat_ccs:1;

