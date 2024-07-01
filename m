Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C29C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 14:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06E610E444;
	Mon,  1 Jul 2024 14:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPIDDmye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75F510E443
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719843384; x=1751379384;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=xWwMFNAzTGZQQ/GaJ7yMmrWEnoIzymU9zpOgmNJCBAg=;
 b=YPIDDmyere58JtbMIXP2Qk4v+y7wf+HCD+HssoQRqH5zTzb59VLLqjsH
 acekCroO+m2xIpo0e1aHYjrE56OdrfCv3M5ILLhuniTpZiRbHpQzltoFD
 N/CiRtO51S0Jom84ziLfx60sQl7N0iVBZ/S/7z3iDOGY6Qg01BwHk3BeY
 m6q+Pk6poEkiuUrOpPLCduGrU/iW2fNA5XANK+YHebcZWmWVtwRFTCSg7
 1J5ivbo9jZg1xVCpT/PGvn/kGkFxgW1UBBCG9KmcDDWJvD+fmbkUoMdvO
 NNmL6xdcTim6uenldfKThVuvweLhvWlktlmgtiB5cBKlfqyZzViGx4R9b A==;
X-CSE-ConnectionGUID: A+kQX0e6S4SYQhbADiHD/w==
X-CSE-MsgGUID: oQS3WPSHQc6y4/fKPA+J9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="12340040"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="12340040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 07:16:22 -0700
X-CSE-ConnectionGUID: 6Dn/FULLQb6gPkkySrrhzg==
X-CSE-MsgGUID: UK3HayXiSjaoh4USHDXdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50498596"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 07:16:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 07:16:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 07:16:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 07:16:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 07:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abIy8jVSTw1mOO3dh9ilrqJ936lxHTH1hG/BgfkYYBfxG7l2/DJyafrG1JsmoystXn6wAzbeBIR9R5VLr5bIGC6ZXpYdhWpftjW35rkocFpjR0vW9NKY8vkm1n+D8VGb7+RCPwS1m1XtM9DcDScJg4YMGBGqCOVH3lNzok3oXfaZf+/ILuEYb5T35ldoXj6OQ+KbrVn2Jp5qTmMekdAVvAREyrJjtFR2G1ncxdYKUs34A+kqamM360SQcThEVvVfa9XnN8FmRWd7e5vmc2KLFAwpdXEMZDLhk/CRTqwugkP8rgogpQqWqobvCO/mi+0hG0NC2ukLR97u1QzlWuoN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoRn4Zd+3nYKPfyPEkrrn1Mj0grRzhu4c8pmblTDN54=;
 b=Nh6ja6TMqvoHNyeBF0i5oHkP5BjrEGPlK9fN2YxR4etHx1X8dFmWQUxUeHnACPX7+HswG/0HFN/LwT3igOoNTVr+cQnLkcN+eh1ZdO6oVLm4yQSaJK57lTT1wNkSdjwBKn59pdOoYdpu75/s4uq2eeLdaB7tX1dNwN1AAKV/ZdtVYVE4UeswX33Ess3lzLk1/f35jCBYEbqq9g+1etlR1u1fFhzLtG+jOpL8TDMOgyrLpQ6+2/QjlvMJFqJztxQZQH4lT6i36sZ+wo8YfH178+vo9l2Vwbd3IJl0dfjQltsKLNk2vRSBsGgOZulF/6T9MdsihrU5Z4+iN2FnxkwClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8349.namprd11.prod.outlook.com (2603:10b6:806:383::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 14:16:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 14:16:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <171936940561.158964.15213934374872525955@a6498e030952>
References: <20240625202652.315936-1-gustavo.sousa@intel.com>
 <171936940561.158964.15213934374872525955@a6498e030952>
Subject: Re: =?utf-8?b?4pyX?= CI.FULL: failure for drm/i915: Skip programming
 FIA link enable bits for MTL+
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 1 Jul 2024 11:15:51 -0300
Message-ID: <171984335154.17689.11914869242778544029@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: c60cb970-b65b-4349-49ac-08dc99d8559d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXp1eVM5a0pjejZNSjl3eGErakpWN0hPSFVMcXhnZVhRbDJpclFpY3JteXdn?=
 =?utf-8?B?U2xabGxkV0RKS0VwSGphbjFzRVhRbWMwTU1KNDlXUXBkdldBRUJwdzZmSitz?=
 =?utf-8?B?QmRDSVQwejRkcFNFa1RNckt1cXlMa2wrSHg1NWVobjBGcVZodks2NDA0ZUFt?=
 =?utf-8?B?cEcxdXVRMVZhRTRGQzJseEU3ZS9RclF3QS9ZYS96SEJwcWg3ZGdvQVI1eXFI?=
 =?utf-8?B?OGp5blpkVUJLYitKWVNxQyticzRCTlhibG1IdEZ5WW5xS0hxTFJ0Yi9jNU5U?=
 =?utf-8?B?dTV0dlRFbTdvRHhhUEt6dFFJU0F0V3ZHa2JHSS9IamRaMHRHaEVwU2tnMU83?=
 =?utf-8?B?V0wraFB1L0pnV0xvc3VHTWZJc01ZdUxhNTh1Q0dpWVZCOUl1czc0eWtoUGps?=
 =?utf-8?B?SldTeXJHS0p0Z0t2a0NKeTdFa3krdUh4cWRveHhiak1iUXpKWHRjT3puMVRE?=
 =?utf-8?B?dHFYa1l6RjdFZHNMODVUS1hlNDhTbW1FOGxocUJOTmJKaC9KZVdINFFjQVhi?=
 =?utf-8?B?WE5rN25nSVEyWVdjMFlKblg4WDNKY0JIQVNqdlhiSUtzYWNHbHRFVm5rNmpX?=
 =?utf-8?B?YUhsTkc2MkNMY3Y3UnlLY2ZHeXJkY05BS09oaTNoL0VkUGVRbC8wcnA5aFl3?=
 =?utf-8?B?TW81ZkcyQ2ZNRkphcUh4QzlQVmphbzRUU0VxNTFRcm8rOVlmbEVmWFlRMTdT?=
 =?utf-8?B?L1JoS1RndlNuQjNKZ0FLWmRKczQ2dVpFcmY3dUFNS0F2MUNlYnpXc3AwUFo1?=
 =?utf-8?B?cDhCT1V6QXFzcEF5VUVzdDQ4UlVTMXdYbFF2WjFQNjU3RUZSQ2xHRGJzNWVQ?=
 =?utf-8?B?S3c4eXhKOGlFdFQrSkd0Z0ZzUHRHdGhxNVBTcmVGUk01ajVzNTdFcEc5R3RG?=
 =?utf-8?B?UVI2NVFEQmt3ZXJnaFl5RDlmNHRtVWR0WFo0M2F0MSs1cVJhZmFRb0FGWWhs?=
 =?utf-8?B?TE9JTU5kbUk0RG1VMUt5dFYzSkYyRllRbHI2Yi9tWkRMUU9XT1JybXFCYnRG?=
 =?utf-8?B?eWpDNTV3T1dNd2ErUWErbytyemo4VkRyRUZVdzh4a0hhN0NVb0J5THV1SDUw?=
 =?utf-8?B?by9nODdKNDhndmxSSDY1OFBTTzV4ZnZ2WVRWZXJvMjlyT1lpVU9MTXVJaTg0?=
 =?utf-8?B?cGdXZjNxOXI2WjUyV2hMREM1NVRkd0ZJSENtQnpsZHVuNlQvWDBzQmZQUXpJ?=
 =?utf-8?B?bEFhRjNMYzB4cWVpTlNUVlY3S0ZrQ2lnSUNNOUFpemlhQm1oUWplZ3BuZFp0?=
 =?utf-8?B?YXFId3Z4eXZCUW56ZjM4dU5ab1p1Y2g5dy8zUkducGpnSU5GMHZYaWRjdHR4?=
 =?utf-8?B?L3JzT1JFZWsxR0dGbXZJNmtwcU5wNTh6eGpFV2lIeXFyZ1JBaWFOaWF1QXNF?=
 =?utf-8?B?NE9GS3JHSTRMSGN4YWV4akppV3MrcUVyR0xncDgrWlVCY0UyY2lRM09KKzJi?=
 =?utf-8?B?c09BSlN1MXVuT0VBMWczdGJEbCtDbkZnQ1Q1U0IzQ2tWamJJQmFGQnZGREhp?=
 =?utf-8?B?N3UyTVVETk5MWWx0K2JwWkR4NTNScUU2ckxnUXVCUWNaSjdDZzhhQ2xTQkRo?=
 =?utf-8?B?Y0hMdjVySGMrS3ZEWXpma0pSQm85ckxsNklpbWhpL0x0RFI2SS94V3JGbi9J?=
 =?utf-8?B?dzVDSXNCbWxhTVZVZG1weStoSVU5NEpONEZZbGxXU1RPTTlERzE4ZGRuNG9C?=
 =?utf-8?B?MkRiakkvQUtyMXVzMGxObVk5MEl5Q29NdXhGQUlaOGZ4dVgybFZNMkIxVlAy?=
 =?utf-8?Q?uT1mJDg/PImmHt3oV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkEwRlpYZ2o5QnBjNS9ELy9qK1RYVzU1SllyMUljV2RlQktOaWlrb084eEtP?=
 =?utf-8?B?WHo1elpHdkVVeW9JSVNtdjgvc3VNd0UrZHJlUzA4cGlDOTFYTTczdHlpSStI?=
 =?utf-8?B?eWcxenFqTHpIellMdFh3SU4wK05Rb3BjUGU1Z1ozcjZrUlBkanYwRk95MVg0?=
 =?utf-8?B?eVRFWHVkemNIUHFzMXV4MlNLVytXRlo1ZkNzTGYvWjhGdVFkSUpHM2hNZGlB?=
 =?utf-8?B?aWRidE43bllJa3N2aFJ3WkJEWEtqSjJhTGVsQ002QXVyVm9VdkpISVZTY1E4?=
 =?utf-8?B?dWd3Q1owYzNxRXdCVDFmODF5YUV2NHJpMVlKd28zQmNDSTl6Umd0ZXpQVTFt?=
 =?utf-8?B?TFhyejFNVFZpQjNsaENvSy9ZN3EwQ0hoUTVLNVZJaVh1RXRNRFF4cG44YTBl?=
 =?utf-8?B?S1gzbFRjQ05YV2NzRjJvbWRpY25pdzY4Ky9ERGVsWDJWa0JwL3VnZHpXZ3dv?=
 =?utf-8?B?aDk1Z1gvdE1mUzhvcHRSS0lEZHRiVHI1ZWxnc1JRQzFzODBYNGtGOXdlYXBP?=
 =?utf-8?B?dVhZcmJxb2c2Y3ZOZ0NjRW1OV0llRmJodm5wVkRlUlBFUm80N1lpblpmODlx?=
 =?utf-8?B?OEdrTzFmTElVZkhqaThVb2U0M25TL2FqamZvR2dsYXpMRiszcDh5bUhpZ0Rn?=
 =?utf-8?B?RFVoaHhZMzQ0cGFlR2tXSit4K0NzQmlqOEJzREpuZWlRTFdLdjlhWGZ4bmdt?=
 =?utf-8?B?Y2NEOGhlaHBvRVNLNFN5KzJlejQ1SGg0aGZtdThwWjkrM0htOE8yRTVyQ3Zj?=
 =?utf-8?B?SUZZSlZ6bXpiTTY5Y1lEVjFWYzdxUjJUd1ZzbnZTcjdwbWxiY0lSeVluaFl4?=
 =?utf-8?B?OTRPZUM5RWEwb0VKWGZ2VHBUcWZBSXIrNEhHWXRrZWdZTlhqR1RoMUtjbnhG?=
 =?utf-8?B?TFJaMnRQUkpjN3c0eVpnUVU3bUJBWnR1WGM3MU1IeVljUW4yY05LeFptSExx?=
 =?utf-8?B?eWM0cXpNN1BxNE85eXRDSDJ1NGQ1SGMxNVhuV0xGYld2Y1g2WnJpVnpTZWZ0?=
 =?utf-8?B?c0t1YzBMRkNzWmpkUitaSUNMVFd6cjRaN1owR0lhUWUxdlhZUGF4YUlmd1cy?=
 =?utf-8?B?L2dIK3RxdlV2MWJvYnhRaG00aWh0Rm9lTUJWMGdmTkxadXlzdWllTVI5T1Zn?=
 =?utf-8?B?QXJyNkswc3NGb1B4VCtiK0szTzl4WlpMOVQxQVFrSVU1Ni9iT0Rxa0ZOWEVI?=
 =?utf-8?B?UFVDRDQzSEdkbDRFdkRreG5PdmQxWEJVV1I1aks5UXp4ZUorWFpHNWhMMUlQ?=
 =?utf-8?B?N0pDdStzUjJ0T0t0Vnp2VHpXZDdKc3ZEZEpzUWQ0aFJnYTlBVWkyY2RidHN2?=
 =?utf-8?B?cnBESGFXNHU5OWM5R0NLN3ZqalF4ZzdCR3FaNm80YUUyd1UySnNyMnBYNHdS?=
 =?utf-8?B?VHRndTRFSUlzRmpDUGxQb0FPRGRnN2Uvb0ZkNVRZMzN2TElCbVYxV1luQjFj?=
 =?utf-8?B?b0E5ZE96ajNGM1BTclJ0ZjVMeU5wL1orek1NRFU2RW1ZczFzM2xSYVhZUjhF?=
 =?utf-8?B?U3I2NVcxSE9aSVBCM3RDVEtwa29lcWxPN3ByYWlBTnVYb0RKSlVWYU5qdzF1?=
 =?utf-8?B?L2VJNUZWVDdEN3dkWGllTEowM25CcXFIRFplVnd2SWpBSjhVTXhUTmhJaERG?=
 =?utf-8?B?SElod2xCWGZ1T2pIOE9IL01wQkJ2Q0xFME85RHJzVkIvVzJhMjBFVGxCdzN4?=
 =?utf-8?B?bTBHcWdMcE1aNXFienNWNnAweGUrMGt0QTJxY2QyQ2hIK3BTSzdGZGFWOTRo?=
 =?utf-8?B?b0kwQm81N3dDaWtiejh0T1VEVkh2emZ5YlAzZ0JhL0hLTWQ2OVZmQXlhazZO?=
 =?utf-8?B?YVBONVFoelhkbjZ2YjU2bDZqRmxWODgwZStkTjNJYW5MbzJ5WXhZOTZMSEJM?=
 =?utf-8?B?Z1V6L3BJMUtTRFpCR3hDTDhGajFnRWdxTmhOd3Jyc3ZlQ1hNc1lXV3RlWXpw?=
 =?utf-8?B?VVo2UnhTZFJ1ZDhiWHcyZHFrN2Z1M1F6RHgveFJyTmYvZnpQMHNCZmhHZ2la?=
 =?utf-8?B?dG9uNTQxc2Y5cC8yeTl4bWtaWGZqU1RGd1ZoZ3FBSUZlR21YcWcrek1CMHNi?=
 =?utf-8?B?R2ZrUE5mZTAzNHUrWjA0ZHh4WWZoTVhiSHc5NlE4QnFzV0k4M0dzeHJlYWdX?=
 =?utf-8?B?MktmWDJYWlVzZGR3S3p1R3Q0NlhnN3djRlBVd3RxNXZTQmVYTnV2aDBwWGYx?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c60cb970-b65b-4349-49ac-08dc99d8559d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 14:16:01.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odkU3daX4ot9Q6ByeFw4XS4a1HvB7MvncE8ahFmronHblab0N0UOujIjNxtrb3pK9Qa7Rui1OUKKWDNzBatGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8349
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

Quoting Patchwork (2024-06-25 23:36:45-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915: Skip programming FIA link enable bits for MTL+
>URL   : https://patchwork.freedesktop.org/series/135388/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d=
_full -> xe-pw-135388v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **WARNING**
>
>  Minor unknown changes coming with xe-pw-135388v1_full need to be verifie=
d
>  manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-135388v1_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (3 -> 3)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1353=
88v1_full:
>
>### IGT changes ###
>
>#### Warnings ####
>
>  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>    - shard-dg2-set2:     [DMESG-WARN][1] ([Intel XE#1214]) -> [DMESG-WARN=
][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f=
81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-=
crc@pipe-b-dp-4.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg2=
-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

Unrelated to this patch, which applies only for platforms containing
Xe_LPD+ and later.

--
Gustavo Sousa

>
> =20
>#### Suppressed ####
>
>  The following results come from untrusted machines, tests, or statuses.
>  They do not affect the overall result.
>
>  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
>    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][3]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-lnl=
-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>    - {shard-lnl}:        [SKIP][4] ([Intel XE#1399]) -> [INCOMPLETE][5]
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f=
81e0d1d172aa0f37511bbe4d/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-mt=
l-mc-ccs.html
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-lnl=
-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>
>  * igt@xe_exec_compute_mode@once-preempt-fence-early:
>    - {shard-lnl}:        [PASS][6] -> [INCOMPLETE][7] +2 other tests inco=
mplete
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f=
81e0d1d172aa0f37511bbe4d/shard-lnl-4/igt@xe_exec_compute_mode@once-preempt-=
fence-early.html
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-lnl=
-1/igt@xe_exec_compute_mode@once-preempt-fence-early.html
>
> =20
>New tests
>---------
>
>  New tests have been introduced between xe-1527-edccdf441f1e061f81e0d1d17=
2aa0f37511bbe4d_full and xe-pw-135388v1_full:
>
>### New IGT tests (4) ###
>
>  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
>    - Statuses : 1 pass(s)
>    - Exec time: [9.71] s
>
>  * igt@kms_plane_lowres@tiling-4@pipe-b-dp-4:
>    - Statuses : 1 pass(s)
>    - Exec time: [9.53] s
>
>  * igt@kms_plane_lowres@tiling-4@pipe-c-dp-4:
>    - Statuses : 1 pass(s)
>    - Exec time: [9.44] s
>
>  * igt@kms_plane_lowres@tiling-4@pipe-d-dp-4:
>    - Statuses : 1 pass(s)
>    - Exec time: [9.48] s
>
> =20
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-135388v1_full that come from known i=
ssues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
>    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1214] / =
[Intel XE#324])
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061f=
81e0d1d172aa0f37511bbe4d/shard-adlp-2/igt@kms_async_flips@alternate-sync-as=
ync-flip@pipe-b-hdmi-a-1.html
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-adl=
p-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
:
>    - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1231])
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel X=
E#1201]) +1 other test skip
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel X=
E#1201]) +1 other test skip
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.htm=
l
>
>  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel X=
E#455] / [Intel XE#787]) +3 other tests skip
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
>
>  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel X=
E#787]) +13 other tests skip
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
>
>  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel X=
E#455] / [Intel XE#787]) +5 other tests skip
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>
>  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a=
-1:
>    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel X=
E#787]) +8 other tests skip
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a=
-1.html
>
>  * igt@kms_chamelium_color@ctm-max:
>    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel X=
E#306])
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_chamelium_color@ctm-max.html
>
>  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel X=
E#373]) +1 other test skip
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>
>  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel X=
E#373])
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>
>  * igt@kms_content_protection@content-type-change:
>    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel X=
E#455]) +4 other tests skip
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_content_protection@content-type-change.html
>
>  * igt@kms_content_protection@srm@pipe-a-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#1178]) +1 other =
test fail
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
>
>  * igt@kms_cursor_crc@cursor-offscreen-512x170:
>    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel X=
E#308])
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions=
:
>    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel X=
E#323])
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions=
.html
>
>  * igt@kms_flip@2x-wf_vblank-ts-check:
>    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel X=
E#310]) +3 other tests skip
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_flip@2x-wf_vblank-ts-check.html
>
>  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
>    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195] =
/ [Intel XE#2049])
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-435/igt@kms_flip@blocking-absolute-wf_v=
blank-interruptible.html
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-463/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@p=
ipe-a-valid-mode:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel X=
E#455]) +2 other tests skip
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@=
pipe-a-valid-mode.html
>
>  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#1874]) +2 ot=
her tests fail
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-9/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-c-hdmi-a-1-y-to-y.html
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel X=
E#656]) +4 other tests skip
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel X=
E#651]) +5 other tests skip
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.htm=
l
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
>    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel X=
E#651]) +2 other tests skip
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
>
>  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1158] / [Intel X=
E#1201])
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel X=
E#653]) +2 other tests skip
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel X=
E#653]) +3 other tests skip
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>
>  * igt@kms_hdr@invalid-hdr:
>    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#455])
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-432/igt@kms_hdr@invalid-hdr.html
>
>  * igt@kms_plane_lowres@tiling-none@pipe-b-dp-4:
>    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195])=
 +3 other tests incomplete
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_plane_lowres@tiling-none@pi=
pe-b-dp-4.html
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-466/igt@kms_plane_lowres@tiling-none@pipe-b-dp-4.html
>
>  * igt@kms_pm_rpm@dpms-non-lpsp:
>    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1214])
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-434/igt@kms_pm_rpm@dpms-non-lpsp.html
>
>  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel X=
E#1489])
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
>
>  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201])
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
>
>  * igt@kms_psr@fbc-psr-sprite-render:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel X=
E#929]) +2 other tests skip
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_psr@fbc-psr-sprite-render.html
>
>  * igt@kms_psr@fbc-psr2-suspend:
>    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel X=
E#929]) +2 other tests skip
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_psr@fbc-psr2-suspend.html
>
>  * igt@xe_compute@ccs-mode-compute-kernel:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1050])
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@xe_compute@ccs-mode-compute-kernel.html
>
>  * igt@xe_copy_basic@mem-copy-linear-0xfd:
>    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1123] / [Intel X=
E#1201])
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>
>  * igt@xe_evict@evict-beng-cm-threads-large:
>    - shard-dg2-set2:     [PASS][48] -> [TIMEOUT][49] ([Intel XE#1473] / [=
Intel XE#392]) +1 other test timeout
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-=
large.html
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-433/igt@xe_evict@evict-beng-cm-threads-large.html
>
>  * igt@xe_evict@evict-beng-small-multi-vm:
>    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel X=
E#261] / [Intel XE#688])
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_evict@evict-beng-small-multi-vm.html
>
>  * igt@xe_evict@evict-beng-threads-large:
>    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473])
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-433/igt@xe_evict@evict-beng-threads-lar=
ge.html
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-463/igt@xe_evict@evict-beng-threads-large.html
>
>  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel X=
E#688])
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
>
>  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel X=
E#1392]) +2 other tests skip
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>
>  * igt@xe_exec_fault_mode@many-userptr-invalidate:
>    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel X=
E#288]) +4 other tests skip
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_exec_fault_mode@many-userptr-invalidate.html
>
>  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel X=
E#288]) +3 other tests skip
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>
>  * igt@xe_pat@pat-index-xe2:
>    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel X=
E#977])
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_pat@pat-index-xe2.html
>
>  * igt@xe_pm@s4-vm-bind-unbind-all:
>    - shard-adlp:         [PASS][58] -> [ABORT][59] ([Intel XE#1794])
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>
>  * igt@xe_query@multigpu-query-cs-cycles:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel X=
E#944])
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@xe_query@multigpu-query-cs-cycles.html
>
>  * igt@xe_query@multigpu-query-invalid-extension:
>    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel X=
E#944])
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_query@multigpu-query-invalid-extension.html
>
> =20
>#### Possible fixes ####
>
>  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
>    - shard-adlp:         [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#32=
4]) -> [PASS][63]
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-2/igt@kms_async_flips@alternate-sync-a=
sync-flip@pipe-d-hdmi-a-1.html
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>    - {shard-lnl}:        [FAIL][64] ([Intel XE#1659]) -> [PASS][65]
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0.html
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ln=
l-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>
>  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>    - {shard-lnl}:        [FAIL][66] ([Intel XE#886]) -> [PASS][67] +1 oth=
er test pass
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c=
-edp1.html
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ln=
l-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>
>  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
>    - shard-adlp:         [FAIL][68] ([Intel XE#1874]) -> [PASS][69]
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-9/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-d-hdmi-a-1-x-to-x.html
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>    - shard-dg2-set2:     [FAIL][70] ([Intel XE#361]) -> [PASS][71]
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-433/igt@kms_plane_scaling@intel-max-src=
-size@pipe-a-hdmi-a-6.html
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>
>  * igt@kms_psr@fbc-psr-suspend@edp-1:
>    - {shard-lnl}:        [DMESG-WARN][72] ([Intel XE#2052]) -> [PASS][73]=
 +2 other tests pass
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.htm=
l
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ln=
l-6/igt@kms_psr@fbc-psr-suspend@edp-1.html
>
>  * igt@kms_universal_plane@cursor-fb-leak:
>    - shard-dg2-set2:     [FAIL][74] ([Intel XE#771] / [Intel XE#899]) -> =
[PASS][75]
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-435/igt@kms_universal_plane@cursor-fb-l=
eak.html
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-434/igt@kms_universal_plane@cursor-fb-leak.html
>
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>    - shard-dg2-set2:     [FAIL][76] ([Intel XE#899]) -> [PASS][77]
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-435/igt@kms_universal_plane@cursor-fb-l=
eak@pipe-d-hdmi-a-6.html
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>
>  * igt@xe_evict@evict-cm-threads-large:
>    - shard-dg2-set2:     [TIMEOUT][78] ([Intel XE#1473] / [Intel XE#392])=
 -> [PASS][79]
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-466/igt@xe_evict@evict-cm-threads-large=
.html
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-434/igt@xe_evict@evict-cm-threads-large.html
>
>  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>    - {shard-lnl}:        [INCOMPLETE][80] -> [PASS][81]
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-lnl-1/igt@xe_exec_fault_mode@twice-userptr-=
rebind-imm.html
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ln=
l-6/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>
>  * igt@xe_exec_threads@threads-mixed-fd-userptr:
>    - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1169] / [Intel XE#11=
95] / [Intel XE#1356]) -> [PASS][83]
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-433/igt@xe_exec_threads@threads-mixed-f=
d-userptr.html
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-435/igt@xe_exec_threads@threads-mixed-fd-userptr.html
>
>  * igt@xe_gt_freq@freq_fixed_exec:
>    - shard-adlp:         [FAIL][84] ([Intel XE#1414]) -> [PASS][85]
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-8/igt@xe_gt_freq@freq_fixed_exec.html
>
>  * igt@xe_gt_freq@freq_low_max:
>    - {shard-lnl}:        [FAIL][86] ([Intel XE#1045]) -> [PASS][87]
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ln=
l-6/igt@xe_gt_freq@freq_low_max.html
>
>  * igt@xe_pm@s4-basic-exec:
>    - shard-adlp:         [ABORT][88] ([Intel XE#1358] / [Intel XE#1794]) =
-> [PASS][89]
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@xe_pm@s4-basic-exec.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#623]) ->=
 [SKIP][91] ([Intel XE#623])
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled=
-small-legacy.html
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>  * igt@kms_big_fb@linear-8bpp-rotate-90:
>    - shard-dg2-set2:     [SKIP][92] ([Intel XE#316]) -> [SKIP][93] ([Inte=
l XE#1201] / [Intel XE#316])
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-9=
0.html
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html
>
>  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#316]) ->=
 [SKIP][95] ([Intel XE#316]) +4 other tests skip
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-=
270.html
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-dg=
2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-adlp:         [FAIL][96] ([Intel XE#1231]) -> [DMESG-FAIL][97]=
 ([Intel XE#324])
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
:
>    - shard-adlp:         [DMESG-FAIL][98] ([Intel XE#324]) -> [FAIL][99] =
([Intel XE#1231]) +1 other test fail
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e061=
f81e0d1d172aa0f37511bbe4d/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-ad=
lp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html
>
>  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1124]) -> [SKIP][101] ([I=
ntel XE#1124] / [Intel XE#1201]) +4 other tests skip
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotat=
e-90.html
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#610]) -=
> [SKIP][103] ([Intel XE#610])
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1124] / [Intel XE#1201]) =
-> [SKIP][105] ([Intel XE#1124]) +4 other tests skip
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0.html
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>
>  * igt@kms_big_fb@yf-tiled-addfb:
>    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#619]) -=
> [SKIP][107] ([Intel XE#619])
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_big_fb@yf-tiled-addfb.html
>
>  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#607]) -=
> [SKIP][109] ([Intel XE#607])
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>
>  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>    - shard-dg2-set2:     [SKIP][110] ([Intel XE#367]) -> [SKIP][111] ([In=
tel XE#1201] / [Intel XE#367])
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_bw@linear-tiling-2-display=
s-3840x2160p.html
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>
>  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#367]) -=
> [SKIP][113] ([Intel XE#367]) +2 other tests skip
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_bw@linear-tiling-3-display=
s-3840x2160p.html
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>
>  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>    - shard-dg2-set2:     [SKIP][114] ([Intel XE#787]) -> [SKIP][115] ([In=
tel XE#1201] / [Intel XE#787]) +41 other tests skip
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-b-dp-4.html
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html
>
>  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#1252]) =
-> [SKIP][117] ([Intel XE#1252])
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tile=
d-xe2-ccs.html
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#455] / =
[Intel XE#787]) -> [SKIP][119] ([Intel XE#455] / [Intel XE#787]) +15 other =
tests skip
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs.html
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>
>  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#787]) -=
> [SKIP][121] ([Intel XE#787]) +55 other tests skip
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-ti=
led-gen12-rc-ccs-cc@pipe-a-dp-4.html
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.ht=
ml
>
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1252]) -> [SKIP][123] ([I=
ntel XE#1201] / [Intel XE#1252])
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-xe2-ccs.html
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>    - shard-dg2-set2:     [SKIP][124] ([Intel XE#455] / [Intel XE#787]) ->=
 [SKIP][125] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other =
tests skip
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-gen12-rc-ccs-cc.html
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
>
>  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#314]) -=
> [SKIP][127] ([Intel XE#314]) +3 other tests skip
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe=
-c-dp-4.html
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>
>  * igt@kms_chamelium_color@ctm-0-75:
>    - shard-dg2-set2:     [SKIP][128] ([Intel XE#306]) -> [SKIP][129] ([In=
tel XE#1201] / [Intel XE#306])
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.h=
tml
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_chamelium_color@ctm-0-75.html
>
>  * igt@kms_chamelium_color@gamma:
>    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#306]) -=
> [SKIP][131] ([Intel XE#306])
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_chamelium_color@gamma.html
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_chamelium_color@gamma.html
>
>  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>    - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([In=
tel XE#1201] / [Intel XE#373]) +1 other test skip
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>
>  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) -=
> [SKIP][135] ([Intel XE#373]) +6 other tests skip
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-with=
out-ddc.html
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
>
>  * igt@kms_content_protection@dp-mst-type-0:
>    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#307]) -=
> [SKIP][137] ([Intel XE#307])
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_content_protection@dp-mst-=
type-0.html
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_content_protection@dp-mst-type-0.html
>
>  * igt@kms_cursor_crc@cursor-offscreen-512x512:
>    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#308]) -=
> [SKIP][139] ([Intel XE#308])
>   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html
>   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>
>  * igt@kms_feature_discovery@dp-mst:
>    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1137] / [Intel XE#1201]) =
-> [SKIP][141] ([Intel XE#1137])
>   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_feature_discovery@dp-mst.h=
tml
>   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_feature_discovery@dp-mst.html
>
>  * igt@kms_feature_discovery@psr2:
>    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1135]) -> [SKIP][143] ([I=
ntel XE#1135] / [Intel XE#1201])
>   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_feature_discovery@psr2.htm=
l
>   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_feature_discovery@psr2.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible:
>    - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#1551]) -> [INCOMPLE=
TE][145] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html
>   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>    - shard-dg2-set2:     [DMESG-WARN][146] ([Intel XE#1551]) -> [DMESG-WA=
RN][147] ([Intel XE#1214] / [Intel XE#1551])
>   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_flip@flip-vs-suspend-inter=
ruptible@a-hdmi-a6.html
>   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pi=
pe-a-valid-mode:
>    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#455]) -=
> [SKIP][149] ([Intel XE#455]) +11 other tests skip
>   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
>   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@=
pipe-a-valid-mode.html
>
>  * igt@kms_force_connector_basic@prune-stale-modes:
>    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [i915#5274]) -> [=
SKIP][151] ([i915#5274])
>   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_force_connector_basic@prun=
e-stale-modes.html
>   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#651]) -=
> [SKIP][153] ([Intel XE#651]) +20 other tests skip
>   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-shrfb-msflip-blt.html
>   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>    - shard-dg2-set2:     [SKIP][154] ([Intel XE#651]) -> [SKIP][155] ([In=
tel XE#1201] / [Intel XE#651]) +9 other tests skip
>   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-shrfb-msflip-blt.html
>   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.ht=
ml
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>    - shard-dg2-set2:     [SKIP][156] ([Intel XE#658]) -> [SKIP][157] ([In=
tel XE#1201] / [Intel XE#658]) +1 other test skip
>   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html
>   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) -=
> [SKIP][159] ([Intel XE#653]) +22 other tests skip
>   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-linear.html
>   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#658]) -=
> [SKIP][161] ([Intel XE#658])
>   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-y.html
>   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>    - shard-dg2-set2:     [SKIP][162] ([Intel XE#653]) -> [SKIP][163] ([In=
tel XE#1201] / [Intel XE#653]) +12 other tests skip
>   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-cur-indfb-draw-render.html
>   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.h=
tml
>
>  * igt@kms_pipe_crc_basic@suspend-read-crc:
>    - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#1162] / [Intel XE#1=
214]) -> [DMESG-WARN][165] ([Intel XE#1162])
>   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-rea=
d-crc.html
>   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
>
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>    - shard-dg2-set2:     [SKIP][166] ([Intel XE#305] / [Intel XE#455]) ->=
 [SKIP][167] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25.html
>   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.htm=
l
>
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-=
c-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][168] ([Intel XE#305]) -> [SKIP][169] ([In=
tel XE#1201] / [Intel XE#305]) +2 other tests skip
>   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pip=
e-c-hdmi-a-6.html
>
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-=
d-hdmi-a-6:
>    - shard-dg2-set2:     [SKIP][170] ([Intel XE#455]) -> [SKIP][171] ([In=
tel XE#1201] / [Intel XE#455]) +11 other tests skip
>   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pip=
e-d-hdmi-a-6.html
>
>  * igt@kms_pm_backlight@fade-with-suspend:
>    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#870]) -=
> [SKIP][173] ([Intel XE#870])
>   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_pm_backlight@fade-with-sus=
pend.html
>   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_pm_backlight@fade-with-suspend.html
>
>  * igt@kms_pm_dc@dc6-dpms:
>    - shard-dg2-set2:     [SKIP][174] ([Intel XE#908]) -> [SKIP][175] ([In=
tel XE#1201] / [Intel XE#908])
>   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
>   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_pm_dc@dc6-dpms.html
>
>  * igt@kms_pm_dc@dc6-psr:
>    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1129] / [Intel XE#1201]) =
-> [SKIP][177] ([Intel XE#1129])
>   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
>   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_pm_dc@dc6-psr.html
>
>  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#1489]) =
-> [SKIP][179] ([Intel XE#1489]) +3 other tests skip
>   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-=
continuous-exceed-fully-sf.html
>   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>
>  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1489]) -> [SKIP][181] ([I=
ntel XE#1201] / [Intel XE#1489]) +1 other test skip
>   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primar=
y-update-sf-dmg-area.html
>   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
>
>  * igt@kms_psr@fbc-psr2-primary-blt:
>    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#929]) -=
> [SKIP][183] ([Intel XE#929]) +10 other tests skip
>   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.h=
tml
>   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_psr@fbc-psr2-primary-blt.html
>
>  * igt@kms_psr@psr-cursor-plane-move:
>    - shard-dg2-set2:     [SKIP][184] ([Intel XE#929]) -> [SKIP][185] ([In=
tel XE#1201] / [Intel XE#929]) +4 other tests skip
>   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.=
html
>   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_psr@psr-cursor-plane-move.html
>
>  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#327]) -=
> [SKIP][187] ([Intel XE#327])
>   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@kms_rotation_crc@sprite-rotati=
on-90-pos-100-0.html
>   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>
>  * igt@kms_tiled_display@basic-test-pattern:
>    - shard-dg2-set2:     [FAIL][188] ([Intel XE#1729]) -> [SKIP][189] ([I=
ntel XE#1201] / [Intel XE#362])
>   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-434/igt@kms_tiled_display@basic-test-p=
attern.html
>   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-463/igt@kms_tiled_display@basic-test-pattern.html
>
>  * igt@kms_tv_load_detect@load-detect:
>    - shard-dg2-set2:     [SKIP][190] ([Intel XE#330]) -> [SKIP][191] ([In=
tel XE#1201] / [Intel XE#330])
>   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_tv_load_detect@load-detect=
.html
>   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_tv_load_detect@load-detect.html
>
>  * igt@kms_writeback@writeback-check-output-xrgb2101010:
>    - shard-dg2-set2:     [SKIP][192] ([Intel XE#756]) -> [SKIP][193] ([In=
tel XE#1201] / [Intel XE#756])
>   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html
>   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>
>  * igt@sriov_basic@enable-vfs-autoprobe-off:
>    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1091]) -> [SKIP][195] ([I=
ntel XE#1091] / [Intel XE#1201])
>   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@sriov_basic@enable-vfs-autopro=
be-off.html
>   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>  * igt@xe_compute_preempt@compute-preempt:
>    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#1280] /=
 [Intel XE#455]) -> [SKIP][197] ([Intel XE#1280] / [Intel XE#455]) +1 other=
 test skip
>   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-436/igt@xe_compute_preempt@compute-pre=
empt.html
>   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_compute_preempt@compute-preempt.html
>
>  * igt@xe_compute_preempt@compute-preempt-many:
>    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1280] / [Intel XE#455]) -=
> [SKIP][199] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other=
 test skip
>   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt-many.html
>   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@xe_compute_preempt@compute-preempt-many.html
>
>  * igt@xe_copy_basic@mem-set-linear-0xfffe:
>    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1126] / [Intel XE#1201]) =
-> [SKIP][201] ([Intel XE#1126]) +1 other test skip
>   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html
>   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>
>  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>    - shard-dg2-set2:     [SKIP][202] ([Intel XE#288]) -> [SKIP][203] ([In=
tel XE#1201] / [Intel XE#288]) +10 other tests skip
>   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@xe_exec_fault_mode@twice-userp=
tr-prefetch.html
>   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>
>  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#288]) -=
> [SKIP][205] ([Intel XE#288]) +18 other tests skip
>   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@xe_exec_fault_mode@twice-userp=
tr-rebind-imm.html
>   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>
>  * igt@xe_huc_copy@huc_copy:
>    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#255]) -=
> [SKIP][207] ([Intel XE#255])
>   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
>   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_huc_copy@huc_copy.html
>
>  * igt@xe_pm@d3cold-mmap-vram:
>    - shard-dg2-set2:     [SKIP][208] ([Intel XE#366]) -> [SKIP][209] ([In=
tel XE#1201] / [Intel XE#366])
>   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@xe_pm@d3cold-mmap-vram.html
>
>  * igt@xe_pm@s3-vm-bind-prefetch:
>    - shard-dg2-set2:     [DMESG-WARN][210] ([Intel XE#1214] / [Intel XE#5=
69]) -> [DMESG-WARN][211] ([Intel XE#569])
>   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html
>   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_pm@s3-vm-bind-prefetch.html
>
>  * igt@xe_pm@s4-exec-after:
>    - shard-dg2-set2:     [DMESG-WARN][212] -> [DMESG-WARN][213] ([Intel X=
E#1214]) +2 other tests dmesg-warn
>   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@xe_pm@s4-exec-after.html
>   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@xe_pm@s4-exec-after.html
>
>  * igt@xe_query@multigpu-query-hwconfig:
>    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#944]) -=
> [SKIP][215] ([Intel XE#944])
>   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-463/igt@xe_query@multigpu-query-hwconf=
ig.html
>   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-432/igt@xe_query@multigpu-query-hwconfig.html
>
>  * igt@xe_query@multigpu-query-topology:
>    - shard-dg2-set2:     [SKIP][216] ([Intel XE#944]) -> [SKIP][217] ([In=
tel XE#1201] / [Intel XE#944]) +2 other tests skip
>   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-dg2-432/igt@xe_query@multigpu-query-topolo=
gy.html
>   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-d=
g2-464/igt@xe_query@multigpu-query-topology.html
>
>  * igt@xe_wedged@wedged-at-any-timeout:
>    - shard-adlp:         [DMESG-WARN][218] ([Intel XE#1214] / [Intel XE#1=
760]) -> [DMESG-FAIL][219] ([Intel XE#1760])
>   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1527-edccdf441f1e06=
1f81e0d1d172aa0f37511bbe4d/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout=
.html
>   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135388v1/shard-a=
dlp-9/igt@xe_wedged@wedged-at-any-timeout.html
>
> =20
>  {name}: This element is suppressed. This means it is ignored when comput=
ing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/104=
5
>  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/105=
0
>  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/106=
2
>  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/109=
1
>  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
3
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
4
>  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
6
>  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
9
>  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
1
>  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
5
>  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
7
>  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/115=
8
>  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/116=
2
>  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/116=
9
>  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/117=
8
>  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
5
>  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1
>  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/121=
4
>  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/123=
1
>  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/125=
2
>  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/128=
0
>  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
6
>  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
8
>  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2
>  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
7
>  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
9
>  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6
>  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
7
>  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/141=
4
>  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
1
>  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
4
>  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
8
>  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
7
>  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/144=
2
>  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/146=
2
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/147=
3
>  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/147=
7
>  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/148=
9
>  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/155=
1
>  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/160=
7
>  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/165=
9
>  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
9
>  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/174=
5
>  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/176=
0
>  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/179=
4
>  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/187=
4
>  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9
>  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/205=
2
>  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/527=
4
>
>
>Build changes
>-------------
>
>  * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-pw-13538=
8v1
>
>  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1=
d172aa0f37511bbe4d
>  xe-pw-135388v1: 135388v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1353=
88v1/index.html
