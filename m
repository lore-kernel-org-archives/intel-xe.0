Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A646606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EnmIAoek;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QuiPLkcq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297E810E6AE;
	Wed, 18 Nov 2026 07:33:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC9410E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794987204; x=1826523204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=MT+E1bRdfBmy4N2MMqqY1h8WDDkc5ZbT8eNPonpFdL8=;
 b=EnmIAoekz6dqeV45SjYaWIU0UwfUTMgQBlJYXBwrGlWKHDwm8qB2AZBi
 xywxXC45gNhGTIskJ4xXpa19Erf0kTmXW2uNYjpPczg9rqyYEqWj9R6rm
 lTAgRMbdz1uDOlEj/F4C9lUFEZZfAvAnmFGLUQj4n47gT4H5h3fgql7Q8
 nFAL7dKazjYCGTpOYIBfXa/wmvzjUcVATm18dGueTWo7ePtZrSVScpBzR
 Tfz3PFIYwf+RgplydHeoX5fvmVoktmjQKkAaM8DyKWhY2jk3WFomZ4XOo
 /ZMqToeJpOBugiBUrZ+XK4jUhEehN9vGCV6kW4EDMTg1eFLdxip04oggb g==;
X-CSE-ConnectionGUID: MuOMasAWROK5ku5BXaTamQ==
X-CSE-MsgGUID: ztqklmlpQ1mn9PMIRy8a4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3706254"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3706254"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 23:33:21 -0800
X-CSE-ConnectionGUID: YG7pL9RYRK6iMakWTu/9PQ==
X-CSE-MsgGUID: PUJt4h2eRVuO2Oa8h1f05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="10058272"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 23:33:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 23:33:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 23:33:18 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 23:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKTUT0JcbX/y32ka2GZuVNjloTcvzl4MUH+8YgsC3S/TtUo+ux/LIFGueEg1tMXSuCMZ2jxYVu7qxCu6AMEi+k5RiZFXGUXxnb9IK9xTZfch6geWFB60mZjtUthNGCQLkCqgozze70KsTPlCjSIAWD6KmGq25eAGex6S0MZV4kxVy8W1KeJFCNg2pa1KlLodivjKFw/xCsHjyWtNKYGf+vAm4hH9ScD1QvBBTPYTgRtAvn+c2V34CVjp584bKOb6s1iTy70yEr6M1Ci6586rrBINT70BhRgapbvbgOPFGx3cApLvW6CsrFztJviFuT1XlhI+MN11YzynGjxdhUNnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxos6qKkgU6zgik5pjsfWFO0HbE4DLZD/VLf3Gav5pw=;
 b=cIS/6C42QsDTZLqzh8T8Y+OL6Z/PrOivdf3VUwdr8xrhOqGhMi5WK1dYIp14mQ23wr1Yqbn99z6WyDwMRC2pFovJmCbzR+0UXaUbPatqUD/5IrcFgBM5rlHWRJ93JvR6m1qmOwrT75vqAU8ADFJ4aQcDWBWncZyYbWG2Ni7SOrDprhQuB/B1JIeUJl9z7A6XR6r4oFCbexcFy6xw/giQeF9ckxyPumhk5FnfYh8+GKswyQ/X2TS/tVcDSLpb3z8yStp3RpPoTS2KWZU0ml4akz7WarMEuqtKfIvjr1H1MLEnId91GIkB5rvB6Q2ZEfU3ISb/nQlzjit8RfGkf77APg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxos6qKkgU6zgik5pjsfWFO0HbE4DLZD/VLf3Gav5pw=;
 b=QuiPLkcqtdjFuIOtETHBIHi1sPSlYDaetwVODXyT/PIXAfSKcTM3129jfemTRMSmyswJBKxp0zwqyCHL5TIjFW2UxRCYL4c/KT0OZDFms1X2FAyQh7zqXOvE5GrzJmUmWjjCqbes9VRGKiUAr+Myrj7Jki2i1zmq5Iybo51/tuI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:33:10 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:33:10 +0000
Content-Type: multipart/alternative;
 boundary="------------YynuxVyLhUZ4rB8sUmgpUI3t"
Message-ID: <72fa0db6-8809-4cfe-82cb-c4dc03888a2d@intel.com>
Date: Wed, 18 Nov 2026 13:03:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] drm/xe/log: Add software CPER information to KUnit
 output
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-13-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261112134636.1860446-13-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2c8568-8fe8-4bcf-8184-08df45463227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261102123227099003|261022075727099003|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261009223027099003|18002099003|22082099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: 9bM/Oc1dZSFHCc22AJsZ1jrYqEd84uG3CkmS9FqyiTq7FS7jUo2J5ML36j9YNN7a0iOLIvfCrSgm4C5tmLMQswCY/KuSVnmYBGaLJRjX3TaN17zesUG8d+5wk7Ht1SJckWZQ6dqyLzKo/xZi86GwAbkN5Euofxpzt4QAVLkd+Xha3OzySMjfjk/O1L4nirfdztwTJ3Jm2Oo6K5p/YxtPmSlGZs6mP2GhyyHTncqZ6sJ9pErgThiecKHNX38zRShvJE7b7fJS5jFKmKix8yadTn54aXtg1ddh4MuPHJ0NeujHLU6b/O9+kQapudCUojZwIxkF66yGXMbmT6rifMD70MYRIkbuZi1pYXY/O0RLAZAQK/kSjdvXMt96OQrVMd9XS561hNxlaGwj16GTytZYr109kHMnb0pIg+tuimzd4mnFWsk6O9mRCc/X/hEUwmxqP58BJrHDpvp60dQZ/fT0pw0JFVMhkApb0/zkRx4lOJ4jUAKxMpdgengGRQ4XXOzjsaH5NiuvLUToLBr+Pz5ANS1OQ4zNGH4pfkeTmIoNIkND3jNUW/UcDSSfBzhuiAZVa3S57ol3ZyiVNsNB4yPihHbwJiuU2h7r5bcExQZk0hrWfsRRjX3pAQtYTAV4Qzw2yzg3BYQT+McIWrFGW6bC2ltJlGie2KO3DI9yLoYJUUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261102123227099003)(261022075727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlhc3RkNmN3STFheGNPcThuOGIrM3VlMnNmMUtlL3dGdnBJZG1ZcExrVUNk?=
 =?utf-8?B?UXd4VVBNam9SRjNtZjdzdEtjdWZXV0d3NGsyOTRPMHhaUCtZQ2RMeXJhUGg1?=
 =?utf-8?B?YWk3MVgvVTBSaGtlRURkTGJialN5RTBEd3FuUHBKcEdjYk5OYmpYR0xEVHl1?=
 =?utf-8?B?RSt1WUNoRHJsdEYvM29BcU9CYzJHOWFkc0lPWWtUdGJBT0lzUGxNMVdIRGJq?=
 =?utf-8?B?OHhzdUo1cVJQZ3BwenBkeXMxRTI0c1lHZ0tqNUk0UnFuNjZQRHltSm1LRVh5?=
 =?utf-8?B?UWFIc09hbENUNGNkdnQxSXkwVjk4S0UvcEE1Ukl4dnpRUzVxQmtyd0svSXI3?=
 =?utf-8?B?WjZwMk9Tc1o1S1JGaGFpQktaTHdNcGZWVlVqbVNjT1ZMU1psU2VQWStQNzEy?=
 =?utf-8?B?bTE1K09iTkxyMm1qamROYkRwaENUaWxQRm9LVHNpV05qTXFSOGRyaXNCZXNT?=
 =?utf-8?B?NjRyVnVkMWEwdmYrd1p1bElNK1VpN0tEY1J0NE1oWHRCdFhRa3dYQ2NEcU02?=
 =?utf-8?B?N3NpZXo2MWtOakE1K3hJVWdWS0xoOG5NK1ZDVDE2N2RXaGZhanVzeFpsYjBq?=
 =?utf-8?B?MWtDQk44U3VaaFg4TDloWTlHbWptNklrdzVyVzNxRWNBY2dKSFlyanIwMmxs?=
 =?utf-8?B?dGVxUFV3NFhMVG5EdXIrb3dLUmp0ZXg1TnhvalYzQVczWGNwc0NaRXg0ZUxP?=
 =?utf-8?B?clBzbDNMQ3pJbnRVR3JxcmdrTnVoR3NIZkphcTRFc0NmajhtR1JUZEx3L2py?=
 =?utf-8?B?YitJN2hrdk1RSnpLWEh3Myt4eE8yU3NYYklzSFhpUUN3ZWpkWVpBOU1NL3RF?=
 =?utf-8?B?L0pLRnNkZDhpbzFJWTB3clZUaWlVeXBFbWNSQXZ4c2FGeHlXM1NydnZXaXQv?=
 =?utf-8?B?dEYwU093aUhoSEVvdUNGVWxDaUs2elk3am5yTHVrbFV2UGZMdklqSDlqWGR5?=
 =?utf-8?B?Q1JQVmNGRllKUWdpTkRMMzJRK1Jydk5vek1EUU5lMjlzZHRLYWRTRytDVGNE?=
 =?utf-8?B?MWRaZHF4KzVQN2JLbVdxcVFQd2EwV05jOGkwZ05Dc1M1TTdrNmwvSXN5NW5m?=
 =?utf-8?B?ditqbG9GaGZkMjdlTlM0bDc5My9CeWVSVTR4WGlUZisvelNvNzkwcE1MTXZL?=
 =?utf-8?B?SW5ZUDFsYnV1RXhQYUh6T2t2QXlmN0p0VVExNTdpQldaTVYwWVc5bWtMMmhk?=
 =?utf-8?B?MG5YV0ZSWFU1Z0MxNGk1V2s3dVdvQlR4U3NheTZJR2pPci83Z3JuVEF6aU5r?=
 =?utf-8?B?RklDak10WnhicHptYkNGMUFqQ2gzelRhbXhCYlR2UGhLK0hKTWtiYWY0RkxI?=
 =?utf-8?B?TEFwMk5Kc0E0cUFjTHpaWW9uZnBOM1VQL0tIeXJiMHRIeW9PcFQyOVJvSERz?=
 =?utf-8?B?RnZKeWgvOElGMEVFMElWL0JIZ2JqL0dobTVpVU9QVWlrNlgvazd3VnI5M3lX?=
 =?utf-8?B?MlFPZlY1bXdrdS9nUkhwb2kreHhWeHAxbkp6WnREeXd2S3NjV3ZnYVVma1F0?=
 =?utf-8?B?Ri8zY21OZUQzNmJUK3QrMGFxSktweXJNQ1pTbHhYRklEeFBWVkdZZFlxWWFF?=
 =?utf-8?B?aHAvNmFCZ1NoaTkybFRjQWRlUjBRRGJBSzNpeGs4MHpGRFVaaW5Kczlwa01m?=
 =?utf-8?B?QmNYeE84YXdWRCtMajd1WVFGbTFIaHY4b3BiaFpLZlZCenNZSVZKdnhVNjlI?=
 =?utf-8?B?aE82Nk9KZWtBUXdIWElpYUIzeW9vNHk0Rm5zMHkzNHpiUFZSNmRxU0ticjRC?=
 =?utf-8?B?emQwZElVVEV0TE5nWUhHSlVqT3lRdGdkU0VuT2NYYjJ6SlB2TEpDR1ZMb1Ar?=
 =?utf-8?B?b1QwK0krejFtWjRudkEzT2gvL0NGUWxTZmlmbnJuK2R0aGtrTCtmSWR4c1NB?=
 =?utf-8?B?dmpEVW9lc0hMaDZWbU9SaWlMQzZxWDhUYktSSkF5Zk5aSXVuWEpZcFNEdkRI?=
 =?utf-8?B?ajZHRDRnMFEyOU5HZVl0TlliaXp3OCtVNFpFUXMrVVNSOGxtVlRwQmNkdDNr?=
 =?utf-8?B?M1dxaExkSklENHBYWXZoRDdSdDNrNkN4RkNUZ05kWGU1VU1BYWlwYzNLZm1n?=
 =?utf-8?B?Q2lFYmJoNllSRGFOMW1zcU56eWhVRzU4MjB0OVFIZDUwSzZ1UCtmNHQ1eFo5?=
 =?utf-8?B?VHZ6UUNBVWZ1U3lNaHBDMXVHZkg2djFFSndKNGdmbmZwdnhtRmlSL1VLdDNt?=
 =?utf-8?B?Ykl3WUdzWlZpZXlHdVcySTg1OFNMUk5wQ1VtVzFEaXJqdkR0SjZHTGhFK2ds?=
 =?utf-8?B?Ym1lOFN5MVR6aENBVHRxa3N6bmFxT1R1L0JkTVlSSjQ3bFZlWndIbi95Rm5v?=
 =?utf-8?B?dlZtYTRreGdMNTRNTXdacmM3cWlyYUdSZmxjSVo3UGxJRVJ6Ym1xQT09?=
X-Exchange-RoutingPolicyChecked: O8drQcS4Vbh561GQbSSxyepwuv+8YKrXsp3gdWd+kTu2nRMBb4aLrG20SUqOEMHlgXbqklrspEAmQ3fE48e65w1U9bpz8BPmF3421Z1tajGuBgkWNfzXwxJxqubyrPED2QPW0NA3kMLaMl5+T/Lk3TKS/yY+eol71dF3kC96ym6Le4HOEwQIkbJ9o3CsI27kVhi4zA89B1JFyy6sMYw1Uh3bXy20s0wo6T7dFSn7fnkN6Y4IXl2zTbkKMw3vcwe/2Pk1IwJ9VHrovhelfyWcq1xue2Mp8DPGYf8y4fBuH+JLsieDAoDAjy5r3iMW9mpZN6LmxDUukaAcV+vR95LVDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2c8568-8fe8-4bcf-8184-08df45463227
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:33:10.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYHqnJAfsd6LnL4HYq3+cbim9FdNqS7Bnwspu5RpA/5+fTIDXVSUCuix59UhIVDA7gkuppu9Ty2AX10k2ZgZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------YynuxVyLhUZ4rB8sUmgpUI3t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12-11-2026 19:16, Mallesh Koujalagi wrote:
> Display driver classification details for software CPER records

Could we use “Print” instead of “Display” to avoid ambiguity with the 
display driver?

> in the fake CPER emitter used by KUnit tests.
>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> index 56c36c8a08e1..08828ecc9098 100644
> --- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> @@ -6,11 +6,14 @@
>   #include <kunit/static_stub.h>
>   #include <kunit/test.h>
>   #include <kunit/test-bug.h>
> +#include <linux/minmax.h>
>   
>   #include "tests/xe_kunit_helpers.h"
>   #include "tests/xe_pci_test.h"
> +#include "xe_cper.h"
>   #include "xe_device.h"
>   #include "xe_log.h"
> +#include "xe_ras_types.h"
>   
>   static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>   {
> @@ -43,6 +46,19 @@ static const char *location_type(u32 location)
>   	       location ? "?" : "";
>   }
>   
> +static bool is_sw_cper(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
> +}
> +
> +static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
> +{
> +	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
> +	pr_info("SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n",
> +		cper_sev, (u16)component, (u16)location,
> +		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);

This only prints the driver error classification fields and doesn't 
actually emit a fake CPER record. Do we need to call this 
fake_emit_sw_cper()?
I think this was introduced when CPER doesn't exist. Now does this test 
needed?

Thanks,
Badal

> +}
> +
>   static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   			   enum xe_sigid sigid, u32 component, u32 location,
>   			   const void *data, size_t len, struct va_format *vaf)
> @@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   	int n;
>   
>   	pr_info("\n");
> -	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
> +	pr_info("CPER SEV=%u SIGID=%u \t# %s\n", cper_sev, sigid,
> +		is_sw_cper(sigid) ? "software" : "");
>   	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
>   	if (location)
>   		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
> @@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   
>   	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
>   	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
> +	if (is_sw_cper(sigid))
> +		fake_emit_sw_cper(cper_sev, component, location, data);
>   	pr_info("CPER END\n");
>   }
>   
--------------YynuxVyLhUZ4rB8sUmgpUI3t
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-11-2026 19:16, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Display driver classification details for software CPER records</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-style: normal; font-weight: 400; line-height: 20px;">Could
        we use “Print” instead of “Display” to avoid ambiguity with the
        display driver?</div>
      <br>
    </p>
    <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
in the fake CPER emitter used by KUnit tests.

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 56c36c8a08e1..08828ecc9098 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -6,11 +6,14 @@
 #include &lt;kunit/static_stub.h&gt;
 #include &lt;kunit/test.h&gt;
 #include &lt;kunit/test-bug.h&gt;
+#include &lt;linux/minmax.h&gt;
 
 #include &quot;tests/xe_kunit_helpers.h&quot;
 #include &quot;tests/xe_pci_test.h&quot;
+#include &quot;xe_cper.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_log.h&quot;
+#include &quot;xe_ras_types.h&quot;
 
 static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
 {
@@ -43,6 +46,19 @@ static const char *location_type(u32 location)
 	       location ? &quot;?&quot; : &quot;&quot;;
 }
 
+static bool is_sw_cper(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
+static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
+{
+	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
+	pr_info(&quot;SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n&quot;,
+		cper_sev, (u16)component, (u16)location,
+		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);</pre>
    </blockquote>
    <p>This only prints the driver error classification fields and
      doesn't actually emit a fake CPER record. Do we need to call this
      fake_emit_sw_cper()?<br>
      I think this was introduced when CPER doesn't exist. Now does this
      test needed?&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20261112134636.1860446-13-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 			   enum xe_sigid sigid, u32 component, u32 location,
 			   const void *data, size_t len, struct va_format *vaf)
@@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 	int n;
 
 	pr_info(&quot;\n&quot;);
-	pr_info(&quot;CPER SEV=%u SIGID=%u\n&quot;, cper_sev, sigid);
+	pr_info(&quot;CPER SEV=%u SIGID=%u \t# %s\n&quot;, cper_sev, sigid,
+		is_sw_cper(sigid) ? &quot;software&quot; : &quot;&quot;);
 	pr_info(&quot;CPER DEVICE=%s\n&quot;, dev_name(&amp;pdev-&gt;dev));
 	if (location)
 		pr_info(&quot;CPER LOCATION=%#x \t# %s.%u\n&quot;,
@@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
 
 	n = vscnprintf(msg, sizeof(msg), vaf-&gt;fmt, *vaf-&gt;va);
 	print_hex_dump(KERN_INFO, &quot;CPER MSG=&quot;, DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
+	if (is_sw_cper(sigid))
+		fake_emit_sw_cper(cper_sev, component, location, data);
 	pr_info(&quot;CPER END\n&quot;);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------YynuxVyLhUZ4rB8sUmgpUI3t--
