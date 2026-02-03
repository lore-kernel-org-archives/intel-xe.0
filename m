Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC3E8B361
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 20:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A9310E236;
	Tue,  3 Feb 2026 20:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjLttfEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5C10E236
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770151122; x=1801687122;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KriW4Mfhc4LAGN5bB/ZUB6pFCWn5Pn4PnAvAtmw3HP8=;
 b=jjLttfEQdxkVENeNadyGu7vhrr7wopJPSatUl5L0CrLVdjdxzQLBjbZm
 sV4QNAr1su3wMr8ZSrzPu4b25tVmZ1Pq3f6HjbkJYecy4CAUVlLHYPA1C
 0SfS7KNgDVmtUVB/8S9sB+rWX71nvU1du9yCI/oa0Eoh181P4m5B1RFHP
 19H5/SjBEFchF84H02b0mfvKSaatOwxBRZG80uyhan4neXGd1ojP0fJzO
 U3eR18MFC9fw+L4p3yCH8mKruhfhE+cTPr1LDy+9RdmjPf3DRC9YXdCcr
 ZS8TPSprTjvTP3dIhMLDvbDntbVVSmP+KUlMsKGHiOLYil/beeN9zQHZp A==;
X-CSE-ConnectionGUID: XbeZP/pSSq2bDwEJFD2IrQ==
X-CSE-MsgGUID: SUFQJvR3SuOvn7nK6wlhPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71231334"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71231334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:38:42 -0800
X-CSE-ConnectionGUID: zXt6eiduTPGUqG5Q4oP6jQ==
X-CSE-MsgGUID: Kqg/qhxqQ6+BcKe4tsV8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="240863623"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:38:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:38:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 12:38:41 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:38:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlUpOQT1WDi7tKHv9+YjfUAyJ2c4VARG2k8Yb5rSar4Pg38UpNi9J2jurK5fCwQFLHNKtuG9dGaMCHkTNuX9VAOCEaL+x5lQ7FVncM8Fp3XySDCSZwyKzJPOcOjHhj52hmDn7U6kWE+vYsv9RqXQDiJYvlep6EB88ZavIOk/4u1TcjlKaHIfAK4xlXvu7H+up3l3zp4NFKvelO575fNg0PPogskF+lJjsocDS4OLY0zLLHzwTeoMDU5byn1bkRV3pqL63PD1z70qjZNwMMfGYx9sN/gGVIDUKC3oHxeZ5N8M5PRdBu6kcrlWG0QIAqUYdj92uHJn38dzleehyYyH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4TQr0xkN+Qrzwgr/74EMs5FfF2QVkwltnpKZ2EMVUo=;
 b=BsNAc/5fmVR5HmM2CUqVTUo9bg2v5zoH1zVT0j8sQdwjbzZK0MqDQg1BGf+Ked6NafVJrxYMqrkevSkGtGF1MOybqW7S2Fi69a8gY55hNR5AFxn0ooyPV1ETqfPAhrgsaALnfcf4/FIrh16YtmkZ9Ow4kQd//kBtTw5asq74egLaMrvQ9V1yNMmpciISNhG//UFoXGgFf4UKKQh3A1MJkt+bmc2LJmz3SDvnKqByYw5Gh3/TA45Lf8Blxu0dgQyLXbrELn5GCd5DBhDfuTWUuVz/Uw/kDbVpb7UK1arVNQ4xdnR0zzzPSm0MhE7H0CARXBOVE4NygCY1fLIoXQy8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 20:38:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 20:38:33 +0000
Message-ID: <a887ee18-b652-422b-92c5-5faf15f09cb4@intel.com>
Date: Tue, 3 Feb 2026 21:38:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/configfs: Fix 'parameter name omitted' errors
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260203193745.576-1-michal.wajdeczko@intel.com>
 <aYJSCAepz3ORravX@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aYJSCAepz3ORravX@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0225.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e835b56-fa4a-43ae-957c-08de63643287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlQwL25jSWhoSlVHS0FTNzFiS1crR2xnNHBMd1NldEo3RmtBUmhJYUtRU2w1?=
 =?utf-8?B?QzFGTXpoUE5BL01mVHlWbFFZYkFtbGI3SmVacDZwQVZtRkhmd0V6TDdNZWE2?=
 =?utf-8?B?NC84eU9lN3ROYVorWE8vK08zY2w4OExmZzYvaFRYK3g5ZW16QnFEWG9ZTzVJ?=
 =?utf-8?B?Q0FCQWNLQk1reExDdVJjN2ZkNVB5bm5oVTFHdXNsNUFwY0R5VlJkS2NpTjZM?=
 =?utf-8?B?ZUhBY2wwYWE5TGY2cWJucGJEMUlGNHBDeEE0M1pDODZlK1VuRUVaRUpaRjBo?=
 =?utf-8?B?dXI5VE4rWGg3U2JMRFQ1ZUJ0bGNwN2RhNXRYNmYwbExFRFR0RitieHJRNDQy?=
 =?utf-8?B?SXF3R3gzRlFrbVJmSmtlTUNCR3NhU1NSZ2RMWCtEd0VZZ0VqekVGd3U0TllN?=
 =?utf-8?B?MGVaOGVmNWgrbU5oSWNNT2ZmZUt1L0s0QjAwYjRYK2UyWmlxdndQakZxYTZS?=
 =?utf-8?B?RHRobWlhR2RYNXlxRUFvSWFUczlIaXUxeTI4UEh4SUk4bys5d2ZVaHA4Rmtp?=
 =?utf-8?B?Y3hxaHpVWk9jOHhnMGJpMzRBOENKMmV6TVh6cGd2UngzbTNFY1FCVXhmMTNZ?=
 =?utf-8?B?ZlZGYjB6a3VtTm1aaHZzMWQxcFBlWW9HTzZGVE9qZWR0VXJkMWFkelJjMXQv?=
 =?utf-8?B?dzgvVVNiWjZ2WWRORG40cHpDT3JKUmp3dG9GOXgxZFB2UmY4Vm15TWdYc3hy?=
 =?utf-8?B?ZlQzdER6RkJnZXVjTHRDNktCNjlpdlBQNCtkb0l4dFVJRzdleCtPSkJrTFBu?=
 =?utf-8?B?TUx5ak9lZWduUFRtaFNwTlJUdGY5aHltVExoejBoZ1A0R25BL0VNcGtsdWJn?=
 =?utf-8?B?WWVidU81SVNXMWM2TmJJZ0h1MFN6MndSNnRjRlZma1pkZlV4S0RQVzBUZWFa?=
 =?utf-8?B?bkdiVVhhazM0dTdzbnBvN0J2K05TKzR1OHNmejZXcFBXeFZlMGJ6UTNmNSsr?=
 =?utf-8?B?cjJuenVwNXVkRndzWGM2NG11elB1Y1FHVTQrNWVQL0hnUFNaZjRXZlJLQlNs?=
 =?utf-8?B?ODJzVm1adVVUbnRJNytzZ21ZR2pjVGlTY0NYelRNN1hLMldNWWtLcUVYbUtI?=
 =?utf-8?B?cWNkaU8yZ3lhczRKNitNRjhIZ3RtbWsxWlJpZEhwWWhabEo1YXkxTU92NCtV?=
 =?utf-8?B?VmtUWGRCVXNQZGExcldldDFZcTNuV1N4cUtXQU9Rd3F4RTIrRDNDYmZHTlQv?=
 =?utf-8?B?Qm5Qck0rd0hrbFdWbGo3Q3htdC9hb3dmdmJYSjVXVU1aYWdrVmhDZXRqV2hB?=
 =?utf-8?B?ZlZvb0YraDAwQzQ0eXB6cjVNQmRja3l5ZnVrUmdTVXdBT2pvTkI2NUM1WGQw?=
 =?utf-8?B?Y1VUKzhZaWtkNThMckFIUU9QOUF2TXh2czlDRlFoaEhUUUhHRjA0WmgrTnBu?=
 =?utf-8?B?eGlrNnB6MVlkWEY1UTM2VVEwZWIzM0dSSDRINGxmZExucW1reG9oeTZzUWhJ?=
 =?utf-8?B?VWdXZG5LSGdPSDZCcUprOWh4M00weUlBU0ZRd0ZkMmpnMkxUN28rWElNVW0x?=
 =?utf-8?B?aVFXL2RkUmQyRVNyK3oxbHdNSUlNWE9YclI3K2h2V2xDYXJ4K0FmemhZUWZN?=
 =?utf-8?B?ZFJSdC8zSktxK2drdGlDWFdqcm9peHhZQVpTTndOSTFWdUx5VHJvaXNVdzRo?=
 =?utf-8?B?NGhHRWd6ZFVocWpIMmJJSDROOGhRcUpmVHJVbW13bkpvQmxnUmtYVTB6MUdU?=
 =?utf-8?B?Ulk2MkVBWU42ckVLWjdSZFkzaU5UdVU5eVA2RTlTN1ROUG9xWmVONzdLZ0hj?=
 =?utf-8?B?SS9WVis4OFBubEZGZXZQZjFtNVV3bDdFYUQzSndyU2wwOUhGYVJMU3BrVXp0?=
 =?utf-8?B?MkoxRXV5WjZJTEdFb0NUNzZDQWdqU3ZVR3J2MEdrbXlRTnlTeTZtWWJJKzhF?=
 =?utf-8?B?RDhpVWViUEs0T2VQZm9HYVhPVTlpQUF3VStxdHp3aUhEN3pNd013dWdob3N3?=
 =?utf-8?B?akRxVDJ2QURwSW5LajNEVlhvOW9hdkpSWkcvZEZwYTZReGJJMlgyMndHMzg0?=
 =?utf-8?B?aTBrNzhGdFhBVDJPRFhDL1BjK05QYW9ENjM4RTVRQi9iRkdQdExydndaQS9y?=
 =?utf-8?B?cHNmUGxoUW81Ui9zTW9lUlM3bDl6QlcxZVk0VldlUWVUckFkOEowS3pRbFhK?=
 =?utf-8?Q?Ge10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxsNzZ4T2tzdkVwUUdoL21XVU1XOTNhTlQzS1lNdXcvc0puRDlFSTVpTjcr?=
 =?utf-8?B?UENPb0lYcWNUcjJGL3lPQzUwQjIrdUhuQmQ1MHNYMTFGRzF3WVpUTERRcXov?=
 =?utf-8?B?WUFHYTVyZHJZeGFFWnZPbm44RnVwTHNkU0NGdlZPS1lXSWNVeUtSTnhUTk5s?=
 =?utf-8?B?Q2RrUGFkYk9kZkZyZjZuMTZQbG5BRUk5cUZHWUpxMGdsM0ovSmV4VDVaVW5K?=
 =?utf-8?B?YllEOWk4MmVXaFloblF6ZmE2eGMvc2MyRzgwL1N4ZktlLytvMlNQV2o2Wmxk?=
 =?utf-8?B?NUdXWG96Mkw5clphMVdwUHpLenJtLzNaMytLVUpDcThNWnc1aVRUMjVZb2gy?=
 =?utf-8?B?K2RSR05iSjd1NWhFR0NpR3RlQ0ZvaVByQWNXYmRhcEhUQm5JeVRYNlFhZWIy?=
 =?utf-8?B?ZXZwaHdTTVZvd21zK1Y3VzEya0NabFZQdjVZOVFKamNyWGJFL3lhVkQyK1VV?=
 =?utf-8?B?Z2trRUF4VUFMQ1NIZTY0aGpNQ1JMM3dnUVVFS0kwU2gxWjhhOUg1WUlpSTg1?=
 =?utf-8?B?QzFXaU5QY21GYkY1TmR1VmNlZjdwYzEvUDc0N0RpOGh2djZ5cG1uT1JBQWI0?=
 =?utf-8?B?aEVQVC9vbVFORnZTS25DbG42OERIOTBtODhsNzRFQTEvNnAvbTE4RVZwR3Nj?=
 =?utf-8?B?dFRkdk1lMDRZTFo0dXNBVEMzbWpPM0xickZsc3dJVFI3Qk1ucEtNQnBDR3Ex?=
 =?utf-8?B?MmlqenFYNEpwUk9IdnZQT3JERlIzbkdKNzBDekRwM3hMTTZRVmlLcGZIdE93?=
 =?utf-8?B?SjRhWXFYUTFVeGpOQTE4aDlRNklLOXN3TlpMODRGbll6TGYrejQ1NXV4dUxx?=
 =?utf-8?B?eGpjSUpqeFFKTE54cE13a1RZVTcvTlNzSWF0S1hIbjJLQjdzejlRNHhiY0Nk?=
 =?utf-8?B?V2ZRdU5pLzZjd1JsOHErTGNpQmxWMTM2cUZiMHVMNnN5YWdZS0FrSmVuOElT?=
 =?utf-8?B?NDg1M1R5MUF4enExdXN1b3F1QzdHRGlHanA3bVNZejVreHBjWlZXMk1ZUE4x?=
 =?utf-8?B?QUdUTXQ4ZDF0UjFOQzlsM1ZHZGtpRmlZMzZyQ3pVV0g4enUydUc3VWpsTktO?=
 =?utf-8?B?YW4vU2I1bzhLU3Jhdjk2cTdXeW5Ob0F5eW5Td09EVGRFRndvWWlMUzdmc1k0?=
 =?utf-8?B?cExsM1JpWVVGTjhyMWIycUpTUkl6NHZoSTdHcVJ0dURuWlkzVEtuVHdRMCtr?=
 =?utf-8?B?aGMrajY1ZVZhemMrcVBSTmtqdkVaNWdDb2w0RkJoQTNueSt0ZlZ0NXl0UFpD?=
 =?utf-8?B?RC9OeTJyVjFLWnJaV0xaVkM2aWdLdVJCYkpzczlMbzZkSHIzWGVRUmEwZzhk?=
 =?utf-8?B?K2hwRUNiWCtHMWljb0ZQWnZvWm82ckZodmpWTDdIMWxVUDNJeHNxemlHN0R1?=
 =?utf-8?B?ZGlSNk01Q3JCNmNpSitxbktxNlZHWEdwMUV3VHpvSml6MTB2OXRJcmVrUStL?=
 =?utf-8?B?L2tkb2NpVlc1ay9OSW1BTGdxSm5ySDdWMHZFQk5WTFpQWERFSVdFWlRUbk10?=
 =?utf-8?B?cVRmZHJlNFRCMm8zaGUyVisweGtuQVB5eFlISWozQVZTYkZqZ2xlVmhHWk9O?=
 =?utf-8?B?WGcwYlpZanJ5QUZ3THRvL2lCWDRrWXFmcGVJU1FOamdGZFUwRU82Y2ZuNGcz?=
 =?utf-8?B?d2lsZDVuSnd0V29ZelBJQVNSOVdpTWdQcDBsU3VoNHVZbGxpcWlnaDB6U1Nk?=
 =?utf-8?B?cEthaGJiL0RXSUl0MHk0bEprRHVtVk1qamZiVWdqRTB4OXlTbjFJdzhlVE5V?=
 =?utf-8?B?VVdhalhkU20zM2pYM2l2UnlPaWFUd3ZUYVV3aGFHMkhqakdXSzJDb2hOM2RF?=
 =?utf-8?B?K0Z3K3BsWndyRjFnZkdDQzZ4TU5EanBNczdiVVJ6VHAzV05FWWVGMm9Nb1R1?=
 =?utf-8?B?cGZpVlNrdkk1MHcvMXNueDVTaUJaWFdCaWFTUWRKT2E1NHN2cE5tQjBic2My?=
 =?utf-8?B?aVBYZGkxa2pDcmw0eEsvK3BWejVqblF1RksvaEpSQi9RYVl0MUxjOWIxNEIr?=
 =?utf-8?B?U3BHT0dsajFkMXRseUIvVms3T0tpdkdFQlpyUjNMNWpEN0VtZ0EwUStLZUNi?=
 =?utf-8?B?bnpvMHNXQm9QMzh1cWZaS2hLUkVxdFBJMlA5R0ZCeFhyeE9JZEh1Q2p0ZE03?=
 =?utf-8?B?M0d6UTNucklIQWNnYk1GME5RdjVVWW1GT2FyajlJc0JDSWx5RGtrMFM5elZE?=
 =?utf-8?B?dHlTL1EzMXRmaXgwMFBVcURJNEUvR0ZlNWhSSWdxNHVjbkQ5cWNYYWRpNUtQ?=
 =?utf-8?B?Zmh1NjdMb1FpTVNsMHQrOVY1OFFCc0pjdktvRnlFY1cvZUdNYnR1cCthMDVV?=
 =?utf-8?B?UnVrY1JkSlE5azRsc1gvSU95SkVFTERvRzBnMVRYOFpqRjlTWkFxbjlhWk15?=
 =?utf-8?Q?bHRTMSyF3LFgK2ZI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e835b56-fa4a-43ae-957c-08de63643287
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:38:32.9737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWxdngt7BtElAUpZ7/ass+43Pjd+XflzQ+A7psHiCFuysGxyOYrdyJQ1wu5UkCoWvsES38/cSe9jlwSFAmnQVhEcYa+pUAyrNaYL/KQLKOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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



On 2/3/2026 8:52 PM, Rodrigo Vivi wrote:
> On Tue, Feb 03, 2026 at 08:37:45PM +0100, Michal Wajdeczko wrote:
>> On some configs and old compilers we can get following build errors:
>>
>>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
>>   ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
>>    static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>>                                                                             ^~~~~~~~~~~~~~~~~~~~
>>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
>>   ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
>>    static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>>                                                                              ^~~~~~~~~~~~~~~~~~~~
>> when trying to define our configfs stub functions. Fix that.
> 
> only when trying to define the sutbs?

stubs are real fn definitions, while fn declarations have relaxed requirements

> anyway,
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks!


