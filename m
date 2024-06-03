Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B28AC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 09:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4FA89A94;
	Mon,  3 Jun 2024 09:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyDrJI1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9C210E0EE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717405655; x=1748941655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MzfuOLvC2kSwrBibHhzdR2ST+KtiTrfiv6aG38+Ieic=;
 b=gyDrJI1CEs9u/P4ObDljP8XEw0CrG6hACsQwO7R3lHCfRvT1il9k1jQJ
 8yLhGAvgEMmGXBpJBdk25mdES51JTb3K3w/tZ8leAXvcn2I33vyL2KwmP
 osCwawqtgtu/Se/yeuxRHQqayFTOVPejedG9UpnITaJkxw4vmqDBX5r0G
 i5x9oK5NgWXNT6p2frDJuS46t36BiygoJj3pPu0dPwfZVDOtFtjSIKA4+
 tGiilU7moODjYHR6YwXwlDda9wYiwmQ6PYtMEiox/NO+9eZMsaRawj1Gm
 d6bJQlqylpE0isBRKQw5H/zJjDTPxCuHMCSi81zOuHRBRdMDGJ5KRP/th A==;
X-CSE-ConnectionGUID: wPpjTV9SSqOPZ1g/2RTVEQ==
X-CSE-MsgGUID: rdDAzA5MR0Os+4v/ZYBNbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="16828803"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="16828803"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:07:35 -0700
X-CSE-ConnectionGUID: ko/ZCR7JTI67P5zuITeCpQ==
X-CSE-MsgGUID: i34q+cgaRHGrQs6ON0b67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36901570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 02:07:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 02:07:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 02:07:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 02:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWc1F2ta97yvdYZdLEu/ISIv6odLklymc7YYYHpOKC9Z4DEAW2DiHMNIfHTX6nviq5/9RtZf9lK35Iozw14pTQHrU7ETiC+0kMqKNyAZTnI7DM+HNOXA9Cp92V+uLWaWVZ+yeMq3uWwJ1G2jkd49dU+6mauwJLtvSJ5i74AwjXwWxjd94biCGw309Iky0fF/1vD2CZs+C15sXa7Pd1Gl4t/WGPTLKU+Xva6gjF/aFglpy7Rdmj5E0xMf9hTY1ClgJYxkrzNfiLbtjhI2Q3L+rpb3lqYoRj5J7XI8wLIwr22UJWwnf56BXQKOKQFDoNWNmHvdBaB9JZyD6bVAyLj7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pMfN1ljtRU39v3OmS7qHO5dzg1/Nc3rHMX7et3Ibfo=;
 b=e55RcgK5mbVhSpi2wIDfb1f9U1AjqnHupAEG1H3cjKj+SB3KquL/iX0U59watoZhxKGu0D1DzahY4vWHPdw3LGm4aLgKwsJBRrwNhLUIAtN9i3I3Hn2BYGwFULf1SoheGxTe57jPqF/g2Q2yIxiwO13KbI48AsVkTMOuTVFcTpNs3ERWYdVK+g+uIjIaHQeIwjQRl+yEIyeivanO95ZQ5joLlzKO9lyb0ly20vxxZFuMklyqrcLCBkHZp3wVVp353DHsSgZ3fn2K9N59XWOT6qvaMxk4Qk2tlj8qVSfECFMISv5ATIT7mhbYkQcSV9QpEoDrStFCnHUnbrvLxlF6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Mon, 3 Jun
 2024 09:07:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 09:07:32 +0000
Message-ID: <bc097deb-d1d1-4f81-a90e-403414ca3e11@intel.com>
Date: Mon, 3 Jun 2024 14:37:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240603083108.32346-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240603083108.32346-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: c17c79ae-5249-47ef-027e-08dc83ac99e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1dhRUlUemFnM2dQMmQwSDJYU1RWS3RxakxsY2hqNit3TlhkcldVRFltU2I4?=
 =?utf-8?B?QU9ZdnNDRVQ4UUEvaG4zaktkRGwvOXpFdDRNUkZBYXRiNGFzZ2kyQmlmZGtp?=
 =?utf-8?B?ci9VWlg5eXYxUGxqb0dTNEZydXlKVU14bWpYMU0ySHdPT3gyNVdGYXJndE5x?=
 =?utf-8?B?SHJqbWZ6NUZIcmY3d2lqNnlUQnB0bG1PNEVpNHBnTzRRYmRoUUZsYlo3MTlR?=
 =?utf-8?B?b3hDbG9SM1FNMlo5dktxQ0F4R3h2dmxhdW4zcnE0dTNPZ0xZcG1GV0ErMlAx?=
 =?utf-8?B?VWw1bTRQYjdQdTA3Q01KWUpwMnZLS0g4S2gxb0FRRDIzaGdOVnBDOXZCME5a?=
 =?utf-8?B?UEJSZDFYbnNUYkFOK0dvUzg1eDhGSm93dnl5d1V1SXMvUlVsRFdLbzNBNS94?=
 =?utf-8?B?VU1PUWxVa05NODRDRm1sdzlkZlVLdUZVZ1pVSVhHeWFTZ01GQ3MvUjlIbHJE?=
 =?utf-8?B?SjdLUUFxRUg3QlZ2eTZPbytlWlBKNnJyazd3d25XOE5LUi9mdzJQZm5sMmFS?=
 =?utf-8?B?TUFMSVR6UTMvbGdCd3JFb1liQ2Y5Q3dtd3ZiTnNPaUJWVXE2Ymowbm1SYmtU?=
 =?utf-8?B?L3V1NGtEMjZRRmw1QjdSNzBnV3BNdGEyRzVIc0Znb2J4UUF6SGtPbkxvUUox?=
 =?utf-8?B?czJBaUVGSVVxWDdqamdRV1hiVFVqL3VCald6WmszRHN5UEN1OGtzbGpFV3RR?=
 =?utf-8?B?UkRJaTB1VERtaXU1UEkvbnFhM1ZUNU1lNXpNYkZodDh5M01NWFV3c3RZcHJn?=
 =?utf-8?B?Q0xKQXUyNXpKSWdzdmtZRlJSOHpYQmovNHlGaDFGK0VkTnBpUytmRHBQcU9x?=
 =?utf-8?B?S2xhQlhwS0hLa3JobWh6K0xZNzFKeTJkeUhwUVlOWnVwOXFpZGh0MmJCZ085?=
 =?utf-8?B?YjdhaStORmUyVklwdUdkWnYvV3FxTG5jN292SWVLdjRLZFJIdlI0bWVMUk9Q?=
 =?utf-8?B?bzBCZEVaUTFQN0krSlQxM1NtNmY2Nm9xWDRwOWpHMGhOdUpDbG5tTm8vUlNy?=
 =?utf-8?B?aHhXZGVtUzhSNjVVVzBkKzcxQ1BISnBYalJvZExGV2VHb0Q5RkROcU5XWSty?=
 =?utf-8?B?TWpIL3hqSnhESTIrY3pIYkkvakRyTFUxdmUyZ0RhTmQvWFl6Qy93NStSbk52?=
 =?utf-8?B?SmdzVEVZcmVPcHN5RzBnYjY2R3NPMnR0ek5ZaVU5akRiOHBFWmMwdlFsaWs3?=
 =?utf-8?B?eEwzSjhPY2t6b05vMkVUd1BpWVlqNlpEckNBaDVsM2FHaGJIaHNWTXlaL2V1?=
 =?utf-8?B?UjR6cHZ4aVc1Y0dtYkFOM1AyVUF3Y2JjUUFIWk1XZVBYbWNVYXg3alNaUGJ6?=
 =?utf-8?B?SWlkMjdnSzhEM25hY0VBMUQydXJKdlhrdm9EY3V2andLTEdIdFpKSVd2YTls?=
 =?utf-8?B?Ry9mZHNNMmNKZThRb29tQUtzQ0dNUXZpQmFBdkhyVnlDRVRMaTVPcjljWEIv?=
 =?utf-8?B?ZithcFBPaWp2WHZ3TG45ZWlBY1JSYTd6NDA3VyszZWlwQllJYitmUGdiOHNk?=
 =?utf-8?B?eUFmT0VkM3R4U0t2bVNxN0lkeHU5aEFaNlRoRmR1QTFGWEFsUjh3Nm5GZEt3?=
 =?utf-8?B?SzZUTHBCRVRpdVY2cDZoVW5kYWVpVlc2REhOUlFkV0pWV05HcmJ4OEQwczdJ?=
 =?utf-8?B?cnF2bmREQmtoUVFIL2tDZHk0YUFYVFVhellrUXZTbFZPb1o4TzlsKzc1cVow?=
 =?utf-8?B?WFJLQ2J4c0EvcGQ2NW5mMVM0Qldyd0RmMG45Q3RjVnQxTnM2NXRrMjdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDV4RzBnd1ZBMG5ROFFqejlWY0diOTVvdzlxaHlIbU5WaWFaRDJ4NFRhZ0Z6?=
 =?utf-8?B?Q2JrRWUvTllSWXdPR1NBbDNUaXIxT0NxN3pkRXhHSDBQMFlKSm52eU5vTEY5?=
 =?utf-8?B?aU40VmZFVjhUdGdNUUxUUXlXSUdHQ3V6NWZhNWFyUWNsZkM3eHBKVm9lVXZr?=
 =?utf-8?B?SExvWS9XUXFsRHluQ0ZOT01uN2xjRzhqVkE2dlVUSDBZKy9JQjRydk5WQmFO?=
 =?utf-8?B?K1QyZHg2R1hpREtoV0ZtRGtvOW4wV1g4SXBxUDZGQlFhOExzS0ZUcmhXRUpQ?=
 =?utf-8?B?WWRNdjM5aEdRc0VVT09KbjhOZWVETHlVOVhsdytFWGdOOEJLTTMybUs2Z0FB?=
 =?utf-8?B?RFNmU1VDYlg1MHJBYTZIUUdLWmR3N1dCVEpmcFFVZ3NTV1V2b2hpRmJuQU90?=
 =?utf-8?B?MFdxU2dabk4zeG11andIbG94UWY4R3pObElzdGpodnRFbGhHRUlldW96bm85?=
 =?utf-8?B?ZmZINmdKdGZiYVFIZEMwRzc3WnJmNHZSeHFTcHpkRTJDdHBaL0NHU2J6Q0xH?=
 =?utf-8?B?WmhPc0dJRmJOeTBUMEEzeC9DVUozZEo3SnQ3QTl6UlFHVjI0RjVsL0hLZDlq?=
 =?utf-8?B?Z1hlUVBURmNobGZua2dDT0VDL2RsKy96SmdVMUVqMEtYUy82VWN2Um9Wd0NT?=
 =?utf-8?B?UU9QTHZBY0ZvUm5WQStLNk9ZNDEya1V3eXJJYys1dEdyb3JSWUxHUjRzYis1?=
 =?utf-8?B?ZzJseFNsRkE5YWxUVUlnZU9KcVFZczlUQ1lXeHhnMjJQcUY0cHZ0ZE9wUTRr?=
 =?utf-8?B?NlRXL25CMWhiWGFmaTFNcVQ2aUFIMzBtSmlHOVE5ck9OallsZC90S1drU0VG?=
 =?utf-8?B?WmZEeENaMXh2ekpYS0VHcjR3TVpvSlhXOFZpemJLaVVQMnpKZ3BNUVRPTXE2?=
 =?utf-8?B?UVpxRW53bnJ2Tk9NZUt0dDBEeHVPV1VrZTYvNlpTdk1yTHl1RUsySVlRY1Vv?=
 =?utf-8?B?dFMvSVppZ29pd2hxcTVldHBUbUpuVWcxMXNQWXFoVitvejZFMThVU3ZTb3lF?=
 =?utf-8?B?Mnc2N1J5aHJySWpuL2MwVVp5Ym9vYWZpYkpvWWxxaDA5Q2JrczhzTTN2b1Y0?=
 =?utf-8?B?bTMvMHorVDlzOWEwWDNlTmZuUmQyQnJPYXdTZEpmcGFaZlY3UXdXb3lESE94?=
 =?utf-8?B?clY2VFN3YTBZV01QOG9ycU5IZWlra2NLdlRxM2s4VncwNDFHME5YRk1GSElB?=
 =?utf-8?B?eHpZaUZtTFNwWkh1UzFkbCthL2o1T1E5cFcxRTVsallwa1NzNThwbDdkMGNq?=
 =?utf-8?B?UFg1aFBVVVN5RHNaNlhuL0w2Rk41M3hzWjg3UnA3V3R4OEF3WHZzQVpQdFFp?=
 =?utf-8?B?VlVtWUpieFhXUlBtWmxSUWlVelBSMWdublpvSHZKc2Q1QXE3T3kzd1JYK2RX?=
 =?utf-8?B?UURpbUo0RUR5NkRQV1owRGhsclhmVkxTRFVoOWdYODN1ZGVhWDR2eDREZlkr?=
 =?utf-8?B?eEZCaVBPWDg5TWVOallUdzQ2TGxHNEhzc3NveUMyazAzcnJhTkNtUUtaeXRq?=
 =?utf-8?B?YmZZejJCVEc2NEljRXFLWlFrMHNDMjZyYzdqR0pCaXFhTkh3TDZXTFlGVFZL?=
 =?utf-8?B?YjVEbHVNc1ZhNUx3MngyNHMwNGRiWks5T3ZwbUNaelNCaGZwZzIxT1dPT3pj?=
 =?utf-8?B?byt1S1pCQnkwdFBvNGc0clZmZkNpYm1yeVU1ak5BampmODlNRVR2dlp1RC9t?=
 =?utf-8?B?aXRLUnYyK3dwcGQwSFJqRk9ZUFBIOStyQ0tXRHc3eG1DRmgrNzJkaStJL0lM?=
 =?utf-8?B?K1kwbkEwRXNDL2dobmZPTTlETHpRbGV3dmhhcTdOZFV2aWtrc0tKRVl6MDVr?=
 =?utf-8?B?aXpYckQraUhIdzJ1RDk3VXRpRkhEa2dXclROaHBpaWUzbVRpK3U0bEx5cXly?=
 =?utf-8?B?RWZIZ3NWc0M2SWJMQ0tTK2xHSEgwdUx3b2VYNXBVTVppSEwvMUdOTzg1SlNF?=
 =?utf-8?B?dXlPYnRwM2lzUXRiT0xuMVJYSXBScC9Gc3l3RS9TQzhzMS9GdkphaDlIdUFZ?=
 =?utf-8?B?aldkbGVRdnlTWjJKMUttMElWSUtHN2ZnVGJNMXI1NWNSNmphaUVYN0xETng5?=
 =?utf-8?B?Vjl3RzVDTTRhbFF6aE1OeGpHZjB6Qi9Ld2pmeW5qK1lRMEpnQkpVVG85TzVM?=
 =?utf-8?B?VXcvZWh5SWloS25wUGVwdnNyS2JqL1R6eWNtT1kxR3Bwd0F2TEFYWUN4Snkx?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c17c79ae-5249-47ef-027e-08dc83ac99e4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 09:07:32.2002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtP6TfW65YDNtWOoBlnTljnfpwo/lkyHR2WMW0OB2DQ5jgr43NFPsWwM41UDlGbiRB+6XXw/oGNNKA12+rUJ7Pq6oR6BeZXI0jrrHrV58vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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


On 03-06-2024 14:01, Nirmoy Das wrote:
> xe_force_wake_get() can return error so check it's return value
> before reading gpu_timestamp value.
>
> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>      Add a warn on for xe_force_wake_put(Himal)
>
> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..4bdb909eabfc 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		if (!hwe)
>   			continue;
>   
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {

Since xe_force_wake_get will increase the ref count irrespective of 
acknowledgment from forcewake ack register fails or succeeds.

It is required to decrement the ref count taken by xe_force_wake_get by 
calling xe_force_wake_put before break.

something like :

if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))

hwe = NULL;

else

gpu_timestamp = xe_hw_engine_read_timestamp(hwe);

XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));


> +			hwe = NULL;
> +			break;
> +		}
> +
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   		break;
>   	}
>   
