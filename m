Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC7CCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 18:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153A011244C;
	Thu, 15 Oct 2026 18:57:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FE610E215;
 Thu, 15 Oct 2026 18:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792090643; x=1823626643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T0YUuamKw5LhJI967Rt7BfU/XQ28qqfAnCPKrZl4daQ=;
 b=WcIKCxEQe9Ut5wohVasCExFgOi4cgzNh2dNcTF4Qf3TrtXe2p6Q0WChX
 8QZPmoJXOLXiEryOzFkIFapT0zDY2WSfsNdrZsbm2WU8Pyvq15r9nbMZH
 90zwNy+xbkIlS2C+V+2DHv6LOfRxEXvgxt4fGLnTSFlRRcpa/BryYcrzC
 3+WQWg/CoVKG9ggX8zQX2jvE/nfKrlqp7VZpGhZye8WU90WlDdBHVmv4G
 d755PbvVJtBXml3HlsX8/LN9LqT268Z9sK0hAYMIxhFS2BOoofrg7Qnis
 MVL5XEdXSuj/7RvXVkqJNtdr1ZoFTfoHSEJmp+nGG754izqmtho3ZchQg A==;
X-CSE-ConnectionGUID: KdJZJLQ4TLupKAArMq2f4g==
X-CSE-MsgGUID: CdWXb/DZR3aZ72vKxeXDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="883104"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="883104"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 11:57:22 -0700
X-CSE-ConnectionGUID: 1NVJBKCVT2SLvDlPNHQUqA==
X-CSE-MsgGUID: tg7jAg9qQuWpxsW8gu/oIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3546808"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 11:57:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 11:57:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 11:57:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 11:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7V/NNOQdQPFv7TfX399X+eTfR7vGxXeJx+Pxa55FUbEK5Ku5kHpAMV0/piZlvTttID/+P5lgWw6giRWjnw3BpEby0CQt1EHg2xxtHyaL0haLIsE1RVRemQEL7AySaZPcOXMPoscDvKUdOHazaBxBMhCg5npY2pd4WcqSm8bDNKC+cxswOyntHku9rOSRU0JFv7PbwBBs7erwxDckbuykp47jSRsR62HiYdtZ7pxpUQniaOA2qscplwKdYHKPihYzPapq2QLhXoMXAQaGSfET55Fg6Sou3xI4K2+T34rmgdoXinyHmR5uS6MIc4mdfANEEJOjFtkwtkRodBhsFvo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c7NeUX1VGzItTaIlZylAm9zEW06VTi8G9JL204ybeA=;
 b=glXBR/PSwlgpYDIwyghRA34jODI7qusRjFIxsjx7WBHPrByW3cUoocd1DlOShbp9OQ05uvte2kzuE8pALUtdjRgqOJvVJZT7kK797vqxPV2wPZowVikY7iqYmubK+mhpdSeM3Vone2xolGnRsZpI+SwCFL6XmkXPocK0xbdOOjxWriJQlYI89pWIZy5g5v2PsM0OBXgwGskmA2zoKaxu4T6h99KDwVZS4WBXOzAUmGffPldQqo2POeuwLup/HgfKiyCBLAMvlvxG++txOIWJxZy+QAmA7fWaMbgZLGnyx3sOiI6qSaAEN6AqY7HvmzElbkFNS0lvSpXZ1qZJK01k2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 18:57:19 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 18:57:19 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Topic: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Index: AQHdRmKHTfmoCJt270iSh+s9uXpCTbb/GtiA
Date: Thu, 15 Oct 2026 18:57:19 +0000
Message-ID: <BYAPR11MB37839E745F7C026E80523E08B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-5-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|PH0PR11MB7470:EE_
x-ms-office365-filtering-correlation-id: 6efb657d-14b3-4e49-a053-08df2aee2378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|6133799003|260925022911599003|22082099003|18002099003|260925021311599003|10067099003|3023799007|260925021911599003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: A9Kb1g/b86XKvfvyqlHzmGQWJR/zIJfjBRl40cn4m9hCsZx5dl2YxcunEbvrQHFLeB9GiFAmtLNGPquh+ByhZvynPIPl5y16rKI79EE15ReNVX7XWk5mNlvAkD+EZX9K/J+mTHluU8gADY5ICrKkoY5pnxzXqGh6MjLSomC8WAz8u9SMAJSH32fzz0fJLa6GSB1gGSmI+D2QqvTsG3n7NesORMjiJIYbrPEPcpy+Ll62Z0Gw5qiLBk412oEyK0SpmSrCE2as0b8BCjM7cHBYhDCqlmVl5z++/u1HiGLaKWF949tuKAZAF3Rtu1rhoG6dPY/rX3IzppfNOLRHgYIeaigdHKHKJzzTI+bGDaAi5Yl/6rPXwCDlA6fwEvE0k0K076QtODwwQwvsu8Z7WdI7KLdB3vnkWafWxB/V2b7CfiF4WVxWg+t2W1rkQNwMBNtf8qLU9vk5MsJ4kyYRxza+ujO4Llf2TLSV96Rj86dd4c0Eg/wuabSTeJ/b+oodnWJvowAFgnX7v7rTZ2RMlNomNnRhxCPpELOg1jEYpBVxhoSB65KWOBY+8kHXWS17wKpAkObIM3vgmSau1K1rj/4aVHhfQS7LepV3rL80HLsvtPaVSFA/YaNpzkJBfVEjquB2Lb3ow742YNPNupc6QVDdQdkvpcCqBdK2n8LcVRshpVn62nHeq0o2sYxpK+Z3aPcDNoPlE5uHRbuo1GzYEISx+2bvuZMrUfv4/+p5I7tighk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(6133799003)(260925022911599003)(22082099003)(18002099003)(260925021311599003)(10067099003)(3023799007)(260925021911599003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xcJYzfmIf2RtKojE7w2bkdtt0M8GYlvz8xF38LYy1xqRcS8zrWVV3rlxbBkE?=
 =?us-ascii?Q?xO1ztOU6CBJJdymjpGqJoaFadHD2VpuxTvgAw90KVUZd9CHbiirLYDB/x8+x?=
 =?us-ascii?Q?eYCk7gIuqzgpy9/5fs49onpRX930rlYCiAr+BwTvtk9WdwITueM2jd2EWpXh?=
 =?us-ascii?Q?JT53TiPtgKA7HP6WHjB4zqeXZE2nsxpubgRfqWeJUMSrgAIHSWSUVLrD6OSk?=
 =?us-ascii?Q?J11E5egGBAKQjYs6cOo53OKfU+uo+Wzf/vWycfqv538cZ3PZUAlbEcGprDMg?=
 =?us-ascii?Q?7nNQg7ZaynRXpMDmNnGMuYuK5WqXuY2PZqS2EB6cEBglv5fjICejEXKnpFHM?=
 =?us-ascii?Q?sByrHqamdfm5CBlNAC/uKKdA22XWPnUcmNKfSFgGCP/N5Jwa3K2qJPm/hd3P?=
 =?us-ascii?Q?LzdfYL9914LrBZQBE+5ktfFkFIdyBdk6aAXRbN55zGQkF8/cNdA8vMWEuLzS?=
 =?us-ascii?Q?qZoRdYc+6FhkKmqCrAZMjx6dSVShrEMBRl4Ie+18gDEjhYSSBga9ECyRJMDo?=
 =?us-ascii?Q?oh2AGZcDEdtYtBCroKPnoAx/Q0eL3e4u4QJbhwZ7mHJO7+5x1Oc2kK4rbFps?=
 =?us-ascii?Q?Ohcu+Je1NYCzmemepIsEOrCCWqZy+hkPxQ2yjX5a7U6ni4FyLJXAUR4GyNPI?=
 =?us-ascii?Q?ZFrd56AuROwDK+EDEfzEor4bmFfCUYlg7g/53S75+01jPtvR3BJDvYy3iAOR?=
 =?us-ascii?Q?WraYEOhJmTvgE1a03348bnWet5cP8hC6a1bCqtiX+zT4pe7R43QFQHDp1/HC?=
 =?us-ascii?Q?Xlq4qCvmJsSa2FLdKf4KkOUpgAL74hfRSCj2Yj2iwo+cka8K2KYlDLued7cw?=
 =?us-ascii?Q?roD6KSfYUWTS4YOnKk/v2usLhCQXl9Ho3JGX69h9+H/goFPbU/JvKZU7arof?=
 =?us-ascii?Q?6mlxSb5Qd9oCVVPcdzmO/kUZG3Rnfa+YCt+++paJMda15WheQG5jexCyfEP0?=
 =?us-ascii?Q?MsDuMJUMXo1MURWRhs2DCJ8Wo5UQ3H3YZY4lI9BNjmTYjyUaj55cknvJTB6W?=
 =?us-ascii?Q?SfI2soxS/O/s+FQg/L8I4TP9PKEuoRbKLCVe85gYYHOYRABQaPXY7YC0cYWe?=
 =?us-ascii?Q?q9aklmsWul4pxvy+aZqrDxVlbw+vtsyEICDFCF4eGUZoKw8RV08ccC7cwKIU?=
 =?us-ascii?Q?4MKGXirS91zjLi6A+rIRZk3QOZ0VINupXNHLQ5MbetF68X68N+xQhiE7+PkR?=
 =?us-ascii?Q?LYN06PYfobsdCbbcJWe9cDeF1H1fwHsU7rh58JRGHkCj1H8XpWGIp/Ls/7RF?=
 =?us-ascii?Q?P+jgey34dv7XdBUQo5OeFTNrZkpW6FEAKaF6NH9n3cpU9KtL/Hd46KqRQApB?=
 =?us-ascii?Q?F7IvVueyXIYgnVTs/3FHJkV6krv9sJJDHJnpN/Vev8++GPkP6gC9FDYVd/Ep?=
 =?us-ascii?Q?/UaFAc+6tVp+qCI38n0BGTVhRFFqVoYUCUxZl4MZH8ksvepdE2cImeegawLr?=
 =?us-ascii?Q?K2gxhf6ROy0Pwp4K4UaaN658S44lZNINJYTkBcKJLA9wf10jh29q8XFcylTn?=
 =?us-ascii?Q?AlX17XoTUcfxEQhTfzGltiWTR9Bjcgjm7RqgWKmE/CBGW2uK54ynl9/1Pg8U?=
 =?us-ascii?Q?FPH86eKYp8apXUcMwyrBr4ALCoGAE+sxJb7uGu2gI8v3Cly7j5PexlWZzPt1?=
 =?us-ascii?Q?C5GeSvjFFM160zpXsAcW+sYgTiCGYYtiI1RNSibqAgatiP8MUpc4TeB0T1ep?=
 =?us-ascii?Q?ZSoWV8W/+mXe3sRl18A8AhQC6yWvgTJdy2ZCCyHQflR0KiSPpEVjXyVuv290?=
 =?us-ascii?Q?KYnrZG+sodR71Op+wBvrwzy1cBVg24iRjguXU+sTvwG87VCq3/b0V4mh0j3B?=
x-ms-exchange-antispam-messagedata-1: /1yWm0X29GH9uEMvzd35YPoG9SXqQwTq77M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2u+a5qPblILMMiLtojyshmmFIrDVKNA58fOYEhBUN+82T25QDK/TYIoahmE/eFJVbrYjvfMV69VJmRM+UmhYK+DOVM4j9WhAJt0WiIXMux4fL6hr4g7x0Sl70baUiZIR+fcZHuSwnASNnBfihEwUUe0uaIbR4lgJSqZ2EAuGnBsyNWvEkLGwiTP33ha6KJhSEt7LkmtgOMV/s0uNLwPFT+CYHWgmu0MM3AiwhB4PF0aLyLCz9YutqHeWTn/s5wZ8XjuUCr+XwDKADRSo+/Z7gUFtsvIZL68ku3uURtn6J8yKGV+9Gq8R05qD5vA71BTp3Cay7Hwx3Ci6eYyVHNHxRQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efb657d-14b3-4e49-a053-08df2aee2378
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 18:57:19.5073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMI9nyVKjYpiy/N8FFdUF3MgcpOcoaY0Jo3DpcJXJr9d2F2p0+zn4VeUTwTx3eJ5r7lyJpIujBYcaPvTEHdKger28obZvMl9rwW4ZOpNnMmd7vydJx6/R6sTbtCGENux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: 17 September 2026 10:37
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link
> config
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
> ratio against the maximum allowed value, and log it if the ratio exceeds =
the
> limit.
>=20
> The link config limits computed in the previous patches only restrict the
> configurations that may be selected; this catches anything that still sli=
ps
> through.
>=20
> Log it rather than warn about it: the link config filter already excludes=
 the
> configurations violating the limit, so the only way to get here is with l=
ink
> parameters forced through debugfs, which are applied after that filter. A=
 user
> triggerable drm_WARN() with its backtrace would be out of proportion for
> that.
>=20
> This check works off the M/N values as actually computed, which exposes a
> mismatch with the prediction done while computing the limits: the pixel c=
lock
> there is the one before intel_dp_compute_config() divides adjusted_mode-
> >crtc_clock by the MSO link count. Divide in the prediction too, so both
> agree. The joiner needs no such handling, as
> intel_joiner_adjust_timings() only rewrites the pipe mode and leaves the
> adjusted mode the link M/N is derived from untouched.
>=20
> For MST the check goes after the bpp loop rather than inside it. The link=
 M/N
> is computed from the pixel clock and the link symbol clock, so it does no=
t
> depend on the bpp being tried and the result is the same on every iterati=
on.
>=20
> v2:
> -Use the platform specific ratio limit. (Wa_14014191401) -Use the MSO
> adjusted pixel clock when predicting the ratio, matching what the link M/=
N is
> actually computed from. (Imre) -Drop the check from
> ilk_fdi_compute_config(): it was passing dp_m_n rather than the fdi_m_n i=
t
> had just computed, and an FDI link cannot get anywhere near the ratio lim=
it
> anyway.
> v3:
> -Check the ratio once after the MST bpp loop instead of on every iteratio=
n,
> the result does not depend on the bpp. (Sashiko) -Log instead of warning,
> since the link config filter already excludes these configurations and on=
ly
> forced link parameters can reach it.
> (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 37 +++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp.h     |  4 +++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
>  3 files changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index f6a2152c4432..fbfc00101886 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1294,6 +1294,14 @@ intel_dp_can_support_m_n(struct intel_display
> *display,
>  	return m_n_ratio <=3D max_m_n_ratio;
>  }
>=20
> +static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int
> +pixel_clock) {
> +	if (!intel_dp->mso_link_count)
> +		return pixel_clock;
> +
> +	return pixel_clock / intel_dp->mso_link_count; }
> +

These hunks fix the prediction added in "drm/i915/dp: Limit M/N ratio for D=
P SST". On its own that patch over-restricts MSO eDP by mso_link_count . Pl=
ease squash them, together with the MSO/joiner explanation, into that patch=
 so it is correct on its own, and keep this patch to the debug check.

>  static
>  bool intel_dp_can_join(struct intel_dp *intel_dp,
>  		       int num_joined_pipes)
> @@ -1332,6 +1340,7 @@ bool intel_dp_dotclk_valid(struct intel_display
> *display,  bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> pixel_clock)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int m_n_pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> pixel_clock);
>  	struct intel_dp_link_caps_order order =3D {
>  		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
>  		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> @@ -1343,7 +1352,8 @@ bool intel_dp_mode_valid_m_n(struct intel_dp
> *intel_dp, int pixel_clock)
>  	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
>  				      INTEL_DP_LINK_CAPS_FILTER_ALL);
>  	for_each_dp_link_config(&iter, &link_config) {
> -		if (intel_dp_can_support_m_n(display, pixel_clock,
> link_config.rate)) {
> +		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
> +					     link_config.rate)) {
>  			found =3D true;
>=20
>  			break;
> @@ -2723,7 +2733,8 @@ intel_dp_compute_m_n_ratio_limits(struct
> intel_dp *intel_dp,
>  	struct intel_dp_link_caps_order order =3D
>  		intel_dp_link_caps_connector_compute_order(connector);
>  	struct intel_dp_link_caps_filter new_filter =3D
> INTEL_DP_LINK_CAPS_FILTER_NONE;
> -	int pixel_clock =3D intel_dp_mode_clock(crtc_state, conn_state);
> +	int pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> +
> intel_dp_mode_clock(crtc_state, conn_state));
>  	struct intel_dp_link_config link_config;
>  	struct intel_dp_link_caps_iter iter;
>  	bool found =3D false;
> @@ -3382,6 +3393,24 @@ static bool can_enable_drrs(struct
> intel_connector *connector,
>  		intel_panel_drrs_type(connector) =3D=3D DRRS_TYPE_SEAMLESS;
> }
>=20
> +void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
> +			      struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	int m_n_ratio;
> +
> +	if (!m_n || !m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (m_n_ratio > max_m_n_ratio)
> +		drm_dbg_kms(display->drm,
> +			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> +			    m_n_ratio, max_m_n_ratio);
> +}

Could we reuse a small helper here, since the DIV_ROUND_UP(link_m, link_n) =
<=3D max check appears to duplicate intel_dp_can_support_m_n? Also, are the=
 !m_n and !m_n->link_n checks necessary, given that callers pass struct mem=
bers and link_n is fixed at 0x80000? Could the parameters be const as well?=
 Finally, would it make sense to place this helper next to intel_dp_can_sup=
port_m_n ?

> +
>  static void
>  intel_dp_drrs_compute_config(struct intel_connector *connector,
>  			     struct intel_crtc_state *pipe_config, @@ -3420,6
> +3449,8 @@ intel_dp_drrs_compute_config(struct intel_connector
> *connector,
>  			       intel_dp_bw_fec_overhead(pipe_config-
> >fec_enable),
>  			       &pipe_config->dp_m2_n2);
>=20
> +	intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m2_n2);

Could we drop this check since dp_m2_n2 is computed using the same port_clo=
ck and its ratio should already be covered by the dp_m_n check? Or is this =
intended as a defensive check?

> +
>  	/* FIXME: abstract this better */
>  	if (pipe_config->splitter.enable)
>  		pipe_config->dp_m2_n2.data_m *=3D pipe_config-
> >splitter.link_count; @@ -3739,6 +3770,8 @@
> intel_dp_compute_config(struct intel_atomic_state *state,
>  				       pipe_config->port_clock,
>  				       intel_dp_bw_fec_overhead(pipe_config-
> >fec_enable),
>  				       &pipe_config->dp_m_n);
> +
> +		intel_dp_check_m_n_ratio(pipe_config, &pipe_config-
> >dp_m_n);
>  	}
>=20
>  	ret =3D intel_dp_compute_min_hblank(pipe_config, conn_state); diff --
> git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index aa58833a405b..4c975358ab96 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -26,6 +26,7 @@ struct intel_display;
>  struct intel_dp;
>  struct intel_dp_link_config;
>  struct intel_encoder;
> +struct intel_link_m_n;
>=20
>  struct link_config_limits {
>  	struct intel_dp_link_caps_filter link_config_filter; @@ -244,4 +245,7
> @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> pixel_clock);  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
>=20
> +void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
> +			      struct intel_link_m_n *m_n);
> +
>  #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 823fe99ca0a1..6d2e234a9e9b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp
> *intel_dp,
>  		return slots;
>  	}
>=20
> +	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
> +
>  	if (!dsc)
>  		crtc_state->pipe_bpp =3D fxp_q4_to_int(bpp_x16);
>  	else
> --
> 2.34.1

