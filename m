Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA16C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 20:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102210F918;
	Fri,  3 Jul 2026 20:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gssRmCEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07610F918
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783111660; x=1814647660;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f3LIReDcs8mzFFyHGWKMgu/abZ15JI8Qq2/x61HY3Sw=;
 b=gssRmCEnZc2ap5HIfQhcGBTmDqD7w4khH0TJd+9Nn8LyJH2C/rRnEIZR
 15x1z62C2W6Y5czlCksnWWvyjNlv2M0eLTZVjJIXeddTroix6Xs0iQYA4
 TG7i9naUvrASyeS4/z5B7Sj4/Rar5b0mgp+nszL9jhDQrt6SsEDv4/CDt
 EUQZ1K0h2MpQmmedmbnW5LS/HXccks/xfrZwVwEPQbHLxeWfzq+gre9c0
 KsxMPQkXuJhkU7GZQfJLoIsferTFGii7Hl85AyrSRoFQWEoYWx8Fa5l2U
 Jr3JJM0Ta0HC+cwylbWaBGsZs/PGzz+q/U8ByR2NjGoPKAr5+KTsLh9WS A==;
X-CSE-ConnectionGUID: Ob+45VDzSyKENuLq7t7Hlw==
X-CSE-MsgGUID: CYX/bSeOSsatyVM/EwWucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82966236"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82966236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:47:40 -0700
X-CSE-ConnectionGUID: G5u4+SeJQ7m4tkWDob5j6g==
X-CSE-MsgGUID: C/aGONHYT/eNS0oHYK59Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246810690"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:47:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:47:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:47:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXd71Dc0NsPyYITOpLk0xVcF8jQpU1g1KH6yueUEJzSwp9Emlm/zYPHXDKZZ11TDXX67CWwKQX4EzaPp0rv7UDEht5zXFdV02VInpvse88BhpnqoZXctDJ6Z6j//0947Ihlimnjh3sEZflns2YDXR43Tz71jYhtPITp4OObV6a06sSBt811ND4yqRawJhBG5hj0dw7mfJWdGs27dkE95W2XLWAfw8E1u18IZZQwVwNG/6B4QdvbWObSzZ+lM76IzLZgwTk81XtZuawHB1bOmZp2WFGDzAwLVT0BVetgfk3pVSZC8tLousgq/jmVn/KUFHobiZBEtXz+bLFaxJ2FKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW+PZn2NUQzbagX8SayW9AB7Dc/wnQFJiUD3Kw2in+c=;
 b=s8z+ow4/pRM3nXNHjCnBNDfC9xURyuk1J+PJAfVLV1OSMYt/HXY0AJvcdnzFbCSE0lbFptCgwEKI5q3iSP9Ec63AeqrSsQR8J03/EJ9gm1DNnk81TIw5uAeRvu1h8QRnlqWkF/JKlhva0xEROIVE8n9wKoxXDhN1wLsWqbB8w1/PQGK258cdw8DvKpOf6Fu3UQbjPSJbHlOV6ztN+gfGcSPEYDHp6I4gx55DTxxpr5NInDZ/SyX5yAXm68EDKbQ5fV0TVFqgWEj7bVLST+SMnL0GyFThDmj4ivt3pDlSMbQoJ6IvnNxa04MVgwFavRXyvw1AZvJpRnRpAOPbj/5JRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 3 Jul
 2026 20:47:32 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:47:32 +0000
Date: Fri, 3 Jul 2026 22:47:28 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] drm/xe/tests: Add object encoding helper test
Message-ID: <akgfPCdZU8bXmWL9@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIVP296CA0060.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::14) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ee20cd-c354-4377-ae19-08ded9444dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: +RJ9gs1kbyKxModtIi8gAABRurmSJUWWWVXMb1/ho0F9OpTzhK1ncIWZ0/2cid1krK4NMSMcys2JzPVr8/QT7NqejGh0twUtE7tLuXrSf9sVg9f/x071CxlJ/80L1LmcG9KM2TrifkiOph7pY8BgoiY/T2a/cqdGM6vyn3isno52M5jD54aHojJwzQxMMV29MnbZohN+YyioSylB47CVBwTfmlHbgA2PPEmYTVZ9jXHw7uyl+B7h3LAWa7v79IL0ha+m1PlYV6fxd1ppn87gRnuOfX3ew7KLIewza0rL4ZX23yBfvC+BhfgYFFhlIbnnQpgqoNtExd1PoNOp9CbZ6OrFxClATm/VtHjrrlcJozJhIk1VNnx832Jfl1Xr1n7PSt6wukQHDPQ305I5wknT81QzCML+HwWxQ0vpxTn9+1t4xGQsiRvXHh6sgJjWk4QBLQ4aQ5207rbd1EImcb/bpMes3PRGZKx3ScoE8Lcef4fB+SPD2C1A6/csbv0Vu0ekvWZ4ubxCVf903qrR0dQikQgfWfjcmNBKDSz46CTZPXLeFhX5e75A7RYhUWjb1E53VNVYKcbOZ7ilRevn76YbEjtufpYS8f67loVBAlASdBdO+4laAr0KEgShpUKq8hold42+2gW6LHuOE70APVk73GZGy/g2nR3uOdmFWuCcWZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTc0cDAzd1dzMzN1ekRSSHA1c2dsZ2VoTitUYjdXbzlUbTlkWG5EM29JaUZx?=
 =?utf-8?B?STk0cTNCM1dFTXBYSnRHNmQ4NTYyOFUwSXAyeGlQUmY5c0xQdjRwd3ovMlp6?=
 =?utf-8?B?RE8vWmZhZmhPaFliYXNwd0dRNEVqL2ZBQm5udlNrN3J3Q2hGMm03ejFjNFJo?=
 =?utf-8?B?VEtYd2dSZHNOdzFSdnJSWThodXZMcUtld1BnaEd2cWxEU3UvaVUwRzJzaWIv?=
 =?utf-8?B?WTZhVi9SUDJOd3RyU3RIdTN1aCsvVmt5am56VGh6di9UYW9BVXZKOFBzQktQ?=
 =?utf-8?B?SGxFZ2twWFg0MEpRckZMQXRTK1FBcVdFVklPY0l6bVlyWEg1VVhDNE1tdXFU?=
 =?utf-8?B?VUpobm5qaXE2ei9YSnBTSWRmUEVFQWZMS3R0ckxsY0c1SG1OTmluVnhKdUNB?=
 =?utf-8?B?YWNTdVByb2NaUFRVejgzRDNwSkNmY2JsTk9kU1lFSitKM0RmKzhDUXM0NCtC?=
 =?utf-8?B?bUJwMzZzVUROVENEbnRFc3RmZ2p0djluSHd5ZUEzZ1IwVjF2dGJId2VhTThB?=
 =?utf-8?B?ZmNxMTlVbnhtSzBHeVEvOEVFajlIU1dvcHV0RUJiNm43aGVqc1F2WllGZ1Zv?=
 =?utf-8?B?S1lIeFJnV1U3UVMwdnVlN2t0bzFwYnNOcEhtQ2YwZzBCK2wvZzFoYm9hWHZ2?=
 =?utf-8?B?UFZFRWZGRHJXSW1Sa1VYU3E4ZUwwOFBrUVp5QzJXOENicHpsQ00yTW1LeXhV?=
 =?utf-8?B?OTBtYnZ6Tnl3Q0s2djhSN1FTVW1uKzJFR1AxaE05b2V3ZUU5ZnBEK1JNdDJW?=
 =?utf-8?B?ZzlrTklDd3RSeXZOMStrL0VBWGVSb0FvKzF6dElwU3BTdm1pNXFEWmZBUmtV?=
 =?utf-8?B?ajc3L0JMNGVVNXRxUncyRDRWK0lBT2UvZGw1MnEvZ0FlVmg0QzhjckQzaVJU?=
 =?utf-8?B?U2dGbzJtTk9MRVNWaVE1OTVVaEFkMDZ3YnNweTNoZWk2emRoNVN6ZW9Genh3?=
 =?utf-8?B?Z0w0RStxWUtzenJCVnZ6UGJIaVRiS3FOS2QzR0Z5NWdOeURDcjZjdCtKL3ph?=
 =?utf-8?B?QzEycEZnMlRRbkd1QWt6eVZSNGFLWmdhZTBycEtNVStJeHA1MUxJUytqZ1Yy?=
 =?utf-8?B?SkRnZk8zbCtFSjlOMVg1VFREMDJaYUcwaGFXVnQzZ2djd2lZYkhOUGtvd3gz?=
 =?utf-8?B?RlZFUTBCQkNYQWNpbDcwNitQVCtYaW1hcWN5VVlkb0ZSTU5Sa2J6ZDRBWjNw?=
 =?utf-8?B?YzZ1MjNZMHUzQWJEU3RIbkhUYmZ1Rzc0d28wbHVQU3ZnM0NwcW5JbGl5U1V0?=
 =?utf-8?B?QzVPWWpYdm15dmtUZk5BZVA0bnc4NzRqVkFEUVFhc3hFRWUvQ0V1dUZMV01s?=
 =?utf-8?B?QVY3ZEo3eVlVUjZCU0dlWmhSRzE1SE5rNkpHMjg4aUdSMjhhS1RFc2NXQkly?=
 =?utf-8?B?UENQc1VUL2VlbHhKT1FrK3VhblExNVVFZ3BuWmRnaXdVb1hUbkU5eEFxMjZs?=
 =?utf-8?B?dldMMHRIVmRoelFKQUNzL3FCdFZtR3ZUZms0Ym1wNFR6V2JZRklscHlxajJk?=
 =?utf-8?B?aVRTbmZvczZvTmpXS1k4M1hwUWlhTVpMOVFnNkxnWjI2R3ZuY1piTElIU1Zj?=
 =?utf-8?B?UUpyc3QwaEJ2b1V6MEJzaHFaRE9OamtGZ3RCeXRZVnFod1lOUU5id29jdTIw?=
 =?utf-8?B?V0xIczlUc0d4NEY5QXRBMk9EMm1LOS96M3dYN2NiM1VwY3Qwa1NWM1p5Y0tG?=
 =?utf-8?B?NU9ETE1nd1ZZRkZKSmp1K09pWkpJN0dlZlVGU1dpaFhYZlQ2ZjdyWkQrN2l0?=
 =?utf-8?B?Q2ptYTI1ZkhOTURmNXhNdndQN29FT3hDUnlmWkFFdE9PdXQ0dDU4Z1pzYXcx?=
 =?utf-8?B?NkxHelJJVVl4K0pnd1dlL0JkaEs2VjlaVGExVktUOENURk04UGpsMGJpbUNy?=
 =?utf-8?B?aXFTZEZOUGFEc1JQQ2ozRk9RTWFObytIWFJFNFRSWFJjVzh1d1ZLd1ZsWjV3?=
 =?utf-8?B?WU44OFJFRVlubmhLQ0M2YnRacEZhaFFLTHB5Z2pQWlpodVNqakIyMnFKTVVv?=
 =?utf-8?B?NVpnNzZBYS80ektveE9lVHVscWpnUjhSY0RSYldXOWNUYUJaTHp6NjM4YUhk?=
 =?utf-8?B?M1Fyd3U1MUVlTnJxUnhkMlBLNUJxSmJtcDU3UWJFL2x2eGZ4UVpFK0xpczEr?=
 =?utf-8?B?ZDF4a3BZaWdYcThjVXA2S1lubEhzY2VFcUowREdaV0ZCVk9CYjhKZjcwWmtt?=
 =?utf-8?B?cUlkcURtaXI5WnZHUlFUajVlR0R4TFlOak4wd0xLaWNZMTVpLzA4dk9pcVkv?=
 =?utf-8?B?Y0YxU1BDUVVDVlRqQmkwbjh0QXNlTkl1NDRXOU41VThMMVhQMFM0VEpZc05P?=
 =?utf-8?B?NjhSV0tCbXIzRHJaa0pPRENob2t1ZzBiVDFmSnI4cGUyVUhHRkE1bk1lZEh4?=
 =?utf-8?Q?V4sptXxQoB8XEUco=3D?=
X-Exchange-RoutingPolicyChecked: N5RdJExEaoaSq89XCPAPMlOFVC7A4C05hZa2xyui4pi83dz4mv2yoEid4k7ziaVXKr5DGBdtmteTq9TvnEs0LJWT2KSNu21fjZ2KqH7YTxZTLexnJo7Zz1FLIMxfMv6ZJaMsBreO9fM35rIhK9/fni1NrPGlZXj+Ti+x2C5BmNeM96QjhB5Z3h5ql1J8h1ZNTwD6YozIDdSI+x1r/YTK71ctywZJ3kN2ThXdpvmgZq/lHHuwH4vmby2ulkdwgJG6TppMAl2Vf51qbrT0mv/pd7Pqa/2dtNxyWlJR/315UQ8T5YtHagYft1NqqQB+GIEvVA3zNY13VXTpLDq7GMblWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ee20cd-c354-4377-ae19-08ded9444dcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:47:32.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvH0yIRNEVeKGKCN9ALDU8AdQ1HzLiM0IsEj87gg/qSDseS9r8oiiweBBzDDx+Uzt8TfTth0JO30XNlK0nTPmQmkvyVi3tEzkyV53wVYmoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

On Tue, Jun 30, 2026 at 03:26:29PM +0200, Michal Wajdeczko wrote:
> We will soon be encoding complex objects as KLVs using our helper
> function. Add few simple tests to make sure this helper function
> works as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
> index c2d5f0098816..9a8acc85e9f1 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
> @@ -7,6 +7,7 @@
>  #include <kunit/test-bug.h>
>  
>  #define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
> +#define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
>  #define TEST_PAD	0xdeadbeef
>  
>  static void test_count(struct kunit *test)
> @@ -129,11 +130,172 @@ static void test_encode_string(struct kunit *test)
>  			    xe_guc_klv_encode_string(failed, ARRAY_SIZE(klvs), key, string));
>  }
>  
> +struct some_object {
> +	u32 value1;
> +	u64 value2;
> +} __packed;
> +
> +static u32 *obj_raw_encoder(u32 *klvs, u32 avail, const void *arg)
> +{
> +	const struct some_object *obj = arg;
> +	size_t sz = sizeof(*obj);
> +	u32 dwords = to_num_dwords(sz);
> +
> +	if (IS_ERR(klvs))
> +		return klvs;
> +	if (dwords > avail)
> +		return ERR_PTR(-ENOSPC);
> +	memcpy(klvs, obj, sz);
> +	return klvs + dwords;
> +}
> +
> +static u32 *obj_klv_encoder(u32 *klvs, u32 avail, const void *arg)
> +{
> +	const struct some_object *obj = arg;
> +	u32 *end = klvs + avail;
> +
> +	klvs = xe_guc_klv_encode_u32(klvs, end - klvs, TEST_KEY + 1, obj->value1);
> +	klvs = xe_guc_klv_encode_u64(klvs, end - klvs, TEST_KEY + 2, obj->value2);

Sashiko spotted that we should check for errors between the encode
calls, and that's probably a good idea.

With that:
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> +	return klvs;
> +}
> +
> +static u32 *obj_nested_encoder(u32 *klvs, u32 avail, const void *arg)
> +{
> +	u32 *end = klvs + avail;
> +
> +	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 1,
> +					arg, obj_klv_encoder);
> +	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 2,
> +					arg, obj_klv_encoder);
> +	return klvs;
> +}
> +
> +static void test_encode_object_raw(struct kunit *test)
> +{
> +	const struct some_object obj = {
> +		.value1 = 0xdead1234,
> +		.value2 = 0xdead87654321dead,
> +	};
> +	u32 payload = to_num_dwords(sizeof(obj));
> +	u32 *err = ERR_PTR(-ENOSPC);
> +	u16 key = TEST_KEY;
> +	u32 klvs[16];
> +	u32 n;
> +
> +	/* too small, must fail */
> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
> +								 obj_raw_encoder),
> +					"buf size=%u dwords", n);
> +	}
> +
> +	/* must pass */
> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
> +							      key, &obj, obj_raw_encoder));
> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
> +	KUNIT_EXPECT_MEMEQ(test, &klvs[1], &obj, sizeof(obj));
> +
> +	/* already failed, must fail */
> +	KUNIT_ASSERT_PTR_EQ(test, err,
> +			    xe_guc_klv_encode_object(err, ARRAY_SIZE(klvs), key,
> +						     &obj, obj_raw_encoder));
> +}
> +
> +static void test_encode_object_klv(struct kunit *test)
> +{
> +	const struct some_object obj = {
> +		.value1 = 0xdead1234,
> +		.value2 = 0xdead87654321dead,
> +	};
> +	u16 key = TEST_GROUP_KEY;
> +	u32 payload = 0;
> +	u32 klvs[16];
> +	u32 n;
> +
> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
> +
> +	/* too small, must fail */
> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
> +								 obj_klv_encoder),
> +					"buf size=%u dwords", n);
> +	}
> +
> +	/* must pass */
> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
> +							      key, &obj, obj_klv_encoder));
> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
> +	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_KEY + 1, 1));
> +	KUNIT_EXPECT_EQ(test, klvs[2], obj.value1);
> +	KUNIT_EXPECT_EQ(test, klvs[3], PREP_GUC_KLV(TEST_KEY + 2, 2));
> +	KUNIT_EXPECT_EQ(test, klvs[4], lower_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[5], upper_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[6], TEST_PAD);
> +}
> +
> +static void test_encode_object_nested(struct kunit *test)
> +{
> +	const struct some_object obj = {
> +		.value1 = 0xdead1234,
> +		.value2 = 0xdead87654321dead,
> +	};
> +	u16 key = TEST_GROUP_KEY;
> +	u32 payload = 0;
> +	u32 klvs[16];
> +	u32 n;
> +
> +	payload += GUC_KLV_LEN_MIN;
> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
> +	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
> +	payload *= 2;
> +
> +	/* too small, must fail */
> +	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
> +		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
> +					xe_guc_klv_encode_object(klvs, n, key, &obj,
> +								 obj_nested_encoder),
> +					"buf size=%u dwords", n);
> +	}
> +
> +	/* must pass */
> +	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
> +				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
> +							      key, &obj, obj_nested_encoder));
> +	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
> +	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_GROUP_KEY + 1, 5));
> +	KUNIT_EXPECT_EQ(test, klvs[2], PREP_GUC_KLV(TEST_KEY + 1, 1));
> +	KUNIT_EXPECT_EQ(test, klvs[3], obj.value1);
> +	KUNIT_EXPECT_EQ(test, klvs[4], PREP_GUC_KLV(TEST_KEY + 2, 2));
> +	KUNIT_EXPECT_EQ(test, klvs[5], lower_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[6], upper_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[7], PREP_GUC_KLV(TEST_GROUP_KEY + 2, 5));
> +	KUNIT_EXPECT_EQ(test, klvs[8], PREP_GUC_KLV(TEST_KEY + 1, 1));
> +	KUNIT_EXPECT_EQ(test, klvs[9], obj.value1);
> +	KUNIT_EXPECT_EQ(test, klvs[10], PREP_GUC_KLV(TEST_KEY + 2, 2));
> +	KUNIT_EXPECT_EQ(test, klvs[11], lower_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[12], upper_32_bits(obj.value2));
> +	KUNIT_EXPECT_EQ(test, klvs[13], TEST_PAD);
> +}
> +
>  static struct kunit_case guc_klv_helpers_test_cases[] = {
>  	KUNIT_CASE(test_count),
>  	KUNIT_CASE(test_encode_u32),
>  	KUNIT_CASE(test_encode_u64),
>  	KUNIT_CASE(test_encode_string),
> +	KUNIT_CASE(test_encode_object_raw),
> +	KUNIT_CASE(test_encode_object_klv),
> +	KUNIT_CASE(test_encode_object_nested),
>  	{}
>  };
>  
> -- 
> 2.47.1
> 
