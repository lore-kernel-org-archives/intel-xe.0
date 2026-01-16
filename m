Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8754AC982D1
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 16:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C07410E1B6;
	Fri, 16 Jan 2026 16:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8srS/CD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6810E8E6
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768581201; x=1800117201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l8+4CmdT0e5peyw8lzNwZ8YWNpLaMkc/qC9X49PEKV0=;
 b=d8srS/CDWr7we3JXGauvfv/7dflh2hrks9zXjLpOJgW2yhdItW3VIgTy
 8qtzGGZfZsFA7ZGpTVqVAqLUvFQNw5u4+tUclO2WEKREpAiKdrmGTHDQA
 4hNcyhYL9VrASpA3WK/4KzhU66KXx+LYMQFPvndtcehhlHrzcblw7zMlS
 o8mCKKUEe/pLblMhkHxUuZYCDfmlMdvOTwVAuayTHi+INaFjkR+oD9MNK
 FqL1zjEgbGBXUesVu7txcTvVg3Mv4wXgpIkXxaBBjyxp5VgsfZVaFmIYY
 Y7fglKZfFiI4uW7giROqPsI1Ueg6APicDtBB4cUAC6Xps/Zjul2WECf34 g==;
X-CSE-ConnectionGUID: ftfC6Or5Tieb6CgyEspjUQ==
X-CSE-MsgGUID: oeYW7ePkQPi5AzlZygzDIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87472119"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="87472119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:33:20 -0800
X-CSE-ConnectionGUID: I09pPsaYRS+Q125wgZyBcw==
X-CSE-MsgGUID: 3dCDJb1oQdmc7PwZdzQ84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205180257"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:33:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:33:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 08:33:19 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrvtOpRuT3Whcp9SXnfpxkWrz7TI3+zWEFMaGHybljFQe5xJnRQAawWGsjJX1WV6m1QDTA8QLvUKeBth0mMO2FVdX7paHSlEp9MjZ8lLKhsdFLNhmWeNsTvCd/+vo1nkQbWrMaIFAGCuRMj/g19D99LTt2B8ZwvKEBlqqPD+Jfkyyk9zR/ZxI+KQ1kjgxajGQ1L7PgieVrnavIIvXDeqoqAxPeZMAh8tLnLKHMi83mozYEgP1n8H15ELGMUR6e157vszf61c4L0pQBU11pFuRLzfWnLmpwzipgdGb08AOR83cqL2uKQ/GcsnHcF3Y/HyCSJS+nQ7o27v4QW2uaCwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtn5o4Kzuw5Vs3vSmbXrhLmegZ53lVLYz/iI0OV6EI4=;
 b=hh/JohNzHJlmA+kc0uId6iFSf08d4zCvQ4F1PhDMzfEe7Qr4ekoXjUisLEkikj1A8cpWNptSWPL2VFY4OTfJgQ41zaWWUJla8cmcJxVg1v2EyQZiWDvN8YUlmKtifafiqaygwf+EDM5ZzHEyFuHOfH/s6oExNfqy1kPiAxw2wMXY8YDOkvd1WcsbpWXHP75oAoExAmn+78VajHZvmfo07vUchgoNcgMyVw+ru6Tl5I0drJVO1sRqoSienZ5XuZ/jm5AESURPNIIVpYnBaW3EnHjdroaNBt6wBMXtMwUIUZ9eHJykX75zywrapDur4Yc2DFPaNiCu73Ismu/tMQun2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 16:33:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:33:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Topic: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Index: AQHcgazcNhfIpqI58EidvI390nVLXrVQSveAgAS8ViA=
Date: Fri, 16 Jan 2026 16:33:14 +0000
Message-ID: <CH0PR11MB54445EA89316FA635C5825ACE58DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260109211041.2446012-2-shuicheng.lin@intel.com>
 <DM4PR11MB54562D20A8F3FDFC23440E61EA8EA@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54562D20A8F3FDFC23440E61EA8EA@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB5885:EE_
x-ms-office365-filtering-correlation-id: ba9f1166-0b83-44e9-13e8-08de551cf285
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5+EJG/NX0vkS6riRMKaAGFjySmuXPQ6hz6/tCk5zKm45KOQ37B59OnCfxnDu?=
 =?us-ascii?Q?p+oy+vUFFIb4bTo0XbgghxrSISVMpx8/kSNTm8cbNBw5t5IS/g9aisjCgSEZ?=
 =?us-ascii?Q?OXX45qsYRQnnTrzsLJkexXp0SCDTGrkGIzZU38vGMW6NkhDN7DGUggYjaruH?=
 =?us-ascii?Q?+ktmNQ7oNJsI3soaPcBzsnoMTmL2MyNvpEt0v2xvoqejMUpuXlQd9E2Vvvcx?=
 =?us-ascii?Q?EqSk7HbMH5pfmQGTSwowf68ZwcwgUgFWgwfw0tUj8uaKs4lMt0gtoJ/I8IDN?=
 =?us-ascii?Q?9cg5ez9Xyj9FSqCy15DaA0yoKs0RDoH3NlsGZLFqRE+uweN4D0C+s4cquTdc?=
 =?us-ascii?Q?25BJ+l1RlmrIFrMC+ZJpX/13kzgKn9+o24tiGr0uYPnLMVQRVGZXRAay/0+f?=
 =?us-ascii?Q?PGJaIHGl58GzoGyuTUqqB38yYcX1FLymgEwEwJ0HtpPtAsNsY3tG0lYaUTAS?=
 =?us-ascii?Q?fzHP92H8S8BshqNPzq7xyONCSA1aCgGGFJuBFNS7fI7iiQQ5zoEbx/6A6v61?=
 =?us-ascii?Q?JFtT53vYntV/uYG3Yfa3MjpSZn7pVXIx6bxV4qXuUQ2Cux61PU8EA3g96WiL?=
 =?us-ascii?Q?QG1JAUdiG4BhtE5Xn6CEgf/YC0E2gScXqILpk1sbqdywECEm1kWwukyo3UVs?=
 =?us-ascii?Q?YC83Y+OYlpqycwlpIogtMN+zaXkwkQjUoGfHZ6t0Lf2S/JnTFQdpARhFLXqO?=
 =?us-ascii?Q?FVOw4n3Lu0iokPyERQIYhknDaF7X5Cb9+ft2xhrxB8b29zZO/nVA60UYc/Qd?=
 =?us-ascii?Q?2+JqxXz+7XPzCytY355t6yRocShW0z5IPTdQo9z0RlXOGUNef6SNbfBNnB8H?=
 =?us-ascii?Q?UNLYm//1Uv4qZPlExfLV6L5KT3n4fEKbJ2ySF+DwYhl8n2Dmy4uFZAHbQGmt?=
 =?us-ascii?Q?ifVMsNtV4Mffp0d1+URW7SdZCII4PCbzCSA8whVlse99RvZQWbhQZ8pBedam?=
 =?us-ascii?Q?q4d8/19xFp40fCB+1AYYeqMGR0wUkaLwpL4TlWfqwIDBdxRCyHWOZNgL6oNs?=
 =?us-ascii?Q?4THCi7q9zneI6AOdsapOL6RYYuE1qFW8knUwn4Q8ISydwBjkPbsigpNCRFrY?=
 =?us-ascii?Q?TzQfo5IyUyJwjiVzhtzPbOu6TM3rLqhhK6EHoYNMGHp+7yU7E2ozLsv2Cmz7?=
 =?us-ascii?Q?rARwtQ7in5v//sizJA+4Q0mjrJlIs6URwYIMAMVPXFmj+3EYqUehYD5+POwU?=
 =?us-ascii?Q?4nvRMNNqLWb6cDrffN0lxChbh0HewYjWOTb4gZ3O17VXxgqY2xRTxnYBEqCt?=
 =?us-ascii?Q?BWxed3vWeJOIcee/kxw+RRTGGrdkkyWX9JNdcNn9E4VoxSw5UXheQozprwPj?=
 =?us-ascii?Q?pOUmSqVKVHuqHD1H2eq0xvaGExFFCTRVO1C1TgpyaVRTFtPv/KoZRqi9AkvO?=
 =?us-ascii?Q?VQIle5MLnI49onraBxbi6kKksSU4Znp+pNEh8NGPv0KfnnEgw0eApaNuPKQl?=
 =?us-ascii?Q?zTvnCx5k7laaJASYJWdlbS25eT7DEI2vOwW29sxbC/vbiYfErN3B9H+bAgJX?=
 =?us-ascii?Q?HlIgJnedbVo0t0XRey/ZyJ9DbAAYRLgIgqa/UR8PejesJ2rBC8HiiH53Fe9K?=
 =?us-ascii?Q?XmI31idUOrHiVTRNx4rTNP3ZHvRdz1WXnGHvM3Jrnw/jXwMVIjCD/uXVYEBt?=
 =?us-ascii?Q?N3KV5RZW4E2M8B4tGFGxeRo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?na/weK5udvC55R10KLezhtvk1wq6dPVf+EJutemi6zUm5ff4MVtFf4w1Xcud?=
 =?us-ascii?Q?MTiKQoITqhKDPTdmHhlN3ff5x8nNlTUsMsBxGPbGbT9QxzxCedkT0J91flLH?=
 =?us-ascii?Q?elQ/gRT3avgLpAQAhA6IoHFHndVW7bqB0EwbdQQ032/kPjnoNXt5lCjb0Wi2?=
 =?us-ascii?Q?PDHO8f7b/AlrpwbBlcBhhYocq18EQoJ2hikE5+RBzRskO8KBx8uKyUEM/CtU?=
 =?us-ascii?Q?uJZjsBGpHOveeLnt9vhptnq2FBkHv6E3uKwwOeSpititfArMdj/RH+gyR4rK?=
 =?us-ascii?Q?NLvEWd2Q6okQPEaWhriCm4io77GHq1BxWAhW/ZUoJBZ+oyfxf8XENCDXJUby?=
 =?us-ascii?Q?j3ujY3n65LIoxqEuVFM6kjnmvjrgmHdXbebb2gJd6AAMv2YpUsGF9o8QM/YZ?=
 =?us-ascii?Q?tdChyGyigWOQIRsNsaEiXyFXNQ7NFXy67UwAzE95AItmljhHyhPkZ1x3c8va?=
 =?us-ascii?Q?9q+SU3ec+bdTJhqtiJIjA0U+s77UtsqBzQUni0qe/TzIaC1+Su1stIJUOkak?=
 =?us-ascii?Q?UjKNsQEIbjx3TUjItWFLKfKybwnYhhsUDVU1yycSgfOx+PoVhmYQAdscLr1r?=
 =?us-ascii?Q?QrbGEMmPXyv1eWSGhok+rxu7TxsOdd92KTCtF43ounttsATl8BMskzplXoXW?=
 =?us-ascii?Q?M5pGBqidarbecgsevvfm0v8ETJZC2jLVsnvsCQWJoolCaZdu6AgrrbcqjmKB?=
 =?us-ascii?Q?GOaoarHXY/iVl9M/6aHY+1bl/0PeKXOLBDfF9LeBugv9jliwB/ur9B8tdY4+?=
 =?us-ascii?Q?q85X5VT+tuyN8l0c0OIQroe96NyqrhvgPJRIQZmaLCAEVHmja44JWhI8N4PZ?=
 =?us-ascii?Q?J/mifmly9vgg38KR0iACBvY7/dtSNuQh1nh0xKF/FHAAntG/yCK5EvFCxSoo?=
 =?us-ascii?Q?zMKLLAtm+LT5CNa7y3sLFp6L7mssd11PCteBZR2vLUuC0Rgpw8qWfnsDW3/+?=
 =?us-ascii?Q?n+rqUKE4hToBg8gwut3+6t6gkxctFPPFSgbyXnXAn3OSaDF763Dsuatcle44?=
 =?us-ascii?Q?HHiCeGYlm07dG8o3/LRQMOqwM8mnc8Xmaq7REX2NZdiqXl57Sr6fyMHCtJKN?=
 =?us-ascii?Q?PIZnPoneg/M7ANt5OiPjXwejHUFx4QzEmd8v9eYIomuazebMpPKEHoWx3+Af?=
 =?us-ascii?Q?JxnUO8oLPnQemLLoF5OHmqNh+noIL59W2Bg/TYhVxS27Bfm1FH+JiZMZdXQf?=
 =?us-ascii?Q?Ql9ZMvNivfi4mxToYS4YVcSqZL8zQpR07HqgzfMGKJ5NxNZaIrQg5SkbRqkl?=
 =?us-ascii?Q?ZDwbBo0If8SChcE6S+y1D+BZ/MxMZdXluiX0zANmouhncbXlKDKYepv9WW4D?=
 =?us-ascii?Q?2A3NAuDqrUpIPgHqAJVUgl3Bqj3eVZgNpszVdJYnCxdKNdetA/HZljMFzlID?=
 =?us-ascii?Q?y8IPg0gty1gved9uqs1LXlEuYSm3u8ExxTRq1nOf499Yejs7VXsHGwwF3W/g?=
 =?us-ascii?Q?PF0/syinuR7QXFVBjNywj8Hzwcm3CEq2qTgsC2qf6hbi5bx74Iym6gEcU1gd?=
 =?us-ascii?Q?4eBnRLUb35kN0ujo5ga3tanErBCDhmNGq4CaecxoUJ394BmYAt9+pHMVhOXI?=
 =?us-ascii?Q?dz1B7r1p5k9JnaqJEM/t8EPlU2mPHOs45fWjlXK3g6nR/c+17f3JehHE8Xq1?=
 =?us-ascii?Q?hU52uqsgJ38o+5gSUwsuqcM1FWBn243zG+WxWvhkotcs8qwfLSFcle/GzGAY?=
 =?us-ascii?Q?qQXdhtaVVjUD9A3g7stc4irCqYmWjucscZH2Q5XUn3sowmeSDB48erq/1g0U?=
 =?us-ascii?Q?YC3A91oXFw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9f1166-0b83-44e9-13e8-08de551cf285
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 16:33:14.8689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkGqExoWG+pGRP8XVqJc8iXEKxxBWD0NdK/HOajiU4lCHwY9fffOb1Pf6KdIzQ1PxdEsBcXJhWDU9Bl/KEo8SN1QY1GmHh4OC91gBs+/Zzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lin, S=
huicheng
Sent: Tuesday, January 13, 2026 8:11 AM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>; Roper, Matthew D <matthew.d.r=
oper@intel.com>
Subject: RE: [PATCH] drm/xe: Unregister drm device on probe error
>=20
> Hi all,
> Could you please help me review it and share me your thoughts?
> Thanks.
>=20
> Best Regards
> Shuicheng
>=20
> On Fri, Jan 9, 2026 1:11 PM Shuicheng Lin wrote:
> > Call drm_dev_unregister() when xe_device_probe() fails after successful
> > drm_dev_register(). This ensures the DRM device is promptly unregistere=
d
> > before returning an error, avoiding leaving it registered on the failur=
e path.
> > Otherwise, there is warn message if xe_device_probe() is called again:
> > "
> > [  207.322365] [drm:drm_minor_register]
> > [  207.322381] debugfs: '128' already exists in 'dri'
> > [  207.322432] sysfs: cannot create duplicate filename
> > '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:0
> > 0.0/drm/renderD128'
> > [  207.322435] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B =
  W
> > 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> > [  207.322439] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.322440] Hardw=
are
> > name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812
> > 02/24/2023 [  207.322441] Call Trace:
> > [  207.322442]  <TASK>
> > [  207.322443]  dump_stack_lvl+0xa0/0xc0 [  207.322446]
> > dump_stack+0x10/0x20 [  207.322448]  sysfs_warn_dup+0xd5/0x110
> > [  207.322451]  sysfs_create_dir_ns+0x1f6/0x280 [  207.322453]  ?
> > __pfx_sysfs_create_dir_ns+0x10/0x10
> > [  207.322455]  ? lock_acquire+0x1a4/0x2e0 [  207.322458]  ?
> > __kasan_check_read+0x11/0x20 [  207.322461]
> > kobject_add_internal+0x28d/0x8e0 [  207.322464]
> > kobject_add+0x11f/0x1f0 [  207.322465]  ? lock_acquire+0x1a4/0x2e0
> > [  207.322467]  ? __pfx_kobject_add+0x10/0x10 [  207.322469]  ?
> > __kasan_check_write+0x14/0x20 [  207.322471]  ? kobject_put+0x62/0x4a0
> > [  207.322473]  ? get_device_parent.isra.0+0x1bb/0x4c0
> > [  207.322475]  ? kobject_put+0x62/0x4a0 [  207.322477]
> > device_add+0x2d7/0x1500 [  207.322479]  ? __pfx_device_add+0x10/0x10
> > [  207.322481]  ? drm_debugfs_add_file+0xfa/0x170 [  207.322483]  ?
> > drm_debugfs_add_files+0x82/0xd0 [  207.322485]  ?
> > drm_debugfs_add_files+0x82/0xd0 [  207.322487]
> > drm_minor_register+0x10a/0x2d0 [  207.322489]
> > drm_dev_register+0x143/0x860 [  207.322491]  ?
> > xe_configfs_get_psmi_enabled+0x12/0x90 [xe] [  207.322667]
> > xe_device_probe+0x185b/0x2c40 [xe] [  207.322812]  ?
> > __pfx___drm_dev_dbg+0x10/0x10 [  207.322815]  ? add_dr+0x180/0x220
> > [  207.322818]  ? __pfx___drmm_mutex_release+0x10/0x10
> > [  207.322821]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.322966]  =
?
> > xe_pm_init_early+0x33a/0x410 [xe] [  207.323136]
> > xe_pci_probe+0x936/0x1250 [xe] [  207.323298]  ?
> > lock_acquire+0x1a4/0x2e0 [  207.323302]  ? __pfx_xe_pci_probe+0x10/0x10
> > [xe] [  207.323464]  local_pci_probe+0xe6/0x1a0 [  207.323468]
> > pci_device_probe+0x523/0x840 [  207.323470]  ?
> > __pfx_pci_device_probe+0x10/0x10 [  207.323473]  ?
> > sysfs_do_create_link_sd.isra.0+0x8c/0x110
> > [  207.323476]  ? sysfs_create_link+0x48/0xc0 [  207.323479]
> > really_probe+0x1fd/0x8a0 ...
> > "
> >=20
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs=
")
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index e400ad5c9f9e..329d17fd6100 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1059,6 +1059,7 @@ int xe_device_probe(struct xe_device *xe)
> >=20
> >  err_unregister_display:
> >  	xe_display_unregister(xe);
> > +	drm_dev_unregister(&xe->drm);
> >=20
> >  	return err;
> >  }
> > --
> > 2.50.1
>=20
>=20
