Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B4EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 02:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F2110E7AB;
	Fri,  1 Dec 2023 02:49:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8296210E7AB
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701398947; x=1732934947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wNTUmfiniP9VA3oRmYCNNjzjVuopMIpDHPT1PchL5dI=;
 b=GP4vWtlgaDpVFtBAUQW+V0ASHrE55lD9a7ia8KGCp4L40+GrujeeDqLG
 yVBzHSyAJRcVQZNJ//gQWljOitafvhjeDHL1jrqbmBXQdfuWxkvOLzeIt
 NU7fDaNFpOE2F2zBgDkzYMWfezCWIRtSjunnw6Gk0UWuI4DnHibTxtGk3
 S9DLPuxv7qu6y12DNIZy0k8wOeZQkKzLZcrbP8i7CUEfeEnNTvhJNuTIZ
 hbFd9pArXWemWLCnFGehl9ImfPNCjp1g7DZL0pyrj2XPyTGbHqf5UuwIi
 uNM30b1p+OGoh8tC27vLkTu7PnLii+W7LAcrFZ7nsmgVXwqKhm3gcZfFk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="309733"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="309733"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 18:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762965487"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="762965487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 18:49:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 18:49:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 18:49:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 18:49:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYV4tvpsY/pwoRteGjmODM5mCifXoR3iO/wWJo2bur/aF3YmCJ9OWv2LLNPs9xKoRGM3Qn3sik1H6woqRwECUGSy2R/zhI8ch03KV7J+UF3CcsqSQrsmKtLDKeFcnT5wYULa9URin+iSWzejHkNrzT8xgV60usU5DIfYrqqSQiPq1YvGdTf0dSwJhycE9tQl1A9Yy4mLrNDT6FY0f/sQjkl43+7AotPYrmcEa/cYu0U8C1u43HQZccywo/cOur5+3rIQwm5o7hDknGCRop5Yh92j/Le4f6PuxjcvVXvrduHXS36s0X1VyNt88fAs7CCQiLv1wYWfi35wK5TPUVfVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBgpkTSdCgXDlyUmLiuJT9HnXiZgkXrYYm7JN+kPDoQ=;
 b=MJwqbGnBSS9df4v1pjHrwLCz4Zi+XcgzJF48j4Db+06VqGrQpxKDncuV3fT28yESJtXhayOGsWXXH3mS5LKKOAhGfWPSuGkPZQrTO2IJxJn4N/glXad7zgH7zFYOv2mAPbiPVZM7zI/KTKRhfMhKaX14sp2FVIChM5ZpBWQBInDGcTqmp3C1KfljsNJmFj4/TcN6APdXJzfgaCKkG82qSR0BO3ea8pSXNP68NXvGerW4sb8EOeNBv49lyYvrsmxJL3iJW55A1IeeTzh42cor0+8eR+9DNeQuqyzQ/A/kj4ufUNmJQ+1AwPOhTyHEtgUW5pu6qfvZOsK7IxkjxRQZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 02:49:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 02:49:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
Thread-Index: AQHaIgwv0nUiTdecQkm7LclbocI0ZLCP9LuAgADI2eCAAqfOAIAAGzcAgAA8f/A=
Date: Fri, 1 Dec 2023 02:49:02 +0000
Message-ID: <SJ1PR11MB62042B38A26D2AAABD25CD728181A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
 <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZWj_dpyE75C_Ippr@intel.com>
 <xqhglc6kukdoq5rf6cwz3ovcreuy7m7z3eixpasmdkitij4t3z@jzhczrrzu7mp>
In-Reply-To: <xqhglc6kukdoq5rf6cwz3ovcreuy7m7z3eixpasmdkitij4t3z@jzhczrrzu7mp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW3PR11MB4715:EE_
x-ms-office365-filtering-correlation-id: 992c2c7f-aa37-4902-ae76-08dbf21813eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Oh/a7Oyx5cpcsOkuIsk9t67Bhy6EGt/pJjID/7TfkHVYmVzqNlBYwEUo/WrJArGM/0TC8BI7pwuxl70D1ZwAhfyGT6LFb6TRti0PjemVuyrKKpCZOqX02Ml8Fse9+WVhWWwacFf1usY6dFnJfLDuAg5E9nG8EiZokYoPQtO4/6mw9qA3pBQVToX57p9HqInyrh25U/qo0QkFqd4JFwdhV4338BTbqnHAmyfbjp3sH9vTFyJUgSaNNQQp110ENpbx3ZcSe4b8ulrsbsFGNf8RGXyhgMLafNtMI2FSFmdbF/Zqds97PUkEPDGQh4rNciCGZ5N0Rk7Wqoi7FEkaeuvFtd9F1klUiUMRS9YtOqiqBU5zKAJH9w28CuldgRFCORo6i511W0aaHAaWKGP6sBPHVlVOoUfeWpV4Zc6PO+CX1SM0H/dUdO3dw69iD6CFzzTaEP/Lcep7bpESyCrbKX+OP5+nf5CutHyd8F9Mmk/uTRM0fw+Mjn5F3x4+XeE3cdUpO2dnxgV1WZqHq/feRKgzV/c49chauR6CIoEfBKDOLmtI2ZpnjvBCnJPwpMyrEB3HctWyWm75FSBNOsw2pfXiHEZno6Fey9tvP2OW/oI53U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(82960400001)(38100700002)(8936002)(8676002)(86362001)(6506007)(7696005)(9686003)(53546011)(55016003)(4326008)(122000001)(966005)(478600001)(71200400001)(66946007)(76116006)(110136005)(316002)(66476007)(64756008)(66556008)(6636002)(66446008)(33656002)(2906002)(41300700001)(38070700009)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YXrVA4YII2lC1PaVA5mmrNM4Gi1CpqNUqTR6q72QyhgsjJ+34GRYRZrkZQXV?=
 =?us-ascii?Q?G4IHPScra2KgPOiLY8RE4bLl1f+PK27bVQzhAWsjHZIkvVJl6b1KT64Dhh+m?=
 =?us-ascii?Q?/KEmmBDT+GB4eUtx4CIYwd/Jz9hMk3BA6ynDB1IyE7H8b/NEdEQ+I4LTDAWT?=
 =?us-ascii?Q?CDE3kuL9hO+WeFqOXMgrhEKmYAsgqLk3KrwHDtg8O12b/BJdz4erb+QA6OQv?=
 =?us-ascii?Q?99bhoJ3x5gZiSlaeUta71co7Ib4PiUq6R6U79z/tZ7sRLM3u/8BlyqiC2sFx?=
 =?us-ascii?Q?PVr0VrdSh7sCpeCg1cQm5odqUsBNnVv12s9ERJf4Of0R+OfqhzQKfi6OvU5y?=
 =?us-ascii?Q?RJ57M4BgfUwyjE9OWIJgwMgHOP887YVj0YMai+GpLyeRRiDcI/CrwDmlI7cf?=
 =?us-ascii?Q?o2eNtGaBAQO0ezptaDE1UPEYq1BYVXbi7hAeznPnRPGXuQg+hFn/eAu90rX/?=
 =?us-ascii?Q?OnaTk6aIYtHwAKDXxUc0vQ8mCT6ADmU5gEikxsn2hBTf7jKEGdsESaERssmd?=
 =?us-ascii?Q?E6xwTfuNYaCMXwkX+iMhavisrIGcdfawr5LXRrgPzK4IEI8texgBuRhkZ8C1?=
 =?us-ascii?Q?OgL+3vGOQVTXR+TnWnmZvR0pnkkFwj/i8SzyKPAm/pbaRoCNgOXI4CZLrsJ/?=
 =?us-ascii?Q?zyhusoJqMRiBN/yZXSf+Ol/rDwbcRt32Y1yWdzhJ5UgpNiTLuAliL1nZsBhb?=
 =?us-ascii?Q?LYdc5WvlcIQ3Ok1NEohrFW2QxhwZw8LLjjY9/sue987nMI9LS8RnJqRvoxqm?=
 =?us-ascii?Q?PGphjHMXWwKBOwj+7igg2EXv8LztRMfmfkz9OPOnusX/Kv26pyaweyupDH52?=
 =?us-ascii?Q?iYs5wSvvy+X/bXs6nbjNQHeEApcbq9iOJJ4nwsTSsMi5dLCkA3li8U48t9Q0?=
 =?us-ascii?Q?yCvBo4p/0UpfA/hcK+vh7u95tGXoBlt9ZFgnNnJoighshNAc8/CmEiIygkhc?=
 =?us-ascii?Q?SfY2H7X5lUMmREmQpZGPBTzOc/dXfVnm/5ONW78Wd1Z1p4RbcA79POCs11Ao?=
 =?us-ascii?Q?qqzjgv/qBWJ5u3LEDLmVI4PlG7+MCor+RvwOcsa2/jjK5WNdnc0Ki+6U1Mfm?=
 =?us-ascii?Q?afaRrz3GT4d3zVLQbkwtHaPptIW5+QYmd5KVwJXv+3h3Xn+pooNAiTAp2j9i?=
 =?us-ascii?Q?jr1US89LWKcBQensLBdiOS36MyjGwwuB9CVBH6LZF6TJ8YTpzByYGK5Q7DIB?=
 =?us-ascii?Q?MclsKdjG0Ox5IwfLc6yZSZASD5TUdBW7W3cL2qJJxkW4RhkKL9PZr9ldsrvM?=
 =?us-ascii?Q?g7kLVrD69I/V7VffUVe/+v36Bp2sECetD6ZnvoLEb4w+3TeeBBLW6GQJVCIJ?=
 =?us-ascii?Q?FY9GLmNGFlCAso0VsahWbWuHNbJl2L/tIJh6aJkp/H5zuF4RpLdd4hQ15dcu?=
 =?us-ascii?Q?HKsP3VmAizt/mBdzn19wyLBd1TlilrmePeg336IIegas3Lb1jxj8IaPhDT82?=
 =?us-ascii?Q?j5Uszd1Bq12nH0X8b+/8WVsdwFX7u9Ssthj3wwpuztxeXX0EO2XdmQXZkWFQ?=
 =?us-ascii?Q?B/x6XZul2EXrR+qJDgUjiOwm1fVTPsLc0FbgBErXAU5JK0917S7ea4sTCQHQ?=
 =?us-ascii?Q?AMghUSoulTKnNiWlVebOuD2BjZb8qJWHsd33t1Eg5O+QKqTgyAASNeSBMOUv?=
 =?us-ascii?Q?1D8LnbvN6J7dp9erh1qcIXUN9WUcCfRN1TDf08Rabsy7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992c2c7f-aa37-4902-ae76-08dbf21813eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 02:49:03.0099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xmRPGblCc/AsGqLMdBHk5Q09mSVuFFzzuAwiQQLTFHDUagSz6Wl988r8r6ssyFCcO6yMfZIqGMwaD88GXadcUud/0eOD3N0VvTvjZUIWf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, December 1, 2023 4:40 AM
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M=
 via
> sysfs
>=20
> On Thu, Nov 30, 2023 at 04:32:38PM -0500, Rodrigo Vivi wrote:
> >On Wed, Nov 29, 2023 at 12:00:39AM -0500, Upadhyay, Tejas wrote:
> >>
> >>
> >> > -----Original Message-----
> >> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> >> > Sent: Tuesday, November 28, 2023 10:31 PM
> >> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >> > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for
> >> > ATS-M via sysfs
> >> >
> >> >
> >> >
> >> > On 28.11.2023 16:13, Tejas Upadhyay wrote:
> >> > > On ATS-M CSC firmware calculated unique device id(uid) can be
> >> > > read from defined registers. Only ATS-M has this way of reading
> >> > > uid. Also ATS-M customer require this solution to locate and name
> >> > > their devices effectively.
> >> > >
> >> > > Consumer of csc uid is level0 sysman and end users using sysman.
> >> >
> >> > is this generic UID or UID only specific to CSC firmware ?
> >> > if former then maybe just name it as "uid" or "uuid" ?
> >> >
> >> > >
> >> > > This patch exports uid to the userspace via sysfs.
> >> >
> >> > as this defines uabi, shouldn't this series go over dri-devel ?
> >> >
> >> > + @Rodrigo
> >
> >The biggest problem that I see here is actually the justification.
> >It doesn't matter which wrapper are using our sysfs or not.
> >
> >A better commit message would be something like:
> >
> >In case of multiple similar dgfx cards plugged to the same node, the
> >user cannot rely on DRM card number nor on PCI address to identify
> >which exact part it is operating at since these numbers can change upon
> >order enumeration. In the case of FW flashing or other cases
>=20
> kind of sounds like what we have for network with predictable network
> names.
>=20
> https://access.redhat.com/documentation/en-
> us/red_hat_enterprise_linux/7/html/networking_guide/ch-
> consistent_network_device_naming
>=20
> This would provide the firmware naming, but I wonder if it can't be solve=
d
> today entirely in userspace.
>=20
> >where the admin might know specifically which device it is accessing,
> >it needs to have an unique identifier number. To solve this case, CSC
> >FW provides an unique number that can be query. Let's expose this
> >number in the sysfs to make the device clearly identifiable.
>=20
> if this is the justification (like you said, it should be in the commit m=
essage so
> we know what's the use to give a proper review), then it also answers the
> question "why is it ok to wake the device on sysfs access rather than doi=
ng on
> device probe?" asked elsewhere: because clients will almost never access =
it.
> It's not like a userspace client is reading this value 10 times per secon=
d

Considering making it ADMIN attribute like MattR suggested, looks like it s=
hould be ok to wake GT to read UID. I will update commit message like Lucas=
 and Rodrigo suggested and sent out new version.=20

Tejas
>=20
> Lucas De Marchi
>=20
> >
> >> >
> >> > > For example, uid can be read by:
> >> > > cat /sys/class/drm/cardX/device/csc_uid
> >> >
> >> > as this is more Xe driver extension then maybe
> >> >
> >> > /sys/bus/pci/drivers/xe/<BDF>/uuid
> >> >
> >> > >
> >> > > V2(Michal):
> >> > >   - Make separate patch for csc uid capability
> >> > >   - Use %#llx for 0x
> >> > >   - Dump error value when sysfs creation fails
> >> > >   - Have consistency in csc uid name
> >> > >
> >> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> > > ---
> >> > >  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> >> > >  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> >> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> >> > > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> >> > >  4 files changed, 37 insertions(+)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> > > index ec9372aa739f..3599c7b38b61 100644
> >> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> > > @@ -71,6 +71,9 @@
> >> > >  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> >> > >  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> >> > >
> >> > > +#define DEVUID_LWORD
> 	XE_REG(0x102008)
> >> > > +#define DEVUID_HWORD
> 	XE_REG(0x10200C)
> >> >
> >> > Bspec uses different names .. and LWORD/HWORD look strange but
> >> > since it's for SW use then maybe at least (assuming ATSM is XEHP):
> >> >
> >> > #define XEHP_DEVUID_LDW
> 	XE_REG(0x102008)
> >> > #define XEHP_DEVUID_UDW
> 	XE_REG(0x10200C)
> >> >
> >> > > +
> >> > >  #define GGC					XE_REG(0x108040)
> >> > >  #define   GMS_MASK				REG_GENMASK(15, 8)
> >> > >  #define   GGMS_MASK				REG_GENMASK(7, 6)
> >> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> >> > > b/drivers/gpu/drm/xe/xe_device.c index
> d60379d844d2..b54635d512d6
> >> > > 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_device.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> >> > > @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct
> >> > > drm_device
> >> > *drm, void *arg)
> >> > >  		xe_gt_sanitize(gt);
> >> > >  }
> >> > >
> >> > > +static void xe_read_csc_uid(struct xe_device *xe) {
> >> > > +	if (xe->info.has_csc_uid) {
> >> > > +		struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
> >> > > +
> >> > > +		xe->info.csc_uid  =3D xe_mmio_read64_2x32(mmio,
> >> > DEVUID_LWORD);
> >> > > +	}
> >> > > +}
> >> > > +
> >> > >  int xe_device_probe(struct xe_device *xe)  {
> >> > >  	struct xe_tile *tile;
> >> > > @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
> >> > >  	if (err)
> >> > >  		return err;
> >> > >
> >> > > +	xe_read_csc_uid(xe);
> >> > > +
> >> > >  	err =3D drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, x=
e);
> >> > >  	if (err)
> >> > >  		return err;
> >> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> > > index 99113a5a2b84..4fbf0275d3bf 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> > > @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device
> >> > > *dev, struct device_attribute *attr,
> >> > >
> >> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> >> > >
> >> > > +static ssize_t csc_uid_show(struct device *dev,
> >> > > +			    struct device_attribute *attr,
> >> > > +			    char *buf)
> >> > > +{
> >> > > +	struct pci_dev *pdev =3D to_pci_dev(dev);
> >> > > +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >> > > +
> >> > > +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
> >> >
> >> > if there are no plans to use this value in driver then maybe just
> >> > read it here as it was already suggested by Lucas
> >>
> >> Why to wake GT on every sysfs read and read those registers? Does not
> look correct in my POV.
> >
> >Why not to wake? it shouldn't be a query that user is doing every time r=
ight?
> >
> >>
> >> Thanks,
> >> Tejas
> >> >
> >> > > +}
> >> > > +
> >> > > +static DEVICE_ATTR_RO(csc_uid);
> >> > > +
> >> > >  static void xe_device_sysfs_fini(struct drm_device *drm, void
> >> > > *arg) {
> >> > >  	struct xe_device *xe =3D arg;
> >> > >
> >> > >  	sysfs_remove_file(&xe->drm.dev->kobj,
> >> > > &dev_attr_vram_d3cold_threshold.attr);
> >> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> >> >
> >> > it's sad that we don't have proper groups defines and need to add
> >> > each attribute separately (but that's not your fault)
> >> >
> >> > >  }
> >> > >
> >> > >  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14
> >> > > @@ void xe_device_sysfs_init(struct xe_device *xe)
> >> > >  		return;
> >> > >  	}
> >> > >
> >> > > +	if (xe->info.has_csc_uid) {
> >> > > +		ret =3D sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> >> > > +		if (ret) {
> >> > > +			drm_warn(&xe->drm, "UID sysfs setup failed
> >> > err=3D%pe\n", ERR_PTR(ret));
> >> > > +			return;
> >> >
> >> > if you exit here, you will leak dev_attr_vram_d3cold_threshold
> >> >
> >> > > +		}
> >> > > +	}
> >> > > +
> >> > >  	ret =3D drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> >> > xe);
> >> > >  	if (ret)
> >> > >  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> >> > diff
> >> > > --git a/drivers/gpu/drm/xe/xe_device_types.h
> >> > > b/drivers/gpu/drm/xe/xe_device_types.h
> >> > > index 268a40639ec5..e88b64cb0eca 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> > > @@ -239,6 +239,8 @@ struct xe_device {
> >> > >  		u8 vm_max_level;
> >> > >  		/** @va_bits: Maximum bits of a virtual address */
> >> > >  		u8 va_bits;
> >> > > +		/** @csc_uid: device uid calculated by CSC FW, used for
> >> > generating uuid */
> >> > > +		u64 csc_uid;
> >> > >
> >> > >  		/** @is_dgfx: is discrete device */
> >> > >  		u8 is_dgfx:1;
