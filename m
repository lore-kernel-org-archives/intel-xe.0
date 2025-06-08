Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF6DC5AD49
	for <intel-xe@archiver.kernel.org>; Sun,  8 Jun 2025 23:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C34510F32F;
	Sun,  8 Jun 2025 23:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X57V9gy9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8D510F325
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Jun 2025 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749424046; x=1780960046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gUS/4s1Lv9Q8B+CB1hi8O9Ab8NtVh31zjJoRnAZQvJM=;
 b=X57V9gy9zct8rtCraFg76CppHBjTaCHnevXz1+c5q7s1NH/beq35K+A1
 Cj6Q6VIrNnoBVbMe1gO4qtostVEgds++YhV9QwYzoxGgPs/ip+FlbwXj7
 Z8vL53TdKmYQxrLJwPKxRt+9vl517qSxu3/hycE6bubyxI74S4BeY9+3C
 n2QmQ+LvFSqOF3ZOYYM05DoIeHlDXrdoI7Q+lUrCNfWuOoTsjxM+IqERZ
 kAFGKXk24ebKHR+SQKUo5lsSRSgkWT4/D9Nl7XQLEYiE0m6gkC1BOK8eq
 bZMIA1tmvQ04cTDXC+qsSH5QHZUgfof9wt5MY78WJH0KA/ZfPioJmIE8W g==;
X-CSE-ConnectionGUID: anrcoK1lS1uRRRZ9yeq9lg==
X-CSE-MsgGUID: Yhb7QORfQ2ijNgfHVE8qrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51373920"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="51373920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 16:07:21 -0700
X-CSE-ConnectionGUID: V4c4XTH8RTCS2Pc9C3A9GA==
X-CSE-MsgGUID: V8xOGuUvTNaSdZnQkTIhlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="177290767"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 16:07:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 8 Jun 2025 16:07:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 8 Jun 2025 16:07:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sun, 8 Jun 2025 16:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUi5NX+oPsdubfXKvobzNz5FqnFxeVRjkW+gCVyV07Qw8Rmn5mBfNgTBsQwa9wRhB0M+00vR4inxq+cp1OwVPYbuetDUTKnKddvK+4YQX59SB10Z2EhfsN8gSqkO5nDuZT6NWi4QjlnfC2zDEBdkN5FW0FwST7HGKgjmRQ6jBzfGQNMhA2noI6mNZ6tu3S87GZh1qtiFTVBrcYIY6idFKjqH+W1BYYiSqGXknljlSv1vULVhJNML1paemLfy3qrrnKEhNoBxgFWiZPE5muzF3bf/1X5FbiDs05gibg3Wrrdfr64dcASed4AfyS4DWLHkzIv6ucOdQ29r1GIjHKyPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zxt5GSxEJF15oDEQYyFRVOHnapPOz8pdZZWamkQXho=;
 b=RmgjtwaOs/s5/CcONBYl23+/mRxtxflCfn9zlTXC+jiRrskzL0ohctZFpl7ToDDKwLmoaVWBxdgzunXs1Yy8YVvOhukUxZQ8Lg0OYOnYQxwY/PuvqLbSFSVqfH+66CbzTZboWmi204Gk4jOLNxN/2OgVq2njGD0FXKt4K3GyF/ZGOSManXqlw5+7CHWTcl/dw+HEM1A5eZG2PnJi0D5ltrfEDje8wCt6+ZC7FMf0jSgOknWEWKQrynwWZzVuO25kT+Q3dUXe/YoUPzi9ZDO9xCiuprvjV9rajWFoSArYgiMjBiFqGppiZ37cYAqRv6VeV5y5zNGdUAPUXvFA2dHfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 23:06:38 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 23:06:38 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Correct sync type definition in comments
Thread-Topic: [PATCH] drm/xe/uapi: Correct sync type definition in comments
Thread-Index: AQHb11TdHjzoOQJNG0CimRnK8Gxv0bP3Jk6AgAK+QqA=
Date: Sun, 8 Jun 2025 23:06:38 +0000
Message-ID: <DM4PR11MB5456DE7318189537CDA22E64EA68A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
 <vpqc2ekhmobylcprr7xhudmfgrxghsdttwbayw3liln4r5ctgm@lemzetwi4tg3>
In-Reply-To: <vpqc2ekhmobylcprr7xhudmfgrxghsdttwbayw3liln4r5ctgm@lemzetwi4tg3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB5327:EE_
x-ms-office365-filtering-correlation-id: c0cb8a10-3daa-4e83-c15c-08dda6e11fa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0gFm8a7x9F09xa6c4I2F6tgzL63Q0ipfqFWmzbEutz/bQW5HdYuIQXrVAo1f?=
 =?us-ascii?Q?eIxW+zbyoBQOqr0Uz/Kt3NRgwim3gV+l8obtdLxJ09bRM1GjSTAD2TAcDLb0?=
 =?us-ascii?Q?fYB5dvMZsBnUwqnQomKzTNgJcUXEKJBncUCS8CAyLg5YntL6fz3LMJCoWmqg?=
 =?us-ascii?Q?AZjhF94bjxBBCuzGOA1vffmfAu39NbTyDBHbXT5N7h6daddpJel+Bt+QbwJe?=
 =?us-ascii?Q?57ERn64fFVDVWR+jNV0kEOv8q1E5ts3fZ0oQZf/KugBfQoNfbWk2bAq4CZMw?=
 =?us-ascii?Q?us46sw9CgTS3Njgrnuey/pRxr5zCPAR22c4usqQf390Xb4XrAuvuRMlShK9/?=
 =?us-ascii?Q?5dK3bt0wiRbgvGaLMsYMWqTqV0QFp1gMCM3d7kRZRCtjDy9XTdgLvEe2do/N?=
 =?us-ascii?Q?GMBV5rCkz8puWsAqghKPc6pCSRkE+GgEvuEN2ajxLhEhwgnlz1WXMelNTTSU?=
 =?us-ascii?Q?SPLV5rm0k4Cj7cBv/mupsCvEJYC8MRvWvlgs/AAp6+aZGovp+Cu0fznp9RuV?=
 =?us-ascii?Q?eYlnwjnMvoFBchQ0DgLGXp+DwWj93PborXTB/qzFj6k9Gil+ocZ4AlZQq7uu?=
 =?us-ascii?Q?N0TBJs2eaRTWO7nsXmpd/XEGgirWFEI0thGkNGziesi5ret06LDbEyaQql8M?=
 =?us-ascii?Q?+EW5TtAGsa8onn4DysxcaJF3qJSHUX4bzOux8xLC7KVMgrc4h08HzA+ZpaBS?=
 =?us-ascii?Q?B0vXt8Ia7ZO7Slzf5SWSelv10bvWEQSho5dj7iZAKHtOOXvl8oQavh/1gtGA?=
 =?us-ascii?Q?WfL1eK5usbpOSYT3mhcwMEpj2aZDkxSkvgerFMY+CwUAqquiRxnEZ6lA/9W4?=
 =?us-ascii?Q?EL4erRVRHV2Ryj4xZO8HuCfHI9J3nliY/EOQnMExaJ0cqVa+L5xOuKypEVCf?=
 =?us-ascii?Q?uRKeaWBIlwlvq3IKBfNXIkfEXxHP+6eMlRaZPFdTlnM6uiIztO9n8do8LOq5?=
 =?us-ascii?Q?8COfBNia+i+InUSoOnhueoZaqKjKdpmftzxFOmE8UC8pjFEb8rVGUtdZcMok?=
 =?us-ascii?Q?pQHYq2Fe5DnRgQlKAoxU2hx4WKgmksMF8DgksL92jj6Hyi0p5WON/YRb3M2D?=
 =?us-ascii?Q?HcHLlgD5g702dO97J9/EljxxFxyMoAPkoDnsD6IyX4VQvm08fMkz0pbLefxb?=
 =?us-ascii?Q?dMgfUGTMOJV0nK57sSr8g569zUuDnuEWsw/aEdjEqcE4aTMAFoMvAG/6uSkR?=
 =?us-ascii?Q?VyA4hYFljd67hhq0G5cZv4qVNwmZ3XK58FGhPNDKKGkXp6YocZsPvTi49/xU?=
 =?us-ascii?Q?j8Rs7nH5u0A8cjfgUhwQzqAtFaSmIcPS44DZdlqwlcDylMh+r2/8XJATTANj?=
 =?us-ascii?Q?XTT0fe2P9RxF373iKUXlaBMx1t552ImNXV1xxbiQrjxmnxhmZQ9aeARxhsYJ?=
 =?us-ascii?Q?16A41QbwDnHC1pZMGdswnRuITacAqzq8UjgsOr8YHl+6kT6/UJKL0yRBZT2i?=
 =?us-ascii?Q?6ndNmLOX75yXTqaURP9pDw7C3gBF4G+h7Vi1Zbsk8gRNl2VR6vWhBdqVxHW0?=
 =?us-ascii?Q?z+NbcDs2rK0b9Iw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5nBWZLBeRN5iiJimz/N2wn15Fa/10qhg3hEb5kErF8JhkmaHbAy3teI9UXYs?=
 =?us-ascii?Q?9dfnUT2wkd7Jz6/jgkHvkIrFGiEo1+JD3VEcG8lpa7WsxP+inWxxfxSFDvE5?=
 =?us-ascii?Q?cYR0Orst1871xqJo4h+FW3muCFK7tSO5v9qQue+rPZPwNXCil5ewExWdYxu9?=
 =?us-ascii?Q?FJupJ+RMQGQV6UeovO60tpBfwfGy8F8YntUnDKEypSqymhQg+lK1nspgRVXP?=
 =?us-ascii?Q?Le93ByhXshWVZVoRc4X9jMwfju4KJgVzXoSpruypQB82MOVO/5N/7nBsymyR?=
 =?us-ascii?Q?2mk8B8KT64AOeCb3g2IlJ4FUWLB0rBhD+zl0f/4cPJ6ewXO5GoJgWT2K3dm8?=
 =?us-ascii?Q?uh93umnyEtPOZk/ki2nhfiREJL3woIMd2qCbm72dNGUATC2WNitOIltikRJY?=
 =?us-ascii?Q?QHnuYlJN6L2wczS7cpGV5bqs47XcNf8z3b0xSptQXy1ymcP63w0LkPzrTZRH?=
 =?us-ascii?Q?uaWrzmy95fv1CgxqA9eKsfLf/92req+WHj96O17dfO9fiFS22gIo23Ez6Aci?=
 =?us-ascii?Q?60sMQsFaPPi/7OJvJmm77rTrzXFl/q7mbxWbX3pl+nvmldAP2QG4vwn6IUQD?=
 =?us-ascii?Q?WELShzEa8oVrgknqfRAuNZhv89NmxbnM5aQ09Z7prE1oc+B/pVCD1Zg8vO8V?=
 =?us-ascii?Q?qjJGAg9VmqRNAhOLiPqQeWwrtW1b2ouMQsHkyofUw5bMRU4tvyBfSN5RILyi?=
 =?us-ascii?Q?JBm4NLo7349GFVXW+esLrxCD5vuDyVVYOAcwkPS1cq01XXbzhnmdzT/F4uNG?=
 =?us-ascii?Q?FfbKCSlD37jZnBeNjp9bz3XvSf1KqFr5APM4sJD+S4HiTa1VthYaNh5135QF?=
 =?us-ascii?Q?e9VioRlruMvac7p7C51dwNENbgCt0CNQVnEkFOc4YAx8TvdejAGeSX+giPmg?=
 =?us-ascii?Q?OWkM9t9RUSP6jS8c5pdEV94vYGamIox3gYN7ypdgOBW3/vrwHkNvB2alrfXs?=
 =?us-ascii?Q?FEb/m6lYSf/0UoK3gjKqjBI+GLM1+XTCuY83zwX4xB660eeydPFw9aC/U1r5?=
 =?us-ascii?Q?L9IE7pqFGsBdLEvNXQnhm1UPIVq52rM3HNB4/YfJo8qK7bHZQ7hTjfjqGvDO?=
 =?us-ascii?Q?darn3f6TGiR9HW9s6eexz2+4GeH7ySEeIc7bnUN+GvQ71thEtJq9zUK3GlbB?=
 =?us-ascii?Q?h5TI2KveTFVNNj8JYk5MT6SadKjpcwVtMw16YHGxi802bCiBaV5JS05+h794?=
 =?us-ascii?Q?ajGZCKBblNGhN5Vd0Rfmx860UBfLNLGavkMDhGOyibwPb4HiMYY48b7mxuB0?=
 =?us-ascii?Q?C9XjtXoTvD1GpHEPpSDe4LEfdAKSIpXHNUZ/Pog4weNDRB9GzR84XEk3+wTr?=
 =?us-ascii?Q?gj++Ay0IPhftk+mWQbHR/y+TwpJYBgg72CusqcrXCBTQDOD7GBqCxZGNtnqN?=
 =?us-ascii?Q?O9qKM5SotnZuGwlEZ7XtXCEc2RrOLj7nM6nlzmLDOmDns5YBSUznz+Ije8iY?=
 =?us-ascii?Q?FqABbtow3OyGh/BYBPZVaIBNd1Y2ez/uxYfAq3CJg38iJ+rytAY9feWbYIeV?=
 =?us-ascii?Q?+Bxf7bRdDthNyQLLSrkZgixDBR6MFuFRbNMHwhXVScIKQqQN1mcdBXq+hmDM?=
 =?us-ascii?Q?+QkNgp4XKFjGYRjnhsOkqylKHuZTOAK2MN1b5oAH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cb8a10-3daa-4e83-c15c-08dda6e11fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2025 23:06:38.4748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ahx1Ov8LavnfYTDSd5dQFQPiZSTJfDz1E+TyHiYZ4Y240GMjG+wTgtwgrLcohTrGfx3SZjNY1y86WHKovcCQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
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

Hi Lucas,
Thanks very much for the detail check. I really appreciate it. And will fol=
low it for my future patches.

Shuicheng

On Sat, June 7, 2025 1:10 PM De Marchi, Lucas wrote:
> On Sat, Jun 07, 2025 at 02:34:42AM +0000, Shuicheng Lin wrote:
> >DRM_XE_SYNC_FLAG_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_SYNCOBJ.
> >DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ is renamed to
> DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
> >DRM_XE_SYNC_FLAG_DMA_BUF is removed.
>=20
> This can be seen by the diff. Here it'd be better to explain why, not
> what:
>=20
> >
> >Fixes: dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")
>=20
> this is not really correct. The rename happened in that commit, but the c=
ommits
> using the old names came later. So I think the commit message should be
> something like this:
>=20
> Commit dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags") renam=
ed
> some DRM_XE_SYNC_* defines but later commits kept using the old names.
>=20
>=20
> Fixes: 9329f0667215 ("drm/xe/uapi: Use LR abbrev for long-running vms")
> Fixes: 4b437893a826 ("drm/xe/uapi: More uAPI documentation additions and
> cosmetic updates")
>=20
> with that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
>=20
> thanks
> Lucas De Marchi
>=20
> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >Cc: Francois Dugast <francois.dugast@intel.com>
> >Cc: Zongyao Bai <zongyao.bai@intel.com>
> >Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >---
> > include/uapi/drm/xe_drm.h | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> >index 6a702ba7817c..5f1524f466a7 100644
> >--- a/include/uapi/drm/xe_drm.h
> >+++ b/include/uapi/drm/xe_drm.h
> >@@ -925,9 +925,9 @@ struct drm_xe_gem_mmap_offset {
> >  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM
> accepts
> >  *    exec submissions to its exec_queues that don't have an upper time
> >  *    limit on the job execution time. But exec submissions to these
> >- *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> >- *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ,
> DRM_XE_SYNC_FLAG_DMA_BUF,
> >- *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIG=
NAL.
> >+ *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
> >+ *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
> >+ *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
> >  *    LR VMs can be created in recoverable page-fault mode using
> >  *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
> >  *    If that flag is omitted, the UMD can not rely on the slightly
> >@@ -1394,7 +1394,7 @@ struct drm_xe_sync {
> >
> > 	/**
> > 	 * @timeline_value: Input for the timeline sync object. Needs to be
> >-	 * different than 0 when used
> with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
> >+	 * different than 0 when used
> with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
> > 	 */
> > 	__u64 timeline_value;
> >
> >--
> >2.25.1
> >
