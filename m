Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1567CC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448D10E321;
	Thu, 17 Jul 2025 21:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKSTa3zO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E859510E321
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752787211; x=1784323211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bana3VVYo8xkVxk+aLdB0pa4egG3D/dpe8i+PGNfha4=;
 b=IKSTa3zOiFN7jKcfKG6z1dmZ+LEUo8sm/haxMqhn/e9dt0DgPvl916Vt
 La/ir+AhDvrjfnChBUUrJwRg0+wZfe2cxSGpjldkpT6jACplWE0Y4YS4z
 IphSvvltbE0sp3FMh5dmO0EMTLomZudeQkTSb6vwtXNzTbzxfTgxtrKVt
 5Mq/pH3aJib5iYQEYWalWMqOR5f0lQHOj6rJu3xl6uq+nQgbTBwY3g/L2
 rbqUdr2xb9wjv++hpYHb/4i89jnEZuJYblr76IWa+Vq4zr0rDPZAYsvf/
 LdMZW5TeXFBtLuJRXtRdazTQafi5znUQJQCGg2QmurQ+mIGs3J411KyWm g==;
X-CSE-ConnectionGUID: mTPuKGO2TvScuIfbMiLT5Q==
X-CSE-MsgGUID: r6/xUVDISLexBCAm4ZeNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55223522"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="55223522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:20:11 -0700
X-CSE-ConnectionGUID: vHj1Vod6TWCqqMRKaHeXUQ==
X-CSE-MsgGUID: XB+/tM7HR6y8AuXXMIL4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="188879556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 14:20:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:20:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 14:20:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 14:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJONBLDALXShQARcp7gVTOiPQ1vS8GDpd9LOPnO2e26RTw8aM9OlMMjYyi9Dhw6kyNFww+40bkaopHnzoASbbcasAzNXucpU4Sue3WUGCsOLvex4P/QI9EX3wUv92KrD/Fx4lLrl2vhO+BgV72RKBAUGJ7NmeFV4GSyVeYIilD/zDEVE/5tKGc4DOqYGwU8HbVEUjTnqCUivzhTycnW03ZtQk6PPUzT88RTZFWQUinMqkHWEhUK2XcIlvZPeyhbH9mm/fbLjIusGIrQcNM7uc6/a9w8rVxK1RRWtf1TPRSfiaUjc2BMA6xlMQ2EhIgWBiy7YBYiRNWKD0r8yJQwd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVGsMvXs765C+Q9BGKKOkF1PeH6RxUN34IpzQ7n2u7A=;
 b=JYhmSBVlUsLD3aBtx/kQfRFWccoO0KLsqpDhOlrZ7S99PiFVzCbb5mxqwupNesNafI76Ycbr33tCD9sqZ9lqZoTfUGtDd5OZBtJFogg+5fsUAtndNVgAIiVXVm5W7se1zM+FO1cBI95t8sE/JcENul1VeaPiiq/lP4t5B818Y5dI53BVLfl9NjxNwyZdDTnvN7l59+Y7P9DucHtfDx6h4HTM12Y53dXuU75gJw+1JWuM8AOk3Tj0ne/jSHlL1ttz6p+cTjLAfNESZ7vLV9saiNAU69xxX0K5D2I5c2pi6/pyppi/aUXsE4IsgAJskhd+e58EO6X+W3qz7g8O0+RB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 21:19:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 21:19:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/5] drm/xe/configfs: Allow adding configurations for
 future VFs
Thread-Topic: [PATCH 5/5] drm/xe/configfs: Allow adding configurations for
 future VFs
Thread-Index: AQHb90t5cJV+J8CltUGxIqphlO+7M7Q2zurQ
Date: Thu, 17 Jul 2025 21:19:54 +0000
Message-ID: <CH0PR11MB5444607A04B2DEF2E9E53F9FE551A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-6-michal.wajdeczko@intel.com>
In-Reply-To: <20250717184825.851-6-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7027:EE_
x-ms-office365-filtering-correlation-id: f7393745-794f-4d46-1a69-08ddc577aca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?koi8-r?Q?XXJqMpQn6sX6X98Nnzd/wy4DPQa2F09T1G2Z+o8S25EBkeJ9YH9b5IAiRygqmV?=
 =?koi8-r?Q?NpIWk8n+rfY72DNCn0VhnOudGFysuFmJzcQj9Ci5NiCiRkAMgwe5zu2i60X9u9?=
 =?koi8-r?Q?cUtSyHtQ41Ayzkz1EbBfqexvx4rg7r0DC7y0qy/G+MvsZ1Rx3zpyUoIZvdazRN?=
 =?koi8-r?Q?OStaUUbCcf0jHSuYQOsRZU18yVEvSZNku1kP1T1dUJycFxNJ0ImJeJqk4iEpqb?=
 =?koi8-r?Q?OfR5FXk9K+PNjcyHiq4nhc3vgQtf68oeRcHFG/DxmKWTDq09+JyqH+obkW1pBT?=
 =?koi8-r?Q?4lGv/pDBIrleHtnzDRd3OHG1DeOD+jXNR3E8Cv3ViEyVf5XLFc7rHlWc/s/dx6?=
 =?koi8-r?Q?mplZeGpL2P6DFDwGfeiV/aVNJLSuMkYD71i9E1VVZwOcD3HJ8eMcnDMHZEgLyO?=
 =?koi8-r?Q?sBsx81aqsJlEhbNhxQ2sEaZqB25DnP1w69CCI1zPZ8WKBGlKXlsB4fL76cS05A?=
 =?koi8-r?Q?+oLR+UJc/8h0uirza4pV/zciSKO+/sOrUDjoj1QyYGcMgK1yvB8Lw+mysCQSmh?=
 =?koi8-r?Q?ubqhHlJ7pDGIUjSyUcHGz5c9s3ULDFxc9Bq1d5bopq3V6nRURgJp6cIHKTi2Us?=
 =?koi8-r?Q?oaeJbqwhTz5WEbiX+zlozD6JJLpEmWy7lGiRIielZ0KRH4E0fgA/LdXGAjxvDb?=
 =?koi8-r?Q?08Knwt/yLnCZhg3+uDvk13/FCKNOz9VVvFJrTMENwEbvB8LyZO9I7GHshcxsNn?=
 =?koi8-r?Q?M6xOZO2O6yLHKewpWTUk+A+agiTatKoTaWPD8hEUK3OzUAN0nirL5SZ4mb5d6c?=
 =?koi8-r?Q?Hw51rmefzOavpJ3Sd4fiOb9jPIBhVURaWOt65s1KvVFYjxf0Vp/gScUJS0KxWR?=
 =?koi8-r?Q?UC3MF2ThxB2L6F4bn3AA19tBOk+tL6PI1Y1A2AJhYf2pfetmfAUIGgGsrBlm+f?=
 =?koi8-r?Q?I4eViy64DdGACzEWv5peReUyl712VgD8JWcAt39Xq+3XBEivhLPoLpCJ8kCEY9?=
 =?koi8-r?Q?Kk6YhLB1ISMMkmxT/KKSjoKyFg08+ZNCe4ctu3Q+QHxWKmVGg7YfIQeB6VHYuP?=
 =?koi8-r?Q?K50aQZvc0OgV+FUDOXeD9Gg8YFP9k69K5BYKGdbDuX/3Q0Nu6CGGL9jGWOK3Mk?=
 =?koi8-r?Q?ccLYVR+f2LEYmfkOqLhFQQSwNedSYsVQqowiJKCgxQsZ72yYCFRz272PO1zVtr?=
 =?koi8-r?Q?RIk+igcvXmPBdDTSSxWuFcf0XYGHJSCo8AeTKvqGrbwHeEUGYyc1zAfK3I0CmO?=
 =?koi8-r?Q?Gh23k7SN3GrLd5IouE3Mfz97Mi6uqi1a7ZEAHsExGZzuBiyKDOboJ1+4KrX/1G?=
 =?koi8-r?Q?CLcpOGVi8RyDsPoIQIrsCKiO3wjIRSErNkmkzScSyiDIsL9t2LXWNuLxAO7ySi?=
 =?koi8-r?Q?XBgkWDgASsyW9hreT7WLRoETD/5m3ZmRGcH2pQgzhrHEGsZWH2AbU6baw0XcTW?=
 =?koi8-r?Q?zIrCyiVEgoNwkPVRTPT9ChAAJJKMV+qtTG1FXbEj33I2eouOkK7EDHfTsZ4xd4?=
 =?koi8-r?Q?/V3xAw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?gvis3TuEIOsSj7ZZMCwgN0iewnnh2HpLF1bLiKZ3Yevn+6NrlFV5ny6jS+9tAx?=
 =?koi8-r?Q?C77akyoGRcETzCQ7R0rHXL+KEgFZbQlewXF3fZY0l2ckLxQS0uH/lUbYELP+cK?=
 =?koi8-r?Q?tL7dUUj796GNxbd1adGzGWcqjqxT8SVqHpqsYYIVQWpkT7exve0IKe9vi8xVBV?=
 =?koi8-r?Q?4xyGte2cW4v8E07M16iGbVUOevx8UtWqhXOcVIqtZy/FkbCofl49bRF//xJ9Zw?=
 =?koi8-r?Q?kHSLRyOcrOmsT+UW265KF80IqhOyc1T74kE6lFSq9E2HJzBf8e1W75XyRxsPkV?=
 =?koi8-r?Q?74ZEov6MbN01A5gXMGwt+kGVHUmeXabyDrCjgYpxGJqkftScM7RsJwfvGKo6y3?=
 =?koi8-r?Q?N4qCRisK1D1EvvAfi4xrfcXGe8OjVz25g6v8XK2BuI26W3Jk/iFqL/tZOD3gbr?=
 =?koi8-r?Q?/T6r+2KAQx3Fy3ly+twxc0GMGniuuc6G8RQdpM7VUWiRQE6sSKUsgBBcEr6KO8?=
 =?koi8-r?Q?JkiGI0iMCnH7UHxGwYfMwY1cMv1GHbEvYhL9ki2/LJNBHh4+QGpuhS6Au+oxxh?=
 =?koi8-r?Q?3eHChM4gXpxbfWeDhkmhHSD34ZzyON8tSjED7wksYquZjx/IJKcMlDUtLISoia?=
 =?koi8-r?Q?8u7Dc7ayaYvohkE/QKp/1kvJBdnRLngbFEmaBodZiT3EkofINfbcad2qMXVaAQ?=
 =?koi8-r?Q?3t3uIjPQ5EUV1KYaVTD5SoYYNuhpHctpZam96z8gG82F9d5M4Vxn3Bak+eziBD?=
 =?koi8-r?Q?XNG23T8WKkfcnHFROmodP4s6WiUBY+DVUhF6BJ4F3oLep+pblTA3PRqPCxKX4j?=
 =?koi8-r?Q?AK7wxYAy603ckd4LG62j0LEBhkCFvSA6bi9kXX9E+7XM+7y1qvaTH08gMKHG0P?=
 =?koi8-r?Q?OHIcuLDSWcoXHvzJh+0TjcASMGnTefLzEl9quPj4SfNFg8PMNZDIE/oTJ8I35o?=
 =?koi8-r?Q?kBxvWUVd6LIkRVIS+4c0/d6Diwh/sWCyI1XhKQeGGumjtOC2fDBr0OIat3n7OC?=
 =?koi8-r?Q?KJJ/WROur7jAFB93DKJIKLUERQtwHGLMDyAA7e4i0MNmZb+h6IOyT+tWDeTHaw?=
 =?koi8-r?Q?FDaHceRaekmRQbTiY40OX4su2d1J8Siu03mE/STMRne7ho8in5xSQhMdNIPV2C?=
 =?koi8-r?Q?OYxjqkaoH8LoX7lbx/bxnxElsE2NICikgHDzDNxQ5ZN9OZ4XwtmY/p4iCcBMhU?=
 =?koi8-r?Q?KbDG2OOixU7AJkZrxuV709lSjbK3Xc7EI86Yx69XPLOlULKBuVDHVU5uuhtKRa?=
 =?koi8-r?Q?Bpq4bwhH30PY0SHS9zK4uH/bLLV2ArIk5cR6z6LoEngUp9LDp/wt5GbZ17L8cr?=
 =?koi8-r?Q?2cNRl3CpawtBnxO2ZwDlewwknWbF/LiS/wAzCDSyfOzUc0PiLEK7+BqEybC7a/?=
 =?koi8-r?Q?gcedcNoDP9B04swdJkI9qbxW1uz8uBfWxO8K6IRAdwq/fRr4Mt25NvMK8j9RGC?=
 =?koi8-r?Q?nPInzwejg3gsF5oxb3eLAB3iuh+RCRUpgPzq6JZImrzKz0JFKOdjGD5VxM3NkD?=
 =?koi8-r?Q?T18kRcOaMpjV7CM6f7T8zEBvAQW3vUCsSBVnkdo1JPIZDGhaC3PFOzKEsBTjfT?=
 =?koi8-r?Q?0+S2SX9DC4N7DE7vcMVTU94o+c5IcTmWXGf0Lt+F4//hEr2k0I3qZ9L2HGCWmR?=
 =?koi8-r?Q?Ux70za9VLJTzVa3qXngl8lL8g1ul7dJc2Yg/6jlVsxRAoOvuOeJO?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7393745-794f-4d46-1a69-08ddc577aca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 21:19:54.4416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjhiCTYAHkMqvDsSTqgIGcyWG0rTXxgXaNkZpNsswLLkxEseNQQko/56nz0I7WjMT4PvFxjSwirI6wt5mfMhOTCL58dxmeiGo5dSerSfnLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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
Subject: [PATCH 5/5] drm/xe/configfs: Allow adding configurations for futur=
e VFs
>=20
> Since we are expecting that all configuration directory names
> will match some of the existing devices, we can't provide any
> configuration for the VFs until they are actually enabled.
>=20
> But we can relax that restriction by just checking if there
> is a PF device that could create given VF. This is easy since
> all our PF devices are always present at function 0 and we can
> query PF device for number of VFs it could support.
>=20
> Then for some system with PF device at 0000:00:02.0 we can add
> configs for all VFs:
>=20
>   /sys/kernel/config/xe/
>   =86=80=80 0000:00:02.0
>   =81=9A=9A =84=80=80 ...
>   =86=80=80 0000:00:02.1
>   =81=9A=9A =84=80=80 ...
>   =86=80=80 0000:00:02.2
>   =81=9A=9A =84=80=80 ...
>   :
>   =84=80=80 0000:00:02.7
>       =84=80=80 ...
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 1df8cce78f13..e6246f1761cf 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -274,10 +274,17 @@ static struct config_group *xe_config_make_device_g=
roup(struct config_group *gro
>  		return ERR_PTR(-EINVAL);
> =20
>  	pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, funct=
ion));
> +	if (!pdev && function)
> +		pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
> +	if (!pdev && slot)
> +		pdev =3D pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> =20
> -	match =3D pci_is_vga(pdev) && pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL;
> +	match =3D pci_is_vga(pdev) && pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL &=
&
> +		(PCI_DEVFN(slot, function) =3D=3D pdev->devfn ||
> +		 function <=3D pci_sriov_get_totalvfs(pdev) ||
> +		 PCI_DEVFN(slot, function) <=3D pci_sriov_get_totalvfs(pdev));

In line with my comment on the previous patch, it might make sense to separ=
ate
this check into two parts.  Something like:

"""
	op_supported =3D pci_is_vga(pdev) && pdev->vendor =3D=3D PCI_VENDOR_ID_INT=
EL;
	match =3D PCI_DEVFN(slot, function) =3D=3D pdev->devfn ||
		 function <=3D pci_sriov_get_totalvfs(pdev) ||
		 PCI_DEVFN(slot, function) <=3D pci_sriov_get_totalvfs(pdev);

	pci_dev_put(pdev);

	if (!op_supported || !match)
		return ERR_PTR(-ENODEV);
"""

Again, though, this is a non-blocking suggestion.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
>  	pci_dev_put(pdev);
> =20
> --=20
> 2.47.1
>=20
>=20
