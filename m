Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F61DCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 18:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DF310E0E1;
	Fri, 19 Jun 2026 18:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsfVOzhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC1910E0E1
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781892297; x=1813428297;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6Vtn+RfRICS0W6BosxP1h3rRT7N/g/DYFp2dsUl2xDU=;
 b=MsfVOzhR17EKbv1BIh+Ses+PZ8UDU6WxDNbRdsa3I/6g50RqzFX0+ZB/
 tinhNGcK6sMJZeReZ4IipUtOKcPbAErjHVfnFSNWvrLEV+lWBjz0XpGaj
 +B3KYij6aZ6d7z3Nu1JI/t79jukX8GhFUPlMZkXUdTz9vfM9Ig3lxlAt/
 yrigOiixwPeJD2GGSt5c3OFQwECWbWkCabB84ntUxRUnggzeOsH7BOxLv
 rqPa73nK7Q/GOualk6M2uZeOqu1GzB9cjuOL8hzc5TY2G1yUzxcQHg7Tb
 qXbARPNaO7DLMqkDQ5QupUNxrU+Z6DqJG4RAZrqEq9Bw0nXFbnFtFoywb w==;
X-CSE-ConnectionGUID: W4oewAGvSXqMLAl/OTaEPA==
X-CSE-MsgGUID: iYFy42I7Tkyxao54b+Y6SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="93851195"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="93851195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:04:57 -0700
X-CSE-ConnectionGUID: Od8rD3I6TCCUUIIldrRfhA==
X-CSE-MsgGUID: ykCD18TNQnm4vyqysi7dCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="252582994"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:04:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:04:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 11:04:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybdx303ZtLaLBswNmfvhK0Iv2KCcvPDwcleCEM/6HDuVI2HAqWMZAkj/cWyxtDqwZNfTeXfKbSYXChuSRSkITqPJQZAFqIF+v+Bkw3Mt+V2LpgwXdCFD0hhyjRBbBAQcs2fL/cBl8+bJlWJDd7pvrHYglEkvQqHp2/aHqDUY2KKJ4GxmmtMoRJGeojazG8A24DE4DZ+qBjx6BmqT+MD25lSAIhVfQAGwU/Sh3gzcIc8/vyL2lK00qe/Ew8E7tEum4yXSDOwzLTtsgWUSFGRGeIkicNDFY6Zz1KrZfN854+eTF+EWnKpE+LRhzjiMRQ9QzPWqBVRdiF/XGx2sNEPh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpaJnEWIOtNElulwkCwbK8CU/d9b9G49lf+S+fDgM1E=;
 b=OFLAaNIVKa7jLKFwsmfOwAn77cyBu2fFJeIuRtx3rMjJ+TXGPM+ek1p+uOC3zQZ8Cgz4Q5BLZ8voCRrBiTIeqv9DD/sPEgrEvUOIMZdZrWr0WknUguU+bHGqXNoyDxkrZ++w2y890kR+YcGogEUstojJH0EYJUPONLe4RxXJSa5WxyICg+RY7FxNbOgOWLeDzMegPCwjDbYwUCVyF8IjsfrUVW0tphxZo35yTNXZbvaNMKPnGCBfvaWJGGxzwj/+a7ienJ+gC1BlED+jdyyQtMGBQU9/B29Jz/92vwd4HSiJqZJdxgZ5x2e1XluAWGtvF3igbNLaCb1wzUyDDPZwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 18:04:54 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 18:04:54 +0000
Message-ID: <78cc5c4c-c588-4d4a-9cd4-94adb8a320a7@intel.com>
Date: Fri, 19 Jun 2026 23:34:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/xe: Don't initialize tile_count in
 xe_info_init_early()
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-8-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-8-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0186.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::16) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cded13-4a02-4d82-23d3-08dece2d43d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: Ita6DbiaI/bk5+N648IPpWGmyfqaLGELykm5uug2FBCe4UdsYktkZPKVIJlBq4sjvX7OqnngLKTeSpwsOITrX2zbVOfwTHb5VgJrzWqgiiSFpdGgpt2qxVkZB08qTmWo35UMyLrwGm9ZRxJLh5y4/Ke6JSx6o9wEWB8yYndry9BowwBuT7jbIrPxQIrAf76CnN4uaH8M25aha/OrYkBoKJ/VcGXXwYAAfXKe9ios1y51sqHib0TEfvIJFz0eHvfXXXIyDpRquPmlRLri4/wcTs4SGukczuicDZmciUdiqP09Z9L+lfP+/8hczIBWYe2D8vhrBQmR6y82+/UuhtErWHgm5UqjPqyTU3lHvOH6h1NgjWcAVLTwdRwMoUKYiIoh9lswEdNPA4VK0hy+dunHUJYiXuauwMy+6lGZr7LTCGU5XdAoJ021PRXjHFJr87eNLMaxjdJqbMctQ76wn0GPureQ0PbdkRsULgv8xvJAuAmyB9I+mf1ZdQwlEd6jwf7YSVdLv9LaW7nbXSkOUduoVI8YqPvy2LtB0FcWUKzmy7t8bZpHaITlngu+hkLNsolWcA8C7UCdXcnn0myLQSLbdmwvg5f0xUX0p5eX8SKR+lzKhINW72Zg/3DDlZj6liDrA+xmHuiDAZFduRFR2Tp3vFhiRLaz09xgqlRSMlL4uwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2E1M2g4RnorejJ1MGZUS1N2MmNNWDVVUmUyUTF0czUrSk45ZzN0S04wN3l4?=
 =?utf-8?B?TTJoanhJQ2VPS2pnVWd5VEU0ZlFkbjdEcHZnVmNSQ3N3cGVtWDNMOVFrUDhV?=
 =?utf-8?B?bTFENFFOS2FXTHc2MVliSyt6eTV0M0FBMEV1R0N2VkVGaDFlcjk5WjRVcWpU?=
 =?utf-8?B?SmdKSVVScml3OEpucE8xbmxGUEVRWmo3cThnWjg1TGpNNkdTNVJTd0VJdUlL?=
 =?utf-8?B?UzZtaWhkTXp0c25qSjdkV2J2ai9vV2VRc0Y0MUxnQUJtWmlUdmdXVXRDd1Rm?=
 =?utf-8?B?L2NhWmJ4amVrdi9lZTkvdEJMSFdLVVpsZlJDcDMwUnlWWWd3dE1EaElSbm1Y?=
 =?utf-8?B?Z09jRmJWSTBzTFlJbXRpdXJWQmFUaWUvWFpBTlJCOVVLSXpHUWNHUkNQOXhh?=
 =?utf-8?B?MUlRaVJSVXJxQjh1S1RQUEVpUzk3VHJzemQwN0VBWVBzN0lYVnl1bXpYRnda?=
 =?utf-8?B?enp3MG5Wa3FWWnlUaUVUbUpUdnVHNWlkeTROTlZkYzVQRkF0V0N2dnAyNU80?=
 =?utf-8?B?ZlB0dE1tdENmb3NONlBzZXYwYm5pNE5BbWNqM1NrbjhvZTk4VHZMdXJuT2p3?=
 =?utf-8?B?KzNzdEF1dHZyQlBVVHlrZ28zamViaEQ2R0pOUmRyY2ZVaEJudVJDVkdZcG4y?=
 =?utf-8?B?bjdIdzNoS2NvRmM2ZEJpSkp2Z3cwT2ZKV1p5SWZaZTNkaVRXQXpvd0VYdzdp?=
 =?utf-8?B?TGRYWGU4NllFL2JPYmFjN0VTdm9HZmVCZkluWmN0RUVBOXNKeDlTUkdjNk5o?=
 =?utf-8?B?ZXJwSXBKMkpGWThHWDRPcGFZNHFoWXpsWU5GcmJhSmpQVURnVjdkaVR2WjlJ?=
 =?utf-8?B?M25qcDgxcVdsd2lxajl2Vzc0T1Y3cko0SnZnWlFVZFRrWGpkWmtoT1NkVHF0?=
 =?utf-8?B?Qy9hYmV6cTh2d01HYjFoc2pkam1sZGtrMnpySXBSa1pidjF1YkMwbUgraElp?=
 =?utf-8?B?dEEySW4yR1JKUGZYV2ZhMkZNbjZ1ZjVRWFV3OGhlc05rOUJOZEFDdmhlNHdX?=
 =?utf-8?B?cDZDM0xBeE1NZmpzT0QwNTdIQlliRzU4WFNlL3NoOHkvVW4vcjFDaEVRQ2Fa?=
 =?utf-8?B?S0pEMHlYL1BEM0RJbmxlMmpDeU1paVNKTUN5QjlxM29oQ2RUR0o3azFrM2cy?=
 =?utf-8?B?dUxyTCsyL2lOQmlRaGt1dGdkUkFxNSszeHRPM29QOWZUOHRBZmFiemdUbDVo?=
 =?utf-8?B?SldENHFZUDZ5RlZ6UzU4VktBaEd6a1BqeS9qcGM3Z1R5QVk0aXcyempYeEdW?=
 =?utf-8?B?WHpoenNrdlB5SXBTMHczUHErNms5ZklVR3h0a2VzTnZ2Q3owWEpvODJrTGFH?=
 =?utf-8?B?T3BsTnk3aTZhSm5tbS9DMTQwY2VTQktFbDV5U0VSSTBrN3VIMWVSSit1Wlph?=
 =?utf-8?B?SDM4VVMwNzMrVkxiVkFnU0xCRzV6TXJXc256YlQrODRlYmlWa2ptZTdlRVc3?=
 =?utf-8?B?eVBPQWtvem1mak5CYWpTekJPVHp3MUpCTWRwK2ZBOSszR1BSS1BZb2thNkp3?=
 =?utf-8?B?MmVTZ1BLMDA3cnhaL2tQUHhPd1ZKN2NrVmpLdHlMYlFMWHBkcVdRbTgwWnAy?=
 =?utf-8?B?ZkowVnI4M2ZvS0dxdWRNVTluQUZkTTl0T0hHUjFRTWNrL0lDdXJPUGVRWXBV?=
 =?utf-8?B?amhkd3d4aGlENjhpQS9qL1M4Z1pGZnpUeVFhRlJEVmQ4QjgvZGM0Q2hVTmU0?=
 =?utf-8?B?bFEwNGpoTVBrT3BDMy9aMlMvcXd4MktqVXJsUUFQaVlVejJPSXY3NlYzZVdh?=
 =?utf-8?B?eXlMWEpGVXhocDg5ekJvclkrWEs4RWNRS1pzMTFld2JTSWxNZm52OWQzN2pB?=
 =?utf-8?B?eWNweFZ3WExHdkkzWnVzK1VZakNKdGptZkVudExjR0ZCVHloeXltVm9TN21N?=
 =?utf-8?B?MDM4d3NGVFA1Ymw1TU9CbHh3cFRQQkxvbWVUeW9VSlZWaTdEaGMraUozQU1l?=
 =?utf-8?B?dnJWbTRCVjhSR05yRmhNL2E3VFJBSitrOTlneWFtdlFDbGdvRkV5WDhCN2dZ?=
 =?utf-8?B?cTYzaldtMEpSbnlEWUdORHlTZTgwQVh0MmVJL0xSYVZ2bWpzU0E2QjNyaFJI?=
 =?utf-8?B?S3JDcU10MEprY0c3cWFuSXFmRkZoUGZiU0lQQS84V2dybnp5cFdDNk9QaHN2?=
 =?utf-8?B?QVhVSVFXQjJDSEJMamNydVBBMitBMFRtdlFkVzJKTXZTejh4QlFaNzFzb0xC?=
 =?utf-8?B?Skx4bzU1aVg4TE13dzBoTlZ0L3RicXo5OFRpbWgxaStsWVA3L0t4OHpjRWFJ?=
 =?utf-8?B?MnVnMDQ1RWJURDE0ZDZCMWNPMVd6WWFtcGZWckRLSmQwaUFQbXZiaXdaeVRp?=
 =?utf-8?B?ZWNZV1UzU0Y3OU1mRDh1UHkzaHlNRlF6SmI0NVJsUXBNNGoreEpZVWxrTnBv?=
 =?utf-8?Q?JenFkOnrKpfx0GTo=3D?=
X-Exchange-RoutingPolicyChecked: is7q5i4PCljsfLHdQYmbtfukawbhLjExINrq2CGocKVuM2aaW98ZReCwFkuRPhSMRHnoeHCTDr1in3LAfYc9G1DcfBEBp5mRxfJ2PKjRkBvwovR9YK2pDV0My617eFlRdRTncmPistrGCn7g0kdLzzIK/ZVIPBw/uKtNZsobCTl5jlgALVC1WYpwNrVJPqAYxjQkm8TfJNh//w2l51CrrB361wcof7ryyt2YTQi2j+2EQvF3q1eesMsDaq678GmdPofVt/RzYPGpDYgO9jTmi2EQeW46Padsi9grl6XQqDvVYZ2B6MDQjFSSCjD/WGFGoJW7BBcGQu90KoEG5gXgvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cded13-4a02-4d82-23d3-08dece2d43d0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:04:54.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPMLkZyXvnBlSvYijlPlXzDVv999G2l6uqPT3eJjGqenTwC19UoZuHalvQhc9gEWhtXWK/xMrxwU/bUAbOOJKvJ4/eGbcPfCygv2PDDF7T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> The value of xe->info.tile_count is only really valid after
> xe_info_probe_tile_count().  Any use of tile_count before that point
> is invalid and, consequently, initializing it in xe_info_init_early()
> is pointless.
> 
> Move the initialization to xe_info_probe_tile_count().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c |  5 +++--
>   drivers/gpu/drm/xe/xe_pci.c       | 10 ++++++----
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index cd64b1d614c8..31ec41aa997d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,9 +311,10 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>   
> -static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> +static void fake_xe_info_probe_tile_count(struct xe_device *xe,
> +					  const struct xe_device_desc *desc)
>   {
> -	/* Nothing to do, just use the statically defined value. */
> +	xe->info.tile_count = 1 + desc->max_remote_tiles;
>   }
>   
>   static int fake_probe_info(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 388771ef6a52..6b2daad87316 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -811,7 +811,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe_assert(xe, desc->max_gt_per_tile > 0);
>   	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
>   	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
>   
>   	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>   	if (err)
> @@ -823,13 +822,16 @@ static int xe_info_init_early(struct xe_device *xe,
>   /*
>    * Possibly override number of tile based on configuration register.
>    */
> -static void xe_info_probe_tile_count(struct xe_device *xe)
> +static void xe_info_probe_tile_count(struct xe_device *xe,
> +				     const struct xe_device_desc *desc)
>   {
>   	struct xe_mmio *mmio;
>   	u8 tile_count;
>   	u32 mtcfg;
>   
> -	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe);
> +	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
> +
> +	xe->info.tile_count = 1 + desc->max_remote_tiles;
>   
>   	/*
>   	 * Probe for tile count only for platforms that support multiple
> @@ -1035,7 +1037,7 @@ static int xe_info_init(struct xe_device *xe,
>   		xe->info.has_soc_remapper_telem = 0;
>   	}
>   
> -	xe_info_probe_tile_count(xe);
> +	xe_info_probe_tile_count(xe, desc);
>   
>   	for_each_remote_tile(tile, xe, id) {
>   		int err;
> 

