Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40C7C5516D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 11:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E40F10F221;
	Fri, 31 Jul 2026 11:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBDrzIyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAAB10F221
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785498094; x=1817034094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/VJYBJNbi2h6pvDYry6htCeg2gxjYkPmhjv6brSCk38=;
 b=oBDrzIybnb1+LYjXbi70IEMHlpoMeNxMNKOfhIgGvtwhAUyGfmcS+bzF
 edzZZzoxx1kzW3PtqSeFlQ6+fLdwjgujKRxhoKYtZjcvLLZMRrSltPHgM
 miMGMFVQOx3qBIQe9RL9eMpZNYPkHWN4ugCF6ZgoECD0HErYcn6dS8y+3
 x5B/Jqd/skYcPE2oFYOEs4wT9rylLI04F9ZOw7oHGmg6K4q21CE9GNKR4
 8gINhH9xkcR+oirxbfEDf4IybIKePcThdHc8nZdvBztWa+SKKetK1vLQp
 HzIpjSCY4U3J8fMwsDVI5lHyZdPATe5zmTF6VnO/FNsdLIcbSNCfCkP3t g==;
X-CSE-ConnectionGUID: 75IfDXdkSWmdHiRwGAWHSQ==
X-CSE-MsgGUID: T1FJIXScRFqv/3eK3iODJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96782032"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="96782032"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:41:34 -0700
X-CSE-ConnectionGUID: loGovgPsT02tk0XbYNWpdg==
X-CSE-MsgGUID: ONyQ9cl4Rou2XAE1V4wcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254252220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:41:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 04:41:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 04:41:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 04:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCTs3DwAIlGsJq95ZIVYoaGv5BNC4FGqheDfHYLyOOvBp9MNWbSAjOMbc2tFYbIF2Y1eYEhaBm/igmYxLRUDOBTAgywmpQQgpqDgaCfrOz7BEalhR9JwXIvVfy1Kluz0mtyDWtfkrs68LwM3jDmXsnjnD514fYeDIggzP5enuXa/9OgWYHyAG49qXz4htp37AaKIcjZdWi2SqZJGvpr89t/u1qhSnUsaYJegWeyyGT4tvpAJ0Tcw1+lrI2ykHxl+RE9RbvY5kVIb6ca9RTv5EIUylgAu+ILK7Tu9NItG0TQw+QlXsE73/jvhsVw27iahyna7Ou2Q02Rjq+nOeQoRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhwbw0XT22uWLC7R+qQak5YkhgIoP1DmOaRVKUwLPlI=;
 b=CJpTEMoXXOQWDOriUtpRBFyWRbst0YiBB2WNgTAFPn3pj7SmKb2oYrSl7RIeNbhjxPjqbkre7SPkvvnwbPqZhI1yrz9phBAFkkBijQWS9j3+3IUuxXpJDaK9zRgJzgtA4VwIKv4hPsGxaTBYPBOlE6lftzN3ssZ6Phc9wKLiteXZV+l5QiZSb6ugW0Bz5wiwc5y9RqAjpGIRzQlwp0XORu/mk71603S5qOjvhRZXOloLy8NDyF/RDiPPVy654isIOh4jbhDIpAqBh/l5o+Ku5G+4pYQ6hZh3KqhOnpojvsARpA2wTU/82BvH8m9tv52qd0EGrPu+oqfTj6dP0mcfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV4PR11MB9465.namprd11.prod.outlook.com (2603:10b6:408:2da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Fri, 31 Jul
 2026 11:41:31 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.009; Fri, 31 Jul 2026
 11:41:31 +0000
Message-ID: <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
Date: Fri, 31 Jul 2026 17:11:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV4PR11MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f902977-b286-46db-c4b9-08deeef8aa62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bM/C/evMFHRG2zSLDuniFHoQxGaBrSx0rfb0PF+b9pfujy+vo9rAGgNKlpzErVo8qTeIH9/d21PyisqgnQvznXNT+TBFG7lYpbejGVQZNKJHXC+4FLuQjFVc/oEu4CPwJxZiIa4m1KH1c5uivxkYHCyNLksy+4Gw9SIficsLrFJktHDaMmcLwEWTl7jFX7EvYZJ2jQ7T3iopItz8ShW6LXCN2o9Bohzgbf5vz65OfieK0/MdiOTLG471qykXgsaBL7dnDyMkDwOTA+d4SPVzUvLpZ0gRUCwB7fTVYuqBjXfIG37a0uyB1hGCkFqs1PWZUm77f+VGGeDCJcDz7MG0Cs0ErYup+zbtb3VdJTuGVmkCWlQhYxSvjBgwza65LveDisCtca/nDwiDucgrLga7RSnfr6eKGSverJB8lbNqdu7WNE2j2wXIcv8bkKewBz3uVpp9Tm/9oAG1bXLmBWNmSytcDP9Ldgxw/rv2ZnFId/3jj2yO47Ix67Vl2qd7xwsAvKIln0+5ASdUoQAxF2sG4qRM6cvM8PWOwea3NgVejml1nU81UTclBpwkX75kgALwyKld0Vs3y4tVkzQG7EKX3ms3qwa+jJIkx1+ihocWqsjYXmlcIPyvPTXahrQeUPCDGIbfDaOWQCy17HS4GS+9lBAztO5QASGgM9g8uyAFcw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmpka2ZtOFB6VE9WaGpvbTN4ZFh3K0ppWHhlbzNIRmlNZ2t6SFU2dzIySjJ0?=
 =?utf-8?B?M1k0ZGtmZzVxcTVRdDlHVEpCd25OdVFCSFlVSGJyMUhzamd5bkkwNHdaREl6?=
 =?utf-8?B?YjhPZjZmK29WMmhQKzRCZS9zdVI5L1BIR0Zmd2JjUm43S1E2RWVpQ2pFdmJt?=
 =?utf-8?B?TXpHNlByVDdlVUl2dHVxK0RzblVpV2wzVDNXWXkrOG9FUkRUR0tISzJXZzEw?=
 =?utf-8?B?TGxZM1RDK2JyYTdyUnVhS0xCVmU0dEswdzBKbURkS082UDI4NS9EVk1acTJF?=
 =?utf-8?B?WWlsSmVpYnl3Ni8vTEx2SktMZmRFSUZiZzlwanlWOTJkUkZZbVNZU09MVC94?=
 =?utf-8?B?Y2xKcXByWXdUQ0x4WWNYaFp1MnpDaE54QVJrT29jbXVVcDVxU1lIbzA2QzNr?=
 =?utf-8?B?SjlGR1hMS09kbExEZnB6SzNWcVMxaWlnRnpVeEd2bmVacWJPNFNZWTUwaFJP?=
 =?utf-8?B?emZnNEgvTHdnWUtNY1hLSzZjVW1LcE1Cc2ttUG9UUzdKOUR5MFBsLy9wRjZ0?=
 =?utf-8?B?cTh6VGRoVTAvT21hWTI3ak9jK2J2eEUvblIwU3ovWHN5UGljZWYzL21yWGMr?=
 =?utf-8?B?d3pVUXhWY21hN25FckRaZGUvVkxrcWF3WXpHbm83aWp5Uy9zeVJSVGdrWXZ1?=
 =?utf-8?B?cURtQWVDOFhJVjVRUVlMT0JmRkdoSGU5YkZjS0g3TFlmRTV0czBmWGd0TW8w?=
 =?utf-8?B?bDNtMmJndmYwVHhGMWRaTGovTXNNUWdGb0tpZjhrUmRZczBzUnFZUmQxdzFQ?=
 =?utf-8?B?OGszNlZFdkl5U2V4TmU1Qmk2cUE5RW15aVZ0dE54eW9CRlF5N2J1VDdHM1ZP?=
 =?utf-8?B?cUdGN25UUGF6dHc5M09CdVU2aWpabWY5Umd5b0NFUitnMHdOWTFBVFMxUWM4?=
 =?utf-8?B?UWdkdWZXUmdCOE13MFpRRlhZTlk1YlhMNnNibHdvblBMRGRqditobnkraXJW?=
 =?utf-8?B?dXJ5MWNhdFFodW1Zdy9oMTNGc3lkOSs3MEhjai80TDNHSnRYQUY0b21odFBH?=
 =?utf-8?B?YmpUL0RieW1qYnE4YzhtQXFGaGkwdU5PQUxYYStBVVJCaHQyUi9NT1BMVHV2?=
 =?utf-8?B?aFlTQXVGMlF0UEg0TzFqVGhYSkJzT0h1M0plSklyRjNWVGY2R0N4OUozdmlO?=
 =?utf-8?B?TUNtQi9iNS83dGxnSUpvZ2ZuenBCN3h3S2F5a081NXdndmU5R3ZuSzd6bWFP?=
 =?utf-8?B?VjgzREVSa01EalpEZm8wMG8xcTl0dWtqR1hsMFFteVRONUx3Qm95aUtqTVgz?=
 =?utf-8?B?Sko3TXFZdWFFZVFkRGZXVTFiVmlFcWZXQVRPUDZNNkxhZy9RUmcwTi9SMWlX?=
 =?utf-8?B?MGMxbXY5bGRTYVl6b2lqQWFXUGxhV2M5ZExNeHFkYWNHb29iTVBjVlA1cUo5?=
 =?utf-8?B?WldFV2R2ZGZBU1pyQkMwK1pWeEdSdkpKM0JXVmlWZWU4T08vS01zZThVK0dz?=
 =?utf-8?B?Zm9XUTZRaFJFOFBSMlg2UFJnc0djU1NFdGR6RWpKajJSWE5pUk1wVDkyaUp3?=
 =?utf-8?B?YnRzZXRXSmM1UlhTM2luVU5veVk4a2FlSnBoWkhpZ1d3dTBycjJvTlNia2l0?=
 =?utf-8?B?QUpxSkxtT0ZsSHREVkJmb0FCWUh2NWdjakQ5UWRlSWduZy9qbU1CWlk0L1ZD?=
 =?utf-8?B?MlZVR0Z6ZEk5MU9SS3RUQTRIdUR5Z0RUK2pSSXMyREY3Y3FTNXdYQTM5RFlM?=
 =?utf-8?B?d2pJNWFBR1lhOVlVUXMxY0gxQmFkVmVjM0szQ1B3MEo3MTgrS3NVUFdWQW40?=
 =?utf-8?B?WnBNUkorbmxDTUZIWEVsblZSUmhiUjd1bmlVU2l2RjhVTmtobi96a2llT2VN?=
 =?utf-8?B?dnYzRzB0OWNZODlzRDhSemtkeEE2T3FOeXlTMlFrLzI2Mjc1YmJJLzBYSVVE?=
 =?utf-8?B?NkVKYnI3OWEyb1ZuSC9DV0hDeDdXVmsvWnJ5Rk43OStmY2VvMk4rSm4xYzk2?=
 =?utf-8?B?Mi9JMk9pU0ZaZGJQTVc0U3ZTbEFaYVJYeUg1UGd4RnJUK1pIRFQyTHVPL3lt?=
 =?utf-8?B?bEVIZm9NY0pRTGhOdU5NeXZOOU9iNDhBaHBlbkVqeTJ0K2pIMVNsZFFlTVpn?=
 =?utf-8?B?WU1mYU9oN3BMeVozSHBjVEhjdjBhSENUTm1Xanl6WU9xalJpNjd3SGZ1VW84?=
 =?utf-8?B?ODZteUdGQ1BjZTFxWmQyaGZFMXlMMFN0ZitiOExEcENWYWMzRTJvbE8vOGNR?=
 =?utf-8?B?VnhVRkMxVTFLVlNCZVlKazQ2RndzL2dDdE5kWUcvSlVNUUNNd1RaWHlnNElm?=
 =?utf-8?B?VzFubFk1eVk2bm9Vb2NmdXRML29ZTktCYTNGK2MycjZpM3BieEVadGlBM09a?=
 =?utf-8?B?eklTSk5CMDgxUHk3aE91THRFbVhCaDBMNVRoam42SHdFeGNKc1hKM2hVaSsr?=
 =?utf-8?Q?HsrTa8dMR4x4DFiw=3D?=
X-Exchange-RoutingPolicyChecked: AypWOgn/ZSn4TfeBiTf5g37CuDaI5fkoVankvsYrCrk5kY+1VApp/pGYlsywf0OeFEj1chWlqzhQoZecfemlZbQ9r7r9ww2eUcrxOXFMKUvqCFA65mhf5mzA1J05Um2q6B9dQ88Ss8m8TnnVaTH81PWwltHy8RH/UGFjUtYbWlnSQdF6snOOmP6hiJ2PpfKbCOdixwy9MoJ/1L38xFvLaf0Si1NxW94GBwBavohq9IfRtVHrY4tjUYtmHhjIqe4sr9yvuJ6ex/o3kCcNwqds0rgoj3OcBsrDY6/4B0XhimZqMVzWjeJN20G6swOzu3NaFCo7iLR9j/dTu//Kxu8ZrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f902977-b286-46db-c4b9-08deeef8aa62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:41:31.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry5RX3WK1I677SujJjywd7pM5U/QCuOjsbVJWkhewtSkbxCE6uChX0pQzQwLo+FX6asz4CvHVqwlJ6g2XmPaXi/lo5MGQg3ATClShTSfi7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9465
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Extend our error signatures definitions xe_sigid to cover also
> hardware-originated errors and make them distinguishable from
> initially defined software-initiated errors.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> ---
> v2: update comment (Sashiko)
> ---
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> index 99717fdf74a6..69cce4b45635 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -159,14 +159,19 @@
>    * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>    * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>    * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> + * @XE_SIGID_HW: Generic hardware failure.
> + * @XE_SIGID_PCIE: PCIe interface errors.
> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
Add . @ end
> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
> + * @XE_SIGID_FABRIC: Fabric errors.
> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>    *
>    * The situations the driver detects and reports in software. Values are
>    * numbered sequentially, are only ever appended, and are never renumbered or
>    * reused. The tag in brackets is the default resolution bucket (see the `Xe
>    * Error Signatures (SIGID)`_ section).
>    *
> - * Firmware- and hardware-originated signatures are not listed here; they are
> - * logged as reported by those layers.
> + * Firmware- and hardware-originated signatures are numbered separately.
>    */
>   enum xe_sigid {
>   	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> @@ -178,6 +183,13 @@ enum xe_sigid {
>   	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>   	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>   	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +
> +	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
> +	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
> +	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
> +	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
> +	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
> +	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,

Since we've resolution bucket for SW sigid so do we need resolution 
bucket for HW sigid as well? If so how are we going to put HW sigid to 
resolution bucket?

Thanks,

-/Mallesh

>   };
>   
>   #endif
