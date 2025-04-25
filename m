Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4895BC369D5
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 11:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DD210E0D8;
	Fri, 25 Apr 2025 11:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+xUMCUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5410E0D8
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745580115; x=1777116115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ewb/S1zsEEf8SzL3wz/dq/zDlgFJ4ZNBYBwcPI+wmbg=;
 b=X+xUMCUCKyISU+0zoFhEsvMJN1NvfV2MUyECsRpjv1VLauy9ho9E7j37
 qy0wQdkd9/5hmBw54zmygHsoVYczv3q1I+0fwyCeY5U+TZ41ecDad1fcp
 yUyh4j1iMLUjmDpsutM1tKv2HFm0u38JM3vW3XBzyypUS+bw15FleEhLT
 aNLr47pNWujTl9S2YaCZzHmhAaAQVqffXzM/VCbtpt4AnzfIzL5apAhXc
 wpZ6Vgr0jpFG3jXPbek18nQRHLv3tDdAF7dalfkWSBFlxNPGV35QVrriX
 DXQXdr9LwfsEup38mjytRVUYzcXALHbT8yOwWaWBJYWz9y5euENZBXPNc A==;
X-CSE-ConnectionGUID: ZbklC9evTESTXmJaf2HC2w==
X-CSE-MsgGUID: MA+FArXgQrihcj4wYP9msQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47256679"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47256679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 04:21:54 -0700
X-CSE-ConnectionGUID: FR7qa1WCQfGOdQ0Vqmr/5A==
X-CSE-MsgGUID: K1We4K+iTKGhO/IKoTL7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137696544"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 04:21:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 04:21:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 04:21:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 04:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vij1e4lezB8KGASSGNZ0+5XED5EZ+HLgn3JO4gryG1lYII3yjckvl3iypYll5FtU5/qIWsy6+b2qjp+9KUnIyQ3DsI4O2U/aQBJ8qVtEkGIOkgdvdAODvmPxkZ9hKwttwL5j3RxF/6FqXsBTpJgT9TQK17GdjwNP3zpWJn0U7j/pNMOHXYiIiBFRyYu0o2Nd0P0YE/9+0rvx6RYKQ9ybR2LNfCYYWRoaH28nxs6qKV8+c4ERnsJg+eelciDOX2aYO61mbqWNx2S6OdfwkDEwRzjtxOpffg5bVKV84bft6DuN3Ov42L0RgDjx70ZzQkWHF0jfjUxvzbt85MuTgyVlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DTfchfqHo7gaeAkCauxObHLk6YB1Uf6wZePwH6PEsY=;
 b=frNGykusy49N3FnEvLHJmhxhO/DstocfvNbKrhjCNl6//1Q+9pV8iEvGvZ551ZXnaBvyxUXIv2oJOzjAPa6OaVIm7L3QZ5Q20aTaeeyJ2WoHuVpUGPcCInq8xsSpb5MlfT12/aWVYUuDD72nD09NeMha+6mMfGQXzbjZMzQz9XHu1E7+9+/jDell+QzBWhMxUeFVyPkWF4xj278aiomrq2+xrVQqvAXh0wmq+GhhFfhvr7AmMMTAkqhLjoZJDZd9VOrE1DMMVmRv2UgdyxYDfEKB5zuTQdajxRTW/O56V+TEJT8mIEu3NLjjroeRIXU5AOiyV6ZeMB2jry/k4ZhaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 11:21:19 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Fri, 25 Apr 2025
 11:21:18 +0000
Message-ID: <936f8d77-b4c9-4059-917f-bc5d645e632a@intel.com>
Date: Fri, 25 Apr 2025 16:51:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <ruthuvikas.ravikumar@intel.com>
References: <20250409062836.13609-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250409062836.13609-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: 937c8d85-56d7-434e-768d-08dd83eb4cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUJnd2hRcDBseWl1ODRvTE1iTDA5UllOdHVaaTg3VXhqeWNFZEx6Wi94Z1BC?=
 =?utf-8?B?WEx3dVFZbnAzeEs4Z2xHY1JnVENJQzc1a2ZNQ1NVV1BEWEgyYTFZMkd6OFR0?=
 =?utf-8?B?TFR3c2JzeDZNQXUwR1FDdkcyczFOWVhCU2E1YUlReUZWQTZVVFRMdUZZTlRS?=
 =?utf-8?B?STlhUmV4K2c3dHpxMjNQOXZRY2xjbndFbzJtbGh6WlNtL3BsYW5rMG9ISlBS?=
 =?utf-8?B?c2d2cVNxaGxVQmlGMW4yajZXdllsYWlpZUNCWDA0K3kySzlESGRXVURHTmg3?=
 =?utf-8?B?MzVwckZuam1GSE05L01mRGpHZTZFRTh5dWxiNi96eTFESE5RbXljQk40QVA4?=
 =?utf-8?B?WFFRV2JTRGVIVXAxRXhqY0FOOEQ4MEFkVzg1TmJucGNpMndpVFFpVzR3R2RF?=
 =?utf-8?B?cVV2Z2c4SkwwZ3ErRnlNZDhmNkV1WUJZamthTGtaMkx2Y0hoMnkxZGdXU2Nw?=
 =?utf-8?B?TjNsQ0p0K2xIUkRBZmMxc0dEQ2tNdnAyU0d2aXNNSkFpUFVycTBpZnlIaFU1?=
 =?utf-8?B?eEd5clZFT00yeVFCMHRJMXRMMnoyMUVjUkJKeUtNWXBnUkJaWTI0NlZ2Q3FP?=
 =?utf-8?B?cS9YM2hJc3NPa2QxVHg0UjY3b3ZWYi9aVG5kdThBTmF6NnY2d1VZTzNLOTVN?=
 =?utf-8?B?S2FsY2w1djY1V3JTMUhwek9DTFYyaTBIYTUwNE0zQzhRczN2NkFWcXFRL0xt?=
 =?utf-8?B?V3FTZ3J5M0NwTFpBZkR5RG15SG5VdVRqV1lxZlRuVUZZeGhrZTNOdHlxVWtX?=
 =?utf-8?B?a2NiU0dMaWJjR2JyVHE4RTZ4U0N6c0prUUJ2NHlrN003enhrTWJJNlNyZkVi?=
 =?utf-8?B?RHlLWVpkNVZEVTVXR21Nd2w3SThsL2ZDUWlIdG1wdzI3RFY4ZFZ5dUNrZ2p1?=
 =?utf-8?B?QVJWNm50TFBYM3FudzZOdHViRHlWUVNmQ1V3UTFFb1hsL0RydkJtY1NwZ0RO?=
 =?utf-8?B?MEFBTDBJOHJKOG9sUE54cXc3aFhMeG81ckhpUk95KzNudUwwbEltYUpFSEov?=
 =?utf-8?B?RTZQOTFZNGp6eG9nMWc5ZngwTU9pUHd5SnFJNXJuNXJzK3NyZWlYK09jdUdC?=
 =?utf-8?B?cmp0T3dUdm5mdnFJYWxQeU1ramZmcHI2YXZWQi9nL2NjVG5LakNMZEtQTUVp?=
 =?utf-8?B?TGV2REo0SlR0QVl5TTFuTVJJZFNzMC9ORzN2Q2k1SUttOTF5ZjByK3VJckNn?=
 =?utf-8?B?ZmQ3Qlo1S3FoNWJONXVPMzR5anNCNFdqWFF3dVRiZ2ZHOHFwaUpYK3pXb21h?=
 =?utf-8?B?OEVwRXg4R3pRUmpUZUZCLzF3ZXBLM3dNWFIvNGJmTmNrQm8xK0FkZ296Uncv?=
 =?utf-8?B?cDYzYml3d1EwbXBOL2ZCaHVTTExjNUZBT0RjTmpreVArZXV5UXBVT3o5M1B0?=
 =?utf-8?B?aDRDdEJTSVFVQ1hyeGZxa3pwc3BEbTUwUGVzV1hNUVZrL0lFVTN2QlN6eTl0?=
 =?utf-8?B?dElDYTJOc2U3MUZMalJkcnB3VlJ2K1NVS2UyUWJFeThDUWpIaU92SHpOamZq?=
 =?utf-8?B?b0c2SzIyNFdCZVQxT3drNUl3Mi9TNW5xV1grKzgwa3BuL0piZHVUUnJzcU1h?=
 =?utf-8?B?MkpPR0NRWnRBM3VPZjZaM0krc0VZbmFQbXFBNldMT0ROVnlyRWxUcTNrYldy?=
 =?utf-8?B?SURQWC9Vc3kyS0hSVVJXdTBaQ0xSTTRjY2lrK3NVZTRERGhZMjh1YzdHNEZP?=
 =?utf-8?B?czVoYi9WTGJ3SlRDeGpsYldHVTkvYit4ZGYzV0c5YVJaNTJJSlE0OFV6elEy?=
 =?utf-8?B?cDljVEFxVldRdXhQdGdrOXR2bU80ejVLM3dFaVZEb0k5MXdERXhzN283WVgx?=
 =?utf-8?Q?cFfDCkCGzl3vlfin7sFzHVwYBLBjExeGPW+4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZlT3J6RlFKMEtxSE9KdWE0Tk5CbkpBTTlad09xbXc0RjlhY3hUekFRRkR2?=
 =?utf-8?B?aG0zdWhyTjBHSmdtNjE5YzAwa3ppank4TmRiWXlQZWpoS1o4YkVxT0RsK1Q4?=
 =?utf-8?B?ZVZHWUJuQk5UWFpnRWkyZTZwNTd5Wjk0VVZsdDU3MU5HamFaY0NmVGRocWhh?=
 =?utf-8?B?aEV5amJZNitTWitsNHRZVWdsWWFFeXpuTnlsV0lFYTdvYWdvMUgraUI1SFY2?=
 =?utf-8?B?UlF2NzRzK3JiNkxhRU1nQWl1bHhaYVFjcHpyNWorWXNGTUlEdEVoQzVLVTMy?=
 =?utf-8?B?cXJXMGRxVS9nTHdZUEFhdEN5NzNTWjZmMmhXejc0VnF4TU90QzAxOVNtcVhp?=
 =?utf-8?B?T1M0SXhCanRRTjZxWGpwL3VaL3czRzFpZ0dxZ0c2blBkSnBhVURHUVVYOWIv?=
 =?utf-8?B?SGJhamQydWRZYlYxRm45MFowZ0tPNVBvUDM2RTErZ2N2QVJaalBnbm0vOXU4?=
 =?utf-8?B?aGJ0VDR5RkZlN2ZMVUZJS0NVc20vYlBseUFVQU5iM0ZsQnJyYUU5VUtYR0VL?=
 =?utf-8?B?ZW5XTmEvMTdNMnBYLzlpdm5rVWREUVdBYTVlQWhHNnl5d0JJaG5JNGgyMVRL?=
 =?utf-8?B?UEJoNndNRDZFVUwwaCtNeTBJNHp0VHd5UXowaHkySERYVDJEeFJjazhqQUMw?=
 =?utf-8?B?MWZ2bmwwM0p0ellFU1o2T0MrNCswdVNmVlF4OGp0Wm1Vdzl6SmhwRG1kV1Jm?=
 =?utf-8?B?UHZVZ0xTdEJoSkZwTGJ2azNLNGNhREFFb1lvTGdwbVp5VzFTa2F6WUdVbHpa?=
 =?utf-8?B?SmNTb3lGVi9lL3c5bzZ0NlJFMVRvdkxjVHFNSjBqcFNraGxRelI2cnErK0hr?=
 =?utf-8?B?eDBtTTBMeDNzbXZERnZ1UCtUUE82VWJBWEtHaHgwTk4zVVJ0Wm5KcUdzSFEv?=
 =?utf-8?B?amlVTmFFNkZnT2dLQzFLK2lWOE9tVm5idkZFZTlSN29wcUJrTUl6RVkrc0VE?=
 =?utf-8?B?TXJpU01iZmJyLzFLWU1VSFUvdjcwNGl2K1h5b1BxSVRDbDVsc3VMRjQrVnBY?=
 =?utf-8?B?NXpHa0NqeDVtSjYvTU83NU9lSDlIbXFDclRPWHVNQWRHd0V4MXkzbVpwNXM0?=
 =?utf-8?B?cGViMmc2MnlIRGtYY1VzT0dDSnU3SWZQWHNUa2RoZCtHOEZOYmZHTjlQVnhz?=
 =?utf-8?B?cEU5REREZjFPaDRhakExMVIwNCtBaERRWE50dVBlRThUMkU0V3V2OFp0RE5R?=
 =?utf-8?B?K2ZycjJtTU1aK3dXaEl1YjFORWgrVXVUUi9oUTd2QVpGWGhyWGRweW0wVlBy?=
 =?utf-8?B?Y2h0Tm5zWGdUcnkwWjE2V05IN3pqei9MYm5tTUxrTDFNeVc2UjZkL2pyRUVu?=
 =?utf-8?B?N2VML0E5Mk5HdjZoeG03MkhMWVV2Q2lYcWQ0RitRWllJTEw5UGUrYndIN3Jr?=
 =?utf-8?B?K0RNVEhreWhrRG90U2FTSmVBVWpZcUt4VWg3WGdWWFNmZTNYQWlBd1RCM2FK?=
 =?utf-8?B?Zlg0bzM4Sms5S3dsS3o5Y1BYNHBDSFBMY2VuL0R0VUZBTzJPakJ2bmd0Y3lo?=
 =?utf-8?B?T1FyWEJTZHA1OGI5bVRrSFRUREZuUDFkVXhob2x1NEUyUGtjZFdoMmdDYXE3?=
 =?utf-8?B?bGZQYmpDZDVlNEdJMGRFK2ljU3g4c1J5MGQ5OFpFTHMwTFc4NndCL0RTU2xU?=
 =?utf-8?B?UjV5V2FvS24yM1psbDNnQzRsaUZrUE5CUWZyTHZlZHA5V3liRnpvZnV0eWZh?=
 =?utf-8?B?TFNqT0dTRm54Z0hvSVRvd2N6Ny96VUxLTld2RnJIbGEzL0JySzhuMVVHUFk2?=
 =?utf-8?B?SkNQbDB6TmViUkRsOXkwOXN6UEFLL1o4ekd4cUxoTGdrU1E5YnhFdXp3Y0M0?=
 =?utf-8?B?TjhCcldFZnI4Ti8wS1NLSzg5NWcrTHFMblBFTGhFNGtXK2t0cmZ2RnBrZjg3?=
 =?utf-8?B?bUYyNHVYRlZmbnFjZ0pRZTZGZVVOVGxlWEFVbS9idFltRE1pVTUyUG1meWk3?=
 =?utf-8?B?R0dkdFppUzFQRHAzTVJza2ZFWHZrMHpTbG9kN0IwcjBNSTJhdUkxcVB5VHJx?=
 =?utf-8?B?a2lZV3gzV1NXLzZMQldFN0VOZ3BoT21ZbTAyU1lUcUZhWEZsMmo0ZXp0bmFE?=
 =?utf-8?B?MUdGaDNURm5oalRwalBGWi9VK1pMSlJoeHZsZy90emRHVWlVREVOK0NIMWpC?=
 =?utf-8?B?c1A4dFAvVHJCTk1XaEZ6eVJScVZ1eHZjUnFTV1hnM01SMi82U0JsRkhPNTRQ?=
 =?utf-8?Q?fXH/ZNoeUEFK8duOIXFDDrQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 937c8d85-56d7-434e-768d-08dd83eb4cd0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:21:18.8778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGxJnun1xncMvUuVHCc67Fu1pOo1VVnY7suzk6r72R/YgSVkFvdptlJ/OW+dOQpWnfqKfjglgwMJZSvAwwqcXY9+aQuA2/wlzJEJ2uTLouY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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



On 09-04-2025 11:58, Tejas Upadhyay wrote:
> LNCF registers report wrong values when XE_FORCEWAKE_GT
> only is held. Holding XE_FORCEWAKE_ALL ensures correct
> operations on LNCF regs.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999
> Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index ef1e5256c56a..cce7ebf5df72 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -46,7 +46,7 @@ static void read_l3cc_table(struct xe_gt *gt,
>   	unsigned int fw_ref, i;
>   	u32 reg_val;
>   
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");


For XE_FORCEWAKE_ALL fw_ref !=0 doesn't signify all domains are 
force_waked succesfully. please use xe_force_wake_ref_has_domain(fw_ref, 
XE_FORCEWAKE_ALL)

/Himal


>   
>   	for (i = 0; i < info->num_mocs_regs; i++) {

