Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7922BC7EE32
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 11:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B3410E290;
	Thu, 26 Jun 2025 11:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYv1ZC61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC4C10E290
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750938655; x=1782474655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xzmyqmtuUG8p69h5quXbBm0Cpf2GCHFRCGXjHjl0QCQ=;
 b=QYv1ZC61ZR92mwkF/5uB5MK/zVWQMQNwaWx/mGUO3RK5lMIAbI+e/+PX
 DdaBZ4XKB+X3zPMobgzAKaxEoxCKjtQa1w2O+RMpz+MlgtXT6XzCG3yRs
 EYI3VsB8IUa6cg8C68jx9/6LJV8YAf9ia+zNX8a78Bsr+kz2BHHHTMT1J
 YOgDJ13fvNcSMsdGi63Am1c55cNBXhq8L3Ik21RgVVaweOvyVMMkBy07K
 OFjccOGNgYaHlYiLMm8u8wSpA+OempZY1PmFta0dHvSXpfdOrouhLjQgR
 U7Vw/tQVufD7vhOfBM+V9lSC6ouVhEFJu5CGCKB8xtR851zTGqaGHCHky Q==;
X-CSE-ConnectionGUID: y6ZO5xp2R3Wu+Lnr0B1b9Q==
X-CSE-MsgGUID: SypZfKV9Q1C9iLCmroIZFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70800542"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="70800542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 04:50:55 -0700
X-CSE-ConnectionGUID: b7TP5nHrQaOux+8eLyg6Ow==
X-CSE-MsgGUID: AZAK+6SNTlChRR7nP0N4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="183529507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 04:50:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 04:50:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 04:50:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 04:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBS+RXwVs0miOXHwcO+KtO2ylXmfThW1pbEQscQC93lsEbvY0DpFtqLkJZr1BIENI/8ynSx1Fqh/TQHh6i9vf4g877bIoNjd90u6GB9fA++J3lob7RexHNVwtAFx+y0Wk6yOJvRQX9jzBXvxeWGr1eA5rw9Y+xEV+jVPdcFgp6GONtyPzWcRDemmQ39o2f6ryprnBa7cWs1gYC05NbyeTKrS2D3aHtDTUcqrYcZzZghC+TSv0cFY2D47hYjs3xbTLXYLOQdZdIxcyySnL0VT4QEFrmaEyrdSMWURoshuSO/m6efs6cY7LyK1q28XbKgsEO/XL8IuQXSq1I4GKWSMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAqFKkMVbZBnktTe7yiuL31sAoe5IS4IPKqitcTpduo=;
 b=efhnjet+ZaVYKLC7Of0F5VifaAsK8kFaMgtAwdBO1+JvTAKBRhazCyqLhKj1K+tXrXSpUuTxtSzC7rZS+6ecU8sqHcuzbyTr1NI+3ivoGhvzPr87pqDqfzeAz4xKchW8kqayodAVnICCY9nQKR2XyCZmTq0PRRRb1K2YsL3XkxECcb9MbsyyyxqWMB/5A8U9XTDz0NAkTcTNdsm11okPXUmPs8AePbHUvNbLmB1X0IHw+i53b5w0yn/p4+1PpRnqqNyUp/IL6j2zbn851J1YziXZ1AfskIWKv77V2uEZd1XWdJHn+i0dVnm5jfA7NB+uH8/ZlrH2mt3ei5CRw9jPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 11:50:50 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%3]) with mapi id 15.20.8769.022; Thu, 26 Jun 2025
 11:50:50 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Index: AQHb5bRIDEpcgF78KUm51MffYJCX67QT7XeAgAFlzFA=
Date: Thu, 26 Jun 2025 11:50:50 +0000
Message-ID: <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
In-Reply-To: <aFwF53I_d8OkwI3_@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DM4PR11MB8203:EE_
x-ms-office365-filtering-correlation-id: bc930089-225f-4806-dbc6-08ddb4a7b29c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IFDh71QGxT2UlZDyfqeG1DbUAQPwVJw5H1W4gfW5XDk0GwZlWGOqwt3wJDce?=
 =?us-ascii?Q?W6rdDBNb//MGvEzb2RazNuWhq8soemp47EOTaWsAFQB/4ZxSgakrlriNc0o+?=
 =?us-ascii?Q?Be8byFsqsdJeY3uHLsobQE1EnDjNapWqEVCnUPXPYnsXalia7o16JZiWtr9F?=
 =?us-ascii?Q?tJYMua6KvY8YQHwyqwvYvIfNkWR4dOV9L37gNolH431lvZ7lTAqrH8iab0x0?=
 =?us-ascii?Q?hhJAC+3ID20scAvLpahLLsmlhXvFXNRmeQ3sTsp31JGux1Qm1UNxxo/NDVIi?=
 =?us-ascii?Q?JLVmMGm3q9ECMntHiewHrX4anUX3T7pViKj6Ebwy0qZsb/QHUTZEeubyJFZS?=
 =?us-ascii?Q?wl+0uVTGTem/Ah+iHjGZB/Bj7YZXEXuThNDGzrnLyZo8dOmSFMvTU4K7l1vy?=
 =?us-ascii?Q?hOcoPVW1CcgahMSJRvxti+t6SowDCiv6kmOsH/82zpCgRp0xbSCHPgdGSBqp?=
 =?us-ascii?Q?uOMloaiLs5RS5gpfZZcchtxnGIenBPQM4VL97QeHyzJVf9Yi5iWynqXBvSI0?=
 =?us-ascii?Q?KMtXMgkiRxREkkLSfqGnnwbjkfvewzC7m1sh/KvDm1/kIdGalfv6UKwXUkGk?=
 =?us-ascii?Q?7sQ3VQv1SYXu6QLdgPEbIy5Itrnzd4QrfYAPpePiZQt4lJzu4zyH9SFv8NSp?=
 =?us-ascii?Q?y03IDqFEhHHx+uALeoBROvMDpgRVvIAlbvKd1pP09JRAXaNBy1HsMKIjP4ST?=
 =?us-ascii?Q?wBoRqX16qPypWPfG7jCDJ8YICbsu6PkLt2Q/l88I6UaSn4xtczXF72+DR/kG?=
 =?us-ascii?Q?q9jW16WXG2TiERd4lvuNmDF4aJlecwgJVoRDrwOXvoejmn2/LOCqXy5biEMy?=
 =?us-ascii?Q?HxJ0GBIgnqYqvxYkea+DvR1w8t4D8xRFqDydzJiqzJxqNpiRu4JD3Qp0frhA?=
 =?us-ascii?Q?GPIJOleT83g1qn9tnW0gea25JLwwIIS2dFi02UCb8Pb/DBCcxP943GlC7N0j?=
 =?us-ascii?Q?DKPebrWK3F3eqcQnaty+z3fT5QdgcaIU6ioQi6QrndgtnlCmEowk2k6YII5T?=
 =?us-ascii?Q?u8F1DDCrQDpKH/w3xVG2DYCY0rTSt57w57K1ywB2bpKK+aOhu4U/0sDYSHDn?=
 =?us-ascii?Q?AtBq/SNC/tFeGg2KLrTip9q5ZFAFtbm/FUkCMMmeLNXIaMnTzrKtDBvCrTUm?=
 =?us-ascii?Q?YquGdBQy7ZaffXSeHf3jdopti8MJ4vBtFv/a2JnDnD2LE2VOPYOXCDwxRTmC?=
 =?us-ascii?Q?7Q4yAc3jpD2NeD1B4V7zZi4c+40abbiPuIjLb3m+AOY/yCkuUGqjj0br0X7N?=
 =?us-ascii?Q?J6rshdxG55MrPXUNukDkwcTHaS5E08RxteD1ye5M2kFGX/ICMijhzdVn+Gkc?=
 =?us-ascii?Q?vYEI5NFURloLyqSN0E4Adv9e/fczJNS1QYfne5n3B6ulktvUwOcPxPFcdTFc?=
 =?us-ascii?Q?RtmeFZHJFOtenKluagZK1uacnLqZfDU6nAIKSegL1YDwFYqft2/pR6k5Xe48?=
 =?us-ascii?Q?ATYljO6OBDNv7FUxbiNtdtG5FdLT55TDeg1RCnNOcClqR3Xo3J+i4w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lSKPHTb4+ehclcEy3Zuj7czGZRUgr/62ubOyViKsl7iMj9jreEkGGuDiKRbA?=
 =?us-ascii?Q?nJNsE9FZJd7vt+QCIq5X81sjjJaNVOnaPisXUhFbCYzog9tFgCTg0QzOeT0D?=
 =?us-ascii?Q?+DLCz2WRVjlPl1xYc8L1rIkXPa8tGif7tDfRnh8VqqUbaXF14mdNoxVNV7BB?=
 =?us-ascii?Q?N6Lau94KpeRR0OQgvZ+MsVY6ay55NXM2kU1KvZ3kKBqY7M1l3UypUKUID29R?=
 =?us-ascii?Q?NVz14zc5thVpz2/tyD/mvKI1wu6qmL1vjkU2uVL05Gfr/Yk+ZHk2UZa6wn7S?=
 =?us-ascii?Q?SLyE92Fefa5pbO9Wg7l+e33Lj67n4lq8SKj5+x5jTvMrktKtEVw577e8SC9q?=
 =?us-ascii?Q?8G4C/QHlALhcDTrlBQZ4O1L20zWD9W6AVY3OjIHoNEYyjWI8H+vsjoYLs9z1?=
 =?us-ascii?Q?JnQ5xkK84G3cZv7DoXUh8+3IwYKRDBYLiy/uBBHF866HFcMCYwJ1KVNgLACc?=
 =?us-ascii?Q?A+yywI0pf0WjFpa7Qoil7PNZbiTsAkg2+teJOm/8AeMBwQjWLOEf7D2/S+8W?=
 =?us-ascii?Q?79Vm4WPrCD74ZCf4UB7W/SPzwlEHIWPtx7Mx87XmKQlZdDFn/R6kHdgfjvAE?=
 =?us-ascii?Q?PbJBTxuZ//AtV+F8OCPng/2VEpIqFaCaEUPuCLgZnAsju0i65SHCwai7IzYh?=
 =?us-ascii?Q?ZvnXclPT9vx9LXLDh3EC/m/ZmOTwEOOu1Sj1qDMiOB1k4x1gYz0EobJs/xH6?=
 =?us-ascii?Q?zNgRHvJVzt6hSk9ze4OTJd95v85LXfxaOEhrBjUviBmK0TZ/nOFAwOTuxbw9?=
 =?us-ascii?Q?W8b8wwZKJXVHL8y3V0BLvzB7PR/mfhxn7MX7E0J3kXFtkZ+llWgzCLGJXiEA?=
 =?us-ascii?Q?Lp0Hm+8VHR9+dB/J8JlcrI0d054M4YmXy4anN5ysDdyHkn12Xr8cfo6scLr6?=
 =?us-ascii?Q?uDxA40zoG2tpX2s9uKCyUMZlSWKJ011Sc7lGwMUSQ1+Y1gdXHGrIpExqGXYW?=
 =?us-ascii?Q?MWEaSbtg+kJiP+5vignphq6zRysEkBjwKBXqDuTHy0EFxJkaW08Krt91xHK/?=
 =?us-ascii?Q?TU5N5YbI953ig2djmeKne53JU/wSwsSW+Ze/6HXVbHfJq5cx/xSuoRhS5Kxp?=
 =?us-ascii?Q?v+8Xry/AXnMQoWoeR6yG98GUIiOBH/HKBASR+6Bvio7vQc8fSqcgP5d6y2Ic?=
 =?us-ascii?Q?v2uRz3lUjXUCqWVy+E5mwYk7rfiSmlq0DlLltUyETE4+5/ef9ENdY9DBXZ6Q?=
 =?us-ascii?Q?WF9h/ShJxKhagHZH2OkIvo4lVBzl/Ru8KJe02+s2j8OrNQbyGddhE1jw2cEd?=
 =?us-ascii?Q?9X9GiwjHXiaN/U+niY9hlSIjpTxfz4QePwx4GIBG4fsaTgQpAxEAAHDfDP0E?=
 =?us-ascii?Q?aMEvVpjTc12igRcpTk7lPchS4LM+Zyvs+DsFY59xJvL01mzfD5eRTPxw6I2r?=
 =?us-ascii?Q?Diont3FYOCl7T1aKVVPbxLNniAjzuQQJvtJ8xOkcLXmrdVKMA7ss7pjD/afy?=
 =?us-ascii?Q?X0eOdpLTzSoKJ16KvJkUXDqSfqIZUt2Xq5gGDH3u+f+eJDETJfGBl1Ue+8/t?=
 =?us-ascii?Q?tB0pxuBT3KouZY+lFWEuFbz07HolMLTi7WTKdPe/VBxRhMJ20z5x2NLwtigI?=
 =?us-ascii?Q?RcLcEOn82lBwWecqsM8P5WMFP3UDsEbSETLXr8Rf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc930089-225f-4806-dbc6-08ddb4a7b29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 11:50:50.5606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GrxxnhBCLzKwsmvAP5od/8BVud0ijG2n+ZYYgZUdK7gfBDLKvXe7Csdk2HRAO0cdpVxPpxXKA7VPSz8ALomNPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

Hi Matt and Rodrigo,
=20
> On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device query
> flag
> > which indicates whether a device supports DIS_NULL_QUERY (Disable null
> > anyhit shader query mechanism). The intent is for UMDs to use this
> > query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to disable null
> > query mechanism for anyhit shader by setting DIS_NULL_QUERY bit of
> > RT_CTRL register for Xe2.
> >
> > v2:
> >    - Use xe_rtp_match_first_render_or_compute() api to check
> >      render_or_compute. (Tejas)
> >    - Validate args->flags (Tejas/Matthew)
> >    - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
>=20
> Matt asked for full spelling of DISABLE, no?!

Thank you for clarifying the uAPI naming convention.
I will update it.

>=20
> Also, where are the UMD patches/merge-requests for this? And their ack?
>=20
From the Mesa team (Palli, Tapani) is going to send the corresponding Mesa =
patch.
Meanwhile, I floated this patch.

> Thanks,
> Rodrigo.
>=20
> >
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fee22358cc09..ef8b49d2242a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -26,6 +26,9 @@
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> >  #include "xe_pxp.h"
> > +#include "xe_gt_mcr.h"
> > +#include "regs/xe_gt_regs.h"
> > +#include "xe_rtp.h"
> >
> >  enum xe_exec_queue_sched_prop {
> >  	XE_EXEC_QUEUE_JOB_TIMEOUT =3D 0,
> > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> >  	u32 len;
> >  	int err;
> >
> > -	if (XE_IOCTL_DBG(xe, args->flags &
> ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > +	if (XE_IOCTL_DBG(xe, args->flags &
> > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> >
> > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> >  		}
> >  	}
> >
> > +	if (((GRAPHICS_VER(xe) >=3D 20) && (GRAPHICS_VER(xe) < 30)) &&
> > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
> > +

Also, as per Matt's suggestion in rev1, I'm exploring the WA BB program to =
set this.

Thanks,
Nitin
> >  	q->xef =3D xe_file_get(xef);
> >
> >  	/* user id alloc must always be last in ioctl to prevent UAF */ diff
> > --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index e8e1743dcb1e..c5002b8c9ac0 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struc=
t
> drm_xe_device_query *query)
> >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> >
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> |
> > +
> 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> SZ_4K;
> >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits; diff
> > --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > 8e8bbdec8c5c..7c30e707346c 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> >   *      has low latency hint support
> >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> set if the
> >   *      device has CPU address mirroring support
> > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if
> the
> > + *      device has null query support for anyhit shader.
> >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> alignment
> >   *    required by this device, typically SZ_4K or SZ_64K
> >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> 1)
> >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> 	(1 << 2)
> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 <<
> 3)
> >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> >  	/** @vm_id: VM to use for this exec queue */
> >  	__u32 vm_id;
> >
> > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > +	 *	Flag is set if the device has low latency hint support
> > +	 */
> >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > +
> > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > +	 *	flag is use to disable null query check for Anyhit shader
> > +	 */
> > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > +
> >  	/** @flags: flags to use for this exec queue */
> >  	__u32 flags;
> >
> > --
> > 2.25.1
> >
