Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A077D11191
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 18:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA1410E677;
	Wed, 26 Nov 2025 18:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCyjulpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497F310E677
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764182506; x=1795718506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Nh3BEh2Q52ZBq+1VSwYCIjI/TrZHoKMSK/xLElBYfw=;
 b=oCyjulpk06cMvnf/ieWv8kEsbwatiOtJgNEjb8fME1n41WhFdD6Id7A4
 XguvfpmJWT6ihbX4cQVARZT0wccyK1MKHyQhAypqouCHvfMOK2v9woBpg
 WErc0pTeeCH0JP/t7pQ4lRqkw29tGhx3tcoYbjrIiwjPmt78I/0RdQl9d
 Jkpg+UeJWIssEclzM/KnaRi2AFF+gS5Th2JQK4mn0ljw3aAgl/mq6ht2E
 uOeniz5Cx6CXbIYSnxALZQIou2CNFIs4J8MJvOdLhuWHbZU/7pD60FgP3
 JxzcbxRDvWnwi6zBKcPqi+41C+wHiBblljLftXIOcHluMxQnLXxkkA6FH A==;
X-CSE-ConnectionGUID: +J882AgqS66rneSLSIe1Sw==
X-CSE-MsgGUID: kubXgbixRYKJEypHALAA1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70088883"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70088883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:41:46 -0800
X-CSE-ConnectionGUID: k8cZZjg5R5qYov+qoDY0OA==
X-CSE-MsgGUID: CmKMKM9RS7W6SQKUFCqXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="198130549"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:41:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:41:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 10:41:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:41:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJotBQPjtM2fW11yMtlylN0M7ZVWtj1OA2YLYhXi/ooZknTd6tXES8iDRiC1J2RgL52nbBMQK72Zj+txaaIFlNfgjX86SwpK1NTA748uJZE+hQ6N2L+RYcuFaNXT7BoZ4myZZUCM6tPcTWSBoTdiL6zvR15rXLKShhgoRV9M340Q69lgTfUWZoVhi4HER7bSPQVZWS3wr+eOAHJZNlueIqmS88fkDwtQWml0+ahvOtmso1ghJN0eLNsvEurOUZ5+Dp7Sc4qjebZMX/ZEGb++76f7PGnXlRJJfe9s17tnnDpwc0+lesAIt1gjZj6V0NWGjgy4/Go+e6tK28FAXRTxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYfRb0+e+eUq4qiB7xqqrIMLbAAP00RaML/pWgAlbQY=;
 b=vxtB+TLUu6zDFdsNzusQkJQMSJRGzCr5nTYKOBUJawhXJA0yEsvuhwUhYzmqOQm/kvfOU4AEP9OkUqo/j/vE3WhYLfwyw2qFU5gDVHQJfF96jd0U+4aJO8/EiqR+qF4F5ZiiBK58VYfSakeUcMH2AL/jBPc29VcO2JnzZMzUbqxsU82Szeeu86we4jk4QS0trZ1+Tr4LnG83kYvGAATLDHkA2h7Hi6CBaFO9TQrQrCNpfA78Tg9/BiVuBI28qKufLYwjTibmTcNe2RyigUW6d+ga+Hgho0EVh9AmXduLADxPk/lxgRfVVqt7PugBMLVO1nc7bVrLuQG8i2U9LCaL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 18:41:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 18:41:39 +0000
Date: Wed, 26 Nov 2025 10:41:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/oa: Use explicit struct initialization for
 struct xe_oa_regs
Message-ID: <aSdJ4RgxATlFcZfH@soc-5CG1426VCC.clients.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:303:b4::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e999635-a8d7-4b23-cf9c-08de2d1b6fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnN1UVQ2aWZ3bndUWkc5bkhIWTFDTXc4T1lhdDFmSmhML1FDMTAzUkxQNHc1?=
 =?utf-8?B?dVpSTkFraWdIUTJNT0NHaGZ4aE55ZEF5eHFiMDVzQTVFa1NKUjhGZUdhbmtL?=
 =?utf-8?B?Uld4NEljd0pIUnZEVnBFYWpUam1EcG9SbkVlanVtclF5eDNDSlNFUVB3N045?=
 =?utf-8?B?SVY2Uk9NN09sOEV1TFRPVGx6Y0p2cTNSVnZmUnJVQzk4WURSM3lueWsya21Q?=
 =?utf-8?B?MktpdllSZGw4WmpNQUNUaUNJVTFaVE9waUdCa2lYTzVkMEFyaURHWjAyZmFV?=
 =?utf-8?B?amplK3Z5OE5iV1VvUUtKU20rODJibG8yTTZTdFN2UFYwNTF1eFUrcHVSUWNK?=
 =?utf-8?B?dGhsZ3AyQk9hNElKVFBiTzZSVzI2emVZK2JvNGpiaTFCeFVKN0J6OUJ0eXNj?=
 =?utf-8?B?Q2hyL1NhSFJjR1dpODlOdWgwUUlWRXlsMVYyc3NCZTIvM0VLcEFWTkxSMXNU?=
 =?utf-8?B?WWU5K2FLZGdibGlYb25WTlcrMmpEQUNBK3JWcG1qMjdpbENkUnlZU0lubThV?=
 =?utf-8?B?M2hWNGJ0QjdYQzZmQ08rQ1FaY3p4amM0WGZ4dU5ON3Z1b3dyWXJJSVZJQlQr?=
 =?utf-8?B?MXRuWE8wNk4rZXRSeE9yWFlnZ2lzWjhUMjJ5bEk1VmFvNWduOFd5eDFTODEz?=
 =?utf-8?B?MXhjV2ZrV3ZlODNMU3ZYTUd5YURFUENxVTJ4UkxnMVJjV21pcjl3cmJYK3Fm?=
 =?utf-8?B?TW5ES0Q1bjN3Tkw2eTE2RDZmZlFpQ1VHY2xqSnZHcWZ1RUNicGIzTVhhSXNV?=
 =?utf-8?B?R1Z0cDVUVWNPbk5xMUJTdTJkYnlnV2hjQTVTRzVWTVhTNEpHck1lRUZEa1Fy?=
 =?utf-8?B?S0FycXVEOWVKUXFPb0poVGVPekJmaUxXYTBpME1DT3poOTBKU3pvcFJBeFcz?=
 =?utf-8?B?N0dyWnEyY1RvNG9GeHcwTXNoVGlIb2RBVi9CODNNQVZIbk9ySlc5ckM0cThn?=
 =?utf-8?B?VjhLd2huTEZMU25sU3I4eEx6QXFwYVlPQ2w4c0xvMWxWeEtna1NIc3liYVo4?=
 =?utf-8?B?d2JrczBadFpWRitGL28wOFVyY1RWZW1yaEgyczN6eC9YU0pOSm5hZGxudzBn?=
 =?utf-8?B?SjFRUnJvWkZKdzE3elF1bTRRdFJNQmdiUXE2MjIzVkdla05zZ1dOYW4yZGJu?=
 =?utf-8?B?ekw0MWNtYXpmTXpuWUo5eDRRWnh6ZWowcXdKclplVll3Vkp5VjRDbkoxRitF?=
 =?utf-8?B?dXNGYnhwNHRieHo5eDkzZEd1L1RtMHFMQlVodUlwSDVrUmNkd3RNZVRVdFl1?=
 =?utf-8?B?T2FjdS8zcXpTN1dzRkVvTWsycnNiS2lJcWxuOU05VjA1ZmlYVUZjYm1tbjVF?=
 =?utf-8?B?L1BIZkVlN0luNEVvZnN1WFlaN1U4eFpLM29Ma09ZaEh3SHlCdlBmcnpZa3VD?=
 =?utf-8?B?U2hXRXVQckx1NGVkSUVmaGpCeXBla01QSXlpWEdNZWZkRzJZcUJrMFE1aDhq?=
 =?utf-8?B?dXFYM005NkRGS3VzK2c1dTRZWktJcjJscUdOU2RKc0M2VXoyck1TZUZkUkRw?=
 =?utf-8?B?YzFnRzhsUjBmOHdCMUl1c1k0UmM2K0l1cElQVm1QN0svZThSL3FmcTVPcWpo?=
 =?utf-8?B?QXRJcDd0Y0JabHhhczNGN3ZJNFNzT2l2WjE4c1lGWHgrQVZWSmZPZnE4UlRk?=
 =?utf-8?B?Umc2U1RCMnJ1VjlKZWRTSHcwSFZRYXFyMEVjeTN5TXkyT0Y5RXpoTmY3ZG5h?=
 =?utf-8?B?TmdGRXJjVit5WS9XZW11bks5UnFEK3JjaldvdmhpRnNWVFFjOTg2cXROZ2hp?=
 =?utf-8?B?QkZoQnJJblh1V1lTOUkyUXhrcCtBdm96TitPZkNvSTlidUJIb2pTMElCUG9q?=
 =?utf-8?B?bXFnUllFdE4yc3FvbnpYekxtSEFVWjBXMUlTWmtpMHlqcFQwNkZBYVdGNlRu?=
 =?utf-8?B?WWF1U3RSOG4ybXQvRDlyQS9PM2hBWlhRS1VVQktqR2J6VE4vVXRuUVJrdVR0?=
 =?utf-8?Q?HK8mmysNRbre/+lDUW5uwE9cJnxyZhUc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExZMUNzZlcxOXRwMkxWOFRpS3BNNlVZU1FTclZ4emRJWUZPcWZCR2MrQmgr?=
 =?utf-8?B?SEtmWHJ1ckIrTm9qajdYWGM3YXZhN1NmQWNDZ1p2NkdNMHBXbkVVM2JEL3JC?=
 =?utf-8?B?elRyM2swbUJmQ2JGQUczU3hsQXNQdExlaGszSDJ0VGNkcDV1MkdoN0d4OTky?=
 =?utf-8?B?YlAzanpKWThTQUY4RjVoN1MrYTNvZEU3UCs5UWt4WGM1TVpkSUlZeUNGS3ls?=
 =?utf-8?B?OWNoREhSV215TTJXK2JCWlpKZ1BEbkQrVG11QW9qd09VNFVvVTQ3Mmt6UjNi?=
 =?utf-8?B?L21WU2VLL2xHYTBRc2o2emJPZXlFVFBhb1UyUHhUelZQMWRleHB2NDRFam5S?=
 =?utf-8?B?OE9yTXpvU1VkVkpGZGhpMHZVR2xBdGRFZGdWMHVtdVdkZlMxOEVWSlE0T01h?=
 =?utf-8?B?UnZGR0QzZWloNGVTcGZXVE9lcW1jTDgvbExFSThvMGhVSXh1MllFbHZhOFNQ?=
 =?utf-8?B?d1FEMk9QQ1BycWtadlEyaDJ5VitYU3JGb0pEYS9zMHQ1M2UySy81YnFzYSt1?=
 =?utf-8?B?YUlVTUR0RmFIaDhjc3lYU2Y0T0FaNUpFdXF6dzY2TGhuMm9YeGloaUFuRnZK?=
 =?utf-8?B?ZHVJb1JXekNyYmI5eWlIeUVmc21IRkYzUHowN2JxYVZSdXlQN0g4NVkrTi9x?=
 =?utf-8?B?cmY1R1FvbWxrZGRJUy9mMTFWcUpMZi9KSituWXhKaHBqZjJaeFJrVjJpVWI4?=
 =?utf-8?B?YWZaY2wzZTRZcWFzNkxCVWNoWWNOYXJ1UitnRUNzbkc3clpSQkFNczhJcThX?=
 =?utf-8?B?Q0ZpQzdZY1QxQXFHOTlXUGlzMFRjbkFpazJaUENhVlFEZFN1TnlGejNjTkM1?=
 =?utf-8?B?ZTdOdFMxem10NGVFVjRPdEdHK0dhNjA4NS9XcWJJcEJVbjE4ODRicE1ZUXNt?=
 =?utf-8?B?Z21LeGEyWUpCeUg3aUxuMXJERzg4QXlyNUNDZ0o2MytCaU9WeXlYd0ZwL0Ey?=
 =?utf-8?B?TVdOMXk1eGJpNlBzQnpRU3ZFM1NLb09zb0dvSGpSQnRldG1Gb0dLS0MvTEFu?=
 =?utf-8?B?alVxc1FYV256NURoY2xUcnl4Q0RIS1JLTTlIcnk3dm8vU1FiVW5qZmVHQ1M1?=
 =?utf-8?B?aWhJL0REMmF2clJCbTI0R2dWTHFWR1F0Q0hSS2xFdGplRytCZ0dYYlBSRzlU?=
 =?utf-8?B?TzU5UnA4T3NiYm1GY2dzMW9VaSs3YmJTZFNvTFJOM3MwT0hEejZ4dk5kQzNE?=
 =?utf-8?B?K1hwYS9nMC9jd3RKNmlDbEt6WkN2NktwU2ZaQUN5elhHUlV6UGE4TGZRaGNq?=
 =?utf-8?B?TnJZK1JreGV0bno4Y0JPclR0RndyQ0NPaWljZUMwUXFQU0crZXZ5UWwvZjNN?=
 =?utf-8?B?SkpORGVSZE1NUDVVZFY2TmhlK1dzTlhPOTk3amNkNlZMNmgreXJaTDlmdTRP?=
 =?utf-8?B?bnYvNWxHSk5YbVQ5bGRLK05aUXhtMjczUGJOU0l3SDcxZ3JYMTYzd3ZMUmhv?=
 =?utf-8?B?aEgwVjJ5ZjNUdlV3RHFsS3gyMUdUbE12OTFHM1ZxWUYxZVlqaWhrSGV5K1JS?=
 =?utf-8?B?VG1LNDU2OUx6VzAyaFYvUVFVODdxUTl0QUJOTExHUjlPTitxLzVQMDhxMmNS?=
 =?utf-8?B?dkYwbGRXbnpBMWRDbE1ORFNOajRwQURGNk9NWENvOTdXN2lKQVZOdHNLMFRB?=
 =?utf-8?B?MTdGbG5vcEZxMHJia3pjMjBxRGRLanJETk1nT3g1ejl3OHlJOCtpWEFxNjg5?=
 =?utf-8?B?aU9waGhOMjFXSmRCRFl1ZTRoQnR5QjgrK1Qvb0QrSmlNWWhzckswc2czcVNU?=
 =?utf-8?B?bVFvUk1zREJWckh3dDVSdlRIWk1sZWU3YURXUTVRdTBaR1huNUVzeTh0MzVH?=
 =?utf-8?B?K0QwNWlGRWJEelVSWXc0eU80N0JseWZHUTRUYjlJT1AyZXhZcHVwR29INHFI?=
 =?utf-8?B?NG03YTllZUpjYzdqNTlzV09qNkdMTWVydTBnV1hTYjBxSG45ekhwUlFKWGZv?=
 =?utf-8?B?OXZrL1dGRi9WOVhuWUhaMDRaUWR2U0NHSUVvQnBiV0J4MitrZUwrOUNrUHgv?=
 =?utf-8?B?R204NVdRR2NKb1FaY3J5c1E5clN3TWpsQ2FSSDdOWEo1TFdLME1UdVM3c1Rx?=
 =?utf-8?B?Y0dGb1VMV3ZxZXhOOHBXMkFXYk5MWGRGTW16NmcrcmdzdnFCR05EWDN3YWZL?=
 =?utf-8?B?ZnRIZlJkaU1wcGFmeklLeDIyczdKSUh3alpzeHJ5eS9DUEZvWng1aExER25D?=
 =?utf-8?Q?fOw/ReqNGXN4/zPSELD2k4k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e999635-a8d7-4b23-cf9c-08de2d1b6fa6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:41:39.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSS9tsdPeKF7Tw+Wq/gr0M1DRI49Pcng650EMSMsVavlGzafeRDuqe4JPZNUDI+KpXT4dXfMD0sitPY+a3CUS/hzzjLTNh7fJkWMdonRxvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
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

On Tue, Nov 25, 2025 at 07:52:16PM -0800, Ashutosh Dixit wrote:
>Use explicit struct initialization for struct xe_oa_regs to reduce chance
>of error. Also add .oa_mmio_trg field to struct for completeness.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Makes it more readable as well. Thanks for adding this,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c       | 38 +++++++++++++++++---------------
> drivers/gpu/drm/xe/xe_oa_types.h |  1 +
> 2 files changed, 21 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 890c363282ae6..75db5530cb557 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2566,30 +2566,32 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
> static struct xe_oa_regs __oam_regs(u32 base)
> {
> 	return (struct xe_oa_regs) {
>-		base,
>-		OAM_HEAD_POINTER(base),
>-		OAM_TAIL_POINTER(base),
>-		OAM_BUFFER(base),
>-		OAM_CONTEXT_CONTROL(base),
>-		OAM_CONTROL(base),
>-		OAM_DEBUG(base),
>-		OAM_STATUS(base),
>-		OAM_CONTROL_COUNTER_SEL_MASK,
>+		.base		= base,
>+		.oa_head_ptr	= OAM_HEAD_POINTER(base),
>+		.oa_tail_ptr	= OAM_TAIL_POINTER(base),
>+		.oa_buffer	= OAM_BUFFER(base),
>+		.oa_ctx_ctrl	= OAM_CONTEXT_CONTROL(base),
>+		.oa_ctrl	= OAM_CONTROL(base),
>+		.oa_debug	= OAM_DEBUG(base),
>+		.oa_status	= OAM_STATUS(base),
>+		.oa_mmio_trg	= OAM_MMIO_TRG(base),
>+		.oa_ctrl_counter_select_mask = OAM_CONTROL_COUNTER_SEL_MASK,
> 	};
> }
>
> static struct xe_oa_regs __oag_regs(void)
> {
> 	return (struct xe_oa_regs) {
>-		0,
>-		OAG_OAHEADPTR,
>-		OAG_OATAILPTR,
>-		OAG_OABUFFER,
>-		OAG_OAGLBCTXCTRL,
>-		OAG_OACONTROL,
>-		OAG_OA_DEBUG,
>-		OAG_OASTATUS,
>-		OAG_OACONTROL_OA_COUNTER_SEL_MASK,
>+		.base		= 0,
>+		.oa_head_ptr	= OAG_OAHEADPTR,
>+		.oa_tail_ptr	= OAG_OATAILPTR,
>+		.oa_buffer	= OAG_OABUFFER,
>+		.oa_ctx_ctrl	= OAG_OAGLBCTXCTRL,
>+		.oa_ctrl	= OAG_OACONTROL,
>+		.oa_debug	= OAG_OA_DEBUG,
>+		.oa_status	= OAG_OASTATUS,
>+		.oa_mmio_trg	= OAG_MMIOTRIGGER,
>+		.oa_ctrl_counter_select_mask = OAG_OACONTROL_OA_COUNTER_SEL_MASK,
> 	};
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index cf080f4121893..08cc8d7c22158 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -87,6 +87,7 @@ struct xe_oa_regs {
> 	struct xe_reg oa_ctrl;
> 	struct xe_reg oa_debug;
> 	struct xe_reg oa_status;
>+	struct xe_reg oa_mmio_trg;
> 	u32 oa_ctrl_counter_select_mask;
> };
>
>-- 
>2.48.1
>
