Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D7CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAB310E448;
	Mon, 12 Oct 2026 06:18:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2110710EEF9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791785914; x=1823321914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PEuvjxCr54EsPRiDiidQv9/lLfU3CgXOADp+N8Vraak=;
 b=hnQfS+MqppfmP0xP6kYGHI6UDW6YtISQ0nXH7XD63ndfk96il8PG0YmB
 OYauiEtv23z8GqSJ+KPXqBz2sNXzsX6UFasctV9ix5Mjhfge7ey8HW4T/
 iEDCwbmosjT7kB6j/0CDaXRZ1YbYN6+3I6Hbf+Qf7Yvk38tXYeWPBxZPG
 BEkz2nEbToazP7ayoFW6T/aP1WMxfXVt/6OYXk4vvYqzUQ2PvAt57H4Od
 97vwxZ5RdefvimsqR06bPnR0Wlz9uxoUhFFGCSirNdsm2bgSAKjaT2ErF
 ZEzN6DpN5R1c8pVVwmCc1LKMKkIg30o+zK/vAWOFRvk6M7SmmwyodIg5r w==;
X-CSE-ConnectionGUID: EBxyErJoSXm7No1ALxGGZg==
X-CSE-MsgGUID: 45BT68oVRuuyyvIl/4LhuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="386278"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="386278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:18:34 -0700
X-CSE-ConnectionGUID: fe+QIRCBR7GaVHUVqe0cyw==
X-CSE-MsgGUID: dmxqnMKXSKaaZduTaRIqyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="769215"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:18:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:18:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 23:18:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGvMz0UyXsCyBtXZEZrIIxIpp+Mb/aoUZRnhkDF88shamcwYSmqOlK1Bs+Y+iYqjAuBtXMthVHe390YU/6nLzukmdmS7LwSXCoU407rPu1UHM3wZT7YeCe4cN/qJOauRTC5TYw5+jOe8q5p0xmpCqae/rgQpgasJz14d/ztxnusKGoKLleU9g2fWXBliT2MNsRFAKcR4zCO5TrO7kw6OdkcdvhuwPIDgfiZqzNsmoUk+6n7y/Fbt8RdIIsnKNzLd71EGsH13aMxJpkU+PrPY5Spab5MiHHhrlSfYzzkCzhA8EZQxHOX2h3C8p6DFfdBFWw4CnJokwbRFBCgi3ntC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFHiugthk6KJXtglOG6+RSwBYKZNgaNsGTrUrGgiRmY=;
 b=I9TPjMO4n+9jf7H6vH53giBn3l1SO3KJB5pXpd2HIDcAy+28Fgh3lMeCGh2lY8UxIrnuqcrPqIssKHmaxyWF2LjbBxSFlwfdO2sSREw+pCFMlFyLlPodftQ99CfPlM5Xt1JkNFBY8MLW+KHWoTVaoFTrsvz/EMFICEhzy9ZDCnme0BzBZiqSJPlCoigTutR1HS8FBg97/BFURLObzU5yi+g3lJY4sd7mCq0U1DUDdm5xaHfeyIntGmkxhOUWG5XQPtoRgD7GxGOy15liQNPRfqlucVA70SoIk4CNZL5dFqnYRRpse6Xl5csSGZGBJBoZGeHWLHxr+tzvd81jXlubDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 06:18:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 06:18:26 +0000
Message-ID: <f0fbff63-96fb-4f75-aa4c-d881d6763fcf@intel.com>
Date: Mon, 12 Oct 2026 11:48:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>
CC: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
 <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
 <ao6raGv1PAtsmW4b@black.igk.intel.com>
 <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
 <ao7QRcbFlJxVxHHP@black.igk.intel.com>
 <2f41b3f0-076b-4876-93b6-216fa88e7c83@intel.com>
 <apE-oWyuJAmV1t0I@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <apE-oWyuJAmV1t0I@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 79abb6c9-5b74-4f13-a9c3-08df2828a02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|5023799004|11063799006|4143699003|261009221227099003|261009223327099003|261009220027099003|261009221727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 3ieTNq+ts5PWgIwbb2cH8BvpJJEx5fLXOsuzHlCqc/V2ABFYQx3zoX6TwfsSXvemFNURxs1biqG22hJlYGjfLcBfa8XySEtPZmkcOsGQQH55p1kq2UEX2Y19otF1PBkpadVvUdigLfibSljc6BrQgVu2cwRrzlT93Wuf3AJiBR8z09xkrwVzZHzhUmg5RSbLH0qLsAsE+UbyyzVBRkKUI9J5AI7bbrM7/KmyniIsHoJnVvnstJKaz/K7mxApwH2tA/6gq1wnZuWyua6HptP7wAffBku8X+dgq3ufvH81HkGULBv/EFrmUfQf96eJDfwl0iMTSELjj7Uqwoib2WRp+sVUgqW4IqutaMQQYjLXA0JaHVhZ1+/ScRlhTO1OWGm1tiU+oPJ35ZtW7YXUbdlLij2dMgd8o33O0Eo20bvLpSUmth9bWmsiJZ+zCTgBfuR8Q8sH9zfzpkL2zncTClg9Rsui/piX2bTViMWy0cFqq8QPs/B9iXWB80MNz5gI1yw6iB0kmTkHWt6FiS8XWUqCk0u1T6X/+bOqszStkPhjZ18mlz6Fukn7eUfblZhynqCXfl2ZtvcrrVaNAbRXmde2GVUl3yQeCwZQMmKONDAYtlHgx3969I2+xf1q7YO+kXY21uqWCICXAP/h95B9xUbmhn7KSkEWJGJXxBVC2NbUmig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(261009221227099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJtbXYzWFA5V3lvVGpiUXFGTTBwZzNWK1BESGNkVlZXbVI5eVlITDdsYnl5?=
 =?utf-8?B?dit4NGlYeWwrY1Vuc2tZZ3ZCclJIRURuL3YyYmp2WUF4UkE0dmFvRU5TRnJj?=
 =?utf-8?B?Ri9rM29qNmNFb3NkWWR2THpuRTlRcGg3SWRHRzAyOCs0bElJalgzVW55WkFL?=
 =?utf-8?B?NmtFTk5aK09LSStHZU82a2xmZTU1SE12ZGFYK2tiOGhUb0x4VmtaY0RXcTNa?=
 =?utf-8?B?T1B4Z2NVMnMrTDZzTVJUSkkwNyt6ZlpLMnV6L0hrNk1ITmVOWWswdVIrZEd0?=
 =?utf-8?B?SkRUNVgwc1h6U0ExQUsvWWp4aExqdlVKd1FDWDA4QTJieWM4aTR1Qm13OS84?=
 =?utf-8?B?K3VCZGlGUTJzQ1BQdDYrQ3VYTGxHSmJaQ2Z3NHFEVWEwNnN2YVRrc1JQRzlV?=
 =?utf-8?B?QlpVcGlMK0F2SGhCWlk2UjczbkJRa0Y5czU2VzVJV29YYTNZVVdNNmhZZExT?=
 =?utf-8?B?Q0xpOVM3QUt6aE1NVzROTmhMRWVqVmVYTStVS0NjOEhaaG5XV0doQnBQMXdS?=
 =?utf-8?B?ZU9FNGdCVURHWlM1RW04bjRieVVSRmo2TVIrSTh6VjFQWHBVZ0lyK0hXYTJz?=
 =?utf-8?B?V242THcrSG5YNEYwMzIvcHYwcDNlMExMcmY3RCt3cVhramFsbjNOcG1QOXJ3?=
 =?utf-8?B?d3dGZTh0Q2dWRzNmTCtRT3pSb2p3SEtYTjJPbkFEN2NkenVHN1JWREg4a21k?=
 =?utf-8?B?RENGa2NvN21RNnIyMWM5anNxQm9XZGwzVkUyU0tZMDhwR29SL1RReHpvdlI1?=
 =?utf-8?B?T2pvY0FJclI1bnhEM0kybnNmaXZRbCtHSG1TaEdhaXgyNjhiT1BzTUxoVmNZ?=
 =?utf-8?B?V29ScWhJODltUERGc3FYN2tUUkZUbTIzR0ZPU0RjdmdIQlhwbEd3ZWNKSHpI?=
 =?utf-8?B?WkpuY3lneVhhbmNYV0lLMEtQcVpLVy8xMXNiTlRFR0FRT0tJbWI0c2E3eVRU?=
 =?utf-8?B?RWVhbGlkdW5mV2pvYW9WK05qVmhqM0hvOWRhNldYcW5zaS9kZUM0b2xudWxy?=
 =?utf-8?B?d2JhenZ5b09XTnY0ekRqZC81ZDl3M0ZNamhuaEs5c3g0MU53U1ppNGYybWN3?=
 =?utf-8?B?cnlLWFdtM2lBeThEV3RtcVl2dTB4VkM2QmVVN1YveU53bUFqSHI3VGhUckYr?=
 =?utf-8?B?YnNJanYwczEySk1qNTRmZUg2NExCL1IzbEhTZmpyM3lONUY2SFVoNEQvY29p?=
 =?utf-8?B?Nk1rc09pdThGVUg4Q2dqOXA5MlhSbkJXZGZvZGFyc2taaFdmdVF3WmI0TFlP?=
 =?utf-8?B?bngvcHpQWU1lM3BNSFIrYUlLa2ZkOHd3ZHkzU01wcitITE5tbUNQMWxlQk1Y?=
 =?utf-8?B?Q1JvdTRpZzJzYWdZRHpkejUzZVNhZkRtL2tabXI2VUVCd1FndWg5RGp6QVpJ?=
 =?utf-8?B?ZnhpdElHMUNWY1dSMG1lSzZ4dmNaREE2ZVFWcHdEcFJsckFQVEdaMXpkdG9L?=
 =?utf-8?B?a29UQnkwSDU1YlZsL040eHlzVXN0R2VlTVlsdzB4VkY0QklYMVFJVm1uYXpS?=
 =?utf-8?B?eFN0dGxFajVob01QUHYvMmVVQXBINnMrM0pmbmtKbG4waE9nRXBja014cjNS?=
 =?utf-8?B?V01uRzNKV0N3bmRLYTNkMytoakZ5UVY2bDIzWm1uL1pvSDFQdkpsaS8vOFQ3?=
 =?utf-8?B?d245a3BYYTJBTTNZSS9hcVRlVFIxanpJQ2JNcHFib2U2Q3Y2akJPUzZLQm1Y?=
 =?utf-8?B?dFJYYkZyRXZ5RHV6QnA3ek9LOTJPZ1lBN3VuMXMvZEJrQVRWTUhadUYwMlg2?=
 =?utf-8?B?dWFFcjdFeDJBR0J0QUc2aE5pK2gxOHMrMVFDZVJwd3F4ZGNMRVlwS1o5T1E2?=
 =?utf-8?B?UEFPL1l0bU9IdCtHaHh2TG8xdUp0dlJxZ0ZWZFdkYlBpTTBYZEJTeXo4cVpU?=
 =?utf-8?B?UzNCdmRMOEY4Y2xwVHNRQm9XZ0FQcDJNQTZ2TjFtN2NVUXhXN1lBZmJtdWg1?=
 =?utf-8?B?bDc4UmhZcndvSTZ0SlFYeUp3L0VzWVNHL29VQ1dScUFITWc4OGpmakdIUDcr?=
 =?utf-8?B?eDZJV1dubW0vVTcxQXFkVWVSN0NnOHBXSWZ2NlBGNkNta2hMSklIVG92cUll?=
 =?utf-8?B?WVdtMjNBL2E2WkpwSDdPNVZvdldIUm1NYjI1QlJ1cEsyS1FUdWlVR3VMS2pU?=
 =?utf-8?B?cW9jQUs4SXN3N2N3Sy85V1pBZ29QcEJMOHM5eUIwbWg4cTE3dlJzTkZpSGFq?=
 =?utf-8?B?NlZuSDR0UTNERkZxYnVrdC9uckIwdEZZSnJnaUUxcmtFc2RDbFNSY1JyMzV4?=
 =?utf-8?B?a1ArUXR5SVQ0akZzOUtGQnhRZ0swcFJyMzlETlJ6SExWbm9EWmFvc1pvZkN4?=
 =?utf-8?B?bnVEWGdOOVZva0ZsNlVkMDQxRGpmWjhmU2N2c1h6MHFIcENxWHM5Zz09?=
X-Exchange-RoutingPolicyChecked: otMgHpH77iw/zGB2a2QdxD5qgV6Hiei/O9ZKZV89HYpkmM0ozwgQNju57MfybgbDn7hthTkpIcdEOQOk4hajJfzHbPNwcwKe0uWIX1PsiT8AwbLbl3PLMNJmebWCN1DqXbQM9tr8gp/uBJQHxVvbRMEl1gto9Gx/7qDlPgOpKM5vRhoeVBc/7YrM70MvS1k0vPC7qMBEZEy4zDB8W7OYAL+EMvl0S53oWS+aI8yl3MYIbHNgGP0aLjShAyTSBYw/a+LAnGQW589Qr3GH3gTjQKPs/2NDfPMaD0Nblz+LYR6NBzV8bjMKznoLCKM4uI4lqwf4r/76b/JiX/0oMilEeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79abb6c9-5b74-4f13-a9c3-08df2828a02e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 06:18:26.7082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZCVrFk4bkiDDpsXR8ndWR4eP8rXHSzo2KPMVb3wRdSIDXou82yhsGpaOvUplduhvAPDbnsuLt/C6G4yGvn4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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


On 28-08-2026 13:24, Raag Jadav wrote:
> On Fri, Aug 28, 2026 at 11:42:12AM +0530, Tauro, Riana wrote:
>> On 26-08-2026 17:08, Raag Jadav wrote:
>>> On Wed, Aug 26, 2026 at 03:22:19PM +0530, Tauro, Riana wrote:
>>>> On 26-08-2026 14:31, Raag Jadav wrote:
>>>>> On Tue, Aug 25, 2026 at 12:06:32PM +0200, Laguna, Lukasz wrote:
>>>>>> On 8/21/2026 13:23, Raag Jadav wrote:
>>>>>>> With bare minimum pieces in place, we can finally introduce PCIe Function
>>>>>>> Level Reset (FLR) support which re-initializes hardware state without the
>>>>>>> need for reloading the driver from userspace. All VRAM contents are lost
>>>>>>> along with hardware state and driver takes care of recreating the required
>>>>>>> kernel bos as part of re-initialization, but user still needs to recreate
>>>>>>> user bos and reload context after PCIe FLR.
>>>>>>>
>>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> ---
>>>>>>>      v2: Spell out Function Level Reset (Jani)
>>>>>>>      v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>>>>>>      v6: Add PCIe FLR documentation (Daniele)
>>>>>>>      v7: Refine PCIe FLR documentation (Daniele)
>>>>>>>          Introduce xe_pci_reset_skip() helper (Lukasz)
>>>>>>>      v9: Add 'Xe' prefix to document title (Rodrigo)
>>>>>>> v10: Update documentation to include PCI Error Handling (Lukasz)
>>>>>>>          Maintain wedged reference on FLR failure (Lukasz)
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>>>>>      drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
>>>>>>>      2 files changed, 131 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> index 7be3f15bf7a0..8cbb5b747710 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> @@ -518,6 +518,9 @@ struct xe_device {
>>>>>>>      	/** @pxp: Encapsulate Protected Xe Path support */
>>>>>>>      	struct xe_pxp *pxp;
>>>>>>> +	/** @flr_prepared: Prepared for function-reset */
>>>>>>> +	bool flr_prepared;
>>>>>>> +
>>>>>>>      	/** @needs_flr_on_fini: requests function-reset on fini */
>>>>>>>      	bool needs_flr_on_fini;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>>>> index 48466d726eae..81c4e55fae8f 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>>>> @@ -12,8 +12,55 @@
>>>>>>>      #include "xe_pm.h"
>>>>>>>      #include "xe_printk.h"
>>>>>>>      #include "xe_ras.h"
>>>>>>> +#include "xe_sriov_pf_helpers.h"
>>>>>>>      #include "xe_survivability_mode.h"
>>>>>>> +/**
>>>>>>> + * DOC: Xe PCI Error Handling
>>>>>>> + *
>>>>>>> + * Xe driver registers PCI callbacks which are called by PCI core in case of
>>>>>>> + * bus errors or resets.
>>>>>>> + *
>>>>>>> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
>>>>>>> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
>>>>>>> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
>>>>>>> + * hardware needs a full re-initialization. The way Xe driver handles it, is
>>>>>>> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
>>>>>>> + *
>>>>>>> + * Prepare phase:
>>>>>>> + *
>>>>>>> + * - Temporarily wedge the device to prevent userspace access
>>>>>>> + * - Kill exec queues which signals all fences and frees in-flight jobs
>>>>>>> + * - Stop the scheduler and all submissions to GuC
>>>>>>> + * - The fact that FLR is needed is because hardware could be in corrupted state
>>>>>>> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
>>>>>>> + *   contents
>>>>>>> + * - Remove all memory mappings since VRAM contents will be lost
>>>>>>> + *
>>>>>>> + * Re-initialization phase:
>>>>>>> + *
>>>>>>> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
>>>>>>> + * - Restore kernel queues which were killed in prepare phase
>>>>>>> + * - Reload all uC firmwares
>>>>>>> + * - Bring up all hardware units
>>>>>>> + * - Unwedge the device to allow userspace access
>>>>>>> + *
>>>>>>> + * Since VRAM contents are lost, the user is expected to recreate user memory
>>>>>>> + * and reload context.
>>>>>>> + *
>>>>>>> + * TODO: Reuse FLR callbacks for bus error handling.
>>>>>>> + *
>>>>>>> + * Current implementation is only limited to re-initializing GT. This needs to
>>>>>>> + * be extended for a lot of components listed below.
>>>>>>> + *
>>>>>>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>>>>>>> + * - SR-IOV cases which need PF and VF synchronization
>>>>>>> + * - Re-initialization of all child devices registered by Xe
>>>>>>> + * - Prepare existing xe_device_wedged() users for temporary wedging
>>>>>>> + * - MM corner cases
>>>>>>> + * - Display
>>>>>>> + */
>>>>>>> +
>>>>>>>      static void prepare_device_for_reset(struct pci_dev *pdev)
>>>>>>>      {
>>>>>>>      	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>> @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>>>>>>>      	xe_device_wedged_put(xe);
>>>>>>>      }
>>>>>>> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
>>>>>>> +{
>>>> Add a TODO
>>> Sure.
>>>
>>>>>>> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>> +	int err;
>>>>>>> +
>>>>>>> +	err = xe_pci_reset_skip(xe);
>>>>>>> +	if (err) {
>>>>>>> +		xe_err(xe, "PCIe FLR not supported\n");
>>>> Nit: Can the log be just PCIe reset
>>>   From PCI standpoint there are different types of resets, so better to be
>>> explicit.
>> I see bus-reset also using the reset_prepare/done callbacks.
> If we ever need to do that then we have bigger fish to fry ;)
>
>> I was thinking use the same name as function calls
>> It's a nit so upto you.
> Coming right up.
>
>>>>>>> +		goto wedge;
>>>>>> Looks like we always take the reference, so can't we do it at the top of
>>>>>> this function and only return here?
>>>>> Because we check for pre-existing ref below, in that case something else
>>>>> is already wrong and it's pointless to move forward. We take a local ref
>>>>> anyway because PCI core doesn't distinguish failure cases and calls
>>>>> ->reset_done() regardless, so we have to compensate for it by maintaining
>>>>> the ref across calls (which we later drop in ->reset_done()).
>>>>    If it is not supported why not just return in both function calls? Why
>>>> proceed?
>>> You mean allow userspace access while FLR is in progress?
>> If we do not quiesce the device and trigger a flr would it not cause other
>> crashes anyway?
> Exactly, we already know without re-initialization the device is basically
> dead. So just maintain a local ref until we permanently wedge and prevent
> all the chaos.
>
> Raag
>
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	err = xe_device_wedged(xe);
>>>>>>> +	if (err)
>>>>>>> +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
>>>>>>> +
>>>>>>> +wedge:
>>>>>>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>>>>>>> +	xe_device_wedged_get(xe);
>>>>>>> +	if (err)
>>>>>>> +		return;
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>>>>>>> +	 * update data structures and cleanup any pending work to avoid side effects during
>>>>>>> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
>>>>>>> +	 */
>>>>>>> +	err = xe_device_suspend(xe, true);
>>>>>>> +	if (err) {
>>>>>>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>>>>>>> +		return;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	xe->flr_prepared = true;
>>>>>>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>> +	int err;
>>>>>>> +
>>>>>>> +	err = xe_pci_reset_skip(xe);
>>>>>>> +	if (err)
>>>>>>> +		goto out;
>>>>>>> +
>>>>>>> +	if (!xe->flr_prepared)
>>>>>>> +		goto out;
>>>>>>> +
>>>>>>> +	/* Unprepare early in case we fail */
>>>>>>> +	xe->flr_prepared = false;
>>>>>>> +

We need to unwedge device before doing a resume. For guc_ct_send there 
is a wedged check and it will fail.

Thanks
Riana

>>>>>>> +	/*
>>>>>>> +	 * We already have the data structures intact, so try to re-initialize the device.
>>>>>>> +	 * This will be similar to system resume flow, except we'll also need to recreate
>>>>>>> +	 * kernel bos and restore kernel queues.
>>>>>>> +	 */
>>>>>>> +	err = xe_device_resume(xe, true);
>>>>>>> +	if (err) {
>>>>>>> +		xe_err(xe, "Re-initialization failed\n");
>>>>>>> +		goto out;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	/* Unwedge to allow userspace access */
>>>>>>> +	xe_device_wedged_put(xe);
>>>>>>> +	xe_info(xe, "Re-initialization success\n");
>>>>>>> +
>>>>>>> +	return;
>>>>>>> +out:
>>>>>>> +	/* Most likely the device is unusable and there's nothing we can do about it */
>>>>>>> +	xe_device_declare_wedged(xe);
>>>>>>> +	/* Drop local reference */
>>>>>>> +	xe_device_wedged_put(xe);
>>>>>>> +}
>>>>>>> +
>>>>>>>      const struct pci_error_handlers xe_pci_error_handlers = {
>>>>>>>      	.error_detected	= xe_pci_error_detected,
>>>>>>>      	.mmio_enabled	= xe_pci_error_mmio_enabled,
>>>>>>>      	.slot_reset	= xe_pci_error_slot_reset,
>>>>>>>      	.resume		= xe_pci_error_resume,
>>>>>>> +	.reset_prepare	= xe_pci_reset_prepare,
>>>>>>> +	.reset_done	= xe_pci_reset_done,
>>>>>>>      };
