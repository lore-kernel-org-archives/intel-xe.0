Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E92EC2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 15:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5410E425;
	Fri,  7 Aug 2026 15:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7Hq/2rC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3EC10E425
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786115765; x=1817651765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Qh4I/8bCRE+VFwqAmQ//LfgX4jTM7o4o3PYk9dKdpg=;
 b=H7Hq/2rCb7M81XHYrkjLgiHhGH/QyEwXx9BOdggfSnMo25qz4CqJP9Uo
 dMTX+Hfc5vjJoghqqT17evcRXMPcs6VdGmOOTVZ4yAX1VHy9+nw5LMmsK
 FtM+38P+t18F+OvjaK1+zBnzXWkiQf6J4qe5eNvEssM3TbNcrAsptY5PJ
 mnV5KCX+xxzqfjmiCnL3186e1+y0QdIXV3gfazUCEnPs0yIQqEbilL3ti
 gT2k6UiOWTWSr60Z55sIqvlCvE0BBpJ7KHcjHo6P7n/2p2aOSQxI6bJwY
 KYQtXR2ZB0O7Cyh4sCoFKRtsX4wCdSBk+oNbfZ9MSPhicIL/wvAbhCKu2 Q==;
X-CSE-ConnectionGUID: n54kAP4EQAix3LNOcurhuA==
X-CSE-MsgGUID: Z2FhVcjMR8uem7v8Tv5GWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97076792"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97076792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 08:16:05 -0700
X-CSE-ConnectionGUID: oaHIKlWHSOWtxmTVLtgyZg==
X-CSE-MsgGUID: /+RZnyDIQi2UqVaeyoFI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260660590"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 08:16:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 08:16:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 08:16:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 08:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsQYworQMLeA9TlYCbteTJzv48rvs8hE9A/xUjLVjMi4kZmWBnuryPKRoGuaJJJ521MG6ntmNkTIkX2gWtqRtNp3+tgvp+ixrySpAjNrOSrYrBRT/DBZQJGqLAD3TCez4vl6nsZmcZvYXFKOsvGpfw1Wo1lg9d3cy6v2t/qrXg4XNzQweU5AI7Lot3k27p/wbOXJfn6+CogTkmjXKxSCDREvS9ARN6dIErB6g7vpnInokTihW9HHTxC3/gDLOWNr99+8CufokM4R/TRGfv+CPZINyX4SUCoi+INT49G53x7SU7u0+HpasCPWCe2jdeq6WysXOkOdT8jzKgFl9fcw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt98kWJf7Hbo/g6hZwP4TdmEWpGvFxBh46fx04UTzZA=;
 b=A8xqXEh09TVo9mHawTmrxkzsuw92JeFhhI0TdMWld7cNWETHi7w7P9l1Vy146olGZKrq4QOE1Ba2+kwqAPxkJ1pSkRlrSh86N2AyDJVIGU65iIj383svN+koRYH45YqLziCgUaWSW7EkUEbxBM2PKz8ncJ0it86HzsplJOrcaQak2uR3IhncKCBDXd7e5ctjoH+jYQpBp0S+SRlkFd/u7+qrWTnup0xu9B1C8nOZ+6zJPn336PRFlxcUoYRmg7X+UGiFQDlcuIUAyFebQWsAmo74wGxtT16WHkl08GOsuMpCf5ATF7+qiQ/nHU2CGWbGN+iOzl5v6ezOQL0k4pRJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 15:16:01 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 15:15:59 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Thread-Topic: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Thread-Index: AQHdJnz89vYmmURWeEaZ0i4tgg/UObaSsTKQ
Date: Fri, 7 Aug 2026 15:15:59 +0000
Message-ID: <BN9PR11MB5242AF76995E0453ABF7878A95D12@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-10-anoop.c.vijay@intel.com>
In-Reply-To: <20260807145621.2938848-10-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|CO1PR11MB5121:EE_
x-ms-office365-filtering-correlation-id: 2b5ee642-bb51-4c90-0db7-08def496c93d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|3023799007|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info: GUZjW8fhutm7lijIBPrHJa/Ync0x5Oe2s/vWzf8XMGDBExsyaSQLvfFRGMURcoZ5S85ICAhjdoQ6RlOtPRrpQTTrg3QTbohFKCKp77GfHAintvXd4HUQxeLfXe/NUiK9WZM2hw/KXuWfe/MPgBKEvLSryMen1RY0vu2O1B92ZB1I4nL/KE1f2Ch1rkr0Zx180s/AU9/FwTOku5XSi8kdYLFbVCBgxpz3BX9tH7jkc1ULArbAGZnH3Vcv+uLzDnf1+lf8i/7bCH3CkhB7MAX/DD4SQe18x+h7OHjU4Hk+gpiguHasUx2folMeiQceGBLy1WIrjEApSMkLEOcU18fIbeo0/mBP89PGohAQ7BAfRzP+IcLRrST9R9J3oough3bF2TDe73ss6JsbFt9MJ62SD8dYA5nu/fEvNiAYCwSD2gy8vDqpf0cB5Q/oRRORL2TdvsnGQWd+/uZTcdx4VXyR8HxKcavavx6NwlLMsNo94zNSYuT5jPgJifXqfsZZ49+yqh5lwJ4Yxhcgw7GkuX28yVdfgt2MZvRVznJQ9YlY+i0xxBnu/q1ZY0jYxl7ifLK95v1WvEI58X33BrOTgg3ty9+XP/ei56dVJ48UvmxUXhC/LXk6TUhnGaNQf02mjmVhIh8IIi6E1bLFFGdQgAOxDYQwBVtzHnq3yggFNU8munr+EmKvXexYDKOnOkgIOzo4PB21qDi45ohuO5zjgnoqLFkfM+f/V8+WJjVPmbK4IvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(3023799007)(38070700021)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rVkVGvFJQmdhbcbw3xGN5dN0x76fFSi3iHW7kPW5Lb9GKC013ZBnZ32tcWNW?=
 =?us-ascii?Q?bN5Cwc8ugY4AJrkpG4TZzjGxqQ0+qosz3bu8s78i6i1q3/hru6tjMSyt/5ws?=
 =?us-ascii?Q?UmMm4xK9TKnCgXssp1r1PhVstF4zkc/I7E1zY+quSGiTPO0MKbbzgjY7IP4W?=
 =?us-ascii?Q?OZt69WmPm8GYYrw07o+SJcJ3RTIIOdWTaxJgxljh/d5dQN+8WElSk5jemoHw?=
 =?us-ascii?Q?Tp+stFtUW/mU58v2oqHXYhOUMZNIeJENa8HRNuvR/yrDGw7c6pyXXB0tWukf?=
 =?us-ascii?Q?+GAEuZqtmmegeQw1Btk9Erv9SAaZQWnmpB30MwciAv3XljUk9wDZW3YnXLMd?=
 =?us-ascii?Q?6uAuM6OHChhm2GLld5rMtxNvVrSyu8qHjAFxPF4mCySAI9OsaDHv7wQKiDL7?=
 =?us-ascii?Q?WU2Rg2oxeypfZjGmt2h3RHZsjTZS0sBpKz1fsRFA2q8jVG54PruPJ9GFjH4K?=
 =?us-ascii?Q?M82IypjvsW6g+5yKw0Yn8KmMSPP+EbNSPwymXXMvAf1UknEWU00CCNFp4rFa?=
 =?us-ascii?Q?zAQVckNtNUiS3+BYJeSEBHaTH+oKeWgWzJ9aDQ6hScjy4U2uufOibQz+juUc?=
 =?us-ascii?Q?5t+/oOnITEpC1aD0FtKODqpqHnK1pIxHRYR+UuAthLq1614lh6KtdJcGtYis?=
 =?us-ascii?Q?/wNxvyX+A0+k1raT3N8fXnV+t5+W90hxpERA/JwgmV+ZYeMcxRe3NAwXjyU6?=
 =?us-ascii?Q?vd6lYHnswQOJ6EZ8hNcjMXohwfyTdmy3p3R9FVsUcZpTayIuwhzeb4UENdcA?=
 =?us-ascii?Q?gnCicE7jQtExyKKQsx0ywuQrh8pwjYH1guwXNLYu8DOyRsC+RJtZ/KFwFZ4S?=
 =?us-ascii?Q?aTOPi3U0LLl6zkjaaDL3Mg2T9Wne+VPizTtip05NTWVAbTfitXJDicWS3Py5?=
 =?us-ascii?Q?ulrNjia7EiSaxyA4CntAF/lOTET/FU3/sW//cSI4i9tH74K6xMMsVMPo731+?=
 =?us-ascii?Q?Mjwv7Zh6qC4zJvPTPW0lXBl9Kphxeyc00vtix3/E0yyrFFFfQaqNq0ArI6CA?=
 =?us-ascii?Q?fyeKxRs1NTGtwY33I2aiYcmXBKB8KRyFmO8wMe4P05V1i0j3pBpl2arWbAzA?=
 =?us-ascii?Q?AGVn9Hiho2/RndrG6ZozZsD5xKYgYXOm491sutMQOG2vZmvDuB7HBm/E9Blc?=
 =?us-ascii?Q?T/DHj9k4oj5Lz0pVJ5QYTOUrvtASjcIjDDDjenS6IrXRa62+RQzoSUK0tdjD?=
 =?us-ascii?Q?fmbsXq+ueblsgLnU4u4mfftHKSp76M8WqGO9YvrETZtM+WTWhUaAjYuxQmGR?=
 =?us-ascii?Q?w5EAUFt0rKuolKkdjQJHiu0Xi2Nag1ctbJWjBrcFShs5wuKOZLbz6JNLH7GH?=
 =?us-ascii?Q?XlgZwKEPSpehUDES8urT/wIEbFCJOxsslhLpN3HkKP5Yab+UaPfj2e2Vr/X2?=
 =?us-ascii?Q?zS8ovuEyIVK+ZzOvrWOjNTGA2XUhDVsbmmhAo9ruephorXWJtKqijkN5+MXM?=
 =?us-ascii?Q?7ZxiD+D+r7J3ig1zaOvQdeCJsuPWkbEIM7f6pbqG57A2akIWKI+cQK+a6r3d?=
 =?us-ascii?Q?XRmG+1jP1MCkjyQjYX/M0lfGie9Q5Xs+1pgVV+BivEPrzkPTZtfy76lKL1Gy?=
 =?us-ascii?Q?EJOLJioWJrMJkmH5vZb42bXiW4Nta2tN1Lvk1Mwbdk4tzroVufwOewQRQe3h?=
 =?us-ascii?Q?KtKpSxdsiKUYUxfjY8dgeIMUcfx0COXIV0HARNNuMZnPgr6Y6eYG2+h0H7gK?=
 =?us-ascii?Q?NN4IXGEZixWeDpeh2WSqaONozZOE5QBNa71vCw9SEzoZn1/0sx5awEnmdNkV?=
 =?us-ascii?Q?tx4Kjz+31A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DvCw2OwJVyJJXFUCF+cqhruTrB4856e/L7EYYivJ2Sga1Uck6pwvGhgd+xL7oVgkCxG7KaSf2sm52sdVVf51QFWvkDnT7XqLmPoXnlKCDPZfZdSDjYf6mrOX9xlv80zQGEUN2yLH0Isqjd6iimBRdQ+KHyBCJaowSr0LM5YKFWmhGxoEXF2RHfFyx0lP5giDGBjTOObAaGsgCSIgkd5Q0NC1xw2NndpgRYGlWXGoutU7/gJFBVq4HO8pr0Zxez1dEKSDmzEfgWRi5YPjDz5wgDLvqzG917lW8YLQZEm/4R049X2OppgmAD4T/hfG3LIPjl/Ug0DxwHg1a0+pZwkYOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5ee642-bb51-4c90-0db7-08def496c93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 15:15:59.1385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nh8ycG1UQge5luejRyUaWgna0hJh4NvlKtzqYPrFdPJlmBHUvaLC59yA08b7FqIICsUXqD7tBZ8inxm+6+j2YNViqaeHiQfj3tsZfch0b8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
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
> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
> Sent: Friday, August 7, 2026 8:26 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
> Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
> <kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
> Subject: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
> interface
>=20
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Add debugfs interface for exercising System Controller's RAS error inject=
ion
> command, used to validate RAS error detection and recovery paths.
>=20
> Command details:
> - Group ID: 0x02 (diag group)
> - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
> - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
>              > /sys/kernel/debug/dri/0/sc/ras_error_inject
>          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
>=20
> This command requires the diag application to have completed firmware
> boot and initialization (late-bind loaded); writes are rejected with -ENO=
DEV
> until xe_sysctrl_is_diag_fw_ready() reports the diag firmware as ready.
>=20
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 123 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
>  3 files changed, 157 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index 2144d9d43fba..7b8846d739cb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/uaccess.h>
>=20
>  #include "xe_device.h"
> @@ -122,6 +123,124 @@ static const struct file_operations
> xe_sysctrl_loopback_fops =3D {
>  	.release =3D single_release,
>  };
>=20
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, cons=
t char
> __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) =3D NULL;
> +	struct seq_file *m =3D file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +	struct xe_device *xe =3D sc_to_xe(entry->sc);
> +	struct xe_sysctrl_diag_ras_err_inj_req req =3D {};
> +	struct xe_sysctrl_mailbox_command cmd =3D {};
> +	u8 resp_hdr_only[sizeof(u32)];
> +	unsigned int nfields =3D 0;
> +	char *token, *tmp;
> +	unsigned long val;
> +	size_t out_len =3D 0;
> +
> +	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
> +		xe_err(xe, "sysctrl: diag firmware not ready, cannot inject RAS
> error\n");
Wild thought,=20
How it would be register the debugfs only if  diag firmware is loaded ?
That way nobody will be having access to these debugfs ?=20

Thanks,
Anshuman.

> +		return -ENODEV;
> +	}
> +
> +	if (len =3D=3D 0 || len >=3D PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf =3D kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] =3D '\0';
> +
> +	tmp =3D kbuf;
> +	while ((token =3D strsep(&tmp, " \t\n")) !=3D NULL) {
> +		if (*token =3D=3D '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;
> +
> +		switch (nfields) {
> +		case 0:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.ras_block_id =3D val;
> +			break;
> +		case 1:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.ras_sub_block_id =3D val;
> +			break;
> +		case 2:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req.err_type =3D val;
> +			break;
> +		case 3:
> +			if (val > U32_MAX)
> +				goto inval;
> +			req.params =3D val;
> +			break;
> +		default:
> +			xe_err(xe, "sysctrl: too many ras_error_inject
> arguments\n");
> +			return -EINVAL;
> +		}
> +		nfields++;
> +	}
> +
> +	if (nfields < 3) {
> +		xe_err(xe,
> +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id>
> <err_type> [params]\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  &req, sizeof(req), resp_hdr_only,
> +				  sizeof(resp_hdr_only));
> +
> +	guard(xe_pm_runtime)(xe);
> +	entry->status =3D xe_sysctrl_send_command(entry->sc, &cmd,
> &out_len);
> +
> +	return entry->status ? entry->status : len;
> +
> +inval:
> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
> +	return -EINVAL;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void
> +*data) {
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +	struct xe_device *xe =3D sc_to_xe(entry->sc);
> +
> +	seq_printf(m, "Command: group=3D0x%02x cmd=3D0x%02x\n", entry-
> >group, entry->command);
> +	seq_printf(m, "Diag firmware ready: %s\n",
> +		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ?
> +"FAILED" : "SUCCESS");
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id>
> <err_type> [params]\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct
> +file *file) {
> +	return single_open(file, xe_sysctrl_ras_error_inject_show,
> +inode->i_private); }
> +
> +static const struct file_operations xe_sysctrl_ras_error_inject_fops =3D=
 {
> +	.owner =3D THIS_MODULE,
> +	.open =3D xe_sysctrl_ras_error_inject_open,
> +	.read =3D seq_read,
> +	.write =3D xe_sysctrl_ras_error_inject_write,
> +	.llseek =3D seq_lseek,
> +	.release =3D single_release,
> +};
> +
>  static void xe_sysctrl_register_entry(struct dentry *root, struct
> xe_sysctrl_debugfs_entry *entry,
>  				      struct xe_sysctrl *sc, const char *name,
>  				      u8 group, u8 command,
> @@ -154,4 +273,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl
> *sc, struct dentry *parent)
>  	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc,
> "loopback",
>  				  XE_SYSCTRL_GROUP_CORE,
> XE_SYSCTRL_CMD_LOOPBACK,
>  				  &xe_sysctrl_loopback_fops);
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc,
> "ras_error_inject",
> +				  XE_SYSCTRL_GROUP_DIAG,
> XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
> +				  &xe_sysctrl_ras_error_inject_fops);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index ed80fe63e1c4..43ae0049b316 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,10 +14,12 @@
>   * enum xe_sysctrl_group - System Controller command groups
>   *
>   * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + * @XE_SYSCTRL_GROUP_DIAG: Diag group
>   * @XE_SYSCTRL_GROUP_CORE: Core group
>   */
>  enum xe_sysctrl_group {
>  	XE_SYSCTRL_GROUP_GFSP			=3D 0x01,
> +	XE_SYSCTRL_GROUP_DIAG			=3D 0x02,
>  	XE_SYSCTRL_GROUP_CORE			=3D 0xFF,
>  };
>=20
> @@ -51,6 +53,35 @@ enum xe_sysctrl_core_cmd {
>  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		=3D 0x05,
>  };
>=20
> +/**
> + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
> + *
> + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection  */
> enum
> +xe_sysctrl_diag_cmd {
> +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		=3D 0x7E,
> +};
> +
> +/**
> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request
> +payload
> + *
> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The
> mailbox
> +layer
> + * prepends the application message header before sending.
> + *
> + * @ras_block_id: RAS block (subsystem) to inject the error into
> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
> + * @err_type: Type of test error to inject
> + * @reserved: Must be zero
> + * @params: Optional injection parameters (default 0)  */ struct
> +xe_sysctrl_diag_ras_err_inj_req {
> +	u16 ras_block_id;
> +	u16 ras_sub_block_id;
> +	u16 err_type;
> +	u16 reserved;
> +	u32 params;
> +} __packed;
> +
>  /**
>   * struct xe_sysctrl_app_status_req - Get application status request
>   *
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 53d82e61383a..3a97a10d1b7d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -68,6 +68,9 @@ struct xe_sysctrl {
>=20
>  		/** @debugfs.loopback: Loopback test entry */
>  		struct xe_sysctrl_debugfs_entry loopback;
> +
> +		/** @debugfs.ras_error_inject: RAS error injection test entry
> */
> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>  	} debugfs;
>  };
>=20
> --
> 2.43.0

