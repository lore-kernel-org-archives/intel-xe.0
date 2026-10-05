Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE29CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 11:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7987610E131;
	Mon,  5 Oct 2026 11:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWcHAe+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86110E131
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791200309; x=1822736309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mqvuBQwvRS+xKBOsXx/W4XsvniNqwe9XQIYPpjTw/3A=;
 b=MWcHAe+PRJVffKhC/RoNGC0WGtWxxjX1XufyozaGZ5a9H7EJOm0Gl+0x
 Oajx6gRAar7B/XDCXYue6mpwOgVkU30GXnQIGH/fZ3VvLwD/RRMUXTBwP
 tA/9UlNx52E4eH675neoKWBry6Kgig6EP1QSOP8Juw/wfFWc8fQv703VS
 Zpxq9a0/cPQArE2w65p4PhxyO3r19ar8d3qEPFs03HgAfwMYzwTesmLIK
 8LS8SEwfTGToG+hQe5k01MaPSNxDUEAjqAQbYUEp+Mn4TkEHcfXIaso7m
 e4wK32/8adoaxk2ZNfq+ssNj6Wzga7sRxvjyTYkBxufH7wEm95vu0uCqV Q==;
X-CSE-ConnectionGUID: +tN8YkxESTSsdAbTeWOPlA==
X-CSE-MsgGUID: XZS5KYnyQ0+N7bzN8EVEZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102387420"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="102387420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:38:29 -0700
X-CSE-ConnectionGUID: YN1xUMavTzKgiFNs7qDYUQ==
X-CSE-MsgGUID: YArdlpA1QLKkB0VxtxRCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="306308444"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:38:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:38:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 04:38:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hY5cSleFF2J3h6HHp85gdbk3Jp99MtnQenA2UGkLeKIF4gYrLV1WnoXaoyEWgLmWiXmL4pfq/LXiMkLKXJJWmCngzq2xhhoxQEXff+shkYHOl11npUechijEzele6x24HfYjgegmwmwFIpQkIWEBmF/csGyIP0P1ES1E1QvWMTnVdNYlDGnf6/8poWGSF5CS5c+84dMdIDirYZu227QczX67n8bB8LBoWDLlPUP//G2L5u5oJBYIlCENY5JU+UVnk3eRwlk9bRzb1KPmj+HQDB5xVBhn+Xr5TAfB0KeBgT8TDHT0MN5uDPLuCWN8f7kFw1DS3sqd4ZqYM7bmyNCNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swIdEJLFtLmy4sILUWiSKwAGiYqZXIPcPuMkrSTgBko=;
 b=Rxqk2DDRs13QjHnvKeAObklonJPMeXcA88h5wElerkwPdarSXiJDUpw1WFLRcRAC3jdCPHPkZvuvcyvKUpNVqpKnpy7Xm7uR+ceZgOGhj2+XxEiz26dfmf1+X7W4rU97j5YVi9zA2QMSevZ143X0w1qwRgVN4legeWVwzEwUDmNgrmru7AnJ598Acsqncbug/e3XM3TQTjxyEJ+dGnJ9DqJbri2BqUpWtgmRNv+1AgQd11u250pzE8PtbvCgU8fRHleIT5gai/HjQyqI7vQ9vMjWeGIsZFXWTLNdBFQ3dupTJOxUWKs3HqY22qNmm4KGare5heYZO8utvVZ3gWFcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 11:38:26 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 11:38:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
Thread-Topic: [PATCH v4 6/6] drm/xe/xe_ras: Track offlined pages by firmware
 to avoid duplicates
Thread-Index: AQHdVKhOJDOnm4EIF0ytkW+cezrNPLbu0kqA
Date: Mon, 5 Oct 2026 11:38:25 +0000
Message-ID: <DS0PR11MB87183275AD430B3EFD668D8D81962@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-14-riana.tauro@intel.com>
In-Reply-To: <20261005090156.1233748-14-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB5828:EE_
x-ms-office365-filtering-correlation-id: ee589838-320c-4c8b-090e-08df22d52b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|56012099006|11063799006|22082099003|4143699003|18002099003;
x-microsoft-antispam-message-info: jGeEDXGDgakiPEv72/G0QG+mnzlbT55mNY9xQb13gFWz5Dve8gSKNV32IY09JCO8lVupPvoP/FW/fzNHBAfyj5R00b6rvG/zKkxnJ+wJ2s4z83mSARM1HUOhAcLLq/wIr6GkOzxwKv4yOa8Fbhph5DKQJkFsFHOTAK4SqGitVJB+ut2VZzo8Ywdaap6xzLUiWKEms+cPQMzbD0FQITybA0AyTEVAQdtjqqRiSwIlJFjnZyC5MqW8Cl2cwizGfCSDfgSio97ir9kq1/VOaI1yRbxMX5mps1BMaRWg02ksXbazrcy7CUrnJA+LJn6V8oD5vqWzG+oxwj3TVSt8Y18qVaCm4pUcxBtA2car+GLBBsYSfnq0v0jol7LPRyj5a3MRGJtVnX6cKzZ1qc2vWOhv2fwSJPZrMO2DOoBUL8FqzFv7rGB3HiTVuTUBsHwycWj2Z8KamSMRgVhm3AicRB+76goQu+KBfghAIEcOSsVE7S+dfMRn5XM3QbKqKT6Bvq3J4SdPWhGoocww2rLIDfy7bvSudgMuQ2rTEeW+A8CUAiQb2Ru/4aNNiuVnnLlBIn6HaZcD3nu68gXITrXmLdd1JN1zwQsQBHvQ62uAWBjOmBqDg01uWl3hoD7H+3sCQ3eq2KIciTUtzh7GroXI2KJoExQuDy9JmJJlm7xqzK2i3fQ51wSBmM2q/ckYtehjHmvxi/jXFHT4YRTEuIJls5DXb/kAi7idNyqvxxzZ5B1Bn4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BFcDe8RXGIaARcDMFfBWk7jEY2KWJVmYBezc1WPCRPKej6yAQSOwYwgj86uR?=
 =?us-ascii?Q?UxfLgssCf8E/HCNU43Q6MI9vju90Y3pxe3C7wqXsNBOgVrto3OiF6A+HVair?=
 =?us-ascii?Q?UAirW37ZHx5/crErW97L7fw95T8rHMUl76Vw3XyTGBja/83OCpylT9SBG/fm?=
 =?us-ascii?Q?t9QR3r9DmI6OOZM1dVOoo/EypB626KzhmSSUAY8u0R3Y+PVwfU4HoYq8GaJ9?=
 =?us-ascii?Q?lAhOy21ui6GiYuHmE2vMU8B7VpaNqaJUpD4GlcBKlod3dZBXsNz55h4NZCQP?=
 =?us-ascii?Q?Ne0cOiNEpeLOspFHkEneSAQBrwrn6e2V0bq/qc8YGUeTLSg50RCvgu7pgGu/?=
 =?us-ascii?Q?2mar4Usxd4bK4CJX7fw0Bx77oXBa0aFqSiQ1+6hg4YM3lyWdzJJ3PubiuMr9?=
 =?us-ascii?Q?tB9O4eJsWr+MCMOzXUMyrR7DU9tB93BqY5cDpchnd1MU7pxfFctJqfdLzx+8?=
 =?us-ascii?Q?yKVVHzXc1Lv/SUndlNmkpbHWAwkF6FikUFyjtra6NkWDsk2Yx+O4Ypo1C5d6?=
 =?us-ascii?Q?iQUvuXQdborxkbYm4cCSRYIO8zIu3K8phaikG8oC4GfSKQWV4GUlYj9VIpMm?=
 =?us-ascii?Q?1WHMaf8+V4gXIhDXpcuahs81dIEPwTW/k83Zk9dD35kvn6ECMNiQGMi6q6i5?=
 =?us-ascii?Q?VZnYG2G1wbMQt6OKVeVlITDP8nvXRPPpwJ+0NWNDryzDV5E1ePDLEDR23ClB?=
 =?us-ascii?Q?tBZ3ohFZF1PVPoKPSa0TxOyNubheGUmSN5esd4mxFD0nShsD/4jvqmfIE5tu?=
 =?us-ascii?Q?zfoQFKFkZ4R4x3L/0GH5wWmbdJO4CbndnaEDVgM0/MsPVB5dscJPAs0J7E1A?=
 =?us-ascii?Q?UyvKnPASWX7pRkYQOXYmmOe8S4Et8loGCmsRC1kz4IND2XIWLdATGEEUaeBI?=
 =?us-ascii?Q?nBXw4z+DZwJ+71sD8baGSEoMJ1AbCjYTydUU6ZAhwwQtHNKrsUrPU25+V1m4?=
 =?us-ascii?Q?a02aZulItmtqBgMIpLoFFxdhIO7ClMs+umJH6bLlUICDIabMEU5vHW7b8gyH?=
 =?us-ascii?Q?RYVf2xBOXfCBoa7iyl6BvmP+jvtqrQUnwyMMfAAGkbPZ1Z+/3PyKSNfUclAa?=
 =?us-ascii?Q?CgiWQsFnrq8cEelHLqe/Upvglg5rIrdPN86rVrVZpW2Stj8qRD3LUe/hhSof?=
 =?us-ascii?Q?0UHESK9SkP8MFB+a/vDL5+iiikpT08CwCjDlfhrKe6SPQynvWGKpbfDAAit3?=
 =?us-ascii?Q?sd1f5a+JV8c9+J9mmx5lCQD2xPMHcT+tuoT2Wdz82YgHTkVqtYM3J7jHQzYW?=
 =?us-ascii?Q?AZqRNAlr2JmHo6djLdm+IN76GTYY1fbGuK6NLFIFqDQ7bE0NQDtiCXA9T3LW?=
 =?us-ascii?Q?bvguuiz1yI+UMCQf/7f9nRXyrUexc8rGvBoVb7TaUtg4jlKeQm87dITI1jca?=
 =?us-ascii?Q?crbE2myu5bOAa8apT4CmtOkhN/+8HOznNXaZJqhSp14rTGdZu6OcV9VdClUP?=
 =?us-ascii?Q?5+jtLUY6NjKA3MblKDyONkrv02XifRpRQBSSxv4rkxYdWQOusLjfClQYnzsu?=
 =?us-ascii?Q?vByTE/g+5N9H8nH3TFWnmTDDhZEixf2z1r2epfKFFyJreXBtBPGpztZwVqGY?=
 =?us-ascii?Q?+wSELsCp6WZMDE9XgrNGmkAp4+CFssWQVff1NtXqCSLdoOTrCeYPqAyeBCK/?=
 =?us-ascii?Q?BzR+yF4pyfSQVYOYmFDUrm3eI2Rg7ns4tD1AAwvySnDw2oIonAesZYGSvqxd?=
 =?us-ascii?Q?NQETHrmFDB7BDjVw7P1FZxXe+EbocSVpmeZs7PqHzWujc9XOVSWTQ2+32uWL?=
 =?us-ascii?Q?XWzMLJtttw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5FhuAgUK4I1k9Znc0fEoeIawSxv0RUTpUcsuwAs8Sya/Fr88GuhfO2alOKRdqT4buGABaHmjO2lnJovFxtLTzBUT17B6Ub5gGIgGmCeV4XTrMu5D4GZJd6DyeR1O7XfsPgOsGGJjZoPltDH9whOo1R3HQ2NW7koEbh6kL+XlhaEjrCkulxCV3KXzo++h4xOoIwslhHypfXGjjWkOTgtIz7TXeCgSMeG8PkThELkCVozLAXoxy293rLEEelszrtuM0WHZ0/cO+1N9ir5piiNLauXy4AVbqkYKhe1dgQuPvUX2Q/T/t2dyPwI0WYdW1LlvmoIZ5cHMZAQZC50Auz5b/g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee589838-320c-4c8b-090e-08df22d52b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:38:25.9513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymC2zG7cJhJhAR/ZuQsgNC0i6IyGwWskNOLSAXRIqBHlaZ7+irYg1ArjOsDmoENt++5WcU5W+8RgBlXflVOfrD6xECWF7SRM/yyKFT+xkK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 05 October 2026 14:32
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 6/6] drm/xe/xe_ras: Track offlined pages by firmware t=
o
> avoid duplicates
>=20
> A memory scrubber can report multiple errors at the same address. Track
> pages already successfully offlined by the firmware so that subsequent re=
ports
> for the same address are removed from the firmware queue instead of issui=
ng
> redundant page offline requests.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: use xe page shift (Sashiko)
>=20
> v3: handle ret
>     re-order list and queue (Himal)
> ---
>  drivers/gpu/drm/xe/xe_device.c    |  4 ++-
>  drivers/gpu/drm/xe/xe_ras.c       | 43 ++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_ras.h       |  2 +-
>  drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
>  4 files changed, 46 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8392c9fad3c4..643846721d1e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -974,7 +974,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> -	xe_ras_init(xe);
> +	err =3D xe_ras_init(xe);
> +	if (err)
> +		return err;
>=20
>  	/*
>  	 * Now that GT is initialized (TTM in particular), diff --git
> a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
> fc577590dcdd..afa58b420966 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -20,6 +20,9 @@
>  #include "xe_sysctrl_mailbox_types.h"
>  #include "xe_ttm_vram_mgr.h"
>=20
> +/* Any non-null entry marks the page as offlined by firmware */
> +#define XE_RAS_PAGE_OFFLINED		xa_mk_value(1)
> +
>  #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>  /*
>   * Uncorrectable error type for core compute errors.
> @@ -210,6 +213,7 @@ static int send_page_offline_cmd(struct xe_device
> *xe, u64 page_address,
>  	struct xe_sysctrl_mailbox_command command =3D {0};
>  	struct xe_ras_page_offline_request request =3D {0};
>  	struct xe_ras_page_offline_response response =3D {0};
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	size_t rlen;
>  	int ret;
>=20
> @@ -251,11 +255,16 @@ static int send_page_offline_cmd(struct xe_device
> *xe, u64 page_address,
>  		return ret;
>  	}
>=20
> +	if (action =3D=3D XE_RAS_PAGE_ACTION_OFFLINE)
> +		xa_store(&state->offlined_pages, page_address >>
> XE_PTE_SHIFT,
> +			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);

Should you log if for some reason store failed?, warning or notification ca=
n help, because missed message then can result in different behavior for in=
tended feature to work.
But its your call.
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +
>  	return 0;
>  }
>=20
>  static int handle_page_offline(struct xe_device *xe, u64 page_address, b=
ool
> notify_fw)  {
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	enum xe_ras_page_action action;
>  	u64 addr;
>  	int ret;
> @@ -299,7 +308,11 @@ static int handle_page_offline(struct xe_device *xe,
> u64 page_address, bool noti
>  			   page_address);
>  		return ret;
>  	case -EEXIST:
> -		action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +		if (xa_load(&state->offlined_pages, page_address >>
> XE_PTE_SHIFT))
> +			action =3D XE_RAS_PAGE_ACTION_REMOVE;
> +		else
> +			action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +
>  		xe_log_err(xe, DEVICE_MEMORY, ret,
>  			   "Double-bit ECC error detected at physical address
> 0x%llx, page soft-offlined\n",
>  			   page_address);
> @@ -354,6 +367,7 @@ static void process_offline_pages(struct xe_device
> *xe, u32 cmd, void *req, size
>  	struct xe_sysctrl_mailbox_command command =3D {0};
>  	struct xe_ras_offline_list_request *list_req;
>  	struct xe_ras_state *state =3D &xe->ras.state;
> +	unsigned long index;
>  	u32 total_pages =3D 0, count =3D 0;
>  	size_t rlen;
>  	int ret, i;
> @@ -388,8 +402,15 @@ static void process_offline_pages(struct xe_device
> *xe, u32 cmd, void *req, size
>  			state->max_pages =3D
>  				((struct xe_ras_offline_list_response *)resp)-
> >max_entries;
>=20
> -		for (i =3D 0; i < common->pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +		for (i =3D 0; i < common->pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +{
>  			handle_page_offline(xe, common->page_addresses[i],
> notify_fw);
> +			/* The pages are already offlined by firmware */
> +			if (!notify_fw) {
> +				index =3D common->page_addresses[i] >>
> XE_PTE_SHIFT;
> +				xa_store(&state->offlined_pages, index,
> +					 XE_RAS_PAGE_OFFLINED,
> GFP_KERNEL);
> +			}
> +		}
>=20
>  		count +=3D common->pages_returned;
>  		if (!common->pages_returned)
> @@ -1120,6 +1141,13 @@ static const struct attribute_group
> gpu_health_group =3D {
>  	.attrs =3D gpu_health_attrs,
>  };
>=20
> +static void ras_fini(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	xa_destroy(&xe->ras.state.offlined_pages);
> +}
> +
>  /**
>   * xe_ras_get_disable_page_offline - Get the page offline user policy
>   * @xe: xe device instance
> @@ -1147,15 +1175,18 @@ u32 xe_ras_get_max_pages(struct xe_device
> *xe)
>   * @xe: xe device instance
>   *
>   * Initialize Xe RAS
> + *
> + * Return: 0 on success, negative error code otherwise
>   */
> -void xe_ras_init(struct xe_device *xe)
> +int xe_ras_init(struct xe_device *xe)
>  {
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	int ret;
>=20
>  	xe_drm_ras_init(xe);
>=20
>  	if (!xe->info.has_sysctrl)
> -		return;
> +		return 0;
>=20
>  	/*
>  	 * TODO: Replace with xe->info.has_disable_vram_page_offline once
> the feature flag is @@ -1167,6 +1198,8 @@ void xe_ras_init(struct xe_devi=
ce
> *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>=20
> +	xa_init(&state->offlined_pages);
> +
>  	/* Fetch the offline list before queue to avoid duplication */
>  	get_offline_list(xe);
>  	get_offline_queue(xe);
> @@ -1174,4 +1207,6 @@ void xe_ras_init(struct xe_device *xe)
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);
> +
> +	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> 561c656e2ad3..e41a52869085 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severit=
y,
> u8 component, u32 *val  int xe_ras_clear_counter(struct xe_device *xe, u8
> severity, u8 component);  int xe_ras_get_threshold(struct xe_device *xe, =
u8
> severity, u8 component, u32 *threshold);  int xe_ras_set_threshold(struct
> xe_device *xe, u8 severity, u8 component, u32 threshold); -void
> xe_ras_init(struct xe_device *xe);
> +int xe_ras_init(struct xe_device *xe);
>  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
> bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>  u32 xe_ras_get_max_pages(struct xe_device *xe); diff --git
> a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index e09b50a6f77b..50d70e2e2fd3 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_RAS_TYPES_H_
>=20
>  #include <linux/types.h>
> +#include <linux/xarray.h>
>=20
>  #define XE_RAS_NUM_COUNTERS			16
>  #define XE_RAS_NUM_ERROR_ARR			3
> @@ -417,5 +418,7 @@ struct xe_ras_state {
>  	bool disable_page_offline;
>  	/** @max_pages: Total number of pages that can be stored by
> firmware */
>  	u32 max_pages;
> +	/** @offlined_pages: XArray of pages offlined by firmware */
> +	struct xarray offlined_pages;
>  };
>  #endif
> --
> 2.47.1

