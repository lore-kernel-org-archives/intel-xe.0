Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A05CCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D5F10E34F;
	Thu, 15 Oct 2026 19:23:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2BD10E34F;
 Thu, 15 Oct 2026 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792092199; x=1823628199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=etFBJEkA3ORwCriyDqaKpjp5QcIKHAoxGqyTGMLu4uk=;
 b=nRxbb33gPyf/2YoABZ/+TA2oQrFGuTyK1H0LIN0jGLupP9tyzYEC/hfL
 ft+jLXeQKztxoC934rpHqWNq3DcDwRHQvsshlCcUtpVS+5715Mqcs4b/9
 7cyjs74VDxkD3nizKfEfgRF2rsTbQzZgv5zXxevXqvDv/Kmx4tY3xtDA5
 6nbcCJq6eNcEDPvnHD+XAKGz6faAxRI575AVHpzrXFdOLUBDVrghXF5mD
 11pEVlILVSGlriFrojGu9icE0wN1PC6r7MfQcFMg23OAZc6TAcQnnbQ5h
 5sauhuTorIJXo2DW+pK423f4vEMDwMlARXj/9d3MOrzhzO5A997/0lm5D g==;
X-CSE-ConnectionGUID: re+CyMrERVW3w2PMSevO8g==
X-CSE-MsgGUID: YZk9kxo6Sh+ApSf63ZZ4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="766606"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="766606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:23:18 -0700
X-CSE-ConnectionGUID: pW57V2liR0CPqDDsEcabIg==
X-CSE-MsgGUID: tHHLmysiTT6lAW3QKdraqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1746193"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:23:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 12:23:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 12:23:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 12:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzA6366mPnYa++rBrDrSDTtTVGmcKOisK8DKwF4kpol6ObBIFwff3KHMkfgzUm6CBWygkIkVDN4GBB4OiNfXHQSa5POPdzCTrZYT1uLCpzvB9XxP/N1rWLkDyzZ5WGuhhkAQjoNo9hCjEjHHyUO7i/cwyV23wJ0Ujr979929v/UehEvWvjTZy/gcNJm32B78/4gyFvlDxk8gYryqy6h/HUrFHyQ0TsUugxFxTOoAWtr6Hz6wsLPMJ0+RCdavVKX666wG5E8vJ3ESXIJ7OamklW5EolniwrzVsTEB9yqguIKmZEIPEnxN4wrtqNd1wXoBoE/BWiy9pBtN3sHbEEKb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGdku2kk9PKuKAWMklI7kM97lW9dZhQ/8UCWISyHSs0=;
 b=S/4CWbGYhOY6WdYLKe/v3H3Oim5BdNjtwRn0V9BWAG/QoLfvqnc8ll7bQzKWyGr+wvrHGXPt72DpeNVFL4cjDCZzote0C8kM1/QTcXmL3fy/gad4BSTf5RTU2WkPzzuaLkeb0mvXSaBV9OdR8JaCdzO9zUxeahQTyYECCN232shb6i2tSJdXhXHRlsZ7Vl5UZOkR8ImNFzLKbaTsnxRiLJmZikw38CbXuWkhBVJOu3KlEWVHGxl5nwgZ83v7wobyZJIHt77eUX4h7coSTSBkX03BpiH/gN9RPnvfXaRrfoz+i/puwnjhAtFbFUL+Rv3TxyskAAkDKW6bELcSaWCafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by SAWPR11MB9759.namprd11.prod.outlook.com (2603:10b6:806:4c9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 19:23:15 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 19:23:15 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 05/10] drm/i915/display: Add bits for link_n_extended
 for DISPLAY >= 14
Thread-Topic: [PATCH v4 05/10] drm/i915/display: Add bits for link_n_extended
 for DISPLAY >= 14
Thread-Index: AQHdRmKHLTC2WVMpHEuKm7EZ6OqC9Lb/KAhA
Date: Thu, 15 Oct 2026 19:23:15 +0000
Message-ID: <BYAPR11MB3783EA62214A0C906076BCD3B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-6-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|SAWPR11MB9759:EE_
x-ms-office365-filtering-correlation-id: 0b14fc06-70fa-4807-1b3c-08df2af1c2c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: oiFXvH2RfQpevZyFcVf3UClRAvBQ7a1bIu3VC8R5gQqBXbgMI0YCXXPkWVvQUHJVsesw/ACvFkwgnBRN7z+9zrC6miO4I+hL4TuHPcjNQ4/vx9XqM1+oRwb7AMTk3h+8icMaRLZcnbFsnzni5iYySnhalcmxeuTcIFSyp22LYyGhJLvBCL8yexrBQicS4GKxLUq0y1xeboCQL/KXGLp5MTw2PzUumm8NlshV5GWvjzsr3M0+kRzF3kEwEUgsDv3pAYoqoiqAMue+4yGxg0T999OsBGETecrV8tFCbcdklN6iWLymYPWNepQ05tJynkIHQBUJdN8GkNeBKJtFqpSdqwgHWyL3ocyEFYR2vwFhkWOCAoELXH4M5Dq1VKUTYef1EZSgeOGgpIffxfW1oU1/jzdG5jF9t35Mo4o56d/R4M8SSO67gBzaQ7HqgSfojgoO2U62hIHW/oRbKK9vH19gykxW7rzDH/t+6bI8s1Q/K0Ld0bG4IGKSZP6JRCylnyI+ZvsiV4tNAH3DuUsJbTUkuZvxMPRGuoDr8ZimGUa4pNit08wC3dQ3+nYLTuf5TX5xzC7Y88fIofa2gVBtfxTn8uY2i1HEK0uO6hPcmFkiCsOmCV7qTAUhARj0OKb9BWgj4INdVotecZ62w0Prxt/AJkL7yuSqnXv4cPuYly2YMLb16y+fzGR1nYl4C5Y9uXnsS7XqkXpuP08grpr33m1Ie38Pf3i/HiT8QmhXGGJwIUw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SGqoyxcXUvk1C9w7mmS9A98aGkcoqkKdeukLN6/0M0XIr2qIl/TntLASNgzU?=
 =?us-ascii?Q?WXtzv/US0JZsTjYg1k3PHthdh4GcpUZUF+YoIyUjzRj39PYZXwG3NrCKdQHB?=
 =?us-ascii?Q?9brPSV1B+fInWpWRuHm4PIiiMxDlnDPQp77c+l4y9DTjQ91WmRXEoFkPrA8F?=
 =?us-ascii?Q?kFpR/oIGVc1vxBxUwlcPSUjdf46DQDnJSrUSVKdjPsJQ4O6SFeQqEsH0EYtp?=
 =?us-ascii?Q?HgEYQu1fgi/k0Bbo/CKCwdsmxYkQpZLwjZQ+iVGgAYkoG8oareSAUsbTjOoE?=
 =?us-ascii?Q?bj9UBJ/pb7c1tdi0quoTppJj4cP8eAtjxvgvCz0HxK8VutsMFdFGICGD99D3?=
 =?us-ascii?Q?OQPUbuB9QX/7o06qqhHFQXCiTKKHWWWcOh+GQ3Hp1O4WsMKd06PCtgyltge8?=
 =?us-ascii?Q?cVDe0UxsCyPtVN6c92+ZsRLoTqajXz/2Ya2x/3iiNUxNsq7wpHvVHPOP8lqc?=
 =?us-ascii?Q?Z4mEoytDtKkNqzBUqeV4i/2wDZ6aJASoJRTQIdPFNPmCeQheHYEgFTkvs92W?=
 =?us-ascii?Q?YyIEjslayCm71zIyHPqfZFUv83H2SN2o+aWf3NSh+L/fj3BKls+yjivLC0an?=
 =?us-ascii?Q?/mzCDxIwULQZWaqfiPjvXd66nQfCUM78RlSAvoeoemESKCBpcDRerXEviPrs?=
 =?us-ascii?Q?HwbhmLpDqj+MtLFQ/MiScRuXWgdaXOD6uKhEN8kBaKnLG60XgQ2Y3cgpcYte?=
 =?us-ascii?Q?E6sCJIZCeo+QMerHjLQKS3+mRKOyjAhm6ZJ0/gLzbjI0OlPRtDhduMiDld+p?=
 =?us-ascii?Q?kjGSvI/mtb8iRZc5//qH9GmwP+9vJYQfcYxxVFVlPZxbwxIT4RLsDs4ebAGk?=
 =?us-ascii?Q?gawtWWxi2Lt0TK+yz/R59hZOM22hyKCc2b4HTCI3FZPxBtqBov2x/3e6t15+?=
 =?us-ascii?Q?XaW2eEtqp8Hm64Kc666oQm8YzC49R8k1fFu2HrFA6iTkLgcEPWjUXyOY27vs?=
 =?us-ascii?Q?8MdflYVOfZ3lGYsjC/Ji1FA2BxdjhSGYIxaPC0baJeCdYNm6NfaT2bqm+D69?=
 =?us-ascii?Q?U+/7+cVsc5IMmKBWaX54JEoyLiMiwJmdJQpN53XNZ2saAFQ+WuFZCQCogBF6?=
 =?us-ascii?Q?RntMHuD8iu8BY3rgzjV0pP68pR6aL0dDuSpQ5tr43XAxzy22ci1le0aCNbbs?=
 =?us-ascii?Q?bLIu5YEuPkg+4Wsd1POn6OUON9U/c98Bdo/U7/eHsqWI3CCMNB0KuMUXTy7I?=
 =?us-ascii?Q?KeN2mJPgL8JgEO4aWdD6gSAYMS8N8dbAtcfG3QO8pjEu+ocW2OorCG83Zt1w?=
 =?us-ascii?Q?LAc/r2GmgwifQ+3oVm3/WR1av6RUmolJ/l2Rf2HKryfpU1A2NeHga83tIFT6?=
 =?us-ascii?Q?34v1Ti4XtI0P2yxqKzYwA16Btn9mC3Qq8ZkeOc0B7vTNoQWEayIVDcQcEZyD?=
 =?us-ascii?Q?tADyjy7FWLM8c0Ltpa9b6bIkIAadwVVKk7PH5R8sm4IHdSbSjMHsl8CH1kpp?=
 =?us-ascii?Q?7NGpNPJBoO1qP43nOLBndLxesdAcww8Q4Rw0YjuNS5HsUBC5Rx9f59wQbLQe?=
 =?us-ascii?Q?V2yQ9ZSJeaiA/c3rkZBiBV6025jkNUP8Kl0bI9s06tFF7s/v3VLDMlpdSFtu?=
 =?us-ascii?Q?E0IAmQVyN+K2yNqr7pFHyUUD/KDgsB+89mVuTmLY3YJzlTWkW7DdrbOyFSuq?=
 =?us-ascii?Q?CS2PkRTHWCbp1Dl/DrIcZXwunrhhszmgo40BJBevgP8pIsUAr7MD8QyDZ1/o?=
 =?us-ascii?Q?GmtafrVS08OwK7adJM8kco5k+GAgMboSotVmKu+IATBAFD9E0f+ARQ4QbbAK?=
 =?us-ascii?Q?Te4vWqP57yUsneDbXOcEfyawmEZ++LJVilM9AD4WQQTR0TrJlw8893rReySV?=
x-ms-exchange-antispam-messagedata-1: LTu2z/JVXkdK835TLoDaBnKqVHOZTdP+FCY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ioaDpduChgb2ZfWDDTRp+Lwx92S5WvgT0mLxr+wEhfOHRywGedORWEIfCPXf/Bu4GvLJRPVZGQgWfDqVATVYamT0mIkkSvWydPk4LXGqHMz9JZpT2YQYq7qx1JxIFeb0DpAFBIdYIEcCh4pyoJ46tDyHdxScl+vysL+r3amXh4tnwShWoFAuPsktWDEMzEgpheclgwz8+BzjVqSsaqhuyxw9RIxrEWIbOO7hJeaVbAUi3n3oT/jUbXZOJnJb3GiydQlOiu/bTjasY/NTB+K3V7qF0Ezs7nZnnaUMHVPjQZe1UgLJ7BhQlV+ZY7rOe6eiutE0A8tE0XFNHrPVyvVEWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b14fc06-70fa-4807-1b3c-08df2af1c2c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 19:23:15.2495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccrVRVuBQEh6V3bWLDJw2uwigSMvFVjT0l+qY7LNMZXw7GrwPy+ELYTCeZfFmZQ2vjBDtQwiGEFmXCRRkIWBgjC/Ds0ttB1vAdoRnHtU9gnmSO1iRwdphq893zh+Bcmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9759
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
> Subject: [PATCH v4 05/10] drm/i915/display: Add bits for link_n_extended =
for
> DISPLAY >=3D 14
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> LINK_N register has bits 31:24 for extended link N value used for
> HDMI2.1 and for an alternate mode of operation of DP TG DDA.
>=20
> Add support for these extra bits.
>=20
> For displays with version 14 or higher, PIPE_LINK_N1_EXTENDED_MASK (bits
> 31:24) is used to handle the extended link N bits. For older platforms,
> DATA_LINK_M_N_MASK (bits 23:0) is used to handle the standard link N bits=
.
> This distinction ensures clarity and maintains the semantics for platform=
s that
> support the extended bits. In subsequent changes the logic is updated to
> conditionally apply the extended link N bits.
>=20
> v2: Drop extra link_n_ext member. (Jani)
> v3: Avoid link_n_ext in set_m_n helper. (Jani)
> v4: Rebase, and update commit message.
> v5: Drop a stale changelog entry, the DISPLAY_VER split here is
>     intentional. (Sashiko)
>=20
> Bspec:50488
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c   | 18 ++++++++++++++++--
>  .../gpu/drm/i915/display/intel_display_regs.h  |  2 ++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index c53163d7c082..6d2025e10995 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2711,14 +2711,22 @@ void intel_set_m_n(struct intel_display *display,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
>  		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)  {
> +	u32 link_n =3D m_n->link_n;
> +
>  	intel_de_write(display, data_m_reg, TU_SIZE(m_n->tu) | m_n-
> >data_m);
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
> +
> +	if (DISPLAY_VER(display) >=3D 14)
> +		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> +	else
> +		link_n &=3D DATA_LINK_M_N_MASK;
> +
>  	/*
>  	 * On BDW+ writing LINK_N arms the double buffered update
>  	 * of all the M/N registers, so it must be written last.
>  	 */
> -	intel_de_write(display, link_n_reg, m_n->link_n);
> +	intel_de_write(display, link_n_reg, link_n);
>  }
>=20
>  bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display, @@ -
> 3475,7 +3483,13 @@ void intel_get_m_n(struct intel_display *display,
>  		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)  {
>  	m_n->link_m =3D intel_de_read(display, link_m_reg) &
> DATA_LINK_M_N_MASK;
> -	m_n->link_n =3D intel_de_read(display, link_n_reg) &
> DATA_LINK_M_N_MASK;
> +	m_n->link_n =3D intel_de_read(display, link_n_reg);
> +
> +	if (DISPLAY_VER(display) >=3D 14)
> +		m_n->link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> +	else
> +		m_n->link_n &=3D DATA_LINK_M_N_MASK;
> +
>  	m_n->data_m =3D intel_de_read(display, data_m_reg) &
> DATA_LINK_M_N_MASK;
>  	m_n->data_n =3D intel_de_read(display, data_n_reg) &
> DATA_LINK_M_N_MASK;
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> data_m_reg)) + 1; diff --git
> a/drivers/gpu/drm/i915/display/intel_display_regs.h
> b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 8251ec15190b..57f388c958b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1190,6 +1190,8 @@
>=20
>  #define _PIPEA_LINK_N1		0x60044
>  #define _PIPEB_LINK_N1		0x61044
> +#define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
> +#define  PIPE_LINK_N1_EXTENDED(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> _PIPEA_LINK_N1)
>=20
>  #define _PIPEA_LINK_M2		0x60048
> --
> 2.34.1

