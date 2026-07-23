Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C14C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7935310F15B;
	Thu, 23 Jul 2026 16:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUp7fJmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00410E5E1;
 Thu, 23 Jul 2026 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823523; x=1816359523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eV8Ggs21wtqfGcgtRqECVQu+MTPNRss1jeqVHf8+vpU=;
 b=cUp7fJmDFExhW/Hw9/6nZEo4dIgdKUQp0ymeR5ks49odmNZrf8Xdo0Zq
 K4VsEURogoT5f6gHp3n11MKXmSL0l5eexCnfaK6gWZ4Gs0ntUeVTd6SMc
 7Iv4KGqzmEMw4bPqLrEH+4lw9cV+6tbGuVRdAK5tH79moWydsCk6nyJpg
 FwcX6oo70jsMoMTDkmAOWxP2WvPzdxl1jDCv57ujEa9H1eQnP1f04O07R
 2QsbDNPruF+Q27BRIA+PkkWb/NDTqUjoSTiJddXXjCpUpGohGcdo3buDb
 k2is6GIgbJ3zHGKs12RXb/TXcgerj/kNZ2tOozMgNWRzEAihdYoWIjKv+ g==;
X-CSE-ConnectionGUID: etTVpMUHRcavJ1M8JDT/Eg==
X-CSE-MsgGUID: EE7PzhnsRPy9WuNZ6Cmk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96144343"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96144343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:34 -0700
X-CSE-ConnectionGUID: v8cBe9YORyGRFJoY4tA4bA==
X-CSE-MsgGUID: ercj1WwYSm6GObjGz0/FDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="263425682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:18:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:18:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqrZey1+TCre5VyITd12xZyHSAQo28Q04KBqKwKExDUrg5e3MAkzyI1NVXuxUT+oevy2mnOaJk5adD6AjgUdpQ7MesmJIJCwANYAHBwdgDC75iofkHczgr/34YFWnj0rwfvEplDp/uGOFIaEmM0qgl96t2Lp2/9xy/5jl8UZdIXFERZIFd852ZfCrPwX6nSm4MnsKhZYtAEDUJEJYZ5CoVjVLqHnOySq/ijqRi6J3Lqt/hKc6gR37/zy2RBF5PzgDwm3wAbuuoJCjB6B1PCHR/Z14yaRwKaaX3Q2g5e6Nk+Fxkpx6guP9QmB0AxxijeLRjesPQMEsA1e06fnAZi26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTk16/vfEimNyjYSUq0Y+mJ1GEzO3fdf2SwH5HnYAuM=;
 b=Jj6HO1iXLsPqc9z2CoKugGrPtAdU8DvAVhHLF3zNaiLQparvA9jAg2eWdN5poNVLNoZglgYuaS21NFM4nuw/cau+mS3SLyzhETtKBXBWz+CL+57NONL+XsSn9zXa9+m+7li/S1li36OCGx+sdSwxNhdokt9iy+A5cCbBvfmLvy9eJ+l84srXniYvCHV0wXQ2D4itMCieYbV3gpNn+Qy1dklnJKgZj+cL1N7QOnvaCUMupNyRZmmgabbJDG1cquY8jC+Mn8HJgXVjoPm0JkiijzwYjc3gmJ67/jSDMsG5z/Cpy5/MJwVeHLfTqFxjWKkccUBOxLOq3j86OkUxuqUFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:18:26 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:18:26 +0000
Message-ID: <7b54f757-68da-4c48-bfb5-aa2448a85e48@intel.com>
Date: Thu, 23 Jul 2026 21:48:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] drm/i915/display: Move CMRR crtc_state members
 under VRR
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1ed0c3-064b-474f-1e5b-08dee8d60663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /ncEDjuewhtguzqvRiO0StNB08p/vztYO/PKVWnAhvFCND+JCQZo0ajBD2Y5oj9wQyWJhxzHBvwuSELURPglFwFChy2X4mTei/K2XgX/ARndu57J8hsbG+zVOqdzDdyyR3jNxnCphaqHcBM4kpPC6WW2MwUb+YBeSfM8/gAREhp85riU+qT0fFWaLXRzWysHHSC/W9zqoaKloZdBIe3rXZlTEuUot+CBvii3cpQImeAhQ+c9LJyUadAPIelcpmozju+K0shT86licRi6SLZxQ3IrGM7gdb9g8JPO5UHAYD7QSqJddO7HEpKpLFdr0dWyNkAg3IFsnfVdJgNvEagp6omGgXEYcjnLvw9fHsNfSSzOf/9sl8EFs2YDFZiN+cwyvUtdcLQ6B963jC3GxqojPEJnIqmsWfhNcHamL5kqfSJr4MGD9mKUlPkC/1UdwMJxSmYAk1HAn5piuT6LAm3kn/NH2LpZZPPbNx9nYt3OPD4hGNOX6PRTQtTA9XNoqNn73kCun9T1TRPyLAO4j3mcHbhHZIOIcZ2Er8YwQeFxNPwE1hR02EzF+837uU4iAFbXaHAevj9B3FWur0EIPlcSipR8Q/LGLpmWsE3Emm3MdB29DEeKpvvha/l+l/9FOzt/f/k3WkquQhKxihakmzyDhHHJdl8gcsq9bfm2589mOCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RDY29SSExnSmZ6UFVGUktUR1orYjFqVlcrY2VIbVVEb0p2WGIzWEFoaUxZ?=
 =?utf-8?B?WG84SllnWHNJQTk1UWRFOWxyVXJYL0NsSzRUYjVVUWk2NXdJazRWV2t2QUdI?=
 =?utf-8?B?Vys2Z2k0RHdnNXFFODVKUDgwYlM4djF4emdBWDhHMFhtWUE3MGdaM2p2UGF2?=
 =?utf-8?B?ME10eXJIN09Ea0xsZGlRVk56eXlvOTE1WkprN3ZlZjRBS2lBcHp1SllYblls?=
 =?utf-8?B?SC9vbW1jWjV0bG9CM2ZWN0J2OHFYY0loWWNKWVlOUE9obmFYUlM4Skx2V3dm?=
 =?utf-8?B?WDFaQk9vbWdWUkRIdHZ0aEVPMHRtM1dSZld6MjRnMDQ1N1M1ZVM5T0lvSVNH?=
 =?utf-8?B?S3UvcFhhYWYweTlmMHVObGdIRWhIVy9zRmFvaWxVdW43ZmxKZzErMFVGdGtw?=
 =?utf-8?B?NnZlOVdFTG9ZUjlmZS9wVFRZcHhuZVl1M1NnNmtBdE1vZGlLcGRJWDlkYlRI?=
 =?utf-8?B?Z3ZoY3JRU1JqaUdpcFJWdDcyUGRMQlViTm53ZjRpSHA4VEJwaEhYWUd5UnBx?=
 =?utf-8?B?ZTdnYi9RT2d1RVo4QW5pQytzeGptQnpXdUxTMnRWNHBNTFE0ZjBVbFdGZkhD?=
 =?utf-8?B?ZU9iTWd1YjVCeGZMSllGV0J5UXFOcFpPdUpqWmNZOFdEK0VIVk1YVlVueTJw?=
 =?utf-8?B?SE9LbE10UG1VTXN4OTBhWS9wN0U5TzlORFBWbXhmWmxKYitrdENxMlV0OVRm?=
 =?utf-8?B?am1CUzlmaU4xTTFEQ1p6TGdSWnNqTm83NmUrZDdMZHBobmdHVXhJcXhHRE5h?=
 =?utf-8?B?YUcyY24rai80Qkg1dnBUb3B6Y0tiTm9IV3o5K1JRZ1UxL0dEdEJvR2hBTG1z?=
 =?utf-8?B?TElIWFNRcmpQRG8wM0VUU0liOVo2MmFWeHo5NndMUVVveDNqUEIveG1oV1FJ?=
 =?utf-8?B?MVl3OUZmN1l6RjFkWUxFNUxQbWFWY0d5bys0UldVOHRmeVp2RVgvVFVobU05?=
 =?utf-8?B?QVA0ZC91dWNjVUpxVmtOVzJmdldPNWNXUGhVVU1uc0hMZ241WEpKeFUrRHIw?=
 =?utf-8?B?SnI2QnYyNEl1U2xEQ3IvbXBlekM1a0tjN2hYK0lFZUg3YUhqTWdvYjlLL1N5?=
 =?utf-8?B?TTRWakZiSjNGTzBEcE9YZEZ1b3FnWHdGYk84NjlnSjRrUmxtc0Q1VGlKVWhU?=
 =?utf-8?B?K25lU3ZSeVRlbVlHMGloMTNTUVZGYmgxZzdPcU5VbDVQZkJVWFdSL01ZWFAv?=
 =?utf-8?B?bFpoUUZzbkJORW50a1dOOVpZY2JTK05TbVMvWG0xbXgrM2crUjB1bHJFVndJ?=
 =?utf-8?B?NXVHN1R5aG9lcW80V1ExbUNHVTJ3bGNTVDBHUmxRcnZtTzhDb0J6MjNRT3Nh?=
 =?utf-8?B?cTJodncvZ0grVXdLSTkyUHVxcms1NGZka3Q3Rk5DYXlsY2cyajM0RS9ObExt?=
 =?utf-8?B?blorWjIyRFF0UmJrRTRiSCtuUWQxb0wzdzE4Z3ZzL1IvUjl2RXFMTWNGTFMw?=
 =?utf-8?B?NVlpVnpPSEFZZy9VaVo1VTRiVzdyeUNCSUllaHFHd0hWKzYwNkljR01NR1Zk?=
 =?utf-8?B?SFMyeVRHKzM1U2NiQ3BFY1JlTWJaV0JOZC9tSjNzNEM4Sm1XMGhuNjYrZEhs?=
 =?utf-8?B?UUdFaDN3YlNOWWdERGpLN2NCS2daRElzYmpKMk1LSHlUUVk2QkNzV2dBd0tv?=
 =?utf-8?B?OXpXbFlKSE0zamJKYU1LWWJKeUhhWWkrWEVLSjV5K0pBN3JZTHV5SjRoRUZv?=
 =?utf-8?B?dm5pN0ovT0t3YWlhdHJqSlRSNHh6VE16T3F0ajkrYTZMQVQySHY1MC9QNjR0?=
 =?utf-8?B?ODZjV3NPeW1WRVM2RmJnc1NGZG9hcDN3Q29QejNpR2ZLbVNGblM4YW9uem5L?=
 =?utf-8?B?ajBWOEcwYUtoeXg2MGhlMnA3MGlmZlN1WEcxWm9ud29VNVZTb1JjUEpGbmVY?=
 =?utf-8?B?cHJwTjhBeVI1aFFEdDVYaWNuakFWVEVneEV1RnVDaEpyMm9sV2p2VlRTTzN2?=
 =?utf-8?B?ekd1dnJJS2s1dFFmTWZWRzdEZ2xkSkJRZHdpRitHQ3M3SkdvSWJPT3o5b1hl?=
 =?utf-8?B?bUZ4R3RSSDNkT2ZOS1R1N0tPU2s2cUV5WEpuNmZ6ZWZJR01rOEFvVk5vQlFj?=
 =?utf-8?B?Z0pEMnpOd0grM1M1dzVzWFNJNnAyekJqVUdaZlpqRHVVZ3BpdENZVk5ML3FN?=
 =?utf-8?B?aGo1dFlYdHYwOXE3aVJhZUl1OHFpZ3lGRnVIa080TGNuMW5PWjVZaVJaK0Zy?=
 =?utf-8?B?Q096ZjNDUUVYeERWem93YlZtQmM3SEpFQlVJNG15RDVQN1ZRZTF1NFJkVmYw?=
 =?utf-8?B?NFV6VUt5SnVaZ2JiVjdTa1pEaHZaV3N2aXZzNE5kcTE0TVl5YnVCdGZFbTlj?=
 =?utf-8?B?bWRCRHoxT0w3SDNkcmMwMzVTUUo4MFh6NG00MVdDU1lFNkpDZi9NeG4vSEdC?=
 =?utf-8?Q?S05ArM63XyY7c4Bc=3D?=
X-Exchange-RoutingPolicyChecked: c9xlDEA7yI7jOrwdj5Iydq1nrk9u0c5tu3I/p6+BArOM5AwGWUmgIP8j5D5qDjLn/rBPrmpz5Dc8/llqQHtEbGm6GeK9IsLnna0R1UStcXC+yRq0B9lWgYhzudgYxB0bQiZQqMgT2OIIJ4PgxLAPRkOa5dxJ+dJQwen2wvb0HSYosRp1fAF571InDh6JSUl6nEbrAPPEQt4oKDR1mhkjPCow+lj6D89SJxPMubHSJKOIjMxq1G+S7w2/G7ONr6HEnPzR7UPx8HrgQ0mFMplE/46owAlESAr2o82JNFF8H+rdz/tE46f/BMR1onVMU/BShV5yeFdieM0LZiz2oZOTyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1ed0c3-064b-474f-1e5b-08dee8d60663
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:18:26.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHlamGUIEUG1vKFV8aI4SLJcVPoAhoTUGEftnkkhTx/Bm1wVjado5Sp93JXQqbLZXQV9UgwBiFa5lr93huhvRj+BkpciT5dPZEk8lyLVQMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Move CMRR crtc state members under VRR infrastructure as
> it is enabled during fix refresh rate  VRR timing generator
> is enabled.
> 

The RB was contintgent on changing the commit message.

"it is enabled when the fixed-refresh-rate VRR timing generator is enabled
"

Please don't ignore the *conditions* in a *conditional* RB.

> --v2:
> - Move cmrr structure under vrr umbrella.
> - Remove dups. (Jani)
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cmtg.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_display.c  | 10 +++----
>   .../drm/i915/display/intel_display_types.h    | 12 ++++----
>   drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
>   drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 30 +++++++++----------
>   6 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
> index c8e0f90af910..3c0f5b2fb2e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cmtg.c
> +++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
> @@ -326,7 +326,7 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
>   		  XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
>   
>   	/* TODO: The code below may need to be revisited once CMRR is enabled */
> -	if (crtc_state->cmrr.enable)
> +	if (crtc_state->vrr.cmrr.enable)
>   		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
>   
>   	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 2c55a4818ad7..5baa9602b86e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -950,8 +950,8 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   				const struct intel_crtc_state *new_crtc_state)
>   {
> -	return old_crtc_state->cmrr.cmrr_m != new_crtc_state->cmrr.cmrr_m ||
> -		old_crtc_state->cmrr.cmrr_n != new_crtc_state->cmrr.cmrr_n;
> +	return old_crtc_state->vrr.cmrr.cmrr_m != new_crtc_state->vrr.cmrr.cmrr_m ||
> +		old_crtc_state->vrr.cmrr.cmrr_n != new_crtc_state->vrr.cmrr.cmrr_n;
>   }
>   
>   static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
> @@ -5523,9 +5523,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.flipline);
>   		PIPE_CONF_CHECK_I(vrr.vsync_start);
>   		PIPE_CONF_CHECK_I(vrr.vsync_end);
> -		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
> -		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
> -		PIPE_CONF_CHECK_BOOL(cmrr.enable);
> +		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_m);
> +		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_n);
> +		PIPE_CONF_CHECK_BOOL(vrr.cmrr.enable);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.vmin);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.vmax);
>   		PIPE_CONF_CHECK_I(vrr.dc_balance.guardband);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 46dd980b315a..20a07ea06b5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1408,13 +1408,13 @@ struct intel_crtc_state {
>   			u16 max_increase, max_decrease;
>   			u16 vblank_target;
>   		} dc_balance;
> -	} vrr;
>   
> -	/* Content Match Refresh Rate state */
> -	struct {
> -		bool enable;
> -		u64 cmrr_n, cmrr_m;
> -	} cmrr;
> +		/* Content Match Refresh Rate state */
> +		struct {
> +			bool enable;
> +			u64 cmrr_n, cmrr_m;
> +		} cmrr;
> +	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 23e169d8db7b..51afe519073f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3129,7 +3129,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	as_sdp->revision = 0x2;
>   	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
>   		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 6a90ded5d1fa..e9e47522495d 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1587,7 +1587,7 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct intel_display *display = to_intel_display(intel_dp);
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		drm_dbg_kms(display->drm,
>   			    "Selective update cannot be enabled when CMRR is enabled\n");
>   		goto unsupported;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 267c65d9245f..84b1ec7f1616 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -235,12 +235,12 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
>   		multiplier_n = 1000;
>   	}
>   
> -	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> -					      multiplier_n);
> +	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> +						  multiplier_n);
>   	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
> -				  crtc_state->cmrr.cmrr_n);
> +				  crtc_state->vrr.cmrr.cmrr_n);
>   	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
> -	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
> +	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
>   
>   	return vtotal;
>   }
> @@ -258,7 +258,7 @@ void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
>   	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
>   	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
>   
> -	crtc_state->cmrr.enable = true;
> +	crtc_state->vrr.cmrr.enable = true;
>   	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   }
>   
> @@ -651,15 +651,15 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> -	if (crtc_state->cmrr.enable) {
> +	if (crtc_state->vrr.cmrr.enable) {
>   		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->cmrr.cmrr_m));
> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>   		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->cmrr.cmrr_m));
> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
>   		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->cmrr.cmrr_n));
> +			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>   		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->cmrr.cmrr_n));
> +			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
>   	}
>   
>   	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
> @@ -980,7 +980,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
>   	intel_vrr_enable_dc_balancing(crtc_state);
>   
>   	if (!intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, crtc_state->cmrr.enable);
> +		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
>   }
>   
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -1077,12 +1077,12 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   				      TRANS_VRR_CTL(display, cpu_transcoder));
>   
>   	if (intel_vrr_cmrr_possible(crtc_state))
> -		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
> +		crtc_state->vrr.cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
>   
> -	if (crtc_state->cmrr.enable) {
> -		crtc_state->cmrr.cmrr_n =
> +	if (crtc_state->vrr.cmrr.enable) {
> +		crtc_state->vrr.cmrr.cmrr_n =
>   			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
> -		crtc_state->cmrr.cmrr_m =
> +		crtc_state->vrr.cmrr.cmrr_m =
>   			intel_de_read64_2x32(display, TRANS_CMRR_M_LO(display, cpu_transcoder));
>   	}
>   

