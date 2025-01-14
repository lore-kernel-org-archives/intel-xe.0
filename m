Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB0EE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 19:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CBF89065;
	Tue, 14 Jan 2025 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTrEsvGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839CD10E381
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736882554; x=1768418554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PHDW9ohVTFS113Luwho8udVAfmrWiafiU5wBrNXk4Wk=;
 b=ZTrEsvGcCcOacqy556ECqWI4Ki9jDah1Xa7m9zICPFQKrXth60r+GH/g
 SKmykX2fjHtIdpBqBtrWcP6e/HFfVGMF+ckC6ekpIRJClBHQXtLRpkPuB
 FOo6yZ/bRfGwLrwmpD0bgm6gEgLqRxahftM0fK+fm/EZSh9Ctr1WRpVDU
 IynGMaRBL5l9T+z/mPhtaBrV5YLTL2qOI077tZreTH9mP5jdz4OyfXD/O
 1Upjl9PuFiRXPUjlEnIqibS3a7AGEwjZVavrtrCxP9tUeDpEcg0+y9bGU
 WT+zHXgZkX27dnaCGFRxPpgN6JwzxFKUTlr5v0xi2bfdgGJkOirAVsZnz g==;
X-CSE-ConnectionGUID: AVMJypbASRikrgIibiQY4g==
X-CSE-MsgGUID: 6n/mNVp2TeCgcM1TfR6vwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62566512"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="62566512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:22:33 -0800
X-CSE-ConnectionGUID: I0DE82BlQNmu57ajOH09HA==
X-CSE-MsgGUID: R4OayM+MRQaT/CIDpaUWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142168109"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 11:22:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 11:22:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 11:22:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 11:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6j8FaJ1zvuIkl8YZvZQYTLCcvvWFHTeQhKZHiYwAAdxlZZPNyfSaxXNpQe7CpuY3Qpog2X5oteVrs7+RNszHHpO67ieAmJumXiXtGFP0f6WRucg1cxUdLMJ9bSWWcWcinaGjMItllcfe4hQcB6m/Iwacn+ponxZWE47cbehvfwXyK0Dk65l4NclC6Zy7HidpFl9gECy+lEqWbO2CiqxoUxOD5IOp77/GvQW2mh2gw//21XU6mYG+OfN8QGvExU+nlGlDtFdpCcpOQpBQxieMeljhJEca0vW8J/4Rq4YKfBY+0ULecaEsZ+ZYrrsufHYabeMv2MyihpePlCoutDDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFnTHIcv8lKa0B02bflAOWRe+gbE6Sp7OMpcccT4GWg=;
 b=kCPdIxdiU15njMOyjbPtx0TmVNUNK09Lre9hvLTOSzrQyN6ijp+4UXAnBvqpY5Adk7txVuGj3FcvJV9V2fBc8RtOwSLHBJQ+hd5OUijl5Sq0Cs5DHv39TGh0AuyBcSEze3Wa9U6OR1R2OnD3nww913ReZyp6wuzWBDAeXVfytLj+uKE53cen1rPtVlCykxXqh5TPAcvtfPjWdLDNnMuaKVDLaPEmavzs23ohQsqOB4YhUJ2OSUd1vcOZPkdkVWokTX7lPo9dgCJejaCwFv4ERgzxjgYxklPiJGAR2kvplRU+ks4qQpmqo9fxOAnva7NlA2uL3Hauw6YuEwEGNqXnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 19:22:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 19:22:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Topic: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Index: AQHbZq5EKKef+MwvU0+YQk/6GGORcLMWnj9A
Date: Tue, 14 Jan 2025 19:22:25 +0000
Message-ID: <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW5PR11MB5882:EE_
x-ms-office365-filtering-correlation-id: 25a9738d-d17d-4ece-6614-08dd34d0c71d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GMbeNU/KbEN6YzFhmsR58Czoeixd/dgvavwr9R5vTP2sHPYHmpQz8wLfEqu1?=
 =?us-ascii?Q?5PHYu3q0DTSepov+hY7NTwVtg1xiTib9oieOax3/QPIYpMEYXjYC9L6AMjQI?=
 =?us-ascii?Q?Zwl6SGdzTKYzfB3pFLyJpkdttbWaHEZii2FdI/MPX9REBUro54MTZKUC1jno?=
 =?us-ascii?Q?sdfFdoDAzcrhjiAnxsGhNOWvb1Ld/r85z0alL2KYfNIVtrkvjxLJwyLOb08V?=
 =?us-ascii?Q?AORlyoZCVQ0CQjYmT1hYmo4YLNoXLcgWoojEZ0JTe57bmft3pq2gZaDqccoS?=
 =?us-ascii?Q?iZuVzn9oOqVm2oLoB8xkCqAuf4qF7BFYVrnniVtov93jlCWbnLf24PuBoNpT?=
 =?us-ascii?Q?PCZFlMsHKXm2+YunzE1rzBdkdhIrYjMRQHc2nQjb0O2cHIucxkm2cjM8xVWy?=
 =?us-ascii?Q?G4iCK+kJNfjwTJKmAD9v0UPu/sBlWtp+mJwCXaqR5gOJJclQfwibWYWhiveE?=
 =?us-ascii?Q?AUncMFsVp7MbEKHgnP/Fj2ReeV+pGgIXG0hTgPnfnOOPNJ4WYHBa1+hHp62l?=
 =?us-ascii?Q?9a/UQ5g5bG/zdNXK1vliYGqtdAhV/nBSX+mcfdLuI9iX7ipAIBsQXH9i7enZ?=
 =?us-ascii?Q?0Y+yLk5o5aYoSBbSOheDU3mxKc1fUIQyWGGP5ZtJvvVluSozQJf0bizuNWN0?=
 =?us-ascii?Q?MxeGOMX9kcGdZnYdWuXOI1fRe8V75Q49ee1sQYxqxquToIBRnfhS3OxvCEWb?=
 =?us-ascii?Q?Sjenosk/3vrFyIJ7OMtSNYo8k1/U7wF6mMIbgeDw1o2hyblsau7Sec9E6Ilb?=
 =?us-ascii?Q?y/SjkSzSr+buryJjEiNzQb5l5xDu4ECCxAwYHHheY+4P3bU9E34YYqCEtB+X?=
 =?us-ascii?Q?t4onXQmapzEnyi6JTSKI9r/9dsFAHzEW8VFYXXWxA/wOopeC8k9Qx/UocoDa?=
 =?us-ascii?Q?2afblNpegLbG3/EOkUGeRKd1wWqgHh5hwANLbSVNJQpC8EEoKr5fve/7XpRS?=
 =?us-ascii?Q?JU5Orrb5WiJR4No5Ea9Quc5h4uFlR8iDPqv3yH9zg+WuNBJ3JDvkyOyr7FR6?=
 =?us-ascii?Q?8mq+kupvrWbGITDxmYwjeiFvyYakK0r0VlgGZLgp+q3DqpaMaUNAlffulhOj?=
 =?us-ascii?Q?Ou1Mo88RDKgCZVX3kK60BV3SN9E374wrbieJlBaCvSo45pk7pVZGUm5uaUrF?=
 =?us-ascii?Q?axfSz8gqo7QW/tLZDP72IMrP9L9G2I3CgwtNjyx6teQ1WOVAoe/X7gFeTmlL?=
 =?us-ascii?Q?zIvp5k5XZfYxO4cmyXxK2QjmLA1yGHOWB7Vd9kWd/wTYDBGGaJbDIK4WbOwm?=
 =?us-ascii?Q?AdQZhSSZIVQnoM6mK/FFyU50mfeLNPZew2dewJz8x60oC+8MhMmVKYZu3Xx/?=
 =?us-ascii?Q?d5ZPXCK/17wGEkJRfc6O/NZJqdPypbnm3RrIHerLe1e5zbZoJFP8l1IZEPuf?=
 =?us-ascii?Q?RoNmiltrhIqYfYL/im6T7Obg3X2iALZlMuMS1JjT+Gqu3JEXsKrirui745Ct?=
 =?us-ascii?Q?VR6MvDjpiydsVjzquNofbDqU2kUiwutH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o/lmjNFIuqxFnSKfdVoiTW2jBO5FtrNSrQhr+6ezrAlPqjyiGLH+Zdxg0KiH?=
 =?us-ascii?Q?xsy/34IIs0q440yiZ5YZ5legJ10rSqVYCwazRPH06u0d8CGcRkFPK3l7QXae?=
 =?us-ascii?Q?ugc148BHqVUtszY7Fm+DdlMjs/U2iyRBzhZS5bN5VeqkJSRSTZxSxrvjDLMF?=
 =?us-ascii?Q?HGXEhvdTnTosAQq779ZTUTc7fXKwuHHVHt1XT9RaVaRMIWlUgfRlfy4uuMx2?=
 =?us-ascii?Q?bATzjSGKhy+7xNeBPWYiQ+gHj2LMw09AO577NZRiBCnVkNYg4G60SJcGVNhL?=
 =?us-ascii?Q?q9HpgylnwCRg5jthYsHtnTBvWSKfVIpy4O5z5AMcNwlx9GlRgW9PWy3EsWkm?=
 =?us-ascii?Q?nfsUTPYqGIfroaIDT6P/OAJjP3WsFPOgHtkVlAXNJTZDaeYbPAQs+Z9lWvV/?=
 =?us-ascii?Q?s17enNxI+f6qNKHPdAIdhAiFzYOONbrmYYTx+olIeGqy1BEl8QQVuKqRDCUx?=
 =?us-ascii?Q?domWs8uaTBH/lp+gI5x7iu4Sdp6KKRTrALUvHAY1k7PhSIVjMPwcdPSsMahH?=
 =?us-ascii?Q?QyEuDHYIGO8dg0gUrVwMERS5/HJ0luV8IHbsu3nrXaaDhuky2SVaXOv/8KOg?=
 =?us-ascii?Q?WX9X0hSyVFK/L1vY7WfesGKLq4S1TBeToXND9+2OW4o0IJm2IqyqpIfoEiYv?=
 =?us-ascii?Q?9xvD1qJKyL1UeiNtTQTVcTaxeZON2/mCKK0kFc8JxYXGNfH2f/62BcwGpt0m?=
 =?us-ascii?Q?VEY8m2LrDWJ6hi6SFfhKJ/AIIijs+ZzrbSay6y37ivCKS5TAk5PcFCr4PY0R?=
 =?us-ascii?Q?71tAqehCcp+Cmms77ZZn/s+scF2xYanoiVhVBBzM0xcQywUEKlPEUYW/6+te?=
 =?us-ascii?Q?C7bh2ovwbdWfWbKk21Lihgaa1/2KgYEKhlXS3eP6YdjX/GblJ3kZ9PYFueLi?=
 =?us-ascii?Q?0580oU9r/eAlUDCNbDFWXT+ZvAiZJ3xJSuyCSnsWBcpfQGplaCNBYNV1Yw/t?=
 =?us-ascii?Q?VjDIUfhK1MjqEoZplqkN9Ozc8j/Fn+j7Nd7YrhRNLbHHSh70d20PPtrQER9H?=
 =?us-ascii?Q?IWQgW4ToOHWM3x/WfbmyvbXuG2WR+JQmpCDImvzNZuWiB7qcjzQFHyvMBmE7?=
 =?us-ascii?Q?N7XJk0A0m/JsYUE1o5iusimyuSLXBNNjUBaeel4jO5gfjUykynWYRd84/ZWi?=
 =?us-ascii?Q?6OPY7mAvjn5E977Bj7/agxUIpmQJzcm4aYPtwGw58z7+hBI9x62twkEjjFQk?=
 =?us-ascii?Q?XLcLD4Co3yoeshmteBVT7c8qqMCPWwXUZ72+32QtG2zaSZshOfl4PcU5Wx+o?=
 =?us-ascii?Q?nmdfkVCSNa2fkMTQVt5WFVFgtUt76Xw9KHuu/t7e2QY+x9Zxaz97UYxc2Xlu?=
 =?us-ascii?Q?bKqRIx/Mj+RrfM3M4WM18SDURjCCKe8qXDlTH/npDTjVUFe4jlvmxyF3usgK?=
 =?us-ascii?Q?UWrpUR/+3hT3WuQkAoxNy5Bljfv6GWG7GYhDU1iDotVlB6IOcYOuuZ5j/6qA?=
 =?us-ascii?Q?wZOG72TU9kQGfAFU35WLXmAGwGRrvu8nQFjtbRp/PNaMWGtAWQFKRz+RFaUm?=
 =?us-ascii?Q?IxSoe3w2wLihxKhFqEDpJy/xMGn7k03S2X5Rqv4THiQkSHOPu+gQfGckain7?=
 =?us-ascii?Q?KaPABwJ9eELyniVc7vnL9J8gza2X9CvMDAprZfXJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a9738d-d17d-4ece-6614-08dd34d0c71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 19:22:25.4296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mabcHn3imf7lSZWgCcyFETnX8eC44u/mZBrVkwqF3WRQt6bDUWNKkTbQ4k6f0zBROBlQI58fkKBGW4iu52IEtmvnoTgbIGy5JVadm2FoA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-P=
ekka Heikkila
Sent: Tuesday, January 14, 2025 10:04 AM
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
>=20
> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
> This also fixes bug where dpt could have been allocated from system
> memory when on dgfx.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>  1 file changed, 43 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 9fa51b84737c..c28885316986 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map =
*map, u32 *dpt_ofs,
>  	*dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
>  }
> =20
> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
> +				     struct xe_tile *tile0, u64 size,
> +				     u64 physical_alignment)
> +{
> +	struct xe_bo *dpt;
> +
> +	/*
> +	 * If DGFX: try VRAM0 only
> +	 */
> +	if (IS_DGFX(xe)) {
> +		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +						      size, ~0ull,
> +						      ttm_bo_type_kernel,
> +						      XE_BO_FLAG_VRAM0 |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_PAGETABLE,
> +						      physical_alignment);
> +	} else {
> +		/*
> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
> +		 */
> +		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +						      size, ~0ull,
> +						      ttm_bo_type_kernel,
> +						      XE_BO_FLAG_STOLEN |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_PAGETABLE,
> +						      physical_alignment);
> +		if (IS_ERR(dpt)) {
> +			dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> +							      size, ~0ull,
> +							      ttm_bo_type_kernel,
> +							      XE_BO_FLAG_SYSTEM |
> +							      XE_BO_FLAG_GGTT |
> +							      XE_BO_FLAG_PAGETABLE,
> +							      physical_alignment);
> +		}
> +	}
> +	return dpt;

We might be able to collapse some of this logic by storing the flags separa=
tely:

"""
static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
				     struct xe_tile *tile0, u64 size,
				     u64 physical_alignment)
{
	struct xe_bo *dpt;
	u32 base_flags =3D XE_BO_FLAG_GGTT | XE_BO_FLAG_PAGETABLE;
	u32 flags =3D base_flags;

	/*
	 * If DGFX: try VRAM0.
	 * If IGFX: try STOLEN.
	 */
	flags |=3D IS_DGFX(xe) ? XE_BO_FLAG_VRAM0 : XE_BO_FLAG_STOLEN;

	dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL, size,
					      ~0ull, ttm_bo_type_kernel,
					      flags, physical_alignment);

	/*
	 * For IGFX, we first try STOLEN, and on a failure we try SYSTEM.
	 * DGFX should only attempt VRAM0
	 */
	if (IS_DGFX(xe) && IS_ERR(dpt))
		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
						      size, ~0ull,
						      ttm_bo_type_kernel,
						      base_flags |
						      XE_BO_FLAG_SYSTEM,
						      physical_alignment);
	return dpt;
}
"""
This isn't a particularly necessary compression, but it might be worth cons=
idering.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +}
> +
>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  			       const struct i915_gtt_view *view,
>  			       struct i915_vma *vma,
> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_fra=
mebuffer *fb,
>  		dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>  				 XE_PAGE_SIZE);
> =20
> -	if (IS_DGFX(xe))
> -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> -	else
> -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> -	if (IS_ERR(dpt))
> -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> +	dpt =3D xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
> +
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
> =20
> --=20
> 2.45.2
>=20
>=20
