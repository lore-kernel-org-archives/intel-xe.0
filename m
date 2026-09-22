Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EE7C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE83410E4C5;
	Tue, 22 Sep 2026 23:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="di/EEXmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1610E4BF
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790118486; x=1821654486;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BejFRc8LPh76i5/iv5y8krIPRsF6ADJB9X9soDpStG4=;
 b=di/EEXmQGn5as+il+pdddxLb94QmaP+afronpifHTWUdqdrMhfg1be65
 CNa1vda7SEqpEhzagY7pYrW/dG+bHQPK0n3u3ObGoJ9BvIiGag2CmBy+J
 Yo7Wp4kMF0N6qyVIUwn+KWDXBiCVER/IR3QVlAqHi8USa+/HNPVksnQXa
 L7rx1tyRLLIPlruyE4raefdKSF8auMC90gGssOOd+Jq3g943/ZVmyJmGc
 4gbKdv0uoyV7g5FFrPzPAtnaRAvHXw6hZiqFl7iZPglinI3fxXSWknhE5
 nH+NlfG0j+wQje33O7hbwYETj8G4sFz+fFOOHmg/2xcomcCmdtj7OggTb w==;
X-CSE-ConnectionGUID: gOaL/9mdTrmz8RbiMdqeVA==
X-CSE-MsgGUID: 6bqe25FVRnCLhoe/N+5jJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90637852"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="90637852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:08:06 -0700
X-CSE-ConnectionGUID: CL5pJiqRRp6fDQ4yURzMfg==
X-CSE-MsgGUID: 4O2qsfbbRM2s5OMeQKDW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="269856503"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:08:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:08:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 16:08:05 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM+B+2faeT8vtjzIjfZOnrhBhXZjcpfuYVg6EBnjp2aGNFMa68U/DHhdKo0a3kA0i7jm+i3sEFClCYHZ47WHBfzwRmU+6rzgVldnIWkQ8k3ntI+0waV5gNmYJNySnrr5Busys2q6th/dm9PHVvKjWc9k/lZTrYJzMyTYY60g0NMIYkS3R/KHvi54dkMD0cecpNz8erPmN8qRAwtlp0OV54Lzgj42lovbkjLghjtst1WQvZbV6XIKdrWovFVtcpGLJS0Boo+VyL0Ms7cpe/qmeRzTA3fSzPjwBSRFqctNCAX1ruP5nEbGFzkoGEd9tRwI3dunvarZfVINbf0aGfA+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3W8pGaVc2cMlwUm9BgOXBHeKGdL9BkcQGzytKX0KxE=;
 b=LEXAV9Rh/uCPNIb4KbDWpymIFc5FtG7qfFZXLk2Jze0553PZLaEG98tTIItrYwEUzMOKWJBK5cgHaaugxdxJFjMH99Oh0YfjAnnh+YQWTuCXIAUhghZJ1TzLG+9875cNAm55Ve26s16dWqNLU6FEWxz1K67y58V95Zs9voPvWjFcFagqWkci/LiXtbObHMWFXkzFtrMqXZWLud/lbMr/eSlJj7e5qmU33fNHV1EDJimoNsbo1hHCZ5S04GK8Dj+lxl1ZhE0ufjhcHLUDTdm7+Tv60EAyNfeiZJfj1oTNamPZiX2GjxpyLpjFO0GsgE2uoYLal52HjBt1vBn821QPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 23:07:55 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 23:07:54 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 20/24] drm/xe: Add ULLS migration job support to ring
 ops
Thread-Topic: [PATCH v6 20/24] drm/xe: Add ULLS migration job support to ring
 ops
Thread-Index: AQHdPLK3N2sGQvHJQEytZ5ErI9kIhrbbUKzA
Date: Tue, 22 Sep 2026 23:07:54 +0000
Message-ID: <DM4PR11MB5456BA1AE40A76C8036B9C21EA832@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-21-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-21-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: 2e94a6dd-c986-4936-1baa-08df18fe557d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: f44AiKfzGyaHBt5SORDLHzQLAkOoN99nSlKf0cK0qzvc6hWnbRaymLhvIQ/DwWRCUL4pIFR+U0CYFottg8+UHsZ56aMANCvYi943X7ZFn9u4ytQ9mYtQ9IReL4fX/qayRpR4dmXsoLtCcVRLZjYE9+RmgUCb5PGOrFDl92k8gYFlKXVUF3Txz3u/qr6450BRWyyfIQGYtLCiZuySv9BVdu+4ME7SKEgr3Ash0pZX+4FpimyFgRmIwy+axEksRtVfvqHF8UOL6Umh2OpZxguAmwMssH3Q+yKe+aqfjeRpejX39i2zM+6yrAEAQHZTIoKmCfIKyx8DoIBMAw7Pb1jD66QyQWwkqfkgi9WOsvTixjND16vF0j2X2CC0jO0qakKvUg7cMGGjsy/8uxAQo5CEVrSMyKA1OCKi/W9jOeC1Fsh0WlLEu6yWWj23nwss/RnVEZCENfy7FqkeI6MYoQKShYmsosisdHbi+pFJsf0W62xFZlOtt+a0xQShlSjrA/tQo/prRVEu9yxGs+5gRm8cKKLDOBgucE2k36YP9XYYtrpKu8EXwV9zW7en2qb51WHJG7jsftnxbTtTc3C9xCb3VQutM4rNcXiJFWtY0/doXPXvuFSOmybYP8NXQ+UlL1F9QYA8dXv7m4fzf+1uRt5O7TAMQeq2De9Zqkwb4gbPUdc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZuAN0bdHfEABECTst54hIBay14BT+GqJ1P36oagGAvI3a6qowWgWD0mG0Qm6?=
 =?us-ascii?Q?XxlK9KVdw8lZW5UX9qEgaSYttL6HMVCowpSaflRh9OlTAH6xYIz8uUaaNjzF?=
 =?us-ascii?Q?gvHicwcfS2ItFBplG0yH6PUEcRwfol3GcAoMByk7GdudSy8kwc/CspuJqXto?=
 =?us-ascii?Q?scEAGr7mh8lOia0uiXfdSBqyRoZ9uRpI6vDnP3u7m6oFBGvHCNiJRV48/HV/?=
 =?us-ascii?Q?Ga8GFNfuulPfpdegtOHa9o1TsHQkrEl2reIQAUlVqLXH3jLerJ2O8mH+uRLp?=
 =?us-ascii?Q?dFU0GyrbcOXP1jKrvI5HSlxYwo9QoqhS9CjOLDrIcwS6OlqOZ2/8ianIZHx/?=
 =?us-ascii?Q?Uc7kzx/jvxpXq8UihPRLy8SXsGtIiFduoqD9nRKMW1whaFtB6Wy8jSWeGTzF?=
 =?us-ascii?Q?KyNFe4fkpcGsMep4ZxvrqCYqHI8C7B88TxNw+DwRf11hAzGaGYzgRpXdmL2D?=
 =?us-ascii?Q?lrD76OLadp2htCwItEwO4QT14lORCYZl1pPR9I/zG7S+6V0FcVt88o/oWisO?=
 =?us-ascii?Q?ffXLyYNAJdMe2wKdAUrn0U2A9H4E58HOviPRSqWGbX0fbivJncm2Jxlmn7le?=
 =?us-ascii?Q?gC2WxaaqTn3eVe1u5UBQWIW6mpnDEkMDi4YMYI0Pj3fdvrYCAR5Y5vMJU627?=
 =?us-ascii?Q?UmkWSpKoFRsEOz8vvh8deG8az79J15NKAuHd5fslmbcntz0sge9b5BXJUEMG?=
 =?us-ascii?Q?wwQ3jHazxCgK7r6qjhZFudKXNpuf9DHgovn3sXTztraJKPoE7FGjzZ/04Bo3?=
 =?us-ascii?Q?NYvfZCQ5g8gOG87BBW5yqw1RpEhM9NRvDZBSNJjN6nSgsOCGClJ9yCWD0Rlz?=
 =?us-ascii?Q?cjed/Y3yjJNHqxuQ77y403xspoGvduCblsF9K2BoyfO3XtbNMrctSaO/0HXI?=
 =?us-ascii?Q?zamWXB4NdUfZz84g947irUdM7JZSvaLhS//FqH02ufnwfXDL/uhU+61JWrQu?=
 =?us-ascii?Q?8A0ertE9n60c4nt3UXkLfxzY+1fDW7Fr0P2Er+31CTlWUtSE8U32iQ7dY8Se?=
 =?us-ascii?Q?QKBc0IhAZbnEgD0rTRy94G1qz8wU2HRUGb8LHKhVE88EY88CNVzjDDchUWrn?=
 =?us-ascii?Q?uArnaqlzNP1KUe+RnZn08UQUuJP+Y7rxZtrVtKT3QVAz1ofJ2RIKt0DdPuv0?=
 =?us-ascii?Q?s2BQv38h7tkpt8ZT7DEmUdKT8nF8qIPO/iYORAEfBtUi/17tQ1fbAoKTyQYS?=
 =?us-ascii?Q?eY2+e11l6TVDt7RAN3L242qX3OckQIxb0Gp274mbohnshfTYR0C7kFNs0+4i?=
 =?us-ascii?Q?aOtmsg0ZyYUe9RUgCDgKXQy86kgeXSV6LkKi223J7BOmvG3cnh5ak8sJCmCe?=
 =?us-ascii?Q?aIXxfegf/baplO5KO/ktmp5G/tPU8lXO8YG2Dg68OgnY8m8Xq6udJSZL0W02?=
 =?us-ascii?Q?2Ippe9c7+UcskECHNYXUGSCuqCA2QheE7Lbc9LRX+1sTbh5Ih37UA0HaaH7X?=
 =?us-ascii?Q?f6eEjWeZ20Y9H1X+tPU4K+lPm4p6gkya1HH1ejAXr8CS3vHXoTRUSXURMms/?=
 =?us-ascii?Q?NL7TOXw09CJcLT10UkAnDkGtc0xg27AIMtEALeqrv0l8jgpFYjJoDXSfQk03?=
 =?us-ascii?Q?2ZPghVu/lrdsjWs3wXiEF+d7edgciwBsL/WlUouZdyGSj0/LZRhs9XND03wT?=
 =?us-ascii?Q?fKKZ2PW9IfeSm+CKEMBe+SYD6TVj7Hdg78Skc8cC6IDJ7F3s+zlcBoc04Uc4?=
 =?us-ascii?Q?CZctfRjYCTsMCBGNfiFXAfli6Kt1xgmFfkZ5efe1gPnv+lzqwJpUO4WGQMrT?=
 =?us-ascii?Q?oT+l0R4RqQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fAI2Hp0XWYb2W+VgAA3nIwhTacU2JdHbRVXxo9NwdAAhnP+36LjfrvgGygH1wP9cRdfK7i92YVSS2i+WixCXSP6kguIgolQDKh0GV67z0Upa0eSRyebuZTrYtP3sLXBNeSmADNmXvGtgbc3G5LEQKwGpa67bRLwnXfPz8ArVvSdB65UlWZ8zV6FWdtYY0zTZnac9sRvXJeCDVshWVeQbtwoLRg/RVT2QKMEZNvWxG/j5jQ38FDaMWQ5M8/etXFEXg9NBwEuvxQbaCpvFAdft2ChJRoPjxUJUgGOmcHIT2nMV48Y/bS92EUTw14jbZA91zd/tN2CG7XV/U2o8XoRsSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e94a6dd-c986-4936-1baa-08df18fe557d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 23:07:54.4853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBzqK3l/4LXYhrNTWrDr8objBncgcixsMg6YhC8nTmdx3Yh2lMdrVycdfNYufSSYd/hD+1DYPnnZHZEdIYU6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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

On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> Add preamble and postamble for ULLS migrations jobs. Preamble clears
> current semaphore for reuse. Postamble waits on next semaphore which is s=
et
> upon next job submission, then advances the ring tail over that job with =
an LRI
> to RING_TAIL, so submitting it costs the CPU nothing beyond signalling th=
e
> semaphore.
>=20
> A job updates the tail on behalf of a successor which has not been emitte=
d yet,
> so it cannot know how much ring that successor will occupy.
> Pad every ULLS job out to a fixed ULLS_JOB_SIZE_BYTES, which makes the ne=
xt
> tail derivable from where the current job starts. The pad also supplies t=
he
> NOPs which must follow an in-ring tail update.
>=20
> The last ULLS migration job skips BB submission, the postamble and the ta=
il
> update (clear current semaphore, write seqno, exit ULLS), padding the
> difference so that it still fills a job slot.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-23-
> matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 86 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ring_ops_types.h | 24 +++++++
>  2 files changed, 110 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 39a670e91ba7..f05b4276c8d1 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -494,6 +494,79 @@ static void
> __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));  }
>=20
> +static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32
> +seqno) {
> +	u32 addr =3D xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
> +
> +	return emit_store_imm_ggtt(addr,
> LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR,
> +				   dw, i);
> +}
> +
> +/*
> + * Advance the ring tail from within the ring, so submitting the next
> +ULLS job
> + * needs nothing from the CPU beyond signalling the semaphore. All ULLS
> +jobs
> + * occupy exactly ULLS_JOB_SIZE_BYTES, so the tail the next job ends at
> +is two
> + * job slots on from where this job started, even though that job has
> +not been
> + * emitted yet.
> + *
> + * The saved tail is written before the tail register so that a context
> +save
> + * racing the pair can only restore a tail behind the register, never
> +ahead of
> + * it. The register write is deliberately not MI_LRI_FORCE_POSTED:
> +posted, the
> + * new tail can land after the command streamer has already drained
> +this job,
> + * at which point it sees an empty ring, parks, and can be taken off
> +the
> + * hardware with no H2G left to bring it back.
> + *
> + * The tail is published before the semaphore wait rather than after
> +it, so
> + * that the non-posted write drains while the engine is parked anyway
> +instead
> + * of adding a register round trip after the semaphore is signalled.
> + */
> +static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32=
 *dw,
> +			       int i, u32 head)
> +{
> +	u32 next_tail =3D (head + 2 * ULLS_JOB_SIZE_BYTES) & (lrc->ring.size -
> +1);
> +
> +	xe_gt_assert(gt, IS_ALIGNED(next_tail, 8));
> +
> +	i =3D emit_store_imm_ggtt(xe_lrc_ring_tail_ggtt_addr(lrc), next_tail,
> +				dw, i);
> +
> +	dw[i++] =3D MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> +		MI_LRI_LRM_CS_MMIO;
> +	dw[i++] =3D RING_TAIL(0).addr;
> +	dw[i++] =3D next_tail;
> +
> +	return i;
> +}
> +
> +/* Publish the next job's tail, then park the engine on its semaphore

One question, while tail is updated and the next job is not filled yet,
Will HW prefetch the stale ring buffer?
I assume it should not be an issue, just want to confirm it. Thanks.

Rest LGTM. With the question be cleared:
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>


> +*/ static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, =
u32 *dw,
> +			       int i, u32 seqno, u32 head)
> +{
> +	i =3D emit_ulls_ring_tail(gt, lrc, dw, i, head);
> +
> +	dw[i++] =3D MI_SEMAPHORE_WAIT |
> +		MI_SEMW_GGTT |
> +		MI_SEMW_POLL |
> +		MI_SEMW_COMPARE(SAD_EQ_SDD);
> +	dw[i++] =3D LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> +	dw[i++] =3D xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
> +	dw[i++] =3D 0;
> +	dw[i++] =3D 0;
> +
> +	return i;
> +}
> +
> +/* Pad out to the fixed ULLS job size */ static int
> +emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i) {
> +	xe_gt_assert(gt, i <=3D ULLS_JOB_SIZE_DW);
> +
> +	while (i < ULLS_JOB_SIZE_DW)
> +		dw[i++] =3D MI_NOOP;
> +
> +	return i;
> +}
> +
>  static void emit_migration_job_gen12(struct xe_sched_job *job,
>  				     struct xe_lrc *lrc, u32 *head,
>  				     u32 seqno)
> @@ -507,10 +580,16 @@ static void emit_migration_job_gen12(struct
> xe_sched_job *job,
>=20
>  	xe_gt_assert(gt, !job->ring_ops_force_reset);
>=20
> +	if (xe_sched_job_is_ulls(job))
> +		i =3D emit_ulls_preamble(lrc, dw, i, seqno);
> +
>  	i =3D emit_copy_timestamp(xe, lrc, dw, i);
>=20
>  	i =3D emit_store_imm_ggtt(saddr, seqno, dw, i);
>=20
> +	if (!xe_sched_job_ulls_has_batch(job))
> +		goto seqno_write;
> +
>  	dw[i++] =3D MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again
> below */
>=20
>  	i =3D emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i); @@ -521,12
> +600,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>=20
>  	i =3D emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>=20
> +seqno_write:
>  	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
>  				job->migrate_flush_flags,
>  				dw, i);
>=20
>  	i =3D emit_user_interrupt(dw, i);
>=20
> +	if (xe_sched_job_ulls_parks(job))
> +		i =3D emit_ulls_postamble(gt, lrc, dw, i, seqno, *head);
> +
> +	if (xe_sched_job_is_ulls(job))
> +		i =3D emit_ulls_pad(gt, dw, i);
> +
>  	xe_gt_assert(job->q->gt, i <=3D MAX_JOB_SIZE_DW);
>=20
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 52ff96bc4100..ea4af321dd7c 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_RING_OPS_TYPES_H_
>  #define _XE_RING_OPS_TYPES_H_
>=20
> +#include <linux/build_bug.h>
>  #include <linux/types.h>
>=20
>  struct xe_gt;
> @@ -14,6 +15,29 @@ struct xe_sched_job;
>  #define MAX_JOB_SIZE_DW 74
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>=20
> +/*
> + * ULLS migration jobs advance the ring tail from within the ring
> +itself, so a
> + * job has to know where its successor will end before that successor
> +has been
> + * emitted. Every ULLS job is therefore padded to a fixed size, letting
> +the
> + * next tail be derived arithmetically.
> + *
> + * Sized for the largest such job, emitted by emit_migration_job_gen12()=
:
> + * preamble (4), copy timestamp (8, its size on an SRIOV VF), start
> +seqno
> + * store (4), arbitration off (1), batch buffer starts (2 * 3),
> +pre-parser
> + * bracketed flush invalidate (6), seqno flush (4), user interrupt (3)
> +and
> + * postamble (7 + 5).
> + */
> +#define ULLS_JOB_SIZE_DW 48
> +#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
> +
> +/*
> + * RING_TAIL only encodes a qword aligned offset, and
> +xe_lrc_write_ring()
> + * appends a NOP to anything shorter, either of which would
> +desynchronise the
> + * ring from the tail a job predicts for its successor.
> + */
> +static_assert(ULLS_JOB_SIZE_BYTES % 8 =3D=3D 0);
> +static_assert(ULLS_JOB_SIZE_DW <=3D MAX_JOB_SIZE_DW);
> +
>  /**
>   * struct xe_ring_ops - Ring operations
>   */
> --
> 2.34.1

