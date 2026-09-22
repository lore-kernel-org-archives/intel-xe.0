Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD3AC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B18910EC02;
	Tue, 22 Sep 2026 08:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrYSXPzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF610EC02;
 Tue, 22 Sep 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067504; x=1821603504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ptdvL10x3IPHSc40Qk4bwMYvPGnDfEC+og4kJsrwwk=;
 b=XrYSXPzKR3lpyLcgS857PsNIKH5FO1DC6qZSXgI16snRlW4OqloqEfR3
 7uo1E25QhJeRbNv+eZku0fR1sJkRwlBXkh81z+oukmLz8r3s3bDL6eqIa
 QVWcpMOU1QnfccOfi9uUA3I6es5udPuranzZJrRTrSOfwEBZ7FJE6c5xg
 9Q4+4CF1mNgXxvFLSLL8bIKEZwHammLYG27hPkIinJQHur2GayGxOy+7g
 MFaPs+EuExaMGZCw+GvLvyB6eFScNK+lM5OBKaQtpVdIHH99EnTNf/kTi
 nbXWd5Oe4Bjbxwe7YzA7gQstIYWNMZLdmULQ/QSLi8FmupjHK0GD99KC7 w==;
X-CSE-ConnectionGUID: 7HMzfaJ1QR+4/qXn0hxZ/w==
X-CSE-MsgGUID: /RqiatVXRmCD8lWh4grRbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101313294"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101313294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:58:23 -0700
X-CSE-ConnectionGUID: bUpQEppXTweUy5zmVMgpjQ==
X-CSE-MsgGUID: VdqChnmaSMC1uvn2IYKsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272543963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:58:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:58:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:58:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1St7v/3C2blXzrhO/r36r2XwrdVCizTcd/MUlwcRUoKlpnfjSt1RhYANu/eeiCRbmEr40RY4lJZLJPPQJxC89Qcx9He7nJ5801kZC4kzB4Cv4qvO03mSRQgPCx1FOaH0fhD125iQmxNAQxDksTnNK6YaeeM0oJe9JA6sbdThyx3N6eFgKWFM2fvVm3iVnkPG82hV8u+ovFT3DdZg617AruVsRY/OQGN4/MiUrnu7bgmxQZ4xGSzd2/roJQrS3CaL+nKk0dmCUlgnmgd/t6MXvKdQRM9G23uIqov1AeOSDz3o689un3l6S7exZToTqTjWlwqUt28ObbyOsKUGxWYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frj5zY4OAHXbgX+BLeY8OxNVvyicr9m7SVZFGKYAl1g=;
 b=P2FDkXoui7cEGTY+JuI6RijW4UQ/Z7eUKzIVvDPeSwn6VlGaJrbexOclLq3JmMXmWvZl8sjx4pITuzGAikEoxp6UghaMlsHPxhcbcCjEoUfVQqMmNyppzMgAFxcMqo48bfOfX/f+I2etUCKBUvZ2A/iS8MMkTY5FMkwJ1SY6ISKZiVGiuG9MabzouVCmM8Ca8qPB43HGgpjr59T1XgTtGD8rcjUPg7CL1Hc2zFMLF52FMG9BZtcIWXhqKWVbe0QG3reL7HLRVoeY4NOZTE8QhwRY79W78XBQYQtIeFx2QiZf2zb8tgekqDNvevy1iKo/noQdErLWlw9bvIPlPmkXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by DS4PR11MB872716.namprd11.prod.outlook.com (2603:10b6:8:509::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:58:21 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:58:21 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 2/8] drm/i915/alpm: log DPCD access errors
Thread-Topic: [PATCH 2/8] drm/i915/alpm: log DPCD access errors
Thread-Index: AQHdSYtTdJAFVVMTk0GZ/NHykMkOALbaTenA
Date: Tue, 22 Sep 2026 08:58:21 +0000
Message-ID: <MW4PR11MB6887A28285A8EE43E760FFD3E3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-3-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|DS4PR11MB872716:EE_
x-ms-office365-filtering-correlation-id: 8cb06ad6-2a7e-4ca5-c9a9-08df1887a71d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eW/Wq4g9vMmZ4X1pW7IWn6a6L7fUMwhB/H9i56TV+KUEd/FYDWqchuQxHViaRIySrjHq/TkYopYe3svze7OTM3f5X9kJ+OWG/FJnBJiFv/Rdo5PiKrTl1LnrV9l8shQsvl5imbkNQ/yi1xPE9ssKGvRK2NWMYjkb2RsoNhS6byX6YyDX8en2yrlr3hxYuhMTYd0hCHnk1KC8rPJpC3wrIVX7rMwvaE/xDH37hja6e7yIanc1w0H3gkN2gF2Qm8jkOSkNTSaaAXYKdDSXvnK5HoN7yTJ8T7wGVwA1Lm3hpPdT8V/XMzE3KKcT0cum/qlNv6YLrR9F8kzXHKqjSKcD8FtW6dlchqLH7VwW9yGp9DbJU4SmXbDd+s9hQ52l5nBOlrXyMKCXxZKTAAc6HRWe/tkt/oE9PqTyztMBAI+e06NdZZpiNmHpDUQw9IiUgbK2esgKWcDQZ9OzosXmBMgDIkPpBiEqeka2xXwoUP6NL8Xc4kTpNwFm6lNynwFzuceopJETir0p7HGcAhZifg51ymhnXC9EHLDWCIr/BMRsgu3PpCTOf+YdXBN0kMfgzGelSzXKRF7azcAT0yVvCuvHW7FdNjobeybRqR+n61b4CjPg1OlJFso7LF6zefLoje5RtxGcL6qS90i1xM5EDcMbi0OrvBObNYd8HjffTc6pzrxHL6ueZABRKcDMvssUKD07ayiJERgTXooN1V/LNnak9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iPTzYYAYnaSjPsuONCbV2fg40UN1M3861RFGTaq1r4TnBqeCCTa9s4AcBnTU?=
 =?us-ascii?Q?IrQfaaX0UkT0h6DeTm6fM+iN8N6Vm+f9dp65vrDhSin+AfygNlkQAMtltZS9?=
 =?us-ascii?Q?avPg8b8ucmHiEOAzobrk3O99YZt8hJq22WxGYxTiiC5P+ZvCoqedwtBgMqvt?=
 =?us-ascii?Q?fOTlPVI8z+vHC5ii9j0ahZGV9CrQbIEnuKfARH5aNDsaOXHxqKhh/Y10w1DK?=
 =?us-ascii?Q?kFzuZnf5RlECbYvv9vSmHHJsnUMABupOI0RYDR0aQPaq5ANJiJlgRXgYsxhx?=
 =?us-ascii?Q?IKi6pvxSZCKTAknPgigP8dY5IkUZzDcUThLe9ME+sWiJ7sX/ZmMrHVWJtjX6?=
 =?us-ascii?Q?1uqfXcvwwYj2z2cjwnxoXEHI7METRDhCiJ9veCW2B2eez0v+EWbTe7T7cxV/?=
 =?us-ascii?Q?+hHH+pTiDyvAiafXuQtHXJTYdWLy0fedGXfun4w8IBrv2vqogvHbQj+3N3Zq?=
 =?us-ascii?Q?59YTHiDT9ULHa4NuwL5FSPKoMmiAt4km3ZuP1N+v9BYZ4ok2l8YPjQ3PURJw?=
 =?us-ascii?Q?NhTecnoaoOqXH52dmK2FBQ1lpRqFzZ5Z/JkkNNzssOGnDjyc8+DKueS/csqS?=
 =?us-ascii?Q?ce9rihgXVG+36q3Zhk09ydM6Tgo0HshBrg36HTFpm88C7hIrR45uG63PwAIi?=
 =?us-ascii?Q?Cud+aD4hLNxg/txrUpw8x6dg3RU84YzmPtoqeOnuzbKSM+FXJ/CoP3voTCao?=
 =?us-ascii?Q?W26g7D6sFEQ6PNpuiJs2uINQKihbpaou3nM/8x5Q2ptcGZFgo3wk1DObRjan?=
 =?us-ascii?Q?j6km8QWoj3xEcAe4qpyFF0WAQn9Amp67LBZHh2rg5yx/iuL7/JKb9FKFdvAK?=
 =?us-ascii?Q?cRabqG/Nv1UiP3f+Oh3Dd72MLP9W+JAo5USJEsRAQMWkOpNJnIq3ADi0RKwn?=
 =?us-ascii?Q?QcKfcNXS7FYiC8Z3iTxjlwsfI5MrUBpkWrgTs5b8X7gN89Uw1n81SB0P9eDJ?=
 =?us-ascii?Q?L/n6cAgI05NMwANF0El6cmV5yzcF192abdCTZhQcTikpf/0d19pGYQPGO8k+?=
 =?us-ascii?Q?o47umRF6zRxtc5+mHvQ4dY43RtLpv8vXNtEd1KpWe0h2lUCDING62ByskAl4?=
 =?us-ascii?Q?5PQFjaobMogWMOVOAP5Ag7s1O6pEjtyJoi/2Bs7Eh3vMWbeZR0eNS6BMPauo?=
 =?us-ascii?Q?cGVK51GZAy0BYecXVF5LKVjMEdouUO1Jooqlf3KOEltmt5sPhq8O2Fp4c7Rm?=
 =?us-ascii?Q?LLxATsJixdSe+zkSd+Iw82iiYHwTtwV7n6433lX2aeR3KO2uLTm3NTlfUBrj?=
 =?us-ascii?Q?Dbs1C7PuK8LLviWLm+gW2PXr/1Ti/7WJHe7hob8UO4X4PvbOsRcFMat2ONgi?=
 =?us-ascii?Q?vQxg1EBdYkGvGcKmBxtUSK/o3ahPIob05cU9/U63acYpWi+sd94JUui0XMO6?=
 =?us-ascii?Q?V2iNC1o/DnXhRvVWd54CrQxBUC/5MQnlrmkeIhkMjrHqgrqXl5hK0GaTtpD2?=
 =?us-ascii?Q?VDakHGD4IIfrIzC5caW9NoHT3vGQ0h34mfL7BLMwV6v4iylhI/PPniePPnk3?=
 =?us-ascii?Q?V0bVqqUVG4haADzlCgphUDaDTeur41g2ilFQ1SdkR6TY7sWbo1DPGcBQO8HV?=
 =?us-ascii?Q?Fl9N0PTBt69Fn23ZSwoE9IjS2YXNebJQQwoE/mqFBo/UdVgVqmhJ2ExvggLT?=
 =?us-ascii?Q?lzscRM3dvi8KntNoT/ZBEOQAM8fWozhqmK4TtiTIz5gKoBzCZ9LZSwFrF93Z?=
 =?us-ascii?Q?Zh03Z5LCN5SlpA4Zuc4MLAFvZWUdc+pl/n6NBWFwVuQ0SpVr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qMmT4X0e8EVPUOj56s/9fq4fxJhfKXlUs00cD91fbgCsUUEE08uDTkXSLjKvY/Vr5uwM7VjX9Ax+GBw27R2iCefOEvPH6ZqsACv07vNxsdYqoZx0MJjEteQDTxnPDNSuwKwILahbeH6zdJu9vffOt7+vnJLvIEWFDSZBWH4SJLN4fxk4TE490P9sT48vCvQyPrh2xoeDGtnknsRpjPDS0JB36Vv6FDddFVm+tZm431DZrliVXOph/2LtglSq5bBGPZtmri8zryIolHYeWFStJnpU/1jf+Zy4209EedFP3VMY2P4PNUaffw5rZsXlSqI3ZPZb/PP93M6cCERTgmkxgQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb06ad6-2a7e-4ca5-c9a9-08df1887a71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:58:21.2881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhe3EzbCoEXBnQ2PBHrXYhnvjKPqubhIH6QEWWgNv3/QbUZS4AitAPC6BudJ1EH/PdcmoFjZMvie5w0f3hthAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB872716
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 2/8] drm/i915/alpm: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 9ef9d0e45258..f54b29e193ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -756,7 +756,7 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS,
> &val);
>  	if (ret < 0) {
> -		drm_err(display->drm, "Error reading ALPM status\n");
> +		drm_err(display->drm, "Error reading ALPM status (%pe)\n",
> +ERR_PTR(ret));
>  		return true;
>  	}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> --
> 2.34.1

