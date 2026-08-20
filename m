Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76BEC5DF87
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 23:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF0A10F1D1;
	Thu, 20 Aug 2026 23:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv6IV3mF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B9B10F1D1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787267268; x=1818803268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I2bXGZkUo8SOMmvJqQsN0UeBb9tPNqYpMKG2naQHENA=;
 b=Iv6IV3mFlsUMSM4fu/ekqfEruL2ON2dQZs6R3tOrKBsDXVjFDQGYM681
 UbknaE8PCcWyMPH5zzb1TNxZb0Up8fFOdfWQVlcz9TcWEK9KURuO0oz2q
 Pv8h3rKExQzOEMjxs5fChCnWvNaRvMX2DrQLoZaOKWTL4efOqRUMESJ/8
 k1z3Fpri8NzPkdAWHc98VBwaJ+iKnZclooB1VldB+tEGMVsjEdPE3qwpS
 DkVaRzAG652btf+GrYhiCpk3Bqt2afX3Fwx09uardJZ7VuHDzjZyVuVRW
 Sh8vg54gw2a94xk8NbZ7CcHXEAgCOiETLMm/M1Ryj9mR0bq1xNOLLbykk Q==;
X-CSE-ConnectionGUID: MHw0P4lNRE6uvd3zhdJHaw==
X-CSE-MsgGUID: qiEfvz/GR/+i+H4HMT5SIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91687937"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="91687937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 16:07:48 -0700
X-CSE-ConnectionGUID: GwKeq2NbRIWFiEu74NCf1Q==
X-CSE-MsgGUID: rjvMkpiPT/6r404cfD/wBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266230847"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 16:07:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 16:07:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 16:07:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 16:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brRiuNCChAaUs1qauYWN7/3RoRwk+c3bjgJshOvcCeyQEbruJ4tQLJBLKPbCy5YdcWKUlg/yDgSvF/R4C0EPne1Hls/utW18GzrETt09TiAGkOzXz1Cun/7tvItva3Q6AKf6qwQFQoKwFwaHzrE6VrbCoLVHkFA+99dDjW4E7a3McQdc59QQmn6zItH4ujPvhA9F1M5ED2Qytjyw3Y/E0DxTnd/xFLGCosD9Kkn7q20ul4WIoiq4w6D3G8jCZ7VoJFiSN4JbippEHHlbKkfMchL3BPzAit4KtWoZrFC35f0TDuzZFSXbtnqKYfP/QwfNnbA8I8uVsH6U8nXXb2bVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwnHvv52vIF//aiGUs/GYcALLQqDRJMplDWK0G6wDW8=;
 b=yOUvevzzQSQaClpp5SNqJX6DcFU5u13GwGu1Bk4/1IKm1n4fRHv2RGa5QV3MZJt9d4nfGCme2gkA5FoYw5TEj2EvwT6f+Y7EJ5cuKUD7m4xgH7aWv/arRfgf1UMFj0PrPnSE/UdocgChdqq0UHzmzWOlHHzKg74T1dLF5QFpPSpX+f8pqD2n8x3jKI94LdTAFNZv2PbtEjntptajLPtA4jcGteYTDeTl4f5gOpu0hGFL/hMFla0YKunLw3UhQb8G+8f3mda75B4+KlxVaOyPwN0KxDJjjwgrH38zWnZc94JaPX79/Krn85CNfrm6lRVLZvS84kxkhPDtOrWjKoBXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 23:07:43 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 23:07:43 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
 boundaries
Thread-Topic: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
 boundaries
Thread-Index: AQHdKrev66bmZg+y5EOilwJYQ7fiV7anm/JA
Date: Thu, 20 Aug 2026 23:07:43 +0000
Message-ID: <PH8PR11MB804051F88CE2CEA4242D8B26F4A42@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-4-zongyao.bai@intel.com>
In-Reply-To: <20260813000654.2712317-4-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|IA1PR11MB7344:EE_
x-ms-office365-filtering-correlation-id: d3849f18-6222-4eb0-df6a-08deff0fd71d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|42112799006|38070700021|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: HCDTqDtMbnGvp7ewSY3DcvRfHOcLORrTxX38VYBzqssxyQxxOmFvHA3KhfVbrscBrYCyW6qEkknQbvUTuYgjgwabSWPsga1t1ni+9HAbcsGA4cFVLIKZI/GTLczkJbvrn2PxEPS7cF2G5PGlflGBXHJAV6gMr/GO7yMYCWPH8zjFXFj/Wat610JR1ODH1xaPegHeDbQiH96H33N5/sR10SPJ+y/G8/2W7Aug5YhcqoAoDXUFlBr/X6WP7hKYgwp5xlTyLGQWwaxlh7imzcE03NO0Gnu8fD0G6Nt73Q+ZfvyJzfXLimRY6euqxVT9RS7Cvo99tnzjRplhHFaJR2/USRSnf48WG4+KnaLGVTS3QfKsmck83kU+IQdXP5oUo7cn97Ljwwro/B4+lOFmA0PAR1QKTaRHzVKLxu82tJarB4ZzMmfrRlc2MCrNRCpvJENLa6NigFvfKCA9Jl0Ja1qvqGtDrWyNg9FsBqYnVgU+fFdMnsAbFHbcOTHi+yVhk8T0m1g8+CIaorBq31iish2fuwfMBCXxFEDhZCgy7gsfe+9Svw2Zt6kyzgGXmuHz1+rW/iOR617+MhYO112/etwOriTuZTviVQ2QgbkNLJYQznMYZgoKHWQo4caCbc+I30a7NS9yeyGy5RvnFMPOKqBYT8+00kSYdanvCJJYOzaQ/5LQLU3S+O01sBEBFlmTRBhlKHa9zTR++OUerCjX2IUw2HSzYRoQ1KqRatGH4GveMRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(42112799006)(38070700021)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lP8gBfWJo5qqnNhixPixLQkZ6MOY/JfvuVhV8BrqoJ933OVp2JW6x5D0FxQ7?=
 =?us-ascii?Q?wyY0P7rEUnC/yGQ5avNQyVhsgfqPgWZoq+rMFwIerFCM0C5g26uLmkIxk3cj?=
 =?us-ascii?Q?Jb0acfIf/OsvIAM5Jr7aW2LNHJD6PuCRBOCp2z0wnbcWT0g9E3R/nOugo2cQ?=
 =?us-ascii?Q?kiMFetOoCjU38yIquGqC8C7m3QIx/VBKdo4dlOs3KmbCfIrdgyWlAdzPSl+c?=
 =?us-ascii?Q?WIkvlp/zQa3dgFpyE0ZhYmU7fpqs4HK22wSwE+XxI3Psgr/3wXkjFuazkfGO?=
 =?us-ascii?Q?ZcFe7fgyRPoswh0SIgIjsy9oHEXCb5+hQ7Su2nGOYw1SE6iYPmUEjl9AvSTm?=
 =?us-ascii?Q?5wmtMuvZ6Nq3wSe5WSePIXmKY9/keO+J7jfyVcPy09dszJfclnf8pNwrXcqU?=
 =?us-ascii?Q?7NlgnalM0FFYdsBIDP01TUeheN9s2a3xNQtJ1x/7smGFmnnLNqjbDBtCcBSS?=
 =?us-ascii?Q?OYXwl7R6bTBLIBUEeHeH0GvfAYx2LXeHsY2lH/WGVAt/CfybPW2t5zMXwLtE?=
 =?us-ascii?Q?k6KMdDhNQwgx+MWnWXwQVxOYh3rJeX66rLQROAJoVxAr5AcXUEYQai3sr+fP?=
 =?us-ascii?Q?cyyC2b6u1qvNnrzJ3MR2Jf3Clx2hXyGt82cIXmOHDuMgevXLJTHAHQE02RRN?=
 =?us-ascii?Q?EKNZt6jK2yBQW5rQmzBLiHQF5JkU7oQm1aRyzGL40D9Ibg8rhIeDG/du7Iap?=
 =?us-ascii?Q?Bz6XH5ZMr7ySQOduZtOrJJkCvz7a+qBG/OjhT4Kc/KzGeU+xcpbCxXx43oOQ?=
 =?us-ascii?Q?f3TT5kxN8fAbIxzgARC2dtt7VW+wX+4kI3aAOm83Sf2j4Jb7ygk4eXHhCxHS?=
 =?us-ascii?Q?2gLP9UyXRchQLmln4LeYg5ec5HO1H055/rYcqN5svcE2Bk7R0HXzlL2KkGBt?=
 =?us-ascii?Q?HvkzB5kW+uV1FQ6/GIKU7nglXnHKQu1cr7f24R7FoVcWtU5xtgYdXhaapN4I?=
 =?us-ascii?Q?83eWBcM8DpRfzDmKOeRP6un4t+My7+Xikac7JpvVtTA5jDbAqNcn+d3fokOD?=
 =?us-ascii?Q?SNjm5gbF6wSKKFF3upMOuXPFKF0q3furBfy6pyWuI30nP8SR253J4aNhw3E/?=
 =?us-ascii?Q?+HTJsISLVXk7MP/tZUGiqEdD4eBqWIpAsb3S9aTTZA946rH5JEbZyRl03Nzt?=
 =?us-ascii?Q?k+0hwJIhtB1K26wyY1qvZoHo0pTTYKeJhDu0pOxNsWOLcQWRJvKGzANVHFAz?=
 =?us-ascii?Q?Y0u3bw2vVgAd4UHk3W68ezwb0uAiDxGH1SKImXgaCS444XYZBNDJGDuiiXni?=
 =?us-ascii?Q?mlEAaiVb4z1n5Jc2obD9JqEpUhAgWEayXP91bJFpAU+UcRpYWfBq/VkBQUUE?=
 =?us-ascii?Q?Q8aDP6HiT8FoEtOpUosk4dT0PloiuxzzQ5XYvSspsCkIo1zvPl7REdlBa2Hl?=
 =?us-ascii?Q?qhphzFwM3IikujCjh1sdIx6xZDkbRXAtk61uaK1x4Xz/XHlag7n6knmMkBos?=
 =?us-ascii?Q?0zM4owIlUNyLYWQuY6Mqn5IFj93GzBfSSu1fgnpNe2kZfXTESyG7g74HzWSX?=
 =?us-ascii?Q?5wSsOaxA62bQOX2zOaUf0luiHnhJegQHF69r8g5a+Pzmp4KHgbK545u3avmq?=
 =?us-ascii?Q?7s8DMiEz/8AcpYTxOMRFM9MzSigatOdsJIrJzpyBH1cMqMN39MdHg0Pl5qfa?=
 =?us-ascii?Q?wVX8H10cSy+BqbVC+023IYY3RcLwH7CGrWa5+QPc1al43JGkJ02nBjxv3C/s?=
 =?us-ascii?Q?+piibgn47SJO2KFI2oZJUFyGLslTQc199onQxKEp+31P5Udn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RYupFDv3RlPfhPbpNOUgFtaTPAkcd3xPH+Xh7VIpmf9s441WN/aMvGUttpsJmEvuI0FTlcZGAR/S/UGxAS+O0O8RchLcfvii1YySaTQlYI3HEC3JSmCe+JP17Jp50MxPdbeP63oxFU/yCJWPbAyDSFd+2CBvyQx+v6ZBg/KIP4RtuXdlYtFGtK5NDfRdl+p/XWZrtcg/0EHm4v8hRF6mIImyZePpzPJ8wIe0SB3PRzPBv5SMfcQcZjpLec36jxp9AWjAW2GOBah7sGQdgf801pqKFKIZPx3TRMpE35nDbRak1AF7XLolTp7EZlkQetAfvb7WGKesG65fghouXLn6Cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3849f18-6222-4eb0-df6a-08deff0fd71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 23:07:43.1366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzAqMvmhRsl4KCMmAWFwctubq3pxo6jU91Ex6b+RhC6GM2SWd5w/MVjnTPchqpnC+t1jOyWEXP7O92pPJKLKHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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

Reviewed-by: Jia Yao <jia.yao@intel.com>

> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Wednesday, August 12, 2026 5:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Yao, Jia <jia.yao@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
> boundaries
>=20
> Add a synchronous forcewake flush that cancels per-domain timers and sett=
les
> pending sleep acknowledgments. Provide a scoped cleanup class so the fina=
l
> put is always followed by the flush before the caller continues toward po=
wer-
> off.
>=20
> Use it for system suspend, runtime suspend, and shutdown. After DRM
> unplug has quiesced engine-cycle readers, flush every GT during remove an=
d
> post-registration probe unwind so delayed callbacks cannot cross teardown=
 or
> a later device FLR.
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: GitHub-Copilot:gpt-5.6-sol
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           | 11 ++++++
>  drivers/gpu/drm/xe/xe_force_wake.c       | 49 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_force_wake.h       | 23 +++++++++++
>  drivers/gpu/drm/xe/xe_force_wake_types.h | 42 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.c               |  7 ++--
>  5 files changed, 129 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 21d02809c3a4..d69fd8236b0f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -711,6 +711,15 @@ static void xe_device_sanitize(void *arg)
>  		xe_gt_sanitize(gt);
>  }
>=20
> +static void xe_device_force_wake_flush(struct xe_device *xe) {
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_force_wake_flush(gt_to_fw(gt));
> +}
> +
>  static int xe_set_dma_info(struct xe_device *xe)  {
>  	unsigned int mask_size =3D xe->info.dma_mask_size; @@ -1169,6
> +1178,7 @@ int xe_device_probe(struct xe_device *xe)
>  err_unregister_display:
>  	xe_display_unregister(xe);
>  	drm_dev_unplug(&xe->drm);
> +	xe_device_force_wake_flush(xe);
>=20
>  	return err;
>  }
> @@ -1178,6 +1188,7 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_display_unregister(xe);
>=20
>  	drm_dev_unplug(&xe->drm);
> +	xe_device_force_wake_flush(xe);
>=20
>  	xe_bo_pci_dev_remove_all(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> b/drivers/gpu/drm/xe/xe_force_wake.c
> index 3f5013c7424c..ef43899e1f7d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -391,6 +391,55 @@ void xe_force_wake_put_delay(struct
> xe_force_wake *fw, unsigned int fw_ref)
>  	__xe_force_wake_put(fw, fw_ref, true);  }
>=20
> +/**
> + * xe_force_wake_flush - Flush delayed forcewake releases
> + * @fw: Pointer to the force wake structure
> + *
> + * Synchronously cancels delayed-release timers and completes pending
> +sleep
> + * requests and ACK waits. This must be called after the final
> +forcewake put
> + * and before power-off because the timer callback accesses MMIO.
> + *
> + * The caller must ensure no forcewake reference outlives this call and
> + * serialize against new delayed releases or final puts that consume a
> + * recorded delayed-release request. Timers are canceled before taking
> + * fw->lock because their callbacks acquire the same lock.
> + */
> +void xe_force_wake_flush(struct xe_force_wake *fw) {
> +	struct xe_gt *gt =3D fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp, sleep, ack_fail =3D 0;
> +	unsigned long flags;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->sleep_timer);
> +
> +	spin_lock_irqsave(&fw->lock, flags);
> +	sleep =3D fw->sleep_ack_pending_domains;
> +	for_each_fw_domain(domain, fw, tmp) {
> +		assert_domain_state(fw, domain);
> +		domain->delayed_release_requested =3D false;
> +		if ((fw->delayed_release_domains & BIT(domain->id)) &&
> +		    !domain->ref) {
> +			fw->delayed_release_domains &=3D ~BIT(domain->id);
> +			sleep |=3D BIT(domain->id);
> +			domain_sleep(gt, domain);
> +		}
> +		assert_domain_state(fw, domain);
> +	}
> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> +		fw->sleep_ack_pending_domains &=3D ~BIT(domain->id);
> +		if (domain_sleep_wait(gt, domain) =3D=3D 0)
> +			fw->awake_domains &=3D ~BIT(domain->id);
> +		else
> +			ack_fail |=3D BIT(domain->id);
> +	}
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +
> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to
> acknowledge sleep request\n",
> +		   str_plural(hweight_long(ack_fail)), ack_fail); }
> +
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id
> id)  {
>  	switch (id) {
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
> b/drivers/gpu/drm/xe/xe_force_wake.h
> index 8da675d8db0b..ac37a0177d7b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -19,6 +19,23 @@ unsigned int __must_check xe_force_wake_get(struct
> xe_force_wake *fw,
>  					    enum xe_force_wake_domains
> domains);  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int
> fw_ref);  void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned
> int fw_ref);
> +void xe_force_wake_flush(struct xe_force_wake *fw);
> +
> +/**
> + * xe_force_wake_put_and_flush - Release forcewake and flush deferred
> +sleep
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * Convenience helper for paths that must complete or cancel
> +deferred-release
> + * work before powering off the GT. Sleep acknowledgment failures are
> +reported
> + * by xe_force_wake_flush().
> + */
> +static inline void
> +xe_force_wake_put_and_flush(struct xe_force_wake *fw, unsigned int
> +fw_ref) {
> +	xe_force_wake_put(fw, fw_ref);
> +	xe_force_wake_flush(fw);
> +}
>=20
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id
> id);
>=20
> @@ -93,6 +110,12 @@ DEFINE_CLASS(xe_force_wake, struct
> xe_force_wake_ref,
>  	     xe_force_wake_constructor(fw, domains),
>  	     struct xe_force_wake *fw, unsigned int domains);
>=20
> +/* Release forcewake and flush delayed-release work on scope exit. */
> +DEFINE_CLASS(xe_force_wake_flush, struct xe_force_wake_ref,
> +	     xe_force_wake_put_and_flush(_T.fw, _T.domains),
> +	     xe_force_wake_constructor(fw, domains),
> +	     struct xe_force_wake *fw, unsigned int domains);
> +
>  /*
>   * Scoped helper for the forcewake class, using the same trick as
> scoped_guard()
>   * to bind the lifetime to the next statement/block.
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h
> b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 28c6f6dc87a3..3f20f91b3a70 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -107,6 +107,48 @@ struct xe_force_wake_domain {
>   * Currently only used for GT power domains (where the term "forcewake" =
is
> used
>   * in the hardware documentation), although the interface could be exten=
ded
> to
>   * power wells in other parts of the hardware in the future.
> + *
> + * Delayed-release state flow, protected by @lock:
> + *
> + *                         final delayed put
> + *        +------------+ ----------------------> +---------------+
> + *        | REFERENCED |                         | DELAYED HOLD  |
> + *        | ref > 0    | <---------------------- | ref =3D=3D 0      |
> + *        +------+-----+   get: cancel and reuse +-------+-------+
> + *               |                                      |
> + *               |                                      | timer expires
> + *      final immediate put                             v
> + *               |                              +---------------+
> + *               |                              | SLEEP SENT    |
> + *               |                              | ref =3D=3D 0      |
> + *               |                              +-------+-------+
> + *               |                                      |
> + *               v                                      v
> + *        +-------------+ <------------------ flush: wait for ACK
> + *        | ASLEEP      |
> + *        | ref =3D=3D 0    | <--- flush delayed hold
> + *        +-------------+
> + *
> + * A get from SLEEP SENT first reconciles the sleep ACK, then wakes the
> + * domain and returns it to REFERENCED. A delayed put that is not the
> + final
> + * put sets domain->delayed_release_requested. The final put consumes
> + that
> + * request and transitions the domain to DELAYED HOLD.
> + *
> + * Successful-path state representation at stable boundaries:
> + *
> + * REFERENCED:
> + *   domain->ref > 0; domain->delayed_release_requested may be set.
> + *
> + * DELAYED HOLD:
> + *   domain->ref =3D=3D 0; @delayed_release_domains contains the domain.
> + *
> + * SLEEP SENT:
> + *   domain->ref =3D=3D 0; @sleep_ack_pending_domains contains the domai=
n
> and
> + *   @awake_domains does not.
> + *
> + * ASLEEP:
> + *   domain->ref =3D=3D 0; neither delayed-release state mask nor
> @awake_domains
> + *   contains the domain.
>   */
>  struct xe_force_wake {
>  	/** @gt: back pointers to GT */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> efe425dbcc85..8e7c5f82d362 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1013,7 +1013,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	xe_gt_dbg(gt, "suspending\n");
>  	xe_gt_sanitize(gt);
>=20
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> XE_FORCEWAKE_ALL)) {
>  		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-
> ETIMEDOUT));
>  		return -ETIMEDOUT;
> @@ -1036,7 +1036,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>=20
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> +
>  	do_gt_reset(gt);
>  }
>=20
> @@ -1092,7 +1093,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)  {
>  	xe_gt_dbg(gt, "runtime suspending\n");
>=20
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> XE_FORCEWAKE_ALL)) {
>  		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-
> ETIMEDOUT));
>  		return -ETIMEDOUT;
> --
> 2.43.0

