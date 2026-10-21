Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70D8606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZh9Y2Fn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B21010E362;
	Wed, 21 Oct 2026 17:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D9410FF2F;
 Wed, 21 Oct 2026 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792602129; x=1824138129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hktN+6m9krP/92xz+18CIOemQ/pilPKw1qaKu7TNjcw=;
 b=kZh9Y2FnrGNcpF12n5IdGWcjZiYv5LsN3Ypc0Ey3xGEhY7jIxr+AI30L
 3LN1W/jm7tcV3206o0Wiq0zn0FrbqCEIymKM27zC9+Yb10doXpjo2DrJk
 svx4dOfyn5CTgjuDq8evno3OwTn6vIxYPfTyETmKTxeDb74SvLJqDm4pk
 rzEfAw1yZkVo6C9vEKvjNjWCfusChpvkMIfThjLsAjiQ6eOCHodbHXNgX
 zDuhW1teMm0sF31/s7x+Xssn2spwH09cjQhILHj+YX2Q9hbQ0YPGKoDMN
 UyLjy+I9ibLdDkpiX0GX4FX3WuwSIR5qIsEbyk42b5ylc68NFKhx/xSX+ Q==;
X-CSE-ConnectionGUID: L9dgrHmnRLu+SSXu6nzR5Q==
X-CSE-MsgGUID: CL/9FIuiQti++/F/sxz4CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1431609"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1431609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:02:09 -0700
X-CSE-ConnectionGUID: HqSfs1wvSaegQfEexwIM0g==
X-CSE-MsgGUID: SRwOSuBATLGE8qWQ3i4zHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3083906"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:02:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:02:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 10:02:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:02:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK8JIEkUa5PpiXUgiPhCSYwxOSGGMVXd4m1sdLQOnsDf1cKi8Fyc7NbrUvcnXoSudBsWfPkfxJiCM9gy/tx6xLfrZ50OQgAam0l+Bnq3u6ugK2exoFd35tQxaLaEO5Wu1AZP5RpXkFRJVOqeytQdU8tk0mIWHp0sEUpwXBhSey2gqlQk5q4Rxc88GOEc/bMCar2+K+Epx7IWGe3KD/3oNra2mtkIo+LTdjRGNMwVUr5BSId8YAOc2PXzdaX9t3WGzFiJ7ZOOvRkRw6rac7bIm5bQ1IbSBeTkPHee0qjVT0M0jG7led2GasWxTtVRYDaUVmLynwWpHCkR/ohpYT/KiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nOX9DapN0ATUUUcur/9oEzVidMr0KV3b0RGjJwPtRY=;
 b=bu8raI7c1te8ElZ3rI/RqRRl45GdpvcRqN6vSbh+zJbZ0eyn3hM/p3/Fx0JT18ZoheiJ6f04uOXz8P0A0N5dkbuLzgihux3W3oDWNdZtdNgEPG8/73VGi+OzxNbKpQDlxnYmjDMIWQhbSLSC68HbqRY3P71VE/TPa4JKPu/0QEpT/Igb/yk1/GZpa9o9EWp9ifWMIT3azSkekq2freKcZXhRTpCByhhqCSQsLou+cZntbLlvpnDc0uGdDz8hSdhVkIWT6hlBiivotUaZ6sTQxNGRE262yJmkz9SucpSlfux55Z0N1Rwe3N51kWsLftgAzv9Zw53EY6ub83LnGejplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:02:04 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Wed, 21 Oct 2026
 17:02:04 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Topic: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link
 config
Thread-Index: AQHdYS1LXk8LkYOkCEWncZVHVZAazbcIOJ7Q
Date: Wed, 21 Oct 2026 17:02:03 +0000
Message-ID: <BYAPR11MB3783EFBE4FD869254CC5B7A0B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-6-suraj.kandpal@intel.com>
In-Reply-To: <20261021072438.1164249-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|CY8PR11MB7729:EE_
x-ms-office365-filtering-correlation-id: bcd731ad-8494-403a-7900-08df2f950805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|261021121427099002|3023799007;
x-microsoft-antispam-message-info: Ahel9tNCBk9KqdF3eJ/SVzFcY7ENLR+Imt3UJFrGEUv/KN7UIRosSF3gvTrri7dZguBdZ+phVBiU6nqXu3XeGrf9eci2+OglNC1TaNodgP6I27bYNls+G9tRsZUElsmNou4jB0DF76qY0XS7G5KuYPHWo+nEXlNiM9yBi0RaxD2hpN6F8x7UZZasyYzwzRpdYwV3UnQgT95Pja7ULTBOjm2geRuYIfrQc3EuT5S/8QJttmub1LGalDJEOQm+eFQgIM42sqkyV6EA8VBFVxDv7yCiEU31XVLgACA28EUnYfmuiF0xFwLO3aDzJuGNAbzY8qiMZjB9rGzbreZ/54u75R45k7grLNG9vFAo3Ugdbusvt/CPdbS6Robo3e0gOP590Dn0L/bu1OvYrZg7d1dzsC/so75EU/Rc+/WMQMDlZXm965PHpx5BxDtIv/lX0TzftnBZ1k8F2gtSPabFS/wsj1pR7znpxRFdmJF8K741KWGNLvpBvTk+DGQ2UiqAKVxD/URa2Xk4KKk0OUNqoGkUjwJ7zpkQvmziBWRFiECTKjOID/VYZ2atIdb+uy4VRMf4v31edRgEG3Gl3/myHrFHTJaTw5IjXeDnqSsRg7APw3KNqByaByTtO/ZK2voPeKHQ1hxPSRYPYeEGTAv0ZEyoRJAGtBixo9zHMQbxr8d9eop3wFMcklDZm+MJ1Q+pCjTB/VGmpxHxfu9fDotZuwbgm7oSmo1nU3K0/6eQKBTYqO4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261021121427099002)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lD0Gld5dbbDjZJt1yhJ+H28a4jWvw2D3vhq0icu0DoG3bcUo2K5pOmZ5wyqK?=
 =?us-ascii?Q?esgCuCakdydGUjwiiOJ2DTZqj8YjmBhmFbPfvYLtIej+Q5i4j27k9K+C86rs?=
 =?us-ascii?Q?BEgzwifiSfiFa+oHpoVwn7UfJkhJ7I87LJO7Fn4cfpzugzJ5njzBYGU6+JWX?=
 =?us-ascii?Q?P7VHMzdO0XQaQ3uQ6Q7/48nNNKQNeFqQ02D0hKXJfPknTDujk+QL6LyP6OT6?=
 =?us-ascii?Q?d1P2GSrpVlD45SROHmNcFu3zPv/zMtvjcvULtYwo1qNunHzshBIRbAXawAe8?=
 =?us-ascii?Q?ZO24if97g11wgkbKHvBPTsqkZJLBNcoJiahSBtDr5IRuQ5I8fJ2UZ9kyzAs0?=
 =?us-ascii?Q?aVmFs43DHwcPQTky9WB9aRMO6FRv78WeujpMLjl4nxfrq3pBv2xS7q/LJSjn?=
 =?us-ascii?Q?gWEmO4TMVvq8w9DBW99Tp6Ase8Y6w7RLqqYvck8RfFZnZ1NWvk9wmzvUtZFf?=
 =?us-ascii?Q?shgu5VBGbm30O7dx7D7/LsxkAOYq5QHSYnWBFaUrakuD1wUuUJMGRNSH8WZe?=
 =?us-ascii?Q?U7TrcKpPHw2ah2RkA+98RGRADy43xLSIEOkUVp0R1O3WWpYHDRK/gerKAb1B?=
 =?us-ascii?Q?bJjZT93Gp0RLsKdKwb+q9u4FwFV5gGSIPqAGsTrHtrCPExue/KLl5uJqKMow?=
 =?us-ascii?Q?RoxXgn1DPubMpwQNT013meOEEJZ0XRcRBiymAlVNvRIhZ15US775P/5h/XNS?=
 =?us-ascii?Q?trS+/9jTTxbcyL1szJrYKibqg+aD4xK0Pugl1vmjtTiwjivFhm534v6eW2My?=
 =?us-ascii?Q?erTUGBskqFP4HtAM31WUqDV0U52i6RQtuPY5KChYatqIRw3Z4X2kb7CL0p5Z?=
 =?us-ascii?Q?7Cv/dAj9DGKvf+glIHb335XmtWfXoCPLHR5p24DYrg5iynvkXOppWk0CY6Zr?=
 =?us-ascii?Q?iQQEgl0qTcu//0jyrR5ucbHogcSxavMGKpBUm3ixkuFBx7MIW0NlXszK+9E3?=
 =?us-ascii?Q?USvIPRIum6FLHHRdBmrVxI7EhGpeQ5y2E8gvnvpaG23ml9wGudJ299/aYrVC?=
 =?us-ascii?Q?SrVAXhNS9f3wFCBl6riCd7YOTcGh4B7sGwJx/FkZC4w76MAZvD9eQDa7KTKG?=
 =?us-ascii?Q?JsvoS7p5bswPyDfYTp/6wHxhB24sOXzV936KLmnU5ZW6BHyQoL1DBkvmJimV?=
 =?us-ascii?Q?R2cb9gofEQSenNSOJuQXyJGa3b605CFHg5w47inOJF+0S7IbuMAF4uSizqV9?=
 =?us-ascii?Q?3L46qF7OmpSXccHV+cJ8uG3pN34VLFVUi1SWSMbILFKvKVXQu0alFKLpl/Oo?=
 =?us-ascii?Q?cxth9UVf3TokkjVDiOo7tjsSkNfsYsfJbdgyk76e1Lyn1q+I9Z9uG1VFNs9Z?=
 =?us-ascii?Q?/ghzFiuezJP4r6zy2Xg/EF14prPXJiJdCdT0hDPGwf1ZgExzLAdNxPJ742O3?=
 =?us-ascii?Q?JRMZVdNduAV8+bvCiI5NeSxF8X4wcvqL4XLFhWH+uEOp7mEZIuScemNl2mks?=
 =?us-ascii?Q?AxGn1lXCKcVP8ysd6QlA3sRTsULh0Xaj32maGkdEdnkbB1S72i2ddUzRKIQb?=
 =?us-ascii?Q?tslnfDkyTVTYcSMPb9LHB+r6/jgzagKy5qtmyvQATQSaf7EdOUbaTz/itQSL?=
 =?us-ascii?Q?Xk2VUezpRKbCD294xA8LhZJphIHj78HNLBQKRpWYa63FteZQu6bUiLAwpfnM?=
 =?us-ascii?Q?YNJtpH0DGc8lUp2ew/cbDvZbBKpJZPDdW9s1yJ5wMOR0L86hYFHTVieVFS9p?=
 =?us-ascii?Q?25wmL6vtcgrlo5MgBG2Fx+40G4MOD7mZs5yKHLNKrp2NdBhQ1+x/4Gga9m4v?=
 =?us-ascii?Q?EiwU2gN0+NH7T78SBWkFvXSlN28fFfQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zuSIzYB5UlAVVYggf3OVDYE+PNxOGMN+bdUdbkSyZDZZwht90s1VpWVEou+DBKkEZu8vegcmUj2RRknuB2fEc9bOpsc6l45wxuO9ndB0EfXPNZ82mJir/eegmCKvRSD2YbVk0QKa1s6txnVemWoBbJOvZ5gN0G9mzV8MwsZ3vK8hXbOSIstOZl8eapxZKCI7eAEk7ReFcSHjpP7lnsdRAjyUl7nxkhdRqZAVVtnDlVfvHo95iwb4dI+3q84kWYHOtUO9vwvxqY9PXjdiyTso3yGFIYZiwxft8Ndl3pBouRjpGYt8XC7fmd/6EdiUf0xzfD9yMzdToWSOvo4iL5veFw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd731ad-8494-403a-7900-08df2f950805
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 17:02:04.0527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmIsW0C8wqM0uSL+0E1FsFCMRQ9+ajeQEnLUAFWPXHaqUrxtwpmLsy1lwMVcWgoB2UeJEGmMBxkAeZK8zwwfFq/pwnMg5NoFbx4OpuwVlYXQAyiQqQ5tTa7CB1iTjzAq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 October 2026 12:55
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link co=
nfig
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
> ratio against the maximum allowed value, and log it if the ratio exceeds =
the
> limit.
>=20
> The link config limits computed in the previous commits only restrict the
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
n, the
> result does not depend on the bpp. (Sashiko) -Log instead of warning, sin=
ce
> the link config filter already excludes these configurations and only for=
ced link
> parameters can reach it.
> (Sashiko)
> v4:
> -Move the MSO adjusted pixel clock to the commit adding the prediction, s=
o
> that one is correct on its own. (Mitul) -Reuse intel_dp_link_m_n_ratio()
> instead of open coding the ratio.
> (Mitul)
> -Drop the m_n and link_n checks, neither can be NULL or 0. Make the
> parameters const and move it next to intel_dp_can_support_m_n().
> (Mitul)
> -Drop the check on dp_m2_n2, the dp_m_n one already covers it. (Mitul)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h     |  4 ++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
>  3 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index f3a79ae49b18..8ef6b4c4fc8e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1299,6 +1299,21 @@ intel_dp_can_support_m_n(struct intel_display
> *display,
>  	return m_n_ratio <=3D max_m_n_ratio;
>  }
>=20
> +void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
> +			      const struct intel_link_m_n *m_n) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> +	int m_n_ratio;
> +
> +	m_n_ratio =3D intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
> +
> +	if (m_n_ratio > max_m_n_ratio)
> +		drm_dbg_kms(display->drm,
> +			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
> +			    m_n_ratio, max_m_n_ratio);

Not mandatory, but, since the DIV_ROUND_UP(link_m, link_n) <=3D max check a=
ppears to duplicate intel_dp_can_support_m_n.

Suggested fix:
Factor out a small static bool intel_dp_link_m_n_ratio_ok(display, link_m, =
link_n) and use it from both places.

> +}
> +
>  static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel=
_clock)  {
>  	if (!intel_dp->mso_link_count)
> @@ -3755,6 +3770,8 @@ intel_dp_compute_config(struct intel_atomic_state
> *state,
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
> index aa58833a405b..1e3da678c9b6 100644
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
> +void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
> +			      const struct intel_link_m_n *m_n);
> +
>  #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index f00edfb66a10..8db84975f36b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp
> *intel_dp,
>  		return slots;
>  	}
>=20
> +	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
> +

With consideration of above suggested change,
LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>


>  	if (!dsc)
>  		crtc_state->pipe_bpp =3D fxp_q4_to_int(bpp_x16);
>  	else
> --
> 2.34.1

