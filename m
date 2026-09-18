Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3C7C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D96B10F153;
	Fri, 18 Sep 2026 03:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxUIcBQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA0910F150;
 Fri, 18 Sep 2026 03:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789700904; x=1821236904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kOYid+RK09ACsSYeOUYXFfXyNPr4bwbStxx20w+WuJ0=;
 b=gxUIcBQ8Gu3FsqIaH9jJacDZK41twkqfYZB4LJMd/RDJ/mOVHwaU0fxt
 Ydv4xSiELxeeXnh45E+cQ+hSBbHPk+wqhcqoUnpQ+hgH/3S1nzVVQzPXD
 3xWRDtchfR8F6XAUZcF901zdB4AWAY9Z7/g7AFfUiRgExOQtM7ru+amNA
 Yw/uLlzok9jqNRdtKeV98EIhPS18qm+6D6euB838ms64V8cwP0EBCvQnf
 c+qsbqvDP7fzKKWuFr5ZbO5ByGDnfyB4K3Accru9iDhu5LhCVWz5Kr74j
 mppoN8ObyT12s2wXS0PZnDFE0D+ZcmNhlk1GOIKPWAksFBhvmncTWpBKP Q==;
X-CSE-ConnectionGUID: AhC59rhYTsi2oRBZq7q/kA==
X-CSE-MsgGUID: wPYkGLchQOO6E1T8U+gp3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115713544"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115713544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:08:24 -0700
X-CSE-ConnectionGUID: ypPAwzWGQC6B1KTDzvmYyw==
X-CSE-MsgGUID: 1YD/v7lSQHSoJD70ElLF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269869470"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:08:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:08:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:08:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7CGijjcQCvROqk0z0M566bwsUHManCbc20LTyvVt17bIZ3Tl9Uwl0sBcccehPLYGxXxCWG596FsNOyqavzt5qqjI8iF+dOJxdjor/W71cPl6PoU1JnSy81k0FTUF3tYBeunT35NGGMi9TnmDFqYaA1O1Z2JP5gnr9HZoFVKHMcms2Owhh+1ROWDXG3kmnZKGD7NO7f8YRMYzBPaSx2fV2c0eZojq3AyaL1xillkh9pwqcsKpqE7yarvTvATaPIHICDfxZ6NPTpEqUgpddljpNINhxfn6dM6TnUR2RaKWC/acvXNLA8XhKxk5JnLtIzAdZ7JmBRBSkxBVmClNSPQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGY4Yu3PvnqJABT3WmDnbUTZyjhZRy//mUsI35vIKf0=;
 b=POj1N0QT3nn4dPMrfl/6V1QRvbaU1rK0sEzISy1+z5RwR33k16dKW9hKKLQZdysrFtQfJkFLRlxCm3iKCb5g1Yis3W8FWsCKu80x/YOe1I5R4E8Mjz3VNHVqHZ+zwJdpgYGs/qfC65gzeYA2Wr3jJUEWUbfCvXRTAwEJzb+nKiFyMFxO4NQ8ERSBRsaXfNARSdbfD0CFZbOK/R6aVhUPJBVIgBkwwTWwW0PfnJGeDKRKvCfZkBI1t2i9uvJQIaagbtJiGU3KP36dfRzshUUY9s8BJEBC3c1dTevGK1w6oPUUkgvZo41Xf7GOCXGMPTnVG02PVWsFLIrtJ9x1EXggBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 (2603:10b6:518:1::d58) by CY5PR11MB6140.namprd11.prod.outlook.com
 (2603:10b6:930:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 03:08:18 +0000
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b]) by PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:08:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 05/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 read_data, write_byte, write_data}()
Thread-Topic: [PATCH 05/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 read_data, write_byte, write_data}()
Thread-Index: AQHdRbWl1lAXcWaPUESos46lTtWD8LbTqeJg
Date: Fri, 18 Sep 2026 03:08:17 +0000
Message-ID: <PH3PPFE26A71A1E70377DC82127CCB4F12FE3872@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <f16cb57607634d411a42ca6cd80b10a713d7677f.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <f16cb57607634d411a42ca6cd80b10a713d7677f.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE26A71A1E:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: 5b93c502-0c5a-4ffc-6225-08df1532167d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003|3023799007|38070700021;
x-microsoft-antispam-message-info: 2OP5q9wCJTPbERjVc8uISBZN9B+02u/gQG1eFP24rKK9Eu7epVhJBOuUXcUQ0hP7y2XqeWGpgcWcoXR+wptW8LSc+QirNEJ/4T0o0TuYbFRU3WmLOWK35V+Pt3Dra8cq75lNtmpxOQ3xjJp4oelmpFRdn3RUD68MzqMIyIky8qt5nJXOCV0MroVbQDBGUX7yywRGQbKwVyBsGkbWUjeRVWtynPMJtjBE0GaZY6I0pRuzyOw2HMMSJJLnoq4DB+z23KpjSK/7s0kxL5Hy8H6HjP1eg6Ny8ktA6F+sRQOm92WmtXeL5llHP9UPxQSO4lFsSA4YdBXyqGnGSxqSOC3YqdUOTRYHYY/NtQOWvcdaxksV2d0y5EP+1TlcL6Mll7WMV5/GhuoKeFKe1ySDC5uEYB9LAFOdxYPXq3IwA9KBKjiRjuGFt4wRp5EFdqC2R2inN5lFnY7oNTjymbdTxteNQAhBqq4mkTTVJNSLiFvBU4rOIbJXRE0OTM4Yy35HrJ25v0/fmkVnZERHxYQ/l6/Fvmjh93/nHdNcxc47m03oQ8cfvo+MRdcYDajBulNhK1L0ezUgQpgQEimZP1DqIWq7scWU4MDljPUlrc59rjEh+h3lZ1SfICr6G6fEm/bc0VLKdNHWYESNbWxWOkrI5kBoUGWl2q82JgmeZRNyVDPVePHFI2uHYuo2B33wYkQSY+Ijbm8mO4qRc1zAEbQlv+NKYa7RxiP+lyb+ljF8G9o+s24=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFE26A71A1E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l8FbKha66+t4CQWPUX3YrbTpZ7QUCWikwcgbFnhhWrqKyACPYGJ2aB/DW9Tg?=
 =?us-ascii?Q?S1rtksim0VJDseJvdVE2QB2V3XOjgp7gjX14SQtJL/QV1nlp9kXB3T/FAn0d?=
 =?us-ascii?Q?Bex+oZCYhu895UFzByN5uG4GaaJVw8nEGxFDqsOJxTLwP68RW9YdMxQlZo2A?=
 =?us-ascii?Q?z+X3OidniF4HXTs/jAgp5K8lAXcc8I/RO9hz+/dKIqnRZyjCIOmk+xWuiwEm?=
 =?us-ascii?Q?3NcQJeEZuclqFlSM/VBPA1TRmam1W+y1EQnbPgrs8/c9IPmnSzlDlmVaLliw?=
 =?us-ascii?Q?WnCHn9LqpNOBMDe0T80HbKYWWhYTtmWEEZ2Qa1LdY41wPOCyv6lqz0ze6VIP?=
 =?us-ascii?Q?oQXWIBqZ+kpcaZhKRM6hlM8bL/Mol/0meU4GXfKtrZ9l/F1MHQWZIrbBQixK?=
 =?us-ascii?Q?7oB2XoCmILRs5z0V4ik30ieJ31bqFbGIQdHZbYdC2ll48NJ62vEmUQ25y+uJ?=
 =?us-ascii?Q?m8Og3BzAtqd3tx4n93W1NJbK5NQiefMSNUqiRZR32FeguwfYiLaJmd36nnS1?=
 =?us-ascii?Q?uFgVX0Kvb5FNUKUaIaTQl6MNSJKeLG832zOytGHVLlNu98lEEIpv2W/uMrKc?=
 =?us-ascii?Q?q/Ow9wzDOcyuiND+cMlbuAst2cx36i9QzWu1HGWJMpA+DNTGn8kUr44fOVCd?=
 =?us-ascii?Q?rzPpYKlYE2U0QQo0vJOsHw8KfHNv2Osqq950V6dbaGzbNKaSw4lZoLEkWnOj?=
 =?us-ascii?Q?AjNHWaTtANJm2FhSJnGT5SKl9m6DEMK/QZyh6awTvsDDYI0anLUw1j276G4q?=
 =?us-ascii?Q?zk3C5n0poa4IlOiezG5bnmZXc1RuFyJbZo7/AzzLWua4KTrhAuiRYCCKkas6?=
 =?us-ascii?Q?4enLPIAm3R103WX555Z38+l1NibBce7e2AeTDalrH8mcy9GeZTy3bQn+GpIz?=
 =?us-ascii?Q?7TYJUAjfNwbIZzYEsHMbsUXRStkI5q4lFq1wF974Uxz1yoNDmYR2aFN495b/?=
 =?us-ascii?Q?7Dq0STQ9Zgsu6ZKEnZewtkG35PbBwinlD5sR10Exj2OnBR12FOBID199MOgj?=
 =?us-ascii?Q?N2IVJaJa3v5JH26sDYrhoxqnx64bIj1g3Xlovm6jQoIvysZWErRcd5mVcP1o?=
 =?us-ascii?Q?Bf+BxDAIw3EQeIjWtwL5MvoNvcxwnL8kZ1/25NFkfW7XYnNCbYZg2R2O00s9?=
 =?us-ascii?Q?yuJ4aUunuNdWdSreCTQhvfXrjSbza62PUVID6BfP07hp3S7g+MXeEc8dE39E?=
 =?us-ascii?Q?7ZM3l2sXoGwhjn7CwRXaDL5KhKz1EdSLCT9YtHoG0H9Zu5JRTR3B61AQjQWJ?=
 =?us-ascii?Q?CrAOslDDJMWMW0AMow5KEEQdlF4wql8ypSoHSs/Db1PDyQQ7rzxIdy2n8Ab6?=
 =?us-ascii?Q?mys0+l0KyxUyTmIB2ZSOuxkZ7iS1cK3nVtXVP/2S14HnuqDWNnE42VZmWPrm?=
 =?us-ascii?Q?53kcm+gehq0s6VlM+z8GFF881xijFSFP6amLAzbKizvn8UULJEKCAWsTWwGD?=
 =?us-ascii?Q?yOufKK1MwcJ6B25sxgAy54NdREtkDAa71TvbHX/YQls3r60pshgffRWpw2nY?=
 =?us-ascii?Q?0mikizpBVgnv4ZDS+MlqwZ3gfuUla0bjAfsrAvSUIktrC1ClkSKsZayThBUA?=
 =?us-ascii?Q?lqB2Pk1uSWblMaDq1hFQdvET1E2eCRl764j1yrvUNQ4RO1AvcwpkdkHeBsUZ?=
 =?us-ascii?Q?DTwUelE3yaTlxDz7XKBEWtyGcz8/QG0W77xmr/5U4c7QVZwChT/jLI1/S1Eq?=
 =?us-ascii?Q?VTc2TE8HhUDiG8M7EXvei25AzMBZN26zQxY0TEE1M0wKZG0ZWSHbQRJNwObw?=
 =?us-ascii?Q?cAXPKkLMsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J4/XEjdxrVTlC6iKebn8GWpT0KWYh+tanAU34uGcL2FmHrUYdPJ92L7ViJxrEpOwt1cWkX16loya9zxFeGIHbUCY51kYPEyBWcbfn0HDger4rh+YbKMv4PHjEGaiDWsEOWcAuizybKGK/KsTQX8VhbcL3kWl/plgKIKD+iWCaNzaLhLttfy1lgNk51qeTQQkNZH3A+YJ3jfzdTkqbFq5aM1d9KqEm1SPVo6Fet44MHUvJd0oC7xwZt4oC+BuGQ9msQcJL+mIwfzbKqBb/lNcuKKSt3MMXQx+0FsluiddW7eoXTsaQrYlI2KpWP1r0gusCDAwTz3irVleXQoCglbrYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE26A71A1E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b93c502-0c5a-4ffc-6225-08df1532167d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:08:17.9656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBp1ne4wno1almFQesHbP6Kkyu+gWjyM1sz8+uXkcpsTQMXZj4X9yeo4kQvLWuWaAJHSfF/tU69VHSVScTnw2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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


> Subject: [PATCH 05/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte,
> read_data, write_byte, write_data}()

The prefix here should probably be  drm/i915/backlight

>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Use local ret variables for the return value instead of checking inline. =
Use %pe
> and ERR_PTR() for logging the errors.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

With above fixed
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 51 ++++++++++---------
>  1 file changed, 27 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 266e042e0023..f30da5f7e3d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -120,8 +120,8 @@ intel_dp_aux_supports_hdr_backlight(struct
> intel_connector *connector)
>=20
>  	intel_dp_wait_source_oui(intel_dp);
>=20
> -	ret =3D drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap,
> sizeof(tcon_cap));
> -	if (ret !=3D sizeof(tcon_cap))
> +	ret =3D drm_dp_dpcd_read_data(aux, INTEL_EDP_HDR_TCON_CAP0,
> tcon_cap, sizeof(tcon_cap));
> +	if (ret < 0)
>  		return false;
>=20
>  	drm_dbg_kms(display->drm,
> @@ -178,8 +178,10 @@ intel_dp_aux_hdr_get_backlight(struct
> intel_connector *connector, enum pipe pipe
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  	u8 tmp;
>  	u8 buf[2] =3D {};
> +	int ret;
>=20
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp);
> +	if (ret < 0) {
>  		drm_err(display->drm,
>  			"[CONNECTOR:%d:%s] Failed to read current backlight
> mode from DPCD\n",
>  			connector->base.base.id, connector->base.name); @@
> -197,8 +199,9 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector
> *connector, enum pipe pipe
>  		return panel->backlight.max;
>  	}
>=20
> -	if (drm_dp_dpcd_read(&intel_dp->aux,
> INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> -			     sizeof(buf)) !=3D sizeof(buf)) {
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> +				    sizeof(buf));
> +	if (ret < 0) {
>  		drm_err(display->drm,
>  			"[CONNECTOR:%d:%s] Failed to read brightness from
> DPCD\n",
>  			connector->base.base.id, connector->base.name); @@
> -215,12 +218,14 @@ intel_dp_aux_hdr_set_aux_backlight(const struct
> drm_connector_state *conn_state,
>  	struct drm_device *dev =3D connector->base.dev;
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  	u8 buf[4] =3D {};
> +	int ret;
>=20
>  	buf[0] =3D level & 0xFF;
>  	buf[1] =3D (level & 0xFF00) >> 8;
>=20
> -	if (drm_dp_dpcd_write(&intel_dp->aux,
> INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> -			      sizeof(buf)) !=3D sizeof(buf))
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux,
> INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> +				     sizeof(buf));
> +	if (ret < 0)
>  		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness
> level to DPCD\n",
>  			connector->base.base.id, connector->base.name);  }
> @@ -258,13 +263,12 @@ intel_dp_aux_write_content_luminance(struct
> intel_connector *connector,
>  	buf[2] =3D hdr_metadata->hdmi_metadata_type1.max_fall & 0xFF;
>  	buf[3] =3D (hdr_metadata->hdmi_metadata_type1.max_fall & 0xFF00) >>
> 8;
>=20
> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux,
> -				INTEL_EDP_HDR_CONTENT_LUMINANCE,
> -				buf, sizeof(buf));
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux,
> +				     INTEL_EDP_HDR_CONTENT_LUMINANCE,
> +				     buf, sizeof(buf));
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Content Luminance DPCD reg write failed, err:-
> %d\n",
> -			    ret);
> +			    "Content Luminance DPCD reg write failed (%pe)\n",
> +ERR_PTR(ret));
>  }
>=20
>  static void
> @@ -313,11 +317,11 @@ intel_dp_aux_hdr_enable_backlight(const struct
> intel_crtc_state *crtc_state,
>=20
>  	intel_dp_wait_source_oui(intel_dp);
>=20
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
> -	if (ret !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
> +	if (ret < 0) {
>  		drm_err(display->drm,
> -			"[CONNECTOR:%d:%s] Failed to read current backlight
> control mode: %d\n",
> -			connector->base.base.id, connector->base.name, ret);
> +			"[CONNECTOR:%d:%s] Failed to read current backlight
> control mode (%pe)\n",
> +			connector->base.base.id, connector->base.name,
> ERR_PTR(ret));
>  		return;
>  	}
>=20
> @@ -338,7 +342,7 @@ intel_dp_aux_hdr_enable_backlight(const struct
> intel_crtc_state *crtc_state,
>  	intel_dp_aux_fill_hdr_tcon_params(conn_state, &ctrl);
>=20
>  	if (ctrl !=3D old_ctrl &&
> -	    drm_dp_dpcd_writeb(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) !=3D 1)
> +	    drm_dp_dpcd_write_byte(&intel_dp->aux,
> +INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
>  		drm_err(display->drm,
>  			"[CONNECTOR:%d:%s] Failed to configure DPCD
> brightness controls\n",
>  			connector->base.base.id, connector->base.name); @@
> -392,13 +396,12 @@ intel_dp_aux_write_panel_luminance_override(struct
> intel_connector *connector)
>  	buf[2] =3D panel->backlight.max & 0xFF;
>  	buf[3] =3D (panel->backlight.max & 0xFF00) >> 8;
>=20
> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux,
> -
> 	INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE,
> -				buf, sizeof(buf));
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux,
> +
> INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE,
> +				     buf, sizeof(buf));
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Panel Luminance DPCD reg write failed, err:-%d\n",
> -			    ret);
> +			    "Panel Luminance DPCD reg write failed (%pe)\n",
> ERR_PTR(ret));
>  }
>=20
>  static int
> @@ -456,8 +459,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en
>  	int ret;
>=20
>  	if (panel->backlight.edp.vesa.luminance_control_support) {
> -		ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> -				       sizeof(buf));
> +		ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> +					    sizeof(buf));
>  		if (ret < 0) {
>  			drm_err(intel_dp->aux.drm_dev,
>  				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD\n",
> --
> 2.47.3

