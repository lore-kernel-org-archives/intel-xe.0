Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5891C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 11:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08E010E617;
	Wed, 14 May 2025 11:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ5Bj33G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19210E616
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747221095; x=1778757095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kt4m+4g1uk1ksdcovi6vgjU00GFdun0gl4nsgDdBbew=;
 b=SZ5Bj33G+S5iQqWlItjsqGGgrKHcBMvGi9QSrERDBzl9lDAtaMPyS/S2
 GP4MVFsWG5BKepgwjndHaewOHIBiXkQfd58qVH257cdYWb9yHCJ9mC/Gb
 PeFZiWqLoela7khgS9V3dTXCfWYmV9SLBRq8HpLwY016CbEPEvJsi0LjD
 05cMFnaj5blTR5kJ87KDEU+xIQOhVGnp3zUvK3HLHOP8tiI2EeNyQrFW8
 aENf12MgZIAxhTxCHBeFpNQQoHBcu1So+7alGee+Uakh/qwz+sNbk8Iqf
 pJu4kI4oOSv3bdaljVTXuZSE8jwNcF9tpxYtDLD/IDB/QrM9OgXeANVIR Q==;
X-CSE-ConnectionGUID: 4IjnwfWnTKOqX5KML+/Zjg==
X-CSE-MsgGUID: 4SoUGkUGSO2S4aXSVEIZHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49045038"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="49045038"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:11:35 -0700
X-CSE-ConnectionGUID: e+8NVxUATm+MrB9wM9d1XQ==
X-CSE-MsgGUID: Gps58nOrQJuBcPJQksn2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138504504"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:11:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 04:11:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 04:11:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 04:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfFBjQE8yOzS/mEql/oUrYaJsAjkPrOijqaER+lRiz7xLH+EfIWGTL7M2g35gH5x8RfF69YlUGFofeag9MgaL90ZnONpt5e+9alFitcpRJ5meaJsVY3YhE6lDZk2Z9CyrGL5FnQdJDxpsbVC6qJTbkyOOuEqHByFeUYxsTf19oNqS0sFW4Kfj99uUZmy09ZS56m8E3yaHS70xXwml1cfVfOP04vEw/t9lLlRPGxf57MlD3j1Bdr1CbA4SLQC7do78JYN7mU9N/bjTsIK8FfoxuZiZqR6h8Thi5eoRhlaxrDXVWAIrhC8fbfcCVedvrM8uNm72fqu5poE1RNRAYv2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tViyGwu7x8TIUrVXijd0QguecX56+ury7uOMOir1GRc=;
 b=NquAbziLbRBJ5VglIyPd7XNQSrXMiJeUstGuOO8MOyuVcFSxXcS6JV62cdMWaJYR34aiRp5vAz0nOxh3Vu7NJJx4GobSUWw55RcIPrvBPs5CGxdopWbzP0Pa39aNbG0nLPs7Xue1gQ23CmXx1pxdMb2iOanxzbE7YoYRZoT+9FVVQuGwzIZtApAgVqH+N+VxKZpmJpw5vtYRuoQlBgyIWBF8NTyuez1x9BUahrUpD8aXCNqVzc0xtkbzwbf27btUwYvqakbwo1FtVpED44FeCnPY0lec/GrwYwf//kamQZJvZyYTw3zo+8mR0lsEfzUS2CGv8Zpk4heskv0Xpp3Xkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.22; Wed, 14 May
 2025 11:11:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:11:05 +0000
Message-ID: <534e3fe5-96d7-45c8-965c-626d94301873@intel.com>
Date: Wed, 14 May 2025 16:40:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/xe_debugfs: Exposure of Mods residency counter
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250514080721.265515-1-soham.purkait@intel.com>
 <20250514080721.265515-5-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250514080721.265515-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: a74831d6-e24f-4c03-97f8-08dd92d804ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm9DRVJ5REhNT29UVjVBbUw1RGdySkhNZVp1cE0vRkltRWNmVFh1MWNoYkVF?=
 =?utf-8?B?QnJlblBiWE5rbWZ4M3J1elI3bUtVa1pNOVNyR3NyVVkxeDl4MlIxZ01LWFlW?=
 =?utf-8?B?Q3cyQ2ZSbGhDNmhncGhmZ1J0eFRRQXByZVIzL056ckx3K3dZTjV4czdxZ2dP?=
 =?utf-8?B?dVFiZDBNaU0wSEJNMFpaUEQzWTh4UlZqQ1RlWFJJR2lBSDk4aSs0NkdHWTZt?=
 =?utf-8?B?MTBsUlhNRVVrc0R5WHB5N3BRd1Bhb3VuUkpuWGxRUjk3UjFlZkQzVDB2eUZz?=
 =?utf-8?B?Vm9RcjQzamNFS2ErTkZlK2s0eFYwdURFbzhoOHBjeis0MkkrYTBHelIzaG1Q?=
 =?utf-8?B?cms2bmt1Tk9UUWVhdGxzOHFDRkgzSjhkbFV4azhGNGhzN2xyS3pvTE5uNnBq?=
 =?utf-8?B?bUVlTStEUDVRaFVaZ20rUkZqWTlZOVRhTDZPQ1N6eHNwWkduUklGMWlhSTFa?=
 =?utf-8?B?T3UwandUd0RRcHYwZ25mOXhEdkZrT0ZjY3M3bWJTeEpyTEZ5Vk53aC8yY2Vy?=
 =?utf-8?B?ZWdJZDdyY0VHU242cHgxVHYyRDRHT3BDU0I0Rm90Z1Y4YVdFc2tMb1Nma3lr?=
 =?utf-8?B?Y3B5bXNrMC8yMDdkcURRbXRhMkRSNWIrQVhBS1ZYeVFneVRvTC9hYUhNVGV5?=
 =?utf-8?B?TUtJMkNKUTdkeWh1eWNNU3lwWW1WRytwRmlvMlNqNFhnbkRQbnhpV2V2M3FB?=
 =?utf-8?B?ZHk1Njk1d3ZoMXY4M05HM1dsTWk4YUNqMEttUnVnSVljYmVNWWhFVTFzTEEx?=
 =?utf-8?B?K1Z2emhuVnFqRVVYMVhOakdTTGJydmJJbFFSU2ZOb2M3VGVGNS9KZzF6SkF3?=
 =?utf-8?B?YVhZTWZwaXRRdUtLN1pFanNvZFNNZ3NaR0FxWVdRY0lVUDdZYWhybUlkVnlq?=
 =?utf-8?B?dlRhbDNsSzl5YUFTTnViS1poUWdqcVA0N2ExbzI3Z0htUVViZVpJOEI1Y29t?=
 =?utf-8?B?TDZxRDVhbTBUU21BK084UjNpeFBrRUEza094M2dPd1RoemtYOFZDcFBxbnBl?=
 =?utf-8?B?cmZqMVpzbURZaU5mMlVTM2NCVjhZTmw2UElWbjF3MDNqZjBDU3FkWGFtTFFQ?=
 =?utf-8?B?V3dBOWFXbFJObHJBQjhzTjV1RVpLR2Z0dVBEQnRJYm94K2kycGR6eEVvcHVp?=
 =?utf-8?B?VUlhaTBRakh5U2V4Ymx6Wk0vWXhhWnE3bHZraHNVZzFUVG03K0tSNU1xVzMy?=
 =?utf-8?B?OXFERmlEZXdRZ05mSXBYYndXTFJGam1ySWhmWi81YjY0MDRPbHFpVjRIMmtQ?=
 =?utf-8?B?NnVhU1lXdVlMNTZ0M0dnaVA0Z1Z1N00zWnlucC91RzBZOVF2R2tHWnppUDN1?=
 =?utf-8?B?dFlrZFpyUXYxUTdGYnpsekhqcFcrdnh0Y3N6cjBXTmdTck5WbHFlOEhQdjd5?=
 =?utf-8?B?Qmtqd2tVZlpqQ29ZVDlXMVAyYS9nSFd5eUtZYUx0Ymp1bTAxMkR5ejV1UGRj?=
 =?utf-8?B?RUJ1Z0RTR1RmenNjOHJzQUVqSkczMFFzdi9WZCtIWU90eklKMS9Cc1BySjB6?=
 =?utf-8?B?QWNYeWlESytZNnFQeE1WeTYzQWFhY3ZyQjc3a0lOang0UlFrcjdZYjZoSm54?=
 =?utf-8?B?K2lWUWNBT29lUjBvUmwxeGgwSjI2U3kyNHpxOHplTzZZVEhHVEQwQUJiSWNj?=
 =?utf-8?B?U0xVbHgrQXFxbXhVSXhnN0FzN1VPUVVIaThSaktIRlU3VDhTM3dWZHJHWVpz?=
 =?utf-8?B?eEd2ajVkeERzNmw4ZTBuZE00bGIzRlJmb1loSzBXcWtaTFJyeDBnYk1XcWlz?=
 =?utf-8?B?Vng3cE5VcXlURkhtTVRndzlSQVRxYUxVR3lzU2ZTbUJSVS9PbmtXazJyVjR2?=
 =?utf-8?B?aG1hUDU3VGgvWGFHV0dmQmROZ04vampZQ3pSd1JtMXZBZG01U0dlRjBONElv?=
 =?utf-8?B?c3U1QVhiZXZaamtKNlYyWWtjUzFhWnhoM1hJVVFaVHBUT2VlaFJyd1lLNEM0?=
 =?utf-8?Q?29sKMC/06ig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRMN0xIbDhQM1cxSGY4RWhxU1IyeFg2SVhjMFFhM0I2V0F0amI2bWtqZEg4?=
 =?utf-8?B?QmEvUWd1NmdJNVM1by9GdGsxandsNXhyQSswL01id09yVVN1U1NHRHpuWnhX?=
 =?utf-8?B?VkFmMW1IL1dOVjJPZGpVWkpSNit2dEtPRnNvamlYdEZTcHk3anhBS3EzWHMv?=
 =?utf-8?B?ZzFKU3hBRDVMRGF1T0lKNndnb0NBODk2Uy85N2g4S2J0dFFHc3FkNUdMOVpU?=
 =?utf-8?B?d1ltMkc5OXNCV3R3eTBlM2FMUndsLzNiclRBREJLYTRqL0NlTzRPTjZvVjEw?=
 =?utf-8?B?V0YvT2FaZUdjd2ViY0Q2QmtEUXZWNk4wcUZNZVBKSitLK3I3SHFzMUF0WlhU?=
 =?utf-8?B?ZzAweXVOeUVqR25FTTVqUmNRY3M1OEx1cThwd1R6TXo3VFVWclpBYTBUcWZ1?=
 =?utf-8?B?Tjd3QzNBT1BZaC8rZzBZN2VCYzlnTWhSL2dRdkszSGI3bFZNSWlmNk9NakJH?=
 =?utf-8?B?dkJIZGtGTEVXMHdBWkc5ZkFXS2xReTYyVk9yaFI1Qk9RdjRYdGs2Wk50eGVy?=
 =?utf-8?B?QWhKeWVtNTRWUE1adUFzSEdhRnFPNzJkbG4zbDgwdVliSmZBQTlaeVljOHRI?=
 =?utf-8?B?Tjl5VXJCVHRFS1lMNWRYcGdydXdiUEF4UWFROGhDaGtHeTVkRmU1NUZuRjhv?=
 =?utf-8?B?V3IyZ2FwMDVReG1nVklLNWJadEZQc0xzZE1XWml5cUczUlIvdklXWXk2SWdj?=
 =?utf-8?B?aVp6ZUZ6ZDh3SmVmUFArZ2lYVG41cG41ZWlqV0lQZkhQWmxrTVlmOWF2ZXNI?=
 =?utf-8?B?R2dFckpnZ3FjZm9pNmk4UnUvSXppb0NLcHVvaGJlOXExeDFwa05lclpBdWtG?=
 =?utf-8?B?WGlTWHRtbVd1SlpMQlphZmJ3NmVRaVZYY1ZSaTdXUDJOY3Z5eEZtLzFaeDJp?=
 =?utf-8?B?RHZNaUxxeXNpWHU2WktEZEdHYnR4MXk0RTNwS2pRS2ZaWGFpZW5HSk9uYVFE?=
 =?utf-8?B?TmFmQnNaS1NCbTJ1WXZBTHp3aDZSbXN3bWErY0M0Qyt2ZzBranRpMGVaY20x?=
 =?utf-8?B?a24xTmZSTHhYblFmNVFDMEpxWDdaUzBBdHQzNGdKNHlCMEtNYU5DZytPZCtk?=
 =?utf-8?B?VGJ0bFVVNHNBM1lUUi9oV0NjeVAzQkRQSEd6K2dZUDl0cFNPbUI4OXZwajlC?=
 =?utf-8?B?K2NJVFM0YWRCL0FRaGVyS0Y5OFoyS1ZXMEx3cDZPcVZ5Y0xqVXptMWpLbmcv?=
 =?utf-8?B?azZDWlMzZytCYXRqeHpmRkY4TXlIZGtjSGdRSlFSNXRjMmhnM1pwc2tnaTJ1?=
 =?utf-8?B?OGtGc0gvRml0SXc2TE1QQWFkMUhRcFlCeXVUSGtLSitZSEZaTzhxUGQwem1r?=
 =?utf-8?B?d0dBY3ZSdWFGcURCMk9vakFsL3ZrNEFpb0IrYVM2cjRoZk9WRE9qcGtRVkdQ?=
 =?utf-8?B?eGRJeEQyV3Q4a3ZrRlhpek1QcmU1L3V2RmFjMzJlUVFXb3NIdFpLWGRQMXFz?=
 =?utf-8?B?RVQvWFBUcW1idTR5VitUKzF3cGNpd0R1R0Z1NVByaHI4RDdEaU91UjV5dUt2?=
 =?utf-8?B?dkxkSkZwdDFkMjlzekFUd0F1YXZCZmdQRWswZjhNczJ2RVFtZk4vbXNDMnFQ?=
 =?utf-8?B?TGZKekpNVXZtb0dzaG5vaDhCVWZCb2I0T0ZVc3lGMEtGNWVHTU1WNG5XSHZh?=
 =?utf-8?B?Y2txaWlwc1JxMnYyUWRrM1k3T21WOFNJWWJHQ3NuTUEvZ0p0RUJYL2VhNTYy?=
 =?utf-8?B?dVUweXAxUDhoTlp3dzJVWE9NaGx0eTRKMGhpTlkrNUFGbklscE9tOXFLeUJ1?=
 =?utf-8?B?bkVuNE5mWXkvOWhuYkhIZUlEcU5ialljRFlyRzNuMWlHWjdrTUxtd1dlNzhO?=
 =?utf-8?B?REMrL1hTd29rUWpHSFRmWlRrRWZRZWJmekZNUDVGSVNWeWpKNnNZejBSekNl?=
 =?utf-8?B?SGV1QWVucURXcDV0U1BBWVRTalVPais2N1Vzb085QnFyUWtTbzZZaVpIWEpy?=
 =?utf-8?B?R016enh3TGlkb1RyUEc3a2FZRXNxMXBueVhibmpmUHdEWXlqSS84OTRMeFN3?=
 =?utf-8?B?ZWsrQjRKUk5kNlJoS05ZMDlrYitQSkc3bkw1bHFndTNpbGNNdHlROWJlVEVq?=
 =?utf-8?B?MlYyQk9ETXlYUythcFVhc1F1UldBdjAweS9ET2s1LzVaMEl3djZmbitRSm9E?=
 =?utf-8?Q?KDhoQgfL3sC04hSv/kBAl+Bot?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a74831d6-e24f-4c03-97f8-08dd92d804ce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:11:04.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlfwLdbyq42I4V4AybPHoNvQrC3O71lFZG7GGJvm6D6qS89RJzYEH7RfEbmY7iUFTmGWiBrNwebjVV5/qR6v1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
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

Hi Soham

On 5/14/2025 1:37 PM, Soham Purkait wrote:
> Add a debugfs node named mods_residency in order to obtain the ModS
> residency counter value.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h |  1 +
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 66eab5528b92..240cb73800ae 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -238,6 +238,32 @@ static ssize_t g10_residency_show(struct file *f, char __user *ubuf,
>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>   }
>   
> +static ssize_t mods_residency_show(struct file *f, char __user *ubuf,
> +				   size_t size, loff_t *pos)
> +{
> +	u64 reg_val;
> +	char buf[32];
> +	int len = 0;
> +	int ret = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;
> +	mmio = xe_root_tile_mmio(xe);
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&reg_val,
> +				BMG_MODS_RESIDENCY_OFFSET,
> +				sizeof(reg_val));
> +

You can have a helper function since all three entries have similar code
with offset as parameter. the patches can also be squashed

Thanks
Riana

> +	drm_warn(&xe->drm, "ModS Residency read from mbx 0x%016llx, ret %d\n",
> +		 reg_val, ret);
> +
> +	len = scnprintf(buf, sizeof(buf), "%llu\n", reg_val);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
>   static const struct file_operations wedged_mode_fops = {
>   	.owner = THIS_MODULE,
>   	.read = wedged_mode_show,
> @@ -254,6 +280,11 @@ static const struct file_operations g10_residency_fops = {
>   	.read = g10_residency_show,
>   };
>   
> +static const struct file_operations mods_residency_fops = {
> +	.owner = THIS_MODULE,
> +	.read = mods_residency_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -279,6 +310,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	debugfs_create_file("g10_residency", 0444, root, xe,
>   			    &g10_residency_fops);
> +
> +	debugfs_create_file("mods_residency", 0444, root, xe,
> +			    &mods_residency_fops);
>       
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 27fbb8d46471..55ef13662fec 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -10,6 +10,7 @@ struct xe_device;
>   
>   #define BMG_G8_RESIDENCY_OFFSET			(0x540)
>   #define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   
>   #ifdef CONFIG_DEBUG_FS
>   void xe_debugfs_register(struct xe_device *xe);

