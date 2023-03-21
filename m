Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5259C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0310E265;
	Tue, 21 Mar 2023 22:24:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0BD10E265
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679437474; x=1710973474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tTrDVXghpH9SW0bbwFqicepWlVZBXsTeUyRhd+6gA8M=;
 b=ZsBY5IVSIN+8egyvadZpdXhghDfHiZ+XwLHCM0RD85KJcjgMSWjs98t7
 h8Mg0Mp/r+rZhIvYo4At74WmSeoFNBGshV1m3kwu4X+gWm9j4GkSfmLIQ
 4travq39rCQG+6Ub4Sxr6djfYVFel3m/pSNQiKh/PlRSVyaxxLLF4CQ4x
 WCMvc/sE/Bfxnwed9m/E2ltXBqKwCR9J9vYS6amBJjs9IrBcU3Mf1sS80
 u4E1KSclTtQOM7gWFG+G9jIW4NDxVsU3YZv3kqf7TxpIHkaafl+/mcesb
 xTdF6tB+QRGzbfBnRMzE3/bTIEhRrr6wuGIsPpNMg6AWRbfR48npCvXFZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339112781"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339112781"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825147467"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="825147467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 15:24:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 15:24:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 15:24:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 15:24:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 15:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx5wMF9E45hm+pBkQrWYzl84iQ+a3Kv0hu/4k8De6Q641qiWXIqp5a8DNshGuc2NDiGRyTueHGBAxxIs9G/XhzndiOf3Avdlq0NO8xjBcYiMu5JYTOGPhrA2+z6k4bmzVt9UZpClTB37dO6DX0mP/AMxEc2s1QFV0UwrYZ/23fEqUtWMMXDNCaaAW6qY0vbJWNUROU3bcMdOkpCeuXZGTgB31nOpXFgEmRaIIEdr2Cctur15f3+aYv+eh0ufBFPysm70rnkw2Z9+PiKESSxext/04dXCd99GBDm+HHG5e+17u0NfNZAKlgaiL/IbM+LVRd21MuUXLq7mJufmmySHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjvQ6rX7oPI03PDhy8ws9sSh6dcdlJLo1XwG5Gqnv2s=;
 b=J+6HOpaIF2cGoRk9wOg2A8sD2XzMlp2HJZiYzqFSbZ6kDm7FQ0vOUszUQwVENd5nTv+XjeI5XlkS5Jdra56kcZWM588stvH6BNTzHir/sbAovijUL3Un6TEf9Bcq1DsZO01lavog0kWxtpSt9hC60EgyPa5+CeBx+T0VY390zcuI3IfGtWw7fOGfCKLFRPNATVXOwIsPq2JTn8JvPS6dXd583ZQcbU8HlUjoO42Q7e7Vq7yTZdYUFF1M3dGicB3aswpniUV3BaspjYvlAQv5pAX9HhRAj9GiadNA7iw4GxBFgnHVVwdtk17vIAwSoS5xeiuoVkROXutPt2lcYRbC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 22:24:25 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 22:24:25 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
Thread-Index: AQHZW4aoDO34alaK20mRCTI4tiDu968FYs+AgABXZ4CAAAyeAIAACUOw
Date: Tue, 21 Mar 2023 22:24:25 +0000
Message-ID: <SJ2PR11MB7715ACCAEFE21E4288F9A230F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
 <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|SJ2PR11MB7575:EE_
x-ms-office365-filtering-correlation-id: 37d0d560-124c-41be-919d-08db2a5b073c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E8JcRLcQhMaKrDj3YMyZd5Gq9lEtMGdmv10rReIUw9cElLfJpaxhmYKvcsgusTDX9uh8MWjDH6DqyQuLB8COz2MCfIi7bVMWd557cQAcbu8wuhVWi4fKOKeqPTPTZUfmfr8pWLUgaZ7DvYy0MKVUuo/I6ziHOCR6xnUIQBocu6S8XysBOacrnZESqxGREDOsNL6HJvwc2f/SrHpnTv3v/uk1YDRrPcUHkrg27KHPXIRaZiVJk4lbXLav3dfr/Cr1yK1zFgybeQAWpUlUaW2zQYL5yiT8eWnOA7OR1FDQjdUaLNthrdJLKGbi3eDOsTW5/GQ2Gsc7Jsl+ObKolxiFLwPwp5kWX/B1b13aVMzTJlJ1IXIv23Pu11cibGO0NY7LriTTKZ4f+FviiCkERHjET8p/QFehQk00L2wHWMpShszuUX7WeCblyKdHqMtox7gQMqWTrcW3dNk6IrPklC76bmqQgZIKX13sRZZyS1jeS1RoXqetopTf/Af7vRKA6RQST355aMaT7JY54+FVH3DRwiIn78HDQE2MHkbVoiW//6XSv0ECf/NFfzwWwxNs5ikuvZK6GRmthHvR1mOeZSuYmfmsbw6Pfp5hkDc+9JBc6OL8BMIzoCZ8OmHvipc83+gZxHz4szyA3NKC+hSCziYSLLrVpDrmpKYBQ0Why59ZcRcpdH70CUtLxe7/OUznBGp/SuoDNrL2yqezxHZpNG3gXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(451199018)(83380400001)(6506007)(26005)(66476007)(186003)(9686003)(7696005)(71200400001)(64756008)(66446008)(76116006)(8676002)(66556008)(66946007)(316002)(6636002)(110136005)(4326008)(508600001)(53546011)(5660300002)(8936002)(52536014)(82960400001)(122000001)(38100700002)(2906002)(55016003)(38070700005)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HHn+o8QV3WBnDPUojWo7NwQTjgw03NrP194xu39eZGRwa57+aMgN37aEEq?=
 =?iso-8859-1?Q?DFOCsHThlN6Io2YX78VrsYLGbu/r1OlSHzzQtiSdSHqC5qBrXBx1rUKgZg?=
 =?iso-8859-1?Q?Yt8sd8Kd61CAzx+Dq6rYQ+jDHmtqD/S6xnv8XCm8tizFIiXxjBW/Bu8gIj?=
 =?iso-8859-1?Q?CLEGNKuB6bVcTjxfLzJvc6EFBKzyQ8fvqt8l9PyIX0/nUEoiF7B75SN92v?=
 =?iso-8859-1?Q?glhp868OgjeGqj/iE0jogaSGzdGR/rS+J6oLTYJHGn3XAetCvVTf3mpbto?=
 =?iso-8859-1?Q?fi76yXW4mjBCsUh+Vo2C/Bwpl9I+RADahvzH3J8sLSUX2PH5MQc736mlgK?=
 =?iso-8859-1?Q?7Czm1xYRydU17fWnmF+wS7N9yUn+GjC+ucGxhtf4pvrZh2R6xm471hU4FN?=
 =?iso-8859-1?Q?cECM4b98kynBTpjwR1jfsL3FtgHh5jWqo+bBSrsToKQlKJiD//kNck5h93?=
 =?iso-8859-1?Q?uryZYAE0gT3c8PsK0AK8d9LO/xRLxEWs376SvJVvwcsK1NJlfYHWJ1wymc?=
 =?iso-8859-1?Q?9HT2zGyicDi2wo905uZU6QWTQqsI2UmKhnfJW8jlv9cijyWgjdiBb9GXAM?=
 =?iso-8859-1?Q?32uuIYsOqOxw8ueJIDWWoD1qK6uRIgkllAg67XeqjiZ1mra6PSBmU9xCq3?=
 =?iso-8859-1?Q?jHRhQepeJAnZXUAHT0hcdjMxt42Adz8VBIL4Eito28FoxHW+1vDdyjHWwM?=
 =?iso-8859-1?Q?/lxrVzOklBeTrqwQXG7OzzxEo3t5kJa8Wtda055kPgeYDhfU12IeuEmolg?=
 =?iso-8859-1?Q?ieYDqM3SilxlK8md7KKgzA9pn7/nCibywyobQCbTdsxqi1+JDbKJDLSP5g?=
 =?iso-8859-1?Q?ob3CY+0PSzEjxoYbgvKalV4kUgiYb7uv9hsevuzZmuK4UUVrwE0NnT1dM0?=
 =?iso-8859-1?Q?s7U1GFcbGh6osIyoxXIJ1rwiUF0uqdXUgX7lzL1ayseQStT1YLLmswZyru?=
 =?iso-8859-1?Q?uhb6QuPO6ZbPrxV28txdygmFNB+0/TSK1ry6xinSDAC0aiqh9bzCwc0sig?=
 =?iso-8859-1?Q?L/bFn9LeZ0wob0+UxjPfu6djf+K5/ebqDeBfHmNVh6O4G99sGmHlWY8uod?=
 =?iso-8859-1?Q?8OWy5S4NA1Mc3ln87RRU+s3MPM0FGR/2OiurS54oKR1sZmkk9vOyCojHKY?=
 =?iso-8859-1?Q?/ly++nEA9nnGVlTObmlcIfRcmpgVaMc2TNi/Ep8qn4Bx1wwoajC9GVm7t/?=
 =?iso-8859-1?Q?cToy5xFkM74tCZ9RY9EHgIWcyhU82wncfcJLcUhd1u7ScPlTG4Xu6ymz2Y?=
 =?iso-8859-1?Q?Qak5BGx4VSAxlwhEwl/TKUyqQfHLaDktzEQJI5NJ5i4p/7bdzNYtMZ2XCx?=
 =?iso-8859-1?Q?PqNVNPiwsxqsYGI0DCUvDrYepRQsG0VesuptSJtz2MSndb7//AKfbw8K6j?=
 =?iso-8859-1?Q?lH5EU3hfeVXyS9PE8jFAB4GKelsHa7jW4TE5aTDODza31+EEw3VHsmEz5d?=
 =?iso-8859-1?Q?OsAfT7zvO2aOhaYLZk8EqyrxWtokXw/fV5EmPDWRWmCdln6QZBuhloTpa+?=
 =?iso-8859-1?Q?2+Fup5Ts1Cp3HxYwg7XerH8N3N0ptCm72BMvIOpUlhNOr9cD1KC1gug7gE?=
 =?iso-8859-1?Q?0mvXAExxzEuBurWwYlGBvaoSKZTN8I/0VaOA0yJclF6HleGr6OiW4L8Aas?=
 =?iso-8859-1?Q?4HHhcu+YISe7XnfhJHzAlTrmTjRpuy0uy/A11KxFuVJfKzII+jBKtF4Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d0d560-124c-41be-919d-08db2a5b073c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 22:24:25.4076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bsb2wUMI7k9X27baRK9PrAzJ5fuSWNF8hKMIVzwX/neGUyHQMQ1rFo5uDiWhDnKN/pLacE1HvrGpgIGnTMCHtxCTvJ2qGk1QJzNnRvRWm/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, March 21, 2023 2:49 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
> unversiond HuC
>=20
> On Tue, Mar 21, 2023 at 02:03:49PM -0700, Lucas De Marchi wrote:
> > On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
> > > On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
> > > > Follow the new direction of firmware and add macro support for
> > > > loading unversioned HuC.
> > > >
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
> > > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > b/drivers/gpu/drm/xe/xe_uc_fw.c index e2e5f7fbe9db..3c522d970228
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct
> xe_uc_fw *uc_fw)
> > > >  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> > > >  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
> > > >
> > > > -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> > > > +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
> > >
> > > Why do we still need the old versioned filename?  Can't we get rid
> > > of it completely?  There's no backwards compatibility necessary on
> > > Xe yet so this is our chance to eliminate the version numbers on HuC
> completely.
> > > It's not clear to me why we're still using huc_def instead of
> > > huc_raw below either.
> >
> > note the version is saved to uc_fw->major_ver_wanted and
> > uc_fw->minor_ver_wanted.
>=20
> I thought we didn't want to use those for HuC, only for GuC?  Since the k=
ernel
> doesn't interact with the firmware at all, there's no need for us to enfo=
rce any
> kind of minimum version check as far as I can see.  We don't even care ab=
out the
> major version number, which is why it isn't included in the filename we l=
oad,
> right?
>=20
Yeah if we go down the route of wanting to load unversioned huC. Then we sh=
ould also override the version check for HUC like we do in i915(this change=
 is part of v2 of this patch that I was just about to send).

Else we see:
[=A0 292.632408] xe 0000:00:02.0: [drm] HuC firmware i915/tgl_huc.bin: unex=
pected version: 7.9 !=3D 0.0
[=A0 292.632415] xe 0000:00:02.0: [drm] HuC firmware i915/tgl_huc.bin: fetc=
h failed with error -8

Because it get 0 and 0 fro mthe table but it finds the 7.9 version which is=
 actually right but we should not have the check at all for HuC.

Anusha=20

> Matt
>=20
> >
> > Later when we are parsing the blob we read the version that is encoded
> > inside the blob (rather than on the filename).  See xe_uc_fw_init().
> > I think the version check is still makes sense:
> > major should never change and minor has to be equal on greater than
> > the one we first started supporting.
> >
> > The version in the filename needs to be removed, however the version
> > in the table I believe can stay... it should basically check the
> > minimum version required. We could rename
> > s/minor_ver_wanted/minor_ver_minimum/
> > to clarify.  And comments on top of the macro definition to document.
> >
> > Lucas De Marchi
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
