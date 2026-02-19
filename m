Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDC3E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06C410E23C;
	Thu, 19 Feb 2026 09:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRCdPy7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F10310E23C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771494374; x=1803030374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ewC8e5aCz3y7kMRP6E1HS++JvOOeOU1SThYc2O6k8aM=;
 b=hRCdPy7U8Sh9h/HvdVMFkdvKs08a7NnAGqeELL2jFQvxNpLv1l9ULgFb
 NkBndUP+VajYCmZmkNS6eJrvGr7ykNdOPmEqlPURUxMYYcejqlzuBBEt+
 GECTKMsZS+CHVHh7fuK8JPZOaSVZP73pMKU1KY+sJQgmUcL6IMPzeB1N9
 31y1T+aGqKAFsHWaS12QVmwainadq6HzirtMt1lhDXn/Znov42IBI4wsZ
 PavM6IXl7g1+Sc7Wr/8qSTORlZpDLRmwM7+nWa2nMa/PngSHa2YzjHvyQ
 fesJKto32gYGzeZ80q+JMFap3CAdjWKKikXfI6VSslSyaybReVOXEPQRd A==;
X-CSE-ConnectionGUID: gYds00oQQGqdXXl3jHiFog==
X-CSE-MsgGUID: GhfresOYRWCOh5oj50YfUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83679924"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208,217";a="83679924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:46:14 -0800
X-CSE-ConnectionGUID: 4D9tQeYmShaB2ZWVq0tfGQ==
X-CSE-MsgGUID: ca5EO8z5QPiT9ZVfEzWlaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
 d="scan'208,217";a="213555961"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:46:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 01:46:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 01:46:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 01:46:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnmVVly5DcGLt3pCB6pFQfjrxPStq2e4VUq64gif4lggSMsxxyam/cKgbKNa/Qdbxo1ynn8qj3ScGIpF+8wh+i01U27SMzsIycQRulHLwfyW5EmwIw4Jinu3EZg3sWFJX0GiwWSP318G2D6ay7Ti0Q0UuGaBFc6cXNfJaMGjm4dtCZxVHqQP9I2hVK8bDw72a/ZV3aBNnlIec0Gxh/6yd9iceRRdt8RRCSLVyk4qq/reRnnUDIGiqLWwXPheP4yzGOg2VFR7KODomqqeZt3HA2SEa/4R4elYMJMhK6803gZE2iYE19o4NCwH+Ajaf+mqS5fs4PEI624vZNqUBOfrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW8OT+sYzdQi9Qfziez/cGNsjIXl0KZ7m61fouth4Ac=;
 b=xUKzp8hwd0W4bhuOcxC5ZoUrUgl3WtVt2tDq2j8hvbFe65rKePIY+y+E/Zq9skq8YF4TY7kDEa11Rz0RgTDctvGSfr8YQnSLLWlm3h7eV4dPU83QLYhd/MyeRJf3mpn4N6XGzDZQRh+rsOCHVU8X5cSi6nyD7xiKpnBAiaFt6qEg7RtlOfnTK3tT0dryFh4vXKWVpdoxoT+1LBRir+gUQIlQZVqJmBemjBmxpjkGDP3qKLT36xBxIth88RRTHQbUZLix0KFnyTwSP09CJXYjXB94BcPFUty49OOozBXOEdTvjSKz75k3u3oYIlAPJR228/d1DTiH6QtUD0JGPioeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 09:46:11 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 09:46:11 +0000
Content-Type: multipart/alternative;
 boundary="------------V1y6Yoq3nrZGyRLZq67M8TMO"
Message-ID: <c26fab51-24d6-4478-9cd7-65886914b2d5@intel.com>
Date: Thu, 19 Feb 2026 15:16:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Add prefetch fault support for Xe3p
To: "Summers, Stuart" <stuart.summers@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>
References: <20260202052515.840084-1-varun.gupta@intel.com>
 <20260202052515.840084-3-varun.gupta@intel.com>
 <4df26053e236e0c32f3cb4d9a504d5c0aae1d250.camel@intel.com>
 <aYEkLvxKS/TOCtOa@lstrano-desk.jf.intel.com>
 <bbbe5c479327e25a2f25c5d4e4b24189f97cdce8.camel@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <bbbe5c479327e25a2f25c5d4e4b24189f97cdce8.camel@intel.com>
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: eb192e41-a07f-42c7-99db-08de6f9bb67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCtPOE9nS2k1MzZmRDhPS1NCajJuTkpaQmhWcHVtWDVsUW1TNzdKL3N4aDhH?=
 =?utf-8?B?RmNSNHFxRkZONGh4WjhBZW5VVzBtd3JqdWNVeU9ac0xreElwb0ovbXBJOXdK?=
 =?utf-8?B?WVRxU2dkdXFWZFpsZUVSbmM1bHN1YkdxSEtlYUh4QmJDT3p6bDArZ2kydFIz?=
 =?utf-8?B?TFd5WHlPR3czRkJBRXRBOEc5TWZ2WEViYzcvRWxKNmlDbW81eDBVcEJpMnpP?=
 =?utf-8?B?NktYZ25SYzZpbnVrOWljTHBuazRtS3RQVCtJTExqNTRFcnJteFQ0TnBEVFpZ?=
 =?utf-8?B?U2l6KzBSbFlqSzNzNERKNFh3NWc5U0k1TWhFODJwV0pEV2M0aHNlM01pTDdH?=
 =?utf-8?B?RUxvbFkzT2tyRzhhU3V4MkFTcTFhVjY4cFZuZ3dxejNrbW15MldRUm5jbCt6?=
 =?utf-8?B?SWdCdC9QM3lSYkl4aHFMNk8ydWhMRGx6eUpOODVwY0VxOGdpTVdoL3djOEJn?=
 =?utf-8?B?aE1wODVBcW5GRHR6Q2hFeEhHS3dyQU0xbGN5bkVCOFhMRU9ocGxtbU1wa2dS?=
 =?utf-8?B?TU9kZXBmS0VScEFkU2x0dWtnQitWLzNJZkoxWWxBSWlsYkdNV3BiVUE1OFJJ?=
 =?utf-8?B?MmZCWWQrZ2s2eEs0TDFDbkYwWEcwdkpjUUtVZ3lSajE4VWJpcGJacDlWZkto?=
 =?utf-8?B?cU9OYjJLTTZ0OThvVGYwZjMwTXpHOUlYbkxDWVNXVzFQUjJYQmxqV3o5WUNm?=
 =?utf-8?B?cytJT2RValBmQUZzZk83QTZHOUhVY2Ewa1l6REFhU1l1NzJOSEF1REtLbnlr?=
 =?utf-8?B?RmJxVDlMMFVCTVcyL0Q3bzJOYVR1RENvSzAveWVhODUrRDBoMlQ2UVFmQUNs?=
 =?utf-8?B?S3UzWjBiSnBVMldpeUpEQTFtOXVkK1BsL0MrQ21jME84RDNyNWd2eE4xVFk4?=
 =?utf-8?B?Um14b2Z2TWl2ZDNVNjNEbWVBRGRwYmY4Snc3bmRRVjZYUXZBQXErTUZXUzRB?=
 =?utf-8?B?bTRlL0piZDF5OU5NOHBsRVprbUNnYUQzWTQ1d0hRUUwrTjg2QzJWTGdkQ2Y5?=
 =?utf-8?B?dFQzRUo1bWZzV2lnVDVIbDRreW1wdjR2Q1RxVUMxbUxnSHN4WU82cW82N0dO?=
 =?utf-8?B?aGJIem9WRHoyeTg5VnZmekZXZ3dFUE56Y2RpSkJldHdhNVNERFh6b01uVUlQ?=
 =?utf-8?B?S2NoZHZ2VDhWcmxoZFUvVFpwRjllSkJCTDQ5Q0IyT0VMVDcram9qYlhldm15?=
 =?utf-8?B?N3ZOZ1ZNRlRrYjhtbVpZd0ZjaU1aR2IzYkxMUTZKZzZiN3Vjc29lNUVhclIw?=
 =?utf-8?B?L01zZTZKTnVLUHRBQXZHcEw3MWtVMWpodlB4bWthOFdPSHJLK0tsd3RPaVFo?=
 =?utf-8?B?YzNXY1UwYnJQeWtSaEN2bGdIdmVqalhVTk9qYUl6aVVUSHlhbjd6OEh5OWhq?=
 =?utf-8?B?bDdDWWQ1aFZGV3o5TjBqSnlxOGZPSGZobEs3YklaMy9tb1JlVzlqTisxSGY0?=
 =?utf-8?B?Q25lVzZsQis4dUM4ekhMcVM0b2lsVnFMM0Z1SGpNbiszbGhuWkpjTmJxTjVY?=
 =?utf-8?B?alpCeGxrN3hnbEswSWtaWVB1T2hOOTJFcVJ2VnBYOWR2WUlCd1YyUmh3T0ZN?=
 =?utf-8?B?c2VDQlI1S2ZaTm9CT05nd3poSmpmMlRSOXNCQXY0MkdLdXdhZUh2RkZ1VUl6?=
 =?utf-8?B?TzJjRW9hbXRyelNDeUVtSFd1T0R2QnowYW9lam9uZ0VUZkM2OUQzMmJaOGlx?=
 =?utf-8?B?czUyRXBwWExEa05USGFTUytWVmc0WlBKVzl5b0UwZ2FoNlhzQUFaR2JWa2tS?=
 =?utf-8?B?MGhXdk83bDlSWU5leE1ZRHBjbEFhNlZlR3RFVVpHQnZ2aFZaa1haN2V2MDVY?=
 =?utf-8?B?NzZWRTE1MExNWHRhYWJic1ozb3F3ZndLRWVhUkZSbVBMczhNYkNNbDYwNUJQ?=
 =?utf-8?B?SHNjdUJxdUxBN0FYZVJuM0g4b1ZMWCtKbHV1VmZhZnhUZU9qbGNnVEY1YTZM?=
 =?utf-8?B?WTcyL1ZRMFBKVkhLOE1NOGVpN2Npb2ZIY3AxQVh2NEJxcWxxWUd3bWtqTmRp?=
 =?utf-8?B?a01mOG1teCtxQWs5SXhXUGh6KzBPbE5WVnI5SHBnM01CbDltTjFZSWZSVEk1?=
 =?utf-8?B?SnQ5YXNlSlRqcEgrOGRKbnB5aGZMaFhBK3JMN2xIL3ZoTGtJU1VIc1QwT3Vi?=
 =?utf-8?Q?hkpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkIzRHdkb2trcXFLUVE3QXR2VTdyNUo1WUovUGM4d0lkU1NSVm12dG1KL293?=
 =?utf-8?B?UnFlc1pjVmtRcXF0YzMxSlc1Nlh0RmdPVlVxVVh2TWwraFRuY3ZLbHhwdUFT?=
 =?utf-8?B?SktHalU4U3cvMnBRZ3Zoay9IQUVTNDdhVERGWVpVRmRiUG43Z01vdlo2dnVQ?=
 =?utf-8?B?dWJVT0ZVeDJYQTZJZDRCUHV4QUVVRXNzOXJMNTcrZVk4ckszeitKMk5xOXZH?=
 =?utf-8?B?RStTSjkyRjVpSHpOemxlNjRoajZETmhTM29TUEIzWGszZkdraXdjcmdhY0hC?=
 =?utf-8?B?MFFrR2R4K0crdFRNS1dhVUx6cmEzRkhQVmJsRzg3bWNUTkh0YS9PbHVsUEcr?=
 =?utf-8?B?S2UvUXdrL0tVSlJudm42SFBxUEVobCs3ZFNPTDdXSnlUMTRUZTlQL0NaTnl4?=
 =?utf-8?B?S1V5WlBUT0V2STRocWhXdVM5WWp0aHcvUDdlbXdKcTF5UHRsTHNYb1RDQ0Ft?=
 =?utf-8?B?S3VoLzBYbmt5RTlSYndDdUxZdmo4NkRwcGh4SzVtRHMvTjdmdVZTYnJiMUti?=
 =?utf-8?B?R0Q1KzZkd21Eem1BTzBsVXFUOTgzV1dzRjVvRDBLT2pUMDJmSmdSM2E5Rzcz?=
 =?utf-8?B?eWNhQkxJRS84TDVoRUhkUVd6SG5GQ1AvS1JLeEc0cGN1SlU3S0s3bWpFSnM5?=
 =?utf-8?B?dll2eUJlUWlBbUs2OG5VdnFEMGxKVEV5UHROTEVQbVE2cnhodlRPY0hOZzQw?=
 =?utf-8?B?ZkM3RXZmNUZFMHFyL2Vmc2xsamlDS3Z0Q2ZLU0tDc1Y1ME95anA0WGIza1VQ?=
 =?utf-8?B?REUyeldkQWV3RW1VcWFYblN6b3F5dzNKSFBzRVhUZFhxK0ZIeEJzckZLci85?=
 =?utf-8?B?T1NINHNMNWV0TGppZEU1UjBCb0Y5V0E1YzkvTXl3anRhV1ZrRkczTDRuZ3Jr?=
 =?utf-8?B?ME53MVBUZE5aU0R6R2ZySVcvMHJzdVlmRS9LbG5nME5MT1ZJTnEyenc5VE5p?=
 =?utf-8?B?NHA3NXVGYmJaVnBzVlR4eExUamt0ZHZlWUN0VVJxakRmY1pzVkhyamtkLzBK?=
 =?utf-8?B?UlFvUUtMckV6dDQxdXp5aDIxTVFQUy9wbDJLZXk5WHMvaUVvRUx5dWIxZkpt?=
 =?utf-8?B?TlN2T2gySldBbGc5N1NmU3ZNdHpGYVZpV1hydTZFSmNSclJUbDhvS0VNTmdO?=
 =?utf-8?B?dlptUXlzTGFvVFNTTE52SHJpeXBjUDNaOGVmTUJpTVlwTFlTRjY0NjhRSVc5?=
 =?utf-8?B?bDg2UkdkZE1NVnFkcGJDZTRMeHA2Zk5oWVN2UVd4K1FsN3ZWRHpLMmpEam5U?=
 =?utf-8?B?a0Zwckx2amw4OE00UW9XTUNxbDdQK1RzQ0ZQY1J0UTNvNWNzSlRLMncvZWhM?=
 =?utf-8?B?Qml5OVE1SEx4SHRYNXRENmJQZWJEYjBCeUdtVXdNdkNybWRMYXNZQ1AwQTVK?=
 =?utf-8?B?ZFZ6aUpDUWRpSWd0MFdPZ1NDTWpCL3YvMTlBNXdySlZoK3ZLUzhvYVoxSDB2?=
 =?utf-8?B?TDhqWU80OXFkRWFmYm0zTStGL1JDeGZxRDlzSmtoWFBkY29QUFBFVUt0ZktO?=
 =?utf-8?B?L0d5WVRVQk01UW93ZFpUMGZ3azN4ZVE2Vkx1Ymk2Z2JKV21TSm9rUGxDR1VQ?=
 =?utf-8?B?REQwMElNendvVWVwdXVDMTdqajl5VHlWNjZIREFRYkpoWCtlQjV6ak5sb0d5?=
 =?utf-8?B?RGMycHFZbWc0MUkxaTNJbkdqWkROZ2NNL2RYN1BEVW9WTkZKZUdvU1hnaU40?=
 =?utf-8?B?Y0xnbUE0NFBzZm5pTmtOQ0ZiSVV3d2V6OFliaGJDN2wyaERNNW9uYmJMenNH?=
 =?utf-8?B?UzlsUXczQzhkTDIxNWtoSTVtKzFFNVlENmZOV2l0cXQyUlF6TGxTNXMwSFN2?=
 =?utf-8?B?TmxPdVRCRmVlSmgzdXZEWXNjS21haWdXNVFPcGViUmVLUmlUWEtNdEtzbU5H?=
 =?utf-8?B?Z3ZoYnZjTWN0T2htczRrT0Y1SnloV2VIMDh2eVJYZ1diVUw1YytWOXlSdGsz?=
 =?utf-8?B?b3AxR0VZQWc4Sk5rOUYweFhMakxsVVBNeFc0MHhXKzdYeFhieDVGMm1OVVp1?=
 =?utf-8?B?c0dramJKdzRqd1JOaWNrRVVQSTdudzJ4Q0dmRHVUYlordWtLU3Jzb2JJeHFW?=
 =?utf-8?B?bVhoTWlCR0lqeUVpN1pPYW5TQ1N0aGJPQVpVOUVRc0sxOHlQd3JZQTBaYWdv?=
 =?utf-8?B?S1NrUVcxR3JrL1Nkajd5UnIrZGhhV0FUOHBERzcyZFdHNkhwU1dNMk1yeEdw?=
 =?utf-8?B?aFZRc1JtYmp1UXpoZ2Vlb1VPZGEwVmRmbUJ1ZldGRGNPT0wzYS9PQ0tXUWxk?=
 =?utf-8?B?eVZQUzRvV0JkK1BXTU5ZUG5WSVdRZVllSUdRMDY3TFk3N3pMRXExcGxOZHdW?=
 =?utf-8?B?bERiaWE5RmZzTUJhVUswSUtFWHY5UWdNanNPRGpybEJHZlpEYmQ4UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb192e41-a07f-42c7-99db-08de6f9bb67c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 09:46:10.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b95Kj2WdXUFXMCsDhT++ujadwKp0ZOKTt8JhSdHqDAjTlNLv9dM5MG3bvzMkFBnOhM9HIMGjtgTgKCZ+hIs4eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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

--------------V1y6Yoq3nrZGyRLZq67M8TMO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 03-Feb-26 4:04 AM, Summers, Stuart wrote:
> On Mon, 2026-02-02 at 14:24 -0800, Matthew Brost wrote:
>> On Mon, Feb 02, 2026 at 01:50:01PM -0700, Summers, Stuart wrote:
>>> On Mon, 2026-02-02 at 10:55 +0530, Varun Gupta wrote:
>>>> Xe3p hardware prefetches memory ranges and notifies software via
>>>> an
>>>> additional bit (bit 11) in the page fault descriptor that the
>>>> fault
>>>> was caused by prefetch.
>>>>
>>>> Extract the prefetch bit from the fault descriptor. When page
>>>> fault
>>>> handling fails, echo the prefetch bit in the response (bit 6) to
>>>> allow
>>>> the HW to suppress CAT errors for unsuccessful prefetch faults.
>>>> On
>>>> successful handling, clear the prefetch bit so it's not echoed.
>>>>
>>>> For failed prefetch faults, increment a stats counter and print a
>>>> single-line error message with the prefetch bit value to reduce
>>>> excessive logging.
>>>>
>>>> Based on original patches by Brian Welty<brian.welty@intel.com>
>>>> and
>>>> Priyanka Dandamudi<priyanka.dandamudi@intel.com>.
>>>>
>>>> Bspec: 59311
>>>> Originally-by: Lucas De Marchi<lucas.demarchi@intel.com>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Priyanka Dandamudi<priyanka.dandamudi@intel.com>
>>>> Cc: Matt Roper<matthew.d.roper@intel.com>
>>>> Signed-off-by: Lucas De Marchi<lucas.demarchi@intel.com>
>>>> Signed-off-by: Varun Gupta<varun.gupta@intel.com>
>>>>
>>>> ---
>>>> v3:
>>>>   - Drop the rename patch, keep xe_pagefault_print() unchanged
>>>> (Matt
>>>> Brost)
>>>>   - Move prefetch check to caller instead of inside print function
>>>> (Matt Brost)
>>>>   - Remove XE3P_ prefix from prefetch bit defines and add platform
>>>> comment (Matt Brost)
>>>>   - Show prefetch bit in error messages for debugging (Matt Brost)
>>>>   - Split stats counter into separate patch (Matt Brost)
>>>>
>>>> v2:
>>>>   - Changed comment wording from "repairs" to "handling" for
>>>> clarity
>>>> (Matt Roper)
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>>>>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>>>>   drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++++---
>>>>   drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
>>>>   4 files changed, 25 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> index a33ea288b907..1a8674daa26e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
>>>>   #define PFD_ACCESS_TYPE                GENMASK(1, 0)
>>>>   #define PFD_FAULT_TYPE         GENMASK(3, 2)
>>>>   #define PFD_VFID               GENMASK(9, 4)
>>>> -#define PFD_RSVD_1             GENMASK(11, 10)
>>>> +#define PFD_RSVD_1             BIT(10)
>>>> +#define PFD_PREFETCH           BIT(11) /* Only valid on Xe3+,
>>>> reserved on prior platforms */
>>>>   #define PFD_VIRTUAL_ADDR_LO    GENMASK(31, 12)
>>>>   #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>>>>   
>>>> @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
>>>>   
>>>>          u32 dw1;
>>>>   #define PFR_VFID               GENMASK(5, 0)
>>>> -#define PFR_RSVD_1             BIT(6)
>>>> +#define PFR_PREFETCH           BIT(6)  /* Only valid on Xe3+,
>>>> reserved on prior platforms */
>>>>   #define PFR_ENG_INSTANCE       GENMASK(12, 7)
>>>>   #define PFR_ENG_CLASS          GENMASK(15, 13)
>>>>   #define PFR_PDATA              GENMASK(31, 16)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>>>> b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>>>> index 719a18187a31..ca7f769848a9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>>>> @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault
>>>> *pf,
>>>> int err)
>>>>                  FIELD_PREP(PFR_ASID, pf->consumer.asid),
>>>>   
>>>>                  FIELD_PREP(PFR_VFID, vfid) |
>>>> +               FIELD_PREP(PFR_PREFETCH, pf->consumer.prefetch) |
>>>>                  FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>>>>                  FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>>>>                  FIELD_PREP(PFR_PDATA, pdata),
>>>> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc
>>>> *guc,
>>>> u32 *msg, u32 len)
>>>>          pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>>>>          pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE,
>>>> msg[2]);
>>>>          pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE,
>>>> msg[2]);
>>>> +       pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
>>>>          if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>>>>                  pf.consumer.fault_level =
>>>> XE_PAGEFAULT_LEVEL_NACK;
>>>>          else
>>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
>>>> b/drivers/gpu/drm/xe/xe_pagefault.c
>>>> index 6bee53d6ffc3..733d4ad28914 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>>> @@ -259,9 +259,19 @@ static void xe_pagefault_queue_work(struct
>>>> work_struct *w)
>>>>   
>>>>                  err = xe_pagefault_service(&pf);
>>>>                  if (err) {
>>>> -                       xe_pagefault_print(&pf);
>>>> -                       xe_gt_info(pf.gt, "Fault response:
>>>> Unsuccessful %pe\n",
>>>> -                                  ERR_PTR(err));
>>>> +                       if (!pf.consumer.prefetch) {
>>>> +                               xe_pagefault_print(&pf);
>>>> +                       } else {
>>>> +                               xe_gt_stats_incr(pf.gt,
>>>> XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>>>> +                       }
>> You don't need {} in the if / else statement.
>>
>>>> +                       xe_gt_info(pf.gt, "Fault response:
>>>> Unsuccessful %pe, prefetch=%d\n",
>>>> +                                  ERR_PTR(err),
>>>> pf.consumer.prefetch);
>>> Does it make sense to rate limit this message in case the test
>>> sends
>>> this over and over? I guess this wouldn't be much different from
>>> the
>>> normal case though so not required in this patch.
>>>
>> We only have xe_gt_err_ratelimited, so I'd say this probably fine as
>> is.
>>
>> Or maybe if prefetch is set we downgrade the message to dbg level?
>> This
>> should avoid spam in typical production settings.
> I like the idea of moving this to a debug print, but I also don't know
> that this needs to block the review since it was already an info
> before..
Noted. Will change this to dbg.
>>>> +               } else {
>>>> +                       /*
>>>> +                        * Clear prefetch bit - only needed to
>>>> suppress CAT errors
>>>> +                        * on unsuccessful handling.
>>> So bspec indicates this response bit is used to indicate either a
>>> prefetch memory access response or to suppress fault related cat
>>> errors. So shouldn't we be leaving this as-is here?
>>>
>> I would agree we probably shouldn't be touching this bit here. I
>> don't
>> have test platform, nor is one in CI yet, to verify that it is safe
>> to
>> leave untouched though - bspec can be wrong.
> I don't know of any specific side effect to a prefetch response here vs
> just leaving it as a successful, non-prefetch response which I think
> hardware probably drops also. I just think for safety reasons (what if
> that hardware handling changes in the future) it's best to follow bspec
> and respond how we received it. But yeah definitely agree that should
> be tested before merging.

Suppressing CAT errors on unsuccessful prefetch faults is the intended 
behavior,
the hardware prefetch mechanism is designed to tolerate failures 
silently rather
than escalating to an engine reset.

Clearing it on the success path is purely defensive — the fault is 
resolved, there
is nothing to suppress, so we zero it out to avoid sending a bit with no 
defined
meaning in that context.

Thanks,
Varun

>>> And if we aren't clearing this in the if (err) part of the
>>> condition
>>> above, we won't escalate to a cat fault (since it is suppressed),
>>> is
>>> that what we want here? Or we're worried about a storm of cat
>>> faults
>> I believe clearing if (err) should actually depend the VM's settings.
>>
>> If the VM has scratch - we should probably print the fault + trigger
>> a
>> CAT error as in this case prefetch shouldn't ever fail unless we have
>> software bug in the KMD.
>>
>> If the VM doesn't have scratch - it is somewhat normal for a prefetch
>> fault to be unsuccessful. My understanding is compute kernel
>> regularly issue prefetches to what may be invalid memory as the
>> kernel compiler more or less blindly inserts these not knowing the
>> memory bounds. In this case, we don't want to kill the kernel. This
>> is
>> part of reason we added scratch support on faulting VMs to avoid
>> prefetch fault storms to invalid memory and IIRC can turn off
>> prefetch
>> faults (without scratch W/A) in subsequent platforms.
> Yeah tying to scratch makes sense to me too. I get that the
> application/compute kernel might do something out of bounds
> "unexpectedly" (or as you mentioned because the compiler isn't being
> precise for whatever reason). But we should have a consistent
> implementation in the driver to handle that case rather than handling
> separately here and for the scratch on/off case. Eventually my
> understanding is we want to be able to drop scratch support once we can
> get the applications/compilers to guarantee in-bounds accesses - I
> realize this might not happen any time soon though...
>
> Thanks,
> Stuart
>
>> Matt
>>
>>> and engine resets? But as I mentioned above, I don't see why this
>>> case
>>> would really be different from a normal cat fault in terms of
>>> frequency
>>> from a buggy application.
>>>
>>> Thanks,
>>> Stuart
>>>
>>>> +                        */
>>>> +                       pf.consumer.prefetch = 0;
>>>>                  }
>>>>   
>>>>                  pf.producer.ops->ack_fault(&pf, err);
>>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
>>>> b/drivers/gpu/drm/xe/xe_pagefault_types.h
>>>> index d3b516407d60..9e38d6e2dac5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>>>> @@ -84,8 +84,14 @@ struct xe_pagefault {
>>>>                  u8 engine_class;
>>>>                  /** @consumer.engine_instance: engine instance */
>>>>                  u8 engine_instance;
>>>> +               /**
>>>> +                * @consumer.prefetch: fault is caused by HW
>>>> prefetch.
>>>> +                * Echo in response to suppress CAT errors on
>>>> +                * unsuccessful handling.
>>>> +                */
>>>> +               u8 prefetch;
>>>>                  /** consumer.reserved: reserved bits for future
>>>> expansion */
>>>> -               u8 reserved[7];
>>>> +               u8 reserved[6];
>>>>          } consumer;
>>>>          /**
>>>>           * @producer: State for the producer (i.e., HW/FW
>>>> interface).
>>>> Populated
--------------V1y6Yoq3nrZGyRLZq67M8TMO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-Feb-26 4:04 AM, Summers, Stuart
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bbbe5c479327e25a2f25c5d4e4b24189f97cdce8.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, 2026-02-02 at 14:24 -0800, Matthew Brost wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Mon, Feb 02, 2026 at 01:50:01PM -0700, Summers, Stuart wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Mon, 2026-02-02 at 10:55 +0530, Varun Gupta wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Xe3p hardware prefetches memory ranges and notifies software via
an
additional bit (bit 11) in the page fault descriptor that the
fault
was caused by prefetch.

Extract the prefetch bit from the fault descriptor. When page
fault
handling fails, echo the prefetch bit in the response (bit 6) to
allow
the HW to suppress CAT errors for unsuccessful prefetch faults.
On
successful handling, clear the prefetch bit so it's not echoed.

For failed prefetch faults, increment a stats counter and print a
single-line error message with the prefetch bit value to reduce
excessive logging.

Based on original patches by Brian Welty <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>
and
Priyanka Dandamudi <a class="moz-txt-link-rfc2396E" href="mailto:priyanka.dandamudi@intel.com">&lt;priyanka.dandamudi@intel.com&gt;</a>.

Bspec: 59311
Originally-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Priyanka Dandamudi <a class="moz-txt-link-rfc2396E" href="mailto:priyanka.dandamudi@intel.com">&lt;priyanka.dandamudi@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Signed-off-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Varun Gupta <a class="moz-txt-link-rfc2396E" href="mailto:varun.gupta@intel.com">&lt;varun.gupta@intel.com&gt;</a>

---
v3:
&nbsp;- Drop the rename patch, keep xe_pagefault_print() unchanged
(Matt
Brost)
&nbsp;- Move prefetch check to caller instead of inside print function
(Matt Brost)
&nbsp;- Remove XE3P_ prefix from prefetch bit defines and add platform
comment (Matt Brost)
&nbsp;- Show prefetch bit in error messages for debugging (Matt Brost)
&nbsp;- Split stats counter into separate patch (Matt Brost)

v2:
&nbsp;- Changed comment wording from &quot;repairs&quot; to &quot;handling&quot; for
clarity
(Matt Roper)
---
&nbsp;drivers/gpu/drm/xe/xe_guc_fwif.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +++--
&nbsp;drivers/gpu/drm/xe/xe_guc_pagefault.c&nbsp;&nbsp; |&nbsp; 2 ++
&nbsp;drivers/gpu/drm/xe/xe_pagefault.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 +++++++++++++---
&nbsp;drivers/gpu/drm/xe/xe_pagefault_types.h |&nbsp; 8 +++++++-
&nbsp;4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a33ea288b907..1a8674daa26e 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
&nbsp;#define PFD_ACCESS_TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(1, 0)
&nbsp;#define PFD_FAULT_TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(3, 2)
&nbsp;#define PFD_VFID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(9, 4)
-#define PFD_RSVD_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(11, 10)
+#define PFD_RSVD_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BIT(10)
+#define PFD_PREFETCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BIT(11)&nbsp;/* Only valid on Xe3+,
reserved on prior platforms */
&nbsp;#define PFD_VIRTUAL_ADDR_LO&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 12)
&nbsp;#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
&nbsp;
@@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32 dw1;
&nbsp;#define PFR_VFID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(5, 0)
-#define PFR_RSVD_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BIT(6)
+#define PFR_PREFETCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BIT(6)&nbsp;&nbsp;/* Only valid on Xe3+,
reserved on prior platforms */
&nbsp;#define PFR_ENG_INSTANCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(12, 7)
&nbsp;#define PFR_ENG_CLASS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(15, 13)
&nbsp;#define PFR_PDATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 16)
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c
b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 719a18187a31..ca7f769848a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault
*pf,
int err)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_ASID, pf-&gt;consumer.asid),
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_VFID, vfid) |
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_PREFETCH, pf-&gt;consumer.prefetch) |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_ENG_CLASS, engine_class) |
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIELD_PREP(PFR_PDATA, pdata),
@@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc
*guc,
u32 *msg, u32 len)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE,
msg[2]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE,
msg[2]);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.fault_level =
XE_PAGEFAULT_LEVEL_NACK;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
b/drivers/gpu/drm/xe/xe_pagefault.c
index 6bee53d6ffc3..733d4ad28914 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -259,9 +259,19 @@ static void xe_pagefault_queue_work(struct
work_struct *w)
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;err = xe_pagefault_service(&amp;pf);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (err) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xe_pagefault_print(&amp;pf);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xe_gt_info(pf.gt, &quot;Fault response:
Unsuccessful %pe\n&quot;,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ERR_PTR(err));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!pf.consumer.prefetch) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xe_pagefault_print(&amp;pf);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xe_gt_stats_incr(pf.gt,
XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
You don't need {} in the if / else statement.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xe_gt_info(pf.gt, &quot;Fault response:
Unsuccessful %pe, prefetch=%d\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ERR_PTR(err),
pf.consumer.prefetch);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Does it make sense to rate limit this message in case the test
sends
this over and over? I guess this wouldn't be much different from
the
normal case though so not required in this patch.

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We only have xe_gt_err_ratelimited, so I'd say this probably fine as
is.

Or maybe if prefetch is set we downgrade the message to dbg level?
This
should avoid spam in typical production settings.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I like the idea of moving this to a debug print, but I also don't know
that this needs to block the review since it was already an info
before..
</pre>
    </blockquote>
    Noted. Will change this to dbg.
    <blockquote type="cite" cite="mid:bbbe5c479327e25a2f25c5d4e4b24189f97cdce8.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Clear prefetch bit - only needed to
suppress CAT errors
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * on unsuccessful handling.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
So bspec indicates this response bit is used to indicate either a
prefetch memory access response or to suppress fault related cat
errors. So shouldn't we be leaving this as-is here?

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I would agree we probably shouldn't be touching this bit here. I
don't
have test platform, nor is one in CI yet, to verify that it is safe
to
leave untouched though - bspec can be wrong.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't know of any specific side effect to a prefetch response here vs
just leaving it as a successful, non-prefetch response which I think
hardware probably drops also. I just think for safety reasons (what if
that hardware handling changes in the future) it's best to follow bspec
and respond how we received it. But yeah definitely agree that should
be tested before merging.
</pre>
    </blockquote>
    <p><span data-teams="true">
        <p><span style="font-size: inherit;">Suppressing CAT errors on
            unsuccessful prefetch faults is the intended behavior,<br>
            the hardware prefetch mechanism is designed to tolerate
            failures silently rather&nbsp;<br>
            than escalating to an engine reset.</span></p>
        <p><span style="font-size: inherit;">Clearing it on the success
            path is purely defensive — the fault is resolved, there&nbsp;<br>
            is nothing to suppress, so we zero it out to avoid sending a
            bit with no defined&nbsp;<br>
            meaning in that context.</span></p>
      </span></p>
    <p>Thanks,<br>
      Varun</p>
    <blockquote type="cite" cite="mid:bbbe5c479327e25a2f25c5d4e4b24189f97cdce8.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">And if we aren't clearing this in the if (err) part of the
condition
above, we won't escalate to a cat fault (since it is suppressed),
is
that what we want here? Or we're worried about a storm of cat
faults
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I believe clearing if (err) should actually depend the VM's settings.

If the VM has scratch - we should probably print the fault + trigger
a
CAT error as in this case prefetch shouldn't ever fail unless we have
software bug in the KMD.

If the VM doesn't have scratch - it is somewhat normal for a prefetch
fault to be unsuccessful. My understanding is compute kernel
regularly issue prefetches to what may be invalid memory as the
kernel compiler more or less blindly inserts these not knowing the
memory bounds. In this case, we don't want to kill the kernel. This
is
part of reason we added scratch support on faulting VMs to avoid
prefetch fault storms to invalid memory and IIRC can turn off
prefetch
faults (without scratch W/A) in subsequent platforms.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yeah tying to scratch makes sense to me too. I get that the
application/compute kernel might do something out of bounds
&quot;unexpectedly&quot; (or as you mentioned because the compiler isn't being
precise for whatever reason). But we should have a consistent
implementation in the driver to handle that case rather than handling
separately here and for the scratch on/off case. Eventually my
understanding is we want to be able to drop scratch support once we can
get the applications/compilers to guarantee in-bounds accesses - I
realize this might not happen any time soon though...

Thanks,
Stuart

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Matt

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">and engine resets? But as I mentioned above, I don't see why this
case
would really be different from a normal cat fault in terms of
frequency
from a buggy application.

Thanks,
Stuart

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.consumer.prefetch = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pf.producer.ops-&gt;ack_fault(&amp;pf, err);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..9e38d6e2dac5 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -84,8 +84,14 @@ struct xe_pagefault {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 engine_class;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/** @consumer.engine_instance: engine instance */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 engine_instance;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/**
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @consumer.prefetch: fault is caused by HW
prefetch.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Echo in response to suppress CAT errors on
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * unsuccessful handling.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 prefetch;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/** consumer.reserved: reserved bits for future
expansion */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 reserved[7];
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u8 reserved[6];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} consumer;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @producer: State for the producer (i.e., HW/FW
interface).
Populated
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------V1y6Yoq3nrZGyRLZq67M8TMO--
