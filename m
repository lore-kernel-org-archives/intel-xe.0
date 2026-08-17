Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D3CC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 17:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C310E42A;
	Mon, 17 Aug 2026 17:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3TuE1aV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E210E425
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786986111; x=1818522111;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7BxHq8Erl2cYugLhqlfGNkMnCoulD1yj9+sc0T8PcLY=;
 b=V3TuE1aVHreJ3YLkHVVk50GG6Cgh2mhz9T2u4b4G7FJVFqsJfT0JBQiR
 1nmFeGmqzAJW/jb3AGudssxHbb/8ZV833hstTa+FTNnQOd1LT/IR5Bxo6
 dTdfLYUasS/AdwCNvvAn3idZWDgUXH4yhJJjKp9leHeX2uy5D2VxcTfuG
 rwLONxucATwa10qLDn92xSfY7+c09wwQWP9loGwRy/WlTtHIOjP08jVF7
 gKBIfXjXTSZFAwVUfqvGJrFPw9pMz+J6ep48aacctMv9UNfkDnvQwlFt8
 fScvYuRnEFK+4fKQ9yTa6HvlYwJYemxzNWnHigQ10cvvGrTF0NQ7f/X0/ A==;
X-CSE-ConnectionGUID: szjfiDyBQCupfovU5IbzjQ==
X-CSE-MsgGUID: lRTWFoJfT8aZGhUrBjjWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98981178"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="98981178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:01:50 -0700
X-CSE-ConnectionGUID: +IHZVQWQTiG6qSX5IBI9Kw==
X-CSE-MsgGUID: qbJFXA2bRJmPct0NdHXBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="258766429"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:01:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:01:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 10:01:49 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 10:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQpET6Pi5KI6Sfg/9iCmSO4JgQwkzJxcN9sfL6D9YtJLN2RiJj1pGa7UjRurdRXnyvHSniIvTBuivLhDfREChR/xlP5+TYlJxV+exdYN3MI8PZkVcXLDdUhgmD/1noQju9oudv5crFTOpDBVVMY4D8B9L81yzQJ22dHQ1tXDlB/HVXr5sfLVf1aTLS4nPwP3OVCAfXwv7J2h+423I0tbMNkfrKhke/nCt6l83AHo6sS0UZi6618aZnTadC1q0KgcZZH6CQ3oAcX+zM+6kt1LFIvNB3koL9dlaFlv4djtet5Iz5gS8gyDD8vyXSWBBDWxIG6ZqnPSABP3CAHd+jug/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BxHq8Erl2cYugLhqlfGNkMnCoulD1yj9+sc0T8PcLY=;
 b=bqZwHccNpNcrZUl1iSdITFvwyNnI6D3BxGudMGKoX+uIJIfQBO4J4OVq6qXQboXIrajrxT942sUcKmH10AZEqE/IXQl7fse1SqVltAs895Z6x3KJQTbqU6HAKE6Y3PFglxVe0iroJC+oeDQCbMcaV2nzsbReNpa6ViPg584rbJ+QN7pSqUSWTOkwMx/twWMSExDzbCG+9j5iW+usYsmMMvdTmxzDj1yfH4McD7kmH0ndtpBEuDk4LinWr8KewiVpt0HK2/2sXgeLlxvIv8QUh3175ElOiMpAWVrmRzHEyrUKxQBHU9WHqDDTP6sA4f18eK7stCAP+oIHKBZh3B5LtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Mon, 17 Aug
 2026 17:01:47 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 17:01:47 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
Thread-Topic: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
Thread-Index: AQHdFaIKV/Fl6rFxokKIj19+cBduYraY+p2AgAmtfd4=
Date: Mon, 17 Aug 2026 17:01:46 +0000
Message-ID: <CH0PR11MB52492B8E0D5A278C3EDED38CE5A72@CH0PR11MB5249.namprd11.prod.outlook.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-3-karthik.poosa@intel.com>
 <b44b489c-78df-4273-968b-49d3f80bd4e3@intel.com>
In-Reply-To: <b44b489c-78df-4273-968b-49d3f80bd4e3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5249:EE_|BL4PR11MB8824:EE_
x-ms-office365-filtering-correlation-id: 4da774fa-f2a1-4952-cbe3-08defc8138ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: xi3lZzJvenIzFgiIhuW07EMlGQ83wwMOhq1hi/2/WItv96T2ugU+eYMnS3AhNtBjklbZLtQgKhdaS1uREVFTPKftD0ZjilYV+bebR9iS89wqJFLezrAIaqz7pqS+TZLoBxVUctAgxTyYHfyGbtpK3HHPqRZkxZ8hR2BLARmWX38DJfzR3+u+69SxyON+lb+4rs8s0fbVtJRwtdC/i0sW54IbqH9aavNYBVDpXZML93DXkHkvW5mYp9BxCelAT5d48y7TaUoQIJeQt1v1rGPZLn1q3FHC6HvIKvRyKl1jaKj63r6ZQc7B8aMo621scB7VUnoXHSoThwP8G2fTEBna3i+EEvUVSwcQHqXqmellLAiA3VRgSH1kDrn/Uhuz8AfHyZKOmmzGpQ1EwS3jaxHoK0N3J/fO11M+Nx1MdfJhLUQfPsZXqpzIJiKM1XaXEE8Ot0MC+pU3tDQWquQPUOH3PhPIe6+lic+BOiuPQKOZ8RhKPZQv6E37oPpzXaM4CniS1+Mx9UqJkzNjtSAzQL9XKpMZ8PzT1GqLqL/cM3wXCHlVE/MCLqREjFtlIw+GA7s9Lg3U0gOBdsJ2QC1orQuGIbUKhaZCFEYnBXyXMTazTcdDOSRaev8FmZB6SCxIzIniae2pemN7oJFl67T/i9XElJnxTOxOgx051xJ38hIy8ro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1u2OZq1shJV6QvfQSGWCKvimVV9G135Wf4W+DA6dcOe44BCIkvZVzZYrVB?=
 =?iso-8859-1?Q?tGKApxM6JX5dWqtnSBAuQW5SiVUHNuJRw8pyMx7Ca/w4+ABYMixYx17ady?=
 =?iso-8859-1?Q?IVYgVh7pZddpXqgNdgseYm2NLYka0IS4WzPrnIwKPmmz0Rueqh9rvzFhBJ?=
 =?iso-8859-1?Q?aA6Iq0aTc858130mbP/tvom5mBTarrI4iL+Ak47MTSamn7EiW1rkz5ZXk9?=
 =?iso-8859-1?Q?lw5AecQiOrRVuZYzLbuI+wFIRORG7euQqhGB4BeLBWp7WQsu9EjE4T19Ny?=
 =?iso-8859-1?Q?+RDd00Qz9k2IecngiqnCBAfLTuaC2V0Tr7Jnn83nuPbzNckG9wzNnMHN6h?=
 =?iso-8859-1?Q?plCmvdwpJE1LtrOk7Kv77Vy/R1OiXETzAG1Nzo2zoDco9Xe842zzYhVlqh?=
 =?iso-8859-1?Q?woz1nWx5Tm925GMFEVoWETjOGnBWv9SHvQzfgdFSOkTlyd+ckkz/phnLQw?=
 =?iso-8859-1?Q?H0r72sugMOo3V/TimHd82R34nYPpSr25/Le7liPjzziMfuM91O35mGic/c?=
 =?iso-8859-1?Q?VDyRK9QzSPjs3hf5zDjzHvQgccTKyvh45xjtMGNiH2Fi9mQJF0F/JogBpu?=
 =?iso-8859-1?Q?cfkq/+YuxT1j8IyaNmBHaY7RKOXK1OJq9NMnPk0p7XL1aBs3Bh+R6wjES1?=
 =?iso-8859-1?Q?iNPpsc5tnlUGlbh2LJNW6QCm70+rURX4Er5BE8evrIpahHlXw0Oag2Levh?=
 =?iso-8859-1?Q?QF6+NWsSJopJ0EQ9TyKgeE0aWXwi68TBecP7MzFfxg7wxqHhrQTTBxdTb1?=
 =?iso-8859-1?Q?VqQbmtJmBH6Cqti9QCpKdWevog8XlzLDTo25wGyEmBUobhxYrfbGfOtzgR?=
 =?iso-8859-1?Q?51Tkd4Py3STOA25bcHpVbVyhY5HN3Q6tXtko7VyVuAovYcYoK7KWscxZdS?=
 =?iso-8859-1?Q?Fs7BBV9+cESQsVhn6zEFWSx+JFCxer3oic+RK22UnJsyC+kswbPqTLr3iK?=
 =?iso-8859-1?Q?p8A2QVWffXlZrANOAdteDqXD/CSNznr+aYATW94b+wYKwAMXjUtfDX02Vz?=
 =?iso-8859-1?Q?Z58/VZH0F1lMJpNs6iPhJumZv0AH60JRKhZIg7+WcIFKB0rmBAaSuNe7sg?=
 =?iso-8859-1?Q?CRjA17OacHW4w3VrqB1Ua3tTavhiyq4AIi/nYUYPAqDWJ1mgUoUkd1uzDU?=
 =?iso-8859-1?Q?o3HkwSF9aimFuWgJsdc8b1Nr9tDJ4XF/Zm8UU41tlYppPKGUvXA3iqcWPa?=
 =?iso-8859-1?Q?Iv0GdCP+LbXKJFbw4ZWH/cNbYt4e5DRJROXKsaYGWL1vMNikt/o+VAhQKx?=
 =?iso-8859-1?Q?UM0wRJgMPWD0gE4y8Eb9tYVWvnSt63nbRKNB5FSGyuG66qCSihXdIVNIRS?=
 =?iso-8859-1?Q?ICRzElDafC2uLCIatHagzXbruTAph6upiQdUaEE2+raPWwJRfQiY0ZG4Vp?=
 =?iso-8859-1?Q?X283f9qabJEtN4/zZNnmKAUeXUEq6Sv99eAgKbVKVe2VDux2on4Wm+TRU5?=
 =?iso-8859-1?Q?LSw/MsnAGfTHzo+WFKslscpA80bHjECvIyAr6k6YlxWhUq0b8uDrkNgv94?=
 =?iso-8859-1?Q?oGNwzhGFq8ciFuoYn01JY2FYSxmWvg36I4OzpXmadmN6S8sh47iwzFhsWG?=
 =?iso-8859-1?Q?7H8uXR+UnGzclsrfZwwnENxHf2v/9f2cmG8SaW3Gztfu0WZbLIdF1y6EFi?=
 =?iso-8859-1?Q?qACOI5fm0bub32U/QqKhajQCf4D1OXfYcl9hrsUR/z1bJsa/bONQbbRvBH?=
 =?iso-8859-1?Q?HgDVeEU7aNWg+3GgOA9RfkqGaXMc3pZPe8KW5bg7NpIw7Xc4PKRNAEvNcR?=
 =?iso-8859-1?Q?TlE5nc06TM6qcETvbF1st5+O9pFu2e+DytFHPsxo0f6OBj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iPJD5fKngyq1Tgal/Vx1Cbi+9trhi65uomKhhV9IdSPJD3e5KwAY9A/n17LK7ME7jTg7nm+v5AnxuPFvsZcu+KBXSNf+N/ezUo6Gt4g2V3qWBB8OsjzG3FyLBpqzFjA/qe1eIhi4tDJZEr/XT/1eR3z7dE8JSrzsHHAsrXH9iC0uryz3t36M34Dz0CUQHWWnAERuoUmlxDHt/cicbgEDWmUbEf3t6NNX2tz4aJtE4zBRbim437HtjlcEwb/2Q35DH+KMqZtznJuHowakpss9jMZexTebun6t+DYYq9tAYEMJFVP+CIu80Y/5d3ElxBLzLSENNtwl30lte33wTphtAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da774fa-f2a1-4952-cbe3-08defc8138ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 17:01:46.8768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ck0Oi4Psxae0qtf2bVZT22hepQwylDxJhA2LERzA4X4950Hyjd5M/tr+PQKauJFqFlPNfo9RYbts3rNoBacWsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

________________________________________=0A=
From: Nilawar, Badal <badal.nilawar@intel.com>=0A=
Sent: Tuesday, August 11, 2026 6:41 PM=0A=
To: Poosa, Karthik <karthik.poosa@intel.com>; intel-xe@lists.freedesktop.or=
g <intel-xe@lists.freedesktop.org>=0A=
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman <anshuman.gupta=
@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@=
intel.com>; Anirban, Sk <sk.anirban@intel.com>; Koujalagi, Mallesh <mallesh=
.koujalagi@intel.com>; Purkait, Soham <soham.purkait@intel.com>=0A=
Subject: Re: [PATCH v2 2/9] drm/xe/hwmon: initialize fan-control backend an=
d table cache=0A=
=0A=
=0A=
=0A=
=0A=
On 17-07-2026 09:47, Karthik Poosa wrote:=0A=
=0A=
> Initialize Xe hwmon fan-control support by detecting fan count,=0A=
=0A=
> reading stock fan control points and min PWM.=0A=
=0A=
>=0A=
=0A=
> v2:=0A=
=0A=
>=A0=A0 - Avoid user table initialization during probe. (Badal)=0A=
=0A=
>=A0=A0 - Move unused code to appropriate patches.=0A=
=0A=
>=A0=A0 - Use xe helpers for dmesg logs.=0A=
=0A=
>=0A=
=0A=
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>=0A=
=0A=
> Assisted-by: Codex:gpt-5-4=0A=
=0A=
> ---=0A=
=0A=
>=A0=A0 drivers/gpu/drm/xe/xe_hwmon.c=A0=A0=A0=A0 | 159 +++++++++++++++++++=
++++++++---=0A=
=0A=
>=A0=A0 drivers/gpu/drm/xe/xe_pcode_api.h |=A0=A0 5 +=0A=
=0A=
>=A0=A0 2 files changed, 149 insertions(+), 15 deletions(-)=0A=
=0A=
>=0A=
=0A=
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c=0A=
=0A=
> index de3f2aeffc3f..0a416e3e7b8c 100644=0A=
=0A=
> --- a/drivers/gpu/drm/xe/xe_hwmon.c=0A=
=0A=
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c=0A=
=0A=
> @@ -20,6 +20,7 @@=0A=
=0A=
>=A0=A0 #include "xe_pcode_api.h"=0A=
=0A=
>=A0=A0 #include "xe_sriov.h"=0A=
=0A=
>=A0=A0 #include "xe_pm.h"=0A=
=0A=
> +#include "xe_printk.h"=0A=
=0A=
>=A0=A0 #include "xe_vsec.h"=0A=
=0A=
>=A0=A0 #include "regs/xe_pmt.h"=0A=
=0A=
>=A0=A0=0A=
=0A=
> @@ -122,14 +123,50 @@ struct xe_hwmon_energy_info {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 long accum_energy;=0A=
=0A=
>=A0=A0 };=0A=
=0A=
>=A0=A0=0A=
=0A=
> +enum fan_table_type {=0A=
=0A=
> +=A0=A0=A0=A0 /** @STOCK_FAN_TABLE: firmware-provided fan table */=0A=
=0A=
> +=A0=A0=A0=A0 STOCK_FAN_TABLE,=0A=
=0A=
> +=A0=A0=A0=A0 /** @USER_FAN_TABLE: user fan table written through sysfs *=
/=0A=
=0A=
> +=A0=A0=A0=A0 USER_FAN_TABLE,=0A=
=0A=
> +=A0=A0=A0=A0 /** @FAN_TABLE_MAX: number of fan table slots tracked per f=
an */=0A=
=0A=
> +=A0=A0=A0=A0 FAN_TABLE_MAX,=0A=
=0A=
> +};=0A=
=0A=
> +=0A=
=0A=
> +/* Maximum number of fan control points supported by each fan */=0A=
=0A=
> +#define MAX_FAN_CONTROL_POINTS=A0=A0=A0=A0=A0=A0 (10)=0A=
=0A=
> +=0A=
=0A=
> +/* Fan control point index: bit31 selects fan table type; bits30:0 contr=
ol point index */=0A=
=0A=
> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) |=
 \=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((POINT_NUM) &=
 REG_GENMASK(30, 0)))=0A=
=0A=
> +=0A=
=0A=
> +/* PCODE operations timeout for fan control commands */=0A=
=0A=
> +#define XE_PCODE_FAN_CONTROL_TIMEOUT_MS=A0=A0=A0=A0=A0 (10)=0A=
=0A=
> +=0A=
=0A=
>=A0=A0 /**=0A=
=0A=
> - * struct xe_hwmon_fan_info - to cache previous fan reading=0A=
=0A=
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state=0A=
=0A=
> + *=0A=
=0A=
> + * Each fan keeps the latest tachometer sampling state along with two fa=
n=0A=
=0A=
> + * tables: the stock table discovered from firmware and the user table m=
anaged=0A=
=0A=
> + * by hwmon sysfs writes.=0A=
=0A=
>=A0=A0=A0 */=0A=
=0A=
>=A0=A0 struct xe_hwmon_fan_info {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /** @reg_val_prev: previous fan reg val */=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 u32 reg_val_prev;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /** @time_prev: previous timestamp */=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 u64 time_prev;=0A=
=0A=
> +=A0=A0=A0=A0 /** @fan_table: fan control tables */=0A=
=0A=
> +=A0=A0=A0=A0 struct fan_table {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /** @fan_control_point_count: numbe=
r of supported fan control points */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 fan_control_point_count;=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct fan_control_point {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /** @temp: =
temperature in degree celsius */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 temp;=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /** @speed:=
 fan speed in percentage */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 speed;=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } fcp[MAX_FAN_CONTROL_POINTS];=0A=
=0A=
> +=A0=A0=A0=A0 } fan_table[FAN_TABLE_MAX];=0A=
=0A=
> +=A0=A0=A0=A0 /** @min_pwm: minimum fan PWM */=0A=
=0A=
> +=A0=A0=A0=A0 u32 min_pwm;=0A=
=0A=
>=A0=A0 };=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0 /**=0A=
=0A=
> @@ -168,6 +205,8 @@ struct xe_hwmon {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 int scl_shift_time;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /** @ei: Energy info for energyN_input */=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct xe_hwmon_energy_info ei[CHANNEL_MAX];=0A=
=0A=
> +=A0=A0=A0=A0 /** @num_fans: number of fans available */=0A=
=0A=
> +=A0=A0=A0=A0 u8 num_fans;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /** @fi: Fan info for fanN_input */=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct xe_hwmon_fan_info fi[FAN_MAX];=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /** @boot_power_limit_read: is boot power limits rea=
d */=0A=
=0A=
> @@ -856,17 +895,100 @@ static int xe_hwmon_pcode_write_i1(const struct xe=
_hwmon *hwmon, u32 uval)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 (uval & POWER_SETUP_I1_DATA_MASK));=0A=
=0A=
>=A0=A0 }=0A=
=0A=
>=A0=A0=0A=
=0A=
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon,=
 u32 subcmd, u32 *uval)=0A=
=0A=
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon,=
 u32 subcmd, u8 fan_num,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 *uval)=0A=
=0A=
>=A0=A0 {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct xe_tile *root_tile =3D xe_device_get_root_til=
e(hwmon->xe);=0A=
=0A=
> +=A0=A0=A0=A0 return xe_pcode_read_timeout(root_tile, PCODE_MBOX(FAN_SPEE=
D_CONTROL, subcmd, fan_num),=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 uval, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);=
=0A=
=0A=
> +}=0A=
=0A=
> +=0A=
=0A=
> +static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_=
fans)=0A=
=0A=
> +{=0A=
=0A=
> +=A0=A0=A0=A0 u32 fan_mask =3D 0;=0A=
=0A=
> +=A0=A0=A0=A0 int ret;=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 /* Platforms that don't return correct value */=0A=
=0A=
> -=A0=A0=A0=A0 if (hwmon->xe->info.platform =3D=3D XE_DG2 && subcmd =3D=3D=
 FSC_READ_NUM_FANS) {=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *uval =3D 2;=0A=
=0A=
> +=A0=A0=A0=A0 if (hwmon->xe->info.platform =3D=3D XE_DG2) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *num_fans =3D 2;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
>=A0=A0=0A=
=0A=
> -=A0=A0=A0=A0 return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTRO=
L, subcmd, 0), uval, NULL);=0A=
=0A=
> +=A0=A0=A0=A0 ret =3D xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM=
_FANS, 0, &fan_mask);=0A=
=0A=
> +=A0=A0=A0=A0 if (ret) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_warn(hwmon->xe, "failed to read =
number of fans, ret=3D%d\n", ret);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
=0A=
> +=A0=A0=A0=A0 }=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0 *num_fans =3D min_t(u32, hweight32(fan_mask), FAN_MAX);=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0 return 0;=0A=
=0A=
> +}=0A=
=0A=
> +=0A=
=0A=
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)=0A=
=0A=
> +{=0A=
=0A=
> +=A0=A0=A0=A0 struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon=
->xe);=0A=
=0A=
> +=A0=A0=A0=A0 int point;=0A=
=0A=
> +=A0=A0=A0=A0 int fan;=0A=
=0A=
> +=A0=A0=A0=A0 int ret;=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0 for (fan =3D 0; fan < hwmon->num_fans; fan++) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 stock_fcp_count =3D 0;=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct xe_hwmon_fan_info *fi =3D &h=
wmon->fi[fan];=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D xe_hwmon_pcode_read_fan_con=
trol(hwmon,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 FSC_READ_STOCK_FAN_CONTROL_POINTS,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 fan, &stock_fcp_count);=0A=
=0A=
=0A=
=0A=
Is stock fan table going to change after late bind? If yes, then I will=0A=
=0A=
suggest to maintain one more table.=0A=
=0A=
Or Update the current one once late binding is done.=0A=
=0A=
=0A=
=0A=
Thanks,=0A=
=0A=
Badal=0A=
=0A=
-> Yes late binding updates the stock table, I feel we should update the ex=
isting stock table, which I am doing in patch=0A=
https://patchwork.freedesktop.org/patch/740797/?series=3D168027&rev=3D2 =0A=
=0A=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_err(hwmo=
n->xe,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 "failed to read fan %d stock control point count, ret=3D%d\n",=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 fan, ret);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi->fan_table[STOCK_FAN_TABLE].fan_=
control_point_count =3D=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 min_t(u8, stock_fcp_count, MAX_FAN_CONTROL_POINTS);=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_dbg(hwmon->xe, "fan %d stock poi=
nts %u\n", fan,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi->fan_table[=
STOCK_FAN_TABLE].fan_control_point_count);=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Dump the stock fan control point=
s for debugging purposes. */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (point =3D 0; point < fi->fan_t=
able[STOCK_FAN_TABLE].fan_control_point_count;=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 point++) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 fcp =3D=
 0;=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fcp =3D FCP=
_INDEX(STOCK_FAN_TABLE, point);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D xe_=
pcode_read_timeout(root_tile,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 PC=
ODE_MBOX(FAN_SPEED_CONTROL,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 FSC_READ_FAN_TABLE, fan),=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &f=
cp, NULL, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=
=3D%d\n",=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fan, point, ret);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 continue;=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Cache th=
e stock fan control points in local structure for later use. */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi->fan_tab=
le[STOCK_FAN_TABLE].fcp[point].temp =3D=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 REG_FIELD_GET(=
FAN_CONTROL_POINT_TEMP_MASK, fcp);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi->fan_tab=
le[STOCK_FAN_TABLE].fcp[point].speed =3D=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 REG_FIELD_GET(=
FAN_CONTROL_POINT_SPEED_MASK, fcp);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_dbg(hwmo=
n->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Read minimum fan PWM */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D xe_hwmon_pcode_read_fan_con=
trol(hwmon, FSC_READ_FAN_MIN_PWM, fan,=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 &fi->min_pwm);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_err(hwmo=
n->xe, "failed to read fan %d min PWM, ret=3D%d\n", fan, ret);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_dbg(hwmon->xe, "fan %d min PWM %=
u\n", fan, fi->min_pwm);=0A=
=0A=
> +=A0=A0=A0=A0 }=0A=
=0A=
> +=A0=A0=A0=A0 return 0;=0A=
=0A=
>=A0=A0 }=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, in=
t channel,=0A=
=0A=
> @@ -1279,17 +1401,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 =
attr, int channel, long *val)=0A=
=0A=
>=A0=A0 static umode_t=0A=
=0A=
>=A0=A0 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int chann=
el)=0A=
=0A=
>=A0=A0 {=0A=
=0A=
> -=A0=A0=A0=A0 u32 uval =3D 0;=0A=
=0A=
> -=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (!hwmon->xe->info.has_fan_control)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 switch (attr) {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 case hwmon_fan_input:=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (xe_hwmon_pcode_read_fan_control=
(hwmon, FSC_READ_NUM_FANS, &uval))=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=
=0A=
=0A=
> -=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return channel < uval ? 0444 : 0;=
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return channel < hwmon->num_fans ? =
0444 : 0;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 default:=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
> @@ -1476,6 +1593,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *=
hwmon)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 u64 val_sku_unit =3D 0;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 int channel;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct xe_reg pkg_power_sku_unit;=0A=
=0A=
> +=A0=A0=A0=A0 u32 num_fans =3D 0;=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (hwmon->xe->info.has_mbx_power_limits) {=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Check if GPU firmware sup=
port mailbox power limits commands. */=0A=
=0A=
> @@ -1531,10 +1649,21 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon=
 *hwmon)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (xe_hwmon_is_visible(hwmo=
n, hwmon_energy, hwmon_energy_input, channel))=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_h=
wmon_energy_get(hwmon, channel, &energy);=0A=
=0A=
>=A0=A0=0A=
=0A=
> -=A0=A0=A0=A0 /* Initialize 'struct xe_hwmon_fan_info' with initial fan r=
egister reading. */=0A=
=0A=
> -=A0=A0=A0=A0 for (channel =3D 0; channel < FAN_MAX; channel++)=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (xe_hwmon_is_visible(hwmon, hwmo=
n_fan, hwmon_fan_input, channel))=0A=
=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_hwmon_fa=
n_input_read(hwmon, channel, &fan_speed);=0A=
=0A=
> +=A0=A0=A0=A0 if (hwmon->xe->info.has_fan_control) {=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_hwmon_get_num_fans(hwmon, &num_f=
ans);=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_info(hwmon->xe, "Number of fans =
detected: %u\n", num_fans);=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hwmon->num_fans =3D num_fans;=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Initialize 'struct xe_hwmon_fan_=
info' with initial fan register reading. */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (channel =3D 0; channel < hwmon=
->num_fans; channel++)=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (xe_hwmo=
n_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Fan control tables initializatio=
n */=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (xe_hwmon_read_fan_control_info(=
hwmon))=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xe_warn(hwm=
on->xe, "Fan control tables are not available\n");=0A=
=0A=
> +=A0=A0=A0=A0 }=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon=
_pcode_read_thermal_info(hwmon))=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_warn(&hwmon->xe->drm, "T=
hermal mailbox not supported by card firmware\n");=0A=
=0A=
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pc=
ode_api.h=0A=
=0A=
> index 94575c476e3d..669010f1e2d0 100644=0A=
=0A=
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h=0A=
=0A=
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h=0A=
=0A=
> @@ -85,6 +85,11 @@=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0 #define=A0=A0 FAN_SPEED_CONTROL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x7D=0A=
=0A=
>=A0=A0 #define=A0=A0=A0=A0 FSC_READ_NUM_FANS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x4=0A=
=0A=
> +#define=A0=A0=A0=A0 FSC_READ_STOCK_FAN_CONTROL_POINTS=A0=A0=A0=A0=A0=A0=
=A0 0x5=0A=
=0A=
> +#define=A0=A0=A0=A0 FSC_READ_FAN_TABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x7=0A=
=0A=
> +#define=A0=A0=A0=A0 FAN_CONTROL_POINT_TEMP_MASK=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 REG_GENMASK(7, 0)=0A=
=0A=
> +#define=A0=A0=A0=A0 FAN_CONTROL_POINT_SPEED_MASK=A0=A0=A0=A0 REG_GENMASK=
(15, 8)=0A=
=0A=
> +#define=A0=A0=A0=A0 FSC_READ_FAN_MIN_PWM=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x8=0A=
=0A=
>=A0=A0=0A=
=0A=
>=A0=A0 #define PCODE_SCRATCH(x)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 XE_REG(0x=
138320 + ((x) * 4))=0A=
=0A=
>=A0=A0 /* PCODE_SCRATCH0 */=0A=
=0A=
