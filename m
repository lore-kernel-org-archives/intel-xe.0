Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73125C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 10:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9110E5EE;
	Wed, 15 May 2024 10:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0L5sjKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F7210E5EE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715767879; x=1747303879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=d47Xqh2LZ9WLIrfTWG2f+elxfD+8XAMnAeJ6aDeQehQ=;
 b=Z0L5sjKw04kfviWH6/ZIzT2wFUe97EfE/O5Q3OozlT0NTAHhRQO9mTVa
 AwBe4d2bZvLShILTeemR6DPdi2jbGIcwj0t/VJBXEbGacPkmHsb/p7zDX
 XFYddaur7aQfwH31rYiDv9Jphipzo2dlMDXDNSjIEOJRBERogP+UVZOM/
 eCQj/h/3GxWGUwbpgx19n7ksDQWm0yhGs5k02ZTle0Ck1RZqL1sAh/vWs
 bcdLiHfXlZgjEAQPB7ePYWVpd0+LBa/y2d3j7HSJX17aKuCKGxVMHX02a
 XMz8uPu/cRnNK7vWuYr67vzjeJsPVAhWYYLwYoIKnF8ZDv2Qs16cciLlU g==;
X-CSE-ConnectionGUID: cKmbkPChS8yMPWFZfLsnbw==
X-CSE-MsgGUID: N2lz5r9GTWCar2paVbmGMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11978472"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11978472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 03:11:18 -0700
X-CSE-ConnectionGUID: 5KEl93c+QSS62hGPGSVc5A==
X-CSE-MsgGUID: acclt1oBSlGaRaUdnciDgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="62178522"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 03:11:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 03:11:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 03:11:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 03:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkYXUg4DkcgB7xsv2CEmS3r+HbEfkxSAQfZi8wf+9G4TX2kjZ4eq1pEHfrLL0SlEnhWp0Oa+iuhFmqY1ozB5GmGy4FHiuATFHvl15AErq1X2Nj7icDY0T+tPKoDAP5/5QcrqYrOTIp65shkfTJIiTA6EPack22O3eY2EHviFo0WgJHcqyZkkqZl7ckbsfmtR6IZvPbfgR3chpYdVRL5SVncfwWRIhvjNfRIPlZKh3lTYViVdC9lcXMTdqBVGDbGZuJbax3IphrqR9+rMwMIi4W2Nff2UzuL3EaHyVD+GmC7yjPWWQWOMgzuwD9UD2PnxRR4l3NlxeCDQ95tW3s2Ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClkDxJNE2Twk14dMrHwmDoCx6R0rW3heuF/j11SSs7o=;
 b=YW6Cmc1lgtfFZE3oQ5xvIqwBXYDZoObF5rofa6xxZkhzJWXhkxD+VnKg6fn8CER+nrKUcVVRvQ/p3uhlcEennW/Yjx39WSRmccAjc59CNFrjuTlHI+sG2cwT1qX87TWp9L782KOPyi7VOA91gsM64PV0AWR+EC9iHPoNpwOFqNYE7JZxlKRa3xwZRUv2+tgErAeJfZsOnfa1L17Alt+8061ATL0oq38ll133zpPKFBP4dtzQJb8/8kanJeRDLuoWbyrBxuM65ExPwRhnpjuIOXRYeTMbyOjZ7Nl5DWwsFT+droxu3CGosKcFc21AkGuilCZ3yuZFAmUWFj5ipp39/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 10:11:15 +0000
Received: from MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::18ff:958c:8bd:aed6]) by MW4PR11MB5821.namprd11.prod.outlook.com
 ([fe80::18ff:958c:8bd:aed6%4]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 10:11:15 +0000
From: "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Krzemien, Robert"
 <robert.krzemien@intel.com>
Subject: RE: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Thread-Topic: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Thread-Index: AQHakA2TBoJOMNQSy0ijgnch3ksPs7GYP5TQ
Date: Wed, 15 May 2024 10:11:15 +0000
Message-ID: <MW4PR11MB582131367DAFA7CEB0339BCEF5EC2@MW4PR11MB5821.namprd11.prod.outlook.com>
References: <20240416145037.7-1-francois.dugast@intel.com>
 <20240416145037.7-2-francois.dugast@intel.com>
In-Reply-To: <20240416145037.7-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5821:EE_|SJ0PR11MB6720:EE_
x-ms-office365-filtering-correlation-id: 5319db98-18ba-40fa-430a-08dc74c75af5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?RR/GJpUbTtVPa+4raFDT3Ap1sgE7KwX2GwsMiewB8Rkb1vnP1tti/Cb3MUBw?=
 =?us-ascii?Q?7NpPP/0GNM2cJsdQ7PHS7SebUADd4zy8xk9cfEhMSiqGh0ZIgNK+VTUjO4OK?=
 =?us-ascii?Q?+fYkKT6+DSd/JvgJE5MizzAQ4hCNNQe+AlXeYdkqMrmwEId8m64sNS/6RIkf?=
 =?us-ascii?Q?+a4RT17myEgpA+Y5uBZkgyxaScV4QxIHKqei2HU0cyauiUD3PRyiDW1q30bT?=
 =?us-ascii?Q?6v9UZIqHuNqRblu9AkrZM7Ls4wjseTuJCRINQMXoq/1JhKpRorG4cmUaSgAk?=
 =?us-ascii?Q?33b2MlgoII/nJ02DD/Nv7WfQhBs7LnGhu1Kgv9mOmlu2O5fxxjJTRBcwyLut?=
 =?us-ascii?Q?3xHj12Wrwjh4ZUt6/dgiW3YqhbwOMxTbQTvXM4Yx6R2irKR8AmTtwvpnjHLh?=
 =?us-ascii?Q?JnB53Igl8IPg0Y3MwcyAsP4dWmOZgw8VcO0ON5p2dITh1qJdkmEjq33/cu1v?=
 =?us-ascii?Q?uCaj9dNR7Xg+pd1tV6he7BcnzkAUa5mZrdd/r9UbQUdoTG53wvql1fUdgpIe?=
 =?us-ascii?Q?l1JWQ7CMO3VfwHMrM/90eLB/59jfk+MpK+b2kry344hRjXgj2AFSknvE65O9?=
 =?us-ascii?Q?O4xEFQlJwixZ2jit6DJ9iNAyu5MuWGPeNOuPGmieX2hQGEhnsvLERadWZOCU?=
 =?us-ascii?Q?l/poknHMuyu8ZakKhXbDDgrsgP92i9ZkbUx0DCgu5oVQRr8lJ2O05YhBl/IN?=
 =?us-ascii?Q?bm03lJcNKGFfnUJHRPlbZJSuWr88e++FIoZAAyK8eUdx0q2IIzZEwhsCDADC?=
 =?us-ascii?Q?TsHydPvDU93+unku28M+aOVAZWpRgVejIDTIR8C7eHDUw+em/CMAeuxx/rg1?=
 =?us-ascii?Q?Jtp8tapairKAMrBYtuR1uNMSettW85GVuGzSnvTEzbqksNgplPatoX8wQFbn?=
 =?us-ascii?Q?j8u9Q3g3DqYOsylmrLV79ClGL11SgxaF1eR33FyhjGbxHBdvQcUgvEnFSnrR?=
 =?us-ascii?Q?+eSiqRETw/YuNXXALjp4gAB414PAjfizrOAO7j/ag+YcT1LSqa/h7WOUgfJv?=
 =?us-ascii?Q?xX2dhaifS4AQEnEqqg0KWbsL8J3CozE4ipP+dzPICQPujwyE1QL8xVegrMBT?=
 =?us-ascii?Q?bGxoK7pl+DyAIsM2PY6WQt+FFS3gaG2s/Rpp/O8MDKk0fbVp31wbeQH4E+BQ?=
 =?us-ascii?Q?alPpDQVU+KpEjC1J19+VJmyoIK1WYFToVuH6MxkUw2OPr4NOX9J1ypEjha6X?=
 =?us-ascii?Q?Xu/dGI3qyvtsgtcl7baK1RnrnIGtQl6Xc8m5AT7RVchZowfPLOrhyAmiW+LT?=
 =?us-ascii?Q?tctnlFoO3U+tY7RBfNLiQXbDEKY6QBxQjkgct4Rf9w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yBfKZ+S0+152zqMsfRwUosH0y+N3coWkqCFH2lVs9/TBMtlKRaQ07yzHefA9?=
 =?us-ascii?Q?8ADPq+L3Scp+2+MVTgVG5YfVd4kbMQwy5C0YbLAPUstyOuZVzNw38BdnwX/6?=
 =?us-ascii?Q?WNabnJ1KgLJ1DBUG9gFA8cVLJSrykRLMIgzA44t6AphDo5S8CERAGxs7I0qr?=
 =?us-ascii?Q?KTIS/cr11F1bYFfDJ2oMJygfX8nHN1gtuQwAt+r/JJEBegre9s4YV98uFpAk?=
 =?us-ascii?Q?cx/8qusSyirKLbaJrLbXD4EXKI2FsKF+BzFLbSbQhARhjKcj4+CqqWkbglH+?=
 =?us-ascii?Q?8h7QfUWGqYkFPsZBhzONvDF/ZL1YszAR+Pw1Q0deMDV47hjmfZtFcUooPSo6?=
 =?us-ascii?Q?D3KvCTa5oafs5Nz3zzfdr2o7zjiFRwZM4wJeKE7LkS+yLoNeYyR9AR9O+E3J?=
 =?us-ascii?Q?sj3NgmNOYRqWKpwrFIQ5HEyJ3dO+wZiVn2pW/UZwVRGr9G9/zl+Rc09Mt+EY?=
 =?us-ascii?Q?6Nk3LNFPKXj6wJaXTwl+9USb+DpI3sxOGG69mH2J1TVVHDU/S2W0AUV3/5eH?=
 =?us-ascii?Q?oISR/sXXOlxDX+v6wsGeldeNez01kLwOAjk8Zz6Q+wty5wxngsIPi92SzCh/?=
 =?us-ascii?Q?CcXJeW7Zq+VffPb73OKktruEV3xfw5M7Uw4//89Y/IKLWWjGRwFcIAKYohrs?=
 =?us-ascii?Q?lVPCQj6sylE9X/INbs3OHrrU5g08AnRHazXhvij/4PxyyPlLNzgMK5RCwBXT?=
 =?us-ascii?Q?p+rEJoamWCucMeFcmbUq1JZUE6XFy/9XCzNfUcgLqIYKVzGdvGbcA4o8sCVA?=
 =?us-ascii?Q?ltZ20rXZwX4YE4oP6fYk3HURujRpgmg+CZkm8NJQOK+/jeB9sKz0QHcWv2vZ?=
 =?us-ascii?Q?dW0OJVQ5pMgizHVu5u9uijRLEJDl9ERM0VdHdBZxvFt3HV9ZR38D92DvApEl?=
 =?us-ascii?Q?vZhSO2vkYK2Y9bKUA6MPp/mvbBlyDlTA2YAzHDhSC4QUujxgmg3OY9flvH/M?=
 =?us-ascii?Q?SaHwjARLsgopqneay8IiRAcM5g2U1iJnuiKcEd0+dtocQ5vwZMAZXixlrIFH?=
 =?us-ascii?Q?TzhVkVXWR0PWL7BQkiYYJ+FoXpYDMDHleQ820gW/PC4gleMhZ+TCPyJmL90v?=
 =?us-ascii?Q?EqxjafclMwb4iWycRHdQRuz3qP0PZrD5HNg0mPHiCavXDGxY7DzVubUeAZfB?=
 =?us-ascii?Q?Nz+ZAOGD6IQtOBSZCuYDUKvIgnWh/52JkdS53FITrcqau/Ny7Z724rY9oQWa?=
 =?us-ascii?Q?ZknUgux85HQdu4pURlQl03RLYWOVnuMiFk1LVhwqJJY7DTgOOvAjhDPj0DS4?=
 =?us-ascii?Q?KYXhe3ifzg6I7zFp7EnIDZDF6hs+XjhooEBvzf76dOxTGFyqGqVfYJFI7kLW?=
 =?us-ascii?Q?9D7WwKK6PBpt434n21YnvJZUKDaDbi/BqMe/FOmjT+H1PXBoTSY7iaudIgkG?=
 =?us-ascii?Q?QJ0jTw9l5CF4gzTGo33IvLwIa1Ab09P3GZlq+Xb2ADGb6GA1zDF1nxo/PoXF?=
 =?us-ascii?Q?Bphp8Rpk8/T5YfWT53cGxPq7saJ3DR1At7CTRYYKGqgd6zbzk9TYeJy7+/n0?=
 =?us-ascii?Q?kopp2CVoZ4cN2N1tOQ+lmqHdZxQRWpHjn1N5yRPR4HCa53Yj4lbgjNQHupW5?=
 =?us-ascii?Q?8/EHV3+h5euxqYcdr0/Zs+efNx8Ah0X25vBVL/yWXJSonxxpwAys/Cfp169V?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5319db98-18ba-40fa-430a-08dc74c75af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 10:11:15.2697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGwXDAOsnF0qjACWEa3PGKSXhBzyZzK75JrsOePCjv+jTvhGtv8ZbKgN1fAJYREUh2YiwhqVFrFPxnMbs5/iHnSJxPFP83dVIhgLT9Pxtf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

The L3 bank mask is already generated and stored internally with the rest o=
f the GT topology. In user space, the compute runtime now needs this inform=
ation to be added to the device properties therefore the topology mask quer=
y is extended to provide a new mask which represents the L3 banks enabled o=
n the GT.

The changes in the compute runtime are ready and approved, see link below.

v2: Rewrite commit message and add a link to the compute
    runtime PR (Francois Dugast)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Link: https://github.com/intel/compute-runtime/pull/722
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 9 ++++++++-
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c =
index df407d73e5f5..6e0170bdae44 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -454,9 +454,10 @@ static int query_hwconfig(struct xe_device *xe,  stati=
c size_t calc_topo_query_size(struct xe_device *xe)  {
 	return xe->info.gt_count *
-		(3 * sizeof(struct drm_xe_query_topology_mask) +
+		(4 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));  }
 =

@@ -510,6 +511,12 @@ static int query_gt_topology(struct xe_device *xe,
 		if (err)
 			return err;
 =

+		topo.type =3D DRM_XE_TOPO_L3_BANK;
+		err =3D copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
+				sizeof(gt->fuse_topo.l3_bank_mask));
+		if (err)
+			return err;
+
 		topo.type =3D DRM_XE_TOPO_EU_PER_DSS;
 		err =3D copy_mask(&query_ptr, &topo,
 				gt->fuse_topo.eu_mask_per_dss,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index 14=
46c3bae515..d7b0903c22b2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -508,6 +508,7 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
  *    means 32 DSS are available for compute.
+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
@@ -520,6 +521,7 @@ struct drm_xe_query_topology_mask {
 =

 #define DRM_XE_TOPO_DSS_GEOMETRY	1
 #define DRM_XE_TOPO_DSS_COMPUTE		2
+#define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
 	/** @type: type of mask */
 	__u16 type;
--
2.34.1

Acked-by: Mateusz Jablonski <mateusz.jablonski@intel.com>

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

