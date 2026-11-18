Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB0606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvDGhWLk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=F6L+9yW4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4598B10EC2C;
	Wed, 18 Nov 2026 09:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965CB10E0C3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794993295; x=1826529295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=GTxWlKAgIV4MxjG5/cveoVahpQOgjnBgkaOCuJCEUiU=;
 b=kvDGhWLk0aVwYvC1okVdeBMljMpD0On06nxBgyWy/BUXkIm089UKg88h
 45qBCuRIWY72QaZlnSkJw0ljWE47IpDuTgQbljd23gK+u/2s/Jnv64Md0
 b7S2lHwkLIUhhW6C0nnwJthv9lm7i6HugTpCXZb/XhFpt7Uff7m7lDus3
 y5h4bSXT8oFGoo/4cnnKIlNl+jFyALdJnLz8tgLix8WKg7BvuW8zdIO8V
 01mrS8VZ31Jj9Phi73sBQ40KeGeXV3lPotsYvia0Fq7h/NDY2qDga7ALt
 S5jrtjDU0Sn2R+0vCUtY9swbMNs2kClbdS5wmKCmX2l7fFjmO9AtjhZDK w==;
X-CSE-ConnectionGUID: 1RuPylsXS4aOAkvTqjdR4g==
X-CSE-MsgGUID: ZJXtN789TQORsOufebKRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3811084"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3811084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:14:55 -0800
X-CSE-ConnectionGUID: fTMaS3eIT4SI8q0ELhDVcw==
X-CSE-MsgGUID: rMLLXG4uQxaEMuLuF21bfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="10498806"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:14:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:14:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 01:14:53 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:14:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8b13ri/H0jKsOvUBPK6msEytD/t9RGl1OVHO/zfI65la+pvrGoRoy8WZfdqvPT3VDfPv69Us2kJn82F66aIbBB8q3HYzWWv5TkMSbFACeIjYWqE2GPl+c3mYYiVRALFFxI7j3G6WrCqsAhNonJOMhcS9o4ePNfBMQO6vTTkuam6BVuS3OHMIh57Rv6fY+nOJGbkf/V8sXCK6QclUWTHjctgLR0rXkKQk91nrPQYnOqduuLj2rj9D3sERDETlMouLcSexo/V63BHwa0N0s3kfxRWSeWyfNsd/jFDrjbmKLBeDeo9ISo7kBZ2C2T8a0KvBuQMMzJwTJ+51vF3041hrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWyyP/a24Ul7tsmG43hyYxnbRnU9GxFAzD47hDr2yIw=;
 b=L171JhBvzUa4VNrbGBjmB0DjH99ZrPjedsR4aruxeEbYslMN3i/AsDwBT7/h6x+nt8vJQPoFVl/vzld9CjjpKqxitpNetp0Bv/8unJ1ONkRFFAG5+wmBd/WigMoY1LixwsB+RovNMNdCuWrDHHShi+MD3E6NXh7gvfEFcgXDOXF8iUu8H56d5BziQwwM/GKBfCh3RqA8to9P1DNQvUolwJcDicONb4K45iFQ8Q4gl5J/zkreZkB7rc8FRpz8Fhedn8SQYP9OPr/swx2psbQQ/TcFAe4Ed4rRDMf4KtHtixZmuiUYSmQwfRu/Pcim2eZ/dc9e6Qtbi2PxandVX8TtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWyyP/a24Ul7tsmG43hyYxnbRnU9GxFAzD47hDr2yIw=;
 b=F6L+9yW4YZogcnldXCgSzHh/Bv4F2cfHq12pTqao2K7iVn/yrR+8YNHXf2KeXbK00K6mI2j+eLrk/vt86GQlIDKwvG7s+kHRKawEM722zJkt5eyyWx0m+ZPW0Tj48UosRIEv1u2KuwLda03658OqhPT/VeWEebuC3vrSM3XHtuc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS3PR11MB9794.namprd11.prod.outlook.com (2603:10b6:8:363::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:14:45 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:14:45 +0000
Content-Type: multipart/alternative;
 boundary="------------cpXoIXP0GBYYWtBcG8PlVNDn"
Message-ID: <d10b53db-a1ca-4e6a-b5ce-9040e6e29b45@intel.com>
Date: Wed, 18 Nov 2026 14:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261117125904.2877468-2-sk.anirban@intel.com>
X-ClientProxiedBy: MA5P287CA0247.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS3PR11MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6327bffb-ef17-4b1d-e28c-08df455462f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|261009223027099003|261009221227099003|8096899003|22082099003|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261022113327099003|261021121427099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: LbIN9mPptQtwcXrrUWsPNA+1W8rC57y1ANAwgkZks8K3fONWER7465RL/+S/3clyEsQwFTzlU9MrQYrnn5FD2e7Skjd7PnL7Jp0PCyGVjIuStc43LpG94bm2PE0qLVoqe/N4NYTw4kVXGOTpI4PSXTmiATeeZeMqzi6aW9OkYK2gwi7bUdDIC8ILslIjBPmG8R/T70DMmniT6hYQ8NPty5ZewIYoWd22dfuI/dB1W7NDXYsrlG8O4ZiUTJZQYkh24ZNmK2dJa3xumfuGUmyjwGogaYshhglG0zY1sHfw+dm2h5glrG9LBpMH91k5mL4pAcxXrJEJvZvQQiSc+H0TlspbZ/WwQz1eVoRdzPKjdJAeMcQGE7X8TWypBDxr54IGp0hmh6C9MM5lxhPaLSdyyAH56NPSLBaxRZovpG3fHa6inHhm4sxHtTWN28vLv6EL4aioOmIjjhM16S+R6dt8Xtfp6FNjDOW5843gpN2nK4nF4Yl06o9UmSWmE5TqKYUKN6VsAaf/wol61z3STUEMWnDdTL1HzqcLVNjayGo0inI8F0+TWtiaVRRo5LUWPEpKOYj+Pme16+6u94nPik7wDmaaOG2c6y9njpHpXCEpb4D09Y3CgHVIu07wyIqLubKdLWwTsExrnmLsd5hXLgZPOLYauZYX/TsgHFqEXyezKRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(261009223027099003)(261009221227099003)(8096899003)(22082099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022113327099003)(261021121427099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3d6clpJTzFqaE94ZlVnaWJBOS95TENOZTJKYi8rVm9VQmFTTjMrYURVTXh4?=
 =?utf-8?B?V25wbnN1Wi9UMHRVaVBkZ3BvYUFYbEhLdGw2T1N5dnNlWE9DdHJUVFNlQnll?=
 =?utf-8?B?T2wwQUM0aktXWHNuWVJXaFZGdXJEbnlaQTl1UTU0YlpSR3krY2xERy9Cd1B5?=
 =?utf-8?B?WmZ1YUNkTjFsd2h6RS9ZaWh1VW05bk5pa3QwRUg5RmwzM3ZtS0hnZFY1V29R?=
 =?utf-8?B?d3FMWk44Q3NMRTE3V0F1MzU1K2FxZWFMZjJ3clNOMWdvSHlaZUNDdHFxTEln?=
 =?utf-8?B?ZVVoaFZ6UGV3VVBvZThzMElLNzVDTjk0eEppbEhRS25FSjNOeTdRZkwzRlJu?=
 =?utf-8?B?bVRPMTJIRVY2WHZySHY1QXRqTUE3VHh3MDVZOFJDVTJDUW90SHFFdDk1WnNE?=
 =?utf-8?B?eDBYdGhFZmFPVUR1MFJvbjRGUGFxNHpYcTh5RVpCQXg0M2tHR2xNdjNjRVhn?=
 =?utf-8?B?dWxLcGt5N1JKVGlXTFpJRkl2djNDc2JKa3ZNUGlTUmwzOFA5WHg5UFlYWUZY?=
 =?utf-8?B?NC9SZkc2TVdBSEk3UEs0ZzE3Ym9qQUZXa0wvRlpIelFZNDJWOFNiNWZtRGdS?=
 =?utf-8?B?YjFvNFBpbjZjWHpteW5Wc3ZUbzFNeDVYRjZPNExnYjVFRE51c3lpZzZNREdW?=
 =?utf-8?B?Tk5kL0cxTE1ieTFNTUNmb0M2TEhvRHBhMHplYkxBa2wyWElLbWNZNVVmWjEv?=
 =?utf-8?B?aGZJYXU1R3NCQVRmOXJ2SW9PWlRpR1RVTHhvdTlpQ3FWdS9yNjdLTDZYSzND?=
 =?utf-8?B?TFdPTnNXYzNRTHRvT1g2M0lEZUo2NmhzbTlGQ0wza2JJc1o3WmZybXRNMWNa?=
 =?utf-8?B?cTVLenhDTjJMdTJZeW1BSDdndjluZXBnY1h1Z2EzSkZtQmtUOGhodkhiNkRV?=
 =?utf-8?B?MDI4Y0R2Zm92ZmNLQS9qQXpVR1ZPVkhOMVNkR1UwUnJ1em9wTFNTbzlSRzBm?=
 =?utf-8?B?WExJeSsvdkpCZjZleGM3T2haZldVVmxVOWFnWERrbjR5RVhlRE1FY2NqUHBR?=
 =?utf-8?B?MmdsNU9rK2IwQkxmS0RhaSt5ZTQwdGpxM2QxYlN6YTNpYk1MYy9wOUxjSGxk?=
 =?utf-8?B?WkgrNzhWNXd0VGVPekNUYW9Rd0NGMFk5anZ5RWNsTEgyTTNDbnZxUTA4Vzc5?=
 =?utf-8?B?bUJKWEV0aWVOdkkrQm8zeUFJOFVFek1vclJud05kbEErbUphUkowUHdhMVRW?=
 =?utf-8?B?TURuR3dhZkJ0amJlL0J1MXFscE9FVlpjc0syUDhkYkdaUGNuYTNtZ1pGTzdk?=
 =?utf-8?B?LzFDaGc3cmxBa2lsajVWamp1bnVjRmR3S3hGSzVDZkVVbFRLNjNNZDk3Nkxl?=
 =?utf-8?B?WkRCdyt2dEJZQUlKZHk3V1I3SEVKazM0dkVPS2tQQnJUT3dNVjBpdXlnSnZs?=
 =?utf-8?B?VDIvWGRObk1nZjF5YUNkUXBpRGdGSmJtVFh2Nmx0YlEyd2VGRFNYaUFieVJj?=
 =?utf-8?B?RldibmdhNzNBS2tTeWVoLzYxK3d0Rkw0WXBjcG01QjUzbTNkb29MN0x4NUZy?=
 =?utf-8?B?TTYrMWJGdmtsWU9NdUpBZXg1dURJdVJLWXgwQ0xMYmZBZXNJRlVCRWdFOGhN?=
 =?utf-8?B?bFh6VGFUOVM4TUtPUm5aczI5KzkreXZDSjZxbzFsQm1uajJhby9jUk9QOVJp?=
 =?utf-8?B?WXI3QS9FeHUrRjRpWnpBbUZJQ1VqdWNBN2IyWG1zNGtJWHgvblc3Sm1KbDlW?=
 =?utf-8?B?YkY5L2F0QVhMNW00VUZaQnptMmYrRmJGcXFkNTM4ZWpoemx6bG5aOEtMNjdL?=
 =?utf-8?B?R29CYkp1ZlRXc1BkbVV5Nlk2L3k0Sy9DNUxKYURhVmRvQzFRTWh4NWFOSWlz?=
 =?utf-8?B?L1cvbmJFNjExaTFYN09BUmNiaHoxY3hvcGlLV3BXcmNDbkxuVnZXZmpYdUs0?=
 =?utf-8?B?MUJpNDVlZkR5OGRSbmdqUzNKemw1WXN6SmFsd1hIN2Q5b1djTFV3cTBxT0Qr?=
 =?utf-8?B?QUZ6NUcycnlaR0YvTGFReFVKc2NSUjRscHBiTjc2ZXk5ZzdSZXFHbnkrMTIz?=
 =?utf-8?B?MDhzL0FOcFgvbFVOK29hVE1jWlZ2ZXcwZEU5VUtYVnMwaWFqS3kycnkrS1Bw?=
 =?utf-8?B?c01GYWRQTGpNT25QQjZVbDh5UE9Eb2dJQnp6WmxxTC9wOEFwOFYyc24zSEwv?=
 =?utf-8?B?OUpZTktPTWF5alBWR3NEalVuQTl0dmJLZ0UxeVN5ZzZaWmN4eVBzNzBXM21B?=
 =?utf-8?B?TFJhTFo3MU90dWl1cXVqNXRYNUp6UitEVjM3WTBjaFlYVDlvLzdPWHZBL3Iz?=
 =?utf-8?B?MnJObUt6dXVzMmc1amF5RnNiZy9BWmszVUd4dURDU3dUWEdOdWpvT01CTzJa?=
 =?utf-8?B?VjF2cVhJb1o4UmpjTGlKY2VYQlZDNTk2RjgyQ2U5YktLWldzaitVQT09?=
X-Exchange-RoutingPolicyChecked: 1mWo4NCi+TG0gn9nDNtzd5DmCOKVoMdZR2+2MJ11SFybc3706SiVb7V5tfnN1KKjvT4/zWfoO8RmMe/yh64Ey51dI67aQBewKf6jhVoYraUa+uScV2m/gQ5La8HTCEEa7VtC4e9e4jI0BtTPii8ycvETR+vrY8ivyCg1UMn7WZ4a2LcfR46H+C6Jg1vtteHkPThLrgMgqnY+wQpxA2lFKB34q4u0gWjRaNsnZKVRTaStaM5oH6hyxbR2B96Uwzcd7exkIj84qmZpfFbehyEh+ICPPJMS3r9u51QC6H78PUbYT5AiIufnnVM+4vwc7ZHUhwnOCcP3S0mhSemUWGjrww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6327bffb-ef17-4b1d-e28c-08df455462f1
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:14:45.0372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8f0CBtR2g8cdSE7qHhbwz35pnTfJh+1WfE9QYmd7uhSckp88eFyyiTSJz7KTXk1q7b1XTfKvIiRy+n8Mbda1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9794
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

--------------cpXoIXP0GBYYWtBcG8PlVNDn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17-11-2026 18:29, Sk Anirban wrote:
> Late binding currently uploads OCODE without checking what is already
> running. Before the upload, check whether OCODE is initialized and
> compare its version with the payload's. Skip the push when they
> match.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 31 ++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 355d7c841871..4b8c48871d8c 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_late_bind *late_bind)
>   	}
>   }
>   
> +static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
> +	u16 running_ver;
> +	int ret;
> +
> +	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
> +		return false;
> +
> +	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
> +		return false;
> +
> +	ret = xe_sysctrl_sdk_api_version(xe, &running_ver);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "Failed to get running OCODE SDK API version: %pe\n",
> +			ERR_PTR(ret));
> +		return false;
> +	}
> +
> +	drm_dbg(&xe->drm, "OCODE SDK API version running %u, payload %u\n",
> +		running_ver, lbfw->sdk_api_version);
> +
> +	return running_ver == lbfw->sdk_api_version;

|sdk_api_version|is not the OCode firmware version. Please compare the 
running version with all four |lb_fw->version| fields.

Thanks,
Badal

> +}
> +
>   static void xe_late_bind_work(struct work_struct *work)
>   {
>   	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> @@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *work)
>   
>   	xe_device_assert_mem_access(xe);
>   
> +	if (xe_late_bind_ocode_is_current(lbfw)) {
> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
>   	/* we can queue this before the component is bound */
>   	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>   		if (late_bind->component.ops)
--------------cpXoIXP0GBYYWtBcG8PlVNDn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-11-2026 18:29, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261117125904.2877468-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Late binding currently uploads OCODE without checking what is already
running. Before the upload, check whether OCODE is initialized and
compare its version with the payload's. Skip the push when they
match.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 355d7c841871..4b8c48871d8c 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_late_bind *late_bind)
 	}
 }
 
+static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
+	u16 running_ver;
+	int ret;
+
+	if (lbfw-&gt;type != INTEL_LB_TYPE_OCODE || !xe-&gt;info.has_sysctrl)
+		return false;
+
+	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
+		return false;
+
+	ret = xe_sysctrl_sdk_api_version(xe, &amp;running_ver);
+	if (ret) {
+		drm_dbg(&amp;xe-&gt;drm, &quot;Failed to get running OCODE SDK API version: %pe\n&quot;,
+			ERR_PTR(ret));
+		return false;
+	}
+
+	drm_dbg(&amp;xe-&gt;drm, &quot;OCODE SDK API version running %u, payload %u\n&quot;,
+		running_ver, lbfw-&gt;sdk_api_version);
+
+	return running_ver == lbfw-&gt;sdk_api_version;</pre>
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
      <div style="font-style: normal; font-weight: 400; line-height: 20px;"><font size="4"><code>sdk_api_version</code><font face="monospace">
            is not the OCode firmware version. Please compare the
            running version with all four <code>lb_fw-&gt;version</code>
            fields.</font></font></div>
      <div style="font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace" size="4"><br>
        </font></div>
      <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace" size="4">Thanks,<br>
          Badal</font></div>
      <br>
    </p>
    <blockquote type="cite" cite="mid:20261117125904.2877468-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 static void xe_late_bind_work(struct work_struct *work)
 {
 	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
@@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *work)
 
 	xe_device_assert_mem_access(xe);
 
+	if (xe_late_bind_ocode_is_current(lbfw)) {
+		drm_dbg(&amp;xe-&gt;drm, &quot;%s firmware already loaded, skipping\n&quot;,
+			fw_id_to_name[lbfw-&gt;id]);
+		goto out;
+	}
+
 	/* we can queue this before the component is bound */
 	for (slept = 0; slept &lt; LB_INIT_TIMEOUT_MS; slept += 100) {
 		if (late_bind-&gt;component.ops)
</pre>
    </blockquote>
  </body>
</html>

--------------cpXoIXP0GBYYWtBcG8PlVNDn--
