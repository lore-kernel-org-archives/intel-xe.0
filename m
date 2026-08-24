Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D948C5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 10:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C4510E0FC;
	Mon, 24 Aug 2026 10:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bl6jxquj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9056510E0FC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787565848; x=1819101848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sxI/HiqVMRU9YkLntZ9YbPa+IzrT2C8x0E38tQ2X5s=;
 b=Bl6jxqujIrBzoqux22Mz6391rI4q9lq45I+0fIa/xxernOqqTyV2C7nz
 723isaZGVipthmMyZhv1v8uupJt+AMVoTkulCB6exdOTh9zd+VqtuiESO
 HlAVvBF0Y6Fb/n0/9aeKhJNx4dOIykrBXbYaSYZWVTfjzB6ZdL0zYZfI4
 2h+ZZdZDjlpmPLj4kndr65vfUUbv0FFCa2hrvhy89YAxF3TR4Z1Zl18pP
 RC1MnY6r9uj4jS0A+Jw+1QUOYzk2E2z9B3y8qRlm3+oS8SQFzcRHEpmMJ
 vAGHtOpe+fBfhCPb+hWEG72U+Dki6396bQjYEqrnE7+xoc3zrfslELK6o g==;
X-CSE-ConnectionGUID: xA49U+09SHSGm35zVBr5+Q==
X-CSE-MsgGUID: kQ3Hdgz0RHWGIeKnjFz86A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91691572"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91691572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 03:04:08 -0700
X-CSE-ConnectionGUID: xV/53gW9SQuUWjyVZwVtUA==
X-CSE-MsgGUID: RxIAa48tRzOASV+l8JfY6Q==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 03:04:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 03:04:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 03:04:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 03:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItFbzmKx0z2oWYnenh9RKt/3ISxrrk4CHeoHVlmoGs7EXnYCMJh0VJ7Mk0t5rdDObiIP2wsbelg6Oz7qKu2v/2CC+MeAQmJMJld6LjD21BIhcAFouEK6Joc76a9LE972DtAdOPykMOsJm7zl73LiloRdce2VGm7KF7LXE8vUHqQGjOUXmVh4Dhuw2tGbl5ATdgatbR6zutAH48lX6h98FP+jFghwRd83RxOKgtrQoFCQAQCIONmahnFZomY2aYp8MvLp3XatF8g2KkiHfz1NtEV46upKou2T/Y6Vk95oZlG9BtvuEbGIJALqi36YENJLJ99kSA9HzfwuuHctKLA/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylDVnQBwP1BuKpry38d7R6MV47jFm+r1KzIVY3XB8SM=;
 b=tut9iWlSYIoUFExG98NPMhuMG3m5PGw98rKQAZwCFop8PT7VPUrE7b23cnMZ7nPL5QdGyuxGjPHszlAgQHIFH6/DEbD6jQ8cUsuOsiPgyCThHFuzDdUXGriLLlXbOxGzS/vcGxB7Ai2KiA6P4lYwbbBhTFVAFs1eB6NZhFUmzov8K3v3KzUN360UbDwbDmMCUlS6qNEpFNXesM2cdDve/CZpDja83CEkXlohnNjLB5VgkzlfjDa6SXu3uOpnAK4S88muq9B5XupAUmjqVaqs8gtA2IRTabpapFEA1Pasw1LJ43FNZEL8W99k3vvyo36vbunNO/PqwWrJSAyqhZdpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 10:03:58 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 10:03:58 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT invalidation
 helper
Thread-Topic: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT
 invalidation helper
Thread-Index: AQHdMUDeuEQZrOy4LU+Tc8hywcpUBbasX/oAgACcoQA=
Date: Mon, 24 Aug 2026 10:03:58 +0000
Message-ID: <SA3PR11MB7625D40A45A5016FD081E35DC8A02@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
 <aouTIKK-XivDxamR@nvishwa1-desk>
In-Reply-To: <aouTIKK-XivDxamR@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|SA3PR11MB7527:EE_
x-ms-office365-filtering-correlation-id: 6f84c738-c96d-41e8-12be-08df01c703cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|22082099003|18002099003|38070700021|10067099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: DR+A3YA4UTV00V7X/ihPeufKcopnGf7wHxl1JhK1Rfpn7clNZbCnRczYmiD56ZgfTEZ+Vc3GLFHaJSlo7lWQMfrUloJRa04d5Cm9+7w1MFuDLH8goAVXBugShNBlfHXj3SHP59lozI7R88gIFFU2hmmeFe5qlkNDl+4Ctc4+1vJPpy7bHAo4EMbK36nN1A0BePICJduhYkV3jVQ8jIMRbNYvsOcMUTZ9kpoOU2eS5DuoFCKJVId2lmollTSUAKvTm2o/9cF0R5mscp0kNvpwviS350QbHISiwGjjjfWyReHwSm4Ysn2kBhuyQPW4YD90KhgqnXU+vZnLNVZezRrPS+47gHpigNt/MnNyx0d41TC3Vc9/T9tVi5lN9rqdTf5PrXwCoaJf2TFXAXrrAMqEdbQnAR6mXnFjQ+tThk8UBH10YDcxPrG9CJ7UuRoQngNvyB4CA4RN9zpA/9sd7+ZuPJREyfRgno3HGe22EqBwWDLWSaot/uJ4nCcH9CgJJP/dKcgSPRgYQGzAjjRmb7zkSzKrzEa+O7ffylapAbzQUcft450Q+/kzhYZQhfvgFJa117IWMeZCcQPYTIXY/Dd3+7vAlDv83v3yIEnpJlH6c67N4HBAUIuh8GfUUfQdrzdpxrAOUukUODZpSYw+Zl02BgzDtcVVnYhFhRtF8cmBuBCXU2Gt96bOzwgcMnKsNs8Cy5VZgxeIxggCDjx45J5EQZVRrXsYMCLKJ5bDCe9m38c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mVmS76cHAJ6XBl3NvNMirwQgYDLugwvdQ5jGc2C7DWSNSOs0DIlcvkGAFKqA?=
 =?us-ascii?Q?C7rmt1+lf7pM+T4tQtJnFF116mefgqd/cfakh4RRGm0aqSx6H+upsgwFB7zN?=
 =?us-ascii?Q?1CGKCDqwSJ647jqBBH8WszGfVaNjBJA6f0rRmQ1byi3S92Kbv9k1JZct1f3f?=
 =?us-ascii?Q?LOTC7eq6j+4353OJQYJG7z4MRIxcCb2LU1DJ3uQ7ntGAr5+g0xvLvlax+8r/?=
 =?us-ascii?Q?8D0zgeLTrL0PqtmlnQ8UQcZZpVjke3LBqBeJEBWbVjFQeHAGoo4g1mGGCEmh?=
 =?us-ascii?Q?J+2O0pvcrrbTxfjWT9OFctQVmKz9nKXePxtsJBInerF4aaSuTmCuooGeu7Kf?=
 =?us-ascii?Q?uA3spGiTCVP91WatK7lJ8FPsrLCgfFvXjy7pcFff6aSG0FdjjWb8WShaCpe/?=
 =?us-ascii?Q?HafLcVeb2OF2ysRY8SBl5qdz0HJY28w/y3PBu4HCXFH6RQirT9V48Pl5A8+p?=
 =?us-ascii?Q?GP4dJw4riuNzRq8NBS70kyUNCT9mnxBQXEvzj5D/uZIxgCNKqQ5kMC9fqUry?=
 =?us-ascii?Q?m4/mx47UKfnZpg3AT39ljw8awJLNRYuM/ZIqHvGnUQ/Dp2e0599ZEUu9MPJj?=
 =?us-ascii?Q?N8iRzeZvWTa3LOUoXwQAlpBDw3L+NlH/4rui+Gpr5c0CirSrz9cmT28G1vlF?=
 =?us-ascii?Q?hmXMZ3RdAi+8z3A7Zfv/6Awz0ov8oGF/kmihCl/BjlmOwrQDMVoaxNnY8N+m?=
 =?us-ascii?Q?GiGJXRBELUYeBKBAR566EnrdXHfxqeeCrwbiTpo+9fSKytuBw6w24+nx3NgT?=
 =?us-ascii?Q?N3Wn17jcE/9RiINWat4z6KoRfZrtrsrRpCQdjqolhAncTPHk9+FXFOPQp93c?=
 =?us-ascii?Q?l2SUuKZj1kVSTNG2AiWqxMgEIFb8SqZ/clymQWAj9fPauUVbj8xd+xVN6q9s?=
 =?us-ascii?Q?SeNcMLT+Cumy1m4lkpsuLsWORbNtD6cM6ULkVqQbzn/eQL8SDj0u32ouKXkT?=
 =?us-ascii?Q?kkxV1H2cKyy4KO5G/s8lC7icDdWGzw5sYgyyiec46t/CaGXnHQPM6myVzXZK?=
 =?us-ascii?Q?mdnWaAdipomi/tOdIg8qaldzQ2fCWzOzhylruRkGsqr42hcTTvy5lZEzBNJH?=
 =?us-ascii?Q?r5mX2vsQrbN2ixVAmSmMys3KCGolYVmEOWMcJrx9gy139jNFL/Weo2sSadcW?=
 =?us-ascii?Q?JD225ScftDXNQroTqHZJhhuKhyztpRy/omJQTX2PPWLgRHjFBYuDKLfxsXMu?=
 =?us-ascii?Q?cIStYo+Q6JQsqg1tGK3E7jj9O7Gz1fQ4wTLLYkuSQcsYMzBlEL3GZKEqbQNs?=
 =?us-ascii?Q?x5jNR5kDwjucJ6hnay5eIANQUEb9eS3txqRXifm/f6neElZLNhQaP4N6nD0G?=
 =?us-ascii?Q?MorsaRyEyjo3vUnVR10kOLnt5jqjb6S2KAC/H6DcBR9vt8yi5CMNRDacYVJy?=
 =?us-ascii?Q?ge2y/klcodTf1sxWw7XKQKzoXeXGU3rMReOMdEBGt1L5noNKYe6jMeQhV6tM?=
 =?us-ascii?Q?LJwOHKVgm9Or/YtZfQOp6GC7H6jQt4PkYHTSC86UgPrPFPXt0pFbEdK/lw68?=
 =?us-ascii?Q?QxPAHUF/Xpulzu0m60ptM5nRPPaXUQ0S/iZ2x9KeNHjiI31Zb8nXio35flu0?=
 =?us-ascii?Q?mf6ZGaq97+qNaRJmC/k845FARwWi58sNeRMlB9Gs/PfE8FrtSBLHTNprSPYG?=
 =?us-ascii?Q?5l8BVaVQW+C64sTFVQBw8pk9+1N7/JV3e+hLkjs+4FsGs64BU+1ov5uq7czh?=
 =?us-ascii?Q?TO6SaFls8mrpM6iAfCL5Ua7yqzBvXrdLDCBwb18T1ZgCWYOI7G0yfWVW3iCo?=
 =?us-ascii?Q?OKovDhtLe5sY3A0YrR5hqgXRTEyau8c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dU7GGYbgCOj0mZVKgRC8447BSmfXj0WZ6FMvdJ5f0T7CfIJEiaB7DqYnOAMjpE61eZOgC8evwzaqZi7fR7gw7sVlZ/zf6yrqeLNEUUTDl0PeLiWRInBhmP+g2Lyivek9KZ3uurxC9+ICf0gl01aYG1TvqbmJRFr2VBhhWAY+3XYja6ASVjgmrPLTGcrIsT8Dh/9QwTzajZkzIugxR90tFss1TjlA29G+/mqQtHWZXItMD3/BI00QsNeJucCX+Mzn/FL93jQC9odwUUBqRVZ9Pac+AqPPS61V8TZiaMVTcCwpmW0mfXxdGoetA6RL2nyZOVy5NTFjMkIZdCVZQdJOKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f84c738-c96d-41e8-12be-08df01c703cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 10:03:58.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3LVuZegRojmueeJ2YJ8kTA4qEHF/HOLWI0MVmmefDL+MN1gg917o4+iFQ8uiDMdJTRi5FPfvTXK89IxWWy2qXmBOT5J9qNcDvd9lVSHm1RttvBV1YPpPjLDISTPaV5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
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



-----Original Message-----
From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=20
Sent: 24 August 2026 06:11
To: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Cc: Brost, Matthew <matthew.brost@intel.com>; intel-xe@lists.freedesktop.or=
g
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT invalidat=
ion helper

On Fri, Aug 21, 2026 at 01:12:37PM +0530, tilak.tirumalesh.tangudu@intel.co=
m wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation within the=20
>requesting VF partition across all engines.
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh=20
><tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++++++
> 4 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c=20
>b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..9c7a02827902 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb=
_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+/*
>+ * Emit FULL_INTRA_VF to invalidate engine TLBs across all engines
>+ * in the VF partition.
>+ */
>+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval,=20
>+u32 seqno) {
>+	struct xe_guc *guc =3D tlb_inval->private;
>+	u32 action[] =3D {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),

NIT...The commit title says INTER_VF but the macro here says INVAL_FULL. It=
 would be good to be consistent.

>+	};
>+
>+	if (!xe_guc_ct_enabled(&guc->ct) || !guc->submission_state.enabled)
>+		return -ECANCELED;
>+
>+	return send_tlb_inval(guc, action, ARRAY_SIZE(action)); }
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -346,6 +365,7 @@ static long tlb_inval_timeout_delay(struct=20
>xe_tlb_inval *tlb_inval)  static const struct xe_tlb_inval_ops guc_tlb_inv=
al_asid_ops =3D {
> 	.all =3D send_tlb_inval_all,
> 	.ggtt =3D send_tlb_inval_ggtt,
>+	.ggtt_full =3D send_tlb_inval_ggtt_full,
> 	.ppgtt =3D send_tlb_inval_asid_ppgtt,
> 	.initialized =3D tlb_inval_initialized,
> 	.flush =3D tlb_inval_flush,
>@@ -354,6 +374,7 @@ static const struct xe_tlb_inval_ops=20
>guc_tlb_inval_asid_ops =3D {
>
> static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops =3D {
> 	.ggtt =3D send_tlb_inval_ggtt,
>+	.ggtt_full =3D send_tlb_inval_ggtt_full,
> 	.all =3D send_tlb_inval_all,
> 	.ppgtt =3D send_tlb_inval_ctx_ppgtt,
> 	.initialized =3D tlb_inval_initialized, diff --git=20
>a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>index bbd21d393062..aa12c7d95448 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -321,6 +321,31 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within VF=20
>+partition
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue FULL_INTRA_VF to flush engine TLBs of all engines in the
>+ * requesting VF partition.
>+ *
>+ * Return: 0 on success, negative error code on error  */ int=20
>+xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval) {
>+	struct xe_tlb_inval_fence fence, *fence_ptr =3D &fence;
>+	int ret;
>+
>+	if (!tlb_inval->ops->ggtt_full)
>+		return -EOPNOTSUPP;

Not sure if we need this check as ops->ggtt_full is always set.
But should be fine.

>+
>+	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
>+	ret =3D xe_tlb_inval_issue(tlb_inval, fence_ptr,
>+				 tlb_inval->ops->ggtt_full);
>+	xe_tlb_inval_fence_wait(fence_ptr);
>+
>+	return ret;
>+}
>+
> /**
>  * xe_tlb_inval_range() - Issue a TLB invalidation for an address=20
>range
>  * @tlb_inval: TLB invalidation client diff --git=20
>a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
>index a76b7823a5f2..665072b4b81d 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
>@@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval=20
>*tlb_inval);  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> 		     struct xe_tlb_inval_fence *fence);  int=20
>xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm=20
>*vm);  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> 		       struct xe_tlb_inval_fence *fence, diff --git=20
>a/drivers/gpu/drm/xe/xe_tlb_inval_types.h=20
>b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>index 3d1797d186fd..02a356bfef47 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @ggtt_full: Full engine TLB invalidation within the VF partition

>>NIT...May be say 'within a VF/PF partition' just to be specific?
As per spec, wording is within VF partition.,can I proceed with it?

In any case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com=
>

Niranjana

>+	 * @tlb_inval: TLB invalidation client
>+	 * @seqno: Seqno of TLB invalidation
>+	 *
>+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>+	 * failure
>+	 */
>+	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>+
> 	/**
> 	 * @ppgtt: Invalidate per-process translation TLBs
> 	 * @tlb_inval: TLB invalidation client
>--
>2.46.0
>
