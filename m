Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B2C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA13B10EC0C;
	Fri, 19 Jul 2024 16:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiV4sRY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED710EC0C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721406746; x=1752942746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cEoc43cRujD2M/XMjINwhg4EMIJbq08GarUrjXvSngc=;
 b=hiV4sRY3p8jijqdnzY7erbHRi3zbSwUTdbyGildm9n3Xr4mkLrYy0bM6
 q+jxNP9XgjOxgAywsMQiAazh1iqibRQKfFTSevqL+rpXkTTqUAa+5sTgb
 837l1DeLypmtBbhMQ24gdhX3TfkjcTArrDyejR+qpT/eGWm1U2VUb7e29
 IkDzg4aJKl9Y3ZqcSuwD2S72AfVtsW/2Ag5iWQqj6LiJGezQs3nZWG9Nj
 VfyIkV0VMuA48YUKMgCf+Xwp6Abhhfs8E1nQIwgfzbwr6lvOGpJ4k1TTr
 UlrAZyipFDtT3nOf35vy6pRSEYDaXEAysD2bFh7wJKqe4aXsaZK1WxFfq Q==;
X-CSE-ConnectionGUID: on62qU0FQUO87JjbHvCNoQ==
X-CSE-MsgGUID: WIc9TxquTCGBUxTRfspFbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18731473"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18731473"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:32:26 -0700
X-CSE-ConnectionGUID: vQS9GillTnKpfmzfjdodaQ==
X-CSE-MsgGUID: VuWKh0UiSfieTRaMM3ZYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55360499"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:32:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:32:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:32:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:32:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNnoCAP74v5yeV7YZjrH7+VNITmlL+TxkocSB6HPxLYpuPxpfaXSfv1Mw0KuAJpe7/ecAmKvbQuWwU6lEtezRIZFo8UfawKNce0nZes/9N01NJ39szv5Tq97QfawG5wP5bp0nAw1nGKwUt7WIPD8qz2eb+abLEv9X5A0VXZlWdCVFqA2x4erRI5W34FBuumXayjjddkJYd02Xqx71edlA42CXjr3LErerPdg1UhN65YGzevotjlLruHoKVq1L0ZOio3S8o974K99ZrpenMGaYcyaAe5YgXdWuqefCdPXFStikEG+QQFAsjXtw+8Y2UWhBe80ziN7I9qRCweqfSfgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/sHWR2uMNtfAiHFUJUysMfn22luRIkLug32Gbr5jqM=;
 b=jEE0pFmaW7R3PVV0SoOjx0wuTrxorwhBoPrISVjGI0LlY9paqXUboJu7XepRuR/IalwW0aHftMLAxAAwd23pDfIb+9B6K3MpQX+G500Dc4sCsqDjHRQv6PKEwIemLAcOw0Twvf4/mTEOXbsG6nd1D8cuzgBmxFIKjcJX0smNcmNmicvP++Ym2X+lDLkOgw4dAHM+yqfCDNhUi1VowYs/HV7CKnLwIr6B4bxYSutPAjMvci0PjIeMl4Y0kayVTt0XHBvBNCj3yjsJWt5Bnu+H5FOMppgDggTMX6E8HpUB1YJ+dLyYDsbOTEctkYcj+dudrMZyFbWRh1UpUoBi59lwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 16:32:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 16:32:21 +0000
Date: Fri, 19 Jul 2024 11:32:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/7] drm/xe: Introduce const cast helper
Message-ID: <gs32gpbe62ph7j3l7akrrtcc4z2wr3kv7xnezb3szwedcaezds@hohvqsmqilc2>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240717195155.442-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:303:6a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 444784cd-e03c-42a4-9a2e-08dca8105cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DES153Haj0g8cFoXP4WzzLWdUWJB2Q+fwpdvnB25UGAI8tdlJHzRAlzmsVHa?=
 =?us-ascii?Q?OxmKY5RJphpj0aEWtMBQYGgj3E1K3IHxKfCpxSfT3EPTpGpiNXT9d4rwfr+x?=
 =?us-ascii?Q?s1i1jVCce2drEVhsKtPlTHWL+ejI+2B50lbJ/6he7MY+BLkeSzu5fqC+LC+v?=
 =?us-ascii?Q?Bbic7MBbZHEU8DjNl8gs7bjh7+xC8drTyD3YM22c4aDfAnhqcoXyO0C9dlAF?=
 =?us-ascii?Q?Vng8x2zFQIqoEyvi5dSKADi/A8TKuJFMUw0nDcgexF0ht6TGPBzNGRaDyG+4?=
 =?us-ascii?Q?e6tzvkprpPuOLWzONVM3oYAH+HuhBlv4L0sni1Sdd5NFfZX92f0my1pMWbc3?=
 =?us-ascii?Q?AiOMIa6rM1LaNJikCReVs7PlRoh2ghA/Ac7yIbPoirFyKvv+3Av3sfgcuW9w?=
 =?us-ascii?Q?DN6k1iLkWMlUXHDNvL4p/JYaVpuKdJTXJ5tkIyfJt+dVKH4xFLjQY+0+xyy1?=
 =?us-ascii?Q?+v/2h/qIa/onxwSY14zrq1GFJq+6gkDYFzi0V5VYD4IZd9EdSGyYemSIlpZw?=
 =?us-ascii?Q?6SyKK/5xGMHawYpBLei3KXpxshQFAX/g4quoyHLP4UIe5FLq81jPWXNF5QYo?=
 =?us-ascii?Q?ipYneIB/2WDg3P0AJahCLkDzP2LhS6EIMmB2j93U9k/7BklpBHoKyV24MNBp?=
 =?us-ascii?Q?jApnxPHLLFSpHY6LoVDusuvAVFfdHMzXqNup4uHKnvhbFdmRmKUHkR6K9OAN?=
 =?us-ascii?Q?ZnYGIzOcLbMWEC73PvNXQTCImFc+ym51DxQ/fGfFS5XmximhzhzyBYTs+WJL?=
 =?us-ascii?Q?Twm76YmDTb58O7vF2USR5JT9cyubmg0TXFgQ73VQSWULRGho5UfzvC8koUWW?=
 =?us-ascii?Q?2zs70ZtBwiXj2QZavZgNLdCtrHVClp0ou2ijlnWbJCU40AJJ1wHveh8eGWt8?=
 =?us-ascii?Q?Hj0gDIuUhjiY+4Lh7d8SxanZhSr74Aq949QX1icllvJ6VChfa0gsXhhrjLx8?=
 =?us-ascii?Q?IgjJ9KXgHzlcch5q29bQBOyV0s/ER9J4WSCb346Ll+6yQqZn7z2RKf3My/Ia?=
 =?us-ascii?Q?m6oAVKJ281Ee6jnDH2g9Jp2B+gu8kudGqkfz2QNTWolKYs3wXw217ir/9TXa?=
 =?us-ascii?Q?2xeG5jTsinFu+LeE2imewOLJ0NycFfInl+iF5LXVjTkeyj8tW+K7Ebw4DPMC?=
 =?us-ascii?Q?fxwdPTiQ5FdpNqWeHOAtPlGwBG/CC5H0x0ks0Lt8kAgUI4MokSuQCK7AHBin?=
 =?us-ascii?Q?9cvuqhcGZ0v8gPCoSItO1TGd/pRwk2TEG6k3sb1mGw4VzHBdg7jwHJtTCoF8?=
 =?us-ascii?Q?banEvRs7zcUSqoXktWoeYPppKRgr0r5zFoN7K5X9gG4dm8+2E+qaqcBwvQI1?=
 =?us-ascii?Q?aYlEw8z+f+gFdi6Q4+yiTbv25GEVbfiH+rMmiRsKmTUYzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iq/rHl1U+KmKvVLVZB6JOM7bywHusEtmsV0ZVocd1blxPjH6gxkXS8CzWRIg?=
 =?us-ascii?Q?66WEKXfoviyoJ7wk6D8awMzPuPDAkPwRHE78g90kv4RbVlPyKW+gt/r6zZ/P?=
 =?us-ascii?Q?9SuDQxeMj2nRYBZZITOhuXwZqDYXUdbozfTDygmegRIzjdorlHuduvrHsztA?=
 =?us-ascii?Q?boM2YBFAoALTYvbzPiez/0MV32KZfrQQHkPyU8gvhCWret+Ikw1E3/4zwFXD?=
 =?us-ascii?Q?bgXeCAGhn6bSo5TjkCYlAz6/tU02n1LQVUOV7Prz692LlE4Nc2QAdZY2fwF0?=
 =?us-ascii?Q?s+Dq/jTxI2ynJ3ib93RmWFaDlsRkiW2NMFIYNPRHy7UaIjVf5HtZL3iqhdTl?=
 =?us-ascii?Q?5Exd6dcvBXTXZmNU/+07IkjuFpuAd4WmcAUG+JjhNq1ZjRVq/775QysoqAg+?=
 =?us-ascii?Q?5bm25BfsQNlphDpoFZ3Jvc5lWC3V354o286LtY2mbDeHSUT7z1H9Fmrz82MR?=
 =?us-ascii?Q?/oxVOnEa61PzoSjjbMt450MooywRBRZXUw4Qgnr3kdkh8sgUcNhZuQQ60v58?=
 =?us-ascii?Q?2KFrrGJuBViPndRfbIMvi8bZAGBS+40d+bMB87TdHaLO+o0xawcrl5ZJ5YP1?=
 =?us-ascii?Q?OATCmqwfcVAFhgFBt9y/AjmLeJzFo64Bca6oLkVgmRHWOMO1G7xCgUoFeNXG?=
 =?us-ascii?Q?dRjoW7e/OGSlGZAWkMXRbbMr7lGzv1AXGYXB30yfELj/lb5AskcKmjufYKCi?=
 =?us-ascii?Q?c6YO0WmjpS2twKGVwhmF/IsMgf19NzRUiYcL9TAfJddMpxAc3kyagx2dIpwm?=
 =?us-ascii?Q?pHJE1vkxSR/JpHW10zOGeEjznPZefqdHDXmGQLk8LJwJYvUAQUVBVz38Iltw?=
 =?us-ascii?Q?mFQOXk4+DyLzdSiO7OG8fsX2+lV8LpsKLtIz9hBqlelIGF9ML7Zdc1mgmRYb?=
 =?us-ascii?Q?eRdkuo2G927tHMYHlM5CHqlvZL+yfDQbRQBPtDHOId0ZCbg+N4a51K2mAF1s?=
 =?us-ascii?Q?1dAqACwMmLY1Z252pItlcqj8CeXFyhheS52ykezj4/2B1hs1DposI8AlqZmK?=
 =?us-ascii?Q?5e4U1l614G3Y7pOZSZMJpWLbqG7DkK7To3AwH7RuNB3QiAV8tjOkRUvRRLhb?=
 =?us-ascii?Q?5b3yhSLaebkl5n0tD7RDqR62Tv4OaP2aIR/9AaP52PLe2Cy420tsppqtqrM1?=
 =?us-ascii?Q?E7z/ca03WWs/Ekx8Gh0vLlqQuiwZJ9x09q3LOsJRCxwq96f7F7N0sTRKLWLR?=
 =?us-ascii?Q?MHbnj8rRmVRk3mdhdi8D2aex4SZ1GwjOiflUKZafkZ5udN+zI3yRPIE+IDuj?=
 =?us-ascii?Q?jfPCK9GQGQEupSvGWT5dNh6MmxEop7FMd7VvJV5Rbd8OgeLzsYUFvi+/dK9F?=
 =?us-ascii?Q?gbxc8DSEebWl41WjkFscxiU/v8KsB/ld5zVyCKEGj8piMyKaH21nb+456WyY?=
 =?us-ascii?Q?rqAiBOjuJWojYPaEQBfg37dmqw9nD9iwqQNIydlnytdjLIAsbHilNbcluiF7?=
 =?us-ascii?Q?JkaBXdzQF/v0AdY2Un6EdtZs11G1Jr1xATetv8MsDsIJNhBJVOK6Hyi9mHU3?=
 =?us-ascii?Q?/mNyY1foU6nsbBmjy2GaZ4zfRAOgmE/49ASXLq8psxtFL8OHn2QRvsSKaxH8?=
 =?us-ascii?Q?/N3+jfCNx648UCZO20BZCB1Gr5y1cljuBFDN1FX04/MvZunTDVabHlj6wHx/?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 444784cd-e03c-42a4-9a2e-08dca8105cb0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:32:20.9550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZZ4Roq5qEieB1Iaw8GL1mCke7RgyqNrMB/fXttQla8oDM7p1kCLIMKwUexC0SPGCRLdRwQcFZtHVWKLfDJb9b3W2fVsGxPF4dssHgUw+oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

On Wed, Jul 17, 2024 at 09:51:49PM GMT, Michal Wajdeczko wrote:
>Typically we want to preserve pointer constness when converting
>from one xe pointer to another, but in some rare cases, like kunit
>parameter conversions, we might want to discard this constness.
>Add a helper that we will use to clearly indicate our intention.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.h | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 0a2a3e7fd402..c2b1f9f066bd 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -20,6 +20,11 @@ static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
> 	return pci_get_drvdata(pdev);
> }
>
>+static inline struct xe_device *xe_device_const_cast(const struct xe_device *xe)
>+{
>+	return pdev_to_xe_device(to_pci_dev(xe->drm.dev));

why are you going through pdev_to_xe_device() rather than doing what the
function name says and just remove the const?

Lucas De Marchi

>+}
>+
> static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
> {
> 	return container_of(ttm, struct xe_device, ttm);
>-- 
>2.43.0
>
