Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E095CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 13:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F59510E3F7;
	Mon, 15 Jun 2026 13:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHI6BUK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E552B10E3F7
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781528496; x=1813064496;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SzTZE3xDKJl2is/IJAhc8dQZONE+MlRuXIuisna8WcY=;
 b=AHI6BUK/Z7pEP6XfDBEmVK/aso59wr7OcTSa3oMSGNsqlPMrvH19Xm3k
 0fp9bjtHBv4aFOt3xdfad+z62eFxWJHKlxs+AkBL0IQGDyNKiNwQUu2f4
 R8OEFpK4nzDXyrtU29WsTysKd42eoHx2BBIZ3mQ7U3hsMUpI64k2zQ9jV
 vavMuVBj8wgN83hemPEDVEQzIrDPf/A2mgyzfvFCJ9M4GrhWz7ILKiEN8
 c2uI15NxzzyvVrv/F9MZhsLURgQZPTXc+ppadkZAfmrn3myAGNnMwy1gb
 Y8c68zp1JFlxI4YvsGikER+tKFnUvO1EUqfqZQZHmQnlmQtLMsKMn+ExT Q==;
X-CSE-ConnectionGUID: 6t3JEONEQi+cmUpdLOwQ/A==
X-CSE-MsgGUID: GYO5inzcQem3J+ST0dfnQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81404800"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81404800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 06:01:36 -0700
X-CSE-ConnectionGUID: ALMFPjBWS0yIikNKoqJP3g==
X-CSE-MsgGUID: 1Dw6PCl0RY25SmjCG3Qn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252417255"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 06:01:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 06:01:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 06:01:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 06:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxtq7PaJW7cdtP7BXVNU0/i2e4PLuS3rm4GSKp3bRTKEKF+nH6t1MZOd7tnK4DxRRYoEbhyNcWMKQaJ0VtWSNoi5U8tyE1H2b0bjcCRI/XKpa7zIuZl6rvMm/LOx0BGWZKuNx2qcwGEvnjRmIja4GVmHlrmHa+BBYTIddORAFsjmJJ5nS/TrUac1QQn4E8CpDFvEuuBemmoc8wQ8/GMnPI74SDHB+DW6+xmHl4+Daa8uz9kdH/BxX9GV3d+hctr1Zf44BeQ9POoZdqig/QV/TeZeScyBakXFdXtDbIFYs0m7kK6EC1Z1S4mIYbRRtncD1cfTZ2uG2bULI40k/nf1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIG17CLP3hEWsVMFayncyUv6VogA+WuuAu00uuR7GDY=;
 b=amekErTRX6ONtFM/dzTQPqfr8N53pV9w8gqqlOALpq/AvY4yXWqMJBK5XxqPnhUvaV8PEJxDbJ55sVeW+2PmFSQ1E8YgafE2q6ldo/OErB2CIMP9tJrjJ526yCBQTSSr171eS8DGYMI0yyQ4NjAvqDkGcsxYLxYM9gy+P050sDSSXoQ/Izt7JUIjHDz5gqgVBJtJM5glSJp7/qXyjBZxIgSNlEeWUmLYIldabV//t+NPZ43gow9gnn9Tozr+Fk3t9wRd59/zhy76iafyp30rdAktNQbMixO2hrPzrLFSLbtItyvya0UxxnLoGHhIQA+SRqM8ETwUwGC+wkkYMcqFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Mon, 15 Jun
 2026 13:01:30 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 13:01:30 +0000
Message-ID: <845f007f-3c59-44d2-8964-0ad53efa1f03@intel.com>
Date: Mon, 15 Jun 2026 18:31:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/xe: Consolidate debugfs fault injection functions.
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260604132623.1000288-2-mallesh.koujalagi@intel.com>
 <39aff126-c1ec-42ac-8b16-6f149eeab163@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <39aff126-c1ec-42ac-8b16-6f149eeab163@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: c187d452-41d4-4fd6-ee12-08decade37a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 1akeb19vELwz4dWxEzZkD5yZbwSm7E7RAl8Q9yOQrj1JrdvAsUz28HF2dKZkeP+EH3rO22wpM63SiU5AlaSsvTl/eVK6iZaMWTlFsMlcA+kUbyEeDQMw1DClmygreTlKQSbU1OSmGDx4wn27a7UlzXl/4G1lNykBhL6QYvcCjD8LBDK8mNe9OKHRDxi9udCih71SRB0uJTrAttxRM10IvyQ5EPfyQKc9U+KtZnKqGHpJchJPTVxyH1CJr5048x2FPIojJHXgpgiIoEZZTydvl9LB0fYKhqymFnktg+LgVJhi3qurJKPKN8ABM/IHyk1xNKy5cHykKLqvhiFqs+Ez6w6lTTxJjr+IslorTUpiiTs+Lm0JsOqAzTyx7T8DI4zNwsVRKkJBr2MyEEP0kb7sdXfvYhMjzW7v+OqAUxZa8LkpcY2AY80JD7zCjzzYqljoKIkZ7oRggRxlgdPvaBLLH6k7PvNECHB3gUevBQs6HtchLp/hiz2HdwitIhzVtmYyeO+lWQCeJqnR0l7FAX5WtWVvQv4PnR5l+ZrcyVPiu85e0rSGFrZa8NKQY6j1qnMxb8jW4zQWTUAJS/p/p4BdN7lUNqh0ukC9ZhjZccKs2mG9Mz/quF1Ackcx/s51ZA8SXzeTb7BN238I7twGdwfgni6XwHl4qoH8pSH0xmhZw0F/rL1aV0RGNgi5Cmgoa4+B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzVDL1dDOXoybEdkSDZTOUxNUVFoV0J0NTRPQjdFY3F2NHNwLzNoSFo1L1d2?=
 =?utf-8?B?MUNDMnNoaFFpN2lkeFU2UEppU3JNM1BNZ3BvSU9jb1dtaEJMZzVnbmNUN3I2?=
 =?utf-8?B?OVFkZi80bFMxQmFKVnM3S2dLREpJeDd1MiswancyK1c1cXFRNFZXcVplMWxG?=
 =?utf-8?B?R09qc1djaWZrMGlCdDZDVkVyanBVQnBrUWh1eFVrY1U5OGlpSXhsblRoNTZV?=
 =?utf-8?B?bHhxQndickpnMm1YNzF1NzNjTnE2clRUd2M1dUVweXNzeGlabkp2UGc4eFEy?=
 =?utf-8?B?TlBLMk5jK28zMEY4WG0yTXNxOVhXZzNLNm5ZY2FySm1xdElRQ3VJVEdvT21Q?=
 =?utf-8?B?d3Y3TUsxcVVHM21mMzZHYmplUVBEWGErajR6ZHVIRGkvTUI1bFl2NG9JRWJo?=
 =?utf-8?B?OUdxZks1RThHb1MwQjV0MCtRQ3pOR0tvTndSQXRlNDVTZmJhUW84Ym1JeVBJ?=
 =?utf-8?B?T3hsRjhhY2hLMjVlaThEN05qTGpHMFpCZHFFREh4eGlDM2R6WmlhWWNOWUcv?=
 =?utf-8?B?bWo0OEwyUThOSGhjcmlBaVJSWk9kU1JwZG54ckl2U1VvemQ0SlJCSmpCUXJw?=
 =?utf-8?B?YmlPNXhYZlFWQjVpK0ZjaTVmd1FnYk43UUVpUDFlSlg5Q0xlSGNrVlU5MS9Y?=
 =?utf-8?B?b3k2TmpSc0IyeGl2d1BMcnlDQkxWZ3YwaVNFS2VGYng0RDlkNjlyVFBnMHN4?=
 =?utf-8?B?b2FJbTBVaEZFeWhOZXZ0dHJRWHRwOW41MHJMSVpOc2IrZjd6YWowNFc4bUZV?=
 =?utf-8?B?NEJCYU51TVpWTGM5bjhHL2RUaWc3d2FzZ0JpZ1g1WnFvdzhxM0pPb2pHS2VI?=
 =?utf-8?B?V204dm9PVzd2a05pS1g4anhIOGJtSGRTTm9lVURBQm1EZUJlWjk2WlRXWjZU?=
 =?utf-8?B?NURJZ2tDQ0xFZ3EyQ29GQUxKLzNYb3BRZWdyMW1KRnQzcXZuditicnZMVmN6?=
 =?utf-8?B?emMweG5WUzFlZkgzeGdzZlVESUNyYmJETXIzeUNQZ1Q5UGRpc3NzWmswSTBU?=
 =?utf-8?B?NWI3TkQveUM0RnJrZDFQRHBkTTY3RFdXZzlMLzJ2dGw4clRYVUpQUnBxN3Rv?=
 =?utf-8?B?dTI2cE1nclJrUVYxc2tZUHd1TXE3MTdNcjJjWnNOTzV5MnBZUVZjc0cwdkxs?=
 =?utf-8?B?WFpYZWJYU1ZnVDFXaHFTRXJsQ3lPVGhXdnRUd0Y3SitIU25kRjRuUkVKM0Zt?=
 =?utf-8?B?SlpzYjVyd2Z6TGtYWUJuaUpSWGpqTFd5TVdWbkFDWCtZMjMySXFWdEZOMkdG?=
 =?utf-8?B?TWNSU2VqOExTeHNoK0Fpc0xPY2tlelZpNENYdzVjZGUzVkhOM0JMUUVDY3ZR?=
 =?utf-8?B?a3Z3ZldwVzN0dVYxcWo2VWlqcHZHUzlnZGlvTkdsOXo2enJwdHFOL2ZpWUhG?=
 =?utf-8?B?cHovTFdETDJFVmRpSWNoMlk0T3E4dHN5bFkvY0ZBTlN3OFpEcjhFalk4M2p0?=
 =?utf-8?B?RG1mSWFRdVR4ZUpNY2VuSzdIWVNVeWpJUGwrUjRUalBjRTdEMWJ3Q3pMeUJm?=
 =?utf-8?B?L001dy9FSmNkdFcvTFk4NjFPQ2VtWmV0MS96OGErbGlTRmw4cU0yQUZRY3ZB?=
 =?utf-8?B?MGEySi9xdEhrNldZdVlObklRRjV2R2xCS0tHcEZLZ00zN09YcFdYMEpIYVkr?=
 =?utf-8?B?OUhsVHRXeElSUFJ4SXkrTGR2UWk4aFZMQ3EwZTlhNTVqUmJ0V0wzaHpUSXBQ?=
 =?utf-8?B?VHRQOVFIRStHRHd1S3NTQXZjeU51d2lhMGU4ZXMvUUYzZTBtc3RlalVsZE92?=
 =?utf-8?B?SUswY1h3MDBtQUwxdFpuRDlndjk5dXRSempYcUVBWmpDTzN3dldQbVEyd1Nu?=
 =?utf-8?B?dStSNnlRV1FRbUcxVVI4WEl2bGNwYjU5SEJrMnlYOWUzRisrRTZIM3hXWlg1?=
 =?utf-8?B?Tk1TbE9uK2lFUlpkek1ZM2FnWmlBbENQdzhRalBidzVwNDNxKzQ3cmV3b3hi?=
 =?utf-8?B?c2lKZWsxS3cvQ0dYZCtZcVJxYjhaTDlDVC9kS0VSclBiYk5KZG5LY3F2YTdJ?=
 =?utf-8?B?T1k2UjhhRTRlcEgrd2tLWFlHMFpWcW9icm1jMnpHZ1NlZGxqcitYbTZPcGpJ?=
 =?utf-8?B?WlZwODg1Qk4vdVFPVHM1eWdOZWo4SHFSUFpDT0VEYmtLajVvNU5BUDNNRkdZ?=
 =?utf-8?B?T1JlWW5LaWJTQkN1OGpMZ3NlL0lLZy9XTG5BYm5MTUNYc3RpcHJvQ0Q0cG52?=
 =?utf-8?B?UXE1VkVjWnVZMWw2VXlNbEJJRUVWT3FMdGJ2N3U0TWo1YmloV0piT21TQXRG?=
 =?utf-8?B?ZFZDZ3dFcW0ybGoyOFViWVlaU1dFZjc1WFRFay9lMUhVSi9nclphbG41NGF6?=
 =?utf-8?B?TG1VQTVyVURXWTFTSlN1c20vWGFDV2xlNVVaTnRnQjA5dk1UUlRESTBCRmVz?=
 =?utf-8?Q?ScugMyR3VeLzwnls=3D?=
X-Exchange-RoutingPolicyChecked: Qq2Cw6mxk6xWuoLfIUWVIwforH10mUC6qBzbl9XLngnC3cxVuXxCR6ItRhwpnCXKgVIIL7YMTHVV4GX+csodLFV8EzgmPGCGdSU8UU2UDtJxGYPEjaBXQH3YrMGVgxVxBH+lxTYEVA3EPrigIPSaJlPnqWggyf+hgE+A1HxFGw+BNO+AdRhKln6Dpg+xkROP847d3Puim3cjoMmR4EqgCEOw4undydO0RcBv1hVv2jrHrO5OXxxwZwDFrQxTEHcAMfYA8MStRfGfdE9JwytTajPzObg74+oHXbCYpDybbKB4da3S9a54XBgRSZqL4nSdFZTvHYyoUTW9/jSl5tKaNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c187d452-41d4-4fd6-ee12-08decade37a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 13:01:30.1739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrmKo7/GvEOtIq4+T/sFQbbEbW6WMz0iIvkRCfjwroogTuIV+1YdkV683dpCf3y3QSxTgx/WENE7ShT1Sw1J8kxUkbQpDWWazGQxv7Pa4W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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


On 08-06-2026 03:11 pm, Tauro, Riana wrote:
>
> On 6/4/2026 6:56 PM, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration, and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> v2:
>> - Add multiple platform support. (Vinay)
>> - Handle VF properly.
>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>    create xe_fault_inject_types.h file including those name.
>>
>> v3:
>> - Solved patch apply issue on tip.
>>
>> v4:
>> - Add proper header file.
>>
>> v5:
>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>> - Change 2025 to 2026.
>>
>> v6:
>> - Change return comments of xe_fault_inject(). (Riana)
>> - Remove full description of xe_fault_inject_debugfs_register().
>>
>> v7:
>> - Move all fault inject helper functions in xe_debugfs.c (Riana)
>> - Update commit message.
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c  | 53 +++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_debugfs.h  | 23 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.c       |  5 +--
>>   drivers/gpu/drm/xe/xe_gt.h       |  8 -----
>>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++-----
>>   5 files changed, 76 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..21eb673b3f27 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -5,6 +5,7 @@
>>     #include "xe_debugfs.h"
>>   +#include <linux/bits.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>> @@ -38,8 +39,52 @@
>>   #include "xe_vm.h"
>>   #endif
>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>
> Instead of using this and having big blocks based on flags in both c 
> and header files.
> Can't we retain
>
> DECLARE_FAULT_ATTR(gt_reset_failure);
> DECLARE_FAULT_ATTR(inject_csc_hw_error);
>
> and assign to .attr.  We have a fallback for this in fault_inject.h?
>
Good point, will update in next revision.
>> +static struct {
>> +    const char *name;
>> +    u32 platforms;
>> +    bool skip_on_vf;
>> +    struct fault_attr attr;
>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>> +                    .platforms = BIT(XE_BATTLEMAGE),
>> +                    .skip_on_vf = true,
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +};
>> +
>> +bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    if (type >= XE_FAULT_MAX)
>> +        return false;
>> +
>> +    return should_fail(&xe_fault_inject_entry[type].attr, 1);
>> +}
>> +
>> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>> +                         struct dentry *root)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>> +            continue;
>> +
>> +        if (xe_fault_inject_entry[i].platforms &&
>> +            !(xe_fault_inject_entry[i].platforms & 
>> BIT(xe->info.platform)))
>> +            continue;
>> +
>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>> +                      &xe_fault_inject_entry[i].attr);
>> +    }
>> +}
>> +#else
>> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>> +                         struct dentry *root)
>> +{
>> +}
>> +#endif
>>     static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>> @@ -563,8 +608,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +653,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h 
>> b/drivers/gpu/drm/xe/xe_debugfs.h
>> index 17f4c2f1b5e4..c3d6c0b47b28 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.h
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
>> @@ -6,8 +6,31 @@
>>   #ifndef _XE_DEBUGFS_H_
>>   #define _XE_DEBUGFS_H_
>>   +#include <linux/types.h>
>> +
>>   struct xe_device;
>>   +/**
>> + * enum xe_fault_type - Fault injection types
>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_type {
>> +    XE_FAULT_GT_RESET,
>> +    XE_FAULT_CSC_HW_ERROR,
>> +    XE_FAULT_MAX
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>> +bool xe_fault_inject(enum xe_fault_type type);
>> +#else
>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    return false;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   void xe_debugfs_register(struct xe_device *xe);
>>   #else
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..eda8df8adf11 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -21,6 +21,7 @@
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_assert.h"
>>   #include "xe_bb.h"
>> +#include "xe_debugfs.h"
>>   #include "xe_device.h"
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>
> It would be better if the enums were abstracted (xe_fault_gt_reset())
> Maybe define macro for each type based on name
>
It make sense using single function to pass enumeration fault type, and 
it's scalable.

Thanks,

-/Mallesh

> Thanks
> Riana
>
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 4150aa594f05..f8e3ca63aabb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5135e8e4093f..c12f1b50e035 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_debugfs.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -167,11 +165,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
