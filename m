Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0886C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 11:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C90810E051;
	Thu, 13 Aug 2026 11:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht24Rs1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34310E051
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786618913; x=1818154913;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u9BccJNxrXhXJpEDatO8qu1deGeDPIH47xDw76DkSo4=;
 b=Ht24Rs1au5+nv1sMMJIs21Jp/bUyRgAKF/RIrMTqa+iXhZc0gxwulCCF
 LwJXriHFDxvp39HF3pbbzqAhm/VmkLgY87sSQmKbeHOqBCDXu3qDIC3Oa
 /TXKcW8NNGUFM+91rfHCvXLU3h6uoZlqGfMuuiHX8UmmpsJud/fMWLLJ2
 JXLW1ybEPt/19lhhNxBCh9nVMREepWjclAwVrhPOx8YVM4E4QOCUK4YZP
 las6cjGxcN7Vk9Shxj6q0LQTMKzgvZdbhI4k53EiwbErgX+mj84USEnKk
 NUS1hcQzQvNwdeiO987axP93pykbRPulnkrVwU8DlRfN6ThBOQp2rQD4s Q==;
X-CSE-ConnectionGUID: XsYKPD3yQ6mAbOnd2KcyLQ==
X-CSE-MsgGUID: qvLJkYN1QWKbJzjpbu4JVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89709908"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="89709908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:01:52 -0700
X-CSE-ConnectionGUID: Xqug9rYyRD+c6XoKUJjpcg==
X-CSE-MsgGUID: dQxaAu6PREqPHntu94y21A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="287346812"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:01:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:01:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 04:01:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcdF2drWEugk6onm7OKd065VrlPrucRD+3YfVBIhp+i+R3Q8L7Blvnvj9KG8oxlrc5bF2rk9JDnNHvZ7xvFEtlHYvoR/FPjKzuWiZATjUJUua36N1dk0M64cRp5mRg68apLJNGQ9FF5fJUzI6DgyvfTmeRuLpkDxbEUqm0xTPayd5bdIqYWl04qSAwOqaXkZtIyvkuDQXKKDePtBmchUd27cyHo99uzxQFVknBH63WOqg0IuygdqSbzzwvhvg4Rh+QftSz71OMYqMDr4qkOGFQ0Q/srSlAD663zuwmtnnB232tl7LsSeIcitulqw2aeSIvW/yO6koiP5XM+D+/zLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9uiQJhWL1LjktNxapgZ45WLthmeZAa/fo/17ZRWmCI=;
 b=Oep3v8TgGnkmnclVvH2F5lx+f3khLvUK9HUhgN+xyL7BAlVkTXenyktru14ZUKCn93aGwtuNUAc7ORGKU4Jqw2IIYIkfEyTok/AgC0CIqKBApFROeFmj+dnyXcrjQzMPSF84hiaaJausZ2+NLtxaTTboBG8QysfkIZlA9ocga4IoCOy6H/K6hXrSCAZfwEdyKRNTQ4V3nNXBVQwbWkZGXV5QLa9jKzPT83bSyAzSFjS7qeEH7GW25RjwWwnDI64H7s5E0pbIwgllh3eGYuMooaDfhDHijt6DZ3QlXeQ7n3I8gVoeBHDp0+LMUIYKtyEzmf6qqfvR7zaZ5TEZXZiLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 11:01:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 11:01:43 +0000
Message-ID: <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
Date: Thu, 13 Aug 2026 13:01:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008A5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::64a) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: f401b073-b60e-4e0f-90b0-08def92a422f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cu0B/4mE1g8Xq3B5xLetpA23FCFH5ux79/2u4Un/HMJhaeb9yuB4IWI6lfMKtP6jNqTDDzQyfC+EkSr2uUuXUGsoiJdkLgltslJ02Pzo4SvpmT/gKX/2j/n8b1TtJoZ5M0Hi561wHofxSwLwG2AgAHoRuKxCxgCKV9trcKTTKlDdXPVemwffDO0qTYayFqa9lmLTy5z74y9NSO7qxU7Cn5sRrXu7C42kuWQTB4+4kNcJW7WkGP5QWAN/P9pE1O7xpQ0zyIepIYNKA8jvz9PmVXDW8QAZoDN1yxrrTVQfqqWzVwcm8ynTgoiqDONYuMcAZJZLd4Nnl70WrXIxO80vSscFWiX9xRo12EbJqMxJQXAVroBczitLPvBhFonVUi2RHPURjXAaPf3fzi81F8g7HvT1KVkiOSD37LrDQ7mES5kwBsYvzqfZUPC+GGQ5OT2EpxRKybvf35hsgeF+pIYmWASdWJlVGxJMaEW3WRTH/OYw4VBdW2TyIc66YsaoMj71raAhyIRH/CUEjxs91dBd+g/oh1xukPHa/ySJrDbLRoJsdBX+Vln3a2aQPUXKDSp94CfXp6Y8JOCKETy8BO23I6BCmRRC5MVwX0dZMuOZcQImT6EQBFvF4gPmm2gK6ORGCfjJle5V8HCjnEW7TbLJDo6XfmTfX+0duyvWEw1ARME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2ZkWmFzMTYvczRwQ3dOQjRrSkpibWdZbmxCODY4a1NKcmlrMUtMUXpvNTZR?=
 =?utf-8?B?V1JNU216N3p0S3dlSWZ6VW44RThMTFUyOWRXWmtDcEFUY1NJVllMSzFhK29j?=
 =?utf-8?B?UnlyaU51OVRMWGpaRnBET2k0QVpEdXNRZmFGd1pEZWpnVnRPRk5rSVM2MUdt?=
 =?utf-8?B?eWd3QTduQUxnSE5tVmdZZFVsdEZGUEVnV1VQcVZCTHc0WDdWbk9PbzI2Uldi?=
 =?utf-8?B?R3ZpNDNtLzFaZVczMS9xbEpOWURzdFIyUTcraXg3WWYyN2lLZzVxY3h2blk2?=
 =?utf-8?B?SXNmblFiV1JSSysySzROcGN0NDNHZnZZTWJ6QThuYml5MGdnN1VnSlAzaC80?=
 =?utf-8?B?Znk0QnlJMGFsWkpvS0FJdDRCZk5SNmg5SE44dDZCVWczeEdWRllmeDE0WDJv?=
 =?utf-8?B?Qzh6alhnVG4xRFduUVY1bXJyK1FQOUZtdGpkTndwblpzdjZkWGtTVzRSeFc1?=
 =?utf-8?B?OGZZTHVUT2EvMzJ3ZWZPNjZsL2QrNGlpM20waEcwMmVOTE8vdWF3V2ROYjYw?=
 =?utf-8?B?eS9paFRjbVZNSkZhRGhXSmM0clM5ZHluTnkvTTRqaHF6WXB4OW9ibzJ5enQz?=
 =?utf-8?B?TTB2bG80TGh1dVhHK0Y1TDZFK0Z4TS9hZmNVVHdsbmhMOU4vWDA4emZaK00z?=
 =?utf-8?B?a242cDlScHpWR2dUWlpRYVJYcXdyT1UvRlNzaUIxNTFvM0tITkthSFRlN3BG?=
 =?utf-8?B?LzJmeUEvUXBEWmI4eDNqTkNxT0lnWUF0QjVEeXAyWFlXNEYyRWY1Z3pXMHRm?=
 =?utf-8?B?WURZcnQrTVBva2l5cGJPVEY3cmd2UHhLT1plMC9BeFdFbXNtTFBBQWgybWRw?=
 =?utf-8?B?bDR4UnRjYkZ3WjRKa3p0V002ZWlWWVpubktaQVB6WStRdlVRb1ZYbnVhS3VT?=
 =?utf-8?B?Y0ZVWUxFT0RQK3ZRRTc5UWdERUdkRFc0Sm9JczZWN2hPS0xKei9sTXE1S1Ew?=
 =?utf-8?B?QUdUMldyMDdRV3pwN2RJME41MWxHWWREQXJ4UVNwMlB3TWRZRTVndDRrN09q?=
 =?utf-8?B?K0lGd1J6cWtjMHV6c0ZOSG9YdWtnNWRmNmtxNGt0UzN1OEF5ajhmOVdFaThj?=
 =?utf-8?B?RWRUSTJxelJtemNmck12bUlSZzd2N1NXY2t4RzJhUW1qK1dYd1A1QnRzaXJY?=
 =?utf-8?B?Mk94TkRDSi91M1BaamltaytnemNhNnNiWDNubTRXSkpDcGZPZjZHZDRwU0No?=
 =?utf-8?B?NFZhRVVpSG5DUjVZNk16MXRZczNKRFE2UFRGYVhhYUdzbXAyZHlaUnllOTV4?=
 =?utf-8?B?NEphQzZRWVhMSkZZMm9KdERJbnVyWmh2L2J1RGl1ZUVTUGh6THNzYS91dmFK?=
 =?utf-8?B?RWMxYkJjRnVJTlhhRmVyZVVGWXJTbXdCbTFBZmRlaDdlNTdSbDRSQkdheXRu?=
 =?utf-8?B?bmNIenhLN2Fxb3ljREllbkdaSk5XaEYzdzI0WHZZRHhlUExHRW1MSk1BTWlC?=
 =?utf-8?B?RG1XQ01TTnN0K0NoOXpPTjF3ay9NRkNkaFZVaUxnQnBENmRHeVg0MzFFRUJl?=
 =?utf-8?B?c3h5WFFHdEhKckhFdWM5U2xOVHZRQkg5MlU1RjhrWFlnQWk5MHcvTFpUWkxp?=
 =?utf-8?B?ZVZkOFd4MmNodFdaZDA1ejBDZnE5emg5VnRaZmt4TGZpREdDcnhrbFRVaHVt?=
 =?utf-8?B?a2lZL0FhSVhPbXI4bUQ0aXQrUzA4VjNyMDBlTFI5dUJld1VTZWJjNnQxb0NS?=
 =?utf-8?B?SEtSTjFUMVg3Rk9TRkZOQyszV3VnTW5MblkxVzdoczY5TkJFNG81OVQ5Q0lv?=
 =?utf-8?B?OVNQblZoTUo2emhzMU03NHN0eFRROEh5bEY3S3dnYXJ0MXhqcGFLR3ZHTTBm?=
 =?utf-8?B?WkNRQ2NxSkkrelZDUE41UkI2bTd6dWdyU2NMNkZkRTZ4cU53VTlFUTh6dXF5?=
 =?utf-8?B?OFg0ZjQzYXd2L2I3YVhTYUlNL0kvek9iMmdlSEtSQTRwcmpHeVFaUEtDUVNq?=
 =?utf-8?B?L1dIY0FOaVBYeDRTSXF0ZEplVUg0STVhaWttWmdvYzZtMVd1MllkOVBCMUdV?=
 =?utf-8?B?YjJldENkeTJaNktDNjRlaS95cDFkckVSdGlDRlI3N2N5bmV4c3NLSC84RlBp?=
 =?utf-8?B?R25kK3U4aTZqbmczcGZxaVhzKzRhMHdLZ0JNSVVJRVQ2bnlsSmdzSDdETkVD?=
 =?utf-8?B?RmZ3TFRaRmFXTjhrVkRRdFFsSlQ5RkF4MDdBcXJ6WENiN0FLZUIvRFdrUllT?=
 =?utf-8?B?eVpuQ0dTSzU0eXkwNUdod2dYYmxRUmxCLzVkS01zYXc5SkxHRisrOFhIVllM?=
 =?utf-8?B?OVJRT2tDdzdjTUJ4TnBMQTJNaTFCWHR6dnYxengwSjcrY2lMRFREVEdjZWdV?=
 =?utf-8?B?MHJtR1R3NzZjOHZURmllc3NiYzRTWTF3S1VtbWJya0NmdFV6Nk4vdVY4MzhQ?=
 =?utf-8?Q?JjZqBRgEK5ZLGKwk=3D?=
X-Exchange-RoutingPolicyChecked: SxyqavQyS/QGRcfmxdcQAKR6gM7qxwCPu7jajiYPUMTZCA8TNtIlRMrPodKX6qJH8n1TR5t5cBMiXPWUbH8brc8T6DHzleTWjvC+PJvEcG965uBpOyR9/NlVCYBPBSajoGbvRDSKZG50ClbgEBOBIi2wG30Dn1f7SDvarjYjfqjYp4K1pgcaX6BBVnaiudPJZVm+0ks+f0aZR7oOHOi7hQPjYyf5GDFOCpQgOB+3hFBmTpsB2C5n7Vgo/enaOrbW6fM1zODEsCYp941IuM1tdgGKkqxA6zEW1eQHzJohxMwXhcxyjEefeCEKKwMh3KSzkXiC6d/Ewft211zwJMsDKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f401b073-b60e-4e0f-90b0-08def92a422f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:01:43.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXGoMPXMCSggnlFZM0JsO2mqo9WXrQdCZtBchePNxAHFve5SHyJNo8CJNxif0sXnHV7GVFqsbXBFpO3oFKhen8QNh3E3DRJ8kOjvk8EqegE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
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



On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 2d8c532157fd..ebd288986c11 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>     static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   {
>> -    struct device *dev = &pdev->dev;
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>       struct xe_survivability *survivability = &xe->survivability;
>> -    int ret = 0;
>> +    int ret;
>>         ret = create_survivability_sysfs(pdev);
>>       if (ret)
>> -        return ret;
>> +        goto failed;
>>         /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>       survivability->mode = true;
>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>       if (survivability->fdo_mode) {
>>           ret = xe_nvm_init(xe);
>>           if (ret)
>> -            goto err;
>> +            goto failed;
>>       }
>>         ret = xe_i2c_probe(xe);
>>       if (ret)
>> -        goto err;
>> +        goto failed;
>>   -    dev_err(dev, "In Survivability Mode\n");
>> +    if (check_boot_failure(xe))
>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>> +                  &survivability->boot_status,
>> +                  sizeof(survivability->boot_status),
>> +                  "Boot Mode enabled!\n");
> 
> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?

you're a reviewer here ;)

but seriously, enable_boot_survivability_mode() is called from
xe_survivability_mode_boot_enable() which says:

 * Return: 0 if boot survivability mode is enabled or not requested, negative error
 * code otherwise.

so returning 0 as success code in enabling boot mode is the correct one
returning -ENXIO will be no different than failing to enter boot mode

@Riana, this is your code, can you please confirm that

> 
> After handling fatal case
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
>> +    else
>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>         return 0;
>>   -err:
>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>> +failed:
>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>>       survivability->mode = false;
>>       return ret;
>>   }

