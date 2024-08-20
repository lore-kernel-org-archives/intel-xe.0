Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE62C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985710E46C;
	Tue, 20 Aug 2024 21:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGjuUyNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A710E46C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724187812; x=1755723812;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sb8hAzpAZFPAhb4kE7f6JuqHpDaMayOJjyMJ10kuJdg=;
 b=nGjuUyNmIVh+S76j3qTfcxJ5CnMKWf1aTZTBa8+nW87uCgc5+U0MxRbJ
 jqd6e23I9n55Fz8uwYWo2tZQQNRCxUDvkbtOwiYD38iBFow9XlHHIs4dJ
 FC+pYdVBRMobX/kt/Fp/iEjddinN+PahN/e7hxWIV9IOgzf2C3VC2Js1t
 8oRdkNU1tgF4loKcGbnM/M0AN5KLRIY72PHnirk8YnsqDQ0tSYXzQ7cFa
 FPMr3RnHwPVY1f/aigc4Q+WlJRaCz0+nJXahtrgaq1plvHLtm0qx5be3e
 QG4dk91IF09TpkJCpMoXu0SbbFSNsn9gizZcO+Dn+SJr3sdb8h9mgcF/y g==;
X-CSE-ConnectionGUID: bVe6MkO7TjK+xz/q0NlqdQ==
X-CSE-MsgGUID: 5EMgdrtSQY67UMCFcJJ8jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13118011"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="13118011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:03:31 -0700
X-CSE-ConnectionGUID: r4iXCEqFRICrQvtZnUZI7w==
X-CSE-MsgGUID: XB30F9ewR0ifHQYIPsrEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60714964"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:03:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:03:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:03:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:03:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKX9NLCiUS8V/SmK+iQdgrPb3ZiwW/gQMx5AmkbfPbLv7OroHYudh8dFTJz6sCCopioGyo6ZRbehRHBhZ+EDhv9HDXWE1UYerP5QLrC0VIF69hRv6RVMYeC9yIN72alaUUwoupuMA4q/fYPoaWDDSSnV3/9y/X5WPGR3vSh6+MCkblfsoQpN8tcu8JFyCEP7DQrIpVUZ9De27y9yfKUgDggGFaXWO+KRY/ZXkG7d8qt955mvSixxG6artKZR+fXKJzgEbvyIHqtN9becmnvMZuc6Aam7tufW93cunMyFouYugPRlnExdPBDB5BA0EJGBtDT5auJEWdftv708H4TLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM+nwm7nedgN1Lr9Vm4a37SZqeO/RUmtO+1636PWjU4=;
 b=PMJ0JJDWAfMKpsuIboKwva6DvTvDMmbZjb0jUgIR6jbNdD/IN7AmReQctMZ+5cmg91JOSW9+hKvUJfJLucvcZJ4zZeNb+A9OeY8z37cjUWsWdFft0qnw/Qi3WTdsBfFLt2cQFaOahjzFzNFfXyDTz2aNTs3EyzDCv3XOzLk4kCQNx5tcrvLx/XOp4jviXadVT+bP+jSFShDa5RUmeWi/zSkbJdEyBgJ6ZqORyL9HlMpgqPy/mwTjzporOkWIHfLgp6yrRSxZUlE90BHlF4WcBIBgenkyUnKCtLoke5jflIX4vlhFmI7LPCEIKukInh4G0xyWCYlJt60ZQ8fn2oDJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 21:03:27 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7897.014; Tue, 20 Aug 2024
 21:03:27 +0000
Message-ID: <a14780ad-1930-475c-ba6d-18317d8de643@intel.com>
Date: Tue, 20 Aug 2024 14:03:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Free job before xe_exec_queue_put
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240820202309.1260755-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240820202309.1260755-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MN6PR11MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cf8c97-6e40-4d01-c918-08dcc15b8974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VURwdGR4NGNEa2k2aDNYR2JQeEhjWklVc3lpOHl4dGJobDBzZG01RS9tUGNJ?=
 =?utf-8?B?WERUbHNIOG40ZU1Cc3RxTGZ5UE9VL0lwTUxnaUcveGE0S1lDdUpVTkZuTnRk?=
 =?utf-8?B?VFZ1MHR3T1NUNFlTdmROck5pc0VRRmI2aXpCSE16MDA0WnpRTDFEMExBaTR1?=
 =?utf-8?B?T3YwaE16MlpsNGhSL3pOWDg3THV5R2dTUzh4K3djQ3dCaThBRE5vY2dYL1Vh?=
 =?utf-8?B?eUVudWVLNlpmRDhWTWd0a0x4OE5qNTRRTGZKWkRDVVVadlZCSnBRUVNzQVhs?=
 =?utf-8?B?NUtqakY2dnZIMWp1QnU3bUluSWxPU2F5UmVsME5WZDd4VzhKVnR4ZFlTcVJE?=
 =?utf-8?B?M3ZPY0xGYko1NEpmMmJmSmd1RXJuZmpRU3B3Z1prL25uQVJLUmdCV0NjQ3NC?=
 =?utf-8?B?QXNzYzBaMWdmWFYrcTlhb3FldWVPV0Nuek0yUTlRMU9GMzNrN1pDWEFieDRt?=
 =?utf-8?B?T3JKS2RzakYvOFdtTk5Qdi9VcHRoam16bk1lM3BNRHRBQUwvNEFBREI1KzlJ?=
 =?utf-8?B?eHVSdGcxUEZqK0wzemlFYmJXeDIxWHBsdEhtTnpUODlqdGU0dkY4V3c1SEVu?=
 =?utf-8?B?c0F3dEpsVFRDandIMzM0TjlLaGF3Z2xRWkZWbkFVVTNyTzhab01OdE1adit6?=
 =?utf-8?B?YWVQSzZyaDg0d3V2YUJXdXpuYmk5emFuWS9FNkIwb2FyUFVndUxUcVg4Ui9j?=
 =?utf-8?B?b2JYd3ZZRmZtRy81MFQ1V1NpSHl0N21XMzA0NldmL0Q0MGlLN2FXWWM4MHU1?=
 =?utf-8?B?VU9LOVI1MEEzbFd4bGxlL04zRnpuR3g3YzYvdks0YWxMWkF1Ly9uN05Yd1Bh?=
 =?utf-8?B?bjZORTBZQlFENHJGbG5TTWdmY1Z5bVJuVVZJN3U3RWdEaWl6YUMwUnYrOGlS?=
 =?utf-8?B?RnZOdVNNUlRGVjR3RVc2Z3lmY3RKVS95bXVZRnphWlE5TEVwZ3JDUk9hRmdB?=
 =?utf-8?B?YjdYbElmbnZRdGRmbHJXSzZleUEwR1htN0VjRjU5YnZmTkI1Zy9vQzJCMWhp?=
 =?utf-8?B?eUNZcHBOcFJ2OC9wZUYxNnJzZEk5aWJPWEZqSnJZN0I4ZHJXaWZCUkdkazdo?=
 =?utf-8?B?d3dJeHBWM2NqSTdUY09hUXVlcm5KU1FtUmdmdEtjcmRQcUdBUlFLRDVPWnRW?=
 =?utf-8?B?OUF0eEhDRzVZSkVnaENhMi9jeHR6L2lZREtsY29OKzhGN01GdlZrQ0tKZm9D?=
 =?utf-8?B?SmE5NkJSbXA0VTZCQWpvRDFGdXU3R2FUcitrY0orK0tSaGhUdUdoQWRkbXRj?=
 =?utf-8?B?R0dXQlFXb05qelBuNnNZNzR2TlhxekwrOEc0N0pIT3JiM1FmWlo2a2dZOGNU?=
 =?utf-8?B?OWJnL21hc3hTclNJRXFpNVhpeUU2YnF4eTdUS2tsUzVtZ3ZLVVMzMlBNTHRS?=
 =?utf-8?B?T1NXOEVWU3lXQ0thVkdkTUVHQU9CN0UrMUVpVmR0cUxraFN5cWk1TE8ybkNW?=
 =?utf-8?B?STFUQ3RpUVVRUGxVT0k3VzA5RzRMdmw3dWZTSkxLT2hDVi9ZOUduczJtTzdS?=
 =?utf-8?B?T3ptWEpJTDkxWDkvbGJEb3A3ZEFRNmU2cUhXUC9PZnRVa1V6UHZWaHZMbmU0?=
 =?utf-8?B?aFRTbGhoNXpPMW4xQkNLVXh6Y2hteGw0ZUtndnRLVWFBMitSNG5yTGF1SCt6?=
 =?utf-8?B?YmFKZXRJb2xTVGpodktNYlArbFJhMGR3cFJHQ0lrOERmWWszY1labzE4NWo0?=
 =?utf-8?B?WWZLblI5R1JkdzJPajNKcjBQM3pSUHhWMkF2TGZmTzUvcm1lUVo1LzE1TEZD?=
 =?utf-8?B?UkltbDJBa3Z6cDRCK2VFNW55eGViaWhocWpEYWl1ZGxnU2lNMWIwZzc3L1p4?=
 =?utf-8?B?RW9RUzg0RFM0a0Q1QVlQUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtaRlZmVFhwREFucG5oTDU3ai9OSmZWTGJWS3ExdURUbzZZRDBlenUwN2JR?=
 =?utf-8?B?WHIvekNJSzdLNWpUZFpsdXR5RzJUT282aklLVFgrYkNnMnpvZnJlYnZVOExW?=
 =?utf-8?B?VWdZODlZdkdQNmpFTWNQRXhSQTVGaDNGUWIyeFZNUWNQOUt4ZEhaNlprVjZF?=
 =?utf-8?B?dURydStBQU9SbWxLM2tkZExDMnhBTFdvYmlLTFh4WkpHMUc3Z3dyYkJobkx4?=
 =?utf-8?B?RHlJa1YzUHRZWDFuWmRnNzZ4Nno0VEdJRE8xZTczbVVWRE9zQnVNVVFsa0dS?=
 =?utf-8?B?ZWN5ekNxUnJvYmtxTEY2VVJuUWNqQW9vblFBdTZ0VjZ3enhzSlZUcm1Vc2tP?=
 =?utf-8?B?bVpUMkJ6ZE5vOEJVaGJvVzhrbXBndlJIY3ZhK1NZcG5tMUVhbWh4Ris4T2pC?=
 =?utf-8?B?RGtOWWRrNmRMTWJaL2pxSWw4ZnlIWnFyZHhMMGtuemxLb3o2QWRzU2lqMGRB?=
 =?utf-8?B?RkFIYnhXYURwaFgwLzZ0K3IyZGVsM2xkUWRTamM2aGFUdjVoU2N5dXI1NVIv?=
 =?utf-8?B?OWk2V1V5Ykp4Sy83NWdyaGdkcGE2VEl0SXQ0QmlmK1dPZVgwZ3JKT1ZHOEl0?=
 =?utf-8?B?MGEvZ2xmMFRRRThiUlkxS2dCWGovQVVpSHROTitiSy9qL0VJNmZmZ1NTV1Bh?=
 =?utf-8?B?b1I1d2RxZHl4NlZZU1NiNnRCNFVtRlVOZjlCdGFENEl4cGMzR0xMbnBXdVBJ?=
 =?utf-8?B?NGYxRXZZN0xhMHprUnlVOURvK0pEWWRsa2d2QUNwZk5tRzVIQnM4Vkg1dmtj?=
 =?utf-8?B?YngycjM5NzM3VXIyaFF4RGZWK3l2Mndrcjl6eXFtTHNjcjF4UkVydW5pV0Ru?=
 =?utf-8?B?T0ROR0w1OHRvMzJXMW1lTHgwK013NXQ4R3NmV1pWZUFVSnZOV3hwRUhINnRF?=
 =?utf-8?B?VXZHZXFGK0JRZGNzZCt6UStrQ0w5MXRTZFJWWkU0ZWRnWEZQWjZsQzJBMm9v?=
 =?utf-8?B?eHM4R2ZjZisyV1pPbE81TFBBWDJaUWlqNlNleGJuTDV5SmRmanVrUlQ0OWNF?=
 =?utf-8?B?dWZOYjdsWUV0WkgwNVFZcS9GbFcySkhYcFU2aXVyMTRqaDBvVEg5MndjK3NM?=
 =?utf-8?B?TDdRWTZ5R09ZTGNvaTc1R0IyNDhUWG4zL3Y3a1ZhUGFKWmovVkQ1NmZkaEQ4?=
 =?utf-8?B?VG5HT3JlR2dVcjRCQTBNZ25xZEw5MUJFQ3kvRFY0RHp4eUVVZEJqN3Q2d01E?=
 =?utf-8?B?WnFkRVhyQkxEdVBQL0ZvMTFkdmFCWEREam5BbWpRaUl5cFI4L3VJMm42RGZ2?=
 =?utf-8?B?ZDh0T0VucmZQc1Y5ckprVmMrMFdUTExDK1ZzQ1NYanoyVGZqQVcvQzh0a1Jy?=
 =?utf-8?B?bEVMenplOE9HS1NtMFJGYkRJZGE2MVhWZUZLSmZnZEJrejRFWkxORjNWY3ow?=
 =?utf-8?B?Y1VuWlpORi9Ra3lFRUdMbm1oSkMvZndjWEpPRGN3V1IrOWVSeUNrSG14RmV3?=
 =?utf-8?B?UFI0YUpncGF5Z0t3aHJxeE1BSTJpb0xiL251ZWtyOXJNUnpvdFBBZk14ZDEw?=
 =?utf-8?B?OExxZnFLcE5WUTFHQWJRQUl4SVFTZVlJbzZwRUdmaWJlbHR2cUdlaFZvMGNO?=
 =?utf-8?B?V2liYUhaY3BYUGJGMG9hdnVKbWlQeGVHVFFkdktjZk9CeURkU0ZqTmpOTUJo?=
 =?utf-8?B?eXVqczZzd2RxNUhNT29YQ2ZYUVlNRnJCNmJ5cTRrUCtDK1gvNW5UVHhyaGhL?=
 =?utf-8?B?YWtlbFVuRXlsbDdoRTVSR3dmZDBoazlxMU9zTHp3MHNQVlQ5TVYwRHJTbS9j?=
 =?utf-8?B?UTNoSTFzYVp5R2xMbXJYdnRXQ2EySllNQ05FbUpRMlJqN1pIOTJzd0JxdFAy?=
 =?utf-8?B?cXlnZHNnbktveGE2WTB3aE1XQTlUOEJSbmxZZ3IzU2VDMDQrelgrQlF2Rkht?=
 =?utf-8?B?VDZGMkE2SjgwbXBIVUpQRjh5bEpqMFZjTkt5UVpmeFpKNkxIUXVpOEk5NEl3?=
 =?utf-8?B?NldCaG44M3lseS9pUVVJSitYUUgvWnhCWTE0ek1VNW1lQmk4SnhOTUNVcDZW?=
 =?utf-8?B?TER0bVdyNXJDeTlZZFZPcnFqeU9YaUtzWWpGKzRNNm1XRER5RllMbHJPSTg1?=
 =?utf-8?B?R0VNUDBUQ0Z5VXFFbzhyMGxqdjBQRis5ZGNUV1RDbDZBM1B1cVBWU1BDUHgw?=
 =?utf-8?B?SDgrYU9GUVI4dFlJSlRZdkJNYTJMOGg4dUJsL25BNTVFVVJnQ0dma3JxZzlH?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cf8c97-6e40-4d01-c918-08dcc15b8974
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:03:27.3140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpRm5CXSy8/RlVde3d76bCzSuPlotP2jefu9jUAtzNwL2n4QHP2PN//lZUeCVPFW/I4bDUIR8ZlKIyva6D9LZZCIKvZCCxYSvEexbynYtx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8102
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


On 8/20/2024 1:23 PM, Matthew Brost wrote:
> Free job depends on job->vm being valid, the last xe_exec_queue_put can
> destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..9628f9deb3c0 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -171,12 +171,13 @@ void xe_sched_job_destroy(struct kref *ref)
>   	struct xe_sched_job *job =
>   		container_of(ref, struct xe_sched_job, refcount);
>   	struct xe_device *xe = job_to_xe(job);
> +	struct xe_exec_queue *q = job->q;
>   
>   	xe_sched_job_free_fences(job);
> -	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
>   	job_free(job);
> +	xe_exec_queue_put(q);
>   	xe_pm_runtime_put(xe);
>   }
>   
