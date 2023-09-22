Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A431CCD4F4F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 10:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F0910E649;
	Fri, 22 Sep 2023 10:14:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20410E649
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 10:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695377680; x=1726913680;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uryBzlsLP2dwnB9Itz/PJpoEsUMv5XbAVFkqVIZhkGI=;
 b=llTufxyMfDAoOE+WCQKuraA/D44LfuYYgyjRbS7TQOpzjYbILaaCcueX
 wzKr+Ov82rQE0dyow1ivXlJDjztgDfn/1ywTej1s5jRbcAnUkjMahIMPl
 Lihm/A09aleF4rC4nh6cB53zS/7E0rOKanCdPHRTJ9S4XW/caKtA60atZ
 SQcHHUX/+edokVYx678Q2zWPWmW4w8g3YASoPr4tvtHK66P0gAi/HQSN+
 ISx20N+oSKpQurMhEQpPnftIo5OlsjAFPYANiLdepRBYQ8H/8K0QGyJVD
 852GoeK2cCzUDYL7P2cP3FLWm/DjFuFuKHDs8zs+RDtY5ij8gP97QdGcc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383541924"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="383541924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 03:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697121641"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697121641"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 03:14:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 03:14:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 03:14:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 03:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8Nm+Hj9SJQ9MuYlmWaaCAq0NSDielNNo3aQBfRWB5v/fBqt0Li9cbSuGcp3wCFOzdhztja/tqUTaTTI3NEe5dvOKtOThykRq5ucA+qIqSc/uTltovFKAdVlQFPJVDdKztyltz0CUygUGuf6MXRVE4HfQRH4BHbOsXyYRrItHzUedMBeMdse6rDv2CGdfryCrjkpnw6KmPbWjUsi0BZDo/WzgtZzY8OCgsLAdg7OB0OW4iNAMadvhrE0YJMv0YqhtDLFJRz336+dDNfRlB+czLbxvEtgHJZJoO9tH7SLYOTKH+LXewdVXXPzHkFFVzUDFSJl3V5Gdt51zghtUDPz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdAIasztIK6lwJIezUUeknGoNzsomb2LDwj2m2mR1+s=;
 b=nA/fmiiU9RsA7Y8vkljC5xT0XEANWOmwJhBZuisJv+hUO0bBNV+VxQMNX3cgbgvjRewoBK+hMi4ClYC9GSP17w3BnqJTP1nqVELadWKg0V6FlA1BnKojQg/1Txx0GU2iAWnNGwzdfs4uPYRn9NC3Km7YiJ5BaxCkEeYVSGHOJuWd4wcYllHW6sbHhRXPD7t2xuPDEbz+QNKK1T2eAS38gjF4LC5ASIw/1HStplXqYbiZox5SXogX5Z0V3ZAZxcsyxUB6YsZVFlaLiIqrEkSnL6QuMrjOqXmljJGTQoxUpt+hsb3oMnJApHAfajLGs5/QMVykkGgtqnTbwFOBh2Sw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8511.namprd11.prod.outlook.com (2603:10b6:408:1ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 10:14:37 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:14:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Remove i915 check stubs
Thread-Index: AQHZ7S8zBRKCnqNNH0qa5m/V/p5ZQrAmk5GAgAANCyA=
Date: Fri, 22 Sep 2023 10:14:37 +0000
Message-ID: <SN7PR11MB67506BDDC04E02138C1C428FE3FFA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
 <20230922082909.334085-2-suraj.kandpal@intel.com> <87y1gyo8we.fsf@intel.com>
In-Reply-To: <87y1gyo8we.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8511:EE_
x-ms-office365-filtering-correlation-id: fb2d0705-5f42-4337-6ca7-08dbbb54b9d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U5mR3zq1+okcTE42VjCcf4zg7jxK1jZDXFO4Gs50/ng8Z/+oj14Mjyz2nR9GuwU2imeVNBXBXd+HwbTo3BGJJx46Jvc5Ke/kX/vUJTNWyTyIcIOMcbrp4fGZyEcsiJT7l3aEKHzD3Mxg2SrmJ5rhII2NyHz3SGOgMV+nKR8pBOUwFgbe/E/Ur7jKQ8+YR9zholrEBl4Gj7yozR5m30qUtiwFZwwcy7BHfVi32PgrN0AMdCdPsK/CEMc3yjgGGRiPBD7jnv3TZ69W5+6dSLIzhkWDXTKn/O13kzQypZH/vkA6Weff6W5HYDGU08xfVT0Mz8xVjxIUeGduuI0OuT1hTzyebfUCIUN+q5RrLZ6P4ExgXFUfzrlL8cKdlttflIeaJ7ZDEm7DQTLIY2VVjY4kXUizwdQ2c6WGFimOPx/EMMjMv5RkYqZl57dPGcv4LpJLA7rTdIHqU2OfOiwFkQCM59vbUeygIhCb4ykWOk7xHriCYV43RhRhhL3uNLJ5maiVll1TwOdmuXh+Hgx7yle1JJeGBpyfU4+ndyQWmmfE/mUNQ7A9C2YFKT111rs21rRNK/mZ8d1rXJ577d+7jb/rPbjZAez0AjH7LK0CWDbOvL3+ahqYZCSN6KpN6meaA1Ko
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199024)(186009)(1800799009)(66556008)(2906002)(83380400001)(38100700002)(38070700005)(9686003)(86362001)(6506007)(71200400001)(7696005)(33656002)(478600001)(26005)(8936002)(8676002)(66446008)(5660300002)(66476007)(41300700001)(55016003)(316002)(122000001)(52536014)(82960400001)(66946007)(76116006)(110136005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Psl/QAAP5npCM1Kultf+yW6DEBU+3N+4ASVFAXX6QGqAVWiUY+2n1KX4D93j?=
 =?us-ascii?Q?fQGGFPDDZjddtgdWGkBpfPCz7dtApDK0Dm1LxlaDx8nVSwfz3P7nJTNa/c/M?=
 =?us-ascii?Q?zYBDjeU0XXwRB+LrlcHJust2r5uhAKbKGqamkjF8vWg7FBAbrnoGJknhR62z?=
 =?us-ascii?Q?11klv9WUOlbX4S4WRIQh2J0E4Swumki7Fo+5QpUvFTQowMTdYHvNSFNQaXcW?=
 =?us-ascii?Q?NAROM9A+G6O03hRTb8GX1DP1Jh0Ha+SdjlROu/qAfTT4Ekkof67V6MIuf6Oz?=
 =?us-ascii?Q?+G9K6ncK8G1ffHn86htgUi+WVi7PsLs+5Cnv5zv3WCMGEhR4X5BNfRUaE8Iq?=
 =?us-ascii?Q?kdU6X6xtrwNMoxnqDj/5dAdFJ1dJ5cqFqwoznfJr1kpULA2ZtHf5KyUQjRze?=
 =?us-ascii?Q?DPX8cs6TkDBzLenAvTV0jewBSsFfqv4qyIUhfkR/bjH5ovf47dd1ZQvkQ3+i?=
 =?us-ascii?Q?tXVs1HaqfJffZHP/YBnkx6QUpLYgYtwPNt5oku5Y4Sz+O+6gSnk5Hfb5pIvr?=
 =?us-ascii?Q?Yv+FELU9BeMtdJMOE/xeLahoBJOjvHgB6PQOUb7uu7kn57/jmJclDM4XR12W?=
 =?us-ascii?Q?MOuKWI7hxcSAtmmQsXmJ0IWtwXpy8s9eb2vK/g9w5h2STldZNhXyY/H/CH4k?=
 =?us-ascii?Q?4pk6OGHqJqabAS6U7JHWJU6OenEfDRGx4E7MG6DvCqZjLSszZACmSqRg7YSS?=
 =?us-ascii?Q?V/AHipgbGG8xhE6FHBOV8XvcWMlFZxUFItGLclW8uzLflEk+wrYmQY6u+pPr?=
 =?us-ascii?Q?6Nlgy8CdIbq+h5J6Lwh/71QCKtG60FCki7YPcMHoBNmtUXHpDc2r14CxTHsX?=
 =?us-ascii?Q?iU8IqmUejIk9Q5Q2XEgArejzJpkhhavrZcggrfVihKUnTh8cYEF3Nn/vs23/?=
 =?us-ascii?Q?55YKvOTBWIZFadqJ6YFLVEOi3ZweEg+5AtZgnkf/Y9VyARef3sEv1EirQ+a2?=
 =?us-ascii?Q?VYDko0/KClJvReT9BkJ8Gi1omzq6rDLGAJFD+IBVM8DORfMXJMSR/mdn8aob?=
 =?us-ascii?Q?KCLJ/gloSiUxEOYwnpkT4zl7V9sgi/SSI0ZgilsJG3vVIuVdrfS1OQcfYKwJ?=
 =?us-ascii?Q?RFEwiKPoq9K5p8Kte1sa4U4hDpMYzxvb0PBfNFNBARpBRzUOYmBI+EiOBS3I?=
 =?us-ascii?Q?8Qlx3yjjUUBRXKCjYTSTY70LiU7cv4glVavdcP8SOKMdCDVV+D/epsjh1iaK?=
 =?us-ascii?Q?ycELM8NqIWIZFJ6dhYrNJGrEMf4cwQLwwyHbByjPjin2+8+YSPxb0mcPcl3Z?=
 =?us-ascii?Q?y7yqhA6jRMzoa0SoJ6HAP32GZsdY8BIfSNXtnb/yoEyjbG9eSTQvYNSjiBaF?=
 =?us-ascii?Q?d8I9DWoLnpcjowBmhyEIF/skjme1hNewqf6oPtOv/9XVIPsnKSGuGSgZ767a?=
 =?us-ascii?Q?OFE9fD8qYs73A5chtm69JeYh1FEDZvnoMk0oMpTRx1qi3doj9wxdL1oWauln?=
 =?us-ascii?Q?WnBXM5nIRbPz5vX9bKht5p8kdNCNUel6tSiCttf2GMaLvqI4qhqtm7ogQ55j?=
 =?us-ascii?Q?NdWME1g5C44OW73hY51eCm218aYkRZw9tPT/S7viFV4aMGpR1uhGzfplqeRo?=
 =?us-ascii?Q?Hov1m48p9OplDA1hi6X95NK8QJCYBETL10kiqGdb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2d0705-5f42-4337-6ca7-08dbbb54b9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:14:37.2123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmOz3KTjCUBEVX8khJdjLmOfdffyw4eU79yu1C8AefW6Gw077fvIQ5P56mdkuVwVCf/hSjcf2LMDN9NJAE3cTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8511
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Remove i915 check stubs
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

> Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Remove i915 check stub=
s
>=20
> On Fri, 22 Sep 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Remove i915 check stubs the subsequent patch will add function which
> > implements a cleaner method to share code between
> > i915 and Xe
>=20
> This should be a fixup! patch to whichever commit in drm-xe-next introduc=
ed
> the changes.
>=20
> See git commit --fixup to generate the annotation for that.

Thanks Jani will look into it and add the annotation

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index f617ccd206c8..a42549fa9691 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > *connector)
> >
> >  	/* If MTL+ make sure gsc is loaded and proxy is setup */
> >  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
> >  		struct intel_gt *gt =3D i915->media_gt;
> >  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> >
> > @@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
> >  				    "GSC components required for HDCP2.2 are
> not ready\n");
> >  			return false;
> >  		}
> > -#else
> > -		/* TODO */
> > -		return false;
> > -#endif
> >  	}
> >
> >  	/* MEI/GSC interface is solid depending on which is used */
>=20
> --
> Jani Nikula, Intel
