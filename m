Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E8CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B2010E99F;
	Tue, 13 Oct 2026 19:16:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB53410E5E5
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918984; x=1823454984;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0JhSTA65ZKGysUYX/IYojXxjhzWdkchNi7Z9RE4pew0=;
 b=fLdASDln+qelrtSACUlBKTTkyN0K+4W/W1KoRzRHiAkswxBmT3SDEfby
 GHkCNV0MOhoqfnHYAm4qFBk394JIXiw3R4+TVYXR70sDGTyoX3p7DTCD1
 MDzYbkYsw7l4xfdaeNBFs+5SpJOMzCwGPvWlbc3bjrHx+iA4LNIuYgupD
 6G0AwYwWXE6gZ17MgGQwEBgBvcpDV0V0XlD3pBwACG/OQDViUsb8WqtXj
 gAhcE9IfIy9aNFfKcmZppKw3Jd39illpUflyd6U3XtWE3RBkwNGDoEFvI
 SoAU0L9xB/LqBeXFjKxQVefyRor0i0VlIVOpKFqU99/bg/ZhTOPGQtreI g==;
X-CSE-ConnectionGUID: eVCLxDRMQLWJ9THFITxvSQ==
X-CSE-MsgGUID: qDEjOL2OTRGWa0C6keLfGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544185"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544185"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:16:23 -0700
X-CSE-ConnectionGUID: jBaavUKpQOuiDZp9iEcW2Q==
X-CSE-MsgGUID: HYg9W5AAS/ytAcXllkMfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3080185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:16:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:16:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:16:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rk8n56jw3rdnch+mByjbMfJAPkqtk3+qJRIuA2y15gby2PwU/73+OTXfCMjxDGuhAL7QzeLIxe4gK3CLDB39iF1/iHl5FJeqx2eROO8YzvSPPrvb1inAxpvoMCKo50UNHXaRnV6F+ZgEZVqGRQyLiDK8X+AHsfnWibetKISvFJYBy71H14OZUlr07ZggNuUO+33Hgp/lvZQVzU6owRqV21hV08fdb/6R4H1etpc6GuVQngTa5j1QOvxKIKr81+7Oa2SHLgyx8Zp8PfEfXlrrzHGDF6M6azEt02ps8BDR/r+Oceq+QBCuCUy8b2ZKYufi1W+eK6hLB/o3h32P8kVVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Xw7oa2dF8QL0u75N6yImnDsK5tnMBb46wsU79DBuQE=;
 b=MZOgeWXuY4UQnNOU7t2zcxjHxtrwB+pOADPoZ0ynwTZjNjFbXzjsgf0dCYBqk7LSNFHEz1HiphbafekMJNVC1KH4KtRKc2ulkn5+J0ewkW7OaUHk4ppY5+Sj75r6cDxPskZz9JgPErp4As5Z5Jx7BqVJXeqn/eDNNj2yls0FMiBIEun89S23ZG3cHjEJ9MLonpiMv8G844s0x7bGgFm61mcjHFWNAkUn3j3q66uHEV5M5yVoCM30gi3QxAvkD9tvixxiuNX3evMg4Oyz9PXoTls411vHRXKg6PjTBY1/0fOpoxVRXry4P2UI1sKoPtlBwBAmcLCbUj8O5lh6kyNvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by PH9PR11MB016272.namprd11.prod.outlook.com (2603:10b6:510:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 19:16:20 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:16:20 +0000
Date: Tue, 13 Oct 2026 15:16:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Move debug configfs entries to
 xe_configfs_debug.c
Message-ID: <as6Ddhk1oiA8y0YL@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
 <20261005220636.602826-26-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005220636.602826-26-stuart.summers@intel.com>
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|PH9PR11MB016272:EE_
X-MS-Office365-Filtering-Correlation-Id: d24523e4-7d39-4eaf-bfba-08df295e759d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|5023799004|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003|260925021311599003|3023799007|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: bJtoPRbNzdDK0/AfVlB9Y6mR4gFc9cSVx6dPyNfBkWaH1m5NrwLLz+moaOAddvZZNpOtpIs7boNvt6rc/PtQh4hrzHTqMQGA6/j7N61pGw0dhrMuxXoMrk5V/RdKam4U9SaNlmxIcEqtWqTjjz9d6WXQbGn5xGai7GiVGAOQK2+17nrR6U4FdCq/QE5ckedCPbkf1Ibpmm1q6hBjRKvAmux1XvW0SDjdgqf+uM4UKTojubmDNbZUkR+bILRoHezn9rn8aN6vmHHP5hRqAbNEpHERZ3E9p9a5DR1AmB7WXEB51FiqadztAzLRPF94T32U3zGDehqIVDSBfKjTAzJ1j026n4jp6t8GNsu8dFqiV/rh5StqRnLuYvWHGvpX/A7pJjJ1q2Wze7ORe1eUDrJ3HjZJb9oFLs0kYV2fjaPPG/qtH4h1aAgev3t5PdcwdqnsyCpWKhUm2fAYA51MUvDiKkIH438b0DeJc/gQt97sPZ+Bm53OQWSYLZJGQQ86ovx7BrWyeij6jyLUrOqjqrclA2jE4ImYYiYKRNmdcRJqqlgD6DXmUoh9xpEpXqVHep2z8drrjP8RofINzq9DQpXrey5qHg+QMdP9pqGqvhky46OqEgJp+KgYlyrHWnzg8k4vdBIbGmvXp1LD+9mjVbrKy5bQu5fUZTTFBpIWZR3NOUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(260925021311599003)(3023799007)(260925022911599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTF0OWp5R1lzN2ZUQ2FFR3Bha0NzTTJISW4yWVRyQWRvaFVxT0FLTk03NlZK?=
 =?utf-8?B?ck1CTllDOUpzTk9sYVVUNHYvc1lJUkpRcGo4YjB0OUU4cDgyRnBYajVMTzk5?=
 =?utf-8?B?UkNhcjQzMG9NemRiNWhEQklSN1lWQmtjZlhHRjBKZnZFalVKTi8wZy9TNmRu?=
 =?utf-8?B?L1REVnp0YWVBQk0weHJQZHFSN0dwN0RUbkIyNUR6Z05sdm9vSk8xdlBrNVJ2?=
 =?utf-8?B?bU5kWFNsYWtIOFlRS25MZ1h0M1pLY0ZRdUR2UThsZU9NMWIvYnZvUVBHSTMv?=
 =?utf-8?B?OWJ6ZFNIWjNBYlRFK3VCQUdRTlByQnhtZDBpQlgvNWtwc1ZTK25WRG1KQ3Y5?=
 =?utf-8?B?aDRScVVBYUdNa1MvVTlhL2lSOXV6WnE3ZlYwK2dZR0pqdEhjQ1craVd4OUgz?=
 =?utf-8?B?V01VZEJ4QUNqRTZWdldycmJpMzFpcStscHZvK1YzQ1NtUnN5LzJGYUxMSitD?=
 =?utf-8?B?bkZ6UlQ5dGNhY1JUa3c4SWJ4YkgyUFhaaU9NY0kxL3hsMVk2N2djcVZQT21n?=
 =?utf-8?B?eDljbUYvNTdaOU10b0hDR1VXaW40eXdqcHRTelJ4aHZoYWw5M3FENUZHcnBX?=
 =?utf-8?B?WEpjb0V3THdLV0VZNk04QSs0WDV0LytCOEtiK2RwMUNBdjlOY2pFcllMRkZC?=
 =?utf-8?B?SWg5NFMwNkt1a0lFWWZEbWFQSGpEVStpeFlhbHBJQlg2Y3hLU1k0T2RFUkRZ?=
 =?utf-8?B?TEZWcUs1Y2pKV2JYTHdaNUt1VGxYNlVtSVJMVEMwV1FzWHlvRDh1N1g5WGkx?=
 =?utf-8?B?ZTV1MXdIelU2aXpxRjZhV1BQQU9TeUxLN3gvUng2ZjhzaEg0Q3NONmk3bGpV?=
 =?utf-8?B?ekRsNFNRNy9JRk9BazdkQlNRSHR5eDFtdDM1bkZldGtSTG9rK1ZMTVMyVDN2?=
 =?utf-8?B?MEFZTjdGdTN4U1VQK1BBNG5SaUdLTndKc05LdVFQNGYyTUdKeUZNcmJQaVhE?=
 =?utf-8?B?eEtFdjdOUG5HaThtNWQwcDBFNUc2eTdBejBWSXpXcVhiYkNyVDdITk81REE5?=
 =?utf-8?B?Ykp0QUFqeXkycTYzTU1SRWZTV0g2WnpxbWlUZ1lrUTQrOGtLd0VnQkhkTWh2?=
 =?utf-8?B?T2F0VGFsUVpQSG8yQ2tpQjRaOW9QMlRrNHVqY2hyTzdHU0FScFVVVFk1VEhR?=
 =?utf-8?B?eVF5eGVFVjRKSFNDeHkzcEdwOHQ1Sm1uSWpiTmlQV1Z5RklOS2NiQjBxMlh1?=
 =?utf-8?B?OGx5UzhLZEt4eVZRWE1wUnZySUZKZFZlYnBEcExaSnR5M1QzRE9ZR2dnL2lh?=
 =?utf-8?B?WmhVcU1zSkw2R3ZLSU82RVlrTHdyMnkvNUZNcVl1dE5aQlFDamErclBJQm10?=
 =?utf-8?B?WXJCczREUDhwWDJwWUZDZlhLS0JLbFZZT2RQdkthblZkZXRrRDBCYjhQN2dr?=
 =?utf-8?B?NjB2Q0RUYVVaODJ1MVpUUm9qTEVzNnVQZUNQR21WMVRBU3dublBmQi82M3JH?=
 =?utf-8?B?dWFmTjV3VllJYVJYMkg0a0lxQzZWR3h1YzRjSGVIbXZaK2VoRXN4cGEvVml0?=
 =?utf-8?B?R1pRSUJUTHlSU3JTNHJ0cHJ5VFRHanRQN1RJSk9NMFlrK09JRUZWTm1seWNl?=
 =?utf-8?B?bnI1eHJWR251dlB3QUpIdjRpc1d2QkpTK1AyVEtoYllqdCtsaVFSM3JLMkNT?=
 =?utf-8?B?L0JjdGRhbUU4am82MjBsYVY5TkMrSWphQWx2bUtJZkNhbHoxa2FoOGV0Zzg0?=
 =?utf-8?B?Q1JPam1NTEkvVzhzaXVDYkY4b01VeVd0MEVkNnpWdmFyQ3kyNkRFOTlQanBY?=
 =?utf-8?B?b3pBSEtuVEFxRmVZVFhEZWF5NU5kaDkveE5WYjBwY2dXb3gxeFUycmsrKzZ2?=
 =?utf-8?B?V3Q2ZFpFMUlPQVluWCtjeENmRTZoMXpLZmN3d1B4YXZUS1owTEVKNVRGVWRy?=
 =?utf-8?B?alh4NzNpU1lLSllnOWFVKzU1R2RBMmZJMU8wUW5pU2xrRE4rVURFeUs5cXVM?=
 =?utf-8?B?NDd4U3VIY0VwNVFjWjFqRmhtelhhaU5jNzRVeHY4Umh6bVhWNk40czNveUVk?=
 =?utf-8?B?WHkzeGpFbGVaTjVoRktyaWYvRmhBdWxrMUliUk5Venl4ODZRejVTU3RsMSth?=
 =?utf-8?B?L2pMdHVPQ2pXRkdGVkhJczQzNitoTFhjbVZ0ejVXRVBqS3VMTW5jbWtLMjUr?=
 =?utf-8?B?OWxDVHY4a0xvYkxrcGJwUkw4UGw3aVdxUUhHK3FhckhmaUgvcnRZZS9YQUdN?=
 =?utf-8?B?UDRWYUFvQWZET0VzdnBaVW9MRFpCWDdCUG5JTWttK05lK1psNG9ESU1VdTZt?=
 =?utf-8?B?K0F6d0dGUHNXdHF0R0pvOUlYMnlSZThKbGlkMWFPc3F6NGt4dGxWdFFpU0Ez?=
 =?utf-8?B?TnBVeXhpSjBMb0VYQWdvdE55Z1NPWTVZZ1ZPUGN0NldUT3R2cHNWWnFIWFNN?=
 =?utf-8?Q?FEciHwX8OXbD5Re8=3D?=
X-Exchange-RoutingPolicyChecked: q1mRx5gMstDiWDopPm6l+a2qzzPcQRpm8IGK7q77j5I0qeKx6I9knoCTO6M7h16u+HumA5/QMgnrywPclrtH5iimPnrSd3dKutM7X1oPy6PtJr6r21Vr5osRze72vesUVCT8r1hduY5cS535zDxv4+x3S7ub49jw8xUTUuKm7n1P/PJ0Yl9qQV+R3+zPRMuyBmY17FxhgYjLuNumsqgHOXQ/Dbgkc30kygLfvP9YeTTX+7uWXgCIa4dyIzwQAog0bP153XnT7NNXZWrX14P9ocw+LEjEkmD7fsuBrnVNjDArsR1Kn4f2BHoAmPYNgQ3YeU8U5qwoe63JBDOOKsphyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d24523e4-7d39-4eaf-bfba-08df295e759d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:16:19.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zoIBrZsAg+qivmxBKSvWoRS9yrwU8rzJoCW4H3klFrYPVtVNUyjod3TE055P8JYBsEDV84ZP9A+jGFWzhCtbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB016272
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

On Mon, Oct 05, 2026 at 10:06:45PM +0000, Stuart Summers wrote:
> Move the debug specific configfs attributes into the new
> xe_configfs_debug.c file under a new debug configfs subdirectory.
> Ensure these are wrapped in CONFIG_DRM_XE_DEBUG to allow finer grained
> debug changes outside of more ABI specific configfs entries.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c       | 1058 ++----------------------
>  drivers/gpu/drm/xe/xe_configfs.h       |   88 +-
>  drivers/gpu/drm/xe/xe_configfs_debug.c |  979 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs_debug.h |   42 +-
>  drivers/gpu/drm/xe/xe_configfs_types.h |   18 +-
>  drivers/gpu/drm/xe/xe_guc.c            |    1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c        |    1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c      |    1 +
>  drivers/gpu/drm/xe/xe_lrc.c            |    1 +
>  drivers/gpu/drm/xe/xe_pci.c            |    1 +
>  drivers/gpu/drm/xe/xe_psmi.c           |    1 +
>  drivers/gpu/drm/xe/xe_ras.c            |    1 +
>  drivers/gpu/drm/xe/xe_rtp.c            |    1 +
>  13 files changed, 1190 insertions(+), 1003 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8c2c912594fa..8e5ebb3ecfa7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -6,17 +6,14 @@
>  #include <linux/bitops.h>
>  #include <linux/configfs.h>
>  #include <linux/cleanup.h>
> -#include <linux/find.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  
> -#include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
>  #include "xe_configfs_debug.h"
>  #include "xe_defaults.h"
> -#include "xe_gt_types.h"
>  #include "xe_module.h"
>  
>  /**
> @@ -55,13 +52,6 @@
>   *	│   └── ...
>   *	:
>   *	└── 0000:03:00.0
> - *	    ├── ctx_restore_mid_bb
> - *	    ├── ctx_restore_post_bb
> - *	    ├── enable_multi_queue
> - *	    ├── enable_psmi
> - *	    ├── enable_vram_page_offline
> - *	    ├── engines_allowed
> - *	    ├── gt_types_allowed
>   *	    ├── migrate_ulls_period_ms
>   *	    └── survivability_mode
>   *
> @@ -75,158 +65,18 @@
>   * Configure Attributes
>   * ====================
>   *
> - * Context restore BB
> - * ------------------
> - *
> - * Allow to execute a batch buffer during any context switches. When the
> - * GPU is restoring the context, it executes additional commands. It's useful
> - * for testing additional workarounds and validating certain HW behaviors: it's
> - * not intended for normal execution and will taint the kernel with TAINT_TEST
> - * when used.
> - *
> - * The syntax allows to pass straight instructions to be executed by the engine
> - * in a batch buffer or set specific registers.
> - *
> - * #. Generic instruction::
> - *
> - *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> - *
> - * #. Simple register setting::
> - *
> - *	<engine-class> reg <address> <value>
> - *
> - * Commands are saved per engine class: all instances of that class will execute
> - * those commands during context switch. The instruction, dword arguments,
> - * addresses and values are in hex format like in the examples below.
> - *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> - *    normal context restore::
> - *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
> - *
> - * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> - *    beginning of the context restore::
> - *
> - *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> - *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
> -
> - * #. Load certain values in a couple of registers (it can be used as a simpler
> - *    alternative to the `cmd`) action::
> - *
> - *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
> - *	rcs reg 4F100 DEADBEEF
> - *	rcs reg 4F104 FFFFFFFF
> - *	EOF
> - *
> - *    .. note::
> - *
> - *       When using multiple lines, make sure to use a command that is
> - *       implemented with a single write syscall, like HEREDOC.
> - *
> - * Currently this is implemented only for post and mid context restore and
> - * these attributes can only be set before binding to the device.
> - *
> - * Enable multi-queue
> - * ------------------
> - *
> - * Multi-queue support on the device is enabled by default where the
> - * hardware supports it. Writing 0 force-disables multi-queue support:
> - * multi-queue exec-queue group creation via ioctl is refused, and the
> - * GuC feature is disabled::
> - *
> - *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
> - *
> - * This attribute can only be set before binding to the device.
> - *
> - * PSMI
> - * ----
> - *
> - * Enable extra debugging capabilities to trace engine execution. Only useful
> - * during early platform enabling and requires additional hardware connected.
> - * Once it's enabled, additionals WAs are added and runtime configuration is
> - * done via debugfs. Example to enable it::
> - *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> - *
> - * This attribute can only be set before binding to the device.
> - *
> - * Enable VRAM page offline:
> - * -------------------------
> - *
> - *  0, n, N, false - Disable vram page offline (Logging only)
> - *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
> - *
> - *  Example to disable VRAM offline::
> - *
> - *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_vram_page_offline
> - *
> - * This attribute can only be set on CRI before binding to the device.
> - *
> - * Allowed engines:
> - * ----------------
> - *
> - * Allow only a set of engine(s) to be available, disabling the other engines
> - * even if they are available in hardware. This is applied after HW fuses are
> - * considered on each tile. Examples:
> - *
> - * Allow only one render and one copy engines, nothing else::
> - *
> - *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> - *
> - * Allow only compute engines and first copy engine::
> - *
> - *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> - *
> - * Note that the engine names are the per-GT hardware names. On multi-tile
> - * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
> - * and copy engines on each tile.
> - *
> - * The requested configuration may not be supported by the platform and driver
> - * may fail to probe. For example: if at least one copy engine is expected to be
> - * available for migrations, but it's disabled. This is intended for debugging
> - * purposes only.
> - *
> - * This attribute can only be set before binding to the device.
> - *
> - * Allowed GT types:
> - * -----------------
> + * Survivability mode:
> + * -------------------
>   *
> - * Allow only specific types of GTs to be detected and initialized by the
> - * driver.  Any combination of GT types can be enabled/disabled, although
> - * some settings will cause the device to fail to probe.
> + * Enable survivability mode on supported cards. This is a bitmap; bit 0
> + * enables survivability mode and is currently the only bit defined, so the
> + * only accepted values remain 0 and 1. This setting only takes effect when
> + * probing the device. Example to enable it::
>   *
> - * Writes support both comma- and newline-separated input format. Reads
> - * will always return one GT type per line. "primary" and "media" are the
> - * GT type names supported by this interface.
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Examples:
> - *
> - * Allow both primary and media GTs to be initialized and used.  This matches
> - * the driver's default behavior::
> - *
> - *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> - *
> - * Allow only the primary GT of each tile to be initialized and used,
> - * effectively disabling the media GT if it exists on the platform::
> - *
> - *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> - *
> - * Allow only the media GT of each tile to be initialized and used,
> - * effectively disabling the primary GT.  **This configuration will cause
> - * device probe failure on all current platforms, but may be allowed on
> - * igpu platforms in the future**::
> - *
> - *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> - *
> - * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> - * **This configuration will cause device probe failure on all current
> - * platforms, but may be allowed on igpu platforms in the future**::
> - *
> - *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> - *
>   * Migrate ULLS Period (ms)
>   * ------------------------
>   *
> @@ -241,18 +91,6 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Survivability mode:
> - * -------------------
> - *
> - * Enable survivability mode on supported cards. This is a bitmap; bit 0
> - * enables survivability mode and is currently the only bit defined, so the
> - * only accepted values remain 0 and 1. This setting only takes effect when
> - * probing the device. Example to enable it::
> - *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> - *
> - * This attribute can only be set before binding to the device.
> - *
>   * Max SR-IOV Virtual Functions
>   * ----------------------------
>   *
> @@ -287,14 +125,18 @@
>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>   */
>  
> -static const struct xe_config_device device_defaults = {
> -	.engines_allowed = U64_MAX,
> -	.gt_types_allowed = U64_MAX,
> +const struct xe_config_device xe_configfs_device_defaults = {
>  	.migrate_ulls_period_ms = 5,
>  	.survivability_mode = 0,
> -	.enable_multi_queue = true,
> -	.enable_psmi = false,
> -	.enable_vram_page_offline = true,
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	.debug = {
> +		.engines_allowed = U64_MAX,
> +		.gt_types_allowed = U64_MAX,
> +		.enable_multi_queue = true,
> +		.enable_psmi = false,
> +		.enable_vram_page_offline = true,
> +	},
> +#endif
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -303,50 +145,22 @@ static const struct xe_config_device device_defaults = {
>  
>  static void set_device_defaults(struct xe_config_device *config)
>  {
> -	*config = device_defaults;
> +	*config = xe_configfs_device_defaults;
>  #ifdef CONFIG_PCI_IOV
>  	config->sriov.max_vfs = xe_modparam.max_vfs;
>  #endif
>  }
>  
> -struct engine_info {
> -	const char *cls;
> -	u64 mask;
> -	enum xe_engine_class engine_class;
> -};
> -
> -/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> -#define MAX_ENGINE_CLASS_CHARS 5
> -#define MAX_ENGINE_INSTANCE_CHARS 2
> -
> -static const struct engine_info engine_info[] = {
> -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
> -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
> -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
> -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
> -};
> -
> -static const struct {
> -	const char *name;
> -	enum xe_gt_type type;
> -} gt_types[] = {
> -	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> -	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> -};
> -
> -static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
> -{
> -	return container_of(to_config_group(item), struct xe_config_group_device, group);
> -}
> -
> -static struct xe_config_device *to_xe_config_device(struct config_item *item)
> -{
> -	return &to_xe_config_group_device(item)->config;
> -}
> -
> -static bool is_bound(struct xe_config_group_device *dev)
> +/**
> + * xe_configfs_is_bound - check whether the matching pci device is bound
> + * @dev: configfs group device
> + *
> + * Caller must hold @dev->lock.
> + *
> + * Return: true if the matching pci_dev is already bound to a driver,
> + *     false otherwise.
> + */
> +bool xe_configfs_is_bound(struct xe_config_group_device *dev)
>  {
>  	unsigned int domain, bus, slot, function;
>  	struct pci_dev *pdev;
> @@ -371,598 +185,14 @@ static bool is_bound(struct xe_config_group_device *dev)
>  	return ret;
>  }
>  
> -static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev);
> -
> -/**
> - * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
> - * @pdev: pci device
> - * @class: hw engine class
> - * @cs: destination buffer for the batch, or NULL to only query the length
> - * @max_len: capacity of @cs, in dwords
> - *
> - * Copy the configured batch into @cs while holding the configfs lock, so the
> - * caller never gets a pointer to storage owned by the configfs group.
> - *
> - * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
> - * -ENOSPC if it does not fit in @max_len
> - */
> -ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -					   enum xe_engine_class class,
> -					   u32 *cs, size_t max_len)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	ssize_t len;
> -
> -	if (!dev)
> -		return 0;
> -
> -	scoped_guard(mutex, &dev->lock) {
> -		len = dev->config.ctx_restore_mid_bb[class].len;
> -		if (cs && len) {
> -			if (len > max_len)
> -				len = -ENOSPC;
> -			else
> -				memcpy(cs, dev->config.ctx_restore_mid_bb[class].cs,
> -				       len * sizeof(u32));
> -		}
> -	}
> -	config_group_put(&dev->group);
> -
> -	return len;
> -}
> -
> -/**
> - * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> - * @pdev: pci device
> - * @class: hw engine class
> - * @cs: destination buffer for the batch, or NULL to only query the length
> - * @max_len: capacity of @cs, in dwords
> - *
> - * Copy the configured batch into @cs while holding the configfs lock, so the
> - * caller never gets a pointer to storage owned by the configfs group.
> - *
> - * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
> - * -ENOSPC if it does not fit in @max_len
> - */
> -ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -					    enum xe_engine_class class,
> -					    u32 *cs, size_t max_len)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	ssize_t len;
> -
> -	if (!dev)
> -		return 0;
> -
> -	scoped_guard(mutex, &dev->lock) {
> -		len = dev->config.ctx_restore_post_bb[class].len;
> -		if (cs && len) {
> -			if (len > max_len)
> -				len = -ENOSPC;
> -			else
> -				memcpy(cs, dev->config.ctx_restore_post_bb[class].cs,
> -				       len * sizeof(u32));
> -		}
> -	}
> -	config_group_put(&dev->group);
> -
> -	return len;
> -}
> -
> -static bool wa_bb_read_advance(bool dereference, char **p,
> -			       const char *append, size_t len,
> -			       size_t *max_size)
> -{
> -	if (dereference) {
> -		if (len >= *max_size)
> -			return false;
> -		*max_size -= len;
> -		if (append)
> -			memcpy(*p, append, len);
> -	}
> -
> -	*p += len;
> -
> -	return true;
> -}
> -
> -static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> -			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> -			  char *data, size_t sz)
> -{
> -	char *p = data;
> -
> -	guard(mutex)(&dev->lock);
> -
> -	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> -		enum xe_engine_class ec = engine_info[i].engine_class;
> -		size_t len;
> -
> -		if (!wa_bb[ec].len)
> -			continue;
> -
> -		len = snprintf(p, sz, "%s:", engine_info[i].cls);
> -		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> -			return -ENOBUFS;
> -
> -		for (size_t j = 0; j < wa_bb[ec].len; j++) {
> -			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
> -			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> -				return -ENOBUFS;
> -		}
> -
> -		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
> -			return -ENOBUFS;
> -	}
> -
> -	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> -		return -ENOBUFS;
> -
> -	/* Reserve one more to match check for '\0' */
> -	if (!data)
> -		p++;
> -
> -	return p - data;
> -}
> -
> -static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -
> -	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
> -}
> -
> -static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -
> -	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
> -}
> -
> -static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
> -{
> -	if (wa_bb->cs)
> -		wa_bb->cs[wa_bb->len] = val;
> -
> -	wa_bb->len++;
> -}
> -
> -static ssize_t parse_hex(const char *line, u32 *pval)
> -{
> -	char numstr[12];
> -	const char *p;
> -	ssize_t numlen;
> -
> -	p = line + strspn(line, " \t");
> -	if (!*p || *p == '\n')
> -		return 0;
> -
> -	numlen = strcspn(p, " \t\n");
> -	if (!numlen || numlen >= sizeof(numstr) - 1)
> -		return -EINVAL;
> -
> -	memcpy(numstr, p, numlen);
> -	numstr[numlen] = '\0';
> -	p += numlen;
> -
> -	if (kstrtou32(numstr, 16, pval))
> -		return -EINVAL;
> -
> -	return p - line;
> -}
> -
> -static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> -			const struct engine_info **pinfo);
> -
> -/*
> - * Parse lines with the format
> - *
> - *	<engine-class> cmd <u32> <u32...>
> - *	<engine-class> reg <u32_addr> <u32_val>
> - *
> - * and optionally save them in @wa_bb[i].cs is non-NULL.
> - *
> - * Return the number of dwords parsed.
> - */
> -static ssize_t parse_wa_bb_lines(const char *lines,
> -				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> -{
> -	ssize_t dwords = 0, ret;
> -	const char *p;
> -
> -	/*
> -	 * Each iteration consumes at least the engine class token if it doesn't
> -	 * error out, so the loop always makes progress without advancing @p.
> -	 */
> -	for (p = lines; *p;) {
> -		const struct engine_info *info = NULL;
> -		u32 val, val2;
> -
> -		/* Also allow empty lines */
> -		p += strspn(p, " \t\n");
> -		if (!*p)
> -			break;
> -
> -		ret = parse_engine(p, " \t\n", NULL, &info);
> -		if (ret < 0)
> -			return ret;
> -
> -		p += ret;
> -		p += strspn(p, " \t");
> -
> -		if (str_has_prefix(p, "cmd")) {
> -			for (p += strlen("cmd"); *p;) {
> -				ret = parse_hex(p, &val);
> -				if (ret < 0)
> -					return -EINVAL;
> -				if (!ret)
> -					break;
> -
> -				p += ret;
> -				dwords++;
> -				wa_bb_append(&wa_bb[info->engine_class], val);
> -			}
> -		} else if (str_has_prefix(p, "reg")) {
> -			p += strlen("reg");
> -			ret = parse_hex(p, &val);
> -			if (ret <= 0)
> -				return -EINVAL;
> -
> -			p += ret;
> -			ret = parse_hex(p, &val2);
> -			if (ret <= 0)
> -				return -EINVAL;
> -
> -			p += ret;
> -			dwords += 3;
> -			wa_bb_append(&wa_bb[info->engine_class],
> -				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
> -			wa_bb_append(&wa_bb[info->engine_class], val);
> -			wa_bb_append(&wa_bb[info->engine_class], val2);
> -		} else {
> -			return -EINVAL;
> -		}
> -	}
> -
> -	return dwords;
> -}
> -
> -static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> -			   struct xe_config_group_device *dev,
> -			   const char *page, size_t len)
> -{
> -	/* tmp_wa_bb must match wa_bb's size */
> -	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
> -	ssize_t count, class;
> -	u32 *tmp;
> -
> -	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
> -	count = parse_wa_bb_lines(page, tmp_wa_bb);
> -	if (count < 0)
> -		return count;
> -
> -	guard(mutex)(&dev->lock);
> -
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	/*
> -	 * 2. Allocate a u32 array and set the pointers to the right positions
> -	 * according to the length of each class' wa_bb
> -	 */
> -	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	if (!count) {
> -		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> -		return len;
> -	}
> -
> -	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		tmp_wa_bb[class].cs = tmp + count;
> -		count += tmp_wa_bb[class].len;
> -		tmp_wa_bb[class].len = 0;
> -	}
> -
> -	/* 3. Parse wa_bb lines again, this time saving the values */
> -	count = parse_wa_bb_lines(page, tmp_wa_bb);
> -	if (count < 0)
> -		return count;
> -
> -	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> -
> -	return len;
> -}
> -
> -static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> -					const char *data, size_t sz)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -
> -	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
> -}
> -
> -static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> -					 const char *data, size_t sz)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -
> -	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
> -}
> -
> -/**
> - * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> - * @pdev: pci device
> - *
> - * Return: engine mask with allowed engines set in configfs
> - */
> -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u64 engines_allowed;
> -
> -	if (!dev)
> -		return device_defaults.engines_allowed;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		engines_allowed = dev->config.engines_allowed;
> -	config_group_put(&dev->group);
> -
> -	return engines_allowed;
> -}
> -
> -static ssize_t engines_allowed_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -	char *p = page;
> -
> -	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u64 mask = engine_info[i].mask;
> -
> -		if ((dev->engines_allowed & mask) == mask) {
> -			p += sprintf(p, "%s*\n", engine_info[i].cls);
> -		} else if (mask & dev->engines_allowed) {
> -			u16 bit0 = __ffs64(mask), bit;
> -
> -			mask &= dev->engines_allowed;
> -
> -			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> -				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> -					     bit - bit0);
> -		}
> -	}
> -
> -	return p - page;
> -}
> -
> -/*
> - * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> - * instance in @pattern.
> - *
> - * Examples of inputs:
> - * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> - *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> - * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> - *   mask == XE_HW_ENGINE_RCS_MASK
> - * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> - */
> -static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
> -{
> -	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u8 instance;
> -		u16 bit;
> -
> -		if (!str_has_prefix(pattern, engine_info[i].cls))
> -			continue;
> -
> -		pattern += strlen(engine_info[i].cls);
> -		if (!mask)
> -			return *pattern ? NULL : &engine_info[i];
> -
> -		if (!strcmp(pattern, "*")) {
> -			*mask = engine_info[i].mask;
> -			return &engine_info[i];
> -		}
> -
> -		if (kstrtou8(pattern, 10, &instance))
> -			return NULL;
> -
> -		bit = __ffs64(engine_info[i].mask) + instance;
> -		if (bit >= fls64(engine_info[i].mask))
> -			return NULL;
> -
> -		*mask = BIT_ULL(bit);
> -		return &engine_info[i];
> -	}
> -
> -	return NULL;
> -}
> -
> -static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> -			const struct engine_info **pinfo)
> -{
> -	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> -	const struct engine_info *info;
> -	size_t len;
> -
> -	len = strcspn(s, end_chars);
> -	if (len >= sizeof(buf))
> -		return -EINVAL;
> -
> -	memcpy(buf, s, len);
> -	buf[len] = '\0';
> -
> -	info = lookup_engine_info(buf, mask);
> -	if (!info)
> -		return -ENOENT;
> -
> -	if (pinfo)
> -		*pinfo = info;
> -
> -	return len;
> -}
> -
> -static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> -				     size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	ssize_t patternlen, p;
> -	u64 mask, val = 0;
> -
> -	for (p = 0; p < len; p += patternlen + 1) {
> -		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
> -		if (patternlen < 0)
> -			return -EINVAL;
> -
> -		val |= mask;
> -	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.engines_allowed = val;
> -
> -	return len;
> -}
> -
> -static u64 get_gt_types_allowed(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u64 mask;
> -
> -	if (!dev)
> -		return device_defaults.gt_types_allowed;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		mask = dev->config.gt_types_allowed;
> -	config_group_put(&dev->group);
> -
> -	return mask;
> -}
> -
> -/**
> - * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
> - * @pdev: pci device
> - *
> - * Return: True if primary GTs are enabled, false if they have been disabled via
> - *     configfs.
> - */
> -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> -{
> -	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
> -}
> -
> -/**
> - * xe_configfs_media_gt_allowed - determine whether media GTs are supported
> - * @pdev: pci device
> - *
> - * Return: True if the media GTs are enabled, false if they have been disabled
> - *     via configfs.
> - */
> -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> -{
> -	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
> -}
> -
> -static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -	char *p = page;
> -
> -	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> -		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> -			p += sprintf(p, "%s\n", gt_types[i].name);
> -
> -	return p - page;
> -}
> -
> -static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> -				      size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> -	char *p = buf;
> -	u64 typemask = 0;
> -
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	while (p) {
> -		char *typename = strsep(&p, ",\n");
> -		bool matched = false;
> -
> -		if (typename[0] == '\0')
> -			continue;
> -
> -		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> -			if (strcmp(typename, gt_types[i].name) == 0) {
> -				typemask |= BIT(gt_types[i].type);
> -				matched = true;
> -				break;
> -			}
> -		}
> -
> -		if (!matched)
> -			return -EINVAL;
> -	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.gt_types_allowed = typemask;
> -
> -	return len;
> -}
> -
> -/**
> - * xe_configfs_get_migrate_ulls_period_ms - get configfs migrate_ulls_period_ms setting
> - * @pdev: pci device
> - *
> - * Return: Migrate ULLS period in milliseconds (zero is disabled).
> - */
> -u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	u32 ret;
> -
> -	if (!dev)
> -		return device_defaults.migrate_ulls_period_ms;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.migrate_ulls_period_ms;
> -	config_group_put(&dev->group);
> -
> -	return ret;
> -}
> -
> -static ssize_t migrate_ulls_period_ms_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%u\n", dev->migrate_ulls_period_ms);
> -}
> -
> -static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
> -					    const char *page, size_t len)
> +static void xe_config_device_release(struct config_item *item)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	u32 val;
> -	int ret;
> -
> -	ret = kstrtou32(page, 0, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> +	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
>  
> -	dev->config.migrate_ulls_period_ms = val;
> +	mutex_destroy(&dev->lock);
>  
> -	return len;
> +	xe_configfs_debug_release_config(&dev->config);
> +	kfree(dev);
>  }
>  
>  /**
> @@ -973,11 +203,11 @@ static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
>   */
>  u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev);
>  	u8 mode;
>  
>  	if (!dev)
> -		return device_defaults.survivability_mode;
> +		return xe_configfs_device_defaults.survivability_mode;
>  
>  	scoped_guard(mutex, &dev->lock)
>  		mode = dev->config.survivability_mode;
> @@ -988,14 +218,14 @@ u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  
>  static ssize_t survivability_mode_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_device *dev = xe_configfs_to_device(item);
>  
>  	return sprintf(page, "%u\n", dev->survivability_mode);
>  }
>  
>  static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
>  	u8 survivability_mode;
>  	int ret;
>  
> @@ -1007,7 +237,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  		return -EINVAL;
>  
>  	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> +	if (xe_configfs_is_bound(dev))
>  		return -EBUSY;
>  
>  	dev->config.survivability_mode = survivability_mode;
> @@ -1016,183 +246,62 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  }
>  
>  /**
> - * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
> - * @pdev: pci device
> - *
> - * Return: true if multi-queue is enabled for this device (the default),
> - * false if it has been force-disabled via configfs.
> - */
> -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool ret;
> -
> -	if (!dev)
> -		return true;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.enable_multi_queue;
> -	config_group_put(&dev->group);
> -
> -	return ret;
> -}
> -
> -static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_multi_queue);
> -}
> -
> -static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
> -					size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret = kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_multi_queue = val;
> -
> -	return len;
> -}
> -
> -/**
> - * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> - * @pdev: pci device
> - *
> - * Return: enable_psmi setting in configfs
> - */
> -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> -{
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool ret;
> -
> -	if (!dev)
> -		return false;
> -
> -	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.enable_psmi;
> -	config_group_put(&dev->group);
> -
> -	return ret;
> -}
> -
> -static ssize_t enable_psmi_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev = to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_psmi);
> -}
> -
> -static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret = kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_psmi = val;
> -
> -	return len;
> -}
> -
> -/**
> - * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
> + * xe_configfs_get_migrate_ulls_period_ms - get configfs migrate_ulls_period_ms setting
>   * @pdev: pci device
>   *
> - * Return: enable_vram_page_offline setting in configfs
> + * Return: Migrate ULLS period in milliseconds (zero is disabled).
>   */
> -bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
> +u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool ret;
> +	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev);
> +	u32 ret;
>  
>  	if (!dev)
> -		return device_defaults.enable_vram_page_offline;
> +		return xe_configfs_device_defaults.migrate_ulls_period_ms;
>  
>  	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.enable_vram_page_offline;
> +		ret = dev->config.migrate_ulls_period_ms;
>  	config_group_put(&dev->group);
>  
>  	return ret;
>  }
>  
> -static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
> +static ssize_t migrate_ulls_period_ms_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_device *dev = to_xe_config_device(item);
> +	struct xe_config_device *dev = xe_configfs_to_device(item);
>  
> -	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
> +	return sprintf(page, "%u\n", dev->migrate_ulls_period_ms);
>  }
>  
> -static ssize_t enable_vram_page_offline_store(struct config_item *item,
> -					      const char *page, size_t len)
> +static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
> +					    const char *page, size_t len)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool val;
> +	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
> +	u32 val;
>  	int ret;
>  
> -	ret = kstrtobool(page, &val);
> +	ret = kstrtou32(page, 0, &val);
>  	if (ret)
>  		return ret;
>  
>  	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> +	if (xe_configfs_is_bound(dev))
>  		return -EBUSY;
>  
> -	dev->config.enable_vram_page_offline = val;
> +	dev->config.migrate_ulls_period_ms = val;
>  
>  	return len;
>  }
>  
> -CONFIGFS_ATTR(, ctx_restore_mid_bb);
> -CONFIGFS_ATTR(, ctx_restore_post_bb);
> -CONFIGFS_ATTR(, engines_allowed);
> -CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, migrate_ulls_period_ms);
>  CONFIGFS_ATTR(, survivability_mode);
> -CONFIGFS_ATTR(, enable_multi_queue);
> -CONFIGFS_ATTR(, enable_psmi);
> -CONFIGFS_ATTR(, enable_vram_page_offline);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
> -	&attr_ctx_restore_mid_bb,
> -	&attr_ctx_restore_post_bb,
> -	&attr_engines_allowed,
> -	&attr_gt_types_allowed,
>  	&attr_migrate_ulls_period_ms,
>  	&attr_survivability_mode,
> -	&attr_enable_multi_queue,
> -	&attr_enable_psmi,
> -	&attr_enable_vram_page_offline,
>  	NULL,
>  };
>  
> -static void xe_config_device_release(struct config_item *item)
> -{
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -
> -	mutex_destroy(&dev->lock);
> -
> -	kfree(dev->config.ctx_restore_mid_bb[0].cs);
> -	kfree(dev->config.ctx_restore_post_bb[0].cs);
> -	kfree(dev);
> -}
> -
>  static struct configfs_item_operations xe_config_device_ops = {
>  	.release	= xe_config_device_release,
>  };
> @@ -1200,18 +309,13 @@ static struct configfs_item_operations xe_config_device_ops = {
>  static bool xe_config_device_is_visible(struct config_item *item,
>  					struct configfs_attribute *attr, int n)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
>  
>  	if (attr == &attr_survivability_mode) {
>  		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
>  			return false;
>  	}
>  
> -	if (attr == &attr_enable_vram_page_offline) {
> -		if (!dev->desc->is_dgfx || dev->desc->platform != XE_CRESCENTISLAND)
> -			return false;
> -	}
> -
>  	return true;
>  }
>  
> @@ -1228,7 +332,7 @@ static const struct config_item_type xe_config_device_type = {
>  
>  static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
>  
>  	guard(mutex)(&dev->lock);
>  
> @@ -1240,13 +344,13 @@ static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
>  
>  static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
>  	unsigned int max_vfs;
>  	int ret;
>  
>  	guard(mutex)(&dev->lock);
>  
> -	if (is_bound(dev))
> +	if (xe_configfs_is_bound(dev))
>  		return -EBUSY;
>  
>  	ret = kstrtouint(page, 0, &max_vfs);
> @@ -1262,7 +366,7 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
>  
>  static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
>  
>  	guard(mutex)(&dev->lock);
>  
> @@ -1271,13 +375,13 @@ static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
>  
>  static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *page, size_t len)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
>  	bool admin_only_pf;
>  	int ret;
>  
>  	guard(mutex)(&dev->lock);
>  
> -	if (is_bound(dev))
> +	if (xe_configfs_is_bound(dev))
>  		return -EBUSY;
>  
>  	ret = kstrtobool(page, &admin_only_pf);
> @@ -1300,7 +404,7 @@ static struct configfs_attribute *xe_config_sriov_attrs[] = {
>  static bool xe_config_sriov_is_visible(struct config_item *item,
>  				       struct configfs_attribute *attr, int n)
>  {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
>  
>  	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
>  		return false;
> @@ -1436,7 +540,17 @@ static struct configfs_subsystem xe_configfs = {
>  	},
>  };
>  
> -static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
> +/**
> + * xe_configfs_find_group_device() - Find a configfs group by PCI device.
> + * @pdev: the &pci_dev to look up
> + *
> + * Searches the configfs subsystem for a group whose name matches @pdev.
> + * If found, the returned group has an elevated reference count; the caller
> + * must call config_group_put() when done.
> + *
> + * Return: pointer to the matching &xe_config_group_device, or NULL.
> + */
> +struct xe_config_group_device *xe_configfs_find_group_device(struct pci_dev *pdev)
>  {
>  	struct config_item *item;
>  
> @@ -1447,25 +561,27 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
>  	if (!item)
>  		return NULL;
>  
> -	return to_xe_config_group_device(item);
> +	return xe_configfs_to_group_device(item);
>  }
>  
>  static void dump_custom_dev_config(struct pci_dev *pdev,
>  				   struct xe_config_group_device *dev)
>  {
>  #define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
> -		if (dev->config.attr_ != device_defaults.attr_) \
> +		if (dev->config.attr_ != xe_configfs_device_defaults.attr_) \
>  			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
>  				 dev->config.attr_); \
>  	} while (0)
>  
> -	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> -	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%u", migrate_ulls_period_ms);
>  	PRI_CUSTOM_ATTR("%u", survivability_mode);
> -	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
> -	PRI_CUSTOM_ATTR("%d", enable_psmi);
> -	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
> +	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
> +	PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
> +	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", debug.enable_vram_page_offline);
> +#endif
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> @@ -1480,13 +596,13 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   */
>  void xe_configfs_check_device(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev);
>  
>  	if (!dev)
>  		return;
>  
>  	/* memcmp here is safe as both are zero-initialized */
> -	if (memcmp(&dev->config, &device_defaults, sizeof(dev->config))) {
> +	if (memcmp(&dev->config, &xe_configfs_device_defaults, sizeof(dev->config))) {
>  		pci_info(pdev, "Found custom settings in configfs\n");
>  		dump_custom_dev_config(pdev, dev);
>  	}
> @@ -1508,7 +624,7 @@ void xe_configfs_check_device(struct pci_dev *pdev)
>   */
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev);
>  	bool admin_only_pf;
>  
>  	if (!dev)
> @@ -1533,7 +649,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
>   */
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
> -	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev);
>  	unsigned int max_vfs;
>  
>  	if (!dev)
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index c832de85b771..cb7185044d6a 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,7 +14,11 @@
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  
> +struct config_item;
>  struct pci_dev;
> +struct xe_config_group_device;
> +
> +extern const struct xe_config_device xe_configfs_device_defaults;
>  
>  /**
>   * DOC: survivability_mode configfs bits
> @@ -28,23 +32,71 @@ struct pci_dev;
>  #define XE_CONFIGFS_SURVIVABILITY_MASK		XE_CONFIGFS_SURVIVABILITY_ENABLE
>  
>  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> +/**
> + * xe_configfs_to_group_device() - Cast a config_item to &xe_config_group_device.
> + * @item: the &config_item embedded in the device group
> + *
> + * The @item must be the top-level device group's cg_item, not a subgroup item.
> + * Use xe_configfs_subgroup_to_group_device() for subgroup show/store callbacks.
> + *
> + * Return: pointer to the enclosing &xe_config_group_device.
> + */
> +static inline struct xe_config_group_device *
> +xe_configfs_to_group_device(struct config_item *item)
> +{
> +	return container_of(to_config_group(item), struct xe_config_group_device, group);
> +}
> +
> +/**
> + * xe_configfs_to_device() - Cast a config_item to &xe_config_device.
> + * @item: the &config_item embedded in the device group
> + *
> + * Convenience wrapper around xe_configfs_to_group_device().
> + *
> + * Return: pointer to the &xe_config_device nested in the group.
> + */
> +static inline struct xe_config_device *xe_configfs_to_device(struct config_item *item)
> +{
> +	return &xe_configfs_to_group_device(item)->config;
> +}
> +
> +/**
> + * xe_configfs_subgroup_to_group_device() - Cast a subgroup item to &xe_config_group_device.
> + * @item: the &config_item of a subgroup (e.g. sriov or debug)
> + *
> + * In configfs, show/store callbacks for a subgroup's attributes receive the
> + * subgroup's cg_item, whose parent is the device group's cg_item.
> + * This helper walks up one level to return the enclosing device group.
> + *
> + * Return: pointer to the enclosing &xe_config_group_device.
> + */
> +static inline struct xe_config_group_device *
> +xe_configfs_subgroup_to_group_device(struct config_item *item)
> +{
> +	return xe_configfs_to_group_device(item->ci_parent);
> +}
> +
> +/**
> + * xe_configfs_subgroup_to_device() - Cast a subgroup item to &xe_config_device.
> + * @item: the &config_item of a subgroup (e.g. sriov or debug)
> + *
> + * Convenience wrapper for a subgroup item to get the &xe_config_device.
> + *
> + * Return: pointer to the &xe_config_device nested in the parent device group.
> + */
> +static inline struct xe_config_device *
> +xe_configfs_subgroup_to_device(struct config_item *item)
> +{
> +	return xe_configfs_to_device(item->ci_parent);
> +}
> +
> +bool xe_configfs_is_bound(struct xe_config_group_device *dev);
> +struct xe_config_group_device *xe_configfs_find_group_device(struct pci_dev *pdev);
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -					   enum xe_engine_class class,
> -					   u32 *cs, size_t max_len);
> -ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -					    enum xe_engine_class class,
> -					    u32 *cs, size_t max_len);
> -u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> -bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> -bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
>  u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> -bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> -bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> @@ -53,20 +105,8 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> -static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -							 enum xe_engine_class class,
> -							 u32 *cs, size_t max_len) { return 0; }
> -static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -							  enum xe_engine_class class,
> -							  u32 *cs, size_t max_len) { return 0; }
> -static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> -static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> -static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
>  static inline u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return 0; }
> -static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
>  #ifdef CONFIG_PCI_IOV
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
> index 45617282cec5..a6800706eefa 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.c
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> @@ -3,12 +3,991 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/configfs.h>
>  #include <linux/module.h>
> +#include <linux/cleanup.h>
> +#include <linux/find.h>
> +#include <linux/pci.h>
> +#include <linux/string.h>
>  
> +#include "abi/guc_log_abi.h"
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_configfs.h"
>  #include "xe_configfs_debug.h"
>  #include "xe_configfs_types.h"
> +#include "xe_gt_types.h"
> +#include "xe_hw_engine_types.h"
> +#include "xe_pci_types.h"
> +
> +/**
> + * DOC: Xe Configfs Debug Attributes
> + *
> + * Overview
> + * ========
> + *
> + * The following configfs attributes are only available when the kernel is
> + * built with ``CONFIG_DRM_XE_DEBUG=y``. They appear under the ``debug/``
> + * subdirectory of each xe configfs device. They are intended for hardware
> + * and driver debugging and are not stable ABI. Using them is "at your own
> + * risk".
> + *
> + * See the top-level ``Xe Configfs`` documentation in ``xe_configfs.c``
> + * for how to create, probe and remove configfs devices. Once a device
> + * directory exists, the driver populates it with a ``debug/`` subdirectory
> + * containing the entries described below::
> + *
> + *	/sys/kernel/config/xe/
> + *	└── 0000:03:00.0
> + *	    └── debug/
> + *	        ├── ctx_restore_mid_bb
> + *	        ├── ctx_restore_post_bb
> + *	        ├── enable_multi_queue
> + *	        ├── enable_psmi
> + *	        ├── enable_vram_page_offline
> + *	        ├── engines_allowed
> + *	        └── gt_types_allowed
> + *
> + * Configure Attributes
> + * ====================
> + *
> + * Context restore BB
> + * ------------------
> + *
> + * Allow to execute a batch buffer during any context switches. When the
> + * GPU is restoring the context, it executes additional commands. It's useful
> + * for testing additional workarounds and validating certain HW behaviors: it's
> + * not intended for normal execution and will taint the kernel with TAINT_TEST
> + * when used.
> + *
> + * The syntax allows to pass straight instructions to be executed by the engine
> + * in a batch buffer or set specific registers.
> + *
> + * #. Generic instruction::
> + *
> + *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
> + *
> + * #. Simple register setting::
> + *
> + *	<engine-class> reg <address> <value>
> + *
> + * Commands are saved per engine class: all instances of that class will execute
> + * those commands during context switch. The instruction, dword arguments,
> + * addresses and values are in hex format like in the examples below.
> + *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
> + *    normal context restore::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb
> + *
> + * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
> + *    beginning of the context restore::
> + *
> + *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
> + *		> /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_mid_bb
> + *
> + * #. Load certain values in a couple of registers (it can be used as a simpler
> + *    alternative to the `cmd`) action::
> + *
> + *	# cat > /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb <<EOF
> + *	rcs reg 4F100 DEADBEEF
> + *	rcs reg 4F104 FFFFFFFF
> + *	EOF
> + *
> + *    .. note::
> + *
> + *       When using multiple lines, make sure to use a command that is
> + *       implemented with a single write syscall, like HEREDOC.
> + *
> + * Currently this is implemented only for post and mid context restore and
> + * these attributes can only be set before binding to the device.
> + *
> + * Enable multi-queue
> + * ------------------
> + *
> + * Multi-queue support on the device is enabled by default where the
> + * hardware supports it. Writing 0 force-disables multi-queue support:
> + * multi-queue exec-queue group creation via ioctl is refused, and the
> + * GuC feature is disabled::
> + *
> + *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/debug/enable_multi_queue
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * PSMI
> + * ----
> + *
> + * Enable extra debugging capabilities to trace engine execution. Only useful
> + * during early platform enabling and requires additional hardware connected.
> + * Once it's enabled, additionals WAs are added and runtime configuration is
> + * done via debugfs. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/debug/enable_psmi
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Enable VRAM page offline:
> + * -------------------------
> + *
> + *  0, n, N, false - Disable vram page offline (Logging only)
> + *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
> + *
> + *  Example to disable VRAM offline::
> + *
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/debug/enable_vram_page_offline
> + *
> + * This attribute can only be set on CRI before binding to the device.
> + *
> + * Allowed engines:
> + * ----------------
> + *
> + * Allow only a set of engine(s) to be available, disabling the other engines
> + * even if they are available in hardware. This is applied after HW fuses are
> + * considered on each tile. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
> + *
> + * Note that the engine names are the per-GT hardware names. On multi-tile
> + * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
> + * and copy engines on each tile.
> + *
> + * The requested configuration may not be supported by the platform and driver
> + * may fail to probe. For example: if at least one copy engine is expected to be
> + * available for migrations, but it's disabled. This is intended for debugging
> + * purposes only.
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Allowed GT types:
> + * -----------------
> + *
> + * Allow only specific types of GTs to be detected and initialized by the
> + * driver.  Any combination of GT types can be enabled/disabled, although
> + * some settings will cause the device to fail to probe.
> + *
> + * Writes support both comma- and newline-separated input format. Reads
> + * will always return one GT type per line. "primary" and "media" are the
> + * GT type names supported by this interface.
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Examples:
> + *
> + * Allow both primary and media GTs to be initialized and used.  This matches
> + * the driver's default behavior::
> + *
> + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> + *
> + * Allow only the primary GT of each tile to be initialized and used,
> + * effectively disabling the media GT if it exists on the platform::
> + *
> + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> + *
> + * Allow only the media GT of each tile to be initialized and used,
> + * effectively disabling the primary GT.  **This configuration will cause
> + * device probe failure on all current platforms, but may be allowed on
> + * igpu platforms in the future**::
> + *
> + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> + *
> + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> + * **This configuration will cause device probe failure on all current
> + * platforms, but may be allowed on igpu platforms in the future**::
> + *
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
> + */
> +
> +struct engine_info {
> +	const char *cls;
> +	u64 mask;
> +	enum xe_engine_class engine_class;
> +};
> +
> +/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> +#define MAX_ENGINE_CLASS_CHARS 5
> +#define MAX_ENGINE_INSTANCE_CHARS 2
> +
> +static const struct engine_info engine_info[] = {
> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
> +};
> +
> +static const struct {
> +	const char *name;
> +	enum xe_gt_type type;
> +} gt_types[] = {
> +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> +};
> +
> +static struct xe_config_group_device *find_device(struct pci_dev *pdev)
> +{
> +	return xe_configfs_find_group_device(pdev);
> +}
> +
> +/**
> + * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: destination buffer for the batch, or NULL to only query the length
> + * @max_len: capacity of @cs, in dwords
> + *
> + * Copy the configured batch into @cs while holding the configfs lock, so the
> + * caller never gets a pointer to storage owned by the configfs group.
> + *
> + * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
> + * -ENOSPC if it does not fit in @max_len
> + */
> +ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +					   enum xe_engine_class class,
> +					   u32 *cs, size_t max_len)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	ssize_t len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		len = dev->config.debug.ctx_restore_mid_bb[class].len;
> +		if (cs && len) {
> +			if (len > max_len)
> +				len = -ENOSPC;
> +			else
> +				memcpy(cs, dev->config.debug.ctx_restore_mid_bb[class].cs,
> +				       len * sizeof(u32));
> +		}
> +	}
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: destination buffer for the batch, or NULL to only query the length
> + * @max_len: capacity of @cs, in dwords
> + *
> + * Copy the configured batch into @cs while holding the configfs lock, so the
> + * caller never gets a pointer to storage owned by the configfs group.
> + *
> + * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
> + * -ENOSPC if it does not fit in @max_len
> + */
> +ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					    enum xe_engine_class class,
> +					    u32 *cs, size_t max_len)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	ssize_t len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		len = dev->config.debug.ctx_restore_post_bb[class].len;
> +		if (cs && len) {
> +			if (len > max_len)
> +				len = -ENOSPC;
> +			else
> +				memcpy(cs, dev->config.debug.ctx_restore_post_bb[class].cs,
> +				       len * sizeof(u32));
> +		}
> +	}
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}
> +
> +static bool wa_bb_read_advance(bool dereference, char **p,
> +			       const char *append, size_t len,
> +			       size_t *max_size)
> +{
> +	if (dereference) {
> +		if (len >= *max_size)
> +			return false;
> +		*max_size -= len;
> +		if (append)
> +			memcpy(*p, append, len);
> +	}
> +
> +	*p += len;
> +
> +	return true;
> +}
> +
> +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> +			  char *data, size_t sz)
> +{
> +	char *p = data;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		enum xe_engine_class ec = engine_info[i].engine_class;
> +		size_t len;
> +
> +		if (!wa_bb[ec].len)
> +			continue;
> +
> +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
> +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +			return -ENOBUFS;
> +
> +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
> +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
> +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +				return -ENOBUFS;
> +		}
> +
> +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
> +			return -ENOBUFS;
> +	}
> +
> +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> +		return -ENOBUFS;
> +
> +	/* Reserve one more to match check for '\0' */
> +	if (!data)
> +		p++;
> +
> +	return p - data;
> +}
> +
> +static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +
> +	return wa_bb_show(dev, dev->config.debug.ctx_restore_mid_bb, page, SZ_4K);
> +}
> +
> +static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +
> +	return wa_bb_show(dev, dev->config.debug.ctx_restore_post_bb, page, SZ_4K);
> +}
> +
> +static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
> +{
> +	if (wa_bb->cs)
> +		wa_bb->cs[wa_bb->len] = val;
> +
> +	wa_bb->len++;
> +}
> +
> +static ssize_t parse_hex(const char *line, u32 *pval)
> +{
> +	char numstr[12];
> +	const char *p;
> +	ssize_t numlen;
> +
> +	p = line + strspn(line, " \t");
> +	if (!*p || *p == '\n')
> +		return 0;
> +
> +	numlen = strcspn(p, " \t\n");
> +	if (!numlen || numlen >= sizeof(numstr) - 1)
> +		return -EINVAL;
> +
> +	memcpy(numstr, p, numlen);
> +	numstr[numlen] = '\0';
> +	p += numlen;
> +
> +	if (kstrtou32(numstr, 16, pval))
> +		return -EINVAL;
> +
> +	return p - line;
> +}
> +
> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> +			const struct engine_info **pinfo);
> +
> +/*
> + * Parse lines with the format
> + *
> + *	<engine-class> cmd <u32> <u32...>
> + *	<engine-class> reg <u32_addr> <u32_val>
> + *
> + * and optionally save them in @wa_bb[i].cs is non-NULL.
> + *
> + * Return the number of dwords parsed.
> + */
> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords = 0, ret;
> +	const char *p;
> +
> +	/*
> +	 * Each iteration consumes at least the engine class token if it doesn't
> +	 * error out, so the loop always makes progress without advancing @p.
> +	 */
> +	for (p = lines; *p;) {
> +		const struct engine_info *info = NULL;
> +		u32 val, val2;
> +
> +		/* Also allow empty lines */
> +		p += strspn(p, " \t\n");
> +		if (!*p)
> +			break;
> +
> +		ret = parse_engine(p, " \t\n", NULL, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		p += ret;
> +		p += strspn(p, " \t");
> +
> +		if (str_has_prefix(p, "cmd")) {
> +			for (p += strlen("cmd"); *p;) {
> +				ret = parse_hex(p, &val);
> +				if (ret < 0)
> +					return -EINVAL;
> +				if (!ret)
> +					break;
> +
> +				p += ret;
> +				dwords++;
> +				wa_bb_append(&wa_bb[info->engine_class], val);
> +			}
> +		} else if (str_has_prefix(p, "reg")) {
> +			p += strlen("reg");
> +			ret = parse_hex(p, &val);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			ret = parse_hex(p, &val2);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			dwords += 3;
> +			wa_bb_append(&wa_bb[info->engine_class],
> +				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
> +			wa_bb_append(&wa_bb[info->engine_class], val);
> +			wa_bb_append(&wa_bb[info->engine_class], val2);
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return dwords;
> +}
> +
> +static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> +			   struct xe_config_group_device *dev,
> +			   const char *page, size_t len)
> +{
> +	/* tmp_wa_bb must match wa_bb's size */
> +	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
> +	ssize_t count, class;
> +	u32 *tmp;
> +
> +	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
> +		return count;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * 2. Allocate a u32 array and set the pointers to the right positions
> +	 * according to the length of each class' wa_bb
> +	 */
> +	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	if (!count) {
> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		return len;
> +	}
> +
> +	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		tmp_wa_bb[class].cs = tmp + count;
> +		count += tmp_wa_bb[class].len;
> +		tmp_wa_bb[class].len = 0;
> +	}
> +
> +	/* 3. Parse wa_bb lines again, this time saving the values */
> +	count = parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0) {
> +		kfree(tmp);
> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		return count;
> +	}
> +
> +	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
> +
> +	return len;
> +}
> +
> +static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> +					const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +
> +	return wa_bb_store(dev->config.debug.ctx_restore_mid_bb, dev, data, sz);
> +}
> +
> +static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> +					 const char *data, size_t sz)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +
> +	return wa_bb_store(dev->config.debug.ctx_restore_post_bb, dev, data, sz);
> +}
> +
> +/**
> + * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Return: engine mask with allowed engines set in configfs
> + */
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	u64 engines_allowed;
> +
> +	if (!dev)
> +		return xe_configfs_device_defaults.debug.engines_allowed;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		engines_allowed = dev->config.debug.engines_allowed;
> +	config_group_put(&dev->group);
> +
> +	return engines_allowed;
> +}
> +
> +static ssize_t engines_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u64 mask = engine_info[i].mask;
> +
> +		if ((dev->debug.engines_allowed & mask) == mask) {
> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
> +		} else if (mask & dev->debug.engines_allowed) {
> +			u16 bit0 = __ffs64(mask), bit;
> +
> +			mask &= dev->debug.engines_allowed;
> +
> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> +					     bit - bit0);
> +		}
> +	}
> +
> +	return p - page;
> +}
> +
> +/*
> + * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> + * instance in @pattern.
> + *
> + * Examples of inputs:
> + * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> + * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> + *   mask == XE_HW_ENGINE_RCS_MASK
> + * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> + */
> +static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u8 instance;
> +		u16 bit;
> +
> +		if (!str_has_prefix(pattern, engine_info[i].cls))
> +			continue;
> +
> +		pattern += strlen(engine_info[i].cls);
> +		if (!mask)
> +			return *pattern ? NULL : &engine_info[i];
> +
> +		if (!strcmp(pattern, "*")) {
> +			*mask = engine_info[i].mask;
> +			return &engine_info[i];
> +		}
> +
> +		if (kstrtou8(pattern, 10, &instance))
> +			return NULL;
> +
> +		bit = __ffs64(engine_info[i].mask) + instance;
> +		if (bit >= fls64(engine_info[i].mask))
> +			return NULL;
> +
> +		*mask = BIT_ULL(bit);
> +		return &engine_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> +			const struct engine_info **pinfo)
> +{
> +	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> +	const struct engine_info *info;
> +	size_t len;
> +
> +	len = strcspn(s, end_chars);
> +	if (len >= sizeof(buf))
> +		return -EINVAL;
> +
> +	memcpy(buf, s, len);
> +	buf[len] = '\0';
> +
> +	info = lookup_engine_info(buf, mask);
> +	if (!info)
> +		return -ENOENT;
> +
> +	if (pinfo)
> +		*pinfo = info;
> +
> +	return len;
> +}
> +
> +static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> +				     size_t len)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +	ssize_t patternlen, p;
> +	u64 mask, val = 0;
> +
> +	for (p = 0; p < len; p += patternlen + 1) {
> +		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
> +		if (patternlen < 0)
> +			return -EINVAL;
> +
> +		val |= mask;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.engines_allowed = val;
> +
> +	return len;
> +}
> +
> +static u64 get_gt_types_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	u64 mask;
> +
> +	if (!dev)
> +		return xe_configfs_device_defaults.debug.gt_types_allowed;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		mask = dev->config.debug.gt_types_allowed;
> +	config_group_put(&dev->group);
> +
> +	return mask;
> +}
> +
> +/**
> + * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
> + * @pdev: pci device
> + *
> + * Return: True if primary GTs are enabled, false if they have been disabled via
> + *     configfs.
> + */
> +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
> +{
> +	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
> +}
> +
> +/**
> + * xe_configfs_media_gt_allowed - determine whether media GTs are supported
> + * @pdev: pci device
> + *
> + * Return: True if the media GTs are enabled, false if they have been disabled
> + *     via configfs.
> + */
> +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
> +{
> +	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
> +}
> +
> +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> +		if (dev->debug.gt_types_allowed & BIT_ULL(gt_types[i].type))
> +			p += sprintf(p, "%s\n", gt_types[i].name);
> +
> +	return p - page;
> +}
> +
> +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> +				      size_t len)
> +{
> +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +	u64 typemask = 0;
> +	char *p = buf;
> +
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	while (p) {
> +		char *typename = strsep(&p, ",\n");
> +		bool matched = false;
> +
> +		if (typename[0] == '\0')
> +			continue;
> +
> +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> +			if (strcmp(typename, gt_types[i].name) == 0) {
> +				typemask |= BIT(gt_types[i].type);
> +				matched = true;
> +				break;
> +			}
> +		}
> +
> +		if (!matched)
> +			return -EINVAL;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.gt_types_allowed = typemask;
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
> + * @pdev: pci device
> + *
> + * Return: true if multi-queue is enabled for this device (the default),
> + * false if it has been force-disabled via configfs.
> + */
> +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return xe_configfs_device_defaults.debug.enable_multi_queue;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.debug.enable_multi_queue;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
> +
> +	return sprintf(page, "%d\n", dev->debug.enable_multi_queue);
> +}
> +
> +static ssize_t enable_multi_queue_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.enable_multi_queue = val;
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> + * @pdev: pci device
> + *
> + * Return: enable_psmi setting in configfs
> + */
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return false;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.debug.enable_psmi;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +static ssize_t enable_psmi_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
> +
> +	return sprintf(page, "%d\n", dev->debug.enable_psmi);
> +}
> +
> +static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.enable_psmi = val;
> +
> +	return len;
> +}
> +
> +/**
> + * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
> + * @pdev: pci device
> + *
> + * Return: enable_vram_page_offline setting in configfs
> + */
> +bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return xe_configfs_device_defaults.debug.enable_vram_page_offline;
> +
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.debug.enable_vram_page_offline;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
> +static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
> +
> +	return sprintf(page, "%s\n", str_yes_no(dev->debug.enable_vram_page_offline));
> +}
> +
> +static ssize_t enable_vram_page_offline_store(struct config_item *item,
> +					      const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (xe_configfs_is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.debug.enable_vram_page_offline = val;
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR(, ctx_restore_mid_bb);
> +CONFIGFS_ATTR(, ctx_restore_post_bb);
> +CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, gt_types_allowed);
> +CONFIGFS_ATTR(, enable_multi_queue);
> +CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, enable_vram_page_offline);
> +
> +static struct configfs_attribute *xe_configfs_debug_attrs[] = {
> +	&attr_ctx_restore_mid_bb,
> +	&attr_ctx_restore_post_bb,
> +	&attr_engines_allowed,
> +	&attr_gt_types_allowed,
> +	&attr_enable_multi_queue,
> +	&attr_enable_psmi,
> +	&attr_enable_vram_page_offline,
> +	NULL,
> +};
> +
> +/*
> + * Per-parameter visibility predicates.
> + *
> + * XE_PARAM_VISIBLE_ALWAYS - attribute is always shown.
> + *
> + * These macros are only evaluated here, where the platform descriptor is
> + * reachable. xe_configfs_debug_params.h treats them as opaque tokens.
> + */
> +#define XE_PARAM_VISIBLE_ALWAYS(_item) \
> +	(true)
> +
> +static bool xe_configfs_debug_is_visible(struct config_item *item,
> +					 struct configfs_attribute *attr, int n)
> +{
> +	struct xe_config_group_device *dev;
> +
> +	if (attr == &attr_enable_vram_page_offline) {
> +		dev = xe_configfs_to_group_device(item->ci_parent);
> +
> +		return dev->desc->is_dgfx && dev->desc->platform == XE_CRESCENTISLAND;
> +	}
> +
> +	return true;
> +}
> +
> +static struct configfs_group_operations xe_configfs_debug_group_ops = {
> +	.is_visible	= xe_configfs_debug_is_visible,
> +};
>  
>  const struct config_item_type xe_configfs_debug_type = {
> +	.ct_attrs	= xe_configfs_debug_attrs,
> +	.ct_group_ops	= &xe_configfs_debug_group_ops,
>  	.ct_owner	= THIS_MODULE,
>  };
> +
> +/**
> + * xe_configfs_debug_release_config - release debug-specific config resources
> + * @config: xe config device structure
> + *
> + * Frees any memory allocated for debug configfs parameters.
> + */
> +void xe_configfs_debug_release_config(struct xe_config_device *config)
> +{
> +	kfree(config->debug.ctx_restore_mid_bb[0].cs);
> +	kfree(config->debug.ctx_restore_post_bb[0].cs);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
> index 5f938450aed2..5d0875d47a1f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> @@ -5,9 +5,49 @@
>  #ifndef _XE_CONFIGFS_DEBUG_H_
>  #define _XE_CONFIGFS_DEBUG_H_
>  
> +#include <linux/types.h>
> +
> +#include "xe_hw_engine_types.h"
> +
> +struct pci_dev;
> +struct xe_config_device;
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
> -struct config_item_type;
>  extern const struct config_item_type xe_configfs_debug_type;
> +void xe_configfs_debug_release_config(struct xe_config_device *config);
> +ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +					   enum xe_engine_class class,
> +					   u32 *cs, size_t max_len);
> +ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					    enum xe_engine_class class,
> +					    u32 *cs, size_t max_len);
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> +bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> +bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> +bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
> +#else
> +/*
> + * Callers gate these accesses on CONFIG_DRM_XE_DEBUG, so when that's
> + * disabled the returned defaults are dead code. When CONFIG_DRM_XE_DEBUG=y
> + * but CONFIG_CONFIGFS_FS=n there is no configfs group to consult, so the
> + * defaults below are used for real to keep debug knobs functional (at
> + * their default values) even without configfs support.
> + */
> +static inline void xe_configfs_debug_release_config(struct xe_config_device *config) { }
> +static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +							 enum xe_engine_class class,
> +							 u32 *cs, size_t max_len) { return 0; }
> +static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +							  enum xe_engine_class class,
> +							  u32 *cs, size_t max_len) { return 0; }
> +static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> +static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev) { return true; }
>  #endif
>  
>  #endif /* _XE_CONFIGFS_DEBUG_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
> index 3a9ab40d519b..72f97dcad8f4 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> @@ -32,15 +32,19 @@ struct xe_config_group_device {
>  	 * type, entries are sorted alphabetically.
>  	 */
>  	struct xe_config_device {
> -		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> -		u64 engines_allowed;
> -		u64 gt_types_allowed;
>  		u32 migrate_ulls_period_ms;
>  		u8 survivability_mode;
> -		bool enable_multi_queue;
> -		bool enable_psmi;
> -		bool enable_vram_page_offline;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +		struct {
> +			struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> +			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> +			u64 engines_allowed;
> +			u64 gt_types_allowed;
> +			bool enable_multi_queue;
> +			bool enable_psmi;
> +			bool enable_vram_page_offline;
> +		} debug;
> +#endif
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3ab4cb9e4964..c0398789081a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -19,6 +19,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 43a2951a66d6..f5ca687e847d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -17,6 +17,7 @@
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
>  #include "xe_gt_mcr.h"
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 265f95c0c899..62a080f6fa23 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -18,6 +18,7 @@
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f751687dc568..70494c4b5deb 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -19,6 +19,7 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 57c6f778ca24..18fa9d4f2f6d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -19,6 +19,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
> index 899b01f72ba3..59af3d145418 100644
> --- a/drivers/gpu/drm/xe/xe_psmi.c
> +++ b/drivers/gpu/drm/xe/xe_psmi.c
> @@ -8,6 +8,7 @@
>  #include "xe_bo.h"
>  #include "xe_device_types.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_psmi.h"
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ce9b57b3eede..1336c0aff6b9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_debugfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_ras.h"
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 6a8d6ea68f25..62068189320f 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -10,6 +10,7 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
> -- 
> 2.43.0
> 
