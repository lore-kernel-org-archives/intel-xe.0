Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB4CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 06:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EBC10E11B;
	Mon, 16 Oct 2023 06:39:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DDF10E11B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697438375; x=1728974375;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a3w4hfbobybvXzuBZziN17vvtqSC0raez4fXOerkzOE=;
 b=D3E58hBBt6Jpgwp8WPCFEFk08KUTm+gwPrCT5o052I5SKHoJNuOAy7fe
 1Q+AEVIf/ZO3DbcJ19NWILF2hCUcPNyEhXNP2Nhb7jceA4TZEAJ2u4YHA
 8xdciJybeQ5AL3dwLtmkNWE63UUK4yXvkxU1JY6m6bufNqJsoUmvt1WJ7
 PkjmRVZHcT9W8/hEg6vHXTIWrIntYbJCfZclfXec+WeLoR3O0iD8iDTgV
 DSXY2TexKTHXUfLtZkwVLrWOT5U5aylXomBrzaydtAv09RYANqzX7t82V
 439y8IBbyDdBuRxa+Kbp5+F7vRsan9Lv0Xx+4aE054TEsU/f7quvQeWGZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449663710"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="449663710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2023 23:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002814538"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="1002814538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2023 23:39:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 23:39:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 23:39:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 15 Oct 2023 23:39:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 15 Oct 2023 23:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlseFs8j6WZQ+o9+obt/5rS5n0tiTFW6C+UXX2L+gXZtf32/hzqkEBc1gSj6kyNL7CDVf2k1YwOxRq9zyq5GIiAS9IVi8G6LkABz1KGWg7GVN6So/PMiA4ICe0BWS+w6GHAw5kkbo8LHFn2Mr4AeX6tD1D8VYpW+xhiA8YA8bAtBzE1eH0HKAtRvIIDaSlVR084pFSqvCUFI6J+hhN2ZXYdjbdTBuoFqRZIxwTT/8JUb3yANUDnpplg+CeIZzHIF2ZCqXbtoK2xNTtIzeUKbOyAqOvn8+oZtPoftXwcBcdZB5eDwxdiC47JV5eF6d46JB7G9HBzCWTpvNfb6hMQQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJEYOhmGZqvpTs4h5vcm6Xsf9yEYEqAx1P1000Symdc=;
 b=XPhcbmoQk7GtJcHxdB9Tib8KkXdEFhPHHC8xO9AhSUwVRc3TWjaHV5zicHQv9NSer6FYRoOKgMXdv6cp5eAD1SesXF7/HIzO9tvoRsjjHpzrsMtLMaXbpZnG+/3lCEyIwwalb+iWsTi4qVh8fEjMnLsk9Ipe0wIBoPPthMAonPmNRRLG8lGwqGZjMFkzFu23Jlp9H93Y5dw0sWZHbv8XcGwYXO37/VVHLdbFlfnLf4+vJN66EgylBv3tRtfYaEAQltk6PYUBsYVY+LHFtLCxoclsNGz3/zRV48HaNNUFSW01d247lemoayZaM9gJKcw2RWdQMLM3frgyeYWYlMrIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 06:39:21 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75%6]) with mapi id 15.20.6863.047; Mon, 16 Oct 2023
 06:39:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
Thread-Index: AQHZ/ZdKxijXADyk5UiYLbJuR5p4ILBL86QAgAAIDxA=
Date: Mon, 16 Oct 2023 06:39:21 +0000
Message-ID: <SN7PR11MB6750B55C67F04E7A8DFB7823E3D7A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
 <20231013053455.835094-4-suraj.kandpal@intel.com>
 <SJ1PR11MB6129E607F1EA4ED73B100F50B9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129E607F1EA4ED73B100F50B9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB7787:EE_
x-ms-office365-filtering-correlation-id: 5124b936-1085-4ef0-fe0f-08dbce12a12d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBkJKFqy4Kvf5YD9am8ZQypq1LxJIXGMdojDS4m+DNhGLXTPqQ50kZ5rgg1nI3t36xY76jdPv0BbM8ZP5ppC5zYSCofTq0jw6Gdo+APze/WYYW+VHOxopU7LnlkNoz/WVXi6XhdkTU77N5ddt4+KIyBU/Ujy1R8ox7/gpqQpX3S11grEBk1+gqb/3J+qvlwPzGqVXLtxihLlZ1ZdHrw1ybQendKXkvGNPzK5ERCvwGdN0PFpZvyTpk5gcWgaCvQoymT1zn53T5ceZWOVeeiBjbzInbyY87HKhUKtya+5JeOzfJSL/X2TO4zHw4+Ywp4oLwt9KzitPd3wi4IjStCzb7XoDdXaz0LoQMShRrhH5FhB+t8DYwoP5HcSwAPUHeZqzk7TrSBXlP8JQv7OfRbO1GJIuJdYHYFTxj/hbC2pLcd76iq6ApCVZDnRdvve5wRsURoxdGnjK0rfNZF9h3a483JMx9UmAakxwMNRmEdfuKinB6kf3x/fbyDolSXrzI4+370/h0Y/Ix7tHsSS+n/QV+7jcbSF5bkBo/vc/ou0M32G6ZfOqI07xUX9X/onINHwLZzKhhOONUWTqTFvBxBekqiwfpwu6gVjM0K2wT4+faeulJM10TftMKnPe7DFJXPV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(66476007)(66556008)(66946007)(76116006)(64756008)(316002)(66446008)(110136005)(26005)(7696005)(6506007)(53546011)(71200400001)(9686003)(8676002)(8936002)(5660300002)(52536014)(2906002)(41300700001)(33656002)(86362001)(82960400001)(122000001)(38070700005)(83380400001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?paWPdNXmRfCuzlJO2582e45IbiWmbTnYmQnOq4OOPpHErwukgPX0INeuJF/J?=
 =?us-ascii?Q?Ll4dIPhjtoxhK2WNEM8++ynefZ7cjRY+Be4wMH/qvpnMxuLsIpvlyEJUSN9z?=
 =?us-ascii?Q?ONwv3+5PqNUDIN5BNXU2DEWEALHRjp2cfHOq0Wj8QGx4HR3Ds6EcQo938OVh?=
 =?us-ascii?Q?IB9y5A6d9WxLIqB14vTThcfGC0hVHryVbaORpU/xQFRvQh2BrNS6qdggLDUA?=
 =?us-ascii?Q?yrWQ4pCUS1rXssWeEOSzc8dJ/POc8dyXi/sF0JUcFQfGVYpeCI9QncQt75tF?=
 =?us-ascii?Q?enr2eiDxG3StykOq9mg0nt86FxTuX75yCQdJdtUTkWvrP2BkWEZpPq05YOq/?=
 =?us-ascii?Q?bjKS9YT0S5m3Tux66BCGmeGfPUn6FeOJ2QirmhBI5Dxa98DnqCZkbPXE92HJ?=
 =?us-ascii?Q?O/9+78UPmEtz4hQnSWmvFb7zd8Rv5LOQCuXK3SdJ/idFJEIqY/uCT5nxfh32?=
 =?us-ascii?Q?XsId5de0i1tA84QX3VFHC6mcczfaAFLOa9+MKVS4cbI3XOCjSHNn9LDj+9qS?=
 =?us-ascii?Q?IW4T0fWFTeuwR0VVgnFPtGVbHb22K4Eq35jTrxdWptdDR//1MXr84+WxUXqE?=
 =?us-ascii?Q?2SVtBlN8ECg3TB/dqT/b+qUh+rCBLzUZ1YMxsdiick3CiFzchH8e0B5jyR63?=
 =?us-ascii?Q?DNSX73GlzIDIH0eRZ3vlTAjN43x26TUaeda4CGi4ojVWqChAQ9qPT9duDFhJ?=
 =?us-ascii?Q?kepu0NyP1bZCt8I/zlBsdcBD0AECjVYfli8PKIVkE2VRNBudGi10J8ng6cg+?=
 =?us-ascii?Q?Jkm6zm7EGotOFWhlQzo/eeQsbffkJZ5Ulwoyz/juzrq2qL6oepg2PtyAItVv?=
 =?us-ascii?Q?ty45HlExHse1h/f5HpSmg2zr2atXrpjNzUdZO8m1tl40YJwlJJi9QLsXsKdg?=
 =?us-ascii?Q?1KzkKXV860o4xUKG3sv5c1prPxGqZ+H6YBDvb7OxWpGeYvR4UncHCB//XMKL?=
 =?us-ascii?Q?DZhwaD8RH9tvniZ6q/pd6vu7gs8oOMKi2PFY3og75eFWwGISYjiiOWD/00hC?=
 =?us-ascii?Q?lk/k/BArVDB9CiEOiXCPzTCvWGWHJYBuYyT9NdTHFRgw02yh4DpqhBXEQqiO?=
 =?us-ascii?Q?b562XTKNHq/8sg9XpFkcEEl2aXhuzRmL8bLKOcpNWHtGlBJ5Vp2mkYBD4Haa?=
 =?us-ascii?Q?9dbbLN8+4oXCsZcAc6ULmopuWTgLjCMRZda/oUnafe2EEwObGPh9C2nh/cjk?=
 =?us-ascii?Q?Yj8J6YFE4RuQ7BeQgdvQ+2y17WpUkw/IjDSW+CCK/Y7G3Mk6UUfqKe3AALWD?=
 =?us-ascii?Q?lCuW7743eToHaZedEWKb+27yAs5vZRrxNNFt9Sppc8O6augPUZTQtJddxtIR?=
 =?us-ascii?Q?1Vwz59hWj8tvExtpYvqcyUmmfi54f1SsBtvnsACo3eJrNqSAqR6zKENc0a73?=
 =?us-ascii?Q?cV0CnZQ1k4/NHmhR4dsCTGlPg0H8h+cekq/DL0dKVqVUZVv2kBGvS5LiwmdQ?=
 =?us-ascii?Q?kRfatlLTx6DGCtPj4LBSqIVxQMIBVuBb0iWbj404d3rcuWwYrJP9UL5CjspN?=
 =?us-ascii?Q?2unql4V4Jj7K5CWL2dO3nlJHewwNI/9iGMRf9239gaUndUpRHn9DwbWFdVR0?=
 =?us-ascii?Q?Kl5bvSVrNct330oXt6fh7HaW8Md5AvC04ELg6T0U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5124b936-1085-4ef0-fe0f-08dbce12a12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 06:39:21.1894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVeqtt4BqqgfNLD2hZAQ+Pm7wDfR76/5c7wNZ2BfWsAvsD6MRK0cy1c+WBFDiU3l8KDPZIIhvk5oKqlBciSktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Monday, October 16, 2023 11:40 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org
> Subject: RE: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
> intel_hdcp_gsc_check_status in Xe
>=20
> Hello Suraj,
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Friday, October 13, 2023 11:05 AM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
> > intel_hdcp_gsc_check_status in Xe
> >
> > Define intel_hdcp_gsc_check_status in Xe to account for changes in
> > i915 and Xe.
> >
>=20
> Can we add the reason behind returning always true in Xe in the commit
> message?
>=20
Sure will do=20
 Regards,
Suraj Kandpal
> Regards
> Chaitanya
>=20
> > --v5
> > -Define intel_hdcp_gsc_cs_required()
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > index 0453293af8ef..0f11a39333e2 100644
> > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > @@ -6,6 +6,16 @@
> >  #include "i915_drv.h"
> >  #include "intel_hdcp_gsc.h"
> >
> > +bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915) {
> > +	return true;
> > +}
> > +
> > +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> > +	return false;
> > +}
> > +
> >  int intel_hdcp_gsc_init(struct drm_i915_private *i915)  {
> >  	drm_info(&i915->drm, "HDCP support not yet implemented\n");
> > --
> > 2.25.1

