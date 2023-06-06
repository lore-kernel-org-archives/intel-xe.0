Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D6C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0110E145;
	Tue,  6 Jun 2023 13:28:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F40B10E145
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686058100; x=1717594100;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2arjcT+FDnkYyYlBcZRNk3reCsL5qWFIHv2dS4uNVT8=;
 b=cUeliUy8e3tRv1sD0pAJoYRC3ms+/eyBixL09TCIEzu8HO9+tmrNMIqJ
 vfj4EvVF4WseL+bolNc02sv3hWpSZ1AowEOUVpLXD916bRaFpY6BTWvur
 SGT/FmzWot4ZrHWevk374YjEZLmwBtRDox8s2Sd8nsckRerRihQxm1C2v
 8auEECDCPqceHuqkCUW3PKALIvzERhgntOFVgMj/qZXgzFFhsfS1IxKbI
 lhbenA2iThyyoNY1saQndDOyzsBDc1TL/naI7wE7Xjf4x7f4zpAgoULkr
 fDM1bkavI3fLFn6r9HNJReLFh0SjNE+5Ee4jqnRiJBNT5Hw7cPvKilp+T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="337022665"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="337022665"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774121154"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="774121154"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 06:28:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:28:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:28:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:28:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K16VBRBz7gtxxD3e8gFOOAeUZNHEKAprKuGUt6ZwijQ7MZqoGrkw5O9kqkXlxRwcmBaywmpBuTquu1yTXxZvKczYge3KuuHP7FrKI1lAg3YGIS9xLE44NN5muHID69H2LzvDn/eD/JaSgH5+xCuCpWvgyKLbolYm3jXMVxFrsI5CL31j2Qikdg4J2bTbSDdrT+BZWjnFb//mOtaFQwFJfA2TiVciOGcX9q96tWzU0+9rrqZOFQMDnCPGnNfD7aTX0oFtmOgjVGNRJ0JlP0oNaCrohhzocfGNXtkZGbo1S3tgRpx3COoW8CueB+2yPnoN++xuIgc5TNfSBwgvD8X2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaSo5fhwFVBn3oF3n08luQFV87Jj8qAa7QfsZQ/WaM0=;
 b=feTdVTmVJ1QhsB/dpQyjOgx1Ug4fGTu4ntXeIvVq3laqbx6dInW8ePRjTvm7MaCI73IJHP+od1p/Rm+pVnJmiZkla8DuQgqQdiVrBph9AYuBJVGMZ2ZHRT7EHSiXiU96vCYzRWDgJvND/jz4XESXRYcIQB1oo5qHjVinm7k/2eFcChBxNdsGdsHSMJ4jbhlnMJFRrFD6nZuLxslTvsigZy785SxOBTUgIH6GwGb4oYjTGH3J0m+gJVOWTMoCs96SoBTPozIj2WMUssI1fImq77TGjnQTFN1dUrV00ncyyzlG0hqoAZvQQDqtJA39xL1MEcUpc6v77BHIbEm873ZT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Tue, 6 Jun 2023 13:28:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 13:28:10 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQgAASFICAAAWnoIAABwAAgAAAQRA=
Date: Tue, 6 Jun 2023 13:28:10 +0000
Message-ID: <MW4PR11MB70560B02725DFA0385D285F6B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB62049EDFE0038555A7D2BFC18152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62049EDFE0038555A7D2BFC18152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6068:EE_
x-ms-office365-filtering-correlation-id: 9855fa44-3b96-4243-2c4a-08db6691df60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3uF9o9M6CzTkirN0sbduJmIkIHiS3zUsgECxKUvlkWvEQJjgix+gtrrpP9qkHbb+oq4tMfxusJpMvdtssc/+AIZ8GmeKWmt3GZJ9lmo/2wLRTsf6OwN4jsgfrgvzew4bDLN+U2VV9FFHdGigSrJULcpRfsackZnqdQWF/PwRUms2Sqde7x2WFZrSYQGUj0RmyLOCStQ0N47XQKaWQMxD7uHtMTZm79wpDNKbJgMivoZvtyxRwJ8FFTKwKOOPST5vROgce4NvEAegHWFEYfO03Nk7ZcMydId1iFYa0O9gWIfQPqltZ1byN3/Smwvj8sumdr+R5M/ByWTc3a5KKr/DQkruhLBm8JZ+7Z9OqsMcmf/mlHHKHKk7Vt5H8riqWoxKCG229Y13W4pG8Wyr4jOyFSqOek6pDiYGCgnUq1vseaG8Fk9s1Nb+k7t3FencUBGPnpDSlvZLWBH301nTf9ENALOAA3Qod+G+/BalUAcsyGWpZlSkqOVlw7i1yRsOyPxHFo/4AkoMzihNDwkLCq+a6Us8Hv/vidg5ghwKpJrEKcunMuEF7ZYb7q5RJPlnIwgNvymlf+PnbqhWfulatjKJdqxX8oOYNDMB4Xy5GBuyvWBxeJzcgOcoBudY7+mXEiEZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(53546011)(9686003)(6506007)(38100700002)(41300700001)(7696005)(26005)(186003)(83380400001)(71200400001)(478600001)(110136005)(122000001)(66446008)(66556008)(64756008)(66476007)(55016003)(76116006)(66946007)(316002)(82960400001)(5660300002)(8676002)(52536014)(8936002)(2906002)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Azq897eWKXqNH3uKoL/ykxytRW6nRp1sAWTxkSBKtDSxW4F4Ao8+Sgxnb1Fe?=
 =?us-ascii?Q?FF5hbEsyIvWZVi4jD2Q6at6Cqqvtbp3ya5bgRHkdYjxt/bUMCQIzFoDhqXnx?=
 =?us-ascii?Q?u/V0Bz5Y6lFtW45WS7QroeTYJMZSNnkaKfiyEwBfAPDumGGvod8hoLnryHGH?=
 =?us-ascii?Q?+d+s5UIY5BtJlVRjCPpvuFSYQZ6MEowvZGypUMDaqfLY9SBiQGvUEnCCRQTi?=
 =?us-ascii?Q?JfiV8f20UPA5YLoAKKDI9LJLxnXWCzWK3PUvAf+Z/eIEsJp+oEU6z5sbXiTv?=
 =?us-ascii?Q?98xZpHAaFjp+zHjHl4jClW9AcnqAck5sRxBuL3z0zfrmWTSO67T+kVurpzoy?=
 =?us-ascii?Q?l5WDldCN9P+VUhOoBMfB3Zg6rDhf+JFSyFBhXRCWxmqhqeFy/71yQN+vYp+x?=
 =?us-ascii?Q?DYyNE0D1k2G0A18hO+00s3RVtkThkxIuT2xrYGlrkX13wElj/8MCW5j9J1fS?=
 =?us-ascii?Q?/m4/FYtbyV1RMQS3BpayMOEuHGA+V+zooR3dSZvHB3h3ASFZ0w+fXfkkEbfM?=
 =?us-ascii?Q?WkOt06K5q9iote/A6WzR5XEEWDPqdyxIVX3PKGLgSYOTN0Bc77WK/n6Sr8bc?=
 =?us-ascii?Q?+B/k3guOQ+/OE3dZ9n0p/87Ytun94UlhIgMpx9r1lRvXV5wa/i4cuojgYfmq?=
 =?us-ascii?Q?LXP9b4t7dtxkaVv/TvT+/yLOm3rPoXBA374Z0YisIzBOVWpOVd94/sNWpqod?=
 =?us-ascii?Q?4x1cgocJRPhvXXZkuXEU38C1JJfAaL5V/dLetpYf45MPTuAmvqC4WbK1oF1c?=
 =?us-ascii?Q?yEPd2lE9Ck5EcTy8o2pKxRLNNC1tGnfKivki1Gv20WZwgDfYOKRFfNux3ePH?=
 =?us-ascii?Q?eLpnRd3CxUWZZcdkQFczeHgv8MnhLw7FDuDEmCZ75YdegHTEfyW7HikRmSwH?=
 =?us-ascii?Q?/PamSa7kwyYPoTCp8nSoGwV65QCPIbaG+B9EooPPmnyXEOK9od6Czlgutj+K?=
 =?us-ascii?Q?69vIoByMqHT5xe209vYinoqht5y+YmB3ThqByal7/W+gumoa/CIwWUEEG8Wi?=
 =?us-ascii?Q?K/qRfUQAwE+tDhVvWFjCqYvJe7/b/qUiJ97iEgF3wrWxZ5DE5t0TnOdLaM11?=
 =?us-ascii?Q?NGleEwKXAC8FC98KUnFE59O/Cn58zedIRfr3evXDTvGgHqy2zimoKXeuy+G3?=
 =?us-ascii?Q?lehxM/SQLios+sqEMjLPW2micDu1dOll4eWg4hqA9tAGGWUBdNfeObAwFtQk?=
 =?us-ascii?Q?42eKehsvBLd/DBeJk0KdEoX/TEmmHo/KfxjtZSMnBN87mQsrVJU6/1CXL4BG?=
 =?us-ascii?Q?usulBW7ly0tDrCju6dklQ1knVNi5ALiF3tjekRDy9wa0023ZJ0C1asxfA21J?=
 =?us-ascii?Q?x2lLtHLxXzH7mI8d6UAaM0jGfa/dzUrTlwt3hk0zSuxdjLAzgf5a+ubKae5o?=
 =?us-ascii?Q?73QfmLq6mSYO6K0Bx/EBOdhabeVy9pOwCvS6kdpLPfyFSZyAKookPfEBi/On?=
 =?us-ascii?Q?GS1ny8FQTTirTpDbnhISlWa0a9T9jOWWaj+EPAc8nMwNrFuuX7lIJpcpBFjs?=
 =?us-ascii?Q?SxEmGgXc5o5H1SAyMEmejXT7/UcQJM/Yu+JEf2QD/9nvtKNl0hGkI2YxwGAe?=
 =?us-ascii?Q?1v7gndR9LvdEzTp5xBnS4RJggZo64Z2XS86UmOVOC/quGJuqaKqJ5aYZefGg?=
 =?us-ascii?Q?jQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9855fa44-3b96-4243-2c4a-08db6691df60
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:28:10.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rysk4qt71XfBXo08D9ZM1ihxPr4Lt+xrMjY8Ay60sVT96kWiVg5pFveZds+ue3KyMy1lDJCRXFofTHOzlavUlLQhcns/cHrKDKeeKQW45o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 06 June 2023 18:52
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Sent: Tuesday, June 6, 2023 6:28 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Sent: 06 June 2023 18:06
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > xe@lists.freedesktop.org
> > > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > report per tile memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Tejas Upadhyay
> > > > > Sent: 06 June 2023 16:43
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > > report per tile memory size
> > > > >
> > > > > Add sysfs entry to read per tile physical memory including
> > > > > stolen
> > > memory.
> > > > >
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > > ++++++++++++++++++++++++++++
> > > > >  3 files changed, 53 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index db61da4d6212..7b5443aebd00 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > > >
> > > > >  	/** @mem: memory management info for tile */
> > > > >  	struct {
> > > > > +		/**
> > > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > > +		 * including stolen mem for tile
> > > > > +		 */
> > > > > +		resource_size_t actual_physical_mem;
> > > > >  		/**
> > > > >  		 * @vram: VRAM info for tile.
> > > > >  		 *
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device
> *xe)
> > > > >  		if (err)
> > > > >  			return err;
> > > > >
> > > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > > tile_offset;
> > > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > index 821bd49de277..d48c599e8cc1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_typ=
e
> =3D {
> > > > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > > > >  };
> > > > >
> > > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > > +device_attribute *attr, char *buf);
> > > > > +
> > > > > +struct xe_ext_attr {
> > > > > +	struct device_attribute attr;
> > > > > +	show xe_show;
> > > > > +};
> > > > > +
> > > > > +	static ssize_t
> > > > > +xe_sysfs_show(struct device *dev, struct device_attribute
> > > > > +*attr, char
> > > > > +*buf) {
> > > > > +	ssize_t value;
> > > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct
> > > > > +xe_ext_attr, attr);
> > > > > +
> > > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > > +
> > > > > +	return value;
> > > > > +}
> > > > > +
> > > > > +	static ssize_t
> > > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > > +*attr, char *buf) {
> > > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > > +
> > > > > +	return sysfs_emit(buf, "%pa\n",
> > > > > +&tile->mem.actual_physical_mem);
> > > > > }
> > > > > +
> > > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name,
> 0444,
> > > > > +xe_sysfs_show, NULL), _show}
> > > > > +
> > > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > > +
> > > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > > +	&dev_attr_addr_range.attr.attr,
> > > > > +	NULL
> > > > > +};
> > > > > +
> > > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  =
{
> > > > >  	struct xe_tile *tile =3D arg;
> > > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > > > >
> > > > >  	tile->sysfs =3D &kg->base;
> > > > >
> > > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > > +			"Setting up sysfs to read total physical
> memory per
> > > > > tile failed\n");
> > > > > +		goto err_object;
> > > > Will do kobject_put and return 0. Which is wrong.
> > > > Better to do kobject_put and return err here.
> > >
> > > I don't think I have any action to do based on error, clean up was
> > > already done. Am I missing something here?
> >
> > In case of sysfs creation failure, you goto err_object do the cleanup
> > and return 0.
> > Should you be returning 0 incase of sysfs creation failure ?
>=20
> I am saying it does not make difference as we don't handle err outside of=
 this
> API. So does not matter we return err or not.
Then please make function return void not int. If you are returning int bet=
ter to handle it.
>=20
> Thanks,
> Tejas
> > >
> > > Thanks,
> > > Tejas
> > > > > +	}
> > > > > +
> > > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > > tile_sysfs_fini, tile);
> > > > >  	if (err)
> > > > >  		return err;
> > > > >
> > > > > +	if (0) {
> > > > > +err_object:
> > > > > +		kobject_put(&kg->base);
> > > > > +	}
> > > > >  	return 0;
> > > > >  }
> > > > > --
> > > > > 2.25.1

