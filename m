Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432FFC021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 23:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D2610EB49;
	Fri, 21 Feb 2025 23:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCQjP4Nr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB4F10EB49
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740181997; x=1771717997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=htHcrxT/DQWp1vFnw3bYd4sluvRUk3TRzb+Dt5mRl4M=;
 b=cCQjP4NriJX89+8iH7rClH83C0ghN8TJe3SGAgjOcdYc+YR3vFfGVbQz
 xA6RIETbv2ye6LOc/kNiJJFgms4qNNLjMBWlF5L80Qz6CNSA7H9B2gkS+
 sDqStTF4UShPJOa+7xXNv36wnKhAVD1MWq0hcXDRnrbr5lckAi4lSZ2bJ
 9UscYCrg5rjtox3hQhINePW92OUEH4dzt/9er4n6gZ2Zw+79ZBpnHw5ga
 yJ5CltbfCf6Wn2uGRnliSDlE+oc5y+jVTBkOZ8yRoqXqG8WJdcNliAg+6
 D666sDnLDirebJzBcrCaXWuntdBAJHNFJdYEseI/VxrAWm2cNUIlzWzPF A==;
X-CSE-ConnectionGUID: AV3IZU/xRVqM6A+jS1uavg==
X-CSE-MsgGUID: /VipOMjvRymur0pwwKoMwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51640908"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="51640908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 15:53:17 -0800
X-CSE-ConnectionGUID: 1DkztApfSPC11ODy0YFtDw==
X-CSE-MsgGUID: lUG4MUJyQL66mML4ch8Mpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="146349453"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 15:53:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 15:53:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 15:53:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 15:53:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SImChISM8Vnx5eNvKWbS0IE2UGInd38E/BXvsSAd7cEaJd2hirXtSGRJZa8LW/7gPfLtdko8t7AxIHokhkVT1p94A9Nx7rOxCKvhDIt0+7keZYrkwS71uepHzR5B5FKpV9fYufZzFlwzgPNP3Drge9c22gW+t6ze7QLuCROemRXaovrKQSdUHfY3Z8z0kHgfDsPOpJvFfdM5KweTBUhdDsQgd6hDhSMsopyFXAW//HRbl5qpmHKJbc5hw/Do8GFmFqn4d45JENgiebQqlHcGsnRZclzc53xpGjjbHMvT9EhNo9L0pt+ogIdpf2qniO1pRZKHLbqHrEieTg3vfTa1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPtt5fYZATY7DKy8NH7kOgcgqGExSvAO9f3wVv1w6EM=;
 b=RF2a3k1v1tMpioc0Cwjr741PU3RvEdB6WyHufu59a82U+bWaR5IDVpi5khohE8hs1RCKqAAgP8oz8aFLnk7uKL9D5U1DzjWpP3uF5WvglgUlH5nI/i246rZ9RGsTD4RWtbrkM2//SxE1xy8es+CwBMK5LOqGZTKRvnMlVDPQtXx32erdgBWdGXv2UlPIYeZGxWN7jfUBji1ei+UNCAy4L3FSwXegXy8obHZ0ojoFWMQitVaDrO4jj5ZNf6NmhQuO02ofrBdfQL4uBikDiArZDkPehjj2KQoudO3gVIDurUrbNfBxjvUI+MsMwZdg/d5jyBAcQ8TcSI0VBALAgOCmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 23:53:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 23:53:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, 
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Thread-Topic: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Thread-Index: AQHbfybQKqci1D05b0Gp/N6pDe79C7NHWKqggAsOkICAAA5XgA==
Date: Fri, 21 Feb 2025 23:53:12 +0000
Message-ID: <CH0PR11MB54449CE74D623C783D5307FDE5C72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-6-lucas.demarchi@intel.com>
 <CH0PR11MB5444196378A058BFAC94EDA6E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <dqwh2xz7y3fnyf32mybuzpqjqqma6zlfnrmo5m32ll3hyd7xsi@xifkysgmlzwr>
In-Reply-To: <dqwh2xz7y3fnyf32mybuzpqjqqma6zlfnrmo5m32ll3hyd7xsi@xifkysgmlzwr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8413:EE_
x-ms-office365-filtering-correlation-id: 33878723-dfd3-4f8b-aaa3-08dd52d2e685
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ez/SJFxLzXW+NLxzQ2D5Ymc3mYI5Gupyy3wHrZyV7rVRutOmJ4wwV+FySQky?=
 =?us-ascii?Q?+5CQ821u6onRg+rY/4yeI2aGyr9VytlHPhSr80S7IdUhRiyKZAFJH6c2EJCD?=
 =?us-ascii?Q?toMrllDgQjy6KfYFSfBQZXfHgM7CIMqiAFl6BhDGLmx7cGmrPESoBYvb1cXu?=
 =?us-ascii?Q?w4nFnp0Xtn0Gd39DRiTLgxmzbbexvEXt0kDQVzmCiAhIwJnG9GWck/4CWOmZ?=
 =?us-ascii?Q?bZIfukacmT5RtGMIXCg2aFEymtjVTes+yEZCnqPHMYGHo+Iv8LKL7oc3EEK7?=
 =?us-ascii?Q?yZcWruTHs+1Li/dEsKGJxJvesVBNBZvArLoN66Ua7Ct6qh8JI0mHdfrtPptz?=
 =?us-ascii?Q?DthkvA+WD651aXV2BeB/RjyfWOmadMMuNInFx3apsiQRaoKeOijFomZ7Uy1R?=
 =?us-ascii?Q?w1U7LK3qZzvNsOgJRLLrYxbyD78h76cABYs+6k6760PoDW6xt9iwYkAlPTZK?=
 =?us-ascii?Q?pfYFcyb1qyPHYQXiBQ1ZXHU+wX1xSp4WFhEDVy9xw/5FEXQJ36XI5zec2dWJ?=
 =?us-ascii?Q?oVusF2Ugc2YQPMbMUTWKHfGDuuavYUPIXsTLPlKy5rdUt87YBxHt6xvbbd5E?=
 =?us-ascii?Q?2VnR3au+0KNO9sjXn2Og9RaB67iGVUEDhWb54Nu1S0VfSUZIvSuurkee2Bx9?=
 =?us-ascii?Q?fxq7U6yyyna3tjOKg0f6sMBpY2NNgxfpqrhfXWObkiORK9WN5LjRZDTPdLuB?=
 =?us-ascii?Q?CtLLHUj2AeubrWGv5BQSJbdcVDGYd/DBRrSkvuoNcCX1bL6q8R3QngJzQ+3j?=
 =?us-ascii?Q?disSAzDrmXUhxS/MYFJGb2R/UnOa0uAjf3TCuZgThi9qVBzlHOf0q9bMGzg0?=
 =?us-ascii?Q?BRDThXg8LUW0K4BHeG7MyK7kYlAmeTSqrcF3kpnGQ2V6rDGCH9r0TmPcC2XA?=
 =?us-ascii?Q?8uSFCdNbVWZOZHwou0W545m5JLyj6DJOCErc6Ud7YOefiUk3s8+0oXjZJUrs?=
 =?us-ascii?Q?55VFQ+WPCbly/LRgCiu4DSQtsAU/RNT43gfA2iCXIql8oaN/i5l5cuSmSr55?=
 =?us-ascii?Q?gz+wDVJpH5dI/gIkIQLidyLEQLsDAWt8JbU/1ZppHg9xFLOjRQtnQH1BYwb6?=
 =?us-ascii?Q?W2Ip7ef4ktIKyNY7KAZKdg9e+dq38Q8mhRXM3jTgBBUxUwtRYfBKDctelJjz?=
 =?us-ascii?Q?jrP88xGyOUS2I2PWbhpiKty6L3P69YE+ZqjMldLE+VGRGYa/px/il5VIHPLq?=
 =?us-ascii?Q?L0K+Jnqzuz7i5adisuBTzoXirwPQn8wI2243Cw3hJUkHdk2w4gzXcE9BS8R4?=
 =?us-ascii?Q?bVya50OfO6vnkX3m9jLvBgJU1utnuGJ9gdWTzxxCrC9wQRJw2bPmKeJyJVAE?=
 =?us-ascii?Q?FtiAzi3h1HeESX6sque/I6A4u+hwcY6YfCuozUHM4tp1cUY466e9XKnR+GwG?=
 =?us-ascii?Q?nbeZyhwNNdwj6pXEJoxFidc7zof1sNlrETnO6Ry1qoXWh1hIUAUxm1sF5pl3?=
 =?us-ascii?Q?sTNqErStpn5+w5uKCQdZPGzh6hCVbJci?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?49TNDPdbRApPbIRoEm1EAKJPa3V9392K2y1ewroiwQhfCP8MepUkFkcH2GKD?=
 =?us-ascii?Q?jL7MLRWU3gvZSHIhSF1bm1Z7pnQOvCWFAZ50UAGFpHPQ2yErn3M6lJfj0p/F?=
 =?us-ascii?Q?6c6u1nDDC27DzR/4yjrlzSnf1dee8s5JBdOnbpfLaJ+mq0Ekgv4jjq4KwIiN?=
 =?us-ascii?Q?0oPjZwq5F1ZBCUPHsTd8F/Ia+xJvrMrmo9A5ZsHEYdxWCWenZeaLYGPIwBLM?=
 =?us-ascii?Q?vy1RNF/87+Q+9mIOX0aYpPCD/vlZwLCSnPvlKcR93RVQuvITnywjgLBvftcv?=
 =?us-ascii?Q?6ujAttrIznwigRXBIawjuUYq+j+czwwOCc0vPWeldX/XVswkpcCT7NyZe0N1?=
 =?us-ascii?Q?UzmwRUNgyeEG4xSmkxbBLTH53ALI6WeHADKEMOhe8oTKseqo01MgiSq3OoiZ?=
 =?us-ascii?Q?6R20fmSKBxSrFSvX3a1/tq+M9CBvAYv/LZsIP3KScOXwlSwkW33Oa4fe2EG/?=
 =?us-ascii?Q?7jqZQObIAVmx/OQR3dGYD4D4cqkVP6QKEu5LH9zUjS51WOCl0ot/au5db5ju?=
 =?us-ascii?Q?rX/XPRSqpsPmvS/eeQMicWHf8XNUjwx2UIY6de8M/eZyoPV231PzeOXR6WJO?=
 =?us-ascii?Q?qxKPqKKncTMNqicXR8k4bBMI4C3mzAOujc6FNa31kBu6fVV2ipgO5blRp7kC?=
 =?us-ascii?Q?MEIY41iM90oxb6+RqdFVYKIg5R3qljGDTO1VINghMr8zkLy/IgPt29/lssLu?=
 =?us-ascii?Q?vYvK1qS4sZsbNZe+GDc3QHpyJuH9HzhobBX6YJUsMBrl16FKahFYoFy3Wa42?=
 =?us-ascii?Q?xQQx1vXcj6JrGU/BiLVncBImRdMseFkDwrRFivaFZNY2DbJkIDoTyCLQkBKu?=
 =?us-ascii?Q?MtEqSod0oSOAMH3hu6CanL0JMnPe624ku/fV7oXgdqcqFYcMNkg7/p8Q+6zD?=
 =?us-ascii?Q?OGqJ6ZaxlHPjnaQgciKMWZc9CFLcCVNQ7j3XO8qRdhowSLWuOOpDCsPd/A7u?=
 =?us-ascii?Q?EUZhM/Nff5en4jldXWCtpKaIvKPcIQuPFrx7RlgkzqiM8DNQPhysusddWVJs?=
 =?us-ascii?Q?Rx50va28xLnV/hYJF+agA6RVxIqMWz9Mg6qXFusVbNAtgsNzsCXhpK2qMAfL?=
 =?us-ascii?Q?D2iH0RQo+os+rHDCAoqgimgbeL3tsvB341YM4aVrkRHW/kb1wi+DadghDl7l?=
 =?us-ascii?Q?JZRTjpi3QWm/nhL1WQ3Oi9HS09YD+X4rQGHlhWXtYCngiuavi05Zn/W8T7ly?=
 =?us-ascii?Q?KCTgjrrVIAyH22pfPCXdbxjMmwEeVv7Zsof2H9knN5JFm7e9Wx90Hc7v/xt7?=
 =?us-ascii?Q?okckCPx3E3BJkUbc0siWPVohS7snMUL5fUIileYx8VvccrSOlK6ifnNF/zPr?=
 =?us-ascii?Q?YL06Dp1tdDBheH26jVZzxK8agNrTDdb+Vy+aL2an4NwjsB3WHh4iXVxhDEol?=
 =?us-ascii?Q?h5ijuj1K44vUePD6Qwn9CiAA50rAYXpLviwfoK8ADGnrbVqi9Be/DxlAyPwl?=
 =?us-ascii?Q?NMk46Xh0onJQHtrHdqp9bDYJthaT0hOGMAHZh/GCdQHRyo35AMlf/71TQ7a4?=
 =?us-ascii?Q?Yz+QlQzbjpAOJJpzA/+GbEGabBlXYLY8IlEmfPGY4Guvf/7tzfoHpaijZPJM?=
 =?us-ascii?Q?bnQQCucZYGmatdKeOwwNNpxbjOJwLijnmPLM/PIW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33878723-dfd3-4f8b-aaa3-08dd52d2e685
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 23:53:12.0270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svaHfjYeJddASNWlG6e4/Qrz7DEAJ2cArVrastk11s4vM8TqO1kH7JIIzfeYwBYx5/Q4Gxr5eZK+oBowASURIyq6ick5pvOYW06cugX3oBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Friday, February 21, 2025 2:49 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>;=
 Nikula, Jani <jani.nikula@intel.com>
Subject: Re: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
>=20
> On Fri, Feb 14, 2025 at 10:19:10PM +0000, Cavitt, Jonathan wrote:
> >-----Original Message-----
> >From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luc=
as De Marchi
> >Sent: Friday, February 14, 2025 1:23 PM
> >To: intel-xe@lists.freedesktop.org
> >Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.=
vivi@intel.com>; Nikula, Jani <jani.nikula@intel.com>
> >Subject: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
> >>
> >> Handle it as part of xe_display_fini(). The error handling was already
> >> calling it if a step after xe_display_init() failed. Just re-use the
> >> same xe_display_fini() for driver remove.
> >>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> >Looks good to me, though we can probably remove the first
> >sentence of the commit message as it makes it sound like
> >we're adding the functionality into xe_display_fini, rather than
> >leveraging functionality that's already there.
>=20
> humn... I'm confused. See below
>=20
> >Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >-Jonathan Cavitt
> >
> >> ---
> >>  drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
> >>  drivers/gpu/drm/xe/display/xe_display.h |  1 -
> >>  drivers/gpu/drm/xe/xe_device.c          |  8 ++------
> >>  3 files changed, 3 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm=
/xe/display/xe_display.c
> >> index 5ad2c99a9ae74..b7c99b8df11f9 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> @@ -170,6 +170,7 @@ static void xe_display_fini(void *arg)
> >>  	intel_hpd_poll_fini(xe);
> >>  	intel_hdcp_component_fini(display);
> >>  	intel_audio_deinit(display);
> >> +	intel_display_driver_remove(display);
>=20
> ^ here
>=20
> what I meant is that we don't have to do this manually from
> xe_device_remove(). We can just do it from xe_display_fini()
> that is already called by the cleanup functions.
>=20
> Do you think a reword would be better?

Erhm... No, I think I just misread the patch when I did the initial review =
and
somehow missed you adding intel_display_driver_remove() to xe_display_fini(=
),
probably thinking it was already there?  It's been a week, so I don't know =
for certain.

My Reviewed-by still stands.
-Jonathan Cavitt

>=20
> thanks
> Lucas De Marchi
>=20
