Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180A606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 05:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZjaqBiFN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7110E1E7;
	Thu, 29 Oct 2026 05:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851F10E1E7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 05:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793251687; x=1824787687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gLa6Y+gJHTt8/jqBjREDOnnuNIWoFRfu9c6Gw0ngcbU=;
 b=ZjaqBiFNkChab5v5hiqcQlv9apUKt1Q8ywaBKLsV7amqcgkeTuxeFpmH
 Oa3WnuC++fDkLTkKKYyX/JAEfXs8wMet1k+K0/akkeGoSReULZJJbyDTJ
 p4fGc+9lP77PxeVv6B/UrQiI8yEumDMLR6gdohD7qO1e6MJSUh0kqWLxr
 XmlT/KMmOIUzh/ALSUNoaSwNqaHmaqZO1oGXI9rMgEFdpp/C2tUt8DXCO
 Z9BZJhSFDM4sZE0fOCJikiBpHPUSG2Hswbl9xCR/WnH9dsEsMPww6+izk
 3FqZfIYzacDd1oKrM2vfQMLrUiIj9Dp5V5XdffDOJBZZjXHBpnj8pt4UB w==;
X-CSE-ConnectionGUID: YEuNjr07Ql6NvGUcwL0HaQ==
X-CSE-MsgGUID: fZbFExEeTqmfcPqSb2FJNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2018637"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2018637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:25:31 -0700
X-CSE-ConnectionGUID: AjbrLTzIS1K9KpN3tRLDCQ==
X-CSE-MsgGUID: M2EWKJXXSpGskiw4pK/5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5375152"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:25:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:25:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:25:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 22:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNFFw9gaeV7O8w6LCWL7LiLJIMUImpUv0CBv99cGSSOikN8rRrkWdbWQ1Xty3prIvfTLglc3aBy3AKVS66ZoeIQ5tzsVdzJixZRSk4MEyH12iJrHKCuSXly5+3VtJIG1hSJu43ee6wqcn9ABnvgIKcQAP5rKA5sHktuMu0IvgOfWB+OVeho8ER9C/1Oo2UA1iGevXGSBCw1dj38gvNnM3FnX9I3/67U/bvhYxnaAm9ADNylyCls9ABuKQ8fH93fnjE/c41bZnQLfGHO4sQWI/jgsXnd3bBo1yxGT8lsDZSFtgs8uAD5XYZv6OY3jX+IM84/H/7SUWQuJ/f7mFP/3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG5r9wzzjRB7d69f95h9CpCJ9u7kip8DCxf7l7rqJsA=;
 b=CvFQGAWcZBOoU9BHSMUoA4J4I4QM1bK0V72v9GNzqSVxyDFR9sIEkrQz8NNYJSPflpCcEgUUdJoJvFsVEQllZzfVqytihe7Vu1ojhsLR8GmrcQussnh9X5p7460IsatMzQsYgy1Dztg89AcKRuGha5nzU20uXJ+kIQp/hYLyhcHst+sqXuojbtheQPbny7tVy0MihoOL/pTsoeXGgFR85cJJnD4aMe/7zNAwdPUttNRgQJJXEbcn2yeCko1983LnruJ+r3ySfpoI/2I+JSYuhivkEsVlmGfBx6cEAucAIIg1h+ITSGOmXf3ETh8vLBZCaGOW3xiwUnewl9CBSCXwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by IA4PR11MB9443.namprd11.prod.outlook.com (2603:10b6:208:55e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 05:25:15 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 05:25:15 +0000
Message-ID: <279ed858-6757-4a4a-8b6e-829d2e73bb76@intel.com>
Date: Thu, 29 Oct 2026 10:55:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/xe/ras: Skip double-bit ECC page offlining on
 AER path
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-20-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-20-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0335.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::10) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|IA4PR11MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfd3c84-8631-4c1f-a6dd-08df357d02ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261009223027099003|261021121427099003|261022105027099003|10067099003|56012099006|261021123027099003|6133799003|261026140227099003|261028144727099003|22082099003|18002099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: TDC5iU2ffzb5Dg+b3kzzpG9GYS1IfrKv0xx03j1fRh8Stc4QNeJwosb1OsNeDHZ0LwGEm8Gq9s/0QzitWfdkAUxsCD14fKNP26QSxSXUI/skzrV1Tbq0Wz5HpDKAEKSwT8LBOH3uJ21YQm06BeGt+KZ2fwdVuQPZHIWvK48hy/OOO/dlBsdaUYbQgzFepoKb0GBD9aJTKdNErgyJf2BcmuZkeo1VjdfmAcEoCoDM8/wmFoRGpSr20etA3A3iGi+M04JaTpFvTTqGDv7L3XI0dO1Ukq4iq+3MdJ/mTdcxxWvDz5gwmZb4xAKqcAUOOi/9h5QufR7iGN8OwEU3+7o47pRN6Yw39r5TLprjzSmi6drdcB/S9oF27fKkDH/BTGwm0F8z807dUBy7g2WSLx/0XhhosLN10iL0iQwJhPgQp42+3IPTO8AIOga6/y2gij1ipIr/lqPdDLeYMRulk0F+VyGi6Sdk/5pnFwHg0kaQI7OvpcKCLFuYPpYTUYmI0dlhEgFVWVoD16hr97sWm2wStxklRU3JNTIKzv0OOi/b+H6CeB7dlHb8/f7yh6109Xj3y0iTpFT23aGAdK8aHKONlTPh42ch7Gtd1ytmgAaj+haZ37cBdOzEqBpc5oguT6SRfoSD7k3fsQA2XJylzWjrcGpfttdW9PbHVPuOOy9ya34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003)(56012099006)(261021123027099003)(6133799003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHR6bTJ6NEhXdDdHRmkzUzM5WDZZYlRHakdTMEFJdTNJeEh5TUp4aG0rY1NO?=
 =?utf-8?B?ZVB1ampuNkM1d1h4YmwvSFI0cGN5ck9jTGV3Yllub2VnaS9TelpEdENpckRB?=
 =?utf-8?B?V1ZVRG5ZMUNsM3lvY0loR0pJOWJiVFNkZ0hlMFdJM3VhdmJXOGFNMGszWmUz?=
 =?utf-8?B?SDRlSm9OWlRlZlJMZWVpV1Z3WXBDb3lmL3lTN2NtNkRQdW9KUThEUmFQRmRG?=
 =?utf-8?B?T2hZL2dTdXh5R1FDc0tLak9aTmNkeXB4Qlk3ZjdyWXZERlppZzZhWEFHWGtU?=
 =?utf-8?B?RFpuR0xMUkE0dzJVOGlBY0JJTE5IYW50NmFRMTA2a1JRK1ZJdkJSakVBa1lG?=
 =?utf-8?B?QThaWE1qSHFpaktHMk45WlpTRDhhc2NWNGFjTTFNY2hIaFhOVTl2dUxtcTRj?=
 =?utf-8?B?L29ac2UvWEtzVFJvcERXSlpUaitjUzFrb0FDMlQyUmQ0YkljK0JaWlJHbnVq?=
 =?utf-8?B?T0FqMjNzOVNMNmRKeEMrRU9NM3JZc2NqUUQ5SThsSWVpdEgwTEo2SDJUSG5N?=
 =?utf-8?B?ejNGenhsZWNMUHpyQ0xuVWdrd0xNc3g0NnpRTDl2ZXNyeUR6UEpFY09CQTlH?=
 =?utf-8?B?VnJab2dJL3FJdDRpVVNTU0pHL0JoSk9HN2hGQTBLejJhVFBReHhHUFY2Q0ZE?=
 =?utf-8?B?cDdvM1FENEMxRGZXZzZ0TzRrQ2dMUXo5d2hJSXZ3UGx3dEUxc0tnRkRjTzF5?=
 =?utf-8?B?L0ZsMmkzaWhGRkRRaHZzZWV2ck1YQlFiRGNsRGJETHIrbElvdi9WTHd5U21W?=
 =?utf-8?B?OXM1SUtzTW9leHU2ZUxkRnlVbWxlQldYR1dzVnJxcGZ3aUlaZVBlLzJzMFUw?=
 =?utf-8?B?MG1MRzc1VENoMFhiZHFqRTZGY0lES0M1MTBhdlhCZkx5bENicnVvaUxvR1Qz?=
 =?utf-8?B?NjNWL2pURGJTWHhtR1hWYXo5bm1DZjB4SFgwQTdOOUpQTDFuc2hLK0VWdHhV?=
 =?utf-8?B?TjFYcm9mcFgzcndDVElzT2tvWEQ0cWowYVF6eDByZElYUmhhZXNXN3VsQUJh?=
 =?utf-8?B?YXZPS3V2THhqU2tFbG1tQlJXSlc4akhTUkJoY0d1cmV2OHp3RzV2UXdOK05t?=
 =?utf-8?B?eTd5U25IRFdaTE9YSVpXKzdrRGw4aGNZZjlaN0ZWL3pwV1pVcEt4QTV0VHRr?=
 =?utf-8?B?eDB5bFpaTXlwZnc1b2JkR0szVlpCd2h5eUdxTG5STFhJQkppRWNEYVBhblJq?=
 =?utf-8?B?cTlkc3FMcGRjQTdvVVo1ZnYyQmZTTFlFdFhKK2Vucm5aU1RRVWpSam5xL3Jj?=
 =?utf-8?B?cjRmTHVMd3lFRHhJS0VSOGZPeTM2Wmx6TFN3bDFHTTBSb28yb3FGT2dyZTB6?=
 =?utf-8?B?WWN0eXVwTGc4WVdTcG1mMDJZdjRmZ3FkdWxCeXJFeTE5bUhNT3ROWGNQV3d3?=
 =?utf-8?B?QmlpdzAyOGxacnNuemRaQnI2MFNjSWxPeW5OUHF5WVNRRzZMZWtNK1NrUjI3?=
 =?utf-8?B?UE1BUG0rUFZhOUNYUTJlOTliTFdqc0pHUGRCTnJlRFZnZ1VLVW85SkNaYm5P?=
 =?utf-8?B?SzRzRUtjTVVzdnFkNUJlMENobE9URGNHNng1bGVqVGlsRGlxQmg2Z001T2px?=
 =?utf-8?B?Zmt0MDBTblpnckJyZnJERmRCbi96Qmo2YzNRN3laVzYxV1I0c00yUmFDaE5H?=
 =?utf-8?B?S1YxZ0FzTUZOamt6by9JMnY1SHI2OE1mUG9WbjRRelJwQ0svSnlhbENYd1Q1?=
 =?utf-8?B?UzhidHNKQ3FBdSsvbVhwMENEU3cvejhqTzA4QXo1QlBkVGZLd01nTjEzNGhV?=
 =?utf-8?B?S3VqTnYwa2I3Uk1TTWtDRkM0ZHZud0s5R2tEbUJOL1ZYdGFzS2hOcGVCZitw?=
 =?utf-8?B?WFNXQzRXYjJKTUtWY0QyTGhjU3hjakxZYlpDMFMyYWN6R3p2ZzVldnNnWk5u?=
 =?utf-8?B?K1RQK09BZVowZkFHaU9UaFRDbHhFTCtiMU8wekN4VzVScmpMcHdnckYzTElQ?=
 =?utf-8?B?SzVZcFptSTVMVml6VzdaZWgrR1JZbGtiUTd4RXJCaHVZQkpOUVExZGlkVlVD?=
 =?utf-8?B?Rld2L2VSb05DZkd4YkQwVzdDUkE2Zjl0U05RZHB0Q1JOZnBhVHh1MmZLaHBq?=
 =?utf-8?B?aCt1dzJQT1N3bFlyRWFhb0d3V2lIY3FRMHA4eXMyZlZKNWJWeC94ZjlLMXBq?=
 =?utf-8?B?QnZvKzBTWi9tZzlVY3NaeGs5OFQ0dStNZjBVTEZKQi9Rd0tWTkVYeFdTQ0Fn?=
 =?utf-8?B?ZENIcVZlbDJMSThBVVFmd0RVbGk2WEk4K3VFMGMwcjNubDN2RUhQQ1prK3hn?=
 =?utf-8?B?TnpNd1l1dkNhNWtnMHluRU1mMEpMamQyMFJrTVNZZmtZQkFtMXpRYUFxVUdx?=
 =?utf-8?B?OU92K3JIb0N2T0M1ZTVPUUUxeWFmTlNzb1prT3VlRDdodlpXbzJ2cEhiR3N4?=
 =?utf-8?Q?n/Zlf1gi2jxF+5pM=3D?=
X-Exchange-RoutingPolicyChecked: JJt0ImBeV8hqnXeY2Tu66WiiP1i1ie4Aq4yBrsxYFvIchQwN4O+rREpSnUH48XW6NkFziNtx+9/TYiz76ZGBk1xf6nGUKR9M6bs97ll75gFT9NDdhatgQLBNw/QsHKDB2Ng0RJaYgym2t7gVKqkKzndfQH2T6was233L5ZReFDd1KZDYPXhSw/hIJDjBPci64T/VQ9iiFjmdg7e2o6L2COxNabOazb6w9+fS4s2yte/Swani2yeKoe8nP/zx62xbUKKUNljKBlc+jD885W6RIsFp7IlwZa+MCNCv9nivYW0JrekvBrCJfeXYd4J37bcMmQLwWWhR+Mp975Hpwp/idA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd3c84-8631-4c1f-a6dd-08df357d02ee
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:25:14.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGa+ZYqYlEpX1Kh1Lx4adP8DC08RVz7TYPU8EWGmFId5QbqwylONlbFP2XLvctkKMcSygOmnyxqB+F6Ifv334lCnySTU7INOQYKDCPLl8qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9443
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> Device fatal errors trigger AER, which can race with non-fatal
> double-bit ECC errors reported via IRQ. If the AER PCI error handler
> runs first, it receives all errors as a single response from the
> system controller firmware, which can include the double-bit ECC errors.
>
> Handling these on the AER path leads to unnecessary page offlining,
> since an SBR clears the offlined pages on reload and firmware drops them
> from its queue once read. Skip double-bit ECC handling when on the AER
> path to avoid this.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3b07b2fa8cd4..22ecca10b7a2 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -598,6 +598,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_memory_error *info = (void *)arr->details;
> +	struct xe_ras_state *ras = &xe->ras.state;
>   	int ret;
>   
>   	/*
> @@ -615,9 +616,25 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		ret = handle_page_offline(xe, info->sw_address, true);
>   		/*
>   		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * On a race between AER for device fatal errors and non-fatal double-bit ECC
> +		 * errors, if AER pci error handlers execute first it will get all errors as
> +		 * a single response from system controller, which can include the double-bit
> +		 * ECC errors. This leads to unnecessary offlining of pages, since an SBR clears
> +		 * them on reload and firmware drops them from its queue once read.
> +		 * Skip handling of double-bit ECC errors on the AER path to avoid this.
> +		 *
> +		 * TODO: Remove this check once AER handling is optimized to retain soft
> +		 * offlined pages.
> +		 */
> +		if (ras->aer_path) {
> +			xe_info(xe, "[RAS]: Skipping double-bit ECC error handling on AER path\n");
> +			break;
> +		}
> +
> +		ret = handle_page_offline(xe, info->sw_address, true);
> +		/*
>   		 * Wedge the device with a bus reset for errors that require SBR to recover.
>   		 * TODO: Trigger SBR using pci_reset_bus
>   		 */
