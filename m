Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDEDC55168
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 12:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1FB10EECF;
	Thu, 30 Jul 2026 12:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aqp00JHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE92D10EECF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785413134; x=1816949134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oYLFMRPlqI19qYwKIt+Ti6HwnzLq0sbJ3Ge47r9tN/U=;
 b=Aqp00JHTaCSPq4g8xu1CkFd4h24ZBTTrsKL6+3cE0F0e5OzRCoccasyx
 isPUi0ZTImwxaBQ2kPYzwYNvQGJ2aEfs0NApLD/Dp2ot7UCvO0klfUHr+
 WWl9eUjZqGfF/PkGFgMDCv8r3hmlRqdJL+JyNgYBh7lXURYzvJIrU3x1Q
 k9zfI0MdMPWc1TREXNOh7Nv/aofkaazGOHs6tMpHrW4GbfxZIN8SCWKSO
 lEt2a60G7aIPQt0kE5cSRRaqAvySFUyhnOtsxxncRKPGCaeQj3POLyTGe
 kbZMD7wJUqWJ08GdYto5M1GVdRAJIBufpt2Qy8dIT7ZkgrW6/hRMWofvE w==;
X-CSE-ConnectionGUID: Ly8cf79PRKepr+aGMQvrmg==
X-CSE-MsgGUID: pj1QtVXfT2SJPabj/ykQLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86045940"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86045940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:05:33 -0700
X-CSE-ConnectionGUID: QukaflRRSISGBLUNp60Dag==
X-CSE-MsgGUID: ec3evFdHSDWB0DfwoJP9RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298490504"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:05:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 05:05:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 05:05:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 05:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRd/Q3/r3K5KqVJvLL5EbYgjXZ/lDrIXC17/EnADjUBqKhAbWOcRmW5Is7cuCJjmxvYaQtQ+g18q4Q6PSAwp2sa6YA98DuUdqsF4w59CFPCEwXj/8swaTy+sL2TaixbhZoM1q5GKkHTPz23ZBdEcU6RmAhQ+PM1cQU3J0zITjqLDg+8MdxNYAHgne7xwBAqMkw9sjG54qBQPOFVfC5jGJhvH8SinTEl/4auh7Gw63asRWWrxWIgVfhZhhj7BZrxhQosI9uu6wfo7JJCt8UG9ON9tuJyXDcp+Uu3O8epPZFvVjotxEHvs6ABHyinkRpQrBdK/yeIRPv9MBZShK4M3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYLFMRPlqI19qYwKIt+Ti6HwnzLq0sbJ3Ge47r9tN/U=;
 b=Rjz4dN1G7DWhWSWiJVzdv9RmbEkIi9wX1RM9bH2iJNxMuoqxZKzwgnodFt42fOMTZWO+DFDsbTLzwUwh112FEkFbXHfX3/y/az8B/wbXc5ZzsT2sDhXRR2IjtbW00x0lNPi2vHqC6EgTodBNlHwpgahrBFYzvSm7hqNQL8ELQfI8Z6XV4JxhMLtuFc3gk5rbIWX57jot/4nUw8JMRvsh24xO7oPpqnldHKnlLhpppxPsUHGVkRblhLFwHDbWALvK/fLijlIDrmgxMR+wOHFITqCV5dSgh0+6DH5Ao6FT8xO4VlfUI8+F7aXL+gAgFomRV4d9uPggc55fFP2rU6YK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 12:05:26 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 12:05:26 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Topic: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Index: AQHdH+A3blUlj5trUUqN9S8Ho0aa+LaFkVeAgABcjVA=
Date: Thu, 30 Jul 2026 12:05:26 +0000
Message-ID: <SA3PR11MB81184728764B0494D31F1036D0C92@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
 <amroMZ8MF0PrF8dh@black.igk.intel.com>
In-Reply-To: <amroMZ8MF0PrF8dh@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|DS0PR11MB6397:EE_
x-ms-office365-filtering-correlation-id: 99707655-821c-408c-bf5b-08deee32d772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 8DEo+Q9ozKBeSKqEE3qNj+VHYoR1mNHzu5MuQOnOFseWsF5wtNWDZitQ0ocJzkTiVJCKIIfr92HssSXQXxtTW6cYIKIoSaokDqmkzK82veilaVPQDMgbGZPP5E1SVekiXTZD1lp1AKswvk61jtZCtsWrwORSANGesNAvLGJ5MmhRn2xWBdRUzkb0NzGRusCM6bxOyth96PC5RJnznHVcqG93Sxfsq7EXhU+Putrh8qjRdrqYFiJpoxlsr6YF3vCiz4OMAP4ANgUCkeFiYzwTrfyoVpfPsYjJuSieDChkhIfeJthApv1IwB7C8SAYWeuLI22WJdm0rId0ZquY5nrp66EBAt398yJ/BQ8Q6FWVQvQ/1oompGLwdUEkjQkwrHvZFeufMIuci+5T93U0DtwE3dtDAcP54toZHKyzbj6fXFX4A7iF4jyryCKeW+43sZ/BfP1kKlXKFt38+Tjz2IIlY52d48sU3X/bfGhiQx9NS+5kqghoav7pGy27LEUtwdJsAmuq4AVPHShei+kv2zmkAL1fucxQmAwzj3SFryCn5RXn1SaxsPcdByE69oFT1pfGIVurPcB1K2a1Ki5WK1tmYUoS3lXrzm/0Hr/r9YuSDSEC2KQsK1gu3t02bC0Y3LnN8l2fgqgGIMkEG+coIPDDaSZwm+oBhJmcazfhxRr8Ngp2+VOqu5+hlSLHY6CixiMRawtBOh4byljvix4YWA8p6CVYn4cYX9zfGNT8m29oBm4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JXJfjWA5F/wDguHr9NFIpjqvYnRxuoNXZpvU2NLv/CqYN1bAkjpJYQeOk87j?=
 =?us-ascii?Q?K68RhKUhJOPvVT/6NpgfYVQFtz2nmc//nB6OSv0HYzZpSpP688GCAQf6HnHu?=
 =?us-ascii?Q?GOQkwZnidW5HLGARENPlBuvslceY3DckyZakQ++PZwbvqWffRl61Xb8Fnq6b?=
 =?us-ascii?Q?Qmqa06EveHdVWk23ar960W1YgJiz4cUeIKDWfNVpZRRfrdU9lwALrwdosVmo?=
 =?us-ascii?Q?XeOGPOFl6dMLYCMVTLAG8nKr08Bsd7BNxsZ+0OFTaid/WpuP8NFgGy/Dvz5F?=
 =?us-ascii?Q?1ZTe3AdTAS/4jIJj2sYA1RNm5N14GgUhRk8LddT5lzVojF0faNPldkLHESLy?=
 =?us-ascii?Q?l+5puTBZWmmqbLPGYSLwSw/NoKIL58Q/yU2EOmv/jZ8pqlbeVwTRFIMui8A8?=
 =?us-ascii?Q?RbGLzgSZAwgjOPOP+IMHIDHfSu1fe+9sZjTSehamyVQ0HAtyQmEicOjNC+GH?=
 =?us-ascii?Q?u6VA66JM77trzgvitnbEnrVd4ToL1EBCv4zjbZW+Dfvc9Hc/6/za5x6npmw7?=
 =?us-ascii?Q?0XspaoTWWrbk6O4vll59LwEQw/E8OowLOBCahIrRRDo77+4V87VGaEM95UR1?=
 =?us-ascii?Q?3zu6wEghuqSew3fMVqfOnG/kjakYyTK4aH23CZfJczey53of6EyE2NiuR1wg?=
 =?us-ascii?Q?kkclBl3I/4sw7Uvhaapk4qY+PJgvuXwhcNAuUYCuEO1bh5x8RvNvzdjeLkyg?=
 =?us-ascii?Q?xWEBYrwfbPNcLHWw7uXcXoI/Y5/0p2hAF3kpa8lCI0iaePDlyM9QvXovJ5Tx?=
 =?us-ascii?Q?EMnaIJVE4w48zLYSsJg/n0pKlMQWb7o6J/LnPIARAVrMV9KPcmm9NW8WYf1h?=
 =?us-ascii?Q?s+pLcexfy0gDh+JEF70zFDCsYojWDw62P6waWeiNMVhjMP6hg+n8WRUyO25d?=
 =?us-ascii?Q?fjeTiDrmEoPGm5/mUgd6eA8RnO2lTB40t1iWB/dqhVMoQg9d0G4s+FqlQl3M?=
 =?us-ascii?Q?gCx3zWu/0P9gDskUowSfC5ZpQMZs0wBktam4xb9zXUXhZCLkUqIcxloyCCGe?=
 =?us-ascii?Q?dvvnSlENrvnL50Coq1v23gaEPfXi3qpHko6tygqVNeL5KywfuAOwJWIcsm9T?=
 =?us-ascii?Q?CdohH/WdF2cCypbH4iijwC0bmsbc1jI+cG603UVgz7aQtKYRDHvfF5rfaEGa?=
 =?us-ascii?Q?uPgM9YdBGu/oMRafXnVfuvuBtnSX1G/xcsL84WNzTUUlN72Nq1IE7xrentQ6?=
 =?us-ascii?Q?HoLRjFREHcJl+xYTu0KEDk0Du4Ul8+RMWk2FKMtZYOwvcwZA7r6TkcHJOEaO?=
 =?us-ascii?Q?jdGsK+aWwG/l9qtLd7/Pbs/zYYb8eX/YY9LHviPBBxI8lH7TVsJyw1UmXqvc?=
 =?us-ascii?Q?/YcJV4UGiLC8XvjBtEU6ejVC0otQa/xa1xXxoehIvGdVFVFNTyrtgN1Wgjru?=
 =?us-ascii?Q?6+1pusyyIsIffgTlsL6FhotFclJwosOTG1fbzHj6fguGj3cV2t1GA6clVotB?=
 =?us-ascii?Q?sMs4cAZsx8yMKw/rHsDE0m/qLao4IFVdU+H1xE/1GxS/S//t+P3WKwnPQzRf?=
 =?us-ascii?Q?qW8aY4O17vFWEEjMByLK0Gev4O93V+OtVqwuPMUeR6C6Xwmd0Qgl/Cgt1Za1?=
 =?us-ascii?Q?1A/6V5Y1g3jAyjjzk8W1acJVl37B7gAEVFcF3jSGo7vss4g5sltehSVkc3h6?=
 =?us-ascii?Q?oHI1c+yNM8fNISLwNiZdCuK0K24pPdhC1W4PKtYIA0q0aIWlPtCloly/KDjG?=
 =?us-ascii?Q?s0Xpnk4PFcH0z8rpc0qUketmfS3LG/kIpex9yVBNqMXuCJgo89DbalC3iRTj?=
 =?us-ascii?Q?0tyKC2b1rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B3VCbBFUwvzwRlOZ7goB6eyDS4WLFmBTMz6zp4Xe5Y5h4PzjwJT2mvU92+E+bSwpXqVk1JqYfrrmPxI4lA0k+8X6N5pOBBNM+uo41oDO4knYUgVPJ9ZcD37lYWuSRZDn2D4LMumS8D3yvhsS2BUDLjQXbdJNPcbh6XL12/Zuy5R/XK1qGoqRvj6GfZ7hWHVxLfL1YKnAcys/N0unkezTEcMa0yy+SS0q6GyFhEBjF3y9h9luFX2SjFjtK57+DpYayWSVCZrvVSR3C3mtOAS9aSFwfFuuDEv0+/NoImtngkboBnvaSvSBPsYYcAW1jdjQLrL7z9OrCDwNs78zYBx+AQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99707655-821c-408c-bf5b-08deee32d772
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 12:05:26.3394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGOLOQWHI214LVet1ADrybyKIsk3bMbtq4Yj2ihggyi2p/2trIadWL6037Yb8DYSn7WsV1aEtIFbtuOnuT6CbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6397
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

Hi Raag,

> -----Original Message-----
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Thursday, July 30, 2026 11:29 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.c=
om>;
> Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
> protection after hot-unplug
>=20
> On Thu, Jul 30, 2026 at 11:06:36AM +0530, Nitin Gote wrote:
> > After hot-unplug, device_del() disables runtime PM. A deferred fd
> > close can still run later during process exit and destroy remaining
> > exec queues, which may call xe_pm_runtime_get_noresume().
>=20
> This sounds like could cause many other side effects. Why not make sure t=
he exec
> queues are taken care of as part of hot-unplug path?
>=20

Here In igt@core_hotunplug@hotreplug-with-load and igt@core_hotunplug@hotun=
plug-rescan-with-load subtests,=20
the workload keeps the DRM fd open while the device is pci hot-unplugged. L=
ater, fd close reaches=20
guc_exec_queue_destroy() -> guc_exec_queue_add_msg() -> xe_pm_runtime_get_n=
oresume(),=20
after pci_remove/device_del() path has already called pm_runtime_disable() =
during pci hot-unplug.=20

So the WARN is a false-positive for the already-unplugged device case.
I will update the commit message to make this scope clearer.

Thank you,
Nitin

> Raag
