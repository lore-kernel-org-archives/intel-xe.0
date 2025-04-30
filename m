Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B2C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 03:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3B210E6B5;
	Wed, 30 Apr 2025 03:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRXYde1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133E10E6B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 03:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745984793; x=1777520793;
 h=message-id:date:subject:from:to:references:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8bx6T0IxFH9fuDPoGXGzacKb32bDB4Xdk5TCxxibZqA=;
 b=DRXYde1ZQZpsXsSS97KqTfpnmR7qch5ZwseABsHtfyz77171Y2jPpxxP
 kPavtVHJ2lf3iZW+OZzLY/CyMZmPKuc8YmUnPy/1kWs74fD5nYRLXqLKH
 kcQrnU/xGpWtgVimv8MCgHKSlWlmqHoHTO/hQk6v2BKl23IZZL/aZvUGk
 Jf5t4A2uAbxKVBSVVG1hls5VytDYL1HoWwUzD4ZahkH+agzmgJv+o7VtI
 TxoKuosxhEJR29tkRIAmWBLQ/R4MS3sA5mz1bMPB/h/21Ra9Flm8xw8jW
 xwlJ26eONwEcdHjC/ztVvlG66gMzGMMgRXMGTPoOGbL3c3IN97IX2Qnhz A==;
X-CSE-ConnectionGUID: dTJ7tIwWQHSRuZhZPtT9kA==
X-CSE-MsgGUID: ZF0Y9ETxTeO53xdwL2W0sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="57829665"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="57829665"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:46:32 -0700
X-CSE-ConnectionGUID: cVPOd3E5R5Koz38n4Z+edw==
X-CSE-MsgGUID: 1rrS5lZQQQeEK+xA7JfhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138981228"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:46:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 20:46:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 20:46:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 20:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol+eExv/Wg2N373hENkSGDZUsQk3v7+HXe6rGDrsyxiEJwgrSQzLx5aRzOVJ4wXSYQhMUtVffmtqd4SmnkmFVul6RvcIyKtpXK9x1PtkrmO1WeKIdN3sb1LRXC1/nLoMgEWP8JXBbOQqEnhn3W5lji3qhpWnBksnxS9y3RG6tFpRX4TTTTais9/FpIf0JXGEUOX//OkN8ompCaDc56ETa4uf5V2EVWZufvGe3agZNoDe6mLYHxBqvw/u1zSTCIbII62lMEUt883QVWeG+MR0A99872sXArb2JAlCTLJ/XIu5xJAJheYneQHqCcam+I5Jhfznf5Ywh6zzWHRTH/aH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll13VurFiPFQYtmte1HzhYFRitkHUp92lnx6wi2QdNI=;
 b=NvvxFIY6ISaq6JylAfxV2XFdb7dMyGm1Pb1Hn9ZnyadrCZ9ecVfo8iGBDCbUPIFIPltBswPN1s5PJt7K80bmljPgB7hzeDj06XrfNEjMLjLWTK5l6sXxrf21KsDCsK1WAfTabXJPEo31mruSHCIZXxsu3GvA94Aimudz9N2u72qIQQc2VQXBuhiLfOGO+6yee9Sde9G4PDmxc8AxiFsvB7OJOKltNlHqOLZpL1vLBDCpmvt0Yfg1p6otargLBR1CsfU/Qa2Nuq8axsU9ClWrZsjVG93pNuX47UlFaFnkSUmQNKS+uWi1Q0ZkLL5eCFoCmbIMcXGeeDWuvVIbk3YavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 03:45:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 03:45:49 +0000
Message-ID: <53f0955b-0236-4b49-a2cf-e74b7d0c8300@intel.com>
Date: Wed, 30 Apr 2025 09:15:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/20] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-17-himal.prasad.ghimiray@intel.com>
 <aBEdqtL8XqbUI+Bq@lstrano-desk.jf.intel.com>
 <9f3f41e3-f3d0-49d6-ad3f-e725d86cd210@intel.com>
Content-Language: en-US
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <9f3f41e3-f3d0-49d6-ad3f-e725d86cd210@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: bc94b595-43f0-45ef-29d9-08dd87997f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEhjZmRNaGVMNjROQ3l6d3pqbEFTbE5wOG85MDE5ZXRJZjIrUWo4N3lncGRu?=
 =?utf-8?B?MytqZVF1SkRDeER4aG9HalVQYlBXVTR1Q0tzc3lHV1VocXppT1BieVNTNGVQ?=
 =?utf-8?B?WGxRS211RnNlVkwrdTNTdjQyaTJDMVpQL0NVZjh1Qm9Vcm4xNnloQnl3VDdm?=
 =?utf-8?B?MTQ2TWFoQy80R0s3MmcwckZyQmpUVHRReHdhS0FHTmtUM2JJRmlIZkswTDJX?=
 =?utf-8?B?WWdIdFRJb24yRnVzNG1QZUQwK09IaFQwRjAyNlZ6R1I0TWxRZnZ4eEQ2Witx?=
 =?utf-8?B?Z3FiTWlvTUpVMDJaREcwd2NNVFpYbXpORmQ0RllkTS81VVNnQkhhWVloL2Rz?=
 =?utf-8?B?cE1EK0pGcWJjOEFHelBKWGJWaUJvdXI1Sk1DcmtBNkl5ZTJOQ2FjRHExaWRz?=
 =?utf-8?B?ZHd5REVSUEJlWXdXRDlkK0ltM0RtZ1RobkZqN0FxN2Z0cXVEczhSRndRelpL?=
 =?utf-8?B?eFlQN2xxOFo3WTcrY21oZ0tFOEtPLzFTQUdtMm1GQUQxeUkvMHZ0L2pDRTRG?=
 =?utf-8?B?dzlYbi9USDZ4b1FKZmUyMnpLZXpxVzN5cEVyWXF1MkZhSlcyMm9qalZLWEJB?=
 =?utf-8?B?QnZ3UTdlZTNjbk5sVmJBNDBjcUM1aSsrOXB0d1k3VzRyeFdkUkVXbVFlT3lL?=
 =?utf-8?B?dE9ON0JaekVYYzdNeGV6di9RWjNWbnlnb3owZmt2K1Q0dDNEK0pqL0VIRk1r?=
 =?utf-8?B?WlowMXZoVXk1Tm0xbUVPRHUrb2RSU3hWY1Y3VElIMjg4cFdOblNBVWx0WHdP?=
 =?utf-8?B?QzZ2SWFzZXRnOCtVYXNRL2JDS0syMUwxNDFCcithMFJSY0VITkkwa3NTU0o1?=
 =?utf-8?B?YStwQTdTY25MbTdLYXNTMVFEcW5yNkpjTzR4a00yR2xPTDNEZzVXdHh5ZUt1?=
 =?utf-8?B?Z3FlQU9SKzdBN2NwbG93VUJicU1HRE5OU2M3ZERFWVZkbUNpWGRiVE43SWk2?=
 =?utf-8?B?eUJKTnhHakpEOTM5aGpKQnF1RU11QUp6STQ0OGU3MlRoRUxiSklTQmJ1M3p0?=
 =?utf-8?B?akVIcEFqM2RXcHo2eWs3c3d4OXRGS0cyRG9aNzNGcEIwZVNzVXhwVE5EekNI?=
 =?utf-8?B?emVIQk1UMC9KQlJOdU05eG1NM3hQRDdmWDZackVERmtyVFhVK1RIWWUyN3JB?=
 =?utf-8?B?a2UzcU9pZk0vbFlZUS91anFpQ01SaHpJbW1RZGNScXVIUWxGeWlHMlVDajdU?=
 =?utf-8?B?ck5DbFZIUzJlb1BmRHd4TldtS3hLT1VaOVJndTNiQURsK0lVQjlLd29ROE0z?=
 =?utf-8?B?clZMN1JJTW9SNW1RWG41QjE2RzhMclN0VzkzNnhDeWJKeVhHVy9PdlZSM2Mr?=
 =?utf-8?B?Q0V2OWthTmo3dWNuMnBUS1FYM3JQWXdxTFZOZ0o0WEs3WFRici90aWtmaTBZ?=
 =?utf-8?B?TUZWTjZqRVljbzVuR2N3eEVOMjFWUVFObDBJTTJWVkVya2lmemZPVHlNd0cw?=
 =?utf-8?B?aW1YQlhVYVBBbUV2SGlwS1Z4eEwvYm5jN1FKK1d4QittR0gwcXY2dDZTR0tw?=
 =?utf-8?B?YWpya3Z5bE45dlB6Y01QTmI1RVlsZm5VR0FyVU9IbkFvZDdxZU1kT3Jxa05X?=
 =?utf-8?B?eGt4WVRWK3JEOU82Wkpmd2ZkdW5zZGNyMkxnMm00S2t6dW04Q2xlZkdqUTlM?=
 =?utf-8?B?TXB0YmtvVFljazNYbVBBMkMwZm1UYUt5SEVvUVFjL29tdnhhRVp5NzYwcTFO?=
 =?utf-8?B?UWNHblcrSTlIanE1SUx6WWxyM0xIL2lDRFFlTC9PTmJ5RGF3d1RZL3Ixazlm?=
 =?utf-8?B?dEI4T0h3dWtrN0VKSi8vOHRaRDlsVG5seHZmcUgvSVlqKytTMVNkLzhlcjlk?=
 =?utf-8?Q?dqUhidDJuSAa3BC1dnhlEU4Je1bas3hHlgn4I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjlxSVdub2tYQ3hVdlM5dUNiZm9VSUZwSzdjL3Ewb2hzbDNja1B5djVjSjl4?=
 =?utf-8?B?OXFlalRjKy9vMmZQNGYwNmJicnNobitlU25jVHJCSExvUmplUVBuYVMyaG1I?=
 =?utf-8?B?L3lEdmg2RXFJbE9udkY5cDFqZUJLQTFtTHRTcnVYU0pxVTFsdVpteUFGbHYy?=
 =?utf-8?B?QlJuUFdxbmp1K3o5WUVCQWNGbnBZMHBRcGV6dGd5b0d4YUhsei9BTklUeWp4?=
 =?utf-8?B?a3NMTkMrc1RGcmIxMTRqM1RKQm9TQVN0TDA0aDhXa3p6RG9HOTZlTWxJSFpv?=
 =?utf-8?B?MlI5ZThKRW5PUzFHdVVZUk5yUG1TQWRuRXNqaXZoRUViU0VqVThSNks3eDFN?=
 =?utf-8?B?VzVzYVlZamdWWTNmcUhveDdsZHo3RmlRZEZUVUtzdExSeERleEhOUTlUamN4?=
 =?utf-8?B?OEVmWWxxbGM5TUtFVXFHSjhrdkVicHVhU2o2dm93Vm5mWVkvMUdQNExtNXRY?=
 =?utf-8?B?YkRjeDI4azkrZm9iS0ZNKytzUDkxS1hXTVFXekNKTGRUUjNlSW9JTm9VZDRl?=
 =?utf-8?B?N2NLWEhxUWcxQnM4WU9UTTQyY1ZjT3ROaUI2ZjJZOHFEU0lZeXRwRFNDZkt6?=
 =?utf-8?B?NnB6N2JlSW1VWXZLUDl0OFN2NDRUd3FRVGxXSzhwcGlzaldqSVRqNFdjODMr?=
 =?utf-8?B?ZnJNSldKeUFtVG5PTlgxUnFLTW5NZkNQaEZKMkU1eWVCbmxnbVhsZ1AxTmtQ?=
 =?utf-8?B?cENWQWJjbVhxVElrcXhWVVJjcUNDQ2MvTlZaL1E2MnJVc1pMZmFKcUFXR3R1?=
 =?utf-8?B?SWhVWDJXd25qVHZ1Sk1NUy9KWUhNTHRremF4b1VFZ0ppRXhpQjBmcnJIZU10?=
 =?utf-8?B?YXJFd29EWE8wTFZLQUQya0I2U3VWT0ZSM2ZFYXdHS0dBU3FLaDJBTWNsNXYy?=
 =?utf-8?B?MFVyYmNtbjcxRFNQeWxLMFluSlNkL0RSY1BBT29CeVdRT3J5aE9RTmlWTjVi?=
 =?utf-8?B?REFkSERVUlo5VXBSOGRYYVV3NnY5bExqeGlNblF0WmxlTkRqSUNhbmUycVJG?=
 =?utf-8?B?cWh0VlkrbnRzdnlIZC9mdXFhSzhremlORGppM2V2OFVEeExWdVlGTUpyZm9h?=
 =?utf-8?B?TnF6LzJmQTArUW5rYkNGNHJybmxQQU42a1doemZqbW92ZDVBL2puMXN1NkRp?=
 =?utf-8?B?cXZCaWlHZnlNUmV6a3FJZXpqYy83d2VmMHAyR0ZhWUZuRCtXaSt4T3M1bUdB?=
 =?utf-8?B?SDQybVAwdW1paDh6LytCYmVXVHpVUC9kMVc1NTlBMjhnZDlSQkxHRCswOEFY?=
 =?utf-8?B?RDYxd0pGcnFvQTVvbUNTc1ZVMEF3dHE0cnBCSE45QnlpQWR6ampEcTBDRFhr?=
 =?utf-8?B?dVpjZEFoQVF5c3IwdmcxNENneXEyZ0FwbEF6Q011QVBjbW1LUFBzdnpJS1VM?=
 =?utf-8?B?Tk90S3hnUGFWTExFdjZ6eUUzVFh4QlNLblVyK1F3ejdXdE1sNzJTWjFFRTBH?=
 =?utf-8?B?RHpIQVNlZzlVNUJPai94ZWNYWUh0ajNENTM3SkhZSVozVlU0T2hVZHozNW9K?=
 =?utf-8?B?RURxeW1idTZzVTNyZEErYXFnSEVkTWhzUkVVeXFwSHlGZzBiOHBzVjRGdUd3?=
 =?utf-8?B?K0xMUkVZcGt0ZHZHVm9yaEZrbmxBeGw4bHRUazJwL2YwUmQzQnVxN0R1OUwz?=
 =?utf-8?B?bzNiYStzeStRS3M2eUtxUWNCSS8xTkJwRUN2RjNtZldld1NwdEhhbkk2VEw3?=
 =?utf-8?B?VkJ5NXBtVktUY2J5TEdhSXVsRXVpWHdjUVNpbHNXMG9VUHF0bXZqNW4wV2FC?=
 =?utf-8?B?NnNnZ3dmMERObGo3OXhXWnNOck43cVNWeDZlZy9ERnNlWGpWUFZMQUw1MFkw?=
 =?utf-8?B?WjhSd2J4Ry93V0UrMEhxRXA0V2treU93N0Jmb0pZRHhmcEpXSjYvVzB0SjVD?=
 =?utf-8?B?NjdaOGNpQjViclF1MkRVVDJNQmRFTTBRTTEwdVRiZ3lqQXNiNThUNjE5RkEz?=
 =?utf-8?B?Sk1zcVp6K3BUOWZpZ3FYODBOYUtyR1FhaWEybCthZllrOHpYQjF4YkRoekJt?=
 =?utf-8?B?MWtxc2orWlROT1Vrb2xmTGhKeDErMWhDOTlWY2R1VWtYMWVjMkdnZHBocHda?=
 =?utf-8?B?eDJwclptbUNNajhuWVJlQUt6d2p2cTZBekVBR1pMOC9SYUZ2LzNnbDRSODBH?=
 =?utf-8?B?N2JsWFZnV1FGNmZVSk1TQlZvbUo4YUc4eTRxVTg2SlZxMm1VNXp3NjlRUUk4?=
 =?utf-8?Q?D0JoK+5A/hFe2+nWiWdvv7s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc94b595-43f0-45ef-29d9-08dd87997f3e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 03:45:49.1803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNx8a1JYJqQgL1URyGz4rd17pqUDGf50C6VoEwff5a5nqrfjz4Aj/GeEqeUw602+FQHKPObdufSYCHg0Nc2UWjm+228sYNJc+h9AsX6zTpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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



On 30-04-2025 09:04, Ghimiray, Himal Prasad wrote:
> 
> 
> On 30-04-2025 00:12, Matthew Brost wrote:
>> On Tue, Apr 29, 2025 at 04:12:29PM +0530, Himal Prasad Ghimiray wrote:
>>> The xe_svm_range_validate_and_evict() function checks if a range is
>>> valid and located in the desired memory region. Additionally, if the
>>> range is valid in VRAM but the desired region is SMEM, it evicts the
>>> ranges to SMEM.
>>>
>>> v2
>>> - Fix function stub in xe_svm.h
>>> - Fix doc
>>>
>>> v3 (Matthew Brost)
>>> - Remove extra new line
>>> - s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
>>>   2 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index 90fae13b77ae..55c5373b7989 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct 
>>> xe_svm_range *range,
>>>           && (!devmem_only || range->base.flags.migrate_devmem);
>>>   }
>>> +/**
>>> + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
>>> + * @vm: xe_vm pointer
>>> + * @range: Pointer to the SVM range structure
>>> + * @tile_mask: Mask representing the tiles to be checked
>>> + * @devmem_only: if true range needs to be in devmem
>>> + *
>>> + * The xe_svm_range_validate_and_evict() function checks if a range is
>>> + * valid and located in the desired memory region. Additionally, if the
>>> + * range is valid in VRAM but the desired region is SMEM, it evicts the
>>> + * ranges to SMEM.
>>> + *
>>> + * Return: true if the range is valid, false otherwise
>>> + */
>>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>>> +                     struct xe_svm_range *range,
>>> +                     u8 tile_mask, bool devmem_only)
>>
>> s/devmem_only/devmem_preferred
> 
> Sure
> 
>>
>>> +{
>>> +    bool range_evict = false;
>>> +    bool ret;
>>> +
>>> +    xe_svm_notifier_lock(vm);
>>> +
>>> +    ret = (range->tile_present & ~range->tile_invalidated & 
>>> tile_mask) == tile_mask &&
>>> +           (devmem_only == xe_svm_range_in_vram(range));

I see xe_svm_range_in_vram is moved to using READ_ONCE in
https://patchwork.freedesktop.org/patch/650869/?series=147846&rev=5.

Since we are in agreement of using locking here, how about using
range->base.flags.has_devmem_pages instead of xe_svm_range_in_vram().


>>> +
>>> +    if (!ret && !devmem_only && xe_svm_range_in_vram(range))
>>> +        range_evict = true;
>>> +
>>> +    xe_svm_notifier_unlock(vm);
>>> +
>>> +    if (range_evict)
>>> +        drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>
>> Sorry missed this eariler. I think this step should be left to latter in
>> the software pipeline - e.g., In prefetch_ranges in the following patch.
>>
>> Migration are costly and this is the step we'd want to thread for
>> performancd. So if some migrations are done in vm_bind_ioctl_ops_create
>> and other in prefetch_ranges it would make the threading logic tricky
>> comapred all migrations being done in prefetch_ranges.
> 
> Agreed, will move to prefetch_ranges
> 
>>
>> Matt
>>
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>>   static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>>   {
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>> index 9be7bb25725c..e6f71ad0b17b 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>> @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, 
>>> struct xe_svm_range *range,
>>>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, 
>>> struct xe_vma *vma,
>>>                       bool preferred_region_is_vram);
>>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>>> +                     struct xe_svm_range *range,
>>> +                     u8 tile_mask, bool devmem_only);
>>> +
>>>   /**
>>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>>    * @range: SVM range
>>> @@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct 
>>> xe_svm_range *range, struct xe_vm
>>>       return false;
>>>   }
>>> +static inline
>>> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
>>> +                     struct xe_svm_range *range,
>>> +                     u8 tile_mask, bool devmem_only)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>>   #define xe_svm_range_has_dma_mapping(...) false
>>> -- 
>>> 2.34.1
>>>
> 

