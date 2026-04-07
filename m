Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5278DFEEF25
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 11:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B39010E3F8;
	Tue,  7 Apr 2026 11:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHEDvlq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B94A10E3F8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775563155; x=1807099155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NE3mY6owleVaclynmiQh1RFVFdP1W8J/a9bRXxz2dt4=;
 b=NHEDvlq3iWfIyFT3YzqsLL9N5zhlDIX6p3bpX6j47YEFbfcOHw/XslyJ
 hUBfw6rfrHoNbdPQ6djTxsY57ihUsIO4o27Y2HbQnQb+Gq5XC8eCriN79
 Z4lLhCUd3RNszt5d+IiU1xSld319BJsgj3vnMzb7OPoUB1pTpnJSOlIRd
 nRPw+Y1M3ZYcMJUWghWiN0pDVx950Qt7r7LfAOasqN7hLwgawNrIWZmlB
 RSBrmhWMHlucfZcmDYAZD3ectihgQTqwP5XemcA3bqB51RKrK2r0L/9KQ
 hbh1sPUDFEY51WrWtgf1b67A/NdjuG+6vywLDFT5uyKoI85MvDZTF30gh w==;
X-CSE-ConnectionGUID: afbVOleVSrGdIhB+Xzws+A==
X-CSE-MsgGUID: tB7P6Fk3QRW4qSFLyrHnaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76713169"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76713169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:59:15 -0700
X-CSE-ConnectionGUID: GDUKly5NS862mm3o3rnsuA==
X-CSE-MsgGUID: 0jOgvXkRRxaTwWdl58D8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228085977"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:59:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 04:59:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 04:59:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 04:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3nm8BoYduzXOxPwm6/LCFG+e9cJZJo11ULYkzw5Uwa32aEWj9gcn9jDdjTu58znKIwxK6/MuJj/JXl9caJrXCKU8AOuf4sdOm+NrtibyrleeZvT+1+RX60n89fHNOHkwZxf1D7D/T4BXHouzas1IylNzySEdr39qqa7sc7VYps+ba4TqjhnfqxGAT4csUV3Da/FIhAoY08NvNoVRQeMJ/8FgpYuGgMkSx8z5pxKZi6Aj3E4ACVLJOdk85P1Pd5sOWDmRCeNVDdsnHDxZZv5YFcINI0+7j9B/sLJmKUPt0pMYsPSypNxcrYVfDBp1ynpXv6mM4Fjiwx6pJuG6QwD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhNzmBssyrxf2mTpwAnZTN/tEJGWCzo0+c2OXyzTOCY=;
 b=NnCDdAS1aDe0wDSydKp3hdYtWnceXd8BS75wMI03hYDFuBtdTiCT4n0ystNIX5Mc7Qi1BSzE48x/IN0HKY/RKsFm81hst9kapGOMyt6TfXlyYH0zLrxuubP6WAHK6DXWezdUwa4CamtZCL3eZ9Sjfd0pbuNG+BH0am6k9oW/b2VoMqSK5PPj9wC3YJudECajkRjWZRs5Sn6lrPoa04BxnjDSJ6VP8BxCOwHnJ9CLDCWRiEhnTD33napW/PfjmoK5QFinqWLKp8iQkkDIEazBEa1N5R+2sngrfiugSXAuN/uS+e9/P+SUkajIf1Gf5tDlmdUbXRNUKGULnPKXDQQ5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH3PPF97652A3E1.namprd11.prod.outlook.com (2603:10b6:518:1::d3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 11:59:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 11:59:11 +0000
Message-ID: <48e51a63-09ca-4a17-83f9-2dec70809fec@intel.com>
Date: Tue, 7 Apr 2026 17:29:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Read accepted power limit for CRI
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260323115836.3737300-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260323115836.3737300-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH3PPF97652A3E1:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd34c87-3551-4920-223e-08de949d1492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: POpqpu1R7xSkEeve/Z4yha2CsI9R/OTCYDhTuGk6lCOKVayAEqdrzTVIDzJRHkBxPW2FLbyGHj1P2sdC0165vxuA0MMaKVjoqlgyyzLpda8qvGTka1SxFRlbIxtmAKtsH3+czo0wXrqgekWZjnNaTurX5lifPmpHAkMN1vh2qf8R7xnCFFTTaeD4uk8fbjra52IFhmBimioQv3pAxaCvT4yuhk9RrSQmw6cEOZKkrEwdNZpDYfW0rMJXDU5JxKU/d4V/4gJ1Y54YR/5sqUURSEyoGJKhywQOSDDLxwfSL+vRLBlCYhgRaKGx/OxXVoux6WnJUPIAMVvPWXS+M5xs46md9c8Tqt7Tcd0azKDGl41W9b16TdBB0LiqOrNVdvp15oApKxskq0zFj3OwKrQ7pn81zD7A5LCDx6SJe3YuuOKymPbi/vTTo9ZEy5MllaLYepHE5bGshjIeXkR97G3VqdytN97PsO+HH7iFmg44qLKDItrbxf0hYmuL+EVbHMPoSxhOyRkuzrFrO60kwXNujq0npOiynpDj2GA0NP7Y1Gre8b8TAf827TxR1d0ASfxZzmL9rSJDLe3UTLo5ZawfbFluTttoYcHxmmxmgxJ63o1p/El/voCoWaPxSnXA2i7CiHuVHcBXNsQw1gjWuSGjD+xiWq07y1K4PFc1mN0w/6BDp9glve/pgBau71kbFSxUqADVK8Hsgw0/rks0Z5g19grLiwSak9EuFquBSKdurVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJ4VXpBNVkyaUh2aUN0NEJiSEpITzlMUyt1VmpTNXFNWlkvbHV3eU5zdk1L?=
 =?utf-8?B?UGU5eW96bG9hL3hwaWJNSWh3bVdYdUtpQ3RJcG16Y0l5ckp3NDFZbnVhdlZD?=
 =?utf-8?B?QVY0LzRYWDMyZEMvODhzeEdHSVBIZDBLU1UxUEhKbUh2WkNIQ1d1V3B0U3RP?=
 =?utf-8?B?ZFpDaHRma04wRVBrYi94Tkw5dk54bk15Y01zMmN1UGpaMU1SZERqY0J1NTdG?=
 =?utf-8?B?RUpCWFJXWnFlY3hIYTZmL240M2QzSS9OdkdFZ1lIQU5QVXc4UnRXaHBaWXFV?=
 =?utf-8?B?d3ZEUEI1MUJtMnovYm1yblJhTHExekE4cTBSeUNRd3ozOGs2bS8ydG4vajJL?=
 =?utf-8?B?bVhGdmF6Z00xV1puWFhLV1krVjFZVXN4cjBvMkI5OVBzT2ptYXlXRTQwUHF4?=
 =?utf-8?B?L3RkMjROMGpibG1vVGJUdnFLOXRRYktxeGNJeElGMXNBZnFtODl5aVZvZjFU?=
 =?utf-8?B?RHVVSkl1aEwrWjdkOERWSDZpWVpGcm44L1RMWFRlRmsrdjdnSFFIVUhKTlBR?=
 =?utf-8?B?WGkrU0hiM1B4TFZJNWlDK0pDY1NCZSs4aGxtaWJSaVpFWWJyMytPY2tMTjR2?=
 =?utf-8?B?MGQzZlpnaUdUTTNUYTJxOFgyU1pxWUdKZk1XcE04OUpiTmVDbUE2K0lIR3Nv?=
 =?utf-8?B?S3o4cHAxY2FPZmpyWFhRbWMwbE5PSTdxSnBmSXk3RmhPSGZhM0FkRy9DYjZh?=
 =?utf-8?B?dlA5NW1UTUtOWjIxNVNmbUNIbHlGQ1RIY05pMUc1aUc0Uk8vT2hBSTJCWlZB?=
 =?utf-8?B?UHdLeHVnay9mWTBjOWE0cDNnaEZIR1o3TXU1blMrU3Fka0IwcU5NYmt3NDha?=
 =?utf-8?B?b0ViMkNMZ2xvWkl0RzczRy8yMGMzK2ZkK0Z3aThBTmR0Q0VydVJ4bzlJSzNy?=
 =?utf-8?B?QUsvUEtOQ1ZSS0ZOU1lzektITTBXMUg4UlAzdGk4dC9oT0F6Y0ZUTGFONVY3?=
 =?utf-8?B?ZTF6RDhJZnoyamRFNXk1Q1lpcGt2U1JDQW1Hb2RaYU9IUGdQZGs5OVd2MlZZ?=
 =?utf-8?B?QWVOQ0VBRkZmYVFFNG0vdE80R1BzNHpCTjVIS2JSL3JaZ1FUQm5lYlVTa1hK?=
 =?utf-8?B?UDVYOHhhM0M1NWpHWnBKdjZvd0hjNXNDT1lEcS9WOVl1QXk5LytFL3ZCdy9G?=
 =?utf-8?B?cHJMc2hrTkNoSThRVTlyVzVBUjg2emg4K3NMZHl0cFZ0c3hnWUV1ZzNJMGxN?=
 =?utf-8?B?RysyZHNXR0hQV1Mrakh3MmtKY1crUTJPRHQxWUcwZm1OYlp0NEFxT09HdHZN?=
 =?utf-8?B?QVpQMzRXdzJSYjh0bUtEeTVKa0VHK2crMEVzeFZXb1JHcGlJTlFwWGxBN0wv?=
 =?utf-8?B?TDdxcGxZMGpiaVpFVTFWcGx1dzJwalltY21ET29pMWU0WWNiTk9RYm9vVzdD?=
 =?utf-8?B?NU43dW51YlVCQXNKWE9xd1VQd3YrbmRteDBqeHYzZU5VVUJFUWF4NElHSE1w?=
 =?utf-8?B?RUVLcEIwN0lCOUkrR3JLdGtySTlRR1dhMldyS3B4ZHF4Vm1xbytDZTBLT2RD?=
 =?utf-8?B?YytnSzU4UkJUSSs4c0NtZk5NUjE2bVE5elB6RkV1MEgzcFZiVW9Rek0wczZS?=
 =?utf-8?B?cWRoY0MwVUhLcy84ekI2UnQzb3JMS3ZuWjBJUkJ3WllzclJuUm43TjE5TDdE?=
 =?utf-8?B?ajlhSytQbGQ2VlljWjhMcmRxaXRtMzdYTE5JYWtjUzFxMWZHejdKVzg5eTY1?=
 =?utf-8?B?ZUlsS3NkRjJZSStIQjZ5eTV4K1cveGNaSDZIcEpmZVY0ZGV4K0RRQ2Z5RFkz?=
 =?utf-8?B?aEV3Mld6Z2RPemQ2aXJWZlB6cjZ4VkduSk40YW9RUzhRdWhoYlloWXJ5VVlv?=
 =?utf-8?B?dW9yYTFIQm9QT1I0RHprc2crZGxiajRqYjBjQVJyM3YycEhyWC9rTDdnc0hV?=
 =?utf-8?B?T3lBelhxdmh4L1NSdFdsMHlCVUhwSzE2YjFUYjVWTmQwL29JSENXVkhvcGZt?=
 =?utf-8?B?YjlEUTVCTWpXTFJEMkgrTE11WE1TM000c0F4RzNZeEl6Y2RQNG9vaXpzQzVT?=
 =?utf-8?B?U1YwbURxbjJ3M0ZUaUxxdUZFNUgxWlRCclROMHFvZVFyc3BHR1RoaDZtTXNs?=
 =?utf-8?B?Y1c5dExjVHJhMTA4ZFlvVE1rSWZuV1Zha0tMYUJQdkFlaVI3LzlibTZtcFFM?=
 =?utf-8?B?MjYrZXdZbXVxTTVnT3JLTHFnQ0JpbVBsU3lTZUEwT1hXa2EyZ1dyTVdWNEtG?=
 =?utf-8?B?d2c4K2dGYTlIUyt0NllmNWdJMThvT2FqNkMvUnhrOFNqdWRwVWpDbHZDU3B2?=
 =?utf-8?B?eU1iRll3NnJ3MzJyY2RUQ3lmd01RNE45aDlWejAraEtscjR2U3JCYzNDMjli?=
 =?utf-8?B?U3VGUU5TWDFNUzhucENwYXFuN3lBVElVMEdVYm12TlRKSTFaUjRyUT09?=
X-Exchange-RoutingPolicyChecked: q4ZRoUZNm+XiJsjrhRNdZzqShpT/uq0LpAFuTzZevTywHUX/FnbJSPBqMNJJfEhYwLQYRzipykBpnq4ruGMXDtIrGZZlr0d9SKo9YPA7ET4Wkb3RND0oHUkIt1SWLBzKz0bSfp/FmzuYJdbmBi3VLYDMQX5aiq1ZSFDEyxkZOGdFjkZhw8gJ8iZU9fHUMfMDK++90t+abS2hpz8RS4eeXxVGu9gaIEVDqRva22J/LADILMKhxcwWMo+ouSl6j4kKG5wjnD8QsY9b44erSwqCJQevckja3oecsrm9JzdBXe/FSczBYtmfl5lJEvyA3ERVZiHrgzcCrexY+pWVbKPHNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd34c87-3551-4920-223e-08de949d1492
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 11:59:11.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkEBxqvTechIeq1y9+WXUu80bJF4UVVYe1uo2HLy2nhkx0VnYa64mBnfaxU732WUX4HGcNZ7CiA9UBJmXRfP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF97652A3E1
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


On 23-03-2026 17:28, Karthik Poosa wrote:
> Update xe_hwmon_pcode_read_power_limit() and
> xe_hwmon_pcode_rmw_power_limit() to read the accepted power limit for
> discrete platforms post CRI.
>
> For platforms before CRI only the last written pcode value was available.
>  From CRI onwards, pcode exposes a new param2 value 2 that allows reading
> the accepted power limit by the hardware.
>
> v2:
>   - Read resolved power limit in xe_hwmon_pcode_rmw_power_limit()
>     as well. (Badal)
>   - Rephrase commit message. (Badal)
>   - Add prepare_power_limit_param2() to prepare param2 for mailbox power
>     limit read.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 21 ++++++++++++++-------
>   drivers/gpu/drm/xe/xe_pcode_api.h |  3 ++-
>   2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0fd4d4f1014a..0f92aa3fe8e8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -180,6 +180,18 @@ struct xe_hwmon {
>   	struct xe_hwmon_thermal_info temp;
>   };
>   
> +static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
> +{
> +	if (hwmon->boot_power_limit_read) {
> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> +			return READ_PL_ACCEPTED;
> +		else
> +			return READ_PL_FROM_PCODE;
> +	} else {
> +		return READ_PL_FROM_FW;
> +	}
> +}
> +
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>   					   u32 *uval)
>   {
> @@ -191,9 +203,7 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   						  (channel == CHANNEL_CARD) ?
>   						  READ_PSYSGPU_POWER_LIMIT :
>   						  READ_PACKAGE_POWER_LIMIT,
> -						  hwmon->boot_power_limit_read ?
> -						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
> -						  &val0, &val1);
> +						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>   
>   	if (ret) {
>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -226,10 +236,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>   						  (channel == CHANNEL_CARD) ?
>   						  READ_PSYSGPU_POWER_LIMIT :
>   						  READ_PACKAGE_POWER_LIMIT,
> -						  hwmon->boot_power_limit_read ?
> -						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
> -						  &val0, &val1);
> -
> +						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>   	if (ret)
>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>   			channel, val0, val1, ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 85cc7478b787..d762226a9987 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -47,8 +47,9 @@
>   #define	WRITE_PSYSGPU_POWER_LIMIT		0x7
>   #define	READ_PACKAGE_POWER_LIMIT		0x8
>   #define	WRITE_PACKAGE_POWER_LIMIT		0x9
> -#define	READ_PL_FROM_FW				0x1
>   #define	READ_PL_FROM_PCODE			0x0
> +#define	READ_PL_FROM_FW				0x1
> +#define	READ_PL_ACCEPTED			0x2
>   
>   #define   PCODE_THERMAL_INFO			0x25
>   #define     READ_THERMAL_LIMITS			0x0

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

