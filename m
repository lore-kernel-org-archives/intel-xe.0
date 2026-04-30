Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71CEFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 12:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3010E156;
	Thu, 30 Apr 2026 12:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjidH/2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658A310E156
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777550914; x=1809086914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9m60bsnaQ514GVcAKpFcN5YKGAz6czUNKBW2ukNX6zM=;
 b=PjidH/2Rcpo52jOTzXbCO1f7g7138VBx16UhxGnalFO5oO/vmZGWlMAX
 fsBk+ShqqEci8fDAKKnYnb7beZRDef1wgMXeBLleF2iBu60iW0x2wXGsY
 +dC9UdZFjQiZQG6xC0m60sX4M1a0u3NTgy+UFV2WJeGxxdCtqtsXI3+eI
 YbZaQBBSvff3fBWMlpn9xoBZGztaCzHhYmyRwaf8Nhow7ebkLoBxF0LBi
 BDxOIyYtR1qlZV5pdSWQ1UFBOAtGaRBxH1f1I85U2zQqlHhNjPXcqQ1g3
 SPHGgaE/IO3Un5+kl+IInBwfbhY2qDLUrszsnT7ykts9JZL1JaA3vmV0Y w==;
X-CSE-ConnectionGUID: fInH3X1DT3Czo0ib8/WBsg==
X-CSE-MsgGUID: eD6dFNHSQKOCRhieYmhmQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78207925"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78207925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:08:34 -0700
X-CSE-ConnectionGUID: rVtGBRSsS56agtQZwNChyg==
X-CSE-MsgGUID: fL2oaaKmR0yfy27nV50oGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234605190"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:08:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:08:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 05:08:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyECn5zRYowkX1JKZNz8L9PHsCCXYP251DAuJERb31gk6d5/oK2lGax5gXRU6PAKHrMF9VG16Ahs4II/mgNxfFu2DHsIVJYDOXMhNd72hp7D+og/OyU/ONW8oC9vMNGU7+Y5Y6TZn72Os61np/z4tRDX0GeHVz1and48pY9uZS2gtA+yVTboNZEmsED8xXoT3/PAKE9RMoqy7lLHmxQTC4m5Bwy0fqEoZHLbdOlNDIYYmPsqH45VqIhDI/2M4t40Sq4hrDyJU81nqiTmiwa0l6hTlwyUZZRm752TGFkcQF7dV5SG7XiY4KCI30MDwZF5/e2m3b2+Vo2TeyuZCZ4giA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skWXPdcpEhlUF2V0+J7VCfJR6rIzWUAw1DLRQZATqAI=;
 b=n1zM9nlfuJ/v3C5rTL8FAXlCI3TyGCSL0yiU0AOYRAqN3GQWX4LtudV+ThQ284NjBGKp9tkoJIIGAjuigWELO8wnV2YDbqrvsElFh8qHaRHpTpSXd76QUjKQZBroRghjD4R2o3n2KBU4qG+igUXgqHKBAC6XZzSR3R+quJnNjz2m13agWuDAJDUcxLAhBto7DeAsicqG71TvUjbyK04hfy7DAqPQ2cRczt03UbsVqlWz80FjLYqiOBt1oFdws2lBa164GAFLDziyt+cImY1VrSatEByQp2l4TosLFQTPVFX6J6PVXLx5pb2o1sB7ZeoA7H6eTWhrvOat5ShhoXf9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 12:08:30 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 12:08:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V7 05/10] drm/xe: Extend BO purge to handle vram pages
 as well
Thread-Topic: [RFC PATCH V7 05/10] drm/xe: Extend BO purge to handle vram
 pages as well
Thread-Index: AQHczXXCwOoiPQOAAkmwUB81gjUQcLX3DF2AgACMGYA=
Date: Thu, 30 Apr 2026 12:08:29 +0000
Message-ID: <SN6PR11MB3232E2882CFE92BD29D3405181352@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-17-tejas.upadhyay@intel.com>
 <afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com>
In-Reply-To: <afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|CO1PR11MB5105:EE_
x-ms-office365-filtering-correlation-id: d05f0605-3386-431d-0c08-08dea6b13139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: f8p2ayVJsRxnhsTn0MQUpcvNGYubP0ZLd8P1WiFiTc8dBsrM/5qAuOd97QVQ7D1IOorfM3e9xD7UWjufDZv36SKduG6NbZWgvtmllqX8mrlZH2kPoDJseZk2DQGz/3JsLa2T5dpdtopQhTZw5BKbflgp5YzN5CR6qp/2bZbHDtcMgCzOZWXbKxPD7+8jlvlrLM7+tbpHBml8+Ej6y8cgw2Cd5bg1LUFg4cE+HeLm/SSmsS4+DoP/qb0dwhwzNK/bw4LBZeJ3npQRO1Utr30HJqUncif2NJYcen7yDuBKNrfhuqZ2wAZoGpySR9WDzCDXCKdovUW/5y2oIXL3WbX+sPGcdGeSk58Ok/o/Jd1Uwtxy9ghkEQhwALGrTmHAGYIAQuAAcjtkVdilT7YdHHavpZAFGjcpmnVq38zFB690c6aZffexvyD8Nd3MJDO2PIxssLEZbKtSt+vhCEJ8Xce3kfGS64mH6JjHLctesoDMWBjdG4+FhejtLJ/Hh56lW5arNwbBJ5EmS25gL/9+FGdRtlxwUnDWpzqYWqFYThB0slty3/Ye55XHbb++PHLOvg2dhKVFE0aAAR4RqOxgecXnuYkj0HiTxgsexOubRE+HrjEDqqnGxSfkEBoTxig6kPP+8KlgPQPK9jSaLk1aAvn/0WZmiYmxWAqDJRtEnxW9+uoQvpTs/KL1K9iE3L6C5XT8s+mejRwwlA26rJPbDNBsRgQKxwTwn6MQL/hsWnF2GWZrfoSQ7/O3QYIELeup8CMRjZ8pc3d34QJE2sGIprmr77HRP7S4YSJHtVN/588IEG0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aPYRbPO4geNgpF0SgEjHT68MtWNkRa5AGR11UPqN1W+O6W9gjOB6Uabc+QZQ?=
 =?us-ascii?Q?VCEtruTM4/kAQ0300OkyZHgP6GxSm1uj8WGXURQ0GzY40H2V1dyq2qP+bVNz?=
 =?us-ascii?Q?ha98C5/hd3HXHyDuFXMMNyK3EunhLfAkatTKwKukeCIk8AQm9Q7wTfL3Vliu?=
 =?us-ascii?Q?z8QtuQZj3cBhbhUrO9QVgY3cfQ+14ZG1wCigZ/aOPvPA87dYsVNkap0xio2H?=
 =?us-ascii?Q?L8PeOGNG72N9b7OrsNWcmhCnWW4PI0LUlYCMQMq/FA/pIdhgvXtbnXLkP3+a?=
 =?us-ascii?Q?IcZRrheSODmt5Bg+XhHcpCtdHFkwhx32ma5mf2uRwUkmiF8q+0PtxodaE4GZ?=
 =?us-ascii?Q?tYYQYWWUDqLwMOKlMwBBOsJSBEK3rRptv7Ni11gwNie4FOeu/wK0Waggeiwm?=
 =?us-ascii?Q?JzrjELDtRdNsMqMYtgHM0bNThiu0skFjYwVPHTnEuhCv/iJqn3HGjTuZYm/B?=
 =?us-ascii?Q?WLkAtifCUzg778oyyB668IG5oyKO8Ob8wRyLU1jOOLyMVwJohoeQSaB4PVnX?=
 =?us-ascii?Q?e4NQzheU30tOfMdmBUyQXnC47Y5w8nZclfROzvbbMvVssXDI3sUiKGmIKTer?=
 =?us-ascii?Q?me89qhOTabYpavvreMdVU/iRUB5Z0FM2+1uj/Buh19UvICK79lIa97xiHoYo?=
 =?us-ascii?Q?opblzlVXTENjzlZgLDdbz0x7/KzbwWjoxZrYoNYLijSZJ1x8W/n4zbCzjZLG?=
 =?us-ascii?Q?alKTrFBHstGLmM1mT1AoOVH7iV92ot8Jm5lHCSvd4u8bCEOV9DrGj/KbVmPs?=
 =?us-ascii?Q?0+F9wZhGbFckxP1jtQVv52Xml/YbtsGzvClS4Vpr1OcaGHLGvutM86Av5xcu?=
 =?us-ascii?Q?uXCCQ/1ksVrBwVJmAE0OVdxcE6g9bJe91w0b7uMmiVAdgPOjU1C6d5/cmUZG?=
 =?us-ascii?Q?Zq8SDzUFJCu7iTjLcCgrLaR+PNA3Uxf+Op8dNPEygby6shvJo9uM5qxq5Oiu?=
 =?us-ascii?Q?mkVy1LPFdHqrT7T/+Lo5G6ubHFbPMcFU+fWDygUKIf2Uk1FpwXWEF0+0PG5h?=
 =?us-ascii?Q?62uQ7B3A1hL4UbFZasx/MZf9cjivUvzz4kgD1KHOJHmGCRUNn/5ZHYwrI7T8?=
 =?us-ascii?Q?Dj6F+g8tj8DI19XhOgvBNJSgUYSX/+RseeUEccuT/jYUijLD3P+kZdqLXkdD?=
 =?us-ascii?Q?6N1a3Z6uFOHPG4d3f8PzyXXqsCWeaX2b1eKq9EJwD7zQrkS7XZFbPeiKAS/1?=
 =?us-ascii?Q?vGYS5uYOfq/fdFptNDyarl45pUjKZkSG2tJZdBiWCujvGkcFxh8wYMuVGBNY?=
 =?us-ascii?Q?/mxCICauyk4UiznIaHuCZkyTq7qAnAtzP+Vz+Txb5SWHJYfj1rJULdnMm/Im?=
 =?us-ascii?Q?cbZkG0zHMriEb/PrCg6YdJzaFkeSz12AfvDMjVAlkZJirg71u10LsY0qd9rF?=
 =?us-ascii?Q?fIfNwE6Xv60HmwY3ka9HxSvp76HftCwnMPY3DIjaoyLyNg5cECZrSJ4ST5IX?=
 =?us-ascii?Q?sYA7CB40cHRZAD9Qb159pJFykEHjMiWLNjPg9Zte7ud8f0iEAf5IwVyLwWPj?=
 =?us-ascii?Q?LlmkBPX3uMvV2CXXeZB9Od47GU+2KkgYgvIYlTT7FD58lJP3xQtjeZHeJ3m0?=
 =?us-ascii?Q?0DoBsB+8fE/5Wo1D5EnCCw7Pyl0Z1rgAUYS6zeyOeNevKa59Zdv8kn49TnFu?=
 =?us-ascii?Q?FXiL3qaYSmLBUzu0VPPUXNkRbcZ1Ky/yHI4HITpyl9rQB4DPOmC34ebQ0Bky?=
 =?us-ascii?Q?isZ8VFDHwH4FURQ5p/aQwiHUjWZeKAjHj6gY4oVXrNP60YsrlMKCZ2dpdO47?=
 =?us-ascii?Q?/WS9/lt9PLyGq5nYOGLmFxGEEKbbdL03tPVLdsVjCRkG2AA4v5+wecPHNBUX?=
x-ms-exchange-antispam-messagedata-1: I6f/RDJLGyKq6A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EMzBjXsWTzY0GW8XlQTcxgS8VLGzS6FNSvUDHkJe/49Z1EHaFzjj1PHckomQ5L14zR0HXZagiQBryS7V4vU1w0/Z44nS1jALcQ7RkbJFv5l8xPu+gZHMoYBiDFzwAB3FaB47Btx8qOLXOw/XF37+jHYkGVwwRv45GIx4UXs0Hd9ah5U0Zey88LvqizhdnySHuJoB4M/URIqAzUgq7EVlBRiAT5vBPLnorYTlKh4IRkoUi4yAw1HCLz+Q6xdRuEClOCCxKZVOLVc1MPBjePKQHsu+K4gBVcbannt33PkTsSjolGU1g/Cuo5f0x+iTHAaI9xgqXUm0HF8zwhS+cQ6RJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05f0605-3386-431d-0c08-08dea6b13139
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 12:08:29.8051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UeEPErbj3brqyYrvaN6A8Vz2jfzPXBSGtsxPmX7k/EDiYVOD3fp3HNVop56OLj8vhkgPOvDIZR2WhNhbb7at2jzPgeOGtknds3qZfTz5qGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 30 April 2026 09:14
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [RFC PATCH V7 05/10] drm/xe: Extend BO purge to handle vram
> pages as well
>=20
> On Thu, Apr 16, 2026 at 01:19:54PM +0530, Tejas Upadhyay wrote:
> > Recent driver update introduce support for purgeable buffer objects
> > (BOs), extending the API to include VRAM pages to better manage memory
> > pressure and enable memory offlining.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 5 +----
> >  drivers/gpu/drm/xe/xe_bo.h | 1 +
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5ce60d161e09..04d3b25c7c8e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
> >   *
> >   * Return: 0 on success, negative error code on failure
> >   */
> > -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> > ttm_operation_ctx *ctx)
> > +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> > +ttm_operation_ctx *ctx)
> >  {
> >  	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> >  	struct ttm_placement place =3D {};
> > @@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct
> > ttm_buffer_object *ttm_bo, struct ttm_operatio
> >
> >  	xe_bo_assert_held(bo);
> >
> > -	if (!ttm_bo->ttm)
> > -		return 0;
> > -
>=20
> I think blindly deleting this is fine but I'd run this by Arvind to make =
sure in
> normal purge flow this won't do anything bad but afiak in normal purge fl=
ows
> ttm_bo->ttm will never be NULL.

Thanks, I had communicated with Aravind before sending out this and we vali=
dated with discussion that there will never be ttm_bo->ttm NULL. Still I wi=
ll discuss with him again.

Tejas
>=20
> If not then adjust the existing call...
>=20
> @@ -978,7 +978,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>          * The move_notify callback will handle invalidation asynchronous=
ly.
>          */
>         if (evict && xe_bo_madv_is_dontneed(bo)) {
> -               ret =3D xe_ttm_bo_purge(ttm_bo, ctx);
> +               if (ttm_bo->ttm)
> +                       ret =3D xe_ttm_bo_purge(ttm_bo, ctx);
>                 if (ret)
>                         return ret;
>=20
> Matt
>=20
> >  	if (!xe_bo_madv_is_dontneed(bo))
> >  		return 0;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 68dea7d25a6b..9f55b3589caf 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {  long
> > xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *b=
o,
> >  		  const struct xe_bo_shrink_flags flags,
> >  		  unsigned long *scanned);
> > +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> > +ttm_operation_ctx *ctx);
> >
> >  /**
> >   * xe_bo_is_mem_type - Whether the bo currently resides in the given
> > --
> > 2.52.0
> >
