Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B606C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3394210E2C9;
	Wed, 22 Jul 2026 13:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxxYKGUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC110E2C9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784726989; x=1816262989;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9jUYmlw/5nkmXmmdfE6KbUZEOSZJog9fsVbCp09sdQU=;
 b=jxxYKGUkl32YWG92cb3p7K6YV4iUeHgOLWtIwYAvae6GweOQIPfh+M+F
 M2P/vyTkti/n9T3CtHge5gauFrTqiTSyF/CpUdLks1Os8U1cc/gg5jOf1
 1JQCCqaMseU7ANi/iZ9zbIeGVoEIAXCXvPat6JyEKgCRZKCQ6k/NKen6J
 NxBjz4gP+cKAO0zyuUSmOOMKzi3Oel88HKXInyfPunxrLodefRAjmeq3T
 wjoGsRT3yse2BPmDczX4Eqf/ljrz3ygsJzqoNQOlUyQKqO9rvaTrYf6NP
 6iu9LoPPkVDI6iCWJfczHW69mYDwOCJ9yva67jug4/MYoSg4dtIpT5F8a A==;
X-CSE-ConnectionGUID: SzgiwZKOTpWJUhR+gepoiQ==
X-CSE-MsgGUID: 1R128lc6R+OLh1zYzKlUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96017313"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96017313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:29:49 -0700
X-CSE-ConnectionGUID: rcVVwguuQjuFwQaqj/QNMA==
X-CSE-MsgGUID: hwzVYvqZRByTI/rZf2pE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254688338"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:29:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 06:29:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 06:29:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 06:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKWXcziAD/u9btyQHST/DssV6dRYEGSwNGfic2dY5u3CSnZKacL5D+Y2RRL9usA4oaBLCoF8gxQaXQf3GBz0QJt0PlqeyWhMnK+QGUCldtsbppsf0qxpjQadnnr1Xf+jRQzgREZOwvoDJbtYArsrIQsG1Rsb/fgpLCnPCW3cbwz0ed7BpgbqVBaeAvFwdw1NqII8WCQ1kEd9PKNinOdhz6YL7vVfN0bzcdU4Vv7+86fYQ5f1v8qJaHeA3P5x9RahRCVVt5K954dPRfavwpF8f51nykfmvkEAsPBSXMtgK/EBffALN5Yd++nXwvemy/JGkKFOLpllgvlesQQXiKDXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6dlAYimkWElrp5+/2IHNKY4+EYg3TAwSt6EQ//oB9k=;
 b=pLmjPE5fy4XOrwQlLbCGwB71ApAD2lRhQImV4EofejD4LcdCK2ABaALpwn2nBCdRyh0ssaoZ8rC83sXr888Qe9dJeMg1kPa4LywZfglUVTlAJFOrxlQOhtU0jT2KrW67b+9z10lbcQIfTBOiXjgEWS/jEdiIUlMe+z6G6vWCcrOAJCMfswgb/p7rhfEf4MX3QHVLJIowYRXqRkaToxlAHs3/HWXMJfnFObotZYYEuNm/Vzmu01iBT/U2mQWxy12fjuaWw+DyxcAwzEDrn0q7DjQEai57G2Zvq0rLuN1hJEgWGOhopFN9KfZb+0FKEbUBACmjCgx4VEjpfIkzFSIDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:29:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:29:41 +0000
Message-ID: <787f1cc1-2878-448b-a3bc-218557c0d8dd@intel.com>
Date: Wed, 22 Jul 2026 15:29:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
 <20260722123342.339623-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260722123342.339623-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0053.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cd7d40-85b0-495f-fb88-08dee7f54914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BbiCnaYR1qqGlV7JfVh092qxHrhNl5Uc2b7rXc6UEDQa9LYC7ZWQkTeU9Mig4X8+FUQIwx9zpmOkIOS6FPR5LxJE1NTVc/DEUy8ZjTod973hDo8UTGH79zNCzirxi2wvK8iHphfjRGP3nxvhe0PBsW1aMVOClt1YssJIXisLYmx6okXRN/trh0446OrEMJqp6LIvJxcNxSzAIF0KmVK6K0gFr9ragTAWxKyOwLvIHj1kWQEvQ/wiKiJc+h3DkQ51RfBijRC7H3jLiaODFZtAFN9KAm/0P4O4HZZ2AubJwsNqOHRa8XnAfT+Z0hbobRxzfLMH7wzg3J1yuFYthlo+6xr+2AWuHHfb/wL3LSbXcVLug9NSeCsoVV6aEVYPrB5+FTwPTn27NMFMyAU5KMvCJofxVXizVb03y+50Lpjt71oOhWzROWioIDrY114pcNJNO+m55QmbB1+gELPUt/PWE0Dsjt1CAOBycpyO5i6UmDkm65kLLydTsrQBo3nmuGfakUyrzFwft5KjkBe/C6+Hx1NuHCuvebRER/q+OO+Cn2GWWH7t3dmQI1thPyRLaVF0Eg84MumR6MO0v56FpVm3HV0plKa3zji6QW/dRZH5RgyFDNPyutNtdCiu6658+mlA3is8i8GrO4fxRZRTGoGh3dMB3FVhOEgMpctG/3FoVys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2tVdCtwYnUzdENiSm40ZUdadnFKNEtvQUk3ajJLSDNJT3poNUVJNTBaaWpS?=
 =?utf-8?B?VUhVTDkwTlFmWlU4aytQcUJXMS9mdUo0S1hrNjVrTHBZUjdVNWZlWUxBZy85?=
 =?utf-8?B?bTZ2YlliUG1vdDFhR1JlVk1DWndQS1Q1RlhOUUFuZXpBTHRtQjlIWnAzbVpQ?=
 =?utf-8?B?akFLNHdtYUhKTTMrRGE0TjlJYktxSlJYU1ljclUxdm96RXJrT1YzZjRqd3dI?=
 =?utf-8?B?MVBhV3hJcGt2bTVadzk3ZXlpQUlrVytDOUpWMHZoQ3czdFhzOHFlRmxPRDNB?=
 =?utf-8?B?cGZTdTVDR21VTkNFQlBueGlXcldnejA0T3N4eGl6VDhDQWkyRWF1WUFVc3ZT?=
 =?utf-8?B?V0Z1WFdoVmQzd2RKb1lCQkU0SkdYVENMWm96M3drckJkaVNuVzVCYnI2dnRP?=
 =?utf-8?B?cXp6RVRUUVM0M1A2UWh1N3YvZTJZUExmYnR3VWNzaFowcTdTbDJuelBpQW1Z?=
 =?utf-8?B?eng5YWRKVVRwYmU0aE1YdGFqUWlYelRNOVBoRXdmSWxUUk1NMXgwaWRQeTYv?=
 =?utf-8?B?UTdCWmFSbkQ3aHNhQmJhWUxnN0dyd3dudzM2RGloVm0vV2FjYTg0Y1FiRjc0?=
 =?utf-8?B?VllTUDR4UzUzZldPcHZTVHNBb3hoaGlHSzhLMSt1T2I4UEZ4MnA0WWVRNGxK?=
 =?utf-8?B?Ykh1WE04Y01IaUFRSzZvZ3VaOG1iOWFXZTh2N0plc09qTUErWE1ZM0ZaTGxp?=
 =?utf-8?B?Qk90NFhXbkN6ajRUSGt3bUVOMmUxekM0S3pFMGdMdFpQeDdEZ1NMNU95LzZN?=
 =?utf-8?B?R3pRSmQzYmhRaXRaVEorQkxhZTlXMHBaL1Y0bDIrZkpQMy9KRE5xQ2xISERS?=
 =?utf-8?B?ekRmRzdXalpsWDdnMXQzV1JtcGlXaDIra05qOGtQbWVSZllMdHh1TW1XQU9I?=
 =?utf-8?B?MmVkdHl0V2RGVnZneVU0T3VDYkxMMFBEV3dWdEdIeDQ0UTI3UTdpZ0grVStC?=
 =?utf-8?B?a3hlTzRwN0JWNXhGM1pEclMvSmhmMEVqRURxMzRlb0pOS1daS0kwUXYwbSsy?=
 =?utf-8?B?b0ZTM2RaZmRlanJKNU5pTXJRdGQzc2dQa3l0Z2xKeWNBNWtMVUF2MzBnbHpQ?=
 =?utf-8?B?Q0JCUDIxZkRjMUpZbkxQaUVrWG1jdzR6d2NxMGE4OGZlU2xuOW1LSEhLL2Ja?=
 =?utf-8?B?Y1A1VVZxajdkMUw2bmR6NTR6cHlJNXNDeVNoNWRtRUszOENydWY5ZE5kRDlv?=
 =?utf-8?B?eFJ4ZWV5TnRrVjVBY0RCWldFM0d2S01pNnhvd2YzS0hTcjJDWHBLbTVCZVJh?=
 =?utf-8?B?T1VUYkVyWTlFUkpuVjBrbzdlMzMzY0prcnYzZXZ4Ni9CSVl6ZFNjWjI0Y1VK?=
 =?utf-8?B?M2E2eWxBT1dCTXlNRE1GejFHRy9ZcjE0N3pHNk4ybnpIQm10dlJyM3hrYXo5?=
 =?utf-8?B?ME5KNnhqdExtSnduVGsvWXloSE5VZlNBYlE5RWdmN1dLelh0aUtja0ZjVG1o?=
 =?utf-8?B?Q2NMWEhhdE5KVFJSaWdDaEVFY0VvOE5IbFR2V3lQRFQyQlVTblNFRnBzZXRv?=
 =?utf-8?B?NVJkOSsrYVRYS2J2MGJrNS90YXJ6bDFsZkYvdkc0VktBRVJtT1AzLzdrVGp1?=
 =?utf-8?B?Yk1QbmJ6MzkvSWRmajZKazJ3UFhGWG9YUjdMWnZzWjJrMkJDZ3Z1SEk4MVlG?=
 =?utf-8?B?eUFJMGgvQzVGbHJ4Ui9HSWk5dlRCc21DemlOc0JwNytPWEhtODlSMnhmUnZn?=
 =?utf-8?B?MlZwYUNRV3hENWhuWk9UZXpzTCt4WitWTStML29GekdvZ1RHdFRmSVN3YVZp?=
 =?utf-8?B?bEt6TCt6aFdJd2tjVlR4LzJQSkFXcndZdldXOTlZV0tiYlNCQm8vNXhobE5R?=
 =?utf-8?B?ZXVidTQwY3VYcHVQVm53WjdOV0FKM1JkOUwvN2MzUExaMWs1QnlQdHRKQ3pH?=
 =?utf-8?B?a2RBRlJZUGdrOURDdnU3ZVFQMHpRTGlDRFhkN2ptRkxjcFlYc3VSZVRQMHpW?=
 =?utf-8?B?Q1czbWpIcHBpRVZSV2JlcDdJRVdLMStOSFVuMUMwU1N4ZVFtTmIzb05ieVda?=
 =?utf-8?B?RlpDVDRxZlVuKzBLQ1pCRVRIS0N6bE44aFpiSDlMY3hyWW1oMHR4R2tQWXJS?=
 =?utf-8?B?TlhRK1Q2Sm5YdUthYVJBSHc5YU93K1h6a0Q2Q3FHTDhjdzdDUFlUZi9pVEFs?=
 =?utf-8?B?TFlmSDNPSk8ydU9PVU9XS2hEWVpjKzFIR25rQUoxeVJZdElZV2RxMTN4Z1Nt?=
 =?utf-8?B?aklGYWlQaHdDam1WUWUwMEx2SXdEVWhrU2Qrd2J5WlJ2YWFncld3cG90VFFV?=
 =?utf-8?B?Zi9XWnN0RnFhS21KL3BxT09jeTYrVjFPOHU2K2s4YkRlci8vT3FuMzBXV29q?=
 =?utf-8?B?enpsUHlMYmY0QWVVVlZSNlRQY3Z2TldoWStPS0FjWTUvUXlJOTlMYW00ejVO?=
 =?utf-8?Q?XLFAnVBjJOBbyT6k=3D?=
X-Exchange-RoutingPolicyChecked: bkIScAa7m53iGdBiZLzB923+T8sHiRYhAVDF0BNJ9bio7wYtNfzQI2vo9s8DS8AWPLugZ6WBGN+hFyDOjHKjbmXWotZMqqI2G4rk8W7u5NjVxY4md8N5LPPiDt1HhOwj03tccLtROEMA7F/wYT/CMsRr0bDslNJ+XmFmHY3u/EppnFwrnWtitAbMoHuf92fjcMeHPBrMXOdC/4VJZn7qj2QwHJ9ahkSKjOVzcenbdEeRfyoPM/fFV2yutNETyXri1LuR6LeAXcKtWaX8+dVTqINHGA8ec8dW+Iuc92/H/7Qq2n0+zBiAphqkqf0Y47USH0G6mg1NwBZCN7J3RysJWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cd7d40-85b0-495f-fb88-08dee7f54914
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:29:41.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnCDOv/g30RHTrqwOQ4lM/qV0XRaKOPDn3E/XCktGHJriLGIgbXg9/0UhXXWpNqGPLc6vdxNUg6Gd9yv5NtcYaUTfFZ0h8uvkKiIO0Qezbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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



On 7/22/2026 2:33 PM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, LMEM, or GGTT assignment.

and VRAM ?

> 
> Add KUnit test cases that use the guc_action_query_single_klv() static
> stub to inject bad KLV responses and verify that VF can return a negative

response (as a message) is still valid, just the returned data might be not valid

> error code rather than silently accepting the invalid configuration.
> 
> The following error scenarios are covered per resource:
> 
>   Contexts : zero, less-by-4K, invalid , one, more-by-4K
>   Doorbells: zero, less-by-32, invalid , one, more-by-32
>   LMEM     : zero, less-by-32M, invalid , one-GB, more-by-1G
>   GGTT     : zero size, size-less-by-4K, size-invalid

not true anymore ?

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 268 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 272 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..a5c3b04c97c8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2025-2026 Intel Corporation

just 2026?

> + */
> +
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_vram_types.h"
> +#include "xe_sriov_pf_helpers.h"

this is a VF test, do we need any PF helpers here?

> +
> +#define TEST_VRAM       0x80000000ull   /* random size that works on 32-bit */

is this used?

> +#define TEST_GGTT_SIZE  SZ_2G
> +
> +enum vf_test_case_type {
> +	NO_RESOURCE,
> +	OVERFLOW_RESOURCE,
> +	LOST_RESOURCE,
> +	REDUCED_RESOURCE,
> +	INCREASED_RESOURCE,
> +};
> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	int type;

in general you should use enum here
but maybe we can drop this field ?
> +	const char *name;
> +} vf_ctx_testcase[] = {
> +	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
> +	{10,		65536,		-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},

no need to set .orig here
and for .query maybe it's better to use GUC_ID_MAX + 1 ?

> +	{1024,		0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
> +	{1024,		512,		-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
> +	{1024,		2048,		-EREMCHG,	INCREASED_RESOURCE,	"increased",	},

maybe we can define "good" configuration

#define TEST_CTXS	1024

and then define test case as:

	.orig = TEST_CTXS
	.query = TEST_CTXS + 1 or TEST_CTXS - 1

> +}, vf_db_testcase[] = {
> +	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
> +	{10,		256,		-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
> +	{128,		0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
> +	{128,		64,		-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
> +	{128,		255,		-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
> +}, vf_vram_testcase[] = {
> +	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
> +	{0,		0x80000000,	-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
> +	{0x7a800000,	0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
> +	{0x7a800000,	0x78000000,	-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
> +	{0x7a800000,	0x7c800000,	-EREMCHG,	INCREASED_RESOURCE,	"increased",	},

for VRAM, shouldn't we have u64 params?
> +}, vf_ggtt_size_testcase[] = {
> +	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
> +	{0,		0x90000000,	-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
> +	{0x80000000,	0x1000,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
> +	{0x80000000,	0x7c000000,	-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
> +	{0x70000000,	0x74000000,	-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
> +}, vf_ggtt_start_testcase[] = {
> +	{0xdeadbeef,	0,		-ENODATA,	NO_RESOURCE,		"none",		},

GGTT is more trickier, as we should compare config using pair { start, size }
maybe use another config type ?

> +};
> +
> +static void vf_testcase_desc(struct config *c, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
> +}
> +
> +KUNIT_ARRAY_PARAM(vf_ctx_testcase, vf_ctx_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_db_testcase, vf_db_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_vram_testcase, vf_vram_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_ggtt_size_testcase, vf_ggtt_size_testcase, vf_testcase_desc);
> +KUNIT_ARRAY_PARAM(vf_ggtt_start_testcase, vf_ggtt_start_testcase, vf_testcase_desc);
> +
> +static int guc_action_query_single_klv_stub_ctx(struct xe_guc *guc, u32 key,
> +						u32 *value, u32 value_len)

do we really need _ctx variant of the stub?

> +{

	struct kunit *test = kunit_get_current_test();

> +	struct xe_gt *gt = guc_to_gt(guc);

shouldn't be needed

> +	const struct config *c = kunit_get_current_test()->param_value;

	const struct config *c = test->param_value;

> +
> +	if (key == GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY) {
> +		*value = gt->sriov.vf.self_config.num_dbs;
> +		return 0;
> +	}

this is likely a leftover before introducing patch 2/3

> +
> +	*value = c->query;
> +	if (*value > GUC_ID_MAX)
> +		return -EINVAL;

generic guc_action_stub shouldn't be doing any data validation
we want to test whether the real code handles out-of-range correctly

> +
> +	return 0;
> +}
> +
> +static void ctx_1vf(struct kunit *test)

what's the meaning of "1vf" ? maybe just

	static void test_ctx_config(struct kunit *test)

> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub_ctx);
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	gt->sriov.vf.self_config.num_dbs = 128;

not needed after patch 2/3 ?

> +	KUNIT_EXPECT_EQ(test, vf_get_ctx_submission_cfg(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv_stub_db(struct xe_guc *guc, u32 key,
> +					       u32 *value, u32 value_len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	const struct config *c = kunit_get_current_test()->param_value;
> +
> +	if (key == GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY) {
> +		*value = gt->sriov.vf.self_config.num_ctxs;
> +		return 0;
> +	}
> +
> +	*value = c->query;
> +	if (*value >= GUC_NUM_DOORBELLS)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void db_1vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub_db);
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	gt->sriov.vf.self_config.num_ctxs = SZ_32K;
> +	KUNIT_EXPECT_EQ(test, vf_get_db_submission_cfg(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv_stub_vram(struct xe_guc *guc, u32 key,
> +						 u32 *value, u32 value_len)
> +{
> +	const struct config *c = kunit_get_current_test()->param_value;
> +
> +	if (key != GUC_KLV_VF_CFG_LMEM_SIZE_KEY || c->query >= TEST_VRAM)
> +		return -EINVAL;
> +
> +	*value = c->query;
> +
> +	return 0;
> +}
> +
> +static void vram_1vf(struct kunit *test)
> +{
> +	const struct config *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub_vram);
> +
> +	xe->tiles[0].sriov.vf.self_config.lmem_size = c->orig;
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv_stub_ggtt_size(struct xe_guc *guc, u32 key,
> +						      u32 *value, u32 value_len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	const struct config *c = kunit_get_current_test()->param_value;
> +
> +	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		*value = xe->tiles[0].sriov.vf.self_config.ggtt_base;
> +		return 0;
> +	}
> +
> +	*value = c->query;
> +	if (*value >= TEST_GGTT_SIZE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void ggtt_size_1vf(struct kunit *test)
> +{
> +	const struct config *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub_ggtt_size);
> +
> +	xe->tiles[0].sriov.vf.self_config.ggtt_size = c->orig;
> +	xe->tiles[0].sriov.vf.self_config.ggtt_base = 0xdeadbeef;
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static int guc_action_query_single_klv_stub_ggtt_start(struct xe_guc *guc, u32 key,
> +						       u32 *value, u32 value_len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	const struct config *c = kunit_get_current_test()->param_value;
> +
> +	if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
> +		*value = xe->tiles[0].sriov.vf.self_config.ggtt_size;
> +		return 0;
> +	}
> +
> +	*value = c->query;
> +	if (!(*value))
> +		return -ENODATA;
> +
> +	return 0;
> +}
> +
> +static void ggtt_start_1vf(struct kunit *test)
> +{
> +	const struct config *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	kunit_activate_static_stub(test, guc_action_query_single_klv,
> +				   guc_action_query_single_klv_stub_ggtt_start);
> +
> +	xe->tiles[0].sriov.vf.self_config.ggtt_base = c->orig;
> +	xe->tiles[0].sriov.vf.self_config.ggtt_size = TEST_GGTT_SIZE;
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_vram_region *vram;
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	/* pretend it has some VRAM */
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);

unused vram ?

> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(ctx_1vf, vf_ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(db_1vf, vf_db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(vram_1vf, vf_vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(ggtt_size_1vf, vf_ggtt_size_testcase_gen_params),
> +	KUNIT_CASE_PARAM(ggtt_start_1vf, vf_ggtt_start_testcase_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 027c5a5f0748..8834483286a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1657,3 +1657,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

