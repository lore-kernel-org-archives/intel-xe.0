Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E8C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 10:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957B510E5D6;
	Thu, 10 Sep 2026 10:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdHFF3ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3B810E5D6;
 Thu, 10 Sep 2026 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789036906; x=1820572906;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kEqDbsERJuHS7/Fd7Y0KNfEB4DLYo/5mAibw7ojejjU=;
 b=IdHFF3udNgwDvZiUIbwGDecoeSjVIR16Z7RleBGIS22LN+oIXM1ir7MO
 eHfQ210DjPre1kBhYBT3AU++/MehnrtlBqcKzG8isdAELWs2TFqGBcPny
 Qj8xdywY1iji6nS9TCK/+S1069Nvjdk+pmPMhEc1JF1LfMLPGSCzNHQuB
 vZPhsUB2bXQsKAjdFq4d0KIjomNh85YpIKrLvLT1SdCq5JSxaGfBVSgKP
 uwxUl9e98dJddHBDjvjvE9A4gruqx5hR2OxQ4HtMwxflY+LJRYUZdXRBn
 M21r6OUzAiGhvD9KlNqRfD3/wxrSDhatzWDRgNqGEP0QetRWGrF/QXkmR A==;
X-CSE-ConnectionGUID: CeF4u1l6SA2V9qqxCB67LQ==
X-CSE-MsgGUID: LhroNP+cST6ZFXlfLxVSig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100075178"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100075178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:41:44 -0700
X-CSE-ConnectionGUID: jxVsO8skTOaptDxrplRaUA==
X-CSE-MsgGUID: kjpRHg8yTG6EQfZUJMNlSA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:41:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:41:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 03:41:43 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCVd43/W0TL2plsP6b5hPtDqT2Rvgf+aXiTFpMAoXO/vQ2vKBoCUbqcvPm/bW0UIBmDpDCTfounxfV0+PtxuAD6erZA1mrxFo36UJ13BLrtjNfYxI9dS5fAhPBueLi5isYgLzr2RCB3F6dQ5UQCqNaiXXocSMwqJzxLWpj2o3ifExjZSfWgVpyS++849FKCR36C8rTuJjNaJQK0Qn5N8d/dJOqiIGDBWCmDzMP7gGk7Pf+gj2+DVjkse8w6crPQqb80t4AmSBnxFat6+nJv4LhjvWfOvJUZSsduAc23JBVozc2qhfkWgo3tISmA3boE26KZTJfPLtTj4LOZ/y7x66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+o+eCSavundub0otuPGAVP66eYLGd3i+Gn0/yJ47fk=;
 b=CGAyAcJf6ZuOoJ6eKiuWLMeFtGK/HBTda3q6kvLVRxXGkBwngA20zy/6uX/QGFVYUBmjm/0+jyH/2dgbXQ5RDoQQvfQFGSGuC7JdK4MxijMsIECc4Gzvb+cm3Ec0qksj6T9sFLynLFj10TAr+UczNcfMTTgMvTR9UrvtHjOzFmeOoG3JP9TCd9MCyV1rwLHKOsUecgyzWQNEJpIKz5Q2ifvnXTilLWiDHJHccENceTZVOWyrRLuODZTIiQqYYkEhNGG7iih8bkfWxl/VnH6JgtSCB6QkPidmDfolq2pseucVTvWB4AG7IgSzFwWscgEO8nR97jgBxrZ3SNJbB+RWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Thu, 10 Sep 2026 10:41:28 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:41:28 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dibin
 Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [v5 0/4] drm/i915/display: Enable AS SDP Skip Frames
Thread-Topic: [v5 0/4] drm/i915/display: Enable AS SDP Skip Frames
Thread-Index: AQHdQC+VCBgaDMwdwkuHjpcsVYZxErbHoVFQ
Date: Thu, 10 Sep 2026 10:41:27 +0000
Message-ID: <DM4PR11MB6360F24A8F05AED70609A4B5F4BF2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260909080810.2202879-1-uma.shankar@intel.com>
In-Reply-To: <20260909080810.2202879-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: 14c1a849-ffdd-4375-f811-08df0f2811a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: E0xWxvXg3kiswIaJohcXlG2iW+QXeMCfpDrjFaSelyWHzDiSKy5v07G7UPz3zz0pItwyhbrgfPqN6VydoYFgUfB4nbADinj6jzpPiDKtc4Bwll0fC4Y3/gj3Fe02txI1Jy5XJOI7lLJQo5+5fovivZSyOsUhEUHy797DPFrRLcmBbFM+ZSVWF2lOBEjCUUBzGa7HYNLeaW4EpE4NwxrKZbIruODeCnVn8qJ45f5crOmsTEFJX1/rVoveqCUxgsNFnIHFYl8joW/YKRs2r3MONpuMjnB6OWXAfk0ywq5ylhOX4Qs6+2dhNU1E7+kzRa2M5MZ0nMN0MlXyHd5dwULLnGBPiH2OHcFc4C+YmRe5Pi2gXG0m+kODFPbv40QUnDk352XLO4NVtjiQV0pHtiIRnhjEnGYlMpwqBIll1x4rGhX85NFKuBSd/NlRucfs91ztnMlGft8RCotD6Lj1GzlTAm5IXnyL9OviwndXzgY6Sw5vOrvyusOmT9z5WqrQ7o++JmH9g9MRWJXNpJ5b22h9zEJYBg+7uE6cuYb7WI7el1fTtjuRsJETGj8xW6l10AiI+0s2cyFLs5v4oumZL8tIyuaOoACrWsGBqBvWVNuSNMjRdc/StxWNvFGKK8ypZthS4+J1pAceeC5QufGNWrZbyqRBnvHl4d41zMaN8yveeut6qb8kAAvM8oDHfqiArOe3og2zDMFUA2BtsBOqjqkreh9UP9Ou2HaoAAyqfXZ8LM8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6oDgQf5UQlKU4zlK/dc5clhkgzhftLpW5leZ+KpsZn4hasLmVX5H9ZqhGuPC?=
 =?us-ascii?Q?tG2J5uBvHuRx3i86Xv0AgRNKkew+wrIvbO0a9ThgR/gWEdr+ZgCvrvByQSTe?=
 =?us-ascii?Q?GMHRLvNdb0PcXi3ukqSZ5KB69dDdEMyZsa/0PvJLh3AIvSpWSW8TnPse6QsX?=
 =?us-ascii?Q?BxXrGfObHa4VT2/DzI6yMq673eZkIRuGmTHv9P3oq6uhhvd92h6jvEHbUETg?=
 =?us-ascii?Q?HtRjp7SS+J4EPB9ynpIUEmMpggaebFQ5ICM/ya+GV7YDe3XC9Gk0x2sEZQwI?=
 =?us-ascii?Q?+/bQ9Nev6vNp1FBlqG3mT9jFyEZrukR3x5/b8dYT4pxZp3UT3fUPZj10e06g?=
 =?us-ascii?Q?4tStEnfrWEVJe0eVXz2g9Myv+izWXbd+maXN3NOGagYhPB1oR6taLA6bg1wi?=
 =?us-ascii?Q?elgLOV/FQHM3aNi9k3a2gtrBqNO7U7Ty5BjtqJgew7I/zt7BqAqVw9DcqgGc?=
 =?us-ascii?Q?h3J/y57blT7clJYs7VymhosFhMJS3ah92F/9ww8JLD2qZdRcS/mOpzgi5BgT?=
 =?us-ascii?Q?eWMgdfndpvsKWEgo3iXu7bxARvLNEPKzvrxG0Rwlj639D9L4TbqZtTR1UAhZ?=
 =?us-ascii?Q?PlkulcT+8GZFtpdO+Z+EDwGH7BqP5jui5ocrhNS7rGoahHi3a2F4hNK16Vzn?=
 =?us-ascii?Q?nkGfk7ytQyOKYHsb+0SKHCpcfzSvrdTESPCpO2iKmGpOWjxT6NpnwCaTw+Yg?=
 =?us-ascii?Q?lmFQVHsqLDZiawmA8wGNRIJ+Gb/wo4NruBq4XKMAFtdAU+7qrAzynyfYIKRa?=
 =?us-ascii?Q?BgHUv4QiTGDFKlJXx57P/CwgDs2Axe9IGZioefBHW5adlo2grTomvAsKxDVL?=
 =?us-ascii?Q?5bvsCCRFBBNNDhYY2dTZOR0wfR10G3GeF2Cze7kGjmcaZ+PTRrD5+HLgaQqm?=
 =?us-ascii?Q?OtMe9k4E70LYArSI6Ngxweaoih3cHHJdfdp7zj5OuYceVlO49fevOzyON6XI?=
 =?us-ascii?Q?xThAJDNpGnE11tk/IVsLRZAwFpXQ5CIWE6q8MgQwghgJbaq3lRXcGAV+ESrI?=
 =?us-ascii?Q?H4zrKPrQSdu5CNAJp8kD+hB51ap6SKyPc0cZhfz1fseue2zEgBmOUCWlEpma?=
 =?us-ascii?Q?cH+smdQbR3XYfq2v8KM/9jo99sX5SoTBHlM8PZEa4zNybarggiXcmLbHCnYU?=
 =?us-ascii?Q?YuvSTUXXzKJ2I5xQkZnaEGMgiU487sZVX9Pvtd0SKQpST7SVkw3H4pyVs7M1?=
 =?us-ascii?Q?ACbID22g9NdBt/J9d8F+uPl1OrXwITLRg+M2PyfZv0+BvwCRNcamJQDMDZSN?=
 =?us-ascii?Q?DjRi85QkTxrGnVTd7MnlSkiNX+GQQXbMEsQ0AhXCkUwYQeE3/rq/dar9GG2V?=
 =?us-ascii?Q?Oer5JtSpzTlFHVKmz1OtPnKtOhreMOw/ITH7xY2MNILReZXvHHN6xiWCURTd?=
 =?us-ascii?Q?qMdDUdRcBENGBwGkvJT0Bq5cqCU+gxhmSXhQtj27GWOjt5ayjKS+2ulgERQ9?=
 =?us-ascii?Q?tqZS/aWiMSY+jnDVC6Esj8KYfWXVr5ppLR7qu7iHcg19xcdjHQyyKz5f5sM2?=
 =?us-ascii?Q?tdEvOj5jhelyCERm/p9EFAsdG+35GZfynG06VBLXBY98T19+gz2sMZKqwSEf?=
 =?us-ascii?Q?UHwJHqLcgNVw1jUFDpohZD1DbZRzw28bi9rOEgNSXxE9MpT0vLY1gg1kEZBf?=
 =?us-ascii?Q?0KdxkMer8/fGdimQvOfr8ZH87WkEamJBu+bmrr7XjBBSnVlkks3gXgbP75PP?=
 =?us-ascii?Q?P78diI1vpkI3Tipy3GYCsBaC+ZnBXxoKPMupocZCnyKQF88XlTPouCco3xRY?=
 =?us-ascii?Q?doJEuH+lOg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fFe08ZoyUABbZVwYp/vdIVUpMpo7dyjL08/aaJp/AZqb1FiiO+ZYobtKernpfyyvXplPAGq1W4XFLpc0oS1k+ek98M8m7AfHGhF6/ctrVBYnLacxx/dgaiHVRv8oyE2D7nk7QkMDe8H/iLp1oEk+53GO5hDoyxrjAZuB7rOWPUpLcGIK7nt6Desr2NgjJ6wiXWOU8VINhw7qJw2PouEXHv8D00aDemo8U0KxHp1tuBqD4qxU2oCPwwJ8l6BQqCVA45pZoGBjNkahAm+M/9aPUBL28AFrdPAFDqrRZDtwZG2ZrJxl49HYPkoHeUr4kgAsHSUh9v1u0rcaalXy+dJv8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c1a849-ffdd-4375-f811-08df0f2811a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 10:41:27.8911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1En3zEJXZVPMOIzhp2v/9M4241iszbHOpcIcDlXmkElHOrfR0jTBaWOIusT8qsZR9buG7I3+IKKG2Q0xaH9+pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Wednesday, September 9, 2026 1:38 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Dibi=
n
> Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: Shankar, Uma <uma.shankar@intel.com>
> Subject: [v5 0/4] drm/i915/display: Enable AS SDP Skip Frames
>=20
> When Panel Replay is active the transcoder timing generator runs at the p=
anel's
> maximum refresh rate, but content is often presented at a lower rate. In =
that case
> the Adaptive-Sync SDP (AS SDP) only needs to reach the panel often enough=
 to
> satisfy its maximum frame time, so transmitting it on every frame is redu=
ndant
> and shows up as repeated SDPs on the link.
>=20
> Xe3LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
> send a single AS SDP and then suppress it for a programmed number of fram=
es.
> Program this counter so that one AS SDP is followed by (max_vrefresh / fl=
ip_rate
> - 1) idle frames, matching the effective content rate and allowing the li=
nk to be
> driven down to as low as 1Hz when the hardware supports it.

Pushed to drm-intel-next. Thanks for the reviews and testing.

Regards,
Uma Shankar

> v5: Drop module param and add debugfs
>=20
> v4:
>  - Fix Sashiko review comments
>=20
> v3:
>  - Add module parameter
>  - Fix Skip count clearing issue (Dibin)
>  - Add DC3Co checks and enabling conditions
>=20
> Uma Shankar (4):
>   drm/i915/display: Enable periodic AS SDP skip frames
>   drm/i915/display: Force disable DC3co when AS SDP skip frames is
>     enabled
>   drm/i915/display: Reprogram AS SDP skip frames on seamless VRR
>     transitions
>   drm/i915/display: Gate periodic AS SDP skip frames behind a debugfs
>     knob
>=20
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 154 ++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_alpm.h     |   3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
>  .../drm/i915/display/intel_display_params.h   |   5 +
>  .../drm/i915/display/intel_display_power.c    |   9 +
>  drivers/gpu/drm/i915/display/intel_psr_regs.h |   2 +
>  6 files changed, 175 insertions(+), 16 deletions(-)
>=20
> --
> 2.50.1

