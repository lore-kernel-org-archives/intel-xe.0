Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F69CC6B1C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 04:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0779410EB69;
	Thu, 15 Oct 2026 04:11:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7615010EB69;
 Thu, 15 Oct 2026 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792037458; x=1823573458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ho34rUCkvac4tW6edZRG2gZcNfjZ3+g4rVQ76YMmn+w=;
 b=bZLwE4j0l+sQGT/1k0M3pHN481+ay5fCY3Dq5TapabaiuKJfZdSKXFjL
 GdkLLBsPNZI08R2j/OE2Kntm0/WhcZjo4ZGz2WE6kN1gafwg9xbuMdLhx
 BLcsWG54XP8g6kWz4CoxhuSeIZvadaXmhog6CA2pkHRlkp84NXCOh6dhB
 voGspuMv96VP/FMje5e7ZqTCpVMPwBbP3TgtTmkYoKQjqaoP0gsjXNuJD
 KoDWmSUgOUFIF5Y2gED3Dm8qwMWpr1c3ois0/tLoSXutHGxCv1J4Gz0VL
 nOLtDCvU6yeAwhX1I0WMx1x21wPvzSLOMQODN1tq9HFulJ8Iccz79Wtip g==;
X-CSE-ConnectionGUID: YxtD9noGRNKIus9UVYwXTQ==
X-CSE-MsgGUID: oYEqXN+LQ/KtjBYPE5m2fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="784148"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="784148"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:10:57 -0700
X-CSE-ConnectionGUID: r6vt+ijhRW+TBV40ALccwg==
X-CSE-MsgGUID: Ow8jFNqzRySeND3x9iJ/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1610770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:10:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:10:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 21:10:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXgg+reHuDL3WZWaHr3+xB/PMLHGZCol1ywx1ASuNClHPWPGTMEvAWrx/En8AxKL/+DRjqVmtBD4xHANBFcBp1KYQRWUCNwjQgPIQkpUBB7+CJ9VCZJzodTaD2ODLzavh0XsG4Wk6CNxoOCo5qC3cy1gRDqUWZyMakCfqYNsxUBHRCfeSxgZKxv2weEQS6lpCMxfknVB5ianpqm1XiDmdo3yF1/Qpf7cUYypW6EQeNh8VVGutFHNrmoCguz3eCrCRnqsXRYUqkWOZ2O0ZlurmSdOquxiij8pyIDVzLmhMwrE4xnIa1nk3okTQqLDBjjtTcudMseQ8xCPsj1McUhx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zq2ea6FjijFmdXD5Et16KIpi/IEGmZg0qdIy7Yq1KI=;
 b=bV+WQDv0ZxIGc3CuWLniyXtWZCRT9E4Mvzi52LKszM9MJk7hFiH/jVLPJrEpm1sJ/eVBF3Th14lNG/trQWCrRGgTsZFjpDd7wt40gVBM9pKcAGUQnlE8dqOxwVrePh/OOQecUlgGcoRpfmUnpcz+TiJXgQZV7RwR1Dzft+1FzNsrP9+stzVXObdv8HVRCEv8tM8INVkzhWxNrcFTZrQtcV0mRDREr2JR5FNzd141ZDfFS7pqTqjMp4wS/uCdCYTq7vVhsysRuX72bIMlrxe0l7y5Ltjs5rTUkzaVC7bjbLG72uGKk77ngYCbUQXJU112yZhMVve4cYhvcQU7Vc9l4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA1PR11MB5898.namprd11.prod.outlook.com
 (2603:10b6:806:229::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 04:10:49 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 04:10:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>
Subject: RE: [PATCH v2 2/4] drm/i915/lt_phy: split out
 intel_lt_phy_pll_calc_state_from_table()
Thread-Topic: [PATCH v2 2/4] drm/i915/lt_phy: split out
 intel_lt_phy_pll_calc_state_from_table()
Thread-Index: AQHdW8pI7y0sHDnjG0eDBYgGOPUUZLb9/Mqg
Date: Thu, 15 Oct 2026 04:10:48 +0000
Message-ID: <DS4PPFE901A304FEB563EAE119A046EE79AE39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
 <20261014105306.2761683-3-mika.kahola@intel.com>
In-Reply-To: <20261014105306.2761683-3-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA1PR11MB5898:EE_
x-ms-office365-filtering-correlation-id: c8137780-3a01-4505-b3eb-08df2a724b69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|261009223027099003|11063799006|4143699003|22082099003|10067099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 6dihc8os7CwOG/HxlAjCIgXhxkDess14tk/H9jDA+uyvk6D/mnaDdp3xDUZDG/31UyI9z9HOIv/Xv6cb62KIXFXBYKRZbfu4YVBkFB4ymdgnuTP0TZss+vaYMRBRbTXT3SBzC2MDqpSAnpeUxz+nkMfR1ak0l0V7PqCvoa2trdcaa8Z9lUE1n2ccso6Px6hiZ8dSCw7AubTXHjbDFzcg2rOhpbYoUUyiCvh0WOmzjzfCYyOJlJkXTvfxdS3ZqUzkfAPiO2iG8V5OiVzsTf9Rlp8W+ZdQWB799gmyd7jDKq4f+mdnjjqgkHtHpZwAjELfF+L/ZtyTT9mf9jCZW3B4xWMtsFLIv4bFgsaYh6Lgfl0WfNzhXH3xIIDk3Vw3HM1ZTGlMAYhQz05ctOvin6n3xV7kNmTVjuz9da25FptxBj1rvgEIMsaWdtUGqQt72M2xk0IbP01Adkog++xl02EucbrMIhV636rkGXWNzfOef7sF0CX8YNXekTbBEkYa0M4DvRcdhFTsTIuf7qn5Qw7aLaZQGwlAuX7+/NxNd61Poa9HQ/yawiyN3AgQYEochsJOtKQFZYzQODwXUJXGw7z5mrvFr5AAp/7SbuBfnJXWkmEmAGRbuv6XXBCUyZImHm/g+AlWq0C232AiaON691hcQvPwjhcgGIaRW7teWGZTkZ7bqmdtLzP43Kl7P6QU3JvIUppCa09VK5whbLvK5shAkejpqGKa898fkWwCf5CAKI0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J+sFZC8tGyq2i+PBkIqtkqcFtmEaiLC59EDnD/lTFKJtjQPQCR3sxxYnDeek?=
 =?us-ascii?Q?1TO6g4g+qbF+eZhbB2OkfYTgCvjO4EngY0QI8uHeqHwPeARNT5/fIInIw24P?=
 =?us-ascii?Q?G5oy/cFJeTUO5IIJP6wGQXtRbHyT7q1KTJAeTEFs3N2IPHkBLWWRO4E9LBTT?=
 =?us-ascii?Q?hY3tev+xwsAob8OYB+qJa5zdy6zx2BM7CRkkMRykBnCPnMRhBPLDenGRxSnZ?=
 =?us-ascii?Q?boXZPILpq0sV00PQPp49Tg32wSDwX3/TNApJdkX991srQqyhcfi7MbSNTAXm?=
 =?us-ascii?Q?tZp7jJeBZj+5lGTA/RfnFZuWT3/Jw+NVxX1e6c73IiF6rOiGp3enLHw4tbIr?=
 =?us-ascii?Q?lWtk5q7RyE1RUyIP0+90lQGll5V2ZkS85qufzKFgILblh0tlbxORoDieDrUE?=
 =?us-ascii?Q?OS/12sLYeS71FTyIkfF+xlN5aBSug/dEUzaN6ZOeqGFYyVoqYX4rnRrtwVLW?=
 =?us-ascii?Q?yFO7R9DpBAL70Un5+hMij6jZPPC668UrKoxV+JwSt3Gcxkg+p/YltsQjNf8m?=
 =?us-ascii?Q?sSecJwB0NpaJfaNDO8HJ5dxyjLxzpN2t2vYfRDtFKaKt1OrSNRnivUmDpVEr?=
 =?us-ascii?Q?9j7CgZKGeEz31SY+1f/oT32Oj3nOCBprMZiiCXpLtHcJgoehxTyXasf+70hD?=
 =?us-ascii?Q?gDm/vsJK8/nEcAr3AZGCwYEmh1HRLcGZsSMT4kSLk3wYzJOz68QP32+wKf/Y?=
 =?us-ascii?Q?y1jhkMCKV+ZaUgc+Q1L9QiQxm3iInGYQKIYf6jFleXrgPos4zJsUKWdM8YwK?=
 =?us-ascii?Q?gZN3CrIqoOEhP1bH+kABPfakPwYLUYcXp9/dKsbhZf+C1eJ7v2lA2AVBU5fX?=
 =?us-ascii?Q?HJY/XvHlQrzWJEs9sOblNuTL6sDGNuiyUCwCp8XttRzuHYHcgyUruCPQP+sX?=
 =?us-ascii?Q?5SDfgYf3BViatovuuhpWKdwzQX5O6WiuvZyj9no0+qJ/1dVky3C49GhymXE6?=
 =?us-ascii?Q?tQ/iFcfUgPSJozXsbBLLxWiJPjusn9ZOnLeV4EyZq3YANpEvDiePpreXyN1S?=
 =?us-ascii?Q?vFesytqk4ePFFJB9ifqE/dmulisLl68Rn7NiaVJFcEDPwJlVMW0jJ1EgD4GU?=
 =?us-ascii?Q?i0Q7Q8VJUeoU5pBNGW5ornEwbIL3I29cq2oYISTyS6J4P2wJs6m5z/xO2MsP?=
 =?us-ascii?Q?7BHP9IoOy+TykER5170ujU99QI607p7cIKM9ckNbeClX2YAOvQMM61rfon8x?=
 =?us-ascii?Q?u6XignOWei2EhoNW6UaIY1huZKpxluaUCracw5PX7cLuRSQnUmyFyhTp9o7I?=
 =?us-ascii?Q?7qpMaTuOxKhPYTP6GCQlVShIvnpKuMlNg0n46vY/KX6vgC9n7OVm9y8fxmnX?=
 =?us-ascii?Q?TmgwSOKrAv0VbiKuNu4zH/iC5QelKthja3ttn5IvVpwHYuXsSXRbybhcac8G?=
 =?us-ascii?Q?lxpuFafzzug7EsNj9fNQmvFDi8pXS9LH+01y8402aOE5HcdQ85Jl+Zwa9QBy?=
 =?us-ascii?Q?eeD9EcP6j9wFeOIbS9BJ2V39ePvQiERZ85IwwB8+0fRendxlpRjW7lbH+N3b?=
 =?us-ascii?Q?KfmSygyGMNrV+nzVzZgRxFxtRF6o99bnOsccqV3gXpr6XyoSNgjTaTwrImyr?=
 =?us-ascii?Q?0OLjQxgkl8N+xKeQt+MJr8mcIWBsclNOQyxHiepG9DJA2MDhewev/Y+pUYZn?=
 =?us-ascii?Q?r8B5709fpwYc/3K9WjZZKeQX5urL62LO5hQmNDPS0YtvS1aT1kBevqSMLil7?=
 =?us-ascii?Q?xZ5KkoMQkIIKq9VA3KDXtVZvyoKZrZC3b2QBiQEDyn6qYnudt0BgdrTkQ1+b?=
 =?us-ascii?Q?IUt0wO/TQw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fy2kfCsOuWAyxQ8jbm8Xd/Urr/4hjmncgcftrSnW9BzVYOhcKPfnM1/rKXRkcZN2jRYhBHkNjlRe7ZduRsQN5UJd70737djg1N2uc9t2XI35Cc/gXFBFSiDQ/kE2WcMLgnkPQMo+K0L7PEkkkjsCBeeLBROIN0fgGJC1SYfGrJK1xGRywsNrFLdLh5ZA8skQH+Y6RLdadRrTOM+TNKFjLXuymoVJK0ll64Pl3HRnp3ETWzbLUIrGQc/Ed0CJSJbDKqTwmnCB4CMWWsGZylmVboZ6XVJQmy8oGsE1ZCb3HP1WmatmFIIP0Ce6MmbvHJndHJKbuFOulR08WQpxszl3jQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8137780-3a01-4505-b3eb-08df2a724b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 04:10:48.9232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BzfGYSjt4m0YNaRqd53I+I+sOkY/d7td6PCEscs3ujlWhYlowNY7wSxfggslDaEeYI47ROZJYBTmfUWiH3KuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Mi=
ka
> Kahola
> Sent: 14 October 2026 16:23
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Kahola, Mika
> <mika.kahola@intel.com>
> Subject: [PATCH v2 2/4] drm/i915/lt_phy: split out
> intel_lt_phy_pll_calc_state_from_table()
>=20
> The PLL table walk in intel_lt_phy_pll_calc_state() is only reachable wit=
h a
> crtc_state. Split it into a helper taking the port clock and lane count d=
irectly,
> and pass the output type in as is_dp/is_edp, like
> intel_c10pll_calc_state_from_table() on the C10 side.
>=20
> intel_lt_phy_pll_is_ssc_enabled() loses its crtc_state argument for the s=
ame
> reason, matching intel_cx0pll_update_ssc().
>=20
> No functional change.
>=20
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lt_phy.c | 71 +++++++++++++--------
>  1 file changed, 45 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index 86492651b01d..c626246b71f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -1329,12 +1329,11 @@ intel_lt_phy_pll_tables_get(struct
> intel_crtc_state *crtc_state,  }
>=20
>  static bool
> -intel_lt_phy_pll_is_ssc_enabled(struct intel_crtc_state *crtc_state,
> -				struct intel_encoder *encoder)
> +intel_lt_phy_pll_is_ssc_enabled(struct intel_encoder *encoder, bool
> +is_dp)
>  {
>  	struct intel_display *display =3D to_intel_display(encoder);
>=20
> -	if (intel_crtc_has_dp_encoder(crtc_state)) {
> +	if (is_dp) {
>  		if (intel_panel_use_ssc(display)) {
>  			struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>=20
> @@ -1740,14 +1739,45 @@ intel_lt_phy_calc_port_clock(struct intel_display
> *display,
>  	return clk;
>  }
>=20
> +static int
> +intel_lt_phy_pll_calc_state_from_table(struct intel_encoder *encoder,
> +				       const struct intel_lt_phy_pll_params
> *tables,
> +				       bool is_dp, bool is_edp,
> +				       int port_clock, int lane_count,
> +				       struct intel_lt_phy_pll_state *pll_state) {
> +	struct intel_display *display =3D to_intel_display(encoder);
> +	int i;
> +
> +	for (i =3D 0; tables[i].name; i++) {
> +		int clock =3D intel_lt_phy_calc_port_clock(display,
> tables[i].state);
> +
> +		drm_WARN_ON(display->drm,
> !intel_dpll_clock_matches(clock, tables[i].clock_rate));
> +		if (intel_dpll_clock_matches(port_clock, clock)) {
> +			*pll_state =3D *tables[i].state;
> +
> +			if (is_edp)
> +				pll_state->config[2] =3D 1;
> +
> +			pll_state->ssc_enabled =3D
> intel_lt_phy_pll_is_ssc_enabled(encoder, is_dp);
> +			pll_state->lane_count =3D lane_count;
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  int
>  intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
>  			    struct intel_encoder *encoder,
>  			    struct intel_dpll_hw_state *hw_state)  {
> -	struct intel_display *display =3D to_intel_display(crtc_state);
> +	bool is_dp =3D intel_crtc_has_dp_encoder(crtc_state);
> +	bool is_edp =3D intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
>  	const struct intel_lt_phy_pll_params *tables;
> -	int i;
> +	int err;

Rename this to ret

>=20
>  	memset(hw_state, 0, sizeof(*hw_state));
>=20
> @@ -1755,30 +1785,19 @@ intel_lt_phy_pll_calc_state(struct
> intel_crtc_state *crtc_state,
>  	if (!tables)
>  		return -EINVAL;
>=20
> -	for (i =3D 0; tables[i].name; i++) {
> -		int clock =3D intel_lt_phy_calc_port_clock(display,
> tables[i].state);
> +	err =3D intel_lt_phy_pll_calc_state_from_table(encoder, tables, is_dp,
> is_edp,
> +						     crtc_state->port_clock,
> +						     crtc_state->lane_count,
> +						     &hw_state->ltpll);
>=20
> -		drm_WARN_ON(display->drm,
> !intel_dpll_clock_matches(clock, tables[i].clock_rate));
> -		if (intel_dpll_clock_matches(crtc_state->port_clock, clock)) {
> -			hw_state->ltpll =3D *tables[i].state;
> -			if (intel_crtc_has_dp_encoder(crtc_state)) {
> -				if (intel_crtc_has_type(crtc_state,
> INTEL_OUTPUT_EDP))
> -					hw_state->ltpll.config[2] =3D 1;
> -			}
> -			hw_state->ltpll.ssc_enabled =3D
> -				intel_lt_phy_pll_is_ssc_enabled(crtc_state,
> encoder);
> -			hw_state->ltpll.lane_count =3D crtc_state->lane_count;
> -			return 0;
> -		}
> -	}
> +	if (err =3D=3D 0 || !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)=
)
> +		return err;

Lets just have this as=20
If (!ret)
	return ret;=09

-----------------------------------------
>=20
> -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
> -		hw_state->ltpll.lane_count =3D crtc_state->lane_count;
> -		return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
> -							 crtc_state-
> >port_clock);
> -	}
> +	/* For HDMI PLLs use the HDMI algorithm, if there are no
> precomputed tables */
> +	hw_state->ltpll.lane_count =3D crtc_state->lane_count;
>=20
> -	return -EINVAL;
> +	return intel_lt_phy_calculate_hdmi_state(&hw_state->ltpll,
> +						 crtc_state->port_clock);
---------------------------------------------

The above changes are not required I would prefer them stay the same.=20
The check are easier to interpret. And chances of hitting corner case issue=
 are less.

Regards,
Suraj Kandpal

>  }
>=20
>  void intel_lt_phy_tbt_pll_calc_state(struct intel_dpll_hw_state *hw_stat=
e)
> --
> 2.43.0

