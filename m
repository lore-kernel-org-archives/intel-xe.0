Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8421CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 14:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595CA10E12B;
	Thu,  8 Oct 2026 14:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEjVcJwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA410E12B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791470493; x=1823006493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fmqhw3HrGJzIbPZobB1axtsZHuCrKSQsj92TxByD+WM=;
 b=OEjVcJwL2PA1alYITY12lIAo3zAbjvg3dOMGoKLWn9y9TGsLl0PqXM8r
 R/j88pEgeos/UMmz5Qe325k7HNO/Rqqq7CQGx1WIkwgCN1rc3dx7kpmes
 1ltSA6vn68EyDliW3eHjX3orzw8T++c0IXJ9BKq9BPSIHz3Jm65ziienW
 d7ozQlbKK8QcNhPXgpTyPwnTWy63wN2qWKt20dhAL4MKebERn3OH5l6T4
 C+AnaF4GHV5sODjRSvNG2AFHw+Y92znqhV8A8UjUGsdbj4UkFqaxH58hL
 OP5HYWn/P+J2fPnegca5wkdUtYpC4CVEiPvw9GVkKuhGcordIGEzioATt g==;
X-CSE-ConnectionGUID: wK2AIyBKQ/mZBoVQfMvcVg==
X-CSE-MsgGUID: mhILYmu6T6Kr5FbWoAUjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="265381"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="265381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:41:33 -0700
X-CSE-ConnectionGUID: Ls3hEPMBRjag1veN9V06fg==
X-CSE-MsgGUID: Ir5HvY0SSCWSTp5DTLLrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="16362"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:41:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:41:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 07:41:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 07:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNc4cJzLTQi6B8Hud+7l3ltIzrkMBk/Imd7v05yYNPyx+kyKB0Xc4k+2veJO0br69Y2vdSGaz+0NPEcAzrILarLJpJKEqWBZ7pTZ/Urf24vUnKiFHoF51oz7Zh4TF0Uv5jqS3fVqQA62cYDvopXa/OKdx1N9xKfRwLeULBLYFLviSR0fN4R1rXTW9eXAyskH9ys9rjnr/0aru9yc7TY0UFL4XZFmMfvX3xXiRUpgSoN3VDSdhNcnJBKlCQOoewns30wHK8SKXKi57j8TR01T6zXeR/gKLjdbnOeULyaCYMw76M1tp0g6B5QVBZU7KhoyZxmtXzD2Fi8B8nDFJKtjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSjEZ3eeSyCMIRAL/feVP0Ka3ba8il9LHZ01o6l5jus=;
 b=HHtzbISNtDAKQlIZQ6HskbxzCRjuacZxoq7nwiQ2UmOymX1i6rLfVlQdyNKvVN7VgAdPyc0Gg7lrEyIN/VKvAmeV+SSNSyN4eS3mh3ARZ2akP0uYV+PZYjZVvFJ774yNb6O9lkcD+h4BTe+sp6izLPR7HR15DSJcK4OXgHJWSDFTGX6GnymyrtQHPCG2X8cmY7SoPapK7Id00BJCBMvuWxCDYQhNJccvgBIyHQ/MOGVevbHgXWvMLHVsYGbSBKbuTYjxn9LfhzYouXccgQbCJM6tHe9mqCjuTv7anF4YE+ptlt6VX6ArujE5+pyFw1STV6vFwXMcMvcJd/01mC0ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 14:41:20 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 14:41:20 +0000
Message-ID: <ce39c791-3244-4b60-af90-98ecb3cca107@intel.com>
Date: Thu, 8 Oct 2026 07:41:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
 <20260922231758.2695562-11-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260922231758.2695562-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|CH0PR11MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7f6c22-ce73-4f26-b7cd-08df254a3766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: BaZp99v7ypCQ0zHeTDBoMo9M911bybsXcpsMg5kRCFXS8uvA1EwGGhB0TeH6EO+XO6giHXlpLASRoMtL3l5JWthpD3+g8bEagijhP/wOy8pGafIbDYxpyfEeHQ//EWQqlcSmsqUCuRIvqRwNSSJaJL3c4nthqwIJSV8uDN3IT2OKNV7GqT2Psg1wDuZE27i0XjtiqO1iybNmkjlWDaNzeCgiL+SFkbAbDvtQtWBCQNiY3RbVyZq8OVm+1hqzQvzj4hAmpGMXG95bD2EwvFmPNtJGhisa0qClcZIRpWJobqWt99di4S2+Ag9tFjrDFRv0Tl41/hXEuLJ5q14yNrChII5BYBiMwNxycHGzivosVxIQ4P8wqjaN3+DHRDDrj7KN2PSxeCnJYVPu48Uccb0qW9grwAUf6THKEmprclgHwR6Jhm97xYcaqQp/Ou4iMf+IX6/macWMF6/ZywqmwEN7bqI+Bd8VCRVEVvzX6Js5/Yi1c1LgvTsZfhD9bsykSReuBaIJhhNBuRNVIk5yemQji9stHCjJnSof3uomV4S1YxxJHdRg++CPGG0kWrCkMzrlhH/GdzdM0fLNeP0UBkvagyVgV9PTJEfCEhAXZtGiMchRO1ZQCA983wUl4NzPpIGLAtLBzihVD23PW8JKwgkdlCfkz8huTcwWkOoD/erSwVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJsRWlpaWY5eWJ6QW41cTNJemJCSmFCWUZuMWFpRVJmcTIwdUdXZ1dVV2JI?=
 =?utf-8?B?LzVKM3JuRkg2bFNMRFE4TnM5elhvWmlDTUdXcTZ0SThUZ1E5Y29RaHEyNTB3?=
 =?utf-8?B?S0hJRTJveTNiRUtUSVFlL3hWTHcrUDdqWHNKMmFHYmxTU3Q1c1VTamtoZVdH?=
 =?utf-8?B?MU5Hd3JJS1JPcktCTnZyS1ZIa3FMN1JVcUJ0WjNBTTBKMVBJWGJ2Q3NMeThu?=
 =?utf-8?B?VU5tY0NNZi8zcVlmYXJwRE5TaGF3MUZkdlBoczEyUG83bHB0dXowb25SaUUy?=
 =?utf-8?B?R3hVMzJVcjYzejFleG5YS2RIZ0JnL2ZKQi9mQjBjcXR0ZWFybDc3SmljYzN2?=
 =?utf-8?B?VWplcDhYY0tCN240VFYrRUQrc21xQzZldmhXQzVIYkZvVXcvVU90QmFvK09W?=
 =?utf-8?B?QWtmVyt6c3dta2VlOGw0UFcwL1c5QXNkQ2R5VVBuUURIZ09LMlBLS3h5dEtE?=
 =?utf-8?B?TWhNZ01FV1FlMUhTeVNadi8vN2h4N1lqOE9hL09vMTBCWkpsQUQyQVJTZUU1?=
 =?utf-8?B?RW84bkhob2VrdG1PcnZMVnRKeUJheXFWVW1JaW5SRWd0NTdXSzZFaXFRcGVt?=
 =?utf-8?B?RXBPQnFoMW1LSHRtR1N5SS9MZ3JpNW05MTNUTmR2cnNzZzFxZmlRelRSYVh0?=
 =?utf-8?B?VytFVUQzVlJUR0lINXF6MkkxYnEvZjVZeVlUMGlrQW5WSjRET3kzWDBCR2lr?=
 =?utf-8?B?ZWhQaGJsUnkydUN3QUhBUUQrUzE3aXh6Z2tiOEthUm51c1pOZ0cvajNHdWhX?=
 =?utf-8?B?VWdab0k3elFtS0htTURCam8vRzFBeVFqZ1BDRmlXM2h3bHNTV0p4eDFMeUpK?=
 =?utf-8?B?NytRODdNU0VXNTNJSzFZeDZGdHdNc1d0eUg0aDA2a0VBSnN4aGRkaERCMC84?=
 =?utf-8?B?ZmtTejVqY0w0czJnUHo3TVlCcXpIaXdUY0FWZTZ2T1VWMG1lRGh2SktONWU1?=
 =?utf-8?B?ODRtTFpFc2VFbmRrcUUrZnRTZDZ0cjI4R2U5b2x1YmprL2lhMlZibGdLQzRk?=
 =?utf-8?B?aVV5TTIwTWZaY0hZWTFyUlpxdFdNZXdnY3EzUjNwWncrSE92eDRmbVFIRkdC?=
 =?utf-8?B?VFphdVNSaHprZGViQkp1RlZHTCtHQmpaeUdkb2ZZL0RJbTB1S2htdzdFUC9K?=
 =?utf-8?B?VlRURE1sSDRabENPVnB2aVJ3Z1FHcDVLY0RFcVVxOVA2TWxNbDRacFJkMmFZ?=
 =?utf-8?B?N3JDb0FxQ2NWb2VmbGlpS2VHYURTSDVKZ01UdGZKbnhEcEZIK3c2YWgwZXZz?=
 =?utf-8?B?OUpaSkxzL0ZxREhSdHA2NTh6cWFDWE1renYwcktHcThoa1MyQjVlVjFhL1JW?=
 =?utf-8?B?Mm9rRnBUeUsrOUViWUNjOGRaZXd2Z05od0hORGQ5RURKbU54dzZsWVo2TjJ3?=
 =?utf-8?B?SEdOOHNxSlVsREJzaGdtQXcxaW01WnF0NS96eDhQWVVPdFRwTnUwSnBvRnhJ?=
 =?utf-8?B?V1lHQm5HelR5aHpOZUZyQ0Z3cHoyUy9RcG5rUHQyZlZ1dTQzY3I1RVM1QXIz?=
 =?utf-8?B?RDZWSU9mazcvejZrZkFJNlhqN2ZMRkp0b3dlUjhkMW1sVk5yeFVjR0NPSXFr?=
 =?utf-8?B?STN2WVBSS3lFQW5JOXNHVUxUOWpmMDNYQXNxdnpJNWFMdDE2NHAzRWhUR3Zn?=
 =?utf-8?B?VWN2bDBJck4rQWNDeldTOWtwMCs2VXl3d2FSWmtUOWRXd2dvOENKam9JT2tJ?=
 =?utf-8?B?MUgzQmlkN0dSV3VmNHlQcENsMnBiZFIvWEhSVEpzbmtzOTRLRUc0VU1QRHN3?=
 =?utf-8?B?NFdSMzl0Tk52Qk85WS80d3dPdDZPV3VPVnpSVkNrdGVBN1NCYko0QlJycndk?=
 =?utf-8?B?ZXlBQW9KSWgzRzREUHFEMklqUkRjOFhjZFhrNUdBQzcyZDMxYUhyVTA5THAv?=
 =?utf-8?B?Z3VPYWxTdFU4RUpVMzlSNTNFRUtoT2NMN1JCSUI5OUlVczdNMVlLZVl5Q1pJ?=
 =?utf-8?B?TGlRQjFwWUtLUnhNNXhTS3NycWdIZE8wVEl4WVFlUHY0dytxOFBqNlByRmNV?=
 =?utf-8?B?ZFVLcFJFRFJnZWRKbnplSTBoNEpNd0o2Q2FWSW1JNVM0akFPbU1wTDRuVnp5?=
 =?utf-8?B?TTd4VktLWHZrQllsdzk2TTdUdko2Rmo0V3UzZzFZM1lxU1hMMEhaSFhWejZM?=
 =?utf-8?B?VGJFZlg0NGxWMHYvd1Q2M0VFRXVnYWVCQ29CQ1BrTHk3S2k2MWJPT3UrTHVN?=
 =?utf-8?B?c0FTMDlzdVZnUGNCNVZIK3JRTk5tMktnbjNIM2tpVzVTNk5pbXVCS1V0bjFa?=
 =?utf-8?B?NzF3aTVTMXpwK3RXcnlHa21jd2hydmp3M2RQbyttUXM5VUtCa1lEaTNNR0xp?=
 =?utf-8?B?WU51d3ZNS3Z4M09lRmg1T1ZSaDBabzhITVpuQUVMckRMeG5DeGY4UEx5ZCtB?=
 =?utf-8?Q?s6CoxLcq8rfnW1kY=3D?=
X-Exchange-RoutingPolicyChecked: nvlU7GKz/4CAWv+2lWS32dt3vWy2LS5dXnhRm1XKaNk7R3hP2xQeH4pucBI1tqsOeSHJKctNEq0Bo1FW5w0hkuuJAdRw9qltDgtUN+Sa1RV8Yg/tFBJx07Uk0Fu1QWJYU0etA/xYGIXLMZtyQUJCvATqmV1qZflSm9lS/8jp8xjWNjyfy4I0P3EQ4I6+3q+wi4PAzaiAElMpYVrHe3ZU2K46C4KOJQ/bw+trTlydPiubUsqqBbIF2OcuLJUfyPOhcY1uxy+jf24b3/xldIeIJsP53mPsGTitCaflqyCXXQqhcfjh6Tp1POEHwjclijYCH+26Rh4N7gdJXipm6qf0vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7f6c22-ce73-4f26-b7cd-08df254a3766
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 14:41:19.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm16xXZGkKoORXEo8/y+2DiBX9LkVLYzw6DfNu8c8dIlJUn693RUW/BftyiyhWoXGW/jDaxHYoOd20e5ptXMJq4xM4HuQsuom/1FHa/hGbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
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



On 9/22/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
> Refactor to handle the CRASH and EXCEPTION G2H separately. In the
> process drop the else case that existed earlier but was unreachable
> code.

It might be worth explaining why we want these to be handled separately.

>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> v2: (Sashiko)
> - Don't process the return from the helpers
> - Remove unused action parameter
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..ea59c1bf0c3f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1553,22 +1553,18 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	return 0;
>   }
>   
> -static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
> +static void guc_handle_crash_dump_msg(struct xe_guc_ct *ct)
>   {
> -	struct xe_gt *gt = ct_to_gt(ct);
> -
> -	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
> -	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> -	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> -
> +	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
>   	CT_DEAD(ct, NULL, CRASH);
> -
>   	kick_reset(ct);
> +}
>   
> -	return 0;
> +static void guc_handle_exception_msg(struct xe_guc_ct *ct)
> +{
> +	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
> +	CT_DEAD(ct, NULL, CRASH);
> +	kick_reset(ct);
>   }
>   
>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> @@ -1772,8 +1768,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
>   		break;
>   	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
> +		guc_handle_crash_dump_msg(ct);
> +		break;
>   	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
> -		ret = guc_crash_process_msg(ct, action);
> +		guc_handle_exception_msg(ct);
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   	case XE_GUC_ACTION_TEST_G2G_RECV:

