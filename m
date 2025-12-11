Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBE1D43359
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76C10E8BB;
	Thu, 11 Dec 2025 22:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKNwkbah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA0A10E8AC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765493324; x=1797029324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=08h2zWlAigByYhRxOZthEM0hsVAJgsYfPBmML1N0l6E=;
 b=cKNwkbahCbVbCAiJnodq6Jwj+DTCs9JEt1a75WQ/7iKrL2pyGj5AYA5L
 Q6l7TpTpatLXiUDWWo3QyuzXKq4YmNtYPQUlHB2fQLRKnqusAdmwv8S1E
 7C5AM/I6fU9bcBJdDbXtIrB2LROPJ9Yoxxs8k7bsPov9mYSt71TPiFthQ
 85z29IIW3el6dGQnZOJoqrvxK9Ti2v1sjgHu3JZGiN3MWrm8wC1Tm9zZm
 sYqFaWyNnuFkJUErTEfcYkzCty8nWl4tqXOXZEEPHS7T4PGA9nQwY4XIN
 nrLl9/A6LoGDuV+yYvecwxiymbSrPc6Qq/DJV8QofTuYPuwXY9PGHFq27 g==;
X-CSE-ConnectionGUID: UTJS9DLhRF6Kq/Xgj7sEmQ==
X-CSE-MsgGUID: XxncEVWiQZ+zEpx4MwOdLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78948453"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78948453"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:48:44 -0800
X-CSE-ConnectionGUID: hzovckjNRN2jt+JyXKYDMQ==
X-CSE-MsgGUID: PzgospDyRg+1VP0g15Rm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201084793"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:48:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:48:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:48:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:48:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbvsSspUn2Ca+xG3rYmH10W+fRDLKxQIxHVrn8cYjnJouUYcX9oZTGTAJhhekOzKsTU8HUTXc40rY6TmS/OKhPb6rxhH9aZhmt/fMgb4QB019c/rWv57pojMikFg5Bmc4ZuFZYABclhcjQgJMg9gPRImyXO4ufM6IVFL7/3JZ1+njcgDpkhZr9LL6nLfwoHgtI2GmDaUz9u+6S2e7VdRgAyUoovCARsPeA7dBwwEB4+mFGo8WrdHicuN1HPSBwJa3H5F6oxqmUf1HgMG3uRbRf8E/XHY0UF43WKVMhm7y8vjxm70rEhXU/Uk6C85u20ieF7Qz5gkEMbcqvtngqoI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DW84wkT7VQ739cLxh9/VOtFUvQI4d+swOpSl6AYb7aE=;
 b=ogsrUwRmHT1vr+d+FugEf8e9nuOWnVvw2udnT+mXYGK86cHEyUSn6xPtTFbAw97otvhCiVxCU79Pj7ax0lTrqO8kXDutk0p5V1KXLvKrP3aKKbvjmjQKjV+sZ5mxbvMUGKJl69sZgbmPswrXbo+uxJ2rv4US0DzkOLaliFJqIiAqup/t4guFYrug9Irt9u9s4FhHi0WPe8QrkfhdDT8vXU8Y+zk48LQbil/sw5wQxamjrBhEJIkL/1ODIPQUj3Mb54lgCDOc1OnhIdJDAqt8H3Wi/Ra6PJdgz2iGFAQCd3XXz2st2vwMLnn1QgJfH/04B1BR2bqpiybgx65NAQCsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 22:48:35 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::ceba:7a73:8708:315]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::ceba:7a73:8708:315%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:48:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, 
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH, v2] drm/xe: Increase TDF timeout
Thread-Topic: [PATCH, v2] drm/xe: Increase TDF timeout
Thread-Index: AQHcauRBbBR/qVSsQUqmqVI69QaavrUdClcw
Date: Thu, 11 Dec 2025 22:48:34 +0000
Message-ID: <BL1PR11MB544579F7892E604BD4BC080FE5A1A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <0201b1d6ec64d3651fcbff1ea21026efa915126a.1765487866.git.jagmeet.randhawa@intel.com>
In-Reply-To: <0201b1d6ec64d3651fcbff1ea21026efa915126a.1765487866.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|LV8PR11MB8486:EE_
x-ms-office365-filtering-correlation-id: 560822e0-9b65-4c00-5fde-08de39076aa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qVuMzER7SYJgnXZbPavoFjRycS1Xy4LIkoVPt1lruYk5ladH9UZ7cp0jz1O3?=
 =?us-ascii?Q?P9v0MDk2Lm3eiHgQi9jICfjss7twgT0tVDo2FvRv5VxxGhopWiQiisJi72SI?=
 =?us-ascii?Q?4NO8WFht9KfPs2cbx5PktvzgLFbq62ysoHNeu3MgMV1MP8svvRcp+LR3Lypu?=
 =?us-ascii?Q?1UdU+IcHyQoXFoZzN06FqT728AR0bQ5P4zGQQZngtNDpOygIgOu8pp7ixUVO?=
 =?us-ascii?Q?6371+3u+CZvkk0PBDql0L7Hj4wtt0xPpW3z3AaE6qZGjXXR4OqFAWtir/krt?=
 =?us-ascii?Q?5a05EQwDg+stmZFkfH57l5fdAMkuU0wj6QKrpJiDOVIQ80vrYPX4aq1YJ6qk?=
 =?us-ascii?Q?TnodL7yURAgD4jGal6fQxkZ3jWuUDzU2oDJrjAsqdvtNWk4PlEec4NdTCAfH?=
 =?us-ascii?Q?pC9Js6RLr8NeP55hQz1Kr8l5pqQCB84QyBhn/DpBgkD0BVVJ0p50KKtJuC8w?=
 =?us-ascii?Q?uKzo5r44QVUiC8Uo2Poovgu8hMlvKG/5z8Wvc4QDD0lBAHN3fMdyLa4L1i4+?=
 =?us-ascii?Q?+fJHsm13+zN2DGXMhtQHan8iZm0Z5lAwleF2eS5JGcRb0TYI3Gixb0i06uya?=
 =?us-ascii?Q?2/wSgdkDUZZI3KlW1VNmWtvcjBOUrYw5NG5Xhes/fOByKVvDNO3JEUvORtKC?=
 =?us-ascii?Q?lzkBmWwxHEi/Y2yHkMtBJZckiyfJSWf1a1FtCR18FFn5HoujmJ0wTx4DHeRi?=
 =?us-ascii?Q?DpyuCjlUBTbi0dQDVqLk23kqb9mWp/MKkDp9YXh1XimNGqFo3aTq2983KMLL?=
 =?us-ascii?Q?ylUBf8VerZjtM9i9Sp5dk7E5E9NCZgmwkJ2Yc5f/pJG2d6jgvWGIb0IdBHbd?=
 =?us-ascii?Q?urSlyuTKSu4htm0bfYRn0Eooy/k0fmZGJv9m8UnbsOv9EbYoQivBGgqRBrbs?=
 =?us-ascii?Q?CS6RUN+kBJtYIg8fCgiwOb0fYT/gTyhCeeer9LRzJzKaoP9B7YkB5UyyhIi2?=
 =?us-ascii?Q?515DxFR+kNmDoDtDECiVwEu7QBVWTySsClQVFX3HpHd0N6KuJAleW8TCXS8X?=
 =?us-ascii?Q?H3ao18WWCH9MhkNY5jW/gNmI9LnjeuX8BaRSHotT66yg2K7I9g8ML7TsGEPB?=
 =?us-ascii?Q?3PfwPJR9vhApeDpe3sr8yOD0qyBwS7AvdP/cKxbdAgA+4L6aS9UpSfjc5KVs?=
 =?us-ascii?Q?5Y9u+bMIUAIEaNSCzT845PnfjYB5hlsCDKZHxIuk8x6UeYIr0tFaaaLLSWXL?=
 =?us-ascii?Q?UDqFz3FOplYuSZ8ZQfHSdWKsBS5/U8vLJtsaCPy09g4dUlENTUJqBjPw2eH/?=
 =?us-ascii?Q?SqfLj4tIl6WCvWrdL/Thl9ZCdFwyuhi9Tzv/SaOvrRWf+JMlEXNfIL9IDcZn?=
 =?us-ascii?Q?pMmz2rCf0iua6WcJCAfNESdMeX2cdkeSxb8Eg7hQrf9ya3zYpdxoXmghtjaw?=
 =?us-ascii?Q?oQ06c6X0mLeufDqG7f+mlgzzPEqP2JFBUNB0LIdTnA1bgV7Bpgc+utcZcdI9?=
 =?us-ascii?Q?xDl3YiH+Rz/fkwO4cvAzsFBQ7jSL6HHJxoD/0GIHILogtMGyR8Q55JGGOiNT?=
 =?us-ascii?Q?0+K//wCndm/snRApbhbanjMFZO/2HlkNYI6n?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xtnb9sPn5lJDv6VGHhlTuxr0X6XxCUvk2qwrXLR63AEVTVCrit7LfiOhpLXS?=
 =?us-ascii?Q?lT5ARRBYwbUo/Xx6ZGGo3AwjRfnY9q4Yd/IrQBciIMppoLP1Quqq6per4e9F?=
 =?us-ascii?Q?YG+S6NJDH7FgnPY2mVS5rsE1jKUxiBaIR0P7C5jicgUTx5DpNbnFZKYqvnSe?=
 =?us-ascii?Q?u7ZIZAoENhVII+f2OxAadkWMz2cNnH/599AwXYatl+SmXdkmtBAaBo48Onaj?=
 =?us-ascii?Q?+jRsGNR2Nc9U42mmXIo6LDGGe22X6vA1iVqDgrfRb/aXK+7vSaqY1Dowb6qh?=
 =?us-ascii?Q?ePkDtgbZaJY7c6CPtkYrLQHQSMFvEhx6Iry9F8tDJoV4otu2zEjUeym8vxZ+?=
 =?us-ascii?Q?yCGJCu4ck1M/p0Ab/s1lsmeZU1eAhxFtjr0OGtOa7akHvuP42w5c+QpArG97?=
 =?us-ascii?Q?Bq9uPIg0xuz45JIDOR/lYbLKFFhGMFEURPzOqfNjIM00IpZTpy+ucxnOzz9a?=
 =?us-ascii?Q?Pm+8g4Wi5UF5+2v2IVA8HcVgDy0vO9v2+5aIXkOvu/oDnSMB5FPgHhiLzbLQ?=
 =?us-ascii?Q?wA5Bq9PNXBCI83Tk8MD9LS7k91PcK9pPZXIaD0RvbIiIbBKtHNasE+kDyXMt?=
 =?us-ascii?Q?itKI8kiPKP6zvYDL5/7RAIrsW5vRex8pnygy7q4EdyF8CG2s6g8compOJxYw?=
 =?us-ascii?Q?2HfYUubPVJlTZ8pIt+F4BqpReOAQBW1Fx1YynWmaOgQqDGhxezoJCkEXqjiB?=
 =?us-ascii?Q?TRKhMgMmweparBKtqakq2SNRBV20JeD7kitDKeuEyEJlwQ9pu+F4WKAcRi+j?=
 =?us-ascii?Q?dom3UFPiI0qfPUpnKZXGa4XzavqezWD5qziSxgI9T/l0fdb9Kg9OETKJEIHV?=
 =?us-ascii?Q?Wh6CrIC1d0omFi95i8vgH/q9qwJdAQH/JOHCjm3VeAsYxfVi9bJNmUw3Jy5A?=
 =?us-ascii?Q?PByPHa7Gyez/YHrJXS17Im/+lGxdLKWMfsDTvo8xnKZq7J+ymV2yXcPa/ip9?=
 =?us-ascii?Q?ZhkvUWlGXOI57bQySmzwb/BZWXkaHlRLDHF5h30x1l3JUpBBfF7BUeBO6Zaz?=
 =?us-ascii?Q?yDJuj2L6JGDT9goh+L/ItaIC8mzC2M19Y6VKJ9NzsfnOzLYWS8LL8Kh7xuro?=
 =?us-ascii?Q?0R8fsOow7zfC0CxG1HxLUERu1oN9JcqyzdDeHM05JDhjEfuNsTDjb46Dt0Jn?=
 =?us-ascii?Q?r2dRwtL/g+xqWUIxg/+EyCLU4sKPDXAj7omFZO7PrM7/L9pxq+RBDTSNJqfR?=
 =?us-ascii?Q?GCW31ms//AeQPjUsXgQpg1DT6+Qs3hLgwlCQK0mO7Vc6RKuMOnl+QWN7kf5S?=
 =?us-ascii?Q?dg2abahuOFXyPymgYWD+I95Xvh41Q2dy8XIUzyr4gqNXOu2cL+byK9atMgSS?=
 =?us-ascii?Q?flPLuAhlFrt0Y43AlvuKIUd/YOiA73GOSn7ScmQ0fpZPlqveqTIHAMvgAuU7?=
 =?us-ascii?Q?MHxB+2zX0zSX74GcePoiwKu1mpYnG5CMH598zDfh2hB/qXFoxKeuLMxWhEva?=
 =?us-ascii?Q?qhZ12iLFy9nunl3BZCYQtiHlt8cGCjKMaPul2U44osd3SwfP3b2W8d1MfmxF?=
 =?us-ascii?Q?2Pxm0EOP5RYorapP83J8GB9ZIo47zOR+08i6ptvHdHGmekWvwPs+5pdNMFeM?=
 =?us-ascii?Q?kK4QKZ79e9b8WwOjKeKkUAbIDuZnX9IAUmqBhN0R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560822e0-9b65-4c00-5fde-08de39076aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 22:48:34.9531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2UH0VM0F/OlRQgV2Yh1UuidjKdRVK34grbXnwIlzSNNSBtp3vsd9OoD8IutWSQeOeukJ1qKM+GZKgknb2XJSEexqa8xbiPgVdi+z6wbHn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jagmee=
t Randhawa
Sent: Thursday, December 11, 2025 1:22 PM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Summers, Stuart <stuart.s=
ummers@intel.com>; Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
Subject: [PATCH, v2] drm/xe: Increase TDF timeout
>=20
> There are some corner cases where flushing transient
> data may take slightly longer than the 150us timeout
> we currently allow.  Update the driver to use a 300us
> timeout instead based on the latest guidance from
> the hardware team. An update to the bspec to formally
> document this is expected to arrive soon.
>=20
> Fixes: c01c6066e6fa ("drm/xe/device: implement transient flush")
>=20
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

What hardware and bspec says, goes.  So, I guess this is
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1197f914ef77..db2f04e1e60e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
>  		 * transient and need to be flushed..
>  		 */
>  		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0=
,
> -				   150, NULL, false))
> +				   300, NULL, false))
>  			xe_gt_err_once(gt, "TD flush timeout\n");
>  	}
>  }
> --=20
> 2.52.0
>=20
>=20
