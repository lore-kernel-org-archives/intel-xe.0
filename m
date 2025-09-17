Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E475CAC599
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 13:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35A610E39A;
	Wed, 17 Sep 2025 13:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6F1iw01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52C810E848
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758116790; x=1789652790;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hexJgpr1J3h+VhBFctUi5uUSA3xK2EN1ctZyK6jZ3QI=;
 b=V6F1iw01GeWqim+P3IHG24yT3vK5vkS9g5rwKftDBoH4QpRsaryWc3KL
 sMUTOIF8DShLvLPNpi4w5LixKHRqdXLXaGU6nz1Brfwcu528tPW1BydkT
 E4iymXnzjexWdP2E2Q9v+Ayyan95gvQWkzeDWjyHYOJhSlvnY7g5yWE5Z
 n/I4awpNnVhAVVfge8lW4FW5V9XohimXjUR+vERY1bwGJ2Ve1QWvlde5T
 NdDv5yzHZObsO6gCFCXL52Yia69KJ4bk42a3NzDGuYv3RLoAxBENTQSHY
 Vkm1MUhwX2LZzKXccxiFPtzFp4jfJkuK84J5pg6sVQPJ4okm+YqrIJtWC A==;
X-CSE-ConnectionGUID: V+xyfj4RTZieCBqoZcAi/A==
X-CSE-MsgGUID: ETels+hgTcGfKzYmfDQ0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60372954"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60372954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:46:30 -0700
X-CSE-ConnectionGUID: WQqiiaLyQk6uksdbyzMo0A==
X-CSE-MsgGUID: SaHh1p+eQpKYL9Kq9O+WAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175661859"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:46:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 06:46:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 06:46:29 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 06:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1fYWOnATjrZPzNJPjZ8qi85oK/i+tGIKK7It7PSZIj5xd+bHOhBDw5tYyYuzJzPVg7i0QftR54CDd710sbSYkfYmfoEOP4TadxhXlc6jjzL7xr0IXPItDsOArjOKmE8dzbjF6UNwcSD+2inq6r2/ccpmvkul9L8k2gnEOjUDz2L1b31rC3tpTIGiwYaZz3xrQCMwBY/Id2nKdVnXTQQ+n/q3bIHRH/zE1iRex1cByUn/Iq7RtRmo2Nty95kfAFgYAj7e88A8Udt6QSak6b7Mt6WH1/RyC/I8q0z6H9nbbnjUAzEXQyOTXfHMTHlVco4K5VilX84IsQA7AmB1qR7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZowgKfD16rL1vg+tvhB768nI8M3azW5jBkEhv4K6580=;
 b=G/55I5yC8HnnVSFhHE47XfMenRzuiKrpwfo8lh+vWFz+3Go9TPXZmJBNQqGFQd58uvU2bvT9L76uEVex4EDfh0z3gOq2bIe/2ZpadDsb8txK3uTAYb3MEGnqFR0+AbH+VXoVfDfa1Aew6GXTpL1KV2gM3/XDud+eofrM1OMUF9+dN9cupm36YvNkF/gEIZ88IWKyCwOart9a0tSwDctGIuh0sxPkV1pIZA3lQZVIlt4yfxQjwQuTOr/v2mH7SeLw15H8IJBnm8c5mwF0Yi9ro8Zh75rlanITqRlXWryVrzXQdg1I2Xr13dTJ/VHeViqtLDuCALFPs1q/9PPJPW2tSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 13:43:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 13:43:43 +0000
Message-ID: <e76d785a-f8b7-4b7a-9415-e1d00477239b@intel.com>
Date: Wed, 17 Sep 2025 15:43:40 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/test?=
 =?UTF-8?Q?s=3A_Add_pre-GMDID_IP_descriptors_to_param_generators?=
To: <intel-xe@lists.freedesktop.org>
References: <20250916171645.3335-1-michal.wajdeczko@intel.com>
 <175805171258.339404.17980558682713435724@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175805171258.339404.17980558682713435724@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:803:14::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: b35a011d-92d2-44c6-c074-08ddf5f03802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE9iU3hEWjNHVmVXN2g1WjRObWJhaVo5OEpVTDNZZm1zdWlUeFJYYW90Uldh?=
 =?utf-8?B?VzB1eVQzaFY1L3o5cURkOEdQVERSYjdTK2xJSzErc25hTjFhWk84bUFUQ2Qz?=
 =?utf-8?B?M3BWc1lqOEtTMVJvTFRIaUxYeHgzaWRnSGQyYWlJdlZyQ2p6Z3BqVVg2MDh6?=
 =?utf-8?B?R1BqbTU4dnlVVnhLMHRmbjBpWDRTRElGeW9lQXNFUXVqK0N0ZVd6cTFMcEtZ?=
 =?utf-8?B?N3hJQjhpV3lwZmM5SjQweWxlb25EeDVLUFpNSktIUzV1UEpqRThjdUtxUm1I?=
 =?utf-8?B?TlZ3eWovS2FDa005eWtXenhYWlVucU9YWmx2K3dXRUtSRnRRMTBxa2dzcFRJ?=
 =?utf-8?B?OC9yd2taWEFIdlFaWmFMWEo5cS9KQUwwN1FwOFJqK3pHdmphaGwrd0hHeVl4?=
 =?utf-8?B?NUZGM0hodDVPQURmaUlVZ1NCSXNmeGN2ZU55b3dySFhpN1JiVXpsYm9YdzFD?=
 =?utf-8?B?SjJORk1xTU02a2FsZVNjWXdEMk1jb1RMRDlWQjlKTG1nMVROeVNjZUtsdWov?=
 =?utf-8?B?bjNsUzlScFN5NWpSQWFtMDc0VzU2OWo4cTQvcWRxcTJkMEh1Q0cwV2Z4U3Ni?=
 =?utf-8?B?ekZWT0JSb0xMUzBHemg2SFNjdW9ZdDNXYVVncnZWaGJFRG90MytRc1ZGMkdl?=
 =?utf-8?B?TXJoeHZFbUdPS0lUN2I2cXJKSjl5VmFSWjAvazhRYXg2dnhQTjNuT0hKZkZS?=
 =?utf-8?B?bEcyYmpWZHZjZEpSemFBQkx6aVdKTHhBQTNRem9MMDhvaU9QTVNmMHp2aGlP?=
 =?utf-8?B?b2crVjg1RGZrR0oza3c1anNnYXZWZmJCUUZKeTY2NVNFTVN0dFNPSnBpbDFF?=
 =?utf-8?B?bkh5WTIwRzJtckRhTUNtQ3FYZWdNbHltVC9ndUtNNytZR3RDU2V4SDkyTjlB?=
 =?utf-8?B?RjRaZSttTkJ1V2RIQVNhTUE2R0c5dllIYS9FUUxlMFFZL0ErOFZOZnJqeEZv?=
 =?utf-8?B?WGdvNWlLejVRaWs4eWYva28wbUREWDA2VU8xcEJVMlRsanB4ZGpZeElzZFN1?=
 =?utf-8?B?NmI0MUxjUk0zZTFyWXBZMEE1U0ZjRUd3VTEyTjkyaUtpK21mWUU2MzVXNENZ?=
 =?utf-8?B?M2IzNnpXcUs1clU2aTkwTkhlV0JyVE10UWFSODViRWhrYURDMG95NExGL0hw?=
 =?utf-8?B?SFVHdGV2ZkpST2FJQ3Z1WHBCWkdzVHpFaVJ4bHlVak5NejlVMzd2blE1ZWJY?=
 =?utf-8?B?dDdla0VuRVRDV1pzVjA3NnpyK3lHSGlLMzNzQnlWWW5scTBRVG9IL1o5UU1n?=
 =?utf-8?B?ell5QUVHRE1sUVZ3Y3l1aUsySEtJK1Q0NzA4alFWR2R4bGNBdE9zWDJqZld1?=
 =?utf-8?B?bGlQeC9sVllkVWlTbDVJeGVZWSs2dVJJRDNuR1JBTEdvNW1rWC9GdWR6RDZN?=
 =?utf-8?B?QWZYWGp3UU5VaHdzbDJlWUlRU1VoVVI2d0RYRnNjcjFMbWJhN2ZTSlJ4U0Jy?=
 =?utf-8?B?WUpqTTdYWDFqY3RWK3VmZmNsc1I4eXhzb2lQMjZTSGJXSHJvV2pJemxwSCtT?=
 =?utf-8?B?bGtDZElGK002M3hGMnMreWZiTGt5VW8vVnZLUHFPM1RHRVFwNnJCSC9ibzl2?=
 =?utf-8?B?U2pOaytmQjlaMkt2elpQRDJ0ZE91N3pPSUhDYlBwS1BGT0VuM1FQREtvOXZs?=
 =?utf-8?B?MlFicXVxVVJKVExSVk0zUkFNSzNGRVFjV0cycGJydVV6RERlbHdrcEQ0Y3JP?=
 =?utf-8?B?YVRWd2JxU0I0Skt2TGZENnY2dGVLWXI3N3paWitodzluRStUQnZTS0hzbFFB?=
 =?utf-8?B?ZXhHS0g1UUl1cTdmeWtWVWJUengwR2VjdVZKUUFNTndjN01KZHVZZHpld3Ux?=
 =?utf-8?B?bXdGdHRMOUlJU3RreG5SWFBOQ3BSejlpOVdOdGxFWlc3Y1BpMHoyU2grVzhO?=
 =?utf-8?Q?aEvUkbOaxgXP6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJ6S3hBRW5aaXdFNVZWTXR1MDJSbHBUazNPUklUbi9uNTJXdm54WnIySDhB?=
 =?utf-8?B?a3NCbTBSSWxSQVBkeXpCUlpwN2lGSVp4Ym91QlRqRUpab1RjSXRBeWkyTDhT?=
 =?utf-8?B?bG1MUDFCSkVGYTZxRHd2UXYvQTN6eHBMVXBtaGVlVWtzUHE4ei9JcmtVVjFS?=
 =?utf-8?B?ZHZzMFpDMGRoNzh6WE4xU1ZIRy9YdnYzdVVwcS9wZHZLa08rV1RNcjI5cFNQ?=
 =?utf-8?B?cm5qV1IwVHh6T1A1djc2WXA2SHV5Q3czQnBvM2lzL20vL0xjekhGYnhMbDNX?=
 =?utf-8?B?MVF0eXRkbGNLZWVYbURIV0JUSW9Jbmw5VUFYMDJLQnhGU05XRFROUDFFbmVj?=
 =?utf-8?B?MS9LbHJGNmZQZS83VVBPZWZ5VUhMRGJCQTlOczBpMGRJRStLcGhMM1EzZnB1?=
 =?utf-8?B?MzdHRlFCT0Z2OEFISXBsVkI2UWpLOGZFeUI5YUJKa0p0R2tyZXdYell6ODVP?=
 =?utf-8?B?TWRZeHZLVDkxRG9neGV2Z0FyWjMyZXRHY25aUVh3Rnc0bjBEZU5pdkVWeFdE?=
 =?utf-8?B?MjdBQnRBSDhUMGtHcFVySmM4cnM5cTQ0TkRMdG9kT3dSTlpLU280NW9OUkFk?=
 =?utf-8?B?UDhKY2RjNlI0UnBIb2JxblY1eUhrVXZxWVlvTmxVR0hKMGZUTlcrSFV5cEFK?=
 =?utf-8?B?UDFsNm9qY2F5UHYyamFDbldHTkZ3QkdvcmYwaUxlWlZ6bWM5OS9xUWhkbklH?=
 =?utf-8?B?ZDBIMm9qeDJmOFFuY2RTN2xSMVNnMVhOSlNPVlFFaEZrU29IZFJmK0FmNzdl?=
 =?utf-8?B?cWZZUzdjdWRHR1lUd2t2ZkdNZWs4ZjREQXA4UWtxeksyT0VTNGF1MUZUclVN?=
 =?utf-8?B?QVlwYXhockY4NUtTUk5GOFJCNDI0K3FVZnJjOHdUcXlQM292dy9JUmFlaUE4?=
 =?utf-8?B?bXJYSzJkdEJxTHBxM1hmVWpIVEF1QnlNY1MvaGx4UlZtY0lmSW8yYXpoWUdS?=
 =?utf-8?B?YTFSdFplakNQeG81SmZTbWdPVDhGZ1h2T0pMUXlZRjVMVHE2Yk1tdTQzOElP?=
 =?utf-8?B?VnBvQ2IrKy9zcnVudHBKRlVFMHNJVlk4TFVTaXUwZmVGejJiQm1lUUVBUHA3?=
 =?utf-8?B?c1huTGhMWXhJWllsY2hmQjZtYmVjb2RCYTQyRmpyQ3VMUER5MWt4dXYwYTBp?=
 =?utf-8?B?VGFkK3B5bDlsTHFJY2dLY1N4N3Joam5Jc29ISXgwbmRGdUtIMUtDbjBQUVZR?=
 =?utf-8?B?TENrcmxyMmViU2h3UW85bG91VGRZWEZiR2dwNFJwbGxSczJ3NjQyWjlIY1R4?=
 =?utf-8?B?YVFyWEE3bHRIcDlUbEh6d3FyQ1Q5YTl2Z0VudStvT2ZnL1d1bEpTcTdNbVFz?=
 =?utf-8?B?d254MHp2dnVWZUd1c2VkbEcwK1RxbXQrQ2UvclBDUDgrN2pOV0VVdmxDVE4v?=
 =?utf-8?B?UTdlUDhLWkN1amVnVXFBcXRmRkNSSlJIOXFkRlZYSjFlN1FWTFBueTZsSWxq?=
 =?utf-8?B?SlFnNFNtRVBjZHBrN0RIaUtQVUtuQ0lzbGdQazluQmh3bHg5SzAvM2Qzc3Zu?=
 =?utf-8?B?SWhYTDc2M3h3T3dvYitRSE9SVEFpRWNWYnEvVi9xcjZWcFpWYytkbnBwQ0ZO?=
 =?utf-8?B?Q1VUMFlBUHJSK2lRT256bmZNT3J3ejY1UU1UOWhDb3VTeExGUkhmNlZMcFF4?=
 =?utf-8?B?dkpTQ2dYaDNNYktEM0JBUWxwU1VXNkEyMGNhVnFXdm1Obm44L2xvYy9OUVRm?=
 =?utf-8?B?MU80VGxYZVNEaEFOTWY4dDVIQnppNDlZR2dRcktmUHIxZG5CamMxeEpQL3k3?=
 =?utf-8?B?MHdiaG8wUS9tc2lFZUp3TGw4ZWRFZHRZd0x5T25nSWdadmU1UkRFU29waTIx?=
 =?utf-8?B?MUpSREZIZmlSaGZSVStCVHpYNWxOVjU5U2J5cy83VzVRNDFobkk0Rzlhd1ha?=
 =?utf-8?B?ZEkwTXJlZ1FNU1VYL2EzOTJqTlNuSGJGVXRMR09kQSt2WmNSY29BdDJ4QWtl?=
 =?utf-8?B?aWRNUFJid0V1ZVprNkdiV29lSlJ1TENmTFlIVzFpMXUybmIzVXRsdEs3Y09U?=
 =?utf-8?B?NmtOem56SDNmcTlxZkdXQXJxdXRYNzJOVkU5MEFZMFF4WjlVdEZsVjlITW1V?=
 =?utf-8?B?WnZ1RVZEWi9zWlYvd2hiMHFtZVF3bGFoN0tBRDBFV21jSFhjT1pnYWFiV1Mr?=
 =?utf-8?B?WXE3YWdPcit1aU5vTW54dnJHaTgwY1Q2OTZvd0wyQ2NHSTYrUGQ3UHpDa2Qx?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b35a011d-92d2-44c6-c074-08ddf5f03802
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:43:43.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyVsAiWfYhI7zdjADKTV5Nx67J9EVmQ4VQamBH4D1Yh4nyTUdCQ02ujd9FVHmE6Nl8LzCsFwzeenvxMbk6+J4jWjmr21TVnAR5DGoKy4zgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
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



On 9/16/2025 9:41 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/tests: Add pre-GMDID IP descriptors to param generators
> *URL:*	https://patchwork.freedesktop.org/series/154609/ <https://patchwork.freedesktop.org/series/154609/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154609v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154609v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3773-3ac9e8d2d7d36978999286401624d908e7d9ed32_FULL -> xe-pw-154609v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154609v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154609v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154609v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

all are unrelated, since change is about kunit param generator, not used outside of kunit tests

> 
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154609v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3773-3ac9e8d2d7d36978999286401624d908e7d9ed32/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154609v1/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html> +1 other test fail
>   *
> 
>     igt@kms_sequence@get-busy:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3773-3ac9e8d2d7d36978999286401624d908e7d9ed32/shard-adlp-3/igt@kms_sequence@get-busy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154609v1/shard-adlp-3/igt@kms_sequence@get-busy.html> +5 other tests fail
> 
> 
