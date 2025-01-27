Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B4C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 10:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD4110E21E;
	Mon, 27 Jan 2025 10:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lm7/eKJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B298610E4FA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737972394; x=1769508394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PjaLgOm9dhvEgfrKtySwMtDZbPqSpbbutAXej11GBUQ=;
 b=lm7/eKJ4doe+V2BqWDrug7YYTykOc4yHNMFGjtzFelT4CUGhF8VowTex
 OKR1QuERnkTgd/7Mmv+984cCceJ0whYCk2qCWq7dSAGyUgzNa3YLwP8wO
 I1sfK0BaHNi+HORqyj/V80axKLq46CySYL/FHPP2yfD6Dgk3U33LhVwYY
 VwKYyXixUmq857wma2x8wAEsDoTeauZtp2KDExWCbIvquYIvKSAkT3hqF
 plt1ZVdG/HvkH6cN7i0kp1cr5AVA5h4hkQsnALYg7joOoj7QDs/W2/ov7
 58c4J/TUnbdndYFMwRsu6qGXD1cvpfu6BNPteTKHe4/ZSclqM/+h+qxT9 Q==;
X-CSE-ConnectionGUID: 07+MQAiUTw+G3T7ms6NvEA==
X-CSE-MsgGUID: OgHRLWmiRf2y8koGlFo+vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60894242"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="60894242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 02:06:33 -0800
X-CSE-ConnectionGUID: sbeEIRexRsukdXJYymoyiQ==
X-CSE-MsgGUID: ne65vbnsRYWJHZDAuqoeCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108919146"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 02:05:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 02:05:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 02:05:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 02:05:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sea8fP+8y8+WoqXrXaEYU+ZAhEK67eckqrepzNjlJZNPs8e4yW/mxo4O1PgQxjB13J8WkXYyx0bomq266Gwsd5Mog+uI1QzFQQACRlqjzaN/PNMA26oA9IktWBinZWQhQtS81DkHZnElBAdnKY10JTK5a6Rx/9ObonLe55DqZqL7Fiu33aUKndL8tVgAcESSPC1j3zMv+vvF/AauulHqpS8ypykYfxtSIJbF8W2CmLi48GVrA5tWMJHMR7i4I1N7iPiE2MTaLxEIv2xfJexNBlYdtK+0CcS8X74abw4SKIKSMFgdxOXNNnnMTVCZqJUigo4sipXSZ7TqLouZS/SypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePqxhZHRGq2OqhdFYXrLtbxQxhdlaBxXsRB9cS/ydnE=;
 b=KBpaK80ZTV/vPw7Xs7CgozJAuls6U7iDxybeFJB3SoC352oeTZQDRkmooGhxixKbB+fYp+SvsPcDQGlKmeRf2wa8tTiurLAlztk+RtdJb7wo7ZnCGeC59919fAPooKKB5FS/N17fYkl9M+1IFHg6NljQbK7IiUZ5iiSPs5+W7SIMa4t8hdhqW6p7Rs2rQiWyo1lTaQTqaFoCyNyLD3lg+46yMgAGtzlCr5rFkHbqflIu7x40eqFhkLN/w72jyhbQTn83fSXPtW6Eou9tjz9p67ol3lTsdxmwqx0mDK9d4/m83FVY+IBZ0UgI4DQkzZsDtA/CoJn801NdLOBy6/d5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Mon, 27 Jan
 2025 10:05:51 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 10:05:51 +0000
Message-ID: <ff840b0a-c693-4e6d-8097-6e4c08818100@intel.com>
Date: Mon, 27 Jan 2025 15:35:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-9-riana.tauro@intel.com> <Z4mRy9d7leeoPDLB@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z4mRy9d7leeoPDLB@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::31) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c104b9-8aa2-48a4-8735-08dd3eba2dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1Rhdnh3dmpST294Y0NmTTA1bmpwZ0taSXNwejBtY1J5TWVwYVFJWUtEdjBT?=
 =?utf-8?B?cEtZTTFYWmQxYk4xWDZ5QjZoclJ4UnJCMUgrc2tMT0lQMnU4SUs2ZVdwUEV5?=
 =?utf-8?B?QmpSc0pyWGVtcjk0TnRYeGVpR3FDQTZDNHBiR0kyN05VNFNpc3dsNUh4VG91?=
 =?utf-8?B?eXpOQVBuVWpHOU8wU1BLMTJWZTdzOFB0UWpCaFI0aVFoS3pJZnhKSytjMlhz?=
 =?utf-8?B?ajVOTjRST3NkTE1Ma05kVXlaYlV6OVMrSXQvL2xRVER5YytxREl1Q2tmRTlG?=
 =?utf-8?B?bExjWlJjYXVWVTJGTkJrQ2lzWHdOK0kyV2ZXUFJZKzFMVVE4L1dDaE1EaWtJ?=
 =?utf-8?B?K1NhMXhkeTY0elJZNmFPdXhuVGpwUUdRQWxJU3BmaERHaVpVYmJJOXhCbGY5?=
 =?utf-8?B?ZERwM1pjTTE2NkY5SFYwbkVHVUJSYXNIS1V2SHFieDFJdlhPT2JydHhYSXJY?=
 =?utf-8?B?bEpOOU1xQWUvY0VKbGRkUEhxMkpjLzNyRXNVWnJ3Z1Z3eG1Lamx6dnlkZGpZ?=
 =?utf-8?B?QkxONkF4TVhvbUdUV3BEV05COWRVZ2VLdmQwd1A2Q2N5dWw1Qms4R2w3U0ww?=
 =?utf-8?B?dk0xdWwxV0tvekZVRW11dzZIa2dhRUZBTXdWeEszWmZIeERuWTJNTDdPMXpx?=
 =?utf-8?B?aWFNUzhJMnRMOE5aT0VTR2lYamRIb3JsYVM2RittYXRzeldRMHpGWXVRdHFW?=
 =?utf-8?B?cHNJUW42cFlqa1o5KzI2REM2NEZoNFVhSnpRMG5acWdXNkJBcmhCSXlNaGVU?=
 =?utf-8?B?NkprbUlwbG9hM1MxRWpoaktZMWNCd3Q2cDRrQzBGa0twa0hsb0o3SzRwM2Jw?=
 =?utf-8?B?OWpFUEM5RCtxUjlTOGdQVjFEYytlZk4zMEZpS3ZkTkk4dzlBUXB5RTZweUFw?=
 =?utf-8?B?dVc5SmQrQ2NRVUh4dzRHVWdBTVBsY1k0NVQwaW1oYkwzd3JEeG5zclNsV2M1?=
 =?utf-8?B?bG1LSi84RlJZc09BdzdnK3gyVHhFM2tKT2RUQ3JwdWpRU1JaZ29ISWNYVXM4?=
 =?utf-8?B?Z2Z1WWJ4OUNIaWx4V2dXbG8yNG14TDBSMTRKZEc4SzFUQzlic3M5WGhhSmVi?=
 =?utf-8?B?alZnWVJybmFPOURFeWtwOUhyWFRSYTFMdTNnNVE5MDlYZlcxdU9TZ0E4MEZN?=
 =?utf-8?B?bVhHYVo1VmREcFRCdkJzM293LzVrOUtvNElUcXE3UUNZRW5yc1UxajI4NGFL?=
 =?utf-8?B?ME0xeXp4aE9NNlBRQy9WRUdpSTZIUUQvak5TUHhxNDV2bnpaUHdhQzBrcmdy?=
 =?utf-8?B?SWxWVWIxcEs5T1lOYzlDUzN5Vmh4Y3hRblhsWVQyV09raHZSTUcyOW4wbGdX?=
 =?utf-8?B?dkxONHloanB6VnVKZEIvbXBKRUk0MVUyanN4Um04QzgvaFRGbU9DUExZejhN?=
 =?utf-8?B?aGJGbGFORGp5Nmh6aWUyUU1Tc0QzdUUrNjBLSElvMUJQVmkxMDM1ckVsQVdv?=
 =?utf-8?B?TFBhNEJta3M0Q3NXQ0dwcDV3QTZDOCt6RTcrVXFGQTZETGxGbEsyNnlqa3do?=
 =?utf-8?B?RHRXNW5sS2J5UnVVUDh0bTJGZnNsQWNSWFJuZDRLS2l4N3Rya0dHU1dkRk9H?=
 =?utf-8?B?ZjVLR2dpc3NYVEF0Y1JwR1U5N1RTaVRiNHFKWW15K2FseWRvdzh0S3o2SGxk?=
 =?utf-8?B?VVFERkxjekE5eVJyaTZDMUNESW1tWE5VVkhDQ2JTYjMra0k0c29zdFdpTnYr?=
 =?utf-8?B?UW1JVVg3MkVPVElleG1WMFpWT0MzTTNwOSsrVEtkUEJBc0c0WjlSeS8vZnRj?=
 =?utf-8?B?Tml2M2p3R3JLOTdCQmZpUEhJb2lmMjVIRXEvMTJHUERQcVhnQVk2bmFZU0l1?=
 =?utf-8?B?eXdHRENzbzZuZ3ErK0Ewc0lGQ09HUFA5clZRMWE5eHBQdFBFdExoMExTOVFS?=
 =?utf-8?Q?HC/7URLjCFPuC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFRSWXJSN2FjOU9UWldXL1RIWUpHbWRkaExhQXpNRGVDNExyamVIUmhKNzFR?=
 =?utf-8?B?S2NHVDNVOGtScmI4UzlzN0RvWDYyeGcvR0xZS3lIN1JCdnlLYTNGWUtSRkZw?=
 =?utf-8?B?NzFmYkZnRk9uQnJhZlZYUXA0TGNFNmZBcUczNkEvcmFxR2VKVHdpZW9TbUZ2?=
 =?utf-8?B?Q0x4bHlUQjJWZk53STRQSDV4TFJqT2t0YnJaT0c0NjAzSzFQcXVwY0JFSFNt?=
 =?utf-8?B?T3Juemp2RVRlUEdDT3AzcmVMT05NZWluMHJzWDVUV1RFN1NHL0ZJVm9jaUhk?=
 =?utf-8?B?eGRwM2dldnJMSlVIUzdVUkNRNmRscXQ1ZTlveEJIdHlnTWhjZzlmQWM4ZDl0?=
 =?utf-8?B?TUlkZ0VNZkFiQU9kSEd5SEVWYWdqVThxVVdvajRwUDk5Vm5GQkRYL1paWlMv?=
 =?utf-8?B?MjBvQmNCZFBHWXVHbWFOMGJsUHBhL2VCMXhGMkJESkQwYmFpbG1SQ2w4UVZt?=
 =?utf-8?B?dHpuUXUyVExrRUZ3dUtyN2pHbkx5NnU4SUwyYldBRTZiQVQzVTc4c2xSNCtN?=
 =?utf-8?B?N3RsbURtYnhyZ3lEYzFxV3ZpcFVmdjI1ZVBxTHNCbC9yMnpqWE9QZkpOaGtv?=
 =?utf-8?B?WnI4R2NHeEV4TjhaUFdSb0J4Uk5xOHpJdzdKWUNGUDVKcmNlQ3BxbGpFWXEw?=
 =?utf-8?B?amVFbnl1bGRoRzJOdlNySUQ5NzZZYmpqNFl1WUxKbHYyOU1JU2pRRkErZWdX?=
 =?utf-8?B?YWpGNzJVVHdWS3NvMFo2SENDTWIyYjJuVERIN0YxSnZ4MHFVYmhHeGYzVHUx?=
 =?utf-8?B?ZWVGcjIrVTRRWkkydm11Mi9SM0RRdjQzUHoyWUJCZmdhbkFjRlVFdzNzWity?=
 =?utf-8?B?WlJqRkxmczhPekhHRndEUmRVVm9IWDhaeHRacGlWZGlrbFFCYkJEWDF2ZWN5?=
 =?utf-8?B?d2VuajJLc1pWZzFkYTBJYk5tYTI4dnpaWUlCbVVGNVZvUWxQVFlwNXVnM3o4?=
 =?utf-8?B?SkdtTU1tVEUyVEpxTExoNHJlSm9QWlp4Y09idi9DL1RUeCsra0RRdEMvUll6?=
 =?utf-8?B?OW85TDZRMGNBWkZBOURDZWdzd1U5Y01obGgwRFRYSnFQb1diNjJneHVXWW54?=
 =?utf-8?B?REd0eDdSYWp5WWFJb3NoRGIrRkNhdzN2VXJVaytEVzZzeHBnN1VHNllxMHVy?=
 =?utf-8?B?OTF3UTdIL01SWVY1cXBLYmh4eE93L1llNVJ1cTVHWGdydDAweEZVbjRvdVEy?=
 =?utf-8?B?bUcrSkxBUXFtS3VDMnRvV3Y3R04rV2Z5bDduYkVVUDhPaVcvazg3Z1J0RFdi?=
 =?utf-8?B?OHNXVDZJNUZhVU02bURLV2Q0RFpIYUdvOGEwaDNrUjd5OUJhL0EzUWFQMHVv?=
 =?utf-8?B?VDJzekxGR2VyT2hGMlRSQkpWSzdyQnRzbndjWjhxakdPUzV3Q0Nibnk5RlZF?=
 =?utf-8?B?RlZ4WWcvbmxYVDVrM0lpSFN0cy9YUkFINFplMEVVN1RZS1Q3eW5JV1hMZWlh?=
 =?utf-8?B?ZWFvUHFUT2ZHQm9pUTdPTWpIMEV6dmJzeXJDeDdBOVhHVWliWmttdDFCQ0ky?=
 =?utf-8?B?V29lM1p0ejF2M1dtaStvNnlHV05BcTYyUzNIaGdiczByYjVHTTFVM3BONU5D?=
 =?utf-8?B?cUtWbmJIbUVFU1ZsWkxRbkxJMDZvMno5dWprMi8vRHBoSElnOFQvWVF4ck5F?=
 =?utf-8?B?YVpxcmdiTS9BR1dEQTRrQ3pUV3p2ZEJDYytMbWY5STUzZkdqS0NiMlNzUENt?=
 =?utf-8?B?QldlTTZoSjB4YXBlWmZjOXNid2twL3NmZTdxMFZIUEp2b2diY3hrd0ttSlpB?=
 =?utf-8?B?YmdxellnQ2x3bU5rZ0N3a3FNMWJiZVppYlRXeThINHJGcGZCNXRVNHdBNFhX?=
 =?utf-8?B?OHNENU15RG5pOTVzQ3BpVk9pQ0pFcmVnSjkybWNOU1Z5dDRZckxwc1hRUE1S?=
 =?utf-8?B?RDBZTVN4ZTY2SUM1WHpFYU5aYVFZMUNySXI2RUtLeWNKeGVLTjZEN1d4aFI2?=
 =?utf-8?B?WVdvZGNNcXN2bHpMYzBuekduR1pvcDJLN0xSK284Z1p3YzM2dHJ6R2wybDYw?=
 =?utf-8?B?ZWgxaUtvbTRlRGJCendzaWlTYko0K01Xd1hJR1lFRlZPZ01pdzFMNDVsUHhk?=
 =?utf-8?B?WXcwUlR2UlZzdG9XY3N1NXBjdDJYeUx1Ti9Hc1NaUUJHV1pCR2swZXQzV1hw?=
 =?utf-8?Q?X0kUepiKtZ0Qfqi3B8+Jnq76/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c104b9-8aa2-48a4-8735-08dd3eba2dd9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 10:05:51.4448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTDzFMxfulvZHhYthzgAGfbze7gpSIsdqy5cNvs21nxmXzWwnq3O8e92/cIFRR/pHqD4lGzc8JZ8GWGvstf/UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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

Hi Umesh

On 1/17/2025 4:40 AM, Umesh Nerlige Ramappa wrote:
> On Mon, Jan 06, 2025 at 01:25:57PM +0530, Riana Tauro wrote:
>> Engine activity is supported only on GuC submission version >= 1.14.1
>> Allow enabling/reading engine activity only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: use guc submission version (John)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc_engine_activity.c | 31 +++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
>> 2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index 14950b42d1b1..5aea42f0cded 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -255,6 +255,9 @@ u64 xe_guc_engine_activity_active_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     return get_engine_active_ticks(guc, hwe);
>> }
>>
>> @@ -268,9 +271,31 @@ u64 xe_guc_engine_activity_total_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     return get_engine_total_ticks(guc, hwe);
>> }
>>
>> +/**
>> + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>> + * @guc: The GuC object
>> + *
>> + * Engine activity stats is supported from GuC submission version
>> + * (1.14.1)
>> + *
>> + * Return: true if engine activity stats supported, false otherwise
>> + */
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>> +{
>> +    if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>> +        return true;
>> +
>> +    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>> +             "Engine busyness not supported in this GuC version\n");
> 
> A warn ON may be heavy. Can we live with just a debug print here?
i can replace it with a drm_warn_once which doesn't print the 
stacktrace. I thought warn_on would be helpful to flag machines on CI 
which doesn't have the required guc versions.

Can replace it with debug/info if not necessary

Thanks
Riana
> 
>> +    return false;
>> +}
>> +
>> /**
>>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>  * @guc: The GuC object
>> @@ -281,6 +306,9 @@ void xe_guc_engine_activity_enable_stats(struct 
>> xe_guc *guc)
>> {
>>     int ret;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return;
>> +
>>     ret = enable_engine_activity_stats(guc);
>>     if (ret)
>>         xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>> stats%d\n", ret);
>> @@ -307,6 +335,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>     struct xe_gt *gt = guc_to_gt(guc);
>>     int ret;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     ret = allocate_engine_activity_group(guc);
>>     if (ret) {
>>         xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.h
>> index 6cd435b81bbe..e2c2f1bb2b59 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>> struct xe_guc;
>>
>> int xe_guc_engine_activity_init(struct xe_guc *guc);
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> -- 
>> 2.47.1
>>

