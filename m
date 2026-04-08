Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D201073CA1
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BEC10E61C;
	Wed,  8 Apr 2026 11:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4/pxCDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250910E341
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775649009; x=1807185009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ivwrmnATx34AfkTmnJqMKHrmtLMU4p15DVuEV/zVbQ8=;
 b=m4/pxCDN+EyWKvEiZiR+WR/0E84uFkwJ23ATNPMEJR4AsoBTfHCoXxpX
 gDeqdB9fOEGGpyJX6Pxh096EMW7QWNGAD8zxPs+3zAJJNNY5ngPy2jJS+
 JsLSmYxTxT+1VezKMuZblJ7uzw60QLxtmDUsvcnX8u06D2ifRQrygtSyX
 AoVlqQPgKraLI2CuHUF7KdFCsn22tEYzBjs+rb+azM83wRUsSIX9eUIjy
 sTcH3akAXUZLycGrc07PXeeoEzT1fls17XZQEdkrLbFFthz/O7kHBj7mW
 VB29U81xBEavuHbHpUChJO1x4U6ZutUqj6mwXiwYDd+hQ3qaeWJhb0ZIh Q==;
X-CSE-ConnectionGUID: SevH0LDdTHGQJ/9qK4lmzQ==
X-CSE-MsgGUID: 01L4E5URS8+1sLa2ilvnjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86920801"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="86920801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:50:09 -0700
X-CSE-ConnectionGUID: 9zrkqXVES9Cydo06xcaJxg==
X-CSE-MsgGUID: J58k/cjjTj+YAJGc82BI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="230117152"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:50:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 04:50:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 04:50:08 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 04:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2zjStdF2YydARiNp3nEDfKgM5Kxmt7eCqs6VaqB52NrohPIjzigRJ5RBPanhpLh2Kh/eiUgrYZz13xJ0OQwO5hodoc9Ff6H7XNr738flgba2S+7ZgILVy73v+T3Lq9qRsWo+5Kl9pz+8BudwBig6Ajk9UGA6tEqw3xTe6Fmn49PA5ZHj3WmnLV5e4ICUzYtusD1JSA8KJ8pZdAYq/NkARkc90odIAtFWIb0HHLe97qty51MX7rnGrvSMlGTpx+r9rxpY24ooju/1qhlNOSicYhtZiC5quhlfRkXphUTB0wEIb6jNrqajP88ajvl+4+dBPIuhXgbW2tUvlBBOwPgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL1NcnbuG/VTobudj2hyAaV61ZNxwWNPsALxEbZEiLo=;
 b=BGpE25NbYoD11JnWRTECsLmfuRsbRFrp3RiKRVYQPOo/ZPcvWif1HpUZyIVGZosrthEVqvfGJUzSVRIb0PNxwgNb1rEJ+9FbTX1BI3cxAIzw3KUJDMVNPaJGIr0lZlnelbnAu2lLhbO5H0Bszre+pK8Kg6KSa70d6lY/zwAN6DnaUCpeC2UBx6Bi67UkCKWw/CLJ7wbsVl0Z3lSfiYe+AxbfmhGIDNSiZGWnVx21lC+BZ9Any/+EYyjucRyezifGf1ruamUbAier5y+rrWRo1HmD4+7qo7kSVlWi7gV/fYNX5R3DeTWmd4Aob56qP7zDTiZ/9lsAlHNoeFOjgoXWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:50:03 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:50:03 +0000
Message-ID: <6e821825-872f-4246-93da-03f1f8c42998@intel.com>
Date: Wed, 8 Apr 2026 17:19:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260309051705.980155-1-soham.purkait@intel.com>
 <20260309051705.980155-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260309051705.980155-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1623c8-c420-42d7-6d95-08de9564f897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ecxyGopAMx5ucEDmT3SQWKkVIjXVv9+r93JELd8DLVnEETj1PHSxLGHZ3B75/keMEAuN4d3+cJnQiHZRyHKXnO+wL+Ddf7NWs2zWfqEfLd/zNd3cavOO6KKn7jQSIGi96PJHnoRLVHwMBK+FrVc9dsOuFCKFohSv0Lgj4i7N/dcE47A07lujcvG9rjSnYSYMWcPWXOSEZggSiNFBenukhzXMiey3xt4ES17rsvv+qDm4u9YE5Yp7+bkEtpkAytFdQOIWb7El5Fxruwylem+24HdoSu0I36LEc8nJbByN5Vp+VfBkPf+Z983nEnHh8oUhb0oXdhs4/V7CAmlJwDmtqfH4PX5i9a6quQX+wtRtC8TBxOPM70AabeZiIBCfgrXJQP+NE0feoQ190hHhr/iPWrFTZV9dtl2sNGr/1vFDJ+vj5f8tx74LYInz7yixmDyRo6piUx/LBFlsur89+gXHq+YTC+QrwI+kN80iTMU0VElZtKjwSJgoH7ty0dvLaA9cbFlrINh00syWrL4QGRCb3K7klyhpbq0XrRTFEq0zIVRB07yJAwdmUOw3gfic8MGZL7ewdGdpyKuGcBXDgoHGoWmtZHVOLTAcYr3mwLZWtCmG+I4HKpKTSxsjONAmZqThEAKzHYfcVHEU15gmllvnWlBuVIVqeBajo8OokmRGzHjEzn9IHNeq0qfs9Ur7VTsIYWN7fbU3IkhSH0A6AmYhVLGIP+Lx+no2PBmHM37Qwdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUk2OHVIRFI5S3p4Z0ZPK0xoT3ZQbm9Ednk3ZUp0bTNWZStaSHNPNGd5OGJC?=
 =?utf-8?B?TXRFMkgzUW1lZkZvd2c0Vmx0TXkwbDZ2dFRDNEQ2MlZ5M2Z6aFdkbHdBSXNQ?=
 =?utf-8?B?c2tjU0tsM01rMWVMejRkaTh4aTAvbkVidlNScG9HbFNuNjZ4dm1VMGMwL2Zy?=
 =?utf-8?B?N0IwMjlDS0lJZElUMWdnQWZzMjRkZ09XNEdvaUprY3pEeTg5cGFhdHJiYzR3?=
 =?utf-8?B?WWU1cjBLWFJjYkhoalY2THZxeVlLY0hWMVl4OVFWamZQdFpXTzhpUXhVTkNx?=
 =?utf-8?B?UHFpOUovQ3ZwVHplTW1qbW8rVkVGWFpWM3oydmJoR0o1bmdwY0ErMjFNSmZW?=
 =?utf-8?B?bUFuUklUVnNrSkRVMjIyS0YrcisxY25rMGNjdlZiY1dHRXE1TFAyNXM4Zk5j?=
 =?utf-8?B?Q2twR3dhcTZFZ3RJd3JyaHhQdmN6aU1Ed0NHMXJoK21sN0hDQ2txTWtDN01M?=
 =?utf-8?B?MGtiOHVSR1EyYXhXRkw0N0JnK1oxdU5CY0RyR2l3bDdXMmF2Q3JZZXhMeEdV?=
 =?utf-8?B?VU1qNVFRbnpzanVDOEVFbmpGQ0F5bm50L3kvODJzVE82YTlkU1NLVGtYZXV2?=
 =?utf-8?B?c2NEZUc0a0xXazRDZk9SZWd4NXIvRGtuUlFWUUErdG1odnRTWHdXOVFsdURU?=
 =?utf-8?B?WVUyTCs5SUQ2Rkh2bXkxZ1pKV0tvSWdBempyOVh2TmJoWHVKOG9LOXl3Ym1X?=
 =?utf-8?B?b2tmVEtyQVBSMnJLRmxIRWJVeWtaQnpGaXprUm1rcUFEeWk3V0QrMjFhQnNl?=
 =?utf-8?B?cFBiZGFCbzFFbjlMdmdHaWRReDRhcEM2dmJ0YVFVQms2R2pVSWZKVENUellC?=
 =?utf-8?B?cU9ZZFZTMlFja2lRb1JseGIvYzhIZWFBTHJ3eHJVbnNkQ3FCcVBDVHdFTVFJ?=
 =?utf-8?B?MVNBdnIzVXIwNTN1UmxPeEc5QXZuS0VnV3VYSWNHSi9GekhDVVRUc0huQ3h0?=
 =?utf-8?B?YUxScFl4a1dnR0Y0c3dTT0JVNWszQ1ZlT3NqSDFvaGZ5V2VMVTI5bzhKYmU5?=
 =?utf-8?B?WUd2ZXAzTFRVT2F0Z1c4dTNLMEJQVjdRUzIzOCtFcWV0NmRRVWVFOHVTaEZZ?=
 =?utf-8?B?UDhoOEFTMWdncGNySnRKOGtXZWdBSllvOWVub1g1MFdrYmdDN3dFUkduUXhq?=
 =?utf-8?B?TUo4VEJmZ3JYdmdFRlBBS25nd3FFeWNiTG0zTE9kYTZRNUNxSDVRYVZVZEF5?=
 =?utf-8?B?SUxNNTdwNHZLV250ZXlRVGxzUkhGeUoycWM1L0duY2VlQktrOU8wSjZtODYw?=
 =?utf-8?B?VXdUSUhOMldld2hyM0RoMFZLVGl6Ym1xTlVoNHJjWll5R2VjcFcycHZ3V3Rk?=
 =?utf-8?B?UEt3cytWLzE2N2Uzc21zc2JJOEZkUlZYelVleG9uVGYrSlZ6QVRnMFRzZHNv?=
 =?utf-8?B?a09zL2R4cXgxeXJic293UDd0a1JZNldJeGpWVjYwTkhtUnhPYzNBWjVHNUs1?=
 =?utf-8?B?Qi8vL1dPRnBwS1ROUkllWUd0eTF1VFA4Tnk1S2Q4U21aRDFOMHZlV0NjdW9I?=
 =?utf-8?B?VFl2Y3RPVnBIcDFveDUxcE5TcU1KWEFPSnBkUjVUM0ltSXplN2t6NFhIaXEw?=
 =?utf-8?B?QnVzSDNXcGZsanhycjlRVjVaWmFsMk9OSFlNOFRMc0pPeXZ2QTRlaWNvYncz?=
 =?utf-8?B?U0lIUkJDaTBISUdBQktxRU04ckdUa1R3b3R1QjAxR0cwRkN1S0JOOW1Ia0Ex?=
 =?utf-8?B?Vjl0dWJoQkVDRXllQ0JDcnFRUlEyNVRZV0diSUR2Ukt6WUtXeUF5aWtEUEJL?=
 =?utf-8?B?NVV1MnRlVEp2Wnhxd3I5Z05jcWxkWUhJUDd5SzQ3dlBoTjBLRHR0N09neUVP?=
 =?utf-8?B?aXQrc2RzODNLaDlMTkl4aEtUYnZvZW5tNjdnbXpzWDN5bzhKQVlmY1lhODRo?=
 =?utf-8?B?dUVSZjBmRFREZFgzK3ltcWZ3Zk1EdzBOQ21pa3VBeU1zQlJwMEczek5yeDZm?=
 =?utf-8?B?SCtRN1ZoN0U0d2RUNTBFNkV6d2w0dG8wTUZZNjA0c2tBYmthaCtYT3M3OEcz?=
 =?utf-8?B?anJDbjR3WUlReGVoeWUvckl4eVJCbTRYc3h3TUt6TUxuVkVxSjVUbnNxSnMw?=
 =?utf-8?B?eWp1VU5xYi9XRFd6MDh5K2VYWFNHQ0NXakVnOFhsWjZUZStTT3RCZUhxaWFk?=
 =?utf-8?B?aWc3KytkcGJDWlZNbVVCSlUrRFhFQ25TSGNsSjFsdkxaN0h4N05vYmpobXhV?=
 =?utf-8?B?VHByVDVZRDRobVFJNUtxa0ExNDZMT1Z0Z2pEMjRpM1ZzRjBvdDZyUXZDU0VV?=
 =?utf-8?B?eDVUaXlJNEhkd3E3V2dvZm5DY05Mc3lqYk9JMEFaYStBWnhBRWs1YUNyeVdP?=
 =?utf-8?B?cDl5d0Q0RDhWeFI0TXZTMVdDQThQdWJBRCtjSGQ2cXpHdUdnOVJJUT09?=
X-Exchange-RoutingPolicyChecked: vY9ZoR6wrsFqR7efl0jz5oTk4csF2T19y4OH1VHRzHiNGivdqTFn8hniesObAlh42t6oDpF842t+V5UJRFSsLsS1mlQ4uJIG04TpLugeWhUJ5wxCZp4ttMG6o4ZnS+r8C1d5Is8Q5FVPZYx6NXxam95NsHT9e6T1499l8sliDctsQ+/jIP2NjQjaFW7oklf2rLq5Ikp8mp2jyO6T6jDziJUsGViHcODRiWSZNkxQJD8ADpvoOvv4l+nwpqsJg9K3JO/SURiwOG4V5uA3HtSxnCrh/wd/kuC9p3BM3kWfte496SgRBqwSVSMDH9NuA4xEYeQ0peteX9ZB/N9tfkK+YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1623c8-c420-42d7-6d95-08de9564f897
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:50:03.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnsSkUASgQZPOsGphLA9E6ja0SHG3cNDXDY2Cyu76COy622HvoeDrZOS9bpdb1KdQ2UXNKiH78YHtviXFSJ2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
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


On 09-03-2026 10:47, Soham Purkait wrote:
> GPU health indicator exposes a single sysfs interface (gpu_health),
> placed in the device level that allows administrators and user-space
> tools to both query and modify the GPU health status.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile    |   1 +
>   drivers/gpu/drm/xe/xe_device.c |   3 +
>   drivers/gpu/drm/xe/xe_ras.c    | 166 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h    |  13 +++
>   4 files changed, 183 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1890bbd1b28d..ee18638f73c3 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
> +	xe_ras.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1d61bb504e9b..2283a18e1034 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1009,6 +1010,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_vsec_init(xe);
>   
> +	xe_ras_init(xe);
> +
>   	err = xe_sriov_init_late(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..44324fe3273b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
> +static const char * const gpu_health_fmt[] = {
> +	"[%s] %s %s\n",
> +	"%s [%s] %s\n",
> +	"%s %s [%s]\n",
> +};
> +
> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +	u32 req_hdr;
> +
> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	hdr.data = req_hdr;
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_get_response response = {0};
> +	struct xe_ras_health_get_input request = {0};
> +	u8 health;
> +	int ret;
> +	size_t rlen = 0;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, &request,
> +				sizeof(request), &response, sizeof(response));
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +		return -EIO;
> +	}
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: %s state = %d (%s)\n",
> +	       __func__, health, gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, gpu_health_fmt[health],
> +			  gpu_health_states[0],
> +			  gpu_health_states[1],
> +			  gpu_health_states[2]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_set_input request = {0};
> +	struct xe_ras_health_set_response response = {0};
> +	u8 health;
> +	int ret;
> +	size_t rlen = 0;
> +	int state;
> +
> +	state = __sysfs_match_string(gpu_health_states,
> +				     ARRAY_SIZE(gpu_health_states),
> +				     buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.new_health = (xe_ras_health_status_t)state;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, &request,
> +				sizeof(request), &response, sizeof(response));
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +		return -EIO;
> +	}
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: %s state=%d (%s)\n",
> +	       __func__, health, gpu_health_states[health]);
> +
> +	return count;
> +}

The function sets the health status, but its purpose is unclear to me. 
What happens if the health status is set to critical? How does the 
device behave in that case, and why and under what scenario would a user 
need to set this status?

Thanks,
Badal

> +
> +static DEVICE_ATTR_ADMIN_RW(gpu_health);
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health);
> +}
> +
> +static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		goto err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		goto err;
> +
> +	return;
> +
> +err:
> +	xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", err);
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	gpu_health_indicator_sysfs_init(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
