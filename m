Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9ECC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 16:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6E10E5F7;
	Tue, 25 Aug 2026 16:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ycz0T8YA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E932F10E5F7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787676286; x=1819212286;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mgjMJTEJrneRuFjbKxVCMVCYHUdMONJ54GiufynSWtw=;
 b=Ycz0T8YAuIO2rUdjrvwQlafoYX4o03bZ+0eZeIlDUcTCBCsuanaE8Hc2
 WHrmeHHTyRGyj+Sv/zhmLoLTen1MdjI+JdYacvnm9Zg4fbLpQ8y2y3HEk
 biB3nvl9u+zjWvwgsvDetPpVpKMVD6krTsbbkX815Nb9YHKyQtZ0K8IuK
 BMHAGLn2Qyuz9tKa3+CBa1wSqAMlX5v5OAM41jggD58eBckIa6ghHdaWD
 aiOtGjSO8Z4J5tAr8DdwPHjRR2HQHvTFLlIyepGVAtinuVfmOPdNa9gQc
 piL2XBGs4b4rQqmC2eo3NrYB3CcH/Lkpbf+HUk4aTxyN5w+Kp7sa7bXTB Q==;
X-CSE-ConnectionGUID: /lY2+3lETcypQ2OiIRUSPQ==
X-CSE-MsgGUID: R3kxWXl5SEmEpjItUNarQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88355664"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208,217";a="88355664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:44:46 -0700
X-CSE-ConnectionGUID: qKHA1QZ2ThahWn2qCw8Sbw==
X-CSE-MsgGUID: S8HvtXY+SUOgFSTmbXi7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
 d="scan'208,217";a="267901429"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 09:44:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:44:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 09:44:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 09:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzw8sg4XwFZ5SzzHAAMmDj2HxhNwIbRPoLVfbvirHAYApaQrmoFaKFRq5EOqvu091ApFg432oragsgKEDoCblMMMTco5ddZDpgWh1jegZU+c2ZONTQxGydG5Xz8WszaGNvhimSodIjlutE4UBbwN92sUhokJAGfTRIPFYiLzkjZgTqpM0DiYOpNtavkuq/8MY75uq3GJp3gBl1gckMd/KSn9jP5M1wiaObC3oEgsgihogqzgU2i6/r8TZ6xrlTFmw+XOFTGa+/RGWZelyMxq4Y4vvjXElJWzL6KY748GHPkE8vJOTl84WLWcF0vYFO5+NGNDzgKNVB4F6bHSG+zKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3GL9no1K9OJaqSNl689uOagaLG2N1oB8MvG5x4wv2A=;
 b=i6eMqebfznkMSYqylTgLrH/N5wnYzR5Kr2sjiiZZpmcP0NYf3k5IL2YiFejAzMSDxFCzlNUCDk1Q1CMgqUbOTXSAaHUsxrfL4yNl6VDqZExJGUiGepft18GsQUAI4ePzpZyLqeyMAtuLjA0C8J+LM1RT5fxKCh4StqNJS1AcorAVyxEOAarWeyxJcfk7SQb00+MAu/mxX8pknOHkM0R6J0m96CQRwXrhiV/kdZBVLs+9BjHExnrNUyX+IopaiMmRoUDq/b11I5Y48A7IrF3mHh0jC4h34SLDzt0Ci/ip1VkIaYCQcjwK1wmjQ8kWmU4fW0tUIpPyWek3ROYbp6+75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:44:39 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 16:44:39 +0000
Content-Type: multipart/alternative;
 boundary="------------uM7UhJWWwbwGC66xqh0Vso0w"
Message-ID: <d403a125-6287-4088-a254-8bf40f689124@intel.com>
Date: Tue, 25 Aug 2026 22:14:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
 <20260702111401.3680214-11-badal.nilawar@intel.com>
 <8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com>
X-ClientProxiedBy: MA5P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DM3PPF208195D8D:EE_
X-MS-Office365-Filtering-Correlation-Id: d3995a50-9bb6-43bd-3605-08df02c827f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003|4143699003|8096899003;
X-Microsoft-Antispam-Message-Info: QmRxkigiCqymIfLeIp/doEewDkR8HJnQZrrmqsW2skGmnbKqpHku6Iw6HX+CuY5+s3jg/J4eVMqhnyYH0tSp42nbYuYAgjcvLIF/lPDL+ytb2kIUbl591yT7vkzqhw5PQhPwqUYV83Pb/+Sr2Xe1kvQ5eG6esm6W9QziuSupcLC1EjTw12ge65bqbEW9nTz3pCDX6++J6s+4UfQ8AOCoGs78C9cmTiCtBonbUeS5vKROYKGyQOSVxYlr8VUGumW6CvguB3Yc+LXqad7HlB2P9sIN2sMfEi+XGfsRth44+GdsjF0Tfs5SXepoLvwHQs1CX2LPaqxGkjO94BwETepC6x8GyKr9FBGJjFNwgp34tBX1TjBZPVFAH8qh/55xf740e3xQtL3Iy+uRZl0/nBx81H1LGRX5H0obktvlmb4MEZDwvUuPXmQYji7swI8Kk6DmimMLrRFVlUGGsviMmhc2GMwg5AGf6kKYq6gUCil6+/C2c6PhrlKeCN6NpC5QQqBplh6QDxW3KFUYw6ZVhpSGC2Fmk342FIZyYQA8v4OVsHXeGSSTwr+GXotfHVcGiRXVwzFbqtMhr0iFyZbjOIwiAJr8Ds+dvJ9/YGADhGcthdBAOJtIIZTrUOiI9ILRwAHNZjk1UaCstE7GaMU9Rshve6RZFirMBL/iUiFgmdfEoME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003)(4143699003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um94VVB2NFZ2NjY4bTNEWXZVSDFkMzhHM3NsbHo5OXJwL0c3ZjVRNXlGT0RL?=
 =?utf-8?B?cFlFNGJSbXhFSFMvN3pxNDRGeEVyU3o2RTlJY043djlyMStsQUMxV0RCcGs3?=
 =?utf-8?B?NXhZelVlZ1VJVElWK3dHSVV2RVFyV09jS0VJZElXRUFZOTRPa0tVZFV0TEdw?=
 =?utf-8?B?TVVlK2JYZmJWWXhjUnFicVpKWjZrT0lrNmhxcEp5ZXBLNG9MaGZrWFpLTXNW?=
 =?utf-8?B?aGI2MUhJaDdFZzM0OXBYenNaQ0lWcE9RTlhsYkJvTkNrN0Zma2l6b0lJY1lG?=
 =?utf-8?B?SU9ldE5IekI3MlJmTjcyZGJzS25DaVloM2xmQXVHWlFxNHk2bDdyM3pvMDRQ?=
 =?utf-8?B?a2tLNmkzaHV5Mko3bHBHMEJTUEpxN09vRHAxanNFZVRJcFFwbERkVlBYaU1j?=
 =?utf-8?B?aGRodEZhdy9OTGlOQnhhN3dwaUozOXU3REZYOWpGeUdESGFwU1ptZGVCUkJw?=
 =?utf-8?B?b0VESlVBeDJScjF5dXhCbFhtQy9LMXF1NVFIT0VEV2xTSVZqalNwcFFJZnBR?=
 =?utf-8?B?Qkc5dTlGRnFvMlQwV3VvbXNVZnRYanVIZHJUTVN0R2tGNVJnYjZkdjBENTFL?=
 =?utf-8?B?QXlTTVhtT2Q2MXFKaEcyTXlIczJmdHUra1psYkFWOVh5ZElhOHNuamFldUFX?=
 =?utf-8?B?ODkrelFOb203Rk5PZW1jSzZkS0pyU2pZVC9oVXMrMXJvMzExb1dkN251MHZW?=
 =?utf-8?B?SEQxOGZzc3RCcVZxWDRIblRKZE5ZdFpXQ2JURU5tTlNBUEpocytKa21QT2Vs?=
 =?utf-8?B?ODRXNUY5R0pkd0lHVWEyK3hPTmZFOXU0QTRibjFFMkk0OE5uKzUwYzJDeFI2?=
 =?utf-8?B?Zk5Eck8rbENmdzA5a3RpMG1MZmVucTU2Uk5XTEVSdVdqSXR5czc2NkZBNkdS?=
 =?utf-8?B?NVdvbnMwOTVabVcwRDV1ZTlpdE92clVOSjFDUmt6Z0RlTU5kSTlGQVRJOFZ0?=
 =?utf-8?B?TlBOQUNqZ3h0bWx1V3hwZUMwS0FnM1NzZmxuMjVuYmN2allhakoxMDJkVnN1?=
 =?utf-8?B?TFJTMFMxdDU0bHRUQWhnNDVuNytxRWhKN3JYMk92U3QwZy9KdXdydCtwU0Jy?=
 =?utf-8?B?RjV5ZWRERmdqTlh4WFY5N1lQbW5TNWh5UEszQUk1YUNMd1VuU3R1NVVpdHMx?=
 =?utf-8?B?aDFCMSt5Y2U1cmtFTDhnYlE1NTRqV3ZsWjc1dHhRaFBpWWk2bWFsRjI5OWpl?=
 =?utf-8?B?VHJ3STVjdDZQaWZHeGtFd1ovOHVMdHdma1RkdnU0dHp6RXREckhub1hNeVZ5?=
 =?utf-8?B?UjlWazhzZWxQM1dVN21pdHZWMVY5K3hHZGtZVmhzSDJyZzhBWHRxRjQwakM4?=
 =?utf-8?B?Mk44aXlhclFDamdWS0xKeWhvTk9KcVMwenRmMVlBc2VqaEx1YWw5MVZhVFVi?=
 =?utf-8?B?cjlLcEZaNWQyNjNiWTZXdFNYakZ6cEtMUmViN3BBYXVoWC8zNVk0eHNDN0dW?=
 =?utf-8?B?cXUrNVpLc0xUaHZwaFlBbnl4MzdsV25NcDFONFdlVzJYWGFuaGN3aFptTzhp?=
 =?utf-8?B?ZittNWplSW1BUXhoTUZGQ1ZwVHd4QUpTRGtjYmNNZG8xTXVMWmIwTUJ1ZHpI?=
 =?utf-8?B?SlNiTVE0eGVGaXZGNHN3dDRJUHQzN0JhazFaYXFMU1k0RVJUU0ZaeCtqcWJ0?=
 =?utf-8?B?Rk9uYTNEVXh4WDJhMjF4Nmh6aXZoNndQbjl6WUZ4NEZvLzJvaVBOa052cDNC?=
 =?utf-8?B?bmlOQjZMemVyVVpCQjZtazdLUTBmODg2cGR3Zk5iMElxVzZhZEJ4YTZ3OUxr?=
 =?utf-8?B?UHlHMGVGejV0aUNmaW5VRy8zOExYRlRkaUIvVGVRVW56NzFKZGFFOVNqU3lo?=
 =?utf-8?B?cWVPbVVJenphT3lNUzhkZXlELzhzZGhDMWVBU1ZQTGxNRUtpOXc1Vk9VaWdX?=
 =?utf-8?B?Z2QyNXo2aE9scUlrTVh0RVJwamUySXpSTFM5blNwSm5zTmRmclRRMFBrd1ZL?=
 =?utf-8?B?U25qdisyeUhmY2h4QTlaaW01SWF3V3J5Ly9tWnkvZHJKcGRZaldIclN0VDkr?=
 =?utf-8?B?SDA5Ukk5MHhRUkptcXdGVGlzcHhqMThzMVh3cDZZMlBnSWNseVFnU1FkcnJ6?=
 =?utf-8?B?anJaQUdycHF0bEFmTzRrcTk0OHNvZmdZa1h6ZzhNK29lbTgvU3JxMlR5Wmkw?=
 =?utf-8?B?SFQ0ZnFDVkZUSnVhWEdoSUQrZk15NVZUU2VhL1k4QXo2dU5hcE1lZVhTSlEw?=
 =?utf-8?B?OWx3R250RVV3bVVQc1RBOFNXZzdEMXVCYWp2M1ppN2xLdk0vTkpUVXVnMzVx?=
 =?utf-8?B?bC9JSWE4UXFSUnZla1BMdGpUWmE0Q0VocXY1dDNxcktFQ1VWOForUGtFMndi?=
 =?utf-8?B?dUVjRWR5YndtSktxbU1rS1F5R3BsWHZKR0E2QWVKMnRWeGNmUE1xdz09?=
X-Exchange-RoutingPolicyChecked: CD8SCUCwNoA42qs3qqQKtm1vkitgsg9T/hZ+V7eXfzxrdLoS8FKaeCfqEGoyY6HkfRi4gynUiT3sLrpNG9+QS8f5LPCSBw/GRqReAouxJpf01wLAvpz2D0efD6jEcjFLzpHFUQVPkChtyEsec/pS0aLP94Bn7rm648YvRAM0ZAMwKWV+JGlM8gzsXvrx71fiXw6rRyNhUn9LCAO1JzTE7mZu82ZTHlwaEMhiiuXoDLwJi0AjIlrY3o9i/7+xTr87VPMqSCLD432kDVkAQGmWMbIGhX/uZkG+0xx+HtbUxZ+kiOF3M+HrBPPdsUoHF+nz2LBABP3iB2BD7N9HWg4j0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3995a50-9bb6-43bd-3605-08df02c827f8
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:44:39.8581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANwqWH4mxpe/qQKQ6QgcWCRvU+VmGqohFcUxxYB1pm6fOF6538ES0mUqUD4ZzayFER6CjBLHd91BZXrmSHrdng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
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

--------------uM7UhJWWwbwGC66xqh0Vso0w
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-07-2026 17:59, Mallesh, Koujalagi wrote:
>
>
> On 02-07-2026 04:44 pm, Badal Nilawar wrote:
>> Add support to retrieve info queue data. It can be retrieved when
>> has_info_queue=1 and RAS_INFO_QUEUE_FLAG_MORE_DATA is set in
>> response of XE_SYSCTRL_CMD_GET_COUNTER.
>>
> nit: Please change commit message, we haven't checked has_info_queue=1 
Tried explaining when info queue will be retrieved. will rephrase the 
commit message.
>>   
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> Assisted-by: Copilot:claude-sonnet-4.6
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 112 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 147 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 44f4e1a3455b..85b0202467f6 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -270,6 +270,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>>   	return 0;
>>   }
>>   
>> +static int get_info_queue_data(struct xe_device *xe,
>> +			       const struct xe_ras_get_info_queue_data_request *req,
>> +			       struct xe_ras_get_info_queue_data_response *out)
>> +{
> Why we need info queue data? When we are going to use info queue data?

Info queue data contains the meta data for ras error counter. Info queue 
will be retrieved while building CPER record  ras error counters.
It is used in patch 6 to prepare CPER error info.

>> +	struct xe_ras_get_info_queue_data_response response = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> +				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
>> +				  (void *)req, sizeof(*req), &response, sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +
>> +	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
>> +	       response.operation_status,
>> +	       response.queue_response.queue_header.chunk_size,
>> +	       response.queue_response.queue_header.flags);
>> +
> What happen when system control send corrupt data?
If headers are corrupted then it will not be processed, but if headers 
are intact and data is corrupted then it will go to cper record.
Validating info queue data is not in xe kmds scope.
>> +	*out = response;
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_ras_init - Initialize Xe RAS
>>    * @xe: xe device instance
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 6688e11f57a8..fc496888b3f8 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -9,6 +9,12 @@
>>   #include <linux/types.h>
>>   
>>   #define XE_RAS_NUM_COUNTERS			16
>> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE        200
>> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE        5120
>> +#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE        0x01
>> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA        0x02
>> +#define XE_RAS_INFO_QUEUE_FLAG_OVERFLOW         0x04
>> +#define XE_RAS_INFO_QUEUE_FLAG_COMPRESSED       0x08
>>   
>
> What is use of XE_RAS_INFO_QUEUE_FLAG_COMPRESSED? When we are using it?
>
I will drop this and other unused flags.

Thanks,
Badal

> Thanks,
>
> -/Mallesh
>
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across all products
>> @@ -71,7 +77,64 @@ struct xe_ras_threshold_crossed {
>>   } __packed;
>>   
>>   /**
>> - * struct xe_ras_get_counter_request - Request structure for get counter
>> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
>> + *
>> + * Provides chunk metadata for commands that support extended info queue
>> + * functionality. Used when the total data exceeds a single mailbox response.
>> + */
>> +struct xe_ras_info_queue_header {
>> +	/** @total_size: Total size of the complete info queue data in bytes */
>> +	u32 total_size;
>> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
>> +	u32 chunk_offset;
>> +	/** @chunk_size: Size of the data in this chunk in bytes */
>> +	u32 chunk_size;
>> +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
>> +	u32 sequence_number;
>> +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
>> +	u32 flags:8;
>> +	/** @compression_type: Compression algorithm used; 0 = none */
>> +	u32 compression_type:4;
>> +	/** @num_headers: Number of detailed counter headers at start of queue_data */
>> +	u32 num_headers:5;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:15;
>> +	/** @checksum: CRC32 checksum of this chunk data */
>> +	u32 checksum;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
>> + *
>> + * Allows the driver to request continuation of large info queue transfers
>> + * by specifying an offset and size within the full data set.
>> + */
>> +struct xe_ras_info_queue_request {
>> +	/** @requested_offset: Byte offset of the requested data chunk */
>> +	u32 requested_offset;
>> +	/** @requested_size: Maximum size of the requested chunk in bytes */
>> +	u32 requested_size;
>> +	/** @session_id: Session ID to correlate multi-chunk transfers */
>> +	struct xe_ras_error_class session_id;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_response - Generic response for commands with info queues
>> + *
>> + * Standard response format for any command that returns an info queue
>> + * payload. May be embedded in a command-specific response structure.
>> + */
>> +struct xe_ras_info_queue_response {
>> +	/** @queue_header: Info queue metadata for this chunk */
>> +	struct xe_ras_info_queue_header queue_header;
>> +	/** @queue_data: Info queue data for this chunk */
>> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_request - Request for get error counter
>>    */
>>   struct xe_ras_get_counter_request {
>>   	/** @counter: Error counter to be queried */
>> @@ -121,4 +184,51 @@ struct xe_ras_clear_counter_response {
>>   	/** @reserved1: Reserved for future use */
>>   	u32 reserved1[3];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
>> + *
>> + * When a session requests aggregate counter data, one header per matching
>> + * dynamic counter class is prepended to the queue data. The @counter field
>> + * indicates how many subsequent error log entries belong to this class.
>> + */
>> +struct xe_ras_info_queue_dynamic_counter_hdr {
>> +	/** @error_class: Error class associated with this counter group */
>> +	struct xe_ras_error_class error_class;
>> +	/** @counter: Number of error log entries that follow for this class */
>> +	u32 counter;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
>> + */
>> +struct xe_ras_error_log {
>> +	/** @timestamp: Timestamp when the error was recorded */
>> +	u64 timestamp;
>> +	/** @error_details: Error-specific details */
>> +	u32 error_details[16];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
>> + */
>> +struct xe_ras_get_info_queue_data_request {
>> +	/** @queue_request: Info queue request parameters */
>> +	struct xe_ras_info_queue_request queue_request;
>> +	/** @source_command: Original command that generated the info queue */
>> +	u32 source_command;
>> +	/** @source_context: Context from original command, if applicable */
>> +	struct xe_ras_error_class source_context;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
>> + */
>> +struct xe_ras_get_info_queue_data_response {
>> +	/** @operation_status: Status of the retrieval operation */
>> +	u32 operation_status;
>> +	/** @queue_response: Info queue data chunk */
>> +	struct xe_ras_info_queue_response queue_response;
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 6e3753554510..538d93352655 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -25,11 +25,13 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
>>   };
>>   
>>   /**
--------------uM7UhJWWwbwGC66xqh0Vso0w
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-07-2026 17:59, Mallesh, Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 02-07-2026 04:44 pm, Badal Nilawar
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
        <pre wrap="" class="moz-quote-pre">Add support to retrieve info queue data. It can be retrieved when
has_info_queue=1 and RAS_INFO_QUEUE_FLAG_MORE_DATA is set in
response of XE_SYSCTRL_CMD_GET_COUNTER.

</pre>
      </blockquote>
      nit: Please change commit message, we haven't checked&nbsp;<span style="white-space: pre-wrap">has_info_queue</span>=1&nbsp;</blockquote>
    Tried explaining when info queue will be retrieved. will rephrase
    the commit message.&nbsp;
    <blockquote type="cite" cite="mid:8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com">
      <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
        <pre wrap="" class="moz-quote-pre"> 
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 112 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 44f4e1a3455b..85b0202467f6 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -270,6 +270,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       const struct xe_ras_get_info_queue_data_request *req,
+			       struct xe_ras_get_info_queue_data_response *out)
+{</pre>
      </blockquote>
      Why we need info queue data? When we are going to use info queue
      data?</blockquote>
    <p>Info queue data contains the meta data for ras error counter.
      Info queue will be retrieved while building CPER record&nbsp; ras error
      counters.<br>
      It is used in patch 6 to prepare CPER error info.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com">
      <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
        <pre wrap="" class="moz-quote-pre">+	struct xe_ras_get_info_queue_data_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP,
+				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
+				  (void *)req, sizeof(*req), &amp;response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+	if (ret) {
+		xe_err(xe, &quot;sysctrl: failed to get info queue data %d\n&quot;, ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, &quot;sysctrl: unexpected get info queue data response length %zu (expected %zu)\n&quot;,
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	xe_dbg(xe, &quot;[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n&quot;,
+	       response.operation_status,
+	       response.queue_response.queue_header.chunk_size,
+	       response.queue_response.queue_header.flags);
+</pre>
      </blockquote>
      What happen when system control send corrupt data?</blockquote>
    If headers are corrupted then it will not be processed, but if
    headers are intact and data is corrupted then it will go to cper
    record.<br>
    Validating info queue data is not in xe kmds scope.
    <blockquote type="cite" cite="mid:8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com">
      <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
        <pre wrap="" class="moz-quote-pre">+	*out = response;
+	return 0;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..fc496888b3f8 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -9,6 +9,12 @@
 #include &lt;linux/types.h&gt;
 
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE        200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE        5120
+#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE        0x01
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA        0x02
+#define XE_RAS_INFO_QUEUE_FLAG_OVERFLOW         0x04
+#define XE_RAS_INFO_QUEUE_FLAG_COMPRESSED       0x08
 </pre>
      </blockquote>
      <p>What is use of&nbsp;<span style="white-space: pre-wrap">XE_RAS_INFO_QUEUE_FLAG_COMPRESSED</span>?
        When we are using it?</p>
    </blockquote>
    <p>I will drop this and other unused flags.&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com">
      <p>Thanks,</p>
      <p>-/Mallesh</p>
      <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
        <pre wrap="" class="moz-quote-pre"> /**
  * struct xe_ras_error_common - Error fields that are common across all products
@@ -71,7 +77,64 @@ struct xe_ras_threshold_crossed {
 } __packed;
 
 /**
- * struct xe_ras_get_counter_request - Request structure for get counter
+ * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
+ *
+ * Provides chunk metadata for commands that support extended info queue
+ * functionality. Used when the total data exceeds a single mailbox response.
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of the complete info queue data in bytes */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within the total data in bytes */
+	u32 chunk_offset;
+	/** @chunk_size: Size of the data in this chunk in bytes */
+	u32 chunk_size;
+	/** @sequence_number: Sequence number for this chunk, starts at 0 */
+	u32 sequence_number;
+	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @compression_type: Compression algorithm used; 0 = none */
+	u32 compression_type:4;
+	/** @num_headers: Number of detailed counter headers at start of queue_data */
+	u32 num_headers:5;
+	/** @reserved: Reserved for future use */
+	u32 reserved:15;
+	/** @checksum: CRC32 checksum of this chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_request {
+	/** @requested_offset: Byte offset of the requested data chunk */
+	u32 requested_offset;
+	/** @requested_size: Maximum size of the requested chunk in bytes */
+	u32 requested_size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_response {
+	/** @queue_header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header queue_header;
+	/** @queue_data: Info queue data for this chunk */
+	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_request - Request for get error counter
  */
 struct xe_ras_get_counter_request {
 	/** @counter: Error counter to be queried */
@@ -121,4 +184,51 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
+
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * indicates how many subsequent error log entries belong to this class.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @error_class: Error class associated with this counter group */
+	struct xe_ras_error_class error_class;
+	/** @counter: Number of error log entries that follow for this class */
+	u32 counter;
+} __packed;
+
+/**
+ * struct xe_ras_error_log - Single error log entry following dynamic counter headers
+ */
+struct xe_ras_error_log {
+	/** @timestamp: Timestamp when the error was recorded */
+	u64 timestamp;
+	/** @error_details: Error-specific details */
+	u32 error_details[16];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_request queue_request;
+	/** @source_command: Original command that generated the info queue */
+	u32 source_command;
+	/** @source_context: Context from original command, if applicable */
+	struct xe_ras_error_class source_context;
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_response {
+	/** @operation_status: Status of the retrieval operation */
+	u32 operation_status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_response queue_response;
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..538d93352655 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,13 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
 };
 
 /**
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------uM7UhJWWwbwGC66xqh0Vso0w--
