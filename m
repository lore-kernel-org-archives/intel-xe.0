Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IUqtNG2X;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lDCJl2Wl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF49710E008;
	Thu, 26 Nov 2026 05:59:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EE610E008
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 05:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795672748; x=1827208748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/xpfAlhiCgQqhxSTkJptgiOXDA9cwf9Ue4fOOWl63TA=;
 b=IUqtNG2XbnOPNX13c2zicOhIqadBmHvkgCPkrvDfA9ZKvDzBeDNEEK+U
 hnAEMe4dqKS4JVpJ3VjveaLVvQPlEqbjEX9S8C3FzRWo5xrMmR67RKjqN
 8xFpfX+LjTQMhW6I1OnXVKgsWPGx34BsK6qgTMgmP/zRpw32Nfn7KHT9x
 KrIdM2ITALIR5b1hZS0fXzOQojdmronXHtoGNXBgIQjSbcYm8pq34KvOV
 wvY7wicnlhGfnpa9B+Wk3ot5TTSnFcLWSAOiSIMl3fDSlAeAXKlzjUY8Z
 HBXm5rncQki6vDYJEFTnzMrwFwAWsVS+/CY7mbtzb7mgeOqt6VvCwS3iN A==;
X-CSE-ConnectionGUID: qdvuS5QhTvS0pa2RQBEcuw==
X-CSE-MsgGUID: GvL/hK+iS5eYeN0li863fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4477960"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4477960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:59:07 -0800
X-CSE-ConnectionGUID: lnRWDK86RA+7ARY5cSoX6Q==
X-CSE-MsgGUID: klHzoup5Sr2bG0rPCRtpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12514384"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:59:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 21:59:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 21:59:06 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 21:59:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQUFqNzz5tE8cSIY2xts6xlHpetEhvUcrwzCp9y9rsBVFzI47RTNS7CIzPEqZRIYraWTWQAO/A79058BdGMcam6KBdxK8cVKM8iez3Wwvw93DQhzZo1UGN+gkR+UIZhVabEhtcJdTHZsxImUVWe3H6KScaWzAJcEIO+eHyYk1FUXjAbQLMOw1NYCULN6p76UcaGNHa062JT6HozZQaPFpgqKmp9l5nfQ9FsJHdwrQ55zg91qibFZZ0AJ4AQMFiYrtCet88KkWLrzdSmh1XwjXA8XDU8P2UWTBVShwrbnZ5/UEeViJWv2zsPqTiW9VZAMKHY10qNHCM9DEjqPKu0wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqoDW1RIeQ9DAvMGxfuSDibG7NEkPoQsPaqBiPGsP+0=;
 b=kQPujujGxKMmjLzjhrQzBp4BLxRx8UNwgzvB8F1OxLeUNqM+I9luLxlskgSxfvqL2drwwinJnqs9CJcp9IJH3D4GPwN9KU5svcDDL4iq2YP1sYFrpWvBqeT2N0p8O+lfKLSWf6gfq7OhK/DxLwAiT6l3hZkq8Tn/+XgfmFoz9IuvyS6mKDZue3X/gZ/QFYDfWQKGuwb+pGUzDcIziJL8WJwbCwCYqJv1kzgp/pB39Q2jEQQR7ptLwQGnxe8u1Tx+6ZG18gGIcjLOA1h3FP9dTIqQ/XvC1s42Wxp06jZIHEXHZe5CtddipnHaXSLp7dly/vDRgCc3nn3fNGfhz7WWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqoDW1RIeQ9DAvMGxfuSDibG7NEkPoQsPaqBiPGsP+0=;
 b=lDCJl2WlCgBHnHtqiFdIYqBxpWIAzZkb1flaUxroUOX/ARYEc1B+TRGCyLvdQbloYO1cp3o88h7++cYmnfMDANN0sRDnGfXINulUh/uNA5Q4kItbidVhGpBkbkLsVOiy+lkU7/DFrgOZ7cnYYgWzHOkpB7jCxR1wE7kaWDkgXB0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 05:58:58 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 05:58:56 +0000
Message-ID: <25d7cc16-d09f-4802-9474-97931618441c@intel.com>
Date: Thu, 26 Nov 2026 11:28:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/hwmon: Improve mailbox power limit init and
 visibility
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261126055530.1629019-1-karthik.poosa@intel.com>
 <20261126055530.1629019-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261126055530.1629019-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::7) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd69ae4-624c-4d72-9942-08df4b825b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261102123227099003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261021123027099003|261026140227099003|261028144727099003|261021121427099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: EyYUATMmHwcSKF+Vlio0UNfigZ+JHqYaWIh/E0FTVmrWuMlNSWi369zNK8LLvBoWmeZIHLf7hyT6RVUCwU5ZXyt4OW4Yz3burw8RDPAOTmJKjEF3954qvuXG58isqjeT9Y32H8uMFFumFa/BJdzqH+o5Q2DumpEp9Fi0kmAPstZMoE8kPJK3/ZlpfGPWSVUBipzdV5YIPSzxrd4rpox3LQcgbNZ/VpoIcpq82A4mEnTfOeKd43x5oX/7VqAtPq5P+jKXTkxV5WxhKIEk48kiNfrxFv0jQJlmMyQsHtnzD2yWGBZAsmHe49PFwdNDY5f920y5ABHRNIXItiDwdlYLKaesNRrMtj3IUUCo0cuSrAJNNfWO2FOiw0MNe+o4bIrR3NFa3Mam5WgATfQ+RB8zVSnmI8Xzj23N24NPrefBs10237vOy3l0lBiMzge85NOc76lcgBkN3Q1vbeKzz22RUvS21O3Dkh5tTpHAmuD0sHeSG5zt78yHx+Uf5UHtn+ibPJBYorz48ANQeKwzdBvJSb/fhLS/xFQYuk0osyhO1EuT0RB1Kux/rViAK3kmBg2WeyDRpC6NiVck7cGT325exysNnHBc5xkvhR5kv/Vwk2QL+96WAax8D+ha3gMO9ERXQ9A5o6JQUBUt4jj2aLEeUkpfNew4OCFoIIrPxUQWhmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261102123227099003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNqMmd6NTBTRm5mdUorVnNrOWFCQ0hoem4weTFJWWFWd1prL0VkMUVKRFFs?=
 =?utf-8?B?ZUw4R1M1OUVpVlo1Tlc5UVFiNjF6NlU1aWpvanJzMjJZU0hRb1FQU0dVWFgv?=
 =?utf-8?B?NlpoeTlMOGRlZFUrMWVIWC9WT3ZNeDQraDJTYmxMM2ZYNUdNV1ExdE1DYThS?=
 =?utf-8?B?TFdRSWVOTWhOOHFlTjNJdnduelBzR3dDQXBpdkZmUm5hL2U4SlAwYzBqVWZy?=
 =?utf-8?B?a0VkbElVZVU0WTZDRUIxMWJ1MmJ2OE9sSEhJOG5wNVdGME9YZDdOMjdKTVlK?=
 =?utf-8?B?ckZyVUVyR1oxQTlaL2xuRmRpY2NTcUZBSmhJTFVYRWR3T2tpWXRlbVJOYjFP?=
 =?utf-8?B?QU1ldEZFU0RjbmJZOTF1TlJYZlV1U1VvcEFqWTNCOFFWOVJmQThWd25DRTRs?=
 =?utf-8?B?aHRKdzNDdWM5ekdKU092eEx6ZDBoS3JLc2dlSWQxa3kvQmFadld1K2JiOEg0?=
 =?utf-8?B?WEhFdXlmdzdoWC9aK0VJWFN5YjdTcUhoTk81cmNvSFQ2SU5qU1FWVC9yZCtl?=
 =?utf-8?B?T1p5Q2NEb2pScmsyQzdzT2tYdVF2dkZWR0FDQ0pYS3ZzQzBnT283aTFKOXFT?=
 =?utf-8?B?UDh3Mk4xN3ZFaHpubnZvVGNVb0pQY0FtL2picmFHNFJOc1NtWHFkeGxlNkxy?=
 =?utf-8?B?eG1MdmJYSFArNFIvc2U3NU84aXRrK2FSc1V2cTVkZ1dTS0FXSFJqdUdpdHlI?=
 =?utf-8?B?aGtrVHBMN2wwRkVobG14Q0tGMHNLK3Z0aHdKd29pUUlMaUkxT240UWJxWTUw?=
 =?utf-8?B?MEQydk5SU2RZM0JEWHd5eGNNOGRRbjBpTG1EcVF6czE3TUFnV0RVSmhpSjRt?=
 =?utf-8?B?NVdrdVJVYWszVGdWU0pTYlFIR1Y1ajJLa2hzdndaZFBzaG12MzZSQUk4QXBP?=
 =?utf-8?B?UDA1U3IyeXFUZ0JNazAraFZtbjhkTktWbi9nSGZWbVZ0QmtSU055M2xZZm0w?=
 =?utf-8?B?VXF6Q0xtLzIwZHQrNTJHMFU2WU83ZHpFcVdKUzRkbTNFU0NFdTBsaTlWR1M2?=
 =?utf-8?B?Q2JxczdJT2Q3eFMybEFvbHdJQktUVEhmYW1NRCtxN0FOb2RWUTdQRTdnUm1x?=
 =?utf-8?B?KzZOT08yU0xvbXd0U3VFY1loVDhrVTFjcU9mVnJ1STZ4MUlYMFhlb1gvd2hv?=
 =?utf-8?B?dmNUaUZSSzN6V1FIbGJUTS9yeHU1YW9Uc2NVQ0txdHlHRmpPQmcxMW9YbzZ2?=
 =?utf-8?B?MDRjcVZaVEJTREVrdTlIcThXRCtrUStOUFlRTlJvWGhQa21IVkJVenVWZitn?=
 =?utf-8?B?NVJnZmxYaDl5c3RuVHl2OGk0ZzBsRkpHVUNvRnAxUnZPSTZvRnd1MG54UEtj?=
 =?utf-8?B?VnVKTFpwa0JielE1TXRWcGUvdytxak44THozM1FXOXhMYU1WWGtwYXBIRkxq?=
 =?utf-8?B?TUZiV3BVMVU1elFWQ0lDUDhneVdUZVlDNmpWTVFtRW5vSElkZ3cvbE1PNTUr?=
 =?utf-8?B?aE1uUXBSM1FFMGptd3E4NGVhSzFFUG53SCtocUJsVXRCWGZOMVBCTTdvOFpZ?=
 =?utf-8?B?MnU0ZEFZNDdoRnJqNTg1Y1NxakhXUnkwWlJhaWRtVDJybGV2U2tKNXBvTGxZ?=
 =?utf-8?B?cHl0djZYYUI3UFhSMnB5cVVNb0ppRUEyRlRoc1RFR0tiWFA4eVp5M1hNbSt4?=
 =?utf-8?B?LzhwUUxqRGpnalFEMFEza1I0djdYLzQ3Y0VSZlZWdWFQN2dXTlk4dHpUbnpP?=
 =?utf-8?B?N1N3d25yQVdaODk2NTJrYWtSek94ZVAvT1pxS242eFdYTHR3ck85aGx6STd6?=
 =?utf-8?B?Szl4V3NiakNTTGNHMUI1YXRxNC9jVDUreWFhS0ZZbE9kU2RBQmF3Y2s3Nndm?=
 =?utf-8?B?TWxmMmZla25uZ0lOd0xwZ2x3bjdzZmV2c3RHNFdoVWYxaEJXbUJwT3ZRaHZt?=
 =?utf-8?B?eVRYMVlJM1BZM0VJMDJMOEx1QyswbzZqcUgvNm80aC9KdEN1NkxDelpXMzkw?=
 =?utf-8?B?UXQyQ2NEd0hORm9WSWF3a1U0MjVLUDRYZlJDTGVtVVhsQ2pLSElrZjNSOTZr?=
 =?utf-8?B?WG13d01TY3F4WTdqMW14ZU1uUEdvMklTZkpSWnQ4cU0xeStLSkJtVzREQzBi?=
 =?utf-8?B?elc1RmtiajdlSnFQMkozbFBESkpkaVNSb282SEt1aC9RaXdoeG0vaklzUXNE?=
 =?utf-8?B?ZytETXdEd3VmSnZnWkFMZUd5b054NUFQU3IzMk9SUzRzamVuYU5IR1M4TmZI?=
 =?utf-8?B?dE5DcldZWjI1cVJUMXVnTXNzYnhBQkxRcUR2SEVOazF0UWJydkcxb0xWRW14?=
 =?utf-8?B?Y2NmZVBYaEpTQkNKNWVWQ09aSzNGVE9sbzc3N1g2TmZEUDN6d01Xd1JUTXI1?=
 =?utf-8?B?bytRMmt1OTlDZDVianBrWFFuOURnL01JcVZqeXE0VzN3ZURPalFDUW1ZUWkz?=
 =?utf-8?Q?glJ1SPQvBVvvk52k=3D?=
X-Exchange-RoutingPolicyChecked: g+Pei88D7ijlcOZ4bslh/+mdeDfRWNWz5ZqSAV64u/edjE3Vgn8TcaWhqpfySD0Yb+bUE7ynSVdnzTYmS0sXp7tDb+vlYhLlUEf5iY9R9eIl1TVeAHKFpLT5F4EulI0pOtGluZihCZcgUD5+ZjgCjS3/l1KZqZrZgE+M0yDRq/uAJPGs9hO9/W8kdrmtelg2N++pNJbL2rmlCsycwkDEJd1r+PUfSpltx8HIsHIM0ZhnIPBylpW64yuqjRYpi/XbWzLbluDNCV9j7rqvpjbNT9QUE/vPO3mAcR4P5gb/meJBIn9dgb7jtvBX7ut/BhUHeHgxnoWnHsfnV5AbLLv9bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd69ae4-624c-4d72-9942-08df4b825b62
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 05:58:56.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+XWLMT9s6IT6OaH6OyjhJ4Uk8JIa5GT0D7tAAEHObwsbT3aeAOnFHVt5TOuwBsJw1+FJzQaB7hM1O53b9gwABAkZgar63QT2cvuN5ntzdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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


On 26-11-2026 11:25 am, Karthik Poosa wrote:
> On platforms with mailbox power limits, a failed boot-time power limit
> read causes two issues:
>
> - The power, energy and time shifts are only set if all reads succeed.
>    Otherwise they stay 0, while the other reads still fill pl1_on_boot[]
>    and pl2_on_boot[], so power values are reported 8x too high. Since
>    mailbox units are fixed, set them before the reads.
>
> - Writes to power_max and power_cap are clamped to the boot limits, but
>    visibility comes from a separate pcode read. A channel whose boot read
>    failed (limit 0) can still be visible, and any write sets a 0 limit.
>    Base visibility on the boot limits instead.
>
> Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Fixes: c713b9a23c73 ("drm/xe/hwmon: Add support to manage PL2 though mailbox")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c84bcfaea98d..a068ec880819 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -831,7 +831,8 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> +		uval = power_attr == PL1_HWMON_ATTR ? hwmon->pl1_on_boot[channel] :
> +						      hwmon->pl2_on_boot[channel];
>   	} else if (power_attr != PL2_HWMON_ATTR) {
>   		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>   		if (xe_reg_is_valid(rapl_limit))
> @@ -1432,7 +1433,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	case hwmon_power_max:
>   	case hwmon_power_cap:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			uval = attr == hwmon_power_max ? hwmon->pl1_on_boot[channel] :
> +						   hwmon->pl2_on_boot[channel];
>   		} else if (attr != PL2_HWMON_ATTR) {
>   			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>   			if (xe_reg_is_valid(reg))
> @@ -1464,7 +1466,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   		break;
>   	case hwmon_power_label:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +			uval = (hwmon->pl1_on_boot[channel] | hwmon->pl2_on_boot[channel]) &
> +			       PWR_LIM_EN;
>   		} else {
>   			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>   			if (xe_reg_is_valid(reg))
> @@ -1823,6 +1826,10 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	struct xe_reg pkg_power_sku_unit;
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> +		/* Mailbox units are fixed; set them even if the limit reads below fail. */
> +		hwmon->scl_shift_power = PWR_UNIT;
> +		hwmon->scl_shift_energy = ENERGY_UNIT;
> +		hwmon->scl_shift_time = TIME_UNIT;
>   		/* Check if GPU firmware support mailbox power limits commands. */
>   		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>   						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
> @@ -1839,9 +1846,6 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   			/* Write default limits to read from pcode from now on. */
>   			if (xe_hwmon_pcode_set_default_power_limits(hwmon))
>   				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");
> -			hwmon->scl_shift_power = PWR_UNIT;
> -			hwmon->scl_shift_energy = ENERGY_UNIT;
> -			hwmon->scl_shift_time = TIME_UNIT;
>   		}
>   	} else {
>   		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
