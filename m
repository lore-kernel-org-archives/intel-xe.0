Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C3C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0F310E330;
	Tue,  6 Jun 2023 11:50:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B9210E330
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686052256; x=1717588256;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JXLr+NU3zk8CoFmsiQ3nzkJJ+W06f0piYsYyNTwPqyQ=;
 b=DuUpLojFddCu1kcE7KVTJw46CWomfB40h4EJT8Ch+E8h4fRD0wtRZPks
 9WRNbn1F4Yd1vsBt22IaF2egVcuHckzZCRXNBJHStd74xuNTB/04xef9V
 Wfi0smXPzG+JncIOJmJLeyL8b5Isz+Ka+y2sw0IwXRfqNBHPMBHGFlz+5
 u+qw4BtYLpgx8gHa0JUjycrjto7lWbaV1bm7POSBTNzm0819//G2TXhUf
 is4EsWwC+WaIKqDyeERo5efFZKtu/dlkxeu+nJrsO+ewqdLz/Cg4EzQJV
 uo0kr142vp99BOfFL4Na0Cv9rHKG0heGQrSj0MYaFMte7hTgiwLuHtQeg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359101359"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359101359"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1039148582"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="1039148582"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 04:50:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 04:50:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 04:50:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 04:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHDlAnJN+T58kav3RhbZtmjwNRge3cNAT8tx0/CCNYnCOfJ5ERGkCbHFTBSksViQmwL2jg6BzMpk5FR03ndO2LEYG6g0W3tqLvNtpDP7sWkkyK6UqF7FhLFVH+34xdGaqeoeCszYfTLOqEG+tayUb+hOkdWA8TX/JhcchXjrrM6L+OsdbSRfA/Nm6KoMQRbr4tXzktv4alMbBFMawtaBYhsUoI1WvRKU4XnDN1TExK1kUtFHk1kqiWUQTeOp2bSe0ucxIFQb7hsZPjERd7gIx7khaNSJiS466e00gi7/2WZl6jEB1QkQXtHGQe3iXNu8Ijl+/bLJ/N8FA1lGEYh+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guD3FMesby+MU+SglM9MC6v8cb/4oul3SEp77o0E99c=;
 b=B04P7j4mUcLWhPyEFriMVhO5fnzz4skTtcIckJSWkXLdm2Ce+YDCLGvpxmv0d1Lfo3bPImTrMwSuXlGA2y8RteeENddcDKdWW1TVwQnj0uwm3C+osF3LA45bxefdo2qyMKO/oJUli9aNAMy4Sa9yu0Xk67tsg/2f9q2Gyrm4zcClk3CS7RLVXFj0BnmGyEXYOSQMEgRFGn0Gqm0/ZVBTtgh4HSRkrk4Rwzf3NQoF8fFmolD9odx+uqB/FDJyuQ2a0vYEcpthqUiPylJenFomUwy3r4a0fQRdynPGfk+AWBglz9yBSB3+TYJskrQWWOeqcn9QQ2hAsOsBXn+gHUWPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Tue, 6 Jun
 2023 11:50:45 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 11:50:45 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Add GTs under respective tile
 sysfs
Thread-Index: AQHZmGcgX0xyZFSJZkGadcOS5uL4l699p+sw
Date: Tue, 6 Jun 2023 11:50:45 +0000
Message-ID: <MW4PR11MB70560406B5B2F5134133BBB0B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-3-tejas.upadhyay@intel.com>
In-Reply-To: <20230606111255.2072426-3-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6094:EE_
x-ms-office365-filtering-correlation-id: cdb27b7b-3603-458e-cda1-08db6684437b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TMVGr4ERTNYp3tMhO3FKV29jR1xu5eVHRiqlggB41MBpvmYfvyHq7mzC/50C0nyuBjSPbmYMslhMQ6mjVXD5DiMFJYB37NCMLzJFk7/r6Dl9sZA2+1I7ZvMa0I+l2aadBMYgR2/2RtwJe2OpRh2nEMnGvRedhdAFwrAHMKWRmpJqyTAuNW5qBE3ShMXbU5ffUHh9FDXz45vMOMktWg6nB2pAHmJa6ivz7jD3Bss9HqfV4M4J6L7BCaYLd/PUdJnzfY6dKRV6duu83mNxRgw9+STggDwDWrS64I2GvE85+NsviQy6pffZa8czqTb2Rsw99R3s1As49YML/WP2LXn3CvnUsANxG8YA7u62ObxAxXxzTRc7T3GiCr8Dyu7P3aUwer/w8K6yrx7bFhZC3FgLh+MnfNUYstHeDoCK0PJ0A2lUr97gd6C5cKeI2DPXKeGYPV9gWReI5U/9Wdgg0DzY8XGPFVKbBs+sDdwb8w99MXh2HisEptr/27/GUgGVXJyaQ89PoUC7I0eLRhsVQoCc93rIzk72Mb1HGEnvb4+XgpIQlf73RF2zpos1Xjq1NPVTXGJxGWApqWdjh5W1FLvLV5vrnld9J81Jn/1Qe0litpRGD1+Pm/YadbYXSqClJr7Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(38070700005)(82960400001)(8936002)(2906002)(186003)(8676002)(86362001)(41300700001)(7696005)(38100700002)(122000001)(6506007)(316002)(110136005)(26005)(478600001)(9686003)(53546011)(33656002)(71200400001)(83380400001)(52536014)(5660300002)(66446008)(76116006)(66556008)(66946007)(64756008)(66476007)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m42ubTyKyvQa4Z9o0eFKuusO5dT9Wdir+rpbpMpSUEqCJrh1pj3EauIGIMmI?=
 =?us-ascii?Q?DwPvdce0jvhtNil6nSSpcjOwJUQfFcfBC/ZWBPDcjmK0GNEPT8vEB2MNWXwn?=
 =?us-ascii?Q?g6QA2eUvPkYdgWMmyREuGrTFF78t9qJkf+GD032eeEMMRHhEs4umtXvzfj1j?=
 =?us-ascii?Q?5ItsnAdf16zc575L/15b2/46Y4vr52BxnMDAcU1RjGMFNLsZal31IIJkgbhP?=
 =?us-ascii?Q?wl5m6ndP7YpeA+bawfXRlbDLdaFU7E+JD9yMphk2r7ZrrrZZ2YxA1GEkzouu?=
 =?us-ascii?Q?QzuAZzfwLhB0QIQBvk23YBLofXlC+OnKF+c0sYtPgnkWxDCcRgnZgkTqn8BB?=
 =?us-ascii?Q?ngmtU/qAczVy22U/WUQobcJWcCRkBWk3juKFkvNcyTLIRSr7LWUYIlajKndS?=
 =?us-ascii?Q?P5cHewiPdG8/ebEu+v187ZpXW6Xep337oQLK8eLpEB3B3/+LqIQMNx5GC0dC?=
 =?us-ascii?Q?hLY3fRBMv2sLnQ7XBJSYDfgoSJSs+QTvoGV3vAJ5ju3xRS6CtL0X5w71HMdu?=
 =?us-ascii?Q?2lvmvk5J8YFRWbpQr4gBJhKhnFXvtxHx+g1fUoUFVAGA3rtqNLlLJVtJXGZz?=
 =?us-ascii?Q?amYQOMq4bGcAez8kuOYlnMhLSobKiB8LCm1lz3mORG0np2tJanP97cVDj+SC?=
 =?us-ascii?Q?M4KK8o2cyfLJiOu3qqs31Wy8v40/0mDqcKqQEJsKwQHzESIdNUOg61+Y1zaA?=
 =?us-ascii?Q?7omdZqWWsMh2VFKfgvvBFvTQq+Yo8qU6o990AEEyTK/bNUxFK5Dmpa9adF7y?=
 =?us-ascii?Q?rTvGsXoQcDE1JF3ZBR8MonCcN4L+rUmawMJDs5WQQ73BgUIUh8VF+AO2RhEg?=
 =?us-ascii?Q?it5zkRuMyQTo5efqiKJ9l20H6t16RXDT3+kdzYchUBhrMb4OHuj1vzo4NfxP?=
 =?us-ascii?Q?29JhcKnkEspCITPWefiCRt+3Z0BYyxOOycqIxzaMdHzniG9h5Gf8RrwTkIkp?=
 =?us-ascii?Q?bDTy/nXexUiF+u9AM7oXbUdVnFh2zAzGknHgc49w1fPJdJah3MKUAbnVWhUW?=
 =?us-ascii?Q?UJy2/mT8Im+W0nLL60yYVl3JvYxWe+97b+DT4BoO4I8k2UOCQ4sQgOn1HYAq?=
 =?us-ascii?Q?sG3v8J5Xz2KdNXIVQka8MhIfGUsbPHeN7GaMREyhTyhlVP9W3d7T98tKh8hX?=
 =?us-ascii?Q?zV04JwKCfpmvryGkfUnm++h7LqpR/YNWw4uCBQ/WY7H6WJ9Q+wNEubxcfn0z?=
 =?us-ascii?Q?0POPulKQhgau/yzTNr/cmopTykEsRO3iAHMnqg18I0uuTOSsbsoWqgFagq63?=
 =?us-ascii?Q?sN/dSD4w4lp8vC3sszxOKZ4hvwZBvN4Qg/onfTcBwEW+8kPwhq1WdP80pB3x?=
 =?us-ascii?Q?8zosc6iE25wckzOH7gHrSjp/KKI+btaBYBSD7k062vTOh6LTZ9OoZf6Odz+e?=
 =?us-ascii?Q?c4Yz6hYYprfrYyMkzmw4yakPbWITu2Pth+L1a5I6R8HMTF8NykXg4YJ1oLWD?=
 =?us-ascii?Q?FIs3huQbGXgYmLMSejn2LGwLwpcG7A178F3QbTYJG8VXx5aTk9TmQUNojAWs?=
 =?us-ascii?Q?GyGkay4552Z4EwidsOghMAHqJJA1bWA9jrH/gXttQRSXViALaZ7dxQUc/PUa?=
 =?us-ascii?Q?PmoON0qZcYW9qHkRIGi+qvKKwO6iMPyiRGwzhk7cox3mOoOrcOOwxPa/Nwei?=
 =?us-ascii?Q?yQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb27b7b-3603-458e-cda1-08db6684437b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 11:50:45.6788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRRuYQH2JxGbbVj3OM2+EKey12PMEHpnuLvF0bX7jvOxg1zQIC45PFXsx+d1SLluw08+zx0zsvtgm1uz2uxSgFoDJjOL0lZcfUGcBXVJx64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add GTs under respective tile
 sysfs
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 06 June 2023 16:43
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add GTs under respective tile sys=
fs
>=20
> With the separation of xe_tile and xe_gt, We now consider a PCI device
> (xe_device) to contain one or more tiles (struct xe_tile).
> Each tile will contain one or two GTs (struct xe_gt).
> So lets align sysfs paths accordingly.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c01cc689058c..13570987a756 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -31,7 +31,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void
> *arg)
>=20
>  int xe_gt_sysfs_init(struct xe_gt *gt)
>  {
> -	struct device *dev =3D gt_to_xe(gt)->drm.dev;
> +	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct kobj_gt *kg;
>  	int err;
>=20
> @@ -42,7 +42,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>  	kg->gt =3D gt;
>=20
> -	err =3D kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
> +	err =3D kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
We need to address exposing of tiles number from device query ioctl and=20
the proper dereferencing of gt wrt tile from IGT. Otherwise all current tes=
tcases will fail.
>  	if (err) {
>  		kobject_put(&kg->base);
>  		return err;
> --
> 2.25.1

