Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC72EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC94F10E2F8;
	Tue, 27 Jun 2023 18:02:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D8610E2F8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687888947; x=1719424947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b/9u5gFmO20cCzjmkvwUbski6obvbrnKrgqTktmToE0=;
 b=K5AWXFLsRcQlnp6Du1+E9ImbYotdEuWYzmi8oWnWOwRQp763RcsCA1pP
 K4WcMqrYanwhwliXG0s2SDHt02U0596PRc32SCH5YeuOgk3j7pkdsg4Ji
 yUTWKT2f78+dTKoi6lW/DtmrEv3LQni9ur91IIwfyhobkbR/MWFZl6EUB
 sv0Tw+Cpmyo+BzCORp83vlicthK2Lg7nBhDFwlmSrpdJotZSHma/GDs0f
 LseJvp/IH7AczaKM9O7be2VOqNA6ZfPi+MXeLwHWkfOUC2d0rbUDJRjkK
 e+dYCXwVvRDIrYX4Od4PVWZ85nyeZD4ZE3RrhqyMGi0zDXRgGp+bGFDQu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361687346"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361687346"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="693993683"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="693993683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 11:02:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:02:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:02:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 11:02:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 11:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3+ZGB8ZFG+x7j1aPY8VAm+VMx4ic7nSfL8P52+hDSg/l7cdCpjkXwz9PA0sK+fH6HoIQ0ydaxNVnLmSna5g0PZzsAo0wEfeiUCOpU2oRx5KQLcvzqHVL79EEdzEkXFAzEvfdnAoqEE905mTul8k2zkuXw3Mnhg8xadsmMjG+gaVyZMthoTKgCFtq03X0pzeztntjFME4Fwp4t4klCwmIdkNAzgdCBREpTlxDyLgEXm0IlvcqP58PTQVLMdxtcK4r5dh1LSb4466q1FE+vYkqo2H3wpDy64NLcZjBqSBsvsD6LtXW6pI7AsviMZfTWiJjfwwYEP5Y1B2cyYfWOq0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE9r1i5n5pW/r2s+6K7AGxifLDQLQNJqmjuHf1FZT84=;
 b=H0Q5OMIEYY1r8H01M3frM0n8hZxAXM4m2qMFM4Lq6cabZks/b4j1Lm2mEWqqrvOF3UAvH5KJV1vSk3AhPAwDVTOBzcmireWjK1i9Mldwl5FsT/nEX967oW1nMJ26cnvPL7SlcXskhRNYMj9IN3fkwfM+s43Tnxhgn9s0iOA43rAz3i85LTyvDlqPt3us24R4FdxvpWVA7M9iG9VUPz+wDIvUV8vHnJp8xuafbP/hkUJ8Tk8kg6HXpj34MeemwQSIhDbkIPAUdq1ZV5CJbF+owA9G4tzYDoxbhDjj+Kv13gaGremnK02o2cICm0m14eIgBhdkTHceaa8E0Zq4+10HHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 18:02:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 18:02:00 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
Thread-Index: AQHZgk9opp0VN5cF5kicAhdiYtpyCq9Uf8YAgAB2WzCABpaLgIAAjssAgACy4RCAQm2mMA==
Date: Tue, 27 Jun 2023 18:02:00 +0000
Message-ID: <MW4PR11MB7056E44F5679C86CE3FF0FF5B327A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
 <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
 <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
 <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB7728:EE_
x-ms-office365-filtering-correlation-id: 9d67e2c9-3fe7-49d0-693f-08db77389ab4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T63p6SMGEEfe0VgEjp5NoPhFpyC4u7nJ7zSArUbBQbjrcwv7x6tkcNDAAPpCs1wBXpk3xKXnTCSswHHybwi/CUB3/JZYzsHgbe+Tl0KWbjF5B3sWq8qJrnUItvXhsiOdSJHnYWhpDXlj24HhU+DeLQ6Rke0gXQmQkKvZ+1WsM2Y1bpQFlkr960hE25Hmor5Rz50yHR8Rx729kcpRN4VCZSb8NDsXv1La7Zh38gBju1J9xPGXerII2KuhrB4pG7XXkUa7GHuEpB+EygZGuAtWwGOy2W5ksMaz+IQ5p0ba0VDRVE4klgIwgVF639JF9zptXuun5FahkEws8AHk7iLaHTz8Ub0y0rIM7kB5Gw+wtAPXpFrycVV2UF2bcJPXCUbbM0jx92XJ+08orM+4hYLgL7JsOg5qE54PftlvzIReo5Nx9U9TrkkEU5B4k1z13FNYj27F5JH8V4Kg7jv2LHashYE84cRtBRDx4JzjEuXm0x4LSYIu8aZrd6W+hbL25cJKLO3l3pwFSPohavVXDdKUNLgtRNOJzIc3yUEe3mKGDp7g+xk82Am7ahwRmRgQTBJ66ndtsnAo1wdLDP+agVVydiWqUK0oHfI0kIKJuNPnzYVj2QhEst5BwfR5e6jzEFA6ZwNUT/5oXpX8zYEGM55VVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(9686003)(107886003)(966005)(54906003)(71200400001)(83380400001)(110136005)(7696005)(478600001)(6506007)(53546011)(186003)(26005)(2906002)(5660300002)(30864003)(52536014)(76116006)(82960400001)(316002)(122000001)(38100700002)(55016003)(6636002)(38070700005)(8936002)(8676002)(86362001)(66946007)(4326008)(64756008)(66556008)(66446008)(33656002)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rogn2WtfUck7phT+s1Uh0lzxYS6vM073nS1VgqNUo1RZRTMwa3i5Ym85srzM?=
 =?us-ascii?Q?IxRYT3ZUXjlZjF72FQE2g0YPSod7EnockVTps9D/6+eZJ4kmjWldSB06daOR?=
 =?us-ascii?Q?wQUwuV8G6efI0hdZxSsEZuNLOB/AIJk09DNTkqrEN7v4YwLVny8zjVazyYU/?=
 =?us-ascii?Q?cWgebVCcAdKkk5U6+toEyl/5NssqN2lyvHwJ2XeLixQTgCc+PxT0SRjGrcqS?=
 =?us-ascii?Q?bF0x1FLJ1ATSofjQwnXHKISyJ+JMA9w60+2QuQahGsj4cTogZr7E2DclOvV0?=
 =?us-ascii?Q?Z+AAEuTEmNgZSQfwl298XKkBHPC1nFc+RPe3RxAO4pSBqDqB8OfTvsI+FbNa?=
 =?us-ascii?Q?KcYOFlx5VVJAENM0nIVnaHZjoYpBP+m6tSFn/pmEn75e/h6K4uzr+atWlSQO?=
 =?us-ascii?Q?36ayVy4bnd3860VsU0OTXlnbax1+9m6vlKhmpoRGk6mFywL7dE/CvmY84l3j?=
 =?us-ascii?Q?/96puDHK0IV7O3S7Q7Ayhyhuz2Io1rxPaQSBfl0Y1cMKzKR8bigvK/TuI7zy?=
 =?us-ascii?Q?orrisrFoSoTVf4VhQCHKAntFAJMqjcf5pGiIE9DrsZpDV69QpX8MZIQKPTeF?=
 =?us-ascii?Q?4wwdkwGhlI4Ck5APlqPHSUE/P2JXY4T6JWdit2yTGdxoBu6+F+cnvHf/3V9m?=
 =?us-ascii?Q?rBGTHhBEmoeuMoz5y1c3g77o4/hKtDsSqBhg8xVEvdfWwFofWbawjZn6RvF1?=
 =?us-ascii?Q?m/W1Gu9URA7OWJQHm6FaoIOcNeml3yYpGOCZGFBharA13WDiJVYqMWurhbtx?=
 =?us-ascii?Q?wjERHEyb1pLMeyYZqEHa/SeKbUUIoKSIgWIy/dWJsS7UkKVzjYktkf+Up2Mu?=
 =?us-ascii?Q?Y7+v3XzuNZuJ3Ovve6KKKIWCYaxSZ5kr1tNGQn3DAOvqvgy95p2Ml38xCgfZ?=
 =?us-ascii?Q?llvkVzkXePW5m8Ae2XUxb2iWz05xpJilvIxye15hEZ/20GKGrdnYEnr/sTMR?=
 =?us-ascii?Q?6zk/b1a/WOyLZHezdp47zNdbSfMDE6dAAbozqvj4k+3L5wpwrwHAqTtsr3Jd?=
 =?us-ascii?Q?OSKZHhEKvOjpyL6pqM2aT+I6ccTVYqh12A35ZTtyxwae2tZljFb7mkf4CUGh?=
 =?us-ascii?Q?NfMLQt4/AFwK6DxNhqJgsHKOgg4P+QpWJV7NozQur5wqfhlnU6yHHBme9t8J?=
 =?us-ascii?Q?EHnQ+aOH1ZWyVlJP0a4CynL+y0Julbc0DoPW0iluF0RTiB3vkP3wuUtEPcq6?=
 =?us-ascii?Q?msI0iuYtUnU/WdZovDxDx9B4pOZ4wsFTitkgkeMQ3hQ2QIlz8Ngnjvgzk0N4?=
 =?us-ascii?Q?xsL+b7ArkEcpXuefZJjK1iXtXAR9UH0by/li3qTOXms30PWi22dddj2ptK/B?=
 =?us-ascii?Q?lozVcJu+L0cn5VoCgBx5WuGBheYuRJAS+9OXgHgApuhCkz0AaSHaXEK8kfuy?=
 =?us-ascii?Q?JamaEP4qi6oD9rrAFWivL5X2LdQoKNu8srMnwtMkAqEW1HTQGygEsbXoqqnw?=
 =?us-ascii?Q?wvk7nUMZBVcpZzgw3p7B9pPU49qDeYTMU+t1b1ngRBOhEQWqS8v9ZTWt3v5J?=
 =?us-ascii?Q?Edemm5h0BWcFlN3CMkdlI7EdqJVKEa4P9qE46gCE78M89PqaBoBZ6DkkE5t+?=
 =?us-ascii?Q?+BS3pEsJoo2bVwLlrlwdEatdbM0RZ/Kz1Yk3X1kMLe85sDMhVYfd9xOX2l2w?=
 =?us-ascii?Q?RA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d67e2c9-3fe7-49d0-693f-08db77389ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 18:02:00.0315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYtDo+hbIHw6naGWbZQDD0BXIcMR/LAi8vNksX6HIFPhbxXiAFGIum53BNz1A7kXslj8Zm7tcwK3LAV8ViQChv9DV5oPGLRSXUvpmIfMvRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Argenziano, Antonio" <antonio.argenziano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad
> Sent: 16 May 2023 17:12
> To: Rodrigo Vivi <rodrigo.vivi@kernel.org>; Nilawar, Badal
> <badal.nilawar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Harrison, John C
> <john.c.harrison@intel.com>; Argenziano, Antonio
> <antonio.argenziano@intel.com>; Iddamsetty, Aravind
> <Aravind.Iddamsetty@intel.com>
> Subject: RE: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> engine/gt reset fails.
>=20
>=20
>=20
> > -----Original Message-----
> > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > Sent: 16 May 2023 06:18
> > To: Nilawar, Badal <badal.nilawar@intel.com>
> > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org; Harrison, John C
> > <john.c.harrison@intel.com>; Argenziano, Antonio
> > <antonio.argenziano@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> > engine/gt reset fails.
> >
> > On Mon, May 15, 2023 at 09:46:47PM +0530, Nilawar, Badal wrote:
> > >
> > >
> > > On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > > Sent: 11 May 2023 10:07
> > > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > > intel- xe@lists.freedesktop.org
> > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace
> > > > > when engine/gt reset fails.
> > > > >
> > > > > Hi Himal,
> > > > >
> > > > > On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
> > > > > > Send uevent in case of engine reset or gt reset failure.
> > > > > > This intimation can be used by userspace monitoring tool to do
> > > > > > the device level reset/reboot when GT reset fails. udevadm can
> > > > > > be used to monitor the uevents.
> > > > > >
> > > > > > v2:
> > > > > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange
> > > > > > variables in Christmas tree order(Tejas) -Check
> > > > > > GUC_GSC_OTHER_CLASS(Tejas)
> > > > > >
> > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 23
> > +++++++++++++++++++++++
> > > > > >    include/uapi/drm/xe_drm.h          |  8 ++++++++
> > > > > >    4 files changed, 68 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > b/drivers/gpu/drm/xe/xe_gt.c index 3afca3dd9657..2c3ffa1db74e
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -8,6 +8,7 @@
> > > > > >    #include <linux/minmax.h>
> > > > > >
> > > > > >    #include <drm/drm_managed.h>
> > > > > > +#include <drm/xe_drm.h>
> > > > > >
> > > > > >    #include "regs/xe_gt_regs.h"
> > > > > >    #include "xe_bb.h"
> > > > > > @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > > > > >    	return 0;
> > > > > >    }
> > > > > >
> > > > > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe,
> > > > > > +u8 id)
> > {
> > > > > > +	char *reset_event[5];
> > > > > > +
> > > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > > +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> > > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d",
> > id);
> > > > > > +	reset_event[4] =3D NULL;
> > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > > > > +reset_event);
> > > > > > +
> > > > > > +	kfree(reset_event[3]);
> > > > > > +}
> > > > > > +
> > > > > >    static int gt_reset(struct xe_gt *gt)
> > > > > >    {
> > > > > >    	struct xe_device *xe =3D gt_to_xe(gt); @@ -639,6 +654,9 @@
> > > > > > static int gt_reset(struct xe_gt *gt)
> > > > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > > > >    	drm_err(&xe->drm, "GT reset failed, err=3D%d\n", err);
> > > > > >
> > > > > > +	/* Notify userspace about gt reset failure */
> > > > > > +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> > > > > > +
> > > > > >    	return err;
> > > > > >    }
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > b/drivers/gpu/drm/xe/xe_guc.h index
> 74a74051f354..a3637eeaaa37
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > > > @@ -56,4 +56,23 @@ static inline u16
> > > > > > xe_engine_class_to_guc_class(enum
> > > > > xe_engine_class class)
> > > > > >    	}
> > > > > >    }
> > > > > >
> > > > > > +static inline u16 xe_guc_class_to_engine_class(u8 guc_class) {
> > > > > > +	switch (guc_class) {
> > > > > > +	case GUC_RENDER_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_RENDER;
> > > > > > +	case GUC_VIDEO_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> > > > > > +	case GUC_VIDEOENHANCE_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> > > > > > +	case GUC_BLITTER_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_COPY;
> > > > > > +	case GUC_COMPUTE_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_COMPUTE;
> > > > > > +	case GUC_GSC_OTHER_CLASS:
> > > > > > +	default:
> > > > > > +		XE_WARN_ON(guc_class);
> > > > > > +		return -1;
> > > > > > +	}
> > > > > > +}
> > > > > >    #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index e857013070b9..d068af0ca7df 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >    #include <linux/dma-fence-array.h>
> > > > > >
> > > > > >    #include <drm/drm_managed.h>
> > > > > > +#include <drm/xe_drm.h>
> > > > > >
> > > > > >    #include "regs/xe_lrc_layout.h"
> > > > > >    #include "xe_device.h"
> > > > > > @@ -1589,10 +1590,26 @@ int
> > > > > xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32
> > > > > *msg,
> > > > > >    	return 0;
> > > > > >    }
> > > > > >
> > > > > > +static void xe_uevent_engine_reset_failure(struct xe_device
> > > > > > +*xe, const char *name) {
> > > > > > +	char *reset_event[5];
> > > > > > +
> > > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > > +	reset_event[2] =3D "RESET_UNIT=3Dengine";
> > > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%s",
> > name);
> > > > > > +	reset_event[4] =3D NULL;
> > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > > > > +reset_event);
> > > > > > +
> > > > > > +	kfree(reset_event[3]);
> > > > > > +}
> > > > > > +
> > > > > >    int xe_guc_engine_reset_failure_handler(struct xe_guc *guc,
> > > > > > u32 *msg,
> > > > > u32 len)
> > > > > >    {
> > > > > >    	struct xe_device *xe =3D guc_to_xe(guc);
> > > > > > +	struct xe_hw_engine *hwe;
> > > > > >    	u8 guc_class, instance;
> > > > > > +	u16 engine_class;
> > > > > >    	u32 reason;
> > > > > >
> > > > > >    	if (unlikely(len !=3D 3)) {
> > > > > > @@ -1608,6 +1625,12 @@ int
> > > > > > xe_guc_engine_reset_failure_handler(struct
> > > > > xe_guc *guc, u32 *msg, u32 len)
> > > > > >    	drm_err(&xe->drm, "GuC engine reset request failed on
> > %d:%d
> > > > > because 0x%08X",
> > > > > >    		guc_class, instance, reason);
> > > > > >
> > > > > > +	/* Notify userspace about engine reset failure */
> > > > > > +	engine_class =3D xe_guc_class_to_engine_class(guc_class);
> > > > > > +	hwe =3D xe_gt_hw_engine(guc_to_gt(guc), engine_class,
> > instance,
> > > > > > +false);The The instance here is considered as physical
> > > > > > +instance of hwe but while
> > > > > submitting contexts kmd passes logical instance to guc. With
> > > > > that I assume guc might be passing logical instance or for this
> > > > > notification it is passing physical instance?
> > > > AFAIK for reset failure notification the instance passed by guc in
> > > > g2h
> > payload is physical instance .
> > > > @Harrison, John C Can you please confirm ?
> > >
> > > Spoke to @Antonio, he confirmed that to notify engine reset failure
> > > guc is reporting physical instance to host.
> > >
> > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> >
> > I don't believe this is what we want here still. At least not from the
> > sysman perspective.
> >
> > After guc reset fails, we will try to reset the GT ourselves and if we
> > succeed we don't need to request user space interference.
> >
> > That should only happen if we also fail our gt_reset after the
> > guc_reset failed.
> >
> > That would be the similar point on when i915 gets wedged?
> > We probably also need the wedge point here before we can issue this
> > notification?
>=20
> Hi Rodrigo,
> You are right, In case of engine reset failure the driver tries to do the=
  gt reset
> and if gt reset fails there are two notifications one for engine failure =
and
> another for gt reset failure. The changes to send uevent in case of gt fa=
ilure
> are added in xe_uevent_gt_reset_failure.
>=20
> Level0 UMD does sends the RESET_REQUIRED uevent in case of only gt reset
> failure.
> Engine reset failure notification is not used for this purpose, it is to =
provide
> information that engine reset was required and it failed.
>=20
> >
> > Anyway, we also need IGT for the uevent itself.
> The IGT for uevent listener will be helpful only if we can inject errors =
in such
> a way that they lead to engine/gt reset failure.
> I am unable to find a mechanism to do so. Can you provide some input on
> the same ?
> BR
> Himal

As it was discussed there is no mechanism to ensure engine/gt reset failure=
 from HW perspective to validate these changes.
The recommendation was to come up with a debugfs which can fake gt reset fa=
ilure and use same with IGT.
The series covers the debugfs entry https://patchwork.freedesktop.org/serie=
s/119784/
and https://patchwork.freedesktop.org/series/119390/ covers IGT. =20
Requesting for further comments and conclusion on this patch.
> >
> > Thanks,
> > Rodrigo.
> >
> > >
> > > Regards,
> > > Badal
> > > >
> > > > >
> > > > > Regards,
> > > > > Badal
> > > > > > +	if (hwe)
> > > > > > +		xe_uevent_engine_reset_failure(xe, hwe->name);
> > > > > > +
> > > > > >    	xe_gt_reset_async(guc_to_gt(guc));
> > > > > >
> > > > > >    	return 0;
> > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > b/include/uapi/drm/xe_drm.h index b0b80aae3ee8..79ef5947c172
> > > > > > 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -36,6 +36,14 @@ extern "C" {
> > > > > >     * subject to backwards-compatibility constraints.
> > > > > >     */
> > > > > >
> > > > > > +/*
> > > > > > + * Uevents generated by xe on it's device node.
> > > > > > + *
> > > > > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt
> > > > > > +to reset
> > > > > engine
> > > > > > + *	or gt fails. The value supplied with the event is always 1.
> > > > > > + */
> > > > > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > > > > +
> > > > > >    /**
> > > > > >     * struct xe_user_extension - Base class for defining a
> > > > > > chain of
> > extensions
> > > > > >     *
