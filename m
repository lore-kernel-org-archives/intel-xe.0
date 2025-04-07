Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD119C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 06:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E0510E1D6;
	Mon,  7 Apr 2025 06:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4cI4ck4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D233910E1D6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 06:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744006553; x=1775542553;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ctx+j//lOqNhhaSQgJmO5ZOIgmVrQXWMMcqAZjzISY=;
 b=O4cI4ck4qlPflrT01JSWoKWUcndhqeym338DPRolV8+vYifcYmsXFL5/
 iIYBNpMsDmh+qCj4FWLq0Nzey9U/pfuRetoGDFGNkRWbgeTc1g39LUHbv
 PZ62FJICEwoWCYoQCcVuYRiYA9gt5VxvQcXqYXpkI6TJhF5KnE4NOPfwq
 3ii1mK28Py3Z0ndvtP91QruEVSdjHQzZ85asfVfdjZ93eyrmc5JIHIEE0
 nAQmOGeJu7Iu355/c1eWAmNufpkvR0IFH9OFfJeuU30WKEuO3S9E3PBSm
 CBsVIobMIK4iD1RY9B25FR0Ckc1E7VE18tdKNUmOxs5cWbnjD0DENn8I/ w==;
X-CSE-ConnectionGUID: 31SYk2sNRDSotA+AQ/Mb7g==
X-CSE-MsgGUID: 1sXHVbMtQui9OETTooGIrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56008180"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56008180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:15:53 -0700
X-CSE-ConnectionGUID: zggPULkTSla8Vs69CzkcDg==
X-CSE-MsgGUID: s5v4/dxnQs+faCGLpxHM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127836923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:15:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 23:15:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:15:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfM3v0xLKC1X5lrhVBOwpdRHTKkaa8ujRE6HCz25+ttnFlhIQ845X1TFONGD9yWOXP9sOEo8XAux6bFwGj20jHnoJszhIeb56k2XyE+jNkRekS4geF4CoT7RWSxe0SknjQYzimwjylVo+XRTf93pQ12F8083vWSr4SnkGnCJJIL029o9T3hk2t48UL8Y7FylsE94Rl2R+2a37b6x9cbAAEdSsi+Hkc0VO0qQjdsjG3/NHFclrizgJWZ/61OTU9W2mHkULx1X7rrgTWbV0o4srH/zCBpUQumJ4W9Lrignrl9GGLC+/fWE6fnvaD+sDudIWO7e2pr68XgCgrxwALJB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzcbxhNGT6pUyxHZ3kpN75fY4Mjub5bwJ1UwsalvjIA=;
 b=MEHzhvzTmTVIYCMjY0oX0gEhuYOEcDfsrhOyNkjCmkUq/FcOsC/Ftdi72w3ldolsaqM6rwWwx4Vvw9Q0ers+GdfaCmGDz1PZcifOpDYMS2KFJMRhKP22/BPjMNob5XlGSPvwAD8JleS6lNe6rQWZCQ7OEL/97+x7kRM/8J4hMFW6JUcAQjQp91UwINXVQb+wHZZL+1h9E8lIIi/e39hHg+TrxRVrNp13z8ijb4Ki+W+1hRXuHrB8V6WMiLENL+7LULSW/4OI0IsPSAffET/dRk0euQX2EDr/lpQvlT13MXi4tVlphAifCq2Wy3H9CKit/4HBdZlet5NYVh6NdDXk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 06:15:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 06:15:47 +0000
Message-ID: <c805bb29-ddc8-44a7-900d-48cd557b06b3@intel.com>
Date: Mon, 7 Apr 2025 11:45:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 09/29] drm/xe/svm: Allow unaligned addresses and ranges for
 prefetch
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-10-himal.prasad.ghimiray@intel.com>
 <Z+7087lxPgQWSyez@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+7087lxPgQWSyez@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dd743d-2860-44e7-79a6-08dd759ba30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU5SRXZBNXR3TG56U0FOaW16Rk5oYXdDMm5HdVlvTHZ0UFRnekhlWDMvcmp0?=
 =?utf-8?B?WXVwYWF1Rm5mRUkyY25hanBEeGswWTJ4M3JzMUJNMUhNN0tQbDBZMWxyQ1Qx?=
 =?utf-8?B?a2N1a2Y5bm9hdnMvK3c1a09zdHoreFh4YjcybjZOSGhNamJEZGRwTThSMTVl?=
 =?utf-8?B?MncvT05INkNaVm5wOHREanpLaXlNL2p0UUVnSE1oSlRKRnREcFd4cXk2NnAr?=
 =?utf-8?B?UkI1MGc4SURveHhjMEh5aFBuNkdLSlg4eHR1RTlOWGxZN0U2cG5tQ3V2eG9W?=
 =?utf-8?B?eHNiYUZxMU1GTkJPZ3hRSWp3eUxGdzdsdXB2Q2J2WllDOCsrZ3hERWM0R0Zw?=
 =?utf-8?B?blBkK21FYUZ6eXR0NFl6TkdGV0NudWRRcm1DRWRKMnQ4SnZmOFZUZ2piUzBK?=
 =?utf-8?B?a25FL2NwdEl6VGJXOHFTQTRjRzRXNUNSSDdWekVxRERCaHVyQXRkRk5acFVL?=
 =?utf-8?B?VXNzTit5d2Fnd0J6VWFQWlRDeEVmVTNzd0hUSDkzSUh1MjRKMzN6alV3TW1x?=
 =?utf-8?B?dS82dmNSc0xUS2owS2lOWDBaUTJtZVVRS3FCcVdYTWtVeGs4TTZjK282Ymh5?=
 =?utf-8?B?dWJnRTJ6WGhMRHZyOG1iTlpsS1pjaHB2YS9nWE4vbks1d0tHY2JpNStxemtl?=
 =?utf-8?B?T3RZNXQzUmpTdGp0WWxtT3JDQUdLSWc4MGhaM0I1V2g4WE5RK2c5WTc4K1Zo?=
 =?utf-8?B?Qk5FRVdiVE1kKzl6MHNKNVJDUEYrcmc4clhXTFZLQnUxbEZocVhDYXpWK0hw?=
 =?utf-8?B?VW1yM2FlZTNpNFcxTWVCTnRCbEw1Tko2T0NhcUhlZFJZNm1RN2tqVk9mNVdU?=
 =?utf-8?B?RS9nM3ZENU9oU0hNU2VLVHRrMGRJRUhiVDZhbHF4eHFBR0h5cVpUREZZME5Z?=
 =?utf-8?B?dGtXeHN3ZjJNYk1ISDRTY29JbUlVRzkzVjhJR3ROR3NDLzBibWlNT0RPcVBR?=
 =?utf-8?B?VzRUa01sajRNMGVKcFN6L3JRaVJoUEN3S0p3V3pwK3lvY2UyeFlUQUVFUUFu?=
 =?utf-8?B?QVhTdGJsMkVpSXIyeUl6Rlh0dllFMGRWR0tKeWxnWmkxamNvM3RPak53RkpE?=
 =?utf-8?B?OVBLcWYzekFsKzJUdjgvUmkrRkZXQnhsUU9KR3J4cEdVSHEwWnkxYm9uVE1M?=
 =?utf-8?B?WTlZSEpCU0phdWRyZ2pWMGdFVWZNV3BEeG1BY1NYYytBM1hWQ2R1SnR6U2Jp?=
 =?utf-8?B?TWxUS3gwSjF3L0hFU0VHT2MvYnJGa2RmWHUrVkp5YStGY2NGaXdqZzNWbzFq?=
 =?utf-8?B?Zi9ISlUwbmhFM3haSy9aaU1QeDE2MGFqTWFDWVduTEY0dTZiSCtkZkVVODNh?=
 =?utf-8?B?UnN3Sm1TOXRycElsYkIwQ2pUT3dheTFNS0tha0E5YjgvOEtlbVp2amt6cWVq?=
 =?utf-8?B?bk5NelZtZ3VCcnFrTmMvRmNiamp6L2I5L216WS9hQlRTNVJkRFhaNVVKR2JF?=
 =?utf-8?B?ZzV6RldscjUwdnRGb0tjclAvNEdJQ2d2ZlNlbkhaVlR2V3FZd2lrT0ovT2ZS?=
 =?utf-8?B?L1NYVFFyVmFndS96U21LL1laYXVmdWZFUUNSRURQb2RhRy9XZWl4ajJoSTE4?=
 =?utf-8?B?ZFNLN0pVcHVaVE8yUmozQXFkSDNBaVJuVWEzTUg5b0J1S1QwRHlMUFBOSHdp?=
 =?utf-8?B?WTFCc1lRY1BremxWV1VkVGJ2dWNkajZSSTQxU2Z2VVlqVVp1bTFMNlBpcVFY?=
 =?utf-8?B?blJmOTBKTmcycERWVzJrUnQ1b2ZPNmc1a3AvTnB1a0xKdnc0MGpWODF2dnlw?=
 =?utf-8?B?K3NWcml0M1JrTXpraEljQ0FHK0UvVkRBNW12cEJ3Rm90Z1ZEUEtHQU01dGtY?=
 =?utf-8?B?bzV1MGxFbzBEa2dtdVRWdC82V1F5UkRrL0FURVFQQllHOVRaUG1vbllhU1Ar?=
 =?utf-8?Q?a091QSuMS9poY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dYS2FJZFVXWmRRYUpYL1pEK1BZUTQ0VnYxMERRTDNvYWNaS0xNNUJNa05o?=
 =?utf-8?B?ZDFRLzZFQ21QOVJNNnlVcHI4VG5UTnRoRFJic2lTUlZodGoyZFJ6Nmh5Nkc0?=
 =?utf-8?B?NlhycFo5SC9MMVBINjVoK05udGFXbXdOVDlKQUlPUjBTV2pHRTZkUW9xL0Nh?=
 =?utf-8?B?Z0EwcEFYZG9tQ29pZ2EvUitVTGo0cFE4N3VjMWhaVnJWVUJIaXNkNys2LytZ?=
 =?utf-8?B?ZlJ2ZHdOZzkzeDVXRjJ3aTgyQlBzZXBTdU5XOXJOeTd6Ry9lOEhybEdlUHgx?=
 =?utf-8?B?KzV5UU9WSjdYMytYWDRpdHZqQ0toZWRLUUtrYlZzWXk2TFpkNERKdmduaEdQ?=
 =?utf-8?B?cVVzY0tET0VYbUlGeko4bExZR1BiZ1RtZVNkZ1hUSGp0MEZJK1FCY3ZpaTNv?=
 =?utf-8?B?VlZjVkx2Q1lrUmxBV09pTTZEN3owMkdFSnJ1ZGtTZ0N5ajNEelI5TWdpckpI?=
 =?utf-8?B?anRJTEx3WkxQcEw0Tkl4elVOeXo1TUhySHVHK2k5bUJWaXRqSDQ2dWMyQjJH?=
 =?utf-8?B?b054ZmpPWEF5aFBQR2xqMXJTa2VUVUFKZzYzQkhWUU1yZ2IzZTBzbVcxbFpo?=
 =?utf-8?B?Uk80b00xRDhIbERLZ1NhREJuZXR0TlRWNnVtWW9vTjdqMnRnZW9XRThFY1Jy?=
 =?utf-8?B?dTdDS2pWdzNHamZzd1U0cXpQUitDQ0VvdFJBY0kxTzZWS1QxY2dyOW4xVklC?=
 =?utf-8?B?YUhMSHJNR3ZiUGJpMGNlNStmd1l1V1FHZ2R5RzA5bjFTYWZ3N3d0MEVJc1lX?=
 =?utf-8?B?SnVPeXJQc1RwTXJWcnpIN0UwS2czRU04c1g4eG5ocEViRmVSa0xuZWJIQnBL?=
 =?utf-8?B?QlhtSVFGV2g0U3Jqbm92UkhzZStFenIwMWt5anpoMGJoN0FiczlUZDFZaWNL?=
 =?utf-8?B?bzNhb1pRblJ5b0xuV1ltR3g0Zlc0UjE1K0R4TW5icjkrUCs2VkhtK1BXWXpl?=
 =?utf-8?B?bmlpQS9wVmdwRmtEeVlGU3ZTL0VqelJnVjAwTXlIYjNldndwRldqdDlwaXRO?=
 =?utf-8?B?RTBjT3NlSVZjeWRBT1owYkZwb1RuRWNvcTJrd0haK1hBVDdIQnlRR0wwQkxr?=
 =?utf-8?B?SU9RR2NEWHBOZTFhL3Ewcm9rdzYwa3N6Z2VKcDlwSENrU1E4czNVU3NaSklK?=
 =?utf-8?B?Wmg5Qjl5MkUrclRWeG84ekdyS3lmcXRvVkZZc1pKK1RTOThtYmlUZndpQitP?=
 =?utf-8?B?WXpkcXBMemZrMzl6ekErblhjcy9XSjR4RkU5azZhbVRXMmsyelgyRnNZeHkv?=
 =?utf-8?B?c1RJL3lHb2ZmQXZCSWRjOVZZY28wdGI1enNmWkhxalYwVU1uRCtjMTl6Y0pD?=
 =?utf-8?B?MENiNkxnY3ZnOG5mQUNGYjlvTUpiMGxNL1dEYW5XY09lTkw2Ky9WWVZodGJy?=
 =?utf-8?B?ei9zdlI2MkNrZjRCMTdoYVJscGZrdEpyMHd4Tm51dzZyWW93LzlLVTdHaTNs?=
 =?utf-8?B?VVF2cS9nU01qRUtnOFZzMW9RQlR5Z3QyOHorY0FYVVpqOVJYRTIrQ1ZIRFVD?=
 =?utf-8?B?MDFSYTNFZVNNbVRyY1psV1RGbUd1V2NGaXVLTjB6SlFsSWZmZlVMalozNkh1?=
 =?utf-8?B?NUpxNGd1aVV0T2l1UTltUHZCMnp2WVpybjl4RWo2cnBBczAwcllKT3JmTThU?=
 =?utf-8?B?UmxQdElEQks0dlRrVzFhWXlITXZGQndPWTYwZmNVTnJaYjlTUzA3WDI1dzN2?=
 =?utf-8?B?c2l2MDd4elNXWWQ2RGRnZkhEMDM4NFR1SWhOWFV0RlR3dDV2VWdXM09nc1JF?=
 =?utf-8?B?ZHFycVZzeE82ZFhROW5RdjgvZjFMWFdaOE5QTTh1aUpueGlzVTlidW1xdGpi?=
 =?utf-8?B?MGs2OTRFTEp0bThhNE9mc2hCU0VYUnBGWU0zR1Q5am9JcDlGMnRTSkFxeDRH?=
 =?utf-8?B?bWVHZmVmTkwrb0haaVJYRlp0T0lTWVpqQmovQkp1ZkVJSFpoWnhWcUdTZGls?=
 =?utf-8?B?VDE0UnB5SFROUXJsUEtiY2hwWDJSRjEyL3cyZ0dxV01EUVJaVmgwcWxuT2Ny?=
 =?utf-8?B?cGE1TFVSRG9vU1M2ME1jUnhFTnhxOGRXUkpPOEt5d0h0aUY5Wmsvd1ZzYjd4?=
 =?utf-8?B?Z3RRV2pDMk5jbmlqN21vNnRQaFZvbUVWSVl6aStnakY5eEpaZGUveTgxSWs3?=
 =?utf-8?B?d0VlZVh4TFM5WkVxd2Q3dktpY0V4U3J5a2pWVTBDelVMN1plNXl4bFU2NDZU?=
 =?utf-8?Q?sdDg8qgVMGsPjsm1iBPFdnc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dd743d-2860-44e7-79a6-08dd759ba30c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:15:47.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQGbFgC0R/6aWaGUCA2tp2DodSm6HxRmksbID7H6aNmdyTXLHEX2iKKSIpOUSO3v6RON9z/C2YN5N45ZQTmlyLvxZ8+j0GH5Zau7z274e20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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



On 04-04-2025 02:22, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:32:06PM +0530, Himal Prasad Ghimiray wrote:
>> The SVM prefetch operation can handle unaligned addresses and range sizes.
>> This commit updates the ioctl parameter checks to accommodate unaligned
>> addresses and range sizes for SVM prefetch operations.
>>
> 
> Do we really want to allow unaligned to page size prefetches? That seems
> rather odd use case. Was this a specific request from the UMD team?

Yes, this came as a requirement from UMD team.

> 
> Matt
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 07cad2804b14..c6343a629c02 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3086,6 +3086,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>   
>> +static bool addr_not_in_cpu_addr_vma(struct xe_vm *vm, u64 addr)
>> +{
>> +	struct xe_vma *vma;
>> +
>> +	down_write(&vm->lock);
>> +	vma = xe_vm_find_vma_by_addr(vm, addr);
>> +	up_write(&vm->lock);
>> +	return !xe_vma_is_cpu_addr_mirror(vma);
>> +}
>> +
>>   static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>>   				    struct drm_xe_vm_bind *args,
>>   				    struct drm_xe_vm_bind_op **bind_ops)
>> @@ -3194,8 +3204,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>>   		}
>>   
>>   		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
>> -		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
>> -		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
>> +		    XE_IOCTL_DBG(xe, (addr & ~PAGE_MASK) &&
>> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
>> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
>> +		    XE_IOCTL_DBG(xe, (range & ~PAGE_MASK) &&
>> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
>> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
>>   		    XE_IOCTL_DBG(xe, !range &&
>>   				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
>>   			err = -EINVAL;
>> -- 
>> 2.34.1
>>

