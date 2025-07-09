Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD411C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 19:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129D10E35B;
	Wed,  9 Jul 2025 19:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2YDk+UX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4F010E359
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 19:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752088075; x=1783624075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G35PJ4Deipo7mX1cEk3d9G9F2FrbE6332t1WJU4M/nc=;
 b=T2YDk+UX91Jfkk9/N8x+xUKnqrpvwx4R2TG+5WW7b4i81TQrG5w0Oulk
 Qq3p8CNRiKbMKl1d3V2ddGSJQ9QfmLgwQXdYD9+V4nfm6s2PWxTaPzfeM
 vQyxeMwaXopk0gQ9jIQB1M541NSp2xjRnYCMuzUWEsetc8qQ4DRwkzsFP
 U19/t2ulF8hlB15V5Ss3crkWH31CLQchK4WRvhB26pnPp51sSRMwnBSWx
 /zKgvgfKsW/b67swwVECSdDahnAeT2CHMA8fRhKwZ6vOxjEaKcdUma+om
 /SJN4oRVsvVxIdWcBWhsQFU9Pz/bvQSd1MORxFev1lSsiuIBmns8GflJe g==;
X-CSE-ConnectionGUID: pN2jvDvkRt+mwfNWm8xl7w==
X-CSE-MsgGUID: cdzGuJaWRMKMRYTKxKXe1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53468950"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53468950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:53 -0700
X-CSE-ConnectionGUID: 57zgH7OqSYqNK5T8xwe0Dg==
X-CSE-MsgGUID: gWP4VNO+SHCDLvqn4FC1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156340774"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 12:07:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvkMHhkAUOuCrNerwj1VwGCSFwUP94Iate8GNJJ/D6iZF67gR3LVbvn4t+IXnUpejzUlIWC12i349hGLvyNx2ZRVlk5DUl9kBTOnd2QtCxN7TGeuXphpmjw4N1hDGhDoBqkXK/2H5cP/JWH619wyckE44415DvfFwnDU6cH1UPz+lBQTnN+fKpNPcgiZNSu9tr6QSU6dBSnrW7FBMpd6XLvUGZIyGz3uxMTQtNMycwnko5Qo2LHVXNxGVmWSSqS0Az1qDsTv0Lk6kdAGtSgUBVevd7nKrQ+86lkAtQSaR+rbIAA+azu8hy6amvi/TQQOzNYimwd1x3557a0gUlh4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOBRsoEyqbcbJWIiBz8Uo2h+DnCsntRsLGHH0XDWdcA=;
 b=cTU84YE/5ID9o2YbubK2ZiFEd+rRC3ffKE+r6jUV/FaE3IlGowC0CJuSO+/RwfT0+miw0phifn3lwiX7yTfEkUdyAz/UaV2LA55nb36yOwFtxid4qJZPCdWn01NopIK2mC8Rl/e2YdmjFuNsp0zhD/XDFHlxysk/+TW6EYtX8MwCwFA5uBJmjk2wt91oZQt6wgiznl7Km56KgGu1+ZB5Z5HMe7EKMBrYSoH+PL6XxH/BxbTK8YfW05FE+oATq9RvjC9pGEB9kLPfPTcDWuHymMoW4WQ8Q9vv2WWb8Fcx1oTBFeF5NryGP0faEgkOZs+N6BOjE4lrfzBTXWv/by8DHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 19:07:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 19:07:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/guc: Rename CT state change helper
Thread-Topic: [PATCH 1/3] drm/xe/guc: Rename CT state change helper
Thread-Index: AQHb8PioWigV8IODFEa7yMaBEJvQHLQqIKOw
Date: Wed, 9 Jul 2025 19:07:17 +0000
Message-ID: <CH0PR11MB5444D7724927AAA9D1546DDAE549A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
 <20250709174038.1876-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250709174038.1876-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7685:EE_
x-ms-office365-filtering-correlation-id: 842205bd-0b75-45f7-6a5f-08ddbf1bd261
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zHfq2Dv4/kIHjv5qbHVGB8UaPjmsUUt/x6vEUjrkZk2OAUF5AMoVtB4nclxE?=
 =?us-ascii?Q?ZDtTiZ7IjpgoLcGVbklRGtzFCdb1dtjVCbq/F+TXqYvvsjgNzYBK/7gYueYd?=
 =?us-ascii?Q?KyKN1Um43F6rKD4taFmK2Z2HZCMbEcWvjQc3Yoz1iKFKcFpFUZfNog2m4QVV?=
 =?us-ascii?Q?ZeN3T4wHTR7RXPPTYBo7LYvRVNX+QFUvlQJao9yP/F+xUy2uI09VAna6fD3x?=
 =?us-ascii?Q?a6gCV+r9/X50/wKxG+f2f4FkMEJ0lGMe0npIo5AobKZtHHKoGUwMVuODj/zb?=
 =?us-ascii?Q?TQpNYlLdN1qjG1TgsCdWfwz/Ac0O694uSe1GCkNfgjf+vfQalla7935hl2Eu?=
 =?us-ascii?Q?cBy5LxqKwKgsKLELbmPvBq7/2KiLvBRazCsIQF4elJuP9QUuOSXJZiLGaXiY?=
 =?us-ascii?Q?GnkqpTugTrh9FG2W23Cwu4V/rmXaem4/gL2PQtEkvvyNVhOvGVSbtGWqGksa?=
 =?us-ascii?Q?0kVKjOPUgdQvUYcx40ky/R2iY2WHvod3i5ZInXyZxbhWm4iTJMnEURm3WvL5?=
 =?us-ascii?Q?u8psANrlnFw9/ZUatXzT5T5Dsy4EUrz9kK0J9VrwLu+6OLYX1v9ivGFLM1L4?=
 =?us-ascii?Q?Jg/W4zkLeWj9HIaFblFTi9rpuyN3QUsARnYdKgziw/D8MVCOvfCi5XDAxdS5?=
 =?us-ascii?Q?OG0VIJDQmsbvqxcCqNAiIXhdYKqiwaZ//YtAq5MCLZYtbsgzqGqPe4DYG6Db?=
 =?us-ascii?Q?qFZoVWPEOnNNmG4p4Rc5xjbkkZBjfO+mJJjjiM0WVQFTib2nhC8dwk3SSNh2?=
 =?us-ascii?Q?oLvc9zFOgiVVlw9LtRhglqAi2vLpWnobqn1pNKIwEsliGXjUW2sWlI9CDbd1?=
 =?us-ascii?Q?c6uYk2HBC5U/wapdHLxhxkDtC3o61foFj537e0QsJkOpyZ4+cySRjZ84eTBt?=
 =?us-ascii?Q?izyn1MF3GbUVVXExQg2vEL4kP5kAxY1XoKrzSrcjNu86AU38JGDAI7cKkpdp?=
 =?us-ascii?Q?JmR1C0GjxxwLvAUZD3k1d/LHrBqBv+1b909Jo6M1h7QFUVPWJoTxyXduN+rr?=
 =?us-ascii?Q?DJYPYOqF7Acn548at2Kday9uSDVB5wRidp6eiJaHZ+8zxSEa9Ty8/MP35SXj?=
 =?us-ascii?Q?T31910U5jjH8WCWKJOJjKN4rRf7XlAZ/gzL/tLwWZsGK1jZXeau1A5dEhxDE?=
 =?us-ascii?Q?1oLkjAovhere85oVxxLsX3jx5ELlkGvdjhEuWWrkmGxCM5Z6hKe4McE3bfa5?=
 =?us-ascii?Q?5Pl9IYF7AUoV1A0E/SlyPA7Uo+hF6f8jRyHDdHR9lTeUjYYndHCZJK8Hz45R?=
 =?us-ascii?Q?iJapLSGQ8U8P6Tu5v1ehIRYPupVpSuJXcfOmk2+D+FRKUqBdKqPM423c/NlC?=
 =?us-ascii?Q?Vd1Xzq3uHqXUouiLXHVZWcB1zOqXInFxbhp/z1tyGXJhAIF/1sTvwroLskFO?=
 =?us-ascii?Q?n/zzqrQL6v5IrkkA9rFtRvxFhSjTRMCEzCidPjNtAw94KzYTHqd/6fgjQ7xB?=
 =?us-ascii?Q?qocnq93Ui/NWCHS/N6acNRYpx9R6aUFewvXaaEk1RYqL5XpNjFiszQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mYCd1KdAm8ZZv1u9PNDtmQPDvq1NEg6FUkKPpWk1imf62pMYII9a177C9gFb?=
 =?us-ascii?Q?nZT/oh8f84s19evzUFrpGmKJDLkhrgvDklEvyZpzYDQo2UdgkB8PI7iMoXCd?=
 =?us-ascii?Q?MCkqdx5XwW7DDfglUiCCHzFQx4Qi8W8MFAsb6Pqo9yWpFyAuMZzkCgZboq7W?=
 =?us-ascii?Q?pmDhrydoNSpE2sviWv0LTlczfe0Ib3hLsSJBWqT49qC23geeemya1ikMKbzZ?=
 =?us-ascii?Q?BBaNRTh7QF0z8Iu8PGIc6WvSlpGqKRzLZ/7+4P3ZF8qa+eUtqVh91SUiH9OE?=
 =?us-ascii?Q?o00I4YZ+Yjb7ACM7NhF1QDld7j+1P4DMF4VQY7nPpPco8oplilMHhljVWcT6?=
 =?us-ascii?Q?wGMg/D6vyZNPk41fqvn2NDsiPVitu/6Q0YU8AbIflmDDaVBpkYWVS03BYSEY?=
 =?us-ascii?Q?5d3hpedekt4YCNwpZDEmNXtLAWm/EYyD1+/DLUA1Q9Q1BuGIYr8WuuZ7kPe6?=
 =?us-ascii?Q?DJybw1S62pQe4kmmjkQmQ65eDBvtLvBSUnRiSjMPYWnhdtXZNpQiYjNLB/Pu?=
 =?us-ascii?Q?tIDrFmeV7+T0Wl5s0PgobouQRwirj2kUE9UyfJ0r8jL+HcHcRQ0Gcd+dSZB5?=
 =?us-ascii?Q?NxrNvgoGRA6mihlrQQwkukOCKmmpK+VtG3q5stdtTwxIakPqdL0vS7ma9SLy?=
 =?us-ascii?Q?jA6BvJvFIv2ZhWqKq7rikS1v4vb5kE+ugZPizOHgI6hH9SdyJo2bSpVcv7+6?=
 =?us-ascii?Q?qcl9B0FNIUA7p9bzHkHGBH0O/5b3d5WpbRoDI1PYzPjI6lqXVWZadI/99t2c?=
 =?us-ascii?Q?Xz/WAQt5TIfBHjX5LvKgo1X3e2eAPfW3OHiChsJRs2QDYZXB8wTDlEFzTIa3?=
 =?us-ascii?Q?O/Mz21Vi/qgHaXo6JikdPCoVpY6poXZw3/e3q7O4qkeSf14TyZAQTQlh97k4?=
 =?us-ascii?Q?tSYapdatGdKh5BLvNOfKnPqx75Ah6gwdUmpUottPUu6/3XLIwnnJxSyEQm8g?=
 =?us-ascii?Q?z87n1pNzJUgRY/tJzTWxPp5tWsmq6AMWY/6Oh38PxBM/kZCX3S1VhU/t1w/R?=
 =?us-ascii?Q?YOpnlCqSR17LYtmfvztO5nhrHBHg88srDGhRn81nufe6P/giZ7+o2VM2nZ1E?=
 =?us-ascii?Q?0bBGVr7cByM707WzUqi3JZqkHWsM06lpgu/3iRhFiz4j2MzofTu/+vq5zO9x?=
 =?us-ascii?Q?y7VWgYy7EIj7QPf8vWgTrazCSxtpXn91yvBkkF3oDJMLBGXzzHHuEK98HD6v?=
 =?us-ascii?Q?ghAMXpo6tyN5uN7rfsecJNo0bGk9jM6kLb3qwgd4QVbrHh68uZ8Nv/4D3DQc?=
 =?us-ascii?Q?J+M2RfqsAwo+Epe7/7i4JkgEvHnqV8Af75Et36rIjtxbVwJ4i8NmCozWIN2H?=
 =?us-ascii?Q?ksiHcav3VChJgef+Kx0LivpKNRDTa/TS982+3G0sdLLn87OJzzHbFFyFaiQG?=
 =?us-ascii?Q?1ogERJ2ok5kCYMmju5HIOEkZGtvkIJsWXuWpabhhCWLn74EtFYJ9yguFlmNF?=
 =?us-ascii?Q?B7E1a3ZxbPuQ15uAahhihPpLuHxMxwIJglH0K2WepgW2j2zVsdoMZQUGVzUp?=
 =?us-ascii?Q?Whp40S9r9RSml6zbDCUy9v54FpkVmVZpMDWv2QOedeptfjypiXHInuc3Svu+?=
 =?us-ascii?Q?duFADi7G642KqT4maZvG489VtBy/rmc3i2owt2gfp04Uh+Q3nOTPS5jFXs0t?=
 =?us-ascii?Q?c2Hd8pnjHwsfDKnBLEWMMHVFczUgIBLsCyBUoxmHneUM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842205bd-0b75-45f7-6a5f-08ddbf1bd261
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 19:07:17.0823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gg+vvopV4qd9Pc8XILVAAwsfcjWA3+Japs/tpC+Do+ZyoX7p3wWeSajDWqk7mQc+3u3VK89bEIvY6uzuz6KJznAzzQAQVt9OQ/T5nsvHOqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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
Sent: Wednesday, July 9, 2025 10:41 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Brost, Matthew <matthew=
.brost@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Rename CT state change helper
>=20
> In this helper we are already doing much more than just setting
> a new CT state and its name was little misleading. Rename it.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

LGTM.  I don't know if it's quite right to remove the xe_ tag from the=20
function here, but I'll trust your judgement on this because it doesn't
hurt any.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 23e8c155025e..2a052dc22ff2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -384,7 +384,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct=
, bool enable)
>  	return ret > 0 ? -EPROTO : ret;
>  }
> =20
> -static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
>  				enum xe_guc_ct_state state)
>  {
>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> @@ -469,7 +469,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
> =20
> -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> =20
>  	smp_mb();
>  	wake_up_all(&ct->wq);
> @@ -514,7 +514,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
>   */
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
>  	ct_exit_safe_mode(ct);
>  	stop_g2h_handler(ct);
>  }
> @@ -530,7 +530,7 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  	if (!xe_guc_ct_initialized(ct))
>  		return;
> =20
> -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_STOPPED);
>  	stop_g2h_handler(ct);
>  }
> =20
> --=20
> 2.47.1
>=20
>=20
