Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594D606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9+RbPZ/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VFC8NEr1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB8D10E12A;
	Thu, 19 Nov 2026 17:13:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771010E12A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795108386; x=1826644386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hNtFtdxIBRLSQZgFhCegXmpzMWTIxl3Yvpc9bpd3nMs=;
 b=H9+RbPZ/EL8+SRmoAPE+7+pNnhRUAE8qH2LsCbmxzaLLBaCnSzyOMSau
 cMxKnp+OsIJR7zaHie99WKeOBgCneLyOcykGpx4BF9JvEudV3+UqQl2oz
 v6sFNVgBmNVO8aEpVcFFxvCCppyRyhp+cOFeKEb4kxzbW9ucR8ertBkc3
 hRo005sDvivx3Kmlvro1R/o4hOcNxSp3262qBNmK1MYbchA0wudO5VR7Y
 WUQuTMCJYGCLbHT8LZDRQkTPo49yRgseliWMudxFU14Zvz5+4ukKxyutN
 KtJkroYiQqW0ylQPm08HY2UiYaiNw38h3Lg5nQ23XV/Gm3uJxQfEb+1H+ w==;
X-CSE-ConnectionGUID: FdNEV4avROWVltRXePSurw==
X-CSE-MsgGUID: //9ReRy3QG2CBYtqzmUr1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3961941"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3961941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:10:30 -0800
X-CSE-ConnectionGUID: xIisNsjUTTi6h9XrT3rZvw==
X-CSE-MsgGUID: mkeYqd0HTm+kHoJ965iGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10824850"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:10:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:10:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 09:10:30 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:10:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDmhPZ5x/3MJBU4vkP6B5Oor4SZlCXh854+AVGq8Zo1kYqqsDTAL0TuJs3byTXjiQUXhDLli/u06FpV8VulVGd/nIvquK//03UD9uVNjdLAorz+ok1SqVjvf8BDE/HGBAkGEEQgg1R12seI4zHV2Js5/Oqu6XSnNzDU/DusabfXyvy+k2xZ+ld9XITNPnHjMS2u7RxQ9KbKJwQeFBnNMh2uC90EDSEcYJp5IDCn+ta4264rmAs6wjWKtIbGp02Xa31omFkjVoThH5sSlGHHf5atpgAwANoDCqYFAhgZRESOxddNfVOBPb4oqNEenx4MmsDxnLtIrFybmxCbBi41Edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFqJxp6dsTjfhOtO1Mdq48DtaBQaERFOQlWxvj5rjTk=;
 b=IyOzz+iIY27syJYzL6S/6G3oNc8OlEo41z6ZRiXLZsPoXPe7m5lEktNzSZl3vjjZfc+gjibvmtE9MbZ/j8rkhhd8bFRzWtGOzH2IVMDcsJCab+Ip8hkciO7eBLSg1LeUiFJGJsf7N0aZm+pS5V2PbX13B/RNVo1SH71XvY2nmZKBKCM4aIoHCHJCWgP9j42f7u9cMUPyRTWC2T0DKM2+P7f3RSJzCvtbuvzD0mfsoAmB6DMdS9OrK9FHxH58+pLuRJ/Vw+8gMRK4WoDJ2ji7Ew2CaMxfa1/oW+NvCzgnyfU6EGtNAurrMyxpotnEDRCkON3M0XRmh27eFR95Eq/Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFqJxp6dsTjfhOtO1Mdq48DtaBQaERFOQlWxvj5rjTk=;
 b=VFC8NEr1ddPFyAsd032sM3dUH1F+v72XDPYNWC/j9nHFbWTIiWkLl1BC6Kkh22fTz2bfBX0YBGdfT7NrTHhREu1qITcBPomJwltRspku+YOR8ORAKLEo/t20QjomLkIKUvJcScsZ0KZg43s4EmYKgOh6LMG6fMTjMCJ9ClN+dKI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB9726.namprd11.prod.outlook.com
 (2603:10b6:510:396::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:10:27 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:10:27 +0000
Message-ID: <2be230c8-7ece-403d-b843-9ffe4f952bdb@intel.com>
Date: Thu, 19 Nov 2026 22:40:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/userptr: Make the repin retry loop non-fatal
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-4-af2e327833a9@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-4-af2e327833a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0290.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: b624bfcc-dee9-4fda-0c17-08df466001ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|4143699003|261102123227099003|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261021123027099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: Mq+5S+Xc6dTwUOiNweDui2KjxH89/mEi4b8i3cMjBvAam3G7bsEBxKyDve3bgk/itH72qQx0zxYxQ/w+7eqtP1tyHGz2q3G9nHwjBG2act7pSYTOBfTroO4IsYkzrXDuWLW+Q83QuwhFVsmjcsGa59MY1tz7n6GPKGeXfYzXhZoo0SSzpILfGsWhgyiT8tSODt9i/3jG1BAbNJlKldkv3nJnuSg9VljtUA4ObuXx7Gu1LzYkY/O5wRb8/vbr6fRpmbmONFWVaZ6mZ3ieKWlMUEG6CFWYjcevNkQYtzbNYx5aPFxUlFz/V9PDrVx+bimGpGu4Lcfnpj5puftYaPSZXVoO6MX+c1ohVEWePr6Tx616X4ElsEnXenmpL7rSMMVAP/4HOMnupj8CS10TCJWW7ypBaadRMjoYd1zQfK8CdGT/2YjsPBisQFYXOZh3iJBWQ0J+049OBBe/FSS0CrZk4ihP7W1ABxMewLEMveil6WKr35R6yaq42BKGxUCHkzRCYAxkMf+G1KgEhMS6pel27PZspxQb2YDUw2W4w6f80+ZU50OBVCrhVB4yrXabDcm0cfnFk+l6oTpNoF+WkmuLEXDV7trDjT1YuXAWM56Tt22AJVV2Gywm0SykYUPIEJVJH67HraIFEN95ZnTJ/m99e9WSTD/JRBWGzQb24E1kDSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261021123027099003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGFGT3gycXN5bFpmc1Qwek1RbjhtR2srRTRDVmxrZXBGblVRMDVmcUFGbFJF?=
 =?utf-8?B?ZnhKSVpIQTErUHZDUmwvU3VrNXB5YmJqUnczMExCbkswNFVDZG43cUFPdnRt?=
 =?utf-8?B?YmEvUWlCRi8rd0c3ckxvNmwzUjNQLzRBRmpRczlBNzhpRnAxS2srUS90TWth?=
 =?utf-8?B?bjZ1Z2Q3dHJ4VzVLc2JzSEc1d05Pb0dWUFpmbWFUbGQwczMrZXR1KzJCeU9Q?=
 =?utf-8?B?QjJ6T2c2THNLVE5qZGJJSE5SREdIQW5EQjVKcGtFQ0VScWRZMytwb29VcGxv?=
 =?utf-8?B?NW1Gd0gweFRTMFljb1R4YXQwVHJoU0RWb0FaMUJQb1BpenNqYktlcWUvRDFF?=
 =?utf-8?B?b3lqVTdEaEZoYlZRelZZeW9mVlJvcHJvaDBRdTdRUHZSOHpkMDVkTThSV0p6?=
 =?utf-8?B?UWNjRmhJalhhNW9FdkRPVmxheENldlFzYXRSSEMwV2U0MHE4MEFXYU5LWjVK?=
 =?utf-8?B?YzZjNGFyME9JVkZPRk40NWI5ZFpUMHBsYVNvenZ4Wkh2R210VUVVc0N4RU9Q?=
 =?utf-8?B?K0Yva2dwTWw1aDJzd2o2Y1VaM2w1YmNXaSs1b29VWUlkUnJTUG16U2xtYi9n?=
 =?utf-8?B?UEV6aDUxN21wMkZ1Znd2K21maE10NjgxYWNSS203aE5IN0lLNkorWEVtYXBs?=
 =?utf-8?B?RWNOSVE1LzZxSW92VFNuZGJVSDV6b3ZUQWxpbVlEcHJiaXREVGlCWlcrRlhs?=
 =?utf-8?B?bjFqSmlWblp1U24yOWdnV0t1OWszdW5iRzBCMG52cWw3N1k3OE5HZ3VDVDZY?=
 =?utf-8?B?UU9hbFBNSkl4NUNMU0VKc3hlN3RWSkJ1amlkMmNzVEFrSnJETUZLRWdES1A4?=
 =?utf-8?B?bk1Jblhmd3U4N2pheDZaM0cwRlB2VFppak9ydDhNYTAxL3FxdmVLSHNCVVFD?=
 =?utf-8?B?ekIydWNlWUgwcDJPSHo2d1p3MFVLS1hzKzd0NWZUL0xaS0plaXA5YzB2V3Nw?=
 =?utf-8?B?anlWcGl2aUlHeGVqcmJuNkVpd3hSc0RoNDNJcGwrQWR1Qnh3MmNuamRYb3hE?=
 =?utf-8?B?RHBpbFY0ZjlkZzVCYXcvT09TN285NkhuaFdnOUlQY1NKc2NUcGQ4RmREYlhi?=
 =?utf-8?B?RjJ2TUQvNzVZd1FpY3RNUFFTaXNTWEt1UEJyeEw2N05hY3RCbkxCeEd6dkpR?=
 =?utf-8?B?cUdFOFBmUDV4eHZMY3RsYkJnZEE0OE05ZFNWZzBMb2tqZS9pVDJlU1RpOHV5?=
 =?utf-8?B?UExheWQ0VnU1d0RqdUdSeG9DalJrZ2V6Z2ZGNkpmY0JKRHVESWxoZHViZmw1?=
 =?utf-8?B?MW0zRm1lOWhPSHV5OVRmdmdabXlBZU1oOTZtbGFqazdzaTl6SXU3blFlRzJh?=
 =?utf-8?B?LzQwazBIOHBEcUtPTXVYSDQ0VncxOGJ1T1ByaDJwMEI3OXdXem9mTk5jRC9s?=
 =?utf-8?B?OWV5b3RzRXFFU2JzQSswSVUvRXdDSTZ1TlNFTklLKysxQ2U3TFY3bi9kU2FM?=
 =?utf-8?B?OVVBV1BxcXZHNGE5cWlGRXJtd1hpRkpHM2dUZGx0WTZEeDlXYklTMWJja0dW?=
 =?utf-8?B?VDRLYno1aWd4OUtuak1tN2xaMFVKaDVlay9MdEZITXNoUzNzM1VLQ0JNWkRo?=
 =?utf-8?B?SlJRN01QczV3Yk5rZ0ZVb3ZtL3J2Qk40b2J4UTdPSjFtUjFVdW80RVZGdVd4?=
 =?utf-8?B?RnE4aXhKWU13cGpjaXhGTDVQeFd1cDZ0YjhDTktwaklSVHBLYnN2NlFjc1BK?=
 =?utf-8?B?c3o1TExteHoyWlp1ZmYyL2JTdG95anp0UmVnWE1XZXdha3lBa091ZVY2RnFm?=
 =?utf-8?B?MGJDTENiVHBKaWJ4WXlIVFZQOFlDalNudW5MZWN1RHYrSkwyZU1ySE1sNitT?=
 =?utf-8?B?emdQVmoyRkVhVXlLZFB6bkk3YlRuMFFSWk8rdjBLQlo1SXpRSldLYVRrUkc3?=
 =?utf-8?B?eXZNQzJqMStQZFpOYjF3QVZ3cXpBbExKN1UrU2JYclE1bFJFcWMydHhxOVBT?=
 =?utf-8?B?aDR1ZUxpMG9oZGtHRnI5elVVN2lCQzFwaEg5Tmw5SW0zUjByMHBSYytYdjY1?=
 =?utf-8?B?VUVRTnhLQUlUSFRiVnZ0NitUdTFkb3RwTGNzSjN5bUZCQ2FqbTg1WVJ4RUx2?=
 =?utf-8?B?Z25MYkJ1emhhZ0ZheUYvZnZXcFdHTVRzN2J1eVRqS09jbk9lN1Q2RkFiV0hQ?=
 =?utf-8?B?Q1AyT2t5UXIzRFdmUzNHZ1c1ZzZqOEUyc1dkaU81TXQzMzZGTWxVVGhQWGJl?=
 =?utf-8?B?bWdtM0g3d053NFp0MnZVTUFpaGdDYWhLMWVqVjZJTThvSEtmN04vK1Rld3ds?=
 =?utf-8?B?VzlSUVY2ZFc0cDRsdFkyS1puMDhSN0l6Rlk4UFFyMk9GdWNaWGhPY2VXNkRt?=
 =?utf-8?B?UUZVNjRFZHI5TGQ1OEVma0hDTklHbnJzSU9nV2tBU0Job2RFeTFXcmZncXBC?=
 =?utf-8?Q?lFh6ycyy12OlDIeo=3D?=
X-Exchange-RoutingPolicyChecked: 2QbjNq7I/md3DwDK/o4IOOuB4NPkL3JwOiTX6TS1Ioy1TMuvQvrGHc1P5HZn9gcSJlh/5zOlZpmC6SILH4wv8bsLtBkQL+MH6M0aDUg7vFiRaU6Y/hQJQ67isx0Zp4ju3+YebmfvlB17sRwrJJ4fy6QMzXXHdyHr5/GR+uTVkSSvwWQiPRkARHHloE61NI9oyYqV8fJY/HGtF8ornWXWUQH2Nj4JPGu5Pmx2WI2lwl1qoww/XK3x9N+Cr7+ZoqHTGdx7eBBheuTbmOkLpFSUP1OVNE0GxRprkdVFe3b/QF1V4CLU2A71jXPEyOm9Pj7c4dBo7mlAE+JLtAf+kEzn7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b624bfcc-dee9-4fda-0c17-08df466001ef
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:10:27.5044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/AKzQ1qXRnWVg7XaBnmqzKkWmFdn8BmfOF2bhjwbNSQs6hVb+VFAF53d0AWCDjvb468X5U1rXy6k6aZ90gQpWrI7+paEz24BZlKlpTGBss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9726
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 16:44, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> drm_gpusvm_get_pages() gives up with -EBUSY after a fixed one second
> budget if the CPU mappings keep changing during the repin. That error
> was treated as fatal: the rebind worker killed the VM, exec returned it
> to user-space and the bind ioctl converted it to -ENOMEM.
>
> Instead, time-stamp the first repin attempt of a userptr and, as long as
> the overall timeout (the userptr_repin_timeout_ms sysfs attribute, read
> on each check) hasn't expired, translate -EBUSY into -EAGAIN. Discount
> idle gaps between attempts (for example if the task was stopped via
> SIGTSTP) so resuming does not immediately trip the timeout. Callers drop
> all locks and retry:
>
> - exec and the rebind worker already retry on -EAGAIN.
> - The bind and madvise ioctls restart from the top with vm->lock
>    dropped. Since new vmas are created on each attempt, they track the
>    overall timeout themselves.
> - The pagefault handler repeats the repin.
>
> Only when the overall timeout expires is -EBUSY returned. Drop the
> -EBUSY to -ENOMEM conversion in new_vma() as -EBUSY now means just that.
>
> v2 (Matt):
> - Reset num_ufence at the retry label in xe_vm_bind_ioctl() so user
>    fences are not counted twice across repin retries.
> - Handle -EAGAIN from xe_vm_alloc_madvise_vma() in xe_vm_madvise_ioctl()
>    with vm->lock dropped and repin timeout tracking.
> - Discount idle gaps longer than XE_USERPTR_REPIN_IDLE_MS between
>    attempts and check signal_pending() / return -ERESTARTSYS in ioctl
>    retry loops so stopping and resuming (e.g. Ctrl-Z) works without
>    immediately timing out.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c       |  9 +++++--
>   drivers/gpu/drm/xe/xe_pagefault.c  |  4 +++
>   drivers/gpu/drm/xe/xe_userptr.c    | 47 ++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_userptr.h    | 53 ++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c         | 43 ++++++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 23 ++++++++++++++++-
>   6 files changed, 159 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 1949fb103fad..0e6a197a8e85 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_file.h>
>   #include <uapi/drm/xe_drm.h>
>   #include <linux/delay.h>
> +#include <linux/sched/signal.h>
>   
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
> @@ -380,8 +381,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		xe_validation_ctx_fini(&ctx);
>   err_unlock_list:
>   	up_read(&vm->lock);
> -	if (err == -EAGAIN)
> -		goto retry;
> +	if (err == -EAGAIN) {
> +		cond_resched();
> +		if (!signal_pending(current))
> +			goto retry;
> +		err = -ERESTARTSYS;
> +	}
>   err_hw_exec_mode:
>   	if (mode == EXEC_MODE_DMA_FENCE)
>   		xe_hw_engine_group_put(group);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 98cce0f12b12..6c4e5e77e1c6 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -191,6 +191,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>   
>   			err = xe_vma_userptr_pin_pages(uvma);
> +			if (err == -EAGAIN) {
> +				cond_resched();
> +				continue;
> +			}
>   			if (err) {
>   				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN);
>   				return err;
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 9c1dac0fce6f..39806ca9f54a 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -74,6 +74,23 @@ static bool __xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
>   #define xe_vma_userptr_lockdep(uvma)
>   #endif
>   
> +/**
> + * xe_vma_userptr_pin_pages() - Pin and map the pages of a userptr vma
> + * @uvma: The userptr vma.
> + *
> + * Pin the pages and set up the dma mappings. If the CPU mappings keep changing
> + * during the repin, drm_gpusvm_get_pages() eventually gives up with -EBUSY.
> + * That is converted to -EAGAIN until the overall repin timeout, measured from
> + * the first attempt since the last successful repin, expires. The caller is
> + * then expected to drop all locks and retry.
> + *
> + * Context: Either vm->lock held in write mode, or in read mode together with
> + * the vma's fault_lock.
> + *
> + * Return: 0 on success, -EAGAIN if the caller should retry with all locks
> + * dropped, -EBUSY if the overall timeout expired, or another negative error
> + * code on failure.
> + */
>   int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>   {
>   	struct xe_vma *vma = &uvma->vma;
> @@ -84,19 +101,35 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>   		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
>   		.allow_mixed = true,
>   	};
> +	int err;
>   
>   	xe_vma_userptr_lockdep(uvma);
>   	xe_assert(xe, xe_vma_is_userptr(vma));
>   
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED) {
> +		uvma->userptr.repin = (struct xe_userptr_repin){};
>   		return 0;
> +	}
>   
> -	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
> -				    uvma->userptr.notifier.mm,
> -				    &uvma->userptr.notifier,
> -				    xe_vma_userptr(vma),
> -				    xe_vma_userptr(vma) + xe_vma_size(vma),
> -				    &ctx);
> +	xe_userptr_repin_begin(&uvma->userptr.repin);
> +
> +	err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
> +				   uvma->userptr.notifier.mm,
> +				   &uvma->userptr.notifier,
> +				   xe_vma_userptr(vma),
> +				   xe_vma_userptr(vma) + xe_vma_size(vma),
> +				   &ctx);
> +	if (err == -EBUSY) {
> +		u32 timeout_ms = READ_ONCE(xe->userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&uvma->userptr.repin,
> +						  timeout_ms))
> +			return -EAGAIN;
> +	}
> +
> +	uvma->userptr.repin = (struct xe_userptr_repin){};
> +
> +	return err;
>   }
>   
>   static struct mmu_interval_notifier_finish *
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index 2a3cd1b5efbb..179f2aca26a3 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_USERPTR_H_
>   #define _XE_USERPTR_H_
>   
> +#include <linux/hmm.h>
> +#include <linux/jiffies.h>
>   #include <linux/list.h>
>   #include <linux/mutex.h>
>   #include <linux/notifier.h>
> @@ -20,6 +22,51 @@ struct xe_vm;
>   struct xe_vma;
>   struct xe_userptr_vma;
>   
> +/**
> + * struct xe_userptr_repin - Timeout tracking state for userptr repin retries
> + * @start: Timestamp in jiffies of the first repin attempt, adjusted for idle
> + *	   gaps, or zero if no repin is in progress.
> + * @last: Timestamp in jiffies when the previous attempt failed with -EBUSY,
> + *	  or zero if no retry is pending.
> + */
> +struct xe_userptr_repin {
> +	unsigned long start;
> +	unsigned long last;
> +};
> +
> +/*
> + * If more than XE_USERPTR_REPIN_IDLE_MS elapses between attempts (for example
> + * when the task was stopped via SIGTSTP/Ctrl-Z), discount the idle gap so
> + * waking up does not immediately expire the overall repin timeout.
> + */
> +#define XE_USERPTR_REPIN_IDLE_MS (5 * HMM_RANGE_DEFAULT_TIMEOUT)
> +
> +static inline void xe_userptr_repin_begin(struct xe_userptr_repin *repin)
> +{
> +	unsigned long now = jiffies;
> +
> +	if (!repin->start) {
> +		repin->start = now ?: 1;
> +		return;
> +	}
> +
> +	if (repin->last &&
> +	    time_after(now, repin->last +
> +		       msecs_to_jiffies(XE_USERPTR_REPIN_IDLE_MS)))
> +		repin->start = (repin->start + (now - repin->last)) ?: 1;
> +	repin->last = 0;
> +}
> +
> +static inline bool xe_userptr_repin_should_retry(struct xe_userptr_repin *repin,
> +						 u32 timeout_ms)
> +{
> +	unsigned long now = jiffies;
> +
> +	repin->last = now ?: 1;
> +	return !timeout_ms ||
> +	       time_before(now, repin->start + msecs_to_jiffies(timeout_ms));
> +}
> +
>   /** struct xe_userptr_vm - User pointer VM level state */
>   struct xe_userptr_vm {
>   	/**
> @@ -92,6 +139,12 @@ struct xe_userptr {
>   	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
>   	 */
>   	bool initial_bind;
> +	/**
> +	 * @repin: Timeout state for an in-progress repin retry sequence.
> +	 * Protected by vm->lock in write mode, or in read mode together with
> +	 * the vma's fault_lock.
> +	 */
> +	struct xe_userptr_repin repin;
>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>   	u32 divisor;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ff8d355728fc..0c5121361f8e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,7 @@
>   #include <linux/delay.h>
>   #include <linux/kthread.h>
>   #include <linux/mm.h>
> +#include <linux/sched/signal.h>
>   #include <linux/swap.h>
>   
>   #include <generated/xe_wa_oob.h>
> @@ -2782,14 +2783,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   
>   		if (xe_vma_is_userptr(vma)) {
>   			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> -			/*
> -			 * -EBUSY has dedicated meaning that a user fence
> -			 * attached to the VMA is busy, in practice
> -			 * xe_vma_userptr_pin_pages can only fail with -EBUSY if
> -			 * we are low on memory so convert this to -ENOMEM.
> -			 */
> -			if (err == -EBUSY)
> -				err = -ENOMEM;
>   		}
>   	}
>   	if (err) {
> @@ -4085,11 +4078,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct drm_gpuva_ops **ops = NULL;
>   	struct xe_vm *vm;
>   	struct xe_exec_queue *q = NULL;
> -	u32 num_syncs, num_ufence = 0;
> +	u32 num_syncs, num_ufence;
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops = NULL;
>   	struct xe_vma_ops vops = { .flags = 0, };
> +	struct xe_userptr_repin repin = {};
>   	struct dma_fence *fence;
> +	bool repin_again;
>   	int err;
>   	int i;
>   
> @@ -4122,6 +4117,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	/* Ensure all UNMAPs visible */
>   	xe_svm_flush(vm);
>   
> +retry:
> +	repin_again = false;
> +	num_ufence = 0;
>   	err = down_write_killable(&vm->lock);
>   	if (err)
>   		goto put_exec_queue;
> @@ -4225,6 +4223,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
>   	if (args->num_binds > 1)
>   		vops.flags |= XE_VMA_OPS_ARRAY_OF_BINDS;
> +	xe_userptr_repin_begin(&repin);
>   	for (i = 0; i < args->num_binds; ++i) {
>   		u64 range = bind_ops[i].range;
>   		u64 addr = bind_ops[i].addr;
> @@ -4240,12 +4239,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		if (IS_ERR(ops[i])) {
>   			err = PTR_ERR(ops[i]);
>   			ops[i] = NULL;
> +			repin_again = err == -EAGAIN;
>   			goto unwind_ops;
>   		}
>   
>   		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
> -		if (err)
> +		if (err) {
> +			repin_again = err == -EAGAIN;
>   			goto unwind_ops;
> +		}
>   
>   #ifdef TEST_VM_OPS_ERROR
>   		if (flags & FORCE_OP_ERROR) {
> @@ -4308,6 +4310,27 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		up_read(&vm->lock);
>   	else
>   		up_write(&vm->lock);
> +	if (repin_again) {
> +		/*
> +		 * A userptr repin keeps failing due to concurrent CPU mapping
> +		 * changes. New vmas are created on every attempt so the overall
> +		 * timeout is tracked here. Retry with all locks dropped.
> +		 */
> +		u32 timeout_ms = READ_ONCE(vm->xe->userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&repin, timeout_ms)) {
> +			bos = NULL;
> +			ops = NULL;
> +			syncs = NULL;
> +			vops.flags = 0;
> +			cond_resched();
> +			if (!signal_pending(current))
> +				goto retry;
> +			err = -ERESTARTSYS;
> +		} else {
> +			err = -EBUSY;
> +		}
> +	}
>   put_exec_queue:
>   	if (q)
>   		xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 31245c6c96d4..4bb544ee168b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -6,6 +6,7 @@
>   #include "xe_vm_madvise.h"
>   
>   #include <linux/nospec.h>
> +#include <linux/sched/signal.h>
>   #include <drm/xe_drm.h>
>   
>   #include "xe_bo.h"
> @@ -13,6 +14,7 @@
>   #include "xe_pt.h"
>   #include "xe_svm.h"
>   #include "xe_tlb_inval.h"
> +#include "xe_userptr.h"
>   #include "xe_vm.h"
>   
>   struct xe_vmas_in_madvise_range {
> @@ -592,11 +594,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   		.addr = xe_device_uncanonicalize_addr(xe, args->start),
>   		.range = args->range,
>   	};
> +	struct xe_userptr_repin repin = {};
>   	struct xe_madvise_details details;
>   	u16 pat_index, coh_mode;
>   	struct xe_vm *vm;
>   	struct drm_exec exec;
>   	int err, attr_type;
> +	bool repin_again;
>   	bool do_retained;
>   
>   	vm = xe_vm_lookup(xef, args->vm_id);
> @@ -629,6 +633,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   
>   	xe_svm_flush(vm);
>   
> +retry:
> +	repin_again = false;
>   	err = down_write_killable(&vm->lock);
>   	if (err)
>   		goto put_vm;
> @@ -642,9 +648,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	if (err)
>   		goto unlock_vm;
>   
> +	xe_userptr_repin_begin(&repin);
>   	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
> -	if (err)
> +	if (err) {
> +		repin_again = err == -EAGAIN;
>   		goto madv_fini;
> +	}
>   
>   	err = get_vmas(vm, &madvise_range);
>   	if (err || !madvise_range.num_vmas)
> @@ -730,6 +739,18 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	xe_madvise_details_fini(&details);
>   unlock_vm:
>   	up_write(&vm->lock);
> +	if (repin_again) {
> +		u32 timeout_ms = READ_ONCE(xe->userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&repin, timeout_ms)) {
> +			cond_resched();
> +			if (!signal_pending(current))
> +				goto retry;
> +			err = -ERESTARTSYS;
> +		} else {
> +			err = -EBUSY;
> +		}
> +	}


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	/* Write retained value to user after releasing all locks */
>   	if (!err && do_retained)
>
