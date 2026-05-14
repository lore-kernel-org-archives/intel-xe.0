Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40452CD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 16:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD08D10E3BE;
	Thu, 14 May 2026 16:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0jbsJTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B896910E3BE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778776946; x=1810312946;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6qvStt7oGSStpp1YO6xu//a3y70u72ElWV5mcQoVsY4=;
 b=h0jbsJTKZ/d3g3Js5h6nvE561ouvdOcHw5Q2vXj8IYbOjb9QnJOV1/0/
 1ZmQKIVilrYBnN+I48el+bouUGgZaHRmWQkmv/w3bBskvpFkBgvOxlxYN
 WNGVahgLfymbCuf3WVFvbsHJ0Bd+pBZMUCDvYu8TpMHse+q2psPY80rIX
 f3eYraPatVQQ20YzGzYD3L/5d2/eDa/t7X2ZgC38dSguxHq72VoYZnMN0
 QEQ45EAXbBko+GIwHQAk+dY8l1CQiLldvXy33EgjLDuQcyLyXIN1iHMLP
 1aA26G5yg4T48o40g6Dgv5dbad/OLiNZbRSV/BoEFJzyMRUX6OLgeYG47 Q==;
X-CSE-ConnectionGUID: 7/i+xnyPTbuSnHy+9mTYjA==
X-CSE-MsgGUID: 0b2egrZ6SlulbTHZMS0+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82293502"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="82293502"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:42:25 -0700
X-CSE-ConnectionGUID: PPDNaJB1TuKrmvJHwqw42w==
X-CSE-MsgGUID: 53K3BqFJSQylHe8D96rORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="234151633"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:42:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 09:42:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 09:42:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 09:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIxMjP8Wc8Gjc/UOpinnn0944M74Uiw/ZuUciN5299zGdvHn5zZ/dDYRrBYeJksU+va2pBR1LWb5mCvfQ1yHMymfXsMoQiUnPJMKNdFUMky3q/aGoW4MTC7j1K8cXSX2Zys9Pdiz8vDRKiV6/vBZ0ij/BJrToWdR524WezWQuG3QY2a/ETKiyaZ55/D8gtx2z4pNYy2gIezJVKugsIW8AkM/yYBQTBCRK4vhtP7LkKXufQOHTXAkm8thfeJRTsWYgXX0qFeW7Z5h8RuLK8DjRdsUOKSv5+7yYqJovECSNHMF9c2UMR8kLgw/FIJ0pb6prHyah6fY43Uobe7KwoVu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5ad7ReFoBlxkuTg4bAtMEP37k47xwsXLgDKzz1tRaE=;
 b=Epe7Y4grWOWzvaDBuuGTaSkKIgljCP0eLgwcTN6TDoN0F1J6tyHfwT7cxaWoxWB9dUdBoDFLYAUDpVOVuKvqDO6uJbQp+lQXWTop3EkyF7RAZiVQ6RChQZ4Qv3/K9CkNGI3usgBUe3clp55Zg4Xz+HXTR3d19vSd2gvwbLGIzqItKoOktewHeeRrzvlSgPoo5/WRYGBGtjpRmavdYDnuxZsRiJVUfaH4oEEti5h1l35qTW4+NUIzleRMwAa9EpHvWZNlQzS9o1/tNeQNlNNEFgHX6CfN+m2Hyw2QLfT752qVatxNIAGmxB7F3bL4ekjC1U/UL/QegJcL31iXhBLQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB9952.namprd11.prod.outlook.com (2603:10b6:510:3d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:42:21 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 16:42:21 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Meenakshisundaram,
 Mohanram" <mohanram.meenakshisundaram@intel.com>
Subject: RE: [PATCH] drm/xe/vf: Fix signature of print functions
Thread-Topic: [PATCH] drm/xe/vf: Fix signature of print functions
Thread-Index: AQHc47pw+gYcRhytMk6yS7QdXfhxkrYNuAMg
Date: Thu, 14 May 2026 16:42:20 +0000
Message-ID: <DM4PR11MB5456453EE10A50CA53372ECEEA072@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260514155726.7165-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260514155726.7165-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB9952:EE_
x-ms-office365-filtering-correlation-id: db27be42-ac95-4320-ca43-08deb1d7c4c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003|11063799003;
x-microsoft-antispam-message-info: 9Zn5BdWpt4ZMbRpGXTpfGIH+aYVxjRgQx3lrSBJxtGtgh8HpcpUiUYQJqYcmE8FuhzsldlGt1evkdr5HJNhfEgGY3y5rAgHl1gsSXoRSiG7IDK6QPo+RW8bmApOvwV1Q/VzR6tGhRFFRmtshmJ6X9wLD6/EK0+yxUJDuCTDBQewZPTsPpabqO4fBHhUniOQdWHw7LEFYfUMlMVYNPpLp2Zzb337nBIFHU38S/vJ4tnbiE3RKWudV4UkV8aUs3Bi1J+zcP7HnsC/aDoPwVQA3MNxCylpVB4+Pg2It9KP3q+8v1wpVA1qy1PEvuxwNknXzKiWeSlUsPmIa46YbjnXuFRf7DqnMNR/VaWvOKRWveA4etuHs42w7cMsIqQAQsdkGLE46HbC0pv66tqowFOpMLhSVzRJqBQJkJDuZxxmcSjKp0JfImx5JBnFg8gx3iHM/0rSbT1B/ZcuA6Xwd5vzHhnhrBogwx9U8vY0jzwMT94exANIW6yX8ONrBkX+32AUgBlviZ4TxRyMwbsXHIxJtagXRhLIBEXizZZQzqKvVVajNaGWtJyRew4V0YIAE19nxkBZVFqRrTpJajkAHdMslkNg+n/dB4vTRvEndMwr9Mvk4hSSrOCGfGXmj3XCHMD9NlRYZVrBrNjhKOtKeH3Onb9CTwyNrpp0nboqm7w4MZ+4lBY0ZbQl4UGb6Z+/KDGEa8sEZqSfitoErbzPLMI0OCVgQamIvsSv6y/P37Rw/UCZicusvQLqeiKebAgtuHfSp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D3HqtZudNqfgVo+BftijOv0KsNrimHNvlhf/3rzEKY/IxUbui16XUGqtjiHf?=
 =?us-ascii?Q?uj/D+BEj6rzavmGI4HBVJ8QvK8xW2ERpozXCxIUP1yAqqJ4PM5H2Ftf3+TrH?=
 =?us-ascii?Q?W20ZC/rnuhxsZiPtuhax7WZ4lzYLheJ1Xl6Go73Us9RQP6/DXxRPk/cvidB2?=
 =?us-ascii?Q?HMdvBB6vxTXs8dIQcPLWS5Gs2TrIxxi6+PMcfr902x2nBy1J17oUUBTmJayR?=
 =?us-ascii?Q?bcQqdRbVzznmz3b8O96tVRpfxjybuveNyAGCGFjzodEPtcNuEfmy0xUbGhLL?=
 =?us-ascii?Q?SwVY2+3C5smzKy9WCs8nsQFOOAH1PT9oSGOPvp+HWprMXy3BRxCgXVJiC7xv?=
 =?us-ascii?Q?nCwS9siDGOgUcZPUspv5eKWhqcblaxtM6byKb2/4/4omluzXcGTqHd+jnxLs?=
 =?us-ascii?Q?N9K2s7G0aZSXtmr76bQUGAL766jfMuh1jPjT5yAnRt2T6FpYHYrREwAgLPFO?=
 =?us-ascii?Q?gJgGHqhuogni6rMivqxIWef4IEwcB39ZqgVOnN7WwOOdVo8ZWr4qkyggIgzq?=
 =?us-ascii?Q?AN5OUVJ5vWLv979kYUppURA9gK241nJckIWxVDA7TpjGwqJPlYkdQ1TfgaGx?=
 =?us-ascii?Q?3nh1rMK+2EvVZRC5FRyD7ERkU8WjBKYCnOFV1A2NbZfh4m27mei4PKZ1RAdA?=
 =?us-ascii?Q?9QMY5GCOxyGB/STw4YSPwYurQX7sjafTdhXYz5IVH5ony5UU2eTxx5HPa0L7?=
 =?us-ascii?Q?HxZGNokIMwQKbTVI6G6AOfwEr+BiK43llOVdwcRFWThdKbn8xTIP2LG18a7v?=
 =?us-ascii?Q?vNSlv6x/Y8NKtcXmrub9kPxfUBBCvKToZfYEznRqecxhs6LdniHc1YF0O579?=
 =?us-ascii?Q?X3bX43CvICizH0lGXTbIFi4YvR5tDqIQsxRbQ2hq3RhfcQaq8W5PlDRzEq8O?=
 =?us-ascii?Q?h2C8bqYjjLHCt/XWSIp8/Ws6K6IxkNyqT9fLQ8ajNhTgMgkqa0aAHWSq6eD3?=
 =?us-ascii?Q?Eez5m3WXRTIx/ibptxrNoeMepdum1NLGXYxl75HrjMPuntACKDRe3AoqJ+JH?=
 =?us-ascii?Q?CfJiP4Lg+0HtMrR/iL3HwBkBrQ8sFInsDadSv9g+y9+UpqbJS6qmj9cHRRIf?=
 =?us-ascii?Q?RK9jcENDxrEpwEt7hEZpwE7HmhzHUVzCls/kmXOvzgTmTKQZLCGFvhCCTGhn?=
 =?us-ascii?Q?evs8PYcJdKIGSUcDOtSAoEqFQMk9w+gMz96AUHMuLytCAejoK6DR4SU7BhC5?=
 =?us-ascii?Q?pDh4ZTgky+AXB5PjkBsSoxr7Rq6+hDvHi2B22tyfDneuBlstuTCDPfkUXNeo?=
 =?us-ascii?Q?7EpP3suRfB8hfp61CGna+7+A0A+YwDTZ8Hw6pROGgPL1GsuUIwLwdAOhWukQ?=
 =?us-ascii?Q?X8T+CQQSOt+2gZqrpNKm+x0b1CmmVx3huzSsnbUEeGoEmS4MAPCrSkNirbaY?=
 =?us-ascii?Q?oOAKVxIQMd6OpS4Oo3qrOTfbTpSKIdkN3iM35rbKJzdu9K8wt/TJvWtDty7e?=
 =?us-ascii?Q?ehF8k9thVgffy0G2Td2e3dpnCm4VFa6zHlpFgappjaSRY/0+oiiu0j/4tT/c?=
 =?us-ascii?Q?vKmPAtVAT85lXn/vYkxgYuO5iPnHxyuqb+Gj+tnUYg8kntnOJ7Htf25+sIDG?=
 =?us-ascii?Q?DTKnoj+kIIEqx0nzL0SD3Cpbd8WTXbD9jALAetDUQkI50dVRB4bS1ZHfl7cI?=
 =?us-ascii?Q?do15hJHWPG2TfA9mvWIi7Fy3vP7zDTpt6fC7EQ89Zih3bgvqhUj7WCQ+3Aj2?=
 =?us-ascii?Q?wBLccuwa7qm+6F4rilMUYiv9gzyxENLI7DPM6xStz0kYJZas7DhKU8VIe4Hz?=
 =?us-ascii?Q?qL5CPPeWhA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oOtzq3CCH2jReS0JrpjjovHASPNeZJ3ey8XVTiKZQ1fqgb27CNQ5OpHOLa2qiVGkmC5qsczKSJp9ex9xwcJb8swjgtuQicmpRvA0p7rZ3gI3i4+NixPUeu5HZ9qyzbVAu9BWxvEUoZCc4wuJ+iTkme7l4c2DtIVww9ChQgZ86Ctjgk1+8QoEi0UB2+xECmi9dD8FIScnflyO//bIVjKsAqRvA356lOjJkHLegbLWZVWyZeGita7ptlw9VFX+eENwJamz5VCjq9EeZ+UZp+ipXTZNFo3xsYnOUZKvFh3bIcTT3fXv9NFCM+RSLo5u3G1k+s2iQCvTAmAQGfhLA1ABvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db27be42-ac95-4320-ca43-08deb1d7c4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 16:42:20.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEUVopIpY/MNbY/EchLjUrEE0cG/dthoBxPueDN6i1htpAYwxhTMysvMdDJdm1tVo7Pw5w+MwAZSsbIy7xyggg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9952
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

On Thu, May 14, 2026 8:57 AM Michal Wajdeczko wrote:
> We have plugged-in existing VF print functions into our GT debugfs show
> helper as-is, but we missed that the helper expects functions to return i=
nt,
> while they were defined as void. This can lead to errors being reported w=
hen
> CFI is enabled.
>=20
> Fixes: 63d8cb8fe3dd ("drm/xe/vf: Expose SR-IOV VF attributes to GT
> debugfs")

I prefer this Fixes tag.
LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Mohanram Meenakshisundaram
> <mohanram.meenakshisundaram@intel.com>
> ---
> Alternatively, we may want to fix commit f2345ed5374e ("drm/xe/vf:
> Add support for VF to query its configuration")
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 24 ++++++++++++++++++------
> drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  6 +++---
>  2 files changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8989c8e1be95..0cd9d77f3351 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1137,13 +1137,15 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt,
> struct xe_reg reg, u32 val)  }
>=20
>  /**
> - * xe_gt_sriov_vf_print_config - Print VF self config.
> + * xe_gt_sriov_vf_print_config() - Print VF self config.
>   * @gt: the &xe_gt
>   * @p: the &drm_printer
>   *
>   * This function is for VF use only.
> + *
> + * Return: always 0.
>   */
> -void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p=
)
> +int xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer
> +*p)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config =3D &gt->sriov.vf.self_config;
>  	struct xe_device *xe =3D gt_to_xe(gt);
> @@ -1170,16 +1172,20 @@ void xe_gt_sriov_vf_print_config(struct xe_gt
> *gt, struct drm_printer *p)
>=20
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> +
> +	return 0;
>  }
>=20
>  /**
> - * xe_gt_sriov_vf_print_runtime - Print VF's runtime regs received from =
PF.
> + * xe_gt_sriov_vf_print_runtime() - Print VF's runtime regs received fro=
m PF.
>   * @gt: the &xe_gt
>   * @p: the &drm_printer
>   *
>   * This function is for VF use only.
> + *
> + * Return: always 0.
>   */
> -void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *=
p)
> +int xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer
> +*p)
>  {
>  	struct vf_runtime_reg *vf_regs =3D gt->sriov.vf.runtime.regs;
>  	unsigned int size =3D gt->sriov.vf.runtime.num_regs; @@ -1188,16
> +1194,20 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct
> drm_printer *p)
>=20
>  	for (; size--; vf_regs++)
>  		drm_printf(p, "%#x =3D %#x\n", vf_regs->offset, vf_regs->value);
> +
> +	return 0;
>  }
>=20
>  /**
> - * xe_gt_sriov_vf_print_version - Print VF ABI versions.
> + * xe_gt_sriov_vf_print_version() - Print VF ABI versions.
>   * @gt: the &xe_gt
>   * @p: the &drm_printer
>   *
>   * This function is for VF use only.
> + *
> + * Return: always 0.
>   */
> -void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *=
p)
> +int xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer
> +*p)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct xe_uc_fw_version *guc_version =3D &gt->sriov.vf.guc_version;
> @@ -1227,6 +1237,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt,
> struct drm_printer *p)
>  		   GUC_RELAY_VERSION_LATEST_MAJOR,
> GUC_RELAY_VERSION_LATEST_MINOR);
>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>  		   pf_version->major, pf_version->minor);
> +
> +	return 0;
>  }
>=20
>  static bool vf_post_migration_shutdown(struct xe_gt *gt) diff --git
> a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index a6f7127521a5..79878f21b1da 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -35,9 +35,9 @@ bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt
> *gt);
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);  void
> xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>=20
> -void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p=
); -
> void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p=
); -
> void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p=
);
> +int xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer
> +*p); int xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct
> +drm_printer *p); int xe_gt_sriov_vf_print_version(struct xe_gt *gt,
> +struct drm_printer *p);
>=20
>  int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);  int
> xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
> --
> 2.47.1

