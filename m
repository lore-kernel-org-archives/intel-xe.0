Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037ACC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B876910E321;
	Thu, 17 Jul 2025 21:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh1bCyOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BA210E321
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752787083; x=1784323083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qqU5SLJiNB2F43PZNndJZq9XonbVyR3NBZggkK81/Ac=;
 b=Qh1bCyOVhv9GnL6yGJ0UwPLJKnLsfNqj7nicFJVrJ7gKoJEBRqh8R7Eo
 SdzxCGbTmMsdUG5cyLCPwBzjblrjYrQX+6y1pFJ1gy/roiLFfQQwRkxWG
 MfFP5Wxc4lPEC2JdFYUn1EniL3YVAb2CiN39NyjwvPN5r6Ar7zYhsLit6
 Q84Mp9mnvlSareoLot6BnrGkUTWqYu0pwzsDLzvYFczvDEdyrRwNSkeIG
 I5Xv+BJXD3s5eNiK3okCPsamAkqUGASSYnM1PGDLSC1Fi1sFbOHjLZo3I
 DXLnzdp8eOp2y+m2HlYP1NwwC3b+wQvg7wmHOUQPP7K1g+Z/ZFLcoXAmm Q==;
X-CSE-ConnectionGUID: nIEkErJOQKOVtLR8ixPEvg==
X-CSE-MsgGUID: ckhSWvA1Rp2jppjnMIvONw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="42704648"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="42704648"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:18:00 -0700
X-CSE-ConnectionGUID: 0UT2ZuAIShia1+vjitTZqw==
X-CSE-MsgGUID: 3CYDSulTSWyfxoY1AC27cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="158591121"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:17:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:17:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:17:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGkq1bvP8CoyN029QDBP9hLfnIEFQj31PdEu3dB2PJehL1YwJ6YSgrhehhcbFDt3am9e8DlG+ibZMURpRFr359mrSOC2YKkWDkgKqyx9Z00Ic+enZXdqfx35dC21xC8Jg6exfeQKdSZoK7yga/wbOqIFePn9lavyArPoNuuM6axRINAmWhql371Ri9sQN3egi5YmEOG8ocFxu7oTTFaEYUMLPKHse2zMCn89Ji7hjYzinjUpaS7MqxpRb1ekIoFLRC73C3VZeNrDyzIowULC4C7V3tDSV2nTolIs0gACrlBiLYgoTNj9FN6JdxwBzhUaCw3AU9G0FqUUhJJRSJuQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2xrOxygo31JcrhwcjyMGvWDaLmO5kjqwX/NSyBEB9U=;
 b=wsgDNLa55CbBGPSF54CqH6E7UbEI7RAf/Qc0UgmAzdNqH+T590n9/PghNG6gmXZ3AXdcJZVrbfNcZ/fT2kYJ6UAffGnLPloU/653iwmjyngGKe70HidUsEwmN21jD3wgHDrdXa//V5fi4beZ7I61b5b7BWp0bpKRdswUi0t7efHIZxZ4L8i7paMTzeQizjqmcdj3mZgjGtilqpHxpQCTeGRDkV4wteDv0rBnKKh4tqtVfosL2LxP8IUZD0UvgDp/4BIhf7YreHI0uUdLzQsmKgPkfGaJl/9JV9Iqq656z6nfvN5lZW6hVl9sS+EFffZ8uGz46ax9LV2hladLkHQ5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 21:17:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:17:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Thread-Topic: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
Thread-Index: AQHb90t0cyp+TfGyBkWewThTOsvuBbQ2wDEg
Date: Thu, 17 Jul 2025 21:17:54 +0000
Message-ID: <CH0PR11MB5444B56DB80D45010E720F8FE551A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-3-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6495:EE_
x-ms-office365-filtering-correlation-id: 880a8194-f037-44ee-7fc6-08ddc577654f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?koi8-r?Q?8o+zAlTEP0BEWdMGIvtDr8Ujz3ivUZZSADiZc5FclrVxBqLfd8+1vrFgafYYzf?=
 =?koi8-r?Q?lo1Fv2cBqnpqu+tLxCYRjifSeDChZMCcLTSiHQbxZtrSbu/eDF6KesM0t/6Xcd?=
 =?koi8-r?Q?QstNGv2t6UuSPaDsf+nx+1ZKaOZ3hsCX4KVSf9EqGgihHumN5UnhGDCszmpfmE?=
 =?koi8-r?Q?jyIwasoyrBJn/UR0GTjmJSeDBHXNnZfrHksM+Re4RHZ0dwQM4cbj15I14h4nmb?=
 =?koi8-r?Q?shNYaaYWPU/6eM1fBrSCHhPpaR/ahNusDCHDerUiYJ4tuCP9LX5jEuJbbdUwuo?=
 =?koi8-r?Q?H9kkxkRPMVOBWrdH2SmsxNPbKg+30xsWPRfHS4mahh4T6kfSLnGXk6e/Kw2Znr?=
 =?koi8-r?Q?TsnFFw58YP/fdpZy4vkHUx3JgaoqK0ncpgmXw3NKASfwvhiemDQJT2kbHl/7qN?=
 =?koi8-r?Q?gY1kJCzED8nOsvnU33qG0FKRkO/kZSf8cdgLpCBHu0PSt1kH5OCIHDkMsu4tBK?=
 =?koi8-r?Q?WWuROzsIGQWp0faaAnm7atTxyLee0K6NHfmmcsDg6FSdVwFY/wOQAO68bhPC5d?=
 =?koi8-r?Q?sDMjW1QP/qIIfBdSk7nMkSeR8OwyhojwLB8Vat72KTnZS2fzMpF2emerJ1TMmk?=
 =?koi8-r?Q?y0YsXPS3Q/2g3pGT00+00DT7GddB66UOfCRKavQRiApzhJC0PRxh/lyUOTchJT?=
 =?koi8-r?Q?AIKsW10GTYsNSs6K4iL9BQO2PpDeqVIoLPwmXHeKZzHxy6k1Y0REaplp1ZI5IB?=
 =?koi8-r?Q?Srsh4aYCPaaymmD36SumNvhoqg1sJBTIeFW5wWia7rWgf0h0qZBGkLKe4phug+?=
 =?koi8-r?Q?3akWQctb2FpI/ykgFj9srTd5fDbcdErZTZp/NpJ1+9UofmYWUmHlb4kx66OV0C?=
 =?koi8-r?Q?osgwySJvlNzdBXt5RL8I5LvXk+ycrpnORuJl8hrdpWY6tdAAzx7Sm7e4oe0H63?=
 =?koi8-r?Q?MiBfWxXQQj8rWOoPx+E7klcgNOc3lZzaMM+0EcvXtGKdz+pM1ZumVlNzviLcxW?=
 =?koi8-r?Q?U2q15SHzZYzJlqbm1xjZzu5IpfpoRDRgyS5wtW290WeboWiHCuBv85Dc5KPQic?=
 =?koi8-r?Q?k1ax1Yf7vIiflM8BddAw28rwGxdzD/AMXhKXYARwrubo39uPd7Sj8xvuS5B/9s?=
 =?koi8-r?Q?LOM9lkUZp7NVD61FELtuEFxvTd4rTljAwFVsEOvFPRnQKTXSaUW+0ws+pGjmQo?=
 =?koi8-r?Q?ZYeQTZP6I4tCLclNTgCNC6F5nlFoKr00t6imbPwyokqG/OBlgbHto+CPkTeumo?=
 =?koi8-r?Q?1y6+ElcNDfh1i0tLXIao6mqXqst9LjT8/BvR16AbcbBFRYMVkVYLqr4+h6gDG8?=
 =?koi8-r?Q?pm7kP7iSjPLmiHub3ph5p/5BiufHQh7RLBa44lCxaxFYqgQn+qvYIyylD1pe9E?=
 =?koi8-r?Q?DLPO5gKXKtnmhcaDagk5wyTIBlRTYA3GzS61ja1SXWT+Xw2apQx0ka1vYXmtWi?=
 =?koi8-r?Q?jIvfR5NQmgyi76/b9/CYv+wXqfK81bwHKZ8h6wkpW/PZtROlxqR2KW5fYwG9cl?=
 =?koi8-r?Q?4L/CRQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?BlAuie01qssSrQpCH3GuYeBt935yzIMYXGSiOpbmYr8jJsVSIW4HPGYT112whJ?=
 =?koi8-r?Q?NzjvrolerqDUe7mBh63sed2X3ua09DQxcOBiC+NqzriqlDF0U2obMfcrDMrCg0?=
 =?koi8-r?Q?KebINTDQDGXjCLJd7gbBJEz1re+b/5WGA/552oFLIhYA/I/jH62yQk6pRX8FSG?=
 =?koi8-r?Q?4KbRrqO4YfPj5Je0J/2ir0sIuZOvVkxHfu7CYcPZZVKVDwCL1pc0PBaQTndJgM?=
 =?koi8-r?Q?5wgpMms6teN3uDtB/g2kL8zxw1+Op1HgKtzgUYZ+TEcV2a9YVWJJxYMyJalujP?=
 =?koi8-r?Q?j9d0lWJDj/jZ6UBdm1Tq2K1pAW13HTOGw+XxbkAe75geMLK7pe3SxIwMqfJllb?=
 =?koi8-r?Q?47bVvCy6zC8tz4nLejv3UTQ1p5sdekbH1T2z+sWqoMSiLVf4fMxYnjuiwpzOmn?=
 =?koi8-r?Q?4A1mRUdQI8gk0+KjDLra3oWBMRGtqSLg1BPQjVgag5Aj5ZgvOLsSaIbYFelfwR?=
 =?koi8-r?Q?2OcAcopUDZxTW1LsMJvzxr+EGHz+H1CNetMJ8Y41KlRm11vAiX2hEgHgajC7Au?=
 =?koi8-r?Q?5/mVcjmUW31ViKsn3MB/xp7ZR3RmA4fxVsehkCYXHeJiKMsYgbquzJtXSlcWY0?=
 =?koi8-r?Q?6iErw2L+Lr2FuQ2wD/dPEz/+ZOZRmWOo4QXhawbE7FUM9m92TafWi7/3pqi71L?=
 =?koi8-r?Q?uASNE9tQUASDX/AtXel2XMxNYKTJZ3Rvjg/MnQV904SCrwxEERM/A8m4dHB8da?=
 =?koi8-r?Q?Ef/L1ntt6mIfWwZKTALIUgaINvW49/rENxrg61cg3qZ0ZifHYJmjfk7l2U/n8D?=
 =?koi8-r?Q?iCoJOu8CPir55zdl6HNiI9mYPKfgh7t7XZQw5C9E7yLCwltcRq64d5lDCO/XqN?=
 =?koi8-r?Q?H2+2g5k5s522aC97fv9GB4LYJoAenc3H1rrz6BEWrRe5b4eqtPSuMITTX8Xryf?=
 =?koi8-r?Q?PwNTDnE2P5YEHAs91nBhvE97DPzHDLE7UDtZI0o5vpxKFSfJzw15KohfuJZPQu?=
 =?koi8-r?Q?9skF2O0+YwDfCn9NoVLzkX2gAECz+XRrhx3bZtnK1dhAmFiXlt+AIeFB/wPRFH?=
 =?koi8-r?Q?RMbjlusd/lWJG2oR7VEoegV6nclgiKdZBI/+4s74jWBtNDXQYDJTvsZlEHV/Yd?=
 =?koi8-r?Q?OAguWTF4wqyzx1Dw2MwzQ65eh2FXLnYQAwwUUNsjNsbbV36Hdn6NwdbQB5OKlc?=
 =?koi8-r?Q?rPa056X5zpItDnvuenI9X0yAsNKmGwCJOxnN6dUtwXD0bSy6tQ233NAPRAswQS?=
 =?koi8-r?Q?GRM3yDQXbHMMVOOIWl5DfaveqPBo7XUve8ts+u3erxNsvkeWWvU04xvBsvNf9j?=
 =?koi8-r?Q?r4H/JozfTW/irosKnAOYl2Izht7DI+cfuMoh2/Kzv182fNr2dVZJEHSQEVEK7v?=
 =?koi8-r?Q?xN7C9ZZRUQND1ivTB3ZE7Wm+1BNaK/bIjSFDnp1pkjhQ3q6/+GsJ9MaUbTgX+S?=
 =?koi8-r?Q?R3UMWrZ3DUipFpJf8y9pp9UB9pnamB5oK+pit9jWiWDn7FLubeXciI26RBEG17?=
 =?koi8-r?Q?PvHnLRLnAwKEj0rbhnzr2bSvjGufx50KnPp2EA76BCcMmKEE+4W00p3tW1NG9J?=
 =?koi8-r?Q?nZWo8SUlE+V7/2xfZzMC62dgKfj9w0VP+OmiJcWl3YaQnduG+TCf7WhAnTz8Ek?=
 =?koi8-r?Q?Iq8bER6gJ/gVhVNf6hrn23uPgYCaYlZ+izFrhdp5+Y0aun7qvgOF?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880a8194-f037-44ee-7fc6-08ddc577654f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:17:54.7290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdC6ny0JJZGumQrL1WkJvmchItRgKS9I/Us6Bk9ZwDTmP9Lo1oda59tAgSbPpOQR+lHs0gWZo7Pff2CrvN7IlygmlNnhv7e2D1VF26tBmpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Thursday, July 17, 2025 11:48 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas=
.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
>=20
> While we expect config directory names to match PCI device name,
> currently we are only scanning provided names for domain, bus,
> device and function numbers, without checking their format.
> This would pass slightly broken entries like:
>=20
>   /sys/kernel/config/xe/
>   =86=80=80 0000:00:02.0000000000000
>   =81=9A=9A =84=80=80 ...
>   =86=80=80 0000:00:02.0x
>   =81=9A=9A =84=80=80 ...
>   =86=80=80  0: 0: 2. 0
>   =81=9A=9A =84=80=80 ...
>   =84=80=80 0:0:2.0
>       =84=80=80 ...
>=20
> To avoid such mistakes, check if the name provided exactly matches
> the canonical PCI device address format, which we recreated from
> the parsed BDF data. Also simplify scanf format as it can't really
> catch all formatting errors.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index e9b46a2d0019..90b4fe92a611 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_g=
roup(struct config_group *gro
>  	unsigned int domain, bus, slot, function;
>  	struct xe_config_device *dev;
>  	struct pci_dev *pdev;
> +	char canonical[16];
>  	int ret;
> =20
> -	ret =3D sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &functi=
on);
> +	ret =3D sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>  	if (ret !=3D 4)
>  		return ERR_PTR(-EINVAL);
> =20
> +	ret =3D scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", do=
main, bus,
> +			PCI_SLOT(PCI_DEVFN(slot, function)),
> +			PCI_FUNC(PCI_DEVFN(slot, function)));

Does this function have an external-facing interface?  If so, I'm a bit wor=
ried this might
break some customer tooling.  It's probably not a big deal, as the tools sh=
ould be passing
the canonical addresses anyways, but I'm unfortunately somewhat familiar wi=
th even
debug formatting changes breaking external tools, and they've causes endles=
s
headaches in the past that would be good to avoid.

We could probably fix that by using "canonical" instead of "name" later in =
this function,
such that even the 'slightly broken' names can be parsed without introducin=
g any new
rejection cases.

I'll leave that up to you to decide, though.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +	if (ret !=3D 12 || strcmp(name, canonical))
> +		return ERR_PTR(-EINVAL);
> +
>  	pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, funct=
ion));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> --=20
> 2.47.1
>=20
>=20
