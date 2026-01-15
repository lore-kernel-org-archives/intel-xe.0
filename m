Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC1DD44C6F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 16:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C51910E79E;
	Thu, 15 Jan 2026 16:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKZLNX42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9310E79E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768493172; x=1800029172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UVV2W5HjMpRrJEPc13FPJKBUugP1o3WZsDpMUySQYKQ=;
 b=AKZLNX42zjXcyW1UjTj86CkBYmbo78LsVIyq8Ws5k0sTtgwszjKF1py7
 lgElMKVIXt8IFAT1hTEfoFxYS/SJdAAGny4nNLdnOEeX+LjOV4ixgSPUt
 ytscb4UWw0QtrcergJ4+Mxw4GRfLBcisbBGL4C5z7jfRaNyYGJD7f822R
 lmCQmLO//2I7SAkU1pRlgeMforEQ4aZrAyPsLJI5jyKmncx/MlLFVbt6n
 nD5rt+Jxv3tJmXSgkqo+MWXe4nDhjNhxHSJBTqrp9orbUZjy+4wFmNqTO
 V8figfi9ftXzKV3S8RoRj2hgMXHVXYrZAsRE9m/7cUxQGFFEvmXKdD2GK w==;
X-CSE-ConnectionGUID: cg6w2S4wRCuxyi4xTBNAeA==
X-CSE-MsgGUID: 0kyRZjIxSNeRqkLHG0Aopg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73643523"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73643523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:06:12 -0800
X-CSE-ConnectionGUID: Pns+ZWKaTsqtGTLgp5shWQ==
X-CSE-MsgGUID: fI1LqRpWQ3qQ9iWYXik3tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209126763"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:06:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:06:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 08:06:11 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:06:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm3Ax2CUFb2KzE6mg8N/HOAqd/OtPMqFFswZDx4yPWkoybSVLt5wngdhq/jvaYLmiVgI0nyXyeeLpvBJUEGnEVyVSZHwHEeG7L6JzDupMA1ML7/JvcHa4luwSZmjiazhQIegTqI9iACF7l6gXIGYXqwbZ2bZWR8H92fgfQgYAN6AEWvzUprKhaknToGMWcFZ4ZUAnj9Alw6Il6Y+SdATBtuqnEqAVaG78clnP/wdv7KuL7j9qmODSfSHJAd6u1Ns+z6BOXPam0zKCVQ+m4Dw+d0jDpz4UzEYHA2fc9IU8Yz6FVnhN5Cyg+DhK5hAbGCSyqXivGQm+HYI5ZHUuCf9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHNA+uIZu4cGB1vqz+isMgecjdjbwaffNfaGn/g2b4o=;
 b=TLUxG89YpVog3HryIKCYVpnOAKoxzPfP1jizPXYNe3me7uOYTDUCQYK3gR4zan3z2zP3YIPClC17KIuQA+zG4j4VjVRaYfllbWgM+myHOCyXxDDa5I+ocymK5K1VTO9rzQUw5sh70r2MO/AsQqllOOScz08BJjx2s9+ltZi7VriSv1o5JWZz9XUMIbu+/tHbysEgRVoL7yufCruQ5k9tomPEMf9jyaGSg/3s7gI5/xC1ne5iA0J9/hLyljmdhTZ9y3IPPI9zEIDQs4gvuuk3wYXebYbMY0mOIkMFsAOZPzjE+TiPF1UBqDycS9CWhtwUhmQelUOJjPBK1NNoHbNMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 16:06:08 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 16:06:08 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v3 0/6] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Thread-Topic: [PATCH v3 0/6] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Thread-Index: AQHcgJdKwL747RRQYkmcH0fatxvElrVTb1AQ
Date: Thu, 15 Jan 2026 16:06:08 +0000
Message-ID: <IA1PR11MB6418BF48EB886CC4CA6BD838C18CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ1PR11MB6083:EE_
x-ms-office365-filtering-correlation-id: aee9d694-6bad-4967-8c0a-08de544ffe87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YVYygrcGBiDgu8dh3CnU6smWUvcwf7VfpQamB3cBAfFYBXTv7dGtRPCfZ3CF?=
 =?us-ascii?Q?/iUBCaYk3i4ZIzjcATVu9f1YRrQZNL49LuVuND05KUgHbZ2e6pIXWAKFTFjI?=
 =?us-ascii?Q?9DJpbB3Jhi0l6jxZk096GpQqH6Vdd1jXQdtIxw4mFyZgTnoVMT+1D8g45HLl?=
 =?us-ascii?Q?3JBQKMY+znBTqijf/cuNxV9eVCrejh2DDVW+PpUsMgNSV1nE+2edAT8tDMrZ?=
 =?us-ascii?Q?FTn8Z3faSOHx+Fy5lzMCSWCl2kgvD+aSt8vrsxEQq+/BpnviMd3IU7kLm1bq?=
 =?us-ascii?Q?Bntt+4cgKgaHJcZ/3PXkCi+mS/NXHdJeEu08oF4kUrDO89FlY6RHyjOc3Ct4?=
 =?us-ascii?Q?EiQPite5A2LWNsbItX2zD3ZnpYBp94u065jorOdivyeio0sNl7qc/p4JBT3u?=
 =?us-ascii?Q?oP+HnprJ7nd7MBUNTBDzqv53Pqq4J1AbOc5yJMeWdSGU88US1F63ztYQTNID?=
 =?us-ascii?Q?uRBjYDRr+UqHQarefFQ26rVlpjUWymlgFtOwGt+YMmJ1r0nQd/o62SXLNYTP?=
 =?us-ascii?Q?OpAYU2JDCLGklPAexUv+On0Uavicyd4nFWflanQS/gtkTZCc3JbPjB6S7c3f?=
 =?us-ascii?Q?Ey0J266QO/tUEMX+eNE1WOfkQ67g83THNlDz8ScH8RCckTDHtiylR0c3Yc6k?=
 =?us-ascii?Q?Ze14/mmX/AzyHJLd1f1WpGlN5XbNLCCdsZXMKqJXeiqtQNC/pVjcUcfiZvxE?=
 =?us-ascii?Q?LjJdpfy+v9EUvIo4q+mgKF1FPSRbtgP6hGecgCkQcahCMo/FQIEwDf1jj6rm?=
 =?us-ascii?Q?YmkL2V8hbvQIcxBTcevPIlwZiRyrpzcIq5/PMx73fmptNZ4WY8b2KppR/VBF?=
 =?us-ascii?Q?R4VMFH7rxugQjNfmtWtYfXbDU2ep3UiZ65k3zDXAUN+grCol8bwE9A5dc39p?=
 =?us-ascii?Q?kiPDSBkoEE2DElE95nuQVcgc4aAib9fhp6NlvClJQpc1J0DAALRez3sMn315?=
 =?us-ascii?Q?7UV0XdjpN3be4N1mwlNYFPadhK5pp38K0F/t4wSodolNkhEVyktH19iA+Rs5?=
 =?us-ascii?Q?gg1lVGY5pNWwEZitnwRq4myLLOC02abh2dJxul7p0aZFEzLAbkQfentDk6f8?=
 =?us-ascii?Q?U7GfER8HhCFbXVdo3mJ6hvAG616d8L8noiZ3ubWw3VA1CllF4krJ70nb4a6t?=
 =?us-ascii?Q?8e/D7MlzFlHawkvDpN/h37sfX1ScIOn0Og9vHSmNal/FtPxEcUroROMTrN8g?=
 =?us-ascii?Q?BiM6pxDoSgAn71K9VKtfD1F1o0Z7y0st1RKHyE/nMw+vlascGxXlovtTtiGF?=
 =?us-ascii?Q?kYgPkdOsnX/O5YyDsb2Ctwxs86It22KzXmiuRSgdbnLLZ/i8D/fjgaCs3pt3?=
 =?us-ascii?Q?D7j1V6rutWFSBIJLUxxSAadKnwYs6NdYxpp+hO0ToJ5Lc6Wt2QsBav2vp59E?=
 =?us-ascii?Q?ETMQKKgxDvfIx7Ny6vHf6HuokTrCnNy9zrt9Nyq/PX6uqePWAprvigSWto5q?=
 =?us-ascii?Q?i/ZxlibwCIVEmDai1ntnnd0+Dg8/tZQf8g4XsSB7szQ4nPcQFiSlh8aeXHht?=
 =?us-ascii?Q?ip+ZtsqgiugpIqyjL9aGZVnYZJXfbun/SyPKGtkDe36LKdnTdv+ZPhImI474?=
 =?us-ascii?Q?22yYcjwKEV7z/rjisIwLdYCl8+io/nff2gTACPUlaTNCQP5wFdcPN3OJHCg6?=
 =?us-ascii?Q?KddTBOl/qxmxew3jhaLgEeg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qE8swrP/ktzqEISSZNx1F+fFEP8mJe45cflNyV7V9nIbx6s0idao8Z4BUKgu?=
 =?us-ascii?Q?Wvknuz7Oj+orDxL2xu/L2BD5NPbQmNBTV4OwhONXUYXqHY+mMhdte+gvjcs2?=
 =?us-ascii?Q?ww1CpWUjbCE5HLXy5l75z+Kjzzl/4MnuVkgyO/EFIaNfA4dHKYEM7qAEwMc1?=
 =?us-ascii?Q?cIJ62mHtwGntxG4JjuF9JD/gxW01glECXi00yMqnfTnsCM1hKvhXcNvWTsgB?=
 =?us-ascii?Q?S29qgFrePAvLl/k7EWJ9xjSVDu9EYmcR4zATGiVldI32I3lOvf+sJX0RbiRS?=
 =?us-ascii?Q?EA7gMKSrGot5kFQhycLKMiTH41EGrKgm1/9yyeJCf6H7dr1DpzOqbMIzVCXK?=
 =?us-ascii?Q?IdmUr1zV7xUKEuZtAJvKIZ3VvjJpwdy7gbCC3Ri/bR3RDMRywAeFn/7PqLU2?=
 =?us-ascii?Q?cAF8hSSs4A96+tGsZORNjiNEWeH+UI/oJ29oJvumEgj8gycr5caT2fHyvWKs?=
 =?us-ascii?Q?auxa2M71IxgYD/bMhQSmH8uMmPHOeu/BaRPBEFBqsrrLbIARzxEgkbxd04g3?=
 =?us-ascii?Q?OWyjDdvs50+7VgHn92C8D+0pBBBHmQQmcBYPq99dTrzUsqOHrXzXXQUZpP2o?=
 =?us-ascii?Q?kWeQ6m+/g9CLN56EFGVCencYaA1tpEWD8Bl1t+8DcW+vkhs2eZtDhasVWCIE?=
 =?us-ascii?Q?VMyX9GUh1x3zvdKgcB+YVqbR0XnQFmSkS9EMtyfwLbx0a9lQ3a9j1kO1xa9+?=
 =?us-ascii?Q?gotgTuYV/R5v1maXJtDQpXjmB9PFynSL4YtI+LJ0MMK1UbkVmJF4cFIjjnGK?=
 =?us-ascii?Q?7i06fGus3j82QOkISO6zHmDi6P2S64BjOv+ALvsomf3LcidthDFkdjuKPy1W?=
 =?us-ascii?Q?rcSDGQoaYnzf0HglezPdeJ0EqfEylyCG9SMkAKNDKyoZhc7HZUIv1Aczv4Ko?=
 =?us-ascii?Q?PthGgUrHypu/26CbhfKibCMqpxd4ENZr52SFXXwS4T04THpdtmWMfl+m9kzG?=
 =?us-ascii?Q?cdUWxJza4l9xI30SS5PM/k1RDCGb9ePP9SGkkHVqbk2/gyZWd0CZ1qmsJlOU?=
 =?us-ascii?Q?1CNnGgeta4+LLQ2yp0QazOucrH63ar/uPPYbwCq0fex0H+bdDDFVqHeCISk+?=
 =?us-ascii?Q?t0Essy2FRvtQ48Zht1uNipp4ZJuldTYBNL3wVZqv65hVh4wujtFcN+ONmM8D?=
 =?us-ascii?Q?t8X2pvwNP80pAvWHZ0CSL++rJ84gCuEcEFawsZyOGca8gPe/45YzAGXIL84E?=
 =?us-ascii?Q?w5gNxmEqBah3MQRYFfYQU09HLFTfAlCccLebrXETuxtPH1GFMfVRfXc1PSk6?=
 =?us-ascii?Q?43dywgbWC8BX+HZaH+9zrUnjk+GHbwxkOjxXiL3/NHt1D6bRk7ssg0y5qdI9?=
 =?us-ascii?Q?ZAvgklIopPtIJti8NW57rJpfJ4oZNFjZH7UEsnLKVe+vobXhKgD1AkSCsgli?=
 =?us-ascii?Q?/jfx+N/kPakMcBjYJCzRvRLX2QSUcvSqASSA8GnGh7s+6+7BLpto1YmQJ44R?=
 =?us-ascii?Q?4iiZjbRmvqu1KAorPKjqsf2H7lWcJv8AylJtZJt6n/e9ORmt9Q/I+J5TSgHC?=
 =?us-ascii?Q?7yK+jkIB/YaOJHobMa2yiS2GDRr2R9eBn6VCMMQM7LS5HMoZu7bsHL+Buk0A?=
 =?us-ascii?Q?IDsKGhujCtNvCfqIapSsikJmVnHO/SQNY+2tOSaWBMrdETG/ZP6fmPTzbg4X?=
 =?us-ascii?Q?eg+o52UgkT3OgTQ1Cc5Hu1IjmKZ/Tt8faR0Yh3nLUaJD992m/ewQSKIzuDjY?=
 =?us-ascii?Q?8qPsmMNl8YM1+btBANd38zaCGkNxbFdHyh/OwI3K8fn9hjpjuflmD3qNXdeT?=
 =?us-ascii?Q?qXFiUDC4+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee9d694-6bad-4967-8c0a-08de544ffe87
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 16:06:08.2385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ocm9BIJbvR62MC4h4OVAJcGNNMDAj4hJ5GJ7dW0dGyYg79kcoUa6MIVpgO6ZjPuYGWSLeLx10NBmVe5Xp2Bm4wWmvixHrvV6PVjYp7U6NPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
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

>-----Original Message-----
>From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>Sent: Thursday, January 8, 2026 7:06 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
>Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
><riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
><michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V, Moham=
ed
>Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
><kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
>Subject: [PATCH v3 0/6] drm/xe/sysctrl: Add system controller component fo=
r
>Xe3p dGPU platforms
>
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>This patch series introduces System Controller (sysctrl) component for Int=
el
>Xe3p
>dGPU platforms.
>
>This component provides the foundational infrastructure for communication
>with the System Controller firmware using MKHI protocol over a mailbox
>interface.

What is the MKHI protocol?

Is there anything documenting this protocol?

M

>Key features introduced:
>- Detection and initialization of System Controller interface on Xe3p dGPU
>platforms
>- Mailbox communication with System Controller firmware
>- Fragmented message transfer for large command payloads
>
>This implementation establishes the base for future System Controller feat=
ure
>enablement and firmware command handling.
>---
>v2: (Umesh)
>- Fix commit message to 75 chars per line
>- Address CI.Hooks and checkpatch warnings
>- Add sc_to_xe() helper for cleaner conversions
>- Alphabetical order for headers
>- Simplify write/read frame logic using memcpy
>- Drop redundant frame length checks
>- Use xe_mmio_rmw32() for register updates
>- Align FIELD_PREP macros
>- Improve error handling and timeout messages
>- Handle phase_bit revert on write-frame failure
>- Update rdata_len on partial receive before return
>- Remove unnecessary headers
>
>v3: (Matt, Riana, Umesh)
>- Split patch into logical series
>- Rename SC_* macros to SYSCTRL_* for consistency
>- Move MKHI_* defines to .c file
>- Pass xe directly to helpers
>- Place devm_add_action_or_reset() after set_sysctrl_region()
>- Add kernel-doc for xe_sysctrl_mailbox_init()
>- Add short documentation for System Controller in xe_sysctrl.c
>- Avoid hardcoded sizes
>- Move structs to _types.h
>---
>
>Anoop Vijay (6):
>  drm/xe/sysctrl: Add System Controller register definitions
>  drm/xe/sysctrl: Add System Controller types and structures
>  drm/xe/sysctrl: Add System Controller mailbox implementation
>  drm/xe/sysctrl: Add System Controller initialization
>  drm/xe/sysctrl: Integrate System Controller into device
>  drm/xe/sysctrl: Enable System Controller for Xe3p
>
> drivers/gpu/drm/xe/Makefile                   |   2 +
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  44 ++
> drivers/gpu/drm/xe/xe_device.c                |   5 +
> drivers/gpu/drm/xe/xe_device_types.h          |   6 +
> drivers/gpu/drm/xe/xe_pci.c                   |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
> drivers/gpu/drm/xe/xe_sysctrl.c               |  70 +++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 429 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
> drivers/gpu/drm/xe/xe_sysctrl_types.h         |  23 +
> 12 files changed, 666 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>--
>2.43.0

