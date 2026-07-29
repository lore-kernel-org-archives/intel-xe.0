Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D21C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 11:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C852B10E4B4;
	Wed, 29 Jul 2026 11:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFltRr/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F404B10E053
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323151; x=1816859151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HFbbrXJspnEEqw+2L44R+AOtyTEFtsULGCxDxnYzmno=;
 b=HFltRr/4e9uVx/VhM/oo5f5QUBfWzn7vM5WUnChzMAFODciJrHnJQMOH
 vvwlVKg0M7/ghLenK9S5qKKJLk/HQfgt7xsVIPOdxXwuBU6qcuIM4qH8u
 R2kvZSKZLmWlgC05//v12yTYguPseE7RGjPQSCVukhLoFpoRdQoATwsBO
 3qgstSj5+EGdutUXvLhxVxTd1jEQTYvSyWFKxbsA5CpMBI95zn9GnJ5wx
 jjvSNtt4nPafoiUFYijosNNcmX1NpMVhckVTaaiCtFNjHtl5eosMr+7ok
 SUtrC6xBQquMIgD8hLNCegAnh/UTdi4gxOzL+8VJzoLPCUMDchdc2PHsw g==;
X-CSE-ConnectionGUID: zOBZ3syYR/emfVJEB9IIxA==
X-CSE-MsgGUID: FG9xQbgQTsebGXrMEnWUnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85939903"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85939903"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:05:50 -0700
X-CSE-ConnectionGUID: BxXOtvIUSg+6XpA/9Gh06A==
X-CSE-MsgGUID: BmZ7+KC0Rn+vgYQzuPwvHg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:05:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:05:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:05:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glgHAzfoheFLNcAVg6ULEd3PqnWlmtm5WRH3/uyFRiahohUOKnDTTtGEVJITl1jC6rJV3jWF4Amqb+Zr6qiW47ADneiLa7nVHET7KxhpF3g05VzV3ItL2QoWjiR9bFYSS/7iD4smkILxiwDOICF9Mn5P6bJJjb9kBdef0IwEtmlCE2Pi5nxDWoJgFdM1VnKXJLQiydEcpe0KkQGh1nEeI8Gd5ciWC1HR4avY0nyvJmkruNhC0/iPeECyZUkuI9I7NJCH8DdlHI6jnERF7FR5RLxTECCJGUNIYevLwWJfmKo+K31rKi3GifxZGfgK7hzKFse9cBBRpCMTvJzZrpzdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0LbUPWamZZcvf+zXhlfaYiahBccUV1M1SA45x7A1TI=;
 b=PVMK6vOxDM7QTazoPw76+Qm4ci5QJGGfi7bwCuRHlUjQ3E1eVf9CUdJinvbfrB8vLz+nJqFQRDFNsi2piKFyrWj1c7xnnOsTvo2PjJsWAZkndyqUTLU7g1ClmZ5ay1qoOq66rioceRGLd/qfF9bj18Y2E70PbxaIW4MKzVw5fQVw7sF+eULMC5bBURgD7P/vPsXAZjr8qWAXW38friZhLghihjLSqyJUes56vQ7NTb5Q116TBjOGL8oy6aVb8biDmCNlyjuL78gImBaT6LYPvwQFDsJCaPpY3HNLcMe8lp0omNcUkqiCWgUS6OKgGHkfuKv6ncvuK8K4ZxI2eqUH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 11:05:47 +0000
Received: from PH8PR11MB8106.namprd11.prod.outlook.com
 ([fe80::9499:1de3:9341:7d94]) by PH8PR11MB8106.namprd11.prod.outlook.com
 ([fe80::9499:1de3:9341:7d94%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:05:46 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe/guc: skip CLEANUP message when device is
 hot-unplugged
Thread-Topic: [PATCH] drm/xe/guc: skip CLEANUP message when device is
 hot-unplugged
Thread-Index: AQHdHqAV+otcgcMPZU62asTFYiDd87aDX+OAgACs+UA=
Date: Wed, 29 Jul 2026 11:05:46 +0000
Message-ID: <PH8PR11MB8106A62874BDB6A5AD3CCFD0D0CA2@PH8PR11MB8106.namprd11.prod.outlook.com>
References: <20260728152452.1129581-2-nitin.r.gote@intel.com>
 <amkPHS9Oj4Eqmbc/@gsse-cloud1.jf.intel.com>
In-Reply-To: <amkPHS9Oj4Eqmbc/@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8106:EE_|SJ0PR11MB4829:EE_
x-ms-office365-filtering-correlation-id: 5367687c-9cc7-4d56-570b-08deed615779
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Qmqg8eUGAHCjReN2NKI98ZCjsN+F+L37TPJ+NgEbuEFWyNY8yeQM/QyUUTHJNVqx+D/yzaf20/Gd/+yi6GyYBSF9cBsjSqFqdjsI+muWPbZIiI1OalNo2Bu4nq4Bud7ukyGm4an1wZKQ53viQeoQ0AxZpP8ziMhhLnVOkRSmm8JsJ0NqyYL9NSFAtsF63rlJz9BOW0cNHSfTWVBHHHCD8t0XG536tZtdo+Zp7k2BKVFmnxEJm1YTGOYFQirKLTT7OWl23Jp3xs17M2rgZaa5o7yRsUBHyWAeI+V/aBEFS8jDDhLXrxfPF67T3tDLTiGmu7MzTh8ceosTOSMV+ZaKX5Bhb6LVfFymZrLnCnu2kHT1DvbU5yyEYBjrJSGdOyQGx/VUu0QqkEovU1v+1byvWJiO8xr3G+W64OUA+u6jW8uaZ32iTdEsg+EtjiJEN1HCgZSt0ZDzJuf0vx9r6SBEehrVB5tYxK9OLbBZt3B5RhFhfSa+bFYE3733B7a+1MAmLIGFR7Yk6vuf8XYPSwWHu8NEaw7rhx76uD6XIxuxwMu9/NUm3VI67VSP9srMC3eEtkmAD9nka88K3bnmlUdv1TuvFV8x0KmwXs6JDNHkyA25ciEAqtoM8tQLrhfrQFFB0/JzrEFFcffbcV8YQqezcN/9rWS08SBstBr7ubxoYtg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8106.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zv0DoV3EYqu0RG3hCFTawViO+BySz+o2XkGu7NdBzBJrGwQ+qflzBGloRhwY?=
 =?us-ascii?Q?EeNdzbtcCcRkFIhAaM7c2AC9f75ma1za/geBGgjFDyieEAwk24QfjzxK724O?=
 =?us-ascii?Q?Bto3x1MKAtcp5AEL5PekTD3ahbdG98u5KA1xCa2euRJwqcyN8yq73vca7i3k?=
 =?us-ascii?Q?dHWLxxqbuaZAv7Mkx43F5DYEhnmmKZz1p3IsNTwqT1SDeKejwe/H9X5aPstB?=
 =?us-ascii?Q?Stv+/B5xygBFr01rUU6ceWanQoktN8IEVm4mDO6tKJ4sUeNj9Bv3bZeQGSgJ?=
 =?us-ascii?Q?tlaTk4kNdO2BFmTDNMH0Tv9mmVqPwC1lb2oqcsUzSBGqfiTR7iOwZa/oZ/VE?=
 =?us-ascii?Q?BYiyJGudt3kynLkGTYEVCvwWwZcel2Zo9O5+/cIZLc/pnkeBM++163SbaWgx?=
 =?us-ascii?Q?uYn8+EmmQWLfvpeUJFFZvthsfTDAiO3mduQQ/m41uTGvkgWUAdklAa5BUbqG?=
 =?us-ascii?Q?JecOw9qmx3LrgLl/m5IfnyAhCiz/DnEYawf364Jht7jn0cgpT2omUtkG8tFl?=
 =?us-ascii?Q?EncwCD6Ai4O+KmNmz783fUQn4fjbF99DoUoe2+NMekJgv3wvzQbGhMm8duYz?=
 =?us-ascii?Q?oSn4cDIlHLnqrnY2XHG3Arwbk9yZnuTpxo0ZokudqaJskzSIhoK0/cIOqswd?=
 =?us-ascii?Q?KWRKqd5FYelmZ01EK7FGe0vpGQCv6uxU2yF1Ne9jrVonkUOMcGVXVDD6nofc?=
 =?us-ascii?Q?fpVdj24ky+0uoywFA/727dVxyocRD30ih8NP3v7LP+l0V8gC0upG3ZNBEcpc?=
 =?us-ascii?Q?6n2YLrE3Z+faxYTYmlWywHDbE64yPko4xKJj+kaU1L2Xa5ZjcyiBeADgAM/o?=
 =?us-ascii?Q?EBV1FIjAvc+fkNFjqMe6XZEtsWRywW8NJA7/izB3Ju0nietaNhLd8ArCY5pr?=
 =?us-ascii?Q?PZYwKO68ctFgvvf6UZ36X1xOPyOqI6+QNaHqJ7yPPWEg+M5QgHlXpdxKq78Q?=
 =?us-ascii?Q?iI527/0yqS/JtViSl6letEGKFRYG/SgNYXnkd35RBeM0d7CkTMBwMxHcgmwz?=
 =?us-ascii?Q?jmXp52DXgqWMYfM4esPelXcoOv5A9fiOoUT+htm48HJ7gCruxcbBQaBDluDe?=
 =?us-ascii?Q?h+Ts1ykqNVKCbhwPWhcqVGFQdCTHsiBgXFbAnHXJ4GXlcTlDrAZgOWa7Yg2E?=
 =?us-ascii?Q?dT6ok4LD8GJ3SDlhuq4vZdAYxhfRo2ENNaTUA/6wj0x8hIexxMxqK3K6uKph?=
 =?us-ascii?Q?UkLxQHlljUbc3wHEYGNuFs66K7xQwwKwOhdypkie9BVvABG8FZDbktxDAmnI?=
 =?us-ascii?Q?bd4c1KtJAiErKaES/mZFwVaBzQbbmZHOL6UiYL1Qyd1MHs8cjGGHlxpBnflp?=
 =?us-ascii?Q?31be5542Dg+PK9NHDKSCyWAU0/GfySxCMfHVyaAiIlDTuGw9w3rZ+8p1AHVe?=
 =?us-ascii?Q?iDN/lHsfexne1FLzncpwpb1CnOrulnFkm7W/Q/vzB78traeEU29HCi285ulx?=
 =?us-ascii?Q?s8e1XAKL/6//7DHQc3Md5vIBHTk4po7Lf0zfDgPIW76JtE4YlRSljeebKFkR?=
 =?us-ascii?Q?A5amxj1J7QtVvt4d9Ugxhcg1N4NRe9UY63QB8yBX+tMsgTOW2oGXfI1b6GAm?=
 =?us-ascii?Q?H3jX/+GfKkwu7CnfwpZAsxto7K4u5ZfRCYlecO2mFKUGD2OdD8Sl873FtD0G?=
 =?us-ascii?Q?OhIrsZuVZhRwQYqUTCIiwLrEMEfs1qp+z0d/7fStVXUHzWgUbDfznpEHsNrr?=
 =?us-ascii?Q?4AR221XKsEMVD5mWcGMRY49Lu4TPeCzO0q/+JKUyfMxfc4jTPVqbo6hqyzyR?=
 =?us-ascii?Q?dvVLPJ9vlQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I8+jiqABoW4lwwXo7Xrp029Uk4AGbfn2ZReH7O1MoaW43E/Fb6sZ4UVK+o4UCgRouN8MxN4TIk2iJYze1/xyv9q3ZUK1SHStax3SoF04JTDGRei8g3TU9RrTroZTGOxhAcseZDl4PEz6CqBv6CtzKh1AYeV9wNmx06cxuLIxz1y8Gmq2N5S4YscEsVBZBxGFK38JW9qVDlhupz/48pWi5yitoi3zrWEIW/THKzv/K3sRgf0sPBJTxjJxlgce2V83u8cm3VO3+QIpjNA56boclvF4tqSDCsPIT3lrIfp2rqSma/UoE9Y4s0Hr8Faj0vPbwWHMVFuu+VpxKgh1k9FdqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8106.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5367687c-9cc7-4d56-570b-08deed615779
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 11:05:46.8106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3496xNixKPMtPCjcJ1KV6118HVyOCGnigHHG1nNkQr3gP5REWev8+DSrF0LiJF0sb78K60bRWIQto3aKQbLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, July 29, 2026 1:51 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com=
>
> Subject: Re: [PATCH] drm/xe/guc: skip CLEANUP message when device is hot-
> unplugged
>=20
> On Tue, Jul 28, 2026 at 08:54:53PM +0530, Nitin Gote wrote:
> > When a device is hot-unplugged while a DRM fd with active exec queues
> > is still open, the fd close path runs during process exit and calls
> > guc_exec_queue_destroy(). This queues a CLEANUP message via
> > guc_exec_queue_add_msg(), which internally calls
> > xe_pm_runtime_get_noresume().
> >
> > After hot-unplug, pm_runtime_disable() has already been called, so
> > xe_pm_runtime_get_noresume() warns with "Missing outer runtime PM
> > protection".
> >
> > GuC communication is no longer valid after unplug, so skip the CLEANUP
> > message and destroy the exec queue locally via __guc_exec_queue_destroy=
().
> >
> > Observed with new IGT core_hotunplug subtests:
> >
> >   igt@core_hotunplug@hotreplug-with-load
> >   igt@core_hotunplug@hotunplug-rescan-with-load
> >
> > Link: https://patchwork.freedesktop.org/series/166744/
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 8aaed4fd13ea..b5035c19d7b0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2131,12 +2131,15 @@ static bool guc_exec_queue_try_add_msg(struct
> xe_exec_queue *q,
> >  #define STATIC_MSG_RESUME	2
> >  static void guc_exec_queue_destroy(struct xe_exec_queue *q)  {
> > +	struct xe_guc *guc =3D exec_queue_to_guc(q);
> >  	struct xe_sched_msg *msg =3D q->guc->static_msgs +
> STATIC_MSG_CLEANUP;
> >
> > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> !exec_queue_wedged(q))
> > +	/* If the device has been hot-unplugged the GuC is already gone. */
> > +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> !exec_queue_wedged(q) &&
> > +	    !drm_dev_is_unplugged(&guc_to_xe(guc)->drm))
>=20
> Isn't there a TOCTOU here - immedaitely the value of drm_dev_is_unplugged=
 can
> change after the CLEANUP message is added?

Agreed, the drm_dev_is_unplugged() check in guc_exec_queue_destroy() is rac=
y since the device can be unplugged after the check.

For v2, I will drop the drm_dev_is_unplugged() check from guc_exec_queue_de=
stroy() and instead gate=20
the "Missing outer runtime PM protection" warning on !drm_dev_is_unplugged(=
) in xe_pm_runtime_get_noresume().
After hot-unplug, runtime PM has already been disabled, so pm_runtime_get_i=
f_in_use() failing is expected and does not indicate a
missing outer runtime PM guard.

>=20
> >  		guc_exec_queue_add_msg(q, msg, CLEANUP);
> >  	else
> > -		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> > +		__guc_exec_queue_destroy(guc, q);
>=20
> I think after merging [1] we should also aim to get rid of this bypass te=
ardown
> path and always add a CLEANUP message and within message processing eithe=
r
> send the H2G to initiatate teardown of the queue or kick the worker which=
 tears
> down the queue (i.e., the async worker is the only place where final queu=
e down
> can occur).
>

Regarding removing the wedged bypass and always routing through CLEANUP mes=
sage processing,
It seems the right direction to me. I'll look into that as a follow-up once=
 this fix lands.

Thank you,
Nitin

> Matt
>=20
> [1] https://patchwork.freedesktop.org/patch/740542/?series=3D168424&rev=
=3D10
>=20
> >  }
> >
> >  static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> > --
> > 2.50.1
> >
