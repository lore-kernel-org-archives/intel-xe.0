Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C02DD2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 08:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8C10E57D;
	Tue, 20 Jan 2026 08:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maHdfYNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB17210E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768898797; x=1800434797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ImuP5K9lUgO85o0ChGLTXfhv3BTbs+BXKpNrIRrhzOM=;
 b=maHdfYNBJDiN79fW/gSVTajQe0HJNJxbQ0SnAcRqiNEZPLwFetbqTRyP
 1wg2DeREF7MPP+1xsdcL3PxAp5m1PirpEdEPWxuaB7uRl46lNXDXEU2CC
 EfZ2Yk8I/0Ru+1rzD/tVtLGqpBnZ49NmHt+Lq00c4yAF6Ogvr8cf9Uq25
 ZL/lbaWzBS2wkSDcCJbgWk6Sy7bnLVFj95i6i0/IAdsg1UdekJAF0BeIb
 RCTwiIAh+XLjkVAI8AYYM/YNKXemvJk7SoiAXF9TCg5WDf26rt1CD1sWM
 kuvefcAL4A0bsxQZy/ymKg9ICXZoIQbRBBOmUkfVJMmhbVU0XryZ2L+pu g==;
X-CSE-ConnectionGUID: 6/EbsW2gTuKAbfsOLGA+xQ==
X-CSE-MsgGUID: QyeNE2zxSxyW7W5LOK5+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73731315"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73731315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:46:37 -0800
X-CSE-ConnectionGUID: UWdvzyMGRtmvqzdCtjKw1g==
X-CSE-MsgGUID: X3jg6UhZSeOm4n1zwRqN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="243661432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 00:46:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:46:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 00:46:36 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 00:46:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXdvEuhCPoFgdaMUxhz6eye/eNwb9zNtleTNN7a/jhHoj0qgaBIlZp7yp9GzMnM/23zFDnW+Z8aiP/spMI4a6ID7MrYdSp2iKIT/Bk1qtF02RqRsiGdhhOnf2AFHC9nqasvt6br43hH8/GEf4KPOBYaUIuP8IgKOgffeU/YDvRVDPsOGyq60JHeS51hT6rvth43E/htPY06dFK6Dd+nUqq/p7BSNgQspwDj48gUReRhGpVUnMkSifu5PZDXPyugaRlrBzDhHa5W9hMsFvldv8mr2ghtqYDSqHkE3NH11lrNVv6drHraZihciMgXnmnQl/uNmHSV5CyJFl1wfF4yMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1Hsl+GGBbdWAUNE+5ft+n//s8pIu9ezFG9lDE6VSQs=;
 b=VqRIazmzVjy7mYpC62yvIVLikekP/Bbr9HtCwvj1SFHQ1jNzkwbJN8Bos2npf2aeBsIuYMGc2YCCbMijZR60f+33bbEoQG7zioPM7hEH4VzT8lB9DgyK/+hRMi3wzEf7rx4cSVbD/tVHNP/YfT22rzj1ZNY2po2FK2Am21fEkmta3jYRkKJga7pEspqMSdGVeiS4+xFWwrAoRwZ8EgV+zVrly7WrQmwt3LAyIzDyjFhyHLL8Q6pQEZo3GPynqpobbzygVbTb27pOAmL69Gx3l0kbjAu0hmk6CyyXAUwYL+qZ3M2QIF9X6XRZUX6A5Cw9v8OszrxBm99untr0CtuBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:46:34 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:46:33 +0000
Message-ID: <c7b76289-f2af-4ff2-b1c0-c74aeaee4f98@intel.com>
Date: Tue, 20 Jan 2026 14:16:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,3/4] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <soham.purkait@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260116093432.914040-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260116093432.914040-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 527b3910-139c-4ab5-b045-08de58006968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlN4c2p2bmk2RzdrUW5GWWZmSytpb29lZm8vc1FaZE0ycUViK1NiWmtUcUpU?=
 =?utf-8?B?TTU3RUFCaVZKdDF2Vk5mU0JGMDFOYkU3RUhiNWwrMmNCWHRva2RTc3o1ZG8y?=
 =?utf-8?B?MXVMcWJSbS9yOEVzb2U0UTJNTnBOeEFGRFNiRFByVklPN00ySVRzNjN5TTlS?=
 =?utf-8?B?WkJEZnFDcDBQUDdPMGJFNE4zVmVsMXpFSVFuOUtUZlZ6YWw5M3RHaVhURGxm?=
 =?utf-8?B?OTdYVURLeU5sTVNBNVFlWnArWEkzbjl6ejVxZmYvRkFqV242c2NIMU8xZjM1?=
 =?utf-8?B?azhWeUo0UEpDTW1LdVBFbUkzbVFqRTdnaEV5elExa2VIVFdpeEdqUlJzbHVu?=
 =?utf-8?B?WTlRZ29rb09nMlh6QjdiTUtFamRuRzNxdGcyRUNobU9FZ0krdnJDeWZJeUt3?=
 =?utf-8?B?OVBJRHBXTDRlU3hBZXVJSUNRUzdXTTlvK0hPOHJJVVI2bmh1WHdtazFEREtF?=
 =?utf-8?B?SE5JTXZuRVFWRkwvOStCb3BRcW9qQS9JcVZNUXZBeExJNUZQUWNya25oNjB5?=
 =?utf-8?B?d2E5Y1RiN0twRGUwQ2dKc2x6MnpHSzNCbU5GNXZQelZTQU9mNXJyenUzQjdP?=
 =?utf-8?B?VXZpVWxlRURwMVZCcFJia3BweE81cWNZaHFSV1lDR0JrT3FSVXJjY280S1Ez?=
 =?utf-8?B?TWRKMTBodk90U2VNMmlKNmU3b1Y2NmNEbDBuSVVqVXBvNkVVQjhXSmtuVUpC?=
 =?utf-8?B?OVNIeEZ0NnorcnZPUElsb0tuUzdaTGRxb0RoYkdJSEtNUDdOQnNaamxjOUlz?=
 =?utf-8?B?U3FreWFQaXdUSVdjdkFMdXl4ekVXWWh5bUxXSmVQY00rVU5aakNhU2tlRVdr?=
 =?utf-8?B?azNlbFplSmRITnFyV0N5Q0VoMkhFeXMzbmZybzJOdmR1ZzQ5Tlg1bFA4dWcy?=
 =?utf-8?B?VFhkd0NXZmRFTzVmWm5ZMUpWY3hoN0h5T3hGMmdGT2JxRkZsUy82dHIrTUtV?=
 =?utf-8?B?T2RpbklLSzYyem1hMWNHMHVab0Q2UXIzODVLWkkwMmFEWmMzbmg4RXJMQ0Rl?=
 =?utf-8?B?R2Y5ZUd1cEJZamNIR0NIVFYrNmpMemZtOEZreWhWU0RZRWZ1WmU5SlhtQmRQ?=
 =?utf-8?B?TVF0UUlRMEg1c3VKY0s3S0hTNlJMRUovNk1Rd1hDRXRPZVBPeG80OFU2TnNU?=
 =?utf-8?B?TjYyNC95QkZiM0RrSVYxQ3V2Qm9HZU5UOVM1L0M2TzQrUC9EY0lBdFBLSHQz?=
 =?utf-8?B?cDk1ZjRDeFhQbkRDSzZLL1NyVjRzY2puMitTdE85NngxSUZnb2x2K09zUGNp?=
 =?utf-8?B?RDZoVFJUMUhYeGJ4LzhwWTV5RzdEY2lPZ3AvNzc2bkcxaFB5SHI2S0hIb1VM?=
 =?utf-8?B?VnV4UFlqTll5YjFNd1dsNE1zMERja1VoM25OS1BEY2U0SEs2cXdvZlNZTHB0?=
 =?utf-8?B?aVFjaUNLandubzFxWUVaZ0NYd0crTlZXRVhBYms3RExyVGV4NmRFQVFrYXJs?=
 =?utf-8?B?dk83b0g5bmtqS0N2WXJRaTh4ekZZeXgrcUUwQm1vOEluYWt0UTZqVnVFWmZ0?=
 =?utf-8?B?RWhNRDJxL3NZbXJNcU1OUnVxMzQyOTliU2FmMnVOdWxTYU84WGhNMjBJMmEr?=
 =?utf-8?B?WENmaEJYSjFNUzR0R3R5K0NWNjVtQnZRbEJWczRFVVgrWVFnYjNlK3lGbXNL?=
 =?utf-8?B?TGhlNVFEZ3BuLzE0QlBnQ3hHQW1lQ0NGbEJGOXBWckRvNHJpRVlvb0swWU50?=
 =?utf-8?B?b3h4SVl6aEVxZWdNRElSVUE2bmptbi9vMC9STEswNUNFZ0VscmpOeGllWVZZ?=
 =?utf-8?B?VExUdStGd2NPUnJVeTdiUldWZjRmWEJSRDZtWFljbCtTQmpVVkFzenAvYThT?=
 =?utf-8?B?N2R4MXdZUXpRaXFHckFIand4NGJQYlUybEcxdHhiL3JuVlpLbWJJRjZlQk1v?=
 =?utf-8?B?Qzk0aTVueXorZVB5djJBbWx5dlVvbk1PMXpHWGpTMmM5cFVPWFU1cVZkSUM5?=
 =?utf-8?B?NFFZeVFpL3BtSWNTTVphUlRwQ3Z4VkdpdmpaTklLOU1SWjlBRFF3WEhJMXlw?=
 =?utf-8?B?bEgrUXFjMzBEc0pDOXM2UUNCN01NUk0vMUhybmE4bTNMNno2NEVTblMvNThL?=
 =?utf-8?B?NzBNMVpQaWs5QkpseU4zSGFGbTRkcWN3WlBtM1JVcUo0SDhkYms2LzkySTJC?=
 =?utf-8?Q?/h2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdJTndESjIvS0pHS2RpcXZXVzZSMURnc2lJN1NJWTJGVzZSRnA3blRwVmdr?=
 =?utf-8?B?VEEyWWpsSUIvdXpVZE0yMHVtc1BxS2g4ZVlOQyt1SUNLZGhPMS9xVUN0TlBz?=
 =?utf-8?B?S1h4cGxINkxGczFya05UOGhlNXR3MXhhY2tEWHZkMGVMeURRNXR3YjF4Wjlz?=
 =?utf-8?B?SXJaR00rQ0U4VTZDV2JsOXhlcERUVGd4MVVBcDA3eDlOKytRUlBlbXpITi9r?=
 =?utf-8?B?L3dJTUZySFpudFZaaFBrdXVIT1JpeCt3bm1IbTR5QjhDZTlzcUUrL0hvaS9m?=
 =?utf-8?B?UnVEcVEwM1lpZHlGOG1QY3ZNMTBqaysya3VrUTIzQ1grRWwvaHVJeTczd1g5?=
 =?utf-8?B?ZHVkb2t3MnNacnZPUTBhRUcxRWFSbFZXdFd6bEk4NGVPZ09zNFhpL21keHk1?=
 =?utf-8?B?MjFqOHVQOFAvRFJ6QjJpTWdOK21pVFNaMlV5b001dHpPTlFsQjZuRndla1BO?=
 =?utf-8?B?Skk2WDJKN1lGYWRmajhyWWtPTWMwUUZyeFVOZlBjaVlQQkpya3N3OHJXVC83?=
 =?utf-8?B?RE0yelE5QWNmU3lxUUJjTkhwcmgyWjRZNTlFQkhmTmU4WXNMb09wRkpYVkxU?=
 =?utf-8?B?bklYaHBCT2RVZjBDWUsxUDR5U0YxeERpZGo5RHVCUERtd2dCeGx5Y281K3hY?=
 =?utf-8?B?YkNQajIwZUl4NmtVb0ZlRXBnYmxxQzVPd1pXZVdjNmdDNFdZbmJsWkZPbG1W?=
 =?utf-8?B?T3pqcTZRSExFZWR4NGxEV1FBeE5lcjZxbHZpYU5sQS9wRUpYK1RXZUJva2Vp?=
 =?utf-8?B?Nk8wNUdQOG80M1Y5WHhoNG9sRE0vMHM2MFgrSHJLTENTdVNvVXpnYU5QUDdn?=
 =?utf-8?B?dC8vSjI2TE1xUjNRL0RTV0NsMmlHWDlZN053R01PZUF2Y0xkQjVxR3paY3JT?=
 =?utf-8?B?R3prLzlzT2hQb29ENW4zK2UyMFR3MzVKN21FV09xR0ljTFloOXhFdkZNYVhB?=
 =?utf-8?B?SzdGb2Y1ajhJaE16Q084NFltTit0V3gzcEdZQzVnR002VXNILy9lVG9sb0Q1?=
 =?utf-8?B?NzZ3QVlSTUxISkdLSnFyMGluYkNZdi9EVi9QVG53U25sQWNLMTZKSkZJdFM2?=
 =?utf-8?B?QzhXcnRncTBReDVHY1RzVmx5elVaT0I4Q1k0NEJUTUhwV0dOekFvdnQ0L1Q4?=
 =?utf-8?B?d2YzY0UzVHdOWFlWZTlFaTIrNFJVRDJoV0dIWjFIUTZvNCsvWDNKQjF2V3pD?=
 =?utf-8?B?TGFFOElmTHluZCtnWExkRHNDcUg1KzNBVHRTWW9LYmF6MmJEcUxmOFYzcDh6?=
 =?utf-8?B?cW9IZlRxd21NamRXR2V2b2hMSXNFVGJLdFVCalpCV3VqNW4wbkc1WmFMT1Rq?=
 =?utf-8?B?SmV2bldlS1Fad3VpOGk2U2MzMFA2SGVhSUUzMTJJSE5KQndZOUliUGc5azdF?=
 =?utf-8?B?UXM1QVZ3bGNJTzIwZzhHMG4xZmZ4K2xlUHhTT3pTTHdtSWtxTWJTL1pCSmUy?=
 =?utf-8?B?ell6TnNrUHg5bW9YYzk4S3pJVmJrYzIxZjlUbXowWEorUnFYU0V5VnF1TFd6?=
 =?utf-8?B?T3hJcitVVlJETTZCNldXem1Rc0NoUWxrcCt2M0pmdit1ZWNqSU9zQ200Rlk2?=
 =?utf-8?B?cE9lL2VUdzcvT1IxNTZzKytCbkh3L2IwZk5UMjRVQ2tOK0xEbkFabWJPYUps?=
 =?utf-8?B?QTFaOWRQSmdiV1hMTHVsZjRuOXprYWpoWGdKenRTRjhiZHdMOUcvNEpHM0xB?=
 =?utf-8?B?a0NIcE1YblA5aThtWmZUZURRSjg2UVdzZk1vbGNwTCtwQndYWGI3aXJobzAy?=
 =?utf-8?B?QndtaHJmUnBScG14cVEzUVpQdHozeHkwaThMN3JsVXE5bDBOdVNuN1JDVTdx?=
 =?utf-8?B?VDZDL2p3MnA2bmtvbXA3eSttWnNzZ1lJTlpIUElwMnhYV0ZVR0VhSVhjQUx4?=
 =?utf-8?B?ZjlZRGkwMnFBZFFrL0pOS0xJZnBMT3doVVpDQk1KeHQ4RFZIYjhtUWZaZnZv?=
 =?utf-8?B?TUkvOWlKeGJPWU1JNnFZcUt1Y2ZuUlZ5Ri9Wc1h2citkbGR6VTN5UmJqaWdu?=
 =?utf-8?B?aHVvdzVzS25GV0VQc1hEamRaZmxBai9uczMzSXlVOUZEY21Od1hPMXFTdnhn?=
 =?utf-8?B?bFB6Nkk1ekhlYlFNMVhtb3l0MEowUGV3TVBBZWpXd3doaWdyTWV3c0lSSXpu?=
 =?utf-8?B?OW5IcXR3RUErVDdqcDBSUzBvcExQQnl4MmdPK1pwWXJ5RUllUVRxTVVGN0tC?=
 =?utf-8?B?ek5rSEJOQ3cyalQycTVvS0h4c2V2bktaTlREdUZHL2U1QktLOG53REFoczRo?=
 =?utf-8?B?UDFQdHZQY3BHcmxOVEd3WWFoUDBVeUxPSWM2RjJSV0JiT0JXemZSKy9aT0FV?=
 =?utf-8?B?VzlNQVZCbUdYak5RWlNMZFRDVmZJemNmZUlKdU0xeDBTWVp6a3FVa3VtTGQ2?=
 =?utf-8?Q?+5Gq/UUt8UV4awz4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 527b3910-139c-4ab5-b045-08de58006968
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:46:32.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toF1MroATOkQXrQ6YdMhxjjI8w+Q6wwBx/9ycVYV0Bjj/8nfYMH9mxuys5YQCnN1wKJdzshOh+ABv8g/uUX+PSuPEW1J/5ZQ6ENSK4ZQZcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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

Hi Raag,

On 16-01-2026 03:03 pm, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c             |  7 ++
>   drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 77 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 49 +++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>   6 files changed, 145 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ff567fa58119..16e28cab8464 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -122,6 +122,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 1d78916dd6ad..b5a57e2dc0d8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -10,6 +10,7 @@
>   #include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
> @@ -30,6 +31,12 @@
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +	struct xe_device *xe = container_of(sc, struct xe_device, sc);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_sysctrl_event(xe);
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static void xe_sysctrl_fini(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index 5919310b9db9..bd9acf575d14 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -12,5 +12,6 @@ struct xe_device;
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_sysctrl_event(struct xe_device *xe);
>   
>   #endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..3a860bc34db0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void xe_sysctrl_get_pending_event(struct xe_device *xe,
> +					 struct xe_sysctrl_mailbox_command *command)
> +{
> +	struct xe_sysctrl_event_response response;
> +	size_t len;
> +	int ret;
> +
> +	command->data_out = &response;
> +	command->data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(xe, command, &len);
> +		if (ret || !len)
> +			return;
> +
> +		if (len != sizeof(response))
> +			xe_err(xe, "Unexpected response length %ld\n", len);
If we see response structure is mismatched, should either return or 
handle gracefully.
> +
> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> +			xe_warn(xe, "Counter threshold crossed\n");
> +		else
> +			xe_err(xe, "Unexpected event %#x\n", response.event);
> +
> +	} while (response.count);
> +}
> +
> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> +					  struct xe_sysctrl_mailbox_app_msg_hdr *header,
> +					  struct xe_sysctrl_event_request *request)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_sysctrl_event_request req_data;
> +	u32 req_hdr;
> +
> +	req_hdr = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);

We need use APP_HDR_COMMAND_MASK right?

Thanks

-/Mallesh

> +
> +	req_data.vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	req_data.fn = PCI_FUNC(pdev->devfn);
> +
> +	header->data = req_hdr;
> +	*request = req_data;
> +}
> +
> +void xe_sysctrl_event(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_app_msg_hdr header = {};
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_request request;
> +
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
> +
> +	xe_sysctrl_event_request_prep(xe, &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +
> +	xe_sysctrl_get_pending_event(xe, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..9c5fb95c58f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		68
> +
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u8 fn;
> +	/** @reserved: Reserved for future use */
> +	u16 reserved;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Number of pending events */
> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u8 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:23;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;
> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 750b7528bab2..c6208a611c9e 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -27,6 +27,16 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>   
> +/* Command groups */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP =			0x01,
> +};
> +
> +/* Commands supported by GFSP group */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT =	0x07,
> +};
> +
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_device *xe,
>   			    struct xe_sysctrl_mailbox_command *cmd,
