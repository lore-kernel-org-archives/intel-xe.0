Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3D3CDB46B
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jun 2026 16:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D67310E22E;
	Sat, 20 Jun 2026 16:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZ4KRcRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7310E22E
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jun 2026 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781971941; x=1813507941;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=edzc8vWTd43i+Grq3FsSRpux9/qgMlAwVu6v7PfCvw4=;
 b=BZ4KRcRh7BjGrRCyhZJcnHbO2l8/Wz8GnCGezf1EXLnBJKtWgKE98EJI
 wvRTncCd+geUOEcLTu2ZDD+hjWZVm9bzJfYfgbyo7DdsPuMvtGguQJa2Z
 rd109WrHOD207PbEFnfHOnlFgKjyXuWDNoh4RcTEgNKIVVdSJ84JpkEBk
 fIJH2kC59XmKYyW7m+TFg9n0nul5Jw0GM9zEe9Q+2FKBJP8rZQvDRm7pI
 odThGGQyE4FwlQgx1CldHVDkCABafJC4mbekxcDA6aEYeXWdKLf+OJUbv
 FMg0pWZka5Ccv1iAGLv4hGYwtmyxWFeiyal2aAGemwAo/XUM7XhG1GvUI Q==;
X-CSE-ConnectionGUID: T7kBBg73RWmI90CNRevquw==
X-CSE-MsgGUID: X3jq+UV5QdG+dxglV9y7Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="93885513"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="93885513"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 09:12:21 -0700
X-CSE-ConnectionGUID: 8NaOI1pSRXWTwCdLuzSPTg==
X-CSE-MsgGUID: GKIFROO/SAGzSxTkOwRvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="247969000"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 09:12:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 09:12:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 09:12:19 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 09:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8Ouo987s4NBrg02lRQQg3txNU02sLq55R5eA4f5fFRcjIS8srIKcmkvT7Yey3KsN1TM5mWcVMzHd6MnjltYt123u7TBwC+DyOoiasLzsXBJDljjI2BC2ifAu3BC8fTdgOyzUI1FsS/UA9EYWkVsaNMSwn+yUlCwvFzFm8oB6hqmTuefoOj+wFzk409kTKjGx/+T736wVlWqgzUsjo9KmhDoqpSrEupw36Scech6PnYTY308xZIatLj01pUVJv9tgyEAr47e9Qr4MiYEyMYYWAzhZWLYAkLv2CfOYHr5iwptTH/D10tOc63MdAsm6LHd9EhOY4j55Hb3MAi09tOPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjTlz2dAsNq4rz1UgqD1U+JR7m0jyc6gCKK/XfDW0zE=;
 b=PKod01YK5KvA7vh2d90+aX5Onbg+33qPd/6AGvwyGKfoRvpDBUTOjvlU4VKjKoeH9VFJeWYQO6xyCQ0TJZwUF1HGT/aFxbZ4nWpdx2apFVhi4WsZMjtdA5Z+TlzyUb2A+vFg3jYWttqRTe84329k/UCsSojqS9Jya9IdabvjYIWurW6SY4BYj/bbJ3Qr8UjYp+zau1HgQXiTVBLi4Lb1OPA24teOJb6XB/z2ZP++n+CG8QJf63wFxkR4Zp0SJeJxNqekAdl5+fKrM11HqXSTz4Ce7xePUDnBcBXBUjTw6rU5Y2aoy225sGAgGir3SulRz1i/CUCsH5RZbsKcGzC5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB9802.namprd11.prod.outlook.com (2603:10b6:806:4d9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 16:12:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 16:12:17 +0000
Message-ID: <c39dfbf7-5931-4dc1-b124-6004e9c84f11@intel.com>
Date: Sat, 20 Jun 2026 18:12:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/xe/guc: Decouple the GuC ID manager from the
 submission state
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
 <20260619202935.2701499-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260619202935.2701499-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B94.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::630) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 242ad6e7-22be-4b9c-a8cc-08decee6b2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: R5IUizQT5KrZpFk/guzTJY+CKSsEuiOwHY5DcjoxKF86AKo93fnoz7rMis6osD6+ncQKcFk5v1rg7jxRwQ/T/R1G3dduolfkt5/y1LonDxKweCaUMJ86hyIL+9UJg5ZsQ9Q4X97pd+C4vWDjA5Mv9x9mn1y9TYJz+VBYzUMii0lp9Ayo8HViK0ROV7QF+GCtJqoOz2rGDSa7UDpaMjZmIY6JfQi1SR98SZLCvUbaFzP6Sxm6aSglw+4tc4gyMiJ1n5x7amuBg8BetX9iv3TI9qDr0fmOoT8RUm0MR4oj49rU8zkLgSPnrXR9JmjKmRXkzY5LQFdm0QwUZRdrjW1vuX08eCl3C8STrA4G4uphdfKtDEc5HDcs+QXtOaz/QleRo2i0ucJwslSbPwYIB7e0E6BknzoqRmyTp2041f13u5A3QSrPdNqZ8LWlqapT+fWlazNnAx9nY/Kl7A10uMnpWn4QDGEjpCLYCfO9pMzCxBT6JJORsvBIs8p0F8UOHi4+OlBlkI53Xf/lBQtctJr9mE3WY/LoX8N8iem9EkySIoijwCTdcEol7Dm1KZc6FSy4tddzcPRoWvcrzB8UIZSnIAkhf2uQLV5pCimxBVI7eqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzZIbDNsVHY2ZlgrM3BaUEszZnJiN2w0MkFoR2swRzh0Z3RNTXo2WDV1L2Mw?=
 =?utf-8?B?OUU3dlVOQTJqSWZGSVo2bWk4NWgwYTZnRkgxNUFWQ0ZqK1Ewekh1d2h4NHkw?=
 =?utf-8?B?VGdEQ1BpOU05N2N1Q0QyWVdOUW1rTUF4Ry9TL2Vac3FadENZYXhJVGFzUHpG?=
 =?utf-8?B?TTRtem44Q2s2NEpDS0VKN1k4N0lMUU5SVFNqeDVvWU5hbVVpb01nYmNPRTRL?=
 =?utf-8?B?Zytud25aVERtSyt1WDFiZU5Nb0twVHd0YkpkTEtXQTJWandQdys4WXJHWHA4?=
 =?utf-8?B?RFpPU3J4SS9nN3kzTjFXV2hBa2ZRWE1qcUNNcGg4Vis3cThRVkg4U1Z0TTRa?=
 =?utf-8?B?eVFNM2RPb3RmZExaK3VyN3RNNVd0UFJXNHNWV2l6THp0dFVDd0d3Tm96QzNy?=
 =?utf-8?B?bXNJL0hGVTNDQldkdU84dmY5Rys0MTlyL2xVMUNjMjZkMmxYc1BEek5GaDUz?=
 =?utf-8?B?Wkt3a0N6TldYOHBJSi9EaEs0dmpneGhpdExlOWNXQXdrcjF4MTJoeEc5Wm5N?=
 =?utf-8?B?S2pHMklRYlgyV01PbmZCck1scFFnUVVmd3FTdzdjOUc2NDBFa1pxRkhUZnd0?=
 =?utf-8?B?NFJPVTNKK0h3cTJBclIwdHBwV0ZjeUJkYjBSRGpvZjNCSE52R0lHQ1NXVVdw?=
 =?utf-8?B?Vk44ejR6N3pYeVp1MERaV1NGS2g2a0NhbDFmMEdLcGxJbkZsWVh6ZlV3bkx5?=
 =?utf-8?B?NGFyb0p5OGhMc24rVHRpZGxWTE53NTVlbkFFWk9qRlNWM2tmelM1RlhQbWEr?=
 =?utf-8?B?b084Ty95U1haVG5FWlNFSmFVTHRZeW56NGlsQk40L2VVMXJJM1NFN0NqKy83?=
 =?utf-8?B?SWlRRjVmcTZud2lRUkZ5SXRkdVhWaGJRZnNOREhOb2NQeDRPWVV4QUJwMUhL?=
 =?utf-8?B?d1hEemFBS2tkWDRjT0xqUnl1VFRYQ3JJaHBtTG0vMkVzeU9DUWxqMnNQdHpq?=
 =?utf-8?B?Mm11cWc1dEFGMnc0aXc2VmluVlNndDAreTMySGl4SFhPb0NlVkNzN0liU0Vv?=
 =?utf-8?B?eTVEcjZSNnFhN3Y4Um15T0FOSDc2OVI3ZjdZME56RldWMWhCek51OXZ5YXpD?=
 =?utf-8?B?VEtPdnJmYk45ajBER09qaHpOWnFQQjlmUGE0b3dWVlFMQnBMdE5uUWh1bzEy?=
 =?utf-8?B?b0gxVDNKQ2hXS29PakRjREY3MHFHZ21hZnhxQVhRdVR4K1pxZEFrbmhDMEgx?=
 =?utf-8?B?ekdCR0luVGZtTUxkeGpaYkVyY1l0d295OXdlbmJVZEpSR05nTm5nWUZaL3FB?=
 =?utf-8?B?SUcxSldsUS8yYi96eTNIT29RV29NbGFuV09sK2lrV3Q4YXkwOGdXSG9uOTMz?=
 =?utf-8?B?RFdUcTlXQjVXSVRVeC9Pa1J1RHMrZHZCRmlKZmw3QkhtZnpXTWFuMERLZ05a?=
 =?utf-8?B?V3Y3bG9NdGZQeDNqdlBQU3h3blBma1NGQUFPWnAyMTVBSkxuZWFEUFl6TTFI?=
 =?utf-8?B?QkVrcHpLdU8yWTU0anIxTjl4U2NOSGkwZk5Jc1JLcE5ZMFNiUTB6Z3BwR2F0?=
 =?utf-8?B?OXBhMFcxcTlSZk1lc0FUdVNMQ3VkNzVxUENVVFBaa0VPS2pibVhObHhRWnZu?=
 =?utf-8?B?OHRmZmxwS2hxWExpWnltUXd1L1BCSGJvMW1hRm5QRlRXTno2enBtTUpRUjh3?=
 =?utf-8?B?Z2k4T24yb2RnWXBNNDNpYVZmZGUvQnNlblVPSFFMMnFVdHMzNmpsSmI4Tzly?=
 =?utf-8?B?N1NCcHZCd0E4b2cydVVDNUpLZ1draTVNQ3ZOa0pUWlo4bG1tR09ZYmlPVlA0?=
 =?utf-8?B?cEFCb2FDeXpFT2ZvcG5ON1EvdHJRYmMxcWhlcGgvbkJDYXJqWGd6RmpibGF3?=
 =?utf-8?B?M0hRK1VhczgzOWlUSGhTMWZHOE94aVBybFVUaG9aOGhOOFVuYlJPeUV0aXlx?=
 =?utf-8?B?SkxXWElDMWx0emRmZ2ZLVXMxVEhGa3BZanlTK0NheCtESW9DUUhDdjJXaHd2?=
 =?utf-8?B?UkR1Z2lxY1VUY1lkektpSDlVVkNDYmpGOW16RENnZlQ4cEJpT08wdk14d0tC?=
 =?utf-8?B?TmNZdlAwd3F5ZU9sYjFoR2Fnc2dZdm1PVW9ZTDZRWXhYdWlrU1U1ZG1ycmxz?=
 =?utf-8?B?Tm0zQWpBRWRsVFQzeEhCK0FtNUxtOHFYUnhHV3FTWGtncmdmYVE5N01jWHls?=
 =?utf-8?B?YTZrSnRQNjB0amc3OTRlWkVEOGNFcXRWRlE3QVU4VzN6dS9aZW1mRUxQZ0sw?=
 =?utf-8?B?UW14WnI2MjE4L2h4YnZ5K3RINDdFS0ZhY2l6R2IvT1ZEYk1xeW5wRVRYQlV4?=
 =?utf-8?B?NkZ3NzBQR2kyaFl2TVlObEZsREVjbzdYTDBodU9VMjZaMXNqMncyWitqUmRQ?=
 =?utf-8?B?dk5QR1RoaTlXc0xWd1ErdXpNL2ZLQlRxWnJDK0lPWmsvU2wrUHlyZFVhblBV?=
 =?utf-8?Q?l8Mza5+xQUwbvL5E=3D?=
X-Exchange-RoutingPolicyChecked: Wadv+wxGvRar3d3hPG4nDA1Nmp0sIjY9ODMoR+yCNo0J7MAA37dKDugv5SRgIzCaFSTO5eUQ2XjXcfDwZcEM3+cHRPGwxTo2eLpTfUPIMo8/p0/+8W9PyIn2wCV/dGr3WcB71KKzWiKzN/SwSQfvyo8uuL+aB3ikdi2KObsnuvUXvdfMfSP7fgBLXYsNpnGJUb/mQcrD6pAZlhUlv1jMfiDPU7RJS8uugPxfLiIbhf4Rqyo+7w+6jbNThiCer4Bqok2I9Zs2P5nkg6DZnRhvekaTo9qoh6UeWIB17oEqwf3VlpxZNU2xrxqRUNvbFE0+FzihDpv8TdMaI3OxxV3Aew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 242ad6e7-22be-4b9c-a8cc-08decee6b2cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 16:12:17.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1JhMUlyHgS87NzzCzPEFzFEZobcK60LbM2Gi2zjb/eSy7v+rPnaTPqGvoCxk0uavHNGXAPL2oUZ03VK5rflPrO9DW+AuFl9iIvKTQQ2oF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9802
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



On 6/19/2026 10:29 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Refactor the GuC context ID manager to remove its dependency
> on guc->submission_state.
> This allows using the ID manager outside of the GuC submission path as
> a standalone resource pool, which is needed for future patches where
> it will be used as a separate pool of context IDs for SR-IOV VFs
> provisioning.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 ++-
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 22 +++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 18 ++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  5 ++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_types.h             | 21 ++++++++++++++++--
>  6 files changed, 57 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index dba6e69335d8..c10d2b3f50ea 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -104,7 +104,8 @@ static int pf_gt_config_test_init(struct kunit *test)
>  	pf_set_admin_mode(xe, false);
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>  	KUNIT_ASSERT_EQ(test,
> -			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
> +			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
> +					   &gt->uc.guc, NULL, ~0), 0);
>  	KUNIT_ASSERT_EQ(test,
>  			xe_guc_db_mgr_init(&gt->uc.guc.dbm, ~0), 0);
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index ee30a1939eb0..4e4b1c890000 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -15,23 +15,31 @@ static int guc_id_mgr_test_init(struct kunit *test)
>  	xe_kunit_helper_xe_device_test_init(test);
>  	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
>  
> -	mutex_init(idm_mutex(idm));
>  	test->priv = idm;
>  	return 0;
>  }
>  
> +static struct xe_guc *test_idm_to_guc(struct xe_guc_id_mgr *idm)

hmm, while we can move out IDM from submission state, IMO it will be
always coupled with GuC, as it manages this GuC's IDs, and we shouldn't
have more than one IDM per GuC

so the idm_to_guc() should be always fine, but may look like:

	return container_of(idm, struct xe_guc, idm);

as it was initially posted [1]

[1] https://patchwork.freedesktop.org/patch/573977/?series=128445&rev=1

> +{
> +	return container_of(idm, struct xe_guc, submission_state.idm);
> +}
> +
>  static void bad_init(struct kunit *test)
>  {
>  	struct xe_guc_id_mgr *idm = test->priv;
>  
> -	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> -	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> +	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
> +	KUNIT_EXPECT_EQ(test, -ERANGE,
> +			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
>  }
>  
>  static void no_init(struct kunit *test)
>  {
>  	struct xe_guc_id_mgr *idm = test->priv;
>  
> +	mutex_init(&idm->internal_lock);
> +	idm->lock = &idm->internal_lock;
> +
>  	mutex_lock(idm_mutex(idm));
>  	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
>  	mutex_unlock(idm_mutex(idm));
> @@ -43,7 +51,7 @@ static void init_fini(struct kunit *test)
>  {
>  	struct xe_guc_id_mgr *idm = test->priv;
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
>  	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
>  	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
>  	__fini_idm(NULL, idm);
> @@ -56,7 +64,7 @@ static void check_used(struct kunit *test)
>  	struct xe_guc_id_mgr *idm = test->priv;
>  	unsigned int n;
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
>  
>  	mutex_lock(idm_mutex(idm));
>  
> @@ -78,7 +86,7 @@ static void check_quota(struct kunit *test)
>  	struct xe_guc_id_mgr *idm = test->priv;
>  	unsigned int n;
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
>  
>  	mutex_lock(idm_mutex(idm));
>  
> @@ -102,7 +110,7 @@ static void check_all(struct kunit *test)
>  	struct xe_guc_id_mgr *idm = test->priv;
>  	unsigned int n;
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
>  
>  	mutex_lock(idm_mutex(idm));
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index 0738fc277bd2..f1e69650fb7e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -16,7 +16,7 @@
>  
>  static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
>  {
> -	return container_of(idm, struct xe_guc, submission_state.idm);
> +	return idm->guc;
>  }
>  
>  static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
> @@ -30,7 +30,7 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
>  }
>  
>  #define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
> -#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
> +#define idm_mutex(idm)			((idm)->lock)
>  
>  static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>  
> @@ -63,6 +63,8 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>  /**
>   * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
>   * @idm: the &xe_guc_id_mgr to initialize
> + * @guc: the owning &xe_guc

IMO there should be one IDM per GuC, so the internal container_of should work

> + * @lock: mutex protecting this manager, or NULL to use an internal lock
>   * @limit: number of IDs to manage
>   *
>   * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> @@ -73,10 +75,20 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
> +		       struct mutex *lock, unsigned int limit)
>  {
>  	int ret;
>  
> +	idm->guc = guc;
> +
> +	if (!lock) {
> +		mutex_init(&idm->internal_lock);
> +		idm->lock = &idm->internal_lock;
> +	} else {
> +		idm->lock = lock;
> +	}
> +
>  	idm_assert(idm, !idm->bitmap);
>  	idm_assert(idm, !idm->total);
>  	idm_assert(idm, !idm->used);
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index 25c6f026449a..d0ce8ce85b7a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -7,9 +7,12 @@
>  #define _XE_GUC_ID_MGR_H_
>  
>  struct drm_printer;
> +struct mutex;
> +struct xe_guc;
>  struct xe_guc_id_mgr;
>  
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
> +		       struct mutex *lock, unsigned int count);
>  
>  unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 537985f4d3b7..154d6129ea44 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -311,7 +311,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
> +				 &guc->submission_state.lock, num_ids);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..0850918c28b0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GUC_TYPES_H_
>  
>  #include <linux/idr.h>
> +#include <linux/mutex.h>
>  #include <linux/xarray.h>
>  
>  #include "regs/xe_reg_defs.h"
> @@ -33,11 +34,14 @@ struct xe_guc_db_mgr {
>  	unsigned long *bitmap;
>  };
>  
> +struct xe_guc;
> +
>  /**
>   * struct xe_guc_id_mgr - GuC context ID Manager.
>   *
> - * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
> - * to protect its members.
> + * Note: GuC context ID Manager uses the lock supplied at init time to
> + * protect its members. If no lock is supplied (NULL), an internal lock
> + * is initialized and used.
>   */
>  struct xe_guc_id_mgr {
>  	/** @bitmap: bitmap to track allocated IDs */
> @@ -46,6 +50,19 @@ struct xe_guc_id_mgr {
>  	unsigned int total;
>  	/** @used: number of IDs currently in use */
>  	unsigned int used;
> +	/** @guc: back-pointer to the owning &xe_guc, set at init time */
> +	struct xe_guc *guc;
> +	/**
> +	 * @internal_lock: own mutex, used when no external lock is provided at init.
> +	 * Do not use directly; always access through @lock.
> +	 */
> +	struct mutex internal_lock;

do we have to introduce internal lock ?
maybe in case of separate shareable range we can pass the PF master mutex
that we already use during all provisioning?

> +	/**
> +	 * @lock: active mutex protecting this manager.
> +	 * Points to @internal_lock when initialized without an external lock,
> +	 * or to the caller-supplied mutex otherwise.
> +	 */
> +	struct mutex *lock;
>  };
>  
>  /**

