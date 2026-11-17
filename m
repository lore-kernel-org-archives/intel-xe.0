Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8400A606A323
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OkOz032U;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BX8B96/E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD210E57D;
	Tue, 17 Nov 2026 07:34:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667AC10E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794900874; x=1826436874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MPnKDSB2OP5F7cnB98XCkedd0E64PO8O4v/9OBBaTyg=;
 b=OkOz032U9KPU6jtX5oGVe+Lvabtt1ArsprUMzdd7K3lIXAt787UcRSL+
 skOp8/lV9vbvgwCKR1mndUQkTg5kE9S8CR7z2dy+Bxf0ACwaMGozYeqa5
 39XDqim+EAl+iteZt6cVoH2Bzt++DpJjQ9M5y01ZTanv0lv1L4QhDB4SQ
 90PM6eFajwnCG/SE5/Lgj3EVnLVd4U0XF/+bovuSuGcZjzWz/caU2OusD
 usmWnHK1LYB7JgchyPTPGcleSFM20JtC6XUw3Xd8TcT0S2wpaX+cBfEPc
 k0cDoNB3cbbzuUJXzAcXek+8CBs6lIdPcCSISXNx6cfWWJD2rj/4Vx1HU w==;
X-CSE-ConnectionGUID: FdrSt3+TRs2OajeD2V29+g==
X-CSE-MsgGUID: Uahtdc3eT1ueb7iOgVZQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3552156"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3552156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:34:33 -0800
X-CSE-ConnectionGUID: uzxSKNTvQxmgsAGWWFLRHA==
X-CSE-MsgGUID: 5aSno1KrSy+lQBYdEmJwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9700788"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 23:34:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:34:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 23:34:32 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 23:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZbgycwQCLYmCd1zxO/m1CfMmxks1H9wo1ZdR10RHJ9d1uYusb37Uej7CvBzNeQnPOPnkYdfxybwoz97QXPjSuj6a/8ovxQ+cOgeciylPEwxZiO9Hmuru/cIaomcHEgIfPV0GVQIKxQ/6PpkUM0TDQ10XFTO/IG14jmUi9AHkpSZZpPPwAJp0/Cf6UcYZqE40NFOaJbXYvAEgqJqK+HP3oMLUWvlPPJm84O6hEbyjf+CHOoUR5KzS/DXu1PA4dKVBu7K05jVoEGtfbiZgBgdWleHkys0DYNTAdDG/NpuklgjVquE7xWGi+SYvmYdGT7iTXb67TXygzvgsITqF2sR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hIrVJXQn+14C63ewXJxGXzS8slWxPyoLv0L8Kj/rwQ=;
 b=StwO+yPU4JsiX2hzwHvVOfDvj+189Gi+KoAcxvY27UPFWLnA3fDhIx+HRBXLY4zc06uZ9/rEE9xXOCeOZk2/G4CuOwR3RbgLXOIMFCi0BdGuh9B5gM7ndB+WOc2rkcKMSkl1kkma6am5nwRVluKjUKpDDM7zCdaoJ2Zo5Hub7wGYQiajWFRAPf8cw0+zcxSjpRrZWS7b+jiTwr4i8dFLCLfRBLgecre7/v3WZfOXf4XOwHbI25tRGT+Ftww8mB3oI2GeMuABWQ0NbPNIvd8xVp97/tg7zHh+xVHbLbvmEw0YY+6/sXyHIcR7tMu96K0EjZw80YWpFoufgcUI8y7g+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hIrVJXQn+14C63ewXJxGXzS8slWxPyoLv0L8Kj/rwQ=;
 b=BX8B96/EtAtKdHpl4uW7egB0rLrMIVq/Cdz5kFqo7238UGqrgzCJgLw6kOxjvkAXu0eago8twqXYRBLcTn0CUokng0VFbScMF61OlUEC3vHq/blcfl+OeXJ40TPDVCnNfoGSe3StuoC045/SCCnfHxHxYu4mBlSf7hsIdAOwsAs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH9PR11MB666862.namprd11.prod.outlook.com (2603:10b6:510:3e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:34:30 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 07:34:30 +0000
Message-ID: <55e3f454-bdba-4385-bcf2-be08de32e618@intel.com>
Date: Tue, 17 Nov 2026 13:04:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/cper: Emit software CPER records
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261112134636.1860446-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH9PR11MB666862:EE_
X-MS-Office365-Filtering-Correlation-Id: e790c79a-4faa-4846-c073-08df447d374d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022113327099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ZGt8RaLGeClPle3LjqxaPDTL0eF5bniA5dsDVPHIXGMazw5xoD8NjjicaArgMyYQ3Eg4lhiQkYZBEH4wApJjZEP4pDA7UT6K2FtETM8Sb+CTH3qbp7voSGqh4lpQ5dVmJYwm2W9wclz7w7xtUP4uTxjQf+7EGno8xxtJS65HugkiTyssGlK0wNXRApuXirgZGwz0i+BvwWYAKcMV0QXIJp9lhyDwXGE8W4GCFNBJMjkxYO1wAqMOOj7hPaHNZBQWiEcGr+f4KOT0rHwQXV2RoJq9Z0sn3zNOyMAL/WTVphvRP2u31ARpUvTJ7wTymyJP8M+rBV9KVqm5rrzaTyY4CxVP8NfLowuNfGE0onI4A2cQZS4g01Ch5z3uCfmWzD30vqhWPqPahz0GmP5u3VSMXi0C8XaFw5ZfWqhf/MbILl3yQu6iZBmd3i2E8ZxSREEPLCV+p8TACxTl4DxP5w6gYkSVeIP6jJ1ChxOqIKqxPWhlM1/vAzE5VY/TRLoUqb+rzx/YUgftsrbVcT70wb4NMTqrW2BrtXLrJBOl4rUC7xvBh6Xl+62f9zyti2yrR9mR21vF4XOCpHZa1xCxbA3PQxXoou7dUBW8Ol6FgiAqkih9272IqpyhcnOd3mO0gUTEtqQ6nB7RbUbbenK9VpsHue2jwYn589TYkJUeqzDmNsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGI4T2V5aTJzZ20zNkR2cC9DTUpMcERwbFRYV1MyOFNrTWZhbWFyRVNIUjEz?=
 =?utf-8?B?ajdQV0FhY1R3bzY3MG8wZ2YyVzZuWk9PMnVXN3VQS04vWXZNL0FScmdVaVBR?=
 =?utf-8?B?cXVSUm55TDRTS3V3dkZhMldNaFZSazZ2UzN3ZEk2dnZpcCs4czRvQmJXUTh5?=
 =?utf-8?B?SkJnU283NExrQkFIc2t0UnptUmYyS3M5MmFHSEJPTlhvYSttQWNvQWk3TXk3?=
 =?utf-8?B?TXg5emtLUkoyTkVJSC9rcXpKbUgyNGNEZ0lONjRweENPNjI0SThTLzU4b25C?=
 =?utf-8?B?dWpzZFRYSGVqYUpGNWhHeVpYT056Nk9TZmRrM25RSGowYnZWYUpxVUl3Vlho?=
 =?utf-8?B?TWpxYUwwYTNHcHZoaEwrWmQyTmRJZ20yY01RWm5xa3dYdkx1RjZuakZpV3Br?=
 =?utf-8?B?Z3VDQU5wZ01CNVh0MjFoc20vV2QzUnR1WCtMQ1FoSVdFbTUxbG85UWNNRzc3?=
 =?utf-8?B?dWFydmo4VFkyYzBIU1dzR3pVd2hBVnJxQ3Jxem1LRlRvN1l2Q0lyejZNM0RS?=
 =?utf-8?B?TTMyb2dRYkdCL1llSndwYUJIbkptSWVMZm01aStoelUyeE1vcDUzOURJcERJ?=
 =?utf-8?B?cW93YTl2Z0dkVzNEdVZGRXdCcE9VS2l4WUJxNStybEdncVl6dmdMcjVBNWZJ?=
 =?utf-8?B?YjZ5UHNPRUt2OG1LWVNuL0NOaURYSnpybUFNWUJlTVRiT1NXMVBqZDFYNkJW?=
 =?utf-8?B?NTFRcGV1NUltU3RmalJVY2JkUFkzWmVvb1pieVEyUGY0QW9EeGFuZnRHQVlB?=
 =?utf-8?B?anhFUVo5bU5yVEt0K3FMRjZKaUJVYWY2MHl0NXBKTkdjSWgwQllNRTFPSmM5?=
 =?utf-8?B?RXR1YXBLQkxqbkpSd1VJdU1vQithcHZuQWtZWVBkTzlpZW40SmZ2SUdIbWVL?=
 =?utf-8?B?b1poeExubjFobEhXUDBIQyt4Nm11SzBPVzFtTnJvUjd6RTJDT1dnUFZreHFS?=
 =?utf-8?B?NWczRHRvaVFKWWxmcjNxdTRkS0JhSVVOUjhHTEc0bFNMNytQNFB3UUNVS1g4?=
 =?utf-8?B?SFlrOWdDVDR5U1Vpc3hXaWdXWkZpT054V0FGcFJ1OVV2YkZSbGVZT2Z4TEdk?=
 =?utf-8?B?VWFMQk5iYlJJUDhRQTk0VU0xTFV1bHFkeHBZczNtY3NGemlqZWFuNVpsNWha?=
 =?utf-8?B?Tm81N0s5OFV3ZkhINnAyaHo5ZWFwQ1krTkgzcnhPQTNOL0JTMWdTQm11T3Y4?=
 =?utf-8?B?dlN6QmhaRVNWZlVvWWtmOGY2eU4rbFRMMFdseVdSMXNXMUNVVWptbk1OUndv?=
 =?utf-8?B?VUs4dDJkVjFKaG01eW56eHRHYmdGakpMSEVuSmVNR1pFRnRya3NFUlRCT0d4?=
 =?utf-8?B?ZVdiSGdjbTk2anNIekEvdWpNcENIMEFSOEpibjczREc4cW1SUUx1N0JsN0ly?=
 =?utf-8?B?WFNvakpYd2VyYlNSSWV5c0VzK0xJVHhsOEhTWEJqbW5ra2UvRDRMUjEvK0pn?=
 =?utf-8?B?RytzWThOUXVIdnd3SnNka003aElsUVJRUUtUcVZMam85SGFmK3ppLzhkYklh?=
 =?utf-8?B?UmdFeVBrSHZ4bjJtbXRzdlRJaTJzTDFGWUx6REh5MUlmMWdEWWxDNFkrbTVW?=
 =?utf-8?B?Y3hYUWNoVzRoa3ZXMzI5WWtBWS9vaWJDUDhlU0NPalJuLzdPbFlYSWZTbjhL?=
 =?utf-8?B?OW1HekFTRTZnR3lQVUZDVVNWOFpXcUhsQURiWW1mMkZpT3ZHckR0c3FvWFk0?=
 =?utf-8?B?a3IzcmxEems3MzA4Mlo1MzNremtKa05oa2k1N1d5Z2NzZHg3aDV3UnliVlZo?=
 =?utf-8?B?eERuK0xSMWJiM1RsSGpTeE9KQTNEeHJFS1BIczZMcGgycjRRaUFTTFN1aTBQ?=
 =?utf-8?B?R2lLZWNMRTYrby9nWlpzZ3lxSldlNlEyMGpnWk53MkFzTkFzd0licFVXaFNx?=
 =?utf-8?B?YVFSaDhZVDlOQk5Yb1czSXZ0cnpabEVsdWRnb0gzS0hya2F1a0U2NGlaTGJu?=
 =?utf-8?B?UDhBMGpxYkIxbThjb3JWU3Z5a2p5ZGM3NnlSSzlNd1k2ZUJNYWZSVVN5di9o?=
 =?utf-8?B?Ri9MQ1RzWkhRMDJWSE9NMUZic08vUnRUMTExUGZ6NzRRWVZueHp3QUpDNzFz?=
 =?utf-8?B?cFdhUlE2QmVZQjk3alExM3NqMzl3RmdCUUpBNFcxM21jMDFaZFlZcmxCL1dv?=
 =?utf-8?B?c3VCNHoxRnkwU1hmSW13Um50KytRcks5dzZLc0p1NEhPQmc5ZFM0UUhaM2lk?=
 =?utf-8?B?SThUYjArRHNVYmlsYkh2UjJlN3ZoUUxTSVltWHlKUEZCejZuVWhFWTltVmZ2?=
 =?utf-8?B?NU91eVRYYXpveHVUVnFlNEhhZXdiZjZEYXJjWXh3eDZ3eEdUSGNWVUluU05G?=
 =?utf-8?B?MzJNVmFsNGJsWHI5VDRnV05ramNEQkd5WnJRQjhJcjlrQXhLNmVmdz09?=
X-Exchange-RoutingPolicyChecked: qnTUgp1r/l7tromdwo2R1D5MkNS++f82Lpc0tKp1MaUckT7rqoIOvlUNrhj3EnbTuTI+QFy52QldrD4g+Sv7L7AoS3g43ivG1pm3L/qQp9wQ5AxHcQNl9Irx9W9XQk/mvfDflsGm/tFoT+OE7fPH4wmX0AjwYj/qkqQezTh9KXqTlGS+qqHUC+gyl5PwFJsgkd1Go5ZKyE+3WwndlPhbph1c8jImw3Sh2JtgZTk2vP3vuGnbia/QUx5QqZejzk1bMuZPGtUcOMf1wBmj12JmxKxhuLsGHt2MAxae86Cw4pAFDX2OKYuB9p1dg6L0epCB5wk2+n3YMkgJBa+OXkXdrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e790c79a-4faa-4846-c073-08df447d374d
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:34:30.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4r4Xq/xSHOiQXqU7jKgLEGLs0BY0vp5Z8hNeIIoDDIdhA5q3mndrgQXIXtIsjO2WoatFtzAMe820yi2IYntkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB666862
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 12-11-2026 19:16, Mallesh Koujalagi wrote:
> Emit CPER records for software SIGIDs and attach the
> formatted log message as record data.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v4:
> - Emit complete message. (Badal/Aravind)
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 9 +++++++++
>   drivers/gpu/drm/xe/xe_cper_types.h | 4 ++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index b23f8bc9f993..5a776aa571d0 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -258,7 +258,12 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	union xe_cper_error_class error_class = {};
>   	struct xe_cper_intel_hdr ihdr = {};
>   	struct xe_cper_driver_error_class *driver = &error_class.driver;
> +	char *msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
move initialization closer to its use.
>   	u64 timestamp = ktime_get_real_ns();
> +	size_t msg_len;
> +
> +	if (!msg)
> +		return;
This silently drops CPER record if allocation fails, xe_warn here?
>   
>   	driver->error_type = cper_sev;
>   	driver->error_component = component;
> @@ -266,7 +271,11 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	if (IS_ERR(data))
>   		driver->cause = -PTR_ERR(data);
>   
> +	msg_len = strlen(msg) + 1;
> +
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);

if message allocation fails it is make sense to emit CPER record just 
with header?

Thanks,
Badal

> +	kfree(msg);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 8e90a3220919..0178a5521212 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -40,6 +40,10 @@
>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>   
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
>   /* Section Types */
>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
