Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB0D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 21:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EFC10E1DC;
	Fri,  8 Nov 2024 21:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOHBI9O4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ADC10E1DC
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731102644; x=1762638644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=khjPYGuVgxWUfuHkhqt6pexhM1Y8OKupAF7TkdwT570=;
 b=NOHBI9O4FtjngzJfPjV4Y6T0RVtwEeImvHlcrTqL5wW+HuTyGQH2OTxN
 ZlnuUyuSVajascDZMsX/Q3Lpzrz51xrmDz8O+kRg1fiVreS82P7e4An/U
 phRr7ZL5pRE7ttZDb2XOi0ShFchPZo0eqXFF+qnGN/9Hd0X4MqyWE7Puu
 DpxaQc4W/inOI4C0DzRdkHEDToNtgb4smI3RLkZkAT8Geac38xuBzab5Q
 Dfw22sRSfZ+XdyV3CRPNn2fBPwsRUzfO2gIWXlvtLYjH7ZYAq17NvNEdU
 VLtwJpuPy5eaYT99+T4eJ1DOEYbu9Oao+8AAXfvUMu9hCs48zbzNKY4sV w==;
X-CSE-ConnectionGUID: N6YpmOltQ4OnQ1svxV+4Ag==
X-CSE-MsgGUID: x1RK0KopTjuPhRtUwc/MwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56397959"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="56397959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 13:50:43 -0800
X-CSE-ConnectionGUID: cok8HsR/Rie1IXjDf8SklA==
X-CSE-MsgGUID: JpkFb0zOROicjdcFZzrYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90858874"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 13:50:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 13:50:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 13:50:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 13:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO7TR20InCLCjXFc6zERRYItIN5U2hiBuIJLliTvDGpCRvmWeQTMDVljHSusuejRKdH0PdobSpKFLk2DHnzNK2T2HktFb6WzDmEkX/auHNTsPtu+ylJ2NRr8TZZTi9of4aszNztrRFIFvkqh6jBAImWlQipjggrfZOh5tgLt4asX9/3M2AsfWYnA8+FMWJNqHet6DYCSbCcJo4osup0T45Q0+q32x602rkNdPTW4TFGn7umuygZA8Jq1GsbDWdEYBpsAzVuK8WMp/LLoel6PD8SQPHzEox817FBNWa2aYHaG4sUNeowsUQq1fW9Y8IZo/UAMNfJcQ7mrh1yAA1RcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+iS6QU4chLdWuohUerVfT7/8rOc6ok+Ny8WoYFZfkg=;
 b=v8kva/v0lg1dOowWQEiB4cHhJz9JRgNwh7GT9wBjXxo3EipB30k92PmfwOHQ3LFEUuZBp37DLjul156gcQl6WaRjWz91holCivEtfoZsXOnNOHserVFFjpHLWXbrv2GmtAbOmgpaMQOE5l0+XcOPpfnAnbgMb4siEGE5BC8R5LD2GCGJAXiaJLCTIJS54falc0y9YfmHihNX18Hkq52kQv5E2s0tVxXFQQ6LgcFcQuENG6cWEbPJ7XPFh2oia0Xhdz5OejnBx/dzngzQ+b1xuvzvT16gu+jm/v0WQFeI3eomeRK/+SR6VcqscEEs3t7NGgNWT9b6QAWnkuurdCnX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 21:50:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 21:50:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 0/2] drm/xe/guc: Handle crash notifications & drop default
 log verbosity
Thread-Topic: [PATCH 0/2] drm/xe/guc: Handle crash notifications & drop
 default log verbosity
Thread-Index: AQHbMiUYD4cHFxXB0E2/IAxzgTcLE7Kt6sGg
Date: Fri, 8 Nov 2024 21:50:37 +0000
Message-ID: <CH0PR11MB5444FA09CB7B73CB8BEB2BA3E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7542:EE_
x-ms-office365-filtering-correlation-id: df4b6f90-f4e3-4adc-a1e2-08dd003f618f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F7QUnfUzI3U5HuheYlq+uQobuwsv9FboMdph8eaByCHJ3Q/caWEF2aoaAori?=
 =?us-ascii?Q?3fOGo7jmWwk0FCUCZfPdhewyouL2BX02hzTnJ5VnAxYXpz/GvepPKaKP/Lq1?=
 =?us-ascii?Q?LwkXnVV9HAjXOM8SCRgQgAs7T7ToQdWZLoZ3q6yfHSvCLkOY1H+JFw9eWxyp?=
 =?us-ascii?Q?XB+sZZWrSXgmjNmiE9++BBvuNJt5LyE4n6t784bdzogQlqDFUQBYrUSScfQv?=
 =?us-ascii?Q?YDFd8G7V1IHtF92SJBx8nB8VQ5VeS8ZqywRi8cXcb2fGbI403fRy7nwsQ0ra?=
 =?us-ascii?Q?Hn/TN91RjsvG8QL4yjb5sFPs4RoiKUx8kCKb25/K+LO/URTXvcn9MqBwwL3E?=
 =?us-ascii?Q?twzQ4mbdATkHXhJJggnAwg/K+Wt50j/InrLy1b+bo/le/JRCH0T+2dZnh/29?=
 =?us-ascii?Q?jgBIv1rF6TZvcjMsWGp668vzyiY4Q3ycrOpNs2f6aRGy7hWCvQAtBxxs8hMB?=
 =?us-ascii?Q?qb+ouLghIG5ciAKJtUnW5YnVO1e+tBNbE/ZCgKzdQ2gWzOkXSM9QR+QCKQaG?=
 =?us-ascii?Q?+vtHxXpNaF9lcv2elbPchyp91wRDVfbZhegdXNlLAToKYJjPD2RhenYv9RXb?=
 =?us-ascii?Q?voafM72+Se9t+92QfqYr/VhLC59/Ozbaz1rzSFAW4hYxWZLl4iRGUnJe0B2M?=
 =?us-ascii?Q?hRAv3i6o1lULg6n/8x+EL4rnXQ5gkaLp+X4fDwf579qlPbR7cjrRQ7LvgUxA?=
 =?us-ascii?Q?oApFw6Zsw/twHxdGKlrEl9M/qf3ejZDOFwow/B4jXeRxQ83j1qOpU+MJVoAh?=
 =?us-ascii?Q?/82fmRhsxnwLRm155y6f6S2bjMyc2ufF5+BNPqcT9PWqYIdnmsOfB3KeFdGb?=
 =?us-ascii?Q?1kWxaTSYF+N4cHdKr5qlbnwQzPIhvxrSIVf4e/ywdaZcxyixc4D/obnxpI2E?=
 =?us-ascii?Q?+0ytaQdsNVJE3WS+UdATyPm4e+xbJ5KeJ+U+YteyOVes+FdHIAXxFqsriMmg?=
 =?us-ascii?Q?23N3hTLDIx325T3Hdbue/vnZBWDzk+QDkMQXnBalVOORF5TkN/l+YiByWYNP?=
 =?us-ascii?Q?td5zBX01Qy1uz0NSlYtTnm4/8aT5Bax7MP0cZjzWHBILN1Tpd2StFjYpkR30?=
 =?us-ascii?Q?ejlaQJkUE5NbGswgcz/PziGMLkt0TTbovEg3mJ3SiWQG1hYTAOv3z08gD59d?=
 =?us-ascii?Q?8NCc6XYZw+SsEx5jutoCZ+wyDsUb11rTbOf8G2qdWEggCoRhXfudeSX5jXH2?=
 =?us-ascii?Q?fbZg0tgHoAWbiGPUOFNGsxT6URXOYOT/w59NHJnhrbM9UQpb0mPD4D/9Buyf?=
 =?us-ascii?Q?WW9iOrTn6A6LvpuZyYpi7526yOtdZtlf2Dq2A3sy824Q0YCVt/6FqS7iOKLz?=
 =?us-ascii?Q?AcPaTA8+Io/gexu556sM+del43I0APOGkVYYmygzPTLn4wBmdxBg00+grVv9?=
 =?us-ascii?Q?wA+mls8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k45beHbgfOaCUf+teo5OCqKfW19SxlYn68JnfAdi+2IS2fX2Hw8twcmCjASY?=
 =?us-ascii?Q?RdBBUNbYYohp1UKf2YLAV1sGUIXxP52Rj3Q+m+uy2nLi4pvlea3B/sHRnUd0?=
 =?us-ascii?Q?LN+5MbJel47Kd4ONAvD5l0p3EHL3cKH7HgJ9QGIoXhiUzqG1aCBYVjo+ELDK?=
 =?us-ascii?Q?5dXKK3AgU8CpC5H+Pxw7bUPcWqDlZdLeTsKmUfAnzQ3aqFPA38LKEZDfz+7V?=
 =?us-ascii?Q?qDzu9sU8LWWt5liKti4Mz9QyM9XMJoEeKJMqkCM0QNBO5dDK/HCTcIvWv2AV?=
 =?us-ascii?Q?wx7OZ/wwovOXchVvmm+t6LwA0ENS5JgOXr3sjvO9h9rpjmt8kpBfoH4z+6xq?=
 =?us-ascii?Q?nL+MeaCZXGbIm1SHgK4mMCduro4xEsjN3mzXWZ63ws13SAKHUtrUDwvqc3VG?=
 =?us-ascii?Q?vGpZhiaPLTuWUuj4XNMGWZ6PdGE+3+3c+CQgnikjBK8A7JeWFU9zF5TjUV75?=
 =?us-ascii?Q?1lWAf8Spycba9Ng2Z+16WQ6+3Cy8u+9FsJvQZb3mXhxGJ21J7TSJArblXVzn?=
 =?us-ascii?Q?8FC6UtjoQDlELwL66dksMS4NCKcEU9UVZIQ09BWutiGyCx2dnC5r7eFSjXVg?=
 =?us-ascii?Q?kyRBicZl/3XYEfcCgHmlL5tZBRdjqqbVW5SgiTqTg8SEAN1LpVyxQIyIk0WQ?=
 =?us-ascii?Q?Fez32i4S7lF6UEr3TnGpuD24uMfPtMcs8cv6tu70HCkX4xeWOdwIfbzmbxqh?=
 =?us-ascii?Q?mzYpzaRHjMUI0UUu9yGVsIb/Aghye69WYYOpSL4j9Ds0HuODMUJWqmx/IRk5?=
 =?us-ascii?Q?qFeoV2FIIShouBIkWLgfQamYfSgPLQqg3NUOUB76wZAQR7pjywrTGK16qmHm?=
 =?us-ascii?Q?1sqBGDZ++Ck28VnUx+jhKOo05bDRl5VVUn1482rNCh/8eJvMymdsl4LIGGlv?=
 =?us-ascii?Q?/W+8KfRXcLafLJ+naidUluqkn9KX+Pyw26vQA0jBIKeTh7dBZmBhIQI7ejTc?=
 =?us-ascii?Q?5ciWAsq1gdphV8M5Ie38Ee60ms38oEVgCjot4pl/iKG2OWIX43SoD9QUmikV?=
 =?us-ascii?Q?WgkdBLSFdYjTFUd50UsQ+r+xBcncPCyhkyKs8Ttl6XuiO3UFW2Wl/MwpY6jt?=
 =?us-ascii?Q?Bz2atqkFVa4aLTWJ9mVLLkeAjwwOqjNvXNod7qSP+3TPpULbHHUs+6+u/Zsw?=
 =?us-ascii?Q?CO0qg+3F5RuXvoiYq65n3TSbva9U/HEJsvJPa5Ae50Ci9f9bfxdeCVjd0/XP?=
 =?us-ascii?Q?G60bEBXUkGh2JDOVGwlXFy84vAisPA15vFvxALpj/XwvEFO/NIZuGnpnisk3?=
 =?us-ascii?Q?xSo3PmcALIwI9cpe4dXTxEUOw91QVExGVK7NGnr260lthgqqn1Sxla55yuiW?=
 =?us-ascii?Q?BgUhDxsC6NGTGgH201L1t8C794RlZShy5y6ocSeNEUz6jXMVuk3iqkhXOgD/?=
 =?us-ascii?Q?APWpJIOiK7Y230FRzkDPZEYGsVpMADs5yY302wGJjsQHFt7mCYp1FydmJ0Tm?=
 =?us-ascii?Q?mEqeH3XBCL5N4K9x+j0vmtG70tFOMJjtRu3LQUOnt3SQ2VPZeR+QifJidMxy?=
 =?us-ascii?Q?5UqQJ5JxdIWrn03Tp+8oazXiqKhiVAWH5+TTAWb4NlG8iWd/ABCIRFh3ZF5N?=
 =?us-ascii?Q?ozOiEaTymb7r79IyEwzGI2nyzV+O/SQlak++oAMo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4b6f90-f4e3-4adc-a1e2-08dd003f618f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 21:50:37.5969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Jglxp9UqymQhnhYprrewrz7olDpl6+x+vTf6zE+TOL4A/5kGO1tDv72Z7Acbfyr9oaEj6zD6IPkX9BrRVLE9jOdJLbEEuErBo/44GYrEOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Friday, November 8, 2024 1:28 PM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Handle crash notifications & drop default =
log verbosity
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> If an internal error occurs in the GuC firmware, it can send a crash
> notification message to the KMD. So add support for handling that by
> dumping state and triggering a reset.
>=20
> Also, lower the default GuC log verbosity as max level is not
> generally required but is very verbose.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

I just read through both patches in this series and they seem to be above b=
oard,
though I must admit I'm surprised we didn't have a G2H message processor fo=
r
crash dump and exception notifications before this.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
RB applies to all patches in series.
-Jonathan Cavitt

>=20
>=20
> John Harrison (2):
>   drm/xe/guc: Reduce default GuC log verbosity
>   drm/xe/guc: Support crash dump notification from GuC
>=20
>  drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_module.c |  2 +-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.47.0
>=20
>=20
