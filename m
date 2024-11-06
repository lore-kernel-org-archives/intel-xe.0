Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530DD59F6E
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 20:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A81C10E176;
	Wed,  6 Nov 2024 20:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6gYECnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9240310E176;
 Wed,  6 Nov 2024 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730923237; x=1762459237;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=jUrTht5nSPKMhtqR1umFrU99h1dwWx5QVIyFdgbVQMg=;
 b=Z6gYECnTwtWEK8/I3V+Nh8S0A5T5JaBtUiI37uQW9mQtITII4mCJzkmu
 U5PiQqRwZ24mcxaNyHCvzyf36uremegbfnWjM3GhFQIt6B3iz8iP1Yfc8
 FIdksbfI6WVGhRT/SNkz3/BUpSeG85wV80OdMynEOAOY8tpoGuQTy0JXG
 HIJZiE0G2K8QVe+OWz9lqF6nOrIdyTKwlHvFmuRoNU5xmvwUaZISRGdgu
 gyqAINsjW8pf7gi0ykg3VLH6tYQMpZyxp8Wi+YkzOSyBaejSow11HX3um
 JTYhrEiy/Dvga4qImDKzgEgSdNkvW/31wmsgpVbbZ8vbqlgdEPwyCJ1x5 Q==;
X-CSE-ConnectionGUID: uAfg0bnsSRGQi6M3prKh4w==
X-CSE-MsgGUID: TR97hwl8Qj+lt97YSel6YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30922529"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30922529"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 12:00:37 -0800
X-CSE-ConnectionGUID: cKuE1l14Q1eAABDW3/MN4w==
X-CSE-MsgGUID: 3dg+Sx1AQaKm4xdmtFnnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="88705444"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 12:00:36 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 12:00:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 12:00:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 12:00:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGZEsaG0K4Rk/HlQvPfA2x3GzzpVBOsVmGQCMn5NOz7lrI6LtLjeKwkSl79QJveC6tz1W6H4Of+MHtkUtS5/5XM2imP+rHTC1zE1sPnrM7MP5kqxnUsnL2CfrmY9trms0GL+V3uJx8/h8GS16L1uyIH+A3zi9ZN2ZSZfSHFf6FuTRv+kt6PKglJoPdFY/R5N1IE3kaIeFuUTMkiujx0Uo7DLmDlWUUZm8G5AXhwyZDnL1eQQJNrbMd1oDOhYU3Idyg7sBjw/U2AmuW9hdKQGVyLUZrpTlr1eEhzhQ5f49IFOxjeLZSTFVFedXzbKzTSKm8HLFEx725GVdZxRTQxUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCrCAcaFB7n/+i8V4k8wlgPwi7eA7cIbkXazFMo7LgQ=;
 b=rMn2R07Gwn2HoOu7PCwjN7FkImUz6x6UzooPly+bAxz4BCmP+SyExPyYZTNx5GXSW16wFOVWVMwlfDexq8GdLYOfGsvtvni3QNKlatgqVOVnDNxEOpRJJTb7S1kggvjghQT/5og7GFjCKbYdi2tlRSdUUuGpcXuo+sNYky5yfc2qxndS4y1hySMzqmIhXa+vNThGPQuM9Y64X949cZZJ4j7UfrNTrpX2I5hHrY+skImrAa52iskZ/l202BTTmHr1NKpyRw9iB1+fVkwD5gIdVzQAvRVO198mHg0hiOnrynzroDyZZXEuz/j6ZOBKVH2bQXcjlZNnBOYtMyIySsRkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 20:00:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 20:00:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173091974712.1418566.8533324550681536234@2413ebb6fbb6>
References: <20241105120159.18286-1-gustavo.sousa@intel.com>
 <173091974712.1418566.8533324550681536234@2413ebb6fbb6>
Subject: Re: =?utf-8?b?4pyX?= CI.FULL: failure for drm/i915/dmc: Test Xe2LPD
 DMC v2.23
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <i915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Wed, 6 Nov 2024 17:00:25 -0300
Message-ID: <173092322581.5449.8169723453819075586@intel.com>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2abcc8-ce94-47d1-ce48-08dcfe9dab26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alpGaGNHZHh3RlBQT0ZOWWF6amNJbWNTYVZrbmxSMnZIWjdvM2NhS1kwMnhX?=
 =?utf-8?B?MDcyS2JWdFplUlgxVzhJM0ZoQy9mTDB3SkxObzhYL21lV3pheXNXQVNKVTFM?=
 =?utf-8?B?WFRZMVVMV09NYU5YUTAwZVFscTRvUFZNeTV6S0t1QlJlbXRRYW9tVkc4NUJ4?=
 =?utf-8?B?T1BVc2dhTkxkWUpFK0o3bjhoMFUvRVV1ZUlkUlBnYS9EOGY4eG5CTkc2YnUy?=
 =?utf-8?B?aVNrZFJSUzlrS0xFK1k3NWpYVnZTTGxrdkhZUWpzT0JPcFhRYzcwUkN4YXVk?=
 =?utf-8?B?Q2FwU0pOMlJMd1RXTm1CL2VZc0U3dm9Hd24vSDQyanhOUERTd0FRdGJpQlBO?=
 =?utf-8?B?S0JGMnRvQlF4TDlpbTNyZ3cya1VaUG1IR2RvTmZsTk1YbFNONENZQ2dzWGJH?=
 =?utf-8?B?Yzk4SVRjbmRFTERuaXdqd0ZCWGZmYURvUTFhNkxNL1NkaU1rSzhwQlJzUHdk?=
 =?utf-8?B?cWhjczJhODFpbHMvWnVYRktBeGhTeE9Jc1dTLzFvWWZqTzZvTjJqWGR6eGNv?=
 =?utf-8?B?SkdOaGZ4R1NrNHBGTFQ1UCtWSnpFWVBEUG9aSXZOdW95ZzBKcGlQNmxiNkh2?=
 =?utf-8?B?cWlpcUtHY08yR0JGSkFwU1BiWkVIS3AzRlNqek83WEdXVkxlQkpObGRxd2hJ?=
 =?utf-8?B?bVhLekNadytRazZDeEdwL2ZsOCtaWk9HSGMzSWo0eGdYbkpHMHRNVWttL0xm?=
 =?utf-8?B?NUFJb2UyOGtUS2gvTFYrSU5JNkZ4NjZscW1tRUtwcnNzUmRwcytWano1TStx?=
 =?utf-8?B?cFB3VW14VFhxZHU1bkEvb3FNK2dWcW9aNnR2RWRYR29Cd0JsZXptOERKNThl?=
 =?utf-8?B?ZStSNm1GZ0ZVMnh5QlZxMjFuZm9VSGwvTnlFL0h5TktqQmE2M0NiaEFQTklh?=
 =?utf-8?B?dnlvWnZYY1N5bFhBUlVnTFpPcEtzeGR6elRVWUhaWUxWOWhXdzRMNHZIYnBx?=
 =?utf-8?B?aWcxSU9kR081WUdZZEQ1VnhKOERHNXJHWUFqakNIVVNydTR4WmxjSVN0N2dE?=
 =?utf-8?B?YzVjZWxqTkZxVGxZdmQzN0Z4KzVmRTBrbGFHcjNOUlJpQlFQUGoyemZ2VmUv?=
 =?utf-8?B?VjFVaDRlU3hxdTRXRXBqWXpPbEhjUDlVNmRMU2Qxano3NExvY3hpZHIxZy91?=
 =?utf-8?B?ZEZxckhjNTdMNC9WS1A5ekZKdTdZb2R6dEpOUmtod2lRTUdvUnZUOFJBMzYx?=
 =?utf-8?B?SENxRGFpN1FSWFFqNytQMnp6L25uanViSWsrQXE0MDNNWlV6MVF6YkMwMnlu?=
 =?utf-8?B?dXhPMlFDZk5UMm9sYjRTZXFJNmdDT3RrYUpOVmZVNFg5aStwT1NYTGN6Visv?=
 =?utf-8?B?QkFpRmp1dFZ0emNUZTZKZHh3b1VNTkV4UXB2OVVCVUw1UjdtRllXK2Y0ci9R?=
 =?utf-8?B?dzZCN1JuaXREU3BEN3VYdVMrM3BHY2xVM3RJZmFLNEsxTmZ2QUtXK1g0dEVJ?=
 =?utf-8?B?WWtiQzFJM3pyMmRSejBrZFNtZ2xaY3dOcDRwd21uUGJHOExuelJlQ2J0bG1m?=
 =?utf-8?B?YlJYbGx4aHd4d2JFRUZ1bS82Q0VmQndlUTdlRHRUc0hXTHlYWTliZ3V5VnRm?=
 =?utf-8?B?KytaL1NGTWM0Tno3WG51amlaZzFpN2h4dkVoYzZjblBPc0FucEVCK0ZRL2dQ?=
 =?utf-8?B?WGRsUjA4NHdlQ2dYT1dMdUp2cWUyL0dnVUM5bDFXNHBVakE3dExSbFFvelky?=
 =?utf-8?B?cndYZE5tTCtuaWR5TGtkRFJBaU1aMjBXSGFoUk5KZXF6TDdKb09FSXR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkRrRmtpM1A2U28yeHJUTW9PcjdzRldzMEtwMVIwUlpHRHhKQ1JvbE5rM3dp?=
 =?utf-8?B?eHNFODR1WDl3VnF5SXV2OEhDbktlakdBMkR2M0J0TXJJdlQ4VURucXJJNkFS?=
 =?utf-8?B?cE5rWnFaMk9IYXpxdHFVNHMvb1pEVHh3d1hsclRoeFh4NXRBa05DWlNNOVBs?=
 =?utf-8?B?R0ptWm52d1hJQUxTS1Y2WHJnUlcvNWdrb1lseW0yU0RvRStDdTNGSTR6SVhB?=
 =?utf-8?B?TEluazF5VUs3KzI4TWRHbVRIVXVodUhabkFPWk9qT1pwNndRQng3bS9leWwz?=
 =?utf-8?B?UEdkRVNTV1VMM2hFOGZ5dHVYR25BU1hqSXh1RXo0elJDZXdwd0FwdWtYNFpK?=
 =?utf-8?B?OFJyM0Z6VkIwOWxaMjBuQk0yVUt6djFwSXpTV0ttVnlPNHRDdE5NaXpvTXQ5?=
 =?utf-8?B?Y0pBZ3JyNkxUSkJkZW9LdE9BV0JiQm9LWHZReU80aGp6VDFGNTRoSEo2TUY2?=
 =?utf-8?B?VGNEODNkNFhsSExMSDNMbFNuanFwZENVVlErdHhSS0k2aFVId2NiYWVhTnUz?=
 =?utf-8?B?WWRUU2lGM1dVV3BqVmtOaWt2cUd0cm1SRjB3TjZDcWV5Qk92VmM4QzJTZUFz?=
 =?utf-8?B?RDNPUEpGSW9VNm9uUENOQVM5WEYvT3pHTm9QZDRxSElXNlU1RkFybWhHWk1I?=
 =?utf-8?B?LzRmekNRN1ozZGRyVXhlWnE2b1FFRnRJckJnYzI2eVJyNHg3YzBmVzZ5SEk2?=
 =?utf-8?B?MTE5ZEMxVUxaQnpCd0doWWMvL2cvT2dtckYyV2o4UERValg0SHFzMi9taDhY?=
 =?utf-8?B?cEVycytJbVdndFZTUS9qZU9RaEhMMmcyNURtRGQ4T3lqTzl2bkdJWVJFdTNp?=
 =?utf-8?B?YmhZRTVteENRMThJSFIxVDF4WUlLOTlEUW9aTE5TUEZON2F3STZnaGl2Ny9k?=
 =?utf-8?B?bFA0a2dzVGdNOTdjTVN1eHF5blh6Ujd4ZWFlSTFkUGhaRFE4b0tQZUV5eWt5?=
 =?utf-8?B?YjZkYzdIRXJOMVh3UDgzN2Rmc1pmWEVqTGZ2T1RLWU9CdnRiaFM5UWgrTmRP?=
 =?utf-8?B?MGJIZ1RJRFlrcnBYbHdNZHVvcmtlUytwWUlBODZVS1JHdjlyMjJpMVd3Nlpa?=
 =?utf-8?B?WGVtNzBsZng5Rk5GMFR6dFNnVUNJTHRicG1FRmxGTVVqSU1WSzYwbVFYbVhq?=
 =?utf-8?B?YUVNeFE0a3Y1QW5tSUkvc2R2SEEwekU3VVY3dTQvTHlsbjMzREppMmlrMGh4?=
 =?utf-8?B?Ulg3Z05RdU9oSEFiK2hJM3JKZGZGWkVGSzcxbnZMM2hVQ1ZnWSt5SmZ6R3Bq?=
 =?utf-8?B?WEc2SWdraHFtSGFoMU9Db1IwSXE0MWNsSlRWNmlldVlGbWRvbnlHK0JlNkQ0?=
 =?utf-8?B?U21YNjFCMEhNOGt6RkJmS0xyS0NNak8zcys4T3JzcHN6VEtSdUdGVDE1ak1q?=
 =?utf-8?B?aVhqNWJHU05OMDYxM01SVFhPaGdCOHNKeGx4dkZDVVRyNWRJdURGRFloTFJO?=
 =?utf-8?B?MWFZZ2xTYWlZMStmL2phenBVOUQxakYzWmFTMWw4eUtSN0UrbXVSMnZRUkRs?=
 =?utf-8?B?VEx1OUhtQXgrNm5RTEpBTkZiZVE5T20vRUxmSVE1L3NENm9vVHE0d2lGTFVI?=
 =?utf-8?B?Q2lBS0VWbm1HNnVWTk5pNFRSSUl0MEpqeTRxdHlKTmkxZVlMV3I3YUkvcUNl?=
 =?utf-8?B?Rkh5WVpBZE5TTE9GeFdUaUlFUHlQWUFBRVg1ajgydkNXSVdGSVRtdDlDTldm?=
 =?utf-8?B?S29SRUNwcFhYTmFJUkFIRFBpVU9JMkJUMG1TeUlxTzdNUmZzMmtZOFBzZ2JP?=
 =?utf-8?B?ejB2cFozRVMwUURyc3BBOU5aaGdleERpTGw1RU1Jc1ZydllCUVUvZ3BIaXRN?=
 =?utf-8?B?enRmMUdJcEVjOW1qWm80cmxXUFFrY0tEOXdiWGdjckhZS3ZCMlk4K1J3cjhE?=
 =?utf-8?B?S01QbkJRN2RkSjB5VTlWTFg0eHNxekorR05UcHJ5WkZadW90d3puK2FtMUUy?=
 =?utf-8?B?dEwzSVhlcFRjbksvY1luK01vMENBd2VBRHVyS2s1bmVwYUNubjhNa1J6UTVp?=
 =?utf-8?B?ODRKdnd0MUlmLzl5S0tYNHF0enZlOTdFNVQ1ZDRHaUZEZW1xck1WSWc4L2pr?=
 =?utf-8?B?amdVZU9BMmgwZm41dVpicGZjQmtPS1BpS2k5MDlvTHVnZmdXL1d1S29HbmM3?=
 =?utf-8?B?bWx6MS9MQlA4UXVnSFBOL250bHRySmtnV2Q5SWNxM2dlWVQ4SVN6SE1NbHF3?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2abcc8-ce94-47d1-ce48-08dcfe9dab26
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 20:00:31.8802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXZnU9gBj20J4XEMNqn/Ja3fzr7tElBVY/Ip9jqV/UPesvm1UbNMJkTYdIWBeZTRuxlNRxnxTPOqX4DjX7oRxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
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

Quoting Patchwork (2024-11-06 16:02:27-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/dmc: Test Xe2LPD DMC v2.23
>URL   : https://patchwork.freedesktop.org/series/140943/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea=
_full -> xe-pw-140943v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-140943v1_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-140943v1_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1409=
43v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_color@ctm-signed@pipe-c-edp-1:
>    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbeda=
cf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_color@ctm-signed@pipe-c-edp-1.=
html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl=
-8/igt@kms_color@ctm-signed@pipe-c-edp-1.html

This does not seem related to the new DMC. Here are some other occurrences
that seem not to be captured by CI Bug log yet:

    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e7=
64749b65a328d33c8ea/shard-lnl-3/igt@kms_color@deep-color@pipe-a-edp-1-ctm.h=
tml
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2160-a4532bcf5eea0cfdb56fb=
dc3195a2d15d193727b/re-lnl-5/igt@kms_color@legacy-gamma@pipe-a-dp-1.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2159-0a6cc4357ae4d824f9094=
68ca1deed28ae5ac96f/shard-lnl-3/igt@kms_color@deep-color@pipe-c-edp-1-ctm.h=
tml
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca=
8ed54195bc31d0ee932/re-lnl-4/igt@kms_color@ctm-blue-to-red@pipe-a-edp-1.htm=
l
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca=
8ed54195bc31d0ee932/re-lnl-4/igt@kms_color@ctm-blue-to-red.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@legacy-gamma@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@legacy-gamma@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-signed@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-signed@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-negative@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-max@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-max@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-0-75@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-0-50@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-0-50@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-0-25@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2147-c245557007af0a1c23da0=
0c47732ae1dadda7dd3/re-lnl-4/igt@kms_color@ctm-0-25@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2144-fb992a15d9b3dc0ed1395=
b1a30a27f50fb8dba63/shard-lnl-3/igt@kms_color@ctm-negative@pipe-c-edp-1.htm=
l
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@legacy-gamma@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@legacy-gamma@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-signed@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-max@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-max@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-0-75@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-0-50@pipe-a-dp-5.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-0-50@pipe-a-dp-4.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b7=
1f7cf39c2cd814cbb6f/re-lnl-4/igt@kms_color@ctm-0-25@pipe-a-dp-5.html

>
>  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
>    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbeda=
cf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-inter=
ruptible@d-hdmi-a3.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg=
-8/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
>
>  * igt@kms_pm_dc@dc5-retention-flops:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][5]
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2=
-434/igt@kms_pm_dc@dc5-retention-flops.html

Those two are unrelated, since the new DMC applies only to LNL.

>  * igt@xe_wedged@wedged-mode-toggle:
>    - shard-lnl:          [PASS][6] -> [ABORT][7]
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbeda=
cf9e764749b65a328d33c8ea/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl=
-6/igt@xe_wedged@wedged-mode-toggle.html

Null pointer dereferencing happening in devcoredump path, not related to th=
e new DMC.

--
Gustavo Sousa
