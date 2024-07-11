Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B2C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431C10EB90;
	Thu, 11 Jul 2024 20:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq7LA+gO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8410EB90
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720729647; x=1752265647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=//+B2MUk3cE4QgphDsDUDPYFmv+ntSSMOWnOuYeHAX8=;
 b=Xq7LA+gOGyR7uRtVnssSTE8Q3ZN2WaqPhJ2HnzQ8By8upHWMoxI8a12x
 ColuTfS7RnKM2oysygRmifBRgTMjSJjzxJ9zvhAZtPva9dOqdum3arnl7
 4i8sAZq6zqsLg//V4hKMYcOan9qV2gbPoRHAJqjXYl0xn81+vtYWzwdXy
 hdl03e0Ik9WcfCl933j7X1rtwzw4W3gptG8yk1SNn7MEflGCLdXWuSnzi
 PpUPxpUyknV1eX+ayIebJbGfzpFCi9CVDgfwKkvu0HINJS7pQwam3EWD8
 +hABr+9Aam+vJBovi0MUcCBJeiVxqYKulZ6n3oBGpE3I8CkNoUsk+FwyG g==;
X-CSE-ConnectionGUID: Nu+FgVyDTqCLzgM3b3B1RQ==
X-CSE-MsgGUID: LQyCMXcoS127ycaFAZBY6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="43560655"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="43560655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:27:15 -0700
X-CSE-ConnectionGUID: EH0VcUefSk6ii8qKr0Wi0w==
X-CSE-MsgGUID: r26ZBEYaTGafsY+5uVWPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48581855"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 13:27:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:27:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:27:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddpBotP//5/ZcVFIrpX5DPXWpOZCQNiC1V9SXYI8Nqe7RtK/iKuMSHObHVCr0sw59Sk2Z9xVWwe7iOobwiJLezozQpgFaihA3QMs5GBcY9YCKfr0B1sIFf4QL+aT5vGhd6EQR7HeA9EEKkFmpsVwknY7p7XMfbKIdhY7XKBRzyqBqE8Wuk7Ns876IvIbGSiLhm4drdzxPFVY3gfh4OVupgUoUtKUCXBrkrS297qMfTRk6bLUuu0iwJYoQjkWvlrX06KLzQlkQnBS4+IeVpWLyt2ycs9ygShWvv7vPm6hdngTpZldSV30GeLH3nztNthQTV5AuxJCBcSr0v0mud15iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xCHaA6vOlsLLNic+NRNqBRI2hTJ4dOqkLNyGDJZduY=;
 b=XbV6SVU8oi9vIgsnJpaN6Vr2rohal+CaGfZlUG9f65cF7FNoCyHsRIgOOCWXngZotxmjj49vTl1u+uWkWxv0BLwQ9fwmc4RFD9lUfNfHz3uAZ4XhVAonD4vX8n0B3IhFmdLo8bla8q7xEIol1C9z7zG+nCtL3QHflheqfP6YzQ/O5kWo83sbDmR/9qDEraLGnq2CRzYzwc9Lgw/swrFwAF8IoTfqcgZUL/hRxk+r+21ni+xWPbqF2qbXUHlPV8zOOBTBt9j3Y/kbHPBp65kT3FLdGzzF6yhZLy7cjsgTEVAKILo1XYQnkKFWfN5+4YA7r65uq1W/gFZlTPRkRgg/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8043.namprd11.prod.outlook.com (2603:10b6:806:2ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Thu, 11 Jul
 2024 20:26:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 20:26:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Topic: [PATCH 2/2] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Index: AQHa08fbkSc+cY0Ga0ePDHtj21SVurHx84Ww
Date: Thu, 11 Jul 2024 20:26:58 +0000
Message-ID: <CH0PR11MB5444F9B7FF3C7D25E2B4D7D3E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-3-michal.wajdeczko@intel.com>
In-Reply-To: <20240711192320.1198-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8043:EE_
x-ms-office365-filtering-correlation-id: 719c844f-a9cb-4d8c-1de2-08dca1e7d0ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6TMw73fbUqZUKeaCPCD6V8C/sC9hw4a/ETkwW1ORpvgkfcxiboxnJEZVrv3v?=
 =?us-ascii?Q?oVeNGSNaQmFLPp9VcYjM6bKrPj8bRzT0YH6H7yOiNFYwVqYFeCdOwJSvbzLl?=
 =?us-ascii?Q?5SoFuZhzE3lqT3P+oXOdaC/AO/Wc9UNev2SdzGl1bpMaguyt+xaSIL+eOfTu?=
 =?us-ascii?Q?/5rLHTDtXOjbSLE3l8LSdGC/EW4Aq/T3inU44pFFFkMhfk5NWoUG65fiBdcc?=
 =?us-ascii?Q?yeQKOo+o915L4C9QEdvmAo3Q27FAqg2/lvaX91snpI/t3PPGxJg0rh6QnPYW?=
 =?us-ascii?Q?JFJghgr+/IQq9zVniASV8SYTL8pf4UctdWC91M7uHZ0Ay5haNy3ibY05sIBm?=
 =?us-ascii?Q?ziBvWzE6hLT1zJvWvifOln8OCMv4dKAxikjt+qSs4/NclrdDVhX/2IUuclG1?=
 =?us-ascii?Q?vrwlKFHhHE0E5FCnF5elEfW/ZDVd6H8ZJz+su+c5WqTi37U12YXghHYA7XO5?=
 =?us-ascii?Q?ro1sqbTZZ/v0hGwvClTmVc/nTOCy2DMBUbsWmvqU5jS4/hKLAU4uVg4bcwne?=
 =?us-ascii?Q?vbHiU6Oe06Mi2GwcVYRZwlgWIxl5EK+Y0mxltwF01qvmSJ61eZm0W9CSq86S?=
 =?us-ascii?Q?30rybKi5rOYBas3wtGP+Pih/yPOCk9Ff0GhRgGhVHY64NjE0XD1h+xQ2/Etk?=
 =?us-ascii?Q?kIlyURjFX6/obiHYmJtPmQD7pLNxvFPrFyuD7/MA7pLCbhY6GFx/trSObZnx?=
 =?us-ascii?Q?Un5KMvXF2zw52nt98NQ+d1Lla30KRx2VR0iaETPzG2Xu3SA1D3P4Bx3ul3fc?=
 =?us-ascii?Q?rt4RzkVFXE15CdG4xJlApcfg6j90ET5OTogKrB/w5tsyAPnb46vizYr1vzhp?=
 =?us-ascii?Q?vKVXXx1CpzWIpQnUC0peu3ohpJ9hDerxvlMNEsSmmoAYbUslaULvB8hhKX/9?=
 =?us-ascii?Q?0ZiF+88xtdQ653logYeBrS5sWEOpgrVJ3u6gv+b0euTrUFylmOlfgt7bXvvl?=
 =?us-ascii?Q?ON3PajV9mfBMf6TGUePfVvI5UzYhQ/JE/OoKoT+EtqC98SBpLnJklX9EohYJ?=
 =?us-ascii?Q?NXX0USWBzyWjiCu8W9ePxdRTpB8CtkLqWXvmbCzgvJ/H1EkomhEywXNBJ4/B?=
 =?us-ascii?Q?NqKuTMTlRpkacZO0WvlYjbuhpDtLddnbdaJZu6qGx3mRLb1HeplpX+y0xCht?=
 =?us-ascii?Q?OzbN0XUGfSqdbxTAlK5B/+hLNO13Tyc0/KbtRvWaPvLOJ6x4ZObUogqJRZYl?=
 =?us-ascii?Q?zV6FxziZtAn6gzVkwuUDfcHVN0CxtvzGXcFuEEqlTcBNevcnrtjPVFCyyqDj?=
 =?us-ascii?Q?+F1hPQGTNvxTpGEvUwoqq44RM80zA5ZAktb1B94YdIDyzvCp9PJ0/L+xl2Hy?=
 =?us-ascii?Q?h7XcEZlMObQ/GuQtNbBIQ01EYm80VWbMKUcNw8JmN+Fr1ZD2wy0299O5ds7E?=
 =?us-ascii?Q?BEZoc48=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3hiKv7hihL3uPh3+qkFN3XlzNcFNE7APpcINpTLHVSn0EC4FGWfLPDpuGxqo?=
 =?us-ascii?Q?qt/fsCDQ6b1cyfrD0pW6bOVZ8BJGbcd5zQZNHmnI4kGT96jQl9TJ90dpDQWx?=
 =?us-ascii?Q?bmhfArsBvTVBlBLBWlW1oehLiwdxswpIRroLsTyPlQfRA3vI9xMXS0gKpdmn?=
 =?us-ascii?Q?ve0rrd3Hk3D49fkLiiNWchv+U4BJ2P3jLYMzwMRRAkmlIPzIXg5AX1ElX/L4?=
 =?us-ascii?Q?wfu+bEOTQdHp6Duvws9fZWtj+RbXu1KZHm6BJZ/25z/bFhHtGUu84uVPkG33?=
 =?us-ascii?Q?rFxx3AN27ATaCFJB/uhHEGqlmEndC96ehDAew1oN2TmXsQAmBzOQLjm+/7kP?=
 =?us-ascii?Q?tqhp+Uu64czxL6ZBs+btSoh30enQfABu2O2bmawZ+cbp/sQ0vbXOXjU8T7+t?=
 =?us-ascii?Q?e8UKgmNA407jzWvFRHPZoTYFjb6YbpvfFXaG0E7G9nBKRrJAI6du0tzI3QZh?=
 =?us-ascii?Q?SFJvJy1/tFDt/YyZAvYBRP6yumyW6zatJh9NiFbwdscJo01tPlEvstwzn+xg?=
 =?us-ascii?Q?uXKn6KdtL04qbx+4ITSBtLiColGv/4RMV1joS0tOWaMX+kRu9DkkzU4d1efN?=
 =?us-ascii?Q?nq8UJvuLFbX2Sxfru68rb4LoF2bznmc7bE0TvU4RhpAsILl+3SnDRwiucBmf?=
 =?us-ascii?Q?L2gdAwQ/lS2OOVXhpBsfvYvfcHzS35FKlyp9V9JxSl7BGQTbazLH5A6mEfvm?=
 =?us-ascii?Q?ZnjqJDKMLH0tKL++qvN4mj6UgJyi0U2m/piDTQlecRtkCTEFVyF8FRfEKfJc?=
 =?us-ascii?Q?Ua2EEpeSAS3ZuLFDykQww/wB7fOXVwf4/1KejdgiWEGoNBZdRKhgQ2Okjmr4?=
 =?us-ascii?Q?j+ikLc+A/Y4ZgoSntcKhQBqAHOaTWEpXkZlp6UqLWu4YsJWc2c5okaVHf+pL?=
 =?us-ascii?Q?Sj/Hxux99neypDhvuERKUMgwO6NVORFbimJQRgVudZecIAKVlIVwzOqFRkdQ?=
 =?us-ascii?Q?l6GXJ6rBLrSgQMiH2X5efTRkl55CEQqKA1fTLJJdZwGOFF6GkcK8ukvC+Mz6?=
 =?us-ascii?Q?hNJNMCeh1q+G4cRnc8+TRr0cEXdf+hk5ogqKCJOQ+vxRBwdz0dvKFK4hwcbm?=
 =?us-ascii?Q?/Huq+3azUO5nJA4ocd/dhnDDp8QUfWXbCr8eLp7SMdQsG7TtbeiRbKfc56PG?=
 =?us-ascii?Q?e2q2F0j78XPvPkFVjTKTuBl1KIBgtoSIrWUmPrluJvjJqcS0Ws8P6vAt5pc+?=
 =?us-ascii?Q?ZUo3m2fYwV6c1R+VvCJGicDW0h+eszRs+dnISTbfGhl81qaF6zvyvxSXsQk6?=
 =?us-ascii?Q?UYEy3rAcvI5oYcywhWea+X9iUvhRHCBV4NDvZqJREFXlV/bKuhojzl11fcND?=
 =?us-ascii?Q?+1P01dACUeNRbds0kovihKPFp3GklGoGEy2jCfB/EKS8RNFYQI8E6vGzcxeC?=
 =?us-ascii?Q?0AT3pBaG9jM/TBCRbDC5tDASsKpic00ObQfpp/+GZGkaUF/2ZSFKje8iRehS?=
 =?us-ascii?Q?1El5JhI1jTEz0akERa9/o7CpOFD6uzBl6P0mVy4ZXYbcaNaYBQJ/7w2Z7bAi?=
 =?us-ascii?Q?kao6WSSELDxaC4S8Qfx35CwTkAsWv+iXnBh6xInySCthwoa//oR9rOML7wNO?=
 =?us-ascii?Q?JqTmNSLY/ZGXy2/HF8qoK4KF2k3MjDr9gIhBmWvm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719c844f-a9cb-4d8c-1de2-08dca1e7d0ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 20:26:58.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXK9xuOJsG9JHeT9XENpXDfmo1T54Pv5owQrPbEK/wKK6flHrZpz7+ESA5vzP4M9bLrYOSDiAIuPzdv8la39LXsT76qWEqvLmvPqEljdj24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8043
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
Sent: Thursday, July 11, 2024 12:23 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Vivi, Rodrigo <rodrigo.=
vivi@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas Hellst=
rom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Enable SR-IOV for ADL/ATSM
>=20
> We should now have sufficient changes in the Xe driver changes to
> run it on ADL and ATSM platforms in the PF mode, to configure VFs
> and successfully probe driver on the enabled VF devices.
>=20
> While some more changes are likely still needed to fix all corner
> cases, we will not find them without running any tests. To start
> testing this feature by the CI, we need to mark which platforms
> have basic SR-IOV support and let the driver run in the PF mode.
>=20
> Since this feature support is still in the early testing stage,
> make all enabling available only for CONFIG_DRM_XE_DEBUG=3Dy and
> keep it on CI topic branch.
>=20
> Note that from this point, on selected platforms, the Xe driver
> will be acting as a PF driver, will some SR-IOV specific changes
> compared to running in the non-virtualized (native) mode.
>=20
> However, those specific changes are visible mostly on the debugfs,
> and should not impact normal driver execution, unless VFs will be
> manually provisioned or explicitly enabled.
>=20
> Once we finish adding the remaining SR-IOV tests to the CI and fix
> any issues that we find in the meantime, we will replace this patch
> with proper series outside the topic branch.
>=20
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/600604/?series=3D135296&rev=
=3D1

LGTM.  Congratulations to everyone for getting SR-IOV support
ready for ADL/ATSM!
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
> ---
> This patch is for drm-xe/topic/xe-for-CI
> ---
>  drivers/gpu/drm/xe/xe_module.c | 3 +++
>  drivers/gpu/drm/xe/xe_pci.c    | 4 ++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index 499540add465..7bb99e451fcc 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -18,6 +18,9 @@ struct xe_modparam xe_modparam =3D {
>  	.enable_display =3D true,
>  	.guc_log_level =3D 5,
>  	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
> +#ifdef CONFIG_PCI_IOV
> +	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> +#endif
>  	.wedged_mode =3D 1,
>  	/* the rest are 0 by default */
>  };
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 53b67f39c7d5..7326a33030d4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -241,6 +241,7 @@ static const struct xe_device_desc adl_s_desc =3D {
>  	PLATFORM(ALDERLAKE_S),
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> @@ -256,6 +257,7 @@ static const struct xe_device_desc adl_p_desc =3D {
>  	PLATFORM(ALDERLAKE_P),
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.require_force_probe =3D true,
>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> @@ -269,6 +271,7 @@ static const struct xe_device_desc adl_n_desc =3D {
>  	PLATFORM(ALDERLAKE_N),
>  	.has_display =3D true,
>  	.has_llc =3D true,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  	.require_force_probe =3D true,
>  };
> =20
> @@ -307,6 +310,7 @@ static const struct xe_device_desc ats_m_desc =3D {
> =20
>  	DG2_FEATURES,
>  	.has_display =3D false,
> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  };
> =20
>  static const struct xe_device_desc dg2_desc =3D {
> --=20
> 2.43.0
>=20
>=20
