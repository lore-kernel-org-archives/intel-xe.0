Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB73CC6B1F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24F210FC65;
	Wed, 14 Oct 2026 09:32:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C077B10FC8E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791970333; x=1823506333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J5rD8URNzoLA4fNByEJzMNnhRlfJQSnfmXM3qqSG3Zc=;
 b=L1LLWCWKlLATZ0/oZmqUAhK7pwVwGkCopG4bL91FnEa0Z49a9bwCxgB2
 5q2Xq/On2DF01oSA8HWjoNpfd5kTDlB4ToCktwfnsEyIFaQLT9RpwaCmG
 /LAgVTfCF5RsyQpjsY/Kev7mfuA+Y3Nr41cYQZt4fwcjEx1LQL4s6rVmz
 7qhRJ5XhouDvkFDDSQ02W9ylLF4a3zqsmqe8JEkJ02Hzj61rWs4mL2qhY
 jfBP+f1yyGdDEGrBL9eOjHBPzcGlwRPMkNsJh+A1JX0vUQYcYIFgP9xmf
 rg6xAxGJHmCgfLJB+2gH7tLPxhcjHjGswPJLtXvPQCd5kwGvUvI5pyp5Z A==;
X-CSE-ConnectionGUID: 40qJy99hQqyEgFAvi36JBw==
X-CSE-MsgGUID: RRYwi7/rQ6ib/XjqsMBBwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="597735"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="597735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:32:13 -0700
X-CSE-ConnectionGUID: 2c/k525MQwyGaYmyI15JpQ==
X-CSE-MsgGUID: Krgq8vmFQ8qdnTWpFSbp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1350520"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:32:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:32:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:32:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQRv5CO8hbTo3AEHBgwxhroUG+HlHR5T00QVDKgMyb26TL3F+NO+X/HaafvHKAvuVVDGEeoAdtFrgihBzhpEiVeJOGuIANARqQWKHrNLzUONSSRSL1Y0ic0issitJztasr4r6CslOLt08cTpzZTYy2WPDiYC58tVf4pWwlpwxLbFITvo9+6WiIAtX1N3RB25jhui8VDwXRxqASFUcl17kRUdUJJ+4RxW+WHHj5+mOOsrv3wJOdnB1vgv1DCeOQRJFD96K8Cl1KLNtHKLmF6fT3RhefrTl3aO41j78Z129ArcXf2XUJZ1imkM4TZLAcptJrpHzznLcTa7ptSmmtnkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZfd/eHZA8aKXbNr7RzHT4P3FbVhJ1D6dbluTgMBFZc=;
 b=vachoeiBA/1XFfLq+ZBYhS19/gr5H0c/hsOf22K6F3x5pO/xKV2YYtSiR/vLefOJo40mE/i0viFoVn1kujj7XHDK0lx6Exn9o02jnDTtBHmTxX3cX3AHjYqXoP5xUgPEyjPFnfoF4g0u+ESk4ShgLa3x4ikQYMA5KY9SFNNIn18+hWdnxrv84tuIY8C/pm+rWLjBbmBNOJHgkJn+gV6xjbkEwEEeMKVrMnV0Z1IkTA7dNzwgKw9S40r/raFfszEMdTMNHrWkhBKRHJ2YviQYLY6j1ZTZw8VAG06+MbxRXp+fkbJibZsVJocb4x/1SrhSJPkgxQRkyp1UBk02tyiR+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Wed, 14 Oct
 2026 09:32:10 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 09:32:10 +0000
Message-ID: <9b7c4e09-b258-4495-b088-8bc837bb1054@intel.com>
Date: Wed, 14 Oct 2026 15:01:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] drm/xe/xe_ras: Report soc internal errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>,
 <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-25-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261009104602.1075405-25-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0359.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b38d151-0064-458f-c75e-08df29d60565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261009223027099003|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0HbOdGCIILcQPekeAtO1nKKeFpoYI6O9zCVaqgTPm4kVqu6S0W8gVSnuG+9nQ7BfveY99qw1BSWIvsmAU4iVY3CecVuKf1YgmNT0w3Wb0iKgczF6QKYkTZ/JvHddSwxiMWDUP4l+vXLRxasab5MgdfVKTcLgBZEcz8+cjwVk47BxIeavZn05wv0FTKzHmXG/d9QJPMTc4WGlYgUVF3hnGv9vv09elvhKeXZ0ZJFw36zQ3bB/tPyQdvGEn5QaZNwLd8m0qGE20UmDzOweueL1iSDZfxXMLZx1HJFsFDK3AxRxvS0f+y5Lm5HzEI1LiE8/g69zj2Qrh+QPYBfAraGq4qDeeZcOeZ81ruHEvAz6nvdmcVB9RWSG5e4wN9Bq0Tvdo+gi1wW8ZyUygN/dPbe0Is1CTmEKYC4jlm0elVrgy7CqCNKr2j3L8OfazpJ5bd1xffiO+Hp7WjE/8abocOaASCcWr/hdMocfXdY90BPAiISZ8IJZAUJEKopBrkfCZqDbqCV+BuZbnXLxQHKQbtu6l+XgZr3izZ+MClAGwvasX5ioCwZg1xPG2JWUqS7rKOZXrqp8oEXqt9AFDCcJ6fAYKFLDviZk+krsG8N0N+u9ysuCKE0J8eANTUbo9L9H9xqUC3DoFbuyR9U/p8mLCHnLVMzK7FBQcTp7MAwbw3qhToM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261009223027099003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjA4VFhKbEptMEJPbWI1SVdtSUNEVDVpeE41amVrNllaVWh5YWVvcW04MjN5?=
 =?utf-8?B?VjJFZ2J3Y0tPQ0g5eENqSmw5RVBscmlUSWptNTdabGQ4b1ZFbEEvcHVDb056?=
 =?utf-8?B?UmQ5L2l4eklLa21TSnUzeldFMk1aN2VYUThjbEo0OW5TN2JXM3RLSU9SdVUx?=
 =?utf-8?B?N1MrQ0NIMkRaaFR1bXl4M0JUemNhckNGa1NWRkJSS3l6TE10S0pnSE9pbGsw?=
 =?utf-8?B?SlBzRHdSbm1SMFk3MFFNRXFEd0JXZzFSUnk3SjI0RnlxVXR6YzEwVUJZU050?=
 =?utf-8?B?ZURyYlh5enlnSTd3V0NpNWxRUzU1bWp4bHZWMHZxUHlKRXU0NHhyRHdlSVpY?=
 =?utf-8?B?czFwTkdzOG5aVXh2N1dzMXhBcWZCSTdFdnlpQU1hYjM4MUVWQXlBTXdXWVlh?=
 =?utf-8?B?SDM1aWJDZEtkbHR2SERBYkwxeG1oQ2JORXRSdmpjejBpWFU0VnRHMkZFeEVv?=
 =?utf-8?B?SWRhd05TQXA2Ym5jZ1BSVGw2UFhUcDRKMmw3clA2end0N2pFVTlOdGE1TFlp?=
 =?utf-8?B?TWR3S2ZyN2xoUDRRZ0NNV0w2K2ZlUDFjSFMrQVlzcUpMeEpFMG5iV2Y3a1d6?=
 =?utf-8?B?NU4vL3JRRlBGTnV3bFVQK3RxWjBwdHpzUUcrcExsc1hxRWlXbGU2MS9nbzV3?=
 =?utf-8?B?Q0ovYjdrelE2WHY3bHE1b1BnVGVJbjlmQ2lPall5K2hObjhRdzBRUG1xTlZ0?=
 =?utf-8?B?OWNpK3VpeVhCemYycVVjbzZjeTN4UU12N2xuM3gyMXdRTWJETWFZTDhEblVm?=
 =?utf-8?B?Z2l6QUxVNjhEU1BqODlGUHhIc1lUUEovdHEwVnNReElkZWJVVjBaaDh1bHZj?=
 =?utf-8?B?UUU1UGg5Zlk2aUlqRDY4ZHdrdVRHbVRmaDJUdGFFNHVyaUVmYWpaYlFYRldx?=
 =?utf-8?B?cFJ4bkl4TmxmQVo0bzhMRWdwMlYvZ0cvbkNWbFo5ci8wNzk1Zmt5d0g4eHdw?=
 =?utf-8?B?dXdKS1NnZ1JBMGJKYlJxalU2VUVLUHZ6R3JTNmRlNnJlRnoxckJrMFhQRGFL?=
 =?utf-8?B?K25NVFV0aUd3dHJOemtzWnAzZ2pmaWpEdkFpMTZaOVZJZmdBY1hnR3BMYzVL?=
 =?utf-8?B?NXZkZFl5ZTNFbW9vVytXMURXN09NOEJqTnFyMjRpbDJwMjFuK25ZMUVhd2tD?=
 =?utf-8?B?R3RucDlXU3M3clc5cWU2ek11cmt4VVJKZ3UybDA5Ym4vTC9UbTREV2FxZzFs?=
 =?utf-8?B?a2g4ZU1lTWgxdjZXVG5PNkVZR2VsR0NGMUlIVlp6OXJpR0tFVHM2c0NHSGRG?=
 =?utf-8?B?OUx1eWxGRy9MU09vdSt0d2JwSGlkMlEvcEVXYnkrUHlXbU9lL2QvWkNkc2pE?=
 =?utf-8?B?Y0VUc2pHVkpSYjF2WHY2dVpkbmdkaC8ydzJLazlzZlZlbUkxSnFINnFqaGVp?=
 =?utf-8?B?S2RpYzU1ZWo2T2tQM1lxazNXazlIQWx6VHViczRJL2loTWdUYmcrOHorays3?=
 =?utf-8?B?K2xXUWdDWU11Y25US1U0a0NSem9mWitDUnMvakJrcHdLdDJBZzJ6YStXcVVp?=
 =?utf-8?B?TDgyZmFBRFkrK1JSc2xpTTFITHFwVlR4eEhJVHJTNnBVZjlOMFUrSHNWbE5r?=
 =?utf-8?B?K2ZyNm42QWUrNFl1dklYWTBySXBZWTJJMmtjZ0xyS0F0NXlFMXJRQ1U5c1hl?=
 =?utf-8?B?VUNVWjJEbGpVb3JLbWdWSzhmdDFYYzN2eWdwWHZsTWhBUXZBeEhEcXQ4WFhz?=
 =?utf-8?B?SHVqS3BtYVh4RDhuUXJNNXBOQlJralhYMjBXWjlBN1A1NEYzWGIrU1lNdW1U?=
 =?utf-8?B?U09RbHNXd3hpUEc0S3p1d0ZuNG9XVVVrcDRydWJjODIvUVViK1A4Y05xRnZh?=
 =?utf-8?B?MzNzN0tCL2ZDOURqSjJUWHY3YkZlSkZ6MzZLSTlnQXh6ZUtQcTVHNDVRWmIx?=
 =?utf-8?B?cGZlRlRRTit6ejV5YVNXY3Iycm5xK3BrUmZWVzc4Q3dvUFpMY0M0aDh3RlJN?=
 =?utf-8?B?dXhDNGk5bWtlWWd5SWFlekdDWHlORkJFbkVVK1h0Z3lQTUM4c00vYnExUkpB?=
 =?utf-8?B?ZGdWVE5HUFBYVjdCc2JiUlowNEtRbVRXSWRQUmlPdEJBeEtJTUlRd2FhRDBH?=
 =?utf-8?B?OU1yR0V4ZUc3eWtvQ0F2Sm9ETGp3MnI0T0dnQWZDWGFQK3IxVExtSkkzSTRQ?=
 =?utf-8?B?N0RhdlVYS0JERzczN2FLVVNlcThaaTg2bkhFaUZpUHNJQWxuRjNYUTZpaFcx?=
 =?utf-8?B?c3JtaFNac05XemcwZlVwdDIvYXREY0RhcFdWbnZ1c0p1ZGdqMmF3WEZMNnRC?=
 =?utf-8?B?b0krcnU2VTIrWEZzSFNMQTlaK1R6VW1xb0lsU0RxVDRQalMrakZtQTdvMEtK?=
 =?utf-8?B?enptRE9jTit5Q2ZQVzBkVitQeVNWZDc4Rk9KeVptS21Jcmx2Nk1WY1c0bVl0?=
 =?utf-8?Q?AdL9EcrIi4QIvMJk=3D?=
X-Exchange-RoutingPolicyChecked: DDTSKjqcruvZKksvCgQL6C9AA7fIDlxUIZMUyjhK9EU60Wh7B/3GZPaqLpUJnqyTkjr5Wbs8mVQe00yQUEU5a13uMwsCKZ0RDsSD9OGa+ZnRZV3FXaT594/irD8WK8AoG33rJIMEvWqhDSuK7ZdSNrGJ+UVV+GXmF4Apcq11NusEVMIfayQsQD8i8jgqLRVH8wAf2zgjB61LPZtI+velQRMl8HC08Mw0/T8RQ75GCOoz6ctqGoBF9fiXmF1Ipq2ktuYhqO9VbNU2+7uHnJ6FbJG2dFvHW9tOa3l+/g9Ywv7VYajXnE8hZotBqz/EBrf8e1vxPqo89deD6qDvQo2IGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b38d151-0064-458f-c75e-08df29d60565
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:32:10.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWE3NPdisUNp3zl9GE3hnzp4uKUVaoJf5lnT2SKS2cSY11Zv1kop67Ti0eHrBwpvAF86Nitjv4ageuCEScMX79Ksk99jyScQlgNToy89wOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
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


On 09-10-2026 04:16 pm, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 6647300c7f17..af2970941b59 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -366,7 +366,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   {
>   	struct xe_ras_soc_error *info = (void *)arr->details;
>   	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>   
>   	if (source->csc) {
>   		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -380,9 +379,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		 * is required.
>   		 */
>   		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
>   			xe_survivability_mode_runtime_enable(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
> @@ -390,9 +388,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>   
>   		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%x\n",
> +					  ieh_error->global_error_status);
>   			punit_error_handler(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
