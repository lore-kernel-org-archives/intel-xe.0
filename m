Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C1BE77183
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 05:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05B110E17D;
	Wed, 18 Dec 2024 05:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwcHXAcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BD810E17D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498796; x=1766034796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GFBNxpPGAqA3DOi7didYURkFigdR9LTEJvV4QJIOrqc=;
 b=PwcHXAcjeR9XVcU+nSMJHUMKjhzlOIsgb92IM39LqDcWdU3TbNQHFXkX
 oho6FTFrJhwrsyaDNcBv95RvZv2hRik2Bp0UJh6MZsXnm4IJAW+r348pQ
 rJz0g6S6lag6FXCJPxyMaVE0L26SD49kmVhDyVVb1niAsiJVImcStXHMX
 j0x4QGiMOLkkQdEtk1IcbrcXnon5sLvfK7rkSwhCh2CDWE4muumUeAaH/
 2SulQhUdWL3d9UvuxGysqn2BLrgyIruKY+KjP8oVqVb7NejBjeGcvR2gO
 5GpKgW9U+AhHP+Z/EUr9CbaoGJh3yrJW/yV4C7+RRQ2jUGhu6iJAxBO61 w==;
X-CSE-ConnectionGUID: RO1ilpvATGWXyw+fR23Xnw==
X-CSE-MsgGUID: DRvK4TlWQtCMrwHeb6/jzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34847135"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="34847135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:15 -0800
X-CSE-ConnectionGUID: MOUYeADnToWkL4SoHWPikQ==
X-CSE-MsgGUID: zahkVvkNRdWWVdVkb5U2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102746811"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 21:13:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 21:13:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3oQGB2NNiN+EO0u+hw0i6hVFBBXVzNEIJ5R6DCNPa6DlJlXMB4tbhov/73uJi5xvP9V1lmtSj8/C45F+JhyBB2i16wOF+mc0Lm/NvCMh8+r7yQzwiCnuSmomPRsjZ/Ol1YUJlXOPg+HotVUa+AA4qqKMOd7pn4B8h/DeeYI82mljA6CKruavaflKJjTIE+MFah8yHIKypy5pK8EAS++2Bz1vjvF0GPectiHUIJRlyV939yosyA4OnaqFr3oUOcV9aFfiLa7pyG3L3sV9eWlgy1QELwF4e+T46Ib1+odxRVnSI6pZO2b5agBPtIEjudJTEd2f43lLfXQYIMU5bzSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLUVuydpnOHRF7Lz4x2qxlGYMcUH4fs5On97VsJqCc8=;
 b=pRWJX+B9S5s10aMK3rRcFU7Hzkxey9O67KuvsVxmEXMikLSGyp7C7C8Msg8RXHp4YOyaPkfpAy5w52rq7/l8y8CMtEkhVBaKp70csFhyYgWHvJUDi5bxt1ANh4ongPS++VywsHphsNQBBgPX3wocIG7c+i/DwNN5qz/BNrkOtqfV57utVDfHBrQf1CTfif4gapKuInl6fqexdwv36mW12FiF/6E8oey3Ezn8q4XITcuWkkEJxHKLxNyAWjwaL3sH6Lm+r/DSFLVDm5EgkbqUjIQEiOB5xo7esuQw5bttRbjWRTA2cdjYzo+8uabPw6z/aQZCAE3v8SyyN+cQu+ejwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 05:13:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 05:13:00 +0000
Message-ID: <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
Date: Wed, 18 Dec 2024 10:42:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <john.c.harrison@intel.com>, <ashutosh.dixit@intel.com>,
 <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::24) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 9049ce17-313b-4242-1793-08dd1f22a475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWpEMTJyR0E4Um50aE5vUWtmVktOM1Z5TmdMUmxrUlBzeEZYQ2VFQzVsNUht?=
 =?utf-8?B?WGVmanpjZmlPWlFLRWdvbVQ1TXhBZndScXg3S2xPWVlLT0RQWWJuUGcyTms2?=
 =?utf-8?B?QVBVSmR4bVNDSEExSkRaakw5RnRvM1BzbGIyQ2QvSDB1V2hpL1NpclM0cytp?=
 =?utf-8?B?dXYxYWY3aHc1NDNqU2FWNXg5NndLcm91dnJseXJUQVpjbFExSWROb1o5K3hP?=
 =?utf-8?B?U2xESC9XcERPUSsvZG5wRStFVlZDY0lUTEMwVTlxdWxudVVsSm02Q1JmQmx5?=
 =?utf-8?B?eVNPQXZNK3RHVnNWSmx2cmJ0TVJaZThhV3pyTHZ2RERGZnZEbER6L1h2b01n?=
 =?utf-8?B?UUk0dFJRc1QvM0VFNi9NOHJVVXBLZ0pVcVVsMXo1QVlMRHF5WWN5bWlWLzdY?=
 =?utf-8?B?MnpjNjRsSEZ6QTFTMEVtdFpXcXE3dWhNdGRyMGl1Q0xnZ2Rnd0JYbU9FTHgx?=
 =?utf-8?B?SWhob2hKUkRocUFLS0NSNkNXYlZ2YkZFU0xHd0JDdk4ybGFqYnBybUMyVkhr?=
 =?utf-8?B?QVZ5WFFHQVJGdGQ2cXdHNUU5ODUvbkNPMi9vNWo1SmdlWnFrSHYrR0NZZTFm?=
 =?utf-8?B?dGllTEZiWEJyRWtTN0NPUkRmUHgvUEt1K0dqbXh4V0pxQ0wvUGw2MTl1Y1ZM?=
 =?utf-8?B?U21JU3lXTVN1SGs1MENoSEM1MDRMd3I3Ym9yeUZKNmFCUGMwVkZoeFYwSVAx?=
 =?utf-8?B?eTVwVG9ZSDhBck14Vk8rWVRJMWp2ZmFzQmRDK2loQ2pWbElPTldyZXJEK2lH?=
 =?utf-8?B?dUVzTnYzZ1NxdW9JNXdMSTN5M2FjcWNyb1VNY2J6dTQ2M3NqUlpXWjcvRkN3?=
 =?utf-8?B?UytWRnlsU0x1YmlhNlQ3MW44WGNkWHhBWjBHOURURmx5NnlwQ2pCOG93S2c4?=
 =?utf-8?B?cmZOWmx6QUZtU3QrbXZtcStqQ25lUGl5b2taTEVjZlA5ZUp2bldjMGZqRmdE?=
 =?utf-8?B?aEVnaWZVbDdORDhoNGNCbGtDYk9KaEVrUXVYTzJjNFNQaGdRbDRoc25oaTJK?=
 =?utf-8?B?R0pwd3JUV1llVlNZTTIySWxGYmlNdUtlTFVEZDhUcWxwbEI1U2dJUHVBWFE0?=
 =?utf-8?B?THpvOTJ4bGt1dWVldkFXM1RHUnNqdksybTBmdS9DbVF1dnVjY21UelFiMXc0?=
 =?utf-8?B?L202Unc0RFkvWDhMYkFBTjdpdUVBL3YvWXFLQi83Sm1XcUtTK2N5MzBzdGFj?=
 =?utf-8?B?NlVCNVFxanFuYXZCYXRVbTA1Mm4zMHQ0c2lqRWJUWHpYT0F4ckJrWnNVRXR5?=
 =?utf-8?B?Q25TYm5BUXU1b1NnY1Z0Tjc0blpkbm8xZlB0MHQ0b2pPVWxId3hvZkFXMWtZ?=
 =?utf-8?B?SjdSNU9iQVp0V21zOC9YMFVPN3BlMUYrUjZ5Z2hHL0JmY3RpaWN2MlFvSDZq?=
 =?utf-8?B?dnRaQjVVcEl5UHpGSmhDM1kxTlVNV3NVWXZoVUNmNWhEWEJCVGgwSmpnSmNs?=
 =?utf-8?B?NFp5ZDVncnhMb0g4ODQvNHIxUzFHZXA4dm1vOEw2S2ViV0JQSEtGWFN4QkNa?=
 =?utf-8?B?dDFIUk8vTVBGUHVHTSt2T2pLTXpMM2kwNDB1aC85dmFVaTlRMDdTT1ZVZFFZ?=
 =?utf-8?B?US9iU2UvWDdWdjlJVk9KTDBKcDhmSmhieWhySHBLM0VJOFF6Vnpkb280ZmN5?=
 =?utf-8?B?SlRsOHJYTUxTeFU3MFp0S2oxbW5HNjlIaXYrWjlBSnpyZ0hweHY5aHN4cy82?=
 =?utf-8?B?OTRzcG1WeWI3czFGaHRuV0NxVXBwakdxbU5DTktSeEt6TGNxM3N4SFA1VUhq?=
 =?utf-8?B?N0dOQnlUeVplVTAvdjRnUmtaN1hhY00rZk9uckpxdm5nSFFkai9JNnp4V0NQ?=
 =?utf-8?B?cFdDVU5nTmhPVXVkdDhJZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWU0LzJLT29rejZiSGZ0QVhydFZoYWRJZExHT0JTdk5YTkZtSE9kcmNqb21Y?=
 =?utf-8?B?ZUZHOXhFVWswekJhMHoyOUZ4NTZXQUVQdVJxSFZwUktDd1dYaStSakgyMlBL?=
 =?utf-8?B?Z2ZkejhUaUFSdG93WHhrNDNVOGpHNldwNUh4aTJMTFQ5cFRxQkI2aUhSWU8x?=
 =?utf-8?B?NmhNWmJvWWpkS01SelRwS3pGaU9qbGFyMHdQM3BBK1FWbVlIMGVWbHBJZzNI?=
 =?utf-8?B?RkFUVG5zeHV1SHNGT1E3SExyWEpUbnRqMFMxVFhoaDYvTU9RcUtYZVphdDJp?=
 =?utf-8?B?TVdjbWJKSThHWUE5bVo1ekhBVnJ2emtaT3dOaU5hSWp6TGtBMWFjSFIyMFJq?=
 =?utf-8?B?SEJTM1FKK0tkMXIrQnlsb1dTUkVEQ3hWcUdnakRNenNjd05yaGZ2ZWpzODda?=
 =?utf-8?B?OWsvNFF6UCtGR0c0cjhuY3dkTnV0Wkx5SkJiQVFVYlc3SXVZbVp5Tm1GSnFz?=
 =?utf-8?B?anZMaUZzblJKempDYWxFVXlpMXhwVzcyaFNPNGNiUUk1K1dhYkU4OWZlNjJh?=
 =?utf-8?B?K1BFYTdTSGF3SXFoei9aRE5iQWZRVHZ6dFMvYUxPRitGM0JOUEdNY3NpMVJx?=
 =?utf-8?B?bUhtQ3pSdjlTeXFWMjg4TVE0OUNEUytqTHp1UVZ3MkpuSVViZUFWZ3VxMEZk?=
 =?utf-8?B?MDB2UG41MUlrUzMwZkwxekUybk1TR1AwcFRjdDFjS3ZLQ3RkcXU4cG5adHlH?=
 =?utf-8?B?V2pQWTdqZlR3SjU0cjI3MUFVNGNWOFArYUtQM2t0azVwZnAwRHE1UGZSQWNy?=
 =?utf-8?B?S3BkZFBpaGNUVS9wVlk4andyZGpjay9uZjYxV244YjZUYjlzbzNvNmZIMmYz?=
 =?utf-8?B?c0hud1pNUkZyK1NkdXNJUVhvOFBmbWY2RHFYTVQyRlYwMklUNm5rdmc3VVZr?=
 =?utf-8?B?Z08rYnVXWEN2RFpiUHRKclJtOW9uNjZCZW1BSC8yNVlyL2NSZjdDbStOLzI4?=
 =?utf-8?B?MEk3QXdMTktMTS9NZnhVQUhncDRYcnVYYjRoQ0dmREh3MThIYVhNTytTd1h5?=
 =?utf-8?B?TGp3bXVFTm9XclF4bDB6MkQxQmE5U3hoMGRubUxwN3VoekRIME5oZ1pRaVVM?=
 =?utf-8?B?dlEzeVJ2QjhGdW9BM0IxY2l2RTBxUkpCeGsrMlJlMTh2Rk14VkdpZC9IRHFM?=
 =?utf-8?B?cldDQ25DMjVIbWZsbmVRODlIRkhyamdIVlNUMmFEM21Fdm4rNnAvY2w0NEIr?=
 =?utf-8?B?UXJTZFA1bFZiU2J6SGtkU2pJNkJRYzd5cTJwT0tWaE15RzFDQ3ZlYjY0dlBh?=
 =?utf-8?B?Z1d4OE02TncrWVNYWjM3Vjl2cW1QODhVOVg4L1VoTHc4OVBIbVZaU3BYVkN2?=
 =?utf-8?B?MHA3Z3R1TUZtOUkxZXE5SEpzaWRXWXFiMHlqd2JRY2N3VU56N1F3REtpUU9S?=
 =?utf-8?B?NHEwaS81ZEx5eU0yVi9JZURMRndyeWljTXNwSG1LNVRPWDA5ZkpVQTBZcWpF?=
 =?utf-8?B?TnVMT3g2UUVDbDFtQ1g2TWZNTGp5Q3hnZnFUdDRjVUI4eHFsYk9tekVta2d0?=
 =?utf-8?B?MGwyWjRJYzRzdlhlQ001ZklzVFh2QVRXSmlpOVZHOUdZcGFUTXQ4WkphQ0Zs?=
 =?utf-8?B?eWpzdmdEaG1CUlQ3bTFTVmJLVWhLamhNaUF5am5yY3BEeGQyeXVPeUlqODNq?=
 =?utf-8?B?T3RGaGhlKzh2MXNXeHNkN0hCbHVqbUw1UzhoaEV3TCtxdmRaV1lRTTQwaGFr?=
 =?utf-8?B?Nkl4aHZHWUptMzRsb2RVWjdZQXBEZFR0Z2NQT1Fkc0tkZjFaS3g5Z2JxNTVL?=
 =?utf-8?B?bjhWSEthaEp5TEo4S2YyVElYcXVQT0RwaUMwc3o2NmdPalVqNnRLazV5YURC?=
 =?utf-8?B?d3V4enFrVDFOQ3lMb2FZVmRISU5VamRGU0UzQjIrZVhDSUM0NjFia1FaaTVk?=
 =?utf-8?B?VWNlZDByMnJGUWhRWGpRZzBRalZxTUd3dUd1Z2x6c3lka1luQlA0aTQ1djMr?=
 =?utf-8?B?ZjZ2QVZPNGFGdHZTTVdpS0RlMG12QVRhZFhHcXo1TUVHcDF3UjdPRENsa1U4?=
 =?utf-8?B?U1pXYVc5K1ViUU5VZkVXTU84dElUejRsUlFFVmpVdVRXSGZ6T0FMUUFTcnNu?=
 =?utf-8?B?WkwrV0JsRWQrKy9peTVxZVM5Nk1HOERhUmdCNWN0QzlqQ25hUGxHMU1Ba0pT?=
 =?utf-8?Q?DSe5NVUcVn/8sjD3OJNJ5wK22?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9049ce17-313b-4242-1793-08dd1f22a475
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:13:00.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTuc77asjMKZMf6aJfwUpjnHXGTF8SWEKxoPNvTZt8MHlwhXayH744TM41o5DL9AkH1R3Y+HX2AypuE/Uw9rlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
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

Hi Lucas

On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
> On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>> PMU provides two counters (<engine>-busy-ticks-gt<n>,
>> <engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
>> engine busyness, user must group these 2 counters using the perf_event
>> group mechanism to ensure both counters are sampled together.
>>
>> To list engine busyness counters use the following
>>
>> ./perf list
>>  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
> 
> this will need a rebase on latest versions of the pmu patches as we
> moved to have gt as a param rather than mangling the event name.

In case of multiple gts, there might be different engines for each gt
So should we display a common name and unsupported in case the engine 
does not belong to the gt?

sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000
#           time             counts unit events
      1.001208274    <not supported> 
xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/
      2.006382280    <not supported> 
xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/

sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=1/ -I 1000
#           time             counts unit events
      1.001229021                  0 
xe_0000_00_02.0/vcs0-busy-ticks,gt_id=1/
      2.006893807                  0      xe_0000_00_02.0/vcs0-busy-

Thanks
Riana Tauro
> 
> also let's make the name consistent across all places.
> 
>>  xe_0000_03_00.0/bcs0-total-ticks-gt0/              [Kernel PMU event]
>>  xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
>>  xe_0000_03_00.0/ccs0-total-ticks-gt0/              [Kernel PMU event]
>>
>> Engine busyness can then be calculated as below
>> busyness % = (engine active ticks/total ticks) * 100
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c       |   5 +
>> drivers/gpu/drm/xe/xe_pmu.c       | 187 ++++++++++++++++++++++++++----
>> drivers/gpu/drm/xe/xe_pmu_types.h |  17 +++
>> drivers/gpu/drm/xe/xe_uc.c        |   3 +
>> 4 files changed, 192 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index df1ba94cf4ca..7f0425b41f06 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -17,6 +17,7 @@
>> #include "regs/xe_irq_regs.h"
>> #include "xe_bo.h"
>> #include "xe_device.h"
>> +#include "xe_engine_activity.h"
>> #include "xe_force_wake.h"
>> #include "xe_gt.h"
>> #include "xe_gt_printk.h"
>> @@ -418,6 +419,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>     if (ret)
>>         return ret;
>>
>> +    ret = xe_engine_activity_init(guc);
>> +    if (ret)
>> +        return ret;
>> +
>>     return xe_guc_ads_init_post_hwconfig(&guc->ads);
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 633552fbf78d..9a657c6bb93e 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -9,10 +9,13 @@
>>
>> #include "regs/xe_gt_regs.h"
>> #include "xe_device.h"
>> +#include "xe_engine_activity.h"
>> #include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> #include "xe_gt_clock.h"
>> #include "xe_gt_idle.h"
>> #include "xe_guc_pc.h"
>> +#include "xe_hw_engine.h"
>> #include "xe_mmio.h"
>> #include "xe_macros.h"
>> #include "xe_module.h"
>> @@ -30,7 +33,7 @@ static unsigned int xe_pmu_target_cpu = -1;
>> /**
>>  * DOC: Xe PMU (Performance Monitoring Unit)
>>  *
>> - * Expose events/counters like C6 residency and GT frequency to user 
>> land.
>> + * Expose events/counters like C6 residency, GT frequency and engine 
>> busyness to user land.
>>  * Perf tool can be used to list these counters from the command line.
>>  *
>>  * Example commands to list/record supported perf events-
>> @@ -88,6 +91,13 @@ static unsigned int xe_pmu_target_cpu = -1;
>>  *    1950
>>  *    1950
>>  *    1950
>> + *
>> + * Engine busyness: PMU provides two counters (<engine>-busy-ticks- 
>> gt<n>,
>> + * <engine>-total-ticks-gt<n>) to calculate engine busyness. When 
>> querying engine busyness, user
>> + * must group these 2 counters using the perf_event group mechanism 
>> to ensure both counters are
>> + * sampled together. Engine busyness can then be calculated using
>> + *
>> + *  busyness % = (engine active ticks/total ticks) * 100
>>  */
>>
>> static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> @@ -105,6 +115,64 @@ static u64 config_counter(const u64 config)
>>     return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> }
>>
>> +static u8 engine_event_sample(struct perf_event *event)
>> +{
>> +    u64 config = event->attr.config;
>> +
>> +    return (config_counter(config) >> XE_PMU_SAMPLE_SHIFT) & 0xf;
>> +}
>> +
>> +static u8 engine_event_class(struct perf_event *event)
>> +{
>> +    u64 config = event->attr.config;
>> +
>> +    return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
>> +}
>> +
>> +static u8 engine_event_instance(struct perf_event *event)
>> +{
>> +    u64 config = event->attr.config;
>> +
>> +    return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
>> +}
>> +
>> +static bool is_engine_event(struct perf_event *event)
>> +{
>> +    return config_counter(event->attr.config) > __XE_PMU_OTHER(0xff);
>> +}
>> +
>> +static int engine_event_status(u8 sample)
>> +{
>> +    switch (sample) {
>> +    case XE_PMU_SAMPLE_BUSY_TICKS:
>> +    case XE_PMU_SAMPLE_TOTAL_TICKS:
>> +        return 0;
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int engine_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    const u64 config = event->attr.config;
>> +    const unsigned int gt_id = config_gt_id(config);
>> +    struct drm_xe_engine_class_instance eci;
>> +    struct xe_hw_engine *hwe;
>> +
>> +    eci.engine_class = engine_event_class(event);
>> +    eci.engine_instance = engine_event_instance(event);
>> +    eci.gt_id = gt_id;
>> +
>> +    hwe = xe_hw_engine_lookup(xe, eci);
>> +    if (!hwe)
>> +        return -ENOENT;
>> +
>> +    return engine_event_status(engine_event_sample(event));
>> +}
>> +
>> static unsigned int other_bit(const u64 config)
>> {
>>     unsigned int val;
>> @@ -217,7 +285,11 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>         return -EINVAL;
>>
>> -    ret = config_status(xe, event->attr.config);
>> +    if (is_engine_event(event))
>> +        ret = engine_event_init(event);
>> +    else
>> +        ret = config_status(xe, event->attr.config);
>> +
>>     if (ret)
>>         return ret;
>>
>> @@ -300,26 +372,54 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>     const unsigned int gt_id = config_gt_id(event->attr.config);
>>     const u64 config = event->attr.config;
>>     struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    bool device_awake;
>>     u64 val = 0;
>>
>> -    switch (config_counter(config)) {
>> -    case XE_PMU_RC6_RESIDENCY:
>> -        val = get_rc6(gt);
>> -        break;
>> -    case XE_PMU_ACTUAL_FREQUENCY:
>> -        val =
>> -           div_u64(read_sample(pmu, gt_id,
>> -                       __XE_SAMPLE_FREQ_ACT),
>> -               USEC_PER_SEC /* to MHz */);
>> -        break;
>> -    case XE_PMU_REQUESTED_FREQUENCY:
>> -        val =
>> -           div_u64(read_sample(pmu, gt_id,
>> -                       __XE_SAMPLE_FREQ_REQ),
>> -               USEC_PER_SEC /* to MHz */);
>> -        break;
>> -    default:
>> -        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    if (is_engine_event(event)) {
>> +        u8 sample = engine_event_sample(event);
>> +        struct drm_xe_engine_class_instance eci;
>> +        struct xe_hw_engine *hwe;
>> +
>> +        eci.engine_class = engine_event_class(event);
>> +        eci.engine_instance = engine_event_instance(event);
>> +        eci.gt_id = gt_id;
>> +
>> +        hwe = xe_hw_engine_lookup(xe, eci);
>> +
>> +        device_awake = xe_pm_runtime_get_if_active(xe);
>> +        if (!device_awake)
>> +            return 0;
> 
> why if_active? what if it was active and just went to sleep?
> 
>> +
>> +        if (!hwe)
>> +            drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
>> +        else if (sample == XE_PMU_SAMPLE_BUSY_TICKS)
>> +            val = xe_engine_activity_get_active_ticks(hwe);
>> +        else if (sample == XE_PMU_SAMPLE_TOTAL_TICKS)
>> +            val = xe_engine_activity_get_total_ticks(hwe);
>> +        else
>> +            drm_warn(&xe->drm, "unknown pmu engine event\n");
>> +
>> +        xe_pm_runtime_put(xe);
>> +    } else {
>> +        switch (config_counter(config)) {
>> +        case XE_PMU_RC6_RESIDENCY:
>> +            val = get_rc6(gt);
> 
> in light of https://patchwork.freedesktop.org/patch/627914/? 
> series=142297&rev=2#comment_1144680
> I'm thinking that one way out is to stop differentiate these 2
> events.... always have a worker in which the actual value is read via mmio
> and always restrict to raw_spinlock_t the locks taken when called from
> perf. This would fix it here and avoid the same trap i915 got in.
> 
> Vinay, this means changing your patches (first patches in this seris) to
> cope with that. Do you think that would work?
> 
> 
> Lucas De Marchi
> 
>> +            break;
>> +        case XE_PMU_ACTUAL_FREQUENCY:
>> +            val =
>> +                div_u64(read_sample(pmu, gt_id,
>> +                        __XE_SAMPLE_FREQ_ACT),
>> +                        USEC_PER_SEC /* to MHz */);
>> +            break;
>> +        case XE_PMU_REQUESTED_FREQUENCY:
>> +            val =
>> +               div_u64(read_sample(pmu, gt_id,
>> +                           __XE_SAMPLE_FREQ_REQ),
>> +                   USEC_PER_SEC /* to MHz */);
>> +            break;
>> +        default:
>> +            drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +        }
>>     }
>>
>>     return val;
>> @@ -643,6 +743,12 @@ static const struct attribute_group 
>> xe_pmu_cpumask_attr_group = {
>>     .unit = (__unit), \
>> }
>>
>> +#define __engine_event(__sample, __name) \
>> +{ \
>> +    .sample = (__sample), \
>> +    .name = (__name), \
>> +}
>> +
>> static struct xe_ext_attribute *
>> add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> {
>> @@ -682,9 +788,19 @@ create_event_attributes(struct xe_pmu *pmu)
>>         __event(2, "requested-frequency", "M"),
>>     };
>>
>> +    static const struct {
>> +        u8 sample;
>> +        char *name;
>> +    } engine_events[] = {
>> +        __engine_event(XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
>> +        __engine_event(XE_PMU_SAMPLE_TOTAL_TICKS, "total-ticks")
>> +    };
>> +
>>     struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>>     struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>>     struct attribute **attr = NULL, **attr_iter;
>> +    struct xe_hw_engine *hwe;
>> +    enum xe_hw_engine_id id;
>>     unsigned int count = 0;
>>     unsigned int i, j;
>>     struct xe_gt *gt;
>> @@ -699,6 +815,13 @@ create_event_attributes(struct xe_pmu *pmu)
>>         }
>>     }
>>
>> +    for_each_gt(gt, xe, j) {
>> +        for_each_hw_engine(hwe, gt, id)
>> +            for (i = 0; i < ARRAY_SIZE(engine_events); i++)
>> +                if (!engine_event_status(engine_events[i].sample))
>> +                    count++;
>> +    }
>> +
>>     /* Allocate attribute objects and table. */
>>     xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>>     if (!xe_attr)
>> @@ -744,6 +867,30 @@ create_event_attributes(struct xe_pmu *pmu)
>>                             events[i].unit);
>>             }
>>         }
>> +
>> +        for_each_hw_engine(hwe, gt, id) {
>> +            for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
>> +                char *str;
>> +
>> +                if (engine_event_status(engine_events[i].sample))
>> +                    continue;
>> +
>> +                str = kasprintf(GFP_KERNEL, "%s%d-%s-gt%u",
>> +                        xe_hw_engine_class_to_str(hwe->class),
>> +                        hwe->logical_instance,
>> +                        engine_events[i].name, j);
>> +                if (!str)
>> +                    goto err;
>> +
>> +                *attr_iter++ = &xe_iter->attr.attr;
>> +                xe_iter = add_xe_attr
>> +                    (xe_iter, str,
>> +                     XE_PMU_ENGINE(j, xe_hw_engine_to_user_class(hwe- 
>> >class),
>> +                               hwe->logical_instance,
>> +                               engine_events[i].sample));
>> +            }
>> +        }
>> +
>>     }
>>
>>     pmu->xe_attr = xe_attr;
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/ 
>> xe_pmu_types.h
>> index 44295747bd5c..a5906d255309 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -36,6 +36,23 @@ enum {
>> #define __XE_PMU_ACTUAL_FREQUENCY(gt)        ___XE_PMU_OTHER(gt, 1)
>> #define __XE_PMU_REQUESTED_FREQUENCY(gt)    ___XE_PMU_OTHER(gt, 2)
>>
>> +#define XE_PMU_SAMPLE_BUSY_TICKS       (1)
>> +#define XE_PMU_SAMPLE_TOTAL_TICKS      (2)
>> +
>> +/* First 8 bits of config are reserved for other counters */
>> +#define XE_PMU_SAMPLE_SHIFT                    (8)
>> +#define XE_PMU_SAMPLE_BITS                     (4)
>> +#define XE_PMU_INSTANCE_BITS                   (8)
>> +#define XE_PMU_INSTANCE_SHIFT \
>> +    (XE_PMU_SAMPLE_SHIFT + XE_PMU_SAMPLE_BITS)
>> +#define XE_PMU_CLASS_SHIFT \
>> +    (XE_PMU_INSTANCE_SHIFT + XE_PMU_INSTANCE_BITS)
>> +
>> +#define XE_PMU_ENGINE(gt, class, instance, sample) \
>> +    (((class) << XE_PMU_CLASS_SHIFT | \
>> +    (instance) << XE_PMU_INSTANCE_SHIFT | \
>> +    (sample) << XE_PMU_SAMPLE_SHIFT) | ((__u64)(gt) << 
>> __XE_PMU_GT_SHIFT))
>> +
>> /*
>>  * Non-engine events that we need to track enabled-disabled transition 
>> and
>>  * current state.
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0d073a9987c2..e50d23d53921 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -7,6 +7,7 @@
>>
>> #include "xe_assert.h"
>> #include "xe_device.h"
>> +#include "xe_engine_activity.h"
>> #include "xe_gsc.h"
>> #include "xe_gsc_proxy.h"
>> #include "xe_gt.h"
>> @@ -210,6 +211,8 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>     if (ret)
>>         return ret;
>>
>> +    xe_engine_activity_enable_stats(&uc->guc);
>> +
>>     /* We don't fail the driver load if HuC fails to auth, but let's 
>> warn */
>>     ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
>>     xe_gt_assert(uc_to_gt(uc), !ret);
>> -- 
>> 2.40.0
>>

