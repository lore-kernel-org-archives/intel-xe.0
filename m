Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841FC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA3610E895;
	Wed,  7 May 2025 20:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciXIg2Ea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330D10E8A6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650210; x=1778186210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AbU14tXXcQxamHHLVwZLKs1bWn2tLLUKC0cxVnjAzeI=;
 b=ciXIg2EafRRvUIdRkEuFrQuLmx5ajl0EhGe9WlSutnkYgUoheO+V+ylV
 Yx5lcdpDNQiYVdxAOSY8R2zwjmbA8vBR19zhqXgZomJeFFVHf502Bq8gs
 +uMkqhGYZiHFATtu9MufDrhvYcV+uLueK5/gZQosOCkol2em3FqwPcvta
 a4F2H+1OYA0F8jNYDEFH7GjfJOEHqo0G2LnTq5pO9LhcLr9BH3xcq1Ijx
 ym6wmc3JIZfd4aqp24FISN8S81j0QZJvYRpguLA5/C1HRwZM3IJwCNW9O
 5N9ZgTyyQBk08NS6yYB7eMmsWCzyht9wg73NXQ5aKI/zreebkcLin27WM A==;
X-CSE-ConnectionGUID: 1ViU5ckaSVi+lSswiC9Sxg==
X-CSE-MsgGUID: L3voFCp3S7y8rAVeLBWv0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396557"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:49 -0700
X-CSE-ConnectionGUID: 77ypCy/lTXW0SaJjrKWZRg==
X-CSE-MsgGUID: ZQG8ap7GSV+VNAQYBaEpLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038365"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv4M7/IQB87QI/Itu2voUBOnTmSWSVQOL/BWJqN6W/F+A1EOdG1t6nIiFnHcLkZmMz4Q91eUswg8J41sm/t4ZE6U39C/OCd0G1iHdi8Lbwx4Rk9W96/lzlCzd51Y6VXtqqT/eUNXjn8AFaoCnl4mSl3EZoxPeAQCGlDcdofxdT8dqKu3GKIm32Cey0TG8k0XrofbFtd/e+jSrYoFf4xa6oiCF/3xF1wX3muLukwSwAWGF/4BLG9HWHKOE6JKCX5huJBBvV45R8diP+rzuOAxxCMjMpXIMXGpn+HPk9Pgj/m1wXCFkvy9zPPNsRZPb076TC6VhOo0UzU1V2befOInnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok2/Grj5S8rjiS5n3w/HSAy14Vmgc7T7tcF6gI67r/E=;
 b=WNpdIJkNf+CgW09PdXBLL+pUk387d6CfC9cR818FKGAtKFyxAP4cPQVL+7MQ4abSR/OxvXK63Dz3WR9oZD6lZ9xvWCBfGnbjGr4zlr5cutmXhm4nn8oDAAtho+UGbjka8pqPIrANspKBA4kXUF6NUBwR9oJvOYDYcJyX/nI9sSRFgf2E9C2USEe3XWrTCgEycNZsGI+aybA4G01ypvQcEXavl19IcoNsP3u52nIFOWhu1ZEliIuZl9XeLYNYX4szBTW64csplJG/MkH78OCO3c8bjaptGN933+DvNQ9A9tH01ew+IZH0rlvsPqmhv1euaeIYE0TGb6MmKAHiNuHEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
Thread-Topic: [PATCH v4 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
Thread-Index: AQHbv4ytTKpPlLqZR0mg6HdLwiW8vrPHnemQ
Date: Wed, 7 May 2025 20:36:39 +0000
Message-ID: <CH0PR11MB54441059C4F1BFBCD4BF6EACE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-7-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: 66c9c217-ede1-434c-c845-08dd8da6dec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?t0MBm3+HjZUusnHe8A8rmgyNFRGYLX5SjKWVwEqv81b+DkgSmgWF+1ZCn7?=
 =?iso-8859-1?Q?1YKUrEFtaXq4mbdgfPG3z5blxbjKT/wiTcBnAdc3N63cD+TS9tj0oowu0j?=
 =?iso-8859-1?Q?/GA1pqIu9pfKYsp76iK2/bYQKZVXf4Dx089rgYM1l58x/TJomQ1UunDdli?=
 =?iso-8859-1?Q?6/bh76hOGnOx+dSwsCSbYnrICsN8I0YjM/fXoIzp7a+hEexqAYSQt6bkeL?=
 =?iso-8859-1?Q?T8ZqpY5kCGOGUaOPxdVGxaihMYeSN1s6O1sEUi5sJVPls5kozRwHhYbu2H?=
 =?iso-8859-1?Q?kPmR7tJVRiLwk5N6ei+PPCVrpKCW0EdyypGEw3nC71dZ0gKOtOVs145qHV?=
 =?iso-8859-1?Q?rWa9n5NxFbvGA5cxYe7YQETOkHyJcoTxky/5xsWZeuf6txFakF9tAS4x24?=
 =?iso-8859-1?Q?W+uHtaV3VIP2SHb1fKpBl/LQUUPLKVlAgzJoqjFVcmQmnMMosepZQnKbX8?=
 =?iso-8859-1?Q?kknyJb9wREzIG+vIrZ3yEOb/LG7mbqFPzyUF+YNb6MelBPmxakhPb5OJ8C?=
 =?iso-8859-1?Q?N8f7h1CVTg50hfG7zDStqDf3jve2IGxhGtkfrfQtz00/ZIkSoIAu/5eRLF?=
 =?iso-8859-1?Q?fDQwbDp2DPkhr5GM3qShwBP83AfXlC3MANoK9x1dzWVG/rEH9LlFOtSOjf?=
 =?iso-8859-1?Q?DQ6C8FEjQGCqgj5DfZvsC3Tf2HNB97bu5IkTgzqnNfIPrHnnuhFKtr0W/b?=
 =?iso-8859-1?Q?Ibft208DBDfENfwqUV3+0wpVXGAi4JeVPDoKeax7ux8CjMOfvVG5q5FQ8+?=
 =?iso-8859-1?Q?ZiIgpvCQb3Q10f7a0hejL7aE8V+RTit0GJbe0dmj6G4997HoTwSnULbWo/?=
 =?iso-8859-1?Q?UAbUX4pdtvEPlBt/7Qw8jtbc3rcPWStlAhRRgJ7hsHIA08LyEJhXT54vUX?=
 =?iso-8859-1?Q?RNyVqpZ5i9cnqhmNB+bGhCmT6zDWD3IRKtKAufwIO/glPNuiokxBcx/71G?=
 =?iso-8859-1?Q?EnLdNkngtVMmSw0T2KuE6iHs/5un86fyUI9BitgaX6iZ/mrfFST/ZMGmVx?=
 =?iso-8859-1?Q?U78NqdbUoMVw6ASxnjErl5oewvGVxGsaSAkz6viTz3r1FquYIgPGVkZdlx?=
 =?iso-8859-1?Q?a/FE5F7kDcI9t3cRU6OJFltGxWhuJj10IoRl4/gx5TXQrLNlPJzCFNfhI5?=
 =?iso-8859-1?Q?t/edBal6S9uaj5sUFCumhfLTjhNo99qagB/FiwDt+05SJzPYRmekkAUVDq?=
 =?iso-8859-1?Q?XD4tC4BXylBGZvtfV4Stph63lVGG2rMVPWJDSOvHE9vwvsvJbI8ZVTycy7?=
 =?iso-8859-1?Q?d1CLqca8drTk6IvEbUcalt6nqnKKlU9+Ekj3pq3jK5zFBOHMvF+zztlOHc?=
 =?iso-8859-1?Q?o1bB+TwyJmOICmqQJ4uLKpU0orylIGmy8cylTqWPGB4FYuo4I22MMJKOF6?=
 =?iso-8859-1?Q?FJ/617P6Gdi1adb68QwgF4GMHF6tYUBlPLYbnLPBwm6VmqYDeGg/qtD6SH?=
 =?iso-8859-1?Q?RrUOq9W40ZFll3+kFiISKlVYg4jWKW9qSSQQl9R+k0hZcp0ejgF/P/T4Ci?=
 =?iso-8859-1?Q?iSiTxWCW6iMuqB89qSKjhxuhvgI6Rmhw7Sbuc3Z8UfVFvzqy8PfoLcTUj1?=
 =?iso-8859-1?Q?1g+U6aE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iZqQJ7aJLeM2QYzCs5n0HcZhm1IE5lD2Mj6yqRF/as+5gAEBXwp/wwYTyE?=
 =?iso-8859-1?Q?jMrdVIIMaa+TvGsQMgzdlgmDdjlZVMRL4xVnV5LT6TEElxG/xDGvZHdsSf?=
 =?iso-8859-1?Q?7Lqav1vG7FAWb+qBthilMUfptqWf43sK4i5eoEKXC9INUOAdhkJSF4/f6r?=
 =?iso-8859-1?Q?E6mLV1aVoAdrUUn2om/NxSoZ0urlSkK3fPxebvtCsCq49ymp8/0b/rCsWr?=
 =?iso-8859-1?Q?Myyv2i88bSM30z+Rtc+JH8ZWgncfCVGRoTWh/aKlZPZ2rO5C9lkCoOEY6E?=
 =?iso-8859-1?Q?A4Xz8z/o9ph19GjtI23pjukNAZPJYzx69uJbrt5213wBTSAk7i3tuPXGZk?=
 =?iso-8859-1?Q?nTSZtRbAwR8wAfJu2BYYFEL8WRyikiOnXCQJqnzujlPzym1IkC1VnQBjsr?=
 =?iso-8859-1?Q?aquM3nf226qnK44u/WWxngSTu0pQib4Pi7bbdwA+M4gHOeLtMIUkhjoEnM?=
 =?iso-8859-1?Q?4JH9Uxa0Zj9ADaLncRWhfYZH3+6XjRr0zhY0Xb9b6GGj6StwG93Jh4nIkz?=
 =?iso-8859-1?Q?3MqAVrMcX7Na3dKmqxeU52NrpcnrJw/8hZ1g8CGTim3Bkv8IgWjdwb+T2t?=
 =?iso-8859-1?Q?qvRNvQ5Mk8EXk/PXA0c8VJrFV0ekrsRPZwktW6Vxlt5QvQeiQXYgsBj3d+?=
 =?iso-8859-1?Q?F+0XN/2QbKXjSkPXwNZJxyHKE0n+ZzetrHAQxehPu+ezJfcEuPJco6wqBf?=
 =?iso-8859-1?Q?t2C9iDc2hJdK6mYoqFvfAUEcbL9Q10CIJ3Lh3BtBsYeOiv3cfAiQ1VRepf?=
 =?iso-8859-1?Q?uPaJIMr5h4D8sA4tggY0Rw6lb3XA5kqu/67+B7+ucx9aT2kXtdA51X2SW4?=
 =?iso-8859-1?Q?xbte5FymLvAwRCodMSC69WJPKHGKSOwjuERP7RllGW2Ki2ebEKu0SO5gRN?=
 =?iso-8859-1?Q?eHJqjkDprnnNCwPwmdk/MiNdHCphjlw4rBucAgD9+vyCOk1PSGfWXW8rk8?=
 =?iso-8859-1?Q?Xi//JOlx2Lzf7G+OhL7EmZOPKB5v6RV2UP91bn+0LVvNvtY7Xq723v6snk?=
 =?iso-8859-1?Q?KJhycWidrblKYTP1x28pqh7GT06qRKZB/O8JIGY5YxV8m1q+8S5ISEpPJ9?=
 =?iso-8859-1?Q?KHwFZ9iigm4ORnmZWkfLsNq5yLFjwXhZPHRCvPJtjjagZCl0c9yRHP8Y0Z?=
 =?iso-8859-1?Q?XwOxt5ggthjbkUru4g8GbgrtzbqvX1s2GUTmBbGnfoSnlBx58l5kiSW2zd?=
 =?iso-8859-1?Q?dR661kPWiD7P+DjjLzIfhZnmtcW22FThfFu6wCi/0OZejHHNH5+bGUdaK7?=
 =?iso-8859-1?Q?wk8PC+VnBNDdyKmMmzqA22WNIMRwmuRU+ew6PAd8IqOQcsZ3pdA4CCLliP?=
 =?iso-8859-1?Q?ES2L2N/7xi+B2L+eDCJKcVWiYNIBmFQqc64pIvTluFB1zBhhgVALS9Put7?=
 =?iso-8859-1?Q?c7sN4Hp0iw4rlhDEpyj9ZPjnX/uwAp4QwjE8IFNykEjzkZRIOauVXPX5KZ?=
 =?iso-8859-1?Q?gkvfA4XKmMoF1YXYhgnhnL7p4u9mSJjnbOCBTaESCM89zLL9Y1P0cftbqX?=
 =?iso-8859-1?Q?rSZgddADDznZx1VwsPdyzBcYSF9dqaoQ0Af13Iq1xYsGvEIEe+vd/29nLv?=
 =?iso-8859-1?Q?ZRngvZ1q6G+aJ/Cv77Fnux9weNDFBCo4xRF71cgweySOqMiHGUTTrjGG0E?=
 =?iso-8859-1?Q?kmhL3WLAnt2YVFeATbYLUd63cHb1XGZNT5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c9c217-ede1-434c-c845-08dd8da6dec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:39.7651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwXBqndDcaJA5FUAoOKo1e4dQbSYVrdlXGYmgx//PJrQEb5FNh3H0gsiAvNQRjWIsqjFddkicmKMm4u5yl1Ct4Q96aP5vdEMmhauWGaBOSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
>=20
> Add VM.uapi_flags to VM snapshot capture VM snapshot capture. This is
> useful information for debug and will help build a robust GPU hang
> replay tool.
>=20
> The current format is:
>=20
> VM.uapi_flags: 0x%x
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5af2e79ae34e..ef1736fc0c2f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3723,6 +3723,7 @@ int xe_vm_validate_protected(struct xe_vm *vm)
>  }
> =20
>  struct xe_vm_snapshot {
> +	int uapi_flags;
>  	unsigned long num_snaps;
>  	struct {
>  		u64 ofs, bo_ofs;
> @@ -3762,6 +3763,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(stru=
ct xe_vm *vm)
>  		goto out_unlock;
>  	}
> =20
> +	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> +		snap->uapi_flags |=3D DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
> +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> +		snap->uapi_flags |=3D DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +	if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +		snap->uapi_flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> +
>  	snap->num_snaps =3D num_snaps;
>  	i =3D 0;
>  	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
> @@ -3876,6 +3884,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  		return;
>  	}
> =20
> +	drm_printf(p, "VM.uapi_flags: 0x%x\n", snap->uapi_flags);
>  	for (i =3D 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[=
i].len);
> =20
> --=20
> 2.34.1
>=20
>=20
