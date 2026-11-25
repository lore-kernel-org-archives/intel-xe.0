Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A7606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nY/lvCkO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kWW/rG8g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FBF10E28C;
	Wed, 25 Nov 2026 06:34:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90CF10E28C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795588468; x=1827124468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74suTzvyUINkR6p/ZIP8NQguuqiNrUanAQC+zn3JofM=;
 b=nY/lvCkOzqDyMGK4pZUn0Y0LKc9Omicqd65FtDxQY7gz4SXXjo7rfPS4
 ZKwONNaqJAlgm+Hb2FeK9a0zm0kE5EIsIe9AE67d0LVngWtTwuHIvFPJU
 SW1o5RG6xVZ5CnxfKz7xhcOnqJ4C8mwzAI9xi8QHYBwTlpRXATACiwmcs
 oZkPvxV8mnhDGXKQw2yMw7EVrDh8C9N1+Kwf+nx29io65dv+p1GPkjuCH
 JXl66oYXSOh5AdPqacC5FnE8A8JzOl9p9y0FMJCf4KKqD/fGi9OQAqmyd
 zjYgy4KYwFwggxWw2yJJdrcukx5PC9L+B+ZhzOYQZIDr0Q2cz560oKFnc w==;
X-CSE-ConnectionGUID: a82WAMOKRAWfBRMZwGPw+g==
X-CSE-MsgGUID: RAWDVs4lTKeAPMs8Pr76Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4355515"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4355515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:34:28 -0800
X-CSE-ConnectionGUID: qRQszqYjShGWeRB+V6ALWg==
X-CSE-MsgGUID: Vfehv/oFTDOPS3cuynBXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11791766"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:34:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:34:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:34:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:34:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0ELXwoujET8uYbV9LZ4TFeLgZG4iY08v1ugu7JKwLW00ohu7uQ83CD+6O9bNM/+0/BccX0TRTfH6GR/d1OyjQX5Ku8kU4lfXvo1Va+fxvKZ2aR0H6FcRNYE0i6hlYsY8+pPcZt6GWEaZTPG6owdxgyepnpqI5ZviezLUGJelsj/0UbxjAJsNoAkgQna+FQFpXORuH2Qn2VABZalSAoEknKgm50D8ytwKEzLVu+A3Sh4ooUETQCx8TCiUFmYRILZ+i8hJ1tu2IwYvppxRt2GFxwjqRMe9170vQraAQ6vISPK4oc/Z1dA19UMW+ytp3hKMM1ZErglZMydY1C+ZhhgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMkfuqLZVR6ObVgGVVlJlJ+xlHBKZFLy05tAcc6bjqo=;
 b=CI55vuaikSKpewF72ZFUgKviegRoZ1XR83P8aRard1d+x8vCkcCfjxMn6e6EYFjtwFP+1+KTD8NCUzaeyopXu6HATuTKkzKMuykQdQP3rfWx2kWWRjq+Vxc5UAR5lHy1ZCbXm+r7V5I+2ykjBE5mjK/HFuFGrThoO9ULkJj/+vUCno8tCZiHUe13UvS8xNjTnIV5GspiFSSWI3F8dsYDKw6W1Hw1ZoTiJSPC4LbntBumyByvl69NXnlHUfHyHMWz9oAMQMHs2y8QWAhLNB2eb0j+pghNGijYjWoKDdX4b3hqUg0OkcdNCaywheNVvpiaXk8xjrOZQJJYov5DJaRkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMkfuqLZVR6ObVgGVVlJlJ+xlHBKZFLy05tAcc6bjqo=;
 b=kWW/rG8g4AaPrYrOrVNpZCUkTmg6AqVpKsLr5wy8evc5Cei3I4yNA8sKG1mcy1oPjPqzx85zX6hJWzZLABFo+CobaVlNbd2fRMQXLd+YLivgRHbsaceVJHINVb4ROh134f1u8Cuyt5f6vMCyoQwpsr0rDjV6tXNX7qlN5tpKqCs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 06:34:19 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 06:34:19 +0000
Message-ID: <1da84796-2141-4cef-8b11-7f2c07178cad@intel.com>
Date: Wed, 25 Nov 2026 12:04:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] drm/xe/oa: Fence OA ioctls and mmap against
 device unplug and wedging
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
 <20261124201150.405479-14-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261124201150.405479-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0293.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::17) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 180c4840-5794-4d26-7301-08df4abe225f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|261009223027099003|22082099003|3023799007|4143699003|5023799004|56012099006|11063799006|261026121527099003|10067099003|261022075727099003|261102123227099003|261021121427099003|261022113327099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: Og+oyX6z4O70y8cDU+U7/XJhnZQzdiyB+2ejdcMp+I3l/Z4gVArfVVdzMV1VqUSj0Moq0Ws3tOTCL29cNRkcUxet2hZod3BL46xIGQLbwMvUQj/LLqnNHXfutEQ1vlEjld24XH7kk7pl9PnVs5oiLZUkDT2D1sZjdWDc+1qlPGwH8it7Ypf+91kh8fcaS9W02lx9QKvjBrd9pPYpZoq9zKywCvS9KknB0Ru6c1F0ZVhZH2aBz3kIK0RU5rprlxB1h4JppFursrkedPDt9bJqFbWnXhZVMUuxwF8QEVM8c3DCsVMxAGXqe+YG9PdxpZ1u+m2pESqc+FnB2ccoLXlk9kLT15JqfoDI+4oM7og5eVLaCRNiuBNeP96DDqJydFk3I9I9qyIRtJBtR/45egxYWbQXrwh1ymC8g/vxTZZCFJ7tuZ97eoxSgeU/M8tdyx5OZ5CEcDsITR5f1zFVQt0PesKneRev9hKnycE95X9UUVeWEz6epT1o+302J18F3ZZJHVgWxl/Z3/V2sgj8VHKj6p2pP/Whn8dmptWNwnWFesdWYDwq2iTUZIdg+3SChdyadaQ2D5yrFRyHzzq2wVePvuuLPw+Yj+6by7jf9cflrBt0vsgJsnN1nEtAM6kNPdGj0hqlbVlPDsyrESWJHgGsDY72gkYPdVWJjZiqVdYn6IA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(261009223027099003)(22082099003)(3023799007)(4143699003)(5023799004)(56012099006)(11063799006)(261026121527099003)(10067099003)(261022075727099003)(261102123227099003)(261021121427099003)(261022113327099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldPSFc3Q3lySkpsYTc3T09TaFF4RVdidnE1K2lNSzI1WFlENmZZRDNIbmpP?=
 =?utf-8?B?V0FaNVRreTRyRzNIMGxCYTdSQ0dmM1ZMYm9hZG14WkNUR2NKRnk5Vjl4RFdM?=
 =?utf-8?B?eTdMMW9RQm00RjkzZ0JlMzY5OXZ4Mi80cmxLcXhLOGp1amsyallzMlNPdXBD?=
 =?utf-8?B?QUJueUtXTUUwT0tBR3BwUGVHN2tQZEFuMEkxTWZWQXluaC9teTl3b2FuWnJq?=
 =?utf-8?B?K0xYVUFrc2Q1RnJvN1c0NnFETUNDcXlHOVl2MU1rZlYyd3dUOEpsK1MxcG5K?=
 =?utf-8?B?aEM0QVExbHhvRmIzT2pvUjRVS1lIbFdxTDh3OVhDQUQxZFFEcUtBVUhybHZD?=
 =?utf-8?B?SlF3MzQwdnR0MC9rS1lJTVU1Zitkekw1c3JxcHZsRjYzb1Q1S0N2MzVSWTVK?=
 =?utf-8?B?ZllES3BOUzJxNHZ0VnViWGhKN3ZlM0RDQWdKZ3R6MEsrVDVRS25adm5remkx?=
 =?utf-8?B?cDN4V1o5cWFNNGJiTGpVVE5YUGhHdE5SWWZtcFh3TFpZem1zeitRVmYvR3Fv?=
 =?utf-8?B?ZXBNRXBRWjd5TnBkMjF6RkRyVDNHVWtMbDN5dTRBZXJoM2dISTdZUHAvN2Fw?=
 =?utf-8?B?ODhSL0o0WGJBeGRnQ2I2eS9OQ2dPQWRCRjNpcDVYMzRIN1JNVXVTL2J0ZDZV?=
 =?utf-8?B?enE4d2hPZC9xQjhJNEdRSXBBOXZwQVdLSmg3aXJ5bFFWL2ZpY005S3VnWnpJ?=
 =?utf-8?B?blgweHdtdWlySC9XNXV5d0hla3BwVnF3cWo3SzIxajBEYmlYYmJ6aG5UaXlx?=
 =?utf-8?B?Vk5BYmgrTzZ2M1h3amZ0QTRXdXRHc1hoVURER2lpMUp1WTIybXAxNmU4UDEv?=
 =?utf-8?B?Mms3M1NWTDJpY0h1ZW4wUmU4cFZOSjIySll1UVhRZUZodHAya005b21UajJJ?=
 =?utf-8?B?UHFpSkdxQzVNck41cFNuWG9LVEJaejlUMEMzTTcwbEppNFRvUUMzU0tiWHYx?=
 =?utf-8?B?eFNoeXBKTnJmeENGbjBYdElzMWp0cFo4ak5OV2xrK2xYaWpNaG9IaDVKRnBa?=
 =?utf-8?B?Qm5SdGIxNldUTlRUcWxrYjhZaTA3SXhDSjNaSWgvVWx1VkYzNEk0TWJpRTBh?=
 =?utf-8?B?ZXNZQlo3YXAzRVQ2WlpkL2xjdGZuUG1vNlFzSDd0S1EwaVpJeFFSUG1RRTUv?=
 =?utf-8?B?NlF5U0ozMVZVY1lvby8wYnI3TDJjZjBid2t1NlZjK0JBSzZ0bk4xanNoUnAx?=
 =?utf-8?B?VnZ3V0hSVStlakFNekVwbFMvRkZxSTY5ZDdzQUpyNnRubjU1OXFLcmtET1lK?=
 =?utf-8?B?aUgzajdsY1VUU0p2Y1A2WTBwQVdqR284Yk5rWUpLZS9abS9XL3c5WEdMd2xz?=
 =?utf-8?B?T0w0ZVJSVHZlUm5mS1ZEa3k3V0FXeERhTnp3dUZFanllRE9yV2NXczBzMnhi?=
 =?utf-8?B?dS9IWnJGKzVQMFhpVEhUNjdRTmlKcU84OFBrL1pvVXcwS2pxR2VRRE5GblFt?=
 =?utf-8?B?a1ZTRWNmTjJhN3ZqZ0k4eXF4eFBVdi9ub3hqU2pkV1FDam9TTEk2Mlh3WGda?=
 =?utf-8?B?M3pNZ3VJZ3BhOFZlTnVtM3pMT0FINmNPdnJlY1JtTjFkNHQ5MmN3QmFHMGJx?=
 =?utf-8?B?Ukxvb2JEWkw1UGU2TElNK2tBZEd1di9lcGxVMXhsUEg4SUtURW0yZ2liQ1FG?=
 =?utf-8?B?RHNXS1orc1p4eVFnc2VSOUR1NGR4anYwUjJDTENlZXNqdndMNS8xZ2VmUXhR?=
 =?utf-8?B?L0JrdWtiZDR6VjdyRUQycTdtbE1ONkJCK1hQdlZ3MnhRekI2dTltZWZaRnNk?=
 =?utf-8?B?OExzOUhXU0RhQnNhNlNOMnIvdkkxUFRxR01ySUUrT2hhUENQR2NBc2t5NHly?=
 =?utf-8?B?MjlhL01tbEIvOEVydnZ2WHlOZktjK1MwcUlJSGVkOUVwOEcwcTFOS2U1Wmlk?=
 =?utf-8?B?dHY0WUVHVnpiMk9ZOUErcUY0S1JZampYQWlwUmtrWXNZK25yZ05mZHR5dTgx?=
 =?utf-8?B?OXRDTlc4eWUzS0hGOVFXZndiK01OK0YxNGdBNzlyempoUTNOMlIyVmNsbFBX?=
 =?utf-8?B?SWFqd3QyenBBdlZUcG5JUUpIKy9mV09QRjZqbEFSYUtGN2JJZzlSSk51dUpJ?=
 =?utf-8?B?L1ovVmpvZjBtQnBjak01S1pSMXNoUU1ueTZDbWFJZUJMeW5tWE1wZjhtMmFl?=
 =?utf-8?B?RTNPVmloR0VWRy9waHlnVmlsc3NHWEF3eVRHYm9uVFMxaVhNcUFNTDlpR0FQ?=
 =?utf-8?B?dC8rdVhGU0JPWDFQdzZZd3pOMHh1NXUzdlFZQTQvS01YdzVMYTBrVXVEdjVJ?=
 =?utf-8?B?bjJ0UFRGUTRVem80azVKejQ3UUN3MFAyUHFjUzdYMU91OGVVNHR1NXJyTnJP?=
 =?utf-8?B?Wkp6dXlXV1o2TEg0U05yWXFwMHk2K1RTckl4RzJ4K1VHMmtpb2ZYTUJnSFds?=
 =?utf-8?Q?+yUTdfCRlbnlVu6Y=3D?=
X-Exchange-RoutingPolicyChecked: FEfGWF1A3lE8Oben/S0tUV714wahX7f4sUWW/NuQ1h3lxiFo+6JjxrbOr/QOb4tbX67ZAoaejTP/2XWvbG2Div+aQiHTv8xd9aipHtpVWrHzlYzKuw4Jv2tv0oIH2sUEp0Q+R6u88B5bfVk+mLFzq3bhYEmes2P0EDMMM8QSYF/Xktzvxmt5i+XpK6diH9b07IDwBRIMGqAL6SR/LtDhGT+5sU8eICOV2W5dylOoAyRE0up/cNldUtYNIDw0/cHygLjimTo5rbmW9mm5/LYl49VppxzaWzMWxHDOKmgQbaj02PrwKqpknQqTvyHd4F8h1OmBDtrklpSwhLh9JW60kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 180c4840-5794-4d26-7301-08df4abe225f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 06:34:19.2326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LHxX0dXQRhVWGWBZV5AuvwoD0g2LY24/pjgAG6TXtBYOZ6PqL6tbkp2bhC/nYBz+LrsAGQJ7oVDMR/9tFATdk9/XQmjxJh2mBpTl3tQ5AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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


On 11/25/2026 1:41, Umesh Nerlige Ramappa wrote:
> drm_ioctl() only checks for unplug on entry, so an OA ioctl that
> started before drm_dev_unplug() can still open a stream, or access
> oa->xe and the metrics idr, while the device is removed. The ioctls and
> the mmap of the OA stream fd don't go through drm_ioctl() at all, and
> neither through the wedged check of xe_drm_ioctl().
>
> Run the OA ioctls of the drm fd and the ioctls and mmap of the OA stream
> fd in a drm_dev_enter() section, so that they fail with -ENODEV once the
> device is unplugged, and drm_dev_unplug() waits for the ones in flight.
> Fail the stream fd ioctls with -ECANCELED on a wedged device, like
> xe_drm_ioctl() does.
>
> A config without output syncs waits synchronously for its batch, while
> holding stream_lock or gt_lock and now in a drm_dev_enter() section. If
> the batch waits on an input fence that never signals, or never completes
> on a wedged device, that would block drm_dev_unplug() or the stream
> teardown. Stop waiting once the device is unplugged or wedged, and fail
> the config.
>
> When the stream is destroyed on a wedged device, don't submit the batch
> that disables the context save/restore of the OA counters either: the
> context won't run again, and on a long-running exec queue, which no TDR
> covers, the batch would never complete and keep the exec queue alive.
>
> A stream fd can still outlive the device, the following patch handles
> that.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>'

For the comments which Sashiko has responded below, I feel similar 
patterns in other areas of the kernel as well (check xe_drm_ioctl()), 
also, handling jobs pushed onto an already-wedged long-running queue 
belongs in xe_guc_submit, and not in OA, and with that, I think, it's 
good to go.  With all that aside, it LGTM, and

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
> v8: Split out of "drm/xe/oa: Quiesce OA streams on driver unbind and PCI
>      reset", which carried these changes since v4
> v10: Don't submit the context disable batch on a wedged device (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_oa.c          | 80 +++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_observation.c | 20 +++++++-
>   2 files changed, 81 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 7241cf18b325..9ce96cac3bf6 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -43,6 +43,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sync.h"
>   #include "xe_wa.h"
> +#include "xe_wedge.h"
>   
>   #define DEFAULT_POLL_FREQUENCY_HZ 200
>   #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> @@ -895,9 +896,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>   
>   	/*
>   	 * disable the context save/restore or OAR counters, and wait for that batch like for
> -	 * the ones before it
> +	 * the ones before it. Not on a wedged device, the context won't run again, and the
> +	 * batch might never complete on a long-running exec queue, which no TDR covers.
>   	 */
> -	if (stream->exec_q) {
> +	if (stream->exec_q && !xe_wedged(stream->oa->xe)) {
>   		xe_oa_configure_oa_context(stream, false);
>   		xe_oa_stream_drain(stream);
>   	}
> @@ -1082,6 +1084,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>   	struct xe_oa_fence *ofence;
>   	int i, err, num_signal = 0;
>   	struct dma_fence *fence;
> +	int ret = 0;
>   
>   	ofence = kzalloc_obj(*ofence);
>   	if (!ofence) {
> @@ -1125,12 +1128,28 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>   	if (err == -ENOENT)
>   		xe_oa_config_cb(fence, &ofence->cb);
>   
> -	/* If nothing needs to be signaled we wait synchronously */
> +	/*
> +	 * If nothing needs to be signaled we wait synchronously unless the device
> +	 * is unplugged/wedged.
> +	 */
>   	if (!num_signal) {
> -		dma_fence_wait(&ofence->base, false);
> +		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10)) {
> +			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm)) {
> +				ret = -ENODEV;
> +				break;
> +			}
> +			if (xe_wedged(gt_to_xe(stream->gt))) {
> +				ret = -ECANCELED;
> +				break;
> +			}
> +		}
>   		dma_fence_put(&ofence->base);
>   	}
>   
> +	/* The callers clean up the syncs on error */
> +	if (ret)
> +		return ret;
> +
>   	/* Done with syncs */
>   	for (i = 0; i < stream->num_syncs; i++)
>   		xe_sync_entry_cleanup(&stream->syncs[i]);
> @@ -1722,11 +1741,20 @@ static long xe_oa_ioctl(struct file *file,
>   			unsigned long arg)
>   {
>   	struct xe_oa_stream *stream = file->private_data;
> -	long ret;
> +	struct xe_device *xe = gt_to_xe(stream->gt);
> +	long ret = -ECANCELED;
> +	int idx;
>   
> -	mutex_lock(&stream->stream_lock);
> -	ret = xe_oa_ioctl_locked(stream, cmd, arg);
> -	mutex_unlock(&stream->stream_lock);
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (!xe_wedged(xe)) {
> +		mutex_lock(&stream->stream_lock);
> +		ret = xe_oa_ioctl_locked(stream, cmd, arg);
> +		mutex_unlock(&stream->stream_lock);
> +	}
> +
> +	drm_dev_exit(idx);
>   
>   	return ret;
>   }
> @@ -1765,27 +1793,41 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>   static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct xe_oa_stream *stream = file->private_data;
> +	struct xe_device *xe = gt_to_xe(stream->gt);
>   	int ret = xe_observation_paranoid_check();
> -	struct xe_bo *bo = stream->oa_buffer.bo;
> +	struct xe_bo *bo;
> +	int idx;
>   
>   	if (ret) {
> -		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
> +		drm_dbg(&xe->drm, "Insufficient privilege to map OA buffer\n");
>   		return ret;
>   	}
>   
> +	/*
> +	 * drm_dev_unplug() zaps the OA buffer mmaps and waits for this section to finish, so
> +	 * no mmap of the OA buffer can be set up after that. Can't use stream_lock here, it is
> +	 * held across user copies which fault on mmap_lock, held by the caller.
> +	 */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
>   	/*
>   	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
>   	 * buffer's own range in the drm device's address_space below
>   	 */
>   	if (vma->vm_pgoff) {
> -		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "Wrong mmap offset, must be 0\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   
> +	bo = stream->oa_buffer.bo;
> +
>   	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>   	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
> -		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "Wrong mmap size, must be OA buffer size\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   
>   	/*
> @@ -1793,15 +1835,19 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   	 * VM_MAYSHARE, don't copy the vma on fork
>   	 */
>   	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
> -		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "mmap must be read only\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
>   		     VM_MAYWRITE | VM_MAYEXEC);
>   
>   	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
>   
> -	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +exit:
> +	drm_dev_exit(idx);
> +	return ret;
>   }
>   
>   static const struct file_operations xe_oa_fops = {
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 39e05b9131a7..9e23ade51dc1 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -7,6 +7,7 @@
>   #include <linux/perf_event.h>
>   #include <linux/sysctl.h>
>   
> +#include <drm/drm_drv.h>
>   #include <uapi/drm/xe_drm.h>
>   
>   #include "xe_eu_stall.h"
> @@ -35,8 +36,8 @@ int xe_observation_paranoid_check(void)
>   	return perf_allow_cpu();
>   }
>   
> -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> -		       struct drm_file *file)
> +static int __xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +			 struct drm_file *file)
>   {
>   	switch (arg->observation_op) {
>   	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> @@ -50,6 +51,21 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
>   	}
>   }
>   
> +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +		       struct drm_file *file)
> +{
> +	int idx, ret;
> +
> +	/* Hold off drm_dev_unplug() while the OA ioctls run */
> +	if (!drm_dev_enter(dev, &idx))
> +		return -ENODEV;
> +
> +	ret = __xe_oa_ioctl(dev, arg, file);
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> +
>   static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
>   			     struct drm_file *file)
>   {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

