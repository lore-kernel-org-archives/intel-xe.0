Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85614C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 10:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400EA10E05E;
	Thu,  4 May 2023 10:56:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032E10E05E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683197775; x=1714733775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ezdVqZVbzsB9lg0SijV/DrVtgENMAuGRuCyDDJHbqZ0=;
 b=OqG0Hn9CRRtldcOE2frtDFbXqa2R0GmZTHzwuoNGLamv0xqzlThp4FAx
 m41HA/M7Ogd7gB8M2F6V9O9VD2g9v1GwwGtXSpVLGBySTu+CXzgu3A8Sd
 3l9q3IjWtjAQwflOUkkhIoX5a1fOE88vYLpMwlaYEIN+SH48HOtxcMkb3
 LrLaeWVzQsbF1lMyRNJ+5Kv04U0keE+WVz9eLiwr+q0hsCDffR4xgfHfK
 mkk9Q9h+No57NturA4fNzF+cfohRXOwA6eycTjvTYxXiswk/WAT2AMitZ
 OIWOtM200bQGgK5btNgitQmnbQyeFWyVArAW1f+jFB6hA90VPPs0ard6c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348945000"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="348945000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 03:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="691068928"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="691068928"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 04 May 2023 03:56:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 03:55:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 03:55:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 03:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQST85RJ/sdPVsL/xf69fD05lB1mL2gjneaYrQRLKq7uWv4D3iCJrKZn1hnDM/B44pqxfudAiqH8EC7jPyyP6Bm9lcaiKJ7/87gVuEVg827zziNTsKyB3YiVHUOxHTvVaf2ztAEm2LIZ/nLg0gUH9zXhqJUSE8SWr16u51lKnUN1uUK9di+ugXmzUT2M/03aLuoMkkXjgJhOiTz+CezM7zhH29ROi3jtqUU1le8roBNsp9H4tDcROeaZmEzX/tAG9tRVX+assW92HpeEBaPtZ6nAVL3MPBBeBL2/WgmkuVpdg/7jYhK59yXY3SN/6Io9xc5mfZlCAfaqEJK19ztdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVkh3l2GciBYC05EG+tIuMWlra+h6Y+Rhc8C0ZaZotY=;
 b=TB8yZAhXxXYOvFBt1rZCsZQfOlUCLx3u6Tn2USPVs4XgD7KpBO48BtrOjoNviyJDTvf7FLpBY3L52oV4JjvjuxyJxxc2cpfwEzhtxyF6vhPO6bULIlZOrtBNvwFTZMpEP220mPensNV2s7bYlYxSQCU4hKBjXLmZNoySn0Sgh8YkpdrUeJkPHgn5Pr5EzXCJNM1qQs4TIgLFanpRJzZpC5KcxE1wohSk1TNc01v5NcFOhcnwu2Qpr4KhlMDWGaIIf6thv8tkNL0Sy586XqZ9xe0MTYS8DU5/OXfRViWVIaI7h7EOEge1YH1CYJW08WKD/ekoUkHln9Li4xuf4Oyagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by BN0PR11MB5696.namprd11.prod.outlook.com (2603:10b6:408:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 10:55:48 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 10:55:48 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
Thread-Index: AQHZfYo7FHqe2fgnpEiL+oZUhtfr9a9J8iYw
Date: Thu, 4 May 2023 10:55:48 +0000
Message-ID: <CY5PR11MB62114419BC5C8ED03B7FAAF1956D9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-3-riana.tauro@intel.com>
In-Reply-To: <20230503064252.830641-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|BN0PR11MB5696:EE_
x-ms-office365-filtering-correlation-id: 8baceb71-e9c1-499f-343e-08db4c8e1eba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DITsyRoj0I2xOzVb9DqW1pYTs2+5NPL8pL47QFz7TzkD+GaoGQVrsZof08vhc8lCXwFEHILrLdigUtrdO8MO4Ml1GgnGztVAhHN1I9P+pcvObMHnozWmo1KvfVYurqiLkYr8i+zbuZRkcXrFKG4ULbAHL0VvT+LKjFxg2S7TTCAZZw0indTY19MwfAMVhLGMTojoCLniG5kv9xteMHN2Fc2dO3/N2KCpt8zQb2RSt0kqRzAyQqycqBYlB3Lf8AVQBmO+VCrNsJrxfZsn/88hZ88/n1zS12VT8S5Q8BUhW8p6laS051tv0HmWZL2Ay5vIAJOa+Y9lMbuYcJodyO7rABdrz/6Obc+nr7owVkcljw+nLxjDHA5C1T3maVUZtElt57OllCV7LaM8mBZLOFyvlxWGsWStiflkt98NCBuoaAS7OGrhluF8OaP29k1OblTM0qyEM2YvUdJN7I1Nvc0TrW4wQXCQtz/fuNURaA6QVVOtOCEIU5cMPsB9EAZKSKer2PzVJPuxK7PDnLbSCuL2/F+o3oDYDUNQVRAKAr+p2blrWVxBnePrtPVfNNV/PftpWiGn1FK1+yg2X/BuO0+LEGabVHHtkQ2oURsE8X2EJY8pdKl5jg8iBXZINu8aPp+2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(316002)(66476007)(33656002)(2906002)(86362001)(186003)(9686003)(53546011)(41300700001)(26005)(54906003)(7696005)(107886003)(4326008)(64756008)(66446008)(6506007)(83380400001)(66556008)(66946007)(76116006)(38070700005)(110136005)(71200400001)(38100700002)(478600001)(52536014)(8676002)(8936002)(5660300002)(82960400001)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HutKrba4i/sSV110/EgZUpM6Uxke5QoGwrQanc6CWRpy8ZNdX8CfEl1O1V6T?=
 =?us-ascii?Q?7+zNtu3/2a11kp3vGQnt7h0+uwU6TXL4r4EFvm0h//Vn0ezqP6kyepaG+b2q?=
 =?us-ascii?Q?UgkemHinDgnuGUq9FmTRKi/BCkvJQ0WH+LyUtU8I7KwnBvnjw5gldShpRA0H?=
 =?us-ascii?Q?HGmYNzWRCv0SG4NuTYEvPYP4AeppffHAH5fLhUGUKAFKkAOKpv32qdBi14J2?=
 =?us-ascii?Q?AxgXBhCQXGdzsHXP9MF5r92xYst/Vwa+lEMe8TNaZ/38AH0sLBzXcomPF2bI?=
 =?us-ascii?Q?hSHgqGkoW43VcAb2xTHpYcqvJ92qYBUAwZm+2/vlW5kVdGW+xzj+4z12M1B/?=
 =?us-ascii?Q?0fMtxJodt4O3aAal+IfUgE6loik0AT3JvlbmL+fdVvrcbJ9xISUKxMtkkPGa?=
 =?us-ascii?Q?eG+1c0fElnDgCELqvKLYWYQI9D7EvQjkpwqB8Z2yzhJvdqJahLDF960RR7b9?=
 =?us-ascii?Q?Des5huBamVYsHgrhJg1NnweSMqJgt5DUc+OJ0hwiU8mphupui9TaM2Fv1Syf?=
 =?us-ascii?Q?4UyjekKxK93ZKBc5ztwjCgDIxF2W1FU7NaX7TH+3dJ7XW5v6OxlTK29ZyAb0?=
 =?us-ascii?Q?LXjOWOdBflBjQQik8Aoih5RycS9mdWJ695yLDZ92nX/3BLuKuTbuDg1lbtYm?=
 =?us-ascii?Q?OkAmXnUsU60yUogHmddAYUMqyWid5kA7MYFaee/uM7hUDZq6mmZuozL0WlvG?=
 =?us-ascii?Q?aYF8nI/tO7kWaRZyUe3kXXD/fq281mOP03Bwp39RmChPfA39PGsYJuB7mXCj?=
 =?us-ascii?Q?+kp0POk266vHtzjQrq3zCpKpOkNwihz3dt72WVpo5v4n83ScOLciNRgYizVV?=
 =?us-ascii?Q?euKIOJZw27XZScQogqOi9uq+tXMAk5acpo3e1PMjSF1ZRM8dQHwDG2VohKrR?=
 =?us-ascii?Q?MdZm0iDn0i2kbhKARX3MMZtSjIFTqRhJtSRu+vTWOuhzZSJ+6BW1Hv4OHeT3?=
 =?us-ascii?Q?+KGmaXCTB1V0l7+3Iq1gFoUFrxcugBcloYHdD4hsRjLB+cfF+4PQGYx7k7jf?=
 =?us-ascii?Q?A8vT7lH2sBbfwHwUjMWNKvjrbYDR3lsXVeb6iOUOwihGry4SdvTn5gNvuWQB?=
 =?us-ascii?Q?y92OF7JWAJMywlBHSrOODvPMmGjJnMci59iO0rOUS+K6+DYbM6u0b3sqPC5P?=
 =?us-ascii?Q?SfpzZjMLGfxywcZ34OlYg+Ltzt2PnxiPz1t28jQ3/ReiXHr/c+kPHAmrBziv?=
 =?us-ascii?Q?PDOKfVNPaXlerDqDCghemla1UaZ3yG683qWQKd9MOAVqT4O9xiuf6OJIkQIC?=
 =?us-ascii?Q?zm/VKcFsxYHvgCy6986vbTjhqirEACiCA6SpuoJS9IjJOEI/NYiPV8WSc/YE?=
 =?us-ascii?Q?X/yUEK/sp7G03A5Edr3zWbFdkXPrYQUCl4ewWfjFBEpSJ2gVVv1EuL92+Pyh?=
 =?us-ascii?Q?Q1PldyItSeHrZyCljnwg+Wx6VDU3jeS7XEC5hf7T2tCrMQYF+eLvGYsxgy78?=
 =?us-ascii?Q?l5+YjQ7Gu0Qkm1YVv635qNjwbYNNI2GV/LwJALcqVhv1MAPWCutSHldm27HD?=
 =?us-ascii?Q?sJlx4i4DTt0U9D3DQBn1MJeNQR7gl2yCrT7AY8jKHW01FmsQo6HCnDXMitUA?=
 =?us-ascii?Q?QVLrppkcVA56734fxZXW/6+Ps65lH+TdgG/TIMnG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baceb71-e9c1-499f-343e-08db4c8e1eba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 10:55:48.7616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSe1WoR+CAtL7S5pArXtYUwCD3730i4A9+m0TCQ5k0Xe4ad/A0FlPRT4/D5vhH2yKNtBhqyNgBiiFaLxz1JahqmtUwqET6mXMjNOr1cIPDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5696
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, May 3, 2023 12:13 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit=
,
> Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>
> Subject: [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
>=20
> add rc6_residency in ms instead of rc6 residency counter.
> Handle wrap around for the counter
> The counter can still wrap as it relies on the frequency of counter being=
 read
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++----
> ---
>  1 file changed, 37 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
> index 231bdb45a6b7..a7e97ddd7253 100644
> --- a/drivers/gpu/drm/xe/xe_idle.c
> +++ b/drivers/gpu/drm/xe/xe_idle.c
> @@ -11,6 +11,8 @@
>  #include "xe_idle.h"
>  #include "xe_mmio.h"
>=20
> +#define XE_RC6_MULTIPLIER      1280
> +
>  /*
>   * Render-C States:
>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -27,8 +29,7 @@
>   *
>   * device/gt#/gpu_idle/rc* *read-only* files:
>   * - rc_status: Provide the actual immediate status of Render-C: (rc0 or=
 rc6)
> - * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
> - *		    Prone to overflows.
> + * - rc6_residency_ms: Provide the rc6_residency in ms
>   */
>=20
>  static struct xe_gt *idle_to_gt(struct xe_idle *idle) @@ -51,6 +52,35 @@
> static struct kobj_type xe_idle_kobj_type =3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> +static u64 rc6_residency_us(struct xe_idle *idle) {
> +	struct xe_gt *gt =3D idle_to_gt(idle);
> +	u64 cur_residency, delta, overflow_residency, prev_residency;
> +
> +	overflow_residency =3D BIT_ULL(32);
> +	cur_residency =3D xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
We shall use function pointer here to get the residency, so underlying func=
tion can read from
appropriate counter and  abstract it from sysfs show function, same comment=
 for converting to=20
ms as well.
Br,
Anshuman Gupta.
> +
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around
> handling
> +	 * Relying on sufficient frequency of queries otherwise counters can
> still wrap.
> +	 */
> +	prev_residency =3D idle->prev_rc6_residency;
> +	idle->prev_rc6_residency =3D cur_residency;
> +
> +	/* RC6 delta */
> +	if (cur_residency >=3D prev_residency)
> +		delta =3D cur_residency - prev_residency;
> +	else
> +		delta =3D cur_residency + (overflow_residency -
> prev_residency);
> +
> +	/* Add delta to RC6 extended raw driver copy. */
> +	cur_residency =3D idle->cur_rc6_residency + delta;
> +	idle->cur_rc6_residency =3D cur_residency;
> +
> +	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
> }
> +
>  static ssize_t
>  rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *=
buf)
> { @@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =3D
> __ATTR(rc_status, 0444, rc_status_show, NULL);
>=20
>  static ssize_t
> -rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, ch=
ar
> *buf)
> +rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute
> +*attr, char *buf)
>  {
>  	struct xe_idle *idle =3D kobj_to_idle(kobj);
>  	struct xe_gt *gt =3D idle_to_gt(idle);
> -	u32 reg;
>  	ssize_t ret;
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct
> kobj_attribute *attr, char *buf)
>  	if (ret)
>  		goto out;
>=20
> -	reg =3D xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> -	ret =3D sysfs_emit(buf, "%u\n", reg);
> +	ret =3D sysfs_emit(buf, "%llu\n",
> +DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
>=20
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
> XE_FORCEWAKE_ALL));
>  out:
> @@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct
> kobj_attribute *attr, char *buf)
>  	return ret;
>  }
>=20
> -static const struct kobj_attribute rc6_residency =3D -__ATTR(rc6_residen=
cy,
> 0444, rc6_residency_show, NULL);
> +static const struct kobj_attribute rc6_residency_ms =3D
> +__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
>=20
>  static const struct attribute *idle_attrs[] =3D {
>  	&rc_status.attr,
> -	&rc6_residency.attr,
> +	&rc6_residency_ms.attr,
>  	NULL,
>  };
>=20
> --
> 2.40.0

