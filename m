Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510ADC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 12:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B9C10E7BA;
	Wed, 23 Jul 2025 12:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+zmtr2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1410E7BA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753275455; x=1784811455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rH63nIcVjUV5qXvKMhFBJoEyAOBUKXEd2xc0AyPam4Y=;
 b=F+zmtr2oGd7vxJDf0vKoZSEU436p9s/2ZAgKBPWZB3WKdXQRSdwaLXRQ
 8QIREmqzMQi8U39cOXnzf56r8/XgBA2LcO0AEOqUA8A6906/8kiLi5tpt
 XnQ8m+naHWR1gXwytRE9TObMY3xHNDX34GcJ7LPzO9QtDKd4iLW4KPGub
 Yvh820FeCc/s0hYXMCFFCTucxDgZOeMVCvkjMztgU3UHn61u5yPBYWz9D
 iqk4PVPJ8gLF4RPzWbxI8M9t3qCZlqcU2f0uMFr1xXHCmXDtoh+23RMk3
 zEVEaaiTKv+X/faysRWsqVFMrjJDmQKl4HtwOe8WRqqZYMHiiY3CM3Ho2 g==;
X-CSE-ConnectionGUID: GMGqGOy4RhOsqvMvIFMPPg==
X-CSE-MsgGUID: f0spHvHSRcKDH08dYalCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55702029"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55702029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:57:35 -0700
X-CSE-ConnectionGUID: /tI1p3nTRxebvTNFs1Fgjg==
X-CSE-MsgGUID: segAG0mxR4OhNLV/RoH5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190501533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:57:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 05:57:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 05:57:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.74) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 23 Jul 2025 05:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a71Hy8QICqfbtm6v9ZA4Hv0+KdGLPYrQLbgB/qbZ5xSIlF3xesiz0onGIrpeJhfptXEXWIpAsvZkO0RGS4Um1Q44fGNg+pC2KTJ1kw8LBqgE1Gx4QOtPqUpcxyjrB2bV3pJ9Ba7qMQ06CVFNAN9wtI0AcvZODzyUfMmn3Ot3GLUm8Pzy6ZeFKcaE75Emn2+5IQiyofJIo04xvgpadYfeNYlmHnw81YlvkQMmJOW3DqOLA41JXB5Ccpm/5qo7zJof5ctm5qKZYvFlpaNUqvUX8dGqi0Lh5D75P0qgBL0aMsUeFxkeSH9ejXU2INRGCJEQONlDgjY6lZwpOVykbAhaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MW493rs7uUf89m5Hfz7TC5rnXIFIAr25yJl7mN9LTQ=;
 b=oXCGN1niHte7L2ZIvD9fZre9pvGA4yP5/w8hac2tca2PR2s1sWXjcdKbTbk/40P/aivoWcod9LZoiQrYMdbb9wX8aNfZCbUgfIaClHufuQj06Fggq5YmuSt1xw6ZlJYrm+hg6VIqUIpWT6dO1FM/CvgwNZZyEhTqYHimkZj9zdwOsSpjDnz26H6C2XENxCrhZtYYjiCKhmnjw4dKF1Eq6QaipGYW27SgYG9cAa6uDoZGXwe/N1eYueSCxti9+1o9nT3CZGn/rtbMh4Wqk5rgjrdnYEyssFMF0IslsS8Fx7oF5aTkDZoNuqBXLGpHYaGoM5u/GCTsmMzAr3l2txCKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA3PR11MB9088.namprd11.prod.outlook.com (2603:10b6:208:57a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 12:57:30 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 12:57:30 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Thread-Topic: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Thread-Index: AQHb+7g64uea/iu0BkeNdxmcw0AntbQ/qyOw
Date: Wed, 23 Jul 2025 12:57:30 +0000
Message-ID: <SJ1PR11MB6204E586289BC549FB26052C815FA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250723102137.3580205-1-nitin.r.gote@intel.com>
In-Reply-To: <20250723102137.3580205-1-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA3PR11MB9088:EE_
x-ms-office365-filtering-correlation-id: 8e5b911c-ec28-4464-c8d7-08ddc9e87c08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?14HzrlUuPZnG+GrWVcHIsnC4/QWfnIDpsWq7vvfPHfrVTl/3RBjCUzxiH67n?=
 =?us-ascii?Q?vpRTQoavWOuEgPEJJfHWKu/HkDPBmr9wl6XoINiFpMuIy9avgDtOsUqoGguo?=
 =?us-ascii?Q?PfTMqcbdpfcE71K+Vo4i8gpAypKGeyPPECeRnCDZZC70o6AcNR31EummctVl?=
 =?us-ascii?Q?qliteOFl4GGVtOzt2wQlG1TbVlJ3XdKSN2CKy65w/4mZNtczV9Re/0bk9Pp2?=
 =?us-ascii?Q?6Jcr7sPwGpNqqOsv1hBaydezp7YD4m2febVzz6bI5XCas0Ex9xotn6/MpQ88?=
 =?us-ascii?Q?8FGmBJ3U0FZ7o6xiAPeGCUWNxsQHwjNL9/eWD5M0qIseIuUQfvR9CWDPQblc?=
 =?us-ascii?Q?AlPgkm6ce7hec5As9D9m6NZB2K+I0n8ilOTUF+6K/3aiouashrONAYZ4qau0?=
 =?us-ascii?Q?yUszJsaVD43GWyEk2QLipG25qYM5wnkDPHHNfLdb1AaF99/F+q7rvtsViV+6?=
 =?us-ascii?Q?iyVZhPhi9OQ/6pHv0iCPBa05s6v9QUOh2pRVso43Sd9bQYUOOmNf2i55IN/2?=
 =?us-ascii?Q?QxTNNrTpIHF+ICzd4BIANBqqtbrq9dKKeKLebZLWXog2xSlPJZCWMdeKX2/v?=
 =?us-ascii?Q?2Ayc7GuIaue72bssxaSJ/0sRTm1BIAuLs4vUO+6W7r5afH9AtdEjZSW6GIzr?=
 =?us-ascii?Q?we4c7LqPdW8WRRvxW55WHDj2GoRHv4gLKc+juZCxygB9gfjLEJVfLKaViKam?=
 =?us-ascii?Q?xMQlnT+SLaI/SO7wQlkT7G0DsYd4bg4jYLszxLulbIxPazJWeLwLnqyub93d?=
 =?us-ascii?Q?ThF5Inq5nYiG0aMC5G+rnoqo+K2hUynj5mllMCOk8cojc1Okh8QbV9oJvNcG?=
 =?us-ascii?Q?LDB1cBkbjoxgljABb1SHOAZHiLwBhw+YaUF3ba0hpv0vuKONLD+UDUOSxtuu?=
 =?us-ascii?Q?gL3uyzpMNpgrw+Cj37o/o4WykTlznoTt8B99cu5N3y6MN+NpVf9AvcECVWUT?=
 =?us-ascii?Q?rTB8/bRscEKEhDeSFSzuGAcT5tYj8R2c78pnlB43GBSXqExN+BueT5M/3WsU?=
 =?us-ascii?Q?irVUxiAWwCWDZP/dvxRKM6fFWLK0O/1bBCMCOthKqaXahZXPvBNJYsZbjHKo?=
 =?us-ascii?Q?WPJ7KQ7IZZgi27nQsoLdTgHFnYnV5k1uvFTRFCtb9vyS+ip76VoMQt23AKXH?=
 =?us-ascii?Q?wSSLY8JOsGaVfSckVLMME0bItUEmn56uJT31pdp/kv4UWhQxSoIEm7u87q+8?=
 =?us-ascii?Q?eeFx4m49FJFuEPwOH0p6Xf1VoEXC7Y1NE1GlYychqDJEOnMHLtACaAjHOvsd?=
 =?us-ascii?Q?/YLn/uL3QEv7TfIgHqlWa2OEgP96AoLxrSq/GFC0jfNk1/8oeWC9zNkK8xfb?=
 =?us-ascii?Q?4nZ1pSfO+CTeE53Baa2HWZx+ZRjhNlGfDYxQBMXBnyOV0ZvXTDVNwztfR2u8?=
 =?us-ascii?Q?/UHAPYOf3Ilea5xJyLqOLO56k8V71R1EIY7w19j8f5clH9V8aBWmpQZlqaJK?=
 =?us-ascii?Q?A1f9xPUgqtPOqRppIKFfSkiTirB3tWrhpULQSZC92ttaJDoqNqviGg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZV7mgOjVwOkMhw3pPM2AYxvTKrLdcnikSg4b5s2r0GthBIlNap8BtiCPdumS?=
 =?us-ascii?Q?j0du+W+geMJE/pwJX5EdjsgmLC+4spauxXzDTRt6/Ly0eqAxJ+ANRn0ShVxM?=
 =?us-ascii?Q?zSOtX2ZR9pt0EXl8sKdgH2zPrdiWCrxli0q+UaEBAvlN4eHlrcImtCaXydJT?=
 =?us-ascii?Q?QLEy13gcrVbrMeurmCKvZYcHstF16ddeJ/8LTf7TA0VYdQqnumotczsFrjpR?=
 =?us-ascii?Q?ex+GPRzWiN6N7Af31oW5exbCBZ5cNkCibWZMFvci+LvZdva5Zq/2i0ht2N8t?=
 =?us-ascii?Q?/UO2NzDfv84d28Hkc8/pmncaXbXZcTDrVMJy5C8Noz+9ZGV5acylgPEWq4eX?=
 =?us-ascii?Q?oEKK3KDuqFATGCFQUuHnTx0pBBU0SCMO7Vt1Pl8Vu5gTmGKVYIA4j5DlJufd?=
 =?us-ascii?Q?oE5ijPqemqFPvKxuqeJOnfam87cDU4NWFArkge4SpzRdFgOvkHhS6MjaLt6d?=
 =?us-ascii?Q?CO5+/w3qtP+W6WqPihVp8wDvf2Rop8qanoKmH7yAzwF9B9hiey455MyTFgQK?=
 =?us-ascii?Q?NSOnb0tm8l8+OkFE/SiaZK2+pJwndsxRM8GOV1gmc1wgp5jbOjGkk8DuWU6w?=
 =?us-ascii?Q?IfdHhZgSQnovBuSNJ0MtXyrYZvq85uIRTIabjVyQKDXE5ok94PBERY/Brvro?=
 =?us-ascii?Q?CwtR+vbLae5HZFtg4tkYgeKMyNsict6G/ZuSlD5cSvjrm0lDCWubjKqxhQ0M?=
 =?us-ascii?Q?ARdOzMtOtpq85JjS6aCjDohYdP5UgL8QmvPisgX6tQx960iLi5WHMa4O2Aib?=
 =?us-ascii?Q?4aYhirvElE1b81mSSSlMERLRCyIlmQ/tE1qxU7ZxJTTKWMSbXJDtKcifmFHn?=
 =?us-ascii?Q?3EJusvGfi6XbaCFvHnPLJqf9hu9qrTGi39CvF5LatYHpoOk5Psf4r+ePSw0a?=
 =?us-ascii?Q?DBByH+J+RStJM67m+dgFXaz7XbIelRJZfDt4OjJqBtgvdb0fwwbxI0S5T4Q8?=
 =?us-ascii?Q?05WUTraR0jhUAIRvRuyn2m1ZXmWc6Vcydl+QKVimkU1yA/n1pMAFHcXmLCgZ?=
 =?us-ascii?Q?xWatKB04U/iK8jRYODWKNnkLwb5raPnPPKN0y5NsDilkFyKqmg16nLsx3wDm?=
 =?us-ascii?Q?U2czgscJz65VELLQrycwLGfM2S56Q8qCPIEdJSDOy8KdwMqpfnvSr9zLo/Og?=
 =?us-ascii?Q?Pac+jV+5LnrRyejZ/vA0NUu4YfF7HV+j4ggEHaw5z3kpIepXG0BMJzJnijmx?=
 =?us-ascii?Q?aGN6cHJFqZ5BUyNggjVlyK4H1ftQD3LVttNayI75WbD7JRp+N97+sNtzVCCB?=
 =?us-ascii?Q?j7j1OoDubNiJ0EjCL5Hq2FEjcghnypsgmo4BsCicMtxnK5h5Z+GCutHlq/GS?=
 =?us-ascii?Q?Xodlt6WXWflNP5W1PkQmaCgqbH889K9VGTAa3RPGBw48LtSQqWh8SL6WSNLt?=
 =?us-ascii?Q?EgGHmmheDS9Z4f4NhHPJqZa3/GOdfVb0MCyVuXCvSVSC77gvMqmHWy7n6xc+?=
 =?us-ascii?Q?Q8of/VTjW+Q6p0fj1bwUC0VQ8WyHu+AFqo5BGgqPRRjuiDqnpoMAkFEfZPDb?=
 =?us-ascii?Q?MHEIQNWZRmlHHEVaTWK2+iIEOKv2iH3wd3c72R0gBK1mmezhgG3dGl1TwPCf?=
 =?us-ascii?Q?xomfUYUGrKed9Rs1vkTRqKGRJLfbAwiWyMuOG5VuNVkFpybr2WOCgEZMiIc/?=
 =?us-ascii?Q?whI98WoZ5DlXSfvDY/VWKFl58fMi/GdiPNIChRsvD7nw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5b911c-ec28-4464-c8d7-08ddc9e87c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 12:57:30.6906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9awxGkAnX2erJEtypxR4m52KEyKcBGmUhLhYLJ+qU4VK4kNICczf66FWdBpvlA586g7miKkf4mUi0Jp1XlgqffqrEz+uB7mTTDnEAZR1Kmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9088
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 23 July 2025 15:52
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to
> STEER_SEMAPHORE
>=20
> The register at offset 0xfd0 was incorrectly named MCFG_MCR_SELECTOR,
> likely copied from i915. According to the hardware specification (bspec),=
 this
> register is actually called STEER_SEMAPHORE.

Can you mention # please

Tejas
>=20
> Rename the register definition and update its usage in xe_gt_mcr.c to mat=
ch
> the official hardware documentation.
>=20
> No functional changes.
>=20
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5cd5ab8529c5..f96b2e2b3064 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -42,7 +42,7 @@
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>=20
> -#define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
> +#define STEER_SEMAPHORE				XE_REG(0xfd0)
>  #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
>  #define SF_MCR_SELECTOR				XE_REG(0xfd8)
>  #define MCR_SELECTOR				XE_REG(0xfdc)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
> b/drivers/gpu/drm/xe/xe_gt_mcr.c index 64a2f0d6aaf9..ca27b9dc92cc
> 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -533,7 +533,7 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt
> *gt)
>  		u32 steer_val =3D REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
>  			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
>=20
> -		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR,
> steer_val);
> +		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE,
> steer_val);
>  		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR,
> steer_val);
>  		/*
>  		 * For GAM registers, all reads should be directed to instance 1
> --
> 2.25.1

