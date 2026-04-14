Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09956F9D0C0
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 11:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142B10E34F;
	Tue, 14 Apr 2026 11:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fin1QPZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99510E34F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776165418; x=1807701418;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qdvg+DZHKQaTYsZQWHZfLaCa9Cw10redjunwc1RcWkk=;
 b=Fin1QPZ1m5jN3ouYDYPuTMKOmOzPB0/twWUaA2cOnPwbVocspe/9IPXo
 ps5M2F0FcuuwVKipE/hzvJkmyoAknEwAFfupqxt1/ifyNMz6L9+0pqjAk
 1bUAB7/0bPJTJ1E1Tc9BmWBy7UCXgLa9moA680a8VobkXLO/biCDZTVgo
 dscWHCBDLak93lSLR6QKljN4Te5PsnIJNUmhs45rlrEANy4yXZ9qHVZJD
 gtnihE8GnI1QQR1edps/VUkr2U1xyw7naTvz+bDnClO5kwWd6hRinChay
 ik+fgkDhgyBeh/eYpGUKvtP7P7aGdAdSB7UbnsKMa8VXy/2XwinLI0HWQ A==;
X-CSE-ConnectionGUID: aoVmwM7OQ7q+p+c3JN1nxw==
X-CSE-MsgGUID: 6De52tBIRoGfaev6NY+hPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88565427"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88565427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 04:16:58 -0700
X-CSE-ConnectionGUID: peqdyWTURJ2GRaeCW9NBMw==
X-CSE-MsgGUID: HNbN+PWhQemmvtKwv60Kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229191957"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 04:16:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 04:16:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 04:16:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 04:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Lgnpyc8ZAyaZk8XuvE6Za5JK6gyAj7Mh1yxc9BZGUEafNVWND3JlLX0GOMcCTQ0ecqxP8UFr/725klAVseTq/qvtcdbxY02EJlq0sCXH/Sz+vnRwHVKvUVGPFpb5YhYuwh5utlC3gz3y0BYzKJ/iaNwYLWflpMoUoRf38Bun9XnwyESwS2Pp4429NTwUtSl0Vj21DkKMgupLZyzFT0BNsO23NR7PqY9VdjRv/aoZDN0NQZ4sL7jSHRqG5UGCl65NbDAUiBf6qn/qKfTNw60mJdE6LlvUUAlK8cEogP1D1cC/UFMsnbwexcS8XxGPTBPARiWFaJB9k4R5/2NlRLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5a0lKUArqU/tFvB2CikGQY4v9HDXQ1VDtx/Qcn8eXQ=;
 b=AMNd+8VjFvl8lyubO+7mwafc5StYEDz2dmAA6pUimbOzcm0SETJx+Ug6NKJ7TotJsEKlecHjki4oUrgRuioscfL8mmpfnozFvXbKWcl06Rr8OgagvSu0cUIPXaktwV/J8bb7oQef6VE6M+ObcOJS+6Ly07XfQFRDTlOI4/ja8bhJxayNRe0dKRd9tiFM+c0KxTEJtb50ubSlsGWfwG5cgjYVoc6gHrwsjQTbR/QygW1GGJ9QLIXfECRpNR8rzpnXvTua548ukup95ohxAZ9w/59xwvO6iWDpg6/D3AhGCuDUgec7UR4r4z4CUFaojZWPrk3sjef7gkknsBFv8+4ETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 11:16:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 11:16:46 +0000
Message-ID: <60d27d8b-5b32-4631-a28f-a8a1e9343176@intel.com>
Date: Tue, 14 Apr 2026 16:46:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260309051705.980155-1-soham.purkait@intel.com>
 <20260309051705.980155-4-soham.purkait@intel.com>
 <6e821825-872f-4246-93da-03f1f8c42998@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <6e821825-872f-4246-93da-03f1f8c42998@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fd185f-bb07-4a4b-ddae-08de9a175078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yFhuef++N8Om5r7zjJWFXUWPFm1Y9TZyOn2nEdCJGgzkZKq3/clqW328q7hvSMs6SqSvxk2Fg7kG38INyuhAirsIftAz/CxsLPTO8y1NzEhobUL+GUIyWNcjRgm1z9AMMb2oeWeLA3rTziXQfK2aqy8fui2rd8wyDqcFP5XszqkJJQYGDswmmKraLnuQF2y5/Qnq0uOddgL4ZpoV87vgitEWj1irkyZq3gGawfi2RB+c7g9e0wiZ+6iHQC2ucoH80zLPfzvUJfgyjcsQOeIE6NkeYgzNhuhsOCUI5HWe1ews6kogoyXZ+iXf+1RQJJUCje3gi4D+GtyD7f+fQhGL2fgv9eCo6wvSVYqP/l+KfG4fEQ8euOV4zrnbFk+ySULz3ALWlKAknfH3GFgV6GcB0enxtUFZ+Pgdlw2daJ75xMtzQIZBxci6va/6z57/SxVjxZEI50uYeIn2kGa2qh1EYUekgYVAn4Vi3fc8L4GPYYuNcVMJ4cBzpu5q1WM5f0VNA5ONlTRl+mRmfbz77GFva+WxL71ge8Q7U6z97kccSqHX9v+sHm5vVI3YBJiOxVCcTFc2d291Uhw5HJLq6ywHO/qzWWtJmm9/BY+6L0MtgYDCf1Xni3NTx+9swu5bu4+7QcFf1qZIWWK6jrV03kEsbdvWhRAGx4Ya44sKUO2Q/ZG6VMvy43BNrrJJqqzWSqsKzNlhsr8mvqsvb3uVz9+O6XngwwSeO8inpvwOZzZz6Cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9xN2xWWTRscUxSam5YRUtTK0RGVnorQVN5akw0MVFTVTBGL2JWV0p3UG51?=
 =?utf-8?B?NURaS25MajA4Skc0RGNZWkNydFB4YW1uQlMxNCtpY0h5bEZQdDlnSHRoVnBF?=
 =?utf-8?B?UCtETnEyU3FXckNSREhzZTV5bVJlbVdUbjZRWW90dk13UGR6dXJsdnFPQTY5?=
 =?utf-8?B?ajNhK3VqcEM4UFM0QTFrUUxLWVNBWFNNeGxRRG1pQmJXZ3F3YUg3ZUxmcjRj?=
 =?utf-8?B?K3Vkd05ISTRnaE83eDZsdkluSVhJRVV0VFY1d2pOV3MwRllreU85MGZuYU02?=
 =?utf-8?B?bjFJWVBDZW9TZkk1dWtycUpjdEphQmRrWmZRYWpmdzMrK0hwUmQzNTNlV2I2?=
 =?utf-8?B?dk1XQlpLYWhVQUJiRHZ2TXhUUEhXN2ZsRjRXWmdpejVXbzYyWFVmUUdsN25R?=
 =?utf-8?B?OVdLYmdoOWZGS053UE1ieWVqYnRrTU10ZGxTVG1CNUZuaUZ1T1BrL0Z2OE4x?=
 =?utf-8?B?WElVczVtSjNzY210Q2oyN21mdmp2R0ZMaFB3NlFNaDdRSEtYSGkrU3JUbFZC?=
 =?utf-8?B?QkRqUUoyN3JTcCtTRlRUUTJWdUtvaUFmdTJreVRjMHJxYkZGS3ZJL2RtQ3gx?=
 =?utf-8?B?SDlseUsyLytLYkVjdEtReFlZU3BZT212Nm5DZWg3NUtjTzhxMmFiT0ZJdkY4?=
 =?utf-8?B?NE1XTmpWTlJlbWRESmVxOGJSQ3BEdU93K3lPMXIxcGN0ZnNjSFFwVlI4ZFd3?=
 =?utf-8?B?b0hKcWlTc2hOYjkzRjlzK3ZxNHpUdzhoQk5qamgwdCszTmpuSThDTGo3T1h6?=
 =?utf-8?B?VHphSXRRUDl1NnllZksxbW05UnpJLzZZZ0NJdXo0blNUTDhyV2NnUW9TK0xZ?=
 =?utf-8?B?cGU2cWY2ZGdrZ2VhN1FJTzRVa20ramw5cTNhWEpSa0lrc21MZWxlUzE1RlIr?=
 =?utf-8?B?bXVkODcxOVQyNFlqWnJUWTJMcWFaT0wvMEZqSWl1MnVFQXhrNnp4T3ByeTVs?=
 =?utf-8?B?d0RtMUxsaXVJZUR6elFiYXRSSDVIV3hkR2IrclViRVRhYTRsalcyWUdwaTFo?=
 =?utf-8?B?QUtjUjRUVlNEelFhWkxZeVlTUy9qdWcvaDY3MDdKQmFuL2d1K3NZNEk3NWc5?=
 =?utf-8?B?alQvem5Nd2RYU0xsOG56MFF0SWIvSXd1SWhjVHQrQ1paZzVvZmtSbm05SHJ0?=
 =?utf-8?B?eHNTS2hFbFllNkcvd1h0OUJCai9FWHZUMFVCTWxjZjM3UHM1ZlJ0UktmY1Qx?=
 =?utf-8?B?OVVoQ3RLK2I0b2p0SjZOeGQwQXU0YVhZRnV6TEVzSmNWWCtRUFIyUFV2bkYr?=
 =?utf-8?B?RXJjd1FaZkx3MWZMK3g5amphT2JFSi9MaVowc3Z3SXVwSHNrOW0rM0NzUnVS?=
 =?utf-8?B?cWpUVmQ5RlIwS215NXA4aHNVQmVGWW9UOGVmR1RoU1Bmb055MmRlTFBRa1Vl?=
 =?utf-8?B?WHpGZXJ3S21uZWlhUzR3dVMxbzZzeEQvTWVrNWluWmRoVGUyVUFVUmxwRWFJ?=
 =?utf-8?B?UjR3TTdMM2ZMei96UGZDcjN1TEFQZzY4SHIybk53WU5aLy8xLzYwSUdLL0lr?=
 =?utf-8?B?TUZEeTdTM0dyV2lzdjVKZmF1TXFKR0ltRUk3QnNPTE5DeHpDREE0TzE5SEtx?=
 =?utf-8?B?UHpwcjQ4VnpOVmt4Qm5oN2NKTmZhN043cE5VeC9ZRHYyb2NPbFd1YU9Kb2Qv?=
 =?utf-8?B?WUpzTW00eSsrQ3hvcjlWM2RjblU1NXRJWnBnQ2loVjRmOThHUGpxdXVib0Y1?=
 =?utf-8?B?N3VnWHpGejVDZnNBYmhhSWZ6dzZRcGxlYnRlRHplK1NLRE8zam1tTUJTZTdI?=
 =?utf-8?B?cDFxYnAwem1mdXNrQ2EvUngvbzJlWFlVVkFCaXViNnkvWVdJR0gxUDNzNjdt?=
 =?utf-8?B?MUlGUkZtRXZEQ2owK1g4QlI0cHF6NWRmRmdCMGdvOWhuci9MZi9kc0pCaHow?=
 =?utf-8?B?ZGJkQkhlS2hQcC80T3psbmt1Z2MrM1d3bGRremVqME1IcEpRY3JnM3lPVTJZ?=
 =?utf-8?B?SHBpZS8zclFYRE5CbU9KT3BuTUJLUGNQQVQ3d1g0Q2kzRzlvdEpCMVY0bjBT?=
 =?utf-8?B?YkllcUVvbHhDbTRTYjE3NVFIR05TUEwxdDhvdHphV293Tyt0VFluRmxvZDJ1?=
 =?utf-8?B?SGJWM1daVEVWUVlWVzM4d0pGb0E5dWNDQ2tOUktlbEkwQjFycVVkQ3MySlFC?=
 =?utf-8?B?RmJKeWNveVIyVTJNdXVhV21PcjRhQzl5MGVGUTM0NHl0dy9obnNDTE5sNWdP?=
 =?utf-8?B?TFAzMDczRWJHQ1VyYTYyd3BmL214dC9QYndrbllOUHd1OVA4bUxCYzFXeHJ1?=
 =?utf-8?B?NTJneHRrUlNxekp3RG5TSmErbHhQRFFMU1ZFSjJtcjFpdVB3T0t0SGtKYVp1?=
 =?utf-8?B?aC9kRnVVbTlJc1phKzZINlkrUVBKWTRiTU5JWW5Ia2pTTWZUblJmNXR3Z256?=
 =?utf-8?Q?FYsaxmr64q/ITZ3k=3D?=
X-Exchange-RoutingPolicyChecked: Hh/yTHmSHz8iy5wNfgVPMxeJ5dNWOnqxamj/LYSMp6MgWdfrCPJNkQbWob4bR3CfR46X8yrdA/AXobgNEX/WXu3Y5y6ubEV0JyFEiECTd+pj1KE7TxvCWwgPW2tgOqyGLqnreSXPjMOFGQGwh3gloQlpddMpux13yl2vVcnzAnmp3vaz0pzV5rm7DpEAlgZNytppIs+SCMsdmzTKiaVSrHq/V6EiCz4KVyTFdrAei+JvW2uJcDtBNnmsuqObvYnk8I+wViv7itXq8+XdJ0+K7Qs1JbTyEB8wYtLUJcnPrTn5KNOzyJFv4zxP/m5PWPLlecgpbU5jAGIuTAhtdqqZ1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fd185f-bb07-4a4b-ddae-08de9a175078
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:16:46.2163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5E/JuDiBdY7So9WEoiDKw67Uq43QnDZYONXQHvp85pihqwC+4r1eOT9dvVgcTfohgRF3Zl8GunDzExHXpAZMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
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

Hi Badal,

On 08-04-2026 17:19, Nilawar, Badal wrote:
>
> On 09-03-2026 10:47, Soham Purkait wrote:
>> GPU health indicator exposes a single sysfs interface (gpu_health),
>> placed in the device level that allows administrators and user-space
>> tools to both query and modify the GPU health status.
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |   1 +
>>   drivers/gpu/drm/xe/xe_device.c |   3 +
>>   drivers/gpu/drm/xe/xe_ras.c    | 166 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    |  13 +++
>>   4 files changed, 183 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1890bbd1b28d..ee18638f73c3 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>>       xe_pxp_debugfs.o \
>>       xe_pxp_submit.o \
>>       xe_query.o \
>> +    xe_ras.o \
>>       xe_range_fence.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 1d61bb504e9b..2283a18e1034 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -60,6 +60,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1009,6 +1010,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_vsec_init(xe);
>>   +    xe_ras_init(xe);
>> +
>>       err = xe_sriov_init_late(xe);
>>       if (err)
>>           goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..44324fe3273b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,166 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_device.h"
>> +#include "xe_device_types.h"
>> +#include "xe_printk.h"
>> +#include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +static const char * const gpu_health_states[] = { "ok", "warning", 
>> "critical" };
>> +static const char * const gpu_health_fmt[] = {
>> +    "[%s] %s %s\n",
>> +    "%s [%s] %s\n",
>> +    "%s %s [%s]\n",
>> +};
>> +
>> +static void prepare_sysctrl_command(struct 
>> xe_sysctrl_mailbox_command *command,
>> +                    u32 cmd_mask, void *request, size_t request_len,
>> +                    void *response, size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +    u32 req_hdr;
>> +
>> +    req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, 
>> XE_SYSCTRL_GROUP_GFSP) |
>> +          FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
>> +
>> +    hdr.data = req_hdr;
>> +    command->header = hdr;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>> +static ssize_t gpu_health_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_health_get_response response = {0};
>> +    struct xe_ras_health_get_input request = {0};
>> +    u8 health;
>> +    int ret;
>> +    size_t rlen = 0;
>> +
>> +    prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, 
>> &request,
>> +                sizeof(request), &response, sizeof(response));
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +        return -EIO;
>> +    }
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe,
>> +               "[RAS]: invalid Sysctrl response length %zu (expected 
>> %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +    if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
>> +        xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: %s state = %d (%s)\n",
>> +           __func__, health, gpu_health_states[health]);
>> +
>> +    return sysfs_emit(buf, gpu_health_fmt[health],
>> +              gpu_health_states[0],
>> +              gpu_health_states[1],
>> +              gpu_health_states[2]);
>> +}
>> +
>> +static ssize_t gpu_health_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_health_set_input request = {0};
>> +    struct xe_ras_health_set_response response = {0};
>> +    u8 health;
>> +    int ret;
>> +    size_t rlen = 0;
>> +    int state;
>> +
>> +    state = __sysfs_match_string(gpu_health_states,
>> +                     ARRAY_SIZE(gpu_health_states),
>> +                     buf);
>> +    if (state < 0)
>> +        return -EINVAL;
>> +
>> +    request.new_health = (xe_ras_health_status_t)state;
>> +
>> +    prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, 
>> &request,
>> +                sizeof(request), &response, sizeof(response));
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +        return -EIO;
>> +    }
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe,
>> +               "[RAS]: invalid Sysctrl response length %zu (expected 
>> %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +    if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
>> +        xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: %s state=%d (%s)\n",
>> +           __func__, health, gpu_health_states[health]);
>> +
>> +    return count;
>> +}
>
> The function sets the health status, but its purpose is unclear to me. 
> What happens if the health status is set to critical? How does the 
> device behave in that case, and why and under what scenario would a 
> user need to set this status?
Setting the health status to "critical" is a way for the system (or an 
admin) to flag that the device has a serious issue and shouldn't be used 
for new workloads. When in this state, management tools and 
orchestration software will typically stop scheduling work on the device 
and alert operators for investigation. This status is set when hardware 
faults, persistent errors, or other critical problems are detected, or 
if an admin wants to proactively take the device out of service for 
maintenance or troubleshooting.

Thanks,
Soham

>
> Thanks,
> Badal
>
>> +
>> +static DEVICE_ATTR_ADMIN_RW(gpu_health);
>> +
>> +static void gpu_health_sysfs_fini(void *arg)
>> +{
>> +    struct device *dev = arg;
>> +
>> +    device_remove_file(dev, &dev_attr_gpu_health);
>> +}
>> +
>> +static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    int err;
>> +
>> +    err = device_create_file(dev, &dev_attr_gpu_health);
>> +    if (err)
>> +        goto err;
>> +
>> +    err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>> +    if (err)
>> +        goto err;
>> +
>> +    return;
>> +
>> +err:
>> +    xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, 
>> err=%d\n", err);
>> +}
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>> +
>> +    gpu_health_indicator_sysfs_init(xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..14cb973603e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_ras_init(struct xe_device *xe);
>> +
>> +#endif
