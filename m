Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117B5EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 13:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17FF10E24F;
	Mon, 21 Aug 2023 13:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B610E24E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692623389; x=1724159389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iftIKmrH1ijptYRmwAP8XXxBTE2i7vJxqmj60OaEvUs=;
 b=CgMawgpN+wpuGCLTqWKBUhB1Giqdtj76QIwwY24Qi1D59ylAx3SsjtTj
 YOxCzkFmCBZfipp3X8wHqL3LPu0PV0GmtCDsvwikk5/YPQbJQmEI/Tcnj
 MXx/JVW074tky20ha+i3N5G5q93Levz+Ztuc5JE37wsKaqI/6eI6b3r/B
 TApuRkgGuI6nTsAxcSa+PkDMFr533uQeZdkR4m/XydQEoRu5nFEfuXUiI
 v6O2UxHkQPJI/pJaDPyTwWFuTcOj6sueFuNMXoAsZmGfNcBURpAXRO2bQ
 U4BlRUztMiqwkcYvgzVcVxIG0tVCwZ0bTZtFiDuDwrKUQ+JFn+msul7+1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="439958678"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="439958678"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850170834"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="850170834"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 06:09:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:09:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:09:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 06:09:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 06:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVjudgtumWS24PrUaNE1M/6r3eeVonmPsQ7N89BgwUxi2H5515BB+HJUkvuZ1fd3CPHZ1GaXNuSC0rQ8HLqbSnUhyWmqiCzrU8ntuJS7rKqbvfI2Dsb3gFrE/OGT6/gH6ulEmvP5UCTF6uSiMWtSx1pptHwM2xSbxcmFtYZfriYnSTk+6Nv3HPkWH97zl0OEqXzHB1F/xzDVv/ubQiiFxqgbYU6SgyD9jkwLF/1cBhKoBUaWFnbWDmHsREuh8V1diPa/ACv1IQDKwhq46T5lX0+f8nmgXbAoBmyasP0lQLvXaGV5tvKaR91Dkm4OIm4zmvM5rAI5ont5+JJaVXnY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM7S9JO4irw0h74VbjJf4fY/dUfPXBFNZ2QsUlZ1xa4=;
 b=jNfXvS0hYUTP3WoxqjtkrRLKc9WIkN8WOhGOsgT31PHNhiJ74835Kq3f7JGZ19DmD6a2duqr4xLEMQUrLAKPPOoBeUqwr7tBc85qngUU3d+28roAen7DyXsFxU2UXk3hxsndUigiKCwIIjFIunpsNIiRdO+peEv6gNBRXU9mnztC+xU5o2y9wqwb0L1zOKABpwEYeSvrGR8OEubNmW/nWz1K4QvX5eFlbgKlFf+LLFgrPx7K9YYz/NsV0orKJxXevkoiTaggTmWLXgfxjRQbs4pYK/dUSZzbuaBixRf03c0NDZaDburpjBjBDMCCN8Ac3EFrehqftFzmeNyWkyQhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:09:15 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:09:15 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
Thread-Index: AQHZ1Caui+Z2KH2a8kKZu4xzzrvMsq/0uKlw
Date: Mon, 21 Aug 2023 13:09:15 +0000
Message-ID: <CY5PR11MB62112CF2D7047C7BBC7232F5951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH8PR11MB8257:EE_
x-ms-office365-filtering-correlation-id: e696ed6c-0ce3-4307-8d19-08dba247d222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LwC7oozBoEYxsgN/3oOhSHf2ilUj0zpwaeiiXfxbxqeGlxzZBc2WeMD+wx4eaggIiNuc1KkdQl9I/ykg4+na443EvAgQ03DjI48izqkzi6pkajivYKZKLUA13jQFOFBzjMw+u+OZjAvnfCBKUU/Y1I0cwky8BjQYqaCVdKWpnkEuzfKiKnGmIInkU2U8m+QWMgFB1XzBTLXnOOnzOUyumALEWTfVjDllUqok1GA+/QQer+wSyuP+gzesxDDWHFUnZUJNXcN+BWaS4ReGq3Rnq6TjvxJ/bj9DLjtyjeplJvgjeeZyehTYno+hMPSj+c6r+ktBxrCD605SH3MYA2PT/RGi1S/1GpLm6o7e8c7NCQ2z1a+BFI8hJEX5pBAuZNkm6roPJ5RDrErRDgaaukUxNIcb3yvXEUBTmX8UBAQgWjgEZgCxtVBWz6Pe+291qGk+1owtqStjJPPMfy1ewJ4nzwaor2VubTd1uffpNcIz5Ipkt8vYH3GdUUZXbD5dQYiCnhIfN7uaMHO6vs7Mnt09C20RHYQ1mIYou/UUk1MRqYDJ2mwIHq9GerjFpqpwR/Jf5J5btBl+VNp1UuHWSOTpuoq8gDry6LicetmzPR5hhatkMSlB+OfAsiJCqclv/KR7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(2906002)(4744005)(53546011)(38100700002)(38070700005)(6506007)(83380400001)(5660300002)(52536014)(33656002)(26005)(7696005)(86362001)(8676002)(8936002)(107886003)(4326008)(64756008)(66946007)(316002)(9686003)(66446008)(66556008)(76116006)(66476007)(110136005)(82960400001)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QwdsSGq692jUzTP6Yru81VBDh/zoS5lmA/ccr0ycd83ILYtB3qrsjTCR7jO+?=
 =?us-ascii?Q?3Dm1Wi6JkHoLD8yABq8EBgC3lz6Ir/qyWpVlHz5hac7EB1PvmTlwKO5bjBBT?=
 =?us-ascii?Q?F9Z2l/7wXDBV3vQM2mVkb1cHuTNG9mneDH3EOlDgAsTWZPGjsj9vfDjYWLIt?=
 =?us-ascii?Q?NzJh9BZtrK3/+KgYJGGuSKp74bc2dMTEX7eg5vnt95Wu4AbTcLkqVqVC0YCT?=
 =?us-ascii?Q?4xQgJl4mTXuXYAzLrcOtlFPa2kE4xr75utS4Kh3mkpqzKzxnXgamyFaVMxRd?=
 =?us-ascii?Q?rGZypEyV2SKpIK4jBpihkzCIzju2qBxef7q/0FVysw37I/gRCqJbVIed6S4z?=
 =?us-ascii?Q?36ymwljWhD8nqskA15DI6icDNyiTkoVsXU4lTU9qdCDnRt3+xIOCDzjfNeOa?=
 =?us-ascii?Q?ifBkxkpGwqGexs7ZRBu0KAGMr6PoiwWMPTuxgBzz3viDbDo+j8n43TKGyk56?=
 =?us-ascii?Q?FzrEIvClyF/ML3SrzjRG9QMuerIxfzaJLuVO6anhFRmCIfVpMI/kiW9JqiQX?=
 =?us-ascii?Q?jE/AntZpn4OUO6Bvpkbdf6jnP+dE89489CI95dW+I/Er5TAG6JDhEptLsN84?=
 =?us-ascii?Q?cKop5pwea5HpLCm87R8gNFesBfq1tymS8i3gxbC+fBP6v4lm1TrKXVqZ6Px2?=
 =?us-ascii?Q?2yBtp9WqZcW3QJ1BgSoZgy8UN+sGxBybXlVYfRXOHSAnqcnDND/mhBPgUJdA?=
 =?us-ascii?Q?o0rW9wBBdAg5QyhS8LSYvrFbY6NGb0Ut7reZwTL25Yn4b3EP/JgzrSVsvzQh?=
 =?us-ascii?Q?5ah3hsrB9y/dzZT/Zq5z34hfe7Dt8JQh2MP/LbFyezldlHcfbC7vlTwsgkld?=
 =?us-ascii?Q?C8Z/RgKZj411w4JHX6w/9x8cDWSDm0M7Ly7wYCAQoUS0lSsGsfPEsMyYw0rD?=
 =?us-ascii?Q?cjKwdDqmToLlF3sthsWmkM0ejUSeOlOSdwxdsK0nAwuJXXcvHPaGOhZ3rR+L?=
 =?us-ascii?Q?BCSB2qXtZEwcdEf5TAMs+hOJnEryqOV/QwuNzSd3F3KFqucPNWJKlLpFTUCJ?=
 =?us-ascii?Q?YgkDSljsz5MHzAcfPfmpHmbYW1esBapYCQvdDddqk08iIVVuoZqVdXK7D291?=
 =?us-ascii?Q?V0GPsk/zW1fSgr0YB+Nh9dF/Fdbxls5TvmWAl1o/XVpj1cSDNMue/uEPwGA9?=
 =?us-ascii?Q?rUHoDGEbfYZdkgcWiWoCYyCSn8fpPyNZ/0bQi+6DlAoaD80tKU+gKxg/qVsz?=
 =?us-ascii?Q?Zd5UrCrspyHG/QAgLMX/7euNYe+OYK7VWQ9a83pnLAuyXfr5vWxa12S550GH?=
 =?us-ascii?Q?hMNlo+wbniBOhnLfxoTDe184BIZ69uAwOPJ201qtFDhXRDvhrG6hPFGkG4WV?=
 =?us-ascii?Q?fLFtti0OBUBoCdTqaeifpiIa4LloWsO8L7J8mbUjPxWYiKk7iegFBCDFBmaX?=
 =?us-ascii?Q?GdqYedT89uh03N0l/kNx/ujKtl4HbQitBZo4ECGF7Z7GnRBH1JdiwQ9MdITs?=
 =?us-ascii?Q?F6f84nLB0+isHXHudHQpau6KzB0/Z637jqgY2QWF8DsBMfX1pm/EHmQ+OMs3?=
 =?us-ascii?Q?aZP9smxrAa9GaZkBXtWjkC69sMM3ljbJG5rMojndk9HL0nYaXOYkZ8PoUQOW?=
 =?us-ascii?Q?qZpCW1mVRixNEADfbyhb3qlTJOKDScSnhTn3UBOW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e696ed6c-0ce3-4307-8d19-08dba247d222
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 13:09:15.4468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJX4UemHs9/FK5Ira9xKox5t5PjKtqvGCs+0Va2n4N3jo6iUMDrO/1UluSAF6R+RvVJgauuZUgCLktJkWvXtYTZY2slrlz3K20Cvjzx1a74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Sujaritha Sundaresan
> Sent: Monday, August 21, 2023 5:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
>=20
> Adding vram frequency sysfs along with pcode helpers required
Why this series is partially RFC ?
Thanks,
Anshuman Gupta.
>=20
> Sujaritha Sundaresan (2):
>   drm/xe: Add a couple of pcode helpers
>   drm/xe: Sysfs entries to query vram fused min, max frequency
>=20
>  drivers/gpu/drm/xe/xe_guc_pc.c    | 55
> +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.c     | 28 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h     |  3 ++
>  drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>  4 files changed, 94 insertions(+)
>=20
> --
> 2.25.1

