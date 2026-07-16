Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D738AC4450F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5262D10F1AB;
	Thu, 16 Jul 2026 02:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mf8yzmy9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450E710EF3A;
 Thu, 16 Jul 2026 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784169964; x=1815705964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UvuZ0dJRp3hUbK9QjNyIW3A7sCEKzuCFxztlVhWr+Ck=;
 b=Mf8yzmy9rEg7QNjQe1I4NrWymf+gQ6sAdgFB7djBYXandnZ6A2j+/geY
 RePZzGgJEhy4t1mYDqF5lKbAtzfwcbWoeZF0CHvDI32I2K2M5WC9FjOg7
 IDrHuCza5zS5Rsvh1WKO8HuDLu+gsSw7zgDkw/HugbWZfGKzIoePPtfhW
 FaAT/7l+Jb8IWXp4bX4Hm1QoLkjhKfReZqYA3vbuJK1wbePLtl2Bmy3ri
 4qnoi40cd//np6x1L3RxA5RNCC7k8lvLlNoR1iAe8BZw/88XheBUV9o13
 rdHHo4F6Wgz8wdmSbJ4iaugojzo+M4JxXJI3mUCCJaHCbACUvSgrDKayw w==;
X-CSE-ConnectionGUID: xMXyjcm0Q7i3a3UQPEK0cA==
X-CSE-MsgGUID: 8FkrneFZRA+shECufbPuoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84936482"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84936482"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:46:04 -0700
X-CSE-ConnectionGUID: lPrn4PeLS8i1aZ9NpeZ0hQ==
X-CSE-MsgGUID: wzOF72NSRL6vmBENtPptDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="255237146"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:46:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:46:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 19:46:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEsXsdG2mTALwzqWCdeSmbDXJzeA8C6fC+4t1+zIW15pCfElaly55TRLGq/PbSKlplFHrAxtANOvGJvrFYYuLygYa9DxENxbbewv8z14FkFwhOj2xn5SAxBY3L/xuCgmGKcd6Yn67nwc6A0TO+KXfzxa+kVFarm/jVzPlVtk1JD4VECRM05yjq+Ywfac2ASU15yltekgCut+2EBzUuJUbKt49wACBkIg9yJOIhZI5+Qrf5XEYE3+Y63jidw2Tht7BHBDq8L7w92KECq7l2V0tBlK5/tNnj9sVaYYOU0fMyRpWMfM44fgktLC/5vPXnT3gOqWwmxxN20N6wtMccYPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfsReCpnwnOEr8luVaRgzpnPjbGJzKbK6t6jjvMshQI=;
 b=ZSRXp3VBMEzTMGR/Qw5CCO/aY2GHx+MAcMWXoGg8lGQPd+jVZ1C5V7zaYjxPYwWiZriLgQgGlo/d1mEEwdQh6kmXoKLaZXYJpU8NECczRN/wj5hZltjY/JPCCKxnyP6yU1W8fnBjGv2y0RUVmU4IvtdNtw7ZuD7zh7u5iF7gJe6521HgbBaanVpV0lhW1TnAA2tb7qyaKW/s8h8tsaa5kpAY186vdqJEnuPT9n+q0aytPMMnOvfmMgq6VC0lNalvtFUimLzDT05nuKessrUXOS6gRLa1ozqsBF5l6nWDLq6AE0px24qo6UX7+hp0T8ebCHC4coPAYG7SO73t6qwNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:46:00 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:46:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Coelho, Luciano" <luciano.coelho@intel.com>
Subject: RE: [PATCH 2/6] drm/i915/dp: End link configuration loops properly
Thread-Topic: [PATCH 2/6] drm/i915/dp: End link configuration loops properly
Thread-Index: AQHdE6VaEfNWGu5i4kmLBiuwipcoo7ZvcrVA
Date: Thu, 16 Jul 2026 02:46:00 +0000
Message-ID: <DS4PPFE901A304F17780CC398A4B867FFEDE3C72@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <20260714152700.555527-3-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-3-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: f84d8c2a-613a-4d36-240c-08dee2e45ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: DZ2AoC1p09fFJg6tWZ40JgbLWxZjTRvjDOTJV6zqjNEHrxKs+3CgqRzxhkHCoBsVSvfTd0ADTeeZkdjGnl8T0+/BIbWNKbHl+EJL8kwU8ZCGNi3+IS6mMCOdtU8xO4zIxIB8dgCJUwy1iANAMVb2MbAmOpKWrliamTsSzPTlhNCMVp7k3aKFfQn2mojMZ1t9LYmIDTc3X9hVqtTjqhJmhWLid9h/VkNbGELPDkHfhV6fzE0RSGv1ekQIv5xZdZoBUA43kQLbH1dcXtAkKMIlVpzXpTwqxc4GRASKi0J1y3i43wSVLkwnEHj/vR6KcegYSOdRU7RMwIQrYAdzST9pdwgvBZuE9b55i14ZtMTT1s1QQcJvpG/iwRqL1BNNVfb5BqWpDBV40gh8SuLpx2IUpfbsRdV/WxyvgF2BDkn1GT5ENtGG9RGi6M9oCEPXGwyXwUEiVIlGzah1mYpJ3q7G8jyYkwD34AOU9KrQz7xGRhMFrQ6kN2aPfQX6zS9ZfbjpxY85/n+rRi53Z+NHVPcC/4vA6RFPotjVrV3fHGfd3yHN+dZgRbpM2YL3czAIusJ2HG38BAU/B++Y8gRnZpc3U8tOoRFbi+SiwR0Ovjk3ghzPm0WwPz5yoaQbxNVw77oanFtpv2ya9lUV4v3H3D0WZEOCDtDmtC6xmtgvHd/E2ODfYnH3Ptm7dTQ5LckJ+6DjZ7RevYnADrD8AQpziTst/MQYuOQsGniGVPSDzH19Sn0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FiYYIxaTm6Jp+90n+zT55fU3lgN/WSii0dfUg9pblECcRMAcfuQ9LeH3N38c?=
 =?us-ascii?Q?rmiKZwWKYQby3b0r74ER7t+X7acicplhUbnRs/96Epjk3j92Eu3Sx+GFZINb?=
 =?us-ascii?Q?qx4FQkITkN94TrvgUGNUYrOrIIsuBflFqe5pLFgjDMCz7kxlTTFYbTHr0qmT?=
 =?us-ascii?Q?NW6PfZrVLrdo/DzAeSR4gFgLs7j648HtLeTcpkzEB+0E5SiGDMLobO8NxYtv?=
 =?us-ascii?Q?n8EATgy6r0ZK6X4DL0cWJDdcfITXMhqLpkBoejIbqoN5kJxxdZM1UM2rxaIj?=
 =?us-ascii?Q?6r5aXaJfeQ1DI6cxOe97cM/W/dVfD5Iqwcfgqf6/GnBNasqdQKku2nZfUvdM?=
 =?us-ascii?Q?t3Y5DpkQUSwGAN31lno6wL8z2WF85QA/cIwwu1ZIpFRR2zSGaZyiQFyDLljM?=
 =?us-ascii?Q?xenvXcTOYCuZlyUtru7kebz2Y3bj95q9DerrzVIpcXAVor4THCfpy9Wxmj7H?=
 =?us-ascii?Q?zZfzV+btCOnw9jnSvKdpmWfvO7fkk9h65vLSpXAaUPNaTi2MPco7DnHwv/2+?=
 =?us-ascii?Q?jnJKqMHUsxj7xZQ2o/op13PTpsGbMJkY5bYGC7ZRkg0stkkp5aT774DeATvV?=
 =?us-ascii?Q?MCOwi1Nl4JOIQ9ewysZ6fB6HkQP/HHmol8Sl+Y2oAZVnAue7lHzRSH8s1gh9?=
 =?us-ascii?Q?SJOp/on3gv/b1Xi04kAdEnwnB3hyYzyfm5sE472VL7V0atpu0pONUnA1TLVD?=
 =?us-ascii?Q?ZZ/CGfo9TZrCnWQ2FDcu9TbSq8yW9VnQuMT44uaiaGEVE7KTa+u///1hFcR8?=
 =?us-ascii?Q?ZrJvZV99yFK1cLdTpRqMIZ/Cymlk67LAomQQuGGmpJQtlVUR5ohevUgB2eX2?=
 =?us-ascii?Q?GKGQ42wpIzUJwhTQBqlykjHtPXycyT3+sHtNI1zemi4pFyU6u12ba+eKghi6?=
 =?us-ascii?Q?A9iiZdfANstgTFxGEZMSHkDwSrx+0zGrTfesl6SHpJLMxa/ZvkW1GMb4ckbL?=
 =?us-ascii?Q?BLo7rcA/DPz56vQ7W89w95DXaeyXBLUTLwAxky1yaZ4q4s/ABMpjX0aW+km+?=
 =?us-ascii?Q?rWr5Pus7+v6BTczrt9ldJJZCRBxfxHeGvx62L2kgVC5z48pVTexbNGJzL7pe?=
 =?us-ascii?Q?YLig6baKPJlAiGtHEp9Faf6TtLvVw8MWQQSRLt3gCRNXDXX7nQ36uUrA+kCV?=
 =?us-ascii?Q?5fvBIV8g0WJinRbb0/FmgPtxMInpk88famL7lqrP7/sRkjxQ+efAJ6Yy5005?=
 =?us-ascii?Q?Akj/yHXHTurunPzH6LNvIuAKphqcy+S9d1AXYpUFl0JCdcm+LHDgvcnfqOUr?=
 =?us-ascii?Q?k0AaxZFqitf5BadO1zYiDchayTjuBK3BUbg+JzCe8HeO+od8HsHSxGe5RaXl?=
 =?us-ascii?Q?UdHkhzo8ec1b7RtNPrsvNLxZruYWTwL4esGnLyEO8nU6lHXrTspYjw3eoqBc?=
 =?us-ascii?Q?sJkP1d1DaN4+3aybKZTDMtVQWtv+bhjDGy9Hfv7wLXLxWI8K7EKOoAOb6xgz?=
 =?us-ascii?Q?A7kZB/SmC+8nr6y/9MLe63zUcWARpt5ZhDspRpaej/bQTnXhWROYtaKWkR3E?=
 =?us-ascii?Q?rezPUWwzfhxo2VD5di0q7s5VmBOHnAKLecg0XmgT7c6KUT+vHTWhT4klazGQ?=
 =?us-ascii?Q?z1m7iFBxC2Ks6Qzy0KKNgX43VituXyzWVrkIVve/4MyPyetlnjpBKKWuZ/GJ?=
 =?us-ascii?Q?ifijY2wFxZfwfDOp+U1MzPnKcOyjS4W1CqR0LAiQ6nvlzDjmBevnCRbKmOW1?=
 =?us-ascii?Q?plZwA84tRZJVqlNOUfXySFhR1DT9561UQeZEcpMG87dsZbXQ+ITTapPlq0b7?=
 =?us-ascii?Q?2IAtgthoJA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bPfjiMVRnLs6bvz++E68f/HFvdQ+dtRpWB+0E0IDAhNmPM8JWLkfBjLLMwca/uwzDKo6Xozwt8zcFS7LPQjzX7FpYaWs3hrCLfACTduHRfG3ej7jUW6u92JWi2+4Jc+rbma0gn1hWU99Dy9w7vJIq5otrr0lu6aBDs8xgFnaHIyZOoU3sWQniXGjcwiD8p1qKrglJxS3IAO1s/tP1M7P5RkbgCf6Fk2Rg/O4+cVyoRauMBpsNHQ6kHWd8U+Zzbw/BFA2N2j/3LahfKnz4J2WmM665PyTaYtqoCSoYiVqULXnAu7BEBTUdRpaPMl2XM108PP3aATlkucMaENO0YtjpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84d8c2a-613a-4d36-240c-08dee2e45ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 02:46:00.6564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUxjz/WuNsQAMHl/SZhGdXDWQTGNfvPvPOzDpXxI4cY1pL0JX061uu7YCrJBOU45nhxR0j9ZX55XDyDyxkGnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

> Subject: [PATCH 2/6] drm/i915/dp: End link configuration loops properly
>=20
> Call intel_dp_link_caps_iter_end() after the link configuration loops.
> At the moment this call only clears the iteration object, so the lack of =
call didn't
> cause an actual issue.
>=20
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Fixes: 7266df62ed0a7 ("drm/i915/dp: Iterate configurations via link_caps =
for
> SST non-DSC")
> Fixes: 4f104fc10a461 ("drm/i915/dp: Iterate configurations via link_caps =
for SST
> DSC")
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0922d23b284ca..0d2c696b9e4b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1688,6 +1688,7 @@ intel_dp_compute_link_config_wide(struct intel_dp
> *intel_dp,
>  	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	struct intel_dp_link_caps_order order =3D
>  		intel_dp_link_caps_connector_compute_order(connector);
> +	int err =3D -EINVAL;
>  	int link_avail;
>=20
>  	for (bpp =3D fxp_q4_to_int(limits->link.max_bpp_x16);
> @@ -1718,12 +1719,18 @@ intel_dp_compute_link_config_wide(struct
> intel_dp *intel_dp,
>  				pipe_config->pipe_bpp =3D bpp;
>  				pipe_config->port_clock =3D link_config.rate;
>=20
> -				return 0;
> +				err =3D 0;
> +
> +				break;
>  			}
>  		}
> +		intel_dp_link_caps_iter_end(&iter);
> +
> +		if (!err)
> +			break;
>  	}
>=20
> -	return -EINVAL;
> +	return err;
>  }
>=20
>  int intel_dp_dsc_max_src_input_bpc(struct intel_display *display) @@ -19=
24,6
> +1931,7 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
>  		intel_dp_link_caps_connector_compute_order(connector);
>  	struct intel_dp_link_config link_config;
>  	struct intel_dp_link_caps_iter iter;
> +	int err =3D -EINVAL;
>=20
>  	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> >link_config_filter);
>  	for_each_dp_link_config(&iter, &link_config) { @@ -1966,10 +1974,13
> @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
>  				continue;
>  		}
>=20
> -		return 0;
> -	}
> +		err =3D 0;
>=20
> -	return -EINVAL;
> +		break;
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	return err;
>  }
>=20
>  static u16 intel_dp_dsc_max_delta_bppx16(const struct intel_connector
> *connector,
> --
> 2.49.1

