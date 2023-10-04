Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E4E7C4E6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78AC10E3A0;
	Wed,  4 Oct 2023 17:08:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396310E3A0
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439311; x=1727975311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P/TsZvWsnWxU7Q5zt3XBNK0iRw6wJP1vC70SLlEwR6M=;
 b=NH446yr8UWtH5Q3hZm4tzYXurBFVzD1zabzofdZo0YNAAamUEdoRiDlS
 2TRLFcASZC39hblFRj/DSHFsyORnMCNgoUP0Xz+tZYViOUPUuOkspt4lc
 JicTWHiQ9kNgIuDcHD//YpXlml3VThZ/fdUDj7oSty4u5/y6YUtdF+jvG
 pk/gu3S06BSDPQ9uRFlmLa8yOLqheP0ybjvS+ZGklVnA4Cg+hzJrBxV0T
 IdHA88GUCrUlPtA4/N916ajw9uq5JcsWDUZA8zgA4R8OhixBOJW4xR0c/
 2rJZ7SIfT4VE9n+C3N7eKkoRSCLgwwU57ZRawb7I6zGgTHGLjB3omMpdr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383139940"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="383139940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841966089"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="841966089"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:08:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:08:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:08:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcEWpLN3YMD5mazrjkEtURM2++AKF0vsQayGKwR/2aq3dOsncxFk13biDlJxqRjZkEYbush4qabc28T0G2atD5qiH0B3bi4Luo+bfWVYbE258PVnYp7Zt5QA2lKAnLxXNig6FCTL7tKnHFM/zETotm7BA3nOjrq4T6AOwixSMKc7qW1YYC1QIQdA7AQzksSNTYUyz8IgENKGhbJoOHcbUUJKnPU0e4vNsM4G8oLG533urR2nB69YyG0ympRdDcAjsPFSiv8NNFNZnJi8c4XgskFsLNbOtWt6QXICctnPziJnm2MuAEWFZCQdNqFrrf7YfK6brkuLD99tphPj9ETN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xyh+H6jmVhG8lLmalG8S7DHyXYZ9nlIBF0UcHCm+4Q=;
 b=SnwVdWv7pxuCOIhmyTFgVwTHBiGo4yIO0P22DKdpzdltKHRVX7a/75t+lg76XqwJEP2qyUoS4gxJ8YJ1chB52n64Z6AIcYAOFdt20MZsu0fBNs/ccEqmXebTAK4AXgh3Rns6RhR1FCzpptf+obh2J1eR+mfwx1xhjQY6YnGOlfdcC8aglHud9aFL0INnrDrdovEdFxtL5b7PLXjB4PNEVuWDSpPhlgKFOvSOdEI8pztf1bUiqdkuwTwx7swvF1MxwU1y1VIgQVIJXeP9KgEyNQl458SW5UryzrYuG/J/RbPC6saTkfBYWi7yDzutR6Ub9r75U4jM/pDT0BQ7UzwM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 17:08:05 +0000
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a]) by SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a%3]) with mapi id 15.20.6838.016; Wed, 4 Oct 2023
 17:08:05 +0000
From: "Kershner, David" <david.kershner@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
Thread-Index: AQHZ9t2he/OWoU+ZxEGT0rtLg+MqqrA50U0AgAALG4A=
Date: Wed, 4 Oct 2023 17:08:05 +0000
Message-ID: <SJ0PR11MB586601A1BB6CB8FD858A358A81CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
 <ZR2SMB3j1wZ6Oxqc@intel.com>
In-Reply-To: <ZR2SMB3j1wZ6Oxqc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5866:EE_|DM4PR11MB5230:EE_
x-ms-office365-filtering-correlation-id: 4af7b46e-126e-4198-d9d1-08dbc4fc79d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrdxqpFLQ7o2pKgBnOF8MQt5jzqkHk3g8RiubXRuFumwZ/2zCgSQDb3Fp1KEanFYYFrjtiCkp+MI/2IDPcV/Y+vbMk7RW4eK6yX1spna5rE1MFDK1PIv+4yHjzWTZpdlvf5AGHiysvcM22LWN+9rerTloCIWOuVsAbLZieOoUFAlguoLdXzft7+UgYO3Php60ihdO5ZO+w4pc7aDV1zFqs44FsRJOZfa/FEh7Bq7nA0ECguHPU6PAJcFFn0duD6XNd30ZWorj55TDkx3d2ScdqryWHQReOvSrFYNkKwjrznY2c0mRyIK+xvX90l3mjszxugquusTdDodWm+9EbFEDkXza8w7djriRYbgPy92XSOKV8k047V9MTo+2bsJ1VZ/WYivCWKAy1ht8XRJUxcAKq1LpbxR//1G6DROjGmLDV8igHJuKzcpWspTazWAH519vVidhmDviDu5IVwB/19z7z4x2RP2RWr3SwDC0nvT0DbSpJiGxKMdZhX+02lOH5uxlAjKMmZMnNhUbXIPaj0lNTpklXonOCzccCNMZi/h8bJZxwASwLOFx/JT4n6iDD9SkqOF5s/OUns0UoGRuGhJ1VM0oE/EUldFjWRqD0P8IDE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5866.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(53546011)(110136005)(54906003)(66446008)(86362001)(26005)(66556008)(66946007)(76116006)(66476007)(83380400001)(33656002)(2906002)(41300700001)(8676002)(38070700005)(38100700002)(52536014)(4326008)(122000001)(8936002)(5660300002)(316002)(6636002)(82960400001)(9686003)(55016003)(107886003)(64756008)(71200400001)(966005)(6506007)(7696005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HS8xB58had4fOz38QwHpYEUv2E5UPytaO28GHlUbXx60maBSwV5isKV5L/YP?=
 =?us-ascii?Q?P7XWCwwJznA5mrQ49Pg9AoCfJ7TqlCaCDsqkvxvJniscvcXYYiov73btpaiP?=
 =?us-ascii?Q?nWGbC/6a0d8PVIETfFJPaFhpwkBKJ7prcYhISpfYeMGcMapXrVCqx6v+zp/W?=
 =?us-ascii?Q?VCShWmsmLjycH6F3mtAQWe0Xr8Pig5HGQUzERTLTJzu62VkNkl57VBo4O0PH?=
 =?us-ascii?Q?PJ7kfUd7R3SGUuUQawBK0OBh4HsFBsRQeoSPxe+/SeJ9N4LG9nZ4HuIm5SIC?=
 =?us-ascii?Q?qS/B9tf9LayCwddiV67vZXRzXe1IuU+8hmSU3cDOqNQg3Fn/Ak3XVDAlKnHN?=
 =?us-ascii?Q?ZNRreM4mWAk+BGedK/ZU64Dxhvi3z99VpKPaYMfnGxrb5ZzfgUl3VbT/nc72?=
 =?us-ascii?Q?ZhjsXIV1nyvdBm64zELoWjAjcM1WIWg2zQiS4xI8eBSNq0hkrfVDTDXsAdem?=
 =?us-ascii?Q?VqzHZ0dfXKT2e4xJkC+gdshkg3sJrYfP7BptNZfjnR9YI1PZakiMW8n1sGsc?=
 =?us-ascii?Q?XKC7puQlzHM1hlXsdci8cJDorErw0QuhHfhkXgoRnLhN9z4vXqjPbx3x5fBy?=
 =?us-ascii?Q?/94BwFagG53sL8SQAh92bL76Tb43OEtZ822IjZH6hlzaJuz8sjURuf8YRX2f?=
 =?us-ascii?Q?EWLynd+II7Ti5eS+XM4sQvG0BtSGX845wQMx+hLh1NuS2ZxYW/gy/O/DUFy7?=
 =?us-ascii?Q?ftPA9uTXEVqkz0IloiT/JTZb4WvIHJgOu/hKTV+o0kUzCL0hprX6/1wrkK8u?=
 =?us-ascii?Q?RujS4es0x0ptafUGdISuUdZ56lj/kCvLOXI63PDsSLZVM3FaklWJwNcmZy0d?=
 =?us-ascii?Q?s+KN8MyHukK4CfDU5u8163ZM73kWA8rDZuiePoyF9t++jSYuGNEDjITHziy3?=
 =?us-ascii?Q?rGHXRIGhaRoqeID/xG1gmYLG0GyhG5t1KxnCPvebzQqOSIT1ZxiKC8c6SeZb?=
 =?us-ascii?Q?7QSbwnqtzMmv11bKrEUVlz1SH4tucf1u1SOQa47KZltwcJ3XbsDOEHM7rmwY?=
 =?us-ascii?Q?yvcRmkvpwRJQ50kowzR0jqryQeTIyN7VMECF7GudhTnwO5Is2ifjYAMPQLiK?=
 =?us-ascii?Q?nd+pYBfU3TfatdTwt+KaIOL59uDZWWH/Wf36rRz+l4q4Dn8ZKmwvpiEjLWgO?=
 =?us-ascii?Q?i0XKNtraUwLjAkM8/skFY9T6+A7h43XNvLWw5lUzkZ68DrGKnarnuC3MwwlY?=
 =?us-ascii?Q?rb3PuAtO3r6uHlId8GuxRDz586zc7a5EpHBfpKLP1OohspzC8LwWOYfogp7P?=
 =?us-ascii?Q?5wzlKPGDCjnYxnOqg1FQPCliChVZ6klRM+Ncyx/S8Yugae0xE9llHr9abagv?=
 =?us-ascii?Q?rXbWLEabq0+iepM0LoAwHD4TzPb/ncXpXojso+HjYnHq9PcrAJhqhh8FsveQ?=
 =?us-ascii?Q?wo5UlJSzhQijQ9LH7zapPBfWSDr32HLqbazGtcR7SekPcq8iV35eC3Zg5+RY?=
 =?us-ascii?Q?slO8yCTVo4FshihlBam/48fLijN+59n1tPHACHtQpou3yC68IgKtPq9qV3aM?=
 =?us-ascii?Q?+YC+8UrZ9hEBd2aT3SKjZqCq0UtorczB/LcJTZCr1k1RcKXzBCODGuw0ljz2?=
 =?us-ascii?Q?Yrf+XCqL2OvtSKRK0MHg52Kn5wzVjrzMmOEEvwfm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5866.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af7b46e-126e-4198-d9d1-08dbc4fc79d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 17:08:05.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiT2tbXTgSYbklDR1R90HQMzgfBJ+Ktzi4yTulHjH4vXbMTxAWW8R5J22j+2m8GA3wfJJWd/FkZxdihsQ+FnwRg/yN86f4bPSVT0bczk6rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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

 -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Wednesday, October 4, 2023 12:26 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power
> attributes
>=20
> On Wed, Oct 04, 2023 at 09:09:32AM -0700, Lucas De Marchi wrote:
> > Add missing static to fixup build with W=3D1
>=20
> https://lore.kernel.org/all/20231003222145.4090918-3-
> david.kershner@intel.com/

I'm not sure what the protocol is here, I'm still fixing up the other patch=
 that I
have in my series. Should we just drop my patch and have yours go in?

David Kershner

>=20
> >
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >
> > Also I see in the changelog a change adding xe_ prefix to the static
> > funtions... that is not the convention most of the driver follow and I
> > don't think it should had been done. Anyway, just fixing the more
> > immediate issue here.
> >
> >  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> > b/drivers/gpu/drm/xe/xe_hwmon.c index 1deb5007e1e2..734fcca9f71f
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon_
> >  	}
> >  }
> >
> > -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum
> > xe_hwmon_reg hwmon_reg, u64 *value)
> > +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> > +				       enum xe_hwmon_reg hwmon_reg, u64
> *value)
> >  {
> >  	struct xe_reg reg;
> >
> > --
> > 2.40.1
> >
