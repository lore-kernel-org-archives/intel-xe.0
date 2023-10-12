Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B568CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2726910E4A9;
	Thu, 12 Oct 2023 10:34:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA3810E4A9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106838; x=1728642838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ea69mMrabIwsN8C2eASDo997WjGv4cK5UnaG0leaq8s=;
 b=QIokndY+g89E06zO11hQGLWIkfkKEdTg1/KZeRsvoE7SUwtUUXd63UaK
 i1QrMQt9S2tff8eh2D8ZmK/cccsJH5JlLg8NaMRpfX+XI3g+jKWjvIWOC
 XDMGfatQzm5RW04PwBwTgipbh0MaboIgKTlqnOZnpd1MajzneVhILtTlt
 lv885u/HzwcZYFNflMApGfFbtnGYjVidlqs7dgmC42X0jPWpuNBLubocQ
 Zw4y8mk7Z2mDYfZsn9zaIuyWkLyi31KQyK99eSqXc6r/J3abTbfwOXnZ5
 gGLuIm3AB77Jp7w/DxMhHOwlCrRWUYzwAvNIt69Dbo9u1t4zf/bMz1I+w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="449074836"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="449074836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="898043054"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="898043054"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 03:32:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 03:33:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 03:33:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 03:33:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 03:33:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgxpD8aC+XeD4IMbAvEIA31QGzMmoy8p7Q7giUnh6C/ZFoZgXfoIEaFyOkQr16i1Rz7actQP02Ar2Zcn0Szr21K4Qya8Qzp39fqjo9eqCavrr6QOcmA6MiaklkKpkVtjENMV4zAoTx6vbmzfCmazWAoOY9loS79b9tMfxzhdnTXWveNNTfCetESzAf7MbGwKvuWUjxZ8exVlMcuvBGvr7E2/GFGm+xC5KeSB1RMClrOCMx7hZifHntOlCT4MQtRPGHWcZa7czLMNA//K81173RAj0AWAeThwEv9lFe5S7kthEXvx2QH9bLWgIjQMMmo+A8tXtgejOGWbTDECqwmHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPpPzlrbLE7rZqdFH/pCa8T5Ri28edif1MK7INcoZJ0=;
 b=dK14WT4wBGhzzeOM4sudWZeMmbCBN+ZFx8lDUoCpEpY8292+vgbA6YLPq4x/n5QUGxYBOfOV8YOwi7ZGmYi3aTPufnZfVdwGWLFnRk5J6Bkw+p32jBiki+hslfB7DsWi2NXIstUXrAqYbYpX/bB9bHUhaTa9Az2oW6ePk6aB0lnbq8XiOYxnhqv/+ZDXU790qNRNzPETiFJVQyIbt1cOZDhbhYKmYb+qAz6Y/egSvxgxQ1O+A/NaOoKKnS68rwyivdHj7SYxqkJ+EpsnqRCMnd78PDOxgXV18hGaMh8CRMmSU8ZXjo1zBUH3+6fAev7PO2TVutC1Tqaj2LGejuR6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 10:33:52 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75%6]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 10:33:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v4 2/3] drm/i915/hdcp: Move checks for gsc health status
Thread-Index: AQHZ/PbVj+MMzgdD5EuG0hT0AFrhkLBF9NCAgAAAMRA=
Date: Thu, 12 Oct 2023 10:33:51 +0000
Message-ID: <SN7PR11MB6750707A25BE07DE74EFA89AE3D3A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
 <20231012102622.810974-3-suraj.kandpal@intel.com> <87zg0o168e.fsf@intel.com>
In-Reply-To: <87zg0o168e.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA3PR11MB8118:EE_
x-ms-office365-filtering-correlation-id: fd74b5e6-763c-4a1b-c211-08dbcb0eba6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8VChyYXUxsjFLai1/tvPA/xjLMAi6a4TbKf3OQeKWj175oFtiN3qHxAuiFfAwoC9Ugrd8cOcbbHLYFzcwrWL1HyFmpGX+dpZbvovQx0qbtw2WRqWS93oAzSHrrUyEObDCI1/dZUV+keykTTf0GRkM73r52wZd3WSKXZgIVYIoba4LuHB1NFCXuu7rzbLmHY+eXljlFr0jnnFF+iimxAaP0xEm0+HWDFgg7mzszuKyl57eoUSzfjM4gcveMs/V2v3fBAqX4QS4H82vKn3xIA9gR2LjTOvVfKk7+/457zAraFEuEcFF1vxIoZ00BDjkzAoyDYZoiBgbIwjIhpjWiXPtAcOVVHZIdSLUfO4Rl+EVDwfdm10hODSaDNwGd/HgttrX8dNW6bo5Mn38B/pkrAZibFrfTQtLDvj8/SvIjattOWTn2cZDKD9hm5ZiRmtz4qA7bV1PQT00nJ67Sls5swkgbKnP3sxPUFE3j+PvhH9CLj+o9jn8aqfb0lYfAchW5Vxe+0sCBuDN9f7NYoAMX/KvmoZhps1byMyY/NpY/6NfhSVshL6n77Aiq9PPoQAw9FLLk8haJojL7m3MvomPYp11fXrIVxzYKbCN7/QZCH0bcg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(53546011)(7696005)(508600001)(9686003)(6506007)(38100700002)(64756008)(966005)(76116006)(316002)(71200400001)(26005)(66556008)(66446008)(66946007)(66476007)(110136005)(8676002)(52536014)(82960400001)(8936002)(4326008)(122000001)(5660300002)(55016003)(38070700005)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XMG2CfLwKBlXuzQwbINCfQTJ2AHgXuDeZm41/YwA7HWCo+H56U4sn5gdQ/tI?=
 =?us-ascii?Q?vfS4suFwRD4lod3svMkLnYswRSOKnTJB2rzuUMoFRqy5x8uRYwsBMlyFgHqy?=
 =?us-ascii?Q?W3C/QO5uXCVF5t8yc+hO/go2AAGpe5J72gVGwAKLhtFVQHGLgTQs2v5DFUmW?=
 =?us-ascii?Q?icqoQTDG80XzoR/FurcROnHcnqonF7eR5lYRk+4ACr/rTK5wk/E0gaDu/U1+?=
 =?us-ascii?Q?kO61h3QMkvUJSb5MDefPN3CsgfEs9l8sKCQfJ/Wv7ntRJIzI6VQ+qQrHtmS5?=
 =?us-ascii?Q?8jXlTKVwUmOjUs43QJ288ejUWNeDqauXaWjWDHf1sx9oQiSngjaWQtWjrO3D?=
 =?us-ascii?Q?5FyJpl3Fpx9PoybZKFcAUaq3OGsAJzP7+uVr8dnNyL2hDPwe63U56IOwlHZ0?=
 =?us-ascii?Q?IlKXNLtooIdxGXT7kpjcyaUGT67NwVfv3eZOXZqC/MT0WdqNgIr3k587N1BQ?=
 =?us-ascii?Q?2aswdbM7BhUQxUqy7cbOeoHCem86TWS1Hjn8aMe72Xntn9QtTWgEr9ru+hC5?=
 =?us-ascii?Q?GkqVmIevAgDG0letsW3yngEtb2bCzy0wCdL1gistxiHp0oYO5pK58r/SssP4?=
 =?us-ascii?Q?B/awAfUNEL4DVhgjk7Nqb9jlw5/gSfRSHSZSP2YpgZRRzvl4LohwpUKXjOVF?=
 =?us-ascii?Q?IXcT2d9v3sRO1o6JOrR0uLcwhF4gYlcUzMUqjAduoAOsxffPTR6Xbjvdx4/M?=
 =?us-ascii?Q?oL/zMYhXZ2AxRkz1YKMI4n3AH075N0JdLWjMIiWbV5UwUfU9E8dztb9IC4Yu?=
 =?us-ascii?Q?0eAgim/bd3Xxtz1FDO9V9WiAzJTHMUEvu1SxkPSQx5dZM1tIyIcH1BDxsAf9?=
 =?us-ascii?Q?4C5VrJ+wn6Fewj6FSVQ2rGydv9YeSiF5ijwhb9QFGqRUlYNw1MSffOJtAb5X?=
 =?us-ascii?Q?Ja0KrqXISfAwXY/BMD0YdY34sN6hgJbeGyDkgQ/wfPiPQmZlKGHarhW/Dqba?=
 =?us-ascii?Q?tZ49BtP1Ri6V5524wnEHef6gqy9qpc8e/dGBrd/RDHLBzvhjBPN6dLILFGpR?=
 =?us-ascii?Q?epqa0QqbpCNpf93Zere82WO/lyj9rCwnOo/wmX9dtXuFJGdn0panex55eumn?=
 =?us-ascii?Q?JAAoSTZK5PkJnoGsMI5G0NNnCjQhwOkWXwBna5Rj43TiVd4ohcYZtA4Pojdi?=
 =?us-ascii?Q?T3sxy/RNeNnWzQgLpm793kQgtq/FuDMoJSiGQnvnHOtSyetE7r2yl6ck8Ojb?=
 =?us-ascii?Q?CZbZRUlRTWZKDDt0wC5FYIxJgrn0vOPufnyjhKOmgVUCeDSZnpwTDaYhWt9g?=
 =?us-ascii?Q?QiCjqYEqienSRWRXIUG4ULob36IIdJfnagE17DAtgIsD6mxNfnf1+ukdLExb?=
 =?us-ascii?Q?JA4GaTtzR26+DlFcnPn5tZvLC/EIrMXAcGNGystQql+kjzRL1y6XS/ZnAGA7?=
 =?us-ascii?Q?n3oXY+GNrrEbbR0Sm9Dcqr3ISamW2V4eTUa5dyVCAr+D6+Dc1/KPXnL5LXTo?=
 =?us-ascii?Q?lBzLqDmANIDUwiCqCbaCYbGbcMu4YEPwTZzLEMh99vXT+UYuGaZtS3ghNH9h?=
 =?us-ascii?Q?AuEpNU450QzSGnD4VXzPJ/Uv1zXgwiDzCIFXEw/aoZ4dX45xt7+HoMAHcdC8?=
 =?us-ascii?Q?FXlReXSAPhaNY5c+f59/66RIPJmVyGrr+ANvlHaO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd74b5e6-763c-4a1b-c211-08dbcb0eba6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:33:52.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgpWBmDmH9mfqnUXd2fcBx/2VRstHN6OQFCGVoOcjZxyxv7mYMW7xHceRNVE9D+UB4rPymY2UDNHnE4+4/b+5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/i915/hdcp: Move checks for gsc
 health status
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, October 12, 2023 4:02 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: Re: [PATCH v4 2/3] drm/i915/hdcp: Move checks for gsc health sta=
tus
>=20
> On Thu, 12 Oct 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Move checks for gsc components required for HDCP 2.2 to work into
> > intel_hdcp_gsc.c. This will also help with XE refactor on HDCP's side.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20231009095537.653619-2-
> > suraj.kandpal@intel.com
>=20
> Backports of upstream commits *MUST* have the cherry-pick annotation.
> Otherwise this'll just pop up as another commit that needs to be fixed be=
fore
> we merge upstream.
>=20
> You'll get it with 'git cherry-pick -x'.
>=20

Ohkay wasn't aware of this will get this sorted and send out the revision

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
>=20
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     |  8 +-------
> >  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
> > drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
> >  3 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 8cca4793cf92..c89da3568ebd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -173,14 +173,8 @@ bool intel_hdcp2_capable(struct intel_connector
> > *connector)
> >
> >  	/* If MTL+ make sure gsc is loaded and proxy is setup */
> >  	if (intel_hdcp_gsc_cs_required(i915)) {
> > -		struct intel_gt *gt =3D i915->media_gt;
> > -		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> > -
> > -		if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> > -			drm_dbg_kms(&i915->drm,
> > -				    "GSC components required for HDCP2.2 are
> not ready\n");
> > +		if (!intel_hdcp_gsc_check_status(i915))
> >  			return false;
> > -		}
> >  	}
> >
> >  	/* MEI/GSC interface is solid depending on which is used */ diff
> > --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> > index 4ab640b4e7ec..69af416cffe6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> > @@ -12,6 +12,20 @@
> >  #include "i915_utils.h"
> >  #include "intel_hdcp_gsc.h"
> >
> > +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> > +	struct intel_gt *gt =3D i915->media_gt;
> > +	struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> > +
> > +	if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> > +		drm_dbg_kms(&i915->drm,
> > +			    "GSC components required for HDCP2.2 are not
> ready\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  static int
> >  gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *d=
ata,
> >  			  struct hdcp2_ake_init *ake_data) diff --git
> > a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> > b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> > index 704acd3ed46b..dcbf9b0b22c6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> > @@ -26,5 +26,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct
> drm_i915_private *i915, u8 *msg_in,
> >  				size_t msg_out_len);
> >  int intel_hdcp_gsc_init(struct drm_i915_private *i915);  void
> > intel_hdcp_gsc_fini(struct drm_i915_private *i915);
> > +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
> >
> >  #endif /* __INTEL_HDCP_GCS_H__ */
>=20
> --
> Jani Nikula, Intel
