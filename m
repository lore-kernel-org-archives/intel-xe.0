Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13157606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQEe6QKV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A790C10EE18;
	Tue, 10 Nov 2026 06:20:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00FE10EE18
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 06:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794291596; x=1825827596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=SmUBaWZPDTIPpBc5Qpy9cTFpFWuEDeUXWEnWuRh9r7s=;
 b=KQEe6QKVbmhQMvwZ/m4s/b3X6V4JSlOxKoqwlA2jBM2LG8+00NniiV9O
 zzlYF2qd5DHEiDqVY43w9ZLXeVrCiGfkIjyjzbLK3tslLxjUk7nkJwpjC
 NaQ/63ypy/FXei2Op/LXpzJ7ZG3gBSum31W+keEJ0uTQbR+zcjsXvPjAj
 xAMNj/Ge+ypoz3lBg0SlkMiZkDsnpkVNkQ8wy+voiiC8Qw0v3mmUERKkV
 YOwlyXn23Ia5EYY/4F14HcT077iylPSbk5BlTV2zafjhdOamyc5K/wbwE
 6YxUguQzSSfBCmEeemK3I7IPb3rhR7US77ayYKwpzX/9qQg8t70cnqPV+ Q==;
X-CSE-ConnectionGUID: 8Sqa76xBQvGgDLRKe2/43w==
X-CSE-MsgGUID: QrdT6TGaR6GJSjIvtO4X0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2931448"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="2931448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:19:55 -0800
X-CSE-ConnectionGUID: P/iJDw0aS1SA7v9GTfpUfA==
X-CSE-MsgGUID: woaWfT4RQRSBHjmkIMAh3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="8046739"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:19:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:19:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 22:19:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:19:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f75oSRSZvjEtjG5YWiMrAg7sVkp/iq31R7a7Yq+oRopGydFvGD1lz/g/tF3dpdIYay0qcMqXfUvWTgd/GatkeVnYHGBd5KcmH7H0qvgFNpSx5Ac0yZjzFqfkYEChi0olQrvIc37gdmsTHyfA4C3ljUpfA5o5fzHpJv620nvQbjQRGm2SqUsrjnq8+b5QVlisqhnSzP5+9pSvczvk2rzpIw3X6RbBHwhV6s/xXXirmpNq48P4wIhlwZ8q5Oe6nG9W4Zbxc//OK25O/RjW5mJVfkZiXxfkoyglFMZF98vS3R8uhTj/Q5ehQtK50b5O5s/2lXxNMVYo/A10fa3J5jd4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um+Hg1nw9KOuuqfMKNTeUosw5hVLvJd4wo2US7GRcwA=;
 b=pgwE2nIMvAWn9Itb0Sz8Y4/6PA1lBPWanU8KBXAvCfH+QIyCUEHgMzPoseuX5KfGUSWqmhELNW4u5LmhawUhUmekFTdw4X692r5vs9+EM3+tp6JbHcoGAvCY+uHvOXapZQlVR7y9uKRyzUGY1GegcMIZdUOr840QV8CGfCgnQLzjToqW9RD5Xc1ZSTYQxY1A9zr72nRv+f0sgScFkXePtWmrYonocpV2hJ+CIXhQLxYsey1vrd74i/mqlKcQSvbm3HHA8SSMUe7i5IC6VFQmkfvakaQZ4pkRF89n2hWvQGc7mtt874LE32WXouat2zgmjulBDd6KetdgZYPfVr/1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:19:50 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 06:19:50 +0000
Content-Type: multipart/alternative;
 boundary="------------VoXw0sEtOifOzgskaTsk5cu4"
Message-ID: <12ac1ff6-6169-437d-9fb1-01a41b6e1ef2@intel.com>
Date: Tue, 10 Nov 2026 11:49:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261106071944.2693854-13-riana.tauro@intel.com>
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: bf352403-0d78-41dc-ffc4-08df3ef2a029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: O4WZqHxXg1iqAgN9oTKhM3LU8LztRUpB3ej35/J/zoV71mgy2EHhUEzDu0zp4OpmHuBX2WW/zKx385f9Un2PTJNUTEQAtoaEnFDx+FQ0UU1ER6x8g0uhJF0IBQmknCldPa1/1QxorQMvcP8xBW1Lw4QAXVJk7Qu8epyQv82cMRBLCEFEfGyil2ReSq1PyM7/egFTDmDp9pPbDkE5mHUA8NsQPC4KzBWQIRqWBLPXR1+GYs7c6b6OnhdJ4yXcr+hMXrg7nYjLM9GGqZ2VLKx1eBrf6u4hhoNMTH5GXge1UhSB9xq6LFXaLLXPh7vHDQ3hzgDKMXb/4cuG8XfvQXSccbH7IfxkMxrbIAyFlFGIQrS9Qb3Zk2qKRPWugdP/2HRd/hO4d5heuIt05C4QuBESzCz5L7crxYQJTwJ9AE2PSGfZ/3CbCYzFCH6yrMtpw/6Z4DPuYUHVVncuczeZ4o8ss59EtKWOtzBPZ31BwNPyBGKk4qIyTgYrd4R+bw4/NSRwB+BBIbTgftQV/x3UCFwPEUbanAlknUn3qChtsZm9YIMgHW8KxRaXjmaf3sHIX8t2F7XGYPhVlmNFHj0SZXaYchVKnnqT9P3t5FEN2Oorva18XK/MKibFxu00PfarAgp2QnAYwjc48FmHZXSkM7R3cvMBu3U0XO5KY4wppEiVvlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmxObC9GcjJoeHQvaEdWNExWVm13VUZuWkh6NjNKdk1PYWZhNXR6VkZIUFlq?=
 =?utf-8?B?UUl5dnlxN3FTWjE2RVJZUVpQdUc1UWpWQ1BST0ZkZXZ1eU9peFc4Ly9Qd0pi?=
 =?utf-8?B?eDVGR29FU0pnbUdGYnlWY1lkMDQ2WjVPUE81VW5INWVKbGdDTUNVNEhIeXJx?=
 =?utf-8?B?dkZsVmZGcVcxbXhEdEV4UVlTM0FPcDBYUjZWNzF0aFJteENxZlVtWXVudjM3?=
 =?utf-8?B?c0VWSEN0c1dRWkxXZGQza29VZk1kdVYxZnlKNG5xVWVYenhYTjVQSzZXeWla?=
 =?utf-8?B?T09RZXFhd0kzVWlaOE5QQm1GV1F6bFBYbzZKN0h5dS9qWVhkZzZLTzgxYlJ2?=
 =?utf-8?B?R1ZMRVl0NnNjQkpYaWRxaXJ0c2NKQ3pldEQzS3dHV0FUWG1ZTzNteTFIbzRL?=
 =?utf-8?B?MlpoOS9NSWZrMnk5ZWRiUlRWVjA1TnY0MFI2c3V1NG1oRzdvM2ZlOVlZcFFU?=
 =?utf-8?B?SWFrNHhyNEdhcm5NOXZ3RHRBTXI3dWJncUludVppVFB5N2x1bFF2U0tma05t?=
 =?utf-8?B?MTNYTXkwaGl3N21PaUs4VDFZcDV4Um5SU1FFOFNleEkwajdtYVM2d3hHRDZj?=
 =?utf-8?B?SURzblcxbVpZT3FjS0J4eHhoQzdxQlJVbmNTaTFzZUc4cjhsSzRWWWU2djFW?=
 =?utf-8?B?aFhTK0ZlVFpwejlObnZ3emx5VFNTb0FodW5rMTI2SCttZkJpekkwL2FqcnZq?=
 =?utf-8?B?WU1BRmtuRktraDJqSGF4R2tYd0wyS0pTdnpsVzFRVStYRkF5SVEzOWlHbCsy?=
 =?utf-8?B?QTNVY1ZzMnAwbEtldDVZclY5MVdsUmFnYjdvN1JsdnpPYmZQT0V4dGNJYXVq?=
 =?utf-8?B?ZXJON0tvTGlvQjN3NS9iMW9aZTJHeXVGMXl0cDJLSDVIUXc1UVkvWnZBZWhP?=
 =?utf-8?B?SDA4ZmV0bXV6emNpRXArOVJFNzFNSnoyYU43VjZMQ3ZtNVd0YUN1ZzF6SEJv?=
 =?utf-8?B?WnNnSU1qaDVWRGFCRGg3U1FRTkluSGR4dWIwd2Nya3JUR3czY2MyRHBaOWVm?=
 =?utf-8?B?OUg0MERmMFZsOHE0Wkp1NWxxSkgxVHBuV2lqUHJoYzlqVG5TakpEVm14OHda?=
 =?utf-8?B?ZnRVS3NmNDFSaXExR211dkptY3JZMXovSUFHVVBrVm5MMGNrVEtXVElLL1M2?=
 =?utf-8?B?azB4cW1rYVRXeFBoTXVvNE5sWStwTzlTL1ZzVStIVTJVU3JzRkVPR0NaVHM1?=
 =?utf-8?B?eW1aT290OVRzUVAycXZWczN3WjZIU3hlWFgzTWNWQ3JMNTZNOUxXY2tQYW1m?=
 =?utf-8?B?Tm5UbnVlQlZtYzFTbXUvd2tDZmh6SU41TXN4Vmx1VTBDR1VJTjIycEczdVo1?=
 =?utf-8?B?dTllL3NHL1RuWTB3eTVtTjhSbCtmVmhxRkFGbDhFUnZRQUtOeHJuZmpOWkNY?=
 =?utf-8?B?YjI4WW85bWM3OTlzd1ZwYWRXRkFhWDlHVzZXTlBObUdhdE1RK0FpN0dnRXZF?=
 =?utf-8?B?Y3VQY1FTOEVjcGpBRTFKWWc3Q0VXTUd6SXZmaHVHUCtWMis3MzAyYUxhenl0?=
 =?utf-8?B?VzR2eWVMejczMG16YUxmaDZEVGpLZVcvVlMzRjB6MGJtbDE1TUtzYlF2U0hj?=
 =?utf-8?B?aTFZRkk1MEpJbDVaQVhrQ0UwNnNBQXZtOTd5QVBFWUFLYVJ3OEpZYW5SdlRJ?=
 =?utf-8?B?aDBOOUFNNXllOStmMElURUp5WjZlR1FydFZpNmlPaUV5dkFZRmJNdWRveEFj?=
 =?utf-8?B?K21xZUxxTldsZnNwTERScHR3NWx1djlVL3FLOHpaamMvcGtxK001UERxaDAv?=
 =?utf-8?B?aUpFQThNUjlhZEIxQVlRYzV6aXNyM2VORVdqU2VkR0VINUMyckdNZWdvd3Zn?=
 =?utf-8?B?WjhiNkdaYnRwUG1SUS9KME8yWTl1blQzSXMzdFEyVldLMDFyZ1Z5WTZqY3VY?=
 =?utf-8?B?eFduU3BKdmVLSElYSU5LdHZnTC8yMm11bHJGdlh3S3JBWFdsZXRValRaNkow?=
 =?utf-8?B?U0tlM2xxdHowYXR3Qm01NlZSeGVEcUtsRnhWeGxpVWMwc25kVXZIa1RqRlM1?=
 =?utf-8?B?QjJMNEprWVViUGVPbFlpcFVodlBWa3gzdEhDQUNRbkpUaHQ0NUpPUEltWURl?=
 =?utf-8?B?bzl4ZlFDS1U4Z1ZPaVJjRmFyNWk0Y3FwZzF0K3NaNWlEVzJtZHlhQktEajdH?=
 =?utf-8?B?ZDJ0NldvTlZOQmw3Qy9NMWR5TDNzSS9oV2M0MlBqVXNnSi9YKzhYSWxDck5r?=
 =?utf-8?B?aXF3VVI0UERDTkwwbnNUMlRFTXlDUThiQVh5MkV5UWZlbWpOUkQ5aVZ2VC9L?=
 =?utf-8?B?b21Nejc4NVRMNjdhb2h1YThDVzFvQS84YjZqcmpjUkMvcGQ1aXJFdEFQaXNk?=
 =?utf-8?B?OEE1UlJ0eUZ1MW9naFpFendTbHNSUm1lTVJCRTgrdDBhNjVDUGpyRHMzOXRp?=
 =?utf-8?Q?7bVONC5RmbGpco5U=3D?=
X-Exchange-RoutingPolicyChecked: AlPt+JqzrENbd3BETSKT08+zwMCMiT2ZrkyK5IeNmK+RFfZq0zPOPG6u+63KV09LDWsPe1h4OH8tLRD8iLDThKhm1uf+B9WPV0W4BFVkgrtB5N+PErFmhvjaCETNozj4nlN+1pGzuw7UyoY+Fvosutuy9byAzIRkUrvDwi4P38tgwcBqH084f3ymPyc0LT/anuuG/eJlaB0q511qtkJJfhsiUTrPBPskEZwwJSYYdixfyyx0veyNo4NQYDMzYL9d4GoqvWgtm//F+5ewuhWetbPZkXWJVwDF9pRlH7RSxtt1/uQUVXNvuG0L5krzByPbAz4kGlt1dsZuPp271UrOiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf352403-0d78-41dc-ffc4-08df3ef2a029
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:19:50.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8mrnTL7TcBj77KYWz0pJ65u8A4GastfUdQIwF9oXtg0ZPhZkIWriDnOW27BA+c2kraEGBEfwd7GRjSPxoG7dzrEnIjAa02NDNRBr9OK6vM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------VoXw0sEtOifOzgskaTsk5cu4
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06-11-2026 12:49 pm, Riana Tauro wrote:
> Runtime surivability mode creates sysfs and declares the device as
nit: Fix typo (survivability).
> wedged in a worker thread. This can race with unbind.
>
> During unbind, devres actions such as disabling the worker run as part of
> teardown. A runtime survivability enable that is still in flight or gets
> scheduled in that window can create the survivability sysfs entries while
> the device is being removed. This is incorrect, as runtime survivability mode
> must not be entered once during devres teardown.
>
> Use the DRM device enter/exit protection so that the enable path
> synchronizes with device unplug and returns early if the device is
> already being unbound.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index d73cdad0b3a9..e8d618b47322 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -10,6 +10,8 @@
>   #include <linux/pci.h>
>   #include <linux/sysfs.h>
>   
> +#include <drm/drm_drv.h>
> +
>   #include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_heci_gsc.h"
> @@ -435,12 +437,18 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int idx;
> +
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>   		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>   		return;
>   	}
>   
> +	/* Synchronize with unbind, do not enter runtime survivability mode during unbind */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return;
> +
>   	populate_survivability_info(xe);
>   	create_survivability_sysfs(pdev);
>   
> @@ -452,6 +460,8 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
>   	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>   		xe->info.platform_name);
> +
> +	drm_dev_exit(idx);
>   }
>   
>   /**
--------------VoXw0sEtOifOzgskaTsk5cu4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06-11-2026 12:49 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261106071944.2693854-13-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Runtime surivability mode creates sysfs and declares the device as</pre>
    </blockquote>
    nit: Fix typo (<span style="white-space: pre-wrap">survivability</span>).
    <blockquote type="cite" cite="mid:20261106071944.2693854-13-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
wedged in a worker thread. This can race with unbind.

During unbind, devres actions such as disabling the worker run as part of
teardown. A runtime survivability enable that is still in flight or gets
scheduled in that window can create the survivability sysfs entries while
the device is being removed. This is incorrect, as runtime survivability mode 
must not be entered once during devres teardown.

Use the DRM device enter/exit protection so that the enable path
synchronizes with device unplug and returns early if the device is
already being unbound.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a></pre>
    </blockquote>
    LGTM,<br>
    Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
    <blockquote type="cite" cite="mid:20261106071944.2693854-13-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index d73cdad0b3a9..e8d618b47322 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -10,6 +10,8 @@
 #include &lt;linux/pci.h&gt;
 #include &lt;linux/sysfs.h&gt;
 
+#include &lt;drm/drm_drv.h&gt;
+
 #include &quot;xe_configfs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_heci_gsc.h&quot;
@@ -435,12 +437,18 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int idx;
+
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe-&gt;info.platform &lt; XE_BATTLEMAGE) {
 		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, &quot;Runtime Mode not supported!\n&quot;);
 		return;
 	}
 
+	/* Synchronize with unbind, do not enter runtime survivability mode during unbind */
+	if (!drm_dev_enter(&amp;xe-&gt;drm, &amp;idx))
+		return;
+
 	populate_survivability_info(xe);
 	create_survivability_sysfs(pdev);
 
@@ -452,6 +460,8 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	xe_log_err(xe, SURVIVABILITY, 0, &quot;Firmware flash required!\n&quot;);
 	xe_info(xe, &quot;Please refer to the userspace documentation for more details how to flash the firmware on %s!\n&quot;,
 		xe-&gt;info.platform_name);
+
+	drm_dev_exit(idx);
 }
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------VoXw0sEtOifOzgskaTsk5cu4--
