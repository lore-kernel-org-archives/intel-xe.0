Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534C4CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429410EB6E;
	Fri, 10 Oct 2025 08:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzdHrXVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AFB10EB6E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760085725; x=1791621725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vk9yFSQbmQS3rOsdKUpIhWh0qrm8ptgxXo2vJaKewh4=;
 b=FzdHrXVjH8NV0YOdG226NsEoaNA3avFt9jTHVJVurPMnWc9Ajs8HCk7o
 tFa90H6QdZD2pFaRzSaN3PGtDySOLiwn+sPgyFHQ9Cv5DNybUXtrrEmmh
 zldENKdJSUm0NeF6aCm1ECcYJEg70juyRMACgEdPZzQImL0Bqfj20fkbM
 uCCKNP3LWL8bE9Iq9tUL43vP5yiDBRoKErAXY8/98K4WJ7tqnKhIhr8Xl
 BqmkE2dfiADj7TRclxzmF+Q1/5bXj1jyoigmy8hkQ/3vZ7GtoSzEfWAo7
 imddfmKpZuWy2gbTCmLzg6ET4H2mkEjhBmOeoog9KAHtxRsL1xUtEMZ/7 w==;
X-CSE-ConnectionGUID: JdUBvyBoRQuINgDMCbWu4w==
X-CSE-MsgGUID: qVeKeyqHQKCgAFgQDej8ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62186835"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62186835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:42:04 -0700
X-CSE-ConnectionGUID: CWucbw7fRDW96F4WaoCzbQ==
X-CSE-MsgGUID: DxOG5s3TRpqLCNu0IE8+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="186048610"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:42:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:42:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 01:42:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypmin30e4JUVxZ2SXKAy0w9+hd/wMDeB39VP3nx+g1WY6Lbqyx4ar3m4lsPN4hrflqscVVBlnGtzdNoN++h2T02M0ph1ldA86e0/yL39C+mBJcEirYnRt62RrFTm5Bz8zS5ltjvU4epI8U/3IwrtjgWNijTO5SJPlU5EcVFVBJ2XKrbQQivCaYfALCGWddBu/BP7EoPmCcsnL9wG7O8ChISwMPzK+4Hu7Swx3nUoUNi6z+owGkEkPG24WMHvznL17P3KAoi2zasdm2KFYfmTWKHiopWPC3T4JAkqkoG9t4lJxIckS0+6Pr4b+EXy1V1YbERa7FSyC/LPCytQmyHyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc0v1oIrxz2rQw+ndkluxTMhew9cuSY3Sn6dM5ir4ME=;
 b=Gp4qDFBmNC/e1/8xqu0jsPJd35CwoLNN9FqopelL6QqSmbdKYhxEiG2iUlys/xc4JpgT5iJL3lSsbUX7Mlp++BnVSTZId2OLv0t3zQvizBv2s+P7/f99zlOk8pTyZkCCafK3v4pZcv3M8bcJzBjFRiACMEsZ5e59Buowiuy0GcG4MNaDGLqFLhfHOBXvOZ5DeQt4BP8lsfoZJBd7cNY1bYC6aACv+bxZUMIpeknPcCm2hRJj3NIkJeKYNdQwcDh2A0IbVGC0TB/6uqWo600oXUrrdYLRqafS4pToFwmBECgR23cmYZKze7JEnFcx+gHm9hfDbqT5bOf0H7sMcLs6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 08:41:59 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:41:59 +0000
Message-ID: <08b2f77e-5db7-44ea-834a-b38739bef4aa@intel.com>
Date: Fri, 10 Oct 2025 14:11:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: Matt Roper <matthew.d.roper@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com> <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com> <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
 <20251009230638.GF1207432@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251009230638.GF1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 3925c372-458b-48f1-16ae-08de07d8e00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnJhWEpueUNNZ3M0TnpCdjJNL09NNUpUQmVEZTQrSnRKbmpjOUJNdGRuWWFs?=
 =?utf-8?B?dkRybDdsNXBKdUZXWmFkMUFPb1VsSnFzN2VFV1JqVjRReDJ0NjZCSHBEVVB2?=
 =?utf-8?B?T1BVZEJLTWVCTDRWdW95ellVeGd5N2FZZzRDREhZVFBPbWJYSHVjb1VTZjJK?=
 =?utf-8?B?QmFIRmo1YjZtT3ZPUFJHdnBZSitqcHBkcGdaWDZnSGNhZTN3dnNPcUt5OGtu?=
 =?utf-8?B?Z1k5TzR2YW5veVhDZVIrei8vcGxoS05jaUZlSUYvVFJjdDljSXBzTVFHQTdX?=
 =?utf-8?B?aWVZOFlLc1Q2T0dWdVgraDBDY2ZkYkJRaWttWGZab1FNSFdhQmVQN2IwMHpN?=
 =?utf-8?B?WWFmTVQ3ZU4rNzY4V2JsUmRHcUVzallsMW9pNmh4aGRGNWYrQm1hdnh1Nlor?=
 =?utf-8?B?N2FmbWZLVTBqSVhWRVVicTQ0d3NyU1MzTVordVZFdm9kMWRURnM3K3pQZUY5?=
 =?utf-8?B?VmZhWjhWZDNRMjVjNWJSV2MzSHJXbjhJdmY4bEZtMms5RGVUcUZBMnZSdmtQ?=
 =?utf-8?B?Y0VuZlJXZll4VWVPR25mejhOWkZmQkVxaDJxUmpkSUZkZnpqUlUzWWpZMHVY?=
 =?utf-8?B?c1FkTXprbU5Da3QxYTcwTnRkYUljVVUwRnR0dFd5ekgxQ0hSYmZKWElLeEpE?=
 =?utf-8?B?ckxPWlBjSWVFaE5LcG4rSlBWaWdNNStFQjRjWHcybGZzdk04S1ZzeWo1VHV5?=
 =?utf-8?B?WG9xVWlqUzM3V3laZmdUQk1RZ3gwUFdueDhGaERRelFYR1UzaHFic2ptZlZN?=
 =?utf-8?B?czlSaWEvTHQ2UUdMaHVleFlzdUJCS25GTVdFd2FrRnJmbTA5SUFzbUQzcUZ3?=
 =?utf-8?B?Q0M2STZGTmsrSXdDU3U1ckxLMi9PejRDUEtaTXdXeVV2NGtWaitIODFhZHM1?=
 =?utf-8?B?aldFUW1adEg1eEdEYlVtbHlHTUlhR1NaN1pkMTNlRExaM0dKeDdBc0ZMeVZE?=
 =?utf-8?B?bjZGeHJrKzB3MTU0M0VKZTlRYnlheEZIaFFVRnJUdW5wQU84bllQN2o2elBl?=
 =?utf-8?B?Q3BCU200VFZQclR1OEFoakJvRTV1cDhXRWhMeVh5eHJTZzc3Qm41KzR2YXhh?=
 =?utf-8?B?OWtaTldFekdQU040aUVLdVFoWE9tdUtyR0swMityb1hPRWJxL0RNTjEya0JK?=
 =?utf-8?B?S1BQNVc1QkJxakZuR095aUhhQm9qaTZsaVVMaGJ0ekZFNXRXOE16SW54djZF?=
 =?utf-8?B?R25oRzAyYUp4N2tjekhUaUhZMm5HUSsrcmE3U21ncEo1WUFGb1BBSjNLeFk3?=
 =?utf-8?B?U3NGS3k3L1lXTk1TMEVLYWdNZll4MnRrcndrckpOYU0xdlJuSVloWXNXQVZI?=
 =?utf-8?B?OWViQTZIM0dyOVl5Njhrc2pTV2taRG1GYS9KOUREckxYUGxRdTdrMHM0RENj?=
 =?utf-8?B?Z3dFalpUK2JDSE8vL0t4TldMUXB5NzZBSlhOQ0lMekhBNzgwbUpyblZpcThN?=
 =?utf-8?B?UnR3MG92MmJXVTc2R1VNSjhwc1NLaHd0VjRjb1FpMXpwR3ZJd1h3T3dpQVRL?=
 =?utf-8?B?Y24vdE8yWG9JSEEyN0cveXpBR1RHUVRLeGsxd0NjWlFyNTRpTWllKzloTHIw?=
 =?utf-8?B?b1ZnVHUrRnJEdTBLQ05DdHB4bGxzcW1PeUtnczJWU2d1NkYvYUJBMDJ3WTdL?=
 =?utf-8?B?emJPS2J0bDZpUHV0MndHZGQvbGVzb2tkR2dwV1Y2YWRhcWVoM0dId1k4YXox?=
 =?utf-8?B?M3pVU3JEVGxNVlQ5ZlIweHpZRDBESmMyTWhvMFp2ejFoRmg4SmxFRzQzdnVE?=
 =?utf-8?B?UE03Qm1ta1YyZjhmT3J6WXphaWlCbmdvSk1Wck5teVdoYk5LS2xHSWF2THM3?=
 =?utf-8?B?Z1FMeWpjOVdOWER5bnZEK29RbDNNT3o1TlRKeStsZ3pRd0tQUUtCaUVMMHhS?=
 =?utf-8?B?clZrd2VMd0NZSHBzQitobUlZSWQ4ZU5hWDl6dWlBc3VBQkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFprZmhqN2lpc3hKeDZ0cEVqeUYweVhtenJpS0ZpK1hWTVlqS1RuYlhrYTFJ?=
 =?utf-8?B?cE1xQUdCS296ZlV1SEc0Nk5KbDBaSmhlalRqb29KMWpFbStGVW9TSXFXTUFh?=
 =?utf-8?B?eHh6WkwyTFV3THZRdXk0UkpOTURnUXdKVUFQYVI5ZHRhaklZUXAvQ0ZKdlls?=
 =?utf-8?B?eE80ZnZ2RGw5Y3FwM2dObTl6a3l3emtUemw1WmZTaHRES3dpL0xRMHMyZEtx?=
 =?utf-8?B?MG5raDliaUNaZXJLbUhLeHJMOUM1NDJzSWpHRHNGL0t0Umc0MnN2cmNWRXVB?=
 =?utf-8?B?K3g0UXhpSERaaWVVYmpUUm92d0tseVpIT1ppRk1OOGt1blBOTGV4UlUvVm5q?=
 =?utf-8?B?MzZ3dElJclJkUkhxdnNiRVI0bk1teCtWQWtIVTkwNGxTTWVhV1lxZUJDSDdx?=
 =?utf-8?B?OWI3S2tML21GWUpkbFdnVXM1NENQRjdydW12YkNRWlFPam9nZTZPbm1qYkUw?=
 =?utf-8?B?NUthVGdZUDlBSDdOSWlEQVdqMFpqTTR1WWsyODFRWVdVblBSa2pZMnErMXJ2?=
 =?utf-8?B?QlZZVld5ZWVxd09SVXE3RTlZU25vZ3V2NGNMR0x3RVlocU5WeWM2NFRBTy9j?=
 =?utf-8?B?RGl6UjRHQ2RGMFBXMVpjRjdWdDJIODlNRjNEWjRraktGSGRNMnFvWmlibm1D?=
 =?utf-8?B?c2tWS0hHZHpIak5KRUpQc1EzN3R6Wjk5MFkzdERBdkdyUjYyeXRvU0NGVERP?=
 =?utf-8?B?WTBQWXNDV2NGUURmbmtscWZXMFB3Uy9WYzRQTEFnbmtxQ2t6QlBiVS9uR3Bm?=
 =?utf-8?B?U2lMZ1FCdVQ4cjRlckpycVRyNG5NN1hZVTdVaVUralZuMlFjaUtWVE0yc1d0?=
 =?utf-8?B?bEhjamZUUGR4RG5pSHhMcldTVUtpa0h5Unk4MkhTbFJySHNuWXhCMTlSQXQw?=
 =?utf-8?B?OW5YYkUwY1pEaVJGa2toL2I3aWJWa3planphTGVySXQ5NHF1a3pHbGxFU0pV?=
 =?utf-8?B?QTNGK2JCWi9NREdibTBpUzAyaHFSRENGQW80YW9oUWRITzRaSXdqMUp5VUhi?=
 =?utf-8?B?V0psWU0veUZTQUNoYnlwZkIydUZiRW8vanIxeDJNdGg3MFFMUlhoeHdTTjdo?=
 =?utf-8?B?V3Y0RStxOXE5Z0d0eWZOMWo3dVF6bHE3ZkpNNkdXTnRQTFA1NkhqYXRQN0Vh?=
 =?utf-8?B?R052MnB1MVZJL2lYWFNFYWNuRllKUm9Ka2pCRW95b0RmdHNWTjNiUTdxbHc2?=
 =?utf-8?B?TWRyMUxwSFdXWGdZOXUwb0JLbnRWY1lJMmFiaVpqcTBMZmdSU2tOdy8rUU12?=
 =?utf-8?B?VlRaSmJmbEVEdlJVMFRPZE9CeU9SVGtZYURWOUNkeklIWm9ZUkI3VWRGV3ZD?=
 =?utf-8?B?M0hpMEFaVnVINitLU0ppUkRZSW5TWjJISjI2YUFGQUJXK29NRkNEYWIzRVlp?=
 =?utf-8?B?L0p6V2tXMzNMWmtaZjRsY013a2syYUFHajhXck5TVFZMS0F3ejA3SGRGZkov?=
 =?utf-8?B?VEZCS1RhUXpTSWhlbW95dFBNdU5rb2RMWENXS2ZtTGM2bXF1MGwxazU1U0ZW?=
 =?utf-8?B?cDFoUkMxZURNcmxzaXVBc1NSZHRETTBZWjF4WnpRMitFdFAvVVdUZndaRXhp?=
 =?utf-8?B?Zm9Lay9sUEZYd3JNcElCNFJUaURmUEhTdnpnMHVYSWVBSW5tWnN5K2VtVnVX?=
 =?utf-8?B?amZGMy9HZjBLc2R0RjhxSjNiTy8wUDlEWHNIaCsrR2VSZFdrdDVuT2dlOEFE?=
 =?utf-8?B?MkJtbG5TaUlROExRWjNLSW9EdTRRUFhTUVlMNU02TlBHcDU5TzdocHBXbXN2?=
 =?utf-8?B?Q3o5ZVhHdVRhb05WdnVtdDhMWDlCMytyWjlpWlJpKzRIczl3NFZxcFpRRkhQ?=
 =?utf-8?B?R0ZLcXJlTzIrTys4ejArekhSaVBpang1cHNjMVRISTNxc296T09LSzNXRGgv?=
 =?utf-8?B?VEhqZDRLaXJBVFMwanN3NXFYSDhlQS9FcFRiTVExVDdTbk1PV0FSRjlYZ3M1?=
 =?utf-8?B?MFRpWUxmdlBuMDVXSlZ1YkhEb1llRlFtWElpd3A3UUpjajNHb3Z1L0t4MkEr?=
 =?utf-8?B?bTg1TVBmY2x5cVVraGswQ1QrVi94TzNlbmUxSjBLSzlZSTBYNWtBZEZWZitx?=
 =?utf-8?B?ODBJejFNTi9udTRKbEJNTWNjSjdyQWpJcXBXaDJ3QlMwMjNMMTlpelJGL2l0?=
 =?utf-8?B?NlRjNDFiMWNGUkdzdzQxV0JnQmgwQlVvVWRXaHBNVTJ3NmdEUnNkTGJhaW9j?=
 =?utf-8?Q?40tYRRUtwCjehsTLU93ks30=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3925c372-458b-48f1-16ae-08de07d8e00b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:41:58.9457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWSqhzyzkns82PM33C+WEyZA4EiH0twxABn+4P+yHrf/0zUWsUxEHnzxuy1Hy8v5H3z5iVkPBuU2ekuLXdkwea87vgm51RyG6Sm/5Le+OQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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



On 10-10-2025 04:36, Matt Roper wrote:
> On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
>> On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
>>> On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
>>>> On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
>>>>> On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
>>>>>> On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
>>>>>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>> save/restore while this sequence is being programmed, partial writes may
>>>>>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>>>>>>> instruction to write the sequence atomically.
>>>>>>>
>>>>>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>>>>>>> 8 dwords instead of 5 dwords.
>>>>>>>
>>>>>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>>>>>>> chunks.
>>>>>>>
>>>>>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>
>>>>>>> ---
>>>>>>> V4 -> V5:
>>>>>>> - Fixed review comments. (Matt B)
>>>>>>>
>>>>>>> V3 -> V4:
>>>>>>> - Fixed review comments. (Wajdeczko)
>>>>>>> - Fix issues reported by patchworks.
>>>>>>>
>>>>>>> V2 -> V3:
>>>>>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>>>>>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>>>>>>
>>>>>>> V1 -> V2:
>>>>>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>>>>>>    (Auld, Matthew)
>>>>>>> - Fix issues reported by patchworks.
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
>>>>>>>   1 file changed, 72 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> index c39c3b423d05..b629072956ee 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> @@ -5,7 +5,9 @@
>>>>>>>   
>>>>>>>   #include "xe_migrate.h"
>>>>>>>   
>>>>>>> +#include <asm/fpu/api.h>
>>>>>>>   #include <linux/bitfield.h>
>>>>>>> +#include <linux/cpufeature.h>
>>>>>>>   #include <linux/sizes.h>
>>>>>>>   
>>>>>>>   #include <drm/drm_managed.h>
>>>>>>> @@ -33,6 +35,7 @@
>>>>>>>   #include "xe_res_cursor.h"
>>>>>>>   #include "xe_sa.h"
>>>>>>>   #include "xe_sched_job.h"
>>>>>>> +#include "xe_sriov_vf_ccs.h"
>>>>>>>   #include "xe_sync.h"
>>>>>>>   #include "xe_trace_bo.h"
>>>>>>>   #include "xe_validation.h"
>>>>>>> @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
>>>>>>>   	}
>>>>>>>   }
>>>>>>>   
>>>>>>> -#define EMIT_COPY_CCS_DW 5
>>>>>>> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
>>>>>>> +{
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +	kernel_fpu_begin();
>>>>>>> +	if (size == SZ_128) {
>>>>>>> +		asm("vmovdqu (%0), %%xmm0\n"
>>>>>>> +		    "vmovups %%xmm0,   (%1)\n"
>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>> +	} else if (size == SZ_256) {
>>>>>>> +		asm("vmovdqu (%0), %%ymm0\n"
>>>>>>> +		    "vmovups %%ymm0,   (%1)\n"
>>>>>>> +		    :: "r" (src), "r" (dst) : "memory");
>>>>>>> +	}
>>>>>>> +	kernel_fpu_end();
>>>>>>> +#endif
>>>>>>
>>>>>> Everything in this patch LGTM but I think we maintainer input to ensure
>>>>>> we are breaking some rules about inlined asm code in a driver (no idea
>>>>>> if this exists) or if a better place would be somewhere common. Can you
>>>>>> ping Lucas, Thomas, or Rodrigo and ask them about this?
>>>>>
>>>>> Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
>>>>>
>>>>> But the rule does exist:
>>>>> https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
>>>>>
>>>>> "don’t use inline assembly gratuitously when C can do the job. You can and should
>>>>> poke hardware from C when possible"
>>>>>
>>>>> In this case here, please explain why exactly memcpy with smp_wmb barriers and
>>>>> or WRITE_ONCE code combined couldn't solve it.
>>>>>
>>>>> Also, please explain how exactly vmovdqu guarantees the atomicity promised by
>>>>> the commit message. On a quick search here my take is that for this 128 or 256
>>>>> bits, atomicity is not guaranteed.
>>>>
>>>> I don't think cache atomicity is what we're after here—rather, it's vCPU
>>>> halting atomicity.
>>>>
>>>> Consider the following case:
>>>> b++ = XY_CTRL_SURF_COPY_BLT;
>>>> b++ = addr;
>>>>
>>>> If the vCPU is halted during the instruction that stores
>>>> XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
>>>> batch buffer (BB) that is being programmed as part of the VF save. This
>>>> will clearly cause the BB to hang due to a page fault on the copy
>>>> command.
>>>
>>> okay, perhaps this is what is getting me confused most
>>> what I don't understand in the flow is: why GuC is already
>>> executing it or going to execute it while you are going to a halt when
>>> writing the command to the buffer?  and not writing to the buffer first
>>> and then sending it to the exec queue?
>>>
>>
>> It how this feature was architected, will send over SaS link of the list.
> 
> I'm confused by this too.  At the point we're filling in the
> batchbuffer, the GuC isn't aware of the batch at all yet as far as I can
> see.  In xe_migrate_copy(), we've called xe_bb_new() to allocate a new
> batchbuffer, and then we start calling emit_* functions to poke
> instructions into that buffer.  At the point we call
> xe_migrate_ccs_copy(), the hardware still isn't aware that this buffer
> exists, so it shouldn't be possible for it to start executing.  Only
> later on when we eventually create a job for the batchbuffer (after
> we've finished emitting all of the commands) should it be possible for
> the hardware to start executing this.
> 
> If there's some other *future* changes (not present in the driver today)
> that change the design such that we allocate a batchbuffer and tell the
> GuC it's free to start executing it, but only fill in the contents after
> that point, then that needs to be clearly explained in the commit
> message.  But that also sounds like an fundamentally racy design, so I'm
> not sure why vCPU would be the only situations we'd be running into
> problems.
> 
> 
> Matt
> 
HI Matt,
  Please refer to xe_migrate_ccs_rw_copy() function which just creates 
BB and it does not submit job. The idea here is that, we have a 
sub-allocator which is already registered with Guc and the function 
xe_migrate_ccs_rw_copy() is allocating BBs from the sub-allocator.
When the vCPU is paused, GUC automatically submits these BBs to HW. So, 
we are making sure that the BB always contain valid GPU instructions so 
that HW will not report any page faults while executing.
I will share the SAS for this.

-Satya.
>>
>>>>
>>>> If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
>>>> then either the GPU entire instruction is written or none of it is. I
>>>> believe vCPU halting guarantees that a CPU instruction is either fully
>>>> executed or not at all—regardless of how many micro-operations (uOPs) it
>>>> decodes into. If this guarantee does not hold, then the entire
>>>> architecture of CCS save/restore on PTL is fundamentally broken which is
>>>> always possible.
>>>
>>> Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
>>> of the vmovdqu nor vmovups. only before, between, or after them.
>>>
>>> But is this uncached and/or coherent? isn't there really any possibility that
>>> the command finished, but GuC mid-flight executing things aren't still
>>> seeing different cachelines?
>>>
>>
>> The GuC won't start executing until vCPU unpause on the save flow.
>> Restore flow is bit more tricky as vCPU are live when this happens but
>> we can W/A that race in software I think. That part is not in this
>> series.
>>
>>>>
>>>>>
>>>>> So, imho this patch is introducing a unmaintainable, complex, and fragile code
>>>>> that is not even doing what it is claiming to do. But I will be glad if someone
>>>>> can challenge this and prove me wrong.
>>>>>
>>>>
>>>> Let me know if the above makes any sense.
>>>
>>> Okay. But how to handle cases where AVX might not be available? really not needed?
>>>
>>
>> This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
>> instructions.
>>
>> Matt
>>
>>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Rodrigo.
>>>>>
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>>>>>>> +{
>>>>>>> +	u32 instr_size = size * BITS_PER_BYTE;
>>>>>>> +
>>>>>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>>>>>>> +
>>>>>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
>>>>>>> +		memcpy_vmovdqu(dst, src, instr_size);
>>>>>>> +	else
>>>>>>> +		memcpy(dst, src, size);
>>>>>>> +}
>>>>>>> +
>>>>>>> +#define EMIT_COPY_CCS_DW 8
>>>>>>>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>   			  u64 dst_ofs, bool dst_is_indirect,
>>>>>>>   			  u64 src_ofs, bool src_is_indirect,
>>>>>>>   			  u32 size)
>>>>>>>   {
>>>>>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>>>>>>   	struct xe_device *xe = gt_to_xe(gt);
>>>>>>>   	u32 *cs = bb->cs + bb->len;
>>>>>>>   	u32 num_ccs_blks;
>>>>>>>   	u32 num_pages;
>>>>>>>   	u32 ccs_copy_size;
>>>>>>>   	u32 mocs;
>>>>>>> +	u32 i = 0;
>>>>>>>   
>>>>>>>   	if (GRAPHICS_VERx100(xe) >= 2000) {
>>>>>>>   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>>>>> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>>>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>>>>>>   	}
>>>>>>>   
>>>>>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>>>>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>> -		ccs_copy_size;
>>>>>>> -	*cs++ = lower_32_bits(src_ofs);
>>>>>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>>>>>>> -	*cs++ = lower_32_bits(dst_ofs);
>>>>>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>>>>>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>>>>>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>>>>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>>>>>>> +		  ccs_copy_size;
>>>>>>> +	dw[i++] = lower_32_bits(src_ofs);
>>>>>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>>>>>>> +	dw[i++] = lower_32_bits(dst_ofs);
>>>>>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>>>>>>   
>>>>>>> +	/*
>>>>>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>>>>>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>>>>>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>>>>>>> +	 * write the sequence atomically.
>>>>>>> +	 */
>>>>>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>>>>>>> +	cs += EMIT_COPY_CCS_DW;
>>>>>>>   	bb->len = cs - bb->cs;
>>>>>>>   }
>>>>>>>   
>>>>>>> @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>>>>>>   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>>>>>>   }
>>>>>>>   
>>>>>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>>>>>>> +/*
>>>>>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>>>>>>> + * save/restore while this sequence is being issued, partial writes may
>>>>>>> + * trigger page faults when saving iGPU CCS metadata. Use
>>>>>>> + * emit_atomic() to write the sequence atomically.
>>>>>>> + */
>>>>>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>>>>>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>>>>>>   {
>>>>>>>   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>>>>>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>>>>>>> +
>>>>>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>> +		      MI_FLUSH_IMM_DW | flags;
>>>>>>> +	dw[j++] = lower_32_bits(addr);
>>>>>>> +	dw[j++] = upper_32_bits(addr);
>>>>>>> +	dw[j++] = MI_NOOP;
>>>>>>>   
>>>>>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>>>>>>> -		  MI_FLUSH_IMM_DW | flags;
>>>>>>> -	dw[i++] = lower_32_bits(addr);
>>>>>>> -	dw[i++] = upper_32_bits(addr);
>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>> -	dw[i++] = MI_NOOP;
>>>>>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>>>>>>   
>>>>>>> -	return i;
>>>>>>> +	return i + j;
>>>>>>>   }
>>>>>>>   
>>>>>>>   /**
>>>>>>> @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>   	/* Calculate Batch buffer size */
>>>>>>>   	batch_size = 0;
>>>>>>>   	while (size) {
>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>   		u64 ccs_ofs, ccs_size;
>>>>>>>   		u32 ccs_pt;
>>>>>>>   
>>>>>>> @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>   	 * sizes here again before copy command is emitted.
>>>>>>>   	 */
>>>>>>>   	while (size) {
>>>>>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>>>>>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>>>>>>   		u32 flush_flags = 0;
>>>>>>>   		u64 ccs_ofs, ccs_size;
>>>>>>>   		u32 ccs_pt;
>>>>>>> @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>>>>>   
>>>>>>>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>>>>>   
>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>>>>>>   						  src_L0_ofs, dst_is_pltt,
>>>>>>>   						  src_L0, ccs_ofs, true);
>>>>>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>>>>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>>>>>>   
>>>>>>>   		size -= src_L0;
>>>>>>>   	}
>>>>>>> -- 
>>>>>>> 2.51.0
>>>>>>>
> 

