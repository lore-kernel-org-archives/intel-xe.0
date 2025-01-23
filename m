Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF82C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9D910E0CB;
	Thu, 23 Jan 2025 18:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3DRd26s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BBD10E0CB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737657036; x=1769193036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+rT+YCcN/x3K94UVEmBKlQ/+e1bcACjzRjYJtdCvhRg=;
 b=b3DRd26swjup+nLU1YjtHSy75ups1KMyYoo0QzjnGWjk2j8+k7v3J+xH
 MkBoqjvc/iHrQJL1MnaRGi9/pdBT9GecwTF7PkKj3csolUuSPi9+Q5A2q
 XxVc8lrtZQJ09pLOsOWvWaUKN/PxUQpZvZEIF0mE2GGRVyhnjCdDwgaoD
 TS7xKtQ1GPUOwn2M23RCHhGhP4VXPpSiaYNcpqtgmYNtaXQS2+1q8qEhk
 NMKUccwgK1+MHSYRF4ogO3Wze/xsH5tsahPwynD3QdFHE3I6+l+D0u3n8
 KvPZDk+V95SFS3OptBILw8UAb9YMbEXk+z5R76zgNIDDfhL4HZgoHMYl9 A==;
X-CSE-ConnectionGUID: FHqb92zVRg6UhDAH4a+jyQ==
X-CSE-MsgGUID: Kt3kR+kYQ6Gp4+j0BMfNoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38275731"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38275731"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:30:35 -0800
X-CSE-ConnectionGUID: syguGU7JTHegTfUFqohvRQ==
X-CSE-MsgGUID: UBQC0wD2RICPpZGPRBBUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="107545578"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:30:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:30:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:30:35 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:30:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcB68HNBgcbPidfO5iKMbMdyvldap9hKkE0LIolKierCveFcU0roz3fuqdQQ2QMZSESML/pRBFpfIoXen//s2B27eNH83yittSq/2j9hapPPZdaZ6WMliu7Hv7UIZr7nHub9S5yixHSNENakxKXUhMu3S3sfNR+grC0Qq3GY80DOfSzrLAF/HnU7txNxI1+YkjJK4taDgm50IpIk3M/vMwXfdavaM4Rky8iAcTn1TewaIuffAOgssSSbcnqHmHsBncyYGUpSgxcvGjDmxiZUN3SNnp3NKHRjVKhTaq2/WH4CFbi+ZzINRKcRl3yqVOHUlnKakoX7pB2bZxVMveg/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMCbC+jzSPo0OFsVjyF/Q0HJkHfz7vAj5Ey3DbB7M64=;
 b=Z0oWYr+FCZtcbpuiw1BYp0/bFMCMGasSLf5sz0CIYUWduRmZpXmUtUq6W21Pws//okvtmVpW6MqLMbHApY2ysedki8vSs8T8Eb9V7U1TLAHC84h/VyJqd2mCfgSRDkbdQzy1ksQ/uYX58e5GoOhFCOfzgi36t2re0RZNJHLo8X4T4bx8gE3l2k169dYhpIrS1RruYxg2cw1FSAMchteQZjZah+Hi0PHVFiIbftbWDZ97zbfd2ouLFiJg/ULzQAJacRUm0JwPkDbEBCS2lPlLPj0XFGuHHDaWa9JwwmyQ2KaRBMqY5WF1FikCS0wXMOm5DjSiVDaZtTISzT11dOkwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 18:30:06 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 18:30:06 +0000
Message-ID: <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
Date: Thu, 23 Jan 2025 10:30:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
 <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ca4e8c-f315-47d6-96db-08dd3bdbf573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czBJSWlkVUUrSzIzajIyMWM5R1prOHdLN0FlWXZLVDVSMFlmeWpPQ3hqb3l1?=
 =?utf-8?B?OUF6N1ZUbWcrM2RhSEZLT3dzanpoWmt4UWpUY1doMEFLOCtVNzc3MnNqc01w?=
 =?utf-8?B?UXlKYzZVSHYvSGxMSEE1M21TRVM3NlloVFRFZTVTMmR6ZjYxUGcxSitSblY2?=
 =?utf-8?B?K1lSTkV6MCszU1d2ZGErelhFZDVIQkxEa3JxNGo1SlJaUzRDNDlDcHJ6YktE?=
 =?utf-8?B?UGRmUDdmUmU5eXE2Smo5WWduRWFSZUJoNWlWakI1NGE4TmxKUmJtZE1jR3RV?=
 =?utf-8?B?WU9MT0E1bEtrL3BPU1BVbWpRYkNhaGQzMUg2TFhOb1RQL2tBWWtXMzZ3eUph?=
 =?utf-8?B?SmpSQ3pLQnJnYWsvaHhQa1ZTRytDUmdQVC9kL21MTmUwaTh0QmJGT2RkSENX?=
 =?utf-8?B?NmhMampjbTFYNUVGMnJ0QnNYZmduaFhDdmxWamlmaHh3REtnU1VMcGU1aS81?=
 =?utf-8?B?WDFVeGQ3bDlaWEhRZ3NORkhmUXBrMWpqTGQxM0NkU1NGeWx6WW5hYTNoaWk0?=
 =?utf-8?B?V3RXbkdJQTUweTBOWXR6VlVYWE91aWJjSXJDNDRZNkk5c3dqczJUN0FCTVBQ?=
 =?utf-8?B?c1J1enNCRVhzRHBGTUQ4YkN6SmFaR0FMVVZIUjZIUno4NXpoY1RiUkZnZTlV?=
 =?utf-8?B?R1BpOFdkN3ZQdFZuQUpuNVJmOXl0dWJBaVNVSFRQQ3FETG8rdDJ1ekhUTUlT?=
 =?utf-8?B?MW5Zam5LRFJzR0FxeDZtVWFZUFZ4QTZHY1B2RlQ3TWNsYTBzSnpUemhJOGMy?=
 =?utf-8?B?WkN0SzVpcEpuTkJTZXFNb01qa0RWUGlGdjNVMytzM2EvOHkyN3lPa1dyNlUw?=
 =?utf-8?B?MDUwLzRpYW5Qak9mZ2dWZmpDOGo5Wnh0eXRJanNjMXVvRy9OcWlXekxhMEcy?=
 =?utf-8?B?aGg3OUtoc1A0RlJ0TWUrdFNXZkV0WVdQLzFUL2IyZnVpUTB2a0tlK21UL00r?=
 =?utf-8?B?UFRldDEzcENYaWp4TzNpcHBUVDFDS3ZGNGI3QlZ0MXpTYjFCNlBFT3FiWjBC?=
 =?utf-8?B?VCtBeG92OTREMmNNSkNrZFFQL0VacElEVFdQMTlNRDJmakErTk5QT2NUTTgz?=
 =?utf-8?B?ZUsxNGZVbG1lMFk1RHJsVWhBTWQ1aDdpQmJBMXZXdGhGYXVCS2JiRW9UbTJ6?=
 =?utf-8?B?STh1VExVdFZKM2UrbUlQd082bU5UMGRmRFJKLzc4SDJuWTQ4ZC9NeGZSNTZh?=
 =?utf-8?B?Q3R6dE5RNFRBTjE4QlVheUNXYXovMmMyVTFFK1B3YWswc1pLNkMrRjdnQlNm?=
 =?utf-8?B?VzNWQkJGbHVlN010ZFdKRW5JK3NhbEIrRy8zejE2Z2hLT1N3SDRjbEs1dEto?=
 =?utf-8?B?Z0VFNEcwLy9BV296WjBHamlGYnBIbjVaL2tObGZsa3BFMFJDMUN6UEF5QW5P?=
 =?utf-8?B?aDZ4Mk5iS3VPaE9MNUFQUnkyaXhWc1VBMjZNM2xTdjVSdXlqaHgrWnBNaVZG?=
 =?utf-8?B?eFFXTnh1bXpIWlNTU0xkS1pEVG40L1BzOTNIenZXNHVxUnJyTmtQSUVHSDRs?=
 =?utf-8?B?NE14ekdPZVpsckdOQUk3NC9jQVdrbW9ldEpTVlJkb0hzbHIzZG9yL0V5V05a?=
 =?utf-8?B?UXpNQjZIeFRiSXhEVUdNSUYrRFJEazl0QjlaNDl1ZzFIZ2xTS3FCS2QwMTU5?=
 =?utf-8?B?ZnFCRG0xNWpadjdOL0Z5RHpVVzJGNUhEM3RpdEczaFpsTWQzWFl6RkxXMWJz?=
 =?utf-8?B?N2xhQjMwNkZVaWFLdFVEbFd6d1QyNktUZXEwNDVIUTZnRDNQS1Q0WE8waDRh?=
 =?utf-8?B?K1pnTEdPamRsYWV1K3JSVHRzL0tmR1cybk5MQ2xpTkJCbjR4cndRQWZlci84?=
 =?utf-8?B?R1JZS2NnbVpaaVVBK3loK3o0L3RSb250dUtNblYzUGVXdzZmOUxiN2l0VEJR?=
 =?utf-8?Q?NcLlY/GV4HF+3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmpXYXdUL1dzY1lnT2xUekE2aS9QYUp3RUF6WE9LRnhLTDJ6OHpsQnZFdEpx?=
 =?utf-8?B?WU1TVUVJNkVqUGdjYWxPbm5neDR3dVQvUEcrNFRtUUVvV0c4RmtMNGZXSFRP?=
 =?utf-8?B?MytnVTFlV2FsRE9ySjF6R0pzK3BMVnZLUVplcDZpbzd0cjBQZGhwbzFDK09t?=
 =?utf-8?B?YXlSMERsN3pSVUNCUDBIQXNsU1pUUVBmSkkydGhuMXh6c3JwTzU4OC9QbFhW?=
 =?utf-8?B?YlB3SEc5VEpBbmRrL2M4SXptOU1BSWJiVlpOK1kwRDI4Yzh4WHdJVVVFaUI0?=
 =?utf-8?B?Vk9BaTEyWWhJWXNzRXNrSmZrQTVzTWRxUnFRdE81cFhGQjBPcnBPalhodU5w?=
 =?utf-8?B?Mmt0SnlHelN4L3c1OG90cTQ2NlVUUFF5VDE2dlpNeUNQeHB1ZFNzbXFIeG4w?=
 =?utf-8?B?UkgvL2lrcU9yQnNiMmpSeE40b3JNYTdpMVpNWjYzWm4xUEFKZ0hMVVZndktK?=
 =?utf-8?B?eU1RSEdwYTN5bGgzaTNwd2hTNzRNSDBVK0JnRXBTOE96d1pXR2RkWGFKM213?=
 =?utf-8?B?dTNjRk5saHdkYVRkd0hvQmlKZXZKU0NLZUQ5T0hBVU9zd09EZlc5aFZSeUJ0?=
 =?utf-8?B?Ni9lZm5ZTnR5a0RBRWNnUWJYM3R0OTNGSVNYQ0hmTVVuRFp2bENZOXNUUFAv?=
 =?utf-8?B?UzRFd3BDZ2N1SGo1ZGFwYllYNXd4K1hTQktnTzRncjRxY1g1NE1xemhzSWFE?=
 =?utf-8?B?Vzl5YTFtb2pnUEkwSkZPMUxRNDZKb2NjYlllUUw5SGNHeUdjVkFmN3EzVERO?=
 =?utf-8?B?V2FVdkg3ZmFXaXhmSHhxTm5jKzJpKzR6NE00cDVSc1F5bnM0UUdwYUJZenBC?=
 =?utf-8?B?MEt5T2o4cWN6cHJ0MGxEQXZiYXBhQm9GTG13UTg0WWJqRGYvSDJobHViQ3hh?=
 =?utf-8?B?My9jWGh5RCtoU2Jub0p5WFJlYm9UWGdWVit4dVZjRCtETzBzY1pMYWV4WUlR?=
 =?utf-8?B?aHkyMU44V1YyeVp3VFA5U1orcjlSd1YrVk5WQlhWb3lBa2lXd0k4SDJ5OG5r?=
 =?utf-8?B?OXZyYldKeHJEczVXSTdVQWUrMXJjd3BDbjhtWW56ZUZJb0dBTlZDbURSVHpP?=
 =?utf-8?B?YlpsUUFLcHdiTG5TZmMybEN1R3pzc1NvdkpNbmlQcmZHMmtPVVpRbzFsRXlP?=
 =?utf-8?B?Y25mNklCT2RZeUt6L01Sbmxyc1hwVVZMMWdvL0M2TS9JcHY5elY2UnRma05D?=
 =?utf-8?B?SE1sM2EzUTB0eGI2bDNCTmlSZFRvd2tBSWNJNHQvSlBZRlo5S2JUdGZpTGRl?=
 =?utf-8?B?L01hUE0za09CcjN0czdyem8vay9ta0FxT0pnTnVRUEF6UllMMklIdnIwV2g5?=
 =?utf-8?B?OWFYNFFHTXEvRnFsSHZRamFxRE8rM3BKK0lVOXNpSlkzT3ZCMFVDNHRNYTBu?=
 =?utf-8?B?OWNjVGZkSnRHSFNEalpVbm5IclZUd3ZMN3FBUmNVMld4RFhxNy8zQ1RhUHpy?=
 =?utf-8?B?dlU5K1NsaXVFZWRubDhJSkI1M3VtQ092K3JNR0dndlkzVHZXVXV2bVFsVElD?=
 =?utf-8?B?N1RORno1QXh5L29UQ0hyVW82dW9CaSt5NzZFbDU1aTFtcEVyc3RVOGFTSm16?=
 =?utf-8?B?Nk1uS3Bsd2duakxOK0wxbi93MUJrTXZXNlJDQko4OXVQVUxPNWVUV3paMHQ3?=
 =?utf-8?B?S0w2eElmZ2E3cWFYTXp1OCsrcFowL01DcHFOanN5eVVWMDUrV1VMOC91cEUr?=
 =?utf-8?B?bktQMU40UjBSVDMrdzdUVmt0ajBIQ1J3OEdOaVB0Ky9TUXlIOVh4VkFDUFJK?=
 =?utf-8?B?U1J5eU40dHdCNGRIRUxpcnQzVUFocmtNVnJ3Q2oydC8zMHVjaHhBcUNsazFo?=
 =?utf-8?B?TmRKcFg2SnA3SG90dVV1MFNRTDIwWkNpU3FYOXBJQVI1RmZCQVg0dkNhOFpz?=
 =?utf-8?B?RmJOeG82dlNSSXZiWXRTUjFmSnY0Y0wzY0Q2bkJZNDJIU0ZMbUhUWHVjVUt4?=
 =?utf-8?B?T1FxNjRJUW1BWlQzR1N2ZXRnNDhiKzQzanJMR25IVWVSZTM4ZkFSODNMdW45?=
 =?utf-8?B?MVU2cjRaZS9ORVZFY2NjYXlPRHljV0drNGtJR0NIUVhSSjdZWTdXbzVna2Q2?=
 =?utf-8?B?bGFXeW1LV2lYUnJ4SEhpMFovblhDL25xa0ZRcC9IMU40ak9ZcFdiMXQzS0xF?=
 =?utf-8?B?cFJ2TjRoTVBoeTU1MS9uNmx5N1BVNU5IbURRL25oQmZGQ21zeGpPTTFFRE9P?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ca4e8c-f315-47d6-96db-08dd3bdbf573
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 18:30:05.9535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pCtb5Y60L/NpPoMUPRbRXKtRurEotp2EPgAz9SJfOXzSVIaz/q9f/jLIlk3M8IjZGJBFeGsIMw4WNXxV39pAB+N8cSSdkAQinDY3ia4O3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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

On 1/23/2025 10:24, Souza, Jose wrote:
> On Thu, 2025-01-23 at 10:18 -0800, John Harrison wrote:
>> On 1/23/2025 09:59, José Roberto de Souza wrote:
>>> The GT tile is already available but was added again in commit
>>> c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
>>> so here deleting it.
>>>
>>> Here a devcoredump example with the duplicated information:
>>>
>>> **** Xe Device Coredump ****
>>> Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
>>> kernel: 6.13.0-zeh-xe+
>>> module: xe
>>> Snapshot time: 1737573530.243521319
>>> Uptime: 2588.041930284
>>> Process: deqp-vk [8850]
>>> PCI ID: 0x64a0
>>> PCI revision: 0x04
>>> GT id: 0
>>> 	Tile: 0
>>> 	Type: main
>>> 	IP ver: 20.4.4
>>> 	CS reference clock: 19200000
>>> GT id: 1
>>> 	Tile: 0
>>> 	Type: media
>>> 	IP ver: 20.0.4
>>> 	CS reference clock: 19200000
>> This is an overview of all GTs/tiles in the device within the global
>> section.
>>
>>> **** GT #0 ****
>> This is a section header telling you that everything which follows is
>> inside GT0.
>>
>> It is not duplicated information. And if you remove it then you now have
>> the information of all GTs back to back with no indication of which GT
>> they actually belong to.
> Can't you get this information from Name + class + instance? if not that should be placed in one of the sections below.
No. I was trying to do that originally and determined it was impossible 
to do reliably for all current and future platforms. Hence the section 
header was added.

It is also much, much, much better to be explicit about debug 
information than force people to guess based on heuristics or tribal 
knowledge.

>
> So this should be placed in one of this sections:
No. It is not information within a context or within a hardware engine. 
It is the reverse. All the following contexts, hardware engines, etc. 
are within the GT.

And when you have multiple GTs in a single dump then you need a definite 
delimiter to say that all the following is now in a different GT to what 
came before.

John.

>
> GuC ID: 13
> 	Name: ccs13
> 	Class: 5
> 	Logical mask: 0x1
> 	Width: 1
> 	Ref: 2
> 	Timeout: 5000 (ms)
> 	Timeslice: 1000 (us)
> 	Preempt timeout: 640000 (us)
> 	HW Context Desc: 0x025e0000
> 	HW Ring address: 0x025dc000
> 	HW Indirect Ring State: 0x025e3000
> 	LRC Head: (memory) 152
> 	LRC Tail: (internal) 296, (memory) 296
> 	Ring start: (memory) 0x025dc000
> 	Start seqno: (memory) -126
> 	Seqno: (memory) -127
> 	Timestamp: 0x0000035e
> 	Job Timestamp: 0x0000035e
> 	Schedule State: 0x441
> 	Flags: 0x0
>
> **** HW Engines ****
> ccs0 (physical), logical instance=0
> 	Capture_source: GuC
> 	Coverage: full-capture
> 	Forcewake: domain 0x2, ref 1
> 	Reserved: no
> 	FORCEWAKE_GT: 0x00010000
> 	RCU_MODE: 0x00000001
> 	HWSTAM: 0xffffffff
> 	RING_HWS_PGA: 0x018db000
> 	RING_HEAD: 0x000000ec
> 	RING_TAIL: 0x00000128
> 	RING_CTL: 0x00003001
> 	RING_MI_MODE: 0x00001000
> 	RING_MODE: 0x00000008
> 	RING_ESR: 0x00000000
> 	RING_EMR: 0xffffffff
> 	RING_EIR: 0x00000000
> 	RING_IMR: 0x00000000
> 	IPEHR: 0x7a000a04
> 	RING_INSTDONE: 0xffdefffe
>
>> John.
>>
>>
>>> 	Tile: 0
>>>
>>> **** GuC Log ****
>>> ....
>>>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_devcoredump.c | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 1c86e6456d60f..2996945ffee39 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -111,9 +111,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>    	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>>>    	xe_device_snapshot_print(xe, &p);
>>>    
>>> -	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>> -	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>> -
>>>    	drm_puts(&p, "\n**** GuC Log ****\n");
>>>    	xe_guc_log_snapshot_print(ss->guc.log, &p);
>>>    	drm_puts(&p, "\n**** GuC CT ****\n");

