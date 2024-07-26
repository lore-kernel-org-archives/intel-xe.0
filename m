Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2046AC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 15:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6510E9D0;
	Fri, 26 Jul 2024 15:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jw7bMusR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8543510E9D4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722007763; x=1753543763;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LU5wpik+4VYn+MnnIcH3ilbYrTkBLcE4EbAzB6jZKmc=;
 b=Jw7bMusRn7s9b1Mt/NAj0wkZIl67wJ7F0vdBQPtVh/aGwWG5UJxvzXC0
 zGa9F5QDEwv47sIeda3+INYJRElab13+do5R57o17rrt2hAKUp+43mp+W
 0D6YHvbB6t7TGcru5BkTTRerL2FcschDg4gs/GSbS5A9f6WuTeJCvMvAj
 pArrqKM7LOhRLCH5zXGGFE8PONGS66HZ7A0/ylDTqeYqQ3Nk6ZEZWPdCF
 AHfEEyvODbrd3T32N85YPstSqFsXwT4taM3DYNCDrahdPA0XsplF+2euy
 JOub8VrQrp9kgCFy45Ghhtr0qJvkNAk8QdaGmz1hmAl6mZYoKZvMuT3mw Q==;
X-CSE-ConnectionGUID: p4xPCu93RDakp63BRjgfvw==
X-CSE-MsgGUID: J+WQHeVkSZCiHxceMvGT6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="42335217"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="42335217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 08:29:22 -0700
X-CSE-ConnectionGUID: lHKH8eWWTmKEV1GwlBvjXg==
X-CSE-MsgGUID: W0Rz3ZFTSjKGCtk6m6ayIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53217979"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 08:29:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:29:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:29:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYjKQLKOTUZ7bcu+sr6Sg1yELxd6yc1lsaVCo8L3Xcp+jSpKNF9IzzDdUbfjjMBtNQZKDupDzDwCO977ioEIDLOHJtw7Mg61LjQWzuOCoJfKfZ/lETleFOpbe2YnlGsF0HqscWdzSWQJrcCYwpfMaECdNJEhy7+7AF5NoFHSTJUegTDBxFQpD2xzq897hREHoq1hkSuMi5mX1BTGHIh3n9akusaz/hOvEe0UpGQLbO0hWMdWx3GOojG5Ia0FoNfOW1+N8HnGetiPJbD3QfV5Mc5wJnZpLQBtQ97A3JhUdDO9HqiQCewDvQFywO6Pmt0iX9hpWgYV6oO297C+aUrWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptSikDZK/ryndw3f3WrVJu1yvPEn+6L8vorOBdn6pwU=;
 b=xlUYa8RVyz9VsjBNsCu4XqLwrAqUDKkLvIbhpChP7Rmo1wHJd4anm38CQ+4Eu0Fby92bUQet1nDuQrn6Q7N54SttfPmieM0TiBeqhgu3g1n4XNBAvBKrqeDt1uMPbQfSpMu0qi0y8C/JlYTpQYmVtWNtlTL7FKzGyMIbRqiB+0/Q2cAoM4iOtvd8yyzUDDtaPpz1o41I20WlmQ44HDEsgehpfxCxKj+g9STmGckW0xck7U+gT6MhRTCS15T7WcJll/YJPitgErL7nzTx4IVcb4ihrX1F9qVNYK+cD1VzpsRerBxceZDxs4vtLNwdJeb4u0HaVEfw1eAmMVWFAAwcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 15:29:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 15:29:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-3-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-3-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/7] drm/xe/kunit: Rename count to sr_entries
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 12:29:13 -0300
Message-ID: <172200775303.1586.9363070067696930394@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0279.namprd04.prod.outlook.com
 (2603:10b6:303:89::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 913ab8a7-b469-48b0-90c4-08dcad87b695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE9aeitON3N4akU2Rm8xYXJrS0crYnJkSzJ5T0VtQVBTYk5BR0JtKzNRaGtL?=
 =?utf-8?B?WEE4V29JR0J0OUxmSVdSMWl3dm4yemt0bXo4eEVnaUtuWGhmWnFvVUNac085?=
 =?utf-8?B?czdkb0x5UnJ5S1dhNW9CKzBlcit0aS9xd2t4T3QvYlNIZS9VQnMzaHNxbnl5?=
 =?utf-8?B?U0RqdHdjYWw3amFrWE1pbFdWcEIxQU14WnJTOVVXUjd6QVMvbHlDR0RJdEt6?=
 =?utf-8?B?S3hiZmRVUUpUMTZ5K1VIYlFpTEV3NkN5UXV2bDhsS0R3V3FXS05yR0R1OVIv?=
 =?utf-8?B?VThYZENsSSszOXFRTSsyKzNkNUtjMDFHYmR4Z1crM2czVVFPck5Gays1RjAy?=
 =?utf-8?B?d2pMenhvMnpaQmNBNE1iMDlqWXNmMG5ob3JETnNnN1lneHRLT2t1MjdJTG5w?=
 =?utf-8?B?bmJFaEdGU2VHZm9qM2Q5eU5UYzFBcVNxclBBNGhUai9BZ0R3N1E5Rk5tL0k2?=
 =?utf-8?B?c2cycUNMUUoxSXk0aUh5c3hXeTJqT2FGWGZIbG1qS3p1VUlsa1pCaEZpWG1t?=
 =?utf-8?B?SzVOQTZnODVBaDZGWkkyTzg1MHdWT3JxRmpzakYvNG9ZK2ZGbC9OR0xVck9t?=
 =?utf-8?B?cENKWUFqUzRBWWtuajYveTJBQkcxL3dDSjdjOVlYK0JGa3BDcmZ4SHh6eTB0?=
 =?utf-8?B?SDk4T0s3a3NUQzl0ZCtaWUY5UVBBZDB1clc4aDhpYzhhdzIzZmhwUDZFdEMz?=
 =?utf-8?B?bXc5RXRUMnN6dUk3OTRHTktMTDZMWHJLNmZKdktXYTdTMGY5L095WWRtTUU1?=
 =?utf-8?B?bW5JeHNuaDVnM2l1M29ZdnFQaW85SCtYdTlHOWd3RnJHRFNqVmRoalJ1Ynhq?=
 =?utf-8?B?dnRHNE5SVHhhNG12cHFLWmpUd0JudHdYUUtWbHM1cnRjZVM0U3RhcGk0eTE3?=
 =?utf-8?B?S2tUWUNlL1g1cGVQWElSUEVYQ0d1aWdINllTY1Y5dWplQUFxMkYzaG9FcGVK?=
 =?utf-8?B?a2hLS3VSbEFOMnZ3aHFhTlA3MHN0cnRwOVhpWE5xQWFWQkxKWjB4N1FrT1Fv?=
 =?utf-8?B?eTJ1ZHZJZytUZ1JsaTBxakoySHh2dEpPSWNubUJ2YWx0Z2QvMGd6Ym95cXFT?=
 =?utf-8?B?cEM4OE1zV3VjaEtxRURRdmdGRjdNazBhQ1JkZllhMzBsaS9vL2gyMEswK1hl?=
 =?utf-8?B?dWVBT0dxeHRuZis1ak5nVkFib3FoQzBtTHI5eHhoZG40SURhUjU4QUExeFBD?=
 =?utf-8?B?YzlyMVh1L0xoV2p2OEE4MTNNaGFNekdueFdpb01ZSVJCMnBZclJoeWZSL0k2?=
 =?utf-8?B?a1JERzZZRWRlSGE5a3MrOVVyUjRDakRxMWg5TDdHM3pDOGswUEMxbGd1UVY5?=
 =?utf-8?B?TlE5a0NHUlo3bjc1Y1hkcEJCRG1IRlppUG56UmI0NGtiRkFqd1RkV1hkSzEv?=
 =?utf-8?B?RkRkV1Z4aGM3VDA3aWJCNmtMVDNYSFB3NG1hbkJzcC9CU05tRmZBN0o3MmJF?=
 =?utf-8?B?SERYRFp2NFdoWEFNNS9wR3VJTk4yR0xHdzQ1bjFMZ1AzTDJCdDBSSk54SVlS?=
 =?utf-8?B?RXBjelRCbXRaazFqTEN4SUd2QndXelhuQm5FVDRkLzM3UU84V0xYYnZVOU14?=
 =?utf-8?B?cjFrQ2hsZ2hjM0QzMGFLMUhSY01sRitPVGVLVzlPdmJsU1pXQS9JbHp0ZHZ3?=
 =?utf-8?B?ODdSTHp1VWdteDFqS1BET1llWW1mWktLb1R0cnNxQTZqd0Q4R2pSOExncllt?=
 =?utf-8?B?ZG1JRUZXZ1VUdHBwSStvaVdBclFiRGs1ZXFBOUVqUHJFU0t3S01nSVZVSGJF?=
 =?utf-8?B?RE5UdllUOHN1eDA0ZUFvcWg2L1V0Y1l1R1FUZ1BMZ0wzRUZ5N2wwQ0RQT05T?=
 =?utf-8?B?dDFKWUdkaStxZHFYb0Nudz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTQ3elZ6SVUwSjFvb2xyWFdJNDYrMkplVjFPaDVVNTZEU2RGL3FmN3lPUFZB?=
 =?utf-8?B?bjVmNVl5UVN6K29xN3ErTUxmQm0yMXY3ek5LdnJuRmtxUzRnK1dPK3U5Nmhl?=
 =?utf-8?B?a2Y1b2VOdWluWVpQU21pUVBpTm1UcC9Bamd5b3crbDRHVERndlFqUkFNME0x?=
 =?utf-8?B?aVpJTFJEM2FUWk9sVUFIb1dqa3loZHVXRnB1ZU5WTmZpM3lxUzFBTGVhWjFV?=
 =?utf-8?B?Si9TdHdSL1BTTlY5alVjR2M0alFlTkx5YUtMdzF1VzJ0RHo0cjdPT2kzdGhs?=
 =?utf-8?B?ckgrTXdvdHpMdzN4ZDN4L0N2QzBjcFdkMTdjWEhSNStudktnS1lVUE5Dd2VX?=
 =?utf-8?B?SFllTi9CUXhCL2w5UmJSYTZVOVVpY1pFdEppL1p5emZMRjZEZlBGT1hxQUY4?=
 =?utf-8?B?YVFIMHYzMGQzVlZpTDVQcEI5bk9IbzhNMS9kVEJnUjMzeGIwcU5zNkhTV0tE?=
 =?utf-8?B?NWdURnJ1ZW9NVHZkL3lwRUxNS1lOVFZyR1hOeVgrUzVGYjdnTjJ3UUJNOVlN?=
 =?utf-8?B?Z2tNdmJXYlV0UHJpUDFPN1kwZzVWU1BWeUVKNVZwTU1KbzdINTlVcFhpU3lr?=
 =?utf-8?B?WU1OU2RiWThkUml1Y3RQRDRMYzNHazZ5NDJ3V0ViSzRNbnFVdGhlV2N2ZWk5?=
 =?utf-8?B?VW50eDBmMkMwTnBhbkFPL284WEtnb2JHMUlJU1RhUGdEVUhLQ1VXdm5LMmhW?=
 =?utf-8?B?TmtiN2I5R2dVM052WXA2QnFoV3UxNThYaVliSlhXS2ZKeTgwbmV1SUJ4Q2E5?=
 =?utf-8?B?d0xjc2VobkkyUHdtcnVqcXVobWNGSWMrRmd5bHg5WVgzM1NVV2xhaEM4UnBS?=
 =?utf-8?B?TENoUDhUR2JPQnNTbm02bkRUOTJJcTFMYnhISStJNlZ0T1NFOWFjU05jdU14?=
 =?utf-8?B?R05qQ2VmZnJtK3pzaDNlMEE5SHJrNkx4alNRT1QwS0NpbHNEeENGQ2Q5UENp?=
 =?utf-8?B?Uzk3dUFNeXFmVXdDTFBNWDYzdHJnQ1ppeVprL2NGSVVXa0NXZVl4ek1PVEcr?=
 =?utf-8?B?cjlTUlRxQklvMVM1am5Cclh3bDdsQmJMelBQajhLY2tTUUNNcGRMQUpjOUx4?=
 =?utf-8?B?TUV5aFZ2NHB4T2JySzQwSGNMeHBNVUZLcVR2QzZ2QXNmUUF4c3JjRVI5Ti9L?=
 =?utf-8?B?YU9xYnRjelQxV0d1ZGZpVk1NeGkwZUFJbDlzOXU0ZXdMeGM2Zkh0MmlMVlJh?=
 =?utf-8?B?c3h4T3BYeEhRNExmREE4YkNmVkhMZU1KTFJVSCtjT1M4a1ZjVnMzT29qbVN5?=
 =?utf-8?B?ZDkzb1ZmNUdFL0hTM010N3pRd2RlYk9tdC8wb2gzMW5HYk0wTGxBcUowSkRm?=
 =?utf-8?B?cFQ0L2NFZUJibVZhUCtrRXZRN2twTTd0MlVjNWhNLzF4VTY1NWxSN04wVUFK?=
 =?utf-8?B?QzdEREY1OE5rSTB6TG5aM2k1NWpjcWtPQ1BjbTZLeVVCenRrVGw3aVo0MHVo?=
 =?utf-8?B?V1crMFpjSHJUVXVQRkdkdi8zeWVNMVpsVFExcHUyTU1XdDlacXNLcnpkNnNR?=
 =?utf-8?B?UFJIYlQ5SHYzSjVtTHpJbm1zS1hZMlBsVGQrYk9tNjZvczZ3VW56TzB2YUxX?=
 =?utf-8?B?VWgxVi9Cck54cU05Mis0VXF2K0l2SWFTUmozM1JUOEpkK0RwcldxaW0rWjQ1?=
 =?utf-8?B?U2R6RDFlNmhWSG9FblRzMmlnM0xEaThRaGp5UnpVeEV5NTQ1UmZqK2hUYXBn?=
 =?utf-8?B?TjI2Qm10YnNxanE3YVovNERhcXcxOTdnTnR6WnhTZmtZa3kxSkpjR29TWElx?=
 =?utf-8?B?d0lKdG5vOXNZVXRiTFR1N2E2WjZzS2k3dUVPS2pWZmFhMkdlYm55VHo3MnpD?=
 =?utf-8?B?QzhYQW9kMnNpOUh3ODdKRWZ2U0Z0SGtYTjdOcHUrYTF0Z1VPSXQ5RXB6YitH?=
 =?utf-8?B?cXFkNU1BUFRuckxDYjI5OGNHeTZPeGdRRUxJK0RLcDVaQm93VjBHbmZUQ3Jo?=
 =?utf-8?B?MzB0dm9NdmE0cUVIakVSSWdOOUp5K1A5eWJUNk5JMVlKNEsrU281akU2aDl4?=
 =?utf-8?B?Skh4dldWY0FJRnd3WFhkV0tiWUxaV2RWc3BGVjU3OW5RbHNMaGlZWUpkS0lp?=
 =?utf-8?B?UGVYM3lkL1RKandWQkZGWVhKcjlHNDU5WWJ3ajN4YWFTbFR5WDRJT3FkK2tQ?=
 =?utf-8?B?dE1OaCs3OGRvY2FYeGR2OVhHT0RZRlVvN25xaUY5d01kQW5yS0NCdUNXakdX?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 913ab8a7-b469-48b0-90c4-08dcad87b695
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:29:17.7976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq9pHutxtbmgDgEDXuxgltFQZb24YKFSfsx9zxRgUHX3adCz2GOjG4zTjf3U0gUH35pUGyfGJinRYtWtBnLERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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

Quoting Lucas De Marchi (2024-07-26 03:43:32-03:00)
>The RTP tests check both the result of processing the RTP entries and
>the outcome saved as SR entries. Rename "count" to be explicit about
>what's being counted.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 32 +++++++++++++-------------
> 1 file changed, 16 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index f217445c246a..5ebaed1af3f2 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -36,7 +36,7 @@ struct rtp_test_case {
>         struct xe_reg expected_reg;
>         u32 expected_set_bits;
>         u32 expected_clr_bits;
>-        unsigned long expected_count;
>+        unsigned long expected_count_sr_entries;
>         unsigned int expected_sr_errors;
>         const struct xe_rtp_entry_sr *entries;
> };
>@@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0) | REG_BIT(1),
>                 .expected_clr_bits =3D REG_BIT(0) | REG_BIT(1),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 /* Different bits on the same register: create a single e=
ntry */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -76,7 +76,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 /* Don't coalesce second entry since rules don't match */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -95,7 +95,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(=
2),
>                 .expected_clr_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(=
2),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("first"),
>                           XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no=
)),
>@@ -121,7 +121,7 @@ static const struct rtp_test_case cases[] =3D {
>         {
>                 .name =3D "match-or-xfail",
>                 .expected_reg =3D REGULAR_REG1,
>-                .expected_count =3D 0,
>+                .expected_count_sr_entries =3D 0,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("leading-or"),
>                           XE_RTP_RULES(OR, FUNC(match_yes)),
>@@ -148,7 +148,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 /* Don't coalesce second entry due to one of the rules */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -167,7 +167,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 2,
>+                .expected_count_sr_entries =3D 2,
>                 /* Same bits on different registers are not coalesced */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -186,7 +186,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(1) | REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 /* Check clr vs set actions on different bits */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -207,7 +207,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D TEMP_FIELD,
>                 .expected_clr_bits =3D TEMP_MASK,
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 /* Check FIELD_SET works */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -225,7 +225,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -245,7 +245,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -265,7 +265,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>-                .expected_count =3D 1,
>+                .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 2,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("basic-1"),
>@@ -295,7 +295,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>         struct xe_reg_sr *reg_sr =3D &gt->reg_sr;
>         const struct xe_reg_sr_entry *sre, *sr_entry =3D NULL;
>         struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(=
gt);
>-        unsigned long idx, count =3D 0;
>+        unsigned long idx, count_sr_entries =3D 0;
>=20
>         xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
>         xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>@@ -304,11 +304,11 @@ static void xe_rtp_process_tests(struct kunit *test)
>                 if (idx =3D=3D param->expected_reg.addr)
>                         sr_entry =3D sre;
>=20
>-                count++;
>+                count_sr_entries++;
>         }
>=20
>-        KUNIT_EXPECT_EQ(test, count, param->expected_count);
>-        if (count) {
>+        KUNIT_EXPECT_EQ(test, count_sr_entries, param->expected_count_sr_=
entries);
>+        if (count_sr_entries) {
>                 KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected=
_clr_bits);
>                 KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected=
_set_bits);
>                 KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_=
reg.raw);
>--=20
>2.43.0
>
