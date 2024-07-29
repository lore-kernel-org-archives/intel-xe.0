Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD541C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 12:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23510E3AD;
	Mon, 29 Jul 2024 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ia8EJJ6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0F210E3AD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722255954; x=1753791954;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihS7X/YMw1NidypgCwn/OlPFvnXbTHW/Jar0maSBc60=;
 b=Ia8EJJ6VBy/gpEU4xb8X7D3YvoQGltaQnnkXpInNkcU6wdnNFotyq3Rr
 bAj/KZyxnLzP7N8Fbc6JxVMFVJikGXCyDyyoNWKHipacOWsFZ9ArqC4oa
 DQ6LMwKi7u+qwOzByfFCR3cgIGeVpNgv2vyc/tNuoX7Sz6PtmWXFKZ5v0
 d2m4tndJWqX57J3ebq8HNivq8g1b4wjtsUjRr05PeRlqt0pNARdHFSfTh
 DWzGIsb/cpauooUyXndE3sq6EZkiB40gZY9tevOfjqOUcT2cDTJ54IXOD
 vadAjKDRDIVx26eC9laoFafLDGlsKWK1l8gJzwGrD0+or6k2209kBBZSH w==;
X-CSE-ConnectionGUID: IS4CCvzqQHOnljLT5o1EGA==
X-CSE-MsgGUID: kBnGc7fHSZ2buCU2uk+BgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31156202"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31156202"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:25:53 -0700
X-CSE-ConnectionGUID: pThPNbreRHySKYc5sXHuJA==
X-CSE-MsgGUID: tqVsCk5OT1iEHAAmbDQACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54764332"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 05:25:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 05:25:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 05:25:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 05:25:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 05:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4Sy9s0sTF4eCe1L+pfVGdkWdfE/lIaHeUgdmqGUZFRgPaxO+7sQ+T5JWvFObg2nnNd2Dg2jSRCFNhWw1w6rzLd+zW3X69nocs/iRU2CL/aNSwi3YRlzGdMqUNQwyi4FWLRUn8VcyGt0VKZwRZlKV8lgsmgq35d0F0f4SEcDgPBnONZ4UEjOAVg5UWk1UHEFNVckAm9z+aSDxt5tXTTH2yEP0nKk5Rjs2bZzWuCjlLV7gYzaII0Skay/N1xBYq9RzGOlmp0dWLDpQGRB13xFLiDQrRJyeu23ZFWRTqAiyT29l9U2E4yDq54M9RrobwSnchqeKe8/hDakm9BtVFg0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9oOhZQhNs+MYshToXaDZ0v8guKWhYissfda6GcQfIU=;
 b=QoKno7U+3MBghSeP83u3kAj9JQiKtk1ALzHdMKuRzohNwImfv/TkiG1jgmsl99UAh88LZfajQcraNqHUrUPBa2vARdtx8YE86CBDui3ZN2G2E/1aWerc51wL/aQBP773cuJibWV8RA7N2UEC6qdonKXhRo9LrLWPw1qQjK8VXJWoB0BAlRFmSgJbv3LuPwY8vfMysh6ZfKt4Wx/eiLy05h3pLZttZ8S93tcPfvyv8CFucES9UNFikwREwa21pPXuBsSZSL1StW2pjtZzLAonDYFhURx0bKHwa+agDhUvWPTZHfHJLJ61oK4Uroe8GQ7wQGyNoP9QrJp0gpKHGVsEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 12:25:48 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7807.025; Mon, 29 Jul 2024
 12:25:48 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Jahagirdar, Akshata"
 <akshata.jahagirdar@intel.com>
Subject: RE: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Thread-Topic: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Thread-Index: AQHa34cBL0+vOHtZZUOdAhY3a3GD+7INpR9w
Date: Mon, 29 Jul 2024 12:25:47 +0000
Message-ID: <SJ1PR11MB6204B4A759AAD5A4B4EA5D3481B72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <cover.1722060742.git.akshata.jahagirdar@intel.com>
 <ca8c3c9a5dc3c822d403d8fcce3861ffdc47fb3f.1722060742.git.akshata.jahagirdar@intel.com>
In-Reply-To: <ca8c3c9a5dc3c822d403d8fcce3861ffdc47fb3f.1722060742.git.akshata.jahagirdar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: e9c497ca-310f-4e97-b6f1-08dcafc993aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4mvwLh84OYAIlxzWDC/CRUZu1zDw0o/jPJquy/rIaumiGemx8KGQwbwaSiqM?=
 =?us-ascii?Q?IRxnULf1EuyUj/FOCjDp10uBPN9dKFvmsmTV1jSs4yKzp97bubbXdUQ15n3E?=
 =?us-ascii?Q?NR4kUgEm/nyz5N06eRyzve3wYPGdupGsitPxBFByRZ6rW0hkfZqphD7IfUHU?=
 =?us-ascii?Q?feVNqO/PklBgwwICVJVtFyuTsTb6fRtun8YxUX+S35sBmgl0juJwSlq5x/Or?=
 =?us-ascii?Q?tifPMcKZbmbBAOIyY01Nmm3TW+VTtL0rK0EaUFg/I51RFdytXZdC7zyqnSKi?=
 =?us-ascii?Q?LGXv9Yn6x2Hxxg+owo8FTAblmavyHQQtymFnysKIgmExN1J2df/yTPR1UQfF?=
 =?us-ascii?Q?PX9NvFHGUOedfw2n3u8TUnUjjZpO8ikErv8HqKFX62Z9qbO69i67SlbbGz2P?=
 =?us-ascii?Q?TJ1j8WQ+Hn8H8yVFkealWMr58viE1UaoYI2pg4Lu35vDoplQB6y55uaMRk/I?=
 =?us-ascii?Q?7EsnukMo6H5DRi2wh8uV4THiB+UQFtln0Wlx1B7cIFmRB0CM0mOjh4NcbEgJ?=
 =?us-ascii?Q?hJaRRaAZXfd3U+ZRVHTJxTlEbEOJ3bTM88icYi7Lgm5IEy3GRO7GRghkDp9H?=
 =?us-ascii?Q?TmzYHRsY/JynupC+oB8dYN4gnzhoHFosDPrCQPUYLFovxwur/Uz7Y1UG1vqY?=
 =?us-ascii?Q?HrFRwcXdkeXuTdj6ZvrpJIomf99HvzqxTgp5jQ4K85Dstc5J5+nVBPo7G526?=
 =?us-ascii?Q?0VTnZvnkLtGmg01QsBavT4KrXpDFRrwKNyRbuOBMxGgWfoNoRh4VzpdqBMB9?=
 =?us-ascii?Q?UUJzJ0yOJ+/2RPTqQqCqu0bN2RbHU28U77vPkXfyT6vt9HNsWRoiH3/EWL76?=
 =?us-ascii?Q?eRMfVhdcH4NtfA+Uv4f4fL2fOjFL0aTwHvFIl4YjB75WXVpIqGFeQ3AhqLxy?=
 =?us-ascii?Q?jXTpu6cQklGRFxZg3r0FaO2xpDrpl+2JArd8E5JNt97ICG4A572wiOnFinJz?=
 =?us-ascii?Q?3q7W94vUuRB+WvW+hJp85xKJAIrWHUBnF1KMQuZWtBFD1quJrvC2IWQL6Y04?=
 =?us-ascii?Q?NNJJoneRnkEA8taPd09BI6trJVX0rM6cwo3BttyW8Pmu7a5Fl+Hd+wwtxB2S?=
 =?us-ascii?Q?JazMX3BMa7Ao8tCOzk2wdV4Itk1uopY3UA+SmnpvL0x/HK5MSa90GDPSQ9DR?=
 =?us-ascii?Q?bIbXA8x9Faoy9tV3lgj8IXuVU2sXO9keeDgkHrnY0AhqbXTdF2WQeHAnYIdY?=
 =?us-ascii?Q?7cki89MNCab/geL0QUVguM3mV/s45Xv7yZTBUd0S9zA4I5yMVO2p2Z3CM2Di?=
 =?us-ascii?Q?UGIpJW7g+M3u1F2YpC+A9s/bgPLnPRKFuZ01ucLQVuyDF3eWQ96ay+pSj4VA?=
 =?us-ascii?Q?Szyu9aweNIczCQPvT6dtv4i4vEoIcWxku5TtjidEfh/NxhB8K3vSf4Bn8Yfe?=
 =?us-ascii?Q?303Iu5mF/vIcs6GnVID8GBBbNBTMdty08c03sHRwGs3tj5nF7w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oK1LfflBnSyvcQdOsu7XzQqrwxHb9d4pWiF3f5vTyrIYs81R3X1yIuGcSzOa?=
 =?us-ascii?Q?56UV5I4arvtj59f4S3Y5f9BCHRGZFIyG4Lyx4jUa9yuU0FZY+bdhrmTP7Hmu?=
 =?us-ascii?Q?AXH79iMuqIxNBKi96AM7zdvZrwyq9Q8z/ljme7zTlKtW8zuk65QmLDvAqs9B?=
 =?us-ascii?Q?jOwOFjXfW3+c2g2S1zOn7L5pseYGeAAj1RQCQf1+ckpMhchurJkbUnUqfKLG?=
 =?us-ascii?Q?kRkpXD7Hso1DLOJ+3r/WA4bkRG8HMgIQOXHyxVt1S8zg6O+iyXJeOD+NOiOi?=
 =?us-ascii?Q?jl9eMe1+7KiGv0eptnt90vNmeN6KaIRmWUAi6fCO65GTfnE9Fc9njUVjn7nO?=
 =?us-ascii?Q?JyhxprmY5+RWm2DEb6UuzzYBai3Q4Fo3PY56bUyowxbKDRSVTpqdCNecjmnD?=
 =?us-ascii?Q?jpksMs9pTwHjP0vo3PRDDkvtbv/bLXASI2t+iQdakELgH1VsAZifDOl7xI2N?=
 =?us-ascii?Q?iS45I3WM/OBkbR5LasqfMAQKcdH9OCIGKboTWOYrhkdEK5pDkhnstJ8FDYuv?=
 =?us-ascii?Q?98qgYw5Zr3AV/D5NhGBNRDyluvSYsqvRgTKi8o/r1q3qH9mT4RpY2spJbkDe?=
 =?us-ascii?Q?kknDJDJJ8uaMtYPSyuZW2fTCO8iyPcuRGENwqM4C0TiHbACiYBDuBGFfQNOH?=
 =?us-ascii?Q?L9zDpsSU+U/3cizYxyTeiRMU3uXuNPxbXpHbyPjX5aoxR02cevIbfps4Jleo?=
 =?us-ascii?Q?6B78YU2kxdqpKNauIz0abHmOyHYnJ1z/3fZc18u3v5ivn2YszNYYQSvKm2Qj?=
 =?us-ascii?Q?lpudmx4OV99Hcojz5nlhg1rJjrL5ZQpJ0+B7XSn98y4qG+vC6xTI/yHdvmlP?=
 =?us-ascii?Q?/eJQrugPDEFxQfzHvDqS50nthbwD4yeekawGy99xtrixSBxUGGkYu66GjwFw?=
 =?us-ascii?Q?yUp0gqIwnmYGZsWgtxbp4xAbZ0th9l39V5536cT6P7P0bcOgLUvLxPnwxZ/P?=
 =?us-ascii?Q?Ouy3/pryBnFtC1nLJLdISyvMrpV9keUMh2VvutxupvNCGaeks04sUkiLz4Qb?=
 =?us-ascii?Q?AeVk1HfhpUB3Jhc3n7N/MzL0jk+iu9yp43B34THdJydy9Qyu9TKIfi1GuTYd?=
 =?us-ascii?Q?7ZjYNKIsHNOT34dGkzTDnW7GRplEZJM4SthVhblSvWYQ5H8mSsZeezRvrRLO?=
 =?us-ascii?Q?fTa+JYWrPh17KzMtf+0OWRFKg0Lo/Rb7APJIeDsw51Or00Qc2QuBNsY5I6xU?=
 =?us-ascii?Q?udDFsPKJ1XSqizIFdj9jDugLwjoXd3WsWtLtECM0SCLOyYKBM8oEu2vQlI/L?=
 =?us-ascii?Q?P1xhbrfu0OpTZjJJQ5P572wL5nBMVhxa30dkV7YluElyfRo2E//bMaGdTJOI?=
 =?us-ascii?Q?MNZxeZtiLY6Uj6t+61oOdlN8nXwDkzMeCq5bw1TEZCH1Kaz0muy7ZR/Jf97J?=
 =?us-ascii?Q?uPH9BDw3YSHpNzu4ply1RexesHEiQ7097sdWsD7aC4ENKLrWAt5RQNZHLFPg?=
 =?us-ascii?Q?01fVdy3006A9e2hiD+ZlVxcuvO+QMhCbNsl9IrgvG848l8mOqWCj8XbHp9yh?=
 =?us-ascii?Q?Fonbam0mcQ4L7iMHN41507KJ6QWXXUQZLxBmdyVPZghSIEyeIzQ09bLZhLLP?=
 =?us-ascii?Q?8C+syIKNexQ9tUhDTbBFXmA6jaMsx+oMRAzHrfDo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c497ca-310f-4e97-b6f1-08dcafc993aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 12:25:48.0025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGGnydG1nI7sunok0g2eO/ZCFnCb+iyuI/hpaAgQqHfIISMsYyWUK9QY8Ww+3Yr/4rWeokMvtoXJyAFBRdacgkHbDBRDFYsWRRP9XZoxwYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Aksh=
ata
> Jahagirdar
> Sent: Saturday, July 27, 2024 11:50 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Jahagirdar, Akshata
> <akshata.jahagirdar@intel.com>
> Subject: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
>=20
> Add Compression Performance Improvement Changes in Xe2
>=20
> Bspec: 70559, 59928, 59927, 59251
>=20
> v2: Rebase
>=20
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8a94a94d2267..28f13362a3df 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,6 +80,9 @@
>  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>  #define   LE_CACHEABILITY(value)
> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>=20
> +#define STATELESS_COMPRESSION_CTRL
> 	XE_REG_MCR(0x4148)
> +#define UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
> +
>  #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
>  #define   CG_DIS_CNTLBUS			REG_BIT(6)
>=20
> @@ -192,6 +195,7 @@
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>=20
>  #define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define COMPOVFDIS				REG_BIT(25)

Is this present on BMG? I could not see. Please help if I am missing someth=
ing.

>  #define   ENCOMPPERFFIX				REG_BIT(18)
>=20
>  /* Fuse readout registers for GT */
> @@ -366,6 +370,12 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>=20
> +#define L3SQCREG2				XE_REG_MCR(0xb104)
> +#define MEMRDNONCOMPOVRFETCHDIS			REG_BIT(26)
> +#define COMPMEMRD256BOVRFETCHEN			REG_BIT(20)
> +#define MEMRDOVRFETCHDIS			REG_BIT(17)
> +#define	MEMRD256BOVRFETCHEN			REG_BIT(14)
> +

Please check if indentation is correct here.

>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index d4e6fa918942..f338be24f859 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -45,6 +45,19 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
> +	{ XE_RTP_NAME("Tuning: Change Stateless Compression Control
> register default to R8 (0x0)"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(CLR(STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT))
> +	},
> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> COMPMEMRD256BOVRFETCHEN),
> +			 CLR(L3SQCREG2,
> +			     MEMRD256BOVRFETCHEN |
> +			     MEMRDOVRFETCHDIS |
> +			     MEMRDNONCOMPOVRFETCHDIS),
> +			 CLR(CCCHKNREG1, COMPOVFDIS))
> +	},
>  	{}
>  };
>=20
> --
> 2.34.1

