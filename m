Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04029C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 04:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE8710E027;
	Mon, 29 May 2023 04:02:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72C210E027
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685332974; x=1716868974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CYR81UWtDAoqopYKTFAzMoJZBZhkGm/S3/osXQ1TKMI=;
 b=eKsRudItbpeuhcA3RVuwDbfK4j3iXOc5m5xXquD29hDlPle/mkonG++4
 dINxGvTA4bNXPY4nfTGr44HDUHVC3tQHD0HwPBD9uzFJ1mWC7OGxgmxsS
 DKtO/oruAdOVPrCWGPyFDRw6Q0/QFNYpUIXQ40VGMumpCe98tvQwwCE7t
 STdIsl55PPXxgMv8GravrIRYJ18/dFkhLtKswwnM5PkcHLx4T1fSkSD1M
 dlDHVoNPOGx6WSaKm7KBpgwmf3FJ4RjR2TqSJqZMK/Srgj4DFa2u+24rb
 Ci0tP+N50Fc6ecdjPGcmeR3O86UTnuHUH88S3LvT4P3xy1MSZxf16ZEV2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="420367187"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="420367187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 21:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739006283"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="739006283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 28 May 2023 21:02:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 28 May 2023 21:02:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 28 May 2023 21:02:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 28 May 2023 21:02:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 28 May 2023 21:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLhtdeuSLNPrK0SH4vyVjkgNi/ZsynGId0Q7sIvftF+57j5VLP9PhPRIz973qpgzpAGStZW/f3Mvd6ypXQ6LV8FktZemTKXST3BgDeRyrFhph1gvrGUQBeHwKVr3psH9JmHiWz2ZoKVy60NYmgUhfzrPLEfX5EbpcDk3FEhI2WIcXO0pS7+EEv4it982ctBS0qaXIP/2MqRLdkyEwLZ/Pr6e9P9ceZrC4gr/hHIYBQKCCzpKPx+lCS6aN7AlFAQJPoQpecNvUdDShotPxil4VXmlu42w46prTls2Kod/qfjPgNJQ2OiZh3DvUpXHy2u85vJaNYXay26C2YFdZcEVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZnXko9eDaoSWkxyGDf8ctUv4bWHpW/rUkZNfzEV6vk=;
 b=dRJ2wlhZAZ1t2TtZZS+ftGCgJMwJDf7hqX1ZVN4hgUSd2QVwP5iOjvyKh34i5r7y52HjJVeIGsKltunmL0eXWjyp1AdArGXteSQCMnSTVNuOqEdcK2hEce8IH+964tRTr36IPf6j4ZZp+w2RzRJNWvXRz1Ag/0bWprwk6U0Ub+YvChfvKnS8zPYhm+Bu4YS77r3K9m+eRmAWMaBwBtG2Zth+nct8XBzuY7bJMrSyojfjBfFVOx3/fcJeccnNezOE/SqG2uut3SOa8q8Fr3A91miYZ1jGnyjwZ0OluMLS8go3WxhKs3xbPI4nYgZoq260qM+BzRe0Htjq+Ph5j5P2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Mon, 29 May
 2023 04:02:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 04:02:50 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset failure.
Thread-Index: AQHZjg3GEpQ52Tr3U0+LzA70gnJZCq9padyAgAc+XbA=
Date: Mon, 29 May 2023 04:02:50 +0000
Message-ID: <MW4PR11MB7056DF2A05E46C773DA9C6D7B34A9@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
 <ZG4P6V/6/cb3B4ln@rdvivi-mobl4>
In-Reply-To: <ZG4P6V/6/cb3B4ln@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB7754:EE_
x-ms-office365-filtering-correlation-id: 0d156e89-3faf-4c11-4bbf-08db5ff991e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqZjI18FUujRq2hYyUIlVExEvJ2Ok7a4uMpASjtnH8FmeBnxGm++HLOAZre49J5nqa77JShtJ+aNR/RFgg7W/Qv2vw0LqpAd/T/wnBxH/2JFhWhJz1r3HEc/iJY4oQcfpdgVcu+okY5xjooO3jHJ180FY75KCWAfOYItSQRiKVMZh2R6376bLXQNTSxd71N05n7t5iMiMUo3bouZ1WaFraNsmJcgLPZj1IKOdg3VM6gRuH9MduMnsqryVisuQze78SaUqfFxWeeDwYbNrcW5llUw/qssmH4b7zo2L6dwh9UvmIiqitCOWI0CfY4DzXJvsDebTi2bM7mh4ptEFL4vWwS2/HCxE+pxSJpMI3WsIq0QHE15kAdRLSIHNz/qaBo1O9ldaBPauXhfzIARbHyuByVzdcqTNp8rTxLFP3N+RpxrcjOm7cWz44fSKNgJjvhGJaq0tcnqeS9Q0XceSLA7aJn53Im+XZEtroGPbcxl7vd8o4gb0tqjt0B93YfIuJIDfFSKjdWgVApVD/2WG6XZ1hPA01zZXBiIKxIPkaN9J6meDuLVDz2HPtfr7+y0M2idBQbFjf/i1A7hbuSu2NyEIigw2dNbCEJd5/rRABBWFsezZnJtggqwSocKJuIsBTX2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(5660300002)(76116006)(86362001)(66946007)(66446008)(478600001)(66476007)(66556008)(8936002)(8676002)(52536014)(107886003)(9686003)(53546011)(33656002)(71200400001)(26005)(41300700001)(64756008)(7696005)(54906003)(4326008)(316002)(6916009)(6506007)(186003)(83380400001)(38070700005)(2906002)(55016003)(122000001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ySyplb/UADq53h+Tg9m6M8J9mFAOibtmHen6MX0YZddE6HwtMfvvXr47kbH+?=
 =?us-ascii?Q?rv/Xd+3aTJYxLaW1Gc5lnQLIKZj5DPG71KbgEcwozcaVhXnfD1zYli8/Vjbd?=
 =?us-ascii?Q?PVFDoSgin/UxNWEZwCkME++t2lzc+agMbmJGtTu0TiT1giQBzhB9/3ITTYoc?=
 =?us-ascii?Q?9caw91yIK3jP2Nk53a3tMo9r1aj4nsqLPms4ZAm/hsQE3+O9mQ6OVYpsz9sc?=
 =?us-ascii?Q?2YGe564RCNkNNpwEs4Zyq+IE6lY7ujNBa6WifSaRuFANDsSf+Y2YWET0Pvyn?=
 =?us-ascii?Q?Og4ZdY0jTRcswqQiTZ1b8YIYt1pWXbJGpY4BSmb/9/Up23VUzqJFO5ZQJ4rH?=
 =?us-ascii?Q?nzXFm8V++E18qGB2SxjUur6lGOfbCBjz0vdpGzzSUqRFHI6UnQSaDrIVU3ex?=
 =?us-ascii?Q?W4i5aDa8rleyyHaVKhfTzJpdgSYe7T/zgc5drJv7j0dhkQv9D45eELVsWmmk?=
 =?us-ascii?Q?kBJSFuiZbh+AvaNLYSgnGub0Zjau6qoo8j6vTed/eEs3sSIQXl8G9DwI9uWd?=
 =?us-ascii?Q?sWN/ed2brSkG6UYPdcX8tv/N47is/T/sFuirgnS46UaFzoL6Y919kVTHtnyX?=
 =?us-ascii?Q?OY3DrJ9IkoKGepu7Q3z0arWrMUQRXUx8sWt2pWp3yNd01shTZc0T7KCrllj+?=
 =?us-ascii?Q?inhc2of2tctZdB/ySD9UKmUe7jnGGsAbNERW26TzBHGZmRPM7Ch8blGzf1/Z?=
 =?us-ascii?Q?9oDVKMYN3r2Ls5BRKRJgqFA2Q3WOhNrpL0Z5N5aeybZFGjhwfSsSNxOfCqjG?=
 =?us-ascii?Q?9SRSBpAPU6lL+u+ROORvVPMozwr/WM3onulLl7q/0tXqHsbrXrEj5xox86Jm?=
 =?us-ascii?Q?YOeTwMn5tgqzICd7iV7coybc+r+7UfyzaS0lWys3Y25ORHpkeWmR/wDP/MlQ?=
 =?us-ascii?Q?vwnf2q4yA5rY/0C0phB5NNfn/zGmUbVscatz2TILdGg4fpGL6VRtBY2Zm65r?=
 =?us-ascii?Q?8YxRyf2NgCIVfnmddSmDcLq/ZGnZeI2706I67t6yGfZ+5nGzHepBVoZoK1w1?=
 =?us-ascii?Q?qLN9aejeoAlYLmqRB4WUf912hpJ1YmLheY1dEJgefVjJVJBn7r0NrHX6pM0H?=
 =?us-ascii?Q?2Vd0tBhbowozEEQEs8qC7Z16V83DWv9YT/VoJkHZ4rggi4zptOouX9PjJFho?=
 =?us-ascii?Q?wqbURpBI0txd7G66W9PTThHy+8JHTsRvMSdHYfZgiJdwTvhqL8DwaYGzO8lh?=
 =?us-ascii?Q?NHPhT+rf9cfH7g+IQTv+a+dw34RQJYFbzK4Nla8nsM1IoSlfUSS1XFHauuFm?=
 =?us-ascii?Q?MxInZKmIOWZMCry1lJS9dXrdKGDQU8Yvk7Bo+h78hZnH2/Wl3rFSU00oKIvj?=
 =?us-ascii?Q?f/9Ip6RRUW1aHMVRLixQ3/CR0i5HnkkPR7qqBMkrp8nQvzNdrrz3qDrhB8B2?=
 =?us-ascii?Q?aNoEIrDUgZe3se8Jn6HjZ+nggyz5v1O3PUQ4R63tpExo31fca//VFG/5eDsW?=
 =?us-ascii?Q?cDbLVo5AUteAbpxIRhbMsa2STJhcUxs+I8/T7QQcXDW3YT5AY37dnm6d2tvi?=
 =?us-ascii?Q?a5SrV9QaAAA3P/Gk0BIofsbiolz2XMUzr2FRyZcb6WgUYb2qIN7bnOi3yg64?=
 =?us-ascii?Q?arNsMc6zv4kz5JoSU0lau5lUeM8dVE8T+UM4KByJ4rLxbWxlGhV3JcGq42O5?=
 =?us-ascii?Q?iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d156e89-3faf-4c11-4bbf-08db5ff991e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 04:02:50.1791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fqeb+/iklZ7NREfaIr6AQaURDPJdjgTB+f5HsHktxHuWBJk4nF9CfAsFQVCWSSUowfhjH6duFa3+wRptPntTxoKXXfy2840yZFTsAHmPaMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: 24 May 2023 18:54
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset fai=
lure.
>=20
> On Wed, May 24, 2023 at 12:36:41PM +0530, Himal Prasad Ghimiray wrote:
> > In case of gt reset failure, KMD notifies userspace about failure via
> > uevent. To validate this notification we need to ensure gt reset fails
> > and there is no mechanism to cause failure from hardware.
> > Hence added a debugfs which will cause fake reset failure.
> >
> > v1(Rodrigo)
> > - Change the variable to fake_reset_failure_in_progress.
> > - Drop usage of READ_ONCE and WRITE_ONCE.
> > - Follow consistency for variable assignment. Either use
> >   functions for all the assignments or don't use for any.
>=20
> Thanks for addressing all of this. I believe we are much closer now.
> A few more comments below, that I could only think now with this new vers=
ion.
>=20
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
> >  3 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 80d42c7c7cfa..b3ac8b3ab455 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
> >  	int err;
> >  	int i;
> >
> > +	/*Fake reset failure should be disabled by default*/
>=20
> you are missing spaces around '*'... should be /* Comment */
Will address this.
>                                                 ^       ^
>=20
> > +	gt->reset.fake_reset_failure_in_progress =3D false;
> > +
>=20
> but I also don't believe that you need this chunk at all since reset stru=
ct should
> be zeroed on allocation.
> probably need a double check to be sure.

Will confirm and make changes in next patch accordingly.
>=20
> >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> >
> >  	for (i =3D 0; i < XE_ENGINE_CLASS_MAX; ++i) { @@ -601,8 +604,18 @@
> > static int gt_reset(struct xe_gt *gt)
> >  	xe_gt_info(gt, "reset started\n");
> >
> >  	xe_gt_sanitize(gt);
> > -
>=20
> probably good to keep this line
Sure.
>=20
> >  	xe_device_mem_access_get(gt_to_xe(gt));
> > +
> > +	err =3D gt->reset.fake_reset_failure_in_progress;
>=20
> Atomic is really not needed because the gt_resets are serialized but some=
thing
> like test_and_dec maybe could help to get a cleaner code here. But really=
 up to
> you.
>=20
> > +	if (err) {
> > +		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
> > +
> > +		/* Disable fake reset failure for next call */
>=20
> we should never add obvious redundant comments. The line below is enough =
for
> a code reader.
Will address in next patch.
>=20
> > +		gt->reset.fake_reset_failure_in_progress =3D false;
> > +
> > +		goto err_msg;
> > +	}
> > +
> >  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  	if (err)
> >  		goto err_msg;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 8bf441e850a0..13d2a974bc00 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *=
m,
> void *data)
> >  	return 0;
> >  }
> >
> > +static int fake_reset_failure(struct seq_file *m, void *data) {
> > +	struct xe_gt *gt =3D node_to_gt(m->private);
> > +
> > +	gt->reset.fake_reset_failure_in_progress =3D true;
>=20
> I don't like other components touching variables directly like this.
> we should probably have a xe_fake_reset(gt) function in xe_gt.c that does=
 this
> set and call the reset async below.
Sure. Makes sense. Will address in next patch.
>=20
> > +	xe_gt_reset_async(gt);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] =3D {
> >  	{"hw_engines", hw_engines, 0},
> >  	{"force_reset", force_reset, 0},
> > @@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] =
=3D {
> >  	{"steering", steering, 0},
> >  	{"ggtt", ggtt, 0},
> >  	{"register-save-restore", register_save_restore, 0},
> > +	{"fake_reset_failure", fake_reset_failure, 0},
> >  };
> >
> >  void xe_gt_debugfs_register(struct xe_gt *gt) diff --git
> > a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7c47d67aa8be..746d65c4aacc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -168,6 +168,7 @@ struct xe_gt {
> >
> >  	/** @reset: state for GT resets */
> >  	struct {
>=20
> 	please add documentation here.
> 	/**
> 	* fake_reset_failure_in_progress: A bool to indicate a fake reset
> 	* failure has been triggered
> 	*/
> 	or something like that...
> > +		bool fake_reset_failure_in_progress;
> >  		/**
> >  		 * @worker: work so GT resets can done async allowing to reset
> >  		 * code to safely flush all code paths
> > --
> > 2.25.1
> >
