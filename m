Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E32FD64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA8710E299;
	Fri,  8 Nov 2024 22:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zl/kwKfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2D110E299
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104871; x=1762640871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8xthP69gtmTJiJZBllX+iDMzdDQZAfhQ22+Z8wDvXJc=;
 b=Zl/kwKfz9SVTrFmJEwNGsRugZWswNnrajPh7SPG0LBGpYnI0SDqEGpP9
 kOAlQ7eS9Y92p5yhAIbeHr1OgIwAU9r8Fn7gg0gQRDTP6o70L5IYy6tIS
 mvrLrlniUfKlwDGvzqadKjBGIelQzhzuoKUnvrRZqauGlpX5q5QieNxrS
 sEk3W+CZ9ZQbGMyEjRPLhU/nkSnQv/5wJ2eoxVUxW6mthqXKP2T+5+s4W
 zZx6+yj2WTt13ETbQKMI0bwsFuNteOYG0EB5ev/RZZM9K0e2e+74p+NEx
 mYOuqZNPOvzlVwCAHKFerH5PwFrqYvb8Ph9SXOEDzSmQvMZa/cfK04+iB w==;
X-CSE-ConnectionGUID: jHP7/mnYSvqEIYRS7AM05A==
X-CSE-MsgGUID: I+ThRjujQLu10EaRRVa6yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41566781"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41566781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:27:51 -0800
X-CSE-ConnectionGUID: D9LcXl92Ss+COw0yqaENOA==
X-CSE-MsgGUID: M6JMVWK2Q1atNr/wKUO2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85900055"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:27:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:27:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPcVSJI2GYVjiVaoIPwUm0QBNpQMeHHT483ZinpbchCoJ8ucgJyw3mjt29GUqRFc8b97Jhz1Xai7OtZDv+mlIGTgituwLiElgOr+J5E0iMkuMnuqk2X+239azR8mugB+hWul/KCK+fs7qPHvy8LMEdFj3FbxJeQcu77V4M9aNsHd+ErOeUIs1JgrrpCq70+PLEXmSaJLRPUAzTSVHtuED3jPEHVaeTOX2wleqkNuEgtvDaWTFnX3uRWzvyvUuVcGS+CsTOd5GoXqKaICc8VC6pG9KWPdecTA7g/AcVSLwhO0Y7rPqRhnGYzK8Kd7c0zH9hQ+OCrexk63Gdbm3MF3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8awqRZSJOWVehYzyIwCmhM6vYbDQkD9p+k6Ui3WDlI=;
 b=GQ0NqgA3C3pT9pWQ6wZOYwLR+53jU2kHbJHxZgzN9urt22IbmTpWWzLUXJ+shmuL89Irwaq09+GtLDrx+nWK1Wq/QsouxhffdXhAOysoTOqi1ftYXxyukINphMEH212up7Y8K2EkSUzF6ijk5EJfdpudAY5kr21ofgRAlaX13uKXzxbjKwCZqVoUKBcaRvPscLSBj7Dl/FJYG8iyiUhtnkDdE/D5o9bkP7Qn67VOnaVevHHkbX5xuEYPA0phtnluEF9ajwJ7xMOft8h9o24RSCmcxOnoLdmKU93IHPmWSplTuCZWotb2NS1cspziM4cxOB8yHjv6wuO4FFZh44ErDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 22:27:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:27:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 7/7] drm/xe: Wire devcoredump to LR TDR
Thread-Topic: [PATCH 7/7] drm/xe: Wire devcoredump to LR TDR
Thread-Index: AQHbMgWu8aMYQcV6ukShEHV8frNwPbKt9W8A
Date: Fri, 8 Nov 2024 22:27:47 +0000
Message-ID: <CH0PR11MB54442A524F3DDF8FB0A464CFE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-8-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5279:EE_
x-ms-office365-filtering-correlation-id: eb0cc220-7459-4d90-ff07-08dd004492df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?A08UMqTrpUanQaD6LkW+l+TewHEeG2DGn+5LPZe+0BqswzWMFIEkTuYIaFqI?=
 =?us-ascii?Q?yEi0I9vuulOuzCkL82J3y815b0M6CHNlialODcucaCkCI8xHmG1JauGC7TJP?=
 =?us-ascii?Q?oz4gGpaBdp8QakCW3Nx7ph8ZJrIKkMZI1ffvhScgVfDsgk9XQH4n6m4k9j5P?=
 =?us-ascii?Q?e4u8Oftu1cI2OWbDCDz9hgu5+x7++wnk6AkUHNdTBtRPoW+YnLLh4zGDw9uO?=
 =?us-ascii?Q?nj1bOH/QllgPVA4Suw6Z6E7YcLc6DJPjPeBuZGv52OtQQOzRKdo22KCohDEJ?=
 =?us-ascii?Q?PX4KAHmxRGgIB3hYelz+2cjbaUlrb341yD+N0RWqSaXRVwaRL61vh0IpLIQn?=
 =?us-ascii?Q?Tk2lwqKlVb7jWvRid9PX6rfq5B//GHX336+o1iBisqn2xrzDZfVIBqwZWXHo?=
 =?us-ascii?Q?7d5yCyow0KwD8zU3pqrsDJq5T4wic8aO5Wng8zy3sB1HxOGN04I+d4dZ20ZI?=
 =?us-ascii?Q?Y4cWxwJ4J6szswCDMeChzi4+zjVlyVMxMQ1hIZcFuaL+he03TIPgLIPDmZC5?=
 =?us-ascii?Q?bgVDhCTijm0DItBHbK7PxZCyGvAojcF3m11qmtdW+nq1ctO2JzVs6vvJKMzu?=
 =?us-ascii?Q?sTk0E+L8LKZVtpO2QaWzyvqyaRdI71QsK8erIvQ9zmaTeVFJYf/DIDFqRxbV?=
 =?us-ascii?Q?cMVjpRzK+2Ns2nrSYnllroA8fj1ffMGFF8mQnz5t6FS1zU7h1EqJEVbh4Z5a?=
 =?us-ascii?Q?uTcv8Iu6JTaK4TmkPhL+L3re7a9rwUNAIvXDOCWjcLVnaUupgRTYXqzhpl5l?=
 =?us-ascii?Q?cOnVi1tjHTBvFKnCNtJXdzdaqx8mDc1BlJ5w6t41PZ664UCS3bSJQYofcK3V?=
 =?us-ascii?Q?6pW+erjQlkWfCxwaAMgS45hiVjgaAUfEMnGgDczxQ7hysKXLYFOW53mWF+b3?=
 =?us-ascii?Q?6f1Nd34feJaNoxMJYrFmr6P2z/6023M82mq6GhVUwUvzWmtGoV682HCQ6XoM?=
 =?us-ascii?Q?NpxuUFWja7nok7yoDu2oHYQicYNOcBzxTdxlvae3XIdtA5bMHm1OUvIzwIlv?=
 =?us-ascii?Q?1ha6iUZO9GTZPKHUzpXAOpJhCzZM3BskA0OzZegdOcam4BwHvD18DV5oo8Dp?=
 =?us-ascii?Q?jTVUqOti4zAMSvkJkc3IPtlt7IUKioxqkSmpardZal+/UDDWbq9XQ/r5+sdN?=
 =?us-ascii?Q?Tr97tCIf5jflIK287NGuGrx9Q5YfBR08slopcVKb1Sy4znhluzV4zJ+VB9Yi?=
 =?us-ascii?Q?BbZECnFctx7Ofh3PugoiD7ZtSk1XBBzI2i6GCdAxEl7G8mNN2ry+QoMvolxl?=
 =?us-ascii?Q?Diai9yvv73DXJ/C2F2uobgOZluW37sffXKh/f8rVbvcyaokodiTX3Ko6/s7P?=
 =?us-ascii?Q?nTFFIZgwNGnY7yaJCMSmX08Y9WkP5p3tSDvUmBRt1FfeYb37h87Jpn7rtPEF?=
 =?us-ascii?Q?/Lrtsxc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K9iWopr28NSRbFoOTswWCGPONLk66ta/nOvk1lYfeOAUmtEebJTBLdLuYxWl?=
 =?us-ascii?Q?WjBgMEBDgh8Q8UogEWJaxRzJXD/r2QsxETXQJR8kGcSoU2+oZ+GFxBup0QlZ?=
 =?us-ascii?Q?BDzAhH+QRuc9bu7wrX8qg9vw/kz5v3ZYhCEkgFMGutCCzRo6IJxhzFKVbwtn?=
 =?us-ascii?Q?p0vtQULFdPzhDiPrmxf9KRuXuC0fOgNYMEWWe7hJTtW/YAoKn72HVgTcaCda?=
 =?us-ascii?Q?GjLSyrlXga/QnSKVpe9cn/IEMTsvmAkOSrr0uoOXpwUIG73AzpbQcXVTb7dA?=
 =?us-ascii?Q?uXWhWw0ot+MVQi3nyXbdnXgm9n3AphOA/5M4CzuEME2N9619AobK4qZ9sLYa?=
 =?us-ascii?Q?YFqLwMCUoLBCpYhijBwpg5jl8woCHuivepevHFq0LBZjqF6VtXbTeoMWR4O6?=
 =?us-ascii?Q?Knm7v9k4FAo+BQhPh44Lrf9aHGNXoCdfmexgGQXs90mtLlFgfk1AeEj6Sm3K?=
 =?us-ascii?Q?m1/c95+hr78n4Q79/h2PVGWKnuf1azTUIRAXK+jGClfbI6lRTtd6gHK9C4i0?=
 =?us-ascii?Q?08mRQIpOUrntLrADQMzaCuCkX0vWvcOMzHBVGU7cvAmoLxtyEcuqD8ww+JMH?=
 =?us-ascii?Q?ZOnTTklnfagFY6cuDmB2SVRB3pN/j62Ly/rxa63UKkNPeUjEmXpj5S8hIbMW?=
 =?us-ascii?Q?MzDw9sD+BF990/wXke8iFGLYjTiy+plu0vRsR7qQY7CPzW15cuXK1KFdHV/r?=
 =?us-ascii?Q?gzhvHHWoifvwHkhYVmkrKOy33q4PBdS67xDPXHymcBGLw5+uv9tqEaPujP4P?=
 =?us-ascii?Q?k82+3oqSotciTfN5WMmj8ZJVbD024hg/XZ4cMPe2UFLMw1ui+rWHLOftU1y5?=
 =?us-ascii?Q?K3De4qKZNrZY87sd6sP2hvhRycvm53I2R/iijS44JhEUaAEoVirQXudBGsI4?=
 =?us-ascii?Q?um18GDeWIeDucie9HCo7jyVsjtj7FUlPFrWCED6vegwQdFjytHvjHiJwB7px?=
 =?us-ascii?Q?OHrlGENiKUS9z7ZVtFrhPqCAA5JuNf9pOUvmYgUVaAijxR4ifkhiFNqLO+gE?=
 =?us-ascii?Q?kBlpysZ9dfoSdYxcgyrx4GXQhRyaSXJHt0o+jaNaI/GoBGVu2ThqLjoOG7Ij?=
 =?us-ascii?Q?hDdF3Jzb8ALCaS/LmK7ZqiQ6tOBlcogZQprRd/1PCDhd7Pp6Bv/EgQvetCFj?=
 =?us-ascii?Q?jImhh/MWnRlsLL2X74WujckqmMB2RiXTCza30VKy+TgohKYCkZ8SxnRPwv5a?=
 =?us-ascii?Q?HINzemYTqmF7xC7eEqHeLudiCHKpeA8s7PmM3B8GcA7VFhPHkGZLlFL7Gr15?=
 =?us-ascii?Q?0JF2C3O+qc6RssKbwaIaQfCqjSjPsPoHYBoUni6dvn/WgUNFQofSN0L9xfoF?=
 =?us-ascii?Q?DQ10cFAsMNIaXnIFFfkRyLx7qv57Pc3EYmXMpVPe92Hc5QUr7V8sGoSHjqDf?=
 =?us-ascii?Q?UKSkJysbxm4MHjXedLjzwziBj7FrIjBdlKujImo0F1OB92uUfRXkbSuwI0Xv?=
 =?us-ascii?Q?1GJRSaMs330ntCTVou7t2RtdVDS6u2XklDfCnTnSSxz/bHEsVmYb33tVf9p1?=
 =?us-ascii?Q?1XKsV+LVFyB01haGTU/jxfzM4cpO0V3KuH9OUbZvwpfnGcrNiwOViPCMOMtd?=
 =?us-ascii?Q?fZNJ6inFDMOFDhcTHvPaxTi6ykA9p5G1ceF/aBNRJkhJo4wyQo3XNy1RQ/sf?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0cc220-7459-4d90-ff07-08dd004492df
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:27:47.7956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYujbxSPvzjDFZcB8dtNgMv3+gzXTQAUzeR0IOOZKvqG0ydSA+lKFgsOo7ZMCJS7k2S+M3XNmi5LOXz3DtjfLFOntw+bXxLYtYn+hUekV0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 7/7] drm/xe: Wire devcoredump to LR TDR
>=20
> LR queue's can hang, cause engine reset, or cause IOMMU CAT errors.
> Collect an error capture when this occurs.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

s/queue's/queues
Otherwise, LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 3df8543deec1..a52e56ea42df 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -901,6 +901,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_=
struct *w)
>  					 !exec_queue_pending_disable(q) ||
>  					 xe_guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> +			xe_devcoredump(q, NULL);
>  			drm_warn(&xe->drm, "Schedule disable failed to respond");
>  			xe_sched_submission_start(sched);
>  			xe_gt_reset_async(q->gt);
> @@ -908,6 +909,9 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_=
struct *w)
>  		}
>  	}
> =20
> +	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> +		xe_devcoredump(q, NULL);
> +
>  	xe_sched_submission_start(sched);
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
