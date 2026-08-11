Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02313C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 17:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B4810ECFA;
	Tue, 11 Aug 2026 17:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7ck3EdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DC310ECF8;
 Tue, 11 Aug 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786469072; x=1818005072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/OjXJtZ78pQTiA32g3jy71Z61Te+1CB3cRiWrAGLLfg=;
 b=P7ck3EdC7CIc+WiO1TbhyFsYdq6aF+WsGk/t1+t/SKkt5AjbMxAzfnzy
 Sztian3TZEcyCbcvLW9BWdI/Lk8yr9AiYOO60szlzD+W5lyj5MwL+0oPv
 3posif7JRvh5EAqmReMmMKSAZnxaJPFLWIL63Krvt7dA7/pXZa0K2870o
 77ztKVX/krKQvgdADa5lG9iEaC5TlCmDpvHEdJTl3e1cuxFp5EYcAyK75
 Zvx3IIcsZ0s7n1ueisPfvU8QFTwfd0VBAS6ugCXv7S2hRr4nzZj+bKXkk
 JQcHydEtshU5taEv8c5P8ELdd0GtPsjPQcEJQ+Thy7f4OdTHfzsK9GygM A==;
X-CSE-ConnectionGUID: M3NfD5K8TvCJTJ/MXl5xgA==
X-CSE-MsgGUID: Ms4QuVLxQseFOmy2ffCU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86130982"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86130982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:24:31 -0700
X-CSE-ConnectionGUID: 9il815rOToyV3S4VxZbKrg==
X-CSE-MsgGUID: mxHA6bN+Tw6LSmndAVkkEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="267662709"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:24:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 10:24:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 10:24:31 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 10:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhsPlkNFvt8Lrkh8I4h2omBTCX5Y9YgtqhdPBGKxAS2C7UsNVmekdjBEZxERzVmtO1ZsXTI24BJZtPC16qLeWu9TDhIvR8FX0HbZuEQItawNQ1W25lURsG05dVHGz/saaBOt/yLHckAT6jLMP5SzzaRN1SFuuWxUtmeeQB/JErIYyCh+2CkxJWpS0JMLsx1ULKMauxDooaVQKyVhGzeJaqAREHlXeIe8zeN0J1Ro5ywVu9h9TZ0ZPLxEwbcf3/IZCtcm/OJX5/gNuy04hqtYwEmi71S0YhxIAzFRAPns3RoEFgavFNhZf5fIgSNqnVYYnyCFYGjraHRvMXkluJ7QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmOkTSKzUpQR+dc8CPEmZReuzDvvv6Gas6Nrn67elQM=;
 b=uScac6y7MVzRoaOD9dTQTaGajHtZOToL7606PySDmg1F8CjLZ6H49kSJUd7ColEoaItTLpj/Uyd/uADyKB0lfA/ynM35tMoXHUNxZkp7fGCMapuY+jtrFpr9LHYp1Z71hiY6tEIxZk+vrOyQ6K3qhKyhjFCUIbJONXue4rNu57h7HgGcaFikAXkkxXhAy7yebTs45dGlEM6ARInPWE6vIQ0LafJ2k7O7ltMrSKua6+X2RNmBPqN852NVV1dcV/HCn26maruIkeOjwncgCLMN/oLjWXoMadEd1HVHQJiuR/wWQjIcylvjSYt4vXBayQpICQCJcdA0MmfinVjw0sZMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LV3PR11MB8484.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 17:24:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 17:24:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 1/3] drm/i915/ddi: add helper to compute DDI clock
 frequency
Thread-Topic: [PATCH 1/3] drm/i915/ddi: add helper to compute DDI clock
 frequency
Thread-Index: AQHdKT0e4ew+bvlcj0Gkw8D0JLmR07aZFTsAgAAEnsA=
Date: Tue, 11 Aug 2026 17:24:19 +0000
Message-ID: <DS4PPFE901A304FCCE9D34427617C13435EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811025658.2376173-1-suraj.kandpal@intel.com>
 <20260811025658.2376173-2-suraj.kandpal@intel.com>
 <d76160985b70527e3ba2f2fb7cb772b83c5d26e3@intel.com>
In-Reply-To: <d76160985b70527e3ba2f2fb7cb772b83c5d26e3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LV3PR11MB8484:EE_
x-ms-office365-filtering-correlation-id: 963572bb-a677-40ef-6ad0-08def7cd609e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: +Tj0VKDmus5WrD8OZytqT7s19qjRS2JWdGS8uHM/uEDeuiI6zOFzh6BKfPDodDSGW9IqQhwk/e3IElrGcXcJRhyG7T2IWMFIpf5xNoA4p7JF3o/pYGHHpxqPIoCncFqul3Duuq2CWDzt5U29U2XPP1cNUvT8sdWbAVqSzIY8dZgkT6Sea2erFpNEMehjm1cG8q9dOBA7wFUUQSitwvBLd4sdPrR1AsHAyp6PsPciUP0UakJJgN5A6Ru7E5EbSKXZpArAuOdywXj3z7kodHaaXGdFxXxs0v1L0YzLfR96BsFUWcoYcZG0a0PKbD4xEBPFkNYYHj8isfMqZEgkkx1gkBlnmrnbYl6S7kveOkcadQHSEqUqczxEtiN5xHuqiKUa+2gzqNxrWQrmu1FBszTsdeYHvRFIUqy/98WfW3Ba+LVAGYYo0ANjisoqktZCT6nCSw8aXUbc1qk6saftBDb6rv++NB6bDCXoz/ZjpKUkv6xCwxXpmxTlPaaUTWysBxL6Ld/SKLVMA2aMhDZ2+Od5Ae+rLU778tFz7nvOdbx35j5OwLsGdB1SwHjLhhqU0mhmmiBaZqH99m8Nytw6g9SnbrU4LPyHdQTiN4VZtTc6MuVHT/X5lAWPMmtUrF4ukMmDhRlqh37uhaFnq8FisWEtuIriDSHP3nuSPOw2Sr4I6+2RsBKeYi8yEFoUtG7ZzZD7FH2uAhaM2Hh2Lxd/6y2esJ2ducm5kanOx6G/v8fNZqs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UXoPnxM3FPUXsOIxHbBtBxfjW16EeqU8F6IS79TDFcgQnwxQs+HSQaM6YLnm?=
 =?us-ascii?Q?/rgMlJTwLFvOvJqbE3zsfsJP0jw0OpBFYZ/ULq4QD9TrYk9we5DbcJ8fQOS8?=
 =?us-ascii?Q?QQn7/KEQTVOU7ipUfu5BTPBQ7rOTxzMB5brPtqWwDYap32tKmZR1Ql2+DNH7?=
 =?us-ascii?Q?M3Etc360xBaZz71NVxacsRYy36xwgwBkNy6+LR//a1+AqZUPdlWLgrv4lNg3?=
 =?us-ascii?Q?0wPnXRXVY8v3JifnqQnw2EIS6Iq+nyymDaDDKhNSI4i/yQcwR2Wqx2qKiIqU?=
 =?us-ascii?Q?5xjJTZj7ZKzBgNIV6oAXqRZKoZ07KmYnUR6T3ZugutysIhgsIfyDEY8XJXm0?=
 =?us-ascii?Q?37/P2uhMeJPheNWYMnV+S42aRkQLxdXtU1F4rh6UmzGI0HYitb9esI5k6ZNZ?=
 =?us-ascii?Q?/P30WwXhq1ALyVK1ZU6zcnQx6xQTdX21Rm4eA1phvZc+qMFCML15xcL3m/MO?=
 =?us-ascii?Q?Np5AhZqLpy4mIA5So7PDwTG8+g4ugVdiFAdWNXjTL3FIRuoeOT4kXVgOuMua?=
 =?us-ascii?Q?VIblZIr/Jvel4cQbLLMB99EQ2kpqN8RGcLfl60aMkvr3xiwrOLCQdzrYuT7N?=
 =?us-ascii?Q?pGu7UghaxbUxtxA2T5ExLS4QZPeKEPFkttgthp9hB5Pm8ie9zk07/q3O/4jA?=
 =?us-ascii?Q?YmHZkTE7k2W6ikD8cKzmxu17dGkD0eTBR/DY2LlTzRq6F663qrV773F3dg7z?=
 =?us-ascii?Q?Fh1FdIMqzGVM6eXuzDKRyD71hHgNrzOJ0YhRumFLd4hqaXJ13CKxJLNPRyNm?=
 =?us-ascii?Q?bNiidbXwNYosqdr7YSiHoZNz5Vv3KSsJY5hcnBjpEF8xgXXMGo+6uEmZWyRo?=
 =?us-ascii?Q?lfdueDlRCRptumALwYhThbZp/+RAAZ5Noo22CQs/jxaETVbgTgpSELptrFYs?=
 =?us-ascii?Q?eMWdX35rqYFe9G9QcSJrPwaLxHphiOnsMX4d7v040tmERGyHVGUrtkTRLoqs?=
 =?us-ascii?Q?UsRPQnq2AWs0LK4bCGBRzNTUWYmz7pUuCKM8KQWAHU6qsaxyQkbFp/f7KzlA?=
 =?us-ascii?Q?oGDB9a5zusNxOQ/U90QwA7VSWn+C5BaZHv/nJk8Xl6sE/W3+WV8E2AVsTKGE?=
 =?us-ascii?Q?GRITSthpV6PQJyqP5TJKO2E090upErLupvHADeBdke15Qo0ay2ejDcYxlAgD?=
 =?us-ascii?Q?y7Imaawi9e7moKy8vnsv+hFLnrdvzAN+cJk7uN924DHpGa2f1JEIz7BOvGWo?=
 =?us-ascii?Q?WpnP6tef4KNkCZsIx8Js8LYygyOMQvurueyPGqY4wF17TttX5p/7mgPTDqyb?=
 =?us-ascii?Q?vs5lxO4AuSra1CXmeVKnJFgvJ5xW6DbRgZJOF+GLUapQEcdFBTZC+H8lhbJ1?=
 =?us-ascii?Q?N04SwOjZIaLAYzEUk05cJPvP0D1jtJevTioN0EZqA8LTxTLyXH29GaXSNcY3?=
 =?us-ascii?Q?Z9EfW5/RjjeW06Ckxzy3alKVmocDxaAO3/RlpI4j4aQFAeC23wMVqEr+QP0x?=
 =?us-ascii?Q?Q4Hfv8CrbVVN1HbMGA9g91VXrgdPHpM2AommW+753o06wezcYdFXzA/28Gp/?=
 =?us-ascii?Q?LDFHU41ZgdDyavQb7SjSmvqFATnRrTTZxkzOJO7GJMwVEm+BRVScVW58noLD?=
 =?us-ascii?Q?4ONOPdB0YdY8EfUPOqhruHE/yXHOLfrZVOsnTqBhO1lfiXHgV/E8r7EFvZ3K?=
 =?us-ascii?Q?ol6+gtLhYfayduwCfFmBnZM3+BOaAWJRFlolRhcEysKycWRgZ9DE4DPcdlNF?=
 =?us-ascii?Q?20KxVKpnu7Y6i9g68OA/76IVKk2aJyhK2jUUFlF4BpKSq/GkB/iYsGA47e2I?=
 =?us-ascii?Q?3A8CIPoOPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pS4+8u4pT23K2JjVfdJ5if9h7lF4oiDGArGXY1NA43RVxtVMAH5rcttflo82Dc9MDvFhQneblYUecqRILY1E0t4kVoGrrZ1kVnjIkzK/vYr8L8DMgMXiVXLYQadYZp7s8aMuv2ueXGcLUm78YFYkWUNAQ+fU8337R857JCCtz/ab1dKOG3ZJBXvQBLn6wM+H3VEsBe/jnvyCQ3p0UyhqDBnDVE/JM7kYesrDRSzhbNgzWv2qM9Z73t25oPVFnuoG7KhkOx6us4fcUPsuz2LRKISuck/PlLpueZxoUz8tyFifTAtwtnYkvcq30Rz3VLDWSNuxC+rwvU7yho9yi8GF9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963572bb-a677-40ef-6ad0-08def7cd609e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 17:24:19.4195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UYc0OyfRNrY+bOpoYdaGZRcidFbF0cNiwSKcKuofivdUOqfKOI4N7Wjvr3hbih3D+/1jAyL3/MmyLL4BKm/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

> Subject: Re: [PATCH 1/3] drm/i915/ddi: add helper to compute DDI clock
> frequency
>=20
> On Tue, 11 Aug 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Add intel_ddi_link_symbol_clock() to return the DDI clock frequency
> > for a given port clock:
> >   DP 8b/10b : rate / 10
>=20
> rate
>=20
> >   DP 128b/132b (UHBR) : rate / 32
>=20
> (10/32) * rate
>=20
> >   HDMI FRL  : rate / 18
>=20
> (10/18) * rate
>=20
> >   HDMI TMDS : rate
>=20

Sure will update these

Regards,
Suraj Kandpal

> >
> > The DP case reuses intel_dp_link_symbol_clock().
> > This will help in upcoming commits to decide value to be written in
> > DDI_CLK_VALFREQ.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
> > drivers/gpu/drm/i915/display/intel_ddi.h |  1 +
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index bf5788c5bbd3..dd9064592ec9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -1529,6 +1529,17 @@ int intel_ddi_level(struct intel_encoder *encode=
r,
> >  	return level;
> >  }
> >
> > +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int
> > +clock) {
> > +	if (intel_encoder_is_dp(encoder))
> > +		return intel_dp_link_symbol_clock(clock);
> > +
> > +	if (intel_hdmi_is_frl(clock))
> > +		return DIV_ROUND_CLOSEST(clock * 10, 18);
> > +
> > +	return clock;
> > +}
> > +
> >  static void
> >  hsw_set_signal_levels(struct intel_encoder *encoder,
> >  		      const struct intel_crtc_state *crtc_state) diff --git
> > a/drivers/gpu/drm/i915/display/intel_ddi.h
> > b/drivers/gpu/drm/i915/display/intel_ddi.h
> > index 580ecb09b8b6..239d5a403f91 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.h
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.h
> > @@ -81,6 +81,7 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct
> > intel_encoder *encoder);  int intel_ddi_level(struct intel_encoder *enc=
oder,
> >  		    const struct intel_crtc_state *crtc_state,
> >  		    int lane);
> > +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int
> > +clock);
> >  void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
> >  				  struct intel_encoder *encoder,
> >  				  struct intel_crtc *crtc);
>=20
> --
> Jani Nikula, Intel
