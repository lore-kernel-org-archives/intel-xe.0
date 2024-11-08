Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCABD64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4E810E137;
	Fri,  8 Nov 2024 22:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJpYlCI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186210EA46
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731103541; x=1762639541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UiD8oBhJixuamYKCYQk5tXtNuNDLHtLSIPkznTdUJW0=;
 b=fJpYlCI+xZkThufBqtd1Duprc6anN0eDgAeHzx/GekTBrEKykDlA9J8a
 2wcOAnIKedtEUCqQmVDl2pnUDQjiEttmydq965N4TuAEPcJgDuD1cVf2H
 IdReCAYV94NAxcr8+vCe07P2T13x9KnW25T3EEYAsCu6i9789vcr9yhNl
 DooZYG+7N+fFqUpZPb6fayT67D9TtgiXn/Wpvpwpfn8XLwH5JPTyap4U1
 TP/u7QGOD0SaTxKSgATn4uq9SzGKN+1Hs93gTDu+dGvMQcy0xNyZqZHrV
 VWTHsBGOZ3WlMcNUt4Epc9wLg56TqmgQM1AABASzPIIsbG+WXWc/IUBYJ Q==;
X-CSE-ConnectionGUID: TIXLr4d4RjCp+d3L2gHXEA==
X-CSE-MsgGUID: EO7MhIdzTA2gbDykVic0Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42385421"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42385421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:05:40 -0800
X-CSE-ConnectionGUID: oVYdFYLJQRiiZ9DyL2UY9g==
X-CSE-MsgGUID: vc9mNBSvQ4KnWgrJZ51JiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85829783"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:05:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:05:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:05:40 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/uy6mtBdZw2O7uduGnfBLzfYqHulEHxmwO/KMXJjIHOVJ3zKvfPr3s9ZlGXvK6eIpoHhZaJimEDsNcd7YjLE8U6NHXeqP5CRMDko7nPk3edCTU/lFNdmoGXCC2Cx2IYnG/drf2SLQMqloqNSs8lccRZFd8AkcdhteEVaLT9zHlbvODsp9IeSHjzD0WkYCzUY3n3pt7Mg1nBe2nGu0beDrBv02FC1Rra7oUpSJf2ruA52DQjgS7p56kyG+LFVtqAOuLx2YPILoUcktoio9p+stPiO9G9t1hDeBG78koyzipDcpqf796C4B3nWhovwP8DBYYwov2viZI10g2QKnJEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzDyeGxVeiOdjH2BOFLGm7RVsVo7HwIlo9HHaWP7HMY=;
 b=f3/ExVGPlHqeul0jDyGdqIcuG4mwLo/2OJ0i/7rzyVIUnaLaVLwoXThaIgts3tn8r6OoZ7cUjzcQqzC6aDeXdI52YcbwR6LwsSEPR6YObDXP9p0nWY/McRJH9cCyuyaRLW5o/wZwUfgXdZwlrm+jgBgL6XcgNfBGDhpJNXQnsnMGDZmkY3joqnAS3aNfuXTXDwEqNDW/80WuJ+TSfeQjJNMxol71esnhDQMyCPkSSIDqyOoy9tLoOW67ef1oG1jm6noK1yeD6VtpwHHfRqE3w6F14Sm0P/zdjiBcfo0jUkXlO0DvT82h/LmbT8hrrg6mrGOkg2rj9LijAVwNO9kpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 22:05:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:05:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Topic: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Index: AQHbMgWw15n4plELRUKWR+L6KunWx7Kt7xmQ
Date: Fri, 8 Nov 2024 22:05:34 +0000
Message-ID: <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8590:EE_
x-ms-office365-filtering-correlation-id: 255d1847-0583-4b42-978e-08dd004177f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SXteut9aOiMuexhndpjEVdb/8gkJnF0kQlzZgYI8Ia62gyhLhixtT0pHL0aY?=
 =?us-ascii?Q?BxASdWICLXVzJ2jYOZrHz0xE8IoxFrMd7Yj9cHZykpiyrFP/UfIAlke6b4Sn?=
 =?us-ascii?Q?05x6+FmicvwObJcZM86RPodnF1/MZ+XzgAR0koSrGb8UO6cwlV9/+SK//WXZ?=
 =?us-ascii?Q?R99IfsZoKjoTi4TzP//gFnaYWJqGR7jfQNZpuB7wUrJzvhO/CJWXqXs0ZQoI?=
 =?us-ascii?Q?IlX4jONPylgG3FHc0yIk7Ju2A5awKXcZoIE9lbaJgzM3QFMWSUwgylXSYikm?=
 =?us-ascii?Q?tP8yVoC/n54VJV9R0yovhWWgeTXaTiCcl2+VZuPW52sAfnoi2fTJtebFHEXR?=
 =?us-ascii?Q?bQLPK4fsCGI9VzngLs60aqb0E6P/2dM9yc0IjCXk6KjvgrTWDeKMRe4S+HNR?=
 =?us-ascii?Q?SLAe3np9IL8DRAsXbuXJ1pN3PYdhMcyoptceSRQE2eZBtfWnGBGiBH2goHCm?=
 =?us-ascii?Q?kwyO4ljKE+LxDxQ4Hoh8m32ukFaad2mm3qGmhSUqadKEONteRjatK2zObgjs?=
 =?us-ascii?Q?sHbWJrV51veuNmrveZ2jj06M+KqSYWK8iFn3zHq3ENmcThJ+BQ4v4gJFhJRZ?=
 =?us-ascii?Q?ytSNBtyseYkX25Qvvn490O6jfBRDf/2Q41094iIPmV09e7bd/V1L/UM3G0Ha?=
 =?us-ascii?Q?qJKvqPnPDheDsV+D31jyi1FvoYhE0oYJBgGf4CRo7QpYm+9LiA0/M9VBMhDh?=
 =?us-ascii?Q?pi+6DEqR4dooFteWcWMEo0oSa9Rr/dnYVSaqRcvXKgsUfvS6yGgSoGtSEqcj?=
 =?us-ascii?Q?AJMjoXK3K+dnYf/HCiMo2Klk6EAHc9ojAg6DIjln96QOqNXnaSLrKuVIVtBN?=
 =?us-ascii?Q?CseFY7B/FK215Jtv+sWA6EGcSEPGYjrJ0x0ldF5jlEDrAJTkVesMX6CrRBjT?=
 =?us-ascii?Q?Qlya0hxO2zJMtxmcWG1XMnic+x/Eszo5FT74iHHUVHoIw4Ndk1/nYRADvRIu?=
 =?us-ascii?Q?rFeiIIMhgG9DUEVnSYT8JMQwiAKpVj6zZv4sX5D5T4jar98rZDpwz4yzX91E?=
 =?us-ascii?Q?GETYIoAh0IYiVn2Bfp6TpK7J1cEpuHuzgc9f+y7bzA3AJliod8eNZko3Paua?=
 =?us-ascii?Q?TcPEaAnkUxveV6s659HTKLbyLPsX+mSEwDw+/1jGDS2lVZDqShAm7gZngpun?=
 =?us-ascii?Q?hpgZyGjrgKUBnPR8LgjyrFm+YiQHZ3iWHLfwd9P5w7vJTTw0gQmrw/8ZCUjJ?=
 =?us-ascii?Q?M3rQ4E6PcKxSgwyHzB4QIgbj6PO66AhcSaE0kadWdvovgdpMhMsPzcDURtGR?=
 =?us-ascii?Q?ApSsnzG/98IxWgAo6ULXpPH8p3sP7a4hJj3B1iwx/6Et/K4ilDtfEI0WzAV7?=
 =?us-ascii?Q?FvYKH6TilBPLW28CyYhDAiJ0Dpu6HVVbh1aWD1C78OO5jQJd25Vt+HmsNdRK?=
 =?us-ascii?Q?PZ9KN2k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YfFKkoY3uCYYTRI56J6HaSjaRXWvXgYlfWsYBPZE68olxZTJ7DcZcClVt9Vp?=
 =?us-ascii?Q?1ecY/Yz6v4w86NZmngdICmLE2fdQec2OT5zOdGIvNfrMDrLzU6LVReMnU+cq?=
 =?us-ascii?Q?ynL8jWuupwkhCxPfhL05Dhh0ROcD54Y3xBWSLF/G0MRNMiAeQs0AbfUtAd5l?=
 =?us-ascii?Q?GjdgR2t9qitjOLWbxd1GM5kPWhYtBbpiI0ECSf/9TZWhhdN4L1b1/WWgey4X?=
 =?us-ascii?Q?uzfS8Yhb8RFHK2aeQws7qEFS0HZhXaUMDMZQ+KrO5BV43pPdg9UkpBln1NyW?=
 =?us-ascii?Q?IQUD1WuKWY3fiHR8S7ZY/gGuxTCkvsq292RIhLLs1NgJEDoIoZ4HUKxkdZqk?=
 =?us-ascii?Q?tY13fB7NoXzTovwu48HWfr8am982AqvjD+HqWF5Ka15qusg7Gk6k8mbzdGuO?=
 =?us-ascii?Q?rAdi2b+G3cb24ZTXd8UMH5bzwPqSgOCZ5CZmLXVSlnbl8YwBWUuniQRZjH1k?=
 =?us-ascii?Q?PTkygDy+N7jV0pfD/GHuZNfUjG+G+H/qzXJrfe0tOTtYfxzwWU23EM6ufoWr?=
 =?us-ascii?Q?DxacfuB7ilK18THS+FMwHpOLwOOei2Sz2VcqcKj+nZ52cR6kpdS3WQXB9DL2?=
 =?us-ascii?Q?W3UdeOEqpJXrPt5QKTA7MqNw4m7q9Xrz46lw1D3RfKn12A+LvrIQad7Y5Xqk?=
 =?us-ascii?Q?S6JZAHhrNuX6OcFjN5dfyc3vuoti+kvtNtAM6/1AqZis+LXpRH9VN+eVXvcD?=
 =?us-ascii?Q?uWpCyp9A5HdXc8vIQXA2RcswYPJnnFUakxprAomKpuedQ6FmWRcvya1bpWZk?=
 =?us-ascii?Q?RF5fnW090j6akQePkjBmedNT04M/MDdP5Xi1WuMdxnawxCAoyqWfImjwJdJk?=
 =?us-ascii?Q?kb7eVyYfnX81wwzw9H5+QEthPRY3/FSlALdNL5Lxc0BaxMYbracjmQBh85ue?=
 =?us-ascii?Q?ZgeSdCQIMeXg8U64HC6UxEIIwNiK0xuhX5F4h3ife2grJNVGn7Bdp6JiHVAw?=
 =?us-ascii?Q?wuqOUMRJF9RUQQxucAlCOEAFTtE8iwY55mVfG2XfyIC8gRzkGjSF45II0VO9?=
 =?us-ascii?Q?UOYO6edOfJcQSnIS6I/ozt+Eysfbhqnsm+lUj8LLLnIJLSzhMsVo5MjoeVb9?=
 =?us-ascii?Q?rLqrt1FhNOGMXhjwnK3icO9EX2y9b6yXgEwTcFE6DC5uH5iIRwocjFfN46cb?=
 =?us-ascii?Q?69Y3BOChBkqkPkxGoUtcyfWMk6WVrNK/PFlgiGyLWrU+iExA+FH9CNuLH+q3?=
 =?us-ascii?Q?A5WSDcjCINDapx+O3Ps35dlo3yBkxyANhlO1r9LejoZwoMYXgG0LeVML8rG+?=
 =?us-ascii?Q?mFaC9LOJCHy7DguSxn0fXXQ7gB9uddpMkfJjE8Kqbwi3FAJZCq5PJcvg4EnW?=
 =?us-ascii?Q?sBt8s/ppVaK1INv+M0PpgL9QI0cmZVZGsRSLwIYDmNIHnMC5kraKPY/g/kU4?=
 =?us-ascii?Q?GAEOn0DQlp+X8EGrUlW1L7bTS7GUN+DlB04CQYaRXvYcoBOZ6OqKcOElHHBN?=
 =?us-ascii?Q?jovp90hlYrj1+9n1JXuZqoOLOChUCMZBck+2J3e+zbIszFLtj/6dJL/wTwth?=
 =?us-ascii?Q?H6IU0DBoYDsSTe5usOAAj8zi5XJbdoalwYBv5h38WSqlmK38irJO6lSgIINC?=
 =?us-ascii?Q?Pn7bCTpnWeK6nY8uE/csV5N+CrOMP6cz1Ki4yVS0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255d1847-0583-4b42-978e-08dd004177f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:05:34.1303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujYZ3c3kfoaoFGKUOsMQGKpirfp43JA0pV2Bh6gNJYmXBVfcb7iyIcoJ55E1RjtJDEn070YBmNkXwA4vsFXznfIgFBDrTCthYeJGCoMCmtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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
Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>=20
> The ring is currently in LRC BO but this may change going forward.
> Include the ring address in the snapshot protecting again any future
> changes.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though the terminology we're using to describe the various ggtt addre=
sses
as "descriptors" is a bit confusing, even if it's consistent.  I wonder whe=
re that
terminology came from?
This is just a rhetorical question.  I'm not suggesting it be changed.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 3 +++
>  drivers/gpu/drm/xe/xe_lrc.h | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index e219657535cf..afb0f4f44748 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  		xe_vm_get(lrc->bo->vm);
> =20
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> +	snapshot->ring_desc =3D __xe_lrc_ring_ggtt_addr(lrc);
>  	snapshot->indirect_context_desc =3D xe_lrc_indirect_ring_ggtt_addr(lrc)=
;
>  	snapshot->head =3D xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal =3D lrc->ring.tail;
> @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *=
snapshot, struct drm_printer
>  		return;
> =20
>  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> +		   snapshot->ring_desc);
>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
>  		   snapshot->indirect_context_desc);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 9d64cedc4d14..a2058a501353 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
>  	unsigned long lrc_size, lrc_offset;
> =20
>  	u32 context_desc;
> +	u32 ring_desc;
>  	u32 indirect_context_desc;
>  	u32 head;
>  	struct {
> --=20
> 2.34.1
>=20
>=20
