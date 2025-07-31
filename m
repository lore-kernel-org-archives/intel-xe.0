Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5236DC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E4410E2B2;
	Thu, 31 Jul 2025 20:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPyYlz5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EBA10E2B2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753992859; x=1785528859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cubeg5ROrjA/2Rx09cyxqda8hbbp0tbiiGE1dhBnX6g=;
 b=FPyYlz5glMOCWVVAaX15gGByzPCOdorAiAmOwVmTiceZQHuwfrpdkWYD
 js7ryHq2FluVjV3U3PpVd2vMt05V1FIwi/E2ioj7LQQpg/nRVEZKZPVgZ
 v7kiORZMcu4RZbVm6dz1Q0thiV6rCq6kqx+iztQbxlce74u5xvIcS5GUq
 aZi688jSAj1BXV/3/EtitMgUZvdpFKpO4OFV7UcyjGLceixc35nwNOX8D
 26s3hUTYdHLoOfkehpwnAUqy5myFyYoV/4kA0SYgtDxXlHgtI5rnJ8INz
 UJVgfoRMYG/uRrZJSjz2Y59TSAUhd39FBaCwBHLNbO2xBK1tn5Fe646sB Q==;
X-CSE-ConnectionGUID: AGZ10dDUQyqzEAKpcTvlUg==
X-CSE-MsgGUID: cTmKn4bbQNu6WTCdE7viFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56198391"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56198391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:14:11 -0700
X-CSE-ConnectionGUID: c0m2YYgJQVSsBaQROAVHnw==
X-CSE-MsgGUID: Ay2u3IreQu6ifXjJBfB6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194192001"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:14:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:14:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:14:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:14:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUsUeLjykCMzVDgUhHe930bijlb2xl/c4ft2aJVH4F0er5qfLXdG7VbAag3jwhYzMRL7YLruOw0ic8movkrPEXgZcxGRBwn8/5I77PTO2mUIPlNiY9BVzx5RqMs8SW5CXh++7kcA35ZofVLFn+QriPUL7pb55kSv2A4uuCrBk4I4zWzsG1XCFl9LvVIfUHbG+IMpYgzSWdwNZCVqT/ooyYTlaylUeWBhcZ5iFme3hf+ppBZM/UYCCrvl4golbxoOZZozZFKx/CyX6NqaLggQ5hkGYxsS5pITnTJ2IuxGtMiMdAlTfdWfSsRgS41lNcw1DGj8NMqcXKTHUyKs0oaXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssyIOc0Rjc91feVXFKc5NQ4HbP9xuPeJGaFInykTp0Q=;
 b=CaQoRR8GMm5Jn+lFJLAgR/nu6TsTMuTtAkgTIB+ZNMd6HEDkcSJo3LtefTdJDDBKqWS9TglhPJ430UcHK2v+hCMu/8OlHEoRTb1Yh5G981lb1HjqbBl1cfdH6xb+q23CXJHQB4l0WRLNzC7B6O361ajs6rkmCofYr17RaJlYgGunx2AcYRUf+ak/41jpZkI+cwGDJFqqGtnjXgIcA/FS1uMrUBP9aBxO5kSqED7u0v/HgPqPoMsEbCXPfdzekhcw6OqsGs+3a/VdWVbp2KsdRg31YuAQGy9F9DTMmfcPun+TAE13p9CUr/daejd+VG4LaFy2oGhOSNey47gvhJMgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 20:14:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 20:14:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
Thread-Topic: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
Thread-Index: AQHcAlPgiG5S9ZwJx06r33e25FKFELRMp5JQ
Date: Thu, 31 Jul 2025 20:14:06 +0000
Message-ID: <CH0PR11MB54440FFC8F47F6C4D554D41CE527A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250731194633.179852-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250731194633.179852-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8466:EE_
x-ms-office365-filtering-correlation-id: a65c7890-8371-42ef-e31f-08ddd06ecd6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BkuAyH/uAIDTAqyYXU1UrsazvryPFFSJRsHCcNVPsg+ys7srPZ4k5ckVXjtA?=
 =?us-ascii?Q?jbEyZhdAvx9uYP9UrIwRUeAh48ZNyM17/T17RakpWjMFfO7128Vxp+9Kgc4u?=
 =?us-ascii?Q?shRKE1tgJQI6IjT/UtPnjz5/oWjOHVNV1kI6HvZ8AARPjd1XWcd0//0kWuyu?=
 =?us-ascii?Q?khOv5+P9pvsJt1+st6m7ytwlaasee1DEvhPMm4ZBrhXgUuol4YloX3pHzUmX?=
 =?us-ascii?Q?196OE8SNfSIGimGThtx3Mfjq+uJlVlaZv9NpBArB7a6ZyL7lYJqPV3di9i3N?=
 =?us-ascii?Q?0V+/06arhfb0JVMMiltsUkbvAzG5nA7MEazVfNv+8/XxcP4g9brtts3VwfR2?=
 =?us-ascii?Q?sd73LLswcbLVyuPaOahypZulx19cuHHCDENqtjW8RWNCvlJirOvfGmq9BsUa?=
 =?us-ascii?Q?XBxzEYWMxHZAnFQO0X5gaHWBkjaPR4vra7ru3cqjlk9iiY9HI1GboKliRHTF?=
 =?us-ascii?Q?PeFPzkmd6f4TpglRAWo5paCL/Wm3tK5Bn4b++DSyM05Ji2pyouW4+tSzsJj8?=
 =?us-ascii?Q?60vi5IctowDaRIa/AlbXVbrD8j2v5tcd8Ylx3T503Ff443Svv6d+YcSpslwF?=
 =?us-ascii?Q?zlGVupFFlpbBmMy4YQj6u/8QcrReTAtEEjuqZf4B4yjQahM1nNMv6OmBC8a6?=
 =?us-ascii?Q?RpoiRE4LvZr/Wc0O5WuV2vprk28T2asWtAKUKvV24NerPvIBD34Zg0uNX6an?=
 =?us-ascii?Q?jp/bWX9tlvFqeR0dVapX/VRzKmXwzPvw5mh9hdiePjPcC3a3nYM21SWHtlWm?=
 =?us-ascii?Q?BuHb1n2iqvHaA9zQWtt55dfpCYxj88sUK9iV2zeEC/zJKsPxJds/LygKHF9V?=
 =?us-ascii?Q?MhlRcuXoztq57v0mqUZ9E1z3llMDhBfpbag1BW42xZFxX8vkQjXGv1+0WAlV?=
 =?us-ascii?Q?uvS19T3q70iPYNmCKWeGx9gi3FHpBYOH7U6REqa5soAouB3rNLMuw37tt9Ow?=
 =?us-ascii?Q?2h/Rl74UkuiSYva1SHyG+bSzWCHFVp5iZ7vm7io36MYtp8aMs4rSCfUEiHaH?=
 =?us-ascii?Q?8hqCrQ9js0Y7EeX4I6Nb8TfNaU+srNghVZmel8+Qq1gteRARzY2zp7E4ipfp?=
 =?us-ascii?Q?VGDNExKjB6l0tOOWWVT/0dWvKTL6lIZWl1h4yF00BEAvozcHlHe531tx1Flr?=
 =?us-ascii?Q?lIaUXQiFE2RX25keBqeWZOJgHMzM52TNsu0U5cmIo1aUbdSP9Zj7LkN70+P3?=
 =?us-ascii?Q?o7kxv3H4XMKtoUAvcQTVIqy43KF3S3yBqzRP6KwDsG/ovlqEChJTXHqCLl5R?=
 =?us-ascii?Q?EeHVxEkKXmq2w1y5VkTl6Ot/5Pdq6SHJTHEin6iffaQgLF+tIvYSbpze3zVM?=
 =?us-ascii?Q?tPysKOBOFK0a/QXu68CXxkpNijOA4K2UUsq/pZmyV7SaepOiazGsgmYSk2IH?=
 =?us-ascii?Q?NG0I5NwP9J0rwUOFBLRJVvRTx0ey4NbeJEoCNZFDSXvkkSr3/YmqpHpz+4xk?=
 =?us-ascii?Q?u1DsOr1TOHtwWRJ5h17YYlICG5SmRTz7vj7hELWFoBO9rZmslYejdg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6URBBx9+1FsomAIpdLwniE+jv7DmpKunQDtIYtvePXLWXeusmWVtoxsCDdQ3?=
 =?us-ascii?Q?o0n+r4DQPWnzHZ9Otjv25m5kXV8aR4biyMNyyio7mHD1KsnE/yDxk1AZYrZt?=
 =?us-ascii?Q?i+gnmEFplG9XTT5r7Bi9GZLHXsvHLGxEVTG8i6IvFPldhXFaiGsYeEsRc9U9?=
 =?us-ascii?Q?85WnOHUuBRZHCeF8N/0MxvOtMSWG+PlP569WgvidKIwxxRq7Uff3nHexNP+E?=
 =?us-ascii?Q?rzb1FSVqcJDiiaVNqG6zLkazyj+cfM0rDf0KkcGFPUAjdFJKRjc4OtJTBXEM?=
 =?us-ascii?Q?dWdkqqaRX1murelkVdS1qGeDNfM+Q8ouhCcrB/2s/OFote9T9gg6zret3fYW?=
 =?us-ascii?Q?lQQQa2S0gTF3IXHT+H8ZTi4j/J6s5/9LcwSJsGh27q8ufzw2w72NfTDxXXif?=
 =?us-ascii?Q?tVxhFrQd2lJrX2EnhhcjL2AKT69cLs1yfc+dmu5AMRKbiuu/uVjVEjUDJ/gt?=
 =?us-ascii?Q?9gj+SyeOZgRSERgNHhz9/tWs4JwRaNcJy07oGBIiOzpMP6hsu2zeOtSc/Xc9?=
 =?us-ascii?Q?MCEZl9ashFI/UOqXo/1lD1Pye3YzHYNrEV66/0hDBR9N8FNrMvod8Zap0FNh?=
 =?us-ascii?Q?PzhGeemDQSvSWKp54BmHN9ZvU3s+/+ixtXUKCSMx/GJuyDsvgLGSA+Bb/Tad?=
 =?us-ascii?Q?Fmehwd15xJCFx+0iTaRNLwoqWZrbiJN79Veu8l2s6QvttLR2wqHd6EJWO3Bf?=
 =?us-ascii?Q?tkWGMm5JCkEuhD2KNZD+Wm8AgnN7Tnj9+dAJufbx8g01Gnfra/BcuM+quBZR?=
 =?us-ascii?Q?hxpy6lLKG2mLWhmyHBW0o/nOBgHW+b3R+9OAv8mj9OaQYs7IvQBHGG6hVUwZ?=
 =?us-ascii?Q?aSatM9/IRYZywBaJe0t8Os8KXzCQ2+UYAPXUbXgBFsi0Pw3WqsyND6fmCWA6?=
 =?us-ascii?Q?hyuk+xZXTS/rcDY0szudFMT8i5VcEkmfPekD+u3kNL+SzZbqOkerP4MDqEK4?=
 =?us-ascii?Q?QJPLHjkUZyrXrKuZCa5uZCI3OEUerr5eJw79NzShRdynXbwNadHBfZB2VgcC?=
 =?us-ascii?Q?Vn0cYeJnaKS3r/0bkChLmnyIPSfugH3eOeolb/EpLGMk0EKxquNDXp+8E6Vl?=
 =?us-ascii?Q?Mu++uTGSEwbG/t+wuRPG1HsRZD2K6JDuhs2qsqtP5JjYRqMY0xsVKQzDprcH?=
 =?us-ascii?Q?j8S2bzbbnE0vXCrFqT5fjklhE95f11gExbPCiPQZAwStq3zV3mS+QzcTl4ix?=
 =?us-ascii?Q?Yuprlhco4+0hFX+S5x28IxiJtBWs6dohQRvMJ5/SOmF3k7j72fQQ/t7yVZvO?=
 =?us-ascii?Q?Mpkb/W3p0hienA6pjhNzjpaAC80P+6pf3IskP2iAoWlasm3bw8ruFXIwy/iR?=
 =?us-ascii?Q?dTqvr+dlLbYyoqVggyZ4f5keq3Jh4SwYch+ChSsCVsHCNhrGzy49cUvqt43f?=
 =?us-ascii?Q?qD3i4LDi26Ou2KtGCRAJYSzxXu5bEM4pQEyr2pm532qoIToV5yefsNU4AGQH?=
 =?us-ascii?Q?sBbxvYt0AR8VZHLj+Rdwmf+xZOWl0+PUPq3HlLc1/4w5PrinPLP62ryESpl0?=
 =?us-ascii?Q?+ukRQ+POiunerPp4Fa9KjaBJvV2N2s/ItLG2BLR2Xir4oNV5amAW5s6V+Gdh?=
 =?us-ascii?Q?3GaxTt58wMrfLSUJ8+0osirUdRxQH1YA2ZtmpHFqc76+tobwMbWXoADFWVKE?=
 =?us-ascii?Q?xcR797DVxHTnFRFcvUVYH/s/hMXsVuXTp9/MPUppJhh7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c7890-8371-42ef-e31f-08ddd06ecd6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 20:14:06.7802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJiTF1b3i+4zf1rA3fusby80EHqNYZU9AJ2Emj6FTi86ecQcVs4122Od+Ia4vnMGocrRm/030/l/5tKSwwzekB++QwsGqzBNdZqB7dBUu4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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
Sent: Thursday, July 31, 2025 12:47 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
>=20
> During VF unprovisioning, if VF was not provisioned with LMEM,
> there is no need to trigger LMTT update, as VF LMTT was never
> set. This will spare us sending full TLB invalidation requests.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Some nits below, but I'm not going to make any of the suggestions a require=
ment,
so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index f00cce81f1ff..692b174dd5b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1434,8 +1434,10 @@ static int pf_update_vf_lmtt(struct xe_device *xe,=
 unsigned int vfid)
>  	return err;
>  }
> =20
> -static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sri=
ov_config *config)
> +static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sri=
ov_config *config)
>  {
> +	bool released =3D false;
> +
>  	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> @@ -1443,7 +1445,9 @@ static void pf_release_vf_config_lmem(struct xe_gt =
*gt, struct xe_gt_sriov_confi
>  	if (config->lmem_obj) {
>  		xe_bo_unpin_map_no_vm(config->lmem_obj);
>  		config->lmem_obj =3D NULL;
> +		released =3D true;
>  	}
> +	return released;

NIT:
Storing the return value of this function doesn't seem immediately necessar=
y,
as we could probably just return the value directly as a part of this branc=
h:

"""
	if (config->lmem_obj) {
		xe_bo_unpin_map_no_vm(config->lmem_obj);
		config->lmem_obj =3D NULL;
		return true;
	}
	return false;
"""

But I had a similar thought in a prior patch of yours, and I agree with
the sentiment that it may be useful in the future if we ever need to use
the return value for anything else.  It also doesn't hurt anything to keep,
so I won't make it a requirement.

>  }
> =20
>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64=
 size)
> @@ -2021,12 +2025,13 @@ static void pf_release_vf_config(struct xe_gt *gt=
, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config =3D pf_pick_vf_config(gt, vfid);
>  	struct xe_device *xe =3D gt_to_xe(gt);
> +	bool released;
> =20
>  	if (xe_gt_is_main_type(gt)) {
>  		pf_release_vf_config_ggtt(gt, config);
>  		if (IS_DGFX(xe)) {
> -			pf_release_vf_config_lmem(gt, config);
> -			if (xe_device_has_lmtt(xe))
> +			released =3D pf_release_vf_config_lmem(gt, config);
> +			if (released && xe_device_has_lmtt(xe))

NIT:
Same as above: storing the value of pf_release_vf_config_lmem isn't
immediately necessary, and we could just pass the result directly into
the if-statement:

"""
	if (pf_release_vf_config_lmem(gt, config) &&
	    xe_device_has_lmtt(xe))
"""

But, again, it doesn't hurt to have, and it'll be useful if we ever expand =
this
function in the future and need that value, so there's no required changes
here.

-Jonathan Cavitt


>  				pf_update_vf_lmtt(xe, vfid);
>  		}
>  	}
> --=20
> 2.47.1
>=20
>=20
