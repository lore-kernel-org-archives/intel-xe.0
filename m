Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41377606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H5117Pm6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F1A10F007;
	Mon, 26 Oct 2026 16:08:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE810E031
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793030877; x=1824566877;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EWGtZNu4Yucgxa2YKcqHrP0cmovB6rl48QSQX0KTTd8=;
 b=H5117Pm6bwlcV+oVyKfakQlQol8hW+tFoUrCpk1It1ClG9XuFPj+N4ye
 flmrWsFsShid6XRG6QzxyRU8CRE9rxiucg8easKD5dT6kCU8Z2wvg8c3y
 6H0NV5qVJxF3SP+Z5sZdVQjtoNj45mLmF68DsJV7FX/JPCGCakREPzlQl
 +ItnZIBqQ3Y+a+wQKDSxyD2JpJbD+znmYTsqnCb9IITNYjto8FYRRTd3p
 sFc/tSdgJGE0rYsDBmOFezJKIVLfSJoGVHFDT0aFEaouW0HQYgeTZosQo
 B3tFi8fPCfOidL5YJajk9wQxQY/IK4hz85QLKwLfmLP+l6oBCQtOG/EG+ g==;
X-CSE-ConnectionGUID: rCJts8u4Rn6ZVe7hEbxd4A==
X-CSE-MsgGUID: hIBcNFT8TWaU/SCeWAc8Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1580948"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1580948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:07:56 -0700
X-CSE-ConnectionGUID: 9q8U0r5lQ1aKwkzet5ZKhA==
X-CSE-MsgGUID: o2onNa0fT9WJTYXBNrBMIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4698538"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:07:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 09:07:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 09:07:55 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 09:07:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvTDjeeic8bNPzWMlmHRJorloVwOr4YDRj4BXvQHAhKMCsBieB/8cHWq6hCxc1qy8glUhu56SPommwh6XW3gOaS+8eDZdbXdtJ/sZuJEXyQDTbYnHParjeTboBsBJyr/HkOwiYL56a4R6o62wuKtrXr0qv7L5/48Aqh/NAIubStnE20JGqECWiFpyvvQu26QlAAC72GNziKbWRi4Lv39kvn5G8/vRFfeY+Xx1gumemZuqO6DHiqlUOLTWDHZsLwPPs1FXAY1K2vhHpQdQSMmgUd7OdyFQXPE5/+qHJ91aLz8c9iER+F+smkA9PMYUzZGPh5mLdDlOYNYOICEDfNEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS+m+yMtP0GMgN6lb1MuwhGAC6di3Uo4VK7psef/E+4=;
 b=cq57JeLX11ST4JbNA9CjjZNw5u4pOhOlof+Ds2RZllru4A/5PjF/vTQuoeTDnZ2pp/yzewQZuGQLQe1Dj/ftr/mI567LTdYdWg52eYL1YSffTkFhQmLNukMw/t4UfZkV908cjJz/iktusK4TXp22fcTLRleQSiBnNZRTRa+SKxbj4M0OWARS+8Bx8NFQb9zBguptitf4r+/hAwyyKHA8ez+uKwKwn32wc7kfNTgsju9dJta+YAnnD6C4QlCFkEeeTjdzywaVesil3wJei/3BiwHRXla5uL8mP/ynCtUjuAt5ezoFKDCrAV3M0HvmPBCoyPlQOr6V2Pjm14oEhu1tyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by IA3PPF235E846DC.namprd11.prod.outlook.com (2603:10b6:20f:fc04::c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:06:34 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 16:06:34 +0000
Message-ID: <00d5051e-07b9-4744-bb05-b7fe7cd07c56@intel.com>
Date: Mon, 26 Oct 2026 21:36:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe: Access GT MMIO after pcode init
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261023111832.218750-5-vinay.belgaumkar@intel.com>
 <20261023111832.218750-7-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261023111832.218750-7-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0248.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::14) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|IA3PPF235E846DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f7ffc1-05e8-4a94-f93a-08df337b1b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|6133799003|22082099003|261026121527099003|56012099006|11063799006|4143699003|261022075727099003|261021123027099003|10067099003|261009223027099003|261022105027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: cFROjC9haKSgbmkyhEFOssX8oNCQIu0E4lF/dstOuV79p41kLqW7DHfBFGpw8P2dxc3k55A8jFr5zxSpfwk7JRNmRgfoM+VBQOh94UdHToKWi7Ff463qZbxPn0Y25yhwEBedL4sm429J0zaV2Pq6JhkFAQ/40HcjWXigITtkfoK4UA2+ff+d4Rb9j49NqZfQsWe906zNUcWADpdxA8yla8Gfc11tDzBmfQIw6RL+v4FsYnVHFLdpFh46Subrj8WfFpL9E1rJGcQALm9+jzlEwJGCSvDYtaEQkgWMMDinwcNxsuc0kZPV0fIAK3AyzfrICGP9B+f7LDRaCt4+XZqQDMEJbhVETvwtOSaDgUj+uj+ZSnD66G413iRDO4UREw1KGYa8kV+WLSnFk+Gm1hbwdFHydv0eUEKXVcwfWGLx1wBjUT8sNbuNONEpcFhEU5XsT7FpVIoaf1+bPxMQycnW0k5ro8nHvJdK0dpyo5NRs+bidzv66NdI3E+O3c9eRhrBrJu73yrFHHzI2IBMimgF2ZGatiIorAxG1z5VSnmbz2ilH+dmnczc6CMTq4revghTEzYa3XiXmo9YK+9dpC+3FSfcPwtdEXNW4MQoEzza9X+sQihxxSzObdqEEZFV6sT20/I0ASlPh7wmKsrty+yDdZ/5XkjycuK9OeGL7iG4030=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(261026121527099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021123027099003)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlTaCt6SlJoWVVIb2R4RmpEcEZmV1JlYmg2QTBJS2xLd0lxSVBwVlM5OEZ3?=
 =?utf-8?B?WTRPYVFpaENDOUFrckEvTFRlUGYxelNaV1lNUUQrd2pTQnlNaTdwcHMzQU9w?=
 =?utf-8?B?R1grS1NiMUVlKzBVRURYWTQ4eENSa2RLdTEwTi83NHlLODRnbXJSaTdrZGNQ?=
 =?utf-8?B?STlMRTV5WDdua1VPcmxiU0tibityeHp1eFd3TlUxU21sbzdZYURvU2U0bm5o?=
 =?utf-8?B?eHJNQXFNYmZkbzByNUE2Rnpwdi9NdzAxaVBZL3lGSGtYcnhFeVZxaktYRTEr?=
 =?utf-8?B?cjRSZUh0NUpWYzMvUkd4SW1kbTNJVmRvMlAyWU5HTVZJS24rN3M5YVh2cm4w?=
 =?utf-8?B?a0hsVGVmdlAzZ1pxVUZMQWFNZnN5c0tscGM5TG9DVXRLMlBoOUJsSFR5UGRX?=
 =?utf-8?B?Q0hIc1ltN0duZmZaME5SRHdZYTFsNWN1eFdVOVFPMFZtWkhwNk9ZUU9qS1hn?=
 =?utf-8?B?WmlWS1MwTERjT21ycmlkVlB3R2tmZlNhK0JmWHMwOU01K3psUjl6UWwvWXRL?=
 =?utf-8?B?eVpTU2RISVpMR2dJdThVcm9rOEZOeFFOeUFaR1g1blFzY2g2QTNPeFY2M2Fu?=
 =?utf-8?B?UC85a1BTY0t2N2NsYUhURVJqZFVXankzNHM1WFFmd0FZemxCb2VRUlJPTi8y?=
 =?utf-8?B?NklwS2ZSWHdDeHlUNlRxRmhKSmdkZGpIZUZyTFptemRSTlZhUE9MbHFxa2pY?=
 =?utf-8?B?M01kK0lLTDdVNENoNnl6RlpOcEdwOGRFUnIwWVFnYmZCdVdDdDYzOWpDV3o3?=
 =?utf-8?B?QVVkdWN0YzNrVHFISUFMMW1BdldXMW4wQ24vSXJJT1V1TnFjdEY4UGp2bzFk?=
 =?utf-8?B?WVJrUllZUUFkajdmT1hrR2NPTU55TDlXbXF1VXFFTnA4d2p4dXdvazdKekFH?=
 =?utf-8?B?Ymo4QW1RdGZZK3hDRU0xOXRjeG4vemVnV1dIY1ZPeDlMSnVKdnlDZXlkaisv?=
 =?utf-8?B?VXgrU2VZdTd1SFpzczhBTXdjbDhHeUQxQUg2emlXZXBPUUZPZUFRcjgwZFk5?=
 =?utf-8?B?VkNyMXB0dWNRaWNtVEJPTUxRNmF3aXpERVFlYWh1WnFhNnBua1l5UHlPMWlJ?=
 =?utf-8?B?TmYvQ3lycHlSeXVsa1lNRnZlbjFaTERubXN5YkljRHM3N3ZKbkxaUDRQODRU?=
 =?utf-8?B?TFlCT3FzakNNSUtuaVV6alMralBjeXF0TTgzSTBtUC9rSjBLMksrUUtFcUV2?=
 =?utf-8?B?TThRbzhJMTJ3SUJpRVFBWS9hQXJFeG1rNXkxVUEycUM3Z285N1NaTGExbTNh?=
 =?utf-8?B?TEFYN2NGekVaWWxCTUdFTTdjNXpFNk5hLzFoSzhlWmhFV3N1Nzl4TmdudTFM?=
 =?utf-8?B?Z2QxVGFyWWxVWmtZOWV6alU0cnpKdG8yaUpiZXoxdW0vOG5MUCszSTQ2OTFZ?=
 =?utf-8?B?RGI2U2ErWVM4eVAyTi9acTJWVHBFMHExTEk0NlpURWlKeGhVOWpLQWExaFJT?=
 =?utf-8?B?NVNMNU5WR1dCeTh3NXVGbEg3dG5uUE5uTElwSE1SMnQrcTQ4TzJRaEc0ak5G?=
 =?utf-8?B?bW9kK3lUaThLUGpXMGRUc0k1Y3RVTUJwUWRQOGdYQzB6VVhwYkx2L0MrSGFN?=
 =?utf-8?B?aW1qK2ZqTGVTZHE4ZTJDMU0walZmMVdseFcyK3NSaTNzUUUwMG9zL3J2aVYw?=
 =?utf-8?B?endaWTZLM2JzV2dCTVJOR3lnVFo1REJUdTB2Vkk0TG1JaGNxTnlTK1orU3dD?=
 =?utf-8?B?V0k5MlFKNkFvckxxd1g1UUpIT0YxaHJQR2lycG55ZFpQenU1ZmxPMXNOaEpk?=
 =?utf-8?B?aUZQeitmMlBwOG0wVkZhU3NtZUsvTndQOEtoQUFCMTI5Sk13Vmh4NEJLa3N2?=
 =?utf-8?B?Ni9CQU9LbFF6bzRkaG5DbFFVblVkMkdUVGVrelNVa0RVYVFHSDJmdTc2VXNV?=
 =?utf-8?B?bUhZeUlFZ1N0WTlYSFpOUVcvcitIVmg1Q2JkOGpzSXhtOG8yc2NxejdDNWE1?=
 =?utf-8?B?TllnTjNJcDlMZ0o0Y2JLV1dveVpubG1LUUEwd1lYK1NPWDRRRXROa05GaDFy?=
 =?utf-8?B?V3ZLRHZGZ3FDdTJxc2g1ZkttWE1YM243R3hJQ2JjWmxPUkNIYzdCUExNWCsz?=
 =?utf-8?B?a2M0M0oyOEhPbUdjYnFMeTVLY2lST0EwTXNYRjFDMXg4MmVvREdoU0p4RjlQ?=
 =?utf-8?B?WUhqSG52Y05vWkNpcGJXdHcvaHhWVkNBd2tzUHNIVWJOdVlpM3cxYVJRLzZX?=
 =?utf-8?B?V1NVS3VtUzVUYTZLajlZRmQxb3cwaUJuV0dHaDBrdWphd3hXSmF4bk4vNlI1?=
 =?utf-8?B?Z1Y0REthY0IraUFtNmNTTXE1YW9sREoyMGo0ZzIweklVSXl6dUc3anh4RDIx?=
 =?utf-8?B?NVhYbUVpTjZ3Wmo1SWpaaFBZVUx2M0Y1SXhUS01nKzJqSFA4OFU5QT09?=
X-Exchange-RoutingPolicyChecked: aZrA7TSlyxmP/W9hoVPh1tSWv6N0hgpbQyaHoNjUJWkN9sU/oNJkLTxfzKBgKH0rjI44tPK/8HCQ6GhX+Jp3lUkaGzPVygLDpfnF/GyxUpfX533LczJd1yIesSyS1sdJajoNEm0Ws3AnP4BOTjhm1WkF+FQBmPt9iLkwmDh75j2p9O7CgKjkw+f9wkruSyU7V8MKEtfdKJdwAMvy+3ztf6pU9urrrXN8W4kxpz6uokf1hWghRwkfJg/9wZVc+str1GDqc9ZPYoxw1bnAynlIeRpXe1+W/lbIrp4w4TK3qpwtr3JkUSHiWlNeTB/hAjy9sdUHP14FOO+fF7lqPx22Yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7ffc1-05e8-4a94-f93a-08df337b1b43
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:06:34.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3A3nSR6UcLfnUtT+QbP4rxF3jHLt5Bk3EGqHOUEdioSetz/nBW+ZQ3n2MWdkk1urDeB6T8MMb3lc25pCikS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF235E846DC
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-10-2026 16:48, Vinay Belgaumkar wrote:
> Allow pcode initialization to complete before we start poking around
> the GT MMIO space during resume as these accesses go through sgunit.
> We do write to MMIO registers in xe_wa_apply_tile_workarounds(), but
> those are in uncore space. Those accesses remain viable even during
> d3cold suspend.
>
> v2: Clarify about xe_wa_apply_tile_workarounds (Karthik Poosa)
> v3: Add fixes tag (Anshuman)
>
> Fixes: 95d0883ac810 ("drm/xe: Ensure GT is in C0 during resumes")
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index daa7ba2df317..1f5097875bcd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);
>   
> @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>   	xe_display_pm_resume_early(xe);
>   
>   	/*
> @@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_rpm_lockmap_acquire(xe);
>   
>   	if (xe->d3cold.allowed) {
> -		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> -
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
>   
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>   		xe_display_pm_resume_early(xe);
>   
>   		/*

LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com> 
<mailto:karthik.poosa@intel.com>

