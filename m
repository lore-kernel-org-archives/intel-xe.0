Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09EF606A327
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QP8roaIj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEB810E59B;
	Thu, 12 Nov 2026 09:08:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DC110E59B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794474521; x=1826010521;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Kw/Q7W9Nwff2xRcXTAH05k6fvBcQO0Wi2JuorxAXPJI=;
 b=QP8roaIjKhGjadv+mQYjc3ZHZEEE0i5tJ3umTmYzTxLaOnhLmK0Nsewm
 Om/7qzRleGDeAKtGCeyZvPj9lnkPQBUK8NiSAWsG+qKpuzFYrnqaXlmrn
 Vt/077U2sEjSttYSEDI++UTyS1g80WX0sinRYa//39dom23asZC8NZlAe
 kM3sPQ2bukX37jIS/Ca6xAa2cW0I5WAeFQL5++zrGSUhDi3FF4/69DtKe
 GjNhJHiIc0qkjQ8/jOMCJQV1xOlzLsFD+GCFTjV1ngl/Y4E2+2TWJ81XJ
 pV7UbCqLJxQqdaeURzTPv9viKFUkoMAilINXaLnDD0KLvJCr4KEzjdFBI Q==;
X-CSE-ConnectionGUID: qmVqb/swRLO1it6jB2diGw==
X-CSE-MsgGUID: QjamGYT3R6K8R5BGHcycKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3288098"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3288098"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:08:41 -0800
X-CSE-ConnectionGUID: GVqW4IwBTlO+5/ot9eCCdw==
X-CSE-MsgGUID: u/CM5Yu+QzuJjAuN4kEhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8952455"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:08:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:08:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 01:08:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI3FZ0tXEPCeG2D1MiQATDn7B9FriGc/uCNvSkN7YwCgnxJB247gb/ppEIusi+y2b5AEKlAI3lH92lzv6JZwifhmxaNS4IpcsfZykvwiBG8+tIBlrW0ozmGKfqxkHRDPuAH+Fb7fqsbmwECaGdvUJYNEgP6LNmGLlxSHn3SIf2J3wEF4SBPX6Fvw11zgLYZUHBUNUodHsn4Tew+lGKbLKpVMjQzSLKzkOuSSYMf2imxEXZ/v3XyVnPBuXtNXxLC4AbE01MWD/9AEMXoZ4NDYnh/Db2FM6vnBKqNwqBof76sG4dUJJ6M2SYqRb5ZGRMbDLZMHl9QCI4V0MAyfnPuZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+xHVwNFj8v6OtbuBVnnDRVR4llISzSt5nt1Sxz5xlc=;
 b=Tb1FmHgWdHGzB/+D4lsj4qww38US4FStPaYLYrSwWW/6pDidXfVrTGZaaI26/GAGCkbC1ID0uWiBfJQqEqmSo4GBCWftlG3F+VDaRDVc0/P+aCFKSOWx81YQIA6IQQrYBEcdvKEhj5DBnSNXqud6Jz9WtJHs48k3EEaNFnWKwoF+b5/sRXnlmXLVOh2Fkm5jgFoEVCvFvejmTTILbps+Oyfqw7L6WubKn4hvIGupLWFebIDC7mmMytYEiW0mfm9RXoscl8OnSth56V/oE+JNsO/6XgPDvw+nLYHMXfCiyJNlt/MKbXFGk8t2a8yzy2izl2ScF0ZTuEY135l4WwjPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:08:27 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 09:08:26 +0000
Date: Thu, 12 Nov 2026 14:38:19 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Ranu Maurya <ranu.maurya@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/cri: Add new PCI IDs
Message-ID: <avWCA-yYN4ZWVHjP@bvivekan-mobl1>
References: <20261111055020.866766-1-ranu.maurya@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20261111055020.866766-1-ranu.maurya@intel.com>
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2d065d-4c8b-414d-a1a8-08df409c8293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|261009223027099003|56012099006|261021123027099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: DKriKP9125e6yHz12R4jvMX++Ai4rQQJzS4Jdzwn0xIEeoFaQSOER5866M+8Sl0FDXH2wbsVBIwHuZTzPcp2Oju44hznxdMGXoZVRa0iyYsPc8vfTJ7pLGFrvy7/ccVgkioug0oZMyUw88cljT/lYcuxAVqiVkbCCUzbs4oQ2A40CIiWxC+bB3qdiYhztTGJAzm0nvH8nK/6P08WObJf73mBRAV8GBj+rWZxhA0YIHWIt5+Y9bEjkGwaxM/83cgfel/793MnVJRib/T5bIihwXuvD+aoHAWhrF+coWjvYEpZRwa5xDat0s8GvWK7Zj9/6IrOMGKPbV7Fs2WlZDOEGuY7AN8JM33Z04paUHYoRvrB9VaEzdU6KLQqTJ0RjZrFEEUD2YX8el4zJTbvhv0bRcNtS+p7pV2wmSGoTqKqpPBQmS5I/A0scAzlJXU+Hx7PP8zzV6yhv510cZg4WezW9u52EptZI9P0Z9NiQZ/vsvQmKrkvKpEmhJwujwmA5FwPybxqttLcBJE1zdoFyfUgHUgV7S9elDwVFgXYMkxgU2hhzjBVmOoKRrLE4kBMqe5gMjfZMP546uQbNBHmRz+oS74D8pgWgdscg/zI23TPg2FN11if0B+ZufjoJFkHHQVgh4pPWmAblR8jML8z4dg8HHrNtQrHkA03npoDeG1dJvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVUcmhsbmk2VmNQL1ZIa2YyNkdqTHYzMjY5bVJqaTZJSzd4UXV5bnVqUGNS?=
 =?utf-8?B?U2dBWjdYSEZ5dnpXQVRtRE5XODhWV3pXREhqUjh6MzBhaDRuTzhsZlJkL2Yx?=
 =?utf-8?B?WGhQb2I2Q2NHYlMrTWZ2cmQyK0oyQWRqbndoUWh1ZnVNM0c5bmlYa2ZvWFdI?=
 =?utf-8?B?cHMxcDZsVTJlSDEzVzZWc2FDUnMrVDRKUjZuUVhEUnFiMGVLU2J5UTZBWWp5?=
 =?utf-8?B?YlRBcUVPWUtpTUlrU2U5ZGxvRFhlMHg4Nm8zeTN4cXg3bTlsMGkrRGQwd2RO?=
 =?utf-8?B?dGRzTkNiQlM4ckp4cFZmUVZGUkU2UytVUHBrdkVadHl6QzJHZE5iSHoxUDJE?=
 =?utf-8?B?YUpPQW0rTkxjdTJhK1pKLyswdmYzUmZBM0pHb0t1cjd0cnBjaWZ5R3paQ3gx?=
 =?utf-8?B?cjRTVGVTNncxNzRUZkpiNTJ6V1htdDJZUHVOYnBNbkdZZUQwRUZ4enFEU2ZO?=
 =?utf-8?B?UEFNemRvZXBQaFd3VThWSFlzVnNPMVlVZTc4d2MrcE83WGppa1p5NFpLaGI5?=
 =?utf-8?B?Nm1YS2hoRk50TXdvZ1ljWkJReGlZSzgxeHhjaVJrZkJlSnl5eTBaRzh0RmU3?=
 =?utf-8?B?Uzdud2lqdm54Kzc1NmNkbEpuUkdHOUw5WEJFblE4Yk51NFpIQ2oxTGdRVGM5?=
 =?utf-8?B?aER2SzU2ZE1iQ0F4VVFwTXRrQnpyNmFQcEpJbm5kU2g3R25CV0lMQkE2dEpi?=
 =?utf-8?B?aXA1RElvT1E4RjdVQVU0LzNzMlZaaWNxR2Z5Tm0zb1RBM2FiNWQxcmtmcnJr?=
 =?utf-8?B?anRBTGZJc01JWDAwQ0JhdmxSQ1ZsdlA1YmpYWDlKOHJuSkNMOGJrUXJ0d1hk?=
 =?utf-8?B?RCtwa0NqeTFRakcvZTdyZTVXd2hva3ZmUXNCWVVuVnprT04ranFGMjFIL2Z0?=
 =?utf-8?B?TWp4VVllcUFha25ZU2wrendyYlRiaTFRdlhVVnF1VlkyNGcvVmwwUUI4MFFB?=
 =?utf-8?B?NFUvYnM4YWtSOHRXd1VFRXFWSlQxS3pybjM3dEEvdkQwUXZFazBScUlqaFAx?=
 =?utf-8?B?SmFPQVNiRGxNR0N5UUFTUm55bE91MDNjZlBENjB0ZnBRcDVyYkdicjk2YmU5?=
 =?utf-8?B?NklJeXg0di9LWGNnSFB2bnVUR1Jsc3BXVnFQbnhoL2FFRDVaR0pxcFM2TUY0?=
 =?utf-8?B?QmJpWFVrbDkwQnFodkJUQXJvSzNoVG56ZVBBcVRncWd1di9SSU9ZTkd1ZlNB?=
 =?utf-8?B?Zyt4TWx6WTZIMkdpRmFpaXJ1WHBXQmxDaHVPUDE0d0Jsc29ZOFRCak4yVUJF?=
 =?utf-8?B?aTVta0lzVWV6YWtpM3RmQmtRYkRkL2hxTmN0NWR4ZmppenVUQXRMaFY3bXJF?=
 =?utf-8?B?SldjczI0bitXOXRwd09MdkRTaC9OdmhyRmI4N05GSVI5WEVhVkhJTkF3Yzgv?=
 =?utf-8?B?ZjBNdmJFdGc1NlBUei9IUndyMjluNFFEQjZZVU9SK1pGZml3cE15N1pjdmlK?=
 =?utf-8?B?Y29ONDRXMjlBR3ZscFpQOGdzRjZxRi9sQnJzRFlKVU4rUDkxeCtkbFkrWnMr?=
 =?utf-8?B?bFJkNVlMNHpSZVFmenQzVzJjdDBPY1doSEdQckJ1QXN1YjE2TDBIVnB6TXFM?=
 =?utf-8?B?c2crQWpuL0hEVDVBd1h3VElwVkdOc0lmRERjdjBORHpEZFNsQXY3bVEyejVE?=
 =?utf-8?B?WUlEOXRYNllVOWt1Y2RPVmtKcmJaWWlBMFZUN1VjSlhCak0wbWs1VndUWEpP?=
 =?utf-8?B?R0JkSDJKQVliLzVJRFJpRzI3bWNXSUhUVnh4Zmg4Tk9mWUdWb2twc3gwNU81?=
 =?utf-8?B?eFRIN2NMeUpkVFUxeURZTGZEbXpDRTMxS1FseEs4ek15cERrc2tXNkhPTXdW?=
 =?utf-8?B?WHZONkhETmtzWnR1Ym1SdnY2akxnTGtJeXlyZCtBbks1WmFpWWNoTzY5MHR2?=
 =?utf-8?B?TVM4MVJnbUFwNGFEaTZoRGZlbGlWL3NNTXYvZEY1cDdkQ0hEeG4veTNRclVI?=
 =?utf-8?B?Y1JmWWV2ZUUwWVc4VE0vdTZISStFeW1ES05iRkk1YkFuOTh2Q1M0UDBONUFS?=
 =?utf-8?B?d29OYUNTVit3K2N3U0U3em5MaUs3cHZvMVBDdXpyVmgwVTg2S1JLelEyalF2?=
 =?utf-8?B?UWdDMmZPREtFdlFFM0FGU0E3WlRTOXhVa3RsVUgySTQvUlRBK3pZNmtJeGMy?=
 =?utf-8?B?RndJeUwyRzN4Nmk0TDVMN1pWU0R5OGFRTWlaekRvNGRvRlozdFh5S3lIWTJ5?=
 =?utf-8?B?OTJXOHkxbXRWTWl6Mk1jYnR6NDhEYUZNMXRjNHg3SDI3czZzRlN6L0hZdVVv?=
 =?utf-8?B?MStBQXp4eWdjekxWUXpwYS8wQXlRWUdpRkJBL0Z2WHBycDJRNUpvQW45cnhn?=
 =?utf-8?B?TkJRazRoZkt3MlZ5eUdYVDZ6a2l2NWlKdFJnbkVVVWphT2svcTRVcEhVWDMz?=
 =?utf-8?Q?/FE4fXzjXm/+YxiDSa7/QabD9DVku6uHhdF0I?=
X-Exchange-RoutingPolicyChecked: gIrd+3Ju3AwHkN0PVkMY0NdWXRgHitjPq2IIgBxpeZZFMT6b0TUQbxQvLdH+xWfnjbVTaHyA6bp6F2Is90irx1JgH/dqdvy7TrAhAZa/c2BAID4mJkq9Azf0Zm4nEWi9rXioGJEI63ZY9vE/F377LdeMKl19kizbh2qqg782/fbP1edg7XmpIfbMlzWb7EIZJeBv5ltGv6WWlPMP+mX8jduhsUEDBr5XLyPZvzV/ht/+yOMDUpWzVeg01KBXk+tvjYIMSQvYN7hiIywBotTCINHehI3VX2BkxreGO+oqWR0T/ycJ3/8oqn0OQK6z5NJD697de1EoZFAlozqt0jFRGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2d065d-4c8b-414d-a1a8-08df409c8293
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:08:26.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: di7cEiKUw+KKW1aB0+eT8YSDZ+//gsrsOwuSnebZLmTS/8HQiqAZeiMUcuby2FaaC+RKcLiaK1ZltRqcU0yrLmDg94QxsVSVRzp3wQppAtcnkLSqFUFId5Lg5G9gzcHi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 11:20, Ranu Maurya wrote:
> Add new CRI PCI IDs 0x6753, 0x6754, 0x6755 and 0x6756.
> 
> Bspec: 77979
> Signed-off-by: Ranu Maurya <ranu.maurya@intel.com>
> ---
>  include/drm/intel/pciids.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index ac858ed26df2..ab02bef262f1 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -906,7 +906,11 @@
>  	MACRO__(0x674F, ## __VA_ARGS__), \
>  	MACRO__(0x6750, ## __VA_ARGS__), \
>  	MACRO__(0x6751, ## __VA_ARGS__), \
> -	MACRO__(0x6752, ## __VA_ARGS__)
> +	MACRO__(0x6752, ## __VA_ARGS__), \
> +	MACRO__(0x6753, ## __VA_ARGS__), \
> +	MACRO__(0x6754, ## __VA_ARGS__), \
> +	MACRO__(0x6755, ## __VA_ARGS__), \
> +	MACRO__(0x6756, ## __VA_ARGS__)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
>  
>  /* NVL-P */
>  #define INTEL_NVLP_IDS(MACRO__, ...) \
> -- 
> 2.34.1
> 
