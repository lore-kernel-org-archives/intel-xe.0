Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687ECD4F21
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D256810E1F3;
	Sun, 17 May 2026 09:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6k1BDuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06F010E1F3
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009885; x=1810545885;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UTvEcZKaQ+dk/CoBxy9uwrdEcBBuGChHhuu75XonCWY=;
 b=C6k1BDuyeXaGlpPSXEtW5P8JzPNTS87pYbuh0zanX4BBhzqlpROw0pt2
 h9GUNavKqGtAxyUa8MoSrf4eRtHZM5yplMG3OAMDT+RCYk0vdni/OcN7i
 pgbdrrrM8FRuncxQZnQ7Fj0o/XNvkjjr6rPVR75pmsJKCVYjMcdJUK+e2
 05tc7KqoPiNDbVdhDAHFzkUbyw9CNT7i8Wo4MbyFIb21Vy4cmj7YtzYkF
 JiBotYpgJAVR/sI1kydEn7ZcZaiA3s0bQ9aBw5jO1ZmvLsmrHe20S8sSQ
 oARJFmhkpKkFr6rFn+5eypHKD8pOFrrNaVtPzqahZoJCIm4fJ6HW/G3b1 Q==;
X-CSE-ConnectionGUID: icD9rKzPSWmyGCudrpfYaw==
X-CSE-MsgGUID: e3AouLHoSZ2+61aJu++ypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79937501"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="79937501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:24:44 -0700
X-CSE-ConnectionGUID: 9fRH5aQNSVmMeS5bo9Tq5Q==
X-CSE-MsgGUID: QfXNpBINSG2QBHeqwY/rHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="243441744"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:24:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:24:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:24:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdNXrKHjY0EZPlKUMvvASXnxJSPBgjFxWSXeVW7Qzt7ehunqLItWjIjTlxM/SUtLlgDspfxc0ZpkqW6LK6+J2tdJZLLzTTBuPQrTb4mm67Y/GeNQcNPWaQID9WY3UYOPvqzeIfrQ5OnJIe7bZ3CTvW1LiCP176JHAKFpT22qFO34ZR2MqQDEKrAH/xsa9UEWYMaI7OGXvvmw8HdItV9orarRdrPzsbXh6XhUGFDbJ+YI6M4IwnZB5atI/uhAMi6bAms1O1tbs3fChX9qn5pVGPhv1YGwjbmoS7lLG3ICm/vtX/xj6gP5S7xgc5NlrHth5V4cvzVBozC5pK41DXl2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38YOskbqkFcLBIIp5KL2qqNq4DvBz0+7Zqys4/XHjR8=;
 b=GQZZrg4Q9HeL8ovGNIjrS3BB3G8RYDWUUDfJtPYsNyiSY4qkFeEuMyt19yYAn+7JABikW3P3tqG7O+gOH7ckEhxGJ/Cmf7MzwFg7IoA9KSUAJJCG11PIHw1lTKiseKg0i2+SMVODmgOQ2Uu/t0uliBn5vo8jonUPq8FBUPreCEAD5RlgPkY+e9JEa17vgPBcgLlD2E9kBQ18lmugR5PbFeOzt45fHzaYeDh7+hoC8l5sbo99sAd3Q620s89Rs8hgmsIAzs3cFDwEn1hKX9NGYIryL31DFUFgQJAPmt+fDRczid1LqDNF69V2MYsFplE+q7b1Mpgz+v99P3NtIwDwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 09:24:40 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:24:40 +0000
Message-ID: <d83a63f6-3911-4c76-b236-32d734fd85df@intel.com>
Date: Sun, 17 May 2026 12:24:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/xe/memirq: Dump all source pages if MSI-X
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-8-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8eec88-3e9b-4191-51ff-08deb3f61f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|22082099003|18002099003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info: aVeIytl5fNGY4lX4X6qKULseF6DCJro/itVjdJEHn+U8w2AkNwbHfX4+IkpYVkwyamtZVHD7o9oG1gQxQwRYWIVA6qzoTe234HfWS7NiAR2CYRsLeA3iCXstraabXudlJyE0T4mWbXzuae6qgndjKtnFjaBYxRTh5xLkcBDLd3WgA/jmjiMfJw9Agx57L6kHO2NEu21zqF79hYP53HZtPj6zmRD8zl5oCxwv05sixSe0W2izU9idj0J223e4zmrZp4bxU1u1Yg5G7eaQXez/Pk+bhYAS681/Yzeo0DRa1b033RyCUZ2eOZJ5aKtm9/jBOQgCua1LFnhvokxdFrwf6+6RLzF8m5OMo9CB7+H/tVNdCW6hbogzRTaABLZPiUXPOCS76itqa2vIexO3oHjcxxR4cp7VeNPBGZ5Ux6Ac7KHEmB1JJizC8dLCjbCmuX8vGVeE11qWPi4JLBTAkUvZCIz3megp8lNtoUY1OZtSnx5bZvvUB2HZosurUapIXX5auyNmKS7aYkcPhT7M8VFn06o69hwh7/IiNgeWrnQX0FWV3mpOke8xln5zBdt6MK+oWobzxJMDicMQYNEhg3Ng9kEZuaEMVY9Q31lVjLteAIFRA5dgd4YLJbhnzEaUIfHPwih9NP7bp0HsYCn5M6YowaXJFh3qFLAzwFUNN0xLd6wvQguqyVNQCe5Z7XJ5G7pq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(22082099003)(18002099003)(4143699003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGkrcHk5Zmk2WWhOUi94SHl4US9mMEorMmUwQ1QxeGpJNEFuaWpFcGdvOUdp?=
 =?utf-8?B?ZE1vbHdpWkNNYmI3QVlrbWw4L0lJQUlaQ1VRM3YzWnB0VVR5MnpMMWg2azFB?=
 =?utf-8?B?RTNobGRYVlpINFVYZG1Cbkg3T1ZvcFluR3NOUjY0NmZ3OGVmeHVOYVdIam9K?=
 =?utf-8?B?aHZqWXN6empwdlJabVdYMmJQamdPeEhJejBUdElOR0lBdHRFdTdBeWJ2OGhh?=
 =?utf-8?B?Ris0aUFiblh1bGVUTW5uSitNRldSU1BOdEF3ZVF4Wm1Hbms5d25wY3ZUVkdj?=
 =?utf-8?B?bEQvVWQvTStJQU00WlBoWndtZ0M2dk8yN1BWaHpvdHhWNnFUY0lPQU01TGNT?=
 =?utf-8?B?NElIMGhvWkFMRFF4SnFPZFRmOGRqQVFYOURnK1A5RkF2aWdXQndHWVVjQXBa?=
 =?utf-8?B?aFkyWVRwQUNHVFF5R3FEb3M4dGtxK0pUU1RncjRKNExPbzF6NEx6KzhHMDZn?=
 =?utf-8?B?eFR4MkVGZW5KK2hnaUROUkZVVENjWTRqTm9vaDRaYUEvd0pWWDdQSjlic0p0?=
 =?utf-8?B?Mm5JNkw2QlV5L1RNVE9SU1VlbGtaWXV3MUdISnJTNUpjUHNCV0tiYWd1dm1o?=
 =?utf-8?B?UEt5N2ZzYkR2ZXc2NFpNOUcwUWREZUp6b0NoQk1yWWovdTNLVTRpMjlDak5y?=
 =?utf-8?B?anFTeG5GajdyMlNGa2Rwanh4YVdndlc1OENUUzVGNDRRWW16VEoxSlNkQTVZ?=
 =?utf-8?B?QmZSODhwbmVqYUtCbDZhYmdSMjFLUUR3T29zaytnWktYeXF6ajRkUjk2eU1h?=
 =?utf-8?B?akJVejB5akxpM1RzRkpnZmxwMUhncW5RR1ZiV1NlNUZHWUNnM1h1S3cvc0c0?=
 =?utf-8?B?elBhMVkzRFQyNU1qeEV5ZGpLTUFESXZUdXd2amI1VzY1VnExaGg1M2NKek11?=
 =?utf-8?B?MU5ScDlzQlZ3NkxMQ04yNDA1TitsUklXS3ExRCsvL2ZiMXlrUVdhNjlQYUZW?=
 =?utf-8?B?NmVXWnV4ekx5Y0Y5cEplcmh2YVRjOGZwY1FQVnFVOFFiS0szV1BEVXpoeTRP?=
 =?utf-8?B?cUd6UkQ3b014cTloMzRPajk3V1lpbENZeXdNV2toVGtaVEtoYXZuZXRsdERR?=
 =?utf-8?B?VHQxNStMYzE4TWpvTllMZmpQUmtDNE5lSmVVajB6YlBvQVpVZkNwYVRKT3FK?=
 =?utf-8?B?a01SQ05yZktzZUN2amFnNXc1a2g5Q2k5SE94cWthYnpYblBJSEQzZXNsSTRP?=
 =?utf-8?B?WGFoRnptUWpMU09lQkh2VWtHYS9tN0c0K21wSTNiK01IUUVveDNLeloyZ3JN?=
 =?utf-8?B?b0s4K2JHTUhIUVZBazNSZDk0WGtjbjFsY2RKVHBtankyQUZ6dHFlYTJvUFJI?=
 =?utf-8?B?RGF3VkZPNGxVU0FJMTFJQ25XV2RpbS9ZalQ2K0NCU2JnMXh5ZVhHVXg5YjUv?=
 =?utf-8?B?M2ZBcDZ2YzczMWVVem5Dd25WVFN3K2F2VThwclRZYzFLWG9abG8vV2pnL2Y1?=
 =?utf-8?B?QVJHSTFocm5oWXhvSjVMVGFwenRBV2plNkZoZ0JxTjM2d0RqaHhrbTJQekl1?=
 =?utf-8?B?QXJSK29TK0h2TGV6dDZPS3MrNTNZY0c5eXhrcnFNeTdCeEVTZWsvcDgyZWRx?=
 =?utf-8?B?WSt5L2s1dUdOVWl2T29JbHFYejQ2WCtzUksyZHhMYkROR0huaVVvTHJiVE4x?=
 =?utf-8?B?OWdIbEkxTy9pbm1JWGR1c1I2M1JLa2VRbW5Ja1lnMEVVZ1NpZ3pQSWQzWWJN?=
 =?utf-8?B?amIrWXpDVmpxUUZVbzdLdktjS0Y4aVJ5TDhzRmVXWCtiLzFIdzJuRVE3azY2?=
 =?utf-8?B?ZTU3NThib1RPcHB4RVBFLzk5aTR3NWdIZFhha1RnN3RpeGRlcEphR0JQUkpt?=
 =?utf-8?B?SHgwblExZmt5RG9wSUt0cHMvWENrZDFwMDdoci9FaURNSVJkejRmdjlSSmI5?=
 =?utf-8?B?c0VNcTJDRkJhbHhFUmhDWFY3WGtqQWFPZEg2alJjbXc4ZDR3RWw4ZU9RclJU?=
 =?utf-8?B?TWVHUUgvNndnYUlqZHZTdkUySHd2Nm9NOS9DYkdLMktpYWhqb2txdlhBbms0?=
 =?utf-8?B?V0RMVGZobitWRFZ1cDNIUkl1OVVrdVF3cHNsU01zamJncWtSVFlNY2xaL1NC?=
 =?utf-8?B?NVpjVjI0d3ltdTVZWEdQc1VIejZIQ3RSZS9zNXc1VHBKdkJMM1RFYk4vUThs?=
 =?utf-8?B?N2ZWZkV1TG1XT0UxZzd0VjAvZjBkODM3NHVjWnJwcDZXUUlrYjVmeTE3V3pM?=
 =?utf-8?B?eUMreG9PVkxlNEd1akdhT2Rib2FOQkJjcUpNVElFUUQ1LzN2S20yMnhBcjFa?=
 =?utf-8?B?UGgxWVN1TmNLVU4xbDNlTlhzcCtxMEZtbDE0bDROV2J4SGh5MVNweEQ5Q0tQ?=
 =?utf-8?B?MmttQVlKYTVzbEpxVTZLc0xaUjFNUjRCOWNSZEtYWStlSmFkbTJIZz09?=
X-Exchange-RoutingPolicyChecked: XXKSaU7HiavEpO5LaG/NW5KTIjQ49eJZVdkK/NKHp3AX30P2sEKQ/I6aiPM5VA5ETVyBUoJhdzM9rZC8XpEW5yBtMfdB+pCeRUI1/7+Ln3Wjalx/Kws+hDZtM8DdI7pzqzZw69GLFqEJC1ICEx+HSDNAH2iNWhds/R+7zO164Xqa4qTOaAK4+3zvKrUqWApwdJIne815ySUSRxwcio07P4y5RJ1xV7ZXFhH2QFx4xBqflPAvHQZldtnCR/FfV8mOi7bR9dXqP6OK7wiI+rsXB7TjTm9JSe+X5rvsmUkc0ktWRgHKX4kTmKL9HrUFy6YzpwXujo3qnk0knbEq5I4QLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8eec88-3e9b-4191-51ff-08deb3f61f63
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:24:40.7385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj4ZnAJgJAWhsW6wpX7ENvT8H4bAuikIeF3u5wvxDNSRrPbuWF3b4KToHWMVaB7DvgjSg62APfDDj5mxxXvbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> When using MSI-X, engines report their source/status on a separate


NIT: on separate MEMIRQ pages

Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> MEMIRQ pages, so we need to dump additional source pages, not just
> the first one.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c       | 18 +++++++++++++++---
>  drivers/gpu/drm/xe/xe_memirq_types.h |  2 ++
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index bd2417207b0b..7bc7dc106a79 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -221,6 +221,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
>  	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
>  	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
> +	memirq->num_pages = num_pages;
>  
>  	memirq_assert(memirq, !memirq->source.is_iomem);
>  	memirq_assert(memirq, !memirq->status.is_iomem);
> @@ -532,6 +533,18 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
>  				       guc_name(guc));
>  }
>  
> +static void memirq_dump_source_pages(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, !memirq->bo->vmap.is_iomem);
> +
> +	for (int n = 0; n < memirq->num_pages; n++) {
> +		memirq_debug(memirq, "SOURCE %*ph\n", 32,
> +			     memirq->bo->vmap.vaddr + XE_MEMIRQ_SOURCE_OFFSET(n));
> +		memirq_debug(memirq, "SOURCE %*ph\n", 32,
> +			     memirq->bo->vmap.vaddr + XE_MEMIRQ_SOURCE_OFFSET(n) + 32);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -551,9 +564,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  	if (!memirq->bo)
>  		return;
>  
> -	memirq_assert(memirq, !memirq->source.is_iomem);
> -	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
> -	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ))
> +		memirq_dump_source_pages(memirq);
>  
>  	for_each_gt(gt, xe, gtid) {
>  		if (gt->tile != tile)
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 02ac938cadb4..eab384342878 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -14,6 +14,7 @@ struct xe_bo;
>   * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
>   *
>   * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
> + * @num_pages: number of per-instance source/status pages.
>   * @source: iosys pointer to `Interrupt Source Report Page`_.
>   * @status: iosys pointer to `Interrupt Status Report Page`_.
>   * @mask: iosys pointer to Interrupt Enable Mask.
> @@ -21,6 +22,7 @@ struct xe_bo;
>   */
>  struct xe_memirq {
>  	struct xe_bo *bo;
> +	unsigned int num_pages;
>  	struct iosys_map source;
>  	struct iosys_map status;
>  	struct iosys_map mask;


