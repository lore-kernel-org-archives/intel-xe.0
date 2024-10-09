Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA34CEDD8F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99810E6E8;
	Wed,  9 Oct 2024 12:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6ws7q9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0C10E2B0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728477789; x=1760013789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9QI54mU4ud2IxN8Zfin/PLItu7sE/P8yy8/pbDlBE8g=;
 b=T6ws7q9HVhK0x5UGOPYgGLpYwjtsMDN0bO8Dn9S/1JLG4dpwKx3GZ0yW
 xSlg8y7IMTl/BBD4xFIaacu8kb/hnPvccfoxjDFIgcQ1H0S9qFMSEw3ct
 kvxzmiKpRioaWi8B0mhIlR9nnh1sMwqEzteHqdfWQ4SMwoedxhGun5TWr
 KiVnttQ2K27rjjTOfpfGHGlWT4mHQTEo2HaVRBfnT1pbmZPWoDEzX0p6E
 fB9r4UCbfy7j9t/t7nd2X47bxWKjYCyiTXQxHRJ/kgTlnFuL5LOd5FjbW
 iStVJdFmv2Cv2hOUic5mFnjwKMvm8eB1QGgmE6F8s2+yPq5of22dIim2B w==;
X-CSE-ConnectionGUID: 2GX9y27tS6yDaDNvWkIEqw==
X-CSE-MsgGUID: OCN/lY/rTZeuLq+ptX9pRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27585567"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27585567"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:43:08 -0700
X-CSE-ConnectionGUID: EBSRe5NrTg2bLKWC/XqLTg==
X-CSE-MsgGUID: tWeAHHUwSlaNpshZ+eH2tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80806318"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 05:43:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 05:43:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 05:43:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 05:43:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEBz6IDFIRe1QTQd79UNfLlrddemEljl6WYnjckOOwfX4EUFYvMk2HOX5jtDsheFU6JxaNZmxXihJ/Ql26w+URLsEXNniELJD6eWSgUw61F6V133lHXavMX6mrujOplVIp1xGY0mdl+2IyQMQekzJf3yAmjnOjgVNN7TIPv5EGq0vXE4q6lH6mzIYNzaVXiwd84TSRvW469I5DmAXhoOIBv9Uu004j7gONpduGalZ8WOihBbr3i93n6EnMj2NU5We/9aH+S1yzRA5G4nVnp8Db/k+uQqlSdO+wns66hshCkD50z7tLYd2J+zVaLBH7ZT4X9d1xymwiWGNp0YGeAHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDYX5lXhFS+ckAv3nAAZK3WM4RJHgQZ/kLMdnjjke4s=;
 b=l4BXIVWA0ylG4WutOlCwnXUNLtdHU9BVC2Q+WcnR/DvghRS/C+fnfzLR/llYkihBdKpwNMRQ1qULFSkD/11v5xaNscsDxtgLkWebqJJPSqlWeiBPUpAcknubKxqZsUSZYaXr1Cmo/9n6CMUH6GksfoY8ntid32Clsr8BvSWsTeqDs8HcLu4ndsjSl7CHzZev0U6mhENNExRJZLVuXglzhPxdj3KVXvN5genHHqMFZ9r73oxkhn7jpGTdH7qLbrhTF0INiyLqElLO1KotR35MObX+h2lABwFzM0kJu48fk9Qrx46vYTkbW0epVd3/8f0tOOW1vNHzP3W0wPnHcquaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 12:43:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 12:43:04 +0000
Message-ID: <2564dcf5-2ec8-48bb-b4d2-5e762a0430c4@intel.com>
Date: Wed, 9 Oct 2024 18:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/26] drm/xe/gsc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-9-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aeb94ed-5864-42f1-1587-08dce85feb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1ENUg5cGFrc0doS3pOU3NMc1QwZG1GUDNWTGhERytLT1lwV3REdzErNTI4?=
 =?utf-8?B?ZmdGUk9aUmwzT2E4SE5ISzBjQnBuc2lOMXloRUcvek4rcEsvdkE1cC85QzQr?=
 =?utf-8?B?OVkxeTY4dTFiT2lORUV1bE01KzRaQVo3bjhtNUhTelNnSlZyRkhWMTN2aXVM?=
 =?utf-8?B?ZUpFcHVWRGpMaHhSUE1vaVJqY2ZYdTF6dzd5VEZxb3ZBb1FLYWwyNUhvSFRk?=
 =?utf-8?B?RFpPWG81RVJvSW0vTGhRbVlCMkF6clpQbEQ5WWNBb2VyMHQvUGI1K0VmSVVx?=
 =?utf-8?B?eW9YeHA0U2QzT29oYU5BSjNHZzdYWjVYTG40K0xNUk9QQXJPQldLdXVFTi9s?=
 =?utf-8?B?M3pySngyWVd3NG1xK1NEUEd3VEtJSUlpeGJQTzh0cWtQalp0dys5dGp5Zkov?=
 =?utf-8?B?YTI2NERES2RicllGSDAzL2kwN3ZIWnhXMERUWFZRbDJtbTVpL2hOM0p2amtZ?=
 =?utf-8?B?WG9razcyVkRlNFRmcEJPaGgvSzhCMUwvNnlVcE1Gc3ROOWhBbHl6WDY1bzZF?=
 =?utf-8?B?bHRYc0FjWFpFK0FmNXhwL2RpS1d4dGpFNWU1TnBJT2tvb2o4emdBUVJrVTh4?=
 =?utf-8?B?QlFqVTFiMHdHaG1oNFVxc2QvbG5YbzlGZU9qTzBLUDlPcDNXRGQxTnhBeTIx?=
 =?utf-8?B?UmxkcVJEb3QwTlFXM0puTUZSRVZLS1J2VXdYSzJIeDRwRkdmbVZ1M25Jd0Y5?=
 =?utf-8?B?YXo5MW1wVjVGSk5SWVZOQ0gwY2pHUkw3Y3Q3bUErb2k3S3Q1RXk5ZUwrNlFQ?=
 =?utf-8?B?VXltOWFaZ2lxOTdaaWRWQTJza2xPSHdzT2R0SGJmbHdUYXlSZGVjRnVyTWIr?=
 =?utf-8?B?UWgwNVhJQjkzazhCMVY5VmY3dVdXOHlnazZjdHFwTm9UYWVNM1RrNWR3aDJq?=
 =?utf-8?B?U1krVER2U0llODRVRnRNaVJleS9teURqUGxNVFNib21vVEFId0dXZWJ2ZS9s?=
 =?utf-8?B?dnpMS1RRbnlqbXdzNFJDR1NWU1BnYjA4N044dnY1UVk5MzlxVW5MM0tsMmJO?=
 =?utf-8?B?RWo4K0NoNUZWSEdnaVJmejMyVENEeUpZVzNHZDhEc3dRbFhUNWhZR1FsVEh3?=
 =?utf-8?B?Sy9iWjJkVmNTdGVJTmhhMSt3TmphRkFPRHNkdkdVTS8xbnFPMUJlbmlmdEx4?=
 =?utf-8?B?N0xMdnpKQ1hCeHFva2gwTzNhblhYYVRWYUZkeW5naG1oZUZQYy9uVDkxc3Jx?=
 =?utf-8?B?OWJOOFRMT1ZQNTJFcGRkdVFWMnJqUzNFbnI2WlJlODM2OWZuUU9yMW5lSkFX?=
 =?utf-8?B?dlRVVXB5cWFsalh0em8yRG4zbkJvZzJwL3JNamNRdnZ4QjRXNVl3ZGk1SEdz?=
 =?utf-8?B?NG44c3d5VGhkRUhIc2pacXhvOXE4OWFkVDJBNDA1S1FtNklCTTE1QUttQnd6?=
 =?utf-8?B?My91L0dvRTFpa0dYUUVRZGNIYmtZU3FxUDFZSGNERnNnR2txSGxJOFhkRFdK?=
 =?utf-8?B?cmREbW5xbGtJK295anY2QVBpbnJySXhjY1BIaWtiVWwrdE9mUFJid01vSnRQ?=
 =?utf-8?B?UXdxOWxvdW96bCttV3pTL2luM0VGRzFJTHY2VE11VW90SFk3MllGMnN4SmVN?=
 =?utf-8?B?VHFGOGhaSE1xTHFTTE1CekRYTUcwbHcyUmFoTGVuNDZ1UXBMamhBd1VZRWFT?=
 =?utf-8?B?cVNsTkF2YmdIOWtBR1RKb2RHRTRiM2NpaElTUmNkbjVVajl2aXdvdWdwQS92?=
 =?utf-8?B?ZkZxbGpPbWtaMlBva3p6VjhOWm8yY1oxK2xYK0p1R293enRqWUN2Ym9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVpLT2RpbEg5czNIRFhMRmhuWFdHa3hIckR6emJRWVpobnNsZ2kxWUhxdWg0?=
 =?utf-8?B?YXpoalV4OWlOeUVkdmVSYVYxeE9PRkE1aEdVSFE3WXhLeE9kbmx0eXVQd2Rz?=
 =?utf-8?B?ZmFmVjZZY3NwdXhFbFNsWDZkeE5La2F6TjNFS2NRaDltNE9rNlVRL3lCbWlx?=
 =?utf-8?B?S1ViQzBBSE1SK0hwMGdxZXBFVVR1RUE4WnJ1OFhRaDdGcXcxNXhQMU80SFYy?=
 =?utf-8?B?SEVLamg3QXdwWFhub2Fya3g1WGNaSkpsbXVZWjVreHpqc2VhSnlad3dpZW9x?=
 =?utf-8?B?ZE5SaTZOTTFRa1BBQWVvdHVCVHR5MHQrMkRsY1NjczlCN3YwKzlnekZEQXZL?=
 =?utf-8?B?dzZFZ0p1QjQ3c3NZalRjblFTTXNNbFlMYURjeTJLdi9yTXFKemh6UUM0S1gy?=
 =?utf-8?B?bysyY3QrUWNua0VqZFRsK1M0bVN1WGl0cXVzeWhuSWxuMHpXQlpRT2Yxa3RF?=
 =?utf-8?B?bWYwUkpDc2ZlNERNMnRxOFp1TGFlL29LUVlldlhhWmlKa2pFWXo5SE03bklP?=
 =?utf-8?B?dUhvU1Rxc04zNmFCS3hRYVJiYzErZ1FyVjBxR0RNS01UN0hyZlRKZWtndlda?=
 =?utf-8?B?UmhPOWMxd2oxMkRRUHhXWG05SWNNcTk1eVJJZHNEdFhaNEhXWDhvU3lTVUtz?=
 =?utf-8?B?WHZMb2Zzb2x3N3Y1OEFjY0dTalZZNXVhZXlMNTlxSWp4TUk5QTNkT2tjSk9s?=
 =?utf-8?B?c2JkRFJlTWRWSVVJQzhZV2tYeTExUnlPZEhyb1dRNklBelNFWFRkUkxBOVpw?=
 =?utf-8?B?VzBlSDR6N1NRdEVEYXJiMXNpR3dDOGNpUUhaY2dOMkZLZjJyR1V3Z21SQjRS?=
 =?utf-8?B?emFmeXJWUGtaNHRIQ3BjRy9wOERKMDl5aXhxNk51TlZTSlBpanJjUFE2cnZr?=
 =?utf-8?B?Y3phVFVvdnE3UEp6cDBSc2Nva2xxL0JCTkwrUlVuUmY3Y2t1SUl2cEd2Qks1?=
 =?utf-8?B?eU1xb2xJcFVhWWJ1aEE0SnEyRFJySGxTNUVEeXI1bmZqV01aRXF1cU9WU0RV?=
 =?utf-8?B?cThHdzF5bGxrb3p3aEw2VlR6cExtdDI2enV4a21vUS9LSkZ2Ym5ZRzBqTGg4?=
 =?utf-8?B?THIzNWJKZ3MzY1c3aEZrMTB2L2FZY2dYTTlEUUUzYUpmdjRGY3RqanZPOG1w?=
 =?utf-8?B?MmtlUDk1Q1RVZ3A0OFE3VkxQQ05nVkltRk9SL0VYZjVoaDU1WVowMUZ3MFdQ?=
 =?utf-8?B?dlVLaDdwdXB0bnNUYjQ0VGtGZVFleERCM1Jqd09rVFZwN2gyT3ArbUtQNTZU?=
 =?utf-8?B?NVdDeWJqQUtXeDREUFBOMzh4WklYbHFZejJ1QzlzUWJBQThXcERmZ2xUMWN1?=
 =?utf-8?B?TjN4UUwyR20rRXdEdjNNWjF6U2xVdzZUZUswYktCWE0xeEpBMzY2T3BCVEls?=
 =?utf-8?B?REg2a1UxWG11aDFILy96OXdCamVkSTloaVpXQ3ZSVW1ldVVmelVtbHNkNFJ2?=
 =?utf-8?B?UlhXQm9IR28wSGtTV1FqY3RjVmEwT0ZVN29SY0M3WVVrK2tBUGdJci80aUNm?=
 =?utf-8?B?QklzRjNBRHZOUUEvUlQ5S2hBcTlZMFlDS2NOMEZxaUFPOTFwdkFZNEJWUzZj?=
 =?utf-8?B?RDVrbEFENXNhbjdYbk5pZ0ZldzlHZUFnWDRIMDl2clBVZDRjdTk2dTg5eGVx?=
 =?utf-8?B?NVpJOC9aT2dVZE41clZJNEFpWmgrZ1hWQTFrSnV4NWZjdHdWejJvTjBEUEdT?=
 =?utf-8?B?blRmSDJVYnpOMDkvYmNUU0IycGd3YXdkZ0pyREl5VEc1NGFVbjZ2UTlOQVhJ?=
 =?utf-8?B?M0Y0eWFDSUp2amNndHM5QzRWTkQ1S2NVeFI1TGt6OGF5eUQySC91OCtTQ2wz?=
 =?utf-8?B?NHJsQXRZRWJTTmhyR3Q1VXZJeTVBZ3p6QWJIYTFRT3JPYW5rV0hFT0tvd2V5?=
 =?utf-8?B?eHV5VWFIMGFqSjZtZTFDajJidE9wREhJK0paZTRWNWV1M1FzTmdqckljeVov?=
 =?utf-8?B?RmFqMC92UXhNd2hxZDRLU3dNNlVDZG45VzNEK0QrSzRVdXdueU1OZUlpVG9R?=
 =?utf-8?B?VDdpY1hnVExoNHBXUE4rWGphVmc0UUtaMDA4Rjg2bnErY0tLMmpqQVU5Uk9G?=
 =?utf-8?B?ZG1yT24vYkZEdmpGT2t0UkF3ZWtZSjBuU0VLaWVIRW4wbGd4c1AxLzBDNVI3?=
 =?utf-8?Q?jNnOwTvLXC6Vu/T88VIs+B6Dm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aeb94ed-5864-42f1-1587-08dce85feb02
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 12:43:04.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXdOGFEksD+jRDgNxLsdz/qP6D9G8B8R3Y8w/AetUR+LuQyb0NFpx49uv9XvI0b5rK5vVkZZRkl5o9rQd/pIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int for xe_force_wake_get()
> - No need to WARN from caller in case of forcewake get failure.
> 
> v7
> - Fix commit message
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc.c       | 23 +++++++++++------------
>   drivers/gpu/drm/xe/xe_gsc_proxy.c |  9 ++++-----
>   2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 783b09bf3681..1eb791ddc375 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -261,19 +261,17 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_tile *tile = gt_to_tile(gt);
> +	unsigned int fw_ref;
>   	int ret;
>   
>   	if (XE_WA(tile->primary_gt, 14018094691)) {
> -		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>   
>   		/*
>   		 * If the forcewake fails we want to keep going, because the worst
>   		 * case outcome in failing to apply the WA is that PXP won't work,
> -		 * which is not fatal. We still throw a warning so the issue is
> -		 * seen if it happens.
> +		 * which is not fatal. Forcewake get warns implicitly in case of failure
>   		 */
> -		xe_gt_WARN_ON(tile->primary_gt, ret);
> -
>   		xe_gt_mcr_multicast_write(tile->primary_gt,
>   					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
>   					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
> @@ -282,7 +280,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>   	ret = gsc_upload(gsc);
>   
>   	if (XE_WA(tile->primary_gt, 14018094691))
> -		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
>   
>   	if (ret)
>   		return ret;
> @@ -352,6 +350,7 @@ static void gsc_work(struct work_struct *work)
>   	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
>   	u32 actions;
>   	int ret;
>   
> @@ -361,7 +360,7 @@ static void gsc_work(struct work_struct *work)
>   	spin_unlock_irq(&gsc->lock);
>   
>   	xe_pm_runtime_get(xe);
> -	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>   
>   	if (actions & GSC_ACTION_ER_COMPLETE) {
>   		ret = gsc_er_complete(gt);
> @@ -381,7 +380,7 @@ static void gsc_work(struct work_struct *work)
>   		xe_gsc_proxy_request_handler(gsc);
>   
>   out:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
>   }
>   
> @@ -601,7 +600,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_mmio *mmio = &gt->mmio;
> -	int err;
> +	unsigned int fw_ref;
>   
>   	xe_uc_fw_print(&gsc->fw, p);
>   
> @@ -610,8 +609,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>   	if (!xe_uc_fw_is_enabled(&gsc->fw))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
>   		return;
>   
>   	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
> @@ -622,5 +621,5 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>   			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
>   			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 6d89c22ae811..fc64b45d324b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -450,22 +450,21 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int err = 0;
> +	unsigned int fw_ref = 0;
>   
>   	if (!gsc->proxy.component_added)
>   		return;
>   
>   	/* disable HECI2 IRQs */
>   	xe_pm_runtime_get(xe);
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
>   		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
>   
>   	/* try do disable irq even if forcewake failed */
>   	gsc_proxy_irq_toggle(gsc, false);
>   
> -	if (!err)
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	xe_pm_runtime_put(xe);
>   
>   	xe_gsc_wait_for_worker_completion(gsc);

