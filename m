Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D457CD3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 17:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E0C10E17F;
	Mon,  8 Dec 2025 17:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVQPQUnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7810E17F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765215672; x=1796751672;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=46tTEEWWDHXQE0EjautqGEJ+0qNOdl0lHRASJHLoaF0=;
 b=ZVQPQUnMxR7lKXyMVLf54lPrMX5DxqROz061nsL3fUD/6TVdKwjZmxnG
 oCU/UQvDPJzf9a9We8oFH4twIbX3cg68/lN6xqNuLslwtTh4TEgxPtjaX
 2yNFMUEakMDpw634FiYbVURcglKkH9gY3i626BG9iurRGlEFHyFT0gdJL
 pCplGunlz10LkkAKTX88Kug/2MrAJTRs8Ndpo1Dz8hIrlOjj2PP3GNTDI
 Feg9mWm3fnPMyNfcd9eIFu/QHbgg/S8JgWJaqjwEDCkX3HZTgFYQiFXKr
 oJ0VH2n03BWwY1m8k87KalHhzTa/S5wr6WHkUh7sO8NDu1vIJIF4DmaIY A==;
X-CSE-ConnectionGUID: yVCNCwFFS1i/zYevnmfADA==
X-CSE-MsgGUID: n/dJ7mINRcGvCmct0cEc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67057456"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67057456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:41:11 -0800
X-CSE-ConnectionGUID: Or75N85wQ8qGOXLvN2oXTg==
X-CSE-MsgGUID: 86pR61vXTAyP5oM/EfJF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="226656504"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:41:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:41:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 09:41:10 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF5AEDZi9H7zianBdY2I7nCI/1KtEInWSqDu3/2w0LYZpnm1c3kB1ic5mqcC8/tRa75F1UL4541bcUk3k5d5K2OpW3HWSawHWcXi3H6BXZ6l3cGm5sx7jx7PGVsTTFOiHe300kjoUsnqi5jlYvE1P9gV3aCfACe44dbswdI6fkEx0hZFWJ6xQiQI5wS+9EBXkC1J/1BjrVQp3K97nhhEqzmCbtYNlanuqgshZLzTTqofpTzJ6Y7Xu6xs2cP3A6qsBnYGjEXAWf1pomw8BmQln/ufA4P6eFuX4CBm7n7lLr/ws51PsmiAA9VNQnu3apQ+Eg8JpjMNpTD4zU3FEPkypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOmTEwsh+SBKCBhplKayHJ6HQQ2kFKUfWfzb6iS0EGk=;
 b=rFlgwVsYaABDHHoeCtF7+a9ahziKId9vi67vn/w+8gH95OI1XuHJyFbmO56kAAGykzi3e7r1JgX+4AnQumGmPkXBnIPSDik7n/qgMM4VkjbkYbbGSwWRWErteKwYRIpaXJxd9xrdVoIViry8sFKDzWd+KgVctJ5Sw8Qhk3PDLPtOhe7j8zmAeDLzrdOy7issksCf6pF+F2DIx4oIvmMOtXQlVhNvOeJffU8snxREfEtG1dQbls1IF3LL06kqmFNeQB6+ZVA5+kE7Ly9PalFCKIh3sqHsQUuZAK0Z0Fy/05e5gaULEWz0zlgGyg7YvJDZ4BmyiPKGMBNWXtBtRTg2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV4PR11MB9491.namprd11.prod.outlook.com (2603:10b6:408:2de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:41:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Mon, 8 Dec 2025
 17:41:08 +0000
Message-ID: <166f18ae-3696-4374-99eb-250c77abe59f@intel.com>
Date: Mon, 8 Dec 2025 09:41:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-16-daniele.ceraolospurio@intel.com>
 <5e09411a-0f84-434d-9d3a-8fa813353c26@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5e09411a-0f84-434d-9d3a-8fa813353c26@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV4PR11MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: a3df1ac5-fde2-4ac3-1fa3-08de3680f81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2dkUmdyWW55OTRiU2cwbi9DQ050ZVBxRVdBWjlWZ1RtRDV6VllpZHhHT0hP?=
 =?utf-8?B?a0JpcU5obEtGYmI2MjQ2Kzd6ZG14VjR5Ty83S3F3QnJ1dEZkcVV1RFBmbUUw?=
 =?utf-8?B?aGtrZW44dUR5OUNuU0dnMHBzVXY2N21oeWY3T0lGdVJEcktEVG5YN290QUlL?=
 =?utf-8?B?b1BpeWdyNktwc3c2ODhyU3IxSW9HbVM3MFZiM3RBK2VKOXlkeXlSZndRdTBW?=
 =?utf-8?B?RUNya0wweGt1L3NPWUhrZFFaQnduMTE3dWY1ZEZJU1JyUkRtQ3lqSTlZODRh?=
 =?utf-8?B?eWVyUkpqdVhJT0Vva0hPRjJRK1ZMQVZaS2taaUhsWDV4a1RvVzhUUGVsVjBj?=
 =?utf-8?B?TFdHTU9HRmthWXcrdWxlY1UwU01OL2w2RFlnN2JOZ2RhdmYySDZEdjMyMSth?=
 =?utf-8?B?ekg0NTZ5UjZYWGpmY3dSWk5ZWmt2WmZDOUVSTGNKK1F3TXdPMXdCUGFSOE83?=
 =?utf-8?B?eVBsVTExUWpYLzhsVk5GMFl6TDlFM1daSFdPMk02WVAwM24yU1liL2FtakdS?=
 =?utf-8?B?cGV1UlRzY0lsVGpVTHc3QmFIeWM4Q29teGRYUnZncGZmakRFaXBhZ3FLem1C?=
 =?utf-8?B?VVBMWTJzRXdqaXlQN2JQQ1ZwUmcwai9DaEl1WkprcWluZkhVVjVLZHFDQkI5?=
 =?utf-8?B?R2xVWXhYTk03SVUwdElXSW4rbzdQZ2E0RERtM3FPU1NEaE5RT3doVnBkZUVW?=
 =?utf-8?B?ZVJ6SWZXZmtaNldlODBOMFhTdGpzT2wxY3FzSk5OeURGNC80V2V3Qy96aFMv?=
 =?utf-8?B?ejc4MVI3RTZvdE5RK3RaQ2t5UnFVVkxMamZEdXVFV2NKanJkOTZVVlprVm5q?=
 =?utf-8?B?Z3VFRDhlaE9CS0QxalVCSjZYOGwwQm5zVHF2V1czaGp1THIxUnovMFNjbEdG?=
 =?utf-8?B?NW9DdWIwbXNuNGhqeTZ5aHNKbTg4ME1iZWxIdXduUUVnZlBoTTk1VUtzWVBx?=
 =?utf-8?B?RWNIdXpiSTVVNDVwVTlzZnJuMlJSK3VqMHJ6OUowTWhqR3VTMzlWc2JxY1R3?=
 =?utf-8?B?R2lUc3RJS0E4dGFDeHk5cFFwZE1YbUVQTm9iS3Npb0pPRnFFK05YRTZ2ZTl5?=
 =?utf-8?B?L29uOUFZaWtCTUVtbFpyTnBRS2RhUC91dnVrWkQ4aHZJWUFqUEl0UENIQkYr?=
 =?utf-8?B?Qk04bUU4Z1hKOHZBNFQ4L1N0N0NoSng2TGZsZ3QyYllZWFJDQksxRldTWGJR?=
 =?utf-8?B?cTJLM1lyRVA5MGp0eFNRT2xRMWQrbFhWZHJZbk40SFhBcTBPcXZESGdNUWN3?=
 =?utf-8?B?bmx2UDd4VEExRCs3WGpwZGVmRktUQjRtTHlVYjFtRllTVnpkVktnYTB3STF4?=
 =?utf-8?B?b0V5djdHeHUyams5MTVNM29iTlV6OURObjMzRUFiaFZoTGpVL3F4MzV5YnhL?=
 =?utf-8?B?Nkd6bFFzd3ljN1JtZXg3eWZrSDFtbUZ0cUJ6OEVkNVYxS2hyWDdDYjMwdVlx?=
 =?utf-8?B?OVg5K0dWQ2xvTDZkUnBsNnlxcnhXcUZjd2lWY0JnR3RJaE56VC9LMzRMUzhM?=
 =?utf-8?B?Z3BFNGxTOEh2bjRtQVVvQ1ZGenhRRDh2RmcxTmZkTUFGZWdLZExEZWU3Sld4?=
 =?utf-8?B?bEp1UGM5MHpUSDc0ak45VjBFUEVVRDJNQ1JYTHdKYVFjaE05Rm9nOWlDeFpm?=
 =?utf-8?B?SENXTWZyQ0todkJvb20yRG44c2JiK0dQODMvelY5SzZwQlFlcVhzOFBKQ3l3?=
 =?utf-8?B?TDNWZ1dlVWdpMTl3MExTZUVncitxdEtGSFIxMkgxSlRMczdwOEJSZ01kYkxT?=
 =?utf-8?B?NFF1d21tM1dXZDdCM1VyQTAxbDc5Z2tsT0t1RUZGTytDZytQTllWS0hLYjlh?=
 =?utf-8?B?R0pIWmpCT3p4Tkc0WWpmekIwLzEvS2ZrT25qMS8zZjFrNHJ5T1JyVUVleC9T?=
 =?utf-8?B?eEQ4U2dZQjNjakVSZmcyWUYyUTh5TGhCUk5TV2NPckxYR0x5ZWlhWmxZd04x?=
 =?utf-8?Q?f9tWClzSMOgzos4u8gs6YFZEpsAMPoV0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkF2YUEwUEJJMS9OV05XYlZjMERSdU1SL3dXMXVqM3ZSOWVkUVMrTXpHWlpl?=
 =?utf-8?B?bnIzUk1FeXdTTnREY1ZCL2ovcGJ5bmFqSmRtWGdMWVRzWUtVekdHOGJ2UHRJ?=
 =?utf-8?B?clJ2akpmZWRIQ3hXSmRGVHNIejVsNkg2T1lPSzBMWVUvc1FNcHkyQ3ZCdmNw?=
 =?utf-8?B?dDNQY3Foc09pbHZnNlo1azJFSGs3eG9xaUN4eUtwNEJYWkEwT3lmdURsL240?=
 =?utf-8?B?VytuTlUvV3pya1lkendSYkp5eHdKMGo2Z3JnSGVpZEFlbjBJSDUvcEl4NG1V?=
 =?utf-8?B?Z04xdDFiVFRiVnoxSzIxVHRYN1lSamJvN0NzcFdCMC95c05OdGF3MXRtQUZj?=
 =?utf-8?B?eEpWMHNvS1JUZVVxeFVkT2hFdEhJQ0xrSytyT0duMGtqbURMSWlaOEJxbTlu?=
 =?utf-8?B?WTZ2cFZpait3aEVDVXd1WGhKTkVVQmNIZGVNTVdLcHNpZFdMMlRQdXovRk1R?=
 =?utf-8?B?WURlakt3QmdiRnVMcy81WnpZZnJRNEp4RTR3cWJ0NURpRlVzL0JYTWdmQzQr?=
 =?utf-8?B?SVBnZy90TEExbDFsMHd5Vkk5QnJSUjVXSk5aY2ZET1R3cm1VdEY3bEdwU29m?=
 =?utf-8?B?dTlNRXRIL3BiRUhwaENibEQ0OURyZS9TYWNIMThFVW9CbkoxQUFLSFdKZi9T?=
 =?utf-8?B?UTRBTTJ6OHovRFh1ZlRUckI4YVVOekNNZWlET3JCc3FDZWIzelFyazR5MVhK?=
 =?utf-8?B?d0ZQR1RtdmtOanJCS1FCbnBwM3B5dktpbFdzWjBQZkFsUjBwMzk3ZkI5YzA5?=
 =?utf-8?B?Q2VzVFhZRDRyQlJIMUREVkRYTnZHVWtlSjZnVkV5SWJDbHBLTk5WdVlTeFVm?=
 =?utf-8?B?cmZxbmRLRXVMUTNuUkMzSHhrekRQbVp6WTY3N1U3dUI0ODROQ3VydXdlTkZ6?=
 =?utf-8?B?N0J2VHN1NFdack5wZWYrVTFxYzgyWEhPaHJydS9FVitlUndMVFBZbnZpNnVS?=
 =?utf-8?B?L2NQQk52Qmd1S3FOYTZnTDFNdVdYWVJwOGNTc2laU0xNL2xOQjVyM2FqdFV5?=
 =?utf-8?B?cHJxMnAwQ3hXY2RkOGIrT1FVd3JaZkswSGdqWHZoSGdtTWNDZjdLRkZkWVpD?=
 =?utf-8?B?Ry9lM1NjdVVlRnI4ay9EQ3YvZE02RUIvNXV2emdaUXdQbFZNdjhxS3hOaHli?=
 =?utf-8?B?R1N2aXZxSTVkMzZ2SXRYR2RPcXlQT0s3aFBOYzZOckxpVmFYUGpHSm9WdmRh?=
 =?utf-8?B?Mmd6ck5PNlkwOGN0b3grRzE0aVpEWWJTK2ZFRURBUThYYi81NUlJNVBDb1di?=
 =?utf-8?B?aTJnbVBvUnJzS3NyNll0MTZTdk02SGUwZXhGaFF0aWFCbjhPZVh4QVhmN2dO?=
 =?utf-8?B?U282b0xoN1JTYnJuZkJFcVBWQ3VFUzVDODBDN2FJZURDWDNDODVlR2YrTVdz?=
 =?utf-8?B?c2R3UUErRTBrVHU3L09IVkwzaVprdGRIdXJSSmw3TUhjRjN1eG0zT0xwdXF4?=
 =?utf-8?B?MGF6RGVJdmpyRVkyT2Nmcnp6aFNSRGxoVGZMRWsxcEtUamFkWkt3MnlBcEhZ?=
 =?utf-8?B?NHpPNWt2ZkJYTzJQNGxSaUoxUGJ1TUJQblBQbWdzSHQrL1Z0Qm05cWVPSE9i?=
 =?utf-8?B?K3prTC9YclRwcjRrb0Zpc21wTUxRM2k2N29XWFVkaGVwanJ6ME1vSkNPc1FY?=
 =?utf-8?B?c2xoSExoZEJhQTVrajBRV0RqcXlzMVZHNTlMVFN4Q2VqUHpjOGQya2VHVEQ5?=
 =?utf-8?B?SnB0ZlU5S2hML3g5TnBScFIxencxU2g5WlRmQ0crVnB2dVRxZjNjNDIrTm5M?=
 =?utf-8?B?S1BEUUxKVEU1SGhBaFRwR0NiZWFyZlRCM2YrWEUwN2tiOFV5TS84enBFaTgz?=
 =?utf-8?B?SW4xbUEydWNuUjZvaXZic21Wc05Fd2NaRlRIQmdMekZPclVHNEp1WXgycXlZ?=
 =?utf-8?B?dzR6ZUtLVHRzSmZ2R1hQYmNOZjhMOFlwUkRnOVNER05yZUFZUEdZU3RBeVo0?=
 =?utf-8?B?dDZ4Q3J5Q0tNVWRZRFJRMlYwWDRRM1hpR3lJKytmdVY4ZWM2YldsUU93T3hj?=
 =?utf-8?B?ZTBaYlhpS0hKSDJOZ0xUK2JIaktrM2RnNXZlVm5mc0c3YnFHa1MwL2w4S0R5?=
 =?utf-8?B?ck53ZXh2bm1jc2JtdUVCbzhIRVF0aGxCRFJtcjYvalNIbUYzc0RRa2k0ajdF?=
 =?utf-8?B?SU0xVENscG5sOTNXeG5rQXFXeURVR2tKcEZJVWtMSlgzMGVjY1hvdHZ1YzRR?=
 =?utf-8?Q?wNHuQBjioAQZZyznE1IGNc4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3df1ac5-fde2-4ac3-1fa3-08de3680f81b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:41:08.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9ac4SRZkGrTIBLrNHb9nZBzPHJe7WF9kcbiq3RZQ0bq2DB+CLca66sn+GWZdRNzWelyGW2Nwviem+GVkYttQEIdgZJZ66JhhLierKLoI9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9491
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



On 12/7/2025 1:57 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:03 AM, Daniele Ceraolo Spurio wrote:
>> Scheduler groups are enabled by sending a specific policy configuration
>> KLV to the GuC. We don't allow changing this policy if there are VF
>> active, since the expectation is that the VF will only check if the
>> feature is enabled during driver initialization.
>>
>> The functions added by this patch will be used by sysfs/debugfs, coming
>> in follow up patches.
>>
>> v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
>>      XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 136 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   3 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   4 +
>>   drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
>>   6 files changed, 164 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 265a135e7061..45733a87183a 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -200,6 +200,20 @@ enum  {
>>    *      :0: adverse events are not counted (default)
>>    *      :n: sample period in milliseconds
>>    *
>> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
>> + *      This config allows the PF to split the engines across scheduling groups.
>> + *      Each group is independently timesliced across VFs, allowing different
>> + *      VFs to be active on the HW at the same time. When enabling this feature,
>> + *      all engines must be assigned to a group (and only one group), or they
>> + *      will be excluded from scheduling after this KLV is sent. To enable
>> + *      the groups, the driver must provide a masks array with
>> + *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
>> + *      which logical instances of that class belong to the group. Therefore,
>> + *      the length of this KLV when enabling groups is
>> + *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
>> + *      must send the KLV without any payload (i.e. len = 0). The maximum
>> + *      number of groups is 8.
>> + *
>>    * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>>    *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>>    *      up Stale HW register left behind by previous VF)
>> @@ -214,6 +228,9 @@ enum  {
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>>   
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8u
>> +
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 158d68aff4b7..1109fec99fc3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>>   	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>>   }
>>   
>> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
>> +{
>> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
>> +	u32 *klv;
>> +
>> +	if (!xe_guc_buf_is_valid(buf))
>> +		return -ENOBUFS;
>> +
>> +	klv = xe_guc_buf_cpu_ptr(buf);
>> +
>> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
>> +	if (num_dwords)
>> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
>> +
>> +	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);
>> +}
>> +
>>   static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>>   {
>>   	int err;
>> @@ -476,16 +493,134 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>>   
>>   		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>>   
> please keep asserts together

ok

>
>> +		xe_gt_assert(gt, num_masks / GUC_MAX_ENGINE_CLASSES < GUC_MAX_SCHED_GROUPS);
>> +
>> +		if (num_masks)
>> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>> +
>>   		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>>   		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>>   	}
>>   }
>>   
>> +/**
>> + * xe_sriov_gt_pf_policy_has_multi_group_modes() - check whether the GT supports
>> + * any scheduler modes that have multiple groups
>> + * @gt: the &xe_gt to check
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if the GT supports modes with multiple groups, false otherwise.
>> + */
>> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt)
>> +{
>> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes;
>> +}
>> +
>> +/**
>> + * xe_sriov_gt_pf_policy_has_sched_group_mode() - check whether the GT supports
>> + * a specific scheduler group mode
>> + * @gt: the &xe_gt to check
>> + * @mode: the mode to check
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if the GT supports the specified mode, false otherwise.
>> + */
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
>> +{
>> +	if (mode == XE_SRIOV_SCHED_GROUPS_NONE)
>> +		return true;
>> +
>> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
>> +}
>> +
>> +static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	u32 *masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].masks;
>> +	u32 num_masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_masks;
>> +
>> +	xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>> +
>> +	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
>> +				      masks, num_masks);
>> +}
>> +
>> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>> +		return -EINVAL;
>> +
>> +	/* already in the desired mode */
>> +	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
>> +		return 0;
>> +
>> +	/*
>> +	 * We don't allow changing this with VFs active since it is hard for
>> +	 * VFs to check.
>> +	 */
>> +	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>> +		return -EBUSY;
>> +
>> +	err = __pf_provision_sched_groups(gt, mode);
>> +	if (err)
>> +		return err;
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
>> +
>> +	return 0;
>> +}
>> +
>> +static int pf_reprovision_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	/* We only have something to provision if we have possible groups */
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return 0;
>> +
>> +	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
>> +}
>> +
>> +static void pf_sanitize_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_NONE;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control the 'sched_groups' policy.
>> + * @gt: the &xe_gt where to apply the policy
>> + * @value: the sched_group mode to be activated
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
>> +						enum xe_sriov_sched_group_modes value)
>> +{
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return -ENODEV;
>> +
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +	return pf_provision_sched_groups(gt, value);
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>>   	pf_sanitize_reset_engine(gt);
>>   	pf_sanitize_sample_period(gt);
>> +	pf_sanitize_sched_groups(gt);
>>   }
>>   
>>   /**
>> @@ -524,6 +659,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	err |= pf_reprovision_sched_if_idle(gt);
>>   	err |= pf_reprovision_reset_engine(gt);
>>   	err |= pf_reprovision_sample_period(gt);
>> +	err |= pf_reprovision_sched_groups(gt);
>>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>>   
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 52312d24d527..6b3e294bc934 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -17,6 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>   
>>   void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index 1d4cdc87e069..d9928c200d72 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -23,12 +23,16 @@ enum xe_sriov_sched_group_modes {
>>   /**
>>    * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
>>    * @max_num_of_groups: number of groups supported by the GuC for the platform
>> + * @supported_modes: mask of supported modes
>> + * @current_mode: active scheduler groups mode
>>    * @modes: array of masks and their number for each mode
>>    * @modes.masks: array of masks for a given mode
>>    * @modes.num_masks: number of masks in the array
>>    */
>>   struct xe_gt_sriov_scheduler_groups {
>>   	u8 max_num_of_groups;
>> +	u32 supported_modes;
>> +	enum xe_sriov_sched_group_modes current_mode;
>>   	struct {
>>   		u32 *masks;
>>   		u32 num_masks;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 7d93c2749485..c2e0a2dae586 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -46,6 +46,8 @@
>>   #define GUC_MAX_ENGINE_CLASSES		16
>>   #define GUC_MAX_INSTANCES_PER_CLASS	32
>>   
>> +#define GUC_MAX_SCHED_GROUPS GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT
> actually my idea was to have here:
>
> 	#define GUC_MAX_SCHED_GROUPS	8
>
> and then in the klv abi header:
>
> 	#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT GUC_MAX_SCHED_GROUPS
>
> as IMO the KLV definition follows FW capability, not the other way around

That would require a rework of the header hierarchy, because guc_fwif.h 
includes guc_klvs_abi.h, not the other way around. IMO that does not 
belong in this series. I can just define it as 8 in both places for now 
if you think that's better, and later on if we rework the include 
hierarchy we can have the KLV define based on the one in fwif.h

Daniele

>
>> +
>>   #define GUC_CONTEXT_NORMAL			0
>>   #define GUC_CONTEXT_COMPRESSION_SAVE		1
>>   #define GUC_CONTEXT_COMPRESSION_RESTORE	2
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index 146a6eda9e06..1b08b443606e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -26,6 +26,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>   		return "sched_if_idle";
>>   	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>>   		return "sample_period";
>> +	case GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY:
>> +		return "engine_group_config";
>>   	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>>   		return "reset_engine";
>>   	/* VF CFG keys */

