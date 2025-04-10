Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA715C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD4910E379;
	Thu, 10 Apr 2025 17:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDzVOOh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A3810E379
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307467; x=1775843467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fINChyT2juHc8+3/cvJpHiTT86bsowp8QpwhxIDyodU=;
 b=VDzVOOh8Vh+jIvy6QpfYe3X/tKGBvV9O0muY5V8Gc682AomqX84QEdnN
 ceiVegRFWimMwCbNzekf18yeUd8IE6WKpznGRm0+3PLjACZds/tRYJBhp
 Q1XiAAGpgAuEVK7AxeGTM4nQitxntn+Ym/BIvzx9xL8iVaG+DZtjcrTov
 RcOuyJ18b/eaEMop65j0LfSroVY+3yzoim/DQr8W9FJDgtnMtNcIqKOvN
 wib9LuaeN+u3TASHCaXDZpjn9knJYUfktiS0hNfKeas5Ejilv/nAiRYUk
 lVg4Rz72pfw4dFUikTRpPdCFXxeVcHilbXZ0Y9ltRsIrkCY1qG+0I0bO5 g==;
X-CSE-ConnectionGUID: UToy3IT8TFKPwgm7r2VeOg==
X-CSE-MsgGUID: pwr4q+pRToygVqQMu0AFWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63241800"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="63241800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:51:07 -0700
X-CSE-ConnectionGUID: GnATYgPlRSWllEzKqa70Bg==
X-CSE-MsgGUID: HH+DWmY8SI2dapr4drKHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134144205"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:51:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:51:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:51:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFAmW9Vl8fv8oKU2syz7hztDH0rDOrwuOYk92OD7Q4NI/xLV5O28ARbY9a30cy8Nl040i4f1FVf0M+R4dniw3qvKYzvLm2ddRmdW63CW/AIrTHZoKOI/c7JbAVmDzKeVRV7qHPvYUHM97uHWR45QpmDrDQP4ln9CsvOVAoWwEZ/GGeddWzKXkfmP3EVEdFnsSmS8PltgaxViac/699UGI6tQu6Bl+psP8/VXntBbp8Gm8W9FGVdn18vrdE21lCtPeVq5Om9CAGruyrOHo3icgqMcQD0K0WSIczdxEoSU45pU8/tYwLwLSnxaOVTDMDhZDHkxZh1Nn0WQhtm+TJpaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPLSnSokqumQ+nRW6bJwIo+/SZIJz0hpFcN+fEW4pzU=;
 b=sdMX1BtJq8arVX1pGWKz/dkdQlxl7I0BIl/iLOhylRMt1fHEdth/8PH73BwgBHg96GsIKxpgDKk1XCAQu0yX9tjzkoVR1vK2czidrhmaTvt0ySfTriaMR31FQk60cM9bGpS8hTC9WzD7o2CXRIe3ChNSJo+2/Z78wtyjN5CAeIymGOamZeJM8NFwR5bluq1lVubRX0+E2WmJu4AycNVWMTgKku929I+jAjtFAqLIkEAZxxRWF4PHZXSY3JVCR9qzIhIJw2787v71P4eB5sZIZYPy595LKN78w2S5OIbTaxALIAdv0ojmD/5R4bGXJYjGsrvM6xTcVAAhB4iVFGEwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 17:50:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 17:50:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format
 output
Thread-Topic: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format
 output
Thread-Index: AQHbqjGeGYPgE9C7mkSXPZTDAe7thLOdHLKw
Date: Thu, 10 Apr 2025 17:50:49 +0000
Message-ID: <CH0PR11MB5444090E4ED9567250307AE4E5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-3-zhanjun.dong@intel.com>
In-Reply-To: <20250410155853.574830-3-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6265:EE_
x-ms-office365-filtering-correlation-id: df592c76-f48c-4f03-c2e4-08dd78583acb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X7aPfycxQkI19v9fyw8AQFewhMRb8IZ5P0qJsWH5QCoqnfHO5gmcpjy1DS5Z?=
 =?us-ascii?Q?Esbio4Ca4z/4HwVDOS3fs3HWf4HZTeVSx1bNJ6+Tzm55fSSPFNLO5y8oF8bC?=
 =?us-ascii?Q?89htvt7uoZxLo9AMAJTJgcfQafaGxXNSuzPhSV0+BV+7gj06xJgkT1M9AUwg?=
 =?us-ascii?Q?DqjWOAV+MhEpX1t6EQ+aZSuZO0c9tXFnhN8Pdn6iuo05L33zWjVgdtoIxBJp?=
 =?us-ascii?Q?ZDGSf16UKvXTgs+Bd7Ija0HSaIJbMfZy3BfsxhL7ebgaBXnxbe+zxyQYDeu4?=
 =?us-ascii?Q?8adw/5QrVlEMyKIIFWiu9ukkJ03kImuubVJev9FXpuHTmvdyYoCHwY6aNVdC?=
 =?us-ascii?Q?GeFPmkGwkilsMzT9VBx0IrEFEeSQrH5fv8TCFnblUEyXqol76zEsfV/B4h2C?=
 =?us-ascii?Q?7TMui4aLJaNyblvmt5EHWpM68lEeqP6jgGWaUQBDmjEhSvke5IUx18lLCfie?=
 =?us-ascii?Q?LZM4CnhvQ4sfXVF5Z0RZYdsRl81udFye7v3S0Ng2A0RsZ4Kib/bWUunLAHsj?=
 =?us-ascii?Q?d397mXI4Idp9rY/F+PwJaN8rddKrnmRmBCRIncCCqrHTBa0rVV2q/3BZAbhW?=
 =?us-ascii?Q?0xANu3BYKGqP+/gU9YBFZeaDskLSKG1zBkKKvYVqTNs2YU1JiUbhXx+djWoR?=
 =?us-ascii?Q?x+uAcd1NtI4eiuwTGK5WNULgepeHqhm2M3tOIu9aM8ldyVu2Sw6JwFtDBb6P?=
 =?us-ascii?Q?mdoeGimLGpbWHBwCOUxCGXJ4xJvOrePiOLiteSmd6KiNWid/gCcdOlOY4ZiK?=
 =?us-ascii?Q?Svl4N5/Mckeg6ODQE42ER3lQI5cofgL91oNeDqCmDP1saRHOjbw4c/P3Cca6?=
 =?us-ascii?Q?7fWbEvaZs/JWMcv6sfgkqQy3q6pUfw4m5ncdO1Pghn2sBWRSuAGbAOj794xN?=
 =?us-ascii?Q?cLqbp5oRLlLs6rEvKmdJdjFHlnRLuRfCLOjhL4TP+T/IfpTNOmQiNrBUcSG6?=
 =?us-ascii?Q?jHeAYtns7foli18qIyXaz3fKnV+4SYGxhOtkGhjlqrcQkjjo1JvcXULhphCW?=
 =?us-ascii?Q?JBpvptSEwXIuwwgg3qAnuMcNzyxSZDXHJ99UvZM7uWk1WrG4qr0u/0vQlYI3?=
 =?us-ascii?Q?3dnByTnLcL1Fu/gLfDlbiIeQIkO2LB75fFzOilUG10fy4e4FoBagubHVoRLx?=
 =?us-ascii?Q?mJhsCm4jL1vBbiCOE7GgI0zI+P2hnZ02onJS6Q5ue+IXpgeoXTkJX9q+DHHL?=
 =?us-ascii?Q?mPe2ddzIOY4Te/ljpcBDx8ZiFkNsKHsLKHjFCQ/NsgxaOVr/0FtRmbR3uBv9?=
 =?us-ascii?Q?/qlHX/Cpp90FY0QfX+PbUIOrwAWpSiJKt1lMU9uMajPu4bwrdNA/XuKLuNkC?=
 =?us-ascii?Q?LOSQHldeoD7QRH3moF1Vm4achwf9vDOehIpfr/iv5H+V/vZPin0iP0rC7TQi?=
 =?us-ascii?Q?u1rNlkgqp/RKk1Sa0842qDiewlhOw9NNXj1TMfZ5MQ7Gm8R1xux8/Tzb0fwm?=
 =?us-ascii?Q?dZqcH5yT7XlTYfbpe2ssgxir4qqmcanvb8dodleg/Tke+zs+ULNQFQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xJkF9E4wpOn8Vmx6SXqLCvRJsr2p5OCEfN1jLYDBAZVlNjFJxD6hYFsKx60c?=
 =?us-ascii?Q?NvA3XH+kwd5/ZsykItPyWPLIlplBDnq9xWnhvHNZHxhh5XDY+8Zgio9VHweJ?=
 =?us-ascii?Q?TwuLvih0bfSYHDpJ3OpYjUkNywMd3EwGTyhvnz/hy7vI4Wi/S7SEjrAM+Aqo?=
 =?us-ascii?Q?8Eyd1FBzmIYlRulr54FQYtmXLqCan/RS+nF8EHG7kBSQ2NySCHPnZavZL4ck?=
 =?us-ascii?Q?zX/ZlLajM/a9a5txWObsZAdHifarAVdXPdzudyna94B1qzBdv63G9IWstk2j?=
 =?us-ascii?Q?3OZZ7GcuWwOwr1q4EcbIhgS6cUDj1x6DjyBuoZbsuR07LoKEgGV7yXFv6WUZ?=
 =?us-ascii?Q?f3Q0fGSuaDctGjxoU+n25gaLT6JGnx9e8XCFw9/eEnLpHnV2PsUN3LbUPw1/?=
 =?us-ascii?Q?2hmhxQgXMOzgvvcWW+ue8fyrUeSFAkEaWHrZVrIllZxY96//bQ4H9rmC4lY0?=
 =?us-ascii?Q?TiW3B1XLIyduNHpsKMcpP5lofpKoD1MhFcaqIcJTyew6wmiM6bXgS68rWi2Z?=
 =?us-ascii?Q?umCniActempgzWfCB7nVZ2zP+Qc7idPeX7LZcjWzlv1SpTIB4X0XtffiXoZe?=
 =?us-ascii?Q?gqgH/V0KEgwwu8EkvDD0mxKp/zJIYL13tsiQtQ1SQMdNhs4lCzYUMv2mCCVx?=
 =?us-ascii?Q?FSg9dhY7iVhZHph+ie90NDABgBX1lbqz2hb87HKmTY8P/mPSe0iy+cPflDWS?=
 =?us-ascii?Q?FqhH6zzU9Cc7yz0d5kn5euX2AML+SwAvYpg7knhkeDeJVpQ881yYDCIwEHhl?=
 =?us-ascii?Q?LbAt5Q42WD+FvevAv550mmxDmMBYWXxDYJWGOh6dhnZIY51CWRgD4TM5wk+U?=
 =?us-ascii?Q?yjG0dUzvnTo7B5g+K5iMhi8/L6M6wyyX9yWem9oY8jsnYGtmusAXtU4arfVj?=
 =?us-ascii?Q?fwcKWTJL7HcenFYGZYIV9rxOG7CJRoNSnL18f+7hhtPX+ktA82+CyPKKkB+0?=
 =?us-ascii?Q?hdz+Iqn6msbk32bd2FyOEuSlV7tQJN8+vA9vNo6CbE2vJl+h/m2EINMtum2r?=
 =?us-ascii?Q?kp5Z3HW9YY0QkCQCcSnuyMT0z2S4cdst2RvQIGEGwhMUwp/SNqfbmuHZtu/5?=
 =?us-ascii?Q?nAwLYHMn8l3mC9Jyuv8/s7ghF5u9f+lkwNQex66zXmTpLYDxBy8fPnAD6N6I?=
 =?us-ascii?Q?IOZUPe7qCuPDdHD4TMmbpv/aJS6A3WmcqRvdHJc56c31QByAN7HacNFlHfSG?=
 =?us-ascii?Q?eBAzMUKBUrHo4eN6S3Y2KNXjj+3Pm9ONm7rCgwo+dxmgSuotJG/jR0aC8GpJ?=
 =?us-ascii?Q?QWtmIRWz449TGsIiSL2pGr0/5mX5VMSInjKMv8VtOV/Km/bniZKscbAuaNSv?=
 =?us-ascii?Q?5+ckFbR0jIltLZxnuzx5lp4uZphZzWRUOzm2z2zT6lcrWwr06OsNjdnHQ4L4?=
 =?us-ascii?Q?6tW68hWx6DhKjqND0Mbvl+0LPz5jHWvXHNx9T2zkiT6NOiT897EYHuaprLSb?=
 =?us-ascii?Q?I7UxM5lOUiboFLCbg0Dze9l30+TFDQS/EDRBiI2HHcbVbsSeAM4LzSqIKxUq?=
 =?us-ascii?Q?7DjmjB8r6CqIP14vur/x9A63sWgMPzymWopZ7Qgu1yhkYkVlkHXAZLhm5i30?=
 =?us-ascii?Q?wYuB0fTNxuq3Cdqq+8E4QrXmGFMGQeROc2aLEzxj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df592c76-f48c-4f03-c2e4-08dd78583acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 17:50:49.4951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZBvNDRz7pHFpRXiWZNxXwqB8ofagVgFYUe3i2QGAQczVedWd126vNs+KoPZBapeST7n6Fn41lbMByr0ec+9yF0FABaYZNtG8tj++zu5SeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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
Subject: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format ou=
tput
>=20
> Add new debugfs entry "guc_log_lfd", prepared for output guc log
> in LFD(Log Format Descriptors) format.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Some non-blockers below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.c     | 34 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>  3 files changed, 49 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_=
guc_debugfs.c
> index c569ff456e74..6449c9a69b8a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>  	return 0;
>  }
> =20
> +static int guc_log_lfd(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc =3D node_to_guc(m->private);
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_log_print_lfd(&guc->log, &p);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static int guc_log_dmesg(struct seq_file *m, void *data)
>  {
>  	struct xe_guc *guc =3D node_to_guc(m->private);
> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
> +	{"guc_log_lfd", guc_log_lfd, 0},
>  	{"guc_log_dmesg", guc_log_dmesg, 0},
>  	{"guc_ctb", guc_ctb, 0},
>  	{"guc_pc", guc_pc, 0},
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 38039c411387..df849a0ee7e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -216,6 +216,26 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_sna=
pshot *snapshot, struct drm_
>  	}
>  }
> =20
> +static void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, stru=
ct drm_printer *p,
> +			      struct xe_guc_log *log)
> +{
> +	size_t remain;
> +	int i;
> +
> +	if (!snapshot)
> +		return;
> +
> +	remain =3D snapshot->size;
> +	for (i =3D 0; i < snapshot->num_chunks; i++) {
> +		size_t size =3D min(GUC_LOG_CHUNK_SIZE, remain);
> +
> +		/* To be add: Output snapshot in LFD format */

Non-blocking:
Debatably, one of the following two things should be done:

1) Squash this patch and the next patch together.

2) Swap the order of this patch and the next patch, such that patch
2 adds all the functionality needed for this function to operate, and
patch 3 implements static int guc_log_lfd and void xe_guc_log_print_lfd.

> +
> +		remain -=3D size;
> +	}
> +}
> +
>  /**
>   * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>   * @log: GuC log structure
> @@ -251,6 +271,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct=
 drm_printer *p)
>  	xe_guc_log_snapshot_free(snapshot);
>  }
> =20
> +/**
> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful loca=
tion

Non-blocking:
It's a bit weird that specifying the log is being printed "to some useful l=
ocation"
is the standard for this file, when this doesn't appear to be the case outs=
ide of
xe_guc_log.c.  I wonder if it's because we have xe_guc_log_print_dmesg that
has to specify it's printing to dmesg?

-Jonathan Cavitt

> + * @log: GuC log structure
> + * @p: the printer object to output to
> + */
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
> +{
> +	struct xe_guc_log_snapshot *snapshot;
> +
> +	snapshot =3D xe_guc_log_snapshot_capture(log, false);
> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
> +	xe_guc_log_snapshot_free(snapshot);
> +}
> +
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe =3D log_to_xe(log);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_=
log.h
> index 5b896f5fafaf..37ff4d11e6cf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -40,6 +40,7 @@ struct xe_device;
> =20
>  int xe_guc_log_init(struct xe_guc_log *log);
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)=
;
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_lo=
g *log, bool atomic);
>  void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, str=
uct drm_printer *p);
> --=20
> 2.34.1
>=20
>=20
