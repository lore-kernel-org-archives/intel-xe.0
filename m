Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A992EC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 09:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F67610E008;
	Thu, 13 Jul 2023 09:40:56 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1849C10E008
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689241252; x=1720777252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFTcoVWIFrBVTOo3dgc5FwgeWb2oYc7ZtxtNCx7XiDw=;
 b=AHs6xwFDyuIUwOSKP7X3mX9jFaNqf0pAQbVbNPasUZtIbcXPhzWvHEMr
 deoK5oZSibfs4cX6jK+y+F5uxKZG1r1t6E2CXgQiuFNphUoSXyTzx3AnO
 sgr9+7PmwOzdhNDwVAHrQKeSHiiXGnhZktW5Hd5kh8IFO2wwS9rwKQZKM
 7o0g5rkLX3U3p/DkqTf/PzXNQk8/bNhbR3GtM3Odzy6ebbOhnmIG2iKkP
 N+H15VzlZhFD8PIpstzxzKhesjTDdU0cMXkyCp7BHxaalJGWNix+xSZQ3
 6G+TC37tCQoWZk9rUIM9vhh/IwsG1s2oEBzI/eotRCBBzjPkdWSPjLDEx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349992002"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="349992002"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="699195908"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="699195908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 02:40:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 02:40:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 02:40:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 02:40:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 02:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtnqKiUDkK0CvSTqZHwTy9MviH6Vixx9Tfc0CjVzraZwWv1C1ZEsia1OMJq8axC8UCBEu9+33vQrzXQoNQaEHwCaZkE//UEvE+FwSZtNcPgdlncQamFW+y7zyCdNj8ccm9WYGPE+XDARoOnEE0UY3zUGfMSbRc9G02UOqhBmeS+oXwcKZfah9f56DLBgpiWMZgn5QA7oZEmu+SYjbigQXHECqYUVX8HJOiZgX2cWGzQOTiBGOPFH8eBLp8i3zV3Cj79P+rfr1jUAb+YGSaWuumWq/qWoi6fNm9pe3FR4v4k1MnEySdFTGzlxXLLD+60Utq+Fy89qHncXs2/9FyBpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8RYuK2lbLOZ9Qn7Bu7dmGE2RkqdW+Opn1KLYvzZ+Fw=;
 b=ZmVHTTh6Vcu5oukfdaigxh3FfNvV+yQljX/SIPiNJJcMGgHo4hWq1IxNt81gNL+APgnpIeO0qPKO8icmsRvlX+YKEmqMnMPGXhxBR3d39frq9Qnh75gNFqzt/PuzGomXBAR3FZKxR5y7Tz7ohGkXphs3VCbusfDOEkyfDgf0SBC01213DAqN5I84d6L4bh+HSfS+GgC2AIYVhWL+Ig3GtiEeUNaippSsMrc8CG/n5AeTi+3kpJR6yKRP2Xicieax+trkDjHa25bsM3R8SrmnznSDiOkf/+sqRsVAPCEthuUr/KvIa0ed2Lgl2oNaKFEWvk6XxgNsrEgjRb+R0WVU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 09:40:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::4fa:8194:73a4:4e2c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::4fa:8194:73a4:4e2c%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 09:40:47 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
Thread-Index: AQHZgk9opp0VN5cF5kicAhdiYtpyCq9Uf8YAgAB2WzCABpaLgIAAjssAgACy4RCAVsyqgIAENqGg
Date: Thu, 13 Jul 2023 09:40:47 +0000
Message-ID: <MW4PR11MB7056EEB77E1721674709F3D9B337A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
 <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
 <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
 <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZKw40ZEPac5HBC7o@rdvivi-mobl4>
In-Reply-To: <ZKw40ZEPac5HBC7o@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MN6PR11MB8171:EE_
x-ms-office365-filtering-correlation-id: cfa5023c-0f61-4233-6cfb-08db83853c7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WF+nAqGZwZnroVvCjmG1JhdOWciRdM3ubJSfh6dGYQGABkRtDArAuJtZly8sVlIUPEP9uol935gJDKSd/0hflFoA0NQC2Zh4Fu/BuQrQp9Z0vxzIkIdZynSbGuQUfWQ846m9v9CQjGmRPfc2S401jU+tVqQoKP8/XaVb0XPvr45mPvfMBuRBod5+i4l7BH3N3dElHbcbKmcfmoWkwY3f+JkyiftMl+ubWRnp6N3WqUiRT9zXu9z84f5k93ZXEAYVkLGNCrr8DuNiUTrubwgoar8J2y4evNmWcpKyT6v6zzqr8QYWrddqcIFJ+PEmLyE+9kXzqEL1pMMCJzjp0VHz6po7OoMsFZPNm48XIQ635uOzl5zWC6zrhAZ7l35w1maeGKFaD8UJOOkfYea3ZsOTlZV+4SySPkm7jHq/CZMZmTwT/0fwFLqf/I+vzYAC7QIJ6cp6roN+15Uqt2cJkSKf7G5/Kejd76uA+WhF6ctMIe20Oyf4o9alxoZwsg7wqOjLHUabyHoD9EYEqm0qA5PejChaT70lv7PwnCXP6FrcveVMKf8kXG0Q518Pa0Cu52PlcSMzjgivvo3VyZ8jtAfF2LwJm2mr3VcyqS3Lt5bfEMCWaToYVW1M+gpnbDI0gnf9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(186003)(86362001)(53546011)(76116006)(66446008)(64756008)(66946007)(66556008)(66476007)(316002)(83380400001)(107886003)(6916009)(4326008)(9686003)(26005)(33656002)(6506007)(82960400001)(2906002)(7696005)(122000001)(54906003)(30864003)(71200400001)(55016003)(38070700005)(478600001)(38100700002)(41300700001)(52536014)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H84eKN7Ld1B6xPVQxUJ/ArDCxoQuD6p/ewn9VzizWZlRKlCZStDqSoXSHLNJ?=
 =?us-ascii?Q?J67X9aFNFh2SuGkyT4TeXutDGZa2C/yvQp+KpJxB6Dhs1Ucyk+LvXtTeRlWn?=
 =?us-ascii?Q?FkFIlBT82GGgBTFCkFJsCcfqTZN+CayR984kQiw2gzvvbfFJUB+wJ+VccEjd?=
 =?us-ascii?Q?u3LFB5kV8xz7AzqQNRX6vkUC7OdiMM7jxzfWjbv7Pkxqqc0MW10dL3bKPTvr?=
 =?us-ascii?Q?hC/5cndCqFJ1pkh0WK9+WjZykDGqtxx6FWICzTzs0xUm+NB54GjSdMzdYvnc?=
 =?us-ascii?Q?w/UePKTIqJnyfSH+kBGTXhoHkM2J8PQhnRI8Rt/fzYKbHuHkAQv19WjaTxP6?=
 =?us-ascii?Q?36LVrofExbBeHo2TEy79eBNJrAPK7MlnzmuCyzF34Ij24HoSBvRxGzObTu2z?=
 =?us-ascii?Q?ggkMIvWzegBUpgCK10de+RRqfH2h7zcFN8Gd7CIupkFFaclHoLDx8rdydYVU?=
 =?us-ascii?Q?WwBSt3SeWj2MoF+J/MwULqgcYefPdOTsYuDpWXSrt3V9KAX06/8DkRw6oMaH?=
 =?us-ascii?Q?X0Wzds3QjDI9xscPcNgClmYFYWadpiBiK4aGbPGITwJ3jTuK4opPddPWZQ3k?=
 =?us-ascii?Q?pZLWBV9HCaNM3q5tWFND5uDYTfBNyWwKRolubkHWKJp/ZtdkMiLhJHVTcyhV?=
 =?us-ascii?Q?JWh/g2HEJGvNeqWgaanIFyvwJjFbGEkVmy0BYRRkTOBC1dBq4Crc9MCoFWQB?=
 =?us-ascii?Q?tTSd8tdDqLBwRAd5Ifvfmh6B5OzdArfnpELrobqqBBlD3452Gta0tn257fHx?=
 =?us-ascii?Q?xotHvKCTuKG84ZyKrLmUku+9M2CHI91KdhAOk9plNNQToFRxkqALkwd8gwok?=
 =?us-ascii?Q?hCdS0AFtQBf/3O/mKR1n8c+MK/xCDSBy379QyflJZErF+auY4VgY8GIK3cUA?=
 =?us-ascii?Q?xzi90idTZWmk+ljhuti2Iw45fSWtXvRAB54AMBUO/TfKxP85dgH7kIWnFidh?=
 =?us-ascii?Q?7pzjEsSLVhJAeNHF9VZlZ/83UWDcrYSv4OYCDBfdgkfwFqw7MCOn2C+wXWVj?=
 =?us-ascii?Q?TIg9Lu+VqfJ3poLYAZv6CE4Ms5D1ahjTZy7DZN7dJV7RhIXwQAOCycqObXNU?=
 =?us-ascii?Q?sPwr8PGajVVnfQJ4lZlXeT1u9fo4ukJ7anpznFjYgYuzBMYnwkEfJUnvjahX?=
 =?us-ascii?Q?uKZvU5GojwOmF8HqEroSifGonuDYqQ5tpBswH92mJYi/6vTm/B9EtLfZnfI9?=
 =?us-ascii?Q?Pv2cTVqkdnksX1KW9TLC9zVlCBSVqGQEqhHBQ0sraEw5sYY969gp2+45b8oJ?=
 =?us-ascii?Q?Wjb0jKj8jgqWYudVniKM5j6+1Kz6R9BPBaoxcuVcj4nBp9KGdNH32LkHSnxk?=
 =?us-ascii?Q?PBAjTaKyGRW61AD9OJrfBjMiRYC3PkSCrTw0IipfzvYVhCoDQIOa9jK/DaOz?=
 =?us-ascii?Q?j5Dqlp8TMJNFcnpYB18NqDaUqqG9Cg31vDmjtxFEvK4o5/FF8Kvk1yRFBkke?=
 =?us-ascii?Q?C6rbGM8xN4Tf5CiJ1z3dMuotmqnRjPyR4yN6RyKmmbH8JlWc6ASnZILvyCfb?=
 =?us-ascii?Q?mqBvZNpJjdu8VS5Ic1E2umLpdU7qtTYVSosyOua67+0rGDMxoFBbWIOh8VSm?=
 =?us-ascii?Q?ohKDlHrEAKPhkSUZ5cNqxp26e27h+ML4oSbXKFSaStUVwaEKUUQ2mjzVfmUN?=
 =?us-ascii?Q?CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa5023c-0f61-4233-6cfb-08db83853c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 09:40:47.1016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqNF9X4EXQGVKCdd9jj92o2g5smP9TpKdDe52YMRfGSOEw8+DjhwxNHF7v3bAa6PkVE1uL/sWIVPQ+qIjvOzP0gvFVX1fQVoELJpXiqAzX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

Hi Rodrigo,

> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: 10 July 2023 22:29
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-
> xe@lists.freedesktop.org; Argenziano, Antonio
> <antonio.argenziano@intel.com>
> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> engine/gt reset fails.
>=20
> On Tue, May 16, 2023 at 11:41:32AM +0000, Ghimiray, Himal Prasad wrote:
> >
> >
> > > -----Original Message-----
> > > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > Sent: 16 May 2023 06:18
> > > To: Nilawar, Badal <badal.nilawar@intel.com>
> > > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > > xe@lists.freedesktop.org; Harrison, John C
> > > <john.c.harrison@intel.com>; Argenziano, Antonio
> > > <antonio.argenziano@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> > > engine/gt reset fails.
> > >
> > > On Mon, May 15, 2023 at 09:46:47PM +0530, Nilawar, Badal wrote:
> > > >
> > > >
> > > > On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > > > Sent: 11 May 2023 10:07
> > > > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > > > intel- xe@lists.freedesktop.org
> > > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify
> > > > > > Userspace when engine/gt reset fails.
> > > > > >
> > > > > > Hi Himal,
> > > > > >
> > > > > > On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
> > > > > > > Send uevent in case of engine reset or gt reset failure.
> > > > > > > This intimation can be used by userspace monitoring tool to
> > > > > > > do the device level reset/reboot when GT reset fails.
> > > > > > > udevadm can be used to monitor the uevents.
> > > > > > >
> > > > > > > v2:
> > > > > > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange
> > > > > > > variables in Christmas tree order(Tejas) -Check
> > > > > > > GUC_GSC_OTHER_CLASS(Tejas)
> > > > > > >
> > > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
> > > > > > >    drivers/gpu/drm/xe/xe_guc.h        | 19 ++++++++++++++++++=
+
> > > > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 23
> > > +++++++++++++++++++++++
> > > > > > >    include/uapi/drm/xe_drm.h          |  8 ++++++++
> > > > > > >    4 files changed, 68 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > b/drivers/gpu/drm/xe/xe_gt.c index
> > > > > > > 3afca3dd9657..2c3ffa1db74e
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > @@ -8,6 +8,7 @@
> > > > > > >    #include <linux/minmax.h>
> > > > > > >
> > > > > > >    #include <drm/drm_managed.h>
> > > > > > > +#include <drm/xe_drm.h>
> > > > > > >
> > > > > > >    #include "regs/xe_gt_regs.h"
> > > > > > >    #include "xe_bb.h"
> > > > > > > @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *g=
t)
> > > > > > >    	return 0;
> > > > > > >    }
> > > > > > >
> > > > > > > +static void xe_uevent_gt_reset_failure(struct xe_device
> > > > > > > +*xe, u8 id)
> > > {
> > > > > > > +	char *reset_event[5];
> > > > > > > +
> > > > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > > > +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> > > > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d",
> > > id);
> > > > > > > +	reset_event[4] =3D NULL;
> > > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > > KOBJ_CHANGE,
> > > > > > > +reset_event);
> > > > > > > +
> > > > > > > +	kfree(reset_event[3]);
> > > > > > > +}
> > > > > > > +
> > > > > > >    static int gt_reset(struct xe_gt *gt)
> > > > > > >    {
> > > > > > >    	struct xe_device *xe =3D gt_to_xe(gt); @@ -639,6 +654,9 @=
@
> > > > > > > static int gt_reset(struct xe_gt *gt)
> > > > > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > > > > >    	drm_err(&xe->drm, "GT reset failed, err=3D%d\n", err);
> > > > > > >
> > > > > > > +	/* Notify userspace about gt reset failure */
> > > > > > > +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> > > > > > > +
> > > > > > >    	return err;
> > > > > > >    }
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > > b/drivers/gpu/drm/xe/xe_guc.h index
> > > > > > > 74a74051f354..a3637eeaaa37
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > > > > @@ -56,4 +56,23 @@ static inline u16
> > > > > > > xe_engine_class_to_guc_class(enum
> > > > > > xe_engine_class class)
> > > > > > >    	}
> > > > > > >    }
> > > > > > >
> > > > > > > +static inline u16 xe_guc_class_to_engine_class(u8 guc_class)=
 {
> > > > > > > +	switch (guc_class) {
> > > > > > > +	case GUC_RENDER_CLASS:
> > > > > > > +		return XE_ENGINE_CLASS_RENDER;
> > > > > > > +	case GUC_VIDEO_CLASS:
> > > > > > > +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> > > > > > > +	case GUC_VIDEOENHANCE_CLASS:
> > > > > > > +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> > > > > > > +	case GUC_BLITTER_CLASS:
> > > > > > > +		return XE_ENGINE_CLASS_COPY;
> > > > > > > +	case GUC_COMPUTE_CLASS:
> > > > > > > +		return XE_ENGINE_CLASS_COMPUTE;
> > > > > > > +	case GUC_GSC_OTHER_CLASS:
> > > > > > > +	default:
> > > > > > > +		XE_WARN_ON(guc_class);
> > > > > > > +		return -1;
> > > > > > > +	}
> > > > > > > +}
> > > > > > >    #endif
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > > index e857013070b9..d068af0ca7df 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > > @@ -12,6 +12,7 @@
> > > > > > >    #include <linux/dma-fence-array.h>
> > > > > > >
> > > > > > >    #include <drm/drm_managed.h>
> > > > > > > +#include <drm/xe_drm.h>
> > > > > > >
> > > > > > >    #include "regs/xe_lrc_layout.h"
> > > > > > >    #include "xe_device.h"
> > > > > > > @@ -1589,10 +1590,26 @@ int
> > > > > > xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32
> > > > > > *msg,
> > > > > > >    	return 0;
> > > > > > >    }
> > > > > > >
> > > > > > > +static void xe_uevent_engine_reset_failure(struct xe_device
> > > > > > > +*xe, const char *name) {
> > > > > > > +	char *reset_event[5];
> > > > > > > +
> > > > > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > > > > +	reset_event[2] =3D "RESET_UNIT=3Dengine";
> > > > > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%s",
> > > name);
> > > > > > > +	reset_event[4] =3D NULL;
> > > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > > KOBJ_CHANGE,
> > > > > > > +reset_event);
> > > > > > > +
> > > > > > > +	kfree(reset_event[3]);
> > > > > > > +}
> > > > > > > +
> > > > > > >    int xe_guc_engine_reset_failure_handler(struct xe_guc
> > > > > > > *guc,
> > > > > > > u32 *msg,
> > > > > > u32 len)
> > > > > > >    {
> > > > > > >    	struct xe_device *xe =3D guc_to_xe(guc);
> > > > > > > +	struct xe_hw_engine *hwe;
> > > > > > >    	u8 guc_class, instance;
> > > > > > > +	u16 engine_class;
> > > > > > >    	u32 reason;
> > > > > > >
> > > > > > >    	if (unlikely(len !=3D 3)) { @@ -1608,6 +1625,12 @@ int
> > > > > > > xe_guc_engine_reset_failure_handler(struct
> > > > > > xe_guc *guc, u32 *msg, u32 len)
> > > > > > >    	drm_err(&xe->drm, "GuC engine reset request failed on
> > > %d:%d
> > > > > > because 0x%08X",
> > > > > > >    		guc_class, instance, reason);
> > > > > > >
> > > > > > > +	/* Notify userspace about engine reset failure */
> > > > > > > +	engine_class =3D xe_guc_class_to_engine_class(guc_class);
> > > > > > > +	hwe =3D xe_gt_hw_engine(guc_to_gt(guc), engine_class,
> > > instance,
> > > > > > > +false);The The instance here is considered as physical
> > > > > > > +instance of hwe but while
> > > > > > submitting contexts kmd passes logical instance to guc. With
> > > > > > that I assume guc might be passing logical instance or for
> > > > > > this notification it is passing physical instance?
> > > > > AFAIK for reset failure notification the instance passed by guc
> > > > > in g2h
> > > payload is physical instance .
> > > > > @Harrison, John C Can you please confirm ?
> > > >
> > > > Spoke to @Antonio, he confirmed that to notify engine reset
> > > > failure guc is reporting physical instance to host.
> > > >
> > > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > >
> > > I don't believe this is what we want here still. At least not from
> > > the sysman perspective.
> > >
> > > After guc reset fails, we will try to reset the GT ourselves and if
> > > we succeed we don't need to request user space interference.
> > >
> > > That should only happen if we also fail our gt_reset after the
> > > guc_reset failed.
> > >
> > > That would be the similar point on when i915 gets wedged?
> > > We probably also need the wedge point here before we can issue this
> > > notification?
> >
> > Hi Rodrigo,
> > You are right, In case of engine reset failure the driver tries to do
> > the  gt reset and if gt reset fails there are two notifications one
> > for engine failure and another for gt reset failure. The changes to sen=
d
> uevent in case of gt failure are added in xe_uevent_gt_reset_failure.
> >
> > Level0 UMD does sends the RESET_REQUIRED uevent in case of only gt
> reset failure.
> > Engine reset failure notification is not used for this purpose, it is t=
o provide
> information that engine reset was required and it failed.
>=20
> isn't a debug msg enough for this case then?
> if the api is not used we should not add it.

Sure. Will go ahead with only gt reset notification in that case.
Will update in next patch.

BR
Himal

>=20
> >
> > >
> > > Anyway, we also need IGT for the uevent itself.
> > The IGT for uevent listener will be helpful only if we can inject error=
s in
> such a way that they lead to engine/gt reset failure.
> > I am unable to find a mechanism to do so. Can you provide some input on
> the same ?
> > BR
> > Himal
> > >
> > > Thanks,
> > > Rodrigo.
> > >
> > > >
> > > > Regards,
> > > > Badal
> > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Badal
> > > > > > > +	if (hwe)
> > > > > > > +		xe_uevent_engine_reset_failure(xe, hwe->name);
> > > > > > > +
> > > > > > >    	xe_gt_reset_async(guc_to_gt(guc));
> > > > > > >
> > > > > > >    	return 0;
> > > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > > b/include/uapi/drm/xe_drm.h index
> b0b80aae3ee8..79ef5947c172
> > > > > > > 100644
> > > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > > @@ -36,6 +36,14 @@ extern "C" {
> > > > > > >     * subject to backwards-compatibility constraints.
> > > > > > >     */
> > > > > > >
> > > > > > > +/*
> > > > > > > + * Uevents generated by xe on it's device node.
> > > > > > > + *
> > > > > > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt
> > > > > > > +to reset
> > > > > > engine
> > > > > > > + *	or gt fails. The value supplied with the event is always =
1.
> > > > > > > + */
> > > > > > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > > > > > +
> > > > > > >    /**
> > > > > > >     * struct xe_user_extension - Base class for defining a
> > > > > > > chain of
> > > extensions
> > > > > > >     *
