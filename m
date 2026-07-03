Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A0EC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABB10E60D;
	Fri,  3 Jul 2026 14:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/5k9uiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE310E60D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783089646; x=1814625646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4UoJMvkAlp7+flEeK6D2Wlwpp10pjJ7RWmXepJ9eJfA=;
 b=f/5k9uiXzqBNn7A9P83ncGfo9lVsFW8fGI+I8hairB0HGFBkRqNx+L9I
 T3gRx1ssGh4BmY+ekIDOo37BeyFyBrLPrb5EA++gCEgM0q1+k5klACwOp
 b2matVCfReRT7j2PPpBm5Z7tUXQNCCMf/V4FxL2LgssD0W+wE67bbnBU3
 SslIkL8RqLHkFWZwIRl7nnSg7wgyqdLCKVhOMJ73ZKp10uo8DWeRf7xOl
 SEzei3xfSE8BTnQe4iThzdcHInD4HWEGuWqrn4pPv7ugrVHK6a0y1EWva
 8gbhy9Og5OHYAO2oS1gCw1qJPWXtZIdCqjL3wMXdP1mPhvb82B+TqjYWC w==;
X-CSE-ConnectionGUID: Zo37VVHNThK5m5qpZMRENQ==
X-CSE-MsgGUID: GDx6mjLJTcKCPvNOe67Zwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="106640067"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="106640067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:40:45 -0700
X-CSE-ConnectionGUID: ltOXAK0BQ/uVbkBRwnVp8Q==
X-CSE-MsgGUID: FostSWdnRGGtXGUKzoq2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258022762"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:40:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:40:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:40:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1wLrBjgQN4ymAhhAaoQK1VuTMYPnW+M7GqMtGS3KzTYTtQ/4Qt1LqbAAOs5UdwjaqkESx3yv3+UO3BzmXjarfpLzTkqOKARjb448Bly9aqlaClUisIgFv/lZff5NRFtI7avFM7NHfGjZ/R7IQPzt0JSqDJHbXnC/2YLWTwSFDz/PzqH8oLDPEg5TZIX8AmxuVqVYizgXvy1kYJqOqA0U8DsNs19TO8pv7tX4ktfk4okOr2MDLtGxGuwkTMNxLvaqd9SUJwwxjQ6mixoBhUuJEvhgyFnQgV2fLfhoXpewxKUKICaHhYgVRD6IDoX3fivDpO2gkwytpC07M5cscGMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvh7Zr9glsJrBLZt/2O9XqgnfohDlA0OvXvLwB6b2Pc=;
 b=ZKwEaSw33fyqt8XDHWjHC74RWXpHy/JQd04qOT1/Qq51fMe/vZok9Gkero9WoPqfTzV7hc1MBG3Eq47eCeUXthA+zEoxfmF1teiaLI2Q89M2ibuO2TCDy+WrxOUZP2IeRRvc/cKSKJgDztdjm2FvEwABSgV/CtrxVHoKcIvRFtWEuFoKiCcOdKjUPX11yokCy7VsZL7woKSex48E3slN/7LpY8b6ASbHemtDD3yybb9UdENloWo52Vu26jsw50tC9rNVzdZRMzCOgSloNvbSRdX1yCPRYopqoNdoPFPJrnNitDopJKpXW6JwHiubq7gVGx6ndxGMGMCigeg3okaJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by PH3PPF248AC5624.namprd11.prod.outlook.com (2603:10b6:518:1::d0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:40:42 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 14:40:42 +0000
Date: Fri, 3 Jul 2026 16:40:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] drm/xe/guc: Add KLV parsing helper
Message-ID: <akfJykXQUFJs9I2f@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|PH3PPF248AC5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e223489-9112-41d7-20fa-08ded9110eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Ff6i4OzzgJgBj+pPNYJQeTyyh9QNk5LVh++6vfST9vUG2EThAGABy1h+VNhGsUWaH2P3fP7mpaQabvpsZ+YwaUobZja84OHu+KTGTc673rh1KDnnT5wY3wgnbDam/GJ6zAjvTZKX9fD9QFdarAaJ2v0RtMKGsNCbtvwE/fhcn+25pWoLgCwQZN10LJiWDMpYOxYzIMsLLF0LiKfaiz3ikAIQIVXNFIv5iWaKd2femeEZYrPNhA4bi+lqTODkOYV6xnz0FeL/RCJ+DDwnGY2BZHihADCQgeNS/RrOJA5jBnWrvZ2TY0D8W1Ipb8xsAnI8cVTpfN7FXfocS8gOjHQWhb2j2ZdP/ov2wlqgxsG+CiOnVmKRo5OzE97emZ5aRSwLF0M/tPl1GjQadW2ddSSBlc1OtNmiobig+9OEF/4JzHta1e7iW4w+n8YbBWHSNZbRqVL6tWTWmVakJ16OCHEs5O2SkBluIzIMr9ErV4KBq1mWNJG//47hY8peFwgDRCPOzPFPssGDcKcf8CQtdORXnlhJsU8lJUyJ7Qw/aGpABzG31/pg84L4VvrPoTn059FgucoSm4mB5fJHeef8PIe+a4f6/HX1Ab7zGu6G60StuWFdc9YE1JzyJTcqUe2slQUiGVN2V9kzF2UIfLCkBeG41oQeYriUQORKujOf06wEIPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVd2cjliV0xlZm5LNTQzeHhEQ1E1Vm13Z2p6SkxLN0wrRExrcW5uZGk1eXBT?=
 =?utf-8?B?aUd4RGV4dEJEVGZPK2xMRE5YajB1Z1F6bVNxNVp3ajJncEwxRzB0VXVoSFd5?=
 =?utf-8?B?c01nZVVieW1rZ244UFVubGluclRudGVuTVlqaVgvWVpEc2lGdWM2MmpuakZj?=
 =?utf-8?B?MTMxOGlTb3NFVFpvZklkRlFUMERwZGpQbkdYa3V6aVlIZkhuUzBDTVYyT0Rl?=
 =?utf-8?B?bXJ5S1MvdE56QzBMcTYzK3RkejVHdFgxR2VZbGdoUlNaQS9LM2RvMW0yaGFm?=
 =?utf-8?B?NVpvM2owVWkvMW9yZW1sZ0JoSTM0elVMNFdDYy9KVlhuRzI2V1BHQWtPYm9C?=
 =?utf-8?B?UmNhUGgxV0MrRllDMHk4WWpWeUdWSE1Pdk5zcUtNUVN2TG1VS2FRSmt0S292?=
 =?utf-8?B?MlFGQzNYSkY0SFd6SjJUdE1kdzZzcjdwR05xbFJnd3B1UmZrd0NCNUhyRjE5?=
 =?utf-8?B?ZVBIVFlOZnBiZEtySVJ6VjJ6MnFBN3ROdG5tbWtGdHBTQlRBVHBGSGpqZWV4?=
 =?utf-8?B?WDdpOThhSk9SUXZYNG82TERLRFJUSGd4dDJHaGdGeEc4NU91S2RkMVJITXF6?=
 =?utf-8?B?ZTJzdXN0c0l1OEVCSmI3RHFNWTQ1UTNtc1ZEaDRNcFlWTTloOUFxK2F0NUNr?=
 =?utf-8?B?MFQ5Tkg5d1FoSFFHZ1ZOQU5iQnNtNHBOTy9QQzJZK05ySWo3aGJxNmxxMm10?=
 =?utf-8?B?bXVhV0ErQ2d2MlRQbklKUnd5ZHAxN0ZUeXNHQ3NHTk9sSE9kM1Y1cWt0VUpv?=
 =?utf-8?B?NEZDT3NWK203clhHenpqTzhNSGQ3ZDBQZEMxd3doVVhxaE9LalQ0M2FRU1Zq?=
 =?utf-8?B?UW1iUTgwNXl1bEpQbUlGK1hvTVZlcGZ2YTFrcmhJSVFJVDZzeDUzNkhTUzd1?=
 =?utf-8?B?ekt3Tzl1NnJLSE5Tc1VJOXRiSTU4dlgwVDBBaHgrakUrQVdZNXdnVkRDeUlQ?=
 =?utf-8?B?YTVVS3lpdjdsT3JWM05ZQW5TYXpzTnB4T0pmVU4zNGV0MzFXTFpWc0VKQWJz?=
 =?utf-8?B?ck1qVGE4TlhRNm41Wk83dGZkOGRrVVpPbjE4SlRFK20yMWVmUU5vS29yak45?=
 =?utf-8?B?TkZVVGMxSUt1OEhYdDVQYVp2TkExOUk1VFZLZlZzY2VBMkZDLzlJSW1xUmla?=
 =?utf-8?B?TDlpUVF2NGVBOWRuWnFPWTJEVk5vREUwUmZWZWRXY1pnU1dndnJoVHFwZW9Z?=
 =?utf-8?B?WDBNblExeVF0cXFLYkVGMUVpOHppd1VFWlIwdG0zVHpWeGJnZ2lqbGxoeVd0?=
 =?utf-8?B?ejV4NmVRWGNqZUQ5U1pXRTVGdG1EdWNVbXllcVU4dFUwNjBJN04wcFlxTUYw?=
 =?utf-8?B?VnJDcWZJb2ZLRjFLcERobGxHMC9OOVBBUnN2SVkybHNZK2c3N1gxclM1cnQ3?=
 =?utf-8?B?ZjVjd3NuVlRja3orb1hFdk1oYWQ0UjBOaUxtZXlOWUlzY3lFMzRUV1dRckJa?=
 =?utf-8?B?Wk9oVUNrRndmM2lURXExSFlETGhsNGtkQksrVlg5Q2xLcFVQYkVVWk9xRnBn?=
 =?utf-8?B?NVFZQUoyQ1FSc1plemVZTldqRkx3OXBwTEN3OExnM0NlY3RVb2VRY3RuUktl?=
 =?utf-8?B?SUJ5R1hKanczd3NEUDNqWEtISytlM1B6L0p0OW9GN1hTZ0p2OVNiVDZkcEJa?=
 =?utf-8?B?KzdkZ1BvSWNVNUVMSGJKKzZQSDAwOEVZQWtTeXMxUDluVHhqNkxaMWV2bFVZ?=
 =?utf-8?B?RGV2akpMZC9KT3hHODE0MEFPaXRhbkVoQVFjcFA1REVoYnJsankwdFJGMmJN?=
 =?utf-8?B?aWVPS1J2K0ZlbjZ5WE1uS0ZLSzA3bFR0RUJvV2RxTHJvQ3ZVRkwvdndIeDRZ?=
 =?utf-8?B?RXc2ZDUwelA0OEQrWTdhYzRsRWt6Sjk2UktIT1FVMGwwQ29hK3lkVVdUU3Q4?=
 =?utf-8?B?Wmx6dHNnaG14czhWa0xGUGtDd05MbTBBNWlCditsKzIwWEwzVHdDN1pUT05V?=
 =?utf-8?B?dmRGcVlLVjNmVWFSNzY2dTJmTjFMSG5lTW9sR2pWWFpNdzFEWDVVRndWWDVO?=
 =?utf-8?B?amd0WkdSZnpYc3A5Zlp1U2tabDdWbW9FUnMybDhCUGRjME5JcHdvU1VVNFZo?=
 =?utf-8?B?T1d2TTgycHExMXcreXp5UGlQbndPQjlWRFVibmQzclhyUW9VQnlDN1dkQWpE?=
 =?utf-8?B?QjNsakoxc0VwNlZDT0JvV2dDdk1Ta20rOE54Tk9Lb2VRWHBWRlRpSDNCa0Nv?=
 =?utf-8?B?ZUlLRHA1L1luQnF2OXVDN092NFBOT2RPSkVFd21MQTJ1MHFjaHVkNFNwTDE1?=
 =?utf-8?B?L1lFN3RSZU5wdDQ1bWMxZHh3WEJ4T250VHVsWGVvR2dQcm5qbGxsYlhWK214?=
 =?utf-8?B?OUprajBLZzVoV09CWDBuMzBndkZ6dnRScWZCMlE1L1I4MHJSNlpYY2YxM2tZ?=
 =?utf-8?Q?fmDehcFoPnP/Hx9s=3D?=
X-Exchange-RoutingPolicyChecked: mcZLQEJ/jHjdfC6B4qeokaK4Puga0YH/SJmXi5qI84zFboIb5RtTluYkyh5bEa3XXuCVp1Suev/Rpv1KzCzfhIdxDv8EetMfyVPggVmhGl/e+wnj/p0kisiYLFVUfWYhrRQ+0yl3przYnPPvBKnm0141EeHu9/Rb+s1Aney5AMQt8JGXgcnIAwGI9VeS9a/pGxl7joLX7XDoYxwViEoJvFMHBdP8eNTfaYmfLUufqJnYvhSnX5mCSSfVITI/gJezMhidceQhdC9XXJWpi9YhfAQ216Ezuk177YgbzcWtvF8o8rrytwDeeExYGwOwlxwxitkwoaK4f4lid6sTai2iog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e223489-9112-41d7-20fa-08ded9110eb4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:40:41.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1mCRaf5ErzMVdWABazfPyo0+vwOlsIfY72xJ3A67LBZpdsMyXKZgvth/qmYPaoGT/rcRjvuggb2U6bGHDUjlWbiyVxTHQ7SLwxYT0ty8Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF248AC5624
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

On Tue, Jun 30, 2026 at 03:26:25PM +0200, Michal Wajdeczko wrote:
> We have already introduced a helper to encode larger objects. Now
> add helper to parse the KLVs buffer. We will use it shortly.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 38 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  3 ++
>  2 files changed, 41 insertions(+)
