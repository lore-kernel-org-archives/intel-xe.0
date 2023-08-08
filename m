Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2DCC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 23:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366C010E21F;
	Tue,  8 Aug 2023 23:02:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3510E21F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 23:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691535722; x=1723071722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mqhwu1TdHLkZNrZBjN0oMjfwNyOdJl0hrx5dXmBwpIg=;
 b=G24qPCbnOod+SoTF2ScN8qUelKlhaIJ4894lo85QIKnMrolOXnhMdTrV
 UUyZU3KWzfOjhHUp2tdy/jCCb/pVSUfLiKI+X/0Xpv0B3qQPSROF6JEqu
 /K/J9cGR5lrkw+jIBuCzKKjS0p6FyfD5p5TkezJ4pa+UKwoIQZyJn5gfO
 JCOeOabTsYO+CCYggKEj06rzKpH/TXHFi1vyHNRVX2z7UplvoSP0DcUV+
 JcWz4//RsviA8wd0V6xJxev45gMci4gYgjMxJU7uFtijLS3OsfqrreKpe
 YXq47wXxMNavtJp7BOUaAG+c1gvhr0PejSo4H3keIbLC7XMQNn0Hw1//v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437337112"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="437337112"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 16:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821592839"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="821592839"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2023 16:02:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 16:02:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 16:02:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 16:02:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 16:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feiFC7zC4FWp/8fhcwGSIPJnb2a0qb/BCDlysipfXnuhxmLViizkU7znBAO4qANfLacBqEZgjNIdHnuP6zOsIWFieix2+TOXBxr+jgGW3Zw2YEyukxxKeH+IPIGTLT6Uk07TmsPFHthX54JadcrAzxBtdfEsOZOann2X6/60qCau5mj8kRqBK8TwOaVIrUtTxrHSmw2s3MPpkdX/PyUIq5NKDRPtGw6zGbxhImUoM91tI4X6bsde1sLtDb2mgN7jSUyrBMJa3BgWqN6VDcDa1ltEJk1g5r3brBt1K87+CBOK5AovxuoocALKH3eaimyBvTD9haRcZBwRP0UQPCpH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnbMKyAAFhsOZARIgSIBJX+FR/pQ12XOStv+jOUF+E0=;
 b=S21hGd2XOhpwN7aEBe4+tinA//qJQoJ9Jr7dkuN9UIe5tMBnTM6SDBm/ZrpchGIZsIJqebMO+tg0Yisne//8zZyD3sR5DQ86OBIDH55dJwKJh6d5tBWA6ICUnrtrAwKBLwdAh5EQtGnQoyXgKfKRwbVE8iOuVbfAjyNIgfJMZwl3Znbz7Hu2fgPiXOgRdEnddI2sG+KfuTSpV4ktIpoOU7NhC0zH7MuPKxvkGDOU8AwInA35TdDczU13mTcdEVlFXE22E49eOvnilR5o33z85zG01GdhD0A48spmpcWRnY4sLP9EhQAFnv7rFeErOwXFRTL8WyOlqx+KEixA8SyUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 23:01:57 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 23:01:57 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct out
 xe_tile
Thread-Index: AQHZyaFF2lCi6C+UuEGSgOc/gS85ta/g3l0AgAAPMlA=
Date: Tue, 8 Aug 2023 23:01:56 +0000
Message-ID: <SA1PR11MB6991A3091FECD53DAC62B1B7920DA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230808024334.11619-1-oak.zeng@intel.com>
 <20230808024334.11619-2-oak.zeng@intel.com>
 <IA1PR11MB64188186C3BF62745EC8178AC10DA@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB64188186C3BF62745EC8178AC10DA@IA1PR11MB6418.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB7949:EE_
x-ms-office365-filtering-correlation-id: 38ce6b81-3418-46d5-b7c4-08db98637701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ml1hipRss3yhLg4gjwPDGfHHbEUyUdkou/N7mk7k2FsA8ZIZujqFrDG7XJBNf8p90IKdi2P6RjotYyqeODjXqSYpi/mzoUETEMTIvAFAO4QRM6mZjflrA5kfK3fWWcDBU81gMBSYXfJwqwOIL5icVsYQidjJRNQJCaJWKfXWmGblzAyiuzMFSvkBzDzbeUixY+FlDqNOiBltIKMKNa2k6tbgDGR8gfRBOc+7SAnGZ5KcODHUr/geas7zFPC2Nwpbl+uB28baJJCWAQXi8jrLp424O0+OMnP5qPZFlex7c7aRlIsbsKdmjd8oVc19gI/4hiFHgfRgpg9MnBksb+V7OKW0H9llu9hnAZIo7Zn9SxArk7j26nEnUCdesP5dlZnJgVqWSKblJXYsv+5VAD4tw2o3O/Ktl8yUmzTkVsXId4cR7pQwcxC80LEkD3uXWK1f8vq4lD1Nvz5pTmvKoxQlg0Ai26+FGk/xis/TqEuMVHkf0ApCqum/ZC9VPu7Jq0u00xZhtHEmpmkEBUq+y0UZAttV9ZHiO45gviF2Nh6UmvT9cQDzUidAtKkGnd+ZAhNknxvuOp1U5o9Qqxn9Qadqr1pazNRSNqDkoP+b33hvlV8OKUzjAhQpgv2AJOHtZdi3ANQjGWsWxNtx21pc1l1sEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(186006)(1800799006)(83380400001)(71200400001)(9686003)(53546011)(82960400001)(6506007)(110136005)(38100700002)(122000001)(478600001)(26005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(107886003)(7696005)(38070700005)(8676002)(52536014)(5660300002)(2906002)(41300700001)(8936002)(316002)(55016003)(86362001)(33656002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QU+TLmzSlQVbjOB0aPji+BzCA/FnAxMF3nTYBm1ZPleRFNSG2PeiNFTZU269?=
 =?us-ascii?Q?zV43FC3bo9OJyuXuULcKRQAO5BnXKLIAazRexczcu03fpF4iBfagwiaDzV/2?=
 =?us-ascii?Q?WVwFmSGVxd1W2uQE8uXKIxD/x2Xw4wQHkm/VJxm9h7huy0No9S0rzljZ5Noq?=
 =?us-ascii?Q?jNg94rLaOGCa84Fpwl29ISocgvqicuP+UyCEV7LrmfAbNezemX7Tw6nHA5k1?=
 =?us-ascii?Q?+sCwsEYgMzvj3T4YP1y8l8tS07Fwwk3GPQmDJ2YyZ/TCqu9HSTVtb3CjW0oo?=
 =?us-ascii?Q?sMhwy9v0ImESL06MyC/kS6inVegz4MEWX27TSLvzjF0V5JFKZCnxxqxa2XjA?=
 =?us-ascii?Q?A4lzEo/3D5m/CmIQucibvP3DaYC3mzDL/rKMxqtSsiXwGoOJFwOgkujL/e0Z?=
 =?us-ascii?Q?gG8Fz4AgP8i//NlUEROAGQcExHwi9mnDRapE5ediGV5b/cYKxf4Wo+RFXt+p?=
 =?us-ascii?Q?fhIMkfgGk1zfRdB7o3HEX1eEePnNHVrSSryvrcmqn6SnMgrb2Vr9z/7HxxwC?=
 =?us-ascii?Q?zNIdpqeZJDxMo0+ebmRt/9/hwCl8sJjKapiERAObQN/ms2U6oxCTjEN3PuNi?=
 =?us-ascii?Q?H12OY8vVva/h7QEQkid9zw2S5elUxJzdyqnU/XzbqDM8TI1KYnyd/AKUt8qQ?=
 =?us-ascii?Q?edCiqvkaDAcV+tvzu8F8DThnh1ZRl1HUcXARpvh1wlFZmE7m+G1YPaIqodJZ?=
 =?us-ascii?Q?yPOEaXBlXY4mgndKnaGGm3YVTOoXFTrXBqKs8S0R88yff3ZvoJ8tj62kQ8ee?=
 =?us-ascii?Q?tY6IFfOiL3lkH6v+MEO3TGzXt1216Nxn160QCHWRuHrhhZKqF30TQB7HuxmH?=
 =?us-ascii?Q?RZ6c0tsIOUUi+9YTKOEn/exysI0w51jfAsIndSyX0CxQhmX9letAR1w/uJOM?=
 =?us-ascii?Q?Tdue8D8S0Piiz3FqpSHLS1Nw3ZYJqqNjDMmcvJTEbpDBz9ght+qIqhfc+0qO?=
 =?us-ascii?Q?vpx0hQ1cbcZwGGcUhSZvf9kj401v9WvUgNtNf+3Ak6nZz6fpK+ZhwuwFJ6fR?=
 =?us-ascii?Q?vwCaGh/BIA3Le/+f3gVJFFqWwyX9izZctZVFHhlZ/snCK7DsN0S/JIL5jP30?=
 =?us-ascii?Q?cEz0guYUOMuVNfaWEuJm5YDZ0rKxpSWCDO7fWL664DvIC7HV1dIIUBhNwXXr?=
 =?us-ascii?Q?tUyjj58VCHr7Eo7OwUgnECG2iPzdndOAyu5djrqOJ96Ls5GzCrsovoyteYKV?=
 =?us-ascii?Q?RHfAB6SzgopOZwziGaWUJzZVny0BfsgRLJRzJaJiTKtkNXi7alpKaT4a8aA3?=
 =?us-ascii?Q?O4z3xlY4o0ccan1D7BIQEauE65W4T3yWlJy6dcrPCl82CWllaG7e13GjFWM2?=
 =?us-ascii?Q?YR9H/LpvFwmgkp8JHaTaTuZfQzoZiCzLlJJBrS9UjT+6rrbX2j1GN3gaW8Kc?=
 =?us-ascii?Q?TvjwxPw19gReO6iLTxmwqJNzdqPaVaXDFyLJ/jqUP/e3grhXcvJudxUFrvNK?=
 =?us-ascii?Q?wzdSFBWTfenPTdVSQsl6g9VeEc0ZCRjFmY8hNInXaf7EQYJ+tA3pv/ZbyDVq?=
 =?us-ascii?Q?A4KBxhIQnqq8mTg2PsmpbnbQRlV/1aIfXmi4Qv5yFHXxsI8tQF+QHmPnyEz2?=
 =?us-ascii?Q?yal73faAG8vtwii7WeE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ce6b81-3418-46d5-b7c4-08db98637701
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 23:01:56.8790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsFzUlFsRe5PAXNkdoFxnH6NVzltj8ps6iwWvwaZt0x1/fn7yqS9EITcN2lMfHXA6ik6zugDo2Z88Lw2j2RcAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct
 out xe_tile
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



Thanks,
Oak

> -----Original Message-----
> From: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Sent: August 8, 2023 4:42 PM
> To: Zeng, Oak <oak.zeng@intel.com>; intel-xe@lists.freedesktop.org
> Cc: --cc=3Dmichael.j.ruhl@intel.com; Kershner, David <david.kershner@inte=
l.com>
> Subject: RE: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct=
 out
> xe_tile
>=20
> >-----Original Message-----
> >From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Oak
> >Zeng
> >Sent: Monday, August 7, 2023 10:44 PM
> >To: intel-xe@lists.freedesktop.org
> >Cc: --cc=3Dmichael.j.ruhl@intel.com
> >Subject: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct ou=
t
> >xe_tile
> >
> >Make a xe_mem_region structure which will be used in the
> >coming patches. The new structure is used in both xe device
> >level (xe->mem.vram) and xe_tile level (tile->vram).
> >
> >Make the definition of xe_mem_region.base to be the DPA of
> >the vram and change codes according to this new definition.
> >
> >Also add a pagemap member to this structure. pagemap will be
> >used to map GPU local memory to CPU's HPA space as ZONE_DEVICE.
> >This is preparation work for introducing svm (shared virtual memory)
> >
> >Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_bo.c           |  2 +-
> > drivers/gpu/drm/xe/xe_device_types.h | 96 ++++++++++++----------------
> > drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
> > drivers/gpu/drm/xe/xe_mmio.c         |  7 +-
> > 4 files changed, 48 insertions(+), 59 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >index 284c86107a5f..a397a7224a99 100644
> >--- a/drivers/gpu/drm/xe/xe_bo.c
> >+++ b/drivers/gpu/drm/xe/xe_bo.c
> >@@ -1457,7 +1457,7 @@ uint64_t vram_region_gpu_offset(struct
> >ttm_resource *res)
> > 	if (res->mem_type =3D=3D XE_PL_STOLEN)
> > 		return xe_ttm_stolen_gpu_offset(xe);
> >
> >-	return xe->mem.vram.base + tile->mem.vram.base;
> >+	return tile->mem.vram.base;
> > }
> >
> > /**
> >diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >index f84ecb976f5d..a454a5098121 100644
> >--- a/drivers/gpu/drm/xe/xe_device_types.h
> >+++ b/drivers/gpu/drm/xe/xe_device_types.h
> >@@ -57,6 +57,46 @@ struct xe_ggtt;
> > 		 const struct xe_tile * : (const struct xe_device *)((tile__)-
> >>xe),	\
> > 		 struct xe_tile * : (tile__)->xe)
> >
> >+/**
> >+ * struct xe_mem_region - memory region structure
> >+ * This is used to describe a memory region in xe
> >+ * device, such as HBM memory or CXL extension memory.
> >+ */
> >+struct xe_mem_region {
> >+	/** @io_start: IO start address of this VRAM instance */
> >+	resource_size_t io_start;
> >+	/**
> >+	 * @io_size: IO size of this VRAM instance
> >+	 *
> >+	 * This represents how much of this VRAM we can access
> >+	 * via the CPU through the VRAM BAR. This can be smaller
> >+	 * than @usable_size, in which case only part of VRAM is CPU
> >+	 * accessible (typically the first 256M). This
> >+	 * configuration is known as small-bar.
> >+	 */
> >+	resource_size_t io_size;
> >+	/** @base: This memory regions's DPA (device physical address) */
> >+	resource_size_t base;
>=20
> I think you can eliminate this value....  Like your comment (later indica=
tes) this
> value will be derived differently and keeping it here doesn't have any be=
nefit.

This is a memory region's definition. I don't get why a memory region can't=
 have a DPA.

I use xe_mem_region definition at both device level and tile level. For me,=
 it is reasonable each tile's HBM has a DPA. So we need to keep the base me=
mber for tile's memory region.

At device level, I don't see base is meaningful because memory really belon=
gs to tile, not device. Maybe we can just leave device's base unset, or set=
 it to the first tile's DPA.

>=20
>=20
> >+	/**
> >+	 * @usable_size: usable size of VRAM
> >+	 *
> >+	 * Usable size of VRAM excluding reserved portions
> >+	 * (e.g stolen mem)
> >+	 */
> >+	resource_size_t usable_size;
> >+	/**
> >+	 * @actual_physical_size: Actual VRAM size
> >+	 *
> >+	 * Actual VRAM size including reserved portions
> >+	 * (e.g stolen mem)
> >+	 */
> >+	resource_size_t actual_physical_size;
> >+	/** @mapping: pointer to VRAM mappable space */
> >+	void *__iomem mapping;
> >+	/** @pagemap: Used to map device memory as ZONE_DEVICE */
> >+	struct dev_pagemap pagemap;
> >+};
> >+
> > /**
> >  * struct xe_tile - hardware tile structure
> >  *
> >@@ -114,38 +154,7 @@ struct xe_tile {
> > 		 * Although VRAM is associated with a specific tile, it can
> > 		 * still be accessed by all tiles' GTs.
> > 		 */
> >-		struct {
> >-			/** @io_start: IO start address of this VRAM instance
> >*/
> >-			resource_size_t io_start;
> >-			/**
> >-			 * @io_size: IO size of this VRAM instance
> >-			 *
> >-			 * This represents how much of this VRAM we can
> >access
> >-			 * via the CPU through the VRAM BAR. This can be
> >smaller
> >-			 * than @size, in which case only part of VRAM is CPU
> >-			 * accessible (typically the first 256M). This
> >-			 * configuration is known as small-bar.
> >-			 */
> >-			resource_size_t io_size;
> >-			/** @base: offset of VRAM starting base */
> >-			resource_size_t base;
> >-			/**
> >-			 * @usable_size: usable size of VRAM
> >-			 *
> >-			 * Usable size of VRAM excluding reserved portions
> >-			 * (e.g stolen mem)
> >-			 */
> >-			resource_size_t usable_size;
> >-			/**
> >-			 * @actual_physical_size: Actual VRAM size
> >-			 *
> >-			 * Actual VRAM size including reserved portions
> >-			 * (e.g stolen mem)
> >-			 */
> >-			resource_size_t actual_physical_size;
> >-			/** @mapping: pointer to VRAM mappable space */
> >-			void *__iomem mapping;
> >-		} vram;
> >+		struct xe_mem_region vram;
> >
> > 		/** @vram_mgr: VRAM TTM manager */
> > 		struct xe_ttm_vram_mgr *vram_mgr;
> >@@ -264,28 +273,7 @@ struct xe_device {
> > 	/** @mem: memory info for device */
> > 	struct {
> > 		/** @vram: VRAM info for device */
> >-		struct {
> >-			/** @io_start: IO start address of VRAM */
> >-			resource_size_t io_start;
> >-			/**
> >-			 * @io_size: IO size of VRAM.
> >-			 *
> >-			 * This represents how much of VRAM the CPU can
> >access
> >-			 * via the VRAM BAR.
> >-			 * On systems that do not support large BAR IO space,
> >-			 * this can be smaller than the actual memory size, in
> >-			 * which case only part of VRAM is CPU accessible
> >-			 * (typically the first 256M).  This configuration is
> >-			 * known as small-bar.
> >-			 */
> >-			resource_size_t io_size;
> >-			/** @size: Total size of VRAM */
> >-			resource_size_t size;
> >-			/** @base: Offset to apply for Device Physical
> >Address control */
> >-			resource_size_t base;
> >-			/** @mapping: pointer to VRAM mappable space */
> >-			void *__iomem mapping;
> >-		} vram;
> >+		struct xe_mem_region vram;
> > 		/** @sys_mgr: system TTM manager */
> > 		struct ttm_resource_manager sys_mgr;
> > 	} mem;
> >diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >b/drivers/gpu/drm/xe/xe_migrate.c
> >index 18c94022930f..956a96b38346 100644
> >--- a/drivers/gpu/drm/xe/xe_migrate.c
> >+++ b/drivers/gpu/drm/xe/xe_migrate.c
> >@@ -264,7 +264,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *til=
e,
> >struct xe_migrate *m,
> > 		 * Use 1GB pages, it shouldn't matter the physical amount of
> > 		 * vram is less, when we don't access it.
> > 		 */
> >-		for (pos =3D 0; pos < xe->mem.vram.size; pos +=3D SZ_1G, ofs +=3D
> >8)
> >+		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos
> >+=3D SZ_1G, ofs +=3D 8)
> > 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > 	}
> >
> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >index aa9c573b1243..0d0966691eaa 100644
> >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >@@ -173,6 +173,7 @@ static int xe_determine_lmem_bar_size(struct
> >xe_device *xe)
> > 	if (!xe->mem.vram.io_size)
> > 		return -EIO;
> >
> >+	/* XXX: Is this correct? Device's DPA should be decided by IAF */
>=20
> Yeah, let's get rid of this... When the driver code that use DPA comes al=
ong, we
> we can add it to the tile->mem.vram.base  instead of using this value.

Ok, I will delete below line.
>=20
> > 	xe->mem.vram.base =3D 0; /* DPA offset */
> >
> > 	/* set up a map to the total memory area. */
> >@@ -281,7 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > 			return -ENODEV;
> > 		}
> >
> >-		tile->mem.vram.base =3D tile_offset;
> >+		tile->mem.vram.base =3D xe->mem.vram.base + tile_offset;
>=20
> So remove the vram.base from here.
>=20
> When the DPA code comes into play, it will get added back with the approp=
riate
> value.

I think we can still have tile->mem.vram.base. Just set it to tile_offset n=
ow. And add a comment saying needs to add device's DPA (which is from IAF m=
odule).

I will need this tile->mem.vram.base member in the coming svm patch series.

 Agree?

Oak

>=20
> With those changes:
>=20
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>=20
> M
>=20
>=20
> > 		tile->mem.vram.usable_size =3D vram_size;
> > 		tile->mem.vram.mapping =3D xe->mem.vram.mapping +
> >tile_offset;
> >
> >@@ -304,10 +305,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > 		io_size -=3D min_t(u64, tile_size, io_size);
> > 	}
> >
> >-	xe->mem.vram.size =3D total_size;
> >+	xe->mem.vram.actual_physical_size =3D total_size;
> >
> > 	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe-
> >>mem.vram.io_start,
> >-		 &xe->mem.vram.size);
> >+		 &xe->mem.vram.actual_physical_size);
> > 	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe-
> >>mem.vram.io_start,
> > 		 &available_size);
> >
> >--
> >2.26.3

