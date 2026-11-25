Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1D606A33A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IG81e/qQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DwduEmPS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDB810E78D;
	Wed, 25 Nov 2026 06:37:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04710E78D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795588622; x=1827124622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pc4sjqcc+UPsgXQ+pNfmz9tq+hrVmmYDG88PItkA0ow=;
 b=IG81e/qQzAtkQCrmFuNKxiF/0Sde4QXSSUss5k8EISJ2DLK+lj1x5B5e
 yzConVIOpBp9sPwj/nVxxV56DYRN2HiLYr1TCVDYD3sUKSpvY0qWeKr8x
 qlUSfi3AuLe7lYK9NetOErLRlc5uOwkKhr45PpAR/hGSg8Cj+rxquDa1y
 URWB9TrD1GfppGN+4uHdJve82Xj7bQKmoihCfJ2Tt5+iIEPWi/bgMwb4B
 EuiNeJiB/nUfUriuljN20FfXXiK0oyJEcqU0lWska9hOu/1uG80vEisJR
 oVB4alVRVvac5JVRKshuqia+VFgB5rCLdeNe+73pkaeseYiI5EvwIaT8i g==;
X-CSE-ConnectionGUID: d5EneCdqRdiCOEQO6ufIIA==
X-CSE-MsgGUID: q/cj663WSfO9CdEJTVFe3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4355729"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4355729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:37:01 -0800
X-CSE-ConnectionGUID: eKw6081+QpG0nfifa+2nAQ==
X-CSE-MsgGUID: ONWiDZa4S0eJSmB6hGPjzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11792093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:37:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:37:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:37:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG+aGHx83vSiovSifDJ4KnQg2yyDtk3Lw/pcFPOGfJPQpMKpgpo3hznd5XA/ksP3ZcN1fYdiS+hV/S0wOuS4VL7sG/l4NJTVPi5Dc23uCJHrHFcDkBdRhI+efOsycyllINsZLiYxl7KqrDIk4QgeL+Oo4KuhnShjcSRSZ6BqUBOgI/JIQRJ1TSvd6/lX7+doKEFoGMADkBwwfjLiJmKLfLvAQL+MyCX0u+58kjPh0Os0cILio1nrHPgkCdXMa3xu2zmFemhpJwM74c7zfDp5rOtFrTbIuz1GU70wEg6QbSnWBPO5G2O2i51IwaPvHl6OzbA+5vmbQp+oMfSkCV9HYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb6+SxL058/rRWlY7JvoqPRUOK6NSz41E2vhUjxgEjM=;
 b=unYfTs7aJ7ohxB0mhmOS/MC+ELa/j4cyb8Rkir/tHclvuG/VlEIZTppXp+AXcROvZWjtAuInvVAQVN0G666RKR9vLgi8nTkYb3pIXIMr9Baw9vL/MVDBHtVdug6H8GhZXuOkr2zmHqLHMrN3/adcSKiPaPJtcrql5Bu+r44zpC79LxJh6PKEdom5W+uQ4glr1Oij5tucnOGyXKTCT21CYdYGsLWSHX0RnAc/zX0vUfS/2ULBdruKSbz3mcPmxtzKTvCI6gOOLhE/ocMlLvJgJAb9d0QugxsmWmzcsHNwFODcHaLm9IQnW9keuEEHi1ky1BMT0EdgtLnzEixQlj4+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb6+SxL058/rRWlY7JvoqPRUOK6NSz41E2vhUjxgEjM=;
 b=DwduEmPS8LUIvKxpUXRcbs/kuRFd6xft3aHTwS6pJeLTEzr1pUhGvSl3elgPuoNiEe38B4eI06UHAvRTIYS/BEeLYQCYpqd3Jk3cIl48Dk1KLwAy+F+WCODwuPBhiEzxfK6Nhy9GZO0DMyas0FpHLBdiRDDccjxMcalzxx504dM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 06:36:52 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 06:36:52 +0000
Message-ID: <5220f1c9-9d54-4a11-84f1-26284e8730de@intel.com>
Date: Wed, 25 Nov 2026 12:06:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/7] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
 <20261124201150.405479-16-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261124201150.405479-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0287.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::19) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c5d61f-7850-4210-6614-08df4abe7d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|261009223027099003|22082099003|260925022911599003|260925021911599003|4143699003|260925021311599003|5023799004|56012099006|11063799006|261026121527099003|10067099003|261022075727099003|261102123227099003|261021121427099003|261022113327099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 2VR+8ffaP6ciGgABBgTke5Zkw1b62m+QCwW7DEEvSvdIHSv5g6Z0JTeG4IV1EcCJuTiFD+WNxi5o/f02teaDh0QdiUhojur3jFYvAPtD7tJdrd7kyN5AQOFOyO80Tf7V/+G1nIQjoKRlkNyicZ1OGJXfwCX3usQXIlIDZWzEkF92bOQUekiiLh9gc9XMymyhsHhoY/swK9I8VdjJbAv12aNutz06SP+4AVL6KbL3mYxjjaEL4HrRnw1BSxci53DmkTakNvLkN8aRRgNeF3/y0BbcyxOdSjMNK+CINnITO6c1yZYrtmqRRfkD1MYSN/Tq8pbRciFeUK+w1l0cGGRoMUf+wF28ZlyJTnSTMLQlfbb3bV/Kj6zHU76OJ/Air/VX/fLY7p//0vaJ8inqwBdURLjf4Se8k+UPGmOUXAUPR2WlzcV0qhoKFcUu30OGJP2PGkAbMS/tEQXh5PN32jjulgM9yHJcw4o+2iqkAVPDa5oGgsgga8HsOGls8Ec4z6MqKxGr+gQ27TjJomDxegnzDTrxsDeRVjLsc8ZWjoCirMEG+N3Dam/vkqiHbBDSvUFkjxd5Y/oEWJFf70QqF9h3LO95vBdiJouBOCTo3R9kOo9NXf5+yzqaSdx+WvUqfvI8VQ4u/A/h5hJdGNOaw0HFDkcIFQCERLnkNQXL1Heky4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(261009223027099003)(22082099003)(260925022911599003)(260925021911599003)(4143699003)(260925021311599003)(5023799004)(56012099006)(11063799006)(261026121527099003)(10067099003)(261022075727099003)(261102123227099003)(261021121427099003)(261022113327099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThuNVppdldFTENUbGlOVXBaeFpxdXZpMlhPR1ZRS1ArdXBaZGQ3blRiazdO?=
 =?utf-8?B?ekVCOHZWckRhdnhCNlRyazQyTm1LaGNoWUNDai9VTUhyS21BVksveDlVaFNN?=
 =?utf-8?B?ZnF3RWNlVG85Ylc4WEpManQ5aWNSa0NpaC9OUDdmK3FjNFVnNkNIOGtacTJv?=
 =?utf-8?B?a01NcUNpWHlOeWpPNVRLem5CL1hTRkZRbTdVaXFCK1pPK014a3dGV1dzN0tr?=
 =?utf-8?B?Y1Z6Z1VLL1FObWxXSFJ3RnNhbGVvamNBbzFPaWJkd0hkRXl2c3JoZjdURDI5?=
 =?utf-8?B?d0Zia0EzQmpxUDd2TVZsRFF3RkM5ZFI5dlhBa01RMVlCQzR3REtVM2doa3ox?=
 =?utf-8?B?SDZhN1gvcCtSNm1pNjFQS3hXcFNKTUkyZWV4Ryt3c29CMGVybWFaY2dMMFlN?=
 =?utf-8?B?aGVFOHl0bzY4ZnU5L25QUHd6aG9vVjJNNVFlM2ZFMEQ2SXFFdWFmQS85Qnpr?=
 =?utf-8?B?SExlc0s0TnZlSnlQSi9BcHorSkJQQjNDdUU5L0FVRzcrNVJ1MTVYOEFwdGFW?=
 =?utf-8?B?N01wbzV1MTJkSzl3djFJdnNsQTNqSmpQOXNEUmd2Rm1iLzM2L3JsekZKRDFa?=
 =?utf-8?B?azZkWGFMK1RwNGNDK0NUMmp1NVBFWWxBMnlXNUYraWhJMk82NUZKNlR3WWdJ?=
 =?utf-8?B?QUdCNnlTWDZ4QjY3d1pYcDdGcG53NVV4ZEFTZDIvbGo0d3FYbU45dUsxNzFF?=
 =?utf-8?B?cnp6bnYwYnhLeTJaWjVUMTV4MnJTL0VDTEVPNzBFNGtCVUNpUjd5VnF5Wjg5?=
 =?utf-8?B?aHBIODRNODAzRm1EYjIreVdKeDk0a1VHSGx3eUxEM054aGE0NjFMUjljTFBW?=
 =?utf-8?B?SjZPZEY5aEM3YXNVNG5MQ1BUaFBQdkUxT2tnb2VxNFNhanY5OHJBcmdaUEVt?=
 =?utf-8?B?OVl0bWVacEZLOVNwQ0tybVp1djBheW5OYlNOaGJBSzB2NXdrSTR2b0wyaXVN?=
 =?utf-8?B?MjF5a0dLMkw3MmhTanhpRnpGMUI2LzFnVm5sVUFyaEdlMTVCd0RZQ2dyZldD?=
 =?utf-8?B?VG9Vc25EUEZ6NDZYMTFWUENQU3c2NW1xN3pJUUpVcFJqM1pTVW03OHJIdUNJ?=
 =?utf-8?B?c3h3Z29OS0JwRkdDSFIxRHUweVN2KytWZ2Q2bGx0U3JheE4wNDd2a0FqRzIy?=
 =?utf-8?B?VGJ3QVFoUDFncmJ3eVNtemptNnpxTE5XUy9hdlJmUE5La3NBejRKbkIwdlRx?=
 =?utf-8?B?R3pkVmxvNi9qUWw2RHFPTnVOc0FUdlJ3R3pSck8wU2pabnVVa05udTMydGRu?=
 =?utf-8?B?ZC9LVnF4OG5XWkg3WWE5c0tSWmJrMVQwNStyeE85cjZNSXhPT0dQeGJ2YXRr?=
 =?utf-8?B?K2pNd2pGTlM2NDU3QnNFWW9yL2NRSWJabk04UFU5NjZINzJEUjB0Kzh2WlYr?=
 =?utf-8?B?VFNuZ2IzcWMySkJZVmpURmZxd2FaMS9XSmVFQU5Nek9qbU00L20zZDJSaDVR?=
 =?utf-8?B?elBFUkxOeHE4Nnp0NFF2ZDVyQzNLbXJvYkpjamY4KzFvRHpnMFlER2hVdDEy?=
 =?utf-8?B?MzFwV2JUZmVKUjQ2TjhtdW9sNHk5ZXNtcGVWSnhzaXZCUnU1SGxRVStGZnl3?=
 =?utf-8?B?QWlVZzRab1hNRnFwM0wyMWZJQ1JkelYyekU4c0NEVzR1cmNIazVrS1JUMkFR?=
 =?utf-8?B?dGxwYVMzcVJhc1ZJRGt0dGFTRWJ5ZnlpeXgxallvQmFXOUNGZHdDSTFndjNi?=
 =?utf-8?B?M201c3JXY3poSTREZ3paclA4V3VWRStPeVIrazJSbWNsVGdlZTlmZVZvTGxI?=
 =?utf-8?B?SjFlL3JrMmozZXA5SnBFa2NZSXZWT2w1QWEvZWJ6bkwzTldnbzVRWXZzNVNJ?=
 =?utf-8?B?M0FIRDcvZGlwY0wwMVRSYks0emFxUXQyT2s1c0hVTWNSRmEwbS9FVlRDdHBx?=
 =?utf-8?B?M2k0ZFAydjg5VVZRVE42bktQazNvNEswbzJxbmpHdGRjck9FZUNZRDEwdlBD?=
 =?utf-8?B?UFo2L3h3YjQ2STJhRkFpVE9ZUXNRdjBSdm5WcjZyOC9IOGNwdGtrQkhuM2px?=
 =?utf-8?B?U2pNR3BjMjRDNnpzM3V1aHltbU1EeTFYaUdYeS8zYkxINVBlRFhyZ2tqalpj?=
 =?utf-8?B?S0VRSmxtTHV5bmZ0cWdBd3E0Zm9pNTFpUkE1blhqWU00aGxwSzZVMTV1emV1?=
 =?utf-8?B?M2hxa3Bhc2dTQVRQRnp6L1c4bVFPaEVjMXVzU1NMaGFSL2dCekhYRzBQMEJQ?=
 =?utf-8?B?SG1nakZGWnBBUWNld0ZMTENlMFFIY3JGOFlobTY1ZVlMV1NJOElRcHJYNmxl?=
 =?utf-8?B?TUYzaFNXcmh5eERqMk1SSjhRdEhqTStNZFNVT2JYdWd6NFNrWUk1UnVnUko5?=
 =?utf-8?B?ZER1YkpyZ3hyaFB2ajY0T0ZTWGRwcW1DWDhvaWtmUldhNHRuS09WUT09?=
X-Exchange-RoutingPolicyChecked: DpPLrnCqnaC+6ciEx4feL0J5/W8RevxvnjaEPvTmRHsUqtvosYR4+4V/nGgp7w5v8ASWzQAwpSYkD/ykGDEM+9MGh6PEvW1bHrRQewltcJ2czCrKktu1cAoGzN88b2N9P8Mi8Y5aK7S0dSa2g0yHKhNruyF09x45Wx8lSFcUq4+Qm6XuneAu/JAIQbm2J7LZpY+To77ryrSwYt2Sjelxqg2s8VqksnIoUTy3uP0qS/EwfLIh2UVNvWxubNAWy4Ird9JK4c5dENyc+7EtfPwuLASGt5QSIJRJ/aNG7lVlyJBfgyWdDdcTvH1hWJX3niAawULbbDrmbWRuoG5WP1G1nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c5d61f-7850-4210-6614-08df4abe7d79
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 06:36:52.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SCMGQDNRJNcYJSG82LK8qL832O9vMhpmIkKxv9EDyH1P+jaUV8FzD6vLnosgnj3WOKdYdh3a82Zo+vneAryL6D+asnsNj7S7aCKX+5uHY0=
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
> An OA stream fd can outlive the device: after a PCI slot reset or after
> unbind. The poll hrtimer and userspace calls on the fd could then access
> MMIO and other device-bound objects that were released on remove,
> causing a NULL pointer dereference, and xe_oa_release() would tear down
> against freed objects.
>
> Destroy a stream the same way whether its fd is closed or the device
> goes away: xe_oa_destroy_locked() marks the stream dead, disables it,
> restores the HW state and releases everything but the OA buffer and the
> stream struct, whether or not the HW still responds. xe_oa_fini() calls
> xe_oa_quiesce() to destroy the streams of a removed device, and
> xe_oa_release() skips the destroy of such a dead stream. Only the
> stream struct, with stream_lock and poll_wq valid, and the pinned OA
> buffer stay allocated until the fd is closed or the process owning the
> fd exits. The quiesce drops the DMA mapping of the OA buffer, which
> stays pinned past xe_bo_pinned_fini(). On a wedged device, pending OA
> batches aren't waited for, nothing in the ring runs anymore.
>
> The quiesce needs no runtime PM reference of its own: xe_oa_fini() runs
> after xe_pm_fini(), which keeps the device resumed with runtime suspend
> forbidden. xe_oa_release() doesn't take one for a stream destroyed by
> the quiesce either, so that it doesn't wake a removed device. It checks
> for that, destroys the stream and frees the OA buffer all under gt_lock,
> so that xe_oa_fini() can't run in between.
>
> Once dead, OA interfaces return -ENODEV, poll reports EPOLLERR |
> EPOLLHUP, and xe_oa_release() frees the stream struct and the OA
> buffer, and drops the drm device reference.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

I don't think this is an OA problem to solve (the comments from Sashiko 
below) cause this is how the teardown/flushing is happening in other 
areas as well.  With that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
> v2: Include Sashiko's comments
> v3: Fix circular lockdep issue due to scope of stream->mmap_mutex
> v4: Rely on drm_dev_unplug() to zap OA buffer mmaps and on the dummy page
>      for refaults. Drop the OA specific fault handler and mmap_mutex. Split
>      out the stream destroy refactor and the runtime PM move into separate
>      patches. DMA-unmap the OA buffer on quiesce and run the OA ioctls in a
>      drm_dev_enter() section instead of the per-GT quiesced flag. Don't
>      restore the context state on quiesce, wait for pending OA batches on
>      quiesce, don't block unplug on a synchronous OA config wait and
>      quiesce a stream released during removal (Sashiko).
> v5: Keep the OA buffer pinned until the stream fd is released instead of
>      DMA-unmapping it on quiesce, so the shrinker can't drop the last
>      reference after the device is gone (Sashiko).
> v6: Run the stream fd ioctls in a drm_dev_enter() section and reject them
>      on a wedged device. Stop the synchronous OA config wait on a wedged
>      device too. Flush the TTM workqueue before dropping the drm device
>      reference on release of an unplugged device (Sashiko).
> v7: Return -ENODEV rather than -ECANCELED from stream fd ioctls once the
>      device is unplugged, also when it is wedged. Fail the synchronous OA
>      config wait when it is cut short. DMA-unmap the OA buffer on quiesce,
>      as xe_bo_pinned_fini() can race with its release. Fix the
>      xe_oa_quiesce() comment (Sashiko).
> v8: Destroy a stream the same way on close and on quiesce, whether or
>      not the device is wedged or still responds, all HW waits are
>      bounded. This also restores preemption and the context state on
>      quiesce. Drop the release time drm_dev_enter() section, gt_lock
>      already serializes release against the quiesce. Replace the stream
>      destroy split with a patch that only moves freeing the OA buffer and
>      the stream to the callers. Split out the ioctl and mmap
>      unplug/wedged fencing and the synchronous config wait into a
>      separate patch. Drop the runtime PM move, xe_oa_release() keeps the
>      runtime PM reference across freeing the OA buffer, so that unpinning
>      it can't race with the pinned BO eviction of a D3cold runtime
>      suspend (Sashiko).
> v9: DMA-unmap the OA buffer on quiesce only, not on every stream destroy,
>      so that a pinned OA buffer is never left without its DMA mapping
>      across a suspend/resume. Don't wait for OA batches on a wedged
>      device. Drain the OA batches in the stream init error path too
>      (Sashiko).
> v10: Check for a dead stream, take the runtime PM reference and free the
>       OA buffer all under gt_lock in xe_oa_release(). Move not submitting
>       the context disable batch on a wedged device into the previous
>       fencing patch (Sashiko).
> ---
>   drivers/gpu/drm/xe/xe_oa.c       | 136 ++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_oa_types.h |   3 +
>   2 files changed, 128 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d37724e28016..2b88f3fa210d 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -261,13 +261,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
>   
>   static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>   {
> -	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> -	u32 tail, hw_tail, partial_report_size, available;
> +	u32 gtt_offset, tail, hw_tail, partial_report_size, available;
>   	int report_size = stream->oa_buffer.format->size;
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>   
> +	if (stream->dead) {
> +		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +		return false;
> +	}
> +
> +	gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>   	hw_tail = xe_oa_hw_tail_read(stream);
>   	hw_tail -= gtt_offset;
>   
> @@ -328,6 +333,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
>   	struct xe_oa_stream *stream =
>   		container_of(hrtimer, typeof(*stream), poll_check_timer);
>   
> +	if (READ_ONCE(stream->dead))
> +		return HRTIMER_NORESTART;
> +
>   	if (xe_oa_buffer_check_unlocked(stream))
>   		wake_up(&stream->poll_wq);
>   
> @@ -539,12 +547,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
>   
>   static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
>   {
> +	int ret;
> +
>   	/* We might wait indefinitely if periodic sampling is not enabled */
>   	if (!stream->periodic)
>   		return -EINVAL;
>   
> -	return wait_event_interruptible(stream->poll_wq,
> -					xe_oa_buffer_check_unlocked(stream));
> +	ret = wait_event_interruptible(stream->poll_wq,
> +				       READ_ONCE(stream->dead) ||
> +				       xe_oa_buffer_check_unlocked(stream));
> +	if (ret)
> +		return ret;
> +
> +	return READ_ONCE(stream->dead) ? -ENODEV : 0;
>   }
>   
>   #define OASTATUS_RELEVANT_BITS (OASTATUS_MMIO_TRG_Q_FULL | OASTATUS_COUNTER_OVERFLOW | \
> @@ -573,6 +588,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>   	size_t offset = 0;
>   	int ret;
>   
> +	if (READ_ONCE(stream->dead))
> +		return -ENODEV;
> +
>   	if (!stream->sample)
>   		return -EINVAL;
>   
> @@ -583,13 +601,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>   				return ret;
>   
>   			mutex_lock(&stream->stream_lock);
> -			ret = __xe_oa_read(stream, buf, count, &offset);
> +			ret = stream->dead ? -ENODEV :
> +				__xe_oa_read(stream, buf, count, &offset);
>   			mutex_unlock(&stream->stream_lock);
>   		} while (!offset && !ret);
>   	} else {
>   		xe_oa_buffer_check_unlocked(stream);
>   		mutex_lock(&stream->stream_lock);
> -		ret = __xe_oa_read(stream, buf, count, &offset);
> +		ret = stream->dead ? -ENODEV : __xe_oa_read(stream, buf, count, &offset);
>   		mutex_unlock(&stream->stream_lock);
>   	}
>   
> @@ -616,6 +635,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>   
>   	poll_wait(file, &stream->poll_wq, wait);
>   
> +	if (stream->dead)
> +		return EPOLLERR | EPOLLHUP;
> +
>   	/*
>   	 * We don't explicitly check whether there's something to read here since this
>   	 * path may be hot depending on what else userspace is polling, or on the timeout
> @@ -865,7 +887,9 @@ static void xe_oa_stream_drain(struct xe_oa_stream *stream)
>   	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>   	long timeout;
>   
> -	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
> +	/* Nothing in the ring runs anymore on a wedged device */
> +	if (xe_wedged(stream->oa->xe) || !stream->last_fence ||
> +	    dma_fence_is_signaled(stream->last_fence))
>   		return;
>   
>   	/*
> @@ -1716,6 +1740,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
>   			       unsigned int cmd,
>   			       unsigned long arg)
>   {
> +	if (stream->dead)
> +		return -ENODEV;
> +
>   	switch (cmd) {
>   	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
>   		return xe_oa_enable_locked(stream);
> @@ -1755,33 +1782,69 @@ static long xe_oa_ioctl(struct file *file,
>   	return ret;
>   }
>   
> +/*
> + * Disable the stream, restore the HW state and release everything but the OA buffer and the
> + * stream struct, the same whether the stream fd is closed or the device goes away, and
> + * whether or not the HW still responds: all HW waits are bounded. Afterwards the stream is
> + * dead and any further read, poll, mmap or ioctl on the stream fd fails with -ENODEV.
> + */
>   static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>   {
> +	unsigned long flags;
> +
> +	mutex_lock(&stream->stream_lock);
> +
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> +	WRITE_ONCE(stream->dead, true);
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +
>   	if (stream->enabled)
>   		xe_oa_disable_locked(stream);
>   
> +	wake_up_all(&stream->poll_wq);
> +
>   	xe_oa_stream_destroy(stream);
>   
>   	if (stream->exec_q)
>   		xe_exec_queue_put(stream->exec_q);
>   
>   	drm_syncobj_put(stream->ufence_syncobj);
> +	mutex_unlock(&stream->stream_lock);
>   }
>   
>   static int xe_oa_release(struct inode *inode, struct file *file)
>   {
>   	struct xe_oa_stream *stream = file->private_data;
>   	struct xe_gt *gt = stream->gt;
> +	bool rpm;
>   
> -	xe_pm_runtime_get(gt_to_xe(gt));
> +	/*
> +	 * gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal.
> +	 * Unless it did, the device stays bound while this holds gt_lock, so take a runtime PM
> +	 * reference only then, and don't wake a removed device. Free the OA buffer under gt_lock
> +	 * too, so that it is unpinned before xe_oa_fini() and xe_bo_pinned_fini() can run.
> +	 */
>   	mutex_lock(&gt->oa.gt_lock);
> -	xe_oa_destroy_locked(stream);
> -	mutex_unlock(&gt->oa.gt_lock);
> +	rpm = !stream->dead;
> +	if (rpm) {
> +		xe_pm_runtime_get(gt_to_xe(gt));
> +		xe_oa_destroy_locked(stream);
> +	}
>   
>   	xe_oa_free_oa_buffer(stream);
>   	mutex_destroy(&stream->stream_lock);
>   	kfree(stream);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> +	if (rpm)
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	mutex_unlock(&gt->oa.gt_lock);
> +
> +	/*
> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
> +	 * is unplugged, this may be the last reference on the drm device, so let the destroy
> +	 * finish before drm_dev_put() releases the GGTT.
> +	 */
> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
>   
>   	/* Release the reference the OA stream kept on the driver */
>   	drm_dev_put(&gt_to_xe(gt)->drm);
> @@ -1810,6 +1873,11 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   	if (!drm_dev_enter(&xe->drm, &idx))
>   		return -ENODEV;
>   
> +	if (READ_ONCE(stream->dead)) {
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +
>   	/*
>   	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
>   	 * buffer's own range in the drm device's address_space below
> @@ -1958,6 +2026,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	return 0;
>   
>   err_put_k_exec_q:
> +	xe_oa_stream_drain(stream);
>   	xe_oa_disable_metric_set(stream);
>   	xe_exec_queue_put(stream->k_exec_q);
>   err_free_oa_buf:
> @@ -2674,6 +2743,49 @@ static void xe_oa_unregister(void *arg)
>   	oa->metrics_kobj = NULL;
>   }
>   
> +static void xe_oa_quiesce_gt(struct xe_gt *gt)
> +{
> +	int i;
> +
> +	mutex_lock(&gt->oa.gt_lock);
> +	for (i = 0; i < gt->oa.num_oa_units; i++) {
> +		struct xe_oa_stream *stream = gt->oa.oa_unit[i].exclusive_stream;
> +
> +		if (!stream)
> +			continue;
> +
> +		xe_oa_destroy_locked(stream);
> +
> +		/*
> +		 * The OA buffer stays pinned until the stream fd is released, an mmap may still
> +		 * hold a reference on it. Drop its DMA mapping now: the fd may be released, and
> +		 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
> +		 */
> +		xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
> +	}
> +	mutex_unlock(&gt->oa.gt_lock);
> +}
> +
> +/**
> + * xe_oa_quiesce - Disable all active OA streams on driver unbind or PCI slot reset
> + * @xe: @xe_device
> + *
> + * Destroys every active stream like closing its fd would, see xe_oa_destroy_locked().
> + * Only the stream struct and the pinned OA buffer stay allocated until userspace closes
> + * the fd, at which point xe_oa_release() frees them.
> + */
> +static void xe_oa_quiesce(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (!xe->oa.xe)
> +		return;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_oa_quiesce_gt(gt);
> +}
> +
>   /**
>    * xe_oa_register - Xe OA registration
>    * @xe: @xe_device
> @@ -2985,6 +3097,8 @@ static void xe_oa_fini(void *arg)
>   	if (!oa->xe)
>   		return;
>   
> +	xe_oa_quiesce(xe);
> +
>   	idr_for_each(&oa->metrics_idr, destroy_config, oa);
>   	idr_destroy(&oa->metrics_idr);
>   
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index e876e9be92ba..e60a90bae1c6 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -214,6 +214,9 @@ struct xe_oa_stream {
>   	/** @enabled: Whether the stream is currently enabled */
>   	bool enabled;
>   
> +	/** @dead: Gate HW access when device is wedged or going away */
> +	bool dead;
> +
>   	/** @oa_config: OA configuration used by the stream */
>   	struct xe_oa_config *oa_config;
>   

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

