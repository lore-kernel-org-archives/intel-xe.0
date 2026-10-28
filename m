Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D0606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 22:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LrkF8kv/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E13010E2F8;
	Wed, 28 Oct 2026 22:59:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D40E10E2F8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793228337; x=1824764337;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ACTqBeTlvKODRwzh0xeW4l/LkLpHrnvBs0LnClznAXc=;
 b=LrkF8kv/DNNiBpGtkQIDXV0TGvEJzjbBwMZDdKNsCnwrG9aIxcZNuI+l
 3E7AZWbTt/DYLq2kh7KaCg1kbjKgQIATgL/oCvhV0mhu2kpnYRy+igYBx
 B1+tpjRYNekBgHWYQ76gkNcJoa4DzeEGNlfXnfei5A4CXbXmdWCF9hHD7
 9gK/pWbv3U+1Wb5kFto2VeNjskI2HqkPiEze5HPb/Q+6VqBh9heqgMPFB
 Ijf+OoE0XMh1accoeCQlTH49tZP9fEF9bsvbMdhFW9Ymgvy8GtdrmF93f
 N32UvHl0KZcQQMyBPRmam33N/YR7mVXz50azoCn7VKTjd1ePz68WkbJnm Q==;
X-CSE-ConnectionGUID: bnYRPzwwSSu7TLJluZlQyQ==
X-CSE-MsgGUID: HUERAW7sT7Svrq+os9pIJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1847624"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1847624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 15:58:56 -0700
X-CSE-ConnectionGUID: wV7roT0wQVWGLSOTTTXoyA==
X-CSE-MsgGUID: I3e4Y6cIT7mUnPWmhcLUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5079805"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 15:58:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 15:58:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 15:58:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 15:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOJ5aWRyf7SLrI9Wamthl4X8zacrC6mRjul4+7nchg8qyNU45m1wdHWEGhOC+nzWZPGoJYhgjoI4E8xolMItZe7WQe9kpfQQ/nawramkQ52fsDxIKXfX7O9J97fS6e/KgelpxLMgOgmaILgZ0nlnsCf3KLmRVa2MhZ70eYFQP9gB9peHpfqz36qsrxiMjgydwGCAC7T7Aao3P6/zzLpmU83v9oEqC2RlfNkhtpttdwDXiN+yw9uv8zKq5ojwPH0Jhe1OjmzlAcakMkL4JLE29GL0Y0vtb45bfqtnk60ZF3vQ/51+fP+/mAuH7aK/rrseM+lksOAXNbBTnKpO/fx54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBMexOMZEWQ3zFR7HwyEYI8UtEPDHTNtJgVXzU66hBo=;
 b=A8d+VMorV0oAumqWgJTDNRJYYo/sXuhdPjXe3O/DOVXtHGLWU5j98r/HAXPVXuaUo/opVLBsznY80jbL9f3PEzd5tDkj/eTtLrBEFKud6A8GlgQ7dVF+01ld5SPQDJRN2kvjkSJlJQfAqyrPTM7ZTS4tFZtqznTY9mlTXN3+Hon9X5Ib3VK6QKnvtXtpt+mBiT/h1GHQAdVW6WZRP3QCIYStIcUomlf3g3QMJe87KvZdmjylda4o/vyQxYOOyBiBLPVJ846WM/ZphLqnTp+eC/SId8Q6FPcSVtCkOIBvJklq4hmmlZcLR0KUeGUptNZpT04ShMZoXv0K1/yfDG6j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Wed, 28 Oct
 2026 22:58:52 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%4]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 22:58:51 +0000
Message-ID: <f6d32a54-ffbd-48f6-95fd-7fe0df299bbd@intel.com>
Date: Wed, 28 Oct 2026 15:58:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/xe/xe_late_bind_fw: Enable late binding
 support for CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-11-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261028181951.1093283-11-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb4ad59-b5d6-4837-9293-08df35470885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|261021121427099003|10067099003|261022113327099003|56012099006|261009223027099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wn09rO9Gt91JteQodu+Aw/b4VLoBo/Q4r5sHTrEAkJTPaKXwTEi9Tb7SYZPm18qCKf4MloC1bNZTqKhRXIjd39xxQP3OcRqxIingl2NMQF4S+vEjM4YCLrhwsMwGGb1B9PbAPSMvpq2o9gLQVjlgv9OsdiKRd4znkeXT/gg8ymW7HU/S/ILfIkcclJyhbS6DTbb+EYA2PxjbTRXIetG9p5I/Vzz0CngSIVEp+BBi+MkOc4xaVa4vLnnTq9LamXGv4gmh9G9FwugjebgTfZtCpPYBX29kK6w9QxLNUBIMNr9cMbFmnHjRppvt5YHPkS5TlQCrXBCuz8klviPy8skSKke+7JHvRH2zMO4ureXni9BsjYm+4Ly69IiU4nRskh5hDFPNPsbJNe3sN8+he/T46pJO8LpzOw9Mk/UocnFFo/urTLZtV0CJrpUvCKHiwS4X12+HKUqtceWeZxCltRLIKSCn4AY99hdKe6NDE4XU785YsyFI3b8MF8ykrnL8ljaO0SfWTmTzJ8pdme+bBu+1xYrCOXL5AbW6UOBaIgdkj36/ni5DcG2MbOuTjQkmwrGDZzJ7a8YjxieMaUarjAVrGIQ/RhWipVgHVVT9W3SVOESZUUywon195hBzOFbV+C4g1kxqJ3HppYbGlafA1CHvkD62z2cRxmJa5BgLswFN5bg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(261021121427099003)(10067099003)(261022113327099003)(56012099006)(261009223027099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnUzN0lNWjg5aTBqZk8vRkkrTjZ2cVZzbW43VTNVRy95RFZ6OUtvWTJTeFh2?=
 =?utf-8?B?ZVlMR0ZrdUlTSmRTYVM4VGdSWkJ5aklaWHRuRmdHYmJjQXFlaG9YRkE0UDA3?=
 =?utf-8?B?d0xUWXBDM2M3UmtYRFFrNG1wL3NrNEZFaFFqd0lpRVU4MEdJaFhVT09QT01U?=
 =?utf-8?B?OUh6WEtwQmJUK0tXWXhCZnd4YlR5TnUzbEdjajBFNFRxVDQxUkNMN05McFBR?=
 =?utf-8?B?dW56Uklpa2MrWU80dVoybGk0MXpYaDVMTEpZNXlwRXVvR09tRXhWREZoaURV?=
 =?utf-8?B?UzkwM0g2RU5wTGNsTHJiSEYzazhjMmJxRkl2NzRjanJ6eW53VGo2T01pSzZn?=
 =?utf-8?B?MDVLaW01c2ZPOERDRFRMNEpyaHJuZitWelBWSXFRNjZLVzV4N0FGdzlHdU90?=
 =?utf-8?B?OUlLVG1hY0E4M3RtdXVnRklGQ05GYmVJU0VCK0xKODhvaGhpOUJSV1FUS3NU?=
 =?utf-8?B?dU02VElFSVRJeTJRczlZZjhtblZhNVVPblZUSUx6ODVRdW9zOExWN05LMWhD?=
 =?utf-8?B?b21ta21TUUlpcThXWVdpV3VnQXY3a1p5dzdOT3NBSkxKVnY2VnA1aU4yVWxy?=
 =?utf-8?B?K0VYNFVvazdITXFqRDdCQXBjMFFtaWJEN1JzeDR0MWpRb0ZUWXU3REx2N0gv?=
 =?utf-8?B?YzRlZlFNVVcxRC9Tc0R6TWJyTEFRMEVMNStNTEE5dHNyaldSVlI4cjREM0RW?=
 =?utf-8?B?VWI0dFN2dmFzVldZOW9FNGZMbEZxeExlbmlKWHhJejNQbnIxdk11bVIvYVVC?=
 =?utf-8?B?eThBblBTZlhhRWNlY05oalJMREhtZkNJYkRDa3VVR2UzRWR6Y1M3aHNRenI1?=
 =?utf-8?B?ZFNOV1dTZWptSlh6VmFYRFpDckV1VTNTV1BFTVIycXpORjd4VXNseDNvSWxn?=
 =?utf-8?B?akxOL3diTWV2UGJuaWhTRk5jODdtSm10WDd0V1p1YjdUWUptNy81Y0tQMDlJ?=
 =?utf-8?B?Q3JMWXFubGJ0SkFaTkxXcS9JUm1xdzBJS1lQaC95NXFzQnN2aHJtMm1SRERj?=
 =?utf-8?B?M3p0cnN5Ty9mVEhKalAvWERJS1NKdWJWTUpFTlFmU1hEdHJqdkZUOFZjTDdY?=
 =?utf-8?B?SFNvRm5mMERXQ2RnTHNvdmJMdVN3SjdhMVV6OWJJZ1pqL3I2OXpLeGFjdFg5?=
 =?utf-8?B?UC9tNWRaRDFqTkIyTWRhK3NzeW13T3ExRWlydFlaaVNTZFAzenZ4SXMwekJ4?=
 =?utf-8?B?UlluYTdlcVRLRkpzYzZTZFlKeW0yZVNJdEI2bGJMWjlQY21FN29MTzFlQkph?=
 =?utf-8?B?VXJDc2hGT2F0K082VUxSVko5VHFMUHh5dldHdkZMTXdXYW5oOHdFeTBNVUJr?=
 =?utf-8?B?WlgvbUUxUTRSSDJEczJSUHlKaldrcWFSSE5sWnFYYWs5ak1kWFlhVXdNQnVp?=
 =?utf-8?B?N1Y1bDhHcnNpSGJLK3NPLzVONXdEc3E2T3RKNmxoUW8zQU9JQWQzM2RHTUxS?=
 =?utf-8?B?citqZU1TYWZLUm1uZm42amVzemJGNk9KdWdIeWxmd3A4Vm9uOUtFY3kzbG5T?=
 =?utf-8?B?ZHJPaDNhVURXb3AxK3hBdHlBSFB2N3BBYUZ6a0FpSG4wa2pVbG5wRTVkdjYv?=
 =?utf-8?B?VUJuRmZKM0xQTy9Dd2IxTjQyZWVSdWdWZnRtaGUwMHltYnd0VTVJeFRUNFQ5?=
 =?utf-8?B?ZXVFNm52aVRVWkswYzB2eER2RjJ0TDUrRUpaUjhEbzhISlRIMnBNV3RTcjB6?=
 =?utf-8?B?RWZpcHZzWThmKzYzclNhQzRiTHp4YXNtTVpsVXp4YnNzancxai94ckIxZkxX?=
 =?utf-8?B?TmJnQ3ZHSUR2aXl4NC95WHBNMzZVRDRZZXlGdlA2QmowcXlObm9jRXNLeHZW?=
 =?utf-8?B?aEI4TC9zWE9NMG15ZzFVS0pJc0lVZkxLbmRCcGpHMDFwSGJqVU1XUC9Tdnly?=
 =?utf-8?B?NXFxaktLQjVoaitCS2hDMHlrR09RTU42RHdBRFIxKzlyNjdnMEYvWmFhc0s5?=
 =?utf-8?B?ejBMN2RXeFMxdEJTamRMRkd2OHhDdVdrQWt5UzQ0UERLUXpldXNsUkhjZ0U5?=
 =?utf-8?B?bzR4R2RZUlB1MkNNNVdOcDRTSEhxNFNFS2cwekpldEpVczl3SVhNMmtvM0tJ?=
 =?utf-8?B?R0R5NGJteXRjQ0NNdmZPbDZUbDlEaUgzbWJXbmtYMzRBRHcwSTJjeEIyTHNH?=
 =?utf-8?B?RzVLUnRjOE5VREdVcEgzRitZaS9pYjBEMExIbXRWVzFLVlYvdUxyZWpIR3dr?=
 =?utf-8?B?anM2eHRpVnJIclRMODVYNXAvWUxOK1NBRDBsK21ubmxoKzFPRnZkWU5xOVcy?=
 =?utf-8?B?YVhkdlllZ05Wc1FrdWFDdldraFhIaU5zZ09HNVByL1UxaHNkOHphdUlpNnhx?=
 =?utf-8?B?TnFrbyt2Z1llZHRiS0hyRjBHeGdGQk9hNnV0UFdkZzFZOXFJUDdueUdqZ3VF?=
 =?utf-8?Q?64weP2wuF7Yz0ZCw=3D?=
X-Exchange-RoutingPolicyChecked: 4QqobrOpmcKgAIOHkyAIRh3kNi/Yok9Vv9aW+jjo3KuXTO9wUR3gwYaz6jvDHcbTkY20rF8BJtwSBmm0dLTAIx9qBz0Uyjyc0s+d1/mbK4wWbzEBk/CvpleKioaYZ3p3ZtfyJ6YS1ugkYrPavZIyLUkR99tOJgf//btUJuz1xDxodVyumBNgAzml17FZben6TrLNZgKtenA2zf0wTPeQ9eKWML5lT73O9Spq9Ra5rWoM0E9vGbE5IJ52yc/tHdP1EHNu0lw+Eb4oWTtx3YQOA7+D13+es4gmeGDqDVsAoOGUMqY3KNsPJ/emh1hxgnv/rrVlz8h2UbS78FeThZNtNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb4ad59-b5d6-4837-9293-08df35470885
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 22:58:51.3140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnA6foNOrRLQAe5ZimqcJAwIBLL1QensCTCqLx6vy0v5zxQrfoOKCHekcu8OshouOHAydU83eu/pZ2iMWBPB9E/ueo9O/gfDfVifkTRMXvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
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



On 10/28/2026 11:19 AM, Badal Nilawar wrote:
> Enable late binding support for CRI
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a3e035a077c8..a18eed8d1a97 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc = {
>   	.has_sriov = true,
>   	.has_sysctrl = true,
>   	.has_temp_sentinel = true,
> +	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
> +			  BIT(XE_LB_FW_OCODE),
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.require_force_probe = true,

