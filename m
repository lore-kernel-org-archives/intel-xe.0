Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E771DE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 12:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0E10E265;
	Mon,  9 Oct 2023 12:05:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581D210E265
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696853114; x=1728389114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zm7pf2Pk0V0mwjxUb52+dKxvepK4Srv96u22yBfIzZ8=;
 b=Ptup+C+vcYygWdsFVXW7oWTwRWHp6KSk8TnI+oX7xqK9ySxEpT3vQ++k
 rk2QNspKD+SJsBzOlBmaEah2U7UzpqPhh2RAlXaDKvCQFiXrIODOCnhNo
 Pr0c9gfVP1qPadFNro+pylcfVMmowiTuEnq3/KjVzJK/YA9vDIOgmEuZL
 75pMPFnRgvlu1vJfVhee5lA5zyX/J7mj8E1vEwdFhpfjwwCBBODkgQgyW
 Zyf3GxVQPjfQDUHBAkG81f04NnfaTW3ff51Qsc08v7g9WspKNlcvWojeL
 4VhiUx9nFSBkbYUqXUWap2SdiHm90nMQl1O4znoOUXbCDaJhGAs84WiCD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415116737"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415116737"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 05:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084306323"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084306323"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 05:05:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 05:05:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 05:05:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 05:05:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 05:04:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en2hsBbSpLfuBEzYyADqBCO1077kHdg9gcaurdG7oj8/ZWh/hppnRklTzgMK1mKfSo710Jf6UwtuRBH1e/6rFZl+vNnCbsOc+JGcl6PkPTQM/M/anKiUcRE/csdXIwA/Gj+2cO3wmfiLcRgDvfpvphQeljhD0PKoHT+zmF28PvPBzWhw+lvc886eXQXLZrVSlr6HSbGgnMKsqXRYKlIB7O/1d9f01UDJuXoP5iz26aiHi1/3AhTHJGo9cvCqNYIvCg7LA2nCerCvsl8MGp5kvjBWeEU6iYKdEsWqaH16yssnPLhatPOnypP7LpIRTeQXjs+tAQkmpGFwsKBE2UjGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XYLxAIiQyUnA+GbRXYLiQZw+Tuwdbks6/rFmfetys0=;
 b=KhwXpozPwAL4KJDTm7HKfVbZ9GI4ggNK+mtrawvi1KeVUu3lB/Wffkw7eeGBW/hC5uK1BbbLKQj5/nfrWRmHh4V3uGYCu/s+WsmhbDtMVaM5SNREW+ZeyGHCTGvicWocT/lCOsJF6FfgAzs0Um/kalSSqTMkEj0BxQe7JeINySLzT8VhT+enBhMqBdxhQe6cHmzLBnW1vdDh0a9q7Wp37itAmhR70ypfgvBuqGjkftjylVc4g0Q4Y1BNCnF7OVoP9XMZ30JXF0t4HjRHAMsZ7DnVfQsMUe6OaGj1GMbtBy3FUOOfjFsSDLEzI2bUlWcNBl9lEhp/ffDq813QrIEkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.37; Mon, 9 Oct 2023 12:04:57 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::81c5:d638:ec8e:99f5]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::81c5:d638:ec8e:99f5%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 12:04:57 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
 error counting APIs
Thread-Index: AQHZ8pyNwJOnNThiwU2HqwMXhySsOLAy34mAgA6MCEA=
Date: Mon, 9 Oct 2023 12:04:57 +0000
Message-ID: <DS7PR11MB619707FA3D51D3BA9A2A825181CEA@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-2-tejas.upadhyay@intel.com>
 <ZRe3wZQzajycq9vR@nvishwa1-DESK>
In-Reply-To: <ZRe3wZQzajycq9vR@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 0e22b325-ea62-4385-a59c-08dbc8bff4c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PB9uY8W7NyDI0SV/GUmVfk+s3irxR84XUuzdU5onE3Es5lasfXM+VvLxK5vpwdQUYOIWd/pa7hGchx+6DVuFGSc6okmFXjoG8UeJTYTbUL2Q/IideV7ghLKfiGTPT1z8G/wbXNau+8MIxcJUoQf0PiPdf9cuLL7Xk4NAgPqlAOK5PpuvfRrsRryxVSom72acNOwu7O0LI7jHfYZQZ3JteZ/XGIfX95VUDp1H3VCFUeQlnmptOOHpqN2qmrwGEZ5bfdO2JNpKV6BsDpttAKUgmmhnp/T1Zhh5tbTn5rFw4g1fUUhPnQfdMQ0KLKIlRWwH7RIaMvqk9//xFRddQENvo4pzsg3XSANBhZMVaE87O+ipRzJZveGuF987gqcrZihPwy0iubSWeZNwr65Y5uOgLyGJBhx0UQS05ewaXL2VgEk/qhWMkxDzpNhS9bP018OauGYq2LKs/ixuueIecv1R4tNMoDzfXY7I57fSBaPoJYN580aiVJoq7/Z5Wn9qJmQPPp017WrRID5AuRj3IG/IrvqfK3JSaDwb6q4S48Fk/QwMp2CkDLM64oh2fg9kkFnLpCQKxHQmag7BMP0HWcHEOCUxEXUHr3GIfpVTSVw9N8ZMR41s99LMck65AGb/MiPG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(5660300002)(53546011)(316002)(66446008)(66946007)(64756008)(66476007)(54906003)(6636002)(66556008)(41300700001)(478600001)(82960400001)(9686003)(33656002)(107886003)(7696005)(6506007)(71200400001)(26005)(38070700005)(38100700002)(122000001)(83380400001)(86362001)(76116006)(55016003)(2906002)(6862004)(4326008)(8936002)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+cKAE6Etf3CLYGRPFgKm2hReAk+5HYc+qPyYduxQOtFh6JNbbZw+MnSUXxbd?=
 =?us-ascii?Q?AfNS7n2o2izfoaE6HYcdrqcV/jWPO3SnGhSXpmVgMVZAGwuKRHfvwfDTMsUH?=
 =?us-ascii?Q?Udxq4QO/p7HbeP0jIZholjdoLMENuAlrtHDDNZ61uAWXG3jBRi2fh5OdmlFN?=
 =?us-ascii?Q?LdZ6o3PREM3MgaoT4Q4dwLcMJoLU6rv5uTNN8/c6F7MP43WcdGCQ4ma4A0k+?=
 =?us-ascii?Q?F3j81In8HcNZp1wmuYzGO6bbEyv4qG1pWCtHRywCANeEshbDd+qY5nLWKxJr?=
 =?us-ascii?Q?u6gZUvN2zAWBtNnq9t5YXuQg4bocF7VBk/9Mtcb3siLmwUIEl2KYQl8d6n8q?=
 =?us-ascii?Q?VFY2JE77ggoNb6+Z38yZn5kotM/qPjGHDaiNiD5L99NPVwscx7GL49XyKILx?=
 =?us-ascii?Q?Ca8tbaUGeLZ+iTzbxbNP5/9RGHYPgW1lfwcYBiieNQD5/OuFQNfqrO8NsXQ9?=
 =?us-ascii?Q?/W4lyRWjQRYg3o80ZNsx0hWXfDREFTQMQVK5DO8JCYSFWprEb+Kmcmqe/bUt?=
 =?us-ascii?Q?zUCePF03YGT1/0wCDOf0A+W6Q/pj0UaPK5Y3wdmMcv3Z35vB686SFpXSX4Ft?=
 =?us-ascii?Q?dmuGH4avBW/8XEDF4zHk9+yMzuN5wPZx8k8DkNOwznmhq8JkSKGXi/J7SLri?=
 =?us-ascii?Q?MsVlgQ4OMqd2KAudenxIqb4qe4cyjsvS0iZ58wef9780yh/DbyKp+jnl5iTE?=
 =?us-ascii?Q?gcbtoekZI2LZDXCEn9cTtyCPLNGIbq8TT38atE6oDIHcBqllpwoiK3O7oNW1?=
 =?us-ascii?Q?DktzlWAiiaBP69Wdh6Dx+8zQR5cKBtf8WnncYzbdGwQu3YdKWHk/WL7zfc+F?=
 =?us-ascii?Q?hSwZNgC2e9kYU0x2n4KhebjWTWNwQvqMnSLoXCFj2yvel+r85nwk+HETNmwZ?=
 =?us-ascii?Q?HogW0gZSa74CC7quke5oXpVeSHBrbchygVzKeZZ6lryIsKOAQAwI8DIFVB7y?=
 =?us-ascii?Q?X/jfUIi/2yooUNI6Z/dxXEuh/MlwCYROL10RCAsxYRZ47XyqzVv9A2gZ70SK?=
 =?us-ascii?Q?MYhUgEapq04+R5I5GMfXfbXbx3YTEgbFCgEuJ4qPXnG/t8Hw9h60/S8/AjjP?=
 =?us-ascii?Q?dK33o3zGIuMh9kmGmGzKUCEa9+kIm3pyWt4g3BK6rE2u6tT2MC1q/KXzMfG2?=
 =?us-ascii?Q?WFW+OSqCWYlkJMW9eAl61cQN/LOX9wH7LKHkBMnCwWynRCRo6MvQ2ZIjpcqW?=
 =?us-ascii?Q?udST70Os4R9rs8n1NFD3tVY5KQd1PI23pZUHrzyfPrwPaV+kG5wsNQFdE1YC?=
 =?us-ascii?Q?5SMuYcNIzAL1v3eu/uH+x5nAiTTHHfbgWLRgvBkRFXNad5EUf20lgEoXq98D?=
 =?us-ascii?Q?ccv93abJWcDOhXA1h3bb0TbBEB8Cnkj38dgsenFrTePEz+366x/Hh2Eiot89?=
 =?us-ascii?Q?2nC0zbb2aEMlMhHNLt8lO9jQ3+ctcUZd4xfJXFIWCdmxRHidM1gbFkIZYVJw?=
 =?us-ascii?Q?y+b56/YBRfzAkXM3Z/jSfpBvTPyPMr3CNoEdji3VDGB+W/xxPOTkjSylJbN+?=
 =?us-ascii?Q?1IwFY5BiK0hVdifKjnbANniVcTUE72p+hDRHsZhD6jTGeXfH70EPNSV2PEAx?=
 =?us-ascii?Q?zmXl/s7iuHx7pTxzbH+XzebIDwAd8bRlsjM1qb9e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e22b325-ea62-4385-a59c-08dbc8bff4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 12:04:57.3808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hR5s7erFhsXUMK8PwW2YVq3bbeJ1r2S71XTOglsnc7sAuXohGf3CEDCD3J4+YNK9uIF7Pcf2nzdUnIplgtz6Z3/meXw4Uevfbv45Fe65fnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
 error counting APIs
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
Cc: "Roper@freedesktop.org" <Roper@freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko@freedesktop.org" <Wajdeczko@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Saturday, September 30, 2023 11:23 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper@freedesktop.org;
> Wajdeczko@freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver=
 error
> counting APIs
>=20
> On Fri, Sep 29, 2023 at 11:54:19AM +0530, Tejas Upadhyay wrote:
> >Low level driver error that might have power or performance impact on
> >the system, we are adding a new error counter to GT and tile and
> >increment on each occurrance. Lets introduce APIs to define and
> >increment each error type counter.
> >
> >V4:
> >  - Move API declaration under tile.h - Jani
> >  - Typos
> >V3:
> >  - correct #define max value
> >V2:
> >  - Move some code to its related patch - Michal
> >  - Renaming if API and enum - Michal
> >  - GUC errors are moved per GT - Michal
> >  - Some nits - Michal
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
> > drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt.h           |  3 +++
> > drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
> > drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_tile.h         |  2 ++
> > 6 files changed, 60 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >index 0717839ae964..dc57b38d7e63 100644
> >--- a/drivers/gpu/drm/xe/xe_device_types.h
> >+++ b/drivers/gpu/drm/xe/xe_device_types.h
> >@@ -59,6 +59,12 @@ struct xe_pat_ops;
> > 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),
> 	\
> > 		 struct xe_tile * : (tile__)->xe)
> >
> >+#define XE_TILE_DRV_ERR_MAX	2
> >+enum xe_tile_drv_err_type {
> >+	XE_TILE_DRV_ERR_GGTT,
> >+	XE_TILE_DRV_ERR_INTR
>=20
> We can add XE_TILE_DRV_ERR_MAX here instead of the #define above.
>=20
> >+};
> >+
> > /**
> >  * struct xe_mem_region - memory region structure
> >  * This is used to describe a memory region in xe @@ -175,6 +181,9 @@
> >struct xe_tile {
> >
> > 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> > 	struct kobject *sysfs;
> >+
> >+	/** @drv_err_cnt: driver error counter for this tile */
> >+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
>=20
> Should these counters need to get reset to 0 upon tile/gt reset?
> Should it be put under CONFIG_DRM_XE_DEBUG or define new debug
> config?

I discussed this internally with Aravind, We want to keep this counter ever=
 incrementing and it is not debug, its specific purpose for sysman which ru=
ns in normal mode.

Thanks,
Tejas
>=20
> > };
> >
> > /**
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index 68cd9a7ee087..a8b5f012588b 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -47,6 +47,24 @@
> > #include "xe_wa.h"
> > #include "xe_wopcm.h"
> >
> >+/**
> >+ * xe_gt_report_driver_error - Count driver error for gt
> >+ * @gt: GT to count error for
> >+ * @err: enum error type
> >+ *
> >+ * Increment the driver error counter in respective error
> >+ * category for this GT.
> >+ *
> >+ * Returns void.
> >+ */
> >+void xe_gt_report_driver_error(struct xe_gt *gt,
> >+			       const enum xe_gt_drv_err_type err) {
> >+	xe_gt_assert(gt, err >=3D ARRAY_SIZE(gt->drv_err_cnt));
> >+	WRITE_ONCE(gt->drv_err_cnt[err],
> >+		   READ_ONCE(gt->drv_err_cnt[err]) + 1); }
>=20
> Same as above.
>=20
> >+
> > struct xe_gt *xe_gt_alloc(struct xe_tile *tile)  {
> > 	struct xe_gt *gt;
> >diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> >index caded203a8a0..9442d615042f 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.h
> >+++ b/drivers/gpu/drm/xe/xe_gt.h
> >@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt,
> struct xe_hw_engine *hwe)
> > 		hwe->instance =3D=3D gt->usm.reserved_bcs_instance;  }
> >
> >+void xe_gt_report_driver_error(struct xe_gt *gt,
> >+			       const enum xe_gt_drv_err_type err);
> >+
> > #endif
> >diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> >b/drivers/gpu/drm/xe/xe_gt_types.h
> >index d4310be3e1e7..4645ea9b7893 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_types.h
> >+++ b/drivers/gpu/drm/xe/xe_gt_types.h
> >@@ -24,6 +24,13 @@ enum xe_gt_type {
> > 	XE_GT_TYPE_MEDIA,
> > };
> >
> >+#define XE_GT_DRV_ERR_MAX	3
> >+enum xe_gt_drv_err_type {
> >+	XE_GT_DRV_ERR_GUC_COMM,
> >+	XE_GT_DRV_ERR_ENGINE,
> >+	XE_GT_DRV_ERR_OTHERS
>=20
> We can add XE_GT_DRV_ERR_MAX here instead of the #define above.
>=20
> >+};
> >+
> > #define XE_MAX_DSS_FUSE_REGS	3
> > #define XE_MAX_EU_FUSE_REGS	1
> >
> >@@ -347,6 +354,9 @@ struct xe_gt {
> > 		/** @oob: bitmap with active OOB workaroudns */
> > 		unsigned long *oob;
> > 	} wa_active;
> >+
> >+	/** @drv_err_cnt: driver error counter for this GT */
> >+	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
> > };
> >
> > #endif
> >diff --git a/drivers/gpu/drm/xe/xe_tile.c
> >b/drivers/gpu/drm/xe/xe_tile.c index 131752a57f65..708dd385f2b1 100644
> >--- a/drivers/gpu/drm/xe/xe_tile.c
> >+++ b/drivers/gpu/drm/xe/xe_tile.c
> >@@ -71,6 +71,24 @@
> >  *  - MOCS and PAT programming
> >  */
> >
> >+/**
> >+ * xe_tile_report_driver_error - Count driver error for tile
> >+ * @tile: Tile to count error for
> >+ * @err: enum error type
> >+ *
> >+ * Increment the driver error counter in respective error
> >+ * category for this tile.
> >+ *
> >+ * Returns void.
> >+ */
> >+void xe_tile_report_driver_error(struct xe_tile *tile,
> >+				 const enum xe_tile_drv_err_type err) {
> >+	xe_assert(tile_to_xe(tile), err >=3D ARRAY_SIZE(tile->drv_err_cnt));
> >+	WRITE_ONCE(tile->drv_err_cnt[err],
> >+		   READ_ONCE(tile->drv_err_cnt[err]) + 1); }
>=20
> Same as above.
>=20
> Niranjana
>=20
> >+
> > /**
> >  * xe_tile_alloc - Perform per-tile memory allocation
> >  * @tile: Tile to perform allocations for diff --git
> >a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h index
> >782c47f8bd45..092a6b17a97e 100644
> >--- a/drivers/gpu/drm/xe/xe_tile.h
> >+++ b/drivers/gpu/drm/xe/xe_tile.h
> >@@ -14,5 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);  int
> >xe_tile_init_noalloc(struct xe_tile *tile);
> >
> > void xe_tile_migrate_wait(struct xe_tile *tile);
> >+void xe_tile_report_driver_error(struct xe_tile *tile,
> >+				 const enum xe_tile_drv_err_type err);
> >
> > #endif
> >--
> >2.25.1
> >
