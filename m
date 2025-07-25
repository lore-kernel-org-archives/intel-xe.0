Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B87C83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 08:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ED710E14E;
	Fri, 25 Jul 2025 08:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKlngorA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA710E14E
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753431953; x=1784967953;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UISssDQILH6EOBxdFZU2/maRDjgWMn4iCrNsLOZAnWM=;
 b=CKlngorAlH+PcYs7wE90vdWo1HQeENtxMoEBLed8bpGIWsuRAvhKApCD
 OlEbcu6OUv3L6vfys0g6Jn4cDttuPAWtrmOz9Zr8pux7GzvFfehKrsefu
 F9su1bwyCI78nDgOf/2Elw36b8M+xRUL/ig9LBA9/HgtbUOLqNMvf9wpi
 z77AH7ko5GjnN4QKynHN3WBqsLKIp7oHv6TS2QHIUm//qQOQ29uprufg+
 v9tr55O+JZdKF0rffha/zb6Got9lOAuEWBO6x40AUi664OqfR9pQbg9TM
 riF2ZXpXf93vdVsG54WwkIBnmo/jOhHcaTPOgef99beEceyr4ZgkSqDF4 g==;
X-CSE-ConnectionGUID: 9bYZUb2nR5SvKP/2A3WhVg==
X-CSE-MsgGUID: rrEZid1CR+SzHr1UG5HEfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55619298"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55619298"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:25:53 -0700
X-CSE-ConnectionGUID: Ec3Ad3JeSXCo1Uu/M+faUw==
X-CSE-MsgGUID: 5WDwZ1cSTAG9lzfpxR1sTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160773930"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:25:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:25:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 01:25:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUUOyLX+WNuM86hb7oHznDJD2nEiQFeERlRujmg8kIBBtpQyUcuOE/T0oICJOdpty8uTomU4opfnKS0DE0tzvjEmAokt13fAqoTPN7mib0AcUKwKfmsQHSVbBsXDbIWBuf7xX+0+3vSalMxDeZlkidg+un0t+o7AqVO+EWixQi5mpC22oiVjexZokLQ1Ks61wb/8Z7ya06bRa4NqG8HLpM5M1zLbfB0KwGh2s6nCg41U/i7kiqxoNpVOpgDMEhFMvDQutjDsGAW0GIYtiPR47M+XCkwh0+P1R5Tl2UJ4mE43V9PcxmOG/2jK5Gq1B6S++abd4azgJ60ZKPFCXR7jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U51PMWsaD75tigTt2f4SAUXqQ43Eshu78iGWRTI2twY=;
 b=SX/xTeAqx2JMNQOeNswDtQwepLmnbdEXvTis37Wf//J2Ftmhpy2wOuWIJPqWl53ROwOgCQLz5shwfGAKkh45l3zaJR0b6bEzXiWq3Mp3FkMy+BwNfd4HRCJ1A6hBrL4c9lCc9XnIa1G0TPKWY69uZbg8x9/Ky3zTaE7hyETDIqsJzyxZH71vP4SDkOyMTonYYMVYIlTVuZ5e8Xft3LzPV/YrTCQVSk5Ka6D8neHOkb+3PCsBabd/DjU7u/TwHJqXjFCGWexQ7ORoYZaNhintyekw6+V+ntf8HyeFDQ76GMVD9oAJsM94BMh52WD2o+DI+G5WDZFFDAKsnpj7ogZhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 08:25:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 08:25:03 +0000
Message-ID: <ab23671a-5f81-4509-a967-fb5ea08e146c@intel.com>
Date: Fri, 25 Jul 2025 10:25:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Allow freeing of a managed bo
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250725002111.3906267-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e0b14b-4ba0-4240-daa2-08ddcb54c121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTF0TGxLWEEyTzNtNGdmVEJsejdTMVRmT3pndGtFUnM0Q0ZHKzNPVW94ODhl?=
 =?utf-8?B?dHdhUlN3dlAzNHRZNkZkeXRwWllzaXptMk5GU3p5L0pWWFk2UGQxSEdZa2tN?=
 =?utf-8?B?K0cvTDFJM1VTNnVxdlpxZGF5ZUZ6ZEFESU1RdTlnWDdlS1pZSTlkK010OUd3?=
 =?utf-8?B?K3ROSGVvT1pkclBuMnBKWmdEbDZNRWxhU0x2NnR0Njk2RWdIK3RrbEZkb1Mr?=
 =?utf-8?B?TG1zRmhCZTl3VmZzcmNXV3dLSGQ2bDFNOFBadFBPbUo4SnlLM3hyQmIzSDRU?=
 =?utf-8?B?cStxMkVOVkJFemR5MEdobnF2YUQvcmFxS0s3WUozeWhxSm0zME9pN2JOKzZs?=
 =?utf-8?B?RkdsNmthZGhqNy9WbldkZ0djWUkzNFIxMEZMS1ZmSVFmWFBhTk9ic2lwUndX?=
 =?utf-8?B?OGJNZnEybE52YlArVWJNY3ErQkdDdEptdGw1ckdxTW9SRjhHL0dFQVJVbWpL?=
 =?utf-8?B?ZmFKbnA0dFBYVXFqQTFyeGI3M1YycjBTY1VCQ2lCWXZXVjFRVzc0NVU5RUxO?=
 =?utf-8?B?aTBVdStBNXZ0eEZIeWdxa0RWa2h3SHJyZEVQVnlabGVVWDgwMDZ1d3FJZEdK?=
 =?utf-8?B?UnVWSVVMZWplTGZpUHB4MTNia2tLbWZvN2Ewc3NhVnFVam5XN0tpUFFoVlhw?=
 =?utf-8?B?by9KblF5MEhXY2o2U1Y1WWFBQjZYNk9YMkxDMVdMZDRZWHA0K2JTQTQvcGgr?=
 =?utf-8?B?QlhsWWZ0R1lXenlaTk9VN0JJWXZCdmJFVGJnYXo5YlpKK2tiK05zQnZNSTJj?=
 =?utf-8?B?YTFJek1xSkpDVnNvSE5EQ1paUkY1NW94cWhjbE43alh0TzFJdnNjSWhIUHpY?=
 =?utf-8?B?UXZ0QzJoME1BakJSOG9Valk4WXRLU2tuWlBEQlFLbVVWMlZvd3VhMVpnb3F0?=
 =?utf-8?B?YTBUVW92c0RyZitXVzdJa2VSZm1QQXFzRXRGZUNLYVg4NEdZdFF2QWFFZitv?=
 =?utf-8?B?V2p5YlRXR1JzVGVuYlI3UGNWSWhMLzhuaHZXRVQvSTJIMmVERThVeXZwcXlU?=
 =?utf-8?B?cWVKY1BZSHlabHRaUzIvS1poNDFmL29WZmJCKzh5Qmh4RWFZLzI1RGo5aTAx?=
 =?utf-8?B?R2NhK3FIVm82a3c0U0VydDNxaks1eG9ENFMyeUdBRlhid3liTzFKUHF6VVVP?=
 =?utf-8?B?Y2MzRzBXSEJZblBVVTk1cUJMZ05FODVIaGhxUGNkZDZEMzZ4WGIyQ2JBdTFr?=
 =?utf-8?B?TncwNXhuclNralhJY0xxMDVRcXV2aDkzZUJ3ZWJOOVNvanNzdlpPalBGNWpr?=
 =?utf-8?B?cUhJRGlTNVlUQTRpeW0vOFlrU1pBSU9vTnIzWHdqN0RORG1UUWpaZVJibWNQ?=
 =?utf-8?B?UDRuaStxWW9KOEMvY3dDSEEwV0djZkhQSGNUS2xKSkZ2MU1iTkYrcHBuYVM1?=
 =?utf-8?B?K2UxUWRTR1dyT0trN0ZYTnRKRmhETlp2MXRUVEhVYXI3M1AxdkN0VG5pa05h?=
 =?utf-8?B?ZHQwZmdlQmJXQnRFQ0pDTXVnU3lLM1ErL09OeEI5MWdoc0VDK3ZTTm9LejNT?=
 =?utf-8?B?NFNaWitZb1JKS0pxZEtnVU4rYm91c1BGS3I2M0xmK0ZHeU1nc1dmNWFzSmlr?=
 =?utf-8?B?K1BnTE5oLy9Fb1lXRENONVBOUml1Z0h3QlR5NlJhOFphZG9UdnczMFdrbzZz?=
 =?utf-8?B?YktZeU80YytGbEVMVUpuTVc5ZWtUOWpWV1pwTmpUZlFTYng0RDErcjU5Z0JX?=
 =?utf-8?B?Ymo4UUFXajNVVHlaSTR4RjQvL2M4cWh2Rks5RzFRWFBWdVdRV3hpa1EyV2dF?=
 =?utf-8?B?dFUxcitkaHdEeFoxcEhSRGJtbzgxWEttTms0VURETFdFOUVsTDJ3end0TG03?=
 =?utf-8?B?alhRd1EzUHMzK1RoZDRrZHFGYXgySG9Sd1dBaTdra2EzOW8zNFlkYzVoN1Zq?=
 =?utf-8?B?a05DWnpQQTZXMXlWUW1nRlFBTXdyQjNMeWlIRVM4cnN1dXMrWlB6enlWOFcz?=
 =?utf-8?Q?YgHxJ6hWStQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FXMnNXWGcyVUI4bG9HcWRkZVkxVXNCRE8zem00NVRkSW9JVlNLWWxFUEZU?=
 =?utf-8?B?UWJTcUYxL1phL1VUVldJd04yRFJxZGJpYTZkaGxqbDVzZWRYMUhuZGpwZEVV?=
 =?utf-8?B?WDQzWGl5WWFKbEw3RGE3cm85MVgzYVliMmplMEx1SHRLakliR1lsU0laOUFS?=
 =?utf-8?B?dUJsQnNzODdHZkpEWlVDdEdQQi8vMW9xRW5JTEZaeFdYbVY1M0t1RWFSa05Y?=
 =?utf-8?B?RzdpakExSXVvNjVjVkRkRFNDSG40OEpwMTZGOGloTEt6SUg3K1JvKzg4M3hD?=
 =?utf-8?B?cy8xMXBQMXdKdStRNEdvTXo3NE5ZZ0huQzYyQllueXVmUFoxVld5N2lyd0Jw?=
 =?utf-8?B?UkZZTW1TaC9vWVBIQXdaR1lyQU1veC9QdU9FOXR2d2g0MWd1Sm5PU3ZhUTRV?=
 =?utf-8?B?ay9WNE5La0ZwWG1RbHpNSzVBRjg4ODdoNWM3cmZkWXdMVkw2cG1lbXo5ZVo2?=
 =?utf-8?B?TWhkOHFYclRncmptZ2tPbitYbldMYUFscnFMUE9ES2NHUnhzSlFTWGRCRFhL?=
 =?utf-8?B?bk8wYWFjWDNIaVUvOHMvTU1wRUlvSUIrbFp6S3JJam9WTWs1b2ZKT3hvMEVw?=
 =?utf-8?B?bkVncUVCK0NNcERCbHF6OWoyZDN6VTEwVXQ3c0FwTUpQWFl0V0x0ZGdKb1kv?=
 =?utf-8?B?cklKZnFzQWdlelh4aUxKVlpQVERBcndYelE4MTdINkZYUmhianlKWFBtQm1K?=
 =?utf-8?B?dUtiZUQ0WW5VRktuTkZQa2plRGpGckkwbVE0cFZld1RORjl4dUNieStDL3VQ?=
 =?utf-8?B?WWw4ekk0aWdJTGUwaTZJUDYwNmZnQXdzdDF1NzEzcXdJT1dWSW5kSktPVjNW?=
 =?utf-8?B?WHZZS3dJcVJWR1lFckdpR2tCeXdjZnhzQmxRQkVzOHl1SzRzRnQyWUhCMHdV?=
 =?utf-8?B?RXVpMTVxOEZheUtNdWhGeEpDV0ZFSGNDaUdIZ2RVVXM4WHZ1ZFhpWGVpUWYr?=
 =?utf-8?B?ZGM5dXZzWU84czE5L3dRRTR3ZkFvNmgxTTJ1ZlU1TmNmZW9UZHJFS01NMGNT?=
 =?utf-8?B?UkQ4Z241Rm5qc29wYXpJc0IwUHREbXliU2RtM0wwSWJhT2s1RHdlRFBlRGZv?=
 =?utf-8?B?SEYreFJkd2lzOWlnWmdXMWxTcU93T1RaY0VxRE4xNE0za3dVMm9sVmlmZUVV?=
 =?utf-8?B?TCtmaGRRWUVPb3VvYkZwSDZhK3RBY2tCVU9wZHAva2hSam9QM1ZwNnVQK2Fp?=
 =?utf-8?B?TGR0YThTMmxqUm53WnJ0Zlh5N0RFL3M3ZEJmRVNySGd4bzhKVlhoS2ovSGZj?=
 =?utf-8?B?NGlucFRBcm95UXdvaHNhUXl5V1BUUnFjdnFFNXNpajA0WGlLczNVbHNDYk1C?=
 =?utf-8?B?d0VFMU1WQ0tNRnhta1ZlcHlBdGdYUnE1MmNWRkNoYWx2TTg1RWJSemxmMjYv?=
 =?utf-8?B?Ri9IS1krcjZvTHA5VU82aHRldFhpcCtLaDQ3TWo0Tkdjbys2dDhWTEZxVFVC?=
 =?utf-8?B?c3RvaVlZcVczZlpqK2hBbTJ2N1FSY0N2THBockh1M3RETE5oelZBcngzS2Fs?=
 =?utf-8?B?MC9hUVFwN0xsSnc3NGQyYURCVmNMdFQ5dkM2VExCYktYQURQanRiaGE5a3Nl?=
 =?utf-8?B?c0p0UlRQQVBWRlNxeWNUWHc0Sjk0aUdiR1l6eWFldDhTSEV1MHJRSjVuTCsz?=
 =?utf-8?B?aUlIZTRyNGt1dzJNa2hmNmRGdUQ2NENocUlrUDc4Wm1CUFZtRk1BTSsyc3Ix?=
 =?utf-8?B?Z0E1cm1ZZzhpc040UVZia0ZnbWJUNy9zQUdVWmEwd1d1TjlqNENhenJxR1dr?=
 =?utf-8?B?TjA5Uzd6ay9DSVRkS1YwZmgrQ0NCQUhpTm1DdHM3WTdDaVFLSFFnZzlSM0xt?=
 =?utf-8?B?Vy9DL0tlRWt5Zjg5dlFDVjVxTlRPL2JUb1lTQ1VEaXlqSzVPbklLZ1I5R3Zv?=
 =?utf-8?B?S1VJWmRwb2ZFcW5yWERObmJ6bjh6NzBBNVM3QUxJd3c3aUIyN1FjaVhDY3Zn?=
 =?utf-8?B?M253eVQ1MlM4bmpXdFpHWWNCK3l2STF0b0l6YkczTm1VbS9JMFhxKzZ1MEJW?=
 =?utf-8?B?eE5xSnM5bitHUTg5L2x1TU1TaHFZNWF6SDZGTUIxTk9TSHNrZFZIODN3MnFw?=
 =?utf-8?B?cUFOVXM0Qm9HT2p0M1hvNk90MGtKbmdiODB1eUlmaWhKeHNnMnhtWVI1emx0?=
 =?utf-8?B?VzQ2WTRiREpJSUJ5eDNsMjV3T3ErMzlvUVN2S0N5dXBsZ1VsM1BLRGFJU0ZL?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e0b14b-4ba0-4240-daa2-08ddcb54c121
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 08:25:03.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OsIlslk6HF3252Jf1xeuiVV+/qZ6Ehp69oHW6GYBLmvhdARctjn84GtGbGocWP9LmH7fOzfe+7rGGjOMN/mQYwnUmaWhQKkw+XZSsys0jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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



On 7/25/2025 2:21 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
> freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
> existing function. The DRM layer will still have a pointer stashed
> away for later freeing, causing a invalid memory access on driver
> unload. So add a helper for releasing the DRM action as well.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ffca1cea5585..472cadcfc4dd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2222,6 +2222,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  	return bo;
>  }
>  

please add kernel-doc for this new public function

> +void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo)

do we really need xe? we can get xe from xe_bo_device(bo) if needed

> +{
> +	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
> +}do we want to use this function right away in xe_managed_bo_reinit_in_vram() ?

> +
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  					     const void *data, size_t size, u32 flags)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8cce413b5235..72f4348d0d52 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -122,6 +122,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  					      u64 alignment);
>  struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  					   size_t size, u32 flags);
> +void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  					     const void *data, size_t size, u32 flags);
>  int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
