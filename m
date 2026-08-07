Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB10BC5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 09:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4410E10E3F1;
	Fri,  7 Aug 2026 09:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agzEXQv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6D10E3F1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786096621; x=1817632621;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kuuAYnHHTCGEPESmxFlM2b5cP/SSVQu5jRvs23TYmiE=;
 b=agzEXQv/zZnNqIHfRM0jbJgRJYns7VLRw+9Qa5IXbLJOdToTn2QxszFt
 X7ULU3V9eEtHDOxGqyvwpfkvXXCdV57U2ClI+/uDkjD4wQZGgbbcIm4+t
 vB3tJTRvQZsq5D+TPWcVHLl+F0ZkvOsySiBeeog+BX9WveZtxTNPzrgjv
 FywyMCvz7Fnr8jSlJ/Pe0Zm6+F6FSzqQtR31YyqtdNSWDl5RKim+KGok2
 GKmdsM2KB2JzHRzZEctCzj7d2vzrTR97SJrHjUROpqtdqZzYNcmtugxW2
 Zp/TpQgxfMBxcpjCYiCVcmrkEj+eSPF+1jDelnZBknC1JjHXlpN5kYLjk A==;
X-CSE-ConnectionGUID: aTViDayjTH+K9s2xlaR2Ug==
X-CSE-MsgGUID: 9/aNfH/hRg+G+CrCjc01mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104103423"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="104103423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:57:01 -0700
X-CSE-ConnectionGUID: BmWbH6UmQhCLXWUByUZ1mA==
X-CSE-MsgGUID: DxjnYzAJTra3mSLtGXOr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="266593083"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:57:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 02:57:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 02:57:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 02:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovsdDI+Q/OgMMrJJX14QCcbcykaYifgCkuXMtoyTc278bXAaOlNa1C/EoL0NlVF78PB2fAWlRmoiTCHSP0G6vJy9H7R6Y41lb2cgRAx+W5+zArHFpH23CBwtHh6zgtTy1ZuOOfT4E7UgpoMPuwWruAKza5lC4+geyDjRddGx9h6uDsO5Yv0Ksm8oOCf3K2YQBgIg5XlZ0DHUO/z3V71HEV+YaAgBklK53CTjQQGgKIkqxVx/hVaZFDw0+G5j0rjKKYhC5wNNgnnZIJx/QijdFpBZ0v97zAq/kvO58lO5VE+GEoj3uM3hAoY/vBOOXa8NqaMZBu85Mk//YIEav+GSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAu7w+RFMnK8OPAh1tPsg+YDSqc1kexHqhl3xZbaQTA=;
 b=nRdpYPssngO/cYQGeV6YD1upmIO5pK9/gpncE5RgrFq0rkrFszzHAKnOI9NQbI//olJvJSAhD2g1rGEQW+8leuFpjmL6tUy1/KYEVfW14qJ9sScbucV127AS1sIJdnOOVXMnlgpiobhhYM8hBYjDeJvzmaySYb3phGJyfq6t8TrGXtA/kqcwfF/yTiUgXaVo3JswaXKXmOSbXM2bozqH43dryx/m0ueS5soL/N9yW5TlAmXqEGcU7WYKq7YKIvC/NZTxNbmlVouzR3zh8/As+2TVKeSEgaXNyrDc+ojPSpGz/ftoTLhN8ZouR5C+yFQl15dUfhbIuuBbcmj+MD3a5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 09:56:57 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 09:56:57 +0000
Message-ID: <f219c563-7703-4703-a832-28da4a8b3421@intel.com>
Date: Fri, 7 Aug 2026 15:26:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] drm/xe: Report 'device wedged' errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-18-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-18-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: dce8c377-6415-4c4c-67eb-08def46a37bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|56012099006|4143699003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: 3dV7Xi84BS7uTtoDg2S6k0L/HN55JTPGWYp0Qs1XbrwSJZEzhy9yVFICaQoYzwPETJvGIWzFO9LcCNGC3D4YF8AVGyBKBMUYIyd/R7zbMS0BHTpE+4ZVpW7xk5H0EOohtHQ/VE72bOFqVsFFqAIpPE21C3YrFa7hKFtHjfRPONPpxY9ed9CYRng9m/2FD612VI/MQqox4QLvMK+xn52rEEz+yTEy75RnpaRdcstkx//fUfZA5AJdsEoeVoalHu4yuDjL57wF3tNizZtMFKgDAkIqEyHTrP8UL73ZD7lYlhm/RTnxROoaMu1VZHD5dUOnvuTGuC44N40+BSN0y4uA2w2LdV8ckcXzTtlUeDPrz02Tx+Fj8E9PKExMYX6DYWhe7mlknq+Iv5vSKYXorfBU/pFMQVmVSsXlZBA6JlvvVDfdCUezYJigXEC2HAxg+zdx3EH/csXSraENKoFc3nU4g4UR5NtdbRjJ51V5jmQ3N+A+6XR6ltiCTduxnupcuvkRW9jwSiDNIwiYO/ibELR5ct/ng3KQ9aPZHnl1CmrCmVHIJ6sncVKTtLvTkXMM+rMei2OOH89gY2DWuB4hLnq7Mj1vrHMTi+SLPqOfEpu6ABo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWl1cUlsZC81RVVGRTk2N0VlTWlIY251VVNkeGZCVWg1YlcxcGRaeHJSb3lZ?=
 =?utf-8?B?V2dNdVVRMDVHN0Vjd0d1NTlkYTBEOXFHcWRJQ3MzODhsVmZQemVjK2trMzRz?=
 =?utf-8?B?TzNheC92TTNvQWoxVDNTdE9OclRzbFMvaVA5YUZvNklMUjM4azRKc1BOV0Vp?=
 =?utf-8?B?RGJSUCtsQXlYM0Z3RmtsWmlPbVhRcDNTcytJYzM4bkR5QThzY0VOZUlMdEQ0?=
 =?utf-8?B?VDhqWXVYVUIycDlOMWZ4dDlsTm5QNW5VbEc0Ui9yam9PMmtvaFZVUTZoeHNG?=
 =?utf-8?B?VUdBZ1hob085WDFtYi9kVzZ2YlRXUVB6WEJteVA0S0p4RElhTFY5V1F1elM0?=
 =?utf-8?B?YVlzVzRBVjRjVm0wMk9zcmRRRjNnZGpXYTRUdlplejg3RExRZk1DbGFlSmo3?=
 =?utf-8?B?WUE1b2NRcmJzdWFuakhheitlY0tsd3pYZnFhWllSdTdvVUhkc1hra3NGTEFk?=
 =?utf-8?B?aVBrMytEeHVhVDlneEZ0d2FOLzBZTzVndFdCVzMwbzI3Y3NSVFJEK255YmMr?=
 =?utf-8?B?bkZEdG1DOFk4Uk8wR0ZaQm5acE5udTk2aXgraVdtMkwzcHdsNGlKTnFzVlc4?=
 =?utf-8?B?ZmhiVDVDR0xMenl0WGNuSGxiZG9KYTRkWFc1Z2VNK25aS1dKeTg5Q3owMkJV?=
 =?utf-8?B?L01WRG1Ga0hWWmRwRGx0am41dmh5dEZoVjJHMEpCQmhpVmlpRlJrcUxZTkNs?=
 =?utf-8?B?a0VzOE5nWXRCOXNTeXhTNTUxMThVcVVOd2lucEtXeXNyaGVMaHhlUGNUVnVO?=
 =?utf-8?B?djBLeHVPSmI4NjBscVlSeWxGR0tFR0pEWC9iaWVTUWdnNHB6ckVIRHZwSUQr?=
 =?utf-8?B?TEthVFQ0SjhuN0FoaExoNFJSL2FQSTR4Qjg5RDRSeDhIaTAyaXFHcmN6alJZ?=
 =?utf-8?B?ckdLenl2d2VYbENkWmIzdzgzc3piWEZOaU9kQzVPMU91UzhlZGQvNFZMMjl0?=
 =?utf-8?B?U0Q3ZjBwcFhsazFCT1VsMk0xbzlrQUlqTHpuRkg2c3A4NHdMSys1U29kV3pG?=
 =?utf-8?B?NVNFNVZOUDEzWDBRZHVEQk1GL0JtMzRWVnMza3grMGFNWVEwMmdwOGRKNXFs?=
 =?utf-8?B?VS9aK3dNdHd2QVNTWWNYNDFYU1UvTi9FaTZudWFRWHl4S3E2MkppYXI5YnJh?=
 =?utf-8?B?bzBwY1Nyb21sWS9PUmhEMWVZM2U1dkNjSGZKdy8wWHRVbVJnbXUvSGpTaGFy?=
 =?utf-8?B?ZWJaNmU1c1lRajhWcm4ydDRUd3hjQmNnWHZaZ3FvN0hWczRlaEFZLzk4NnpP?=
 =?utf-8?B?Y0ZGd3NJdDREK3NtejJIOGY5MzRaeUVhRUI3UjdHVGhsS2IyWVdaK0c0a1FN?=
 =?utf-8?B?cHhxTy9yOE9sVElpOGRjcXhUQ1V0SHVBdjMzbk5HcFdGc1BvRGp3VlUyVnhX?=
 =?utf-8?B?R1dEb0NzR3lGZnBPcTdTMWtIY1cyVjBlUFVhTDNNNno1VWVuemMvZmU0Qmt3?=
 =?utf-8?B?SnhxYk1xVDIyTUVoWGM5Q2k5aGlrak9hN3U4RGFrcGtsa0lkTlJ2eGNGeE5m?=
 =?utf-8?B?SXRsRkwrNGhybXhZUkJ1WE8wTjFTVSt5QkFNWWV2OWRUQVorTHBHK0t0Nk1O?=
 =?utf-8?B?MmhUS3ozZmdia2N1L255VnA5V2JtZHNLcUxBQ25za296aVhvZWdzQWtEUjNm?=
 =?utf-8?B?V24vd3NaSDN1RE5rWkVjU3E3L2xwTEZKTjN5RFp3RkdOTXQ3WEhmdFJUZmR4?=
 =?utf-8?B?Wng0VjI1TlB2aEVVNU50Zm94Y1MwRnBUdlRoNy9QSXd0WjJZSW5WQXRrSU1t?=
 =?utf-8?B?Y0NubGY1RnUvUUNkYVcyV2N6eCt2M0Q0U3dpdlJPUWM3bEVxb0U3WkI0cXg0?=
 =?utf-8?B?YTc0eWxBL2ZacW5TQmRiM2ttelIzdGxGNU1aVVZsNDlkZGV1M2VZTHNSMWNq?=
 =?utf-8?B?aGdsMHJLUERlUmNYcjhlZ1MySkJxT09LUHhVOHZzYnZsSkN1RGh4eU8xei9y?=
 =?utf-8?B?d0RscTdJcmVkQmtOMmkvOUtSaEpaRFI3V25SNkF1ZFhzZFpzZzR3cWVJTm5s?=
 =?utf-8?B?d1pmQzBYdkNHL1dRUGtHb2tWT1FhdVpuRTE0WHFJaENoQ2F6KzBvRUxOVi9u?=
 =?utf-8?B?a0RnTzc2TGJKSHl5K3ZKNTFqTk1aWmgzbGREV3lLWlFrd2I2SzNsU3I5Ym5m?=
 =?utf-8?B?anQraTRKWll0VnprME1abFBRY3FYVWNLT21temp0aG9VcnMzTlZxLy82dHZk?=
 =?utf-8?B?MTVITERpWjdDSm5QOFI2UFhJRnNQQU5RVGdIZGdvZE4xMEYzTUROUWZIdjhS?=
 =?utf-8?B?VitLb21HN3RzSFZZS1lsTVZEMmZZcWJZd3hLMXZoSzNIL0lGNDZqaGcwWHFz?=
 =?utf-8?B?eHRsL3RkUG4yNG9EZ2pNZHNMTmk2NkYvUy9Tcm04YTBnUVp4UU8vbTd3bHUr?=
 =?utf-8?Q?ZY8BuaSr0CAuFGyI=3D?=
X-Exchange-RoutingPolicyChecked: pB2iIgoPsDlUeYog4WJO3wrjloZsrZ961KI8O/q49cK8dgGapphuspLRqhhRi2d0CLefPeledbZXEmuirUnrEB7nCVTV/x+yFXrhtAuvrGjD+f9DJjyrMgkKKqtwnvrGzV87us7U/is9uqNgvj234jFxbcycbqqXnvG//uVwdUOgTYn72e0FDIY7Us6Lafu8RpxXQkXVbzkBj9slYTFDW0qMAv7twDF+ya6sywD+iHj9pwTXYD4jUy21iOZR1D8+ZZyLgOAsaUiepn+7YjY9FbRYMgylwMLA6oC5POnexJk7MbgnLsxZrm/u9X6fL9a7umSvdgLoA78ad5J6PZ0GAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dce8c377-6415-4c4c-67eb-08def46a37bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:56:57.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6rjFoR+oZiZ1Up4tt324psDFe+y39KQTuvxFJtntBUY1zupXr89JrHE2mkIPigycynU8wm3BFg/vKeqHFSshMxmrMAfPxw942yVAp4u3kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'device wedged' error using xe_log_err_fatal() helper.
> Use -EIO as the error cause, as nothing else is provided here.
> The hints about the recovery method and bug filling are now
Typo 'filing'
> separated as it only needs to be printed once.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..b1e9bcd9f5b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -48,6 +48,7 @@
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   #include "xe_nvm.h"
> @@ -1396,6 +1397,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>   	xe->wedged.method = method;
>   }
>   
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"

We can directly used url string, instead of define as macro, since we 
are not using anywhere else. OR

Please make scope to file only.

> +
>   /**
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
> @@ -1427,12 +1431,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
>   		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");

Using -EIO is right? since we called this function with difference 
location (since we are not propagating errors), we may have different 
errors.

which may be misleading with -EIO.


Thanks,

-/Mallesh

> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);

>   	}
>   
>   	for_each_gt(gt, xe, id)
