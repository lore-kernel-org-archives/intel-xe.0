Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A156CEE342
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8310E06A;
	Wed,  9 Oct 2024 19:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL/v8wdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F510E06A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728502842; x=1760038842;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iTwUPJI2Si0Vu8G6d9Hd8+CooJhDIMpTreCVFJKsZus=;
 b=CL/v8wdR1Vs0Ndn2lVCOkR/YjAAj2I/Oeuga+RBdb1x+c3+7rUwVIkJ8
 dg+T9GJYPx06EWuEhoxmg0gbu15J4iFC+p5p/FK8PibcqWY26gO31QHaY
 bzxUzblnkqSTG8wVwdcoUM0HvtSLpI504yfxbRJgzDS5ab6xNPMtlHOGM
 /sZTBo2HgfOosEsLN7Vh3dtElq0Tu7fB57aM0ewD9dQkSpLPvAqiOHlde
 9U1+Q7FXA3WwimUf5TmPHBpX32mW3Y9Zg6MGPj4ZF8Dz6jXAQZOGhaYt3
 pDC4J4nYBKhQxgO5hU0QP6LAp1UW5Rd2U1RUoENEFuDoB8av64SUbgeVC g==;
X-CSE-ConnectionGUID: sy1iLthVSamavySUv/bBtA==
X-CSE-MsgGUID: kWEYSig1QVaGn/ZZQmNKYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27720604"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27720604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 12:40:42 -0700
X-CSE-ConnectionGUID: ppqpLCZyTsWQ7MtYB7quRw==
X-CSE-MsgGUID: C8DZuBrRRkKWe0Z9dd3FPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="81157317"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 12:40:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:40:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:40:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 12:40:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 12:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNkSHYLb0b5aXx02/eobtr3QUOSdh1cPBwCoUN13bvpDGS7GeG6cjJkJeDx5JqbcGn77/ZxTdpPnUzbq3TOmXiZatPoC9QcJmZ6jDU0DeNmjXi2bFRcDjlRBdhJ2Ppgu6iXgOH2DGzCoaorMs0ffyHVpAZwX6+mIe1snfqd70b0vCkytV8L65Zm6YEMrS74OdjTOhoF18VF5hiuZdbTS8cPfWLzIX8Eh+NqHRXW2zBJg2B93rDD6B1uYPdZGxos//3zKcaA9ut1PvCHGdL8Srp/hnlEAB78c6gMcrMJbCIN8nrCGb2UKriN5H6HcCfjJMhFYBZ3Y7owWEkPX3f7xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTRXzmOgF0W2OEn2ipV5bXZpBpniQdYN9SETI1W/si0=;
 b=oL2T9fMO2BCfOF8vPev4VBaIAgbvh4zDVv6wsuT3lU10UiG6ntRMsI7jWBmdHGAjPlpDhYbR6I1xBKcSQGFrpghgZpSyWY+93Xp+S+zDxCRttA3bt+ZVIyVChMbdeF+mpurf1UYS7gOV4z54aeIHlc3cuhbW3tgrjrAKoiZdRw/hza+uW7RJZeyoXwcRbDW5rKf97G/V6mKpwNTvKC2bgEIseFPzk/qfltJQrH1hDQwWEZVATDmqNirmxxGjRA/9Axm2I20rjEBNF9xaexjT8Q8jdwhyk2QiNrwu5poiCZeJpVvAyI2YZKWoCN0EngyeKtUAwM3srmr9sPmmvjB8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 19:40:34 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 19:40:33 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Thread-Topic: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Thread-Index: AQHbGnSUbfXqLhBJoUmV2nRi6KnolbJ+vE0AgAADblA=
Date: Wed, 9 Oct 2024 19:40:33 +0000
Message-ID: <DM4PR11MB545667AB8EDA2BA7827224EDEA7F2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20241009172208.706894-1-shuicheng.lin@intel.com>
 <CH0PR11MB54446D79A14BA487F8A5FDAFE57F2@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54446D79A14BA487F8A5FDAFE57F2@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB8282:EE_
x-ms-office365-filtering-correlation-id: 91c4c118-5afa-443f-a54f-08dce89a3dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3tgmHkV+t5RfDJKr959r35PbnZzrxB4t2NdFf5DB9AReDWzteNPK2TMW6iqH?=
 =?us-ascii?Q?yhqWh6DAGs9EOmst0aQ2dbqLckz/XTflTvJTfOd9oQ+gHhXnX+/TeggrEWA0?=
 =?us-ascii?Q?rWB2focmSASnxoU6WhpLFm+8+lxQGnql83mgSAypVvvRy0z0TRZ5OHS9mf0f?=
 =?us-ascii?Q?B0V2rmSETB+AP7VA7jY3jMODw3lye2Jcdi2Yyb5RC79TkkEtC/Pbs8SKmnWx?=
 =?us-ascii?Q?tjxnNjdfHxz8u2sORxFwbPxfhLcssUcF09hJLzVUBPeHHukSsGqzB9h0YPps?=
 =?us-ascii?Q?5PcMRS8bcx+pf4cOGRKbUMVjzcnKaeg7CLMkYDem9gZe13qRoTOLvrxrIeIf?=
 =?us-ascii?Q?LnC7Zhd4bxveJ8ZFW8qsPbeuEPbqBKKg5WbsMT9f8SCVMPzOrfhOE3CIJXMG?=
 =?us-ascii?Q?4qizk+zJURo70Z4VOAjlsPeNJVKOoIx2ERWzCUza174xAsCdnTHrHa39lR3Q?=
 =?us-ascii?Q?vhC3LYwODsvXF5F8Di8CagdE86/iM3DD6fcR8gnVOJ50hpL6I+kCvpOh9Szf?=
 =?us-ascii?Q?mhjWx3OdGIDxbjpCnrWRaG3m9/Vpq03owioWB6Ui9e7wcR/4yxmVcWZ+PELA?=
 =?us-ascii?Q?8ZuvD8IEHJi4sjk8oWOrZUuZUXNJPcjtRbNSPfK7uE6tzCXXMZJYng9XwVpj?=
 =?us-ascii?Q?MKPIn8z9jDn80W+W9s6YT6lLs3OmUBL0GtITyWpOyZCqy6wn+RXE2fm1HLd9?=
 =?us-ascii?Q?Gfnr+JRn1lQ9rpw9Opx67EJX+wMkybt87IwhVQn3JzLc29qCaxVo9f6NEDrc?=
 =?us-ascii?Q?FW39wMTAJGVDIFUBhph8k1OVQB6I69weBjI6xJyWPrkKDHV8fyCFkWcO/M+4?=
 =?us-ascii?Q?qtSrWyQHeHLJblVM7VbDMV3lhHnO1NJly7w3oi//sY7nU1rDla0eVTgoRNXW?=
 =?us-ascii?Q?82OCRsDIV4/9dS1JfFUqy1tIKZftANpPkfes/ZB7b479LdR1KzU5M4FJzpTe?=
 =?us-ascii?Q?QnCFahpDdp8bdjzDgXT0ipCctPdfW6co3/VXxUnG2Wo3RNfxRDn/cIFF4Len?=
 =?us-ascii?Q?tcqcSB2Ioezq1HtdrT7KafxpMAGFXHmOagQXzDszZURYG/l0V8moCRPXEyqJ?=
 =?us-ascii?Q?MtbiiDT7la7kJcfo+jUpLgzcKkZr/4rTFW5B10c0LvWNHIK1PLATgHBG7uBZ?=
 =?us-ascii?Q?9O/VAsKRRXC2XX9FuM2aVUPcwM40jAa2Cxi9IxlRptAtU1xeQjHtBzvMpkK9?=
 =?us-ascii?Q?KbpNjNSJzpXY7cX40gjusX91NBgLTT1Yq1oYhr+Zs6VIltJZysfQBt6NZ9Fh?=
 =?us-ascii?Q?dF8rhIfu85jzPB6KMVDWkJ08d7sav0oxtgDHAI0LKWAeSKfuQwkeugTfT9N0?=
 =?us-ascii?Q?59YAXxnfo0YJ7F+1xofpIHakXZzYwlObkDXg9eOn8tdL/g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4PV3xrjRqB+9Nogc57S8OYASo1fwuIVUx5ArvFNUaa1aSUSh+w41k9yarw+E?=
 =?us-ascii?Q?zjOId46D+5uO8CB+c0PQdxPx6BmBvrILkQJN+1wmk7hMUqYRZzEiNL1+gJmS?=
 =?us-ascii?Q?iHLGIumxICh3jUoxZF0gtakgzK0gdNtMdz6f7iPUaCt6j07S1g7BMn6QqTJS?=
 =?us-ascii?Q?pwU//ZSG5jLEN4xlXzrkQJ3G72aCsvKTjZE5pNJcsQxGRVs2rOZhwgEXC8Jr?=
 =?us-ascii?Q?MuM7S4dTVSYr3KViAXmuMUWHpMcRwF+3kqrNyl6yNIQ8om4wBTnX+nCeQU4S?=
 =?us-ascii?Q?VVykVx0OoMtQQtvvJTex6SLgwJcp8ibL2bjuP2ix/nGRHRlLwNOQ0dygh3si?=
 =?us-ascii?Q?xTaUfcHju9JLSi7XfSbNn4+klo/YeLftWn0iNOmEGLaIHI8ZEaYw3S+b4Svp?=
 =?us-ascii?Q?Sw4TybSjQa0d6y1NpOR27Kx2Jf1rbucCuWDKktD7Chywd8WAkj3WubgqrdNV?=
 =?us-ascii?Q?pkcGBMxWz5wrgw8QbAPiGfNpSJaixJH8VZunKmBFgk3SjAqnPsOdwZXHWmKc?=
 =?us-ascii?Q?iaRF3QFPHt1O5ImVZQMEEzRcJTLyAGz99hOXlE5Mry7vSb5rFwV6N5JUpvP/?=
 =?us-ascii?Q?Aefl/Y83+N/L7LNj2dcuZ/Yql8fw9NZzzpq19I2XHYBu2rojiIzDdpm1OPCo?=
 =?us-ascii?Q?G1djJS3xRhgxY3BGSiBd0MK3ii5YK7fzy/gPiUVi7F4+2buW0SmTY18/UiRq?=
 =?us-ascii?Q?RcVos3dvcnh2k6siTVTB3H1Ju3Wd+s3187r4RobjSJA3tiYINZ1R2pDnoby7?=
 =?us-ascii?Q?4bISvHeuSeywFa/Zloghr+k89T7iVKClFtn03M3dOhVbR1flUOdiCE4IxSZ6?=
 =?us-ascii?Q?+ep7N8h4K59cP+MilxjYT9vgI7qJZCAY5zxayD8pDoUxuIlezMsG1XrKq/4G?=
 =?us-ascii?Q?Mj8HTm2RtibDtXksfk4pKNZYezYEsQG8WBvov6c6wHvNmZO1jSVEk42BfQh8?=
 =?us-ascii?Q?gFq97EFPuASRoAVGeuD/c1ajh1DhGqiGPRCACwFPEF467bLkN7HQ8hXAuwpi?=
 =?us-ascii?Q?Tg6iPE06nW4RecTJx1rjrL6DULB3vCEHuEv6ysS3s92GDYPV0AydOnkc2ODx?=
 =?us-ascii?Q?sJ/kT4swRA65ELsmRFstR1AYmrNU2A48UFEDQvrGeq5oGPgSI8ciBvjPYzyZ?=
 =?us-ascii?Q?NnZOirpwwtmWUupOaQRyJGVZIdhrWVcGwT3TtQWZWcaP8fnRDq5tAT4v8pBX?=
 =?us-ascii?Q?KNOFQkUOatYup2Q81Nccb0KpeZXmkwbp81meVOrBxYaINs3R2UYOWJN4qKm8?=
 =?us-ascii?Q?LDm3dmlTyVmN8MbNdUiuyS+kfiByHz9MpqU7ovtGkeGusSW1kslrHUSk0tkN?=
 =?us-ascii?Q?cI/54bRPCSLAVqaCGi+a1Y486bkXK+hzXwFqktPm4ohudEdXI3M4G7RmszrU?=
 =?us-ascii?Q?xY5XJjkDz1wPrQXQ2T2WReMgBLKeb8EsE421XBcyViMPcNsQl7K79sK/J7gY?=
 =?us-ascii?Q?gPPDU2heInlEKpRrBSxDoQHylEsfkAI/U6EmwZydbiOOKVVZ9FOoV+of44j5?=
 =?us-ascii?Q?YzQVDg8poobn3RSRuKN3VpEEmvkuSR/udSzfzN6ktTZofaMoVmF5xZfc72RS?=
 =?us-ascii?Q?pfpAbNsm6CsJJgVuFP9sJRgbmg5t53x83KW60u7s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c4c118-5afa-443f-a54f-08dce89a3dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 19:40:33.7721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBvNE67nGWCNiKt+3U+lrdZ0XRo0LuQK6sf70Sw3f/U3prucKxQU8ysMbmuaGyg7XyPsYFtaNPTHoGp0xoMJMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Wednesday, October 9, 2024 11:25 AM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>; intel-xe@lists.freedesktop.=
org;
> Auld, Matthew <matthew.auld@intel.com>; Das, Nirmoy
> <nirmoy.das@intel.com>
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to=
 500
>=20
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shui=
cheng
> Lin
> Sent: Wednesday, October 9, 2024 10:22 AM
> To: intel-xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com=
>;
> Das, Nirmoy <nirmoy.das@intel.com>
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
> >
> > There is error message like below during stress test.
> > "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation
> timeout"
> > And change the timeout value from 150 to 500, could help avoid this
> > error message in the stress test.
> > xe_mmio_wait32() is implemented as wait 10us at beginning, then double
> > the wait value as next wait until the timeout value is reached. So for
> > the normal case, the real wait time is not changed.
> > The larger timeout value should take effect for the bad case only.
> >
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>=20
> This looks good, though maybe the commit message could use some work.
> Something like:
>=20
> """
> There are error messages like below that are occurring during stress test=
ing:
> "[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation tim=
eout"
> Changing the timeout value from 150 to 500 could help avoid these error
> messages in the stress tests.
>=20
> Due to the way xe_mmio_wait32 is implemented, the timeout is able to expi=
re
> early when the register matches the expected value due to the wait increm=
ents
> starting small.  So, the larger timeout value should have no effect durin=
g normal
> use cases.
> """
>=20
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan Cavitt

Thanks Jonathan. Yes, I like your message. It is much better. Let me update=
 the message with it.

>=20
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index cd241a8e1838..60aebf7561ec
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
> >  	spin_lock(&gt->global_invl_lock);
> >  	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
> >
> > -	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150,
> NULL, true))
> > +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500,
> NULL,
> > +true))
> >  		xe_gt_err_once(gt, "Global invalidation timeout\n");
> >  	spin_unlock(&gt->global_invl_lock);
> >
> > --
> > 2.25.1
> >
> >
