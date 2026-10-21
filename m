Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7C606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyIXeqzv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B1510E429;
	Wed, 21 Oct 2026 18:35:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE7510FF81
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792607734; x=1824143734;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ceseliaPlJpO03TQF/0syUzhD+Tz4Bg6M90pkDS2as4=;
 b=UyIXeqzv8Bd059I8UF8rgUd6nzXiTJtgDZvf8pT5pChabkKDLSjV3AoD
 IzY+dr91IszuNbIxNEmbxBBsMRXS9xE0G2iy8Mb+mIY9t1xNcItKKj9bS
 KZuHkDxRwXSX8okdmiNqb+zMaIBIN7ZNUwyh/vPJNd06K4F5ifcKeQqux
 gxJvAx398uA2/m/Bnhqs5PeLRoyWbL+wVSNn0wV01ejznetf6qJQGifq4
 byuw0zy6dSOtkCmwVQEoCHlZPAfI5iYe3nYtOHDHUhcksH0I6ezl2gpK5
 9qSFUxuu+IHtQdjYD+/3rPvbUNc7xs1fuTUC8e6RE5fBwEcUuQ5GV0q9e g==;
X-CSE-ConnectionGUID: E0UMXgviT1aFMVzcg8bT4w==
X-CSE-MsgGUID: 6rB2tV8/TVq2+S8wiEE74g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1231847"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1231847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:35:33 -0700
X-CSE-ConnectionGUID: ug3564B9Rnq4Dpqc/Yp/eA==
X-CSE-MsgGUID: sTK+7D4FRFuwH/TkxsTatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3502679"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:35:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:35:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 11:35:32 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLxLG2ebBVkQEP+ibBTZtnFBhJjEss9HVQ17Z+R0igh/ao7RfJmKiVnSdkRrS0BGTRTkJiF8auuwnVT3ose3tAMf3oDDmq+s8NF/wS4JpaAy18XRemlqw7szwHIDOGeyW9NFkIqajl8EcP7By0vNNturTaJMJ63ZDIuETRBqvNII8bP1LxdMgliMZhILCcb8jb3BwAfOPGRZczMOJZ3aBjRvzVwI3Trp5tjnnzHxNrE1HKQrb//T2ni5WbLluDibIHjsfPJhTkVqYHJuoR8w9YOQ/QMqwiDKtgzIi/VWaKBdsCcrT/JjUgeAajgUY9E28NdZv++gfWaJ5Yr5vbYgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT6KbXeqXwqrWEUZ8Q1WMClavK0ALz1QwmAx3VHGsHw=;
 b=GBA0Bl6UlRtEwwMtKra5nvT0jK42WV8gpc4Xcu/h8a/hEpFQZfrcvlx+7UUukvFrS4bqeTobq3amyvjDprIBQouMk/KqRU3YB2807EzRo4x8q4Bu6m7BmRrNnLbYmairlNsXHC0NO8b15tApILHnPm7qPud5JPY1SQoDm21ejsEXDBXfZ9xzqy6UjRWC3PoB9mTw3QS6cUZ1NKbOS5Lf/2uYkxCyJ/uZH35ryrVanm5H4yemfDdCnC4HLC26kdrkBkiYrz2zTzWunkubGsnM/jEdeWhsUmlN3wDJLOIp3Nhxr1zggIJfyKWXWLDHZ6zV6qzfFk7oJYDbbNg6mt8dGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 18:35:30 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 18:35:29 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>,
 <tilak.tirumalesh.tangudu@intel.com>, <vinay.belgaumkar@intel.com>,
 <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
In-Reply-To: <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
Date: Wed, 21 Oct 2026 15:35:25 -0300
Message-ID: <87cxt2ewb6.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbd28df-159c-450f-5c3a-08df2fa214e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261021123027099003|56012099006|260925021311599003|260925022911599003|260925021911599003|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: RPnOydAo/DdxZfHSe1jWvHa2g8V2ufc110siVBc1EXMB9E6wSuwkCSqyTLvGUVrrdGv3Yl2Rj+HNeSBAEFIzR/HUL/GPTJ1exgJmKMHDilxs2/gX81Cn7nMRlB/7RJ/gSnCB4lWGWOcMMeQMHDuhe72dMCPx4CKTINv4x0OLYCaFm3pvuqsgEsrRxFPO+1jj/ievZzust0EmH8N40VU+ixBZB6OzCGHeaJP3KRPck7r+wYzAN4tAM6TGKhRkNM4j/8PqARpw4a+opTundv0ITc2S1nKJsOK5hhj6SQ0L2/9XG7Icv7ENo7mI4uTMoY/WCDfkY3IKfgi/hipweJaND9ibq4xUsCscF5GuOA/OPWxjxSh+DPo7uGlr2XD8r+Exj37jCre14CEswZgtP9CYc8xbkThwNwi44D2uPxrxQuQQRHK4CffeyoVcM3QXHW/kfUzgF4hbsDvMAgeNO4BeJApRO3BpO89oqEWXYGMhBVAkBvxKzSMJj7GrSviVcITPl284lYKcZba8aAQXQ3K02H4RWjS+C7nQAANm7E2D/pwU4uoEs1O47/fV/IEFwMFOVHDbQVyLN/LRAjSY8OQaF2XN7M7CzbSIQ3mDEFSf0JijCbirIz3k5FoWlvNM4S3geClJitewwF8u8ukNZHcLb+oM0e/0DtnlM3Y8vUtql+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261021123027099003)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?te1215/EoAHpszt8DWgu1kLaTl7SfX7CgfIrxCUupeHYhQ9kVy2aNvf3P2o0?=
 =?us-ascii?Q?0Zjm2k+hlKp1DSJsN5B8k4AgYtAzpE06/ics7+DArdQwJKNiEvy0KE4ZJIn3?=
 =?us-ascii?Q?bNJwIKeEMFsH2XDw/+Fsr9zyruDlSSsFBjAKNjcIkB31nTTi2cPjiyv0yWTb?=
 =?us-ascii?Q?IcmpDyTa3CThyWhdO2rFHrKQR76gSn42fJ3ysO+EEOKKgtUk0KMDKcT5vkcb?=
 =?us-ascii?Q?GZZQnPaHJo47Xk1N1hu71N2eBRJoHY04Wm8QXcaSZepIk/WeFk6eyGfb4j3I?=
 =?us-ascii?Q?KuVtpFtVfFyZCqgJeU8pl+baOhKQMrFOxq13obfoe+snqviOREuGg2mRy5s0?=
 =?us-ascii?Q?GxonAeZ7iTuSzGrzFEpsPayg63pEcTHpjAggOe7gXmxEPZqwqKUkZ/tiz+F8?=
 =?us-ascii?Q?CVg6n1NH4MufEqZ5NjMxDH1AXUo+eorZh1dPtmQOgKZIMXK19GQ/DUwfkUza?=
 =?us-ascii?Q?l9iEZH2dTUMHL/zlRxMp66lOlxlCtaxrSvWiLT6Uy2GWyquA29qlEN1MB1n3?=
 =?us-ascii?Q?0VcU1dcHVTzXorzTs9LQnrS9u9gACZWJ7apavIqa59wCvnZilbkNz+ZKNG/d?=
 =?us-ascii?Q?8lBcPm2PWDLMbEeZc2d11qjT+CamZsdN1ETmjdxyOxZLCyIDG523W+ZXxMV0?=
 =?us-ascii?Q?OL9MaVkem4Yz/Kz0Ow+uTQQdFE2KKRSvX+3xu9CCRsPbDevxU/wyLH11yCBj?=
 =?us-ascii?Q?+RPo40NJJzFNUbXcIgYXW4y6ve75V2iD2QlVcotWp3T2LIjUpj1v7uLN/sbI?=
 =?us-ascii?Q?d1xj38en9GAI0yDsIoBTlCa3AgqC400FnUbIzRUWnh2GJCrNPHms9eWbRKMG?=
 =?us-ascii?Q?lMgmHdQL3IUspHm6dYejlK1QBkQEAjtYUeG6g46r3WG0N5LagvgaKJ2iXkKf?=
 =?us-ascii?Q?rjj6sVapPsWGnEoBMU9qXY1Xuv3v4RJR4q3YZOmWgHQw2T0TUVxUzfXVltOE?=
 =?us-ascii?Q?RSERXQta6RiPjSce0fKZGkipd5Jd1tgpg/N7rImMWYGe7kc8Zm2GuPSvwfF4?=
 =?us-ascii?Q?6WT6W1ZPemzk/fjoSKZe0Iw+WB23BMneBQqXKAqcJOnQz24jDKjr56MHqwn3?=
 =?us-ascii?Q?TEIpCJmZN/aelKDgkr9vxmlt2+/2i/zMR79HWE7CbGUrRyRY3cZsOTqeRWaS?=
 =?us-ascii?Q?yrMj9ytOBtQTQWzornF2/uoRcH9MQx3qeGFvEsOITlQZ2n2k9TIBKopLjqea?=
 =?us-ascii?Q?VcHFcs2/MUe04iy93VVRXR5RFV5H7KRsN9i4Qi6Q86kB8eiBOgvGm3xauWsk?=
 =?us-ascii?Q?DWZ3ZKKMyfWdMfurigoebMe1UD7jOWNOVRNM8OSpMIirmC7fUkdkYBd6l1oV?=
 =?us-ascii?Q?CWYczvQZ4gpwbfYVImq1Taq5sHUw8gBfKnyD1B5ye+Cs4SSH6Fne5boJL8Kh?=
 =?us-ascii?Q?qAU/JvSfDhHlM8QJs8GxK7AeBnyS4wnK5AbvI7oouG46+HO82lyV9f6rLiyj?=
 =?us-ascii?Q?eiW6+SPi5ssaKQVa1cvOVxnJTCkg1eUM1Z38Vi+41vNzRxK2kxtHgmZU0p2A?=
 =?us-ascii?Q?CcPAlQy1kpUMxyU+dIluv/CX5WyPpRb4n2Y7XAcpsUHtaEBdPhKKiN2plBG6?=
 =?us-ascii?Q?1hsSjg/6+m7aueYzaAVX11ovNxzoGyhFoY/Xu6TdmMLSeg6+uZLzBkrjuwhG?=
 =?us-ascii?Q?P1ck/Z1UrR/2H+pPxAIC2e5ngTD4E4PJU19VZ7yWnoA6POA2JUCYNYxXUguh?=
 =?us-ascii?Q?afck+pYmZc6qoETiBQEtxCIj/D8s78ueVMaesF/ADURKAAGypi2uYxsnvbqZ?=
 =?us-ascii?Q?Tq+86D4pfw=3D=3D?=
X-Exchange-RoutingPolicyChecked: YriiuIveY7VN1tzr6wcovE7Z2TEsZyCjAhIE4ftFJL4gij7mYsGIgWj3G5/MAAIm3oG2ifLTWsMGj37awLikdW1iM0AMCiYh6v27HTCI/087QHx3Gk4gqeu/UA1JqyiLZPr2COkxJTdCWPyxOEk5RKAbjTEQ8iSbrYX3ElP0xXbgbDVDD6RXn0T7dkFX+NdqnhsYyVQrc1RQzlexY19bSRrlu490MQY/k9v3HqlLxoahBmA5YGI6A1dBuXVejQ7Lq/7orQSOo1gB0WpO62OG3QOsWqJyxHdM1+CGorCxGUsLaQNFy8TWVw2kprD/EdCR4Tc3E4rdMZdfs5dznOP4hA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbd28df-159c-450f-5c3a-08df2fa214e4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:35:29.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCjbXQpK6fyzdppEtQjHHSA+KvoTZZmBg70Z/bxces5nWBEfwVJs0uaVVwfSjq1kIe/kfpCf6gvLpOU2d70xKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tilak.tirumalesh.tangudu@intel.com writes:

> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Avoid programming the IDLEDLY timer to less than 5 microseconds.
> Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
> and Media Versions 13.01 to 35.03
>
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>     Remove warn and other knits            - Matt R
>
> v3: Add verbose comment - Tejas
>
> v4: Restore IDLE_DLY register on engine reset.
>     Add it to GUC save-restore list. -Vivek
>
> v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
>
> v6: Avoid clearing inhibit switch - Bala
>     Refactor code accordingly by adding idle_reg_val.
>
> v7: Rebased with the divide-by-zero/overflow guards living in
>     a separate hardening patch.
>
> v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
>     maxcnt == 0 guard from the hardening patch. Round up
>     (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
>     so the tick-quantized delay cannot round back below 5 us.
>
> v9: Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
>     read from hardware instead of the Wa_14025941587-bumped value,
>     so it no longer fires on the driver's own floor. Re-check the
>     rounded-up tick value against maxcnt and floor it if tick
>     quantization pushed it back to/above maxcnt, logging via
>     xe_gt_dbg since this is the driver's own value, not a hardware
>     anomaly.
>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 93 ++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
>  3 files changed, 79 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ff8eee3831aa..58a3f6293ce4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		}
>  	}
>  
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>  		guc_mmio_regset_write_one(ads, regset_map,
>  					  RING_IDLEDLY(hwe->mmio_base),
>  					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d868af8e3301..9680d2a5adec 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -585,44 +585,103 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> +static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
> +{
> +	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
> +}
> +
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	u32 idledly, maxcnt;
> +	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
>  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>  	u32 maxcnt_units_ns = 640;
> -	bool inhibit_switch = 0;
> +	bool inhibit_switch = false;
>  	bool wa_applied = false;
> +	bool clamped_below_maxcnt = false;
> +
> +	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {

Hey, eveyone.

I came across this recently I was wondering why Wa_14025941587 doesn't
check for SRIOV as done for Wa_16023105232.

I think VF doesn't have access to the IDLEDLY register.

I'll be changing this section of the driver soon.  I could send a patch
making sure that we bail early if on a VF.

--
Gustavo Sousa

> +		u32 mincnt_idledly_ns = 5000;
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
>  		if (!idledly_units_ps)
>  			return;
>  
> -		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>  
> -		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>  		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
> +		idledly_hw = idledly;
>  		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>  		maxcnt *= maxcnt_units_ns;
>  
> -		/* Clear the inhibit switch without disturbing a valid delay. */
> -		if (inhibit_switch)
> +		/*
> +		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> +		 * priority if the two ever conflict (not expected in practice).
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
>  			wa_applied = true;
> +		}
>  
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
> -			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
> -			idledly = maxcnt ?
> -				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
> -						   idledly_units_ps) : 0;
> -			wa_applied = true;
> +		if (XE_GT_WA(gt, 16023105232)) {
> +			/* Clear the inhibit switch without disturbing a valid delay. */
> +			if (inhibit_switch) {
> +				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +				wa_applied = true;
> +			}
> +
> +			/* Warn only on the value read from hardware. */
> +			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
> +
> +			if (idledly >= maxcnt) {
> +				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> +				idledly = maxcnt ? maxcnt - 1 : 0;
> +				clamped_below_maxcnt = true;
> +				wa_applied = true;
> +			}
>  		}
>  
> -		if (wa_applied)
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> -					REG_FIELD_PREP(IDLE_DELAY, idledly));
> +		if (wa_applied) {
> +			u32 idledly_ticks;
> +
> +			/*
> +			 * Wa_16023105232 requires idledly < maxcnt, so floor
> +			 * that clamp; otherwise round up to guarantee the
> +			 * Wa_14025941587 minimum survives tick quantization.
> +			 */
> +			if (clamped_below_maxcnt)
> +				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +			else
> +				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
> +								 idledly_units_ps);
> +
> +			/*
> +			 * Tick quantization can still push the rounded-up value
> +			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
> +			 * priority even in that case.
> +			 */
> +			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
> +			    (u64)idledly_ticks * idledly_units_ps >= (u64)maxcnt * 1000) {
> +				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%u, so flooring\n",
> +					  hwe->name, idledly_ticks, maxcnt);
> +				idledly = maxcnt ? maxcnt - 1 : 0;
> +				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +			}
> +
> +			idledly_reg_val &= ~IDLE_DELAY;
> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> +			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
> +				  hwe->name, idledly, maxcnt,
> +				  !!inhibit_switch, gt->info.timestamp_base);
> +			xe_mmio_write32(&gt->mmio,
> +					RING_IDLEDLY(hwe->mmio_base),
> +					idledly_reg_val);
> +		}
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index dd69ad07f7a9..3001155f8d09 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,5 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14027054324	GRAPHICS_VERSION(3511)
> +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> +		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
> -- 
> 2.46.0
