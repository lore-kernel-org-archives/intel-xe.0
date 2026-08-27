Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA00C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 15:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE9F10F0C2;
	Thu, 27 Aug 2026 15:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdr9tUtz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FA10F0C0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787842846; x=1819378846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a0FFN5diuZK8KC7qJO5Z1kQVwcOj7TO1z3fZ4AiaHPE=;
 b=bdr9tUtz/CB9g4gQnh1MLL6s64pj71aEEwul8reyLFE5gkrGTTA6xfgf
 51J4qRWQ6OUgzrYUzhsHnYTsDerQpkEpFaW/ZQ2crLjzGeC4dHmZbYHBb
 H14ygX2bZPcAHuFU639h2fwSvdLKyQhTtzyJ47h9ac6yAHAD/B+Ki9DLh
 MMI+UDYUBGlN0fMoTYmXBwRlU8abZEcNxm+FCc/TSqNNmRMAM+9a1mpIz
 nGyzrfT9KetMYyDh28RgrRXs/XenxOARsOfRs3/6B6HYgnBkDAqO/W14A
 pFvlyug7ZZjIGl+ynkrUcwlGb4naDzY4EiKjvuvTrhFcxfQS6gIaDUSac A==;
X-CSE-ConnectionGUID: 2fwzaJTeR/ezU4dWN7dd4A==
X-CSE-MsgGUID: JSuoS5v9RZOu17p9Qele6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88264206"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88264206"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:00:46 -0700
X-CSE-ConnectionGUID: ErlxYJ6mSF2s1Ln9ZBjn3w==
X-CSE-MsgGUID: PT+pPgqBSc+BnQqQJkKCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269844992"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:00:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:00:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 08:00:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/RKvEvvwa7G4/lzmF4+2d2i/sg0P/oKJNDk6KZMhrDeSrgU0juoAQkUzeKbDg3ZCnNqs5moVkU2c5019wqU7a6TuV5uy5+Ms2q2NT4dOBgaSv3CYwF+5F7s4htv9hklK6rAxKhAKQI4+NWwaGJ4POx8QTNhP7G8YDwJ/Pe3jn3cZrOFxd18aCdBNVHU5SgHPAAnqqcw6YP9f0RnlF/740+c0BU08btT3bHtDZrwgUDKSOKyulZBLfw1Jz966X+eOxmoRXy1YLlfLhCtvMHPxjKvB67RqDXx6TPLjIIY4/bd6NfLXvy8EjEwifgw0vXXWsMJpDGwQZNKFxwqe7Z78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=832FAmhD7vVhN64JGxacDN2Sqq52VWmiO8R3ZYLDzdY=;
 b=ADqqLPaNaZ4XyParf9fIAYyRFPTXl9wPgWXDVY2kWB8kFGqvvY7FfThDwTm5Wn1oR5IMw6AsGsg6vBPH67FP0D6n6PB1idhnLikNzCv2yTfc0FBSzBJ1UgxETclPimg8Q+PnwvTeUFPgOzk/h/m8ReZdCOxzvA3RU7XKMRvMZm2bYtR4UFCFDuCGL/mtZuR8jA/AEN5tE/hrPYfHInAg7mB+og4/LGzdWvm7LGMDNSaGiNi1G8CW7gvTwwEKe8W+lFxZOa/4R4SSA3YZXTtrL6nRvjqusuPyJ7piDLH2U085k+hGe/F0KOwRUDVzLcwnIhcQGlFTSnrgEcE+JA3yyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 15:00:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:00:42 +0000
Message-ID: <fe134d36-779a-41f0-87a3-c6dfb8abe10f@intel.com>
Date: Thu, 27 Aug 2026 17:00:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 09/14] drm/xe/configfs: Add bad_page_reservation
 attribute
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-25-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260826135136.204044-25-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 862560e0-54f7-415d-e457-08df044bf70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|6133799003|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: ovdK+J/VYlS3IeCDcpY+doKkbI6aJap4KhYgUjt2bIU15heZu3lzy5NMu6Ff0gdaI5lFkJnvl3yEbQq4aSxq9KNA0D55l3sDxI6gBKJfAwm+yLoxcfDcC2rbRDBy8EMXNRaqXnpzartTqC4VF84rhOxwKTUs5Sevulh0CtZ2WIRNPQl7vqlYnea74TJ7GbnZluJBtUAvAlE9ZBxm1cbecqjDoS6vF2LkzclXjNZ8GLtsCJNBsveJ1VM72Lxl5wpHFiqQIeDiNtYY4hsCs5IjnmpHIPnFHglu/4tIvObK9cGPz/pZZYzUJ42VA4pHEG7z2+WPygVph6A+bySoWN0TEfyRlOguRxMxb8rokheXejdGBflFZZ4Ykb0MfYtXKxNFzcrH05B3n/1fRoXKiveVCGWKLHFv+XunvPMzxoSV2Dnz14HkKMbbHhN4hvJO90Gm8nBhPoqQxAZG72w/n9nwRN3BPohI/BUS96Q3twbMcxHMGQQCpDW0yhklUkBugfOaWeL1V7MpJiooavVKP9EyGyZSAROAh99bH+LSIUfdtD4LHPdPE1+tRqx6qaVT4hRUZyO8wD7GhuSQSkRFDBTq9AH5lOgp9D7uy14u8XcRToO5XLyQd4VQPbi7aHrM634GEwCEdctwubnDHcj0YTgyOtpztFDFlXn9SKZXnNLT5LI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhZSklMMFZDeHJFUXQ1djMxRTk2Y1A3MDRSajgrTlZPa1YwL1I5NmhnODNL?=
 =?utf-8?B?ZWREN2pOYXJnTC9JdFBxbG1NVWJvMDV6elpLSFNRNndYSUY2VThUclJGUk1J?=
 =?utf-8?B?d2tsWU5VN2JwN2lFd1QvV0lkaHZFL25zK3ZQU0tQc3VWNnFtUEdpVlFGNHZa?=
 =?utf-8?B?WDdzVDl2RGZQN1dUYkxLVWE5Znh1cG5rOWNicjhFUGJKZkM4VG1LK0hxRE9C?=
 =?utf-8?B?Z0VrNFg0R2tKOVFROEZ4T0EwWHRkemhYVVZjakV3aW1RUTcxbUJTTFF2TUZy?=
 =?utf-8?B?UGRqRzdwZXdTVGVvcmpHUVoxZk9GYmVMbnRmaHdxTkdiSlZUYlFaSnJOWVhP?=
 =?utf-8?B?NE9Cb24vSjBFa2xGNVh6NVI4YjRVYldjUHltUkxTSUtvN2FIdXJMM0lVaUM0?=
 =?utf-8?B?TGp4K1Mzd01LSDMrWEdDYXViOTVNOGdxTlZqRGpTcThBMGh2akgvQjhsN2Uy?=
 =?utf-8?B?TFg4OVlBY2d5TkVLRElPZGdRY0lNUW8ranorV3AxOHY3RTZoSWQrcTJhUTVB?=
 =?utf-8?B?aDZnSk1aNjJ1RGJvTWlOckhKTmp1SlI1YUVqR1ZScU0zT3NhZ0c3MlZ4R2Fn?=
 =?utf-8?B?Q2hjM20weVRRaXVCSytyamhQTmd6eWVYSE41dlZkV1lYMURuRVJDcjBrNFBo?=
 =?utf-8?B?VURUZlppekVadko0bkg0SXVhOXN6eTFqaVhSaXhmZHg3QUh4WDE0MlhHai9z?=
 =?utf-8?B?b2xUVUU5ZkFTL0FZYVp4MkFjWXRSdDRZWERuSXlNN05udlhlTkV0SGVPZ3NL?=
 =?utf-8?B?RjcrMGxQZ0hjUGxrNyswcFBDejhPTWJyZnU5enFVVVAvWmw1QXVpZkJBNGxW?=
 =?utf-8?B?eWJjbis1RTh5MWJtRHFRMzN6T25RNlZhK2Qzb1Fha0RGdmpIc29hRTVib1BD?=
 =?utf-8?B?S1hkamk0MFUzTzZKc0FXbENSMkh0cFg2U0YrcXpoY1VpZUJXYVVGeWpoSVBZ?=
 =?utf-8?B?T0hLS2dDMjA3STRlU0YyZ1BCeUJCNFF4VjdLYXNUZmdkNCtsME95YkIwRlFW?=
 =?utf-8?B?ZGEvWUlCVWFlemlTWGRoTEVRWUIzZnppQncweURXeU9DZDkyZURwQWZEenZm?=
 =?utf-8?B?eGY1cVFDZ2tHYWs5RlVaL1BXUVRKTEFSdTRYakVQWXpzSzE2OWx6NVM1d1lp?=
 =?utf-8?B?NnY2OVNJV2xCdkdwdWVMOUNhN2NsNGhuL2R1b2FCYlpJd3l4UnQ5Q3hoWmwy?=
 =?utf-8?B?ckh1SGNQS3M3Nk81eHhNSVpEL1hvbFBMYm56dXd4Rk1iUTRzMmlXb0lBNXBM?=
 =?utf-8?B?Tk1nMnJXeDhWeFBOZnVMdWk3ZHlHdGFaTGZ4Qkt4NTkvRjRqV1ZFNHN0dTkz?=
 =?utf-8?B?dFRzZHhPL1NiMk1UU3hVWEM2VUhwMTAvaHNVMHlWUkY2dnBReC9FVDg1NWhS?=
 =?utf-8?B?MkhSMXlMV3hldmhFaWltOHJvMTJRaDJBZXlxb2FBZmtuWWhEOUtRTlk5STJ4?=
 =?utf-8?B?aFB3MkR5dkFrWW0rdmZneUFlYzhveWhoTDB1cDZYZVdSbWU5dW1YKzBiS1dx?=
 =?utf-8?B?WGx1L2QxcTJjQ2lPTERJYUcyUWJZYi9IL1g5U3EyVDNRdCtUOHk3dWExQmJY?=
 =?utf-8?B?NnNncUJsbi9CNUtZamZuc015SVlRWlA1VjZZVWppVnMyZU8wOGhCSVNNck1u?=
 =?utf-8?B?bXI2NlJWck52UmRRUHNGR2V5K3dIMndtYzg5NDRhRTJvOStRTUdvN2R6M1FR?=
 =?utf-8?B?MlJSYmpPc3YycHJodjdEdStncFJMUUtlNUszd1QvVnFkVFRNby9NMUZ5cUR1?=
 =?utf-8?B?eDlrRDBxcE9JSGJhWE9IOWZRaXlkcCs1M29KVGhYeDlseGZiUi9zNW1FRFZN?=
 =?utf-8?B?M3ZmYWZ1SUpOTUtTSUozSUdYaC95YmJmTlozN0srQzh0Z2VkdHFjd3U0cVEx?=
 =?utf-8?B?WFJCelp6SXNiS3gvNzZpWXNhdnV0VGpwbFNtb0hqSVpDNWVnWmpaWnZ1UWxi?=
 =?utf-8?B?bTBhSUJkdUdIVDJGTDV2Uzg3TWNMZXlqcWlPaVlzdElEOWNOS2RMZm9SZmF1?=
 =?utf-8?B?U016ZXJWNFBwY1dPN1BUU01BS2poVldhMzROMkJUdWdueFlvVFRiR1o3SlBS?=
 =?utf-8?B?T1JwWVZRNTY1aGFBUndPTHJMR1UzaFlEbmFZc3hIc2d4cWxxR0R4MEkxZGpH?=
 =?utf-8?B?SGRjU0RBMHA1aXVoVE93R3F0aWVicFcva2lVazNqUEQ0T3h2UjVLZk01MkE4?=
 =?utf-8?B?dUNDbkUwMXlmYlpQRTZIMG5UaFdnN0R0TENQbjBDMmgrMCtOQmVPd2luTE0r?=
 =?utf-8?B?OThvRFdaaTJZY3dOUW53WUNlN3Z1Qjk5Z2xtbGxycklhL1dIODR1YzFMajBZ?=
 =?utf-8?B?NG5tTDA0bDJEb2Uyc3E3d0pKWEp3Z0dWV0pPK01RYjBVN3d0U29sYTcyN2ds?=
 =?utf-8?Q?ElVQI0/gfiy3BbSk=3D?=
X-Exchange-RoutingPolicyChecked: PrdtKaT6Mvbc2lc7ArHb10nFRbTzcwb3JNTr1tDvLy63roP16deon+NB/iidb1yk/J8abbezr9nLKkgwykXvFnvH5NOd4rry4Gipf1tbmP9niHtsKZ39tgri3tsLtOW2m5wA1OyLzuM/RGCB5B+tPf/7iatJ8xPdbDuicOIGCMRAWnQSS+oPTwLtwNekYxwNKj582xXvIDrPYMsIKuixZLnVMgf50p9MeTrRAq30e3L7FxI6m5LM6pBZwr9GeZPTEXG8gMVoSKZHFJvkMhUnWjtbxZ6r38sfuQlmTWMdTplVzggdHQuX9vdlexd4sNSBBRAk4/mCTC5N79Ny/e+qGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 862560e0-54f7-415d-e457-08df044bf70f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:00:42.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWEhAnKNazsV3MjtaHWGwGYlqAXPryqM3RPu0+7ceL0lJApKgguETfyHbVMKJ9RJsCu9QLOZyYu+RJLVVjlSbyyAM76v7zi6jGQAfWqI87I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 8/26/2026 3:51 PM, Tejas Upadhyay wrote:
> Add a new configfs attribute 'bad_page_reservation' to control how bad
> VRAM pages are handled:
>   0 - Logging only (report in dmesg, no offlining)
>   1 - Offlining (default)
> 
> The attribute can only be set before binding to the device and defaults
> to true (offlining enabled). This gives administrators control over
> whether corrupted VRAM pages detected by hardware (e.g., ECC errors)
> are actively offlined or only logged.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 67 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_configfs.h |  2 +
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..80c4c5f66e4c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -61,7 +61,8 @@
>   *	    ├── survivability_mode
>   *	    ├── gt_types_allowed
>   *	    ├── engines_allowed
> - *	    └── enable_psmi
> + *          ├── enable_psmi
> + *          └── bad_page_reservation

please double check alignment - look for \t

>   *
>   * After configuring the attributes as per next section, the device can be
>   * probed with::
> @@ -159,6 +160,19 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Bad pages reservation:
> + * ---------------------
> + *
> + * Controls how bad VRAM pages are handled:
> + *  0 - Logging only (report in dmesg, no offlining)
> + *  1 - Offlining (default)

this is bool, so Y/N/y/n will also work

> + *
> + *  Example to disable offlining::
> + *
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation

if this is about VRAM, why attribute name does not say that?

maybe
	"enable_vram_offline"
or
	"disable_vram_offline"

to benefit from default '0' ?

> + *
> + * This attribute can only be set before binding to the device.

shouldn't we say that it is "available only on CRI+" or something?

> + *
>   * Context restore BB
>   * ------------------
>   *
> @@ -275,6 +289,7 @@ struct xe_config_group_device {
>  		bool survivability_mode;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
> +		bool bad_page_reservation;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -295,6 +310,7 @@ static const struct xe_config_device device_defaults = {
>  	.survivability_mode = false,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
> +	.bad_page_reservation = true,
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -616,6 +632,32 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t bad_page_reservation_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->bad_page_reservation);

	%s and str_yes_no() ?> +}
> +
> +static ssize_t bad_page_reservation_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.bad_page_reservation = val;
> +
> +	return len;
> +}
> +
>  static bool wa_bb_read_advance(bool dereference, char **p,
>  			       const char *append, size_t len,
>  			       size_t *max_size)
> @@ -855,6 +897,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
>  CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, bad_page_reservation);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);

shouldn't you also update xe_config_device_is_visible() to make it CRI+ only?
> @@ -864,6 +907,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_multi_queue,
>  	&attr_enable_psmi,
> +	&attr_bad_page_reservation,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
> @@ -1142,6 +1186,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
> @@ -1290,6 +1335,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> +/**
> + * xe_configfs_get_bad_page_reservation - get configfs bad_page_reservation setting
> + * @pdev: pci device
> + *
> + * Return: bad_page_reservation setting in configfs
> + */
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_reservation;
> +
> +	ret = dev->config.bad_page_reservation;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..7405cc5f3207 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs);
> @@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>  static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
>  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }

