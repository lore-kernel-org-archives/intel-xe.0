Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B6FC88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 05:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7247F10E7FF;
	Fri, 18 Sep 2026 05:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFWRCjPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2510E7FF;
 Fri, 18 Sep 2026 05:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789710836; x=1821246836;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KDIMvnkGLomTYoUI7FJllESs6eWAXhZ/KXGomKqmJmM=;
 b=VFWRCjPwqYoT97xVdnIdbjIXWt8UtpS55EtX18cSFk11FoqSjtGo4DyV
 AItHsKhZ1c+7+oT1Gluhd/2Jln25sCy77ULNCSxTHpf6VFviW+ekJqm8r
 YIP/AoQG49O0Qa/1jYkBguU/ZK3m2qfhZpzccTXiENtYrjppuHIRqBoND
 LjRqsYxq+cs8+cQvdrZynQ8Yuh54+83WOaeW3RdVOV+3Hmgk6jvZ0jbtI
 6xFRL/O3/K++6g96I9RihiOdHR5Y6jyjJWScXPVYxI1FGF1wNaJagKN45
 XwV4YwkSPFCVHhEuaPk7++0c8HNxZI/BspTaqQNjA/QXcZ9pbGWx3uPzV g==;
X-CSE-ConnectionGUID: +KnmkNK6QeibmB4Cy8fu0Q==
X-CSE-MsgGUID: Tj6ERpVxTjq7BY0dp0Lfyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90212203"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90212203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 22:53:52 -0700
X-CSE-ConnectionGUID: xlFke7wcT2eRr/g91UJrRw==
X-CSE-MsgGUID: +7wYTn6rRe2n/Ic6PCXsEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297686285"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 22:53:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 22:53:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 22:53:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 22:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6KVUH5LwcW7XZVDUoOFnsJO4fBJ/EfNAW3KLSlKDx6PRjNpdodJyw5lR/ysMwuQWt0zeXVfgANY5HY0Fx+qMYkyfD4g66HF3SjuNWxuCQ/QR77x2uQOKOi4OBSVSNVfR37wnslOyQ+CBWqJPzQ7kNBvYlwwuEhscRCoX2pz6xQSmLDXW4nUVfMc4gwZvYdgFXre/Mryq9A8E7tagV12d4vxgKsf7g5pCX1lpt0IJ3+rvyq9ddW/7Gi/0rZM2jDqmG4tl6XBHScm0Y8GhvqTL/+iGfouJL/W11pmpB95oBZd1Ys1YWhvFe7zWtK1F5xdPMna51vpTlwf0FIpQrQ2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b00exdPgkYa7S3ip5qbbwTTmp7TGRGo5FLYHRL1qRTc=;
 b=VWntcyuM4TQGf+AduyWpmTzE5ZtVbzIq4BV6cLnH3vGl+Bq8EyoDwldawVvXo8M8i2UdwMVfWfxAsx3gLh6jSwZAogzPQ4XItY9oJAZ6j/izov1ETJZLmAYblyUyzDF3p4TJxOGtC/hmRYSWgiqFPe02LASk1IeBJdhz4taJFQughnhpECiYt6Ht+Zv82zmbUXlDffmJuRHPIRRp64sABmeE/seFdKDFXJl6NoIba0kgg/PegdsCnUKcWKpGyUukaHmLRnBge6FU56I0bmGy07Y7Rok6iVZvn436h2eqACPVpJR1CjCBCYRFmhJf6r4OnvKvfHrvXmv3NM1H5e3txQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3787.namprd11.prod.outlook.com (2603:10b6:5:143::10)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 05:53:47 +0000
Received: from DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc]) by DM6PR11MB3787.namprd11.prod.outlook.com
 ([fe80::8ae8:5fb9:cf27:18dc%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 05:53:46 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v4 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
Thread-Topic: [PATCH v4 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
Thread-Index: AQHdPu0DkcseV8cBNEKWKbBdZf/49LbT5KIg
Date: Fri, 18 Sep 2026 05:53:46 +0000
Message-ID: <DM6PR11MB37876786D5D1E164ED8B0095B2872@DM6PR11MB3787.namprd11.prod.outlook.com>
References: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907171856.1484854-6-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260907171856.1484854-6-dibin.moolakadan.subrahmanian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3787:EE_|CH0PR11MB5235:EE_
x-ms-office365-filtering-correlation-id: 7b7e361d-7a78-4385-c4f9-08df15493461
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: fh6mYSbQ2eTkN0Zty/tmGWvT7GSGpdigSky56q6lxxjeji9nHsR4HFqWyN+FJphGMcLxY5udqsaPZoYOKMyHokYGRdiAup+7ygjXemJQys8vWGs1Cf0qKh3Bh32f00802KrMNWXYau2Qzy+EDocdJ+17XD0MAv7/dlCBeHACnyiJ3Lwv1ZPiefVejdEP4J/zMK0Fm1Zw10KtCS0slpnbdceBlM3q+KJdUkJGfA/STMJy/a9Zjb4IBc0s4cErlg3hjOyHrESgi211v+g9jl4NJAADS/B0aQWkJb552lis/z3zzV7j6PTrCez+41zOVUoeiqapAZSQOZ9sI+uVLdyUexkuk0FDN6HWsCSqoGxnvV45TaQLg7JJfnJKR+DmFuZJTfuc8m/hCJd6HM7ZWsDat9SDZ5Hu6s8+wrP+gxONm+xP+hwSYf1y90hxqOqEPal7EZwnVgDAJtC5ln0rQXxYdy3ei6J6yP0V0nVuzCh6a6oB4VGKsf5M5UIl0lX1ZV4Fs3prkOXHjvRqIcipRPczrH9lUeLPbsQOA8YdMyd6aMHBo6JKgAr6NWQsIK2fhRzsXGe88P00+fZvusWdKPqjATOtHWvpftcE0C+KTVRf1dXStoOh9w73rFvyMUXgl9s4kgUAHTVyKjSV8hIehqMpacA9xi8ZFFq9SCsHvu7CewZIpTEA49H+WyHGiF2WeuH94kq0rC9icS7vaZlY/9bayyGbwHAo/2N08YBUTksGEoE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TGJzNPgwSQK+2KOAi79y3qq6mCUQ/UpYKxV4Knq4NqLPOBCjGra74Nj43Mpd?=
 =?us-ascii?Q?fi6ZLTwVpNOIEy4ApQp84udUJ55dBGxK+ENiI51t/D9zI5Dp5G+EsrWh5ll1?=
 =?us-ascii?Q?2nu7Ot/hwFOfY5dDOkYVT30hOH+9XVEhPN5a4dbkxHtkD7LirEddQCWcuCzH?=
 =?us-ascii?Q?HeK999peo0Abn+SpARPPzo9XEsyeSzhuLbJMFgACa2qDGtI0VEthOT/Par10?=
 =?us-ascii?Q?swA3JV8vNodFE4QQ48SQuIxHmRCiXEEFOk0o5W1VsRdF2fH0zFOcLfoevXMm?=
 =?us-ascii?Q?lH5fpt7HosOv9z1G1Z+Ul93iq4ohI82d7v9Fn9fR5gKNeLQR7KNjCwbcK0gz?=
 =?us-ascii?Q?dbpTjituFBUsD2hCz4RUEJqV+zqyWSDVFNkJrFu/1YQ3eljI9++Cx4h2p3NF?=
 =?us-ascii?Q?5JmvMSad/8e3QTHxRbknCWiiYWfPtBdmVwxpIJdUxtuA9ZrDp1rQ6OVxWi+D?=
 =?us-ascii?Q?+JX9LoyMwyMJM76x8Vc+iQYmTbqv6FlAiZh5RaFQSKKAoyMnpF+++I6s3okX?=
 =?us-ascii?Q?hePIkYRTu7Piulh6jGzjocZj2PYcsNCqypK8YAm6MRu7PQ6LcRM4cEALiafv?=
 =?us-ascii?Q?OrOHj4iX4RyJiZyA2eFZB/7VaF3ymCba17h34Jdg4cVs0xGBjm7bG57qWBE7?=
 =?us-ascii?Q?Sl8AvczQfRmaNBaATX94rMuuAKjN3zd5Nrqkdlcp4ZBlXMB8LITqc4kPkK1J?=
 =?us-ascii?Q?ANnb2wk8fVVnB0pY1wI8PqFYUugL65ljrlRbHwNL/dM/6RU/p+3PzgZkITEG?=
 =?us-ascii?Q?vgbChoKtsaG/PUgGe12MXUqE+kMVBApgg/YDuuYDsdAdbkkxFwBbphB359ju?=
 =?us-ascii?Q?IZsZ7U98llbp6YN6qpI+tyKWs4bLgjcFkoiQrxGYy3x8Vy9uhsoMWQMjwTC8?=
 =?us-ascii?Q?0NTGDVmEV9R7BaqCjaQXwKxpk2PHKJjR1oqQgGW8FRjXWvqYBQouU7/F7yFQ?=
 =?us-ascii?Q?u/RcqoXtmYULwGsial8ZA4t/tK4F+K4kQsTy8oMvMOV/ErAc2yDeROfZMFYK?=
 =?us-ascii?Q?/L+0ry31zytzR/+LL8CMfCMgXl2WtaA4hQO544RwVoQ1f+oBqZajOJvzh9EL?=
 =?us-ascii?Q?3rtx+Dl3WrfKg8aKWMfgNbWARjmyhmaLwN433rWOCNc2yoBEvjv+SNMP0abN?=
 =?us-ascii?Q?u+aFhwoVm4cH2mzrIfhUgCEqDlrbLZ6Sj6no9HQy+9L2B1E3dyTDUWO0CSBl?=
 =?us-ascii?Q?mDO5wCLE2E9+6EfpdIe6J1+QuuFT9EOa01+k/Ow1G49EZuQfqrxvJWYP54yv?=
 =?us-ascii?Q?RHO8OLbfgE/2ofxZPTabvJSnxPFMqrZIkrcmGcR06dKWGIYzCJUTy4vIzaeL?=
 =?us-ascii?Q?259sSKyV1r9rVn5N1s4Ly/n8zheH7tmW1Xj1qzaGyLJpOtO6Z4Dk1IxaGpFK?=
 =?us-ascii?Q?R7ZTHd/AIeMneYK8Fy7w8PWrMbfB2OGpsECIk1SO7NDaZWmtx2vBtZoLRhy+?=
 =?us-ascii?Q?jJGm3jbMndeE1Mxzt4iwTgBuuxCvRbDNRHQ1HnEgRuLw9V62m/kVbE59RqOc?=
 =?us-ascii?Q?2nFicwY2eHrRV80eNc36e1EUXJmxMHjQKCUEvW6pdPgUtpZcfju8A8zwvCHD?=
 =?us-ascii?Q?XT/njh8TD6Jl5XkoxXZA3nGlQl668xo6sOkKaXQsRqyqFlGpBebUVkHN4lPV?=
 =?us-ascii?Q?dKRzjrwhILsqmgIj/3NJQ/zL2SLmJeMMiHA+2IRdiWv20cYKUUaaEksJXq36?=
 =?us-ascii?Q?pFXzZw72qmUqlDy+tPuSofL1dbCMpPddr/po7V5GSjstq9pf29dMxJtoi9Sa?=
 =?us-ascii?Q?cZIWI9ttoZtcer6R+J8Azs2YfkIR26u29YXvl3TEvIeTGFc3JP7i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sl8e+MhV0A9oU1i0ZqDxzs89zdIiZkk7x0+UWG3MGhmc9Bep96JWIeh6GssQVAbGfcM4pYq3RLmRZR0sBCCnQkh2oKqEB/iQQWvgOiwpg8AmtmUTVkhvURbwWQ3t7gDmwV574yZzm4Q8THOcfV3hIYEL5h5gg6Baz0ZAwA2RldOL7Bn4kizLyBnC6zN+KiYPL8VMqIyhK4FmIMul1EYju6CEw7ls4P7Yp/TmH90IJEp+3Nu2AfYwEMRujJY+0BVEC26r9EnR0bwYtOXlWygwscd4qBA2oCniUhwPHW32eMUiB45+p4TTbh+e1nIC5RLNtG5/K3F3agpleNKi9WuQlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7e361d-7a78-4385-c4f9-08df15493461
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 05:53:46.5385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9H9GXzcikKybz1goE/z+9f1HkiJVsVJtD1R020940B+NV3h36OMMs0WzOp91QqAuTZDSRjUK8RWzgDqk9MDY18cg5l8QR8RSNdMR7064jR5qtC302z8kOc1uV+C1m2iB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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
> From: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> Sent: 07 September 2026 22:49
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v4 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
>=20
> Validate the conversion of the DMC firmware size from dwords to bytes usi=
ng
> check_mul_overflow() before calculating the firmware payload size.
>=20
> Reject zero-length payloads and zero MMIO counts in the DMC firmware
> header so malformed firmware is caught early. Also set dmc_fw_size only a=
fter
> the payload allocation succeeds.
>=20
> Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.=
")
> Cc: stable@vger.kernel.org

if available, please add Closes: <url> (with Reported-by:) to link it.

> Assisted-by: Claude-Code:Sonnet-5
> Signed-off-by: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
> b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 051b721a0895..0ef6fddce3ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1170,7 +1170,7 @@ static u32 parse_dmc_fw_header(struct intel_dmc
> *dmc,
>  	}
>=20
>  	/* Cache the dmc header info. */
> -	if (mmio_count > mmio_count_max) {
> +	if (!mmio_count || mmio_count > mmio_count_max) {
>  		drm_err(display->drm, "DMC firmware has wrong mmio count
> %u\n", mmio_count);
>  		return 0;
>  	}
> @@ -1178,7 +1178,17 @@ static u32 parse_dmc_fw_header(struct intel_dmc
> *dmc,
>  	rem_size -=3D header_len_bytes;
>=20
>  	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> -	payload_size =3D dmc_header->fw_size * 4;
> +	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {

Please swap the order of these two patches. The load-address check added he=
re operates on
payload_size =3D fw_size * 4, which can wrap in 32-bit until the "Harden pa=
yload parsing" patch
adds check_mul_overflow. So at this commit alone a crafted fw_size >=3D 0x4=
0000000 wraps
payload_size to ~0, slips past both the max_fw_size cap and dmc_load_addr_s=
anity_check,
while dmc_load_program still loops the raw dmc_fw_size

> +		drm_err(display->drm, "DMC fw_size too large (%u
> dwords)\n",
> +			dmc_header->fw_size);
> +		return 0;
> +	}
> +
> +	if (!payload_size) {
> +		drm_err(display->drm, "DMC firmware has empty payload\n");
> +		return 0;
> +	}
> +
>  	if (rem_size < payload_size)
>  		goto error_truncated;
>=20
> @@ -1234,15 +1244,15 @@ static u32 parse_dmc_fw_header(struct intel_dmc
> *dmc,
>  			    disable_dmc_evt(display, dmc_id, dmc_info-
> >mmioaddr[i],
>  					    dmc_info->mmiodata[i]) ? "
> (disabling)" : "");
>  	}
> -	dmc_info->mmio_count =3D mmio_count;
> -	dmc_info->start_mmioaddr =3D start_mmioaddr;
> -
> -	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
>=20
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);
>  	if (!dmc_info->payload)
>  		return 0;
>=20
> +	dmc_info->mmio_count =3D mmio_count;
> +	dmc_info->start_mmioaddr =3D start_mmioaddr;
> +	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
> +
>  	payload =3D (u8 *)(dmc_header) + header_len_bytes;
>  	memcpy(dmc_info->payload, payload, payload_size);
>=20
> --
> 2.43.0

