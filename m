Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05273606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CiktuRSA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eDiFSRTd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE910E9AE;
	Thu, 26 Nov 2026 14:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992CB10E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795702659; x=1827238659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8qN1zjz+yxT0Ioji22Lhp+BDs0NV11XtM1Eq2qUOpo0=;
 b=CiktuRSAUd1NvdhVpeLgtbMecFBeRHH1a6wEiuIB6TCsxb0YChe4LMOw
 xF7Q1rTAmMbjI55TZfGurVjmQBo776zs7vMDwc1ZlulYHiJiBALLJjV0Y
 hz3i3qGd9ppw43f8/mrSp+CtgWgirlhow6VmTndc1jnviIxNB6GEXVNRj
 O55MhR1pSPRH8xMCT2DLRhZRje5TSk+rU9LN7aeERyKlZoADB2G4rhkw7
 oZF07/GQiZ+hrO2cpI25oWyHn+9/S2aTHeCwH1kCBx51txnOk8FGv0q1J
 Qeh2WyAdfDfJ8iVx2mJgOq84SnDgWCDu+rgzDl9TSPofEsFjkb9+flCOh w==;
X-CSE-ConnectionGUID: 003na9YTS9++bJ9KJrNlZA==
X-CSE-MsgGUID: wTTIjnl6TBGd3cJWylyhzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4457219"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4457219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:17:38 -0800
X-CSE-ConnectionGUID: qbszV+WaR9iUn4u5ebW/AA==
X-CSE-MsgGUID: 6MTOhRhfTE+rZC7R4xGQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12784222"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:17:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:17:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:17:37 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:17:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS+za/MXm7VXlBzivIeTn4vLoEIrAdYLPUCIO+QHUj5y6rx0qcZTMrsmLrkNIwrTPYHf+340+tQyA+164uf6R2/uiaE8LDjCQedXsGxNiUAaypXDhf3LegypZCXTn+DGBIaNUJdjPGrQ8rW+VyFYIadjBtb+2PpIpn8OJhxWdzXcTwYVolAl8YYmUCqidvaYaw4tUWN98FmvRPig5mTZkyEjtiWSbyudyaCZPhcSwci7fk+u0maldsVY9Fdh57ZtCYZk94NQ4+VqldwA85p0gzSoaW9lmLKxMac9PryALESBsRh61U2k5EYVfdIPMASOAjjaTTHFBDivAOFsoTyH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaD2NIpnbxbGrHCt9t/o9LLlCyFubn0kr5JCbL05PoM=;
 b=Mg9P3RH8IDoX8Oy2W7S5Iikj75Ax235hJpTDX3LWunnToS/nxSY6gASJ5kx9r/xcOTKlkVm+JyIQPTj/JrziqKv3km35NyHhUO2qLCpsqd9AguBEsbXQDsG078yoiX8OsCBoy4kQTquC5xW//Z384x39VrRLHanmQMAc62OEJAoZwgVwmltpgaBh+FwLQajGjbzOcvIBwcCNhWrWBirCTZzRnyigtCK5LlDr6DU7clNcHSyMrrN98Rn0bFGRH6WbV72xl/3zrhLlaKlpXFfKB7R+/NO9QE23XdNgO4gO0KdK/JG2Fnbr4/BofxocB0pP0AT+gpVb7Aa7VsqWsYjg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaD2NIpnbxbGrHCt9t/o9LLlCyFubn0kr5JCbL05PoM=;
 b=eDiFSRTdtfG7jBkpjiqi1+kQS7LmbvJDp0F0tTszlm+BEROgB4zUnKt4z/K7UPSvNg4We4QqeQtkrHehJkGixK45i6167cZJrD8kfaz/R+Ci2FoQsv8j0eK+/ljZR2gur5Ej2L8LqgoSaFjA0toa41BP4cIYz4IWxkp1VAxEfNo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 14:17:25 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:17:25 +0000
Message-ID: <6d4345c5-76cd-4fee-9906-182cab96e4ed@intel.com>
Date: Thu, 26 Nov 2026 19:47:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Add SIGID logging for fabric errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261126095356.2153941-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261126095356.2153941-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0296.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 6169f42b-6e22-458c-8c1c-08df4bc7fe69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|261022113327099003|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DFmmmYkVjYLLEcyEEawRt5rDUuNKpmNjLk52xyQz7t8CNtHUM74plC2FGC4gRP3ES+Qe+ko6usfAItkJtvlNCtiVMM18cDGYa9olW4GrsBuRSt3URTVEllcfrnXfZyA3yT2TaCO/jE4HHMT9fjKNGCNe8g9UAb2sn5iLcNuZu02/YrAJ2YITTkmwu5M92ZskUYziU7RJhrknZ7xwdB46VaK/Agl64RvOuNxvs/00RURb8oyWIWwL/k9wxGdCSHX93qDWuTlVsTTX7Cc4aHHN3h+AZIbH/cPEYoHL+0g+qqan3Wb7tNDvnsb5+nBCaFm+uasbrnLygNuHgBfse8YSl/VmXUQHZ0cjrj3W+1J6sFrOLTZCqAaXMcb+3dYqYmWxBXfNwJI5tL7G774S20b3J7Hg9n5gORtF9TqKxTx4mqHijUJOYxTLaBklAReCKhIrmZkw1A4GVpSRFnuhN7Ss9vl0IGtJnGGW6fxmjB1Cf2hjoNIeXV84lSevvsELwrjmMxpnQNlIVJKuLoDanSV2QJFnIixEGGltjCm57jNGKrqTPXG/4ITCbxkaR8v0yzKTjm7bON5q5h3MQivFg17HcBgcDRpaLD8QBkzQfYNYWbckeqvr3HIOJ7nhRHe5Ep9UMk1+G0sNgY9psHBbjmNpvzPQkbAD/jq0MZqHLiwGvoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(261022113327099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGh6SHVVcHFneS9rVkxUYU82QkVobGNnWHJ0VXBaUmVDYjhEb2ptN1diOVBR?=
 =?utf-8?B?YWVFTlVVRjhEWkpZZ3dkMVdweTZ2ZWZSZmpFaGVEeDJKUkRDY2phLzFQTHhI?=
 =?utf-8?B?VEx0S2k4SEJKdGd0ZGEwTWFOSlRsNGRzbGRuYkl3Q3R1NGVkdklCV3o3L3ZS?=
 =?utf-8?B?MENSMXRPSDFGSUYxVi9EZlBhL0R5bGRwWmc1ckEwSHVkY3dFdW9mTVdXSEZC?=
 =?utf-8?B?b1hKZG4xdmVRL1NQajFQTDh5azJyU1JpTkZmd0FQRms5a3NnRXJrTGdMdTFU?=
 =?utf-8?B?Z1Y1RzlSUVU3Y1Bwc2d0N3dpUStYVFdCK0lLVUZ6N2tyZXpaTlgzc3BCY0JL?=
 =?utf-8?B?dkJZMURHOEdpV1B3dEtTR1NSSTNFY2NQbksxR3ZiSlN5aElILzV0Ris5Yjhm?=
 =?utf-8?B?M2VaK3FxVVo1OUh6Qkd5dkVCT21LbEpwQTZOK284dWNXWXE0WUUxbzR3V1Rh?=
 =?utf-8?B?Qm0xYmVpSW8rU25YT3Zpemp5SDdRcnlGQjQxdDdMby9PbGdDdUpoOGg4VFNv?=
 =?utf-8?B?VFB1UklOTGx5TElEVkFhVlM4MlNlR29JZnptdlkxVGs4TjA0Q2taMlF6b0V5?=
 =?utf-8?B?b1lXSG0xenBqS1NuQ0pTSHByZjNjZlVFdWl0aEZFcm9INHc1MjBjWDJqb0NP?=
 =?utf-8?B?TjYxTnowdGtjMUhWMm56RDYzbWJmNmtHT09vakIrd0x3TWxhcEdOSTFxOUxO?=
 =?utf-8?B?THJWb1JEbkZKN3huUXh0SGh0NlY5ems0eHBXbTRDcXNnbGJmbjJmZnVGZS9N?=
 =?utf-8?B?TFJjekprSGFlRXc1VzdraUtrWCtYSUxBV01pajRFZU4ySzE2UDhHRU95REdF?=
 =?utf-8?B?MkZ6M0hTVmFUb1N0WWJLWitXak5iUW8rMG9qTDRJckxaTGJWdUh1NXRNdE9m?=
 =?utf-8?B?dEJVbml0eHd4ajFjRXVQU2RLQTIyV1MxTFMwU1M2Wk0zMU0yNjFKYk9mRWh6?=
 =?utf-8?B?QktwMEc0WmtGZmZrdjBQZHBqOUFWcVpWSXh3ZHQvR2VFbnVPM0Nvejh5MGQv?=
 =?utf-8?B?Tk5Da2Zqc1FDVU9OVGw3MEJRUGIzVXFsOWxtS3V3LzY3RTMwZWRUWnJSQzRE?=
 =?utf-8?B?V2xBbk8wM3JDOUVtNVRUQTZVMkdZVi8zNU84ZXEyVWMzbDJtSnp5ajBUNmZC?=
 =?utf-8?B?T1ZiREptaFVtR3JEWHhmclFCTlZDakIwK2tSc1M5eHc3RFNxcUtKRmgxTEtl?=
 =?utf-8?B?VkFCZ3VSQmhvSkplN0ZaRjdSNm5UYWZ3b25Cb2dGZTNwMjBRNFRqNU93TTdv?=
 =?utf-8?B?YXU0Ris1c2dJLzhoQmF0OWNTekJkY2Z0YlYyUUcxVU83NW1vV2hIcmFsT0hp?=
 =?utf-8?B?aWx2cTloc1FJVHFsMm5MR0xJOUd2eGIvZTM2SXB2VEo1NEF4STRId0FVcS9S?=
 =?utf-8?B?ekdvL2RwWlF4RXhWdGIzZVEzV0NSYWlZQzA5ZDkwaUFVZ05IN1FCZnY5MEJG?=
 =?utf-8?B?QUd3UTkzTlczRjk3WE50UStzaE43RjB3STdoYWRFOTJQdWd4VTc1Qjd1QjlR?=
 =?utf-8?B?K01RVUVqWjZPOXZrTWRjOFJ6bU5uSGNzUm05SkpkN3RSclJBd25VQWZ5U2Vl?=
 =?utf-8?B?bUhlV1RTQW11c2NPTDJ0TThqdUhlU2tzQ3I4VCtRVVBnZ3R3L0Rqdzl1RFFn?=
 =?utf-8?B?SnFwUUJGNWZtQ1Y4L1hLVFNjVUs3cmdKSG9oZ0l4cTk5VTJ4ZncyWHM0M0o4?=
 =?utf-8?B?S2M4M0h2VTJNYXd4NnZGWkwzZjhxcVFoQXJ5YUsrWVZuVmtldUREK3pHQmk2?=
 =?utf-8?B?ejB6cEpOSUY3NVFQUXl1bERPNklqZ20xclFuSFo3Q2tYUlFLdmtBWFppenl6?=
 =?utf-8?B?MlhCRkxjV0RZcUZPSHk3TjZyS0EvMFB5NjlSZzVENFN4VWFjbHlPeFJYNWdJ?=
 =?utf-8?B?cVlJcWJwMUlORGNNdDI4bHJkaWhZb3JtTlpXQU5aUFlIUUxSdkh4Vjd3UkVT?=
 =?utf-8?B?REcrVlR6MkhHblZML1JvM2NUK01USWlKTm9uT0NFUHBqZ2d4SmRVNDJsZ2ps?=
 =?utf-8?B?Y0I5aDJnQjdkSXNjTXUwM2NFWHNtbFJoTUw0Qnlic2trWjRKUGJGNUFVQzU1?=
 =?utf-8?B?MEpFRklEeEJScFhRNW8zSkMvLzBDT2ozUzVvTHBlYVFocWlNTGNGU3dkZEVI?=
 =?utf-8?B?M1JXREI2VnZnL2NQMWJvWEwxNkc3SXhRTnVzczZIRUtDNzdkRGtiSDdwT1Y1?=
 =?utf-8?B?VFZWTjdPcXRodFROSXBLdlRHcVdINEQ3Z3g0V0owV09GcWM5aGxFb3lwOEFN?=
 =?utf-8?B?clkzd3M1K3Rad1M2SHZhRGFWUnNiVDhleUNlempPbmNTMnFVYWFyUWk5ODRK?=
 =?utf-8?B?ZC9XYUVXM1ZYSzVoUVhLeE51ZkxNeHNyUzk4Y2NGc2lpVjNyU1BmQT09?=
X-Exchange-RoutingPolicyChecked: kLMj3s0GL65Z3ZK2q4JXICPnxidqhkjxA0GJyK0RAHcdFGdkWUsluU3pmWxAYIvoEIM6X5B9HYhQ2roNZnSi9TXQu8/GcMlJB/aJnX+MBtKmx89WG/BcJo5eiV+75vg/WDw9ziN/z+9fmmcFtCmjMjx9XODoXNNwWUiZlFXP1VLhV8m+H8Gx/eLwOOBMA4bx5Z5oQzLvaOWl9j5d1KOZzuw1YrERqdAA+Uq5DVJAChZjlYCLCYY14jtMMa9O+2c4i4VytxHPVVne+l2Dtux7nVK8tUwx5hFUIYc0Q06wutWdcjFcCay1y0LjIyQcKwGjgAOxqMXlLycDQIL9MKqCrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6169f42b-6e22-458c-8c1c-08df4bc7fe69
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:17:24.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RIYjBFyDIK9p0DVSlWcoZjqnYycgu3imElAhchD2jo3FNcc1jIvX6MfdzX6LQVQxEm9i3nPDNVbxtuxaIaUwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
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


On 26-11-2026 15:23, Riana Tauro wrote:
> Fabric errors reported by the system controller fall through to the
> default case without being logged and without generating a CPER
> record.
>
> Add SIGID logging for fabric errors, which also generates a CPER
> record.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 9b04be3405ca..87e721a7fd74 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -888,6 +888,11 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_FABRIC:
> +				xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC,
> +					    &arr->counter, sizeof(arr->counter),
> +					    "error detected\n");
> +				fallthrough;

Looks good.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
