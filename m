Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B955C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C8F10EA53;
	Fri, 15 Dec 2023 16:54:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD410EA4D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702659281; x=1734195281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scCfNYcfQUA9IDl/lEtsLfxoSet2wr5T0Bxm3xUn3Ls=;
 b=dvYyWrMQo13AtJlDKpvqVIJkWHATRy/bNoXifZRgokueeTwsr2UXX3Ca
 Ky2r9g3emiAJN0LjczpHIPczBi85sYfTnsvmZoltZ8/Xa0uL6vcIlqidH
 IvVM3wH/PZpyoZ5cmif6cJBLdXvK2e0WMwjeLjfpKd60Tdiv8zfhgiX1y
 lnBAP3NTe5xf2quCWUuGyKPtbSBjxzR/IvPTThhXHZApa97fjq0ZCl14k
 QGIKbqG+V7CXlaGqP9Sd+ly5EPFqv3OeNbAm3pR1LKhN1OUhqg1HCZjuO
 G40wcdcNKbMrEyKuOGNSLYMijeHxKW9AlHNBcwq1kfKjN0DBkctOZ9IAb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459621884"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459621884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="898202562"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="898202562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:54:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:54:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:54:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:54:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/H7Tw7r+V7nhYXj0aXiMQrZDg28UP7rBg56pzvMe0HFXT+gkVb+Ne8ZmggIZTcl5OEevAe/wLmvm54yCMwerethlLlQafSfp7bnDP+iJq9mJvWi6CzkJGs5MuoGGILRz15NHSdT/yq1ze4CfhVcv1zqhdi7+hvUqXxW2dyipIYi51CmtggjuwKtyKD6POK4OqMle2Hfxo4ci9+RhUsdHBoCcyyjFkLxYVh4tVgBUE/TMi+x88a76M7LTtck1Ho74ZVJZd+bHIXWn1yYYh61PqAMONGu4dfwhSadigBJg5ZllYyBz0IUyydrbgHUV/zBXbNFPPk6hOyP0XSR14E8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQMYgDlzYcELJSuVJ6x/UDJcCLpXcFxkJxuag9TSkKM=;
 b=bVNx6qrkveO0kfCTQ27hD8iQ6NEeOHzSws1F82Omvxd2FY5plQEp9CxC+x3Ry6r6owH6Z8F3IwtxjpJlckUQjKgmvdBbraOSZq7yVB5UzeXfYzVjIhn+FsF3my8+45wVn4kXnkbu0dDYkzbEqGYexgGUIbyyP8RhjA1ehSzcqxwVVvKS5xQdboIJtScGC1ftTPbfpn7QavujlKzdyOxYdINXqjwEWWbHYpWWTSESqmOaTGZu9jg9O5SS+46dHs48F2JRVpL19dgVkGKdkFNoij3e9LS6hn0hUJ+2Yl9lv37/FIat8eO7/Orz8YTdyfnL2YPr5FxVRD6yd2ABCsXyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 16:54:38 +0000
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::a418:4b7b:4567:eba9]) by SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::a418:4b7b:4567:eba9%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 16:54:38 +0000
From: "Kershner, David" <david.kershner@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>
Subject: RE: [PATCH v3 0/3] Add support for XeLink device
Thread-Topic: [PATCH v3 0/3] Add support for XeLink device
Thread-Index: AQHaLg24PuK8s9R4iU25bEixTKylHrCqb/eAgAAd7QCAAASD4A==
Date: Fri, 15 Dec 2023 16:54:37 +0000
Message-ID: <SJ0PR11MB586620AB249C11AF8C889EDF8193A@SJ0PR11MB5866.namprd11.prod.outlook.com>
References: <20231213214525.2584729-1-david.kershner@intel.com>
 <IA1PR11MB6418A9FFC88A65541BE9004AC193A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <4xjueszswl6yixxcmhigz6hefx4vht3c4s64t4spihih7onpnh@7hywjhl6z5fs>
In-Reply-To: <4xjueszswl6yixxcmhigz6hefx4vht3c4s64t4spihih7onpnh@7hywjhl6z5fs>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5866:EE_|BL1PR11MB5237:EE_
x-ms-office365-filtering-correlation-id: f11b056e-85ac-4866-9bff-08dbfd8e8617
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sq5xtUwC7zM67i8MiBBH3VfRdhDWQhuSCl4mE666uFprFgh8U0u3zNW9fvz/4Rpgny6A4G3SXzW/MdzlZl5T4ZxLBEk1l318sKVMAUP0BHU4btSuBXHMMrztJifnN7DRwEtE1UNM8DM5kmFJma2wjb64WL6UJQfR8REt/lnStwxlY97BiXG3qpvLS1r3a/ZFlyDI9dKrqLu5zf36ws/ANT0PYG340vrOS4UKApr7sSL0g1QxhSTOL6BZtuBU7FUbNceyV0IYsjxUj+0J948XyM+9+eUG2lr163kXMxLoaj8DQ+jlsriaeKWu0fslVLXM4DgtA8PYJhxJaKrlC6p6EDjXf8aFPol0EFjhBtwLbFheK3GfEa8we5/0yif3viXB3KFX+yfc8gbP8WXfgmSJ0/MLBoeQH/6aD0poOydSlFOYD0OzmyRpQNxZAiHMSCmVRUqns+WtmNkhRFeEdM3vNhDo4rbJ32zaQVAU9ZrsxQx46XiPkoHzW81R2OV/dCR4gVpqCNgh6u2prNa9CCxeTYua04wiZHtrQNmqBLVkRsvgMfD8gSKrI2NQ/vAWM7Jt9+dN1VY9z/kGBJlHCDwAPspimo/ZoCljHosFu66mu4+UmzSl4Pffr4DQ19XoXmr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5866.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(6029001)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(122000001)(38100700002)(107886003)(83380400001)(26005)(71200400001)(33656002)(55016003)(86362001)(38070700009)(82960400001)(53546011)(6506007)(9686003)(7696005)(478600001)(316002)(6636002)(110136005)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(2906002)(8936002)(4326008)(52536014)(8676002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v/ivX4LHxgeZOPkT/sOEaoW3qKF7o1NaLHxrUErsN2kf9Yi/Agm3oDshr0zF?=
 =?us-ascii?Q?vtVbvjyR86LSoG61ZnTFmUyD8F37CLIBHrJnaxxWTFngelC1zW/932rOjJgy?=
 =?us-ascii?Q?K5n3lxoJuj911oW37+rKRF1x/r1mFGt8V7PbvJ70MJ2+vgsQKOVtJ6SafpcM?=
 =?us-ascii?Q?MjP+OVSjOreD5CpIBUhx/4+G/X0MsK480l7+tVfrWT0YAmtGhUBhDlS75g9n?=
 =?us-ascii?Q?8bxxBf0KiBpPjy7twMTDcW9WojySXizcf2jXxuTulH0ndK5T2ZgXqJnm4qsE?=
 =?us-ascii?Q?nWzUCkSp2gIKDURR+Eq4eIEQHM/km0wWX8UvRLMEHDaapnFE2pT6PHA+yoRO?=
 =?us-ascii?Q?yPtZT5sH1x+9pazgWYJGqVXlABcTTw2SQvwwdu2tf2MXyLrrMHLC3pmkFZc2?=
 =?us-ascii?Q?6x9IH7pcprGZGBpc3sVAbLdCCaQtAVF9VnSOm+Dzdf6vJF/m4iaan9ijOfIS?=
 =?us-ascii?Q?NZaxni5RMKcjBhKWab8JRx6/Dp6feYHyQMs10FSADiPs0AtU2/kjEhrDJ/sq?=
 =?us-ascii?Q?tOg7gNXywXkCpIUY4plWBux26lnpweByEE+4cVewQrXW+dwF58OBsf940Rtt?=
 =?us-ascii?Q?Y/qi4XuwCZB5ynnpo+AIvyp3ligJwLTLiaVbflPoJ8YbYgq/vEWniAxbw4Nc?=
 =?us-ascii?Q?Ee9lGFI7XmC5qbDVRc5ksVkzfHMatoafS0OZ/jWkQLDI4IkvL9ggqSpnkGPY?=
 =?us-ascii?Q?BwJ6cvH6t126l+QvBIpnfxCre63iEiknkTwu589wCkTEnicmICP8iERMzPWb?=
 =?us-ascii?Q?PP9wjnfqQahqFHCxuoV/DPgTx4JU26nGJNnntp75/YsHajB0zgHFClnOVqDn?=
 =?us-ascii?Q?yjpMxTATb6MZwZWG/TEYTD6WwqjbW9r1SBul5k4/PnzidzDMjRhpYQD9ekX2?=
 =?us-ascii?Q?1tKjvUlwWzdw37OcxtpIt9Th1Xbj4idmO5PyIjkDn053zkyY5kqn71NAW/Sb?=
 =?us-ascii?Q?EKwh+sk6DnAP1rc+HimgSYEQVmJ52bXEox4R402ZmsekKOlBhVEvclk6rD0G?=
 =?us-ascii?Q?EIkay8QPRtK6Q3OUKCFgx+zo9e+CErOWUQXZv7moY0uShhMEEZ7jP0QendM1?=
 =?us-ascii?Q?m91qalNfhFIsMH23ajN1wKerIFq7yuehsQVGz+eAapprYvy7Q9449zuZObzg?=
 =?us-ascii?Q?C+CaRFBpnMLD4INrg9L0sx3RAL9GQFpGWEIwTrkOIytVkpM8LfWm1UZxTM9I?=
 =?us-ascii?Q?rszzgX5AhjNi4kjDQSxD18X87b4FDdE+AroocxunXpd2j66jUzjrfe8rRpqj?=
 =?us-ascii?Q?OK/0ph4aN19JwEqFcS6zj6pkN8+UaeOLO3rv/Di/g06VCHBBO0YffRwEb3VB?=
 =?us-ascii?Q?mnVj7cKEx6eERI/ymSqLdmhWymp6ZHtvNVlYfFjXhz9DRF3LohDWI1wfCJ3X?=
 =?us-ascii?Q?JoCYxL0k7DnimcES4Hs8zqAiH6WQmWlbqqSyqEaKnYh1AfpDTUSqNned5hMl?=
 =?us-ascii?Q?64+mtBFER56cjwTpQKtpExE+ftaJrWuWBEdj/pBcCoHOukN9Rl9od4wwGAWQ?=
 =?us-ascii?Q?J1jAfXBlOOw1GkzMcZrJ+JGDmCAMir2o9uUpKU8mPa2Dc9ADlPTKyShC7mvz?=
 =?us-ascii?Q?WqmDi9WoRnvhWqL9UDPXbGWbw0tW0lCHpAdoDe1w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5866.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11b056e-85ac-4866-9bff-08dbfd8e8617
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 16:54:37.9777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYW3lQLC6CRm9mFl3yTvevVvlDxT7iSDXzE6INQDYz0Dt96MZ2+uW1itz9YTI7IIu+TJc6dB6cv82kpDDEKOCEyjFEkTPQ1uQmbcel7Qoo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
X-OriginatorOrg: intel.com
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck, 
 John" <john.fleck@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, December 15, 2023 11:38 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: Kershner, David <david.kershner@intel.com>; intel-
> xe@lists.freedesktop.org; Fleck, John <john.fleck@intel.com>; Vivi, Rodri=
go
> <rodrigo.vivi@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: Re: [PATCH v3 0/3] Add support for XeLink device
>=20
> On Fri, Dec 15, 2023 at 02:50:25PM +0000, Ruhl, Michael J wrote:
> >>-----Original Message-----
> >>From: Kershner, David <david.kershner@intel.com>
> >>Sent: Wednesday, December 13, 2023 4:45 PM
> >>To: Kershner, David <david.kershner@intel.com>; intel-
> >>xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>;
> >>Fleck, John <john.fleck@intel.com>; De Marchi, Lucas
> >><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> >>Roper, Matthew D <matthew.d.roper@intel.com>
> >>Subject: [PATCH v3 0/3] Add support for XeLink device
> >>
> >>First patch set introduce the needed Xe infrastructure to support
> >>XeLink device.
> >>
> >>The XeLink device is a glue-less module attached to a GPU device that
> >>provides connectivity between different GPUs on the same system.
> >>
> >>The XeLink is part of the GPU (the register space is part of the GPU
> >>PCIe BAR), so it cannot be a completely separate device driver.
> >>
> >>The Linux kernel provides an interface for handling this type of
> >>device, the Auxiliary Bus API.
> >>
> >>The Xe and XeLink will use the auxiliary bus to enable the XeLink and
> >>the Xe to probe and communicate.
> >>
> >>A followup series will include the XeLink driver code to provide full
> >>functionality for the device.
> >>
> >>Changes from version 1:
> >>	- Fix kernel-doc error
> >>Changes from version 2:
> >>	- Fix up rebase conflicts
> >
> >For the series:
> >
> >Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>=20
> Hold on on merging this as it touches the uapi and we are in the final ph=
ase of
> uapi cleanup for upstream submission. We don't want last minute additions
> there.

Will do, do we know the time limit for uapi merge completed?

David Kershner

>=20
> Lucas De Marchi
