Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEF9E85388
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 17:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DCB10E0CF;
	Fri,  3 Apr 2026 17:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0mHmkAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3CC10E0CF
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775236204; x=1806772204;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VI4U3PgLjZQO8V6C2sufmsEOynXbGzsFmeFFU1jjcHA=;
 b=i0mHmkArk596GvAQ19wsoowepFrG9uZRZYZ8ZWcs9BP4+snwYhY/iO7o
 T5mdYxDHpE9juUeuF2Gkv87iuOndmSuElyQs96nsKeUwwSCQjvdD878Jh
 EOfGfa3HI5rM6XJqcesX6Oq7OBGRMwF7LFO3e/hKQjUk7w3NBA5q7auZO
 jX77UPDhpsqJlceoEgWTQC6ccD8BRXLc2ChYXXVj30P5aJaPhcfWvoatn
 C+aQItDisfzNR0quxLdj9BH4F/truv4L4ywCYS6oSgvJJEIlt7zBGdlDE
 KW2lcNNRxO6AvJg9fKMgyEtIYufzy5ERePjJNcu9eZmOS3cP0FTZOeOyL Q==;
X-CSE-ConnectionGUID: yyAsrw38R5SqTYJ6XvYqPw==
X-CSE-MsgGUID: o1uO+JGNRKmvkzAmeBfhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="86601279"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="86601279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:10:04 -0700
X-CSE-ConnectionGUID: qd4dzsXXQyq1A+JYWyaFwQ==
X-CSE-MsgGUID: 4DZzHPlfSGOqIwsWSfMFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="231341508"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:10:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:10:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 10:10:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqnK0cYZTF8eBy0OVGBq4DYn5Km/QS0NCoK7Ezaeph7fbpQKlpDRqR9hrhl3gvALt5mBWiTU7CyLJTDQdafeFBgpa0I1H0nvBUajuUKT/N/g2skmNHviusX2YNIQGpehy6+BMBBV7caBjN4VA8y7mSRGajBiglouoCWgjwapWXOGmbIfQCvPgWtUw9byiPDmPxMb6HWKJX8uZiLpB1tW/Hn5+3ycuxstnRFlGmdWSZ71NirOPiYHEV4Z3hldGFPDK+F0i5SNg2JLGkFOUCtzfJbjUnlbfpeY2nmdxIildJKRiM7KVf2ketKJu/18oDAUTkLlAyTnaR/QdArHiyJFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ93zEIoVgAYCveqV1VPzFkkL3exF0YqPoH41UA8QAw=;
 b=ZD7qsYOQrFeYlj+duAXYAJV26JoMw25WDmC+DBzt3oMhN9iQERoVOGolEaIOPQ/bQFHRWMkoje+hlOfqF2Rpm/cM8i3MiJhbbAnQ6jgCIje7nrK4/qc5GqBlCgNtiPqvob8J9vSvkWFo8ktmSjO58Dp+PP+VhLPdlHdcj3IgM4Rl1p7AbuWhCT1ymaCWUQmfM0fWRvVDuiDMNgjYebFttDUsVae+QU5XpW7jwnuUrlYIol2EzAKH2lVOBZCd36YtLSq9Y4Nu7bQyMzjStyCxkaIadh91K3t8FJAfZqpcgmIywDflSEOpBMhmiciLgb9KqC/BotkyRX74EySO3+ULxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 17:10:00 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 17:10:00 +0000
Message-ID: <27100acc-64d3-4f22-b7e2-e60705e4a9eb@intel.com>
Date: Fri, 3 Apr 2026 10:09:58 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Recommend_GuC_v70=2E60=2E0_for_LNL=2C_BMG=2C_PTL?=
To: <intel-xe@lists.freedesktop.org>
References: <20260402224819.405728-9-julia.filipchuk@intel.com>
 <177521838462.430833.12724758544384745873@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177521838462.430833.12724758544384745873@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bad1eef-2d86-458d-b983-08de91a3d6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Uqz1/1WS28iJk4tXKgkKETzDta+LqfVBpJvBE9XJQNmxIKvO1Z2R58HsAPJpvTi5WQUO05ML4QjiVPHmsivYyfnRG3HdQe9q5U8iMogbTyBcd68cY0vi67cYAg9/SLlUqVYmZ0J0O3NX95nuF5kNBd7l5mV2tMs3AuZY0a26w46rzB7JYK36jFELZTxtSksCoR99dEG4C7wCrjn7fFwRYeHS6BzCtQFGaA/HDjPWHklY3+W9zxaDCVNILL9CDNEJivA43znfQeg1u7SQcl82pFFDgTbwu3cE/gvhco4awfbZiEDx89Vq2A01tGCBbatT0CBUpYmqtOOGu94UQemk7HzyGUyEP4uLx9qrRoQ8Ooa89n/BNS03CbfYq7uVR5NOy/XdPMe2K23EoJmFieJAWXw6CXgyv50zroYmZV1FXulytoPLUQmPDUbCuMxbaVyVPL+x5OLoJ/cYXwlMZKCkcDXh0iVD3YsnwCwN1v3hOJwpjj/WiZs7alL3sFDFDq6wf0+Du0fn6XZti/evnhriVbnihA+frzYzJX03Z/ZX3DPivrIvUUgdJ6slimpk65CdlL+HbC609som1iLscjeXbAySDOTXYLgUrpHByvD/E3NNi3uTvb3xYVnFqZ03ovTc0o5GMlgubGbV6f8C8g4JQpdAxemkAFpx3oBjYvnNzOIO09SgNgV3Zxr4P0hswnYi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9NN29nL2VOcEphbG1BbEp4M0ZQYjhsSjJMT1RUQW90Zm5GOGtuVmNUZzc5?=
 =?utf-8?B?TU1VVFRjMTkwMGdaZVUvelg0b3lQQlhzL084YXhkYTZkWVhHcTFocm1hdHZ5?=
 =?utf-8?B?OUd3YjJSUmdEMGZOS3dPc3FLUms4YzNvSUFXcHhBZnlDMWF0b2puRC9NOGdY?=
 =?utf-8?B?UjhyeTcrQTMwU2V1Nnhuc2poZm0yOEExeFcvK01BMlB3Z3FXcmx3QnkyeEtK?=
 =?utf-8?B?WkVaRG9VclVRLzlEd1l5Zm1nOEQ4Nk82V0kyTzZqTk9YUFl3ZGVXQ2xKcS9w?=
 =?utf-8?B?Vkx2a2pqaitieDFFdDUveHNySnRJVlR5QVVCQ0k4MWFjZlVXZDlTUUw5ek5s?=
 =?utf-8?B?djFpNFFnS0JDNm1MVEdZUVN6cUpCNWR6aXJWTHhoZXJJZDI4L1RZd2Jrc3Rm?=
 =?utf-8?B?Qk8zZFo5dkZhYUZRUWFsQkxLaEFMdFk2ek8zSFpYQmJ1V05MZUpKekRIZ25L?=
 =?utf-8?B?T0VmVE9tV0l4YlVBRUVreEZ6d2JZUm5jUzYvWitkeG9Cek5IMUxXS2lZUHhV?=
 =?utf-8?B?Um1WdGc4UTJ5cmNPNitwYk0wcFoxc0RtaWlBUjhIWG00MFpsTC9yYm5FQjU5?=
 =?utf-8?B?QzVZS0VGTjRFRVp6MzBOSjRsb2dEYkxKZWg4aXNUOFpHT21FejZ4a1lucC8r?=
 =?utf-8?B?Z2hPQXZ3MWtIMGNkQy9KanU3d29IZS9NWmU0M0Y1Rm1Gc1lqTnJhMHQ1MmFh?=
 =?utf-8?B?RVNMSWN2QnkzZkhab3JpOEpIQ0lFdmhmOU1adnBtVHlMWlNFZFBYaGtlRDdl?=
 =?utf-8?B?TnFibVZMM2R2UVBkaFRwMEkwR250T1V3TUV2TVh0U2dlREhhbnY4OTEyWUpl?=
 =?utf-8?B?QnQ2SGZzSzBjNU1ZNnpCUVlQMGp2WWRGN2JTN3ZYMDljNkxXRU5xbzBVQWNu?=
 =?utf-8?B?UG9ZV3Z2S25QMjEyekhXWlRiZ1ZjaUhzSklVS0NHOHBaQW5Pd0Z5Zy9INE1v?=
 =?utf-8?B?b0hzUHVXdm1vRktOWUVQOVNsVnNRdmswL1g4bjRWU1ZrVGJiNlpCZUFzYmFW?=
 =?utf-8?B?NTg1SU9aUmUzNHoxeFh4dTN0NjZReGxrUkp1S2t5cVVPSUFyL1ZhakNLclU4?=
 =?utf-8?B?WUUyeDhEOXB3eXBXTkxKbHQ2R2J1MjFOTTNHWFhoZjdoMFBka3JzYkRkT21H?=
 =?utf-8?B?KzJ6N1hhbWtoK3A0Z01iU3hObjhEU2RpT243aWo3ZE1vQUlrdkJRVjF1aDVt?=
 =?utf-8?B?eVcxN25MN0JkYVlFQXh5TnhBa0FGcUpQQndRVjhTNEpFMC9wMDBjZTlBOTY0?=
 =?utf-8?B?WTc3YUZobFIvZklVVFArQkg4cjNPL3g5WDhQWHdzSVR3bHlNczZRN3F5M0JI?=
 =?utf-8?B?Wm9WRXU2NVVCSVJoYWVpd3BKOTByS3ErbmYyNkpGd0w1aVlSZ1BUMHF2RHdh?=
 =?utf-8?B?QzVIQUhZTkN6YWNlUWxtTUFFQmFqRGlSNVNOTCs4cFNHQVVrSE1tNUNya2NU?=
 =?utf-8?B?eDFYcHZXb1NXMytqeVB0bExiTlp4SGZqSFNJbW1tSW1MWEpRVkVKZUoybDIy?=
 =?utf-8?B?aXc3NmFSRUp1enBxbzZ3WExRL0xSalc5NFdFQ1Jza1pJOVlTWUxidmM2QkJx?=
 =?utf-8?B?SEkzVFN6V3FJSUZLOEJIWUNPMGVWY3RuNDBIemlhN3pwdFNSNG9TNk5Ealow?=
 =?utf-8?B?NTd1MFJkaFZJYzAxcW1yVTZ6Z0JYR0hzSDZabk5vU1ZyUG9weHo0RFZyL2tS?=
 =?utf-8?B?WjVrWnRwcWVlejM4NFVLQzd0WWFTWDdlTHpUeU8rWEQ5enppcWNPSEZSTURa?=
 =?utf-8?B?V3ltSm9SYS9udElKazFoWE03UGFOK1ZGbE9kcThnMEFLcjhXaXBzNVBOTkJr?=
 =?utf-8?B?UXVGVk54cThYcWZMeUxiVHFqYWpNZTY3bjJiZ1c2blowYXFteDlYUmQ4YmpL?=
 =?utf-8?B?d3BHc2MxVFBFM2pZUXJRRElZbVR1bEwzZzdTMVl1Nk9sQ3NqV1cyRlZGWEQx?=
 =?utf-8?B?YjBtZFFSMVNnVTU0OTdRRGprSTRnYjNJOVJXa1NGdkRBYjN4OTBSeW1yclFF?=
 =?utf-8?B?WmtNSks1RWNlSGJrNUpBUnRBMkJNckhPaW1PNkt6bU5ueDRyRm9SZlN5dGl4?=
 =?utf-8?B?OVJqZzk1UjB3S0RoSzdYOE82d3BES09xNUNYY1ZScHh6c3VMYWorL1QxZHdR?=
 =?utf-8?B?N1pMb0t3cDhodTJxK01YQ0N5ZjNHQmc4eldaN0MwUHBpN2ZkYWI0Y2RlSFd3?=
 =?utf-8?B?STBmWWdzQlR2MjN3ZFdtcFJWd2pzaWQvKzl1Yi8wcmNBNTJyRTF6SmVFdlJu?=
 =?utf-8?B?MHVIeEJ4Ykg3UTVKcVlrS01nODJLZXgwNUJQVDlwcVVKT28yNWxJU0F3dEJj?=
 =?utf-8?B?SW8vMTZBUkVHa0Q4SUVsNDh6NUl1NkhzQjVRcUptbUlscFdNZVh1QmNPajNG?=
 =?utf-8?Q?8gBQGWxOD5zcWs04=3D?=
X-Exchange-RoutingPolicyChecked: VoSNHIHTCfwp8x/ZHmYFrJ1LF4zvxA1uKqnBlrxQKhU8kv4Vyf6A4pdJYE7uxQZ5EEjkjDR4xL0SVs+N4pX9ADx/T6dzW+ry4jiDRSD9lvTIr25SSDok0q05n1IhoD9X5slqGKKpjpRyqrj8Td11etXLhA7+WpRc+Q43YhxDu/2pKI2eeAWwBIFZ+eh53Mes2j3T64KKpqHhClNAcyREh57xd2M3M/rPaxp1p8ZI/8L1PR+tcIAF2uL76L3mY7N1XoEfVHD3QUYqPS0X31amj0hQ/Tm+alpgvNuTTU8sK1rnwphTKml5tNX/I741ksQ4hlGBcmw2qHD7Ml+f62pKJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bad1eef-2d86-458d-b983-08de91a3d6ce
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 17:10:00.4661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJydG3OlFx/hZvoiUgx2tC46IHnX71h+iC68SbiadjGEaJnKGX7KswiEyR8B6jGl2uf+Wug+IXtmsK+2c0Mw/rA8wG0kfQSOR9hVeaxUfd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

On 4/3/2026 5:13 AM, Patchwork wrote:
>   * igt@kms_flip@2x-flip-vs-panning@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/
> xe-4844-76f07a8a9c761686987cba92056f78c1d3cd1c62/shard-bmg-7/igt@kms_flip@2x-
> flip-vs-panning@ad-dp2-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v1/shard-bmg-2/
> igt@kms_flip@2x-flip-vs-panning@ad-dp2-hdmi-a3.html

Failure unrelated to patch.
