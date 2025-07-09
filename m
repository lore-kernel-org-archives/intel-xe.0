Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65E0C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 19:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0B10E360;
	Wed,  9 Jul 2025 19:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8xepu7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917210E35B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 19:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752088076; x=1783624076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TtD9RQZ23Nh0btfxUv46H5VlOhQMD9WIW9pG/cdHJLc=;
 b=d8xepu7LCVEKs+R3QasQ4TCnsB14CU10YySWIYAohRy/XgflIXcnjBRT
 tulN6fVf5F+5eF1DHz6yTtFFebxHtD6ZFSNL8JLT19EJJh719TOmh3D9p
 kXd4yzSwQEQxagQcGSmaKvJV02zCUMtUQV8iMi5z6SjGOlXYykxr79P4R
 Rz4PICge++bwaRSCvUTcJTmhcS68sHlGI2s2qcnszpqOn3n6t2XE2LE0q
 7seiuFPJAVRP8YW3DDP0DTEa9Emz5GOBi/eKNA9ONvY7NxjiFnHkKAkOn
 JAZWSMRws6kJOm6yqNLkzg8umJDVuTTyEVGdx94cmIA8twoZPHdP2Om3e w==;
X-CSE-ConnectionGUID: zELwsVUJRN+HrnWb1hAUag==
X-CSE-MsgGUID: UrDhbIHTQUu2x29hWYCCYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53468951"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53468951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:54 -0700
X-CSE-ConnectionGUID: NybeiJ0DQBSVsT4Eea/KNg==
X-CSE-MsgGUID: rTEOF4ySTQWk+sQkTmOddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156340778"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 12:07:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 12:07:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 12:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADXkzPaeiMJQSQm147Ild2+oP0FLrskE4viJfJRYX3reHgjxzgwW/ocCz6Dokupbn1phNZwHRUgNL3W/VnGxoketbynqb51kPcdIbek6R3G2pT5fJ5znlJwvIXNi6+5+zdPWgzkMaNNar0LdDJgMfpskEiN12enwSBuNuLYCaveI5M5UmcUTlh0yru5f1OZQj7ebS8/FwwmbpSJQUqlxxhBCjG5YPe6hM5JX4yOfjengE3EqtbWlXsz1Bki3KbI4XsV17ZDcZr5lqHbvCP1PQ+7atpnUnipODxRJWgfakvs0SDCZTaBWI05yKO+Q3zSR8JeBCBp1hkw88B51QJkBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN3sqnl3YuWx/ITOHh8LJMD3HRQGsE4F1FPYMT8JWwM=;
 b=R/qEMXXMX1exznnvGcB99udqH5g5X15csodkUcL4TVPwzXaPcp2vwd/U9QOZLBRNUdQlcLbgR0hXUJUFAJ/1O56MmVKLwUL1BRnUsNgq+ZVBpdGVUDN8zFb9HVmjDx7lL76y4dNZTroWjuQrOBw1KfSjD0yVoYXzvEoE5lfGweo4IFqIf+Rss0ajuMPQMFFm3RM1vUsEUTVnOm5Az6R/3B/yr2hLybRptHxsSz1rGokWbNMlNwiW6jjwZvGX7jEaXKBUFMFC8JHnhQ/jcHdPBDXXYiFy3u+JPYmB+4K/u3YxXVI6swWj9uxzh0BkeIxzW/bJ+8Ad89fBUc9DDI3u8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 19:07:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 19:07:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/guc: Move state change logger to helper
Thread-Topic: [PATCH 2/3] drm/xe/guc: Move state change logger to helper
Thread-Index: AQHb8Pinzao0culHXkmrzZUYdbPjk7QqJfcg
Date: Wed, 9 Jul 2025 19:07:18 +0000
Message-ID: <CH0PR11MB54444F9585C935AB2EE4B006E549A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
 <20250709174038.1876-3-michal.wajdeczko@intel.com>
In-Reply-To: <20250709174038.1876-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7685:EE_
x-ms-office365-filtering-correlation-id: d10e1316-269d-4859-c14e-08ddbf1bd4ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?omywsQADUCeu54UhI+4SDReaaE/8jd+6/jmK6qatcezQ80Y4g6UP623+g/y9?=
 =?us-ascii?Q?ujPTCnUbLe1MRvSao7UxOskjM6jlid/z4O+QPzxvidLRsBUSMY0mp7UBkv5n?=
 =?us-ascii?Q?Hh0DzyxRyMT2gG7FvSiqKbj3sWX8w74384YtSlqV+gCQNaj/AXtxnfdDmnu0?=
 =?us-ascii?Q?xoDoTF/kI6EjSkMFsMYQyS1jm1KmAoaX5E5Cq5CiFjN5480AIfn2UU8QskKR?=
 =?us-ascii?Q?lbEBNfkg+jzHxs5nJGm6ligmXXThEjv4ashgOq+LypJOEyhpHAYlqG1QIS2F?=
 =?us-ascii?Q?meiivl+0QnVh/bF6wfKWAdgonjs8Mebv00S7faoEM+v5KVcySBpL6t3E44Nj?=
 =?us-ascii?Q?tlv8CxPivZQyjsHLc9E2Sihb0sb+suWH2ME7HVMWp1MnzVKM0uqMy4xLcl0D?=
 =?us-ascii?Q?4/wEKkwLa+sE/txhgyRd33I/s2LZmXF6pxA9YS+ys1k6950Ubw+zX/+mvKxR?=
 =?us-ascii?Q?r41zZc2+h1Y0BEvPndDXKJ/itAWDjMS7AUNn/jqUlVRBe5NJgeGwHePj9i/j?=
 =?us-ascii?Q?hHtLesb6KhlZfNK/ngWqfjL5iDLwEJPSldWLA0rrj6Yo12zA8v0wTsBaZ7Dl?=
 =?us-ascii?Q?MbWftTA4fAIoSbZYw/rgFxYaOJdeEjMj4KbsvcOfoicoqadGDZNMTYQbNN/K?=
 =?us-ascii?Q?QKYJSpjhZhyh2QxnGBJgq37jdLT+febWWoa+M5JjPhSjXCqO2WKZgsOAXkyI?=
 =?us-ascii?Q?sxk8O3ZdmTdzpTYxuDA9bcqy0lAy/jrelRJ/LK/uH3JpBnVHmTy0WVW92aWq?=
 =?us-ascii?Q?s2Dnnlzuyzc9HIJinUDnh2sCkhYqyzEIotSOq56bcK2+dkqPaM5Zcd7FD+kA?=
 =?us-ascii?Q?Jw5lZU8nl0+WQotcuelUjib1mIoftlrCBmyNGEx8CsHNJNYX6TzHdPYbP4R0?=
 =?us-ascii?Q?ThkfZ9oYRxvaqLPOslKVr6xs4xTNowoAGVUTpu1GkUJPON3uZU24sa0DOIM/?=
 =?us-ascii?Q?5yUfVPakd+yFJKF/Vbmke47p1gX1y/xtoT33WqdmUNgxDBg3S17qikuygsG1?=
 =?us-ascii?Q?yMatQhF9pD5/kZ7qwY1ykglTe5KxtLG+WRtIWq2yJxBUSuqiSOFy96l4s1qF?=
 =?us-ascii?Q?kpCc0AYcIysSCD2qA9UgrAzg8UpLj9Brv5Aa/CvoJV9UKKeg98d/7ZH5RZ8u?=
 =?us-ascii?Q?fS+QDHaJimpabG+1I4uyui4ibdLCC1II27K4a84Sr54bKw0p+qZfx6zky+kq?=
 =?us-ascii?Q?buGOU0gccHarsegAiAY+UZITqBfrBg3mljvXjw+HAjyd7qRDQ+rv3d6ZXOVa?=
 =?us-ascii?Q?lmUwoaGdiuuG8mRPFlR/zSPVl1wjyiQk5fz0/BlKDyspqCwaquctDZJEngcI?=
 =?us-ascii?Q?TUcpLa3SC/BYb9qgozmQ6rTwa8C1FClDzWR/r5Wv2F228PXOmDk6UPF/yw2W?=
 =?us-ascii?Q?BNdgYC4ixYvlQ5BFkUJQysHxmgpaQt+C3pXLQMHn6eqb1AvFN+IeNbfu3bzn?=
 =?us-ascii?Q?jZmLLA5vxn9Ura+2j1gKp/v5AqbVvFGElHZxty2orT638/QGEmjbdQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mikzgkAidI6+L5nC9F2e+KMszsWC2QLXZ2wjD2B2G9T9niIFCymlumOBIwhc?=
 =?us-ascii?Q?YZxFcPdqr7o0qBerP1Mb3yeUJsIvi6rNoLsWmNzLPIOsdwXIgmyyAjrpT/tL?=
 =?us-ascii?Q?MBu3Bd9GQR0eXOGNY+QxLISBZcKZBj8ZX3P8nQ+5auWvLTR3mCqwR8q7njd8?=
 =?us-ascii?Q?ee8XcZILI9UXIgBit69k1wRkEdgr4HiPTje1TLW+/JUW2O0tJ2chQb3k2i/s?=
 =?us-ascii?Q?AagxfXkeq2K4JR6WX+6xJdyRQQlp5LNzN0Gmvn4cODxMNqaujo7/ITzfzYc3?=
 =?us-ascii?Q?/UJY5nZ8v51oIePGu108hymRjnB8Wn1XpJttjlMKUnihv6InNZoMtLq6GP7T?=
 =?us-ascii?Q?6Cnn/whQ5wmLP6oWgs8laY44j0DhiXumla+tIEEP5Kr6mB64yGpR/+dnTUvd?=
 =?us-ascii?Q?oO0eNcHA/4ldv+oTFEeWMDaY3MJNT79O1T4aeisqTWlBt8hWyccsp31W2UXP?=
 =?us-ascii?Q?yyfSNvf9jMRBPDTwxaqqKi6jJ9eSPy0jNKcDvmVdi9tQ/dHqKMZYg96kEne8?=
 =?us-ascii?Q?H1Nl5R3BvabICMyYhy0DiBqTQafqaTnSRLvN808OyvZAVvmJxPbahkt8gZy3?=
 =?us-ascii?Q?iehwxz6kQo9bW+Pc+IsOckAmwO8IlyM4IBNjZ7E+XJVPsle0cOeH9grI3uhR?=
 =?us-ascii?Q?D+tr29a3LiSepR780a+5h3YlZVdJC1MSUj2k7e/ka7E0OCblv/KmF/cudwwl?=
 =?us-ascii?Q?riL6yUOYWCMFhaEoM4+pVAddXMZy5HW3wa8fEe1ia61uDhYgWAizuL/VDFcW?=
 =?us-ascii?Q?85PzDsgsPW7VyA3TEk3apJGXhlHBPBnpCo8oT2C1LJJ/gJQbv/9EdciMeYBn?=
 =?us-ascii?Q?zCcGH4qj9NvWqLYeOTIEMjfv2sk17m0Q0Pn5wFIiEkJh6PhbDdxvAShgxnE8?=
 =?us-ascii?Q?Wp6mQqA6r/TmCdTD8SU9/wV3olquUzg0u4Wjpa3lBMrAZCWPa3fqd3K3X4Qh?=
 =?us-ascii?Q?FMAHdQBYt6LvSvXD0JdfyH4mKA7kMGx8kaOh2IZ3opPXTj3nKdAwjrgMZl6q?=
 =?us-ascii?Q?92RywMPDNdr/n1CBrMovNvu3nD9MIx3b0mTk3zUwLa//+R/Hr4mjh8cfL6k0?=
 =?us-ascii?Q?bRLjMuNgUeBxj082aca6p65olhFg7B4NmntC/jUlVZGmWsALhFunUyZJIKZh?=
 =?us-ascii?Q?n6PghsEVfhwIIYci3v3uVA+CVQTyIV6vZHLnIRy/p24yKHDpm0Ncowb3nMko?=
 =?us-ascii?Q?/9ly/uCEQax4xbpWId8TxS/6rGS4t77iQm64LFrjwQn9eK63Kb+dbQTzfOlf?=
 =?us-ascii?Q?tFdyxHigeASrviBIcZrmn3cbSJQi5FC8DJAN7bUNNpaSAS3GepyJLyUJ0HqQ?=
 =?us-ascii?Q?PFGFgtmhJqGrMQix36Z0r5EDhTpUDSi08WlcDwhK1fs1Ri/VYd1ww+yuiZQZ?=
 =?us-ascii?Q?KOM2kH5sHvUT8PiBGw495KSxwipbY3rMJco3J7nv/OYEkRlDEOCmmojKMvPF?=
 =?us-ascii?Q?krypSECAAGzcVwTK0GDHWQEb+4qRPeioev9eAlPmx7UfkEVVGTOcCX40Xy3/?=
 =?us-ascii?Q?RGuU8jlKwf5fnlSrsRpvhzYWDAwn3AIqi+wXOTVVnuFZTtqy3Itc5r5HsR4V?=
 =?us-ascii?Q?GGh4Es3K5j6LhWwGUjy3y9hqJP090UYhJmDJV4Di/aB/4L2/ayBhV7cJAchh?=
 =?us-ascii?Q?GFgtxHzwtreZelcJfNJz5w2MUGyagGkoJE5ap78gfdcs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10e1316-269d-4859-c14e-08ddbf1bd4ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 19:07:18.1935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFAVjp5o80EDhbJbzjTBG6YnB50+UA5Kg4xPhoZzRI7ctfnKjzfyBNCLgms82EEhTKZD+DgvvG/9W2pmQ8YvoKU6ZvWxWLXWxJhTwtM6Ogk=
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
Subject: [PATCH 2/3] drm/xe/guc: Move state change logger to helper
>=20
> In the state change helper we are already doing extra stuff,
> move debug state logger there to cover all state changes.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 2a052dc22ff2..17e5870baf33 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -387,6 +387,8 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct=
, bool enable)
>  static void guc_ct_change_state(struct xe_guc_ct *ct,
>  				enum xe_guc_ct_state state)
>  {
> +	struct xe_gt *gt =3D ct_to_gt(ct);
> +
>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> =20
> @@ -398,6 +400,10 @@ static void guc_ct_change_state(struct xe_guc_ct *ct=
,
>  	ct->g2h_outstanding =3D 0;
>  	ct->state =3D state;
> =20
> +	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> +		  state =3D=3D XE_GUC_CT_STATE_STOPPED ? "stopped" :
> +		  str_enabled_disabled(state =3D=3D XE_GUC_CT_STATE_ENABLED));
> +
>  	spin_unlock_irq(&ct->fast_lock);
> =20
>  	/*
> @@ -473,7 +479,6 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> =20
>  	smp_mb();
>  	wake_up_all(&ct->wq);
> -	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
> =20
>  	if (ct_needs_safe_mode(ct))
>  		ct_enter_safe_mode(ct);
> --=20
> 2.47.1
>=20
>=20
