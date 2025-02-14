Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6DAC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E6310E366;
	Fri, 14 Feb 2025 22:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXYVqTOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C644F10E097
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571556; x=1771107556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HSKzi2elBxED3XI0N67W6OCFAwaoloYg4LgIhPfhT7w=;
 b=eXYVqTOTuI1+7g5YpzmFSu53E1f8iWtpR+k129vUFzAs/UGhqU++wrKc
 QGjX8HALEIgnDMSsUC5GG9QZSHQkBglyOLqKXlWxIyPYnPSNCR+SfRcO2
 MjvbBMlNo/Yw9uRHD3zu3BqMKq18Q13X/xnwHuT/cPAacPMykKFFy1HPD
 Lcg1bLyQ885tOLNgFnXipm3UvSPFQpf3j2i/PAjdwJ7LhbFqTrAgw0Lz5
 UpIFBj0VJNSLrw8PwUDKjde43A+Ir8aE7nEnTboVdSHFL9LW1RgYw/rjz
 3ny8W1FfBtaJS1tbXlGOK26z+Y8crr7CoUF2jzW2EwpQx/YWDvHWyyADj Q==;
X-CSE-ConnectionGUID: W8W3O5OXSFOEgPzx/YjX9Q==
X-CSE-MsgGUID: HzQRIp4dStWxAMuMVxSPpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51763874"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51763874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:15 -0800
X-CSE-ConnectionGUID: hjIcYd5GTJCTjOpw8gp34w==
X-CSE-MsgGUID: GswyAeUMSAKnrjrLcD3BVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144494510"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 14:19:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:19:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMz03U4ZI1BFlw9O0tDXDGUNpPbNPUVyLqYe/HquNKn3e61jH7uLXzl+dDl6PPpWAuStjX/k5oZAEtUzbVm8f7qRFvSzKB5auSofB+6r4a/D1ApEn2S38JyK92wP63eyGpKjZcGacY7+32fjn3J/k0hofSTvsIiQzrMRgDtU2svTPWHwJhTKPCqG+u8wjm1DqOkn2/aH6E4xzmC5kCbwqPlyLFRFMGrvYjgpu0ZShvVT1H13N+A91UrBPuAWWLMe0H3t/ub24iQ34z55F6v8+9+0x7T6Px6MqbMOw8XJdW2OL+jcslx5tqXSkIDB9B7ZpQSoWPBWWzBm9hINMHhCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zukwtNdUxQWEY5BLUr5hCzj+M7Atw4YhD2nRwXtjuMk=;
 b=eGAFBw0JV+b61fquCM97gxO0njk1Lr/VRS+szyinzHJT/X2an+DdL/1yuGRhytDl1oEvPGwO4qhJSNhD7pKx13+7FBPfNNGeqeD0MPmTuimkb4m+OzrnS4jnLRivaMG2PL3iUg5LGM+XsIezoOt05tmFPOLUN8QJsmoQi0ZwCDfT8m1nqZoKbZZ6fUEyg6GlUxOfOHtozliWASBBt98xLGyiWs/KIvqtaC1+Ta5lVOMccjJGgh9SimdhS71UMcGQrAATVr3zYp3XhcU2X8RFiuo40qv8ib/Ubd5jkc9dwU4SZqfYvtcNdehNyCPmQJtoGnbsp+b1/zAK6O1lnWpt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:19:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:19:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Thread-Topic: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Thread-Index: AQHbfybQKqci1D05b0Gp/N6pDe79C7NHWKqg
Date: Fri, 14 Feb 2025 22:19:10 +0000
Message-ID: <CH0PR11MB5444196378A058BFAC94EDA6E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-6-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-6-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: ec0e25dd-0cf4-40db-7f38-08dd4d459ad5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n15gUfx7P3pQ/Uaup3pKKVp8cwS9vNcICaXmZOS6b+th7R7+/d7K5UF9CmE+?=
 =?us-ascii?Q?xNoOhKqFnNBao+hHN4M7PfTCPXO7wCoh0OTIYMpT4OGCxBLAPhoWmQLuCjo+?=
 =?us-ascii?Q?EaAY3yRwb2krkCNXcQEgc28PU/4/yLfqpaGm8jLwqFQgSdMxHACAQovJL6h7?=
 =?us-ascii?Q?VLy5hJqLDWi1Iyunt4sZE0FYhJhTMKNOrfciCWulLWuhUS6JficsdhY7gJuI?=
 =?us-ascii?Q?T+TgRMB4YFGJ+NWTLHMjd2GlwfOTTFDju9cKSsE4jBSwoOUHw9rsOj5IWFPE?=
 =?us-ascii?Q?Mzjz7Mv4jlH8ndexydQmJ1dVHCmegi2ZvK8eglzavo+K5aBFjUnoMad02AWC?=
 =?us-ascii?Q?bIYSLA9jiCvYCE5BLMk/niCK5pQL3h1bC/+sUsKEGk6mtiezmi8b0TVU09tz?=
 =?us-ascii?Q?ID3W8zsu2DsqE3in3mEAAvj/7xEuko3f/IuNrr8XRmTueiKXzYTUzcciWZUZ?=
 =?us-ascii?Q?0Qui0TsCnf5mhBdYytFHQcVYijVikdKgkV8dyL55XMUL8+KFmM7raQ1iu6Eo?=
 =?us-ascii?Q?oxwDaCAny4K3H9GWakmhDmv4KPPodrUmBy9LcnUX2FwwWi8oywBofnJ8e4EE?=
 =?us-ascii?Q?5fRdFimZAVD4jeKCAACES2iuyTsz5DHCc5LjP8mjgGtvlzPbEWmjHnJWdf6p?=
 =?us-ascii?Q?eHHNZkP0SsrGaNi0rSfao4tQbOH6zo0+EhlYIs6f5W7GK3AcEw5FCVD/XbxM?=
 =?us-ascii?Q?EIrBCYq/Cgm8k4uqz300ACmSayir5Ou1X5JEl7mNoLwPG6PFoZKhPNtIs8Ph?=
 =?us-ascii?Q?oaybkz8BemBUyKcdsIdvLWcQ1NgTbiqIFHnm6b96B29raLyZ2Wlej2C4QwmV?=
 =?us-ascii?Q?SeS53fYeTQTCkubT5cXyqLjidI7Tn5cPP1nL76rOWkzjPAY8XBMdL9h15xlp?=
 =?us-ascii?Q?W9gq5F7zCUoUEGOyVzkNsUmeZIFArN6APmlriUT+JrCN2sqY8vYZJuPtdR3M?=
 =?us-ascii?Q?OZpKyxtHyJIQByYGJzb6Vp2nSydW8zZUe3YggnyEhgY06tSp+WMAHIaAnNNt?=
 =?us-ascii?Q?m2EI+JP+UawXxXVe514cExKMEARw7rsag5+xnYQiJbYQO2OF7qaknBdaYl1d?=
 =?us-ascii?Q?AoXZnjGc3XxCFJgh/54fGQD8mYf+LvSH8Ud7JI+s3OkKjUwZ/FK4iawpZp8V?=
 =?us-ascii?Q?yXn+DKBiRIlB4hHUYmnPv0S4XVWyxBQATbXRXlTjM1Q+bPFia4UIjn6awgA5?=
 =?us-ascii?Q?qFRRqm77Na149FcLK2DzcpHlklORHvprTAEZERd7aaeCJW10d9WsIeSfYwhg?=
 =?us-ascii?Q?YjAeT7TWYjB+wCbZWlocp7M6Dc/L/WlPoNnjCxiBAd4gAH+W2Guj1Q5QPuxf?=
 =?us-ascii?Q?GgWztsw0TVy8iljX1r0uR3cJ10btN6GHRmAGqhQwzYy9s83r8rufX0fhNbhh?=
 =?us-ascii?Q?ntzgqC0eK+ec9XkwPjPW17aB763FFKJniVunBsHRMCVhfxDw8ovIXwgDMwPe?=
 =?us-ascii?Q?P2RT5rTXYAIMClOq+8dtME7IjhU/Ar87?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?22rBa7JfXWrgXgbtIV47texo0rnE6iK8T6HlsgFCRoDdFxXQZXH9vSlPBPsK?=
 =?us-ascii?Q?DukDDGrzXzuBnFtEC84HAWDgEmP+KIQCWsotaIm+wI3ERv6G0gZpDnmeOpgf?=
 =?us-ascii?Q?aOVqO3dgnb61WA5qgEUKCT7FEB4ydRBmcnehsMW0uuPtn8avep0hNUAyB+oX?=
 =?us-ascii?Q?DnaoscScMVKNAo23/m+SF5uRuanNChJ281YbxGb5Uoau1/T17EJGTyxLu4oC?=
 =?us-ascii?Q?FJkVfWM3KBhzGUCwdmrbYetK7emWx1aa5CJncTMisxSGK8QFYUT8CL/UkRNw?=
 =?us-ascii?Q?YyYZNB+FAxN/A53HkUJbt0G6R6WDTZuV7/ScNQl3DGIXeUpJz6TfttZABmey?=
 =?us-ascii?Q?teYqSJl1ot5DwEczF/4PzDRzsoxvmw6I3h99nyE7f/HuJXXmUzCGkz3uMX4U?=
 =?us-ascii?Q?4Iy7NKMAmGyoDnmuVYj9EEkqsWR9MW9Qt2B0ZCtedRHYuQHuQr/VArPPWjdj?=
 =?us-ascii?Q?QwEGPjEIl4RIWGchXAyRRarjCH2wf5skmYyYxGWIMzc2J/hNarictxLmtHQH?=
 =?us-ascii?Q?wtpmi1fmvM8W+HMJ0R11BwsbRmfieRoTMHwc5g7z7t34UiM6S8Nytqut9R40?=
 =?us-ascii?Q?hbNK9ZyR/6C/IlgZpnALi1c7SiMqzsjIWYhaGM+jQB5qfJ1hw3Dz6GGiWfcp?=
 =?us-ascii?Q?1ioh1LA5aqjkWV2I595kz34QBoHOV1oXXELSDfPyCkyBdFCQiV+0Cz/P3PxI?=
 =?us-ascii?Q?Nfb19gv4WGVj/rq7ppQwdLOeKjX2FHFHzmbsuS8DwldNdbBVEo6uJ3mmmUL8?=
 =?us-ascii?Q?sZWf4duUZ+h+rzcfJXAk1+yBBtRu9WWE7RjJzzJ22wL8Dg6L3aMbSzvcw5JU?=
 =?us-ascii?Q?WkiTNlhEJUZqMcIXfDhkmj90+mialMhBsQVekwqjtYQXrKlBLXEvVzFuP5wD?=
 =?us-ascii?Q?PRUpqJdqAyJXNZNTtktrpN5RS0uxyWYX2fjjm+YVBUdCyg8tWrIVPNGvJ0vV?=
 =?us-ascii?Q?3xZF97k5K2GftIchllBX+YUbFW1khU1G2Y4bGXJwP6JaeRUU/6bcIzUY0JT+?=
 =?us-ascii?Q?+ti1GlS1l6aBZyyhBegiSVoIP3yiAt7VqXkZ+6eX0XtMJ/yyvo9voevPUeZR?=
 =?us-ascii?Q?usK6ehJxjwp3ic+dl96L5fKuhhfMA5rJ2gEdkjyhwReHLyxFcEN24vxIFJaR?=
 =?us-ascii?Q?ZW8tVOsmI1OhapWPvkanZG+2HIWqAEndiWRoqkxZGUM3urPJd5kGK5jzmJ+h?=
 =?us-ascii?Q?fkzN8fkVfcV1BytjkW6n5qLr5PUZvBeoSvuO07kmvlNIYqzUFO5AW6bn32Uh?=
 =?us-ascii?Q?Tq52oAnPSc9Ucu+bvuZ/bVPri2n5p7T+f/13yG9+GotrKA8f7kbxxkx7bLlj?=
 =?us-ascii?Q?LeDAOEiCXWOCX5wDl9HTjPtIPDAkggLO9/gO6modYFz4KvuvcmJlbjwbrWFC?=
 =?us-ascii?Q?xB8/qJyCVKVMYryfejxOImAdR430BJgYqmg6th9B1DTUgyIk10//Sn5Ke40S?=
 =?us-ascii?Q?SEJgnscTIGe2UB7qthFNSfzzTJlE6c+54ZCqiIAdy9sov+snPDXrVIEm7A8e?=
 =?us-ascii?Q?1+/9NP0z4Klnvxw+iawBMV+cRka8CnxnFV/YNx/42fLmweXzzLX4q5jAGmGn?=
 =?us-ascii?Q?Ul2BMgeizTXzUQcmV8cJP8befAZ9hTKRGZ3KEtSi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0e25dd-0cf4-40db-7f38-08dd4d459ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:19:10.1700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xP5hwW2aOqCcKscsVP+JJcBZNm3LS2c3UKM89ynZjPoo4gQ8rUzvakxJfn9UNnASzojvE+3AwZrVp69SEag51+vvQip+qFkDF1XZbfdFxik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.viv=
i@intel.com>; Nikula, Jani <jani.nikula@intel.com>
Subject: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
>=20
> Handle it as part of xe_display_fini(). The error handling was already
> calling it if a step after xe_display_init() failed. Just re-use the
> same xe_display_fini() for driver remove.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks good to me, though we can probably remove the first
sentence of the commit message as it makes it sound like
we're adding the functionality into xe_display_fini, rather than
leveraging functionality that's already there.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
>  drivers/gpu/drm/xe/display/xe_display.h |  1 -
>  drivers/gpu/drm/xe/xe_device.c          |  8 ++------
>  3 files changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 5ad2c99a9ae74..b7c99b8df11f9 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -170,6 +170,7 @@ static void xe_display_fini(void *arg)
>  	intel_hpd_poll_fini(xe);
>  	intel_hdcp_component_fini(display);
>  	intel_audio_deinit(display);
> +	intel_display_driver_remove(display);
>  }
> =20
>  int xe_display_init(struct xe_device *xe)
> @@ -211,16 +212,6 @@ void xe_display_unregister(struct xe_device *xe)
>  	intel_display_driver_unregister(display);
>  }
> =20
> -void xe_display_driver_remove(struct xe_device *xe)
> -{
> -	struct intel_display *display =3D &xe->display;
> -
> -	if (!xe->info.probe_display)
> -		return;
> -
> -	intel_display_driver_remove(display);
> -}
> -
>  /* IRQ-related functions */
> =20
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe=
/display/xe_display.h
> index 685dc74402fb8..46e14f8dee28a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -14,7 +14,6 @@ struct drm_driver;
> =20
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev);
>  void xe_display_driver_set_hooks(struct drm_driver *driver);
> -void xe_display_driver_remove(struct xe_device *xe);
> =20
>  int xe_display_create(struct xe_device *xe);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 89802f98c4820..d88c0fddf0680 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -868,11 +868,11 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	err =3D xe_pxp_init(xe);
>  	if (err)
> -		goto err_remove_display;
> +		return err;
> =20
>  	err =3D drm_dev_register(&xe->drm, 0);
>  	if (err)
> -		goto err_remove_display;
> +		return err;
> =20
>  	xe_display_register(xe);
> =20
> @@ -899,8 +899,6 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  err_unregister_display:
>  	xe_display_unregister(xe);
> -err_remove_display:
> -	xe_display_driver_remove(xe);
> =20
>  	return err;
>  }
> @@ -911,8 +909,6 @@ void xe_device_remove(struct xe_device *xe)
> =20
>  	drm_dev_unplug(&xe->drm);
> =20
> -	xe_display_driver_remove(xe);
> -
>  	xe_heci_gsc_fini(xe);
>  }
> =20
> --=20
> 2.48.1
>=20
>=20
