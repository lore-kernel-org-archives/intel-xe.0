Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78230C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 15:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299F10E579;
	Wed, 19 Aug 2026 15:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmjgT+/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7703710E57D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787152095; x=1818688095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qBwd319ETDON4rMt/Y0wlAdTx/HSt7rsPHzK+GU1S94=;
 b=RmjgT+/G6G+1z1v8PqxbbFCV2cTzJQaF8466eVUouYKuJQKK8ODGvsxR
 4dlTk55q/Bqk0FBJqidPbO0UJaZIUOucSJOcRo1B5vcsfMPgOp5Q5+0t3
 PyCjDcE6AV09/WAfqlMd/26rKRzi60QIFIEjwvBpuuGWvFG3MNqiHnWmd
 D5EQw67ICXOLMwGkBczfQiZE9Wcxn0qj+0jRW6kT+JTu4m4/Dldfh1iiX
 LEOmWfBpc16gt2ijjEBejF8EM9aVITZVIemRRtY8gUnWczPxakImxfDLs
 4eyo3Dr+n/GOcAZ2Xh+tFdsugxNx3uy9/hqQm1la2k3LxhQmGuUlS6nMx Q==;
X-CSE-ConnectionGUID: 3jMArXJGT8SVAAQShCChAw==
X-CSE-MsgGUID: UNQndX/bQZ62jvbJRq6Ctw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87527536"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87527536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:08:15 -0700
X-CSE-ConnectionGUID: Oce5Jr35RyGs4PtZ9pWTCA==
X-CSE-MsgGUID: XGZJ34YWToOpvNt3pVQYiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269871558"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:08:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 08:08:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 08:08:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 08:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuQGaxvZtJN1NdERdR+fAzXPNYSrxHMqipr81oNn6jrtzrI8Uga/Y+rKYQnKU+F+8J4ZTATFEzNAkRgNOX7mg+l+EL5O9cekjNBqFLR9z8noCNUltL+lVgNrY2iQpqlx8oikweigwR6iYlHe2s/UexwJPn/FE1HjTFOQyX8oWqqU46YhDcnOPy2dYESZov9dtYGe27pmVNXqbM3RFBvK/fBWnK1yhEtC4RDgda4Jb8eatfAuok+fh0W17mDMcTQxm9xosapiUJ0m0N8hXEmihUmH7b4hwriSCnJZm9WIOjmUbfI/Jepp942m5MMk6Px8suXOzO04xgO3ndtid7akXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgCkIDLMRPB8mNMRAcz12gIszGvwvTXfPIFuMYFYfiA=;
 b=Tz6mIYaYBRXCV3horwq/vcvO2L9pC6X3PjN+og+KmqgFNa7sDqv9I9/gukMxrhw1F813rysRgGlPycGXoq4CXd8+R5ePMdnqFSeU8i6rOAbM9E8wyikU/DCwzxb8xjkKtov3lq86Fkmiv6KQXhiooyyUkK4nw4gAql1/YKK6jZQEPm6+TRkbQjvirqYZF05xS6133SKtp8V9mJcEV99NvlmVJopwNZ7Yf6saiYfpBoGXdnkCf7KRQ7baMIhBhixjh/D4xo2ROwz8KR4iHr212Om/dsFOQsQCxQHBo6rqT1Ct/xKrZZ26aGQVB5TKLZyoTIJOZteg4pA0X9UGVw9EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH3PPF179F31853.namprd11.prod.outlook.com (2603:10b6:518:1::d0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:08:11 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:08:11 +0000
Date: Wed, 19 Aug 2026 11:08:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Message-ID: <aoXG1oSzMbJHvfoz@intel.com>
References: <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com>
 <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
 <aoNhZwRGQC2uh95n@intel.com>
 <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoRWO88_jtfv1V-g@intel.com>
 <8ceaee0e-cd24-4382-bb45-c59f9444e6ca@linux.intel.com>
 <aoW6dfdEwGLgJPzj@intel.com>
 <f358965f-e801-4152-b82b-3228022a353e@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f358965f-e801-4152-b82b-3228022a353e@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH3PPF179F31853:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6c73a3-264a-49c4-0fed-08defe03aee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|10067099003|5023799004|11063799006|56012099006|4143699003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: Y69A08PuWhc1lL9qfyByczV4WMsrOTRGhQmw0EquBJKADL+iktZSnAJExvG5EX19OsET+4v5hSmgK0KVjbZvHvxDuO4cxqoJQ6xTfUFozHjFKrldKXMdy+1NQvbUKvkTh9Xx1LcjD8kiuW1wkfTZGuzAYVrTu95AycnQlmCT+3Oitvf5NQwpByMI0pyatJZhPowwj5QgIrt/8Tkdn6t5FNLYD2gVfWCjRIdrfqX4SwScpaxsfX4fwdGyJvsJDigJdBvnOZBelkQGUDjETNOix4nBqXnsQ1/MEEZR+AtW9jQcymbIiDe9atrAKbhfG1JIvLdEYBYDqQPl/kHcRw+UwaWt0XqMrH4Klak8+V3QA/YsDuKxXoycw9WGzv1Akro4oWcyAKOnoSTZ1btRqRwZYhigAQLz5YEqCWdSasiPhrWdByKTa76Z8HAnc71yPBHTqz8BmuTDdBcBvQcDMPCeS7rN/qiRJF3vHAzrQwXgwa4+0aU8nk3iZR6i1wHWyDYoLhuc/Pt8YfLMGyCo/qi/kLg8clp9SPljyUQ+4ZxDIp7mt49H2RTnM8PIYzPvfoM6b9ojC9So19lfwSXj/oQ//2dJnCGWU84E7pGC48aJabkdnsWlhyH3jBw7Z8u3xxXS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEU4S1VXSUZwYVFubDlpcWdBWFh1cU9qMXAyTlJ2ZGY2RURtMmtTZEdmWDlM?=
 =?utf-8?B?UUpQSEw1ZmtPR2l2QlY3UVJKb28vSGg3OUM3N2RUYzVkaUl3Q2JhQVRDaldm?=
 =?utf-8?B?ZU5VTnBMVW1wb0ljMnpMU0x4aytWMTBoaGQ3VVhoZkoxa09LaFp6dVl2aVlD?=
 =?utf-8?B?TGt2UGQ0OUxRWitrMWJVWWhhWWZiSzBrbzhKb0VJNzk2R1hGdjNlcFZRUGxn?=
 =?utf-8?B?bUxzY25IUUFvQUhXZUw3MXViWjlrdG1mMVpEWHhYUGs5ZXJnZ3hnWlpncmZz?=
 =?utf-8?B?SGg0ZGVKQ0pMcVNXZXBBK0lnaEN3b2hhZ3IvUTNkc0dmMmFvbWJSZ2M1cGxz?=
 =?utf-8?B?Tnh2MFloK3Z6V2U4YmgyMHJOaEM5c1pBTmVQN0xCdXQ1UU1DT3R4d2NNSTZs?=
 =?utf-8?B?TGl4enhjd3JZc2NZN2NjTkVlNmJ5VW5QakxzRUtlMHVUaWhTWUd6T2dBRWdJ?=
 =?utf-8?B?Qi8rcGNUWmdoNzI3d1BqTlhUZmVZWkRkNngwQkJ1L3RyYlg3UnQ5VWYzcWhm?=
 =?utf-8?B?UUwyaGtuU3pRMDRaQU03WU9ETkZIaEZxbmxtYzQ5d1FuTS8vRUgvTkt1QUlm?=
 =?utf-8?B?MEZnZHZlcGZORGVidEFOUXNUYXllNnRoOU16WkhVV1JwQnU2RVE1ZERSU2dq?=
 =?utf-8?B?WGJPRlQ3RTU3cVhzdTZvZmhtNUM1RlBuRHZ4dG9LQldhcW5VeEo4RFpLZ05E?=
 =?utf-8?B?clkxMEo5T2Y0NmM5T0JtWjY3WUF1cXkrMG5vbStkNEJVN3VkOU0wVGpIaU9z?=
 =?utf-8?B?eFp0NG1DRnV5MjViWk5MZlZRN25veGlhWDM0K3lXamNBUW9yVUJCVFlTWjZ4?=
 =?utf-8?B?czhjTWhyc0wzRmFiR1dUaW5NNmtqS0ZhRUVreEpST0JDa0dGaFllMjNxWkZi?=
 =?utf-8?B?UVJhdkxYckoyc3lzUG9ORHhjVC9vazkzdzVack5qSWppM2NWUW9oQ3NxcFZ4?=
 =?utf-8?B?bGF1N2wxc2RXelNPZ3Z5a1M3RzNsdUJpZlN1WnJZTVFkL0JYL3dOcWFiWlBY?=
 =?utf-8?B?UU0zSFBTOUlraU1uNi9LdkZtTk9OUm5pOHhKVTBBTHpyZHRkNlFjcktaei82?=
 =?utf-8?B?SVBBbGJQMS9MeW9UU2FUWGRwNmlYWXBDZ1dDaU5vZ2F3T0c0MjF5RVppWEtE?=
 =?utf-8?B?UnNQdG5KKzd4cXRsVEJhd2RCMy91UXNaK2xqVzlHRnpJRHNSR0JLbjB5RlN4?=
 =?utf-8?B?aW5CSUQ3K2VoSHRhYS9SZERoZkpZWS9PUTgzN21JbVYxeG41WCtwdHdPYlND?=
 =?utf-8?B?MXRaUEs5TDRkWXlRS3Z4WmdKbUdwcmJ1YkphMXZ3NGxqVEh1elNDSTR6eVRw?=
 =?utf-8?B?QXJkZmZob3laeXdTM1FBaUdHcWxXSTRhSjBuUnk3MURDYW50b3ViSmNsK0ZF?=
 =?utf-8?B?a2YxT1lZV05kSU1TWHJmQTNhd1F2K0lPSjR3cU1mOGVrNXQ3RDdQRWx5S01X?=
 =?utf-8?B?UW4yeGtNRFN0S2RkdmZtVXMwbmhjS3V0Q2crQTg0L3VVSVNUeGZiaXI5QjMx?=
 =?utf-8?B?VWhRYjJCQXFScm9oR0wzRnFxRnlVczdtYjI0MmxaL1BOaks0bDRZWWlVNld5?=
 =?utf-8?B?NlRvZXNLUVp1NVV1SFROblIzZnowRHB6aHAvZ3g3c1U5Y1QxdjBIcTFSditN?=
 =?utf-8?B?NkNmaFUxYWdjN051eTdsV2VLOTlrZXJyaDJXbHZ1aGMycEhoSWRCQmNidUlq?=
 =?utf-8?B?MU1IQy9HWUlIN25zZlNISDBIbExsUlYzYTBzNEU5VU50VnV5Q2swTjQ3T3BN?=
 =?utf-8?B?L05qOHNtRVo0NXk2S2I3L0pCb2R2Y094K1VkQ0cwV01sQkozWmhJMDZPODZr?=
 =?utf-8?B?Rkw3VDVoS0JTMFBtSGJmY0dKeFRsUEgwbEhQODlqektlRk1hbnkvZnBzM3lr?=
 =?utf-8?B?SEJHY2RXOVYzZThLWEt0SHdDciswUjhXUlVTOHJPcytIZVp1Y3Vjc2ZHTU9i?=
 =?utf-8?B?VkRGMHlSaWpwd01yUVVyZUhpTDhLenJGbmtTaUhETDZZTU85NXJSNE4rNlBE?=
 =?utf-8?B?K2gxT09zT0lLRS9XSG8rR2h3amFwMmxhMkI1QVpyUWdCaG9Sa1lRRjM5ZUhS?=
 =?utf-8?B?L3BDdW8zNHBzU0doTnZubUxwYjR5Y3J1ZjQxV2J6MS9uS2cwbTE1cWdKVkZ0?=
 =?utf-8?B?TnR6YWVBcHRsMGhIZEZwSnN6L0EycktNbUVMTEFXdkVLa08wT3ZVZWU5bUho?=
 =?utf-8?B?d0YrUXoxN0FBT1JUcnhzb291SVEyS1RGaVl0b1FKNWxwdmFZenNIWW95c2RL?=
 =?utf-8?B?dEFGNjN6Mm5tOElhMGtnTC9JWlQ3QWhQMXV1a29WUHRFanphQml6SCtzQWtC?=
 =?utf-8?B?ZVZ0QlVLK3pHUElaVEpBVlhRZGowOHM5Tlk2RHFIOThnTmo5RGlCUT09?=
X-Exchange-RoutingPolicyChecked: BcMGzenk098VXHHhUCf4wG+AoUQBRlkcF3znejlE2iWKbJ4ouwSwVGXdkVfEUyU4vrWDb5NXhTvQVs6hK77yvy9NMFs9q+SHdZv6+xyEyfv1949PMCtwxKGA/JBc5b/f8oupUfU8mgl/X9mSCAsQ9oEHrX4Z8ccMMhkHOIVEbu6Y2m4Py4KkwCPK6ocW003o75PjGGRE9mAyBIFOSOpfwlBOWtEJpk4X7fwk3oQRYMXZDl3tWQQg+uQ6/8ffyb+OSd/czNVol6Dy1Oa+nS3brwUEYuI8H5tDqO73BQbHysuL1GWiKlVRRZYEO1uMWWdZZIH6Uw0S02v83pgr3uDHgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6c73a3-264a-49c4-0fed-08defe03aee8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:08:10.9331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNUYrbrMtrt3/a46hAs5/EHDwhFTiMCcFRdYaHV7CkO6YtXV9ncSu/bPfGlrKec6NrGJPfO0mpMX6EnrniSJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF179F31853
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

On Wed, Aug 19, 2026 at 08:19:38PM +0530, Aravind Iddamsetty wrote:
> 
> On 19-08-2026 19:45, Rodrigo Vivi wrote:
> > On Wed, Aug 19, 2026 at 07:20:30PM +0530, Aravind Iddamsetty wrote:
> >> On 18-08-2026 18:25, Rodrigo Vivi wrote:
> >>> On Tue, Aug 18, 2026 at 09:08:46AM +0000, Upadhyay, Tejas wrote:
> >>>>> -----Original Message-----
> >>>>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >>>>> Sent: 18 August 2026 01:01
> >>>>> To: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >>>>> xe@lists.freedesktop.org; Thomas Hellström
> >>>>> <thomas.hellstrom@linux.intel.com>; Ghimiray, Himal Prasad
> >>>>> <himal.prasad.ghimiray@intel.com>
> >>>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
> >>>>> pages
> >>>>>
> >>>>> On Mon, Aug 17, 2026 at 07:09:46PM +0200, Michal Wajdeczko wrote:
> >>>>>> On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
> >>>>>>> On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
> >>>>>>>>> -----Original Message-----
> >>>>>>>>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >>>>>>>>> Sent: 17 August 2026 16:57
> >>>>>>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >>>>>>>>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> >>>>>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>>>>>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> >>>>>>>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad
> >>>>>>>>> gpu vram pages
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> >>>>>>>>>> Include a sysfs interface designed to expose information about
> >>>>>>>>>> bad VRAM pages — those identified as having hardware faults
> >>>>>>>>>> (e.g., ECC errors). This interface allows userspace tools and
> >>>>>>>>>> administrators to monitor the health of the GPU's local memory
> >>>>>>>>>> and track the status of page retirement. Details on bad gpu vram
> >>>>>>>>>> pages can be found under
> >>>>> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> >>>>>>>>> since those new files are xe driver specific, shouldn't we refer
> >>>>>>>>> to them using
> >>>>>>>>>
> >>>>>>>>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
> >>>>>>>>>
> >>>>>>>>>> The format is: pfn : gpu_page_size : flags
> >>>>>>>>> kernel documentation [1] says
> >>>>>>>>>
> >>>>>>>>> 	"Mixing types, expressing multiple lines of data, and doing
> >>>>>>>>> 	fancy formatting of data is heavily frowned upon"
> >>>>>>>>>
> >>>>>>>>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
> >>>>>>>>>
> >>>>>>>>> so to follow the guidelines maybe we expose the separate files:
> >>>>>>>>>
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
> >>>>>>>>>
> >>>>>>>>> or
> >>>>>>>>>
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>
> >>>>>>>>> |
> >>>>>>>>> +-- vram/
> >>>>>>>>>     +-- page_size	u64
> >>>>>>>>>     +-- bad_pages/
> >>>>>>>>>         +-- count	u64
> >>>>>>>>>         +-- reserved	u64[]
> >>>>>>>>>         +-- pending	u64[]
> >>>>>>>>>         +-- failed	u64[]
> >>>>>>>>>
> >>>>>>>>> then
> >>>>>>>>>
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
> >>>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
> >>>>>>>>>
> >>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x0000000000
> >>>>>>>>> 00
> >>>>>>>>> 0000
> >>>>>>>>>
> >>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>>>> 34
> >>>>>>>>> 000
> >>>>>>>>>
> >>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>>>> 35
> >>>>>>>>> 000
> >>>>>>>>>
> >>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>>>> 36
> >>>>>>>>> 000
> >>>>>>>>>
> >>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>>>> 37
> >>>>>>>>> 000
> >>>>>>>> Thanks for comment, this is documented format by design doc. Sysman
> >>>>> also depending on this format. So I don’t see this can be done without design
> >>>>> being changed for everyone.
> >>>>>>> Internal design docs don't superseed upstream documentation.
> >>>>>>> It is the other way around.
> >>>>>>>
> >>>>>>> But also, the files will be there one way or another. Both paths are
> >>>>>>> valid, so I don't believe that change in here force changes in the
> >>>>>>> userspace. Although, yes consistency is good...
> >>>>>>>
> >>>>>>> That said, I don't have a strong feeling for one way or the other.
> >>>>>>>
> >>>>>>> Since we are adding to the device level anyway, I believe it should
> >>>>>>> be okay. But Michal, do you know any doc or any precedence that kind
> >>>>>>> of force us to go the other way?
> >>>>>> hmm, are we talking here about the attribute format or folder layout?
> >>>>>>
> >>>>>> if about the latter, no strong feeling either ("files will be there
> >>>>>> one way or another")
> >>>>>>
> >>>>>> but if about the former, then the same documentation [1] earlier says:
> >>>>>>
> >>>>>> 	"Attributes should be ASCII text files, preferably with only
> >>>>>> 	"one value per file. It is noted that it may not be efficient
> >>>>>> 	"to contain only one value per file, so it is socially acceptable
> >>>>>> 	"to express an array of values of the same type.
> >>>>>>
> >>>>>> and my proposal with separate files meets that expectations (there
> >>>>>> will be either single value in the file or array of values of the same
> >>>>>> type), opposed to original idea of array of offset:page_size:flag
> >>>>>> tuples
> >>>>> doh! I'm sorry... my comment was purely driven by the other sentence above:
> >>>>> "since those new files are xe driver specific, shouldn't we refer to them using"
> >>>>>
> >>>>> But now I looked at the content o the patch itself. This patch as is is a BIG NO!
> >>>>> It is against the sysfs rules. Period. Internal spec and other components need
> >>>>> to adjust.
> >>>>>
> >>>>> Also please do not repeat the same PVC mistakes with tenths of lingering sysfs
> >>>>> entries. Organize this per directory as Michal told.
> >>>>>
> >>>>> Another thing, make a design that is future ready, use 'vram0/' as the name of
> >>>>> the directory with vram0 stuff. Like we have freq0/ for instance.
> >>>>>
> >>>>> Perhaps even
> >>>>>
> >>>>> +-- vram0/
> >>>>>   +-- pages/
> >>>>>      +-- size u64
> >>>>>      +-- bad_pages/
> >>>>>          +-- count u64
> >>>>>          +-- reserved      u64[]
> >>>>>          +-- pending       u64[]
> >>>>>          +-- failed        u64[]
> >>>> Currently information shown under vram_bad_pages(looks similar to what other competitor's  bad pages info shows), actual gives data which consumer can extract directly meaningful info out of it. With above approach, consumer need to make one, which we need to discuss with other folks. Lets discuss in a group.
> >>> 2 wrongs don't make 1 right!
> >>>
> >>> If you don't believe in the reviewers check the documentation yourself:
> >>>
> >>> https://www.kernel.org/doc/html/latest/filesystems/sysfs.html
> >>>
> >>> "Mixing types, expressing multiple lines of data, and doing fancy formatting
> >>> of data is heavily frowned upon. Doing these things may get you publicly
> >>> humiliated and your code rewritten without notice."
> >> Is my understanding correct that the PAGE_SIZE limit and the "one value
> >> per file" guidance apply to regular attributes only, and that a
> >> bin_attribute is the sanctioned mechanism for streaming output larger
> >> than one page (via the off/count arguments)?
> > my comments were based on this below:
> >
> >                |>>>>>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> >                |>>>>>>>>   max_pages : 10000
> >                |>>>>>>>>   0x0000000000000000 : 0x0000000000001000 : R
> >                |>>>>>>>>   0x0000000000001234 : 0x0000000000001000 : P
> 
> My comment is about this format itself, as i understand one value per
> file  recommendation is for normal sysfs attributes but binary attribute
> can emit multi line as I see  error_state_read attribute in
> i915_gpu_error.c and gpu_vram_bad_pages in amdgpu_ras.c are using it to
> emit multi line output. Kindly let me if my understanding is wrong.

when you cat a file and it shows a 'string : value' I'm afraid it doesn't
classifies as 'binary' anymore.

I don't want to bend the rules and again, 2 wrongs don't make 1 right!

> 
> Thanks,
> Aravind.
> >
> >
> > But if we are talking about the /sys/bus/pci/drivers/xe/<bdf>/ flood as above, then
> > it is a big no from maintainership side. We are not doing that. Let's not repeat
> > PVC mistakes!
> >
> >> Thanks,
> >> Aravind.
> >>
> >>
> >>>> Tejas
> >>>>> Thanks,
> >>>>> Rodrigo.
> >>>>>
> >>>>>>>> Tejas
> >>>>>>>>>> flags:
> >>>>>>>>>>   R: reserved, this gpu page is reserved.
> >>>>>>>>>>   P: pending for reserve, this gpu page is marked as bad, will be
> >>>>>>>>>>      reserved in next window of page_reserve.
> >>>>>>>>>>   F: unable to reserve, this gpu page can't be reserved due to some
> >>>>>>>>>>      reasons.
> >>>>>>>>>>
> >>>>>>>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> >>>>>>>>>>   max_pages : 10000
> >>>>>>>>>>   0x0000000000000000 : 0x0000000000001000 : R
> >>>>>>>>>>   0x0000000000001234 : 0x0000000000001000 : P
> >>>>>>>>>>
> >>>>>>>>>> The sysfs binary attribute is created under the PCI device
> >>>>>>>>>> kobject when the platform supports it and the configfs
> >>>>>>>>>> bad_page_reservation policy is enabled. Uses RCU-protected list
> >>>>>>>>>> traversal so reads never block normal VRAM allocation operations.
> >>>>>>>>>>
