Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95329606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 06:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sv8MlJJm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=glDyLMq0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0A10E0C4;
	Mon, 16 Nov 2026 06:17:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73A10E0C4
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794809868; x=1826345868;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nVAFw+zjMUCDBYf9DtO71ag/yX30nfhEACP2wIxci7Y=;
 b=Sv8MlJJmkIowXp+P5iITREZBRbnl0Zpdi7KykD5tuLfWx/w1FHAG6/Mw
 YLCZmaFGclzsJR9gXr8fvQMzFcwpMTCaPJ/bUyQJeYo6lcqJea2rhL5Ah
 3hjUpVUx9POem00OFfWmijMInUx3vo0PsT2Akh2DD29un1K5jShquuv65
 3cAZ4kmLwF+NWR5J3Qm7VV/x+6yqnP5s0QjBuj2pPsyDLs+jooKoSN4lQ
 VimnGSe7s4xUK/m4J6mT03Jfx0dk83jrtpZaqVKFZAwUintI0c/r60aMD
 7us7rSD/JkxYvruqtuf11cLsa4O5j2pGbItbNvitaWJ9evFugW3JNvhsI w==;
X-CSE-ConnectionGUID: DXepNSbnSoeyerrhrzuKLQ==
X-CSE-MsgGUID: Bqn7IDOaQI+WTc6OeeTL6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3613093"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3613093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 22:17:47 -0800
X-CSE-ConnectionGUID: BA6m4iavTQ2qqKG22belFA==
X-CSE-MsgGUID: Z4dRF1pqTj+IZaB90HSQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9296409"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 22:17:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 22:17:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 22:17:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 22:17:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpPvatdUGVGtqH3iG9LFFc+N4nWcFvpQkcwaob3mIfOFtX1XffxxVZyoScndhf5NrQEJyykwS+i6Utr/8iN+3FfwQHcxEW26MbXOMy5R3y59iZefLwQRmbwF4Y6Q9l5PK8g1ajUCRK+QlK1Myws/NSQK2svEnwxIEd58zQToB21kRvLhDytzyK1qKiC9mCs4Qsn5eiFvfz/VGiQh7/R1dRR2vrruy+sST7W6igY3AxYD+UOIvxgu/hWjmfP57r5bVkJN6fIaBvJaA8pxV4hqAHfP86WfLMUfUaPd/PLkTC1JaAZUTERAomtgUnnNRB3aYq+WqZl8a+VCRJIm5FhELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60PysGbwFjB59gg81/wHz8C2OHjUuD42qfSEB8NudVM=;
 b=b5+M1wJZ8KDI+mVz3FoZmUhdQJhrGgV9Zilk9kHDIiwO6ZqWW8AWD9MAZYl7OWG1tddlSvHmXAWXvr6tJeauaQctdyHSRwrJhDV4g2ImajmfUhN9UampnoHtH+PpbB8b92D7AySUfpJKwFz6GfJ+rHEqJhmS0M2GLxhDZdREcP3SpLyy4KbppFvc9HjCepBrem/XuWL+VTxTXCYCYHOBNOUPGHBwbjIwSgTX4OvHUzNv0sMTfE75AgjauRzgHOvwaebDzihyMmN6VN1naaerqbMU5/IRrxIPtU8AnFi/a2eF7druBEJOqiJ+QSatOWy7oOxk7R/vfO+2GiRQxu0daw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60PysGbwFjB59gg81/wHz8C2OHjUuD42qfSEB8NudVM=;
 b=glDyLMq0PMRJWjGVcLYVooEb88tDKb1TCKm+JALBrEhdYWeZoQarzJcJSGgBEXp3tHYb8lXb8H74Yhj2QXLSMNfWVKI6s3yMe9RUM1qWry8cmYRyQuwgtqisjoBtgf+b7Mt6+mrW7r5v5cqcR9i9oKxEQs8GvgCP7MvJuqkTi+M=
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ5PPF4422C5374.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::824) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:17:43 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:17:43 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Bai, Zongyao" <zongyao.bai@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc: Drop redundant error remap in
 send_tlb_inval_ggtt_full()
Thread-Topic: [PATCH 2/2] drm/xe/guc: Drop redundant error remap in
 send_tlb_inval_ggtt_full()
Thread-Index: AQHddVTGaZ6K2ovc+EKQlVz50ajIUrcwORNQ
Date: Mon, 16 Nov 2026 06:17:42 +0000
Message-ID: <DM4PR11MB5456A47FCAB9F7F1536AC2BEEA7C2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
 <20261115225731.3073489-3-zongyao.bai@intel.com>
In-Reply-To: <20261115225731.3073489-3-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ5PPF4422C5374:EE_
x-ms-office365-filtering-correlation-id: 0bfd55a6-72d8-497b-50c9-08df43a952fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|38070700021|4143699003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: 194/cMy2dM3E1Fgr0WhKZtHnvG0Sw6XScdWnO9ZGrtzobw/klnDBb1VuANlu6AasYSZTUQtNO+RLAzA6T/KFyCcpZscVvIM3+JZwclJeTyxMXKYvN1Zs7TIvQkeeB6jhhbUU7psdJZURssgIRI+5gU3uApJ4NdT1oq3pYRcDWyIJwPVnfmiPAi3hUIDMDIFxqikEivej5yn1/lJmd/Ae1yaPp9B7oJaa38uk6fx7WcKI3S7IOZVYzXsrAYzFQVTUUWvGoTHdYoEU8L0DB+npt8UgidrdCYbTliu6pdSNrAJpuq1RsTpvK9JDb9LOcrfOqfD+uCgLPXbDCXNlbEHrZMYk1XGsEqLgmdcyuc4k/NuuVwQlLss8ELvs9Z6qzpMCVExorkQTDLHsbnp9yyQQi14qtWRcCpg/MhItt4b6hHb4q95m8H7W/CGzVRC2XyWWKW07nwJEoSpRKyKGlm0NqDqZkLyU87hv7cFNd5f9q5nwWMimPpfyjGeOE7Or1LeSCMJKb79cryiTJS2afJ5O9KNJYOenfmfQiLDk15QPasaaDlJT8W11O+AJcVFYAmfQjEdAeTLZDKwt+BdWPaowgLlxblIpaJYyqofTkQRSxkcrAAhb5uyByfHZtLjofSRDNXeEteVM0+9LXPRHpBXngPs47re79faaKk8wJ9WRrwPEqiffvOfYSvtezYjyOuLpga61JfyZMVnm/mT7+zGxGURwtBJzHtO5+Pw8VIcWHgY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(38070700021)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W3mUpB14uhNQ4QkPVlxvNhJzt4iKo+OSBjrT82rdcfrhYPN6B4Ii73H9o+hK?=
 =?us-ascii?Q?+affPExBwD91YG/VwE74yRiKl9jo63BMPx6aoKkefbD2RymWh0uVnj6QGDsF?=
 =?us-ascii?Q?I0Kk92ZYALXWheMqBFxXaV8l+SOmyVTNAFqD6Hil6q9oqfhpxTCqNvyb8GX6?=
 =?us-ascii?Q?/CcMYwsekdCeS/Q/Hps4rxVQINcyWT8gOcPMQYwYMtEjEqBXO9hVcFQ9qkWb?=
 =?us-ascii?Q?BlnucpGyI6M+Ti34puQ+Ew1wX005jB57LEAEQJHvdGdy8Hug9nVpRH4rjcWY?=
 =?us-ascii?Q?WTpDb+WVpg39ri8mAQ57n2w7dR/HBjtn8iuL00bq2nowLXL3y9DJG23M4I21?=
 =?us-ascii?Q?7DfwG8L3rDBTnTqjEnZggTlAiDbU7MhQ65xKaKst7wFRp5IbMK2+EUhZ+xi1?=
 =?us-ascii?Q?CkJHE9JWsO7YDPEr/d3jlJB584sbjFhzc2HTaM1j7ggu+mjpM00Pu6Sv15Lu?=
 =?us-ascii?Q?lrrY5zJrd/MJEJg3ky3eP8SKAHT+tbZ/cwCY/+GVeoNC5xSeZfcRm4djdTPl?=
 =?us-ascii?Q?zSAuKRSmQbbz02jvOeewDKB4JIJeHnbaBYGlpTJ7MlZwwEEKZdAMOAHUnkqH?=
 =?us-ascii?Q?MW274VmNLH1/nsl9Nfqkc4/GlAHESEtb3cSE0fQ0YTB2oatiyJqTpBkjuWR0?=
 =?us-ascii?Q?hD7ybFqEpLDHngm6dyNr1ZqEesviose7mKiU9aH1Bz7eFvEC9QBvCr01frDD?=
 =?us-ascii?Q?2rCF5sgqM0HU0lpzKoLTZMfVT0oXIX1X0nrNjcqKYFi5G3Dbc/ewF6bOAP08?=
 =?us-ascii?Q?W094LqZR01SeYc3zHbj387BWu6UfIt9L76Cg4MOTzt+gTG/fxN3e6kuFRxAX?=
 =?us-ascii?Q?CpQPFiqe70f+LsOtUTHEKbg/JrdcnokK+cBEa5u9A0yVVR9reYztG43hrxEp?=
 =?us-ascii?Q?E7LsdktTSyNamsx5mFhT3reuQRHuGzsqgh73S8GCgyyoLF2sfN1WfB5MUKhJ?=
 =?us-ascii?Q?l580Y3mqaVOFtySP3PPEmTqkmgHNrwcn1aluo8C0QX0WoaBOIJZA47O4fJU4?=
 =?us-ascii?Q?uDpHwL4nzh5us/G1Z4cc6p1OLGt+s4k74GtsxapljjukA/OuGuYKAWPjAvr+?=
 =?us-ascii?Q?qTEKAZjU+BbCqSqjVgfgDRKhBWZbmCOVGP7A3pSuoJCqJpZYwjlnSCWU1IlG?=
 =?us-ascii?Q?4OkWDx9TIXV4XKB26pUEQ7CN0rJNqEz40LZiSFEZTy7yIbP7Q7rtOhii+aDU?=
 =?us-ascii?Q?ADL26eOkFWcgM77x7auZArV9DAmWF2f5e7dKQ8Z+gWGl2fOzH8Dr+Tm827nN?=
 =?us-ascii?Q?Dlxf8+5xYOfFL38H0PYKDj9YxDyQ8HFC8XzTeKTxW9l6DSenf7CyAfMrr/lA?=
 =?us-ascii?Q?HhukVbVTdZI/SGJMarpoVpaQHqbUqQKZN7+Vn0PL5AqPvZ40UU66KIUDYh9w?=
 =?us-ascii?Q?EjfflQuRKsVnaMbJ6HkpRpGEwGvabSZhInT8DDxwUeiC4CJjbWDvro2Qn93z?=
 =?us-ascii?Q?QHmFQ1I9zHMo0+YXsLeEdeid8cyNhaoPsmwx5OlBhtvhfeHZhKFSnrtRFYTH?=
 =?us-ascii?Q?dqUvwl+yP5IXdNkmMJXxCHYw9B4TqXAj2Jp5GjakX16D2k17UaLap2Xm4OX4?=
 =?us-ascii?Q?6zR4NHrqP4LTRQr7DmkkO383WuO8nQMxwx/XsPPRTuSCy0BISZgUZLItfWPg?=
 =?us-ascii?Q?KEMaY+1c9YyctB/5BPqqr1v2NxIDZf4GlKACgALXcItSnbOHOAf8NnSGl24a?=
 =?us-ascii?Q?G1qaMbg4iPnQrRGaWHd6RqXedDwgBcPg48UG+CUzw4v0n5FqxLtEljgqsfMc?=
 =?us-ascii?Q?o1GfzYwAG69cSPaD8r0b84+pFamQ1PP41T05wNENmp4PO0+NRfBz1Wknt5Kh?=
x-ms-exchange-antispam-messagedata-1: xAzC9Acu1Dbwpg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eqA3qSqgkTG7x+WhPTNsp5lNBy95maUrONh/K7mbTfBczvSqElT+uVZ2Fw4Gx3ynpdDpwyyYVBqBw5t8UNHAkQwucTEi9WGS0zMMEWTDOHv3JpsgEkUFwZXwy1luOYajLs+gDNe1dFubsBYBuCLlT7vzz1Q+L4HJvvjl7OjEZrIDDhzk94jSicdlZVRhbVxFVw5b8oHyo4lBn8eO8/jusmwaEBczzwPLwa+j/bBQ3xEN2WFr+N+ZqihVXUi2NQd3eAmv+fJqfCwWBMLjZvUn8+yrjRbBHaxwMdWy8/8ggp2jUK5VuBppvpTNm6sWfydxLf1VbKT8wWpZ3VKxlf3bHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfd55a6-72d8-497b-50c9-08df43a952fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 06:17:43.0024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58nOmvUSRkh8lIeQDQZNbvxdLi0yRMufY8gxej1T4vD8SDJaLEY9sfkO7b/Trbb5r6RdxBFhUhBWaPrB2Fet2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4422C5374
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 6:58 AM Zongyao Bai wrote:
> send_tlb_inval_ggtt_full() remaps -ENODEV and -ENOTRECOVERABLE to -
> ECANCELED. With the previous patch both cases are handled elsewhere:
>=20
>  - -ENODEV (CT disabled) is mapped to -ECANCELED in send_tlb_inval(),
>    which is shared by all GuC TLB invalidation flavours.
>  - -ENOTRECOVERABLE (wedged device) is treated as "undelivered, report
>    done" by xe_tlb_inval_issue() since commit af14e3705345
>    ("drm/xe/tlb_inval: Treat wedged-device invalidations as complete").
>=20
> Drop the special case and return the result of send_tlb_inval() directly.=
 No
> functional change intended.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index aa7436a1d1db..066ba585ace6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -131,19 +131,8 @@ static int send_tlb_inval_ggtt_full(struct xe_tlb_in=
val
> *tlb_inval, u32 seqno)
>  		seqno,
>  		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
>  	};
> -	int ret;
> -
> -	ret =3D send_tlb_inval(guc, action, ARRAY_SIZE(action));
> -
> -	/*
> -	 * send_tlb_inval() may return -ENODEV (CT disabled at cold boot) or
> -	 * -ENOTRECOVERABLE (device wedged); nothing runs on the engines
> in
> -	 * either case, so treat as cancelled.
> -	 */
> -	if (ret =3D=3D -ENODEV || ret =3D=3D -ENOTRECOVERABLE)
> -		return -ECANCELED;
>=20
> -	return ret;
> +	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
>  }
>=20
>  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> --
> 2.43.0

