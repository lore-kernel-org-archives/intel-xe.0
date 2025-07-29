Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD263C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 17:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E0610E047;
	Tue, 29 Jul 2025 17:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XX2nqJcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E86610E047
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753810857; x=1785346857;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B99HOZM8qi1OrWYjkGDM8RRccgKnZcTopvxxVtKQ1G8=;
 b=XX2nqJcUKUaPd+SiYeuPd0GlhaWximk3d/N7fSwDwh68DBADAM1dO+vn
 DC8zbbte3fl93Bxh6YtoYMRZE/zVcP02EfhPWOihOqpA9pnHiv/WYmfq7
 3+hEY4Wy+DbTY8yRM04McizW2hcVZOR2IXBD/mPr4j2lPMpi1mmjg+fEm
 pK6u+BSfpol2HLgWIDtf37sJdZdWw+EwF7jKPUNSlysp6pkHfFSQ5+vtH
 UfznairJ3urMchWqP/tjRF08oVqw98jHz3CkWRwaEc63A9GT5yWSdftoo
 /jyGDX7leJCKksDQ5GZ5McG/j3quBjKlwgt5ivEvic1xdQ39YeMpDcrQD g==;
X-CSE-ConnectionGUID: Xc6a/1MOT1aeRs/RsstohQ==
X-CSE-MsgGUID: wtTK7sHOTh2/yV7BBjaMLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66795059"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66795059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 10:40:55 -0700
X-CSE-ConnectionGUID: wczSv5UjSoKf8KDQq3+czw==
X-CSE-MsgGUID: Gh+X44RFRyOWrAITugNzQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193610624"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 10:40:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 10:40:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 10:40:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 10:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0nG4EhDVPOqXz+QNRSNhf4GD7T8Ml8Yw4C5vlX8g0GJg5o5XNCKCT8IjDRPgKWWjO2rxf4DF4HRZOpYGzTbWRC2e21mMbEPTFnxcoAyQpMyqrIydz/BE+VCP7Kik4loYXm1Swzrk9BQAYrbJzDx5JfMlnSioo/qG2LOgkMGtOUjDxb1QsCCVI/uTrFb6mpDDMksMu0AAgti8c3iwRHfUDyQRlpXO9J0Td8iF1X/kSI1vyx+i6nXnbSn8mFWcHZ1GUU2DzR3hbyhWn0+0+AqBwcA/MFPZ4ZeTeqAN8DCNI3eGei08ncmhEDNid7/xV5XNqpps5ikxY7utAfP0qEdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFvwET5Hshh8D1xPVy+bzeY9D33UDbGRMHoYCOF4i8U=;
 b=Udu+aM5uG1wZsH2WmYDIjj7EUTQgYO8kKdhoP+d1eZ21QwjmjHNNoGme9gYSgJ9/akTTJ4+lTBMHfzSid1cShD5JMElpTeNxtI/gvlGLb7foMTISPx9qRdchYsMsMUPlb7IbqXAubN7wjsy27X7Jb7kA2jb9KCFiVC3ZnDCWI24s8An/oTWTqRWeSxPt4sP20ZX4vzWaY2gZWilHQd1AaWoN1pan8NUNoG4J0t59LDEKqptxeYLc1xWXOsxVyPLtC6wHhf4nGiBkh2r6AS8etViHYL1U8bcT/qPoQSQBm8X541dOXk+Hlz1U0zmN6If0iSH8Jn3T+AqSrwCV6TUgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 17:40:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 17:40:50 +0000
Message-ID: <5296f505-ae99-45bd-904b-e0c6296546d3@intel.com>
Date: Tue, 29 Jul 2025 19:40:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Add log init config abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250722013553.1266218-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0182.eurprd09.prod.outlook.com
 (2603:10a6:800:120::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4e03a2-44a5-4f54-91d4-08ddcec70f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG5WZzlkSDRaSnBMQVczdEJ0YSthbGtqUm5iWHZVY2E3anlDUnVzY25EdVJn?=
 =?utf-8?B?RGFWbXhZSXFPQWxqYjc0UnBnbmNsZXdnTmZpVEtLQ201OGNtanZuNVhBT0Fw?=
 =?utf-8?B?WDQ2THFBNkdSR05WOU5yU0hLc1VXUS9BcGEwRjVKSDNFWWVKOGcwSXZzTzBO?=
 =?utf-8?B?b3NCVlJ2czBsYXlNYkZzN0VFU1QzbkFKSlQyTDVjTGRxR1V0L0pkcFVPMmZs?=
 =?utf-8?B?WloxU3Voc0JXM3ErZmFFVHl4NnRMekhEYlhMNEFDSEhsUTFKY2ZzZmlLZDFo?=
 =?utf-8?B?dWhKMzlsYk5TSVBLZlVRSlRtRVNzMXdhbDVYVGR5TTByUmtuTWtNOEtUZERH?=
 =?utf-8?B?K25jQ2xubUcyZmpya2l4bG5DMjdYQkV1ZThiOFFmR1pGVmdxeGVkZDFJWFNP?=
 =?utf-8?B?OEt2Z05lR0JreGdFbk9MNkExc21wc1hzdUVOVk1sU2pMR3lIKzJZbXRlZGRm?=
 =?utf-8?B?VjZQWm15T2hPZ3l1YytuQkVkZWpMWnNkWGhaU2lrekNPWE9GaEg5M0owV0dz?=
 =?utf-8?B?am5FRlVUdURoOGt3bGMwd3FEd3Z3L0FpT2diQU0yWHhHRHdVZnhHTkRsdEZY?=
 =?utf-8?B?U2FTRXVWeGI5MlJCUTYrYi9FVytqRGNxdFNDR3ZHYVJYTEgzNE9kOHg3b2NT?=
 =?utf-8?B?M2ozbHJQQ2RUSDltbWNOMWt5dkppbkw5b3JaSFBwQnd4aHhPVDFJS1VUcEQv?=
 =?utf-8?B?OUt2VkdaQktaN3kzQUtTMHFXZHJyTGdwRFIxbE1GRTg5MUVZdmZCTXkxaE5q?=
 =?utf-8?B?S0NjMk4yQ1BYM0dtWGJsd25pTVVNU2U2UWk1WmpnL2tGekJiMUdaWW14Y3FH?=
 =?utf-8?B?RDhwR211cSthWUNHdmVTT245c0NHRVZXY1g5dmFDSGcvRGJScDJZUjhOVmtP?=
 =?utf-8?B?WFdKY204YXZUN1lRdlptbDhwL215Z0NGdHpvTXZHR2RJMm03Yy9OaFhsWjNu?=
 =?utf-8?B?cmIzVzh2RDFtREg4bXg3YnVycDVPRTFlNVB3eG1JNm5JSjdJUWZSRnlMd084?=
 =?utf-8?B?QmJFL0R1YmxFcGtQTmZQVlFnbTE4U3NiZTFGMUw2dEUwcHE4MmpGdEZqZTFF?=
 =?utf-8?B?dnUxL2xYNXcwWjBCRG53T2ZGeiswd0YzS0JyYnZKRDIyckl1Rk4rSnNEeThM?=
 =?utf-8?B?WnhpeVFsdC9MMC8vL20yeTFsdEx0OFFuK05ONThZdlhGT25hNmRjSXcwYkFj?=
 =?utf-8?B?RjlkSnZYWWE5VmR5b3ZoczV0anNHazRKM3o3dng5SkdtL1dURzFURitNMWZl?=
 =?utf-8?B?YVcydzBYaVUvdkpwRjVSUlNtUlFvNkhBRFJ3YllIS0lKcDYwbGVicDZTZDVP?=
 =?utf-8?B?SWxGV0JWWGExbCtrclAzQmxlR1hLbDJIVTYwVFl0Q2pYd3ZTa3VScFkzL21y?=
 =?utf-8?B?NVZDZ1orWnFLWExKUlp5MEtQUEVEN1NyOWFVZHRvUEVpTTAvZEdkRm5VbnVI?=
 =?utf-8?B?VWFiWWRFRjFvazJuVG9pV3NZcVpRcU1UV0NNT3FsQnJUMWxqL2R6U3BzT093?=
 =?utf-8?B?MUNEVlJjQU5pa2RIRE5KdHVwUndJd0ozTGhINWlYK3dmbU5OcTFOS0VnTzdT?=
 =?utf-8?B?ZVlwdnorSmJxZGhkZno5R0IwQ2R4L1VncjlqRE9Jd2k1NWdLeGxOTlZUUGh6?=
 =?utf-8?B?TDlaMkZEKys1WERFU2pUYWxCZHNOVzJDTm11U0tYQkoxWUloRklyaGRBZVRm?=
 =?utf-8?B?Qm1VM0dvdTJXUFFJekYvZm1ydnUweFRyZ0ZSUWZVb3ljaE1TVTE4Qkt2TWx3?=
 =?utf-8?B?ZVNtNjhsTnlla3ZBdlRhWTRBUStQUmJ1VkFXeU9JbGV2ME8vbmZ4UjVZUlRo?=
 =?utf-8?B?ZWpUYXhxYjBwNzlheGw4d1ZHdEtNbUtKYWlwS3F6MzFyRjRTUnA5UmlPL0o2?=
 =?utf-8?B?Unl0TzY3TGFUbGZCTlpjRHB6NWZWcWlETWRoTC8wRjlSc252OE0yZG5zOTIz?=
 =?utf-8?Q?DgTLYS1mEKo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZON3J1YWNSVTQwZHRmTC9pekxEdU9RL2tsZFRFSU5rMEhBU1JnZ0MwSStT?=
 =?utf-8?B?by92b09jQmswS3R1RVRlS2dGLzdMeCs3Zng4c2Y1UUczY3lJdmdtVlNCeE5z?=
 =?utf-8?B?WlpyeFl6aXpYZEVMa3dQQlMxemx6UVg1dWM2WWN0aDdlbUM0TFJKcEtzRTAx?=
 =?utf-8?B?ODhIQ1owRWJGRlFaa2pidVRBamJqbGVBWEdXd1JuOGFHU0xoa0lEeURIYk5I?=
 =?utf-8?B?NTRaT0NTdmlJZmVBTENnMG0zc3NxUDdrQ3l5MWZXZkM4Z210ZjY3ek1VM0w1?=
 =?utf-8?B?WWVWS1N2K09FV29zSzNyQkJ5U3phSUdoVEQ2L1Nrc0k5T3JlSTZHUGlyRXlJ?=
 =?utf-8?B?VU55K3B6N2NVeEl3MStVNVVYM1psNDlNaGZrNS9xZVB0VkVzcUV6M3VaMEY4?=
 =?utf-8?B?YndBU2k5NVpQV1NQdFpWbG0ybzBxWWt0TjNTbWw3SkFQM1BlMFpFbjBYMm5v?=
 =?utf-8?B?YnBWSnFLL3A2OW1aT2J4UkE0bWtuWFJabXRtNkhIMHlrSUZoZVhkV0t5cHBB?=
 =?utf-8?B?M2wvV3g2RFdhQzVXUW5rMGZUeVJwTkwwN3doWEV4RHpEdVdsb3dxOHlJSWVJ?=
 =?utf-8?B?bGxEK3pMS1BiTURuSEVKQnlVaWxXZjd6M01YL3oxdnkwMUhNcUcwd0tYSHc1?=
 =?utf-8?B?ODRrNkRlK3NXMGExT0hXKzN3MURDSjNyNk5GZjFOaEk2WkJTZUpWWCtYaTQx?=
 =?utf-8?B?bGxFcTB5NHpiQURIdVlZV0x4THJtaDdaSm45VVdsM0tscEhrTXAzNTR2YTN6?=
 =?utf-8?B?U0RjZlpkMFNQcmtNVlNqUWNGOCt3Yy93RWcySDdUdjJoMnNFUm1ETWF6TEdM?=
 =?utf-8?B?TTJXaFdGc09EQXpwU05wVjRUb2tNRXNSditoSng5M1Zyb1ZCTUVSNWM1UEM3?=
 =?utf-8?B?dm1hLyswQkxlWEpvNnc1ekhKRkxFMWltQ0dQbkdSc3cyTmJYL2FJWktxcGpM?=
 =?utf-8?B?cVkva1F2WlFhbkdnVHpaMVEwOURlVTdhZFlVWkxldDRpclZFVWFkQ3pNYWc2?=
 =?utf-8?B?Mm9ROFB0NkVQZnJOUW1aQmI4MlFYdk1UNzRhSXNPWGVBTTh2OVE4cVNXaGg0?=
 =?utf-8?B?cHZiU1N4cjZlZkFFMk9kdm8zWmtEZDQwZlErR0VOVWpLUmtOdHlyUUtlQ3ps?=
 =?utf-8?B?eHRjOEc5cUUxNysraytWSnFsSG82alBTVC9vZG0rc2g1enNEMG9iYXVhMkgr?=
 =?utf-8?B?U2JGZWZyNWpLUTFOdU4wdDFWckNBaHVqK0d2SHQvMjZwaGlKbVhqN1ZtKzha?=
 =?utf-8?B?ckRsRVJlY0VMVXNDQWpENC82WGgxOEdxNnhGZnZTdi92bzE0VFBCSXUyNGwv?=
 =?utf-8?B?VDk4KzdrcjRxOStpT0k0bU5EMCtxTFBEeXZXSWI3ckpWOEo0OGpxQUVra3Iv?=
 =?utf-8?B?Yjk1T1RwUzJUYzBTMUNoT0pjc05tZGYvUHU3aVFJR09aZkJzYXU1M2p5ejRi?=
 =?utf-8?B?bzZWaysxdHN6M0ljeDVuU3RIWm1GU3VRcGtrbTFZaURvbHRTaUpVNE43SHFx?=
 =?utf-8?B?M1VrVTJEK0NEQTZXS1BnaXhLNDkvSWhJNjZpWkNyUUtBQnEzTGZ3N3R2OVdX?=
 =?utf-8?B?UUxIcGk0dC9ENjIvbXlWai9HcGthNjZxekZQdSsrSTZDTUhaT0VIcDN3bzdD?=
 =?utf-8?B?WklSVlpHRzB5T2VqNWtSVDVxQU9PYVVXcmQ4UWV1WkRZeWkwREZ2SFRXQk5R?=
 =?utf-8?B?MUpWcnRMZnViZ0xrUGdjeWFWa3pLaGFBd3hLRzA4bUpwei8xK1FGR3N1ditT?=
 =?utf-8?B?ZEI1N1NtT3pmZlFUV1hYRmo0RVdLNjNucWdnd1NNeDcydFhldXdmdnhEUi9F?=
 =?utf-8?B?ZmlTL2JHY3dkUi9nMXdDRG5kbmFnSEt6N0cxUkhPY0ZXc1JGMEdBNitOM2x0?=
 =?utf-8?B?ZkNFcEtjdWRNcGFocGN3UU9ONjhtVFAxQ2d1cGVqZG8wL0s5MUttVWRVcmVD?=
 =?utf-8?B?RTZYa09VRTg5dGZMNUxvNGI4NmJKRFcxTjE3NFRFQTRyL05hSzJ2N2JCem1L?=
 =?utf-8?B?WG80UDJrYXdEbzgrTFRROGNiWmlzVGlWUmFENWhtUVBVb2NmaGcwUEc4b2Uy?=
 =?utf-8?B?b3JFMjEvRy9sOURHeC9KS0s5YkVneFFBa2hZeVhEK2YyZ2pjdWZTRFYvZXZW?=
 =?utf-8?B?bHFKVjFqSHZ5SmpOajluZFc5VGtXeEV4aVdqc1dlN0J5dXR0YlpRektNSm1n?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4e03a2-44a5-4f54-91d4-08ddcec70f17
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 17:40:50.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs+xvfY68hWDxSBdYHxV1/ZQoKLP0heVUDL0jDu8/rPMzQXxkpsqc71/Zs+qKsf6FBb7xG9s6MNw8c7YpHjXiC6aVdsPu50SypjSMhS35oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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



On 7/22/2025 3:35 AM, Zhanjun Dong wrote:
> Add GuC log init config (LIC) ABI definitions.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 +++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> new file mode 100644
> index 000000000000..a4e27da304cd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LIC_ABI_H_
> +#define _ABI_GUC_LIC_ABI_H_
> +
> +#include <linux/types.h>
> +
> +/** enum guc_lic_type - Log Init Config TLV IDs. */
> +enum guc_lic_type {
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
> +	 * is a 32 bit number represented by guc_sw_version.
> +	 */
> +	GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
> +	/**
> +	 * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
> +	 * bit.
> +	 */
> +	GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
> +	/**
> +	 * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
> +	 * frequency. Value is a 32 bit number representing frequency in
> +	 * kHz. This timestamp is utilized in log entries, timer and
> +	 * for engine utilization tracking.
> +	 */
> +	GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
> +	/**
> +	 * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
> +	 * representing graphics, media and display HW architecture IDs.
> +	 */
> +	GUC_LIC_TYPE_GMD_ID = 0x4,
> +	/**
> +	 * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
> +	 * Value is 32 bits.
> +	 */
> +	GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
> +};
> +
> +/**
> + * struct guc_sw_version - This structure describes the full version of a
> + * software component.
> + */
> +struct guc_sw_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
> +#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
> +#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
> +#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)

in other places we start with MSB definitions first

> +} __packed;
> +
> +/**
> + * struct guc_lic_format_version - Log Init Config Structure Version.

    *

> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 *  Log-Init-Config structure minor version. Must be
> +	 * GUC_LIC_FORMAT_VERSION_MASK_MINOR

you likely mean GUC_LIC_FORMAT_VERSION_MINOR here

and likely the guc_lic_format_version shall be defined first as all
other definitions depends on this being 1.0, right?

> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MASK_MINOR		GENMASK(15, 0)
> +	/*
> +	 *  Log-Init-Config structure major version. Must be
> +	 * GUC_LIC_FORMAT_VERSION_MASK_MAJOR

GUC_LIC_FORMAT_VERSION_MAJOR

> +	 */
> +#define GUC_LIC_FORMAT_VERSION_MASK_MAJOR		GENMASK(31, 16)

again, start with MSB first

> +} __packed;
> +
> +/**
> + * struct guc_lic - GuC lic (Log-Init-Config) structure.

s/GuC lic/GuC LIC

    *
> + * This is populated by the GUC at log init time and is located in the log
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
> + */
> +struct guc_lic {
> +	/**
> +	 * @magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: magic = GUC_LIC_MAGIC.
> +	 * Used to verify the information in this structure is valid.

hmm, last sentence is redundant, please rephrase

> +	 */
> +	u32 magic;
> +#define GUC_LIC_MAGIC			0x8086900D
> +
> +	/**
> +	 * @version: The version of the this structure. Represented by
> +	 * guc_lic_format_version
> +	 */
> +	struct guc_lic_format_version version;
> +#define GUC_LIC_FORMAT_VERSION_MAJOR	1u
> +#define GUC_LIC_FORMAT_VERSION_MINOR	0u

those defs should be closer to struct guc_lic_format_version
where they are already referenced in description

> +
> +	/** @dw_size: Number of Dws the `data` array contains. */

s/Dws/DWs or DWORDs or dwords but not Dws
> +	u32 dw_size;

hmm, still dw_size name is suggesting something else...
maybe "@data_size: Number of dwords in the @data array" 

or data_count or data_len

> +	/**
> +	 * @data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic with keys represented by guc_lic_type
> +	 */
> +	u32 data[] __counted_by(dw_size);
> +} __packed;
> +
> +#endif

