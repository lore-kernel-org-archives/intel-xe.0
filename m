Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7B3CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDEF10E085;
	Fri,  7 Nov 2025 18:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G82WUt1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC810E085
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762540821; x=1794076821;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qbhCY+aUrwCljL0RGLPm1Qp+D6qzl8K4tWh3gExXG3g=;
 b=G82WUt1Nmi+tWChDgVz5BOuoeMOKxUy/oTiLfxtFHd3mfxx//uNak6aD
 I/aAe+vg49PpyHNTV6w6hz8EZkoY6kgchd4oB5d5HrrwtwRHhmmH4XrRY
 etS4MP48tjcgWcM0U+vopo4y+KZ1EWJtuuHBET0f4X93KGNRxw8SAklVo
 N/gfctG34knB3zdQtFY7WDJzq8NJwNMbabIMihY7mMzUO7lVZjINvQyV4
 a30uXdLYF8OO0k0D1IoWqqJnCP1LnM+hXylwWTwsI58vOtIGS0HXUnfaw
 Qht54muwlJyFjd43aHTFRRCaeCQn3Hns+P1qV7Z4U+LwRlK30apmFPwPA w==;
X-CSE-ConnectionGUID: X8AbjlC2QgCWOTqmhTEXJg==
X-CSE-MsgGUID: +25BiMc+ScSBXHsXezzIEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68556230"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="68556230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:40:21 -0800
X-CSE-ConnectionGUID: y/StJDYNQe+F0VAe+4DERg==
X-CSE-MsgGUID: omC642grQQm2NW+DG0XHxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218845002"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:40:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:40:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 10:40:20 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 10:40:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT90jrS/LOmUU9oExcD+SI//z9bAL+oqVfIyZLRwGbWgJkzL1QMyhoHW1+YUGbBoUqBoA53b44zliqXtaHqg75QSdl+oHiJdhHucAux0rRdlS0ruOSn0eau9RoNV1yuJ8cUHltQkAqrQEbmp7dt4ObDeMATLmXq4s3IW34z1jpHEP9T2gOEU6PNLEd7JHU/JtVJCBhVscqE4WJGLzMDGLL9A7L5uQjtfz7Bt8rqdGNji/kjwZma9XboMJJMj5dPKo6HkXMUfLkDbgV2wKi78IQEuYTpghZmLNzmdeVyeT46PxfSAFfo54TLOeGzhnB6v5aRNcVGv2BnhW4K8l+NwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xKc/QJQHWp0g/UNMn8BhKhrOD4HOa6hBimbEPb9gyY=;
 b=jNo+Zs7sgnm6eMyFB0X6EyFL1lFQdqt25htSathY0fCcJwQlNTaM+HFeVOs96YtosmuA9cGyizti86DSEiNXOkq/B6eEEbZN+qI67du2MqQY+EKNW5IZEXHOVlYy1FH+E8TIk71oKv53jc/dhLy0zQtcH+E8pIvgEjTYQJQTsxVF4sY5O6EuE6M98LYudPB+Ot23ReVIb5XaXVz1jzgd1wXAB6drV1b+5Hy/eqH0tpSxz0cYD8cccxLP9uCA2kR37+VquOk66Uf8AZ/4WOm85+t52btY+r+x98K2Dbb6s4R4s/qAGQZo4mLnYF95t7Zbwo4Cr+jl+lHI01GwenrYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 18:40:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Fri, 7 Nov 2025
 18:40:16 +0000
Message-ID: <379c6bc8-8064-4496-b2b1-d9481cb827bb@intel.com>
Date: Fri, 7 Nov 2025 19:40:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pf: Add runtime registers for GFX ver >= 35
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251106171502.3566894-1-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251106171502.3566894-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0278.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b93246-1de1-4b51-f13e-08de1e2d187f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9oZUltRU9ZSzluN0dubU5YMWVZRmxRTXloR3FMczFPTFVia1ZpWXZsNHBz?=
 =?utf-8?B?azhJMWQrU0psQmE4SFIvNzBqU1hQNXp0UlVqSFpka01kOGpVOHZlUXllVGF0?=
 =?utf-8?B?MU94a05ZaTBudlhQMUJabjlSS1Y2Mjc3WEJtQlE0ZnZhazFNQlhqWjgyYkdD?=
 =?utf-8?B?L1M0S0s5NzBWY0FCRjYvd1ZDQW5GVkZWQVZ5MzRnYm5XeWtOUnlML0s4MDBp?=
 =?utf-8?B?cTB6QTg0bUpiTTUrYjJ3U3JLVG4rTVFjbWJWdzFwQ1dTVXBvZjV5RzREVGxv?=
 =?utf-8?B?R3JOVE9HeUhSdmRqendNTVplMEtVSXMyeE9YVkJVeDd3SERGdWJSbWswQURm?=
 =?utf-8?B?WFBDMjhEVkpFcWJXcys1SEhBRzN5V2pTbThEYnVPYWZwdGRFUk9PUUkvZlRQ?=
 =?utf-8?B?Y3JZNTk1THo3U1lORG5KVmM0bm5VOEdwZ0ZLQThxVnVMUUJOWFhQbElEaktK?=
 =?utf-8?B?dTMwbVJiWXpuRGJuTXhLaFNVUGh5N0lSZGRWamR5WWZCYVcrc1lMRFUwYU41?=
 =?utf-8?B?YktaeWNrVldXdUhncC9qcHN2aEZMeEMwK2hjbU9sMUV2eTJQUUVBYXoxTHVh?=
 =?utf-8?B?ODkrN1psRVRSMlZwaUh0eXpDai9yb0hXam5UaWlvZDBweHA4SG5VQlZ5Nm14?=
 =?utf-8?B?cld1ekkyUTFQNlhiQXdGTWZrd1JLRWcvZ1orWkh5RU9SUXU2S1pZNFRjeW5E?=
 =?utf-8?B?eVVpT3Rwd0lPUzhMd0NwenkrbTRWaWVYOE95cHloUCtUZzhDYTVuVG10TWZ6?=
 =?utf-8?B?dGUyb1owOEdHOFc1K1JQczFhcHFjV2lrU2VSdnJsTlBIWXB0TG5mNDF5Umx1?=
 =?utf-8?B?T3JDQmE4QTdTRGVSVXJqRDFBbHV6MFF5M3BYWGo5T21obWs3R1VtbmdrOFRl?=
 =?utf-8?B?QlhqSTlleFFWMzUwZzZMdXdSNTlUcE9QMlFvQ2pqU0VWT0lDbWhCNWMwMk55?=
 =?utf-8?B?UVI3NzhHTE84RUd3OHcwT1VDSGJMY1JkOHF5cHBDS3ZmN3hJREJuN1pYNXQ0?=
 =?utf-8?B?dDFBR2ZiajV1eFV3MHZPS3JLc2dIbjE1YWhUZGhhTlhwd0xBZXJUMGZkckVo?=
 =?utf-8?B?TFBuVUFJaFMvR3hKQ2R4UUQwclYydHBhdWJOSzlqQVFvNWc5SXdVRDdZb24w?=
 =?utf-8?B?YVBFaFhXQWE0REdTbThTWUhUSG5jN1FkM1dlcU1ac2FHemdnSC9kcVE0TTl5?=
 =?utf-8?B?NVE3WUVlOW1TS1lqckZRTmdjTlI4c2ZaZElJSG4zZjJzR0VSYnl3aXpDeVhw?=
 =?utf-8?B?dUtUMStxZktCdnhpUDNWYXZEQnFJTDNUaFZSYTlnbjIwYlBnd3VraGVBZWFH?=
 =?utf-8?B?aHpPUExCR3RZQzBITHNzWTE1MGJ4VllEUmZnNkwzNUdjbmFpUmMwSEhTQ2pT?=
 =?utf-8?B?bHR4M3BmbmZXVm9ESW1HNjJTTmFJSGU4c3E1WkhCV1cwMnBmTXZFK1A2dnZi?=
 =?utf-8?B?ckM0QU5RM05hK2lSZlY5b3JhUnhyK1JaY3dkQm02c1JTRlMzaFJNemtOZUFw?=
 =?utf-8?B?VEM2MWs0RDNiTWhQdmU4WThlaE1WRXk1ZGFuSFJydjFad1I3SnVOLytQUHps?=
 =?utf-8?B?L09RbzhTM01LandKMWNxRy9FVUR0ZW9kR0lzTGFPQXAwb2FxTmxBS1lRWWJz?=
 =?utf-8?B?cEk2TVUvYm5ZeUliRWNjYjZxYlJyc2dHdGdSTVlDZmFCei9RSzBQOGJTTGx5?=
 =?utf-8?B?RU9nUXd3U0V3VWxFdk92R3RncW50dXh6Q2RrdUdudHhhT04xbUcrMTBNVTBl?=
 =?utf-8?B?MXVSRkJhQlVoTzRpVDl4VFFxc2JDSjRSK0dETGVFMm1aOER2S1l1TEYyUm1G?=
 =?utf-8?B?c0prVWY3ZVh2UkloQ2JyWWt1czRGLzI0UE1lVkMvVWVESUFvUW5XVXZKMGdl?=
 =?utf-8?B?TCtaT0NxeFlHakNycmZhekFNVUxRY0tPY1BSazdycXliRy9vV0ovbGNmaFV5?=
 =?utf-8?Q?nopF/XQcbnbWeZIlmwG58lD009IfR9Ct?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVIRWxVaFV6TjdsY2lDc3Fsb0d0VE1BYTduVkQxdVBYS01DN1E4bk5xWndH?=
 =?utf-8?B?K0MybDU1a2JvNndDMUsrVzkzRVN3eFdNZll4aW1YS2pNd2ZTZjNjekUrZWNZ?=
 =?utf-8?B?Z1pRVHpKcGhqVjFyMXVNRUFWb3NUY1BJbjV2bDN2Uk0vdTd0WjJzNktsa1hT?=
 =?utf-8?B?aEdQQzhuMkpINXJCUkZtMXZaVGlTbXJxcDJXelVWblAzbWl6QkRrQUxGazA4?=
 =?utf-8?B?MlM0bUYvMmVOYStnMCtyYkJRc0xlQUhZQmVYbm9mNklDakFZM0tlMW5RbWxZ?=
 =?utf-8?B?VVE0RUJtMWJVc1hCMzBwMFUraUdDazhkWFFWcUQxanFWVmRwSDNRcUdPaUJY?=
 =?utf-8?B?YytBb1RpQ1lrK0l6cnVNZUtNOE9Ib3I2QVo4YTVCRERyRjZJZnB0UUtBYkQz?=
 =?utf-8?B?QkdDRGFUUFZqcVdTb01aVG5VYWUyVm5hSFBwTmxVbU9xUVNqZ2N2SVpaYzB3?=
 =?utf-8?B?RHlHRDNSSVVkTlJRZGtCYmxKS0E5TTY3MUtDQTlCRkNxSndoMVcxa0JRSkxi?=
 =?utf-8?B?ZkpueTNJNnYxNUtKRGU5a25TVkM0Z293cmhpVkNrZXJteUgxeXBHUU9SYmpM?=
 =?utf-8?B?NzhRNG1hUW9jNVl1clhEM0ZuSFc2alczd3J5VnFXQzhHd25aR1AzMjRKRVNX?=
 =?utf-8?B?WFdZRGNMbkdOYWJvV2Q2Y0tmVVFQbWFCVnZTcHorTjhITkN4YVJ6RWJOVjZF?=
 =?utf-8?B?dzJmZDVWZHdXa1R0SnFjU05aWjI4SUQ0cGpsNEFob2xjcXdKWVdpNXRXOCts?=
 =?utf-8?B?Y3pGVVNiRk9MM1FwR3hsZWNGTVo3d2ZGTU55N3FUN0tVTytSSDlOWjFaRHB5?=
 =?utf-8?B?MDdjOXlBRDU4V25ocVNPVW1kMzV4d2JKSm5FSWRKc1lHbWlNTXFFKzF0Sm1G?=
 =?utf-8?B?VUFDNlhHVmRXZmRod3NwZ25vZDQ1UmRPckhMVWlTeU01Uis0d2h2bVdVSHVi?=
 =?utf-8?B?NVJWSzl2YzYzTFljMHRRdG1yNzRlNXZBUXNoeGpZMEcvWk9RQ055Wit1bmxm?=
 =?utf-8?B?RmZxK0VCTEQ1dCtvWlhyU2JGZHJCdWx5c0I0OGhvVVdUUjJmVUMvVTFnaUpS?=
 =?utf-8?B?RlB0WXBCUExrMUVORW5MYVR1aVlWcW9QS3R6R3RSODM4V2d5eFF0TUlIYkRT?=
 =?utf-8?B?czRuYVM0S0laUXphdXplMkdsS1FYa1VSck1nN21ZT2VPYUZNWER4eFFTMmND?=
 =?utf-8?B?Y3h1ZG5mQ0M4RjRGVStEZFEwRnlqN1lxc1d3UkxaeitjU2hIaWdOSjFRUk0r?=
 =?utf-8?B?WE14UUROWVlDZ3NVZWRqVEF0c2hZTnBTRnhWVTJpK1FTL1pUSS9pbk01UkZq?=
 =?utf-8?B?Y2M3TVd4UFdodUtaclNjRUFYcXpFSG9ualJvS1hVZjBUZ2Vody9FR0p1UFY3?=
 =?utf-8?B?S24za2hiWEVnU2JuMGFOREJ2OVM1OHFuVlFOQ1Uvdjk4QlRpa0h6VEhwbm1W?=
 =?utf-8?B?c3l2am9sei9SNnJYdWhNNCszN1ZjalljbmxmZVdJWFlKdm9SbklRdW1mNHdQ?=
 =?utf-8?B?YlRoM25aaDVJUStXZm9YUFliSU83MUxPMzEwRXZNRytWTUxUS3JuSTA1WUUr?=
 =?utf-8?B?cU8rclgyRUI5RHdUdWhTelJzZTNaS2VKK3QzMXQ3U1hpZXVNaEhSVDEvNVJz?=
 =?utf-8?B?ckZNdjJ1S0NmQWMxRmNDbmpZN09adGltOWRVa2pRU0h4eW5BNllSUVpLSXNQ?=
 =?utf-8?B?WGRJVTNUbzA1VlFwTDh0U3BZRjE1R2VLQ2o1ZGsyZWJrZ0xZZGQ1bnBpTUdL?=
 =?utf-8?B?RWRDdURrQ1pQWGYxYUNoU3VVVEZYUzFsNnZBemtRLzNoN3ZQUFVGOXd3S3Iz?=
 =?utf-8?B?cGl6UTZZWENuUk80UURhZHdmT0dETnA4bG94SC9vUUdLeTQvT2Q3SkRMK3Nt?=
 =?utf-8?B?QXVQWm1NMFhqSjcxMm5oaUltVklBbTFidE9VM1FWVnNpdXJnZDJzWmordEM3?=
 =?utf-8?B?V0Nzb3UyQ2VaTU9EZ0xuRmw3MGpsR1IzbGRicCt1OTJiT2tHNUFzem5tMG9h?=
 =?utf-8?B?UFoyS1VWTkNyeWtYdGZ2SS9Fa3NzYlJVMVFtTG9NQ05IaytXcmVmOXN4L2g2?=
 =?utf-8?B?YmJ0NTQrWVUranB0VDU2bXM3SVM4bUg1M05FOGl4dTM4ZTR3T2c0dVNxVGtG?=
 =?utf-8?B?eHV3WTZlVzVMTmhyS3ZoOENFY28vc1ZUNkZtbHNsMkxDODl3c2NwM2tZeDRY?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b93246-1de1-4b51-f13e-08de1e2d187f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:40:16.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktBrTNiH4ZP6/moGCiv0/uesSAs8+3mlpfnRQPlobmMY/hfFbsNCEGUBBFz1VH3X+38pCP/6Ts+ThBbIbfR6T+iy99a4qq/TdFgQ7IPYLJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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



On 11/6/2025 6:15 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Add missing runtime registers for GFX ver >= 35.

I guess it's more about being a different set of registers than
defined for the 30.x

maybe also worth to mention new SERVICE_COPY_ENABLE register
and no need for HUC_KERNEL_LOAD_INFO (if that's true).

> 

and maybe we should add

Fixes: 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")

where we already claimed .has_sriov support ?

> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 22 ++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 76dd9233ef9f..c3281ed76aa1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -99,11 +99,31 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>  };
>  
> +static const struct xe_reg ver_35_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	XEHP_FUSE4,			/* _MMIO(0x9114) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	MIRROR_FUSE1,			/* _MMIO(0x911c) */

btw, do we still need this?
it was added to support legacy platforms we used as SDV

probably we also need to check the 3000 table for this

> +	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> +	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
> +	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
> +	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> +	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
> +};
> +
>  static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
>  {
>  	const struct xe_reg *regs;
>  
> -	if (GRAPHICS_VERx100(xe) >= 3000) {
> +	if (GRAPHICS_VER(xe) >= 35) {
> +		*count = ARRAY_SIZE(ver_35_runtime_regs);
> +		regs = ver_35_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) >= 3000) {
>  		*count = ARRAY_SIZE(ver_3000_runtime_regs);
>  		regs = ver_3000_runtime_regs;
>  	} else if (GRAPHICS_VERx100(xe) >= 2000) {

otherwise LGTM, so with updated commit message and clarified
the need for the FUSE1,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

