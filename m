Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69691CA6015
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B2F10FE29;
	Fri,  9 Oct 2026 03:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elj7DlQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702210FE29
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 03:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791515960; x=1823051960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+kCkcTPEiAPN9kkQnKjUtQXtjiNb4npXlEosSlwN6c8=;
 b=elj7DlQT+xelaHDXtWM/w4rwL430ZLibud2J3+nFiADsI49/VEiXWtgo
 tcZIT5Jheb7IDCOVvC+u4DgJWIWpzCna5/0Dn65Zes0+YFw6D/fd0iHLl
 G0kobF926p4+IbS+oj/9rDKobghU1mNahglt53WNN/Yl+DHiUCPWVnOPJ
 UCOlHvLz6UZcTt8Ct8Voa4Kp0Qrq8U+m1nbnYtt6JVuTqsOFvrU7fhlcE
 1ixKbl5cLyj2uRaxpesZSbN8mi0bhbaUbUR8WxHC39p4yBXRQ+A8c8HU2
 F8QAkQqaFjaW/MsSLIqUgEOrc7IXMHiNvel24Vd05mMN5zQ/yVY4GbzW6 g==;
X-CSE-ConnectionGUID: N/j9b3NbQS6cu01EJ0nt0Q==
X-CSE-MsgGUID: vtG4X5v7Qs6e/S9orL0j4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="336788"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="336788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 20:19:20 -0700
X-CSE-ConnectionGUID: wP9zmDS4QSi82dqBMdvVuw==
X-CSE-MsgGUID: isfkWEZoRw2obb4t/4AKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="339427"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 20:19:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 20:19:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 20:19:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 20:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJ7omz52cAaB8gqj9oEJMUfJOogS54zmaualk0z3CIJ0bDpdb9uFd9VFGVUTNwE1e+LZUDUfew9Joye8siadZ6vHkambM3tqzSCnaAy9/8I+IBxwoUy3a6zdVXa1tVqGAwdteOPvE4gDgOVoYxoeXivh5hhQDGrgIzdcqQ2Dzhf3Ja98JRcxsnjghnQBQ/qUQcAPsGfpCR5cz4KCWPcdDmGp/e72tzLpYKmBoy6huf3aw2I8uhG2rRdlWYfoXJPv0pYNBv9vm8u27rgHil9l+7zGNEA5yUvNUNQP8BQOGvseMdMi/zSLWM/FwihLPmH+8I2OWmr8f2m7x8oP/zp27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vigu+Op6vtPFKbROakYSnamIvkBMUeFFEI5NCgLO9zE=;
 b=SdKGGzXZQjfgIzL6Yz0rgjEFuqLiboetcTE3gGlH/1c/00dtrhuQd11tRxBgxb5BiLFTdZpySvajxprrJZWbPHRrA5tvY+wcFtYdGrQ8Q0EGoNNxxfQ1vboS+g1YYO+2Cb9KyJP5kxoOVogQC90Xq30DixzQtkVDiQ+1UorSNoNEKeY2cyIhTntgbqXSuF+EAA2PdCXZDq55RTVmr8Cik7VYTMxeP4ULr/uLVXardLzvyNVjT6eDJWr0ps31ah8TDTB/O53X0Wqt6uXx8DJDKNcomrUJLJuBdz7DLFQ3yMu/7uOC+9SEImRHLa9Uz+KElMSjGX+esu4Xjh8rUnJDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS3PR11MB9624.namprd11.prod.outlook.com (2603:10b6:8:38d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 03:19:17 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 03:19:17 +0000
Message-ID: <e4f27a7f-f0ca-41a4-880b-38b81b8eaafb@intel.com>
Date: Fri, 9 Oct 2026 08:49:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] drm/xe/cper: Emit cper record to trace buf
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-26-badal.nilawar@intel.com>
 <aqJjDA08LIkA5jS7@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aqJjDA08LIkA5jS7@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS3PR11MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 46620e5f-ea93-417f-9b09-08df25b419e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: KG6wS6f+LYGYiIcyYsCOjH0Eo8D173VKUP1bQoEe/wCA34S6G0n/xB1ot//JdNMMVvEFwj8niip+YFqts5Qq9lSWq9ilPHR36XzhmrbLqWQHas1Yqk2tBS+82ukw29gXpZTtOTkMFdeEWrt3NO4BCtcUz2anVnYt3Ob7kv94ipBCovo1Spuu/d2hPLQym6cV6L9vimTumZhIfRyh6G94Vzbb6uPSO3RfM8fryoLO9BB7M+zCKGHtU8xzko7sL99Pyd4ZV/+vM/3X474Q/Acsld4e2xD+lLvGis/KD9dEQpmUl8ySueqHKmlUSecsBh+J5OCKWYz8tCNEFZl1wTbKLKeqIvr/fxM6LoVJDNDR02oF+YRarTrF8C5qUL6neDmqRZA9x0o9b8IpU93E8kd4inTxVeN2HA23lWnS/1OGp/w9OJVpc35azXGUFrtDOoF6JhLdXTr3Qp7qKaUN+MzRGRKzVlV15a762QpBPOTdQIbArcju74zVmdcYA0e3HKpLGyG2asRcfNpCRwuRJvJRyi0oarqHb7bDCthUXK2IbNZq46KZRdpYlCFk3BU0uZyQTL4XGf1mOGf0I4rkeLuMvFnYCEGx59O8TeiSskWdPGVTl2SUIm5eVJXSz0fe1oyMRAeXXsrN0Dt7FGLCg1d7CUdZ4gjnuZQHgHnDtW5aiZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlM4bktMNDVQMURmWnhKVEcrNE91V0F6dXRvbXI1VjhrUG9pNmxuUUVvZ0tO?=
 =?utf-8?B?MFcvU1JZdEN0R2VqV0RtbUM4TjFPUWZ5Qzg0TG1wOWxDMnpac2xScTZjeUlt?=
 =?utf-8?B?OEVKRkxSWDgzb1FnQ1QxWUNvN2FmamovR1U3dTk4ZFhWKzF5ZDh4SlJFdlFi?=
 =?utf-8?B?SFZRSy9CSjJ0L0ZUa0Jjckk2NE1WRkRBWGVLSUpFSlpUTUd1eDF3OUVUWCta?=
 =?utf-8?B?VEtQY0o5eEVnVlAzR1BoT0NMcUQ3eFB3amZZcENTRm9lU01xK2U1TjJoeGJY?=
 =?utf-8?B?UzZWdTRoclNPdUsyYXF1eU95eHVtSzhXVDc2VEo2OExBaWhGeGZBVUREYS9T?=
 =?utf-8?B?N2NmS2NQNEtIY3FPcVBLUURFcy9ZZGhvcnJsSEJaK2pTUStLdElkdnYyc0FI?=
 =?utf-8?B?RVlDcUhtUGZGSDFKMUJSRVNCT21IOTNVS2NqbFZ4UkFtQWloUmRKSHA1ZlBh?=
 =?utf-8?B?UHZCY1RxVTlpN245QnR0RElQa05VTjNid04vK0U4cFFOM1FXRTlkMUN5cGZn?=
 =?utf-8?B?MXJ0bGd6dlhhNVBUNk91VDBYN0E0cDJqamo2R0NnVnF0WW1BUjNDMWUxMjhn?=
 =?utf-8?B?Ui92eGpzUmRrVXB0dTJsWDByN3hocEdRR3ZxZlc1aEVYb1JUdXpYdkJmUGM2?=
 =?utf-8?B?SHNtWCtsdVloR09ZWHl6NDlMbGF2MUdzdkZNMHk3ei9OdHljcUJVc2hLUnBu?=
 =?utf-8?B?cFYybWpCeFN6ZEdOV1UrdGx5RlRaMkZoSXhzdHRBYStxN0FsMEsyNXB6VzNp?=
 =?utf-8?B?UmpybmZUa3FNSFh4Z3hCZ24vdDFBMXZ4MUh2L1Noclh4UkVsM2plN3h3bjl1?=
 =?utf-8?B?azNlbzI3MldXc2VOR2dXUDY1TWkzTzVLcEpCV3p3MnVtNXRJZmg3OWF4am4v?=
 =?utf-8?B?YmZIUnFEaGhFaW1vRVI4UHJiTkNjMVFsQ3RHQXk1VVZkWE5ZbU0wNEZuTGps?=
 =?utf-8?B?SndwTDlsRkZhRHVPRmxZU0NpeHdMWW5WWHFMZm55R2VYYVJCbU5iMG1iZ1JN?=
 =?utf-8?B?N011d3pJdk5sM2JGalMzaXlUcFhYY3NRZTVBcHdURWtyZ1FwU3d0eVZDZTk4?=
 =?utf-8?B?RnEvaDRzS1dkWEJUckUweDIwQWdjTTZ5SmpIcHlvekc2UnZHVHlaVHhqblpR?=
 =?utf-8?B?VC83dDBreXZCcGhmcjRxc2Y1aDlXVkxNTk9oQ2V4bnhySTdBRm5BVjFwUU5N?=
 =?utf-8?B?dTBHYjF1bmJzRkovUEdIQ09VbkRqVm5LcVhZTjVpVU1tUVZqZG82SVB5emdE?=
 =?utf-8?B?Y2hUOEQxMWdqUEhBaDl0L3hkSnRNT3AwNXRzYXB1VFQ0RlFGTUpyblR2VEFk?=
 =?utf-8?B?bEx0VjA3VVNsMHZUaGpyK1N0ZXIvS1ZuL2dveTBVazlxWXZxTThYMEM0dC9s?=
 =?utf-8?B?RnpXMVZ6SnZVYi9zREN2bFkvVVZsaG4zTlhMVzZ0OGFDRUNwYnQ5Y1V2b0tZ?=
 =?utf-8?B?Z3Y4VXR4TC94a2JpYUJKTVN1T1hpOHFFbEk4REt2cUMxclNZdGdqcW1EbS81?=
 =?utf-8?B?ZE1Qb1RUbzFyNndGNDkvcTc0aVN2RjRSZGY0OS9Va3R1L0ZrT3hUc0hyZjNz?=
 =?utf-8?B?bzh2QTBLLzZWVGVGdmRqOHVsaGNDbldLVHk0bzAxeVhFakF3dTd4OXV1Y2R4?=
 =?utf-8?B?aWFuRTk1WjFxYVFYUFRsNUREclhPQUswTUN3RlJQQVlyZG9KSEJnZklWL04r?=
 =?utf-8?B?WHZWOWMzUVByMFdUMitTYWFSUlJuVTZkWUdMdjZER2pWNy93eTl6RTVKa21V?=
 =?utf-8?B?QWUzZEJKQkJ3Zlp2d0RsK2RxQUxYNDNzUXorT21VdU5Nc3ZBNUFublJ1S0NX?=
 =?utf-8?B?RGM5RE1sLytHZ1lSaXd3eUVzUzN6U3NtV3hseXNyNTB5Qm81L2xIYml3SHlE?=
 =?utf-8?B?NUJ6aE5yaDFUbnRqbmUrRk9uQ0dubXRxTmFjdFVXZHUrcU5kdng2QlJMSXpX?=
 =?utf-8?B?b3g1NlhJc2o4alFiT2M2a0ZHUDZ1MzNocmo1QjViZkdGOVE2bUR5dzFSUitU?=
 =?utf-8?B?Qm9pdmwvTXlhRWJ5QlZHRGMyNFJIS1lZakZES3NHeElKdmNJR1p4eGpvb3Fw?=
 =?utf-8?B?c2xqWmNRa0NsL3V2dUpOZmRCMEVJMVJQa1p3NG9CTVdmV2dSUnVrQnUyR2ww?=
 =?utf-8?B?eFFvYTRnZ2pTTkRNS3J2cm5qZkFnN1U0aVJkK0hpU0RhakhzUnVXK2ZFS0V3?=
 =?utf-8?B?djJiVzJqRDYvTDc3c0tRK2U0UmlRSHgvZCtOSTJOMlpKTG85MjkyNmU4ekdU?=
 =?utf-8?B?ZE03NzhiQjlkWHlaaFNmMklrdFZydTJxcTdHeGpsblhzTktpWDZTYWVVWlRt?=
 =?utf-8?B?dFlZNzlCR2x2SkptbGJlL0lVbFloVHF6Qlo2TERKcUozWTh2WlpoUT09?=
X-Exchange-RoutingPolicyChecked: EotYbgxJ8277JibjOd17zEN49A7FgbbDtFAivx/C4QJAEgNyZswR1v4Q8I0lNtoGADljEfGn/2qQO6ho4pnXgVm5e8LTiPOA7KEFeTlSX3yQL7ThF90Ve2/2SoQ6OqA+5P1Btxj0JuUShJbFnfwopvT8QOq799CV23ikt/wTd7H0qe1YIv2WTVUbcXwN+T4IWS1kAfCdRgpkRRPnzxKBwWVkcEdxi77vJaYydCYrNmlHaVMAS2/TmV1LcHWeZxb1IAzXcWzvdZ6iBI6nP6r6h3OkXjf9cjZfVQiFLd5oti+f3ZVW+3nWTghKniIHGQLatyG3AmYSX/gRrMhGY/6TBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46620e5f-ea93-417f-9b09-08df25b419e6
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 03:19:17.1613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l1ZkDPNo90y3/vcnWGeZPFqxAB0nkygFbNsZedL7OhJV3Hhi1NnD366wdF7PT6VLK0HweaB7JTwpIW589r+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9624
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


On 10-09-2026 13:28, Raag Jadav wrote:
> On Sun, Sep 06, 2026 at 10:56:17PM +0530, Badal Nilawar wrote:
>> Emit cper record to trace buf.
> Okay, so all the xe_log conversions are redundant until this is in place.
> Please sequence them after this patch.
Sure.
>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Assisted-by: Copilot:claude-sonnet-4.6
>> ---
>>   drivers/gpu/drm/xe/Makefile        |  3 +-
>>   drivers/gpu/drm/xe/xe_cper.c       |  4 +-
>>   drivers/gpu/drm/xe/xe_trace_cper.c |  9 ++++
>>   drivers/gpu/drm/xe/xe_trace_cper.h | 66 ++++++++++++++++++++++++++++++
>>   4 files changed, 80 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 06b064add77d..7831f7d94784 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -166,7 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>   xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>   xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>>   
>> -xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o
>> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o \
>> +			      xe_trace_cper.o
>>   
>>   # graphics virtualization (SR-IOV) support
>>   xe-y += \
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index ebf4dc4ab2bb..0818ee6ae8ae 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>> +#include "xe_trace_cper.h"
>>   
>>   static const struct xe_platform_id_entry xe_platform_ids[] = {
>>   	/* 0x674C  platform/8086:674c */
>> @@ -169,7 +170,8 @@ static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
>>   	if (einfo && einfo_len)
>>   		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
>>   
>> -	/* TODO: Emit trace event */
>> +	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
>> +			    &rec->intel_hdr, total_len, (u8 *)rec);
>>   
>>   	kfree(rec);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.c b/drivers/gpu/drm/xe/xe_trace_cper.c
>> new file mode 100644
>> index 000000000000..caea8783ab7c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_trace_cper.c
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef __CHECKER__
>> +#define CREATE_TRACE_POINTS
>> +#include "xe_trace_cper.h"
>> +#endif
> This looks like a redundant file that should not exist. Why not have the
> TRACE_EVENT() as part of xe_trace.h and drop this?

This follows the existing split of xe tracepoints by area (xe_trace_bo, 
xe_trace_guc, xe_trace_lrc), and lets the CPER tracepoint be built only 
with CONFIG_UEFI_CPER.

Thanks,
Badal

>
> Raag
>
>> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
>> new file mode 100644
>> index 000000000000..6d2dbf504888
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
>> @@ -0,0 +1,66 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM xe
>> +
>> +#if !defined(_XE_TRACE_CPER_H_) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _XE_TRACE_CPER_H_
>> +
>> +#include <linux/tracepoint.h>
>> +#include <linux/types.h>
>> +
>> +#include "xe_cper_types.h"
>> +#include "xe_device_types.h"
>> +
>> +#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
>> +
>> +TRACE_EVENT(xe_error_cper,
>> +	TP_PROTO(struct xe_device *xe,
>> +	    const guid_t *platform_id, const guid_t *fru_id,
>> +	    const u8 severity,
>> +	    const struct xe_cper_sec_intel_err_hdr *ihdr,
>> +	    u32 cper_len, const u8 *cper),
>> +	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
>> +
>> +	TP_STRUCT__entry(
>> +	    __string(dev, __dev_name_xe(xe))
>> +	    __array(char, platform_id, UUID_SIZE)
>> +	    __array(char, fru_id, UUID_SIZE)
>> +	    __field(u8, sev)
>> +	    __array(u8, ihdr_raw, sizeof(struct xe_cper_sec_intel_err_hdr))
>> +	    __field(u32, cper_len)
>> +	    __dynamic_array(u8, cper, cper_len)
>> +	    ),
>> +
>> +	TP_fast_assign(
>> +	    __assign_str(dev);
>> +	    __entry->sev = severity;
>> +	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
>> +	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
>> +	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err_hdr));
>> +	    __entry->cper_len = cper_len;
>> +	    memcpy(__get_dynamic_array(cper), cper, cper_len);
>> +	    ),
>> +
>> +	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
>> +		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
>> +		__get_str(dev), __entry->sev,
>> +		__entry->platform_id, __entry->fru_id,
>> +		__print_hex(__entry->ihdr_raw,
>> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
>> +		__entry->cper_len,
>> +		__print_hex(__get_dynamic_array(cper),
>> +		    __entry->cper_len))
>> +);
>> +
>> +#endif
>> +
>> +/* This part must be outside protection */
>> +#undef TRACE_INCLUDE_PATH
>> +#undef TRACE_INCLUDE_FILE
>> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> +#define TRACE_INCLUDE_FILE xe_trace_cper
>> +#include <trace/define_trace.h>
>> -- 
>> 2.54.0
>>
