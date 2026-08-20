Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875B4C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4000A10E1E6;
	Thu, 20 Aug 2026 22:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzR5FHXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F610E1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787264651; x=1818800651;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QEoZrs27AZT2Cic7ES891JGhEBKJyihKN3hVpPWJf6M=;
 b=AzR5FHXIJXGcRJ2NmTDbl8iDVddN1idGtjLQBc25TwZT5dakhR8wV2Z6
 +EaabszNX/M7R0Ejtq24AXCg1TjdmOVjDZHl/+n1V1G0AIgEfpNJcKu+y
 raFZzz7BP5Pqq7NztghhZkd/oFjheBe2s2it+DkhmpHvQVPmUoElvN21b
 WFpICGTpCRpbH6BWkp8AlZBbIvp8//50S1L3HXCrRBygKsHoPhawymTXg
 BxBdAOBZKj9JJmJ4OkHruog+ABs//YjSnMrJA806KwHq5NiVVcIscfzPX
 dUbKhH7R8WYqF77xRq2qyGV5S1C5hDTqOSVhRyCQv+Tf8WPUp3QXfPoDI g==;
X-CSE-ConnectionGUID: vlx5yWQoRJqX/EWc482/+Q==
X-CSE-MsgGUID: 63QPhqCcQzaiFe6Kq/6zcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99333740"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="99333740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:24:10 -0700
X-CSE-ConnectionGUID: wMC6p8X/StaS10qOpiTdCQ==
X-CSE-MsgGUID: 9Yo2F1r9SMaq7yGpRYBXWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="268090608"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:24:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:24:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:24:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4/w7E7zI8+z5ZfnYsIXIiwaHLdXKIhILxwzVnjlhvya7bvQ/7y+tAc4DDWidKMmr0/nM9kL3zr9rvtjt1B7v1/fzs4+ZCR5eJ2o3UgrBvTz44ZN42w81cqqqj5RGIeHVHcr6Bkbrrz3X9JwdacjARDav7jM74xMZdsE7CQJkLkPFhkVxjICCQdWukpJ9pgz6ddkbz5w0kZSdyYeRcu//5vbNkL53MnJqMRKHmTYs/hhNW+Qs+4Y8B2beKAt5P5UeAP15RljYP6YMbLpLEgSMQRIIFBO8mUARJrr4IQVLeoaliP6xyoaSQ19/kYmY4y8MLcpjas3PoCnOlJpRL6kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD82H0czzsPuCSzXD6EMpA+HWoXcdxl1EMrDb4KCEHo=;
 b=fxJaOswC44QbijpdVHAHCT47gBnDrzD2/ZRkBa7n+o+scVyyckHMMCgZxSPM13KmcEw49u4o+Ub9kcbNb0RIllVTW6FYc00v56VPO3cZID6YGQu1zPDqSpYRP7ZZup+bC41CzgXfS1BaiXYbCiHAzhBcvdF8jfC4L1lwJzCMqWxXFxcy8jeUS4khoMeNQaa9W/+Urr3gbTiR4//B/EhLvmbpgZe8z1Kw6kg5O9tQ2cQZ7K6A+/wJRHK/E4SFubZjCV3gDkcDPSj5Rv4iaGcWeUGqfzCMDrzXvRvAtcofOaNCuFRa+1YhMhyR59pllxOcG+jFEvNSty6fM5MDps27AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB185510.namprd11.prod.outlook.com (2603:10b6:806:51e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 22:24:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:24:01 +0000
Message-ID: <47c87cf1-0acf-4734-95bb-15579d2312c9@intel.com>
Date: Fri, 21 Aug 2026 00:23:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB185510:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb6682b-3c53-4c53-d6d6-08deff09bc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3J9PpLYjdyWQYeb0nignkKtSwLZk+tJhLLORh7pqdt4ckTxmR1gaEdlgJuH1YpXtmsjeRaTpOmbgcyvRzPCD9J49u9LUXwpp38Wngf5Jcd9IUMD0N6QCUW4pGxbozCb3ZwxEXU2Cc1oY+sNKNHcHzshGU0YrcqV2zFG1iO1n9X7GgYejUxWk41LyzS/en7yz6dKsNBo7JVW9kA/mOzFIZtGOEOrB8W2d6YYZoHtqxc/vNL8wYvt3H8mFwFRWHyjZB7f8VLKXIuoyhm2WTEE4yzWDO64oBsZ+DQEioDNA/h444HYQr7hPkjWsCfycHlFOs6wHiLSTcl8LPfFhnNeTQFUmA23bs9MEWNt3tE4dFSkLkkR63/RxQtFSt8xLnHV1x4VQ+8MgL5zjazEsGBbtURToCmjP+Qxp/D/YhGHbmoJDejsTH1b1tCjYczihYN1fEFWsMSbC0LNKvxUMjEZza+4GNLDUzFKh1NYphCQOHTmaKxEuWepysZqoq2zIVp0mfCNIfdmuQBRVTICSCQ2AoY+l9M+uUf5eWMYjGiwMpSYKHh9pX1JqsuD2GTSOlwR27tYnQTJpb0E+BR5gdLU0DPqYp3qk0B8DMrm/NdDKkqkX7smpI5PTAi4BnLFnh/rlAR8vGgRfmFGPqz02M95BBVW8Cvzn1M/UsmgKSAxChWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlZmNkJlL2tMdTZxdWFrSzlXdFd1R1N1cWZ1eE9ua1l4a0JPM1ZCVi9LU0RK?=
 =?utf-8?B?VUdaRWwzQTVtMFE2OVY4YU1IMGFoYllyWkw3VE1iRjBzSXVobU5Ea0M3Qjdn?=
 =?utf-8?B?RHZuaXFvMkZPUUJGalNzUjFGRHYzRzdZRXJMOW4wc2dBVGRxTzFUTHZoUzUy?=
 =?utf-8?B?WWJsVGlqTE1iMmk0WlZKaDZQVjBDMXFLZGVRVDdEOFFheHhMYjhZRGlLNVlD?=
 =?utf-8?B?bFNFa2l5M0VFb1ZydUhGS3pCMllxSUZSajVXd1lyYnBxYU1hSWc5WjQ1dUtO?=
 =?utf-8?B?WUt4TUVNR0FTcWtGUnFKV0JXK3FCYWFhKzdLLzN2Z3k1MHdXQ2Y5N1RVUE0y?=
 =?utf-8?B?YjJ3bEt0OGdSU3R3T2xsaFRmSHRvamxaOWFjVzhXbnZaaUtDS1oxd2g1S1Zz?=
 =?utf-8?B?YnQ3RVhDVWE5Vy9PaE8rWW5TcVVsVHlLWjZub01wZnhXSGlUTFc3M2tpOWJF?=
 =?utf-8?B?NmxkZEdjVi8rVnBRVldjanU3TmdzQjVrSW5sR0hXYVB3WU1oZVovYVlGcUt6?=
 =?utf-8?B?L0loSTd3Q2lFRzVxSUxBRGU2TmhXUTkxS1N0YjRzTzFYUzBzeUNCUUFZMHlO?=
 =?utf-8?B?RWgwakZ3dndoZnd4TTdZbnpHeDB5UzhySXk1WU9RdTIxSlNqY1NOUTk5cVBl?=
 =?utf-8?B?TEIyTVg3bW5lY1hqbjhLUklnRzVqZ2U1TEtsK2NpVis2SCtXUm1aMFpkSmFO?=
 =?utf-8?B?L1NoSDYvRkVlUTJiSExDeG5ObzVCakgyT2o2RndjSlV2ZjZBc25BZ2l6NlRl?=
 =?utf-8?B?Y0l2ZmhjYkZJQ3NsbGdYRmNtd2xyQklpM0dwY0xWcisrSjFYWWZOTDV4dTFW?=
 =?utf-8?B?RFQyaTZ5S3BDZjR3ZjJxTzNGTjZYdDN6cE4xcFJZSkRsTWR2dFFFazhCTjdo?=
 =?utf-8?B?aGcvZFE4djJLSk1VSlhhOVI5bGI1WHVJTFJCWDJvWldvYkJkTVA1aXFmYVI1?=
 =?utf-8?B?REZLWGdKQnlWZE9WejhLVmpMUEl1bnZUeEpMU2dCL1crSjlueWJRUEo4anlF?=
 =?utf-8?B?QkpUbnFzT1FleTkzbXBhdmdWYmtweUk0NHhDTWhFSTQvNTdpcHZrc3RObTNv?=
 =?utf-8?B?SXhxcEFKQVNpb3Uvd29sOFY3SVNPakVqUU1rSnVEd21XVnRoNlBWaWtsU244?=
 =?utf-8?B?Y0dGVHQyREZyVG5QMWFxNlBwN3pIZTdwNkR0UUhIcUR6bWpmTWhGYThhbmps?=
 =?utf-8?B?azdpTGo3NHM1T3pqQ0UrblJGdmZrR29HcE5FaEV3S3NQbm9jYlN3aGc2N3JD?=
 =?utf-8?B?YmhRK3RtQzB3cXIrMDB6aXMzYjNPZGRmOENoQTBoM2tIYU1qWDVidjI5bzN0?=
 =?utf-8?B?Zm1EUCt0Q0lVQ2hJcVJqTnB0S1o2RS9kWld4WTdZdTNiZE53N0RTVXYwK3B4?=
 =?utf-8?B?VGZzOVRWb05nbVNzdVcxQUFubFlLM01EbFdZSXA1K3o0cEZicDUxV1hJRi9I?=
 =?utf-8?B?TU5MV0Rra2pUU1JnQjBpOTVuYkx3aTVJZnJzZmxTcHo2T3FOUi9MZXFpUzVL?=
 =?utf-8?B?UnpZdUkzdFZVY0Z3VTNzeHRySGpKYkZ0Ry84UXN1Yjl4eTBGWWFpSjN3WDdl?=
 =?utf-8?B?QTI1a0g1bUw2YTUwaU5PVGtHcldPeGJpNHV4YW43QWtEbzNCNjlqK1FvYVRB?=
 =?utf-8?B?ZFdyVEVkaVZLbUFEbG9VRldkbEl5clVuUDNKblpyalNDblZMelM1dStqMVZk?=
 =?utf-8?B?MjlscTI0TnlZTXJqV2JpSnNkVmVFTGthWlhINEgydVI1S0cvSnQ2VTVsRi9y?=
 =?utf-8?B?V1l6SGM0SHdwLzZRZTg5VkFUajIrYmpjc2FzRkkzYXpoaVpQWGE0RG9vam1j?=
 =?utf-8?B?RXVROFdDN1JROFdzcGN4L3FYYWlldnJzVm42SzFnVjNrTVphSzBhZW5Ta1lI?=
 =?utf-8?B?cjBhOGtpc0FyYkpIN2c1QUtVTjNtR0xtRUdpUDJsanBGcURISWNENUgxc1du?=
 =?utf-8?B?VlI2ckErc3JtQXh6eTkzRFFSMEw0a0wrd0UxYXVjelQrb0ZHeXkyS3RDWVlE?=
 =?utf-8?B?dEVaV21yS0JkaVNZOU1FcFBPajlxM1RJUmtrMmxGdzA2L2wxTjVFM2lFMUxN?=
 =?utf-8?B?akVPN2NqUGZRVmwxK2pzeGxaRnV1Z3hEckJIYjFmbHdPRWppVjExTUJLMTNV?=
 =?utf-8?B?VGFnMTRmS1FMR21BejIxeTM5SSt1R2FnNkNOZFJXVWRtSGRoTDNYZFJYbkFo?=
 =?utf-8?B?ODdDN01xTXFlTE4yWEFyS0tlSzNqOVNZaVNDbjR3ZnZKUUJSMTQ4azMrcnZU?=
 =?utf-8?B?anFlcEEwTXNsQ1lzU09FQnZqVU1HN0VzdlAzUm9Pa3VNU1V2ckhKRzlRM0xP?=
 =?utf-8?B?WnBnekx3WFNXcXFSc1RnOE10cVZiYm9NeUdET1owNk1jMW5nVDE2czkxTmRs?=
 =?utf-8?Q?4NIga63V1Kv98qT0=3D?=
X-Exchange-RoutingPolicyChecked: Cs2d0D3D6gDuyP4F7OVeCIHuMKwwabxYatP1Kx9THHN54Q5IvMmrDuHbe67L2ci5/nhSJMId/mbTMP5yFAwcZz+bKceWQhZqFnRmUpiTZOB4HEshBHPTG9eP3WGVdSEieggf91Oy3v2upbrwnDsg+gAWB04+Gh/eU5QdwGslYtpKEJ0XDW7tTVy1GR1YJgajMx/JminOPzRFh49niZ4rOTga1aMFDIbgoaflAZdMjjr4ZJji4o41p1I3cKcHWVZgPQLHPUpjTI0mkc7k21eHAPQ8tTtYl69fvIL12gveu657T9NgOYoJJ3FpPXYohc7f2i9peypCcXytJdE8fd122Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb6682b-3c53-4c53-d6d6-08deff09bc11
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:24:01.0272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Yet0GOeOpvcTbT/yDTtF8bFgc6YtfPRqmlmlR2vxSu15wxcLzhi3zx2raeXis24YNqsSpK4lolQ8uZeXvPfBjffan7+6A7NDTWpj1LXQJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB185510
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
> and update callers to use xe_log_err() with the propagated error code.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

one nit below, with that

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index e13eebaac1d0..ef847f0a8f2c 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
>  
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>  #define XE_SYSCTRL_HDR_RESULT(hdr) \
>  	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>  
> -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> -				   unsigned int timeout_ms)
> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +				  unsigned int timeout_ms)
>  {
> -	int ret;
> -
> -	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>  				 timeout_ms * 1000, NULL, false);

is this correctly aligned?

> -
> -	return ret == 0;
>  }
>  
>  static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  	struct xe_device *xe = sc_to_xe(sc);
>  	u32 ctrl_reg, total_frames, frame;
>  	size_t bytes_sent, frame_size;
> +	int ret;
>  
>  	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>  
> -	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> -		return -EBUSY;
> +	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
> +		return ret;
>  	}
>  
>  	sc->phase_bit ^= 1;
> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  
>  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>  
> -		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>  			sc->phase_bit = 0;
> -			return -ETIMEDOUT;
> +			return ret;
>  		}
>  
>  		bytes_sent += frame_size;

