Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05FBD3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 18:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE38E10E4C0;
	Mon,  8 Dec 2025 18:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+F3GEtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B3510E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765218450; x=1796754450;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BHPABmH7vGN5LiQC+TZjOsSo4LZwCttnW/gaAVM5jAU=;
 b=V+F3GEttlyZP/J86/e6R301Oncze6VTsMSksiigyiQ32x1ooQcr7rpCx
 zFpRawiS5XHcvZ+JZ0TOk0iW2hE47ix7pYP99Qo6Apg6oG0NExiuIceiG
 7roQ9ruB2HwoaH7gpHlFDm/apIR+U0hGnj2w7PsRbqn/jirfsv8fVu0qO
 PEVXUpLZx7rmRHIzA5QKmM/NdlGB5FBQqIFg1P+UKhJ4QI2dRwCRpmwFz
 DOxk/kNmbuaTYYrU91YY50kAnY2IB7Qx5keWzv+yRKerXklXB8BRXCAF2
 6G+w0Trw7Ox4qnT5hUWglyBHLxq9OJL1l+soBdvIWDGUdrI2QVXbXuypH g==;
X-CSE-ConnectionGUID: EIZNtxI2SL+D8yPAifdVfA==
X-CSE-MsgGUID: TPoIQfDwRLug/gE9wFgglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67129551"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67129551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:27:27 -0800
X-CSE-ConnectionGUID: qYEi+QVMRpSEDxyFsBszWw==
X-CSE-MsgGUID: INGVfAxIQBaQAXNzRnMRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196014484"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:27:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:27:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 10:27:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrRn8z579UrYNgKQSdKjWK8NICq/DoUw2bximB0sQj3Yi+06zeKE8lDK+TiFc+3hhUu0xPwIw3Fz/xwcmExrtXSl3NhqxUMq3DwYgzBDWNf8joxBZMLtkQCf5SSoQUgOomquoKbffTPaItce4syYcwzffElVTFF99WzceYtMzKBDfVomf71mXJrbVYbtct46VkIsawTbloqZLjIl4xbHQVwesY9b4dleM6GnEU1GkgaMV9O2eRTLIWLaMTv95EUPs+VJGDZ/jUEZUqWvf9QxwIlBTPluXewj/8wxoQseK2lNxkwQswTfKKYarxF/761m/VPPpmJMVRVKPptl8ZGS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBs3fzOxFoMnSRkFdoBX4U/mKVyUezb9TwuPxYNTL1s=;
 b=nK7QNnApTGIPFsO9x8ki9bwOUgwzuENUFX70Of9AGAwNl0ob/izZioveIuDIwnmDsXqUWDbtEyi5zmzrSb+Y+f2mgwAQihuwAFi9DDNYI3QybrHw+ikVwvskmmrW+h04iJM56V2VbighOw1wGDJ5enAwQxIPkHkdJ8b87xcZrwuHB2zVfyJJTyBhUA+VUU/ddps+IqTt2Q8Ls9WoiuSj4kjwS2EBhqttfrNXy1DrjRIQellZL5ZsfV0X8h40p4ypCGbO1VjrDfVuHd8KX873SsECjdLp+YuRM7OmmALPPe12Ht18FyaVhyRINdLtWd9g8ciRqSkHc/SSOkE5ORojHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 18:27:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Mon, 8 Dec 2025
 18:27:22 +0000
Message-ID: <22a1be76-cf95-4119-ab15-40a98c567faa@intel.com>
Date: Mon, 8 Dec 2025 10:27:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] drm/xe/sriov: Add handling for MLRC adverse
 event threshold
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-18-daniele.ceraolospurio@intel.com>
 <ba986347-f542-49f0-a4f5-796e23933969@intel.com>
 <1c790980-36d0-43ad-b4b7-573d287df716@intel.com>
Content-Language: en-US
In-Reply-To: <1c790980-36d0-43ad-b4b7-573d287df716@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 4744b40a-510d-4109-bbd4-08de36876dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TS9ZcjNMTldRdmd6Nk5QYjh5WlB2MHVUR0dtdmZ3VHkyRk54aWtpZ2pYOXMv?=
 =?utf-8?B?SCtkODJLUGlmT1gyV1FjSVZpdlFwUmNWRnJ5Znp3cWFNVk9pYXd3ZW95cEx0?=
 =?utf-8?B?WEF3Q01CSkpsUHBMZlJCejRsR1NXNmRKTmxZVmVsR2doR0ErNzhudmt6MHZL?=
 =?utf-8?B?ZittRkloNjZXK1FLQnRaanJLSDlOMytBU0gwaEltTVJoNjBSYUt4V2k0VURU?=
 =?utf-8?B?M29xKzBQdTN5YlVYOTIyQlQ0SVE4aGJOMVd2NjhYT0ZFTzU3MUllZUI4Uzlm?=
 =?utf-8?B?cVZlcEp2dWFjcGVYalc1OWQ3SC9yTXdrT3I0Zm1KNkkvL0tpRUNtNkZpWGlq?=
 =?utf-8?B?OTJrUmJSMzg1ckJZeFMvcnNtOFoxdFBwcVlvaGlZakd5em4wa1NseENUOVhy?=
 =?utf-8?B?c3JONGROVUo4TVhQV1UvY2ZtaGpaMGd5Q1BqUEc1R3p5V0FuVWdyc25QTjgy?=
 =?utf-8?B?dUsxMEtXNFUxeDdTWi9oTkVoSXV1WkRUOU1RazZ2ZWRPSG80SHdqREJGMUxC?=
 =?utf-8?B?ZTFreWkrd2NBRzFrWUIxa1AySmUxb3hlVEFVT1V2MlRVVkZoaFpRT2toM2JS?=
 =?utf-8?B?UkVwTEVkZXRibm1ISVdiTUxHZ2pkQktEWDlsUHVMNmtOVmk4SHZvS1FoUC9L?=
 =?utf-8?B?bzZvcHdDMTFJc2U4Qks2QTNqS0JsbHhhVlRQcklYa1BlOEc3dENtbXd4ZEJM?=
 =?utf-8?B?L25VYXMyTjZFUHRFYTJEZGtLZ3g5UHhBdUQ1WDlSK1VwcllCbHFTUGlNMjlX?=
 =?utf-8?B?Q01Kc2Q5UiszUFdSV1B1Ry9lNUM4ZW5BUHVUcWpkVEN3WVkrRzZUSGNmYUd4?=
 =?utf-8?B?M3RqeG1PWU1vKzQySUNVT3pjYXplQk03c00wS2FWNTVoVWUyeTJCKzc3Tzkz?=
 =?utf-8?B?RlMyYmhwSFMyNlJWY0E1anArNTJ4YnhvOGdMMktwOE5DQ0NJZU9yL00vazBi?=
 =?utf-8?B?N3NxU3V3WGl1czFod0pvUzFzcCsxbndGN1hFVnlWQjh6TUlLNE1HTFRIN0Yy?=
 =?utf-8?B?aUx4SVA1Qmw4KzR6TkQ3SGtjZXk3em9NSHM3Ym5IZnRIVWRPdjg0OHBZZ0Vp?=
 =?utf-8?B?QUo3VE5vZHpRYWRheXM4L0FNSS8rWWpOWWkvSVp6WjczSk02L3lqVDRCOWNs?=
 =?utf-8?B?UkdianUxbVJycUFNVkxWcVhhVGlCeTNkT2lZcE5JcjRvdkY0ZGZkWFJVdzBT?=
 =?utf-8?B?RUx6UXFBV1BJZ2JiKzQ3L0xDVDFWTyt0NlZIV3VjZlE0TE9qWDBXZUgrQk00?=
 =?utf-8?B?R0syYzdOVHIvbDZKVTY3OVJPK3lpUTZaYVZjNkw1dzgxTkQ2MThIcytZMjgy?=
 =?utf-8?B?TThJVU5jTWdRRG9TRmUydWZGM3l2WW0xYTZNd3B5Z3BJR0srd21NRUtIZm1T?=
 =?utf-8?B?VkMvQlUzTlN6UEtENEIvMFJHUnk3TVNkNnRKWUZUWE1wY0hEQnRZSE9selVx?=
 =?utf-8?B?bkFvZ1o5c0hOeW0xMXRrZFFxOE5qbWgxQnZZZ05kT3lHTG9KVmlNMXd4ZmFr?=
 =?utf-8?B?aEhxUzdpck4xNGFOMXhLN2dlY05KNmlNVlEyV1JLQ0FPM2FzTmd4TThIUkRJ?=
 =?utf-8?B?d2lJZ0pSaWkra3QyeTJ5aHl5WlljR3V6dUl3dTAxMDc4ZmptbDhDYkZlRUZo?=
 =?utf-8?B?dDhTcG4zT1JJWU9XZXVTTEV3YURwNmhLMTNSRUd0UlRxekVUV0ZVM3ZwQnRO?=
 =?utf-8?B?bFJPQi9Pa3dJNjZxY2VEcDVDZ1JtVlBHb1diU3NpZk1temNKdno1ci9hdnor?=
 =?utf-8?B?OXN4dEVCdFMzZGRvaHIySE0xNW9KcEFyRTh2MDhXbXpwemtqcG1mcjVoTExK?=
 =?utf-8?B?N3dXT0lBZDh4cDR1LzQxOVpCNmRYK2syLzFYVDl1dG05VDh5ZGxJTWZ0ZGh5?=
 =?utf-8?B?N3RBTlg0WXI2UlJXU0E1ZWFnR0hldVZZTkZ0NTY4cXp6TVVXZ0ZyTXdCeUtG?=
 =?utf-8?Q?mo6DKm2VE4lZLBCbVu1gaTtD69MUChZC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2Q0em9wTktsYWxvaWFtWVhhQXBtaE5VdUpvVmFrVGRIeWF0dHR5QzJIK2Zz?=
 =?utf-8?B?Njh2eUhEakJmZWUwOHd6MTVNRHZ2VW8yRWxrZ2RLTHo4NExOTzJFcHNTaDJz?=
 =?utf-8?B?U1A4TmR1eUZyZUxqVkFDTEdzSDl1a1RTZ0lOWXFIcUNLRFRiUFdXcnY3c1o0?=
 =?utf-8?B?UHBVV2ZMVUZZV2E2Z2NtNDR3N05YTEFGeWJHYVdXMklZL1lKWDRnMUNSQU4v?=
 =?utf-8?B?dWtuOXM4ZUdndFkwbUNDVjJ4N1JpSk8zWWRyU3FnakRVSlBOdnRTSG5QRmtr?=
 =?utf-8?B?S0p2QkMwRmxxR2ZWYWRkR0pGOU5Zait4VHhBaFpKZ2praGpBcUg5ZHJSaVV4?=
 =?utf-8?B?eUFxMTZPcWQ0cTVQcXNEN2MvOGpMVE5oSisvNkZDTXZSTDBzK2VOU0lLVERj?=
 =?utf-8?B?M2E2dE10V2N3eEh3eUs2eWNwVis5SmdhY0lZWXRLSWJiUlBTQ1l3RXJoRDg0?=
 =?utf-8?B?cjdqRm9JdlJSY05BQjJLOHhrSFM1UlZSRGV0VCtYTUpzeEtqMzNweG1oRkxM?=
 =?utf-8?B?Y1ZUQklvQ0gybFRLeERtR2NjTVBmVTh1T2g5SXI0WGFCSXVZOVlZZkdZMkVo?=
 =?utf-8?B?NUY3VldWMit4cEg5M2JDV1FGeW1XNUtvWEtEeU5wVm9BQ2NROUQzdnhuOGxs?=
 =?utf-8?B?aTJyUzdpQnBkU0JTSExEeGZoaWNOVE14YVZiNDBqWmRxVVdGUS9hRGs4dDRi?=
 =?utf-8?B?MHlKQjFKUHc4eTVuRWFsWEdyRHpXQjUzZTFHOUUwVEgvTjd1QlNmOVI1MVJr?=
 =?utf-8?B?cDBOQ2xXbGdGY1hVVnlobEpaWXJBZmQ3eFRPcDY3UUJSVzVtVWUwUHJiZkND?=
 =?utf-8?B?czVsRUVKNlJMRndleEtQWCtaN3FrUFhjMHlyd2QraitQc1cyTkgzVlVZNkVr?=
 =?utf-8?B?d0l6SWdUR0gyUzlpN0gyclFQdlVibjZpSStwcDBiekRZZFBXSHBVM3lkeTk1?=
 =?utf-8?B?N2ttYlhyKy9ZNEdGYzBRZXhUcVFsUXNIRXRUdTVyQm1Ha25TcHJoRDQySGV0?=
 =?utf-8?B?dExtbUl5YThDbzJ1NTd2dm4yV2dzaDVsdjNWNGsxaHV6aVBvdmtMMmszd1FN?=
 =?utf-8?B?azRLZjZ1SlZxektib3hGOFFQWUQ2K243WnAzOUZ2K05LOWc3cW1WZkpQaVY3?=
 =?utf-8?B?dFUxTjYvZjI4R3J1RElpbm9ER0ZZTnVocFBpeS9DQjgzMERpOTJCdzBmdXZW?=
 =?utf-8?B?Sm1FV0NWUE1jTmRUNDlBUHArbmMzV1VZdHd5V2JtZitTRngvYk1XclZxT1pZ?=
 =?utf-8?B?VkRNdis1c091VGppOGVjOEd0ZSsrOWk3R3NseHAyL0p0WW9IdWl3ZGVac2R6?=
 =?utf-8?B?R1RGY0h6VVRFVkZzUzQwYnpQUHIxOHFaU0lReCtVV1hONCtCOXJvclM0U3V4?=
 =?utf-8?B?RDFLOVg4NWx6ZmJ6UkQ3a2poNld4OFVFaEVidkN4cmJyVmZ1RmlCcVR5ZUds?=
 =?utf-8?B?bGRKdzU4ZWFib2psNHcydmVWbWg0bjZsbm1wRzJWMU50YW81N2JVRjlpSmdp?=
 =?utf-8?B?aFdEMTFqZlNjeTNoUG1kQmJoZGVvRnJUK2FkWUNNYUl4M1k2V2tSOFROS09S?=
 =?utf-8?B?WjZ2b3d6bzRXckN0TVJocmVNbytrZ1ZrY2wrSVB2TWZzVG1zLzUrMkFJU0Vl?=
 =?utf-8?B?eUlrUkZjNndYajhrWjMvczVFNEN6SlEyQTd2R2RPZ0U3YXBvb3ozK1YzNWlr?=
 =?utf-8?B?YlpUWkFpMkliRjVtMS9wbzFrNHFJcmk5QlZETk0rZ210Qm1NakZKcnlmZTZP?=
 =?utf-8?B?bVFqbktpWmhLbkpybllkWjUxNEUrUThNai81d2VUS2FXa2lwVEpNM2FWUm1J?=
 =?utf-8?B?d3FLQ3lKV0FKOG9pUEhScmhqU0xKS3hoWWdUWEQ0K2tHeE1EcU85NEwxQit0?=
 =?utf-8?B?bUZQZ1ZuRW9ubGhueE1IS1phNW04aGV4RTh2Q09MZWxjWGxYQnUyb3RvSHNS?=
 =?utf-8?B?UTlrUzdtNzhMUVN3WTRzY2JuVU9ZSlNPa1ZXY01FRFhGLzd4TTkwU3RhcWJW?=
 =?utf-8?B?UFFEdTh6NUNELzZvSEdzWU4yUU9FV05Oc21VZTF2bnk3QmY4UlZxSTI0eDFh?=
 =?utf-8?B?SG4xU3hOMHMvYVRaQmhzTHpQZm9rbGN6U3g2ZGlNNCtnajhLd1VOWjliUnRt?=
 =?utf-8?B?alB2MlBjUjQ5SjF5aXBNdWU1dmtaTUVVVzMycC9VUVFlNUJob2Z3UDdtTHBL?=
 =?utf-8?Q?F6g7vlfrGBeJ+J9+2Tft9HE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4744b40a-510d-4109-bbd4-08de36876dac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:27:22.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4lcuRZlZrDliXSOYQ46SRGcZ0Rt2kG6vyX06f9rYIgATMoFqpq5EDLcvJ8cEm774U2NmMAq3TB1YzhP32APu9HdfROINlO/O/h6SonK/J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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



On 12/8/2025 9:52 AM, Daniele Ceraolo Spurio wrote:
>
>
> On 12/7/2025 2:03 PM, Michal Wajdeczko wrote:
>>
>> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>>> Since it is illegal to register a MLRC context when scheduler groups 
>>> are
>>> enabled, the GuC consider the VF doing so as an adverse event. Like for
>>> other adverse event, there is a threshold for how many times the event
>>> can happen before the GuC throws an error, which we need to add support
>>> for.
>>>
>>> Since this is the first threshold that we have that has a minimum GuC
>>> version requirement, support for checking that has been added to the
>>> generic threshold handling. As part of it, some of the version code has
>>> been moved to its own file and with the occasion some SRIOV
>>> documentation has been added.
>>>
>>> v2: split from previous patch, add GuC version checking
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++----
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 +++--
>>>   drivers/gpu/drm/xe/xe_guc.h                   |  7 +---
>>>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 18 +++++-----
>>>   drivers/gpu/drm/xe/xe_guc_version.h           | 36 
>>> +++++++++++++++++++
>>>   6 files changed, 74 insertions(+), 24 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_version.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index edb0546fb163..30a051a0b4ee 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -376,6 +376,12 @@ enum  {
>>>    *      :1: NORMAL = schedule VF always, irrespective of whether 
>>> it has work or not
>>>    *      :2: HIGH = schedule VF in the next time-slice after 
>>> current active
>>>    *          time-slice completes if it has active work
>>> + *
>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>> + *      Given that multi-LRC contexts are incompatible with SRIOV 
>>> scheduler
>>> + *      groups and cause the latter to be turned off when 
>>> registered with the
>>> + *      GuC, this config allows the PF to set a threshold for 
>>> multi-LRC context
>>> + *      registrations by VFs to monitor their behavior.
>>>    */
>>>     #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>> @@ -434,6 +440,9 @@ enum  {
>>>   #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>   #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>   +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY 0x8a0d
>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>> +
>>>   /*
>>>    * Workaround keys:
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> index 59c5c6b4d994..dda671d05b89 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const 
>>> struct xe_gt_sriov_config *config,
>>>   }
>>>     /* Return: number of configuration dwords written */
>>> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config 
>>> *config, bool details)
>>> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
>>> +             const struct xe_gt_sriov_config *config, bool details)
>>>   {
>>>       u32 n = 0;
>>>   @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const 
>>> struct xe_gt_sriov_config *config, bool
>>>       cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>>>       cfg[n++] = config->preempt_timeout;
>>>   -#define encode_threshold_config(TAG, ...) ({                    \
>>> -    cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>> -    cfg[n++] = 
>>> config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]; \
>>> +#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) 
>>> ({                \
>>> +    if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= 
>>> MIN_GUC_VER) {        \
>>> +        cfg[n++] = 
>>> PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>> +        cfg[n++] = 
>>> config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]; \
>>> +    }                                        \
>>>   });
>>> MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
>>> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt 
>>> *gt, unsigned int vfid)
>>>           return -ENOBUFS;
>>>         cfg = xe_guc_buf_cpu_ptr(buf);
>>> -    num_dwords = encode_config(cfg, config, true);
>>> +    num_dwords = encode_config(gt, cfg, config, true);
>>>       xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>>>         if (xe_gt_is_media_type(gt)) {
>>> @@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct 
>>> xe_gt *gt, unsigned int vfid, void *bu
>>>               ret = -ENOBUFS;
>>>           } else {
>>>               config = pf_pick_vf_config(gt, vfid);
>>> -            ret = encode_config(buf, config, false) * sizeof(u32);
>>> +            ret = encode_config(gt, buf, config, false) * sizeof(u32);
>>>           }
>>>       }
>>>       mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>>> @@ -2551,9 +2554,11 @@ static int pf_restore_vf_config_klv(struct 
>>> xe_gt *gt, unsigned int vfid,
>>>           return pf_provision_preempt_timeout(gt, vfid, value[0]);
>>>         /* auto-generate case statements */
>>> -#define define_threshold_key_to_provision_case(TAG, 
>>> ...)                \
>>> +#define define_threshold_key_to_provision_case(TAG, NAME, 
>>> MIN_GUC_VER)            \
>>>       case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):                    \
>>>           BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 
>>> 1u);        \
>>> +        if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < 
>>> MIN_GUC_VER) \
>>> +            return -ENOKEY;                            \
>>>           if (len != 
>>> MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))            \
>>>               return -EBADMSG;                        \
>>>           return pf_provision_threshold(gt, vfid,                    \
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> index 0fd863609848..5123ff1fb116 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> @@ -21,6 +21,7 @@
>>>   #include "xe_gt_sriov_pf_monitor.h"
>>>   #include "xe_gt_sriov_pf_policy.h"
>>>   #include "xe_gt_sriov_pf_service.h"
>>> +#include "xe_guc.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_sriov_pf.h"
>>>   #include "xe_sriov_pf_provision.h"
>>> @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt 
>>> *gt, struct dentry *parent, unsigne
>>>                      &sched_priority_fops);
>>>         /* register all threshold attributes */
>>> -#define register_threshold_attribute(TAG, NAME, ...) \
>>> -    debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, 
>>> parent, \
>>> -                   &NAME##_fops);
>>> +#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) 
>>> ({                \
>>> +    if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= 
>>> MIN_GUC_VER)        \
>>> +        debugfs_create_file_unsafe("threshold_" #NAME, 0644, 
>>> parent, parent,    \
>>> +                       &NAME##_fops);                \
>>> +});
>>> MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>>>   #undef register_threshold_attribute
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index fdb08658d05a..9028718189ed 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -8,15 +8,10 @@
>>>     #include "xe_gt.h"
>>>   #include "xe_guc_types.h"
>>> +#include "xe_guc_version.h"
>>>   #include "xe_hw_engine_types.h"
>>>   #include "xe_macros.h"
>>>   -/*
>>> - * GuC version number components are defined to be only 8-bit size,
>>> - * so converting to a 32bit 8.8.8 integer allows simple (and safe)
>>> - * numerical comparisons.
>>> - */
>>> -#define MAKE_GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>>> 8) | (pat))
>>>   #define MAKE_GUC_VER_STRUCT(ver) MAKE_GUC_VER((ver).major, 
>>> (ver).minor, (ver).patch)
>> I guess this macro can also be moved
>
> I purposely didn't move this as MAKE_GUC_VER_STRUCT is specific to how 
> we code xe_uc_fw_version, while MAKE_GUC_VER is based on what the GuC 
> interface define.
>
>>
>>>   #define GUC_SUBMIT_VER(guc) \
>>> MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> index 0a028c94756d..f7ed32244c6b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
>>>     #include "xe_args.h"
>>> +#include "xe_guc_version.h"
>>>     /**
>>>    * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC 
>>> thresholds definitions.
>>> @@ -23,15 +24,16 @@
>>>    * with the &TAG, that corresponds to the GuC threshold KLV key 
>>> name defined by
>>>    * ABI and the associated &NAME, that may be used in code or 
>>> debugfs/sysfs::
>>>    *
>>> - *    define(TAG, NAME)
>>> + *    define(TAG, NAME, MIN_GUC_VER)
>>>    */
>>> -#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)        \
>>> -    define(CAT_ERR, cat_error_count)        \
>>> -    define(ENGINE_RESET, engine_reset_count)    \
>>> -    define(PAGE_FAULT, page_fault_count)        \
>>> -    define(H2G_STORM, guc_time_us)            \
>>> -    define(IRQ_STORM, irq_time_us)            \
>>> -    define(DOORBELL_STORM, doorbell_time_us)    \
>>> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)                    \
>>> +    define(CAT_ERR, cat_error_count, 0)                    \
>>> +    define(ENGINE_RESET, engine_reset_count, 0)                \
>>> +    define(PAGE_FAULT, page_fault_count, 0)                    \
>>> +    define(H2G_STORM, guc_time_us, 0)                    \
>>> +    define(IRQ_STORM, irq_time_us, 0)                    \
>>> +    define(DOORBELL_STORM, doorbell_time_us, 0)                \
>>> +    define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 
>>> 0))    \
>>>       /* end */
>>>     /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_version.h 
>>> b/drivers/gpu/drm/xe/xe_guc_version.h
>>> new file mode 100644
>> introduction of this new ver.h file is self-contained so maybe it 
>> should be in its own patch?
>
> IMO it is simple enough to keep here, to avoid too many small patches 
> in the series.
>
>>
>>> index 000000000000..e6f80abd2f05
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_guc_version.h
>>> @@ -0,0 +1,36 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GUC_VERSION_H_
>>> +#define _XE_GUC_VERSION_H_
>>> +
>>> +/*
>> this should be regular kernel-doc
>>
>>> + * GuC version number components are defined to be only 8-bit size,
>>> + * so converting to a 32bit 8.8.8 integer allows simple (and safe)
>>> + * numerical comparisons.
>>> + */
>>> +#define MAKE_GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>>> 8) | (pat))
>>> +
>>> +/**
>>> + * DOC: SRIOV-changes
>>     DOC: SR-IOV Changes
>>
>>> + *
>>> + * We record SRIOV-specific changes here as those need to be 
>>> tracked carefully.
>>> + *
>> what about 1.23.0 (CCS) ?
>
> If you tell me exactly what to write I'll add it in, because I don't 
> know the specifics.
>
>>
>>> + * GuC 70.53.0 (VF interface 1.26.0):
>>> + *
>>> + * Added support for EGS. See:
>> probably we need extra line here to render correctly
>>
>>> + *  * GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG
>>> + *  * GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT
>>> + *
>>> + * GuC 70.54.0 (VF interface 1.27.0):
>>> + *
>>> + * Updated VF migration support. See RESFIX actions
>> maybe we can list those actions:
>>
>>     * VF2GUC_RESFIX_START
>>     * VF2GUC_RESFIX_DONE
>
> Those don't seem to yet be in the driver. Should I list them anyway?

Ignore this question, I was looking in an older tree.

Daniele

>
> Daniele
>
>>> + *
>>> + * GuC 70.55.1 (VF interface 1.28.1):
>>> + *
>>> + * Fixes for EGS.
>>> + */
>>> +
>>> +#endif
>

