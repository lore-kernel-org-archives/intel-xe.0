Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E3FEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 05:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A28A10E4CF;
	Thu, 22 Jun 2023 05:08:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296810E4CA
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 05:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687410505; x=1718946505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1FGAOrZcOXxV4wEvk/4UjmjJVkEJE0eSygYuJ7xSI6s=;
 b=kopW3XcjHcVZexMh7SDTz6PHN89dUhKsJf2ovt/7/oN+2Q4l/HMuxWMz
 +FfJMgeP5GujxyKwWWgYqS/Fz8yBl9mf9zA+V7tIUwAimRZmJykeJNvbP
 wiE7h+2f2KXBm313HpjnditA6sek4eeZLuHRbzGwZrsxpqtr2qq/5tfTV
 Fz7DVrqNPb0VyYibUCpEEDKVXKxaVSi/ZNB84dyeg+wBsnJSN+9cPJR/+
 sjzbk2np+pbVCAwk/vPtAmsixdjAmGZPgmdMdeuSmgjX0AbngVPbUmXu8
 RR51KPTDNrXVODNsaqb2pBoymqBfaK+9EkN+ikSjKld1v8WlMNPUHu4PP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360406581"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="360406581"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 22:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804640326"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="804640326"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 22:08:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 22:08:23 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 22:08:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 22:08:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 22:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwQq14PYaCPWjS3KXcrFUvnJ5VYbEMNO/+DuPLypkPIMIPNHGpag4SmLFD+XX5HUOIc4xmy5YSatUnUHhFDir0AF2frMQK8L1cwRod4JYM74uv9/r68DWIdVq24QZUcvdx0mQKBGrrSaBOwCC3O0UOgN67zJIasmXWPIAA/zqq3NNpQL3VIxmPtFuphri2QMS8keQNztr0bxcaoRTRLZmkQHlBLveIfQwI9qj5vPVsSkyZ2uOBdMjF3zvK2AKgJeBXH9Qdj/wSMur5kNuxk+iOw2whruyuorqKwiZmZQcfrUP65WI9W0hKivJYDL1T543t0hE2OaTUo1NIyANZgQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRxP7aQNcT5aJivvGeNJsv3qGYH5ffO62+GcksUsR2s=;
 b=ERsiIAep4afamEpvGpP3kW3KlfO8GG6HhlDz0TbY+zaQlsQlXLfL8Nl0vIFIRGfaFY68JbcrrJlGo44YF4fbgvggCGa7/jP573lT8AmhgDpQ6r/o7llpOE69Oq72UScEyC6IMmISZ6959iA7+fQZd/jWN+H/33gxZdOQWB8pyy/ofHf5iMULjMdngwv8nk0LBw8aBCm8bZN3s+GKS2g1JRZQ2nM2RrBxS9lbIRCwZP/+3iAmqYr+LXFpdUq+bczMnXRYPgr3h+jOfk+8Y2HrjXlQZ3dF+g3/io0IRnDywNcEwMhNQr/IFZoiWnCKkDZNc9XiDaY5KR6nPsEMCBkZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM8PR11MB5671.namprd11.prod.outlook.com (2603:10b6:8:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 05:08:20 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 05:08:20 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3] drm/xe/mtl: Add support to get C6 residency/status of
 MTL
Thread-Index: AQHZpE1OjdxliKjCvEKaWS1X/2MDna+WRDgA
Date: Thu, 22 Jun 2023 05:08:19 +0000
Message-ID: <CY5PR11MB62117FEB45CD9739C2E5BA539522A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230616092521.3862926-3-riana.tauro@intel.com>
 <20230621143609.4189577-1-riana.tauro@intel.com>
In-Reply-To: <20230621143609.4189577-1-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM8PR11MB5671:EE_
x-ms-office365-filtering-correlation-id: ba133fc1-6deb-4074-c6b7-08db72deb211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8XCJyalpkjmjH0xN5Sd+CbidPlfWSp/Y8yAyT2ok0TbCsZbzAw8CtANVoehDY2tEGH4DnWhiY0RtXuE6Y414OBVqhOml8Byolcy2v3+RTWuNzsTnrVB3vViwwc7QKsQaj63DO8GD91Os2L0ODcEl3y+YL2jdyZuGSGsG/nyt+5TqgcCjGDHAWLekNaAWiPFJmBcqY0lbj+Fgn3BtydDLMo4yCXvL5q0Kn7LgDF6dpMMtMqdZs5CGbZR2n/XYZ87wO2DDLmGYQD9rlR3h4JeAC4/ao1hZSp+8injEC/OL4WBYvl2nsjNmNTqKJY2fopl74LuaAFD5ftnQFjXrczlk7qDm9BC3WP0AoatZDcGIV4eKnQI5Q+WCjmNbPo3eJJQ8QTNzWt4spC6hL3v1qjKLAbc0RcP747PMlw4BunRKBx3vHy/3aDvDYCtiaxVTYwZ8U6BzMtyizRrFa8mm6J+9SQwvHqYa/lS2BbJcktcqH3Xl4CXjaFxxEMKIHbnb+baS6WaLGN61bgY5Yp+pp700AS4oaV8AWobzoyo/Gznzxoxm3bTsAD3qFND0LkZ+1OuWnKb0YB+RduXDBPWuCwrHpICe293Zp8wWvSE28ymLICADQf2ZHHGQsjFS80FxlWn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(38100700002)(82960400001)(53546011)(122000001)(55016003)(83380400001)(6506007)(186003)(26005)(9686003)(5660300002)(8936002)(4326008)(2906002)(8676002)(41300700001)(52536014)(38070700005)(71200400001)(33656002)(478600001)(76116006)(66446008)(7696005)(64756008)(66556008)(66476007)(66946007)(54906003)(110136005)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MZi182XTtgyfwqUQlbq3bJ/7keu5dxxW/g05kMfNGnbWHGikrE+k260IfYqv?=
 =?us-ascii?Q?DeLOAusmjX+HZTSSNRlkskS9iLlxZZlak1F8l+Aqq3hc0sosHhLiwgVKyZdx?=
 =?us-ascii?Q?Oh5pRGF/RZ71Hq+g3e6z2Pk22Bjl/crrsRmGaaReghNoK47YT/AwtdornSAz?=
 =?us-ascii?Q?JRUQuR397Rp21XaFPqgs+Zxo6V8DePM1QNDkJhrzeYDeH2Ap4IfXJfTfXQbT?=
 =?us-ascii?Q?Dw6ikK8FvwDcLZS3djkWtxoylYTmYpoaTNAGzTi0i0Dy6A+GZ8NaLq0grX2D?=
 =?us-ascii?Q?nLm6AplS8Uv1SxLotMCEQ4PRd+RR1vV0wR6g2bO01z4n0MhSSzRamM5gjKUS?=
 =?us-ascii?Q?CtPJieUtfQfUxNnNzlH7kmk26f1LHwob8JxDC/v0dG3QA4fk2fh6AZhGivOB?=
 =?us-ascii?Q?Y4Ndsa3PzkqctHmFj0xLOD/pS3LjqFdC+dAQ2qMIIBxblY/jxFsSgFGq+FiS?=
 =?us-ascii?Q?otyA7cH0Fa9USI4QvPmrCf+iurbTmzYUqkMaxA3vqwipbVAFyKY3FAYfAFTV?=
 =?us-ascii?Q?CeBAr8EE34+JXARHqZHxSwX/F5pBosm6r2M+M9Cm/ZD9JvOKXq1s+EiPtK+q?=
 =?us-ascii?Q?kUXPnZzMX6cLRg7SJvyKv1U7rBUAo+ry2gkM2nEy/Sz9rGoSz83pSpLr5cGt?=
 =?us-ascii?Q?B32HYE/T0qgq+Kc8torQwxlGDXwas9am9peQpKBTY1sNaASwV9RBJes5ItZd?=
 =?us-ascii?Q?O5E/kpQXpHbY6zKvJ9FDKR7MtusuDht98CaqZ4ph9/tuI7B12jAv+zje9hHs?=
 =?us-ascii?Q?mVxZIEQop4tU5HsfQCLPuJ4GFCAb4yl2lnEjR1CM4+jiXIYPiRY/Ik14xO13?=
 =?us-ascii?Q?qdB/CcRDhXirqKavuO8zQPQA5a+HX0tzMGJHrxZUdx5c8ucI4HBq8RoX9lRH?=
 =?us-ascii?Q?t0gS7QEExpKFKxNkDANYgiv4ELeDV6nDxr476nBQ9AoHcpGy4/nonnJwy1Qw?=
 =?us-ascii?Q?VqLhlgFLOUlPueSh2dUVREzAMdfsFQb5YSe7qpRcc5QMPbCbmaN3pQq7gEGm?=
 =?us-ascii?Q?iBxWfkmq4SHV44IDQOISp520FQkozXLF2R2Ymc14xmWzKlQVPCrlAeU+q8Yx?=
 =?us-ascii?Q?kRiGy6EpMbg6vWtnnnCPTYJVlUHKmsR58qj2tpsPGBr0wSe8ZKzW5GeQdoSq?=
 =?us-ascii?Q?3zArOrmq+7AfpPk75+q4NIu+YUtthUsnA69klI8hvh6kwHiPiaj3mekxlCJb?=
 =?us-ascii?Q?04ZupwZ3sAcjvKG4MRIVCzGdF9rTdFzLaKZS1zpoXv1AjuwxEWJHh72xgYfL?=
 =?us-ascii?Q?sl+5qCnPyp3rDFo4gzbbRP5CYfsFNHEcMI+FfQXCkhNH9i7rfesxQ42pZBZU?=
 =?us-ascii?Q?p+E4TYOk0noRHx4sJQltuJ19dygwumiQM9MP+8V4V3IQO8j/KpnB1GDNxz2/?=
 =?us-ascii?Q?FnjZXJ3gMBnZh9HZS3j3NwbeJi1IHZEEWD05mw1wH3QGc+9Xk63HgAI+kNGJ?=
 =?us-ascii?Q?VOTWdlTTvQVm0XcpxVzuPTbWWoHz1naNkd9n2RpwOc5+dbiZuv4UH7JumZQ/?=
 =?us-ascii?Q?uFkKylmG4UZQoXFTOJ0UFo0e/xK0Gx+KZzxpMPG7f0G1cVYUBDQ64s900Rtj?=
 =?us-ascii?Q?1I0IOv1sryTeZp96D1M9+JBb7sT4vvH7LmNV4HpU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba133fc1-6deb-4074-c6b7-08db72deb211
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 05:08:19.8437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+A8SvkYQz+sLAb+I5Ty5uXTrs0LrguFvZ5hO7SCU5ba1glKETTWTkJTzh3fXcUmNpWOthX/S1F9A/hgO9qsPSvg/0s0ro8XfXLUbj2uUOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5671
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, June 21, 2023 8:06 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> andi.shyti@linux.intel.com; joonas.lahtinen@linux.intel.com; Brost, Matth=
ew
> <matthew.brost@intel.com>
> Subject: [PATCH v3] drm/xe/mtl: Add support to get C6 residency/status of
> MTL
>=20
> From: Badal Nilawar <badal.nilawar@intel.com>
>=20
> Add the registers to get C6 residency of MTL SAMedia and
> C6 status of MTL gts
>=20
> v2:
>    - move register definitions to regs header (Anshuman)
>    - correct reg definition for mtl rc status
>    - make idle_status function common (Badal)
>=20
> v3:
>    - remove extra line in commit message
>    - use only media type check in initialization
>    - use graphics ver check (Anshuman)
>=20
> Bspec: 66300
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 11 +++++--
> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 14 ++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.c        | 42 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_pc.h        |  3 +-
>  4 files changed, 53 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3f664011eaea..d654f3311351 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -16,6 +16,11 @@
>  #define MEDIA_GT_GSI_OFFSET				0x380000
>  #define MEDIA_GT_GSI_LENGTH				0x40000
>=20
> +/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia =
*/
> +#define MTL_MIRROR_TARGET_WP1
> 	XE_REG(0xc60)
> +#define   MTL_CAGF_MASK
> 	REG_GENMASK(8, 0)
> +#define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> @@ -349,10 +354,12 @@
>  #define   FORCEWAKE_USER			BIT(1)
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>=20
> +#define MTL_MEDIA_MC6				XE_REG(0x138048)
> +
>  #define GT_CORE_STATUS				XE_REG(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
> -#define   GT_RC0				0
> -#define   GT_RC6				3
> +#define   GT_C0					0
> +#define   GT_C6					3
>=20
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> index ec77349dea76..7238e96a116c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -142,11 +142,17 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle
> *gtidle)
>  		return;
>  	}
>=20
> -	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> -	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	if (xe_gt_is_media_type(gt)) {
> +		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_mc6_residency;
> +	} else {
> +		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
> +	}
> +
> +	/* Multiplier for Residency counter in units of 1.28us */
>  	gtidle->residency_multiplier =3D 1280;
> -	gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
> -	gtidle->idle_status =3D xe_guc_pc_rc_status;
> +	gtidle->idle_status =3D xe_guc_pc_c_status;
>=20
>  	err =3D sysfs_create_files(kobj, gt_idle_attrs);
>  	if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index f2de2a75cfbf..7dedc7b00a9d
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -34,9 +34,6 @@
>  #define GT_PERF_STATUS		XE_REG(0x1381b4)
>  #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
>=20
> -#define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
> -#define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
> -
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GEN9_FREQ_SCALER	3
>=20
> @@ -568,22 +565,30 @@ static ssize_t freq_max_store(struct device *dev,
> struct device_attribute *attr,  static DEVICE_ATTR_RW(freq_max);
>=20
>  /**
> - * xe_guc_pc_rc_status - get the current Render C state
> + * xe_guc_pc_c_status - get the current GT C state
>   * @pc: XE_GuC_PC instance
>   */
> -enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
> +enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt =3D pc_to_gt(pc);
> -	u32 reg;
> +	u32 reg, gt_c_state;
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	reg =3D xe_mmio_read32(gt, GT_CORE_STATUS);
> +
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270) {
> +		reg =3D xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		gt_c_state =3D REG_FIELD_GET(MTL_CC_MASK, reg);
> +	} else {
> +		reg =3D xe_mmio_read32(gt, GT_CORE_STATUS);
> +		gt_c_state =3D REG_FIELD_GET(RCN_MASK, reg);
> +	}
> +
>  	xe_device_mem_access_put(gt_to_xe(gt));
>=20
> -	switch (REG_FIELD_GET(RCN_MASK, reg)) {
> -	case GT_RC6:
> +	switch (gt_c_state) {
> +	case GT_C6:
>  		return GT_IDLE_C6;
> -	case GT_RC0:
> +	case GT_C0:
>  		return GT_IDLE_C0;
>  	default:
>  		return GT_IDLE_UNKNOWN;
> @@ -607,6 +612,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc
> *pc)
>  	return reg;
>  }
>=20
> +/**
> + * xe_guc_pc_mc6_residency - mc6 residency counter
> + * @pc: Xe_GuC_PC instance
> + */
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc) {
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u64 reg;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +unnecessary space.
> +	reg =3D xe_mmio_read32(gt, MTL_MEDIA_MC6);
> +ditto.
> +	xe_device_mem_access_put(gt_to_xe(gt));
Space required before return.
With above.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> +	return reg;
> +}
> +
>  static const struct attribute *pc_attrs[] =3D {
>  	&dev_attr_freq_act.attr,
>  	&dev_attr_freq_cur.attr,
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
> b/drivers/gpu/drm/xe/xe_guc_pc.h index 976179dbc9a8..370353a40a17
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -12,6 +12,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);  int
> xe_guc_pc_start(struct xe_guc_pc *pc);  int xe_guc_pc_stop(struct
> xe_guc_pc *pc);
>=20
> -enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
> +enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> --
> 2.40.0

