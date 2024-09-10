Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1785ECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 08:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772CE10E74C;
	Tue, 10 Sep 2024 08:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvTtyyMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A870710E744
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725955797; x=1757491797;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QWUj3vFucyO/XAXl6yTuR8zRS9QQC14G/S0QedQWnqQ=;
 b=JvTtyyMXAmYHuhnP5fx5vHHS/kAe7IOI/VfJQ0B/Yb4NvEL3ZmtdxmZe
 seIU/UgtnGmw1IRFZnph00vx84hoPQ+uJ0OeZATbnoE9pzGAeXzc7pAKj
 3ol6MgOZene/QFh34qqF94qR4KHulEVsHeGy8aklQM+lcNJCorzTSBoXo
 xINOuaxUlKkD5I21sqrqrF0hgccZFqOTkytLI6o1U36T99zZ50E5cdeBW
 OXgAOYMkJqIdpAi8oZSCaPrwwTtXD8KYmeKVKBK/WW/J0N6N062Zynv2I
 uZySNoErXRJmp+OH50Y/YxMOAyb2mBA3pcXH9lnoKjaY4FdMxBJ8W5XI2 w==;
X-CSE-ConnectionGUID: KfMhwBDoTaGNvlykX5M5EQ==
X-CSE-MsgGUID: M9V1XFO5QhmgZ1CKSuPzTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35260177"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="35260177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:09:53 -0700
X-CSE-ConnectionGUID: 2O+TWRWBSwaqIlgfkwmaBw==
X-CSE-MsgGUID: Ur7rNJedQWmGdjSOVCCSjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67240108"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 01:09:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 01:09:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 01:09:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 01:09:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 01:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xREd4u+Q6rCw2l4lVt/CJAZHN7uLci91YbXmWrK8DI1aizjzeSyjQzYTzjs/+Q+2qOUb+77rT/H4QevJ3Gbo2xxCLn8Kx4pu3W488oXM6hc3lYKBkx/eEB8nvZYQ9kgn33UVMq+qPpyRcxPFE95yJAfoIvOFCB4oMxFfIdbzmkT/1TLOgBmwu/kjPsyCVIMJmbM27crK6/QTo3BBasxMebIb6k+SJTr14nrhANfdAYLG9x7ANaQ552d+wWMuqbcsQTgypr6DS9xxRhP6LUDZT0coTjgPjGC4fW/+YOLcaVNHkGmsMZX4HhCCFjD096FYf0li3iwCC5rzin1GL5mNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSJ8V1hXEOMBqBHhfAlPq5nnPaOMiM1qU8q+c8QA2S4=;
 b=DJsnhFagJMDJlo4I/+j6gcLADfghmBtMzif7BVTha7X54OO7OIr+m6NzZvpbUlvwZ5HIhfeifDft1/MaAf8BOk2ZGI1xo0Ierj5NVa1d02Uw01EGLc16N/b+W7b/swgpGJRvcU7wv4rfpwl1RYnSszLTfKEWRGogOMCJjP4thbDZbpvs/GJQZUBuXZYKWLWiNsriwUvQtoNhnQJuC0LL7/mdxcZOd4IpTT1xBpVFsCWVYiQ1d6uBATofjw5yDJCNGoOExbIign+5qoZuE1Pf4Lm23+AVHmJhoY3k8zrNhgNQww5s28gMkdeWhdtu/g57GhDWfgOSxZaJqwZ/2Hh45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Tue, 10 Sep
 2024 08:09:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 08:09:48 +0000
Message-ID: <adc25f0b-c960-4e9f-927e-4ae8c786f9a0@intel.com>
Date: Tue, 10 Sep 2024 13:39:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Flush all page faults when closing a VM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240909223225.665761-1-matthew.brost@intel.com>
 <20240909223225.665761-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240909223225.665761-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 11112abd-a713-4090-c318-08dcd16ff046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1g4aVNLamhXMTR2SkRIbG1sZFl2VTkzbEZqeUFGUFNzOFdUeUxQbWNxSlBX?=
 =?utf-8?B?MUFJNkhCZHk2TXJMS3ZydGxjZ3FFT2tlQVd0QjU0RkFZMUJjWis4S3paMUxU?=
 =?utf-8?B?eEl0SDRrOWYyY2tOZS9OQ2VJYnlVK3RwbFhrVlJURFRnWVlWckd2NW0zTFB6?=
 =?utf-8?B?Yy9UV3JsYmlwcVdlaUhGcE5UaGZoQyt0V01JeGN5UGpDbC9mM3NkWDNMYzEr?=
 =?utf-8?B?NkxlNmpFei95b05sd0w4NXlSQkdHMVdhZ2pjUTJwdVIrTWJWcGY5NjZaWHp3?=
 =?utf-8?B?eEJqcy9PZFE5K2k0elpQdzBFQytwaFNTZmdrVDdaQXp4a3A1VmdLMVRId01T?=
 =?utf-8?B?ODVUNzVPejk0bkRER21WNEk3elQyZXB2b0dJWEY3Z1pFN21LUDliT3FrRGtB?=
 =?utf-8?B?ZGx3ZHJ2c1V3a3NsNGpiZkMxYVNWVld6R0VrZ3NGb1JzSWRPc3QybWoyQUZk?=
 =?utf-8?B?dHZDSVFnUk5GYnk0Wkl3L3pSZnc4TW1rYkMzRDBGOWFpQUowN0VleDVQOW1K?=
 =?utf-8?B?QmpxWGczQlltZjQ3elI3MStlTy9nSys2ck5uV3VFUHE0YXBLak82dGpBNXJu?=
 =?utf-8?B?cmFZM0FOMy9uTXlMRXFhcUNLRHI3QS9pcE81Z1NwZmVJU1I4N2VIcEM5OVRl?=
 =?utf-8?B?RjBac1Z6SEsvZlV1ZEpjL0xiSnB5d1ZKcERXTjNxTFROSXoxc2Z6WWg1ZXZB?=
 =?utf-8?B?MExuV1YwYkRxeUNoTGRqV0VlVGdxa0Q3MmozK0NIWWIxQ04wQ0V5Y3QxVXlq?=
 =?utf-8?B?VHdacnArYmltRzVadUVHdjZRTHU1K1NodU9UL3ZCamtjSHhlQ013Q280SXBZ?=
 =?utf-8?B?Y3JuMWoxZmd1MDMrOFdCVlplK2tvN3Z1SlprNjVFNW9ITFoybjRQcENVd0RL?=
 =?utf-8?B?VElFVVFaMXdJbWdzWDZ5L1NjUjVJZHU0cUs0ejgyTDZtYWhBclVzUkh4dGJk?=
 =?utf-8?B?VjBFLzBQZk96Vlo0T0xKQWpJcTU3ZElpenpXSko2TjNmZGdkNU9veldRNDUz?=
 =?utf-8?B?YTJ3WmV0UXBPMWFtVTJnTEJtSlBVWXMrVldvamdPVlJpQW1WTndsOW5WWHFa?=
 =?utf-8?B?YU5oS3I3V2dROFN0Y0hEeC9vR0xrU1JmNUpFck9oRGRXRW9QdUwxOEI4d0JV?=
 =?utf-8?B?U2JuMnJoSXljU2pzalQzUm51NkZ2cnpLY1hZZldXOWFvWGlkd2RqRE56VUgw?=
 =?utf-8?B?VUpDSVFkdE8rM3g4bHZJc3hrQVZGbGUyVXFKa2lTQ1ZEd25ObG40aTV2ZTFZ?=
 =?utf-8?B?WDJtVjFnaUh5eUU0MithU09RQ2JoQUNFRzRPL0RhWkhVYWlHSit6dGplSW1v?=
 =?utf-8?B?Q2pZVVFhU1ZGbCtYUkNzQ3F5bWMzVTZVT3dlZDVaUnpZeDd4WCtsT1BLZU9S?=
 =?utf-8?B?U2JxVE1ZR29MSzZ2cFZ1aHR3dnJya3BMRGJzZVg0MkNLSG8vMzQzbmNldVJ0?=
 =?utf-8?B?L1FRSDk4T0h1bi9qc2F4MlZBZm5oU3ZWU3o5cWZiRmo5TmdIWHJCTEx5ZSs3?=
 =?utf-8?B?bnQwMVRaQnFpYWR5bktXSXdGdzNBSjJCdlNtUUVTSG9CdVM5Y09oY3l5UFFu?=
 =?utf-8?B?M3l1YzhMMk94TUtZMXhoTmtBcTZiWllGTFBKUkMwYWhoMkp3Qm9FY0krVzNX?=
 =?utf-8?B?VDRtWEwxTUpNN2hiMTNGTzBlWHhCdTN0ZXpoQUs3SVZLbWxGUjl3clFYbHZD?=
 =?utf-8?B?OWJEMVRaWXBFd1U4V0NJMFBGbWQ0WEx2d2x0aUZBbHVwQmFBYi9BTHhnL3Jo?=
 =?utf-8?B?QXIxdVFEMkZ1OVdCaVlHdEdDUCtYa0wvZjZIYmdZSk81K2p5cG9IN0x1eFpH?=
 =?utf-8?B?OUppc2VSZHlRMUhTK05VQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGxUaU5KdXR1MlNLWU0yZXg5YzgrTVFOTFVaYzJpQlhuT3pJSmliQWVWV05R?=
 =?utf-8?B?Z2VsSEFJQXl2UjdybTY5SDczLys0UDE1WmFSUGZSNExlcU44WGJnS0FtU2Jy?=
 =?utf-8?B?YjJEdnQzRE4yc2dxaWovT3I2Ynl1aXlCczZIQWdkZTFNZ1lhVHVPTVNDc3ZL?=
 =?utf-8?B?THZDZEV5RFBOYnNqYmpobUpUZFlKRVYrL2Uzc0xOWXZ3RWRGYmNYVkRtRGww?=
 =?utf-8?B?V3FuNGZwN3FBRkE2akdHcm1UL1k2REYyMGgvVVNDRmN2NUdwQ3RhTmU2My9a?=
 =?utf-8?B?eGFWUWx4UWdpTnlwUTU0MWNGUHAwbWM4V2FNbTZNU1VhTHBxbnlJOFJjYU5n?=
 =?utf-8?B?ZEFLWkQ2UjNmSkx6ZDNsZjcvSHhrcnVpS25BUkFxYW9CZTNYREo4RVg1NjhM?=
 =?utf-8?B?VUFRNTJXdnhrT29yNXp2OWdBMnFMZFJGeHNuOEtnRjRYdzZsV3FMeEttNmhn?=
 =?utf-8?B?QTZ3WlFDeXd0TytNRTQ0VDBNRzNkR1A0bldybytmK0xnS0Q5cC9GZzdzOTY0?=
 =?utf-8?B?RUdaSmozak5nWk5TVWErTWQvaU9RK2ZKSVB1WTV4S0s3Y3JiV0xTMkI1QWh3?=
 =?utf-8?B?WjMzSkcrZ205NjJJbTlQbUd3a25uMmVaVElQdnNMMVhyQWpuQ2RkbzN4SG9Y?=
 =?utf-8?B?TTJWbzJxa0lVL1gxaXpSekQyV2F5T25BQjVtY1VPSWozZlE4Y0wyTFFIcW1B?=
 =?utf-8?B?ZjhwRDNBdlFmK2VBM21kZVVWeFkwamwyQjVYYW45by93aWVsZXdsTkprbEN0?=
 =?utf-8?B?QUpsRHZuTFY0QVRKU3NoTjRMWVRtV1Vuajc4MHZFWHB0WHZaMU5sanZHanJG?=
 =?utf-8?B?U0JteTZybHE2Q3piVVA0eGFFeGxLekVlbHRmWGIzUXRHSDdqWGhtcGZsTnlx?=
 =?utf-8?B?blBGejA3c0dEWGxSRExaWGRpeHUyczhvWG5IVjR4MXh0SW5EV0Z0b1hHbnZ6?=
 =?utf-8?B?S21mK0NabWpQZkpyMUlaRUZpSUhyMmRycWpucDZnd3hjQlFUbWxtRXpBU0VM?=
 =?utf-8?B?Y0NhNE03UUd2TjZXVCszQ2dhS0FKNk9xVEphWnllQUZOTk0wUTBlK29KOGtV?=
 =?utf-8?B?Q3FUV2xNUU1tOGJ4WExYSjd1dEg5Q1dxblFPVngzSC9KK1pHUVQ5cCtrcmZZ?=
 =?utf-8?B?N1RSNVUyOUpvU3VWWnFiVE5IWjlSOThwdk42UlBQRFM5VE9qYnk5Y1pwM3Zw?=
 =?utf-8?B?ditWLzJRRVlpREUvS2lHditOczZZOVp6U25wOFVMdHc5T3JMT3dLK3I4MmRN?=
 =?utf-8?B?SkUwOHRMdTRjZVF1VlJ0ZDZQbzY4M3BxUUhodE1pbG4xRjhFWjA1SXlBR0g5?=
 =?utf-8?B?cnlYakMwajFsM2duVnpZelV5L2NwekRSVCtSMEIyWWNQckRpcWRvWUxQYlBX?=
 =?utf-8?B?ZmNKb2ZxaHpRNUVMUkNiaDlWNEoxRFNrTC8vc29sUDhXUEsvSWs2RDgyT2tm?=
 =?utf-8?B?L1JJY2wvcHo4NGplbUc5R0hINVpaUW54RDZjZ2M1YnFlR2VHWUhVcS9CRCtn?=
 =?utf-8?B?Z2JJNWlxd040SSt1ekxDSjFlbVdYSzNJUG10NXhxU1dQMWF4bHFlV2JCTGE0?=
 =?utf-8?B?VEFkbXU3WU5YN3lHNnIyazI2U1p3ak9wcm5UZkhxTGcwUHdDQVR4QnBhK0cv?=
 =?utf-8?B?QThDbWJtRk9JL1VSR0IzbTMrMldwZmpTd25peWtKZGtaVFZKZ2lMdTFUQ0Zl?=
 =?utf-8?B?SWtaTExSbTYwY25USkRHM0pPbVhnZVhocGFNLzZxcHliUXFFc1JDTW1SZHF4?=
 =?utf-8?B?dEVuL0toWVVCcU4wZ1k1VHRZM3VxZGZqczJkdTlpME9EZ3NYOHNEdHYrQlI4?=
 =?utf-8?B?bzdhc0JFYlZxZTNtSzVrb1ZzZitYZ2dqNmM2REJuTWZBMm9Kb2I0QXhmVEE5?=
 =?utf-8?B?c24rcW1acC9jTmdyQUY0RWUxTkJQOWdSdzFoVXFkWEh3cTdZVzZNcERNOU1R?=
 =?utf-8?B?aHY2SHVsVGlKZnVFbFh2T1ZUN084eWFJb3F5bWs2QllRS2RRbGJpQWw0aU1T?=
 =?utf-8?B?S2ZVZHE2dVMrS3U5bmwyb3dXVGdDUnhxMVRrR1VieWYyN2ZWZTI4ZW1jWmpt?=
 =?utf-8?B?U01FNkFMc2tPb1hMN2tLMDloVzBpVDZpV2pKUHlvTHJRcEp0bWRxUktJQlBV?=
 =?utf-8?B?Z1FDV0NoVytoYmV2akxRY2pwc2NGMDNiSEYxa1locnk2cHowelY1MVdBbkRF?=
 =?utf-8?Q?Vi3iWzlEZiqPjdYLy2i1MlM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11112abd-a713-4090-c318-08dcd16ff046
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:09:48.5171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mKGDGItuSDRla7J43+8cdXaK1RaMjwfqRYMWaNEILW+8oMxbUIpLUJDx8YbypUwxvdsIsQ/Iq1IvYFCeRUgtE1Gcr/qwkGJvmS/XVcaTKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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



On 10-09-2024 04:02, Matthew Brost wrote:
> Ensure all page faults on VM are done when closing a VM before removing
> page table memory.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_pagefault.h |  2 ++
>   drivers/gpu/drm/xe/xe_vm.c           |  7 +++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 730eec07795e..2dd7065ce54a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -304,6 +304,21 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>   		PF_MSG_LEN_DW;
>   }
>   
> +/**
> + * xe_gt_pagefault_flush() - Flush page faults for a VM
> + * @gt: the GT object
> + * @vm: the VM objecy
> + *
> + * Ensure all page faults per GT and VM pair are done executing.
> + */
> +void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm)
> +{
> +	struct pf_queue *pf_queue = gt->usm.pf_queue +
> +		(vm->usm.asid % NUM_PF_QUEUE);
> +
> +	flush_work(&pf_queue->worker);


wont this mean we will be delaying vm kill till pf worker is executed 
for other vm's using same pf queue ?


> +}
> +
>   int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..9f4166617f04 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -10,8 +10,10 @@
>   
>   struct xe_gt;
>   struct xe_guc;
> +struct xe_vm;
>   
>   int xe_gt_pagefault_init(struct xe_gt *gt);
> +void xe_gt_pagefault_flush(struct xe_gt *gt, struct xe_vm *vm);
>   void xe_gt_pagefault_reset(struct xe_gt *gt);
>   int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7acd5fc9d032..5139a731ae79 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1543,6 +1543,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	xe_vm_close(vm);
>   	if (xe_vm_in_preempt_fence_mode(vm))
>   		flush_work(&vm->preempt.rebind_work);
> +	if (xe_vm_in_fault_mode(vm)) {
> +		struct xe_gt *gt;
> +
> +		/* Stop all async faults */
> +		for_each_gt(gt, xe, id)
> +			xe_gt_pagefault_flush(gt, vm);
> +	}
>   
>   	down_write(&vm->lock);
>   	for_each_tile(tile, xe, id) {
