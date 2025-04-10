Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A36C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAD310E379;
	Thu, 10 Apr 2025 17:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETWXWuoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81910E37C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307545; x=1775843545;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OIfTnOFe6w8Fk6A8tPGe7esDBLoHi7rtNaIWSY3hCvE=;
 b=ETWXWuoes5nkq/A4eufbtU8INQCMbb6dRsAFhyQvX9LOISEUEwvJev9Z
 BbtE3REpWPZsOO4/tLtxWWXYzUGA81p8n9LDctqI2H4Z9gHhmo/lvzieB
 H5R7KL1ujHgbXUK2yn6jdmVyuzR295ZEHfBuSzz1FCo625q9tJG+0jA+V
 surgoIYTHdVqkPP7T+ejSlBjcafcSqyKh/2tX3xl1nQtVdG8AePP58uZy
 xL+YKYlcB3RBq+IJsAjzL/G2pbsjYlINUo7hJZ+k3rTRDhBfUJjNXLVYL
 W05Qk7xbQzGqj9SrP6RtOS20lknc9WbNX0tWFhLZK1m2EaUcCqpPPy0G3 Q==;
X-CSE-ConnectionGUID: dvJYtlwaQKimlaUZc1R7SA==
X-CSE-MsgGUID: GRyVz5u/QquKGM3v5ciDzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56823140"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56823140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:52:25 -0700
X-CSE-ConnectionGUID: VnhcDVpoQNyjMy+OjFoj7A==
X-CSE-MsgGUID: wFu6FatfSrag7hYKn8tcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134144577"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:52:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:52:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLwv2VTyTumbrrQysTr/VCBZbJdJ3FH4N1UYd4KmynT+Tm6xpaTfmE5+aj/iOR8rcyUrTgFmTQjto+du8nZPuHGc3WhZS8NewaM6HV3bE/Jo4+BElklCoG5KSV3hK+wWg796pn6dI8awdKsr6zWGgqQWgxRTrHmgCCF1amFTUyUPT72ESvlqAikg7q8TF4xaVb0OEfWrcvaUUdiR5iJByL9XQkrTWU+ZOh7s+ZKB8ZRTjcqS8wgmYTKspOKJs8WO8fuUrJ0TrXnfEbbpOlFYTmclWSjSng0hOpVYC4pYZL/r1PTc5xQ/ZAlVPhwOEXykiouJkxwIA+j4zUkBOHOuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi3/bgSuO5dtpXk3nCIObuKq/lH7G9zTp17npBPCL2g=;
 b=oV7OqfRRYanhbzCUleI3tBVSEKiZExjEfk3/fKkGpx+ioRfUIoDTsc7zhRCmBAXQ3zlgilTe8kmBbjoiuY7Aqro+/z9LRwDeGWySEAmcJLTwqGh4puXrvzUqc/hNOPG9O36PQNxGy1LiVgQJ9/GDfgWU7r573aj7YKIHhy4acaraTOfg9ZB/Tb3xFPshXCAFcJlGdLuiHzpwBuh/5XJiP0WKAg84w/IziUMy1d/oMfX0DK4eVFZBKnjnY8ECMjB4CezJAuP427HPFRJ6PcUYDj5n4xC7jaQyK+jd93U9WIVv2vSCtLBYMtx6qW851ZOjTUOaA4ktyKoGUhpug8Piyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 17:52:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 17:52:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 4/4] drm/xe/guc: Only add GuC crash dump if available
Thread-Topic: [PATCH v3 4/4] drm/xe/guc: Only add GuC crash dump if available
Thread-Index: AQHbqjGiOthn+mFqmkGrfOdlJTmG0LOdLLIw
Date: Thu, 10 Apr 2025 17:52:17 +0000
Message-ID: <CH0PR11MB54441EAC6F2E96B1F8326D65E5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-5-zhanjun.dong@intel.com>
In-Reply-To: <20250410155853.574830-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6215:EE_
x-ms-office365-filtering-correlation-id: d0e50e2f-0efd-4b2f-d371-08dd78586f71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K5YRygmM8HlVqGcLDfqgTSCY668UC+whcKCQa5Kvo/enF/E/IlhmL/CP96BO?=
 =?us-ascii?Q?9h/7gba3mubuwVk7W17nqNzfB9cjAxrppghwSC0uqCbimktWZ5aRumBzrt59?=
 =?us-ascii?Q?8WXSfzPvwhnzVmkiukJYLCLUk8RjDOKBw6kRrw1r0e4bNi8xDEZSw66tp+uz?=
 =?us-ascii?Q?o+XZCbJSrLb7Ksa258jLY8mErWElYCB6YdEInHxRTlxBYcGM/6hCraijAfhr?=
 =?us-ascii?Q?yUBtMmcyVNquJOCwJNjhEj2KoJH+s+imPsVz7qvtZUewuP4v+I/Rk41h+rhk?=
 =?us-ascii?Q?0ZO6Bxt0C2SiXCRa5kMAXG9X1ln7qV8Gf6GAP5t8dcn2HZkZX83tsqNRrdvN?=
 =?us-ascii?Q?l8I1z2uFtYv+jo51AXHeywVVQ71D6B9t/OY3bhcp3MDPf2ypE4H93N3PaVJi?=
 =?us-ascii?Q?Yj/u9zpCl5d+TU2/a2B+xzdyV11g9JmQfe1dMssRUPHRB7FoLlHII8NE1IWE?=
 =?us-ascii?Q?zlBg5nSodfrp0eIIMkJgirS5Cm6qb0E97+yeq9Zoc1Ajt5ux5S3KtDYMo/zw?=
 =?us-ascii?Q?Hty34U0m9MGvqdcDbOmmTKELF0hGLeTfI3YoQLDS7dgUJG6P+R1verTTtN+n?=
 =?us-ascii?Q?aAKm8Vyc7/ZT2D97LYBqCux2nrt7i8ObBLzcumKHCyw+RE6Mi41puCnYZmv6?=
 =?us-ascii?Q?yaIEb+/HMJKtkZK88ulpsuMyDQb1o5IpAOgCycSlYxnYLqW+lvBKP/7dH0Qi?=
 =?us-ascii?Q?lQ4gwOaYLeJ1pY6RBCuqywGzfF7A63EOod+P+hbtXnyMFALD3jusvZJlRY6v?=
 =?us-ascii?Q?aFIkiSwhMUi+PonaPQv9ls2tj8dUmT6sJDwEnumh3tf2b+bVS58y7nmhMlBr?=
 =?us-ascii?Q?GV+rPo4XSJOoZM8hGNr2ymjxrf/NaX9bpBqCs26HlIn21ypAj8lIrlg63mbW?=
 =?us-ascii?Q?G1M8KsxkwqqkRPk4LE/qPl/1asIzAcybVIcNgdyiUXYjgFbLfLflay/zuvJ1?=
 =?us-ascii?Q?RC73Q8DRMeSUFOyVgAdt8FIxmMtJkEkeNYYt/USS4oEdZn4FYiwj0iYCRjc7?=
 =?us-ascii?Q?eW3tpFu2t3f11Wqs52YNXqxFlKiwHeomJHwRJ7SOJT6yZxiLlkSQEDsx4nrf?=
 =?us-ascii?Q?jf8Bxk/xsS0P4FudLMGjG74dI+oXzAY/QWlZkrzDbGk6GU7U+WsZo0WKNYSQ?=
 =?us-ascii?Q?F/9WR7im18+BM074QiRDNImFOQtuFPt4aHbbeGFMOvTqqJjp+bdDjpzCL65P?=
 =?us-ascii?Q?0qfn3Crh0LoDO1HVDJyfkD2eaftejMkK+Tynb0hSV9KH3yovcwiz5zVx+Z38?=
 =?us-ascii?Q?cgDbPFsvGgLpXgH0CxMd6872oofzyvP+OYITOcuScwEUCWUXWg0oplCcMZUB?=
 =?us-ascii?Q?bupBa6EFZjxrcVJP7oVFgA9wLXTG/SezsCdFawQ/HTSDwBpdExON3/EVkw9n?=
 =?us-ascii?Q?4zQ7or/Y0vfd8OTit6gEpTI/uZOUwqzGhm8i7E7YReYgQLrcHFRcA60yBDUH?=
 =?us-ascii?Q?cKWGZML30jWs9YT6QEAY724uj0FkZN51vNlq0r/F22t0qpX3t7q1zYLblMsA?=
 =?us-ascii?Q?UyGkV7kTNHhaYy8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i5WWMdq/lia8xCuXoUa+LIS4tadSNEFazivpHiarUwXve7LgetBcb61PFmUc?=
 =?us-ascii?Q?AjufbFMETJ4nMCxvAt+n8yrw25Mw4cSYMRrKiBIIHg8AVs51njTA2PX5uOiS?=
 =?us-ascii?Q?k+IOO11y0PY4t1NqzR6IqTzWLtzciP3xUnX7YazPUIGYnsMEVsiB6D/b2CvD?=
 =?us-ascii?Q?q1WOVdKxcBJJg2+0ZQ0Q7JSV0JxXCHyVMMbg7tdDSF4IPGF9iIyyIejrJAod?=
 =?us-ascii?Q?/WC7Ocr59aRl48S8VMWi7Pu6ku9PsK7uXr6zLTN5vbf/pSBtUFmmpwUl+xAM?=
 =?us-ascii?Q?m/720PjRsYbBtL4haeRdsOhyj/dSvyebRKoUTBhpbuyRrAM/bfKsSReYB4Fj?=
 =?us-ascii?Q?JqVFKSqkj5KM4N4tVFGZOUKwPQ0xRytmV6geK7ya449p0mia/pebpL/WDcEx?=
 =?us-ascii?Q?wpaXF8o6q+xDbFUGxhDdUBke0AMUZY54vOacK8EaO8JzFDeeTIC7k3fjPpl5?=
 =?us-ascii?Q?+ztPoYwtGF0RDo6QfSVo1pvnhV9k8R61CjztlnoBRNi3pOvWOrIeNmpnj+/d?=
 =?us-ascii?Q?cpuo8sDQ0XlKWO0n8CeLL/gVokMH255axjlLOBXTp4p0TaCTykSK+Ht7XoTe?=
 =?us-ascii?Q?2oKDwX+GMlG4CnbKJOGSziIbgZCGzkJx+bpjdIEmrebkfcqc+GpvQlc0Ko8q?=
 =?us-ascii?Q?sth9fGSmGQA+OekJWwt1yv1v72Aem8q0qIXA7/bOfS+eqeWcnLoc0Htzk15Z?=
 =?us-ascii?Q?tfC6j/wC7FDxu/fPDTWrvMb5P9B13geaI0iTvkQZKfk0PYgmpUQIhpkpD9m/?=
 =?us-ascii?Q?JTNzrPdMMZd8y6xHJcuIpPqbCDK22Nxm4/gX3JOZ62o8UDGeVtumCu0oxWB+?=
 =?us-ascii?Q?nWJ4RyVoIkH9RlYUJdZQV1+dFAIucFPmlARXV3s9lUaGVlAjVhdLzAKNpjWv?=
 =?us-ascii?Q?CbrZ7Kb9j9xnXlgUrs2ylyw6P2wB8HdLv67CkVy7wfxZHPjK2TOrOdQoMRtM?=
 =?us-ascii?Q?MmpPLV2I2PygGzsq2IGV4EeS2uUYOKjHR5rVXtlROcZRCN+bD4KgXAEnDtfz?=
 =?us-ascii?Q?4lK/yE4IXlAD6KOxV6FkKrswajfAP7PzhnnpCe/0o4+DfNbWZWfHE+9M24a7?=
 =?us-ascii?Q?dXeO29am7cTJ9ZUSMYx1qeVrQ4kYp5+jKLAkuQ/HZ4MQi/gGMRutHSIqw/eK?=
 =?us-ascii?Q?YV8xM75czgA6k9iBDXeLcBdI6zc7MQvH9DHDMMqHS/TPGpAuJxa5dmekU2rJ?=
 =?us-ascii?Q?3xRktNHJbDBt/IjlZpk04T7xAyUw/zKG5pNu4WHrdD+Kncobm8DKuAEdnRsO?=
 =?us-ascii?Q?41cSZXqcHptYWAj7CbQyrzAj8Bya74v1yRxKH1WvW292hvV7H34JiV/JnzoO?=
 =?us-ascii?Q?IcSE1xvcmLukZ6mGzUqzqin8eFh7TgmDLh1TfhefT76ogpFkBL9I4t+7Odp7?=
 =?us-ascii?Q?pLotIGQ7+QAdxUzqlLaO5zi5ZnuW61y2CiKzEHrBW8Pon28DZd4ykCJhjX29?=
 =?us-ascii?Q?zp6epChyN2ApJ9LyGXIPbsrqxQT+bwkuNMlcKLPnKoTdf3VTxvWKvo3CJWwY?=
 =?us-ascii?Q?7r32tIsBZPqHRWAb8tKoOgPlnaBMWPd24kII/jrY7WSvEM3akNPFQZOuzeEe?=
 =?us-ascii?Q?KeVzg49SGvRbinCxirRTp0OBlxooV2na2nl7XUch?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e50e2f-0efd-4b2f-d371-08dd78586f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 17:52:17.8047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/f4llbmiY0LP0xSY1h7D+LeRlI5MYdj/5NTmX47TPIjA1ySyimgXX/2gLPX7j1Skoh9W2Cr66jtdwxEXkollOd/6NQIkU4EF81iZzC1+OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanju=
n Dong
Sent: Thursday, April 10, 2025 8:59 AM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
Subject: [PATCH v3 4/4] drm/xe/guc: Only add GuC crash dump if available
>=20
> Add GuC crash dump data empty check. LFD will only include crash dump
> section when data is not empty.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

LGTM, though I'm not sure why it was requested this be broken
into a separate patch.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_log.c | 35 +++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 7cdf6bf238f3..1e5976a382be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -407,6 +407,36 @@ xe_guc_log_add_log_event(char *buf, int buf_size, ch=
ar *log_bin,
>  	return len + lfd->desc_dw_size * sizeof(u32);
>  }
> =20
> +static int
> +xe_guc_log_add_crash_dump(char *buf, int buf_size, char *log_bin,
> +			  struct guc_log_init_config_save_t *config)
> +{
> +	int i, dw_size;
> +	u32 *buf32;
> +	struct guc_log_buffer_entry_list *entry;
> +
> +	entry =3D &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
> +
> +	/* Skip empty log */
> +	if (!entry->buf_size)
> +		return 0;
> +
> +	buf32 =3D (u32 *)&log_bin[entry->offset];
> +	dw_size =3D entry->buf_size / sizeof(u32);
> +
> +	/* Check if crash dump section are all zero */
> +	for (i =3D 0; i < dw_size; i++)
> +		if (buf32[i])
> +			break;
> +
> +	/* Buffer has non-zero data? */
> +	if (i < dw_size)
> +		return xe_guc_log_add_typed_payload(buf, buf_size,
> +						    GUC_LFD_TYPE_FW_CRASH_DUMP,
> +						    entry->buf_size, buf32);
> +	return 0;
> +}
> +
>  static inline int lic_type_to_KLV_index(u32 lic_type)
>  {
>  	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >=3D GUC_LOG_L=
IC_TYPE_LAST);
> @@ -532,6 +562,11 @@ static int xe_guc_log_save_to_lfd_buf(char *buf, int=
 size, u32 *guc_log_bin,
>  		return len;
>  	index +=3D len;
> =20
> +	len =3D xe_guc_log_add_crash_dump(&buf[index], size - index, char_bin, =
config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
>  	return index;
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
